# Package sys

package sys contains system- and configuration- and architecture-specific constants used by the runtime. 

## Index

* [Constants](#const)
    * [const AMD64](#AMD64)
    * [const ARM](#ARM)
    * [const ARM64](#ARM64)
    * [const ArchFamily](#ArchFamily)
    * [const BigEndian](#BigEndian)
    * [const DefaultPhysPageSize](#DefaultPhysPageSize)
    * [const GOARCH](#GOARCH)
    * [const GOOS](#GOOS)
    * [const Goarch386](#Goarch386)
    * [const GoarchAmd64](#GoarchAmd64)
    * [const GoarchAmd64p32](#GoarchAmd64p32)
    * [const GoarchArm](#GoarchArm)
    * [const GoarchArm64](#GoarchArm64)
    * [const GoarchArm64be](#GoarchArm64be)
    * [const GoarchArmbe](#GoarchArmbe)
    * [const GoarchMips](#GoarchMips)
    * [const GoarchMips64](#GoarchMips64)
    * [const GoarchMips64le](#GoarchMips64le)
    * [const GoarchMips64p32](#GoarchMips64p32)
    * [const GoarchMips64p32le](#GoarchMips64p32le)
    * [const GoarchMipsle](#GoarchMipsle)
    * [const GoarchPpc](#GoarchPpc)
    * [const GoarchPpc64](#GoarchPpc64)
    * [const GoarchPpc64le](#GoarchPpc64le)
    * [const GoarchRiscv](#GoarchRiscv)
    * [const GoarchRiscv64](#GoarchRiscv64)
    * [const GoarchS390](#GoarchS390)
    * [const GoarchS390x](#GoarchS390x)
    * [const GoarchSparc](#GoarchSparc)
    * [const GoarchSparc64](#GoarchSparc64)
    * [const GoarchWasm](#GoarchWasm)
    * [const GoosAix](#GoosAix)
    * [const GoosAndroid](#GoosAndroid)
    * [const GoosDarwin](#GoosDarwin)
    * [const GoosDragonfly](#GoosDragonfly)
    * [const GoosFreebsd](#GoosFreebsd)
    * [const GoosHurd](#GoosHurd)
    * [const GoosIllumos](#GoosIllumos)
    * [const GoosIos](#GoosIos)
    * [const GoosJs](#GoosJs)
    * [const GoosLinux](#GoosLinux)
    * [const GoosNacl](#GoosNacl)
    * [const GoosNetbsd](#GoosNetbsd)
    * [const GoosOpenbsd](#GoosOpenbsd)
    * [const GoosPlan9](#GoosPlan9)
    * [const GoosSolaris](#GoosSolaris)
    * [const GoosWindows](#GoosWindows)
    * [const GoosZos](#GoosZos)
    * [const I386](#I386)
    * [const Int64Align](#Int64Align)
    * [const MIPS](#MIPS)
    * [const MIPS64](#MIPS64)
    * [const MinFrameSize](#MinFrameSize)
    * [const PCQuantum](#PCQuantum)
    * [const PPC64](#PPC64)
    * [const PtrSize](#PtrSize)
    * [const RISCV64](#RISCV64)
    * [const S390X](#S390X)
    * [const StackAlign](#StackAlign)
    * [const StackGuardMultiplier](#StackGuardMultiplier)
    * [const WASM](#WASM)
    * [const deBruijn32ctz](#deBruijn32ctz)
    * [const deBruijn64](#deBruijn64)
    * [const deBruijn64ctz](#deBruijn64ctz)
    * [const m0](#m0)
    * [const m1](#m1)
    * [const m2](#m2)
    * [const _ArchFamily](#_ArchFamily)
    * [const _DefaultPhysPageSize](#_DefaultPhysPageSize)
    * [const _MinFrameSize](#_MinFrameSize)
    * [const _PCQuantum](#_PCQuantum)
    * [const _StackAlign](#_StackAlign)
* [Variables](#var)
    * [var deBruijn64tab](#deBruijn64tab)
    * [var deBruijnIdx32ctz](#deBruijnIdx32ctz)
    * [var deBruijnIdx64ctz](#deBruijnIdx64ctz)
    * [var len8tab](#len8tab)
    * [var ntz8tab](#ntz8tab)
* [Types](#type)
    * [type ArchFamilyType int](#ArchFamilyType)
* [Functions](#func)
    * [func Bswap32(x uint32) uint32](#Bswap32)
    * [func Bswap64(x uint64) uint64](#Bswap64)
    * [func Ctz32(x uint32) int](#Ctz32)
    * [func Ctz64(x uint64) int](#Ctz64)
    * [func Ctz8(x uint8) int](#Ctz8)
    * [func LeadingZeros64(x uint64) int](#LeadingZeros64)
    * [func LeadingZeros8(x uint8) int](#LeadingZeros8)
    * [func Len64(x uint64) (n int)](#Len64)
    * [func Len8(x uint8) int](#Len8)
    * [func OnesCount64(x uint64) int](#OnesCount64)
    * [func TrailingZeros64(x uint64) int](#TrailingZeros64)
    * [func TrailingZeros8(x uint8) int](#TrailingZeros8)


## <a id="const" href="#const">Constants</a>

```
tags: [private]
```

### <a id="AMD64" href="#AMD64">const AMD64</a>

```
searchKey: sys.AMD64
tags: [constant number]
```

```Go
const AMD64 ArchFamilyType = iota
```

### <a id="ARM" href="#ARM">const ARM</a>

```
searchKey: sys.ARM
tags: [constant number]
```

```Go
const ARM
```

### <a id="ARM64" href="#ARM64">const ARM64</a>

```
searchKey: sys.ARM64
tags: [constant number]
```

```Go
const ARM64
```

### <a id="ArchFamily" href="#ArchFamily">const ArchFamily</a>

```
searchKey: sys.ArchFamily
tags: [constant number]
```

```Go
const ArchFamily ArchFamilyType = _ArchFamily
```

ArchFamily is the architecture family (AMD64, ARM, ...) 

### <a id="BigEndian" href="#BigEndian">const BigEndian</a>

```
searchKey: sys.BigEndian
tags: [constant boolean]
```

```Go
const BigEndian = ...
```

BigEndian reports whether the architecture is big-endian. 

### <a id="DefaultPhysPageSize" href="#DefaultPhysPageSize">const DefaultPhysPageSize</a>

```
searchKey: sys.DefaultPhysPageSize
tags: [constant number]
```

```Go
const DefaultPhysPageSize = _DefaultPhysPageSize
```

DefaultPhysPageSize is the default physical page size. 

### <a id="GOARCH" href="#GOARCH">const GOARCH</a>

```
searchKey: sys.GOARCH
tags: [constant string]
```

```Go
const GOARCH = `amd64`
```

### <a id="GOOS" href="#GOOS">const GOOS</a>

```
searchKey: sys.GOOS
tags: [constant string]
```

```Go
const GOOS = `darwin`
```

### <a id="Goarch386" href="#Goarch386">const Goarch386</a>

```
searchKey: sys.Goarch386
tags: [constant number]
```

```Go
const Goarch386 = 0
```

### <a id="GoarchAmd64" href="#GoarchAmd64">const GoarchAmd64</a>

```
searchKey: sys.GoarchAmd64
tags: [constant number]
```

```Go
const GoarchAmd64 = 1
```

### <a id="GoarchAmd64p32" href="#GoarchAmd64p32">const GoarchAmd64p32</a>

```
searchKey: sys.GoarchAmd64p32
tags: [constant number]
```

```Go
const GoarchAmd64p32 = 0
```

### <a id="GoarchArm" href="#GoarchArm">const GoarchArm</a>

```
searchKey: sys.GoarchArm
tags: [constant number]
```

```Go
const GoarchArm = 0
```

### <a id="GoarchArm64" href="#GoarchArm64">const GoarchArm64</a>

```
searchKey: sys.GoarchArm64
tags: [constant number]
```

```Go
const GoarchArm64 = 0
```

### <a id="GoarchArm64be" href="#GoarchArm64be">const GoarchArm64be</a>

```
searchKey: sys.GoarchArm64be
tags: [constant number]
```

```Go
const GoarchArm64be = 0
```

### <a id="GoarchArmbe" href="#GoarchArmbe">const GoarchArmbe</a>

```
searchKey: sys.GoarchArmbe
tags: [constant number]
```

```Go
const GoarchArmbe = 0
```

### <a id="GoarchMips" href="#GoarchMips">const GoarchMips</a>

```
searchKey: sys.GoarchMips
tags: [constant number]
```

```Go
const GoarchMips = 0
```

### <a id="GoarchMips64" href="#GoarchMips64">const GoarchMips64</a>

```
searchKey: sys.GoarchMips64
tags: [constant number]
```

```Go
const GoarchMips64 = 0
```

### <a id="GoarchMips64le" href="#GoarchMips64le">const GoarchMips64le</a>

```
searchKey: sys.GoarchMips64le
tags: [constant number]
```

```Go
const GoarchMips64le = 0
```

### <a id="GoarchMips64p32" href="#GoarchMips64p32">const GoarchMips64p32</a>

```
searchKey: sys.GoarchMips64p32
tags: [constant number]
```

```Go
const GoarchMips64p32 = 0
```

### <a id="GoarchMips64p32le" href="#GoarchMips64p32le">const GoarchMips64p32le</a>

```
searchKey: sys.GoarchMips64p32le
tags: [constant number]
```

```Go
const GoarchMips64p32le = 0
```

### <a id="GoarchMipsle" href="#GoarchMipsle">const GoarchMipsle</a>

```
searchKey: sys.GoarchMipsle
tags: [constant number]
```

```Go
const GoarchMipsle = 0
```

### <a id="GoarchPpc" href="#GoarchPpc">const GoarchPpc</a>

```
searchKey: sys.GoarchPpc
tags: [constant number]
```

```Go
const GoarchPpc = 0
```

### <a id="GoarchPpc64" href="#GoarchPpc64">const GoarchPpc64</a>

```
searchKey: sys.GoarchPpc64
tags: [constant number]
```

```Go
const GoarchPpc64 = 0
```

### <a id="GoarchPpc64le" href="#GoarchPpc64le">const GoarchPpc64le</a>

```
searchKey: sys.GoarchPpc64le
tags: [constant number]
```

```Go
const GoarchPpc64le = 0
```

### <a id="GoarchRiscv" href="#GoarchRiscv">const GoarchRiscv</a>

```
searchKey: sys.GoarchRiscv
tags: [constant number]
```

```Go
const GoarchRiscv = 0
```

### <a id="GoarchRiscv64" href="#GoarchRiscv64">const GoarchRiscv64</a>

```
searchKey: sys.GoarchRiscv64
tags: [constant number]
```

```Go
const GoarchRiscv64 = 0
```

### <a id="GoarchS390" href="#GoarchS390">const GoarchS390</a>

```
searchKey: sys.GoarchS390
tags: [constant number]
```

```Go
const GoarchS390 = 0
```

### <a id="GoarchS390x" href="#GoarchS390x">const GoarchS390x</a>

```
searchKey: sys.GoarchS390x
tags: [constant number]
```

```Go
const GoarchS390x = 0
```

### <a id="GoarchSparc" href="#GoarchSparc">const GoarchSparc</a>

```
searchKey: sys.GoarchSparc
tags: [constant number]
```

```Go
const GoarchSparc = 0
```

### <a id="GoarchSparc64" href="#GoarchSparc64">const GoarchSparc64</a>

```
searchKey: sys.GoarchSparc64
tags: [constant number]
```

```Go
const GoarchSparc64 = 0
```

### <a id="GoarchWasm" href="#GoarchWasm">const GoarchWasm</a>

```
searchKey: sys.GoarchWasm
tags: [constant number]
```

```Go
const GoarchWasm = 0
```

### <a id="GoosAix" href="#GoosAix">const GoosAix</a>

```
searchKey: sys.GoosAix
tags: [constant number]
```

```Go
const GoosAix = 0
```

### <a id="GoosAndroid" href="#GoosAndroid">const GoosAndroid</a>

```
searchKey: sys.GoosAndroid
tags: [constant number]
```

```Go
const GoosAndroid = 0
```

### <a id="GoosDarwin" href="#GoosDarwin">const GoosDarwin</a>

```
searchKey: sys.GoosDarwin
tags: [constant number]
```

```Go
const GoosDarwin = 1
```

### <a id="GoosDragonfly" href="#GoosDragonfly">const GoosDragonfly</a>

```
searchKey: sys.GoosDragonfly
tags: [constant number]
```

```Go
const GoosDragonfly = 0
```

### <a id="GoosFreebsd" href="#GoosFreebsd">const GoosFreebsd</a>

```
searchKey: sys.GoosFreebsd
tags: [constant number]
```

```Go
const GoosFreebsd = 0
```

### <a id="GoosHurd" href="#GoosHurd">const GoosHurd</a>

```
searchKey: sys.GoosHurd
tags: [constant number]
```

```Go
const GoosHurd = 0
```

### <a id="GoosIllumos" href="#GoosIllumos">const GoosIllumos</a>

```
searchKey: sys.GoosIllumos
tags: [constant number]
```

```Go
const GoosIllumos = 0
```

### <a id="GoosIos" href="#GoosIos">const GoosIos</a>

```
searchKey: sys.GoosIos
tags: [constant number]
```

```Go
const GoosIos = 0
```

### <a id="GoosJs" href="#GoosJs">const GoosJs</a>

```
searchKey: sys.GoosJs
tags: [constant number]
```

```Go
const GoosJs = 0
```

### <a id="GoosLinux" href="#GoosLinux">const GoosLinux</a>

```
searchKey: sys.GoosLinux
tags: [constant number]
```

```Go
const GoosLinux = 0
```

### <a id="GoosNacl" href="#GoosNacl">const GoosNacl</a>

```
searchKey: sys.GoosNacl
tags: [constant number]
```

```Go
const GoosNacl = 0
```

### <a id="GoosNetbsd" href="#GoosNetbsd">const GoosNetbsd</a>

```
searchKey: sys.GoosNetbsd
tags: [constant number]
```

```Go
const GoosNetbsd = 0
```

### <a id="GoosOpenbsd" href="#GoosOpenbsd">const GoosOpenbsd</a>

```
searchKey: sys.GoosOpenbsd
tags: [constant number]
```

```Go
const GoosOpenbsd = 0
```

### <a id="GoosPlan9" href="#GoosPlan9">const GoosPlan9</a>

```
searchKey: sys.GoosPlan9
tags: [constant number]
```

```Go
const GoosPlan9 = 0
```

### <a id="GoosSolaris" href="#GoosSolaris">const GoosSolaris</a>

```
searchKey: sys.GoosSolaris
tags: [constant number]
```

```Go
const GoosSolaris = 0
```

### <a id="GoosWindows" href="#GoosWindows">const GoosWindows</a>

```
searchKey: sys.GoosWindows
tags: [constant number]
```

```Go
const GoosWindows = 0
```

### <a id="GoosZos" href="#GoosZos">const GoosZos</a>

```
searchKey: sys.GoosZos
tags: [constant number]
```

```Go
const GoosZos = 0
```

### <a id="I386" href="#I386">const I386</a>

```
searchKey: sys.I386
tags: [constant number]
```

```Go
const I386
```

### <a id="Int64Align" href="#Int64Align">const Int64Align</a>

```
searchKey: sys.Int64Align
tags: [constant number]
```

```Go
const Int64Align = PtrSize
```

Int64Align is the required alignment for a 64-bit integer (4 on 32-bit systems, 8 on 64-bit). 

### <a id="MIPS" href="#MIPS">const MIPS</a>

```
searchKey: sys.MIPS
tags: [constant number]
```

```Go
const MIPS
```

### <a id="MIPS64" href="#MIPS64">const MIPS64</a>

```
searchKey: sys.MIPS64
tags: [constant number]
```

```Go
const MIPS64
```

### <a id="MinFrameSize" href="#MinFrameSize">const MinFrameSize</a>

```
searchKey: sys.MinFrameSize
tags: [constant number]
```

```Go
const MinFrameSize = _MinFrameSize
```

MinFrameSize is the size of the system-reserved words at the bottom of a frame (just above the architectural stack pointer). It is zero on x86 and PtrSize on most non-x86 (LR-based) systems. On PowerPC it is larger, to cover three more reserved words: the compiler word, the link editor word, and the TOC save word. 

### <a id="PCQuantum" href="#PCQuantum">const PCQuantum</a>

```
searchKey: sys.PCQuantum
tags: [constant number]
```

```Go
const PCQuantum = _PCQuantum
```

PCQuantum is the minimal unit for a program counter (1 on x86, 4 on most other systems). The various PC tables record PC deltas pre-divided by PCQuantum. 

### <a id="PPC64" href="#PPC64">const PPC64</a>

```
searchKey: sys.PPC64
tags: [constant number]
```

```Go
const PPC64
```

### <a id="PtrSize" href="#PtrSize">const PtrSize</a>

```
searchKey: sys.PtrSize
tags: [constant number]
```

```Go
const PtrSize = 4 << (^uintptr(0) >> 63)
```

PtrSize is the size of a pointer in bytes - unsafe.Sizeof(uintptr(0)) but as an ideal constant. It is also the size of the machine's native word size (that is, 4 on 32-bit systems, 8 on 64-bit). 

### <a id="RISCV64" href="#RISCV64">const RISCV64</a>

```
searchKey: sys.RISCV64
tags: [constant number]
```

```Go
const RISCV64
```

### <a id="S390X" href="#S390X">const S390X</a>

```
searchKey: sys.S390X
tags: [constant number]
```

```Go
const S390X
```

### <a id="StackAlign" href="#StackAlign">const StackAlign</a>

```
searchKey: sys.StackAlign
tags: [constant number]
```

```Go
const StackAlign = _StackAlign
```

StackAlign is the required alignment of the SP register. The stack must be at least word aligned, but some architectures require more. 

### <a id="StackGuardMultiplier" href="#StackGuardMultiplier">const StackGuardMultiplier</a>

```
searchKey: sys.StackGuardMultiplier
tags: [constant]
```

```Go
const StackGuardMultiplier = StackGuardMultiplierDefault*(1-GoosAix) + 2*GoosAix
```

AIX requires a larger stack for syscalls. 

### <a id="WASM" href="#WASM">const WASM</a>

```
searchKey: sys.WASM
tags: [constant number]
```

```Go
const WASM
```

### <a id="deBruijn32ctz" href="#deBruijn32ctz">const deBruijn32ctz</a>

```
searchKey: sys.deBruijn32ctz
tags: [constant number private]
```

```Go
const deBruijn32ctz = 0x04653adf
```

### <a id="deBruijn64" href="#deBruijn64">const deBruijn64</a>

```
searchKey: sys.deBruijn64
tags: [constant number private]
```

```Go
const deBruijn64 = 0x03f79d71b4ca8b09
```

### <a id="deBruijn64ctz" href="#deBruijn64ctz">const deBruijn64ctz</a>

```
searchKey: sys.deBruijn64ctz
tags: [constant number private]
```

```Go
const deBruijn64ctz = 0x0218a392cd3d5dbf
```

### <a id="m0" href="#m0">const m0</a>

```
searchKey: sys.m0
tags: [constant number private]
```

```Go
const m0 = 0x5555555555555555 // 01010101 ...

```

### <a id="m1" href="#m1">const m1</a>

```
searchKey: sys.m1
tags: [constant number private]
```

```Go
const m1 = 0x3333333333333333 // 00110011 ...

```

### <a id="m2" href="#m2">const m2</a>

```
searchKey: sys.m2
tags: [constant number private]
```

```Go
const m2 = 0x0f0f0f0f0f0f0f0f // 00001111 ...

```

### <a id="_ArchFamily" href="#_ArchFamily">const _ArchFamily</a>

```
searchKey: sys._ArchFamily
tags: [constant number private]
```

```Go
const _ArchFamily = AMD64
```

### <a id="_DefaultPhysPageSize" href="#_DefaultPhysPageSize">const _DefaultPhysPageSize</a>

```
searchKey: sys._DefaultPhysPageSize
tags: [constant number private]
```

```Go
const _DefaultPhysPageSize = 4096
```

### <a id="_MinFrameSize" href="#_MinFrameSize">const _MinFrameSize</a>

```
searchKey: sys._MinFrameSize
tags: [constant number private]
```

```Go
const _MinFrameSize = 0
```

### <a id="_PCQuantum" href="#_PCQuantum">const _PCQuantum</a>

```
searchKey: sys._PCQuantum
tags: [constant number private]
```

```Go
const _PCQuantum = 1
```

### <a id="_StackAlign" href="#_StackAlign">const _StackAlign</a>

```
searchKey: sys._StackAlign
tags: [constant number private]
```

```Go
const _StackAlign = PtrSize
```

## <a id="var" href="#var">Variables</a>

```
tags: [private]
```

### <a id="deBruijn64tab" href="#deBruijn64tab">var deBruijn64tab</a>

```
searchKey: sys.deBruijn64tab
tags: [variable array number private]
```

```Go
var deBruijn64tab = ...
```

### <a id="deBruijnIdx32ctz" href="#deBruijnIdx32ctz">var deBruijnIdx32ctz</a>

```
searchKey: sys.deBruijnIdx32ctz
tags: [variable array number private]
```

```Go
var deBruijnIdx32ctz = ...
```

### <a id="deBruijnIdx64ctz" href="#deBruijnIdx64ctz">var deBruijnIdx64ctz</a>

```
searchKey: sys.deBruijnIdx64ctz
tags: [variable array number private]
```

```Go
var deBruijnIdx64ctz = ...
```

### <a id="len8tab" href="#len8tab">var len8tab</a>

```
searchKey: sys.len8tab
tags: [variable array number private]
```

```Go
var len8tab = ...
```

### <a id="ntz8tab" href="#ntz8tab">var ntz8tab</a>

```
searchKey: sys.ntz8tab
tags: [variable array number private]
```

```Go
var ntz8tab = ...
```

## <a id="type" href="#type">Types</a>

```
tags: [private]
```

### <a id="ArchFamilyType" href="#ArchFamilyType">type ArchFamilyType int</a>

```
searchKey: sys.ArchFamilyType
tags: [number]
```

```Go
type ArchFamilyType int
```

## <a id="func" href="#func">Functions</a>

```
tags: [private]
```

### <a id="Bswap32" href="#Bswap32">func Bswap32(x uint32) uint32</a>

```
searchKey: sys.Bswap32
tags: [function]
```

```Go
func Bswap32(x uint32) uint32
```

Bswap32 returns its input with byte order reversed 0x01020304 -> 0x04030201 

### <a id="Bswap64" href="#Bswap64">func Bswap64(x uint64) uint64</a>

```
searchKey: sys.Bswap64
tags: [function]
```

```Go
func Bswap64(x uint64) uint64
```

Bswap64 returns its input with byte order reversed 0x0102030405060708 -> 0x0807060504030201 

### <a id="Ctz32" href="#Ctz32">func Ctz32(x uint32) int</a>

```
searchKey: sys.Ctz32
tags: [function]
```

```Go
func Ctz32(x uint32) int
```

Ctz32 counts trailing (low-order) zeroes, and if all are zero, then 32. 

### <a id="Ctz64" href="#Ctz64">func Ctz64(x uint64) int</a>

```
searchKey: sys.Ctz64
tags: [function]
```

```Go
func Ctz64(x uint64) int
```

Ctz64 counts trailing (low-order) zeroes, and if all are zero, then 64. 

### <a id="Ctz8" href="#Ctz8">func Ctz8(x uint8) int</a>

```
searchKey: sys.Ctz8
tags: [function]
```

```Go
func Ctz8(x uint8) int
```

Ctz8 returns the number of trailing zero bits in x; the result is 8 for x == 0. 

### <a id="LeadingZeros64" href="#LeadingZeros64">func LeadingZeros64(x uint64) int</a>

```
searchKey: sys.LeadingZeros64
tags: [function]
```

```Go
func LeadingZeros64(x uint64) int
```

LeadingZeros64 returns the number of leading zero bits in x; the result is 64 for x == 0. 

### <a id="LeadingZeros8" href="#LeadingZeros8">func LeadingZeros8(x uint8) int</a>

```
searchKey: sys.LeadingZeros8
tags: [function]
```

```Go
func LeadingZeros8(x uint8) int
```

LeadingZeros8 returns the number of leading zero bits in x; the result is 8 for x == 0. 

### <a id="Len64" href="#Len64">func Len64(x uint64) (n int)</a>

```
searchKey: sys.Len64
tags: [function]
```

```Go
func Len64(x uint64) (n int)
```

len64 returns the minimum number of bits required to represent x; the result is 0 for x == 0. 

### <a id="Len8" href="#Len8">func Len8(x uint8) int</a>

```
searchKey: sys.Len8
tags: [function]
```

```Go
func Len8(x uint8) int
```

Len8 returns the minimum number of bits required to represent x; the result is 0 for x == 0. 

### <a id="OnesCount64" href="#OnesCount64">func OnesCount64(x uint64) int</a>

```
searchKey: sys.OnesCount64
tags: [function]
```

```Go
func OnesCount64(x uint64) int
```

OnesCount64 returns the number of one bits ("population count") in x. 

### <a id="TrailingZeros64" href="#TrailingZeros64">func TrailingZeros64(x uint64) int</a>

```
searchKey: sys.TrailingZeros64
tags: [function]
```

```Go
func TrailingZeros64(x uint64) int
```

TrailingZeros64 returns the number of trailing zero bits in x; the result is 64 for x == 0. 

### <a id="TrailingZeros8" href="#TrailingZeros8">func TrailingZeros8(x uint8) int</a>

```
searchKey: sys.TrailingZeros8
tags: [function]
```

```Go
func TrailingZeros8(x uint8) int
```

TrailingZeros8 returns the number of trailing zero bits in x; the result is 8 for x == 0. 

