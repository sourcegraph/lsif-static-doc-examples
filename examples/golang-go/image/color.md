# Package color

Package color implements a basic color library. 

## Index

* Subpages
  * [image/color/palette](color/palette.md)
* [Variables](#var)
    * [var Alpha16Model](#Alpha16Model)
    * [var AlphaModel](#AlphaModel)
    * [var Black](#Black)
    * [var CMYKModel](#CMYKModel)
    * [var Gray16Model](#Gray16Model)
    * [var GrayModel](#GrayModel)
    * [var NRGBA64Model](#NRGBA64Model)
    * [var NRGBAModel](#NRGBAModel)
    * [var NYCbCrAModel](#NYCbCrAModel)
    * [var Opaque](#Opaque)
    * [var RGBA64Model](#RGBA64Model)
    * [var RGBAModel](#RGBAModel)
    * [var Transparent](#Transparent)
    * [var White](#White)
    * [var YCbCrModel](#YCbCrModel)
    * [var sink32](#sink32)
    * [var sink8](#sink8)
* [Types](#type)
    * [type Alpha struct](#Alpha)
        * [func (c Alpha) RGBA() (r, g, b, a uint32)](#Alpha.RGBA)
    * [type Alpha16 struct](#Alpha16)
        * [func (c Alpha16) RGBA() (r, g, b, a uint32)](#Alpha16.RGBA)
    * [type CMYK struct](#CMYK)
        * [func (c CMYK) RGBA() (uint32, uint32, uint32, uint32)](#CMYK.RGBA)
    * [type Color interface](#Color)
        * [func alpha16Model(c Color) Color](#alpha16Model)
        * [func alphaModel(c Color) Color](#alphaModel)
        * [func cmykModel(c Color) Color](#cmykModel)
        * [func gray16Model(c Color) Color](#gray16Model)
        * [func grayModel(c Color) Color](#grayModel)
        * [func nYCbCrAModel(c Color) Color](#nYCbCrAModel)
        * [func nrgba64Model(c Color) Color](#nrgba64Model)
        * [func nrgbaModel(c Color) Color](#nrgbaModel)
        * [func rgba64Model(c Color) Color](#rgba64Model)
        * [func rgbaModel(c Color) Color](#rgbaModel)
        * [func yCbCrModel(c Color) Color](#yCbCrModel)
    * [type Gray struct](#Gray)
        * [func (c Gray) RGBA() (r, g, b, a uint32)](#Gray.RGBA)
    * [type Gray16 struct](#Gray16)
        * [func (c Gray16) RGBA() (r, g, b, a uint32)](#Gray16.RGBA)
    * [type Model interface](#Model)
        * [func ModelFunc(f func(Color) Color) Model](#ModelFunc)
    * [type NRGBA struct](#NRGBA)
        * [func (c NRGBA) RGBA() (r, g, b, a uint32)](#NRGBA.RGBA)
    * [type NRGBA64 struct](#NRGBA64)
        * [func (c NRGBA64) RGBA() (r, g, b, a uint32)](#NRGBA64.RGBA)
    * [type NYCbCrA struct](#NYCbCrA)
        * [func (c NYCbCrA) RGBA() (uint32, uint32, uint32, uint32)](#NYCbCrA.RGBA)
    * [type Palette []color.Color](#Palette)
        * [func (p Palette) Convert(c Color) Color](#Palette.Convert)
        * [func (p Palette) Index(c Color) int](#Palette.Index)
    * [type RGBA struct](#RGBA)
        * [func (c RGBA) RGBA() (r, g, b, a uint32)](#RGBA.RGBA)
    * [type RGBA64 struct](#RGBA64)
        * [func (c RGBA64) RGBA() (r, g, b, a uint32)](#RGBA64.RGBA)
    * [type YCbCr struct](#YCbCr)
        * [func (c YCbCr) RGBA() (uint32, uint32, uint32, uint32)](#YCbCr.RGBA)
    * [type modelFunc struct](#modelFunc)
        * [func (m *modelFunc) Convert(c Color) Color](#modelFunc.Convert)
* [Functions](#func)
    * [func BenchmarkNYCbCrAToRGBA(b *testing.B)](#BenchmarkNYCbCrAToRGBA)
    * [func BenchmarkRGBToYCbCr(b *testing.B)](#BenchmarkRGBToYCbCr)
    * [func BenchmarkYCbCrToRGB(b *testing.B)](#BenchmarkYCbCrToRGB)
    * [func BenchmarkYCbCrToRGBA(b *testing.B)](#BenchmarkYCbCrToRGBA)
    * [func CMYKToRGB(c, m, y, k uint8) (uint8, uint8, uint8)](#CMYKToRGB)
    * [func RGBToCMYK(r, g, b uint8) (uint8, uint8, uint8, uint8)](#RGBToCMYK)
    * [func RGBToYCbCr(r, g, b uint8) (uint8, uint8, uint8)](#RGBToYCbCr)
    * [func TestCMYKGray(t *testing.T)](#TestCMYKGray)
    * [func TestCMYKRoundtrip(t *testing.T)](#TestCMYKRoundtrip)
    * [func TestCMYKToRGBConsistency(t *testing.T)](#TestCMYKToRGBConsistency)
    * [func TestNYCbCrAAlpha(t *testing.T)](#TestNYCbCrAAlpha)
    * [func TestNYCbCrAYCbCr(t *testing.T)](#TestNYCbCrAYCbCr)
    * [func TestPalette(t *testing.T)](#TestPalette)
    * [func TestSqDiff(t *testing.T)](#TestSqDiff)
    * [func TestYCbCrGray(t *testing.T)](#TestYCbCrGray)
    * [func TestYCbCrRoundtrip(t *testing.T)](#TestYCbCrRoundtrip)
    * [func TestYCbCrToRGBConsistency(t *testing.T)](#TestYCbCrToRGBConsistency)
    * [func YCbCrToRGB(y, cb, cr uint8) (uint8, uint8, uint8)](#YCbCrToRGB)
    * [func delta(x, y uint8) uint8](#delta)
    * [func eq(c0, c1 Color) error](#eq)
    * [func sqDiff(x, y uint32) uint32](#sqDiff)


## <a id="var" href="#var">Variables</a>

```
tags: [package]
```

### <a id="Alpha16Model" href="#Alpha16Model">var Alpha16Model</a>

```
searchKey: color.Alpha16Model
tags: [variable interface]
```

```Go
var Alpha16Model Model = ModelFunc(alpha16Model)
```

Models for the standard color types. 

### <a id="AlphaModel" href="#AlphaModel">var AlphaModel</a>

```
searchKey: color.AlphaModel
tags: [variable interface]
```

```Go
var AlphaModel Model = ModelFunc(alphaModel)
```

Models for the standard color types. 

### <a id="Black" href="#Black">var Black</a>

```
searchKey: color.Black
tags: [variable struct]
```

```Go
var Black = Gray16{0}
```

Standard colors. 

### <a id="CMYKModel" href="#CMYKModel">var CMYKModel</a>

```
searchKey: color.CMYKModel
tags: [variable interface]
```

```Go
var CMYKModel Model = ModelFunc(cmykModel)
```

CMYKModel is the Model for CMYK colors. 

### <a id="Gray16Model" href="#Gray16Model">var Gray16Model</a>

```
searchKey: color.Gray16Model
tags: [variable interface]
```

```Go
var Gray16Model Model = ModelFunc(gray16Model)
```

Models for the standard color types. 

### <a id="GrayModel" href="#GrayModel">var GrayModel</a>

```
searchKey: color.GrayModel
tags: [variable interface]
```

```Go
var GrayModel Model = ModelFunc(grayModel)
```

Models for the standard color types. 

### <a id="NRGBA64Model" href="#NRGBA64Model">var NRGBA64Model</a>

```
searchKey: color.NRGBA64Model
tags: [variable interface]
```

```Go
var NRGBA64Model Model = ModelFunc(nrgba64Model)
```

Models for the standard color types. 

### <a id="NRGBAModel" href="#NRGBAModel">var NRGBAModel</a>

```
searchKey: color.NRGBAModel
tags: [variable interface]
```

```Go
var NRGBAModel Model = ModelFunc(nrgbaModel)
```

Models for the standard color types. 

### <a id="NYCbCrAModel" href="#NYCbCrAModel">var NYCbCrAModel</a>

```
searchKey: color.NYCbCrAModel
tags: [variable interface]
```

```Go
var NYCbCrAModel Model = ModelFunc(nYCbCrAModel)
```

NYCbCrAModel is the Model for non-alpha-premultiplied Y'CbCr-with-alpha colors. 

### <a id="Opaque" href="#Opaque">var Opaque</a>

```
searchKey: color.Opaque
tags: [variable struct]
```

```Go
var Opaque = Alpha16{0xffff}
```

Standard colors. 

### <a id="RGBA64Model" href="#RGBA64Model">var RGBA64Model</a>

```
searchKey: color.RGBA64Model
tags: [variable interface]
```

```Go
var RGBA64Model Model = ModelFunc(rgba64Model)
```

Models for the standard color types. 

### <a id="RGBAModel" href="#RGBAModel">var RGBAModel</a>

```
searchKey: color.RGBAModel
tags: [variable interface]
```

```Go
var RGBAModel Model = ModelFunc(rgbaModel)
```

Models for the standard color types. 

### <a id="Transparent" href="#Transparent">var Transparent</a>

```
searchKey: color.Transparent
tags: [variable struct]
```

```Go
var Transparent = Alpha16{0}
```

Standard colors. 

### <a id="White" href="#White">var White</a>

```
searchKey: color.White
tags: [variable struct]
```

```Go
var White = Gray16{0xffff}
```

Standard colors. 

### <a id="YCbCrModel" href="#YCbCrModel">var YCbCrModel</a>

```
searchKey: color.YCbCrModel
tags: [variable interface]
```

```Go
var YCbCrModel Model = ModelFunc(yCbCrModel)
```

YCbCrModel is the Model for Y'CbCr colors. 

### <a id="sink32" href="#sink32">var sink32</a>

```
searchKey: color.sink32
tags: [variable number private]
```

```Go
var sink32 uint32
```

### <a id="sink8" href="#sink8">var sink8</a>

```
searchKey: color.sink8
tags: [variable number private]
```

```Go
var sink8 uint8
```

## <a id="type" href="#type">Types</a>

```
tags: [package]
```

### <a id="Alpha" href="#Alpha">type Alpha struct</a>

```
searchKey: color.Alpha
tags: [struct]
```

```Go
type Alpha struct {
	A uint8
}
```

Alpha represents an 8-bit alpha color. 

#### <a id="Alpha.RGBA" href="#Alpha.RGBA">func (c Alpha) RGBA() (r, g, b, a uint32)</a>

```
searchKey: color.Alpha.RGBA
tags: [function]
```

```Go
func (c Alpha) RGBA() (r, g, b, a uint32)
```

### <a id="Alpha16" href="#Alpha16">type Alpha16 struct</a>

```
searchKey: color.Alpha16
tags: [struct]
```

```Go
type Alpha16 struct {
	A uint16
}
```

Alpha16 represents a 16-bit alpha color. 

#### <a id="Alpha16.RGBA" href="#Alpha16.RGBA">func (c Alpha16) RGBA() (r, g, b, a uint32)</a>

```
searchKey: color.Alpha16.RGBA
tags: [function]
```

```Go
func (c Alpha16) RGBA() (r, g, b, a uint32)
```

### <a id="CMYK" href="#CMYK">type CMYK struct</a>

```
searchKey: color.CMYK
tags: [struct]
```

```Go
type CMYK struct {
	C, M, Y, K uint8
}
```

CMYK represents a fully opaque CMYK color, having 8 bits for each of cyan, magenta, yellow and black. 

It is not associated with any particular color profile. 

#### <a id="CMYK.RGBA" href="#CMYK.RGBA">func (c CMYK) RGBA() (uint32, uint32, uint32, uint32)</a>

```
searchKey: color.CMYK.RGBA
tags: [function]
```

```Go
func (c CMYK) RGBA() (uint32, uint32, uint32, uint32)
```

### <a id="Color" href="#Color">type Color interface</a>

```
searchKey: color.Color
tags: [interface]
```

```Go
type Color interface {
	// RGBA returns the alpha-premultiplied red, green, blue and alpha values
	// for the color. Each value ranges within [0, 0xffff], but is represented
	// by a uint32 so that multiplying by a blend factor up to 0xffff will not
	// overflow.
	//
	// An alpha-premultiplied color component c has been scaled by alpha (a),
	// so has valid values 0 <= c <= a.
	RGBA() (r, g, b, a uint32)
}
```

Color can convert itself to alpha-premultiplied 16-bits per channel RGBA. The conversion may be lossy. 

#### <a id="alpha16Model" href="#alpha16Model">func alpha16Model(c Color) Color</a>

```
searchKey: color.alpha16Model
tags: [method private]
```

```Go
func alpha16Model(c Color) Color
```

#### <a id="alphaModel" href="#alphaModel">func alphaModel(c Color) Color</a>

```
searchKey: color.alphaModel
tags: [method private]
```

```Go
func alphaModel(c Color) Color
```

#### <a id="cmykModel" href="#cmykModel">func cmykModel(c Color) Color</a>

```
searchKey: color.cmykModel
tags: [method private]
```

```Go
func cmykModel(c Color) Color
```

#### <a id="gray16Model" href="#gray16Model">func gray16Model(c Color) Color</a>

```
searchKey: color.gray16Model
tags: [method private]
```

```Go
func gray16Model(c Color) Color
```

#### <a id="grayModel" href="#grayModel">func grayModel(c Color) Color</a>

```
searchKey: color.grayModel
tags: [method private]
```

```Go
func grayModel(c Color) Color
```

#### <a id="nYCbCrAModel" href="#nYCbCrAModel">func nYCbCrAModel(c Color) Color</a>

```
searchKey: color.nYCbCrAModel
tags: [method private]
```

```Go
func nYCbCrAModel(c Color) Color
```

#### <a id="nrgba64Model" href="#nrgba64Model">func nrgba64Model(c Color) Color</a>

```
searchKey: color.nrgba64Model
tags: [method private]
```

```Go
func nrgba64Model(c Color) Color
```

#### <a id="nrgbaModel" href="#nrgbaModel">func nrgbaModel(c Color) Color</a>

```
searchKey: color.nrgbaModel
tags: [method private]
```

```Go
func nrgbaModel(c Color) Color
```

#### <a id="rgba64Model" href="#rgba64Model">func rgba64Model(c Color) Color</a>

```
searchKey: color.rgba64Model
tags: [method private]
```

```Go
func rgba64Model(c Color) Color
```

#### <a id="rgbaModel" href="#rgbaModel">func rgbaModel(c Color) Color</a>

```
searchKey: color.rgbaModel
tags: [method private]
```

```Go
func rgbaModel(c Color) Color
```

#### <a id="yCbCrModel" href="#yCbCrModel">func yCbCrModel(c Color) Color</a>

```
searchKey: color.yCbCrModel
tags: [method private]
```

```Go
func yCbCrModel(c Color) Color
```

### <a id="Gray" href="#Gray">type Gray struct</a>

```
searchKey: color.Gray
tags: [struct]
```

```Go
type Gray struct {
	Y uint8
}
```

Gray represents an 8-bit grayscale color. 

#### <a id="Gray.RGBA" href="#Gray.RGBA">func (c Gray) RGBA() (r, g, b, a uint32)</a>

```
searchKey: color.Gray.RGBA
tags: [function]
```

```Go
func (c Gray) RGBA() (r, g, b, a uint32)
```

### <a id="Gray16" href="#Gray16">type Gray16 struct</a>

```
searchKey: color.Gray16
tags: [struct]
```

```Go
type Gray16 struct {
	Y uint16
}
```

Gray16 represents a 16-bit grayscale color. 

#### <a id="Gray16.RGBA" href="#Gray16.RGBA">func (c Gray16) RGBA() (r, g, b, a uint32)</a>

```
searchKey: color.Gray16.RGBA
tags: [function]
```

```Go
func (c Gray16) RGBA() (r, g, b, a uint32)
```

### <a id="Model" href="#Model">type Model interface</a>

```
searchKey: color.Model
tags: [interface]
```

```Go
type Model interface {
	Convert(c Color) Color
}
```

Model can convert any Color to one from its own color model. The conversion may be lossy. 

#### <a id="ModelFunc" href="#ModelFunc">func ModelFunc(f func(Color) Color) Model</a>

```
searchKey: color.ModelFunc
tags: [method]
```

```Go
func ModelFunc(f func(Color) Color) Model
```

ModelFunc returns a Model that invokes f to implement the conversion. 

### <a id="NRGBA" href="#NRGBA">type NRGBA struct</a>

```
searchKey: color.NRGBA
tags: [struct]
```

```Go
type NRGBA struct {
	R, G, B, A uint8
}
```

NRGBA represents a non-alpha-premultiplied 32-bit color. 

#### <a id="NRGBA.RGBA" href="#NRGBA.RGBA">func (c NRGBA) RGBA() (r, g, b, a uint32)</a>

```
searchKey: color.NRGBA.RGBA
tags: [function]
```

```Go
func (c NRGBA) RGBA() (r, g, b, a uint32)
```

### <a id="NRGBA64" href="#NRGBA64">type NRGBA64 struct</a>

```
searchKey: color.NRGBA64
tags: [struct]
```

```Go
type NRGBA64 struct {
	R, G, B, A uint16
}
```

NRGBA64 represents a non-alpha-premultiplied 64-bit color, having 16 bits for each of red, green, blue and alpha. 

#### <a id="NRGBA64.RGBA" href="#NRGBA64.RGBA">func (c NRGBA64) RGBA() (r, g, b, a uint32)</a>

```
searchKey: color.NRGBA64.RGBA
tags: [function]
```

```Go
func (c NRGBA64) RGBA() (r, g, b, a uint32)
```

### <a id="NYCbCrA" href="#NYCbCrA">type NYCbCrA struct</a>

```
searchKey: color.NYCbCrA
tags: [struct]
```

```Go
type NYCbCrA struct {
	YCbCr
	A uint8
}
```

NYCbCrA represents a non-alpha-premultiplied Y'CbCr-with-alpha color, having 8 bits each for one luma, two chroma and one alpha component. 

#### <a id="NYCbCrA.RGBA" href="#NYCbCrA.RGBA">func (c NYCbCrA) RGBA() (uint32, uint32, uint32, uint32)</a>

```
searchKey: color.NYCbCrA.RGBA
tags: [function]
```

```Go
func (c NYCbCrA) RGBA() (uint32, uint32, uint32, uint32)
```

### <a id="Palette" href="#Palette">type Palette []color.Color</a>

```
searchKey: color.Palette
tags: [array interface]
```

```Go
type Palette []Color
```

Palette is a palette of colors. 

#### <a id="Palette.Convert" href="#Palette.Convert">func (p Palette) Convert(c Color) Color</a>

```
searchKey: color.Palette.Convert
tags: [method]
```

```Go
func (p Palette) Convert(c Color) Color
```

Convert returns the palette color closest to c in Euclidean R,G,B space. 

#### <a id="Palette.Index" href="#Palette.Index">func (p Palette) Index(c Color) int</a>

```
searchKey: color.Palette.Index
tags: [method]
```

```Go
func (p Palette) Index(c Color) int
```

Index returns the index of the palette color closest to c in Euclidean R,G,B,A space. 

### <a id="RGBA" href="#RGBA">type RGBA struct</a>

```
searchKey: color.RGBA
tags: [struct]
```

```Go
type RGBA struct {
	R, G, B, A uint8
}
```

RGBA represents a traditional 32-bit alpha-premultiplied color, having 8 bits for each of red, green, blue and alpha. 

An alpha-premultiplied color component C has been scaled by alpha (A), so has valid values 0 <= C <= A. 

#### <a id="RGBA.RGBA" href="#RGBA.RGBA">func (c RGBA) RGBA() (r, g, b, a uint32)</a>

```
searchKey: color.RGBA.RGBA
tags: [function]
```

```Go
func (c RGBA) RGBA() (r, g, b, a uint32)
```

### <a id="RGBA64" href="#RGBA64">type RGBA64 struct</a>

```
searchKey: color.RGBA64
tags: [struct]
```

```Go
type RGBA64 struct {
	R, G, B, A uint16
}
```

RGBA64 represents a 64-bit alpha-premultiplied color, having 16 bits for each of red, green, blue and alpha. 

An alpha-premultiplied color component C has been scaled by alpha (A), so has valid values 0 <= C <= A. 

#### <a id="RGBA64.RGBA" href="#RGBA64.RGBA">func (c RGBA64) RGBA() (r, g, b, a uint32)</a>

```
searchKey: color.RGBA64.RGBA
tags: [function]
```

```Go
func (c RGBA64) RGBA() (r, g, b, a uint32)
```

### <a id="YCbCr" href="#YCbCr">type YCbCr struct</a>

```
searchKey: color.YCbCr
tags: [struct]
```

```Go
type YCbCr struct {
	Y, Cb, Cr uint8
}
```

YCbCr represents a fully opaque 24-bit Y'CbCr color, having 8 bits each for one luma and two chroma components. 

JPEG, VP8, the MPEG family and other codecs use this color model. Such codecs often use the terms YUV and Y'CbCr interchangeably, but strictly speaking, the term YUV applies only to analog video signals, and Y' (luma) is Y (luminance) after applying gamma correction. 

Conversion between RGB and Y'CbCr is lossy and there are multiple, slightly different formulae for converting between the two. This package follows the JFIF specification at [https://www.w3.org/Graphics/JPEG/jfif3.pdf](https://www.w3.org/Graphics/JPEG/jfif3.pdf). 

#### <a id="YCbCr.RGBA" href="#YCbCr.RGBA">func (c YCbCr) RGBA() (uint32, uint32, uint32, uint32)</a>

```
searchKey: color.YCbCr.RGBA
tags: [function]
```

```Go
func (c YCbCr) RGBA() (uint32, uint32, uint32, uint32)
```

### <a id="modelFunc" href="#modelFunc">type modelFunc struct</a>

```
searchKey: color.modelFunc
tags: [struct private]
```

```Go
type modelFunc struct {
	f func(Color) Color
}
```

#### <a id="modelFunc.Convert" href="#modelFunc.Convert">func (m *modelFunc) Convert(c Color) Color</a>

```
searchKey: color.modelFunc.Convert
tags: [method private]
```

```Go
func (m *modelFunc) Convert(c Color) Color
```

## <a id="func" href="#func">Functions</a>

```
tags: [package]
```

### <a id="BenchmarkNYCbCrAToRGBA" href="#BenchmarkNYCbCrAToRGBA">func BenchmarkNYCbCrAToRGBA(b *testing.B)</a>

```
searchKey: color.BenchmarkNYCbCrAToRGBA
tags: [method private benchmark]
```

```Go
func BenchmarkNYCbCrAToRGBA(b *testing.B)
```

### <a id="BenchmarkRGBToYCbCr" href="#BenchmarkRGBToYCbCr">func BenchmarkRGBToYCbCr(b *testing.B)</a>

```
searchKey: color.BenchmarkRGBToYCbCr
tags: [method private benchmark]
```

```Go
func BenchmarkRGBToYCbCr(b *testing.B)
```

### <a id="BenchmarkYCbCrToRGB" href="#BenchmarkYCbCrToRGB">func BenchmarkYCbCrToRGB(b *testing.B)</a>

```
searchKey: color.BenchmarkYCbCrToRGB
tags: [method private benchmark]
```

```Go
func BenchmarkYCbCrToRGB(b *testing.B)
```

### <a id="BenchmarkYCbCrToRGBA" href="#BenchmarkYCbCrToRGBA">func BenchmarkYCbCrToRGBA(b *testing.B)</a>

```
searchKey: color.BenchmarkYCbCrToRGBA
tags: [method private benchmark]
```

```Go
func BenchmarkYCbCrToRGBA(b *testing.B)
```

### <a id="CMYKToRGB" href="#CMYKToRGB">func CMYKToRGB(c, m, y, k uint8) (uint8, uint8, uint8)</a>

```
searchKey: color.CMYKToRGB
tags: [method]
```

```Go
func CMYKToRGB(c, m, y, k uint8) (uint8, uint8, uint8)
```

CMYKToRGB converts a CMYK quadruple to an RGB triple. 

### <a id="RGBToCMYK" href="#RGBToCMYK">func RGBToCMYK(r, g, b uint8) (uint8, uint8, uint8, uint8)</a>

```
searchKey: color.RGBToCMYK
tags: [method]
```

```Go
func RGBToCMYK(r, g, b uint8) (uint8, uint8, uint8, uint8)
```

RGBToCMYK converts an RGB triple to a CMYK quadruple. 

### <a id="RGBToYCbCr" href="#RGBToYCbCr">func RGBToYCbCr(r, g, b uint8) (uint8, uint8, uint8)</a>

```
searchKey: color.RGBToYCbCr
tags: [method]
```

```Go
func RGBToYCbCr(r, g, b uint8) (uint8, uint8, uint8)
```

RGBToYCbCr converts an RGB triple to a Y'CbCr triple. 

### <a id="TestCMYKGray" href="#TestCMYKGray">func TestCMYKGray(t *testing.T)</a>

```
searchKey: color.TestCMYKGray
tags: [method private test]
```

```Go
func TestCMYKGray(t *testing.T)
```

TestCMYKGray tests that CMYK colors are a superset of Gray colors. 

### <a id="TestCMYKRoundtrip" href="#TestCMYKRoundtrip">func TestCMYKRoundtrip(t *testing.T)</a>

```
searchKey: color.TestCMYKRoundtrip
tags: [method private test]
```

```Go
func TestCMYKRoundtrip(t *testing.T)
```

TestCMYKRoundtrip tests that a subset of RGB space can be converted to CMYK and back to within 1/256 tolerance. 

### <a id="TestCMYKToRGBConsistency" href="#TestCMYKToRGBConsistency">func TestCMYKToRGBConsistency(t *testing.T)</a>

```
searchKey: color.TestCMYKToRGBConsistency
tags: [method private test]
```

```Go
func TestCMYKToRGBConsistency(t *testing.T)
```

TestCMYKToRGBConsistency tests that calling the RGBA method (16 bit color) then truncating to 8 bits is equivalent to calling the CMYKToRGB function (8 bit color). 

### <a id="TestNYCbCrAAlpha" href="#TestNYCbCrAAlpha">func TestNYCbCrAAlpha(t *testing.T)</a>

```
searchKey: color.TestNYCbCrAAlpha
tags: [method private test]
```

```Go
func TestNYCbCrAAlpha(t *testing.T)
```

TestNYCbCrAAlpha tests that NYCbCrA colors are a superset of Alpha colors. 

### <a id="TestNYCbCrAYCbCr" href="#TestNYCbCrAYCbCr">func TestNYCbCrAYCbCr(t *testing.T)</a>

```
searchKey: color.TestNYCbCrAYCbCr
tags: [method private test]
```

```Go
func TestNYCbCrAYCbCr(t *testing.T)
```

TestNYCbCrAYCbCr tests that NYCbCrA colors are a superset of YCbCr colors. 

### <a id="TestPalette" href="#TestPalette">func TestPalette(t *testing.T)</a>

```
searchKey: color.TestPalette
tags: [method private test]
```

```Go
func TestPalette(t *testing.T)
```

### <a id="TestSqDiff" href="#TestSqDiff">func TestSqDiff(t *testing.T)</a>

```
searchKey: color.TestSqDiff
tags: [method private test]
```

```Go
func TestSqDiff(t *testing.T)
```

### <a id="TestYCbCrGray" href="#TestYCbCrGray">func TestYCbCrGray(t *testing.T)</a>

```
searchKey: color.TestYCbCrGray
tags: [method private test]
```

```Go
func TestYCbCrGray(t *testing.T)
```

TestYCbCrGray tests that YCbCr colors are a superset of Gray colors. 

### <a id="TestYCbCrRoundtrip" href="#TestYCbCrRoundtrip">func TestYCbCrRoundtrip(t *testing.T)</a>

```
searchKey: color.TestYCbCrRoundtrip
tags: [method private test]
```

```Go
func TestYCbCrRoundtrip(t *testing.T)
```

TestYCbCrRoundtrip tests that a subset of RGB space can be converted to YCbCr and back to within 2/256 tolerance. 

### <a id="TestYCbCrToRGBConsistency" href="#TestYCbCrToRGBConsistency">func TestYCbCrToRGBConsistency(t *testing.T)</a>

```
searchKey: color.TestYCbCrToRGBConsistency
tags: [method private test]
```

```Go
func TestYCbCrToRGBConsistency(t *testing.T)
```

TestYCbCrToRGBConsistency tests that calling the RGBA method (16 bit color) then truncating to 8 bits is equivalent to calling the YCbCrToRGB function (8 bit color). 

### <a id="YCbCrToRGB" href="#YCbCrToRGB">func YCbCrToRGB(y, cb, cr uint8) (uint8, uint8, uint8)</a>

```
searchKey: color.YCbCrToRGB
tags: [method]
```

```Go
func YCbCrToRGB(y, cb, cr uint8) (uint8, uint8, uint8)
```

YCbCrToRGB converts a Y'CbCr triple to an RGB triple. 

### <a id="delta" href="#delta">func delta(x, y uint8) uint8</a>

```
searchKey: color.delta
tags: [method private]
```

```Go
func delta(x, y uint8) uint8
```

### <a id="eq" href="#eq">func eq(c0, c1 Color) error</a>

```
searchKey: color.eq
tags: [method private]
```

```Go
func eq(c0, c1 Color) error
```

### <a id="sqDiff" href="#sqDiff">func sqDiff(x, y uint32) uint32</a>

```
searchKey: color.sqDiff
tags: [method private]
```

```Go
func sqDiff(x, y uint32) uint32
```

sqDiff returns the squared-difference of x and y, shifted by 2 so that adding four of those won't overflow a uint32. 

x and y are both assumed to be in the range [0, 0xffff]. 

