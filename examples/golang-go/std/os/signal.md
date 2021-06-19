# Package signal

Package signal implements access to incoming signals. 

Signals are primarily used on Unix-like systems. For the use of this package on Windows and Plan 9, see below. 

### hdr-Types_of_signalsTypes of signals
The signals SIGKILL and SIGSTOP may not be caught by a program, and therefore cannot be affected by this package. 

Synchronous signals are signals triggered by errors in program execution: SIGBUS, SIGFPE, and SIGSEGV. These are only considered synchronous when caused by program execution, not when sent using os.Process.Kill or the kill program or some similar mechanism. In general, except as discussed below, Go programs will convert a synchronous signal into a run-time panic. 

The remaining signals are asynchronous signals. They are not triggered by program errors, but are instead sent from the kernel or from some other program. 

Of the asynchronous signals, the SIGHUP signal is sent when a program loses its controlling terminal. The SIGINT signal is sent when the user at the controlling terminal presses the interrupt character, which by default is ^C (Control-C). The SIGQUIT signal is sent when the user at the controlling terminal presses the quit character, which by default is ^\ (Control-Backslash). In general you can cause a program to simply exit by pressing ^C, and you can cause it to exit with a stack dump by pressing ^\. 

### hdr-Default_behavior_of_signals_in_Go_programsDefault behavior of signals in Go programs
By default, a synchronous signal is converted into a run-time panic. A SIGHUP, SIGINT, or SIGTERM signal causes the program to exit. A SIGQUIT, SIGILL, SIGTRAP, SIGABRT, SIGSTKFLT, SIGEMT, or SIGSYS signal causes the program to exit with a stack dump. A SIGTSTP, SIGTTIN, or SIGTTOU signal gets the system default behavior (these signals are used by the shell for job control). The SIGPROF signal is handled directly by the Go runtime to implement runtime.CPUProfile. Other signals will be caught but no action will be taken. 

If the Go program is started with either SIGHUP or SIGINT ignored (signal handler set to SIG_IGN), they will remain ignored. 

If the Go program is started with a non-empty signal mask, that will generally be honored. However, some signals are explicitly unblocked: the synchronous signals, SIGILL, SIGTRAP, SIGSTKFLT, SIGCHLD, SIGPROF, and, on Linux, signals 32 (SIGCANCEL) and 33 (SIGSETXID) (SIGCANCEL and SIGSETXID are used internally by glibc). Subprocesses started by os.Exec, or by the os/exec package, will inherit the modified signal mask. 

### hdr-Changing_the_behavior_of_signals_in_Go_programsChanging the behavior of signals in Go programs
The functions in this package allow a program to change the way Go programs handle signals. 

Notify disables the default behavior for a given set of asynchronous signals and instead delivers them over one or more registered channels. Specifically, it applies to the signals SIGHUP, SIGINT, SIGQUIT, SIGABRT, and SIGTERM. It also applies to the job control signals SIGTSTP, SIGTTIN, and SIGTTOU, in which case the system default behavior does not occur. It also applies to some signals that otherwise cause no action: SIGUSR1, SIGUSR2, SIGPIPE, SIGALRM, SIGCHLD, SIGCONT, SIGURG, SIGXCPU, SIGXFSZ, SIGVTALRM, SIGWINCH, SIGIO, SIGPWR, SIGSYS, SIGINFO, SIGTHR, SIGWAITING, SIGLWP, SIGFREEZE, SIGTHAW, SIGLOST, SIGXRES, SIGJVM1, SIGJVM2, and any real time signals used on the system. Note that not all of these signals are available on all systems. 

If the program was started with SIGHUP or SIGINT ignored, and Notify is called for either signal, a signal handler will be installed for that signal and it will no longer be ignored. If, later, Reset or Ignore is called for that signal, or Stop is called on all channels passed to Notify for that signal, the signal will once again be ignored. Reset will restore the system default behavior for the signal, while Ignore will cause the system to ignore the signal entirely. 

If the program is started with a non-empty signal mask, some signals will be explicitly unblocked as described above. If Notify is called for a blocked signal, it will be unblocked. If, later, Reset is called for that signal, or Stop is called on all channels passed to Notify for that signal, the signal will once again be blocked. 

