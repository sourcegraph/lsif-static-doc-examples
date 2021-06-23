# Package utf16_test

## Index

* [Variables](#var)
    * [var encodeTests](#encodeTests)
    * [var decodeTests](#decodeTests)
    * [var decodeRuneTests](#decodeRuneTests)
    * [var surrogateTests](#surrogateTests)
* [Types](#type)
    * [type encodeTest struct](#encodeTest)
    * [type decodeTest struct](#decodeTest)
* [Functions](#func)
    * [func TestConstants(t *testing.T)](#TestConstants)
    * [func TestEncode(t *testing.T)](#TestEncode)
    * [func TestEncodeRune(t *testing.T)](#TestEncodeRune)
    * [func TestDecode(t *testing.T)](#TestDecode)
    * [func TestDecodeRune(t *testing.T)](#TestDecodeRune)
    * [func TestIsSurrogate(t *testing.T)](#TestIsSurrogate)
    * [func BenchmarkDecodeValidASCII(b *testing.B)](#BenchmarkDecodeValidASCII)
    * [func BenchmarkDecodeValidJapaneseChars(b *testing.B)](#BenchmarkDecodeValidJapaneseChars)
    * [func BenchmarkDecodeRune(b *testing.B)](#BenchmarkDecodeRune)
    * [func BenchmarkEncodeValidASCII(b *testing.B)](#BenchmarkEncodeValidASCII)
    * [func BenchmarkEncodeValidJapaneseChars(b *testing.B)](#BenchmarkEncodeValidJapaneseChars)
    * [func BenchmarkEncodeRune(b *testing.B)](#BenchmarkEncodeRune)


## <a id="var" href="#var">Variables</a>

```
tags: [private]
```

### <a id="encodeTests" href="#encodeTests">var encodeTests</a>

```
searchKey: utf16_test.encodeTests
tags: [private]
```

```Go
var encodeTests = ...
```

### <a id="decodeTests" href="#decodeTests">var decodeTests</a>

```
searchKey: utf16_test.decodeTests
tags: [private]
```

```Go
var decodeTests = ...
```

### <a id="decodeRuneTests" href="#decodeRuneTests">var decodeRuneTests</a>

```
searchKey: utf16_test.decodeRuneTests
tags: [private]
```

```Go
var decodeRuneTests = ...
```

### <a id="surrogateTests" href="#surrogateTests">var surrogateTests</a>

```
searchKey: utf16_test.surrogateTests
tags: [private]
```

```Go
var surrogateTests = ...
```

## <a id="type" href="#type">Types</a>

```
tags: [private]
```

### <a id="encodeTest" href="#encodeTest">type encodeTest struct</a>

```
searchKey: utf16_test.encodeTest
tags: [private]
```

```Go
type encodeTest struct {
	in  []rune
	out []uint16
}
```

### <a id="decodeTest" href="#decodeTest">type decodeTest struct</a>

```
searchKey: utf16_test.decodeTest
tags: [private]
```

```Go
type decodeTest struct {
	in  []uint16
	out []rune
}
```

## <a id="func" href="#func">Functions</a>

```
tags: [private]
```

### <a id="TestConstants" href="#TestConstants">func TestConstants(t *testing.T)</a>

```
searchKey: utf16_test.TestConstants
tags: [private]
```

```Go
func TestConstants(t *testing.T)
```

Validate the constants redefined from unicode. 

### <a id="TestEncode" href="#TestEncode">func TestEncode(t *testing.T)</a>

```
searchKey: utf16_test.TestEncode
tags: [private]
```

```Go
func TestEncode(t *testing.T)
```

### <a id="TestEncodeRune" href="#TestEncodeRune">func TestEncodeRune(t *testing.T)</a>

```
searchKey: utf16_test.TestEncodeRune
tags: [private]
```

```Go
func TestEncodeRune(t *testing.T)
```

### <a id="TestDecode" href="#TestDecode">func TestDecode(t *testing.T)</a>

```
searchKey: utf16_test.TestDecode
tags: [private]
```

```Go
func TestDecode(t *testing.T)
```

### <a id="TestDecodeRune" href="#TestDecodeRune">func TestDecodeRune(t *testing.T)</a>

```
searchKey: utf16_test.TestDecodeRune
tags: [private]
```

```Go
func TestDecodeRune(t *testing.T)
```

### <a id="TestIsSurrogate" href="#TestIsSurrogate">func TestIsSurrogate(t *testing.T)</a>

```
searchKey: utf16_test.TestIsSurrogate
tags: [private]
```

```Go
func TestIsSurrogate(t *testing.T)
```

### <a id="BenchmarkDecodeValidASCII" href="#BenchmarkDecodeValidASCII">func BenchmarkDecodeValidASCII(b *testing.B)</a>

```
searchKey: utf16_test.BenchmarkDecodeValidASCII
tags: [private]
```

```Go
func BenchmarkDecodeValidASCII(b *testing.B)
```

### <a id="BenchmarkDecodeValidJapaneseChars" href="#BenchmarkDecodeValidJapaneseChars">func BenchmarkDecodeValidJapaneseChars(b *testing.B)</a>

```
searchKey: utf16_test.BenchmarkDecodeValidJapaneseChars
tags: [private]
```

```Go
func BenchmarkDecodeValidJapaneseChars(b *testing.B)
```

### <a id="BenchmarkDecodeRune" href="#BenchmarkDecodeRune">func BenchmarkDecodeRune(b *testing.B)</a>

```
searchKey: utf16_test.BenchmarkDecodeRune
tags: [private]
```

```Go
func BenchmarkDecodeRune(b *testing.B)
```

### <a id="BenchmarkEncodeValidASCII" href="#BenchmarkEncodeValidASCII">func BenchmarkEncodeValidASCII(b *testing.B)</a>

```
searchKey: utf16_test.BenchmarkEncodeValidASCII
tags: [private]
```

```Go
func BenchmarkEncodeValidASCII(b *testing.B)
```

### <a id="BenchmarkEncodeValidJapaneseChars" href="#BenchmarkEncodeValidJapaneseChars">func BenchmarkEncodeValidJapaneseChars(b *testing.B)</a>

```
searchKey: utf16_test.BenchmarkEncodeValidJapaneseChars
tags: [private]
```

```Go
func BenchmarkEncodeValidJapaneseChars(b *testing.B)
```

### <a id="BenchmarkEncodeRune" href="#BenchmarkEncodeRune">func BenchmarkEncodeRune(b *testing.B)</a>

```
searchKey: utf16_test.BenchmarkEncodeRune
tags: [private]
```

```Go
func BenchmarkEncodeRune(b *testing.B)
```

