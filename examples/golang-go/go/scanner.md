# Package scanner

Package scanner implements a scanner for Go source text. It takes a []byte as source which can then be tokenized through repeated calls to the Scan method. 

## Index

* [Constants](#const)
    * [const bom](#bom)
    * [const eof](#eof)
    * [const ScanComments](#ScanComments)
    * [const dontInsertSemis](#dontInsertSemis)
    * [const special](#special)
    * [const literal](#literal)
    * [const operator](#operator)
    * [const keyword](#keyword)
    * [const whitespace](#whitespace)
* [Variables](#var)
    * [var prefix](#prefix)
    * [var fset](#fset)
    * [var tokens](#tokens)
    * [var source](#source)
    * [var lines](#lines)
    * [var segments](#segments)
    * [var dirsegments](#dirsegments)
    * [var dirUnixSegments](#dirUnixSegments)
    * [var dirWindowsSegments](#dirWindowsSegments)
    * [var invalidSegments](#invalidSegments)
    * [var errors](#errors)
* [Types](#type)
    * [type Error struct](#Error)
        * [func (e Error) Error() string](#Error.Error)
    * [type ErrorList []*scanner.Error](#ErrorList)
        * [func (p *ErrorList) Add(pos token.Position, msg string)](#ErrorList.Add)
        * [func (p *ErrorList) Reset()](#ErrorList.Reset)
        * [func (p ErrorList) Len() int](#ErrorList.Len)
        * [func (p ErrorList) Swap(i, j int)](#ErrorList.Swap)
        * [func (p ErrorList) Less(i, j int) bool](#ErrorList.Less)
        * [func (p ErrorList) Sort()](#ErrorList.Sort)
        * [func (p *ErrorList) RemoveMultiples()](#ErrorList.RemoveMultiples)
        * [func (p ErrorList) Error() string](#ErrorList.Error)
        * [func (p ErrorList) Err() error](#ErrorList.Err)
    * [type ErrorHandler func(pos go/token.Position, msg string)](#ErrorHandler)
    * [type Scanner struct](#Scanner)
        * [func (s *Scanner) next()](#Scanner.next)
        * [func (s *Scanner) peek() byte](#Scanner.peek)
        * [func (s *Scanner) Init(file *token.File, src []byte, err ErrorHandler, mode Mode)](#Scanner.Init)
        * [func (s *Scanner) error(offs int, msg string)](#Scanner.error)
        * [func (s *Scanner) errorf(offs int, format string, args ...interface{})](#Scanner.errorf)
        * [func (s *Scanner) scanComment() string](#Scanner.scanComment)
        * [func (s *Scanner) updateLineInfo(next, offs int, text []byte)](#Scanner.updateLineInfo)
        * [func (s *Scanner) findLineEnd() bool](#Scanner.findLineEnd)
        * [func (s *Scanner) scanIdentifier() string](#Scanner.scanIdentifier)
        * [func (s *Scanner) digits(base int, invalid *int) (digsep int)](#Scanner.digits)
        * [func (s *Scanner) scanNumber() (token.Token, string)](#Scanner.scanNumber)
        * [func (s *Scanner) scanEscape(quote rune) bool](#Scanner.scanEscape)
        * [func (s *Scanner) scanRune() string](#Scanner.scanRune)
        * [func (s *Scanner) scanString() string](#Scanner.scanString)
        * [func (s *Scanner) scanRawString() string](#Scanner.scanRawString)
        * [func (s *Scanner) skipWhitespace()](#Scanner.skipWhitespace)
        * [func (s *Scanner) switch2(tok0, tok1 token.Token) token.Token](#Scanner.switch2)
        * [func (s *Scanner) switch3(tok0, tok1 token.Token, ch2 rune, tok2 token.Token) token.Token](#Scanner.switch3)
        * [func (s *Scanner) switch4(tok0, tok1 token.Token, ch2 rune, tok2, tok3 token.Token) token.Token](#Scanner.switch4)
        * [func (s *Scanner) Scan() (pos token.Pos, tok token.Token, lit string)](#Scanner.Scan)
    * [type Mode uint](#Mode)
    * [type elt struct](#elt)
    * [type segment struct](#segment)
    * [type errorCollector struct](#errorCollector)
* [Functions](#func)
    * [func PrintError(w io.Writer, err error)](#PrintError)
    * [func trailingDigits(text []byte) (int, int, bool)](#trailingDigits)
    * [func isLetter(ch rune) bool](#isLetter)
    * [func isDigit(ch rune) bool](#isDigit)
    * [func digitVal(ch rune) int](#digitVal)
    * [func lower(ch rune) rune](#lower)
    * [func isDecimal(ch rune) bool](#isDecimal)
    * [func isHex(ch rune) bool](#isHex)
    * [func litname(prefix rune) string](#litname)
    * [func invalidSep(x string) int](#invalidSep)
    * [func stripCR(b []byte, comment bool) []byte](#stripCR)
    * [func tokenclass(tok token.Token) int](#tokenclass)
    * [func newlineCount(s string) int](#newlineCount)
    * [func checkPos(t *testing.T, lit string, p token.Pos, expected token.Position)](#checkPos)
    * [func TestScan(t *testing.T)](#TestScan)
    * [func TestStripCR(t *testing.T)](#TestStripCR)
    * [func checkSemi(t *testing.T, line string, mode Mode)](#checkSemi)
    * [func TestSemis(t *testing.T)](#TestSemis)
    * [func TestLineDirectives(t *testing.T)](#TestLineDirectives)
    * [func testSegments(t *testing.T, segments []segment, filename string)](#testSegments)
    * [func TestInvalidLineDirectives(t *testing.T)](#TestInvalidLineDirectives)
    * [func TestInit(t *testing.T)](#TestInit)
    * [func TestStdErrorHander(t *testing.T)](#TestStdErrorHander)
    * [func checkError(t *testing.T, src string, tok token.Token, pos int, lit, err string)](#checkError)
    * [func TestScanErrors(t *testing.T)](#TestScanErrors)
    * [func TestIssue10213(t *testing.T)](#TestIssue10213)
    * [func TestIssue28112(t *testing.T)](#TestIssue28112)
    * [func BenchmarkScan(b *testing.B)](#BenchmarkScan)
    * [func BenchmarkScanFiles(b *testing.B)](#BenchmarkScanFiles)
    * [func TestNumbers(t *testing.T)](#TestNumbers)


## <a id="const" href="#const">Constants</a>

```
tags: [exported]
```

### <a id="bom" href="#bom">const bom</a>

```
searchKey: scanner.bom
```

```Go
const bom = 0xFEFF // byte order mark, only permitted as very first character

```

### <a id="eof" href="#eof">const eof</a>

```
searchKey: scanner.eof
```

```Go
const eof = -1 // end of file

```

### <a id="ScanComments" href="#ScanComments">const ScanComments</a>

```
searchKey: scanner.ScanComments
tags: [exported]
```

```Go
const ScanComments Mode = 1 << iota // return comments as COMMENT tokens

```

### <a id="dontInsertSemis" href="#dontInsertSemis">const dontInsertSemis</a>

```
searchKey: scanner.dontInsertSemis
```

```Go
const dontInsertSemis // do not automatically insert semicolons - for testing only

```

### <a id="special" href="#special">const special</a>

```
searchKey: scanner.special
```

```Go
const special = iota
```

### <a id="literal" href="#literal">const literal</a>

```
searchKey: scanner.literal
```

```Go
const literal
```

### <a id="operator" href="#operator">const operator</a>

```
searchKey: scanner.operator
```

```Go
const operator
```

### <a id="keyword" href="#keyword">const keyword</a>

```
searchKey: scanner.keyword
```

```Go
const keyword
```

### <a id="whitespace" href="#whitespace">const whitespace</a>

```
searchKey: scanner.whitespace
```

```Go
const whitespace = "  \t  \n\n\n" // to separate tokens

```

## <a id="var" href="#var">Variables</a>

```
tags: [exported]
```

### <a id="prefix" href="#prefix">var prefix</a>

```
searchKey: scanner.prefix
```

```Go
var prefix = []byte("line ")
```

### <a id="fset" href="#fset">var fset</a>

```
searchKey: scanner.fset
```

```Go
var fset = token.NewFileSet()
```

### <a id="tokens" href="#tokens">var tokens</a>

```
searchKey: scanner.tokens
```

```Go
var tokens = ...
```

### <a id="source" href="#source">var source</a>

```
searchKey: scanner.source
```

```Go
var source = ...
```

### <a id="lines" href="#lines">var lines</a>

```
searchKey: scanner.lines
```

```Go
var lines = ...
```

### <a id="segments" href="#segments">var segments</a>

```
searchKey: scanner.segments
```

```Go
var segments = ...
```

### <a id="dirsegments" href="#dirsegments">var dirsegments</a>

```
searchKey: scanner.dirsegments
```

```Go
var dirsegments = ...
```

### <a id="dirUnixSegments" href="#dirUnixSegments">var dirUnixSegments</a>

```
searchKey: scanner.dirUnixSegments
```

```Go
var dirUnixSegments = []segment{
	{"\n//line /bar:42\n  line42", "/bar", 42, 0},
}
```

### <a id="dirWindowsSegments" href="#dirWindowsSegments">var dirWindowsSegments</a>

```
searchKey: scanner.dirWindowsSegments
```

```Go
var dirWindowsSegments = []segment{
	{"\n//line c:\\bar:42\n  line42", "c:\\bar", 42, 0},
}
```

### <a id="invalidSegments" href="#invalidSegments">var invalidSegments</a>

```
searchKey: scanner.invalidSegments
```

```Go
var invalidSegments = ...
```

The filename is used for the error message in these test cases. The first line directive is valid and used to control the expected error line. 

### <a id="errors" href="#errors">var errors</a>

```
searchKey: scanner.errors
```

```Go
var errors = ...
```

## <a id="type" href="#type">Types</a>

```
tags: [exported]
```

### <a id="Error" href="#Error">type Error struct</a>

```
searchKey: scanner.Error
tags: [exported]
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
tags: [exported]
```

```Go
func (e Error) Error() string
```

Error implements the error interface. 

### <a id="ErrorList" href="#ErrorList">type ErrorList []*scanner.Error</a>

```
searchKey: scanner.ErrorList
tags: [exported]
```

```Go
type ErrorList []*Error
```

ErrorList is a list of *Errors. The zero value for an ErrorList is an empty ErrorList ready to use. 

#### <a id="ErrorList.Add" href="#ErrorList.Add">func (p *ErrorList) Add(pos token.Position, msg string)</a>

```
searchKey: scanner.ErrorList.Add
tags: [exported]
```

```Go
func (p *ErrorList) Add(pos token.Position, msg string)
```

Add adds an Error with given position and error message to an ErrorList. 

#### <a id="ErrorList.Reset" href="#ErrorList.Reset">func (p *ErrorList) Reset()</a>

```
searchKey: scanner.ErrorList.Reset
tags: [exported]
```

```Go
func (p *ErrorList) Reset()
```

Reset resets an ErrorList to no errors. 

#### <a id="ErrorList.Len" href="#ErrorList.Len">func (p ErrorList) Len() int</a>

```
searchKey: scanner.ErrorList.Len
tags: [exported]
```

```Go
func (p ErrorList) Len() int
```

ErrorList implements the sort Interface. 

#### <a id="ErrorList.Swap" href="#ErrorList.Swap">func (p ErrorList) Swap(i, j int)</a>

```
searchKey: scanner.ErrorList.Swap
tags: [exported]
```

```Go
func (p ErrorList) Swap(i, j int)
```

#### <a id="ErrorList.Less" href="#ErrorList.Less">func (p ErrorList) Less(i, j int) bool</a>

```
searchKey: scanner.ErrorList.Less
tags: [exported]
```

```Go
func (p ErrorList) Less(i, j int) bool
```

#### <a id="ErrorList.Sort" href="#ErrorList.Sort">func (p ErrorList) Sort()</a>

```
searchKey: scanner.ErrorList.Sort
tags: [exported]
```

```Go
func (p ErrorList) Sort()
```

Sort sorts an ErrorList. *Error entries are sorted by position, other errors are sorted by error message, and before any *Error entry. 

#### <a id="ErrorList.RemoveMultiples" href="#ErrorList.RemoveMultiples">func (p *ErrorList) RemoveMultiples()</a>

```
searchKey: scanner.ErrorList.RemoveMultiples
tags: [exported]
```

```Go
func (p *ErrorList) RemoveMultiples()
```

RemoveMultiples sorts an ErrorList and removes all but the first error per line. 

#### <a id="ErrorList.Error" href="#ErrorList.Error">func (p ErrorList) Error() string</a>

```
searchKey: scanner.ErrorList.Error
tags: [exported]
```

```Go
func (p ErrorList) Error() string
```

An ErrorList implements the error interface. 

#### <a id="ErrorList.Err" href="#ErrorList.Err">func (p ErrorList) Err() error</a>

```
searchKey: scanner.ErrorList.Err
tags: [exported]
```

```Go
func (p ErrorList) Err() error
```

Err returns an error equivalent to this error list. If the list is empty, Err returns nil. 

### <a id="ErrorHandler" href="#ErrorHandler">type ErrorHandler func(pos go/token.Position, msg string)</a>

```
searchKey: scanner.ErrorHandler
tags: [exported]
```

```Go
type ErrorHandler func(pos token.Position, msg string)
```

An ErrorHandler may be provided to Scanner.Init. If a syntax error is encountered and a handler was installed, the handler is called with a position and an error message. The position points to the beginning of the offending token. 

### <a id="Scanner" href="#Scanner">type Scanner struct</a>

```
searchKey: scanner.Scanner
tags: [exported]
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

#### <a id="Scanner.next" href="#Scanner.next">func (s *Scanner) next()</a>

```
searchKey: scanner.Scanner.next
```

```Go
func (s *Scanner) next()
```

Read the next Unicode char into s.ch. s.ch < 0 means end-of-file. 

For optimization, there is some overlap between this method and s.scanIdentifier. 

#### <a id="Scanner.peek" href="#Scanner.peek">func (s *Scanner) peek() byte</a>

```
searchKey: scanner.Scanner.peek
```

```Go
func (s *Scanner) peek() byte
```

peek returns the byte following the most recently read character without advancing the scanner. If the scanner is at EOF, peek returns 0. 

#### <a id="Scanner.Init" href="#Scanner.Init">func (s *Scanner) Init(file *token.File, src []byte, err ErrorHandler, mode Mode)</a>

```
searchKey: scanner.Scanner.Init
tags: [exported]
```

```Go
func (s *Scanner) Init(file *token.File, src []byte, err ErrorHandler, mode Mode)
```

Init prepares the scanner s to tokenize the text src by setting the scanner at the beginning of src. The scanner uses the file set file for position information and it adds line information for each line. It is ok to re-use the same file when re-scanning the same file as line information which is already present is ignored. Init causes a panic if the file size does not match the src size. 

Calls to Scan will invoke the error handler err if they encounter a syntax error and err is not nil. Also, for each error encountered, the Scanner field ErrorCount is incremented by one. The mode parameter determines how comments are handled. 

Note that Init may call err if there is an error in the first character of the file. 

#### <a id="Scanner.error" href="#Scanner.error">func (s *Scanner) error(offs int, msg string)</a>

```
searchKey: scanner.Scanner.error
```

```Go
func (s *Scanner) error(offs int, msg string)
```

#### <a id="Scanner.errorf" href="#Scanner.errorf">func (s *Scanner) errorf(offs int, format string, args ...interface{})</a>

```
searchKey: scanner.Scanner.errorf
```

```Go
func (s *Scanner) errorf(offs int, format string, args ...interface{})
```

#### <a id="Scanner.scanComment" href="#Scanner.scanComment">func (s *Scanner) scanComment() string</a>

```
searchKey: scanner.Scanner.scanComment
```

```Go
func (s *Scanner) scanComment() string
```

#### <a id="Scanner.updateLineInfo" href="#Scanner.updateLineInfo">func (s *Scanner) updateLineInfo(next, offs int, text []byte)</a>

```
searchKey: scanner.Scanner.updateLineInfo
```

```Go
func (s *Scanner) updateLineInfo(next, offs int, text []byte)
```

updateLineInfo parses the incoming comment text at offset offs as a line directive. If successful, it updates the line info table for the position next per the line directive. 

#### <a id="Scanner.findLineEnd" href="#Scanner.findLineEnd">func (s *Scanner) findLineEnd() bool</a>

```
searchKey: scanner.Scanner.findLineEnd
```

```Go
func (s *Scanner) findLineEnd() bool
```

#### <a id="Scanner.scanIdentifier" href="#Scanner.scanIdentifier">func (s *Scanner) scanIdentifier() string</a>

```
searchKey: scanner.Scanner.scanIdentifier
```

```Go
func (s *Scanner) scanIdentifier() string
```

scanIdentifier reads the string of valid identifier characters at s.offset. It must only be called when s.ch is known to be a valid letter. 

Be careful when making changes to this function: it is optimized and affects scanning performance significantly. 

#### <a id="Scanner.digits" href="#Scanner.digits">func (s *Scanner) digits(base int, invalid *int) (digsep int)</a>

```
searchKey: scanner.Scanner.digits
```

```Go
func (s *Scanner) digits(base int, invalid *int) (digsep int)
```

digits accepts the sequence { digit | '_' }. If base <= 10, digits accepts any decimal digit but records the offset (relative to the source start) of a digit >= base in *invalid, if *invalid < 0. digits returns a bitset describing whether the sequence contained digits (bit 0 is set), or separators '_' (bit 1 is set). 

#### <a id="Scanner.scanNumber" href="#Scanner.scanNumber">func (s *Scanner) scanNumber() (token.Token, string)</a>

```
searchKey: scanner.Scanner.scanNumber
```

```Go
func (s *Scanner) scanNumber() (token.Token, string)
```

#### <a id="Scanner.scanEscape" href="#Scanner.scanEscape">func (s *Scanner) scanEscape(quote rune) bool</a>

```
searchKey: scanner.Scanner.scanEscape
```

```Go
func (s *Scanner) scanEscape(quote rune) bool
```

scanEscape parses an escape sequence where rune is the accepted escaped quote. In case of a syntax error, it stops at the offending character (without consuming it) and returns false. Otherwise it returns true. 

#### <a id="Scanner.scanRune" href="#Scanner.scanRune">func (s *Scanner) scanRune() string</a>

```
searchKey: scanner.Scanner.scanRune
```

```Go
func (s *Scanner) scanRune() string
```

#### <a id="Scanner.scanString" href="#Scanner.scanString">func (s *Scanner) scanString() string</a>

```
searchKey: scanner.Scanner.scanString
```

```Go
func (s *Scanner) scanString() string
```

#### <a id="Scanner.scanRawString" href="#Scanner.scanRawString">func (s *Scanner) scanRawString() string</a>

```
searchKey: scanner.Scanner.scanRawString
```

```Go
func (s *Scanner) scanRawString() string
```

#### <a id="Scanner.skipWhitespace" href="#Scanner.skipWhitespace">func (s *Scanner) skipWhitespace()</a>

```
searchKey: scanner.Scanner.skipWhitespace
```

```Go
func (s *Scanner) skipWhitespace()
```

#### <a id="Scanner.switch2" href="#Scanner.switch2">func (s *Scanner) switch2(tok0, tok1 token.Token) token.Token</a>

```
searchKey: scanner.Scanner.switch2
```

```Go
func (s *Scanner) switch2(tok0, tok1 token.Token) token.Token
```

#### <a id="Scanner.switch3" href="#Scanner.switch3">func (s *Scanner) switch3(tok0, tok1 token.Token, ch2 rune, tok2 token.Token) token.Token</a>

```
searchKey: scanner.Scanner.switch3
```

```Go
func (s *Scanner) switch3(tok0, tok1 token.Token, ch2 rune, tok2 token.Token) token.Token
```

#### <a id="Scanner.switch4" href="#Scanner.switch4">func (s *Scanner) switch4(tok0, tok1 token.Token, ch2 rune, tok2, tok3 token.Token) token.Token</a>

```
searchKey: scanner.Scanner.switch4
```

```Go
func (s *Scanner) switch4(tok0, tok1 token.Token, ch2 rune, tok2, tok3 token.Token) token.Token
```

#### <a id="Scanner.Scan" href="#Scanner.Scan">func (s *Scanner) Scan() (pos token.Pos, tok token.Token, lit string)</a>

```
searchKey: scanner.Scanner.Scan
tags: [exported]
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

### <a id="Mode" href="#Mode">type Mode uint</a>

```
searchKey: scanner.Mode
tags: [exported]
```

```Go
type Mode uint
```

A mode value is a set of flags (or 0). They control scanner behavior. 

### <a id="elt" href="#elt">type elt struct</a>

```
searchKey: scanner.elt
```

```Go
type elt struct {
	tok   token.Token
	lit   string
	class int
}
```

### <a id="segment" href="#segment">type segment struct</a>

```
searchKey: scanner.segment
```

```Go
type segment struct {
	srcline      string // a line of source text
	filename     string // filename for current token; error message for invalid line directives
	line, column int    // line and column for current token; error position for invalid line directives
}
```

### <a id="errorCollector" href="#errorCollector">type errorCollector struct</a>

```
searchKey: scanner.errorCollector
```

```Go
type errorCollector struct {
	cnt int            // number of errors encountered
	msg string         // last error message encountered
	pos token.Position // last error position encountered
}
```

## <a id="func" href="#func">Functions</a>

```
tags: [exported]
```

### <a id="PrintError" href="#PrintError">func PrintError(w io.Writer, err error)</a>

```
searchKey: scanner.PrintError
tags: [exported]
```

```Go
func PrintError(w io.Writer, err error)
```

PrintError is a utility function that prints a list of errors to w, one error per line, if the err parameter is an ErrorList. Otherwise it prints the err string. 

### <a id="trailingDigits" href="#trailingDigits">func trailingDigits(text []byte) (int, int, bool)</a>

```
searchKey: scanner.trailingDigits
```

```Go
func trailingDigits(text []byte) (int, int, bool)
```

### <a id="isLetter" href="#isLetter">func isLetter(ch rune) bool</a>

```
searchKey: scanner.isLetter
```

```Go
func isLetter(ch rune) bool
```

### <a id="isDigit" href="#isDigit">func isDigit(ch rune) bool</a>

```
searchKey: scanner.isDigit
```

```Go
func isDigit(ch rune) bool
```

### <a id="digitVal" href="#digitVal">func digitVal(ch rune) int</a>

```
searchKey: scanner.digitVal
```

```Go
func digitVal(ch rune) int
```

### <a id="lower" href="#lower">func lower(ch rune) rune</a>

```
searchKey: scanner.lower
```

```Go
func lower(ch rune) rune
```

### <a id="isDecimal" href="#isDecimal">func isDecimal(ch rune) bool</a>

```
searchKey: scanner.isDecimal
```

```Go
func isDecimal(ch rune) bool
```

### <a id="isHex" href="#isHex">func isHex(ch rune) bool</a>

```
searchKey: scanner.isHex
```

```Go
func isHex(ch rune) bool
```

### <a id="litname" href="#litname">func litname(prefix rune) string</a>

```
searchKey: scanner.litname
```

```Go
func litname(prefix rune) string
```

### <a id="invalidSep" href="#invalidSep">func invalidSep(x string) int</a>

```
searchKey: scanner.invalidSep
```

```Go
func invalidSep(x string) int
```

invalidSep returns the index of the first invalid separator in x, or -1. 

### <a id="stripCR" href="#stripCR">func stripCR(b []byte, comment bool) []byte</a>

```
searchKey: scanner.stripCR
```

```Go
func stripCR(b []byte, comment bool) []byte
```

### <a id="tokenclass" href="#tokenclass">func tokenclass(tok token.Token) int</a>

```
searchKey: scanner.tokenclass
```

```Go
func tokenclass(tok token.Token) int
```

### <a id="newlineCount" href="#newlineCount">func newlineCount(s string) int</a>

```
searchKey: scanner.newlineCount
```

```Go
func newlineCount(s string) int
```

### <a id="checkPos" href="#checkPos">func checkPos(t *testing.T, lit string, p token.Pos, expected token.Position)</a>

```
searchKey: scanner.checkPos
```

```Go
func checkPos(t *testing.T, lit string, p token.Pos, expected token.Position)
```

### <a id="TestScan" href="#TestScan">func TestScan(t *testing.T)</a>

```
searchKey: scanner.TestScan
```

```Go
func TestScan(t *testing.T)
```

Verify that calling Scan() provides the correct results. 

### <a id="TestStripCR" href="#TestStripCR">func TestStripCR(t *testing.T)</a>

```
searchKey: scanner.TestStripCR
```

```Go
func TestStripCR(t *testing.T)
```

### <a id="checkSemi" href="#checkSemi">func checkSemi(t *testing.T, line string, mode Mode)</a>

```
searchKey: scanner.checkSemi
```

```Go
func checkSemi(t *testing.T, line string, mode Mode)
```

### <a id="TestSemis" href="#TestSemis">func TestSemis(t *testing.T)</a>

```
searchKey: scanner.TestSemis
```

```Go
func TestSemis(t *testing.T)
```

### <a id="TestLineDirectives" href="#TestLineDirectives">func TestLineDirectives(t *testing.T)</a>

```
searchKey: scanner.TestLineDirectives
```

```Go
func TestLineDirectives(t *testing.T)
```

Verify that line directives are interpreted correctly. 

### <a id="testSegments" href="#testSegments">func testSegments(t *testing.T, segments []segment, filename string)</a>

```
searchKey: scanner.testSegments
```

```Go
func testSegments(t *testing.T, segments []segment, filename string)
```

### <a id="TestInvalidLineDirectives" href="#TestInvalidLineDirectives">func TestInvalidLineDirectives(t *testing.T)</a>

```
searchKey: scanner.TestInvalidLineDirectives
```

```Go
func TestInvalidLineDirectives(t *testing.T)
```

Verify that invalid line directives get the correct error message. 

### <a id="TestInit" href="#TestInit">func TestInit(t *testing.T)</a>

```
searchKey: scanner.TestInit
```

```Go
func TestInit(t *testing.T)
```

Verify that initializing the same scanner more than once works correctly. 

### <a id="TestStdErrorHander" href="#TestStdErrorHander">func TestStdErrorHander(t *testing.T)</a>

```
searchKey: scanner.TestStdErrorHander
```

```Go
func TestStdErrorHander(t *testing.T)
```

### <a id="checkError" href="#checkError">func checkError(t *testing.T, src string, tok token.Token, pos int, lit, err string)</a>

```
searchKey: scanner.checkError
```

```Go
func checkError(t *testing.T, src string, tok token.Token, pos int, lit, err string)
```

### <a id="TestScanErrors" href="#TestScanErrors">func TestScanErrors(t *testing.T)</a>

```
searchKey: scanner.TestScanErrors
```

```Go
func TestScanErrors(t *testing.T)
```

### <a id="TestIssue10213" href="#TestIssue10213">func TestIssue10213(t *testing.T)</a>

```
searchKey: scanner.TestIssue10213
```

```Go
func TestIssue10213(t *testing.T)
```

Verify that no comments show up as literal values when skipping comments. 

### <a id="TestIssue28112" href="#TestIssue28112">func TestIssue28112(t *testing.T)</a>

```
searchKey: scanner.TestIssue28112
```

```Go
func TestIssue28112(t *testing.T)
```

### <a id="BenchmarkScan" href="#BenchmarkScan">func BenchmarkScan(b *testing.B)</a>

```
searchKey: scanner.BenchmarkScan
```

```Go
func BenchmarkScan(b *testing.B)
```

### <a id="BenchmarkScanFiles" href="#BenchmarkScanFiles">func BenchmarkScanFiles(b *testing.B)</a>

```
searchKey: scanner.BenchmarkScanFiles
```

```Go
func BenchmarkScanFiles(b *testing.B)
```

### <a id="TestNumbers" href="#TestNumbers">func TestNumbers(t *testing.T)</a>

```
searchKey: scanner.TestNumbers
```

```Go
func TestNumbers(t *testing.T)
```

