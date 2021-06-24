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
    * [func Int(rand io.Reader, max *big.Int) (n *big.Int, err error)](#Int)
    * [func Prime(rand io.Reader, bits int) (p *big.Int, err error)](#Prime)
    * [func Read(b []byte) (n int, err error)](#Read)
    * [func TestRead(t *testing.T)](#TestRead)
    * [func TestReadEmpty(t *testing.T)](#TestReadEmpty)
    * [func getEntropy(p []byte) (ok bool)](#getEntropy)
    * [func init()](#init.eagain.go)
    * [func init()](#init.rand_getentropy.go)
    * [func init()](#init.rand_unix.go)
    * [func newReader(entropy io.Reader) io.Reader](#newReader)
    * [func unixIsEAGAIN(err error) bool](#unixIsEAGAIN)
    * [func warnBlocked()](#warnBlocked)


## <a id="const" href="#const">Constants</a>

```
tags: [package]
```

### <a id="urandomDevice" href="#urandomDevice">const urandomDevice</a>

```
searchKey: rand.urandomDevice
tags: [constant string private]
```

```Go
const urandomDevice = "/dev/urandom"
```

## <a id="var" href="#var">Variables</a>

```
tags: [package]
```

### <a id="Reader" href="#Reader">var Reader</a>

```
searchKey: rand.Reader
tags: [variable interface]
```

```Go
var Reader io.Reader
```

Reader is a global, shared instance of a cryptographically secure random number generator. 

On Linux and FreeBSD, Reader uses getrandom(2) if available, /dev/urandom otherwise. On OpenBSD, Reader uses getentropy(2). On other Unix-like systems, Reader reads from /dev/urandom. On Windows systems, Reader uses the RtlGenRandom API. On Wasm, Reader uses the Web Crypto API. 

### <a id="altGetRandom" href="#altGetRandom">var altGetRandom</a>

```
searchKey: rand.altGetRandom
tags: [variable function private]
```

```Go
var altGetRandom func([]byte) (ok bool)
```

altGetRandom if non-nil specifies an OS-specific function to get urandom-style randomness. 

### <a id="isEAGAIN" href="#isEAGAIN">var isEAGAIN</a>

```
searchKey: rand.isEAGAIN
tags: [variable function private]
```

```Go
var isEAGAIN func(error) bool // set by eagain.go on unix systems

```

### <a id="smallPrimes" href="#smallPrimes">var smallPrimes</a>

```
searchKey: rand.smallPrimes
tags: [variable array number private]
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
tags: [variable struct private]
```

```Go
var smallPrimesProduct = new(big.Int).SetUint64(16294579238595022365)
```

smallPrimesProduct is the product of the values in smallPrimes and allows us to reduce a candidate prime by this number and then determine whether it's coprime to all the elements of smallPrimes without further big.Int operations. 

## <a id="type" href="#type">Types</a>

```
tags: [package]
```

### <a id="devReader" href="#devReader">type devReader struct</a>

```
searchKey: rand.devReader
tags: [struct private]
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
tags: [method private]
```

```Go
func (r *devReader) Read(b []byte) (n int, err error)
```

### <a id="hideAgainReader" href="#hideAgainReader">type hideAgainReader struct</a>

```
searchKey: rand.hideAgainReader
tags: [struct private]
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
tags: [method private]
```

```Go
func (hr hideAgainReader) Read(p []byte) (n int, err error)
```

### <a id="reader" href="#reader">type reader struct</a>

```
searchKey: rand.reader
tags: [struct private]
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
tags: [method private]
```

```Go
func (r *reader) Read(b []byte) (n int, err error)
```

## <a id="func" href="#func">Functions</a>

```
tags: [package]
```

### <a id="Int" href="#Int">func Int(rand io.Reader, max *big.Int) (n *big.Int, err error)</a>

```
searchKey: rand.Int
tags: [method]
```

```Go
func Int(rand io.Reader, max *big.Int) (n *big.Int, err error)
```

Int returns a uniform random value in [0, max). It panics if max <= 0. 

### <a id="Prime" href="#Prime">func Prime(rand io.Reader, bits int) (p *big.Int, err error)</a>

```
searchKey: rand.Prime
tags: [method]
```

```Go
func Prime(rand io.Reader, bits int) (p *big.Int, err error)
```

Prime returns a number, p, of the given size, such that p is prime with high probability. Prime will return error for any error returned by rand.Read or if bits < 2. 

### <a id="Read" href="#Read">func Read(b []byte) (n int, err error)</a>

```
searchKey: rand.Read
tags: [method]
```

```Go
func Read(b []byte) (n int, err error)
```

Read is a helper function that calls Reader.Read using io.ReadFull. On return, n == len(b) if and only if err == nil. 

### <a id="TestRead" href="#TestRead">func TestRead(t *testing.T)</a>

```
searchKey: rand.TestRead
tags: [method private test]
```

```Go
func TestRead(t *testing.T)
```

### <a id="TestReadEmpty" href="#TestReadEmpty">func TestReadEmpty(t *testing.T)</a>

```
searchKey: rand.TestReadEmpty
tags: [method private test]
```

```Go
func TestReadEmpty(t *testing.T)
```

### <a id="getEntropy" href="#getEntropy">func getEntropy(p []byte) (ok bool)</a>

```
searchKey: rand.getEntropy
tags: [method private]
```

```Go
func getEntropy(p []byte) (ok bool)
```

### <a id="init.eagain.go" href="#init.eagain.go">func init()</a>

```
searchKey: rand.init
tags: [function private]
```

```Go
func init()
```

### <a id="init.rand_getentropy.go" href="#init.rand_getentropy.go">func init()</a>

```
searchKey: rand.init
tags: [function private]
```

```Go
func init()
```

### <a id="init.rand_unix.go" href="#init.rand_unix.go">func init()</a>

```
searchKey: rand.init
tags: [function private]
```

```Go
func init()
```

### <a id="newReader" href="#newReader">func newReader(entropy io.Reader) io.Reader</a>

```
searchKey: rand.newReader
tags: [method private]
```

```Go
func newReader(entropy io.Reader) io.Reader
```

newReader returns a new pseudorandom generator that seeds itself by reading from entropy. If entropy == nil, the generator seeds itself by reading from the system's random number generator, typically /dev/random. The Read method on the returned reader always returns the full amount asked for, or else it returns an error. 

The generator uses the X9.31 algorithm with AES-128, reseeding after every 1 MB of generated data. 

### <a id="unixIsEAGAIN" href="#unixIsEAGAIN">func unixIsEAGAIN(err error) bool</a>

```
searchKey: rand.unixIsEAGAIN
tags: [method private]
```

```Go
func unixIsEAGAIN(err error) bool
```

unixIsEAGAIN reports whether err is a syscall.EAGAIN wrapped in a PathError. See golang.org/issue/9205 

### <a id="warnBlocked" href="#warnBlocked">func warnBlocked()</a>

```
searchKey: rand.warnBlocked
tags: [function private]
```

```Go
func warnBlocked()
```

