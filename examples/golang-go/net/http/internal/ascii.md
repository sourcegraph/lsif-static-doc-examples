# Package ascii

## Index

* [Functions](#func)
    * [func EqualFold(s, t string) bool](#EqualFold)
    * [func lower(b byte) byte](#lower)
    * [func IsPrint(s string) bool](#IsPrint)
    * [func Is(s string) bool](#Is)
    * [func ToLower(s string) (lower string, ok bool)](#ToLower)
    * [func TestEqualFold(t *testing.T)](#TestEqualFold)
    * [func TestIsPrint(t *testing.T)](#TestIsPrint)


## <a id="func" href="#func">Functions</a>

```
tags: [private]
```

### <a id="EqualFold" href="#EqualFold">func EqualFold(s, t string) bool</a>

```
searchKey: ascii.EqualFold
```

```Go
func EqualFold(s, t string) bool
```

EqualFold is strings.EqualFold, ASCII only. It reports whether s and t are equal, ASCII-case-insensitively. 

### <a id="lower" href="#lower">func lower(b byte) byte</a>

```
searchKey: ascii.lower
tags: [private]
```

```Go
func lower(b byte) byte
```

lower returns the ASCII lowercase version of b. 

### <a id="IsPrint" href="#IsPrint">func IsPrint(s string) bool</a>

```
searchKey: ascii.IsPrint
```

```Go
func IsPrint(s string) bool
```

IsPrint returns whether s is ASCII and printable according to [https://tools.ietf.org/html/rfc20#section-4.2](https://tools.ietf.org/html/rfc20#section-4.2). 

### <a id="Is" href="#Is">func Is(s string) bool</a>

```
searchKey: ascii.Is
```

```Go
func Is(s string) bool
```

Is returns whether s is ASCII. 

### <a id="ToLower" href="#ToLower">func ToLower(s string) (lower string, ok bool)</a>

```
searchKey: ascii.ToLower
```

```Go
func ToLower(s string) (lower string, ok bool)
```

ToLower returns the lowercase version of s if s is ASCII and printable. 

### <a id="TestEqualFold" href="#TestEqualFold">func TestEqualFold(t *testing.T)</a>

```
searchKey: ascii.TestEqualFold
tags: [private]
```

```Go
func TestEqualFold(t *testing.T)
```

### <a id="TestIsPrint" href="#TestIsPrint">func TestIsPrint(t *testing.T)</a>

```
searchKey: ascii.TestIsPrint
tags: [private]
```

```Go
func TestIsPrint(t *testing.T)
```

