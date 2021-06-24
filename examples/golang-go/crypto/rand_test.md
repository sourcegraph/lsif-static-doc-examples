# Package rand_test

## Index

* [Types](#type)
    * [type countingReader struct](#countingReader)
        * [func (r *countingReader) Read(p []byte) (n int, err error)](#countingReader.Read)
* [Functions](#func)
    * [func BenchmarkPrime(b *testing.B)](#BenchmarkPrime)
    * [func ExampleRead()](#ExampleRead)
    * [func TestInt(t *testing.T)](#TestInt)
    * [func TestIntEmptyMaxPanics(t *testing.T)](#TestIntEmptyMaxPanics)
    * [func TestIntMask(t *testing.T)](#TestIntMask)
    * [func TestIntNegativeMaxPanics(t *testing.T)](#TestIntNegativeMaxPanics)
    * [func TestIntReads(t *testing.T)](#TestIntReads)
    * [func TestPrimeBitsLt2(t *testing.T)](#TestPrimeBitsLt2)
    * [func TestPrimeSmall(t *testing.T)](#TestPrimeSmall)
    * [func testIntPanics(t *testing.T, b *big.Int)](#testIntPanics)


## <a id="type" href="#type">Types</a>

```
tags: [package private]
```

### <a id="countingReader" href="#countingReader">type countingReader struct</a>

```
searchKey: rand_test.countingReader
tags: [struct private]
```

```Go
type countingReader struct {
	r io.Reader
	n int
}
```

#### <a id="countingReader.Read" href="#countingReader.Read">func (r *countingReader) Read(p []byte) (n int, err error)</a>

```
searchKey: rand_test.countingReader.Read
tags: [method private]
```

```Go
func (r *countingReader) Read(p []byte) (n int, err error)
```

## <a id="func" href="#func">Functions</a>

```
tags: [package private]
```

### <a id="BenchmarkPrime" href="#BenchmarkPrime">func BenchmarkPrime(b *testing.B)</a>

```
searchKey: rand_test.BenchmarkPrime
tags: [method private benchmark]
```

```Go
func BenchmarkPrime(b *testing.B)
```

### <a id="ExampleRead" href="#ExampleRead">func ExampleRead()</a>

```
searchKey: rand_test.ExampleRead
tags: [function private]
```

```Go
func ExampleRead()
```

This example reads 10 cryptographically secure pseudorandom numbers from rand.Reader and writes them to a byte slice. 

### <a id="TestInt" href="#TestInt">func TestInt(t *testing.T)</a>

```
searchKey: rand_test.TestInt
tags: [method private test]
```

```Go
func TestInt(t *testing.T)
```

### <a id="TestIntEmptyMaxPanics" href="#TestIntEmptyMaxPanics">func TestIntEmptyMaxPanics(t *testing.T)</a>

```
searchKey: rand_test.TestIntEmptyMaxPanics
tags: [method private test]
```

```Go
func TestIntEmptyMaxPanics(t *testing.T)
```

Test that passing a new big.Int as max causes Int to panic 

### <a id="TestIntMask" href="#TestIntMask">func TestIntMask(t *testing.T)</a>

```
searchKey: rand_test.TestIntMask
tags: [method private test]
```

```Go
func TestIntMask(t *testing.T)
```

Test that Int does not mask out valid return values 

### <a id="TestIntNegativeMaxPanics" href="#TestIntNegativeMaxPanics">func TestIntNegativeMaxPanics(t *testing.T)</a>

```
searchKey: rand_test.TestIntNegativeMaxPanics
tags: [method private test]
```

```Go
func TestIntNegativeMaxPanics(t *testing.T)
```

Test that passing a negative value as max causes Int to panic 

### <a id="TestIntReads" href="#TestIntReads">func TestIntReads(t *testing.T)</a>

```
searchKey: rand_test.TestIntReads
tags: [method private test]
```

```Go
func TestIntReads(t *testing.T)
```

Test that Int reads only the necessary number of bytes from the reader for max at each bit length 

### <a id="TestPrimeBitsLt2" href="#TestPrimeBitsLt2">func TestPrimeBitsLt2(t *testing.T)</a>

```
searchKey: rand_test.TestPrimeBitsLt2
tags: [method private test]
```

```Go
func TestPrimeBitsLt2(t *testing.T)
```

Test that passing bits < 2 causes Prime to return nil, error 

### <a id="TestPrimeSmall" href="#TestPrimeSmall">func TestPrimeSmall(t *testing.T)</a>

```
searchKey: rand_test.TestPrimeSmall
tags: [method private test]
```

```Go
func TestPrimeSmall(t *testing.T)
```

[https://golang.org/issue/6849](https://golang.org/issue/6849). 

### <a id="testIntPanics" href="#testIntPanics">func testIntPanics(t *testing.T, b *big.Int)</a>

```
searchKey: rand_test.testIntPanics
tags: [method private]
```

```Go
func testIntPanics(t *testing.T, b *big.Int)
```

