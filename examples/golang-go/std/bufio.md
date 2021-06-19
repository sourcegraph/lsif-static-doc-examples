# Package bufio

Package bufio implements buffered I/O. It wraps an io.Reader or io.Writer object, creating another object (Reader or Writer) that also implements the interface but provides buffering and some help for textual I/O. 

## Index

* [Constants](#const)
    * [const defaultBufSize](#defaultBufSize)
    * [const minReadBufferSize](#minReadBufferSize)
    * [const maxConsecutiveEmptyReads](#maxConsecutiveEmptyReads)
    * [const MaxScanTokenSize](#MaxScanTokenSize)
    * [const startBufSize](#startBufSize)
    * [const DefaultBufSize](#DefaultBufSize)
* [Variables](#var)
    * [var ErrInvalidUnreadByte](#ErrInvalidUnreadByte)
    * [var ErrInvalidUnreadRune](#ErrInvalidUnreadRune)
    * [var ErrBufferFull](#ErrBufferFull)
    * [var ErrNegativeCount](#ErrNegativeCount)
    * [var errNegativeRead](#errNegativeRead)
    * [var errNegativeWrite](#errNegativeWrite)
    * [var ErrTooLong](#ErrTooLong)
    * [var ErrNegativeAdvance](#ErrNegativeAdvance)
    * [var ErrAdvanceTooFar](#ErrAdvanceTooFar)
    * [var ErrBadReadCount](#ErrBadReadCount)
    * [var ErrFinalToken](#ErrFinalToken)
    * [var errorRune](#errorRune)
    * [var IsSpace](#IsSpace)
* [Types](#type)
    * [type Reader struct](#Reader)
        * [func NewReaderSize(rd io.Reader, size int) *Reader](#NewReaderSize)
        * [func NewReader(rd io.Reader) *Reader](#NewReader)
        * [func (b *Reader) Size() int](#Reader.Size)
        * [func (b *Reader) Reset(r io.Reader)](#Reader.Reset)
        * [func (b *Reader) reset(buf []byte, r io.Reader)](#Reader.reset)
        * [func (b *Reader) fill()](#Reader.fill)
        * [func (b *Reader) readErr() error](#Reader.readErr)
        * [func (b *Reader) Peek(n int) ([]byte, error)](#Reader.Peek)
        * [func (b *Reader) Discard(n int) (discarded int, err error)](#Reader.Discard)
        * [func (b *Reader) Read(p []byte) (n int, err error)](#Reader.Read)
        * [func (b *Reader) ReadByte() (byte, error)](#Reader.ReadByte)
        * [func (b *Reader) UnreadByte() error](#Reader.UnreadByte)
        * [func (b *Reader) ReadRune() (r rune, size int, err error)](#Reader.ReadRune)
        * [func (b *Reader) UnreadRune() error](#Reader.UnreadRune)
        * [func (b *Reader) Buffered() int](#Reader.Buffered)
        * [func (b *Reader) ReadSlice(delim byte) (line []byte, err error)](#Reader.ReadSlice)
        * [func (b *Reader) ReadLine() (line []byte, isPrefix bool, err error)](#Reader.ReadLine)
        * [func (b *Reader) collectFragments(delim byte) (fullBuffers [][]byte, finalFragment []byte, totalLen int, err error)](#Reader.collectFragments)
        * [func (b *Reader) ReadBytes(delim byte) ([]byte, error)](#Reader.ReadBytes)
        * [func (b *Reader) ReadString(delim byte) (string, error)](#Reader.ReadString)
        * [func (b *Reader) WriteTo(w io.Writer) (n int64, err error)](#Reader.WriteTo)
        * [func (b *Reader) writeBuf(w io.Writer) (int64, error)](#Reader.writeBuf)
    * [type Writer struct](#Writer)
        * [func NewWriterSize(w io.Writer, size int) *Writer](#NewWriterSize)
        * [func NewWriter(w io.Writer) *Writer](#NewWriter)
        * [func (b *Writer) Size() int](#Writer.Size)
        * [func (b *Writer) Reset(w io.Writer)](#Writer.Reset)
        * [func (b *Writer) Flush() error](#Writer.Flush)
        * [func (b *Writer) Available() int](#Writer.Available)
        * [func (b *Writer) Buffered() int](#Writer.Buffered)
        * [func (b *Writer) Write(p []byte) (nn int, err error)](#Writer.Write)
        * [func (b *Writer) WriteByte(c byte) error](#Writer.WriteByte)
        * [func (b *Writer) WriteRune(r rune) (size int, err error)](#Writer.WriteRune)
        * [func (b *Writer) WriteString(s string) (int, error)](#Writer.WriteString)
        * [func (b *Writer) ReadFrom(r io.Reader) (n int64, err error)](#Writer.ReadFrom)
    * [type ReadWriter struct](#ReadWriter)
        * [func NewReadWriter(r *Reader, w *Writer) *ReadWriter](#NewReadWriter)
    * [type Scanner struct](#Scanner)
        * [func NewScanner(r io.Reader) *Scanner](#NewScanner)
        * [func (s *Scanner) Err() error](#Scanner.Err)
        * [func (s *Scanner) Bytes() []byte](#Scanner.Bytes)
        * [func (s *Scanner) Text() string](#Scanner.Text)
        * [func (s *Scanner) Scan() bool](#Scanner.Scan)
        * [func (s *Scanner) advance(n int) bool](#Scanner.advance)
        * [func (s *Scanner) setErr(err error)](#Scanner.setErr)
        * [func (s *Scanner) Buffer(buf []byte, max int)](#Scanner.Buffer)
        * [func (s *Scanner) Split(split SplitFunc)](#Scanner.Split)
        * [func (s *Scanner) MaxTokenSize(n int)](#Scanner.MaxTokenSize)
        * [func (s *Scanner) ErrOrEOF() error](#Scanner.ErrOrEOF)
    * [type SplitFunc func(data []byte, atEOF bool) (advance int, token []byte, err error)](#SplitFunc)
* [Functions](#func)
    * [func ScanBytes(data []byte, atEOF bool) (advance int, token []byte, err error)](#ScanBytes)
    * [func ScanRunes(data []byte, atEOF bool) (advance int, token []byte, err error)](#ScanRunes)
    * [func dropCR(data []byte) []byte](#dropCR)
    * [func ScanLines(data []byte, atEOF bool) (advance int, token []byte, err error)](#ScanLines)
    * [func isSpace(r rune) bool](#isSpace)
    * [func ScanWords(data []byte, atEOF bool) (advance int, token []byte, err error)](#ScanWords)


## <a id="const" href="#const">Constants</a>

```
tags: [exported]
```

### <a id="defaultBufSize" href="#defaultBufSize">const defaultBufSize</a>

```
searchKey: bufio.defaultBufSize
```

```Go
const defaultBufSize = 4096
```

### <a id="minReadBufferSize" href="#minReadBufferSize">const minReadBufferSize</a>

```
searchKey: bufio.minReadBufferSize
```

```Go
const minReadBufferSize = 16
```

### <a id="maxConsecutiveEmptyReads" href="#maxConsecutiveEmptyReads">const maxConsecutiveEmptyReads</a>

```
searchKey: bufio.maxConsecutiveEmptyReads
```

```Go
const maxConsecutiveEmptyReads = 100
```

### <a id="MaxScanTokenSize" href="#MaxScanTokenSize">const MaxScanTokenSize</a>

```
searchKey: bufio.MaxScanTokenSize
tags: [exported]
```

```Go
const MaxScanTokenSize = 64 * 1024
```

MaxScanTokenSize is the maximum size used to buffer a token unless the user provides an explicit buffer with Scanner.Buffer. The actual maximum token size may be smaller as the buffer may need to include, for instance, a newline. 

### <a id="startBufSize" href="#startBufSize">const startBufSize</a>

```
searchKey: bufio.startBufSize
```

```Go
const startBufSize = 4096 // Size of initial allocation for buffer.

```

### <a id="DefaultBufSize" href="#DefaultBufSize">const DefaultBufSize</a>

```
searchKey: bufio.DefaultBufSize
```

```Go
const DefaultBufSize = defaultBufSize
```

## <a id="var" href="#var">Variables</a>

```
tags: [exported]
```

### <a id="ErrInvalidUnreadByte" href="#ErrInvalidUnreadByte">var ErrInvalidUnreadByte</a>

```
searchKey: bufio.ErrInvalidUnreadByte
tags: [exported]
```

```Go
var ErrInvalidUnreadByte = errors.New("bufio: invalid use of UnreadByte")
```

### <a id="ErrInvalidUnreadRune" href="#ErrInvalidUnreadRune">var ErrInvalidUnreadRune</a>

```
searchKey: bufio.ErrInvalidUnreadRune
tags: [exported]
```

```Go
var ErrInvalidUnreadRune = errors.New("bufio: invalid use of UnreadRune")
```

### <a id="ErrBufferFull" href="#ErrBufferFull">var ErrBufferFull</a>

```
searchKey: bufio.ErrBufferFull
tags: [exported]
```

```Go
var ErrBufferFull = errors.New("bufio: buffer full")
```

### <a id="ErrNegativeCount" href="#ErrNegativeCount">var ErrNegativeCount</a>

```
searchKey: bufio.ErrNegativeCount
tags: [exported]
```

```Go
var ErrNegativeCount = errors.New("bufio: negative count")
```

### <a id="errNegativeRead" href="#errNegativeRead">var errNegativeRead</a>

```
searchKey: bufio.errNegativeRead
```

```Go
var errNegativeRead = errors.New("bufio: reader returned negative count from Read")
```

### <a id="errNegativeWrite" href="#errNegativeWrite">var errNegativeWrite</a>

```
searchKey: bufio.errNegativeWrite
```

```Go
var errNegativeWrite = errors.New("bufio: writer returned negative count from Write")
```

### <a id="ErrTooLong" href="#ErrTooLong">var ErrTooLong</a>

```
searchKey: bufio.ErrTooLong
tags: [exported]
```

```Go
var ErrTooLong = errors.New("bufio.Scanner: token too long")
```

Errors returned by Scanner. 

### <a id="ErrNegativeAdvance" href="#ErrNegativeAdvance">var ErrNegativeAdvance</a>

```
searchKey: bufio.ErrNegativeAdvance
tags: [exported]
```

```Go
var ErrNegativeAdvance = errors.New("bufio.Scanner: SplitFunc returns negative advance count")
```

Errors returned by Scanner. 

### <a id="ErrAdvanceTooFar" href="#ErrAdvanceTooFar">var ErrAdvanceTooFar</a>

```
searchKey: bufio.ErrAdvanceTooFar
tags: [exported]
```

```Go
var ErrAdvanceTooFar = errors.New("bufio.Scanner: SplitFunc returns advance count beyond input")
```

Errors returned by Scanner. 

### <a id="ErrBadReadCount" href="#ErrBadReadCount">var ErrBadReadCount</a>

```
searchKey: bufio.ErrBadReadCount
tags: [exported]
```

```Go
var ErrBadReadCount = errors.New("bufio.Scanner: Read returned impossible count")
```

Errors returned by Scanner. 

### <a id="ErrFinalToken" href="#ErrFinalToken">var ErrFinalToken</a>

```
searchKey: bufio.ErrFinalToken
tags: [exported]
```

```Go
var ErrFinalToken = errors.New("final token")
```

ErrFinalToken is a special sentinel error value. It is intended to be returned by a Split function to indicate that the token being delivered with the error is the last token and scanning should stop after this one. After ErrFinalToken is received by Scan, scanning stops with no error. The value is useful to stop processing early or when it is necessary to deliver a final empty token. One could achieve the same behavior with a custom error value but providing one here is tidier. See the emptyFinalToken example for a use of this value. 

### <a id="errorRune" href="#errorRune">var errorRune</a>

```
searchKey: bufio.errorRune
```

```Go
var errorRune = []byte(string(utf8.RuneError))
```

### <a id="IsSpace" href="#IsSpace">var IsSpace</a>

```
searchKey: bufio.IsSpace
```

```Go
var IsSpace = isSpace
```

## <a id="type" href="#type">Types</a>

```
tags: [exported]
```

### <a id="Reader" href="#Reader">type Reader struct</a>

```
searchKey: bufio.Reader
tags: [exported]
```

```Go
type Reader struct {
	buf          []byte
	rd           io.Reader // reader provided by the client
	r, w         int       // buf read and write positions
	err          error
	lastByte     int // last byte read for UnreadByte; -1 means invalid
	lastRuneSize int // size of last rune read for UnreadRune; -1 means invalid
}
```

Reader implements buffering for an io.Reader object. 

#### <a id="NewReaderSize" href="#NewReaderSize">func NewReaderSize(rd io.Reader, size int) *Reader</a>

```
searchKey: bufio.NewReaderSize
tags: [exported]
```

```Go
func NewReaderSize(rd io.Reader, size int) *Reader
```

NewReaderSize returns a new Reader whose buffer has at least the specified size. If the argument io.Reader is already a Reader with large enough size, it returns the underlying Reader. 

#### <a id="NewReader" href="#NewReader">func NewReader(rd io.Reader) *Reader</a>

```
searchKey: bufio.NewReader
tags: [exported]
```

```Go
func NewReader(rd io.Reader) *Reader
```

NewReader returns a new Reader whose buffer has the default size. 

#### <a id="Reader.Size" href="#Reader.Size">func (b *Reader) Size() int</a>

```
searchKey: bufio.Reader.Size
tags: [exported]
```

```Go
func (b *Reader) Size() int
```

Size returns the size of the underlying buffer in bytes. 

#### <a id="Reader.Reset" href="#Reader.Reset">func (b *Reader) Reset(r io.Reader)</a>

```
searchKey: bufio.Reader.Reset
tags: [exported]
```

```Go
func (b *Reader) Reset(r io.Reader)
```

Reset discards any buffered data, resets all state, and switches the buffered reader to read from r. 

#### <a id="Reader.reset" href="#Reader.reset">func (b *Reader) reset(buf []byte, r io.Reader)</a>

```
searchKey: bufio.Reader.reset
```

```Go
func (b *Reader) reset(buf []byte, r io.Reader)
```

#### <a id="Reader.fill" href="#Reader.fill">func (b *Reader) fill()</a>

```
searchKey: bufio.Reader.fill
```

```Go
func (b *Reader) fill()
```

fill reads a new chunk into the buffer. 

#### <a id="Reader.readErr" href="#Reader.readErr">func (b *Reader) readErr() error</a>

```
searchKey: bufio.Reader.readErr
```

```Go
func (b *Reader) readErr() error
```

#### <a id="Reader.Peek" href="#Reader.Peek">func (b *Reader) Peek(n int) ([]byte, error)</a>

```
searchKey: bufio.Reader.Peek
tags: [exported]
```

```Go
func (b *Reader) Peek(n int) ([]byte, error)
```

Peek returns the next n bytes without advancing the reader. The bytes stop being valid at the next read call. If Peek returns fewer than n bytes, it also returns an error explaining why the read is short. The error is ErrBufferFull if n is larger than b's buffer size. 

Calling Peek prevents a UnreadByte or UnreadRune call from succeeding until the next read operation. 

#### <a id="Reader.Discard" href="#Reader.Discard">func (b *Reader) Discard(n int) (discarded int, err error)</a>

```
searchKey: bufio.Reader.Discard
tags: [exported]
```

```Go
func (b *Reader) Discard(n int) (discarded int, err error)
```

Discard skips the next n bytes, returning the number of bytes discarded. 

If Discard skips fewer than n bytes, it also returns an error. If 0 <= n <= b.Buffered(), Discard is guaranteed to succeed without reading from the underlying io.Reader. 

#### <a id="Reader.Read" href="#Reader.Read">func (b *Reader) Read(p []byte) (n int, err error)</a>

```
searchKey: bufio.Reader.Read
tags: [exported]
```

```Go
func (b *Reader) Read(p []byte) (n int, err error)
```

Read reads data into p. It returns the number of bytes read into p. The bytes are taken from at most one Read on the underlying Reader, hence n may be less than len(p). To read exactly len(p) bytes, use io.ReadFull(b, p). At EOF, the count will be zero and err will be io.EOF. 

#### <a id="Reader.ReadByte" href="#Reader.ReadByte">func (b *Reader) ReadByte() (byte, error)</a>

```
searchKey: bufio.Reader.ReadByte
tags: [exported]
```

```Go
func (b *Reader) ReadByte() (byte, error)
```

ReadByte reads and returns a single byte. If no byte is available, returns an error. 

#### <a id="Reader.UnreadByte" href="#Reader.UnreadByte">func (b *Reader) UnreadByte() error</a>

```
searchKey: bufio.Reader.UnreadByte
tags: [exported]
```

```Go
func (b *Reader) UnreadByte() error
```

UnreadByte unreads the last byte. Only the most recently read byte can be unread. 

UnreadByte returns an error if the most recent method called on the Reader was not a read operation. Notably, Peek is not considered a read operation. 

#### <a id="Reader.ReadRune" href="#Reader.ReadRune">func (b *Reader) ReadRune() (r rune, size int, err error)</a>

```
searchKey: bufio.Reader.ReadRune
tags: [exported]
```

```Go
func (b *Reader) ReadRune() (r rune, size int, err error)
```

ReadRune reads a single UTF-8 encoded Unicode character and returns the rune and its size in bytes. If the encoded rune is invalid, it consumes one byte and returns unicode.ReplacementChar (U+FFFD) with a size of 1. 

#### <a id="Reader.UnreadRune" href="#Reader.UnreadRune">func (b *Reader) UnreadRune() error</a>

```
searchKey: bufio.Reader.UnreadRune
tags: [exported]
```

```Go
func (b *Reader) UnreadRune() error
```

UnreadRune unreads the last rune. If the most recent method called on the Reader was not a ReadRune, UnreadRune returns an error. (In this regard it is stricter than UnreadByte, which will unread the last byte from any read operation.) 

#### <a id="Reader.Buffered" href="#Reader.Buffered">func (b *Reader) Buffered() int</a>

```
searchKey: bufio.Reader.Buffered
tags: [exported]
```

```Go
func (b *Reader) Buffered() int
```

Buffered returns the number of bytes that can be read from the current buffer. 

#### <a id="Reader.ReadSlice" href="#Reader.ReadSlice">func (b *Reader) ReadSlice(delim byte) (line []byte, err error)</a>

```
searchKey: bufio.Reader.ReadSlice
tags: [exported]
```

```Go
func (b *Reader) ReadSlice(delim byte) (line []byte, err error)
```

ReadSlice reads until the first occurrence of delim in the input, returning a slice pointing at the bytes in the buffer. The bytes stop being valid at the next read. If ReadSlice encounters an error before finding a delimiter, it returns all the data in the buffer and the error itself (often io.EOF). ReadSlice fails with error ErrBufferFull if the buffer fills without a delim. Because the data returned from ReadSlice will be overwritten by the next I/O operation, most clients should use ReadBytes or ReadString instead. ReadSlice returns err != nil if and only if line does not end in delim. 

#### <a id="Reader.ReadLine" href="#Reader.ReadLine">func (b *Reader) ReadLine() (line []byte, isPrefix bool, err error)</a>

```
searchKey: bufio.Reader.ReadLine
tags: [exported]
```

```Go
func (b *Reader) ReadLine() (line []byte, isPrefix bool, err error)
```

ReadLine is a low-level line-reading primitive. Most callers should use ReadBytes('\n') or ReadString('\n') instead or use a Scanner. 

ReadLine tries to return a single line, not including the end-of-line bytes. If the line was too long for the buffer then isPrefix is set and the beginning of the line is returned. The rest of the line will be returned from future calls. isPrefix will be false when returning the last fragment of the line. The returned buffer is only valid until the next call to ReadLine. ReadLine either returns a non-nil line or it returns an error, never both. 

The text returned from ReadLine does not include the line end ("\r\n" or "\n"). No indication or error is given if the input ends without a final line end. Calling UnreadByte after ReadLine will always unread the last byte read (possibly a character belonging to the line end) even if that byte is not part of the line returned by ReadLine. 

#### <a id="Reader.collectFragments" href="#Reader.collectFragments">func (b *Reader) collectFragments(delim byte) (fullBuffers [][]byte, finalFragment []byte, totalLen int, err error)</a>

```
searchKey: bufio.Reader.collectFragments
```

```Go
func (b *Reader) collectFragments(delim byte) (fullBuffers [][]byte, finalFragment []byte, totalLen int, err error)
```

collectFragments reads until the first occurrence of delim in the input. It returns (slice of full buffers, remaining bytes before delim, total number of bytes in the combined first two elements, error). The complete result is equal to `bytes.Join(append(fullBuffers, finalFragment), nil)`, which has a length of `totalLen`. The result is structured in this way to allow callers to minimize allocations and copies. 

#### <a id="Reader.ReadBytes" href="#Reader.ReadBytes">func (b *Reader) ReadBytes(delim byte) ([]byte, error)</a>

```
searchKey: bufio.Reader.ReadBytes
tags: [exported]
```

```Go
func (b *Reader) ReadBytes(delim byte) ([]byte, error)
```

ReadBytes reads until the first occurrence of delim in the input, returning a slice containing the data up to and including the delimiter. If ReadBytes encounters an error before finding a delimiter, it returns the data read before the error and the error itself (often io.EOF). ReadBytes returns err != nil if and only if the returned data does not end in delim. For simple uses, a Scanner may be more convenient. 

#### <a id="Reader.ReadString" href="#Reader.ReadString">func (b *Reader) ReadString(delim byte) (string, error)</a>

```
searchKey: bufio.Reader.ReadString
tags: [exported]
```

```Go
func (b *Reader) ReadString(delim byte) (string, error)
```

ReadString reads until the first occurrence of delim in the input, returning a string containing the data up to and including the delimiter. If ReadString encounters an error before finding a delimiter, it returns the data read before the error and the error itself (often io.EOF). ReadString returns err != nil if and only if the returned data does not end in delim. For simple uses, a Scanner may be more convenient. 

#### <a id="Reader.WriteTo" href="#Reader.WriteTo">func (b *Reader) WriteTo(w io.Writer) (n int64, err error)</a>

```
searchKey: bufio.Reader.WriteTo
tags: [exported]
```

```Go
func (b *Reader) WriteTo(w io.Writer) (n int64, err error)
```

WriteTo implements io.WriterTo. This may make multiple calls to the Read method of the underlying Reader. If the underlying reader supports the WriteTo method, this calls the underlying WriteTo without buffering. 

#### <a id="Reader.writeBuf" href="#Reader.writeBuf">func (b *Reader) writeBuf(w io.Writer) (int64, error)</a>

```
searchKey: bufio.Reader.writeBuf
```

```Go
func (b *Reader) writeBuf(w io.Writer) (int64, error)
```

writeBuf writes the Reader's buffer to the writer. 

### <a id="Writer" href="#Writer">type Writer struct</a>

```
searchKey: bufio.Writer
tags: [exported]
```

```Go
type Writer struct {
	err error
	buf []byte
	n   int
	wr  io.Writer
}
```

Writer implements buffering for an io.Writer object. If an error occurs writing to a Writer, no more data will be accepted and all subsequent writes, and Flush, will return the error. After all data has been written, the client should call the Flush method to guarantee all data has been forwarded to the underlying io.Writer. 

#### <a id="NewWriterSize" href="#NewWriterSize">func NewWriterSize(w io.Writer, size int) *Writer</a>

```
searchKey: bufio.NewWriterSize
tags: [exported]
```

```Go
func NewWriterSize(w io.Writer, size int) *Writer
```

NewWriterSize returns a new Writer whose buffer has at least the specified size. If the argument io.Writer is already a Writer with large enough size, it returns the underlying Writer. 

#### <a id="NewWriter" href="#NewWriter">func NewWriter(w io.Writer) *Writer</a>

```
searchKey: bufio.NewWriter
tags: [exported]
```

```Go
func NewWriter(w io.Writer) *Writer
```

NewWriter returns a new Writer whose buffer has the default size. 

#### <a id="Writer.Size" href="#Writer.Size">func (b *Writer) Size() int</a>

```
searchKey: bufio.Writer.Size
tags: [exported]
```

```Go
func (b *Writer) Size() int
```

Size returns the size of the underlying buffer in bytes. 

#### <a id="Writer.Reset" href="#Writer.Reset">func (b *Writer) Reset(w io.Writer)</a>

```
searchKey: bufio.Writer.Reset
tags: [exported]
```

```Go
func (b *Writer) Reset(w io.Writer)
```

Reset discards any unflushed buffered data, clears any error, and resets b to write its output to w. 

#### <a id="Writer.Flush" href="#Writer.Flush">func (b *Writer) Flush() error</a>

```
searchKey: bufio.Writer.Flush
tags: [exported]
```

```Go
func (b *Writer) Flush() error
```

Flush writes any buffered data to the underlying io.Writer. 

#### <a id="Writer.Available" href="#Writer.Available">func (b *Writer) Available() int</a>

```
searchKey: bufio.Writer.Available
tags: [exported]
```

```Go
func (b *Writer) Available() int
```

Available returns how many bytes are unused in the buffer. 

#### <a id="Writer.Buffered" href="#Writer.Buffered">func (b *Writer) Buffered() int</a>

```
searchKey: bufio.Writer.Buffered
tags: [exported]
```

```Go
func (b *Writer) Buffered() int
```

Buffered returns the number of bytes that have been written into the current buffer. 

#### <a id="Writer.Write" href="#Writer.Write">func (b *Writer) Write(p []byte) (nn int, err error)</a>

```
searchKey: bufio.Writer.Write
tags: [exported]
```

```Go
func (b *Writer) Write(p []byte) (nn int, err error)
```

Write writes the contents of p into the buffer. It returns the number of bytes written. If nn < len(p), it also returns an error explaining why the write is short. 

#### <a id="Writer.WriteByte" href="#Writer.WriteByte">func (b *Writer) WriteByte(c byte) error</a>

```
searchKey: bufio.Writer.WriteByte
tags: [exported]
```

```Go
func (b *Writer) WriteByte(c byte) error
```

WriteByte writes a single byte. 

#### <a id="Writer.WriteRune" href="#Writer.WriteRune">func (b *Writer) WriteRune(r rune) (size int, err error)</a>

```
searchKey: bufio.Writer.WriteRune
tags: [exported]
```

```Go
func (b *Writer) WriteRune(r rune) (size int, err error)
```

WriteRune writes a single Unicode code point, returning the number of bytes written and any error. 

#### <a id="Writer.WriteString" href="#Writer.WriteString">func (b *Writer) WriteString(s string) (int, error)</a>

```
searchKey: bufio.Writer.WriteString
tags: [exported]
```

```Go
func (b *Writer) WriteString(s string) (int, error)
```

WriteString writes a string. It returns the number of bytes written. If the count is less than len(s), it also returns an error explaining why the write is short. 

#### <a id="Writer.ReadFrom" href="#Writer.ReadFrom">func (b *Writer) ReadFrom(r io.Reader) (n int64, err error)</a>

```
searchKey: bufio.Writer.ReadFrom
tags: [exported]
```

```Go
func (b *Writer) ReadFrom(r io.Reader) (n int64, err error)
```

ReadFrom implements io.ReaderFrom. If the underlying writer supports the ReadFrom method, and b has no buffered data yet, this calls the underlying ReadFrom without buffering. 

### <a id="ReadWriter" href="#ReadWriter">type ReadWriter struct</a>

```
searchKey: bufio.ReadWriter
tags: [exported]
```

```Go
type ReadWriter struct {
	*Reader
	*Writer
}
```

ReadWriter stores pointers to a Reader and a Writer. It implements io.ReadWriter. 

#### <a id="NewReadWriter" href="#NewReadWriter">func NewReadWriter(r *Reader, w *Writer) *ReadWriter</a>

```
searchKey: bufio.NewReadWriter
tags: [exported]
```

```Go
func NewReadWriter(r *Reader, w *Writer) *ReadWriter
```

NewReadWriter allocates a new ReadWriter that dispatches to r and w. 

### <a id="Scanner" href="#Scanner">type Scanner struct</a>

```
searchKey: bufio.Scanner
tags: [exported]
```

```Go
type Scanner struct {
	r            io.Reader // The reader provided by the client.
	split        SplitFunc // The function to split the tokens.
	maxTokenSize int       // Maximum size of a token; modified by tests.
	token        []byte    // Last token returned by split.
	buf          []byte    // Buffer used as argument to split.
	start        int       // First non-processed byte in buf.
	end          int       // End of data in buf.
	err          error     // Sticky error.
	empties      int       // Count of successive empty tokens.
	scanCalled   bool      // Scan has been called; buffer is in use.
	done         bool      // Scan has finished.
}
```

Scanner provides a convenient interface for reading data such as a file of newline-delimited lines of text. Successive calls to the Scan method will step through the 'tokens' of a file, skipping the bytes between the tokens. The specification of a token is defined by a split function of type SplitFunc; the default split function breaks the input into lines with line termination stripped. Split functions are defined in this package for scanning a file into lines, bytes, UTF-8-encoded runes, and space-delimited words. The client may instead provide a custom split function. 

Scanning stops unrecoverably at EOF, the first I/O error, or a token too large to fit in the buffer. When a scan stops, the reader may have advanced arbitrarily far past the last token. Programs that need more control over error handling or large tokens, or must run sequential scans on a reader, should use bufio.Reader instead. 

#### <a id="NewScanner" href="#NewScanner">func NewScanner(r io.Reader) *Scanner</a>

```
searchKey: bufio.NewScanner
tags: [exported]
```

```Go
func NewScanner(r io.Reader) *Scanner
```

NewScanner returns a new Scanner to read from r. The split function defaults to ScanLines. 

#### <a id="Scanner.Err" href="#Scanner.Err">func (s *Scanner) Err() error</a>

```
searchKey: bufio.Scanner.Err
tags: [exported]
```

```Go
func (s *Scanner) Err() error
```

Err returns the first non-EOF error that was encountered by the Scanner. 

#### <a id="Scanner.Bytes" href="#Scanner.Bytes">func (s *Scanner) Bytes() []byte</a>

```
searchKey: bufio.Scanner.Bytes
tags: [exported]
```

```Go
func (s *Scanner) Bytes() []byte
```

Bytes returns the most recent token generated by a call to Scan. The underlying array may point to data that will be overwritten by a subsequent call to Scan. It does no allocation. 

#### <a id="Scanner.Text" href="#Scanner.Text">func (s *Scanner) Text() string</a>

```
searchKey: bufio.Scanner.Text
tags: [exported]
```

```Go
func (s *Scanner) Text() string
```

Text returns the most recent token generated by a call to Scan as a newly allocated string holding its bytes. 

#### <a id="Scanner.Scan" href="#Scanner.Scan">func (s *Scanner) Scan() bool</a>

```
searchKey: bufio.Scanner.Scan
tags: [exported]
```

```Go
func (s *Scanner) Scan() bool
```

Scan advances the Scanner to the next token, which will then be available through the Bytes or Text method. It returns false when the scan stops, either by reaching the end of the input or an error. After Scan returns false, the Err method will return any error that occurred during scanning, except that if it was io.EOF, Err will return nil. Scan panics if the split function returns too many empty tokens without advancing the input. This is a common error mode for scanners. 

#### <a id="Scanner.advance" href="#Scanner.advance">func (s *Scanner) advance(n int) bool</a>

```
searchKey: bufio.Scanner.advance
```

```Go
func (s *Scanner) advance(n int) bool
```

advance consumes n bytes of the buffer. It reports whether the advance was legal. 

#### <a id="Scanner.setErr" href="#Scanner.setErr">func (s *Scanner) setErr(err error)</a>

```
searchKey: bufio.Scanner.setErr
```

```Go
func (s *Scanner) setErr(err error)
```

setErr records the first error encountered. 

#### <a id="Scanner.Buffer" href="#Scanner.Buffer">func (s *Scanner) Buffer(buf []byte, max int)</a>

```
searchKey: bufio.Scanner.Buffer
tags: [exported]
```

```Go
func (s *Scanner) Buffer(buf []byte, max int)
```

Buffer sets the initial buffer to use when scanning and the maximum size of buffer that may be allocated during scanning. The maximum token size is the larger of max and cap(buf). If max <= cap(buf), Scan will use this buffer only and do no allocation. 

By default, Scan uses an internal buffer and sets the maximum token size to MaxScanTokenSize. 

Buffer panics if it is called after scanning has started. 

#### <a id="Scanner.Split" href="#Scanner.Split">func (s *Scanner) Split(split SplitFunc)</a>

```
searchKey: bufio.Scanner.Split
tags: [exported]
```

```Go
func (s *Scanner) Split(split SplitFunc)
```

Split sets the split function for the Scanner. The default split function is ScanLines. 

Split panics if it is called after scanning has started. 

#### <a id="Scanner.MaxTokenSize" href="#Scanner.MaxTokenSize">func (s *Scanner) MaxTokenSize(n int)</a>

```
searchKey: bufio.Scanner.MaxTokenSize
```

```Go
func (s *Scanner) MaxTokenSize(n int)
```

#### <a id="Scanner.ErrOrEOF" href="#Scanner.ErrOrEOF">func (s *Scanner) ErrOrEOF() error</a>

```
searchKey: bufio.Scanner.ErrOrEOF
```

```Go
func (s *Scanner) ErrOrEOF() error
```

ErrOrEOF is like Err, but returns EOF. Used to test a corner case. 

### <a id="SplitFunc" href="#SplitFunc">type SplitFunc func(data []byte, atEOF bool) (advance int, token []byte, err error)</a>

```
searchKey: bufio.SplitFunc
tags: [exported]
```

```Go
type SplitFunc func(data []byte, atEOF bool) (advance int, token []byte, err error)
```

SplitFunc is the signature of the split function used to tokenize the input. The arguments are an initial substring of the remaining unprocessed data and a flag, atEOF, that reports whether the Reader has no more data to give. The return values are the number of bytes to advance the input and the next token to return to the user, if any, plus an error, if any. 

Scanning stops if the function returns an error, in which case some of the input may be discarded. If that error is ErrFinalToken, scanning stops with no error. 

Otherwise, the Scanner advances the input. If the token is not nil, the Scanner returns it to the user. If the token is nil, the Scanner reads more data and continues scanning; if there is no more data--if atEOF was true--the Scanner returns. If the data does not yet hold a complete token, for instance if it has no newline while scanning lines, a SplitFunc can return (0, nil, nil) to signal the Scanner to read more data into the slice and try again with a longer slice starting at the same point in the input. 

The function is never called with an empty data slice unless atEOF is true. If atEOF is true, however, data may be non-empty and, as always, holds unprocessed text. 

## <a id="func" href="#func">Functions</a>

```
tags: [exported]
```

### <a id="ScanBytes" href="#ScanBytes">func ScanBytes(data []byte, atEOF bool) (advance int, token []byte, err error)</a>

```
searchKey: bufio.ScanBytes
tags: [exported]
```

```Go
func ScanBytes(data []byte, atEOF bool) (advance int, token []byte, err error)
```

ScanBytes is a split function for a Scanner that returns each byte as a token. 

### <a id="ScanRunes" href="#ScanRunes">func ScanRunes(data []byte, atEOF bool) (advance int, token []byte, err error)</a>

```
searchKey: bufio.ScanRunes
tags: [exported]
```

```Go
func ScanRunes(data []byte, atEOF bool) (advance int, token []byte, err error)
```

ScanRunes is a split function for a Scanner that returns each UTF-8-encoded rune as a token. The sequence of runes returned is equivalent to that from a range loop over the input as a string, which means that erroneous UTF-8 encodings translate to U+FFFD = "\xef\xbf\xbd". Because of the Scan interface, this makes it impossible for the client to distinguish correctly encoded replacement runes from encoding errors. 

### <a id="dropCR" href="#dropCR">func dropCR(data []byte) []byte</a>

```
searchKey: bufio.dropCR
```

```Go
func dropCR(data []byte) []byte
```

dropCR drops a terminal \r from the data. 

### <a id="ScanLines" href="#ScanLines">func ScanLines(data []byte, atEOF bool) (advance int, token []byte, err error)</a>

```
searchKey: bufio.ScanLines
tags: [exported]
```

```Go
func ScanLines(data []byte, atEOF bool) (advance int, token []byte, err error)
```

ScanLines is a split function for a Scanner that returns each line of text, stripped of any trailing end-of-line marker. The returned line may be empty. The end-of-line marker is one optional carriage return followed by one mandatory newline. In regular expression notation, it is `\r?\n`. The last non-empty line of input will be returned even if it has no newline. 

### <a id="isSpace" href="#isSpace">func isSpace(r rune) bool</a>

```
searchKey: bufio.isSpace
```

```Go
func isSpace(r rune) bool
```

isSpace reports whether the character is a Unicode white space character. We avoid dependency on the unicode package, but check validity of the implementation in the tests. 

### <a id="ScanWords" href="#ScanWords">func ScanWords(data []byte, atEOF bool) (advance int, token []byte, err error)</a>

```
searchKey: bufio.ScanWords
tags: [exported]
```

```Go
func ScanWords(data []byte, atEOF bool) (advance int, token []byte, err error)
```

ScanWords is a split function for a Scanner that returns each space-separated word of text, with surrounding spaces deleted. It will never return an empty string. The definition of space is set by unicode.IsSpace. 

