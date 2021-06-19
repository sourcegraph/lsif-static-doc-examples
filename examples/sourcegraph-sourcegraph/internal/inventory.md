# Package inventory

Package inventory scans a directory tree to identify the programming languages, etc., in use. 

## Index

* [Constants](#const)
    * [const fileReadBufferSize](#fileReadBufferSize)
* [Variables](#var)
    * [var newLine](#newLine)
* [Types](#type)
    * [type Context struct](#Context)
        * [func (c *Context) Entries(ctx context.Context, entries ...fs.FileInfo) (inv Inventory, err error)](#Context.Entries)
        * [func (c *Context) entries(ctx context.Context, entries []fs.FileInfo, buf []byte) (Inventory, error)](#Context.entries)
        * [func (c *Context) tree(ctx context.Context, tree fs.FileInfo, buf []byte) (inv Inventory, err error)](#Context.tree)
        * [func (c *Context) file(ctx context.Context, file fs.FileInfo, buf []byte) (inv Inventory, err error)](#Context.file)
    * [type Inventory struct](#Inventory)
        * [func Sum(invs []Inventory) Inventory](#Sum)
    * [type Lang struct](#Lang)
        * [func getLang(ctx context.Context, file fs.FileInfo, buf []byte, getFileReader func(ctx context.Context, path string) (io.ReadCloser, error)) (Lang, error)](#getLang)
    * [type fi struct](#fi)
        * [func (f fi) Name() string](#fi.Name)
        * [func (f fi) Size() int64](#fi.Size)
        * [func (f fi) IsDir() bool](#fi.IsDir)
        * [func (f fi) Mode() os.FileMode](#fi.Mode)
        * [func (f fi) ModTime() time.Time](#fi.ModTime)
        * [func (f fi) Sys() interface{}](#fi.Sys)
    * [type nopReadCloser struct](#nopReadCloser)
        * [func (n *nopReadCloser) Read(p []byte) (int, error)](#nopReadCloser.Read)
        * [func (n *nopReadCloser) Close() error](#nopReadCloser.Close)
* [Functions](#func)
    * [func countLines(r io.Reader, buf []byte) (lineCount int, byteCount int, err error)](#countLines)
    * [func GetLanguageByFilename(name string) (language string, safe bool)](#GetLanguageByFilename)
    * [func init()](#init)
    * [func preferLanguage(lang, ext string)](#preferLanguage)
    * [func TestContext_Entries(t *testing.T)](#TestContext_Entries)
    * [func TestGetLang_language(t *testing.T)](#TestGetLang_language)
    * [func makeFileReader(ctx context.Context, path, contents string) func(context.Context, string) (io.ReadCloser, error)](#makeFileReader)
    * [func TestGet_readFile(t *testing.T)](#TestGet_readFile)
    * [func BenchmarkGetLang(b *testing.B)](#BenchmarkGetLang)
    * [func BenchmarkIsVendor(b *testing.B)](#BenchmarkIsVendor)
    * [func newFileReader(files []fs.FileInfo) func(_ context.Context, path string) (io.ReadCloser, error)](#newFileReader)
    * [func readFileTree(name string) ([]fs.FileInfo, error)](#readFileTree)
    * [func fakeContents(path string) string](#fakeContents)


## <a id="const" href="#const">Constants</a>

### <a id="fileReadBufferSize" href="#fileReadBufferSize">const fileReadBufferSize</a>

```
searchKey: inventory.fileReadBufferSize
```

```Go
const fileReadBufferSize = 16 * 1024
```

fileReadBufferSize is the size of the buffer we'll use while reading file contents 

## <a id="var" href="#var">Variables</a>

### <a id="newLine" href="#newLine">var newLine</a>

```
searchKey: inventory.newLine
```

```Go
var newLine = []byte{'\n'}
```

## <a id="type" href="#type">Types</a>

### <a id="Context" href="#Context">type Context struct</a>

```
searchKey: inventory.Context
tags: [exported]
```

```Go
type Context struct {
	// ReadTree is called to list the immediate children of a tree at path. The returned fs.FileInfo
	// values' Name method must return the full path (that can be passed to another ReadTree or
	// ReadFile call), not just the basename.
	ReadTree func(ctx context.Context, path string) ([]fs.FileInfo, error)

	// NewFileReader is called to get an io.ReadCloser from the file at path.
	NewFileReader func(ctx context.Context, path string) (io.ReadCloser, error)

	// CacheGet, if set, returns the cached inventory and true for the given tree, or false for a cache miss.
	CacheGet func(fs.FileInfo) (Inventory, bool)

	// CacheSet, if set, stores the inventory in the cache for the given tree.
	CacheSet func(fs.FileInfo, Inventory)
}
```

Context defines the environment in which the inventory is computed. 

#### <a id="Context.Entries" href="#Context.Entries">func (c *Context) Entries(ctx context.Context, entries ...fs.FileInfo) (inv Inventory, err error)</a>

```
searchKey: inventory.Context.Entries
tags: [exported]
```

```Go
func (c *Context) Entries(ctx context.Context, entries ...fs.FileInfo) (inv Inventory, err error)
```

Entries computes the inventory of languages for the given entries. It traverses trees recursively and caches results for each subtree. Results for listed files are cached. 

If a file is referenced more than once (e.g., because it is a descendent of a subtree and it is passed directly), it will be double-counted in the result. 

#### <a id="Context.entries" href="#Context.entries">func (c *Context) entries(ctx context.Context, entries []fs.FileInfo, buf []byte) (Inventory, error)</a>

```
searchKey: inventory.Context.entries
```

```Go
func (c *Context) entries(ctx context.Context, entries []fs.FileInfo, buf []byte) (Inventory, error)
```

#### <a id="Context.tree" href="#Context.tree">func (c *Context) tree(ctx context.Context, tree fs.FileInfo, buf []byte) (inv Inventory, err error)</a>

```
searchKey: inventory.Context.tree
```

```Go
func (c *Context) tree(ctx context.Context, tree fs.FileInfo, buf []byte) (inv Inventory, err error)
```

#### <a id="Context.file" href="#Context.file">func (c *Context) file(ctx context.Context, file fs.FileInfo, buf []byte) (inv Inventory, err error)</a>

```
searchKey: inventory.Context.file
```

```Go
func (c *Context) file(ctx context.Context, file fs.FileInfo, buf []byte) (inv Inventory, err error)
```

file computes the inventory of a single file. It caches the result. 

### <a id="Inventory" href="#Inventory">type Inventory struct</a>

```
searchKey: inventory.Inventory
tags: [exported]
```

```Go
type Inventory struct {
	// Languages are the programming languages used in the tree.
	Languages []Lang `json:"Languages,omitempty"`
}
```

Inventory summarizes a tree's contents (e.g., which programming languages are used). 

#### <a id="Sum" href="#Sum">func Sum(invs []Inventory) Inventory</a>

```
searchKey: inventory.Sum
tags: [exported]
```

```Go
func Sum(invs []Inventory) Inventory
```

### <a id="Lang" href="#Lang">type Lang struct</a>

```
searchKey: inventory.Lang
tags: [exported]
```

```Go
type Lang struct {
	// Name is the name of a programming language (e.g., "Go" or
	// "Java").
	Name string `json:"Name,omitempty"`
	// TotalBytes is the total number of bytes of code written in the
	// programming language.
	TotalBytes uint64 `json:"TotalBytes,omitempty"`
	// TotalLines is the total number of lines of code written in the
	// programming language.
	TotalLines uint64 `json:"TotalLines,omitempty"`
}
```

Lang represents a programming language used in a directory tree. 

#### <a id="getLang" href="#getLang">func getLang(ctx context.Context, file fs.FileInfo, buf []byte, getFileReader func(ctx context.Context, path string) (io.ReadCloser, error)) (Lang, error)</a>

```
searchKey: inventory.getLang
```

```Go
func getLang(ctx context.Context, file fs.FileInfo, buf []byte, getFileReader func(ctx context.Context, path string) (io.ReadCloser, error)) (Lang, error)
```

### <a id="fi" href="#fi">type fi struct</a>

```
searchKey: inventory.fi
```

```Go
type fi struct {
	Path     string
	Contents string
}
```

#### <a id="fi.Name" href="#fi.Name">func (f fi) Name() string</a>

```
searchKey: inventory.fi.Name
```

```Go
func (f fi) Name() string
```

#### <a id="fi.Size" href="#fi.Size">func (f fi) Size() int64</a>

```
searchKey: inventory.fi.Size
```

```Go
func (f fi) Size() int64
```

#### <a id="fi.IsDir" href="#fi.IsDir">func (f fi) IsDir() bool</a>

```
searchKey: inventory.fi.IsDir
```

```Go
func (f fi) IsDir() bool
```

#### <a id="fi.Mode" href="#fi.Mode">func (f fi) Mode() os.FileMode</a>

```
searchKey: inventory.fi.Mode
```

```Go
func (f fi) Mode() os.FileMode
```

#### <a id="fi.ModTime" href="#fi.ModTime">func (f fi) ModTime() time.Time</a>

```
searchKey: inventory.fi.ModTime
```

```Go
func (f fi) ModTime() time.Time
```

#### <a id="fi.Sys" href="#fi.Sys">func (f fi) Sys() interface{}</a>

```
searchKey: inventory.fi.Sys
```

```Go
func (f fi) Sys() interface{}
```

### <a id="nopReadCloser" href="#nopReadCloser">type nopReadCloser struct</a>

```
searchKey: inventory.nopReadCloser
```

```Go
type nopReadCloser struct {
	data   []byte
	reader *bytes.Reader
}
```

#### <a id="nopReadCloser.Read" href="#nopReadCloser.Read">func (n *nopReadCloser) Read(p []byte) (int, error)</a>

```
searchKey: inventory.nopReadCloser.Read
```

```Go
func (n *nopReadCloser) Read(p []byte) (int, error)
```

#### <a id="nopReadCloser.Close" href="#nopReadCloser.Close">func (n *nopReadCloser) Close() error</a>

```
searchKey: inventory.nopReadCloser.Close
```

```Go
func (n *nopReadCloser) Close() error
```

## <a id="func" href="#func">Functions</a>

### <a id="countLines" href="#countLines">func countLines(r io.Reader, buf []byte) (lineCount int, byteCount int, err error)</a>

```
searchKey: inventory.countLines
```

```Go
func countLines(r io.Reader, buf []byte) (lineCount int, byteCount int, err error)
```

countLines counts the number of lines in the supplied reader it uses buf as a temporary buffer 

### <a id="GetLanguageByFilename" href="#GetLanguageByFilename">func GetLanguageByFilename(name string) (language string, safe bool)</a>

```
searchKey: inventory.GetLanguageByFilename
tags: [exported]
```

```Go
func GetLanguageByFilename(name string) (language string, safe bool)
```

GetLanguageByFilename returns the guessed language for the named file (and safe == true if this is very likely to be correct). 

### <a id="init" href="#init">func init()</a>

```
searchKey: inventory.init
```

```Go
func init()
```

### <a id="preferLanguage" href="#preferLanguage">func preferLanguage(lang, ext string)</a>

```
searchKey: inventory.preferLanguage
```

```Go
func preferLanguage(lang, ext string)
```

preferLanguage updates LanguagesByExtension to have lang listed first for ext. 

### <a id="TestContext_Entries" href="#TestContext_Entries">func TestContext_Entries(t *testing.T)</a>

```
searchKey: inventory.TestContext_Entries
```

```Go
func TestContext_Entries(t *testing.T)
```

### <a id="TestGetLang_language" href="#TestGetLang_language">func TestGetLang_language(t *testing.T)</a>

```
searchKey: inventory.TestGetLang_language
```

```Go
func TestGetLang_language(t *testing.T)
```

### <a id="makeFileReader" href="#makeFileReader">func makeFileReader(ctx context.Context, path, contents string) func(context.Context, string) (io.ReadCloser, error)</a>

```
searchKey: inventory.makeFileReader
```

```Go
func makeFileReader(ctx context.Context, path, contents string) func(context.Context, string) (io.ReadCloser, error)
```

### <a id="TestGet_readFile" href="#TestGet_readFile">func TestGet_readFile(t *testing.T)</a>

```
searchKey: inventory.TestGet_readFile
```

```Go
func TestGet_readFile(t *testing.T)
```

### <a id="BenchmarkGetLang" href="#BenchmarkGetLang">func BenchmarkGetLang(b *testing.B)</a>

```
searchKey: inventory.BenchmarkGetLang
```

```Go
func BenchmarkGetLang(b *testing.B)
```

### <a id="BenchmarkIsVendor" href="#BenchmarkIsVendor">func BenchmarkIsVendor(b *testing.B)</a>

```
searchKey: inventory.BenchmarkIsVendor
```

```Go
func BenchmarkIsVendor(b *testing.B)
```

### <a id="newFileReader" href="#newFileReader">func newFileReader(files []fs.FileInfo) func(_ context.Context, path string) (io.ReadCloser, error)</a>

```
searchKey: inventory.newFileReader
```

```Go
func newFileReader(files []fs.FileInfo) func(_ context.Context, path string) (io.ReadCloser, error)
```

### <a id="readFileTree" href="#readFileTree">func readFileTree(name string) ([]fs.FileInfo, error)</a>

```
searchKey: inventory.readFileTree
```

```Go
func readFileTree(name string) ([]fs.FileInfo, error)
```

### <a id="fakeContents" href="#fakeContents">func fakeContents(path string) string</a>

```
searchKey: inventory.fakeContents
```

```Go
func fakeContents(path string) string
```

