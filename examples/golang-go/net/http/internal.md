# Package internal

Package internal contains HTTP internals shared by net/http and net/http/httputil. 

## Index

* Subpages
  * [net/http/internal/ascii](internal/ascii.md)
  * [net/http/internal/testcert](internal/testcert.md)
* [Constants](#const)
    * [const maxLineLength](#maxLineLength)
* [Variables](#var)
    * [var ErrLineTooLong](#ErrLineTooLong)
* [Types](#type)
    * [type chunkedReader struct](#chunkedReader)
        * [func (cr *chunkedReader) beginChunk()](#chunkedReader.beginChunk)
        * [func (cr *chunkedReader) chunkHeaderAvailable() bool](#chunkedReader.chunkHeaderAvailable)
        * [func (cr *chunkedReader) Read(b []uint8) (n int, err error)](#chunkedReader.Read)
    * [type chunkedWriter struct](#chunkedWriter)
        * [func (cw *chunkedWriter) Write(data []byte) (n int, err error)](#chunkedWriter.Write)
        * [func (cw *chunkedWriter) Close() error](#chunkedWriter.Close)
    * [type FlushAfterChunkWriter struct](#FlushAfterChunkWriter)
* [Functions](#func)
    * [func NewChunkedReader(r io.Reader) io.Reader](#NewChunkedReader)
    * [func readChunkLine(b *bufio.Reader) ([]byte, error)](#readChunkLine)
    * [func trimTrailingWhitespace(b []byte) []byte](#trimTrailingWhitespace)
    * [func isASCIISpace(b byte) bool](#isASCIISpace)
    * [func removeChunkExtension(p []byte) ([]byte, error)](#removeChunkExtension)
    * [func NewChunkedWriter(w io.Writer) io.WriteCloser](#NewChunkedWriter)
    * [func parseHexUint(v []byte) (n uint64, err error)](#parseHexUint)
    * [func TestChunk(t *testing.T)](#TestChunk)
    * [func TestChunkReadMultiple(t *testing.T)](#TestChunkReadMultiple)
    * [func TestChunkReaderAllocs(t *testing.T)](#TestChunkReaderAllocs)
    * [func TestParseHexUint(t *testing.T)](#TestParseHexUint)
    * [func TestChunkReadingIgnoresExtensions(t *testing.T)](#TestChunkReadingIgnoresExtensions)
    * [func TestChunkReadPartial(t *testing.T)](#TestChunkReadPartial)


## <a id="const" href="#const">Constants</a>

```
tags: [exported]
```

### <a id="maxLineLength" href="#maxLineLength">const maxLineLength</a>

```
searchKey: internal.maxLineLength
```

```Go
const maxLineLength = 4096 // assumed <= bufio.defaultBufSize

```

## <a id="var" href="#var">Variables</a>

```
tags: [exported]
```

### <a id="ErrLineTooLong" href="#ErrLineTooLong">var ErrLineTooLong</a>

```
searchKey: internal.ErrLineTooLong
tags: [exported]
```

```Go
var ErrLineTooLong = errors.New("header line too long")
```

## <a id="type" href="#type">Types</a>

```
tags: [exported]
```

### <a id="chunkedReader" href="#chunkedReader">type chunkedReader struct</a>

```
searchKey: internal.chunkedReader
```

```Go
type chunkedReader struct {
	r        *bufio.Reader
	n        uint64 // unread bytes in chunk
	err      error
	buf      [2]byte
	checkEnd bool // whether need to check for \r\n chunk footer
}
```

#### <a id="chunkedReader.beginChunk" href="#chunkedReader.beginChunk">func (cr *chunkedReader) beginChunk()</a>

```
searchKey: internal.chunkedReader.beginChunk
```

```Go
func (cr *chunkedReader) beginChunk()
```

#### <a id="chunkedReader.chunkHeaderAvailable" href="#chunkedReader.chunkHeaderAvailable">func (cr *chunkedReader) chunkHeaderAvailable() bool</a>

```
searchKey: internal.chunkedReader.chunkHeaderAvailable
```

```Go
func (cr *chunkedReader) chunkHeaderAvailable() bool
```

#### <a id="chunkedReader.Read" href="#chunkedReader.Read">func (cr *chunkedReader) Read(b []uint8) (n int, err error)</a>

```
searchKey: internal.chunkedReader.Read
```

```Go
func (cr *chunkedReader) Read(b []uint8) (n int, err error)
```

### <a id="chunkedWriter" href="#chunkedWriter">type chunkedWriter struct</a>

```
searchKey: internal.chunkedWriter
```

```Go
type chunkedWriter struct {
	Wire io.Writer
}
```

Writing to chunkedWriter translates to writing in HTTP chunked Transfer Encoding wire format to the underlying Wire chunkedWriter. 

#### <a id="chunkedWriter.Write" href="#chunkedWriter.Write">func (cw *chunkedWriter) Write(data []byte) (n int, err error)</a>

```
searchKey: internal.chunkedWriter.Write
```

```Go
func (cw *chunkedWriter) Write(data []byte) (n int, err error)
```

Write the contents of data as one chunk to Wire. NOTE: Note that the corresponding chunk-writing procedure in Conn.Write has a bug since it does not check for success of io.WriteString 

#### <a id="chunkedWriter.Close" href="#chunkedWriter.Close">func (cw *chunkedWriter) Close() error</a>

```
searchKey: internal.chunkedWriter.Close
```

```Go
func (cw *chunkedWriter) Close() error
```

### <a id="FlushAfterChunkWriter" href="#FlushAfterChunkWriter">type FlushAfterChunkWriter struct</a>

```
searchKey: internal.FlushAfterChunkWriter
tags: [exported]
```

```Go
type FlushAfterChunkWriter struct {
	*bufio.Writer
}
```

FlushAfterChunkWriter signals from the caller of NewChunkedWriter that each chunk should be followed by a flush. It is used by the http.Transport code to keep the buffering behavior for headers and trailers, but flush out chunks aggressively in the middle for request bodies which may be generated slowly. See Issue 6574. 

## <a id="func" href="#func">Functions</a>

```
tags: [exported]
```

### <a id="NewChunkedReader" href="#NewChunkedReader">func NewChunkedReader(r io.Reader) io.Reader</a>

```
searchKey: internal.NewChunkedReader
tags: [exported]
```

```Go
func NewChunkedReader(r io.Reader) io.Reader
```

NewChunkedReader returns a new chunkedReader that translates the data read from r out of HTTP "chunked" format before returning it. The chunkedReader returns io.EOF when the final 0-length chunk is read. 

NewChunkedReader is not needed by normal applications. The http package automatically decodes chunking when reading response bodies. 

### <a id="readChunkLine" href="#readChunkLine">func readChunkLine(b *bufio.Reader) ([]byte, error)</a>

```
searchKey: internal.readChunkLine
```

```Go
func readChunkLine(b *bufio.Reader) ([]byte, error)
```

Read a line of bytes (up to \n) from b. Give up if the line exceeds maxLineLength. The returned bytes are owned by the bufio.Reader so they are only valid until the next bufio read. 

### <a id="trimTrailingWhitespace" href="#trimTrailingWhitespace">func trimTrailingWhitespace(b []byte) []byte</a>

```
searchKey: internal.trimTrailingWhitespace
```

```Go
func trimTrailingWhitespace(b []byte) []byte
```

### <a id="isASCIISpace" href="#isASCIISpace">func isASCIISpace(b byte) bool</a>

```
searchKey: internal.isASCIISpace
```

```Go
func isASCIISpace(b byte) bool
```

### <a id="removeChunkExtension" href="#removeChunkExtension">func removeChunkExtension(p []byte) ([]byte, error)</a>

```
searchKey: internal.removeChunkExtension
```

```Go
func removeChunkExtension(p []byte) ([]byte, error)
```

removeChunkExtension removes any chunk-extension from p. For example, 

```
"0" => "0"
"0;token" => "0"
"0;token=val" => "0"
`0;token="quoted string"` => "0"

```
### <a id="NewChunkedWriter" href="#NewChunkedWriter">func NewChunkedWriter(w io.Writer) io.WriteCloser</a>

```
searchKey: internal.NewChunkedWriter
tags: [exported]
```

```Go
func NewChunkedWriter(w io.Writer) io.WriteCloser
```

NewChunkedWriter returns a new chunkedWriter that translates writes into HTTP "chunked" format before writing them to w. Closing the returned chunkedWriter sends the final 0-length chunk that marks the end of the stream but does not send the final CRLF that appears after trailers; trailers and the last CRLF must be written separately. 

NewChunkedWriter is not needed by normal applications. The http package adds chunking automatically if handlers don't set a Content-Length header. Using newChunkedWriter inside a handler would result in double chunking or chunking with a Content-Length length, both of which are wrong. 

### <a id="parseHexUint" href="#parseHexUint">func parseHexUint(v []byte) (n uint64, err error)</a>

```
searchKey: internal.parseHexUint
```

```Go
func parseHexUint(v []byte) (n uint64, err error)
```

### <a id="TestChunk" href="#TestChunk">func TestChunk(t *testing.T)</a>

```
searchKey: internal.TestChunk
```

```Go
func TestChunk(t *testing.T)
```

### <a id="TestChunkReadMultiple" href="#TestChunkReadMultiple">func TestChunkReadMultiple(t *testing.T)</a>

```
searchKey: internal.TestChunkReadMultiple
```

```Go
func TestChunkReadMultiple(t *testing.T)
```

### <a id="TestChunkReaderAllocs" href="#TestChunkReaderAllocs">func TestChunkReaderAllocs(t *testing.T)</a>

```
searchKey: internal.TestChunkReaderAllocs
```

```Go
func TestChunkReaderAllocs(t *testing.T)
```

### <a id="TestParseHexUint" href="#TestParseHexUint">func TestParseHexUint(t *testing.T)</a>

```
searchKey: internal.TestParseHexUint
```

```Go
func TestParseHexUint(t *testing.T)
```

### <a id="TestChunkReadingIgnoresExtensions" href="#TestChunkReadingIgnoresExtensions">func TestChunkReadingIgnoresExtensions(t *testing.T)</a>

```
searchKey: internal.TestChunkReadingIgnoresExtensions
```

```Go
func TestChunkReadingIgnoresExtensions(t *testing.T)
```

### <a id="TestChunkReadPartial" href="#TestChunkReadPartial">func TestChunkReadPartial(t *testing.T)</a>

```
searchKey: internal.TestChunkReadPartial
```

```Go
func TestChunkReadPartial(t *testing.T)
```

Issue 17355: ChunkedReader shouldn't block waiting for more data if it can return something. 

