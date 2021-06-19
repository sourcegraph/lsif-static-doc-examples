# Package flate

Package flate implements the DEFLATE compressed data format, described in RFC 1951.  The gzip and zlib packages implement access to DEFLATE-based file formats. 

## Index

* [Constants](#const)
    * [const NoCompression](#NoCompression)
    * [const BestSpeed](#BestSpeed)
    * [const BestCompression](#BestCompression)
    * [const DefaultCompression](#DefaultCompression)
    * [const HuffmanOnly](#HuffmanOnly)
    * [const logWindowSize](#logWindowSize)
    * [const windowSize](#windowSize)
    * [const windowMask](#windowMask)
    * [const baseMatchLength](#baseMatchLength)
    * [const minMatchLength](#minMatchLength)
    * [const maxMatchLength](#maxMatchLength)
    * [const baseMatchOffset](#baseMatchOffset)
    * [const maxMatchOffset](#maxMatchOffset)
    * [const maxFlateBlockTokens](#maxFlateBlockTokens)
    * [const maxStoreBlockSize](#maxStoreBlockSize)
    * [const hashBits](#hashBits)
    * [const hashSize](#hashSize)
    * [const hashMask](#hashMask)
    * [const maxHashOffset](#maxHashOffset)
    * [const skipNever](#skipNever)
    * [const hashmul](#hashmul)
    * [const tableBits](#tableBits)
    * [const tableSize](#tableSize)
    * [const tableMask](#tableMask)
    * [const tableShift](#tableShift)
    * [const bufferReset](#bufferReset)
    * [const inputMargin](#inputMargin)
    * [const minNonLiteralBlockSize](#minNonLiteralBlockSize)
    * [const offsetCodeCount](#offsetCodeCount)
    * [const endBlockMarker](#endBlockMarker)
    * [const lengthCodesStart](#lengthCodesStart)
    * [const codegenCodeCount](#codegenCodeCount)
    * [const badCode](#badCode)
    * [const bufferFlushSize](#bufferFlushSize)
    * [const bufferSize](#bufferSize)
    * [const maxBitsLimit](#maxBitsLimit)
    * [const maxCodeLen](#maxCodeLen)
    * [const maxNumLit](#maxNumLit)
    * [const maxNumDist](#maxNumDist)
    * [const numCodes](#numCodes)
    * [const huffmanChunkBits](#huffmanChunkBits)
    * [const huffmanNumChunks](#huffmanNumChunks)
    * [const huffmanCountMask](#huffmanCountMask)
    * [const huffmanValueShift](#huffmanValueShift)
    * [const lengthShift](#lengthShift)
    * [const offsetMask](#offsetMask)
    * [const typeMask](#typeMask)
    * [const literalType](#literalType)
    * [const matchType](#matchType)
    * [const ml](#ml)
* [Variables](#var)
    * [var levels](#levels)
    * [var lengthExtraBits](#lengthExtraBits)
    * [var lengthBase](#lengthBase)
    * [var offsetExtraBits](#offsetExtraBits)
    * [var offsetBase](#offsetBase)
    * [var codegenOrder](#codegenOrder)
    * [var huffOffset](#huffOffset)
    * [var fixedLiteralEncoding](#fixedLiteralEncoding)
    * [var fixedOffsetEncoding](#fixedOffsetEncoding)
    * [var fixedOnce](#fixedOnce)
    * [var fixedHuffmanDecoder](#fixedHuffmanDecoder)
    * [var codeOrder](#codeOrder)
    * [var lengthCodes](#lengthCodes)
    * [var offsetCodes](#offsetCodes)
    * [var deflateTests](#deflateTests)
    * [var deflateInflateTests](#deflateInflateTests)
    * [var reverseBitsTests](#reverseBitsTests)
    * [var deflateInflateStringTests](#deflateInflateStringTests)
    * [var errIO](#errIO)
    * [var update](#update)
    * [var writeBlockTests](#writeBlockTests)
    * [var suites](#suites)
    * [var levelTests](#levelTests)
    * [var sizes](#sizes)
* [Types](#type)
    * [type compressionLevel struct](#compressionLevel)
    * [type compressor struct](#compressor)
        * [func (d *compressor) fillDeflate(b []byte) int](#compressor.fillDeflate)
        * [func (d *compressor) writeBlock(tokens []token, index int) error](#compressor.writeBlock)
        * [func (d *compressor) fillWindow(b []byte)](#compressor.fillWindow)
        * [func (d *compressor) findMatch(pos int, prevHead int, prevLength int, lookahead int) (length, offset int, ok bool)](#compressor.findMatch)
        * [func (d *compressor) writeStoredBlock(buf []byte) error](#compressor.writeStoredBlock)
        * [func (d *compressor) encSpeed()](#compressor.encSpeed)
        * [func (d *compressor) initDeflate()](#compressor.initDeflate)
        * [func (d *compressor) deflate()](#compressor.deflate)
        * [func (d *compressor) fillStore(b []byte) int](#compressor.fillStore)
        * [func (d *compressor) store()](#compressor.store)
        * [func (d *compressor) storeHuff()](#compressor.storeHuff)
        * [func (d *compressor) write(b []byte) (n int, err error)](#compressor.write)
        * [func (d *compressor) syncFlush() error](#compressor.syncFlush)
        * [func (d *compressor) init(w io.Writer, level int) (err error)](#compressor.init)
        * [func (d *compressor) reset(w io.Writer)](#compressor.reset)
        * [func (d *compressor) close() error](#compressor.close)
    * [type dictWriter struct](#dictWriter)
        * [func (w *dictWriter) Write(b []byte) (n int, err error)](#dictWriter.Write)
    * [type Writer struct](#Writer)
        * [func NewWriter(w io.Writer, level int) (*Writer, error)](#NewWriter)
        * [func NewWriterDict(w io.Writer, level int, dict []byte) (*Writer, error)](#NewWriterDict)
        * [func (w *Writer) Write(data []byte) (n int, err error)](#Writer.Write)
        * [func (w *Writer) Flush() error](#Writer.Flush)
        * [func (w *Writer) Close() error](#Writer.Close)
        * [func (w *Writer) Reset(dst io.Writer)](#Writer.Reset)
    * [type tableEntry struct](#tableEntry)
    * [type deflateFast struct](#deflateFast)
        * [func newDeflateFast() *deflateFast](#newDeflateFast)
        * [func (e *deflateFast) encode(dst []token, src []byte) []token](#deflateFast.encode)
        * [func (e *deflateFast) matchLen(s, t int32, src []byte) int32](#deflateFast.matchLen)
        * [func (e *deflateFast) reset()](#deflateFast.reset)
        * [func (e *deflateFast) shiftOffsets()](#deflateFast.shiftOffsets)
    * [type dictDecoder struct](#dictDecoder)
        * [func (dd *dictDecoder) init(size int, dict []byte)](#dictDecoder.init)
        * [func (dd *dictDecoder) histSize() int](#dictDecoder.histSize)
        * [func (dd *dictDecoder) availRead() int](#dictDecoder.availRead)
        * [func (dd *dictDecoder) availWrite() int](#dictDecoder.availWrite)
        * [func (dd *dictDecoder) writeSlice() []byte](#dictDecoder.writeSlice)
        * [func (dd *dictDecoder) writeMark(cnt int)](#dictDecoder.writeMark)
        * [func (dd *dictDecoder) writeByte(c byte)](#dictDecoder.writeByte)
        * [func (dd *dictDecoder) writeCopy(dist, length int) int](#dictDecoder.writeCopy)
        * [func (dd *dictDecoder) tryWriteCopy(dist, length int) int](#dictDecoder.tryWriteCopy)
        * [func (dd *dictDecoder) readFlush() []byte](#dictDecoder.readFlush)
    * [type huffmanBitWriter struct](#huffmanBitWriter)
        * [func newHuffmanBitWriter(w io.Writer) *huffmanBitWriter](#newHuffmanBitWriter)
        * [func (w *huffmanBitWriter) reset(writer io.Writer)](#huffmanBitWriter.reset)
        * [func (w *huffmanBitWriter) flush()](#huffmanBitWriter.flush)
        * [func (w *huffmanBitWriter) write(b []byte)](#huffmanBitWriter.write)
        * [func (w *huffmanBitWriter) writeBits(b int32, nb uint)](#huffmanBitWriter.writeBits)
        * [func (w *huffmanBitWriter) writeBytes(bytes []byte)](#huffmanBitWriter.writeBytes)
        * [func (w *huffmanBitWriter) generateCodegen(numLiterals int, numOffsets int, litEnc, offEnc *huffmanEncoder)](#huffmanBitWriter.generateCodegen)
        * [func (w *huffmanBitWriter) dynamicSize(litEnc, offEnc *huffmanEncoder, extraBits int) (size, numCodegens int)](#huffmanBitWriter.dynamicSize)
        * [func (w *huffmanBitWriter) fixedSize(extraBits int) int](#huffmanBitWriter.fixedSize)
        * [func (w *huffmanBitWriter) storedSize(in []byte) (int, bool)](#huffmanBitWriter.storedSize)
        * [func (w *huffmanBitWriter) writeCode(c hcode)](#huffmanBitWriter.writeCode)
        * [func (w *huffmanBitWriter) writeDynamicHeader(numLiterals int, numOffsets int, numCodegens int, isEof bool)](#huffmanBitWriter.writeDynamicHeader)
        * [func (w *huffmanBitWriter) writeStoredHeader(length int, isEof bool)](#huffmanBitWriter.writeStoredHeader)
        * [func (w *huffmanBitWriter) writeFixedHeader(isEof bool)](#huffmanBitWriter.writeFixedHeader)
        * [func (w *huffmanBitWriter) writeBlock(tokens []token, eof bool, input []byte)](#huffmanBitWriter.writeBlock)
        * [func (w *huffmanBitWriter) writeBlockDynamic(tokens []token, eof bool, input []byte)](#huffmanBitWriter.writeBlockDynamic)
        * [func (w *huffmanBitWriter) indexTokens(tokens []token) (numLiterals, numOffsets int)](#huffmanBitWriter.indexTokens)
        * [func (w *huffmanBitWriter) writeTokens(tokens []token, leCodes, oeCodes []hcode)](#huffmanBitWriter.writeTokens)
        * [func (w *huffmanBitWriter) writeBlockHuff(eof bool, input []byte)](#huffmanBitWriter.writeBlockHuff)
    * [type hcode struct](#hcode)
        * [func (h *hcode) set(code uint16, length uint16)](#hcode.set)
    * [type huffmanEncoder struct](#huffmanEncoder)
        * [func newHuffmanEncoder(size int) *huffmanEncoder](#newHuffmanEncoder)
        * [func generateFixedLiteralEncoding() *huffmanEncoder](#generateFixedLiteralEncoding)
        * [func generateFixedOffsetEncoding() *huffmanEncoder](#generateFixedOffsetEncoding)
        * [func (h *huffmanEncoder) bitLength(freq []int32) int](#huffmanEncoder.bitLength)
        * [func (h *huffmanEncoder) bitCounts(list []literalNode, maxBits int32) []int32](#huffmanEncoder.bitCounts)
        * [func (h *huffmanEncoder) assignEncodingAndSize(bitCount []int32, list []literalNode)](#huffmanEncoder.assignEncodingAndSize)
        * [func (h *huffmanEncoder) generate(freq []int32, maxBits int32)](#huffmanEncoder.generate)
    * [type literalNode struct](#literalNode)
        * [func maxNode() literalNode](#maxNode)
    * [type levelInfo struct](#levelInfo)
    * [type byLiteral []flate.literalNode](#byLiteral)
        * [func (s *byLiteral) sort(a []literalNode)](#byLiteral.sort)
        * [func (s byLiteral) Len() int](#byLiteral.Len)
        * [func (s byLiteral) Less(i, j int) bool](#byLiteral.Less)
        * [func (s byLiteral) Swap(i, j int)](#byLiteral.Swap)
    * [type byFreq []flate.literalNode](#byFreq)
        * [func (s *byFreq) sort(a []literalNode)](#byFreq.sort)
        * [func (s byFreq) Len() int](#byFreq.Len)
        * [func (s byFreq) Less(i, j int) bool](#byFreq.Less)
        * [func (s byFreq) Swap(i, j int)](#byFreq.Swap)
    * [type CorruptInputError int64](#CorruptInputError)
        * [func (e CorruptInputError) Error() string](#CorruptInputError.Error)
    * [type InternalError string](#InternalError)
        * [func (e InternalError) Error() string](#InternalError.Error)
    * [type ReadError struct](#ReadError)
        * [func (e *ReadError) Error() string](#ReadError.Error)
    * [type WriteError struct](#WriteError)
        * [func (e *WriteError) Error() string](#WriteError.Error)
    * [type Resetter interface](#Resetter)
    * [type huffmanDecoder struct](#huffmanDecoder)
        * [func (h *huffmanDecoder) init(lengths []int) bool](#huffmanDecoder.init)
    * [type Reader interface](#Reader)
        * [func makeReader(r io.Reader) Reader](#makeReader)
    * [type decompressor struct](#decompressor)
        * [func (f *decompressor) nextBlock()](#decompressor.nextBlock)
        * [func (f *decompressor) Read(b []byte) (int, error)](#decompressor.Read)
        * [func (f *decompressor) Close() error](#decompressor.Close)
        * [func (f *decompressor) readHuffman() error](#decompressor.readHuffman)
        * [func (f *decompressor) huffmanBlock()](#decompressor.huffmanBlock)
        * [func (f *decompressor) dataBlock()](#decompressor.dataBlock)
        * [func (f *decompressor) copyData()](#decompressor.copyData)
        * [func (f *decompressor) finishBlock()](#decompressor.finishBlock)
        * [func (f *decompressor) moreBits() error](#decompressor.moreBits)
        * [func (f *decompressor) huffSym(h *huffmanDecoder) (int, error)](#decompressor.huffSym)
        * [func (f *decompressor) Reset(r io.Reader, dict []byte) error](#decompressor.Reset)
    * [type token uint32](#token)
        * [func literalToken(literal uint32) token](#literalToken)
        * [func matchToken(xlength uint32, xoffset uint32) token](#matchToken)
        * [func (t token) literal() uint32](#token.literal)
        * [func (t token) offset() uint32](#token.offset)
        * [func (t token) length() uint32](#token.length)
    * [type deflateTest struct](#deflateTest)
    * [type deflateInflateTest struct](#deflateInflateTest)
    * [type reverseBitsTest struct](#reverseBitsTest)
    * [type sparseReader struct](#sparseReader)
        * [func (r *sparseReader) Read(b []byte) (n int, err error)](#sparseReader.Read)
    * [type syncBuffer struct](#syncBuffer)
        * [func newSyncBuffer() *syncBuffer](#newSyncBuffer)
        * [func (b *syncBuffer) Read(p []byte) (n int, err error)](#syncBuffer.Read)
        * [func (b *syncBuffer) signal()](#syncBuffer.signal)
        * [func (b *syncBuffer) Write(p []byte) (n int, err error)](#syncBuffer.Write)
        * [func (b *syncBuffer) WriteMode()](#syncBuffer.WriteMode)
        * [func (b *syncBuffer) ReadMode()](#syncBuffer.ReadMode)
        * [func (b *syncBuffer) Close() error](#syncBuffer.Close)
    * [type deflateInflateStringTest struct](#deflateInflateStringTest)
    * [type failWriter struct](#failWriter)
        * [func (w *failWriter) Write(b []byte) (int, error)](#failWriter.Write)
    * [type huffTest struct](#huffTest)
    * [type errorWriter struct](#errorWriter)
        * [func (e *errorWriter) Write(b []byte) (int, error)](#errorWriter.Write)
* [Functions](#func)
    * [func hash4(b []byte) uint32](#hash4)
    * [func bulkHash4(b []byte, dst []uint32)](#bulkHash4)
    * [func matchLen(a, b []byte, max int) int](#matchLen)
    * [func load32(b []byte, i int32) uint32](#load32)
    * [func load64(b []byte, i int32) uint64](#load64)
    * [func hash(u uint32) uint32](#hash)
    * [func emitLiteral(dst []token, lit []byte) []token](#emitLiteral)
    * [func init()](#init)
    * [func histogram(b []byte, h []int32)](#histogram)
    * [func reverseBits(number uint16, bitLength byte) uint16](#reverseBits)
    * [func noEOF(e error) error](#noEOF)
    * [func fixedHuffmanDecoderInit()](#fixedHuffmanDecoderInit)
    * [func NewReader(r io.Reader) io.ReadCloser](#NewReader)
    * [func NewReaderDict(r io.Reader, dict []byte) io.ReadCloser](#NewReaderDict)
    * [func lengthCode(len uint32) uint32](#lengthCode)
    * [func offsetCode(off uint32) uint32](#offsetCode)
    * [func largeDataChunk() []byte](#largeDataChunk)
    * [func TestBulkHash4(t *testing.T)](#TestBulkHash4)
    * [func TestDeflate(t *testing.T)](#TestDeflate)
    * [func TestVeryLongSparseChunk(t *testing.T)](#TestVeryLongSparseChunk)
    * [func testSync(t *testing.T, level int, input []byte, name string)](#testSync)
    * [func testToFromWithLevelAndLimit(t *testing.T, level int, input []byte, name string, limit int)](#testToFromWithLevelAndLimit)
    * [func testToFromWithLimit(t *testing.T, input []byte, name string, limit [11]int)](#testToFromWithLimit)
    * [func TestDeflateInflate(t *testing.T)](#TestDeflateInflate)
    * [func TestReverseBits(t *testing.T)](#TestReverseBits)
    * [func TestDeflateInflateString(t *testing.T)](#TestDeflateInflateString)
    * [func TestReaderDict(t *testing.T)](#TestReaderDict)
    * [func TestWriterDict(t *testing.T)](#TestWriterDict)
    * [func TestRegression2508(t *testing.T)](#TestRegression2508)
    * [func TestWriterReset(t *testing.T)](#TestWriterReset)
    * [func testResetOutput(t *testing.T, level int, dict []byte)](#testResetOutput)
    * [func TestBestSpeed(t *testing.T)](#TestBestSpeed)
    * [func TestWriterPersistentError(t *testing.T)](#TestWriterPersistentError)
    * [func TestBestSpeedMatch(t *testing.T)](#TestBestSpeedMatch)
    * [func TestBestSpeedMaxMatchOffset(t *testing.T)](#TestBestSpeedMaxMatchOffset)
    * [func TestBestSpeedShiftOffsets(t *testing.T)](#TestBestSpeedShiftOffsets)
    * [func TestMaxStackSize(t *testing.T)](#TestMaxStackSize)
    * [func TestDictDecoder(t *testing.T)](#TestDictDecoder)
    * [func TestIssue5915(t *testing.T)](#TestIssue5915)
    * [func TestIssue5962(t *testing.T)](#TestIssue5962)
    * [func TestIssue6255(t *testing.T)](#TestIssue6255)
    * [func TestInvalidEncoding(t *testing.T)](#TestInvalidEncoding)
    * [func TestInvalidBits(t *testing.T)](#TestInvalidBits)
    * [func TestStreams(t *testing.T)](#TestStreams)
    * [func TestTruncatedStreams(t *testing.T)](#TestTruncatedStreams)
    * [func TestReaderEarlyEOF(t *testing.T)](#TestReaderEarlyEOF)
    * [func TestBlockHuff(t *testing.T)](#TestBlockHuff)
    * [func testBlockHuff(t *testing.T, in, out string)](#testBlockHuff)
    * [func TestWriteBlock(t *testing.T)](#TestWriteBlock)
    * [func TestWriteBlockDynamic(t *testing.T)](#TestWriteBlockDynamic)
    * [func testBlock(t *testing.T, test huffTest, ttype string)](#testBlock)
    * [func writeToType(t *testing.T, ttype string, bw *huffmanBitWriter, tok []token, input []byte)](#writeToType)
    * [func testWriterEOF(t *testing.T, ttype string, test huffTest, useInput bool)](#testWriterEOF)
    * [func TestReset(t *testing.T)](#TestReset)
    * [func TestReaderTruncated(t *testing.T)](#TestReaderTruncated)
    * [func TestResetDict(t *testing.T)](#TestResetDict)
    * [func TestNlitOutOfRange(t *testing.T)](#TestNlitOutOfRange)
    * [func BenchmarkDecode(b *testing.B)](#BenchmarkDecode)
    * [func doBench(b *testing.B, f func(b *testing.B, buf []byte, level, n int))](#doBench)
    * [func BenchmarkEncode(b *testing.B)](#BenchmarkEncode)
    * [func TestWriteError(t *testing.T)](#TestWriteError)
    * [func TestDeterministic(t *testing.T)](#TestDeterministic)
    * [func testDeterministic(i int, t *testing.T)](#testDeterministic)
    * [func TestDeflateFast_Reset(t *testing.T)](#TestDeflateFast_Reset)


## <a id="const" href="#const">Constants</a>

```
tags: [exported]
```

### <a id="NoCompression" href="#NoCompression">const NoCompression</a>

```
searchKey: flate.NoCompression
tags: [exported]
```

```Go
const NoCompression = 0
```

### <a id="BestSpeed" href="#BestSpeed">const BestSpeed</a>

```
searchKey: flate.BestSpeed
tags: [exported]
```

```Go
const BestSpeed = 1
```

### <a id="BestCompression" href="#BestCompression">const BestCompression</a>

```
searchKey: flate.BestCompression
tags: [exported]
```

```Go
const BestCompression = 9
```

### <a id="DefaultCompression" href="#DefaultCompression">const DefaultCompression</a>

```
searchKey: flate.DefaultCompression
tags: [exported]
```

```Go
const DefaultCompression = -1
```

### <a id="HuffmanOnly" href="#HuffmanOnly">const HuffmanOnly</a>

```
searchKey: flate.HuffmanOnly
tags: [exported]
```

```Go
const HuffmanOnly = -2
```

HuffmanOnly disables Lempel-Ziv match searching and only performs Huffman entropy encoding. This mode is useful in compressing data that has already been compressed with an LZ style algorithm (e.g. Snappy or LZ4) that lacks an entropy encoder. Compression gains are achieved when certain bytes in the input stream occur more frequently than others. 

Note that HuffmanOnly produces a compressed output that is RFC 1951 compliant. That is, any valid DEFLATE decompressor will continue to be able to decompress this output. 

### <a id="logWindowSize" href="#logWindowSize">const logWindowSize</a>

```
searchKey: flate.logWindowSize
```

```Go
const logWindowSize = 15
```

### <a id="windowSize" href="#windowSize">const windowSize</a>

```
searchKey: flate.windowSize
```

```Go
const windowSize = 1 << logWindowSize
```

### <a id="windowMask" href="#windowMask">const windowMask</a>

```
searchKey: flate.windowMask
```

```Go
const windowMask = windowSize - 1
```

### <a id="baseMatchLength" href="#baseMatchLength">const baseMatchLength</a>

```
searchKey: flate.baseMatchLength
```

```Go
const baseMatchLength = 3 // The smallest match length per the RFC section 3.2.5

```

The LZ77 step produces a sequence of literal tokens and <length, offset> pair tokens. The offset is also known as distance. The underlying wire format limits the range of lengths and offsets. For example, there are 256 legitimate lengths: those in the range [3, 258]. This package's compressor uses a higher minimum match length, enabling optimizations such as finding matches via 32-bit loads and compares. 

### <a id="minMatchLength" href="#minMatchLength">const minMatchLength</a>

```
searchKey: flate.minMatchLength
```

```Go
const minMatchLength = 4 // The smallest match length that the compressor actually emits

```

### <a id="maxMatchLength" href="#maxMatchLength">const maxMatchLength</a>

```
searchKey: flate.maxMatchLength
```

```Go
const maxMatchLength = 258 // The largest match length

```

### <a id="baseMatchOffset" href="#baseMatchOffset">const baseMatchOffset</a>

```
searchKey: flate.baseMatchOffset
```

```Go
const baseMatchOffset = 1 // The smallest match offset

```

### <a id="maxMatchOffset" href="#maxMatchOffset">const maxMatchOffset</a>

```
searchKey: flate.maxMatchOffset
```

```Go
const maxMatchOffset = 1 << 15 // The largest match offset

```

### <a id="maxFlateBlockTokens" href="#maxFlateBlockTokens">const maxFlateBlockTokens</a>

```
searchKey: flate.maxFlateBlockTokens
```

```Go
const maxFlateBlockTokens = 1 << 14
```

The maximum number of tokens we put into a single flate block, just to stop things from getting too large. 

### <a id="maxStoreBlockSize" href="#maxStoreBlockSize">const maxStoreBlockSize</a>

```
searchKey: flate.maxStoreBlockSize
```

```Go
const maxStoreBlockSize = 65535
```

### <a id="hashBits" href="#hashBits">const hashBits</a>

```
searchKey: flate.hashBits
```

```Go
const hashBits = 17 // After 17 performance degrades

```

### <a id="hashSize" href="#hashSize">const hashSize</a>

```
searchKey: flate.hashSize
```

```Go
const hashSize = 1 << hashBits
```

### <a id="hashMask" href="#hashMask">const hashMask</a>

```
searchKey: flate.hashMask
```

```Go
const hashMask = (1 << hashBits) - 1
```

### <a id="maxHashOffset" href="#maxHashOffset">const maxHashOffset</a>

```
searchKey: flate.maxHashOffset
```

```Go
const maxHashOffset = 1 << 24
```

### <a id="skipNever" href="#skipNever">const skipNever</a>

```
searchKey: flate.skipNever
```

```Go
const skipNever = math.MaxInt32
```

### <a id="hashmul" href="#hashmul">const hashmul</a>

```
searchKey: flate.hashmul
```

```Go
const hashmul = 0x1e35a7bd
```

### <a id="tableBits" href="#tableBits">const tableBits</a>

```
searchKey: flate.tableBits
```

```Go
const tableBits = 14 // Bits used in the table.

```

### <a id="tableSize" href="#tableSize">const tableSize</a>

```
searchKey: flate.tableSize
```

```Go
const tableSize = 1 << tableBits // Size of the table.

```

### <a id="tableMask" href="#tableMask">const tableMask</a>

```
searchKey: flate.tableMask
```

```Go
const tableMask // Mask for table indices. Redundant, but can eliminate bounds checks.
 = ...
```

### <a id="tableShift" href="#tableShift">const tableShift</a>

```
searchKey: flate.tableShift
```

```Go
const tableShift // Right-shift to get the tableBits most significant bits of a uint32.
 = ...
```

### <a id="bufferReset" href="#bufferReset">const bufferReset</a>

```
searchKey: flate.bufferReset
```

```Go
const bufferReset = math.MaxInt32 - maxStoreBlockSize*2
```

Reset the buffer offset when reaching this. Offsets are stored between blocks as int32 values. Since the offset we are checking against is at the beginning of the buffer, we need to subtract the current and input buffer to not risk overflowing the int32. 

### <a id="inputMargin" href="#inputMargin">const inputMargin</a>

```
searchKey: flate.inputMargin
```

```Go
const inputMargin = 16 - 1
```

These constants are defined by the Snappy implementation so that its assembly implementation can fast-path some 16-bytes-at-a-time copies. They aren't necessary in the pure Go implementation, as we don't use those same optimizations, but using the same thresholds doesn't really hurt. 

### <a id="minNonLiteralBlockSize" href="#minNonLiteralBlockSize">const minNonLiteralBlockSize</a>

```
searchKey: flate.minNonLiteralBlockSize
```

```Go
const minNonLiteralBlockSize = 1 + 1 + inputMargin
```

These constants are defined by the Snappy implementation so that its assembly implementation can fast-path some 16-bytes-at-a-time copies. They aren't necessary in the pure Go implementation, as we don't use those same optimizations, but using the same thresholds doesn't really hurt. 

### <a id="offsetCodeCount" href="#offsetCodeCount">const offsetCodeCount</a>

```
searchKey: flate.offsetCodeCount
```

```Go
const offsetCodeCount = 30
```

The largest offset code. 

### <a id="endBlockMarker" href="#endBlockMarker">const endBlockMarker</a>

```
searchKey: flate.endBlockMarker
```

```Go
const endBlockMarker = 256
```

The special code used to mark the end of a block. 

### <a id="lengthCodesStart" href="#lengthCodesStart">const lengthCodesStart</a>

```
searchKey: flate.lengthCodesStart
```

```Go
const lengthCodesStart = 257
```

The first length code. 

### <a id="codegenCodeCount" href="#codegenCodeCount">const codegenCodeCount</a>

```
searchKey: flate.codegenCodeCount
```

```Go
const codegenCodeCount = 19
```

The number of codegen codes. 

### <a id="badCode" href="#badCode">const badCode</a>

```
searchKey: flate.badCode
```

```Go
const badCode = 255
```

### <a id="bufferFlushSize" href="#bufferFlushSize">const bufferFlushSize</a>

```
searchKey: flate.bufferFlushSize
```

```Go
const bufferFlushSize = 240
```

bufferFlushSize indicates the buffer size after which bytes are flushed to the writer. Should preferably be a multiple of 6, since we accumulate 6 bytes between writes to the buffer. 

### <a id="bufferSize" href="#bufferSize">const bufferSize</a>

```
searchKey: flate.bufferSize
```

```Go
const bufferSize = bufferFlushSize + 8
```

bufferSize is the actual output byte buffer size. It must have additional headroom for a flush which can contain up to 8 bytes. 

### <a id="maxBitsLimit" href="#maxBitsLimit">const maxBitsLimit</a>

```
searchKey: flate.maxBitsLimit
```

```Go
const maxBitsLimit = 16
```

### <a id="maxCodeLen" href="#maxCodeLen">const maxCodeLen</a>

```
searchKey: flate.maxCodeLen
```

```Go
const maxCodeLen = 16 // max length of Huffman code

```

### <a id="maxNumLit" href="#maxNumLit">const maxNumLit</a>

```
searchKey: flate.maxNumLit
```

```Go
const maxNumLit = 286
```

The next three numbers come from the RFC section 3.2.7, with the additional proviso in section 3.2.5 which implies that distance codes 30 and 31 should never occur in compressed data. 

### <a id="maxNumDist" href="#maxNumDist">const maxNumDist</a>

```
searchKey: flate.maxNumDist
```

```Go
const maxNumDist = 30
```

### <a id="numCodes" href="#numCodes">const numCodes</a>

```
searchKey: flate.numCodes
```

```Go
const numCodes = 19 // number of codes in Huffman meta-code

```

### <a id="huffmanChunkBits" href="#huffmanChunkBits">const huffmanChunkBits</a>

```
searchKey: flate.huffmanChunkBits
```

```Go
const huffmanChunkBits = 9
```

### <a id="huffmanNumChunks" href="#huffmanNumChunks">const huffmanNumChunks</a>

```
searchKey: flate.huffmanNumChunks
```

```Go
const huffmanNumChunks = 1 << huffmanChunkBits
```

### <a id="huffmanCountMask" href="#huffmanCountMask">const huffmanCountMask</a>

```
searchKey: flate.huffmanCountMask
```

```Go
const huffmanCountMask = 15
```

### <a id="huffmanValueShift" href="#huffmanValueShift">const huffmanValueShift</a>

```
searchKey: flate.huffmanValueShift
```

```Go
const huffmanValueShift = 4
```

### <a id="lengthShift" href="#lengthShift">const lengthShift</a>

```
searchKey: flate.lengthShift
```

```Go
const lengthShift = 22
```

2 bits:   type   0 = literal  1=EOF  2=Match   3=Unused 8 bits:   xlength = length - MIN_MATCH_LENGTH 22 bits   xoffset = offset - MIN_OFFSET_SIZE, or literal 

### <a id="offsetMask" href="#offsetMask">const offsetMask</a>

```
searchKey: flate.offsetMask
```

```Go
const offsetMask = 1<<lengthShift - 1
```

### <a id="typeMask" href="#typeMask">const typeMask</a>

```
searchKey: flate.typeMask
```

```Go
const typeMask = 3 << 30
```

### <a id="literalType" href="#literalType">const literalType</a>

```
searchKey: flate.literalType
```

```Go
const literalType = 0 << 30
```

### <a id="matchType" href="#matchType">const matchType</a>

```
searchKey: flate.matchType
```

```Go
const matchType = 1 << 30
```

### <a id="ml" href="#ml">const ml</a>

```
searchKey: flate.ml
```

```Go
const ml = 0x7fc00000 // Maximum length token. Used to reduce the size of writeBlockTests

```

## <a id="var" href="#var">Variables</a>

```
tags: [exported]
```

### <a id="levels" href="#levels">var levels</a>

```
searchKey: flate.levels
```

```Go
var levels = ...
```

### <a id="lengthExtraBits" href="#lengthExtraBits">var lengthExtraBits</a>

```
searchKey: flate.lengthExtraBits
```

```Go
var lengthExtraBits = ...
```

The number of extra bits needed by length code X - LENGTH_CODES_START. 

### <a id="lengthBase" href="#lengthBase">var lengthBase</a>

```
searchKey: flate.lengthBase
```

```Go
var lengthBase = ...
```

The length indicated by length code X - LENGTH_CODES_START. 

### <a id="offsetExtraBits" href="#offsetExtraBits">var offsetExtraBits</a>

```
searchKey: flate.offsetExtraBits
```

```Go
var offsetExtraBits = ...
```

offset code word extra bits. 

### <a id="offsetBase" href="#offsetBase">var offsetBase</a>

```
searchKey: flate.offsetBase
```

```Go
var offsetBase = ...
```

### <a id="codegenOrder" href="#codegenOrder">var codegenOrder</a>

```
searchKey: flate.codegenOrder
```

```Go
var codegenOrder = []uint32{16, 17, 18, 0, 8, 7, 9, 6, 10, 5, 11, 4, 12, 3, 13, 2, 14, 1, 15}
```

The odd order in which the codegen code sizes are written. 

### <a id="huffOffset" href="#huffOffset">var huffOffset</a>

```
searchKey: flate.huffOffset
```

```Go
var huffOffset *huffmanEncoder
```

huffOffset is a static offset encoder used for huffman only encoding. It can be reused since we will not be encoding offset values. 

### <a id="fixedLiteralEncoding" href="#fixedLiteralEncoding">var fixedLiteralEncoding</a>

```
searchKey: flate.fixedLiteralEncoding
```

```Go
var fixedLiteralEncoding *huffmanEncoder = generateFixedLiteralEncoding()
```

### <a id="fixedOffsetEncoding" href="#fixedOffsetEncoding">var fixedOffsetEncoding</a>

```
searchKey: flate.fixedOffsetEncoding
```

```Go
var fixedOffsetEncoding *huffmanEncoder = generateFixedOffsetEncoding()
```

### <a id="fixedOnce" href="#fixedOnce">var fixedOnce</a>

```
searchKey: flate.fixedOnce
```

```Go
var fixedOnce sync.Once
```

Initialize the fixedHuffmanDecoder only once upon first use. 

### <a id="fixedHuffmanDecoder" href="#fixedHuffmanDecoder">var fixedHuffmanDecoder</a>

```
searchKey: flate.fixedHuffmanDecoder
```

```Go
var fixedHuffmanDecoder huffmanDecoder
```

### <a id="codeOrder" href="#codeOrder">var codeOrder</a>

```
searchKey: flate.codeOrder
```

```Go
var codeOrder = [...]int{16, 17, 18, 0, 8, 7, 9, 6, 10, 5, 11, 4, 12, 3, 13, 2, 14, 1, 15}
```

### <a id="lengthCodes" href="#lengthCodes">var lengthCodes</a>

```
searchKey: flate.lengthCodes
```

```Go
var lengthCodes = ...
```

The length code for length X (MIN_MATCH_LENGTH <= X <= MAX_MATCH_LENGTH) is lengthCodes[length - MIN_MATCH_LENGTH] 

### <a id="offsetCodes" href="#offsetCodes">var offsetCodes</a>

```
searchKey: flate.offsetCodes
```

```Go
var offsetCodes = ...
```

### <a id="deflateTests" href="#deflateTests">var deflateTests</a>

```
searchKey: flate.deflateTests
```

```Go
var deflateTests = ...
```

### <a id="deflateInflateTests" href="#deflateInflateTests">var deflateInflateTests</a>

```
searchKey: flate.deflateInflateTests
```

```Go
var deflateInflateTests = ...
```

### <a id="reverseBitsTests" href="#reverseBitsTests">var reverseBitsTests</a>

```
searchKey: flate.reverseBitsTests
```

```Go
var reverseBitsTests = ...
```

### <a id="deflateInflateStringTests" href="#deflateInflateStringTests">var deflateInflateStringTests</a>

```
searchKey: flate.deflateInflateStringTests
```

```Go
var deflateInflateStringTests = ...
```

### <a id="errIO" href="#errIO">var errIO</a>

```
searchKey: flate.errIO
```

```Go
var errIO = errors.New("IO error")
```

### <a id="update" href="#update">var update</a>

```
searchKey: flate.update
```

```Go
var update = flag.Bool("update", false, "update reference files")
```

### <a id="writeBlockTests" href="#writeBlockTests">var writeBlockTests</a>

```
searchKey: flate.writeBlockTests
```

```Go
var writeBlockTests = ...
```

### <a id="suites" href="#suites">var suites</a>

```
searchKey: flate.suites
```

```Go
var suites = ...
```

### <a id="levelTests" href="#levelTests">var levelTests</a>

```
searchKey: flate.levelTests
```

```Go
var levelTests = ...
```

### <a id="sizes" href="#sizes">var sizes</a>

```
searchKey: flate.sizes
```

```Go
var sizes = []struct {
	name string
	n    int
}{
	{"1e4", 1e4},
	{"1e5", 1e5},
	{"1e6", 1e6},
}
```

## <a id="type" href="#type">Types</a>

```
tags: [exported]
```

### <a id="compressionLevel" href="#compressionLevel">type compressionLevel struct</a>

```
searchKey: flate.compressionLevel
```

```Go
type compressionLevel struct {
	level, good, lazy, nice, chain, fastSkipHashing int
}
```

### <a id="compressor" href="#compressor">type compressor struct</a>

```
searchKey: flate.compressor
```

```Go
type compressor struct {
	compressionLevel

	w          *huffmanBitWriter
	bulkHasher func([]byte, []uint32)

	// compression algorithm
	fill      func(*compressor, []byte) int // copy data to window
	step      func(*compressor)             // process window
	sync      bool                          // requesting flush
	bestSpeed *deflateFast                  // Encoder for BestSpeed

	// Input hash chains
	// hashHead[hashValue] contains the largest inputIndex with the specified hash value
	// If hashHead[hashValue] is within the current window, then
	// hashPrev[hashHead[hashValue] & windowMask] contains the previous index
	// with the same hash value.
	chainHead  int
	hashHead   [hashSize]uint32
	hashPrev   [windowSize]uint32
	hashOffset int

	// input window: unprocessed data is window[index:windowEnd]
	index         int
	window        []byte
	windowEnd     int
	blockStart    int  // window index where current tokens start
	byteAvailable bool // if true, still need to process window[index-1].

	// queued output tokens
	tokens []token

	// deflate state
	length         int
	offset         int
	hash           uint32
	maxInsertIndex int
	err            error

	// hashMatch must be able to contain hashes for the maximum match length.
	hashMatch [maxMatchLength - 1]uint32
}
```

#### <a id="compressor.fillDeflate" href="#compressor.fillDeflate">func (d *compressor) fillDeflate(b []byte) int</a>

```
searchKey: flate.compressor.fillDeflate
```

```Go
func (d *compressor) fillDeflate(b []byte) int
```

#### <a id="compressor.writeBlock" href="#compressor.writeBlock">func (d *compressor) writeBlock(tokens []token, index int) error</a>

```
searchKey: flate.compressor.writeBlock
```

```Go
func (d *compressor) writeBlock(tokens []token, index int) error
```

#### <a id="compressor.fillWindow" href="#compressor.fillWindow">func (d *compressor) fillWindow(b []byte)</a>

```
searchKey: flate.compressor.fillWindow
```

```Go
func (d *compressor) fillWindow(b []byte)
```

fillWindow will fill the current window with the supplied dictionary and calculate all hashes. This is much faster than doing a full encode. Should only be used after a reset. 

#### <a id="compressor.findMatch" href="#compressor.findMatch">func (d *compressor) findMatch(pos int, prevHead int, prevLength int, lookahead int) (length, offset int, ok bool)</a>

```
searchKey: flate.compressor.findMatch
```

```Go
func (d *compressor) findMatch(pos int, prevHead int, prevLength int, lookahead int) (length, offset int, ok bool)
```

Try to find a match starting at index whose length is greater than prevSize. We only look at chainCount possibilities before giving up. 

#### <a id="compressor.writeStoredBlock" href="#compressor.writeStoredBlock">func (d *compressor) writeStoredBlock(buf []byte) error</a>

```
searchKey: flate.compressor.writeStoredBlock
```

```Go
func (d *compressor) writeStoredBlock(buf []byte) error
```

#### <a id="compressor.encSpeed" href="#compressor.encSpeed">func (d *compressor) encSpeed()</a>

```
searchKey: flate.compressor.encSpeed
```

```Go
func (d *compressor) encSpeed()
```

encSpeed will compress and store the currently added data, if enough has been accumulated or we at the end of the stream. Any error that occurred will be in d.err 

#### <a id="compressor.initDeflate" href="#compressor.initDeflate">func (d *compressor) initDeflate()</a>

```
searchKey: flate.compressor.initDeflate
```

```Go
func (d *compressor) initDeflate()
```

#### <a id="compressor.deflate" href="#compressor.deflate">func (d *compressor) deflate()</a>

```
searchKey: flate.compressor.deflate
```

```Go
func (d *compressor) deflate()
```

#### <a id="compressor.fillStore" href="#compressor.fillStore">func (d *compressor) fillStore(b []byte) int</a>

```
searchKey: flate.compressor.fillStore
```

```Go
func (d *compressor) fillStore(b []byte) int
```

#### <a id="compressor.store" href="#compressor.store">func (d *compressor) store()</a>

```
searchKey: flate.compressor.store
```

```Go
func (d *compressor) store()
```

#### <a id="compressor.storeHuff" href="#compressor.storeHuff">func (d *compressor) storeHuff()</a>

```
searchKey: flate.compressor.storeHuff
```

```Go
func (d *compressor) storeHuff()
```

storeHuff compresses and stores the currently added data when the d.window is full or we are at the end of the stream. Any error that occurred will be in d.err 

#### <a id="compressor.write" href="#compressor.write">func (d *compressor) write(b []byte) (n int, err error)</a>

```
searchKey: flate.compressor.write
```

```Go
func (d *compressor) write(b []byte) (n int, err error)
```

#### <a id="compressor.syncFlush" href="#compressor.syncFlush">func (d *compressor) syncFlush() error</a>

```
searchKey: flate.compressor.syncFlush
```

```Go
func (d *compressor) syncFlush() error
```

#### <a id="compressor.init" href="#compressor.init">func (d *compressor) init(w io.Writer, level int) (err error)</a>

```
searchKey: flate.compressor.init
```

```Go
func (d *compressor) init(w io.Writer, level int) (err error)
```

#### <a id="compressor.reset" href="#compressor.reset">func (d *compressor) reset(w io.Writer)</a>

```
searchKey: flate.compressor.reset
```

```Go
func (d *compressor) reset(w io.Writer)
```

#### <a id="compressor.close" href="#compressor.close">func (d *compressor) close() error</a>

```
searchKey: flate.compressor.close
```

```Go
func (d *compressor) close() error
```

### <a id="dictWriter" href="#dictWriter">type dictWriter struct</a>

```
searchKey: flate.dictWriter
```

```Go
type dictWriter struct {
	w io.Writer
}
```

#### <a id="dictWriter.Write" href="#dictWriter.Write">func (w *dictWriter) Write(b []byte) (n int, err error)</a>

```
searchKey: flate.dictWriter.Write
```

```Go
func (w *dictWriter) Write(b []byte) (n int, err error)
```

### <a id="Writer" href="#Writer">type Writer struct</a>

```
searchKey: flate.Writer
tags: [exported]
```

```Go
type Writer struct {
	d    compressor
	dict []byte
}
```

A Writer takes data written to it and writes the compressed form of that data to an underlying writer (see NewWriter). 

#### <a id="NewWriter" href="#NewWriter">func NewWriter(w io.Writer, level int) (*Writer, error)</a>

```
searchKey: flate.NewWriter
tags: [exported]
```

```Go
func NewWriter(w io.Writer, level int) (*Writer, error)
```

NewWriter returns a new Writer compressing data at the given level. Following zlib, levels range from 1 (BestSpeed) to 9 (BestCompression); higher levels typically run slower but compress more. Level 0 (NoCompression) does not attempt any compression; it only adds the necessary DEFLATE framing. Level -1 (DefaultCompression) uses the default compression level. Level -2 (HuffmanOnly) will use Huffman compression only, giving a very fast compression for all types of input, but sacrificing considerable compression efficiency. 

If level is in the range [-2, 9] then the error returned will be nil. Otherwise the error returned will be non-nil. 

#### <a id="NewWriterDict" href="#NewWriterDict">func NewWriterDict(w io.Writer, level int, dict []byte) (*Writer, error)</a>

```
searchKey: flate.NewWriterDict
tags: [exported]
```

```Go
func NewWriterDict(w io.Writer, level int, dict []byte) (*Writer, error)
```

NewWriterDict is like NewWriter but initializes the new Writer with a preset dictionary. The returned Writer behaves as if the dictionary had been written to it without producing any compressed output. The compressed data written to w can only be decompressed by a Reader initialized with the same dictionary. 

#### <a id="Writer.Write" href="#Writer.Write">func (w *Writer) Write(data []byte) (n int, err error)</a>

```
searchKey: flate.Writer.Write
tags: [exported]
```

```Go
func (w *Writer) Write(data []byte) (n int, err error)
```

Write writes data to w, which will eventually write the compressed form of data to its underlying writer. 

#### <a id="Writer.Flush" href="#Writer.Flush">func (w *Writer) Flush() error</a>

```
searchKey: flate.Writer.Flush
tags: [exported]
```

```Go
func (w *Writer) Flush() error
```

Flush flushes any pending data to the underlying writer. It is useful mainly in compressed network protocols, to ensure that a remote reader has enough data to reconstruct a packet. Flush does not return until the data has been written. Calling Flush when there is no pending data still causes the Writer to emit a sync marker of at least 4 bytes. If the underlying writer returns an error, Flush returns that error. 

In the terminology of the zlib library, Flush is equivalent to Z_SYNC_FLUSH. 

#### <a id="Writer.Close" href="#Writer.Close">func (w *Writer) Close() error</a>

```
searchKey: flate.Writer.Close
tags: [exported]
```

```Go
func (w *Writer) Close() error
```

Close flushes and closes the writer. 

#### <a id="Writer.Reset" href="#Writer.Reset">func (w *Writer) Reset(dst io.Writer)</a>

```
searchKey: flate.Writer.Reset
tags: [exported]
```

```Go
func (w *Writer) Reset(dst io.Writer)
```

Reset discards the writer's state and makes it equivalent to the result of NewWriter or NewWriterDict called with dst and w's level and dictionary. 

### <a id="tableEntry" href="#tableEntry">type tableEntry struct</a>

```
searchKey: flate.tableEntry
```

```Go
type tableEntry struct {
	val    uint32 // Value at destination
	offset int32
}
```

### <a id="deflateFast" href="#deflateFast">type deflateFast struct</a>

```
searchKey: flate.deflateFast
```

```Go
type deflateFast struct {
	table [tableSize]tableEntry
	prev  []byte // Previous block, zero length if unknown.
	cur   int32  // Current match offset.
}
```

deflateFast maintains the table for matches, and the previous byte block for cross block matching. 

#### <a id="newDeflateFast" href="#newDeflateFast">func newDeflateFast() *deflateFast</a>

```
searchKey: flate.newDeflateFast
```

```Go
func newDeflateFast() *deflateFast
```

#### <a id="deflateFast.encode" href="#deflateFast.encode">func (e *deflateFast) encode(dst []token, src []byte) []token</a>

```
searchKey: flate.deflateFast.encode
```

```Go
func (e *deflateFast) encode(dst []token, src []byte) []token
```

encode encodes a block given in src and appends tokens to dst and returns the result. 

#### <a id="deflateFast.matchLen" href="#deflateFast.matchLen">func (e *deflateFast) matchLen(s, t int32, src []byte) int32</a>

```
searchKey: flate.deflateFast.matchLen
```

```Go
func (e *deflateFast) matchLen(s, t int32, src []byte) int32
```

matchLen returns the match length between src[s:] and src[t:]. t can be negative to indicate the match is starting in e.prev. We assume that src[s-4:s] and src[t-4:t] already match. 

#### <a id="deflateFast.reset" href="#deflateFast.reset">func (e *deflateFast) reset()</a>

```
searchKey: flate.deflateFast.reset
```

```Go
func (e *deflateFast) reset()
```

Reset resets the encoding history. This ensures that no matches are made to the previous block. 

#### <a id="deflateFast.shiftOffsets" href="#deflateFast.shiftOffsets">func (e *deflateFast) shiftOffsets()</a>

```
searchKey: flate.deflateFast.shiftOffsets
```

```Go
func (e *deflateFast) shiftOffsets()
```

shiftOffsets will shift down all match offset. This is only called in rare situations to prevent integer overflow. 

See [https://golang.org/issue/18636](https://golang.org/issue/18636) and [https://github.com/golang/go/issues/34121](https://github.com/golang/go/issues/34121). 

### <a id="dictDecoder" href="#dictDecoder">type dictDecoder struct</a>

```
searchKey: flate.dictDecoder
```

```Go
type dictDecoder struct {
	hist []byte // Sliding window history

	// Invariant: 0 <= rdPos <= wrPos <= len(hist)
	wrPos int  // Current output position in buffer
	rdPos int  // Have emitted hist[:rdPos] already
	full  bool // Has a full window length been written yet?
}
```

dictDecoder implements the LZ77 sliding dictionary as used in decompression. LZ77 decompresses data through sequences of two forms of commands: 

```
* Literal insertions: Runs of one or more symbols are inserted into the data
stream as is. This is accomplished through the writeByte method for a
single symbol, or combinations of writeSlice/writeMark for multiple symbols.
Any valid stream must start with a literal insertion if no preset dictionary
is used.

* Backward copies: Runs of one or more symbols are copied from previously
emitted data. Backward copies come as the tuple (dist, length) where dist
determines how far back in the stream to copy from and length determines how
many bytes to copy. Note that it is valid for the length to be greater than
the distance. Since LZ77 uses forward copies, that situation is used to
perform a form of run-length encoding on repeated runs of symbols.
The writeCopy and tryWriteCopy are used to implement this command.

```
For performance reasons, this implementation performs little to no sanity checks about the arguments. As such, the invariants documented for each method call must be respected. 

#### <a id="dictDecoder.init" href="#dictDecoder.init">func (dd *dictDecoder) init(size int, dict []byte)</a>

```
searchKey: flate.dictDecoder.init
```

```Go
func (dd *dictDecoder) init(size int, dict []byte)
```

init initializes dictDecoder to have a sliding window dictionary of the given size. If a preset dict is provided, it will initialize the dictionary with the contents of dict. 

#### <a id="dictDecoder.histSize" href="#dictDecoder.histSize">func (dd *dictDecoder) histSize() int</a>

```
searchKey: flate.dictDecoder.histSize
```

```Go
func (dd *dictDecoder) histSize() int
```

histSize reports the total amount of historical data in the dictionary. 

#### <a id="dictDecoder.availRead" href="#dictDecoder.availRead">func (dd *dictDecoder) availRead() int</a>

```
searchKey: flate.dictDecoder.availRead
```

```Go
func (dd *dictDecoder) availRead() int
```

availRead reports the number of bytes that can be flushed by readFlush. 

#### <a id="dictDecoder.availWrite" href="#dictDecoder.availWrite">func (dd *dictDecoder) availWrite() int</a>

```
searchKey: flate.dictDecoder.availWrite
```

```Go
func (dd *dictDecoder) availWrite() int
```

availWrite reports the available amount of output buffer space. 

#### <a id="dictDecoder.writeSlice" href="#dictDecoder.writeSlice">func (dd *dictDecoder) writeSlice() []byte</a>

```
searchKey: flate.dictDecoder.writeSlice
```

```Go
func (dd *dictDecoder) writeSlice() []byte
```

writeSlice returns a slice of the available buffer to write data to. 

This invariant will be kept: len(s) <= availWrite() 

#### <a id="dictDecoder.writeMark" href="#dictDecoder.writeMark">func (dd *dictDecoder) writeMark(cnt int)</a>

```
searchKey: flate.dictDecoder.writeMark
```

```Go
func (dd *dictDecoder) writeMark(cnt int)
```

writeMark advances the writer pointer by cnt. 

This invariant must be kept: 0 <= cnt <= availWrite() 

#### <a id="dictDecoder.writeByte" href="#dictDecoder.writeByte">func (dd *dictDecoder) writeByte(c byte)</a>

```
searchKey: flate.dictDecoder.writeByte
```

```Go
func (dd *dictDecoder) writeByte(c byte)
```

writeByte writes a single byte to the dictionary. 

This invariant must be kept: 0 < availWrite() 

#### <a id="dictDecoder.writeCopy" href="#dictDecoder.writeCopy">func (dd *dictDecoder) writeCopy(dist, length int) int</a>

```
searchKey: flate.dictDecoder.writeCopy
```

```Go
func (dd *dictDecoder) writeCopy(dist, length int) int
```

writeCopy copies a string at a given (dist, length) to the output. This returns the number of bytes copied and may be less than the requested length if the available space in the output buffer is too small. 

This invariant must be kept: 0 < dist <= histSize() 

#### <a id="dictDecoder.tryWriteCopy" href="#dictDecoder.tryWriteCopy">func (dd *dictDecoder) tryWriteCopy(dist, length int) int</a>

```
searchKey: flate.dictDecoder.tryWriteCopy
```

```Go
func (dd *dictDecoder) tryWriteCopy(dist, length int) int
```

tryWriteCopy tries to copy a string at a given (distance, length) to the output. This specialized version is optimized for short distances. 

This method is designed to be inlined for performance reasons. 

This invariant must be kept: 0 < dist <= histSize() 

#### <a id="dictDecoder.readFlush" href="#dictDecoder.readFlush">func (dd *dictDecoder) readFlush() []byte</a>

```
searchKey: flate.dictDecoder.readFlush
```

```Go
func (dd *dictDecoder) readFlush() []byte
```

readFlush returns a slice of the historical buffer that is ready to be emitted to the user. The data returned by readFlush must be fully consumed before calling any other dictDecoder methods. 

### <a id="huffmanBitWriter" href="#huffmanBitWriter">type huffmanBitWriter struct</a>

```
searchKey: flate.huffmanBitWriter
```

```Go
type huffmanBitWriter struct {
	// writer is the underlying writer.
	// Do not use it directly; use the write method, which ensures
	// that Write errors are sticky.
	writer io.Writer

	// Data waiting to be written is bytes[0:nbytes]
	// and then the low nbits of bits.  Data is always written
	// sequentially into the bytes array.
	bits            uint64
	nbits           uint
	bytes           [bufferSize]byte
	codegenFreq     [codegenCodeCount]int32
	nbytes          int
	literalFreq     []int32
	offsetFreq      []int32
	codegen         []uint8
	literalEncoding *huffmanEncoder
	offsetEncoding  *huffmanEncoder
	codegenEncoding *huffmanEncoder
	err             error
}
```

#### <a id="newHuffmanBitWriter" href="#newHuffmanBitWriter">func newHuffmanBitWriter(w io.Writer) *huffmanBitWriter</a>

```
searchKey: flate.newHuffmanBitWriter
```

```Go
func newHuffmanBitWriter(w io.Writer) *huffmanBitWriter
```

#### <a id="huffmanBitWriter.reset" href="#huffmanBitWriter.reset">func (w *huffmanBitWriter) reset(writer io.Writer)</a>

```
searchKey: flate.huffmanBitWriter.reset
```

```Go
func (w *huffmanBitWriter) reset(writer io.Writer)
```

#### <a id="huffmanBitWriter.flush" href="#huffmanBitWriter.flush">func (w *huffmanBitWriter) flush()</a>

```
searchKey: flate.huffmanBitWriter.flush
```

```Go
func (w *huffmanBitWriter) flush()
```

#### <a id="huffmanBitWriter.write" href="#huffmanBitWriter.write">func (w *huffmanBitWriter) write(b []byte)</a>

```
searchKey: flate.huffmanBitWriter.write
```

```Go
func (w *huffmanBitWriter) write(b []byte)
```

#### <a id="huffmanBitWriter.writeBits" href="#huffmanBitWriter.writeBits">func (w *huffmanBitWriter) writeBits(b int32, nb uint)</a>

```
searchKey: flate.huffmanBitWriter.writeBits
```

```Go
func (w *huffmanBitWriter) writeBits(b int32, nb uint)
```

#### <a id="huffmanBitWriter.writeBytes" href="#huffmanBitWriter.writeBytes">func (w *huffmanBitWriter) writeBytes(bytes []byte)</a>

```
searchKey: flate.huffmanBitWriter.writeBytes
```

```Go
func (w *huffmanBitWriter) writeBytes(bytes []byte)
```

#### <a id="huffmanBitWriter.generateCodegen" href="#huffmanBitWriter.generateCodegen">func (w *huffmanBitWriter) generateCodegen(numLiterals int, numOffsets int, litEnc, offEnc *huffmanEncoder)</a>

```
searchKey: flate.huffmanBitWriter.generateCodegen
```

```Go
func (w *huffmanBitWriter) generateCodegen(numLiterals int, numOffsets int, litEnc, offEnc *huffmanEncoder)
```

RFC 1951 3.2.7 specifies a special run-length encoding for specifying the literal and offset lengths arrays (which are concatenated into a single array).  This method generates that run-length encoding. 

The result is written into the codegen array, and the frequencies of each code is written into the codegenFreq array. Codes 0-15 are single byte codes. Codes 16-18 are followed by additional information. Code badCode is an end marker 

```
numLiterals      The number of literals in literalEncoding
numOffsets       The number of offsets in offsetEncoding
litenc, offenc   The literal and offset encoder to use

```
#### <a id="huffmanBitWriter.dynamicSize" href="#huffmanBitWriter.dynamicSize">func (w *huffmanBitWriter) dynamicSize(litEnc, offEnc *huffmanEncoder, extraBits int) (size, numCodegens int)</a>

```
searchKey: flate.huffmanBitWriter.dynamicSize
```

```Go
func (w *huffmanBitWriter) dynamicSize(litEnc, offEnc *huffmanEncoder, extraBits int) (size, numCodegens int)
```

dynamicSize returns the size of dynamically encoded data in bits. 

#### <a id="huffmanBitWriter.fixedSize" href="#huffmanBitWriter.fixedSize">func (w *huffmanBitWriter) fixedSize(extraBits int) int</a>

```
searchKey: flate.huffmanBitWriter.fixedSize
```

```Go
func (w *huffmanBitWriter) fixedSize(extraBits int) int
```

fixedSize returns the size of dynamically encoded data in bits. 

#### <a id="huffmanBitWriter.storedSize" href="#huffmanBitWriter.storedSize">func (w *huffmanBitWriter) storedSize(in []byte) (int, bool)</a>

```
searchKey: flate.huffmanBitWriter.storedSize
```

```Go
func (w *huffmanBitWriter) storedSize(in []byte) (int, bool)
```

storedSize calculates the stored size, including header. The function returns the size in bits and whether the block fits inside a single block. 

#### <a id="huffmanBitWriter.writeCode" href="#huffmanBitWriter.writeCode">func (w *huffmanBitWriter) writeCode(c hcode)</a>

```
searchKey: flate.huffmanBitWriter.writeCode
```

```Go
func (w *huffmanBitWriter) writeCode(c hcode)
```

#### <a id="huffmanBitWriter.writeDynamicHeader" href="#huffmanBitWriter.writeDynamicHeader">func (w *huffmanBitWriter) writeDynamicHeader(numLiterals int, numOffsets int, numCodegens int, isEof bool)</a>

```
searchKey: flate.huffmanBitWriter.writeDynamicHeader
```

```Go
func (w *huffmanBitWriter) writeDynamicHeader(numLiterals int, numOffsets int, numCodegens int, isEof bool)
```

Write the header of a dynamic Huffman block to the output stream. 

```
numLiterals  The number of literals specified in codegen
numOffsets   The number of offsets specified in codegen
numCodegens  The number of codegens used in codegen

```
#### <a id="huffmanBitWriter.writeStoredHeader" href="#huffmanBitWriter.writeStoredHeader">func (w *huffmanBitWriter) writeStoredHeader(length int, isEof bool)</a>

```
searchKey: flate.huffmanBitWriter.writeStoredHeader
```

```Go
func (w *huffmanBitWriter) writeStoredHeader(length int, isEof bool)
```

#### <a id="huffmanBitWriter.writeFixedHeader" href="#huffmanBitWriter.writeFixedHeader">func (w *huffmanBitWriter) writeFixedHeader(isEof bool)</a>

```
searchKey: flate.huffmanBitWriter.writeFixedHeader
```

```Go
func (w *huffmanBitWriter) writeFixedHeader(isEof bool)
```

#### <a id="huffmanBitWriter.writeBlock" href="#huffmanBitWriter.writeBlock">func (w *huffmanBitWriter) writeBlock(tokens []token, eof bool, input []byte)</a>

```
searchKey: flate.huffmanBitWriter.writeBlock
```

```Go
func (w *huffmanBitWriter) writeBlock(tokens []token, eof bool, input []byte)
```

writeBlock will write a block of tokens with the smallest encoding. The original input can be supplied, and if the huffman encoded data is larger than the original bytes, the data will be written as a stored block. If the input is nil, the tokens will always be Huffman encoded. 

#### <a id="huffmanBitWriter.writeBlockDynamic" href="#huffmanBitWriter.writeBlockDynamic">func (w *huffmanBitWriter) writeBlockDynamic(tokens []token, eof bool, input []byte)</a>

```
searchKey: flate.huffmanBitWriter.writeBlockDynamic
```

```Go
func (w *huffmanBitWriter) writeBlockDynamic(tokens []token, eof bool, input []byte)
```

writeBlockDynamic encodes a block using a dynamic Huffman table. This should be used if the symbols used have a disproportionate histogram distribution. If input is supplied and the compression savings are below 1/16th of the input size the block is stored. 

#### <a id="huffmanBitWriter.indexTokens" href="#huffmanBitWriter.indexTokens">func (w *huffmanBitWriter) indexTokens(tokens []token) (numLiterals, numOffsets int)</a>

```
searchKey: flate.huffmanBitWriter.indexTokens
```

```Go
func (w *huffmanBitWriter) indexTokens(tokens []token) (numLiterals, numOffsets int)
```

indexTokens indexes a slice of tokens, and updates literalFreq and offsetFreq, and generates literalEncoding and offsetEncoding. The number of literal and offset tokens is returned. 

#### <a id="huffmanBitWriter.writeTokens" href="#huffmanBitWriter.writeTokens">func (w *huffmanBitWriter) writeTokens(tokens []token, leCodes, oeCodes []hcode)</a>

```
searchKey: flate.huffmanBitWriter.writeTokens
```

```Go
func (w *huffmanBitWriter) writeTokens(tokens []token, leCodes, oeCodes []hcode)
```

writeTokens writes a slice of tokens to the output. codes for literal and offset encoding must be supplied. 

#### <a id="huffmanBitWriter.writeBlockHuff" href="#huffmanBitWriter.writeBlockHuff">func (w *huffmanBitWriter) writeBlockHuff(eof bool, input []byte)</a>

```
searchKey: flate.huffmanBitWriter.writeBlockHuff
```

```Go
func (w *huffmanBitWriter) writeBlockHuff(eof bool, input []byte)
```

writeBlockHuff encodes a block of bytes as either Huffman encoded literals or uncompressed bytes if the results only gains very little from compression. 

### <a id="hcode" href="#hcode">type hcode struct</a>

```
searchKey: flate.hcode
```

```Go
type hcode struct {
	code, len uint16
}
```

hcode is a huffman code with a bit code and bit length. 

#### <a id="hcode.set" href="#hcode.set">func (h *hcode) set(code uint16, length uint16)</a>

```
searchKey: flate.hcode.set
```

```Go
func (h *hcode) set(code uint16, length uint16)
```

set sets the code and length of an hcode. 

### <a id="huffmanEncoder" href="#huffmanEncoder">type huffmanEncoder struct</a>

```
searchKey: flate.huffmanEncoder
```

```Go
type huffmanEncoder struct {
	codes     []hcode
	freqcache []literalNode
	bitCount  [17]int32
	lns       byLiteral // stored to avoid repeated allocation in generate
	lfs       byFreq    // stored to avoid repeated allocation in generate
}
```

#### <a id="newHuffmanEncoder" href="#newHuffmanEncoder">func newHuffmanEncoder(size int) *huffmanEncoder</a>

```
searchKey: flate.newHuffmanEncoder
```

```Go
func newHuffmanEncoder(size int) *huffmanEncoder
```

#### <a id="generateFixedLiteralEncoding" href="#generateFixedLiteralEncoding">func generateFixedLiteralEncoding() *huffmanEncoder</a>

```
searchKey: flate.generateFixedLiteralEncoding
```

```Go
func generateFixedLiteralEncoding() *huffmanEncoder
```

Generates a HuffmanCode corresponding to the fixed literal table 

#### <a id="generateFixedOffsetEncoding" href="#generateFixedOffsetEncoding">func generateFixedOffsetEncoding() *huffmanEncoder</a>

```
searchKey: flate.generateFixedOffsetEncoding
```

```Go
func generateFixedOffsetEncoding() *huffmanEncoder
```

#### <a id="huffmanEncoder.bitLength" href="#huffmanEncoder.bitLength">func (h *huffmanEncoder) bitLength(freq []int32) int</a>

```
searchKey: flate.huffmanEncoder.bitLength
```

```Go
func (h *huffmanEncoder) bitLength(freq []int32) int
```

#### <a id="huffmanEncoder.bitCounts" href="#huffmanEncoder.bitCounts">func (h *huffmanEncoder) bitCounts(list []literalNode, maxBits int32) []int32</a>

```
searchKey: flate.huffmanEncoder.bitCounts
```

```Go
func (h *huffmanEncoder) bitCounts(list []literalNode, maxBits int32) []int32
```

Return the number of literals assigned to each bit size in the Huffman encoding 

This method is only called when list.length >= 3 The cases of 0, 1, and 2 literals are handled by special case code. 

list  An array of the literals with non-zero frequencies 

```
and their associated frequencies. The array is in order of increasing
frequency, and has as its last element a special element with frequency
MaxInt32

```
maxBits     The maximum number of bits that should be used to encode any literal. 

```
Must be less than 16.

```
return      An integer array in which array[i] indicates the number of literals 

```
that should be encoded in i bits.

```
#### <a id="huffmanEncoder.assignEncodingAndSize" href="#huffmanEncoder.assignEncodingAndSize">func (h *huffmanEncoder) assignEncodingAndSize(bitCount []int32, list []literalNode)</a>

```
searchKey: flate.huffmanEncoder.assignEncodingAndSize
```

```Go
func (h *huffmanEncoder) assignEncodingAndSize(bitCount []int32, list []literalNode)
```

Look at the leaves and assign them a bit count and an encoding as specified in RFC 1951 3.2.2 

#### <a id="huffmanEncoder.generate" href="#huffmanEncoder.generate">func (h *huffmanEncoder) generate(freq []int32, maxBits int32)</a>

```
searchKey: flate.huffmanEncoder.generate
```

```Go
func (h *huffmanEncoder) generate(freq []int32, maxBits int32)
```

Update this Huffman Code object to be the minimum code for the specified frequency count. 

freq  An array of frequencies, in which frequency[i] gives the frequency of literal i. maxBits  The maximum number of bits to use for any literal. 

### <a id="literalNode" href="#literalNode">type literalNode struct</a>

```
searchKey: flate.literalNode
```

```Go
type literalNode struct {
	literal uint16
	freq    int32
}
```

#### <a id="maxNode" href="#maxNode">func maxNode() literalNode</a>

```
searchKey: flate.maxNode
```

```Go
func maxNode() literalNode
```

### <a id="levelInfo" href="#levelInfo">type levelInfo struct</a>

```
searchKey: flate.levelInfo
```

```Go
type levelInfo struct {
	// Our level.  for better printing
	level int32

	// The frequency of the last node at this level
	lastFreq int32

	// The frequency of the next character to add to this level
	nextCharFreq int32

	// The frequency of the next pair (from level below) to add to this level.
	// Only valid if the "needed" value of the next lower level is 0.
	nextPairFreq int32

	// The number of chains remaining to generate for this level before moving
	// up to the next level
	needed int32
}
```

A levelInfo describes the state of the constructed tree for a given depth. 

### <a id="byLiteral" href="#byLiteral">type byLiteral []flate.literalNode</a>

```
searchKey: flate.byLiteral
```

```Go
type byLiteral []literalNode
```

#### <a id="byLiteral.sort" href="#byLiteral.sort">func (s *byLiteral) sort(a []literalNode)</a>

```
searchKey: flate.byLiteral.sort
```

```Go
func (s *byLiteral) sort(a []literalNode)
```

#### <a id="byLiteral.Len" href="#byLiteral.Len">func (s byLiteral) Len() int</a>

```
searchKey: flate.byLiteral.Len
```

```Go
func (s byLiteral) Len() int
```

#### <a id="byLiteral.Less" href="#byLiteral.Less">func (s byLiteral) Less(i, j int) bool</a>

```
searchKey: flate.byLiteral.Less
```

```Go
func (s byLiteral) Less(i, j int) bool
```

#### <a id="byLiteral.Swap" href="#byLiteral.Swap">func (s byLiteral) Swap(i, j int)</a>

```
searchKey: flate.byLiteral.Swap
```

```Go
func (s byLiteral) Swap(i, j int)
```

### <a id="byFreq" href="#byFreq">type byFreq []flate.literalNode</a>

```
searchKey: flate.byFreq
```

```Go
type byFreq []literalNode
```

#### <a id="byFreq.sort" href="#byFreq.sort">func (s *byFreq) sort(a []literalNode)</a>

```
searchKey: flate.byFreq.sort
```

```Go
func (s *byFreq) sort(a []literalNode)
```

#### <a id="byFreq.Len" href="#byFreq.Len">func (s byFreq) Len() int</a>

```
searchKey: flate.byFreq.Len
```

```Go
func (s byFreq) Len() int
```

#### <a id="byFreq.Less" href="#byFreq.Less">func (s byFreq) Less(i, j int) bool</a>

```
searchKey: flate.byFreq.Less
```

```Go
func (s byFreq) Less(i, j int) bool
```

#### <a id="byFreq.Swap" href="#byFreq.Swap">func (s byFreq) Swap(i, j int)</a>

```
searchKey: flate.byFreq.Swap
```

```Go
func (s byFreq) Swap(i, j int)
```

### <a id="CorruptInputError" href="#CorruptInputError">type CorruptInputError int64</a>

```
searchKey: flate.CorruptInputError
tags: [exported]
```

```Go
type CorruptInputError int64
```

A CorruptInputError reports the presence of corrupt input at a given offset. 

#### <a id="CorruptInputError.Error" href="#CorruptInputError.Error">func (e CorruptInputError) Error() string</a>

```
searchKey: flate.CorruptInputError.Error
tags: [exported]
```

```Go
func (e CorruptInputError) Error() string
```

### <a id="InternalError" href="#InternalError">type InternalError string</a>

```
searchKey: flate.InternalError
tags: [exported]
```

```Go
type InternalError string
```

An InternalError reports an error in the flate code itself. 

#### <a id="InternalError.Error" href="#InternalError.Error">func (e InternalError) Error() string</a>

```
searchKey: flate.InternalError.Error
tags: [exported]
```

```Go
func (e InternalError) Error() string
```

### <a id="ReadError" href="#ReadError">type ReadError struct</a>

```
searchKey: flate.ReadError
tags: [exported]
```

```Go
type ReadError struct {
	Offset int64 // byte offset where error occurred
	Err    error // error returned by underlying Read
}
```

A ReadError reports an error encountered while reading input. 

Deprecated: No longer returned. 

#### <a id="ReadError.Error" href="#ReadError.Error">func (e *ReadError) Error() string</a>

```
searchKey: flate.ReadError.Error
tags: [exported]
```

```Go
func (e *ReadError) Error() string
```

### <a id="WriteError" href="#WriteError">type WriteError struct</a>

```
searchKey: flate.WriteError
tags: [exported]
```

```Go
type WriteError struct {
	Offset int64 // byte offset where error occurred
	Err    error // error returned by underlying Write
}
```

A WriteError reports an error encountered while writing output. 

Deprecated: No longer returned. 

#### <a id="WriteError.Error" href="#WriteError.Error">func (e *WriteError) Error() string</a>

```
searchKey: flate.WriteError.Error
tags: [exported]
```

```Go
func (e *WriteError) Error() string
```

### <a id="Resetter" href="#Resetter">type Resetter interface</a>

```
searchKey: flate.Resetter
tags: [exported]
```

```Go
type Resetter interface {
	// Reset discards any buffered data and resets the Resetter as if it was
	// newly initialized with the given reader.
	Reset(r io.Reader, dict []byte) error
}
```

Resetter resets a ReadCloser returned by NewReader or NewReaderDict to switch to a new underlying Reader. This permits reusing a ReadCloser instead of allocating a new one. 

### <a id="huffmanDecoder" href="#huffmanDecoder">type huffmanDecoder struct</a>

```
searchKey: flate.huffmanDecoder
```

```Go
type huffmanDecoder struct {
	min      int                      // the minimum code length
	chunks   [huffmanNumChunks]uint32 // chunks as described above
	links    [][]uint32               // overflow links
	linkMask uint32                   // mask the width of the link table
}
```

#### <a id="huffmanDecoder.init" href="#huffmanDecoder.init">func (h *huffmanDecoder) init(lengths []int) bool</a>

```
searchKey: flate.huffmanDecoder.init
```

```Go
func (h *huffmanDecoder) init(lengths []int) bool
```

Initialize Huffman decoding tables from array of code lengths. Following this function, h is guaranteed to be initialized into a complete tree (i.e., neither over-subscribed nor under-subscribed). The exception is a degenerate case where the tree has only a single symbol with length 1. Empty trees are permitted. 

### <a id="Reader" href="#Reader">type Reader interface</a>

```
searchKey: flate.Reader
tags: [exported]
```

```Go
type Reader interface {
	io.Reader
	io.ByteReader
}
```

The actual read interface needed by NewReader. If the passed in io.Reader does not also have ReadByte, the NewReader will introduce its own buffering. 

#### <a id="makeReader" href="#makeReader">func makeReader(r io.Reader) Reader</a>

```
searchKey: flate.makeReader
```

```Go
func makeReader(r io.Reader) Reader
```

### <a id="decompressor" href="#decompressor">type decompressor struct</a>

```
searchKey: flate.decompressor
```

```Go
type decompressor struct {
	// Input source.
	r       Reader
	roffset int64

	// Input bits, in top of b.
	b  uint32
	nb uint

	// Huffman decoders for literal/length, distance.
	h1, h2 huffmanDecoder

	// Length arrays used to define Huffman codes.
	bits     *[maxNumLit + maxNumDist]int
	codebits *[numCodes]int

	// Output history, buffer.
	dict dictDecoder

	// Temporary buffer (avoids repeated allocation).
	buf [4]byte

	// Next step in the decompression,
	// and decompression state.
	step      func(*decompressor)
	stepState int
	final     bool
	err       error
	toRead    []byte
	hl, hd    *huffmanDecoder
	copyLen   int
	copyDist  int
}
```

Decompress state. 

#### <a id="decompressor.nextBlock" href="#decompressor.nextBlock">func (f *decompressor) nextBlock()</a>

```
searchKey: flate.decompressor.nextBlock
```

```Go
func (f *decompressor) nextBlock()
```

#### <a id="decompressor.Read" href="#decompressor.Read">func (f *decompressor) Read(b []byte) (int, error)</a>

```
searchKey: flate.decompressor.Read
```

```Go
func (f *decompressor) Read(b []byte) (int, error)
```

#### <a id="decompressor.Close" href="#decompressor.Close">func (f *decompressor) Close() error</a>

```
searchKey: flate.decompressor.Close
```

```Go
func (f *decompressor) Close() error
```

#### <a id="decompressor.readHuffman" href="#decompressor.readHuffman">func (f *decompressor) readHuffman() error</a>

```
searchKey: flate.decompressor.readHuffman
```

```Go
func (f *decompressor) readHuffman() error
```

#### <a id="decompressor.huffmanBlock" href="#decompressor.huffmanBlock">func (f *decompressor) huffmanBlock()</a>

```
searchKey: flate.decompressor.huffmanBlock
```

```Go
func (f *decompressor) huffmanBlock()
```

Decode a single Huffman block from f. hl and hd are the Huffman states for the lit/length values and the distance values, respectively. If hd == nil, using the fixed distance encoding associated with fixed Huffman blocks. 

#### <a id="decompressor.dataBlock" href="#decompressor.dataBlock">func (f *decompressor) dataBlock()</a>

```
searchKey: flate.decompressor.dataBlock
```

```Go
func (f *decompressor) dataBlock()
```

Copy a single uncompressed data block from input to output. 

#### <a id="decompressor.copyData" href="#decompressor.copyData">func (f *decompressor) copyData()</a>

```
searchKey: flate.decompressor.copyData
```

```Go
func (f *decompressor) copyData()
```

copyData copies f.copyLen bytes from the underlying reader into f.hist. It pauses for reads when f.hist is full. 

#### <a id="decompressor.finishBlock" href="#decompressor.finishBlock">func (f *decompressor) finishBlock()</a>

```
searchKey: flate.decompressor.finishBlock
```

```Go
func (f *decompressor) finishBlock()
```

#### <a id="decompressor.moreBits" href="#decompressor.moreBits">func (f *decompressor) moreBits() error</a>

```
searchKey: flate.decompressor.moreBits
```

```Go
func (f *decompressor) moreBits() error
```

#### <a id="decompressor.huffSym" href="#decompressor.huffSym">func (f *decompressor) huffSym(h *huffmanDecoder) (int, error)</a>

```
searchKey: flate.decompressor.huffSym
```

```Go
func (f *decompressor) huffSym(h *huffmanDecoder) (int, error)
```

Read the next Huffman-encoded symbol from f according to h. 

#### <a id="decompressor.Reset" href="#decompressor.Reset">func (f *decompressor) Reset(r io.Reader, dict []byte) error</a>

```
searchKey: flate.decompressor.Reset
```

```Go
func (f *decompressor) Reset(r io.Reader, dict []byte) error
```

### <a id="token" href="#token">type token uint32</a>

```
searchKey: flate.token
```

```Go
type token uint32
```

#### <a id="literalToken" href="#literalToken">func literalToken(literal uint32) token</a>

```
searchKey: flate.literalToken
```

```Go
func literalToken(literal uint32) token
```

Convert a literal into a literal token. 

#### <a id="matchToken" href="#matchToken">func matchToken(xlength uint32, xoffset uint32) token</a>

```
searchKey: flate.matchToken
```

```Go
func matchToken(xlength uint32, xoffset uint32) token
```

Convert a < xlength, xoffset > pair into a match token. 

#### <a id="token.literal" href="#token.literal">func (t token) literal() uint32</a>

```
searchKey: flate.token.literal
```

```Go
func (t token) literal() uint32
```

Returns the literal of a literal token 

#### <a id="token.offset" href="#token.offset">func (t token) offset() uint32</a>

```
searchKey: flate.token.offset
```

```Go
func (t token) offset() uint32
```

Returns the extra offset of a match token 

#### <a id="token.length" href="#token.length">func (t token) length() uint32</a>

```
searchKey: flate.token.length
```

```Go
func (t token) length() uint32
```

### <a id="deflateTest" href="#deflateTest">type deflateTest struct</a>

```
searchKey: flate.deflateTest
```

```Go
type deflateTest struct {
	in    []byte
	level int
	out   []byte
}
```

### <a id="deflateInflateTest" href="#deflateInflateTest">type deflateInflateTest struct</a>

```
searchKey: flate.deflateInflateTest
```

```Go
type deflateInflateTest struct {
	in []byte
}
```

### <a id="reverseBitsTest" href="#reverseBitsTest">type reverseBitsTest struct</a>

```
searchKey: flate.reverseBitsTest
```

```Go
type reverseBitsTest struct {
	in       uint16
	bitCount uint8
	out      uint16
}
```

### <a id="sparseReader" href="#sparseReader">type sparseReader struct</a>

```
searchKey: flate.sparseReader
```

```Go
type sparseReader struct {
	l   int64
	cur int64
}
```

A sparseReader returns a stream consisting of 0s followed by 1<<16 1s. This tests missing hash references in a very large input. 

#### <a id="sparseReader.Read" href="#sparseReader.Read">func (r *sparseReader) Read(b []byte) (n int, err error)</a>

```
searchKey: flate.sparseReader.Read
```

```Go
func (r *sparseReader) Read(b []byte) (n int, err error)
```

### <a id="syncBuffer" href="#syncBuffer">type syncBuffer struct</a>

```
searchKey: flate.syncBuffer
```

```Go
type syncBuffer struct {
	buf    bytes.Buffer
	mu     sync.RWMutex
	closed bool
	ready  chan bool
}
```

#### <a id="newSyncBuffer" href="#newSyncBuffer">func newSyncBuffer() *syncBuffer</a>

```
searchKey: flate.newSyncBuffer
```

```Go
func newSyncBuffer() *syncBuffer
```

#### <a id="syncBuffer.Read" href="#syncBuffer.Read">func (b *syncBuffer) Read(p []byte) (n int, err error)</a>

```
searchKey: flate.syncBuffer.Read
```

```Go
func (b *syncBuffer) Read(p []byte) (n int, err error)
```

#### <a id="syncBuffer.signal" href="#syncBuffer.signal">func (b *syncBuffer) signal()</a>

```
searchKey: flate.syncBuffer.signal
```

```Go
func (b *syncBuffer) signal()
```

#### <a id="syncBuffer.Write" href="#syncBuffer.Write">func (b *syncBuffer) Write(p []byte) (n int, err error)</a>

```
searchKey: flate.syncBuffer.Write
```

```Go
func (b *syncBuffer) Write(p []byte) (n int, err error)
```

#### <a id="syncBuffer.WriteMode" href="#syncBuffer.WriteMode">func (b *syncBuffer) WriteMode()</a>

```
searchKey: flate.syncBuffer.WriteMode
```

```Go
func (b *syncBuffer) WriteMode()
```

#### <a id="syncBuffer.ReadMode" href="#syncBuffer.ReadMode">func (b *syncBuffer) ReadMode()</a>

```
searchKey: flate.syncBuffer.ReadMode
```

```Go
func (b *syncBuffer) ReadMode()
```

#### <a id="syncBuffer.Close" href="#syncBuffer.Close">func (b *syncBuffer) Close() error</a>

```
searchKey: flate.syncBuffer.Close
```

```Go
func (b *syncBuffer) Close() error
```

### <a id="deflateInflateStringTest" href="#deflateInflateStringTest">type deflateInflateStringTest struct</a>

```
searchKey: flate.deflateInflateStringTest
```

```Go
type deflateInflateStringTest struct {
	filename string
	label    string
	limit    [11]int
}
```

### <a id="failWriter" href="#failWriter">type failWriter struct</a>

```
searchKey: flate.failWriter
```

```Go
type failWriter struct{ n int }
```

failWriter fails with errIO exactly at the nth call to Write. 

#### <a id="failWriter.Write" href="#failWriter.Write">func (w *failWriter) Write(b []byte) (int, error)</a>

```
searchKey: flate.failWriter.Write
```

```Go
func (w *failWriter) Write(b []byte) (int, error)
```

### <a id="huffTest" href="#huffTest">type huffTest struct</a>

```
searchKey: flate.huffTest
```

```Go
type huffTest struct {
	tokens      []token
	input       string // File name of input data matching the tokens.
	want        string // File name of data with the expected output with input available.
	wantNoInput string // File name of the expected output when no input is available.
}
```

### <a id="errorWriter" href="#errorWriter">type errorWriter struct</a>

```
searchKey: flate.errorWriter
```

```Go
type errorWriter struct {
	N int
}
```

errorWriter is a writer that fails after N writes. 

#### <a id="errorWriter.Write" href="#errorWriter.Write">func (e *errorWriter) Write(b []byte) (int, error)</a>

```
searchKey: flate.errorWriter.Write
```

```Go
func (e *errorWriter) Write(b []byte) (int, error)
```

## <a id="func" href="#func">Functions</a>

```
tags: [exported]
```

### <a id="hash4" href="#hash4">func hash4(b []byte) uint32</a>

```
searchKey: flate.hash4
```

```Go
func hash4(b []byte) uint32
```

hash4 returns a hash representation of the first 4 bytes of the supplied slice. The caller must ensure that len(b) >= 4. 

### <a id="bulkHash4" href="#bulkHash4">func bulkHash4(b []byte, dst []uint32)</a>

```
searchKey: flate.bulkHash4
```

```Go
func bulkHash4(b []byte, dst []uint32)
```

bulkHash4 will compute hashes using the same algorithm as hash4 

### <a id="matchLen" href="#matchLen">func matchLen(a, b []byte, max int) int</a>

```
searchKey: flate.matchLen
```

```Go
func matchLen(a, b []byte, max int) int
```

matchLen returns the number of matching bytes in a and b up to length 'max'. Both slices must be at least 'max' bytes in size. 

### <a id="load32" href="#load32">func load32(b []byte, i int32) uint32</a>

```
searchKey: flate.load32
```

```Go
func load32(b []byte, i int32) uint32
```

### <a id="load64" href="#load64">func load64(b []byte, i int32) uint64</a>

```
searchKey: flate.load64
```

```Go
func load64(b []byte, i int32) uint64
```

### <a id="hash" href="#hash">func hash(u uint32) uint32</a>

```
searchKey: flate.hash
```

```Go
func hash(u uint32) uint32
```

### <a id="emitLiteral" href="#emitLiteral">func emitLiteral(dst []token, lit []byte) []token</a>

```
searchKey: flate.emitLiteral
```

```Go
func emitLiteral(dst []token, lit []byte) []token
```

### <a id="init" href="#init">func init()</a>

```
searchKey: flate.init
```

```Go
func init()
```

### <a id="histogram" href="#histogram">func histogram(b []byte, h []int32)</a>

```
searchKey: flate.histogram
```

```Go
func histogram(b []byte, h []int32)
```

histogram accumulates a histogram of b in h. 

len(h) must be >= 256, and h's elements must be all zeroes. 

### <a id="reverseBits" href="#reverseBits">func reverseBits(number uint16, bitLength byte) uint16</a>

```
searchKey: flate.reverseBits
```

```Go
func reverseBits(number uint16, bitLength byte) uint16
```

### <a id="noEOF" href="#noEOF">func noEOF(e error) error</a>

```
searchKey: flate.noEOF
```

```Go
func noEOF(e error) error
```

noEOF returns err, unless err == io.EOF, in which case it returns io.ErrUnexpectedEOF. 

### <a id="fixedHuffmanDecoderInit" href="#fixedHuffmanDecoderInit">func fixedHuffmanDecoderInit()</a>

```
searchKey: flate.fixedHuffmanDecoderInit
```

```Go
func fixedHuffmanDecoderInit()
```

### <a id="NewReader" href="#NewReader">func NewReader(r io.Reader) io.ReadCloser</a>

```
searchKey: flate.NewReader
tags: [exported]
```

```Go
func NewReader(r io.Reader) io.ReadCloser
```

NewReader returns a new ReadCloser that can be used to read the uncompressed version of r. If r does not also implement io.ByteReader, the decompressor may read more data than necessary from r. It is the caller's responsibility to call Close on the ReadCloser when finished reading. 

The ReadCloser returned by NewReader also implements Resetter. 

### <a id="NewReaderDict" href="#NewReaderDict">func NewReaderDict(r io.Reader, dict []byte) io.ReadCloser</a>

```
searchKey: flate.NewReaderDict
tags: [exported]
```

```Go
func NewReaderDict(r io.Reader, dict []byte) io.ReadCloser
```

NewReaderDict is like NewReader but initializes the reader with a preset dictionary. The returned Reader behaves as if the uncompressed data stream started with the given dictionary, which has already been read. NewReaderDict is typically used to read data compressed by NewWriterDict. 

The ReadCloser returned by NewReader also implements Resetter. 

### <a id="lengthCode" href="#lengthCode">func lengthCode(len uint32) uint32</a>

```
searchKey: flate.lengthCode
```

```Go
func lengthCode(len uint32) uint32
```

### <a id="offsetCode" href="#offsetCode">func offsetCode(off uint32) uint32</a>

```
searchKey: flate.offsetCode
```

```Go
func offsetCode(off uint32) uint32
```

Returns the offset code corresponding to a specific offset 

### <a id="largeDataChunk" href="#largeDataChunk">func largeDataChunk() []byte</a>

```
searchKey: flate.largeDataChunk
```

```Go
func largeDataChunk() []byte
```

### <a id="TestBulkHash4" href="#TestBulkHash4">func TestBulkHash4(t *testing.T)</a>

```
searchKey: flate.TestBulkHash4
```

```Go
func TestBulkHash4(t *testing.T)
```

### <a id="TestDeflate" href="#TestDeflate">func TestDeflate(t *testing.T)</a>

```
searchKey: flate.TestDeflate
```

```Go
func TestDeflate(t *testing.T)
```

### <a id="TestVeryLongSparseChunk" href="#TestVeryLongSparseChunk">func TestVeryLongSparseChunk(t *testing.T)</a>

```
searchKey: flate.TestVeryLongSparseChunk
```

```Go
func TestVeryLongSparseChunk(t *testing.T)
```

### <a id="testSync" href="#testSync">func testSync(t *testing.T, level int, input []byte, name string)</a>

```
searchKey: flate.testSync
```

```Go
func testSync(t *testing.T, level int, input []byte, name string)
```

### <a id="testToFromWithLevelAndLimit" href="#testToFromWithLevelAndLimit">func testToFromWithLevelAndLimit(t *testing.T, level int, input []byte, name string, limit int)</a>

```
searchKey: flate.testToFromWithLevelAndLimit
```

```Go
func testToFromWithLevelAndLimit(t *testing.T, level int, input []byte, name string, limit int)
```

### <a id="testToFromWithLimit" href="#testToFromWithLimit">func testToFromWithLimit(t *testing.T, input []byte, name string, limit [11]int)</a>

```
searchKey: flate.testToFromWithLimit
```

```Go
func testToFromWithLimit(t *testing.T, input []byte, name string, limit [11]int)
```

### <a id="TestDeflateInflate" href="#TestDeflateInflate">func TestDeflateInflate(t *testing.T)</a>

```
searchKey: flate.TestDeflateInflate
```

```Go
func TestDeflateInflate(t *testing.T)
```

### <a id="TestReverseBits" href="#TestReverseBits">func TestReverseBits(t *testing.T)</a>

```
searchKey: flate.TestReverseBits
```

```Go
func TestReverseBits(t *testing.T)
```

### <a id="TestDeflateInflateString" href="#TestDeflateInflateString">func TestDeflateInflateString(t *testing.T)</a>

```
searchKey: flate.TestDeflateInflateString
```

```Go
func TestDeflateInflateString(t *testing.T)
```

### <a id="TestReaderDict" href="#TestReaderDict">func TestReaderDict(t *testing.T)</a>

```
searchKey: flate.TestReaderDict
```

```Go
func TestReaderDict(t *testing.T)
```

### <a id="TestWriterDict" href="#TestWriterDict">func TestWriterDict(t *testing.T)</a>

```
searchKey: flate.TestWriterDict
```

```Go
func TestWriterDict(t *testing.T)
```

### <a id="TestRegression2508" href="#TestRegression2508">func TestRegression2508(t *testing.T)</a>

```
searchKey: flate.TestRegression2508
```

```Go
func TestRegression2508(t *testing.T)
```

See [https://golang.org/issue/2508](https://golang.org/issue/2508) 

### <a id="TestWriterReset" href="#TestWriterReset">func TestWriterReset(t *testing.T)</a>

```
searchKey: flate.TestWriterReset
```

```Go
func TestWriterReset(t *testing.T)
```

### <a id="testResetOutput" href="#testResetOutput">func testResetOutput(t *testing.T, level int, dict []byte)</a>

```
searchKey: flate.testResetOutput
```

```Go
func testResetOutput(t *testing.T, level int, dict []byte)
```

### <a id="TestBestSpeed" href="#TestBestSpeed">func TestBestSpeed(t *testing.T)</a>

```
searchKey: flate.TestBestSpeed
```

```Go
func TestBestSpeed(t *testing.T)
```

TestBestSpeed tests that round-tripping through deflate and then inflate recovers the original input. The Write sizes are near the thresholds in the compressor.encSpeed method (0, 16, 128), as well as near maxStoreBlockSize (65535). 

### <a id="TestWriterPersistentError" href="#TestWriterPersistentError">func TestWriterPersistentError(t *testing.T)</a>

```
searchKey: flate.TestWriterPersistentError
```

```Go
func TestWriterPersistentError(t *testing.T)
```

### <a id="TestBestSpeedMatch" href="#TestBestSpeedMatch">func TestBestSpeedMatch(t *testing.T)</a>

```
searchKey: flate.TestBestSpeedMatch
```

```Go
func TestBestSpeedMatch(t *testing.T)
```

### <a id="TestBestSpeedMaxMatchOffset" href="#TestBestSpeedMaxMatchOffset">func TestBestSpeedMaxMatchOffset(t *testing.T)</a>

```
searchKey: flate.TestBestSpeedMaxMatchOffset
```

```Go
func TestBestSpeedMaxMatchOffset(t *testing.T)
```

### <a id="TestBestSpeedShiftOffsets" href="#TestBestSpeedShiftOffsets">func TestBestSpeedShiftOffsets(t *testing.T)</a>

```
searchKey: flate.TestBestSpeedShiftOffsets
```

```Go
func TestBestSpeedShiftOffsets(t *testing.T)
```

### <a id="TestMaxStackSize" href="#TestMaxStackSize">func TestMaxStackSize(t *testing.T)</a>

```
searchKey: flate.TestMaxStackSize
```

```Go
func TestMaxStackSize(t *testing.T)
```

### <a id="TestDictDecoder" href="#TestDictDecoder">func TestDictDecoder(t *testing.T)</a>

```
searchKey: flate.TestDictDecoder
```

```Go
func TestDictDecoder(t *testing.T)
```

### <a id="TestIssue5915" href="#TestIssue5915">func TestIssue5915(t *testing.T)</a>

```
searchKey: flate.TestIssue5915
```

```Go
func TestIssue5915(t *testing.T)
```

The following test should not panic. 

### <a id="TestIssue5962" href="#TestIssue5962">func TestIssue5962(t *testing.T)</a>

```
searchKey: flate.TestIssue5962
```

```Go
func TestIssue5962(t *testing.T)
```

The following test should not panic. 

### <a id="TestIssue6255" href="#TestIssue6255">func TestIssue6255(t *testing.T)</a>

```
searchKey: flate.TestIssue6255
```

```Go
func TestIssue6255(t *testing.T)
```

The following test should not panic. 

### <a id="TestInvalidEncoding" href="#TestInvalidEncoding">func TestInvalidEncoding(t *testing.T)</a>

```
searchKey: flate.TestInvalidEncoding
```

```Go
func TestInvalidEncoding(t *testing.T)
```

### <a id="TestInvalidBits" href="#TestInvalidBits">func TestInvalidBits(t *testing.T)</a>

```
searchKey: flate.TestInvalidBits
```

```Go
func TestInvalidBits(t *testing.T)
```

### <a id="TestStreams" href="#TestStreams">func TestStreams(t *testing.T)</a>

```
searchKey: flate.TestStreams
```

```Go
func TestStreams(t *testing.T)
```

### <a id="TestTruncatedStreams" href="#TestTruncatedStreams">func TestTruncatedStreams(t *testing.T)</a>

```
searchKey: flate.TestTruncatedStreams
```

```Go
func TestTruncatedStreams(t *testing.T)
```

### <a id="TestReaderEarlyEOF" href="#TestReaderEarlyEOF">func TestReaderEarlyEOF(t *testing.T)</a>

```
searchKey: flate.TestReaderEarlyEOF
```

```Go
func TestReaderEarlyEOF(t *testing.T)
```

Verify that flate.Reader.Read returns (n, io.EOF) instead of (n, nil) + (0, io.EOF) when possible. 

This helps net/http.Transport reuse HTTP/1 connections more aggressively. 

See [https://github.com/google/go-github/pull/317](https://github.com/google/go-github/pull/317) for background. 

### <a id="TestBlockHuff" href="#TestBlockHuff">func TestBlockHuff(t *testing.T)</a>

```
searchKey: flate.TestBlockHuff
```

```Go
func TestBlockHuff(t *testing.T)
```

TestBlockHuff tests huffman encoding against reference files to detect possible regressions. If encoding/bit allocation changes you can regenerate these files by using the -update flag. 

### <a id="testBlockHuff" href="#testBlockHuff">func testBlockHuff(t *testing.T, in, out string)</a>

```
searchKey: flate.testBlockHuff
```

```Go
func testBlockHuff(t *testing.T, in, out string)
```

### <a id="TestWriteBlock" href="#TestWriteBlock">func TestWriteBlock(t *testing.T)</a>

```
searchKey: flate.TestWriteBlock
```

```Go
func TestWriteBlock(t *testing.T)
```

TestWriteBlock tests if the writeBlock encoding has changed. To update the reference files use the "-update" flag on the test. 

### <a id="TestWriteBlockDynamic" href="#TestWriteBlockDynamic">func TestWriteBlockDynamic(t *testing.T)</a>

```
searchKey: flate.TestWriteBlockDynamic
```

```Go
func TestWriteBlockDynamic(t *testing.T)
```

TestWriteBlockDynamic tests if the writeBlockDynamic encoding has changed. To update the reference files use the "-update" flag on the test. 

### <a id="testBlock" href="#testBlock">func testBlock(t *testing.T, test huffTest, ttype string)</a>

```
searchKey: flate.testBlock
```

```Go
func testBlock(t *testing.T, test huffTest, ttype string)
```

testBlock tests a block against its references, or regenerate the references, if "-update" flag is set. 

### <a id="writeToType" href="#writeToType">func writeToType(t *testing.T, ttype string, bw *huffmanBitWriter, tok []token, input []byte)</a>

```
searchKey: flate.writeToType
```

```Go
func writeToType(t *testing.T, ttype string, bw *huffmanBitWriter, tok []token, input []byte)
```

### <a id="testWriterEOF" href="#testWriterEOF">func testWriterEOF(t *testing.T, ttype string, test huffTest, useInput bool)</a>

```
searchKey: flate.testWriterEOF
```

```Go
func testWriterEOF(t *testing.T, ttype string, test huffTest, useInput bool)
```

testWriterEOF tests if the written block contains an EOF marker. 

### <a id="TestReset" href="#TestReset">func TestReset(t *testing.T)</a>

```
searchKey: flate.TestReset
```

```Go
func TestReset(t *testing.T)
```

### <a id="TestReaderTruncated" href="#TestReaderTruncated">func TestReaderTruncated(t *testing.T)</a>

```
searchKey: flate.TestReaderTruncated
```

```Go
func TestReaderTruncated(t *testing.T)
```

### <a id="TestResetDict" href="#TestResetDict">func TestResetDict(t *testing.T)</a>

```
searchKey: flate.TestResetDict
```

```Go
func TestResetDict(t *testing.T)
```

### <a id="TestNlitOutOfRange" href="#TestNlitOutOfRange">func TestNlitOutOfRange(t *testing.T)</a>

```
searchKey: flate.TestNlitOutOfRange
```

```Go
func TestNlitOutOfRange(t *testing.T)
```

### <a id="BenchmarkDecode" href="#BenchmarkDecode">func BenchmarkDecode(b *testing.B)</a>

```
searchKey: flate.BenchmarkDecode
```

```Go
func BenchmarkDecode(b *testing.B)
```

### <a id="doBench" href="#doBench">func doBench(b *testing.B, f func(b *testing.B, buf []byte, level, n int))</a>

```
searchKey: flate.doBench
```

```Go
func doBench(b *testing.B, f func(b *testing.B, buf []byte, level, n int))
```

### <a id="BenchmarkEncode" href="#BenchmarkEncode">func BenchmarkEncode(b *testing.B)</a>

```
searchKey: flate.BenchmarkEncode
```

```Go
func BenchmarkEncode(b *testing.B)
```

### <a id="TestWriteError" href="#TestWriteError">func TestWriteError(t *testing.T)</a>

```
searchKey: flate.TestWriteError
```

```Go
func TestWriteError(t *testing.T)
```

Test if errors from the underlying writer is passed upwards. 

### <a id="TestDeterministic" href="#TestDeterministic">func TestDeterministic(t *testing.T)</a>

```
searchKey: flate.TestDeterministic
```

```Go
func TestDeterministic(t *testing.T)
```

Test if two runs produce identical results even when writing different sizes to the Writer. 

### <a id="testDeterministic" href="#testDeterministic">func testDeterministic(i int, t *testing.T)</a>

```
searchKey: flate.testDeterministic
```

```Go
func testDeterministic(i int, t *testing.T)
```

### <a id="TestDeflateFast_Reset" href="#TestDeflateFast_Reset">func TestDeflateFast_Reset(t *testing.T)</a>

```
searchKey: flate.TestDeflateFast_Reset
```

```Go
func TestDeflateFast_Reset(t *testing.T)
```

TestDeflateFast_Reset will test that encoding is consistent across a warparound of the table offset. See [https://github.com/golang/go/issues/34121](https://github.com/golang/go/issues/34121) 

