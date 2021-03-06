# Package macho

Package macho implements access to Mach-O object files. 

## Index

* [Constants](#const)
    * [const ARM64_RELOC_ADDEND](#ARM64_RELOC_ADDEND)
    * [const ARM64_RELOC_BRANCH26](#ARM64_RELOC_BRANCH26)
    * [const ARM64_RELOC_GOT_LOAD_PAGE21](#ARM64_RELOC_GOT_LOAD_PAGE21)
    * [const ARM64_RELOC_GOT_LOAD_PAGEOFF12](#ARM64_RELOC_GOT_LOAD_PAGEOFF12)
    * [const ARM64_RELOC_PAGE21](#ARM64_RELOC_PAGE21)
    * [const ARM64_RELOC_PAGEOFF12](#ARM64_RELOC_PAGEOFF12)
    * [const ARM64_RELOC_POINTER_TO_GOT](#ARM64_RELOC_POINTER_TO_GOT)
    * [const ARM64_RELOC_SUBTRACTOR](#ARM64_RELOC_SUBTRACTOR)
    * [const ARM64_RELOC_TLVP_LOAD_PAGE21](#ARM64_RELOC_TLVP_LOAD_PAGE21)
    * [const ARM64_RELOC_TLVP_LOAD_PAGEOFF12](#ARM64_RELOC_TLVP_LOAD_PAGEOFF12)
    * [const ARM64_RELOC_UNSIGNED](#ARM64_RELOC_UNSIGNED)
    * [const ARM_RELOC_BR24](#ARM_RELOC_BR24)
    * [const ARM_RELOC_HALF](#ARM_RELOC_HALF)
    * [const ARM_RELOC_HALF_SECTDIFF](#ARM_RELOC_HALF_SECTDIFF)
    * [const ARM_RELOC_LOCAL_SECTDIFF](#ARM_RELOC_LOCAL_SECTDIFF)
    * [const ARM_RELOC_PAIR](#ARM_RELOC_PAIR)
    * [const ARM_RELOC_PB_LA_PTR](#ARM_RELOC_PB_LA_PTR)
    * [const ARM_RELOC_SECTDIFF](#ARM_RELOC_SECTDIFF)
    * [const ARM_RELOC_VANILLA](#ARM_RELOC_VANILLA)
    * [const ARM_THUMB_32BIT_BRANCH](#ARM_THUMB_32BIT_BRANCH)
    * [const ARM_THUMB_RELOC_BR22](#ARM_THUMB_RELOC_BR22)
    * [const Cpu386](#Cpu386)
    * [const CpuAmd64](#CpuAmd64)
    * [const CpuArm](#CpuArm)
    * [const CpuArm64](#CpuArm64)
    * [const CpuPpc](#CpuPpc)
    * [const CpuPpc64](#CpuPpc64)
    * [const FlagAllModsBound](#FlagAllModsBound)
    * [const FlagAllowStackExecution](#FlagAllowStackExecution)
    * [const FlagAppExtensionSafe](#FlagAppExtensionSafe)
    * [const FlagBindAtLoad](#FlagBindAtLoad)
    * [const FlagBindsToWeak](#FlagBindsToWeak)
    * [const FlagCanonical](#FlagCanonical)
    * [const FlagDeadStrippableDylib](#FlagDeadStrippableDylib)
    * [const FlagDyldLink](#FlagDyldLink)
    * [const FlagForceFlat](#FlagForceFlat)
    * [const FlagHasTLVDescriptors](#FlagHasTLVDescriptors)
    * [const FlagIncrLink](#FlagIncrLink)
    * [const FlagLazyInit](#FlagLazyInit)
    * [const FlagNoFixPrebinding](#FlagNoFixPrebinding)
    * [const FlagNoHeapExecution](#FlagNoHeapExecution)
    * [const FlagNoMultiDefs](#FlagNoMultiDefs)
    * [const FlagNoReexportedDylibs](#FlagNoReexportedDylibs)
    * [const FlagNoUndefs](#FlagNoUndefs)
    * [const FlagPIE](#FlagPIE)
    * [const FlagPrebindable](#FlagPrebindable)
    * [const FlagPrebound](#FlagPrebound)
    * [const FlagRootSafe](#FlagRootSafe)
    * [const FlagSetuidSafe](#FlagSetuidSafe)
    * [const FlagSplitSegs](#FlagSplitSegs)
    * [const FlagSubsectionsViaSymbols](#FlagSubsectionsViaSymbols)
    * [const FlagTwoLevel](#FlagTwoLevel)
    * [const FlagWeakDefines](#FlagWeakDefines)
    * [const GENERIC_RELOC_LOCAL_SECTDIFF](#GENERIC_RELOC_LOCAL_SECTDIFF)
    * [const GENERIC_RELOC_PAIR](#GENERIC_RELOC_PAIR)
    * [const GENERIC_RELOC_PB_LA_PTR](#GENERIC_RELOC_PB_LA_PTR)
    * [const GENERIC_RELOC_SECTDIFF](#GENERIC_RELOC_SECTDIFF)
    * [const GENERIC_RELOC_TLV](#GENERIC_RELOC_TLV)
    * [const GENERIC_RELOC_VANILLA](#GENERIC_RELOC_VANILLA)
    * [const LoadCmdDylib](#LoadCmdDylib)
    * [const LoadCmdDylinker](#LoadCmdDylinker)
    * [const LoadCmdDysymtab](#LoadCmdDysymtab)
    * [const LoadCmdRpath](#LoadCmdRpath)
    * [const LoadCmdSegment](#LoadCmdSegment)
    * [const LoadCmdSegment64](#LoadCmdSegment64)
    * [const LoadCmdSymtab](#LoadCmdSymtab)
    * [const LoadCmdThread](#LoadCmdThread)
    * [const LoadCmdUnixThread](#LoadCmdUnixThread)
    * [const Magic32](#Magic32)
    * [const Magic64](#Magic64)
    * [const MagicFat](#MagicFat)
    * [const TypeBundle](#TypeBundle)
    * [const TypeDylib](#TypeDylib)
    * [const TypeExec](#TypeExec)
    * [const TypeObj](#TypeObj)
    * [const X86_64_RELOC_BRANCH](#X86_64_RELOC_BRANCH)
    * [const X86_64_RELOC_GOT](#X86_64_RELOC_GOT)
    * [const X86_64_RELOC_GOT_LOAD](#X86_64_RELOC_GOT_LOAD)
    * [const X86_64_RELOC_SIGNED](#X86_64_RELOC_SIGNED)
    * [const X86_64_RELOC_SIGNED_1](#X86_64_RELOC_SIGNED_1)
    * [const X86_64_RELOC_SIGNED_2](#X86_64_RELOC_SIGNED_2)
    * [const X86_64_RELOC_SIGNED_4](#X86_64_RELOC_SIGNED_4)
    * [const X86_64_RELOC_SUBTRACTOR](#X86_64_RELOC_SUBTRACTOR)
    * [const X86_64_RELOC_TLV](#X86_64_RELOC_TLV)
    * [const X86_64_RELOC_UNSIGNED](#X86_64_RELOC_UNSIGNED)
    * [const cpuArch64](#cpuArch64)
    * [const fatArchHeaderSize](#fatArchHeaderSize)
    * [const fileHeaderSize32](#fileHeaderSize32)
    * [const fileHeaderSize64](#fileHeaderSize64)
    * [const _RelocTypeARM64_name](#_RelocTypeARM64_name)
    * [const _RelocTypeARM_name](#_RelocTypeARM_name)
    * [const _RelocTypeGeneric_name](#_RelocTypeGeneric_name)
    * [const _RelocTypeX86_64_name](#_RelocTypeX86_64_name)
* [Variables](#var)
    * [var ErrNotFat](#ErrNotFat)
    * [var cmdStrings](#cmdStrings)
    * [var cpuStrings](#cpuStrings)
    * [var fileTests](#fileTests)
    * [var typeStrings](#typeStrings)
    * [var _RelocTypeARM64_index](#_RelocTypeARM64_index)
    * [var _RelocTypeARM_index](#_RelocTypeARM_index)
    * [var _RelocTypeGeneric_index](#_RelocTypeGeneric_index)
    * [var _RelocTypeX86_64_index](#_RelocTypeX86_64_index)
* [Types](#type)
    * [type Cpu uint32](#Cpu)
        * [func (i Cpu) GoString() string](#Cpu.GoString)
        * [func (i Cpu) String() string](#Cpu.String)
    * [type Dylib struct](#Dylib)
    * [type DylibCmd struct](#DylibCmd)
    * [type Dysymtab struct](#Dysymtab)
    * [type DysymtabCmd struct](#DysymtabCmd)
    * [type FatArch struct](#FatArch)
    * [type FatArchHeader struct](#FatArchHeader)
    * [type FatFile struct](#FatFile)
        * [func NewFatFile(r io.ReaderAt) (*FatFile, error)](#NewFatFile)
        * [func OpenFat(name string) (*FatFile, error)](#OpenFat)
        * [func openFatObscured(name string) (*FatFile, error)](#openFatObscured)
        * [func (ff *FatFile) Close() error](#FatFile.Close)
    * [type File struct](#File)
        * [func NewFile(r io.ReaderAt) (*File, error)](#NewFile)
        * [func Open(name string) (*File, error)](#Open)
        * [func openObscured(name string) (*File, error)](#openObscured)
        * [func (f *File) Close() error](#File.Close)
        * [func (f *File) DWARF() (*dwarf.Data, error)](#File.DWARF)
        * [func (f *File) ImportedLibraries() ([]string, error)](#File.ImportedLibraries)
        * [func (f *File) ImportedSymbols() ([]string, error)](#File.ImportedSymbols)
        * [func (f *File) Section(name string) *Section](#File.Section)
        * [func (f *File) Segment(name string) *Segment](#File.Segment)
        * [func (f *File) parseSymtab(symdat, strtab, cmddat []byte, hdr *SymtabCmd, offset int64) (*Symtab, error)](#File.parseSymtab)
        * [func (f *File) pushSection(sh *Section, r io.ReaderAt) error](#File.pushSection)
    * [type FileHeader struct](#FileHeader)
    * [type FormatError struct](#FormatError)
        * [func (e *FormatError) Error() string](#FormatError.Error)
    * [type Load interface](#Load)
    * [type LoadBytes []byte](#LoadBytes)
        * [func (b LoadBytes) Raw() []byte](#LoadBytes.Raw)
    * [type LoadCmd uint32](#LoadCmd)
        * [func (i LoadCmd) GoString() string](#LoadCmd.GoString)
        * [func (i LoadCmd) String() string](#LoadCmd.String)
    * [type Nlist32 struct](#Nlist32)
    * [type Nlist64 struct](#Nlist64)
    * [type Regs386 struct](#Regs386)
    * [type RegsAMD64 struct](#RegsAMD64)
    * [type Reloc struct](#Reloc)
    * [type RelocTypeARM int](#RelocTypeARM)
        * [func (r RelocTypeARM) GoString() string](#RelocTypeARM.GoString)
        * [func (i RelocTypeARM) String() string](#RelocTypeARM.String)
    * [type RelocTypeARM64 int](#RelocTypeARM64)
        * [func (r RelocTypeARM64) GoString() string](#RelocTypeARM64.GoString)
        * [func (i RelocTypeARM64) String() string](#RelocTypeARM64.String)
    * [type RelocTypeGeneric int](#RelocTypeGeneric)
        * [func (r RelocTypeGeneric) GoString() string](#RelocTypeGeneric.GoString)
        * [func (i RelocTypeGeneric) String() string](#RelocTypeGeneric.String)
    * [type RelocTypeX86_64 int](#RelocTypeX86_64)
        * [func (r RelocTypeX86_64) GoString() string](#RelocTypeX86_64.GoString)
        * [func (i RelocTypeX86_64) String() string](#RelocTypeX86_64.String)
    * [type Rpath struct](#Rpath)
    * [type RpathCmd struct](#RpathCmd)
    * [type Section struct](#Section)
        * [func (s *Section) Data() ([]byte, error)](#Section.Data)
        * [func (s *Section) Open() io.ReadSeeker](#Section.Open)
    * [type Section32 struct](#Section32)
    * [type Section64 struct](#Section64)
    * [type SectionHeader struct](#SectionHeader)
    * [type Segment struct](#Segment)
        * [func (s *Segment) Data() ([]byte, error)](#Segment.Data)
        * [func (s *Segment) Open() io.ReadSeeker](#Segment.Open)
    * [type Segment32 struct](#Segment32)
    * [type Segment64 struct](#Segment64)
    * [type SegmentHeader struct](#SegmentHeader)
    * [type Symbol struct](#Symbol)
    * [type Symtab struct](#Symtab)
    * [type SymtabCmd struct](#SymtabCmd)
    * [type Thread struct](#Thread)
    * [type Type uint32](#Type)
        * [func (t Type) GoString() string](#Type.GoString)
        * [func (t Type) String() string](#Type.String)
    * [type fileTest struct](#fileTest)
    * [type intName struct](#intName)
    * [type relocInfo struct](#relocInfo)
* [Functions](#func)
    * [func TestOpen(t *testing.T)](#TestOpen)
    * [func TestOpenFailure(t *testing.T)](#TestOpenFailure)
    * [func TestOpenFat(t *testing.T)](#TestOpenFat)
    * [func TestOpenFatFailure(t *testing.T)](#TestOpenFatFailure)
    * [func TestRelocTypeString(t *testing.T)](#TestRelocTypeString)
    * [func TestTypeString(t *testing.T)](#TestTypeString)
    * [func cstring(b []byte) string](#cstring)
    * [func readerAtFromObscured(name string) (io.ReaderAt, error)](#readerAtFromObscured)
    * [func stringName(i uint32, names []intName, goSyntax bool) string](#stringName)


## <a id="const" href="#const">Constants</a>

### <a id="ARM64_RELOC_ADDEND" href="#ARM64_RELOC_ADDEND">const ARM64_RELOC_ADDEND</a>

```
searchKey: macho.ARM64_RELOC_ADDEND
tags: [constant number]
```

```Go
const ARM64_RELOC_ADDEND RelocTypeARM64 = 10
```

### <a id="ARM64_RELOC_BRANCH26" href="#ARM64_RELOC_BRANCH26">const ARM64_RELOC_BRANCH26</a>

```
searchKey: macho.ARM64_RELOC_BRANCH26
tags: [constant number]
```

```Go
const ARM64_RELOC_BRANCH26 RelocTypeARM64 = 2
```

### <a id="ARM64_RELOC_GOT_LOAD_PAGE21" href="#ARM64_RELOC_GOT_LOAD_PAGE21">const ARM64_RELOC_GOT_LOAD_PAGE21</a>

```
searchKey: macho.ARM64_RELOC_GOT_LOAD_PAGE21
tags: [constant number]
```

```Go
const ARM64_RELOC_GOT_LOAD_PAGE21 RelocTypeARM64 = 5
```

### <a id="ARM64_RELOC_GOT_LOAD_PAGEOFF12" href="#ARM64_RELOC_GOT_LOAD_PAGEOFF12">const ARM64_RELOC_GOT_LOAD_PAGEOFF12</a>

```
searchKey: macho.ARM64_RELOC_GOT_LOAD_PAGEOFF12
tags: [constant number]
```

```Go
const ARM64_RELOC_GOT_LOAD_PAGEOFF12 RelocTypeARM64 = 6
```

### <a id="ARM64_RELOC_PAGE21" href="#ARM64_RELOC_PAGE21">const ARM64_RELOC_PAGE21</a>

```
searchKey: macho.ARM64_RELOC_PAGE21
tags: [constant number]
```

```Go
const ARM64_RELOC_PAGE21 RelocTypeARM64 = 3
```

### <a id="ARM64_RELOC_PAGEOFF12" href="#ARM64_RELOC_PAGEOFF12">const ARM64_RELOC_PAGEOFF12</a>

```
searchKey: macho.ARM64_RELOC_PAGEOFF12
tags: [constant number]
```

```Go
const ARM64_RELOC_PAGEOFF12 RelocTypeARM64 = 4
```

### <a id="ARM64_RELOC_POINTER_TO_GOT" href="#ARM64_RELOC_POINTER_TO_GOT">const ARM64_RELOC_POINTER_TO_GOT</a>

```
searchKey: macho.ARM64_RELOC_POINTER_TO_GOT
tags: [constant number]
```

```Go
const ARM64_RELOC_POINTER_TO_GOT RelocTypeARM64 = 7
```

### <a id="ARM64_RELOC_SUBTRACTOR" href="#ARM64_RELOC_SUBTRACTOR">const ARM64_RELOC_SUBTRACTOR</a>

```
searchKey: macho.ARM64_RELOC_SUBTRACTOR
tags: [constant number]
```

```Go
const ARM64_RELOC_SUBTRACTOR RelocTypeARM64 = 1
```

### <a id="ARM64_RELOC_TLVP_LOAD_PAGE21" href="#ARM64_RELOC_TLVP_LOAD_PAGE21">const ARM64_RELOC_TLVP_LOAD_PAGE21</a>

```
searchKey: macho.ARM64_RELOC_TLVP_LOAD_PAGE21
tags: [constant number]
```

```Go
const ARM64_RELOC_TLVP_LOAD_PAGE21 RelocTypeARM64 = 8
```

### <a id="ARM64_RELOC_TLVP_LOAD_PAGEOFF12" href="#ARM64_RELOC_TLVP_LOAD_PAGEOFF12">const ARM64_RELOC_TLVP_LOAD_PAGEOFF12</a>

```
searchKey: macho.ARM64_RELOC_TLVP_LOAD_PAGEOFF12
tags: [constant number]
```

```Go
const ARM64_RELOC_TLVP_LOAD_PAGEOFF12 RelocTypeARM64 = 9
```

### <a id="ARM64_RELOC_UNSIGNED" href="#ARM64_RELOC_UNSIGNED">const ARM64_RELOC_UNSIGNED</a>

```
searchKey: macho.ARM64_RELOC_UNSIGNED
tags: [constant number]
```

```Go
const ARM64_RELOC_UNSIGNED RelocTypeARM64 = 0
```

### <a id="ARM_RELOC_BR24" href="#ARM_RELOC_BR24">const ARM_RELOC_BR24</a>

```
searchKey: macho.ARM_RELOC_BR24
tags: [constant number]
```

```Go
const ARM_RELOC_BR24 RelocTypeARM = 5
```

### <a id="ARM_RELOC_HALF" href="#ARM_RELOC_HALF">const ARM_RELOC_HALF</a>

```
searchKey: macho.ARM_RELOC_HALF
tags: [constant number]
```

```Go
const ARM_RELOC_HALF RelocTypeARM = 8
```

### <a id="ARM_RELOC_HALF_SECTDIFF" href="#ARM_RELOC_HALF_SECTDIFF">const ARM_RELOC_HALF_SECTDIFF</a>

```
searchKey: macho.ARM_RELOC_HALF_SECTDIFF
tags: [constant number]
```

```Go
const ARM_RELOC_HALF_SECTDIFF RelocTypeARM = 9
```

### <a id="ARM_RELOC_LOCAL_SECTDIFF" href="#ARM_RELOC_LOCAL_SECTDIFF">const ARM_RELOC_LOCAL_SECTDIFF</a>

```
searchKey: macho.ARM_RELOC_LOCAL_SECTDIFF
tags: [constant number]
```

```Go
const ARM_RELOC_LOCAL_SECTDIFF RelocTypeARM = 3
```

### <a id="ARM_RELOC_PAIR" href="#ARM_RELOC_PAIR">const ARM_RELOC_PAIR</a>

```
searchKey: macho.ARM_RELOC_PAIR
tags: [constant number]
```

```Go
const ARM_RELOC_PAIR RelocTypeARM = 1
```

### <a id="ARM_RELOC_PB_LA_PTR" href="#ARM_RELOC_PB_LA_PTR">const ARM_RELOC_PB_LA_PTR</a>

```
searchKey: macho.ARM_RELOC_PB_LA_PTR
tags: [constant number]
```

```Go
const ARM_RELOC_PB_LA_PTR RelocTypeARM = 4
```

### <a id="ARM_RELOC_SECTDIFF" href="#ARM_RELOC_SECTDIFF">const ARM_RELOC_SECTDIFF</a>

```
searchKey: macho.ARM_RELOC_SECTDIFF
tags: [constant number]
```

```Go
const ARM_RELOC_SECTDIFF RelocTypeARM = 2
```

### <a id="ARM_RELOC_VANILLA" href="#ARM_RELOC_VANILLA">const ARM_RELOC_VANILLA</a>

```
searchKey: macho.ARM_RELOC_VANILLA
tags: [constant number]
```

```Go
const ARM_RELOC_VANILLA RelocTypeARM = 0
```

### <a id="ARM_THUMB_32BIT_BRANCH" href="#ARM_THUMB_32BIT_BRANCH">const ARM_THUMB_32BIT_BRANCH</a>

```
searchKey: macho.ARM_THUMB_32BIT_BRANCH
tags: [constant number]
```

```Go
const ARM_THUMB_32BIT_BRANCH RelocTypeARM = 7
```

### <a id="ARM_THUMB_RELOC_BR22" href="#ARM_THUMB_RELOC_BR22">const ARM_THUMB_RELOC_BR22</a>

```
searchKey: macho.ARM_THUMB_RELOC_BR22
tags: [constant number]
```

```Go
const ARM_THUMB_RELOC_BR22 RelocTypeARM = 6
```

### <a id="Cpu386" href="#Cpu386">const Cpu386</a>

```
searchKey: macho.Cpu386
tags: [constant number]
```

```Go
const Cpu386 Cpu = 7
```

### <a id="CpuAmd64" href="#CpuAmd64">const CpuAmd64</a>

```
searchKey: macho.CpuAmd64
tags: [constant number]
```

```Go
const CpuAmd64 Cpu = Cpu386 | cpuArch64
```

### <a id="CpuArm" href="#CpuArm">const CpuArm</a>

```
searchKey: macho.CpuArm
tags: [constant number]
```

```Go
const CpuArm Cpu = 12
```

### <a id="CpuArm64" href="#CpuArm64">const CpuArm64</a>

```
searchKey: macho.CpuArm64
tags: [constant number]
```

```Go
const CpuArm64 Cpu = CpuArm | cpuArch64
```

### <a id="CpuPpc" href="#CpuPpc">const CpuPpc</a>

```
searchKey: macho.CpuPpc
tags: [constant number]
```

```Go
const CpuPpc Cpu = 18
```

### <a id="CpuPpc64" href="#CpuPpc64">const CpuPpc64</a>

```
searchKey: macho.CpuPpc64
tags: [constant number]
```

```Go
const CpuPpc64 Cpu = CpuPpc | cpuArch64
```

### <a id="FlagAllModsBound" href="#FlagAllModsBound">const FlagAllModsBound</a>

```
searchKey: macho.FlagAllModsBound
tags: [constant number]
```

```Go
const FlagAllModsBound uint32 = 0x1000
```

### <a id="FlagAllowStackExecution" href="#FlagAllowStackExecution">const FlagAllowStackExecution</a>

```
searchKey: macho.FlagAllowStackExecution
tags: [constant number]
```

```Go
const FlagAllowStackExecution uint32 = 0x20000
```

### <a id="FlagAppExtensionSafe" href="#FlagAppExtensionSafe">const FlagAppExtensionSafe</a>

```
searchKey: macho.FlagAppExtensionSafe
tags: [constant number]
```

```Go
const FlagAppExtensionSafe uint32 = 0x2000000
```

### <a id="FlagBindAtLoad" href="#FlagBindAtLoad">const FlagBindAtLoad</a>

```
searchKey: macho.FlagBindAtLoad
tags: [constant number]
```

```Go
const FlagBindAtLoad uint32 = 0x8
```

### <a id="FlagBindsToWeak" href="#FlagBindsToWeak">const FlagBindsToWeak</a>

```
searchKey: macho.FlagBindsToWeak
tags: [constant number]
```

```Go
const FlagBindsToWeak uint32 = 0x10000
```

### <a id="FlagCanonical" href="#FlagCanonical">const FlagCanonical</a>

```
searchKey: macho.FlagCanonical
tags: [constant number]
```

```Go
const FlagCanonical uint32 = 0x4000
```

### <a id="FlagDeadStrippableDylib" href="#FlagDeadStrippableDylib">const FlagDeadStrippableDylib</a>

```
searchKey: macho.FlagDeadStrippableDylib
tags: [constant number]
```

```Go
const FlagDeadStrippableDylib uint32 = 0x400000
```

### <a id="FlagDyldLink" href="#FlagDyldLink">const FlagDyldLink</a>

```
searchKey: macho.FlagDyldLink
tags: [constant number]
```

```Go
const FlagDyldLink uint32 = 0x4
```

### <a id="FlagForceFlat" href="#FlagForceFlat">const FlagForceFlat</a>

```
searchKey: macho.FlagForceFlat
tags: [constant number]
```

```Go
const FlagForceFlat uint32 = 0x100
```

### <a id="FlagHasTLVDescriptors" href="#FlagHasTLVDescriptors">const FlagHasTLVDescriptors</a>

```
searchKey: macho.FlagHasTLVDescriptors
tags: [constant number]
```

```Go
const FlagHasTLVDescriptors uint32 = 0x800000
```

### <a id="FlagIncrLink" href="#FlagIncrLink">const FlagIncrLink</a>

```
searchKey: macho.FlagIncrLink
tags: [constant number]
```

```Go
const FlagIncrLink uint32 = 0x2
```

### <a id="FlagLazyInit" href="#FlagLazyInit">const FlagLazyInit</a>

```
searchKey: macho.FlagLazyInit
tags: [constant number]
```

```Go
const FlagLazyInit uint32 = 0x40
```

### <a id="FlagNoFixPrebinding" href="#FlagNoFixPrebinding">const FlagNoFixPrebinding</a>

```
searchKey: macho.FlagNoFixPrebinding
tags: [constant number]
```

```Go
const FlagNoFixPrebinding uint32 = 0x400
```

### <a id="FlagNoHeapExecution" href="#FlagNoHeapExecution">const FlagNoHeapExecution</a>

```
searchKey: macho.FlagNoHeapExecution
tags: [constant number]
```

```Go
const FlagNoHeapExecution uint32 = 0x1000000
```

### <a id="FlagNoMultiDefs" href="#FlagNoMultiDefs">const FlagNoMultiDefs</a>

```
searchKey: macho.FlagNoMultiDefs
tags: [constant number]
```

```Go
const FlagNoMultiDefs uint32 = 0x200
```

### <a id="FlagNoReexportedDylibs" href="#FlagNoReexportedDylibs">const FlagNoReexportedDylibs</a>

```
searchKey: macho.FlagNoReexportedDylibs
tags: [constant number]
```

```Go
const FlagNoReexportedDylibs uint32 = 0x100000
```

### <a id="FlagNoUndefs" href="#FlagNoUndefs">const FlagNoUndefs</a>

```
searchKey: macho.FlagNoUndefs
tags: [constant number]
```

```Go
const FlagNoUndefs uint32 = 0x1
```

### <a id="FlagPIE" href="#FlagPIE">const FlagPIE</a>

```
searchKey: macho.FlagPIE
tags: [constant number]
```

```Go
const FlagPIE uint32 = 0x200000
```

### <a id="FlagPrebindable" href="#FlagPrebindable">const FlagPrebindable</a>

```
searchKey: macho.FlagPrebindable
tags: [constant number]
```

```Go
const FlagPrebindable uint32 = 0x800
```

### <a id="FlagPrebound" href="#FlagPrebound">const FlagPrebound</a>

```
searchKey: macho.FlagPrebound
tags: [constant number]
```

```Go
const FlagPrebound uint32 = 0x10
```

### <a id="FlagRootSafe" href="#FlagRootSafe">const FlagRootSafe</a>

```
searchKey: macho.FlagRootSafe
tags: [constant number]
```

```Go
const FlagRootSafe uint32 = 0x40000
```

### <a id="FlagSetuidSafe" href="#FlagSetuidSafe">const FlagSetuidSafe</a>

```
searchKey: macho.FlagSetuidSafe
tags: [constant number]
```

```Go
const FlagSetuidSafe uint32 = 0x80000
```

### <a id="FlagSplitSegs" href="#FlagSplitSegs">const FlagSplitSegs</a>

```
searchKey: macho.FlagSplitSegs
tags: [constant number]
```

```Go
const FlagSplitSegs uint32 = 0x20
```

### <a id="FlagSubsectionsViaSymbols" href="#FlagSubsectionsViaSymbols">const FlagSubsectionsViaSymbols</a>

```
searchKey: macho.FlagSubsectionsViaSymbols
tags: [constant number]
```

```Go
const FlagSubsectionsViaSymbols uint32 = 0x2000
```

### <a id="FlagTwoLevel" href="#FlagTwoLevel">const FlagTwoLevel</a>

```
searchKey: macho.FlagTwoLevel
tags: [constant number]
```

```Go
const FlagTwoLevel uint32 = 0x80
```

### <a id="FlagWeakDefines" href="#FlagWeakDefines">const FlagWeakDefines</a>

```
searchKey: macho.FlagWeakDefines
tags: [constant number]
```

```Go
const FlagWeakDefines uint32 = 0x8000
```

### <a id="GENERIC_RELOC_LOCAL_SECTDIFF" href="#GENERIC_RELOC_LOCAL_SECTDIFF">const GENERIC_RELOC_LOCAL_SECTDIFF</a>

```
searchKey: macho.GENERIC_RELOC_LOCAL_SECTDIFF
tags: [constant number]
```

```Go
const GENERIC_RELOC_LOCAL_SECTDIFF RelocTypeGeneric = 4
```

### <a id="GENERIC_RELOC_PAIR" href="#GENERIC_RELOC_PAIR">const GENERIC_RELOC_PAIR</a>

```
searchKey: macho.GENERIC_RELOC_PAIR
tags: [constant number]
```

```Go
const GENERIC_RELOC_PAIR RelocTypeGeneric = 1
```

### <a id="GENERIC_RELOC_PB_LA_PTR" href="#GENERIC_RELOC_PB_LA_PTR">const GENERIC_RELOC_PB_LA_PTR</a>

```
searchKey: macho.GENERIC_RELOC_PB_LA_PTR
tags: [constant number]
```

```Go
const GENERIC_RELOC_PB_LA_PTR RelocTypeGeneric = 3
```

### <a id="GENERIC_RELOC_SECTDIFF" href="#GENERIC_RELOC_SECTDIFF">const GENERIC_RELOC_SECTDIFF</a>

```
searchKey: macho.GENERIC_RELOC_SECTDIFF
tags: [constant number]
```

```Go
const GENERIC_RELOC_SECTDIFF RelocTypeGeneric = 2
```

### <a id="GENERIC_RELOC_TLV" href="#GENERIC_RELOC_TLV">const GENERIC_RELOC_TLV</a>

```
searchKey: macho.GENERIC_RELOC_TLV
tags: [constant number]
```

```Go
const GENERIC_RELOC_TLV RelocTypeGeneric = 5
```

### <a id="GENERIC_RELOC_VANILLA" href="#GENERIC_RELOC_VANILLA">const GENERIC_RELOC_VANILLA</a>

```
searchKey: macho.GENERIC_RELOC_VANILLA
tags: [constant number]
```

```Go
const GENERIC_RELOC_VANILLA RelocTypeGeneric = 0
```

### <a id="LoadCmdDylib" href="#LoadCmdDylib">const LoadCmdDylib</a>

```
searchKey: macho.LoadCmdDylib
tags: [constant number]
```

```Go
const LoadCmdDylib LoadCmd = 0xc // load dylib command

```

### <a id="LoadCmdDylinker" href="#LoadCmdDylinker">const LoadCmdDylinker</a>

```
searchKey: macho.LoadCmdDylinker
tags: [constant number]
```

```Go
const LoadCmdDylinker LoadCmd = 0xf // id dylinker command (not load dylinker command)

```

### <a id="LoadCmdDysymtab" href="#LoadCmdDysymtab">const LoadCmdDysymtab</a>

```
searchKey: macho.LoadCmdDysymtab
tags: [constant number]
```

```Go
const LoadCmdDysymtab LoadCmd = 0xb
```

### <a id="LoadCmdRpath" href="#LoadCmdRpath">const LoadCmdRpath</a>

```
searchKey: macho.LoadCmdRpath
tags: [constant number]
```

```Go
const LoadCmdRpath LoadCmd = 0x8000001c
```

### <a id="LoadCmdSegment" href="#LoadCmdSegment">const LoadCmdSegment</a>

```
searchKey: macho.LoadCmdSegment
tags: [constant number]
```

```Go
const LoadCmdSegment LoadCmd = 0x1
```

### <a id="LoadCmdSegment64" href="#LoadCmdSegment64">const LoadCmdSegment64</a>

```
searchKey: macho.LoadCmdSegment64
tags: [constant number]
```

```Go
const LoadCmdSegment64 LoadCmd = 0x19
```

### <a id="LoadCmdSymtab" href="#LoadCmdSymtab">const LoadCmdSymtab</a>

```
searchKey: macho.LoadCmdSymtab
tags: [constant number]
```

```Go
const LoadCmdSymtab LoadCmd = 0x2
```

### <a id="LoadCmdThread" href="#LoadCmdThread">const LoadCmdThread</a>

```
searchKey: macho.LoadCmdThread
tags: [constant number]
```

```Go
const LoadCmdThread LoadCmd = 0x4
```

### <a id="LoadCmdUnixThread" href="#LoadCmdUnixThread">const LoadCmdUnixThread</a>

```
searchKey: macho.LoadCmdUnixThread
tags: [constant number]
```

```Go
const LoadCmdUnixThread LoadCmd = 0x5 // thread+stack

```

### <a id="Magic32" href="#Magic32">const Magic32</a>

```
searchKey: macho.Magic32
tags: [constant number]
```

```Go
const Magic32 uint32 = 0xfeedface
```

### <a id="Magic64" href="#Magic64">const Magic64</a>

```
searchKey: macho.Magic64
tags: [constant number]
```

```Go
const Magic64 uint32 = 0xfeedfacf
```

### <a id="MagicFat" href="#MagicFat">const MagicFat</a>

```
searchKey: macho.MagicFat
tags: [constant number]
```

```Go
const MagicFat uint32 = 0xcafebabe
```

### <a id="TypeBundle" href="#TypeBundle">const TypeBundle</a>

```
searchKey: macho.TypeBundle
tags: [constant number]
```

```Go
const TypeBundle Type = 8
```

### <a id="TypeDylib" href="#TypeDylib">const TypeDylib</a>

```
searchKey: macho.TypeDylib
tags: [constant number]
```

```Go
const TypeDylib Type = 6
```

### <a id="TypeExec" href="#TypeExec">const TypeExec</a>

```
searchKey: macho.TypeExec
tags: [constant number]
```

```Go
const TypeExec Type = 2
```

### <a id="TypeObj" href="#TypeObj">const TypeObj</a>

```
searchKey: macho.TypeObj
tags: [constant number]
```

```Go
const TypeObj Type = 1
```

### <a id="X86_64_RELOC_BRANCH" href="#X86_64_RELOC_BRANCH">const X86_64_RELOC_BRANCH</a>

```
searchKey: macho.X86_64_RELOC_BRANCH
tags: [constant number]
```

```Go
const X86_64_RELOC_BRANCH RelocTypeX86_64 = 2
```

### <a id="X86_64_RELOC_GOT" href="#X86_64_RELOC_GOT">const X86_64_RELOC_GOT</a>

```
searchKey: macho.X86_64_RELOC_GOT
tags: [constant number]
```

```Go
const X86_64_RELOC_GOT RelocTypeX86_64 = 4
```

### <a id="X86_64_RELOC_GOT_LOAD" href="#X86_64_RELOC_GOT_LOAD">const X86_64_RELOC_GOT_LOAD</a>

```
searchKey: macho.X86_64_RELOC_GOT_LOAD
tags: [constant number]
```

```Go
const X86_64_RELOC_GOT_LOAD RelocTypeX86_64 = 3
```

### <a id="X86_64_RELOC_SIGNED" href="#X86_64_RELOC_SIGNED">const X86_64_RELOC_SIGNED</a>

```
searchKey: macho.X86_64_RELOC_SIGNED
tags: [constant number]
```

```Go
const X86_64_RELOC_SIGNED RelocTypeX86_64 = 1
```

### <a id="X86_64_RELOC_SIGNED_1" href="#X86_64_RELOC_SIGNED_1">const X86_64_RELOC_SIGNED_1</a>

```
searchKey: macho.X86_64_RELOC_SIGNED_1
tags: [constant number]
```

```Go
const X86_64_RELOC_SIGNED_1 RelocTypeX86_64 = 6
```

### <a id="X86_64_RELOC_SIGNED_2" href="#X86_64_RELOC_SIGNED_2">const X86_64_RELOC_SIGNED_2</a>

```
searchKey: macho.X86_64_RELOC_SIGNED_2
tags: [constant number]
```

```Go
const X86_64_RELOC_SIGNED_2 RelocTypeX86_64 = 7
```

### <a id="X86_64_RELOC_SIGNED_4" href="#X86_64_RELOC_SIGNED_4">const X86_64_RELOC_SIGNED_4</a>

```
searchKey: macho.X86_64_RELOC_SIGNED_4
tags: [constant number]
```

```Go
const X86_64_RELOC_SIGNED_4 RelocTypeX86_64 = 8
```

### <a id="X86_64_RELOC_SUBTRACTOR" href="#X86_64_RELOC_SUBTRACTOR">const X86_64_RELOC_SUBTRACTOR</a>

```
searchKey: macho.X86_64_RELOC_SUBTRACTOR
tags: [constant number]
```

```Go
const X86_64_RELOC_SUBTRACTOR RelocTypeX86_64 = 5
```

### <a id="X86_64_RELOC_TLV" href="#X86_64_RELOC_TLV">const X86_64_RELOC_TLV</a>

```
searchKey: macho.X86_64_RELOC_TLV
tags: [constant number]
```

```Go
const X86_64_RELOC_TLV RelocTypeX86_64 = 9
```

### <a id="X86_64_RELOC_UNSIGNED" href="#X86_64_RELOC_UNSIGNED">const X86_64_RELOC_UNSIGNED</a>

```
searchKey: macho.X86_64_RELOC_UNSIGNED
tags: [constant number]
```

```Go
const X86_64_RELOC_UNSIGNED RelocTypeX86_64 = 0
```

### <a id="cpuArch64" href="#cpuArch64">const cpuArch64</a>

```
searchKey: macho.cpuArch64
tags: [constant number private]
```

```Go
const cpuArch64 = 0x01000000
```

### <a id="fatArchHeaderSize" href="#fatArchHeaderSize">const fatArchHeaderSize</a>

```
searchKey: macho.fatArchHeaderSize
tags: [constant number private]
```

```Go
const fatArchHeaderSize = 5 * 4
```

### <a id="fileHeaderSize32" href="#fileHeaderSize32">const fileHeaderSize32</a>

```
searchKey: macho.fileHeaderSize32
tags: [constant number private]
```

```Go
const fileHeaderSize32 = 7 * 4
```

### <a id="fileHeaderSize64" href="#fileHeaderSize64">const fileHeaderSize64</a>

```
searchKey: macho.fileHeaderSize64
tags: [constant number private]
```

```Go
const fileHeaderSize64 = 8 * 4
```

### <a id="_RelocTypeARM64_name" href="#_RelocTypeARM64_name">const _RelocTypeARM64_name</a>

```
searchKey: macho._RelocTypeARM64_name
tags: [constant string private]
```

```Go
const _RelocTypeARM64_name = ...
```

### <a id="_RelocTypeARM_name" href="#_RelocTypeARM_name">const _RelocTypeARM_name</a>

```
searchKey: macho._RelocTypeARM_name
tags: [constant string private]
```

```Go
const _RelocTypeARM_name = ...
```

### <a id="_RelocTypeGeneric_name" href="#_RelocTypeGeneric_name">const _RelocTypeGeneric_name</a>

```
searchKey: macho._RelocTypeGeneric_name
tags: [constant string private]
```

```Go
const _RelocTypeGeneric_name = ...
```

### <a id="_RelocTypeX86_64_name" href="#_RelocTypeX86_64_name">const _RelocTypeX86_64_name</a>

```
searchKey: macho._RelocTypeX86_64_name
tags: [constant string private]
```

```Go
const _RelocTypeX86_64_name = ...
```

## <a id="var" href="#var">Variables</a>

### <a id="ErrNotFat" href="#ErrNotFat">var ErrNotFat</a>

```
searchKey: macho.ErrNotFat
tags: [variable struct]
```

```Go
var ErrNotFat = &FormatError{0, "not a fat Mach-O file", nil}
```

ErrNotFat is returned from NewFatFile or OpenFat when the file is not a universal binary but may be a thin binary, based on its magic number. 

### <a id="cmdStrings" href="#cmdStrings">var cmdStrings</a>

```
searchKey: macho.cmdStrings
tags: [variable array struct private]
```

```Go
var cmdStrings = ...
```

### <a id="cpuStrings" href="#cpuStrings">var cpuStrings</a>

```
searchKey: macho.cpuStrings
tags: [variable array struct private]
```

```Go
var cpuStrings = ...
```

### <a id="fileTests" href="#fileTests">var fileTests</a>

```
searchKey: macho.fileTests
tags: [variable array struct private]
```

```Go
var fileTests = ...
```

### <a id="typeStrings" href="#typeStrings">var typeStrings</a>

```
searchKey: macho.typeStrings
tags: [variable array struct private]
```

```Go
var typeStrings = ...
```

### <a id="_RelocTypeARM64_index" href="#_RelocTypeARM64_index">var _RelocTypeARM64_index</a>

```
searchKey: macho._RelocTypeARM64_index
tags: [variable array number private]
```

```Go
var _RelocTypeARM64_index = [...]uint16{0, 20, 42, 62, 80, 101, 128, 158, 184, 212, 243, 261}
```

### <a id="_RelocTypeARM_index" href="#_RelocTypeARM_index">var _RelocTypeARM_index</a>

```
searchKey: macho._RelocTypeARM_index
tags: [variable array number private]
```

```Go
var _RelocTypeARM_index = [...]uint8{0, 17, 31, 49, 73, 92, 106, 126, 148, 162, 185}
```

### <a id="_RelocTypeGeneric_index" href="#_RelocTypeGeneric_index">var _RelocTypeGeneric_index</a>

```
searchKey: macho._RelocTypeGeneric_index
tags: [variable array number private]
```

```Go
var _RelocTypeGeneric_index = [...]uint8{0, 21, 39, 61, 84, 112, 129}
```

### <a id="_RelocTypeX86_64_index" href="#_RelocTypeX86_64_index">var _RelocTypeX86_64_index</a>

```
searchKey: macho._RelocTypeX86_64_index
tags: [variable array number private]
```

```Go
var _RelocTypeX86_64_index = [...]uint8{0, 21, 40, 59, 80, 96, 119, 140, 161, 182, 198}
```

## <a id="type" href="#type">Types</a>

### <a id="Cpu" href="#Cpu">type Cpu uint32</a>

```
searchKey: macho.Cpu
tags: [number]
```

```Go
type Cpu uint32
```

A Cpu is a Mach-O cpu type. 

#### <a id="Cpu.GoString" href="#Cpu.GoString">func (i Cpu) GoString() string</a>

```
searchKey: macho.Cpu.GoString
tags: [method]
```

```Go
func (i Cpu) GoString() string
```

#### <a id="Cpu.String" href="#Cpu.String">func (i Cpu) String() string</a>

```
searchKey: macho.Cpu.String
tags: [method]
```

```Go
func (i Cpu) String() string
```

### <a id="Dylib" href="#Dylib">type Dylib struct</a>

```
searchKey: macho.Dylib
tags: [struct]
```

```Go
type Dylib struct {
	LoadBytes
	Name           string
	Time           uint32
	CurrentVersion uint32
	CompatVersion  uint32
}
```

A Dylib represents a Mach-O load dynamic library command. 

### <a id="DylibCmd" href="#DylibCmd">type DylibCmd struct</a>

```
searchKey: macho.DylibCmd
tags: [struct]
```

```Go
type DylibCmd struct {
	Cmd            LoadCmd
	Len            uint32
	Name           uint32
	Time           uint32
	CurrentVersion uint32
	CompatVersion  uint32
}
```

A DylibCmd is a Mach-O load dynamic library command. 

### <a id="Dysymtab" href="#Dysymtab">type Dysymtab struct</a>

```
searchKey: macho.Dysymtab
tags: [struct]
```

```Go
type Dysymtab struct {
	LoadBytes
	DysymtabCmd
	IndirectSyms []uint32 // indices into Symtab.Syms
}
```

A Dysymtab represents a Mach-O dynamic symbol table command. 

### <a id="DysymtabCmd" href="#DysymtabCmd">type DysymtabCmd struct</a>

```
searchKey: macho.DysymtabCmd
tags: [struct]
```

```Go
type DysymtabCmd struct {
	Cmd            LoadCmd
	Len            uint32
	Ilocalsym      uint32
	Nlocalsym      uint32
	Iextdefsym     uint32
	Nextdefsym     uint32
	Iundefsym      uint32
	Nundefsym      uint32
	Tocoffset      uint32
	Ntoc           uint32
	Modtaboff      uint32
	Nmodtab        uint32
	Extrefsymoff   uint32
	Nextrefsyms    uint32
	Indirectsymoff uint32
	Nindirectsyms  uint32
	Extreloff      uint32
	Nextrel        uint32
	Locreloff      uint32
	Nlocrel        uint32
}
```

A DysymtabCmd is a Mach-O dynamic symbol table command. 

### <a id="FatArch" href="#FatArch">type FatArch struct</a>

```
searchKey: macho.FatArch
tags: [struct]
```

```Go
type FatArch struct {
	FatArchHeader
	*File
}
```

A FatArch is a Mach-O File inside a FatFile. 

### <a id="FatArchHeader" href="#FatArchHeader">type FatArchHeader struct</a>

```
searchKey: macho.FatArchHeader
tags: [struct]
```

```Go
type FatArchHeader struct {
	Cpu    Cpu
	SubCpu uint32
	Offset uint32
	Size   uint32
	Align  uint32
}
```

A FatArchHeader represents a fat header for a specific image architecture. 

### <a id="FatFile" href="#FatFile">type FatFile struct</a>

```
searchKey: macho.FatFile
tags: [struct]
```

```Go
type FatFile struct {
	Magic  uint32
	Arches []FatArch
	closer io.Closer
}
```

A FatFile is a Mach-O universal binary that contains at least one architecture. 

#### <a id="NewFatFile" href="#NewFatFile">func NewFatFile(r io.ReaderAt) (*FatFile, error)</a>

```
searchKey: macho.NewFatFile
tags: [function]
```

```Go
func NewFatFile(r io.ReaderAt) (*FatFile, error)
```

NewFatFile creates a new FatFile for accessing all the Mach-O images in a universal binary. The Mach-O binary is expected to start at position 0 in the ReaderAt. 

#### <a id="OpenFat" href="#OpenFat">func OpenFat(name string) (*FatFile, error)</a>

```
searchKey: macho.OpenFat
tags: [function]
```

```Go
func OpenFat(name string) (*FatFile, error)
```

OpenFat opens the named file using os.Open and prepares it for use as a Mach-O universal binary. 

#### <a id="openFatObscured" href="#openFatObscured">func openFatObscured(name string) (*FatFile, error)</a>

```
searchKey: macho.openFatObscured
tags: [function private]
```

```Go
func openFatObscured(name string) (*FatFile, error)
```

#### <a id="FatFile.Close" href="#FatFile.Close">func (ff *FatFile) Close() error</a>

```
searchKey: macho.FatFile.Close
tags: [method]
```

```Go
func (ff *FatFile) Close() error
```

### <a id="File" href="#File">type File struct</a>

```
searchKey: macho.File
tags: [struct]
```

```Go
type File struct {
	FileHeader
	ByteOrder binary.ByteOrder
	Loads     []Load
	Sections  []*Section

	Symtab   *Symtab
	Dysymtab *Dysymtab

	closer io.Closer
}
```

A File represents an open Mach-O file. 

#### <a id="NewFile" href="#NewFile">func NewFile(r io.ReaderAt) (*File, error)</a>

```
searchKey: macho.NewFile
tags: [function]
```

```Go
func NewFile(r io.ReaderAt) (*File, error)
```

NewFile creates a new File for accessing a Mach-O binary in an underlying reader. The Mach-O binary is expected to start at position 0 in the ReaderAt. 

#### <a id="Open" href="#Open">func Open(name string) (*File, error)</a>

```
searchKey: macho.Open
tags: [function]
```

```Go
func Open(name string) (*File, error)
```

Open opens the named file using os.Open and prepares it for use as a Mach-O binary. 

#### <a id="openObscured" href="#openObscured">func openObscured(name string) (*File, error)</a>

```
searchKey: macho.openObscured
tags: [function private]
```

```Go
func openObscured(name string) (*File, error)
```

#### <a id="File.Close" href="#File.Close">func (f *File) Close() error</a>

```
searchKey: macho.File.Close
tags: [method]
```

```Go
func (f *File) Close() error
```

Close closes the File. If the File was created using NewFile directly instead of Open, Close has no effect. 

#### <a id="File.DWARF" href="#File.DWARF">func (f *File) DWARF() (*dwarf.Data, error)</a>

```
searchKey: macho.File.DWARF
tags: [method]
```

```Go
func (f *File) DWARF() (*dwarf.Data, error)
```

DWARF returns the DWARF debug information for the Mach-O file. 

#### <a id="File.ImportedLibraries" href="#File.ImportedLibraries">func (f *File) ImportedLibraries() ([]string, error)</a>

```
searchKey: macho.File.ImportedLibraries
tags: [method]
```

```Go
func (f *File) ImportedLibraries() ([]string, error)
```

ImportedLibraries returns the paths of all libraries referred to by the binary f that are expected to be linked with the binary at dynamic link time. 

#### <a id="File.ImportedSymbols" href="#File.ImportedSymbols">func (f *File) ImportedSymbols() ([]string, error)</a>

```
searchKey: macho.File.ImportedSymbols
tags: [method]
```

```Go
func (f *File) ImportedSymbols() ([]string, error)
```

ImportedSymbols returns the names of all symbols referred to by the binary f that are expected to be satisfied by other libraries at dynamic load time. 

#### <a id="File.Section" href="#File.Section">func (f *File) Section(name string) *Section</a>

```
searchKey: macho.File.Section
tags: [method]
```

```Go
func (f *File) Section(name string) *Section
```

Section returns the first section with the given name, or nil if no such section exists. 

#### <a id="File.Segment" href="#File.Segment">func (f *File) Segment(name string) *Segment</a>

```
searchKey: macho.File.Segment
tags: [method]
```

```Go
func (f *File) Segment(name string) *Segment
```

Segment returns the first Segment with the given name, or nil if no such segment exists. 

#### <a id="File.parseSymtab" href="#File.parseSymtab">func (f *File) parseSymtab(symdat, strtab, cmddat []byte, hdr *SymtabCmd, offset int64) (*Symtab, error)</a>

```
searchKey: macho.File.parseSymtab
tags: [method private]
```

```Go
func (f *File) parseSymtab(symdat, strtab, cmddat []byte, hdr *SymtabCmd, offset int64) (*Symtab, error)
```

#### <a id="File.pushSection" href="#File.pushSection">func (f *File) pushSection(sh *Section, r io.ReaderAt) error</a>

```
searchKey: macho.File.pushSection
tags: [method private]
```

```Go
func (f *File) pushSection(sh *Section, r io.ReaderAt) error
```

### <a id="FileHeader" href="#FileHeader">type FileHeader struct</a>

```
searchKey: macho.FileHeader
tags: [struct]
```

```Go
type FileHeader struct {
	Magic  uint32
	Cpu    Cpu
	SubCpu uint32
	Type   Type
	Ncmd   uint32
	Cmdsz  uint32
	Flags  uint32
}
```

A FileHeader represents a Mach-O file header. 

### <a id="FormatError" href="#FormatError">type FormatError struct</a>

```
searchKey: macho.FormatError
tags: [struct]
```

```Go
type FormatError struct {
	off int64
	msg string
	val interface{}
}
```

FormatError is returned by some operations if the data does not have the correct format for an object file. 

#### <a id="FormatError.Error" href="#FormatError.Error">func (e *FormatError) Error() string</a>

```
searchKey: macho.FormatError.Error
tags: [method]
```

```Go
func (e *FormatError) Error() string
```

### <a id="Load" href="#Load">type Load interface</a>

```
searchKey: macho.Load
tags: [interface]
```

```Go
type Load interface {
	Raw() []byte
}
```

A Load represents any Mach-O load command. 

### <a id="LoadBytes" href="#LoadBytes">type LoadBytes []byte</a>

```
searchKey: macho.LoadBytes
tags: [array number]
```

```Go
type LoadBytes []byte
```

A LoadBytes is the uninterpreted bytes of a Mach-O load command. 

#### <a id="LoadBytes.Raw" href="#LoadBytes.Raw">func (b LoadBytes) Raw() []byte</a>

```
searchKey: macho.LoadBytes.Raw
tags: [method]
```

```Go
func (b LoadBytes) Raw() []byte
```

### <a id="LoadCmd" href="#LoadCmd">type LoadCmd uint32</a>

```
searchKey: macho.LoadCmd
tags: [number]
```

```Go
type LoadCmd uint32
```

A LoadCmd is a Mach-O load command. 

#### <a id="LoadCmd.GoString" href="#LoadCmd.GoString">func (i LoadCmd) GoString() string</a>

```
searchKey: macho.LoadCmd.GoString
tags: [method]
```

```Go
func (i LoadCmd) GoString() string
```

#### <a id="LoadCmd.String" href="#LoadCmd.String">func (i LoadCmd) String() string</a>

```
searchKey: macho.LoadCmd.String
tags: [method]
```

```Go
func (i LoadCmd) String() string
```

### <a id="Nlist32" href="#Nlist32">type Nlist32 struct</a>

```
searchKey: macho.Nlist32
tags: [struct]
```

```Go
type Nlist32 struct {
	Name  uint32
	Type  uint8
	Sect  uint8
	Desc  uint16
	Value uint32
}
```

An Nlist32 is a Mach-O 32-bit symbol table entry. 

### <a id="Nlist64" href="#Nlist64">type Nlist64 struct</a>

```
searchKey: macho.Nlist64
tags: [struct]
```

```Go
type Nlist64 struct {
	Name  uint32
	Type  uint8
	Sect  uint8
	Desc  uint16
	Value uint64
}
```

An Nlist64 is a Mach-O 64-bit symbol table entry. 

### <a id="Regs386" href="#Regs386">type Regs386 struct</a>

```
searchKey: macho.Regs386
tags: [struct]
```

```Go
type Regs386 struct {
	AX    uint32
	BX    uint32
	CX    uint32
	DX    uint32
	DI    uint32
	SI    uint32
	BP    uint32
	SP    uint32
	SS    uint32
	FLAGS uint32
	IP    uint32
	CS    uint32
	DS    uint32
	ES    uint32
	FS    uint32
	GS    uint32
}
```

Regs386 is the Mach-O 386 register structure. 

### <a id="RegsAMD64" href="#RegsAMD64">type RegsAMD64 struct</a>

```
searchKey: macho.RegsAMD64
tags: [struct]
```

```Go
type RegsAMD64 struct {
	AX    uint64
	BX    uint64
	CX    uint64
	DX    uint64
	DI    uint64
	SI    uint64
	BP    uint64
	SP    uint64
	R8    uint64
	R9    uint64
	R10   uint64
	R11   uint64
	R12   uint64
	R13   uint64
	R14   uint64
	R15   uint64
	IP    uint64
	FLAGS uint64
	CS    uint64
	FS    uint64
	GS    uint64
}
```

RegsAMD64 is the Mach-O AMD64 register structure. 

### <a id="Reloc" href="#Reloc">type Reloc struct</a>

```
searchKey: macho.Reloc
tags: [struct]
```

```Go
type Reloc struct {
	Addr  uint32
	Value uint32
	// when Scattered == false && Extern == true, Value is the symbol number.
	// when Scattered == false && Extern == false, Value is the section number.
	// when Scattered == true, Value is the value that this reloc refers to.
	Type      uint8
	Len       uint8 // 0=byte, 1=word, 2=long, 3=quad
	Pcrel     bool
	Extern    bool // valid if Scattered == false
	Scattered bool
}
```

A Reloc represents a Mach-O relocation. 

### <a id="RelocTypeARM" href="#RelocTypeARM">type RelocTypeARM int</a>

```
searchKey: macho.RelocTypeARM
tags: [number]
```

```Go
type RelocTypeARM int
```

#### <a id="RelocTypeARM.GoString" href="#RelocTypeARM.GoString">func (r RelocTypeARM) GoString() string</a>

```
searchKey: macho.RelocTypeARM.GoString
tags: [method]
```

```Go
func (r RelocTypeARM) GoString() string
```

#### <a id="RelocTypeARM.String" href="#RelocTypeARM.String">func (i RelocTypeARM) String() string</a>

```
searchKey: macho.RelocTypeARM.String
tags: [method]
```

```Go
func (i RelocTypeARM) String() string
```

### <a id="RelocTypeARM64" href="#RelocTypeARM64">type RelocTypeARM64 int</a>

```
searchKey: macho.RelocTypeARM64
tags: [number]
```

```Go
type RelocTypeARM64 int
```

#### <a id="RelocTypeARM64.GoString" href="#RelocTypeARM64.GoString">func (r RelocTypeARM64) GoString() string</a>

```
searchKey: macho.RelocTypeARM64.GoString
tags: [method]
```

```Go
func (r RelocTypeARM64) GoString() string
```

#### <a id="RelocTypeARM64.String" href="#RelocTypeARM64.String">func (i RelocTypeARM64) String() string</a>

```
searchKey: macho.RelocTypeARM64.String
tags: [method]
```

```Go
func (i RelocTypeARM64) String() string
```

### <a id="RelocTypeGeneric" href="#RelocTypeGeneric">type RelocTypeGeneric int</a>

```
searchKey: macho.RelocTypeGeneric
tags: [number]
```

```Go
type RelocTypeGeneric int
```

#### <a id="RelocTypeGeneric.GoString" href="#RelocTypeGeneric.GoString">func (r RelocTypeGeneric) GoString() string</a>

```
searchKey: macho.RelocTypeGeneric.GoString
tags: [method]
```

```Go
func (r RelocTypeGeneric) GoString() string
```

#### <a id="RelocTypeGeneric.String" href="#RelocTypeGeneric.String">func (i RelocTypeGeneric) String() string</a>

```
searchKey: macho.RelocTypeGeneric.String
tags: [method]
```

```Go
func (i RelocTypeGeneric) String() string
```

### <a id="RelocTypeX86_64" href="#RelocTypeX86_64">type RelocTypeX86_64 int</a>

```
searchKey: macho.RelocTypeX86_64
tags: [number]
```

```Go
type RelocTypeX86_64 int
```

#### <a id="RelocTypeX86_64.GoString" href="#RelocTypeX86_64.GoString">func (r RelocTypeX86_64) GoString() string</a>

```
searchKey: macho.RelocTypeX86_64.GoString
tags: [method]
```

```Go
func (r RelocTypeX86_64) GoString() string
```

#### <a id="RelocTypeX86_64.String" href="#RelocTypeX86_64.String">func (i RelocTypeX86_64) String() string</a>

```
searchKey: macho.RelocTypeX86_64.String
tags: [method]
```

```Go
func (i RelocTypeX86_64) String() string
```

### <a id="Rpath" href="#Rpath">type Rpath struct</a>

```
searchKey: macho.Rpath
tags: [struct]
```

```Go
type Rpath struct {
	LoadBytes
	Path string
}
```

A Rpath represents a Mach-O rpath command. 

### <a id="RpathCmd" href="#RpathCmd">type RpathCmd struct</a>

```
searchKey: macho.RpathCmd
tags: [struct]
```

```Go
type RpathCmd struct {
	Cmd  LoadCmd
	Len  uint32
	Path uint32
}
```

A RpathCmd is a Mach-O rpath command. 

### <a id="Section" href="#Section">type Section struct</a>

```
searchKey: macho.Section
tags: [struct]
```

```Go
type Section struct {
	SectionHeader
	Relocs []Reloc

	// Embed ReaderAt for ReadAt method.
	// Do not embed SectionReader directly
	// to avoid having Read and Seek.
	// If a client wants Read and Seek it must use
	// Open() to avoid fighting over the seek offset
	// with other clients.
	io.ReaderAt
	sr *io.SectionReader
}
```

#### <a id="Section.Data" href="#Section.Data">func (s *Section) Data() ([]byte, error)</a>

```
searchKey: macho.Section.Data
tags: [method]
```

```Go
func (s *Section) Data() ([]byte, error)
```

Data reads and returns the contents of the Mach-O section. 

#### <a id="Section.Open" href="#Section.Open">func (s *Section) Open() io.ReadSeeker</a>

```
searchKey: macho.Section.Open
tags: [method]
```

```Go
func (s *Section) Open() io.ReadSeeker
```

Open returns a new ReadSeeker reading the Mach-O section. 

### <a id="Section32" href="#Section32">type Section32 struct</a>

```
searchKey: macho.Section32
tags: [struct]
```

```Go
type Section32 struct {
	Name     [16]byte
	Seg      [16]byte
	Addr     uint32
	Size     uint32
	Offset   uint32
	Align    uint32
	Reloff   uint32
	Nreloc   uint32
	Flags    uint32
	Reserve1 uint32
	Reserve2 uint32
}
```

A Section32 is a 32-bit Mach-O section header. 

### <a id="Section64" href="#Section64">type Section64 struct</a>

```
searchKey: macho.Section64
tags: [struct]
```

```Go
type Section64 struct {
	Name     [16]byte
	Seg      [16]byte
	Addr     uint64
	Size     uint64
	Offset   uint32
	Align    uint32
	Reloff   uint32
	Nreloc   uint32
	Flags    uint32
	Reserve1 uint32
	Reserve2 uint32
	Reserve3 uint32
}
```

A Section64 is a 64-bit Mach-O section header. 

### <a id="SectionHeader" href="#SectionHeader">type SectionHeader struct</a>

```
searchKey: macho.SectionHeader
tags: [struct]
```

```Go
type SectionHeader struct {
	Name   string
	Seg    string
	Addr   uint64
	Size   uint64
	Offset uint32
	Align  uint32
	Reloff uint32
	Nreloc uint32
	Flags  uint32
}
```

### <a id="Segment" href="#Segment">type Segment struct</a>

```
searchKey: macho.Segment
tags: [struct]
```

```Go
type Segment struct {
	LoadBytes
	SegmentHeader

	// Embed ReaderAt for ReadAt method.
	// Do not embed SectionReader directly
	// to avoid having Read and Seek.
	// If a client wants Read and Seek it must use
	// Open() to avoid fighting over the seek offset
	// with other clients.
	io.ReaderAt
	sr *io.SectionReader
}
```

A Segment represents a Mach-O 32-bit or 64-bit load segment command. 

#### <a id="Segment.Data" href="#Segment.Data">func (s *Segment) Data() ([]byte, error)</a>

```
searchKey: macho.Segment.Data
tags: [method]
```

```Go
func (s *Segment) Data() ([]byte, error)
```

Data reads and returns the contents of the segment. 

#### <a id="Segment.Open" href="#Segment.Open">func (s *Segment) Open() io.ReadSeeker</a>

```
searchKey: macho.Segment.Open
tags: [method]
```

```Go
func (s *Segment) Open() io.ReadSeeker
```

Open returns a new ReadSeeker reading the segment. 

### <a id="Segment32" href="#Segment32">type Segment32 struct</a>

```
searchKey: macho.Segment32
tags: [struct]
```

```Go
type Segment32 struct {
	Cmd     LoadCmd
	Len     uint32
	Name    [16]byte
	Addr    uint32
	Memsz   uint32
	Offset  uint32
	Filesz  uint32
	Maxprot uint32
	Prot    uint32
	Nsect   uint32
	Flag    uint32
}
```

A Segment32 is a 32-bit Mach-O segment load command. 

### <a id="Segment64" href="#Segment64">type Segment64 struct</a>

```
searchKey: macho.Segment64
tags: [struct]
```

```Go
type Segment64 struct {
	Cmd     LoadCmd
	Len     uint32
	Name    [16]byte
	Addr    uint64
	Memsz   uint64
	Offset  uint64
	Filesz  uint64
	Maxprot uint32
	Prot    uint32
	Nsect   uint32
	Flag    uint32
}
```

A Segment64 is a 64-bit Mach-O segment load command. 

### <a id="SegmentHeader" href="#SegmentHeader">type SegmentHeader struct</a>

```
searchKey: macho.SegmentHeader
tags: [struct]
```

```Go
type SegmentHeader struct {
	Cmd     LoadCmd
	Len     uint32
	Name    string
	Addr    uint64
	Memsz   uint64
	Offset  uint64
	Filesz  uint64
	Maxprot uint32
	Prot    uint32
	Nsect   uint32
	Flag    uint32
}
```

A SegmentHeader is the header for a Mach-O 32-bit or 64-bit load segment command. 

### <a id="Symbol" href="#Symbol">type Symbol struct</a>

```
searchKey: macho.Symbol
tags: [struct]
```

```Go
type Symbol struct {
	Name  string
	Type  uint8
	Sect  uint8
	Desc  uint16
	Value uint64
}
```

A Symbol is a Mach-O 32-bit or 64-bit symbol table entry. 

### <a id="Symtab" href="#Symtab">type Symtab struct</a>

```
searchKey: macho.Symtab
tags: [struct]
```

```Go
type Symtab struct {
	LoadBytes
	SymtabCmd
	Syms []Symbol
}
```

A Symtab represents a Mach-O symbol table command. 

### <a id="SymtabCmd" href="#SymtabCmd">type SymtabCmd struct</a>

```
searchKey: macho.SymtabCmd
tags: [struct]
```

```Go
type SymtabCmd struct {
	Cmd     LoadCmd
	Len     uint32
	Symoff  uint32
	Nsyms   uint32
	Stroff  uint32
	Strsize uint32
}
```

A SymtabCmd is a Mach-O symbol table command. 

### <a id="Thread" href="#Thread">type Thread struct</a>

```
searchKey: macho.Thread
tags: [struct]
```

```Go
type Thread struct {
	Cmd  LoadCmd
	Len  uint32
	Type uint32
	Data []uint32
}
```

A Thread is a Mach-O thread state command. 

### <a id="Type" href="#Type">type Type uint32</a>

```
searchKey: macho.Type
tags: [number]
```

```Go
type Type uint32
```

A Type is the Mach-O file type, e.g. an object file, executable, or dynamic library. 

#### <a id="Type.GoString" href="#Type.GoString">func (t Type) GoString() string</a>

```
searchKey: macho.Type.GoString
tags: [method]
```

```Go
func (t Type) GoString() string
```

#### <a id="Type.String" href="#Type.String">func (t Type) String() string</a>

```
searchKey: macho.Type.String
tags: [method]
```

```Go
func (t Type) String() string
```

### <a id="fileTest" href="#fileTest">type fileTest struct</a>

```
searchKey: macho.fileTest
tags: [struct private]
```

```Go
type fileTest struct {
	file        string
	hdr         FileHeader
	loads       []interface{}
	sections    []*SectionHeader
	relocations map[string][]Reloc
}
```

### <a id="intName" href="#intName">type intName struct</a>

```
searchKey: macho.intName
tags: [struct private]
```

```Go
type intName struct {
	i uint32
	s string
}
```

### <a id="relocInfo" href="#relocInfo">type relocInfo struct</a>

```
searchKey: macho.relocInfo
tags: [struct private]
```

```Go
type relocInfo struct {
	Addr   uint32
	Symnum uint32
}
```

## <a id="func" href="#func">Functions</a>

### <a id="TestOpen" href="#TestOpen">func TestOpen(t *testing.T)</a>

```
searchKey: macho.TestOpen
tags: [function private test]
```

```Go
func TestOpen(t *testing.T)
```

### <a id="TestOpenFailure" href="#TestOpenFailure">func TestOpenFailure(t *testing.T)</a>

```
searchKey: macho.TestOpenFailure
tags: [function private test]
```

```Go
func TestOpenFailure(t *testing.T)
```

### <a id="TestOpenFat" href="#TestOpenFat">func TestOpenFat(t *testing.T)</a>

```
searchKey: macho.TestOpenFat
tags: [function private test]
```

```Go
func TestOpenFat(t *testing.T)
```

### <a id="TestOpenFatFailure" href="#TestOpenFatFailure">func TestOpenFatFailure(t *testing.T)</a>

```
searchKey: macho.TestOpenFatFailure
tags: [function private test]
```

```Go
func TestOpenFatFailure(t *testing.T)
```

### <a id="TestRelocTypeString" href="#TestRelocTypeString">func TestRelocTypeString(t *testing.T)</a>

```
searchKey: macho.TestRelocTypeString
tags: [function private test]
```

```Go
func TestRelocTypeString(t *testing.T)
```

### <a id="TestTypeString" href="#TestTypeString">func TestTypeString(t *testing.T)</a>

```
searchKey: macho.TestTypeString
tags: [function private test]
```

```Go
func TestTypeString(t *testing.T)
```

### <a id="cstring" href="#cstring">func cstring(b []byte) string</a>

```
searchKey: macho.cstring
tags: [function private]
```

```Go
func cstring(b []byte) string
```

### <a id="readerAtFromObscured" href="#readerAtFromObscured">func readerAtFromObscured(name string) (io.ReaderAt, error)</a>

```
searchKey: macho.readerAtFromObscured
tags: [function private]
```

```Go
func readerAtFromObscured(name string) (io.ReaderAt, error)
```

### <a id="stringName" href="#stringName">func stringName(i uint32, names []intName, goSyntax bool) string</a>

```
searchKey: macho.stringName
tags: [function private]
```

```Go
func stringName(i uint32, names []intName, goSyntax bool) string
```

