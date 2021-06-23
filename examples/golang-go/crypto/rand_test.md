# Package rand_test

## Index

* [Types](#type)
    * [type countingReader struct](#countingReader)
        * [func (r *countingReader) Read(p []byte) (n int, err error)](#countingReader.Read)
* [Functions](#func)
    * [func ExampleRead()](#ExampleRead)
    * [func TestPrimeSmall(t *testing.T)](#TestPrimeSmall)
    * [func TestPrimeBitsLt2(t *testing.T)](#TestPrimeBitsLt2)
    * [func TestInt(t *testing.T)](#TestInt)
    * [func TestIntReads(t *testing.T)](#TestIntReads)
    * [func TestIntMask(t *testing.T)](#TestIntMask)
    * [func testIntPanics(t *testing.T, b *big.Int)](#testIntPanics)
    * [func TestIntEmptyMaxPanics(t *testing.T)](#TestIntEmptyMaxPanics)
    * [func TestIntNegativeMaxPanics(t *testing.T)](#TestIntNegativeMaxPanics)
    * [func BenchmarkPrime(b *testing.B)](#BenchmarkPrime)


## <a id="type" href="#type">Types</a>

```
tags: [private]
```

### <a id="countingReader" href="#countingReader">type countingReader struct</a>

```
searchKey: rand_test.countingReader
tags: [private]
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
tags: [private]
```

```Go
func (r *countingReader) Read(p []byte) (n int, err error)
```

## <a id="func" href="#func">Functions</a>

```
tags: [private]
```

### <a id="ExampleRead" href="#ExampleRead">func ExampleRead()</a>

```
searchKey: rand_test.ExampleRead
tags: [private]
```

```Go
func ExampleRead()
```

This example reads 10 cryptographically secure pseudorandom numbers from rand.Reader and writes them to a byte slice. 

### <a id="TestPrimeSmall" href="#TestPrimeSmall">func TestPrimeSmall(t *testing.T)</a>

```
searchKey: rand_test.TestPrimeSmall
tags: [private]
```

```Go
func TestPrimeSmall(t *testing.T)
```

[https://golang.org/issue/6849](https://golang.org/issue/6849). 

### <a id="TestPrimeBitsLt2" href="#TestPrimeBitsLt2">func TestPrimeBitsLt2(t *testing.T)</a>

```
searchKey: rand_test.TestPrimeBitsLt2
tags: [private]
```

```Go
func TestPrimeBitsLt2(t *testing.T)
```

Test that passing bits < 2 causes Prime to return nil, error 

### <a id="TestInt" href="#TestInt">func TestInt(t *testing.T)</a>

```
searchKey: rand_test.TestInt
tags: [private]
```

```Go
func TestInt(t *testing.T)
```

### <a id="TestIntReads" href="#TestIntReads">func TestIntReads(t *testing.T)</a>

```
searchKey: rand_test.TestIntReads
tags: [private]
```

```Go
func TestIntReads(t *testing.T)
```

Test that Int reads only the necessary number of bytes from the reader for max at each bit length 

### <a id="TestIntMask" href="#TestIntMask">func TestIntMask(t *testing.T)</a>

```
searchKey: rand_test.TestIntMask
tags: [private]
```

```Go
func TestIntMask(t *testing.T)
```

Test that Int does not mask out valid return values 

### <a id="testIntPanics" href="#testIntPanics">func testIntPanics(t *testing.T, b *big.Int)</a>

```
searchKey: rand_test.testIntPanics
tags: [private]
```

```Go
func testIntPanics(t *testing.T, b *big.Int)
```

### <a id="TestIntEmptyMaxPanics" href="#TestIntEmptyMaxPanics">func TestIntEmptyMaxPanics(t *testing.T)</a>

```
searchKey: rand_test.TestIntEmptyMaxPanics
tags: [private]
```

```Go
func TestIntEmptyMaxPanics(t *testing.T)
```

Test that passing a new big.Int as max causes Int to panic 

### <a id="TestIntNegativeMaxPanics" href="#TestIntNegativeMaxPanics">func TestIntNegativeMaxPanics(t *testing.T)</a>

```
searchKey: rand_test.TestIntNegativeMaxPanics
tags: [private]
```

```Go
func TestIntNegativeMaxPanics(t *testing.T)
```

Test that passing a negative value as max causes Int to panic 

### <a id="BenchmarkPrime" href="#BenchmarkPrime">func BenchmarkPrime(b *testing.B)</a>

```
searchKey: rand_test.BenchmarkPrime
tags: [private]
```

```Go
func BenchmarkPrime(b *testing.B)
```

