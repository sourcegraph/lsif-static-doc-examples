# Package jsonc

## Index

* [Variables](#var)
    * [var DefaultFormatOptions](#DefaultFormatOptions)
* [Functions](#func)
    * [func Edit(input string, v interface{}, path ...string) (string, error)](#Edit)
    * [func Format(input string, opt *jsonx.FormatOptions) (string, error)](#Format)
    * [func Normalize(input string) []byte](#Normalize)
    * [func Parse(text string) ([]byte, error)](#Parse)
    * [func ReadProperty(input, path string) (interface{}, error)](#ReadProperty)
    * [func Remove(input string, path ...string) (string, error)](#Remove)
    * [func TestNormalize(t *testing.T)](#TestNormalize)
    * [func TestUnmarshal(t *testing.T)](#TestUnmarshal)
    * [func Unmarshal(text string, v interface{}) error](#Unmarshal)


## <a id="var" href="#var">Variables</a>

```
tags: [package private]
```

### <a id="DefaultFormatOptions" href="#DefaultFormatOptions">var DefaultFormatOptions</a>

```
searchKey: jsonc.DefaultFormatOptions
tags: [variable struct]
```

```Go
var DefaultFormatOptions = jsonx.FormatOptions{InsertSpaces: true, TabSize: 2}
```

## <a id="func" href="#func">Functions</a>

```
tags: [package private]
```

### <a id="Edit" href="#Edit">func Edit(input string, v interface{}, path ...string) (string, error)</a>

```
searchKey: jsonc.Edit
tags: [method]
```

```Go
func Edit(input string, v interface{}, path ...string) (string, error)
```

Edit returns the input JSON with the given path set to v. 

### <a id="Format" href="#Format">func Format(input string, opt *jsonx.FormatOptions) (string, error)</a>

```
searchKey: jsonc.Format
tags: [method]
```

```Go
func Format(input string, opt *jsonx.FormatOptions) (string, error)
```

Format returns the input JSON formatted with the given options. 

### <a id="Normalize" href="#Normalize">func Normalize(input string) []byte</a>

```
searchKey: jsonc.Normalize
tags: [method]
```

```Go
func Normalize(input string) []byte
```

Normalize is like Parse, except it ignores errors and always returns valid JSON, even if that JSON is a subset of the input. 

### <a id="Parse" href="#Parse">func Parse(text string) ([]byte, error)</a>

```
searchKey: jsonc.Parse
tags: [method]
```

```Go
func Parse(text string) ([]byte, error)
```

Parse converts JSON with comments, trailing commas, and some types of syntax errors into standard JSON. If there is an error that it can't unambiguously resolve, it returns the error. 

### <a id="ReadProperty" href="#ReadProperty">func ReadProperty(input, path string) (interface{}, error)</a>

```
searchKey: jsonc.ReadProperty
tags: [method]
```

```Go
func ReadProperty(input, path string) (interface{}, error)
```

ReadProperty attempts to read the value of the specified path, ignoring parse errors. it will only error if the path doesn't exist 

### <a id="Remove" href="#Remove">func Remove(input string, path ...string) (string, error)</a>

```
searchKey: jsonc.Remove
tags: [method]
```

```Go
func Remove(input string, path ...string) (string, error)
```

Remove returns the input JSON with the given path removed. 

### <a id="TestNormalize" href="#TestNormalize">func TestNormalize(t *testing.T)</a>

```
searchKey: jsonc.TestNormalize
tags: [method private test]
```

```Go
func TestNormalize(t *testing.T)
```

### <a id="TestUnmarshal" href="#TestUnmarshal">func TestUnmarshal(t *testing.T)</a>

```
searchKey: jsonc.TestUnmarshal
tags: [method private test]
```

```Go
func TestUnmarshal(t *testing.T)
```

### <a id="Unmarshal" href="#Unmarshal">func Unmarshal(text string, v interface{}) error</a>

```
searchKey: jsonc.Unmarshal
tags: [method]
```

```Go
func Unmarshal(text string, v interface{}) error
```

Unmarshal unmarshals the JSON using a fault-tolerant parser that allows comments and trailing commas. If any unrecoverable faults are found, an error is returned. 

