# Package bytealg

## Index

* [Constants](#const)
    * [const MaxBruteForce](#MaxBruteForce)
    * [const PrimeRK](#PrimeRK)
    * [const offsetPPC64HasPOWER9](#offsetPPC64HasPOWER9)
    * [const offsetS390xHasVX](#offsetS390xHasVX)
    * [const offsetX86HasAVX2](#offsetX86HasAVX2)
    * [const offsetX86HasPOPCNT](#offsetX86HasPOPCNT)
    * [const offsetX86HasSSE2](#offsetX86HasSSE2)
    * [const offsetX86HasSSE42](#offsetX86HasSSE42)
* [Variables](#var)
    * [var MaxLen](#MaxLen)
* [Functions](#func)
    * [func Compare(a, b []byte) int](#Compare)
    * [func Count(b []byte, c byte) int](#Count)
    * [func CountString(s string, c byte) int](#CountString)
    * [func Cutover(n int) int](#Cutover)
    * [func Equal(a, b []byte) bool](#Equal)
    * [func HashStr(sep string) (uint32, uint32)](#HashStr)
    * [func HashStrBytes(sep []byte) (uint32, uint32)](#HashStrBytes)
    * [func HashStrRev(sep string) (uint32, uint32)](#HashStrRev)
    * [func HashStrRevBytes(sep []byte) (uint32, uint32)](#HashStrRevBytes)
    * [func Index(a, b []byte) int](#Index)
    * [func IndexByte(b []byte, c byte) int](#IndexByte)
    * [func IndexByteString(s string, c byte) int](#IndexByteString)
    * [func IndexRabinKarp(s, substr string) int](#IndexRabinKarp)
    * [func IndexRabinKarpBytes(s, sep []byte) int](#IndexRabinKarpBytes)
    * [func IndexString(a, b string) int](#IndexString)
    * [func abigen_runtime_cmpstring(a, b string) int](#abigen_runtime_cmpstring)
    * [func abigen_runtime_memequal(a, b unsafe.Pointer, size uintptr) bool](#abigen_runtime_memequal)
    * [func abigen_runtime_memequal_varlen(a, b unsafe.Pointer) bool](#abigen_runtime_memequal_varlen)
    * [func countGeneric(b []byte, c byte) int](#countGeneric)
    * [func countGenericString(s string, c byte) int](#countGenericString)
    * [func init()](#init.index_amd64.go)


## <a id="const" href="#const">Constants</a>

```
tags: [private]
```

### <a id="MaxBruteForce" href="#MaxBruteForce">const MaxBruteForce</a>

```
searchKey: bytealg.MaxBruteForce
tags: [constant number]
```

```Go
const MaxBruteForce = 64
```

### <a id="PrimeRK" href="#PrimeRK">const PrimeRK</a>

```
searchKey: bytealg.PrimeRK
tags: [constant number]
```

```Go
const PrimeRK = 16777619
```

PrimeRK is the prime base used in Rabin-Karp algorithm. 

### <a id="offsetPPC64HasPOWER9" href="#offsetPPC64HasPOWER9">const offsetPPC64HasPOWER9</a>

```
searchKey: bytealg.offsetPPC64HasPOWER9
tags: [constant number private]
```

```Go
const offsetPPC64HasPOWER9 = unsafe.Offsetof(cpu.PPC64.IsPOWER9)
```

Offsets into internal/cpu records for use in assembly. 

### <a id="offsetS390xHasVX" href="#offsetS390xHasVX">const offsetS390xHasVX</a>

```
searchKey: bytealg.offsetS390xHasVX
tags: [constant number private]
```

```Go
const offsetS390xHasVX = unsafe.Offsetof(cpu.S390X.HasVX)
```

Offsets into internal/cpu records for use in assembly. 

### <a id="offsetX86HasAVX2" href="#offsetX86HasAVX2">const offsetX86HasAVX2</a>

```
searchKey: bytealg.offsetX86HasAVX2
tags: [constant number private]
```

```Go
const offsetX86HasAVX2 = unsafe.Offsetof(cpu.X86.HasAVX2)
```

Offsets into internal/cpu records for use in assembly. 

### <a id="offsetX86HasPOPCNT" href="#offsetX86HasPOPCNT">const offsetX86HasPOPCNT</a>

```
searchKey: bytealg.offsetX86HasPOPCNT
tags: [constant number private]
```

```Go
const offsetX86HasPOPCNT = unsafe.Offsetof(cpu.X86.HasPOPCNT)
```

Offsets into internal/cpu records for use in assembly. 

### <a id="offsetX86HasSSE2" href="#offsetX86HasSSE2">const offsetX86HasSSE2</a>

```
searchKey: bytealg.offsetX86HasSSE2
tags: [constant number private]
```

```Go
const offsetX86HasSSE2 = unsafe.Offsetof(cpu.X86.HasSSE2)
```

Offsets into internal/cpu records for use in assembly. 

### <a id="offsetX86HasSSE42" href="#offsetX86HasSSE42">const offsetX86HasSSE42</a>

```
searchKey: bytealg.offsetX86HasSSE42
tags: [constant number private]
```

```Go
const offsetX86HasSSE42 = unsafe.Offsetof(cpu.X86.HasSSE42)
```

Offsets into internal/cpu records for use in assembly. 

## <a id="var" href="#var">Variables</a>

```
tags: [private]
```

### <a id="MaxLen" href="#MaxLen">var MaxLen</a>

```
searchKey: bytealg.MaxLen
tags: [variable number]
```

```Go
var MaxLen int
```

MaxLen is the maximum length of the string to be searched for (argument b) in Index. If MaxLen is not 0, make sure MaxLen >= 4. 

## <a id="func" href="#func">Functions</a>

```
tags: [private]
```

### <a id="Compare" href="#Compare">func Compare(a, b []byte) int</a>

```
searchKey: bytealg.Compare
tags: [function]
```

```Go
func Compare(a, b []byte) int
```

### <a id="Count" href="#Count">func Count(b []byte, c byte) int</a>

```
searchKey: bytealg.Count
tags: [function]
```

```Go
func Count(b []byte, c byte) int
```

### <a id="CountString" href="#CountString">func CountString(s string, c byte) int</a>

```
searchKey: bytealg.CountString
tags: [function]
```

```Go
func CountString(s string, c byte) int
```

### <a id="Cutover" href="#Cutover">func Cutover(n int) int</a>

```
searchKey: bytealg.Cutover
tags: [function]
```

```Go
func Cutover(n int) int
```

Cutover reports the number of failures of IndexByte we should tolerate before switching over to Index. n is the number of bytes processed so far. See the bytes.Index implementation for details. 

### <a id="Equal" href="#Equal">func Equal(a, b []byte) bool</a>

```
searchKey: bytealg.Equal
tags: [function]
```

```Go
func Equal(a, b []byte) bool
```

Equal reports whether a and b are the same length and contain the same bytes. A nil argument is equivalent to an empty slice. 

Equal is equivalent to bytes.Equal. It is provided here for convenience, because some packages cannot depend on bytes. 

### <a id="HashStr" href="#HashStr">func HashStr(sep string) (uint32, uint32)</a>

```
searchKey: bytealg.HashStr
tags: [function]
```

```Go
func HashStr(sep string) (uint32, uint32)
```

HashStr returns the hash and the appropriate multiplicative factor for use in Rabin-Karp algorithm. 

### <a id="HashStrBytes" href="#HashStrBytes">func HashStrBytes(sep []byte) (uint32, uint32)</a>

```
searchKey: bytealg.HashStrBytes
tags: [function]
```

```Go
func HashStrBytes(sep []byte) (uint32, uint32)
```

HashStrBytes returns the hash and the appropriate multiplicative factor for use in Rabin-Karp algorithm. 

### <a id="HashStrRev" href="#HashStrRev">func HashStrRev(sep string) (uint32, uint32)</a>

```
searchKey: bytealg.HashStrRev
tags: [function]
```

```Go
func HashStrRev(sep string) (uint32, uint32)
```

HashStrRev returns the hash of the reverse of sep and the appropriate multiplicative factor for use in Rabin-Karp algorithm. 

### <a id="HashStrRevBytes" href="#HashStrRevBytes">func HashStrRevBytes(sep []byte) (uint32, uint32)</a>

```
searchKey: bytealg.HashStrRevBytes
tags: [function]
```

```Go
func HashStrRevBytes(sep []byte) (uint32, uint32)
```

HashStrRevBytes returns the hash of the reverse of sep and the appropriate multiplicative factor for use in Rabin-Karp algorithm. 

### <a id="Index" href="#Index">func Index(a, b []byte) int</a>

```
searchKey: bytealg.Index
tags: [function]
```

```Go
func Index(a, b []byte) int
```

Index returns the index of the first instance of b in a, or -1 if b is not present in a. Requires 2 <= len(b) <= MaxLen. 

### <a id="IndexByte" href="#IndexByte">func IndexByte(b []byte, c byte) int</a>

```
searchKey: bytealg.IndexByte
tags: [function]
```

```Go
func IndexByte(b []byte, c byte) int
```

### <a id="IndexByteString" href="#IndexByteString">func IndexByteString(s string, c byte) int</a>

```
searchKey: bytealg.IndexByteString
tags: [function]
```

```Go
func IndexByteString(s string, c byte) int
```

### <a id="IndexRabinKarp" href="#IndexRabinKarp">func IndexRabinKarp(s, substr string) int</a>

```
searchKey: bytealg.IndexRabinKarp
tags: [function]
```

```Go
func IndexRabinKarp(s, substr string) int
```

IndexRabinKarp uses the Rabin-Karp search algorithm to return the index of the first occurrence of substr in s, or -1 if not present. 

### <a id="IndexRabinKarpBytes" href="#IndexRabinKarpBytes">func IndexRabinKarpBytes(s, sep []byte) int</a>

```
searchKey: bytealg.IndexRabinKarpBytes
tags: [function]
```

```Go
func IndexRabinKarpBytes(s, sep []byte) int
```

IndexRabinKarpBytes uses the Rabin-Karp search algorithm to return the index of the first occurrence of substr in s, or -1 if not present. 

### <a id="IndexString" href="#IndexString">func IndexString(a, b string) int</a>

```
searchKey: bytealg.IndexString
tags: [function]
```

```Go
func IndexString(a, b string) int
```

IndexString returns the index of the first instance of b in a, or -1 if b is not present in a. Requires 2 <= len(b) <= MaxLen. 

### <a id="abigen_runtime_cmpstring" href="#abigen_runtime_cmpstring">func abigen_runtime_cmpstring(a, b string) int</a>

```
searchKey: bytealg.abigen_runtime_cmpstring
tags: [function private]
```

```Go
func abigen_runtime_cmpstring(a, b string) int
```

### <a id="abigen_runtime_memequal" href="#abigen_runtime_memequal">func abigen_runtime_memequal(a, b unsafe.Pointer, size uintptr) bool</a>

```
searchKey: bytealg.abigen_runtime_memequal
tags: [function private]
```

```Go
func abigen_runtime_memequal(a, b unsafe.Pointer, size uintptr) bool
```

### <a id="abigen_runtime_memequal_varlen" href="#abigen_runtime_memequal_varlen">func abigen_runtime_memequal_varlen(a, b unsafe.Pointer) bool</a>

```
searchKey: bytealg.abigen_runtime_memequal_varlen
tags: [function private]
```

```Go
func abigen_runtime_memequal_varlen(a, b unsafe.Pointer) bool
```

### <a id="countGeneric" href="#countGeneric">func countGeneric(b []byte, c byte) int</a>

```
searchKey: bytealg.countGeneric
tags: [function private]
```

```Go
func countGeneric(b []byte, c byte) int
```

A backup implementation to use by assembly. 

### <a id="countGenericString" href="#countGenericString">func countGenericString(s string, c byte) int</a>

```
searchKey: bytealg.countGenericString
tags: [function private]
```

```Go
func countGenericString(s string, c byte) int
```

### <a id="init.index_amd64.go" href="#init.index_amd64.go">func init()</a>

```
searchKey: bytealg.init
tags: [function private]
```

```Go
func init()
```

