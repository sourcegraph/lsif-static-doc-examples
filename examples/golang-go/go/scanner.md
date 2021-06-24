# Package scanner

Package scanner implements a scanner for Go source text. It takes a []byte as source which can then be tokenized through repeated calls to the Scan method. 

## Index

* [Constants](#const)
    * [const ScanComments](#ScanComments)
    * [const bom](#bom)
    * [const dontInsertSemis](#dontInsertSemis)
    * [const eof](#eof)
    * [const keyword](#keyword)
    * [const literal](#literal)
    * [const operator](#operator)
    * [const special](#special)
    * [const whitespace](#whitespace)
* [Variables](#var)
    * [var dirUnixSegments](#dirUnixSegments)
    * [var dirWindowsSegments](#dirWindowsSegments)
    * [var dirsegments](#dirsegments)
    * [var errors](#errors)
    * [var fset](#fset)
    * [var invalidSegments](#invalidSegments)
    * [var lines](#lines)
    * [var prefix](#prefix)
    * [var segments](#segments)
    * [var source](#source)
    * [var tokens](#tokens)
* [Types](#type)
    * [type Error struct](#Error)
        * [func (e Error) Error() string](#Error.Error)
    * [type ErrorHandler func(pos go/token.Position, msg string)](#ErrorHandler)
    * [type ErrorList []*scanner.Error](#ErrorList)
        * [func (p *ErrorList) Add(pos token.Position, msg string)](#ErrorList.Add)
        * [func (p ErrorList) Err() error](#ErrorList.Err)
        * [func (p ErrorList) Error() string](#ErrorList.Error)
        * [func (p ErrorList) Len() int](#ErrorList.Len)
        * [func (p ErrorList) Less(i, j int) bool](#ErrorList.Less)
        * [func (p *ErrorList) RemoveMultiples()](#ErrorList.RemoveMultiples)
        * [func (p *ErrorList) Reset()](#ErrorList.Reset)
        * [func (p ErrorList) Sort()](#ErrorList.Sort)
        * [func (p ErrorList) Swap(i, j int)](#ErrorList.Swap)
    * [type Mode uint](#Mode)
    * [type Scanner struct](#Scanner)
        * [func (s *Scanner) Init(file *token.File, src []byte, err ErrorHandler, mode Mode)](#Scanner.Init)
        * [func (s *Scanner) Scan() (pos token.Pos, tok token.Token, lit string)](#Scanner.Scan)
        * [func (s *Scanner) digits(base int, invalid *int) (digsep int)](#Scanner.digits)
        * [func (s *Scanner) error(offs int, msg string)](#Scanner.error)
        * [func (s *Scanner) errorf(offs int, format string, args ...interface{})](#Scanner.errorf)
        * [func (s *Scanner) findLineEnd() bool](#Scanner.findLineEnd)
        * [func (s *Scanner) next()](#Scanner.next)
        * [func (s *Scanner) peek() byte](#Scanner.peek)
        * [func (s *Scanner) scanComment() string](#Scanner.scanComment)
        * [func (s *Scanner) scanEscape(quote rune) bool](#Scanner.scanEscape)
        * [func (s *Scanner) scanIdentifier() string](#Scanner.scanIdentifier)
        * [func (s *Scanner) scanNumber() (token.Token, string)](#Scanner.scanNumber)
        * [func (s *Scanner) scanRawString() string](#Scanner.scanRawString)
        * [func (s *Scanner) scanRune() string](#Scanner.scanRune)
        * [func (s *Scanner) scanString() string](#Scanner.scanString)
        * [func (s *Scanner) skipWhitespace()](#Scanner.skipWhitespace)
        * [func (s *Scanner) switch2(tok0, tok1 token.Token) token.Token](#Scanner.switch2)
        * [func (s *Scanner) switch3(tok0, tok1 token.Token, ch2 rune, tok2 token.Token) token.Token](#Scanner.switch3)
        * [func (s *Scanner) switch4(tok0, tok1 token.Token, ch2 rune, tok2, tok3 token.Token) token.Token](#Scanner.switch4)
        * [func (s *Scanner) updateLineInfo(next, offs int, text []byte)](#Scanner.updateLineInfo)
    * [type elt struct](#elt)
    * [type errorCollector struct](#errorCollector)
    * [type segment struct](#segment)
* [Functions](#func)
    * [func BenchmarkScan(b *testing.B)](#BenchmarkScan)
    * [func BenchmarkScanFiles(b *testing.B)](#BenchmarkScanFiles)
    * [func PrintError(w io.Writer, err error)](#PrintError)
    * [func TestInit(t *testing.T)](#TestInit)
    * [func TestInvalidLineDirectives(t *testing.T)](#TestInvalidLineDirectives)
    * [func TestIssue10213(t *testing.T)](#TestIssue10213)
    * [func TestIssue28112(t *testing.T)](#TestIssue28112)
    * [func TestLineDirectives(t *testing.T)](#TestLineDirectives)
    * [func TestNumbers(t *testing.T)](#TestNumbers)
    * [func TestScan(t *testing.T)](#TestScan)
    * [func TestScanErrors(t *testing.T)](#TestScanErrors)
    * [func TestSemis(t *testing.T)](#TestSemis)
    * [func TestStdErrorHander(t *testing.T)](#TestStdErrorHander)
    * [func TestStripCR(t *testing.T)](#TestStripCR)
    * [func checkError(t *testing.T, src string, tok token.Token, pos int, lit, err string)](#checkError)
    * [func checkPos(t *testing.T, lit string, p token.Pos, expected token.Position)](#checkPos)
    * [func checkSemi(t *testing.T, line string, mode Mode)](#checkSemi)
    * [func digitVal(ch rune) int](#digitVal)
    * [func invalidSep(x string) int](#invalidSep)
    * [func isDecimal(ch rune) bool](#isDecimal)
    * [func isDigit(ch rune) bool](#isDigit)
    * [func isHex(ch rune) bool](#isHex)
    * [func isLetter(ch rune) bool](#isLetter)
    * [func litname(prefix rune) string](#litname)
    * [func lower(ch rune) rune](#lower)
    * [func newlineCount(s string) int](#newlineCount)
    * [func stripCR(b []byte, comment bool) []byte](#stripCR)
    * [func testSegments(t *testing.T, segments []segment, filename string)](#testSegments)
    * [func tokenclass(tok token.Token) int](#tokenclass)
    * [func trailingDigits(text []byte) (int, int, bool)](#trailingDigits)


## <a id="const" href="#const">Constants</a>

```
tags: [package]
```

### <a id="ScanComments" href="#ScanComments">const ScanComments</a>

```
searchKey: scanner.ScanComments
tags: [constant number]
```

```Go
const ScanComments Mode = 1 << iota // return comments as COMMENT tokens

```

### <a id="bom" href="#bom">const bom</a>

```
searchKey: scanner.bom
tags: [constant number private]
```

```Go
const bom = 0xFEFF // byte order mark, only permitted as very first character

```

### <a id="dontInsertSemis" href="#dontInsertSemis">const dontInsertSemis</a>

```
searchKey: scanner.dontInsertSemis
tags: [constant number private]
```

```Go
const dontInsertSemis // do not automatically insert semicolons - for testing only

```

### <a id="eof" href="#eof">const eof</a>

```
searchKey: scanner.eof
tags: [constant number private]
```

```Go
const eof = -1 // end of file

```

### <a id="keyword" href="#keyword">const keyword</a>

```
searchKey: scanner.keyword
tags: [constant number private]
```

```Go
const keyword
```

### <a id="literal" href="#literal">const literal</a>

```
searchKey: scanner.literal
tags: [constant number private]
```

```Go
const literal
```

### <a id="operator" href="#operator">const operator</a>

```
searchKey: scanner.operator
tags: [constant number private]
```

```Go
const operator
```

### <a id="special" href="#special">const special</a>

```
searchKey: scanner.special
tags: [constant number private]
```

```Go
const special = iota
```

### <a id="whitespace" href="#whitespace">const whitespace</a>

```
searchKey: scanner.whitespace
tags: [constant string private]
```

```Go
const whitespace = "  \t  \n\n\n" // to separate tokens

```

## <a id="var" href="#var">Variables</a>

```
tags: [package]
```

### <a id="dirUnixSegments" href="#dirUnixSegments">var dirUnixSegments</a>

```
searchKey: scanner.dirUnixSegments
tags: [variable array struct private]
```

```Go
var dirUnixSegments = []segment{
	{"\n//line /bar:42\n  line42", "/bar", 42, 0},
}
```

### <a id="dirWindowsSegments" href="#dirWindowsSegments">var dirWindowsSegments</a>

```
searchKey: scanner.dirWindowsSegments
tags: [variable array struct private]
```

```Go
var dirWindowsSegments = []segment{
	{"\n//line c:\\bar:42\n  line42", "c:\\bar", 42, 0},
}
```

### <a id="dirsegments" href="#dirsegments">var dirsegments</a>

```
searchKey: scanner.dirsegments
tags: [variable array struct private]
```

```Go
var dirsegments = ...
```

### <a id="errors" href="#errors">var errors</a>

```
searchKey: scanner.errors
tags: [variable array struct private]
```

```Go
var errors = ...
```

### <a id="fset" href="#fset">var fset</a>

```
searchKey: scanner.fset
tags: [variable struct private]
```

```Go
var fset = token.NewFileSet()
```

### <a id="invalidSegments" href="#invalidSegments">var invalidSegments</a>

```
searchKey: scanner.invalidSegments
tags: [variable array struct private]
```

```Go
var invalidSegments = ...
```

The filename is used for the error message in these test cases. The first line directive is valid and used to control the expected error line. 

### <a id="lines" href="#lines">var lines</a>

```
searchKey: scanner.lines
tags: [variable array string private]
```

```Go
var lines = ...
```

### <a id="prefix" href="#prefix">var prefix</a>

```
searchKey: scanner.prefix
tags: [variable array number private]
```

```Go
var prefix = []byte("line ")
```

### <a id="segments" href="#segments">var segments</a>

```
searchKey: scanner.segments
tags: [variable array struct private]
```

```Go
var segments = ...
```

### <a id="source" href="#source">var source</a>

```
searchKey: scanner.source
tags: [variable array number private]
```

```Go
var source = ...
```

### <a id="tokens" href="#tokens">var tokens</a>

```
searchKey: scanner.tokens
tags: [variable array struct private]
```

```Go
var tokens = ...
```

## <a id="type" href="#type">Types</a>

```
tags: [package]
```

### <a id="Error" href="#Error">type Error struct</a>

```
searchKey: scanner.Error
tags: [struct]
```

```Go
type Error struct {
	Pos token.Position
	Msg string
}
```

In an ErrorList, an error is represented by an *Error. The position Pos, if valid, points to the beginning of the offending token, and the error condition is described by Msg. 

#### <a id="Error.Error" href="#Error.Error">func (e Error) Error() string</a>

```
searchKey: scanner.Error.Error
tags: [function]
```

```Go
func (e Error) Error() string
```

Error implements the error interface. 

### <a id="ErrorHandler" href="#ErrorHandler">type ErrorHandler func(pos go/token.Position, msg string)</a>

```
searchKey: scanner.ErrorHandler
tags: [function]
```

```Go
type ErrorHandler func(pos token.Position, msg string)
```

An ErrorHandler may be provided to Scanner.Init. If a syntax error is encountered and a handler was installed, the handler is called with a position and an error message. The position points to the beginning of the offending token. 

### <a id="ErrorList" href="#ErrorList">type ErrorList []*scanner.Error</a>

```
searchKey: scanner.ErrorList
tags: [array struct]
```

```Go
type ErrorList []*Error
```

ErrorList is a list of *Errors. The zero value for an ErrorList is an empty ErrorList ready to use. 

#### <a id="ErrorList.Add" href="#ErrorList.Add">func (p *ErrorList) Add(pos token.Position, msg string)</a>

```
searchKey: scanner.ErrorList.Add
tags: [method]
```

```Go
func (p *ErrorList) Add(pos token.Position, msg string)
```

Add adds an Error with given position and error message to an ErrorList. 

#### <a id="ErrorList.Err" href="#ErrorList.Err">func (p ErrorList) Err() error</a>

```
searchKey: scanner.ErrorList.Err
tags: [function]
```

```Go
func (p ErrorList) Err() error
```

Err returns an error equivalent to this error list. If the list is empty, Err returns nil. 

#### <a id="ErrorList.Error" href="#ErrorList.Error">func (p ErrorList) Error() string</a>

```
searchKey: scanner.ErrorList.Error
tags: [function]
```

```Go
func (p ErrorList) Error() string
```

An ErrorList implements the error interface. 

#### <a id="ErrorList.Len" href="#ErrorList.Len">func (p ErrorList) Len() int</a>

```
searchKey: scanner.ErrorList.Len
tags: [function]
```

```Go
func (p ErrorList) Len() int
```

ErrorList implements the sort Interface. 

#### <a id="ErrorList.Less" href="#ErrorList.Less">func (p ErrorList) Less(i, j int) bool</a>

```
searchKey: scanner.ErrorList.Less
tags: [method]
```

```Go
func (p ErrorList) Less(i, j int) bool
```

#### <a id="ErrorList.RemoveMultiples" href="#ErrorList.RemoveMultiples">func (p *ErrorList) RemoveMultiples()</a>

```
searchKey: scanner.ErrorList.RemoveMultiples
tags: [function]
```

```Go
func (p *ErrorList) RemoveMultiples()
```

RemoveMultiples sorts an ErrorList and removes all but the first error per line. 

#### <a id="ErrorList.Reset" href="#ErrorList.Reset">func (p *ErrorList) Reset()</a>

```
searchKey: scanner.ErrorList.Reset
tags: [function]
```

```Go
func (p *ErrorList) Reset()
```

Reset resets an ErrorList to no errors. 

#### <a id="ErrorList.Sort" href="#ErrorList.Sort">func (p ErrorList) Sort()</a>

```
searchKey: scanner.ErrorList.Sort
tags: [function]
```

```Go
func (p ErrorList) Sort()
```

Sort sorts an ErrorList. *Error entries are sorted by position, other errors are sorted by error message, and before any *Error entry. 

#### <a id="ErrorList.Swap" href="#ErrorList.Swap">func (p ErrorList) Swap(i, j int)</a>

```
searchKey: scanner.ErrorList.Swap
tags: [method]
```

```Go
func (p ErrorList) Swap(i, j int)
```

### <a id="Mode" href="#Mode">type Mode uint</a>

```
searchKey: scanner.Mode
tags: [number]
```

```Go
type Mode uint
```

A mode value is a set of flags (or 0). They control scanner behavior. 

### <a id="Scanner" href="#Scanner">type Scanner struct</a>

```
searchKey: scanner.Scanner
tags: [struct]
```

```Go
type Scanner struct {
	// immutable state
	file *token.File  // source file handle
	dir  string       // directory portion of file.Name()
	src  []byte       // source
	err  ErrorHandler // error reporting; or nil
	mode Mode         // scanning mode

	// scanning state
	ch         rune // current character
	offset     int  // character offset
	rdOffset   int  // reading offset (position after current character)
	lineOffset int  // current line offset
	insertSemi bool // insert a semicolon before next newline

	// public state - ok to modify
	ErrorCount int // number of errors encountered
}
```

A Scanner holds the scanner's internal state while processing a given text. It can be allocated as part of another data structure but must be initialized via Init before use. 

#### <a id="Scanner.Init" href="#Scanner.Init">func (s *Scanner) Init(file *token.File, src []byte, err ErrorHandler, mode Mode)</a>

```
searchKey: scanner.Scanner.Init
tags: [method]
```

```Go
func (s *Scanner) Init(file *token.File, src []byte, err ErrorHandler, mode Mode)
```

Init prepares the scanner s to tokenize the text src by setting the scanner at the beginning of src. The scanner uses the file set file for position information and it adds line information for each line. It is ok to re-use the same file when re-scanning the same file as line information which is already present is ignored. Init causes a panic if the file size does not match the src size. 

Calls to Scan will invoke the error handler err if they encounter a syntax error and err is not nil. Also, for each error encountered, the Scanner field ErrorCount is incremented by one. The mode parameter determines how comments are handled. 

Note that Init may call err if there is an error in the first character of the file. 

#### <a id="Scanner.Scan" href="#Scanner.Scan">func (s *Scanner) Scan() (pos token.Pos, tok token.Token, lit string)</a>

```
searchKey: scanner.Scanner.Scan
tags: [function]
```

```Go
func (s *Scanner) Scan() (pos token.Pos, tok token.Token, lit string)
```

Scan scans the next token and returns the token position, the token, and its literal string if applicable. The source end is indicated by token.EOF. 

If the returned token is a literal (token.IDENT, token.INT, token.FLOAT, token.IMAG, token.CHAR, token.STRING) or token.COMMENT, the literal string has the corresponding value. 

If the returned token is a keyword, the literal string is the keyword. 

If the returned token is token.SEMICOLON, the corresponding literal string is ";" if the semicolon was present in the source, and "\n" if the semicolon was inserted because of a newline or at EOF. 

If the returned token is token.ILLEGAL, the literal string is the offending character. 

In all other cases, Scan returns an empty literal string. 

For more tolerant parsing, Scan will return a valid token if possible even if a syntax error was encountered. Thus, even if the resulting token sequence contains no illegal tokens, a client may not assume that no error occurred. Instead it must check the scanner's ErrorCount or the number of calls of the error handler, if there was one installed. 

Scan adds line information to the file added to the file set with Init. Token positions are relative to that file and thus relative to the file set. 

#### <a id="Scanner.digits" href="#Scanner.digits">func (s *Scanner) digits(base int, invalid *int) (digsep int)</a>

```
searchKey: scanner.Scanner.digits
tags: [method private]
```

```Go
func (s *Scanner) digits(base int, invalid *int) (digsep int)
```

digits accepts the sequence { digit | '_' }. If base <= 10, digits accepts any decimal digit but records the offset (relative to the source start) of a digit >= base in *invalid, if *invalid < 0. digits returns a bitset describing whether the sequence contained digits (bit 0 is set), or separators '_' (bit 1 is set). 

#### <a id="Scanner.error" href="#Scanner.error">func (s *Scanner) error(offs int, msg string)</a>

```
searchKey: scanner.Scanner.error
tags: [method private]
```

```Go
func (s *Scanner) error(offs int, msg string)
```

#### <a id="Scanner.errorf" href="#Scanner.errorf">func (s *Scanner) errorf(offs int, format string, args ...interface{})</a>

```
searchKey: scanner.Scanner.errorf
tags: [method private]
```

```Go
func (s *Scanner) errorf(offs int, format string, args ...interface{})
```

#### <a id="Scanner.findLineEnd" href="#Scanner.findLineEnd">func (s *Scanner) findLineEnd() bool</a>

```
searchKey: scanner.Scanner.findLineEnd
tags: [function private]
```

```Go
func (s *Scanner) findLineEnd() bool
```

#### <a id="Scanner.next" href="#Scanner.next">func (s *Scanner) next()</a>

```
searchKey: scanner.Scanner.next
tags: [function private]
```

```Go
func (s *Scanner) next()
```

Read the next Unicode char into s.ch. s.ch < 0 means end-of-file. 

For optimization, there is some overlap between this method and s.scanIdentifier. 

#### <a id="Scanner.peek" href="#Scanner.peek">func (s *Scanner) peek() byte</a>

```
searchKey: scanner.Scanner.peek
tags: [function private]
```

```Go
func (s *Scanner) peek() byte
```

peek returns the byte following the most recently read character without advancing the scanner. If the scanner is at EOF, peek returns 0. 

#### <a id="Scanner.scanComment" href="#Scanner.scanComment">func (s *Scanner) scanComment() string</a>

```
searchKey: scanner.Scanner.scanComment
tags: [function private]
```

```Go
func (s *Scanner) scanComment() string
```

#### <a id="Scanner.scanEscape" href="#Scanner.scanEscape">func (s *Scanner) scanEscape(quote rune) bool</a>

```
searchKey: scanner.Scanner.scanEscape
tags: [method private]
```

```Go
func (s *Scanner) scanEscape(quote rune) bool
```

scanEscape parses an escape sequence where rune is the accepted escaped quote. In case of a syntax error, it stops at the offending character (without consuming it) and returns false. Otherwise it returns true. 

#### <a id="Scanner.scanIdentifier" href="#Scanner.scanIdentifier">func (s *Scanner) scanIdentifier() string</a>

```
searchKey: scanner.Scanner.scanIdentifier
tags: [function private]
```

```Go
func (s *Scanner) scanIdentifier() string
```

scanIdentifier reads the string of valid identifier characters at s.offset. It must only be called when s.ch is known to be a valid letter. 

Be careful when making changes to this function: it is optimized and affects scanning performance significantly. 

#### <a id="Scanner.scanNumber" href="#Scanner.scanNumber">func (s *Scanner) scanNumber() (token.Token, string)</a>

```
searchKey: scanner.Scanner.scanNumber
tags: [function private]
```

```Go
func (s *Scanner) scanNumber() (token.Token, string)
```

#### <a id="Scanner.scanRawString" href="#Scanner.scanRawString">func (s *Scanner) scanRawString() string</a>

```
searchKey: scanner.Scanner.scanRawString
tags: [function private]
```

```Go
func (s *Scanner) scanRawString() string
```

#### <a id="Scanner.scanRune" href="#Scanner.scanRune">func (s *Scanner) scanRune() string</a>

```
searchKey: scanner.Scanner.scanRune
tags: [function private]
```

```Go
func (s *Scanner) scanRune() string
```

#### <a id="Scanner.scanString" href="#Scanner.scanString">func (s *Scanner) scanString() string</a>

```
searchKey: scanner.Scanner.scanString
tags: [function private]
```

```Go
func (s *Scanner) scanString() string
```

#### <a id="Scanner.skipWhitespace" href="#Scanner.skipWhitespace">func (s *Scanner) skipWhitespace()</a>

```
searchKey: scanner.Scanner.skipWhitespace
tags: [function private]
```

```Go
func (s *Scanner) skipWhitespace()
```

#### <a id="Scanner.switch2" href="#Scanner.switch2">func (s *Scanner) switch2(tok0, tok1 token.Token) token.Token</a>

```
searchKey: scanner.Scanner.switch2
tags: [method private]
```

```Go
func (s *Scanner) switch2(tok0, tok1 token.Token) token.Token
```

#### <a id="Scanner.switch3" href="#Scanner.switch3">func (s *Scanner) switch3(tok0, tok1 token.Token, ch2 rune, tok2 token.Token) token.Token</a>

```
searchKey: scanner.Scanner.switch3
tags: [method private]
```

```Go
func (s *Scanner) switch3(tok0, tok1 token.Token, ch2 rune, tok2 token.Token) token.Token
```

#### <a id="Scanner.switch4" href="#Scanner.switch4">func (s *Scanner) switch4(tok0, tok1 token.Token, ch2 rune, tok2, tok3 token.Token) token.Token</a>

```
searchKey: scanner.Scanner.switch4
tags: [method private]
```

```Go
func (s *Scanner) switch4(tok0, tok1 token.Token, ch2 rune, tok2, tok3 token.Token) token.Token
```

#### <a id="Scanner.updateLineInfo" href="#Scanner.updateLineInfo">func (s *Scanner) updateLineInfo(next, offs int, text []byte)</a>

```
searchKey: scanner.Scanner.updateLineInfo
tags: [method private]
```

```Go
func (s *Scanner) updateLineInfo(next, offs int, text []byte)
```

updateLineInfo parses the incoming comment text at offset offs as a line directive. If successful, it updates the line info table for the position next per the line directive. 

### <a id="elt" href="#elt">type elt struct</a>

```
searchKey: scanner.elt
tags: [struct private]
```

```Go
type elt struct {
	tok   token.Token
	lit   string
	class int
}
```

### <a id="errorCollector" href="#errorCollector">type errorCollector struct</a>

```
searchKey: scanner.errorCollector
tags: [struct private]
```

```Go
type errorCollector struct {
	cnt int            // number of errors encountered
	msg string         // last error message encountered
	pos token.Position // last error position encountered
}
```

### <a id="segment" href="#segment">type segment struct</a>

```
searchKey: scanner.segment
tags: [struct private]
```

```Go
type segment struct {
	srcline      string // a line of source text
	filename     string // filename for current token; error message for invalid line directives
	line, column int    // line and column for current token; error position for invalid line directives
}
```

## <a id="func" href="#func">Functions</a>

```
tags: [package]
```

### <a id="BenchmarkScan" href="#BenchmarkScan">func BenchmarkScan(b *testing.B)</a>

```
searchKey: scanner.BenchmarkScan
tags: [method private benchmark]
```

```Go
func BenchmarkScan(b *testing.B)
```

### <a id="BenchmarkScanFiles" href="#BenchmarkScanFiles">func BenchmarkScanFiles(b *testing.B)</a>

```
searchKey: scanner.BenchmarkScanFiles
tags: [method private benchmark]
```

```Go
func BenchmarkScanFiles(b *testing.B)
```

### <a id="PrintError" href="#PrintError">func PrintError(w io.Writer, err error)</a>

```
searchKey: scanner.PrintError
tags: [method]
```

```Go
func PrintError(w io.Writer, err error)
```

PrintError is a utility function that prints a list of errors to w, one error per line, if the err parameter is an ErrorList. Otherwise it prints the err string. 

### <a id="TestInit" href="#TestInit">func TestInit(t *testing.T)</a>

```
searchKey: scanner.TestInit
tags: [method private test]
```

```Go
func TestInit(t *testing.T)
```

Verify that initializing the same scanner more than once works correctly. 

### <a id="TestInvalidLineDirectives" href="#TestInvalidLineDirectives">func TestInvalidLineDirectives(t *testing.T)</a>

```
searchKey: scanner.TestInvalidLineDirectives
tags: [method private test]
```

```Go
func TestInvalidLineDirectives(t *testing.T)
```

Verify that invalid line directives get the correct error message. 

### <a id="TestIssue10213" href="#TestIssue10213">func TestIssue10213(t *testing.T)</a>

```
searchKey: scanner.TestIssue10213
tags: [method private test]
```

```Go
func TestIssue10213(t *testing.T)
```

Verify that no comments show up as literal values when skipping comments. 

### <a id="TestIssue28112" href="#TestIssue28112">func TestIssue28112(t *testing.T)</a>

```
searchKey: scanner.TestIssue28112
tags: [method private test]
```

```Go
func TestIssue28112(t *testing.T)
```

### <a id="TestLineDirectives" href="#TestLineDirectives">func TestLineDirectives(t *testing.T)</a>

```
searchKey: scanner.TestLineDirectives
tags: [method private test]
```

```Go
func TestLineDirectives(t *testing.T)
```

Verify that line directives are interpreted correctly. 

### <a id="TestNumbers" href="#TestNumbers">func TestNumbers(t *testing.T)</a>

```
searchKey: scanner.TestNumbers
tags: [method private test]
```

```Go
func TestNumbers(t *testing.T)
```

### <a id="TestScan" href="#TestScan">func TestScan(t *testing.T)</a>

```
searchKey: scanner.TestScan
tags: [method private test]
```

```Go
func TestScan(t *testing.T)
```

Verify that calling Scan() provides the correct results. 

### <a id="TestScanErrors" href="#TestScanErrors">func TestScanErrors(t *testing.T)</a>

```
searchKey: scanner.TestScanErrors
tags: [method private test]
```

```Go
func TestScanErrors(t *testing.T)
```

### <a id="TestSemis" href="#TestSemis">func TestSemis(t *testing.T)</a>

```
searchKey: scanner.TestSemis
tags: [method private test]
```

```Go
func TestSemis(t *testing.T)
```

### <a id="TestStdErrorHander" href="#TestStdErrorHander">func TestStdErrorHander(t *testing.T)</a>

```
searchKey: scanner.TestStdErrorHander
tags: [method private test]
```

```Go
func TestStdErrorHander(t *testing.T)
```

### <a id="TestStripCR" href="#TestStripCR">func TestStripCR(t *testing.T)</a>

```
searchKey: scanner.TestStripCR
tags: [method private test]
```

```Go
func TestStripCR(t *testing.T)
```

### <a id="checkError" href="#checkError">func checkError(t *testing.T, src string, tok token.Token, pos int, lit, err string)</a>

```
searchKey: scanner.checkError
tags: [method private]
```

```Go
func checkError(t *testing.T, src string, tok token.Token, pos int, lit, err string)
```

### <a id="checkPos" href="#checkPos">func checkPos(t *testing.T, lit string, p token.Pos, expected token.Position)</a>

```
searchKey: scanner.checkPos
tags: [method private]
```

```Go
func checkPos(t *testing.T, lit string, p token.Pos, expected token.Position)
```

### <a id="checkSemi" href="#checkSemi">func checkSemi(t *testing.T, line string, mode Mode)</a>

```
searchKey: scanner.checkSemi
tags: [method private]
```

```Go
func checkSemi(t *testing.T, line string, mode Mode)
```

### <a id="digitVal" href="#digitVal">func digitVal(ch rune) int</a>

```
searchKey: scanner.digitVal
tags: [method private]
```

```Go
func digitVal(ch rune) int
```

### <a id="invalidSep" href="#invalidSep">func invalidSep(x string) int</a>

```
searchKey: scanner.invalidSep
tags: [method private]
```

```Go
func invalidSep(x string) int
```

invalidSep returns the index of the first invalid separator in x, or -1. 

### <a id="isDecimal" href="#isDecimal">func isDecimal(ch rune) bool</a>

```
searchKey: scanner.isDecimal
tags: [method private]
```

```Go
func isDecimal(ch rune) bool
```

### <a id="isDigit" href="#isDigit">func isDigit(ch rune) bool</a>

```
searchKey: scanner.isDigit
tags: [method private]
```

```Go
func isDigit(ch rune) bool
```

### <a id="isHex" href="#isHex">func isHex(ch rune) bool</a>

```
searchKey: scanner.isHex
tags: [method private]
```

```Go
func isHex(ch rune) bool
```

### <a id="isLetter" href="#isLetter">func isLetter(ch rune) bool</a>

```
searchKey: scanner.isLetter
tags: [method private]
```

```Go
func isLetter(ch rune) bool
```

### <a id="litname" href="#litname">func litname(prefix rune) string</a>

```
searchKey: scanner.litname
tags: [method private]
```

```Go
func litname(prefix rune) string
```

### <a id="lower" href="#lower">func lower(ch rune) rune</a>

```
searchKey: scanner.lower
tags: [method private]
```

```Go
func lower(ch rune) rune
```

### <a id="newlineCount" href="#newlineCount">func newlineCount(s string) int</a>

```
searchKey: scanner.newlineCount
tags: [method private]
```

```Go
func newlineCount(s string) int
```

### <a id="stripCR" href="#stripCR">func stripCR(b []byte, comment bool) []byte</a>

```
searchKey: scanner.stripCR
tags: [method private]
```

```Go
func stripCR(b []byte, comment bool) []byte
```

### <a id="testSegments" href="#testSegments">func testSegments(t *testing.T, segments []segment, filename string)</a>

```
searchKey: scanner.testSegments
tags: [method private]
```

```Go
func testSegments(t *testing.T, segments []segment, filename string)
```

### <a id="tokenclass" href="#tokenclass">func tokenclass(tok token.Token) int</a>

```
searchKey: scanner.tokenclass
tags: [method private]
```

```Go
func tokenclass(tok token.Token) int
```

### <a id="trailingDigits" href="#trailingDigits">func trailingDigits(text []byte) (int, int, bool)</a>

```
searchKey: scanner.trailingDigits
tags: [method private]
```

```Go
func trailingDigits(text []byte) (int, int, bool)
```

