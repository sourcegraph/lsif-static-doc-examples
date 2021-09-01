# Package io

Package io provides basic interfaces to I/O primitives. Its primary job is to wrap existing implementations of such primitives, such as those in package os, into shared public interfaces that abstract the functionality, plus some other related primitives. 

Because these interfaces and primitives wrap lower-level operations with various implementations, unless otherwise informed clients should not assume they are safe for parallel execution. 

## Index

* Subpages
  * [io/fs](io/fs.md)
  * [io/fs_test](io/fs_test.md)
  * [io/ioutil](io/ioutil.md)
  * [io/ioutil_test](io/ioutil_test.md)
* [Constants](#const)
    * [const SeekCurrent](#SeekCurrent)
    * [const SeekEnd](#SeekEnd)
    * [const SeekStart](#SeekStart)
* [Variables](#var)
    * [var Discard](#Discard)
    * [var EOF](#EOF)
    * [var ErrClosedPipe](#ErrClosedPipe)
    * [var ErrInvalidWrite](#ErrInvalidWrite)
    * [var ErrNoProgress](#ErrNoProgress)
    * [var ErrShortBuffer](#ErrShortBuffer)
    * [var ErrShortWrite](#ErrShortWrite)
    * [var ErrUnexpectedEOF](#ErrUnexpectedEOF)
    * [var blackHolePool](#blackHolePool)
    * [var errInvalidWrite](#errInvalidWrite)
    * [var errOffset](#errOffset)
    * [var errWhence](#errWhence)
* [Types](#type)
    * [type ByteReader interface](#ByteReader)
    * [type ByteScanner interface](#ByteScanner)
    * [type ByteWriter interface](#ByteWriter)
    * [type Closer interface](#Closer)
    * [type LimitedReader struct](#LimitedReader)
        * [func (l *LimitedReader) Read(p []byte) (n int, err error)](#LimitedReader.Read)
    * [type PipeReader struct](#PipeReader)
        * [func Pipe() (*PipeReader, *PipeWriter)](#Pipe)
        * [func (r *PipeReader) Close() error](#PipeReader.Close)
        * [func (r *PipeReader) CloseWithError(err error) error](#PipeReader.CloseWithError)
        * [func (r *PipeReader) Read(data []byte) (n int, err error)](#PipeReader.Read)
    * [type PipeWriter struct](#PipeWriter)
        * [func (w *PipeWriter) Close() error](#PipeWriter.Close)
        * [func (w *PipeWriter) CloseWithError(err error) error](#PipeWriter.CloseWithError)
        * [func (w *PipeWriter) Write(data []byte) (n int, err error)](#PipeWriter.Write)
    * [type ReadCloser interface](#ReadCloser)
        * [func NopCloser(r Reader) ReadCloser](#NopCloser)
    * [type ReadSeekCloser interface](#ReadSeekCloser)
    * [type ReadSeeker interface](#ReadSeeker)
    * [type ReadWriteCloser interface](#ReadWriteCloser)
    * [type ReadWriteSeeker interface](#ReadWriteSeeker)
    * [type ReadWriter interface](#ReadWriter)
    * [type Reader interface](#Reader)
        * [func LimitReader(r Reader, n int64) Reader](#LimitReader)
        * [func MultiReader(readers ...Reader) Reader](#MultiReader)
        * [func TeeReader(r Reader, w Writer) Reader](#TeeReader)
    * [type ReaderAt interface](#ReaderAt)
    * [type ReaderFrom interface](#ReaderFrom)
    * [type RuneReader interface](#RuneReader)
    * [type RuneScanner interface](#RuneScanner)
    * [type SectionReader struct](#SectionReader)
        * [func NewSectionReader(r ReaderAt, off int64, n int64) *SectionReader](#NewSectionReader)
        * [func (s *SectionReader) Read(p []byte) (n int, err error)](#SectionReader.Read)
        * [func (s *SectionReader) ReadAt(p []byte, off int64) (n int, err error)](#SectionReader.ReadAt)
        * [func (s *SectionReader) Seek(offset int64, whence int) (int64, error)](#SectionReader.Seek)
        * [func (s *SectionReader) Size() int64](#SectionReader.Size)
    * [type Seeker interface](#Seeker)
    * [type StringWriter interface](#StringWriter)
    * [type WriteCloser interface](#WriteCloser)
    * [type WriteSeeker interface](#WriteSeeker)
    * [type Writer interface](#Writer)
        * [func MultiWriter(writers ...Writer) Writer](#MultiWriter)
    * [type WriterAt interface](#WriterAt)
    * [type WriterTo interface](#WriterTo)
    * [type discard struct{}](#discard)
        * [func (discard) ReadFrom(r Reader) (n int64, err error)](#discard.ReadFrom)
        * [func (discard) Write(p []byte) (int, error)](#discard.Write)
        * [func (discard) WriteString(s string) (int, error)](#discard.WriteString)
    * [type eofReader struct{}](#eofReader)
        * [func (eofReader) Read([]byte) (int, error)](#eofReader.Read)
    * [type multiReader struct](#multiReader)
        * [func (mr *multiReader) Read(p []byte) (n int, err error)](#multiReader.Read)
    * [type multiWriter struct](#multiWriter)
        * [func (t *multiWriter) Write(p []byte) (n int, err error)](#multiWriter.Write)
        * [func (t *multiWriter) WriteString(s string) (n int, err error)](#multiWriter.WriteString)
    * [type nopCloser struct](#nopCloser)
        * [func (nopCloser) Close() error](#nopCloser.Close)
    * [type onceError struct](#onceError)
        * [func (a *onceError) Load() error](#onceError.Load)
        * [func (a *onceError) Store(err error)](#onceError.Store)
    * [type pipe struct](#pipe)
        * [func (p *pipe) CloseRead(err error) error](#pipe.CloseRead)
        * [func (p *pipe) CloseWrite(err error) error](#pipe.CloseWrite)
        * [func (p *pipe) Read(b []byte) (n int, err error)](#pipe.Read)
        * [func (p *pipe) Write(b []byte) (n int, err error)](#pipe.Write)
        * [func (p *pipe) readCloseError() error](#pipe.readCloseError)
        * [func (p *pipe) writeCloseError() error](#pipe.writeCloseError)
    * [type teeReader struct](#teeReader)
        * [func (t *teeReader) Read(p []byte) (n int, err error)](#teeReader.Read)
* [Functions](#func)
    * [func Copy(dst Writer, src Reader) (written int64, err error)](#Copy)
    * [func CopyBuffer(dst Writer, src Reader, buf []byte) (written int64, err error)](#CopyBuffer)
    * [func CopyN(dst Writer, src Reader, n int64) (written int64, err error)](#CopyN)
    * [func ReadAll(r Reader) ([]byte, error)](#ReadAll)
    * [func ReadAtLeast(r Reader, buf []byte, min int) (n int, err error)](#ReadAtLeast)
    * [func ReadFull(r Reader, buf []byte) (n int, err error)](#ReadFull)
    * [func WriteString(w Writer, s string) (n int, err error)](#WriteString)
    * [func copyBuffer(dst Writer, src Reader, buf []byte) (written int64, err error)](#copyBuffer)


## <a id="const" href="#const">Constants</a>

### <a id="SeekCurrent" href="#SeekCurrent">const SeekCurrent</a>

```
searchKey: io.SeekCurrent
tags: [constant number]
```

```Go
const SeekCurrent = 1 // seek relative to the current offset

```

Seek whence values. 

### <a id="SeekEnd" href="#SeekEnd">const SeekEnd</a>

```
searchKey: io.SeekEnd
tags: [constant number]
```

```Go
const SeekEnd = 2 // seek relative to the end

```

Seek whence values. 

### <a id="SeekStart" href="#SeekStart">const SeekStart</a>

```
searchKey: io.SeekStart
tags: [constant number]
```

```Go
const SeekStart = 0 // seek relative to the origin of the file

```

Seek whence values. 

## <a id="var" href="#var">Variables</a>

### <a id="Discard" href="#Discard">var Discard</a>

```
searchKey: io.Discard
tags: [variable interface]
```

```Go
var Discard Writer = discard{}
```

Discard is a Writer on which all Write calls succeed without doing anything. 

### <a id="EOF" href="#EOF">var EOF</a>

```
searchKey: io.EOF
tags: [variable interface]
```

```Go
var EOF = errors.New("EOF")
```

EOF is the error returned by Read when no more input is available. (Read must return EOF itself, not an error wrapping EOF, because callers will test for EOF using ==.) Functions should return EOF only to signal a graceful end of input. If the EOF occurs unexpectedly in a structured data stream, the appropriate error is either ErrUnexpectedEOF or some other error giving more detail. 

### <a id="ErrClosedPipe" href="#ErrClosedPipe">var ErrClosedPipe</a>

```
searchKey: io.ErrClosedPipe
tags: [variable interface]
```

```Go
var ErrClosedPipe = errors.New("io: read/write on closed pipe")
```

ErrClosedPipe is the error used for read or write operations on a closed pipe. 

### <a id="ErrInvalidWrite" href="#ErrInvalidWrite">var ErrInvalidWrite</a>

```
searchKey: io.ErrInvalidWrite
tags: [variable interface private]
```

```Go
var ErrInvalidWrite = errInvalidWrite
```

exported for test 

### <a id="ErrNoProgress" href="#ErrNoProgress">var ErrNoProgress</a>

```
searchKey: io.ErrNoProgress
tags: [variable interface]
```

```Go
var ErrNoProgress = errors.New("multiple Read calls return no data or error")
```

ErrNoProgress is returned by some clients of an Reader when many calls to Read have failed to return any data or error, usually the sign of a broken Reader implementation. 

### <a id="ErrShortBuffer" href="#ErrShortBuffer">var ErrShortBuffer</a>

```
searchKey: io.ErrShortBuffer
tags: [variable interface]
```

```Go
var ErrShortBuffer = errors.New("short buffer")
```

ErrShortBuffer means that a read required a longer buffer than was provided. 

### <a id="ErrShortWrite" href="#ErrShortWrite">var ErrShortWrite</a>

```
searchKey: io.ErrShortWrite
tags: [variable interface]
```

```Go
var ErrShortWrite = errors.New("short write")
```

ErrShortWrite means that a write accepted fewer bytes than requested but failed to return an explicit error. 

### <a id="ErrUnexpectedEOF" href="#ErrUnexpectedEOF">var ErrUnexpectedEOF</a>

```
searchKey: io.ErrUnexpectedEOF
tags: [variable interface]
```

```Go
var ErrUnexpectedEOF = errors.New("unexpected EOF")
```

ErrUnexpectedEOF means that EOF was encountered in the middle of reading a fixed-size block or data structure. 

### <a id="blackHolePool" href="#blackHolePool">var blackHolePool</a>

```
searchKey: io.blackHolePool
tags: [variable struct private]
```

```Go
var blackHolePool = ...
```

### <a id="errInvalidWrite" href="#errInvalidWrite">var errInvalidWrite</a>

```
searchKey: io.errInvalidWrite
tags: [variable interface private]
```

```Go
var errInvalidWrite = errors.New("invalid write result")
```

errInvalidWrite means that a write returned an impossible count. 

### <a id="errOffset" href="#errOffset">var errOffset</a>

```
searchKey: io.errOffset
tags: [variable interface private]
```

```Go
var errOffset = errors.New("Seek: invalid offset")
```

### <a id="errWhence" href="#errWhence">var errWhence</a>

```
searchKey: io.errWhence
tags: [variable interface private]
```

```Go
var errWhence = errors.New("Seek: invalid whence")
```

## <a id="type" href="#type">Types</a>

### <a id="ByteReader" href="#ByteReader">type ByteReader interface</a>

```
searchKey: io.ByteReader
tags: [interface]
```

```Go
type ByteReader interface {
	ReadByte() (byte, error)
}
```

ByteReader is the interface that wraps the ReadByte method. 

ReadByte reads and returns the next byte from the input or any error encountered. If ReadByte returns an error, no input byte was consumed, and the returned byte value is undefined. 

ReadByte provides an efficient interface for byte-at-time processing. A Reader that does not implement  ByteReader can be wrapped using bufio.NewReader to add this method. 

### <a id="ByteScanner" href="#ByteScanner">type ByteScanner interface</a>

```
searchKey: io.ByteScanner
tags: [interface]
```

```Go
type ByteScanner interface {
	ByteReader
	UnreadByte() error
}
```

ByteScanner is the interface that adds the UnreadByte method to the basic ReadByte method. 

UnreadByte causes the next call to ReadByte to return the same byte as the previous call to ReadByte. It may be an error to call UnreadByte twice without an intervening call to ReadByte. 

### <a id="ByteWriter" href="#ByteWriter">type ByteWriter interface</a>

```
searchKey: io.ByteWriter
tags: [interface]
```

```Go
type ByteWriter interface {
	WriteByte(c byte) error
}
```

ByteWriter is the interface that wraps the WriteByte method. 

### <a id="Closer" href="#Closer">type Closer interface</a>

```
searchKey: io.Closer
tags: [interface]
```

```Go
type Closer interface {
	Close() error
}
```

Closer is the interface that wraps the basic Close method. 

The behavior of Close after the first call is undefined. Specific implementations may document their own behavior. 

### <a id="LimitedReader" href="#LimitedReader">type LimitedReader struct</a>

```
searchKey: io.LimitedReader
tags: [struct]
```

```Go
type LimitedReader struct {
	R Reader // underlying reader
	N int64  // max bytes remaining
}
```

A LimitedReader reads from R but limits the amount of data returned to just N bytes. Each call to Read updates N to reflect the new amount remaining. Read returns EOF when N <= 0 or when the underlying R returns EOF. 

#### <a id="LimitedReader.Read" href="#LimitedReader.Read">func (l *LimitedReader) Read(p []byte) (n int, err error)</a>

```
searchKey: io.LimitedReader.Read
tags: [method]
```

```Go
func (l *LimitedReader) Read(p []byte) (n int, err error)
```

### <a id="PipeReader" href="#PipeReader">type PipeReader struct</a>

```
searchKey: io.PipeReader
tags: [struct]
```

```Go
type PipeReader struct {
	p *pipe
}
```

A PipeReader is the read half of a pipe. 

#### <a id="Pipe" href="#Pipe">func Pipe() (*PipeReader, *PipeWriter)</a>

```
searchKey: io.Pipe
tags: [function]
```

```Go
func Pipe() (*PipeReader, *PipeWriter)
```

Pipe creates a synchronous in-memory pipe. It can be used to connect code expecting an io.Reader with code expecting an io.Writer. 

Reads and Writes on the pipe are matched one to one except when multiple Reads are needed to consume a single Write. That is, each Write to the PipeWriter blocks until it has satisfied one or more Reads from the PipeReader that fully consume the written data. The data is copied directly from the Write to the corresponding Read (or Reads); there is no internal buffering. 

It is safe to call Read and Write in parallel with each other or with Close. Parallel calls to Read and parallel calls to Write are also safe: the individual calls will be gated sequentially. 

#### <a id="PipeReader.Close" href="#PipeReader.Close">func (r *PipeReader) Close() error</a>

```
searchKey: io.PipeReader.Close
tags: [method]
```

```Go
func (r *PipeReader) Close() error
```

Close closes the reader; subsequent writes to the write half of the pipe will return the error ErrClosedPipe. 

#### <a id="PipeReader.CloseWithError" href="#PipeReader.CloseWithError">func (r *PipeReader) CloseWithError(err error) error</a>

```
searchKey: io.PipeReader.CloseWithError
tags: [method]
```

```Go
func (r *PipeReader) CloseWithError(err error) error
```

CloseWithError closes the reader; subsequent writes to the write half of the pipe will return the error err. 

CloseWithError never overwrites the previous error if it exists and always returns nil. 

#### <a id="PipeReader.Read" href="#PipeReader.Read">func (r *PipeReader) Read(data []byte) (n int, err error)</a>

```
searchKey: io.PipeReader.Read
tags: [method]
```

```Go
func (r *PipeReader) Read(data []byte) (n int, err error)
```

Read implements the standard Read interface: it reads data from the pipe, blocking until a writer arrives or the write end is closed. If the write end is closed with an error, that error is returned as err; otherwise err is EOF. 

### <a id="PipeWriter" href="#PipeWriter">type PipeWriter struct</a>

```
searchKey: io.PipeWriter
tags: [struct]
```

```Go
type PipeWriter struct {
	p *pipe
}
```

A PipeWriter is the write half of a pipe. 

#### <a id="PipeWriter.Close" href="#PipeWriter.Close">func (w *PipeWriter) Close() error</a>

```
searchKey: io.PipeWriter.Close
tags: [method]
```

```Go
func (w *PipeWriter) Close() error
```

Close closes the writer; subsequent reads from the read half of the pipe will return no bytes and EOF. 

#### <a id="PipeWriter.CloseWithError" href="#PipeWriter.CloseWithError">func (w *PipeWriter) CloseWithError(err error) error</a>

```
searchKey: io.PipeWriter.CloseWithError
tags: [method]
```

```Go
func (w *PipeWriter) CloseWithError(err error) error
```

CloseWithError closes the writer; subsequent reads from the read half of the pipe will return no bytes and the error err, or EOF if err is nil. 

CloseWithError never overwrites the previous error if it exists and always returns nil. 

#### <a id="PipeWriter.Write" href="#PipeWriter.Write">func (w *PipeWriter) Write(data []byte) (n int, err error)</a>

```
searchKey: io.PipeWriter.Write
tags: [method]
```

```Go
func (w *PipeWriter) Write(data []byte) (n int, err error)
```

Write implements the standard Write interface: it writes data to the pipe, blocking until one or more readers have consumed all the data or the read end is closed. If the read end is closed with an error, that err is returned as err; otherwise err is ErrClosedPipe. 

### <a id="ReadCloser" href="#ReadCloser">type ReadCloser interface</a>

```
searchKey: io.ReadCloser
tags: [interface]
```

```Go
type ReadCloser interface {
	Reader
	Closer
}
```

ReadCloser is the interface that groups the basic Read and Close methods. 

#### <a id="NopCloser" href="#NopCloser">func NopCloser(r Reader) ReadCloser</a>

```
searchKey: io.NopCloser
tags: [function]
```

```Go
func NopCloser(r Reader) ReadCloser
```

NopCloser returns a ReadCloser with a no-op Close method wrapping the provided Reader r. 

### <a id="ReadSeekCloser" href="#ReadSeekCloser">type ReadSeekCloser interface</a>

```
searchKey: io.ReadSeekCloser
tags: [interface]
```

```Go
type ReadSeekCloser interface {
	Reader
	Seeker
	Closer
}
```

ReadSeekCloser is the interface that groups the basic Read, Seek and Close methods. 

### <a id="ReadSeeker" href="#ReadSeeker">type ReadSeeker interface</a>

```
searchKey: io.ReadSeeker
tags: [interface]
```

```Go
type ReadSeeker interface {
	Reader
	Seeker
}
```

ReadSeeker is the interface that groups the basic Read and Seek methods. 

### <a id="ReadWriteCloser" href="#ReadWriteCloser">type ReadWriteCloser interface</a>

```
searchKey: io.ReadWriteCloser
tags: [interface]
```

```Go
type ReadWriteCloser interface {
	Reader
	Writer
	Closer
}
```

ReadWriteCloser is the interface that groups the basic Read, Write and Close methods. 

### <a id="ReadWriteSeeker" href="#ReadWriteSeeker">type ReadWriteSeeker interface</a>

```
searchKey: io.ReadWriteSeeker
tags: [interface]
```

```Go
type ReadWriteSeeker interface {
	Reader
	Writer
	Seeker
}
```

ReadWriteSeeker is the interface that groups the basic Read, Write and Seek methods. 

### <a id="ReadWriter" href="#ReadWriter">type ReadWriter interface</a>

```
searchKey: io.ReadWriter
tags: [interface]
```

```Go
type ReadWriter interface {
	Reader
	Writer
}
```

ReadWriter is the interface that groups the basic Read and Write methods. 

### <a id="Reader" href="#Reader">type Reader interface</a>

```
searchKey: io.Reader
tags: [interface]
```

```Go
type Reader interface {
	Read(p []byte) (n int, err error)
}
```

Reader is the interface that wraps the basic Read method. 

Read reads up to len(p) bytes into p. It returns the number of bytes read (0 <= n <= len(p)) and any error encountered. Even if Read returns n < len(p), it may use all of p as scratch space during the call. If some data is available but not len(p) bytes, Read conventionally returns what is available instead of waiting for more. 

When Read encounters an error or end-of-file condition after successfully reading n > 0 bytes, it returns the number of bytes read. It may return the (non-nil) error from the same call or return the error (and n == 0) from a subsequent call. An instance of this general case is that a Reader returning a non-zero number of bytes at the end of the input stream may return either err == EOF or err == nil. The next Read should return 0, EOF. 

Callers should always process the n > 0 bytes returned before considering the error err. Doing so correctly handles I/O errors that happen after reading some bytes and also both of the allowed EOF behaviors. 

Implementations of Read are discouraged from returning a zero byte count with a nil error, except when len(p) == 0. Callers should treat a return of 0 and nil as indicating that nothing happened; in particular it does not indicate EOF. 

Implementations must not retain p. 

#### <a id="LimitReader" href="#LimitReader">func LimitReader(r Reader, n int64) Reader</a>

```
searchKey: io.LimitReader
tags: [function]
```

```Go
func LimitReader(r Reader, n int64) Reader
```

LimitReader returns a Reader that reads from r but stops with EOF after n bytes. The underlying implementation is a *LimitedReader. 

#### <a id="MultiReader" href="#MultiReader">func MultiReader(readers ...Reader) Reader</a>

```
searchKey: io.MultiReader
tags: [function]
```

```Go
func MultiReader(readers ...Reader) Reader
```

MultiReader returns a Reader that's the logical concatenation of the provided input readers. They're read sequentially. Once all inputs have returned EOF, Read will return EOF.  If any of the readers return a non-nil, non-EOF error, Read will return that error. 

#### <a id="TeeReader" href="#TeeReader">func TeeReader(r Reader, w Writer) Reader</a>

```
searchKey: io.TeeReader
tags: [function]
```

```Go
func TeeReader(r Reader, w Writer) Reader
```

TeeReader returns a Reader that writes to w what it reads from r. All reads from r performed through it are matched with corresponding writes to w. There is no internal buffering - the write must complete before the read completes. Any error encountered while writing is reported as a read error. 

### <a id="ReaderAt" href="#ReaderAt">type ReaderAt interface</a>

```
searchKey: io.ReaderAt
tags: [interface]
```

```Go
type ReaderAt interface {
	ReadAt(p []byte, off int64) (n int, err error)
}
```

ReaderAt is the interface that wraps the basic ReadAt method. 

ReadAt reads len(p) bytes into p starting at offset off in the underlying input source. It returns the number of bytes read (0 <= n <= len(p)) and any error encountered. 

When ReadAt returns n < len(p), it returns a non-nil error explaining why more bytes were not returned. In this respect, ReadAt is stricter than Read. 

Even if ReadAt returns n < len(p), it may use all of p as scratch space during the call. If some data is available but not len(p) bytes, ReadAt blocks until either all the data is available or an error occurs. In this respect ReadAt is different from Read. 

If the n = len(p) bytes returned by ReadAt are at the end of the input source, ReadAt may return either err == EOF or err == nil. 

If ReadAt is reading from an input source with a seek offset, ReadAt should not affect nor be affected by the underlying seek offset. 

Clients of ReadAt can execute parallel ReadAt calls on the same input source. 

Implementations must not retain p. 

### <a id="ReaderFrom" href="#ReaderFrom">type ReaderFrom interface</a>

```
searchKey: io.ReaderFrom
tags: [interface]
```

```Go
type ReaderFrom interface {
	ReadFrom(r Reader) (n int64, err error)
}
```

ReaderFrom is the interface that wraps the ReadFrom method. 

ReadFrom reads data from r until EOF or error. The return value n is the number of bytes read. Any error except EOF encountered during the read is also returned. 

The Copy function uses ReaderFrom if available. 

### <a id="RuneReader" href="#RuneReader">type RuneReader interface</a>

```
searchKey: io.RuneReader
tags: [interface]
```

```Go
type RuneReader interface {
	ReadRune() (r rune, size int, err error)
}
```

RuneReader is the interface that wraps the ReadRune method. 

ReadRune reads a single UTF-8 encoded Unicode character and returns the rune and its size in bytes. If no character is available, err will be set. 

### <a id="RuneScanner" href="#RuneScanner">type RuneScanner interface</a>

```
searchKey: io.RuneScanner
tags: [interface]
```

```Go
type RuneScanner interface {
	RuneReader
	UnreadRune() error
}
```

RuneScanner is the interface that adds the UnreadRune method to the basic ReadRune method. 

UnreadRune causes the next call to ReadRune to return the same rune as the previous call to ReadRune. It may be an error to call UnreadRune twice without an intervening call to ReadRune. 

### <a id="SectionReader" href="#SectionReader">type SectionReader struct</a>

```
searchKey: io.SectionReader
tags: [struct]
```

```Go
type SectionReader struct {
	r     ReaderAt
	base  int64
	off   int64
	limit int64
}
```

SectionReader implements Read, Seek, and ReadAt on a section of an underlying ReaderAt. 

#### <a id="NewSectionReader" href="#NewSectionReader">func NewSectionReader(r ReaderAt, off int64, n int64) *SectionReader</a>

```
searchKey: io.NewSectionReader
tags: [function]
```

```Go
func NewSectionReader(r ReaderAt, off int64, n int64) *SectionReader
```

NewSectionReader returns a SectionReader that reads from r starting at offset off and stops with EOF after n bytes. 

#### <a id="SectionReader.Read" href="#SectionReader.Read">func (s *SectionReader) Read(p []byte) (n int, err error)</a>

```
searchKey: io.SectionReader.Read
tags: [method]
```

```Go
func (s *SectionReader) Read(p []byte) (n int, err error)
```

#### <a id="SectionReader.ReadAt" href="#SectionReader.ReadAt">func (s *SectionReader) ReadAt(p []byte, off int64) (n int, err error)</a>

```
searchKey: io.SectionReader.ReadAt
tags: [method]
```

```Go
func (s *SectionReader) ReadAt(p []byte, off int64) (n int, err error)
```

#### <a id="SectionReader.Seek" href="#SectionReader.Seek">func (s *SectionReader) Seek(offset int64, whence int) (int64, error)</a>

```
searchKey: io.SectionReader.Seek
tags: [method]
```

```Go
func (s *SectionReader) Seek(offset int64, whence int) (int64, error)
```

#### <a id="SectionReader.Size" href="#SectionReader.Size">func (s *SectionReader) Size() int64</a>

```
searchKey: io.SectionReader.Size
tags: [method]
```

```Go
func (s *SectionReader) Size() int64
```

Size returns the size of the section in bytes. 

### <a id="Seeker" href="#Seeker">type Seeker interface</a>

```
searchKey: io.Seeker
tags: [interface]
```

```Go
type Seeker interface {
	Seek(offset int64, whence int) (int64, error)
}
```

Seeker is the interface that wraps the basic Seek method. 

Seek sets the offset for the next Read or Write to offset, interpreted according to whence: SeekStart means relative to the start of the file, SeekCurrent means relative to the current offset, and SeekEnd means relative to the end. Seek returns the new offset relative to the start of the file and an error, if any. 

Seeking to an offset before the start of the file is an error. Seeking to any positive offset is legal, but the behavior of subsequent I/O operations on the underlying object is implementation-dependent. 

### <a id="StringWriter" href="#StringWriter">type StringWriter interface</a>

```
searchKey: io.StringWriter
tags: [interface]
```

```Go
type StringWriter interface {
	WriteString(s string) (n int, err error)
}
```

StringWriter is the interface that wraps the WriteString method. 

### <a id="WriteCloser" href="#WriteCloser">type WriteCloser interface</a>

```
searchKey: io.WriteCloser
tags: [interface]
```

```Go
type WriteCloser interface {
	Writer
	Closer
}
```

WriteCloser is the interface that groups the basic Write and Close methods. 

### <a id="WriteSeeker" href="#WriteSeeker">type WriteSeeker interface</a>

```
searchKey: io.WriteSeeker
tags: [interface]
```

```Go
type WriteSeeker interface {
	Writer
	Seeker
}
```

WriteSeeker is the interface that groups the basic Write and Seek methods. 

### <a id="Writer" href="#Writer">type Writer interface</a>

```
searchKey: io.Writer
tags: [interface]
```

```Go
type Writer interface {
	Write(p []byte) (n int, err error)
}
```

Writer is the interface that wraps the basic Write method. 

Write writes len(p) bytes from p to the underlying data stream. It returns the number of bytes written from p (0 <= n <= len(p)) and any error encountered that caused the write to stop early. Write must return a non-nil error if it returns n < len(p). Write must not modify the slice data, even temporarily. 

Implementations must not retain p. 

#### <a id="MultiWriter" href="#MultiWriter">func MultiWriter(writers ...Writer) Writer</a>

```
searchKey: io.MultiWriter
tags: [function]
```

```Go
func MultiWriter(writers ...Writer) Writer
```

MultiWriter creates a writer that duplicates its writes to all the provided writers, similar to the Unix tee(1) command. 

Each write is written to each listed writer, one at a time. If a listed writer returns an error, that overall write operation stops and returns the error; it does not continue down the list. 

### <a id="WriterAt" href="#WriterAt">type WriterAt interface</a>

```
searchKey: io.WriterAt
tags: [interface]
```

```Go
type WriterAt interface {
	WriteAt(p []byte, off int64) (n int, err error)
}
```

WriterAt is the interface that wraps the basic WriteAt method. 

WriteAt writes len(p) bytes from p to the underlying data stream at offset off. It returns the number of bytes written from p (0 <= n <= len(p)) and any error encountered that caused the write to stop early. WriteAt must return a non-nil error if it returns n < len(p). 

If WriteAt is writing to a destination with a seek offset, WriteAt should not affect nor be affected by the underlying seek offset. 

Clients of WriteAt can execute parallel WriteAt calls on the same destination if the ranges do not overlap. 

Implementations must not retain p. 

### <a id="WriterTo" href="#WriterTo">type WriterTo interface</a>

```
searchKey: io.WriterTo
tags: [interface]
```

```Go
type WriterTo interface {
	WriteTo(w Writer) (n int64, err error)
}
```

WriterTo is the interface that wraps the WriteTo method. 

WriteTo writes data to w until there's no more data to write or when an error occurs. The return value n is the number of bytes written. Any error encountered during the write is also returned. 

The Copy function uses WriterTo if available. 

### <a id="discard" href="#discard">type discard struct{}</a>

```
searchKey: io.discard
tags: [struct private]
```

```Go
type discard struct{}
```

#### <a id="discard.ReadFrom" href="#discard.ReadFrom">func (discard) ReadFrom(r Reader) (n int64, err error)</a>

```
searchKey: io.discard.ReadFrom
tags: [method private]
```

```Go
func (discard) ReadFrom(r Reader) (n int64, err error)
```

#### <a id="discard.Write" href="#discard.Write">func (discard) Write(p []byte) (int, error)</a>

```
searchKey: io.discard.Write
tags: [method private]
```

```Go
func (discard) Write(p []byte) (int, error)
```

#### <a id="discard.WriteString" href="#discard.WriteString">func (discard) WriteString(s string) (int, error)</a>

```
searchKey: io.discard.WriteString
tags: [method private]
```

```Go
func (discard) WriteString(s string) (int, error)
```

### <a id="eofReader" href="#eofReader">type eofReader struct{}</a>

```
searchKey: io.eofReader
tags: [struct private]
```

```Go
type eofReader struct{}
```

#### <a id="eofReader.Read" href="#eofReader.Read">func (eofReader) Read([]byte) (int, error)</a>

```
searchKey: io.eofReader.Read
tags: [method private]
```

```Go
func (eofReader) Read([]byte) (int, error)
```

### <a id="multiReader" href="#multiReader">type multiReader struct</a>

```
searchKey: io.multiReader
tags: [struct private]
```

```Go
type multiReader struct {
	readers []Reader
}
```

#### <a id="multiReader.Read" href="#multiReader.Read">func (mr *multiReader) Read(p []byte) (n int, err error)</a>

```
searchKey: io.multiReader.Read
tags: [method private]
```

```Go
func (mr *multiReader) Read(p []byte) (n int, err error)
```

### <a id="multiWriter" href="#multiWriter">type multiWriter struct</a>

```
searchKey: io.multiWriter
tags: [struct private]
```

```Go
type multiWriter struct {
	writers []Writer
}
```

#### <a id="multiWriter.Write" href="#multiWriter.Write">func (t *multiWriter) Write(p []byte) (n int, err error)</a>

```
searchKey: io.multiWriter.Write
tags: [method private]
```

```Go
func (t *multiWriter) Write(p []byte) (n int, err error)
```

#### <a id="multiWriter.WriteString" href="#multiWriter.WriteString">func (t *multiWriter) WriteString(s string) (n int, err error)</a>

```
searchKey: io.multiWriter.WriteString
tags: [method private]
```

```Go
func (t *multiWriter) WriteString(s string) (n int, err error)
```

### <a id="nopCloser" href="#nopCloser">type nopCloser struct</a>

```
searchKey: io.nopCloser
tags: [struct private]
```

```Go
type nopCloser struct {
	Reader
}
```

#### <a id="nopCloser.Close" href="#nopCloser.Close">func (nopCloser) Close() error</a>

```
searchKey: io.nopCloser.Close
tags: [method private]
```

```Go
func (nopCloser) Close() error
```

### <a id="onceError" href="#onceError">type onceError struct</a>

```
searchKey: io.onceError
tags: [struct private]
```

```Go
type onceError struct {
	sync.Mutex // guards following
	err        error
}
```

onceError is an object that will only store an error once. 

#### <a id="onceError.Load" href="#onceError.Load">func (a *onceError) Load() error</a>

```
searchKey: io.onceError.Load
tags: [method private]
```

```Go
func (a *onceError) Load() error
```

#### <a id="onceError.Store" href="#onceError.Store">func (a *onceError) Store(err error)</a>

```
searchKey: io.onceError.Store
tags: [method private]
```

```Go
func (a *onceError) Store(err error)
```

### <a id="pipe" href="#pipe">type pipe struct</a>

```
searchKey: io.pipe
tags: [struct private]
```

```Go
type pipe struct {
	wrMu sync.Mutex // Serializes Write operations
	wrCh chan []byte
	rdCh chan int

	once sync.Once // Protects closing done
	done chan struct{}
	rerr onceError
	werr onceError
}
```

A pipe is the shared pipe structure underlying PipeReader and PipeWriter. 

#### <a id="pipe.CloseRead" href="#pipe.CloseRead">func (p *pipe) CloseRead(err error) error</a>

```
searchKey: io.pipe.CloseRead
tags: [method private]
```

```Go
func (p *pipe) CloseRead(err error) error
```

#### <a id="pipe.CloseWrite" href="#pipe.CloseWrite">func (p *pipe) CloseWrite(err error) error</a>

```
searchKey: io.pipe.CloseWrite
tags: [method private]
```

```Go
func (p *pipe) CloseWrite(err error) error
```

#### <a id="pipe.Read" href="#pipe.Read">func (p *pipe) Read(b []byte) (n int, err error)</a>

```
searchKey: io.pipe.Read
tags: [method private]
```

```Go
func (p *pipe) Read(b []byte) (n int, err error)
```

#### <a id="pipe.Write" href="#pipe.Write">func (p *pipe) Write(b []byte) (n int, err error)</a>

```
searchKey: io.pipe.Write
tags: [method private]
```

```Go
func (p *pipe) Write(b []byte) (n int, err error)
```

#### <a id="pipe.readCloseError" href="#pipe.readCloseError">func (p *pipe) readCloseError() error</a>

```
searchKey: io.pipe.readCloseError
tags: [method private]
```

```Go
func (p *pipe) readCloseError() error
```

#### <a id="pipe.writeCloseError" href="#pipe.writeCloseError">func (p *pipe) writeCloseError() error</a>

```
searchKey: io.pipe.writeCloseError
tags: [method private]
```

```Go
func (p *pipe) writeCloseError() error
```

### <a id="teeReader" href="#teeReader">type teeReader struct</a>

```
searchKey: io.teeReader
tags: [struct private]
```

```Go
type teeReader struct {
	r Reader
	w Writer
}
```

#### <a id="teeReader.Read" href="#teeReader.Read">func (t *teeReader) Read(p []byte) (n int, err error)</a>

```
searchKey: io.teeReader.Read
tags: [method private]
```

```Go
func (t *teeReader) Read(p []byte) (n int, err error)
```

## <a id="func" href="#func">Functions</a>

### <a id="Copy" href="#Copy">func Copy(dst Writer, src Reader) (written int64, err error)</a>

```
searchKey: io.Copy
tags: [function]
```

```Go
func Copy(dst Writer, src Reader) (written int64, err error)
```

Copy copies from src to dst until either EOF is reached on src or an error occurs. It returns the number of bytes copied and the first error encountered while copying, if any. 

A successful Copy returns err == nil, not err == EOF. Because Copy is defined to read from src until EOF, it does not treat an EOF from Read as an error to be reported. 

If src implements the WriterTo interface, the copy is implemented by calling src.WriteTo(dst). Otherwise, if dst implements the ReaderFrom interface, the copy is implemented by calling dst.ReadFrom(src). 

### <a id="CopyBuffer" href="#CopyBuffer">func CopyBuffer(dst Writer, src Reader, buf []byte) (written int64, err error)</a>

```
searchKey: io.CopyBuffer
tags: [function]
```

```Go
func CopyBuffer(dst Writer, src Reader, buf []byte) (written int64, err error)
```

CopyBuffer is identical to Copy except that it stages through the provided buffer (if one is required) rather than allocating a temporary one. If buf is nil, one is allocated; otherwise if it has zero length, CopyBuffer panics. 

If either src implements WriterTo or dst implements ReaderFrom, buf will not be used to perform the copy. 

### <a id="CopyN" href="#CopyN">func CopyN(dst Writer, src Reader, n int64) (written int64, err error)</a>

```
searchKey: io.CopyN
tags: [function]
```

```Go
func CopyN(dst Writer, src Reader, n int64) (written int64, err error)
```

CopyN copies n bytes (or until an error) from src to dst. It returns the number of bytes copied and the earliest error encountered while copying. On return, written == n if and only if err == nil. 

If dst implements the ReaderFrom interface, the copy is implemented using it. 

### <a id="ReadAll" href="#ReadAll">func ReadAll(r Reader) ([]byte, error)</a>

```
searchKey: io.ReadAll
tags: [function]
```

```Go
func ReadAll(r Reader) ([]byte, error)
```

ReadAll reads from r until an error or EOF and returns the data it read. A successful call returns err == nil, not err == EOF. Because ReadAll is defined to read from src until EOF, it does not treat an EOF from Read as an error to be reported. 

### <a id="ReadAtLeast" href="#ReadAtLeast">func ReadAtLeast(r Reader, buf []byte, min int) (n int, err error)</a>

```
searchKey: io.ReadAtLeast
tags: [function]
```

```Go
func ReadAtLeast(r Reader, buf []byte, min int) (n int, err error)
```

ReadAtLeast reads from r into buf until it has read at least min bytes. It returns the number of bytes copied and an error if fewer bytes were read. The error is EOF only if no bytes were read. If an EOF happens after reading fewer than min bytes, ReadAtLeast returns ErrUnexpectedEOF. If min is greater than the length of buf, ReadAtLeast returns ErrShortBuffer. On return, n >= min if and only if err == nil. If r returns an error having read at least min bytes, the error is dropped. 

### <a id="ReadFull" href="#ReadFull">func ReadFull(r Reader, buf []byte) (n int, err error)</a>

```
searchKey: io.ReadFull
tags: [function]
```

```Go
func ReadFull(r Reader, buf []byte) (n int, err error)
```

ReadFull reads exactly len(buf) bytes from r into buf. It returns the number of bytes copied and an error if fewer bytes were read. The error is EOF only if no bytes were read. If an EOF happens after reading some but not all the bytes, ReadFull returns ErrUnexpectedEOF. On return, n == len(buf) if and only if err == nil. If r returns an error having read at least len(buf) bytes, the error is dropped. 

### <a id="WriteString" href="#WriteString">func WriteString(w Writer, s string) (n int, err error)</a>

```
searchKey: io.WriteString
tags: [function]
```

```Go
func WriteString(w Writer, s string) (n int, err error)
```

WriteString writes the contents of the string s to w, which accepts a slice of bytes. If w implements StringWriter, its WriteString method is invoked directly. Otherwise, w.Write is called exactly once. 

### <a id="copyBuffer" href="#copyBuffer">func copyBuffer(dst Writer, src Reader, buf []byte) (written int64, err error)</a>

```
searchKey: io.copyBuffer
tags: [function private]
```

```Go
func copyBuffer(dst Writer, src Reader, buf []byte) (written int64, err error)
```

copyBuffer is the actual implementation of Copy and CopyBuffer. if buf is nil, one is allocated. 

