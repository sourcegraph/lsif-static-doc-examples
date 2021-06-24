# Package syntax

Package syntax parses regular expressions into parse trees and compiles parse trees into programs. Most clients of regular expressions will use the facilities of package regexp (such as Compile and Match) instead of this package. 

### hdr-SyntaxSyntax
The regular expression syntax understood by this package when parsing with the Perl flag is as follows. Parts of the syntax can be disabled by passing alternate flags to Parse. 

Single characters: 

```
.              any character, possibly including newline (flag s=true)
[xyz]          character class
[^xyz]         negated character class
\d             Perl character class
\D             negated Perl character class
[[:alpha:]]    ASCII character class
[[:^alpha:]]   negated ASCII character class
\pN            Unicode character class (one-letter name)
\p{Greek}      Unicode character class
\PN            negated Unicode character class (one-letter name)
\P{Greek}      negated Unicode character class

```
Composites: 

```
xy             x followed by y
x|y            x or y (prefer x)

```
Repetitions: 

```
x*             zero or more x, prefer more
x+             one or more x, prefer more
x?             zero or one x, prefer one
x{n,m}         n or n+1 or ... or m x, prefer more
x{n,}          n or more x, prefer more
x{n}           exactly n x
x*?            zero or more x, prefer fewer
x+?            one or more x, prefer fewer
x??            zero or one x, prefer zero
x{n,m}?        n or n+1 or ... or m x, prefer fewer
x{n,}?         n or more x, prefer fewer
x{n}?          exactly n x

```
Implementation restriction: The counting forms x{n,m}, x{n,}, and x{n} reject forms that create a minimum or maximum repetition count above 1000. Unlimited repetitions are not subject to this restriction. 

Grouping: 

```
(re)           numbered capturing group (submatch)
(?P<name>re)   named & numbered capturing group (submatch)
(?:re)         non-capturing group
(?flags)       set flags within current group; non-capturing
(?flags:re)    set flags during re; non-capturing

Flag syntax is xyz (set) or -xyz (clear) or xy-z (set xy, clear z). The flags are:

i              case-insensitive (default false)
m              multi-line mode: ^ and $ match begin/end line in addition to begin/end text (default false)
s              let . match \n (default false)
U              ungreedy: swap meaning of x* and x*?, x+ and x+?, etc (default false)

```
Empty strings: 

```
^              at beginning of text or line (flag m=true)
$              at end of text (like \z not \Z) or line (flag m=true)
\A             at beginning of text
\b             at ASCII word boundary (\w on one side and \W, \A, or \z on the other)
\B             not at ASCII word boundary
\z             at end of text

```
Escape sequences: 

```
\a             bell (== \007)
\f             form feed (== \014)
\t             horizontal tab (== \011)
\n             newline (== \012)
\r             carriage return (== \015)
\v             vertical tab character (== \013)
\*             literal *, for any punctuation character *
\123           octal character code (up to three digits)
\x7F           hex character code (exactly two digits)
\x{10FFFF}     hex character code
\Q...\E        literal text ... even if ... has punctuation

```
Character class elements: 

```
x              single character
A-Z            character range (inclusive)
\d             Perl character class
[:foo:]        ASCII character class foo
\p{Foo}        Unicode character class Foo
\pF            Unicode character class F (one-letter name)

```
Named character classes as character class elements: 

```
[\d]           digits (== \d)
[^\d]          not digits (== \D)
[\D]           not digits (== \D)
[^\D]          not not digits (== \d)
[[:name:]]     named ASCII class inside character class (== [:name:])
[^[:name:]]    named ASCII class inside negated character class (== [:^name:])
[\p{Name}]     named Unicode property inside character class (== \p{Name})
[^\p{Name}]    named Unicode property inside negated character class (== \P{Name})

```
Perl character classes (all ASCII-only): 

```
\d             digits (== [0-9])
\D             not digits (== [^0-9])
\s             whitespace (== [\t\n\f\r ])
\S             not whitespace (== [^\t\n\f\r ])
\w             word characters (== [0-9A-Za-z_])
\W             not word characters (== [^0-9A-Za-z_])

```
ASCII character classes: 