### hdr-SIGPIPESIGPIPE
When a Go program writes to a broken pipe, the kernel will raise a SIGPIPE signal. 

If the program has not called Notify to receive SIGPIPE signals, then the behavior depends on the file descriptor number. A write to a broken pipe on file descriptors 1 or 2 (standard output or standard error) will cause the program to exit with a SIGPIPE signal. A write to a broken pipe on some other file descriptor will take no action on the SIGPIPE signal, and the write will fail with an EPIPE error. 

If the program has called Notify to receive SIGPIPE signals, the file descriptor number does not matter. The SIGPIPE signal will be delivered to the Notify channel, and the write will fail with an EPIPE error. 

This means that, by default, command line programs will behave like typical Unix command line programs, while other programs will not crash with SIGPIPE when writing to a closed network connection. 

### hdr-Go_programs_that_use_cgo_or_SWIGGo programs that use cgo or SWIG
In a Go program that includes non-Go code, typically C/C++ code accessed using cgo or SWIG, Go's startup code normally runs first. It configures the signal handlers as expected by the Go runtime, before the non-Go startup code runs. If the non-Go startup code wishes to install its own signal handlers, it must take certain steps to keep Go working well. This section documents those steps and the overall effect changes to signal handler settings by the non-Go code can have on Go programs. In rare cases, the non-Go code may run before the Go code, in which case the next section also applies. 

If the non-Go code called by the Go program does not change any signal handlers or masks, then the behavior is the same as for a pure Go program. 

If the non-Go code installs any signal handlers, it must use the SA_ONSTACK flag with sigaction. Failing to do so is likely to cause the program to crash if the signal is received. Go programs routinely run with a limited stack, and therefore set up an alternate signal stack. 

If the non-Go code installs a signal handler for any of the synchronous signals (SIGBUS, SIGFPE, SIGSEGV), then it should record the existing Go signal handler. If those signals occur while executing Go code, it should invoke the Go signal handler (whether the signal occurs while executing Go code can be determined by looking at the PC passed to the signal handler). Otherwise some Go run-time panics will not occur as expected. 

If the non-Go code installs a signal handler for any of the asynchronous signals, it may invoke the Go signal handler or not as it chooses. Naturally, if it does not invoke the Go signal handler, the Go behavior described above will not occur. This can be an issue with the SIGPROF signal in particular. 

The non-Go code should not change the signal mask on any threads created by the Go runtime. If the non-Go code starts new threads of its own, it may set the signal mask as it pleases. 

If the non-Go code starts a new thread, changes the signal mask, and then invokes a Go function in that thread, the Go runtime will automatically unblock certain signals: the synchronous signals, SIGILL, SIGTRAP, SIGSTKFLT, SIGCHLD, SIGPROF, SIGCANCEL, and SIGSETXID. When the Go function returns, the non-Go signal mask will be restored. 

If the Go signal handler is invoked on a non-Go thread not running Go code, the handler generally forwards the signal to the non-Go code, as follows. If the signal is SIGPROF, the Go handler does nothing. Otherwise, the Go handler removes itself, unblocks the signal, and raises it again, to invoke any non-Go handler or default system handler. If the program does not exit, the Go handler then reinstalls itself and continues execution of the program. 

### hdr-Non_Go_programs_that_call_Go_codeNon-Go programs that call Go code
When Go code is built with options like -buildmode=c-shared, it will be run as part of an existing non-Go program. The non-Go code may have already installed signal handlers when the Go code starts (that may also happen in unusual cases when using cgo or SWIG; in that case, the discussion here applies).  For -buildmode=c-archive the Go runtime will initialize signals at global constructor time.  For -buildmode=c-shared the Go runtime will initialize signals when the shared library is loaded. 

If the Go runtime sees an existing signal handler for the SIGCANCEL or SIGSETXID signals (which are used only on Linux), it will turn on the SA_ONSTACK flag and otherwise keep the signal handler. 

