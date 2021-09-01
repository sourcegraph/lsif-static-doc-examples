# Package cpu

Package cpu implements processor feature detection used by the Go standard library. 

## Index

* [Constants](#const)
    * [const CacheLinePadSize](#CacheLinePadSize)
    * [const GOARCH](#GOARCH)
    * [const cpuid_ADX](#cpuid_ADX)
    * [const cpuid_AES](#cpuid_AES)
    * [const cpuid_AVX](#cpuid_AVX)
    * [const cpuid_AVX2](#cpuid_AVX2)
    * [const cpuid_BMI1](#cpuid_BMI1)
    * [const cpuid_BMI2](#cpuid_BMI2)
    * [const cpuid_ERMS](#cpuid_ERMS)
    * [const cpuid_FMA](#cpuid_FMA)
    * [const cpuid_OSXSAVE](#cpuid_OSXSAVE)
    * [const cpuid_PCLMULQDQ](#cpuid_PCLMULQDQ)
    * [const cpuid_POPCNT](#cpuid_POPCNT)
    * [const cpuid_SSE2](#cpuid_SSE2)
    * [const cpuid_SSE3](#cpuid_SSE3)
    * [const cpuid_SSE41](#cpuid_SSE41)
    * [const cpuid_SSE42](#cpuid_SSE42)
    * [const cpuid_SSSE3](#cpuid_SSSE3)
* [Variables](#var)
    * [var ARM](#ARM)
    * [var ARM64](#ARM64)
    * [var CacheLineSize](#CacheLineSize)
    * [var DebugOptions](#DebugOptions)
    * [var MIPS64X](#MIPS64X)
    * [var Options](#Options)
    * [var PPC64](#PPC64)
    * [var S390X](#S390X)
    * [var X86](#X86)
    * [var maxExtendedFunctionInformation](#maxExtendedFunctionInformation)
    * [var options](#options)
* [Types](#type)
    * [type CacheLinePad struct](#CacheLinePad)
    * [type option struct](#option)
* [Functions](#func)
    * [func Initialize(env string)](#Initialize)
    * [func Name() string](#Name)
    * [func appendBytes(b []byte, args ...uint32) []byte](#appendBytes)
    * [func cpuid(eaxArg, ecxArg uint32) (eax, ebx, ecx, edx uint32)](#cpuid)
    * [func doinit()](#doinit)
    * [func indexByte(s string, c byte) int](#indexByte)
    * [func isSet(hwc uint32, value uint32) bool](#isSet)
    * [func processOptions(env string)](#processOptions)
    * [func xgetbv() (eax, edx uint32)](#xgetbv)


## <a id="const" href="#const">Constants</a>

```
tags: [private]
```

### <a id="CacheLinePadSize" href="#CacheLinePadSize">const CacheLinePadSize</a>

```
searchKey: cpu.CacheLinePadSize
tags: [constant number]
```

```Go
const CacheLinePadSize = 64
```

### <a id="GOARCH" href="#GOARCH">const GOARCH</a>

```
searchKey: cpu.GOARCH
tags: [constant string]
```

```Go
const GOARCH = "amd64"
```

### <a id="cpuid_ADX" href="#cpuid_ADX">const cpuid_ADX</a>

```
searchKey: cpu.cpuid_ADX
tags: [constant number private]
```

```Go
const cpuid_ADX = 1 << 19
```

### <a id="cpuid_AES" href="#cpuid_AES">const cpuid_AES</a>

```
searchKey: cpu.cpuid_AES
tags: [constant number private]
```

```Go
const cpuid_AES = 1 << 25
```

### <a id="cpuid_AVX" href="#cpuid_AVX">const cpuid_AVX</a>

```
searchKey: cpu.cpuid_AVX
tags: [constant number private]
```

```Go
const cpuid_AVX = 1 << 28
```

### <a id="cpuid_AVX2" href="#cpuid_AVX2">const cpuid_AVX2</a>

```
searchKey: cpu.cpuid_AVX2
tags: [constant number private]
```

```Go
const cpuid_AVX2 = 1 << 5
```

### <a id="cpuid_BMI1" href="#cpuid_BMI1">const cpuid_BMI1</a>

```
searchKey: cpu.cpuid_BMI1
tags: [constant number private]
```

```Go
const cpuid_BMI1 = 1 << 3
```

ebx bits 

### <a id="cpuid_BMI2" href="#cpuid_BMI2">const cpuid_BMI2</a>

```
searchKey: cpu.cpuid_BMI2
tags: [constant number private]
```

```Go
const cpuid_BMI2 = 1 << 8
```

### <a id="cpuid_ERMS" href="#cpuid_ERMS">const cpuid_ERMS</a>

```
searchKey: cpu.cpuid_ERMS
tags: [constant number private]
```

```Go
const cpuid_ERMS = 1 << 9
```

### <a id="cpuid_FMA" href="#cpuid_FMA">const cpuid_FMA</a>

```
searchKey: cpu.cpuid_FMA
tags: [constant number private]
```

```Go
const cpuid_FMA = 1 << 12
```

### <a id="cpuid_OSXSAVE" href="#cpuid_OSXSAVE">const cpuid_OSXSAVE</a>

```
searchKey: cpu.cpuid_OSXSAVE
tags: [constant number private]
```

```Go
const cpuid_OSXSAVE = 1 << 27
```

### <a id="cpuid_PCLMULQDQ" href="#cpuid_PCLMULQDQ">const cpuid_PCLMULQDQ</a>

```
searchKey: cpu.cpuid_PCLMULQDQ
tags: [constant number private]
```

```Go
const cpuid_PCLMULQDQ = 1 << 1
```

### <a id="cpuid_POPCNT" href="#cpuid_POPCNT">const cpuid_POPCNT</a>

```
searchKey: cpu.cpuid_POPCNT
tags: [constant number private]
```

```Go
const cpuid_POPCNT = 1 << 23
```

### <a id="cpuid_SSE2" href="#cpuid_SSE2">const cpuid_SSE2</a>

```
searchKey: cpu.cpuid_SSE2
tags: [constant number private]
```

```Go
const cpuid_SSE2 = 1 << 26
```

edx bits 

### <a id="cpuid_SSE3" href="#cpuid_SSE3">const cpuid_SSE3</a>

```
searchKey: cpu.cpuid_SSE3
tags: [constant number private]
```

```Go
const cpuid_SSE3 = 1 << 0
```

ecx bits 

### <a id="cpuid_SSE41" href="#cpuid_SSE41">const cpuid_SSE41</a>

```
searchKey: cpu.cpuid_SSE41
tags: [constant number private]
```

```Go
const cpuid_SSE41 = 1 << 19
```

### <a id="cpuid_SSE42" href="#cpuid_SSE42">const cpuid_SSE42</a>

```
searchKey: cpu.cpuid_SSE42
tags: [constant number private]
```

```Go
const cpuid_SSE42 = 1 << 20
```

### <a id="cpuid_SSSE3" href="#cpuid_SSSE3">const cpuid_SSSE3</a>

```
searchKey: cpu.cpuid_SSSE3
tags: [constant number private]
```

```Go
const cpuid_SSSE3 = 1 << 9
```

## <a id="var" href="#var">Variables</a>

```
tags: [private]
```

### <a id="ARM" href="#ARM">var ARM</a>

```
searchKey: cpu.ARM
tags: [variable struct]
```

```Go
var ARM struct {
	_        CacheLinePad
	HasVFPv4 bool
	HasIDIVA bool
	_        CacheLinePad
}
```

The booleans in ARM contain the correspondingly named cpu feature bit. The struct is padded to avoid false sharing. 

### <a id="ARM64" href="#ARM64">var ARM64</a>

```
searchKey: cpu.ARM64
tags: [variable struct]
```

```Go
var ARM64 struct {
	_            CacheLinePad
	HasAES       bool
	HasPMULL     bool
	HasSHA1      bool
	HasSHA2      bool
	HasCRC32     bool
	HasATOMICS   bool
	HasCPUID     bool
	IsNeoverseN1 bool
	IsZeus       bool
	_            CacheLinePad
} = ...
```

The booleans in ARM64 contain the correspondingly named cpu feature bit. The struct is padded to avoid false sharing. 

### <a id="CacheLineSize" href="#CacheLineSize">var CacheLineSize</a>

```
searchKey: cpu.CacheLineSize
tags: [variable number]
```

```Go
var CacheLineSize uintptr = CacheLinePadSize
```

CacheLineSize is the CPU's assumed cache line size. There is currently no runtime detection of the real cache line size so we use the constant per GOARCH CacheLinePadSize as an approximation. 

### <a id="DebugOptions" href="#DebugOptions">var DebugOptions</a>

```
searchKey: cpu.DebugOptions
tags: [variable boolean]
```

```Go
var DebugOptions bool
```

DebugOptions is set to true by the runtime if the OS supports reading GODEBUG early in runtime startup. This should not be changed after it is initialized. 

### <a id="MIPS64X" href="#MIPS64X">var MIPS64X</a>

```
searchKey: cpu.MIPS64X
tags: [variable struct]
```

```Go
var MIPS64X struct {
	_      CacheLinePad
	HasMSA bool // MIPS SIMD architecture
	_      CacheLinePad
} = ...
```

### <a id="Options" href="#Options">var Options</a>

```
searchKey: cpu.Options
tags: [variable array struct private]
```

```Go
var Options = options
```

### <a id="PPC64" href="#PPC64">var PPC64</a>

```
searchKey: cpu.PPC64
tags: [variable struct]
```

```Go
var PPC64 struct {
	_        CacheLinePad
	HasDARN  bool // Hardware random number generator (requires kernel enablement)
	HasSCV   bool // Syscall vectored (requires kernel enablement)
	IsPOWER8 bool // ISA v2.07 (POWER8)
	IsPOWER9 bool // ISA v3.00 (POWER9)
	_        CacheLinePad
} = ...
```

For ppc64(le), it is safe to check only for ISA level starting on ISA v3.00, since there are no optional categories. There are some exceptions that also require kernel support to work (darn, scv), so there are feature bits for those as well. The minimum processor requirement is POWER8 (ISA 2.07). The struct is padded to avoid false sharing. 

### <a id="S390X" href="#S390X">var S390X</a>

```
searchKey: cpu.S390X
tags: [variable struct]
```

```Go
var S390X struct {
	_         CacheLinePad
	HasZARCH  bool // z architecture mode is active [mandatory]
	HasSTFLE  bool // store facility list extended [mandatory]
	HasLDISP  bool // long (20-bit) displacements [mandatory]
	HasEIMM   bool // 32-bit immediates [mandatory]
	HasDFP    bool // decimal floating point
	HasETF3EH bool // ETF-3 enhanced
	HasMSA    bool // message security assist (CPACF)
	HasAES    bool // KM-AES{128,192,256} functions
	HasAESCBC bool // KMC-AES{128,192,256} functions
	HasAESCTR bool // KMCTR-AES{128,192,256} functions
	HasAESGCM bool // KMA-GCM-AES{128,192,256} functions
	HasGHASH  bool // KIMD-GHASH function
	HasSHA1   bool // K{I,L}MD-SHA-1 functions
	HasSHA256 bool // K{I,L}MD-SHA-256 functions
	HasSHA512 bool // K{I,L}MD-SHA-512 functions
	HasSHA3   bool // K{I,L}MD-SHA3-{224,256,384,512} and K{I,L}MD-SHAKE-{128,256} functions
	HasVX     bool // vector facility. Note: the runtime sets this when it processes auxv records.
	HasVXE    bool // vector-enhancements facility 1
	HasKDSA   bool // elliptic curve functions
	HasECDSA  bool // NIST curves
	HasEDDSA  bool // Edwards curves
	_         CacheLinePad
} = ...
```

### <a id="X86" href="#X86">var X86</a>

```
searchKey: cpu.X86
tags: [variable struct]
```

```Go
var X86 struct {
	_            CacheLinePad
	HasAES       bool
	HasADX       bool
	HasAVX       bool
	HasAVX2      bool
	HasBMI1      bool
	HasBMI2      bool
	HasERMS      bool
	HasFMA       bool
	HasOSXSAVE   bool
	HasPCLMULQDQ bool
	HasPOPCNT    bool
	HasSSE2      bool
	HasSSE3      bool
	HasSSSE3     bool
	HasSSE41     bool
	HasSSE42     bool
	_            CacheLinePad
} = ...
```

The booleans in X86 contain the correspondingly named cpuid feature bit. HasAVX and HasAVX2 are only set if the OS does support XMM and YMM registers in addition to the cpuid feature bit being set. The struct is padded to avoid false sharing. 

### <a id="maxExtendedFunctionInformation" href="#maxExtendedFunctionInformation">var maxExtendedFunctionInformation</a>

```
searchKey: cpu.maxExtendedFunctionInformation
tags: [variable number private]
```

```Go
var maxExtendedFunctionInformation uint32
```

### <a id="options" href="#options">var options</a>

```
searchKey: cpu.options
tags: [variable array struct private]
```

```Go
var options []option
```

options contains the cpu debug options that can be used in GODEBUG. Options are arch dependent and are added by the arch specific doinit functions. Features that are mandatory for the specific GOARCH should not be added to options (e.g. SSE2 on amd64). 

## <a id="type" href="#type">Types</a>

```
tags: [private]
```

### <a id="CacheLinePad" href="#CacheLinePad">type CacheLinePad struct</a>

```
searchKey: cpu.CacheLinePad
tags: [struct]
```

```Go
type CacheLinePad struct{ _ [CacheLinePadSize]byte }
```

CacheLinePad is used to pad structs to avoid false sharing. 

### <a id="option" href="#option">type option struct</a>

```
searchKey: cpu.option
tags: [struct private]
```

```Go
type option struct {
	Name      string
	Feature   *bool
	Specified bool // whether feature value was specified in GODEBUG
	Enable    bool // whether feature should be enabled
	Required  bool // whether feature is mandatory and can not be disabled
}
```

Option names should be lower case. e.g. avx instead of AVX. 

## <a id="func" href="#func">Functions</a>

```
tags: [private]
```

### <a id="Initialize" href="#Initialize">func Initialize(env string)</a>

```
searchKey: cpu.Initialize
tags: [function]
```

```Go
func Initialize(env string)
```

Initialize examines the processor and sets the relevant variables above. This is called by the runtime package early in program initialization, before normal init functions are run. env is set by runtime if the OS supports cpu feature options in GODEBUG. 

### <a id="Name" href="#Name">func Name() string</a>

```
searchKey: cpu.Name
tags: [function]
```

```Go
func Name() string
```

Name returns the CPU name given by the vendor. If the CPU name can not be determined an empty string is returned. 

### <a id="appendBytes" href="#appendBytes">func appendBytes(b []byte, args ...uint32) []byte</a>

```
searchKey: cpu.appendBytes
tags: [function private]
```

```Go
func appendBytes(b []byte, args ...uint32) []byte
```

### <a id="cpuid" href="#cpuid">func cpuid(eaxArg, ecxArg uint32) (eax, ebx, ecx, edx uint32)</a>

```
searchKey: cpu.cpuid
tags: [function private]
```

```Go
func cpuid(eaxArg, ecxArg uint32) (eax, ebx, ecx, edx uint32)
```

cpuid is implemented in cpu_x86.s. 

### <a id="doinit" href="#doinit">func doinit()</a>

```
searchKey: cpu.doinit
tags: [function private]
```

```Go
func doinit()
```

### <a id="indexByte" href="#indexByte">func indexByte(s string, c byte) int</a>

```
searchKey: cpu.indexByte
tags: [function private]
```

```Go
func indexByte(s string, c byte) int
```

indexByte returns the index of the first instance of c in s, or -1 if c is not present in s. 

### <a id="isSet" href="#isSet">func isSet(hwc uint32, value uint32) bool</a>

```
searchKey: cpu.isSet
tags: [function private]
```

```Go
func isSet(hwc uint32, value uint32) bool
```

### <a id="processOptions" href="#processOptions">func processOptions(env string)</a>

```
searchKey: cpu.processOptions
tags: [function private]
```

```Go
func processOptions(env string)
```

processOptions enables or disables CPU feature values based on the parsed env string. The env string is expected to be of the form cpu.feature1=value1,cpu.feature2=value2... where feature names is one of the architecture specific list stored in the cpu packages options variable and values are either 'on' or 'off'. If env contains cpu.all=off then all cpu features referenced through the options variable are disabled. Other feature names and values result in warning messages. 

### <a id="xgetbv" href="#xgetbv">func xgetbv() (eax, edx uint32)</a>

```
searchKey: cpu.xgetbv
tags: [function private]
```

```Go
func xgetbv() (eax, edx uint32)
```

xgetbv with ecx = 0 is implemented in cpu_x86.s. 

