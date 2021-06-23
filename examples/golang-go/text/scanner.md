# Package scanner

Package scanner provides a scanner and tokenizer for UTF-8-encoded text. It takes an io.Reader providing the source, which then can be tokenized through repeated calls to the Scan function. For compatibility with existing tools, the NUL character is not allowed. If the first character in the source is a UTF-8 encoded byte order mark (BOM), it is discarded. 

By default, a Scanner skips white space and Go comments and recognizes all literals as defined by the Go language specification. It may be customized to recognize only a subset of those literals and to recognize different identifier and white space characters. 

## Index

* [Constants](#const)
    * [const ScanIdents](#ScanIdents)
    * [const ScanInts](#ScanInts)
    * [const ScanFloats](#ScanFloats)
    * [const ScanChars](#ScanChars)
    * [const ScanStrings](#ScanStrings)
    * [const ScanRawStrings](#ScanRawStrings)
    * [const ScanComments](#ScanComments)
    * [const SkipComments](#SkipComments)
    * [const GoTokens](#GoTokens)
    * [const EOF](#EOF)
    * [const Ident](#Ident)
    * [const Int](#Int)
    * [const Float](#Float)
    * [const Char](#Char)
    * [const String](#String)
    * [const RawString](#RawString)
    * [const Comment](#Comment)
    * [const skipComment](#skipComment)
    * [const GoWhitespace](#GoWhitespace)
    * [const bufLen](#bufLen)
* [Variables](#var)
    * [var tokenString](#tokenString)
    * [var segmentList](#segmentList)
    * [var f100](#f100)
    * [var tokenList](#tokenList)
* [Types](#type)
    * [type Position struct](#Position)
        * [func (pos *Position) IsValid() bool](#Position.IsValid)
        * [func (pos Position) String() string](#Position.String)
    * [type Scanner struct](#Scanner)
        * [func (s *Scanner) Init(src io.Reader) *Scanner](#Scanner.Init)
        * [func (s *Scanner) next() rune](#Scanner.next)
        * [func (s *Scanner) Next() rune](#Scanner.Next)
        * [func (s *Scanner) Peek() rune](#Scanner.Peek)
        * [func (s *Scanner) error(msg string)](#Scanner.error)
        * [func (s *Scanner) errorf(format string, args ...interface{})](#Scanner.errorf)
        * [func (s *Scanner) isIdentRune(ch rune, i int) bool](#Scanner.isIdentRune)
        * [func (s *Scanner) scanIdentifier() rune](#Scanner.scanIdentifier)
        * [func (s *Scanner) digits(ch0 rune, base int, invalid *rune) (ch rune, digsep int)](#Scanner.digits)
        * [func (s *Scanner) scanNumber(ch rune, seenDot bool) (rune, rune)](#Scanner.scanNumber)
        * [func (s *Scanner) scanDigits(ch rune, base, n int) rune](#Scanner.scanDigits)
        * [func (s *Scanner) scanEscape(quote rune) rune](#Scanner.scanEscape)
        * [func (s *Scanner) scanString(quote rune) (n int)](#Scanner.scanString)
        * [func (s *Scanner) scanRawString()](#Scanner.scanRawString)
        * [func (s *Scanner) scanChar()](#Scanner.scanChar)
        * [func (s *Scanner) scanComment(ch rune) rune](#Scanner.scanComment)
        * [func (s *Scanner) Scan() rune](#Scanner.Scan)
        * [func (s *Scanner) Pos() (pos Position)](#Scanner.Pos)
        * [func (s *Scanner) TokenText() string](#Scanner.TokenText)
    * [type StringReader struct](#StringReader)
        * [func (r *StringReader) Read(p []byte) (n int, err error)](#StringReader.Read)
    * [type token struct](#token)
    * [type errReader struct{}](#errReader)
        * [func (errReader) Read(b []byte) (int, error)](#errReader.Read)
    * [type countReader int](#countReader)
        * [func (r *countReader) Read([]byte) (int, error)](#countReader.Read)
* [Functions](#func)
    * [func TokenString(tok rune) string](#TokenString)
    * [func lower(ch rune) rune](#lower)
    * [func isDecimal(ch rune) bool](#isDecimal)
    * [func isHex(ch rune) bool](#isHex)
    * [func litname(prefix rune) string](#litname)
    * [func invalidSep(x string) int](#invalidSep)
    * [func digitVal(ch rune) int](#digitVal)
    * [func readRuneSegments(t *testing.T, segments []string)](#readRuneSegments)
    * [func TestNext(t *testing.T)](#TestNext)
    * [func makeSource(pattern string) *bytes.Buffer](#makeSource)
    * [func checkTok(t *testing.T, s *Scanner, line int, got, want rune, text string)](#checkTok)
    * [func checkTokErr(t *testing.T, s *Scanner, line int, want rune, text string)](#checkTokErr)
    * [func countNewlines(s string) int](#countNewlines)
    * [func testScan(t *testing.T, mode uint)](#testScan)
    * [func TestScan(t *testing.T)](#TestScan)
    * [func TestInvalidExponent(t *testing.T)](#TestInvalidExponent)
    * [func TestPosition(t *testing.T)](#TestPosition)
    * [func TestScanZeroMode(t *testing.T)](#TestScanZeroMode)
    * [func testScanSelectedMode(t *testing.T, mode uint, class rune)](#testScanSelectedMode)
    * [func TestScanSelectedMask(t *testing.T)](#TestScanSelectedMask)
    * [func TestScanCustomIdent(t *testing.T)](#TestScanCustomIdent)
    * [func TestScanNext(t *testing.T)](#TestScanNext)
    * [func TestScanWhitespace(t *testing.T)](#TestScanWhitespace)
    * [func testError(t *testing.T, src, pos, msg string, tok rune)](#testError)
    * [func TestError(t *testing.T)](#TestError)
    * [func TestIOError(t *testing.T)](#TestIOError)
    * [func checkPos(t *testing.T, got, want Position)](#checkPos)
    * [func checkNextPos(t *testing.T, s *Scanner, offset, line, column int, char rune)](#checkNextPos)
    * [func checkScanPos(t *testing.T, s *Scanner, offset, line, column int, char rune)](#checkScanPos)
    * [func TestPos(t *testing.T)](#TestPos)
    * [func TestNextEOFHandling(t *testing.T)](#TestNextEOFHandling)
    * [func TestScanEOFHandling(t *testing.T)](#TestScanEOFHandling)
    * [func TestIssue29723(t *testing.T)](#TestIssue29723)
    * [func TestNumbers(t *testing.T)](#TestNumbers)
    * [func TestIssue30320(t *testing.T)](#TestIssue30320)
    * [func extractInts(t string, mode uint) (res string)](#extractInts)


## <a id="const" href="#const">Constants</a>

### <a id="ScanIdents" href="#ScanIdents">const ScanIdents</a>

```
searchKey: scanner.ScanIdents
```

```Go
const ScanIdents = 1 << -Ident
```

Predefined mode bits to control recognition of tokens. For instance, to configure a Scanner such that it only recognizes (Go) identifiers, integers, and skips comments, set the Scanner's Mode field to: 

```
ScanIdents | ScanInts | SkipComments

```
With the exceptions of comments, which are skipped if SkipComments is set, unrecognized tokens are not ignored. Instead, the scanner simply returns the respective individual characters (or possibly sub-tokens). For instance, if the mode is ScanIdents (not ScanStrings), the string "foo" is scanned as the token sequence '"' Ident '"'. 

Use GoTokens to configure the Scanner such that it accepts all Go literal tokens including Go identifiers. Comments will be skipped. 

### <a id="ScanInts" href="#ScanInts">const ScanInts</a>

```
searchKey: scanner.ScanInts
```

```Go
const ScanInts = 1 << -Int
```

Predefined mode bits to control recognition of tokens. For instance, to configure a Scanner such that it only recognizes (Go) identifiers, integers, and skips comments, set the Scanner's Mode field to: 

```
ScanIdents | ScanInts | SkipComments

```
With the exceptions of comments, which are skipped if SkipComments is set, unrecognized tokens are not ignored. Instead, the scanner simply returns the respective individual characters (or possibly sub-tokens). For instance, if the mode is ScanIdents (not ScanStrings), the string "foo" is scanned as the token sequence '"' Ident '"'. 

Use GoTokens to configure the Scanner such that it accepts all Go literal tokens including Go identifiers. Comments will be skipped. 

### <a id="ScanFloats" href="#ScanFloats">const ScanFloats</a>

```
searchKey: scanner.ScanFloats
```

```Go
const ScanFloats = 1 << -Float // includes Ints and hexadecimal floats

```

Predefined mode bits to control recognition of tokens. For instance, to configure a Scanner such that it only recognizes (Go) identifiers, integers, and skips comments, set the Scanner's Mode field to: 

```
ScanIdents | ScanInts | SkipComments

```
With the exceptions of comments, which are skipped if SkipComments is set, unrecognized tokens are not ignored. Instead, the scanner simply returns the respective individual characters (or possibly sub-tokens). For instance, if the mode is ScanIdents (not ScanStrings), the string "foo" is scanned as the token sequence '"' Ident '"'. 

Use GoTokens to configure the Scanner such that it accepts all Go literal tokens including Go identifiers. Comments will be skipped. 

### <a id="ScanChars" href="#ScanChars">const ScanChars</a>

```
searchKey: scanner.ScanChars
```

```Go
const ScanChars = 1 << -Char
```

Predefined mode bits to control recognition of tokens. For instance, to configure a Scanner such that it only recognizes (Go) identifiers, integers, and skips comments, set the Scanner's Mode field to: 

```
ScanIdents | ScanInts | SkipComments

```
With the exceptions of comments, which are skipped if SkipComments is set, unrecognized tokens are not ignored. Instead, the scanner simply returns the respective individual characters (or possibly sub-tokens). For instance, if the mode is ScanIdents (not ScanStrings), the string "foo" is scanned as the token sequence '"' Ident '"'. 

Use GoTokens to configure the Scanner such that it accepts all Go literal tokens including Go identifiers. Comments will be skipped. 

### <a id="ScanStrings" href="#ScanStrings">const ScanStrings</a>

```
searchKey: scanner.ScanStrings
```

```Go
const ScanStrings = 1 << -String
```

Predefined mode bits to control recognition of tokens. For instance, to configure a Scanner such that it only recognizes (Go) identifiers, integers, and skips comments, set the Scanner's Mode field to: 

```
ScanIdents | ScanInts | SkipComments

```
With the exceptions of comments, which are skipped if SkipComments is set, unrecognized tokens are not ignored. Instead, the scanner simply returns the respective individual characters (or possibly sub-tokens). For instance, if the mode is ScanIdents (not ScanStrings), the string "foo" is scanned as the token sequence '"' Ident '"'. 

Use GoTokens to configure the Scanner such that it accepts all Go literal tokens including Go identifiers. Comments will be skipped. 

### <a id="ScanRawStrings" href="#ScanRawStrings">const ScanRawStrings</a>

```
searchKey: scanner.ScanRawStrings
```

```Go
const ScanRawStrings = 1 << -RawString
```

Predefined mode bits to control recognition of tokens. For instance, to configure a Scanner such that it only recognizes (Go) identifiers, integers, and skips comments, set the Scanner's Mode field to: 

```
ScanIdents | ScanInts | SkipComments

```
With the exceptions of comments, which are skipped if SkipComments is set, unrecognized tokens are not ignored. Instead, the scanner simply returns the respective individual characters (or possibly sub-tokens). For instance, if the mode is ScanIdents (not ScanStrings), the string "foo" is scanned as the token sequence '"' Ident '"'. 

Use GoTokens to configure the Scanner such that it accepts all Go literal tokens including Go identifiers. Comments will be skipped. 

### <a id="ScanComments" href="#ScanComments">const ScanComments</a>

```
searchKey: scanner.ScanComments
```

```Go
const ScanComments = 1 << -Comment
```

Predefined mode bits to control recognition of tokens. For instance, to configure a Scanner such that it only recognizes (Go) identifiers, integers, and skips comments, set the Scanner's Mode field to: 

```
ScanIdents | ScanInts | SkipComments

```
With the exceptions of comments, which are skipped if SkipComments is set, unrecognized tokens are not ignored. Instead, the scanner simply returns the respective individual characters (or possibly sub-tokens). For instance, if the mode is ScanIdents (not ScanStrings), the string "foo" is scanned as the token sequence '"' Ident '"'. 

Use GoTokens to configure the Scanner such that it accepts all Go literal tokens including Go identifiers. Comments will be skipped. 

### <a id="SkipComments" href="#SkipComments">const SkipComments</a>

```
searchKey: scanner.SkipComments
```

```Go
const SkipComments = 1 << -skipComment // if set with ScanComments, comments become white space

```

Predefined mode bits to control recognition of tokens. For instance, to configure a Scanner such that it only recognizes (Go) identifiers, integers, and skips comments, set the Scanner's Mode field to: 

```
ScanIdents | ScanInts | SkipComments

```
With the exceptions of comments, which are skipped if SkipComments is set, unrecognized tokens are not ignored. Instead, the scanner simply returns the respective individual characters (or possibly sub-tokens). For instance, if the mode is ScanIdents (not ScanStrings), the string "foo" is scanned as the token sequence '"' Ident '"'. 

Use GoTokens to configure the Scanner such that it accepts all Go literal tokens including Go identifiers. Comments will be skipped. 

### <a id="GoTokens" href="#GoTokens">const GoTokens</a>

```
searchKey: scanner.GoTokens
```

```Go
const GoTokens = ...
```

Predefined mode bits to control recognition of tokens. For instance, to configure a Scanner such that it only recognizes (Go) identifiers, integers, and skips comments, set the Scanner's Mode field to: 

```
ScanIdents | ScanInts | SkipComments

```
With the exceptions of comments, which are skipped if SkipComments is set, unrecognized tokens are not ignored. Instead, the scanner simply returns the respective individual characters (or possibly sub-tokens). For instance, if the mode is ScanIdents (not ScanStrings), the string "foo" is scanned as the token sequence '"' Ident '"'. 

Use GoTokens to configure the Scanner such that it accepts all Go literal tokens including Go identifiers. Comments will be skipped. 

### <a id="EOF" href="#EOF">const EOF</a>

```
searchKey: scanner.EOF
```

```Go
const EOF = -(iota + 1)
```

The result of Scan is one of these tokens or a Unicode character. 

### <a id="Ident" href="#Ident">const Ident</a>

```
searchKey: scanner.Ident
```

```Go
const Ident
```

The result of Scan is one of these tokens or a Unicode character. 

### <a id="Int" href="#Int">const Int</a>

```
searchKey: scanner.Int
```

```Go
const Int
```

The result of Scan is one of these tokens or a Unicode character. 

### <a id="Float" href="#Float">const Float</a>

```
searchKey: scanner.Float
```

```Go
const Float
```

The result of Scan is one of these tokens or a Unicode character. 

### <a id="Char" href="#Char">const Char</a>

```
searchKey: scanner.Char
```

```Go
const Char
```

The result of Scan is one of these tokens or a Unicode character. 

### <a id="String" href="#String">const String</a>

```
searchKey: scanner.String
```

```Go
const String
```

The result of Scan is one of these tokens or a Unicode character. 

### <a id="RawString" href="#RawString">const RawString</a>

```
searchKey: scanner.RawString
```

```Go
const RawString
```

The result of Scan is one of these tokens or a Unicode character. 

### <a id="Comment" href="#Comment">const Comment</a>

```
searchKey: scanner.Comment
```

```Go
const Comment
```

The result of Scan is one of these tokens or a Unicode character. 

### <a id="skipComment" href="#skipComment">const skipComment</a>

```
searchKey: scanner.skipComment
tags: [private]
```

```Go
const skipComment
```

The result of Scan is one of these tokens or a Unicode character. 

internal use only 

### <a id="GoWhitespace" href="#GoWhitespace">const GoWhitespace</a>

```
searchKey: scanner.GoWhitespace
```

```Go
const GoWhitespace = 1<<'\t' | 1<<'\n' | 1<<'\r' | 1<<' '
```

GoWhitespace is the default value for the Scanner's Whitespace field. Its value selects Go's white space characters. 

### <a id="bufLen" href="#bufLen">const bufLen</a>

```
searchKey: scanner.bufLen
tags: [private]
```

```Go
const bufLen = 1024 // at least utf8.UTFMax

```

## <a id="var" href="#var">Variables</a>

### <a id="tokenString" href="#tokenString">var tokenString</a>

```
searchKey: scanner.tokenString
tags: [private]
```

```Go
var tokenString = ...
```

### <a id="segmentList" href="#segmentList">var segmentList</a>

```
searchKey: scanner.segmentList
tags: [private]
```

```Go
var segmentList = ...
```

### <a id="f100" href="#f100">var f100</a>

```
searchKey: scanner.f100
tags: [private]
```

```Go
var f100 = ...
```

### <a id="tokenList" href="#tokenList">var tokenList</a>

```
searchKey: scanner.tokenList
tags: [private]
```

```Go
var tokenList = ...
```

## <a id="type" href="#type">Types</a>

### <a id="Position" href="#Position">type Position struct</a>

```
searchKey: scanner.Position
```

```Go
type Position struct {
	Filename string // filename, if any
	Offset   int    // byte offset, starting at 0
	Line     int    // line number, starting at 1
	Column   int    // column number, starting at 1 (character count per line)
}
```

A source position is represented by a Position value. A position is valid if Line > 0. 

#### <a id="Position.IsValid" href="#Position.IsValid">func (pos *Position) IsValid() bool</a>

```
searchKey: scanner.Position.IsValid
```

```Go
func (pos *Position) IsValid() bool
```

IsValid reports whether the position is valid. 

#### <a id="Position.String" href="#Position.String">func (pos Position) String() string</a>

```
searchKey: scanner.Position.String
```

```Go
func (pos Position) String() string
```

### <a id="Scanner" href="#Scanner">type Scanner struct</a>

```
searchKey: scanner.Scanner
```

```Go
type Scanner struct {
	// Input
	src io.Reader

	// Source buffer
	srcBuf [bufLen + 1]byte // +1 for sentinel for common case of s.next()
	srcPos int              // reading position (srcBuf index)
	srcEnd int              // source end (srcBuf index)

	// Source position
	srcBufOffset int // byte offset of srcBuf[0] in source
	line         int // line count
	column       int // character count
	lastLineLen  int // length of last line in characters (for correct column reporting)
	lastCharLen  int // length of last character in bytes

	// Token text buffer
	// Typically, token text is stored completely in srcBuf, but in general
	// the token text's head may be buffered in tokBuf while the token text's
	// tail is stored in srcBuf.
	tokBuf bytes.Buffer // token text head that is not in srcBuf anymore
	tokPos int          // token text tail position (srcBuf index); valid if >= 0
	tokEnd int          // token text tail end (srcBuf index)

	// One character look-ahead
	ch rune // character before current srcPos

	// Error is called for each error encountered. If no Error
	// function is set, the error is reported to os.Stderr.
	Error func(s *Scanner, msg string)

	// ErrorCount is incremented by one for each error encountered.
	ErrorCount int

	// The Mode field controls which tokens are recognized. For instance,
	// to recognize Ints, set the ScanInts bit in Mode. The field may be
	// changed at any time.
	Mode uint

	// The Whitespace field controls which characters are recognized
	// as white space. To recognize a character ch <= ' ' as white space,
	// set the ch'th bit in Whitespace (the Scanner's behavior is undefined
	// for values ch > ' '). The field may be changed at any time.
	Whitespace uint64

	// IsIdentRune is a predicate controlling the characters accepted
	// as the ith rune in an identifier. The set of valid characters
	// must not intersect with the set of white space characters.
	// If no IsIdentRune function is set, regular Go identifiers are
	// accepted instead. The field may be changed at any time.
	IsIdentRune func(ch rune, i int) bool

	// Start position of most recently scanned token; set by Scan.
	// Calling Init or Next invalidates the position (Line == 0).
	// The Filename field is always left untouched by the Scanner.
	// If an error is reported (via Error) and Position is invalid,
	// the scanner is not inside a token. Call Pos to obtain an error
	// position in that case, or to obtain the position immediately
	// after the most recently scanned token.
	Position
}
```

A Scanner implements reading of Unicode characters and tokens from an io.Reader. 

#### <a id="Scanner.Init" href="#Scanner.Init">func (s *Scanner) Init(src io.Reader) *Scanner</a>

```
searchKey: scanner.Scanner.Init
```

```Go
func (s *Scanner) Init(src io.Reader) *Scanner
```

Init initializes a Scanner with a new source and returns s. Error is set to nil, ErrorCount is set to 0, Mode is set to GoTokens, and Whitespace is set to GoWhitespace. 

#### <a id="Scanner.next" href="#Scanner.next">func (s *Scanner) next() rune</a>

```
searchKey: scanner.Scanner.next
tags: [private]
```

```Go
func (s *Scanner) next() rune
```

next reads and returns the next Unicode character. It is designed such that only a minimal amount of work needs to be done in the common ASCII case (one test to check for both ASCII and end-of-buffer, and one test to check for newlines). 

#### <a id="Scanner.Next" href="#Scanner.Next">func (s *Scanner) Next() rune</a>

```
searchKey: scanner.Scanner.Next
```

```Go
func (s *Scanner) Next() rune
```

Next reads and returns the next Unicode character. It returns EOF at the end of the source. It reports a read error by calling s.Error, if not nil; otherwise it prints an error message to os.Stderr. Next does not update the Scanner's Position field; use Pos() to get the current position. 

#### <a id="Scanner.Peek" href="#Scanner.Peek">func (s *Scanner) Peek() rune</a>

```
searchKey: scanner.Scanner.Peek
```

```Go
func (s *Scanner) Peek() rune
```

Peek returns the next Unicode character in the source without advancing the scanner. It returns EOF if the scanner's position is at the last character of the source. 

#### <a id="Scanner.error" href="#Scanner.error">func (s *Scanner) error(msg string)</a>

```
searchKey: scanner.Scanner.error
tags: [private]
```

```Go
func (s *Scanner) error(msg string)
```

#### <a id="Scanner.errorf" href="#Scanner.errorf">func (s *Scanner) errorf(format string, args ...interface{})</a>

```
searchKey: scanner.Scanner.errorf
tags: [private]
```

```Go
func (s *Scanner) errorf(format string, args ...interface{})
```

#### <a id="Scanner.isIdentRune" href="#Scanner.isIdentRune">func (s *Scanner) isIdentRune(ch rune, i int) bool</a>

```
searchKey: scanner.Scanner.isIdentRune
tags: [private]
```

```Go
func (s *Scanner) isIdentRune(ch rune, i int) bool
```

#### <a id="Scanner.scanIdentifier" href="#Scanner.scanIdentifier">func (s *Scanner) scanIdentifier() rune</a>

```
searchKey: scanner.Scanner.scanIdentifier
tags: [private]
```

```Go
func (s *Scanner) scanIdentifier() rune
```

#### <a id="Scanner.digits" href="#Scanner.digits">func (s *Scanner) digits(ch0 rune, base int, invalid *rune) (ch rune, digsep int)</a>

```
searchKey: scanner.Scanner.digits
tags: [private]
```

```Go
func (s *Scanner) digits(ch0 rune, base int, invalid *rune) (ch rune, digsep int)
```

digits accepts the sequence { digit | '_' } starting with ch0. If base <= 10, digits accepts any decimal digit but records the first invalid digit >= base in *invalid if *invalid == 0. digits returns the first rune that is not part of the sequence anymore, and a bitset describing whether the sequence contained digits (bit 0 is set), or separators '_' (bit 1 is set). 

#### <a id="Scanner.scanNumber" href="#Scanner.scanNumber">func (s *Scanner) scanNumber(ch rune, seenDot bool) (rune, rune)</a>

```
searchKey: scanner.Scanner.scanNumber
tags: [private]
```

```Go
func (s *Scanner) scanNumber(ch rune, seenDot bool) (rune, rune)
```

#### <a id="Scanner.scanDigits" href="#Scanner.scanDigits">func (s *Scanner) scanDigits(ch rune, base, n int) rune</a>

```
searchKey: scanner.Scanner.scanDigits
tags: [private]
```

```Go
func (s *Scanner) scanDigits(ch rune, base, n int) rune
```

#### <a id="Scanner.scanEscape" href="#Scanner.scanEscape">func (s *Scanner) scanEscape(quote rune) rune</a>

```
searchKey: scanner.Scanner.scanEscape
tags: [private]
```

```Go
func (s *Scanner) scanEscape(quote rune) rune
```

#### <a id="Scanner.scanString" href="#Scanner.scanString">func (s *Scanner) scanString(quote rune) (n int)</a>

```
searchKey: scanner.Scanner.scanString
tags: [private]
```

```Go
func (s *Scanner) scanString(quote rune) (n int)
```

#### <a id="Scanner.scanRawString" href="#Scanner.scanRawString">func (s *Scanner) scanRawString()</a>

```
searchKey: scanner.Scanner.scanRawString
tags: [private]
```

```Go
func (s *Scanner) scanRawString()
```

#### <a id="Scanner.scanChar" href="#Scanner.scanChar">func (s *Scanner) scanChar()</a>

```
searchKey: scanner.Scanner.scanChar
tags: [private]
```

```Go
func (s *Scanner) scanChar()
```

#### <a id="Scanner.scanComment" href="#Scanner.scanComment">func (s *Scanner) scanComment(ch rune) rune</a>

```
searchKey: scanner.Scanner.scanComment
tags: [private]
```

```Go
func (s *Scanner) scanComment(ch rune) rune
```

#### <a id="Scanner.Scan" href="#Scanner.Scan">func (s *Scanner) Scan() rune</a>

```
searchKey: scanner.Scanner.Scan
```

```Go
func (s *Scanner) Scan() rune
```

Scan reads the next token or Unicode character from source and returns it. It only recognizes tokens t for which the respective Mode bit (1<<-t) is set. It returns EOF at the end of the source. It reports scanner errors (read and token errors) by calling s.Error, if not nil; otherwise it prints an error message to os.Stderr. 

#### <a id="Scanner.Pos" href="#Scanner.Pos">func (s *Scanner) Pos() (pos Position)</a>

```
searchKey: scanner.Scanner.Pos
```

```Go
func (s *Scanner) Pos() (pos Position)
```

Pos returns the position of the character immediately after the character or token returned by the last call to Next or Scan. Use the Scanner's Position field for the start position of the most recently scanned token. 

#### <a id="Scanner.TokenText" href="#Scanner.TokenText">func (s *Scanner) TokenText() string</a>

```
searchKey: scanner.Scanner.TokenText
```

```Go
func (s *Scanner) TokenText() string
```

TokenText returns the string corresponding to the most recently scanned token. Valid after calling Scan and in calls of Scanner.Error. 

### <a id="StringReader" href="#StringReader">type StringReader struct</a>

```
searchKey: scanner.StringReader
tags: [private]
```

```Go
type StringReader struct {
	data []string
	step int
}
```

A StringReader delivers its data one string segment at a time via Read. 

#### <a id="StringReader.Read" href="#StringReader.Read">func (r *StringReader) Read(p []byte) (n int, err error)</a>

```
searchKey: scanner.StringReader.Read
tags: [private]
```

```Go
func (r *StringReader) Read(p []byte) (n int, err error)
```

### <a id="token" href="#token">type token struct</a>

```
searchKey: scanner.token
tags: [private]
```

```Go
type token struct {
	tok  rune
	text string
}
```

### <a id="errReader" href="#errReader">type errReader struct{}</a>

```
searchKey: scanner.errReader
tags: [private]
```

```Go
type errReader struct{}
```

An errReader returns (0, err) where err is not io.EOF. 

#### <a id="errReader.Read" href="#errReader.Read">func (errReader) Read(b []byte) (int, error)</a>

```
searchKey: scanner.errReader.Read
tags: [private]
```

```Go
func (errReader) Read(b []byte) (int, error)
```

### <a id="countReader" href="#countReader">type countReader int</a>

```
searchKey: scanner.countReader
tags: [private]
```

```Go
type countReader int
```

#### <a id="countReader.Read" href="#countReader.Read">func (r *countReader) Read([]byte) (int, error)</a>

```
searchKey: scanner.countReader.Read
tags: [private]
```

```Go
func (r *countReader) Read([]byte) (int, error)
```

## <a id="func" href="#func">Functions</a>

### <a id="TokenString" href="#TokenString">func TokenString(tok rune) string</a>

```
searchKey: scanner.TokenString
```

```Go
func TokenString(tok rune) string
```

TokenString returns a printable string for a token or Unicode character. 

### <a id="lower" href="#lower">func lower(ch rune) rune</a>

```
searchKey: scanner.lower
tags: [private]
```

```Go
func lower(ch rune) rune
```

### <a id="isDecimal" href="#isDecimal">func isDecimal(ch rune) bool</a>

```
searchKey: scanner.isDecimal
tags: [private]
```

```Go
func isDecimal(ch rune) bool
```

### <a id="isHex" href="#isHex">func isHex(ch rune) bool</a>

```
searchKey: scanner.isHex
tags: [private]
```

```Go
func isHex(ch rune) bool
```

### <a id="litname" href="#litname">func litname(prefix rune) string</a>

```
searchKey: scanner.litname
tags: [private]
```

```Go
func litname(prefix rune) string
```

### <a id="invalidSep" href="#invalidSep">func invalidSep(x string) int</a>

```
searchKey: scanner.invalidSep
tags: [private]
```

```Go
func invalidSep(x string) int
```

invalidSep returns the index of the first invalid separator in x, or -1. 

### <a id="digitVal" href="#digitVal">func digitVal(ch rune) int</a>

```
searchKey: scanner.digitVal
tags: [private]
```

```Go
func digitVal(ch rune) int
```

### <a id="readRuneSegments" href="#readRuneSegments">func readRuneSegments(t *testing.T, segments []string)</a>

```
searchKey: scanner.readRuneSegments
tags: [private]
```

```Go
func readRuneSegments(t *testing.T, segments []string)
```

### <a id="TestNext" href="#TestNext">func TestNext(t *testing.T)</a>

```
searchKey: scanner.TestNext
tags: [private]
```

```Go
func TestNext(t *testing.T)
```

### <a id="makeSource" href="#makeSource">func makeSource(pattern string) *bytes.Buffer</a>

```
searchKey: scanner.makeSource
tags: [private]
```

```Go
func makeSource(pattern string) *bytes.Buffer
```

### <a id="checkTok" href="#checkTok">func checkTok(t *testing.T, s *Scanner, line int, got, want rune, text string)</a>

```
searchKey: scanner.checkTok
tags: [private]
```

```Go
func checkTok(t *testing.T, s *Scanner, line int, got, want rune, text string)
```

### <a id="checkTokErr" href="#checkTokErr">func checkTokErr(t *testing.T, s *Scanner, line int, want rune, text string)</a>

```
searchKey: scanner.checkTokErr
tags: [private]
```

```Go
func checkTokErr(t *testing.T, s *Scanner, line int, want rune, text string)
```

### <a id="countNewlines" href="#countNewlines">func countNewlines(s string) int</a>

```
searchKey: scanner.countNewlines
tags: [private]
```

```Go
func countNewlines(s string) int
```

### <a id="testScan" href="#testScan">func testScan(t *testing.T, mode uint)</a>

```
searchKey: scanner.testScan
tags: [private]
```

```Go
func testScan(t *testing.T, mode uint)
```

### <a id="TestScan" href="#TestScan">func TestScan(t *testing.T)</a>

```
searchKey: scanner.TestScan
tags: [private]
```

```Go
func TestScan(t *testing.T)
```

### <a id="TestInvalidExponent" href="#TestInvalidExponent">func TestInvalidExponent(t *testing.T)</a>

```
searchKey: scanner.TestInvalidExponent
tags: [private]
```

```Go
func TestInvalidExponent(t *testing.T)
```

### <a id="TestPosition" href="#TestPosition">func TestPosition(t *testing.T)</a>

```
searchKey: scanner.TestPosition
tags: [private]
```

```Go
func TestPosition(t *testing.T)
```

### <a id="TestScanZeroMode" href="#TestScanZeroMode">func TestScanZeroMode(t *testing.T)</a>

```
searchKey: scanner.TestScanZeroMode
tags: [private]
```

```Go
func TestScanZeroMode(t *testing.T)
```

### <a id="testScanSelectedMode" href="#testScanSelectedMode">func testScanSelectedMode(t *testing.T, mode uint, class rune)</a>

```
searchKey: scanner.testScanSelectedMode
tags: [private]
```

```Go
func testScanSelectedMode(t *testing.T, mode uint, class rune)
```

### <a id="TestScanSelectedMask" href="#TestScanSelectedMask">func TestScanSelectedMask(t *testing.T)</a>

```
searchKey: scanner.TestScanSelectedMask
tags: [private]
```

```Go
func TestScanSelectedMask(t *testing.T)
```

### <a id="TestScanCustomIdent" href="#TestScanCustomIdent">func TestScanCustomIdent(t *testing.T)</a>

```
searchKey: scanner.TestScanCustomIdent
tags: [private]
```

```Go
func TestScanCustomIdent(t *testing.T)
```

### <a id="TestScanNext" href="#TestScanNext">func TestScanNext(t *testing.T)</a>

```
searchKey: scanner.TestScanNext
tags: [private]
```

```Go
func TestScanNext(t *testing.T)
```

### <a id="TestScanWhitespace" href="#TestScanWhitespace">func TestScanWhitespace(t *testing.T)</a>

```
searchKey: scanner.TestScanWhitespace
tags: [private]
```

```Go
func TestScanWhitespace(t *testing.T)
```

### <a id="testError" href="#testError">func testError(t *testing.T, src, pos, msg string, tok rune)</a>

```
searchKey: scanner.testError
tags: [private]
```

```Go
func testError(t *testing.T, src, pos, msg string, tok rune)
```

### <a id="TestError" href="#TestError">func TestError(t *testing.T)</a>

```
searchKey: scanner.TestError
tags: [private]
```

```Go
func TestError(t *testing.T)
```

### <a id="TestIOError" href="#TestIOError">func TestIOError(t *testing.T)</a>

```
searchKey: scanner.TestIOError
tags: [private]
```

```Go
func TestIOError(t *testing.T)
```

### <a id="checkPos" href="#checkPos">func checkPos(t *testing.T, got, want Position)</a>

```
searchKey: scanner.checkPos
tags: [private]
```

```Go
func checkPos(t *testing.T, got, want Position)
```

### <a id="checkNextPos" href="#checkNextPos">func checkNextPos(t *testing.T, s *Scanner, offset, line, column int, char rune)</a>

```
searchKey: scanner.checkNextPos
tags: [private]
```

```Go
func checkNextPos(t *testing.T, s *Scanner, offset, line, column int, char rune)
```

### <a id="checkScanPos" href="#checkScanPos">func checkScanPos(t *testing.T, s *Scanner, offset, line, column int, char rune)</a>

```
searchKey: scanner.checkScanPos
tags: [private]
```

```Go
func checkScanPos(t *testing.T, s *Scanner, offset, line, column int, char rune)
```

### <a id="TestPos" href="#TestPos">func TestPos(t *testing.T)</a>

```
searchKey: scanner.TestPos
tags: [private]
```

```Go
func TestPos(t *testing.T)
```

### <a id="TestNextEOFHandling" href="#TestNextEOFHandling">func TestNextEOFHandling(t *testing.T)</a>

```
searchKey: scanner.TestNextEOFHandling
tags: [private]
```

```Go
func TestNextEOFHandling(t *testing.T)
```

### <a id="TestScanEOFHandling" href="#TestScanEOFHandling">func TestScanEOFHandling(t *testing.T)</a>

```
searchKey: scanner.TestScanEOFHandling
tags: [private]
```

```Go
func TestScanEOFHandling(t *testing.T)
```

### <a id="TestIssue29723" href="#TestIssue29723">func TestIssue29723(t *testing.T)</a>

```
searchKey: scanner.TestIssue29723
tags: [private]
```

```Go
func TestIssue29723(t *testing.T)
```

### <a id="TestNumbers" href="#TestNumbers">func TestNumbers(t *testing.T)</a>

```
searchKey: scanner.TestNumbers
tags: [private]
```

```Go
func TestNumbers(t *testing.T)
```

### <a id="TestIssue30320" href="#TestIssue30320">func TestIssue30320(t *testing.T)</a>

```
searchKey: scanner.TestIssue30320
tags: [private]
```

```Go
func TestIssue30320(t *testing.T)
```

### <a id="extractInts" href="#extractInts">func extractInts(t string, mode uint) (res string)</a>

```
searchKey: scanner.extractInts
tags: [private]
```

```Go
func extractInts(t string, mode uint) (res string)
```