For the synchronous signals and SIGPIPE, the Go runtime will install a signal handler. It will save any existing signal handler. If a synchronous signal arrives while executing non-Go code, the Go runtime will invoke the existing signal handler instead of the Go signal handler. 

Go code built with -buildmode=c-archive or -buildmode=c-shared will not install any other signal handlers by default. If there is an existing signal handler, the Go runtime will turn on the SA_ONSTACK flag and otherwise keep the signal handler. If Notify is called for an asynchronous signal, a Go signal handler will be installed for that signal. If, later, Reset is called for that signal, the original handling for that signal will be reinstalled, restoring the non-Go signal handler if any. 

Go code built without -buildmode=c-archive or -buildmode=c-shared will install a signal handler for the asynchronous signals listed above, and save any existing signal handler. If a signal is delivered to a non-Go thread, it will act as described above, except that if there is an existing non-Go signal handler, that handler will be installed before raising the signal. 

### hdr-WindowsWindows
On Windows a ^C (Control-C) or ^BREAK (Control-Break) normally cause the program to exit. If Notify is called for os.Interrupt, ^C or ^BREAK will cause os.Interrupt to be sent on the channel, and the program will not exit. If Reset is called, or Stop is called on all channels passed to Notify, then the default behavior will be restored. 

Additionally, if Notify is called, and Windows sends CTRL_CLOSE_EVENT, CTRL_LOGOFF_EVENT or CTRL_SHUTDOWN_EVENT to the process, Notify will return syscall.SIGTERM. Unlike Control-C and Control-Break, Notify does not change process behavior when either CTRL_CLOSE_EVENT, CTRL_LOGOFF_EVENT or CTRL_SHUTDOWN_EVENT is received - the process will still get terminated unless it exits. But receiving syscall.SIGTERM will give the process an opportunity to clean up before termination. 

### hdr-Plan_9Plan 9
On Plan 9, signals have type syscall.Note, which is a string. Calling Notify with a syscall.Note will cause that value to be sent on the channel when that string is posted as a note. 

## Index

* Subpages
  * [std/os/signal/internal](signal/internal.md)
