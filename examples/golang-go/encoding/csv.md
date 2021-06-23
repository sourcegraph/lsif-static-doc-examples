# Package csv

Package csv reads and writes comma-separated values (CSV) files. There are many kinds of CSV files; this package supports the format described in RFC 4180. 

A csv file contains zero or more records of one or more fields per record. Each record is separated by the newline character. The final record may optionally be followed by a newline character. 

```
field1,field2,field3

```
White space is considered part of a field. 

Carriage returns before newline characters are silently removed. 

Blank lines are ignored. A line with only whitespace characters (excluding the ending newline character) is not considered a blank line. 

Fields which start and stop with the quote character " are called quoted-fields. The beginning and ending quote are not part of the field. 

The source: 

```
normal string,"quoted-field"

```
results in the fields 

```
{`normal string`, `quoted-field`}

```
Within a quoted-field a quote character followed by a second quote character is considered a single quote. 

```
"the ""word"" is true","a ""quoted-field"""

```
results in 

```
{`the "word" is true`, `a "quoted-field"`}

```
Newlines and commas may be included in a quoted-field 

```
"Multi-line
field","comma is ,"

```
results in 

```
{`Multi-line
field`, `comma is ,`}

```
## Index

* [Constants](#const)
    * [const benchmarkCSVData](#benchmarkCSVData)
* [Variables](#var)
    * [var ErrTrailingComma](#ErrTrailingComma)
    * [var ErrBareQuote](#ErrBareQuote)
    * [var ErrQuote](#ErrQuote)
    * [var ErrFieldCount](#ErrFieldCount)
    * [var errInvalidDelim](#errInvalidDelim)
    * [var readTests](#readTests)
    * [var writeTests](#writeTests)
    * [var benchmarkWriteData](#benchmarkWriteData)
* [Types](#type)
    * [type ParseError struct](#ParseError)
        * [func (e *ParseError) Error() string](#ParseError.Error)
        * [func (e *ParseError) Unwrap() error](#ParseError.Unwrap)
    * [type Reader struct](#Reader)
        * [func NewReader(r io.Reader) *Reader](#NewReader)
        * [func (r *Reader) Read() (record []string, err error)](#Reader.Read)
        * [func (r *Reader) FieldPos(field int) (line, column int)](#Reader.FieldPos)
        * [func (r *Reader) ReadAll() (records [][]string, err error)](#Reader.ReadAll)
        * [func (r *Reader) readLine() ([]byte, error)](#Reader.readLine)
        * [func (r *Reader) readRecord(dst []string) ([]string, error)](#Reader.readRecord)
    * [type position struct](#position)
    * [type Writer struct](#Writer)
        * [func NewWriter(w io.Writer) *Writer](#NewWriter)
        * [func (w *Writer) Write(record []string) error](#Writer.Write)
        * [func (w *Writer) Flush()](#Writer.Flush)
        * [func (w *Writer) Error() error](#Writer.Error)
        * [func (w *Writer) WriteAll(records [][]string) error](#Writer.WriteAll)
        * [func (w *Writer) fieldNeedsQuotes(field string) bool](#Writer.fieldNeedsQuotes)
    * [type readTest struct](#readTest)
    * [type nTimes struct](#nTimes)
        * [func (r *nTimes) Read(p []byte) (n int, err error)](#nTimes.Read)
    * [type errorWriter struct{}](#errorWriter)
        * [func (e errorWriter) Write(b []byte) (int, error)](#errorWriter.Write)
* [Functions](#func)
    * [func validDelim(r rune) bool](#validDelim)
    * [func lengthNL(b []byte) int](#lengthNL)
    * [func nextRune(b []byte) rune](#nextRune)
    * [func TestRead(t *testing.T)](#TestRead)
    * [func firstError(errs []error, positions [][][2]int, errPositions map[int][2]int) error](#firstError)
    * [func errorWithPosition(err error, recNum int, positions [][][2]int, errPositions map[int][2]int) error](#errorWithPosition)
    * [func makePositions(text string) ([][][2]int, map[int][2]int, string)](#makePositions)
    * [func benchmarkRead(b *testing.B, initReader func(*Reader), rows string)](#benchmarkRead)
    * [func BenchmarkRead(b *testing.B)](#BenchmarkRead)
    * [func BenchmarkReadWithFieldsPerRecord(b *testing.B)](#BenchmarkReadWithFieldsPerRecord)
    * [func BenchmarkReadWithoutFieldsPerRecord(b *testing.B)](#BenchmarkReadWithoutFieldsPerRecord)
    * [func BenchmarkReadLargeFields(b *testing.B)](#BenchmarkReadLargeFields)
    * [func BenchmarkReadReuseRecord(b *testing.B)](#BenchmarkReadReuseRecord)
    * [func BenchmarkReadReuseRecordWithFieldsPerRecord(b *testing.B)](#BenchmarkReadReuseRecordWithFieldsPerRecord)
    * [func BenchmarkReadReuseRecordWithoutFieldsPerRecord(b *testing.B)](#BenchmarkReadReuseRecordWithoutFieldsPerRecord)
    * [func BenchmarkReadReuseRecordLargeFields(b *testing.B)](#BenchmarkReadReuseRecordLargeFields)
    * [func TestWrite(t *testing.T)](#TestWrite)
    * [func TestError(t *testing.T)](#TestError)
    * [func BenchmarkWrite(b *testing.B)](#BenchmarkWrite)


## <a id="const" href="#const">Constants</a>

### <a id="benchmarkCSVData" href="#benchmarkCSVData">const benchmarkCSVData</a>

```
searchKey: csv.benchmarkCSVData
tags: [private]
```

```Go
const benchmarkCSVData = ...
```

## <a id="var" href="#var">Variables</a>

### <a id="ErrTrailingComma" href="#ErrTrailingComma">var ErrTrailingComma</a>

```
searchKey: csv.ErrTrailingComma
```

```Go
var ErrTrailingComma = errors.New("extra delimiter at end of line") // Deprecated: No longer used.

```

These are the errors that can be returned in ParseError.Err. 

### <a id="ErrBareQuote" href="#ErrBareQuote">var ErrBareQuote</a>

```
searchKey: csv.ErrBareQuote
```

```Go
var ErrBareQuote = errors.New("bare \" in non-quoted-field")
```

These are the errors that can be returned in ParseError.Err. 

### <a id="ErrQuote" href="#ErrQuote">var ErrQuote</a>

```
searchKey: csv.ErrQuote
```

```Go
var ErrQuote = errors.New("extraneous or missing \" in quoted-field")
```

These are the errors that can be returned in ParseError.Err. 

### <a id="ErrFieldCount" href="#ErrFieldCount">var ErrFieldCount</a>

```
searchKey: csv.ErrFieldCount
```

```Go
var ErrFieldCount = errors.New("wrong number of fields")
```

These are the errors that can be returned in ParseError.Err. 

### <a id="errInvalidDelim" href="#errInvalidDelim">var errInvalidDelim</a>

```
searchKey: csv.errInvalidDelim
tags: [private]
```

```Go
var errInvalidDelim = errors.New("csv: invalid field or comment delimiter")
```

### <a id="readTests" href="#readTests">var readTests</a>

```
searchKey: csv.readTests
tags: [private]
```

```Go
var readTests = ...
```

### <a id="writeTests" href="#writeTests">var writeTests</a>

```
searchKey: csv.writeTests
tags: [private]
```

```Go
var writeTests = ...
```

### <a id="benchmarkWriteData" href="#benchmarkWriteData">var benchmarkWriteData</a>

```
searchKey: csv.benchmarkWriteData
tags: [private]
```

```Go
var benchmarkWriteData = ...
```

## <a id="type" href="#type">Types</a>

### <a id="ParseError" href="#ParseError">type ParseError struct</a>

```
searchKey: csv.ParseError
```

```Go
type ParseError struct {
	StartLine int   // Line where the record starts
	Line      int   // Line where the error occurred
	Column    int   // Column (1-based byte index) where the error occurred
	Err       error // The actual error
}
```

A ParseError is returned for parsing errors. Line numbers are 1-indexed and columns are 0-indexed. 

#### <a id="ParseError.Error" href="#ParseError.Error">func (e *ParseError) Error() string</a>

```
searchKey: csv.ParseError.Error
```

```Go
func (e *ParseError) Error() string
```

#### <a id="ParseError.Unwrap" href="#ParseError.Unwrap">func (e *ParseError) Unwrap() error</a>

```
searchKey: csv.ParseError.Unwrap
```

```Go
func (e *ParseError) Unwrap() error
```

### <a id="Reader" href="#Reader">type Reader struct</a>

```
searchKey: csv.Reader
```

```Go
type Reader struct {
	// Comma is the field delimiter.
	// It is set to comma (',') by NewReader.
	// Comma must be a valid rune and must not be \r, \n,
	// or the Unicode replacement character (0xFFFD).
	Comma rune

	// Comment, if not 0, is the comment character. Lines beginning with the
	// Comment character without preceding whitespace are ignored.
	// With leading whitespace the Comment character becomes part of the
	// field, even if TrimLeadingSpace is true.
	// Comment must be a valid rune and must not be \r, \n,
	// or the Unicode replacement character (0xFFFD).
	// It must also not be equal to Comma.
	Comment rune

	// FieldsPerRecord is the number of expected fields per record.
	// If FieldsPerRecord is positive, Read requires each record to
	// have the given number of fields. If FieldsPerRecord is 0, Read sets it to
	// the number of fields in the first record, so that future records must
	// have the same field count. If FieldsPerRecord is negative, no check is
	// made and records may have a variable number of fields.
	FieldsPerRecord int

	// If LazyQuotes is true, a quote may appear in an unquoted field and a
	// non-doubled quote may appear in a quoted field.
	LazyQuotes bool

	// If TrimLeadingSpace is true, leading white space in a field is ignored.
	// This is done even if the field delimiter, Comma, is white space.
	TrimLeadingSpace bool

	// ReuseRecord controls whether calls to Read may return a slice sharing
	// the backing array of the previous call's returned slice for performance.
	// By default, each call to Read returns newly allocated memory owned by the caller.
	ReuseRecord bool

	TrailingComma bool // Deprecated: No longer used.

	r *bufio.Reader

	// numLine is the current line being read in the CSV file.
	numLine int

	// rawBuffer is a line buffer only used by the readLine method.
	rawBuffer []byte

	// recordBuffer holds the unescaped fields, one after another.
	// The fields can be accessed by using the indexes in fieldIndexes.
	// E.g., For the row `a,"b","c""d",e`, recordBuffer will contain `abc"de`
	// and fieldIndexes will contain the indexes [1, 2, 5, 6].
	recordBuffer []byte

	// fieldIndexes is an index of fields inside recordBuffer.
	// The i'th field ends at offset fieldIndexes[i] in recordBuffer.
	fieldIndexes []int

	// fieldPositions is an index of field positions for the
	// last record returned by Read.
	fieldPositions []position

	// lastRecord is a record cache and only used when ReuseRecord == true.
	lastRecord []string
}
```

A Reader reads records from a CSV-encoded file. 

As returned by NewReader, a Reader expects input conforming to RFC 4180. The exported fields can be changed to customize the details before the first call to Read or ReadAll. 

The Reader converts all \r\n sequences in its input to plain \n, including in multiline field values, so that the returned data does not depend on which line-ending convention an input file uses. 

#### <a id="NewReader" href="#NewReader">func NewReader(r io.Reader) *Reader</a>

```
searchKey: csv.NewReader
```

```Go
func NewReader(r io.Reader) *Reader
```

NewReader returns a new Reader that reads from r. 

#### <a id="Reader.Read" href="#Reader.Read">func (r *Reader) Read() (record []string, err error)</a>

```
searchKey: csv.Reader.Read
```

```Go
func (r *Reader) Read() (record []string, err error)
```

Read reads one record (a slice of fields) from r. If the record has an unexpected number of fields, Read returns the record along with the error ErrFieldCount. Except for that case, Read always returns either a non-nil record or a non-nil error, but not both. If there is no data left to be read, Read returns nil, io.EOF. If ReuseRecord is true, the returned slice may be shared between multiple calls to Read. 

#### <a id="Reader.FieldPos" href="#Reader.FieldPos">func (r *Reader) FieldPos(field int) (line, column int)</a>

```
searchKey: csv.Reader.FieldPos
```

```Go
func (r *Reader) FieldPos(field int) (line, column int)
```

FieldPos returns the line and column corresponding to the start of the field with the given index in the slice most recently returned by Read. Numbering of lines and columns starts at 1; columns are counted in bytes, not runes. 

If this is called with an out-of-bounds index, it panics. 

#### <a id="Reader.ReadAll" href="#Reader.ReadAll">func (r *Reader) ReadAll() (records [][]string, err error)</a>

```
searchKey: csv.Reader.ReadAll
```

```Go
func (r *Reader) ReadAll() (records [][]string, err error)
```

ReadAll reads all the remaining records from r. Each record is a slice of fields. A successful call returns err == nil, not err == io.EOF. Because ReadAll is defined to read until EOF, it does not treat end of file as an error to be reported. 

#### <a id="Reader.readLine" href="#Reader.readLine">func (r *Reader) readLine() ([]byte, error)</a>

```
searchKey: csv.Reader.readLine
tags: [private]
```

```Go
func (r *Reader) readLine() ([]byte, error)
```

readLine reads the next line (with the trailing endline). If EOF is hit without a trailing endline, it will be omitted. If some bytes were read, then the error is never io.EOF. The result is only valid until the next call to readLine. 

#### <a id="Reader.readRecord" href="#Reader.readRecord">func (r *Reader) readRecord(dst []string) ([]string, error)</a>

```
searchKey: csv.Reader.readRecord
tags: [private]
```

```Go
func (r *Reader) readRecord(dst []string) ([]string, error)
```

### <a id="position" href="#position">type position struct</a>

```
searchKey: csv.position
tags: [private]
```

```Go
type position struct {
	line, col int
}
```

pos holds the position of a field in the current line. 

### <a id="Writer" href="#Writer">type Writer struct</a>

```
searchKey: csv.Writer
```

```Go
type Writer struct {
	Comma   rune // Field delimiter (set to ',' by NewWriter)
	UseCRLF bool // True to use \r\n as the line terminator
	w       *bufio.Writer
}
```

A Writer writes records using CSV encoding. 

As returned by NewWriter, a Writer writes records terminated by a newline and uses ',' as the field delimiter. The exported fields can be changed to customize the details before the first call to Write or WriteAll. 

Comma is the field delimiter. 

If UseCRLF is true, the Writer ends each output line with \r\n instead of \n. 

The writes of individual records are buffered. After all data has been written, the client should call the Flush method to guarantee all data has been forwarded to the underlying io.Writer.  Any errors that occurred should be checked by calling the Error method. 

#### <a id="NewWriter" href="#NewWriter">func NewWriter(w io.Writer) *Writer</a>

```
searchKey: csv.NewWriter
```

```Go
func NewWriter(w io.Writer) *Writer
```

NewWriter returns a new Writer that writes to w. 

#### <a id="Writer.Write" href="#Writer.Write">func (w *Writer) Write(record []string) error</a>

```
searchKey: csv.Writer.Write
```

```Go
func (w *Writer) Write(record []string) error
```

Write writes a single CSV record to w along with any necessary quoting. A record is a slice of strings with each string being one field. Writes are buffered, so Flush must eventually be called to ensure that the record is written to the underlying io.Writer. 

#### <a id="Writer.Flush" href="#Writer.Flush">func (w *Writer) Flush()</a>

```
searchKey: csv.Writer.Flush
```

```Go
func (w *Writer) Flush()
```

Flush writes any buffered data to the underlying io.Writer. To check if an error occurred during the Flush, call Error. 

#### <a id="Writer.Error" href="#Writer.Error">func (w *Writer) Error() error</a>

```
searchKey: csv.Writer.Error
```

```Go
func (w *Writer) Error() error
```

Error reports any error that has occurred during a previous Write or Flush. 

#### <a id="Writer.WriteAll" href="#Writer.WriteAll">func (w *Writer) WriteAll(records [][]string) error</a>

```
searchKey: csv.Writer.WriteAll
```

```Go
func (w *Writer) WriteAll(records [][]string) error
```

WriteAll writes multiple CSV records to w using Write and then calls Flush, returning any error from the Flush. 

#### <a id="Writer.fieldNeedsQuotes" href="#Writer.fieldNeedsQuotes">func (w *Writer) fieldNeedsQuotes(field string) bool</a>

```
searchKey: csv.Writer.fieldNeedsQuotes
tags: [private]
```

```Go
func (w *Writer) fieldNeedsQuotes(field string) bool
```

fieldNeedsQuotes reports whether our field must be enclosed in quotes. Fields with a Comma, fields with a quote or newline, and fields which start with a space must be enclosed in quotes. We used to quote empty strings, but we do not anymore (as of Go 1.4). The two representations should be equivalent, but Postgres distinguishes quoted vs non-quoted empty string during database imports, and it has an option to force the quoted behavior for non-quoted CSV but it has no option to force the non-quoted behavior for quoted CSV, making CSV with quoted empty strings strictly less useful. Not quoting the empty string also makes this package match the behavior of Microsoft Excel and Google Drive. For Postgres, quote the data terminating string `\.`. 

### <a id="readTest" href="#readTest">type readTest struct</a>

```
searchKey: csv.readTest
tags: [private]
```

```Go
type readTest struct {
	Name      string
	Input     string
	Output    [][]string
	Positions [][][2]int
	Errors    []error

	// These fields are copied into the Reader
	Comma              rune
	Comment            rune
	UseFieldsPerRecord bool // false (default) means FieldsPerRecord is -1
	FieldsPerRecord    int
	LazyQuotes         bool
	TrimLeadingSpace   bool
	ReuseRecord        bool
}
```

### <a id="nTimes" href="#nTimes">type nTimes struct</a>

```
searchKey: csv.nTimes
tags: [private]
```

```Go
type nTimes struct {
	s   string
	n   int
	off int
}
```

nTimes is an io.Reader which yields the string s n times. 

#### <a id="nTimes.Read" href="#nTimes.Read">func (r *nTimes) Read(p []byte) (n int, err error)</a>

```
searchKey: csv.nTimes.Read
tags: [private]
```

```Go
func (r *nTimes) Read(p []byte) (n int, err error)
```

### <a id="errorWriter" href="#errorWriter">type errorWriter struct{}</a>

```
searchKey: csv.errorWriter
tags: [private]
```

```Go
type errorWriter struct{}
```

#### <a id="errorWriter.Write" href="#errorWriter.Write">func (e errorWriter) Write(b []byte) (int, error)</a>

```
searchKey: csv.errorWriter.Write
tags: [private]
```

```Go
func (e errorWriter) Write(b []byte) (int, error)
```

## <a id="func" href="#func">Functions</a>

### <a id="validDelim" href="#validDelim">func validDelim(r rune) bool</a>

```
searchKey: csv.validDelim
tags: [private]
```

```Go
func validDelim(r rune) bool
```

### <a id="lengthNL" href="#lengthNL">func lengthNL(b []byte) int</a>

```
searchKey: csv.lengthNL
tags: [private]
```

```Go
func lengthNL(b []byte) int
```

lengthNL reports the number of bytes for the trailing \n. 

### <a id="nextRune" href="#nextRune">func nextRune(b []byte) rune</a>

```
searchKey: csv.nextRune
tags: [private]
```

```Go
func nextRune(b []byte) rune
```

nextRune returns the next rune in b or utf8.RuneError. 

### <a id="TestRead" href="#TestRead">func TestRead(t *testing.T)</a>

```
searchKey: csv.TestRead
tags: [private]
```

```Go
func TestRead(t *testing.T)
```

### <a id="firstError" href="#firstError">func firstError(errs []error, positions [][][2]int, errPositions map[int][2]int) error</a>

```
searchKey: csv.firstError
tags: [private]
```

```Go
func firstError(errs []error, positions [][][2]int, errPositions map[int][2]int) error
```

firstError returns the first non-nil error in errs, with the position adjusted according to the error's index inside positions. 

### <a id="errorWithPosition" href="#errorWithPosition">func errorWithPosition(err error, recNum int, positions [][][2]int, errPositions map[int][2]int) error</a>

```
searchKey: csv.errorWithPosition
tags: [private]
```

```Go
func errorWithPosition(err error, recNum int, positions [][][2]int, errPositions map[int][2]int) error
```

### <a id="makePositions" href="#makePositions">func makePositions(text string) ([][][2]int, map[int][2]int, string)</a>

```
searchKey: csv.makePositions
tags: [private]
```

```Go
func makePositions(text string) ([][][2]int, map[int][2]int, string)
```

makePositions returns the expected field positions of all the fields in text, the positions of any errors, and the text with the position markers removed. 

The start of each field is marked with a § symbol; CSV lines are separated by ¶ symbols; Error positions are marked with ∑ symbols. 

### <a id="benchmarkRead" href="#benchmarkRead">func benchmarkRead(b *testing.B, initReader func(*Reader), rows string)</a>

```
searchKey: csv.benchmarkRead
tags: [private]
```

```Go
func benchmarkRead(b *testing.B, initReader func(*Reader), rows string)
```

benchmarkRead measures reading the provided CSV rows data. initReader, if non-nil, modifies the Reader before it's used. 

### <a id="BenchmarkRead" href="#BenchmarkRead">func BenchmarkRead(b *testing.B)</a>

```
searchKey: csv.BenchmarkRead
tags: [private]
```

```Go
func BenchmarkRead(b *testing.B)
```

### <a id="BenchmarkReadWithFieldsPerRecord" href="#BenchmarkReadWithFieldsPerRecord">func BenchmarkReadWithFieldsPerRecord(b *testing.B)</a>

```
searchKey: csv.BenchmarkReadWithFieldsPerRecord
tags: [private]
```

```Go
func BenchmarkReadWithFieldsPerRecord(b *testing.B)
```

### <a id="BenchmarkReadWithoutFieldsPerRecord" href="#BenchmarkReadWithoutFieldsPerRecord">func BenchmarkReadWithoutFieldsPerRecord(b *testing.B)</a>

```
searchKey: csv.BenchmarkReadWithoutFieldsPerRecord
tags: [private]
```

```Go
func BenchmarkReadWithoutFieldsPerRecord(b *testing.B)
```

### <a id="BenchmarkReadLargeFields" href="#BenchmarkReadLargeFields">func BenchmarkReadLargeFields(b *testing.B)</a>

```
searchKey: csv.BenchmarkReadLargeFields
tags: [private]
```

```Go
func BenchmarkReadLargeFields(b *testing.B)
```

### <a id="BenchmarkReadReuseRecord" href="#BenchmarkReadReuseRecord">func BenchmarkReadReuseRecord(b *testing.B)</a>

```
searchKey: csv.BenchmarkReadReuseRecord
tags: [private]
```

```Go
func BenchmarkReadReuseRecord(b *testing.B)
```

### <a id="BenchmarkReadReuseRecordWithFieldsPerRecord" href="#BenchmarkReadReuseRecordWithFieldsPerRecord">func BenchmarkReadReuseRecordWithFieldsPerRecord(b *testing.B)</a>

```
searchKey: csv.BenchmarkReadReuseRecordWithFieldsPerRecord
tags: [private]
```

```Go
func BenchmarkReadReuseRecordWithFieldsPerRecord(b *testing.B)
```

### <a id="BenchmarkReadReuseRecordWithoutFieldsPerRecord" href="#BenchmarkReadReuseRecordWithoutFieldsPerRecord">func BenchmarkReadReuseRecordWithoutFieldsPerRecord(b *testing.B)</a>

```
searchKey: csv.BenchmarkReadReuseRecordWithoutFieldsPerRecord
tags: [private]
```

```Go
func BenchmarkReadReuseRecordWithoutFieldsPerRecord(b *testing.B)
```

### <a id="BenchmarkReadReuseRecordLargeFields" href="#BenchmarkReadReuseRecordLargeFields">func BenchmarkReadReuseRecordLargeFields(b *testing.B)</a>

```
searchKey: csv.BenchmarkReadReuseRecordLargeFields
tags: [private]
```

```Go
func BenchmarkReadReuseRecordLargeFields(b *testing.B)
```

### <a id="TestWrite" href="#TestWrite">func TestWrite(t *testing.T)</a>

```
searchKey: csv.TestWrite
tags: [private]
```

```Go
func TestWrite(t *testing.T)
```

### <a id="TestError" href="#TestError">func TestError(t *testing.T)</a>

```
searchKey: csv.TestError
tags: [private]
```

```Go
func TestError(t *testing.T)
```

### <a id="BenchmarkWrite" href="#BenchmarkWrite">func BenchmarkWrite(b *testing.B)</a>

```
searchKey: csv.BenchmarkWrite
tags: [private]
```

```Go
func BenchmarkWrite(b *testing.B)
```

