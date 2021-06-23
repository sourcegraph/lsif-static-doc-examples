# Package rand_test

## Index

* [Constants](#const)
    * [const numTestSamples](#numTestSamples)
* [Variables](#var)
    * [var rn](#rn)
    * [var kn](#kn)
    * [var wn](#wn)
    * [var fn](#fn)
    * [var re](#re)
    * [var ke](#ke)
    * [var we](#we)
    * [var fe](#fe)
    * [var testSeeds](#testSeeds)
    * [var printgolden](#printgolden)
    * [var regressGolden](#regressGolden)
* [Types](#type)
    * [type statsResults struct](#statsResults)
        * [func getStatsResults(samples []float64) *statsResults](#getStatsResults)
        * [func (this *statsResults) checkSimilarDistribution(expected *statsResults) error](#statsResults.checkSimilarDistribution)
* [Functions](#func)
    * [func Example()](#Example)
    * [func Example_rand()](#Example_rand)
    * [func ExamplePerm()](#ExamplePerm)
    * [func ExampleShuffle()](#ExampleShuffle)
    * [func ExampleShuffle_slicesInUnison()](#ExampleShuffle_slicesInUnison)
    * [func ExampleIntn()](#ExampleIntn)
    * [func TestConcurrent(t *testing.T)](#TestConcurrent)
    * [func max(a, b float64) float64](#max)
    * [func nearEqual(a, b, closeEnough, maxError float64) bool](#nearEqual)
    * [func checkSampleDistribution(t *testing.T, samples []float64, expected *statsResults)](#checkSampleDistribution)
    * [func checkSampleSliceDistributions(t *testing.T, samples []float64, nslices int, expected *statsResults)](#checkSampleSliceDistributions)
    * [func generateNormalSamples(nsamples int, mean, stddev float64, seed int64) []float64](#generateNormalSamples)
    * [func testNormalDistribution(t *testing.T, nsamples int, mean, stddev float64, seed int64)](#testNormalDistribution)
    * [func TestStandardNormalValues(t *testing.T)](#TestStandardNormalValues)
    * [func TestNonStandardNormalValues(t *testing.T)](#TestNonStandardNormalValues)
    * [func generateExponentialSamples(nsamples int, rate float64, seed int64) []float64](#generateExponentialSamples)
    * [func testExponentialDistribution(t *testing.T, nsamples int, rate float64, seed int64)](#testExponentialDistribution)
    * [func TestStandardExponentialValues(t *testing.T)](#TestStandardExponentialValues)
    * [func TestNonStandardExponentialValues(t *testing.T)](#TestNonStandardExponentialValues)
    * [func initNorm() (testKn []uint32, testWn, testFn []float32)](#initNorm)
    * [func initExp() (testKe []uint32, testWe, testFe []float32)](#initExp)
    * [func compareUint32Slices(s1, s2 []uint32) int](#compareUint32Slices)
    * [func compareFloat32Slices(s1, s2 []float32) int](#compareFloat32Slices)
    * [func TestNormTables(t *testing.T)](#TestNormTables)
    * [func TestExpTables(t *testing.T)](#TestExpTables)
    * [func hasSlowFloatingPoint() bool](#hasSlowFloatingPoint)
    * [func TestFloat32(t *testing.T)](#TestFloat32)
    * [func testReadUniformity(t *testing.T, n int, seed int64)](#testReadUniformity)
    * [func TestReadUniformity(t *testing.T)](#TestReadUniformity)
    * [func TestReadEmpty(t *testing.T)](#TestReadEmpty)
    * [func TestReadByOneByte(t *testing.T)](#TestReadByOneByte)
    * [func TestReadSeedReset(t *testing.T)](#TestReadSeedReset)
    * [func TestShuffleSmall(t *testing.T)](#TestShuffleSmall)
    * [func encodePerm(s []int) int](#encodePerm)
    * [func TestUniformFactorial(t *testing.T)](#TestUniformFactorial)
    * [func BenchmarkInt63Threadsafe(b *testing.B)](#BenchmarkInt63Threadsafe)
    * [func BenchmarkInt63ThreadsafeParallel(b *testing.B)](#BenchmarkInt63ThreadsafeParallel)
    * [func BenchmarkInt63Unthreadsafe(b *testing.B)](#BenchmarkInt63Unthreadsafe)
    * [func BenchmarkIntn1000(b *testing.B)](#BenchmarkIntn1000)
    * [func BenchmarkInt63n1000(b *testing.B)](#BenchmarkInt63n1000)
    * [func BenchmarkInt31n1000(b *testing.B)](#BenchmarkInt31n1000)
    * [func BenchmarkFloat32(b *testing.B)](#BenchmarkFloat32)
    * [func BenchmarkFloat64(b *testing.B)](#BenchmarkFloat64)
    * [func BenchmarkPerm3(b *testing.B)](#BenchmarkPerm3)
    * [func BenchmarkPerm30(b *testing.B)](#BenchmarkPerm30)
    * [func BenchmarkPerm30ViaShuffle(b *testing.B)](#BenchmarkPerm30ViaShuffle)
    * [func BenchmarkShuffleOverhead(b *testing.B)](#BenchmarkShuffleOverhead)
    * [func BenchmarkRead3(b *testing.B)](#BenchmarkRead3)
    * [func BenchmarkRead64(b *testing.B)](#BenchmarkRead64)
    * [func BenchmarkRead1000(b *testing.B)](#BenchmarkRead1000)
    * [func TestRegress(t *testing.T)](#TestRegress)


## <a id="const" href="#const">Constants</a>

```
tags: [private]
```

### <a id="numTestSamples" href="#numTestSamples">const numTestSamples</a>

```
searchKey: rand_test.numTestSamples
tags: [private]
```

```Go
const numTestSamples = 10000
```

## <a id="var" href="#var">Variables</a>

```
tags: [private]
```

### <a id="rn" href="#rn">var rn</a>

```
searchKey: rand_test.rn
tags: [private]
```

```Go
var rn, kn, wn, fn = GetNormalDistributionParameters()
```

### <a id="kn" href="#kn">var kn</a>

```
searchKey: rand_test.kn
tags: [private]
```

```Go
var rn, kn, wn, fn = GetNormalDistributionParameters()
```

### <a id="wn" href="#wn">var wn</a>

```
searchKey: rand_test.wn
tags: [private]
```

```Go
var rn, kn, wn, fn = GetNormalDistributionParameters()
```

### <a id="fn" href="#fn">var fn</a>

```
searchKey: rand_test.fn
tags: [private]
```

```Go
var rn, kn, wn, fn = GetNormalDistributionParameters()
```

### <a id="re" href="#re">var re</a>

```
searchKey: rand_test.re
tags: [private]
```

```Go
var re, ke, we, fe = GetExponentialDistributionParameters()
```

### <a id="ke" href="#ke">var ke</a>

```
searchKey: rand_test.ke
tags: [private]
```

```Go
var re, ke, we, fe = GetExponentialDistributionParameters()
```

### <a id="we" href="#we">var we</a>

```
searchKey: rand_test.we
tags: [private]
```

```Go
var re, ke, we, fe = GetExponentialDistributionParameters()
```

### <a id="fe" href="#fe">var fe</a>

```
searchKey: rand_test.fe
tags: [private]
```

```Go
var re, ke, we, fe = GetExponentialDistributionParameters()
```

### <a id="testSeeds" href="#testSeeds">var testSeeds</a>

```
searchKey: rand_test.testSeeds
tags: [private]
```

```Go
var testSeeds = []int64{1, 1754801282, 1698661970, 1550503961}
```

### <a id="printgolden" href="#printgolden">var printgolden</a>

```
searchKey: rand_test.printgolden
tags: [private]
```

```Go
var printgolden = flag.Bool("printgolden", false, "print golden results for regression test")
```

### <a id="regressGolden" href="#regressGolden">var regressGolden</a>

```
searchKey: rand_test.regressGolden
tags: [private]
```

```Go
var regressGolden = ...
```

## <a id="type" href="#type">Types</a>

```
tags: [private]
```

### <a id="statsResults" href="#statsResults">type statsResults struct</a>

```
searchKey: rand_test.statsResults
tags: [private]
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
tags: [private]
```

```Go
func getStatsResults(samples []float64) *statsResults
```

#### <a id="statsResults.checkSimilarDistribution" href="#statsResults.checkSimilarDistribution">func (this *statsResults) checkSimilarDistribution(expected *statsResults) error</a>

```
searchKey: rand_test.statsResults.checkSimilarDistribution
tags: [private]
```

```Go
func (this *statsResults) checkSimilarDistribution(expected *statsResults) error
```

checkSimilarDistribution returns success if the mean and stddev of the two statsResults are similar. 

## <a id="func" href="#func">Functions</a>

```
tags: [private]
```

### <a id="Example" href="#Example">func Example()</a>

```
searchKey: rand_test.Example
tags: [private]
```

```Go
func Example()
```

### <a id="Example_rand" href="#Example_rand">func Example_rand()</a>

```
searchKey: rand_test.Example_rand
tags: [private]
```

```Go
func Example_rand()
```

This example shows the use of each of the methods on a *Rand. The use of the global functions is the same, without the receiver. 

### <a id="ExamplePerm" href="#ExamplePerm">func ExamplePerm()</a>

```
searchKey: rand_test.ExamplePerm
tags: [private]
```

```Go
func ExamplePerm()
```

### <a id="ExampleShuffle" href="#ExampleShuffle">func ExampleShuffle()</a>

```
searchKey: rand_test.ExampleShuffle
tags: [private]
```

```Go
func ExampleShuffle()
```

### <a id="ExampleShuffle_slicesInUnison" href="#ExampleShuffle_slicesInUnison">func ExampleShuffle_slicesInUnison()</a>

```
searchKey: rand_test.ExampleShuffle_slicesInUnison
tags: [private]
```

```Go
func ExampleShuffle_slicesInUnison()
```

### <a id="ExampleIntn" href="#ExampleIntn">func ExampleIntn()</a>

```
searchKey: rand_test.ExampleIntn
tags: [private]
```

```Go
func ExampleIntn()
```

### <a id="TestConcurrent" href="#TestConcurrent">func TestConcurrent(t *testing.T)</a>

```
searchKey: rand_test.TestConcurrent
tags: [private]
```

```Go
func TestConcurrent(t *testing.T)
```

TestConcurrent exercises the rand API concurrently, triggering situations where the race detector is likely to detect issues. 

### <a id="max" href="#max">func max(a, b float64) float64</a>

```
searchKey: rand_test.max
tags: [private]
```

```Go
func max(a, b float64) float64
```

### <a id="nearEqual" href="#nearEqual">func nearEqual(a, b, closeEnough, maxError float64) bool</a>

```
searchKey: rand_test.nearEqual
tags: [private]
```

```Go
func nearEqual(a, b, closeEnough, maxError float64) bool
```

### <a id="checkSampleDistribution" href="#checkSampleDistribution">func checkSampleDistribution(t *testing.T, samples []float64, expected *statsResults)</a>

```
searchKey: rand_test.checkSampleDistribution
tags: [private]
```

```Go
func checkSampleDistribution(t *testing.T, samples []float64, expected *statsResults)
```

### <a id="checkSampleSliceDistributions" href="#checkSampleSliceDistributions">func checkSampleSliceDistributions(t *testing.T, samples []float64, nslices int, expected *statsResults)</a>

```
searchKey: rand_test.checkSampleSliceDistributions
tags: [private]
```

```Go
func checkSampleSliceDistributions(t *testing.T, samples []float64, nslices int, expected *statsResults)
```

### <a id="generateNormalSamples" href="#generateNormalSamples">func generateNormalSamples(nsamples int, mean, stddev float64, seed int64) []float64</a>

```
searchKey: rand_test.generateNormalSamples
tags: [private]
```

```Go
func generateNormalSamples(nsamples int, mean, stddev float64, seed int64) []float64
```

### <a id="testNormalDistribution" href="#testNormalDistribution">func testNormalDistribution(t *testing.T, nsamples int, mean, stddev float64, seed int64)</a>

```
searchKey: rand_test.testNormalDistribution
tags: [private]
```

```Go
func testNormalDistribution(t *testing.T, nsamples int, mean, stddev float64, seed int64)
```

### <a id="TestStandardNormalValues" href="#TestStandardNormalValues">func TestStandardNormalValues(t *testing.T)</a>

```
searchKey: rand_test.TestStandardNormalValues
tags: [private]
```

```Go
func TestStandardNormalValues(t *testing.T)
```

### <a id="TestNonStandardNormalValues" href="#TestNonStandardNormalValues">func TestNonStandardNormalValues(t *testing.T)</a>

```
searchKey: rand_test.TestNonStandardNormalValues
tags: [private]
```

```Go
func TestNonStandardNormalValues(t *testing.T)
```

### <a id="generateExponentialSamples" href="#generateExponentialSamples">func generateExponentialSamples(nsamples int, rate float64, seed int64) []float64</a>

```
searchKey: rand_test.generateExponentialSamples
tags: [private]
```

```Go
func generateExponentialSamples(nsamples int, rate float64, seed int64) []float64
```

### <a id="testExponentialDistribution" href="#testExponentialDistribution">func testExponentialDistribution(t *testing.T, nsamples int, rate float64, seed int64)</a>

```
searchKey: rand_test.testExponentialDistribution
tags: [private]
```

```Go
func testExponentialDistribution(t *testing.T, nsamples int, rate float64, seed int64)
```

### <a id="TestStandardExponentialValues" href="#TestStandardExponentialValues">func TestStandardExponentialValues(t *testing.T)</a>

```
searchKey: rand_test.TestStandardExponentialValues
tags: [private]
```

```Go
func TestStandardExponentialValues(t *testing.T)
```

### <a id="TestNonStandardExponentialValues" href="#TestNonStandardExponentialValues">func TestNonStandardExponentialValues(t *testing.T)</a>

```
searchKey: rand_test.TestNonStandardExponentialValues
tags: [private]
```

```Go
func TestNonStandardExponentialValues(t *testing.T)
```

### <a id="initNorm" href="#initNorm">func initNorm() (testKn []uint32, testWn, testFn []float32)</a>

```
searchKey: rand_test.initNorm
tags: [private]
```

```Go
func initNorm() (testKn []uint32, testWn, testFn []float32)
```

### <a id="initExp" href="#initExp">func initExp() (testKe []uint32, testWe, testFe []float32)</a>

```
searchKey: rand_test.initExp
tags: [private]
```

```Go
func initExp() (testKe []uint32, testWe, testFe []float32)
```

### <a id="compareUint32Slices" href="#compareUint32Slices">func compareUint32Slices(s1, s2 []uint32) int</a>

```
searchKey: rand_test.compareUint32Slices
tags: [private]
```

```Go
func compareUint32Slices(s1, s2 []uint32) int
```

compareUint32Slices returns the first index where the two slices disagree, or <0 if the lengths are the same and all elements are identical. 

### <a id="compareFloat32Slices" href="#compareFloat32Slices">func compareFloat32Slices(s1, s2 []float32) int</a>

```
searchKey: rand_test.compareFloat32Slices
tags: [private]
```

```Go
func compareFloat32Slices(s1, s2 []float32) int
```

compareFloat32Slices returns the first index where the two slices disagree, or <0 if the lengths are the same and all elements are identical. 

### <a id="TestNormTables" href="#TestNormTables">func TestNormTables(t *testing.T)</a>

```
searchKey: rand_test.TestNormTables
tags: [private]
```

```Go
func TestNormTables(t *testing.T)
```

### <a id="TestExpTables" href="#TestExpTables">func TestExpTables(t *testing.T)</a>

```
searchKey: rand_test.TestExpTables
tags: [private]
```

```Go
func TestExpTables(t *testing.T)
```

### <a id="hasSlowFloatingPoint" href="#hasSlowFloatingPoint">func hasSlowFloatingPoint() bool</a>

```
searchKey: rand_test.hasSlowFloatingPoint
tags: [private]
```

```Go
func hasSlowFloatingPoint() bool
```

### <a id="TestFloat32" href="#TestFloat32">func TestFloat32(t *testing.T)</a>

```
searchKey: rand_test.TestFloat32
tags: [private]
```

```Go
func TestFloat32(t *testing.T)
```

### <a id="testReadUniformity" href="#testReadUniformity">func testReadUniformity(t *testing.T, n int, seed int64)</a>

```
searchKey: rand_test.testReadUniformity
tags: [private]
```

```Go
func testReadUniformity(t *testing.T, n int, seed int64)
```

### <a id="TestReadUniformity" href="#TestReadUniformity">func TestReadUniformity(t *testing.T)</a>

```
searchKey: rand_test.TestReadUniformity
tags: [private]
```

```Go
func TestReadUniformity(t *testing.T)
```

### <a id="TestReadEmpty" href="#TestReadEmpty">func TestReadEmpty(t *testing.T)</a>

```
searchKey: rand_test.TestReadEmpty
tags: [private]
```

```Go
func TestReadEmpty(t *testing.T)
```

### <a id="TestReadByOneByte" href="#TestReadByOneByte">func TestReadByOneByte(t *testing.T)</a>

```
searchKey: rand_test.TestReadByOneByte
tags: [private]
```

```Go
func TestReadByOneByte(t *testing.T)
```

### <a id="TestReadSeedReset" href="#TestReadSeedReset">func TestReadSeedReset(t *testing.T)</a>

```
searchKey: rand_test.TestReadSeedReset
tags: [private]
```

```Go
func TestReadSeedReset(t *testing.T)
```

### <a id="TestShuffleSmall" href="#TestShuffleSmall">func TestShuffleSmall(t *testing.T)</a>

```
searchKey: rand_test.TestShuffleSmall
tags: [private]
```

```Go
func TestShuffleSmall(t *testing.T)
```

### <a id="encodePerm" href="#encodePerm">func encodePerm(s []int) int</a>

```
searchKey: rand_test.encodePerm
tags: [private]
```

```Go
func encodePerm(s []int) int
```

encodePerm converts from a permuted slice of length n, such as Perm generates, to an int in [0, n!). See [https://en.wikipedia.org/wiki/Lehmer_code](https://en.wikipedia.org/wiki/Lehmer_code). encodePerm modifies the input slice. 

### <a id="TestUniformFactorial" href="#TestUniformFactorial">func TestUniformFactorial(t *testing.T)</a>

```
searchKey: rand_test.TestUniformFactorial
tags: [private]
```

```Go
func TestUniformFactorial(t *testing.T)
```

TestUniformFactorial tests several ways of generating a uniform value in [0, n!). 

### <a id="BenchmarkInt63Threadsafe" href="#BenchmarkInt63Threadsafe">func BenchmarkInt63Threadsafe(b *testing.B)</a>

```
searchKey: rand_test.BenchmarkInt63Threadsafe
tags: [private]
```

```Go
func BenchmarkInt63Threadsafe(b *testing.B)
```

### <a id="BenchmarkInt63ThreadsafeParallel" href="#BenchmarkInt63ThreadsafeParallel">func BenchmarkInt63ThreadsafeParallel(b *testing.B)</a>

```
searchKey: rand_test.BenchmarkInt63ThreadsafeParallel
tags: [private]
```

```Go
func BenchmarkInt63ThreadsafeParallel(b *testing.B)
```

### <a id="BenchmarkInt63Unthreadsafe" href="#BenchmarkInt63Unthreadsafe">func BenchmarkInt63Unthreadsafe(b *testing.B)</a>

```
searchKey: rand_test.BenchmarkInt63Unthreadsafe
tags: [private]
```

```Go
func BenchmarkInt63Unthreadsafe(b *testing.B)
```

### <a id="BenchmarkIntn1000" href="#BenchmarkIntn1000">func BenchmarkIntn1000(b *testing.B)</a>

```
searchKey: rand_test.BenchmarkIntn1000
tags: [private]
```

```Go
func BenchmarkIntn1000(b *testing.B)
```

### <a id="BenchmarkInt63n1000" href="#BenchmarkInt63n1000">func BenchmarkInt63n1000(b *testing.B)</a>

```
searchKey: rand_test.BenchmarkInt63n1000
tags: [private]
```

```Go
func BenchmarkInt63n1000(b *testing.B)
```

### <a id="BenchmarkInt31n1000" href="#BenchmarkInt31n1000">func BenchmarkInt31n1000(b *testing.B)</a>

```
searchKey: rand_test.BenchmarkInt31n1000
tags: [private]
```

```Go
func BenchmarkInt31n1000(b *testing.B)
```

### <a id="BenchmarkFloat32" href="#BenchmarkFloat32">func BenchmarkFloat32(b *testing.B)</a>

```
searchKey: rand_test.BenchmarkFloat32
tags: [private]
```

```Go
func BenchmarkFloat32(b *testing.B)
```

### <a id="BenchmarkFloat64" href="#BenchmarkFloat64">func BenchmarkFloat64(b *testing.B)</a>

```
searchKey: rand_test.BenchmarkFloat64
tags: [private]
```

```Go
func BenchmarkFloat64(b *testing.B)
```

### <a id="BenchmarkPerm3" href="#BenchmarkPerm3">func BenchmarkPerm3(b *testing.B)</a>

```
searchKey: rand_test.BenchmarkPerm3
tags: [private]
```

```Go
func BenchmarkPerm3(b *testing.B)
```

### <a id="BenchmarkPerm30" href="#BenchmarkPerm30">func BenchmarkPerm30(b *testing.B)</a>

```
searchKey: rand_test.BenchmarkPerm30
tags: [private]
```

```Go
func BenchmarkPerm30(b *testing.B)
```

### <a id="BenchmarkPerm30ViaShuffle" href="#BenchmarkPerm30ViaShuffle">func BenchmarkPerm30ViaShuffle(b *testing.B)</a>

```
searchKey: rand_test.BenchmarkPerm30ViaShuffle
tags: [private]
```

```Go
func BenchmarkPerm30ViaShuffle(b *testing.B)
```

### <a id="BenchmarkShuffleOverhead" href="#BenchmarkShuffleOverhead">func BenchmarkShuffleOverhead(b *testing.B)</a>

```
searchKey: rand_test.BenchmarkShuffleOverhead
tags: [private]
```

```Go
func BenchmarkShuffleOverhead(b *testing.B)
```

BenchmarkShuffleOverhead uses a minimal swap function to measure just the shuffling overhead. 

### <a id="BenchmarkRead3" href="#BenchmarkRead3">func BenchmarkRead3(b *testing.B)</a>

```
searchKey: rand_test.BenchmarkRead3
tags: [private]
```

```Go
func BenchmarkRead3(b *testing.B)
```

### <a id="BenchmarkRead64" href="#BenchmarkRead64">func BenchmarkRead64(b *testing.B)</a>

```
searchKey: rand_test.BenchmarkRead64
tags: [private]
```

```Go
func BenchmarkRead64(b *testing.B)
```

### <a id="BenchmarkRead1000" href="#BenchmarkRead1000">func BenchmarkRead1000(b *testing.B)</a>

```
searchKey: rand_test.BenchmarkRead1000
tags: [private]
```

```Go
func BenchmarkRead1000(b *testing.B)
```

### <a id="TestRegress" href="#TestRegress">func TestRegress(t *testing.T)</a>

```
searchKey: rand_test.TestRegress
tags: [private]
```

```Go
func TestRegress(t *testing.T)
```

