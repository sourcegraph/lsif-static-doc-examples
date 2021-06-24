# Package utf16_test

## Index

* [Variables](#var)
    * [var decodeRuneTests](#decodeRuneTests)
    * [var decodeTests](#decodeTests)
    * [var encodeTests](#encodeTests)
    * [var surrogateTests](#surrogateTests)
* [Types](#type)
    * [type decodeTest struct](#decodeTest)
    * [type encodeTest struct](#encodeTest)
* [Functions](#func)
    * [func BenchmarkDecodeRune(b *testing.B)](#BenchmarkDecodeRune)
    * [func BenchmarkDecodeValidASCII(b *testing.B)](#BenchmarkDecodeValidASCII)
    * [func BenchmarkDecodeValidJapaneseChars(b *testing.B)](#BenchmarkDecodeValidJapaneseChars)
    * [func BenchmarkEncodeRune(b *testing.B)](#BenchmarkEncodeRune)
    * [func BenchmarkEncodeValidASCII(b *testing.B)](#BenchmarkEncodeValidASCII)
    * [func BenchmarkEncodeValidJapaneseChars(b *testing.B)](#BenchmarkEncodeValidJapaneseChars)
    * [func TestConstants(t *testing.T)](#TestConstants)
    * [func TestDecode(t *testing.T)](#TestDecode)
    * [func TestDecodeRune(t *testing.T)](#TestDecodeRune)
    * [func TestEncode(t *testing.T)](#TestEncode)
    * [func TestEncodeRune(t *testing.T)](#TestEncodeRune)
    * [func TestIsSurrogate(t *testing.T)](#TestIsSurrogate)


## <a id="var" href="#var">Variables</a>

```
tags: [package private]
```

### <a id="decodeRuneTests" href="#decodeRuneTests">var decodeRuneTests</a>

```
searchKey: utf16_test.decodeRuneTests
tags: [variable array struct private]
```

```Go
var decodeRuneTests = ...
```

### <a id="decodeTests" href="#decodeTests">var decodeTests</a>

```
searchKey: utf16_test.decodeTests
tags: [variable array struct private]
```

```Go
var decodeTests = ...
```

### <a id="encodeTests" href="#encodeTests">var encodeTests</a>

```
searchKey: utf16_test.encodeTests
tags: [variable array struct private]
```

```Go
var encodeTests = ...
```

### <a id="surrogateTests" href="#surrogateTests">var surrogateTests</a>

```
searchKey: utf16_test.surrogateTests
tags: [variable array struct private]
```

```Go
var surrogateTests = ...
```

## <a id="type" href="#type">Types</a>

```
tags: [package private]
```

### <a id="decodeTest" href="#decodeTest">type decodeTest struct</a>

```
searchKey: utf16_test.decodeTest
tags: [struct private]
```

```Go
type decodeTest struct {
	in  []uint16
	out []rune
}
```

### <a id="encodeTest" href="#encodeTest">type encodeTest struct</a>

```
searchKey: utf16_test.encodeTest
tags: [struct private]
```

```Go
type encodeTest struct {
	in  []rune
	out []uint16
}
```

## <a id="func" href="#func">Functions</a>

```
tags: [package private]
```

### <a id="BenchmarkDecodeRune" href="#BenchmarkDecodeRune">func BenchmarkDecodeRune(b *testing.B)</a>

```
searchKey: utf16_test.BenchmarkDecodeRune
tags: [method private benchmark]
```

```Go
func BenchmarkDecodeRune(b *testing.B)
```

### <a id="BenchmarkDecodeValidASCII" href="#BenchmarkDecodeValidASCII">func BenchmarkDecodeValidASCII(b *testing.B)</a>

```
searchKey: utf16_test.BenchmarkDecodeValidASCII
tags: [method private benchmark]
```

```Go
func BenchmarkDecodeValidASCII(b *testing.B)
```

### <a id="BenchmarkDecodeValidJapaneseChars" href="#BenchmarkDecodeValidJapaneseChars">func BenchmarkDecodeValidJapaneseChars(b *testing.B)</a>

```
searchKey: utf16_test.BenchmarkDecodeValidJapaneseChars
tags: [method private benchmark]
```

```Go
func BenchmarkDecodeValidJapaneseChars(b *testing.B)
```

### <a id="BenchmarkEncodeRune" href="#BenchmarkEncodeRune">func BenchmarkEncodeRune(b *testing.B)</a>

```
searchKey: utf16_test.BenchmarkEncodeRune
tags: [method private benchmark]
```

```Go
func BenchmarkEncodeRune(b *testing.B)
```

### <a id="BenchmarkEncodeValidASCII" href="#BenchmarkEncodeValidASCII">func BenchmarkEncodeValidASCII(b *testing.B)</a>

```
searchKey: utf16_test.BenchmarkEncodeValidASCII
tags: [method private benchmark]
```

```Go
func BenchmarkEncodeValidASCII(b *testing.B)
```

### <a id="BenchmarkEncodeValidJapaneseChars" href="#BenchmarkEncodeValidJapaneseChars">func BenchmarkEncodeValidJapaneseChars(b *testing.B)</a>

```
searchKey: utf16_test.BenchmarkEncodeValidJapaneseChars
tags: [method private benchmark]
```

```Go
func BenchmarkEncodeValidJapaneseChars(b *testing.B)
```

### <a id="TestConstants" href="#TestConstants">func TestConstants(t *testing.T)</a>

```
searchKey: utf16_test.TestConstants
tags: [method private test]
```

```Go
func TestConstants(t *testing.T)
```

Validate the constants redefined from unicode. 

### <a id="TestDecode" href="#TestDecode">func TestDecode(t *testing.T)</a>

```
searchKey: utf16_test.TestDecode
tags: [method private test]
```

```Go
func TestDecode(t *testing.T)
```

### <a id="TestDecodeRune" href="#TestDecodeRune">func TestDecodeRune(t *testing.T)</a>

```
searchKey: utf16_test.TestDecodeRune
tags: [method private test]
```

```Go
func TestDecodeRune(t *testing.T)
```

### <a id="TestEncode" href="#TestEncode">func TestEncode(t *testing.T)</a>

```
searchKey: utf16_test.TestEncode
tags: [method private test]
```

```Go
func TestEncode(t *testing.T)
```

### <a id="TestEncodeRune" href="#TestEncodeRune">func TestEncodeRune(t *testing.T)</a>

```
searchKey: utf16_test.TestEncodeRune
tags: [method private test]
```

```Go
func TestEncodeRune(t *testing.T)
```

### <a id="TestIsSurrogate" href="#TestIsSurrogate">func TestIsSurrogate(t *testing.T)</a>

```
searchKey: utf16_test.TestIsSurrogate
tags: [method private test]
```

```Go
func TestIsSurrogate(t *testing.T)
```

