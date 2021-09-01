# Package debug

Package debug contains facilities for programs to debug themselves while they are running. 

## Index

* [Types](#type)
    * [type BuildInfo struct](#BuildInfo)
        * [func ReadBuildInfo() (info *BuildInfo, ok bool)](#ReadBuildInfo)
        * [func readBuildInfo(data string) (*BuildInfo, bool)](#readBuildInfo)
    * [type GCStats struct](#GCStats)
    * [type Module struct](#Module)
* [Functions](#func)
    * [func FreeOSMemory()](#FreeOSMemory)
    * [func PrintStack()](#PrintStack)
    * [func ReadGCStats(stats *GCStats)](#ReadGCStats)
    * [func SetGCPercent(percent int) int](#SetGCPercent)
    * [func SetMaxStack(bytes int) int](#SetMaxStack)
    * [func SetMaxThreads(threads int) int](#SetMaxThreads)
    * [func SetPanicOnFault(enabled bool) bool](#SetPanicOnFault)
    * [func SetTraceback(level string)](#SetTraceback)
    * [func Stack() []byte](#Stack)
    * [func WriteHeapDump(fd uintptr)](#WriteHeapDump)
    * [func freeOSMemory()](#freeOSMemory)
    * [func modinfo() string](#modinfo)
    * [func readGCStats(*[]time.Duration)](#readGCStats)
    * [func setGCPercent(int32) int32](#setGCPercent)
    * [func setMaxStack(int) int](#setMaxStack)
    * [func setMaxThreads(int) int](#setMaxThreads)
    * [func setPanicOnFault(bool) bool](#setPanicOnFault)


## <a id="type" href="#type">Types</a>

### <a id="BuildInfo" href="#BuildInfo">type BuildInfo struct</a>

```
searchKey: debug.BuildInfo
tags: [struct]
```

```Go
type BuildInfo struct {
	Path string    // The main package path
	Main Module    // The module containing the main package
	Deps []*Module // Module dependencies
}
```

BuildInfo represents the build information read from the running binary. 

#### <a id="ReadBuildInfo" href="#ReadBuildInfo">func ReadBuildInfo() (info *BuildInfo, ok bool)</a>

```
searchKey: debug.ReadBuildInfo
tags: [function]
```

```Go
func ReadBuildInfo() (info *BuildInfo, ok bool)
```

ReadBuildInfo returns the build information embedded in the running binary. The information is available only in binaries built with module support. 

#### <a id="readBuildInfo" href="#readBuildInfo">func readBuildInfo(data string) (*BuildInfo, bool)</a>

```
searchKey: debug.readBuildInfo
tags: [function private]
```

```Go
func readBuildInfo(data string) (*BuildInfo, bool)
```

### <a id="GCStats" href="#GCStats">type GCStats struct</a>

```
searchKey: debug.GCStats
tags: [struct]
```

```Go
type GCStats struct {
	LastGC         time.Time       // time of last collection
	NumGC          int64           // number of garbage collections
	PauseTotal     time.Duration   // total pause for all collections
	Pause          []time.Duration // pause history, most recent first
	PauseEnd       []time.Time     // pause end times history, most recent first
	PauseQuantiles []time.Duration
}
```

GCStats collect information about recent garbage collections. 

### <a id="Module" href="#Module">type Module struct</a>

```
searchKey: debug.Module
tags: [struct]
```

```Go
type Module struct {
	Path    string  // module path
	Version string  // module version
	Sum     string  // checksum
	Replace *Module // replaced by this module
}
```

Module represents a module. 

## <a id="func" href="#func">Functions</a>

### <a id="FreeOSMemory" href="#FreeOSMemory">func FreeOSMemory()</a>

```
searchKey: debug.FreeOSMemory
tags: [function]
```

```Go
func FreeOSMemory()
```

FreeOSMemory forces a garbage collection followed by an attempt to return as much memory to the operating system as possible. (Even if this is not called, the runtime gradually returns memory to the operating system in a background task.) 

### <a id="PrintStack" href="#PrintStack">func PrintStack()</a>

```
searchKey: debug.PrintStack
tags: [function]
```

```Go
func PrintStack()
```

PrintStack prints to standard error the stack trace returned by runtime.Stack. 

### <a id="ReadGCStats" href="#ReadGCStats">func ReadGCStats(stats *GCStats)</a>

```
searchKey: debug.ReadGCStats
tags: [function]
```

```Go
func ReadGCStats(stats *GCStats)
```

ReadGCStats reads statistics about garbage collection into stats. The number of entries in the pause history is system-dependent; stats.Pause slice will be reused if large enough, reallocated otherwise. ReadGCStats may use the full capacity of the stats.Pause slice. If stats.PauseQuantiles is non-empty, ReadGCStats fills it with quantiles summarizing the distribution of pause time. For example, if len(stats.PauseQuantiles) is 5, it will be filled with the minimum, 25%, 50%, 75%, and maximum pause times. 

### <a id="SetGCPercent" href="#SetGCPercent">func SetGCPercent(percent int) int</a>

```
searchKey: debug.SetGCPercent
tags: [function]
```

```Go
func SetGCPercent(percent int) int
```

SetGCPercent sets the garbage collection target percentage: a collection is triggered when the ratio of freshly allocated data to live data remaining after the previous collection reaches this percentage. SetGCPercent returns the previous setting. The initial setting is the value of the GOGC environment variable at startup, or 100 if the variable is not set. A negative percentage disables garbage collection. 

### <a id="SetMaxStack" href="#SetMaxStack">func SetMaxStack(bytes int) int</a>

```
searchKey: debug.SetMaxStack
tags: [function]
```

```Go
func SetMaxStack(bytes int) int
```

SetMaxStack sets the maximum amount of memory that can be used by a single goroutine stack. If any goroutine exceeds this limit while growing its stack, the program crashes. SetMaxStack returns the previous setting. The initial setting is 1 GB on 64-bit systems, 250 MB on 32-bit systems. There may be a system-imposed maximum stack limit regardless of the value provided to SetMaxStack. 

SetMaxStack is useful mainly for limiting the damage done by goroutines that enter an infinite recursion. It only limits future stack growth. 

### <a id="SetMaxThreads" href="#SetMaxThreads">func SetMaxThreads(threads int) int</a>

```
searchKey: debug.SetMaxThreads
tags: [function]
```

```Go
func SetMaxThreads(threads int) int
```

SetMaxThreads sets the maximum number of operating system threads that the Go program can use. If it attempts to use more than this many, the program crashes. SetMaxThreads returns the previous setting. The initial setting is 10,000 threads. 

The limit controls the number of operating system threads, not the number of goroutines. A Go program creates a new thread only when a goroutine is ready to run but all the existing threads are blocked in system calls, cgo calls, or are locked to other goroutines due to use of runtime.LockOSThread. 

SetMaxThreads is useful mainly for limiting the damage done by programs that create an unbounded number of threads. The idea is to take down the program before it takes down the operating system. 

### <a id="SetPanicOnFault" href="#SetPanicOnFault">func SetPanicOnFault(enabled bool) bool</a>

```
searchKey: debug.SetPanicOnFault
tags: [function]
```

```Go
func SetPanicOnFault(enabled bool) bool
```

SetPanicOnFault controls the runtime's behavior when a program faults at an unexpected (non-nil) address. Such faults are typically caused by bugs such as runtime memory corruption, so the default response is to crash the program. Programs working with memory-mapped files or unsafe manipulation of memory may cause faults at non-nil addresses in less dramatic situations; SetPanicOnFault allows such programs to request that the runtime trigger only a panic, not a crash. The runtime.Error that the runtime panics with may have an additional method: 

```
Addr() uintptr

```
If that method exists, it returns the memory address which triggered the fault. The results of Addr are best-effort and the veracity of the result may depend on the platform. SetPanicOnFault applies only to the current goroutine. It returns the previous setting. 

### <a id="SetTraceback" href="#SetTraceback">func SetTraceback(level string)</a>

```
searchKey: debug.SetTraceback
tags: [function]
```

```Go
func SetTraceback(level string)
```

SetTraceback sets the amount of detail printed by the runtime in the traceback it prints before exiting due to an unrecovered panic or an internal runtime error. The level argument takes the same values as the GOTRACEBACK environment variable. For example, SetTraceback("all") ensure that the program prints all goroutines when it crashes. See the package runtime documentation for details. If SetTraceback is called with a level lower than that of the environment variable, the call is ignored. 

### <a id="Stack" href="#Stack">func Stack() []byte</a>

```
searchKey: debug.Stack
tags: [function]
```

```Go
func Stack() []byte
```

Stack returns a formatted stack trace of the goroutine that calls it. It calls runtime.Stack with a large enough buffer to capture the entire trace. 

### <a id="WriteHeapDump" href="#WriteHeapDump">func WriteHeapDump(fd uintptr)</a>

```
searchKey: debug.WriteHeapDump
tags: [function]
```

```Go
func WriteHeapDump(fd uintptr)
```

WriteHeapDump writes a description of the heap and the objects in it to the given file descriptor. 

WriteHeapDump suspends the execution of all goroutines until the heap dump is completely written.  Thus, the file descriptor must not be connected to a pipe or socket whose other end is in the same Go process; instead, use a temporary file or network socket. 

The heap dump format is defined at [https://golang.org/s/go15heapdump](https://golang.org/s/go15heapdump). 

### <a id="freeOSMemory" href="#freeOSMemory">func freeOSMemory()</a>

```
searchKey: debug.freeOSMemory
tags: [function private]
```

```Go
func freeOSMemory()
```

### <a id="modinfo" href="#modinfo">func modinfo() string</a>

```
searchKey: debug.modinfo
tags: [function private]
```

```Go
func modinfo() string
```

exported from runtime 

### <a id="readGCStats" href="#readGCStats">func readGCStats(*[]time.Duration)</a>

```
searchKey: debug.readGCStats
tags: [function private]
```

```Go
func readGCStats(*[]time.Duration)
```

Implemented in package runtime. 

### <a id="setGCPercent" href="#setGCPercent">func setGCPercent(int32) int32</a>

```
searchKey: debug.setGCPercent
tags: [function private]
```

```Go
func setGCPercent(int32) int32
```

### <a id="setMaxStack" href="#setMaxStack">func setMaxStack(int) int</a>

```
searchKey: debug.setMaxStack
tags: [function private]
```

```Go
func setMaxStack(int) int
```

### <a id="setMaxThreads" href="#setMaxThreads">func setMaxThreads(int) int</a>

```
searchKey: debug.setMaxThreads
tags: [function private]
```

```Go
func setMaxThreads(int) int
```

### <a id="setPanicOnFault" href="#setPanicOnFault">func setPanicOnFault(bool) bool</a>

```
searchKey: debug.setPanicOnFault
tags: [function private]
```

```Go
func setPanicOnFault(bool) bool
```

