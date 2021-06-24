# Package draw

Package draw provides image composition functions. 

See "The Go image/draw package" for an introduction to this package: [https://golang.org/doc/articles/image_draw.html](https://golang.org/doc/articles/image_draw.html) 

## Index

* [Constants](#const)
    * [const Over](#Over)
    * [const Src](#Src)
    * [const dsth](#dsth)
    * [const dstw](#dstw)
    * [const m](#m)
    * [const srch](#srch)
    * [const srcw](#srcw)
* [Variables](#var)
    * [var FloydSteinberg](#FloydSteinberg)
    * [var clipTests](#clipTests)
    * [var drawTests](#drawTests)
    * [var palette](#palette)
* [Types](#type)
    * [type Drawer interface](#Drawer)
    * [type Image interface](#Image)
        * [func gradYellow(alpha int) Image](#gradYellow)
        * [func hgradRed(alpha int) Image](#hgradRed)
    * [type Op int](#Op)
        * [func (op Op) Draw(dst Image, r image.Rectangle, src image.Image, sp image.Point)](#Op.Draw)
    * [type Quantizer interface](#Quantizer)
    * [type RGBA64Image interface](#RGBA64Image)
    * [type clipTest struct](#clipTest)
    * [type drawTest struct](#drawTest)
    * [type embeddedPaletted struct](#embeddedPaletted)
    * [type floydSteinberg struct{}](#floydSteinberg)
        * [func (floydSteinberg) Draw(dst Image, r image.Rectangle, src image.Image, sp image.Point)](#floydSteinberg.Draw)
* [Functions](#func)
    * [func BenchmarkCMYK(b *testing.B)](#BenchmarkCMYK)
    * [func BenchmarkCopyOver(b *testing.B)](#BenchmarkCopyOver)
    * [func BenchmarkCopySrc(b *testing.B)](#BenchmarkCopySrc)
    * [func BenchmarkFillOver(b *testing.B)](#BenchmarkFillOver)
    * [func BenchmarkFillSrc(b *testing.B)](#BenchmarkFillSrc)
    * [func BenchmarkGenericMaskOver(b *testing.B)](#BenchmarkGenericMaskOver)
    * [func BenchmarkGenericMaskSrc(b *testing.B)](#BenchmarkGenericMaskSrc)
    * [func BenchmarkGenericOver(b *testing.B)](#BenchmarkGenericOver)
    * [func BenchmarkGenericSrc(b *testing.B)](#BenchmarkGenericSrc)
    * [func BenchmarkGlyphOver(b *testing.B)](#BenchmarkGlyphOver)
    * [func BenchmarkGray(b *testing.B)](#BenchmarkGray)
    * [func BenchmarkNRGBAOver(b *testing.B)](#BenchmarkNRGBAOver)
    * [func BenchmarkNRGBASrc(b *testing.B)](#BenchmarkNRGBASrc)
    * [func BenchmarkPalettedFill(b *testing.B)](#BenchmarkPalettedFill)
    * [func BenchmarkPalettedRGBA(b *testing.B)](#BenchmarkPalettedRGBA)
    * [func BenchmarkRGBA(b *testing.B)](#BenchmarkRGBA)
    * [func BenchmarkYCbCr(b *testing.B)](#BenchmarkYCbCr)
    * [func Draw(dst Image, r image.Rectangle, src image.Image, sp image.Point, op Op)](#Draw)
    * [func DrawMask(dst Image, r image.Rectangle, src image.Image, sp image.Point, mask image.Image, mp image.Point, op Op)](#DrawMask)
    * [func TestClip(t *testing.T)](#TestClip)
    * [func TestDraw(t *testing.T)](#TestDraw)
    * [func TestDrawOverlap(t *testing.T)](#TestDrawOverlap)
    * [func TestFill(t *testing.T)](#TestFill)
    * [func TestFloydSteinbergCheckerboard(t *testing.T)](#TestFloydSteinbergCheckerboard)
    * [func TestNonZeroSrcPt(t *testing.T)](#TestNonZeroSrcPt)
    * [func TestPaletted(t *testing.T)](#TestPaletted)
    * [func TestSqDiff(t *testing.T)](#TestSqDiff)
    * [func bench(b *testing.B, dcm, scm, mcm color.Model, op Op)](#bench)
    * [func clamp(i int32) int32](#clamp)
    * [func clip(dst Image, r *image.Rectangle, src image.Image, sp *image.Point, mask image.Image, mp *image.Point)](#clip)
    * [func drawCMYK(dst *image.RGBA, r image.Rectangle, src *image.CMYK, sp image.Point)](#drawCMYK)
    * [func drawCopyOver(dst *image.RGBA, r image.Rectangle, src *image.RGBA, sp image.Point)](#drawCopyOver)
    * [func drawCopySrc(dst *image.RGBA, r image.Rectangle, src *image.RGBA, sp image.Point)](#drawCopySrc)
    * [func drawFillOver(dst *image.RGBA, r image.Rectangle, sr, sg, sb, sa uint32)](#drawFillOver)
    * [func drawFillSrc(dst *image.RGBA, r image.Rectangle, sr, sg, sb, sa uint32)](#drawFillSrc)
    * [func drawGlyphOver(dst *image.RGBA, r image.Rectangle, src *image.Uniform, mask *image.Alpha, mp image.Point)](#drawGlyphOver)
    * [func drawGray(dst *image.RGBA, r image.Rectangle, src *image.Gray, sp image.Point)](#drawGray)
    * [func drawNRGBAOver(dst *image.RGBA, r image.Rectangle, src *image.NRGBA, sp image.Point)](#drawNRGBAOver)
    * [func drawNRGBASrc(dst *image.RGBA, r image.Rectangle, src *image.NRGBA, sp image.Point)](#drawNRGBASrc)
    * [func drawPaletted(dst Image, r image.Rectangle, src image.Image, sp image.Point, floydSteinberg bool)](#drawPaletted)
    * [func drawRGBA(dst *image.RGBA, r image.Rectangle, src image.Image, sp image.Point, mask image.Image, mp image.Point, op Op)](#drawRGBA)
    * [func eq(c0, c1 color.Color) bool](#eq)
    * [func fillAlpha(alpha int) image.Image](#fillAlpha)
    * [func fillBlue(alpha int) image.Image](#fillBlue)
    * [func makeGolden(dst image.Image, r image.Rectangle, src image.Image, sp image.Point, mask image.Image, mp image.Point, op Op) image.Image](#makeGolden)
    * [func processBackward(dst image.Image, r image.Rectangle, src image.Image, sp image.Point) bool](#processBackward)
    * [func sqDiff(x, y int32) uint32](#sqDiff)
    * [func vgradAlpha(alpha int) image.Image](#vgradAlpha)
    * [func vgradCr() image.Image](#vgradCr)
    * [func vgradGray() image.Image](#vgradGray)
    * [func vgradGreen(alpha int) image.Image](#vgradGreen)
    * [func vgradGreenNRGBA(alpha int) image.Image](#vgradGreenNRGBA)
    * [func vgradMagenta() image.Image](#vgradMagenta)


## <a id="const" href="#const">Constants</a>

```
tags: [package]
```

### <a id="Over" href="#Over">const Over</a>

```
searchKey: draw.Over
tags: [constant number]
```

```Go
const Over Op = iota
```

Over specifies `(src in mask) over dst'. 

### <a id="Src" href="#Src">const Src</a>

```
searchKey: draw.Src
tags: [constant number]
```

```Go
const Src
```

Src specifies `src in mask'. 

### <a id="dsth" href="#dsth">const dsth</a>

```
searchKey: draw.dsth
tags: [constant number private]
```

```Go
const dstw, dsth = 640, 480
```

### <a id="dstw" href="#dstw">const dstw</a>

```
searchKey: draw.dstw
tags: [constant number private]
```

```Go
const dstw, dsth = 640, 480
```

### <a id="m" href="#m">const m</a>

```
searchKey: draw.m
tags: [constant number private]
```

```Go
const m = 1<<16 - 1
```

m is the maximum color value returned by image.Color.RGBA. 

### <a id="srch" href="#srch">const srch</a>

```
searchKey: draw.srch
tags: [constant number private]
```

```Go
const srcw, srch = 400, 300
```

### <a id="srcw" href="#srcw">const srcw</a>

```
searchKey: draw.srcw
tags: [constant number private]
```

```Go
const srcw, srch = 400, 300
```

## <a id="var" href="#var">Variables</a>

```
tags: [package]
```

### <a id="FloydSteinberg" href="#FloydSteinberg">var FloydSteinberg</a>

```
searchKey: draw.FloydSteinberg
tags: [variable interface]
```

```Go
var FloydSteinberg Drawer = floydSteinberg{}
```

FloydSteinberg is a Drawer that is the Src Op with Floyd-Steinberg error diffusion. 

### <a id="clipTests" href="#clipTests">var clipTests</a>

```
searchKey: draw.clipTests
tags: [variable array struct private]
```

```Go
var clipTests = ...
```

### <a id="drawTests" href="#drawTests">var drawTests</a>

```
searchKey: draw.drawTests
tags: [variable array struct private]
```

```Go
var drawTests = ...
```

### <a id="palette" href="#palette">var palette</a>

```
searchKey: draw.palette
tags: [variable array interface private]
```

```Go
var palette = color.Palette{
	color.Black,
	color.White,
}
```

## <a id="type" href="#type">Types</a>

```
tags: [package]
```

### <a id="Drawer" href="#Drawer">type Drawer interface</a>

```
searchKey: draw.Drawer
tags: [interface]
```

```Go
type Drawer interface {
	// Draw aligns r.Min in dst with sp in src and then replaces the
	// rectangle r in dst with the result of drawing src on dst.
	Draw(dst Image, r image.Rectangle, src image.Image, sp image.Point)
}
```

Drawer contains the Draw method. 

### <a id="Image" href="#Image">type Image interface</a>

```
searchKey: draw.Image
tags: [interface]
```

```Go
type Image interface {
	image.Image
	Set(x, y int, c color.Color)
}
```

Image is an image.Image with a Set method to change a single pixel. 

#### <a id="gradYellow" href="#gradYellow">func gradYellow(alpha int) Image</a>

```
searchKey: draw.gradYellow
tags: [method private]
```

```Go
func gradYellow(alpha int) Image
```

#### <a id="hgradRed" href="#hgradRed">func hgradRed(alpha int) Image</a>

```
searchKey: draw.hgradRed
tags: [method private]
```

```Go
func hgradRed(alpha int) Image
```

### <a id="Op" href="#Op">type Op int</a>

```
searchKey: draw.Op
tags: [number]
```

```Go
type Op int
```

Op is a Porter-Duff compositing operator. 

#### <a id="Op.Draw" href="#Op.Draw">func (op Op) Draw(dst Image, r image.Rectangle, src image.Image, sp image.Point)</a>

```
searchKey: draw.Op.Draw
tags: [method]
```

```Go
func (op Op) Draw(dst Image, r image.Rectangle, src image.Image, sp image.Point)
```

Draw implements the Drawer interface by calling the Draw function with this Op. 

### <a id="Quantizer" href="#Quantizer">type Quantizer interface</a>

```
searchKey: draw.Quantizer
tags: [interface]
```

```Go
type Quantizer interface {
	// Quantize appends up to cap(p) - len(p) colors to p and returns the
	// updated palette suitable for converting m to a paletted image.
	Quantize(p color.Palette, m image.Image) color.Palette
}
```

Quantizer produces a palette for an image. 

### <a id="RGBA64Image" href="#RGBA64Image">type RGBA64Image interface</a>

```
searchKey: draw.RGBA64Image
tags: [interface]
```

```Go
type RGBA64Image interface {
	image.RGBA64Image
	Set(x, y int, c color.Color)
	SetRGBA64(x, y int, c color.RGBA64)
}
```

RGBA64Image extends both the Image and image.RGBA64Image interfaces with a SetRGBA64 method to change a single pixel. SetRGBA64 is equivalent to calling Set, but it can avoid allocations from converting concrete color types to the color.Color interface type. 

### <a id="clipTest" href="#clipTest">type clipTest struct</a>

```
searchKey: draw.clipTest
tags: [struct private]
```

```Go
type clipTest struct {
	desc          string
	r, dr, sr, mr image.Rectangle
	sp, mp        image.Point
	nilMask       bool
	r0            image.Rectangle
	sp0, mp0      image.Point
}
```

### <a id="drawTest" href="#drawTest">type drawTest struct</a>

```
searchKey: draw.drawTest
tags: [struct private]
```

```Go
type drawTest struct {
	desc     string
	src      image.Image
	mask     image.Image
	op       Op
	expected color.Color
}
```

### <a id="embeddedPaletted" href="#embeddedPaletted">type embeddedPaletted struct</a>

```
searchKey: draw.embeddedPaletted
tags: [struct private]
```

```Go
type embeddedPaletted struct {
	*image.Paletted
}
```

embeddedPaletted is an Image that behaves like an *image.Paletted but whose type is not *image.Paletted. 

### <a id="floydSteinberg" href="#floydSteinberg">type floydSteinberg struct{}</a>

```
searchKey: draw.floydSteinberg
tags: [struct private]
```

```Go
type floydSteinberg struct{}
```

#### <a id="floydSteinberg.Draw" href="#floydSteinberg.Draw">func (floydSteinberg) Draw(dst Image, r image.Rectangle, src image.Image, sp image.Point)</a>

```
searchKey: draw.floydSteinberg.Draw
tags: [method private]
```

```Go
func (floydSteinberg) Draw(dst Image, r image.Rectangle, src image.Image, sp image.Point)
```

## <a id="func" href="#func">Functions</a>

```
tags: [package]
```

### <a id="BenchmarkCMYK" href="#BenchmarkCMYK">func BenchmarkCMYK(b *testing.B)</a>

```
searchKey: draw.BenchmarkCMYK
tags: [method private benchmark]
```

```Go
func BenchmarkCMYK(b *testing.B)
```

### <a id="BenchmarkCopyOver" href="#BenchmarkCopyOver">func BenchmarkCopyOver(b *testing.B)</a>

```
searchKey: draw.BenchmarkCopyOver
tags: [method private benchmark]
```

```Go
func BenchmarkCopyOver(b *testing.B)
```

### <a id="BenchmarkCopySrc" href="#BenchmarkCopySrc">func BenchmarkCopySrc(b *testing.B)</a>

```
searchKey: draw.BenchmarkCopySrc
tags: [method private benchmark]
```

```Go
func BenchmarkCopySrc(b *testing.B)
```

### <a id="BenchmarkFillOver" href="#BenchmarkFillOver">func BenchmarkFillOver(b *testing.B)</a>

```
searchKey: draw.BenchmarkFillOver
tags: [method private benchmark]
```

```Go
func BenchmarkFillOver(b *testing.B)
```

### <a id="BenchmarkFillSrc" href="#BenchmarkFillSrc">func BenchmarkFillSrc(b *testing.B)</a>

```
searchKey: draw.BenchmarkFillSrc
tags: [method private benchmark]
```

```Go
func BenchmarkFillSrc(b *testing.B)
```

### <a id="BenchmarkGenericMaskOver" href="#BenchmarkGenericMaskOver">func BenchmarkGenericMaskOver(b *testing.B)</a>

```
searchKey: draw.BenchmarkGenericMaskOver
tags: [method private benchmark]
```

```Go
func BenchmarkGenericMaskOver(b *testing.B)
```

### <a id="BenchmarkGenericMaskSrc" href="#BenchmarkGenericMaskSrc">func BenchmarkGenericMaskSrc(b *testing.B)</a>

```
searchKey: draw.BenchmarkGenericMaskSrc
tags: [method private benchmark]
```

```Go
func BenchmarkGenericMaskSrc(b *testing.B)
```

### <a id="BenchmarkGenericOver" href="#BenchmarkGenericOver">func BenchmarkGenericOver(b *testing.B)</a>

```
searchKey: draw.BenchmarkGenericOver
tags: [method private benchmark]
```

```Go
func BenchmarkGenericOver(b *testing.B)
```

### <a id="BenchmarkGenericSrc" href="#BenchmarkGenericSrc">func BenchmarkGenericSrc(b *testing.B)</a>

```
searchKey: draw.BenchmarkGenericSrc
tags: [method private benchmark]
```

```Go
func BenchmarkGenericSrc(b *testing.B)
```

### <a id="BenchmarkGlyphOver" href="#BenchmarkGlyphOver">func BenchmarkGlyphOver(b *testing.B)</a>

```
searchKey: draw.BenchmarkGlyphOver
tags: [method private benchmark]
```

```Go
func BenchmarkGlyphOver(b *testing.B)
```

### <a id="BenchmarkGray" href="#BenchmarkGray">func BenchmarkGray(b *testing.B)</a>

```
searchKey: draw.BenchmarkGray
tags: [method private benchmark]
```

```Go
func BenchmarkGray(b *testing.B)
```

### <a id="BenchmarkNRGBAOver" href="#BenchmarkNRGBAOver">func BenchmarkNRGBAOver(b *testing.B)</a>

```
searchKey: draw.BenchmarkNRGBAOver
tags: [method private benchmark]
```

```Go
func BenchmarkNRGBAOver(b *testing.B)
```

### <a id="BenchmarkNRGBASrc" href="#BenchmarkNRGBASrc">func BenchmarkNRGBASrc(b *testing.B)</a>

```
searchKey: draw.BenchmarkNRGBASrc
tags: [method private benchmark]
```

```Go
func BenchmarkNRGBASrc(b *testing.B)
```

### <a id="BenchmarkPalettedFill" href="#BenchmarkPalettedFill">func BenchmarkPalettedFill(b *testing.B)</a>

```
searchKey: draw.BenchmarkPalettedFill
tags: [method private benchmark]
```

```Go
func BenchmarkPalettedFill(b *testing.B)
```

### <a id="BenchmarkPalettedRGBA" href="#BenchmarkPalettedRGBA">func BenchmarkPalettedRGBA(b *testing.B)</a>

```
searchKey: draw.BenchmarkPalettedRGBA
tags: [method private benchmark]
```

```Go
func BenchmarkPalettedRGBA(b *testing.B)
```

### <a id="BenchmarkRGBA" href="#BenchmarkRGBA">func BenchmarkRGBA(b *testing.B)</a>

```
searchKey: draw.BenchmarkRGBA
tags: [method private benchmark]
```

```Go
func BenchmarkRGBA(b *testing.B)
```

### <a id="BenchmarkYCbCr" href="#BenchmarkYCbCr">func BenchmarkYCbCr(b *testing.B)</a>

```
searchKey: draw.BenchmarkYCbCr
tags: [method private benchmark]
```

```Go
func BenchmarkYCbCr(b *testing.B)
```

### <a id="Draw" href="#Draw">func Draw(dst Image, r image.Rectangle, src image.Image, sp image.Point, op Op)</a>

```
searchKey: draw.Draw
tags: [method]
```

```Go
func Draw(dst Image, r image.Rectangle, src image.Image, sp image.Point, op Op)
```

Draw calls DrawMask with a nil mask. 

### <a id="DrawMask" href="#DrawMask">func DrawMask(dst Image, r image.Rectangle, src image.Image, sp image.Point, mask image.Image, mp image.Point, op Op)</a>

```
searchKey: draw.DrawMask
tags: [method]
```

```Go
func DrawMask(dst Image, r image.Rectangle, src image.Image, sp image.Point, mask image.Image, mp image.Point, op Op)
```

DrawMask aligns r.Min in dst with sp in src and mp in mask and then replaces the rectangle r in dst with the result of a Porter-Duff composition. A nil mask is treated as opaque. 

### <a id="TestClip" href="#TestClip">func TestClip(t *testing.T)</a>

```
searchKey: draw.TestClip
tags: [method private test]
```

```Go
func TestClip(t *testing.T)
```

### <a id="TestDraw" href="#TestDraw">func TestDraw(t *testing.T)</a>

```
searchKey: draw.TestDraw
tags: [method private test]
```

```Go
func TestDraw(t *testing.T)
```

### <a id="TestDrawOverlap" href="#TestDrawOverlap">func TestDrawOverlap(t *testing.T)</a>

```
searchKey: draw.TestDrawOverlap
tags: [method private test]
```

```Go
func TestDrawOverlap(t *testing.T)
```

### <a id="TestFill" href="#TestFill">func TestFill(t *testing.T)</a>

```
searchKey: draw.TestFill
tags: [method private test]
```

```Go
func TestFill(t *testing.T)
```

### <a id="TestFloydSteinbergCheckerboard" href="#TestFloydSteinbergCheckerboard">func TestFloydSteinbergCheckerboard(t *testing.T)</a>

```
searchKey: draw.TestFloydSteinbergCheckerboard
tags: [method private test]
```

```Go
func TestFloydSteinbergCheckerboard(t *testing.T)
```

TestFloydSteinbergCheckerboard tests that the result of Floyd-Steinberg error diffusion of a uniform 50% gray source image with a black-and-white palette is a checkerboard pattern. 

### <a id="TestNonZeroSrcPt" href="#TestNonZeroSrcPt">func TestNonZeroSrcPt(t *testing.T)</a>

```
searchKey: draw.TestNonZeroSrcPt
tags: [method private test]
```

```Go
func TestNonZeroSrcPt(t *testing.T)
```

TestNonZeroSrcPt checks drawing with a non-zero src point parameter. 

### <a id="TestPaletted" href="#TestPaletted">func TestPaletted(t *testing.T)</a>

```
searchKey: draw.TestPaletted
tags: [method private test]
```

```Go
func TestPaletted(t *testing.T)
```

TestPaletted tests that the drawPaletted function behaves the same regardless of whether dst is an *image.Paletted. 

### <a id="TestSqDiff" href="#TestSqDiff">func TestSqDiff(t *testing.T)</a>

```
searchKey: draw.TestSqDiff
tags: [method private test]
```

```Go
func TestSqDiff(t *testing.T)
```

### <a id="bench" href="#bench">func bench(b *testing.B, dcm, scm, mcm color.Model, op Op)</a>

```
searchKey: draw.bench
tags: [method private]
```

```Go
func bench(b *testing.B, dcm, scm, mcm color.Model, op Op)
```

bench benchmarks drawing src and mask images onto a dst image with the given op and the color models to create those images from. The created images' pixels are initialized to non-zero values. 

### <a id="clamp" href="#clamp">func clamp(i int32) int32</a>

```
searchKey: draw.clamp
tags: [method private]
```

```Go
func clamp(i int32) int32
```

clamp clamps i to the interval [0, 0xffff]. 

### <a id="clip" href="#clip">func clip(dst Image, r *image.Rectangle, src image.Image, sp *image.Point, mask image.Image, mp *image.Point)</a>

```
searchKey: draw.clip
tags: [method private]
```

```Go
func clip(dst Image, r *image.Rectangle, src image.Image, sp *image.Point, mask image.Image, mp *image.Point)
```

clip clips r against each image's bounds (after translating into the destination image's coordinate space) and shifts the points sp and mp by the same amount as the change in r.Min. 

### <a id="drawCMYK" href="#drawCMYK">func drawCMYK(dst *image.RGBA, r image.Rectangle, src *image.CMYK, sp image.Point)</a>

```
searchKey: draw.drawCMYK
tags: [method private]
```

```Go
func drawCMYK(dst *image.RGBA, r image.Rectangle, src *image.CMYK, sp image.Point)
```

### <a id="drawCopyOver" href="#drawCopyOver">func drawCopyOver(dst *image.RGBA, r image.Rectangle, src *image.RGBA, sp image.Point)</a>

```
searchKey: draw.drawCopyOver
tags: [method private]
```

```Go
func drawCopyOver(dst *image.RGBA, r image.Rectangle, src *image.RGBA, sp image.Point)
```

### <a id="drawCopySrc" href="#drawCopySrc">func drawCopySrc(dst *image.RGBA, r image.Rectangle, src *image.RGBA, sp image.Point)</a>

```
searchKey: draw.drawCopySrc
tags: [method private]
```

```Go
func drawCopySrc(dst *image.RGBA, r image.Rectangle, src *image.RGBA, sp image.Point)
```

### <a id="drawFillOver" href="#drawFillOver">func drawFillOver(dst *image.RGBA, r image.Rectangle, sr, sg, sb, sa uint32)</a>

```
searchKey: draw.drawFillOver
tags: [method private]
```

```Go
func drawFillOver(dst *image.RGBA, r image.Rectangle, sr, sg, sb, sa uint32)
```

### <a id="drawFillSrc" href="#drawFillSrc">func drawFillSrc(dst *image.RGBA, r image.Rectangle, sr, sg, sb, sa uint32)</a>

```
searchKey: draw.drawFillSrc
tags: [method private]
```

```Go
func drawFillSrc(dst *image.RGBA, r image.Rectangle, sr, sg, sb, sa uint32)
```

### <a id="drawGlyphOver" href="#drawGlyphOver">func drawGlyphOver(dst *image.RGBA, r image.Rectangle, src *image.Uniform, mask *image.Alpha, mp image.Point)</a>

```
searchKey: draw.drawGlyphOver
tags: [method private]
```

```Go
func drawGlyphOver(dst *image.RGBA, r image.Rectangle, src *image.Uniform, mask *image.Alpha, mp image.Point)
```

### <a id="drawGray" href="#drawGray">func drawGray(dst *image.RGBA, r image.Rectangle, src *image.Gray, sp image.Point)</a>

```
searchKey: draw.drawGray
tags: [method private]
```

```Go
func drawGray(dst *image.RGBA, r image.Rectangle, src *image.Gray, sp image.Point)
```

### <a id="drawNRGBAOver" href="#drawNRGBAOver">func drawNRGBAOver(dst *image.RGBA, r image.Rectangle, src *image.NRGBA, sp image.Point)</a>

```
searchKey: draw.drawNRGBAOver
tags: [method private]
```

```Go
func drawNRGBAOver(dst *image.RGBA, r image.Rectangle, src *image.NRGBA, sp image.Point)
```

### <a id="drawNRGBASrc" href="#drawNRGBASrc">func drawNRGBASrc(dst *image.RGBA, r image.Rectangle, src *image.NRGBA, sp image.Point)</a>

```
searchKey: draw.drawNRGBASrc
tags: [method private]
```

```Go
func drawNRGBASrc(dst *image.RGBA, r image.Rectangle, src *image.NRGBA, sp image.Point)
```

### <a id="drawPaletted" href="#drawPaletted">func drawPaletted(dst Image, r image.Rectangle, src image.Image, sp image.Point, floydSteinberg bool)</a>

```
searchKey: draw.drawPaletted
tags: [method private]
```

```Go
func drawPaletted(dst Image, r image.Rectangle, src image.Image, sp image.Point, floydSteinberg bool)
```

### <a id="drawRGBA" href="#drawRGBA">func drawRGBA(dst *image.RGBA, r image.Rectangle, src image.Image, sp image.Point, mask image.Image, mp image.Point, op Op)</a>

```
searchKey: draw.drawRGBA
tags: [method private]
```

```Go
func drawRGBA(dst *image.RGBA, r image.Rectangle, src image.Image, sp image.Point, mask image.Image, mp image.Point, op Op)
```

### <a id="eq" href="#eq">func eq(c0, c1 color.Color) bool</a>

```
searchKey: draw.eq
tags: [method private]
```

```Go
func eq(c0, c1 color.Color) bool
```

### <a id="fillAlpha" href="#fillAlpha">func fillAlpha(alpha int) image.Image</a>

```
searchKey: draw.fillAlpha
tags: [method private]
```

```Go
func fillAlpha(alpha int) image.Image
```

### <a id="fillBlue" href="#fillBlue">func fillBlue(alpha int) image.Image</a>

```
searchKey: draw.fillBlue
tags: [method private]
```

```Go
func fillBlue(alpha int) image.Image
```

### <a id="makeGolden" href="#makeGolden">func makeGolden(dst image.Image, r image.Rectangle, src image.Image, sp image.Point, mask image.Image, mp image.Point, op Op) image.Image</a>

```
searchKey: draw.makeGolden
tags: [method private]
```

```Go
func makeGolden(dst image.Image, r image.Rectangle, src image.Image, sp image.Point, mask image.Image, mp image.Point, op Op) image.Image
```

### <a id="processBackward" href="#processBackward">func processBackward(dst image.Image, r image.Rectangle, src image.Image, sp image.Point) bool</a>

```
searchKey: draw.processBackward
tags: [method private]
```

```Go
func processBackward(dst image.Image, r image.Rectangle, src image.Image, sp image.Point) bool
```

### <a id="sqDiff" href="#sqDiff">func sqDiff(x, y int32) uint32</a>

```
searchKey: draw.sqDiff
tags: [method private]
```

```Go
func sqDiff(x, y int32) uint32
```

sqDiff returns the squared-difference of x and y, shifted by 2 so that adding four of those won't overflow a uint32. 

x and y are both assumed to be in the range [0, 0xffff]. 

### <a id="vgradAlpha" href="#vgradAlpha">func vgradAlpha(alpha int) image.Image</a>

```
searchKey: draw.vgradAlpha
tags: [method private]
```

```Go
func vgradAlpha(alpha int) image.Image
```

### <a id="vgradCr" href="#vgradCr">func vgradCr() image.Image</a>

```
searchKey: draw.vgradCr
tags: [function private]
```

```Go
func vgradCr() image.Image
```

### <a id="vgradGray" href="#vgradGray">func vgradGray() image.Image</a>

```
searchKey: draw.vgradGray
tags: [function private]
```

```Go
func vgradGray() image.Image
```

### <a id="vgradGreen" href="#vgradGreen">func vgradGreen(alpha int) image.Image</a>

```
searchKey: draw.vgradGreen
tags: [method private]
```

```Go
func vgradGreen(alpha int) image.Image
```

### <a id="vgradGreenNRGBA" href="#vgradGreenNRGBA">func vgradGreenNRGBA(alpha int) image.Image</a>

```
searchKey: draw.vgradGreenNRGBA
tags: [method private]
```

```Go
func vgradGreenNRGBA(alpha int) image.Image
```

### <a id="vgradMagenta" href="#vgradMagenta">func vgradMagenta() image.Image</a>

```
searchKey: draw.vgradMagenta
tags: [function private]
```

```Go
func vgradMagenta() image.Image
```

