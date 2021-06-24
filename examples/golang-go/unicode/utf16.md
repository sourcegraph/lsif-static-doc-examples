# Package utf16

Package utf16 implements encoding and decoding of UTF-16 sequences. 

## Index

* [Constants](#const)
    * [const MaxRune](#MaxRune)
    * [const ReplacementChar](#ReplacementChar)
    * [const maxRune](#maxRune)
    * [const replacementChar](#replacementChar)
    * [const surr1](#surr1)
    * [const surr2](#surr2)
    * [const surr3](#surr3)
    * [const surrSelf](#surrSelf)
* [Functions](#func)
    * [func Decode(s []uint16) []rune](#Decode)
    * [func DecodeRune(r1, r2 rune) rune](#DecodeRune)
    * [func Encode(s []rune) []uint16](#Encode)
    * [func EncodeRune(r rune) (r1, r2 rune)](#EncodeRune)
    * [func IsSurrogate(r rune) bool](#IsSurrogate)


## <a id="const" href="#const">Constants</a>

```
tags: [package]
```

### <a id="MaxRune" href="#MaxRune">const MaxRune</a>

```
searchKey: utf16.MaxRune
tags: [constant number private]
```

```Go
const MaxRune = maxRune
```

Extra names for constants so we can validate them during testing. 

### <a id="ReplacementChar" href="#ReplacementChar">const ReplacementChar</a>

```
searchKey: utf16.ReplacementChar
tags: [constant number private]
```

```Go
const ReplacementChar = replacementChar
```

Extra names for constants so we can validate them during testing. 

### <a id="maxRune" href="#maxRune">const maxRune</a>

```
searchKey: utf16.maxRune
tags: [constant number private]
```

```Go
const maxRune = '\U0010FFFF' // Maximum valid Unicode code point.

```

### <a id="replacementChar" href="#replacementChar">const replacementChar</a>

```
searchKey: utf16.replacementChar
tags: [constant number private]
```

```Go
const replacementChar = '\uFFFD' // Unicode replacement character

```

### <a id="surr1" href="#surr1">const surr1</a>

```
searchKey: utf16.surr1
tags: [constant number private]
```

```Go
const surr1 = 0xd800
```

0xd800-0xdc00 encodes the high 10 bits of a pair. 0xdc00-0xe000 encodes the low 10 bits of a pair. the value is those 20 bits plus 0x10000. 

### <a id="surr2" href="#surr2">const surr2</a>

```
searchKey: utf16.surr2
tags: [constant number private]
```

```Go
const surr2 = 0xdc00
```

### <a id="surr3" href="#surr3">const surr3</a>

```
searchKey: utf16.surr3
tags: [constant number private]
```

```Go
const surr3 = 0xe000
```

### <a id="surrSelf" href="#surrSelf">const surrSelf</a>

```
searchKey: utf16.surrSelf
tags: [constant number private]
```

```Go
const surrSelf = 0x10000
```

## <a id="func" href="#func">Functions</a>

```
tags: [package]
```

### <a id="Decode" href="#Decode">func Decode(s []uint16) []rune</a>

```
searchKey: utf16.Decode
tags: [method]
```

```Go
func Decode(s []uint16) []rune
```

Decode returns the Unicode code point sequence represented by the UTF-16 encoding s. 

### <a id="DecodeRune" href="#DecodeRune">func DecodeRune(r1, r2 rune) rune</a>

```
searchKey: utf16.DecodeRune
tags: [method]
```

```Go
func DecodeRune(r1, r2 rune) rune
```

DecodeRune returns the UTF-16 decoding of a surrogate pair. If the pair is not a valid UTF-16 surrogate pair, DecodeRune returns the Unicode replacement code point U+FFFD. 

### <a id="Encode" href="#Encode">func Encode(s []rune) []uint16</a>

```
searchKey: utf16.Encode
tags: [method]
```

```Go
func Encode(s []rune) []uint16
```

Encode returns the UTF-16 encoding of the Unicode code point sequence s. 

### <a id="EncodeRune" href="#EncodeRune">func EncodeRune(r rune) (r1, r2 rune)</a>

```
searchKey: utf16.EncodeRune
tags: [method]
```

```Go
func EncodeRune(r rune) (r1, r2 rune)
```

EncodeRune returns the UTF-16 surrogate pair r1, r2 for the given rune. If the rune is not a valid Unicode code point or does not need encoding, EncodeRune returns U+FFFD, U+FFFD. 

### <a id="IsSurrogate" href="#IsSurrogate">func IsSurrogate(r rune) bool</a>

```
searchKey: utf16.IsSurrogate
tags: [method]
```

```Go
func IsSurrogate(r rune) bool
```

IsSurrogate reports whether the specified Unicode code point can appear in a surrogate pair. 