* [Constants](#const)
    * [const numSig](#numSig)
* [Variables](#var)
    * [var handlers](#handlers)
    * [var watchSignalLoopOnce](#watchSignalLoopOnce)
    * [var watchSignalLoop](#watchSignalLoop)
    * [var settleTime](#settleTime)
    * [var checkSighupIgnored](#checkSighupIgnored)
    * [var sendUncaughtSighup](#sendUncaughtSighup)
    * [var dieFromSighup](#dieFromSighup)
    * [var checkNotifyContext](#checkNotifyContext)
    * [var ctxNotifyTimes](#ctxNotifyTimes)
* [Types](#type)
    * [type stopping struct](#stopping)
    * [type handler struct](#handler)
        * [func (h *handler) want(sig int) bool](#handler.want)
        * [func (h *handler) set(sig int)](#handler.set)
        * [func (h *handler) clear(sig int)](#handler.clear)
    * [type signalCtx struct](#signalCtx)
        * [func (c *signalCtx) stop()](#signalCtx.stop)
        * [func (c *signalCtx) String() string](#signalCtx.String)
    * [type stringer interface](#stringer)
* [Functions](#func)
    * [func cancel(sigs []os.Signal, action func(int))](#cancel)
    * [func Ignore(sig ...os.Signal)](#Ignore)
    * [func Ignored(sig os.Signal) bool](#Ignored)
    * [func Notify(c chan<- os.Signal, sig ...os.Signal)](#Notify)
    * [func Reset(sig ...os.Signal)](#Reset)
    * [func Stop(c chan<- os.Signal)](#Stop)
    * [func signalWaitUntilIdle()](#signalWaitUntilIdle)
    * [func process(sig os.Signal)](#process)
    * [func NotifyContext(parent context.Context, signals ...os.Signal) (ctx context.Context, stop context.CancelFunc)](#NotifyContext)
    * [func signal_disable(uint32)](#signal_disable)
    * [func signal_enable(uint32)](#signal_enable)
    * [func signal_ignore(uint32)](#signal_ignore)
    * [func signal_ignored(uint32) bool](#signal_ignored)
    * [func signal_recv() uint32](#signal_recv)
    * [func loop()](#loop)
    * [func init()](#init)
    * [func signum(sig os.Signal) int](#signum)
    * [func enableSignal(sig int)](#enableSignal)
    * [func disableSignal(sig int)](#disableSignal)
    * [func ignoreSignal(sig int)](#ignoreSignal)
    * [func signalIgnored(sig int) bool](#signalIgnored)
    * [func init()](#init)
    * [func waitSig(t *testing.T, c <-chan os.Signal, sig os.Signal)](#waitSig)
    * [func waitSigAll(t *testing.T, c <-chan os.Signal, sig os.Signal)](#waitSigAll)
    * [func waitSig1(t *testing.T, c <-chan os.Signal, sig os.Signal, all bool)](#waitSig1)
    * [func quiesce()](#quiesce)
    * [func TestSignal(t *testing.T)](#TestSignal)
    * [func TestStress(t *testing.T)](#TestStress)
    * [func testCancel(t *testing.T, ignore bool)](#testCancel)
    * [func TestReset(t *testing.T)](#TestReset)
    * [func TestIgnore(t *testing.T)](#TestIgnore)
    * [func TestIgnored(t *testing.T)](#TestIgnored)
    * [func TestDetectNohup(t *testing.T)](#TestDetectNohup)
    * [func TestStop(t *testing.T)](#TestStop)
    * [func TestNohup(t *testing.T)](#TestNohup)
    * [func TestSIGCONT(t *testing.T)](#TestSIGCONT)
    * [func TestAtomicStop(t *testing.T)](#TestAtomicStop)
    * [func atomicStopTestProgram(t *testing.T)](#atomicStopTestProgram)
    * [func TestTime(t *testing.T)](#TestTime)
    * [func TestNotifyContextNotifications(t *testing.T)](#TestNotifyContextNotifications)
    * [func TestNotifyContextStop(t *testing.T)](#TestNotifyContextStop)
    * [func TestNotifyContextCancelParent(t *testing.T)](#TestNotifyContextCancelParent)
    * [func TestNotifyContextPrematureCancelParent(t *testing.T)](#TestNotifyContextPrematureCancelParent)
    * [func TestNotifyContextSimultaneousStop(t *testing.T)](#TestNotifyContextSimultaneousStop)
    * [func TestNotifyContextStringer(t *testing.T)](#TestNotifyContextStringer)
    * [func TestSignalTrace(t *testing.T)](#TestSignalTrace)


## <a id="const" href="#const">Constants</a>

```
tags: [exported]
```

### <a id="numSig" href="#numSig">const numSig</a>

```
searchKey: signal.numSig
```

```Go
const numSig = 65 // max across all systems

```

## <a id="var" href="#var">Variables</a>

```
tags: [exported]
```

### <a id="handlers" href="#handlers">var handlers</a>

```
searchKey: signal.handlers
```

```Go
var handlers struct {
	sync.Mutex
	// Map a channel to the signals that should be sent to it.
	m map[chan<- os.Signal]*handler
	// Map a signal to the number of channels receiving it.
	ref [numSig]int64
	// Map channels to signals while the channel is being stopped.
	// Not a map because entries live here only very briefly.
	// We need a separate container because we need m to correspond to ref
	// at all times, and we also need to keep track of the *handler
	// value for a channel being stopped. See the Stop function.
	stopping []stopping
} = ...
```

### <a id="watchSignalLoopOnce" href="#watchSignalLoopOnce">var watchSignalLoopOnce</a>

```
searchKey: signal.watchSignalLoopOnce
```

```Go
var watchSignalLoopOnce sync.Once
```

watchSignalLoopOnce guards calling the conditionally initialized watchSignalLoop. If watchSignalLoop is non-nil, it will be run in a goroutine lazily once Notify is invoked. See Issue 21576. 

### <a id="watchSignalLoop" href="#watchSignalLoop">var watchSignalLoop</a>

```
searchKey: signal.watchSignalLoop
```

```Go
var watchSignalLoop func()
```

### <a id="settleTime" href="#settleTime">var settleTime</a>

```
searchKey: signal.settleTime
```

```Go
var settleTime = 100 * time.Millisecond
```

settleTime is an upper bound on how long we expect signals to take to be delivered. Lower values make the test faster, but also flakier — especially on heavily loaded systems. 

The current value is set based on flakes observed in the Go builders. 

### <a id="checkSighupIgnored" href="#checkSighupIgnored">var checkSighupIgnored</a>

```
searchKey: signal.checkSighupIgnored
```

```Go
var checkSighupIgnored = ...
```

### <a id="sendUncaughtSighup" href="#sendUncaughtSighup">var sendUncaughtSighup</a>

```
searchKey: signal.sendUncaughtSighup
```

```Go
var sendUncaughtSighup = flag.Int("send_uncaught_sighup", 0, "send uncaught SIGHUP during TestStop")
```

### <a id="dieFromSighup" href="#dieFromSighup">var dieFromSighup</a>

```
searchKey: signal.dieFromSighup
```

```Go
var dieFromSighup = flag.Bool("die_from_sighup", false, "wait to die from uncaught SIGHUP")
```

### <a id="checkNotifyContext" href="#checkNotifyContext">var checkNotifyContext</a>

```
searchKey: signal.checkNotifyContext
```

```Go
var checkNotifyContext = ...
```

### <a id="ctxNotifyTimes" href="#ctxNotifyTimes">var ctxNotifyTimes</a>

```
searchKey: signal.ctxNotifyTimes
```

```Go
var ctxNotifyTimes = ...
```

## <a id="type" href="#type">Types</a>

```
tags: [exported]
```

### <a id="stopping" href="#stopping">type stopping struct</a>

```
searchKey: signal.stopping
```

```Go
type stopping struct {
	c chan<- os.Signal
	h *handler
}
```

### <a id="handler" href="#handler">type handler struct</a>

```
searchKey: signal.handler
```

```Go
type handler struct {
	mask [(numSig + 31) / 32]uint32
}
```

#### <a id="handler.want" href="#handler.want">func (h *handler) want(sig int) bool</a>

```
searchKey: signal.handler.want
```

```Go
func (h *handler) want(sig int) bool
```

#### <a id="handler.set" href="#handler.set">func (h *handler) set(sig int)</a>

```
searchKey: signal.handler.set
```

```Go
func (h *handler) set(sig int)
```

#### <a id="handler.clear" href="#handler.clear">func (h *handler) clear(sig int)</a>

```
searchKey: signal.handler.clear
```

```Go
func (h *handler) clear(sig int)
```

### <a id="signalCtx" href="#signalCtx">type signalCtx struct</a>

```
searchKey: signal.signalCtx
```

```Go
type signalCtx struct {
	context.Context

	cancel  context.CancelFunc
	signals []os.Signal
	ch      chan os.Signal
}
```

#### <a id="signalCtx.stop" href="#signalCtx.stop">func (c *signalCtx) stop()</a>

```
searchKey: signal.signalCtx.stop
```

```Go
func (c *signalCtx) stop()
```

#### <a id="signalCtx.String" href="#signalCtx.String">func (c *signalCtx) String() string</a>

```
searchKey: signal.signalCtx.String
```

```Go
func (c *signalCtx) String() string
```

### <a id="stringer" href="#stringer">type stringer interface</a>

```
searchKey: signal.stringer
```

```Go
type stringer interface {
	String() string
}
```

## <a id="func" href="#func">Functions</a>

```
tags: [exported]
```

### <a id="cancel" href="#cancel">func cancel(sigs []os.Signal, action func(int))</a>

```
searchKey: signal.cancel
```

```Go
func cancel(sigs []os.Signal, action func(int))
```

Stop relaying the signals, sigs, to any channels previously registered to receive them and either reset the signal handlers to their original values (action=disableSignal) or ignore the signals (action=ignoreSignal). 

### <a id="Ignore" href="#Ignore">func Ignore(sig ...os.Signal)</a>

```
searchKey: signal.Ignore
tags: [exported]
```

```Go
func Ignore(sig ...os.Signal)
```

Ignore causes the provided signals to be ignored. If they are received by the program, nothing will happen. Ignore undoes the effect of any prior calls to Notify for the provided signals. If no signals are provided, all incoming signals will be ignored. 

### <a id="Ignored" href="#Ignored">func Ignored(sig os.Signal) bool</a>

```
searchKey: signal.Ignored
tags: [exported]
```

```Go
func Ignored(sig os.Signal) bool
```

Ignored reports whether sig is currently ignored. 

### <a id="Notify" href="#Notify">func Notify(c chan<- os.Signal, sig ...os.Signal)</a>

```
searchKey: signal.Notify
tags: [exported]
```

```Go
func Notify(c chan<- os.Signal, sig ...os.Signal)
```

Notify causes package signal to relay incoming signals to c. If no signals are provided, all incoming signals will be relayed to c. Otherwise, just the provided signals will. 

Package signal will not block sending to c: the caller must ensure that c has sufficient buffer space to keep up with the expected signal rate. For a channel used for notification of just one signal value, a buffer of size 1 is sufficient. 

It is allowed to call Notify multiple times with the same channel: each call expands the set of signals sent to that channel. The only way to remove signals from the set is to call Stop. 

It is allowed to call Notify multiple times with different channels and the same signals: each channel receives copies of incoming signals independently. 

### <a id="Reset" href="#Reset">func Reset(sig ...os.Signal)</a>

```
searchKey: signal.Reset
tags: [exported]
```

```Go
func Reset(sig ...os.Signal)
```

Reset undoes the effect of any prior calls to Notify for the provided signals. If no signals are provided, all signal handlers will be reset. 

### <a id="Stop" href="#Stop">func Stop(c chan<- os.Signal)</a>

```
searchKey: signal.Stop
tags: [exported]
```

```Go
func Stop(c chan<- os.Signal)
```

Stop causes package signal to stop relaying incoming signals to c. It undoes the effect of all prior calls to Notify using c. When Stop returns, it is guaranteed that c will receive no more signals. 

### <a id="signalWaitUntilIdle" href="#signalWaitUntilIdle">func signalWaitUntilIdle()</a>

```
searchKey: signal.signalWaitUntilIdle
```

```Go
func signalWaitUntilIdle()
```

Wait until there are no more signals waiting to be delivered. Defined by the runtime package. 

### <a id="process" href="#process">func process(sig os.Signal)</a>

```
searchKey: signal.process
```

```Go
func process(sig os.Signal)
```

### <a id="NotifyContext" href="#NotifyContext">func NotifyContext(parent context.Context, signals ...os.Signal) (ctx context.Context, stop context.CancelFunc)</a>

```
searchKey: signal.NotifyContext
tags: [exported]
```

```Go
func NotifyContext(parent context.Context, signals ...os.Signal) (ctx context.Context, stop context.CancelFunc)
```

NotifyContext returns a copy of the parent context that is marked done (its Done channel is closed) when one of the listed signals arrives, when the returned stop function is called, or when the parent context's Done channel is closed, whichever happens first. 

The stop function unregisters the signal behavior, which, like signal.Reset, may restore the default behavior for a given signal. For example, the default behavior of a Go program receiving os.Interrupt is to exit. Calling NotifyContext(parent, os.Interrupt) will change the behavior to cancel the returned context. Future interrupts received will not trigger the default (exit) behavior until the returned stop function is called. 

The stop function releases resources associated with it, so code should call stop as soon as the operations running in this Context complete and signals no longer need to be diverted to the context. 

### <a id="signal_disable" href="#signal_disable">func signal_disable(uint32)</a>

```
searchKey: signal.signal_disable
```

```Go
func signal_disable(uint32)
```

Defined by the runtime package. 

### <a id="signal_enable" href="#signal_enable">func signal_enable(uint32)</a>

```
searchKey: signal.signal_enable
```

```Go
func signal_enable(uint32)
```

### <a id="signal_ignore" href="#signal_ignore">func signal_ignore(uint32)</a>

```
searchKey: signal.signal_ignore
```

```Go
func signal_ignore(uint32)
```

### <a id="signal_ignored" href="#signal_ignored">func signal_ignored(uint32) bool</a>

```
searchKey: signal.signal_ignored
```

```Go
func signal_ignored(uint32) bool
```

### <a id="signal_recv" href="#signal_recv">func signal_recv() uint32</a>

```
searchKey: signal.signal_recv
```

```Go
func signal_recv() uint32
```

### <a id="loop" href="#loop">func loop()</a>

```
searchKey: signal.loop
```

```Go
func loop()
```

### <a id="init" href="#init">func init()</a>

```
searchKey: signal.init
```

```Go
func init()
```

### <a id="signum" href="#signum">func signum(sig os.Signal) int</a>

```
searchKey: signal.signum
```

```Go
func signum(sig os.Signal) int
```

### <a id="enableSignal" href="#enableSignal">func enableSignal(sig int)</a>

```
searchKey: signal.enableSignal
```

```Go
func enableSignal(sig int)
```

### <a id="disableSignal" href="#disableSignal">func disableSignal(sig int)</a>

```
searchKey: signal.disableSignal
```

```Go
func disableSignal(sig int)
```

### <a id="ignoreSignal" href="#ignoreSignal">func ignoreSignal(sig int)</a>

```
searchKey: signal.ignoreSignal
```

```Go
func ignoreSignal(sig int)
```

### <a id="signalIgnored" href="#signalIgnored">func signalIgnored(sig int) bool</a>

```
searchKey: signal.signalIgnored
```

```Go
func signalIgnored(sig int) bool
```

### <a id="init" href="#init">func init()</a>

```
searchKey: signal.init
```

```Go
func init()
```

### <a id="waitSig" href="#waitSig">func waitSig(t *testing.T, c <-chan os.Signal, sig os.Signal)</a>

```
searchKey: signal.waitSig
```

```Go
func waitSig(t *testing.T, c <-chan os.Signal, sig os.Signal)
```

### <a id="waitSigAll" href="#waitSigAll">func waitSigAll(t *testing.T, c <-chan os.Signal, sig os.Signal)</a>

```
searchKey: signal.waitSigAll
```

```Go
func waitSigAll(t *testing.T, c <-chan os.Signal, sig os.Signal)
```

### <a id="waitSig1" href="#waitSig1">func waitSig1(t *testing.T, c <-chan os.Signal, sig os.Signal, all bool)</a>

```
searchKey: signal.waitSig1
```

```Go
func waitSig1(t *testing.T, c <-chan os.Signal, sig os.Signal, all bool)
```

### <a id="quiesce" href="#quiesce">func quiesce()</a>

```
searchKey: signal.quiesce
```

```Go
func quiesce()
```

quiesce waits until we can be reasonably confident that all pending signals have been delivered by the OS. 

### <a id="TestSignal" href="#TestSignal">func TestSignal(t *testing.T)</a>

```
searchKey: signal.TestSignal
```

```Go
func TestSignal(t *testing.T)
```

Test that basic signal handling works. 

### <a id="TestStress" href="#TestStress">func TestStress(t *testing.T)</a>

```
searchKey: signal.TestStress
```

```Go
func TestStress(t *testing.T)
```

### <a id="testCancel" href="#testCancel">func testCancel(t *testing.T, ignore bool)</a>

```
searchKey: signal.testCancel
```

```Go
func testCancel(t *testing.T, ignore bool)
```

### <a id="TestReset" href="#TestReset">func TestReset(t *testing.T)</a>

```
searchKey: signal.TestReset
```

```Go
func TestReset(t *testing.T)
```

Test that Reset cancels registration for listed signals on all channels. 

### <a id="TestIgnore" href="#TestIgnore">func TestIgnore(t *testing.T)</a>

```
searchKey: signal.TestIgnore
```

```Go
func TestIgnore(t *testing.T)
```

Test that Ignore cancels registration for listed signals on all channels. 

### <a id="TestIgnored" href="#TestIgnored">func TestIgnored(t *testing.T)</a>

```
searchKey: signal.TestIgnored
```

```Go
func TestIgnored(t *testing.T)
```

Test that Ignored correctly detects changes to the ignored status of a signal. 

### <a id="TestDetectNohup" href="#TestDetectNohup">func TestDetectNohup(t *testing.T)</a>

```
searchKey: signal.TestDetectNohup
```

```Go
func TestDetectNohup(t *testing.T)
```

Test that Ignored(SIGHUP) correctly detects whether it is being run under nohup. 

### <a id="TestStop" href="#TestStop">func TestStop(t *testing.T)</a>

```
searchKey: signal.TestStop
```

```Go
func TestStop(t *testing.T)
```

Test that Stop cancels the channel's registrations. 

### <a id="TestNohup" href="#TestNohup">func TestNohup(t *testing.T)</a>

```
searchKey: signal.TestNohup
```

```Go
func TestNohup(t *testing.T)
```

Test that when run under nohup, an uncaught SIGHUP does not kill the program. 

### <a id="TestSIGCONT" href="#TestSIGCONT">func TestSIGCONT(t *testing.T)</a>

```
searchKey: signal.TestSIGCONT
```

```Go
func TestSIGCONT(t *testing.T)
```

Test that SIGCONT works (issue 8953). 

### <a id="TestAtomicStop" href="#TestAtomicStop">func TestAtomicStop(t *testing.T)</a>

```
searchKey: signal.TestAtomicStop
```

```Go
func TestAtomicStop(t *testing.T)
```

Test race between stopping and receiving a signal (issue 14571). 

### <a id="atomicStopTestProgram" href="#atomicStopTestProgram">func atomicStopTestProgram(t *testing.T)</a>

```
searchKey: signal.atomicStopTestProgram
```

```Go
func atomicStopTestProgram(t *testing.T)
```

atomicStopTestProgram is run in a subprocess by TestAtomicStop. It tries to trigger a signal delivery race. This function should either catch a signal or die from it. 

### <a id="TestTime" href="#TestTime">func TestTime(t *testing.T)</a>

```
searchKey: signal.TestTime
```

```Go
func TestTime(t *testing.T)
```

### <a id="TestNotifyContextNotifications" href="#TestNotifyContextNotifications">func TestNotifyContextNotifications(t *testing.T)</a>

```
searchKey: signal.TestNotifyContextNotifications
```

```Go
func TestNotifyContextNotifications(t *testing.T)
```

### <a id="TestNotifyContextStop" href="#TestNotifyContextStop">func TestNotifyContextStop(t *testing.T)</a>

```
searchKey: signal.TestNotifyContextStop
```

```Go
func TestNotifyContextStop(t *testing.T)
```

### <a id="TestNotifyContextCancelParent" href="#TestNotifyContextCancelParent">func TestNotifyContextCancelParent(t *testing.T)</a>

```
searchKey: signal.TestNotifyContextCancelParent
```

```Go
func TestNotifyContextCancelParent(t *testing.T)
```

### <a id="TestNotifyContextPrematureCancelParent" href="#TestNotifyContextPrematureCancelParent">func TestNotifyContextPrematureCancelParent(t *testing.T)</a>

```
searchKey: signal.TestNotifyContextPrematureCancelParent
```

```Go
func TestNotifyContextPrematureCancelParent(t *testing.T)
```

### <a id="TestNotifyContextSimultaneousStop" href="#TestNotifyContextSimultaneousStop">func TestNotifyContextSimultaneousStop(t *testing.T)</a>

```
searchKey: signal.TestNotifyContextSimultaneousStop
```

```Go
func TestNotifyContextSimultaneousStop(t *testing.T)
```

### <a id="TestNotifyContextStringer" href="#TestNotifyContextStringer">func TestNotifyContextStringer(t *testing.T)</a>

```
searchKey: signal.TestNotifyContextStringer
```

```Go
func TestNotifyContextStringer(t *testing.T)
```

### <a id="TestSignalTrace" href="#TestSignalTrace">func TestSignalTrace(t *testing.T)</a>

```
searchKey: signal.TestSignalTrace
```

```Go
func TestSignalTrace(t *testing.T)
```

#44193 test signal handling while stopping and starting the world. 

