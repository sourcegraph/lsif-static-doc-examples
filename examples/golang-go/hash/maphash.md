# Package maphash

Package maphash provides hash functions on byte sequences. These hash functions are intended to be used to implement hash tables or other data structures that need to map arbitrary strings or byte sequences to a uniform distribution on unsigned 64-bit integers. Each different instance of a hash table or data structure should use its own Seed. 

The hash functions are not cryptographically secure. (See crypto/sha256 and crypto/sha512 for cryptographic use.) 

## Index

* [Constants](#const)
    * [const bufSize](#bufSize)
    * [const hashSize](#hashSize)
* [Variables](#var)
    * [var fixedSeed](#fixedSeed)
* [Types](#type)
    * [type Seed struct](#Seed)
        * [func MakeSeed() Seed](#MakeSeed)
    * [type Hash struct](#Hash)
        * [func (h *Hash) initSeed()](#Hash.initSeed)
        * [func (h *Hash) WriteByte(b byte) error](#Hash.WriteByte)
        * [func (h *Hash) Write(b []byte) (int, error)](#Hash.Write)
        * [func (h *Hash) WriteString(s string) (int, error)](#Hash.WriteString)
        * [func (h *Hash) Seed() Seed](#Hash.Seed)
        * [func (h *Hash) SetSeed(seed Seed)](#Hash.SetSeed)
        * [func (h *Hash) Reset()](#Hash.Reset)
        * [func (h *Hash) flush()](#Hash.flush)
        * [func (h *Hash) Sum64() uint64](#Hash.Sum64)
        * [func (h *Hash) Sum(b []byte) []byte](#Hash.Sum)
        * [func (h *Hash) Size() int](#Hash.Size)
        * [func (h *Hash) BlockSize() int](#Hash.BlockSize)
    * [type hashSet struct](#hashSet)
        * [func newHashSet() *hashSet](#newHashSet)
        * [func (s *hashSet) add(h uint64)](#hashSet.add)
        * [func (s *hashSet) addS(x string)](#hashSet.addS)
        * [func (s *hashSet) addB(x []byte)](#hashSet.addB)
        * [func (s *hashSet) addS_seed(x string, seed Seed)](#hashSet.addS_seed)
        * [func (s *hashSet) check(t *testing.T)](#hashSet.check)
    * [type key interface](#key)
    * [type bytesKey struct](#bytesKey)
        * [func (k *bytesKey) clear()](#bytesKey.clear)
        * [func (k *bytesKey) random(r *rand.Rand)](#bytesKey.random)
        * [func (k *bytesKey) bits() int](#bytesKey.bits)
        * [func (k *bytesKey) flipBit(i int)](#bytesKey.flipBit)
        * [func (k *bytesKey) hash() uint64](#bytesKey.hash)
        * [func (k *bytesKey) name() string](#bytesKey.name)
* [Functions](#func)
    * [func runtime_fastrand() uint32](#runtime_fastrand)
    * [func rthash(ptr *byte, len int, seed uint64) uint64](#rthash)
    * [func runtime_memhash(p unsafe.Pointer, seed, s uintptr) uintptr](#runtime_memhash)
    * [func TestUnseededHash(t *testing.T)](#TestUnseededHash)
    * [func TestSeededHash(t *testing.T)](#TestSeededHash)
    * [func TestHashGrouping(t *testing.T)](#TestHashGrouping)
    * [func TestHashBytesVsString(t *testing.T)](#TestHashBytesVsString)
    * [func TestHashHighBytes(t *testing.T)](#TestHashHighBytes)
    * [func TestRepeat(t *testing.T)](#TestRepeat)
    * [func TestSeedFromSum64(t *testing.T)](#TestSeedFromSum64)
    * [func TestSeedFromSeed(t *testing.T)](#TestSeedFromSeed)
    * [func TestSeedFromFlush(t *testing.T)](#TestSeedFromFlush)
    * [func TestSeedFromReset(t *testing.T)](#TestSeedFromReset)
    * [func benchmarkSize(b *testing.B, size int)](#benchmarkSize)
    * [func BenchmarkHash8Bytes(b *testing.B)](#BenchmarkHash8Bytes)
    * [func BenchmarkHash320Bytes(b *testing.B)](#BenchmarkHash320Bytes)
    * [func BenchmarkHash1K(b *testing.B)](#BenchmarkHash1K)
    * [func BenchmarkHash8K(b *testing.B)](#BenchmarkHash8K)
    * [func TestSmhasherSanity(t *testing.T)](#TestSmhasherSanity)
    * [func bytesHash(b []byte) uint64](#bytesHash)
    * [func stringHash(s string) uint64](#stringHash)
    * [func randBytes(r *rand.Rand, b []byte)](#randBytes)
    * [func TestSmhasherAppendedZeros(t *testing.T)](#TestSmhasherAppendedZeros)
    * [func TestSmhasherSmallKeys(t *testing.T)](#TestSmhasherSmallKeys)
    * [func TestSmhasherZeros(t *testing.T)](#TestSmhasherZeros)
    * [func TestSmhasherTwoNonzero(t *testing.T)](#TestSmhasherTwoNonzero)
    * [func twoNonZero(h *hashSet, n int)](#twoNonZero)
    * [func TestSmhasherCyclic(t *testing.T)](#TestSmhasherCyclic)
    * [func TestSmhasherSparse(t *testing.T)](#TestSmhasherSparse)
    * [func sparse(t *testing.T, n int, k int)](#sparse)
    * [func setbits(h *hashSet, b []byte, i int, k int)](#setbits)
    * [func TestSmhasherPermutation(t *testing.T)](#TestSmhasherPermutation)
    * [func permutation(t *testing.T, s []uint32, n int)](#permutation)
    * [func genPerm(h *hashSet, b []byte, s []uint32, n int)](#genPerm)
    * [func TestSmhasherAvalanche(t *testing.T)](#TestSmhasherAvalanche)
    * [func avalancheTest1(t *testing.T, k key)](#avalancheTest1)
    * [func TestSmhasherWindowed(t *testing.T)](#TestSmhasherWindowed)
    * [func windowed(t *testing.T, k key)](#windowed)
    * [func TestSmhasherText(t *testing.T)](#TestSmhasherText)
    * [func text(t *testing.T, prefix, suffix string)](#text)
    * [func TestSmhasherSeed(t *testing.T)](#TestSmhasherSeed)


## <a id="const" href="#const">Constants</a>

```
tags: [exported]
```

### <a id="bufSize" href="#bufSize">const bufSize</a>

```
searchKey: maphash.bufSize
```

```Go
const bufSize = 128
```

bufSize is the size of the Hash write buffer. The buffer ensures that writes depend only on the sequence of bytes, not the sequence of WriteByte/Write/WriteString calls, by always calling rthash with a full buffer (except for the tail). 

### <a id="hashSize" href="#hashSize">const hashSize</a>

```
searchKey: maphash.hashSize
```

```Go
const hashSize = 64
```

## <a id="var" href="#var">Variables</a>

```
tags: [exported]
```

### <a id="fixedSeed" href="#fixedSeed">var fixedSeed</a>

```
searchKey: maphash.fixedSeed
```

```Go
var fixedSeed = MakeSeed()
```

## <a id="type" href="#type">Types</a>

```
tags: [exported]
```

### <a id="Seed" href="#Seed">type Seed struct</a>

```
searchKey: maphash.Seed
tags: [exported]
```

```Go
type Seed struct {
	s uint64
}
```

A Seed is a random value that selects the specific hash function computed by a Hash. If two Hashes use the same Seeds, they will compute the same hash values for any given input. If two Hashes use different Seeds, they are very likely to compute distinct hash values for any given input. 

A Seed must be initialized by calling MakeSeed. The zero seed is uninitialized and not valid for use with Hash's SetSeed method. 

Each Seed value is local to a single process and cannot be serialized or otherwise recreated in a different process. 

#### <a id="MakeSeed" href="#MakeSeed">func MakeSeed() Seed</a>

```
searchKey: maphash.MakeSeed
tags: [exported]
```

```Go
func MakeSeed() Seed
```

MakeSeed returns a new random seed. 

### <a id="Hash" href="#Hash">type Hash struct</a>

```
searchKey: maphash.Hash
tags: [exported]
```

```Go
type Hash struct {
	_     [0]func()     // not comparable
	seed  Seed          // initial seed used for this hash
	state Seed          // current hash of all flushed bytes
	buf   [bufSize]byte // unflushed byte buffer
	n     int           // number of unflushed bytes
}
```

A Hash computes a seeded hash of a byte sequence. 

The zero Hash is a valid Hash ready to use. A zero Hash chooses a random seed for itself during the first call to a Reset, Write, Seed, or Sum64 method. For control over the seed, use SetSeed. 

The computed hash values depend only on the initial seed and the sequence of bytes provided to the Hash object, not on the way in which the bytes are provided. For example, the three sequences 

```
h.Write([]byte{'f','o','o'})
h.WriteByte('f'); h.WriteByte('o'); h.WriteByte('o')
h.WriteString("foo")

```
all have the same effect. 

Hashes are intended to be collision-resistant, even for situations where an adversary controls the byte sequences being hashed. 

A Hash is not safe for concurrent use by multiple goroutines, but a Seed is. If multiple goroutines must compute the same seeded hash, each can declare its own Hash and call SetSeed with a common Seed. 

#### <a id="Hash.initSeed" href="#Hash.initSeed">func (h *Hash) initSeed()</a>

```
searchKey: maphash.Hash.initSeed
```

```Go
func (h *Hash) initSeed()
```

initSeed seeds the hash if necessary. initSeed is called lazily before any operation that actually uses h.seed/h.state. Note that this does not include Write/WriteByte/WriteString in the case where they only add to h.buf. (If they write too much, they call h.flush, which does call h.initSeed.) 

#### <a id="Hash.WriteByte" href="#Hash.WriteByte">func (h *Hash) WriteByte(b byte) error</a>

```
searchKey: maphash.Hash.WriteByte
tags: [exported]
```

```Go
func (h *Hash) WriteByte(b byte) error
```

WriteByte adds b to the sequence of bytes hashed by h. It never fails; the error result is for implementing io.ByteWriter. 

#### <a id="Hash.Write" href="#Hash.Write">func (h *Hash) Write(b []byte) (int, error)</a>

```
searchKey: maphash.Hash.Write
tags: [exported]
```

```Go
func (h *Hash) Write(b []byte) (int, error)
```

Write adds b to the sequence of bytes hashed by h. It always writes all of b and never fails; the count and error result are for implementing io.Writer. 

#### <a id="Hash.WriteString" href="#Hash.WriteString">func (h *Hash) WriteString(s string) (int, error)</a>

```
searchKey: maphash.Hash.WriteString
tags: [exported]
```

```Go
func (h *Hash) WriteString(s string) (int, error)
```

WriteString adds the bytes of s to the sequence of bytes hashed by h. It always writes all of s and never fails; the count and error result are for implementing io.StringWriter. 

#### <a id="Hash.Seed" href="#Hash.Seed">func (h *Hash) Seed() Seed</a>

```
searchKey: maphash.Hash.Seed
tags: [exported]
```

```Go
func (h *Hash) Seed() Seed
```

Seed returns h's seed value. 

#### <a id="Hash.SetSeed" href="#Hash.SetSeed">func (h *Hash) SetSeed(seed Seed)</a>

```
searchKey: maphash.Hash.SetSeed
tags: [exported]
```

```Go
func (h *Hash) SetSeed(seed Seed)
```

SetSeed sets h to use seed, which must have been returned by MakeSeed or by another Hash's Seed method. Two Hash objects with the same seed behave identically. Two Hash objects with different seeds will very likely behave differently. Any bytes added to h before this call will be discarded. 

#### <a id="Hash.Reset" href="#Hash.Reset">func (h *Hash) Reset()</a>

```
searchKey: maphash.Hash.Reset
tags: [exported]
```

```Go
func (h *Hash) Reset()
```

Reset discards all bytes added to h. (The seed remains the same.) 

#### <a id="Hash.flush" href="#Hash.flush">func (h *Hash) flush()</a>

```
searchKey: maphash.Hash.flush
```

```Go
func (h *Hash) flush()
```

precondition: buffer is full. 

#### <a id="Hash.Sum64" href="#Hash.Sum64">func (h *Hash) Sum64() uint64</a>

```
searchKey: maphash.Hash.Sum64
tags: [exported]
```

```Go
func (h *Hash) Sum64() uint64
```

Sum64 returns h's current 64-bit value, which depends on h's seed and the sequence of bytes added to h since the last call to Reset or SetSeed. 

All bits of the Sum64 result are close to uniformly and independently distributed, so it can be safely reduced by using bit masking, shifting, or modular arithmetic. 

#### <a id="Hash.Sum" href="#Hash.Sum">func (h *Hash) Sum(b []byte) []byte</a>

```
searchKey: maphash.Hash.Sum
tags: [exported]
```

```Go
func (h *Hash) Sum(b []byte) []byte
```

Sum appends the hash's current 64-bit value to b. It exists for implementing hash.Hash. For direct calls, it is more efficient to use Sum64. 

#### <a id="Hash.Size" href="#Hash.Size">func (h *Hash) Size() int</a>

```
searchKey: maphash.Hash.Size
tags: [exported]
```

```Go
func (h *Hash) Size() int
```

Size returns h's hash value size, 8 bytes. 

#### <a id="Hash.BlockSize" href="#Hash.BlockSize">func (h *Hash) BlockSize() int</a>

```
searchKey: maphash.Hash.BlockSize
tags: [exported]
```

```Go
func (h *Hash) BlockSize() int
```

BlockSize returns h's block size. 

### <a id="hashSet" href="#hashSet">type hashSet struct</a>

```
searchKey: maphash.hashSet
```

```Go
type hashSet struct {
	m map[uint64]struct{} // set of hashes added
	n int                 // number of hashes added
}
```

A hashSet measures the frequency of hash collisions. 

#### <a id="newHashSet" href="#newHashSet">func newHashSet() *hashSet</a>

```
searchKey: maphash.newHashSet
```

```Go
func newHashSet() *hashSet
```

#### <a id="hashSet.add" href="#hashSet.add">func (s *hashSet) add(h uint64)</a>

```
searchKey: maphash.hashSet.add
```

```Go
func (s *hashSet) add(h uint64)
```

#### <a id="hashSet.addS" href="#hashSet.addS">func (s *hashSet) addS(x string)</a>

```
searchKey: maphash.hashSet.addS
```

```Go
func (s *hashSet) addS(x string)
```

#### <a id="hashSet.addB" href="#hashSet.addB">func (s *hashSet) addB(x []byte)</a>

```
searchKey: maphash.hashSet.addB
```

```Go
func (s *hashSet) addB(x []byte)
```

#### <a id="hashSet.addS_seed" href="#hashSet.addS_seed">func (s *hashSet) addS_seed(x string, seed Seed)</a>

```
searchKey: maphash.hashSet.addS_seed
```

```Go
func (s *hashSet) addS_seed(x string, seed Seed)
```

#### <a id="hashSet.check" href="#hashSet.check">func (s *hashSet) check(t *testing.T)</a>

```
searchKey: maphash.hashSet.check
```

```Go
func (s *hashSet) check(t *testing.T)
```

### <a id="key" href="#key">type key interface</a>

```
searchKey: maphash.key
```

```Go
type key interface {
	clear()              // set bits all to 0
	random(r *rand.Rand) // set key to something random
	bits() int           // how many bits key has
	flipBit(i int)       // flip bit i of the key
	hash() uint64        // hash the key
	name() string        // for error reporting
}
```

### <a id="bytesKey" href="#bytesKey">type bytesKey struct</a>

```
searchKey: maphash.bytesKey
```

```Go
type bytesKey struct {
	b []byte
}
```

#### <a id="bytesKey.clear" href="#bytesKey.clear">func (k *bytesKey) clear()</a>

```
searchKey: maphash.bytesKey.clear
```

```Go
func (k *bytesKey) clear()
```

#### <a id="bytesKey.random" href="#bytesKey.random">func (k *bytesKey) random(r *rand.Rand)</a>

```
searchKey: maphash.bytesKey.random
```

```Go
func (k *bytesKey) random(r *rand.Rand)
```

#### <a id="bytesKey.bits" href="#bytesKey.bits">func (k *bytesKey) bits() int</a>

```
searchKey: maphash.bytesKey.bits
```

```Go
func (k *bytesKey) bits() int
```

#### <a id="bytesKey.flipBit" href="#bytesKey.flipBit">func (k *bytesKey) flipBit(i int)</a>

```
searchKey: maphash.bytesKey.flipBit
```

```Go
func (k *bytesKey) flipBit(i int)
```

#### <a id="bytesKey.hash" href="#bytesKey.hash">func (k *bytesKey) hash() uint64</a>

```
searchKey: maphash.bytesKey.hash
```

```Go
func (k *bytesKey) hash() uint64
```

#### <a id="bytesKey.name" href="#bytesKey.name">func (k *bytesKey) name() string</a>

```
searchKey: maphash.bytesKey.name
```

```Go
func (k *bytesKey) name() string
```

## <a id="func" href="#func">Functions</a>

```
tags: [exported]
```

### <a id="runtime_fastrand" href="#runtime_fastrand">func runtime_fastrand() uint32</a>

```
searchKey: maphash.runtime_fastrand
```

```Go
func runtime_fastrand() uint32
```

### <a id="rthash" href="#rthash">func rthash(ptr *byte, len int, seed uint64) uint64</a>

```
searchKey: maphash.rthash
```

```Go
func rthash(ptr *byte, len int, seed uint64) uint64
```

### <a id="runtime_memhash" href="#runtime_memhash">func runtime_memhash(p unsafe.Pointer, seed, s uintptr) uintptr</a>

```
searchKey: maphash.runtime_memhash
```

```Go
func runtime_memhash(p unsafe.Pointer, seed, s uintptr) uintptr
```

### <a id="TestUnseededHash" href="#TestUnseededHash">func TestUnseededHash(t *testing.T)</a>

```
searchKey: maphash.TestUnseededHash
```

```Go
func TestUnseededHash(t *testing.T)
```

### <a id="TestSeededHash" href="#TestSeededHash">func TestSeededHash(t *testing.T)</a>

```
searchKey: maphash.TestSeededHash
```

```Go
func TestSeededHash(t *testing.T)
```

### <a id="TestHashGrouping" href="#TestHashGrouping">func TestHashGrouping(t *testing.T)</a>

```
searchKey: maphash.TestHashGrouping
```

```Go
func TestHashGrouping(t *testing.T)
```

### <a id="TestHashBytesVsString" href="#TestHashBytesVsString">func TestHashBytesVsString(t *testing.T)</a>

```
searchKey: maphash.TestHashBytesVsString
```

```Go
func TestHashBytesVsString(t *testing.T)
```

### <a id="TestHashHighBytes" href="#TestHashHighBytes">func TestHashHighBytes(t *testing.T)</a>

```
searchKey: maphash.TestHashHighBytes
```

```Go
func TestHashHighBytes(t *testing.T)
```

### <a id="TestRepeat" href="#TestRepeat">func TestRepeat(t *testing.T)</a>

```
searchKey: maphash.TestRepeat
```

```Go
func TestRepeat(t *testing.T)
```

### <a id="TestSeedFromSum64" href="#TestSeedFromSum64">func TestSeedFromSum64(t *testing.T)</a>

```
searchKey: maphash.TestSeedFromSum64
```

```Go
func TestSeedFromSum64(t *testing.T)
```

### <a id="TestSeedFromSeed" href="#TestSeedFromSeed">func TestSeedFromSeed(t *testing.T)</a>

```
searchKey: maphash.TestSeedFromSeed
```

```Go
func TestSeedFromSeed(t *testing.T)
```

### <a id="TestSeedFromFlush" href="#TestSeedFromFlush">func TestSeedFromFlush(t *testing.T)</a>

```
searchKey: maphash.TestSeedFromFlush
```

```Go
func TestSeedFromFlush(t *testing.T)
```

### <a id="TestSeedFromReset" href="#TestSeedFromReset">func TestSeedFromReset(t *testing.T)</a>

```
searchKey: maphash.TestSeedFromReset
```

```Go
func TestSeedFromReset(t *testing.T)
```

### <a id="benchmarkSize" href="#benchmarkSize">func benchmarkSize(b *testing.B, size int)</a>

```
searchKey: maphash.benchmarkSize
```

```Go
func benchmarkSize(b *testing.B, size int)
```

### <a id="BenchmarkHash8Bytes" href="#BenchmarkHash8Bytes">func BenchmarkHash8Bytes(b *testing.B)</a>

```
searchKey: maphash.BenchmarkHash8Bytes
```

```Go
func BenchmarkHash8Bytes(b *testing.B)
```

### <a id="BenchmarkHash320Bytes" href="#BenchmarkHash320Bytes">func BenchmarkHash320Bytes(b *testing.B)</a>

```
searchKey: maphash.BenchmarkHash320Bytes
```

```Go
func BenchmarkHash320Bytes(b *testing.B)
```

### <a id="BenchmarkHash1K" href="#BenchmarkHash1K">func BenchmarkHash1K(b *testing.B)</a>

```
searchKey: maphash.BenchmarkHash1K
```

```Go
func BenchmarkHash1K(b *testing.B)
```

### <a id="BenchmarkHash8K" href="#BenchmarkHash8K">func BenchmarkHash8K(b *testing.B)</a>

```
searchKey: maphash.BenchmarkHash8K
```

```Go
func BenchmarkHash8K(b *testing.B)
```

### <a id="TestSmhasherSanity" href="#TestSmhasherSanity">func TestSmhasherSanity(t *testing.T)</a>

```
searchKey: maphash.TestSmhasherSanity
```

```Go
func TestSmhasherSanity(t *testing.T)
```

Sanity checks. hash should not depend on values outside key. hash should not depend on alignment. 

### <a id="bytesHash" href="#bytesHash">func bytesHash(b []byte) uint64</a>

```
searchKey: maphash.bytesHash
```

```Go
func bytesHash(b []byte) uint64
```

### <a id="stringHash" href="#stringHash">func stringHash(s string) uint64</a>

```
searchKey: maphash.stringHash
```

```Go
func stringHash(s string) uint64
```

### <a id="randBytes" href="#randBytes">func randBytes(r *rand.Rand, b []byte)</a>

```
searchKey: maphash.randBytes
```

```Go
func randBytes(r *rand.Rand, b []byte)
```

### <a id="TestSmhasherAppendedZeros" href="#TestSmhasherAppendedZeros">func TestSmhasherAppendedZeros(t *testing.T)</a>

```
searchKey: maphash.TestSmhasherAppendedZeros
```

```Go
func TestSmhasherAppendedZeros(t *testing.T)
```

a string plus adding zeros must make distinct hashes 

### <a id="TestSmhasherSmallKeys" href="#TestSmhasherSmallKeys">func TestSmhasherSmallKeys(t *testing.T)</a>

```
searchKey: maphash.TestSmhasherSmallKeys
```

```Go
func TestSmhasherSmallKeys(t *testing.T)
```

All 0-3 byte strings have distinct hashes. 

### <a id="TestSmhasherZeros" href="#TestSmhasherZeros">func TestSmhasherZeros(t *testing.T)</a>

```
searchKey: maphash.TestSmhasherZeros
```

```Go
func TestSmhasherZeros(t *testing.T)
```

Different length strings of all zeros have distinct hashes. 

### <a id="TestSmhasherTwoNonzero" href="#TestSmhasherTwoNonzero">func TestSmhasherTwoNonzero(t *testing.T)</a>

```
searchKey: maphash.TestSmhasherTwoNonzero
```

```Go
func TestSmhasherTwoNonzero(t *testing.T)
```

Strings with up to two nonzero bytes all have distinct hashes. 

### <a id="twoNonZero" href="#twoNonZero">func twoNonZero(h *hashSet, n int)</a>

```
searchKey: maphash.twoNonZero
```

```Go
func twoNonZero(h *hashSet, n int)
```

### <a id="TestSmhasherCyclic" href="#TestSmhasherCyclic">func TestSmhasherCyclic(t *testing.T)</a>

```
searchKey: maphash.TestSmhasherCyclic
```

```Go
func TestSmhasherCyclic(t *testing.T)
```

Test strings with repeats, like "abcdabcdabcdabcd..." 

### <a id="TestSmhasherSparse" href="#TestSmhasherSparse">func TestSmhasherSparse(t *testing.T)</a>

```
searchKey: maphash.TestSmhasherSparse
```

```Go
func TestSmhasherSparse(t *testing.T)
```

Test strings with only a few bits set 

### <a id="sparse" href="#sparse">func sparse(t *testing.T, n int, k int)</a>

```
searchKey: maphash.sparse
```

```Go
func sparse(t *testing.T, n int, k int)
```

### <a id="setbits" href="#setbits">func setbits(h *hashSet, b []byte, i int, k int)</a>

```
searchKey: maphash.setbits
```

```Go
func setbits(h *hashSet, b []byte, i int, k int)
```

set up to k bits at index i and greater 

### <a id="TestSmhasherPermutation" href="#TestSmhasherPermutation">func TestSmhasherPermutation(t *testing.T)</a>

```
searchKey: maphash.TestSmhasherPermutation
```

```Go
func TestSmhasherPermutation(t *testing.T)
```

Test all possible combinations of n blocks from the set s. "permutation" is a bad name here, but it is what Smhasher uses. 

### <a id="permutation" href="#permutation">func permutation(t *testing.T, s []uint32, n int)</a>

```
searchKey: maphash.permutation
```

```Go
func permutation(t *testing.T, s []uint32, n int)
```

### <a id="genPerm" href="#genPerm">func genPerm(h *hashSet, b []byte, s []uint32, n int)</a>

```
searchKey: maphash.genPerm
```

```Go
func genPerm(h *hashSet, b []byte, s []uint32, n int)
```

### <a id="TestSmhasherAvalanche" href="#TestSmhasherAvalanche">func TestSmhasherAvalanche(t *testing.T)</a>

```
searchKey: maphash.TestSmhasherAvalanche
```

```Go
func TestSmhasherAvalanche(t *testing.T)
```

Flipping a single bit of a key should flip each output bit with 50% probability. 

### <a id="avalancheTest1" href="#avalancheTest1">func avalancheTest1(t *testing.T, k key)</a>

```
searchKey: maphash.avalancheTest1
```

```Go
func avalancheTest1(t *testing.T, k key)
```

### <a id="TestSmhasherWindowed" href="#TestSmhasherWindowed">func TestSmhasherWindowed(t *testing.T)</a>

```
searchKey: maphash.TestSmhasherWindowed
```

```Go
func TestSmhasherWindowed(t *testing.T)
```

All bit rotations of a set of distinct keys 

### <a id="windowed" href="#windowed">func windowed(t *testing.T, k key)</a>

```
searchKey: maphash.windowed
```

```Go
func windowed(t *testing.T, k key)
```

### <a id="TestSmhasherText" href="#TestSmhasherText">func TestSmhasherText(t *testing.T)</a>

```
searchKey: maphash.TestSmhasherText
```

```Go
func TestSmhasherText(t *testing.T)
```

All keys of the form prefix + [A-Za-z0-9]*N + suffix. 

### <a id="text" href="#text">func text(t *testing.T, prefix, suffix string)</a>

```
searchKey: maphash.text
```

```Go
func text(t *testing.T, prefix, suffix string)
```

### <a id="TestSmhasherSeed" href="#TestSmhasherSeed">func TestSmhasherSeed(t *testing.T)</a>

```
searchKey: maphash.TestSmhasherSeed
```

```Go
func TestSmhasherSeed(t *testing.T)
```

Make sure different seed values generate different hashes. 
