# Package png

Package png implements a PNG image decoder and encoder. 

The PNG specification is at [https://www.w3.org/TR/PNG/](https://www.w3.org/TR/PNG/). 

## Index

* [Constants](#const)
    * [const BestCompression](#BestCompression)
    * [const BestSpeed](#BestSpeed)
    * [const DefaultCompression](#DefaultCompression)
    * [const NoCompression](#NoCompression)
    * [const cbG1](#cbG1)
    * [const cbG16](#cbG16)
    * [const cbG2](#cbG2)
    * [const cbG4](#cbG4)
    * [const cbG8](#cbG8)
    * [const cbGA16](#cbGA16)
    * [const cbGA8](#cbGA8)
    * [const cbInvalid](#cbInvalid)
    * [const cbP1](#cbP1)
    * [const cbP2](#cbP2)
    * [const cbP4](#cbP4)
    * [const cbP8](#cbP8)
    * [const cbTC16](#cbTC16)
    * [const cbTC8](#cbTC8)
    * [const cbTCA16](#cbTCA16)
    * [const cbTCA8](#cbTCA8)
    * [const ctGrayscale](#ctGrayscale)
    * [const ctGrayscaleAlpha](#ctGrayscaleAlpha)
    * [const ctPaletted](#ctPaletted)
    * [const ctTrueColor](#ctTrueColor)
    * [const ctTrueColorAlpha](#ctTrueColorAlpha)
    * [const dsSeenIDAT](#dsSeenIDAT)
    * [const dsSeenIEND](#dsSeenIEND)
    * [const dsSeenIHDR](#dsSeenIHDR)
    * [const dsSeenPLTE](#dsSeenPLTE)
    * [const dsSeentRNS](#dsSeentRNS)
    * [const dsStart](#dsStart)
    * [const ftAverage](#ftAverage)
    * [const ftNone](#ftNone)
    * [const ftPaeth](#ftPaeth)
    * [const ftSub](#ftSub)
    * [const ftUp](#ftUp)
    * [const intSize](#intSize)
    * [const itAdam7](#itAdam7)
    * [const itNone](#itNone)
    * [const nFilter](#nFilter)
    * [const pngHeader](#pngHeader)
* [Variables](#var)
    * [var chunkOrderError](#chunkOrderError)
    * [var fakeIHDRUsings](#fakeIHDRUsings)
    * [var fakebKGDs](#fakebKGDs)
    * [var fakegAMAs](#fakegAMAs)
    * [var filenames](#filenames)
    * [var filenamesPaletted](#filenamesPaletted)
    * [var filenamesShort](#filenamesShort)
    * [var interlacing](#interlacing)
    * [var readerErrors](#readerErrors)
* [Types](#type)
    * [type CompressionLevel int](#CompressionLevel)
    * [type Encoder struct](#Encoder)
        * [func (enc *Encoder) Encode(w io.Writer, m image.Image) error](#Encoder.Encode)
    * [type EncoderBuffer png.encoder](#EncoderBuffer)
    * [type EncoderBufferPool interface](#EncoderBufferPool)
    * [type FormatError string](#FormatError)
        * [func (e FormatError) Error() string](#FormatError.Error)
    * [type UnsupportedError string](#UnsupportedError)
        * [func (e UnsupportedError) Error() string](#UnsupportedError.Error)
    * [type decoder struct](#decoder)
        * [func (d *decoder) Read(p []byte) (int, error)](#decoder.Read)
        * [func (d *decoder) checkHeader() error](#decoder.checkHeader)
        * [func (d *decoder) decode() (image.Image, error)](#decoder.decode)
        * [func (d *decoder) mergePassInto(dst image.Image, src image.Image, pass int)](#decoder.mergePassInto)
        * [func (d *decoder) parseChunk() error](#decoder.parseChunk)
        * [func (d *decoder) parseIDAT(length uint32) (err error)](#decoder.parseIDAT)
        * [func (d *decoder) parseIEND(length uint32) error](#decoder.parseIEND)
        * [func (d *decoder) parseIHDR(length uint32) error](#decoder.parseIHDR)
        * [func (d *decoder) parsePLTE(length uint32) error](#decoder.parsePLTE)
        * [func (d *decoder) parsetRNS(length uint32) error](#decoder.parsetRNS)
        * [func (d *decoder) readImagePass(r io.Reader, pass int, allocateOnly bool) (image.Image, error)](#decoder.readImagePass)
        * [func (d *decoder) verifyChecksum() error](#decoder.verifyChecksum)
    * [type encoder struct](#encoder)
        * [func (e *encoder) Write(b []byte) (int, error)](#encoder.Write)
        * [func (e *encoder) writeChunk(b []byte, name string)](#encoder.writeChunk)
        * [func (e *encoder) writeIDATs()](#encoder.writeIDATs)
        * [func (e *encoder) writeIEND()](#encoder.writeIEND)
        * [func (e *encoder) writeIHDR()](#encoder.writeIHDR)
        * [func (e *encoder) writeImage(w io.Writer, m image.Image, cb int, level int) error](#encoder.writeImage)
        * [func (e *encoder) writePLTEAndTRNS(p color.Palette)](#encoder.writePLTEAndTRNS)
    * [type interlaceScan struct](#interlaceScan)
    * [type opaquer interface](#opaquer)
    * [type pool struct](#pool)
        * [func (p *pool) Get() *EncoderBuffer](#pool.Get)
        * [func (p *pool) Put(b *EncoderBuffer)](#pool.Put)
* [Functions](#func)
    * [func BenchmarkDecodeGray(b *testing.B)](#BenchmarkDecodeGray)
    * [func BenchmarkDecodeInterlacing(b *testing.B)](#BenchmarkDecodeInterlacing)
    * [func BenchmarkDecodeNRGBAGradient(b *testing.B)](#BenchmarkDecodeNRGBAGradient)
    * [func BenchmarkDecodeNRGBAOpaque(b *testing.B)](#BenchmarkDecodeNRGBAOpaque)
    * [func BenchmarkDecodePaletted(b *testing.B)](#BenchmarkDecodePaletted)
    * [func BenchmarkDecodeRGB(b *testing.B)](#BenchmarkDecodeRGB)
    * [func BenchmarkEncodeGray(b *testing.B)](#BenchmarkEncodeGray)
    * [func BenchmarkEncodeGrayWithBufferPool(b *testing.B)](#BenchmarkEncodeGrayWithBufferPool)
    * [func BenchmarkEncodeNRGBA(b *testing.B)](#BenchmarkEncodeNRGBA)
    * [func BenchmarkEncodeNRGBOpaque(b *testing.B)](#BenchmarkEncodeNRGBOpaque)
    * [func BenchmarkEncodePaletted(b *testing.B)](#BenchmarkEncodePaletted)
    * [func BenchmarkEncodeRGBA(b *testing.B)](#BenchmarkEncodeRGBA)
    * [func BenchmarkEncodeRGBOpaque(b *testing.B)](#BenchmarkEncodeRGBOpaque)
    * [func BenchmarkPaeth(b *testing.B)](#BenchmarkPaeth)
    * [func Decode(r io.Reader) (image.Image, error)](#Decode)
    * [func DecodeConfig(r io.Reader) (image.Config, error)](#DecodeConfig)
    * [func Encode(w io.Writer, m image.Image) error](#Encode)
    * [func TestDimensionOverflow(t *testing.T)](#TestDimensionOverflow)
    * [func TestGray8Transparent(t *testing.T)](#TestGray8Transparent)
    * [func TestIncompleteIDATOnRowBoundary(t *testing.T)](#TestIncompleteIDATOnRowBoundary)
    * [func TestInterlaced(t *testing.T)](#TestInterlaced)
    * [func TestMultipletRNSChunks(t *testing.T)](#TestMultipletRNSChunks)
    * [func TestPaeth(t *testing.T)](#TestPaeth)
    * [func TestPaethDecode(t *testing.T)](#TestPaethDecode)
    * [func TestPaletted8OutOfRangePixel(t *testing.T)](#TestPaletted8OutOfRangePixel)
    * [func TestPalettedDecodeConfig(t *testing.T)](#TestPalettedDecodeConfig)
    * [func TestReader(t *testing.T)](#TestReader)
    * [func TestReaderError(t *testing.T)](#TestReaderError)
    * [func TestSubImage(t *testing.T)](#TestSubImage)
    * [func TestTrailingIDATChunks(t *testing.T)](#TestTrailingIDATChunks)
    * [func TestUnknownChunkLengthUnderflow(t *testing.T)](#TestUnknownChunkLengthUnderflow)
    * [func TestWriter(t *testing.T)](#TestWriter)
    * [func TestWriterLevels(t *testing.T)](#TestWriterLevels)
    * [func TestWriterPaletted(t *testing.T)](#TestWriterPaletted)
    * [func abs(x int) int](#abs)
    * [func abs8(d uint8) int](#abs8)
    * [func benchmarkDecode(b *testing.B, filename string, bytesPerPixel int)](#benchmarkDecode)
    * [func cbPaletted(cb int) bool](#cbPaletted)
    * [func diff(m0, m1 image.Image) error](#diff)
    * [func encodeDecode(m image.Image) (image.Image, error)](#encodeDecode)
    * [func filter(cr *[nFilter][]byte, pr []byte, bpp int) int](#filter)
    * [func filterPaeth(cdat, pdat []byte, bytesPerPixel int)](#filterPaeth)
    * [func init()](#init.reader.go)
    * [func levelToZlib(l CompressionLevel) int](#levelToZlib)
    * [func min(a, b int) int](#min)
    * [func opaque(m image.Image) bool](#opaque)
    * [func paeth(a, b, c uint8) uint8](#paeth)
    * [func readPNG(filename string) (image.Image, error)](#readPNG)
    * [func slowAbs(x int) int](#slowAbs)
    * [func slowFilterPaeth(cdat, pdat []byte, bytesPerPixel int)](#slowFilterPaeth)
    * [func slowPaeth(a, b, c uint8) uint8](#slowPaeth)
    * [func sng(w io.WriteCloser, filename string, png image.Image)](#sng)
    * [func zeroMemory(v []uint8)](#zeroMemory)


## <a id="const" href="#const">Constants</a>

### <a id="BestCompression" href="#BestCompression">const BestCompression</a>

```
searchKey: png.BestCompression
tags: [constant number]
```

```Go
const BestCompression CompressionLevel = -3
```

### <a id="BestSpeed" href="#BestSpeed">const BestSpeed</a>

```
searchKey: png.BestSpeed
tags: [constant number]
```

```Go
const BestSpeed CompressionLevel = -2
```

### <a id="DefaultCompression" href="#DefaultCompression">const DefaultCompression</a>

```
searchKey: png.DefaultCompression
tags: [constant number]
```

```Go
const DefaultCompression CompressionLevel = 0
```

### <a id="NoCompression" href="#NoCompression">const NoCompression</a>

```
searchKey: png.NoCompression
tags: [constant number]
```

```Go
const NoCompression CompressionLevel = -1
```

### <a id="cbG1" href="#cbG1">const cbG1</a>

```
searchKey: png.cbG1
tags: [constant number private]
```

```Go
const cbG1
```

A cb is a combination of color type and bit depth. 

### <a id="cbG16" href="#cbG16">const cbG16</a>

```
searchKey: png.cbG16
tags: [constant number private]
```

```Go
const cbG16
```

A cb is a combination of color type and bit depth. 

### <a id="cbG2" href="#cbG2">const cbG2</a>

```
searchKey: png.cbG2
tags: [constant number private]
```

```Go
const cbG2
```

A cb is a combination of color type and bit depth. 

### <a id="cbG4" href="#cbG4">const cbG4</a>

```
searchKey: png.cbG4
tags: [constant number private]
```

```Go
const cbG4
```

A cb is a combination of color type and bit depth. 

### <a id="cbG8" href="#cbG8">const cbG8</a>

```
searchKey: png.cbG8
tags: [constant number private]
```

```Go
const cbG8
```

A cb is a combination of color type and bit depth. 

### <a id="cbGA16" href="#cbGA16">const cbGA16</a>

```
searchKey: png.cbGA16
tags: [constant number private]
```

```Go
const cbGA16
```

A cb is a combination of color type and bit depth. 

### <a id="cbGA8" href="#cbGA8">const cbGA8</a>

```
searchKey: png.cbGA8
tags: [constant number private]
```

```Go
const cbGA8
```

A cb is a combination of color type and bit depth. 

### <a id="cbInvalid" href="#cbInvalid">const cbInvalid</a>

```
searchKey: png.cbInvalid
tags: [constant number private]
```

```Go
const cbInvalid = iota
```

A cb is a combination of color type and bit depth. 

### <a id="cbP1" href="#cbP1">const cbP1</a>

```
searchKey: png.cbP1
tags: [constant number private]
```

```Go
const cbP1
```

A cb is a combination of color type and bit depth. 

### <a id="cbP2" href="#cbP2">const cbP2</a>

```
searchKey: png.cbP2
tags: [constant number private]
```

```Go
const cbP2
```

A cb is a combination of color type and bit depth. 

### <a id="cbP4" href="#cbP4">const cbP4</a>

```
searchKey: png.cbP4
tags: [constant number private]
```

```Go
const cbP4
```

A cb is a combination of color type and bit depth. 

### <a id="cbP8" href="#cbP8">const cbP8</a>

```
searchKey: png.cbP8
tags: [constant number private]
```

```Go
const cbP8
```

A cb is a combination of color type and bit depth. 

### <a id="cbTC16" href="#cbTC16">const cbTC16</a>

```
searchKey: png.cbTC16
tags: [constant number private]
```

```Go
const cbTC16
```

A cb is a combination of color type and bit depth. 

### <a id="cbTC8" href="#cbTC8">const cbTC8</a>

```
searchKey: png.cbTC8
tags: [constant number private]
```

```Go
const cbTC8
```

A cb is a combination of color type and bit depth. 

### <a id="cbTCA16" href="#cbTCA16">const cbTCA16</a>

```
searchKey: png.cbTCA16
tags: [constant number private]
```

```Go
const cbTCA16
```

A cb is a combination of color type and bit depth. 

### <a id="cbTCA8" href="#cbTCA8">const cbTCA8</a>

```
searchKey: png.cbTCA8
tags: [constant number private]
```

```Go
const cbTCA8
```

A cb is a combination of color type and bit depth. 

### <a id="ctGrayscale" href="#ctGrayscale">const ctGrayscale</a>

```
searchKey: png.ctGrayscale
tags: [constant number private]
```

```Go
const ctGrayscale = 0
```

Color type, as per the PNG spec. 

### <a id="ctGrayscaleAlpha" href="#ctGrayscaleAlpha">const ctGrayscaleAlpha</a>

```
searchKey: png.ctGrayscaleAlpha
tags: [constant number private]
```

```Go
const ctGrayscaleAlpha = 4
```

Color type, as per the PNG spec. 

### <a id="ctPaletted" href="#ctPaletted">const ctPaletted</a>

```
searchKey: png.ctPaletted
tags: [constant number private]
```

```Go
const ctPaletted = 3
```

Color type, as per the PNG spec. 

### <a id="ctTrueColor" href="#ctTrueColor">const ctTrueColor</a>

```
searchKey: png.ctTrueColor
tags: [constant number private]
```

```Go
const ctTrueColor = 2
```

Color type, as per the PNG spec. 

### <a id="ctTrueColorAlpha" href="#ctTrueColorAlpha">const ctTrueColorAlpha</a>

```
searchKey: png.ctTrueColorAlpha
tags: [constant number private]
```

```Go
const ctTrueColorAlpha = 6
```

Color type, as per the PNG spec. 

### <a id="dsSeenIDAT" href="#dsSeenIDAT">const dsSeenIDAT</a>

```
searchKey: png.dsSeenIDAT
tags: [constant number private]
```

```Go
const dsSeenIDAT
```

Decoding stage. The PNG specification says that the IHDR, PLTE (if present), tRNS (if present), IDAT and IEND chunks must appear in that order. There may be multiple IDAT chunks, and IDAT chunks must be sequential (i.e. they may not have any other chunks between them). [https://www.w3.org/TR/PNG/#5ChunkOrdering](https://www.w3.org/TR/PNG/#5ChunkOrdering) 

### <a id="dsSeenIEND" href="#dsSeenIEND">const dsSeenIEND</a>

```
searchKey: png.dsSeenIEND
tags: [constant number private]
```

```Go
const dsSeenIEND
```

Decoding stage. The PNG specification says that the IHDR, PLTE (if present), tRNS (if present), IDAT and IEND chunks must appear in that order. There may be multiple IDAT chunks, and IDAT chunks must be sequential (i.e. they may not have any other chunks between them). [https://www.w3.org/TR/PNG/#5ChunkOrdering](https://www.w3.org/TR/PNG/#5ChunkOrdering) 

### <a id="dsSeenIHDR" href="#dsSeenIHDR">const dsSeenIHDR</a>

```
searchKey: png.dsSeenIHDR
tags: [constant number private]
```

```Go
const dsSeenIHDR
```

Decoding stage. The PNG specification says that the IHDR, PLTE (if present), tRNS (if present), IDAT and IEND chunks must appear in that order. There may be multiple IDAT chunks, and IDAT chunks must be sequential (i.e. they may not have any other chunks between them). [https://www.w3.org/TR/PNG/#5ChunkOrdering](https://www.w3.org/TR/PNG/#5ChunkOrdering) 

### <a id="dsSeenPLTE" href="#dsSeenPLTE">const dsSeenPLTE</a>

```
searchKey: png.dsSeenPLTE
tags: [constant number private]
```

```Go
const dsSeenPLTE
```

Decoding stage. The PNG specification says that the IHDR, PLTE (if present), tRNS (if present), IDAT and IEND chunks must appear in that order. There may be multiple IDAT chunks, and IDAT chunks must be sequential (i.e. they may not have any other chunks between them). [https://www.w3.org/TR/PNG/#5ChunkOrdering](https://www.w3.org/TR/PNG/#5ChunkOrdering) 

### <a id="dsSeentRNS" href="#dsSeentRNS">const dsSeentRNS</a>

```
searchKey: png.dsSeentRNS
tags: [constant number private]
```

```Go
const dsSeentRNS
```

Decoding stage. The PNG specification says that the IHDR, PLTE (if present), tRNS (if present), IDAT and IEND chunks must appear in that order. There may be multiple IDAT chunks, and IDAT chunks must be sequential (i.e. they may not have any other chunks between them). [https://www.w3.org/TR/PNG/#5ChunkOrdering](https://www.w3.org/TR/PNG/#5ChunkOrdering) 

### <a id="dsStart" href="#dsStart">const dsStart</a>

```
searchKey: png.dsStart
tags: [constant number private]
```

```Go
const dsStart = iota
```

Decoding stage. The PNG specification says that the IHDR, PLTE (if present), tRNS (if present), IDAT and IEND chunks must appear in that order. There may be multiple IDAT chunks, and IDAT chunks must be sequential (i.e. they may not have any other chunks between them). [https://www.w3.org/TR/PNG/#5ChunkOrdering](https://www.w3.org/TR/PNG/#5ChunkOrdering) 

### <a id="ftAverage" href="#ftAverage">const ftAverage</a>

```
searchKey: png.ftAverage
tags: [constant number private]
```

```Go
const ftAverage = 3
```

Filter type, as per the PNG spec. 

### <a id="ftNone" href="#ftNone">const ftNone</a>

```
searchKey: png.ftNone
tags: [constant number private]
```

```Go
const ftNone = 0
```

Filter type, as per the PNG spec. 

### <a id="ftPaeth" href="#ftPaeth">const ftPaeth</a>

```
searchKey: png.ftPaeth
tags: [constant number private]
```

```Go
const ftPaeth = 4
```

Filter type, as per the PNG spec. 

### <a id="ftSub" href="#ftSub">const ftSub</a>

```
searchKey: png.ftSub
tags: [constant number private]
```

```Go
const ftSub = 1
```

Filter type, as per the PNG spec. 

### <a id="ftUp" href="#ftUp">const ftUp</a>

```
searchKey: png.ftUp
tags: [constant number private]
```

```Go
const ftUp = 2
```

Filter type, as per the PNG spec. 

### <a id="intSize" href="#intSize">const intSize</a>

```
searchKey: png.intSize
tags: [constant number private]
```

```Go
const intSize = 32 << (^uint(0) >> 63)
```

intSize is either 32 or 64. 

### <a id="itAdam7" href="#itAdam7">const itAdam7</a>

```
searchKey: png.itAdam7
tags: [constant number private]
```

```Go
const itAdam7 = 1
```

Interlace type. 

### <a id="itNone" href="#itNone">const itNone</a>

```
searchKey: png.itNone
tags: [constant number private]
```

```Go
const itNone = 0
```

Interlace type. 

### <a id="nFilter" href="#nFilter">const nFilter</a>

```
searchKey: png.nFilter
tags: [constant number private]
```

```Go
const nFilter = 5
```

Filter type, as per the PNG spec. 

### <a id="pngHeader" href="#pngHeader">const pngHeader</a>

```
searchKey: png.pngHeader
tags: [constant string private]
```

```Go
const pngHeader = "\x89PNG\r\n\x1a\n"
```

## <a id="var" href="#var">Variables</a>

### <a id="chunkOrderError" href="#chunkOrderError">var chunkOrderError</a>

```
searchKey: png.chunkOrderError
tags: [variable string private]
```

```Go
var chunkOrderError = FormatError("chunk out of order")
```

### <a id="fakeIHDRUsings" href="#fakeIHDRUsings">var fakeIHDRUsings</a>

```
searchKey: png.fakeIHDRUsings
tags: [variable object private]
```

```Go
var fakeIHDRUsings = ...
```

fakeIHDRUsings maps from filenames to fake IHDR "using" lines for our approximation to the sng command-line tool. The PNG model is that transparency (in the tRNS chunk) is separate to the color/grayscale/palette color model (in the IHDR chunk). The Go model is that the concrete image.Image type returned by png.Decode, such as image.RGBA (with all pixels having 100% alpha) or image.NRGBA, encapsulates whether or not the image has transparency. This map is a hack to work around the fact that the Go model can't otherwise discriminate PNG's "IHDR says color (with no alpha) but tRNS says alpha" and "IHDR says color with alpha". 

### <a id="fakebKGDs" href="#fakebKGDs">var fakebKGDs</a>

```
searchKey: png.fakebKGDs
tags: [variable object private]
```

```Go
var fakebKGDs = ...
```

fakebKGDs maps from filenames to fake bKGD chunks for our approximation to the sng command-line tool. Package png doesn't keep that metadata when png.Decode returns an image.Image. 

### <a id="fakegAMAs" href="#fakegAMAs">var fakegAMAs</a>

```
searchKey: png.fakegAMAs
tags: [variable object private]
```

```Go
var fakegAMAs = map[string]string{
	"ftbbn0g01": "",
	"ftbbn0g02": "gAMA {0.45455}\n",
}
```

fakegAMAs maps from filenames to fake gAMA chunks for our approximation to the sng command-line tool. Package png doesn't keep that metadata when png.Decode returns an image.Image. 

### <a id="filenames" href="#filenames">var filenames</a>

```
searchKey: png.filenames
tags: [variable array string private]
```

```Go
var filenames = ...
```

### <a id="filenamesPaletted" href="#filenamesPaletted">var filenamesPaletted</a>

```
searchKey: png.filenamesPaletted
tags: [variable array string private]
```

```Go
var filenamesPaletted = ...
```

### <a id="filenamesShort" href="#filenamesShort">var filenamesShort</a>

```
searchKey: png.filenamesShort
tags: [variable array string private]
```

```Go
var filenamesShort = []string{
	"basn0g01",
	"basn0g04-31",
	"basn6a16",
}
```

### <a id="interlacing" href="#interlacing">var interlacing</a>

```
searchKey: png.interlacing
tags: [variable array struct private]
```

```Go
var interlacing = ...
```

interlacing defines Adam7 interlacing, with 7 passes of reduced images. See [https://www.w3.org/TR/PNG/#8Interlace](https://www.w3.org/TR/PNG/#8Interlace) 

### <a id="readerErrors" href="#readerErrors">var readerErrors</a>

```
searchKey: png.readerErrors
tags: [variable array struct private]
```

```Go
var readerErrors = ...
```

## <a id="type" href="#type">Types</a>

### <a id="CompressionLevel" href="#CompressionLevel">type CompressionLevel int</a>

```
searchKey: png.CompressionLevel
tags: [number]
```

```Go
type CompressionLevel int
```

CompressionLevel indicates the compression level. 

### <a id="Encoder" href="#Encoder">type Encoder struct</a>

```
searchKey: png.Encoder
tags: [struct]
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
tags: [method]
```

```Go
func (enc *Encoder) Encode(w io.Writer, m image.Image) error
```

Encode writes the Image m to w in PNG format. 

### <a id="EncoderBuffer" href="#EncoderBuffer">type EncoderBuffer png.encoder</a>

```
searchKey: png.EncoderBuffer
tags: [struct]
```

```Go
type EncoderBuffer encoder
```

EncoderBuffer holds the buffers used for encoding PNG images. 

### <a id="EncoderBufferPool" href="#EncoderBufferPool">type EncoderBufferPool interface</a>

```
searchKey: png.EncoderBufferPool
tags: [interface]
```

```Go
type EncoderBufferPool interface {
	Get() *EncoderBuffer
	Put(*EncoderBuffer)
}
```

EncoderBufferPool is an interface for getting and returning temporary instances of the EncoderBuffer struct. This can be used to reuse buffers when encoding multiple images. 

### <a id="FormatError" href="#FormatError">type FormatError string</a>

```
searchKey: png.FormatError
tags: [string]
```

```Go
type FormatError string
```

A FormatError reports that the input is not a valid PNG. 

#### <a id="FormatError.Error" href="#FormatError.Error">func (e FormatError) Error() string</a>

```
searchKey: png.FormatError.Error
tags: [method]
```

```Go
func (e FormatError) Error() string
```

### <a id="UnsupportedError" href="#UnsupportedError">type UnsupportedError string</a>

```
searchKey: png.UnsupportedError
tags: [string]
```

```Go
type UnsupportedError string
```

An UnsupportedError reports that the input uses a valid but unimplemented PNG feature. 

#### <a id="UnsupportedError.Error" href="#UnsupportedError.Error">func (e UnsupportedError) Error() string</a>

```
searchKey: png.UnsupportedError.Error
tags: [method]
```

```Go
func (e UnsupportedError) Error() string
```

### <a id="decoder" href="#decoder">type decoder struct</a>

```
searchKey: png.decoder
tags: [struct private]
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

#### <a id="decoder.Read" href="#decoder.Read">func (d *decoder) Read(p []byte) (int, error)</a>

```
searchKey: png.decoder.Read
tags: [method private]
```

```Go
func (d *decoder) Read(p []byte) (int, error)
```

Read presents one or more IDAT chunks as one continuous stream (minus the intermediate chunk headers and footers). If the PNG data looked like: 

```
... len0 IDAT xxx crc0 len1 IDAT yy crc1 len2 IEND crc2

```
then this reader presents xxxyy. For well-formed PNG data, the decoder state immediately before the first Read call is that d.r is positioned between the first IDAT and xxx, and the decoder state immediately after the last Read call is that d.r is positioned between yy and crc1. 

#### <a id="decoder.checkHeader" href="#decoder.checkHeader">func (d *decoder) checkHeader() error</a>

```
searchKey: png.decoder.checkHeader
tags: [method private]
```

```Go
func (d *decoder) checkHeader() error
```

#### <a id="decoder.decode" href="#decoder.decode">func (d *decoder) decode() (image.Image, error)</a>

```
searchKey: png.decoder.decode
tags: [method private]
```

```Go
func (d *decoder) decode() (image.Image, error)
```

decode decodes the IDAT data into an image. 

#### <a id="decoder.mergePassInto" href="#decoder.mergePassInto">func (d *decoder) mergePassInto(dst image.Image, src image.Image, pass int)</a>

```
searchKey: png.decoder.mergePassInto
tags: [method private]
```

```Go
func (d *decoder) mergePassInto(dst image.Image, src image.Image, pass int)
```

mergePassInto merges a single pass into a full sized image. 

#### <a id="decoder.parseChunk" href="#decoder.parseChunk">func (d *decoder) parseChunk() error</a>

```
searchKey: png.decoder.parseChunk
tags: [method private]
```

```Go
func (d *decoder) parseChunk() error
```

#### <a id="decoder.parseIDAT" href="#decoder.parseIDAT">func (d *decoder) parseIDAT(length uint32) (err error)</a>

```
searchKey: png.decoder.parseIDAT
tags: [method private]
```

```Go
func (d *decoder) parseIDAT(length uint32) (err error)
```

#### <a id="decoder.parseIEND" href="#decoder.parseIEND">func (d *decoder) parseIEND(length uint32) error</a>

```
searchKey: png.decoder.parseIEND
tags: [method private]
```

```Go
func (d *decoder) parseIEND(length uint32) error
```

#### <a id="decoder.parseIHDR" href="#decoder.parseIHDR">func (d *decoder) parseIHDR(length uint32) error</a>

```
searchKey: png.decoder.parseIHDR
tags: [method private]
```

```Go
func (d *decoder) parseIHDR(length uint32) error
```

#### <a id="decoder.parsePLTE" href="#decoder.parsePLTE">func (d *decoder) parsePLTE(length uint32) error</a>

```
searchKey: png.decoder.parsePLTE
tags: [method private]
```

```Go
func (d *decoder) parsePLTE(length uint32) error
```

#### <a id="decoder.parsetRNS" href="#decoder.parsetRNS">func (d *decoder) parsetRNS(length uint32) error</a>

```
searchKey: png.decoder.parsetRNS
tags: [method private]
```

```Go
func (d *decoder) parsetRNS(length uint32) error
```

#### <a id="decoder.readImagePass" href="#decoder.readImagePass">func (d *decoder) readImagePass(r io.Reader, pass int, allocateOnly bool) (image.Image, error)</a>

```
searchKey: png.decoder.readImagePass
tags: [method private]
```

```Go
func (d *decoder) readImagePass(r io.Reader, pass int, allocateOnly bool) (image.Image, error)
```

readImagePass reads a single image pass, sized according to the pass number. 

#### <a id="decoder.verifyChecksum" href="#decoder.verifyChecksum">func (d *decoder) verifyChecksum() error</a>

```
searchKey: png.decoder.verifyChecksum
tags: [method private]
```

```Go
func (d *decoder) verifyChecksum() error
```

### <a id="encoder" href="#encoder">type encoder struct</a>

```
searchKey: png.encoder
tags: [struct private]
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

#### <a id="encoder.Write" href="#encoder.Write">func (e *encoder) Write(b []byte) (int, error)</a>

```
searchKey: png.encoder.Write
tags: [method private]
```

```Go
func (e *encoder) Write(b []byte) (int, error)
```

An encoder is an io.Writer that satisfies writes by writing PNG IDAT chunks, including an 8-byte header and 4-byte CRC checksum per Write call. Such calls should be relatively infrequent, since writeIDATs uses a bufio.Writer. 

This method should only be called from writeIDATs (via writeImage). No other code should treat an encoder as an io.Writer. 

#### <a id="encoder.writeChunk" href="#encoder.writeChunk">func (e *encoder) writeChunk(b []byte, name string)</a>

```
searchKey: png.encoder.writeChunk
tags: [method private]
```

```Go
func (e *encoder) writeChunk(b []byte, name string)
```

#### <a id="encoder.writeIDATs" href="#encoder.writeIDATs">func (e *encoder) writeIDATs()</a>

```
searchKey: png.encoder.writeIDATs
tags: [method private]
```

```Go
func (e *encoder) writeIDATs()
```

Write the actual image data to one or more IDAT chunks. 

#### <a id="encoder.writeIEND" href="#encoder.writeIEND">func (e *encoder) writeIEND()</a>

```
searchKey: png.encoder.writeIEND
tags: [method private]
```

```Go
func (e *encoder) writeIEND()
```

#### <a id="encoder.writeIHDR" href="#encoder.writeIHDR">func (e *encoder) writeIHDR()</a>

```
searchKey: png.encoder.writeIHDR
tags: [method private]
```

```Go
func (e *encoder) writeIHDR()
```

#### <a id="encoder.writeImage" href="#encoder.writeImage">func (e *encoder) writeImage(w io.Writer, m image.Image, cb int, level int) error</a>

```
searchKey: png.encoder.writeImage
tags: [method private]
```

```Go
func (e *encoder) writeImage(w io.Writer, m image.Image, cb int, level int) error
```

#### <a id="encoder.writePLTEAndTRNS" href="#encoder.writePLTEAndTRNS">func (e *encoder) writePLTEAndTRNS(p color.Palette)</a>

```
searchKey: png.encoder.writePLTEAndTRNS
tags: [method private]
```

```Go
func (e *encoder) writePLTEAndTRNS(p color.Palette)
```

### <a id="interlaceScan" href="#interlaceScan">type interlaceScan struct</a>

```
searchKey: png.interlaceScan
tags: [struct private]
```

```Go
type interlaceScan struct {
	xFactor, yFactor, xOffset, yOffset int
}
```

interlaceScan defines the placement and size of a pass for Adam7 interlacing. 

### <a id="opaquer" href="#opaquer">type opaquer interface</a>

```
searchKey: png.opaquer
tags: [interface private]
```

```Go
type opaquer interface {
	Opaque() bool
}
```

### <a id="pool" href="#pool">type pool struct</a>

```
searchKey: png.pool
tags: [struct private]
```

```Go
type pool struct {
	b *EncoderBuffer
}
```

#### <a id="pool.Get" href="#pool.Get">func (p *pool) Get() *EncoderBuffer</a>

```
searchKey: png.pool.Get
tags: [method private]
```

```Go
func (p *pool) Get() *EncoderBuffer
```

#### <a id="pool.Put" href="#pool.Put">func (p *pool) Put(b *EncoderBuffer)</a>

```
searchKey: png.pool.Put
tags: [method private]
```

```Go
func (p *pool) Put(b *EncoderBuffer)
```

## <a id="func" href="#func">Functions</a>

### <a id="BenchmarkDecodeGray" href="#BenchmarkDecodeGray">func BenchmarkDecodeGray(b *testing.B)</a>

```
searchKey: png.BenchmarkDecodeGray
tags: [function private benchmark]
```

```Go
func BenchmarkDecodeGray(b *testing.B)
```

### <a id="BenchmarkDecodeInterlacing" href="#BenchmarkDecodeInterlacing">func BenchmarkDecodeInterlacing(b *testing.B)</a>

```
searchKey: png.BenchmarkDecodeInterlacing
tags: [function private benchmark]
```

```Go
func BenchmarkDecodeInterlacing(b *testing.B)
```

### <a id="BenchmarkDecodeNRGBAGradient" href="#BenchmarkDecodeNRGBAGradient">func BenchmarkDecodeNRGBAGradient(b *testing.B)</a>

```
searchKey: png.BenchmarkDecodeNRGBAGradient
tags: [function private benchmark]
```

```Go
func BenchmarkDecodeNRGBAGradient(b *testing.B)
```

### <a id="BenchmarkDecodeNRGBAOpaque" href="#BenchmarkDecodeNRGBAOpaque">func BenchmarkDecodeNRGBAOpaque(b *testing.B)</a>

```
searchKey: png.BenchmarkDecodeNRGBAOpaque
tags: [function private benchmark]
```

```Go
func BenchmarkDecodeNRGBAOpaque(b *testing.B)
```

### <a id="BenchmarkDecodePaletted" href="#BenchmarkDecodePaletted">func BenchmarkDecodePaletted(b *testing.B)</a>

```
searchKey: png.BenchmarkDecodePaletted
tags: [function private benchmark]
```

```Go
func BenchmarkDecodePaletted(b *testing.B)
```

### <a id="BenchmarkDecodeRGB" href="#BenchmarkDecodeRGB">func BenchmarkDecodeRGB(b *testing.B)</a>

```
searchKey: png.BenchmarkDecodeRGB
tags: [function private benchmark]
```

```Go
func BenchmarkDecodeRGB(b *testing.B)
```

### <a id="BenchmarkEncodeGray" href="#BenchmarkEncodeGray">func BenchmarkEncodeGray(b *testing.B)</a>

```
searchKey: png.BenchmarkEncodeGray
tags: [function private benchmark]
```

```Go
func BenchmarkEncodeGray(b *testing.B)
```

### <a id="BenchmarkEncodeGrayWithBufferPool" href="#BenchmarkEncodeGrayWithBufferPool">func BenchmarkEncodeGrayWithBufferPool(b *testing.B)</a>

```
searchKey: png.BenchmarkEncodeGrayWithBufferPool
tags: [function private benchmark]
```

```Go
func BenchmarkEncodeGrayWithBufferPool(b *testing.B)
```

### <a id="BenchmarkEncodeNRGBA" href="#BenchmarkEncodeNRGBA">func BenchmarkEncodeNRGBA(b *testing.B)</a>

```
searchKey: png.BenchmarkEncodeNRGBA
tags: [function private benchmark]
```

```Go
func BenchmarkEncodeNRGBA(b *testing.B)
```

### <a id="BenchmarkEncodeNRGBOpaque" href="#BenchmarkEncodeNRGBOpaque">func BenchmarkEncodeNRGBOpaque(b *testing.B)</a>

```
searchKey: png.BenchmarkEncodeNRGBOpaque
tags: [function private benchmark]
```

```Go
func BenchmarkEncodeNRGBOpaque(b *testing.B)
```

### <a id="BenchmarkEncodePaletted" href="#BenchmarkEncodePaletted">func BenchmarkEncodePaletted(b *testing.B)</a>

```
searchKey: png.BenchmarkEncodePaletted
tags: [function private benchmark]
```

```Go
func BenchmarkEncodePaletted(b *testing.B)
```

### <a id="BenchmarkEncodeRGBA" href="#BenchmarkEncodeRGBA">func BenchmarkEncodeRGBA(b *testing.B)</a>

```
searchKey: png.BenchmarkEncodeRGBA
tags: [function private benchmark]
```

```Go
func BenchmarkEncodeRGBA(b *testing.B)
```

### <a id="BenchmarkEncodeRGBOpaque" href="#BenchmarkEncodeRGBOpaque">func BenchmarkEncodeRGBOpaque(b *testing.B)</a>

```
searchKey: png.BenchmarkEncodeRGBOpaque
tags: [function private benchmark]
```

```Go
func BenchmarkEncodeRGBOpaque(b *testing.B)
```

### <a id="BenchmarkPaeth" href="#BenchmarkPaeth">func BenchmarkPaeth(b *testing.B)</a>

```
searchKey: png.BenchmarkPaeth
tags: [function private benchmark]
```

```Go
func BenchmarkPaeth(b *testing.B)
```

### <a id="Decode" href="#Decode">func Decode(r io.Reader) (image.Image, error)</a>

```
searchKey: png.Decode
tags: [function]
```

```Go
func Decode(r io.Reader) (image.Image, error)
```

Decode reads a PNG image from r and returns it as an image.Image. The type of Image returned depends on the PNG contents. 

### <a id="DecodeConfig" href="#DecodeConfig">func DecodeConfig(r io.Reader) (image.Config, error)</a>

```
searchKey: png.DecodeConfig
tags: [function]
```

```Go
func DecodeConfig(r io.Reader) (image.Config, error)
```

DecodeConfig returns the color model and dimensions of a PNG image without decoding the entire image. 

### <a id="Encode" href="#Encode">func Encode(w io.Writer, m image.Image) error</a>

```
searchKey: png.Encode
tags: [function]
```

```Go
func Encode(w io.Writer, m image.Image) error
```

Encode writes the Image m to w in PNG format. Any Image may be encoded, but images that are not image.NRGBA might be encoded lossily. 

### <a id="TestDimensionOverflow" href="#TestDimensionOverflow">func TestDimensionOverflow(t *testing.T)</a>

```
searchKey: png.TestDimensionOverflow
tags: [function private test]
```

```Go
func TestDimensionOverflow(t *testing.T)
```

### <a id="TestGray8Transparent" href="#TestGray8Transparent">func TestGray8Transparent(t *testing.T)</a>

```
searchKey: png.TestGray8Transparent
tags: [function private test]
```

```Go
func TestGray8Transparent(t *testing.T)
```

### <a id="TestIncompleteIDATOnRowBoundary" href="#TestIncompleteIDATOnRowBoundary">func TestIncompleteIDATOnRowBoundary(t *testing.T)</a>

```
searchKey: png.TestIncompleteIDATOnRowBoundary
tags: [function private test]
```

```Go
func TestIncompleteIDATOnRowBoundary(t *testing.T)
```

### <a id="TestInterlaced" href="#TestInterlaced">func TestInterlaced(t *testing.T)</a>

```
searchKey: png.TestInterlaced
tags: [function private test]
```

```Go
func TestInterlaced(t *testing.T)
```

### <a id="TestMultipletRNSChunks" href="#TestMultipletRNSChunks">func TestMultipletRNSChunks(t *testing.T)</a>

```
searchKey: png.TestMultipletRNSChunks
tags: [function private test]
```

```Go
func TestMultipletRNSChunks(t *testing.T)
```

### <a id="TestPaeth" href="#TestPaeth">func TestPaeth(t *testing.T)</a>

```
searchKey: png.TestPaeth
tags: [function private test]
```

```Go
func TestPaeth(t *testing.T)
```

### <a id="TestPaethDecode" href="#TestPaethDecode">func TestPaethDecode(t *testing.T)</a>

```
searchKey: png.TestPaethDecode
tags: [function private test]
```

```Go
func TestPaethDecode(t *testing.T)
```

### <a id="TestPaletted8OutOfRangePixel" href="#TestPaletted8OutOfRangePixel">func TestPaletted8OutOfRangePixel(t *testing.T)</a>

```
searchKey: png.TestPaletted8OutOfRangePixel
tags: [function private test]
```

```Go
func TestPaletted8OutOfRangePixel(t *testing.T)
```

### <a id="TestPalettedDecodeConfig" href="#TestPalettedDecodeConfig">func TestPalettedDecodeConfig(t *testing.T)</a>

```
searchKey: png.TestPalettedDecodeConfig
tags: [function private test]
```

```Go
func TestPalettedDecodeConfig(t *testing.T)
```

### <a id="TestReader" href="#TestReader">func TestReader(t *testing.T)</a>

```
searchKey: png.TestReader
tags: [function private test]
```

```Go
func TestReader(t *testing.T)
```

### <a id="TestReaderError" href="#TestReaderError">func TestReaderError(t *testing.T)</a>

```
searchKey: png.TestReaderError
tags: [function private test]
```

```Go
func TestReaderError(t *testing.T)
```

### <a id="TestSubImage" href="#TestSubImage">func TestSubImage(t *testing.T)</a>

```
searchKey: png.TestSubImage
tags: [function private test]
```

```Go
func TestSubImage(t *testing.T)
```

### <a id="TestTrailingIDATChunks" href="#TestTrailingIDATChunks">func TestTrailingIDATChunks(t *testing.T)</a>

```
searchKey: png.TestTrailingIDATChunks
tags: [function private test]
```

```Go
func TestTrailingIDATChunks(t *testing.T)
```

### <a id="TestUnknownChunkLengthUnderflow" href="#TestUnknownChunkLengthUnderflow">func TestUnknownChunkLengthUnderflow(t *testing.T)</a>

```
searchKey: png.TestUnknownChunkLengthUnderflow
tags: [function private test]
```

```Go
func TestUnknownChunkLengthUnderflow(t *testing.T)
```

### <a id="TestWriter" href="#TestWriter">func TestWriter(t *testing.T)</a>

```
searchKey: png.TestWriter
tags: [function private test]
```

```Go
func TestWriter(t *testing.T)
```

### <a id="TestWriterLevels" href="#TestWriterLevels">func TestWriterLevels(t *testing.T)</a>

```
searchKey: png.TestWriterLevels
tags: [function private test]
```

```Go
func TestWriterLevels(t *testing.T)
```

### <a id="TestWriterPaletted" href="#TestWriterPaletted">func TestWriterPaletted(t *testing.T)</a>

```
searchKey: png.TestWriterPaletted
tags: [function private test]
```

```Go
func TestWriterPaletted(t *testing.T)
```

### <a id="abs" href="#abs">func abs(x int) int</a>

```
searchKey: png.abs
tags: [function private]
```

```Go
func abs(x int) int
```

### <a id="abs8" href="#abs8">func abs8(d uint8) int</a>

```
searchKey: png.abs8
tags: [function private]
```

```Go
func abs8(d uint8) int
```

The absolute value of a byte interpreted as a signed int8. 

### <a id="benchmarkDecode" href="#benchmarkDecode">func benchmarkDecode(b *testing.B, filename string, bytesPerPixel int)</a>

```
searchKey: png.benchmarkDecode
tags: [function private]
```

```Go
func benchmarkDecode(b *testing.B, filename string, bytesPerPixel int)
```

### <a id="cbPaletted" href="#cbPaletted">func cbPaletted(cb int) bool</a>

```
searchKey: png.cbPaletted
tags: [function private]
```

```Go
func cbPaletted(cb int) bool
```

### <a id="diff" href="#diff">func diff(m0, m1 image.Image) error</a>

```
searchKey: png.diff
tags: [function private]
```

```Go
func diff(m0, m1 image.Image) error
```

### <a id="encodeDecode" href="#encodeDecode">func encodeDecode(m image.Image) (image.Image, error)</a>

```
searchKey: png.encodeDecode
tags: [function private]
```

```Go
func encodeDecode(m image.Image) (image.Image, error)
```

### <a id="filter" href="#filter">func filter(cr *[nFilter][]byte, pr []byte, bpp int) int</a>

```
searchKey: png.filter
tags: [function private]
```

```Go
func filter(cr *[nFilter][]byte, pr []byte, bpp int) int
```

Chooses the filter to use for encoding the current row, and applies it. The return value is the index of the filter and also of the row in cr that has had it applied. 

### <a id="filterPaeth" href="#filterPaeth">func filterPaeth(cdat, pdat []byte, bytesPerPixel int)</a>

```
searchKey: png.filterPaeth
tags: [function private]
```

```Go
func filterPaeth(cdat, pdat []byte, bytesPerPixel int)
```

filterPaeth applies the Paeth filter to the cdat slice. cdat is the current row's data, pdat is the previous row's data. 

### <a id="init.reader.go" href="#init.reader.go">func init()</a>

```
searchKey: png.init
tags: [function private]
```

```Go
func init()
```

### <a id="levelToZlib" href="#levelToZlib">func levelToZlib(l CompressionLevel) int</a>

```
searchKey: png.levelToZlib
tags: [function private]
```

```Go
func levelToZlib(l CompressionLevel) int
```

This function is required because we want the zero value of Encoder.CompressionLevel to map to zlib.DefaultCompression. 

### <a id="min" href="#min">func min(a, b int) int</a>

```
searchKey: png.min
tags: [function private]
```

```Go
func min(a, b int) int
```

### <a id="opaque" href="#opaque">func opaque(m image.Image) bool</a>

```
searchKey: png.opaque
tags: [function private]
```

```Go
func opaque(m image.Image) bool
```

Returns whether or not the image is fully opaque. 

### <a id="paeth" href="#paeth">func paeth(a, b, c uint8) uint8</a>

```
searchKey: png.paeth
tags: [function private]
```

```Go
func paeth(a, b, c uint8) uint8
```

paeth implements the Paeth filter function, as per the PNG specification. 

### <a id="readPNG" href="#readPNG">func readPNG(filename string) (image.Image, error)</a>

```
searchKey: png.readPNG
tags: [function private]
```

```Go
func readPNG(filename string) (image.Image, error)
```

### <a id="slowAbs" href="#slowAbs">func slowAbs(x int) int</a>

```
searchKey: png.slowAbs
tags: [function private]
```

```Go
func slowAbs(x int) int
```

### <a id="slowFilterPaeth" href="#slowFilterPaeth">func slowFilterPaeth(cdat, pdat []byte, bytesPerPixel int)</a>

```
searchKey: png.slowFilterPaeth
tags: [function private]
```

```Go
func slowFilterPaeth(cdat, pdat []byte, bytesPerPixel int)
```

slowFilterPaeth is a slow but simple implementation of func filterPaeth. 

### <a id="slowPaeth" href="#slowPaeth">func slowPaeth(a, b, c uint8) uint8</a>

```
searchKey: png.slowPaeth
tags: [function private]
```

```Go
func slowPaeth(a, b, c uint8) uint8
```

slowPaeth is a slow but simple implementation of the Paeth function. It is a straight port of the sample code in the PNG spec, section 9.4. 

### <a id="sng" href="#sng">func sng(w io.WriteCloser, filename string, png image.Image)</a>

```
searchKey: png.sng
tags: [function private]
```

```Go
func sng(w io.WriteCloser, filename string, png image.Image)
```

An approximation of the sng command-line tool. 

### <a id="zeroMemory" href="#zeroMemory">func zeroMemory(v []uint8)</a>

```
searchKey: png.zeroMemory
tags: [function private]
```

```Go
func zeroMemory(v []uint8)
```