```
[[:alnum:]]    alphanumeric (== [0-9A-Za-z])
[[:alpha:]]    alphabetic (== [A-Za-z])
[[:ascii:]]    ASCII (== [\x00-\x7F])
[[:blank:]]    blank (== [\t ])
[[:cntrl:]]    control (== [\x00-\x1F\x7F])
[[:digit:]]    digits (== [0-9])
[[:graph:]]    graphical (== [!-~] == [A-Za-z0-9!"#$%&'()*+,\-./:;<=>?@[\\\]^_`{|}~])
[[:lower:]]    lower case (== [a-z])
[[:print:]]    printable (== [ -~] == [ [:graph:]])
[[:punct:]]    punctuation (== [!-/:-@[-`{-~])
[[:space:]]    whitespace (== [\t\n\v\f\r ])
[[:upper:]]    upper case (== [A-Z])
[[:word:]]     word characters (== [0-9A-Za-z_])
[[:xdigit:]]   hex digit (== [0-9A-Fa-f])

```
Unicode character classes are those in unicode.Categories and unicode.Scripts. 

## Index

* [Constants](#const)
    * [const ClassNL](#ClassNL)
    * [const DotNL](#DotNL)
    * [const EmptyBeginLine](#EmptyBeginLine)
    * [const EmptyBeginText](#EmptyBeginText)
    * [const EmptyEndLine](#EmptyEndLine)
    * [const EmptyEndText](#EmptyEndText)
    * [const EmptyNoWordBoundary](#EmptyNoWordBoundary)
    * [const EmptyWordBoundary](#EmptyWordBoundary)
    * [const ErrInternalError](#ErrInternalError)
    * [const ErrInvalidCharClass](#ErrInvalidCharClass)
    * [const ErrInvalidCharRange](#ErrInvalidCharRange)
    * [const ErrInvalidEscape](#ErrInvalidEscape)
    * [const ErrInvalidNamedCapture](#ErrInvalidNamedCapture)
    * [const ErrInvalidPerlOp](#ErrInvalidPerlOp)
    * [const ErrInvalidRepeatOp](#ErrInvalidRepeatOp)
    * [const ErrInvalidRepeatSize](#ErrInvalidRepeatSize)
    * [const ErrInvalidUTF8](#ErrInvalidUTF8)
    * [const ErrMissingBracket](#ErrMissingBracket)
    * [const ErrMissingParen](#ErrMissingParen)
    * [const ErrMissingRepeatArgument](#ErrMissingRepeatArgument)
    * [const ErrTrailingBackslash](#ErrTrailingBackslash)
    * [const ErrUnexpectedParen](#ErrUnexpectedParen)
    * [const FoldCase](#FoldCase)
    * [const InstAlt](#InstAlt)
    * [const InstAltMatch](#InstAltMatch)
    * [const InstCapture](#InstCapture)
    * [const InstEmptyWidth](#InstEmptyWidth)
    * [const InstFail](#InstFail)
    * [const InstMatch](#InstMatch)
    * [const InstNop](#InstNop)
    * [const InstRune](#InstRune)
    * [const InstRune1](#InstRune1)
    * [const InstRuneAny](#InstRuneAny)
    * [const InstRuneAnyNotNL](#InstRuneAnyNotNL)
    * [const Literal](#Literal)
    * [const MatchNL](#MatchNL)
    * [const NonGreedy](#NonGreedy)
    * [const OneLine](#OneLine)
    * [const OpAlternate](#OpAlternate)
    * [const OpAnyChar](#OpAnyChar)
    * [const OpAnyCharNotNL](#OpAnyCharNotNL)
    * [const OpBeginLine](#OpBeginLine)
    * [const OpBeginText](#OpBeginText)
    * [const OpCapture](#OpCapture)
    * [const OpCharClass](#OpCharClass)
    * [const OpConcat](#OpConcat)
    * [const OpEmptyMatch](#OpEmptyMatch)
    * [const OpEndLine](#OpEndLine)
    * [const OpEndText](#OpEndText)
    * [const OpLiteral](#OpLiteral)
    * [const OpNoMatch](#OpNoMatch)
    * [const OpNoWordBoundary](#OpNoWordBoundary)
    * [const OpPlus](#OpPlus)
    * [const OpQuest](#OpQuest)
    * [const OpRepeat](#OpRepeat)
    * [const OpStar](#OpStar)
    * [const OpWordBoundary](#OpWordBoundary)
    * [const POSIX](#POSIX)
    * [const Perl](#Perl)
    * [const PerlX](#PerlX)
    * [const Simple](#Simple)
    * [const UnicodeGroups](#UnicodeGroups)
    * [const WasDollar](#WasDollar)
    * [const maxFold](#maxFold)
    * [const meta](#meta)
    * [const minFold](#minFold)
    * [const noMatch](#noMatch)
    * [const opLeftParen](#opLeftParen)
    * [const opPseudo](#opPseudo)
    * [const opVerticalBar](#opVerticalBar)
    * [const testFlags](#testFlags)
    * [const _Op_name_0](#_Op_name_0)
    * [const _Op_name_1](#_Op_name_1)
* [Variables](#var)
    * [var anyRune](#anyRune)
    * [var anyRuneNotNL](#anyRuneNotNL)
    * [var anyTable](#anyTable)
    * [var code1](#code1)
    * [var code10](#code10)
    * [var code11](#code11)
    * [var code12](#code12)
    * [var code13](#code13)
    * [var code14](#code14)
    * [var code15](#code15)
    * [var code16](#code16)
    * [var code17](#code17)
    * [var code2](#code2)
    * [var code3](#code3)
    * [var code4](#code4)
    * [var code5](#code5)
    * [var code6](#code6)
    * [var code7](#code7)
    * [var code8](#code8)
    * [var code9](#code9)
    * [var compileTests](#compileTests)
    * [var foldcaseTests](#foldcaseTests)
    * [var instOpNames](#instOpNames)
    * [var invalidRegexps](#invalidRegexps)
    * [var literalTests](#literalTests)
    * [var matchnlTests](#matchnlTests)
    * [var nomatchnlTests](#nomatchnlTests)
    * [var onlyPOSIX](#onlyPOSIX)
    * [var onlyPerl](#onlyPerl)
    * [var opNames](#opNames)
    * [var parseTests](#parseTests)
    * [var perlGroup](#perlGroup)
    * [var posixGroup](#posixGroup)
    * [var simplifyTests](#simplifyTests)
    * [var _Op_index_0](#_Op_index_0)
* [Types](#type)
    * [type EmptyOp uint8](#EmptyOp)
        * [func EmptyOpContext(r1, r2 rune) EmptyOp](#EmptyOpContext)
    * [type Error struct](#Error)
        * [func (e *Error) Error() string](#Error.Error)
    * [type ErrorCode string](#ErrorCode)
        * [func (e ErrorCode) String() string](#ErrorCode.String)
    * [type Flags uint16](#Flags)
    * [type Inst struct](#Inst)
        * [func (i *Inst) MatchEmptyWidth(before rune, after rune) bool](#Inst.MatchEmptyWidth)
        * [func (i *Inst) MatchRune(r rune) bool](#Inst.MatchRune)
        * [func (i *Inst) MatchRunePos(r rune) int](#Inst.MatchRunePos)
        * [func (i *Inst) String() string](#Inst.String)
        * [func (i *Inst) op() InstOp](#Inst.op)
    * [type InstOp uint8](#InstOp)
        * [func (i InstOp) String() string](#InstOp.String)
    * [type Op uint8](#Op)
        * [func (i Op) String() string](#Op.String)
    * [type Prog struct](#Prog)
        * [func Compile(re *Regexp) (*Prog, error)](#Compile)
        * [func (p *Prog) Prefix() (prefix string, complete bool)](#Prog.Prefix)
        * [func (p *Prog) StartCond() EmptyOp](#Prog.StartCond)
        * [func (p *Prog) String() string](#Prog.String)
        * [func (p *Prog) skipNop(pc uint32) *Inst](#Prog.skipNop)
    * [type Regexp struct](#Regexp)
        * [func Parse(s string, flags Flags) (*Regexp, error)](#Parse)
        * [func literalRegexp(s string, flags Flags) *Regexp](#literalRegexp)
        * [func simplify1(op Op, flags Flags, sub, re *Regexp) *Regexp](#simplify1)
        * [func (re *Regexp) CapNames() []string](#Regexp.CapNames)
        * [func (x *Regexp) Equal(y *Regexp) bool](#Regexp.Equal)
        * [func (re *Regexp) MaxCap() int](#Regexp.MaxCap)
        * [func (re *Regexp) Simplify() *Regexp](#Regexp.Simplify)
        * [func (re *Regexp) String() string](#Regexp.String)
        * [func (re *Regexp) capNames(names []string)](#Regexp.capNames)
    * [type charGroup struct](#charGroup)
    * [type compiler struct](#compiler)
        * [func (c *compiler) alt(f1, f2 frag) frag](#compiler.alt)
        * [func (c *compiler) cap(arg uint32) frag](#compiler.cap)
        * [func (c *compiler) cat(f1, f2 frag) frag](#compiler.cat)
        * [func (c *compiler) compile(re *Regexp) frag](#compiler.compile)
        * [func (c *compiler) empty(op EmptyOp) frag](#compiler.empty)
        * [func (c *compiler) fail() frag](#compiler.fail)
        * [func (c *compiler) init()](#compiler.init.compile.go)
        * [func (c *compiler) inst(op InstOp) frag](#compiler.inst)
        * [func (c *compiler) loop(f1 frag, nongreedy bool) frag](#compiler.loop)
        * [func (c *compiler) nop() frag](#compiler.nop)
        * [func (c *compiler) plus(f1 frag, nongreedy bool) frag](#compiler.plus)
        * [func (c *compiler) quest(f1 frag, nongreedy bool) frag](#compiler.quest)
        * [func (c *compiler) rune(r []rune, flags Flags) frag](#compiler.rune)
        * [func (c *compiler) star(f1 frag, nongreedy bool) frag](#compiler.star)
    * [type frag struct](#frag)
    * [type parseTest struct](#parseTest)
    * [type parser struct](#parser)
        * [func (p *parser) alternate() *Regexp](#parser.alternate)
        * [func (p *parser) appendGroup(r []rune, g charGroup) []rune](#parser.appendGroup)
        * [func (p *parser) collapse(subs []*Regexp, op Op) *Regexp](#parser.collapse)
        * [func (p *parser) concat() *Regexp](#parser.concat)
        * [func (p *parser) factor(sub []*Regexp) []*Regexp](#parser.factor)
        * [func (p *parser) leadingRegexp(re *Regexp) *Regexp](#parser.leadingRegexp)
        * [func (p *parser) leadingString(re *Regexp) ([]rune, Flags)](#parser.leadingString)
        * [func (p *parser) literal(r rune)](#parser.literal)
        * [func (p *parser) maybeConcat(r rune, flags Flags) bool](#parser.maybeConcat)
        * [func (p *parser) newRegexp(op Op) *Regexp](#parser.newRegexp)
        * [func (p *parser) op(op Op) *Regexp](#parser.op)
        * [func (p *parser) parseClass(s string) (rest string, err error)](#parser.parseClass)
        * [func (p *parser) parseClassChar(s, wholeClass string) (r rune, rest string, err error)](#parser.parseClassChar)
        * [func (p *parser) parseEscape(s string) (r rune, rest string, err error)](#parser.parseEscape)
        * [func (p *parser) parseInt(s string) (n int, rest string, ok bool)](#parser.parseInt)
        * [func (p *parser) parseNamedClass(s string, r []rune) (out []rune, rest string, err error)](#parser.parseNamedClass)
        * [func (p *parser) parsePerlClassEscape(s string, r []rune) (out []rune, rest string)](#parser.parsePerlClassEscape)
        * [func (p *parser) parsePerlFlags(s string) (rest string, err error)](#parser.parsePerlFlags)
        * [func (p *parser) parseRepeat(s string) (min, max int, rest string, ok bool)](#parser.parseRepeat)
        * [func (p *parser) parseRightParen() error](#parser.parseRightParen)
        * [func (p *parser) parseUnicodeClass(s string, r []rune) (out []rune, rest string, err error)](#parser.parseUnicodeClass)
        * [func (p *parser) parseVerticalBar() error](#parser.parseVerticalBar)
        * [func (p *parser) push(re *Regexp) *Regexp](#parser.push)
        * [func (p *parser) removeLeadingRegexp(re *Regexp, reuse bool) *Regexp](#parser.removeLeadingRegexp)
        * [func (p *parser) removeLeadingString(re *Regexp, n int) *Regexp](#parser.removeLeadingString)
        * [func (p *parser) repeat(op Op, min, max int, before, after, lastRepeat string) (string, error)](#parser.repeat)
        * [func (p *parser) reuse(re *Regexp)](#parser.reuse)
        * [func (p *parser) swapVerticalBar() bool](#parser.swapVerticalBar)
    * [type patchList struct](#patchList)
        * [func makePatchList(n uint32) patchList](#makePatchList)
        * [func (l1 patchList) append(p *Prog, l2 patchList) patchList](#patchList.append)
        * [func (l patchList) patch(p *Prog, val uint32)](#patchList.patch)
    * [type ranges struct](#ranges)
        * [func (ra ranges) Len() int](#ranges.Len)
        * [func (ra ranges) Less(i, j int) bool](#ranges.Less)
        * [func (ra ranges) Swap(i, j int)](#ranges.Swap)
* [Functions](#func)
    * [func BenchmarkEmptyOpContext(b *testing.B)](#BenchmarkEmptyOpContext)
    * [func IsWordChar(r rune) bool](#IsWordChar)
    * [func TestAppendRangeCollapse(t *testing.T)](#TestAppendRangeCollapse)
    * [func TestCompile(t *testing.T)](#TestCompile)
    * [func TestFoldConstants(t *testing.T)](#TestFoldConstants)
    * [func TestParseFoldCase(t *testing.T)](#TestParseFoldCase)
    * [func TestParseInvalidRegexps(t *testing.T)](#TestParseInvalidRegexps)
    * [func TestParseLiteral(t *testing.T)](#TestParseLiteral)
    * [func TestParseMatchNL(t *testing.T)](#TestParseMatchNL)
    * [func TestParseNoMatchNL(t *testing.T)](#TestParseNoMatchNL)
    * [func TestParseSimple(t *testing.T)](#TestParseSimple)
    * [func TestSimplify(t *testing.T)](#TestSimplify)
    * [func TestToStringEquivalentParse(t *testing.T)](#TestToStringEquivalentParse)
    * [func appendClass(r []rune, x []rune) []rune](#appendClass)
    * [func appendFoldedClass(r []rune, x []rune) []rune](#appendFoldedClass)
    * [func appendFoldedRange(r []rune, lo, hi rune) []rune](#appendFoldedRange)
    * [func appendLiteral(r []rune, x rune, flags Flags) []rune](#appendLiteral)
    * [func appendNegatedClass(r []rune, x []rune) []rune](#appendNegatedClass)
    * [func appendNegatedTable(r []rune, x *unicode.RangeTable) []rune](#appendNegatedTable)
    * [func appendRange(r []rune, lo, hi rune) []rune](#appendRange)
    * [func appendTable(r []rune, x *unicode.RangeTable) []rune](#appendTable)
    * [func bw(b *strings.Builder, args ...string)](#bw)
    * [func checkUTF8(s string) error](#checkUTF8)
    * [func cleanAlt(re *Regexp)](#cleanAlt)
    * [func cleanClass(rp *[]rune) []rune](#cleanClass)
    * [func dump(re *Regexp) string](#dump)
    * [func dumpInst(b *strings.Builder, i *Inst)](#dumpInst)
    * [func dumpProg(b *strings.Builder, p *Prog)](#dumpProg)
    * [func dumpRegexp(b *strings.Builder, re *Regexp)](#dumpRegexp)
    * [func escape(b *strings.Builder, r rune, force bool)](#escape)
    * [func isCharClass(re *Regexp) bool](#isCharClass)
    * [func isUpperFold(r rune) bool](#isUpperFold)
    * [func isValidCaptureName(name string) bool](#isValidCaptureName)
    * [func isalnum(c rune) bool](#isalnum)
    * [func matchRune(re *Regexp, r rune) bool](#matchRune)
    * [func mergeCharClass(dst, src *Regexp)](#mergeCharClass)
    * [func minFoldRune(r rune) rune](#minFoldRune)
    * [func mkCharClass(f func(rune) bool) string](#mkCharClass)
    * [func negateClass(r []rune) []rune](#negateClass)
    * [func nextRune(s string) (c rune, t string, err error)](#nextRune)
    * [func repeatIsValid(re *Regexp, n int) bool](#repeatIsValid)
    * [func testParseDump(t *testing.T, tests []parseTest, flags Flags)](#testParseDump)
    * [func u32(i uint32) string](#u32)
    * [func unhex(c rune) rune](#unhex)
    * [func unicodeTable(name string) (*unicode.RangeTable, *unicode.RangeTable)](#unicodeTable)
    * [func writeRegexp(b *strings.Builder, re *Regexp)](#writeRegexp)


## <a id="const" href="#const">Constants</a>

```
tags: [package]
```

### <a id="ClassNL" href="#ClassNL">const ClassNL</a>

```
searchKey: syntax.ClassNL
tags: [constant number]
```

```Go
const ClassNL // allow character classes like [^a-z] and [[:space:]] to match newline

```

### <a id="DotNL" href="#DotNL">const DotNL</a>

```
searchKey: syntax.DotNL
tags: [constant number]
```

```Go
const DotNL // allow . to match newline

```

### <a id="EmptyBeginLine" href="#EmptyBeginLine">const EmptyBeginLine</a>

```
searchKey: syntax.EmptyBeginLine
tags: [constant number]
```

```Go
const EmptyBeginLine EmptyOp = 1 << iota
```

### <a id="EmptyBeginText" href="#EmptyBeginText">const EmptyBeginText</a>

```
searchKey: syntax.EmptyBeginText
tags: [constant number]
```

```Go
const EmptyBeginText
```

### <a id="EmptyEndLine" href="#EmptyEndLine">const EmptyEndLine</a>

```
searchKey: syntax.EmptyEndLine
tags: [constant number]
```

```Go
const EmptyEndLine
```

### <a id="EmptyEndText" href="#EmptyEndText">const EmptyEndText</a>

```
searchKey: syntax.EmptyEndText
tags: [constant number]
```

```Go
const EmptyEndText
```

### <a id="EmptyNoWordBoundary" href="#EmptyNoWordBoundary">const EmptyNoWordBoundary</a>

```
searchKey: syntax.EmptyNoWordBoundary
tags: [constant number]
```

```Go
const EmptyNoWordBoundary
```

### <a id="EmptyWordBoundary" href="#EmptyWordBoundary">const EmptyWordBoundary</a>

```
searchKey: syntax.EmptyWordBoundary
tags: [constant number]
```

```Go
const EmptyWordBoundary
```

### <a id="ErrInternalError" href="#ErrInternalError">const ErrInternalError</a>

```
searchKey: syntax.ErrInternalError
tags: [constant string]
```

```Go
const ErrInternalError ErrorCode = "regexp/syntax: internal error"
```

Unexpected error 

### <a id="ErrInvalidCharClass" href="#ErrInvalidCharClass">const ErrInvalidCharClass</a>

```
searchKey: syntax.ErrInvalidCharClass
tags: [constant string]
```

```Go
const ErrInvalidCharClass ErrorCode = "invalid character class"
```

Parse errors 

### <a id="ErrInvalidCharRange" href="#ErrInvalidCharRange">const ErrInvalidCharRange</a>

```
searchKey: syntax.ErrInvalidCharRange
tags: [constant string]
```

```Go
const ErrInvalidCharRange ErrorCode = "invalid character class range"
```

### <a id="ErrInvalidEscape" href="#ErrInvalidEscape">const ErrInvalidEscape</a>

```
searchKey: syntax.ErrInvalidEscape
tags: [constant string]
```

```Go
const ErrInvalidEscape ErrorCode = "invalid escape sequence"
```

### <a id="ErrInvalidNamedCapture" href="#ErrInvalidNamedCapture">const ErrInvalidNamedCapture</a>

```
searchKey: syntax.ErrInvalidNamedCapture
tags: [constant string]
```

```Go
const ErrInvalidNamedCapture ErrorCode = "invalid named capture"
```

### <a id="ErrInvalidPerlOp" href="#ErrInvalidPerlOp">const ErrInvalidPerlOp</a>

```
searchKey: syntax.ErrInvalidPerlOp
tags: [constant string]
```

```Go
const ErrInvalidPerlOp ErrorCode = "invalid or unsupported Perl syntax"
```

### <a id="ErrInvalidRepeatOp" href="#ErrInvalidRepeatOp">const ErrInvalidRepeatOp</a>

```
searchKey: syntax.ErrInvalidRepeatOp
tags: [constant string]
```

```Go
const ErrInvalidRepeatOp ErrorCode = "invalid nested repetition operator"
```

### <a id="ErrInvalidRepeatSize" href="#ErrInvalidRepeatSize">const ErrInvalidRepeatSize</a>

```
searchKey: syntax.ErrInvalidRepeatSize
tags: [constant string]
```

```Go
const ErrInvalidRepeatSize ErrorCode = "invalid repeat count"
```

### <a id="ErrInvalidUTF8" href="#ErrInvalidUTF8">const ErrInvalidUTF8</a>

```
searchKey: syntax.ErrInvalidUTF8
tags: [constant string]
```

```Go
const ErrInvalidUTF8 ErrorCode = "invalid UTF-8"
```

### <a id="ErrMissingBracket" href="#ErrMissingBracket">const ErrMissingBracket</a>

```
searchKey: syntax.ErrMissingBracket
tags: [constant string]
```

```Go
const ErrMissingBracket ErrorCode = "missing closing ]"
```

### <a id="ErrMissingParen" href="#ErrMissingParen">const ErrMissingParen</a>

```
searchKey: syntax.ErrMissingParen
tags: [constant string]
```

```Go
const ErrMissingParen ErrorCode = "missing closing )"
```

### <a id="ErrMissingRepeatArgument" href="#ErrMissingRepeatArgument">const ErrMissingRepeatArgument</a>

```
searchKey: syntax.ErrMissingRepeatArgument
tags: [constant string]
```

```Go
const ErrMissingRepeatArgument ErrorCode = "missing argument to repetition operator"
```

### <a id="ErrTrailingBackslash" href="#ErrTrailingBackslash">const ErrTrailingBackslash</a>

```
searchKey: syntax.ErrTrailingBackslash
tags: [constant string]
```

```Go
const ErrTrailingBackslash ErrorCode = "trailing backslash at end of expression"
```

### <a id="ErrUnexpectedParen" href="#ErrUnexpectedParen">const ErrUnexpectedParen</a>

```
searchKey: syntax.ErrUnexpectedParen
tags: [constant string]
```

```Go
const ErrUnexpectedParen ErrorCode = "unexpected )"
```

### <a id="FoldCase" href="#FoldCase">const FoldCase</a>

```
searchKey: syntax.FoldCase
tags: [constant number]
```

```Go
const FoldCase Flags = 1 << iota // case-insensitive match

```

### <a id="InstAlt" href="#InstAlt">const InstAlt</a>

```
searchKey: syntax.InstAlt
tags: [constant number]
```

```Go
const InstAlt InstOp = iota
```

### <a id="InstAltMatch" href="#InstAltMatch">const InstAltMatch</a>

```
searchKey: syntax.InstAltMatch
tags: [constant number]
```

```Go
const InstAltMatch
```

### <a id="InstCapture" href="#InstCapture">const InstCapture</a>

```
searchKey: syntax.InstCapture
tags: [constant number]
```

```Go
const InstCapture
```

### <a id="InstEmptyWidth" href="#InstEmptyWidth">const InstEmptyWidth</a>

```
searchKey: syntax.InstEmptyWidth
tags: [constant number]
```

```Go
const InstEmptyWidth
```

### <a id="InstFail" href="#InstFail">const InstFail</a>

```
searchKey: syntax.InstFail
tags: [constant number]
```

```Go
const InstFail
```

### <a id="InstMatch" href="#InstMatch">const InstMatch</a>

```
searchKey: syntax.InstMatch
tags: [constant number]
```

```Go
const InstMatch
```

### <a id="InstNop" href="#InstNop">const InstNop</a>

```
searchKey: syntax.InstNop
tags: [constant number]
```

```Go
const InstNop
```

### <a id="InstRune" href="#InstRune">const InstRune</a>

```
searchKey: syntax.InstRune
tags: [constant number]
```

```Go
const InstRune
```

### <a id="InstRune1" href="#InstRune1">const InstRune1</a>

```
searchKey: syntax.InstRune1
tags: [constant number]
```

```Go
const InstRune1
```

### <a id="InstRuneAny" href="#InstRuneAny">const InstRuneAny</a>

```
searchKey: syntax.InstRuneAny
tags: [constant number]
```

```Go
const InstRuneAny
```

### <a id="InstRuneAnyNotNL" href="#InstRuneAnyNotNL">const InstRuneAnyNotNL</a>

```
searchKey: syntax.InstRuneAnyNotNL
tags: [constant number]
```

```Go
const InstRuneAnyNotNL
```

### <a id="Literal" href="#Literal">const Literal</a>

```
searchKey: syntax.Literal
tags: [constant number]
```

```Go
const Literal // treat pattern as literal string

```

### <a id="MatchNL" href="#MatchNL">const MatchNL</a>

```
searchKey: syntax.MatchNL
tags: [constant number]
```

```Go
const MatchNL = ClassNL | DotNL
```

### <a id="NonGreedy" href="#NonGreedy">const NonGreedy</a>

```
searchKey: syntax.NonGreedy
tags: [constant number]
```

```Go
const NonGreedy // make repetition operators default to non-greedy

```

### <a id="OneLine" href="#OneLine">const OneLine</a>

```
searchKey: syntax.OneLine
tags: [constant number]
```

```Go
const OneLine // treat ^ and $ as only matching at beginning and end of text

```

### <a id="OpAlternate" href="#OpAlternate">const OpAlternate</a>

```
searchKey: syntax.OpAlternate
tags: [constant number]
```

```Go
const OpAlternate // matches alternation of Subs

```

### <a id="OpAnyChar" href="#OpAnyChar">const OpAnyChar</a>

```
searchKey: syntax.OpAnyChar
tags: [constant number]
```

```Go
const OpAnyChar // matches any character

```

### <a id="OpAnyCharNotNL" href="#OpAnyCharNotNL">const OpAnyCharNotNL</a>

```
searchKey: syntax.OpAnyCharNotNL
tags: [constant number]
```

```Go
const OpAnyCharNotNL // matches any character except newline

```

### <a id="OpBeginLine" href="#OpBeginLine">const OpBeginLine</a>

```
searchKey: syntax.OpBeginLine
tags: [constant number]
```

```Go
const OpBeginLine // matches empty string at beginning of line

```

### <a id="OpBeginText" href="#OpBeginText">const OpBeginText</a>

```
searchKey: syntax.OpBeginText
tags: [constant number]
```

```Go
const OpBeginText // matches empty string at beginning of text

```

### <a id="OpCapture" href="#OpCapture">const OpCapture</a>

```
searchKey: syntax.OpCapture
tags: [constant number]
```

```Go
const OpCapture // capturing subexpression with index Cap, optional name Name

```

### <a id="OpCharClass" href="#OpCharClass">const OpCharClass</a>

```
searchKey: syntax.OpCharClass
tags: [constant number]
```

```Go
const OpCharClass // matches Runes interpreted as range pair list

```

### <a id="OpConcat" href="#OpConcat">const OpConcat</a>

```
searchKey: syntax.OpConcat
tags: [constant number]
```

```Go
const OpConcat // matches concatenation of Subs

```

### <a id="OpEmptyMatch" href="#OpEmptyMatch">const OpEmptyMatch</a>

```
searchKey: syntax.OpEmptyMatch
tags: [constant number]
```

```Go
const OpEmptyMatch // matches empty string

```

### <a id="OpEndLine" href="#OpEndLine">const OpEndLine</a>

```
searchKey: syntax.OpEndLine
tags: [constant number]
```

```Go
const OpEndLine // matches empty string at end of line

```

### <a id="OpEndText" href="#OpEndText">const OpEndText</a>

```
searchKey: syntax.OpEndText
tags: [constant number]
```

```Go
const OpEndText // matches empty string at end of text

```

### <a id="OpLiteral" href="#OpLiteral">const OpLiteral</a>

```
searchKey: syntax.OpLiteral
tags: [constant number]
```

```Go
const OpLiteral // matches Runes sequence

```

### <a id="OpNoMatch" href="#OpNoMatch">const OpNoMatch</a>

```
searchKey: syntax.OpNoMatch
tags: [constant number]
```

```Go
const OpNoMatch Op = 1 + iota // matches no strings

```

### <a id="OpNoWordBoundary" href="#OpNoWordBoundary">const OpNoWordBoundary</a>

```
searchKey: syntax.OpNoWordBoundary
tags: [constant number]
```

```Go
const OpNoWordBoundary // matches word non-boundary `\B`

```

### <a id="OpPlus" href="#OpPlus">const OpPlus</a>

```
searchKey: syntax.OpPlus
tags: [constant number]
```

```Go
const OpPlus // matches Sub[0] one or more times

```

### <a id="OpQuest" href="#OpQuest">const OpQuest</a>

```
searchKey: syntax.OpQuest
tags: [constant number]
```

```Go
const OpQuest // matches Sub[0] zero or one times

```

### <a id="OpRepeat" href="#OpRepeat">const OpRepeat</a>

```
searchKey: syntax.OpRepeat
tags: [constant number]
```

```Go
const OpRepeat // matches Sub[0] at least Min times, at most Max (Max == -1 is no limit)

```

### <a id="OpStar" href="#OpStar">const OpStar</a>

```
searchKey: syntax.OpStar
tags: [constant number]
```

```Go
const OpStar // matches Sub[0] zero or more times

```

### <a id="OpWordBoundary" href="#OpWordBoundary">const OpWordBoundary</a>

```
searchKey: syntax.OpWordBoundary
tags: [constant number]
```

```Go
const OpWordBoundary // matches word boundary `\b`

```

### <a id="POSIX" href="#POSIX">const POSIX</a>

```
searchKey: syntax.POSIX
tags: [constant number]
```

```Go
const POSIX Flags = 0 // POSIX syntax

```

### <a id="Perl" href="#Perl">const Perl</a>

```
searchKey: syntax.Perl
tags: [constant number]
```

```Go
const Perl = ClassNL | OneLine | PerlX | UnicodeGroups // as close to Perl as possible

```

### <a id="PerlX" href="#PerlX">const PerlX</a>

```
searchKey: syntax.PerlX
tags: [constant number]
```

```Go
const PerlX // allow Perl extensions

```

### <a id="Simple" href="#Simple">const Simple</a>

```
searchKey: syntax.Simple
tags: [constant number]
```

```Go
const Simple // regexp contains no counted repetition

```

### <a id="UnicodeGroups" href="#UnicodeGroups">const UnicodeGroups</a>

```
searchKey: syntax.UnicodeGroups
tags: [constant number]
```

```Go
const UnicodeGroups // allow \p{Han}, \P{Han} for Unicode group and negation

```

### <a id="WasDollar" href="#WasDollar">const WasDollar</a>

```
searchKey: syntax.WasDollar
tags: [constant number]
```

```Go
const WasDollar // regexp OpEndText was $, not \z

```

### <a id="maxFold" href="#maxFold">const maxFold</a>

```
searchKey: syntax.maxFold
tags: [constant number private]
```

```Go
const maxFold = 0x1e943
```

### <a id="meta" href="#meta">const meta</a>

```
searchKey: syntax.meta
tags: [constant string private]
```

```Go
const meta = `\.+*?()|[]{}^$`
```

### <a id="minFold" href="#minFold">const minFold</a>

```
searchKey: syntax.minFold
tags: [constant number private]
```

```Go
const minFold = 0x0041
```

minimum and maximum runes involved in folding. checked during test. 

### <a id="noMatch" href="#noMatch">const noMatch</a>

```
searchKey: syntax.noMatch
tags: [constant number private]
```

```Go
const noMatch = -1
```

### <a id="opLeftParen" href="#opLeftParen">const opLeftParen</a>

```
searchKey: syntax.opLeftParen
tags: [constant number private]
```

```Go
const opLeftParen = opPseudo + iota
```

Pseudo-ops for parsing stack. 

### <a id="opPseudo" href="#opPseudo">const opPseudo</a>

```
searchKey: syntax.opPseudo
tags: [constant number private]
```

```Go
const opPseudo Op = 128 // where pseudo-ops start

```

### <a id="opVerticalBar" href="#opVerticalBar">const opVerticalBar</a>

```
searchKey: syntax.opVerticalBar
tags: [constant number private]
```

```Go
const opVerticalBar
```

Pseudo-ops for parsing stack. 

### <a id="testFlags" href="#testFlags">const testFlags</a>

```
searchKey: syntax.testFlags
tags: [constant number private]
```

```Go
const testFlags = MatchNL | PerlX | UnicodeGroups
```

### <a id="_Op_name_0" href="#_Op_name_0">const _Op_name_0</a>

```
searchKey: syntax._Op_name_0
tags: [constant string private]
```

```Go
const _Op_name_0 = ...
```

### <a id="_Op_name_1" href="#_Op_name_1">const _Op_name_1</a>

```
searchKey: syntax._Op_name_1
tags: [constant string private]
```

```Go
const _Op_name_1 = "opPseudo"
```

## <a id="var" href="#var">Variables</a>

```
tags: [package]
```

### <a id="anyRune" href="#anyRune">var anyRune</a>

```
searchKey: syntax.anyRune
tags: [variable array number private]
```

```Go
var anyRune = []rune{0, unicode.MaxRune}
```

### <a id="anyRuneNotNL" href="#anyRuneNotNL">var anyRuneNotNL</a>

```
searchKey: syntax.anyRuneNotNL
tags: [variable array number private]
```

```Go
var anyRuneNotNL = []rune{0, '\n' - 1, '\n' + 1, unicode.MaxRune}
```

### <a id="anyTable" href="#anyTable">var anyTable</a>

```
searchKey: syntax.anyTable
tags: [variable struct private]
```

```Go
var anyTable = ...
```

### <a id="code1" href="#code1">var code1</a>

```
searchKey: syntax.code1
tags: [variable array number private]
```

```Go
var code1 = []rune{
	0x30, 0x39,
}
```

### <a id="code10" href="#code10">var code10</a>

```
searchKey: syntax.code10
tags: [variable array number private]
```

```Go
var code10 = []rune{
	0x21, 0x7e,
}
```

### <a id="code11" href="#code11">var code11</a>

```
searchKey: syntax.code11
tags: [variable array number private]
```

```Go
var code11 = []rune{
	0x61, 0x7a,
}
```

### <a id="code12" href="#code12">var code12</a>

```
searchKey: syntax.code12
tags: [variable array number private]
```

```Go
var code12 = []rune{
	0x20, 0x7e,
}
```

### <a id="code13" href="#code13">var code13</a>

```
searchKey: syntax.code13
tags: [variable array number private]
```

```Go
var code13 = []rune{
	0x21, 0x2f,
	0x3a, 0x40,
	0x5b, 0x60,
	0x7b, 0x7e,
}
```

### <a id="code14" href="#code14">var code14</a>

```
searchKey: syntax.code14
tags: [variable array number private]
```

```Go
var code14 = []rune{
	0x9, 0xd,
	0x20, 0x20,
}
```

### <a id="code15" href="#code15">var code15</a>

```
searchKey: syntax.code15
tags: [variable array number private]
```

```Go
var code15 = []rune{
	0x41, 0x5a,
}
```

### <a id="code16" href="#code16">var code16</a>

```
searchKey: syntax.code16
tags: [variable array number private]
```

```Go
var code16 = []rune{
	0x30, 0x39,
	0x41, 0x5a,
	0x5f, 0x5f,
	0x61, 0x7a,
}
```

### <a id="code17" href="#code17">var code17</a>

```
searchKey: syntax.code17
tags: [variable array number private]
```

```Go
var code17 = []rune{
	0x30, 0x39,
	0x41, 0x46,
	0x61, 0x66,
}
```

### <a id="code2" href="#code2">var code2</a>

```
searchKey: syntax.code2
tags: [variable array number private]
```

```Go
var code2 = []rune{
	0x9, 0xa,
	0xc, 0xd,
	0x20, 0x20,
}
```

### <a id="code3" href="#code3">var code3</a>

```
searchKey: syntax.code3
tags: [variable array number private]
```

```Go
var code3 = []rune{
	0x30, 0x39,
	0x41, 0x5a,
	0x5f, 0x5f,
	0x61, 0x7a,
}
```

### <a id="code4" href="#code4">var code4</a>

```
searchKey: syntax.code4
tags: [variable array number private]
```

```Go
var code4 = []rune{
	0x30, 0x39,
	0x41, 0x5a,
	0x61, 0x7a,
}
```

### <a id="code5" href="#code5">var code5</a>

```
searchKey: syntax.code5
tags: [variable array number private]
```

```Go
var code5 = []rune{
	0x41, 0x5a,
	0x61, 0x7a,
}
```

### <a id="code6" href="#code6">var code6</a>

```
searchKey: syntax.code6
tags: [variable array number private]
```

```Go
var code6 = []rune{
	0x0, 0x7f,
}
```

### <a id="code7" href="#code7">var code7</a>

```
searchKey: syntax.code7
tags: [variable array number private]
```

```Go
var code7 = []rune{
	0x9, 0x9,
	0x20, 0x20,
}
```

### <a id="code8" href="#code8">var code8</a>

```
searchKey: syntax.code8
tags: [variable array number private]
```

```Go
var code8 = []rune{
	0x0, 0x1f,
	0x7f, 0x7f,
}
```

### <a id="code9" href="#code9">var code9</a>

```
searchKey: syntax.code9
tags: [variable array number private]
```

```Go
var code9 = []rune{
	0x30, 0x39,
}
```

### <a id="compileTests" href="#compileTests">var compileTests</a>

```
searchKey: syntax.compileTests
tags: [variable array struct private]
```

```Go
var compileTests = ...
```

### <a id="foldcaseTests" href="#foldcaseTests">var foldcaseTests</a>

```
searchKey: syntax.foldcaseTests
tags: [variable array struct private]
```

```Go
var foldcaseTests = ...
```

### <a id="instOpNames" href="#instOpNames">var instOpNames</a>

```
searchKey: syntax.instOpNames
tags: [variable array string private]
```

```Go
var instOpNames = ...
```

### <a id="invalidRegexps" href="#invalidRegexps">var invalidRegexps</a>

```
searchKey: syntax.invalidRegexps
tags: [variable array string private]
```

```Go
var invalidRegexps = ...
```

### <a id="literalTests" href="#literalTests">var literalTests</a>

```
searchKey: syntax.literalTests
tags: [variable array struct private]
```

```Go
var literalTests = []parseTest{
	{"(|)^$.[*+?]{5,10},\\", "str{(|)^$.[*+?]{5,10},\\}"},
}
```

### <a id="matchnlTests" href="#matchnlTests">var matchnlTests</a>

```
searchKey: syntax.matchnlTests
tags: [variable array struct private]
```

```Go
var matchnlTests = ...
```

### <a id="nomatchnlTests" href="#nomatchnlTests">var nomatchnlTests</a>

```
searchKey: syntax.nomatchnlTests
tags: [variable array struct private]
```

```Go
var nomatchnlTests = ...
```

### <a id="onlyPOSIX" href="#onlyPOSIX">var onlyPOSIX</a>

```
searchKey: syntax.onlyPOSIX
tags: [variable array string private]
```

```Go
var onlyPOSIX = []string{
	"a++",
	"a**",
	"a?*",
	"a+*",
	"a{1}*",
	".{1}{2}.{3}",
}
```

### <a id="onlyPerl" href="#onlyPerl">var onlyPerl</a>

```
searchKey: syntax.onlyPerl
tags: [variable array string private]
```

```Go
var onlyPerl = ...
```

### <a id="opNames" href="#opNames">var opNames</a>

```
searchKey: syntax.opNames
tags: [variable array string private]
```

```Go
var opNames = ...
```

### <a id="parseTests" href="#parseTests">var parseTests</a>

```
searchKey: syntax.parseTests
tags: [variable array struct private]
```

```Go
var parseTests = ...
```

### <a id="perlGroup" href="#perlGroup">var perlGroup</a>

```
searchKey: syntax.perlGroup
tags: [variable object private]
```

```Go
var perlGroup = ...
```

### <a id="posixGroup" href="#posixGroup">var posixGroup</a>

```
searchKey: syntax.posixGroup
tags: [variable object private]
```

```Go
var posixGroup = ...
```

### <a id="simplifyTests" href="#simplifyTests">var simplifyTests</a>

```
searchKey: syntax.simplifyTests
tags: [variable array struct private]
```

```Go
var simplifyTests = ...
```

### <a id="_Op_index_0" href="#_Op_index_0">var _Op_index_0</a>

```
searchKey: syntax._Op_index_0
tags: [variable array number private]
```

```Go
var _Op_index_0 = ...
```

## <a id="type" href="#type">Types</a>

```
tags: [package]
```

### <a id="EmptyOp" href="#EmptyOp">type EmptyOp uint8</a>

```
searchKey: syntax.EmptyOp
tags: [number]
```

```Go
type EmptyOp uint8
```

An EmptyOp specifies a kind or mixture of zero-width assertions. 

#### <a id="EmptyOpContext" href="#EmptyOpContext">func EmptyOpContext(r1, r2 rune) EmptyOp</a>

```
searchKey: syntax.EmptyOpContext
tags: [method]
```

```Go
func EmptyOpContext(r1, r2 rune) EmptyOp
```

EmptyOpContext returns the zero-width assertions satisfied at the position between the runes r1 and r2. Passing r1 == -1 indicates that the position is at the beginning of the text. Passing r2 == -1 indicates that the position is at the end of the text. 

### <a id="Error" href="#Error">type Error struct</a>

```
searchKey: syntax.Error
tags: [struct]
```

```Go
type Error struct {
	Code ErrorCode
	Expr string
}
```

An Error describes a failure to parse a regular expression and gives the offending expression. 

#### <a id="Error.Error" href="#Error.Error">func (e *Error) Error() string</a>

```
searchKey: syntax.Error.Error
tags: [function]
```

```Go
func (e *Error) Error() string
```

### <a id="ErrorCode" href="#ErrorCode">type ErrorCode string</a>

```
searchKey: syntax.ErrorCode
tags: [string]
```

```Go
type ErrorCode string
```

An ErrorCode describes a failure to parse a regular expression. 

#### <a id="ErrorCode.String" href="#ErrorCode.String">func (e ErrorCode) String() string</a>

```
searchKey: syntax.ErrorCode.String
tags: [function]
```

```Go
func (e ErrorCode) String() string
```

### <a id="Flags" href="#Flags">type Flags uint16</a>

```
searchKey: syntax.Flags
tags: [number]
```

```Go
type Flags uint16
```

Flags control the behavior of the parser and record information about regexp context. 

### <a id="Inst" href="#Inst">type Inst struct</a>

```
searchKey: syntax.Inst
tags: [struct]
```

```Go
type Inst struct {
	Op   InstOp
	Out  uint32 // all but InstMatch, InstFail
	Arg  uint32 // InstAlt, InstAltMatch, InstCapture, InstEmptyWidth
	Rune []rune
}
```

An Inst is a single instruction in a regular expression program. 

#### <a id="Inst.MatchEmptyWidth" href="#Inst.MatchEmptyWidth">func (i *Inst) MatchEmptyWidth(before rune, after rune) bool</a>

```
searchKey: syntax.Inst.MatchEmptyWidth
tags: [method]
```

```Go
func (i *Inst) MatchEmptyWidth(before rune, after rune) bool
```

MatchEmptyWidth reports whether the instruction matches an empty string between the runes before and after. It should only be called when i.Op == InstEmptyWidth. 

#### <a id="Inst.MatchRune" href="#Inst.MatchRune">func (i *Inst) MatchRune(r rune) bool</a>

```
searchKey: syntax.Inst.MatchRune
tags: [method]
```

```Go
func (i *Inst) MatchRune(r rune) bool
```

MatchRune reports whether the instruction matches (and consumes) r. It should only be called when i.Op == InstRune. 

#### <a id="Inst.MatchRunePos" href="#Inst.MatchRunePos">func (i *Inst) MatchRunePos(r rune) int</a>

```
searchKey: syntax.Inst.MatchRunePos
tags: [method]
```

```Go
func (i *Inst) MatchRunePos(r rune) int
```

MatchRunePos checks whether the instruction matches (and consumes) r. If so, MatchRunePos returns the index of the matching rune pair (or, when len(i.Rune) == 1, rune singleton). If not, MatchRunePos returns -1. MatchRunePos should only be called when i.Op == InstRune. 

#### <a id="Inst.String" href="#Inst.String">func (i *Inst) String() string</a>

```
searchKey: syntax.Inst.String
tags: [function]
```

```Go
func (i *Inst) String() string
```

#### <a id="Inst.op" href="#Inst.op">func (i *Inst) op() InstOp</a>

```
searchKey: syntax.Inst.op
tags: [function private]
```

```Go
func (i *Inst) op() InstOp
```

op returns i.Op but merges all the Rune special cases into InstRune 

### <a id="InstOp" href="#InstOp">type InstOp uint8</a>

```
searchKey: syntax.InstOp
tags: [number]
```

```Go
type InstOp uint8
```

An InstOp is an instruction opcode. 

#### <a id="InstOp.String" href="#InstOp.String">func (i InstOp) String() string</a>

```
searchKey: syntax.InstOp.String
tags: [function]
```

```Go
func (i InstOp) String() string
```

### <a id="Op" href="#Op">type Op uint8</a>

```
searchKey: syntax.Op
tags: [number]
```

```Go
type Op uint8
```

An Op is a single regular expression operator. 

#### <a id="Op.String" href="#Op.String">func (i Op) String() string</a>

```
searchKey: syntax.Op.String
tags: [function]
```

```Go
func (i Op) String() string
```

### <a id="Prog" href="#Prog">type Prog struct</a>

```
searchKey: syntax.Prog
tags: [struct]
```

```Go
type Prog struct {
	Inst   []Inst
	Start  int // index of start instruction
	NumCap int // number of InstCapture insts in re
}
```

A Prog is a compiled regular expression program. 

#### <a id="Compile" href="#Compile">func Compile(re *Regexp) (*Prog, error)</a>

```
searchKey: syntax.Compile
tags: [method]
```

```Go
func Compile(re *Regexp) (*Prog, error)
```

Compile compiles the regexp into a program to be executed. The regexp should have been simplified already (returned from re.Simplify). 

#### <a id="Prog.Prefix" href="#Prog.Prefix">func (p *Prog) Prefix() (prefix string, complete bool)</a>

```
searchKey: syntax.Prog.Prefix
tags: [function]
```

```Go
func (p *Prog) Prefix() (prefix string, complete bool)
```

Prefix returns a literal string that all matches for the regexp must start with. Complete is true if the prefix is the entire match. 

#### <a id="Prog.StartCond" href="#Prog.StartCond">func (p *Prog) StartCond() EmptyOp</a>

```
searchKey: syntax.Prog.StartCond
tags: [function]
```

```Go
func (p *Prog) StartCond() EmptyOp
```

StartCond returns the leading empty-width conditions that must be true in any match. It returns ^EmptyOp(0) if no matches are possible. 

#### <a id="Prog.String" href="#Prog.String">func (p *Prog) String() string</a>

```
searchKey: syntax.Prog.String
tags: [function]
```

```Go
func (p *Prog) String() string
```

#### <a id="Prog.skipNop" href="#Prog.skipNop">func (p *Prog) skipNop(pc uint32) *Inst</a>

```
searchKey: syntax.Prog.skipNop
tags: [method private]
```

```Go
func (p *Prog) skipNop(pc uint32) *Inst
```

skipNop follows any no-op or capturing instructions. 

### <a id="Regexp" href="#Regexp">type Regexp struct</a>

```
searchKey: syntax.Regexp
tags: [struct]
```

```Go
type Regexp struct {
	Op       Op // operator
	Flags    Flags
	Sub      []*Regexp  // subexpressions, if any
	Sub0     [1]*Regexp // storage for short Sub
	Rune     []rune     // matched runes, for OpLiteral, OpCharClass
	Rune0    [2]rune    // storage for short Rune
	Min, Max int        // min, max for OpRepeat
	Cap      int        // capturing index, for OpCapture
	Name     string     // capturing name, for OpCapture
}
```

A Regexp is a node in a regular expression syntax tree. 

#### <a id="Parse" href="#Parse">func Parse(s string, flags Flags) (*Regexp, error)</a>

```
searchKey: syntax.Parse
tags: [method]
```

```Go
func Parse(s string, flags Flags) (*Regexp, error)
```

Parse parses a regular expression string s, controlled by the specified Flags, and returns a regular expression parse tree. The syntax is described in the top-level comment. 

#### <a id="literalRegexp" href="#literalRegexp">func literalRegexp(s string, flags Flags) *Regexp</a>

```
searchKey: syntax.literalRegexp
tags: [method private]
```

```Go
func literalRegexp(s string, flags Flags) *Regexp
```

#### <a id="simplify1" href="#simplify1">func simplify1(op Op, flags Flags, sub, re *Regexp) *Regexp</a>

```
searchKey: syntax.simplify1
tags: [method private]
```

```Go
func simplify1(op Op, flags Flags, sub, re *Regexp) *Regexp
```

simplify1 implements Simplify for the unary OpStar, OpPlus, and OpQuest operators. It returns the simple regexp equivalent to 

```
Regexp{Op: op, Flags: flags, Sub: {sub}}

```
under the assumption that sub is already simple, and without first allocating that structure. If the regexp to be returned turns out to be equivalent to re, simplify1 returns re instead. 

simplify1 is factored out of Simplify because the implementation for other operators generates these unary expressions. Letting them call simplify1 makes sure the expressions they generate are simple. 

#### <a id="Regexp.CapNames" href="#Regexp.CapNames">func (re *Regexp) CapNames() []string</a>

```
searchKey: syntax.Regexp.CapNames
tags: [function]
```

```Go
func (re *Regexp) CapNames() []string
```

CapNames walks the regexp to find the names of capturing groups. 

#### <a id="Regexp.Equal" href="#Regexp.Equal">func (x *Regexp) Equal(y *Regexp) bool</a>

```
searchKey: syntax.Regexp.Equal
tags: [method]
```

```Go
func (x *Regexp) Equal(y *Regexp) bool
```

Equal reports whether x and y have identical structure. 

#### <a id="Regexp.MaxCap" href="#Regexp.MaxCap">func (re *Regexp) MaxCap() int</a>

```
searchKey: syntax.Regexp.MaxCap
tags: [function]
```

```Go
func (re *Regexp) MaxCap() int
```

MaxCap walks the regexp to find the maximum capture index. 

#### <a id="Regexp.Simplify" href="#Regexp.Simplify">func (re *Regexp) Simplify() *Regexp</a>

```
searchKey: syntax.Regexp.Simplify
tags: [function]
```

```Go
func (re *Regexp) Simplify() *Regexp
```

Simplify returns a regexp equivalent to re but without counted repetitions and with various other simplifications, such as rewriting /(?:a+)+/ to /a+/. The resulting regexp will execute correctly but its string representation will not produce the same parse tree, because capturing parentheses may have been duplicated or removed. For example, the simplified form for /(x){1,2}/ is /(x)(x)?/ but both parentheses capture as $1. The returned regexp may share structure with or be the original. 

#### <a id="Regexp.String" href="#Regexp.String">func (re *Regexp) String() string</a>

```
searchKey: syntax.Regexp.String
tags: [function]
```

```Go
func (re *Regexp) String() string
```

#### <a id="Regexp.capNames" href="#Regexp.capNames">func (re *Regexp) capNames(names []string)</a>

```
searchKey: syntax.Regexp.capNames
tags: [method private]
```

```Go
func (re *Regexp) capNames(names []string)
```

### <a id="charGroup" href="#charGroup">type charGroup struct</a>

```
searchKey: syntax.charGroup
tags: [struct private]
```

```Go
type charGroup struct {
	sign  int
	class []rune
}
```

### <a id="compiler" href="#compiler">type compiler struct</a>

```
searchKey: syntax.compiler
tags: [struct private]
```

```Go
type compiler struct {
	p *Prog
}
```

#### <a id="compiler.alt" href="#compiler.alt">func (c *compiler) alt(f1, f2 frag) frag</a>

```
searchKey: syntax.compiler.alt
tags: [method private]
```

```Go
func (c *compiler) alt(f1, f2 frag) frag
```

#### <a id="compiler.cap" href="#compiler.cap">func (c *compiler) cap(arg uint32) frag</a>

```
searchKey: syntax.compiler.cap
tags: [method private]
```

```Go
func (c *compiler) cap(arg uint32) frag
```

#### <a id="compiler.cat" href="#compiler.cat">func (c *compiler) cat(f1, f2 frag) frag</a>

```
searchKey: syntax.compiler.cat
tags: [method private]
```

```Go
func (c *compiler) cat(f1, f2 frag) frag
```

#### <a id="compiler.compile" href="#compiler.compile">func (c *compiler) compile(re *Regexp) frag</a>

```
searchKey: syntax.compiler.compile
tags: [method private]
```

```Go
func (c *compiler) compile(re *Regexp) frag
```

#### <a id="compiler.empty" href="#compiler.empty">func (c *compiler) empty(op EmptyOp) frag</a>

```
searchKey: syntax.compiler.empty
tags: [method private]
```

```Go
func (c *compiler) empty(op EmptyOp) frag
```

#### <a id="compiler.fail" href="#compiler.fail">func (c *compiler) fail() frag</a>

```
searchKey: syntax.compiler.fail
tags: [function private]
```

```Go
func (c *compiler) fail() frag
```

#### <a id="compiler.init.compile.go" href="#compiler.init.compile.go">func (c *compiler) init()</a>

```
searchKey: syntax.compiler.init
tags: [function private]
```

```Go
func (c *compiler) init()
```

#### <a id="compiler.inst" href="#compiler.inst">func (c *compiler) inst(op InstOp) frag</a>

```
searchKey: syntax.compiler.inst
tags: [method private]
```

```Go
func (c *compiler) inst(op InstOp) frag
```

#### <a id="compiler.loop" href="#compiler.loop">func (c *compiler) loop(f1 frag, nongreedy bool) frag</a>

```
searchKey: syntax.compiler.loop
tags: [method private]
```

```Go
func (c *compiler) loop(f1 frag, nongreedy bool) frag
```

loop returns the fragment for the main loop of a plus or star. For plus, it can be used after changing the entry to f1.i. For star, it can be used directly when f1 can't match an empty string. (When f1 can match an empty string, f1* must be implemented as (f1+)? to get the priority match order correct.) 

#### <a id="compiler.nop" href="#compiler.nop">func (c *compiler) nop() frag</a>

```
searchKey: syntax.compiler.nop
tags: [function private]
```

```Go
func (c *compiler) nop() frag
```

#### <a id="compiler.plus" href="#compiler.plus">func (c *compiler) plus(f1 frag, nongreedy bool) frag</a>

```
searchKey: syntax.compiler.plus
tags: [method private]
```

```Go
func (c *compiler) plus(f1 frag, nongreedy bool) frag
```

#### <a id="compiler.quest" href="#compiler.quest">func (c *compiler) quest(f1 frag, nongreedy bool) frag</a>

```
searchKey: syntax.compiler.quest
tags: [method private]
```

```Go
func (c *compiler) quest(f1 frag, nongreedy bool) frag
```

#### <a id="compiler.rune" href="#compiler.rune">func (c *compiler) rune(r []rune, flags Flags) frag</a>

```
searchKey: syntax.compiler.rune
tags: [method private]
```

```Go
func (c *compiler) rune(r []rune, flags Flags) frag
```

#### <a id="compiler.star" href="#compiler.star">func (c *compiler) star(f1 frag, nongreedy bool) frag</a>

```
searchKey: syntax.compiler.star
tags: [method private]
```

```Go
func (c *compiler) star(f1 frag, nongreedy bool) frag
```

### <a id="frag" href="#frag">type frag struct</a>

```
searchKey: syntax.frag
tags: [struct private]
```

```Go
type frag struct {
	i        uint32    // index of first instruction
	out      patchList // where to record end instruction
	nullable bool      // whether fragment can match empty string
}
```

A frag represents a compiled program fragment. 

### <a id="parseTest" href="#parseTest">type parseTest struct</a>

```
searchKey: syntax.parseTest
tags: [struct private]
```

```Go
type parseTest struct {
	Regexp string
	Dump   string
}
```

### <a id="parser" href="#parser">type parser struct</a>

```
searchKey: syntax.parser
tags: [struct private]
```

```Go
type parser struct {
	flags       Flags     // parse mode flags
	stack       []*Regexp // stack of parsed expressions
	free        *Regexp
	numCap      int // number of capturing groups seen
	wholeRegexp string
	tmpClass    []rune // temporary char class work space
}
```

#### <a id="parser.alternate" href="#parser.alternate">func (p *parser) alternate() *Regexp</a>

```
searchKey: syntax.parser.alternate
tags: [function private]
```

```Go
func (p *parser) alternate() *Regexp
```

alternate replaces the top of the stack (above the topmost '(') with its alternation. 

#### <a id="parser.appendGroup" href="#parser.appendGroup">func (p *parser) appendGroup(r []rune, g charGroup) []rune</a>

```
searchKey: syntax.parser.appendGroup
tags: [method private]
```

```Go
func (p *parser) appendGroup(r []rune, g charGroup) []rune
```

#### <a id="parser.collapse" href="#parser.collapse">func (p *parser) collapse(subs []*Regexp, op Op) *Regexp</a>

```
searchKey: syntax.parser.collapse
tags: [method private]
```

```Go
func (p *parser) collapse(subs []*Regexp, op Op) *Regexp
```

collapse returns the result of applying op to sub. If sub contains op nodes, they all get hoisted up so that there is never a concat of a concat or an alternate of an alternate. 

#### <a id="parser.concat" href="#parser.concat">func (p *parser) concat() *Regexp</a>

```
searchKey: syntax.parser.concat
tags: [function private]
```

```Go
func (p *parser) concat() *Regexp
```

concat replaces the top of the stack (above the topmost '|' or '(') with its concatenation. 

#### <a id="parser.factor" href="#parser.factor">func (p *parser) factor(sub []*Regexp) []*Regexp</a>

```
searchKey: syntax.parser.factor
tags: [method private]
```

```Go
func (p *parser) factor(sub []*Regexp) []*Regexp
```

factor factors common prefixes from the alternation list sub. It returns a replacement list that reuses the same storage and frees (passes to p.reuse) any removed *Regexps. 

For example, 

```
ABC|ABD|AEF|BCX|BCY

```
simplifies by literal prefix extraction to 

```
A(B(C|D)|EF)|BC(X|Y)

```
which simplifies by character class introduction to 

```
A(B[CD]|EF)|BC[XY]

```
#### <a id="parser.leadingRegexp" href="#parser.leadingRegexp">func (p *parser) leadingRegexp(re *Regexp) *Regexp</a>

```
searchKey: syntax.parser.leadingRegexp
tags: [method private]
```

```Go
func (p *parser) leadingRegexp(re *Regexp) *Regexp
```

leadingRegexp returns the leading regexp that re begins with. The regexp refers to storage in re or its children. 

#### <a id="parser.leadingString" href="#parser.leadingString">func (p *parser) leadingString(re *Regexp) ([]rune, Flags)</a>

```
searchKey: syntax.parser.leadingString
tags: [method private]
```

```Go
func (p *parser) leadingString(re *Regexp) ([]rune, Flags)
```

leadingString returns the leading literal string that re begins with. The string refers to storage in re or its children. 

#### <a id="parser.literal" href="#parser.literal">func (p *parser) literal(r rune)</a>

```
searchKey: syntax.parser.literal
tags: [method private]
```

```Go
func (p *parser) literal(r rune)
```

literal pushes a literal regexp for the rune r on the stack. 

#### <a id="parser.maybeConcat" href="#parser.maybeConcat">func (p *parser) maybeConcat(r rune, flags Flags) bool</a>

```
searchKey: syntax.parser.maybeConcat
tags: [method private]
```

```Go
func (p *parser) maybeConcat(r rune, flags Flags) bool
```

maybeConcat implements incremental concatenation of literal runes into string nodes. The parser calls this before each push, so only the top fragment of the stack might need processing. Since this is called before a push, the topmost literal is no longer subject to operators like * (Otherwise ab* would turn into (ab)*.) If r >= 0 and there's a node left over, maybeConcat uses it to push r with the given flags. maybeConcat reports whether r was pushed. 

#### <a id="parser.newRegexp" href="#parser.newRegexp">func (p *parser) newRegexp(op Op) *Regexp</a>

```
searchKey: syntax.parser.newRegexp
tags: [method private]
```

```Go
func (p *parser) newRegexp(op Op) *Regexp
```

#### <a id="parser.op" href="#parser.op">func (p *parser) op(op Op) *Regexp</a>

```
searchKey: syntax.parser.op
tags: [method private]
```

```Go
func (p *parser) op(op Op) *Regexp
```

op pushes a regexp with the given op onto the stack and returns that regexp. 

#### <a id="parser.parseClass" href="#parser.parseClass">func (p *parser) parseClass(s string) (rest string, err error)</a>

```
searchKey: syntax.parser.parseClass
tags: [method private]
```

```Go
func (p *parser) parseClass(s string) (rest string, err error)
```

parseClass parses a character class at the beginning of s and pushes it onto the parse stack. 

#### <a id="parser.parseClassChar" href="#parser.parseClassChar">func (p *parser) parseClassChar(s, wholeClass string) (r rune, rest string, err error)</a>

```
searchKey: syntax.parser.parseClassChar
tags: [method private]
```

```Go
func (p *parser) parseClassChar(s, wholeClass string) (r rune, rest string, err error)
```

parseClassChar parses a character class character at the beginning of s and returns it. 

#### <a id="parser.parseEscape" href="#parser.parseEscape">func (p *parser) parseEscape(s string) (r rune, rest string, err error)</a>

```
searchKey: syntax.parser.parseEscape
tags: [method private]
```

```Go
func (p *parser) parseEscape(s string) (r rune, rest string, err error)
```

parseEscape parses an escape sequence at the beginning of s and returns the rune. 

#### <a id="parser.parseInt" href="#parser.parseInt">func (p *parser) parseInt(s string) (n int, rest string, ok bool)</a>

```
searchKey: syntax.parser.parseInt
tags: [method private]
```

```Go
func (p *parser) parseInt(s string) (n int, rest string, ok bool)
```

parseInt parses a decimal integer. 

#### <a id="parser.parseNamedClass" href="#parser.parseNamedClass">func (p *parser) parseNamedClass(s string, r []rune) (out []rune, rest string, err error)</a>

```
searchKey: syntax.parser.parseNamedClass
tags: [method private]
```

```Go
func (p *parser) parseNamedClass(s string, r []rune) (out []rune, rest string, err error)
```

parseNamedClass parses a leading POSIX named character class like [:alnum:] from the beginning of s. If one is present, it appends the characters to r and returns the new slice r and the remainder of the string. 

#### <a id="parser.parsePerlClassEscape" href="#parser.parsePerlClassEscape">func (p *parser) parsePerlClassEscape(s string, r []rune) (out []rune, rest string)</a>

```
searchKey: syntax.parser.parsePerlClassEscape
tags: [method private]
```

```Go
func (p *parser) parsePerlClassEscape(s string, r []rune) (out []rune, rest string)
```

parsePerlClassEscape parses a leading Perl character class escape like \d from the beginning of s. If one is present, it appends the characters to r and returns the new slice r and the remainder of the string. 

#### <a id="parser.parsePerlFlags" href="#parser.parsePerlFlags">func (p *parser) parsePerlFlags(s string) (rest string, err error)</a>

```
searchKey: syntax.parser.parsePerlFlags
tags: [method private]
```

```Go
func (p *parser) parsePerlFlags(s string) (rest string, err error)
```

parsePerlFlags parses a Perl flag setting or non-capturing group or both, like (?i) or (?: or (?i:.  It removes the prefix from s and updates the parse state. The caller must have ensured that s begins with "(?". 

#### <a id="parser.parseRepeat" href="#parser.parseRepeat">func (p *parser) parseRepeat(s string) (min, max int, rest string, ok bool)</a>

```
searchKey: syntax.parser.parseRepeat
tags: [method private]
```

```Go
func (p *parser) parseRepeat(s string) (min, max int, rest string, ok bool)
```

parseRepeat parses {min} (max=min) or {min,} (max=-1) or {min,max}. If s is not of that form, it returns ok == false. If s has the right form but the values are too big, it returns min == -1, ok == true. 

#### <a id="parser.parseRightParen" href="#parser.parseRightParen">func (p *parser) parseRightParen() error</a>

```
searchKey: syntax.parser.parseRightParen
tags: [function private]
```

```Go
func (p *parser) parseRightParen() error
```

parseRightParen handles a ) in the input. 

#### <a id="parser.parseUnicodeClass" href="#parser.parseUnicodeClass">func (p *parser) parseUnicodeClass(s string, r []rune) (out []rune, rest string, err error)</a>

```
searchKey: syntax.parser.parseUnicodeClass
tags: [method private]
```

```Go
func (p *parser) parseUnicodeClass(s string, r []rune) (out []rune, rest string, err error)
```

parseUnicodeClass parses a leading Unicode character class like \p{Han} from the beginning of s. If one is present, it appends the characters to r and returns the new slice r and the remainder of the string. 

#### <a id="parser.parseVerticalBar" href="#parser.parseVerticalBar">func (p *parser) parseVerticalBar() error</a>

```
searchKey: syntax.parser.parseVerticalBar
tags: [function private]
```

```Go
func (p *parser) parseVerticalBar() error
```

parseVerticalBar handles a | in the input. 

#### <a id="parser.push" href="#parser.push">func (p *parser) push(re *Regexp) *Regexp</a>

```
searchKey: syntax.parser.push
tags: [method private]
```

```Go
func (p *parser) push(re *Regexp) *Regexp
```

push pushes the regexp re onto the parse stack and returns the regexp. 

#### <a id="parser.removeLeadingRegexp" href="#parser.removeLeadingRegexp">func (p *parser) removeLeadingRegexp(re *Regexp, reuse bool) *Regexp</a>

```
searchKey: syntax.parser.removeLeadingRegexp
tags: [method private]
```

```Go
func (p *parser) removeLeadingRegexp(re *Regexp, reuse bool) *Regexp
```

removeLeadingRegexp removes the leading regexp in re. It returns the replacement for re. If reuse is true, it passes the removed regexp (if no longer needed) to p.reuse. 

#### <a id="parser.removeLeadingString" href="#parser.removeLeadingString">func (p *parser) removeLeadingString(re *Regexp, n int) *Regexp</a>

```
searchKey: syntax.parser.removeLeadingString
tags: [method private]
```

```Go
func (p *parser) removeLeadingString(re *Regexp, n int) *Regexp
```

removeLeadingString removes the first n leading runes from the beginning of re. It returns the replacement for re. 

#### <a id="parser.repeat" href="#parser.repeat">func (p *parser) repeat(op Op, min, max int, before, after, lastRepeat string) (string, error)</a>

```
searchKey: syntax.parser.repeat
tags: [method private]
```

```Go
func (p *parser) repeat(op Op, min, max int, before, after, lastRepeat string) (string, error)
```

repeat replaces the top stack element with itself repeated according to op, min, max. before is the regexp suffix starting at the repetition operator. after is the regexp suffix following after the repetition operator. repeat returns an updated 'after' and an error, if any. 

#### <a id="parser.reuse" href="#parser.reuse">func (p *parser) reuse(re *Regexp)</a>

```
searchKey: syntax.parser.reuse
tags: [method private]
```

```Go
func (p *parser) reuse(re *Regexp)
```

#### <a id="parser.swapVerticalBar" href="#parser.swapVerticalBar">func (p *parser) swapVerticalBar() bool</a>

```
searchKey: syntax.parser.swapVerticalBar
tags: [function private]
```

```Go
func (p *parser) swapVerticalBar() bool
```

If the top of the stack is an element followed by an opVerticalBar swapVerticalBar swaps the two and returns true. Otherwise it returns false. 

### <a id="patchList" href="#patchList">type patchList struct</a>

```
searchKey: syntax.patchList
tags: [struct private]
```

```Go
type patchList struct {
	head, tail uint32
}
```

A patchList is a list of instruction pointers that need to be filled in (patched). Because the pointers haven't been filled in yet, we can reuse their storage to hold the list. It's kind of sleazy, but works well in practice. See [https://swtch.com/~rsc/regexp/regexp1.html](https://swtch.com/~rsc/regexp/regexp1.html) for inspiration. 

These aren't really pointers: they're integers, so we can reinterpret them this way without using package unsafe. A value l.head denotes p.inst[l.head>>1].Out (l.head&1==0) or .Arg (l.head&1==1). head == 0 denotes the empty list, okay because we start every program with a fail instruction, so we'll never want to point at its output link. 

#### <a id="makePatchList" href="#makePatchList">func makePatchList(n uint32) patchList</a>

```
searchKey: syntax.makePatchList
tags: [method private]
```

```Go
func makePatchList(n uint32) patchList
```

#### <a id="patchList.append" href="#patchList.append">func (l1 patchList) append(p *Prog, l2 patchList) patchList</a>

```
searchKey: syntax.patchList.append
tags: [method private]
```

```Go
func (l1 patchList) append(p *Prog, l2 patchList) patchList
```

#### <a id="patchList.patch" href="#patchList.patch">func (l patchList) patch(p *Prog, val uint32)</a>

```
searchKey: syntax.patchList.patch
tags: [method private]
```

```Go
func (l patchList) patch(p *Prog, val uint32)
```

### <a id="ranges" href="#ranges">type ranges struct</a>

```
searchKey: syntax.ranges
tags: [struct private]
```

```Go
type ranges struct {
	p *[]rune
}
```

ranges implements sort.Interface on a []rune. The choice of receiver type definition is strange but avoids an allocation since we already have a *[]rune. 

#### <a id="ranges.Len" href="#ranges.Len">func (ra ranges) Len() int</a>

```
searchKey: syntax.ranges.Len
tags: [function private]
```

```Go
func (ra ranges) Len() int
```

#### <a id="ranges.Less" href="#ranges.Less">func (ra ranges) Less(i, j int) bool</a>

```
searchKey: syntax.ranges.Less
tags: [method private]
```

```Go
func (ra ranges) Less(i, j int) bool
```

#### <a id="ranges.Swap" href="#ranges.Swap">func (ra ranges) Swap(i, j int)</a>

```
searchKey: syntax.ranges.Swap
tags: [method private]
```

```Go
func (ra ranges) Swap(i, j int)
```

## <a id="func" href="#func">Functions</a>

```
tags: [package]
```

### <a id="BenchmarkEmptyOpContext" href="#BenchmarkEmptyOpContext">func BenchmarkEmptyOpContext(b *testing.B)</a>

```
searchKey: syntax.BenchmarkEmptyOpContext
tags: [method private benchmark]
```

```Go
func BenchmarkEmptyOpContext(b *testing.B)
```

### <a id="IsWordChar" href="#IsWordChar">func IsWordChar(r rune) bool</a>

```
searchKey: syntax.IsWordChar
tags: [method]
```

```Go
func IsWordChar(r rune) bool
```

IsWordChar reports whether r is consider a `word character' during the evaluation of the \b and \B zero-width assertions. These assertions are ASCII-only: the word characters are [A-Za-z0-9_]. 

### <a id="TestAppendRangeCollapse" href="#TestAppendRangeCollapse">func TestAppendRangeCollapse(t *testing.T)</a>

```
searchKey: syntax.TestAppendRangeCollapse
tags: [method private test]
```

```Go
func TestAppendRangeCollapse(t *testing.T)
```

### <a id="TestCompile" href="#TestCompile">func TestCompile(t *testing.T)</a>

```
searchKey: syntax.TestCompile
tags: [method private test]
```

```Go
func TestCompile(t *testing.T)
```

### <a id="TestFoldConstants" href="#TestFoldConstants">func TestFoldConstants(t *testing.T)</a>

```
searchKey: syntax.TestFoldConstants
tags: [method private test]
```

```Go
func TestFoldConstants(t *testing.T)
```

### <a id="TestParseFoldCase" href="#TestParseFoldCase">func TestParseFoldCase(t *testing.T)</a>

```
searchKey: syntax.TestParseFoldCase
tags: [method private test]
```

```Go
func TestParseFoldCase(t *testing.T)
```

### <a id="TestParseInvalidRegexps" href="#TestParseInvalidRegexps">func TestParseInvalidRegexps(t *testing.T)</a>

```
searchKey: syntax.TestParseInvalidRegexps
tags: [method private test]
```

```Go
func TestParseInvalidRegexps(t *testing.T)
```

### <a id="TestParseLiteral" href="#TestParseLiteral">func TestParseLiteral(t *testing.T)</a>

```
searchKey: syntax.TestParseLiteral
tags: [method private test]
```

```Go
func TestParseLiteral(t *testing.T)
```

### <a id="TestParseMatchNL" href="#TestParseMatchNL">func TestParseMatchNL(t *testing.T)</a>

```
searchKey: syntax.TestParseMatchNL
tags: [method private test]
```

```Go
func TestParseMatchNL(t *testing.T)
```

### <a id="TestParseNoMatchNL" href="#TestParseNoMatchNL">func TestParseNoMatchNL(t *testing.T)</a>

```
searchKey: syntax.TestParseNoMatchNL
tags: [method private test]
```

```Go
func TestParseNoMatchNL(t *testing.T)
```

### <a id="TestParseSimple" href="#TestParseSimple">func TestParseSimple(t *testing.T)</a>

```
searchKey: syntax.TestParseSimple
tags: [method private test]
```

```Go
func TestParseSimple(t *testing.T)
```

### <a id="TestSimplify" href="#TestSimplify">func TestSimplify(t *testing.T)</a>

```
searchKey: syntax.TestSimplify
tags: [method private test]
```

```Go
func TestSimplify(t *testing.T)
```

### <a id="TestToStringEquivalentParse" href="#TestToStringEquivalentParse">func TestToStringEquivalentParse(t *testing.T)</a>

```
searchKey: syntax.TestToStringEquivalentParse
tags: [method private test]
```

```Go
func TestToStringEquivalentParse(t *testing.T)
```

### <a id="appendClass" href="#appendClass">func appendClass(r []rune, x []rune) []rune</a>

```
searchKey: syntax.appendClass
tags: [method private]
```

```Go
func appendClass(r []rune, x []rune) []rune
```

appendClass returns the result of appending the class x to the class r. It assume x is clean. 

### <a id="appendFoldedClass" href="#appendFoldedClass">func appendFoldedClass(r []rune, x []rune) []rune</a>

```
searchKey: syntax.appendFoldedClass
tags: [method private]
```

```Go
func appendFoldedClass(r []rune, x []rune) []rune
```

appendFolded returns the result of appending the case folding of the class x to the class r. 

### <a id="appendFoldedRange" href="#appendFoldedRange">func appendFoldedRange(r []rune, lo, hi rune) []rune</a>

```
searchKey: syntax.appendFoldedRange
tags: [method private]
```

```Go
func appendFoldedRange(r []rune, lo, hi rune) []rune
```

appendFoldedRange returns the result of appending the range lo-hi and its case folding-equivalent runes to the class r. 

### <a id="appendLiteral" href="#appendLiteral">func appendLiteral(r []rune, x rune, flags Flags) []rune</a>

```
searchKey: syntax.appendLiteral
tags: [method private]
```

```Go
func appendLiteral(r []rune, x rune, flags Flags) []rune
```

appendLiteral returns the result of appending the literal x to the class r. 

### <a id="appendNegatedClass" href="#appendNegatedClass">func appendNegatedClass(r []rune, x []rune) []rune</a>

```
searchKey: syntax.appendNegatedClass
tags: [method private]
```

```Go
func appendNegatedClass(r []rune, x []rune) []rune
```

appendNegatedClass returns the result of appending the negation of the class x to the class r. It assumes x is clean. 

### <a id="appendNegatedTable" href="#appendNegatedTable">func appendNegatedTable(r []rune, x *unicode.RangeTable) []rune</a>

```
searchKey: syntax.appendNegatedTable
tags: [method private]
```

```Go
func appendNegatedTable(r []rune, x *unicode.RangeTable) []rune
```

appendNegatedTable returns the result of appending the negation of x to the class r. 

### <a id="appendRange" href="#appendRange">func appendRange(r []rune, lo, hi rune) []rune</a>

```
searchKey: syntax.appendRange
tags: [method private]
```

```Go
func appendRange(r []rune, lo, hi rune) []rune
```

appendRange returns the result of appending the range lo-hi to the class r. 

### <a id="appendTable" href="#appendTable">func appendTable(r []rune, x *unicode.RangeTable) []rune</a>

```
searchKey: syntax.appendTable
tags: [method private]
```

```Go
func appendTable(r []rune, x *unicode.RangeTable) []rune
```

appendTable returns the result of appending x to the class r. 

### <a id="bw" href="#bw">func bw(b *strings.Builder, args ...string)</a>

```
searchKey: syntax.bw
tags: [method private]
```

```Go
func bw(b *strings.Builder, args ...string)
```

### <a id="checkUTF8" href="#checkUTF8">func checkUTF8(s string) error</a>

```
searchKey: syntax.checkUTF8
tags: [method private]
```

```Go
func checkUTF8(s string) error
```

### <a id="cleanAlt" href="#cleanAlt">func cleanAlt(re *Regexp)</a>

```
searchKey: syntax.cleanAlt
tags: [method private]
```

```Go
func cleanAlt(re *Regexp)
```

cleanAlt cleans re for eventual inclusion in an alternation. 

### <a id="cleanClass" href="#cleanClass">func cleanClass(rp *[]rune) []rune</a>

```
searchKey: syntax.cleanClass
tags: [method private]
```

```Go
func cleanClass(rp *[]rune) []rune
```

cleanClass sorts the ranges (pairs of elements of r), merges them, and eliminates duplicates. 

### <a id="dump" href="#dump">func dump(re *Regexp) string</a>

```
searchKey: syntax.dump
tags: [method private]
```

```Go
func dump(re *Regexp) string
```

dump prints a string representation of the regexp showing the structure explicitly. 

### <a id="dumpInst" href="#dumpInst">func dumpInst(b *strings.Builder, i *Inst)</a>

```
searchKey: syntax.dumpInst
tags: [method private]
```

```Go
func dumpInst(b *strings.Builder, i *Inst)
```

### <a id="dumpProg" href="#dumpProg">func dumpProg(b *strings.Builder, p *Prog)</a>

```
searchKey: syntax.dumpProg
tags: [method private]
```

```Go
func dumpProg(b *strings.Builder, p *Prog)
```

### <a id="dumpRegexp" href="#dumpRegexp">func dumpRegexp(b *strings.Builder, re *Regexp)</a>

```
searchKey: syntax.dumpRegexp
tags: [method private]
```

```Go
func dumpRegexp(b *strings.Builder, re *Regexp)
```

dumpRegexp writes an encoding of the syntax tree for the regexp re to b. It is used during testing to distinguish between parses that might print the same using re's String method. 

### <a id="escape" href="#escape">func escape(b *strings.Builder, r rune, force bool)</a>

```
searchKey: syntax.escape
tags: [method private]
```

```Go
func escape(b *strings.Builder, r rune, force bool)
```

### <a id="isCharClass" href="#isCharClass">func isCharClass(re *Regexp) bool</a>

```
searchKey: syntax.isCharClass
tags: [method private]
```

```Go
func isCharClass(re *Regexp) bool
```

can this be represented as a character class? single-rune literal string, char class, ., and .|\n. 

### <a id="isUpperFold" href="#isUpperFold">func isUpperFold(r rune) bool</a>

```
searchKey: syntax.isUpperFold
tags: [method private]
```

```Go
func isUpperFold(r rune) bool
```

### <a id="isValidCaptureName" href="#isValidCaptureName">func isValidCaptureName(name string) bool</a>

```
searchKey: syntax.isValidCaptureName
tags: [method private]
```

```Go
func isValidCaptureName(name string) bool
```

isValidCaptureName reports whether name is a valid capture name: [A-Za-z0-9_]+. PCRE limits names to 32 bytes. Python rejects names starting with digits. We don't enforce either of those. 

### <a id="isalnum" href="#isalnum">func isalnum(c rune) bool</a>

```
searchKey: syntax.isalnum
tags: [method private]
```

```Go
func isalnum(c rune) bool
```

### <a id="matchRune" href="#matchRune">func matchRune(re *Regexp, r rune) bool</a>

```
searchKey: syntax.matchRune
tags: [method private]
```

```Go
func matchRune(re *Regexp, r rune) bool
```

does re match r? 

### <a id="mergeCharClass" href="#mergeCharClass">func mergeCharClass(dst, src *Regexp)</a>

```
searchKey: syntax.mergeCharClass
tags: [method private]
```

```Go
func mergeCharClass(dst, src *Regexp)
```

mergeCharClass makes dst = dst|src. The caller must ensure that dst.Op >= src.Op, to reduce the amount of copying. 

### <a id="minFoldRune" href="#minFoldRune">func minFoldRune(r rune) rune</a>

```
searchKey: syntax.minFoldRune
tags: [method private]
```

```Go
func minFoldRune(r rune) rune
```

minFoldRune returns the minimum rune fold-equivalent to r. 

### <a id="mkCharClass" href="#mkCharClass">func mkCharClass(f func(rune) bool) string</a>

```
searchKey: syntax.mkCharClass
tags: [method private]
```

```Go
func mkCharClass(f func(rune) bool) string
```

### <a id="negateClass" href="#negateClass">func negateClass(r []rune) []rune</a>

```
searchKey: syntax.negateClass
tags: [method private]
```

```Go
func negateClass(r []rune) []rune
```

negateClass overwrites r and returns r's negation. It assumes the class r is already clean. 

### <a id="nextRune" href="#nextRune">func nextRune(s string) (c rune, t string, err error)</a>

```
searchKey: syntax.nextRune
tags: [method private]
```

```Go
func nextRune(s string) (c rune, t string, err error)
```

### <a id="repeatIsValid" href="#repeatIsValid">func repeatIsValid(re *Regexp, n int) bool</a>

```
searchKey: syntax.repeatIsValid
tags: [method private]
```

```Go
func repeatIsValid(re *Regexp, n int) bool
```

repeatIsValid reports whether the repetition re is valid. Valid means that the combination of the top-level repetition and any inner repetitions does not exceed n copies of the innermost thing. This function rewalks the regexp tree and is called for every repetition, so we have to worry about inducing quadratic behavior in the parser. We avoid this by only calling repeatIsValid when min or max >= 2. In that case the depth of any >= 2 nesting can only get to 9 without triggering a parse error, so each subtree can only be rewalked 9 times. 

### <a id="testParseDump" href="#testParseDump">func testParseDump(t *testing.T, tests []parseTest, flags Flags)</a>

```
searchKey: syntax.testParseDump
tags: [method private]
```

```Go
func testParseDump(t *testing.T, tests []parseTest, flags Flags)
```

Test Parse -> Dump. 

### <a id="u32" href="#u32">func u32(i uint32) string</a>

```
searchKey: syntax.u32
tags: [method private]
```

```Go
func u32(i uint32) string
```

### <a id="unhex" href="#unhex">func unhex(c rune) rune</a>

```
searchKey: syntax.unhex
tags: [method private]
```

```Go
func unhex(c rune) rune
```

### <a id="unicodeTable" href="#unicodeTable">func unicodeTable(name string) (*unicode.RangeTable, *unicode.RangeTable)</a>

```
searchKey: syntax.unicodeTable
tags: [method private]
```

```Go
func unicodeTable(name string) (*unicode.RangeTable, *unicode.RangeTable)
```

unicodeTable returns the unicode.RangeTable identified by name and the table of additional fold-equivalent code points. 

### <a id="writeRegexp" href="#writeRegexp">func writeRegexp(b *strings.Builder, re *Regexp)</a>

```
searchKey: syntax.writeRegexp
tags: [method private]
```

```Go
func writeRegexp(b *strings.Builder, re *Regexp)
```

writeRegexp writes the Perl syntax for the regular expression re to b. 

