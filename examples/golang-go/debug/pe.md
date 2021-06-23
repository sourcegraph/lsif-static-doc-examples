# Package pe

Package pe implements access to PE (Microsoft Windows Portable Executable) files. 

## Index

* [Constants](#const)
    * [const seekStart](#seekStart)
    * [const IMAGE_FILE_MACHINE_UNKNOWN](#IMAGE_FILE_MACHINE_UNKNOWN)
    * [const IMAGE_FILE_MACHINE_AM33](#IMAGE_FILE_MACHINE_AM33)
    * [const IMAGE_FILE_MACHINE_AMD64](#IMAGE_FILE_MACHINE_AMD64)
    * [const IMAGE_FILE_MACHINE_ARM](#IMAGE_FILE_MACHINE_ARM)
    * [const IMAGE_FILE_MACHINE_ARMNT](#IMAGE_FILE_MACHINE_ARMNT)
    * [const IMAGE_FILE_MACHINE_ARM64](#IMAGE_FILE_MACHINE_ARM64)
    * [const IMAGE_FILE_MACHINE_EBC](#IMAGE_FILE_MACHINE_EBC)
    * [const IMAGE_FILE_MACHINE_I386](#IMAGE_FILE_MACHINE_I386)
    * [const IMAGE_FILE_MACHINE_IA64](#IMAGE_FILE_MACHINE_IA64)
    * [const IMAGE_FILE_MACHINE_M32R](#IMAGE_FILE_MACHINE_M32R)
    * [const IMAGE_FILE_MACHINE_MIPS16](#IMAGE_FILE_MACHINE_MIPS16)
    * [const IMAGE_FILE_MACHINE_MIPSFPU](#IMAGE_FILE_MACHINE_MIPSFPU)
    * [const IMAGE_FILE_MACHINE_MIPSFPU16](#IMAGE_FILE_MACHINE_MIPSFPU16)
    * [const IMAGE_FILE_MACHINE_POWERPC](#IMAGE_FILE_MACHINE_POWERPC)
    * [const IMAGE_FILE_MACHINE_POWERPCFP](#IMAGE_FILE_MACHINE_POWERPCFP)
    * [const IMAGE_FILE_MACHINE_R4000](#IMAGE_FILE_MACHINE_R4000)
    * [const IMAGE_FILE_MACHINE_SH3](#IMAGE_FILE_MACHINE_SH3)
    * [const IMAGE_FILE_MACHINE_SH3DSP](#IMAGE_FILE_MACHINE_SH3DSP)
    * [const IMAGE_FILE_MACHINE_SH4](#IMAGE_FILE_MACHINE_SH4)
    * [const IMAGE_FILE_MACHINE_SH5](#IMAGE_FILE_MACHINE_SH5)
    * [const IMAGE_FILE_MACHINE_THUMB](#IMAGE_FILE_MACHINE_THUMB)
    * [const IMAGE_FILE_MACHINE_WCEMIPSV2](#IMAGE_FILE_MACHINE_WCEMIPSV2)
    * [const IMAGE_DIRECTORY_ENTRY_EXPORT](#IMAGE_DIRECTORY_ENTRY_EXPORT)
    * [const IMAGE_DIRECTORY_ENTRY_IMPORT](#IMAGE_DIRECTORY_ENTRY_IMPORT)
    * [const IMAGE_DIRECTORY_ENTRY_RESOURCE](#IMAGE_DIRECTORY_ENTRY_RESOURCE)
    * [const IMAGE_DIRECTORY_ENTRY_EXCEPTION](#IMAGE_DIRECTORY_ENTRY_EXCEPTION)
    * [const IMAGE_DIRECTORY_ENTRY_SECURITY](#IMAGE_DIRECTORY_ENTRY_SECURITY)
    * [const IMAGE_DIRECTORY_ENTRY_BASERELOC](#IMAGE_DIRECTORY_ENTRY_BASERELOC)
    * [const IMAGE_DIRECTORY_ENTRY_DEBUG](#IMAGE_DIRECTORY_ENTRY_DEBUG)
    * [const IMAGE_DIRECTORY_ENTRY_ARCHITECTURE](#IMAGE_DIRECTORY_ENTRY_ARCHITECTURE)
    * [const IMAGE_DIRECTORY_ENTRY_GLOBALPTR](#IMAGE_DIRECTORY_ENTRY_GLOBALPTR)
    * [const IMAGE_DIRECTORY_ENTRY_TLS](#IMAGE_DIRECTORY_ENTRY_TLS)
    * [const IMAGE_DIRECTORY_ENTRY_LOAD_CONFIG](#IMAGE_DIRECTORY_ENTRY_LOAD_CONFIG)
    * [const IMAGE_DIRECTORY_ENTRY_BOUND_IMPORT](#IMAGE_DIRECTORY_ENTRY_BOUND_IMPORT)
    * [const IMAGE_DIRECTORY_ENTRY_IAT](#IMAGE_DIRECTORY_ENTRY_IAT)
    * [const IMAGE_DIRECTORY_ENTRY_DELAY_IMPORT](#IMAGE_DIRECTORY_ENTRY_DELAY_IMPORT)
    * [const IMAGE_DIRECTORY_ENTRY_COM_DESCRIPTOR](#IMAGE_DIRECTORY_ENTRY_COM_DESCRIPTOR)
    * [const IMAGE_FILE_RELOCS_STRIPPED](#IMAGE_FILE_RELOCS_STRIPPED)
    * [const IMAGE_FILE_EXECUTABLE_IMAGE](#IMAGE_FILE_EXECUTABLE_IMAGE)
    * [const IMAGE_FILE_LINE_NUMS_STRIPPED](#IMAGE_FILE_LINE_NUMS_STRIPPED)
    * [const IMAGE_FILE_LOCAL_SYMS_STRIPPED](#IMAGE_FILE_LOCAL_SYMS_STRIPPED)
    * [const IMAGE_FILE_AGGRESIVE_WS_TRIM](#IMAGE_FILE_AGGRESIVE_WS_TRIM)
    * [const IMAGE_FILE_LARGE_ADDRESS_AWARE](#IMAGE_FILE_LARGE_ADDRESS_AWARE)
    * [const IMAGE_FILE_BYTES_REVERSED_LO](#IMAGE_FILE_BYTES_REVERSED_LO)
    * [const IMAGE_FILE_32BIT_MACHINE](#IMAGE_FILE_32BIT_MACHINE)
    * [const IMAGE_FILE_DEBUG_STRIPPED](#IMAGE_FILE_DEBUG_STRIPPED)
    * [const IMAGE_FILE_REMOVABLE_RUN_FROM_SWAP](#IMAGE_FILE_REMOVABLE_RUN_FROM_SWAP)
    * [const IMAGE_FILE_NET_RUN_FROM_SWAP](#IMAGE_FILE_NET_RUN_FROM_SWAP)
    * [const IMAGE_FILE_SYSTEM](#IMAGE_FILE_SYSTEM)
    * [const IMAGE_FILE_DLL](#IMAGE_FILE_DLL)
    * [const IMAGE_FILE_UP_SYSTEM_ONLY](#IMAGE_FILE_UP_SYSTEM_ONLY)
    * [const IMAGE_FILE_BYTES_REVERSED_HI](#IMAGE_FILE_BYTES_REVERSED_HI)
    * [const IMAGE_SUBSYSTEM_UNKNOWN](#IMAGE_SUBSYSTEM_UNKNOWN)
    * [const IMAGE_SUBSYSTEM_NATIVE](#IMAGE_SUBSYSTEM_NATIVE)
    * [const IMAGE_SUBSYSTEM_WINDOWS_GUI](#IMAGE_SUBSYSTEM_WINDOWS_GUI)
    * [const IMAGE_SUBSYSTEM_WINDOWS_CUI](#IMAGE_SUBSYSTEM_WINDOWS_CUI)
    * [const IMAGE_SUBSYSTEM_OS2_CUI](#IMAGE_SUBSYSTEM_OS2_CUI)
    * [const IMAGE_SUBSYSTEM_POSIX_CUI](#IMAGE_SUBSYSTEM_POSIX_CUI)
    * [const IMAGE_SUBSYSTEM_NATIVE_WINDOWS](#IMAGE_SUBSYSTEM_NATIVE_WINDOWS)
    * [const IMAGE_SUBSYSTEM_WINDOWS_CE_GUI](#IMAGE_SUBSYSTEM_WINDOWS_CE_GUI)
    * [const IMAGE_SUBSYSTEM_EFI_APPLICATION](#IMAGE_SUBSYSTEM_EFI_APPLICATION)
    * [const IMAGE_SUBSYSTEM_EFI_BOOT_SERVICE_DRIVER](#IMAGE_SUBSYSTEM_EFI_BOOT_SERVICE_DRIVER)
    * [const IMAGE_SUBSYSTEM_EFI_RUNTIME_DRIVER](#IMAGE_SUBSYSTEM_EFI_RUNTIME_DRIVER)
    * [const IMAGE_SUBSYSTEM_EFI_ROM](#IMAGE_SUBSYSTEM_EFI_ROM)
    * [const IMAGE_SUBSYSTEM_XBOX](#IMAGE_SUBSYSTEM_XBOX)
    * [const IMAGE_SUBSYSTEM_WINDOWS_BOOT_APPLICATION](#IMAGE_SUBSYSTEM_WINDOWS_BOOT_APPLICATION)
    * [const IMAGE_DLLCHARACTERISTICS_HIGH_ENTROPY_VA](#IMAGE_DLLCHARACTERISTICS_HIGH_ENTROPY_VA)
    * [const IMAGE_DLLCHARACTERISTICS_DYNAMIC_BASE](#IMAGE_DLLCHARACTERISTICS_DYNAMIC_BASE)
    * [const IMAGE_DLLCHARACTERISTICS_FORCE_INTEGRITY](#IMAGE_DLLCHARACTERISTICS_FORCE_INTEGRITY)
    * [const IMAGE_DLLCHARACTERISTICS_NX_COMPAT](#IMAGE_DLLCHARACTERISTICS_NX_COMPAT)
    * [const IMAGE_DLLCHARACTERISTICS_NO_ISOLATION](#IMAGE_DLLCHARACTERISTICS_NO_ISOLATION)
    * [const IMAGE_DLLCHARACTERISTICS_NO_SEH](#IMAGE_DLLCHARACTERISTICS_NO_SEH)
    * [const IMAGE_DLLCHARACTERISTICS_NO_BIND](#IMAGE_DLLCHARACTERISTICS_NO_BIND)
    * [const IMAGE_DLLCHARACTERISTICS_APPCONTAINER](#IMAGE_DLLCHARACTERISTICS_APPCONTAINER)
    * [const IMAGE_DLLCHARACTERISTICS_WDM_DRIVER](#IMAGE_DLLCHARACTERISTICS_WDM_DRIVER)
    * [const IMAGE_DLLCHARACTERISTICS_GUARD_CF](#IMAGE_DLLCHARACTERISTICS_GUARD_CF)
    * [const IMAGE_DLLCHARACTERISTICS_TERMINAL_SERVER_AWARE](#IMAGE_DLLCHARACTERISTICS_TERMINAL_SERVER_AWARE)
    * [const COFFSymbolSize](#COFFSymbolSize)
    * [const linkNoCgo](#linkNoCgo)
    * [const linkCgoDefault](#linkCgoDefault)
    * [const linkCgoInternal](#linkCgoInternal)
    * [const linkCgoExternal](#linkCgoExternal)
    * [const testprog](#testprog)
* [Variables](#var)
    * [var fileTests](#fileTests)
* [Types](#type)
    * [type File struct](#File)
        * [func Open(name string) (*File, error)](#Open)
        * [func NewFile(r io.ReaderAt) (*File, error)](#NewFile)
        * [func (f *File) Close() error](#File.Close)
        * [func (f *File) Section(name string) *Section](#File.Section)
        * [func (f *File) DWARF() (*dwarf.Data, error)](#File.DWARF)
        * [func (f *File) ImportedSymbols() ([]string, error)](#File.ImportedSymbols)
        * [func (f *File) ImportedLibraries() ([]string, error)](#File.ImportedLibraries)
    * [type zeroReaderAt struct{}](#zeroReaderAt)
        * [func (w zeroReaderAt) ReadAt(p []byte, off int64) (n int, err error)](#zeroReaderAt.ReadAt)
    * [type ImportDirectory struct](#ImportDirectory)
    * [type FormatError struct{}](#FormatError)
        * [func (e *FormatError) Error() string](#FormatError.Error)
    * [type FileHeader struct](#FileHeader)
    * [type DataDirectory struct](#DataDirectory)
    * [type OptionalHeader32 struct](#OptionalHeader32)
    * [type OptionalHeader64 struct](#OptionalHeader64)
    * [type SectionHeader32 struct](#SectionHeader32)
        * [func (sh *SectionHeader32) fullName(st StringTable) (string, error)](#SectionHeader32.fullName)
    * [type Reloc struct](#Reloc)
    * [type SectionHeader struct](#SectionHeader)
    * [type Section struct](#Section)
        * [func (s *Section) Data() ([]byte, error)](#Section.Data)
        * [func (s *Section) Open() io.ReadSeeker](#Section.Open)
    * [type StringTable []byte](#StringTable)
        * [func readStringTable(fh *FileHeader, r io.ReadSeeker) (StringTable, error)](#readStringTable)
        * [func (st StringTable) String(start uint32) (string, error)](#StringTable.String)
    * [type COFFSymbol struct](#COFFSymbol)
        * [func (sym *COFFSymbol) FullName(st StringTable) (string, error)](#COFFSymbol.FullName)
    * [type Symbol struct](#Symbol)
    * [type fileTest struct](#fileTest)
* [Functions](#func)
    * [func getString(section []byte, start int) (string, bool)](#getString)
    * [func readOptionalHeader(r io.ReadSeeker, sz uint16) (interface{}, error)](#readOptionalHeader)
    * [func readDataDirectories(r io.ReadSeeker, sz uint16, n uint32) ([]DataDirectory, error)](#readDataDirectories)
    * [func readRelocs(sh *SectionHeader, r io.ReadSeeker) ([]Reloc, error)](#readRelocs)
    * [func cstring(b []byte) string](#cstring)
    * [func readCOFFSymbols(fh *FileHeader, r io.ReadSeeker) ([]COFFSymbol, error)](#readCOFFSymbols)
    * [func isSymNameOffset(name [8]byte) (bool, uint32)](#isSymNameOffset)
    * [func removeAuxSymbols(allsyms []COFFSymbol, st StringTable) ([]*Symbol, error)](#removeAuxSymbols)
    * [func testCgoDWARF(t *testing.T, linktype int)](#testCgoDWARF)
    * [func TestDefaultLinkerDWARF(t *testing.T)](#TestDefaultLinkerDWARF)
    * [func TestInternalLinkerDWARF(t *testing.T)](#TestInternalLinkerDWARF)
    * [func TestExternalLinkerDWARF(t *testing.T)](#TestExternalLinkerDWARF)
    * [func isOptHdrEq(a, b interface{}) bool](#isOptHdrEq)
    * [func TestOpen(t *testing.T)](#TestOpen)
    * [func TestOpenFailure(t *testing.T)](#TestOpenFailure)
    * [func getImageBase(f *File) uintptr](#getImageBase)
    * [func testDWARF(t *testing.T, linktype int)](#testDWARF)
    * [func TestBSSHasZeros(t *testing.T)](#TestBSSHasZeros)
    * [func TestDWARF(t *testing.T)](#TestDWARF)
    * [func TestBuildingWindowsGUI(t *testing.T)](#TestBuildingWindowsGUI)
    * [func TestImportTableInUnknownSection(t *testing.T)](#TestImportTableInUnknownSection)
    * [func TestInvalidOptionalHeaderMagic(t *testing.T)](#TestInvalidOptionalHeaderMagic)
    * [func TestImportedSymbolsNoPanicMissingOptionalHeader(t *testing.T)](#TestImportedSymbolsNoPanicMissingOptionalHeader)
    * [func TestImportedSymbolsNoPanicWithSliceOutOfBound(t *testing.T)](#TestImportedSymbolsNoPanicWithSliceOutOfBound)


## <a id="const" href="#const">Constants</a>

### <a id="seekStart" href="#seekStart">const seekStart</a>

```
searchKey: pe.seekStart
tags: [private]
```

```Go
const seekStart = 0
```

Avoid use of post-Go 1.4 io features, to make safe for toolchain bootstrap. 

### <a id="IMAGE_FILE_MACHINE_UNKNOWN" href="#IMAGE_FILE_MACHINE_UNKNOWN">const IMAGE_FILE_MACHINE_UNKNOWN</a>

```
searchKey: pe.IMAGE_FILE_MACHINE_UNKNOWN
```

```Go
const IMAGE_FILE_MACHINE_UNKNOWN = 0x0
```

### <a id="IMAGE_FILE_MACHINE_AM33" href="#IMAGE_FILE_MACHINE_AM33">const IMAGE_FILE_MACHINE_AM33</a>

```
searchKey: pe.IMAGE_FILE_MACHINE_AM33
```

```Go
const IMAGE_FILE_MACHINE_AM33 = 0x1d3
```

### <a id="IMAGE_FILE_MACHINE_AMD64" href="#IMAGE_FILE_MACHINE_AMD64">const IMAGE_FILE_MACHINE_AMD64</a>

```
searchKey: pe.IMAGE_FILE_MACHINE_AMD64
```

```Go
const IMAGE_FILE_MACHINE_AMD64 = 0x8664
```

### <a id="IMAGE_FILE_MACHINE_ARM" href="#IMAGE_FILE_MACHINE_ARM">const IMAGE_FILE_MACHINE_ARM</a>

```
searchKey: pe.IMAGE_FILE_MACHINE_ARM
```

```Go
const IMAGE_FILE_MACHINE_ARM = 0x1c0
```

### <a id="IMAGE_FILE_MACHINE_ARMNT" href="#IMAGE_FILE_MACHINE_ARMNT">const IMAGE_FILE_MACHINE_ARMNT</a>

```
searchKey: pe.IMAGE_FILE_MACHINE_ARMNT
```

```Go
const IMAGE_FILE_MACHINE_ARMNT = 0x1c4
```

### <a id="IMAGE_FILE_MACHINE_ARM64" href="#IMAGE_FILE_MACHINE_ARM64">const IMAGE_FILE_MACHINE_ARM64</a>

```
searchKey: pe.IMAGE_FILE_MACHINE_ARM64
```

```Go
const IMAGE_FILE_MACHINE_ARM64 = 0xaa64
```

### <a id="IMAGE_FILE_MACHINE_EBC" href="#IMAGE_FILE_MACHINE_EBC">const IMAGE_FILE_MACHINE_EBC</a>

```
searchKey: pe.IMAGE_FILE_MACHINE_EBC
```

```Go
const IMAGE_FILE_MACHINE_EBC = 0xebc
```

### <a id="IMAGE_FILE_MACHINE_I386" href="#IMAGE_FILE_MACHINE_I386">const IMAGE_FILE_MACHINE_I386</a>

```
searchKey: pe.IMAGE_FILE_MACHINE_I386
```

```Go
const IMAGE_FILE_MACHINE_I386 = 0x14c
```

### <a id="IMAGE_FILE_MACHINE_IA64" href="#IMAGE_FILE_MACHINE_IA64">const IMAGE_FILE_MACHINE_IA64</a>

```
searchKey: pe.IMAGE_FILE_MACHINE_IA64
```

```Go
const IMAGE_FILE_MACHINE_IA64 = 0x200
```

### <a id="IMAGE_FILE_MACHINE_M32R" href="#IMAGE_FILE_MACHINE_M32R">const IMAGE_FILE_MACHINE_M32R</a>

```
searchKey: pe.IMAGE_FILE_MACHINE_M32R
```

```Go
const IMAGE_FILE_MACHINE_M32R = 0x9041
```

### <a id="IMAGE_FILE_MACHINE_MIPS16" href="#IMAGE_FILE_MACHINE_MIPS16">const IMAGE_FILE_MACHINE_MIPS16</a>

```
searchKey: pe.IMAGE_FILE_MACHINE_MIPS16
```

```Go
const IMAGE_FILE_MACHINE_MIPS16 = 0x266
```

### <a id="IMAGE_FILE_MACHINE_MIPSFPU" href="#IMAGE_FILE_MACHINE_MIPSFPU">const IMAGE_FILE_MACHINE_MIPSFPU</a>

```
searchKey: pe.IMAGE_FILE_MACHINE_MIPSFPU
```

```Go
const IMAGE_FILE_MACHINE_MIPSFPU = 0x366
```

### <a id="IMAGE_FILE_MACHINE_MIPSFPU16" href="#IMAGE_FILE_MACHINE_MIPSFPU16">const IMAGE_FILE_MACHINE_MIPSFPU16</a>

```
searchKey: pe.IMAGE_FILE_MACHINE_MIPSFPU16
```

```Go
const IMAGE_FILE_MACHINE_MIPSFPU16 = 0x466
```

### <a id="IMAGE_FILE_MACHINE_POWERPC" href="#IMAGE_FILE_MACHINE_POWERPC">const IMAGE_FILE_MACHINE_POWERPC</a>

```
searchKey: pe.IMAGE_FILE_MACHINE_POWERPC
```

```Go
const IMAGE_FILE_MACHINE_POWERPC = 0x1f0
```

### <a id="IMAGE_FILE_MACHINE_POWERPCFP" href="#IMAGE_FILE_MACHINE_POWERPCFP">const IMAGE_FILE_MACHINE_POWERPCFP</a>

```
searchKey: pe.IMAGE_FILE_MACHINE_POWERPCFP
```

```Go
const IMAGE_FILE_MACHINE_POWERPCFP = 0x1f1
```

### <a id="IMAGE_FILE_MACHINE_R4000" href="#IMAGE_FILE_MACHINE_R4000">const IMAGE_FILE_MACHINE_R4000</a>

```
searchKey: pe.IMAGE_FILE_MACHINE_R4000
```

```Go
const IMAGE_FILE_MACHINE_R4000 = 0x166
```

### <a id="IMAGE_FILE_MACHINE_SH3" href="#IMAGE_FILE_MACHINE_SH3">const IMAGE_FILE_MACHINE_SH3</a>

```
searchKey: pe.IMAGE_FILE_MACHINE_SH3
```

```Go
const IMAGE_FILE_MACHINE_SH3 = 0x1a2
```

### <a id="IMAGE_FILE_MACHINE_SH3DSP" href="#IMAGE_FILE_MACHINE_SH3DSP">const IMAGE_FILE_MACHINE_SH3DSP</a>

```
searchKey: pe.IMAGE_FILE_MACHINE_SH3DSP
```

```Go
const IMAGE_FILE_MACHINE_SH3DSP = 0x1a3
```

### <a id="IMAGE_FILE_MACHINE_SH4" href="#IMAGE_FILE_MACHINE_SH4">const IMAGE_FILE_MACHINE_SH4</a>

```
searchKey: pe.IMAGE_FILE_MACHINE_SH4
```

```Go
const IMAGE_FILE_MACHINE_SH4 = 0x1a6
```

### <a id="IMAGE_FILE_MACHINE_SH5" href="#IMAGE_FILE_MACHINE_SH5">const IMAGE_FILE_MACHINE_SH5</a>

```
searchKey: pe.IMAGE_FILE_MACHINE_SH5
```

```Go
const IMAGE_FILE_MACHINE_SH5 = 0x1a8
```

### <a id="IMAGE_FILE_MACHINE_THUMB" href="#IMAGE_FILE_MACHINE_THUMB">const IMAGE_FILE_MACHINE_THUMB</a>

```
searchKey: pe.IMAGE_FILE_MACHINE_THUMB
```

```Go
const IMAGE_FILE_MACHINE_THUMB = 0x1c2
```

### <a id="IMAGE_FILE_MACHINE_WCEMIPSV2" href="#IMAGE_FILE_MACHINE_WCEMIPSV2">const IMAGE_FILE_MACHINE_WCEMIPSV2</a>

```
searchKey: pe.IMAGE_FILE_MACHINE_WCEMIPSV2
```

```Go
const IMAGE_FILE_MACHINE_WCEMIPSV2 = 0x169
```

### <a id="IMAGE_DIRECTORY_ENTRY_EXPORT" href="#IMAGE_DIRECTORY_ENTRY_EXPORT">const IMAGE_DIRECTORY_ENTRY_EXPORT</a>

```
searchKey: pe.IMAGE_DIRECTORY_ENTRY_EXPORT
```

```Go
const IMAGE_DIRECTORY_ENTRY_EXPORT = 0
```

IMAGE_DIRECTORY_ENTRY constants 

### <a id="IMAGE_DIRECTORY_ENTRY_IMPORT" href="#IMAGE_DIRECTORY_ENTRY_IMPORT">const IMAGE_DIRECTORY_ENTRY_IMPORT</a>

```
searchKey: pe.IMAGE_DIRECTORY_ENTRY_IMPORT
```

```Go
const IMAGE_DIRECTORY_ENTRY_IMPORT = 1
```

IMAGE_DIRECTORY_ENTRY constants 

### <a id="IMAGE_DIRECTORY_ENTRY_RESOURCE" href="#IMAGE_DIRECTORY_ENTRY_RESOURCE">const IMAGE_DIRECTORY_ENTRY_RESOURCE</a>

```
searchKey: pe.IMAGE_DIRECTORY_ENTRY_RESOURCE
```

```Go
const IMAGE_DIRECTORY_ENTRY_RESOURCE = 2
```

IMAGE_DIRECTORY_ENTRY constants 

### <a id="IMAGE_DIRECTORY_ENTRY_EXCEPTION" href="#IMAGE_DIRECTORY_ENTRY_EXCEPTION">const IMAGE_DIRECTORY_ENTRY_EXCEPTION</a>

```
searchKey: pe.IMAGE_DIRECTORY_ENTRY_EXCEPTION
```

```Go
const IMAGE_DIRECTORY_ENTRY_EXCEPTION = 3
```

IMAGE_DIRECTORY_ENTRY constants 

### <a id="IMAGE_DIRECTORY_ENTRY_SECURITY" href="#IMAGE_DIRECTORY_ENTRY_SECURITY">const IMAGE_DIRECTORY_ENTRY_SECURITY</a>

```
searchKey: pe.IMAGE_DIRECTORY_ENTRY_SECURITY
```

```Go
const IMAGE_DIRECTORY_ENTRY_SECURITY = 4
```

IMAGE_DIRECTORY_ENTRY constants 

### <a id="IMAGE_DIRECTORY_ENTRY_BASERELOC" href="#IMAGE_DIRECTORY_ENTRY_BASERELOC">const IMAGE_DIRECTORY_ENTRY_BASERELOC</a>

```
searchKey: pe.IMAGE_DIRECTORY_ENTRY_BASERELOC
```

```Go
const IMAGE_DIRECTORY_ENTRY_BASERELOC = 5
```

IMAGE_DIRECTORY_ENTRY constants 

### <a id="IMAGE_DIRECTORY_ENTRY_DEBUG" href="#IMAGE_DIRECTORY_ENTRY_DEBUG">const IMAGE_DIRECTORY_ENTRY_DEBUG</a>

```
searchKey: pe.IMAGE_DIRECTORY_ENTRY_DEBUG
```

```Go
const IMAGE_DIRECTORY_ENTRY_DEBUG = 6
```

IMAGE_DIRECTORY_ENTRY constants 

### <a id="IMAGE_DIRECTORY_ENTRY_ARCHITECTURE" href="#IMAGE_DIRECTORY_ENTRY_ARCHITECTURE">const IMAGE_DIRECTORY_ENTRY_ARCHITECTURE</a>

```
searchKey: pe.IMAGE_DIRECTORY_ENTRY_ARCHITECTURE
```

```Go
const IMAGE_DIRECTORY_ENTRY_ARCHITECTURE = 7
```

IMAGE_DIRECTORY_ENTRY constants 

### <a id="IMAGE_DIRECTORY_ENTRY_GLOBALPTR" href="#IMAGE_DIRECTORY_ENTRY_GLOBALPTR">const IMAGE_DIRECTORY_ENTRY_GLOBALPTR</a>

```
searchKey: pe.IMAGE_DIRECTORY_ENTRY_GLOBALPTR
```

```Go
const IMAGE_DIRECTORY_ENTRY_GLOBALPTR = 8
```

IMAGE_DIRECTORY_ENTRY constants 

### <a id="IMAGE_DIRECTORY_ENTRY_TLS" href="#IMAGE_DIRECTORY_ENTRY_TLS">const IMAGE_DIRECTORY_ENTRY_TLS</a>

```
searchKey: pe.IMAGE_DIRECTORY_ENTRY_TLS
```

```Go
const IMAGE_DIRECTORY_ENTRY_TLS = 9
```

IMAGE_DIRECTORY_ENTRY constants 

### <a id="IMAGE_DIRECTORY_ENTRY_LOAD_CONFIG" href="#IMAGE_DIRECTORY_ENTRY_LOAD_CONFIG">const IMAGE_DIRECTORY_ENTRY_LOAD_CONFIG</a>

```
searchKey: pe.IMAGE_DIRECTORY_ENTRY_LOAD_CONFIG
```

```Go
const IMAGE_DIRECTORY_ENTRY_LOAD_CONFIG = 10
```

IMAGE_DIRECTORY_ENTRY constants 

### <a id="IMAGE_DIRECTORY_ENTRY_BOUND_IMPORT" href="#IMAGE_DIRECTORY_ENTRY_BOUND_IMPORT">const IMAGE_DIRECTORY_ENTRY_BOUND_IMPORT</a>

```
searchKey: pe.IMAGE_DIRECTORY_ENTRY_BOUND_IMPORT
```

```Go
const IMAGE_DIRECTORY_ENTRY_BOUND_IMPORT = 11
```

IMAGE_DIRECTORY_ENTRY constants 

### <a id="IMAGE_DIRECTORY_ENTRY_IAT" href="#IMAGE_DIRECTORY_ENTRY_IAT">const IMAGE_DIRECTORY_ENTRY_IAT</a>

```
searchKey: pe.IMAGE_DIRECTORY_ENTRY_IAT
```

```Go
const IMAGE_DIRECTORY_ENTRY_IAT = 12
```

IMAGE_DIRECTORY_ENTRY constants 

### <a id="IMAGE_DIRECTORY_ENTRY_DELAY_IMPORT" href="#IMAGE_DIRECTORY_ENTRY_DELAY_IMPORT">const IMAGE_DIRECTORY_ENTRY_DELAY_IMPORT</a>

```
searchKey: pe.IMAGE_DIRECTORY_ENTRY_DELAY_IMPORT
```

```Go
const IMAGE_DIRECTORY_ENTRY_DELAY_IMPORT = 13
```

IMAGE_DIRECTORY_ENTRY constants 

### <a id="IMAGE_DIRECTORY_ENTRY_COM_DESCRIPTOR" href="#IMAGE_DIRECTORY_ENTRY_COM_DESCRIPTOR">const IMAGE_DIRECTORY_ENTRY_COM_DESCRIPTOR</a>

```
searchKey: pe.IMAGE_DIRECTORY_ENTRY_COM_DESCRIPTOR
```

```Go
const IMAGE_DIRECTORY_ENTRY_COM_DESCRIPTOR = 14
```

IMAGE_DIRECTORY_ENTRY constants 

### <a id="IMAGE_FILE_RELOCS_STRIPPED" href="#IMAGE_FILE_RELOCS_STRIPPED">const IMAGE_FILE_RELOCS_STRIPPED</a>

```
searchKey: pe.IMAGE_FILE_RELOCS_STRIPPED
```

```Go
const IMAGE_FILE_RELOCS_STRIPPED = 0x0001
```

Values of IMAGE_FILE_HEADER.Characteristics. These can be combined together. 

### <a id="IMAGE_FILE_EXECUTABLE_IMAGE" href="#IMAGE_FILE_EXECUTABLE_IMAGE">const IMAGE_FILE_EXECUTABLE_IMAGE</a>

```
searchKey: pe.IMAGE_FILE_EXECUTABLE_IMAGE
```

```Go
const IMAGE_FILE_EXECUTABLE_IMAGE = 0x0002
```

Values of IMAGE_FILE_HEADER.Characteristics. These can be combined together. 

### <a id="IMAGE_FILE_LINE_NUMS_STRIPPED" href="#IMAGE_FILE_LINE_NUMS_STRIPPED">const IMAGE_FILE_LINE_NUMS_STRIPPED</a>

```
searchKey: pe.IMAGE_FILE_LINE_NUMS_STRIPPED
```

```Go
const IMAGE_FILE_LINE_NUMS_STRIPPED = 0x0004
```

Values of IMAGE_FILE_HEADER.Characteristics. These can be combined together. 

### <a id="IMAGE_FILE_LOCAL_SYMS_STRIPPED" href="#IMAGE_FILE_LOCAL_SYMS_STRIPPED">const IMAGE_FILE_LOCAL_SYMS_STRIPPED</a>

```
searchKey: pe.IMAGE_FILE_LOCAL_SYMS_STRIPPED
```

```Go
const IMAGE_FILE_LOCAL_SYMS_STRIPPED = 0x0008
```

Values of IMAGE_FILE_HEADER.Characteristics. These can be combined together. 

### <a id="IMAGE_FILE_AGGRESIVE_WS_TRIM" href="#IMAGE_FILE_AGGRESIVE_WS_TRIM">const IMAGE_FILE_AGGRESIVE_WS_TRIM</a>

```
searchKey: pe.IMAGE_FILE_AGGRESIVE_WS_TRIM
```

```Go
const IMAGE_FILE_AGGRESIVE_WS_TRIM = 0x0010
```

Values of IMAGE_FILE_HEADER.Characteristics. These can be combined together. 

### <a id="IMAGE_FILE_LARGE_ADDRESS_AWARE" href="#IMAGE_FILE_LARGE_ADDRESS_AWARE">const IMAGE_FILE_LARGE_ADDRESS_AWARE</a>

```
searchKey: pe.IMAGE_FILE_LARGE_ADDRESS_AWARE
```

```Go
const IMAGE_FILE_LARGE_ADDRESS_AWARE = 0x0020
```

Values of IMAGE_FILE_HEADER.Characteristics. These can be combined together. 

### <a id="IMAGE_FILE_BYTES_REVERSED_LO" href="#IMAGE_FILE_BYTES_REVERSED_LO">const IMAGE_FILE_BYTES_REVERSED_LO</a>

```
searchKey: pe.IMAGE_FILE_BYTES_REVERSED_LO
```

```Go
const IMAGE_FILE_BYTES_REVERSED_LO = 0x0080
```

Values of IMAGE_FILE_HEADER.Characteristics. These can be combined together. 

### <a id="IMAGE_FILE_32BIT_MACHINE" href="#IMAGE_FILE_32BIT_MACHINE">const IMAGE_FILE_32BIT_MACHINE</a>

```
searchKey: pe.IMAGE_FILE_32BIT_MACHINE
```

```Go
const IMAGE_FILE_32BIT_MACHINE = 0x0100
```

Values of IMAGE_FILE_HEADER.Characteristics. These can be combined together. 

### <a id="IMAGE_FILE_DEBUG_STRIPPED" href="#IMAGE_FILE_DEBUG_STRIPPED">const IMAGE_FILE_DEBUG_STRIPPED</a>

```
searchKey: pe.IMAGE_FILE_DEBUG_STRIPPED
```

```Go
const IMAGE_FILE_DEBUG_STRIPPED = 0x0200
```

Values of IMAGE_FILE_HEADER.Characteristics. These can be combined together. 

### <a id="IMAGE_FILE_REMOVABLE_RUN_FROM_SWAP" href="#IMAGE_FILE_REMOVABLE_RUN_FROM_SWAP">const IMAGE_FILE_REMOVABLE_RUN_FROM_SWAP</a>

```
searchKey: pe.IMAGE_FILE_REMOVABLE_RUN_FROM_SWAP
```

```Go
const IMAGE_FILE_REMOVABLE_RUN_FROM_SWAP = 0x0400
```

Values of IMAGE_FILE_HEADER.Characteristics. These can be combined together. 

### <a id="IMAGE_FILE_NET_RUN_FROM_SWAP" href="#IMAGE_FILE_NET_RUN_FROM_SWAP">const IMAGE_FILE_NET_RUN_FROM_SWAP</a>

```
searchKey: pe.IMAGE_FILE_NET_RUN_FROM_SWAP
```

```Go
const IMAGE_FILE_NET_RUN_FROM_SWAP = 0x0800
```

Values of IMAGE_FILE_HEADER.Characteristics. These can be combined together. 

### <a id="IMAGE_FILE_SYSTEM" href="#IMAGE_FILE_SYSTEM">const IMAGE_FILE_SYSTEM</a>

```
searchKey: pe.IMAGE_FILE_SYSTEM
```

```Go
const IMAGE_FILE_SYSTEM = 0x1000
```

Values of IMAGE_FILE_HEADER.Characteristics. These can be combined together. 

### <a id="IMAGE_FILE_DLL" href="#IMAGE_FILE_DLL">const IMAGE_FILE_DLL</a>

```
searchKey: pe.IMAGE_FILE_DLL
```

```Go
const IMAGE_FILE_DLL = 0x2000
```

Values of IMAGE_FILE_HEADER.Characteristics. These can be combined together. 

### <a id="IMAGE_FILE_UP_SYSTEM_ONLY" href="#IMAGE_FILE_UP_SYSTEM_ONLY">const IMAGE_FILE_UP_SYSTEM_ONLY</a>

```
searchKey: pe.IMAGE_FILE_UP_SYSTEM_ONLY
```

```Go
const IMAGE_FILE_UP_SYSTEM_ONLY = 0x4000
```

Values of IMAGE_FILE_HEADER.Characteristics. These can be combined together. 

### <a id="IMAGE_FILE_BYTES_REVERSED_HI" href="#IMAGE_FILE_BYTES_REVERSED_HI">const IMAGE_FILE_BYTES_REVERSED_HI</a>

```
searchKey: pe.IMAGE_FILE_BYTES_REVERSED_HI
```

```Go
const IMAGE_FILE_BYTES_REVERSED_HI = 0x8000
```

Values of IMAGE_FILE_HEADER.Characteristics. These can be combined together. 

### <a id="IMAGE_SUBSYSTEM_UNKNOWN" href="#IMAGE_SUBSYSTEM_UNKNOWN">const IMAGE_SUBSYSTEM_UNKNOWN</a>

```
searchKey: pe.IMAGE_SUBSYSTEM_UNKNOWN
```

```Go
const IMAGE_SUBSYSTEM_UNKNOWN = 0
```

OptionalHeader64.Subsystem and OptionalHeader32.Subsystem values. 

### <a id="IMAGE_SUBSYSTEM_NATIVE" href="#IMAGE_SUBSYSTEM_NATIVE">const IMAGE_SUBSYSTEM_NATIVE</a>

```
searchKey: pe.IMAGE_SUBSYSTEM_NATIVE
```

```Go
const IMAGE_SUBSYSTEM_NATIVE = 1
```

OptionalHeader64.Subsystem and OptionalHeader32.Subsystem values. 

### <a id="IMAGE_SUBSYSTEM_WINDOWS_GUI" href="#IMAGE_SUBSYSTEM_WINDOWS_GUI">const IMAGE_SUBSYSTEM_WINDOWS_GUI</a>

```
searchKey: pe.IMAGE_SUBSYSTEM_WINDOWS_GUI
```

```Go
const IMAGE_SUBSYSTEM_WINDOWS_GUI = 2
```

OptionalHeader64.Subsystem and OptionalHeader32.Subsystem values. 

### <a id="IMAGE_SUBSYSTEM_WINDOWS_CUI" href="#IMAGE_SUBSYSTEM_WINDOWS_CUI">const IMAGE_SUBSYSTEM_WINDOWS_CUI</a>

```
searchKey: pe.IMAGE_SUBSYSTEM_WINDOWS_CUI
```

```Go
const IMAGE_SUBSYSTEM_WINDOWS_CUI = 3
```

OptionalHeader64.Subsystem and OptionalHeader32.Subsystem values. 

### <a id="IMAGE_SUBSYSTEM_OS2_CUI" href="#IMAGE_SUBSYSTEM_OS2_CUI">const IMAGE_SUBSYSTEM_OS2_CUI</a>

```
searchKey: pe.IMAGE_SUBSYSTEM_OS2_CUI
```

```Go
const IMAGE_SUBSYSTEM_OS2_CUI = 5
```

OptionalHeader64.Subsystem and OptionalHeader32.Subsystem values. 

### <a id="IMAGE_SUBSYSTEM_POSIX_CUI" href="#IMAGE_SUBSYSTEM_POSIX_CUI">const IMAGE_SUBSYSTEM_POSIX_CUI</a>

```
searchKey: pe.IMAGE_SUBSYSTEM_POSIX_CUI
```

```Go
const IMAGE_SUBSYSTEM_POSIX_CUI = 7
```

OptionalHeader64.Subsystem and OptionalHeader32.Subsystem values. 

### <a id="IMAGE_SUBSYSTEM_NATIVE_WINDOWS" href="#IMAGE_SUBSYSTEM_NATIVE_WINDOWS">const IMAGE_SUBSYSTEM_NATIVE_WINDOWS</a>

```
searchKey: pe.IMAGE_SUBSYSTEM_NATIVE_WINDOWS
```

```Go
const IMAGE_SUBSYSTEM_NATIVE_WINDOWS = 8
```

OptionalHeader64.Subsystem and OptionalHeader32.Subsystem values. 

### <a id="IMAGE_SUBSYSTEM_WINDOWS_CE_GUI" href="#IMAGE_SUBSYSTEM_WINDOWS_CE_GUI">const IMAGE_SUBSYSTEM_WINDOWS_CE_GUI</a>

```
searchKey: pe.IMAGE_SUBSYSTEM_WINDOWS_CE_GUI
```

```Go
const IMAGE_SUBSYSTEM_WINDOWS_CE_GUI = 9
```

OptionalHeader64.Subsystem and OptionalHeader32.Subsystem values. 

### <a id="IMAGE_SUBSYSTEM_EFI_APPLICATION" href="#IMAGE_SUBSYSTEM_EFI_APPLICATION">const IMAGE_SUBSYSTEM_EFI_APPLICATION</a>

```
searchKey: pe.IMAGE_SUBSYSTEM_EFI_APPLICATION
```

```Go
const IMAGE_SUBSYSTEM_EFI_APPLICATION = 10
```

OptionalHeader64.Subsystem and OptionalHeader32.Subsystem values. 

### <a id="IMAGE_SUBSYSTEM_EFI_BOOT_SERVICE_DRIVER" href="#IMAGE_SUBSYSTEM_EFI_BOOT_SERVICE_DRIVER">const IMAGE_SUBSYSTEM_EFI_BOOT_SERVICE_DRIVER</a>

```
searchKey: pe.IMAGE_SUBSYSTEM_EFI_BOOT_SERVICE_DRIVER
```

```Go
const IMAGE_SUBSYSTEM_EFI_BOOT_SERVICE_DRIVER = 11
```

OptionalHeader64.Subsystem and OptionalHeader32.Subsystem values. 

### <a id="IMAGE_SUBSYSTEM_EFI_RUNTIME_DRIVER" href="#IMAGE_SUBSYSTEM_EFI_RUNTIME_DRIVER">const IMAGE_SUBSYSTEM_EFI_RUNTIME_DRIVER</a>

```
searchKey: pe.IMAGE_SUBSYSTEM_EFI_RUNTIME_DRIVER
```

```Go
const IMAGE_SUBSYSTEM_EFI_RUNTIME_DRIVER = 12
```

OptionalHeader64.Subsystem and OptionalHeader32.Subsystem values. 

### <a id="IMAGE_SUBSYSTEM_EFI_ROM" href="#IMAGE_SUBSYSTEM_EFI_ROM">const IMAGE_SUBSYSTEM_EFI_ROM</a>

```
searchKey: pe.IMAGE_SUBSYSTEM_EFI_ROM
```

```Go
const IMAGE_SUBSYSTEM_EFI_ROM = 13
```

OptionalHeader64.Subsystem and OptionalHeader32.Subsystem values. 

### <a id="IMAGE_SUBSYSTEM_XBOX" href="#IMAGE_SUBSYSTEM_XBOX">const IMAGE_SUBSYSTEM_XBOX</a>

```
searchKey: pe.IMAGE_SUBSYSTEM_XBOX
```

```Go
const IMAGE_SUBSYSTEM_XBOX = 14
```

OptionalHeader64.Subsystem and OptionalHeader32.Subsystem values. 

### <a id="IMAGE_SUBSYSTEM_WINDOWS_BOOT_APPLICATION" href="#IMAGE_SUBSYSTEM_WINDOWS_BOOT_APPLICATION">const IMAGE_SUBSYSTEM_WINDOWS_BOOT_APPLICATION</a>

```
searchKey: pe.IMAGE_SUBSYSTEM_WINDOWS_BOOT_APPLICATION
```

```Go
const IMAGE_SUBSYSTEM_WINDOWS_BOOT_APPLICATION = 16
```

OptionalHeader64.Subsystem and OptionalHeader32.Subsystem values. 

### <a id="IMAGE_DLLCHARACTERISTICS_HIGH_ENTROPY_VA" href="#IMAGE_DLLCHARACTERISTICS_HIGH_ENTROPY_VA">const IMAGE_DLLCHARACTERISTICS_HIGH_ENTROPY_VA</a>

```
searchKey: pe.IMAGE_DLLCHARACTERISTICS_HIGH_ENTROPY_VA
```

```Go
const IMAGE_DLLCHARACTERISTICS_HIGH_ENTROPY_VA = 0x0020
```

OptionalHeader64.DllCharacteristics and OptionalHeader32.DllCharacteristics values. These can be combined together. 

### <a id="IMAGE_DLLCHARACTERISTICS_DYNAMIC_BASE" href="#IMAGE_DLLCHARACTERISTICS_DYNAMIC_BASE">const IMAGE_DLLCHARACTERISTICS_DYNAMIC_BASE</a>

```
searchKey: pe.IMAGE_DLLCHARACTERISTICS_DYNAMIC_BASE
```

```Go
const IMAGE_DLLCHARACTERISTICS_DYNAMIC_BASE = 0x0040
```

OptionalHeader64.DllCharacteristics and OptionalHeader32.DllCharacteristics values. These can be combined together. 

### <a id="IMAGE_DLLCHARACTERISTICS_FORCE_INTEGRITY" href="#IMAGE_DLLCHARACTERISTICS_FORCE_INTEGRITY">const IMAGE_DLLCHARACTERISTICS_FORCE_INTEGRITY</a>

```
searchKey: pe.IMAGE_DLLCHARACTERISTICS_FORCE_INTEGRITY
```

```Go
const IMAGE_DLLCHARACTERISTICS_FORCE_INTEGRITY = 0x0080
```

OptionalHeader64.DllCharacteristics and OptionalHeader32.DllCharacteristics values. These can be combined together. 

### <a id="IMAGE_DLLCHARACTERISTICS_NX_COMPAT" href="#IMAGE_DLLCHARACTERISTICS_NX_COMPAT">const IMAGE_DLLCHARACTERISTICS_NX_COMPAT</a>

```
searchKey: pe.IMAGE_DLLCHARACTERISTICS_NX_COMPAT
```

```Go
const IMAGE_DLLCHARACTERISTICS_NX_COMPAT = 0x0100
```

OptionalHeader64.DllCharacteristics and OptionalHeader32.DllCharacteristics values. These can be combined together. 

### <a id="IMAGE_DLLCHARACTERISTICS_NO_ISOLATION" href="#IMAGE_DLLCHARACTERISTICS_NO_ISOLATION">const IMAGE_DLLCHARACTERISTICS_NO_ISOLATION</a>

```
searchKey: pe.IMAGE_DLLCHARACTERISTICS_NO_ISOLATION
```

```Go
const IMAGE_DLLCHARACTERISTICS_NO_ISOLATION = 0x0200
```

OptionalHeader64.DllCharacteristics and OptionalHeader32.DllCharacteristics values. These can be combined together. 

### <a id="IMAGE_DLLCHARACTERISTICS_NO_SEH" href="#IMAGE_DLLCHARACTERISTICS_NO_SEH">const IMAGE_DLLCHARACTERISTICS_NO_SEH</a>

```
searchKey: pe.IMAGE_DLLCHARACTERISTICS_NO_SEH
```

```Go
const IMAGE_DLLCHARACTERISTICS_NO_SEH = 0x0400
```

OptionalHeader64.DllCharacteristics and OptionalHeader32.DllCharacteristics values. These can be combined together. 

### <a id="IMAGE_DLLCHARACTERISTICS_NO_BIND" href="#IMAGE_DLLCHARACTERISTICS_NO_BIND">const IMAGE_DLLCHARACTERISTICS_NO_BIND</a>

```
searchKey: pe.IMAGE_DLLCHARACTERISTICS_NO_BIND
```

```Go
const IMAGE_DLLCHARACTERISTICS_NO_BIND = 0x0800
```

OptionalHeader64.DllCharacteristics and OptionalHeader32.DllCharacteristics values. These can be combined together. 

### <a id="IMAGE_DLLCHARACTERISTICS_APPCONTAINER" href="#IMAGE_DLLCHARACTERISTICS_APPCONTAINER">const IMAGE_DLLCHARACTERISTICS_APPCONTAINER</a>

```
searchKey: pe.IMAGE_DLLCHARACTERISTICS_APPCONTAINER
```

```Go
const IMAGE_DLLCHARACTERISTICS_APPCONTAINER = 0x1000
```

OptionalHeader64.DllCharacteristics and OptionalHeader32.DllCharacteristics values. These can be combined together. 

### <a id="IMAGE_DLLCHARACTERISTICS_WDM_DRIVER" href="#IMAGE_DLLCHARACTERISTICS_WDM_DRIVER">const IMAGE_DLLCHARACTERISTICS_WDM_DRIVER</a>

```
searchKey: pe.IMAGE_DLLCHARACTERISTICS_WDM_DRIVER
```

```Go
const IMAGE_DLLCHARACTERISTICS_WDM_DRIVER = 0x2000
```

OptionalHeader64.DllCharacteristics and OptionalHeader32.DllCharacteristics values. These can be combined together. 

### <a id="IMAGE_DLLCHARACTERISTICS_GUARD_CF" href="#IMAGE_DLLCHARACTERISTICS_GUARD_CF">const IMAGE_DLLCHARACTERISTICS_GUARD_CF</a>

```
searchKey: pe.IMAGE_DLLCHARACTERISTICS_GUARD_CF
```

```Go
const IMAGE_DLLCHARACTERISTICS_GUARD_CF = 0x4000
```

OptionalHeader64.DllCharacteristics and OptionalHeader32.DllCharacteristics values. These can be combined together. 

### <a id="IMAGE_DLLCHARACTERISTICS_TERMINAL_SERVER_AWARE" href="#IMAGE_DLLCHARACTERISTICS_TERMINAL_SERVER_AWARE">const IMAGE_DLLCHARACTERISTICS_TERMINAL_SERVER_AWARE</a>

```
searchKey: pe.IMAGE_DLLCHARACTERISTICS_TERMINAL_SERVER_AWARE
```

```Go
const IMAGE_DLLCHARACTERISTICS_TERMINAL_SERVER_AWARE = 0x8000
```

OptionalHeader64.DllCharacteristics and OptionalHeader32.DllCharacteristics values. These can be combined together. 

### <a id="COFFSymbolSize" href="#COFFSymbolSize">const COFFSymbolSize</a>

```
searchKey: pe.COFFSymbolSize
```

```Go
const COFFSymbolSize = 18
```

### <a id="linkNoCgo" href="#linkNoCgo">const linkNoCgo</a>

```
searchKey: pe.linkNoCgo
tags: [private]
```

```Go
const linkNoCgo = iota
```

### <a id="linkCgoDefault" href="#linkCgoDefault">const linkCgoDefault</a>

```
searchKey: pe.linkCgoDefault
tags: [private]
```

```Go
const linkCgoDefault
```

### <a id="linkCgoInternal" href="#linkCgoInternal">const linkCgoInternal</a>

```
searchKey: pe.linkCgoInternal
tags: [private]
```

```Go
const linkCgoInternal
```

### <a id="linkCgoExternal" href="#linkCgoExternal">const linkCgoExternal</a>

```
searchKey: pe.linkCgoExternal
tags: [private]
```

```Go
const linkCgoExternal
```

### <a id="testprog" href="#testprog">const testprog</a>

```
searchKey: pe.testprog
tags: [private]
```

```Go
const testprog = ...
```

## <a id="var" href="#var">Variables</a>

### <a id="fileTests" href="#fileTests">var fileTests</a>

```
searchKey: pe.fileTests
tags: [private]
```

```Go
var fileTests = ...
```

## <a id="type" href="#type">Types</a>

### <a id="File" href="#File">type File struct</a>

```
searchKey: pe.File
```

```Go
type File struct {
	FileHeader
	OptionalHeader interface{} // of type *OptionalHeader32 or *OptionalHeader64
	Sections       []*Section
	Symbols        []*Symbol    // COFF symbols with auxiliary symbol records removed
	COFFSymbols    []COFFSymbol // all COFF symbols (including auxiliary symbol records)
	StringTable    StringTable

	closer io.Closer
}
```

A File represents an open PE file. 

#### <a id="Open" href="#Open">func Open(name string) (*File, error)</a>

```
searchKey: pe.Open
```

```Go
func Open(name string) (*File, error)
```

Open opens the named file using os.Open and prepares it for use as a PE binary. 

#### <a id="NewFile" href="#NewFile">func NewFile(r io.ReaderAt) (*File, error)</a>

```
searchKey: pe.NewFile
```

```Go
func NewFile(r io.ReaderAt) (*File, error)
```

NewFile creates a new File for accessing a PE binary in an underlying reader. 

#### <a id="File.Close" href="#File.Close">func (f *File) Close() error</a>

```
searchKey: pe.File.Close
```

```Go
func (f *File) Close() error
```

Close closes the File. If the File was created using NewFile directly instead of Open, Close has no effect. 

#### <a id="File.Section" href="#File.Section">func (f *File) Section(name string) *Section</a>

```
searchKey: pe.File.Section
```

```Go
func (f *File) Section(name string) *Section
```

Section returns the first section with the given name, or nil if no such section exists. 

#### <a id="File.DWARF" href="#File.DWARF">func (f *File) DWARF() (*dwarf.Data, error)</a>

```
searchKey: pe.File.DWARF
```

```Go
func (f *File) DWARF() (*dwarf.Data, error)
```

#### <a id="File.ImportedSymbols" href="#File.ImportedSymbols">func (f *File) ImportedSymbols() ([]string, error)</a>

```
searchKey: pe.File.ImportedSymbols
```

```Go
func (f *File) ImportedSymbols() ([]string, error)
```

ImportedSymbols returns the names of all symbols referred to by the binary f that are expected to be satisfied by other libraries at dynamic load time. It does not return weak symbols. 

#### <a id="File.ImportedLibraries" href="#File.ImportedLibraries">func (f *File) ImportedLibraries() ([]string, error)</a>

```
searchKey: pe.File.ImportedLibraries
```

```Go
func (f *File) ImportedLibraries() ([]string, error)
```

ImportedLibraries returns the names of all libraries referred to by the binary f that are expected to be linked with the binary at dynamic link time. 

### <a id="zeroReaderAt" href="#zeroReaderAt">type zeroReaderAt struct{}</a>

```
searchKey: pe.zeroReaderAt
tags: [private]
```

```Go
type zeroReaderAt struct{}
```

zeroReaderAt is ReaderAt that reads 0s. 

#### <a id="zeroReaderAt.ReadAt" href="#zeroReaderAt.ReadAt">func (w zeroReaderAt) ReadAt(p []byte, off int64) (n int, err error)</a>

```
searchKey: pe.zeroReaderAt.ReadAt
tags: [private]
```

```Go
func (w zeroReaderAt) ReadAt(p []byte, off int64) (n int, err error)
```

ReadAt writes len(p) 0s into p. 

### <a id="ImportDirectory" href="#ImportDirectory">type ImportDirectory struct</a>

```
searchKey: pe.ImportDirectory
```

```Go
type ImportDirectory struct {
	OriginalFirstThunk uint32
	TimeDateStamp      uint32
	ForwarderChain     uint32
	Name               uint32
	FirstThunk         uint32

	dll string
}
```

### <a id="FormatError" href="#FormatError">type FormatError struct{}</a>

```
searchKey: pe.FormatError
```

```Go
type FormatError struct {
}
```

FormatError is unused. The type is retained for compatibility. 

#### <a id="FormatError.Error" href="#FormatError.Error">func (e *FormatError) Error() string</a>

```
searchKey: pe.FormatError.Error
```

```Go
func (e *FormatError) Error() string
```

### <a id="FileHeader" href="#FileHeader">type FileHeader struct</a>

```
searchKey: pe.FileHeader
```

```Go
type FileHeader struct {
	Machine              uint16
	NumberOfSections     uint16
	TimeDateStamp        uint32
	PointerToSymbolTable uint32
	NumberOfSymbols      uint32
	SizeOfOptionalHeader uint16
	Characteristics      uint16
}
```

### <a id="DataDirectory" href="#DataDirectory">type DataDirectory struct</a>

```
searchKey: pe.DataDirectory
```

```Go
type DataDirectory struct {
	VirtualAddress uint32
	Size           uint32
}
```

### <a id="OptionalHeader32" href="#OptionalHeader32">type OptionalHeader32 struct</a>

```
searchKey: pe.OptionalHeader32
```

```Go
type OptionalHeader32 struct {
	Magic                       uint16
	MajorLinkerVersion          uint8
	MinorLinkerVersion          uint8
	SizeOfCode                  uint32
	SizeOfInitializedData       uint32
	SizeOfUninitializedData     uint32
	AddressOfEntryPoint         uint32
	BaseOfCode                  uint32
	BaseOfData                  uint32
	ImageBase                   uint32
	SectionAlignment            uint32
	FileAlignment               uint32
	MajorOperatingSystemVersion uint16
	MinorOperatingSystemVersion uint16
	MajorImageVersion           uint16
	MinorImageVersion           uint16
	MajorSubsystemVersion       uint16
	MinorSubsystemVersion       uint16
	Win32VersionValue           uint32
	SizeOfImage                 uint32
	SizeOfHeaders               uint32
	CheckSum                    uint32
	Subsystem                   uint16
	DllCharacteristics          uint16
	SizeOfStackReserve          uint32
	SizeOfStackCommit           uint32
	SizeOfHeapReserve           uint32
	SizeOfHeapCommit            uint32
	LoaderFlags                 uint32
	NumberOfRvaAndSizes         uint32
	DataDirectory               [16]DataDirectory
}
```

### <a id="OptionalHeader64" href="#OptionalHeader64">type OptionalHeader64 struct</a>

```
searchKey: pe.OptionalHeader64
```

```Go
type OptionalHeader64 struct {
	Magic                       uint16
	MajorLinkerVersion          uint8
	MinorLinkerVersion          uint8
	SizeOfCode                  uint32
	SizeOfInitializedData       uint32
	SizeOfUninitializedData     uint32
	AddressOfEntryPoint         uint32
	BaseOfCode                  uint32
	ImageBase                   uint64
	SectionAlignment            uint32
	FileAlignment               uint32
	MajorOperatingSystemVersion uint16
	MinorOperatingSystemVersion uint16
	MajorImageVersion           uint16
	MinorImageVersion           uint16
	MajorSubsystemVersion       uint16
	MinorSubsystemVersion       uint16
	Win32VersionValue           uint32
	SizeOfImage                 uint32
	SizeOfHeaders               uint32
	CheckSum                    uint32
	Subsystem                   uint16
	DllCharacteristics          uint16
	SizeOfStackReserve          uint64
	SizeOfStackCommit           uint64
	SizeOfHeapReserve           uint64
	SizeOfHeapCommit            uint64
	LoaderFlags                 uint32
	NumberOfRvaAndSizes         uint32
	DataDirectory               [16]DataDirectory
}
```

### <a id="SectionHeader32" href="#SectionHeader32">type SectionHeader32 struct</a>

```
searchKey: pe.SectionHeader32
```

```Go
type SectionHeader32 struct {
	Name                 [8]uint8
	VirtualSize          uint32
	VirtualAddress       uint32
	SizeOfRawData        uint32
	PointerToRawData     uint32
	PointerToRelocations uint32
	PointerToLineNumbers uint32
	NumberOfRelocations  uint16
	NumberOfLineNumbers  uint16
	Characteristics      uint32
}
```

SectionHeader32 represents real PE COFF section header. 

#### <a id="SectionHeader32.fullName" href="#SectionHeader32.fullName">func (sh *SectionHeader32) fullName(st StringTable) (string, error)</a>

```
searchKey: pe.SectionHeader32.fullName
tags: [private]
```

```Go
func (sh *SectionHeader32) fullName(st StringTable) (string, error)
```

fullName finds real name of section sh. Normally name is stored in sh.Name, but if it is longer then 8 characters, it is stored in COFF string table st instead. 

### <a id="Reloc" href="#Reloc">type Reloc struct</a>

```
searchKey: pe.Reloc
```

```Go
type Reloc struct {
	VirtualAddress   uint32
	SymbolTableIndex uint32
	Type             uint16
}
```

Reloc represents a PE COFF relocation. Each section contains its own relocation list. 

### <a id="SectionHeader" href="#SectionHeader">type SectionHeader struct</a>

```
searchKey: pe.SectionHeader
```

```Go
type SectionHeader struct {
	Name                 string
	VirtualSize          uint32
	VirtualAddress       uint32
	Size                 uint32
	Offset               uint32
	PointerToRelocations uint32
	PointerToLineNumbers uint32
	NumberOfRelocations  uint16
	NumberOfLineNumbers  uint16
	Characteristics      uint32
}
```

SectionHeader is similar to SectionHeader32 with Name field replaced by Go string. 

### <a id="Section" href="#Section">type Section struct</a>

```
searchKey: pe.Section
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

Section provides access to PE COFF section. 

#### <a id="Section.Data" href="#Section.Data">func (s *Section) Data() ([]byte, error)</a>

```
searchKey: pe.Section.Data
```

```Go
func (s *Section) Data() ([]byte, error)
```

Data reads and returns the contents of the PE section s. 

#### <a id="Section.Open" href="#Section.Open">func (s *Section) Open() io.ReadSeeker</a>

```
searchKey: pe.Section.Open
```

```Go
func (s *Section) Open() io.ReadSeeker
```

Open returns a new ReadSeeker reading the PE section s. 

### <a id="StringTable" href="#StringTable">type StringTable []byte</a>

```
searchKey: pe.StringTable
```

```Go
type StringTable []byte
```

StringTable is a COFF string table. 

#### <a id="readStringTable" href="#readStringTable">func readStringTable(fh *FileHeader, r io.ReadSeeker) (StringTable, error)</a>

```
searchKey: pe.readStringTable
tags: [private]
```

```Go
func readStringTable(fh *FileHeader, r io.ReadSeeker) (StringTable, error)
```

#### <a id="StringTable.String" href="#StringTable.String">func (st StringTable) String(start uint32) (string, error)</a>

```
searchKey: pe.StringTable.String
```

```Go
func (st StringTable) String(start uint32) (string, error)
```

String extracts string from COFF string table st at offset start. 

### <a id="COFFSymbol" href="#COFFSymbol">type COFFSymbol struct</a>

```
searchKey: pe.COFFSymbol
```

```Go
type COFFSymbol struct {
	Name               [8]uint8
	Value              uint32
	SectionNumber      int16
	Type               uint16
	StorageClass       uint8
	NumberOfAuxSymbols uint8
}
```

COFFSymbol represents single COFF symbol table record. 

#### <a id="COFFSymbol.FullName" href="#COFFSymbol.FullName">func (sym *COFFSymbol) FullName(st StringTable) (string, error)</a>

```
searchKey: pe.COFFSymbol.FullName
```

```Go
func (sym *COFFSymbol) FullName(st StringTable) (string, error)
```

FullName finds real name of symbol sym. Normally name is stored in sym.Name, but if it is longer then 8 characters, it is stored in COFF string table st instead. 

### <a id="Symbol" href="#Symbol">type Symbol struct</a>

```
searchKey: pe.Symbol
```

```Go
type Symbol struct {
	Name          string
	Value         uint32
	SectionNumber int16
	Type          uint16
	StorageClass  uint8
}
```

Symbol is similar to COFFSymbol with Name field replaced by Go string. Symbol also does not have NumberOfAuxSymbols. 

### <a id="fileTest" href="#fileTest">type fileTest struct</a>

```
searchKey: pe.fileTest
tags: [private]
```

```Go
type fileTest struct {
	file           string
	hdr            FileHeader
	opthdr         interface{}
	sections       []*SectionHeader
	symbols        []*Symbol
	hasNoDwarfInfo bool
}
```

## <a id="func" href="#func">Functions</a>

### <a id="getString" href="#getString">func getString(section []byte, start int) (string, bool)</a>

```
searchKey: pe.getString
tags: [private]
```

```Go
func getString(section []byte, start int) (string, bool)
```

getString extracts a string from symbol string table. 

### <a id="readOptionalHeader" href="#readOptionalHeader">func readOptionalHeader(r io.ReadSeeker, sz uint16) (interface{}, error)</a>

```
searchKey: pe.readOptionalHeader
tags: [private]
```

```Go
func readOptionalHeader(r io.ReadSeeker, sz uint16) (interface{}, error)
```

readOptionalHeader accepts a io.ReadSeeker pointing to optional header in the PE file and its size as seen in the file header. It parses the given size of bytes and returns optional header. It infers whether the bytes being parsed refer to 32 bit or 64 bit version of optional header. 

### <a id="readDataDirectories" href="#readDataDirectories">func readDataDirectories(r io.ReadSeeker, sz uint16, n uint32) ([]DataDirectory, error)</a>

```
searchKey: pe.readDataDirectories
tags: [private]
```

```Go
func readDataDirectories(r io.ReadSeeker, sz uint16, n uint32) ([]DataDirectory, error)
```

readDataDirectories accepts a io.ReadSeeker pointing to data directories in the PE file, its size and number of data directories as seen in optional header. It parses the given size of bytes and returns given number of data directories. 

### <a id="readRelocs" href="#readRelocs">func readRelocs(sh *SectionHeader, r io.ReadSeeker) ([]Reloc, error)</a>

```
searchKey: pe.readRelocs
tags: [private]
```

```Go
func readRelocs(sh *SectionHeader, r io.ReadSeeker) ([]Reloc, error)
```

### <a id="cstring" href="#cstring">func cstring(b []byte) string</a>

```
searchKey: pe.cstring
tags: [private]
```

```Go
func cstring(b []byte) string
```

cstring converts ASCII byte sequence b to string. It stops once it finds 0 or reaches end of b. 

### <a id="readCOFFSymbols" href="#readCOFFSymbols">func readCOFFSymbols(fh *FileHeader, r io.ReadSeeker) ([]COFFSymbol, error)</a>

```
searchKey: pe.readCOFFSymbols
tags: [private]
```

```Go
func readCOFFSymbols(fh *FileHeader, r io.ReadSeeker) ([]COFFSymbol, error)
```

### <a id="isSymNameOffset" href="#isSymNameOffset">func isSymNameOffset(name [8]byte) (bool, uint32)</a>

```
searchKey: pe.isSymNameOffset
tags: [private]
```

```Go
func isSymNameOffset(name [8]byte) (bool, uint32)
```

isSymNameOffset checks symbol name if it is encoded as offset into string table. 

### <a id="removeAuxSymbols" href="#removeAuxSymbols">func removeAuxSymbols(allsyms []COFFSymbol, st StringTable) ([]*Symbol, error)</a>

```
searchKey: pe.removeAuxSymbols
tags: [private]
```

```Go
func removeAuxSymbols(allsyms []COFFSymbol, st StringTable) ([]*Symbol, error)
```

### <a id="testCgoDWARF" href="#testCgoDWARF">func testCgoDWARF(t *testing.T, linktype int)</a>

```
searchKey: pe.testCgoDWARF
tags: [private]
```

```Go
func testCgoDWARF(t *testing.T, linktype int)
```

### <a id="TestDefaultLinkerDWARF" href="#TestDefaultLinkerDWARF">func TestDefaultLinkerDWARF(t *testing.T)</a>

```
searchKey: pe.TestDefaultLinkerDWARF
tags: [private]
```

```Go
func TestDefaultLinkerDWARF(t *testing.T)
```

### <a id="TestInternalLinkerDWARF" href="#TestInternalLinkerDWARF">func TestInternalLinkerDWARF(t *testing.T)</a>

```
searchKey: pe.TestInternalLinkerDWARF
tags: [private]
```

```Go
func TestInternalLinkerDWARF(t *testing.T)
```

### <a id="TestExternalLinkerDWARF" href="#TestExternalLinkerDWARF">func TestExternalLinkerDWARF(t *testing.T)</a>

```
searchKey: pe.TestExternalLinkerDWARF
tags: [private]
```

```Go
func TestExternalLinkerDWARF(t *testing.T)
```

### <a id="isOptHdrEq" href="#isOptHdrEq">func isOptHdrEq(a, b interface{}) bool</a>

```
searchKey: pe.isOptHdrEq
tags: [private]
```

```Go
func isOptHdrEq(a, b interface{}) bool
```

### <a id="TestOpen" href="#TestOpen">func TestOpen(t *testing.T)</a>

```
searchKey: pe.TestOpen
tags: [private]
```

```Go
func TestOpen(t *testing.T)
```

### <a id="TestOpenFailure" href="#TestOpenFailure">func TestOpenFailure(t *testing.T)</a>

```
searchKey: pe.TestOpenFailure
tags: [private]
```

```Go
func TestOpenFailure(t *testing.T)
```

### <a id="getImageBase" href="#getImageBase">func getImageBase(f *File) uintptr</a>

```
searchKey: pe.getImageBase
tags: [private]
```

```Go
func getImageBase(f *File) uintptr
```

### <a id="testDWARF" href="#testDWARF">func testDWARF(t *testing.T, linktype int)</a>

```
searchKey: pe.testDWARF
tags: [private]
```

```Go
func testDWARF(t *testing.T, linktype int)
```

### <a id="TestBSSHasZeros" href="#TestBSSHasZeros">func TestBSSHasZeros(t *testing.T)</a>

```
searchKey: pe.TestBSSHasZeros
tags: [private]
```

```Go
func TestBSSHasZeros(t *testing.T)
```

### <a id="TestDWARF" href="#TestDWARF">func TestDWARF(t *testing.T)</a>

```
searchKey: pe.TestDWARF
tags: [private]
```

```Go
func TestDWARF(t *testing.T)
```

### <a id="TestBuildingWindowsGUI" href="#TestBuildingWindowsGUI">func TestBuildingWindowsGUI(t *testing.T)</a>

```
searchKey: pe.TestBuildingWindowsGUI
tags: [private]
```

```Go
func TestBuildingWindowsGUI(t *testing.T)
```

### <a id="TestImportTableInUnknownSection" href="#TestImportTableInUnknownSection">func TestImportTableInUnknownSection(t *testing.T)</a>

```
searchKey: pe.TestImportTableInUnknownSection
tags: [private]
```

```Go
func TestImportTableInUnknownSection(t *testing.T)
```

### <a id="TestInvalidOptionalHeaderMagic" href="#TestInvalidOptionalHeaderMagic">func TestInvalidOptionalHeaderMagic(t *testing.T)</a>

```
searchKey: pe.TestInvalidOptionalHeaderMagic
tags: [private]
```

```Go
func TestInvalidOptionalHeaderMagic(t *testing.T)
```

### <a id="TestImportedSymbolsNoPanicMissingOptionalHeader" href="#TestImportedSymbolsNoPanicMissingOptionalHeader">func TestImportedSymbolsNoPanicMissingOptionalHeader(t *testing.T)</a>

```
searchKey: pe.TestImportedSymbolsNoPanicMissingOptionalHeader
tags: [private]
```

```Go
func TestImportedSymbolsNoPanicMissingOptionalHeader(t *testing.T)
```

### <a id="TestImportedSymbolsNoPanicWithSliceOutOfBound" href="#TestImportedSymbolsNoPanicWithSliceOutOfBound">func TestImportedSymbolsNoPanicWithSliceOutOfBound(t *testing.T)</a>

```
searchKey: pe.TestImportedSymbolsNoPanicWithSliceOutOfBound
tags: [private]
```

```Go
func TestImportedSymbolsNoPanicWithSliceOutOfBound(t *testing.T)
```

