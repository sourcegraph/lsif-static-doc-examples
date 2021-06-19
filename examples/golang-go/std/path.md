# Package path

Package path implements utility routines for manipulating slash-separated paths. 

The path package should only be used for paths separated by forward slashes, such as the paths in URLs. This package does not deal with Windows paths with drive letters or backslashes; to manipulate operating system paths, use the path/filepath package. 

## Index

* Subpages
  * [std/path/filepath](path/filepath.md)
  * [std/path/filepath_test](path/filepath_test.md)
* [Variables](#var)
    * [var ErrBadPattern](#ErrBadPattern)
* [Types](#type)
    * [type lazybuf struct](#lazybuf)
        * [func (b *lazybuf) index(i int) byte](#lazybuf.index)
        * [func (b *lazybuf) append(c byte)](#lazybuf.append)
        * [func (b *lazybuf) string() string](#lazybuf.string)
* [Functions](#func)
    * [func Match(pattern, name string) (matched bool, err error)](#Match)
    * [func scanChunk(pattern string) (star bool, chunk, rest string)](#scanChunk)
    * [func matchChunk(chunk, s string) (rest string, ok bool, err error)](#matchChunk)
    * [func getEsc(chunk string) (r rune, nchunk string, err error)](#getEsc)
    * [func Clean(path string) string](#Clean)
    * [func lastSlash(s string) int](#lastSlash)
    * [func Split(path string) (dir, file string)](#Split)
    * [func Join(elem ...string) string](#Join)
    * [func Ext(path string) string](#Ext)
    * [func Base(path string) string](#Base)
    * [func IsAbs(path string) bool](#IsAbs)
    * [func Dir(path string) string](#Dir)


## <a id="var" href="#var">Variables</a>

```
tags: [exported]
```

### <a id="ErrBadPattern" href="#ErrBadPattern">var ErrBadPattern</a>

```
searchKey: path.ErrBadPattern
tags: [exported]
```

```Go
var ErrBadPattern = errors.New("syntax error in pattern")
```

ErrBadPattern indicates a pattern was malformed. 

## <a id="type" href="#type">Types</a>

```
tags: [exported]
```

### <a id="lazybuf" href="#lazybuf">type lazybuf struct</a>

```
searchKey: path.lazybuf
```

```Go
type lazybuf struct {
	s   string
	buf []byte
	w   int
}
```

A lazybuf is a lazily constructed path buffer. It supports append, reading previously appended bytes, and retrieving the final string. It does not allocate a buffer to hold the output until that output diverges from s. 

#### <a id="lazybuf.index" href="#lazybuf.index">func (b *lazybuf) index(i int) byte</a>

```
searchKey: path.lazybuf.index
```

```Go
func (b *lazybuf) index(i int) byte
```

#### <a id="lazybuf.append" href="#lazybuf.append">func (b *lazybuf) append(c byte)</a>

```
searchKey: path.lazybuf.append
```

```Go
func (b *lazybuf) append(c byte)
```

#### <a id="lazybuf.string" href="#lazybuf.string">func (b *lazybuf) string() string</a>

```
searchKey: path.lazybuf.string
```

```Go
func (b *lazybuf) string() string
```

## <a id="func" href="#func">Functions</a>

```
tags: [exported]
```

### <a id="Match" href="#Match">func Match(pattern, name string) (matched bool, err error)</a>

```
searchKey: path.Match
tags: [exported]
```

```Go
func Match(pattern, name string) (matched bool, err error)
```

Match reports whether name matches the shell pattern. The pattern syntax is: 

```
pattern:
	{ term }
term:
	'*'         matches any sequence of non-/ characters
	'?'         matches any single non-/ character
	'[' [ '^' ] { character-range } ']'
	            character class (must be non-empty)
	c           matches character c (c != '*', '?', '\\', '[')
	'\\' c      matches character c

character-range:
	c           matches character c (c != '\\', '-', ']')
	'\\' c      matches character c
	lo '-' hi   matches character c for lo <= c <= hi

```
Match requires pattern to match all of name, not just a substring. The only possible returned error is ErrBadPattern, when pattern is malformed. 

### <a id="scanChunk" href="#scanChunk">func scanChunk(pattern string) (star bool, chunk, rest string)</a>

```
searchKey: path.scanChunk
```

```Go
func scanChunk(pattern string) (star bool, chunk, rest string)
```

scanChunk gets the next segment of pattern, which is a non-star string possibly preceded by a star. 

### <a id="matchChunk" href="#matchChunk">func matchChunk(chunk, s string) (rest string, ok bool, err error)</a>

```
searchKey: path.matchChunk
```

```Go
func matchChunk(chunk, s string) (rest string, ok bool, err error)
```

matchChunk checks whether chunk matches the beginning of s. If so, it returns the remainder of s (after the match). Chunk is all single-character operators: literals, char classes, and ?. 

### <a id="getEsc" href="#getEsc">func getEsc(chunk string) (r rune, nchunk string, err error)</a>

```
searchKey: path.getEsc
```

```Go
func getEsc(chunk string) (r rune, nchunk string, err error)
```

getEsc gets a possibly-escaped character from chunk, for a character class. 

### <a id="Clean" href="#Clean">func Clean(path string) string</a>

```
searchKey: path.Clean
tags: [exported]
```

```Go
func Clean(path string) string
```

Clean returns the shortest path name equivalent to path by purely lexical processing. It applies the following rules iteratively until no further processing can be done: 

```
1. Replace multiple slashes with a single slash.
2. Eliminate each . path name element (the current directory).
3. Eliminate each inner .. path name element (the parent directory)
   along with the non-.. element that precedes it.
4. Eliminate .. elements that begin a rooted path:
   that is, replace "/.." by "/" at the beginning of a path.

```
The returned path ends in a slash only if it is the root "/". 

If the result of this process is an empty string, Clean returns the string ".". 

See also Rob Pike, `Lexical File Names in Plan 9 or Getting Dot-Dot Right,' [https://9p.io/sys/doc/lexnames.html](https://9p.io/sys/doc/lexnames.html) 

### <a id="lastSlash" href="#lastSlash">func lastSlash(s string) int</a>

```
searchKey: path.lastSlash
```

```Go
func lastSlash(s string) int
```

lastSlash(s) is strings.LastIndex(s, "/") but we can't import strings. 

### <a id="Split" href="#Split">func Split(path string) (dir, file string)</a>

```
searchKey: path.Split
tags: [exported]
```

```Go
func Split(path string) (dir, file string)
```

Split splits path immediately following the final slash, separating it into a directory and file name component. If there is no slash in path, Split returns an empty dir and file set to path. The returned values have the property that path = dir+file. 

### <a id="Join" href="#Join">func Join(elem ...string) string</a>

```
searchKey: path.Join
tags: [exported]
```

```Go
func Join(elem ...string) string
```

Join joins any number of path elements into a single path, separating them with slashes. Empty elements are ignored. The result is Cleaned. However, if the argument list is empty or all its elements are empty, Join returns an empty string. 

### <a id="Ext" href="#Ext">func Ext(path string) string</a>

```
searchKey: path.Ext
tags: [exported]
```

```Go
func Ext(path string) string
```

Ext returns the file name extension used by path. The extension is the suffix beginning at the final dot in the final slash-separated element of path; it is empty if there is no dot. 

### <a id="Base" href="#Base">func Base(path string) string</a>

```
searchKey: path.Base
tags: [exported]
```

```Go
func Base(path string) string
```

Base returns the last element of path. Trailing slashes are removed before extracting the last element. If the path is empty, Base returns ".". If the path consists entirely of slashes, Base returns "/". 

### <a id="IsAbs" href="#IsAbs">func IsAbs(path string) bool</a>

```
searchKey: path.IsAbs
tags: [exported]
```

```Go
func IsAbs(path string) bool
```

IsAbs reports whether the path is absolute. 

### <a id="Dir" href="#Dir">func Dir(path string) string</a>

```
searchKey: path.Dir
tags: [exported]
```

```Go
func Dir(path string) string
```

Dir returns all but the last element of path, typically the path's directory. After dropping the final element using Split, the path is Cleaned and trailing slashes are removed. If the path is empty, Dir returns ".". If the path consists entirely of slashes followed by non-slash bytes, Dir returns a single slash. In any other case, the returned path does not end in a slash. 

