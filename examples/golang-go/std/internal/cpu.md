# Package cpu

Package cpu implements processor feature detection used by the Go standard library. 

## Index

* [Constants](#const)
    * [const GOARCH](#GOARCH)
    * [const CacheLinePadSize](#CacheLinePadSize)
    * [const cpuid_SSE2](#cpuid_SSE2)
    * [const cpuid_SSE3](#cpuid_SSE3)
    * [const cpuid_PCLMULQDQ](#cpuid_PCLMULQDQ)
    * [const cpuid_SSSE3](#cpuid_SSSE3)
    * [const cpuid_FMA](#cpuid_FMA)
    * [const cpuid_SSE41](#cpuid_SSE41)
    * [const cpuid_SSE42](#cpuid_SSE42)
    * [const cpuid_POPCNT](#cpuid_POPCNT)
    * [const cpuid_AES](#cpuid_AES)
    * [const cpuid_OSXSAVE](#cpuid_OSXSAVE)
    * [const cpuid_AVX](#cpuid_AVX)
    * [const cpuid_BMI1](#cpuid_BMI1)
    * [const cpuid_AVX2](#cpuid_AVX2)
    * [const cpuid_BMI2](#cpuid_BMI2)
    * [const cpuid_ERMS](#cpuid_ERMS)
    * [const cpuid_ADX](#cpuid_ADX)
* [Variables](#var)
    * [var DebugOptions](#DebugOptions)
    * [var CacheLineSize](#CacheLineSize)
    * [var X86](#X86)
    * [var ARM](#ARM)
    * [var ARM64](#ARM64)
    * [var MIPS64X](#MIPS64X)
    * [var PPC64](#PPC64)
    * [var S390X](#S390X)
    * [var options](#options)
    * [var maxExtendedFunctionInformation](#maxExtendedFunctionInformation)
    * [var Options](#Options)
* [Types](#type)
    * [type CacheLinePad struct](#CacheLinePad)
    * [type option struct](#option)
* [Functions](#func)
    * [func Initialize(env string)](#Initialize)
    * [func processOptions(env string)](#processOptions)
    * [func indexByte(s string, c byte) int](#indexByte)
    * [func cpuid(eaxArg, ecxArg uint32) (eax, ebx, ecx, edx uint32)](#cpuid)
    * [func xgetbv() (eax, edx uint32)](#xgetbv)
    * [func doinit()](#doinit)
    * [func isSet(hwc uint32, value uint32) bool](#isSet)
    * [func Name() string](#Name)
    * [func appendBytes(b []byte, args ...uint32) []byte](#appendBytes)


## <a id="const" href="#const">Constants</a>

### <a id="GOARCH" href="#GOARCH">const GOARCH</a>

```
searchKey: cpu.GOARCH
tags: [exported]
```

```Go
const GOARCH = "amd64"
```

### <a id="CacheLinePadSize" href="#CacheLinePadSize">const CacheLinePadSize</a>

```
searchKey: cpu.CacheLinePadSize
tags: [exported]
```

```Go
const CacheLinePadSize = 64
```

### <a id="cpuid_SSE2" href="#cpuid_SSE2">const cpuid_SSE2</a>

```
searchKey: cpu.cpuid_SSE2
```

```Go
const cpuid_SSE2 = 1 << 26
```

edx bits 

### <a id="cpuid_SSE3" href="#cpuid_SSE3">const cpuid_SSE3</a>

```
searchKey: cpu.cpuid_SSE3
```

```Go
const cpuid_SSE3 = 1 << 0
```

ecx bits 

### <a id="cpuid_PCLMULQDQ" href="#cpuid_PCLMULQDQ">const cpuid_PCLMULQDQ</a>

```
searchKey: cpu.cpuid_PCLMULQDQ
```

```Go
const cpuid_PCLMULQDQ = 1 << 1
```

### <a id="cpuid_SSSE3" href="#cpuid_SSSE3">const cpuid_SSSE3</a>

```
searchKey: cpu.cpuid_SSSE3
```

```Go
const cpuid_SSSE3 = 1 << 9
```

### <a id="cpuid_FMA" href="#cpuid_FMA">const cpuid_FMA</a>

```
searchKey: cpu.cpuid_FMA
```

```Go
const cpuid_FMA = 1 << 12
```

### <a id="cpuid_SSE41" href="#cpuid_SSE41">const cpuid_SSE41</a>

```
searchKey: cpu.cpuid_SSE41
```

```Go
const cpuid_SSE41 = 1 << 19
```

### <a id="cpuid_SSE42" href="#cpuid_SSE42">const cpuid_SSE42</a>

```
searchKey: cpu.cpuid_SSE42
```

```Go
const cpuid_SSE42 = 1 << 20
```

### <a id="cpuid_POPCNT" href="#cpuid_POPCNT">const cpuid_POPCNT</a>

```
searchKey: cpu.cpuid_POPCNT
```

```Go
const cpuid_POPCNT = 1 << 23
```

### <a id="cpuid_AES" href="#cpuid_AES">const cpuid_AES</a>

```
searchKey: cpu.cpuid_AES
```

```Go
const cpuid_AES = 1 << 25
```

### <a id="cpuid_OSXSAVE" href="#cpuid_OSXSAVE">const cpuid_OSXSAVE</a>

```
searchKey: cpu.cpuid_OSXSAVE
```

```Go
const cpuid_OSXSAVE = 1 << 27
```

### <a id="cpuid_AVX" href="#cpuid_AVX">const cpuid_AVX</a>

```
searchKey: cpu.cpuid_AVX
```

```Go
const cpuid_AVX = 1 << 28
```

### <a id="cpuid_BMI1" href="#cpuid_BMI1">const cpuid_BMI1</a>

```
searchKey: cpu.cpuid_BMI1
```

```Go
const cpuid_BMI1 = 1 << 3
```

ebx bits 

### <a id="cpuid_AVX2" href="#cpuid_AVX2">const cpuid_AVX2</a>

```
searchKey: cpu.cpuid_AVX2
```

```Go
const cpuid_AVX2 = 1 << 5
```

### <a id="cpuid_BMI2" href="#cpuid_BMI2">const cpuid_BMI2</a>

```
searchKey: cpu.cpuid_BMI2
```

```Go
const cpuid_BMI2 = 1 << 8
```

### <a id="cpuid_ERMS" href="#cpuid_ERMS">const cpuid_ERMS</a>

```
searchKey: cpu.cpuid_ERMS
```

```Go
const cpuid_ERMS = 1 << 9
```

### <a id="cpuid_ADX" href="#cpuid_ADX">const cpuid_ADX</a>

```
searchKey: cpu.cpuid_ADX
```

```Go
const cpuid_ADX = 1 << 19
```

## <a id="var" href="#var">Variables</a>

### <a id="DebugOptions" href="#DebugOptions">var DebugOptions</a>

```
searchKey: cpu.DebugOptions
tags: [exported]
```

```Go
var DebugOptions bool
```

DebugOptions is set to true by the runtime if the OS supports reading GODEBUG early in runtime startup. This should not be changed after it is initialized. 

### <a id="CacheLineSize" href="#CacheLineSize">var CacheLineSize</a>

```
searchKey: cpu.CacheLineSize
tags: [exported]
```

```Go
var CacheLineSize uintptr = CacheLinePadSize
```

CacheLineSize is the CPU's assumed cache line size. There is currently no runtime detection of the real cache line size so we use the constant per GOARCH CacheLinePadSize as an approximation. 

### <a id="X86" href="#X86">var X86</a>

```
searchKey: cpu.X86
tags: [exported]
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

### <a id="ARM" href="#ARM">var ARM</a>

```
searchKey: cpu.ARM
tags: [exported]
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
tags: [exported]
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

### <a id="MIPS64X" href="#MIPS64X">var MIPS64X</a>

```
searchKey: cpu.MIPS64X
tags: [exported]
```

```Go
var MIPS64X struct {
	_      CacheLinePad
	HasMSA bool // MIPS SIMD architecture
	_      CacheLinePad
} = ...
```

### <a id="PPC64" href="#PPC64">var PPC64</a>

```
searchKey: cpu.PPC64
tags: [exported]
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
tags: [exported]
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

### <a id="options" href="#options">var options</a>

```
searchKey: cpu.options
```

```Go
var options []option
```

options contains the cpu debug options that can be used in GODEBUG. Options are arch dependent and are added by the arch specific doinit functions. Features that are mandatory for the specific GOARCH should not be added to options (e.g. SSE2 on amd64). 

### <a id="maxExtendedFunctionInformation" href="#maxExtendedFunctionInformation">var maxExtendedFunctionInformation</a>

```
searchKey: cpu.maxExtendedFunctionInformation
```

```Go
var maxExtendedFunctionInformation uint32
```

### <a id="Options" href="#Options">var Options</a>

```
searchKey: cpu.Options
```

```Go
var Options = options
```

## <a id="type" href="#type">Types</a>

### <a id="CacheLinePad" href="#CacheLinePad">type CacheLinePad struct</a>

```
searchKey: cpu.CacheLinePad
tags: [exported]
```

```Go
type CacheLinePad struct{ _ [CacheLinePadSize]byte }
```

CacheLinePad is used to pad structs to avoid false sharing. 

### <a id="option" href="#option">type option struct</a>

```
searchKey: cpu.option
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

### <a id="Initialize" href="#Initialize">func Initialize(env string)</a>

```
searchKey: cpu.Initialize
tags: [exported]
```

```Go
func Initialize(env string)
```

Initialize examines the processor and sets the relevant variables above. This is called by the runtime package early in program initialization, before normal init functions are run. env is set by runtime if the OS supports cpu feature options in GODEBUG. 

### <a id="processOptions" href="#processOptions">func processOptions(env string)</a>

```
searchKey: cpu.processOptions
```

```Go
func processOptions(env string)
```

processOptions enables or disables CPU feature values based on the parsed env string. The env string is expected to be of the form cpu.feature1=value1,cpu.feature2=value2... where feature names is one of the architecture specific list stored in the cpu packages options variable and values are either 'on' or 'off'. If env contains cpu.all=off then all cpu features referenced through the options variable are disabled. Other feature names and values result in warning messages. 

### <a id="indexByte" href="#indexByte">func indexByte(s string, c byte) int</a>

```
searchKey: cpu.indexByte
```

```Go
func indexByte(s string, c byte) int
```

indexByte returns the index of the first instance of c in s, or -1 if c is not present in s. 

### <a id="cpuid" href="#cpuid">func cpuid(eaxArg, ecxArg uint32) (eax, ebx, ecx, edx uint32)</a>

```
searchKey: cpu.cpuid
```

```Go
func cpuid(eaxArg, ecxArg uint32) (eax, ebx, ecx, edx uint32)
```

cpuid is implemented in cpu_x86.s. 

### <a id="xgetbv" href="#xgetbv">func xgetbv() (eax, edx uint32)</a>

```
searchKey: cpu.xgetbv
```

```Go
func xgetbv() (eax, edx uint32)
```

xgetbv with ecx = 0 is implemented in cpu_x86.s. 

### <a id="doinit" href="#doinit">func doinit()</a>

```
searchKey: cpu.doinit
```

```Go
func doinit()
```

### <a id="isSet" href="#isSet">func isSet(hwc uint32, value uint32) bool</a>

```
searchKey: cpu.isSet
```

```Go
func isSet(hwc uint32, value uint32) bool
```

### <a id="Name" href="#Name">func Name() string</a>

```
searchKey: cpu.Name
tags: [exported]
```

```Go
func Name() string
```

Name returns the CPU name given by the vendor. If the CPU name can not be determined an empty string is returned. 

### <a id="appendBytes" href="#appendBytes">func appendBytes(b []byte, args ...uint32) []byte</a>

```
searchKey: cpu.appendBytes
```

```Go
func appendBytes(b []byte, args ...uint32) []byte
```

