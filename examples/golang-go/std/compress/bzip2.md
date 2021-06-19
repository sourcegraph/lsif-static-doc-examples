# Package bzip2

Package bzip2 implements bzip2 decompression. 

## Index

* [Constants](#const)
    * [const bzip2FileMagic](#bzip2FileMagic)
    * [const bzip2BlockMagic](#bzip2BlockMagic)
    * [const bzip2FinalMagic](#bzip2FinalMagic)
    * [const invalidNodeValue](#invalidNodeValue)
* [Variables](#var)
    * [var crctab](#crctab)
    * [var digits](#digits)
    * [var newton](#newton)
    * [var random](#random)
* [Types](#type)
    * [type bitReader struct](#bitReader)
        * [func newBitReader(r io.Reader) bitReader](#newBitReader)
        * [func (br *bitReader) ReadBits64(bits uint) (n uint64)](#bitReader.ReadBits64)
        * [func (br *bitReader) ReadBits(bits uint) (n int)](#bitReader.ReadBits)
        * [func (br *bitReader) ReadBit() bool](#bitReader.ReadBit)
        * [func (br *bitReader) Err() error](#bitReader.Err)
    * [type StructuralError string](#StructuralError)
        * [func (s StructuralError) Error() string](#StructuralError.Error)
    * [type reader struct](#reader)
        * [func (bz2 *reader) setup(needMagic bool) error](#reader.setup)
        * [func (bz2 *reader) Read(buf []byte) (n int, err error)](#reader.Read)
        * [func (bz2 *reader) readFromBlock(buf []byte) int](#reader.readFromBlock)
        * [func (bz2 *reader) read(buf []byte) (int, error)](#reader.read)
        * [func (bz2 *reader) readBlock() (err error)](#reader.readBlock)
    * [type huffmanTree struct](#huffmanTree)
        * [func newHuffmanTree(lengths []uint8) (huffmanTree, error)](#newHuffmanTree)
        * [func (t *huffmanTree) Decode(br *bitReader) (v uint16)](#huffmanTree.Decode)
    * [type huffmanNode struct](#huffmanNode)
    * [type huffmanSymbolLengthPair struct](#huffmanSymbolLengthPair)
    * [type huffmanCode struct](#huffmanCode)
    * [type moveToFrontDecoder []byte](#moveToFrontDecoder)
        * [func newMTFDecoder(symbols []byte) moveToFrontDecoder](#newMTFDecoder)
        * [func newMTFDecoderWithRange(n int) moveToFrontDecoder](#newMTFDecoderWithRange)
        * [func (m moveToFrontDecoder) Decode(n int) (b byte)](#moveToFrontDecoder.Decode)
        * [func (m moveToFrontDecoder) First() byte](#moveToFrontDecoder.First)
* [Functions](#func)
    * [func NewReader(r io.Reader) io.Reader](#NewReader)
    * [func inverseBWT(tt []uint32, origPtr uint, c []uint) uint32](#inverseBWT)
    * [func init()](#init)
    * [func updateCRC(val uint32, b []byte) uint32](#updateCRC)
    * [func buildHuffmanNode(t *huffmanTree, codes []huffmanCode, level uint32) (nodeIndex uint16, err error)](#buildHuffmanNode)
    * [func mustDecodeHex(s string) []byte](#mustDecodeHex)
    * [func mustLoadFile(f string) []byte](#mustLoadFile)
    * [func trim(b []byte) string](#trim)
    * [func TestReader(t *testing.T)](#TestReader)
    * [func TestBitReader(t *testing.T)](#TestBitReader)
    * [func TestMTF(t *testing.T)](#TestMTF)
    * [func TestZeroRead(t *testing.T)](#TestZeroRead)
    * [func benchmarkDecode(b *testing.B, compressed []byte)](#benchmarkDecode)
    * [func BenchmarkDecodeDigits(b *testing.B)](#BenchmarkDecodeDigits)
    * [func BenchmarkDecodeNewton(b *testing.B)](#BenchmarkDecodeNewton)
    * [func BenchmarkDecodeRand(b *testing.B)](#BenchmarkDecodeRand)


## <a id="const" href="#const">Constants</a>

```
tags: [exported]
```

### <a id="bzip2FileMagic" href="#bzip2FileMagic">const bzip2FileMagic</a>

```
searchKey: bzip2.bzip2FileMagic
```

```Go
const bzip2FileMagic = 0x425a // "BZ"

```

### <a id="bzip2BlockMagic" href="#bzip2BlockMagic">const bzip2BlockMagic</a>

```
searchKey: bzip2.bzip2BlockMagic
```

```Go
const bzip2BlockMagic = 0x314159265359
```

### <a id="bzip2FinalMagic" href="#bzip2FinalMagic">const bzip2FinalMagic</a>

```
searchKey: bzip2.bzip2FinalMagic
```

```Go
const bzip2FinalMagic = 0x177245385090
```

### <a id="invalidNodeValue" href="#invalidNodeValue">const invalidNodeValue</a>

```
searchKey: bzip2.invalidNodeValue
```

```Go
const invalidNodeValue = 0xffff
```

invalidNodeValue is an invalid index which marks a leaf node in the tree. 

## <a id="var" href="#var">Variables</a>

```
tags: [exported]
```

### <a id="crctab" href="#crctab">var crctab</a>

```
searchKey: bzip2.crctab
```

```Go
var crctab [256]uint32
```

### <a id="digits" href="#digits">var digits</a>

```
searchKey: bzip2.digits
```

```Go
var digits = mustLoadFile("testdata/e.txt.bz2")
```

### <a id="newton" href="#newton">var newton</a>

```
searchKey: bzip2.newton
```

```Go
var newton = mustLoadFile("testdata/Isaac.Newton-Opticks.txt.bz2")
```

### <a id="random" href="#random">var random</a>

```
searchKey: bzip2.random
```

```Go
var random = mustLoadFile("testdata/random.data.bz2")
```

## <a id="type" href="#type">Types</a>

```
tags: [exported]
```

### <a id="bitReader" href="#bitReader">type bitReader struct</a>

```
searchKey: bzip2.bitReader
```

```Go
type bitReader struct {
	r    io.ByteReader
	n    uint64
	bits uint
	err  error
}
```

bitReader wraps an io.Reader and provides the ability to read values, bit-by-bit, from it. Its Read* methods don't return the usual error because the error handling was verbose. Instead, any error is kept and can be checked afterwards. 

#### <a id="newBitReader" href="#newBitReader">func newBitReader(r io.Reader) bitReader</a>

```
searchKey: bzip2.newBitReader
```

```Go
func newBitReader(r io.Reader) bitReader
```

newBitReader returns a new bitReader reading from r. If r is not already an io.ByteReader, it will be converted via a bufio.Reader. 

#### <a id="bitReader.ReadBits64" href="#bitReader.ReadBits64">func (br *bitReader) ReadBits64(bits uint) (n uint64)</a>

```
searchKey: bzip2.bitReader.ReadBits64
```

```Go
func (br *bitReader) ReadBits64(bits uint) (n uint64)
```

ReadBits64 reads the given number of bits and returns them in the least-significant part of a uint64. In the event of an error, it returns 0 and the error can be obtained by calling Err(). 

#### <a id="bitReader.ReadBits" href="#bitReader.ReadBits">func (br *bitReader) ReadBits(bits uint) (n int)</a>

```
searchKey: bzip2.bitReader.ReadBits
```

```Go
func (br *bitReader) ReadBits(bits uint) (n int)
```

#### <a id="bitReader.ReadBit" href="#bitReader.ReadBit">func (br *bitReader) ReadBit() bool</a>

```
searchKey: bzip2.bitReader.ReadBit
```

```Go
func (br *bitReader) ReadBit() bool
```

#### <a id="bitReader.Err" href="#bitReader.Err">func (br *bitReader) Err() error</a>

```
searchKey: bzip2.bitReader.Err
```

```Go
func (br *bitReader) Err() error
```

### <a id="StructuralError" href="#StructuralError">type StructuralError string</a>

```
searchKey: bzip2.StructuralError
tags: [exported]
```

```Go
type StructuralError string
```

A StructuralError is returned when the bzip2 data is found to be syntactically invalid. 

#### <a id="StructuralError.Error" href="#StructuralError.Error">func (s StructuralError) Error() string</a>

```
searchKey: bzip2.StructuralError.Error
tags: [exported]
```

```Go
func (s StructuralError) Error() string
```

### <a id="reader" href="#reader">type reader struct</a>

```
searchKey: bzip2.reader
```

```Go
type reader struct {
	br           bitReader
	fileCRC      uint32
	blockCRC     uint32
	wantBlockCRC uint32
	setupDone    bool // true if we have parsed the bzip2 header.
	blockSize    int  // blockSize in bytes, i.e. 900 * 1000.
	eof          bool
	c            [256]uint // the ``C'' array for the inverse BWT.
	tt           []uint32  // mirrors the ``tt'' array in the bzip2 source and contains the P array in the upper 24 bits.
	tPos         uint32    // Index of the next output byte in tt.

	preRLE      []uint32 // contains the RLE data still to be processed.
	preRLEUsed  int      // number of entries of preRLE used.
	lastByte    int      // the last byte value seen.
	byteRepeats uint     // the number of repeats of lastByte seen.
	repeats     uint     // the number of copies of lastByte to output.
}
```

A reader decompresses bzip2 compressed data. 

#### <a id="reader.setup" href="#reader.setup">func (bz2 *reader) setup(needMagic bool) error</a>

```
searchKey: bzip2.reader.setup
```

```Go
func (bz2 *reader) setup(needMagic bool) error
```

setup parses the bzip2 header. 

#### <a id="reader.Read" href="#reader.Read">func (bz2 *reader) Read(buf []byte) (n int, err error)</a>

```
searchKey: bzip2.reader.Read
```

```Go
func (bz2 *reader) Read(buf []byte) (n int, err error)
```

#### <a id="reader.readFromBlock" href="#reader.readFromBlock">func (bz2 *reader) readFromBlock(buf []byte) int</a>

```
searchKey: bzip2.reader.readFromBlock
```

```Go
func (bz2 *reader) readFromBlock(buf []byte) int
```

#### <a id="reader.read" href="#reader.read">func (bz2 *reader) read(buf []byte) (int, error)</a>

```
searchKey: bzip2.reader.read
```

```Go
func (bz2 *reader) read(buf []byte) (int, error)
```

#### <a id="reader.readBlock" href="#reader.readBlock">func (bz2 *reader) readBlock() (err error)</a>

```
searchKey: bzip2.reader.readBlock
```

```Go
func (bz2 *reader) readBlock() (err error)
```

readBlock reads a bzip2 block. The magic number should already have been consumed. 

### <a id="huffmanTree" href="#huffmanTree">type huffmanTree struct</a>

```
searchKey: bzip2.huffmanTree
```

```Go
type huffmanTree struct {
	// nodes contains all the non-leaf nodes in the tree. nodes[0] is the
	// root of the tree and nextNode contains the index of the next element
	// of nodes to use when the tree is being constructed.
	nodes    []huffmanNode
	nextNode int
}
```

A huffmanTree is a binary tree which is navigated, bit-by-bit to reach a symbol. 

#### <a id="newHuffmanTree" href="#newHuffmanTree">func newHuffmanTree(lengths []uint8) (huffmanTree, error)</a>

```
searchKey: bzip2.newHuffmanTree
```

```Go
func newHuffmanTree(lengths []uint8) (huffmanTree, error)
```

newHuffmanTree builds a Huffman tree from a slice containing the code lengths of each symbol. The maximum code length is 32 bits. 

#### <a id="huffmanTree.Decode" href="#huffmanTree.Decode">func (t *huffmanTree) Decode(br *bitReader) (v uint16)</a>

```
searchKey: bzip2.huffmanTree.Decode
```

```Go
func (t *huffmanTree) Decode(br *bitReader) (v uint16)
```

Decode reads bits from the given bitReader and navigates the tree until a symbol is found. 

### <a id="huffmanNode" href="#huffmanNode">type huffmanNode struct</a>

```
searchKey: bzip2.huffmanNode
```

```Go
type huffmanNode struct {
	left, right           uint16
	leftValue, rightValue uint16
}
```

A huffmanNode is a node in the tree. left and right contain indexes into the nodes slice of the tree. If left or right is invalidNodeValue then the child is a left node and its value is in leftValue/rightValue. 

The symbols are uint16s because bzip2 encodes not only MTF indexes in the tree, but also two magic values for run-length encoding and an EOF symbol. Thus there are more than 256 possible symbols. 

### <a id="huffmanSymbolLengthPair" href="#huffmanSymbolLengthPair">type huffmanSymbolLengthPair struct</a>

```
searchKey: bzip2.huffmanSymbolLengthPair
```

```Go
type huffmanSymbolLengthPair struct {
	value  uint16
	length uint8
}
```

huffmanSymbolLengthPair contains a symbol and its code length. 

### <a id="huffmanCode" href="#huffmanCode">type huffmanCode struct</a>

```
searchKey: bzip2.huffmanCode
```

```Go
type huffmanCode struct {
	code    uint32
	codeLen uint8
	value   uint16
}
```

huffmanCode contains a symbol, its code and code length. 

### <a id="moveToFrontDecoder" href="#moveToFrontDecoder">type moveToFrontDecoder []byte</a>

```
searchKey: bzip2.moveToFrontDecoder
```

```Go
type moveToFrontDecoder []byte
```

moveToFrontDecoder implements a move-to-front list. Such a list is an efficient way to transform a string with repeating elements into one with many small valued numbers, which is suitable for entropy encoding. It works by starting with an initial list of symbols and references symbols by their index into that list. When a symbol is referenced, it's moved to the front of the list. Thus, a repeated symbol ends up being encoded with many zeros, as the symbol will be at the front of the list after the first access. 

#### <a id="newMTFDecoder" href="#newMTFDecoder">func newMTFDecoder(symbols []byte) moveToFrontDecoder</a>

```
searchKey: bzip2.newMTFDecoder
```

```Go
func newMTFDecoder(symbols []byte) moveToFrontDecoder
```

newMTFDecoder creates a move-to-front decoder with an explicit initial list of symbols. 

#### <a id="newMTFDecoderWithRange" href="#newMTFDecoderWithRange">func newMTFDecoderWithRange(n int) moveToFrontDecoder</a>

```
searchKey: bzip2.newMTFDecoderWithRange
```

```Go
func newMTFDecoderWithRange(n int) moveToFrontDecoder
```

newMTFDecoderWithRange creates a move-to-front decoder with an initial symbol list of 0...n-1. 

#### <a id="moveToFrontDecoder.Decode" href="#moveToFrontDecoder.Decode">func (m moveToFrontDecoder) Decode(n int) (b byte)</a>

```
searchKey: bzip2.moveToFrontDecoder.Decode
```

```Go
func (m moveToFrontDecoder) Decode(n int) (b byte)
```

#### <a id="moveToFrontDecoder.First" href="#moveToFrontDecoder.First">func (m moveToFrontDecoder) First() byte</a>

```
searchKey: bzip2.moveToFrontDecoder.First
```

```Go
func (m moveToFrontDecoder) First() byte
```

First returns the symbol at the front of the list. 

## <a id="func" href="#func">Functions</a>

```
tags: [exported]
```

### <a id="NewReader" href="#NewReader">func NewReader(r io.Reader) io.Reader</a>

```
searchKey: bzip2.NewReader
tags: [exported]
```

```Go
func NewReader(r io.Reader) io.Reader
```

NewReader returns an io.Reader which decompresses bzip2 data from r. If r does not also implement io.ByteReader, the decompressor may read more data than necessary from r. 

### <a id="inverseBWT" href="#inverseBWT">func inverseBWT(tt []uint32, origPtr uint, c []uint) uint32</a>

```
searchKey: bzip2.inverseBWT
```

```Go
func inverseBWT(tt []uint32, origPtr uint, c []uint) uint32
```

inverseBWT implements the inverse Burrows-Wheeler transform as described in [http://www.hpl.hp.com/techreports/Compaq-DEC/SRC-RR-124.pdf](http://www.hpl.hp.com/techreports/Compaq-DEC/SRC-RR-124.pdf), section 4.2. In that document, origPtr is called `I' and c is the `C' array after the first pass over the data. It's an argument here because we merge the first pass with the Huffman decoding. 

This also implements the `single array' method from the bzip2 source code which leaves the output, still shuffled, in the bottom 8 bits of tt with the index of the next byte in the top 24-bits. The index of the first byte is returned. 

### <a id="init" href="#init">func init()</a>

```
searchKey: bzip2.init
```

```Go
func init()
```

### <a id="updateCRC" href="#updateCRC">func updateCRC(val uint32, b []byte) uint32</a>

```
searchKey: bzip2.updateCRC
```

```Go
func updateCRC(val uint32, b []byte) uint32
```

updateCRC updates the crc value to incorporate the data in b. The initial value is 0. 

### <a id="buildHuffmanNode" href="#buildHuffmanNode">func buildHuffmanNode(t *huffmanTree, codes []huffmanCode, level uint32) (nodeIndex uint16, err error)</a>

```
searchKey: bzip2.buildHuffmanNode
```

```Go
func buildHuffmanNode(t *huffmanTree, codes []huffmanCode, level uint32) (nodeIndex uint16, err error)
```

buildHuffmanNode takes a slice of sorted huffmanCodes and builds a node in the Huffman tree at the given level. It returns the index of the newly constructed node. 

### <a id="mustDecodeHex" href="#mustDecodeHex">func mustDecodeHex(s string) []byte</a>

```
searchKey: bzip2.mustDecodeHex
```

```Go
func mustDecodeHex(s string) []byte
```

### <a id="mustLoadFile" href="#mustLoadFile">func mustLoadFile(f string) []byte</a>

```
searchKey: bzip2.mustLoadFile
```

```Go
func mustLoadFile(f string) []byte
```

### <a id="trim" href="#trim">func trim(b []byte) string</a>

```
searchKey: bzip2.trim
```

```Go
func trim(b []byte) string
```

### <a id="TestReader" href="#TestReader">func TestReader(t *testing.T)</a>

```
searchKey: bzip2.TestReader
```

```Go
func TestReader(t *testing.T)
```

### <a id="TestBitReader" href="#TestBitReader">func TestBitReader(t *testing.T)</a>

```
searchKey: bzip2.TestBitReader
```

```Go
func TestBitReader(t *testing.T)
```

### <a id="TestMTF" href="#TestMTF">func TestMTF(t *testing.T)</a>

```
searchKey: bzip2.TestMTF
```

```Go
func TestMTF(t *testing.T)
```

### <a id="TestZeroRead" href="#TestZeroRead">func TestZeroRead(t *testing.T)</a>

```
searchKey: bzip2.TestZeroRead
```

```Go
func TestZeroRead(t *testing.T)
```

### <a id="benchmarkDecode" href="#benchmarkDecode">func benchmarkDecode(b *testing.B, compressed []byte)</a>

```
searchKey: bzip2.benchmarkDecode
```

```Go
func benchmarkDecode(b *testing.B, compressed []byte)
```

### <a id="BenchmarkDecodeDigits" href="#BenchmarkDecodeDigits">func BenchmarkDecodeDigits(b *testing.B)</a>

```
searchKey: bzip2.BenchmarkDecodeDigits
```

```Go
func BenchmarkDecodeDigits(b *testing.B)
```

### <a id="BenchmarkDecodeNewton" href="#BenchmarkDecodeNewton">func BenchmarkDecodeNewton(b *testing.B)</a>

```
searchKey: bzip2.BenchmarkDecodeNewton
```

```Go
func BenchmarkDecodeNewton(b *testing.B)
```

### <a id="BenchmarkDecodeRand" href="#BenchmarkDecodeRand">func BenchmarkDecodeRand(b *testing.B)</a>

```
searchKey: bzip2.BenchmarkDecodeRand
```

```Go
func BenchmarkDecodeRand(b *testing.B)
```

