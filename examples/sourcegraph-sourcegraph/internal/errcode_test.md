# Package errcode_test

## Index

* [Types](#type)
    * [type notFoundErr struct{}](#notFoundErr)
        * [func (e *notFoundErr) Error() string](#notFoundErr.Error)
        * [func (e *notFoundErr) NotFound() bool](#notFoundErr.NotFound)
* [Functions](#func)
    * [func TestHTTP(t *testing.T)](#TestHTTP)
    * [func TestMakeNonRetryable(t *testing.T)](#TestMakeNonRetryable)


## <a id="type" href="#type">Types</a>

```
tags: [private]
```

### <a id="notFoundErr" href="#notFoundErr">type notFoundErr struct{}</a>

```
searchKey: errcode_test.notFoundErr
tags: [private]
```

```Go
type notFoundErr struct{}
```

#### <a id="notFoundErr.Error" href="#notFoundErr.Error">func (e *notFoundErr) Error() string</a>

```
searchKey: errcode_test.notFoundErr.Error
tags: [private]
```

```Go
func (e *notFoundErr) Error() string
```

#### <a id="notFoundErr.NotFound" href="#notFoundErr.NotFound">func (e *notFoundErr) NotFound() bool</a>

```
searchKey: errcode_test.notFoundErr.NotFound
tags: [private]
```

```Go
func (e *notFoundErr) NotFound() bool
```

## <a id="func" href="#func">Functions</a>

```
tags: [private]
```

### <a id="TestHTTP" href="#TestHTTP">func TestHTTP(t *testing.T)</a>

```
searchKey: errcode_test.TestHTTP
tags: [private]
```

```Go
func TestHTTP(t *testing.T)
```

### <a id="TestMakeNonRetryable" href="#TestMakeNonRetryable">func TestMakeNonRetryable(t *testing.T)</a>

```
searchKey: errcode_test.TestMakeNonRetryable
tags: [private]
```

```Go
func TestMakeNonRetryable(t *testing.T)
```

