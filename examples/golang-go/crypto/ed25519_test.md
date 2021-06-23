# Package ed25519_test

## Index

* [Functions](#func)
    * [func TestEd25519Vectors(t *testing.T)](#TestEd25519Vectors)
    * [func downloadEd25519Vectors(t *testing.T) []byte](#downloadEd25519Vectors)
    * [func decodeHex(t *testing.T, s string) []byte](#decodeHex)


## <a id="func" href="#func">Functions</a>

```
tags: [private]
```

### <a id="TestEd25519Vectors" href="#TestEd25519Vectors">func TestEd25519Vectors(t *testing.T)</a>

```
searchKey: ed25519_test.TestEd25519Vectors
tags: [private]
```

```Go
func TestEd25519Vectors(t *testing.T)
```

TestEd25519Vectors runs a very large set of test vectors that exercise all combinations of low-order points, low-order components, and non-canonical encodings. These vectors lock in unspecified and spec-divergent behaviors in edge cases that are not security relevant in most contexts, but that can cause issues in consensus applications if changed. 

Our behavior matches the "classic" unwritten verification rules of the "ref10" reference implementation. 

Note that although we test for these edge cases, they are not covered by the Go 1 Compatibility Promise. Applications that need stable verification rules should use github.com/hdevalence/ed25519consensus. 

See [https://hdevalence.ca/blog/2020-10-04-its-25519am](https://hdevalence.ca/blog/2020-10-04-its-25519am) for more details. 

### <a id="downloadEd25519Vectors" href="#downloadEd25519Vectors">func downloadEd25519Vectors(t *testing.T) []byte</a>

```
searchKey: ed25519_test.downloadEd25519Vectors
tags: [private]
```

```Go
func downloadEd25519Vectors(t *testing.T) []byte
```

### <a id="decodeHex" href="#decodeHex">func decodeHex(t *testing.T, s string) []byte</a>

```
searchKey: ed25519_test.decodeHex
tags: [private]
```

```Go
func decodeHex(t *testing.T, s string) []byte
```

