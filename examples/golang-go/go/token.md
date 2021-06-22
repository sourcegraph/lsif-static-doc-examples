# Package token

Package token defines constants representing the lexical tokens of the Go programming language and basic operations on tokens (printing, predicates). 

## Index

* [Constants](#const)
    * [const NoPos](#NoPos)
    * [const ILLEGAL](#ILLEGAL)
    * [const EOF](#EOF)
    * [const COMMENT](#COMMENT)
    * [const literal_beg](#literal_beg)
    * [const IDENT](#IDENT)
    * [const INT](#INT)
    * [const FLOAT](#FLOAT)
    * [const IMAG](#IMAG)
    * [const CHAR](#CHAR)
    * [const STRING](#STRING)
    * [const literal_end](#literal_end)
    * [const operator_beg](#operator_beg)
    * [const ADD](#ADD)
    * [const SUB](#SUB)
    * [const MUL](#MUL)
    * [const QUO](#QUO)
    * [const REM](#REM)
    * [const AND](#AND)
    * [const OR](#OR)
    * [const XOR](#XOR)
    * [const SHL](#SHL)
    * [const SHR](#SHR)
    * [const AND_NOT](#AND_NOT)
    * [const ADD_ASSIGN](#ADD_ASSIGN)
    * [const SUB_ASSIGN](#SUB_ASSIGN)
    * [const MUL_ASSIGN](#MUL_ASSIGN)
    * [const QUO_ASSIGN](#QUO_ASSIGN)
    * [const REM_ASSIGN](#REM_ASSIGN)
    * [const AND_ASSIGN](#AND_ASSIGN)
    * [const OR_ASSIGN](#OR_ASSIGN)
    * [const XOR_ASSIGN](#XOR_ASSIGN)
    * [const SHL_ASSIGN](#SHL_ASSIGN)
    * [const SHR_ASSIGN](#SHR_ASSIGN)
    * [const AND_NOT_ASSIGN](#AND_NOT_ASSIGN)
    * [const LAND](#LAND)
    * [const LOR](#LOR)
    * [const ARROW](#ARROW)
    * [const INC](#INC)
    * [const DEC](#DEC)
    * [const EQL](#EQL)
    * [const LSS](#LSS)
    * [const GTR](#GTR)
    * [const ASSIGN](#ASSIGN)
    * [const NOT](#NOT)
    * [const NEQ](#NEQ)
    * [const LEQ](#LEQ)
    * [const GEQ](#GEQ)
    * [const DEFINE](#DEFINE)
    * [const ELLIPSIS](#ELLIPSIS)
    * [const LPAREN](#LPAREN)
    * [const LBRACK](#LBRACK)
    * [const LBRACE](#LBRACE)
    * [const COMMA](#COMMA)
    * [const PERIOD](#PERIOD)
    * [const RPAREN](#RPAREN)
    * [const RBRACK](#RBRACK)
    * [const RBRACE](#RBRACE)
    * [const SEMICOLON](#SEMICOLON)
    * [const COLON](#COLON)
    * [const operator_end](#operator_end)
    * [const keyword_beg](#keyword_beg)
    * [const BREAK](#BREAK)
    * [const CASE](#CASE)
    * [const CHAN](#CHAN)
    * [const CONST](#CONST)
    * [const CONTINUE](#CONTINUE)
    * [const DEFAULT](#DEFAULT)
    * [const DEFER](#DEFER)
    * [const ELSE](#ELSE)
    * [const FALLTHROUGH](#FALLTHROUGH)
    * [const FOR](#FOR)
    * [const FUNC](#FUNC)
    * [const GO](#GO)
    * [const GOTO](#GOTO)
    * [const IF](#IF)
    * [const IMPORT](#IMPORT)
    * [const INTERFACE](#INTERFACE)
    * [const MAP](#MAP)
    * [const PACKAGE](#PACKAGE)
    * [const RANGE](#RANGE)
    * [const RETURN](#RETURN)
    * [const SELECT](#SELECT)
    * [const STRUCT](#STRUCT)
    * [const SWITCH](#SWITCH)
    * [const TYPE](#TYPE)
    * [const VAR](#VAR)
    * [const keyword_end](#keyword_end)
    * [const LowestPrec](#LowestPrec)
    * [const UnaryPrec](#UnaryPrec)
    * [const HighestPrec](#HighestPrec)
* [Variables](#var)
    * [var tokens](#tokens)
    * [var keywords](#keywords)
    * [var tests](#tests)
* [Types](#type)
    * [type Position struct](#Position)
        * [func (pos *Position) IsValid() bool](#Position.IsValid)
        * [func (pos Position) String() string](#Position.String)
    * [type Pos int](#Pos)
        * [func (p Pos) IsValid() bool](#Pos.IsValid)
    * [type File struct](#File)
        * [func (f *File) Name() string](#File.Name)
        * [func (f *File) Base() int](#File.Base)
        * [func (f *File) Size() int](#File.Size)
        * [func (f *File) LineCount() int](#File.LineCount)
        * [func (f *File) AddLine(offset int)](#File.AddLine)
        * [func (f *File) MergeLine(line int)](#File.MergeLine)
        * [func (f *File) SetLines(lines []int) bool](#File.SetLines)
        * [func (f *File) SetLinesForContent(content []byte)](#File.SetLinesForContent)
        * [func (f *File) LineStart(line int) Pos](#File.LineStart)
        * [func (f *File) AddLineInfo(offset int, filename string, line int)](#File.AddLineInfo)
        * [func (f *File) AddLineColumnInfo(offset int, filename string, line, column int)](#File.AddLineColumnInfo)
        * [func (f *File) Pos(offset int) Pos](#File.Pos)
        * [func (f *File) Offset(p Pos) int](#File.Offset)
        * [func (f *File) Line(p Pos) int](#File.Line)
        * [func (f *File) unpack(offset int, adjusted bool) (filename string, line, column int)](#File.unpack)
        * [func (f *File) position(p Pos, adjusted bool) (pos Position)](#File.position)
        * [func (f *File) PositionFor(p Pos, adjusted bool) (pos Position)](#File.PositionFor)
        * [func (f *File) Position(p Pos) (pos Position)](#File.Position)
    * [type lineInfo struct](#lineInfo)
    * [type FileSet struct](#FileSet)
        * [func NewFileSet() *FileSet](#NewFileSet)
        * [func (s *FileSet) Base() int](#FileSet.Base)
        * [func (s *FileSet) AddFile(filename string, base, size int) *File](#FileSet.AddFile)
        * [func (s *FileSet) Iterate(f func(*File) bool)](#FileSet.Iterate)
        * [func (s *FileSet) file(p Pos) *File](#FileSet.file)
        * [func (s *FileSet) File(p Pos) (f *File)](#FileSet.File)
        * [func (s *FileSet) PositionFor(p Pos, adjusted bool) (pos Position)](#FileSet.PositionFor)
        * [func (s *FileSet) Position(p Pos) (pos Position)](#FileSet.Position)
        * [func (s *FileSet) Read(decode func(interface{}) error) error](#FileSet.Read)
        * [func (s *FileSet) Write(encode func(interface{}) error) error](#FileSet.Write)
    * [type serializedFile struct](#serializedFile)
    * [type serializedFileSet struct](#serializedFileSet)
    * [type Token int](#Token)
        * [func Lookup(ident string) Token](#Lookup)
        * [func (tok Token) String() string](#Token.String)
        * [func (op Token) Precedence() int](#Token.Precedence)
        * [func (tok Token) IsLiteral() bool](#Token.IsLiteral)
        * [func (tok Token) IsOperator() bool](#Token.IsOperator)
        * [func (tok Token) IsKeyword() bool](#Token.IsKeyword)
* [Functions](#func)
    * [func searchLineInfos(a []lineInfo, x int) int](#searchLineInfos)
    * [func searchFiles(a []*File, x int) int](#searchFiles)
    * [func searchInts(a []int, x int) int](#searchInts)
    * [func init()](#init)
    * [func IsExported(name string) bool](#IsExported)
    * [func IsKeyword(name string) bool](#IsKeyword)
    * [func IsIdentifier(name string) bool](#IsIdentifier)
    * [func BenchmarkSearchInts(b *testing.B)](#BenchmarkSearchInts)
    * [func checkPos(t *testing.T, msg string, got, want Position)](#checkPos)
    * [func TestNoPos(t *testing.T)](#TestNoPos)
    * [func linecol(lines []int, offs int) (int, int)](#linecol)
    * [func verifyPositions(t *testing.T, fset *FileSet, f *File, lines []int)](#verifyPositions)
    * [func makeTestSource(size int, lines []int) []byte](#makeTestSource)
    * [func TestPositions(t *testing.T)](#TestPositions)
    * [func TestLineInfo(t *testing.T)](#TestLineInfo)
    * [func TestFiles(t *testing.T)](#TestFiles)
    * [func TestFileSetPastEnd(t *testing.T)](#TestFileSetPastEnd)
    * [func TestFileSetCacheUnlikely(t *testing.T)](#TestFileSetCacheUnlikely)
    * [func TestFileSetRace(t *testing.T)](#TestFileSetRace)
    * [func TestFileSetRace2(t *testing.T)](#TestFileSetRace2)
    * [func TestPositionFor(t *testing.T)](#TestPositionFor)
    * [func TestLineStart(t *testing.T)](#TestLineStart)
    * [func equal(p, q *FileSet) error](#equal)
    * [func checkSerialize(t *testing.T, p *FileSet)](#checkSerialize)
    * [func TestSerialization(t *testing.T)](#TestSerialization)
    * [func TestIsIdentifier(t *testing.T)](#TestIsIdentifier)


## <a id="const" href="#const">Constants</a>

```
tags: [exported]
```

### <a id="NoPos" href="#NoPos">const NoPos</a>

```
searchKey: token.NoPos
tags: [exported]
```

```Go
const NoPos Pos = 0
```

The zero value for Pos is NoPos; there is no file and line information associated with it, and NoPos.IsValid() is false. NoPos is always smaller than any other Pos value. The corresponding Position value for NoPos is the zero value for Position. 

### <a id="ILLEGAL" href="#ILLEGAL">const ILLEGAL</a>

```
searchKey: token.ILLEGAL
tags: [exported]
```

```Go
const ILLEGAL Token = iota
```

The list of tokens. 

Special tokens 

### <a id="EOF" href="#EOF">const EOF</a>

```
searchKey: token.EOF
tags: [exported]
```

```Go
const EOF
```

The list of tokens. 

### <a id="COMMENT" href="#COMMENT">const COMMENT</a>

```
searchKey: token.COMMENT
tags: [exported]
```

```Go
const COMMENT
```

The list of tokens. 

### <a id="literal_beg" href="#literal_beg">const literal_beg</a>

```
searchKey: token.literal_beg
```

```Go
const literal_beg
```

The list of tokens. 

### <a id="IDENT" href="#IDENT">const IDENT</a>

```
searchKey: token.IDENT
tags: [exported]
```

```Go
const IDENT // main

```

The list of tokens. 

Identifiers and basic type literals (these tokens stand for classes of literals) 

### <a id="INT" href="#INT">const INT</a>

```
searchKey: token.INT
tags: [exported]
```

```Go
const INT // 12345

```

The list of tokens. 

### <a id="FLOAT" href="#FLOAT">const FLOAT</a>

```
searchKey: token.FLOAT
tags: [exported]
```

```Go
const FLOAT // 123.45

```

The list of tokens. 

### <a id="IMAG" href="#IMAG">const IMAG</a>

```
searchKey: token.IMAG
tags: [exported]
```

```Go
const IMAG // 123.45i

```

The list of tokens. 

### <a id="CHAR" href="#CHAR">const CHAR</a>

```
searchKey: token.CHAR
tags: [exported]
```

```Go
const CHAR // 'a'

```

The list of tokens. 

### <a id="STRING" href="#STRING">const STRING</a>

```
searchKey: token.STRING
tags: [exported]
```

```Go
const STRING // "abc"

```

The list of tokens. 

### <a id="literal_end" href="#literal_end">const literal_end</a>

```
searchKey: token.literal_end
```

```Go
const literal_end
```

The list of tokens. 

### <a id="operator_beg" href="#operator_beg">const operator_beg</a>

```
searchKey: token.operator_beg
```

```Go
const operator_beg
```

The list of tokens. 

### <a id="ADD" href="#ADD">const ADD</a>

```
searchKey: token.ADD
tags: [exported]
```

```Go
const ADD // +

```

The list of tokens. 

Operators and delimiters 

### <a id="SUB" href="#SUB">const SUB</a>

```
searchKey: token.SUB
tags: [exported]
```

```Go
const SUB // -

```

The list of tokens. 

### <a id="MUL" href="#MUL">const MUL</a>

```
searchKey: token.MUL
tags: [exported]
```

```Go
const MUL // *

```

The list of tokens. 

### <a id="QUO" href="#QUO">const QUO</a>

```
searchKey: token.QUO
tags: [exported]
```

```Go
const QUO // /

```

The list of tokens. 

### <a id="REM" href="#REM">const REM</a>

```
searchKey: token.REM
tags: [exported]
```

```Go
const REM // %

```

The list of tokens. 

### <a id="AND" href="#AND">const AND</a>

```
searchKey: token.AND
tags: [exported]
```

```Go
const AND // &

```

The list of tokens. 

### <a id="OR" href="#OR">const OR</a>

```
searchKey: token.OR
tags: [exported]
```

```Go
const OR // |

```

The list of tokens. 

### <a id="XOR" href="#XOR">const XOR</a>

```
searchKey: token.XOR
tags: [exported]
```

```Go
const XOR // ^

```

The list of tokens. 

### <a id="SHL" href="#SHL">const SHL</a>

```
searchKey: token.SHL
tags: [exported]
```

```Go
const SHL // <<

```

The list of tokens. 

### <a id="SHR" href="#SHR">const SHR</a>

```
searchKey: token.SHR
tags: [exported]
```

```Go
const SHR // >>

```

The list of tokens. 

### <a id="AND_NOT" href="#AND_NOT">const AND_NOT</a>

```
searchKey: token.AND_NOT
tags: [exported]
```

```Go
const AND_NOT // &^

```

The list of tokens. 

### <a id="ADD_ASSIGN" href="#ADD_ASSIGN">const ADD_ASSIGN</a>

```
searchKey: token.ADD_ASSIGN
tags: [exported]
```

```Go
const ADD_ASSIGN // +=

```

The list of tokens. 

### <a id="SUB_ASSIGN" href="#SUB_ASSIGN">const SUB_ASSIGN</a>

```
searchKey: token.SUB_ASSIGN
tags: [exported]
```

```Go
const SUB_ASSIGN // -=

```

The list of tokens. 

### <a id="MUL_ASSIGN" href="#MUL_ASSIGN">const MUL_ASSIGN</a>

```
searchKey: token.MUL_ASSIGN
tags: [exported]
```

```Go
const MUL_ASSIGN // *=

```

The list of tokens. 

### <a id="QUO_ASSIGN" href="#QUO_ASSIGN">const QUO_ASSIGN</a>

```
searchKey: token.QUO_ASSIGN
tags: [exported]
```

```Go
const QUO_ASSIGN // /=

```

The list of tokens. 

### <a id="REM_ASSIGN" href="#REM_ASSIGN">const REM_ASSIGN</a>

```
searchKey: token.REM_ASSIGN
tags: [exported]
```

```Go
const REM_ASSIGN // %=

```

The list of tokens. 

### <a id="AND_ASSIGN" href="#AND_ASSIGN">const AND_ASSIGN</a>

```
searchKey: token.AND_ASSIGN
tags: [exported]
```

```Go
const AND_ASSIGN // &=

```

The list of tokens. 

### <a id="OR_ASSIGN" href="#OR_ASSIGN">const OR_ASSIGN</a>

```
searchKey: token.OR_ASSIGN
tags: [exported]
```

```Go
const OR_ASSIGN // |=

```

The list of tokens. 

### <a id="XOR_ASSIGN" href="#XOR_ASSIGN">const XOR_ASSIGN</a>

```
searchKey: token.XOR_ASSIGN
tags: [exported]
```

```Go
const XOR_ASSIGN // ^=

```

The list of tokens. 

### <a id="SHL_ASSIGN" href="#SHL_ASSIGN">const SHL_ASSIGN</a>

```
searchKey: token.SHL_ASSIGN
tags: [exported]
```

```Go
const SHL_ASSIGN // <<=

```

The list of tokens. 

### <a id="SHR_ASSIGN" href="#SHR_ASSIGN">const SHR_ASSIGN</a>

```
searchKey: token.SHR_ASSIGN
tags: [exported]
```

```Go
const SHR_ASSIGN // >>=

```

The list of tokens. 

### <a id="AND_NOT_ASSIGN" href="#AND_NOT_ASSIGN">const AND_NOT_ASSIGN</a>

```
searchKey: token.AND_NOT_ASSIGN
tags: [exported]
```

```Go
const AND_NOT_ASSIGN // &^=

```

The list of tokens. 

### <a id="LAND" href="#LAND">const LAND</a>

```
searchKey: token.LAND
tags: [exported]
```

```Go
const LAND // &&

```

The list of tokens. 

### <a id="LOR" href="#LOR">const LOR</a>

```
searchKey: token.LOR
tags: [exported]
```

```Go
const LOR // ||

```

The list of tokens. 

### <a id="ARROW" href="#ARROW">const ARROW</a>

```
searchKey: token.ARROW
tags: [exported]
```

```Go
const ARROW // <-

```

The list of tokens. 

### <a id="INC" href="#INC">const INC</a>

```
searchKey: token.INC
tags: [exported]
```

```Go
const INC // ++

```

The list of tokens. 

### <a id="DEC" href="#DEC">const DEC</a>

```
searchKey: token.DEC
tags: [exported]
```

```Go
const DEC // --

```

The list of tokens. 

### <a id="EQL" href="#EQL">const EQL</a>

```
searchKey: token.EQL
tags: [exported]
```

```Go
const EQL // ==

```

The list of tokens. 

### <a id="LSS" href="#LSS">const LSS</a>

```
searchKey: token.LSS
tags: [exported]
```

```Go
const LSS // <

```

The list of tokens. 

### <a id="GTR" href="#GTR">const GTR</a>

```
searchKey: token.GTR
tags: [exported]
```

```Go
const GTR // >

```

The list of tokens. 

### <a id="ASSIGN" href="#ASSIGN">const ASSIGN</a>

```
searchKey: token.ASSIGN
tags: [exported]
```

```Go
const ASSIGN // =

```

The list of tokens. 

### <a id="NOT" href="#NOT">const NOT</a>

```
searchKey: token.NOT
tags: [exported]
```

```Go
const NOT // !

```

The list of tokens. 

### <a id="NEQ" href="#NEQ">const NEQ</a>

```
searchKey: token.NEQ
tags: [exported]
```

```Go
const NEQ // !=

```

The list of tokens. 

### <a id="LEQ" href="#LEQ">const LEQ</a>

```
searchKey: token.LEQ
tags: [exported]
```

```Go
const LEQ // <=

```

The list of tokens. 

### <a id="GEQ" href="#GEQ">const GEQ</a>

```
searchKey: token.GEQ
tags: [exported]
```

```Go
const GEQ // >=

```

The list of tokens. 

### <a id="DEFINE" href="#DEFINE">const DEFINE</a>

```
searchKey: token.DEFINE
tags: [exported]
```

```Go
const DEFINE // :=

```

The list of tokens. 

### <a id="ELLIPSIS" href="#ELLIPSIS">const ELLIPSIS</a>

```
searchKey: token.ELLIPSIS
tags: [exported]
```

```Go
const ELLIPSIS // ...

```

The list of tokens. 

### <a id="LPAREN" href="#LPAREN">const LPAREN</a>

```
searchKey: token.LPAREN
tags: [exported]
```

```Go
const LPAREN // (

```

The list of tokens. 

### <a id="LBRACK" href="#LBRACK">const LBRACK</a>

```
searchKey: token.LBRACK
tags: [exported]
```

```Go
const LBRACK // [

```

The list of tokens. 

### <a id="LBRACE" href="#LBRACE">const LBRACE</a>

```
searchKey: token.LBRACE
tags: [exported]
```

```Go
const LBRACE // {

```

The list of tokens. 

### <a id="COMMA" href="#COMMA">const COMMA</a>

```
searchKey: token.COMMA
tags: [exported]
```

```Go
const COMMA // ,

```

The list of tokens. 

### <a id="PERIOD" href="#PERIOD">const PERIOD</a>

```
searchKey: token.PERIOD
tags: [exported]
```

```Go
const PERIOD // .

```

The list of tokens. 

### <a id="RPAREN" href="#RPAREN">const RPAREN</a>

```
searchKey: token.RPAREN
tags: [exported]
```

```Go
const RPAREN // )

```

The list of tokens. 

### <a id="RBRACK" href="#RBRACK">const RBRACK</a>

```
searchKey: token.RBRACK
tags: [exported]
```

```Go
const RBRACK // ]

```

The list of tokens. 

### <a id="RBRACE" href="#RBRACE">const RBRACE</a>

```
searchKey: token.RBRACE
tags: [exported]
```

```Go
const RBRACE // }

```

The list of tokens. 

### <a id="SEMICOLON" href="#SEMICOLON">const SEMICOLON</a>

```
searchKey: token.SEMICOLON
tags: [exported]
```

```Go
const SEMICOLON // ;

```

The list of tokens. 

### <a id="COLON" href="#COLON">const COLON</a>

```
searchKey: token.COLON
tags: [exported]
```

```Go
const COLON // :

```

The list of tokens. 

### <a id="operator_end" href="#operator_end">const operator_end</a>

```
searchKey: token.operator_end
```

```Go
const operator_end
```

The list of tokens. 

### <a id="keyword_beg" href="#keyword_beg">const keyword_beg</a>

```
searchKey: token.keyword_beg
```

```Go
const keyword_beg
```

The list of tokens. 

### <a id="BREAK" href="#BREAK">const BREAK</a>

```
searchKey: token.BREAK
tags: [exported]
```

```Go
const BREAK
```

The list of tokens. 

Keywords 

### <a id="CASE" href="#CASE">const CASE</a>

```
searchKey: token.CASE
tags: [exported]
```

```Go
const CASE
```

The list of tokens. 

### <a id="CHAN" href="#CHAN">const CHAN</a>

```
searchKey: token.CHAN
tags: [exported]
```

```Go
const CHAN
```

The list of tokens. 

### <a id="CONST" href="#CONST">const CONST</a>

```
searchKey: token.CONST
tags: [exported]
```

```Go
const CONST
```

The list of tokens. 

### <a id="CONTINUE" href="#CONTINUE">const CONTINUE</a>

```
searchKey: token.CONTINUE
tags: [exported]
```

```Go
const CONTINUE
```

The list of tokens. 

### <a id="DEFAULT" href="#DEFAULT">const DEFAULT</a>

```
searchKey: token.DEFAULT
tags: [exported]
```

```Go
const DEFAULT
```

The list of tokens. 

### <a id="DEFER" href="#DEFER">const DEFER</a>

```
searchKey: token.DEFER
tags: [exported]
```

```Go
const DEFER
```

The list of tokens. 

### <a id="ELSE" href="#ELSE">const ELSE</a>

```
searchKey: token.ELSE
tags: [exported]
```

```Go
const ELSE
```

The list of tokens. 

### <a id="FALLTHROUGH" href="#FALLTHROUGH">const FALLTHROUGH</a>

```
searchKey: token.FALLTHROUGH
tags: [exported]
```

```Go
const FALLTHROUGH
```

The list of tokens. 

### <a id="FOR" href="#FOR">const FOR</a>

```
searchKey: token.FOR
tags: [exported]
```

```Go
const FOR
```

The list of tokens. 

### <a id="FUNC" href="#FUNC">const FUNC</a>

```
searchKey: token.FUNC
tags: [exported]
```

```Go
const FUNC
```

The list of tokens. 

### <a id="GO" href="#GO">const GO</a>

```
searchKey: token.GO
tags: [exported]
```

```Go
const GO
```

The list of tokens. 

### <a id="GOTO" href="#GOTO">const GOTO</a>

```
searchKey: token.GOTO
tags: [exported]
```

```Go
const GOTO
```

The list of tokens. 

### <a id="IF" href="#IF">const IF</a>

```
searchKey: token.IF
tags: [exported]
```

```Go
const IF
```

The list of tokens. 

### <a id="IMPORT" href="#IMPORT">const IMPORT</a>

```
searchKey: token.IMPORT
tags: [exported]
```

```Go
const IMPORT
```

The list of tokens. 

### <a id="INTERFACE" href="#INTERFACE">const INTERFACE</a>

```
searchKey: token.INTERFACE
tags: [exported]
```

```Go
const INTERFACE
```

The list of tokens. 

### <a id="MAP" href="#MAP">const MAP</a>

```
searchKey: token.MAP
tags: [exported]
```

```Go
const MAP
```

The list of tokens. 

### <a id="PACKAGE" href="#PACKAGE">const PACKAGE</a>

```
searchKey: token.PACKAGE
tags: [exported]
```

```Go
const PACKAGE
```

The list of tokens. 

### <a id="RANGE" href="#RANGE">const RANGE</a>

```
searchKey: token.RANGE
tags: [exported]
```

```Go
const RANGE
```

The list of tokens. 

### <a id="RETURN" href="#RETURN">const RETURN</a>

```
searchKey: token.RETURN
tags: [exported]
```

```Go
const RETURN
```

The list of tokens. 

### <a id="SELECT" href="#SELECT">const SELECT</a>

```
searchKey: token.SELECT
tags: [exported]
```

```Go
const SELECT
```

The list of tokens. 

### <a id="STRUCT" href="#STRUCT">const STRUCT</a>

```
searchKey: token.STRUCT
tags: [exported]
```

```Go
const STRUCT
```

The list of tokens. 

### <a id="SWITCH" href="#SWITCH">const SWITCH</a>

```
searchKey: token.SWITCH
tags: [exported]
```

```Go
const SWITCH
```

The list of tokens. 

### <a id="TYPE" href="#TYPE">const TYPE</a>

```
searchKey: token.TYPE
tags: [exported]
```

```Go
const TYPE
```

The list of tokens. 

### <a id="VAR" href="#VAR">const VAR</a>

```
searchKey: token.VAR
tags: [exported]
```

```Go
const VAR
```

The list of tokens. 

### <a id="keyword_end" href="#keyword_end">const keyword_end</a>

```
searchKey: token.keyword_end
```

```Go
const keyword_end
```

The list of tokens. 

### <a id="LowestPrec" href="#LowestPrec">const LowestPrec</a>

```
searchKey: token.LowestPrec
tags: [exported]
```

```Go
const LowestPrec = 0 // non-operators

```

A set of constants for precedence-based expression parsing. Non-operators have lowest precedence, followed by operators starting with precedence 1 up to unary operators. The highest precedence serves as "catch-all" precedence for selector, indexing, and other operator and delimiter tokens. 

### <a id="UnaryPrec" href="#UnaryPrec">const UnaryPrec</a>

```
searchKey: token.UnaryPrec
tags: [exported]
```

```Go
const UnaryPrec = 6
```

A set of constants for precedence-based expression parsing. Non-operators have lowest precedence, followed by operators starting with precedence 1 up to unary operators. The highest precedence serves as "catch-all" precedence for selector, indexing, and other operator and delimiter tokens. 

### <a id="HighestPrec" href="#HighestPrec">const HighestPrec</a>

```
searchKey: token.HighestPrec
tags: [exported]
```

```Go
const HighestPrec = 7
```

A set of constants for precedence-based expression parsing. Non-operators have lowest precedence, followed by operators starting with precedence 1 up to unary operators. The highest precedence serves as "catch-all" precedence for selector, indexing, and other operator and delimiter tokens. 

## <a id="var" href="#var">Variables</a>

```
tags: [exported]
```

### <a id="tokens" href="#tokens">var tokens</a>

```
searchKey: token.tokens
```

```Go
var tokens = ...
```

### <a id="keywords" href="#keywords">var keywords</a>

```
searchKey: token.keywords
```

```Go
var keywords map[string]Token
```

### <a id="tests" href="#tests">var tests</a>

```
searchKey: token.tests
```

```Go
var tests = ...
```

## <a id="type" href="#type">Types</a>

```
tags: [exported]
```

### <a id="Position" href="#Position">type Position struct</a>

```
searchKey: token.Position
tags: [exported]
```

```Go
type Position struct {
	Filename string // filename, if any
	Offset   int    // offset, starting at 0
	Line     int    // line number, starting at 1
	Column   int    // column number, starting at 1 (byte count)
}
```

Position describes an arbitrary source position including the file, line, and column location. A Position is valid if the line number is > 0. 

#### <a id="Position.IsValid" href="#Position.IsValid">func (pos *Position) IsValid() bool</a>

```
searchKey: token.Position.IsValid
tags: [exported]
```

```Go
func (pos *Position) IsValid() bool
```

IsValid reports whether the position is valid. 

#### <a id="Position.String" href="#Position.String">func (pos Position) String() string</a>

```
searchKey: token.Position.String
tags: [exported]
```

```Go
func (pos Position) String() string
```

String returns a string in one of several forms: 

```
file:line:column    valid position with file name
file:line           valid position with file name but no column (column == 0)
line:column         valid position without file name
line                valid position without file name and no column (column == 0)
file                invalid position with file name
-                   invalid position without file name

```
### <a id="Pos" href="#Pos">type Pos int</a>

```
searchKey: token.Pos
tags: [exported]
```

```Go
type Pos int
```

Pos is a compact encoding of a source position within a file set. It can be converted into a Position for a more convenient, but much larger, representation. 

The Pos value for a given file is a number in the range [base, base+size], where base and size are specified when a file is added to the file set. The difference between a Pos value and the corresponding file base corresponds to the byte offset of that position (represented by the Pos value) from the beginning of the file. Thus, the file base offset is the Pos value representing the first byte in the file. 

To create the Pos value for a specific source offset (measured in bytes), first add the respective file to the current file set using FileSet.AddFile and then call File.Pos(offset) for that file. Given a Pos value p for a specific file set fset, the corresponding Position value is obtained by calling fset.Position(p). 

Pos values can be compared directly with the usual comparison operators: If two Pos values p and q are in the same file, comparing p and q is equivalent to comparing the respective source file offsets. If p and q are in different files, p < q is true if the file implied by p was added to the respective file set before the file implied by q. 

#### <a id="Pos.IsValid" href="#Pos.IsValid">func (p Pos) IsValid() bool</a>

```
searchKey: token.Pos.IsValid
tags: [exported]
```

```Go
func (p Pos) IsValid() bool
```

IsValid reports whether the position is valid. 

### <a id="File" href="#File">type File struct</a>

```
searchKey: token.File
tags: [exported]
```

```Go
type File struct {
	set  *FileSet
	name string // file name as provided to AddFile
	base int    // Pos value range for this file is [base...base+size]
	size int    // file size as provided to AddFile

	// lines and infos are protected by mutex
	mutex sync.Mutex
	lines []int // lines contains the offset of the first character for each line (the first entry is always 0)
	infos []lineInfo
}
```

A File is a handle for a file belonging to a FileSet. A File has a name, size, and line offset table. 

#### <a id="File.Name" href="#File.Name">func (f *File) Name() string</a>

```
searchKey: token.File.Name
tags: [exported]
```

```Go
func (f *File) Name() string
```

Name returns the file name of file f as registered with AddFile. 

#### <a id="File.Base" href="#File.Base">func (f *File) Base() int</a>

```
searchKey: token.File.Base
tags: [exported]
```

```Go
func (f *File) Base() int
```

Base returns the base offset of file f as registered with AddFile. 

#### <a id="File.Size" href="#File.Size">func (f *File) Size() int</a>

```
searchKey: token.File.Size
tags: [exported]
```

```Go
func (f *File) Size() int
```

Size returns the size of file f as registered with AddFile. 

#### <a id="File.LineCount" href="#File.LineCount">func (f *File) LineCount() int</a>

```
searchKey: token.File.LineCount
tags: [exported]
```

```Go
func (f *File) LineCount() int
```

LineCount returns the number of lines in file f. 

#### <a id="File.AddLine" href="#File.AddLine">func (f *File) AddLine(offset int)</a>

```
searchKey: token.File.AddLine
tags: [exported]
```

```Go
func (f *File) AddLine(offset int)
```

AddLine adds the line offset for a new line. The line offset must be larger than the offset for the previous line and smaller than the file size; otherwise the line offset is ignored. 

#### <a id="File.MergeLine" href="#File.MergeLine">func (f *File) MergeLine(line int)</a>

```
searchKey: token.File.MergeLine
tags: [exported]
```

```Go
func (f *File) MergeLine(line int)
```

MergeLine merges a line with the following line. It is akin to replacing the newline character at the end of the line with a space (to not change the remaining offsets). To obtain the line number, consult e.g. Position.Line. MergeLine will panic if given an invalid line number. 

#### <a id="File.SetLines" href="#File.SetLines">func (f *File) SetLines(lines []int) bool</a>

```
searchKey: token.File.SetLines
tags: [exported]
```

```Go
func (f *File) SetLines(lines []int) bool
```

SetLines sets the line offsets for a file and reports whether it succeeded. The line offsets are the offsets of the first character of each line; for instance for the content "ab\nc\n" the line offsets are {0, 3}. An empty file has an empty line offset table. Each line offset must be larger than the offset for the previous line and smaller than the file size; otherwise SetLines fails and returns false. Callers must not mutate the provided slice after SetLines returns. 

#### <a id="File.SetLinesForContent" href="#File.SetLinesForContent">func (f *File) SetLinesForContent(content []byte)</a>

```
searchKey: token.File.SetLinesForContent
tags: [exported]
```

```Go
func (f *File) SetLinesForContent(content []byte)
```

SetLinesForContent sets the line offsets for the given file content. It ignores position-altering //line comments. 

#### <a id="File.LineStart" href="#File.LineStart">func (f *File) LineStart(line int) Pos</a>

```
searchKey: token.File.LineStart
tags: [exported]
```

```Go
func (f *File) LineStart(line int) Pos
```

LineStart returns the Pos value of the start of the specified line. It ignores any alternative positions set using AddLineColumnInfo. LineStart panics if the 1-based line number is invalid. 

#### <a id="File.AddLineInfo" href="#File.AddLineInfo">func (f *File) AddLineInfo(offset int, filename string, line int)</a>

```
searchKey: token.File.AddLineInfo
tags: [exported]
```

```Go
func (f *File) AddLineInfo(offset int, filename string, line int)
```

AddLineInfo is like AddLineColumnInfo with a column = 1 argument. It is here for backward-compatibility for code prior to Go 1.11. 

#### <a id="File.AddLineColumnInfo" href="#File.AddLineColumnInfo">func (f *File) AddLineColumnInfo(offset int, filename string, line, column int)</a>

```
searchKey: token.File.AddLineColumnInfo
tags: [exported]
```

```Go
func (f *File) AddLineColumnInfo(offset int, filename string, line, column int)
```

AddLineColumnInfo adds alternative file, line, and column number information for a given file offset. The offset must be larger than the offset for the previously added alternative line info and smaller than the file size; otherwise the information is ignored. 

AddLineColumnInfo is typically used to register alternative position information for line directives such as //line filename:line:column. 

#### <a id="File.Pos" href="#File.Pos">func (f *File) Pos(offset int) Pos</a>

```
searchKey: token.File.Pos
tags: [exported]
```

```Go
func (f *File) Pos(offset int) Pos
```

Pos returns the Pos value for the given file offset; the offset must be <= f.Size(). f.Pos(f.Offset(p)) == p. 

#### <a id="File.Offset" href="#File.Offset">func (f *File) Offset(p Pos) int</a>

```
searchKey: token.File.Offset
tags: [exported]
```

```Go
func (f *File) Offset(p Pos) int
```

Offset returns the offset for the given file position p; p must be a valid Pos value in that file. f.Offset(f.Pos(offset)) == offset. 

#### <a id="File.Line" href="#File.Line">func (f *File) Line(p Pos) int</a>

```
searchKey: token.File.Line
tags: [exported]
```

```Go
func (f *File) Line(p Pos) int
```

Line returns the line number for the given file position p; p must be a Pos value in that file or NoPos. 

#### <a id="File.unpack" href="#File.unpack">func (f *File) unpack(offset int, adjusted bool) (filename string, line, column int)</a>

```
searchKey: token.File.unpack
```

```Go
func (f *File) unpack(offset int, adjusted bool) (filename string, line, column int)
```

unpack returns the filename and line and column number for a file offset. If adjusted is set, unpack will return the filename and line information possibly adjusted by //line comments; otherwise those comments are ignored. 

#### <a id="File.position" href="#File.position">func (f *File) position(p Pos, adjusted bool) (pos Position)</a>

```
searchKey: token.File.position
```

```Go
func (f *File) position(p Pos, adjusted bool) (pos Position)
```

#### <a id="File.PositionFor" href="#File.PositionFor">func (f *File) PositionFor(p Pos, adjusted bool) (pos Position)</a>

```
searchKey: token.File.PositionFor
tags: [exported]
```

```Go
func (f *File) PositionFor(p Pos, adjusted bool) (pos Position)
```

PositionFor returns the Position value for the given file position p. If adjusted is set, the position may be adjusted by position-altering //line comments; otherwise those comments are ignored. p must be a Pos value in f or NoPos. 

#### <a id="File.Position" href="#File.Position">func (f *File) Position(p Pos) (pos Position)</a>

```
searchKey: token.File.Position
tags: [exported]
```

```Go
func (f *File) Position(p Pos) (pos Position)
```

Position returns the Position value for the given file position p. Calling f.Position(p) is equivalent to calling f.PositionFor(p, true). 

### <a id="lineInfo" href="#lineInfo">type lineInfo struct</a>

```
searchKey: token.lineInfo
```

```Go
type lineInfo struct {
	// fields are exported to make them accessible to gob
	Offset       int
	Filename     string
	Line, Column int
}
```

A lineInfo object describes alternative file, line, and column number information (such as provided via a //line directive) for a given file offset. 

### <a id="FileSet" href="#FileSet">type FileSet struct</a>

```
searchKey: token.FileSet
tags: [exported]
```

```Go
type FileSet struct {
	mutex sync.RWMutex // protects the file set
	base  int          // base offset for the next file
	files []*File      // list of files in the order added to the set
	last  *File        // cache of last file looked up
}
```

A FileSet represents a set of source files. Methods of file sets are synchronized; multiple goroutines may invoke them concurrently. 

The byte offsets for each file in a file set are mapped into distinct (integer) intervals, one interval [base, base+size] per file. Base represents the first byte in the file, and size is the corresponding file size. A Pos value is a value in such an interval. By determining the interval a Pos value belongs to, the file, its file base, and thus the byte offset (position) the Pos value is representing can be computed. 

When adding a new file, a file base must be provided. That can be any integer value that is past the end of any interval of any file already in the file set. For convenience, FileSet.Base provides such a value, which is simply the end of the Pos interval of the most recently added file, plus one. Unless there is a need to extend an interval later, using the FileSet.Base should be used as argument for FileSet.AddFile. 

#### <a id="NewFileSet" href="#NewFileSet">func NewFileSet() *FileSet</a>

```
searchKey: token.NewFileSet
tags: [exported]
```

```Go
func NewFileSet() *FileSet
```

NewFileSet creates a new file set. 

#### <a id="FileSet.Base" href="#FileSet.Base">func (s *FileSet) Base() int</a>

```
searchKey: token.FileSet.Base
tags: [exported]
```

```Go
func (s *FileSet) Base() int
```

Base returns the minimum base offset that must be provided to AddFile when adding the next file. 

#### <a id="FileSet.AddFile" href="#FileSet.AddFile">func (s *FileSet) AddFile(filename string, base, size int) *File</a>

```
searchKey: token.FileSet.AddFile
tags: [exported]
```

```Go
func (s *FileSet) AddFile(filename string, base, size int) *File
```

AddFile adds a new file with a given filename, base offset, and file size to the file set s and returns the file. Multiple files may have the same name. The base offset must not be smaller than the FileSet's Base(), and size must not be negative. As a special case, if a negative base is provided, the current value of the FileSet's Base() is used instead. 

Adding the file will set the file set's Base() value to base + size + 1 as the minimum base value for the next file. The following relationship exists between a Pos value p for a given file offset offs: 

```
int(p) = base + offs

```
with offs in the range [0, size] and thus p in the range [base, base+size]. For convenience, File.Pos may be used to create file-specific position values from a file offset. 

#### <a id="FileSet.Iterate" href="#FileSet.Iterate">func (s *FileSet) Iterate(f func(*File) bool)</a>

```
searchKey: token.FileSet.Iterate
tags: [exported]
```

```Go
func (s *FileSet) Iterate(f func(*File) bool)
```

Iterate calls f for the files in the file set in the order they were added until f returns false. 

#### <a id="FileSet.file" href="#FileSet.file">func (s *FileSet) file(p Pos) *File</a>

```
searchKey: token.FileSet.file
```

```Go
func (s *FileSet) file(p Pos) *File
```

#### <a id="FileSet.File" href="#FileSet.File">func (s *FileSet) File(p Pos) (f *File)</a>

```
searchKey: token.FileSet.File
tags: [exported]
```

```Go
func (s *FileSet) File(p Pos) (f *File)
```

File returns the file that contains the position p. If no such file is found (for instance for p == NoPos), the result is nil. 

#### <a id="FileSet.PositionFor" href="#FileSet.PositionFor">func (s *FileSet) PositionFor(p Pos, adjusted bool) (pos Position)</a>

```
searchKey: token.FileSet.PositionFor
tags: [exported]
```

```Go
func (s *FileSet) PositionFor(p Pos, adjusted bool) (pos Position)
```

PositionFor converts a Pos p in the fileset into a Position value. If adjusted is set, the position may be adjusted by position-altering //line comments; otherwise those comments are ignored. p must be a Pos value in s or NoPos. 

#### <a id="FileSet.Position" href="#FileSet.Position">func (s *FileSet) Position(p Pos) (pos Position)</a>

```
searchKey: token.FileSet.Position
tags: [exported]
```

```Go
func (s *FileSet) Position(p Pos) (pos Position)
```

Position converts a Pos p in the fileset into a Position value. Calling s.Position(p) is equivalent to calling s.PositionFor(p, true). 

#### <a id="FileSet.Read" href="#FileSet.Read">func (s *FileSet) Read(decode func(interface{}) error) error</a>

```
searchKey: token.FileSet.Read
tags: [exported]
```

```Go
func (s *FileSet) Read(decode func(interface{}) error) error
```

Read calls decode to deserialize a file set into s; s must not be nil. 

#### <a id="FileSet.Write" href="#FileSet.Write">func (s *FileSet) Write(encode func(interface{}) error) error</a>

```
searchKey: token.FileSet.Write
tags: [exported]
```

```Go
func (s *FileSet) Write(encode func(interface{}) error) error
```

Write calls encode to serialize the file set s. 

### <a id="serializedFile" href="#serializedFile">type serializedFile struct</a>

```
searchKey: token.serializedFile
```

```Go
type serializedFile struct {
	// fields correspond 1:1 to fields with same (lower-case) name in File
	Name  string
	Base  int
	Size  int
	Lines []int
	Infos []lineInfo
}
```

### <a id="serializedFileSet" href="#serializedFileSet">type serializedFileSet struct</a>

```
searchKey: token.serializedFileSet
```

```Go
type serializedFileSet struct {
	Base  int
	Files []serializedFile
}
```

### <a id="Token" href="#Token">type Token int</a>

```
searchKey: token.Token
tags: [exported]
```

```Go
type Token int
```

Token is the set of lexical tokens of the Go programming language. 

#### <a id="Lookup" href="#Lookup">func Lookup(ident string) Token</a>

```
searchKey: token.Lookup
tags: [exported]
```

```Go
func Lookup(ident string) Token
```

Lookup maps an identifier to its keyword token or IDENT (if not a keyword). 

#### <a id="Token.String" href="#Token.String">func (tok Token) String() string</a>

```
searchKey: token.Token.String
tags: [exported]
```

```Go
func (tok Token) String() string
```

String returns the string corresponding to the token tok. For operators, delimiters, and keywords the string is the actual token character sequence (e.g., for the token ADD, the string is "+"). For all other tokens the string corresponds to the token constant name (e.g. for the token IDENT, the string is "IDENT"). 

#### <a id="Token.Precedence" href="#Token.Precedence">func (op Token) Precedence() int</a>

```
searchKey: token.Token.Precedence
tags: [exported]
```

```Go
func (op Token) Precedence() int
```

Precedence returns the operator precedence of the binary operator op. If op is not a binary operator, the result is LowestPrecedence. 

#### <a id="Token.IsLiteral" href="#Token.IsLiteral">func (tok Token) IsLiteral() bool</a>

```
searchKey: token.Token.IsLiteral
tags: [exported]
```

```Go
func (tok Token) IsLiteral() bool
```

IsLiteral returns true for tokens corresponding to identifiers and basic type literals; it returns false otherwise. 

#### <a id="Token.IsOperator" href="#Token.IsOperator">func (tok Token) IsOperator() bool</a>

```
searchKey: token.Token.IsOperator
tags: [exported]
```

```Go
func (tok Token) IsOperator() bool
```

IsOperator returns true for tokens corresponding to operators and delimiters; it returns false otherwise. 

#### <a id="Token.IsKeyword" href="#Token.IsKeyword">func (tok Token) IsKeyword() bool</a>

```
searchKey: token.Token.IsKeyword
tags: [exported]
```

```Go
func (tok Token) IsKeyword() bool
```

IsKeyword returns true for tokens corresponding to keywords; it returns false otherwise. 

## <a id="func" href="#func">Functions</a>

```
tags: [exported]
```

### <a id="searchLineInfos" href="#searchLineInfos">func searchLineInfos(a []lineInfo, x int) int</a>

```
searchKey: token.searchLineInfos
```

```Go
func searchLineInfos(a []lineInfo, x int) int
```

### <a id="searchFiles" href="#searchFiles">func searchFiles(a []*File, x int) int</a>

```
searchKey: token.searchFiles
```

```Go
func searchFiles(a []*File, x int) int
```

### <a id="searchInts" href="#searchInts">func searchInts(a []int, x int) int</a>

```
searchKey: token.searchInts
```

```Go
func searchInts(a []int, x int) int
```

### <a id="init" href="#init">func init()</a>

```
searchKey: token.init
```

```Go
func init()
```

### <a id="IsExported" href="#IsExported">func IsExported(name string) bool</a>

```
searchKey: token.IsExported
tags: [exported]
```

```Go
func IsExported(name string) bool
```

IsExported reports whether name starts with an upper-case letter. 

### <a id="IsKeyword" href="#IsKeyword">func IsKeyword(name string) bool</a>

```
searchKey: token.IsKeyword
tags: [exported]
```

```Go
func IsKeyword(name string) bool
```

IsKeyword reports whether name is a Go keyword, such as "func" or "return". 

### <a id="IsIdentifier" href="#IsIdentifier">func IsIdentifier(name string) bool</a>

```
searchKey: token.IsIdentifier
tags: [exported]
```

```Go
func IsIdentifier(name string) bool
```

IsIdentifier reports whether name is a Go identifier, that is, a non-empty string made up of letters, digits, and underscores, where the first character is not a digit. Keywords are not identifiers. 

### <a id="BenchmarkSearchInts" href="#BenchmarkSearchInts">func BenchmarkSearchInts(b *testing.B)</a>

```
searchKey: token.BenchmarkSearchInts
```

```Go
func BenchmarkSearchInts(b *testing.B)
```

### <a id="checkPos" href="#checkPos">func checkPos(t *testing.T, msg string, got, want Position)</a>

```
searchKey: token.checkPos
```

```Go
func checkPos(t *testing.T, msg string, got, want Position)
```

### <a id="TestNoPos" href="#TestNoPos">func TestNoPos(t *testing.T)</a>

```
searchKey: token.TestNoPos
```

```Go
func TestNoPos(t *testing.T)
```

### <a id="linecol" href="#linecol">func linecol(lines []int, offs int) (int, int)</a>

```
searchKey: token.linecol
```

```Go
func linecol(lines []int, offs int) (int, int)
```

### <a id="verifyPositions" href="#verifyPositions">func verifyPositions(t *testing.T, fset *FileSet, f *File, lines []int)</a>

```
searchKey: token.verifyPositions
```

```Go
func verifyPositions(t *testing.T, fset *FileSet, f *File, lines []int)
```

### <a id="makeTestSource" href="#makeTestSource">func makeTestSource(size int, lines []int) []byte</a>

```
searchKey: token.makeTestSource
```

```Go
func makeTestSource(size int, lines []int) []byte
```

### <a id="TestPositions" href="#TestPositions">func TestPositions(t *testing.T)</a>

```
searchKey: token.TestPositions
```

```Go
func TestPositions(t *testing.T)
```

### <a id="TestLineInfo" href="#TestLineInfo">func TestLineInfo(t *testing.T)</a>

```
searchKey: token.TestLineInfo
```

```Go
func TestLineInfo(t *testing.T)
```

### <a id="TestFiles" href="#TestFiles">func TestFiles(t *testing.T)</a>

```
searchKey: token.TestFiles
```

```Go
func TestFiles(t *testing.T)
```

### <a id="TestFileSetPastEnd" href="#TestFileSetPastEnd">func TestFileSetPastEnd(t *testing.T)</a>

```
searchKey: token.TestFileSetPastEnd
```

```Go
func TestFileSetPastEnd(t *testing.T)
```

FileSet.File should return nil if Pos is past the end of the FileSet. 

### <a id="TestFileSetCacheUnlikely" href="#TestFileSetCacheUnlikely">func TestFileSetCacheUnlikely(t *testing.T)</a>

```
searchKey: token.TestFileSetCacheUnlikely
```

```Go
func TestFileSetCacheUnlikely(t *testing.T)
```

### <a id="TestFileSetRace" href="#TestFileSetRace">func TestFileSetRace(t *testing.T)</a>

```
searchKey: token.TestFileSetRace
```

```Go
func TestFileSetRace(t *testing.T)
```

issue 4345. Test that concurrent use of FileSet.Pos does not trigger a race in the FileSet position cache. 

### <a id="TestFileSetRace2" href="#TestFileSetRace2">func TestFileSetRace2(t *testing.T)</a>

```
searchKey: token.TestFileSetRace2
```

```Go
func TestFileSetRace2(t *testing.T)
```

issue 16548. Test that concurrent use of File.AddLine and FileSet.PositionFor does not trigger a race in the FileSet position cache. 

### <a id="TestPositionFor" href="#TestPositionFor">func TestPositionFor(t *testing.T)</a>

```
searchKey: token.TestPositionFor
```

```Go
func TestPositionFor(t *testing.T)
```

### <a id="TestLineStart" href="#TestLineStart">func TestLineStart(t *testing.T)</a>

```
searchKey: token.TestLineStart
```

```Go
func TestLineStart(t *testing.T)
```

### <a id="equal" href="#equal">func equal(p, q *FileSet) error</a>

```
searchKey: token.equal
```

```Go
func equal(p, q *FileSet) error
```

equal returns nil if p and q describe the same file set; otherwise it returns an error describing the discrepancy. 

### <a id="checkSerialize" href="#checkSerialize">func checkSerialize(t *testing.T, p *FileSet)</a>

```
searchKey: token.checkSerialize
```

```Go
func checkSerialize(t *testing.T, p *FileSet)
```

### <a id="TestSerialization" href="#TestSerialization">func TestSerialization(t *testing.T)</a>

```
searchKey: token.TestSerialization
```

```Go
func TestSerialization(t *testing.T)
```

### <a id="TestIsIdentifier" href="#TestIsIdentifier">func TestIsIdentifier(t *testing.T)</a>

```
searchKey: token.TestIsIdentifier
```

```Go
func TestIsIdentifier(t *testing.T)
```

