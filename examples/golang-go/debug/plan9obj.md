# Package plan9obj

Package plan9obj implements access to Plan 9 a.out object files. 

## Index

* [Constants](#const)
    * [const Magic386](#Magic386)
    * [const Magic64](#Magic64)
    * [const MagicAMD64](#MagicAMD64)
    * [const MagicARM](#MagicARM)
* [Variables](#var)
    * [var fileTests](#fileTests)
* [Types](#type)
    * [type File struct](#File)
        * [func NewFile(r io.ReaderAt) (*File, error)](#NewFile)
        * [func Open(name string) (*File, error)](#Open)
        * [func (f *File) Close() error](#File.Close)
        * [func (f *File) Section(name string) *Section](#File.Section)
        * [func (f *File) Symbols() ([]Sym, error)](#File.Symbols)
    * [type FileHeader struct](#FileHeader)
    * [type Section struct](#Section)
        * [func (s *Section) Data() ([]byte, error)](#Section.Data)
        * [func (s *Section) Open() io.ReadSeeker](#Section.Open)
    * [type SectionHeader struct](#SectionHeader)
    * [type Sym struct](#Sym)
    * [type fileTest struct](#fileTest)
    * [type formatError struct](#formatError)
        * [func (e *formatError) Error() string](#formatError.Error)
    * [type prog struct](#prog)
    * [type sym struct](#sym)
* [Functions](#func)
    * [func TestOpen(t *testing.T)](#TestOpen)
    * [func TestOpenFailure(t *testing.T)](#TestOpenFailure)
    * [func newTable(symtab []byte, ptrsz int) ([]Sym, error)](#newTable)
    * [func parseMagic(magic []byte) (uint32, error)](#parseMagic)
    * [func walksymtab(data []byte, ptrsz int, fn func(sym) error) error](#walksymtab)


## <a id="const" href="#const">Constants</a>

### <a id="Magic386" href="#Magic386">const Magic386</a>

```
searchKey: plan9obj.Magic386
tags: [constant number]
```

```Go
const Magic386 = (4*11+0)*11 + 7
```

### <a id="Magic64" href="#Magic64">const Magic64</a>

```
searchKey: plan9obj.Magic64
tags: [constant number]
```

```Go
const Magic64 = 0x8000 // 64-bit expanded header

```

### <a id="MagicAMD64" href="#MagicAMD64">const MagicAMD64</a>

```
searchKey: plan9obj.MagicAMD64
tags: [constant number]
```

```Go
const MagicAMD64 = (4*26+0)*26 + 7 + Magic64
```

### <a id="MagicARM" href="#MagicARM">const MagicARM</a>

```
searchKey: plan9obj.MagicARM
tags: [constant number]
```

```Go
const MagicARM = (4*20+0)*20 + 7
```

## <a id="var" href="#var">Variables</a>

### <a id="fileTests" href="#fileTests">var fileTests</a>

```
searchKey: plan9obj.fileTests
tags: [variable array struct private]
```

```Go
var fileTests = ...
```

## <a id="type" href="#type">Types</a>

### <a id="File" href="#File">type File struct</a>

```
searchKey: plan9obj.File
tags: [struct]
```

```Go
type File struct {
	FileHeader
	Sections []*Section
	closer   io.Closer
}
```

A File represents an open Plan 9 a.out file. 

#### <a id="NewFile" href="#NewFile">func NewFile(r io.ReaderAt) (*File, error)</a>

```
searchKey: plan9obj.NewFile
tags: [function]
```

```Go
func NewFile(r io.ReaderAt) (*File, error)
```

NewFile creates a new File for accessing a Plan 9 binary in an underlying reader. The Plan 9 binary is expected to start at position 0 in the ReaderAt. 

#### <a id="Open" href="#Open">func Open(name string) (*File, error)</a>

```
searchKey: plan9obj.Open
tags: [function]
```

```Go
func Open(name string) (*File, error)
```

Open opens the named file using os.Open and prepares it for use as a Plan 9 a.out binary. 

#### <a id="File.Close" href="#File.Close">func (f *File) Close() error</a>

```
searchKey: plan9obj.File.Close
tags: [method]
```

```Go
func (f *File) Close() error
```

Close closes the File. If the File was created using NewFile directly instead of Open, Close has no effect. 

#### <a id="File.Section" href="#File.Section">func (f *File) Section(name string) *Section</a>

```
searchKey: plan9obj.File.Section
tags: [method]
```

```Go
func (f *File) Section(name string) *Section
```

Section returns a section with the given name, or nil if no such section exists. 

#### <a id="File.Symbols" href="#File.Symbols">func (f *File) Symbols() ([]Sym, error)</a>

```
searchKey: plan9obj.File.Symbols
tags: [method]
```

```Go
func (f *File) Symbols() ([]Sym, error)
```

Symbols returns the symbol table for f. 

### <a id="FileHeader" href="#FileHeader">type FileHeader struct</a>

```
searchKey: plan9obj.FileHeader
tags: [struct]
```

```Go
type FileHeader struct {
	Magic       uint32
	Bss         uint32
	Entry       uint64
	PtrSize     int
	LoadAddress uint64
	HdrSize     uint64
}
```

A FileHeader represents a Plan 9 a.out file header. 

### <a id="Section" href="#Section">type Section struct</a>

```
searchKey: plan9obj.Section
tags: [struct]
```

```Go
type Section struct {
	SectionHeader

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

A Section represents a single section in a Plan 9 a.out file. 

#### <a id="Section.Data" href="#Section.Data">func (s *Section) Data() ([]byte, error)</a>

```
searchKey: plan9obj.Section.Data
tags: [method]
```

```Go
func (s *Section) Data() ([]byte, error)
```

Data reads and returns the contents of the Plan 9 a.out section. 

#### <a id="Section.Open" href="#Section.Open">func (s *Section) Open() io.ReadSeeker</a>

```
searchKey: plan9obj.Section.Open
tags: [method]
```

```Go
func (s *Section) Open() io.ReadSeeker
```

Open returns a new ReadSeeker reading the Plan 9 a.out section. 

### <a id="SectionHeader" href="#SectionHeader">type SectionHeader struct</a>

```
searchKey: plan9obj.SectionHeader
tags: [struct]
```

```Go
type SectionHeader struct {
	Name   string
	Size   uint32
	Offset uint32
}
```

A SectionHeader represents a single Plan 9 a.out section header. This structure doesn't exist on-disk, but eases navigation through the object file. 

### <a id="Sym" href="#Sym">type Sym struct</a>

```
searchKey: plan9obj.Sym
tags: [struct]
```

```Go
type Sym struct {
	Value uint64
	Type  rune
	Name  string
}
```

A Symbol represents an entry in a Plan 9 a.out symbol table section. 

### <a id="fileTest" href="#fileTest">type fileTest struct</a>

```
searchKey: plan9obj.fileTest
tags: [struct private]
```

```Go
type fileTest struct {
	file     string
	hdr      FileHeader
	sections []*SectionHeader
}
```

### <a id="formatError" href="#formatError">type formatError struct</a>

```
searchKey: plan9obj.formatError
tags: [struct private]
```

```Go
type formatError struct {
	off int
	msg string
	val interface{}
}
```

formatError is returned by some operations if the data does not have the correct format for an object file. 

#### <a id="formatError.Error" href="#formatError.Error">func (e *formatError) Error() string</a>

```
searchKey: plan9obj.formatError.Error
tags: [method private]
```

```Go
func (e *formatError) Error() string
```

### <a id="prog" href="#prog">type prog struct</a>

```
searchKey: plan9obj.prog
tags: [struct private]
```

```Go
type prog struct {
	Magic uint32 /* magic number */
	Text  uint32 /* size of text segment */
	Data  uint32 /* size of initialized data */
	Bss   uint32 /* size of uninitialized data */
	Syms  uint32 /* size of symbol table */
	Entry uint32 /* entry point */
	Spsz  uint32 /* size of pc/sp offset table */
	Pcsz  uint32 /* size of pc/line number table */
}
```

Plan 9 Program header. 

### <a id="sym" href="#sym">type sym struct</a>

```
searchKey: plan9obj.sym
tags: [struct private]
```

```Go
type sym struct {
	value uint64
	typ   byte
	name  []byte
}
```

Plan 9 symbol table entries. 

## <a id="func" href="#func">Functions</a>

### <a id="TestOpen" href="#TestOpen">func TestOpen(t *testing.T)</a>

```
searchKey: plan9obj.TestOpen
tags: [function private test]
```

```Go
func TestOpen(t *testing.T)
```

### <a id="TestOpenFailure" href="#TestOpenFailure">func TestOpenFailure(t *testing.T)</a>

```
searchKey: plan9obj.TestOpenFailure
tags: [function private test]
```

```Go
func TestOpenFailure(t *testing.T)
```

### <a id="newTable" href="#newTable">func newTable(symtab []byte, ptrsz int) ([]Sym, error)</a>

```
searchKey: plan9obj.newTable
tags: [function private]
```

```Go
func newTable(symtab []byte, ptrsz int) ([]Sym, error)
```

NewTable decodes the Go symbol table in data, returning an in-memory representation. 

### <a id="parseMagic" href="#parseMagic">func parseMagic(magic []byte) (uint32, error)</a>

```
searchKey: plan9obj.parseMagic
tags: [function private]
```

```Go
func parseMagic(magic []byte) (uint32, error)
```

### <a id="walksymtab" href="#walksymtab">func walksymtab(data []byte, ptrsz int, fn func(sym) error) error</a>

```
searchKey: plan9obj.walksymtab
tags: [function private]
```

```Go
func walksymtab(data []byte, ptrsz int, fn func(sym) error) error
```

