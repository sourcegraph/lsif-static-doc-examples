# Package gif

Package gif implements a GIF image decoder and encoder. 

The GIF specification is at [https://www.w3.org/Graphics/GIF/spec-gif89a.txt](https://www.w3.org/Graphics/GIF/spec-gif89a.txt). 

## Index

* [Constants](#const)
    * [const DisposalBackground](#DisposalBackground)
    * [const DisposalNone](#DisposalNone)
    * [const DisposalPrevious](#DisposalPrevious)
    * [const eApplication](#eApplication)
    * [const eComment](#eComment)
    * [const eGraphicControl](#eGraphicControl)
    * [const eText](#eText)
    * [const fColorTable](#fColorTable)
    * [const fColorTableBitsMask](#fColorTableBitsMask)
    * [const fInterlace](#fInterlace)
    * [const gcBlockSize](#gcBlockSize)
    * [const gcDisposalMethodMask](#gcDisposalMethodMask)
    * [const gcLabel](#gcLabel)
    * [const gcTransparentColorSet](#gcTransparentColorSet)
    * [const headerStr](#headerStr)
    * [const paletteStr](#paletteStr)
    * [const sExtension](#sExtension)
    * [const sImageDescriptor](#sImageDescriptor)
    * [const sTrailer](#sTrailer)
    * [const trailerStr](#trailerStr)
* [Variables](#var)
    * [var errBadPixel](#errBadPixel)
    * [var errNotEnough](#errNotEnough)
    * [var errTooMuch](#errTooMuch)
    * [var frames](#frames)
    * [var interlacing](#interlacing)
    * [var log2Lookup](#log2Lookup)
    * [var testCase](#testCase)
    * [var testGIF](#testGIF)
* [Types](#type)
    * [type GIF struct](#GIF)
        * [func DecodeAll(r io.Reader) (*GIF, error)](#DecodeAll)
        * [func readGIF(filename string) (*GIF, error)](#readGIF)
    * [type Options struct](#Options)
    * [type blockReader struct](#blockReader)
        * [func (b *blockReader) Read(p []byte) (int, error)](#blockReader.Read)
        * [func (b *blockReader) ReadByte() (byte, error)](#blockReader.ReadByte)
        * [func (b *blockReader) close() error](#blockReader.close)
        * [func (b *blockReader) fill()](#blockReader.fill)
    * [type blockWriter struct](#blockWriter)
        * [func (b blockWriter) Flush() error](#blockWriter.Flush)
        * [func (b blockWriter) Write(data []byte) (int, error)](#blockWriter.Write)
        * [func (b blockWriter) WriteByte(c byte) error](#blockWriter.WriteByte)
        * [func (b blockWriter) close()](#blockWriter.close)
        * [func (b blockWriter) setup()](#blockWriter.setup)
    * [type decoder struct](#decoder)
        * [func (d *decoder) decode(r io.Reader, configOnly, keepAllFrames bool) error](#decoder.decode)
        * [func (d *decoder) newImageFromDescriptor() (*image.Paletted, error)](#decoder.newImageFromDescriptor)
        * [func (d *decoder) readBlock() (int, error)](#decoder.readBlock)
        * [func (d *decoder) readColorTable(fields byte) (color.Palette, error)](#decoder.readColorTable)
        * [func (d *decoder) readExtension() error](#decoder.readExtension)
        * [func (d *decoder) readGraphicControl() error](#decoder.readGraphicControl)
        * [func (d *decoder) readHeaderAndScreenDescriptor() error](#decoder.readHeaderAndScreenDescriptor)
        * [func (d *decoder) readImageDescriptor(keepAllFrames bool) error](#decoder.readImageDescriptor)
    * [type encoder struct](#encoder)
        * [func (e *encoder) colorTablesMatch(localLen, transparentIndex int) bool](#encoder.colorTablesMatch)
        * [func (e *encoder) flush()](#encoder.flush)
        * [func (e *encoder) write(p []byte)](#encoder.write)
        * [func (e *encoder) writeByte(b byte)](#encoder.writeByte)
        * [func (e *encoder) writeHeader()](#encoder.writeHeader)
        * [func (e *encoder) writeImageBlock(pm *image.Paletted, delay int, disposal byte)](#encoder.writeImageBlock)
    * [type interlaceScan struct](#interlaceScan)
    * [type offsetImage struct](#offsetImage)
        * [func (i offsetImage) Bounds() image.Rectangle](#offsetImage.Bounds)
    * [type reader interface](#reader)
    * [type writer interface](#writer)
* [Functions](#func)
    * [func BenchmarkDecode(b *testing.B)](#BenchmarkDecode)
    * [func BenchmarkEncodeRandomPaletted(b *testing.B)](#BenchmarkEncodeRandomPaletted)
    * [func BenchmarkEncodeRandomRGBA(b *testing.B)](#BenchmarkEncodeRandomRGBA)
    * [func BenchmarkEncodeRealisticPaletted(b *testing.B)](#BenchmarkEncodeRealisticPaletted)
    * [func BenchmarkEncodeRealisticRGBA(b *testing.B)](#BenchmarkEncodeRealisticRGBA)
    * [func Decode(r io.Reader) (image.Image, error)](#Decode)
    * [func DecodeConfig(r io.Reader) (image.Config, error)](#DecodeConfig)
    * [func Encode(w io.Writer, m image.Image, o *Options) error](#Encode)
    * [func EncodeAll(w io.Writer, g *GIF) error](#EncodeAll)
    * [func TestBounds(t *testing.T)](#TestBounds)
    * [func TestColorTablesMatch(t *testing.T)](#TestColorTablesMatch)
    * [func TestDecode(t *testing.T)](#TestDecode)
    * [func TestDecodeMemoryConsumption(t *testing.T)](#TestDecodeMemoryConsumption)
    * [func TestEncodeAllFramesOutOfBounds(t *testing.T)](#TestEncodeAllFramesOutOfBounds)
    * [func TestEncodeAllGo1Dot4(t *testing.T)](#TestEncodeAllGo1Dot4)
    * [func TestEncodeAllGo1Dot5(t *testing.T)](#TestEncodeAllGo1Dot5)
    * [func TestEncodeAllGo1Dot5GlobalColorModel(t *testing.T)](#TestEncodeAllGo1Dot5GlobalColorModel)
    * [func TestEncodeBadPalettes(t *testing.T)](#TestEncodeBadPalettes)
    * [func TestEncodeCroppedSubImages(t *testing.T)](#TestEncodeCroppedSubImages)
    * [func TestEncodeImplicitConfigSize(t *testing.T)](#TestEncodeImplicitConfigSize)
    * [func TestEncodeMismatchDelay(t *testing.T)](#TestEncodeMismatchDelay)
    * [func TestEncodeNonZeroMinPoint(t *testing.T)](#TestEncodeNonZeroMinPoint)
    * [func TestEncodePalettes(t *testing.T)](#TestEncodePalettes)
    * [func TestEncodeWrappedImage(t *testing.T)](#TestEncodeWrappedImage)
    * [func TestEncodeZeroGIF(t *testing.T)](#TestEncodeZeroGIF)
    * [func TestLoopCount(t *testing.T)](#TestLoopCount)
    * [func TestNoPalette(t *testing.T)](#TestNoPalette)
    * [func TestPixelOutsidePaletteRange(t *testing.T)](#TestPixelOutsidePaletteRange)
    * [func TestSubImage(t *testing.T)](#TestSubImage)
    * [func TestTransparentIndex(t *testing.T)](#TestTransparentIndex)
    * [func TestTransparentPixelOutsidePaletteRange(t *testing.T)](#TestTransparentPixelOutsidePaletteRange)
    * [func TestUnexpectedEOF(t *testing.T)](#TestUnexpectedEOF)
    * [func TestWriter(t *testing.T)](#TestWriter)
    * [func averageDelta(m0, m1 image.Image) int64](#averageDelta)
    * [func averageDeltaBound(m0, m1 image.Image, b0, b1 image.Rectangle) int64](#averageDeltaBound)
    * [func delta(u0, u1 uint32) int64](#delta)
    * [func encodeColorTable(dst []byte, p color.Palette, size int) (int, error)](#encodeColorTable)
    * [func init()](#init.reader.go)
    * [func log2(x int) int](#log2)
    * [func lzwEncode(in []byte) []byte](#lzwEncode)
    * [func palettesEqual(p, q color.Palette) bool](#palettesEqual)
    * [func readByte(r io.ByteReader) (byte, error)](#readByte)
    * [func readFull(r io.Reader, b []byte) error](#readFull)
    * [func readImg(filename string) (image.Image, error)](#readImg)
    * [func testEncodeAll(t *testing.T, go1Dot5Fields bool, useGlobalColorModel bool)](#testEncodeAll)
    * [func try(t *testing.T, b []byte, want string)](#try)
    * [func uninterlace(m *image.Paletted)](#uninterlace)
    * [func writeUint16(b []uint8, u uint16)](#writeUint16)


## <a id="const" href="#const">Constants</a>

### <a id="DisposalBackground" href="#DisposalBackground">const DisposalBackground</a>

```
searchKey: gif.DisposalBackground
tags: [constant number]
```

```Go
const DisposalBackground = 0x02
```

Disposal Methods. 

### <a id="DisposalNone" href="#DisposalNone">const DisposalNone</a>

```
searchKey: gif.DisposalNone
tags: [constant number]
```

```Go
const DisposalNone = 0x01
```

Disposal Methods. 

### <a id="DisposalPrevious" href="#DisposalPrevious">const DisposalPrevious</a>

```
searchKey: gif.DisposalPrevious
tags: [constant number]
```

```Go
const DisposalPrevious = 0x03
```

Disposal Methods. 

### <a id="eApplication" href="#eApplication">const eApplication</a>

```
searchKey: gif.eApplication
tags: [constant number private]
```

```Go
const eApplication = 0xFF // Application

```

Extensions. 

### <a id="eComment" href="#eComment">const eComment</a>

```
searchKey: gif.eComment
tags: [constant number private]
```

```Go
const eComment = 0xFE // Comment

```

Extensions. 

### <a id="eGraphicControl" href="#eGraphicControl">const eGraphicControl</a>

```
searchKey: gif.eGraphicControl
tags: [constant number private]
```

```Go
const eGraphicControl = 0xF9 // Graphic Control

```

Extensions. 

### <a id="eText" href="#eText">const eText</a>

```
searchKey: gif.eText
tags: [constant number private]
```

```Go
const eText = 0x01 // Plain Text

```

Extensions. 

### <a id="fColorTable" href="#fColorTable">const fColorTable</a>

```
searchKey: gif.fColorTable
tags: [constant number private]
```

```Go
const fColorTable = 1 << 7
```

Masks etc. 

Fields. 

### <a id="fColorTableBitsMask" href="#fColorTableBitsMask">const fColorTableBitsMask</a>

```
searchKey: gif.fColorTableBitsMask
tags: [constant number private]
```

```Go
const fColorTableBitsMask = 7
```

Masks etc. 

### <a id="fInterlace" href="#fInterlace">const fInterlace</a>

```
searchKey: gif.fInterlace
tags: [constant number private]
```

```Go
const fInterlace = 1 << 6
```

Masks etc. 

### <a id="gcBlockSize" href="#gcBlockSize">const gcBlockSize</a>

```
searchKey: gif.gcBlockSize
tags: [constant number private]
```

```Go
const gcBlockSize = 0x04
```

Graphic control extension fields. 

### <a id="gcDisposalMethodMask" href="#gcDisposalMethodMask">const gcDisposalMethodMask</a>

```
searchKey: gif.gcDisposalMethodMask
tags: [constant number private]
```

```Go
const gcDisposalMethodMask = 7 << 2
```

Masks etc. 

### <a id="gcLabel" href="#gcLabel">const gcLabel</a>

```
searchKey: gif.gcLabel
tags: [constant number private]
```

```Go
const gcLabel = 0xF9
```

Graphic control extension fields. 

### <a id="gcTransparentColorSet" href="#gcTransparentColorSet">const gcTransparentColorSet</a>

```
searchKey: gif.gcTransparentColorSet
tags: [constant number private]
```

```Go
const gcTransparentColorSet = 1 << 0
```

Masks etc. 

Graphic control flags. 

### <a id="headerStr" href="#headerStr">const headerStr</a>

```
searchKey: gif.headerStr
tags: [constant string private]
```

```Go
const headerStr

// headerFields=(a color table of 2 pixels), backgroundIndex, aspect
 = ...
```

header, palette and trailer are parts of a valid 2x1 GIF image. 

### <a id="paletteStr" href="#paletteStr">const paletteStr</a>

```
searchKey: gif.paletteStr
tags: [constant string private]
```

```Go
const paletteStr = "\x10\x20\x30\x40\x50\x60" // the color table, also known as a palette

```

header, palette and trailer are parts of a valid 2x1 GIF image. 

### <a id="sExtension" href="#sExtension">const sExtension</a>

```
searchKey: gif.sExtension
tags: [constant number private]
```

```Go
const sExtension = 0x21
```

Section indicators. 

### <a id="sImageDescriptor" href="#sImageDescriptor">const sImageDescriptor</a>

```
searchKey: gif.sImageDescriptor
tags: [constant number private]
```

```Go
const sImageDescriptor = 0x2C
```

Section indicators. 

### <a id="sTrailer" href="#sTrailer">const sTrailer</a>

```
searchKey: gif.sTrailer
tags: [constant number private]
```

```Go
const sTrailer = 0x3B
```

Section indicators. 

### <a id="trailerStr" href="#trailerStr">const trailerStr</a>

```
searchKey: gif.trailerStr
tags: [constant string private]
```

```Go
const trailerStr = "\x3b"
```

header, palette and trailer are parts of a valid 2x1 GIF image. 

## <a id="var" href="#var">Variables</a>

### <a id="errBadPixel" href="#errBadPixel">var errBadPixel</a>

```
searchKey: gif.errBadPixel
tags: [variable interface private]
```

```Go
var errBadPixel = errors.New("gif: invalid pixel value")
```

### <a id="errNotEnough" href="#errNotEnough">var errNotEnough</a>

```
searchKey: gif.errNotEnough
tags: [variable interface private]
```

```Go
var errNotEnough = errors.New("gif: not enough image data")
```

### <a id="errTooMuch" href="#errTooMuch">var errTooMuch</a>

```
searchKey: gif.errTooMuch
tags: [variable interface private]
```

```Go
var errTooMuch = errors.New("gif: too much image data")
```

### <a id="frames" href="#frames">var frames</a>

```
searchKey: gif.frames
tags: [variable array string private]
```

```Go
var frames = []string{
	"../testdata/video-001.gif",
	"../testdata/video-005.gray.gif",
}
```

### <a id="interlacing" href="#interlacing">var interlacing</a>

```
searchKey: gif.interlacing
tags: [variable array struct private]
```

```Go
var interlacing = []interlaceScan{
	{8, 0},
	{8, 4},
	{4, 2},
	{2, 1},
}
```

interlacing represents the set of scans in an interlaced GIF image. 

### <a id="log2Lookup" href="#log2Lookup">var log2Lookup</a>

```
searchKey: gif.log2Lookup
tags: [variable array number private]
```

```Go
var log2Lookup = [8]int{2, 4, 8, 16, 32, 64, 128, 256}
```

### <a id="testCase" href="#testCase">var testCase</a>

```
searchKey: gif.testCase
tags: [variable array struct private]
```

```Go
var testCase = ...
```

### <a id="testGIF" href="#testGIF">var testGIF</a>

```
searchKey: gif.testGIF
tags: [variable array number private]
```

```Go
var testGIF = ...
```

testGIF is a simple GIF that we can modify to test different scenarios. 

## <a id="type" href="#type">Types</a>

### <a id="GIF" href="#GIF">type GIF struct</a>

```
searchKey: gif.GIF
tags: [struct]
```

```Go
type GIF struct {
	Image []*image.Paletted // The successive images.
	Delay []int             // The successive delay times, one per frame, in 100ths of a second.
	// LoopCount controls the number of times an animation will be
	// restarted during display.
	// A LoopCount of 0 means to loop forever.
	// A LoopCount of -1 means to show each frame only once.
	// Otherwise, the animation is looped LoopCount+1 times.
	LoopCount int
	// Disposal is the successive disposal methods, one per frame. For
	// backwards compatibility, a nil Disposal is valid to pass to EncodeAll,
	// and implies that each frame's disposal method is 0 (no disposal
	// specified).
	Disposal []byte
	// Config is the global color table (palette), width and height. A nil or
	// empty-color.Palette Config.ColorModel means that each frame has its own
	// color table and there is no global color table. Each frame's bounds must
	// be within the rectangle defined by the two points (0, 0) and
	// (Config.Width, Config.Height).
	//
	// For backwards compatibility, a zero-valued Config is valid to pass to
	// EncodeAll, and implies that the overall GIF's width and height equals
	// the first frame's bounds' Rectangle.Max point.
	Config image.Config
	// BackgroundIndex is the background index in the global color table, for
	// use with the DisposalBackground disposal method.
	BackgroundIndex byte
}
```

GIF represents the possibly multiple images stored in a GIF file. 

#### <a id="DecodeAll" href="#DecodeAll">func DecodeAll(r io.Reader) (*GIF, error)</a>

```
searchKey: gif.DecodeAll
tags: [function]
```

```Go
func DecodeAll(r io.Reader) (*GIF, error)
```

DecodeAll reads a GIF image from r and returns the sequential frames and timing information. 

#### <a id="readGIF" href="#readGIF">func readGIF(filename string) (*GIF, error)</a>

```
searchKey: gif.readGIF
tags: [function private]
```

```Go
func readGIF(filename string) (*GIF, error)
```

### <a id="Options" href="#Options">type Options struct</a>

```
searchKey: gif.Options
tags: [struct]
```

```Go
type Options struct {
	// NumColors is the maximum number of colors used in the image.
	// It ranges from 1 to 256.
	NumColors int

	// Quantizer is used to produce a palette with size NumColors.
	// palette.Plan9 is used in place of a nil Quantizer.
	Quantizer draw.Quantizer

	// Drawer is used to convert the source image to the desired palette.
	// draw.FloydSteinberg is used in place of a nil Drawer.
	Drawer draw.Drawer
}
```

Options are the encoding parameters. 

### <a id="blockReader" href="#blockReader">type blockReader struct</a>

```
searchKey: gif.blockReader
tags: [struct private]
```

```Go
type blockReader struct {
	d    *decoder
	i, j uint8 // d.tmp[i:j] contains the buffered bytes
	err  error
}
```

blockReader parses the block structure of GIF image data, which comprises (n, (n bytes)) blocks, with 1 <= n <= 255. It is the reader given to the LZW decoder, which is thus immune to the blocking. After the LZW decoder completes, there will be a 0-byte block remaining (0, ()), which is consumed when checking that the blockReader is exhausted. 

To avoid the allocation of a bufio.Reader for the lzw Reader, blockReader implements io.ReadByte and buffers blocks into the decoder's "tmp" buffer. 

#### <a id="blockReader.Read" href="#blockReader.Read">func (b *blockReader) Read(p []byte) (int, error)</a>

```
searchKey: gif.blockReader.Read
tags: [method private]
```

```Go
func (b *blockReader) Read(p []byte) (int, error)
```

blockReader must implement io.Reader, but its Read shouldn't ever actually be called in practice. The compress/lzw package will only call ReadByte. 

#### <a id="blockReader.ReadByte" href="#blockReader.ReadByte">func (b *blockReader) ReadByte() (byte, error)</a>

```
searchKey: gif.blockReader.ReadByte
tags: [method private]
```

```Go
func (b *blockReader) ReadByte() (byte, error)
```

#### <a id="blockReader.close" href="#blockReader.close">func (b *blockReader) close() error</a>

```
searchKey: gif.blockReader.close
tags: [method private]
```

```Go
func (b *blockReader) close() error
```

close primarily detects whether or not a block terminator was encountered after reading a sequence of data sub-blocks. It allows at most one trailing sub-block worth of data. I.e., if some number of bytes exist in one sub-block following the end of LZW data, the very next sub-block must be the block terminator. If the very end of LZW data happened to fill one sub-block, at most one more sub-block of length 1 may exist before the block-terminator. These accommodations allow us to support GIFs created by less strict encoders. See [https://golang.org/issue/16146](https://golang.org/issue/16146). 

#### <a id="blockReader.fill" href="#blockReader.fill">func (b *blockReader) fill()</a>

```
searchKey: gif.blockReader.fill
tags: [method private]
```

```Go
func (b *blockReader) fill()
```

### <a id="blockWriter" href="#blockWriter">type blockWriter struct</a>

```
searchKey: gif.blockWriter
tags: [struct private]
```

```Go
type blockWriter struct {
	e *encoder
}
```

blockWriter writes the block structure of GIF image data, which comprises (n, (n bytes)) blocks, with 1 <= n <= 255. It is the writer given to the LZW encoder, which is thus immune to the blocking. 

#### <a id="blockWriter.Flush" href="#blockWriter.Flush">func (b blockWriter) Flush() error</a>

```
searchKey: gif.blockWriter.Flush
tags: [method private]
```

```Go
func (b blockWriter) Flush() error
```

#### <a id="blockWriter.Write" href="#blockWriter.Write">func (b blockWriter) Write(data []byte) (int, error)</a>

```
searchKey: gif.blockWriter.Write
tags: [method private]
```

```Go
func (b blockWriter) Write(data []byte) (int, error)
```

blockWriter must be an io.Writer for lzw.NewWriter, but this is never actually called. 

#### <a id="blockWriter.WriteByte" href="#blockWriter.WriteByte">func (b blockWriter) WriteByte(c byte) error</a>

```
searchKey: gif.blockWriter.WriteByte
tags: [method private]
```

```Go
func (b blockWriter) WriteByte(c byte) error
```

#### <a id="blockWriter.close" href="#blockWriter.close">func (b blockWriter) close()</a>

```
searchKey: gif.blockWriter.close
tags: [method private]
```

```Go
func (b blockWriter) close()
```

#### <a id="blockWriter.setup" href="#blockWriter.setup">func (b blockWriter) setup()</a>

```
searchKey: gif.blockWriter.setup
tags: [method private]
```

```Go
func (b blockWriter) setup()
```

### <a id="decoder" href="#decoder">type decoder struct</a>

```
searchKey: gif.decoder
tags: [struct private]
```

```Go
type decoder struct {
	r reader

	// From header.
	vers            string
	width           int
	height          int
	loopCount       int
	delayTime       int
	backgroundIndex byte
	disposalMethod  byte

	// From image descriptor.
	imageFields byte

	// From graphics control.
	transparentIndex    byte
	hasTransparentIndex bool

	// Computed.
	globalColorTable color.Palette

	// Used when decoding.
	delay    []int
	disposal []byte
	image    []*image.Paletted
	tmp      [1024]byte // must be at least 768 so we can read color table
}
```

decoder is the type used to decode a GIF file. 

#### <a id="decoder.decode" href="#decoder.decode">func (d *decoder) decode(r io.Reader, configOnly, keepAllFrames bool) error</a>

```
searchKey: gif.decoder.decode
tags: [method private]
```

```Go
func (d *decoder) decode(r io.Reader, configOnly, keepAllFrames bool) error
```

decode reads a GIF image from r and stores the result in d. 

#### <a id="decoder.newImageFromDescriptor" href="#decoder.newImageFromDescriptor">func (d *decoder) newImageFromDescriptor() (*image.Paletted, error)</a>

```
searchKey: gif.decoder.newImageFromDescriptor
tags: [method private]
```

```Go
func (d *decoder) newImageFromDescriptor() (*image.Paletted, error)
```

#### <a id="decoder.readBlock" href="#decoder.readBlock">func (d *decoder) readBlock() (int, error)</a>

```
searchKey: gif.decoder.readBlock
tags: [method private]
```

```Go
func (d *decoder) readBlock() (int, error)
```

#### <a id="decoder.readColorTable" href="#decoder.readColorTable">func (d *decoder) readColorTable(fields byte) (color.Palette, error)</a>

```
searchKey: gif.decoder.readColorTable
tags: [method private]
```

```Go
func (d *decoder) readColorTable(fields byte) (color.Palette, error)
```

#### <a id="decoder.readExtension" href="#decoder.readExtension">func (d *decoder) readExtension() error</a>

```
searchKey: gif.decoder.readExtension
tags: [method private]
```

```Go
func (d *decoder) readExtension() error
```

#### <a id="decoder.readGraphicControl" href="#decoder.readGraphicControl">func (d *decoder) readGraphicControl() error</a>

```
searchKey: gif.decoder.readGraphicControl
tags: [method private]
```

```Go
func (d *decoder) readGraphicControl() error
```

#### <a id="decoder.readHeaderAndScreenDescriptor" href="#decoder.readHeaderAndScreenDescriptor">func (d *decoder) readHeaderAndScreenDescriptor() error</a>

```
searchKey: gif.decoder.readHeaderAndScreenDescriptor
tags: [method private]
```

```Go
func (d *decoder) readHeaderAndScreenDescriptor() error
```

#### <a id="decoder.readImageDescriptor" href="#decoder.readImageDescriptor">func (d *decoder) readImageDescriptor(keepAllFrames bool) error</a>

```
searchKey: gif.decoder.readImageDescriptor
tags: [method private]
```

```Go
func (d *decoder) readImageDescriptor(keepAllFrames bool) error
```

### <a id="encoder" href="#encoder">type encoder struct</a>

```
searchKey: gif.encoder
tags: [struct private]
```

```Go
type encoder struct {
	// w is the writer to write to. err is the first error encountered during
	// writing. All attempted writes after the first error become no-ops.
	w   writer
	err error
	// g is a reference to the data that is being encoded.
	g GIF
	// globalCT is the size in bytes of the global color table.
	globalCT int
	// buf is a scratch buffer. It must be at least 256 for the blockWriter.
	buf              [256]byte
	globalColorTable [3 * 256]byte
	localColorTable  [3 * 256]byte
}
```

encoder encodes an image to the GIF format. 

#### <a id="encoder.colorTablesMatch" href="#encoder.colorTablesMatch">func (e *encoder) colorTablesMatch(localLen, transparentIndex int) bool</a>

```
searchKey: gif.encoder.colorTablesMatch
tags: [method private]
```

```Go
func (e *encoder) colorTablesMatch(localLen, transparentIndex int) bool
```

#### <a id="encoder.flush" href="#encoder.flush">func (e *encoder) flush()</a>

```
searchKey: gif.encoder.flush
tags: [method private]
```

```Go
func (e *encoder) flush()
```

#### <a id="encoder.write" href="#encoder.write">func (e *encoder) write(p []byte)</a>

```
searchKey: gif.encoder.write
tags: [method private]
```

```Go
func (e *encoder) write(p []byte)
```

#### <a id="encoder.writeByte" href="#encoder.writeByte">func (e *encoder) writeByte(b byte)</a>

```
searchKey: gif.encoder.writeByte
tags: [method private]
```

```Go
func (e *encoder) writeByte(b byte)
```

#### <a id="encoder.writeHeader" href="#encoder.writeHeader">func (e *encoder) writeHeader()</a>

```
searchKey: gif.encoder.writeHeader
tags: [method private]
```

```Go
func (e *encoder) writeHeader()
```

#### <a id="encoder.writeImageBlock" href="#encoder.writeImageBlock">func (e *encoder) writeImageBlock(pm *image.Paletted, delay int, disposal byte)</a>

```
searchKey: gif.encoder.writeImageBlock
tags: [method private]
```

```Go
func (e *encoder) writeImageBlock(pm *image.Paletted, delay int, disposal byte)
```

### <a id="interlaceScan" href="#interlaceScan">type interlaceScan struct</a>

```
searchKey: gif.interlaceScan
tags: [struct private]
```

```Go
type interlaceScan struct {
	skip, start int
}
```

interlaceScan defines the ordering for a pass of the interlace algorithm. 

### <a id="offsetImage" href="#offsetImage">type offsetImage struct</a>

```
searchKey: gif.offsetImage
tags: [struct private]
```

```Go
type offsetImage struct {
	image.Image
	Rect image.Rectangle
}
```

#### <a id="offsetImage.Bounds" href="#offsetImage.Bounds">func (i offsetImage) Bounds() image.Rectangle</a>

```
searchKey: gif.offsetImage.Bounds
tags: [method private]
```

```Go
func (i offsetImage) Bounds() image.Rectangle
```

### <a id="reader" href="#reader">type reader interface</a>

```
searchKey: gif.reader
tags: [interface private]
```

```Go
type reader interface {
	io.Reader
	io.ByteReader
}
```

If the io.Reader does not also have ReadByte, then decode will introduce its own buffering. 

### <a id="writer" href="#writer">type writer interface</a>

```
searchKey: gif.writer
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

### <a id="BenchmarkDecode" href="#BenchmarkDecode">func BenchmarkDecode(b *testing.B)</a>

```
searchKey: gif.BenchmarkDecode
tags: [function private benchmark]
```

```Go
func BenchmarkDecode(b *testing.B)
```

### <a id="BenchmarkEncodeRandomPaletted" href="#BenchmarkEncodeRandomPaletted">func BenchmarkEncodeRandomPaletted(b *testing.B)</a>

```
searchKey: gif.BenchmarkEncodeRandomPaletted
tags: [function private benchmark]
```

```Go
func BenchmarkEncodeRandomPaletted(b *testing.B)
```

### <a id="BenchmarkEncodeRandomRGBA" href="#BenchmarkEncodeRandomRGBA">func BenchmarkEncodeRandomRGBA(b *testing.B)</a>

```
searchKey: gif.BenchmarkEncodeRandomRGBA
tags: [function private benchmark]
```

```Go
func BenchmarkEncodeRandomRGBA(b *testing.B)
```

### <a id="BenchmarkEncodeRealisticPaletted" href="#BenchmarkEncodeRealisticPaletted">func BenchmarkEncodeRealisticPaletted(b *testing.B)</a>

```
searchKey: gif.BenchmarkEncodeRealisticPaletted
tags: [function private benchmark]
```

```Go
func BenchmarkEncodeRealisticPaletted(b *testing.B)
```

### <a id="BenchmarkEncodeRealisticRGBA" href="#BenchmarkEncodeRealisticRGBA">func BenchmarkEncodeRealisticRGBA(b *testing.B)</a>

```
searchKey: gif.BenchmarkEncodeRealisticRGBA
tags: [function private benchmark]
```

```Go
func BenchmarkEncodeRealisticRGBA(b *testing.B)
```

### <a id="Decode" href="#Decode">func Decode(r io.Reader) (image.Image, error)</a>

```
searchKey: gif.Decode
tags: [function]
```

```Go
func Decode(r io.Reader) (image.Image, error)
```

Decode reads a GIF image from r and returns the first embedded image as an image.Image. 

### <a id="DecodeConfig" href="#DecodeConfig">func DecodeConfig(r io.Reader) (image.Config, error)</a>

```
searchKey: gif.DecodeConfig
tags: [function]
```

```Go
func DecodeConfig(r io.Reader) (image.Config, error)
```

DecodeConfig returns the global color model and dimensions of a GIF image without decoding the entire image. 

### <a id="Encode" href="#Encode">func Encode(w io.Writer, m image.Image, o *Options) error</a>

```
searchKey: gif.Encode
tags: [function]
```

```Go
func Encode(w io.Writer, m image.Image, o *Options) error
```

Encode writes the Image m to w in GIF format. 

### <a id="EncodeAll" href="#EncodeAll">func EncodeAll(w io.Writer, g *GIF) error</a>

```
searchKey: gif.EncodeAll
tags: [function]
```

```Go
func EncodeAll(w io.Writer, g *GIF) error
```

EncodeAll writes the images in g to w in GIF format with the given loop count and delay between frames. 

### <a id="TestBounds" href="#TestBounds">func TestBounds(t *testing.T)</a>

```
searchKey: gif.TestBounds
tags: [function private test]
```

```Go
func TestBounds(t *testing.T)
```

### <a id="TestColorTablesMatch" href="#TestColorTablesMatch">func TestColorTablesMatch(t *testing.T)</a>

```
searchKey: gif.TestColorTablesMatch
tags: [function private test]
```

```Go
func TestColorTablesMatch(t *testing.T)
```

### <a id="TestDecode" href="#TestDecode">func TestDecode(t *testing.T)</a>

```
searchKey: gif.TestDecode
tags: [function private test]
```

```Go
func TestDecode(t *testing.T)
```

### <a id="TestDecodeMemoryConsumption" href="#TestDecodeMemoryConsumption">func TestDecodeMemoryConsumption(t *testing.T)</a>

```
searchKey: gif.TestDecodeMemoryConsumption
tags: [function private test]
```

```Go
func TestDecodeMemoryConsumption(t *testing.T)
```

See golang.org/issue/22237 

### <a id="TestEncodeAllFramesOutOfBounds" href="#TestEncodeAllFramesOutOfBounds">func TestEncodeAllFramesOutOfBounds(t *testing.T)</a>

```
searchKey: gif.TestEncodeAllFramesOutOfBounds
tags: [function private test]
```

```Go
func TestEncodeAllFramesOutOfBounds(t *testing.T)
```

### <a id="TestEncodeAllGo1Dot4" href="#TestEncodeAllGo1Dot4">func TestEncodeAllGo1Dot4(t *testing.T)</a>

```
searchKey: gif.TestEncodeAllGo1Dot4
tags: [function private test]
```

```Go
func TestEncodeAllGo1Dot4(t *testing.T)
```

### <a id="TestEncodeAllGo1Dot5" href="#TestEncodeAllGo1Dot5">func TestEncodeAllGo1Dot5(t *testing.T)</a>

```
searchKey: gif.TestEncodeAllGo1Dot5
tags: [function private test]
```

```Go
func TestEncodeAllGo1Dot5(t *testing.T)
```

### <a id="TestEncodeAllGo1Dot5GlobalColorModel" href="#TestEncodeAllGo1Dot5GlobalColorModel">func TestEncodeAllGo1Dot5GlobalColorModel(t *testing.T)</a>

```
searchKey: gif.TestEncodeAllGo1Dot5GlobalColorModel
tags: [function private test]
```

```Go
func TestEncodeAllGo1Dot5GlobalColorModel(t *testing.T)
```

### <a id="TestEncodeBadPalettes" href="#TestEncodeBadPalettes">func TestEncodeBadPalettes(t *testing.T)</a>

```
searchKey: gif.TestEncodeBadPalettes
tags: [function private test]
```

```Go
func TestEncodeBadPalettes(t *testing.T)
```

### <a id="TestEncodeCroppedSubImages" href="#TestEncodeCroppedSubImages">func TestEncodeCroppedSubImages(t *testing.T)</a>

```
searchKey: gif.TestEncodeCroppedSubImages
tags: [function private test]
```

```Go
func TestEncodeCroppedSubImages(t *testing.T)
```

### <a id="TestEncodeImplicitConfigSize" href="#TestEncodeImplicitConfigSize">func TestEncodeImplicitConfigSize(t *testing.T)</a>

```
searchKey: gif.TestEncodeImplicitConfigSize
tags: [function private test]
```

```Go
func TestEncodeImplicitConfigSize(t *testing.T)
```

### <a id="TestEncodeMismatchDelay" href="#TestEncodeMismatchDelay">func TestEncodeMismatchDelay(t *testing.T)</a>

```
searchKey: gif.TestEncodeMismatchDelay
tags: [function private test]
```

```Go
func TestEncodeMismatchDelay(t *testing.T)
```

### <a id="TestEncodeNonZeroMinPoint" href="#TestEncodeNonZeroMinPoint">func TestEncodeNonZeroMinPoint(t *testing.T)</a>

```
searchKey: gif.TestEncodeNonZeroMinPoint
tags: [function private test]
```

```Go
func TestEncodeNonZeroMinPoint(t *testing.T)
```

### <a id="TestEncodePalettes" href="#TestEncodePalettes">func TestEncodePalettes(t *testing.T)</a>

```
searchKey: gif.TestEncodePalettes
tags: [function private test]
```

```Go
func TestEncodePalettes(t *testing.T)
```

### <a id="TestEncodeWrappedImage" href="#TestEncodeWrappedImage">func TestEncodeWrappedImage(t *testing.T)</a>

```
searchKey: gif.TestEncodeWrappedImage
tags: [function private test]
```

```Go
func TestEncodeWrappedImage(t *testing.T)
```

### <a id="TestEncodeZeroGIF" href="#TestEncodeZeroGIF">func TestEncodeZeroGIF(t *testing.T)</a>

```
searchKey: gif.TestEncodeZeroGIF
tags: [function private test]
```

```Go
func TestEncodeZeroGIF(t *testing.T)
```

### <a id="TestLoopCount" href="#TestLoopCount">func TestLoopCount(t *testing.T)</a>

```
searchKey: gif.TestLoopCount
tags: [function private test]
```

```Go
func TestLoopCount(t *testing.T)
```

### <a id="TestNoPalette" href="#TestNoPalette">func TestNoPalette(t *testing.T)</a>

```
searchKey: gif.TestNoPalette
tags: [function private test]
```

```Go
func TestNoPalette(t *testing.T)
```

### <a id="TestPixelOutsidePaletteRange" href="#TestPixelOutsidePaletteRange">func TestPixelOutsidePaletteRange(t *testing.T)</a>

```
searchKey: gif.TestPixelOutsidePaletteRange
tags: [function private test]
```

```Go
func TestPixelOutsidePaletteRange(t *testing.T)
```

### <a id="TestSubImage" href="#TestSubImage">func TestSubImage(t *testing.T)</a>

```
searchKey: gif.TestSubImage
tags: [function private test]
```

```Go
func TestSubImage(t *testing.T)
```

### <a id="TestTransparentIndex" href="#TestTransparentIndex">func TestTransparentIndex(t *testing.T)</a>

```
searchKey: gif.TestTransparentIndex
tags: [function private test]
```

```Go
func TestTransparentIndex(t *testing.T)
```

### <a id="TestTransparentPixelOutsidePaletteRange" href="#TestTransparentPixelOutsidePaletteRange">func TestTransparentPixelOutsidePaletteRange(t *testing.T)</a>

```
searchKey: gif.TestTransparentPixelOutsidePaletteRange
tags: [function private test]
```

```Go
func TestTransparentPixelOutsidePaletteRange(t *testing.T)
```

### <a id="TestUnexpectedEOF" href="#TestUnexpectedEOF">func TestUnexpectedEOF(t *testing.T)</a>

```
searchKey: gif.TestUnexpectedEOF
tags: [function private test]
```

```Go
func TestUnexpectedEOF(t *testing.T)
```

### <a id="TestWriter" href="#TestWriter">func TestWriter(t *testing.T)</a>

```
searchKey: gif.TestWriter
tags: [function private test]
```

```Go
func TestWriter(t *testing.T)
```

### <a id="averageDelta" href="#averageDelta">func averageDelta(m0, m1 image.Image) int64</a>

```
searchKey: gif.averageDelta
tags: [function private]
```

```Go
func averageDelta(m0, m1 image.Image) int64
```

averageDelta returns the average delta in RGB space. The two images must have the same bounds. 

### <a id="averageDeltaBound" href="#averageDeltaBound">func averageDeltaBound(m0, m1 image.Image, b0, b1 image.Rectangle) int64</a>

```
searchKey: gif.averageDeltaBound
tags: [function private]
```

```Go
func averageDeltaBound(m0, m1 image.Image, b0, b1 image.Rectangle) int64
```

averageDeltaBounds returns the average delta in RGB space. The average delta is calculated in the specified bounds. 

### <a id="delta" href="#delta">func delta(u0, u1 uint32) int64</a>

```
searchKey: gif.delta
tags: [function private]
```

```Go
func delta(u0, u1 uint32) int64
```

### <a id="encodeColorTable" href="#encodeColorTable">func encodeColorTable(dst []byte, p color.Palette, size int) (int, error)</a>

```
searchKey: gif.encodeColorTable
tags: [function private]
```

```Go
func encodeColorTable(dst []byte, p color.Palette, size int) (int, error)
```

### <a id="init.reader.go" href="#init.reader.go">func init()</a>

```
searchKey: gif.init
tags: [function private]
```

```Go
func init()
```

### <a id="log2" href="#log2">func log2(x int) int</a>

```
searchKey: gif.log2
tags: [function private]
```

```Go
func log2(x int) int
```

### <a id="lzwEncode" href="#lzwEncode">func lzwEncode(in []byte) []byte</a>

```
searchKey: gif.lzwEncode
tags: [function private]
```

```Go
func lzwEncode(in []byte) []byte
```

lzwEncode returns an LZW encoding (with 2-bit literals) of in. 

### <a id="palettesEqual" href="#palettesEqual">func palettesEqual(p, q color.Palette) bool</a>

```
searchKey: gif.palettesEqual
tags: [function private]
```

```Go
func palettesEqual(p, q color.Palette) bool
```

palettesEqual reports whether two color.Palette values are equal, ignoring any trailing opaque-black palette entries. 

### <a id="readByte" href="#readByte">func readByte(r io.ByteReader) (byte, error)</a>

```
searchKey: gif.readByte
tags: [function private]
```

```Go
func readByte(r io.ByteReader) (byte, error)
```

### <a id="readFull" href="#readFull">func readFull(r io.Reader, b []byte) error</a>

```
searchKey: gif.readFull
tags: [function private]
```

```Go
func readFull(r io.Reader, b []byte) error
```

### <a id="readImg" href="#readImg">func readImg(filename string) (image.Image, error)</a>

```
searchKey: gif.readImg
tags: [function private]
```

```Go
func readImg(filename string) (image.Image, error)
```

### <a id="testEncodeAll" href="#testEncodeAll">func testEncodeAll(t *testing.T, go1Dot5Fields bool, useGlobalColorModel bool)</a>

```
searchKey: gif.testEncodeAll
tags: [function private]
```

```Go
func testEncodeAll(t *testing.T, go1Dot5Fields bool, useGlobalColorModel bool)
```

### <a id="try" href="#try">func try(t *testing.T, b []byte, want string)</a>

```
searchKey: gif.try
tags: [function private]
```

```Go
func try(t *testing.T, b []byte, want string)
```

### <a id="uninterlace" href="#uninterlace">func uninterlace(m *image.Paletted)</a>

```
searchKey: gif.uninterlace
tags: [function private]
```

```Go
func uninterlace(m *image.Paletted)
```

uninterlace rearranges the pixels in m to account for interlaced input. 

### <a id="writeUint16" href="#writeUint16">func writeUint16(b []uint8, u uint16)</a>

```
searchKey: gif.writeUint16
tags: [function private]
```

```Go
func writeUint16(b []uint8, u uint16)
```

Little-endian. 

