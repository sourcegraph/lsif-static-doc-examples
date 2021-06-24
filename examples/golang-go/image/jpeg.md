# Package jpeg

Package jpeg implements a JPEG image decoder and encoder. 

JPEG is defined in ITU-T T.81: [https://www.w3.org/Graphics/JPEG/itu-t81.pdf](https://www.w3.org/Graphics/JPEG/itu-t81.pdf). 

## Index

* [Constants](#const)
    * [const DefaultQuality](#DefaultQuality)
    * [const acTable](#acTable)
    * [const adobeTransformUnknown](#adobeTransformUnknown)
    * [const adobeTransformYCbCr](#adobeTransformYCbCr)
    * [const adobeTransformYCbCrK](#adobeTransformYCbCrK)
    * [const app0Marker](#app0Marker)
    * [const app14Marker](#app14Marker)
    * [const app15Marker](#app15Marker)
    * [const blockSize](#blockSize)
    * [const centerJSample](#centerJSample)
    * [const comMarker](#comMarker)
    * [const constBits](#constBits)
    * [const dcTable](#dcTable)
    * [const dhtMarker](#dhtMarker)
    * [const dqtMarker](#dqtMarker)
    * [const driMarker](#driMarker)
    * [const eoiMarker](#eoiMarker)
    * [const fix_0_298631336](#fix_0_298631336)
    * [const fix_0_390180644](#fix_0_390180644)
    * [const fix_0_541196100](#fix_0_541196100)
    * [const fix_0_765366865](#fix_0_765366865)
    * [const fix_0_899976223](#fix_0_899976223)
    * [const fix_1_175875602](#fix_1_175875602)
    * [const fix_1_501321110](#fix_1_501321110)
    * [const fix_1_847759065](#fix_1_847759065)
    * [const fix_1_961570560](#fix_1_961570560)
    * [const fix_2_053119869](#fix_2_053119869)
    * [const fix_2_562915447](#fix_2_562915447)
    * [const fix_3_072711026](#fix_3_072711026)
    * [const huffIndexChrominanceAC](#huffIndexChrominanceAC)
    * [const huffIndexChrominanceDC](#huffIndexChrominanceDC)
    * [const huffIndexLuminanceAC](#huffIndexLuminanceAC)
    * [const huffIndexLuminanceDC](#huffIndexLuminanceDC)
    * [const lutSize](#lutSize)
    * [const maxCodeLength](#maxCodeLength)
    * [const maxComponents](#maxComponents)
    * [const maxNCodes](#maxNCodes)
    * [const maxTc](#maxTc)
    * [const maxTh](#maxTh)
    * [const maxTq](#maxTq)
    * [const nHuffIndex](#nHuffIndex)
    * [const nQuantIndex](#nQuantIndex)
    * [const pass1Bits](#pass1Bits)
    * [const quantIndexChrominance](#quantIndexChrominance)
    * [const quantIndexLuminance](#quantIndexLuminance)
    * [const r2](#r2)
    * [const rst0Marker](#rst0Marker)
    * [const rst7Marker](#rst7Marker)
    * [const sof0Marker](#sof0Marker)
    * [const sof1Marker](#sof1Marker)
    * [const sof2Marker](#sof2Marker)
    * [const soiMarker](#soiMarker)
    * [const sosMarker](#sosMarker)
    * [const w1](#w1)
    * [const w1mw7](#w1mw7)
    * [const w1pw7](#w1pw7)
    * [const w2](#w2)
    * [const w2mw6](#w2mw6)
    * [const w2pw6](#w2pw6)
    * [const w3](#w3)
    * [const w3mw5](#w3mw5)
    * [const w3pw5](#w3pw5)
    * [const w5](#w5)
    * [const w6](#w6)
    * [const w7](#w7)
* [Variables](#var)
    * [var bitCount](#bitCount)
    * [var cosines](#cosines)
    * [var errMissingFF00](#errMissingFF00)
    * [var errShortHuffmanData](#errShortHuffmanData)
    * [var errUnsupportedSubsamplingRatio](#errUnsupportedSubsamplingRatio)
    * [var sosHeaderY](#sosHeaderY)
    * [var sosHeaderYCbCr](#sosHeaderYCbCr)
    * [var testBlocks](#testBlocks)
    * [var testCase](#testCase)
    * [var theHuffmanLUT](#theHuffmanLUT)
    * [var theHuffmanSpec](#theHuffmanSpec)
    * [var unscaledQuant](#unscaledQuant)
    * [var unscaledQuantInNaturalOrder](#unscaledQuantInNaturalOrder)
    * [var unzig](#unzig)
    * [var zigzag](#zigzag)
* [Types](#type)
    * [type FormatError string](#FormatError)
        * [func (e FormatError) Error() string](#FormatError.Error)
    * [type Options struct](#Options)
    * [type Reader interface](#Reader)
    * [type UnsupportedError string](#UnsupportedError)
        * [func (e UnsupportedError) Error() string](#UnsupportedError.Error)
    * [type bits struct](#bits)
    * [type block [64]int32](#block)
        * [func (b *block) String() string](#block.String)
    * [type component struct](#component)
    * [type decoder struct](#decoder)
        * [func (d *decoder) applyBlack() (image.Image, error)](#decoder.applyBlack)
        * [func (d *decoder) convertToRGB() (image.Image, error)](#decoder.convertToRGB)
        * [func (d *decoder) decode(r io.Reader, configOnly bool) (image.Image, error)](#decoder.decode)
        * [func (d *decoder) decodeBit() (bool, error)](#decoder.decodeBit)
        * [func (d *decoder) decodeBits(n int32) (uint32, error)](#decoder.decodeBits)
        * [func (d *decoder) decodeHuffman(h *huffman) (uint8, error)](#decoder.decodeHuffman)
        * [func (d *decoder) ensureNBits(n int32) error](#decoder.ensureNBits)
        * [func (d *decoder) fill() error](#decoder.fill)
        * [func (d *decoder) ignore(n int) error](#decoder.ignore)
        * [func (d *decoder) isRGB() bool](#decoder.isRGB)
        * [func (d *decoder) makeImg(mxx, myy int)](#decoder.makeImg)
        * [func (d *decoder) processApp0Marker(n int) error](#decoder.processApp0Marker)
        * [func (d *decoder) processApp14Marker(n int) error](#decoder.processApp14Marker)
        * [func (d *decoder) processDHT(n int) error](#decoder.processDHT)
        * [func (d *decoder) processDQT(n int) error](#decoder.processDQT)
        * [func (d *decoder) processDRI(n int) error](#decoder.processDRI)
        * [func (d *decoder) processSOF(n int) error](#decoder.processSOF)
        * [func (d *decoder) processSOS(n int) error](#decoder.processSOS)
        * [func (d *decoder) readByte() (x byte, err error)](#decoder.readByte)
        * [func (d *decoder) readByteStuffedByte() (x byte, err error)](#decoder.readByteStuffedByte)
        * [func (d *decoder) readFull(p []byte) error](#decoder.readFull)
        * [func (d *decoder) receiveExtend(t uint8) (int32, error)](#decoder.receiveExtend)
        * [func (d *decoder) reconstructBlock(b *block, bx, by, compIndex int) error](#decoder.reconstructBlock)
        * [func (d *decoder) reconstructProgressiveImage() error](#decoder.reconstructProgressiveImage)
        * [func (d *decoder) refine(b *block, h *huffman, zigStart, zigEnd, delta int32) error](#decoder.refine)
        * [func (d *decoder) refineNonZeroes(b *block, zig, zigEnd, nz, delta int32) (int32, error)](#decoder.refineNonZeroes)
        * [func (d *decoder) unreadByteStuffedByte()](#decoder.unreadByteStuffedByte)
    * [type encoder struct](#encoder)
        * [func (e *encoder) emit(bits, nBits uint32)](#encoder.emit)
        * [func (e *encoder) emitHuff(h huffIndex, value int32)](#encoder.emitHuff)
        * [func (e *encoder) emitHuffRLE(h huffIndex, runLength, value int32)](#encoder.emitHuffRLE)
        * [func (e *encoder) flush()](#encoder.flush)
        * [func (e *encoder) write(p []byte)](#encoder.write)
        * [func (e *encoder) writeBlock(b *block, q quantIndex, prevDC int32) int32](#encoder.writeBlock)
        * [func (e *encoder) writeByte(b byte)](#encoder.writeByte)
        * [func (e *encoder) writeDHT(nComponent int)](#encoder.writeDHT)
        * [func (e *encoder) writeDQT()](#encoder.writeDQT)
        * [func (e *encoder) writeMarkerHeader(marker uint8, markerlen int)](#encoder.writeMarkerHeader)
        * [func (e *encoder) writeSOF0(size image.Point, nComponent int)](#encoder.writeSOF0)
        * [func (e *encoder) writeSOS(m image.Image)](#encoder.writeSOS)
    * [type eofReader struct](#eofReader)
        * [func (r *eofReader) Read(b []byte) (n int, err error)](#eofReader.Read)
    * [type huffIndex int](#huffIndex)
    * [type huffman struct](#huffman)
    * [type huffmanLUT []uint32](#huffmanLUT)
        * [func (h *huffmanLUT) init(s huffmanSpec)](#huffmanLUT.init.writer.go)
    * [type huffmanSpec struct](#huffmanSpec)
    * [type quantIndex int](#quantIndex)
    * [type writer interface](#writer)
* [Functions](#func)
    * [func BenchmarkDecodeBaseline(b *testing.B)](#BenchmarkDecodeBaseline)
    * [func BenchmarkDecodeProgressive(b *testing.B)](#BenchmarkDecodeProgressive)
    * [func BenchmarkEncodeRGBA(b *testing.B)](#BenchmarkEncodeRGBA)
    * [func BenchmarkEncodeYCbCr(b *testing.B)](#BenchmarkEncodeYCbCr)
    * [func BenchmarkFDCT(b *testing.B)](#BenchmarkFDCT)
    * [func BenchmarkIDCT(b *testing.B)](#BenchmarkIDCT)
    * [func Decode(r io.Reader) (image.Image, error)](#Decode)
    * [func DecodeConfig(r io.Reader) (image.Config, error)](#DecodeConfig)
    * [func Encode(w io.Writer, m image.Image, o *Options) error](#Encode)
    * [func TestDCT(t *testing.T)](#TestDCT)
    * [func TestDecodeEOF(t *testing.T)](#TestDecodeEOF)
    * [func TestDecodeProgressive(t *testing.T)](#TestDecodeProgressive)
    * [func TestEncodeYCbCr(t *testing.T)](#TestEncodeYCbCr)
    * [func TestExtraneousData(t *testing.T)](#TestExtraneousData)
    * [func TestLargeImageWithShortData(t *testing.T)](#TestLargeImageWithShortData)
    * [func TestPaddedRSTMarker(t *testing.T)](#TestPaddedRSTMarker)
    * [func TestTruncatedSOSDataDoesntPanic(t *testing.T)](#TestTruncatedSOSDataDoesntPanic)
    * [func TestUnscaledQuant(t *testing.T)](#TestUnscaledQuant)
    * [func TestWriteGrayscale(t *testing.T)](#TestWriteGrayscale)
    * [func TestWriter(t *testing.T)](#TestWriter)
    * [func TestZigUnzig(t *testing.T)](#TestZigUnzig)
    * [func alpha(i int) float64](#alpha)
    * [func averageDelta(m0, m1 image.Image) int64](#averageDelta)
    * [func benchmarkDCT(b *testing.B, f func(*block))](#benchmarkDCT)
    * [func benchmarkDecode(b *testing.B, filename string)](#benchmarkDecode)
    * [func check(bounds image.Rectangle, pix0, pix1 []byte, stride0, stride1 int) error](#check)
    * [func decodeFile(filename string) (image.Image, error)](#decodeFile)
    * [func delta(u0, u1 uint32) int64](#delta)
    * [func differ(b0, b1 *block) bool](#differ)
    * [func div(a, b int32) int32](#div)
    * [func fdct(b *block)](#fdct)
    * [func grayToY(m *image.Gray, p image.Point, yBlock *block)](#grayToY)
    * [func idct(src *block)](#idct)
    * [func init()](#init.dct_test.go)
    * [func init()](#init.reader.go)
    * [func init()](#init.writer.go.0xc038aba908)
    * [func min(x, y int) int](#min)
    * [func pixString(pix []byte, stride, x, y int) string](#pixString)
    * [func readPng(filename string) (image.Image, error)](#readPng)
    * [func rgbaToYCbCr(m *image.RGBA, p image.Point, yBlock, cbBlock, crBlock *block)](#rgbaToYCbCr)
    * [func scale(dst *block, src *[4]block)](#scale)
    * [func slowFDCT(b *block)](#slowFDCT)
    * [func slowIDCT(b *block)](#slowIDCT)
    * [func toYCbCr(m image.Image, p image.Point, yBlock, cbBlock, crBlock *block)](#toYCbCr)
    * [func yCbCrToYCbCr(m *image.YCbCr, p image.Point, yBlock, cbBlock, crBlock *block)](#yCbCrToYCbCr)


## <a id="const" href="#const">Constants</a>

```
tags: [package]
```

### <a id="DefaultQuality" href="#DefaultQuality">const DefaultQuality</a>

```
searchKey: jpeg.DefaultQuality
tags: [constant number]
```

```Go
const DefaultQuality = 75
```

DefaultQuality is the default quality encoding parameter. 

### <a id="acTable" href="#acTable">const acTable</a>

```
searchKey: jpeg.acTable
tags: [constant number private]
```

```Go
const acTable = 1
```

### <a id="adobeTransformUnknown" href="#adobeTransformUnknown">const adobeTransformUnknown</a>

```
searchKey: jpeg.adobeTransformUnknown
tags: [constant number private]
```

```Go
const adobeTransformUnknown = 0
```

See [https://www.sno.phy.queensu.ca/~phil/exiftool/TagNames/JPEG.html#Adobe](https://www.sno.phy.queensu.ca/~phil/exiftool/TagNames/JPEG.html#Adobe) 

### <a id="adobeTransformYCbCr" href="#adobeTransformYCbCr">const adobeTransformYCbCr</a>

```
searchKey: jpeg.adobeTransformYCbCr
tags: [constant number private]
```

```Go
const adobeTransformYCbCr = 1
```

See [https://www.sno.phy.queensu.ca/~phil/exiftool/TagNames/JPEG.html#Adobe](https://www.sno.phy.queensu.ca/~phil/exiftool/TagNames/JPEG.html#Adobe) 

### <a id="adobeTransformYCbCrK" href="#adobeTransformYCbCrK">const adobeTransformYCbCrK</a>

```
searchKey: jpeg.adobeTransformYCbCrK
tags: [constant number private]
```

```Go
const adobeTransformYCbCrK = 2
```

See [https://www.sno.phy.queensu.ca/~phil/exiftool/TagNames/JPEG.html#Adobe](https://www.sno.phy.queensu.ca/~phil/exiftool/TagNames/JPEG.html#Adobe) 

### <a id="app0Marker" href="#app0Marker">const app0Marker</a>

```
searchKey: jpeg.app0Marker
tags: [constant number private]
```

```Go
const app0Marker = 0xe0
```

"APPlication specific" markers aren't part of the JPEG spec per se, but in practice, their use is described at [https://www.sno.phy.queensu.ca/~phil/exiftool/TagNames/JPEG.html](https://www.sno.phy.queensu.ca/~phil/exiftool/TagNames/JPEG.html) 

### <a id="app14Marker" href="#app14Marker">const app14Marker</a>

```
searchKey: jpeg.app14Marker
tags: [constant number private]
```

```Go
const app14Marker = 0xee
```

### <a id="app15Marker" href="#app15Marker">const app15Marker</a>

```
searchKey: jpeg.app15Marker
tags: [constant number private]
```

```Go
const app15Marker = 0xef
```

### <a id="blockSize" href="#blockSize">const blockSize</a>

```
searchKey: jpeg.blockSize
tags: [constant number private]
```

```Go
const blockSize = 64 // A DCT block is 8x8.

```

### <a id="centerJSample" href="#centerJSample">const centerJSample</a>

```
searchKey: jpeg.centerJSample
tags: [constant number private]
```

```Go
const centerJSample = 128
```

### <a id="comMarker" href="#comMarker">const comMarker</a>

```
searchKey: jpeg.comMarker
tags: [constant number private]
```

```Go
const comMarker = 0xfe // COMment.

```

### <a id="constBits" href="#constBits">const constBits</a>

```
searchKey: jpeg.constBits
tags: [constant number private]
```

```Go
const constBits = 13
```

### <a id="dcTable" href="#dcTable">const dcTable</a>

```
searchKey: jpeg.dcTable
tags: [constant number private]
```

```Go
const dcTable = 0
```

### <a id="dhtMarker" href="#dhtMarker">const dhtMarker</a>

```
searchKey: jpeg.dhtMarker
tags: [constant number private]
```

```Go
const dhtMarker = 0xc4 // Define Huffman Table.

```

### <a id="dqtMarker" href="#dqtMarker">const dqtMarker</a>

```
searchKey: jpeg.dqtMarker
tags: [constant number private]
```

```Go
const dqtMarker = 0xdb // Define Quantization Table.

```

### <a id="driMarker" href="#driMarker">const driMarker</a>

```
searchKey: jpeg.driMarker
tags: [constant number private]
```

```Go
const driMarker = 0xdd // Define Restart Interval.

```

### <a id="eoiMarker" href="#eoiMarker">const eoiMarker</a>

```
searchKey: jpeg.eoiMarker
tags: [constant number private]
```

```Go
const eoiMarker = 0xd9 // End Of Image.

```

### <a id="fix_0_298631336" href="#fix_0_298631336">const fix_0_298631336</a>

```
searchKey: jpeg.fix_0_298631336
tags: [constant number private]
```

```Go
const fix_0_298631336 = 2446
```

Trigonometric constants in 13-bit fixed point format. 

### <a id="fix_0_390180644" href="#fix_0_390180644">const fix_0_390180644</a>

```
searchKey: jpeg.fix_0_390180644
tags: [constant number private]
```

```Go
const fix_0_390180644 = 3196
```

Trigonometric constants in 13-bit fixed point format. 

### <a id="fix_0_541196100" href="#fix_0_541196100">const fix_0_541196100</a>

```
searchKey: jpeg.fix_0_541196100
tags: [constant number private]
```

```Go
const fix_0_541196100 = 4433
```

Trigonometric constants in 13-bit fixed point format. 

### <a id="fix_0_765366865" href="#fix_0_765366865">const fix_0_765366865</a>

```
searchKey: jpeg.fix_0_765366865
tags: [constant number private]
```

```Go
const fix_0_765366865 = 6270
```

Trigonometric constants in 13-bit fixed point format. 

### <a id="fix_0_899976223" href="#fix_0_899976223">const fix_0_899976223</a>

```
searchKey: jpeg.fix_0_899976223
tags: [constant number private]
```

```Go
const fix_0_899976223 = 7373
```

Trigonometric constants in 13-bit fixed point format. 

### <a id="fix_1_175875602" href="#fix_1_175875602">const fix_1_175875602</a>

```
searchKey: jpeg.fix_1_175875602
tags: [constant number private]
```

```Go
const fix_1_175875602 = 9633
```

Trigonometric constants in 13-bit fixed point format. 

### <a id="fix_1_501321110" href="#fix_1_501321110">const fix_1_501321110</a>

```
searchKey: jpeg.fix_1_501321110
tags: [constant number private]
```

```Go
const fix_1_501321110 = 12299
```

Trigonometric constants in 13-bit fixed point format. 

### <a id="fix_1_847759065" href="#fix_1_847759065">const fix_1_847759065</a>

```
searchKey: jpeg.fix_1_847759065
tags: [constant number private]
```

```Go
const fix_1_847759065 = 15137
```

Trigonometric constants in 13-bit fixed point format. 

### <a id="fix_1_961570560" href="#fix_1_961570560">const fix_1_961570560</a>

```
searchKey: jpeg.fix_1_961570560
tags: [constant number private]
```

```Go
const fix_1_961570560 = 16069
```

Trigonometric constants in 13-bit fixed point format. 

### <a id="fix_2_053119869" href="#fix_2_053119869">const fix_2_053119869</a>

```
searchKey: jpeg.fix_2_053119869
tags: [constant number private]
```

```Go
const fix_2_053119869 = 16819
```

Trigonometric constants in 13-bit fixed point format. 

### <a id="fix_2_562915447" href="#fix_2_562915447">const fix_2_562915447</a>

```
searchKey: jpeg.fix_2_562915447
tags: [constant number private]
```

```Go
const fix_2_562915447 = 20995
```

Trigonometric constants in 13-bit fixed point format. 

### <a id="fix_3_072711026" href="#fix_3_072711026">const fix_3_072711026</a>

```
searchKey: jpeg.fix_3_072711026
tags: [constant number private]
```

```Go
const fix_3_072711026 = 25172
```

Trigonometric constants in 13-bit fixed point format. 

### <a id="huffIndexChrominanceAC" href="#huffIndexChrominanceAC">const huffIndexChrominanceAC</a>

```
searchKey: jpeg.huffIndexChrominanceAC
tags: [constant number private]
```

```Go
const huffIndexChrominanceAC
```

### <a id="huffIndexChrominanceDC" href="#huffIndexChrominanceDC">const huffIndexChrominanceDC</a>

```
searchKey: jpeg.huffIndexChrominanceDC
tags: [constant number private]
```

```Go
const huffIndexChrominanceDC
```

### <a id="huffIndexLuminanceAC" href="#huffIndexLuminanceAC">const huffIndexLuminanceAC</a>

```
searchKey: jpeg.huffIndexLuminanceAC
tags: [constant number private]
```

```Go
const huffIndexLuminanceAC
```

### <a id="huffIndexLuminanceDC" href="#huffIndexLuminanceDC">const huffIndexLuminanceDC</a>

```
searchKey: jpeg.huffIndexLuminanceDC
tags: [constant number private]
```

```Go
const huffIndexLuminanceDC huffIndex = iota
```

### <a id="lutSize" href="#lutSize">const lutSize</a>

```
searchKey: jpeg.lutSize
tags: [constant number private]
```

```Go
const lutSize = 8
```

lutSize is the log-2 size of the Huffman decoder's look-up table. 

### <a id="maxCodeLength" href="#maxCodeLength">const maxCodeLength</a>

```
searchKey: jpeg.maxCodeLength
tags: [constant number private]
```

```Go
const maxCodeLength = 16
```

maxCodeLength is the maximum (inclusive) number of bits in a Huffman code. 

### <a id="maxComponents" href="#maxComponents">const maxComponents</a>

```
searchKey: jpeg.maxComponents
tags: [constant number private]
```

```Go
const maxComponents = 4
```

### <a id="maxNCodes" href="#maxNCodes">const maxNCodes</a>

```
searchKey: jpeg.maxNCodes
tags: [constant number private]
```

```Go
const maxNCodes = 256
```

maxNCodes is the maximum (inclusive) number of codes in a Huffman tree. 

### <a id="maxTc" href="#maxTc">const maxTc</a>

```
searchKey: jpeg.maxTc
tags: [constant number private]
```

```Go
const maxTc = 1
```

### <a id="maxTh" href="#maxTh">const maxTh</a>

```
searchKey: jpeg.maxTh
tags: [constant number private]
```

```Go
const maxTh = 3
```

### <a id="maxTq" href="#maxTq">const maxTq</a>

```
searchKey: jpeg.maxTq
tags: [constant number private]
```

```Go
const maxTq = 3
```

### <a id="nHuffIndex" href="#nHuffIndex">const nHuffIndex</a>

```
searchKey: jpeg.nHuffIndex
tags: [constant number private]
```

```Go
const nHuffIndex
```

### <a id="nQuantIndex" href="#nQuantIndex">const nQuantIndex</a>

```
searchKey: jpeg.nQuantIndex
tags: [constant number private]
```

```Go
const nQuantIndex
```

### <a id="pass1Bits" href="#pass1Bits">const pass1Bits</a>

```
searchKey: jpeg.pass1Bits
tags: [constant number private]
```

```Go
const pass1Bits = 2
```

### <a id="quantIndexChrominance" href="#quantIndexChrominance">const quantIndexChrominance</a>

```
searchKey: jpeg.quantIndexChrominance
tags: [constant number private]
```

```Go
const quantIndexChrominance
```

### <a id="quantIndexLuminance" href="#quantIndexLuminance">const quantIndexLuminance</a>

```
searchKey: jpeg.quantIndexLuminance
tags: [constant number private]
```

```Go
const quantIndexLuminance quantIndex = iota
```

### <a id="r2" href="#r2">const r2</a>

```
searchKey: jpeg.r2
tags: [constant number private]
```

```Go
const r2 = 181 // 256/sqrt(2)

```

### <a id="rst0Marker" href="#rst0Marker">const rst0Marker</a>

```
searchKey: jpeg.rst0Marker
tags: [constant number private]
```

```Go
const rst0Marker = 0xd0 // ReSTart (0).

```

### <a id="rst7Marker" href="#rst7Marker">const rst7Marker</a>

```
searchKey: jpeg.rst7Marker
tags: [constant number private]
```

```Go
const rst7Marker = 0xd7 // ReSTart (7).

```

### <a id="sof0Marker" href="#sof0Marker">const sof0Marker</a>

```
searchKey: jpeg.sof0Marker
tags: [constant number private]
```

```Go
const sof0Marker = 0xc0 // Start Of Frame (Baseline Sequential).

```

### <a id="sof1Marker" href="#sof1Marker">const sof1Marker</a>

```
searchKey: jpeg.sof1Marker
tags: [constant number private]
```

```Go
const sof1Marker = 0xc1 // Start Of Frame (Extended Sequential).

```

### <a id="sof2Marker" href="#sof2Marker">const sof2Marker</a>

```
searchKey: jpeg.sof2Marker
tags: [constant number private]
```

```Go
const sof2Marker = 0xc2 // Start Of Frame (Progressive).

```

### <a id="soiMarker" href="#soiMarker">const soiMarker</a>

```
searchKey: jpeg.soiMarker
tags: [constant number private]
```

```Go
const soiMarker = 0xd8 // Start Of Image.

```

### <a id="sosMarker" href="#sosMarker">const sosMarker</a>

```
searchKey: jpeg.sosMarker
tags: [constant number private]
```

```Go
const sosMarker = 0xda // Start Of Scan.

```

### <a id="w1" href="#w1">const w1</a>

```
searchKey: jpeg.w1
tags: [constant number private]
```

```Go
const w1 = 2841 // 2048*sqrt(2)*cos(1*pi/16)

```

### <a id="w1mw7" href="#w1mw7">const w1mw7</a>

```
searchKey: jpeg.w1mw7
tags: [constant number private]
```

```Go
const w1mw7 = w1 - w7
```

### <a id="w1pw7" href="#w1pw7">const w1pw7</a>

```
searchKey: jpeg.w1pw7
tags: [constant number private]
```

```Go
const w1pw7 = w1 + w7
```

### <a id="w2" href="#w2">const w2</a>

```
searchKey: jpeg.w2
tags: [constant number private]
```

```Go
const w2 = 2676 // 2048*sqrt(2)*cos(2*pi/16)

```

### <a id="w2mw6" href="#w2mw6">const w2mw6</a>

```
searchKey: jpeg.w2mw6
tags: [constant number private]
```

```Go
const w2mw6 = w2 - w6
```

### <a id="w2pw6" href="#w2pw6">const w2pw6</a>

```
searchKey: jpeg.w2pw6
tags: [constant number private]
```

```Go
const w2pw6 = w2 + w6
```

### <a id="w3" href="#w3">const w3</a>

```
searchKey: jpeg.w3
tags: [constant number private]
```

```Go
const w3 = 2408 // 2048*sqrt(2)*cos(3*pi/16)

```

### <a id="w3mw5" href="#w3mw5">const w3mw5</a>

```
searchKey: jpeg.w3mw5
tags: [constant number private]
```

```Go
const w3mw5 = w3 - w5
```

### <a id="w3pw5" href="#w3pw5">const w3pw5</a>

```
searchKey: jpeg.w3pw5
tags: [constant number private]
```

```Go
const w3pw5 = w3 + w5
```

### <a id="w5" href="#w5">const w5</a>

```
searchKey: jpeg.w5
tags: [constant number private]
```

```Go
const w5 = 1609 // 2048*sqrt(2)*cos(5*pi/16)

```

### <a id="w6" href="#w6">const w6</a>

```
searchKey: jpeg.w6
tags: [constant number private]
```

```Go
const w6 = 1108 // 2048*sqrt(2)*cos(6*pi/16)

```

### <a id="w7" href="#w7">const w7</a>

```
searchKey: jpeg.w7
tags: [constant number private]
```

```Go
const w7 = 565 // 2048*sqrt(2)*cos(7*pi/16)

```

## <a id="var" href="#var">Variables</a>

```
tags: [package]
```

### <a id="bitCount" href="#bitCount">var bitCount</a>

```
searchKey: jpeg.bitCount
tags: [variable array number private]
```

```Go
var bitCount = ...
```

bitCount counts the number of bits needed to hold an integer. 

### <a id="cosines" href="#cosines">var cosines</a>

```
searchKey: jpeg.cosines
tags: [variable array number private]
```

```Go
var cosines [32]float64 // cosines[k] = cos(π/2 * k/8)

```

### <a id="errMissingFF00" href="#errMissingFF00">var errMissingFF00</a>

```
searchKey: jpeg.errMissingFF00
tags: [variable string private]
```

```Go
var errMissingFF00 = FormatError("missing 0xff00 sequence")
```

errMissingFF00 means that readByteStuffedByte encountered an 0xff byte (a marker byte) that wasn't the expected byte-stuffed sequence 0xff, 0x00. 

### <a id="errShortHuffmanData" href="#errShortHuffmanData">var errShortHuffmanData</a>

```
searchKey: jpeg.errShortHuffmanData
tags: [variable string private]
```

```Go
var errShortHuffmanData = FormatError("short Huffman data")
```

errShortHuffmanData means that an unexpected EOF occurred while decoding Huffman data. 

### <a id="errUnsupportedSubsamplingRatio" href="#errUnsupportedSubsamplingRatio">var errUnsupportedSubsamplingRatio</a>

```
searchKey: jpeg.errUnsupportedSubsamplingRatio
tags: [variable string private]
```

```Go
var errUnsupportedSubsamplingRatio = UnsupportedError("luma/chroma subsampling ratio")
```

### <a id="sosHeaderY" href="#sosHeaderY">var sosHeaderY</a>

```
searchKey: jpeg.sosHeaderY
tags: [variable array number private]
```

```Go
var sosHeaderY = []byte{
	0xff, 0xda, 0x00, 0x08, 0x01, 0x01, 0x00, 0x00, 0x3f, 0x00,
}
```

sosHeaderY is the SOS marker "\xff\xda" followed by 8 bytes: 

```
- the marker length "\x00\x08",
- the number of components "\x01",
- component 1 uses DC table 0 and AC table 0 "\x01\x00",
- the bytes "\x00\x3f\x00". Section B.2.3 of the spec says that for
  sequential DCTs, those bytes (8-bit Ss, 8-bit Se, 4-bit Ah, 4-bit Al)
  should be 0x00, 0x3f, 0x00<<4 | 0x00.

```
### <a id="sosHeaderYCbCr" href="#sosHeaderYCbCr">var sosHeaderYCbCr</a>

```
searchKey: jpeg.sosHeaderYCbCr
tags: [variable array number private]
```

```Go
var sosHeaderYCbCr = ...
```

sosHeaderYCbCr is the SOS marker "\xff\xda" followed by 12 bytes: 

```
- the marker length "\x00\x0c",
- the number of components "\x03",
- component 1 uses DC table 0 and AC table 0 "\x01\x00",
- component 2 uses DC table 1 and AC table 1 "\x02\x11",
- component 3 uses DC table 1 and AC table 1 "\x03\x11",
- the bytes "\x00\x3f\x00". Section B.2.3 of the spec says that for
  sequential DCTs, those bytes (8-bit Ss, 8-bit Se, 4-bit Ah, 4-bit Al)
  should be 0x00, 0x3f, 0x00<<4 | 0x00.

```
### <a id="testBlocks" href="#testBlocks">var testBlocks</a>

```
searchKey: jpeg.testBlocks
tags: [variable array array number private]
```

```Go
var testBlocks = ...
```

testBlocks are the first 10 pre-IDCT blocks from ../testdata/video-001.jpeg. 

### <a id="testCase" href="#testCase">var testCase</a>

```
searchKey: jpeg.testCase
tags: [variable array struct private]
```

```Go
var testCase = ...
```

### <a id="theHuffmanLUT" href="#theHuffmanLUT">var theHuffmanLUT</a>

```
searchKey: jpeg.theHuffmanLUT
tags: [variable array array number private]
```

```Go
var theHuffmanLUT [4]huffmanLUT
```

theHuffmanLUT are compiled representations of theHuffmanSpec. 

### <a id="theHuffmanSpec" href="#theHuffmanSpec">var theHuffmanSpec</a>

```
searchKey: jpeg.theHuffmanSpec
tags: [variable array struct private]
```

```Go
var theHuffmanSpec = ...
```

theHuffmanSpec is the Huffman encoding specifications. This encoder uses the same Huffman encoding for all images. 

### <a id="unscaledQuant" href="#unscaledQuant">var unscaledQuant</a>

```
searchKey: jpeg.unscaledQuant
tags: [variable array array number private]
```

```Go
var unscaledQuant = ...
```

unscaledQuant are the unscaled quantization tables in zig-zag order. Each encoder copies and scales the tables according to its quality parameter. The values are derived from section K.1 after converting from natural to zig-zag order. 

### <a id="unscaledQuantInNaturalOrder" href="#unscaledQuantInNaturalOrder">var unscaledQuantInNaturalOrder</a>

```
searchKey: jpeg.unscaledQuantInNaturalOrder
tags: [variable array array number private]
```

```Go
var unscaledQuantInNaturalOrder = ...
```

unscaledQuantInNaturalOrder are the unscaled quantization tables in natural (not zig-zag) order, as specified in section K.1. 

### <a id="unzig" href="#unzig">var unzig</a>

```
searchKey: jpeg.unzig
tags: [variable array number private]
```

```Go
var unzig = ...
```

unzig maps from the zig-zag ordering to the natural ordering. For example, unzig[3] is the column and row of the fourth element in zig-zag order. The value is 16, which means first column (16%8 == 0) and third row (16/8 == 2). 

### <a id="zigzag" href="#zigzag">var zigzag</a>

```
searchKey: jpeg.zigzag
tags: [variable array number private]
```

```Go
var zigzag = ...
```

zigzag maps from the natural ordering to the zig-zag ordering. For example, zigzag[0*8 + 3] is the zig-zag sequence number of the element in the fourth column and first row. 

## <a id="type" href="#type">Types</a>

```
tags: [package]
```

### <a id="FormatError" href="#FormatError">type FormatError string</a>

```
searchKey: jpeg.FormatError
tags: [string]
```

```Go
type FormatError string
```

A FormatError reports that the input is not a valid JPEG. 

#### <a id="FormatError.Error" href="#FormatError.Error">func (e FormatError) Error() string</a>

```
searchKey: jpeg.FormatError.Error
tags: [function]
```

```Go
func (e FormatError) Error() string
```

### <a id="Options" href="#Options">type Options struct</a>

```
searchKey: jpeg.Options
tags: [struct]
```

```Go
type Options struct {
	Quality int
}
```

Options are the encoding parameters. Quality ranges from 1 to 100 inclusive, higher is better. 

### <a id="Reader" href="#Reader">type Reader interface</a>

```
searchKey: jpeg.Reader
tags: [interface]
```

```Go
type Reader interface {
	io.ByteReader
	io.Reader
}
```

Deprecated: Reader is not used by the image/jpeg package and should not be used by others. It is kept for compatibility. 

### <a id="UnsupportedError" href="#UnsupportedError">type UnsupportedError string</a>

```
searchKey: jpeg.UnsupportedError
tags: [string]
```

```Go
type UnsupportedError string
```

An UnsupportedError reports that the input uses a valid but unimplemented JPEG feature. 

#### <a id="UnsupportedError.Error" href="#UnsupportedError.Error">func (e UnsupportedError) Error() string</a>

```
searchKey: jpeg.UnsupportedError.Error
tags: [function]
```

```Go
func (e UnsupportedError) Error() string
```

### <a id="bits" href="#bits">type bits struct</a>

```
searchKey: jpeg.bits
tags: [struct private]
```

```Go
type bits struct {
	a uint32 // accumulator.
	m uint32 // mask. m==1<<(n-1) when n>0, with m==0 when n==0.
	n int32  // the number of unread bits in a.
}
```

bits holds the unprocessed bits that have been taken from the byte-stream. The n least significant bits of a form the unread bits, to be read in MSB to LSB order. 

### <a id="block" href="#block">type block [64]int32</a>

```
searchKey: jpeg.block
tags: [array number private]
```

```Go
type block [blockSize]int32
```

#### <a id="block.String" href="#block.String">func (b *block) String() string</a>

```
searchKey: jpeg.block.String
tags: [function private]
```

```Go
func (b *block) String() string
```

### <a id="component" href="#component">type component struct</a>

```
searchKey: jpeg.component
tags: [struct private]
```

```Go
type component struct {
	h  int   // Horizontal sampling factor.
	v  int   // Vertical sampling factor.
	c  uint8 // Component identifier.
	tq uint8 // Quantization table destination selector.
}
```

Component specification, specified in section B.2.2. 

### <a id="decoder" href="#decoder">type decoder struct</a>

```
searchKey: jpeg.decoder
tags: [struct private]
```

```Go
type decoder struct {
	r    io.Reader
	bits bits
	// bytes is a byte buffer, similar to a bufio.Reader, except that it
	// has to be able to unread more than 1 byte, due to byte stuffing.
	// Byte stuffing is specified in section F.1.2.3.
	bytes struct {
		// buf[i:j] are the buffered bytes read from the underlying
		// io.Reader that haven't yet been passed further on.
		buf  [4096]byte
		i, j int
		// nUnreadable is the number of bytes to back up i after
		// overshooting. It can be 0, 1 or 2.
		nUnreadable int
	}
	width, height int

	img1        *image.Gray
	img3        *image.YCbCr
	blackPix    []byte
	blackStride int

	ri    int // Restart Interval.
	nComp int

	// As per section 4.5, there are four modes of operation (selected by the
	// SOF? markers): sequential DCT, progressive DCT, lossless and
	// hierarchical, although this implementation does not support the latter
	// two non-DCT modes. Sequential DCT is further split into baseline and
	// extended, as per section 4.11.
	baseline    bool
	progressive bool

	jfif                bool
	adobeTransformValid bool
	adobeTransform      uint8
	eobRun              uint16 // End-of-Band run, specified in section G.1.2.2.

	comp       [maxComponents]component
	progCoeffs [maxComponents][]block // Saved state between progressive-mode scans.
	huff       [maxTc + 1][maxTh + 1]huffman
	quant      [maxTq + 1]block // Quantization tables, in zig-zag order.
	tmp        [2 * blockSize]byte
}
```

#### <a id="decoder.applyBlack" href="#decoder.applyBlack">func (d *decoder) applyBlack() (image.Image, error)</a>

```
searchKey: jpeg.decoder.applyBlack
tags: [function private]
```

```Go
func (d *decoder) applyBlack() (image.Image, error)
```

applyBlack combines d.img3 and d.blackPix into a CMYK image. The formula used depends on whether the JPEG image is stored as CMYK or YCbCrK, indicated by the APP14 (Adobe) metadata. 

Adobe CMYK JPEG images are inverted, where 255 means no ink instead of full ink, so we apply "v = 255 - v" at various points. Note that a double inversion is a no-op, so inversions might be implicit in the code below. 

#### <a id="decoder.convertToRGB" href="#decoder.convertToRGB">func (d *decoder) convertToRGB() (image.Image, error)</a>

```
searchKey: jpeg.decoder.convertToRGB
tags: [function private]
```

```Go
func (d *decoder) convertToRGB() (image.Image, error)
```

#### <a id="decoder.decode" href="#decoder.decode">func (d *decoder) decode(r io.Reader, configOnly bool) (image.Image, error)</a>

```
searchKey: jpeg.decoder.decode
tags: [method private]
```

```Go
func (d *decoder) decode(r io.Reader, configOnly bool) (image.Image, error)
```

decode reads a JPEG image from r and returns it as an image.Image. 

#### <a id="decoder.decodeBit" href="#decoder.decodeBit">func (d *decoder) decodeBit() (bool, error)</a>

```
searchKey: jpeg.decoder.decodeBit
tags: [function private]
```

```Go
func (d *decoder) decodeBit() (bool, error)
```

#### <a id="decoder.decodeBits" href="#decoder.decodeBits">func (d *decoder) decodeBits(n int32) (uint32, error)</a>

```
searchKey: jpeg.decoder.decodeBits
tags: [method private]
```

```Go
func (d *decoder) decodeBits(n int32) (uint32, error)
```

#### <a id="decoder.decodeHuffman" href="#decoder.decodeHuffman">func (d *decoder) decodeHuffman(h *huffman) (uint8, error)</a>

```
searchKey: jpeg.decoder.decodeHuffman
tags: [method private]
```

```Go
func (d *decoder) decodeHuffman(h *huffman) (uint8, error)
```

decodeHuffman returns the next Huffman-coded value from the bit-stream, decoded according to h. 

#### <a id="decoder.ensureNBits" href="#decoder.ensureNBits">func (d *decoder) ensureNBits(n int32) error</a>

```
searchKey: jpeg.decoder.ensureNBits
tags: [method private]
```

```Go
func (d *decoder) ensureNBits(n int32) error
```

ensureNBits reads bytes from the byte buffer to ensure that d.bits.n is at least n. For best performance (avoiding function calls inside hot loops), the caller is the one responsible for first checking that d.bits.n < n. 

#### <a id="decoder.fill" href="#decoder.fill">func (d *decoder) fill() error</a>

```
searchKey: jpeg.decoder.fill
tags: [function private]
```

```Go
func (d *decoder) fill() error
```

fill fills up the d.bytes.buf buffer from the underlying io.Reader. It should only be called when there are no unread bytes in d.bytes. 

#### <a id="decoder.ignore" href="#decoder.ignore">func (d *decoder) ignore(n int) error</a>

```
searchKey: jpeg.decoder.ignore
tags: [method private]
```

```Go
func (d *decoder) ignore(n int) error
```

ignore ignores the next n bytes. 

#### <a id="decoder.isRGB" href="#decoder.isRGB">func (d *decoder) isRGB() bool</a>

```
searchKey: jpeg.decoder.isRGB
tags: [function private]
```

```Go
func (d *decoder) isRGB() bool
```

#### <a id="decoder.makeImg" href="#decoder.makeImg">func (d *decoder) makeImg(mxx, myy int)</a>

```
searchKey: jpeg.decoder.makeImg
tags: [method private]
```

```Go
func (d *decoder) makeImg(mxx, myy int)
```

makeImg allocates and initializes the destination image. 

#### <a id="decoder.processApp0Marker" href="#decoder.processApp0Marker">func (d *decoder) processApp0Marker(n int) error</a>

```
searchKey: jpeg.decoder.processApp0Marker
tags: [method private]
```

```Go
func (d *decoder) processApp0Marker(n int) error
```

#### <a id="decoder.processApp14Marker" href="#decoder.processApp14Marker">func (d *decoder) processApp14Marker(n int) error</a>

```
searchKey: jpeg.decoder.processApp14Marker
tags: [method private]
```

```Go
func (d *decoder) processApp14Marker(n int) error
```

#### <a id="decoder.processDHT" href="#decoder.processDHT">func (d *decoder) processDHT(n int) error</a>

```
searchKey: jpeg.decoder.processDHT
tags: [method private]
```

```Go
func (d *decoder) processDHT(n int) error
```

processDHT processes a Define Huffman Table marker, and initializes a huffman struct from its contents. Specified in section B.2.4.2. 

#### <a id="decoder.processDQT" href="#decoder.processDQT">func (d *decoder) processDQT(n int) error</a>

```
searchKey: jpeg.decoder.processDQT
tags: [method private]
```

```Go
func (d *decoder) processDQT(n int) error
```

Specified in section B.2.4.1. 

#### <a id="decoder.processDRI" href="#decoder.processDRI">func (d *decoder) processDRI(n int) error</a>

```
searchKey: jpeg.decoder.processDRI
tags: [method private]
```

```Go
func (d *decoder) processDRI(n int) error
```

Specified in section B.2.4.4. 

#### <a id="decoder.processSOF" href="#decoder.processSOF">func (d *decoder) processSOF(n int) error</a>

```
searchKey: jpeg.decoder.processSOF
tags: [method private]
```

```Go
func (d *decoder) processSOF(n int) error
```

Specified in section B.2.2. 

#### <a id="decoder.processSOS" href="#decoder.processSOS">func (d *decoder) processSOS(n int) error</a>

```
searchKey: jpeg.decoder.processSOS
tags: [method private]
```

```Go
func (d *decoder) processSOS(n int) error
```

Specified in section B.2.3. 

#### <a id="decoder.readByte" href="#decoder.readByte">func (d *decoder) readByte() (x byte, err error)</a>

```
searchKey: jpeg.decoder.readByte
tags: [function private]
```

```Go
func (d *decoder) readByte() (x byte, err error)
```

readByte returns the next byte, whether buffered or not buffered. It does not care about byte stuffing. 

#### <a id="decoder.readByteStuffedByte" href="#decoder.readByteStuffedByte">func (d *decoder) readByteStuffedByte() (x byte, err error)</a>

```
searchKey: jpeg.decoder.readByteStuffedByte
tags: [function private]
```

```Go
func (d *decoder) readByteStuffedByte() (x byte, err error)
```

readByteStuffedByte is like readByte but is for byte-stuffed Huffman data. 

#### <a id="decoder.readFull" href="#decoder.readFull">func (d *decoder) readFull(p []byte) error</a>

```
searchKey: jpeg.decoder.readFull
tags: [method private]
```

```Go
func (d *decoder) readFull(p []byte) error
```

readFull reads exactly len(p) bytes into p. It does not care about byte stuffing. 

#### <a id="decoder.receiveExtend" href="#decoder.receiveExtend">func (d *decoder) receiveExtend(t uint8) (int32, error)</a>

```
searchKey: jpeg.decoder.receiveExtend
tags: [method private]
```

```Go
func (d *decoder) receiveExtend(t uint8) (int32, error)
```

receiveExtend is the composition of RECEIVE and EXTEND, specified in section F.2.2.1. 

#### <a id="decoder.reconstructBlock" href="#decoder.reconstructBlock">func (d *decoder) reconstructBlock(b *block, bx, by, compIndex int) error</a>

```
searchKey: jpeg.decoder.reconstructBlock
tags: [method private]
```

```Go
func (d *decoder) reconstructBlock(b *block, bx, by, compIndex int) error
```

reconstructBlock dequantizes, performs the inverse DCT and stores the block to the image. 

#### <a id="decoder.reconstructProgressiveImage" href="#decoder.reconstructProgressiveImage">func (d *decoder) reconstructProgressiveImage() error</a>

```
searchKey: jpeg.decoder.reconstructProgressiveImage
tags: [function private]
```

```Go
func (d *decoder) reconstructProgressiveImage() error
```

#### <a id="decoder.refine" href="#decoder.refine">func (d *decoder) refine(b *block, h *huffman, zigStart, zigEnd, delta int32) error</a>

```
searchKey: jpeg.decoder.refine
tags: [method private]
```

```Go
func (d *decoder) refine(b *block, h *huffman, zigStart, zigEnd, delta int32) error
```

refine decodes a successive approximation refinement block, as specified in section G.1.2. 

#### <a id="decoder.refineNonZeroes" href="#decoder.refineNonZeroes">func (d *decoder) refineNonZeroes(b *block, zig, zigEnd, nz, delta int32) (int32, error)</a>

```
searchKey: jpeg.decoder.refineNonZeroes
tags: [method private]
```

```Go
func (d *decoder) refineNonZeroes(b *block, zig, zigEnd, nz, delta int32) (int32, error)
```

refineNonZeroes refines non-zero entries of b in zig-zag order. If nz >= 0, the first nz zero entries are skipped over. 

#### <a id="decoder.unreadByteStuffedByte" href="#decoder.unreadByteStuffedByte">func (d *decoder) unreadByteStuffedByte()</a>

```
searchKey: jpeg.decoder.unreadByteStuffedByte
tags: [function private]
```

```Go
func (d *decoder) unreadByteStuffedByte()
```

unreadByteStuffedByte undoes the most recent readByteStuffedByte call, giving a byte of data back from d.bits to d.bytes. The Huffman look-up table requires at least 8 bits for look-up, which means that Huffman decoding can sometimes overshoot and read one or two too many bytes. Two-byte overshoot can happen when expecting to read a 0xff 0x00 byte-stuffed byte. 

### <a id="encoder" href="#encoder">type encoder struct</a>

```
searchKey: jpeg.encoder
tags: [struct private]
```

```Go
type encoder struct {
	// w is the writer to write to. err is the first error encountered during
	// writing. All attempted writes after the first error become no-ops.
	w   writer
	err error
	// buf is a scratch buffer.
	buf [16]byte
	// bits and nBits are accumulated bits to write to w.
	bits, nBits uint32
	// quant is the scaled quantization tables, in zig-zag order.
	quant [nQuantIndex][blockSize]byte
}
```

encoder encodes an image to the JPEG format. 

#### <a id="encoder.emit" href="#encoder.emit">func (e *encoder) emit(bits, nBits uint32)</a>

```
searchKey: jpeg.encoder.emit
tags: [method private]
```

```Go
func (e *encoder) emit(bits, nBits uint32)
```

emit emits the least significant nBits bits of bits to the bit-stream. The precondition is bits < 1<<nBits && nBits <= 16. 

#### <a id="encoder.emitHuff" href="#encoder.emitHuff">func (e *encoder) emitHuff(h huffIndex, value int32)</a>

```
searchKey: jpeg.encoder.emitHuff
tags: [method private]
```

```Go
func (e *encoder) emitHuff(h huffIndex, value int32)
```

emitHuff emits the given value with the given Huffman encoder. 

#### <a id="encoder.emitHuffRLE" href="#encoder.emitHuffRLE">func (e *encoder) emitHuffRLE(h huffIndex, runLength, value int32)</a>

```
searchKey: jpeg.encoder.emitHuffRLE
tags: [method private]
```

```Go
func (e *encoder) emitHuffRLE(h huffIndex, runLength, value int32)
```

emitHuffRLE emits a run of runLength copies of value encoded with the given Huffman encoder. 

#### <a id="encoder.flush" href="#encoder.flush">func (e *encoder) flush()</a>

```
searchKey: jpeg.encoder.flush
tags: [function private]
```

```Go
func (e *encoder) flush()
```

#### <a id="encoder.write" href="#encoder.write">func (e *encoder) write(p []byte)</a>

```
searchKey: jpeg.encoder.write
tags: [method private]
```

```Go
func (e *encoder) write(p []byte)
```

#### <a id="encoder.writeBlock" href="#encoder.writeBlock">func (e *encoder) writeBlock(b *block, q quantIndex, prevDC int32) int32</a>

```
searchKey: jpeg.encoder.writeBlock
tags: [method private]
```

```Go
func (e *encoder) writeBlock(b *block, q quantIndex, prevDC int32) int32
```

writeBlock writes a block of pixel data using the given quantization table, returning the post-quantized DC value of the DCT-transformed block. b is in natural (not zig-zag) order. 

#### <a id="encoder.writeByte" href="#encoder.writeByte">func (e *encoder) writeByte(b byte)</a>

```
searchKey: jpeg.encoder.writeByte
tags: [method private]
```

```Go
func (e *encoder) writeByte(b byte)
```

#### <a id="encoder.writeDHT" href="#encoder.writeDHT">func (e *encoder) writeDHT(nComponent int)</a>

```
searchKey: jpeg.encoder.writeDHT
tags: [method private]
```

```Go
func (e *encoder) writeDHT(nComponent int)
```

writeDHT writes the Define Huffman Table marker. 

#### <a id="encoder.writeDQT" href="#encoder.writeDQT">func (e *encoder) writeDQT()</a>

```
searchKey: jpeg.encoder.writeDQT
tags: [function private]
```

```Go
func (e *encoder) writeDQT()
```

writeDQT writes the Define Quantization Table marker. 

#### <a id="encoder.writeMarkerHeader" href="#encoder.writeMarkerHeader">func (e *encoder) writeMarkerHeader(marker uint8, markerlen int)</a>

```
searchKey: jpeg.encoder.writeMarkerHeader
tags: [method private]
```

```Go
func (e *encoder) writeMarkerHeader(marker uint8, markerlen int)
```

writeMarkerHeader writes the header for a marker with the given length. 

#### <a id="encoder.writeSOF0" href="#encoder.writeSOF0">func (e *encoder) writeSOF0(size image.Point, nComponent int)</a>

```
searchKey: jpeg.encoder.writeSOF0
tags: [method private]
```

```Go
func (e *encoder) writeSOF0(size image.Point, nComponent int)
```

writeSOF0 writes the Start Of Frame (Baseline Sequential) marker. 

#### <a id="encoder.writeSOS" href="#encoder.writeSOS">func (e *encoder) writeSOS(m image.Image)</a>

```
searchKey: jpeg.encoder.writeSOS
tags: [method private]
```

```Go
func (e *encoder) writeSOS(m image.Image)
```

writeSOS writes the StartOfScan marker. 

### <a id="eofReader" href="#eofReader">type eofReader struct</a>

```
searchKey: jpeg.eofReader
tags: [struct private]
```

```Go
type eofReader struct {
	data     []byte // deliver from Read without EOF
	dataEOF  []byte // then deliver from Read with EOF on last chunk
	lenAtEOF int
}
```

#### <a id="eofReader.Read" href="#eofReader.Read">func (r *eofReader) Read(b []byte) (n int, err error)</a>

```
searchKey: jpeg.eofReader.Read
tags: [method private]
```

```Go
func (r *eofReader) Read(b []byte) (n int, err error)
```

### <a id="huffIndex" href="#huffIndex">type huffIndex int</a>

```
searchKey: jpeg.huffIndex
tags: [number private]
```

```Go
type huffIndex int
```

### <a id="huffman" href="#huffman">type huffman struct</a>

```
searchKey: jpeg.huffman
tags: [struct private]
```

```Go
type huffman struct {
	// length is the number of codes in the tree.
	nCodes int32
	// lut is the look-up table for the next lutSize bits in the bit-stream.
	// The high 8 bits of the uint16 are the encoded value. The low 8 bits
	// are 1 plus the code length, or 0 if the value is too large to fit in
	// lutSize bits.
	lut [1 << lutSize]uint16
	// vals are the decoded values, sorted by their encoding.
	vals [maxNCodes]uint8
	// minCodes[i] is the minimum code of length i, or -1 if there are no
	// codes of that length.
	minCodes [maxCodeLength]int32
	// maxCodes[i] is the maximum code of length i, or -1 if there are no
	// codes of that length.
	maxCodes [maxCodeLength]int32
	// valsIndices[i] is the index into vals of minCodes[i].
	valsIndices [maxCodeLength]int32
}
```

huffman is a Huffman decoder, specified in section C. 

### <a id="huffmanLUT" href="#huffmanLUT">type huffmanLUT []uint32</a>

```
searchKey: jpeg.huffmanLUT
tags: [array number private]
```

```Go
type huffmanLUT []uint32
```

huffmanLUT is a compiled look-up table representation of a huffmanSpec. Each value maps to a uint32 of which the 8 most significant bits hold the codeword size in bits and the 24 least significant bits hold the codeword. The maximum codeword size is 16 bits. 

#### <a id="huffmanLUT.init.writer.go" href="#huffmanLUT.init.writer.go">func (h *huffmanLUT) init(s huffmanSpec)</a>

```
searchKey: jpeg.huffmanLUT.init
tags: [method private]
```

```Go
func (h *huffmanLUT) init(s huffmanSpec)
```

### <a id="huffmanSpec" href="#huffmanSpec">type huffmanSpec struct</a>

```
searchKey: jpeg.huffmanSpec
tags: [struct private]
```

```Go
type huffmanSpec struct {
	// count[i] is the number of codes of length i bits.
	count [16]byte
	// value[i] is the decoded value of the i'th codeword.
	value []byte
}
```

huffmanSpec specifies a Huffman encoding. 

### <a id="quantIndex" href="#quantIndex">type quantIndex int</a>

```
searchKey: jpeg.quantIndex
tags: [number private]
```

```Go
type quantIndex int
```

### <a id="writer" href="#writer">type writer interface</a>

```
searchKey: jpeg.writer
tags: [interface private]
```

```Go
type writer interface {
	Flush() error
	io.Writer
	io.ByteWriter
}
```

writer is a buffered writer. 

## <a id="func" href="#func">Functions</a>

```
tags: [package]
```

### <a id="BenchmarkDecodeBaseline" href="#BenchmarkDecodeBaseline">func BenchmarkDecodeBaseline(b *testing.B)</a>

```
searchKey: jpeg.BenchmarkDecodeBaseline
tags: [method private benchmark]
```

```Go
func BenchmarkDecodeBaseline(b *testing.B)
```

### <a id="BenchmarkDecodeProgressive" href="#BenchmarkDecodeProgressive">func BenchmarkDecodeProgressive(b *testing.B)</a>

```
searchKey: jpeg.BenchmarkDecodeProgressive
tags: [method private benchmark]
```

```Go
func BenchmarkDecodeProgressive(b *testing.B)
```

### <a id="BenchmarkEncodeRGBA" href="#BenchmarkEncodeRGBA">func BenchmarkEncodeRGBA(b *testing.B)</a>

```
searchKey: jpeg.BenchmarkEncodeRGBA
tags: [method private benchmark]
```

```Go
func BenchmarkEncodeRGBA(b *testing.B)
```

### <a id="BenchmarkEncodeYCbCr" href="#BenchmarkEncodeYCbCr">func BenchmarkEncodeYCbCr(b *testing.B)</a>

```
searchKey: jpeg.BenchmarkEncodeYCbCr
tags: [method private benchmark]
```

```Go
func BenchmarkEncodeYCbCr(b *testing.B)
```

### <a id="BenchmarkFDCT" href="#BenchmarkFDCT">func BenchmarkFDCT(b *testing.B)</a>

```
searchKey: jpeg.BenchmarkFDCT
tags: [method private benchmark]
```

```Go
func BenchmarkFDCT(b *testing.B)
```

### <a id="BenchmarkIDCT" href="#BenchmarkIDCT">func BenchmarkIDCT(b *testing.B)</a>

```
searchKey: jpeg.BenchmarkIDCT
tags: [method private benchmark]
```

```Go
func BenchmarkIDCT(b *testing.B)
```

### <a id="Decode" href="#Decode">func Decode(r io.Reader) (image.Image, error)</a>

```
searchKey: jpeg.Decode
tags: [method]
```

```Go
func Decode(r io.Reader) (image.Image, error)
```

Decode reads a JPEG image from r and returns it as an image.Image. 

### <a id="DecodeConfig" href="#DecodeConfig">func DecodeConfig(r io.Reader) (image.Config, error)</a>

```
searchKey: jpeg.DecodeConfig
tags: [method]
```

```Go
func DecodeConfig(r io.Reader) (image.Config, error)
```

DecodeConfig returns the color model and dimensions of a JPEG image without decoding the entire image. 

### <a id="Encode" href="#Encode">func Encode(w io.Writer, m image.Image, o *Options) error</a>

```
searchKey: jpeg.Encode
tags: [method]
```

```Go
func Encode(w io.Writer, m image.Image, o *Options) error
```

Encode writes the Image m to w in JPEG 4:2:0 baseline format with the given options. Default parameters are used if a nil *Options is passed. 

### <a id="TestDCT" href="#TestDCT">func TestDCT(t *testing.T)</a>

```
searchKey: jpeg.TestDCT
tags: [method private test]
```

```Go
func TestDCT(t *testing.T)
```

### <a id="TestDecodeEOF" href="#TestDecodeEOF">func TestDecodeEOF(t *testing.T)</a>

```
searchKey: jpeg.TestDecodeEOF
tags: [method private test]
```

```Go
func TestDecodeEOF(t *testing.T)
```

### <a id="TestDecodeProgressive" href="#TestDecodeProgressive">func TestDecodeProgressive(t *testing.T)</a>

```
searchKey: jpeg.TestDecodeProgressive
tags: [method private test]
```

```Go
func TestDecodeProgressive(t *testing.T)
```

TestDecodeProgressive tests that decoding the baseline and progressive versions of the same image result in exactly the same pixel data, in YCbCr space for color images, and Y space for grayscale images. 

### <a id="TestEncodeYCbCr" href="#TestEncodeYCbCr">func TestEncodeYCbCr(t *testing.T)</a>

```
searchKey: jpeg.TestEncodeYCbCr
tags: [method private test]
```

```Go
func TestEncodeYCbCr(t *testing.T)
```

### <a id="TestExtraneousData" href="#TestExtraneousData">func TestExtraneousData(t *testing.T)</a>

```
searchKey: jpeg.TestExtraneousData
tags: [method private test]
```

```Go
func TestExtraneousData(t *testing.T)
```

### <a id="TestLargeImageWithShortData" href="#TestLargeImageWithShortData">func TestLargeImageWithShortData(t *testing.T)</a>

```
searchKey: jpeg.TestLargeImageWithShortData
tags: [method private test]
```

```Go
func TestLargeImageWithShortData(t *testing.T)
```

### <a id="TestPaddedRSTMarker" href="#TestPaddedRSTMarker">func TestPaddedRSTMarker(t *testing.T)</a>

```
searchKey: jpeg.TestPaddedRSTMarker
tags: [method private test]
```

```Go
func TestPaddedRSTMarker(t *testing.T)
```

### <a id="TestTruncatedSOSDataDoesntPanic" href="#TestTruncatedSOSDataDoesntPanic">func TestTruncatedSOSDataDoesntPanic(t *testing.T)</a>

```
searchKey: jpeg.TestTruncatedSOSDataDoesntPanic
tags: [method private test]
```

```Go
func TestTruncatedSOSDataDoesntPanic(t *testing.T)
```

### <a id="TestUnscaledQuant" href="#TestUnscaledQuant">func TestUnscaledQuant(t *testing.T)</a>

```
searchKey: jpeg.TestUnscaledQuant
tags: [method private test]
```

```Go
func TestUnscaledQuant(t *testing.T)
```

### <a id="TestWriteGrayscale" href="#TestWriteGrayscale">func TestWriteGrayscale(t *testing.T)</a>

```
searchKey: jpeg.TestWriteGrayscale
tags: [method private test]
```

```Go
func TestWriteGrayscale(t *testing.T)
```

TestWriteGrayscale tests that a grayscale images survives a round-trip through encode/decode cycle. 

### <a id="TestWriter" href="#TestWriter">func TestWriter(t *testing.T)</a>

```
searchKey: jpeg.TestWriter
tags: [method private test]
```

```Go
func TestWriter(t *testing.T)
```

### <a id="TestZigUnzig" href="#TestZigUnzig">func TestZigUnzig(t *testing.T)</a>

```
searchKey: jpeg.TestZigUnzig
tags: [method private test]
```

```Go
func TestZigUnzig(t *testing.T)
```

### <a id="alpha" href="#alpha">func alpha(i int) float64</a>

```
searchKey: jpeg.alpha
tags: [method private]
```

```Go
func alpha(i int) float64
```

alpha returns 1 if i is 0 and returns √2 otherwise. 

### <a id="averageDelta" href="#averageDelta">func averageDelta(m0, m1 image.Image) int64</a>

```
searchKey: jpeg.averageDelta
tags: [method private]
```

```Go
func averageDelta(m0, m1 image.Image) int64
```

averageDelta returns the average delta in RGB space. The two images must have the same bounds. 

### <a id="benchmarkDCT" href="#benchmarkDCT">func benchmarkDCT(b *testing.B, f func(*block))</a>

```
searchKey: jpeg.benchmarkDCT
tags: [method private]
```

```Go
func benchmarkDCT(b *testing.B, f func(*block))
```

### <a id="benchmarkDecode" href="#benchmarkDecode">func benchmarkDecode(b *testing.B, filename string)</a>

```
searchKey: jpeg.benchmarkDecode
tags: [method private]
```

```Go
func benchmarkDecode(b *testing.B, filename string)
```

### <a id="check" href="#check">func check(bounds image.Rectangle, pix0, pix1 []byte, stride0, stride1 int) error</a>

```
searchKey: jpeg.check
tags: [method private]
```

```Go
func check(bounds image.Rectangle, pix0, pix1 []byte, stride0, stride1 int) error
```

check checks that the two pix data are equal, within the given bounds. 

### <a id="decodeFile" href="#decodeFile">func decodeFile(filename string) (image.Image, error)</a>

```
searchKey: jpeg.decodeFile
tags: [method private]
```

```Go
func decodeFile(filename string) (image.Image, error)
```

### <a id="delta" href="#delta">func delta(u0, u1 uint32) int64</a>

```
searchKey: jpeg.delta
tags: [method private]
```

```Go
func delta(u0, u1 uint32) int64
```

### <a id="differ" href="#differ">func differ(b0, b1 *block) bool</a>

```
searchKey: jpeg.differ
tags: [method private]
```

```Go
func differ(b0, b1 *block) bool
```

differ reports whether any pair-wise elements in b0 and b1 differ by 2 or more. That tolerance is because there isn't a single definitive decoding of a given JPEG image, even before the YCbCr to RGB conversion; implementations can have different IDCT rounding errors. 

### <a id="div" href="#div">func div(a, b int32) int32</a>

```
searchKey: jpeg.div
tags: [method private]
```

```Go
func div(a, b int32) int32
```

div returns a/b rounded to the nearest integer, instead of rounded to zero. 

### <a id="fdct" href="#fdct">func fdct(b *block)</a>

```
searchKey: jpeg.fdct
tags: [method private]
```

```Go
func fdct(b *block)
```

fdct performs a forward DCT on an 8x8 block of coefficients, including a level shift. 

### <a id="grayToY" href="#grayToY">func grayToY(m *image.Gray, p image.Point, yBlock *block)</a>

```
searchKey: jpeg.grayToY
tags: [method private]
```

```Go
func grayToY(m *image.Gray, p image.Point, yBlock *block)
```

grayToY stores the 8x8 region of m whose top-left corner is p in yBlock. 

### <a id="idct" href="#idct">func idct(src *block)</a>

```
searchKey: jpeg.idct
tags: [method private]
```

```Go
func idct(src *block)
```

idct performs a 2-D Inverse Discrete Cosine Transformation. 

The input coefficients should already have been multiplied by the appropriate quantization table. We use fixed-point computation, with the number of bits for the fractional component varying over the intermediate stages. 

For more on the actual algorithm, see Z. Wang, "Fast algorithms for the discrete W transform and for the discrete Fourier transform", IEEE Trans. on ASSP, Vol. ASSP- 32, pp. 803-816, Aug. 1984. 

### <a id="init.dct_test.go" href="#init.dct_test.go">func init()</a>

```
searchKey: jpeg.init
tags: [function private]
```

```Go
func init()
```

### <a id="init.reader.go" href="#init.reader.go">func init()</a>

```
searchKey: jpeg.init
tags: [function private]
```

```Go
func init()
```

### <a id="init.writer.go.0xc038aba908" href="#init.writer.go.0xc038aba908">func init()</a>

```
searchKey: jpeg.init
tags: [function private]
```

```Go
func init()
```

### <a id="min" href="#min">func min(x, y int) int</a>

```
searchKey: jpeg.min
tags: [method private]
```

```Go
func min(x, y int) int
```

min returns the minimum of two integers. 

### <a id="pixString" href="#pixString">func pixString(pix []byte, stride, x, y int) string</a>

```
searchKey: jpeg.pixString
tags: [method private]
```

```Go
func pixString(pix []byte, stride, x, y int) string
```

### <a id="readPng" href="#readPng">func readPng(filename string) (image.Image, error)</a>

```
searchKey: jpeg.readPng
tags: [method private]
```

```Go
func readPng(filename string) (image.Image, error)
```

### <a id="rgbaToYCbCr" href="#rgbaToYCbCr">func rgbaToYCbCr(m *image.RGBA, p image.Point, yBlock, cbBlock, crBlock *block)</a>

```
searchKey: jpeg.rgbaToYCbCr
tags: [method private]
```

```Go
func rgbaToYCbCr(m *image.RGBA, p image.Point, yBlock, cbBlock, crBlock *block)
```

rgbaToYCbCr is a specialized version of toYCbCr for image.RGBA images. 

### <a id="scale" href="#scale">func scale(dst *block, src *[4]block)</a>

```
searchKey: jpeg.scale
tags: [method private]
```

```Go
func scale(dst *block, src *[4]block)
```

scale scales the 16x16 region represented by the 4 src blocks to the 8x8 dst block. 

### <a id="slowFDCT" href="#slowFDCT">func slowFDCT(b *block)</a>

```
searchKey: jpeg.slowFDCT
tags: [method private]
```

```Go
func slowFDCT(b *block)
```

slowFDCT performs the 8*8 2-dimensional forward discrete cosine transform: 

```
dst[u,v] = (1/8) * Σ_x Σ_y alpha(u) * alpha(v) * src[x,y] *
	cos((π/2) * (2*x + 1) * u / 8) *
	cos((π/2) * (2*y + 1) * v / 8)

```
x and y are in pixel space, and u and v are in transform space. 

b acts as both dst and src. 

### <a id="slowIDCT" href="#slowIDCT">func slowIDCT(b *block)</a>

```
searchKey: jpeg.slowIDCT
tags: [method private]
```

```Go
func slowIDCT(b *block)
```

slowIDCT performs the 8*8 2-dimensional inverse discrete cosine transform: 

```
dst[x,y] = (1/8) * Σ_u Σ_v alpha(u) * alpha(v) * src[u,v] *
	cos((π/2) * (2*x + 1) * u / 8) *
	cos((π/2) * (2*y + 1) * v / 8)

```
x and y are in pixel space, and u and v are in transform space. 

b acts as both dst and src. 

### <a id="toYCbCr" href="#toYCbCr">func toYCbCr(m image.Image, p image.Point, yBlock, cbBlock, crBlock *block)</a>

```
searchKey: jpeg.toYCbCr
tags: [method private]
```

```Go
func toYCbCr(m image.Image, p image.Point, yBlock, cbBlock, crBlock *block)
```

toYCbCr converts the 8x8 region of m whose top-left corner is p to its YCbCr values. 

### <a id="yCbCrToYCbCr" href="#yCbCrToYCbCr">func yCbCrToYCbCr(m *image.YCbCr, p image.Point, yBlock, cbBlock, crBlock *block)</a>

```
searchKey: jpeg.yCbCrToYCbCr
tags: [method private]
```

```Go
func yCbCrToYCbCr(m *image.YCbCr, p image.Point, yBlock, cbBlock, crBlock *block)
```

yCbCrToYCbCr is a specialized version of toYCbCr for image.YCbCr images. 

