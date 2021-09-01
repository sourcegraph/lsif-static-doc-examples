# Package regexp

Package regexp implements regular expression search. 

The syntax of the regular expressions accepted is the same general syntax used by Perl, Python, and other languages. More precisely, it is the syntax accepted by RE2 and described at [https://golang.org/s/re2syntax](https://golang.org/s/re2syntax), except for \C. For an overview of the syntax, run 

```
go doc regexp/syntax

```
The regexp implementation provided by this package is guaranteed to run in time linear in the size of the input. (This is a property not guaranteed by most open source implementations of regular expressions.) For more information about this property, see 

```
[https://swtch.com/~rsc/regexp/regexp1.html](https://swtch.com/~rsc/regexp/regexp1.html)

```
or any book about automata theory. 

All characters are UTF-8-encoded code points. 

There are 16 methods of Regexp that match a regular expression and identify the matched text. Their names are matched by this regular expression: 

```
Find(All)?(String)?(Submatch)?(Index)?

```
If 'All' is present, the routine matches successive non-overlapping matches of the entire expression. Empty matches abutting a preceding match are ignored. The return value is a slice containing the successive return values of the corresponding non-'All' routine. These routines take an extra integer argument, n. If n >= 0, the function returns at most n matches/submatches; otherwise, it returns all of them. 

If 'String' is present, the argument is a string; otherwise it is a slice of bytes; return values are adjusted as appropriate. 

If 'Submatch' is present, the return value is a slice identifying the successive submatches of the expression. Submatches are matches of parenthesized subexpressions (also known as capturing groups) within the regular expression, numbered from left to right in order of opening parenthesis. Submatch 0 is the match of the entire expression, submatch 1 the match of the first parenthesized subexpression, and so on. 

If 'Index' is present, matches and submatches are identified by byte index pairs within the input string: result[2*n:2*n+1] identifies the indexes of the nth submatch. The pair for n==0 identifies the match of the entire expression. If 'Index' is not present, the match is identified by the text of the match/submatch. If an index is negative or text is nil, it means that subexpression did not match any string in the input. For 'String' versions an empty string means either no match or an empty match. 

There is also a subset of the methods that can be applied to text read from a RuneReader: 

```
MatchReader, FindReaderIndex, FindReaderSubmatchIndex

```
This set may grow. Note that regular expression matches may need to examine text beyond the text returned by a match, so the methods that match text from a RuneReader may read arbitrarily far into the input before returning. 

(There are a few other methods that do not match this pattern.) 

## Index

* Subpages
  * [regexp/syntax](regexp/syntax.md)
* [Constants](#const)
    * [const endOfText](#endOfText)
    * [const maxBacktrackProg](#maxBacktrackProg)
    * [const maxBacktrackVector](#maxBacktrackVector)
    * [const mergeFailed](#mergeFailed)
    * [const startSize](#startSize)
    * [const visitedBits](#visitedBits)
* [Variables](#var)
    * [var anyRune](#anyRune)
    * [var anyRuneNotNL](#anyRuneNotNL)
    * [var arrayNoInts](#arrayNoInts)
    * [var badRe](#badRe)
    * [var benchData](#benchData)
    * [var benchSizes](#benchSizes)
    * [var bitStatePool](#bitStatePool)
    * [var compileBenchData](#compileBenchData)
    * [var emptySubexpIndices](#emptySubexpIndices)
    * [var findTests](#findTests)
    * [var goodRe](#goodRe)
    * [var literalPrefixTests](#literalPrefixTests)
    * [var match](#match)
    * [var matchPool](#matchPool)
    * [var matchSize](#matchSize)
    * [var metaTests](#metaTests)
    * [var minInputLenTests](#minInputLenTests)
    * [var noNext](#noNext)
    * [var noRune](#noRune)
    * [var notab](#notab)
    * [var onePassPool](#onePassPool)
    * [var onePassTests](#onePassTests)
    * [var onePassTests1](#onePassTests1)
    * [var replaceFuncTests](#replaceFuncTests)
    * [var replaceLiteralTests](#replaceLiteralTests)
    * [var replaceTests](#replaceTests)
    * [var run](#run)
    * [var runeMergeTests](#runeMergeTests)
    * [var sink](#sink)
    * [var specialBytes](#specialBytes)
    * [var splitTests](#splitTests)
    * [var subexpCases](#subexpCases)
    * [var text](#text)
* [Types](#type)
    * [type FindTest struct](#FindTest)
        * [func (t FindTest) String() string](#FindTest.String)
    * [type MetaTest struct](#MetaTest)
    * [type Regexp struct](#Regexp)
        * [func Compile(expr string) (*Regexp, error)](#Compile)
        * [func CompilePOSIX(expr string) (*Regexp, error)](#CompilePOSIX)
        * [func MustCompile(str string) *Regexp](#MustCompile)
        * [func MustCompilePOSIX(str string) *Regexp](#MustCompilePOSIX)
        * [func compile(expr string, mode syntax.Flags, longest bool) (*Regexp, error)](#compile)
        * [func compileTest(t *testing.T, expr string, error string) *Regexp](#compileTest)
        * [func tryCompile(s string) (re *Regexp, err error)](#tryCompile)
        * [func (re *Regexp) Copy() *Regexp](#Regexp.Copy)
        * [func (re *Regexp) Expand(dst []byte, template []byte, src []byte, match []int) []byte](#Regexp.Expand)
        * [func (re *Regexp) ExpandString(dst []byte, template string, src string, match []int) []byte](#Regexp.ExpandString)
        * [func (re *Regexp) Find(b []byte) []byte](#Regexp.Find)
        * [func (re *Regexp) FindAll(b []byte, n int) [][]byte](#Regexp.FindAll)
        * [func (re *Regexp) FindAllIndex(b []byte, n int) [][]int](#Regexp.FindAllIndex)
        * [func (re *Regexp) FindAllString(s string, n int) []string](#Regexp.FindAllString)
        * [func (re *Regexp) FindAllStringIndex(s string, n int) [][]int](#Regexp.FindAllStringIndex)
        * [func (re *Regexp) FindAllStringSubmatch(s string, n int) [][]string](#Regexp.FindAllStringSubmatch)
        * [func (re *Regexp) FindAllStringSubmatchIndex(s string, n int) [][]int](#Regexp.FindAllStringSubmatchIndex)
        * [func (re *Regexp) FindAllSubmatch(b []byte, n int) [][][]byte](#Regexp.FindAllSubmatch)
        * [func (re *Regexp) FindAllSubmatchIndex(b []byte, n int) [][]int](#Regexp.FindAllSubmatchIndex)
        * [func (re *Regexp) FindIndex(b []byte) (loc []int)](#Regexp.FindIndex)
        * [func (re *Regexp) FindReaderIndex(r io.RuneReader) (loc []int)](#Regexp.FindReaderIndex)
        * [func (re *Regexp) FindReaderSubmatchIndex(r io.RuneReader) []int](#Regexp.FindReaderSubmatchIndex)
        * [func (re *Regexp) FindString(s string) string](#Regexp.FindString)
        * [func (re *Regexp) FindStringIndex(s string) (loc []int)](#Regexp.FindStringIndex)
        * [func (re *Regexp) FindStringSubmatch(s string) []string](#Regexp.FindStringSubmatch)
        * [func (re *Regexp) FindStringSubmatchIndex(s string) []int](#Regexp.FindStringSubmatchIndex)
        * [func (re *Regexp) FindSubmatch(b []byte) [][]byte](#Regexp.FindSubmatch)
        * [func (re *Regexp) FindSubmatchIndex(b []byte) []int](#Regexp.FindSubmatchIndex)
        * [func (re *Regexp) LiteralPrefix() (prefix string, complete bool)](#Regexp.LiteralPrefix)
        * [func (re *Regexp) Longest()](#Regexp.Longest)
        * [func (re *Regexp) Match(b []byte) bool](#Regexp.Match)
        * [func (re *Regexp) MatchReader(r io.RuneReader) bool](#Regexp.MatchReader)
        * [func (re *Regexp) MatchString(s string) bool](#Regexp.MatchString)
        * [func (re *Regexp) NumSubexp() int](#Regexp.NumSubexp)
        * [func (re *Regexp) ReplaceAll(src, repl []byte) []byte](#Regexp.ReplaceAll)
        * [func (re *Regexp) ReplaceAllFunc(src []byte, repl func([]byte) []byte) []byte](#Regexp.ReplaceAllFunc)
        * [func (re *Regexp) ReplaceAllLiteral(src, repl []byte) []byte](#Regexp.ReplaceAllLiteral)
        * [func (re *Regexp) ReplaceAllLiteralString(src, repl string) string](#Regexp.ReplaceAllLiteralString)
        * [func (re *Regexp) ReplaceAllString(src, repl string) string](#Regexp.ReplaceAllString)
        * [func (re *Regexp) ReplaceAllStringFunc(src string, repl func(string) string) string](#Regexp.ReplaceAllStringFunc)
        * [func (re *Regexp) Split(s string, n int) []string](#Regexp.Split)
        * [func (re *Regexp) String() string](#Regexp.String)
        * [func (re *Regexp) SubexpIndex(name string) int](#Regexp.SubexpIndex)
        * [func (re *Regexp) SubexpNames() []string](#Regexp.SubexpNames)
        * [func (re *Regexp) allMatches(s string, b []byte, n int, deliver func([]int))](#Regexp.allMatches)
        * [func (re *Regexp) backtrack(ib []byte, is string, pos int, ncap int, dstCap []int) []int](#Regexp.backtrack)
        * [func (re *Regexp) doExecute(r io.RuneReader, b []byte, s string, pos int, ncap int, dstCap []int) []int](#Regexp.doExecute)
        * [func (re *Regexp) doMatch(r io.RuneReader, b []byte, s string) bool](#Regexp.doMatch)
        * [func (re *Regexp) doOnePass(ir io.RuneReader, ib []byte, is string, pos, ncap int, dstCap []int) []int](#Regexp.doOnePass)
        * [func (re *Regexp) expand(dst []byte, template string, bsrc []byte, src string, match []int) []byte](#Regexp.expand)
        * [func (re *Regexp) get() *machine](#Regexp.get)
        * [func (re *Regexp) pad(a []int) []int](#Regexp.pad)
        * [func (re *Regexp) put(m *machine)](#Regexp.put)
        * [func (re *Regexp) replaceAll(bsrc []byte, src string, nmatch int, repl func(dst []byte, m []int) []byte) []byte](#Regexp.replaceAll)
        * [func (re *Regexp) tryBacktrack(b *bitState, i input, pc uint32, pos int) bool](#Regexp.tryBacktrack)
    * [type ReplaceFuncTest struct](#ReplaceFuncTest)
    * [type ReplaceTest struct](#ReplaceTest)
    * [type bitState struct](#bitState)
        * [func newBitState() *bitState](#newBitState)
        * [func (b *bitState) push(re *Regexp, pc uint32, pos int, arg bool)](#bitState.push)
        * [func (b *bitState) reset(prog *syntax.Prog, end int, ncap int)](#bitState.reset)
        * [func (b *bitState) shouldVisit(pc uint32, pos int) bool](#bitState.shouldVisit)
    * [type entry struct](#entry)
    * [type input interface](#input)
    * [type inputBytes struct](#inputBytes)
        * [func (i *inputBytes) canCheckPrefix() bool](#inputBytes.canCheckPrefix)
        * [func (i *inputBytes) context(pos int) lazyFlag](#inputBytes.context)
        * [func (i *inputBytes) hasPrefix(re *Regexp) bool](#inputBytes.hasPrefix)
        * [func (i *inputBytes) index(re *Regexp, pos int) int](#inputBytes.index)
        * [func (i *inputBytes) step(pos int) (rune, int)](#inputBytes.step)
    * [type inputReader struct](#inputReader)
        * [func (i *inputReader) canCheckPrefix() bool](#inputReader.canCheckPrefix)
        * [func (i *inputReader) context(pos int) lazyFlag](#inputReader.context)
        * [func (i *inputReader) hasPrefix(re *Regexp) bool](#inputReader.hasPrefix)
        * [func (i *inputReader) index(re *Regexp, pos int) int](#inputReader.index)
        * [func (i *inputReader) step(pos int) (rune, int)](#inputReader.step)
    * [type inputString struct](#inputString)
        * [func (i *inputString) canCheckPrefix() bool](#inputString.canCheckPrefix)
        * [func (i *inputString) context(pos int) lazyFlag](#inputString.context)
        * [func (i *inputString) hasPrefix(re *Regexp) bool](#inputString.hasPrefix)
        * [func (i *inputString) index(re *Regexp, pos int) int](#inputString.index)
        * [func (i *inputString) step(pos int) (rune, int)](#inputString.step)
    * [type inputs struct](#inputs)
        * [func (i *inputs) clear()](#inputs.clear)
        * [func (i *inputs) init(r io.RuneReader, b []byte, s string) (input, int)](#inputs.init.exec.go)
        * [func (i *inputs) newBytes(b []byte) input](#inputs.newBytes)
        * [func (i *inputs) newReader(r io.RuneReader) input](#inputs.newReader)
        * [func (i *inputs) newString(s string) input](#inputs.newString)
    * [type job struct](#job)
    * [type lazyFlag uint64](#lazyFlag)
        * [func newLazyFlag(r1, r2 rune) lazyFlag](#newLazyFlag)
        * [func (f lazyFlag) match(op syntax.EmptyOp) bool](#lazyFlag.match)
    * [type machine struct](#machine)
        * [func (m *machine) add(q *queue, pc uint32, pos int, cap []int, cond *lazyFlag, t *thread) *thread](#machine.add)
        * [func (m *machine) alloc(i *syntax.Inst) *thread](#machine.alloc)
        * [func (m *machine) clear(q *queue)](#machine.clear)
        * [func (m *machine) init(ncap int)](#machine.init.exec.go.0xc05e1c7510)
        * [func (m *machine) match(i input, pos int) bool](#machine.match)
        * [func (m *machine) step(runq, nextq *queue, pos, nextPos int, c rune, nextCond *lazyFlag)](#machine.step)
    * [type onePassInst struct](#onePassInst)
    * [type onePassMachine struct](#onePassMachine)
        * [func newOnePassMachine() *onePassMachine](#newOnePassMachine)
    * [type onePassProg struct](#onePassProg)
        * [func compileOnePass(prog *syntax.Prog) (p *onePassProg)](#compileOnePass)
        * [func makeOnePass(p *onePassProg) *onePassProg](#makeOnePass)
        * [func onePassCopy(prog *syntax.Prog) *onePassProg](#onePassCopy)
    * [type queue struct](#queue)
    * [type queueOnePass struct](#queueOnePass)
        * [func newQueue(size int) (q *queueOnePass)](#newQueue)
        * [func (q *queueOnePass) clear()](#queueOnePass.clear)
        * [func (q *queueOnePass) contains(u uint32) bool](#queueOnePass.contains)
        * [func (q *queueOnePass) empty() bool](#queueOnePass.empty)
        * [func (q *queueOnePass) insert(u uint32)](#queueOnePass.insert)
        * [func (q *queueOnePass) insertNew(u uint32)](#queueOnePass.insertNew)
        * [func (q *queueOnePass) next() (n uint32)](#queueOnePass.next)
    * [type runeSlice []rune](#runeSlice)
        * [func (p runeSlice) Len() int](#runeSlice.Len)
        * [func (p runeSlice) Less(i, j int) bool](#runeSlice.Less)
        * [func (p runeSlice) Swap(i, j int)](#runeSlice.Swap)
    * [type stringError struct](#stringError)
    * [type subexpCase struct](#subexpCase)
    * [type subexpIndex struct](#subexpIndex)
    * [type thread struct](#thread)
* [Functions](#func)
    * [func BenchmarkAnchoredLiteralLongNonMatch(b *testing.B)](#BenchmarkAnchoredLiteralLongNonMatch)
    * [func BenchmarkAnchoredLiteralShortNonMatch(b *testing.B)](#BenchmarkAnchoredLiteralShortNonMatch)
    * [func BenchmarkAnchoredLongMatch(b *testing.B)](#BenchmarkAnchoredLongMatch)
    * [func BenchmarkAnchoredShortMatch(b *testing.B)](#BenchmarkAnchoredShortMatch)
    * [func BenchmarkCompile(b *testing.B)](#BenchmarkCompile)
    * [func BenchmarkFind(b *testing.B)](#BenchmarkFind)
    * [func BenchmarkFindAllNoMatches(b *testing.B)](#BenchmarkFindAllNoMatches)
    * [func BenchmarkFindString(b *testing.B)](#BenchmarkFindString)
    * [func BenchmarkFindStringSubmatch(b *testing.B)](#BenchmarkFindStringSubmatch)
    * [func BenchmarkFindSubmatch(b *testing.B)](#BenchmarkFindSubmatch)
    * [func BenchmarkLiteral(b *testing.B)](#BenchmarkLiteral)
    * [func BenchmarkMatch(b *testing.B)](#BenchmarkMatch)
    * [func BenchmarkMatchClass(b *testing.B)](#BenchmarkMatchClass)
    * [func BenchmarkMatchClass_InRange(b *testing.B)](#BenchmarkMatchClass_InRange)
    * [func BenchmarkMatchParallelCopied(b *testing.B)](#BenchmarkMatchParallelCopied)
    * [func BenchmarkMatchParallelShared(b *testing.B)](#BenchmarkMatchParallelShared)
    * [func BenchmarkMatch_onepass_regex(b *testing.B)](#BenchmarkMatch_onepass_regex)
    * [func BenchmarkNotLiteral(b *testing.B)](#BenchmarkNotLiteral)
    * [func BenchmarkNotOnePassShortA(b *testing.B)](#BenchmarkNotOnePassShortA)
    * [func BenchmarkNotOnePassShortB(b *testing.B)](#BenchmarkNotOnePassShortB)
    * [func BenchmarkOnePassLongNotPrefix(b *testing.B)](#BenchmarkOnePassLongNotPrefix)
    * [func BenchmarkOnePassLongPrefix(b *testing.B)](#BenchmarkOnePassLongPrefix)
    * [func BenchmarkOnePassShortA(b *testing.B)](#BenchmarkOnePassShortA)
    * [func BenchmarkOnePassShortB(b *testing.B)](#BenchmarkOnePassShortB)
    * [func BenchmarkQuoteMetaAll(b *testing.B)](#BenchmarkQuoteMetaAll)
    * [func BenchmarkQuoteMetaNone(b *testing.B)](#BenchmarkQuoteMetaNone)
    * [func BenchmarkReplaceAll(b *testing.B)](#BenchmarkReplaceAll)
    * [func Match(pattern string, b []byte) (matched bool, err error)](#Match)
    * [func MatchReader(pattern string, r io.RuneReader) (matched bool, err error)](#MatchReader)
    * [func MatchString(pattern string, s string) (matched bool, err error)](#MatchString)
    * [func QuoteMeta(s string) string](#QuoteMeta)
    * [func TestBadCompile(t *testing.T)](#TestBadCompile)
    * [func TestCompileOnePass(t *testing.T)](#TestCompileOnePass)
    * [func TestCopyMatch(t *testing.T)](#TestCopyMatch)
    * [func TestDeepEqual(t *testing.T)](#TestDeepEqual)
    * [func TestFind(t *testing.T)](#TestFind)
    * [func TestFindAll(t *testing.T)](#TestFindAll)
    * [func TestFindAllIndex(t *testing.T)](#TestFindAllIndex)
    * [func TestFindAllString(t *testing.T)](#TestFindAllString)
    * [func TestFindAllStringIndex(t *testing.T)](#TestFindAllStringIndex)
    * [func TestFindAllStringSubmatch(t *testing.T)](#TestFindAllStringSubmatch)
    * [func TestFindAllStringSubmatchIndex(t *testing.T)](#TestFindAllStringSubmatchIndex)
    * [func TestFindAllSubmatch(t *testing.T)](#TestFindAllSubmatch)
    * [func TestFindAllSubmatchIndex(t *testing.T)](#TestFindAllSubmatchIndex)
    * [func TestFindIndex(t *testing.T)](#TestFindIndex)
    * [func TestFindReaderIndex(t *testing.T)](#TestFindReaderIndex)
    * [func TestFindReaderSubmatchIndex(t *testing.T)](#TestFindReaderSubmatchIndex)
    * [func TestFindString(t *testing.T)](#TestFindString)
    * [func TestFindStringIndex(t *testing.T)](#TestFindStringIndex)
    * [func TestFindStringSubmatch(t *testing.T)](#TestFindStringSubmatch)
    * [func TestFindStringSubmatchIndex(t *testing.T)](#TestFindStringSubmatchIndex)
    * [func TestFindSubmatch(t *testing.T)](#TestFindSubmatch)
    * [func TestFindSubmatchIndex(t *testing.T)](#TestFindSubmatchIndex)
    * [func TestFowler(t *testing.T)](#TestFowler)
    * [func TestGoodCompile(t *testing.T)](#TestGoodCompile)
    * [func TestLiteralPrefix(t *testing.T)](#TestLiteralPrefix)
    * [func TestLongest(t *testing.T)](#TestLongest)
    * [func TestMatch(t *testing.T)](#TestMatch)
    * [func TestMatchFunction(t *testing.T)](#TestMatchFunction)
    * [func TestMergeRuneSet(t *testing.T)](#TestMergeRuneSet)
    * [func TestMinInputLen(t *testing.T)](#TestMinInputLen)
    * [func TestOnePassCutoff(t *testing.T)](#TestOnePassCutoff)
    * [func TestParseAndCompile(t *testing.T)](#TestParseAndCompile)
    * [func TestProgramTooLongForBacktrack(t *testing.T)](#TestProgramTooLongForBacktrack)
    * [func TestQuoteMeta(t *testing.T)](#TestQuoteMeta)
    * [func TestRE2Exhaustive(t *testing.T)](#TestRE2Exhaustive)
    * [func TestRE2Search(t *testing.T)](#TestRE2Search)
    * [func TestReplaceAll(t *testing.T)](#TestReplaceAll)
    * [func TestReplaceAllFunc(t *testing.T)](#TestReplaceAllFunc)
    * [func TestReplaceAllLiteral(t *testing.T)](#TestReplaceAllLiteral)
    * [func TestRunOnePass(t *testing.T)](#TestRunOnePass)
    * [func TestSplit(t *testing.T)](#TestSplit)
    * [func TestSubexp(t *testing.T)](#TestSubexp)
    * [func TestSwitchBacktrack(t *testing.T)](#TestSwitchBacktrack)
    * [func build(n int, x ...int) [][]int](#build)
    * [func cleanupOnePass(prog *onePassProg, original *syntax.Prog)](#cleanupOnePass)
    * [func copyMatchTest(t *testing.T, test *FindTest)](#copyMatchTest)
    * [func extract(str string) (name string, num int, rest string, ok bool)](#extract)
    * [func freeBitState(b *bitState)](#freeBitState)
    * [func freeOnePassMachine(m *onePassMachine)](#freeOnePassMachine)
    * [func init()](#init.regexp.go)
    * [func iop(i *syntax.Inst) syntax.InstOp](#iop)
    * [func isSingleBytes(s string) bool](#isSingleBytes)
    * [func makeText(n int) []byte](#makeText)
    * [func matchFull(re, refull *Regexp, text string) (bool, string)](#matchFull)
    * [func matchFullLongest(re, refull *Regexp, text string) (bool, string)](#matchFullLongest)
    * [func matchFunctionTest(t *testing.T, test *FindTest)](#matchFunctionTest)
    * [func matchPartial(re, refull *Regexp, text string) (bool, string)](#matchPartial)
    * [func matchPartialLongest(re, refull *Regexp, text string) (bool, string)](#matchPartialLongest)
    * [func matchTest(t *testing.T, test *FindTest)](#matchTest)
    * [func maxBitStateLen(prog *syntax.Prog) int](#maxBitStateLen)
    * [func mergeRuneSets(leftRunes, rightRunes *[]rune, leftPC, rightPC uint32) ([]rune, []uint32)](#mergeRuneSets)
    * [func minInputLen(re *syntax.Regexp) int](#minInputLen)
    * [func onePassNext(i *onePassInst, r rune) uint32](#onePassNext)
    * [func onePassPrefix(p *syntax.Prog) (prefix string, complete bool, pc uint32)](#onePassPrefix)
    * [func parseFowlerResult(s string) (ok, compiled, matched bool, pos []int)](#parseFowlerResult)
    * [func parseResult(t *testing.T, file string, lineno int, res string) []int](#parseResult)
    * [func quote(s string) string](#quote)
    * [func runFull(re, refull *Regexp, text string) ([]int, string)](#runFull)
    * [func runFullLongest(re, refull *Regexp, text string) ([]int, string)](#runFullLongest)
    * [func runPartial(re, refull *Regexp, text string) ([]int, string)](#runPartial)
    * [func runPartialLongest(re, refull *Regexp, text string) ([]int, string)](#runPartialLongest)
    * [func same(x, y []int) bool](#same)
    * [func shouldBacktrack(prog *syntax.Prog) bool](#shouldBacktrack)
    * [func special(b byte) bool](#special)
    * [func testFindAllIndex(test *FindTest, result [][]int, t *testing.T)](#testFindAllIndex)
    * [func testFindAllSubmatchIndex(test *FindTest, result [][]int, t *testing.T)](#testFindAllSubmatchIndex)
    * [func testFindIndex(test *FindTest, result []int, t *testing.T)](#testFindIndex)
    * [func testFindSubmatchIndex(test *FindTest, result []int, t *testing.T)](#testFindSubmatchIndex)
    * [func testFowler(t *testing.T, file string)](#testFowler)
    * [func testRE2(t *testing.T, file string)](#testRE2)
    * [func testSubmatchBytes(test *FindTest, n int, submatches []int, result [][]byte, t *testing.T)](#testSubmatchBytes)
    * [func testSubmatchIndices(test *FindTest, n int, expect, result []int, t *testing.T)](#testSubmatchIndices)
    * [func testSubmatchString(test *FindTest, n int, submatches []int, result []string, t *testing.T)](#testSubmatchString)


## <a id="const" href="#const">Constants</a>

### <a id="endOfText" href="#endOfText">const endOfText</a>

```
searchKey: regexp.endOfText
tags: [constant number private]
```

```Go
const endOfText rune = -1
```

### <a id="maxBacktrackProg" href="#maxBacktrackProg">const maxBacktrackProg</a>

```
searchKey: regexp.maxBacktrackProg
tags: [constant number private]
```

```Go
const maxBacktrackProg = 500 // len(prog.Inst) <= max

```

### <a id="maxBacktrackVector" href="#maxBacktrackVector">const maxBacktrackVector</a>

```
searchKey: regexp.maxBacktrackVector
tags: [constant number private]
```

```Go
const maxBacktrackVector = 256 * 1024 // bit vector size <= max (bits)

```

### <a id="mergeFailed" href="#mergeFailed">const mergeFailed</a>

```
searchKey: regexp.mergeFailed
tags: [constant number private]
```

```Go
const mergeFailed = uint32(0xffffffff)
```

mergeRuneSets merges two non-intersecting runesets, and returns the merged result, and a NextIp array. The idea is that if a rune matches the OnePassRunes at index i, NextIp[i/2] is the target. If the input sets intersect, an empty runeset and a NextIp array with the single element mergeFailed is returned. The code assumes that both inputs contain ordered and non-intersecting rune pairs. 

### <a id="startSize" href="#startSize">const startSize</a>

```
searchKey: regexp.startSize
tags: [constant number private]
```

```Go
const startSize = 10 // The size at which to start a slice in the 'All' routines.

```

### <a id="visitedBits" href="#visitedBits">const visitedBits</a>

```
searchKey: regexp.visitedBits
tags: [constant number private]
```

```Go
const visitedBits = 32
```

## <a id="var" href="#var">Variables</a>

### <a id="anyRune" href="#anyRune">var anyRune</a>

```
searchKey: regexp.anyRune
tags: [variable array number private]
```

```Go
var anyRune = []rune{0, unicode.MaxRune}
```

### <a id="anyRuneNotNL" href="#anyRuneNotNL">var anyRuneNotNL</a>

```
searchKey: regexp.anyRuneNotNL
tags: [variable array number private]
```

```Go
var anyRuneNotNL = []rune{0, '\n' - 1, '\n' + 1, unicode.MaxRune}
```

### <a id="arrayNoInts" href="#arrayNoInts">var arrayNoInts</a>

```
searchKey: regexp.arrayNoInts
tags: [variable array number private]
```

```Go
var arrayNoInts [0]int
```

arrayNoInts is returned by doExecute match if nil dstCap is passed to it with ncap=0. 

### <a id="badRe" href="#badRe">var badRe</a>

```
searchKey: regexp.badRe
tags: [variable array struct private]
```

```Go
var badRe = ...
```

### <a id="benchData" href="#benchData">var benchData</a>

```
searchKey: regexp.benchData
tags: [variable array struct private]
```

```Go
var benchData = ...
```

### <a id="benchSizes" href="#benchSizes">var benchSizes</a>

```
searchKey: regexp.benchSizes
tags: [variable array struct private]
```

```Go
var benchSizes = ...
```

### <a id="bitStatePool" href="#bitStatePool">var bitStatePool</a>

```
searchKey: regexp.bitStatePool
tags: [variable struct private]
```

```Go
var bitStatePool sync.Pool
```

### <a id="compileBenchData" href="#compileBenchData">var compileBenchData</a>

```
searchKey: regexp.compileBenchData
tags: [variable array struct private]
```

```Go
var compileBenchData = ...
```

### <a id="emptySubexpIndices" href="#emptySubexpIndices">var emptySubexpIndices</a>

```
searchKey: regexp.emptySubexpIndices
tags: [variable array struct private]
```

```Go
var emptySubexpIndices = []subexpIndex{{"", -1}, {"missing", -1}}
```

### <a id="findTests" href="#findTests">var findTests</a>

```
searchKey: regexp.findTests
tags: [variable array struct private]
```

```Go
var findTests = ...
```

### <a id="goodRe" href="#goodRe">var goodRe</a>

```
searchKey: regexp.goodRe
tags: [variable array string private]
```

```Go
var goodRe = ...
```

### <a id="literalPrefixTests" href="#literalPrefixTests">var literalPrefixTests</a>

```
searchKey: regexp.literalPrefixTests
tags: [variable array struct private]
```

```Go
var literalPrefixTests = ...
```

### <a id="match" href="#match">var match</a>

```
searchKey: regexp.match
tags: [variable array function private]
```

```Go
var match = ...
```

### <a id="matchPool" href="#matchPool">var matchPool</a>

```
searchKey: regexp.matchPool
tags: [variable array struct private]
```

```Go
var matchPool [len(matchSize)]sync.Pool
```

Pools of *machine for use during (*Regexp).doExecute, split up by the size of the execution queues. matchPool[i] machines have queue size matchSize[i]. On a 64-bit system each queue entry is 16 bytes, so matchPool[0] has 16*2*128 = 4kB queues, etc. The final matchPool is a catch-all for very large queues. 

### <a id="matchSize" href="#matchSize">var matchSize</a>

```
searchKey: regexp.matchSize
tags: [variable array number private]
```

```Go
var matchSize = [...]int{128, 512, 2048, 16384, 0}
```

Pools of *machine for use during (*Regexp).doExecute, split up by the size of the execution queues. matchPool[i] machines have queue size matchSize[i]. On a 64-bit system each queue entry is 16 bytes, so matchPool[0] has 16*2*128 = 4kB queues, etc. The final matchPool is a catch-all for very large queues. 

### <a id="metaTests" href="#metaTests">var metaTests</a>

```
searchKey: regexp.metaTests
tags: [variable array struct private]
```

```Go
var metaTests = ...
```

### <a id="minInputLenTests" href="#minInputLenTests">var minInputLenTests</a>

```
searchKey: regexp.minInputLenTests
tags: [variable array struct private]
```

```Go
var minInputLenTests = ...
```

### <a id="noNext" href="#noNext">var noNext</a>

```
searchKey: regexp.noNext
tags: [variable array number private]
```

```Go
var noNext = []uint32{mergeFailed}
```

### <a id="noRune" href="#noRune">var noRune</a>

```
searchKey: regexp.noRune
tags: [variable array number private]
```

```Go
var noRune = []rune{}
```

### <a id="notab" href="#notab">var notab</a>

```
searchKey: regexp.notab
tags: [variable struct private]
```

```Go
var notab = MustCompilePOSIX(`[^\t]+`)
```

### <a id="onePassPool" href="#onePassPool">var onePassPool</a>

```
searchKey: regexp.onePassPool
tags: [variable struct private]
```

```Go
var onePassPool sync.Pool
```

### <a id="onePassTests" href="#onePassTests">var onePassTests</a>

```
searchKey: regexp.onePassTests
tags: [variable array struct private]
```

```Go
var onePassTests = ...
```

### <a id="onePassTests1" href="#onePassTests1">var onePassTests1</a>

```
searchKey: regexp.onePassTests1
tags: [variable array struct private]
```

```Go
var onePassTests1 = []struct {
	re    string
	match string
}{
	{`^a(/b+(#c+)*)*$`, "a/b#c"},
}
```

TODO(cespare): Unify with onePassTests and rationalize one-pass test cases. 

### <a id="replaceFuncTests" href="#replaceFuncTests">var replaceFuncTests</a>

```
searchKey: regexp.replaceFuncTests
tags: [variable array struct private]
```

```Go
var replaceFuncTests = ...
```

### <a id="replaceLiteralTests" href="#replaceLiteralTests">var replaceLiteralTests</a>

```
searchKey: regexp.replaceLiteralTests
tags: [variable array struct private]
```

```Go
var replaceLiteralTests = ...
```

### <a id="replaceTests" href="#replaceTests">var replaceTests</a>

```
searchKey: regexp.replaceTests
tags: [variable array struct private]
```

```Go
var replaceTests = ...
```

### <a id="run" href="#run">var run</a>

```
searchKey: regexp.run
tags: [variable array function private]
```

```Go
var run = ...
```

### <a id="runeMergeTests" href="#runeMergeTests">var runeMergeTests</a>

```
searchKey: regexp.runeMergeTests
tags: [variable array struct private]
```

```Go
var runeMergeTests = ...
```

### <a id="sink" href="#sink">var sink</a>

```
searchKey: regexp.sink
tags: [variable string private]
```

```Go
var sink string
```

### <a id="specialBytes" href="#specialBytes">var specialBytes</a>

```
searchKey: regexp.specialBytes
tags: [variable array number private]
```

```Go
var specialBytes [16]byte
```

Bitmap used by func special to check whether a character needs to be escaped. 

### <a id="splitTests" href="#splitTests">var splitTests</a>

```
searchKey: regexp.splitTests
tags: [variable array struct private]
```

```Go
var splitTests = ...
```

### <a id="subexpCases" href="#subexpCases">var subexpCases</a>

```
searchKey: regexp.subexpCases
tags: [variable array struct private]
```

```Go
var subexpCases = ...
```

### <a id="text" href="#text">var text</a>

```
searchKey: regexp.text
tags: [variable array number private]
```

```Go
var text []byte
```

## <a id="type" href="#type">Types</a>

### <a id="FindTest" href="#FindTest">type FindTest struct</a>

```
searchKey: regexp.FindTest
tags: [struct private]
```

```Go
type FindTest struct {
	pat     string
	text    string
	matches [][]int
}
```

For each pattern/text pair, what is the expected output of each function? We can derive the textual results from the indexed results, the non-submatch results from the submatched results, the single results from the 'all' results, and the byte results from the string results. Therefore the table includes only the FindAllStringSubmatchIndex result. 

#### <a id="FindTest.String" href="#FindTest.String">func (t FindTest) String() string</a>

```
searchKey: regexp.FindTest.String
tags: [method private]
```

```Go
func (t FindTest) String() string
```

### <a id="MetaTest" href="#MetaTest">type MetaTest struct</a>

```
searchKey: regexp.MetaTest
tags: [struct private]
```

```Go
type MetaTest struct {
	pattern, output, literal string
	isLiteral                bool
}
```

### <a id="Regexp" href="#Regexp">type Regexp struct</a>

```
searchKey: regexp.Regexp
tags: [struct]
```

```Go
type Regexp struct {
	expr           string       // as passed to Compile
	prog           *syntax.Prog // compiled program
	onepass        *onePassProg // onepass program or nil
	numSubexp      int
	maxBitStateLen int
	subexpNames    []string
	prefix         string         // required prefix in unanchored matches
	prefixBytes    []byte         // prefix, as a []byte
	prefixRune     rune           // first rune in prefix
	prefixEnd      uint32         // pc for last rune in prefix
	mpool          int            // pool for machines
	matchcap       int            // size of recorded match lengths
	prefixComplete bool           // prefix is the entire regexp
	cond           syntax.EmptyOp // empty-width conditions required at start of match
	minInputLen    int            // minimum length of the input in bytes

	// This field can be modified by the Longest method,
	// but it is otherwise read-only.
	longest bool // whether regexp prefers leftmost-longest match
}
```

Regexp is the representation of a compiled regular expression. A Regexp is safe for concurrent use by multiple goroutines, except for configuration methods, such as Longest. 

#### <a id="Compile" href="#Compile">func Compile(expr string) (*Regexp, error)</a>

```
searchKey: regexp.Compile
tags: [function]
```

```Go
func Compile(expr string) (*Regexp, error)
```

Compile parses a regular expression and returns, if successful, a Regexp object that can be used to match against text. 

When matching against text, the regexp returns a match that begins as early as possible in the input (leftmost), and among those it chooses the one that a backtracking search would have found first. This so-called leftmost-first matching is the same semantics that Perl, Python, and other implementations use, although this package implements it without the expense of backtracking. For POSIX leftmost-longest matching, see CompilePOSIX. 

#### <a id="CompilePOSIX" href="#CompilePOSIX">func CompilePOSIX(expr string) (*Regexp, error)</a>

```
searchKey: regexp.CompilePOSIX
tags: [function]
```

```Go
func CompilePOSIX(expr string) (*Regexp, error)
```

CompilePOSIX is like Compile but restricts the regular expression to POSIX ERE (egrep) syntax and changes the match semantics to leftmost-longest. 

That is, when matching against text, the regexp returns a match that begins as early as possible in the input (leftmost), and among those it chooses a match that is as long as possible. This so-called leftmost-longest matching is the same semantics that early regular expression implementations used and that POSIX specifies. 

However, there can be multiple leftmost-longest matches, with different submatch choices, and here this package diverges from POSIX. Among the possible leftmost-longest matches, this package chooses the one that a backtracking search would have found first, while POSIX specifies that the match be chosen to maximize the length of the first subexpression, then the second, and so on from left to right. The POSIX rule is computationally prohibitive and not even well-defined. See [https://swtch.com/~rsc/regexp/regexp2.html#posix](https://swtch.com/~rsc/regexp/regexp2.html#posix) for details. 

#### <a id="MustCompile" href="#MustCompile">func MustCompile(str string) *Regexp</a>

```
searchKey: regexp.MustCompile
tags: [function]
```

```Go
func MustCompile(str string) *Regexp
```

MustCompile is like Compile but panics if the expression cannot be parsed. It simplifies safe initialization of global variables holding compiled regular expressions. 

#### <a id="MustCompilePOSIX" href="#MustCompilePOSIX">func MustCompilePOSIX(str string) *Regexp</a>

```
searchKey: regexp.MustCompilePOSIX
tags: [function]
```

```Go
func MustCompilePOSIX(str string) *Regexp
```

MustCompilePOSIX is like CompilePOSIX but panics if the expression cannot be parsed. It simplifies safe initialization of global variables holding compiled regular expressions. 

#### <a id="compile" href="#compile">func compile(expr string, mode syntax.Flags, longest bool) (*Regexp, error)</a>

```
searchKey: regexp.compile
tags: [function private]
```

```Go
func compile(expr string, mode syntax.Flags, longest bool) (*Regexp, error)
```

#### <a id="compileTest" href="#compileTest">func compileTest(t *testing.T, expr string, error string) *Regexp</a>

```
searchKey: regexp.compileTest
tags: [function private]
```

```Go
func compileTest(t *testing.T, expr string, error string) *Regexp
```

#### <a id="tryCompile" href="#tryCompile">func tryCompile(s string) (re *Regexp, err error)</a>

```
searchKey: regexp.tryCompile
tags: [function private]
```

```Go
func tryCompile(s string) (re *Regexp, err error)
```

#### <a id="Regexp.Copy" href="#Regexp.Copy">func (re *Regexp) Copy() *Regexp</a>

```
searchKey: regexp.Regexp.Copy
tags: [method deprecated]
```

```Go
func (re *Regexp) Copy() *Regexp
```

Copy returns a new Regexp object copied from re. Calling Longest on one copy does not affect another. 

Deprecated: In earlier releases, when using a Regexp in multiple goroutines, giving each goroutine its own copy helped to avoid lock contention. As of Go 1.12, using Copy is no longer necessary to avoid lock contention. Copy may still be appropriate if the reason for its use is to make two copies with different Longest settings. 

#### <a id="Regexp.Expand" href="#Regexp.Expand">func (re *Regexp) Expand(dst []byte, template []byte, src []byte, match []int) []byte</a>

```
searchKey: regexp.Regexp.Expand
tags: [method]
```

```Go
func (re *Regexp) Expand(dst []byte, template []byte, src []byte, match []int) []byte
```

Expand appends template to dst and returns the result; during the append, Expand replaces variables in the template with corresponding matches drawn from src. The match slice should have been returned by FindSubmatchIndex. 

In the template, a variable is denoted by a substring of the form $name or ${name}, where name is a non-empty sequence of letters, digits, and underscores. A purely numeric name like $1 refers to the submatch with the corresponding index; other names refer to capturing parentheses named with the (?P<name>...) syntax. A reference to an out of range or unmatched index or a name that is not present in the regular expression is replaced with an empty slice. 

In the $name form, name is taken to be as long as possible: $1x is equivalent to ${1x}, not ${1}x, and, $10 is equivalent to ${10}, not ${1}0. 

To insert a literal $ in the output, use $$ in the template. 

#### <a id="Regexp.ExpandString" href="#Regexp.ExpandString">func (re *Regexp) ExpandString(dst []byte, template string, src string, match []int) []byte</a>

```
searchKey: regexp.Regexp.ExpandString
tags: [method]
```

```Go
func (re *Regexp) ExpandString(dst []byte, template string, src string, match []int) []byte
```

ExpandString is like Expand but the template and source are strings. It appends to and returns a byte slice in order to give the calling code control over allocation. 

#### <a id="Regexp.Find" href="#Regexp.Find">func (re *Regexp) Find(b []byte) []byte</a>

```
searchKey: regexp.Regexp.Find
tags: [method]
```

```Go
func (re *Regexp) Find(b []byte) []byte
```

Find returns a slice holding the text of the leftmost match in b of the regular expression. A return value of nil indicates no match. 

#### <a id="Regexp.FindAll" href="#Regexp.FindAll">func (re *Regexp) FindAll(b []byte, n int) [][]byte</a>

```
searchKey: regexp.Regexp.FindAll
tags: [method]
```

```Go
func (re *Regexp) FindAll(b []byte, n int) [][]byte
```

FindAll is the 'All' version of Find; it returns a slice of all successive matches of the expression, as defined by the 'All' description in the package comment. A return value of nil indicates no match. 

#### <a id="Regexp.FindAllIndex" href="#Regexp.FindAllIndex">func (re *Regexp) FindAllIndex(b []byte, n int) [][]int</a>

```
searchKey: regexp.Regexp.FindAllIndex
tags: [method]
```

```Go
func (re *Regexp) FindAllIndex(b []byte, n int) [][]int
```

FindAllIndex is the 'All' version of FindIndex; it returns a slice of all successive matches of the expression, as defined by the 'All' description in the package comment. A return value of nil indicates no match. 

#### <a id="Regexp.FindAllString" href="#Regexp.FindAllString">func (re *Regexp) FindAllString(s string, n int) []string</a>

```
searchKey: regexp.Regexp.FindAllString
tags: [method]
```

```Go
func (re *Regexp) FindAllString(s string, n int) []string
```

FindAllString is the 'All' version of FindString; it returns a slice of all successive matches of the expression, as defined by the 'All' description in the package comment. A return value of nil indicates no match. 

#### <a id="Regexp.FindAllStringIndex" href="#Regexp.FindAllStringIndex">func (re *Regexp) FindAllStringIndex(s string, n int) [][]int</a>

```
searchKey: regexp.Regexp.FindAllStringIndex
tags: [method]
```

```Go
func (re *Regexp) FindAllStringIndex(s string, n int) [][]int
```

FindAllStringIndex is the 'All' version of FindStringIndex; it returns a slice of all successive matches of the expression, as defined by the 'All' description in the package comment. A return value of nil indicates no match. 

#### <a id="Regexp.FindAllStringSubmatch" href="#Regexp.FindAllStringSubmatch">func (re *Regexp) FindAllStringSubmatch(s string, n int) [][]string</a>

```
searchKey: regexp.Regexp.FindAllStringSubmatch
tags: [method]
```

```Go
func (re *Regexp) FindAllStringSubmatch(s string, n int) [][]string
```

FindAllStringSubmatch is the 'All' version of FindStringSubmatch; it returns a slice of all successive matches of the expression, as defined by the 'All' description in the package comment. A return value of nil indicates no match. 

#### <a id="Regexp.FindAllStringSubmatchIndex" href="#Regexp.FindAllStringSubmatchIndex">func (re *Regexp) FindAllStringSubmatchIndex(s string, n int) [][]int</a>

```
searchKey: regexp.Regexp.FindAllStringSubmatchIndex
tags: [method]
```

```Go
func (re *Regexp) FindAllStringSubmatchIndex(s string, n int) [][]int
```

FindAllStringSubmatchIndex is the 'All' version of FindStringSubmatchIndex; it returns a slice of all successive matches of the expression, as defined by the 'All' description in the package comment. A return value of nil indicates no match. 

#### <a id="Regexp.FindAllSubmatch" href="#Regexp.FindAllSubmatch">func (re *Regexp) FindAllSubmatch(b []byte, n int) [][][]byte</a>

```
searchKey: regexp.Regexp.FindAllSubmatch
tags: [method]
```

```Go
func (re *Regexp) FindAllSubmatch(b []byte, n int) [][][]byte
```

FindAllSubmatch is the 'All' version of FindSubmatch; it returns a slice of all successive matches of the expression, as defined by the 'All' description in the package comment. A return value of nil indicates no match. 

#### <a id="Regexp.FindAllSubmatchIndex" href="#Regexp.FindAllSubmatchIndex">func (re *Regexp) FindAllSubmatchIndex(b []byte, n int) [][]int</a>

```
searchKey: regexp.Regexp.FindAllSubmatchIndex
tags: [method]
```

```Go
func (re *Regexp) FindAllSubmatchIndex(b []byte, n int) [][]int
```

FindAllSubmatchIndex is the 'All' version of FindSubmatchIndex; it returns a slice of all successive matches of the expression, as defined by the 'All' description in the package comment. A return value of nil indicates no match. 

#### <a id="Regexp.FindIndex" href="#Regexp.FindIndex">func (re *Regexp) FindIndex(b []byte) (loc []int)</a>

```
searchKey: regexp.Regexp.FindIndex
tags: [method]
```

```Go
func (re *Regexp) FindIndex(b []byte) (loc []int)
```

FindIndex returns a two-element slice of integers defining the location of the leftmost match in b of the regular expression. The match itself is at b[loc[0]:loc[1]]. A return value of nil indicates no match. 

#### <a id="Regexp.FindReaderIndex" href="#Regexp.FindReaderIndex">func (re *Regexp) FindReaderIndex(r io.RuneReader) (loc []int)</a>

```
searchKey: regexp.Regexp.FindReaderIndex
tags: [method]
```

```Go
func (re *Regexp) FindReaderIndex(r io.RuneReader) (loc []int)
```

FindReaderIndex returns a two-element slice of integers defining the location of the leftmost match of the regular expression in text read from the RuneReader. The match text was found in the input stream at byte offset loc[0] through loc[1]-1. A return value of nil indicates no match. 

#### <a id="Regexp.FindReaderSubmatchIndex" href="#Regexp.FindReaderSubmatchIndex">func (re *Regexp) FindReaderSubmatchIndex(r io.RuneReader) []int</a>

```
searchKey: regexp.Regexp.FindReaderSubmatchIndex
tags: [method]
```

```Go
func (re *Regexp) FindReaderSubmatchIndex(r io.RuneReader) []int
```

FindReaderSubmatchIndex returns a slice holding the index pairs identifying the leftmost match of the regular expression of text read by the RuneReader, and the matches, if any, of its subexpressions, as defined by the 'Submatch' and 'Index' descriptions in the package comment. A return value of nil indicates no match. 

#### <a id="Regexp.FindString" href="#Regexp.FindString">func (re *Regexp) FindString(s string) string</a>

```
searchKey: regexp.Regexp.FindString
tags: [method]
```

```Go
func (re *Regexp) FindString(s string) string
```

FindString returns a string holding the text of the leftmost match in s of the regular expression. If there is no match, the return value is an empty string, but it will also be empty if the regular expression successfully matches an empty string. Use FindStringIndex or FindStringSubmatch if it is necessary to distinguish these cases. 

#### <a id="Regexp.FindStringIndex" href="#Regexp.FindStringIndex">func (re *Regexp) FindStringIndex(s string) (loc []int)</a>

```
searchKey: regexp.Regexp.FindStringIndex
tags: [method]
```

```Go
func (re *Regexp) FindStringIndex(s string) (loc []int)
```

FindStringIndex returns a two-element slice of integers defining the location of the leftmost match in s of the regular expression. The match itself is at s[loc[0]:loc[1]]. A return value of nil indicates no match. 

#### <a id="Regexp.FindStringSubmatch" href="#Regexp.FindStringSubmatch">func (re *Regexp) FindStringSubmatch(s string) []string</a>

```
searchKey: regexp.Regexp.FindStringSubmatch
tags: [method]
```

```Go
func (re *Regexp) FindStringSubmatch(s string) []string
```

FindStringSubmatch returns a slice of strings holding the text of the leftmost match of the regular expression in s and the matches, if any, of its subexpressions, as defined by the 'Submatch' description in the package comment. A return value of nil indicates no match. 

#### <a id="Regexp.FindStringSubmatchIndex" href="#Regexp.FindStringSubmatchIndex">func (re *Regexp) FindStringSubmatchIndex(s string) []int</a>

```
searchKey: regexp.Regexp.FindStringSubmatchIndex
tags: [method]
```

```Go
func (re *Regexp) FindStringSubmatchIndex(s string) []int
```

FindStringSubmatchIndex returns a slice holding the index pairs identifying the leftmost match of the regular expression in s and the matches, if any, of its subexpressions, as defined by the 'Submatch' and 'Index' descriptions in the package comment. A return value of nil indicates no match. 

#### <a id="Regexp.FindSubmatch" href="#Regexp.FindSubmatch">func (re *Regexp) FindSubmatch(b []byte) [][]byte</a>

```
searchKey: regexp.Regexp.FindSubmatch
tags: [method]
```

```Go
func (re *Regexp) FindSubmatch(b []byte) [][]byte
```

FindSubmatch returns a slice of slices holding the text of the leftmost match of the regular expression in b and the matches, if any, of its subexpressions, as defined by the 'Submatch' descriptions in the package comment. A return value of nil indicates no match. 

#### <a id="Regexp.FindSubmatchIndex" href="#Regexp.FindSubmatchIndex">func (re *Regexp) FindSubmatchIndex(b []byte) []int</a>

```
searchKey: regexp.Regexp.FindSubmatchIndex
tags: [method]
```

```Go
func (re *Regexp) FindSubmatchIndex(b []byte) []int
```

FindSubmatchIndex returns a slice holding the index pairs identifying the leftmost match of the regular expression in b and the matches, if any, of its subexpressions, as defined by the 'Submatch' and 'Index' descriptions in the package comment. A return value of nil indicates no match. 

#### <a id="Regexp.LiteralPrefix" href="#Regexp.LiteralPrefix">func (re *Regexp) LiteralPrefix() (prefix string, complete bool)</a>

```
searchKey: regexp.Regexp.LiteralPrefix
tags: [method]
```

```Go
func (re *Regexp) LiteralPrefix() (prefix string, complete bool)
```

LiteralPrefix returns a literal string that must begin any match of the regular expression re. It returns the boolean true if the literal string comprises the entire regular expression. 

#### <a id="Regexp.Longest" href="#Regexp.Longest">func (re *Regexp) Longest()</a>

```
searchKey: regexp.Regexp.Longest
tags: [method]
```

```Go
func (re *Regexp) Longest()
```

Longest makes future searches prefer the leftmost-longest match. That is, when matching against text, the regexp returns a match that begins as early as possible in the input (leftmost), and among those it chooses a match that is as long as possible. This method modifies the Regexp and may not be called concurrently with any other methods. 

#### <a id="Regexp.Match" href="#Regexp.Match">func (re *Regexp) Match(b []byte) bool</a>

```
searchKey: regexp.Regexp.Match
tags: [method]
```

```Go
func (re *Regexp) Match(b []byte) bool
```

Match reports whether the byte slice b contains any match of the regular expression re. 

#### <a id="Regexp.MatchReader" href="#Regexp.MatchReader">func (re *Regexp) MatchReader(r io.RuneReader) bool</a>

```
searchKey: regexp.Regexp.MatchReader
tags: [method]
```

```Go
func (re *Regexp) MatchReader(r io.RuneReader) bool
```

MatchReader reports whether the text returned by the RuneReader contains any match of the regular expression re. 

#### <a id="Regexp.MatchString" href="#Regexp.MatchString">func (re *Regexp) MatchString(s string) bool</a>

```
searchKey: regexp.Regexp.MatchString
tags: [method]
```

```Go
func (re *Regexp) MatchString(s string) bool
```

MatchString reports whether the string s contains any match of the regular expression re. 

#### <a id="Regexp.NumSubexp" href="#Regexp.NumSubexp">func (re *Regexp) NumSubexp() int</a>

```
searchKey: regexp.Regexp.NumSubexp
tags: [method]
```

```Go
func (re *Regexp) NumSubexp() int
```

NumSubexp returns the number of parenthesized subexpressions in this Regexp. 

#### <a id="Regexp.ReplaceAll" href="#Regexp.ReplaceAll">func (re *Regexp) ReplaceAll(src, repl []byte) []byte</a>

```
searchKey: regexp.Regexp.ReplaceAll
tags: [method]
```

```Go
func (re *Regexp) ReplaceAll(src, repl []byte) []byte
```

ReplaceAll returns a copy of src, replacing matches of the Regexp with the replacement text repl. Inside repl, $ signs are interpreted as in Expand, so for instance $1 represents the text of the first submatch. 

#### <a id="Regexp.ReplaceAllFunc" href="#Regexp.ReplaceAllFunc">func (re *Regexp) ReplaceAllFunc(src []byte, repl func([]byte) []byte) []byte</a>

```
searchKey: regexp.Regexp.ReplaceAllFunc
tags: [method]
```

```Go
func (re *Regexp) ReplaceAllFunc(src []byte, repl func([]byte) []byte) []byte
```

ReplaceAllFunc returns a copy of src in which all matches of the Regexp have been replaced by the return value of function repl applied to the matched byte slice. The replacement returned by repl is substituted directly, without using Expand. 

#### <a id="Regexp.ReplaceAllLiteral" href="#Regexp.ReplaceAllLiteral">func (re *Regexp) ReplaceAllLiteral(src, repl []byte) []byte</a>

```
searchKey: regexp.Regexp.ReplaceAllLiteral
tags: [method]
```

```Go
func (re *Regexp) ReplaceAllLiteral(src, repl []byte) []byte
```

ReplaceAllLiteral returns a copy of src, replacing matches of the Regexp with the replacement bytes repl. The replacement repl is substituted directly, without using Expand. 

#### <a id="Regexp.ReplaceAllLiteralString" href="#Regexp.ReplaceAllLiteralString">func (re *Regexp) ReplaceAllLiteralString(src, repl string) string</a>

```
searchKey: regexp.Regexp.ReplaceAllLiteralString
tags: [method]
```

```Go
func (re *Regexp) ReplaceAllLiteralString(src, repl string) string
```

ReplaceAllLiteralString returns a copy of src, replacing matches of the Regexp with the replacement string repl. The replacement repl is substituted directly, without using Expand. 

#### <a id="Regexp.ReplaceAllString" href="#Regexp.ReplaceAllString">func (re *Regexp) ReplaceAllString(src, repl string) string</a>

```
searchKey: regexp.Regexp.ReplaceAllString
tags: [method]
```

```Go
func (re *Regexp) ReplaceAllString(src, repl string) string
```

ReplaceAllString returns a copy of src, replacing matches of the Regexp with the replacement string repl. Inside repl, $ signs are interpreted as in Expand, so for instance $1 represents the text of the first submatch. 

#### <a id="Regexp.ReplaceAllStringFunc" href="#Regexp.ReplaceAllStringFunc">func (re *Regexp) ReplaceAllStringFunc(src string, repl func(string) string) string</a>

```
searchKey: regexp.Regexp.ReplaceAllStringFunc
tags: [method]
```

```Go
func (re *Regexp) ReplaceAllStringFunc(src string, repl func(string) string) string
```

ReplaceAllStringFunc returns a copy of src in which all matches of the Regexp have been replaced by the return value of function repl applied to the matched substring. The replacement returned by repl is substituted directly, without using Expand. 

#### <a id="Regexp.Split" href="#Regexp.Split">func (re *Regexp) Split(s string, n int) []string</a>

```
searchKey: regexp.Regexp.Split
tags: [method]
```

```Go
func (re *Regexp) Split(s string, n int) []string
```

Split slices s into substrings separated by the expression and returns a slice of the substrings between those expression matches. 

The slice returned by this method consists of all the substrings of s not contained in the slice returned by FindAllString. When called on an expression that contains no metacharacters, it is equivalent to strings.SplitN. 

Example: 

```
s := regexp.MustCompile("a*").Split("abaabaccadaaae", 5)
// s: ["", "b", "b", "c", "cadaaae"]

```
The count determines the number of substrings to return: 

```
n > 0: at most n substrings; the last substring will be the unsplit remainder.
n == 0: the result is nil (zero substrings)
n < 0: all substrings

```
#### <a id="Regexp.String" href="#Regexp.String">func (re *Regexp) String() string</a>

```
searchKey: regexp.Regexp.String
tags: [method]
```

```Go
func (re *Regexp) String() string
```

String returns the source text used to compile the regular expression. 

#### <a id="Regexp.SubexpIndex" href="#Regexp.SubexpIndex">func (re *Regexp) SubexpIndex(name string) int</a>

```
searchKey: regexp.Regexp.SubexpIndex
tags: [method]
```

```Go
func (re *Regexp) SubexpIndex(name string) int
```

SubexpIndex returns the index of the first subexpression with the given name, or -1 if there is no subexpression with that name. 

Note that multiple subexpressions can be written using the same name, as in (?P<bob>a+)(?P<bob>b+), which declares two subexpressions named "bob". In this case, SubexpIndex returns the index of the leftmost such subexpression in the regular expression. 

#### <a id="Regexp.SubexpNames" href="#Regexp.SubexpNames">func (re *Regexp) SubexpNames() []string</a>

```
searchKey: regexp.Regexp.SubexpNames
tags: [method]
```

```Go
func (re *Regexp) SubexpNames() []string
```

SubexpNames returns the names of the parenthesized subexpressions in this Regexp. The name for the first sub-expression is names[1], so that if m is a match slice, the name for m[i] is SubexpNames()[i]. Since the Regexp as a whole cannot be named, names[0] is always the empty string. The slice should not be modified. 

#### <a id="Regexp.allMatches" href="#Regexp.allMatches">func (re *Regexp) allMatches(s string, b []byte, n int, deliver func([]int))</a>

```
searchKey: regexp.Regexp.allMatches
tags: [method private]
```

```Go
func (re *Regexp) allMatches(s string, b []byte, n int, deliver func([]int))
```

allMatches calls deliver at most n times with the location of successive matches in the input text. The input text is b if non-nil, otherwise s. 

#### <a id="Regexp.backtrack" href="#Regexp.backtrack">func (re *Regexp) backtrack(ib []byte, is string, pos int, ncap int, dstCap []int) []int</a>

```
searchKey: regexp.Regexp.backtrack
tags: [method private]
```

```Go
func (re *Regexp) backtrack(ib []byte, is string, pos int, ncap int, dstCap []int) []int
```

backtrack runs a backtracking search of prog on the input starting at pos. 

#### <a id="Regexp.doExecute" href="#Regexp.doExecute">func (re *Regexp) doExecute(r io.RuneReader, b []byte, s string, pos int, ncap int, dstCap []int) []int</a>

```
searchKey: regexp.Regexp.doExecute
tags: [method private]
```

```Go
func (re *Regexp) doExecute(r io.RuneReader, b []byte, s string, pos int, ncap int, dstCap []int) []int
```

doExecute finds the leftmost match in the input, appends the position of its subexpressions to dstCap and returns dstCap. 

nil is returned if no matches are found and non-nil if matches are found. 

#### <a id="Regexp.doMatch" href="#Regexp.doMatch">func (re *Regexp) doMatch(r io.RuneReader, b []byte, s string) bool</a>

```
searchKey: regexp.Regexp.doMatch
tags: [method private]
```

```Go
func (re *Regexp) doMatch(r io.RuneReader, b []byte, s string) bool
```

doMatch reports whether either r, b or s match the regexp. 

#### <a id="Regexp.doOnePass" href="#Regexp.doOnePass">func (re *Regexp) doOnePass(ir io.RuneReader, ib []byte, is string, pos, ncap int, dstCap []int) []int</a>

```
searchKey: regexp.Regexp.doOnePass
tags: [method private]
```

```Go
func (re *Regexp) doOnePass(ir io.RuneReader, ib []byte, is string, pos, ncap int, dstCap []int) []int
```

doOnePass implements r.doExecute using the one-pass execution engine. 

#### <a id="Regexp.expand" href="#Regexp.expand">func (re *Regexp) expand(dst []byte, template string, bsrc []byte, src string, match []int) []byte</a>

```
searchKey: regexp.Regexp.expand
tags: [method private]
```

```Go
func (re *Regexp) expand(dst []byte, template string, bsrc []byte, src string, match []int) []byte
```

#### <a id="Regexp.get" href="#Regexp.get">func (re *Regexp) get() *machine</a>

```
searchKey: regexp.Regexp.get
tags: [method private]
```

```Go
func (re *Regexp) get() *machine
```

get returns a machine to use for matching re. It uses the re's machine cache if possible, to avoid unnecessary allocation. 

#### <a id="Regexp.pad" href="#Regexp.pad">func (re *Regexp) pad(a []int) []int</a>

```
searchKey: regexp.Regexp.pad
tags: [method private]
```

```Go
func (re *Regexp) pad(a []int) []int
```

The number of capture values in the program may correspond to fewer capturing expressions than are in the regexp. For example, "(a){0}" turns into an empty program, so the maximum capture in the program is 0 but we need to return an expression for \1.  Pad appends -1s to the slice a as needed. 

#### <a id="Regexp.put" href="#Regexp.put">func (re *Regexp) put(m *machine)</a>

```
searchKey: regexp.Regexp.put
tags: [method private]
```

```Go
func (re *Regexp) put(m *machine)
```

put returns a machine to the correct machine pool. 

#### <a id="Regexp.replaceAll" href="#Regexp.replaceAll">func (re *Regexp) replaceAll(bsrc []byte, src string, nmatch int, repl func(dst []byte, m []int) []byte) []byte</a>

```
searchKey: regexp.Regexp.replaceAll
tags: [method private]
```

```Go
func (re *Regexp) replaceAll(bsrc []byte, src string, nmatch int, repl func(dst []byte, m []int) []byte) []byte
```

#### <a id="Regexp.tryBacktrack" href="#Regexp.tryBacktrack">func (re *Regexp) tryBacktrack(b *bitState, i input, pc uint32, pos int) bool</a>

```
searchKey: regexp.Regexp.tryBacktrack
tags: [method private]
```

```Go
func (re *Regexp) tryBacktrack(b *bitState, i input, pc uint32, pos int) bool
```

tryBacktrack runs a backtracking search starting at pos. 

### <a id="ReplaceFuncTest" href="#ReplaceFuncTest">type ReplaceFuncTest struct</a>

```
searchKey: regexp.ReplaceFuncTest
tags: [struct private]
```

```Go
type ReplaceFuncTest struct {
	pattern       string
	replacement   func(string) string
	input, output string
}
```

### <a id="ReplaceTest" href="#ReplaceTest">type ReplaceTest struct</a>

```
searchKey: regexp.ReplaceTest
tags: [struct private]
```

```Go
type ReplaceTest struct {
	pattern, replacement, input, output string
}
```

### <a id="bitState" href="#bitState">type bitState struct</a>

```
searchKey: regexp.bitState
tags: [struct private]
```

```Go
type bitState struct {
	end      int
	cap      []int
	matchcap []int
	jobs     []job
	visited  []uint32

	inputs inputs
}
```

bitState holds state for the backtracker. 

#### <a id="newBitState" href="#newBitState">func newBitState() *bitState</a>

```
searchKey: regexp.newBitState
tags: [function private]
```

```Go
func newBitState() *bitState
```

#### <a id="bitState.push" href="#bitState.push">func (b *bitState) push(re *Regexp, pc uint32, pos int, arg bool)</a>

```
searchKey: regexp.bitState.push
tags: [method private]
```

```Go
func (b *bitState) push(re *Regexp, pc uint32, pos int, arg bool)
```

push pushes (pc, pos, arg) onto the job stack if it should be visited. 

#### <a id="bitState.reset" href="#bitState.reset">func (b *bitState) reset(prog *syntax.Prog, end int, ncap int)</a>

```
searchKey: regexp.bitState.reset
tags: [method private]
```

```Go
func (b *bitState) reset(prog *syntax.Prog, end int, ncap int)
```

reset resets the state of the backtracker. end is the end position in the input. ncap is the number of captures. 

#### <a id="bitState.shouldVisit" href="#bitState.shouldVisit">func (b *bitState) shouldVisit(pc uint32, pos int) bool</a>

```
searchKey: regexp.bitState.shouldVisit
tags: [method private]
```

```Go
func (b *bitState) shouldVisit(pc uint32, pos int) bool
```

shouldVisit reports whether the combination of (pc, pos) has not been visited yet. 

### <a id="entry" href="#entry">type entry struct</a>

```
searchKey: regexp.entry
tags: [struct private]
```

```Go
type entry struct {
	pc uint32
	t  *thread
}
```

An entry is an entry on a queue. It holds both the instruction pc and the actual thread. Some queue entries are just place holders so that the machine knows it has considered that pc. Such entries have t == nil. 

### <a id="input" href="#input">type input interface</a>

```
searchKey: regexp.input
tags: [interface private]
```

```Go
type input interface {
	step(pos int) (r rune, width int) // advance one rune
	canCheckPrefix() bool             // can we look ahead without losing info?
	hasPrefix(re *Regexp) bool
	index(re *Regexp, pos int) int
	context(pos int) lazyFlag
}
```

input abstracts different representations of the input text. It provides one-character lookahead. 

### <a id="inputBytes" href="#inputBytes">type inputBytes struct</a>

```
searchKey: regexp.inputBytes
tags: [struct private]
```

```Go
type inputBytes struct {
	str []byte
}
```

inputBytes scans a byte slice. 

#### <a id="inputBytes.canCheckPrefix" href="#inputBytes.canCheckPrefix">func (i *inputBytes) canCheckPrefix() bool</a>

```
searchKey: regexp.inputBytes.canCheckPrefix
tags: [method private]
```

```Go
func (i *inputBytes) canCheckPrefix() bool
```

#### <a id="inputBytes.context" href="#inputBytes.context">func (i *inputBytes) context(pos int) lazyFlag</a>

```
searchKey: regexp.inputBytes.context
tags: [method private]
```

```Go
func (i *inputBytes) context(pos int) lazyFlag
```

#### <a id="inputBytes.hasPrefix" href="#inputBytes.hasPrefix">func (i *inputBytes) hasPrefix(re *Regexp) bool</a>

```
searchKey: regexp.inputBytes.hasPrefix
tags: [method private]
```

```Go
func (i *inputBytes) hasPrefix(re *Regexp) bool
```

#### <a id="inputBytes.index" href="#inputBytes.index">func (i *inputBytes) index(re *Regexp, pos int) int</a>

```
searchKey: regexp.inputBytes.index
tags: [method private]
```

```Go
func (i *inputBytes) index(re *Regexp, pos int) int
```

#### <a id="inputBytes.step" href="#inputBytes.step">func (i *inputBytes) step(pos int) (rune, int)</a>

```
searchKey: regexp.inputBytes.step
tags: [method private]
```

```Go
func (i *inputBytes) step(pos int) (rune, int)
```

### <a id="inputReader" href="#inputReader">type inputReader struct</a>

```
searchKey: regexp.inputReader
tags: [struct private]
```

```Go
type inputReader struct {
	r     io.RuneReader
	atEOT bool
	pos   int
}
```

inputReader scans a RuneReader. 

#### <a id="inputReader.canCheckPrefix" href="#inputReader.canCheckPrefix">func (i *inputReader) canCheckPrefix() bool</a>

```
searchKey: regexp.inputReader.canCheckPrefix
tags: [method private]
```

```Go
func (i *inputReader) canCheckPrefix() bool
```

#### <a id="inputReader.context" href="#inputReader.context">func (i *inputReader) context(pos int) lazyFlag</a>

```
searchKey: regexp.inputReader.context
tags: [method private]
```

```Go
func (i *inputReader) context(pos int) lazyFlag
```

#### <a id="inputReader.hasPrefix" href="#inputReader.hasPrefix">func (i *inputReader) hasPrefix(re *Regexp) bool</a>

```
searchKey: regexp.inputReader.hasPrefix
tags: [method private]
```

```Go
func (i *inputReader) hasPrefix(re *Regexp) bool
```

#### <a id="inputReader.index" href="#inputReader.index">func (i *inputReader) index(re *Regexp, pos int) int</a>

```
searchKey: regexp.inputReader.index
tags: [method private]
```

```Go
func (i *inputReader) index(re *Regexp, pos int) int
```

#### <a id="inputReader.step" href="#inputReader.step">func (i *inputReader) step(pos int) (rune, int)</a>

```
searchKey: regexp.inputReader.step
tags: [method private]
```

```Go
func (i *inputReader) step(pos int) (rune, int)
```

### <a id="inputString" href="#inputString">type inputString struct</a>

```
searchKey: regexp.inputString
tags: [struct private]
```

```Go
type inputString struct {
	str string
}
```

inputString scans a string. 

#### <a id="inputString.canCheckPrefix" href="#inputString.canCheckPrefix">func (i *inputString) canCheckPrefix() bool</a>

```
searchKey: regexp.inputString.canCheckPrefix
tags: [method private]
```

```Go
func (i *inputString) canCheckPrefix() bool
```

#### <a id="inputString.context" href="#inputString.context">func (i *inputString) context(pos int) lazyFlag</a>

```
searchKey: regexp.inputString.context
tags: [method private]
```

```Go
func (i *inputString) context(pos int) lazyFlag
```

#### <a id="inputString.hasPrefix" href="#inputString.hasPrefix">func (i *inputString) hasPrefix(re *Regexp) bool</a>

```
searchKey: regexp.inputString.hasPrefix
tags: [method private]
```

```Go
func (i *inputString) hasPrefix(re *Regexp) bool
```

#### <a id="inputString.index" href="#inputString.index">func (i *inputString) index(re *Regexp, pos int) int</a>

```
searchKey: regexp.inputString.index
tags: [method private]
```

```Go
func (i *inputString) index(re *Regexp, pos int) int
```

#### <a id="inputString.step" href="#inputString.step">func (i *inputString) step(pos int) (rune, int)</a>

```
searchKey: regexp.inputString.step
tags: [method private]
```

```Go
func (i *inputString) step(pos int) (rune, int)
```

### <a id="inputs" href="#inputs">type inputs struct</a>

```
searchKey: regexp.inputs
tags: [struct private]
```

```Go
type inputs struct {
	// cached inputs, to avoid allocation
	bytes  inputBytes
	string inputString
	reader inputReader
}
```

#### <a id="inputs.clear" href="#inputs.clear">func (i *inputs) clear()</a>

```
searchKey: regexp.inputs.clear
tags: [method private]
```

```Go
func (i *inputs) clear()
```

#### <a id="inputs.init.exec.go" href="#inputs.init.exec.go">func (i *inputs) init(r io.RuneReader, b []byte, s string) (input, int)</a>

```
searchKey: regexp.inputs.init
tags: [method private]
```

```Go
func (i *inputs) init(r io.RuneReader, b []byte, s string) (input, int)
```

#### <a id="inputs.newBytes" href="#inputs.newBytes">func (i *inputs) newBytes(b []byte) input</a>

```
searchKey: regexp.inputs.newBytes
tags: [method private]
```

```Go
func (i *inputs) newBytes(b []byte) input
```

#### <a id="inputs.newReader" href="#inputs.newReader">func (i *inputs) newReader(r io.RuneReader) input</a>

```
searchKey: regexp.inputs.newReader
tags: [method private]
```

```Go
func (i *inputs) newReader(r io.RuneReader) input
```

#### <a id="inputs.newString" href="#inputs.newString">func (i *inputs) newString(s string) input</a>

```
searchKey: regexp.inputs.newString
tags: [method private]
```

```Go
func (i *inputs) newString(s string) input
```

### <a id="job" href="#job">type job struct</a>

```
searchKey: regexp.job
tags: [struct private]
```

```Go
type job struct {
	pc  uint32
	arg bool
	pos int
}
```

A job is an entry on the backtracker's job stack. It holds the instruction pc and the position in the input. 

### <a id="lazyFlag" href="#lazyFlag">type lazyFlag uint64</a>

```
searchKey: regexp.lazyFlag
tags: [number private]
```

```Go
type lazyFlag uint64
```

A lazyFlag is a lazily-evaluated syntax.EmptyOp, for checking zero-width flags like ^ $ \A \z \B \b. It records the pair of relevant runes and does not determine the implied flags until absolutely necessary (most of the time, that means never). 

#### <a id="newLazyFlag" href="#newLazyFlag">func newLazyFlag(r1, r2 rune) lazyFlag</a>

```
searchKey: regexp.newLazyFlag
tags: [function private]
```

```Go
func newLazyFlag(r1, r2 rune) lazyFlag
```

#### <a id="lazyFlag.match" href="#lazyFlag.match">func (f lazyFlag) match(op syntax.EmptyOp) bool</a>

```
searchKey: regexp.lazyFlag.match
tags: [method private]
```

```Go
func (f lazyFlag) match(op syntax.EmptyOp) bool
```

### <a id="machine" href="#machine">type machine struct</a>

```
searchKey: regexp.machine
tags: [struct private]
```

```Go
type machine struct {
	re       *Regexp      // corresponding Regexp
	p        *syntax.Prog // compiled program
	q0, q1   queue        // two queues for runq, nextq
	pool     []*thread    // pool of available threads
	matched  bool         // whether a match was found
	matchcap []int        // capture information for the match

	inputs inputs
}
```

A machine holds all the state during an NFA simulation for p. 

#### <a id="machine.add" href="#machine.add">func (m *machine) add(q *queue, pc uint32, pos int, cap []int, cond *lazyFlag, t *thread) *thread</a>

```
searchKey: regexp.machine.add
tags: [method private]
```

```Go
func (m *machine) add(q *queue, pc uint32, pos int, cap []int, cond *lazyFlag, t *thread) *thread
```

add adds an entry to q for pc, unless the q already has such an entry. It also recursively adds an entry for all instructions reachable from pc by following empty-width conditions satisfied by cond.  pos gives the current position in the input. 

#### <a id="machine.alloc" href="#machine.alloc">func (m *machine) alloc(i *syntax.Inst) *thread</a>

```
searchKey: regexp.machine.alloc
tags: [method private]
```

```Go
func (m *machine) alloc(i *syntax.Inst) *thread
```

alloc allocates a new thread with the given instruction. It uses the free pool if possible. 

#### <a id="machine.clear" href="#machine.clear">func (m *machine) clear(q *queue)</a>

```
searchKey: regexp.machine.clear
tags: [method private]
```

```Go
func (m *machine) clear(q *queue)
```

clear frees all threads on the thread queue. 

#### <a id="machine.init.exec.go.0xc05e1c7510" href="#machine.init.exec.go.0xc05e1c7510">func (m *machine) init(ncap int)</a>

```
searchKey: regexp.machine.init
tags: [method private]
```

```Go
func (m *machine) init(ncap int)
```

#### <a id="machine.match" href="#machine.match">func (m *machine) match(i input, pos int) bool</a>

```
searchKey: regexp.machine.match
tags: [method private]
```

```Go
func (m *machine) match(i input, pos int) bool
```

match runs the machine over the input starting at pos. It reports whether a match was found. If so, m.matchcap holds the submatch information. 

#### <a id="machine.step" href="#machine.step">func (m *machine) step(runq, nextq *queue, pos, nextPos int, c rune, nextCond *lazyFlag)</a>

```
searchKey: regexp.machine.step
tags: [method private]
```

```Go
func (m *machine) step(runq, nextq *queue, pos, nextPos int, c rune, nextCond *lazyFlag)
```

step executes one step of the machine, running each of the threads on runq and appending new threads to nextq. The step processes the rune c (which may be endOfText), which starts at position pos and ends at nextPos. nextCond gives the setting for the empty-width flags after c. 

### <a id="onePassInst" href="#onePassInst">type onePassInst struct</a>

```
searchKey: regexp.onePassInst
tags: [struct private]
```

```Go
type onePassInst struct {
	syntax.Inst
	Next []uint32
}
```

A onePassInst is a single instruction in a one-pass regular expression program. It is the same as syntax.Inst except for the new 'Next' field. 

### <a id="onePassMachine" href="#onePassMachine">type onePassMachine struct</a>

```
searchKey: regexp.onePassMachine
tags: [struct private]
```

```Go
type onePassMachine struct {
	inputs   inputs
	matchcap []int
}
```

#### <a id="newOnePassMachine" href="#newOnePassMachine">func newOnePassMachine() *onePassMachine</a>

```
searchKey: regexp.newOnePassMachine
tags: [function private]
```

```Go
func newOnePassMachine() *onePassMachine
```

### <a id="onePassProg" href="#onePassProg">type onePassProg struct</a>

```
searchKey: regexp.onePassProg
tags: [struct private]
```

```Go
type onePassProg struct {
	Inst   []onePassInst
	Start  int // index of start instruction
	NumCap int // number of InstCapture insts in re
}
```

A onePassProg is a compiled one-pass regular expression program. It is the same as syntax.Prog except for the use of onePassInst. 

#### <a id="compileOnePass" href="#compileOnePass">func compileOnePass(prog *syntax.Prog) (p *onePassProg)</a>

```
searchKey: regexp.compileOnePass
tags: [function private]
```

```Go
func compileOnePass(prog *syntax.Prog) (p *onePassProg)
```

compileOnePass returns a new *syntax.Prog suitable for onePass execution if the original Prog can be recharacterized as a one-pass regexp program, or syntax.nil if the Prog cannot be converted. For a one pass prog, the fundamental condition that must be true is: at any InstAlt, there must be no ambiguity about what branch to  take. 

#### <a id="makeOnePass" href="#makeOnePass">func makeOnePass(p *onePassProg) *onePassProg</a>

```
searchKey: regexp.makeOnePass
tags: [function private]
```

```Go
func makeOnePass(p *onePassProg) *onePassProg
```

makeOnePass creates a onepass Prog, if possible. It is possible if at any alt, the match engine can always tell which branch to take. The routine may modify p if it is turned into a onepass Prog. If it isn't possible for this to be a onepass Prog, the Prog nil is returned. makeOnePass is recursive to the size of the Prog. 

#### <a id="onePassCopy" href="#onePassCopy">func onePassCopy(prog *syntax.Prog) *onePassProg</a>

```
searchKey: regexp.onePassCopy
tags: [function private]
```

```Go
func onePassCopy(prog *syntax.Prog) *onePassProg
```

onePassCopy creates a copy of the original Prog, as we'll be modifying it 

### <a id="queue" href="#queue">type queue struct</a>

```
searchKey: regexp.queue
tags: [struct private]
```

```Go
type queue struct {
	sparse []uint32
	dense  []entry
}
```

A queue is a 'sparse array' holding pending threads of execution. See [https://research.swtch.com/2008/03/using-uninitialized-memory-for-fun-and.html](https://research.swtch.com/2008/03/using-uninitialized-memory-for-fun-and.html) 

### <a id="queueOnePass" href="#queueOnePass">type queueOnePass struct</a>

```
searchKey: regexp.queueOnePass
tags: [struct private]
```

```Go
type queueOnePass struct {
	sparse          []uint32
	dense           []uint32
	size, nextIndex uint32
}
```

Sparse Array implementation is used as a queueOnePass. 

#### <a id="newQueue" href="#newQueue">func newQueue(size int) (q *queueOnePass)</a>

```
searchKey: regexp.newQueue
tags: [function private]
```

```Go
func newQueue(size int) (q *queueOnePass)
```

#### <a id="queueOnePass.clear" href="#queueOnePass.clear">func (q *queueOnePass) clear()</a>

```
searchKey: regexp.queueOnePass.clear
tags: [method private]
```

```Go
func (q *queueOnePass) clear()
```

#### <a id="queueOnePass.contains" href="#queueOnePass.contains">func (q *queueOnePass) contains(u uint32) bool</a>

```
searchKey: regexp.queueOnePass.contains
tags: [method private]
```

```Go
func (q *queueOnePass) contains(u uint32) bool
```

#### <a id="queueOnePass.empty" href="#queueOnePass.empty">func (q *queueOnePass) empty() bool</a>

```
searchKey: regexp.queueOnePass.empty
tags: [method private]
```

```Go
func (q *queueOnePass) empty() bool
```

#### <a id="queueOnePass.insert" href="#queueOnePass.insert">func (q *queueOnePass) insert(u uint32)</a>

```
searchKey: regexp.queueOnePass.insert
tags: [method private]
```

```Go
func (q *queueOnePass) insert(u uint32)
```

#### <a id="queueOnePass.insertNew" href="#queueOnePass.insertNew">func (q *queueOnePass) insertNew(u uint32)</a>

```
searchKey: regexp.queueOnePass.insertNew
tags: [method private]
```

```Go
func (q *queueOnePass) insertNew(u uint32)
```

#### <a id="queueOnePass.next" href="#queueOnePass.next">func (q *queueOnePass) next() (n uint32)</a>

```
searchKey: regexp.queueOnePass.next
tags: [method private]
```

```Go
func (q *queueOnePass) next() (n uint32)
```

### <a id="runeSlice" href="#runeSlice">type runeSlice []rune</a>

```
searchKey: regexp.runeSlice
tags: [array number private]
```

```Go
type runeSlice []rune
```

runeSlice exists to permit sorting the case-folded rune sets. 

#### <a id="runeSlice.Len" href="#runeSlice.Len">func (p runeSlice) Len() int</a>

```
searchKey: regexp.runeSlice.Len
tags: [method private]
```

```Go
func (p runeSlice) Len() int
```

#### <a id="runeSlice.Less" href="#runeSlice.Less">func (p runeSlice) Less(i, j int) bool</a>

```
searchKey: regexp.runeSlice.Less
tags: [method private]
```

```Go
func (p runeSlice) Less(i, j int) bool
```

#### <a id="runeSlice.Swap" href="#runeSlice.Swap">func (p runeSlice) Swap(i, j int)</a>

```
searchKey: regexp.runeSlice.Swap
tags: [method private]
```

```Go
func (p runeSlice) Swap(i, j int)
```

### <a id="stringError" href="#stringError">type stringError struct</a>

```
searchKey: regexp.stringError
tags: [struct private]
```

```Go
type stringError struct {
	re  string
	err string
}
```

### <a id="subexpCase" href="#subexpCase">type subexpCase struct</a>

```
searchKey: regexp.subexpCase
tags: [struct private]
```

```Go
type subexpCase struct {
	input   string
	num     int
	names   []string
	indices []subexpIndex
}
```

### <a id="subexpIndex" href="#subexpIndex">type subexpIndex struct</a>

```
searchKey: regexp.subexpIndex
tags: [struct private]
```

```Go
type subexpIndex struct {
	name  string
	index int
}
```

### <a id="thread" href="#thread">type thread struct</a>

```
searchKey: regexp.thread
tags: [struct private]
```

```Go
type thread struct {
	inst *syntax.Inst
	cap  []int
}
```

A thread is the state of a single path through the machine: an instruction and a corresponding capture array. See [https://swtch.com/~rsc/regexp/regexp2.html](https://swtch.com/~rsc/regexp/regexp2.html) 

## <a id="func" href="#func">Functions</a>

### <a id="BenchmarkAnchoredLiteralLongNonMatch" href="#BenchmarkAnchoredLiteralLongNonMatch">func BenchmarkAnchoredLiteralLongNonMatch(b *testing.B)</a>

```
searchKey: regexp.BenchmarkAnchoredLiteralLongNonMatch
tags: [function private benchmark]
```

```Go
func BenchmarkAnchoredLiteralLongNonMatch(b *testing.B)
```

### <a id="BenchmarkAnchoredLiteralShortNonMatch" href="#BenchmarkAnchoredLiteralShortNonMatch">func BenchmarkAnchoredLiteralShortNonMatch(b *testing.B)</a>

```
searchKey: regexp.BenchmarkAnchoredLiteralShortNonMatch
tags: [function private benchmark]
```

```Go
func BenchmarkAnchoredLiteralShortNonMatch(b *testing.B)
```

### <a id="BenchmarkAnchoredLongMatch" href="#BenchmarkAnchoredLongMatch">func BenchmarkAnchoredLongMatch(b *testing.B)</a>

```
searchKey: regexp.BenchmarkAnchoredLongMatch
tags: [function private benchmark]
```

```Go
func BenchmarkAnchoredLongMatch(b *testing.B)
```

### <a id="BenchmarkAnchoredShortMatch" href="#BenchmarkAnchoredShortMatch">func BenchmarkAnchoredShortMatch(b *testing.B)</a>

```
searchKey: regexp.BenchmarkAnchoredShortMatch
tags: [function private benchmark]
```

```Go
func BenchmarkAnchoredShortMatch(b *testing.B)
```

### <a id="BenchmarkCompile" href="#BenchmarkCompile">func BenchmarkCompile(b *testing.B)</a>

```
searchKey: regexp.BenchmarkCompile
tags: [function private benchmark]
```

```Go
func BenchmarkCompile(b *testing.B)
```

### <a id="BenchmarkFind" href="#BenchmarkFind">func BenchmarkFind(b *testing.B)</a>

```
searchKey: regexp.BenchmarkFind
tags: [function private benchmark]
```

```Go
func BenchmarkFind(b *testing.B)
```

### <a id="BenchmarkFindAllNoMatches" href="#BenchmarkFindAllNoMatches">func BenchmarkFindAllNoMatches(b *testing.B)</a>

```
searchKey: regexp.BenchmarkFindAllNoMatches
tags: [function private benchmark]
```

```Go
func BenchmarkFindAllNoMatches(b *testing.B)
```

### <a id="BenchmarkFindString" href="#BenchmarkFindString">func BenchmarkFindString(b *testing.B)</a>

```
searchKey: regexp.BenchmarkFindString
tags: [function private benchmark]
```

```Go
func BenchmarkFindString(b *testing.B)
```

### <a id="BenchmarkFindStringSubmatch" href="#BenchmarkFindStringSubmatch">func BenchmarkFindStringSubmatch(b *testing.B)</a>

```
searchKey: regexp.BenchmarkFindStringSubmatch
tags: [function private benchmark]
```

```Go
func BenchmarkFindStringSubmatch(b *testing.B)
```

### <a id="BenchmarkFindSubmatch" href="#BenchmarkFindSubmatch">func BenchmarkFindSubmatch(b *testing.B)</a>

```
searchKey: regexp.BenchmarkFindSubmatch
tags: [function private benchmark]
```

```Go
func BenchmarkFindSubmatch(b *testing.B)
```

### <a id="BenchmarkLiteral" href="#BenchmarkLiteral">func BenchmarkLiteral(b *testing.B)</a>

```
searchKey: regexp.BenchmarkLiteral
tags: [function private benchmark]
```

```Go
func BenchmarkLiteral(b *testing.B)
```

### <a id="BenchmarkMatch" href="#BenchmarkMatch">func BenchmarkMatch(b *testing.B)</a>

```
searchKey: regexp.BenchmarkMatch
tags: [function private benchmark]
```

```Go
func BenchmarkMatch(b *testing.B)
```

### <a id="BenchmarkMatchClass" href="#BenchmarkMatchClass">func BenchmarkMatchClass(b *testing.B)</a>

```
searchKey: regexp.BenchmarkMatchClass
tags: [function private benchmark]
```

```Go
func BenchmarkMatchClass(b *testing.B)
```

### <a id="BenchmarkMatchClass_InRange" href="#BenchmarkMatchClass_InRange">func BenchmarkMatchClass_InRange(b *testing.B)</a>

```
searchKey: regexp.BenchmarkMatchClass_InRange
tags: [function private benchmark]
```

```Go
func BenchmarkMatchClass_InRange(b *testing.B)
```

### <a id="BenchmarkMatchParallelCopied" href="#BenchmarkMatchParallelCopied">func BenchmarkMatchParallelCopied(b *testing.B)</a>

```
searchKey: regexp.BenchmarkMatchParallelCopied
tags: [function private benchmark]
```

```Go
func BenchmarkMatchParallelCopied(b *testing.B)
```

### <a id="BenchmarkMatchParallelShared" href="#BenchmarkMatchParallelShared">func BenchmarkMatchParallelShared(b *testing.B)</a>

```
searchKey: regexp.BenchmarkMatchParallelShared
tags: [function private benchmark]
```

```Go
func BenchmarkMatchParallelShared(b *testing.B)
```

### <a id="BenchmarkMatch_onepass_regex" href="#BenchmarkMatch_onepass_regex">func BenchmarkMatch_onepass_regex(b *testing.B)</a>

```
searchKey: regexp.BenchmarkMatch_onepass_regex
tags: [function private benchmark]
```

```Go
func BenchmarkMatch_onepass_regex(b *testing.B)
```

### <a id="BenchmarkNotLiteral" href="#BenchmarkNotLiteral">func BenchmarkNotLiteral(b *testing.B)</a>

```
searchKey: regexp.BenchmarkNotLiteral
tags: [function private benchmark]
```

```Go
func BenchmarkNotLiteral(b *testing.B)
```

### <a id="BenchmarkNotOnePassShortA" href="#BenchmarkNotOnePassShortA">func BenchmarkNotOnePassShortA(b *testing.B)</a>

```
searchKey: regexp.BenchmarkNotOnePassShortA
tags: [function private benchmark]
```

```Go
func BenchmarkNotOnePassShortA(b *testing.B)
```

### <a id="BenchmarkNotOnePassShortB" href="#BenchmarkNotOnePassShortB">func BenchmarkNotOnePassShortB(b *testing.B)</a>

```
searchKey: regexp.BenchmarkNotOnePassShortB
tags: [function private benchmark]
```

```Go
func BenchmarkNotOnePassShortB(b *testing.B)
```

### <a id="BenchmarkOnePassLongNotPrefix" href="#BenchmarkOnePassLongNotPrefix">func BenchmarkOnePassLongNotPrefix(b *testing.B)</a>

```
searchKey: regexp.BenchmarkOnePassLongNotPrefix
tags: [function private benchmark]
```

```Go
func BenchmarkOnePassLongNotPrefix(b *testing.B)
```

### <a id="BenchmarkOnePassLongPrefix" href="#BenchmarkOnePassLongPrefix">func BenchmarkOnePassLongPrefix(b *testing.B)</a>

```
searchKey: regexp.BenchmarkOnePassLongPrefix
tags: [function private benchmark]
```

```Go
func BenchmarkOnePassLongPrefix(b *testing.B)
```

### <a id="BenchmarkOnePassShortA" href="#BenchmarkOnePassShortA">func BenchmarkOnePassShortA(b *testing.B)</a>

```
searchKey: regexp.BenchmarkOnePassShortA
tags: [function private benchmark]
```

```Go
func BenchmarkOnePassShortA(b *testing.B)
```

### <a id="BenchmarkOnePassShortB" href="#BenchmarkOnePassShortB">func BenchmarkOnePassShortB(b *testing.B)</a>

```
searchKey: regexp.BenchmarkOnePassShortB
tags: [function private benchmark]
```

```Go
func BenchmarkOnePassShortB(b *testing.B)
```

### <a id="BenchmarkQuoteMetaAll" href="#BenchmarkQuoteMetaAll">func BenchmarkQuoteMetaAll(b *testing.B)</a>

```
searchKey: regexp.BenchmarkQuoteMetaAll
tags: [function private benchmark]
```

```Go
func BenchmarkQuoteMetaAll(b *testing.B)
```

### <a id="BenchmarkQuoteMetaNone" href="#BenchmarkQuoteMetaNone">func BenchmarkQuoteMetaNone(b *testing.B)</a>

```
searchKey: regexp.BenchmarkQuoteMetaNone
tags: [function private benchmark]
```

```Go
func BenchmarkQuoteMetaNone(b *testing.B)
```

### <a id="BenchmarkReplaceAll" href="#BenchmarkReplaceAll">func BenchmarkReplaceAll(b *testing.B)</a>

```
searchKey: regexp.BenchmarkReplaceAll
tags: [function private benchmark]
```

```Go
func BenchmarkReplaceAll(b *testing.B)
```

### <a id="Match" href="#Match">func Match(pattern string, b []byte) (matched bool, err error)</a>

```
searchKey: regexp.Match
tags: [function]
```

```Go
func Match(pattern string, b []byte) (matched bool, err error)
```

Match reports whether the byte slice b contains any match of the regular expression pattern. More complicated queries need to use Compile and the full Regexp interface. 

### <a id="MatchReader" href="#MatchReader">func MatchReader(pattern string, r io.RuneReader) (matched bool, err error)</a>

```
searchKey: regexp.MatchReader
tags: [function]
```

```Go
func MatchReader(pattern string, r io.RuneReader) (matched bool, err error)
```

MatchReader reports whether the text returned by the RuneReader contains any match of the regular expression pattern. More complicated queries need to use Compile and the full Regexp interface. 

### <a id="MatchString" href="#MatchString">func MatchString(pattern string, s string) (matched bool, err error)</a>

```
searchKey: regexp.MatchString
tags: [function]
```

```Go
func MatchString(pattern string, s string) (matched bool, err error)
```

MatchString reports whether the string s contains any match of the regular expression pattern. More complicated queries need to use Compile and the full Regexp interface. 

### <a id="QuoteMeta" href="#QuoteMeta">func QuoteMeta(s string) string</a>

```
searchKey: regexp.QuoteMeta
tags: [function]
```

```Go
func QuoteMeta(s string) string
```

QuoteMeta returns a string that escapes all regular expression metacharacters inside the argument text; the returned string is a regular expression matching the literal text. 

### <a id="TestBadCompile" href="#TestBadCompile">func TestBadCompile(t *testing.T)</a>

```
searchKey: regexp.TestBadCompile
tags: [function private test]
```

```Go
func TestBadCompile(t *testing.T)
```

### <a id="TestCompileOnePass" href="#TestCompileOnePass">func TestCompileOnePass(t *testing.T)</a>

```
searchKey: regexp.TestCompileOnePass
tags: [function private test]
```

```Go
func TestCompileOnePass(t *testing.T)
```

### <a id="TestCopyMatch" href="#TestCopyMatch">func TestCopyMatch(t *testing.T)</a>

```
searchKey: regexp.TestCopyMatch
tags: [function private test]
```

```Go
func TestCopyMatch(t *testing.T)
```

### <a id="TestDeepEqual" href="#TestDeepEqual">func TestDeepEqual(t *testing.T)</a>

```
searchKey: regexp.TestDeepEqual
tags: [function private test]
```

```Go
func TestDeepEqual(t *testing.T)
```

### <a id="TestFind" href="#TestFind">func TestFind(t *testing.T)</a>

```
searchKey: regexp.TestFind
tags: [function private test]
```

```Go
func TestFind(t *testing.T)
```

### <a id="TestFindAll" href="#TestFindAll">func TestFindAll(t *testing.T)</a>

```
searchKey: regexp.TestFindAll
tags: [function private test]
```

```Go
func TestFindAll(t *testing.T)
```

### <a id="TestFindAllIndex" href="#TestFindAllIndex">func TestFindAllIndex(t *testing.T)</a>

```
searchKey: regexp.TestFindAllIndex
tags: [function private test]
```

```Go
func TestFindAllIndex(t *testing.T)
```

### <a id="TestFindAllString" href="#TestFindAllString">func TestFindAllString(t *testing.T)</a>

```
searchKey: regexp.TestFindAllString
tags: [function private test]
```

```Go
func TestFindAllString(t *testing.T)
```

### <a id="TestFindAllStringIndex" href="#TestFindAllStringIndex">func TestFindAllStringIndex(t *testing.T)</a>

```
searchKey: regexp.TestFindAllStringIndex
tags: [function private test]
```

```Go
func TestFindAllStringIndex(t *testing.T)
```

### <a id="TestFindAllStringSubmatch" href="#TestFindAllStringSubmatch">func TestFindAllStringSubmatch(t *testing.T)</a>

```
searchKey: regexp.TestFindAllStringSubmatch
tags: [function private test]
```

```Go
func TestFindAllStringSubmatch(t *testing.T)
```

### <a id="TestFindAllStringSubmatchIndex" href="#TestFindAllStringSubmatchIndex">func TestFindAllStringSubmatchIndex(t *testing.T)</a>

```
searchKey: regexp.TestFindAllStringSubmatchIndex
tags: [function private test]
```

```Go
func TestFindAllStringSubmatchIndex(t *testing.T)
```

### <a id="TestFindAllSubmatch" href="#TestFindAllSubmatch">func TestFindAllSubmatch(t *testing.T)</a>

```
searchKey: regexp.TestFindAllSubmatch
tags: [function private test]
```

```Go
func TestFindAllSubmatch(t *testing.T)
```

### <a id="TestFindAllSubmatchIndex" href="#TestFindAllSubmatchIndex">func TestFindAllSubmatchIndex(t *testing.T)</a>

```
searchKey: regexp.TestFindAllSubmatchIndex
tags: [function private test]
```

```Go
func TestFindAllSubmatchIndex(t *testing.T)
```

### <a id="TestFindIndex" href="#TestFindIndex">func TestFindIndex(t *testing.T)</a>

```
searchKey: regexp.TestFindIndex
tags: [function private test]
```

```Go
func TestFindIndex(t *testing.T)
```

### <a id="TestFindReaderIndex" href="#TestFindReaderIndex">func TestFindReaderIndex(t *testing.T)</a>

```
searchKey: regexp.TestFindReaderIndex
tags: [function private test]
```

```Go
func TestFindReaderIndex(t *testing.T)
```

### <a id="TestFindReaderSubmatchIndex" href="#TestFindReaderSubmatchIndex">func TestFindReaderSubmatchIndex(t *testing.T)</a>

```
searchKey: regexp.TestFindReaderSubmatchIndex
tags: [function private test]
```

```Go
func TestFindReaderSubmatchIndex(t *testing.T)
```

### <a id="TestFindString" href="#TestFindString">func TestFindString(t *testing.T)</a>

```
searchKey: regexp.TestFindString
tags: [function private test]
```

```Go
func TestFindString(t *testing.T)
```

### <a id="TestFindStringIndex" href="#TestFindStringIndex">func TestFindStringIndex(t *testing.T)</a>

```
searchKey: regexp.TestFindStringIndex
tags: [function private test]
```

```Go
func TestFindStringIndex(t *testing.T)
```

### <a id="TestFindStringSubmatch" href="#TestFindStringSubmatch">func TestFindStringSubmatch(t *testing.T)</a>

```
searchKey: regexp.TestFindStringSubmatch
tags: [function private test]
```

```Go
func TestFindStringSubmatch(t *testing.T)
```

### <a id="TestFindStringSubmatchIndex" href="#TestFindStringSubmatchIndex">func TestFindStringSubmatchIndex(t *testing.T)</a>

```
searchKey: regexp.TestFindStringSubmatchIndex
tags: [function private test]
```

```Go
func TestFindStringSubmatchIndex(t *testing.T)
```

### <a id="TestFindSubmatch" href="#TestFindSubmatch">func TestFindSubmatch(t *testing.T)</a>

```
searchKey: regexp.TestFindSubmatch
tags: [function private test]
```

```Go
func TestFindSubmatch(t *testing.T)
```

### <a id="TestFindSubmatchIndex" href="#TestFindSubmatchIndex">func TestFindSubmatchIndex(t *testing.T)</a>

```
searchKey: regexp.TestFindSubmatchIndex
tags: [function private test]
```

```Go
func TestFindSubmatchIndex(t *testing.T)
```

### <a id="TestFowler" href="#TestFowler">func TestFowler(t *testing.T)</a>

```
searchKey: regexp.TestFowler
tags: [function private test]
```

```Go
func TestFowler(t *testing.T)
```

TestFowler runs this package's regexp API against the POSIX regular expression tests collected by Glenn Fowler at [http://www2.research.att.com/~astopen/testregex/testregex.html](http://www2.research.att.com/~astopen/testregex/testregex.html). 

### <a id="TestGoodCompile" href="#TestGoodCompile">func TestGoodCompile(t *testing.T)</a>

```
searchKey: regexp.TestGoodCompile
tags: [function private test]
```

```Go
func TestGoodCompile(t *testing.T)
```

### <a id="TestLiteralPrefix" href="#TestLiteralPrefix">func TestLiteralPrefix(t *testing.T)</a>

```
searchKey: regexp.TestLiteralPrefix
tags: [function private test]
```

```Go
func TestLiteralPrefix(t *testing.T)
```

### <a id="TestLongest" href="#TestLongest">func TestLongest(t *testing.T)</a>

```
searchKey: regexp.TestLongest
tags: [function private test]
```

```Go
func TestLongest(t *testing.T)
```

### <a id="TestMatch" href="#TestMatch">func TestMatch(t *testing.T)</a>

```
searchKey: regexp.TestMatch
tags: [function private test]
```

```Go
func TestMatch(t *testing.T)
```

### <a id="TestMatchFunction" href="#TestMatchFunction">func TestMatchFunction(t *testing.T)</a>

```
searchKey: regexp.TestMatchFunction
tags: [function private test]
```

```Go
func TestMatchFunction(t *testing.T)
```

### <a id="TestMergeRuneSet" href="#TestMergeRuneSet">func TestMergeRuneSet(t *testing.T)</a>

```
searchKey: regexp.TestMergeRuneSet
tags: [function private test]
```

```Go
func TestMergeRuneSet(t *testing.T)
```

### <a id="TestMinInputLen" href="#TestMinInputLen">func TestMinInputLen(t *testing.T)</a>

```
searchKey: regexp.TestMinInputLen
tags: [function private test]
```

```Go
func TestMinInputLen(t *testing.T)
```

### <a id="TestOnePassCutoff" href="#TestOnePassCutoff">func TestOnePassCutoff(t *testing.T)</a>

```
searchKey: regexp.TestOnePassCutoff
tags: [function private test]
```

```Go
func TestOnePassCutoff(t *testing.T)
```

Check that one-pass cutoff does trigger. 

### <a id="TestParseAndCompile" href="#TestParseAndCompile">func TestParseAndCompile(t *testing.T)</a>

```
searchKey: regexp.TestParseAndCompile
tags: [function private test]
```

```Go
func TestParseAndCompile(t *testing.T)
```

The following sequence of Match calls used to panic. See issue #12980. 

### <a id="TestProgramTooLongForBacktrack" href="#TestProgramTooLongForBacktrack">func TestProgramTooLongForBacktrack(t *testing.T)</a>

```
searchKey: regexp.TestProgramTooLongForBacktrack
tags: [function private test]
```

```Go
func TestProgramTooLongForBacktrack(t *testing.T)
```

TestProgramTooLongForBacktrack tests that a regex which is too long for the backtracker still executes properly. 

### <a id="TestQuoteMeta" href="#TestQuoteMeta">func TestQuoteMeta(t *testing.T)</a>

```
searchKey: regexp.TestQuoteMeta
tags: [function private test]
```

```Go
func TestQuoteMeta(t *testing.T)
```

### <a id="TestRE2Exhaustive" href="#TestRE2Exhaustive">func TestRE2Exhaustive(t *testing.T)</a>

```
searchKey: regexp.TestRE2Exhaustive
tags: [function private test]
```

```Go
func TestRE2Exhaustive(t *testing.T)
```

This test is excluded when running under the race detector because it is a very expensive test and takes too long. 

### <a id="TestRE2Search" href="#TestRE2Search">func TestRE2Search(t *testing.T)</a>

```
searchKey: regexp.TestRE2Search
tags: [function private test]
```

```Go
func TestRE2Search(t *testing.T)
```

TestRE2 tests this package's regexp API against test cases considered during RE2's exhaustive tests, which run all possible regexps over a given set of atoms and operators, up to a given complexity, over all possible strings over a given alphabet, up to a given size. Rather than try to link with RE2, we read a log file containing the test cases and the expected matches. The log file, re2-exhaustive.txt, is generated by running 'make log' in the open source RE2 distribution [https://github.com/google/re2/](https://github.com/google/re2/). 

The test file format is a sequence of stanzas like: 

```
strings
"abc"
"123x"
regexps
"[a-z]+"
0-3;0-3
-;-
"([0-9])([0-9])([0-9])"
-;-
-;0-3 0-1 1-2 2-3

```
The stanza begins by defining a set of strings, quoted using Go double-quote syntax, one per line. Then the regexps section gives a sequence of regexps to run on the strings. In the block that follows a regexp, each line gives the semicolon-separated match results of running the regexp on the corresponding string. Each match result is either a single -, meaning no match, or a space-separated sequence of pairs giving the match and submatch indices. An unmatched subexpression formats its pair as a single - (not illustrated above).  For now each regexp run produces two match results, one for a `full match' that restricts the regexp to matching the entire string or nothing, and one for a `partial match' that gives the leftmost first match found in the string. 

Lines beginning with # are comments. Lines beginning with a capital letter are test names printed during RE2's test suite and are echoed into t but otherwise ignored. 

At time of writing, re2-exhaustive.txt is 59 MB but compresses to 385 kB, so we store re2-exhaustive.txt.bz2 in the repository and decompress it on the fly. 

### <a id="TestReplaceAll" href="#TestReplaceAll">func TestReplaceAll(t *testing.T)</a>

```
searchKey: regexp.TestReplaceAll
tags: [function private test]
```

```Go
func TestReplaceAll(t *testing.T)
```

### <a id="TestReplaceAllFunc" href="#TestReplaceAllFunc">func TestReplaceAllFunc(t *testing.T)</a>

```
searchKey: regexp.TestReplaceAllFunc
tags: [function private test]
```

```Go
func TestReplaceAllFunc(t *testing.T)
```

### <a id="TestReplaceAllLiteral" href="#TestReplaceAllLiteral">func TestReplaceAllLiteral(t *testing.T)</a>

```
searchKey: regexp.TestReplaceAllLiteral
tags: [function private test]
```

```Go
func TestReplaceAllLiteral(t *testing.T)
```

### <a id="TestRunOnePass" href="#TestRunOnePass">func TestRunOnePass(t *testing.T)</a>

```
searchKey: regexp.TestRunOnePass
tags: [function private test]
```

```Go
func TestRunOnePass(t *testing.T)
```

### <a id="TestSplit" href="#TestSplit">func TestSplit(t *testing.T)</a>

```
searchKey: regexp.TestSplit
tags: [function private test]
```

```Go
func TestSplit(t *testing.T)
```

### <a id="TestSubexp" href="#TestSubexp">func TestSubexp(t *testing.T)</a>

```
searchKey: regexp.TestSubexp
tags: [function private test]
```

```Go
func TestSubexp(t *testing.T)
```

### <a id="TestSwitchBacktrack" href="#TestSwitchBacktrack">func TestSwitchBacktrack(t *testing.T)</a>

```
searchKey: regexp.TestSwitchBacktrack
tags: [function private test]
```

```Go
func TestSwitchBacktrack(t *testing.T)
```

Check that the same machine can be used with the standard matcher and then the backtracker when there are no captures. 

### <a id="build" href="#build">func build(n int, x ...int) [][]int</a>

```
searchKey: regexp.build
tags: [function private]
```

```Go
func build(n int, x ...int) [][]int
```

build is a helper to construct a [][]int by extracting n sequences from x. This represents n matches with len(x)/n submatches each. 

### <a id="cleanupOnePass" href="#cleanupOnePass">func cleanupOnePass(prog *onePassProg, original *syntax.Prog)</a>

```
searchKey: regexp.cleanupOnePass
tags: [function private]
```

```Go
func cleanupOnePass(prog *onePassProg, original *syntax.Prog)
```

cleanupOnePass drops working memory, and restores certain shortcut instructions. 

### <a id="copyMatchTest" href="#copyMatchTest">func copyMatchTest(t *testing.T, test *FindTest)</a>

```
searchKey: regexp.copyMatchTest
tags: [function private]
```

```Go
func copyMatchTest(t *testing.T, test *FindTest)
```

### <a id="extract" href="#extract">func extract(str string) (name string, num int, rest string, ok bool)</a>

```
searchKey: regexp.extract
tags: [function private]
```

```Go
func extract(str string) (name string, num int, rest string, ok bool)
```

extract returns the name from a leading "$name" or "${name}" in str. If it is a number, extract returns num set to that number; otherwise num = -1. 

### <a id="freeBitState" href="#freeBitState">func freeBitState(b *bitState)</a>

```
searchKey: regexp.freeBitState
tags: [function private]
```

```Go
func freeBitState(b *bitState)
```

### <a id="freeOnePassMachine" href="#freeOnePassMachine">func freeOnePassMachine(m *onePassMachine)</a>

```
searchKey: regexp.freeOnePassMachine
tags: [function private]
```

```Go
func freeOnePassMachine(m *onePassMachine)
```

### <a id="init.regexp.go" href="#init.regexp.go">func init()</a>

```
searchKey: regexp.init
tags: [function private]
```

```Go
func init()
```

### <a id="iop" href="#iop">func iop(i *syntax.Inst) syntax.InstOp</a>

```
searchKey: regexp.iop
tags: [function private]
```

```Go
func iop(i *syntax.Inst) syntax.InstOp
```

### <a id="isSingleBytes" href="#isSingleBytes">func isSingleBytes(s string) bool</a>

```
searchKey: regexp.isSingleBytes
tags: [function private]
```

```Go
func isSingleBytes(s string) bool
```

### <a id="makeText" href="#makeText">func makeText(n int) []byte</a>

```
searchKey: regexp.makeText
tags: [function private]
```

```Go
func makeText(n int) []byte
```

### <a id="matchFull" href="#matchFull">func matchFull(re, refull *Regexp, text string) (bool, string)</a>

```
searchKey: regexp.matchFull
tags: [function private]
```

```Go
func matchFull(re, refull *Regexp, text string) (bool, string)
```

### <a id="matchFullLongest" href="#matchFullLongest">func matchFullLongest(re, refull *Regexp, text string) (bool, string)</a>

```
searchKey: regexp.matchFullLongest
tags: [function private]
```

```Go
func matchFullLongest(re, refull *Regexp, text string) (bool, string)
```

### <a id="matchFunctionTest" href="#matchFunctionTest">func matchFunctionTest(t *testing.T, test *FindTest)</a>

```
searchKey: regexp.matchFunctionTest
tags: [function private]
```

```Go
func matchFunctionTest(t *testing.T, test *FindTest)
```

### <a id="matchPartial" href="#matchPartial">func matchPartial(re, refull *Regexp, text string) (bool, string)</a>

```
searchKey: regexp.matchPartial
tags: [function private]
```

```Go
func matchPartial(re, refull *Regexp, text string) (bool, string)
```

### <a id="matchPartialLongest" href="#matchPartialLongest">func matchPartialLongest(re, refull *Regexp, text string) (bool, string)</a>

```
searchKey: regexp.matchPartialLongest
tags: [function private]
```

```Go
func matchPartialLongest(re, refull *Regexp, text string) (bool, string)
```

### <a id="matchTest" href="#matchTest">func matchTest(t *testing.T, test *FindTest)</a>

```
searchKey: regexp.matchTest
tags: [function private]
```

```Go
func matchTest(t *testing.T, test *FindTest)
```

### <a id="maxBitStateLen" href="#maxBitStateLen">func maxBitStateLen(prog *syntax.Prog) int</a>

```
searchKey: regexp.maxBitStateLen
tags: [function private]
```

```Go
func maxBitStateLen(prog *syntax.Prog) int
```

maxBitStateLen returns the maximum length of a string to search with the backtracker using prog. 

### <a id="mergeRuneSets" href="#mergeRuneSets">func mergeRuneSets(leftRunes, rightRunes *[]rune, leftPC, rightPC uint32) ([]rune, []uint32)</a>

```
searchKey: regexp.mergeRuneSets
tags: [function private]
```

```Go
func mergeRuneSets(leftRunes, rightRunes *[]rune, leftPC, rightPC uint32) ([]rune, []uint32)
```

### <a id="minInputLen" href="#minInputLen">func minInputLen(re *syntax.Regexp) int</a>

```
searchKey: regexp.minInputLen
tags: [function private]
```

```Go
func minInputLen(re *syntax.Regexp) int
```

minInputLen walks the regexp to find the minimum length of any matchable input 

### <a id="onePassNext" href="#onePassNext">func onePassNext(i *onePassInst, r rune) uint32</a>

```
searchKey: regexp.onePassNext
tags: [function private]
```

```Go
func onePassNext(i *onePassInst, r rune) uint32
```

OnePassNext selects the next actionable state of the prog, based on the input character. It should only be called when i.Op == InstAlt or InstAltMatch, and from the one-pass machine. One of the alternates may ultimately lead without input to end of line. If the instruction is InstAltMatch the path to the InstMatch is in i.Out, the normal node in i.Next. 

### <a id="onePassPrefix" href="#onePassPrefix">func onePassPrefix(p *syntax.Prog) (prefix string, complete bool, pc uint32)</a>

```
searchKey: regexp.onePassPrefix
tags: [function private]
```

```Go
func onePassPrefix(p *syntax.Prog) (prefix string, complete bool, pc uint32)
```

OnePassPrefix returns a literal string that all matches for the regexp must start with. Complete is true if the prefix is the entire match. Pc is the index of the last rune instruction in the string. The OnePassPrefix skips over the mandatory EmptyBeginText 

### <a id="parseFowlerResult" href="#parseFowlerResult">func parseFowlerResult(s string) (ok, compiled, matched bool, pos []int)</a>

```
searchKey: regexp.parseFowlerResult
tags: [function private]
```

```Go
func parseFowlerResult(s string) (ok, compiled, matched bool, pos []int)
```

### <a id="parseResult" href="#parseResult">func parseResult(t *testing.T, file string, lineno int, res string) []int</a>

```
searchKey: regexp.parseResult
tags: [function private]
```

```Go
func parseResult(t *testing.T, file string, lineno int, res string) []int
```

### <a id="quote" href="#quote">func quote(s string) string</a>

```
searchKey: regexp.quote
tags: [function private]
```

```Go
func quote(s string) string
```

### <a id="runFull" href="#runFull">func runFull(re, refull *Regexp, text string) ([]int, string)</a>

```
searchKey: regexp.runFull
tags: [function private]
```

```Go
func runFull(re, refull *Regexp, text string) ([]int, string)
```

### <a id="runFullLongest" href="#runFullLongest">func runFullLongest(re, refull *Regexp, text string) ([]int, string)</a>

```
searchKey: regexp.runFullLongest
tags: [function private]
```

```Go
func runFullLongest(re, refull *Regexp, text string) ([]int, string)
```

### <a id="runPartial" href="#runPartial">func runPartial(re, refull *Regexp, text string) ([]int, string)</a>

```
searchKey: regexp.runPartial
tags: [function private]
```

```Go
func runPartial(re, refull *Regexp, text string) ([]int, string)
```

### <a id="runPartialLongest" href="#runPartialLongest">func runPartialLongest(re, refull *Regexp, text string) ([]int, string)</a>

```
searchKey: regexp.runPartialLongest
tags: [function private]
```

```Go
func runPartialLongest(re, refull *Regexp, text string) ([]int, string)
```

### <a id="same" href="#same">func same(x, y []int) bool</a>

```
searchKey: regexp.same
tags: [function private]
```

```Go
func same(x, y []int) bool
```

### <a id="shouldBacktrack" href="#shouldBacktrack">func shouldBacktrack(prog *syntax.Prog) bool</a>

```
searchKey: regexp.shouldBacktrack
tags: [function private]
```

```Go
func shouldBacktrack(prog *syntax.Prog) bool
```

shouldBacktrack reports whether the program is too long for the backtracker to run. 

### <a id="special" href="#special">func special(b byte) bool</a>

```
searchKey: regexp.special
tags: [function private]
```

```Go
func special(b byte) bool
```

special reports whether byte b needs to be escaped by QuoteMeta. 

### <a id="testFindAllIndex" href="#testFindAllIndex">func testFindAllIndex(test *FindTest, result [][]int, t *testing.T)</a>

```
searchKey: regexp.testFindAllIndex
tags: [function private]
```

```Go
func testFindAllIndex(test *FindTest, result [][]int, t *testing.T)
```

### <a id="testFindAllSubmatchIndex" href="#testFindAllSubmatchIndex">func testFindAllSubmatchIndex(test *FindTest, result [][]int, t *testing.T)</a>

```
searchKey: regexp.testFindAllSubmatchIndex
tags: [function private]
```

```Go
func testFindAllSubmatchIndex(test *FindTest, result [][]int, t *testing.T)
```

### <a id="testFindIndex" href="#testFindIndex">func testFindIndex(test *FindTest, result []int, t *testing.T)</a>

```
searchKey: regexp.testFindIndex
tags: [function private]
```

```Go
func testFindIndex(test *FindTest, result []int, t *testing.T)
```

### <a id="testFindSubmatchIndex" href="#testFindSubmatchIndex">func testFindSubmatchIndex(test *FindTest, result []int, t *testing.T)</a>

```
searchKey: regexp.testFindSubmatchIndex
tags: [function private]
```

```Go
func testFindSubmatchIndex(test *FindTest, result []int, t *testing.T)
```

### <a id="testFowler" href="#testFowler">func testFowler(t *testing.T, file string)</a>

```
searchKey: regexp.testFowler
tags: [function private]
```

```Go
func testFowler(t *testing.T, file string)
```

### <a id="testRE2" href="#testRE2">func testRE2(t *testing.T, file string)</a>

```
searchKey: regexp.testRE2
tags: [function private]
```

```Go
func testRE2(t *testing.T, file string)
```

### <a id="testSubmatchBytes" href="#testSubmatchBytes">func testSubmatchBytes(test *FindTest, n int, submatches []int, result [][]byte, t *testing.T)</a>

```
searchKey: regexp.testSubmatchBytes
tags: [function private]
```

```Go
func testSubmatchBytes(test *FindTest, n int, submatches []int, result [][]byte, t *testing.T)
```

### <a id="testSubmatchIndices" href="#testSubmatchIndices">func testSubmatchIndices(test *FindTest, n int, expect, result []int, t *testing.T)</a>

```
searchKey: regexp.testSubmatchIndices
tags: [function private]
```

```Go
func testSubmatchIndices(test *FindTest, n int, expect, result []int, t *testing.T)
```

### <a id="testSubmatchString" href="#testSubmatchString">func testSubmatchString(test *FindTest, n int, submatches []int, result []string, t *testing.T)</a>

```
searchKey: regexp.testSubmatchString
tags: [function private]
```

```Go
func testSubmatchString(test *FindTest, n int, submatches []int, result []string, t *testing.T)
```

