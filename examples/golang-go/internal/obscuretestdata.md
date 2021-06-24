# Package obscuretestdata

Package obscuretestdata contains functionality used by tests to more easily work with testdata that must be obscured primarily due to golang.org/issue/34986. 

## Index

* [Functions](#func)
    * [func DecodeToTempFile(name string) (path string, err error)](#DecodeToTempFile)
    * [func ReadFile(name string) ([]byte, error)](#ReadFile)


## <a id="func" href="#func">Functions</a>

```
tags: [package private]
```

### <a id="DecodeToTempFile" href="#DecodeToTempFile">func DecodeToTempFile(name string) (path string, err error)</a>

```
searchKey: obscuretestdata.DecodeToTempFile
tags: [method]
```

```Go
func DecodeToTempFile(name string) (path string, err error)
```

DecodeToTempFile decodes the named file to a temporary location. If successful, it returns the path of the decoded file. The caller is responsible for ensuring that the temporary file is removed. 

### <a id="ReadFile" href="#ReadFile">func ReadFile(name string) ([]byte, error)</a>

```
searchKey: obscuretestdata.ReadFile
tags: [method]
```

```Go
func ReadFile(name string) ([]byte, error)
```

ReadFile reads the named file and returns its decoded contents. 

