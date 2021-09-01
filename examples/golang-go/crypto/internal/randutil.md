# Package randutil

Package randutil contains internal randomness utilities for various crypto packages. 

## Index

* [Variables](#var)
    * [var closedChan](#closedChan)
    * [var closedChanOnce](#closedChanOnce)
* [Functions](#func)
    * [func MaybeReadByte(r io.Reader)](#MaybeReadByte)


## <a id="var" href="#var">Variables</a>

```
tags: [private]
```

### <a id="closedChan" href="#closedChan">var closedChan</a>

```
searchKey: randutil.closedChan
tags: [variable private]
```

```Go
var closedChan chan struct{}
```

### <a id="closedChanOnce" href="#closedChanOnce">var closedChanOnce</a>

```
searchKey: randutil.closedChanOnce
tags: [variable struct private]
```

```Go
var closedChanOnce sync.Once
```

## <a id="func" href="#func">Functions</a>

```
tags: [private]
```

### <a id="MaybeReadByte" href="#MaybeReadByte">func MaybeReadByte(r io.Reader)</a>

```
searchKey: randutil.MaybeReadByte
tags: [function]
```

```Go
func MaybeReadByte(r io.Reader)
```

MaybeReadByte reads a single byte from r with ~50% probability. This is used to ensure that callers do not depend on non-guaranteed behaviour, e.g. assuming that rsa.GenerateKey is deterministic w.r.t. a given random stream. 

This does not affect tests that pass a stream of fixed bytes as the random source (e.g. a zeroReader). 

