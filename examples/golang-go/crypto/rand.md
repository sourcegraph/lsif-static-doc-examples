# Package rand

Package rand implements a cryptographically secure random number generator. 

## Index

* [Constants](#const)
    * [const urandomDevice](#urandomDevice)
* [Variables](#var)
    * [var Reader](#Reader)
    * [var altGetRandom](#altGetRandom)
    * [var isEAGAIN](#isEAGAIN)
    * [var smallPrimes](#smallPrimes)
    * [var smallPrimesProduct](#smallPrimesProduct)
* [Types](#type)
    * [type devReader struct](#devReader)
        * [func (r *devReader) Read(b []byte) (n int, err error)](#devReader.Read)
    * [type hideAgainReader struct](#hideAgainReader)
        * [func (hr hideAgainReader) Read(p []byte) (n int, err error)](#hideAgainReader.Read)
    * [type reader struct](#reader)
        * [func (r *reader) Read(b []byte) (n int, err error)](#reader.Read)
* [Functions](#func)
    * [func init()](#init)
    * [func unixIsEAGAIN(err error) bool](#unixIsEAGAIN)
    * [func Read(b []byte) (n int, err error)](#Read)
    * [func init()](#init)
    * [func getEntropy(p []byte) (ok bool)](#getEntropy)
    * [func init()](#init)
    * [func warnBlocked()](#warnBlocked)
    * [func newReader(entropy io.Reader) io.Reader](#newReader)
    * [func Prime(rand io.Reader, bits int) (p *big.Int, err error)](#Prime)
    * [func Int(rand io.Reader, max *big.Int) (n *big.Int, err error)](#Int)
    * [func TestRead(t *testing.T)](#TestRead)
    * [func TestReadEmpty(t *testing.T)](#TestReadEmpty)


## <a id="const" href="#const">Constants</a>

```
tags: [exported]
```

### <a id="urandomDevice" href="#urandomDevice">const urandomDevice</a>

```
searchKey: rand.urandomDevice
```

```Go
const urandomDevice = "/dev/urandom"
```

## <a id="var" href="#var">Variables</a>

```
tags: [exported]
```

### <a id="Reader" href="#Reader">var Reader</a>

```
searchKey: rand.Reader
tags: [exported]
```

```Go
var Reader io.Reader
```

Reader is a global, shared instance of a cryptographically secure random number generator. 

On Linux and FreeBSD, Reader uses getrandom(2) if available, /dev/urandom otherwise. On OpenBSD, Reader uses getentropy(2). On other Unix-like systems, Reader reads from /dev/urandom. On Windows systems, Reader uses the RtlGenRandom API. On Wasm, Reader uses the Web Crypto API. 

### <a id="altGetRandom" href="#altGetRandom">var altGetRandom</a>

```
searchKey: rand.altGetRandom
```

```Go
var altGetRandom func([]byte) (ok bool)
```

altGetRandom if non-nil specifies an OS-specific function to get urandom-style randomness. 

### <a id="isEAGAIN" href="#isEAGAIN">var isEAGAIN</a>

```
searchKey: rand.isEAGAIN
```

```Go
var isEAGAIN func(error) bool // set by eagain.go on unix systems

```

### <a id="smallPrimes" href="#smallPrimes">var smallPrimes</a>

```
searchKey: rand.smallPrimes
```

```Go
var smallPrimes = []uint8{
	3, 5, 7, 11, 13, 17, 19, 23, 29, 31, 37, 41, 43, 47, 53,
}
```

smallPrimes is a list of small, prime numbers that allows us to rapidly exclude some fraction of composite candidates when searching for a random prime. This list is truncated at the point where smallPrimesProduct exceeds a uint64. It does not include two because we ensure that the candidates are odd by construction. 

### <a id="smallPrimesProduct" href="#smallPrimesProduct">var smallPrimesProduct</a>

```
searchKey: rand.smallPrimesProduct
```

```Go
var smallPrimesProduct = new(big.Int).SetUint64(16294579238595022365)
```

smallPrimesProduct is the product of the values in smallPrimes and allows us to reduce a candidate prime by this number and then determine whether it's coprime to all the elements of smallPrimes without further big.Int operations. 

## <a id="type" href="#type">Types</a>

```
tags: [exported]
```

### <a id="devReader" href="#devReader">type devReader struct</a>

```
searchKey: rand.devReader
```

```Go
type devReader struct {
	name string
	f    io.Reader
	mu   sync.Mutex
	used int32 // atomic; whether this devReader has been used
}
```

A devReader satisfies reads by reading the file named name. 

#### <a id="devReader.Read" href="#devReader.Read">func (r *devReader) Read(b []byte) (n int, err error)</a>

```
searchKey: rand.devReader.Read
```

```Go
func (r *devReader) Read(b []byte) (n int, err error)
```

### <a id="hideAgainReader" href="#hideAgainReader">type hideAgainReader struct</a>

```
searchKey: rand.hideAgainReader
```

```Go
type hideAgainReader struct {
	r io.Reader
}
```

hideAgainReader masks EAGAIN reads from /dev/urandom. See golang.org/issue/9205 

#### <a id="hideAgainReader.Read" href="#hideAgainReader.Read">func (hr hideAgainReader) Read(p []byte) (n int, err error)</a>

```
searchKey: rand.hideAgainReader.Read
```

```Go
func (hr hideAgainReader) Read(p []byte) (n int, err error)
```

### <a id="reader" href="#reader">type reader struct</a>

```
searchKey: rand.reader
```

```Go
type reader struct {
	mu                   sync.Mutex
	budget               int // number of bytes that can be generated
	cipher               cipher.Block
	entropy              io.Reader
	time, seed, dst, key [aes.BlockSize]byte
}
```

#### <a id="reader.Read" href="#reader.Read">func (r *reader) Read(b []byte) (n int, err error)</a>

```
searchKey: rand.reader.Read
```

```Go
func (r *reader) Read(b []byte) (n int, err error)
```

## <a id="func" href="#func">Functions</a>

```
tags: [exported]
```

### <a id="init" href="#init">func init()</a>

```
searchKey: rand.init
```

```Go
func init()
```

### <a id="unixIsEAGAIN" href="#unixIsEAGAIN">func unixIsEAGAIN(err error) bool</a>

```
searchKey: rand.unixIsEAGAIN
```

```Go
func unixIsEAGAIN(err error) bool
```

unixIsEAGAIN reports whether err is a syscall.EAGAIN wrapped in a PathError. See golang.org/issue/9205 

### <a id="Read" href="#Read">func Read(b []byte) (n int, err error)</a>

```
searchKey: rand.Read
tags: [exported]
```

```Go
func Read(b []byte) (n int, err error)
```

Read is a helper function that calls Reader.Read using io.ReadFull. On return, n == len(b) if and only if err == nil. 

### <a id="init" href="#init">func init()</a>

```
searchKey: rand.init
```

```Go
func init()
```

### <a id="getEntropy" href="#getEntropy">func getEntropy(p []byte) (ok bool)</a>

```
searchKey: rand.getEntropy
```

```Go
func getEntropy(p []byte) (ok bool)
```

### <a id="init" href="#init">func init()</a>

```
searchKey: rand.init
```

```Go
func init()
```

### <a id="warnBlocked" href="#warnBlocked">func warnBlocked()</a>

```
searchKey: rand.warnBlocked
```

```Go
func warnBlocked()
```

### <a id="newReader" href="#newReader">func newReader(entropy io.Reader) io.Reader</a>

```
searchKey: rand.newReader
```

```Go
func newReader(entropy io.Reader) io.Reader
```

newReader returns a new pseudorandom generator that seeds itself by reading from entropy. If entropy == nil, the generator seeds itself by reading from the system's random number generator, typically /dev/random. The Read method on the returned reader always returns the full amount asked for, or else it returns an error. 

The generator uses the X9.31 algorithm with AES-128, reseeding after every 1 MB of generated data. 

### <a id="Prime" href="#Prime">func Prime(rand io.Reader, bits int) (p *big.Int, err error)</a>

```
searchKey: rand.Prime
tags: [exported]
```

```Go
func Prime(rand io.Reader, bits int) (p *big.Int, err error)
```

Prime returns a number, p, of the given size, such that p is prime with high probability. Prime will return error for any error returned by rand.Read or if bits < 2. 

### <a id="Int" href="#Int">func Int(rand io.Reader, max *big.Int) (n *big.Int, err error)</a>

```
searchKey: rand.Int
tags: [exported]
```

```Go
func Int(rand io.Reader, max *big.Int) (n *big.Int, err error)
```

Int returns a uniform random value in [0, max). It panics if max <= 0. 

### <a id="TestRead" href="#TestRead">func TestRead(t *testing.T)</a>

```
searchKey: rand.TestRead
```

```Go
func TestRead(t *testing.T)
```

### <a id="TestReadEmpty" href="#TestReadEmpty">func TestReadEmpty(t *testing.T)</a>

```
searchKey: rand.TestReadEmpty
```

```Go
func TestReadEmpty(t *testing.T)
```

