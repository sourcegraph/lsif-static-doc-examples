# Package subtle

Package subtle implements functions that are often useful in cryptographic code but require careful thought to use correctly. 

This is a mirror of golang.org/x/crypto/internal/subtle. 

## Index

* [Functions](#func)
    * [func AnyOverlap(x, y []byte) bool](#AnyOverlap)
    * [func InexactOverlap(x, y []byte) bool](#InexactOverlap)


## <a id="func" href="#func">Functions</a>

```
tags: [private]
```

### <a id="AnyOverlap" href="#AnyOverlap">func AnyOverlap(x, y []byte) bool</a>

```
searchKey: subtle.AnyOverlap
```

```Go
func AnyOverlap(x, y []byte) bool
```

AnyOverlap reports whether x and y share memory at any (not necessarily corresponding) index. The memory beyond the slice length is ignored. 

### <a id="InexactOverlap" href="#InexactOverlap">func InexactOverlap(x, y []byte) bool</a>

```
searchKey: subtle.InexactOverlap
```

```Go
func InexactOverlap(x, y []byte) bool
```

InexactOverlap reports whether x and y share memory at any non-corresponding index. The memory beyond the slice length is ignored. Note that x and y can have different lengths and still not have any inexact overlap. 

InexactOverlap can be used to implement the requirements of the crypto/cipher AEAD, Block, BlockMode and Stream interfaces. 

