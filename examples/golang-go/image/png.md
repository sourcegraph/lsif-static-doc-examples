# Package png

Package png implements a PNG image decoder and encoder. 

The PNG specification is at [https://www.w3.org/TR/PNG/](https://www.w3.org/TR/PNG/). 

## Index

* [Constants](#const)
    * [const intSize](#intSize)
    * [const ctGrayscale](#ctGrayscale)
    * [const ctTrueColor](#ctTrueColor)
    * [const ctPaletted](#ctPaletted)
    * [const ctGrayscaleAlpha](#ctGrayscaleAlpha)
    * [const ctTrueColorAlpha](#ctTrueColorAlpha)
    * [const cbInvalid](#cbInvalid)
    * [const cbG1](#cbG1)
    * [const cbG2](#cbG2)
    * [const cbG4](#cbG4)
    * [const cbG8](#cbG8)
    * [const cbGA8](#cbGA8)
    * [const cbTC8](#cbTC8)
    * [const cbP1](#cbP1)
    * [const cbP2](#cbP2)
    * [const cbP4](#cbP4)
    * [const cbP8](#cbP8)
    * [const cbTCA8](#cbTCA8)
    * [const cbG16](#cbG16)
    * [const cbGA16](#cbGA16)
    * [const cbTC16](#cbTC16)
    * [const cbTCA16](#cbTCA16)
    * [const ftNone](#ftNone)
    * [const ftSub](#ftSub)
    * [const ftUp](#ftUp)
    * [const ftAverage](#ftAverage)
    * [const ftPaeth](#ftPaeth)
    * [const nFilter](#nFilter)
    * [const itNone](#itNone)
    * [const itAdam7](#itAdam7)
    * [const dsStart](#dsStart)
    * [const dsSeenIHDR](#dsSeenIHDR)
    * [const dsSeenPLTE](#dsSeenPLTE)
    * [const dsSeentRNS](#dsSeentRNS)
    * [const dsSeenIDAT](#dsSeenIDAT)
    * [const dsSeenIEND](#dsSeenIEND)
    * [const pngHeader](#pngHeader)
    * [const DefaultCompression](#DefaultCompression)
    * [const NoCompression](#NoCompression)
    * [const BestSpeed](#BestSpeed)
    * [const BestCompression](#BestCompression)
* [Variables](#var)
    * [var interlacing](#interlacing)
    * [var chunkOrderError](#chunkOrderError)
    * [var filenames](#filenames)
    * [var filenamesPaletted](#filenamesPaletted)
    * [var filenamesShort](#filenamesShort)
    * [var fakebKGDs](#fakebKGDs)
    * [var fakegAMAs](#fakegAMAs)
    * [var fakeIHDRUsings](#fakeIHDRUsings)
    * [var readerErrors](#readerErrors)
* [Types](#type)
    * [type interlaceScan struct](#interlaceScan)
    * [type decoder struct](#decoder)
        * [func (d *decoder) parseIHDR(length uint32) error](#decoder.parseIHDR)
        * [func (d *decoder) parsePLTE(length uint32) error](#decoder.parsePLTE)
        * [func (d *decoder) parsetRNS(length uint32) error](#decoder.parsetRNS)
        * [func (d *decoder) Read(p []byte) (int, error)](#decoder.Read)
        * [func (d *decoder) decode() (image.Image, error)](#decoder.decode)
        * [func (d *decoder) readImagePass(r io.Reader, pass int, allocateOnly bool) (image.Image, error)](#decoder.readImagePass)
        * [func (d *decoder) mergePassInto(dst image.Image, src image.Image, pass int)](#decoder.mergePassInto)
        * [func (d *decoder) parseIDAT(length uint32) (err error)](#decoder.parseIDAT)
        * [func (d *decoder) parseIEND(length uint32) error](#decoder.parseIEND)
        * [func (d *decoder) parseChunk() error](#decoder.parseChunk)
        * [func (d *decoder) verifyChecksum() error](#decoder.verifyChecksum)
        * [func (d *decoder) checkHeader() error](#decoder.checkHeader)
    * [type FormatError string](#FormatError)
        * [func (e FormatError) Error() string](#FormatError.Error)
    * [type UnsupportedError string](#UnsupportedError)
        * [func (e UnsupportedError) Error() string](#UnsupportedError.Error)
    * [type Encoder struct](#Encoder)
        * [func (enc *Encoder) Encode(w io.Writer, m image.Image) error](#Encoder.Encode)
    * [type EncoderBufferPool interface](#EncoderBufferPool)
    * [type EncoderBuffer png.encoder](#EncoderBuffer)
    * [type encoder struct](#encoder)
        * [func (e *encoder) writeChunk(b []byte, name string)](#encoder.writeChunk)
        * [func (e *encoder) writeIHDR()](#encoder.writeIHDR)
        * [func (e *encoder) writePLTEAndTRNS(p color.Palette)](#encoder.writePLTEAndTRNS)
        * [func (e *encoder) Write(b []byte) (int, error)](#encoder.Write)
        * [func (e *encoder) writeImage(w io.Writer, m image.Image, cb int, level int) error](#encoder.writeImage)
        * [func (e *encoder) writeIDATs()](#encoder.writeIDATs)
        * [func (e *encoder) writeIEND()](#encoder.writeIEND)
    * [type CompressionLevel int](#CompressionLevel)
    * [type opaquer interface](#opaquer)
    * [type pool struct](#pool)
        * [func (p *pool) Get() *EncoderBuffer](#pool.Get)
        * [func (p *pool) Put(b *EncoderBuffer)](#pool.Put)
* [Functions](#func)
    * [func abs(x int) int](#abs)
    * [func paeth(a, b, c uint8) uint8](#paeth)
    * [func filterPaeth(cdat, pdat []byte, bytesPerPixel int)](#filterPaeth)
    * [func cbPaletted(cb int) bool](#cbPaletted)
    * [func min(a, b int) int](#min)
    * [func Decode(r io.Reader) (image.Image, error)](#Decode)
    * [func DecodeConfig(r io.Reader) (image.Config, error)](#DecodeConfig)
    * [func init()](#init.reader.go)
    * [func opaque(m image.Image) bool](#opaque)
    * [func abs8(d uint8) int](#abs8)
    * [func filter(cr *[nFilter][]byte, pr []byte, bpp int) int](#filter)
    * [func zeroMemory(v []uint8)](#zeroMemory)
    * [func levelToZlib(l CompressionLevel) int](#levelToZlib)
    * [func Encode(w io.Writer, m image.Image) error](#Encode)
    * [func slowAbs(x int) int](#slowAbs)
    * [func slowPaeth(a, b, c uint8) uint8](#slowPaeth)
    * [func slowFilterPaeth(cdat, pdat []byte, bytesPerPixel int)](#slowFilterPaeth)
    * [func TestPaeth(t *testing.T)](#TestPaeth)
    * [func BenchmarkPaeth(b *testing.B)](#BenchmarkPaeth)
    * [func TestPaethDecode(t *testing.T)](#TestPaethDecode)
    * [func readPNG(filename string) (image.Image, error)](#readPNG)
    * [func sng(w io.WriteCloser, filename string, png image.Image)](#sng)
    * [func TestReader(t *testing.T)](#TestReader)
    * [func TestReaderError(t *testing.T)](#TestReaderError)
    * [func TestPalettedDecodeConfig(t *testing.T)](#TestPalettedDecodeConfig)
    * [func TestInterlaced(t *testing.T)](#TestInterlaced)
    * [func TestIncompleteIDATOnRowBoundary(t *testing.T)](#TestIncompleteIDATOnRowBoundary)
    * [func TestTrailingIDATChunks(t *testing.T)](#TestTrailingIDATChunks)
    * [func TestMultipletRNSChunks(t *testing.T)](#TestMultipletRNSChunks)
    * [func TestUnknownChunkLengthUnderflow(t *testing.T)](#TestUnknownChunkLengthUnderflow)
    * [func TestPaletted8OutOfRangePixel(t *testing.T)](#TestPaletted8OutOfRangePixel)
    * [func TestGray8Transparent(t *testing.T)](#TestGray8Transparent)
    * [func TestDimensionOverflow(t *testing.T)](#TestDimensionOverflow)
    * [func benchmarkDecode(b *testing.B, filename string, bytesPerPixel int)](#benchmarkDecode)
    * [func BenchmarkDecodeGray(b *testing.B)](#BenchmarkDecodeGray)
    * [func BenchmarkDecodeNRGBAGradient(b *testing.B)](#BenchmarkDecodeNRGBAGradient)
    * [func BenchmarkDecodeNRGBAOpaque(b *testing.B)](#BenchmarkDecodeNRGBAOpaque)
    * [func BenchmarkDecodePaletted(b *testing.B)](#BenchmarkDecodePaletted)
    * [func BenchmarkDecodeRGB(b *testing.B)](#BenchmarkDecodeRGB)
    * [func BenchmarkDecodeInterlacing(b *testing.B)](#BenchmarkDecodeInterlacing)
    * [func diff(m0, m1 image.Image) error](#diff)
    * [func encodeDecode(m image.Image) (image.Image, error)](#encodeDecode)
    * [func TestWriter(t *testing.T)](#TestWriter)
    * [func TestWriterPaletted(t *testing.T)](#TestWriterPaletted)
    * [func TestWriterLevels(t *testing.T)](#TestWriterLevels)
    * [func TestSubImage(t *testing.T)](#TestSubImage)
    * [func BenchmarkEncodeGray(b *testing.B)](#BenchmarkEncodeGray)
    * [func BenchmarkEncodeGrayWithBufferPool(b *testing.B)](#BenchmarkEncodeGrayWithBufferPool)
    * [func BenchmarkEncodeNRGBOpaque(b *testing.B)](#BenchmarkEncodeNRGBOpaque)
    * [func BenchmarkEncodeNRGBA(b *testing.B)](#BenchmarkEncodeNRGBA)
    * [func BenchmarkEncodePaletted(b *testing.B)](#BenchmarkEncodePaletted)
    * [func BenchmarkEncodeRGBOpaque(b *testing.B)](#BenchmarkEncodeRGBOpaque)
    * [func BenchmarkEncodeRGBA(b *testing.B)](#BenchmarkEncodeRGBA)


## <a id="const" href="#const">Constants</a>

### <a id="intSize" href="#intSize">const intSize</a>

```
searchKey: png.intSize
tags: [private]
```

```Go
const intSize = 32 << (^uint(0) >> 63)
```

intSize is either 32 or 64. 

### <a id="ctGrayscale" href="#ctGrayscale">const ctGrayscale</a>

```
searchKey: png.ctGrayscale
tags: [private]
```

```Go
const ctGrayscale = 0
```

Color type, as per the PNG spec. 

### <a id="ctTrueColor" href="#ctTrueColor">const ctTrueColor</a>

```
searchKey: png.ctTrueColor
tags: [private]
```

```Go
const ctTrueColor = 2
```

Color type, as per the PNG spec. 

### <a id="ctPaletted" href="#ctPaletted">const ctPaletted</a>

```
searchKey: png.ctPaletted
tags: [private]
```

```Go
const ctPaletted = 3
```

Color type, as per the PNG spec. 

### <a id="ctGrayscaleAlpha" href="#ctGrayscaleAlpha">const ctGrayscaleAlpha</a>

```
searchKey: png.ctGrayscaleAlpha
tags: [private]
```

```Go
const ctGrayscaleAlpha = 4
```

Color type, as per the PNG spec. 

### <a id="ctTrueColorAlpha" href="#ctTrueColorAlpha">const ctTrueColorAlpha</a>

```
searchKey: png.ctTrueColorAlpha
tags: [private]
```

```Go
const ctTrueColorAlpha = 6
```

Color type, as per the PNG spec. 

### <a id="cbInvalid" href="#cbInvalid">const cbInvalid</a>

```
searchKey: png.cbInvalid
tags: [private]
```

```Go
const cbInvalid = iota
```

A cb is a combination of color type and bit depth. 

### <a id="cbG1" href="#cbG1">const cbG1</a>

```
searchKey: png.cbG1
tags: [private]
```

```Go
const cbG1
```

A cb is a combination of color type and bit depth. 

### <a id="cbG2" href="#cbG2">const cbG2</a>

```
searchKey: png.cbG2
tags: [private]
```

```Go
const cbG2
```

A cb is a combination of color type and bit depth. 

### <a id="cbG4" href="#cbG4">const cbG4</a>

```
searchKey: png.cbG4
tags: [private]
```

```Go
const cbG4
```

A cb is a combination of color type and bit depth. 

### <a id="cbG8" href="#cbG8">const cbG8</a>

```
searchKey: png.cbG8
tags: [private]
```

```Go
const cbG8
```

A cb is a combination of color type and bit depth. 

### <a id="cbGA8" href="#cbGA8">const cbGA8</a>

```
searchKey: png.cbGA8
tags: [private]
```

```Go
const cbGA8
```

A cb is a combination of color type and bit depth. 

### <a id="cbTC8" href="#cbTC8">const cbTC8</a>

```
searchKey: png.cbTC8
tags: [private]
```

```Go
const cbTC8
```

A cb is a combination of color type and bit depth. 

### <a id="cbP1" href="#cbP1">const cbP1</a>

```
searchKey: png.cbP1
tags: [private]
```

```Go
const cbP1
```

A cb is a combination of color type and bit depth. 

### <a id="cbP2" href="#cbP2">const cbP2</a>

```
searchKey: png.cbP2
tags: [private]
```

```Go
const cbP2
```

A cb is a combination of color type and bit depth. 

### <a id="cbP4" href="#cbP4">const cbP4</a>

```
searchKey: png.cbP4
tags: [private]
```

```Go
const cbP4
```

A cb is a combination of color type and bit depth. 

### <a id="cbP8" href="#cbP8">const cbP8</a>

```
searchKey: png.cbP8
tags: [private]
```

```Go
const cbP8
```

A cb is a combination of color type and bit depth. 

### <a id="cbTCA8" href="#cbTCA8">const cbTCA8</a>

```
searchKey: png.cbTCA8
tags: [private]
```

```Go
const cbTCA8
```

A cb is a combination of color type and bit depth. 

### <a id="cbG16" href="#cbG16">const cbG16</a>

```
searchKey: png.cbG16
tags: [private]
```

```Go
const cbG16
```

A cb is a combination of color type and bit depth. 

### <a id="cbGA16" href="#cbGA16">const cbGA16</a>

```
searchKey: png.cbGA16
tags: [private]
```

```Go
const cbGA16
```

A cb is a combination of color type and bit depth. 

### <a id="cbTC16" href="#cbTC16">const cbTC16</a>

```
searchKey: png.cbTC16
tags: [private]
```

```Go
const cbTC16
```

A cb is a combination of color type and bit depth. 

### <a id="cbTCA16" href="#cbTCA16">const cbTCA16</a>

```
searchKey: png.cbTCA16
tags: [private]
```

```Go
const cbTCA16
```

A cb is a combination of color type and bit depth. 

### <a id="ftNone" href="#ftNone">const ftNone</a>

```
searchKey: png.ftNone
tags: [private]
```

```Go
const ftNone = 0
```

Filter type, as per the PNG spec. 

### <a id="ftSub" href="#ftSub">const ftSub</a>

```
searchKey: png.ftSub
tags: [private]
```

```Go
const ftSub = 1
```

Filter type, as per the PNG spec. 

### <a id="ftUp" href="#ftUp">const ftUp</a>

```
searchKey: png.ftUp
tags: [private]
```

```Go
const ftUp = 2
```

Filter type, as per the PNG spec. 

### <a id="ftAverage" href="#ftAverage">const ftAverage</a>

```
searchKey: png.ftAverage
tags: [private]
```

```Go
const ftAverage = 3
```

Filter type, as per the PNG spec. 

### <a id="ftPaeth" href="#ftPaeth">const ftPaeth</a>

```
searchKey: png.ftPaeth
tags: [private]
```

```Go
const ftPaeth = 4
```

Filter type, as per the PNG spec. 

### <a id="nFilter" href="#nFilter">const nFilter</a>

```
searchKey: png.nFilter
tags: [private]
```

```Go
const nFilter = 5
```

Filter type, as per the PNG spec. 

### <a id="itNone" href="#itNone">const itNone</a>

```
searchKey: png.itNone
tags: [private]
```

```Go
const itNone = 0
```

Interlace type. 

### <a id="itAdam7" href="#itAdam7">const itAdam7</a>

```
searchKey: png.itAdam7
tags: [private]
```

```Go
const itAdam7 = 1
```

Interlace type. 

### <a id="dsStart" href="#dsStart">const dsStart</a>

```
searchKey: png.dsStart
tags: [private]
```

```Go
const dsStart = iota
```

Decoding stage. The PNG specification says that the IHDR, PLTE (if present), tRNS (if present), IDAT and IEND chunks must appear in that order. There may be multiple IDAT chunks, and IDAT chunks must be sequential (i.e. they may not have any other chunks between them). [https://www.w3.org/TR/PNG/#5ChunkOrdering](https://www.w3.org/TR/PNG/#5ChunkOrdering) 

### <a id="dsSeenIHDR" href="#dsSeenIHDR">const dsSeenIHDR</a>

```
searchKey: png.dsSeenIHDR
tags: [private]
```

```Go
const dsSeenIHDR
```

Decoding stage. The PNG specification says that the IHDR, PLTE (if present), tRNS (if present), IDAT and IEND chunks must appear in that order. There may be multiple IDAT chunks, and IDAT chunks must be sequential (i.e. they may not have any other chunks between them). [https://www.w3.org/TR/PNG/#5ChunkOrdering](https://www.w3.org/TR/PNG/#5ChunkOrdering) 

### <a id="dsSeenPLTE" href="#dsSeenPLTE">const dsSeenPLTE</a>

```
searchKey: png.dsSeenPLTE
tags: [private]
```

```Go
const dsSeenPLTE
```

Decoding stage. The PNG specification says that the IHDR, PLTE (if present), tRNS (if present), IDAT and IEND chunks must appear in that order. There may be multiple IDAT chunks, and IDAT chunks must be sequential (i.e. they may not have any other chunks between them). [https://www.w3.org/TR/PNG/#5ChunkOrdering](https://www.w3.org/TR/PNG/#5ChunkOrdering) 

### <a id="dsSeentRNS" href="#dsSeentRNS">const dsSeentRNS</a>

```
searchKey: png.dsSeentRNS
tags: [private]
```

```Go
const dsSeentRNS
```

Decoding stage. The PNG specification says that the IHDR, PLTE (if present), tRNS (if present), IDAT and IEND chunks must appear in that order. There may be multiple IDAT chunks, and IDAT chunks must be sequential (i.e. they may not have any other chunks between them). [https://www.w3.org/TR/PNG/#5ChunkOrdering](https://www.w3.org/TR/PNG/#5ChunkOrdering) 

### <a id="dsSeenIDAT" href="#dsSeenIDAT">const dsSeenIDAT</a>

```
searchKey: png.dsSeenIDAT
tags: [private]
```

```Go
const dsSeenIDAT
```

Decoding stage. The PNG specification says that the IHDR, PLTE (if present), tRNS (if present), IDAT and IEND chunks must appear in that order. There may be multiple IDAT chunks, and IDAT chunks must be sequential (i.e. they may not have any other chunks between them). [https://www.w3.org/TR/PNG/#5ChunkOrdering](https://www.w3.org/TR/PNG/#5ChunkOrdering) 

### <a id="dsSeenIEND" href="#dsSeenIEND">const dsSeenIEND</a>

```
searchKey: png.dsSeenIEND
tags: [private]
```

```Go
const dsSeenIEND
```

Decoding stage. The PNG specification says that the IHDR, PLTE (if present), tRNS (if present), IDAT and IEND chunks must appear in that order. There may be multiple IDAT chunks, and IDAT chunks must be sequential (i.e. they may not have any other chunks between them). [https://www.w3.org/TR/PNG/#5ChunkOrdering](https://www.w3.org/TR/PNG/#5ChunkOrdering) 

### <a id="pngHeader" href="#pngHeader">const pngHeader</a>

```
searchKey: png.pngHeader
tags: [private]
```

```Go
const pngHeader = "\x89PNG\r\n\x1a\n"
```

### <a id="DefaultCompression" href="#DefaultCompression">const DefaultCompression</a>

```
searchKey: png.DefaultCompression
```

```Go
const DefaultCompression CompressionLevel = 0
```

### <a id="NoCompression" href="#NoCompression">const NoCompression</a>

```
searchKey: png.NoCompression
```

```Go
const NoCompression CompressionLevel = -1
```

### <a id="BestSpeed" href="#BestSpeed">const BestSpeed</a>

```
searchKey: png.BestSpeed
```

```Go
const BestSpeed CompressionLevel = -2
```

### <a id="BestCompression" href="#BestCompression">const BestCompression</a>

```
searchKey: png.BestCompression
```

```Go
const BestCompression CompressionLevel = -3
```

## <a id="var" href="#var">Variables</a>

### <a id="interlacing" href="#interlacing">var interlacing</a>

```
searchKey: png.interlacing
tags: [private]
```

```Go
var interlacing = ...
```

interlacing defines Adam7 interlacing, with 7 passes of reduced images. See [https://www.w3.org/TR/PNG/#8Interlace](https://www.w3.org/TR/PNG/#8Interlace) 

### <a id="chunkOrderError" href="#chunkOrderError">var chunkOrderError</a>

```
searchKey: png.chunkOrderError
tags: [private]
```

```Go
var chunkOrderError = FormatError("chunk out of order")
```

### <a id="filenames" href="#filenames">var filenames</a>

```
searchKey: png.filenames
tags: [private]
```

```Go
var filenames = ...
```

### <a id="filenamesPaletted" href="#filenamesPaletted">var filenamesPaletted</a>

```
searchKey: png.filenamesPaletted
tags: [private]
```

```Go
var filenamesPaletted = ...
```

### <a id="filenamesShort" href="#filenamesShort">var filenamesShort</a>

```
searchKey: png.filenamesShort
tags: [private]
```

```Go
var filenamesShort = []string{
	"basn0g01",
	"basn0g04-31",
	"basn6a16",
}
```

### <a id="fakebKGDs" href="#fakebKGDs">var fakebKGDs</a>

```
searchKey: png.fakebKGDs
tags: [private]
```

```Go
var fakebKGDs = ...
```

fakebKGDs maps from filenames to fake bKGD chunks for our approximation to the sng command-line tool. Package png doesn't keep that metadata when png.Decode returns an image.Image. 

### <a id="fakegAMAs" href="#fakegAMAs">var fakegAMAs</a>

```
searchKey: png.fakegAMAs
tags: [private]
```

```Go
var fakegAMAs = map[string]string{
	"ftbbn0g01": "",
	"ftbbn0g02": "gAMA {0.45455}\n",
}
```

fakegAMAs maps from filenames to fake gAMA chunks for our approximation to the sng command-line tool. Package png doesn't keep that metadata when png.Decode returns an image.Image. 

### <a id="fakeIHDRUsings" href="#fakeIHDRUsings">var fakeIHDRUsings</a>

```
searchKey: png.fakeIHDRUsings
tags: [private]
```

```Go
var fakeIHDRUsings = ...
```

fakeIHDRUsings maps from filenames to fake IHDR "using" lines for our approximation to the sng command-line tool. The PNG model is that transparency (in the tRNS chunk) is separate to the color/grayscale/palette color model (in the IHDR chunk). The Go model is that the concrete image.Image type returned by png.Decode, such as image.RGBA (with all pixels having 100% alpha) or image.NRGBA, encapsulates whether or not the image has transparency. This map is a hack to work around the fact that the Go model can't otherwise discriminate PNG's "IHDR says color (with no alpha) but tRNS says alpha" and "IHDR says color with alpha". 

### <a id="readerErrors" href="#readerErrors">var readerErrors</a>

```
searchKey: png.readerErrors
tags: [private]
```

```Go
var readerErrors = ...
```

## <a id="type" href="#type">Types</a>

### <a id="interlaceScan" href="#interlaceScan">type interlaceScan struct</a>

```
searchKey: png.interlaceScan
tags: [private]
```

```Go
type interlaceScan struct {
	xFactor, yFactor, xOffset, yOffset int
}
```

interlaceScan defines the placement and size of a pass for Adam7 interlacing. 

### <a id="decoder" href="#decoder">type decoder struct</a>

```
searchKey: png.decoder
tags: [private]
```

```Go
type decoder struct {
	r             io.Reader
	img           image.Image
	crc           hash.Hash32
	width, height int
	depth         int
	palette       color.Palette
	cb            int
	stage         int
	idatLength    uint32
	tmp           [3 * 256]byte
	interlace     int

	// useTransparent and transparent are used for grayscale and truecolor
	// transparency, as opposed to palette transparency.
	useTransparent bool
	transparent    [6]byte
}
```

#### <a id="decoder.parseIHDR" href="#decoder.parseIHDR">func (d *decoder) parseIHDR(length uint32) error</a>

```
searchKey: png.decoder.parseIHDR
tags: [private]
```

```Go
func (d *decoder) parseIHDR(length uint32) error
```

#### <a id="decoder.parsePLTE" href="#decoder.parsePLTE">func (d *decoder) parsePLTE(length uint32) error</a>

```
searchKey: png.decoder.parsePLTE
tags: [private]
```

```Go
func (d *decoder) parsePLTE(length uint32) error
```

#### <a id="decoder.parsetRNS" href="#decoder.parsetRNS">func (d *decoder) parsetRNS(length uint32) error</a>

```
searchKey: png.decoder.parsetRNS
tags: [private]
```

```Go
func (d *decoder) parsetRNS(length uint32) error
```

#### <a id="decoder.Read" href="#decoder.Read">func (d *decoder) Read(p []byte) (int, error)</a>

```
searchKey: png.decoder.Read
tags: [private]
```

```Go
func (d *decoder) Read(p []byte) (int, error)
```

Read presents one or more IDAT chunks as one continuous stream (minus the intermediate chunk headers and footers). If the PNG data looked like: 

```
... len0 IDAT xxx crc0 len1 IDAT yy crc1 len2 IEND crc2

```
then this reader presents xxxyy. For well-formed PNG data, the decoder state immediately before the first Read call is that d.r is positioned between the first IDAT and xxx, and the decoder state immediately after the last Read call is that d.r is positioned between yy and crc1. 

#### <a id="decoder.decode" href="#decoder.decode">func (d *decoder) decode() (image.Image, error)</a>

```
searchKey: png.decoder.decode
tags: [private]
```

```Go
func (d *decoder) decode() (image.Image, error)
```

decode decodes the IDAT data into an image. 

#### <a id="decoder.readImagePass" href="#decoder.readImagePass">func (d *decoder) readImagePass(r io.Reader, pass int, allocateOnly bool) (image.Image, error)</a>

```
searchKey: png.decoder.readImagePass
tags: [private]
```

```Go
func (d *decoder) readImagePass(r io.Reader, pass int, allocateOnly bool) (image.Image, error)
```

readImagePass reads a single image pass, sized according to the pass number. 

#### <a id="decoder.mergePassInto" href="#decoder.mergePassInto">func (d *decoder) mergePassInto(dst image.Image, src image.Image, pass int)</a>

```
searchKey: png.decoder.mergePassInto
tags: [private]
```

```Go
func (d *decoder) mergePassInto(dst image.Image, src image.Image, pass int)
```

mergePassInto merges a single pass into a full sized image. 

#### <a id="decoder.parseIDAT" href="#decoder.parseIDAT">func (d *decoder) parseIDAT(length uint32) (err error)</a>

```
searchKey: png.decoder.parseIDAT
tags: [private]
```

```Go
func (d *decoder) parseIDAT(length uint32) (err error)
```

#### <a id="decoder.parseIEND" href="#decoder.parseIEND">func (d *decoder) parseIEND(length uint32) error</a>

```
searchKey: png.decoder.parseIEND
tags: [private]
```

```Go
func (d *decoder) parseIEND(length uint32) error
```

#### <a id="decoder.parseChunk" href="#decoder.parseChunk">func (d *decoder) parseChunk() error</a>

```
searchKey: png.decoder.parseChunk
tags: [private]
```

```Go
func (d *decoder) parseChunk() error
```

#### <a id="decoder.verifyChecksum" href="#decoder.verifyChecksum">func (d *decoder) verifyChecksum() error</a>

```
searchKey: png.decoder.verifyChecksum
tags: [private]
```

```Go
func (d *decoder) verifyChecksum() error
```

#### <a id="decoder.checkHeader" href="#decoder.checkHeader">func (d *decoder) checkHeader() error</a>

```
searchKey: png.decoder.checkHeader
tags: [private]
```

```Go
func (d *decoder) checkHeader() error
```

### <a id="FormatError" href="#FormatError">type FormatError string</a>

```
searchKey: png.FormatError
```

```Go
type FormatError string
```

A FormatError reports that the input is not a valid PNG. 

#### <a id="FormatError.Error" href="#FormatError.Error">func (e FormatError) Error() string</a>

```
searchKey: png.FormatError.Error
```

```Go
func (e FormatError) Error() string
```

### <a id="UnsupportedError" href="#UnsupportedError">type UnsupportedError string</a>

```
searchKey: png.UnsupportedError
```

```Go
type UnsupportedError string
```

An UnsupportedError reports that the input uses a valid but unimplemented PNG feature. 

#### <a id="UnsupportedError.Error" href="#UnsupportedError.Error">func (e UnsupportedError) Error() string</a>

```
searchKey: png.UnsupportedError.Error
```

```Go
func (e UnsupportedError) Error() string
```

### <a id="Encoder" href="#Encoder">type Encoder struct</a>

```
searchKey: png.Encoder
```

```Go
type Encoder struct {
	CompressionLevel CompressionLevel

	// BufferPool optionally specifies a buffer pool to get temporary
	// EncoderBuffers when encoding an image.
	BufferPool EncoderBufferPool
}
```

Encoder configures encoding PNG images. 

#### <a id="Encoder.Encode" href="#Encoder.Encode">func (enc *Encoder) Encode(w io.Writer, m image.Image) error</a>

```
searchKey: png.Encoder.Encode
```

```Go
func (enc *Encoder) Encode(w io.Writer, m image.Image) error
```

Encode writes the Image m to w in PNG format. 

### <a id="EncoderBufferPool" href="#EncoderBufferPool">type EncoderBufferPool interface</a>

```
searchKey: png.EncoderBufferPool
```

```Go
type EncoderBufferPool interface {
	Get() *EncoderBuffer
	Put(*EncoderBuffer)
}
```

EncoderBufferPool is an interface for getting and returning temporary instances of the EncoderBuffer struct. This can be used to reuse buffers when encoding multiple images. 

### <a id="EncoderBuffer" href="#EncoderBuffer">type EncoderBuffer png.encoder</a>

```
searchKey: png.EncoderBuffer
```

```Go
type EncoderBuffer encoder
```

EncoderBuffer holds the buffers used for encoding PNG images. 

### <a id="encoder" href="#encoder">type encoder struct</a>

```
searchKey: png.encoder
tags: [private]
```

```Go
type encoder struct {
	enc     *Encoder
	w       io.Writer
	m       image.Image
	cb      int
	err     error
	header  [8]byte
	footer  [4]byte
	tmp     [4 * 256]byte
	cr      [nFilter][]uint8
	pr      []uint8
	zw      *zlib.Writer
	zwLevel int
	bw      *bufio.Writer
}
```

#### <a id="encoder.writeChunk" href="#encoder.writeChunk">func (e *encoder) writeChunk(b []byte, name string)</a>

```
searchKey: png.encoder.writeChunk
tags: [private]
```

```Go
func (e *encoder) writeChunk(b []byte, name string)
```

#### <a id="encoder.writeIHDR" href="#encoder.writeIHDR">func (e *encoder) writeIHDR()</a>

```
searchKey: png.encoder.writeIHDR
tags: [private]
```

```Go
func (e *encoder) writeIHDR()
```

#### <a id="encoder.writePLTEAndTRNS" href="#encoder.writePLTEAndTRNS">func (e *encoder) writePLTEAndTRNS(p color.Palette)</a>

```
searchKey: png.encoder.writePLTEAndTRNS
tags: [private]
```

```Go
func (e *encoder) writePLTEAndTRNS(p color.Palette)
```

#### <a id="encoder.Write" href="#encoder.Write">func (e *encoder) Write(b []byte) (int, error)</a>

```
searchKey: png.encoder.Write
tags: [private]
```

```Go
func (e *encoder) Write(b []byte) (int, error)
```

An encoder is an io.Writer that satisfies writes by writing PNG IDAT chunks, including an 8-byte header and 4-byte CRC checksum per Write call. Such calls should be relatively infrequent, since writeIDATs uses a bufio.Writer. 

This method should only be called from writeIDATs (via writeImage). No other code should treat an encoder as an io.Writer. 

#### <a id="encoder.writeImage" href="#encoder.writeImage">func (e *encoder) writeImage(w io.Writer, m image.Image, cb int, level int) error</a>

```
searchKey: png.encoder.writeImage
tags: [private]
```

```Go
func (e *encoder) writeImage(w io.Writer, m image.Image, cb int, level int) error
```

#### <a id="encoder.writeIDATs" href="#encoder.writeIDATs">func (e *encoder) writeIDATs()</a>

```
searchKey: png.encoder.writeIDATs
tags: [private]
```

```Go
func (e *encoder) writeIDATs()
```

Write the actual image data to one or more IDAT chunks. 

#### <a id="encoder.writeIEND" href="#encoder.writeIEND">func (e *encoder) writeIEND()</a>

```
searchKey: png.encoder.writeIEND
tags: [private]
```

```Go
func (e *encoder) writeIEND()
```

### <a id="CompressionLevel" href="#CompressionLevel">type CompressionLevel int</a>

```
searchKey: png.CompressionLevel
```

```Go
type CompressionLevel int
```

CompressionLevel indicates the compression level. 

### <a id="opaquer" href="#opaquer">type opaquer interface</a>

```
searchKey: png.opaquer
tags: [private]
```

```Go
type opaquer interface {
	Opaque() bool
}
```

### <a id="pool" href="#pool">type pool struct</a>

```
searchKey: png.pool
tags: [private]
```

```Go
type pool struct {
	b *EncoderBuffer
}
```

#### <a id="pool.Get" href="#pool.Get">func (p *pool) Get() *EncoderBuffer</a>

```
searchKey: png.pool.Get
tags: [private]
```

```Go
func (p *pool) Get() *EncoderBuffer
```

#### <a id="pool.Put" href="#pool.Put">func (p *pool) Put(b *EncoderBuffer)</a>

```
searchKey: png.pool.Put
tags: [private]
```

```Go
func (p *pool) Put(b *EncoderBuffer)
```

## <a id="func" href="#func">Functions</a>

### <a id="abs" href="#abs">func abs(x int) int</a>

```
searchKey: png.abs
tags: [private]
```

```Go
func abs(x int) int
```

### <a id="paeth" href="#paeth">func paeth(a, b, c uint8) uint8</a>

```
searchKey: png.paeth
tags: [private]
```

```Go
func paeth(a, b, c uint8) uint8
```

paeth implements the Paeth filter function, as per the PNG specification. 

### <a id="filterPaeth" href="#filterPaeth">func filterPaeth(cdat, pdat []byte, bytesPerPixel int)</a>

```
searchKey: png.filterPaeth
tags: [private]
```

```Go
func filterPaeth(cdat, pdat []byte, bytesPerPixel int)
```

filterPaeth applies the Paeth filter to the cdat slice. cdat is the current row's data, pdat is the previous row's data. 

### <a id="cbPaletted" href="#cbPaletted">func cbPaletted(cb int) bool</a>

```
searchKey: png.cbPaletted
tags: [private]
```

```Go
func cbPaletted(cb int) bool
```

### <a id="min" href="#min">func min(a, b int) int</a>

```
searchKey: png.min
tags: [private]
```

```Go
func min(a, b int) int
```

### <a id="Decode" href="#Decode">func Decode(r io.Reader) (image.Image, error)</a>

```
searchKey: png.Decode
```

```Go
func Decode(r io.Reader) (image.Image, error)
```

Decode reads a PNG image from r and returns it as an image.Image. The type of Image returned depends on the PNG contents. 

### <a id="DecodeConfig" href="#DecodeConfig">func DecodeConfig(r io.Reader) (image.Config, error)</a>

```
searchKey: png.DecodeConfig
```

```Go
func DecodeConfig(r io.Reader) (image.Config, error)
```

DecodeConfig returns the color model and dimensions of a PNG image without decoding the entire image. 

### <a id="init.reader.go" href="#init.reader.go">func init()</a>

```
searchKey: png.init
tags: [private]
```

```Go
func init()
```

### <a id="opaque" href="#opaque">func opaque(m image.Image) bool</a>

```
searchKey: png.opaque
tags: [private]
```

```Go
func opaque(m image.Image) bool
```

Returns whether or not the image is fully opaque. 

### <a id="abs8" href="#abs8">func abs8(d uint8) int</a>

```
searchKey: png.abs8
tags: [private]
```

```Go
func abs8(d uint8) int
```

The absolute value of a byte interpreted as a signed int8. 

### <a id="filter" href="#filter">func filter(cr *[nFilter][]byte, pr []byte, bpp int) int</a>

```
searchKey: png.filter
tags: [private]
```

```Go
func filter(cr *[nFilter][]byte, pr []byte, bpp int) int
```

Chooses the filter to use for encoding the current row, and applies it. The return value is the index of the filter and also of the row in cr that has had it applied. 

### <a id="zeroMemory" href="#zeroMemory">func zeroMemory(v []uint8)</a>

```
searchKey: png.zeroMemory
tags: [private]
```

```Go
func zeroMemory(v []uint8)
```

### <a id="levelToZlib" href="#levelToZlib">func levelToZlib(l CompressionLevel) int</a>

```
searchKey: png.levelToZlib
tags: [private]
```

```Go
func levelToZlib(l CompressionLevel) int
```

This function is required because we want the zero value of Encoder.CompressionLevel to map to zlib.DefaultCompression. 

### <a id="Encode" href="#Encode">func Encode(w io.Writer, m image.Image) error</a>

```
searchKey: png.Encode
```

```Go
func Encode(w io.Writer, m image.Image) error
```

Encode writes the Image m to w in PNG format. Any Image may be encoded, but images that are not image.NRGBA might be encoded lossily. 

### <a id="slowAbs" href="#slowAbs">func slowAbs(x int) int</a>

```
searchKey: png.slowAbs
tags: [private]
```

```Go
func slowAbs(x int) int
```

### <a id="slowPaeth" href="#slowPaeth">func slowPaeth(a, b, c uint8) uint8</a>

```
searchKey: png.slowPaeth
tags: [private]
```

```Go
func slowPaeth(a, b, c uint8) uint8
```

slowPaeth is a slow but simple implementation of the Paeth function. It is a straight port of the sample code in the PNG spec, section 9.4. 

### <a id="slowFilterPaeth" href="#slowFilterPaeth">func slowFilterPaeth(cdat, pdat []byte, bytesPerPixel int)</a>

```
searchKey: png.slowFilterPaeth
tags: [private]
```

```Go
func slowFilterPaeth(cdat, pdat []byte, bytesPerPixel int)
```

slowFilterPaeth is a slow but simple implementation of func filterPaeth. 

### <a id="TestPaeth" href="#TestPaeth">func TestPaeth(t *testing.T)</a>

```
searchKey: png.TestPaeth
tags: [private]
```

```Go
func TestPaeth(t *testing.T)
```

### <a id="BenchmarkPaeth" href="#BenchmarkPaeth">func BenchmarkPaeth(b *testing.B)</a>

```
searchKey: png.BenchmarkPaeth
tags: [private]
```

```Go
func BenchmarkPaeth(b *testing.B)
```

### <a id="TestPaethDecode" href="#TestPaethDecode">func TestPaethDecode(t *testing.T)</a>

```
searchKey: png.TestPaethDecode
tags: [private]
```

```Go
func TestPaethDecode(t *testing.T)
```

### <a id="readPNG" href="#readPNG">func readPNG(filename string) (image.Image, error)</a>

```
searchKey: png.readPNG
tags: [private]
```

```Go
func readPNG(filename string) (image.Image, error)
```

### <a id="sng" href="#sng">func sng(w io.WriteCloser, filename string, png image.Image)</a>

```
searchKey: png.sng
tags: [private]
```

```Go
func sng(w io.WriteCloser, filename string, png image.Image)
```

An approximation of the sng command-line tool. 

### <a id="TestReader" href="#TestReader">func TestReader(t *testing.T)</a>

```
searchKey: png.TestReader
tags: [private]
```

```Go
func TestReader(t *testing.T)
```

### <a id="TestReaderError" href="#TestReaderError">func TestReaderError(t *testing.T)</a>

```
searchKey: png.TestReaderError
tags: [private]
```

```Go
func TestReaderError(t *testing.T)
```

### <a id="TestPalettedDecodeConfig" href="#TestPalettedDecodeConfig">func TestPalettedDecodeConfig(t *testing.T)</a>

```
searchKey: png.TestPalettedDecodeConfig
tags: [private]
```

```Go
func TestPalettedDecodeConfig(t *testing.T)
```

### <a id="TestInterlaced" href="#TestInterlaced">func TestInterlaced(t *testing.T)</a>

```
searchKey: png.TestInterlaced
tags: [private]
```

```Go
func TestInterlaced(t *testing.T)
```

### <a id="TestIncompleteIDATOnRowBoundary" href="#TestIncompleteIDATOnRowBoundary">func TestIncompleteIDATOnRowBoundary(t *testing.T)</a>

```
searchKey: png.TestIncompleteIDATOnRowBoundary
tags: [private]
```

```Go
func TestIncompleteIDATOnRowBoundary(t *testing.T)
```

### <a id="TestTrailingIDATChunks" href="#TestTrailingIDATChunks">func TestTrailingIDATChunks(t *testing.T)</a>

```
searchKey: png.TestTrailingIDATChunks
tags: [private]
```

```Go
func TestTrailingIDATChunks(t *testing.T)
```

### <a id="TestMultipletRNSChunks" href="#TestMultipletRNSChunks">func TestMultipletRNSChunks(t *testing.T)</a>

```
searchKey: png.TestMultipletRNSChunks
tags: [private]
```

```Go
func TestMultipletRNSChunks(t *testing.T)
```

### <a id="TestUnknownChunkLengthUnderflow" href="#TestUnknownChunkLengthUnderflow">func TestUnknownChunkLengthUnderflow(t *testing.T)</a>

```
searchKey: png.TestUnknownChunkLengthUnderflow
tags: [private]
```

```Go
func TestUnknownChunkLengthUnderflow(t *testing.T)
```

### <a id="TestPaletted8OutOfRangePixel" href="#TestPaletted8OutOfRangePixel">func TestPaletted8OutOfRangePixel(t *testing.T)</a>

```
searchKey: png.TestPaletted8OutOfRangePixel
tags: [private]
```

```Go
func TestPaletted8OutOfRangePixel(t *testing.T)
```

### <a id="TestGray8Transparent" href="#TestGray8Transparent">func TestGray8Transparent(t *testing.T)</a>

```
searchKey: png.TestGray8Transparent
tags: [private]
```

```Go
func TestGray8Transparent(t *testing.T)
```

### <a id="TestDimensionOverflow" href="#TestDimensionOverflow">func TestDimensionOverflow(t *testing.T)</a>

```
searchKey: png.TestDimensionOverflow
tags: [private]
```

```Go
func TestDimensionOverflow(t *testing.T)
```

### <a id="benchmarkDecode" href="#benchmarkDecode">func benchmarkDecode(b *testing.B, filename string, bytesPerPixel int)</a>

```
searchKey: png.benchmarkDecode
tags: [private]
```

```Go
func benchmarkDecode(b *testing.B, filename string, bytesPerPixel int)
```

### <a id="BenchmarkDecodeGray" href="#BenchmarkDecodeGray">func BenchmarkDecodeGray(b *testing.B)</a>

```
searchKey: png.BenchmarkDecodeGray
tags: [private]
```

```Go
func BenchmarkDecodeGray(b *testing.B)
```

### <a id="BenchmarkDecodeNRGBAGradient" href="#BenchmarkDecodeNRGBAGradient">func BenchmarkDecodeNRGBAGradient(b *testing.B)</a>

```
searchKey: png.BenchmarkDecodeNRGBAGradient
tags: [private]
```

```Go
func BenchmarkDecodeNRGBAGradient(b *testing.B)
```

### <a id="BenchmarkDecodeNRGBAOpaque" href="#BenchmarkDecodeNRGBAOpaque">func BenchmarkDecodeNRGBAOpaque(b *testing.B)</a>

```
searchKey: png.BenchmarkDecodeNRGBAOpaque
tags: [private]
```

```Go
func BenchmarkDecodeNRGBAOpaque(b *testing.B)
```

### <a id="BenchmarkDecodePaletted" href="#BenchmarkDecodePaletted">func BenchmarkDecodePaletted(b *testing.B)</a>

```
searchKey: png.BenchmarkDecodePaletted
tags: [private]
```

```Go
func BenchmarkDecodePaletted(b *testing.B)
```

### <a id="BenchmarkDecodeRGB" href="#BenchmarkDecodeRGB">func BenchmarkDecodeRGB(b *testing.B)</a>

```
searchKey: png.BenchmarkDecodeRGB
tags: [private]
```

```Go
func BenchmarkDecodeRGB(b *testing.B)
```

### <a id="BenchmarkDecodeInterlacing" href="#BenchmarkDecodeInterlacing">func BenchmarkDecodeInterlacing(b *testing.B)</a>

```
searchKey: png.BenchmarkDecodeInterlacing
tags: [private]
```

```Go
func BenchmarkDecodeInterlacing(b *testing.B)
```

### <a id="diff" href="#diff">func diff(m0, m1 image.Image) error</a>

```
searchKey: png.diff
tags: [private]
```

```Go
func diff(m0, m1 image.Image) error
```

### <a id="encodeDecode" href="#encodeDecode">func encodeDecode(m image.Image) (image.Image, error)</a>

```
searchKey: png.encodeDecode
tags: [private]
```

```Go
func encodeDecode(m image.Image) (image.Image, error)
```

### <a id="TestWriter" href="#TestWriter">func TestWriter(t *testing.T)</a>

```
searchKey: png.TestWriter
tags: [private]
```

```Go
func TestWriter(t *testing.T)
```

### <a id="TestWriterPaletted" href="#TestWriterPaletted">func TestWriterPaletted(t *testing.T)</a>

```
searchKey: png.TestWriterPaletted
tags: [private]
```

```Go
func TestWriterPaletted(t *testing.T)
```

### <a id="TestWriterLevels" href="#TestWriterLevels">func TestWriterLevels(t *testing.T)</a>

```
searchKey: png.TestWriterLevels
tags: [private]
```

```Go
func TestWriterLevels(t *testing.T)
```

### <a id="TestSubImage" href="#TestSubImage">func TestSubImage(t *testing.T)</a>

```
searchKey: png.TestSubImage
tags: [private]
```

```Go
func TestSubImage(t *testing.T)
```

### <a id="BenchmarkEncodeGray" href="#BenchmarkEncodeGray">func BenchmarkEncodeGray(b *testing.B)</a>

```
searchKey: png.BenchmarkEncodeGray
tags: [private]
```

```Go
func BenchmarkEncodeGray(b *testing.B)
```

### <a id="BenchmarkEncodeGrayWithBufferPool" href="#BenchmarkEncodeGrayWithBufferPool">func BenchmarkEncodeGrayWithBufferPool(b *testing.B)</a>

```
searchKey: png.BenchmarkEncodeGrayWithBufferPool
tags: [private]
```

```Go
func BenchmarkEncodeGrayWithBufferPool(b *testing.B)
```

### <a id="BenchmarkEncodeNRGBOpaque" href="#BenchmarkEncodeNRGBOpaque">func BenchmarkEncodeNRGBOpaque(b *testing.B)</a>

```
searchKey: png.BenchmarkEncodeNRGBOpaque
tags: [private]
```

```Go
func BenchmarkEncodeNRGBOpaque(b *testing.B)
```

### <a id="BenchmarkEncodeNRGBA" href="#BenchmarkEncodeNRGBA">func BenchmarkEncodeNRGBA(b *testing.B)</a>

```
searchKey: png.BenchmarkEncodeNRGBA
tags: [private]
```

```Go
func BenchmarkEncodeNRGBA(b *testing.B)
```

### <a id="BenchmarkEncodePaletted" href="#BenchmarkEncodePaletted">func BenchmarkEncodePaletted(b *testing.B)</a>

```
searchKey: png.BenchmarkEncodePaletted
tags: [private]
```

```Go
func BenchmarkEncodePaletted(b *testing.B)
```

### <a id="BenchmarkEncodeRGBOpaque" href="#BenchmarkEncodeRGBOpaque">func BenchmarkEncodeRGBOpaque(b *testing.B)</a>

```
searchKey: png.BenchmarkEncodeRGBOpaque
tags: [private]
```

```Go
func BenchmarkEncodeRGBOpaque(b *testing.B)
```

### <a id="BenchmarkEncodeRGBA" href="#BenchmarkEncodeRGBA">func BenchmarkEncodeRGBA(b *testing.B)</a>

```
searchKey: png.BenchmarkEncodeRGBA
tags: [private]
```

```Go
func BenchmarkEncodeRGBA(b *testing.B)
```

