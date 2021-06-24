# Package randstring

Package randstring generates random strings. 

Example usage: 

```
s := randstring.NewLen(4) // s is now "apHC"

```
A standard string created by NewLen consists of Latin upper and lowercase letters, and numbers (from the set of 62 allowed characters). 

Functions read from crypto/rand random source, and panic if they fail to read from it. 

This package is adapted (simplified) from Dmitry Chestnykh's uniuri package. 

## Index

* [Variables](#var)
    * [var stdChars](#stdChars)
* [Functions](#func)
    * [func NewLen(length int) string](#NewLen)
    * [func NewLenChars(length int, chars []byte) string](#NewLenChars)
    * [func TestNewLen(t *testing.T)](#TestNewLen)
    * [func TestNewLenChars(t *testing.T)](#TestNewLenChars)
    * [func TestNewLenCharsMaxLength(t *testing.T)](#TestNewLenCharsMaxLength)
    * [func TestNew_unique(t *testing.T)](#TestNew_unique)
    * [func validateChars(t *testing.T, u string, chars []byte)](#validateChars)


## <a id="var" href="#var">Variables</a>

```
tags: [package private]
```

### <a id="stdChars" href="#stdChars">var stdChars</a>

```
searchKey: randstring.stdChars
tags: [variable array number private]
```

```Go
var stdChars = []byte("ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789")
```

stdChars is a set of standard characters allowed in the string. 

## <a id="func" href="#func">Functions</a>

```
tags: [package private]
```

### <a id="NewLen" href="#NewLen">func NewLen(length int) string</a>

```
searchKey: randstring.NewLen
tags: [method]
```

```Go
func NewLen(length int) string
```

NewLen returns a new random string of the provided length, consisting of standard characters. 

### <a id="NewLenChars" href="#NewLenChars">func NewLenChars(length int, chars []byte) string</a>

```
searchKey: randstring.NewLenChars
tags: [method]
```

```Go
func NewLenChars(length int, chars []byte) string
```

NewLenChars returns a new random string of the provided length, consisting of the provided byte slice of allowed characters (maximum 256). 

### <a id="TestNewLen" href="#TestNewLen">func TestNewLen(t *testing.T)</a>

```
searchKey: randstring.TestNewLen
tags: [method private test]
```

```Go
func TestNewLen(t *testing.T)
```

### <a id="TestNewLenChars" href="#TestNewLenChars">func TestNewLenChars(t *testing.T)</a>

```
searchKey: randstring.TestNewLenChars
tags: [method private test]
```

```Go
func TestNewLenChars(t *testing.T)
```

### <a id="TestNewLenCharsMaxLength" href="#TestNewLenCharsMaxLength">func TestNewLenCharsMaxLength(t *testing.T)</a>

```
searchKey: randstring.TestNewLenCharsMaxLength
tags: [method private test]
```

```Go
func TestNewLenCharsMaxLength(t *testing.T)
```

### <a id="TestNew_unique" href="#TestNew_unique">func TestNew_unique(t *testing.T)</a>

```
searchKey: randstring.TestNew_unique
tags: [method private test]
```

```Go
func TestNew_unique(t *testing.T)
```

### <a id="validateChars" href="#validateChars">func validateChars(t *testing.T, u string, chars []byte)</a>

```
searchKey: randstring.validateChars
tags: [method private]
```

```Go
func validateChars(t *testing.T, u string, chars []byte)
```

