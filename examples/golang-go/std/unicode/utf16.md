# Package utf16

Package utf16 implements encoding and decoding of UTF-16 sequences. 

## Index

* [Constants](#const)
    * [const replacementChar](#replacementChar)
    * [const maxRune](#maxRune)
    * [const surr1](#surr1)
    * [const surr2](#surr2)
    * [const surr3](#surr3)
    * [const surrSelf](#surrSelf)
    * [const MaxRune](#MaxRune)
    * [const ReplacementChar](#ReplacementChar)
* [Functions](#func)
    * [func IsSurrogate(r rune) bool](#IsSurrogate)
    * [func DecodeRune(r1, r2 rune) rune](#DecodeRune)
    * [func EncodeRune(r rune) (r1, r2 rune)](#EncodeRune)
    * [func Encode(s []rune) []uint16](#Encode)
    * [func Decode(s []uint16) []rune](#Decode)


## <a id="const" href="#const">Constants</a>

```
tags: [exported]
```

### <a id="replacementChar" href="#replacementChar">const replacementChar</a>

```
searchKey: utf16.replacementChar
```

```Go
const replacementChar = '\uFFFD' // Unicode replacement character

```

### <a id="maxRune" href="#maxRune">const maxRune</a>

```
searchKey: utf16.maxRune
```

```Go
const maxRune = '\U0010FFFF' // Maximum valid Unicode code point.

```

### <a id="surr1" href="#surr1">const surr1</a>

```
searchKey: utf16.surr1
```

```Go
const surr1 = 0xd800
```

0xd800-0xdc00 encodes the high 10 bits of a pair. 0xdc00-0xe000 encodes the low 10 bits of a pair. the value is those 20 bits plus 0x10000. 

### <a id="surr2" href="#surr2">const surr2</a>

```
searchKey: utf16.surr2
```

```Go
const surr2 = 0xdc00
```

### <a id="surr3" href="#surr3">const surr3</a>

```
searchKey: utf16.surr3
```

```Go
const surr3 = 0xe000
```

### <a id="surrSelf" href="#surrSelf">const surrSelf</a>

```
searchKey: utf16.surrSelf
```

```Go
const surrSelf = 0x10000
```

### <a id="MaxRune" href="#MaxRune">const MaxRune</a>

```
searchKey: utf16.MaxRune
```

```Go
const MaxRune = maxRune
```

Extra names for constants so we can validate them during testing. 

### <a id="ReplacementChar" href="#ReplacementChar">const ReplacementChar</a>

```
searchKey: utf16.ReplacementChar
```

```Go
const ReplacementChar = replacementChar
```

Extra names for constants so we can validate them during testing. 

## <a id="func" href="#func">Functions</a>

```
tags: [exported]
```

### <a id="IsSurrogate" href="#IsSurrogate">func IsSurrogate(r rune) bool</a>

```
searchKey: utf16.IsSurrogate
tags: [exported]
```

```Go
func IsSurrogate(r rune) bool
```

IsSurrogate reports whether the specified Unicode code point can appear in a surrogate pair. 

### <a id="DecodeRune" href="#DecodeRune">func DecodeRune(r1, r2 rune) rune</a>

```
searchKey: utf16.DecodeRune
tags: [exported]
```

```Go
func DecodeRune(r1, r2 rune) rune
```

DecodeRune returns the UTF-16 decoding of a surrogate pair. If the pair is not a valid UTF-16 surrogate pair, DecodeRune returns the Unicode replacement code point U+FFFD. 

### <a id="EncodeRune" href="#EncodeRune">func EncodeRune(r rune) (r1, r2 rune)</a>

```
searchKey: utf16.EncodeRune
tags: [exported]
```

```Go
func EncodeRune(r rune) (r1, r2 rune)
```

EncodeRune returns the UTF-16 surrogate pair r1, r2 for the given rune. If the rune is not a valid Unicode code point or does not need encoding, EncodeRune returns U+FFFD, U+FFFD. 

### <a id="Encode" href="#Encode">func Encode(s []rune) []uint16</a>

```
searchKey: utf16.Encode
tags: [exported]
```

```Go
func Encode(s []rune) []uint16
```

Encode returns the UTF-16 encoding of the Unicode code point sequence s. 

### <a id="Decode" href="#Decode">func Decode(s []uint16) []rune</a>

```
searchKey: utf16.Decode
tags: [exported]
```

```Go
func Decode(s []uint16) []rune
```

Decode returns the Unicode code point sequence represented by the UTF-16 encoding s. 

