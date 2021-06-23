# Package parse

Package parse builds parse trees for templates as defined by text/template and html/template. Clients should use those packages to construct templates rather than this one, which provides shared internal data structures not intended for general use. 

## Index

* [Constants](#const)
    * [const itemError](#itemError)
    * [const itemBool](#itemBool)
    * [const itemChar](#itemChar)
    * [const itemCharConstant](#itemCharConstant)
    * [const itemComment](#itemComment)
    * [const itemComplex](#itemComplex)
    * [const itemAssign](#itemAssign)
    * [const itemDeclare](#itemDeclare)
    * [const itemEOF](#itemEOF)
    * [const itemField](#itemField)
    * [const itemIdentifier](#itemIdentifier)
    * [const itemLeftDelim](#itemLeftDelim)
    * [const itemLeftParen](#itemLeftParen)
    * [const itemNumber](#itemNumber)
    * [const itemPipe](#itemPipe)
    * [const itemRawString](#itemRawString)
    * [const itemRightDelim](#itemRightDelim)
    * [const itemRightParen](#itemRightParen)
    * [const itemSpace](#itemSpace)
    * [const itemString](#itemString)
    * [const itemText](#itemText)
    * [const itemVariable](#itemVariable)
    * [const itemKeyword](#itemKeyword)
    * [const itemBlock](#itemBlock)
    * [const itemDot](#itemDot)
    * [const itemDefine](#itemDefine)
    * [const itemElse](#itemElse)
    * [const itemEnd](#itemEnd)
    * [const itemIf](#itemIf)
    * [const itemNil](#itemNil)
    * [const itemRange](#itemRange)
    * [const itemTemplate](#itemTemplate)
    * [const itemWith](#itemWith)
    * [const eof](#eof)
    * [const spaceChars](#spaceChars)
    * [const trimMarker](#trimMarker)
    * [const trimMarkerLen](#trimMarkerLen)
    * [const leftDelim](#leftDelim)
    * [const rightDelim](#rightDelim)
    * [const leftComment](#leftComment)
    * [const rightComment](#rightComment)
    * [const NodeText](#NodeText)
    * [const NodeAction](#NodeAction)
    * [const NodeBool](#NodeBool)
    * [const NodeChain](#NodeChain)
    * [const NodeCommand](#NodeCommand)
    * [const NodeDot](#NodeDot)
    * [const nodeElse](#nodeElse)
    * [const nodeEnd](#nodeEnd)
    * [const NodeField](#NodeField)
    * [const NodeIdentifier](#NodeIdentifier)
    * [const NodeIf](#NodeIf)
    * [const NodeList](#NodeList)
    * [const NodeNil](#NodeNil)
    * [const NodeNumber](#NodeNumber)
    * [const NodePipe](#NodePipe)
    * [const NodeRange](#NodeRange)
    * [const NodeString](#NodeString)
    * [const NodeTemplate](#NodeTemplate)
    * [const NodeVariable](#NodeVariable)
    * [const NodeWith](#NodeWith)
    * [const NodeComment](#NodeComment)
    * [const ParseComments](#ParseComments)
    * [const SkipFuncCheck](#SkipFuncCheck)
    * [const noError](#noError)
    * [const hasError](#hasError)
* [Variables](#var)
    * [var key](#key)
    * [var textFormat](#textFormat)
    * [var itemName](#itemName)
    * [var tDot](#tDot)
    * [var tBlock](#tBlock)
    * [var tEOF](#tEOF)
    * [var tFor](#tFor)
    * [var tLeft](#tLeft)
    * [var tLpar](#tLpar)
    * [var tPipe](#tPipe)
    * [var tQuote](#tQuote)
    * [var tRange](#tRange)
    * [var tRight](#tRight)
    * [var tRpar](#tRpar)
    * [var tSpace](#tSpace)
    * [var raw](#raw)
    * [var rawNL](#rawNL)
    * [var tRawQuote](#tRawQuote)
    * [var tRawQuoteNL](#tRawQuoteNL)
    * [var lexTests](#lexTests)
    * [var lexDelimTests](#lexDelimTests)
    * [var tLeftDelim](#tLeftDelim)
    * [var tRightDelim](#tRightDelim)
    * [var lexPosTests](#lexPosTests)
    * [var debug](#debug)
    * [var numberTests](#numberTests)
    * [var parseTests](#parseTests)
    * [var builtins](#builtins)
    * [var isEmptyTests](#isEmptyTests)
    * [var errorTests](#errorTests)
    * [var sinkv](#sinkv)
    * [var sinkl](#sinkl)
* [Types](#type)
    * [type item struct](#item)
        * [func mkItem(typ itemType, text string) item](#mkItem)
        * [func (i item) String() string](#item.String)
    * [type itemType int](#itemType)
        * [func (i itemType) String() string](#itemType.String)
    * [type stateFn func(*std/text/template/parse.lexer) std/text/template/parse.stateFn](#stateFn)
        * [func lexText(l *lexer) stateFn](#lexText)
        * [func lexLeftDelim(l *lexer) stateFn](#lexLeftDelim)
        * [func lexComment(l *lexer) stateFn](#lexComment)
        * [func lexRightDelim(l *lexer) stateFn](#lexRightDelim)
        * [func lexInsideAction(l *lexer) stateFn](#lexInsideAction)
        * [func lexSpace(l *lexer) stateFn](#lexSpace)
        * [func lexIdentifier(l *lexer) stateFn](#lexIdentifier)
        * [func lexField(l *lexer) stateFn](#lexField)
        * [func lexVariable(l *lexer) stateFn](#lexVariable)
        * [func lexFieldOrVariable(l *lexer, typ itemType) stateFn](#lexFieldOrVariable)
        * [func lexChar(l *lexer) stateFn](#lexChar)
        * [func lexNumber(l *lexer) stateFn](#lexNumber)
        * [func lexQuote(l *lexer) stateFn](#lexQuote)
        * [func lexRawQuote(l *lexer) stateFn](#lexRawQuote)
    * [type lexer struct](#lexer)
        * [func lex(name, input, left, right string, emitComment bool) *lexer](#lex)
        * [func (l *lexer) next() rune](#lexer.next)
        * [func (l *lexer) peek() rune](#lexer.peek)
        * [func (l *lexer) backup()](#lexer.backup)
        * [func (l *lexer) emit(t itemType)](#lexer.emit)
        * [func (l *lexer) ignore()](#lexer.ignore)
        * [func (l *lexer) accept(valid string) bool](#lexer.accept)
        * [func (l *lexer) acceptRun(valid string)](#lexer.acceptRun)
        * [func (l *lexer) errorf(format string, args ...interface{}) stateFn](#lexer.errorf)
        * [func (l *lexer) nextItem() item](#lexer.nextItem)
        * [func (l *lexer) drain()](#lexer.drain)
        * [func (l *lexer) run()](#lexer.run)
        * [func (l *lexer) atRightDelim() (delim, trimSpaces bool)](#lexer.atRightDelim)
        * [func (l *lexer) atTerminator() bool](#lexer.atTerminator)
        * [func (l *lexer) scanNumber() bool](#lexer.scanNumber)
    * [type Node interface](#Node)
    * [type NodeType int](#NodeType)
        * [func (t NodeType) Type() NodeType](#NodeType.Type)
    * [type Pos int](#Pos)
        * [func rightTrimLength(s string) Pos](#rightTrimLength)
        * [func leftTrimLength(s string) Pos](#leftTrimLength)
        * [func (p Pos) Position() Pos](#Pos.Position)
    * [type ListNode struct](#ListNode)
        * [func (l *ListNode) append(n Node)](#ListNode.append)
        * [func (l *ListNode) tree() *Tree](#ListNode.tree)
        * [func (l *ListNode) String() string](#ListNode.String)
        * [func (l *ListNode) writeTo(sb *strings.Builder)](#ListNode.writeTo)
        * [func (l *ListNode) CopyList() *ListNode](#ListNode.CopyList)
        * [func (l *ListNode) Copy() Node](#ListNode.Copy)
    * [type TextNode struct](#TextNode)
        * [func (t *TextNode) String() string](#TextNode.String)
        * [func (t *TextNode) writeTo(sb *strings.Builder)](#TextNode.writeTo)
        * [func (t *TextNode) tree() *Tree](#TextNode.tree)
        * [func (t *TextNode) Copy() Node](#TextNode.Copy)
    * [type CommentNode struct](#CommentNode)
        * [func (c *CommentNode) String() string](#CommentNode.String)
        * [func (c *CommentNode) writeTo(sb *strings.Builder)](#CommentNode.writeTo)
        * [func (c *CommentNode) tree() *Tree](#CommentNode.tree)
        * [func (c *CommentNode) Copy() Node](#CommentNode.Copy)
    * [type PipeNode struct](#PipeNode)
        * [func (p *PipeNode) append(command *CommandNode)](#PipeNode.append)
        * [func (p *PipeNode) String() string](#PipeNode.String)
        * [func (p *PipeNode) writeTo(sb *strings.Builder)](#PipeNode.writeTo)
        * [func (p *PipeNode) tree() *Tree](#PipeNode.tree)
        * [func (p *PipeNode) CopyPipe() *PipeNode](#PipeNode.CopyPipe)
        * [func (p *PipeNode) Copy() Node](#PipeNode.Copy)
    * [type ActionNode struct](#ActionNode)
        * [func (a *ActionNode) String() string](#ActionNode.String)
        * [func (a *ActionNode) writeTo(sb *strings.Builder)](#ActionNode.writeTo)
        * [func (a *ActionNode) tree() *Tree](#ActionNode.tree)
        * [func (a *ActionNode) Copy() Node](#ActionNode.Copy)
    * [type CommandNode struct](#CommandNode)
        * [func (c *CommandNode) append(arg Node)](#CommandNode.append)
        * [func (c *CommandNode) String() string](#CommandNode.String)
        * [func (c *CommandNode) writeTo(sb *strings.Builder)](#CommandNode.writeTo)
        * [func (c *CommandNode) tree() *Tree](#CommandNode.tree)
        * [func (c *CommandNode) Copy() Node](#CommandNode.Copy)
    * [type IdentifierNode struct](#IdentifierNode)
        * [func NewIdentifier(ident string) *IdentifierNode](#NewIdentifier)
        * [func (i *IdentifierNode) SetPos(pos Pos) *IdentifierNode](#IdentifierNode.SetPos)
        * [func (i *IdentifierNode) SetTree(t *Tree) *IdentifierNode](#IdentifierNode.SetTree)
        * [func (i *IdentifierNode) String() string](#IdentifierNode.String)
        * [func (i *IdentifierNode) writeTo(sb *strings.Builder)](#IdentifierNode.writeTo)
        * [func (i *IdentifierNode) tree() *Tree](#IdentifierNode.tree)
        * [func (i *IdentifierNode) Copy() Node](#IdentifierNode.Copy)
    * [type VariableNode struct](#VariableNode)
        * [func (v *VariableNode) String() string](#VariableNode.String)
        * [func (v *VariableNode) writeTo(sb *strings.Builder)](#VariableNode.writeTo)
        * [func (v *VariableNode) tree() *Tree](#VariableNode.tree)
        * [func (v *VariableNode) Copy() Node](#VariableNode.Copy)
    * [type DotNode struct](#DotNode)
        * [func (d *DotNode) Type() NodeType](#DotNode.Type)
        * [func (d *DotNode) String() string](#DotNode.String)
        * [func (d *DotNode) writeTo(sb *strings.Builder)](#DotNode.writeTo)
        * [func (d *DotNode) tree() *Tree](#DotNode.tree)
        * [func (d *DotNode) Copy() Node](#DotNode.Copy)
    * [type NilNode struct](#NilNode)
        * [func (n *NilNode) Type() NodeType](#NilNode.Type)
        * [func (n *NilNode) String() string](#NilNode.String)
        * [func (n *NilNode) writeTo(sb *strings.Builder)](#NilNode.writeTo)
        * [func (n *NilNode) tree() *Tree](#NilNode.tree)
        * [func (n *NilNode) Copy() Node](#NilNode.Copy)
    * [type FieldNode struct](#FieldNode)
        * [func (f *FieldNode) String() string](#FieldNode.String)
        * [func (f *FieldNode) writeTo(sb *strings.Builder)](#FieldNode.writeTo)
        * [func (f *FieldNode) tree() *Tree](#FieldNode.tree)
        * [func (f *FieldNode) Copy() Node](#FieldNode.Copy)
    * [type ChainNode struct](#ChainNode)
        * [func (c *ChainNode) Add(field string)](#ChainNode.Add)
        * [func (c *ChainNode) String() string](#ChainNode.String)
        * [func (c *ChainNode) writeTo(sb *strings.Builder)](#ChainNode.writeTo)
        * [func (c *ChainNode) tree() *Tree](#ChainNode.tree)
        * [func (c *ChainNode) Copy() Node](#ChainNode.Copy)
    * [type BoolNode struct](#BoolNode)
        * [func (b *BoolNode) String() string](#BoolNode.String)
        * [func (b *BoolNode) writeTo(sb *strings.Builder)](#BoolNode.writeTo)
        * [func (b *BoolNode) tree() *Tree](#BoolNode.tree)
        * [func (b *BoolNode) Copy() Node](#BoolNode.Copy)
    * [type NumberNode struct](#NumberNode)
        * [func (n *NumberNode) simplifyComplex()](#NumberNode.simplifyComplex)
        * [func (n *NumberNode) String() string](#NumberNode.String)
        * [func (n *NumberNode) writeTo(sb *strings.Builder)](#NumberNode.writeTo)
        * [func (n *NumberNode) tree() *Tree](#NumberNode.tree)
        * [func (n *NumberNode) Copy() Node](#NumberNode.Copy)
    * [type StringNode struct](#StringNode)
        * [func (s *StringNode) String() string](#StringNode.String)
        * [func (s *StringNode) writeTo(sb *strings.Builder)](#StringNode.writeTo)
        * [func (s *StringNode) tree() *Tree](#StringNode.tree)
        * [func (s *StringNode) Copy() Node](#StringNode.Copy)
    * [type endNode struct](#endNode)
        * [func (e *endNode) String() string](#endNode.String)
        * [func (e *endNode) writeTo(sb *strings.Builder)](#endNode.writeTo)
        * [func (e *endNode) tree() *Tree](#endNode.tree)
        * [func (e *endNode) Copy() Node](#endNode.Copy)
    * [type elseNode struct](#elseNode)
        * [func (e *elseNode) Type() NodeType](#elseNode.Type)
        * [func (e *elseNode) String() string](#elseNode.String)
        * [func (e *elseNode) writeTo(sb *strings.Builder)](#elseNode.writeTo)
        * [func (e *elseNode) tree() *Tree](#elseNode.tree)
        * [func (e *elseNode) Copy() Node](#elseNode.Copy)
    * [type BranchNode struct](#BranchNode)
        * [func (b *BranchNode) String() string](#BranchNode.String)
        * [func (b *BranchNode) writeTo(sb *strings.Builder)](#BranchNode.writeTo)
        * [func (b *BranchNode) tree() *Tree](#BranchNode.tree)
        * [func (b *BranchNode) Copy() Node](#BranchNode.Copy)
    * [type IfNode struct](#IfNode)
        * [func (i *IfNode) Copy() Node](#IfNode.Copy)
    * [type RangeNode struct](#RangeNode)
        * [func (r *RangeNode) Copy() Node](#RangeNode.Copy)
    * [type WithNode struct](#WithNode)
        * [func (w *WithNode) Copy() Node](#WithNode.Copy)
    * [type TemplateNode struct](#TemplateNode)
        * [func (t *TemplateNode) String() string](#TemplateNode.String)
        * [func (t *TemplateNode) writeTo(sb *strings.Builder)](#TemplateNode.writeTo)
        * [func (t *TemplateNode) tree() *Tree](#TemplateNode.tree)
        * [func (t *TemplateNode) Copy() Node](#TemplateNode.Copy)
    * [type Tree struct](#Tree)
        * [func New(name string, funcs ...map[string]interface{}) *Tree](#New)
        * [func (t *Tree) newList(pos Pos) *ListNode](#Tree.newList)
        * [func (t *Tree) newText(pos Pos, text string) *TextNode](#Tree.newText)
        * [func (t *Tree) newComment(pos Pos, text string) *CommentNode](#Tree.newComment)
        * [func (t *Tree) newPipeline(pos Pos, line int, vars []*VariableNode) *PipeNode](#Tree.newPipeline)
        * [func (t *Tree) newAction(pos Pos, line int, pipe *PipeNode) *ActionNode](#Tree.newAction)
        * [func (t *Tree) newCommand(pos Pos) *CommandNode](#Tree.newCommand)
        * [func (t *Tree) newVariable(pos Pos, ident string) *VariableNode](#Tree.newVariable)
        * [func (t *Tree) newDot(pos Pos) *DotNode](#Tree.newDot)
        * [func (t *Tree) newNil(pos Pos) *NilNode](#Tree.newNil)
        * [func (t *Tree) newField(pos Pos, ident string) *FieldNode](#Tree.newField)
        * [func (t *Tree) newChain(pos Pos, node Node) *ChainNode](#Tree.newChain)
        * [func (t *Tree) newBool(pos Pos, true bool) *BoolNode](#Tree.newBool)
        * [func (t *Tree) newNumber(pos Pos, text string, typ itemType) (*NumberNode, error)](#Tree.newNumber)
        * [func (t *Tree) newString(pos Pos, orig, text string) *StringNode](#Tree.newString)
        * [func (t *Tree) newEnd(pos Pos) *endNode](#Tree.newEnd)
        * [func (t *Tree) newElse(pos Pos, line int) *elseNode](#Tree.newElse)
        * [func (t *Tree) newIf(pos Pos, line int, pipe *PipeNode, list, elseList *ListNode) *IfNode](#Tree.newIf)
        * [func (t *Tree) newRange(pos Pos, line int, pipe *PipeNode, list, elseList *ListNode) *RangeNode](#Tree.newRange)
        * [func (t *Tree) newWith(pos Pos, line int, pipe *PipeNode, list, elseList *ListNode) *WithNode](#Tree.newWith)
        * [func (t *Tree) newTemplate(pos Pos, line int, name string, pipe *PipeNode) *TemplateNode](#Tree.newTemplate)
        * [func (t *Tree) Copy() *Tree](#Tree.Copy)
        * [func (t *Tree) next() item](#Tree.next)
        * [func (t *Tree) backup()](#Tree.backup)
        * [func (t *Tree) backup2(t1 item)](#Tree.backup2)
        * [func (t *Tree) backup3(t2, t1 item)](#Tree.backup3)
        * [func (t *Tree) peek() item](#Tree.peek)
        * [func (t *Tree) nextNonSpace() (token item)](#Tree.nextNonSpace)
        * [func (t *Tree) peekNonSpace() item](#Tree.peekNonSpace)
        * [func (t *Tree) ErrorContext(n Node) (location, context string)](#Tree.ErrorContext)
        * [func (t *Tree) errorf(format string, args ...interface{})](#Tree.errorf)
        * [func (t *Tree) error(err error)](#Tree.error)
        * [func (t *Tree) expect(expected itemType, context string) item](#Tree.expect)
        * [func (t *Tree) expectOneOf(expected1, expected2 itemType, context string) item](#Tree.expectOneOf)
        * [func (t *Tree) unexpected(token item, context string)](#Tree.unexpected)
        * [func (t *Tree) recover(errp *error)](#Tree.recover)
        * [func (t *Tree) startParse(funcs []map[string]interface{}, lex *lexer, treeSet map[string]*Tree)](#Tree.startParse)
        * [func (t *Tree) stopParse()](#Tree.stopParse)
        * [func (t *Tree) Parse(text, leftDelim, rightDelim string, treeSet map[string]*Tree, funcs ...map[string]interface{}) (tree *Tree, err error)](#Tree.Parse)
        * [func (t *Tree) add()](#Tree.add)
        * [func (t *Tree) parse()](#Tree.parse)
        * [func (t *Tree) parseDefinition()](#Tree.parseDefinition)
        * [func (t *Tree) itemList() (list *ListNode, next Node)](#Tree.itemList)
        * [func (t *Tree) textOrAction() Node](#Tree.textOrAction)
        * [func (t *Tree) clearActionLine()](#Tree.clearActionLine)
        * [func (t *Tree) action() (n Node)](#Tree.action)
        * [func (t *Tree) pipeline(context string, end itemType) (pipe *PipeNode)](#Tree.pipeline)
        * [func (t *Tree) checkPipeline(pipe *PipeNode, context string)](#Tree.checkPipeline)
        * [func (t *Tree) parseControl(allowElseIf bool, context string) (pos Pos, line int, pipe *PipeNode, list, elseList *ListNode)](#Tree.parseControl)
        * [func (t *Tree) ifControl() Node](#Tree.ifControl)
        * [func (t *Tree) rangeControl() Node](#Tree.rangeControl)
        * [func (t *Tree) withControl() Node](#Tree.withControl)
        * [func (t *Tree) endControl() Node](#Tree.endControl)
        * [func (t *Tree) elseControl() Node](#Tree.elseControl)
        * [func (t *Tree) blockControl() Node](#Tree.blockControl)
        * [func (t *Tree) templateControl() Node](#Tree.templateControl)
        * [func (t *Tree) parseTemplateName(token item, context string) (name string)](#Tree.parseTemplateName)
        * [func (t *Tree) command() *CommandNode](#Tree.command)
        * [func (t *Tree) operand() Node](#Tree.operand)
        * [func (t *Tree) term() Node](#Tree.term)
        * [func (t *Tree) hasFunction(name string) bool](#Tree.hasFunction)
        * [func (t *Tree) popVars(n int)](#Tree.popVars)
        * [func (t *Tree) useVar(pos Pos, name string) Node](#Tree.useVar)
        * [func (t *Tree) parseLexer(lex *lexer) (tree *Tree, err error)](#Tree.parseLexer)
    * [type Mode uint](#Mode)
    * [type lexTest struct](#lexTest)
    * [type numberTest struct](#numberTest)
    * [type parseTest struct](#parseTest)
    * [type isEmptyTest struct](#isEmptyTest)
* [Functions](#func)
    * [func isSpace(r rune) bool](#isSpace)
    * [func isAlphaNumeric(r rune) bool](#isAlphaNumeric)
    * [func hasLeftTrimMarker(s string) bool](#hasLeftTrimMarker)
    * [func hasRightTrimMarker(s string) bool](#hasRightTrimMarker)
    * [func Parse(name, text, leftDelim, rightDelim string, funcs ...map[string]interface{}) (map[string]*Tree, error)](#Parse)
    * [func IsEmptyTree(n Node) bool](#IsEmptyTree)
    * [func collect(t *lexTest, left, right string) (items []item)](#collect)
    * [func equal(i1, i2 []item, checkPos bool) bool](#equal)
    * [func TestLex(t *testing.T)](#TestLex)
    * [func TestDelims(t *testing.T)](#TestDelims)
    * [func TestPos(t *testing.T)](#TestPos)
    * [func TestShutdown(t *testing.T)](#TestShutdown)
    * [func TestNumberParse(t *testing.T)](#TestNumberParse)
    * [func testParse(doCopy bool, t *testing.T)](#testParse)
    * [func TestParse(t *testing.T)](#TestParse)
    * [func TestParseCopy(t *testing.T)](#TestParseCopy)
    * [func TestParseWithComments(t *testing.T)](#TestParseWithComments)
    * [func TestSkipFuncCheck(t *testing.T)](#TestSkipFuncCheck)
    * [func TestIsEmpty(t *testing.T)](#TestIsEmpty)
    * [func TestErrorContextWithTreeCopy(t *testing.T)](#TestErrorContextWithTreeCopy)
    * [func TestErrors(t *testing.T)](#TestErrors)
    * [func TestBlock(t *testing.T)](#TestBlock)
    * [func TestLineNum(t *testing.T)](#TestLineNum)
    * [func BenchmarkParseLarge(b *testing.B)](#BenchmarkParseLarge)
    * [func BenchmarkVariableString(b *testing.B)](#BenchmarkVariableString)
    * [func BenchmarkListString(b *testing.B)](#BenchmarkListString)


## <a id="const" href="#const">Constants</a>

### <a id="itemError" href="#itemError">const itemError</a>

```
searchKey: parse.itemError
tags: [private]
```

```Go
const itemError itemType = iota // error occurred; value is text of error

```

### <a id="itemBool" href="#itemBool">const itemBool</a>

```
searchKey: parse.itemBool
tags: [private]
```

```Go
const itemBool // boolean constant

```

### <a id="itemChar" href="#itemChar">const itemChar</a>

```
searchKey: parse.itemChar
tags: [private]
```

```Go
const itemChar // printable ASCII character; grab bag for comma etc.

```

### <a id="itemCharConstant" href="#itemCharConstant">const itemCharConstant</a>

```
searchKey: parse.itemCharConstant
tags: [private]
```

```Go
const itemCharConstant // character constant

```

### <a id="itemComment" href="#itemComment">const itemComment</a>

```
searchKey: parse.itemComment
tags: [private]
```

```Go
const itemComment // comment text

```

### <a id="itemComplex" href="#itemComplex">const itemComplex</a>

```
searchKey: parse.itemComplex
tags: [private]
```

```Go
const itemComplex // complex constant (1+2i); imaginary is just a number

```

### <a id="itemAssign" href="#itemAssign">const itemAssign</a>

```
searchKey: parse.itemAssign
tags: [private]
```

```Go
const itemAssign // equals ('=') introducing an assignment

```

### <a id="itemDeclare" href="#itemDeclare">const itemDeclare</a>

```
searchKey: parse.itemDeclare
tags: [private]
```

```Go
const itemDeclare // colon-equals (':=') introducing a declaration

```

### <a id="itemEOF" href="#itemEOF">const itemEOF</a>

```
searchKey: parse.itemEOF
tags: [private]
```

```Go
const itemEOF
```

### <a id="itemField" href="#itemField">const itemField</a>

```
searchKey: parse.itemField
tags: [private]
```

```Go
const itemField // alphanumeric identifier starting with '.'

```

### <a id="itemIdentifier" href="#itemIdentifier">const itemIdentifier</a>

```
searchKey: parse.itemIdentifier
tags: [private]
```

```Go
const itemIdentifier // alphanumeric identifier not starting with '.'

```

### <a id="itemLeftDelim" href="#itemLeftDelim">const itemLeftDelim</a>

```
searchKey: parse.itemLeftDelim
tags: [private]
```

```Go
const itemLeftDelim // left action delimiter

```

### <a id="itemLeftParen" href="#itemLeftParen">const itemLeftParen</a>

```
searchKey: parse.itemLeftParen
tags: [private]
```

```Go
const itemLeftParen // '(' inside action

```

### <a id="itemNumber" href="#itemNumber">const itemNumber</a>

```
searchKey: parse.itemNumber
tags: [private]
```

```Go
const itemNumber // simple number, including imaginary

```

### <a id="itemPipe" href="#itemPipe">const itemPipe</a>

```
searchKey: parse.itemPipe
tags: [private]
```

```Go
const itemPipe // pipe symbol

```

### <a id="itemRawString" href="#itemRawString">const itemRawString</a>

```
searchKey: parse.itemRawString
tags: [private]
```

```Go
const itemRawString // raw quoted string (includes quotes)

```

### <a id="itemRightDelim" href="#itemRightDelim">const itemRightDelim</a>

```
searchKey: parse.itemRightDelim
tags: [private]
```

```Go
const itemRightDelim // right action delimiter

```

### <a id="itemRightParen" href="#itemRightParen">const itemRightParen</a>

```
searchKey: parse.itemRightParen
tags: [private]
```

```Go
const itemRightParen // ')' inside action

```

### <a id="itemSpace" href="#itemSpace">const itemSpace</a>

```
searchKey: parse.itemSpace
tags: [private]
```

```Go
const itemSpace // run of spaces separating arguments

```

### <a id="itemString" href="#itemString">const itemString</a>

```
searchKey: parse.itemString
tags: [private]
```

```Go
const itemString // quoted string (includes quotes)

```

### <a id="itemText" href="#itemText">const itemText</a>

```
searchKey: parse.itemText
tags: [private]
```

```Go
const itemText // plain text

```

### <a id="itemVariable" href="#itemVariable">const itemVariable</a>

```
searchKey: parse.itemVariable
tags: [private]
```

```Go
const itemVariable // variable starting with '$', such as '$' or  '$1' or '$hello'

```

### <a id="itemKeyword" href="#itemKeyword">const itemKeyword</a>

```
searchKey: parse.itemKeyword
tags: [private]
```

```Go
const itemKeyword // used only to delimit the keywords

```

Keywords appear after all the rest. 

### <a id="itemBlock" href="#itemBlock">const itemBlock</a>

```
searchKey: parse.itemBlock
tags: [private]
```

```Go
const itemBlock // block keyword

```

### <a id="itemDot" href="#itemDot">const itemDot</a>

```
searchKey: parse.itemDot
tags: [private]
```

```Go
const itemDot // the cursor, spelled '.'

```

### <a id="itemDefine" href="#itemDefine">const itemDefine</a>

```
searchKey: parse.itemDefine
tags: [private]
```

```Go
const itemDefine // define keyword

```

### <a id="itemElse" href="#itemElse">const itemElse</a>

```
searchKey: parse.itemElse
tags: [private]
```

```Go
const itemElse // else keyword

```

### <a id="itemEnd" href="#itemEnd">const itemEnd</a>

```
searchKey: parse.itemEnd
tags: [private]
```

```Go
const itemEnd // end keyword

```

### <a id="itemIf" href="#itemIf">const itemIf</a>

```
searchKey: parse.itemIf
tags: [private]
```

```Go
const itemIf // if keyword

```

### <a id="itemNil" href="#itemNil">const itemNil</a>

```
searchKey: parse.itemNil
tags: [private]
```

```Go
const itemNil // the untyped nil constant, easiest to treat as a keyword

```

### <a id="itemRange" href="#itemRange">const itemRange</a>

```
searchKey: parse.itemRange
tags: [private]
```

```Go
const itemRange // range keyword

```

### <a id="itemTemplate" href="#itemTemplate">const itemTemplate</a>

```
searchKey: parse.itemTemplate
tags: [private]
```

```Go
const itemTemplate // template keyword

```

### <a id="itemWith" href="#itemWith">const itemWith</a>

```
searchKey: parse.itemWith
tags: [private]
```

```Go
const itemWith // with keyword

```

### <a id="eof" href="#eof">const eof</a>

```
searchKey: parse.eof
tags: [private]
```

```Go
const eof = -1
```

### <a id="spaceChars" href="#spaceChars">const spaceChars</a>

```
searchKey: parse.spaceChars
tags: [private]
```

```Go
const spaceChars = " \t\r\n" // These are the space characters defined by Go itself.

```

Trimming spaces. If the action begins "{{- " rather than "{{", then all space/tab/newlines preceding the action are trimmed; conversely if it ends " -}}" the leading spaces are trimmed. This is done entirely in the lexer; the parser never sees it happen. We require an ASCII space (' ', \t, \r, \n) to be present to avoid ambiguity with things like "{{-3}}". It reads better with the space present anyway. For simplicity, only ASCII does the job. 

### <a id="trimMarker" href="#trimMarker">const trimMarker</a>

```
searchKey: parse.trimMarker
tags: [private]
```

```Go
const trimMarker // Attached to left/right delimiter, trims trailing spaces from preceding/following text.
 = ...
```

Trimming spaces. If the action begins "{{- " rather than "{{", then all space/tab/newlines preceding the action are trimmed; conversely if it ends " -}}" the leading spaces are trimmed. This is done entirely in the lexer; the parser never sees it happen. We require an ASCII space (' ', \t, \r, \n) to be present to avoid ambiguity with things like "{{-3}}". It reads better with the space present anyway. For simplicity, only ASCII does the job. 

### <a id="trimMarkerLen" href="#trimMarkerLen">const trimMarkerLen</a>

```
searchKey: parse.trimMarkerLen
tags: [private]
```

```Go
const trimMarkerLen = Pos(1 + 1) // marker plus space before or after

```

Trimming spaces. If the action begins "{{- " rather than "{{", then all space/tab/newlines preceding the action are trimmed; conversely if it ends " -}}" the leading spaces are trimmed. This is done entirely in the lexer; the parser never sees it happen. We require an ASCII space (' ', \t, \r, \n) to be present to avoid ambiguity with things like "{{-3}}". It reads better with the space present anyway. For simplicity, only ASCII does the job. 

### <a id="leftDelim" href="#leftDelim">const leftDelim</a>

```
searchKey: parse.leftDelim
tags: [private]
```

```Go
const leftDelim = "{{"
```

### <a id="rightDelim" href="#rightDelim">const rightDelim</a>

```
searchKey: parse.rightDelim
tags: [private]
```

```Go
const rightDelim = "}}"
```

### <a id="leftComment" href="#leftComment">const leftComment</a>

```
searchKey: parse.leftComment
tags: [private]
```

```Go
const leftComment = "/*"
```

### <a id="rightComment" href="#rightComment">const rightComment</a>

```
searchKey: parse.rightComment
tags: [private]
```

```Go
const rightComment = "*/"
```

### <a id="NodeText" href="#NodeText">const NodeText</a>

```
searchKey: parse.NodeText
```

```Go
const NodeText NodeType = iota // Plain text.

```

### <a id="NodeAction" href="#NodeAction">const NodeAction</a>

```
searchKey: parse.NodeAction
```

```Go
const NodeAction // A non-control action such as a field evaluation.

```

### <a id="NodeBool" href="#NodeBool">const NodeBool</a>

```
searchKey: parse.NodeBool
```

```Go
const NodeBool // A boolean constant.

```

### <a id="NodeChain" href="#NodeChain">const NodeChain</a>

```
searchKey: parse.NodeChain
```

```Go
const NodeChain // A sequence of field accesses.

```

### <a id="NodeCommand" href="#NodeCommand">const NodeCommand</a>

```
searchKey: parse.NodeCommand
```

```Go
const NodeCommand // An element of a pipeline.

```

### <a id="NodeDot" href="#NodeDot">const NodeDot</a>

```
searchKey: parse.NodeDot
```

```Go
const NodeDot // The cursor, dot.

```

### <a id="nodeElse" href="#nodeElse">const nodeElse</a>

```
searchKey: parse.nodeElse
tags: [private]
```

```Go
const nodeElse // An else action. Not added to tree.

```

### <a id="nodeEnd" href="#nodeEnd">const nodeEnd</a>

```
searchKey: parse.nodeEnd
tags: [private]
```

```Go
const nodeEnd // An end action. Not added to tree.

```

### <a id="NodeField" href="#NodeField">const NodeField</a>

```
searchKey: parse.NodeField
```

```Go
const NodeField // A field or method name.

```

### <a id="NodeIdentifier" href="#NodeIdentifier">const NodeIdentifier</a>

```
searchKey: parse.NodeIdentifier
```

```Go
const NodeIdentifier // An identifier; always a function name.

```

### <a id="NodeIf" href="#NodeIf">const NodeIf</a>

```
searchKey: parse.NodeIf
```

```Go
const NodeIf // An if action.

```

### <a id="NodeList" href="#NodeList">const NodeList</a>

```
searchKey: parse.NodeList
```

```Go
const NodeList // A list of Nodes.

```

### <a id="NodeNil" href="#NodeNil">const NodeNil</a>

```
searchKey: parse.NodeNil
```

```Go
const NodeNil // An untyped nil constant.

```

### <a id="NodeNumber" href="#NodeNumber">const NodeNumber</a>

```
searchKey: parse.NodeNumber
```

```Go
const NodeNumber // A numerical constant.

```

### <a id="NodePipe" href="#NodePipe">const NodePipe</a>

```
searchKey: parse.NodePipe
```

```Go
const NodePipe // A pipeline of commands.

```

### <a id="NodeRange" href="#NodeRange">const NodeRange</a>

```
searchKey: parse.NodeRange
```

```Go
const NodeRange // A range action.

```

### <a id="NodeString" href="#NodeString">const NodeString</a>

```
searchKey: parse.NodeString
```

```Go
const NodeString // A string constant.

```

### <a id="NodeTemplate" href="#NodeTemplate">const NodeTemplate</a>

```
searchKey: parse.NodeTemplate
```

```Go
const NodeTemplate // A template invocation action.

```

### <a id="NodeVariable" href="#NodeVariable">const NodeVariable</a>

```
searchKey: parse.NodeVariable
```

```Go
const NodeVariable // A $ variable.

```

### <a id="NodeWith" href="#NodeWith">const NodeWith</a>

```
searchKey: parse.NodeWith
```

```Go
const NodeWith // A with action.

```

### <a id="NodeComment" href="#NodeComment">const NodeComment</a>

```
searchKey: parse.NodeComment
```

```Go
const NodeComment // A comment.

```

### <a id="ParseComments" href="#ParseComments">const ParseComments</a>

```
searchKey: parse.ParseComments
```

```Go
const ParseComments Mode = 1 << iota // parse comments and add them to AST

```

### <a id="SkipFuncCheck" href="#SkipFuncCheck">const SkipFuncCheck</a>

```
searchKey: parse.SkipFuncCheck
```

```Go
const SkipFuncCheck // do not check that functions are defined

```

### <a id="noError" href="#noError">const noError</a>

```
searchKey: parse.noError
tags: [private]
```

```Go
const noError = true
```

### <a id="hasError" href="#hasError">const hasError</a>

```
searchKey: parse.hasError
tags: [private]
```

```Go
const hasError = false
```

## <a id="var" href="#var">Variables</a>

### <a id="key" href="#key">var key</a>

```
searchKey: parse.key
tags: [private]
```

```Go
var key = ...
```

### <a id="textFormat" href="#textFormat">var textFormat</a>

```
searchKey: parse.textFormat
tags: [private]
```

```Go
var textFormat = "%s" // Changed to "%q" in tests for better error messages.

```

### <a id="itemName" href="#itemName">var itemName</a>

```
searchKey: parse.itemName
tags: [private]
```

```Go
var itemName = ...
```

Make the types prettyprint. 

### <a id="tDot" href="#tDot">var tDot</a>

```
searchKey: parse.tDot
tags: [private]
```

```Go
var tDot = mkItem(itemDot, ".")
```

### <a id="tBlock" href="#tBlock">var tBlock</a>

```
searchKey: parse.tBlock
tags: [private]
```

```Go
var tBlock = mkItem(itemBlock, "block")
```

### <a id="tEOF" href="#tEOF">var tEOF</a>

```
searchKey: parse.tEOF
tags: [private]
```

```Go
var tEOF = mkItem(itemEOF, "")
```

### <a id="tFor" href="#tFor">var tFor</a>

```
searchKey: parse.tFor
tags: [private]
```

```Go
var tFor = mkItem(itemIdentifier, "for")
```

### <a id="tLeft" href="#tLeft">var tLeft</a>

```
searchKey: parse.tLeft
tags: [private]
```

```Go
var tLeft = mkItem(itemLeftDelim, "{{")
```

### <a id="tLpar" href="#tLpar">var tLpar</a>

```
searchKey: parse.tLpar
tags: [private]
```

```Go
var tLpar = mkItem(itemLeftParen, "(")
```

### <a id="tPipe" href="#tPipe">var tPipe</a>

```
searchKey: parse.tPipe
tags: [private]
```

```Go
var tPipe = mkItem(itemPipe, "|")
```

### <a id="tQuote" href="#tQuote">var tQuote</a>

```
searchKey: parse.tQuote
tags: [private]
```

```Go
var tQuote = mkItem(itemString, `"abc \n\t\" "`)
```

### <a id="tRange" href="#tRange">var tRange</a>

```
searchKey: parse.tRange
tags: [private]
```

```Go
var tRange = mkItem(itemRange, "range")
```

### <a id="tRight" href="#tRight">var tRight</a>

```
searchKey: parse.tRight
tags: [private]
```

```Go
var tRight = mkItem(itemRightDelim, "}}")
```

### <a id="tRpar" href="#tRpar">var tRpar</a>

```
searchKey: parse.tRpar
tags: [private]
```

```Go
var tRpar = mkItem(itemRightParen, ")")
```

### <a id="tSpace" href="#tSpace">var tSpace</a>

```
searchKey: parse.tSpace
tags: [private]
```

```Go
var tSpace = mkItem(itemSpace, " ")
```

### <a id="raw" href="#raw">var raw</a>

```
searchKey: parse.raw
tags: [private]
```

```Go
var raw = "`" + `abc\n\t\" ` + "`"
```

### <a id="rawNL" href="#rawNL">var rawNL</a>

```
searchKey: parse.rawNL
tags: [private]
```

```Go
var rawNL = "`now is{{\n}}the time`" // Contains newline inside raw quote.

```

### <a id="tRawQuote" href="#tRawQuote">var tRawQuote</a>

```
searchKey: parse.tRawQuote
tags: [private]
```

```Go
var tRawQuote = mkItem(itemRawString, raw)
```

### <a id="tRawQuoteNL" href="#tRawQuoteNL">var tRawQuoteNL</a>

```
searchKey: parse.tRawQuoteNL
tags: [private]
```

```Go
var tRawQuoteNL = mkItem(itemRawString, rawNL)
```

### <a id="lexTests" href="#lexTests">var lexTests</a>

```
searchKey: parse.lexTests
tags: [private]
```

```Go
var lexTests = ...
```

### <a id="lexDelimTests" href="#lexDelimTests">var lexDelimTests</a>

```
searchKey: parse.lexDelimTests
tags: [private]
```

```Go
var lexDelimTests = ...
```

Some easy cases from above, but with delimiters $$ and @@ 

### <a id="tLeftDelim" href="#tLeftDelim">var tLeftDelim</a>

```
searchKey: parse.tLeftDelim
tags: [private]
```

```Go
var tLeftDelim = mkItem(itemLeftDelim, "$$")
```

### <a id="tRightDelim" href="#tRightDelim">var tRightDelim</a>

```
searchKey: parse.tRightDelim
tags: [private]
```

```Go
var tRightDelim = mkItem(itemRightDelim, "@@")
```

### <a id="lexPosTests" href="#lexPosTests">var lexPosTests</a>

```
searchKey: parse.lexPosTests
tags: [private]
```

```Go
var lexPosTests = ...
```

### <a id="debug" href="#debug">var debug</a>

```
searchKey: parse.debug
tags: [private]
```

```Go
var debug = flag.Bool("debug", false, "show the errors produced by the main tests")
```

### <a id="numberTests" href="#numberTests">var numberTests</a>

```
searchKey: parse.numberTests
tags: [private]
```

```Go
var numberTests = ...
```

### <a id="parseTests" href="#parseTests">var parseTests</a>

```
searchKey: parse.parseTests
tags: [private]
```

```Go
var parseTests = ...
```

### <a id="builtins" href="#builtins">var builtins</a>

```
searchKey: parse.builtins
tags: [private]
```

```Go
var builtins = map[string]interface{}{
	"printf":   fmt.Sprintf,
	"contains": strings.Contains,
}
```

### <a id="isEmptyTests" href="#isEmptyTests">var isEmptyTests</a>

```
searchKey: parse.isEmptyTests
tags: [private]
```

```Go
var isEmptyTests = ...
```

### <a id="errorTests" href="#errorTests">var errorTests</a>

```
searchKey: parse.errorTests
tags: [private]
```

```Go
var errorTests = ...
```

All failures, and the result is a string that must appear in the error message. 

### <a id="sinkv" href="#sinkv">var sinkv</a>

```
searchKey: parse.sinkv
tags: [private]
```

```Go
var sinkv, sinkl string
```

### <a id="sinkl" href="#sinkl">var sinkl</a>

```
searchKey: parse.sinkl
tags: [private]
```

```Go
var sinkv, sinkl string
```

## <a id="type" href="#type">Types</a>

### <a id="item" href="#item">type item struct</a>

```
searchKey: parse.item
tags: [private]
```

```Go
type item struct {
	typ  itemType // The type of this item.
	pos  Pos      // The starting position, in bytes, of this item in the input string.
	val  string   // The value of this item.
	line int      // The line number at the start of this item.
}
```

item represents a token or text string returned from the scanner. 

#### <a id="mkItem" href="#mkItem">func mkItem(typ itemType, text string) item</a>

```
searchKey: parse.mkItem
tags: [private]
```

```Go
func mkItem(typ itemType, text string) item
```

#### <a id="item.String" href="#item.String">func (i item) String() string</a>

```
searchKey: parse.item.String
tags: [private]
```

```Go
func (i item) String() string
```

### <a id="itemType" href="#itemType">type itemType int</a>

```
searchKey: parse.itemType
tags: [private]
```

```Go
type itemType int
```

itemType identifies the type of lex items. 

#### <a id="itemType.String" href="#itemType.String">func (i itemType) String() string</a>

```
searchKey: parse.itemType.String
tags: [private]
```

```Go
func (i itemType) String() string
```

### <a id="stateFn" href="#stateFn">type stateFn func(*std/text/template/parse.lexer) std/text/template/parse.stateFn</a>

```
searchKey: parse.stateFn
tags: [private]
```

```Go
type stateFn func(*lexer) stateFn
```

stateFn represents the state of the scanner as a function that returns the next state. 

#### <a id="lexText" href="#lexText">func lexText(l *lexer) stateFn</a>

```
searchKey: parse.lexText
tags: [private]
```

```Go
func lexText(l *lexer) stateFn
```

lexText scans until an opening action delimiter, "{{". 

#### <a id="lexLeftDelim" href="#lexLeftDelim">func lexLeftDelim(l *lexer) stateFn</a>

```
searchKey: parse.lexLeftDelim
tags: [private]
```

```Go
func lexLeftDelim(l *lexer) stateFn
```

lexLeftDelim scans the left delimiter, which is known to be present, possibly with a trim marker. 

#### <a id="lexComment" href="#lexComment">func lexComment(l *lexer) stateFn</a>

```
searchKey: parse.lexComment
tags: [private]
```

```Go
func lexComment(l *lexer) stateFn
```

lexComment scans a comment. The left comment marker is known to be present. 

#### <a id="lexRightDelim" href="#lexRightDelim">func lexRightDelim(l *lexer) stateFn</a>

```
searchKey: parse.lexRightDelim
tags: [private]
```

```Go
func lexRightDelim(l *lexer) stateFn
```

lexRightDelim scans the right delimiter, which is known to be present, possibly with a trim marker. 

#### <a id="lexInsideAction" href="#lexInsideAction">func lexInsideAction(l *lexer) stateFn</a>

```
searchKey: parse.lexInsideAction
tags: [private]
```

```Go
func lexInsideAction(l *lexer) stateFn
```

lexInsideAction scans the elements inside action delimiters. 

#### <a id="lexSpace" href="#lexSpace">func lexSpace(l *lexer) stateFn</a>

```
searchKey: parse.lexSpace
tags: [private]
```

```Go
func lexSpace(l *lexer) stateFn
```

lexSpace scans a run of space characters. We have not consumed the first space, which is known to be present. Take care if there is a trim-marked right delimiter, which starts with a space. 

#### <a id="lexIdentifier" href="#lexIdentifier">func lexIdentifier(l *lexer) stateFn</a>

```
searchKey: parse.lexIdentifier
tags: [private]
```

```Go
func lexIdentifier(l *lexer) stateFn
```

lexIdentifier scans an alphanumeric. 

#### <a id="lexField" href="#lexField">func lexField(l *lexer) stateFn</a>

```
searchKey: parse.lexField
tags: [private]
```

```Go
func lexField(l *lexer) stateFn
```

lexField scans a field: .Alphanumeric. The . has been scanned. 

#### <a id="lexVariable" href="#lexVariable">func lexVariable(l *lexer) stateFn</a>

```
searchKey: parse.lexVariable
tags: [private]
```

```Go
func lexVariable(l *lexer) stateFn
```

lexVariable scans a Variable: $Alphanumeric. The $ has been scanned. 

#### <a id="lexFieldOrVariable" href="#lexFieldOrVariable">func lexFieldOrVariable(l *lexer, typ itemType) stateFn</a>

```
searchKey: parse.lexFieldOrVariable
tags: [private]
```

```Go
func lexFieldOrVariable(l *lexer, typ itemType) stateFn
```

lexVariable scans a field or variable: [.$]Alphanumeric. The . or $ has been scanned. 

#### <a id="lexChar" href="#lexChar">func lexChar(l *lexer) stateFn</a>

```
searchKey: parse.lexChar
tags: [private]
```

```Go
func lexChar(l *lexer) stateFn
```

lexChar scans a character constant. The initial quote is already scanned. Syntax checking is done by the parser. 

#### <a id="lexNumber" href="#lexNumber">func lexNumber(l *lexer) stateFn</a>

```
searchKey: parse.lexNumber
tags: [private]
```

```Go
func lexNumber(l *lexer) stateFn
```

lexNumber scans a number: decimal, octal, hex, float, or imaginary. This isn't a perfect number scanner - for instance it accepts "." and "0x0.2" and "089" - but when it's wrong the input is invalid and the parser (via strconv) will notice. 

#### <a id="lexQuote" href="#lexQuote">func lexQuote(l *lexer) stateFn</a>

```
searchKey: parse.lexQuote
tags: [private]
```

```Go
func lexQuote(l *lexer) stateFn
```

lexQuote scans a quoted string. 

#### <a id="lexRawQuote" href="#lexRawQuote">func lexRawQuote(l *lexer) stateFn</a>

```
searchKey: parse.lexRawQuote
tags: [private]
```

```Go
func lexRawQuote(l *lexer) stateFn
```

lexRawQuote scans a raw quoted string. 

### <a id="lexer" href="#lexer">type lexer struct</a>

```
searchKey: parse.lexer
tags: [private]
```

```Go
type lexer struct {
	name        string    // the name of the input; used only for error reports
	input       string    // the string being scanned
	leftDelim   string    // start of action
	rightDelim  string    // end of action
	emitComment bool      // emit itemComment tokens.
	pos         Pos       // current position in the input
	start       Pos       // start position of this item
	width       Pos       // width of last rune read from input
	items       chan item // channel of scanned items
	parenDepth  int       // nesting depth of ( ) exprs
	line        int       // 1+number of newlines seen
	startLine   int       // start line of this item
}
```

lexer holds the state of the scanner. 

#### <a id="lex" href="#lex">func lex(name, input, left, right string, emitComment bool) *lexer</a>

```
searchKey: parse.lex
tags: [private]
```

```Go
func lex(name, input, left, right string, emitComment bool) *lexer
```

lex creates a new scanner for the input string. 

#### <a id="lexer.next" href="#lexer.next">func (l *lexer) next() rune</a>

```
searchKey: parse.lexer.next
tags: [private]
```

```Go
func (l *lexer) next() rune
```

next returns the next rune in the input. 

#### <a id="lexer.peek" href="#lexer.peek">func (l *lexer) peek() rune</a>

```
searchKey: parse.lexer.peek
tags: [private]
```

```Go
func (l *lexer) peek() rune
```

peek returns but does not consume the next rune in the input. 

#### <a id="lexer.backup" href="#lexer.backup">func (l *lexer) backup()</a>

```
searchKey: parse.lexer.backup
tags: [private]
```

```Go
func (l *lexer) backup()
```

backup steps back one rune. Can only be called once per call of next. 

#### <a id="lexer.emit" href="#lexer.emit">func (l *lexer) emit(t itemType)</a>

```
searchKey: parse.lexer.emit
tags: [private]
```

```Go
func (l *lexer) emit(t itemType)
```

emit passes an item back to the client. 

#### <a id="lexer.ignore" href="#lexer.ignore">func (l *lexer) ignore()</a>

```
searchKey: parse.lexer.ignore
tags: [private]
```

```Go
func (l *lexer) ignore()
```

ignore skips over the pending input before this point. 

#### <a id="lexer.accept" href="#lexer.accept">func (l *lexer) accept(valid string) bool</a>

```
searchKey: parse.lexer.accept
tags: [private]
```

```Go
func (l *lexer) accept(valid string) bool
```

accept consumes the next rune if it's from the valid set. 

#### <a id="lexer.acceptRun" href="#lexer.acceptRun">func (l *lexer) acceptRun(valid string)</a>

```
searchKey: parse.lexer.acceptRun
tags: [private]
```

```Go
func (l *lexer) acceptRun(valid string)
```

acceptRun consumes a run of runes from the valid set. 

#### <a id="lexer.errorf" href="#lexer.errorf">func (l *lexer) errorf(format string, args ...interface{}) stateFn</a>

```
searchKey: parse.lexer.errorf
tags: [private]
```

```Go
func (l *lexer) errorf(format string, args ...interface{}) stateFn
```

errorf returns an error token and terminates the scan by passing back a nil pointer that will be the next state, terminating l.nextItem. 

#### <a id="lexer.nextItem" href="#lexer.nextItem">func (l *lexer) nextItem() item</a>

```
searchKey: parse.lexer.nextItem
tags: [private]
```

```Go
func (l *lexer) nextItem() item
```

nextItem returns the next item from the input. Called by the parser, not in the lexing goroutine. 

#### <a id="lexer.drain" href="#lexer.drain">func (l *lexer) drain()</a>

```
searchKey: parse.lexer.drain
tags: [private]
```

```Go
func (l *lexer) drain()
```

drain drains the output so the lexing goroutine will exit. Called by the parser, not in the lexing goroutine. 

#### <a id="lexer.run" href="#lexer.run">func (l *lexer) run()</a>

```
searchKey: parse.lexer.run
tags: [private]
```

```Go
func (l *lexer) run()
```

run runs the state machine for the lexer. 

#### <a id="lexer.atRightDelim" href="#lexer.atRightDelim">func (l *lexer) atRightDelim() (delim, trimSpaces bool)</a>

```
searchKey: parse.lexer.atRightDelim
tags: [private]
```

```Go
func (l *lexer) atRightDelim() (delim, trimSpaces bool)
```

atRightDelim reports whether the lexer is at a right delimiter, possibly preceded by a trim marker. 

#### <a id="lexer.atTerminator" href="#lexer.atTerminator">func (l *lexer) atTerminator() bool</a>

```
searchKey: parse.lexer.atTerminator
tags: [private]
```

```Go
func (l *lexer) atTerminator() bool
```

atTerminator reports whether the input is at valid termination character to appear after an identifier. Breaks .X.Y into two pieces. Also catches cases like "$x+2" not being acceptable without a space, in case we decide one day to implement arithmetic. 

#### <a id="lexer.scanNumber" href="#lexer.scanNumber">func (l *lexer) scanNumber() bool</a>

```
searchKey: parse.lexer.scanNumber
tags: [private]
```

```Go
func (l *lexer) scanNumber() bool
```

### <a id="Node" href="#Node">type Node interface</a>

```
searchKey: parse.Node
```

```Go
type Node interface {
	Type() NodeType
	String() string
	// Copy does a deep copy of the Node and all its components.
	// To avoid type assertions, some XxxNodes also have specialized
	// CopyXxx methods that return *XxxNode.
	Copy() Node
	Position() Pos // byte position of start of node in full original input string
	// tree returns the containing *Tree.
	// It is unexported so all implementations of Node are in this package.
	tree() *Tree
	// writeTo writes the String output to the builder.
	writeTo(*strings.Builder)
}
```

A Node is an element in the parse tree. The interface is trivial. The interface contains an unexported method so that only types local to this package can satisfy it. 

### <a id="NodeType" href="#NodeType">type NodeType int</a>

```
searchKey: parse.NodeType
```

```Go
type NodeType int
```

NodeType identifies the type of a parse tree node. 

#### <a id="NodeType.Type" href="#NodeType.Type">func (t NodeType) Type() NodeType</a>

```
searchKey: parse.NodeType.Type
```

```Go
func (t NodeType) Type() NodeType
```

Type returns itself and provides an easy default implementation for embedding in a Node. Embedded in all non-trivial Nodes. 

### <a id="Pos" href="#Pos">type Pos int</a>

```
searchKey: parse.Pos
```

```Go
type Pos int
```

Pos represents a byte position in the original input text from which this template was parsed. 

#### <a id="rightTrimLength" href="#rightTrimLength">func rightTrimLength(s string) Pos</a>

```
searchKey: parse.rightTrimLength
tags: [private]
```

```Go
func rightTrimLength(s string) Pos
```

rightTrimLength returns the length of the spaces at the end of the string. 

#### <a id="leftTrimLength" href="#leftTrimLength">func leftTrimLength(s string) Pos</a>

```
searchKey: parse.leftTrimLength
tags: [private]
```

```Go
func leftTrimLength(s string) Pos
```

leftTrimLength returns the length of the spaces at the beginning of the string. 

#### <a id="Pos.Position" href="#Pos.Position">func (p Pos) Position() Pos</a>

```
searchKey: parse.Pos.Position
```

```Go
func (p Pos) Position() Pos
```

### <a id="ListNode" href="#ListNode">type ListNode struct</a>

```
searchKey: parse.ListNode
```

```Go
type ListNode struct {
	NodeType
	Pos
	tr    *Tree
	Nodes []Node // The element nodes in lexical order.
}
```

ListNode holds a sequence of nodes. 

#### <a id="ListNode.append" href="#ListNode.append">func (l *ListNode) append(n Node)</a>

```
searchKey: parse.ListNode.append
tags: [private]
```

```Go
func (l *ListNode) append(n Node)
```

#### <a id="ListNode.tree" href="#ListNode.tree">func (l *ListNode) tree() *Tree</a>

```
searchKey: parse.ListNode.tree
tags: [private]
```

```Go
func (l *ListNode) tree() *Tree
```

#### <a id="ListNode.String" href="#ListNode.String">func (l *ListNode) String() string</a>

```
searchKey: parse.ListNode.String
```

```Go
func (l *ListNode) String() string
```

#### <a id="ListNode.writeTo" href="#ListNode.writeTo">func (l *ListNode) writeTo(sb *strings.Builder)</a>

```
searchKey: parse.ListNode.writeTo
tags: [private]
```

```Go
func (l *ListNode) writeTo(sb *strings.Builder)
```

#### <a id="ListNode.CopyList" href="#ListNode.CopyList">func (l *ListNode) CopyList() *ListNode</a>

```
searchKey: parse.ListNode.CopyList
```

```Go
func (l *ListNode) CopyList() *ListNode
```

#### <a id="ListNode.Copy" href="#ListNode.Copy">func (l *ListNode) Copy() Node</a>

```
searchKey: parse.ListNode.Copy
```

```Go
func (l *ListNode) Copy() Node
```

### <a id="TextNode" href="#TextNode">type TextNode struct</a>

```
searchKey: parse.TextNode
```

```Go
type TextNode struct {
	NodeType
	Pos
	tr   *Tree
	Text []byte // The text; may span newlines.
}
```

TextNode holds plain text. 

#### <a id="TextNode.String" href="#TextNode.String">func (t *TextNode) String() string</a>

```
searchKey: parse.TextNode.String
```

```Go
func (t *TextNode) String() string
```

#### <a id="TextNode.writeTo" href="#TextNode.writeTo">func (t *TextNode) writeTo(sb *strings.Builder)</a>

```
searchKey: parse.TextNode.writeTo
tags: [private]
```

```Go
func (t *TextNode) writeTo(sb *strings.Builder)
```

#### <a id="TextNode.tree" href="#TextNode.tree">func (t *TextNode) tree() *Tree</a>

```
searchKey: parse.TextNode.tree
tags: [private]
```

```Go
func (t *TextNode) tree() *Tree
```

#### <a id="TextNode.Copy" href="#TextNode.Copy">func (t *TextNode) Copy() Node</a>

```
searchKey: parse.TextNode.Copy
```

```Go
func (t *TextNode) Copy() Node
```

### <a id="CommentNode" href="#CommentNode">type CommentNode struct</a>

```
searchKey: parse.CommentNode
```

```Go
type CommentNode struct {
	NodeType
	Pos
	tr   *Tree
	Text string // Comment text.
}
```

CommentNode holds a comment. 

#### <a id="CommentNode.String" href="#CommentNode.String">func (c *CommentNode) String() string</a>

```
searchKey: parse.CommentNode.String
```

```Go
func (c *CommentNode) String() string
```

#### <a id="CommentNode.writeTo" href="#CommentNode.writeTo">func (c *CommentNode) writeTo(sb *strings.Builder)</a>

```
searchKey: parse.CommentNode.writeTo
tags: [private]
```

```Go
func (c *CommentNode) writeTo(sb *strings.Builder)
```

#### <a id="CommentNode.tree" href="#CommentNode.tree">func (c *CommentNode) tree() *Tree</a>

```
searchKey: parse.CommentNode.tree
tags: [private]
```

```Go
func (c *CommentNode) tree() *Tree
```

#### <a id="CommentNode.Copy" href="#CommentNode.Copy">func (c *CommentNode) Copy() Node</a>

```
searchKey: parse.CommentNode.Copy
```

```Go
func (c *CommentNode) Copy() Node
```

### <a id="PipeNode" href="#PipeNode">type PipeNode struct</a>

```
searchKey: parse.PipeNode
```

```Go
type PipeNode struct {
	NodeType
	Pos
	tr       *Tree
	Line     int             // The line number in the input. Deprecated: Kept for compatibility.
	IsAssign bool            // The variables are being assigned, not declared.
	Decl     []*VariableNode // Variables in lexical order.
	Cmds     []*CommandNode  // The commands in lexical order.
}
```

PipeNode holds a pipeline with optional declaration 

#### <a id="PipeNode.append" href="#PipeNode.append">func (p *PipeNode) append(command *CommandNode)</a>

```
searchKey: parse.PipeNode.append
tags: [private]
```

```Go
func (p *PipeNode) append(command *CommandNode)
```

#### <a id="PipeNode.String" href="#PipeNode.String">func (p *PipeNode) String() string</a>

```
searchKey: parse.PipeNode.String
```

```Go
func (p *PipeNode) String() string
```

#### <a id="PipeNode.writeTo" href="#PipeNode.writeTo">func (p *PipeNode) writeTo(sb *strings.Builder)</a>

```
searchKey: parse.PipeNode.writeTo
tags: [private]
```

```Go
func (p *PipeNode) writeTo(sb *strings.Builder)
```

#### <a id="PipeNode.tree" href="#PipeNode.tree">func (p *PipeNode) tree() *Tree</a>

```
searchKey: parse.PipeNode.tree
tags: [private]
```

```Go
func (p *PipeNode) tree() *Tree
```

#### <a id="PipeNode.CopyPipe" href="#PipeNode.CopyPipe">func (p *PipeNode) CopyPipe() *PipeNode</a>

```
searchKey: parse.PipeNode.CopyPipe
```

```Go
func (p *PipeNode) CopyPipe() *PipeNode
```

#### <a id="PipeNode.Copy" href="#PipeNode.Copy">func (p *PipeNode) Copy() Node</a>

```
searchKey: parse.PipeNode.Copy
```

```Go
func (p *PipeNode) Copy() Node
```

### <a id="ActionNode" href="#ActionNode">type ActionNode struct</a>

```
searchKey: parse.ActionNode
```

```Go
type ActionNode struct {
	NodeType
	Pos
	tr   *Tree
	Line int       // The line number in the input. Deprecated: Kept for compatibility.
	Pipe *PipeNode // The pipeline in the action.
}
```

ActionNode holds an action (something bounded by delimiters). Control actions have their own nodes; ActionNode represents simple ones such as field evaluations and parenthesized pipelines. 

#### <a id="ActionNode.String" href="#ActionNode.String">func (a *ActionNode) String() string</a>

```
searchKey: parse.ActionNode.String
```

```Go
func (a *ActionNode) String() string
```

#### <a id="ActionNode.writeTo" href="#ActionNode.writeTo">func (a *ActionNode) writeTo(sb *strings.Builder)</a>

```
searchKey: parse.ActionNode.writeTo
tags: [private]
```

```Go
func (a *ActionNode) writeTo(sb *strings.Builder)
```

#### <a id="ActionNode.tree" href="#ActionNode.tree">func (a *ActionNode) tree() *Tree</a>

```
searchKey: parse.ActionNode.tree
tags: [private]
```

```Go
func (a *ActionNode) tree() *Tree
```

#### <a id="ActionNode.Copy" href="#ActionNode.Copy">func (a *ActionNode) Copy() Node</a>

```
searchKey: parse.ActionNode.Copy
```

```Go
func (a *ActionNode) Copy() Node
```

### <a id="CommandNode" href="#CommandNode">type CommandNode struct</a>

```
searchKey: parse.CommandNode
```

```Go
type CommandNode struct {
	NodeType
	Pos
	tr   *Tree
	Args []Node // Arguments in lexical order: Identifier, field, or constant.
}
```

CommandNode holds a command (a pipeline inside an evaluating action). 

#### <a id="CommandNode.append" href="#CommandNode.append">func (c *CommandNode) append(arg Node)</a>

```
searchKey: parse.CommandNode.append
tags: [private]
```

```Go
func (c *CommandNode) append(arg Node)
```

#### <a id="CommandNode.String" href="#CommandNode.String">func (c *CommandNode) String() string</a>

```
searchKey: parse.CommandNode.String
```

```Go
func (c *CommandNode) String() string
```

#### <a id="CommandNode.writeTo" href="#CommandNode.writeTo">func (c *CommandNode) writeTo(sb *strings.Builder)</a>

```
searchKey: parse.CommandNode.writeTo
tags: [private]
```

```Go
func (c *CommandNode) writeTo(sb *strings.Builder)
```

#### <a id="CommandNode.tree" href="#CommandNode.tree">func (c *CommandNode) tree() *Tree</a>

```
searchKey: parse.CommandNode.tree
tags: [private]
```

```Go
func (c *CommandNode) tree() *Tree
```

#### <a id="CommandNode.Copy" href="#CommandNode.Copy">func (c *CommandNode) Copy() Node</a>

```
searchKey: parse.CommandNode.Copy
```

```Go
func (c *CommandNode) Copy() Node
```

### <a id="IdentifierNode" href="#IdentifierNode">type IdentifierNode struct</a>

```
searchKey: parse.IdentifierNode
```

```Go
type IdentifierNode struct {
	NodeType
	Pos
	tr    *Tree
	Ident string // The identifier's name.
}
```

IdentifierNode holds an identifier. 

#### <a id="NewIdentifier" href="#NewIdentifier">func NewIdentifier(ident string) *IdentifierNode</a>

```
searchKey: parse.NewIdentifier
```

```Go
func NewIdentifier(ident string) *IdentifierNode
```

NewIdentifier returns a new IdentifierNode with the given identifier name. 

#### <a id="IdentifierNode.SetPos" href="#IdentifierNode.SetPos">func (i *IdentifierNode) SetPos(pos Pos) *IdentifierNode</a>

```
searchKey: parse.IdentifierNode.SetPos
```

```Go
func (i *IdentifierNode) SetPos(pos Pos) *IdentifierNode
```

SetPos sets the position. NewIdentifier is a public method so we can't modify its signature. Chained for convenience. TODO: fix one day? 

#### <a id="IdentifierNode.SetTree" href="#IdentifierNode.SetTree">func (i *IdentifierNode) SetTree(t *Tree) *IdentifierNode</a>

```
searchKey: parse.IdentifierNode.SetTree
```

```Go
func (i *IdentifierNode) SetTree(t *Tree) *IdentifierNode
```

SetTree sets the parent tree for the node. NewIdentifier is a public method so we can't modify its signature. Chained for convenience. TODO: fix one day? 

#### <a id="IdentifierNode.String" href="#IdentifierNode.String">func (i *IdentifierNode) String() string</a>

```
searchKey: parse.IdentifierNode.String
```

```Go
func (i *IdentifierNode) String() string
```

#### <a id="IdentifierNode.writeTo" href="#IdentifierNode.writeTo">func (i *IdentifierNode) writeTo(sb *strings.Builder)</a>

```
searchKey: parse.IdentifierNode.writeTo
tags: [private]
```

```Go
func (i *IdentifierNode) writeTo(sb *strings.Builder)
```

#### <a id="IdentifierNode.tree" href="#IdentifierNode.tree">func (i *IdentifierNode) tree() *Tree</a>

```
searchKey: parse.IdentifierNode.tree
tags: [private]
```

```Go
func (i *IdentifierNode) tree() *Tree
```

#### <a id="IdentifierNode.Copy" href="#IdentifierNode.Copy">func (i *IdentifierNode) Copy() Node</a>

```
searchKey: parse.IdentifierNode.Copy
```

```Go
func (i *IdentifierNode) Copy() Node
```

### <a id="VariableNode" href="#VariableNode">type VariableNode struct</a>

```
searchKey: parse.VariableNode
```

```Go
type VariableNode struct {
	NodeType
	Pos
	tr    *Tree
	Ident []string // Variable name and fields in lexical order.
}
```

VariableNode holds a list of variable names, possibly with chained field accesses. The dollar sign is part of the (first) name. 

#### <a id="VariableNode.String" href="#VariableNode.String">func (v *VariableNode) String() string</a>

```
searchKey: parse.VariableNode.String
```

```Go
func (v *VariableNode) String() string
```

#### <a id="VariableNode.writeTo" href="#VariableNode.writeTo">func (v *VariableNode) writeTo(sb *strings.Builder)</a>

```
searchKey: parse.VariableNode.writeTo
tags: [private]
```

```Go
func (v *VariableNode) writeTo(sb *strings.Builder)
```

#### <a id="VariableNode.tree" href="#VariableNode.tree">func (v *VariableNode) tree() *Tree</a>

```
searchKey: parse.VariableNode.tree
tags: [private]
```

```Go
func (v *VariableNode) tree() *Tree
```

#### <a id="VariableNode.Copy" href="#VariableNode.Copy">func (v *VariableNode) Copy() Node</a>

```
searchKey: parse.VariableNode.Copy
```

```Go
func (v *VariableNode) Copy() Node
```

### <a id="DotNode" href="#DotNode">type DotNode struct</a>

```
searchKey: parse.DotNode
```

```Go
type DotNode struct {
	NodeType
	Pos
	tr *Tree
}
```

DotNode holds the special identifier '.'. 

#### <a id="DotNode.Type" href="#DotNode.Type">func (d *DotNode) Type() NodeType</a>

```
searchKey: parse.DotNode.Type
```

```Go
func (d *DotNode) Type() NodeType
```

#### <a id="DotNode.String" href="#DotNode.String">func (d *DotNode) String() string</a>

```
searchKey: parse.DotNode.String
```

```Go
func (d *DotNode) String() string
```

#### <a id="DotNode.writeTo" href="#DotNode.writeTo">func (d *DotNode) writeTo(sb *strings.Builder)</a>

```
searchKey: parse.DotNode.writeTo
tags: [private]
```

```Go
func (d *DotNode) writeTo(sb *strings.Builder)
```

#### <a id="DotNode.tree" href="#DotNode.tree">func (d *DotNode) tree() *Tree</a>

```
searchKey: parse.DotNode.tree
tags: [private]
```

```Go
func (d *DotNode) tree() *Tree
```

#### <a id="DotNode.Copy" href="#DotNode.Copy">func (d *DotNode) Copy() Node</a>

```
searchKey: parse.DotNode.Copy
```

```Go
func (d *DotNode) Copy() Node
```

### <a id="NilNode" href="#NilNode">type NilNode struct</a>

```
searchKey: parse.NilNode
```

```Go
type NilNode struct {
	NodeType
	Pos
	tr *Tree
}
```

NilNode holds the special identifier 'nil' representing an untyped nil constant. 

#### <a id="NilNode.Type" href="#NilNode.Type">func (n *NilNode) Type() NodeType</a>

```
searchKey: parse.NilNode.Type
```

```Go
func (n *NilNode) Type() NodeType
```

#### <a id="NilNode.String" href="#NilNode.String">func (n *NilNode) String() string</a>

```
searchKey: parse.NilNode.String
```

```Go
func (n *NilNode) String() string
```

#### <a id="NilNode.writeTo" href="#NilNode.writeTo">func (n *NilNode) writeTo(sb *strings.Builder)</a>

```
searchKey: parse.NilNode.writeTo
tags: [private]
```

```Go
func (n *NilNode) writeTo(sb *strings.Builder)
```

#### <a id="NilNode.tree" href="#NilNode.tree">func (n *NilNode) tree() *Tree</a>

```
searchKey: parse.NilNode.tree
tags: [private]
```

```Go
func (n *NilNode) tree() *Tree
```

#### <a id="NilNode.Copy" href="#NilNode.Copy">func (n *NilNode) Copy() Node</a>

```
searchKey: parse.NilNode.Copy
```

```Go
func (n *NilNode) Copy() Node
```

### <a id="FieldNode" href="#FieldNode">type FieldNode struct</a>

```
searchKey: parse.FieldNode
```

```Go
type FieldNode struct {
	NodeType
	Pos
	tr    *Tree
	Ident []string // The identifiers in lexical order.
}
```

FieldNode holds a field (identifier starting with '.'). The names may be chained ('.x.y'). The period is dropped from each ident. 

#### <a id="FieldNode.String" href="#FieldNode.String">func (f *FieldNode) String() string</a>

```
searchKey: parse.FieldNode.String
```

```Go
func (f *FieldNode) String() string
```

#### <a id="FieldNode.writeTo" href="#FieldNode.writeTo">func (f *FieldNode) writeTo(sb *strings.Builder)</a>

```
searchKey: parse.FieldNode.writeTo
tags: [private]
```

```Go
func (f *FieldNode) writeTo(sb *strings.Builder)
```

#### <a id="FieldNode.tree" href="#FieldNode.tree">func (f *FieldNode) tree() *Tree</a>

```
searchKey: parse.FieldNode.tree
tags: [private]
```

```Go
func (f *FieldNode) tree() *Tree
```

#### <a id="FieldNode.Copy" href="#FieldNode.Copy">func (f *FieldNode) Copy() Node</a>

```
searchKey: parse.FieldNode.Copy
```

```Go
func (f *FieldNode) Copy() Node
```

### <a id="ChainNode" href="#ChainNode">type ChainNode struct</a>

```
searchKey: parse.ChainNode
```

```Go
type ChainNode struct {
	NodeType
	Pos
	tr    *Tree
	Node  Node
	Field []string // The identifiers in lexical order.
}
```

ChainNode holds a term followed by a chain of field accesses (identifier starting with '.'). The names may be chained ('.x.y'). The periods are dropped from each ident. 

#### <a id="ChainNode.Add" href="#ChainNode.Add">func (c *ChainNode) Add(field string)</a>

```
searchKey: parse.ChainNode.Add
```

```Go
func (c *ChainNode) Add(field string)
```

Add adds the named field (which should start with a period) to the end of the chain. 

#### <a id="ChainNode.String" href="#ChainNode.String">func (c *ChainNode) String() string</a>

```
searchKey: parse.ChainNode.String
```

```Go
func (c *ChainNode) String() string
```

#### <a id="ChainNode.writeTo" href="#ChainNode.writeTo">func (c *ChainNode) writeTo(sb *strings.Builder)</a>

```
searchKey: parse.ChainNode.writeTo
tags: [private]
```

```Go
func (c *ChainNode) writeTo(sb *strings.Builder)
```

#### <a id="ChainNode.tree" href="#ChainNode.tree">func (c *ChainNode) tree() *Tree</a>

```
searchKey: parse.ChainNode.tree
tags: [private]
```

```Go
func (c *ChainNode) tree() *Tree
```

#### <a id="ChainNode.Copy" href="#ChainNode.Copy">func (c *ChainNode) Copy() Node</a>

```
searchKey: parse.ChainNode.Copy
```

```Go
func (c *ChainNode) Copy() Node
```

### <a id="BoolNode" href="#BoolNode">type BoolNode struct</a>

```
searchKey: parse.BoolNode
```

```Go
type BoolNode struct {
	NodeType
	Pos
	tr   *Tree
	True bool // The value of the boolean constant.
}
```

BoolNode holds a boolean constant. 

#### <a id="BoolNode.String" href="#BoolNode.String">func (b *BoolNode) String() string</a>

```
searchKey: parse.BoolNode.String
```

```Go
func (b *BoolNode) String() string
```

#### <a id="BoolNode.writeTo" href="#BoolNode.writeTo">func (b *BoolNode) writeTo(sb *strings.Builder)</a>

```
searchKey: parse.BoolNode.writeTo
tags: [private]
```

```Go
func (b *BoolNode) writeTo(sb *strings.Builder)
```

#### <a id="BoolNode.tree" href="#BoolNode.tree">func (b *BoolNode) tree() *Tree</a>

```
searchKey: parse.BoolNode.tree
tags: [private]
```

```Go
func (b *BoolNode) tree() *Tree
```

#### <a id="BoolNode.Copy" href="#BoolNode.Copy">func (b *BoolNode) Copy() Node</a>

```
searchKey: parse.BoolNode.Copy
```

```Go
func (b *BoolNode) Copy() Node
```

### <a id="NumberNode" href="#NumberNode">type NumberNode struct</a>

```
searchKey: parse.NumberNode
```

```Go
type NumberNode struct {
	NodeType
	Pos
	tr         *Tree
	IsInt      bool       // Number has an integral value.
	IsUint     bool       // Number has an unsigned integral value.
	IsFloat    bool       // Number has a floating-point value.
	IsComplex  bool       // Number is complex.
	Int64      int64      // The signed integer value.
	Uint64     uint64     // The unsigned integer value.
	Float64    float64    // The floating-point value.
	Complex128 complex128 // The complex value.
	Text       string     // The original textual representation from the input.
}
```

NumberNode holds a number: signed or unsigned integer, float, or complex. The value is parsed and stored under all the types that can represent the value. This simulates in a small amount of code the behavior of Go's ideal constants. 

#### <a id="NumberNode.simplifyComplex" href="#NumberNode.simplifyComplex">func (n *NumberNode) simplifyComplex()</a>

```
searchKey: parse.NumberNode.simplifyComplex
tags: [private]
```

```Go
func (n *NumberNode) simplifyComplex()
```

simplifyComplex pulls out any other types that are represented by the complex number. These all require that the imaginary part be zero. 

#### <a id="NumberNode.String" href="#NumberNode.String">func (n *NumberNode) String() string</a>

```
searchKey: parse.NumberNode.String
```

```Go
func (n *NumberNode) String() string
```

#### <a id="NumberNode.writeTo" href="#NumberNode.writeTo">func (n *NumberNode) writeTo(sb *strings.Builder)</a>

```
searchKey: parse.NumberNode.writeTo
tags: [private]
```

```Go
func (n *NumberNode) writeTo(sb *strings.Builder)
```

#### <a id="NumberNode.tree" href="#NumberNode.tree">func (n *NumberNode) tree() *Tree</a>

```
searchKey: parse.NumberNode.tree
tags: [private]
```

```Go
func (n *NumberNode) tree() *Tree
```

#### <a id="NumberNode.Copy" href="#NumberNode.Copy">func (n *NumberNode) Copy() Node</a>

```
searchKey: parse.NumberNode.Copy
```

```Go
func (n *NumberNode) Copy() Node
```

### <a id="StringNode" href="#StringNode">type StringNode struct</a>

```
searchKey: parse.StringNode
```

```Go
type StringNode struct {
	NodeType
	Pos
	tr     *Tree
	Quoted string // The original text of the string, with quotes.
	Text   string // The string, after quote processing.
}
```

StringNode holds a string constant. The value has been "unquoted". 

#### <a id="StringNode.String" href="#StringNode.String">func (s *StringNode) String() string</a>

```
searchKey: parse.StringNode.String
```

```Go
func (s *StringNode) String() string
```

#### <a id="StringNode.writeTo" href="#StringNode.writeTo">func (s *StringNode) writeTo(sb *strings.Builder)</a>

```
searchKey: parse.StringNode.writeTo
tags: [private]
```

```Go
func (s *StringNode) writeTo(sb *strings.Builder)
```

#### <a id="StringNode.tree" href="#StringNode.tree">func (s *StringNode) tree() *Tree</a>

```
searchKey: parse.StringNode.tree
tags: [private]
```

```Go
func (s *StringNode) tree() *Tree
```

#### <a id="StringNode.Copy" href="#StringNode.Copy">func (s *StringNode) Copy() Node</a>

```
searchKey: parse.StringNode.Copy
```

```Go
func (s *StringNode) Copy() Node
```

### <a id="endNode" href="#endNode">type endNode struct</a>

```
searchKey: parse.endNode
tags: [private]
```

```Go
type endNode struct {
	NodeType
	Pos
	tr *Tree
}
```

endNode represents an {{end}} action. It does not appear in the final parse tree. 

#### <a id="endNode.String" href="#endNode.String">func (e *endNode) String() string</a>

```
searchKey: parse.endNode.String
tags: [private]
```

```Go
func (e *endNode) String() string
```

#### <a id="endNode.writeTo" href="#endNode.writeTo">func (e *endNode) writeTo(sb *strings.Builder)</a>

```
searchKey: parse.endNode.writeTo
tags: [private]
```

```Go
func (e *endNode) writeTo(sb *strings.Builder)
```

#### <a id="endNode.tree" href="#endNode.tree">func (e *endNode) tree() *Tree</a>

```
searchKey: parse.endNode.tree
tags: [private]
```

```Go
func (e *endNode) tree() *Tree
```

#### <a id="endNode.Copy" href="#endNode.Copy">func (e *endNode) Copy() Node</a>

```
searchKey: parse.endNode.Copy
tags: [private]
```

```Go
func (e *endNode) Copy() Node
```

### <a id="elseNode" href="#elseNode">type elseNode struct</a>

```
searchKey: parse.elseNode
tags: [private]
```

```Go
type elseNode struct {
	NodeType
	Pos
	tr   *Tree
	Line int // The line number in the input. Deprecated: Kept for compatibility.
}
```

elseNode represents an {{else}} action. Does not appear in the final tree. 

#### <a id="elseNode.Type" href="#elseNode.Type">func (e *elseNode) Type() NodeType</a>

```
searchKey: parse.elseNode.Type
tags: [private]
```

```Go
func (e *elseNode) Type() NodeType
```

#### <a id="elseNode.String" href="#elseNode.String">func (e *elseNode) String() string</a>

```
searchKey: parse.elseNode.String
tags: [private]
```

```Go
func (e *elseNode) String() string
```

#### <a id="elseNode.writeTo" href="#elseNode.writeTo">func (e *elseNode) writeTo(sb *strings.Builder)</a>

```
searchKey: parse.elseNode.writeTo
tags: [private]
```

```Go
func (e *elseNode) writeTo(sb *strings.Builder)
```

#### <a id="elseNode.tree" href="#elseNode.tree">func (e *elseNode) tree() *Tree</a>

```
searchKey: parse.elseNode.tree
tags: [private]
```

```Go
func (e *elseNode) tree() *Tree
```

#### <a id="elseNode.Copy" href="#elseNode.Copy">func (e *elseNode) Copy() Node</a>

```
searchKey: parse.elseNode.Copy
tags: [private]
```

```Go
func (e *elseNode) Copy() Node
```

### <a id="BranchNode" href="#BranchNode">type BranchNode struct</a>

```
searchKey: parse.BranchNode
```

```Go
type BranchNode struct {
	NodeType
	Pos
	tr       *Tree
	Line     int       // The line number in the input. Deprecated: Kept for compatibility.
	Pipe     *PipeNode // The pipeline to be evaluated.
	List     *ListNode // What to execute if the value is non-empty.
	ElseList *ListNode // What to execute if the value is empty (nil if absent).
}
```

BranchNode is the common representation of if, range, and with. 

#### <a id="BranchNode.String" href="#BranchNode.String">func (b *BranchNode) String() string</a>

```
searchKey: parse.BranchNode.String
```

```Go
func (b *BranchNode) String() string
```

#### <a id="BranchNode.writeTo" href="#BranchNode.writeTo">func (b *BranchNode) writeTo(sb *strings.Builder)</a>

```
searchKey: parse.BranchNode.writeTo
tags: [private]
```

```Go
func (b *BranchNode) writeTo(sb *strings.Builder)
```

#### <a id="BranchNode.tree" href="#BranchNode.tree">func (b *BranchNode) tree() *Tree</a>

```
searchKey: parse.BranchNode.tree
tags: [private]
```

```Go
func (b *BranchNode) tree() *Tree
```

#### <a id="BranchNode.Copy" href="#BranchNode.Copy">func (b *BranchNode) Copy() Node</a>

```
searchKey: parse.BranchNode.Copy
```

```Go
func (b *BranchNode) Copy() Node
```

### <a id="IfNode" href="#IfNode">type IfNode struct</a>

```
searchKey: parse.IfNode
```

```Go
type IfNode struct {
	BranchNode
}
```

IfNode represents an {{if}} action and its commands. 

#### <a id="IfNode.Copy" href="#IfNode.Copy">func (i *IfNode) Copy() Node</a>

```
searchKey: parse.IfNode.Copy
```

```Go
func (i *IfNode) Copy() Node
```

### <a id="RangeNode" href="#RangeNode">type RangeNode struct</a>

```
searchKey: parse.RangeNode
```

```Go
type RangeNode struct {
	BranchNode
}
```

RangeNode represents a {{range}} action and its commands. 

#### <a id="RangeNode.Copy" href="#RangeNode.Copy">func (r *RangeNode) Copy() Node</a>

```
searchKey: parse.RangeNode.Copy
```

```Go
func (r *RangeNode) Copy() Node
```

### <a id="WithNode" href="#WithNode">type WithNode struct</a>

```
searchKey: parse.WithNode
```

```Go
type WithNode struct {
	BranchNode
}
```

WithNode represents a {{with}} action and its commands. 

#### <a id="WithNode.Copy" href="#WithNode.Copy">func (w *WithNode) Copy() Node</a>

```
searchKey: parse.WithNode.Copy
```

```Go
func (w *WithNode) Copy() Node
```

### <a id="TemplateNode" href="#TemplateNode">type TemplateNode struct</a>

```
searchKey: parse.TemplateNode
```

```Go
type TemplateNode struct {
	NodeType
	Pos
	tr   *Tree
	Line int       // The line number in the input. Deprecated: Kept for compatibility.
	Name string    // The name of the template (unquoted).
	Pipe *PipeNode // The command to evaluate as dot for the template.
}
```

TemplateNode represents a {{template}} action. 

#### <a id="TemplateNode.String" href="#TemplateNode.String">func (t *TemplateNode) String() string</a>

```
searchKey: parse.TemplateNode.String
```

```Go
func (t *TemplateNode) String() string
```

#### <a id="TemplateNode.writeTo" href="#TemplateNode.writeTo">func (t *TemplateNode) writeTo(sb *strings.Builder)</a>

```
searchKey: parse.TemplateNode.writeTo
tags: [private]
```

```Go
func (t *TemplateNode) writeTo(sb *strings.Builder)
```

#### <a id="TemplateNode.tree" href="#TemplateNode.tree">func (t *TemplateNode) tree() *Tree</a>

```
searchKey: parse.TemplateNode.tree
tags: [private]
```

```Go
func (t *TemplateNode) tree() *Tree
```

#### <a id="TemplateNode.Copy" href="#TemplateNode.Copy">func (t *TemplateNode) Copy() Node</a>

```
searchKey: parse.TemplateNode.Copy
```

```Go
func (t *TemplateNode) Copy() Node
```

### <a id="Tree" href="#Tree">type Tree struct</a>

```
searchKey: parse.Tree
```

```Go
type Tree struct {
	Name      string    // name of the template represented by the tree.
	ParseName string    // name of the top-level template during parsing, for error messages.
	Root      *ListNode // top-level root of the tree.
	Mode      Mode      // parsing mode.
	text      string    // text parsed to create the template (or its parent)
	// Parsing only; cleared after parse.
	funcs      []map[string]interface{}
	lex        *lexer
	token      [3]item // three-token lookahead for parser.
	peekCount  int
	vars       []string // variables defined at the moment.
	treeSet    map[string]*Tree
	actionLine int // line of left delim starting action
	mode       Mode
}
```

Tree is the representation of a single parsed template. 

#### <a id="New" href="#New">func New(name string, funcs ...map[string]interface{}) *Tree</a>

```
searchKey: parse.New
```

```Go
func New(name string, funcs ...map[string]interface{}) *Tree
```

New allocates a new parse tree with the given name. 

#### <a id="Tree.newList" href="#Tree.newList">func (t *Tree) newList(pos Pos) *ListNode</a>

```
searchKey: parse.Tree.newList
tags: [private]
```

```Go
func (t *Tree) newList(pos Pos) *ListNode
```

#### <a id="Tree.newText" href="#Tree.newText">func (t *Tree) newText(pos Pos, text string) *TextNode</a>

```
searchKey: parse.Tree.newText
tags: [private]
```

```Go
func (t *Tree) newText(pos Pos, text string) *TextNode
```

#### <a id="Tree.newComment" href="#Tree.newComment">func (t *Tree) newComment(pos Pos, text string) *CommentNode</a>

```
searchKey: parse.Tree.newComment
tags: [private]
```

```Go
func (t *Tree) newComment(pos Pos, text string) *CommentNode
```

#### <a id="Tree.newPipeline" href="#Tree.newPipeline">func (t *Tree) newPipeline(pos Pos, line int, vars []*VariableNode) *PipeNode</a>

```
searchKey: parse.Tree.newPipeline
tags: [private]
```

```Go
func (t *Tree) newPipeline(pos Pos, line int, vars []*VariableNode) *PipeNode
```

#### <a id="Tree.newAction" href="#Tree.newAction">func (t *Tree) newAction(pos Pos, line int, pipe *PipeNode) *ActionNode</a>

```
searchKey: parse.Tree.newAction
tags: [private]
```

```Go
func (t *Tree) newAction(pos Pos, line int, pipe *PipeNode) *ActionNode
```

#### <a id="Tree.newCommand" href="#Tree.newCommand">func (t *Tree) newCommand(pos Pos) *CommandNode</a>

```
searchKey: parse.Tree.newCommand
tags: [private]
```

```Go
func (t *Tree) newCommand(pos Pos) *CommandNode
```

#### <a id="Tree.newVariable" href="#Tree.newVariable">func (t *Tree) newVariable(pos Pos, ident string) *VariableNode</a>

```
searchKey: parse.Tree.newVariable
tags: [private]
```

```Go
func (t *Tree) newVariable(pos Pos, ident string) *VariableNode
```

#### <a id="Tree.newDot" href="#Tree.newDot">func (t *Tree) newDot(pos Pos) *DotNode</a>

```
searchKey: parse.Tree.newDot
tags: [private]
```

```Go
func (t *Tree) newDot(pos Pos) *DotNode
```

#### <a id="Tree.newNil" href="#Tree.newNil">func (t *Tree) newNil(pos Pos) *NilNode</a>

```
searchKey: parse.Tree.newNil
tags: [private]
```

```Go
func (t *Tree) newNil(pos Pos) *NilNode
```

#### <a id="Tree.newField" href="#Tree.newField">func (t *Tree) newField(pos Pos, ident string) *FieldNode</a>

```
searchKey: parse.Tree.newField
tags: [private]
```

```Go
func (t *Tree) newField(pos Pos, ident string) *FieldNode
```

#### <a id="Tree.newChain" href="#Tree.newChain">func (t *Tree) newChain(pos Pos, node Node) *ChainNode</a>

```
searchKey: parse.Tree.newChain
tags: [private]
```

```Go
func (t *Tree) newChain(pos Pos, node Node) *ChainNode
```

#### <a id="Tree.newBool" href="#Tree.newBool">func (t *Tree) newBool(pos Pos, true bool) *BoolNode</a>

```
searchKey: parse.Tree.newBool
tags: [private]
```

```Go
func (t *Tree) newBool(pos Pos, true bool) *BoolNode
```

#### <a id="Tree.newNumber" href="#Tree.newNumber">func (t *Tree) newNumber(pos Pos, text string, typ itemType) (*NumberNode, error)</a>

```
searchKey: parse.Tree.newNumber
tags: [private]
```

```Go
func (t *Tree) newNumber(pos Pos, text string, typ itemType) (*NumberNode, error)
```

#### <a id="Tree.newString" href="#Tree.newString">func (t *Tree) newString(pos Pos, orig, text string) *StringNode</a>

```
searchKey: parse.Tree.newString
tags: [private]
```

```Go
func (t *Tree) newString(pos Pos, orig, text string) *StringNode
```

#### <a id="Tree.newEnd" href="#Tree.newEnd">func (t *Tree) newEnd(pos Pos) *endNode</a>

```
searchKey: parse.Tree.newEnd
tags: [private]
```

```Go
func (t *Tree) newEnd(pos Pos) *endNode
```

#### <a id="Tree.newElse" href="#Tree.newElse">func (t *Tree) newElse(pos Pos, line int) *elseNode</a>

```
searchKey: parse.Tree.newElse
tags: [private]
```

```Go
func (t *Tree) newElse(pos Pos, line int) *elseNode
```

#### <a id="Tree.newIf" href="#Tree.newIf">func (t *Tree) newIf(pos Pos, line int, pipe *PipeNode, list, elseList *ListNode) *IfNode</a>

```
searchKey: parse.Tree.newIf
tags: [private]
```

```Go
func (t *Tree) newIf(pos Pos, line int, pipe *PipeNode, list, elseList *ListNode) *IfNode
```

#### <a id="Tree.newRange" href="#Tree.newRange">func (t *Tree) newRange(pos Pos, line int, pipe *PipeNode, list, elseList *ListNode) *RangeNode</a>

```
searchKey: parse.Tree.newRange
tags: [private]
```

```Go
func (t *Tree) newRange(pos Pos, line int, pipe *PipeNode, list, elseList *ListNode) *RangeNode
```

#### <a id="Tree.newWith" href="#Tree.newWith">func (t *Tree) newWith(pos Pos, line int, pipe *PipeNode, list, elseList *ListNode) *WithNode</a>

```
searchKey: parse.Tree.newWith
tags: [private]
```

```Go
func (t *Tree) newWith(pos Pos, line int, pipe *PipeNode, list, elseList *ListNode) *WithNode
```

#### <a id="Tree.newTemplate" href="#Tree.newTemplate">func (t *Tree) newTemplate(pos Pos, line int, name string, pipe *PipeNode) *TemplateNode</a>

```
searchKey: parse.Tree.newTemplate
tags: [private]
```

```Go
func (t *Tree) newTemplate(pos Pos, line int, name string, pipe *PipeNode) *TemplateNode
```

#### <a id="Tree.Copy" href="#Tree.Copy">func (t *Tree) Copy() *Tree</a>

```
searchKey: parse.Tree.Copy
```

```Go
func (t *Tree) Copy() *Tree
```

Copy returns a copy of the Tree. Any parsing state is discarded. 

#### <a id="Tree.next" href="#Tree.next">func (t *Tree) next() item</a>

```
searchKey: parse.Tree.next
tags: [private]
```

```Go
func (t *Tree) next() item
```

next returns the next token. 

#### <a id="Tree.backup" href="#Tree.backup">func (t *Tree) backup()</a>

```
searchKey: parse.Tree.backup
tags: [private]
```

```Go
func (t *Tree) backup()
```

backup backs the input stream up one token. 

#### <a id="Tree.backup2" href="#Tree.backup2">func (t *Tree) backup2(t1 item)</a>

```
searchKey: parse.Tree.backup2
tags: [private]
```

```Go
func (t *Tree) backup2(t1 item)
```

backup2 backs the input stream up two tokens. The zeroth token is already there. 

#### <a id="Tree.backup3" href="#Tree.backup3">func (t *Tree) backup3(t2, t1 item)</a>

```
searchKey: parse.Tree.backup3
tags: [private]
```

```Go
func (t *Tree) backup3(t2, t1 item)
```

backup3 backs the input stream up three tokens The zeroth token is already there. 

#### <a id="Tree.peek" href="#Tree.peek">func (t *Tree) peek() item</a>

```
searchKey: parse.Tree.peek
tags: [private]
```

```Go
func (t *Tree) peek() item
```

peek returns but does not consume the next token. 

#### <a id="Tree.nextNonSpace" href="#Tree.nextNonSpace">func (t *Tree) nextNonSpace() (token item)</a>

```
searchKey: parse.Tree.nextNonSpace
tags: [private]
```

```Go
func (t *Tree) nextNonSpace() (token item)
```

nextNonSpace returns the next non-space token. 

#### <a id="Tree.peekNonSpace" href="#Tree.peekNonSpace">func (t *Tree) peekNonSpace() item</a>

```
searchKey: parse.Tree.peekNonSpace
tags: [private]
```

```Go
func (t *Tree) peekNonSpace() item
```

peekNonSpace returns but does not consume the next non-space token. 

#### <a id="Tree.ErrorContext" href="#Tree.ErrorContext">func (t *Tree) ErrorContext(n Node) (location, context string)</a>

```
searchKey: parse.Tree.ErrorContext
```

```Go
func (t *Tree) ErrorContext(n Node) (location, context string)
```

ErrorContext returns a textual representation of the location of the node in the input text. The receiver is only used when the node does not have a pointer to the tree inside, which can occur in old code. 

#### <a id="Tree.errorf" href="#Tree.errorf">func (t *Tree) errorf(format string, args ...interface{})</a>

```
searchKey: parse.Tree.errorf
tags: [private]
```

```Go
func (t *Tree) errorf(format string, args ...interface{})
```

errorf formats the error and terminates processing. 

#### <a id="Tree.error" href="#Tree.error">func (t *Tree) error(err error)</a>

```
searchKey: parse.Tree.error
tags: [private]
```

```Go
func (t *Tree) error(err error)
```

error terminates processing. 

#### <a id="Tree.expect" href="#Tree.expect">func (t *Tree) expect(expected itemType, context string) item</a>

```
searchKey: parse.Tree.expect
tags: [private]
```

```Go
func (t *Tree) expect(expected itemType, context string) item
```

expect consumes the next token and guarantees it has the required type. 

#### <a id="Tree.expectOneOf" href="#Tree.expectOneOf">func (t *Tree) expectOneOf(expected1, expected2 itemType, context string) item</a>

```
searchKey: parse.Tree.expectOneOf
tags: [private]
```

```Go
func (t *Tree) expectOneOf(expected1, expected2 itemType, context string) item
```

expectOneOf consumes the next token and guarantees it has one of the required types. 

#### <a id="Tree.unexpected" href="#Tree.unexpected">func (t *Tree) unexpected(token item, context string)</a>

```
searchKey: parse.Tree.unexpected
tags: [private]
```

```Go
func (t *Tree) unexpected(token item, context string)
```

unexpected complains about the token and terminates processing. 

#### <a id="Tree.recover" href="#Tree.recover">func (t *Tree) recover(errp *error)</a>

```
searchKey: parse.Tree.recover
tags: [private]
```

```Go
func (t *Tree) recover(errp *error)
```

recover is the handler that turns panics into returns from the top level of Parse. 

#### <a id="Tree.startParse" href="#Tree.startParse">func (t *Tree) startParse(funcs []map[string]interface{}, lex *lexer, treeSet map[string]*Tree)</a>

```
searchKey: parse.Tree.startParse
tags: [private]
```

```Go
func (t *Tree) startParse(funcs []map[string]interface{}, lex *lexer, treeSet map[string]*Tree)
```

startParse initializes the parser, using the lexer. 

#### <a id="Tree.stopParse" href="#Tree.stopParse">func (t *Tree) stopParse()</a>

```
searchKey: parse.Tree.stopParse
tags: [private]
```

```Go
func (t *Tree) stopParse()
```

stopParse terminates parsing. 

#### <a id="Tree.Parse" href="#Tree.Parse">func (t *Tree) Parse(text, leftDelim, rightDelim string, treeSet map[string]*Tree, funcs ...map[string]interface{}) (tree *Tree, err error)</a>

```
searchKey: parse.Tree.Parse
```

```Go
func (t *Tree) Parse(text, leftDelim, rightDelim string, treeSet map[string]*Tree, funcs ...map[string]interface{}) (tree *Tree, err error)
```

Parse parses the template definition string to construct a representation of the template for execution. If either action delimiter string is empty, the default ("{{" or "}}") is used. Embedded template definitions are added to the treeSet map. 

#### <a id="Tree.add" href="#Tree.add">func (t *Tree) add()</a>

```
searchKey: parse.Tree.add
tags: [private]
```

```Go
func (t *Tree) add()
```

add adds tree to t.treeSet. 

#### <a id="Tree.parse" href="#Tree.parse">func (t *Tree) parse()</a>

```
searchKey: parse.Tree.parse
tags: [private]
```

```Go
func (t *Tree) parse()
```

parse is the top-level parser for a template, essentially the same as itemList except it also parses {{define}} actions. It runs to EOF. 

#### <a id="Tree.parseDefinition" href="#Tree.parseDefinition">func (t *Tree) parseDefinition()</a>

```
searchKey: parse.Tree.parseDefinition
tags: [private]
```

```Go
func (t *Tree) parseDefinition()
```

parseDefinition parses a {{define}} ...  {{end}} template definition and installs the definition in t.treeSet. The "define" keyword has already been scanned. 

#### <a id="Tree.itemList" href="#Tree.itemList">func (t *Tree) itemList() (list *ListNode, next Node)</a>

```
searchKey: parse.Tree.itemList
tags: [private]
```

```Go
func (t *Tree) itemList() (list *ListNode, next Node)
```

itemList: 

```
textOrAction*

```
Terminates at {{end}} or {{else}}, returned separately. 

#### <a id="Tree.textOrAction" href="#Tree.textOrAction">func (t *Tree) textOrAction() Node</a>

```
searchKey: parse.Tree.textOrAction
tags: [private]
```

```Go
func (t *Tree) textOrAction() Node
```

textOrAction: 

```
text | comment | action

```
#### <a id="Tree.clearActionLine" href="#Tree.clearActionLine">func (t *Tree) clearActionLine()</a>

```
searchKey: parse.Tree.clearActionLine
tags: [private]
```

```Go
func (t *Tree) clearActionLine()
```

#### <a id="Tree.action" href="#Tree.action">func (t *Tree) action() (n Node)</a>

```
searchKey: parse.Tree.action
tags: [private]
```

```Go
func (t *Tree) action() (n Node)
```

Action: 

```
control
command ("|" command)*

```
Left delim is past. Now get actions. First word could be a keyword such as range. 

#### <a id="Tree.pipeline" href="#Tree.pipeline">func (t *Tree) pipeline(context string, end itemType) (pipe *PipeNode)</a>

```
searchKey: parse.Tree.pipeline
tags: [private]
```

```Go
func (t *Tree) pipeline(context string, end itemType) (pipe *PipeNode)
```

Pipeline: 

```
declarations? command ('|' command)*

```
#### <a id="Tree.checkPipeline" href="#Tree.checkPipeline">func (t *Tree) checkPipeline(pipe *PipeNode, context string)</a>

```
searchKey: parse.Tree.checkPipeline
tags: [private]
```

```Go
func (t *Tree) checkPipeline(pipe *PipeNode, context string)
```

#### <a id="Tree.parseControl" href="#Tree.parseControl">func (t *Tree) parseControl(allowElseIf bool, context string) (pos Pos, line int, pipe *PipeNode, list, elseList *ListNode)</a>

```
searchKey: parse.Tree.parseControl
tags: [private]
```

```Go
func (t *Tree) parseControl(allowElseIf bool, context string) (pos Pos, line int, pipe *PipeNode, list, elseList *ListNode)
```

#### <a id="Tree.ifControl" href="#Tree.ifControl">func (t *Tree) ifControl() Node</a>

```
searchKey: parse.Tree.ifControl
tags: [private]
```

```Go
func (t *Tree) ifControl() Node
```

If: 

```
{{if pipeline}} itemList {{end}}
{{if pipeline}} itemList {{else}} itemList {{end}}

```
If keyword is past. 

#### <a id="Tree.rangeControl" href="#Tree.rangeControl">func (t *Tree) rangeControl() Node</a>

```
searchKey: parse.Tree.rangeControl
tags: [private]
```

```Go
func (t *Tree) rangeControl() Node
```

Range: 

```
{{range pipeline}} itemList {{end}}
{{range pipeline}} itemList {{else}} itemList {{end}}

```
Range keyword is past. 

#### <a id="Tree.withControl" href="#Tree.withControl">func (t *Tree) withControl() Node</a>

```
searchKey: parse.Tree.withControl
tags: [private]
```

```Go
func (t *Tree) withControl() Node
```

With: 

```
{{with pipeline}} itemList {{end}}
{{with pipeline}} itemList {{else}} itemList {{end}}

```
If keyword is past. 

#### <a id="Tree.endControl" href="#Tree.endControl">func (t *Tree) endControl() Node</a>

```
searchKey: parse.Tree.endControl
tags: [private]
```

```Go
func (t *Tree) endControl() Node
```

End: 

```
{{end}}

```
End keyword is past. 

#### <a id="Tree.elseControl" href="#Tree.elseControl">func (t *Tree) elseControl() Node</a>

```
searchKey: parse.Tree.elseControl
tags: [private]
```

```Go
func (t *Tree) elseControl() Node
```

Else: 

```
{{else}}

```
Else keyword is past. 

#### <a id="Tree.blockControl" href="#Tree.blockControl">func (t *Tree) blockControl() Node</a>

```
searchKey: parse.Tree.blockControl
tags: [private]
```

```Go
func (t *Tree) blockControl() Node
```

Block: 

```
{{block stringValue pipeline}}

```
Block keyword is past. The name must be something that can evaluate to a string. The pipeline is mandatory. 

#### <a id="Tree.templateControl" href="#Tree.templateControl">func (t *Tree) templateControl() Node</a>

```
searchKey: parse.Tree.templateControl
tags: [private]
```

```Go
func (t *Tree) templateControl() Node
```

Template: 

```
{{template stringValue pipeline}}

```
Template keyword is past. The name must be something that can evaluate to a string. 

#### <a id="Tree.parseTemplateName" href="#Tree.parseTemplateName">func (t *Tree) parseTemplateName(token item, context string) (name string)</a>

```
searchKey: parse.Tree.parseTemplateName
tags: [private]
```

```Go
func (t *Tree) parseTemplateName(token item, context string) (name string)
```

#### <a id="Tree.command" href="#Tree.command">func (t *Tree) command() *CommandNode</a>

```
searchKey: parse.Tree.command
tags: [private]
```

```Go
func (t *Tree) command() *CommandNode
```

command: 

```
operand (space operand)*

```
space-separated arguments up to a pipeline character or right delimiter. we consume the pipe character but leave the right delim to terminate the action. 

#### <a id="Tree.operand" href="#Tree.operand">func (t *Tree) operand() Node</a>

```
searchKey: parse.Tree.operand
tags: [private]
```

```Go
func (t *Tree) operand() Node
```

operand: 

```
term .Field*

```
An operand is a space-separated component of a command, a term possibly followed by field accesses. A nil return means the next item is not an operand. 

#### <a id="Tree.term" href="#Tree.term">func (t *Tree) term() Node</a>

```
searchKey: parse.Tree.term
tags: [private]
```

```Go
func (t *Tree) term() Node
```

term: 

```
literal (number, string, nil, boolean)
function (identifier)
.
.Field
$
'(' pipeline ')'

```
A term is a simple "expression". A nil return means the next item is not a term. 

#### <a id="Tree.hasFunction" href="#Tree.hasFunction">func (t *Tree) hasFunction(name string) bool</a>

```
searchKey: parse.Tree.hasFunction
tags: [private]
```

```Go
func (t *Tree) hasFunction(name string) bool
```

hasFunction reports if a function name exists in the Tree's maps. 

#### <a id="Tree.popVars" href="#Tree.popVars">func (t *Tree) popVars(n int)</a>

```
searchKey: parse.Tree.popVars
tags: [private]
```

```Go
func (t *Tree) popVars(n int)
```

popVars trims the variable list to the specified length 

#### <a id="Tree.useVar" href="#Tree.useVar">func (t *Tree) useVar(pos Pos, name string) Node</a>

```
searchKey: parse.Tree.useVar
tags: [private]
```

```Go
func (t *Tree) useVar(pos Pos, name string) Node
```

useVar returns a node for a variable reference. It errors if the variable is not defined. 

#### <a id="Tree.parseLexer" href="#Tree.parseLexer">func (t *Tree) parseLexer(lex *lexer) (tree *Tree, err error)</a>

```
searchKey: parse.Tree.parseLexer
tags: [private]
```

```Go
func (t *Tree) parseLexer(lex *lexer) (tree *Tree, err error)
```

parseLexer is a local version of parse that lets us pass in the lexer instead of building it. We expect an error, so the tree set and funcs list are explicitly nil. 

### <a id="Mode" href="#Mode">type Mode uint</a>

```
searchKey: parse.Mode
```

```Go
type Mode uint
```

A mode value is a set of flags (or 0). Modes control parser behavior. 

### <a id="lexTest" href="#lexTest">type lexTest struct</a>

```
searchKey: parse.lexTest
tags: [private]
```

```Go
type lexTest struct {
	name  string
	input string
	items []item
}
```

### <a id="numberTest" href="#numberTest">type numberTest struct</a>

```
searchKey: parse.numberTest
tags: [private]
```

```Go
type numberTest struct {
	text      string
	isInt     bool
	isUint    bool
	isFloat   bool
	isComplex bool
	int64
	uint64
	float64
	complex128
}
```

### <a id="parseTest" href="#parseTest">type parseTest struct</a>

```
searchKey: parse.parseTest
tags: [private]
```

```Go
type parseTest struct {
	name   string
	input  string
	ok     bool
	result string // what the user would see in an error message.
}
```

### <a id="isEmptyTest" href="#isEmptyTest">type isEmptyTest struct</a>

```
searchKey: parse.isEmptyTest
tags: [private]
```

```Go
type isEmptyTest struct {
	name  string
	input string
	empty bool
}
```

## <a id="func" href="#func">Functions</a>

### <a id="isSpace" href="#isSpace">func isSpace(r rune) bool</a>

```
searchKey: parse.isSpace
tags: [private]
```

```Go
func isSpace(r rune) bool
```

isSpace reports whether r is a space character. 

### <a id="isAlphaNumeric" href="#isAlphaNumeric">func isAlphaNumeric(r rune) bool</a>

```
searchKey: parse.isAlphaNumeric
tags: [private]
```

```Go
func isAlphaNumeric(r rune) bool
```

isAlphaNumeric reports whether r is an alphabetic, digit, or underscore. 

### <a id="hasLeftTrimMarker" href="#hasLeftTrimMarker">func hasLeftTrimMarker(s string) bool</a>

```
searchKey: parse.hasLeftTrimMarker
tags: [private]
```

```Go
func hasLeftTrimMarker(s string) bool
```

### <a id="hasRightTrimMarker" href="#hasRightTrimMarker">func hasRightTrimMarker(s string) bool</a>

```
searchKey: parse.hasRightTrimMarker
tags: [private]
```

```Go
func hasRightTrimMarker(s string) bool
```

### <a id="Parse" href="#Parse">func Parse(name, text, leftDelim, rightDelim string, funcs ...map[string]interface{}) (map[string]*Tree, error)</a>

```
searchKey: parse.Parse
```

```Go
func Parse(name, text, leftDelim, rightDelim string, funcs ...map[string]interface{}) (map[string]*Tree, error)
```

Parse returns a map from template name to parse.Tree, created by parsing the templates described in the argument string. The top-level template will be given the specified name. If an error is encountered, parsing stops and an empty map is returned with the error. 

### <a id="IsEmptyTree" href="#IsEmptyTree">func IsEmptyTree(n Node) bool</a>

```
searchKey: parse.IsEmptyTree
```

```Go
func IsEmptyTree(n Node) bool
```

IsEmptyTree reports whether this tree (node) is empty of everything but space or comments. 

### <a id="collect" href="#collect">func collect(t *lexTest, left, right string) (items []item)</a>

```
searchKey: parse.collect
tags: [private]
```

```Go
func collect(t *lexTest, left, right string) (items []item)
```

collect gathers the emitted items into a slice. 

### <a id="equal" href="#equal">func equal(i1, i2 []item, checkPos bool) bool</a>

```
searchKey: parse.equal
tags: [private]
```

```Go
func equal(i1, i2 []item, checkPos bool) bool
```

### <a id="TestLex" href="#TestLex">func TestLex(t *testing.T)</a>

```
searchKey: parse.TestLex
tags: [private]
```

```Go
func TestLex(t *testing.T)
```

### <a id="TestDelims" href="#TestDelims">func TestDelims(t *testing.T)</a>

```
searchKey: parse.TestDelims
tags: [private]
```

```Go
func TestDelims(t *testing.T)
```

### <a id="TestPos" href="#TestPos">func TestPos(t *testing.T)</a>

```
searchKey: parse.TestPos
tags: [private]
```

```Go
func TestPos(t *testing.T)
```

The other tests don't check position, to make the test cases easier to construct. This one does. 

### <a id="TestShutdown" href="#TestShutdown">func TestShutdown(t *testing.T)</a>

```
searchKey: parse.TestShutdown
tags: [private]
```

```Go
func TestShutdown(t *testing.T)
```

Test that an error shuts down the lexing goroutine. 

### <a id="TestNumberParse" href="#TestNumberParse">func TestNumberParse(t *testing.T)</a>

```
searchKey: parse.TestNumberParse
tags: [private]
```

```Go
func TestNumberParse(t *testing.T)
```

### <a id="testParse" href="#testParse">func testParse(doCopy bool, t *testing.T)</a>

```
searchKey: parse.testParse
tags: [private]
```

```Go
func testParse(doCopy bool, t *testing.T)
```

### <a id="TestParse" href="#TestParse">func TestParse(t *testing.T)</a>

```
searchKey: parse.TestParse
tags: [private]
```

```Go
func TestParse(t *testing.T)
```

### <a id="TestParseCopy" href="#TestParseCopy">func TestParseCopy(t *testing.T)</a>

```
searchKey: parse.TestParseCopy
tags: [private]
```

```Go
func TestParseCopy(t *testing.T)
```

Same as TestParse, but we copy the node first 

### <a id="TestParseWithComments" href="#TestParseWithComments">func TestParseWithComments(t *testing.T)</a>

```
searchKey: parse.TestParseWithComments
tags: [private]
```

```Go
func TestParseWithComments(t *testing.T)
```

### <a id="TestSkipFuncCheck" href="#TestSkipFuncCheck">func TestSkipFuncCheck(t *testing.T)</a>

```
searchKey: parse.TestSkipFuncCheck
tags: [private]
```

```Go
func TestSkipFuncCheck(t *testing.T)
```

### <a id="TestIsEmpty" href="#TestIsEmpty">func TestIsEmpty(t *testing.T)</a>

```
searchKey: parse.TestIsEmpty
tags: [private]
```

```Go
func TestIsEmpty(t *testing.T)
```

### <a id="TestErrorContextWithTreeCopy" href="#TestErrorContextWithTreeCopy">func TestErrorContextWithTreeCopy(t *testing.T)</a>

```
searchKey: parse.TestErrorContextWithTreeCopy
tags: [private]
```

```Go
func TestErrorContextWithTreeCopy(t *testing.T)
```

### <a id="TestErrors" href="#TestErrors">func TestErrors(t *testing.T)</a>

```
searchKey: parse.TestErrors
tags: [private]
```

```Go
func TestErrors(t *testing.T)
```

### <a id="TestBlock" href="#TestBlock">func TestBlock(t *testing.T)</a>

```
searchKey: parse.TestBlock
tags: [private]
```

```Go
func TestBlock(t *testing.T)
```

### <a id="TestLineNum" href="#TestLineNum">func TestLineNum(t *testing.T)</a>

```
searchKey: parse.TestLineNum
tags: [private]
```

```Go
func TestLineNum(t *testing.T)
```

### <a id="BenchmarkParseLarge" href="#BenchmarkParseLarge">func BenchmarkParseLarge(b *testing.B)</a>

```
searchKey: parse.BenchmarkParseLarge
tags: [private]
```

```Go
func BenchmarkParseLarge(b *testing.B)
```

### <a id="BenchmarkVariableString" href="#BenchmarkVariableString">func BenchmarkVariableString(b *testing.B)</a>

```
searchKey: parse.BenchmarkVariableString
tags: [private]
```

```Go
func BenchmarkVariableString(b *testing.B)
```

### <a id="BenchmarkListString" href="#BenchmarkListString">func BenchmarkListString(b *testing.B)</a>

```
searchKey: parse.BenchmarkListString
tags: [private]
```

```Go
func BenchmarkListString(b *testing.B)
```

