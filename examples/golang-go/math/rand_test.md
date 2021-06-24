# Package rand_test

## Index

* [Constants](#const)
    * [const numTestSamples](#numTestSamples)
* [Variables](#var)
    * [var fe](#fe)
    * [var fn](#fn)
    * [var ke](#ke)
    * [var kn](#kn)
    * [var printgolden](#printgolden)
    * [var re](#re)
    * [var regressGolden](#regressGolden)
    * [var rn](#rn)
    * [var testSeeds](#testSeeds)
    * [var we](#we)
    * [var wn](#wn)
* [Types](#type)
    * [type statsResults struct](#statsResults)
        * [func getStatsResults(samples []float64) *statsResults](#getStatsResults)
        * [func (this *statsResults) checkSimilarDistribution(expected *statsResults) error](#statsResults.checkSimilarDistribution)
* [Functions](#func)
    * [func BenchmarkFloat32(b *testing.B)](#BenchmarkFloat32)
    * [func BenchmarkFloat64(b *testing.B)](#BenchmarkFloat64)
    * [func BenchmarkInt31n1000(b *testing.B)](#BenchmarkInt31n1000)
    * [func BenchmarkInt63Threadsafe(b *testing.B)](#BenchmarkInt63Threadsafe)
    * [func BenchmarkInt63ThreadsafeParallel(b *testing.B)](#BenchmarkInt63ThreadsafeParallel)
    * [func BenchmarkInt63Unthreadsafe(b *testing.B)](#BenchmarkInt63Unthreadsafe)
    * [func BenchmarkInt63n1000(b *testing.B)](#BenchmarkInt63n1000)
    * [func BenchmarkIntn1000(b *testing.B)](#BenchmarkIntn1000)
    * [func BenchmarkPerm3(b *testing.B)](#BenchmarkPerm3)
    * [func BenchmarkPerm30(b *testing.B)](#BenchmarkPerm30)
    * [func BenchmarkPerm30ViaShuffle(b *testing.B)](#BenchmarkPerm30ViaShuffle)
    * [func BenchmarkRead1000(b *testing.B)](#BenchmarkRead1000)
    * [func BenchmarkRead3(b *testing.B)](#BenchmarkRead3)
    * [func BenchmarkRead64(b *testing.B)](#BenchmarkRead64)
    * [func BenchmarkShuffleOverhead(b *testing.B)](#BenchmarkShuffleOverhead)
    * [func Example()](#Example)
    * [func ExampleIntn()](#ExampleIntn)
    * [func ExamplePerm()](#ExamplePerm)
    * [func ExampleShuffle()](#ExampleShuffle)
    * [func ExampleShuffle_slicesInUnison()](#ExampleShuffle_slicesInUnison)
    * [func Example_rand()](#Example_rand)
    * [func TestConcurrent(t *testing.T)](#TestConcurrent)
    * [func TestExpTables(t *testing.T)](#TestExpTables)
    * [func TestFloat32(t *testing.T)](#TestFloat32)
    * [func TestNonStandardExponentialValues(t *testing.T)](#TestNonStandardExponentialValues)
    * [func TestNonStandardNormalValues(t *testing.T)](#TestNonStandardNormalValues)
    * [func TestNormTables(t *testing.T)](#TestNormTables)
    * [func TestReadByOneByte(t *testing.T)](#TestReadByOneByte)
    * [func TestReadEmpty(t *testing.T)](#TestReadEmpty)
    * [func TestReadSeedReset(t *testing.T)](#TestReadSeedReset)
    * [func TestReadUniformity(t *testing.T)](#TestReadUniformity)
    * [func TestRegress(t *testing.T)](#TestRegress)
    * [func TestShuffleSmall(t *testing.T)](#TestShuffleSmall)
    * [func TestStandardExponentialValues(t *testing.T)](#TestStandardExponentialValues)
    * [func TestStandardNormalValues(t *testing.T)](#TestStandardNormalValues)
    * [func TestUniformFactorial(t *testing.T)](#TestUniformFactorial)
    * [func checkSampleDistribution(t *testing.T, samples []float64, expected *statsResults)](#checkSampleDistribution)
    * [func checkSampleSliceDistributions(t *testing.T, samples []float64, nslices int, expected *statsResults)](#checkSampleSliceDistributions)
    * [func compareFloat32Slices(s1, s2 []float32) int](#compareFloat32Slices)
    * [func compareUint32Slices(s1, s2 []uint32) int](#compareUint32Slices)
    * [func encodePerm(s []int) int](#encodePerm)
    * [func generateExponentialSamples(nsamples int, rate float64, seed int64) []float64](#generateExponentialSamples)
    * [func generateNormalSamples(nsamples int, mean, stddev float64, seed int64) []float64](#generateNormalSamples)
    * [func hasSlowFloatingPoint() bool](#hasSlowFloatingPoint)
    * [func initExp() (testKe []uint32, testWe, testFe []float32)](#initExp)
    * [func initNorm() (testKn []uint32, testWn, testFn []float32)](#initNorm)
    * [func max(a, b float64) float64](#max)
    * [func nearEqual(a, b, closeEnough, maxError float64) bool](#nearEqual)
    * [func testExponentialDistribution(t *testing.T, nsamples int, rate float64, seed int64)](#testExponentialDistribution)
    * [func testNormalDistribution(t *testing.T, nsamples int, mean, stddev float64, seed int64)](#testNormalDistribution)
    * [func testReadUniformity(t *testing.T, n int, seed int64)](#testReadUniformity)


## <a id="const" href="#const">Constants</a>

```
tags: [package private]
```

### <a id="numTestSamples" href="#numTestSamples">const numTestSamples</a>

```
searchKey: rand_test.numTestSamples
tags: [constant number private]
```

```Go
const numTestSamples = 10000
```

## <a id="var" href="#var">Variables</a>

```
tags: [package private]
```

### <a id="fe" href="#fe">var fe</a>

```
searchKey: rand_test.fe
tags: [variable private]
```

```Go
var re, ke, we, fe = GetExponentialDistributionParameters()
```

### <a id="fn" href="#fn">var fn</a>

```
searchKey: rand_test.fn
tags: [variable private]
```

```Go
var rn, kn, wn, fn = GetNormalDistributionParameters()
```

### <a id="ke" href="#ke">var ke</a>

```
searchKey: rand_test.ke
tags: [variable private]
```

```Go
var re, ke, we, fe = GetExponentialDistributionParameters()
```

### <a id="kn" href="#kn">var kn</a>

```
searchKey: rand_test.kn
tags: [variable private]
```

```Go
var rn, kn, wn, fn = GetNormalDistributionParameters()
```

### <a id="printgolden" href="#printgolden">var printgolden</a>

```
searchKey: rand_test.printgolden
tags: [variable boolean private]
```

```Go
var printgolden = flag.Bool("printgolden", false, "print golden results for regression test")
```

### <a id="re" href="#re">var re</a>

```
searchKey: rand_test.re
tags: [variable private]
```

```Go
var re, ke, we, fe = GetExponentialDistributionParameters()
```

### <a id="regressGolden" href="#regressGolden">var regressGolden</a>

```
searchKey: rand_test.regressGolden
tags: [variable array interface private]
```

```Go
var regressGolden = ...
```

### <a id="rn" href="#rn">var rn</a>

```
searchKey: rand_test.rn
tags: [variable private]
```

```Go
var rn, kn, wn, fn = GetNormalDistributionParameters()
```

### <a id="testSeeds" href="#testSeeds">var testSeeds</a>

```
searchKey: rand_test.testSeeds
tags: [variable array number private]
```

```Go
var testSeeds = []int64{1, 1754801282, 1698661970, 1550503961}
```

### <a id="we" href="#we">var we</a>

```
searchKey: rand_test.we
tags: [variable private]
```

```Go
var re, ke, we, fe = GetExponentialDistributionParameters()
```

### <a id="wn" href="#wn">var wn</a>

```
searchKey: rand_test.wn
tags: [variable private]
```

```Go
var rn, kn, wn, fn = GetNormalDistributionParameters()
```

## <a id="type" href="#type">Types</a>

```
tags: [package private]
```

### <a id="statsResults" href="#statsResults">type statsResults struct</a>

```
searchKey: rand_test.statsResults
tags: [struct private]
```

```Go
type statsResults struct {
	mean        float64
	stddev      float64
	closeEnough float64
	maxError    float64
}
```

#### <a id="getStatsResults" href="#getStatsResults">func getStatsResults(samples []float64) *statsResults</a>

```
searchKey: rand_test.getStatsResults
tags: [method private]
```

```Go
func getStatsResults(samples []float64) *statsResults
```

#### <a id="statsResults.checkSimilarDistribution" href="#statsResults.checkSimilarDistribution">func (this *statsResults) checkSimilarDistribution(expected *statsResults) error</a>

```
searchKey: rand_test.statsResults.checkSimilarDistribution
tags: [method private]
```

```Go
func (this *statsResults) checkSimilarDistribution(expected *statsResults) error
```

checkSimilarDistribution returns success if the mean and stddev of the two statsResults are similar. 

## <a id="func" href="#func">Functions</a>

```
tags: [package private]
```

### <a id="BenchmarkFloat32" href="#BenchmarkFloat32">func BenchmarkFloat32(b *testing.B)</a>

```
searchKey: rand_test.BenchmarkFloat32
tags: [method private benchmark]
```

```Go
func BenchmarkFloat32(b *testing.B)
```

### <a id="BenchmarkFloat64" href="#BenchmarkFloat64">func BenchmarkFloat64(b *testing.B)</a>

```
searchKey: rand_test.BenchmarkFloat64
tags: [method private benchmark]
```

```Go
func BenchmarkFloat64(b *testing.B)
```

### <a id="BenchmarkInt31n1000" href="#BenchmarkInt31n1000">func BenchmarkInt31n1000(b *testing.B)</a>

```
searchKey: rand_test.BenchmarkInt31n1000
tags: [method private benchmark]
```

```Go
func BenchmarkInt31n1000(b *testing.B)
```

### <a id="BenchmarkInt63Threadsafe" href="#BenchmarkInt63Threadsafe">func BenchmarkInt63Threadsafe(b *testing.B)</a>

```
searchKey: rand_test.BenchmarkInt63Threadsafe
tags: [method private benchmark]
```

```Go
func BenchmarkInt63Threadsafe(b *testing.B)
```

### <a id="BenchmarkInt63ThreadsafeParallel" href="#BenchmarkInt63ThreadsafeParallel">func BenchmarkInt63ThreadsafeParallel(b *testing.B)</a>

```
searchKey: rand_test.BenchmarkInt63ThreadsafeParallel
tags: [method private benchmark]
```

```Go
func BenchmarkInt63ThreadsafeParallel(b *testing.B)
```

### <a id="BenchmarkInt63Unthreadsafe" href="#BenchmarkInt63Unthreadsafe">func BenchmarkInt63Unthreadsafe(b *testing.B)</a>

```
searchKey: rand_test.BenchmarkInt63Unthreadsafe
tags: [method private benchmark]
```

```Go
func BenchmarkInt63Unthreadsafe(b *testing.B)
```

### <a id="BenchmarkInt63n1000" href="#BenchmarkInt63n1000">func BenchmarkInt63n1000(b *testing.B)</a>

```
searchKey: rand_test.BenchmarkInt63n1000
tags: [method private benchmark]
```

```Go
func BenchmarkInt63n1000(b *testing.B)
```

### <a id="BenchmarkIntn1000" href="#BenchmarkIntn1000">func BenchmarkIntn1000(b *testing.B)</a>

```
searchKey: rand_test.BenchmarkIntn1000
tags: [method private benchmark]
```

```Go
func BenchmarkIntn1000(b *testing.B)
```

### <a id="BenchmarkPerm3" href="#BenchmarkPerm3">func BenchmarkPerm3(b *testing.B)</a>

```
searchKey: rand_test.BenchmarkPerm3
tags: [method private benchmark]
```

```Go
func BenchmarkPerm3(b *testing.B)
```

### <a id="BenchmarkPerm30" href="#BenchmarkPerm30">func BenchmarkPerm30(b *testing.B)</a>

```
searchKey: rand_test.BenchmarkPerm30
tags: [method private benchmark]
```

```Go
func BenchmarkPerm30(b *testing.B)
```

### <a id="BenchmarkPerm30ViaShuffle" href="#BenchmarkPerm30ViaShuffle">func BenchmarkPerm30ViaShuffle(b *testing.B)</a>

```
searchKey: rand_test.BenchmarkPerm30ViaShuffle
tags: [method private benchmark]
```

```Go
func BenchmarkPerm30ViaShuffle(b *testing.B)
```

### <a id="BenchmarkRead1000" href="#BenchmarkRead1000">func BenchmarkRead1000(b *testing.B)</a>

```
searchKey: rand_test.BenchmarkRead1000
tags: [method private benchmark]
```

```Go
func BenchmarkRead1000(b *testing.B)
```

### <a id="BenchmarkRead3" href="#BenchmarkRead3">func BenchmarkRead3(b *testing.B)</a>

```
searchKey: rand_test.BenchmarkRead3
tags: [method private benchmark]
```

```Go
func BenchmarkRead3(b *testing.B)
```

### <a id="BenchmarkRead64" href="#BenchmarkRead64">func BenchmarkRead64(b *testing.B)</a>

```
searchKey: rand_test.BenchmarkRead64
tags: [method private benchmark]
```

```Go
func BenchmarkRead64(b *testing.B)
```

### <a id="BenchmarkShuffleOverhead" href="#BenchmarkShuffleOverhead">func BenchmarkShuffleOverhead(b *testing.B)</a>

```
searchKey: rand_test.BenchmarkShuffleOverhead
tags: [method private benchmark]
```

```Go
func BenchmarkShuffleOverhead(b *testing.B)
```

BenchmarkShuffleOverhead uses a minimal swap function to measure just the shuffling overhead. 

### <a id="Example" href="#Example">func Example()</a>

```
searchKey: rand_test.Example
tags: [function private]
```

```Go
func Example()
```

### <a id="ExampleIntn" href="#ExampleIntn">func ExampleIntn()</a>

```
searchKey: rand_test.ExampleIntn
tags: [function private]
```

```Go
func ExampleIntn()
```

### <a id="ExamplePerm" href="#ExamplePerm">func ExamplePerm()</a>

```
searchKey: rand_test.ExamplePerm
tags: [function private]
```

```Go
func ExamplePerm()
```

### <a id="ExampleShuffle" href="#ExampleShuffle">func ExampleShuffle()</a>

```
searchKey: rand_test.ExampleShuffle
tags: [function private]
```

```Go
func ExampleShuffle()
```

### <a id="ExampleShuffle_slicesInUnison" href="#ExampleShuffle_slicesInUnison">func ExampleShuffle_slicesInUnison()</a>

```
searchKey: rand_test.ExampleShuffle_slicesInUnison
tags: [function private]
```

```Go
func ExampleShuffle_slicesInUnison()
```

### <a id="Example_rand" href="#Example_rand">func Example_rand()</a>

```
searchKey: rand_test.Example_rand
tags: [function private]
```

```Go
func Example_rand()
```

This example shows the use of each of the methods on a *Rand. The use of the global functions is the same, without the receiver. 

### <a id="TestConcurrent" href="#TestConcurrent">func TestConcurrent(t *testing.T)</a>

```
searchKey: rand_test.TestConcurrent
tags: [method private test]
```

```Go
func TestConcurrent(t *testing.T)
```

TestConcurrent exercises the rand API concurrently, triggering situations where the race detector is likely to detect issues. 

### <a id="TestExpTables" href="#TestExpTables">func TestExpTables(t *testing.T)</a>

```
searchKey: rand_test.TestExpTables
tags: [method private test]
```

```Go
func TestExpTables(t *testing.T)
```

### <a id="TestFloat32" href="#TestFloat32">func TestFloat32(t *testing.T)</a>

```
searchKey: rand_test.TestFloat32
tags: [method private test]
```

```Go
func TestFloat32(t *testing.T)
```

### <a id="TestNonStandardExponentialValues" href="#TestNonStandardExponentialValues">func TestNonStandardExponentialValues(t *testing.T)</a>

```
searchKey: rand_test.TestNonStandardExponentialValues
tags: [method private test]
```

```Go
func TestNonStandardExponentialValues(t *testing.T)
```

### <a id="TestNonStandardNormalValues" href="#TestNonStandardNormalValues">func TestNonStandardNormalValues(t *testing.T)</a>

```
searchKey: rand_test.TestNonStandardNormalValues
tags: [method private test]
```

```Go
func TestNonStandardNormalValues(t *testing.T)
```

### <a id="TestNormTables" href="#TestNormTables">func TestNormTables(t *testing.T)</a>

```
searchKey: rand_test.TestNormTables
tags: [method private test]
```

```Go
func TestNormTables(t *testing.T)
```

### <a id="TestReadByOneByte" href="#TestReadByOneByte">func TestReadByOneByte(t *testing.T)</a>

```
searchKey: rand_test.TestReadByOneByte
tags: [method private test]
```

```Go
func TestReadByOneByte(t *testing.T)
```

### <a id="TestReadEmpty" href="#TestReadEmpty">func TestReadEmpty(t *testing.T)</a>

```
searchKey: rand_test.TestReadEmpty
tags: [method private test]
```

```Go
func TestReadEmpty(t *testing.T)
```

### <a id="TestReadSeedReset" href="#TestReadSeedReset">func TestReadSeedReset(t *testing.T)</a>

```
searchKey: rand_test.TestReadSeedReset
tags: [method private test]
```

```Go
func TestReadSeedReset(t *testing.T)
```

### <a id="TestReadUniformity" href="#TestReadUniformity">func TestReadUniformity(t *testing.T)</a>

```
searchKey: rand_test.TestReadUniformity
tags: [method private test]
```

```Go
func TestReadUniformity(t *testing.T)
```

### <a id="TestRegress" href="#TestRegress">func TestRegress(t *testing.T)</a>

```
searchKey: rand_test.TestRegress
tags: [method private test]
```

```Go
func TestRegress(t *testing.T)
```

### <a id="TestShuffleSmall" href="#TestShuffleSmall">func TestShuffleSmall(t *testing.T)</a>

```
searchKey: rand_test.TestShuffleSmall
tags: [method private test]
```

```Go
func TestShuffleSmall(t *testing.T)
```

### <a id="TestStandardExponentialValues" href="#TestStandardExponentialValues">func TestStandardExponentialValues(t *testing.T)</a>

```
searchKey: rand_test.TestStandardExponentialValues
tags: [method private test]
```

```Go
func TestStandardExponentialValues(t *testing.T)
```

### <a id="TestStandardNormalValues" href="#TestStandardNormalValues">func TestStandardNormalValues(t *testing.T)</a>

```
searchKey: rand_test.TestStandardNormalValues
tags: [method private test]
```

```Go
func TestStandardNormalValues(t *testing.T)
```

### <a id="TestUniformFactorial" href="#TestUniformFactorial">func TestUniformFactorial(t *testing.T)</a>

```
searchKey: rand_test.TestUniformFactorial
tags: [method private test]
```

```Go
func TestUniformFactorial(t *testing.T)
```

TestUniformFactorial tests several ways of generating a uniform value in [0, n!). 

### <a id="checkSampleDistribution" href="#checkSampleDistribution">func checkSampleDistribution(t *testing.T, samples []float64, expected *statsResults)</a>

```
searchKey: rand_test.checkSampleDistribution
tags: [method private]
```

```Go
func checkSampleDistribution(t *testing.T, samples []float64, expected *statsResults)
```

### <a id="checkSampleSliceDistributions" href="#checkSampleSliceDistributions">func checkSampleSliceDistributions(t *testing.T, samples []float64, nslices int, expected *statsResults)</a>

```
searchKey: rand_test.checkSampleSliceDistributions
tags: [method private]
```

```Go
func checkSampleSliceDistributions(t *testing.T, samples []float64, nslices int, expected *statsResults)
```

### <a id="compareFloat32Slices" href="#compareFloat32Slices">func compareFloat32Slices(s1, s2 []float32) int</a>

```
searchKey: rand_test.compareFloat32Slices
tags: [method private]
```

```Go
func compareFloat32Slices(s1, s2 []float32) int
```

compareFloat32Slices returns the first index where the two slices disagree, or <0 if the lengths are the same and all elements are identical. 

### <a id="compareUint32Slices" href="#compareUint32Slices">func compareUint32Slices(s1, s2 []uint32) int</a>

```
searchKey: rand_test.compareUint32Slices
tags: [method private]
```

```Go
func compareUint32Slices(s1, s2 []uint32) int
```

compareUint32Slices returns the first index where the two slices disagree, or <0 if the lengths are the same and all elements are identical. 

### <a id="encodePerm" href="#encodePerm">func encodePerm(s []int) int</a>

```
searchKey: rand_test.encodePerm
tags: [method private]
```

```Go
func encodePerm(s []int) int
```

encodePerm converts from a permuted slice of length n, such as Perm generates, to an int in [0, n!). See [https://en.wikipedia.org/wiki/Lehmer_code](https://en.wikipedia.org/wiki/Lehmer_code). encodePerm modifies the input slice. 

### <a id="generateExponentialSamples" href="#generateExponentialSamples">func generateExponentialSamples(nsamples int, rate float64, seed int64) []float64</a>

```
searchKey: rand_test.generateExponentialSamples
tags: [method private]
```

```Go
func generateExponentialSamples(nsamples int, rate float64, seed int64) []float64
```

### <a id="generateNormalSamples" href="#generateNormalSamples">func generateNormalSamples(nsamples int, mean, stddev float64, seed int64) []float64</a>

```
searchKey: rand_test.generateNormalSamples
tags: [method private]
```

```Go
func generateNormalSamples(nsamples int, mean, stddev float64, seed int64) []float64
```

### <a id="hasSlowFloatingPoint" href="#hasSlowFloatingPoint">func hasSlowFloatingPoint() bool</a>

```
searchKey: rand_test.hasSlowFloatingPoint
tags: [function private]
```

```Go
func hasSlowFloatingPoint() bool
```

### <a id="initExp" href="#initExp">func initExp() (testKe []uint32, testWe, testFe []float32)</a>

```
searchKey: rand_test.initExp
tags: [function private]
```

```Go
func initExp() (testKe []uint32, testWe, testFe []float32)
```

### <a id="initNorm" href="#initNorm">func initNorm() (testKn []uint32, testWn, testFn []float32)</a>

```
searchKey: rand_test.initNorm
tags: [function private]
```

```Go
func initNorm() (testKn []uint32, testWn, testFn []float32)
```

### <a id="max" href="#max">func max(a, b float64) float64</a>

```
searchKey: rand_test.max
tags: [method private]
```

```Go
func max(a, b float64) float64
```

### <a id="nearEqual" href="#nearEqual">func nearEqual(a, b, closeEnough, maxError float64) bool</a>

```
searchKey: rand_test.nearEqual
tags: [method private]
```

```Go
func nearEqual(a, b, closeEnough, maxError float64) bool
```

### <a id="testExponentialDistribution" href="#testExponentialDistribution">func testExponentialDistribution(t *testing.T, nsamples int, rate float64, seed int64)</a>

```
searchKey: rand_test.testExponentialDistribution
tags: [method private]
```

```Go
func testExponentialDistribution(t *testing.T, nsamples int, rate float64, seed int64)
```

### <a id="testNormalDistribution" href="#testNormalDistribution">func testNormalDistribution(t *testing.T, nsamples int, mean, stddev float64, seed int64)</a>

```
searchKey: rand_test.testNormalDistribution
tags: [method private]
```

```Go
func testNormalDistribution(t *testing.T, nsamples int, mean, stddev float64, seed int64)
```

### <a id="testReadUniformity" href="#testReadUniformity">func testReadUniformity(t *testing.T, n int, seed int64)</a>

```
searchKey: rand_test.testReadUniformity
tags: [method private]
```

```Go
func testReadUniformity(t *testing.T, n int, seed int64)
```

