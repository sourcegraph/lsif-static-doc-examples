# Package utf8

Package utf8 implements functions and constants to support text encoded in UTF-8. It includes functions to translate between runes and UTF-8 byte sequences. See [https://en.wikipedia.org/wiki/UTF-8](https://en.wikipedia.org/wiki/UTF-8) 

## Index

* [Constants](#const)
    * [const MaxRune](#MaxRune)
    * [const RuneError](#RuneError)
    * [const RuneSelf](#RuneSelf)
    * [const UTFMax](#UTFMax)
    * [const as](#as)
    * [const hicb](#hicb)
    * [const locb](#locb)
    * [const mask2](#mask2)
    * [const mask3](#mask3)
    * [const mask4](#mask4)
    * [const maskx](#maskx)
    * [const rune1Max](#rune1Max)
    * [const rune2Max](#rune2Max)
    * [const rune3Max](#rune3Max)
    * [const s1](#s1)
    * [const s2](#s2)
    * [const s3](#s3)
    * [const s4](#s4)
    * [const s5](#s5)
    * [const s6](#s6)
    * [const s7](#s7)
    * [const surrogateMax](#surrogateMax)
    * [const surrogateMin](#surrogateMin)
    * [const t1](#t1)
    * [const t2](#t2)
    * [const t3](#t3)
    * [const t4](#t4)
    * [const t5](#t5)
    * [const tx](#tx)
    * [const xx](#xx)
* [Variables](#var)
    * [var acceptRanges](#acceptRanges)
    * [var first](#first)
* [Types](#type)
    * [type acceptRange struct](#acceptRange)
* [Functions](#func)
    * [func DecodeLastRune(p []byte) (r rune, size int)](#DecodeLastRune)
    * [func DecodeLastRuneInString(s string) (r rune, size int)](#DecodeLastRuneInString)
    * [func DecodeRune(p []byte) (r rune, size int)](#DecodeRune)
    * [func DecodeRuneInString(s string) (r rune, size int)](#DecodeRuneInString)
    * [func EncodeRune(p []byte, r rune) int](#EncodeRune)
    * [func FullRune(p []byte) bool](#FullRune)
    * [func FullRuneInString(s string) bool](#FullRuneInString)
    * [func RuneCount(p []byte) int](#RuneCount)
    * [func RuneCountInString(s string) (n int)](#RuneCountInString)
    * [func RuneLen(r rune) int](#RuneLen)
    * [func RuneStart(b byte) bool](#RuneStart)
    * [func Valid(p []byte) bool](#Valid)
    * [func ValidRune(r rune) bool](#ValidRune)
    * [func ValidString(s string) bool](#ValidString)


## <a id="const" href="#const">Constants</a>

```
tags: [package]
```

### <a id="MaxRune" href="#MaxRune">const MaxRune</a>

```
searchKey: utf8.MaxRune
tags: [constant number]
```

```Go
const MaxRune = '\U0010FFFF' // Maximum valid Unicode code point.

```

Numbers fundamental to the encoding. 

### <a id="RuneError" href="#RuneError">const RuneError</a>

```
searchKey: utf8.RuneError
tags: [constant number]
```

```Go
const RuneError = '\uFFFD' // the "error" Rune or "Unicode replacement character"

```

Numbers fundamental to the encoding. 

### <a id="RuneSelf" href="#RuneSelf">const RuneSelf</a>

```
searchKey: utf8.RuneSelf
tags: [constant number]
```

```Go
const RuneSelf = 0x80 // characters below RuneSelf are represented as themselves in a single byte.

```

Numbers fundamental to the encoding. 

### <a id="UTFMax" href="#UTFMax">const UTFMax</a>

```
searchKey: utf8.UTFMax
tags: [constant number]
```

```Go
const UTFMax = 4 // maximum number of bytes of a UTF-8 encoded Unicode character.

```

Numbers fundamental to the encoding. 

### <a id="as" href="#as">const as</a>

```
searchKey: utf8.as
tags: [constant number private]
```

```Go
const as = 0xF0 // ASCII: size 1

```

### <a id="hicb" href="#hicb">const hicb</a>

```
searchKey: utf8.hicb
tags: [constant number private]
```

```Go
const hicb = 0b10111111
```

### <a id="locb" href="#locb">const locb</a>

```
searchKey: utf8.locb
tags: [constant number private]
```

```Go
const locb = 0b10000000
```

The default lowest and highest continuation byte. 

### <a id="mask2" href="#mask2">const mask2</a>

```
searchKey: utf8.mask2
tags: [constant number private]
```

```Go
const mask2 = 0b00011111
```

### <a id="mask3" href="#mask3">const mask3</a>

```
searchKey: utf8.mask3
tags: [constant number private]
```

```Go
const mask3 = 0b00001111
```

### <a id="mask4" href="#mask4">const mask4</a>

```
searchKey: utf8.mask4
tags: [constant number private]
```

```Go
const mask4 = 0b00000111
```

### <a id="maskx" href="#maskx">const maskx</a>

```
searchKey: utf8.maskx
tags: [constant number private]
```

```Go
const maskx = 0b00111111
```

### <a id="rune1Max" href="#rune1Max">const rune1Max</a>

```
searchKey: utf8.rune1Max
tags: [constant number private]
```

```Go
const rune1Max = 1<<7 - 1
```

### <a id="rune2Max" href="#rune2Max">const rune2Max</a>

```
searchKey: utf8.rune2Max
tags: [constant number private]
```

```Go
const rune2Max = 1<<11 - 1
```

### <a id="rune3Max" href="#rune3Max">const rune3Max</a>

```
searchKey: utf8.rune3Max
tags: [constant number private]
```

```Go
const rune3Max = 1<<16 - 1
```

### <a id="s1" href="#s1">const s1</a>

```
searchKey: utf8.s1
tags: [constant number private]
```

```Go
const s1 = 0x02 // accept 0, size 2

```

### <a id="s2" href="#s2">const s2</a>

```
searchKey: utf8.s2
tags: [constant number private]
```

```Go
const s2 = 0x13 // accept 1, size 3

```

### <a id="s3" href="#s3">const s3</a>

```
searchKey: utf8.s3
tags: [constant number private]
```

```Go
const s3 = 0x03 // accept 0, size 3

```

### <a id="s4" href="#s4">const s4</a>

```
searchKey: utf8.s4
tags: [constant number private]
```

```Go
const s4 = 0x23 // accept 2, size 3

```

### <a id="s5" href="#s5">const s5</a>

```
searchKey: utf8.s5
tags: [constant number private]
```

```Go
const s5 = 0x34 // accept 3, size 4

```

### <a id="s6" href="#s6">const s6</a>

```
searchKey: utf8.s6
tags: [constant number private]
```

```Go
const s6 = 0x04 // accept 0, size 4

```

### <a id="s7" href="#s7">const s7</a>

```
searchKey: utf8.s7
tags: [constant number private]
```

```Go
const s7 = 0x44 // accept 4, size 4

```

### <a id="surrogateMax" href="#surrogateMax">const surrogateMax</a>

```
searchKey: utf8.surrogateMax
tags: [constant number private]
```

```Go
const surrogateMax = 0xDFFF
```

Code points in the surrogate range are not valid for UTF-8. 

### <a id="surrogateMin" href="#surrogateMin">const surrogateMin</a>

```
searchKey: utf8.surrogateMin
tags: [constant number private]
```

```Go
const surrogateMin = 0xD800
```

Code points in the surrogate range are not valid for UTF-8. 

### <a id="t1" href="#t1">const t1</a>

```
searchKey: utf8.t1
tags: [constant number private]
```

```Go
const t1 = 0b00000000
```

### <a id="t2" href="#t2">const t2</a>

```
searchKey: utf8.t2
tags: [constant number private]
```

```Go
const t2 = 0b11000000
```

### <a id="t3" href="#t3">const t3</a>

```
searchKey: utf8.t3
tags: [constant number private]
```

```Go
const t3 = 0b11100000
```

### <a id="t4" href="#t4">const t4</a>

```
searchKey: utf8.t4
tags: [constant number private]
```

```Go
const t4 = 0b11110000
```

### <a id="t5" href="#t5">const t5</a>

```
searchKey: utf8.t5
tags: [constant number private]
```

```Go
const t5 = 0b11111000
```

### <a id="tx" href="#tx">const tx</a>

```
searchKey: utf8.tx
tags: [constant number private]
```

```Go
const tx = 0b10000000
```

### <a id="xx" href="#xx">const xx</a>

```
searchKey: utf8.xx
tags: [constant number private]
```

```Go
const xx = 0xF1 // invalid: size 1

```

These names of these constants are chosen to give nice alignment in the table below. The first nibble is an index into acceptRanges or F for special one-byte cases. The second nibble is the Rune length or the Status for the special one-byte case. 

## <a id="var" href="#var">Variables</a>

```
tags: [package]
```

### <a id="acceptRanges" href="#acceptRanges">var acceptRanges</a>

```
searchKey: utf8.acceptRanges
tags: [variable array struct private]
```

```Go
var acceptRanges = ...
```

acceptRanges has size 16 to avoid bounds checks in the code that uses it. 

### <a id="first" href="#first">var first</a>

```
searchKey: utf8.first
tags: [variable array number private]
```

```Go
var first = ...
```

first is information about the first byte in a UTF-8 sequence. 

## <a id="type" href="#type">Types</a>

```
tags: [package]
```

### <a id="acceptRange" href="#acceptRange">type acceptRange struct</a>

```
searchKey: utf8.acceptRange
tags: [struct private]
```

```Go
type acceptRange struct {
	lo uint8 // lowest value for second byte.
	hi uint8 // highest value for second byte.
}
```

acceptRange gives the range of valid values for the second byte in a UTF-8 sequence. 

## <a id="func" href="#func">Functions</a>

```
tags: [package]
```

### <a id="DecodeLastRune" href="#DecodeLastRune">func DecodeLastRune(p []byte) (r rune, size int)</a>

```
searchKey: utf8.DecodeLastRune
tags: [method]
```

```Go
func DecodeLastRune(p []byte) (r rune, size int)
```

DecodeLastRune unpacks the last UTF-8 encoding in p and returns the rune and its width in bytes. If p is empty it returns (RuneError, 0). Otherwise, if the encoding is invalid, it returns (RuneError, 1). Both are impossible results for correct, non-empty UTF-8. 

An encoding is invalid if it is incorrect UTF-8, encodes a rune that is out of range, or is not the shortest possible UTF-8 encoding for the value. No other validation is performed. 

### <a id="DecodeLastRuneInString" href="#DecodeLastRuneInString">func DecodeLastRuneInString(s string) (r rune, size int)</a>

```
searchKey: utf8.DecodeLastRuneInString
tags: [method]
```

```Go
func DecodeLastRuneInString(s string) (r rune, size int)
```

DecodeLastRuneInString is like DecodeLastRune but its input is a string. If s is empty it returns (RuneError, 0). Otherwise, if the encoding is invalid, it returns (RuneError, 1). Both are impossible results for correct, non-empty UTF-8. 

An encoding is invalid if it is incorrect UTF-8, encodes a rune that is out of range, or is not the shortest possible UTF-8 encoding for the value. No other validation is performed. 

### <a id="DecodeRune" href="#DecodeRune">func DecodeRune(p []byte) (r rune, size int)</a>

```
searchKey: utf8.DecodeRune
tags: [method]
```

```Go
func DecodeRune(p []byte) (r rune, size int)
```

DecodeRune unpacks the first UTF-8 encoding in p and returns the rune and its width in bytes. If p is empty it returns (RuneError, 0). Otherwise, if the encoding is invalid, it returns (RuneError, 1). Both are impossible results for correct, non-empty UTF-8. 

An encoding is invalid if it is incorrect UTF-8, encodes a rune that is out of range, or is not the shortest possible UTF-8 encoding for the value. No other validation is performed. 

### <a id="DecodeRuneInString" href="#DecodeRuneInString">func DecodeRuneInString(s string) (r rune, size int)</a>

```
searchKey: utf8.DecodeRuneInString
tags: [method]
```

```Go
func DecodeRuneInString(s string) (r rune, size int)
```

DecodeRuneInString is like DecodeRune but its input is a string. If s is empty it returns (RuneError, 0). Otherwise, if the encoding is invalid, it returns (RuneError, 1). Both are impossible results for correct, non-empty UTF-8. 

An encoding is invalid if it is incorrect UTF-8, encodes a rune that is out of range, or is not the shortest possible UTF-8 encoding for the value. No other validation is performed. 

### <a id="EncodeRune" href="#EncodeRune">func EncodeRune(p []byte, r rune) int</a>

```
searchKey: utf8.EncodeRune
tags: [method]
```

```Go
func EncodeRune(p []byte, r rune) int
```

EncodeRune writes into p (which must be large enough) the UTF-8 encoding of the rune. If the rune is out of range, it writes the encoding of RuneError. It returns the number of bytes written. 

### <a id="FullRune" href="#FullRune">func FullRune(p []byte) bool</a>

```
searchKey: utf8.FullRune
tags: [method]
```

```Go
func FullRune(p []byte) bool
```

FullRune reports whether the bytes in p begin with a full UTF-8 encoding of a rune. An invalid encoding is considered a full Rune since it will convert as a width-1 error rune. 

### <a id="FullRuneInString" href="#FullRuneInString">func FullRuneInString(s string) bool</a>

```
searchKey: utf8.FullRuneInString
tags: [method]
```

```Go
func FullRuneInString(s string) bool
```

FullRuneInString is like FullRune but its input is a string. 

### <a id="RuneCount" href="#RuneCount">func RuneCount(p []byte) int</a>

```
searchKey: utf8.RuneCount
tags: [method]
```

```Go
func RuneCount(p []byte) int
```

RuneCount returns the number of runes in p. Erroneous and short encodings are treated as single runes of width 1 byte. 

### <a id="RuneCountInString" href="#RuneCountInString">func RuneCountInString(s string) (n int)</a>

```
searchKey: utf8.RuneCountInString
tags: [method]
```

```Go
func RuneCountInString(s string) (n int)
```

RuneCountInString is like RuneCount but its input is a string. 

### <a id="RuneLen" href="#RuneLen">func RuneLen(r rune) int</a>

```
searchKey: utf8.RuneLen
tags: [method]
```

```Go
func RuneLen(r rune) int
```

RuneLen returns the number of bytes required to encode the rune. It returns -1 if the rune is not a valid value to encode in UTF-8. 

### <a id="RuneStart" href="#RuneStart">func RuneStart(b byte) bool</a>

```
searchKey: utf8.RuneStart
tags: [method]
```

```Go
func RuneStart(b byte) bool
```

RuneStart reports whether the byte could be the first byte of an encoded, possibly invalid rune. Second and subsequent bytes always have the top two bits set to 10. 

### <a id="Valid" href="#Valid">func Valid(p []byte) bool</a>

```
searchKey: utf8.Valid
tags: [method]
```

```Go
func Valid(p []byte) bool
```

Valid reports whether p consists entirely of valid UTF-8-encoded runes. 

### <a id="ValidRune" href="#ValidRune">func ValidRune(r rune) bool</a>

```
searchKey: utf8.ValidRune
tags: [method]
```

```Go
func ValidRune(r rune) bool
```

ValidRune reports whether r can be legally encoded as UTF-8. Code points that are out of range or a surrogate half are illegal. 

### <a id="ValidString" href="#ValidString">func ValidString(s string) bool</a>

```
searchKey: utf8.ValidString
tags: [method]
```

```Go
func ValidString(s string) bool
```

ValidString reports whether s consists entirely of valid UTF-8-encoded runes. 

