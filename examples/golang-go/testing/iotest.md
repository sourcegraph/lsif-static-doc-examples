# Package iotest

Package iotest implements Readers and Writers useful mainly for testing. 

## Index

* [Variables](#var)
    * [var ErrTimeout](#ErrTimeout)
    * [var truncateWriterTests](#truncateWriterTests)
* [Types](#type)
    * [type dataErrReader struct](#dataErrReader)
        * [func (r *dataErrReader) Read(p []byte) (n int, err error)](#dataErrReader.Read)
    * [type errReader struct](#errReader)
        * [func (r *errReader) Read(p []byte) (int, error)](#errReader.Read)
    * [type errWriter struct](#errWriter)
        * [func (w errWriter) Write([]byte) (int, error)](#errWriter.Write)
    * [type halfReader struct](#halfReader)
        * [func (r *halfReader) Read(p []byte) (int, error)](#halfReader.Read)
    * [type oneByteReader struct](#oneByteReader)
        * [func (r *oneByteReader) Read(p []byte) (int, error)](#oneByteReader.Read)
    * [type readLogger struct](#readLogger)
        * [func (l *readLogger) Read(p []byte) (n int, err error)](#readLogger.Read)
    * [type smallByteReader struct](#smallByteReader)
        * [func (r *smallByteReader) Read(p []byte) (int, error)](#smallByteReader.Read)
    * [type timeoutReader struct](#timeoutReader)
        * [func (r *timeoutReader) Read(p []byte) (int, error)](#timeoutReader.Read)
    * [type truncateWriter struct](#truncateWriter)
        * [func (t *truncateWriter) Write(p []byte) (n int, err error)](#truncateWriter.Write)
    * [type writeLogger struct](#writeLogger)
        * [func (l *writeLogger) Write(p []byte) (n int, err error)](#writeLogger.Write)
* [Functions](#func)
    * [func DataErrReader(r io.Reader) io.Reader](#DataErrReader)
    * [func ErrReader(err error) io.Reader](#ErrReader)
    * [func HalfReader(r io.Reader) io.Reader](#HalfReader)
    * [func NewReadLogger(prefix string, r io.Reader) io.Reader](#NewReadLogger)
    * [func NewWriteLogger(prefix string, w io.Writer) io.Writer](#NewWriteLogger)
    * [func OneByteReader(r io.Reader) io.Reader](#OneByteReader)
    * [func TestDataErrReader_emptyReader(t *testing.T)](#TestDataErrReader_emptyReader)
    * [func TestDataErrReader_nonEmptyReader(t *testing.T)](#TestDataErrReader_nonEmptyReader)
    * [func TestErrReader(t *testing.T)](#TestErrReader)
    * [func TestHalfReader_emptyReader(t *testing.T)](#TestHalfReader_emptyReader)
    * [func TestHalfReader_nonEmptyReader(t *testing.T)](#TestHalfReader_nonEmptyReader)
    * [func TestOneByteReader_emptyReader(t *testing.T)](#TestOneByteReader_emptyReader)
    * [func TestOneByteReader_nonEmptyReader(t *testing.T)](#TestOneByteReader_nonEmptyReader)
    * [func TestReadLogger(t *testing.T)](#TestReadLogger)
    * [func TestReadLogger_errorOnRead(t *testing.T)](#TestReadLogger_errorOnRead)
    * [func TestReader(r io.Reader, content []byte) error](#TestReader)
    * [func TestStringsReader(t *testing.T)](#TestStringsReader)
    * [func TestTimeOutReader_emptyReader(t *testing.T)](#TestTimeOutReader_emptyReader)
    * [func TestTimeOutReader_nonEmptyReader(t *testing.T)](#TestTimeOutReader_nonEmptyReader)
    * [func TestTruncateWriter(t *testing.T)](#TestTruncateWriter)
    * [func TestWriteLogger(t *testing.T)](#TestWriteLogger)
    * [func TestWriteLogger_errorOnWrite(t *testing.T)](#TestWriteLogger_errorOnWrite)
    * [func TimeoutReader(r io.Reader) io.Reader](#TimeoutReader)
    * [func TruncateWriter(w io.Writer, n int64) io.Writer](#TruncateWriter)


## <a id="var" href="#var">Variables</a>

```
tags: [package]
```

### <a id="ErrTimeout" href="#ErrTimeout">var ErrTimeout</a>

```
searchKey: iotest.ErrTimeout
tags: [variable interface]
```

```Go
var ErrTimeout = errors.New("timeout")
```

ErrTimeout is a fake timeout error. 

### <a id="truncateWriterTests" href="#truncateWriterTests">var truncateWriterTests</a>

```
searchKey: iotest.truncateWriterTests
tags: [variable array struct private]
```

```Go
var truncateWriterTests = ...
```

## <a id="type" href="#type">Types</a>

```
tags: [package]
```

### <a id="dataErrReader" href="#dataErrReader">type dataErrReader struct</a>

```
searchKey: iotest.dataErrReader
tags: [struct private]
```

```Go
type dataErrReader struct {
	r      io.Reader
	unread []byte
	data   []byte
}
```

#### <a id="dataErrReader.Read" href="#dataErrReader.Read">func (r *dataErrReader) Read(p []byte) (n int, err error)</a>

```
searchKey: iotest.dataErrReader.Read
tags: [method private]
```

```Go
func (r *dataErrReader) Read(p []byte) (n int, err error)
```

### <a id="errReader" href="#errReader">type errReader struct</a>

```
searchKey: iotest.errReader
tags: [struct private]
```

```Go
type errReader struct {
	err error
}
```

#### <a id="errReader.Read" href="#errReader.Read">func (r *errReader) Read(p []byte) (int, error)</a>

```
searchKey: iotest.errReader.Read
tags: [method private]
```

```Go
func (r *errReader) Read(p []byte) (int, error)
```

### <a id="errWriter" href="#errWriter">type errWriter struct</a>

```
searchKey: iotest.errWriter
tags: [struct private]
```

```Go
type errWriter struct {
	err error
}
```

#### <a id="errWriter.Write" href="#errWriter.Write">func (w errWriter) Write([]byte) (int, error)</a>

```
searchKey: iotest.errWriter.Write
tags: [method private]
```

```Go
func (w errWriter) Write([]byte) (int, error)
```

### <a id="halfReader" href="#halfReader">type halfReader struct</a>

```
searchKey: iotest.halfReader
tags: [struct private]
```

```Go
type halfReader struct {
	r io.Reader
}
```

#### <a id="halfReader.Read" href="#halfReader.Read">func (r *halfReader) Read(p []byte) (int, error)</a>

```
searchKey: iotest.halfReader.Read
tags: [method private]
```

```Go
func (r *halfReader) Read(p []byte) (int, error)
```

### <a id="oneByteReader" href="#oneByteReader">type oneByteReader struct</a>

```
searchKey: iotest.oneByteReader
tags: [struct private]
```

```Go
type oneByteReader struct {
	r io.Reader
}
```

#### <a id="oneByteReader.Read" href="#oneByteReader.Read">func (r *oneByteReader) Read(p []byte) (int, error)</a>

```
searchKey: iotest.oneByteReader.Read
tags: [method private]
```

```Go
func (r *oneByteReader) Read(p []byte) (int, error)
```

### <a id="readLogger" href="#readLogger">type readLogger struct</a>

```
searchKey: iotest.readLogger
tags: [struct private]
```

```Go
type readLogger struct {
	prefix string
	r      io.Reader
}
```

#### <a id="readLogger.Read" href="#readLogger.Read">func (l *readLogger) Read(p []byte) (n int, err error)</a>

```
searchKey: iotest.readLogger.Read
tags: [method private]
```

```Go
func (l *readLogger) Read(p []byte) (n int, err error)
```

### <a id="smallByteReader" href="#smallByteReader">type smallByteReader struct</a>

```
searchKey: iotest.smallByteReader
tags: [struct private]
```

```Go
type smallByteReader struct {
	r   io.Reader
	off int
	n   int
}
```

#### <a id="smallByteReader.Read" href="#smallByteReader.Read">func (r *smallByteReader) Read(p []byte) (int, error)</a>

```
searchKey: iotest.smallByteReader.Read
tags: [method private]
```

```Go
func (r *smallByteReader) Read(p []byte) (int, error)
```

### <a id="timeoutReader" href="#timeoutReader">type timeoutReader struct</a>

```
searchKey: iotest.timeoutReader
tags: [struct private]
```

```Go
type timeoutReader struct {
	r     io.Reader
	count int
}
```

#### <a id="timeoutReader.Read" href="#timeoutReader.Read">func (r *timeoutReader) Read(p []byte) (int, error)</a>

```
searchKey: iotest.timeoutReader.Read
tags: [method private]
```

```Go
func (r *timeoutReader) Read(p []byte) (int, error)
```

### <a id="truncateWriter" href="#truncateWriter">type truncateWriter struct</a>

```
searchKey: iotest.truncateWriter
tags: [struct private]
```

```Go
type truncateWriter struct {
	w io.Writer
	n int64
}
```

#### <a id="truncateWriter.Write" href="#truncateWriter.Write">func (t *truncateWriter) Write(p []byte) (n int, err error)</a>

```
searchKey: iotest.truncateWriter.Write
tags: [method private]
```

```Go
func (t *truncateWriter) Write(p []byte) (n int, err error)
```

### <a id="writeLogger" href="#writeLogger">type writeLogger struct</a>

```
searchKey: iotest.writeLogger
tags: [struct private]
```

```Go
type writeLogger struct {
	prefix string
	w      io.Writer
}
```

#### <a id="writeLogger.Write" href="#writeLogger.Write">func (l *writeLogger) Write(p []byte) (n int, err error)</a>

```
searchKey: iotest.writeLogger.Write
tags: [method private]
```

```Go
func (l *writeLogger) Write(p []byte) (n int, err error)
```

## <a id="func" href="#func">Functions</a>

```
tags: [package]
```

### <a id="DataErrReader" href="#DataErrReader">func DataErrReader(r io.Reader) io.Reader</a>

```
searchKey: iotest.DataErrReader
tags: [method]
```

```Go
func DataErrReader(r io.Reader) io.Reader
```

DataErrReader changes the way errors are handled by a Reader. Normally, a Reader returns an error (typically EOF) from the first Read call after the last piece of data is read. DataErrReader wraps a Reader and changes its behavior so the final error is returned along with the final data, instead of in the first call after the final data. 

### <a id="ErrReader" href="#ErrReader">func ErrReader(err error) io.Reader</a>

```
searchKey: iotest.ErrReader
tags: [method]
```

```Go
func ErrReader(err error) io.Reader
```

ErrReader returns an io.Reader that returns 0, err from all Read calls. 

### <a id="HalfReader" href="#HalfReader">func HalfReader(r io.Reader) io.Reader</a>

```
searchKey: iotest.HalfReader
tags: [method]
```

```Go
func HalfReader(r io.Reader) io.Reader
```

HalfReader returns a Reader that implements Read by reading half as many requested bytes from r. 

### <a id="NewReadLogger" href="#NewReadLogger">func NewReadLogger(prefix string, r io.Reader) io.Reader</a>

```
searchKey: iotest.NewReadLogger
tags: [method]
```

```Go
func NewReadLogger(prefix string, r io.Reader) io.Reader
```

NewReadLogger returns a reader that behaves like r except that it logs (using log.Printf) each read to standard error, printing the prefix and the hexadecimal data read. 

### <a id="NewWriteLogger" href="#NewWriteLogger">func NewWriteLogger(prefix string, w io.Writer) io.Writer</a>

```
searchKey: iotest.NewWriteLogger
tags: [method]
```

```Go
func NewWriteLogger(prefix string, w io.Writer) io.Writer
```

NewWriteLogger returns a writer that behaves like w except that it logs (using log.Printf) each write to standard error, printing the prefix and the hexadecimal data written. 

### <a id="OneByteReader" href="#OneByteReader">func OneByteReader(r io.Reader) io.Reader</a>

```
searchKey: iotest.OneByteReader
tags: [method]
```

```Go
func OneByteReader(r io.Reader) io.Reader
```

OneByteReader returns a Reader that implements each non-empty Read by reading one byte from r. 

### <a id="TestDataErrReader_emptyReader" href="#TestDataErrReader_emptyReader">func TestDataErrReader_emptyReader(t *testing.T)</a>

```
searchKey: iotest.TestDataErrReader_emptyReader
tags: [method private test]
```

```Go
func TestDataErrReader_emptyReader(t *testing.T)
```

### <a id="TestDataErrReader_nonEmptyReader" href="#TestDataErrReader_nonEmptyReader">func TestDataErrReader_nonEmptyReader(t *testing.T)</a>

```
searchKey: iotest.TestDataErrReader_nonEmptyReader
tags: [method private test]
```

```Go
func TestDataErrReader_nonEmptyReader(t *testing.T)
```

### <a id="TestErrReader" href="#TestErrReader">func TestErrReader(t *testing.T)</a>

```
searchKey: iotest.TestErrReader
tags: [method private test]
```

```Go
func TestErrReader(t *testing.T)
```

### <a id="TestHalfReader_emptyReader" href="#TestHalfReader_emptyReader">func TestHalfReader_emptyReader(t *testing.T)</a>

```
searchKey: iotest.TestHalfReader_emptyReader
tags: [method private test]
```

```Go
func TestHalfReader_emptyReader(t *testing.T)
```

### <a id="TestHalfReader_nonEmptyReader" href="#TestHalfReader_nonEmptyReader">func TestHalfReader_nonEmptyReader(t *testing.T)</a>

```
searchKey: iotest.TestHalfReader_nonEmptyReader
tags: [method private test]
```

```Go
func TestHalfReader_nonEmptyReader(t *testing.T)
```

### <a id="TestOneByteReader_emptyReader" href="#TestOneByteReader_emptyReader">func TestOneByteReader_emptyReader(t *testing.T)</a>

```
searchKey: iotest.TestOneByteReader_emptyReader
tags: [method private test]
```

```Go
func TestOneByteReader_emptyReader(t *testing.T)
```

### <a id="TestOneByteReader_nonEmptyReader" href="#TestOneByteReader_nonEmptyReader">func TestOneByteReader_nonEmptyReader(t *testing.T)</a>

```
searchKey: iotest.TestOneByteReader_nonEmptyReader
tags: [method private test]
```

```Go
func TestOneByteReader_nonEmptyReader(t *testing.T)
```

### <a id="TestReadLogger" href="#TestReadLogger">func TestReadLogger(t *testing.T)</a>

```
searchKey: iotest.TestReadLogger
tags: [method private test]
```

```Go
func TestReadLogger(t *testing.T)
```

### <a id="TestReadLogger_errorOnRead" href="#TestReadLogger_errorOnRead">func TestReadLogger_errorOnRead(t *testing.T)</a>

```
searchKey: iotest.TestReadLogger_errorOnRead
tags: [method private test]
```

```Go
func TestReadLogger_errorOnRead(t *testing.T)
```

### <a id="TestReader" href="#TestReader">func TestReader(r io.Reader, content []byte) error</a>

```
searchKey: iotest.TestReader
tags: [method]
```

```Go
func TestReader(r io.Reader, content []byte) error
```

TestReader tests that reading from r returns the expected file content. It does reads of different sizes, until EOF. If r implements io.ReaderAt or io.Seeker, TestReader also checks that those operations behave as they should. 

If TestReader finds any misbehaviors, it returns an error reporting them. The error text may span multiple lines. 

### <a id="TestStringsReader" href="#TestStringsReader">func TestStringsReader(t *testing.T)</a>

```
searchKey: iotest.TestStringsReader
tags: [method private test]
```

```Go
func TestStringsReader(t *testing.T)
```

### <a id="TestTimeOutReader_emptyReader" href="#TestTimeOutReader_emptyReader">func TestTimeOutReader_emptyReader(t *testing.T)</a>

```
searchKey: iotest.TestTimeOutReader_emptyReader
tags: [method private test]
```

```Go
func TestTimeOutReader_emptyReader(t *testing.T)
```

### <a id="TestTimeOutReader_nonEmptyReader" href="#TestTimeOutReader_nonEmptyReader">func TestTimeOutReader_nonEmptyReader(t *testing.T)</a>

```
searchKey: iotest.TestTimeOutReader_nonEmptyReader
tags: [method private test]
```

```Go
func TestTimeOutReader_nonEmptyReader(t *testing.T)
```

### <a id="TestTruncateWriter" href="#TestTruncateWriter">func TestTruncateWriter(t *testing.T)</a>

```
searchKey: iotest.TestTruncateWriter
tags: [method private test]
```

```Go
func TestTruncateWriter(t *testing.T)
```

### <a id="TestWriteLogger" href="#TestWriteLogger">func TestWriteLogger(t *testing.T)</a>

```
searchKey: iotest.TestWriteLogger
tags: [method private test]
```

```Go
func TestWriteLogger(t *testing.T)
```

### <a id="TestWriteLogger_errorOnWrite" href="#TestWriteLogger_errorOnWrite">func TestWriteLogger_errorOnWrite(t *testing.T)</a>

```
searchKey: iotest.TestWriteLogger_errorOnWrite
tags: [method private test]
```

```Go
func TestWriteLogger_errorOnWrite(t *testing.T)
```

### <a id="TimeoutReader" href="#TimeoutReader">func TimeoutReader(r io.Reader) io.Reader</a>

```
searchKey: iotest.TimeoutReader
tags: [method]
```

```Go
func TimeoutReader(r io.Reader) io.Reader
```

TimeoutReader returns ErrTimeout on the second read with no data. Subsequent calls to read succeed. 

### <a id="TruncateWriter" href="#TruncateWriter">func TruncateWriter(w io.Writer, n int64) io.Writer</a>

```
searchKey: iotest.TruncateWriter
tags: [method]
```

```Go
func TruncateWriter(w io.Writer, n int64) io.Writer
```

TruncateWriter returns a Writer that writes to w but stops silently after n bytes. 

