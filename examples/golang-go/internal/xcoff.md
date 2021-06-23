# Package xcoff

Package xcoff implements access to XCOFF (Extended Common Object File Format) files. 

## Index

* [Constants](#const)
    * [const SAIAMAG](#SAIAMAG)
    * [const AIAFMAG](#AIAFMAG)
    * [const AIAMAG](#AIAMAG)
    * [const AIAMAGBIG](#AIAMAGBIG)
    * [const FL_HSZ_BIG](#FL_HSZ_BIG)
    * [const AR_HSZ_BIG](#AR_HSZ_BIG)
    * [const FILHSZ_32](#FILHSZ_32)
    * [const FILHSZ_64](#FILHSZ_64)
    * [const U802TOCMAGIC](#U802TOCMAGIC)
    * [const U64_TOCMAGIC](#U64_TOCMAGIC)
    * [const F_RELFLG](#F_RELFLG)
    * [const F_EXEC](#F_EXEC)
    * [const F_LNNO](#F_LNNO)
    * [const F_FDPR_PROF](#F_FDPR_PROF)
    * [const F_FDPR_OPTI](#F_FDPR_OPTI)
    * [const F_DSA](#F_DSA)
    * [const F_VARPG](#F_VARPG)
    * [const F_DYNLOAD](#F_DYNLOAD)
    * [const F_SHROBJ](#F_SHROBJ)
    * [const F_LOADONLY](#F_LOADONLY)
    * [const STYP_DWARF](#STYP_DWARF)
    * [const STYP_TEXT](#STYP_TEXT)
    * [const STYP_DATA](#STYP_DATA)
    * [const STYP_BSS](#STYP_BSS)
    * [const STYP_EXCEPT](#STYP_EXCEPT)
    * [const STYP_INFO](#STYP_INFO)
    * [const STYP_TDATA](#STYP_TDATA)
    * [const STYP_TBSS](#STYP_TBSS)
    * [const STYP_LOADER](#STYP_LOADER)
    * [const STYP_DEBUG](#STYP_DEBUG)
    * [const STYP_TYPCHK](#STYP_TYPCHK)
    * [const STYP_OVRFLO](#STYP_OVRFLO)
    * [const SSUBTYP_DWINFO](#SSUBTYP_DWINFO)
    * [const SSUBTYP_DWLINE](#SSUBTYP_DWLINE)
    * [const SSUBTYP_DWPBNMS](#SSUBTYP_DWPBNMS)
    * [const SSUBTYP_DWPBTYP](#SSUBTYP_DWPBTYP)
    * [const SSUBTYP_DWARNGE](#SSUBTYP_DWARNGE)
    * [const SSUBTYP_DWABREV](#SSUBTYP_DWABREV)
    * [const SSUBTYP_DWSTR](#SSUBTYP_DWSTR)
    * [const SSUBTYP_DWRNGES](#SSUBTYP_DWRNGES)
    * [const SSUBTYP_DWLOC](#SSUBTYP_DWLOC)
    * [const SSUBTYP_DWFRAME](#SSUBTYP_DWFRAME)
    * [const SSUBTYP_DWMAC](#SSUBTYP_DWMAC)
    * [const SYMESZ](#SYMESZ)
    * [const N_DEBUG](#N_DEBUG)
    * [const N_ABS](#N_ABS)
    * [const N_UNDEF](#N_UNDEF)
    * [const SYM_V_INTERNAL](#SYM_V_INTERNAL)
    * [const SYM_V_HIDDEN](#SYM_V_HIDDEN)
    * [const SYM_V_PROTECTED](#SYM_V_PROTECTED)
    * [const SYM_V_EXPORTED](#SYM_V_EXPORTED)
    * [const SYM_TYPE_FUNC](#SYM_TYPE_FUNC)
    * [const C_NULL](#C_NULL)
    * [const C_EXT](#C_EXT)
    * [const C_STAT](#C_STAT)
    * [const C_BLOCK](#C_BLOCK)
    * [const C_FCN](#C_FCN)
    * [const C_FILE](#C_FILE)
    * [const C_HIDEXT](#C_HIDEXT)
    * [const C_BINCL](#C_BINCL)
    * [const C_EINCL](#C_EINCL)
    * [const C_WEAKEXT](#C_WEAKEXT)
    * [const C_DWARF](#C_DWARF)
    * [const C_GSYM](#C_GSYM)
    * [const C_LSYM](#C_LSYM)
    * [const C_PSYM](#C_PSYM)
    * [const C_RSYM](#C_RSYM)
    * [const C_RPSYM](#C_RPSYM)
    * [const C_STSYM](#C_STSYM)
    * [const C_BCOMM](#C_BCOMM)
    * [const C_ECOML](#C_ECOML)
    * [const C_ECOMM](#C_ECOMM)
    * [const C_DECL](#C_DECL)
    * [const C_ENTRY](#C_ENTRY)
    * [const C_FUN](#C_FUN)
    * [const C_BSTAT](#C_BSTAT)
    * [const C_ESTAT](#C_ESTAT)
    * [const C_GTLS](#C_GTLS)
    * [const C_STTLS](#C_STTLS)
    * [const _AUX_EXCEPT](#_AUX_EXCEPT)
    * [const _AUX_FCN](#_AUX_FCN)
    * [const _AUX_SYM](#_AUX_SYM)
    * [const _AUX_FILE](#_AUX_FILE)
    * [const _AUX_CSECT](#_AUX_CSECT)
    * [const _AUX_SECT](#_AUX_SECT)
    * [const XTY_ER](#XTY_ER)
    * [const XTY_SD](#XTY_SD)
    * [const XTY_LD](#XTY_LD)
    * [const XTY_CM](#XTY_CM)
    * [const XFT_FN](#XFT_FN)
    * [const XFT_CT](#XFT_CT)
    * [const XFT_CV](#XFT_CV)
    * [const XFT_CD](#XFT_CD)
    * [const XMC_PR](#XMC_PR)
    * [const XMC_RO](#XMC_RO)
    * [const XMC_DB](#XMC_DB)
    * [const XMC_TC](#XMC_TC)
    * [const XMC_UA](#XMC_UA)
    * [const XMC_RW](#XMC_RW)
    * [const XMC_GL](#XMC_GL)
    * [const XMC_XO](#XMC_XO)
    * [const XMC_SV](#XMC_SV)
    * [const XMC_BS](#XMC_BS)
    * [const XMC_DS](#XMC_DS)
    * [const XMC_UC](#XMC_UC)
    * [const XMC_TC0](#XMC_TC0)
    * [const XMC_TD](#XMC_TD)
    * [const XMC_SV64](#XMC_SV64)
    * [const XMC_SV3264](#XMC_SV3264)
    * [const XMC_TL](#XMC_TL)
    * [const XMC_UL](#XMC_UL)
    * [const XMC_TE](#XMC_TE)
    * [const LDHDRSZ_32](#LDHDRSZ_32)
    * [const LDHDRSZ_64](#LDHDRSZ_64)
    * [const R_POS](#R_POS)
    * [const R_NEG](#R_NEG)
    * [const R_REL](#R_REL)
    * [const R_TOC](#R_TOC)
    * [const R_TRL](#R_TRL)
    * [const R_TRLA](#R_TRLA)
    * [const R_GL](#R_GL)
    * [const R_TCL](#R_TCL)
    * [const R_RL](#R_RL)
    * [const R_RLA](#R_RLA)
    * [const R_REF](#R_REF)
    * [const R_BA](#R_BA)
    * [const R_RBA](#R_RBA)
    * [const R_BR](#R_BR)
    * [const R_RBR](#R_RBR)
    * [const R_TLS](#R_TLS)
    * [const R_TLS_IE](#R_TLS_IE)
    * [const R_TLS_LD](#R_TLS_LD)
    * [const R_TLS_LE](#R_TLS_LE)
    * [const R_TLSM](#R_TLSM)
    * [const R_TLSML](#R_TLSML)
    * [const R_TOCU](#R_TOCU)
    * [const R_TOCL](#R_TOCL)
* [Variables](#var)
    * [var archTest](#archTest)
    * [var fileTests](#fileTests)
* [Types](#type)
    * [type bigarFileHeader struct](#bigarFileHeader)
    * [type bigarMemberHeader struct](#bigarMemberHeader)
    * [type Archive struct](#Archive)
        * [func OpenArchive(name string) (*Archive, error)](#OpenArchive)
        * [func NewArchive(r io.ReaderAt) (*Archive, error)](#NewArchive)
        * [func (a *Archive) Close() error](#Archive.Close)
        * [func (arch *Archive) GetFile(name string) (*File, error)](#Archive.GetFile)
    * [type ArchiveHeader struct](#ArchiveHeader)
    * [type Member struct](#Member)
    * [type MemberHeader struct](#MemberHeader)
    * [type SectionHeader struct](#SectionHeader)
    * [type Section struct](#Section)
        * [func (s *Section) Data() ([]byte, error)](#Section.Data)
    * [type AuxiliaryCSect struct](#AuxiliaryCSect)
    * [type AuxiliaryFcn struct](#AuxiliaryFcn)
    * [type Symbol struct](#Symbol)
    * [type Reloc struct](#Reloc)
    * [type ImportedSymbol struct](#ImportedSymbol)
    * [type FileHeader struct](#FileHeader)
    * [type File struct](#File)
        * [func Open(name string) (*File, error)](#Open)
        * [func NewFile(r io.ReaderAt) (*File, error)](#NewFile)
        * [func (f *File) Close() error](#File.Close)
        * [func (f *File) Section(name string) *Section](#File.Section)
        * [func (f *File) SectionByType(typ uint32) *Section](#File.SectionByType)
        * [func (f *File) CSect(name string) []byte](#File.CSect)
        * [func (f *File) DWARF() (*dwarf.Data, error)](#File.DWARF)
        * [func (f *File) readImportIDs(s *Section) ([]string, error)](#File.readImportIDs)
        * [func (f *File) ImportedSymbols() ([]ImportedSymbol, error)](#File.ImportedSymbols)
        * [func (f *File) ImportedLibraries() ([]string, error)](#File.ImportedLibraries)
    * [type zeroReaderAt struct{}](#zeroReaderAt)
        * [func (w zeroReaderAt) ReadAt(p []byte, off int64) (n int, err error)](#zeroReaderAt.ReadAt)
    * [type FileHeader32 struct](#FileHeader32)
    * [type FileHeader64 struct](#FileHeader64)
    * [type SectionHeader32 struct](#SectionHeader32)
    * [type SectionHeader64 struct](#SectionHeader64)
    * [type SymEnt32 struct](#SymEnt32)
    * [type SymEnt64 struct](#SymEnt64)
    * [type AuxFile64 struct](#AuxFile64)
    * [type AuxFcn32 struct](#AuxFcn32)
    * [type AuxFcn64 struct](#AuxFcn64)
    * [type AuxSect64 struct](#AuxSect64)
    * [type AuxCSect32 struct](#AuxCSect32)
    * [type AuxCSect64 struct](#AuxCSect64)
    * [type LoaderHeader32 struct](#LoaderHeader32)
    * [type LoaderHeader64 struct](#LoaderHeader64)
    * [type LoaderSymbol32 struct](#LoaderSymbol32)
    * [type LoaderSymbol64 struct](#LoaderSymbol64)
    * [type Reloc32 struct](#Reloc32)
    * [type Reloc64 struct](#Reloc64)
    * [type archiveTest struct](#archiveTest)
    * [type fileTest struct](#fileTest)
* [Functions](#func)
    * [func cstring(b []byte) string](#cstring)
    * [func getString(st []byte, offset uint32) (string, bool)](#getString)
    * [func TestOpenArchive(t *testing.T)](#TestOpenArchive)
    * [func TestOpen(t *testing.T)](#TestOpen)
    * [func TestOpenFailure(t *testing.T)](#TestOpenFailure)


## <a id="const" href="#const">Constants</a>

```
tags: [private]
```

### <a id="SAIAMAG" href="#SAIAMAG">const SAIAMAG</a>

```
searchKey: xcoff.SAIAMAG
```

```Go
const SAIAMAG = 0x8
```

### <a id="AIAFMAG" href="#AIAFMAG">const AIAFMAG</a>

```
searchKey: xcoff.AIAFMAG
```

```Go
const AIAFMAG = "`\n"
```

### <a id="AIAMAG" href="#AIAMAG">const AIAMAG</a>

```
searchKey: xcoff.AIAMAG
```

```Go
const AIAMAG = "<aiaff>\n"
```

### <a id="AIAMAGBIG" href="#AIAMAGBIG">const AIAMAGBIG</a>

```
searchKey: xcoff.AIAMAGBIG
```

```Go
const AIAMAGBIG = "<bigaf>\n"
```

### <a id="FL_HSZ_BIG" href="#FL_HSZ_BIG">const FL_HSZ_BIG</a>

```
searchKey: xcoff.FL_HSZ_BIG
```

```Go
const FL_HSZ_BIG = 0x80
```

Sizeof 

### <a id="AR_HSZ_BIG" href="#AR_HSZ_BIG">const AR_HSZ_BIG</a>

```
searchKey: xcoff.AR_HSZ_BIG
```

```Go
const AR_HSZ_BIG = 0x70
```

### <a id="FILHSZ_32" href="#FILHSZ_32">const FILHSZ_32</a>

```
searchKey: xcoff.FILHSZ_32
```

```Go
const FILHSZ_32 = 20
```

### <a id="FILHSZ_64" href="#FILHSZ_64">const FILHSZ_64</a>

```
searchKey: xcoff.FILHSZ_64
```

```Go
const FILHSZ_64 = 24
```

### <a id="U802TOCMAGIC" href="#U802TOCMAGIC">const U802TOCMAGIC</a>

```
searchKey: xcoff.U802TOCMAGIC
```

```Go
const U802TOCMAGIC = 0737 // AIX 32-bit XCOFF

```

### <a id="U64_TOCMAGIC" href="#U64_TOCMAGIC">const U64_TOCMAGIC</a>

```
searchKey: xcoff.U64_TOCMAGIC
```

```Go
const U64_TOCMAGIC = 0767 // AIX 64-bit XCOFF

```

### <a id="F_RELFLG" href="#F_RELFLG">const F_RELFLG</a>

```
searchKey: xcoff.F_RELFLG
```

```Go
const F_RELFLG = 0x0001
```

Flags that describe the type of the object file. 

### <a id="F_EXEC" href="#F_EXEC">const F_EXEC</a>

```
searchKey: xcoff.F_EXEC
```

```Go
const F_EXEC = 0x0002
```

Flags that describe the type of the object file. 

### <a id="F_LNNO" href="#F_LNNO">const F_LNNO</a>

```
searchKey: xcoff.F_LNNO
```

```Go
const F_LNNO = 0x0004
```

Flags that describe the type of the object file. 

### <a id="F_FDPR_PROF" href="#F_FDPR_PROF">const F_FDPR_PROF</a>

```
searchKey: xcoff.F_FDPR_PROF
```

```Go
const F_FDPR_PROF = 0x0010
```

Flags that describe the type of the object file. 

### <a id="F_FDPR_OPTI" href="#F_FDPR_OPTI">const F_FDPR_OPTI</a>

```
searchKey: xcoff.F_FDPR_OPTI
```

```Go
const F_FDPR_OPTI = 0x0020
```

Flags that describe the type of the object file. 

### <a id="F_DSA" href="#F_DSA">const F_DSA</a>

```
searchKey: xcoff.F_DSA
```

```Go
const F_DSA = 0x0040
```

Flags that describe the type of the object file. 

### <a id="F_VARPG" href="#F_VARPG">const F_VARPG</a>

```
searchKey: xcoff.F_VARPG
```

```Go
const F_VARPG = 0x0100
```

Flags that describe the type of the object file. 

### <a id="F_DYNLOAD" href="#F_DYNLOAD">const F_DYNLOAD</a>

```
searchKey: xcoff.F_DYNLOAD
```

```Go
const F_DYNLOAD = 0x1000
```

Flags that describe the type of the object file. 

### <a id="F_SHROBJ" href="#F_SHROBJ">const F_SHROBJ</a>

```
searchKey: xcoff.F_SHROBJ
```

```Go
const F_SHROBJ = 0x2000
```

Flags that describe the type of the object file. 

### <a id="F_LOADONLY" href="#F_LOADONLY">const F_LOADONLY</a>

```
searchKey: xcoff.F_LOADONLY
```

```Go
const F_LOADONLY = 0x4000
```

Flags that describe the type of the object file. 

### <a id="STYP_DWARF" href="#STYP_DWARF">const STYP_DWARF</a>

```
searchKey: xcoff.STYP_DWARF
```

```Go
const STYP_DWARF = 0x0010
```

Flags defining the section type. 

### <a id="STYP_TEXT" href="#STYP_TEXT">const STYP_TEXT</a>

```
searchKey: xcoff.STYP_TEXT
```

```Go
const STYP_TEXT = 0x0020
```

Flags defining the section type. 

### <a id="STYP_DATA" href="#STYP_DATA">const STYP_DATA</a>

```
searchKey: xcoff.STYP_DATA
```

```Go
const STYP_DATA = 0x0040
```

Flags defining the section type. 

### <a id="STYP_BSS" href="#STYP_BSS">const STYP_BSS</a>

```
searchKey: xcoff.STYP_BSS
```

```Go
const STYP_BSS = 0x0080
```

Flags defining the section type. 

### <a id="STYP_EXCEPT" href="#STYP_EXCEPT">const STYP_EXCEPT</a>

```
searchKey: xcoff.STYP_EXCEPT
```

```Go
const STYP_EXCEPT = 0x0100
```

Flags defining the section type. 

### <a id="STYP_INFO" href="#STYP_INFO">const STYP_INFO</a>

```
searchKey: xcoff.STYP_INFO
```

```Go
const STYP_INFO = 0x0200
```

Flags defining the section type. 

### <a id="STYP_TDATA" href="#STYP_TDATA">const STYP_TDATA</a>

```
searchKey: xcoff.STYP_TDATA
```

```Go
const STYP_TDATA = 0x0400
```

Flags defining the section type. 

### <a id="STYP_TBSS" href="#STYP_TBSS">const STYP_TBSS</a>

```
searchKey: xcoff.STYP_TBSS
```

```Go
const STYP_TBSS = 0x0800
```

Flags defining the section type. 

### <a id="STYP_LOADER" href="#STYP_LOADER">const STYP_LOADER</a>

```
searchKey: xcoff.STYP_LOADER
```

```Go
const STYP_LOADER = 0x1000
```

Flags defining the section type. 

### <a id="STYP_DEBUG" href="#STYP_DEBUG">const STYP_DEBUG</a>

```
searchKey: xcoff.STYP_DEBUG
```

```Go
const STYP_DEBUG = 0x2000
```

Flags defining the section type. 

### <a id="STYP_TYPCHK" href="#STYP_TYPCHK">const STYP_TYPCHK</a>

```
searchKey: xcoff.STYP_TYPCHK
```

```Go
const STYP_TYPCHK = 0x4000
```

Flags defining the section type. 

### <a id="STYP_OVRFLO" href="#STYP_OVRFLO">const STYP_OVRFLO</a>

```
searchKey: xcoff.STYP_OVRFLO
```

```Go
const STYP_OVRFLO = 0x8000
```

Flags defining the section type. 

### <a id="SSUBTYP_DWINFO" href="#SSUBTYP_DWINFO">const SSUBTYP_DWINFO</a>

```
searchKey: xcoff.SSUBTYP_DWINFO
```

```Go
const SSUBTYP_DWINFO = 0x10000 // DWARF info section

```

### <a id="SSUBTYP_DWLINE" href="#SSUBTYP_DWLINE">const SSUBTYP_DWLINE</a>

```
searchKey: xcoff.SSUBTYP_DWLINE
```

```Go
const SSUBTYP_DWLINE = 0x20000 // DWARF line-number section

```

### <a id="SSUBTYP_DWPBNMS" href="#SSUBTYP_DWPBNMS">const SSUBTYP_DWPBNMS</a>

```
searchKey: xcoff.SSUBTYP_DWPBNMS
```

```Go
const SSUBTYP_DWPBNMS = 0x30000 // DWARF public names section

```

### <a id="SSUBTYP_DWPBTYP" href="#SSUBTYP_DWPBTYP">const SSUBTYP_DWPBTYP</a>

```
searchKey: xcoff.SSUBTYP_DWPBTYP
```

```Go
const SSUBTYP_DWPBTYP = 0x40000 // DWARF public types section

```

### <a id="SSUBTYP_DWARNGE" href="#SSUBTYP_DWARNGE">const SSUBTYP_DWARNGE</a>

```
searchKey: xcoff.SSUBTYP_DWARNGE
```

```Go
const SSUBTYP_DWARNGE = 0x50000 // DWARF aranges section

```

### <a id="SSUBTYP_DWABREV" href="#SSUBTYP_DWABREV">const SSUBTYP_DWABREV</a>

```
searchKey: xcoff.SSUBTYP_DWABREV
```

```Go
const SSUBTYP_DWABREV = 0x60000 // DWARF abbreviation section

```

### <a id="SSUBTYP_DWSTR" href="#SSUBTYP_DWSTR">const SSUBTYP_DWSTR</a>

```
searchKey: xcoff.SSUBTYP_DWSTR
```

```Go
const SSUBTYP_DWSTR = 0x70000 // DWARF strings section

```

### <a id="SSUBTYP_DWRNGES" href="#SSUBTYP_DWRNGES">const SSUBTYP_DWRNGES</a>

```
searchKey: xcoff.SSUBTYP_DWRNGES
```

```Go
const SSUBTYP_DWRNGES = 0x80000 // DWARF ranges section

```

### <a id="SSUBTYP_DWLOC" href="#SSUBTYP_DWLOC">const SSUBTYP_DWLOC</a>

```
searchKey: xcoff.SSUBTYP_DWLOC
```

```Go
const SSUBTYP_DWLOC = 0x90000 // DWARF location lists section

```

### <a id="SSUBTYP_DWFRAME" href="#SSUBTYP_DWFRAME">const SSUBTYP_DWFRAME</a>

```
searchKey: xcoff.SSUBTYP_DWFRAME
```

```Go
const SSUBTYP_DWFRAME = 0xA0000 // DWARF frames section

```

### <a id="SSUBTYP_DWMAC" href="#SSUBTYP_DWMAC">const SSUBTYP_DWMAC</a>

```
searchKey: xcoff.SSUBTYP_DWMAC
```

```Go
const SSUBTYP_DWMAC = 0xB0000 // DWARF macros section

```

### <a id="SYMESZ" href="#SYMESZ">const SYMESZ</a>

```
searchKey: xcoff.SYMESZ
```

```Go
const SYMESZ = 18
```

### <a id="N_DEBUG" href="#N_DEBUG">const N_DEBUG</a>

```
searchKey: xcoff.N_DEBUG
```

```Go
const N_DEBUG = -2
```

Nscnum 

### <a id="N_ABS" href="#N_ABS">const N_ABS</a>

```
searchKey: xcoff.N_ABS
```

```Go
const N_ABS = -1
```

### <a id="N_UNDEF" href="#N_UNDEF">const N_UNDEF</a>

```
searchKey: xcoff.N_UNDEF
```

```Go
const N_UNDEF = 0
```

### <a id="SYM_V_INTERNAL" href="#SYM_V_INTERNAL">const SYM_V_INTERNAL</a>

```
searchKey: xcoff.SYM_V_INTERNAL
```

```Go
const SYM_V_INTERNAL = 0x1000
```

Ntype 

### <a id="SYM_V_HIDDEN" href="#SYM_V_HIDDEN">const SYM_V_HIDDEN</a>

```
searchKey: xcoff.SYM_V_HIDDEN
```

```Go
const SYM_V_HIDDEN = 0x2000
```

### <a id="SYM_V_PROTECTED" href="#SYM_V_PROTECTED">const SYM_V_PROTECTED</a>

```
searchKey: xcoff.SYM_V_PROTECTED
```

```Go
const SYM_V_PROTECTED = 0x3000
```

### <a id="SYM_V_EXPORTED" href="#SYM_V_EXPORTED">const SYM_V_EXPORTED</a>

```
searchKey: xcoff.SYM_V_EXPORTED
```

```Go
const SYM_V_EXPORTED = 0x4000
```

### <a id="SYM_TYPE_FUNC" href="#SYM_TYPE_FUNC">const SYM_TYPE_FUNC</a>

```
searchKey: xcoff.SYM_TYPE_FUNC
```

```Go
const SYM_TYPE_FUNC = 0x0020 // is function

```

### <a id="C_NULL" href="#C_NULL">const C_NULL</a>

```
searchKey: xcoff.C_NULL
```

```Go
const C_NULL = 0 // Symbol table entry marked for deletion

```

Storage Class. 

### <a id="C_EXT" href="#C_EXT">const C_EXT</a>

```
searchKey: xcoff.C_EXT
```

```Go
const C_EXT = 2 // External symbol

```

Storage Class. 

### <a id="C_STAT" href="#C_STAT">const C_STAT</a>

```
searchKey: xcoff.C_STAT
```

```Go
const C_STAT = 3 // Static symbol

```

Storage Class. 

### <a id="C_BLOCK" href="#C_BLOCK">const C_BLOCK</a>

```
searchKey: xcoff.C_BLOCK
```

```Go
const C_BLOCK = 100 // Beginning or end of inner block

```

Storage Class. 

### <a id="C_FCN" href="#C_FCN">const C_FCN</a>

```
searchKey: xcoff.C_FCN
```

```Go
const C_FCN = 101 // Beginning or end of function

```

Storage Class. 

### <a id="C_FILE" href="#C_FILE">const C_FILE</a>

```
searchKey: xcoff.C_FILE
```

```Go
const C_FILE = 103 // Source file name and compiler information

```

Storage Class. 

### <a id="C_HIDEXT" href="#C_HIDEXT">const C_HIDEXT</a>

```
searchKey: xcoff.C_HIDEXT
```

```Go
const C_HIDEXT = 107 // Unnamed external symbol

```

Storage Class. 

### <a id="C_BINCL" href="#C_BINCL">const C_BINCL</a>

```
searchKey: xcoff.C_BINCL
```

```Go
const C_BINCL = 108 // Beginning of include file

```

Storage Class. 

### <a id="C_EINCL" href="#C_EINCL">const C_EINCL</a>

```
searchKey: xcoff.C_EINCL
```

```Go
const C_EINCL = 109 // End of include file

```

Storage Class. 

### <a id="C_WEAKEXT" href="#C_WEAKEXT">const C_WEAKEXT</a>

```
searchKey: xcoff.C_WEAKEXT
```

```Go
const C_WEAKEXT = 111 // Weak external symbol

```

Storage Class. 

### <a id="C_DWARF" href="#C_DWARF">const C_DWARF</a>

```
searchKey: xcoff.C_DWARF
```

```Go
const C_DWARF = 112 // DWARF symbol

```

Storage Class. 

### <a id="C_GSYM" href="#C_GSYM">const C_GSYM</a>

```
searchKey: xcoff.C_GSYM
```

```Go
const C_GSYM = 128 // Global variable

```

Storage Class. 

### <a id="C_LSYM" href="#C_LSYM">const C_LSYM</a>

```
searchKey: xcoff.C_LSYM
```

```Go
const C_LSYM = 129 // Automatic variable allocated on stack

```

Storage Class. 

### <a id="C_PSYM" href="#C_PSYM">const C_PSYM</a>

```
searchKey: xcoff.C_PSYM
```

```Go
const C_PSYM = 130 // Argument to subroutine allocated on stack

```

Storage Class. 

### <a id="C_RSYM" href="#C_RSYM">const C_RSYM</a>

```
searchKey: xcoff.C_RSYM
```

```Go
const C_RSYM = 131 // Register variable

```

Storage Class. 

### <a id="C_RPSYM" href="#C_RPSYM">const C_RPSYM</a>

```
searchKey: xcoff.C_RPSYM
```

```Go
const C_RPSYM = 132 // Argument to function or procedure stored in register

```

Storage Class. 

### <a id="C_STSYM" href="#C_STSYM">const C_STSYM</a>

```
searchKey: xcoff.C_STSYM
```

```Go
const C_STSYM = 133 // Statically allocated symbol

```

Storage Class. 

### <a id="C_BCOMM" href="#C_BCOMM">const C_BCOMM</a>

```
searchKey: xcoff.C_BCOMM
```

```Go
const C_BCOMM = 135 // Beginning of common block

```

Storage Class. 

### <a id="C_ECOML" href="#C_ECOML">const C_ECOML</a>

```
searchKey: xcoff.C_ECOML
```

```Go
const C_ECOML = 136 // Local member of common block

```

Storage Class. 

### <a id="C_ECOMM" href="#C_ECOMM">const C_ECOMM</a>

```
searchKey: xcoff.C_ECOMM
```

```Go
const C_ECOMM = 137 // End of common block

```

Storage Class. 

### <a id="C_DECL" href="#C_DECL">const C_DECL</a>

```
searchKey: xcoff.C_DECL
```

```Go
const C_DECL = 140 // Declaration of object

```

Storage Class. 

### <a id="C_ENTRY" href="#C_ENTRY">const C_ENTRY</a>

```
searchKey: xcoff.C_ENTRY
```

```Go
const C_ENTRY = 141 // Alternate entry

```

Storage Class. 

### <a id="C_FUN" href="#C_FUN">const C_FUN</a>

```
searchKey: xcoff.C_FUN
```

```Go
const C_FUN = 142 // Function or procedure

```

Storage Class. 

### <a id="C_BSTAT" href="#C_BSTAT">const C_BSTAT</a>

```
searchKey: xcoff.C_BSTAT
```

```Go
const C_BSTAT = 143 // Beginning of static block

```

Storage Class. 

### <a id="C_ESTAT" href="#C_ESTAT">const C_ESTAT</a>

```
searchKey: xcoff.C_ESTAT
```

```Go
const C_ESTAT = 144 // End of static block

```

Storage Class. 

### <a id="C_GTLS" href="#C_GTLS">const C_GTLS</a>

```
searchKey: xcoff.C_GTLS
```

```Go
const C_GTLS = 145 // Global thread-local variable

```

Storage Class. 

### <a id="C_STTLS" href="#C_STTLS">const C_STTLS</a>

```
searchKey: xcoff.C_STTLS
```

```Go
const C_STTLS = 146 // Static thread-local variable

```

Storage Class. 

### <a id="_AUX_EXCEPT" href="#_AUX_EXCEPT">const _AUX_EXCEPT</a>

```
searchKey: xcoff._AUX_EXCEPT
tags: [private]
```

```Go
const _AUX_EXCEPT = 255
```

Auxiliary type 

### <a id="_AUX_FCN" href="#_AUX_FCN">const _AUX_FCN</a>

```
searchKey: xcoff._AUX_FCN
tags: [private]
```

```Go
const _AUX_FCN = 254
```

Auxiliary type 

### <a id="_AUX_SYM" href="#_AUX_SYM">const _AUX_SYM</a>

```
searchKey: xcoff._AUX_SYM
tags: [private]
```

```Go
const _AUX_SYM = 253
```

Auxiliary type 

### <a id="_AUX_FILE" href="#_AUX_FILE">const _AUX_FILE</a>

```
searchKey: xcoff._AUX_FILE
tags: [private]
```

```Go
const _AUX_FILE = 252
```

Auxiliary type 

### <a id="_AUX_CSECT" href="#_AUX_CSECT">const _AUX_CSECT</a>

```
searchKey: xcoff._AUX_CSECT
tags: [private]
```

```Go
const _AUX_CSECT = 251
```

Auxiliary type 

### <a id="_AUX_SECT" href="#_AUX_SECT">const _AUX_SECT</a>

```
searchKey: xcoff._AUX_SECT
tags: [private]
```

```Go
const _AUX_SECT = 250
```

Auxiliary type 

### <a id="XTY_ER" href="#XTY_ER">const XTY_ER</a>

```
searchKey: xcoff.XTY_ER
```

```Go
const XTY_ER = 0 // External reference

```

Symbol type field. 

### <a id="XTY_SD" href="#XTY_SD">const XTY_SD</a>

```
searchKey: xcoff.XTY_SD
```

```Go
const XTY_SD = 1 // Section definition

```

Symbol type field. 

### <a id="XTY_LD" href="#XTY_LD">const XTY_LD</a>

```
searchKey: xcoff.XTY_LD
```

```Go
const XTY_LD = 2 // Label definition

```

Symbol type field. 

### <a id="XTY_CM" href="#XTY_CM">const XTY_CM</a>

```
searchKey: xcoff.XTY_CM
```

```Go
const XTY_CM = 3 // Common csect definition

```

Symbol type field. 

### <a id="XFT_FN" href="#XFT_FN">const XFT_FN</a>

```
searchKey: xcoff.XFT_FN
```

```Go
const XFT_FN = 0 // Source File Name

```

Defines for File auxiliary definitions: x_ftype field of x_file 

### <a id="XFT_CT" href="#XFT_CT">const XFT_CT</a>

```
searchKey: xcoff.XFT_CT
```

```Go
const XFT_CT = 1 // Compile Time Stamp

```

Defines for File auxiliary definitions: x_ftype field of x_file 

### <a id="XFT_CV" href="#XFT_CV">const XFT_CV</a>

```
searchKey: xcoff.XFT_CV
```

```Go
const XFT_CV = 2 // Compiler Version Number

```

Defines for File auxiliary definitions: x_ftype field of x_file 

### <a id="XFT_CD" href="#XFT_CD">const XFT_CD</a>

```
searchKey: xcoff.XFT_CD
```

```Go
const XFT_CD = 128 // Compiler Defined Information

```

Defines for File auxiliary definitions: x_ftype field of x_file 

### <a id="XMC_PR" href="#XMC_PR">const XMC_PR</a>

```
searchKey: xcoff.XMC_PR
```

```Go
const XMC_PR = 0 // Program code

```

Storage-mapping class. 

### <a id="XMC_RO" href="#XMC_RO">const XMC_RO</a>

```
searchKey: xcoff.XMC_RO
```

```Go
const XMC_RO = 1 // Read-only constant

```

Storage-mapping class. 

### <a id="XMC_DB" href="#XMC_DB">const XMC_DB</a>

```
searchKey: xcoff.XMC_DB
```

```Go
const XMC_DB = 2 // Debug dictionary table

```

Storage-mapping class. 

### <a id="XMC_TC" href="#XMC_TC">const XMC_TC</a>

```
searchKey: xcoff.XMC_TC
```

```Go
const XMC_TC = 3 // TOC entry

```

Storage-mapping class. 

### <a id="XMC_UA" href="#XMC_UA">const XMC_UA</a>

```
searchKey: xcoff.XMC_UA
```

```Go
const XMC_UA = 4 // Unclassified

```

Storage-mapping class. 

### <a id="XMC_RW" href="#XMC_RW">const XMC_RW</a>

```
searchKey: xcoff.XMC_RW
```

```Go
const XMC_RW = 5 // Read/Write data

```

Storage-mapping class. 

### <a id="XMC_GL" href="#XMC_GL">const XMC_GL</a>

```
searchKey: xcoff.XMC_GL
```

```Go
const XMC_GL = 6 // Global linkage

```

Storage-mapping class. 

### <a id="XMC_XO" href="#XMC_XO">const XMC_XO</a>

```
searchKey: xcoff.XMC_XO
```

```Go
const XMC_XO = 7 // Extended operation

```

Storage-mapping class. 

### <a id="XMC_SV" href="#XMC_SV">const XMC_SV</a>

```
searchKey: xcoff.XMC_SV
```

```Go
const XMC_SV = 8 // 32-bit supervisor call descriptor

```

Storage-mapping class. 

### <a id="XMC_BS" href="#XMC_BS">const XMC_BS</a>

```
searchKey: xcoff.XMC_BS
```

```Go
const XMC_BS = 9 // BSS class

```

Storage-mapping class. 

### <a id="XMC_DS" href="#XMC_DS">const XMC_DS</a>

```
searchKey: xcoff.XMC_DS
```

```Go
const XMC_DS = 10 // Function descriptor

```

Storage-mapping class. 

### <a id="XMC_UC" href="#XMC_UC">const XMC_UC</a>

```
searchKey: xcoff.XMC_UC
```

```Go
const XMC_UC = 11 // Unnamed FORTRAN common

```

Storage-mapping class. 

### <a id="XMC_TC0" href="#XMC_TC0">const XMC_TC0</a>

```
searchKey: xcoff.XMC_TC0
```

```Go
const XMC_TC0 = 15 // TOC anchor

```

Storage-mapping class. 

### <a id="XMC_TD" href="#XMC_TD">const XMC_TD</a>

```
searchKey: xcoff.XMC_TD
```

```Go
const XMC_TD = 16 // Scalar data entry in the TOC

```

Storage-mapping class. 

### <a id="XMC_SV64" href="#XMC_SV64">const XMC_SV64</a>

```
searchKey: xcoff.XMC_SV64
```

```Go
const XMC_SV64 = 17 // 64-bit supervisor call descriptor

```

Storage-mapping class. 

### <a id="XMC_SV3264" href="#XMC_SV3264">const XMC_SV3264</a>

```
searchKey: xcoff.XMC_SV3264
```

```Go
const XMC_SV3264 = 18 // Supervisor call descriptor for both 32-bit and 64-bit

```

Storage-mapping class. 

### <a id="XMC_TL" href="#XMC_TL">const XMC_TL</a>

```
searchKey: xcoff.XMC_TL
```

```Go
const XMC_TL = 20 // Read/Write thread-local data

```

Storage-mapping class. 

### <a id="XMC_UL" href="#XMC_UL">const XMC_UL</a>

```
searchKey: xcoff.XMC_UL
```

```Go
const XMC_UL = 21 // Read/Write thread-local data (.tbss)

```

Storage-mapping class. 

### <a id="XMC_TE" href="#XMC_TE">const XMC_TE</a>

```
searchKey: xcoff.XMC_TE
```

```Go
const XMC_TE = 22 // TOC entry

```

Storage-mapping class. 

### <a id="LDHDRSZ_32" href="#LDHDRSZ_32">const LDHDRSZ_32</a>

```
searchKey: xcoff.LDHDRSZ_32
```

```Go
const LDHDRSZ_32 = 32
```

### <a id="LDHDRSZ_64" href="#LDHDRSZ_64">const LDHDRSZ_64</a>

```
searchKey: xcoff.LDHDRSZ_64
```

```Go
const LDHDRSZ_64 = 56
```

### <a id="R_POS" href="#R_POS">const R_POS</a>

```
searchKey: xcoff.R_POS
```

```Go
const R_POS = 0x00 // A(sym) Positive Relocation

```

### <a id="R_NEG" href="#R_NEG">const R_NEG</a>

```
searchKey: xcoff.R_NEG
```

```Go
const R_NEG = 0x01 // -A(sym) Negative Relocation

```

### <a id="R_REL" href="#R_REL">const R_REL</a>

```
searchKey: xcoff.R_REL
```

```Go
const R_REL = 0x02 // A(sym-*) Relative to self

```

### <a id="R_TOC" href="#R_TOC">const R_TOC</a>

```
searchKey: xcoff.R_TOC
```

```Go
const R_TOC = 0x03 // A(sym-TOC) Relative to TOC

```

### <a id="R_TRL" href="#R_TRL">const R_TRL</a>

```
searchKey: xcoff.R_TRL
```

```Go
const R_TRL = 0x12 // A(sym-TOC) TOC Relative indirect load.

```

### <a id="R_TRLA" href="#R_TRLA">const R_TRLA</a>

```
searchKey: xcoff.R_TRLA
```

```Go
const R_TRLA = 0x13 // A(sym-TOC) TOC Rel load address. modifiable inst

```

### <a id="R_GL" href="#R_GL">const R_GL</a>

```
searchKey: xcoff.R_GL
```

```Go
const R_GL = 0x05 // A(external TOC of sym) Global Linkage

```

### <a id="R_TCL" href="#R_TCL">const R_TCL</a>

```
searchKey: xcoff.R_TCL
```

```Go
const R_TCL = 0x06 // A(local TOC of sym) Local object TOC address

```

### <a id="R_RL" href="#R_RL">const R_RL</a>

```
searchKey: xcoff.R_RL
```

```Go
const R_RL = 0x0C // A(sym) Pos indirect load. modifiable instruction

```

### <a id="R_RLA" href="#R_RLA">const R_RLA</a>

```
searchKey: xcoff.R_RLA
```

```Go
const R_RLA = 0x0D // A(sym) Pos Load Address. modifiable instruction

```

### <a id="R_REF" href="#R_REF">const R_REF</a>

```
searchKey: xcoff.R_REF
```

```Go
const R_REF = 0x0F // AL0(sym) Non relocating ref. No garbage collect

```

### <a id="R_BA" href="#R_BA">const R_BA</a>

```
searchKey: xcoff.R_BA
```

```Go
const R_BA = 0x08 // A(sym) Branch absolute. Cannot modify instruction

```

### <a id="R_RBA" href="#R_RBA">const R_RBA</a>

```
searchKey: xcoff.R_RBA
```

```Go
const R_RBA = 0x18 // A(sym) Branch absolute. modifiable instruction

```

### <a id="R_BR" href="#R_BR">const R_BR</a>

```
searchKey: xcoff.R_BR
```

```Go
const R_BR = 0x0A // A(sym-*) Branch rel to self. non modifiable

```

### <a id="R_RBR" href="#R_RBR">const R_RBR</a>

```
searchKey: xcoff.R_RBR
```

```Go
const R_RBR = 0x1A // A(sym-*) Branch rel to self. modifiable instr

```

### <a id="R_TLS" href="#R_TLS">const R_TLS</a>

```
searchKey: xcoff.R_TLS
```

```Go
const R_TLS = 0x20 // General-dynamic reference to TLS symbol

```

### <a id="R_TLS_IE" href="#R_TLS_IE">const R_TLS_IE</a>

```
searchKey: xcoff.R_TLS_IE
```

```Go
const R_TLS_IE = 0x21 // Initial-exec reference to TLS symbol

```

### <a id="R_TLS_LD" href="#R_TLS_LD">const R_TLS_LD</a>

```
searchKey: xcoff.R_TLS_LD
```

```Go
const R_TLS_LD = 0x22 // Local-dynamic reference to TLS symbol

```

### <a id="R_TLS_LE" href="#R_TLS_LE">const R_TLS_LE</a>

```
searchKey: xcoff.R_TLS_LE
```

```Go
const R_TLS_LE = 0x23 // Local-exec reference to TLS symbol

```

### <a id="R_TLSM" href="#R_TLSM">const R_TLSM</a>

```
searchKey: xcoff.R_TLSM
```

```Go
const R_TLSM = 0x24 // Module reference to TLS symbol

```

### <a id="R_TLSML" href="#R_TLSML">const R_TLSML</a>

```
searchKey: xcoff.R_TLSML
```

```Go
const R_TLSML = 0x25 // Module reference to local (own) module

```

### <a id="R_TOCU" href="#R_TOCU">const R_TOCU</a>

```
searchKey: xcoff.R_TOCU
```

```Go
const R_TOCU = 0x30 // Relative to TOC - high order bits

```

### <a id="R_TOCL" href="#R_TOCL">const R_TOCL</a>

```
searchKey: xcoff.R_TOCL
```

```Go
const R_TOCL = 0x31 // Relative to TOC - low order bits

```

## <a id="var" href="#var">Variables</a>

```
tags: [private]
```

### <a id="archTest" href="#archTest">var archTest</a>

```
searchKey: xcoff.archTest
tags: [private]
```

```Go
var archTest = ...
```

### <a id="fileTests" href="#fileTests">var fileTests</a>

```
searchKey: xcoff.fileTests
tags: [private]
```

```Go
var fileTests = ...
```

## <a id="type" href="#type">Types</a>

```
tags: [private]
```

### <a id="bigarFileHeader" href="#bigarFileHeader">type bigarFileHeader struct</a>

```
searchKey: xcoff.bigarFileHeader
tags: [private]
```

```Go
type bigarFileHeader struct {
	Flmagic    [SAIAMAG]byte // Archive magic string
	Flmemoff   [20]byte      // Member table offset
	Flgstoff   [20]byte      // 32-bits global symtab offset
	Flgst64off [20]byte      // 64-bits global symtab offset
	Flfstmoff  [20]byte      // First member offset
	Fllstmoff  [20]byte      // Last member offset
	Flfreeoff  [20]byte      // First member on free list offset
}
```

### <a id="bigarMemberHeader" href="#bigarMemberHeader">type bigarMemberHeader struct</a>

```
searchKey: xcoff.bigarMemberHeader
tags: [private]
```

```Go
type bigarMemberHeader struct {
	Arsize   [20]byte // File member size
	Arnxtmem [20]byte // Next member pointer
	Arprvmem [20]byte // Previous member pointer
	Ardate   [12]byte // File member date
	Aruid    [12]byte // File member uid
	Argid    [12]byte // File member gid
	Armode   [12]byte // File member mode (octal)
	Arnamlen [4]byte  // File member name length

}
```

### <a id="Archive" href="#Archive">type Archive struct</a>

```
searchKey: xcoff.Archive
```

```Go
type Archive struct {
	ArchiveHeader
	Members []*Member

	closer io.Closer
}
```

Archive represents an open AIX big archive. 

#### <a id="OpenArchive" href="#OpenArchive">func OpenArchive(name string) (*Archive, error)</a>

```
searchKey: xcoff.OpenArchive
```

```Go
func OpenArchive(name string) (*Archive, error)
```

OpenArchive opens the named archive using os.Open and prepares it for use as an AIX big archive. 

#### <a id="NewArchive" href="#NewArchive">func NewArchive(r io.ReaderAt) (*Archive, error)</a>

```
searchKey: xcoff.NewArchive
```

```Go
func NewArchive(r io.ReaderAt) (*Archive, error)
```

NewArchive creates a new Archive for accessing an AIX big archive in an underlying reader. 

#### <a id="Archive.Close" href="#Archive.Close">func (a *Archive) Close() error</a>

```
searchKey: xcoff.Archive.Close
```

```Go
func (a *Archive) Close() error
```

Close closes the Archive. If the Archive was created using NewArchive directly instead of OpenArchive, Close has no effect. 

#### <a id="Archive.GetFile" href="#Archive.GetFile">func (arch *Archive) GetFile(name string) (*File, error)</a>

```
searchKey: xcoff.Archive.GetFile
```

```Go
func (arch *Archive) GetFile(name string) (*File, error)
```

GetFile returns the XCOFF file defined by member name. FIXME: This doesn't work if an archive has two members with the same name which can occur if a archive has both 32-bits and 64-bits files. 

### <a id="ArchiveHeader" href="#ArchiveHeader">type ArchiveHeader struct</a>

```
searchKey: xcoff.ArchiveHeader
```

```Go
type ArchiveHeader struct {
	magic string
}
```

MemberHeader holds information about a big archive file header 

### <a id="Member" href="#Member">type Member struct</a>

```
searchKey: xcoff.Member
```

```Go
type Member struct {
	MemberHeader
	sr *io.SectionReader
}
```

Member represents a member of an AIX big archive. 

### <a id="MemberHeader" href="#MemberHeader">type MemberHeader struct</a>

```
searchKey: xcoff.MemberHeader
```

```Go
type MemberHeader struct {
	Name string
	Size uint64
}
```

MemberHeader holds information about a big archive member 

### <a id="SectionHeader" href="#SectionHeader">type SectionHeader struct</a>

```
searchKey: xcoff.SectionHeader
```

```Go
type SectionHeader struct {
	Name           string
	VirtualAddress uint64
	Size           uint64
	Type           uint32
	Relptr         uint64
	Nreloc         uint32
}
```

SectionHeader holds information about an XCOFF section header. 

### <a id="Section" href="#Section">type Section struct</a>

```
searchKey: xcoff.Section
```

```Go
type Section struct {
	SectionHeader
	Relocs []Reloc
	io.ReaderAt
	sr *io.SectionReader
}
```

#### <a id="Section.Data" href="#Section.Data">func (s *Section) Data() ([]byte, error)</a>

```
searchKey: xcoff.Section.Data
```

```Go
func (s *Section) Data() ([]byte, error)
```

Data reads and returns the contents of the XCOFF section s. 

### <a id="AuxiliaryCSect" href="#AuxiliaryCSect">type AuxiliaryCSect struct</a>

```
searchKey: xcoff.AuxiliaryCSect
```

```Go
type AuxiliaryCSect struct {
	Length              int64
	StorageMappingClass int
	SymbolType          int
}
```

AuxiliaryCSect holds information about an XCOFF symbol in an AUX_CSECT entry. 

### <a id="AuxiliaryFcn" href="#AuxiliaryFcn">type AuxiliaryFcn struct</a>

```
searchKey: xcoff.AuxiliaryFcn
```

```Go
type AuxiliaryFcn struct {
	Size int64
}
```

AuxiliaryFcn holds information about an XCOFF symbol in an AUX_FCN entry. 

### <a id="Symbol" href="#Symbol">type Symbol struct</a>

```
searchKey: xcoff.Symbol
```

```Go
type Symbol struct {
	Name          string
	Value         uint64
	SectionNumber int
	StorageClass  int
	AuxFcn        AuxiliaryFcn
	AuxCSect      AuxiliaryCSect
}
```

### <a id="Reloc" href="#Reloc">type Reloc struct</a>

```
searchKey: xcoff.Reloc
```

```Go
type Reloc struct {
	VirtualAddress   uint64
	Symbol           *Symbol
	Signed           bool
	InstructionFixed bool
	Length           uint8
	Type             uint8
}
```

### <a id="ImportedSymbol" href="#ImportedSymbol">type ImportedSymbol struct</a>

```
searchKey: xcoff.ImportedSymbol
```

```Go
type ImportedSymbol struct {
	Name    string
	Library string
}
```

ImportedSymbol holds information about an imported XCOFF symbol. 

### <a id="FileHeader" href="#FileHeader">type FileHeader struct</a>

```
searchKey: xcoff.FileHeader
```

```Go
type FileHeader struct {
	TargetMachine uint16
}
```

FileHeader holds information about an XCOFF file header. 

### <a id="File" href="#File">type File struct</a>

```
searchKey: xcoff.File
```

```Go
type File struct {
	FileHeader
	Sections     []*Section
	Symbols      []*Symbol
	StringTable  []byte
	LibraryPaths []string

	closer io.Closer
}
```

A File represents an open XCOFF file. 

#### <a id="Open" href="#Open">func Open(name string) (*File, error)</a>

```
searchKey: xcoff.Open
```

```Go
func Open(name string) (*File, error)
```

Open opens the named file using os.Open and prepares it for use as an XCOFF binary. 

#### <a id="NewFile" href="#NewFile">func NewFile(r io.ReaderAt) (*File, error)</a>

```
searchKey: xcoff.NewFile
```

```Go
func NewFile(r io.ReaderAt) (*File, error)
```

NewFile creates a new File for accessing an XCOFF binary in an underlying reader. 

#### <a id="File.Close" href="#File.Close">func (f *File) Close() error</a>

```
searchKey: xcoff.File.Close
```

```Go
func (f *File) Close() error
```

Close closes the File. If the File was created using NewFile directly instead of Open, Close has no effect. 

#### <a id="File.Section" href="#File.Section">func (f *File) Section(name string) *Section</a>

```
searchKey: xcoff.File.Section
```

```Go
func (f *File) Section(name string) *Section
```

Section returns the first section with the given name, or nil if no such section exists. Xcoff have section's name limited to 8 bytes. Some sections like .gosymtab can be trunked but this method will still find them. 

#### <a id="File.SectionByType" href="#File.SectionByType">func (f *File) SectionByType(typ uint32) *Section</a>

```
searchKey: xcoff.File.SectionByType
```

```Go
func (f *File) SectionByType(typ uint32) *Section
```

SectionByType returns the first section in f with the given type, or nil if there is no such section. 

#### <a id="File.CSect" href="#File.CSect">func (f *File) CSect(name string) []byte</a>

```
searchKey: xcoff.File.CSect
```

```Go
func (f *File) CSect(name string) []byte
```

CSect reads and returns the contents of a csect. 

#### <a id="File.DWARF" href="#File.DWARF">func (f *File) DWARF() (*dwarf.Data, error)</a>

```
searchKey: xcoff.File.DWARF
```

```Go
func (f *File) DWARF() (*dwarf.Data, error)
```

#### <a id="File.readImportIDs" href="#File.readImportIDs">func (f *File) readImportIDs(s *Section) ([]string, error)</a>

```
searchKey: xcoff.File.readImportIDs
tags: [private]
```

```Go
func (f *File) readImportIDs(s *Section) ([]string, error)
```

readImportID returns the import file IDs stored inside the .loader section. Library name pattern is either path/base/member or base/member 

#### <a id="File.ImportedSymbols" href="#File.ImportedSymbols">func (f *File) ImportedSymbols() ([]ImportedSymbol, error)</a>

```
searchKey: xcoff.File.ImportedSymbols
```

```Go
func (f *File) ImportedSymbols() ([]ImportedSymbol, error)
```

ImportedSymbols returns the names of all symbols referred to by the binary f that are expected to be satisfied by other libraries at dynamic load time. It does not return weak symbols. 

#### <a id="File.ImportedLibraries" href="#File.ImportedLibraries">func (f *File) ImportedLibraries() ([]string, error)</a>

```
searchKey: xcoff.File.ImportedLibraries
```

```Go
func (f *File) ImportedLibraries() ([]string, error)
```

ImportedLibraries returns the names of all libraries referred to by the binary f that are expected to be linked with the binary at dynamic link time. 

### <a id="zeroReaderAt" href="#zeroReaderAt">type zeroReaderAt struct{}</a>

```
searchKey: xcoff.zeroReaderAt
tags: [private]
```

```Go
type zeroReaderAt struct{}
```

zeroReaderAt is ReaderAt that reads 0s. 

#### <a id="zeroReaderAt.ReadAt" href="#zeroReaderAt.ReadAt">func (w zeroReaderAt) ReadAt(p []byte, off int64) (n int, err error)</a>

```
searchKey: xcoff.zeroReaderAt.ReadAt
tags: [private]
```

```Go
func (w zeroReaderAt) ReadAt(p []byte, off int64) (n int, err error)
```

ReadAt writes len(p) 0s into p. 

### <a id="FileHeader32" href="#FileHeader32">type FileHeader32 struct</a>

```
searchKey: xcoff.FileHeader32
```

```Go
type FileHeader32 struct {
	Fmagic   uint16 // Target machine
	Fnscns   uint16 // Number of sections
	Ftimedat int32  // Time and date of file creation
	Fsymptr  uint32 // Byte offset to symbol table start
	Fnsyms   int32  // Number of entries in symbol table
	Fopthdr  uint16 // Number of bytes in optional header
	Fflags   uint16 // Flags
}
```

File Header. 

### <a id="FileHeader64" href="#FileHeader64">type FileHeader64 struct</a>

```
searchKey: xcoff.FileHeader64
```

```Go
type FileHeader64 struct {
	Fmagic   uint16 // Target machine
	Fnscns   uint16 // Number of sections
	Ftimedat int32  // Time and date of file creation
	Fsymptr  uint64 // Byte offset to symbol table start
	Fopthdr  uint16 // Number of bytes in optional header
	Fflags   uint16 // Flags
	Fnsyms   int32  // Number of entries in symbol table
}
```

### <a id="SectionHeader32" href="#SectionHeader32">type SectionHeader32 struct</a>

```
searchKey: xcoff.SectionHeader32
```

```Go
type SectionHeader32 struct {
	Sname    [8]byte // Section name
	Spaddr   uint32  // Physical address
	Svaddr   uint32  // Virtual address
	Ssize    uint32  // Section size
	Sscnptr  uint32  // Offset in file to raw data for section
	Srelptr  uint32  // Offset in file to relocation entries for section
	Slnnoptr uint32  // Offset in file to line number entries for section
	Snreloc  uint16  // Number of relocation entries
	Snlnno   uint16  // Number of line number entries
	Sflags   uint32  // Flags to define the section type
}
```

Section Header. 

### <a id="SectionHeader64" href="#SectionHeader64">type SectionHeader64 struct</a>

```
searchKey: xcoff.SectionHeader64
```

```Go
type SectionHeader64 struct {
	Sname    [8]byte // Section name
	Spaddr   uint64  // Physical address
	Svaddr   uint64  // Virtual address
	Ssize    uint64  // Section size
	Sscnptr  uint64  // Offset in file to raw data for section
	Srelptr  uint64  // Offset in file to relocation entries for section
	Slnnoptr uint64  // Offset in file to line number entries for section
	Snreloc  uint32  // Number of relocation entries
	Snlnno   uint32  // Number of line number entries
	Sflags   uint32  // Flags to define the section type
	Spad     uint32  // Needs to be 72 bytes long
}
```

### <a id="SymEnt32" href="#SymEnt32">type SymEnt32 struct</a>

```
searchKey: xcoff.SymEnt32
```

```Go
type SymEnt32 struct {
	Nname   [8]byte // Symbol name
	Nvalue  uint32  // Symbol value
	Nscnum  int16   // Section number of symbol
	Ntype   uint16  // Basic and derived type specification
	Nsclass int8    // Storage class of symbol
	Nnumaux int8    // Number of auxiliary entries
}
```

Symbol Table Entry. 

### <a id="SymEnt64" href="#SymEnt64">type SymEnt64 struct</a>

```
searchKey: xcoff.SymEnt64
```

```Go
type SymEnt64 struct {
	Nvalue  uint64 // Symbol value
	Noffset uint32 // Offset of the name in string table or .debug section
	Nscnum  int16  // Section number of symbol
	Ntype   uint16 // Basic and derived type specification
	Nsclass int8   // Storage class of symbol
	Nnumaux int8   // Number of auxiliary entries
}
```

### <a id="AuxFile64" href="#AuxFile64">type AuxFile64 struct</a>

```
searchKey: xcoff.AuxFile64
```

```Go
type AuxFile64 struct {
	Xfname   [8]byte // Name or offset inside string table
	Xftype   uint8   // Source file string type
	Xauxtype uint8   // Type of auxiliary entry
}
```

File Auxiliary Entry 

### <a id="AuxFcn32" href="#AuxFcn32">type AuxFcn32 struct</a>

```
searchKey: xcoff.AuxFcn32
```

```Go
type AuxFcn32 struct {
	Xexptr   uint32 // File offset to exception table entry
	Xfsize   uint32 // Size of function in bytes
	Xlnnoptr uint32 // File pointer to line number
	Xendndx  uint32 // Symbol table index of next entry
	Xpad     uint16 // Unused
}
```

Function Auxiliary Entry 

### <a id="AuxFcn64" href="#AuxFcn64">type AuxFcn64 struct</a>

```
searchKey: xcoff.AuxFcn64
```

```Go
type AuxFcn64 struct {
	Xlnnoptr uint64 // File pointer to line number
	Xfsize   uint32 // Size of function in bytes
	Xendndx  uint32 // Symbol table index of next entry
	Xpad     uint8  // Unused
	Xauxtype uint8  // Type of auxiliary entry
}
```

### <a id="AuxSect64" href="#AuxSect64">type AuxSect64 struct</a>

```
searchKey: xcoff.AuxSect64
```

```Go
type AuxSect64 struct {
	Xscnlen  uint64 // section length
	Xnreloc  uint64 // Num RLDs
	pad      uint8
	Xauxtype uint8 // Type of auxiliary entry
}
```

### <a id="AuxCSect32" href="#AuxCSect32">type AuxCSect32 struct</a>

```
searchKey: xcoff.AuxCSect32
```

```Go
type AuxCSect32 struct {
	Xscnlen   int32  // Length or symbol table index
	Xparmhash uint32 // Offset of parameter type-check string
	Xsnhash   uint16 // .typchk section number
	Xsmtyp    uint8  // Symbol alignment and type
	Xsmclas   uint8  // Storage-mapping class
	Xstab     uint32 // Reserved
	Xsnstab   uint16 // Reserved
}
```

csect Auxiliary Entry. 

### <a id="AuxCSect64" href="#AuxCSect64">type AuxCSect64 struct</a>

```
searchKey: xcoff.AuxCSect64
```

```Go
type AuxCSect64 struct {
	Xscnlenlo uint32 // Lower 4 bytes of length or symbol table index
	Xparmhash uint32 // Offset of parameter type-check string
	Xsnhash   uint16 // .typchk section number
	Xsmtyp    uint8  // Symbol alignment and type
	Xsmclas   uint8  // Storage-mapping class
	Xscnlenhi int32  // Upper 4 bytes of length or symbol table index
	Xpad      uint8  // Unused
	Xauxtype  uint8  // Type of auxiliary entry
}
```

### <a id="LoaderHeader32" href="#LoaderHeader32">type LoaderHeader32 struct</a>

```
searchKey: xcoff.LoaderHeader32
```

```Go
type LoaderHeader32 struct {
	Lversion int32  // Loader section version number
	Lnsyms   int32  // Number of symbol table entries
	Lnreloc  int32  // Number of relocation table entries
	Listlen  uint32 // Length of import file ID string table
	Lnimpid  int32  // Number of import file IDs
	Limpoff  uint32 // Offset to start of import file IDs
	Lstlen   uint32 // Length of string table
	Lstoff   uint32 // Offset to start of string table
}
```

Loader Header. 

### <a id="LoaderHeader64" href="#LoaderHeader64">type LoaderHeader64 struct</a>

```
searchKey: xcoff.LoaderHeader64
```

```Go
type LoaderHeader64 struct {
	Lversion int32  // Loader section version number
	Lnsyms   int32  // Number of symbol table entries
	Lnreloc  int32  // Number of relocation table entries
	Listlen  uint32 // Length of import file ID string table
	Lnimpid  int32  // Number of import file IDs
	Lstlen   uint32 // Length of string table
	Limpoff  uint64 // Offset to start of import file IDs
	Lstoff   uint64 // Offset to start of string table
	Lsymoff  uint64 // Offset to start of symbol table
	Lrldoff  uint64 // Offset to start of relocation entries
}
```

### <a id="LoaderSymbol32" href="#LoaderSymbol32">type LoaderSymbol32 struct</a>

```
searchKey: xcoff.LoaderSymbol32
```

```Go
type LoaderSymbol32 struct {
	Lname   [8]byte // Symbol name or byte offset into string table
	Lvalue  uint32  // Address field
	Lscnum  int16   // Section number containing symbol
	Lsmtype int8    // Symbol type, export, import flags
	Lsmclas int8    // Symbol storage class
	Lifile  int32   // Import file ID; ordinal of import file IDs
	Lparm   uint32  // Parameter type-check field
}
```

Loader Symbol. 

### <a id="LoaderSymbol64" href="#LoaderSymbol64">type LoaderSymbol64 struct</a>

```
searchKey: xcoff.LoaderSymbol64
```

```Go
type LoaderSymbol64 struct {
	Lvalue  uint64 // Address field
	Loffset uint32 // Byte offset into string table of symbol name
	Lscnum  int16  // Section number containing symbol
	Lsmtype int8   // Symbol type, export, import flags
	Lsmclas int8   // Symbol storage class
	Lifile  int32  // Import file ID; ordinal of import file IDs
	Lparm   uint32 // Parameter type-check field
}
```

### <a id="Reloc32" href="#Reloc32">type Reloc32 struct</a>

```
searchKey: xcoff.Reloc32
```

```Go
type Reloc32 struct {
	Rvaddr  uint32 // (virtual) address of reference
	Rsymndx uint32 // Index into symbol table
	Rsize   uint8  // Sign and reloc bit len
	Rtype   uint8  // Toc relocation type
}
```

### <a id="Reloc64" href="#Reloc64">type Reloc64 struct</a>

```
searchKey: xcoff.Reloc64
```

```Go
type Reloc64 struct {
	Rvaddr  uint64 // (virtual) address of reference
	Rsymndx uint32 // Index into symbol table
	Rsize   uint8  // Sign and reloc bit len
	Rtype   uint8  // Toc relocation type
}
```

### <a id="archiveTest" href="#archiveTest">type archiveTest struct</a>

```
searchKey: xcoff.archiveTest
tags: [private]
```

```Go
type archiveTest struct {
	file              string
	hdr               ArchiveHeader
	members           []*MemberHeader
	membersFileHeader []FileHeader
}
```

### <a id="fileTest" href="#fileTest">type fileTest struct</a>

```
searchKey: xcoff.fileTest
tags: [private]
```

```Go
type fileTest struct {
	file     string
	hdr      FileHeader
	sections []*SectionHeader
	needed   []string
}
```

## <a id="func" href="#func">Functions</a>

```
tags: [private]
```

### <a id="cstring" href="#cstring">func cstring(b []byte) string</a>

```
searchKey: xcoff.cstring
tags: [private]
```

```Go
func cstring(b []byte) string
```

cstring converts ASCII byte sequence b to string. It stops once it finds 0 or reaches end of b. 

### <a id="getString" href="#getString">func getString(st []byte, offset uint32) (string, bool)</a>

```
searchKey: xcoff.getString
tags: [private]
```

```Go
func getString(st []byte, offset uint32) (string, bool)
```

getString extracts a string from an XCOFF string table. 

### <a id="TestOpenArchive" href="#TestOpenArchive">func TestOpenArchive(t *testing.T)</a>

```
searchKey: xcoff.TestOpenArchive
tags: [private]
```

```Go
func TestOpenArchive(t *testing.T)
```

### <a id="TestOpen" href="#TestOpen">func TestOpen(t *testing.T)</a>

```
searchKey: xcoff.TestOpen
tags: [private]
```

```Go
func TestOpen(t *testing.T)
```

### <a id="TestOpenFailure" href="#TestOpenFailure">func TestOpenFailure(t *testing.T)</a>

```
searchKey: xcoff.TestOpenFailure
tags: [private]
```

```Go
func TestOpenFailure(t *testing.T)
```

