# Package iotest

Package iotest implements Readers and Writers useful mainly for testing. 

## Index

* [Variables](#var)
    * [var ErrTimeout](#ErrTimeout)
    * [var truncateWriterTests](#truncateWriterTests)
* [Types](#type)
    * [type writeLogger struct](#writeLogger)
        * [func (l *writeLogger) Write(p []byte) (n int, err error)](#writeLogger.Write)
    * [type readLogger struct](#readLogger)
        * [func (l *readLogger) Read(p []byte) (n int, err error)](#readLogger.Read)
    * [type oneByteReader struct](#oneByteReader)
        * [func (r *oneByteReader) Read(p []byte) (int, error)](#oneByteReader.Read)
    * [type halfReader struct](#halfReader)
        * [func (r *halfReader) Read(p []byte) (int, error)](#halfReader.Read)
    * [type dataErrReader struct](#dataErrReader)
        * [func (r *dataErrReader) Read(p []byte) (n int, err error)](#dataErrReader.Read)
    * [type timeoutReader struct](#timeoutReader)
        * [func (r *timeoutReader) Read(p []byte) (int, error)](#timeoutReader.Read)
    * [type errReader struct](#errReader)
        * [func (r *errReader) Read(p []byte) (int, error)](#errReader.Read)
    * [type smallByteReader struct](#smallByteReader)
        * [func (r *smallByteReader) Read(p []byte) (int, error)](#smallByteReader.Read)
    * [type truncateWriter struct](#truncateWriter)
        * [func (t *truncateWriter) Write(p []byte) (n int, err error)](#truncateWriter.Write)
    * [type errWriter struct](#errWriter)
        * [func (w errWriter) Write([]byte) (int, error)](#errWriter.Write)
* [Functions](#func)
    * [func NewWriteLogger(prefix string, w io.Writer) io.Writer](#NewWriteLogger)
    * [func NewReadLogger(prefix string, r io.Reader) io.Reader](#NewReadLogger)
    * [func OneByteReader(r io.Reader) io.Reader](#OneByteReader)
    * [func HalfReader(r io.Reader) io.Reader](#HalfReader)
    * [func DataErrReader(r io.Reader) io.Reader](#DataErrReader)
    * [func TimeoutReader(r io.Reader) io.Reader](#TimeoutReader)
    * [func ErrReader(err error) io.Reader](#ErrReader)
    * [func TestReader(r io.Reader, content []byte) error](#TestReader)
    * [func TruncateWriter(w io.Writer, n int64) io.Writer](#TruncateWriter)
    * [func TestWriteLogger(t *testing.T)](#TestWriteLogger)
    * [func TestWriteLogger_errorOnWrite(t *testing.T)](#TestWriteLogger_errorOnWrite)
    * [func TestReadLogger(t *testing.T)](#TestReadLogger)
    * [func TestReadLogger_errorOnRead(t *testing.T)](#TestReadLogger_errorOnRead)
    * [func TestOneByteReader_nonEmptyReader(t *testing.T)](#TestOneByteReader_nonEmptyReader)
    * [func TestOneByteReader_emptyReader(t *testing.T)](#TestOneByteReader_emptyReader)
    * [func TestHalfReader_nonEmptyReader(t *testing.T)](#TestHalfReader_nonEmptyReader)
    * [func TestHalfReader_emptyReader(t *testing.T)](#TestHalfReader_emptyReader)
    * [func TestTimeOutReader_nonEmptyReader(t *testing.T)](#TestTimeOutReader_nonEmptyReader)
    * [func TestTimeOutReader_emptyReader(t *testing.T)](#TestTimeOutReader_emptyReader)
    * [func TestDataErrReader_nonEmptyReader(t *testing.T)](#TestDataErrReader_nonEmptyReader)
    * [func TestDataErrReader_emptyReader(t *testing.T)](#TestDataErrReader_emptyReader)
    * [func TestErrReader(t *testing.T)](#TestErrReader)
    * [func TestStringsReader(t *testing.T)](#TestStringsReader)
    * [func TestTruncateWriter(t *testing.T)](#TestTruncateWriter)


## <a id="var" href="#var">Variables</a>

```
tags: [exported]
```

### <a id="ErrTimeout" href="#ErrTimeout">var ErrTimeout</a>

```
searchKey: iotest.ErrTimeout
tags: [exported]
```

```Go
var ErrTimeout = errors.New("timeout")
```

ErrTimeout is a fake timeout error. 

### <a id="truncateWriterTests" href="#truncateWriterTests">var truncateWriterTests</a>

```
searchKey: iotest.truncateWriterTests
```

```Go
var truncateWriterTests = ...
```

## <a id="type" href="#type">Types</a>

```
tags: [exported]
```

### <a id="writeLogger" href="#writeLogger">type writeLogger struct</a>

```
searchKey: iotest.writeLogger
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
```

```Go
func (l *writeLogger) Write(p []byte) (n int, err error)
```

### <a id="readLogger" href="#readLogger">type readLogger struct</a>

```
searchKey: iotest.readLogger
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
```

```Go
func (l *readLogger) Read(p []byte) (n int, err error)
```

### <a id="oneByteReader" href="#oneByteReader">type oneByteReader struct</a>

```
searchKey: iotest.oneByteReader
```

```Go
type oneByteReader struct {
	r io.Reader
}
```

#### <a id="oneByteReader.Read" href="#oneByteReader.Read">func (r *oneByteReader) Read(p []byte) (int, error)</a>

```
searchKey: iotest.oneByteReader.Read
```

```Go
func (r *oneByteReader) Read(p []byte) (int, error)
```

### <a id="halfReader" href="#halfReader">type halfReader struct</a>

```
searchKey: iotest.halfReader
```

```Go
type halfReader struct {
	r io.Reader
}
```

#### <a id="halfReader.Read" href="#halfReader.Read">func (r *halfReader) Read(p []byte) (int, error)</a>

```
searchKey: iotest.halfReader.Read
```

```Go
func (r *halfReader) Read(p []byte) (int, error)
```

### <a id="dataErrReader" href="#dataErrReader">type dataErrReader struct</a>

```
searchKey: iotest.dataErrReader
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
```

```Go
func (r *dataErrReader) Read(p []byte) (n int, err error)
```

### <a id="timeoutReader" href="#timeoutReader">type timeoutReader struct</a>

```
searchKey: iotest.timeoutReader
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
```

```Go
func (r *timeoutReader) Read(p []byte) (int, error)
```

### <a id="errReader" href="#errReader">type errReader struct</a>

```
searchKey: iotest.errReader
```

```Go
type errReader struct {
	err error
}
```

#### <a id="errReader.Read" href="#errReader.Read">func (r *errReader) Read(p []byte) (int, error)</a>

```
searchKey: iotest.errReader.Read
```

```Go
func (r *errReader) Read(p []byte) (int, error)
```

### <a id="smallByteReader" href="#smallByteReader">type smallByteReader struct</a>

```
searchKey: iotest.smallByteReader
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
```

```Go
func (r *smallByteReader) Read(p []byte) (int, error)
```

### <a id="truncateWriter" href="#truncateWriter">type truncateWriter struct</a>

```
searchKey: iotest.truncateWriter
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
```

```Go
func (t *truncateWriter) Write(p []byte) (n int, err error)
```

### <a id="errWriter" href="#errWriter">type errWriter struct</a>

```
searchKey: iotest.errWriter
```

```Go
type errWriter struct {
	err error
}
```

#### <a id="errWriter.Write" href="#errWriter.Write">func (w errWriter) Write([]byte) (int, error)</a>

```
searchKey: iotest.errWriter.Write
```

```Go
func (w errWriter) Write([]byte) (int, error)
```

## <a id="func" href="#func">Functions</a>

```
tags: [exported]
```

### <a id="NewWriteLogger" href="#NewWriteLogger">func NewWriteLogger(prefix string, w io.Writer) io.Writer</a>

```
searchKey: iotest.NewWriteLogger
tags: [exported]
```

```Go
func NewWriteLogger(prefix string, w io.Writer) io.Writer
```

NewWriteLogger returns a writer that behaves like w except that it logs (using log.Printf) each write to standard error, printing the prefix and the hexadecimal data written. 

### <a id="NewReadLogger" href="#NewReadLogger">func NewReadLogger(prefix string, r io.Reader) io.Reader</a>

```
searchKey: iotest.NewReadLogger
tags: [exported]
```

```Go
func NewReadLogger(prefix string, r io.Reader) io.Reader
```

NewReadLogger returns a reader that behaves like r except that it logs (using log.Printf) each read to standard error, printing the prefix and the hexadecimal data read. 

### <a id="OneByteReader" href="#OneByteReader">func OneByteReader(r io.Reader) io.Reader</a>

```
searchKey: iotest.OneByteReader
tags: [exported]
```

```Go
func OneByteReader(r io.Reader) io.Reader
```

OneByteReader returns a Reader that implements each non-empty Read by reading one byte from r. 

### <a id="HalfReader" href="#HalfReader">func HalfReader(r io.Reader) io.Reader</a>

```
searchKey: iotest.HalfReader
tags: [exported]
```

```Go
func HalfReader(r io.Reader) io.Reader
```

HalfReader returns a Reader that implements Read by reading half as many requested bytes from r. 

### <a id="DataErrReader" href="#DataErrReader">func DataErrReader(r io.Reader) io.Reader</a>

```
searchKey: iotest.DataErrReader
tags: [exported]
```

```Go
func DataErrReader(r io.Reader) io.Reader
```

DataErrReader changes the way errors are handled by a Reader. Normally, a Reader returns an error (typically EOF) from the first Read call after the last piece of data is read. DataErrReader wraps a Reader and changes its behavior so the final error is returned along with the final data, instead of in the first call after the final data. 

### <a id="TimeoutReader" href="#TimeoutReader">func TimeoutReader(r io.Reader) io.Reader</a>

```
searchKey: iotest.TimeoutReader
tags: [exported]
```

```Go
func TimeoutReader(r io.Reader) io.Reader
```

TimeoutReader returns ErrTimeout on the second read with no data. Subsequent calls to read succeed. 

### <a id="ErrReader" href="#ErrReader">func ErrReader(err error) io.Reader</a>

```
searchKey: iotest.ErrReader
tags: [exported]
```

```Go
func ErrReader(err error) io.Reader
```

ErrReader returns an io.Reader that returns 0, err from all Read calls. 

### <a id="TestReader" href="#TestReader">func TestReader(r io.Reader, content []byte) error</a>

```
searchKey: iotest.TestReader
tags: [exported]
```

```Go
func TestReader(r io.Reader, content []byte) error
```

TestReader tests that reading from r returns the expected file content. It does reads of different sizes, until EOF. If r implements io.ReaderAt or io.Seeker, TestReader also checks that those operations behave as they should. 

If TestReader finds any misbehaviors, it returns an error reporting them. The error text may span multiple lines. 

### <a id="TruncateWriter" href="#TruncateWriter">func TruncateWriter(w io.Writer, n int64) io.Writer</a>

```
searchKey: iotest.TruncateWriter
tags: [exported]
```

```Go
func TruncateWriter(w io.Writer, n int64) io.Writer
```

TruncateWriter returns a Writer that writes to w but stops silently after n bytes. 

### <a id="TestWriteLogger" href="#TestWriteLogger">func TestWriteLogger(t *testing.T)</a>

```
searchKey: iotest.TestWriteLogger
```

```Go
func TestWriteLogger(t *testing.T)
```

### <a id="TestWriteLogger_errorOnWrite" href="#TestWriteLogger_errorOnWrite">func TestWriteLogger_errorOnWrite(t *testing.T)</a>

```
searchKey: iotest.TestWriteLogger_errorOnWrite
```

```Go
func TestWriteLogger_errorOnWrite(t *testing.T)
```

### <a id="TestReadLogger" href="#TestReadLogger">func TestReadLogger(t *testing.T)</a>

```
searchKey: iotest.TestReadLogger
```

```Go
func TestReadLogger(t *testing.T)
```

### <a id="TestReadLogger_errorOnRead" href="#TestReadLogger_errorOnRead">func TestReadLogger_errorOnRead(t *testing.T)</a>

```
searchKey: iotest.TestReadLogger_errorOnRead
```

```Go
func TestReadLogger_errorOnRead(t *testing.T)
```

### <a id="TestOneByteReader_nonEmptyReader" href="#TestOneByteReader_nonEmptyReader">func TestOneByteReader_nonEmptyReader(t *testing.T)</a>

```
searchKey: iotest.TestOneByteReader_nonEmptyReader
```

```Go
func TestOneByteReader_nonEmptyReader(t *testing.T)
```

### <a id="TestOneByteReader_emptyReader" href="#TestOneByteReader_emptyReader">func TestOneByteReader_emptyReader(t *testing.T)</a>

```
searchKey: iotest.TestOneByteReader_emptyReader
```

```Go
func TestOneByteReader_emptyReader(t *testing.T)
```

### <a id="TestHalfReader_nonEmptyReader" href="#TestHalfReader_nonEmptyReader">func TestHalfReader_nonEmptyReader(t *testing.T)</a>

```
searchKey: iotest.TestHalfReader_nonEmptyReader
```

```Go
func TestHalfReader_nonEmptyReader(t *testing.T)
```

### <a id="TestHalfReader_emptyReader" href="#TestHalfReader_emptyReader">func TestHalfReader_emptyReader(t *testing.T)</a>

```
searchKey: iotest.TestHalfReader_emptyReader
```

```Go
func TestHalfReader_emptyReader(t *testing.T)
```

### <a id="TestTimeOutReader_nonEmptyReader" href="#TestTimeOutReader_nonEmptyReader">func TestTimeOutReader_nonEmptyReader(t *testing.T)</a>

```
searchKey: iotest.TestTimeOutReader_nonEmptyReader
```

```Go
func TestTimeOutReader_nonEmptyReader(t *testing.T)
```

### <a id="TestTimeOutReader_emptyReader" href="#TestTimeOutReader_emptyReader">func TestTimeOutReader_emptyReader(t *testing.T)</a>

```
searchKey: iotest.TestTimeOutReader_emptyReader
```

```Go
func TestTimeOutReader_emptyReader(t *testing.T)
```

### <a id="TestDataErrReader_nonEmptyReader" href="#TestDataErrReader_nonEmptyReader">func TestDataErrReader_nonEmptyReader(t *testing.T)</a>

```
searchKey: iotest.TestDataErrReader_nonEmptyReader
```

```Go
func TestDataErrReader_nonEmptyReader(t *testing.T)
```

### <a id="TestDataErrReader_emptyReader" href="#TestDataErrReader_emptyReader">func TestDataErrReader_emptyReader(t *testing.T)</a>

```
searchKey: iotest.TestDataErrReader_emptyReader
```

```Go
func TestDataErrReader_emptyReader(t *testing.T)
```

### <a id="TestErrReader" href="#TestErrReader">func TestErrReader(t *testing.T)</a>

```
searchKey: iotest.TestErrReader
```

```Go
func TestErrReader(t *testing.T)
```

### <a id="TestStringsReader" href="#TestStringsReader">func TestStringsReader(t *testing.T)</a>

```
searchKey: iotest.TestStringsReader
```

```Go
func TestStringsReader(t *testing.T)
```

### <a id="TestTruncateWriter" href="#TestTruncateWriter">func TestTruncateWriter(t *testing.T)</a>

```
searchKey: iotest.TestTruncateWriter
```

```Go
func TestTruncateWriter(t *testing.T)
```

