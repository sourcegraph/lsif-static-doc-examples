# Package bytes

Package bytes implements functions for the manipulation of byte slices. It is analogous to the facilities of the strings package. 

## Index

* [Constants](#const)
    * [const smallBufferSize](#smallBufferSize)
    * [const opRead](#opRead)
    * [const opInvalid](#opInvalid)
    * [const opReadRune1](#opReadRune1)
    * [const opReadRune2](#opReadRune2)
    * [const opReadRune3](#opReadRune3)
    * [const opReadRune4](#opReadRune4)
    * [const maxInt](#maxInt)
    * [const MinRead](#MinRead)
* [Variables](#var)
    * [var ErrTooLarge](#ErrTooLarge)
    * [var errNegativeRead](#errNegativeRead)
    * [var errUnreadByte](#errUnreadByte)
    * [var asciiSpace](#asciiSpace)
    * [var IndexBytePortable](#IndexBytePortable)
* [Types](#type)
    * [type Buffer struct](#Buffer)
        * [func NewBuffer(buf []byte) *Buffer](#NewBuffer)
        * [func NewBufferString(s string) *Buffer](#NewBufferString)
        * [func (b *Buffer) Bytes() []byte](#Buffer.Bytes)
        * [func (b *Buffer) String() string](#Buffer.String)
        * [func (b *Buffer) empty() bool](#Buffer.empty)
        * [func (b *Buffer) Len() int](#Buffer.Len)
        * [func (b *Buffer) Cap() int](#Buffer.Cap)
        * [func (b *Buffer) Truncate(n int)](#Buffer.Truncate)
        * [func (b *Buffer) Reset()](#Buffer.Reset)
        * [func (b *Buffer) tryGrowByReslice(n int) (int, bool)](#Buffer.tryGrowByReslice)
        * [func (b *Buffer) grow(n int) int](#Buffer.grow)
        * [func (b *Buffer) Grow(n int)](#Buffer.Grow)
        * [func (b *Buffer) Write(p []byte) (n int, err error)](#Buffer.Write)
        * [func (b *Buffer) WriteString(s string) (n int, err error)](#Buffer.WriteString)
        * [func (b *Buffer) ReadFrom(r io.Reader) (n int64, err error)](#Buffer.ReadFrom)
        * [func (b *Buffer) WriteTo(w io.Writer) (n int64, err error)](#Buffer.WriteTo)
        * [func (b *Buffer) WriteByte(c byte) error](#Buffer.WriteByte)
        * [func (b *Buffer) WriteRune(r rune) (n int, err error)](#Buffer.WriteRune)
        * [func (b *Buffer) Read(p []byte) (n int, err error)](#Buffer.Read)
        * [func (b *Buffer) Next(n int) []byte](#Buffer.Next)
        * [func (b *Buffer) ReadByte() (byte, error)](#Buffer.ReadByte)
        * [func (b *Buffer) ReadRune() (r rune, size int, err error)](#Buffer.ReadRune)
        * [func (b *Buffer) UnreadRune() error](#Buffer.UnreadRune)
        * [func (b *Buffer) UnreadByte() error](#Buffer.UnreadByte)
        * [func (b *Buffer) ReadBytes(delim byte) (line []byte, err error)](#Buffer.ReadBytes)
        * [func (b *Buffer) readSlice(delim byte) (line []byte, err error)](#Buffer.readSlice)
        * [func (b *Buffer) ReadString(delim byte) (line string, err error)](#Buffer.ReadString)
    * [type readOp int8](#readOp)
    * [type asciiSet [8]uint32](#asciiSet)
        * [func makeASCIISet(chars string) (as asciiSet, ok bool)](#makeASCIISet)
        * [func (as *asciiSet) contains(c byte) bool](#asciiSet.contains)
    * [type Reader struct](#Reader)
        * [func NewReader(b []byte) *Reader](#NewReader)
        * [func (r *Reader) Len() int](#Reader.Len)
        * [func (r *Reader) Size() int64](#Reader.Size)
        * [func (r *Reader) Read(b []byte) (n int, err error)](#Reader.Read)
        * [func (r *Reader) ReadAt(b []byte, off int64) (n int, err error)](#Reader.ReadAt)
        * [func (r *Reader) ReadByte() (byte, error)](#Reader.ReadByte)
        * [func (r *Reader) UnreadByte() error](#Reader.UnreadByte)
        * [func (r *Reader) ReadRune() (ch rune, size int, err error)](#Reader.ReadRune)
        * [func (r *Reader) UnreadRune() error](#Reader.UnreadRune)
        * [func (r *Reader) Seek(offset int64, whence int) (int64, error)](#Reader.Seek)
        * [func (r *Reader) WriteTo(w io.Writer) (n int64, err error)](#Reader.WriteTo)
        * [func (r *Reader) Reset(b []byte)](#Reader.Reset)
* [Functions](#func)
    * [func makeSlice(n int) []byte](#makeSlice)
    * [func Equal(a, b []byte) bool](#Equal)
    * [func Compare(a, b []byte) int](#Compare)
    * [func explode(s []byte, n int) [][]byte](#explode)
    * [func Count(s, sep []byte) int](#Count)
    * [func Contains(b, subslice []byte) bool](#Contains)
    * [func ContainsAny(b []byte, chars string) bool](#ContainsAny)
    * [func ContainsRune(b []byte, r rune) bool](#ContainsRune)
    * [func IndexByte(b []byte, c byte) int](#IndexByte)
    * [func indexBytePortable(s []byte, c byte) int](#indexBytePortable)
    * [func LastIndex(s, sep []byte) int](#LastIndex)
    * [func LastIndexByte(s []byte, c byte) int](#LastIndexByte)
    * [func IndexRune(s []byte, r rune) int](#IndexRune)
    * [func IndexAny(s []byte, chars string) int](#IndexAny)
    * [func LastIndexAny(s []byte, chars string) int](#LastIndexAny)
    * [func genSplit(s, sep []byte, sepSave, n int) [][]byte](#genSplit)
    * [func SplitN(s, sep []byte, n int) [][]byte](#SplitN)
    * [func SplitAfterN(s, sep []byte, n int) [][]byte](#SplitAfterN)
    * [func Split(s, sep []byte) [][]byte](#Split)
    * [func SplitAfter(s, sep []byte) [][]byte](#SplitAfter)
    * [func Fields(s []byte) [][]byte](#Fields)
    * [func FieldsFunc(s []byte, f func(rune) bool) [][]byte](#FieldsFunc)
    * [func Join(s [][]byte, sep []byte) []byte](#Join)
    * [func HasPrefix(s, prefix []byte) bool](#HasPrefix)
    * [func HasSuffix(s, suffix []byte) bool](#HasSuffix)
    * [func Map(mapping func(r rune) rune, s []byte) []byte](#Map)
    * [func Repeat(b []byte, count int) []byte](#Repeat)
    * [func ToUpper(s []byte) []byte](#ToUpper)
    * [func ToLower(s []byte) []byte](#ToLower)
    * [func ToTitle(s []byte) []byte](#ToTitle)
    * [func ToUpperSpecial(c unicode.SpecialCase, s []byte) []byte](#ToUpperSpecial)
    * [func ToLowerSpecial(c unicode.SpecialCase, s []byte) []byte](#ToLowerSpecial)
    * [func ToTitleSpecial(c unicode.SpecialCase, s []byte) []byte](#ToTitleSpecial)
    * [func ToValidUTF8(s, replacement []byte) []byte](#ToValidUTF8)
    * [func isSeparator(r rune) bool](#isSeparator)
    * [func Title(s []byte) []byte](#Title)
    * [func TrimLeftFunc(s []byte, f func(r rune) bool) []byte](#TrimLeftFunc)
    * [func TrimRightFunc(s []byte, f func(r rune) bool) []byte](#TrimRightFunc)
    * [func TrimFunc(s []byte, f func(r rune) bool) []byte](#TrimFunc)
    * [func TrimPrefix(s, prefix []byte) []byte](#TrimPrefix)
    * [func TrimSuffix(s, suffix []byte) []byte](#TrimSuffix)
    * [func IndexFunc(s []byte, f func(r rune) bool) int](#IndexFunc)
    * [func LastIndexFunc(s []byte, f func(r rune) bool) int](#LastIndexFunc)
    * [func indexFunc(s []byte, f func(r rune) bool, truth bool) int](#indexFunc)
    * [func lastIndexFunc(s []byte, f func(r rune) bool, truth bool) int](#lastIndexFunc)
    * [func makeCutsetFunc(cutset string) func(r rune) bool](#makeCutsetFunc)
    * [func Trim(s []byte, cutset string) []byte](#Trim)
    * [func TrimLeft(s []byte, cutset string) []byte](#TrimLeft)
    * [func TrimRight(s []byte, cutset string) []byte](#TrimRight)
    * [func TrimSpace(s []byte) []byte](#TrimSpace)
    * [func Runes(s []byte) []rune](#Runes)
    * [func Replace(s, old, new []byte, n int) []byte](#Replace)
    * [func ReplaceAll(s, old, new []byte) []byte](#ReplaceAll)
    * [func EqualFold(s, t []byte) bool](#EqualFold)
    * [func Index(s, sep []byte) int](#Index)


## <a id="const" href="#const">Constants</a>

### <a id="smallBufferSize" href="#smallBufferSize">const smallBufferSize</a>

```
searchKey: bytes.smallBufferSize
tags: [private]
```

```Go
const smallBufferSize = 64
```

smallBufferSize is an initial allocation minimal capacity. 

### <a id="opRead" href="#opRead">const opRead</a>

```
searchKey: bytes.opRead
tags: [private]
```

```Go
const opRead readOp = -1 // Any other read operation.

```

Don't use iota for these, as the values need to correspond with the names and comments, which is easier to see when being explicit. 

### <a id="opInvalid" href="#opInvalid">const opInvalid</a>

```
searchKey: bytes.opInvalid
tags: [private]
```

```Go
const opInvalid readOp = 0 // Non-read operation.

```

Don't use iota for these, as the values need to correspond with the names and comments, which is easier to see when being explicit. 

### <a id="opReadRune1" href="#opReadRune1">const opReadRune1</a>

```
searchKey: bytes.opReadRune1
tags: [private]
```

```Go
const opReadRune1 readOp = 1 // Read rune of size 1.

```

Don't use iota for these, as the values need to correspond with the names and comments, which is easier to see when being explicit. 

### <a id="opReadRune2" href="#opReadRune2">const opReadRune2</a>

```
searchKey: bytes.opReadRune2
tags: [private]
```

```Go
const opReadRune2 readOp = 2 // Read rune of size 2.

```

Don't use iota for these, as the values need to correspond with the names and comments, which is easier to see when being explicit. 

### <a id="opReadRune3" href="#opReadRune3">const opReadRune3</a>

```
searchKey: bytes.opReadRune3
tags: [private]
```

```Go
const opReadRune3 readOp = 3 // Read rune of size 3.

```

Don't use iota for these, as the values need to correspond with the names and comments, which is easier to see when being explicit. 

### <a id="opReadRune4" href="#opReadRune4">const opReadRune4</a>

```
searchKey: bytes.opReadRune4
tags: [private]
```

```Go
const opReadRune4 readOp = 4 // Read rune of size 4.

```

Don't use iota for these, as the values need to correspond with the names and comments, which is easier to see when being explicit. 

### <a id="maxInt" href="#maxInt">const maxInt</a>

```
searchKey: bytes.maxInt
tags: [private]
```

```Go
const maxInt = int(^uint(0) >> 1)
```

### <a id="MinRead" href="#MinRead">const MinRead</a>

```
searchKey: bytes.MinRead
```

```Go
const MinRead = 512
```

MinRead is the minimum slice size passed to a Read call by Buffer.ReadFrom. As long as the Buffer has at least MinRead bytes beyond what is required to hold the contents of r, ReadFrom will not grow the underlying buffer. 

## <a id="var" href="#var">Variables</a>

### <a id="ErrTooLarge" href="#ErrTooLarge">var ErrTooLarge</a>

```
searchKey: bytes.ErrTooLarge
```

```Go
var ErrTooLarge = errors.New("bytes.Buffer: too large")
```

ErrTooLarge is passed to panic if memory cannot be allocated to store data in a buffer. 

### <a id="errNegativeRead" href="#errNegativeRead">var errNegativeRead</a>

```
searchKey: bytes.errNegativeRead
tags: [private]
```

```Go
var errNegativeRead = errors.New("bytes.Buffer: reader returned negative count from Read")
```

### <a id="errUnreadByte" href="#errUnreadByte">var errUnreadByte</a>

```
searchKey: bytes.errUnreadByte
tags: [private]
```

```Go
var errUnreadByte = ...
```

### <a id="asciiSpace" href="#asciiSpace">var asciiSpace</a>

```
searchKey: bytes.asciiSpace
tags: [private]
```

```Go
var asciiSpace = [256]uint8{'\t': 1, '\n': 1, '\v': 1, '\f': 1, '\r': 1, ' ': 1}
```

### <a id="IndexBytePortable" href="#IndexBytePortable">var IndexBytePortable</a>

```
searchKey: bytes.IndexBytePortable
tags: [private]
```

```Go
var IndexBytePortable = indexBytePortable
```

Export func for testing 

## <a id="type" href="#type">Types</a>

### <a id="Buffer" href="#Buffer">type Buffer struct</a>

```
searchKey: bytes.Buffer
```

```Go
type Buffer struct {
	buf      []byte // contents are the bytes buf[off : len(buf)]
	off      int    // read at &buf[off], write at &buf[len(buf)]
	lastRead readOp // last read operation, so that Unread* can work correctly.
}
```

A Buffer is a variable-sized buffer of bytes with Read and Write methods. The zero value for Buffer is an empty buffer ready to use. 

#### <a id="NewBuffer" href="#NewBuffer">func NewBuffer(buf []byte) *Buffer</a>

```
searchKey: bytes.NewBuffer
```

```Go
func NewBuffer(buf []byte) *Buffer
```

NewBuffer creates and initializes a new Buffer using buf as its initial contents. The new Buffer takes ownership of buf, and the caller should not use buf after this call. NewBuffer is intended to prepare a Buffer to read existing data. It can also be used to set the initial size of the internal buffer for writing. To do that, buf should have the desired capacity but a length of zero. 

In most cases, new(Buffer) (or just declaring a Buffer variable) is sufficient to initialize a Buffer. 

#### <a id="NewBufferString" href="#NewBufferString">func NewBufferString(s string) *Buffer</a>

```
searchKey: bytes.NewBufferString
```

```Go
func NewBufferString(s string) *Buffer
```

NewBufferString creates and initializes a new Buffer using string s as its initial contents. It is intended to prepare a buffer to read an existing string. 

In most cases, new(Buffer) (or just declaring a Buffer variable) is sufficient to initialize a Buffer. 

#### <a id="Buffer.Bytes" href="#Buffer.Bytes">func (b *Buffer) Bytes() []byte</a>

```
searchKey: bytes.Buffer.Bytes
```

```Go
func (b *Buffer) Bytes() []byte
```

Bytes returns a slice of length b.Len() holding the unread portion of the buffer. The slice is valid for use only until the next buffer modification (that is, only until the next call to a method like Read, Write, Reset, or Truncate). The slice aliases the buffer content at least until the next buffer modification, so immediate changes to the slice will affect the result of future reads. 

#### <a id="Buffer.String" href="#Buffer.String">func (b *Buffer) String() string</a>

```
searchKey: bytes.Buffer.String
```

```Go
func (b *Buffer) String() string
```

String returns the contents of the unread portion of the buffer as a string. If the Buffer is a nil pointer, it returns "<nil>". 

To build strings more efficiently, see the strings.Builder type. 

#### <a id="Buffer.empty" href="#Buffer.empty">func (b *Buffer) empty() bool</a>

```
searchKey: bytes.Buffer.empty
tags: [private]
```

```Go
func (b *Buffer) empty() bool
```

empty reports whether the unread portion of the buffer is empty. 

#### <a id="Buffer.Len" href="#Buffer.Len">func (b *Buffer) Len() int</a>

```
searchKey: bytes.Buffer.Len
```

```Go
func (b *Buffer) Len() int
```

Len returns the number of bytes of the unread portion of the buffer; b.Len() == len(b.Bytes()). 

#### <a id="Buffer.Cap" href="#Buffer.Cap">func (b *Buffer) Cap() int</a>

```
searchKey: bytes.Buffer.Cap
```

```Go
func (b *Buffer) Cap() int
```

Cap returns the capacity of the buffer's underlying byte slice, that is, the total space allocated for the buffer's data. 

#### <a id="Buffer.Truncate" href="#Buffer.Truncate">func (b *Buffer) Truncate(n int)</a>

```
searchKey: bytes.Buffer.Truncate
```

```Go
func (b *Buffer) Truncate(n int)
```

Truncate discards all but the first n unread bytes from the buffer but continues to use the same allocated storage. It panics if n is negative or greater than the length of the buffer. 

#### <a id="Buffer.Reset" href="#Buffer.Reset">func (b *Buffer) Reset()</a>

```
searchKey: bytes.Buffer.Reset
```

```Go
func (b *Buffer) Reset()
```

Reset resets the buffer to be empty, but it retains the underlying storage for use by future writes. Reset is the same as Truncate(0). 

#### <a id="Buffer.tryGrowByReslice" href="#Buffer.tryGrowByReslice">func (b *Buffer) tryGrowByReslice(n int) (int, bool)</a>

```
searchKey: bytes.Buffer.tryGrowByReslice
tags: [private]
```

```Go
func (b *Buffer) tryGrowByReslice(n int) (int, bool)
```

tryGrowByReslice is a inlineable version of grow for the fast-case where the internal buffer only needs to be resliced. It returns the index where bytes should be written and whether it succeeded. 

#### <a id="Buffer.grow" href="#Buffer.grow">func (b *Buffer) grow(n int) int</a>

```
searchKey: bytes.Buffer.grow
tags: [private]
```

```Go
func (b *Buffer) grow(n int) int
```

grow grows the buffer to guarantee space for n more bytes. It returns the index where bytes should be written. If the buffer can't grow it will panic with ErrTooLarge. 

#### <a id="Buffer.Grow" href="#Buffer.Grow">func (b *Buffer) Grow(n int)</a>

```
searchKey: bytes.Buffer.Grow
```

```Go
func (b *Buffer) Grow(n int)
```

Grow grows the buffer's capacity, if necessary, to guarantee space for another n bytes. After Grow(n), at least n bytes can be written to the buffer without another allocation. If n is negative, Grow will panic. If the buffer can't grow it will panic with ErrTooLarge. 

#### <a id="Buffer.Write" href="#Buffer.Write">func (b *Buffer) Write(p []byte) (n int, err error)</a>

```
searchKey: bytes.Buffer.Write
```

```Go
func (b *Buffer) Write(p []byte) (n int, err error)
```

Write appends the contents of p to the buffer, growing the buffer as needed. The return value n is the length of p; err is always nil. If the buffer becomes too large, Write will panic with ErrTooLarge. 

#### <a id="Buffer.WriteString" href="#Buffer.WriteString">func (b *Buffer) WriteString(s string) (n int, err error)</a>

```
searchKey: bytes.Buffer.WriteString
```

```Go
func (b *Buffer) WriteString(s string) (n int, err error)
```

WriteString appends the contents of s to the buffer, growing the buffer as needed. The return value n is the length of s; err is always nil. If the buffer becomes too large, WriteString will panic with ErrTooLarge. 

#### <a id="Buffer.ReadFrom" href="#Buffer.ReadFrom">func (b *Buffer) ReadFrom(r io.Reader) (n int64, err error)</a>

```
searchKey: bytes.Buffer.ReadFrom
```

```Go
func (b *Buffer) ReadFrom(r io.Reader) (n int64, err error)
```

ReadFrom reads data from r until EOF and appends it to the buffer, growing the buffer as needed. The return value n is the number of bytes read. Any error except io.EOF encountered during the read is also returned. If the buffer becomes too large, ReadFrom will panic with ErrTooLarge. 

#### <a id="Buffer.WriteTo" href="#Buffer.WriteTo">func (b *Buffer) WriteTo(w io.Writer) (n int64, err error)</a>

```
searchKey: bytes.Buffer.WriteTo
```

```Go
func (b *Buffer) WriteTo(w io.Writer) (n int64, err error)
```

WriteTo writes data to w until the buffer is drained or an error occurs. The return value n is the number of bytes written; it always fits into an int, but it is int64 to match the io.WriterTo interface. Any error encountered during the write is also returned. 

#### <a id="Buffer.WriteByte" href="#Buffer.WriteByte">func (b *Buffer) WriteByte(c byte) error</a>

```
searchKey: bytes.Buffer.WriteByte
```

```Go
func (b *Buffer) WriteByte(c byte) error
```

WriteByte appends the byte c to the buffer, growing the buffer as needed. The returned error is always nil, but is included to match bufio.Writer's WriteByte. If the buffer becomes too large, WriteByte will panic with ErrTooLarge. 

#### <a id="Buffer.WriteRune" href="#Buffer.WriteRune">func (b *Buffer) WriteRune(r rune) (n int, err error)</a>

```
searchKey: bytes.Buffer.WriteRune
```

```Go
func (b *Buffer) WriteRune(r rune) (n int, err error)
```

WriteRune appends the UTF-8 encoding of Unicode code point r to the buffer, returning its length and an error, which is always nil but is included to match bufio.Writer's WriteRune. The buffer is grown as needed; if it becomes too large, WriteRune will panic with ErrTooLarge. 

#### <a id="Buffer.Read" href="#Buffer.Read">func (b *Buffer) Read(p []byte) (n int, err error)</a>

```
searchKey: bytes.Buffer.Read
```

```Go
func (b *Buffer) Read(p []byte) (n int, err error)
```

Read reads the next len(p) bytes from the buffer or until the buffer is drained. The return value n is the number of bytes read. If the buffer has no data to return, err is io.EOF (unless len(p) is zero); otherwise it is nil. 

#### <a id="Buffer.Next" href="#Buffer.Next">func (b *Buffer) Next(n int) []byte</a>

```
searchKey: bytes.Buffer.Next
```

```Go
func (b *Buffer) Next(n int) []byte
```

Next returns a slice containing the next n bytes from the buffer, advancing the buffer as if the bytes had been returned by Read. If there are fewer than n bytes in the buffer, Next returns the entire buffer. The slice is only valid until the next call to a read or write method. 

#### <a id="Buffer.ReadByte" href="#Buffer.ReadByte">func (b *Buffer) ReadByte() (byte, error)</a>

```
searchKey: bytes.Buffer.ReadByte
```

```Go
func (b *Buffer) ReadByte() (byte, error)
```

ReadByte reads and returns the next byte from the buffer. If no byte is available, it returns error io.EOF. 

#### <a id="Buffer.ReadRune" href="#Buffer.ReadRune">func (b *Buffer) ReadRune() (r rune, size int, err error)</a>

```
searchKey: bytes.Buffer.ReadRune
```

```Go
func (b *Buffer) ReadRune() (r rune, size int, err error)
```

ReadRune reads and returns the next UTF-8-encoded Unicode code point from the buffer. If no bytes are available, the error returned is io.EOF. If the bytes are an erroneous UTF-8 encoding, it consumes one byte and returns U+FFFD, 1. 

#### <a id="Buffer.UnreadRune" href="#Buffer.UnreadRune">func (b *Buffer) UnreadRune() error</a>

```
searchKey: bytes.Buffer.UnreadRune
```

```Go
func (b *Buffer) UnreadRune() error
```

UnreadRune unreads the last rune returned by ReadRune. If the most recent read or write operation on the buffer was not a successful ReadRune, UnreadRune returns an error.  (In this regard it is stricter than UnreadByte, which will unread the last byte from any read operation.) 

#### <a id="Buffer.UnreadByte" href="#Buffer.UnreadByte">func (b *Buffer) UnreadByte() error</a>

```
searchKey: bytes.Buffer.UnreadByte
```

```Go
func (b *Buffer) UnreadByte() error
```

UnreadByte unreads the last byte returned by the most recent successful read operation that read at least one byte. If a write has happened since the last read, if the last read returned an error, or if the read read zero bytes, UnreadByte returns an error. 

#### <a id="Buffer.ReadBytes" href="#Buffer.ReadBytes">func (b *Buffer) ReadBytes(delim byte) (line []byte, err error)</a>

```
searchKey: bytes.Buffer.ReadBytes
```

```Go
func (b *Buffer) ReadBytes(delim byte) (line []byte, err error)
```

ReadBytes reads until the first occurrence of delim in the input, returning a slice containing the data up to and including the delimiter. If ReadBytes encounters an error before finding a delimiter, it returns the data read before the error and the error itself (often io.EOF). ReadBytes returns err != nil if and only if the returned data does not end in delim. 

#### <a id="Buffer.readSlice" href="#Buffer.readSlice">func (b *Buffer) readSlice(delim byte) (line []byte, err error)</a>

```
searchKey: bytes.Buffer.readSlice
tags: [private]
```

```Go
func (b *Buffer) readSlice(delim byte) (line []byte, err error)
```

readSlice is like ReadBytes but returns a reference to internal buffer data. 

#### <a id="Buffer.ReadString" href="#Buffer.ReadString">func (b *Buffer) ReadString(delim byte) (line string, err error)</a>

```
searchKey: bytes.Buffer.ReadString
```

```Go
func (b *Buffer) ReadString(delim byte) (line string, err error)
```

ReadString reads until the first occurrence of delim in the input, returning a string containing the data up to and including the delimiter. If ReadString encounters an error before finding a delimiter, it returns the data read before the error and the error itself (often io.EOF). ReadString returns err != nil if and only if the returned data does not end in delim. 

### <a id="readOp" href="#readOp">type readOp int8</a>

```
searchKey: bytes.readOp
tags: [private]
```

```Go
type readOp int8
```

The readOp constants describe the last action performed on the buffer, so that UnreadRune and UnreadByte can check for invalid usage. opReadRuneX constants are chosen such that converted to int they correspond to the rune size that was read. 

### <a id="asciiSet" href="#asciiSet">type asciiSet [8]uint32</a>

```
searchKey: bytes.asciiSet
tags: [private]
```

```Go
type asciiSet [8]uint32
```

asciiSet is a 32-byte value, where each bit represents the presence of a given ASCII character in the set. The 128-bits of the lower 16 bytes, starting with the least-significant bit of the lowest word to the most-significant bit of the highest word, map to the full range of all 128 ASCII characters. The 128-bits of the upper 16 bytes will be zeroed, ensuring that any non-ASCII character will be reported as not in the set. 

#### <a id="makeASCIISet" href="#makeASCIISet">func makeASCIISet(chars string) (as asciiSet, ok bool)</a>

```
searchKey: bytes.makeASCIISet
tags: [private]
```

```Go
func makeASCIISet(chars string) (as asciiSet, ok bool)
```

makeASCIISet creates a set of ASCII characters and reports whether all characters in chars are ASCII. 

#### <a id="asciiSet.contains" href="#asciiSet.contains">func (as *asciiSet) contains(c byte) bool</a>

```
searchKey: bytes.asciiSet.contains
tags: [private]
```

```Go
func (as *asciiSet) contains(c byte) bool
```

contains reports whether c is inside the set. 

### <a id="Reader" href="#Reader">type Reader struct</a>

```
searchKey: bytes.Reader
```

```Go
type Reader struct {
	s        []byte
	i        int64 // current reading index
	prevRune int   // index of previous rune; or < 0
}
```

A Reader implements the io.Reader, io.ReaderAt, io.WriterTo, io.Seeker, io.ByteScanner, and io.RuneScanner interfaces by reading from a byte slice. Unlike a Buffer, a Reader is read-only and supports seeking. The zero value for Reader operates like a Reader of an empty slice. 

#### <a id="NewReader" href="#NewReader">func NewReader(b []byte) *Reader</a>

```
searchKey: bytes.NewReader
```

```Go
func NewReader(b []byte) *Reader
```

NewReader returns a new Reader reading from b. 

#### <a id="Reader.Len" href="#Reader.Len">func (r *Reader) Len() int</a>

```
searchKey: bytes.Reader.Len
```

```Go
func (r *Reader) Len() int
```

Len returns the number of bytes of the unread portion of the slice. 

#### <a id="Reader.Size" href="#Reader.Size">func (r *Reader) Size() int64</a>

```
searchKey: bytes.Reader.Size
```

```Go
func (r *Reader) Size() int64
```

Size returns the original length of the underlying byte slice. Size is the number of bytes available for reading via ReadAt. The returned value is always the same and is not affected by calls to any other method. 

#### <a id="Reader.Read" href="#Reader.Read">func (r *Reader) Read(b []byte) (n int, err error)</a>

```
searchKey: bytes.Reader.Read
```

```Go
func (r *Reader) Read(b []byte) (n int, err error)
```

Read implements the io.Reader interface. 

#### <a id="Reader.ReadAt" href="#Reader.ReadAt">func (r *Reader) ReadAt(b []byte, off int64) (n int, err error)</a>

```
searchKey: bytes.Reader.ReadAt
```

```Go
func (r *Reader) ReadAt(b []byte, off int64) (n int, err error)
```

ReadAt implements the io.ReaderAt interface. 

#### <a id="Reader.ReadByte" href="#Reader.ReadByte">func (r *Reader) ReadByte() (byte, error)</a>

```
searchKey: bytes.Reader.ReadByte
```

```Go
func (r *Reader) ReadByte() (byte, error)
```

ReadByte implements the io.ByteReader interface. 

#### <a id="Reader.UnreadByte" href="#Reader.UnreadByte">func (r *Reader) UnreadByte() error</a>

```
searchKey: bytes.Reader.UnreadByte
```

```Go
func (r *Reader) UnreadByte() error
```

UnreadByte complements ReadByte in implementing the io.ByteScanner interface. 

#### <a id="Reader.ReadRune" href="#Reader.ReadRune">func (r *Reader) ReadRune() (ch rune, size int, err error)</a>

```
searchKey: bytes.Reader.ReadRune
```

```Go
func (r *Reader) ReadRune() (ch rune, size int, err error)
```

ReadRune implements the io.RuneReader interface. 

#### <a id="Reader.UnreadRune" href="#Reader.UnreadRune">func (r *Reader) UnreadRune() error</a>

```
searchKey: bytes.Reader.UnreadRune
```

```Go
func (r *Reader) UnreadRune() error
```

UnreadRune complements ReadRune in implementing the io.RuneScanner interface. 

#### <a id="Reader.Seek" href="#Reader.Seek">func (r *Reader) Seek(offset int64, whence int) (int64, error)</a>

```
searchKey: bytes.Reader.Seek
```

```Go
func (r *Reader) Seek(offset int64, whence int) (int64, error)
```

Seek implements the io.Seeker interface. 

#### <a id="Reader.WriteTo" href="#Reader.WriteTo">func (r *Reader) WriteTo(w io.Writer) (n int64, err error)</a>

```
searchKey: bytes.Reader.WriteTo
```

```Go
func (r *Reader) WriteTo(w io.Writer) (n int64, err error)
```

WriteTo implements the io.WriterTo interface. 

#### <a id="Reader.Reset" href="#Reader.Reset">func (r *Reader) Reset(b []byte)</a>

```
searchKey: bytes.Reader.Reset
```

```Go
func (r *Reader) Reset(b []byte)
```

Reset resets the Reader to be reading from b. 

## <a id="func" href="#func">Functions</a>

### <a id="makeSlice" href="#makeSlice">func makeSlice(n int) []byte</a>

```
searchKey: bytes.makeSlice
tags: [private]
```

```Go
func makeSlice(n int) []byte
```

makeSlice allocates a slice of size n. If the allocation fails, it panics with ErrTooLarge. 

### <a id="Equal" href="#Equal">func Equal(a, b []byte) bool</a>

```
searchKey: bytes.Equal
```

```Go
func Equal(a, b []byte) bool
```

Equal reports whether a and b are the same length and contain the same bytes. A nil argument is equivalent to an empty slice. 

### <a id="Compare" href="#Compare">func Compare(a, b []byte) int</a>

```
searchKey: bytes.Compare
```

```Go
func Compare(a, b []byte) int
```

Compare returns an integer comparing two byte slices lexicographically. The result will be 0 if a==b, -1 if a < b, and +1 if a > b. A nil argument is equivalent to an empty slice. 

### <a id="explode" href="#explode">func explode(s []byte, n int) [][]byte</a>

```
searchKey: bytes.explode
tags: [private]
```

```Go
func explode(s []byte, n int) [][]byte
```

explode splits s into a slice of UTF-8 sequences, one per Unicode code point (still slices of bytes), up to a maximum of n byte slices. Invalid UTF-8 sequences are chopped into individual bytes. 

### <a id="Count" href="#Count">func Count(s, sep []byte) int</a>

```
searchKey: bytes.Count
```

```Go
func Count(s, sep []byte) int
```

Count counts the number of non-overlapping instances of sep in s. If sep is an empty slice, Count returns 1 + the number of UTF-8-encoded code points in s. 

### <a id="Contains" href="#Contains">func Contains(b, subslice []byte) bool</a>

```
searchKey: bytes.Contains
```

```Go
func Contains(b, subslice []byte) bool
```

Contains reports whether subslice is within b. 

### <a id="ContainsAny" href="#ContainsAny">func ContainsAny(b []byte, chars string) bool</a>

```
searchKey: bytes.ContainsAny
```

```Go
func ContainsAny(b []byte, chars string) bool
```

ContainsAny reports whether any of the UTF-8-encoded code points in chars are within b. 

### <a id="ContainsRune" href="#ContainsRune">func ContainsRune(b []byte, r rune) bool</a>

```
searchKey: bytes.ContainsRune
```

```Go
func ContainsRune(b []byte, r rune) bool
```

ContainsRune reports whether the rune is contained in the UTF-8-encoded byte slice b. 

### <a id="IndexByte" href="#IndexByte">func IndexByte(b []byte, c byte) int</a>

```
searchKey: bytes.IndexByte
```

```Go
func IndexByte(b []byte, c byte) int
```

IndexByte returns the index of the first instance of c in b, or -1 if c is not present in b. 

### <a id="indexBytePortable" href="#indexBytePortable">func indexBytePortable(s []byte, c byte) int</a>

```
searchKey: bytes.indexBytePortable
tags: [private]
```

```Go
func indexBytePortable(s []byte, c byte) int
```

### <a id="LastIndex" href="#LastIndex">func LastIndex(s, sep []byte) int</a>

```
searchKey: bytes.LastIndex
```

```Go
func LastIndex(s, sep []byte) int
```

LastIndex returns the index of the last instance of sep in s, or -1 if sep is not present in s. 

### <a id="LastIndexByte" href="#LastIndexByte">func LastIndexByte(s []byte, c byte) int</a>

```
searchKey: bytes.LastIndexByte
```

```Go
func LastIndexByte(s []byte, c byte) int
```

LastIndexByte returns the index of the last instance of c in s, or -1 if c is not present in s. 

### <a id="IndexRune" href="#IndexRune">func IndexRune(s []byte, r rune) int</a>

```
searchKey: bytes.IndexRune
```

```Go
func IndexRune(s []byte, r rune) int
```

IndexRune interprets s as a sequence of UTF-8-encoded code points. It returns the byte index of the first occurrence in s of the given rune. It returns -1 if rune is not present in s. If r is utf8.RuneError, it returns the first instance of any invalid UTF-8 byte sequence. 

### <a id="IndexAny" href="#IndexAny">func IndexAny(s []byte, chars string) int</a>

```
searchKey: bytes.IndexAny
```

```Go
func IndexAny(s []byte, chars string) int
```

IndexAny interprets s as a sequence of UTF-8-encoded Unicode code points. It returns the byte index of the first occurrence in s of any of the Unicode code points in chars. It returns -1 if chars is empty or if there is no code point in common. 

### <a id="LastIndexAny" href="#LastIndexAny">func LastIndexAny(s []byte, chars string) int</a>

```
searchKey: bytes.LastIndexAny
```

```Go
func LastIndexAny(s []byte, chars string) int
```

LastIndexAny interprets s as a sequence of UTF-8-encoded Unicode code points. It returns the byte index of the last occurrence in s of any of the Unicode code points in chars. It returns -1 if chars is empty or if there is no code point in common. 

### <a id="genSplit" href="#genSplit">func genSplit(s, sep []byte, sepSave, n int) [][]byte</a>

```
searchKey: bytes.genSplit
tags: [private]
```

```Go
func genSplit(s, sep []byte, sepSave, n int) [][]byte
```

Generic split: splits after each instance of sep, including sepSave bytes of sep in the subslices. 

### <a id="SplitN" href="#SplitN">func SplitN(s, sep []byte, n int) [][]byte</a>

```
searchKey: bytes.SplitN
```

```Go
func SplitN(s, sep []byte, n int) [][]byte
```

SplitN slices s into subslices separated by sep and returns a slice of the subslices between those separators. If sep is empty, SplitN splits after each UTF-8 sequence. The count determines the number of subslices to return: 

```
n > 0: at most n subslices; the last subslice will be the unsplit remainder.
n == 0: the result is nil (zero subslices)
n < 0: all subslices

```
### <a id="SplitAfterN" href="#SplitAfterN">func SplitAfterN(s, sep []byte, n int) [][]byte</a>

```
searchKey: bytes.SplitAfterN
```

```Go
func SplitAfterN(s, sep []byte, n int) [][]byte
```

SplitAfterN slices s into subslices after each instance of sep and returns a slice of those subslices. If sep is empty, SplitAfterN splits after each UTF-8 sequence. The count determines the number of subslices to return: 

```
n > 0: at most n subslices; the last subslice will be the unsplit remainder.
n == 0: the result is nil (zero subslices)
n < 0: all subslices

```
### <a id="Split" href="#Split">func Split(s, sep []byte) [][]byte</a>

```
searchKey: bytes.Split
```

```Go
func Split(s, sep []byte) [][]byte
```

Split slices s into all subslices separated by sep and returns a slice of the subslices between those separators. If sep is empty, Split splits after each UTF-8 sequence. It is equivalent to SplitN with a count of -1. 

### <a id="SplitAfter" href="#SplitAfter">func SplitAfter(s, sep []byte) [][]byte</a>

```
searchKey: bytes.SplitAfter
```

```Go
func SplitAfter(s, sep []byte) [][]byte
```

SplitAfter slices s into all subslices after each instance of sep and returns a slice of those subslices. If sep is empty, SplitAfter splits after each UTF-8 sequence. It is equivalent to SplitAfterN with a count of -1. 

### <a id="Fields" href="#Fields">func Fields(s []byte) [][]byte</a>

```
searchKey: bytes.Fields
```

```Go
func Fields(s []byte) [][]byte
```

Fields interprets s as a sequence of UTF-8-encoded code points. It splits the slice s around each instance of one or more consecutive white space characters, as defined by unicode.IsSpace, returning a slice of subslices of s or an empty slice if s contains only white space. 

### <a id="FieldsFunc" href="#FieldsFunc">func FieldsFunc(s []byte, f func(rune) bool) [][]byte</a>

```
searchKey: bytes.FieldsFunc
```

```Go
func FieldsFunc(s []byte, f func(rune) bool) [][]byte
```

FieldsFunc interprets s as a sequence of UTF-8-encoded code points. It splits the slice s at each run of code points c satisfying f(c) and returns a slice of subslices of s. If all code points in s satisfy f(c), or len(s) == 0, an empty slice is returned. 

FieldsFunc makes no guarantees about the order in which it calls f(c) and assumes that f always returns the same value for a given c. 

### <a id="Join" href="#Join">func Join(s [][]byte, sep []byte) []byte</a>

```
searchKey: bytes.Join
```

```Go
func Join(s [][]byte, sep []byte) []byte
```

Join concatenates the elements of s to create a new byte slice. The separator sep is placed between elements in the resulting slice. 

### <a id="HasPrefix" href="#HasPrefix">func HasPrefix(s, prefix []byte) bool</a>

```
searchKey: bytes.HasPrefix
```

```Go
func HasPrefix(s, prefix []byte) bool
```

HasPrefix tests whether the byte slice s begins with prefix. 

### <a id="HasSuffix" href="#HasSuffix">func HasSuffix(s, suffix []byte) bool</a>

```
searchKey: bytes.HasSuffix
```

```Go
func HasSuffix(s, suffix []byte) bool
```

HasSuffix tests whether the byte slice s ends with suffix. 

### <a id="Map" href="#Map">func Map(mapping func(r rune) rune, s []byte) []byte</a>

```
searchKey: bytes.Map
```

```Go
func Map(mapping func(r rune) rune, s []byte) []byte
```

Map returns a copy of the byte slice s with all its characters modified according to the mapping function. If mapping returns a negative value, the character is dropped from the byte slice with no replacement. The characters in s and the output are interpreted as UTF-8-encoded code points. 

### <a id="Repeat" href="#Repeat">func Repeat(b []byte, count int) []byte</a>

```
searchKey: bytes.Repeat
```

```Go
func Repeat(b []byte, count int) []byte
```

Repeat returns a new byte slice consisting of count copies of b. 

It panics if count is negative or if the result of (len(b) * count) overflows. 

### <a id="ToUpper" href="#ToUpper">func ToUpper(s []byte) []byte</a>

```
searchKey: bytes.ToUpper
```

```Go
func ToUpper(s []byte) []byte
```

ToUpper returns a copy of the byte slice s with all Unicode letters mapped to their upper case. 

### <a id="ToLower" href="#ToLower">func ToLower(s []byte) []byte</a>

```
searchKey: bytes.ToLower
```

```Go
func ToLower(s []byte) []byte
```

ToLower returns a copy of the byte slice s with all Unicode letters mapped to their lower case. 

### <a id="ToTitle" href="#ToTitle">func ToTitle(s []byte) []byte</a>

```
searchKey: bytes.ToTitle
```

```Go
func ToTitle(s []byte) []byte
```

ToTitle treats s as UTF-8-encoded bytes and returns a copy with all the Unicode letters mapped to their title case. 

### <a id="ToUpperSpecial" href="#ToUpperSpecial">func ToUpperSpecial(c unicode.SpecialCase, s []byte) []byte</a>

```
searchKey: bytes.ToUpperSpecial
```

```Go
func ToUpperSpecial(c unicode.SpecialCase, s []byte) []byte
```

ToUpperSpecial treats s as UTF-8-encoded bytes and returns a copy with all the Unicode letters mapped to their upper case, giving priority to the special casing rules. 

### <a id="ToLowerSpecial" href="#ToLowerSpecial">func ToLowerSpecial(c unicode.SpecialCase, s []byte) []byte</a>

```
searchKey: bytes.ToLowerSpecial
```

```Go
func ToLowerSpecial(c unicode.SpecialCase, s []byte) []byte
```

ToLowerSpecial treats s as UTF-8-encoded bytes and returns a copy with all the Unicode letters mapped to their lower case, giving priority to the special casing rules. 

### <a id="ToTitleSpecial" href="#ToTitleSpecial">func ToTitleSpecial(c unicode.SpecialCase, s []byte) []byte</a>

```
searchKey: bytes.ToTitleSpecial
```

```Go
func ToTitleSpecial(c unicode.SpecialCase, s []byte) []byte
```

ToTitleSpecial treats s as UTF-8-encoded bytes and returns a copy with all the Unicode letters mapped to their title case, giving priority to the special casing rules. 

### <a id="ToValidUTF8" href="#ToValidUTF8">func ToValidUTF8(s, replacement []byte) []byte</a>

```
searchKey: bytes.ToValidUTF8
```

```Go
func ToValidUTF8(s, replacement []byte) []byte
```

ToValidUTF8 treats s as UTF-8-encoded bytes and returns a copy with each run of bytes representing invalid UTF-8 replaced with the bytes in replacement, which may be empty. 

### <a id="isSeparator" href="#isSeparator">func isSeparator(r rune) bool</a>

```
searchKey: bytes.isSeparator
tags: [private]
```

```Go
func isSeparator(r rune) bool
```

isSeparator reports whether the rune could mark a word boundary. TODO: update when package unicode captures more of the properties. 

### <a id="Title" href="#Title">func Title(s []byte) []byte</a>

```
searchKey: bytes.Title
```

```Go
func Title(s []byte) []byte
```

Title treats s as UTF-8-encoded bytes and returns a copy with all Unicode letters that begin words mapped to their title case. 

BUG(rsc): The rule Title uses for word boundaries does not handle Unicode punctuation properly. 

### <a id="TrimLeftFunc" href="#TrimLeftFunc">func TrimLeftFunc(s []byte, f func(r rune) bool) []byte</a>

```
searchKey: bytes.TrimLeftFunc
```

```Go
func TrimLeftFunc(s []byte, f func(r rune) bool) []byte
```

TrimLeftFunc treats s as UTF-8-encoded bytes and returns a subslice of s by slicing off all leading UTF-8-encoded code points c that satisfy f(c). 

### <a id="TrimRightFunc" href="#TrimRightFunc">func TrimRightFunc(s []byte, f func(r rune) bool) []byte</a>

```
searchKey: bytes.TrimRightFunc
```

```Go
func TrimRightFunc(s []byte, f func(r rune) bool) []byte
```

TrimRightFunc returns a subslice of s by slicing off all trailing UTF-8-encoded code points c that satisfy f(c). 

### <a id="TrimFunc" href="#TrimFunc">func TrimFunc(s []byte, f func(r rune) bool) []byte</a>

```
searchKey: bytes.TrimFunc
```

```Go
func TrimFunc(s []byte, f func(r rune) bool) []byte
```

TrimFunc returns a subslice of s by slicing off all leading and trailing UTF-8-encoded code points c that satisfy f(c). 

### <a id="TrimPrefix" href="#TrimPrefix">func TrimPrefix(s, prefix []byte) []byte</a>

```
searchKey: bytes.TrimPrefix
```

```Go
func TrimPrefix(s, prefix []byte) []byte
```

TrimPrefix returns s without the provided leading prefix string. If s doesn't start with prefix, s is returned unchanged. 

### <a id="TrimSuffix" href="#TrimSuffix">func TrimSuffix(s, suffix []byte) []byte</a>

```
searchKey: bytes.TrimSuffix
```

```Go
func TrimSuffix(s, suffix []byte) []byte
```

TrimSuffix returns s without the provided trailing suffix string. If s doesn't end with suffix, s is returned unchanged. 

### <a id="IndexFunc" href="#IndexFunc">func IndexFunc(s []byte, f func(r rune) bool) int</a>

```
searchKey: bytes.IndexFunc
```

```Go
func IndexFunc(s []byte, f func(r rune) bool) int
```

IndexFunc interprets s as a sequence of UTF-8-encoded code points. It returns the byte index in s of the first Unicode code point satisfying f(c), or -1 if none do. 

### <a id="LastIndexFunc" href="#LastIndexFunc">func LastIndexFunc(s []byte, f func(r rune) bool) int</a>

```
searchKey: bytes.LastIndexFunc
```

```Go
func LastIndexFunc(s []byte, f func(r rune) bool) int
```

LastIndexFunc interprets s as a sequence of UTF-8-encoded code points. It returns the byte index in s of the last Unicode code point satisfying f(c), or -1 if none do. 

### <a id="indexFunc" href="#indexFunc">func indexFunc(s []byte, f func(r rune) bool, truth bool) int</a>

```
searchKey: bytes.indexFunc
tags: [private]
```

```Go
func indexFunc(s []byte, f func(r rune) bool, truth bool) int
```

indexFunc is the same as IndexFunc except that if truth==false, the sense of the predicate function is inverted. 

### <a id="lastIndexFunc" href="#lastIndexFunc">func lastIndexFunc(s []byte, f func(r rune) bool, truth bool) int</a>

```
searchKey: bytes.lastIndexFunc
tags: [private]
```

```Go
func lastIndexFunc(s []byte, f func(r rune) bool, truth bool) int
```

lastIndexFunc is the same as LastIndexFunc except that if truth==false, the sense of the predicate function is inverted. 

### <a id="makeCutsetFunc" href="#makeCutsetFunc">func makeCutsetFunc(cutset string) func(r rune) bool</a>

```
searchKey: bytes.makeCutsetFunc
tags: [private]
```

```Go
func makeCutsetFunc(cutset string) func(r rune) bool
```

### <a id="Trim" href="#Trim">func Trim(s []byte, cutset string) []byte</a>

```
searchKey: bytes.Trim
```

```Go
func Trim(s []byte, cutset string) []byte
```

Trim returns a subslice of s by slicing off all leading and trailing UTF-8-encoded code points contained in cutset. 

### <a id="TrimLeft" href="#TrimLeft">func TrimLeft(s []byte, cutset string) []byte</a>

```
searchKey: bytes.TrimLeft
```

```Go
func TrimLeft(s []byte, cutset string) []byte
```

TrimLeft returns a subslice of s by slicing off all leading UTF-8-encoded code points contained in cutset. 

### <a id="TrimRight" href="#TrimRight">func TrimRight(s []byte, cutset string) []byte</a>

```
searchKey: bytes.TrimRight
```

```Go
func TrimRight(s []byte, cutset string) []byte
```

TrimRight returns a subslice of s by slicing off all trailing UTF-8-encoded code points that are contained in cutset. 

### <a id="TrimSpace" href="#TrimSpace">func TrimSpace(s []byte) []byte</a>

```
searchKey: bytes.TrimSpace
```

```Go
func TrimSpace(s []byte) []byte
```

TrimSpace returns a subslice of s by slicing off all leading and trailing white space, as defined by Unicode. 

### <a id="Runes" href="#Runes">func Runes(s []byte) []rune</a>

```
searchKey: bytes.Runes
```

```Go
func Runes(s []byte) []rune
```

Runes interprets s as a sequence of UTF-8-encoded code points. It returns a slice of runes (Unicode code points) equivalent to s. 

### <a id="Replace" href="#Replace">func Replace(s, old, new []byte, n int) []byte</a>

```
searchKey: bytes.Replace
```

```Go
func Replace(s, old, new []byte, n int) []byte
```

Replace returns a copy of the slice s with the first n non-overlapping instances of old replaced by new. If old is empty, it matches at the beginning of the slice and after each UTF-8 sequence, yielding up to k+1 replacements for a k-rune slice. If n < 0, there is no limit on the number of replacements. 

### <a id="ReplaceAll" href="#ReplaceAll">func ReplaceAll(s, old, new []byte) []byte</a>

```
searchKey: bytes.ReplaceAll
```

```Go
func ReplaceAll(s, old, new []byte) []byte
```

ReplaceAll returns a copy of the slice s with all non-overlapping instances of old replaced by new. If old is empty, it matches at the beginning of the slice and after each UTF-8 sequence, yielding up to k+1 replacements for a k-rune slice. 

### <a id="EqualFold" href="#EqualFold">func EqualFold(s, t []byte) bool</a>

```
searchKey: bytes.EqualFold
```

```Go
func EqualFold(s, t []byte) bool
```

EqualFold reports whether s and t, interpreted as UTF-8 strings, are equal under Unicode case-folding, which is a more general form of case-insensitivity. 

### <a id="Index" href="#Index">func Index(s, sep []byte) int</a>

```
searchKey: bytes.Index
```

```Go
func Index(s, sep []byte) int
```

Index returns the index of the first instance of sep in s, or -1 if sep is not present in s. 

