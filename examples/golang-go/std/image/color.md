# Package color

Package color implements a basic color library. 

## Index

* Subpages
  * [std/image/color/palette](color/palette.md)
* [Variables](#var)
    * [var RGBAModel](#RGBAModel)
    * [var RGBA64Model](#RGBA64Model)
    * [var NRGBAModel](#NRGBAModel)
    * [var NRGBA64Model](#NRGBA64Model)
    * [var AlphaModel](#AlphaModel)
    * [var Alpha16Model](#Alpha16Model)
    * [var GrayModel](#GrayModel)
    * [var Gray16Model](#Gray16Model)
    * [var Black](#Black)
    * [var White](#White)
    * [var Transparent](#Transparent)
    * [var Opaque](#Opaque)
    * [var YCbCrModel](#YCbCrModel)
    * [var NYCbCrAModel](#NYCbCrAModel)
    * [var CMYKModel](#CMYKModel)
    * [var sink8](#sink8)
    * [var sink32](#sink32)
* [Types](#type)
    * [type Color interface](#Color)
        * [func rgbaModel(c Color) Color](#rgbaModel)
        * [func rgba64Model(c Color) Color](#rgba64Model)
        * [func nrgbaModel(c Color) Color](#nrgbaModel)
        * [func nrgba64Model(c Color) Color](#nrgba64Model)
        * [func alphaModel(c Color) Color](#alphaModel)
        * [func alpha16Model(c Color) Color](#alpha16Model)
        * [func grayModel(c Color) Color](#grayModel)
        * [func gray16Model(c Color) Color](#gray16Model)
        * [func yCbCrModel(c Color) Color](#yCbCrModel)
        * [func nYCbCrAModel(c Color) Color](#nYCbCrAModel)
        * [func cmykModel(c Color) Color](#cmykModel)
    * [type RGBA struct](#RGBA)
        * [func (c RGBA) RGBA() (r, g, b, a uint32)](#RGBA.RGBA)
    * [type RGBA64 struct](#RGBA64)
        * [func (c RGBA64) RGBA() (r, g, b, a uint32)](#RGBA64.RGBA)
    * [type NRGBA struct](#NRGBA)
        * [func (c NRGBA) RGBA() (r, g, b, a uint32)](#NRGBA.RGBA)
    * [type NRGBA64 struct](#NRGBA64)
        * [func (c NRGBA64) RGBA() (r, g, b, a uint32)](#NRGBA64.RGBA)
    * [type Alpha struct](#Alpha)
        * [func (c Alpha) RGBA() (r, g, b, a uint32)](#Alpha.RGBA)
    * [type Alpha16 struct](#Alpha16)
        * [func (c Alpha16) RGBA() (r, g, b, a uint32)](#Alpha16.RGBA)
    * [type Gray struct](#Gray)
        * [func (c Gray) RGBA() (r, g, b, a uint32)](#Gray.RGBA)
    * [type Gray16 struct](#Gray16)
        * [func (c Gray16) RGBA() (r, g, b, a uint32)](#Gray16.RGBA)
    * [type Model interface](#Model)
        * [func ModelFunc(f func(Color) Color) Model](#ModelFunc)
    * [type modelFunc struct](#modelFunc)
        * [func (m *modelFunc) Convert(c Color) Color](#modelFunc.Convert)
    * [type Palette []color.Color](#Palette)
        * [func (p Palette) Convert(c Color) Color](#Palette.Convert)
        * [func (p Palette) Index(c Color) int](#Palette.Index)
    * [type YCbCr struct](#YCbCr)
        * [func (c YCbCr) RGBA() (uint32, uint32, uint32, uint32)](#YCbCr.RGBA)
    * [type NYCbCrA struct](#NYCbCrA)
        * [func (c NYCbCrA) RGBA() (uint32, uint32, uint32, uint32)](#NYCbCrA.RGBA)
    * [type CMYK struct](#CMYK)
        * [func (c CMYK) RGBA() (uint32, uint32, uint32, uint32)](#CMYK.RGBA)
* [Functions](#func)
    * [func sqDiff(x, y uint32) uint32](#sqDiff)
    * [func RGBToYCbCr(r, g, b uint8) (uint8, uint8, uint8)](#RGBToYCbCr)
    * [func YCbCrToRGB(y, cb, cr uint8) (uint8, uint8, uint8)](#YCbCrToRGB)
    * [func RGBToCMYK(r, g, b uint8) (uint8, uint8, uint8, uint8)](#RGBToCMYK)
    * [func CMYKToRGB(c, m, y, k uint8) (uint8, uint8, uint8)](#CMYKToRGB)
    * [func TestSqDiff(t *testing.T)](#TestSqDiff)
    * [func delta(x, y uint8) uint8](#delta)
    * [func eq(c0, c1 Color) error](#eq)
    * [func TestYCbCrRoundtrip(t *testing.T)](#TestYCbCrRoundtrip)
    * [func TestYCbCrToRGBConsistency(t *testing.T)](#TestYCbCrToRGBConsistency)
    * [func TestYCbCrGray(t *testing.T)](#TestYCbCrGray)
    * [func TestNYCbCrAAlpha(t *testing.T)](#TestNYCbCrAAlpha)
    * [func TestNYCbCrAYCbCr(t *testing.T)](#TestNYCbCrAYCbCr)
    * [func TestCMYKRoundtrip(t *testing.T)](#TestCMYKRoundtrip)
    * [func TestCMYKToRGBConsistency(t *testing.T)](#TestCMYKToRGBConsistency)
    * [func TestCMYKGray(t *testing.T)](#TestCMYKGray)
    * [func TestPalette(t *testing.T)](#TestPalette)
    * [func BenchmarkYCbCrToRGB(b *testing.B)](#BenchmarkYCbCrToRGB)
    * [func BenchmarkRGBToYCbCr(b *testing.B)](#BenchmarkRGBToYCbCr)
    * [func BenchmarkYCbCrToRGBA(b *testing.B)](#BenchmarkYCbCrToRGBA)
    * [func BenchmarkNYCbCrAToRGBA(b *testing.B)](#BenchmarkNYCbCrAToRGBA)


## <a id="var" href="#var">Variables</a>

```
tags: [exported]
```

### <a id="RGBAModel" href="#RGBAModel">var RGBAModel</a>

```
searchKey: color.RGBAModel
tags: [exported]
```

```Go
var RGBAModel Model = ModelFunc(rgbaModel)
```

Models for the standard color types. 

### <a id="RGBA64Model" href="#RGBA64Model">var RGBA64Model</a>

```
searchKey: color.RGBA64Model
tags: [exported]
```

```Go
var RGBA64Model Model = ModelFunc(rgba64Model)
```

Models for the standard color types. 

### <a id="NRGBAModel" href="#NRGBAModel">var NRGBAModel</a>

```
searchKey: color.NRGBAModel
tags: [exported]
```

```Go
var NRGBAModel Model = ModelFunc(nrgbaModel)
```

Models for the standard color types. 

### <a id="NRGBA64Model" href="#NRGBA64Model">var NRGBA64Model</a>

```
searchKey: color.NRGBA64Model
tags: [exported]
```

```Go
var NRGBA64Model Model = ModelFunc(nrgba64Model)
```

Models for the standard color types. 

### <a id="AlphaModel" href="#AlphaModel">var AlphaModel</a>

```
searchKey: color.AlphaModel
tags: [exported]
```

```Go
var AlphaModel Model = ModelFunc(alphaModel)
```

Models for the standard color types. 

### <a id="Alpha16Model" href="#Alpha16Model">var Alpha16Model</a>

```
searchKey: color.Alpha16Model
tags: [exported]
```

```Go
var Alpha16Model Model = ModelFunc(alpha16Model)
```

Models for the standard color types. 

### <a id="GrayModel" href="#GrayModel">var GrayModel</a>

```
searchKey: color.GrayModel
tags: [exported]
```

```Go
var GrayModel Model = ModelFunc(grayModel)
```

Models for the standard color types. 

### <a id="Gray16Model" href="#Gray16Model">var Gray16Model</a>

```
searchKey: color.Gray16Model
tags: [exported]
```

```Go
var Gray16Model Model = ModelFunc(gray16Model)
```

Models for the standard color types. 

### <a id="Black" href="#Black">var Black</a>

```
searchKey: color.Black
tags: [exported]
```

```Go
var Black = Gray16{0}
```

Standard colors. 

### <a id="White" href="#White">var White</a>

```
searchKey: color.White
tags: [exported]
```

```Go
var White = Gray16{0xffff}
```

Standard colors. 

### <a id="Transparent" href="#Transparent">var Transparent</a>

```
searchKey: color.Transparent
tags: [exported]
```

```Go
var Transparent = Alpha16{0}
```

Standard colors. 

### <a id="Opaque" href="#Opaque">var Opaque</a>

```
searchKey: color.Opaque
tags: [exported]
```

```Go
var Opaque = Alpha16{0xffff}
```

Standard colors. 

### <a id="YCbCrModel" href="#YCbCrModel">var YCbCrModel</a>

```
searchKey: color.YCbCrModel
tags: [exported]
```

```Go
var YCbCrModel Model = ModelFunc(yCbCrModel)
```

YCbCrModel is the Model for Y'CbCr colors. 

### <a id="NYCbCrAModel" href="#NYCbCrAModel">var NYCbCrAModel</a>

```
searchKey: color.NYCbCrAModel
tags: [exported]
```

```Go
var NYCbCrAModel Model = ModelFunc(nYCbCrAModel)
```

NYCbCrAModel is the Model for non-alpha-premultiplied Y'CbCr-with-alpha colors. 

### <a id="CMYKModel" href="#CMYKModel">var CMYKModel</a>

```
searchKey: color.CMYKModel
tags: [exported]
```

```Go
var CMYKModel Model = ModelFunc(cmykModel)
```

CMYKModel is the Model for CMYK colors. 

### <a id="sink8" href="#sink8">var sink8</a>

```
searchKey: color.sink8
```

```Go
var sink8 uint8
```

### <a id="sink32" href="#sink32">var sink32</a>

```
searchKey: color.sink32
```

```Go
var sink32 uint32
```

## <a id="type" href="#type">Types</a>

```
tags: [exported]
```

### <a id="Color" href="#Color">type Color interface</a>

```
searchKey: color.Color
tags: [exported]
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

#### <a id="rgbaModel" href="#rgbaModel">func rgbaModel(c Color) Color</a>

```
searchKey: color.rgbaModel
```

```Go
func rgbaModel(c Color) Color
```

#### <a id="rgba64Model" href="#rgba64Model">func rgba64Model(c Color) Color</a>

```
searchKey: color.rgba64Model
```

```Go
func rgba64Model(c Color) Color
```

#### <a id="nrgbaModel" href="#nrgbaModel">func nrgbaModel(c Color) Color</a>

```
searchKey: color.nrgbaModel
```

```Go
func nrgbaModel(c Color) Color
```

#### <a id="nrgba64Model" href="#nrgba64Model">func nrgba64Model(c Color) Color</a>

```
searchKey: color.nrgba64Model
```

```Go
func nrgba64Model(c Color) Color
```

#### <a id="alphaModel" href="#alphaModel">func alphaModel(c Color) Color</a>

```
searchKey: color.alphaModel
```

```Go
func alphaModel(c Color) Color
```

#### <a id="alpha16Model" href="#alpha16Model">func alpha16Model(c Color) Color</a>

```
searchKey: color.alpha16Model
```

```Go
func alpha16Model(c Color) Color
```

#### <a id="grayModel" href="#grayModel">func grayModel(c Color) Color</a>

```
searchKey: color.grayModel
```

```Go
func grayModel(c Color) Color
```

#### <a id="gray16Model" href="#gray16Model">func gray16Model(c Color) Color</a>

```
searchKey: color.gray16Model
```

```Go
func gray16Model(c Color) Color
```

#### <a id="yCbCrModel" href="#yCbCrModel">func yCbCrModel(c Color) Color</a>

```
searchKey: color.yCbCrModel
```

```Go
func yCbCrModel(c Color) Color
```

#### <a id="nYCbCrAModel" href="#nYCbCrAModel">func nYCbCrAModel(c Color) Color</a>

```
searchKey: color.nYCbCrAModel
```

```Go
func nYCbCrAModel(c Color) Color
```

#### <a id="cmykModel" href="#cmykModel">func cmykModel(c Color) Color</a>

```
searchKey: color.cmykModel
```

```Go
func cmykModel(c Color) Color
```

### <a id="RGBA" href="#RGBA">type RGBA struct</a>

```
searchKey: color.RGBA
tags: [exported]
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
tags: [exported]
```

```Go
func (c RGBA) RGBA() (r, g, b, a uint32)
```

### <a id="RGBA64" href="#RGBA64">type RGBA64 struct</a>

```
searchKey: color.RGBA64
tags: [exported]
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
tags: [exported]
```

```Go
func (c RGBA64) RGBA() (r, g, b, a uint32)
```

### <a id="NRGBA" href="#NRGBA">type NRGBA struct</a>

```
searchKey: color.NRGBA
tags: [exported]
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
tags: [exported]
```

```Go
func (c NRGBA) RGBA() (r, g, b, a uint32)
```

### <a id="NRGBA64" href="#NRGBA64">type NRGBA64 struct</a>

```
searchKey: color.NRGBA64
tags: [exported]
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
tags: [exported]
```

```Go
func (c NRGBA64) RGBA() (r, g, b, a uint32)
```

### <a id="Alpha" href="#Alpha">type Alpha struct</a>

```
searchKey: color.Alpha
tags: [exported]
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
tags: [exported]
```

```Go
func (c Alpha) RGBA() (r, g, b, a uint32)
```

### <a id="Alpha16" href="#Alpha16">type Alpha16 struct</a>

```
searchKey: color.Alpha16
tags: [exported]
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
tags: [exported]
```

```Go
func (c Alpha16) RGBA() (r, g, b, a uint32)
```

### <a id="Gray" href="#Gray">type Gray struct</a>

```
searchKey: color.Gray
tags: [exported]
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
tags: [exported]
```

```Go
func (c Gray) RGBA() (r, g, b, a uint32)
```

### <a id="Gray16" href="#Gray16">type Gray16 struct</a>

```
searchKey: color.Gray16
tags: [exported]
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
tags: [exported]
```

```Go
func (c Gray16) RGBA() (r, g, b, a uint32)
```

### <a id="Model" href="#Model">type Model interface</a>

```
searchKey: color.Model
tags: [exported]
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
tags: [exported]
```

```Go
func ModelFunc(f func(Color) Color) Model
```

ModelFunc returns a Model that invokes f to implement the conversion. 

### <a id="modelFunc" href="#modelFunc">type modelFunc struct</a>

```
searchKey: color.modelFunc
```

```Go
type modelFunc struct {
	f func(Color) Color
}
```

#### <a id="modelFunc.Convert" href="#modelFunc.Convert">func (m *modelFunc) Convert(c Color) Color</a>

```
searchKey: color.modelFunc.Convert
```

```Go
func (m *modelFunc) Convert(c Color) Color
```

### <a id="Palette" href="#Palette">type Palette []color.Color</a>

```
searchKey: color.Palette
tags: [exported]
```

```Go
type Palette []Color
```

Palette is a palette of colors. 

#### <a id="Palette.Convert" href="#Palette.Convert">func (p Palette) Convert(c Color) Color</a>

```
searchKey: color.Palette.Convert
tags: [exported]
```

```Go
func (p Palette) Convert(c Color) Color
```

Convert returns the palette color closest to c in Euclidean R,G,B space. 

#### <a id="Palette.Index" href="#Palette.Index">func (p Palette) Index(c Color) int</a>

```
searchKey: color.Palette.Index
tags: [exported]
```

```Go
func (p Palette) Index(c Color) int
```

Index returns the index of the palette color closest to c in Euclidean R,G,B,A space. 

### <a id="YCbCr" href="#YCbCr">type YCbCr struct</a>

```
searchKey: color.YCbCr
tags: [exported]
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
tags: [exported]
```

```Go
func (c YCbCr) RGBA() (uint32, uint32, uint32, uint32)
```

### <a id="NYCbCrA" href="#NYCbCrA">type NYCbCrA struct</a>

```
searchKey: color.NYCbCrA
tags: [exported]
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
tags: [exported]
```

```Go
func (c NYCbCrA) RGBA() (uint32, uint32, uint32, uint32)
```

### <a id="CMYK" href="#CMYK">type CMYK struct</a>

```
searchKey: color.CMYK
tags: [exported]
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
tags: [exported]
```

```Go
func (c CMYK) RGBA() (uint32, uint32, uint32, uint32)
```

## <a id="func" href="#func">Functions</a>

```
tags: [exported]
```

### <a id="sqDiff" href="#sqDiff">func sqDiff(x, y uint32) uint32</a>

```
searchKey: color.sqDiff
```

```Go
func sqDiff(x, y uint32) uint32
```

sqDiff returns the squared-difference of x and y, shifted by 2 so that adding four of those won't overflow a uint32. 

x and y are both assumed to be in the range [0, 0xffff]. 

### <a id="RGBToYCbCr" href="#RGBToYCbCr">func RGBToYCbCr(r, g, b uint8) (uint8, uint8, uint8)</a>

```
searchKey: color.RGBToYCbCr
tags: [exported]
```

```Go
func RGBToYCbCr(r, g, b uint8) (uint8, uint8, uint8)
```

RGBToYCbCr converts an RGB triple to a Y'CbCr triple. 

### <a id="YCbCrToRGB" href="#YCbCrToRGB">func YCbCrToRGB(y, cb, cr uint8) (uint8, uint8, uint8)</a>

```
searchKey: color.YCbCrToRGB
tags: [exported]
```

```Go
func YCbCrToRGB(y, cb, cr uint8) (uint8, uint8, uint8)
```

YCbCrToRGB converts a Y'CbCr triple to an RGB triple. 

### <a id="RGBToCMYK" href="#RGBToCMYK">func RGBToCMYK(r, g, b uint8) (uint8, uint8, uint8, uint8)</a>

```
searchKey: color.RGBToCMYK
tags: [exported]
```

```Go
func RGBToCMYK(r, g, b uint8) (uint8, uint8, uint8, uint8)
```

RGBToCMYK converts an RGB triple to a CMYK quadruple. 

### <a id="CMYKToRGB" href="#CMYKToRGB">func CMYKToRGB(c, m, y, k uint8) (uint8, uint8, uint8)</a>

```
searchKey: color.CMYKToRGB
tags: [exported]
```

```Go
func CMYKToRGB(c, m, y, k uint8) (uint8, uint8, uint8)
```

CMYKToRGB converts a CMYK quadruple to an RGB triple. 

### <a id="TestSqDiff" href="#TestSqDiff">func TestSqDiff(t *testing.T)</a>

```
searchKey: color.TestSqDiff
```

```Go
func TestSqDiff(t *testing.T)
```

### <a id="delta" href="#delta">func delta(x, y uint8) uint8</a>

```
searchKey: color.delta
```

```Go
func delta(x, y uint8) uint8
```

### <a id="eq" href="#eq">func eq(c0, c1 Color) error</a>

```
searchKey: color.eq
```

```Go
func eq(c0, c1 Color) error
```

### <a id="TestYCbCrRoundtrip" href="#TestYCbCrRoundtrip">func TestYCbCrRoundtrip(t *testing.T)</a>

```
searchKey: color.TestYCbCrRoundtrip
```

```Go
func TestYCbCrRoundtrip(t *testing.T)
```

TestYCbCrRoundtrip tests that a subset of RGB space can be converted to YCbCr and back to within 2/256 tolerance. 

### <a id="TestYCbCrToRGBConsistency" href="#TestYCbCrToRGBConsistency">func TestYCbCrToRGBConsistency(t *testing.T)</a>

```
searchKey: color.TestYCbCrToRGBConsistency
```

```Go
func TestYCbCrToRGBConsistency(t *testing.T)
```

TestYCbCrToRGBConsistency tests that calling the RGBA method (16 bit color) then truncating to 8 bits is equivalent to calling the YCbCrToRGB function (8 bit color). 

### <a id="TestYCbCrGray" href="#TestYCbCrGray">func TestYCbCrGray(t *testing.T)</a>

```
searchKey: color.TestYCbCrGray
```

```Go
func TestYCbCrGray(t *testing.T)
```

TestYCbCrGray tests that YCbCr colors are a superset of Gray colors. 

### <a id="TestNYCbCrAAlpha" href="#TestNYCbCrAAlpha">func TestNYCbCrAAlpha(t *testing.T)</a>

```
searchKey: color.TestNYCbCrAAlpha
```

```Go
func TestNYCbCrAAlpha(t *testing.T)
```

TestNYCbCrAAlpha tests that NYCbCrA colors are a superset of Alpha colors. 

### <a id="TestNYCbCrAYCbCr" href="#TestNYCbCrAYCbCr">func TestNYCbCrAYCbCr(t *testing.T)</a>

```
searchKey: color.TestNYCbCrAYCbCr
```

```Go
func TestNYCbCrAYCbCr(t *testing.T)
```

TestNYCbCrAYCbCr tests that NYCbCrA colors are a superset of YCbCr colors. 

### <a id="TestCMYKRoundtrip" href="#TestCMYKRoundtrip">func TestCMYKRoundtrip(t *testing.T)</a>

```
searchKey: color.TestCMYKRoundtrip
```

```Go
func TestCMYKRoundtrip(t *testing.T)
```

TestCMYKRoundtrip tests that a subset of RGB space can be converted to CMYK and back to within 1/256 tolerance. 

### <a id="TestCMYKToRGBConsistency" href="#TestCMYKToRGBConsistency">func TestCMYKToRGBConsistency(t *testing.T)</a>

```
searchKey: color.TestCMYKToRGBConsistency
```

```Go
func TestCMYKToRGBConsistency(t *testing.T)
```

TestCMYKToRGBConsistency tests that calling the RGBA method (16 bit color) then truncating to 8 bits is equivalent to calling the CMYKToRGB function (8 bit color). 

### <a id="TestCMYKGray" href="#TestCMYKGray">func TestCMYKGray(t *testing.T)</a>

```
searchKey: color.TestCMYKGray
```

```Go
func TestCMYKGray(t *testing.T)
```

TestCMYKGray tests that CMYK colors are a superset of Gray colors. 

### <a id="TestPalette" href="#TestPalette">func TestPalette(t *testing.T)</a>

```
searchKey: color.TestPalette
```

```Go
func TestPalette(t *testing.T)
```

### <a id="BenchmarkYCbCrToRGB" href="#BenchmarkYCbCrToRGB">func BenchmarkYCbCrToRGB(b *testing.B)</a>

```
searchKey: color.BenchmarkYCbCrToRGB
```

```Go
func BenchmarkYCbCrToRGB(b *testing.B)
```

### <a id="BenchmarkRGBToYCbCr" href="#BenchmarkRGBToYCbCr">func BenchmarkRGBToYCbCr(b *testing.B)</a>

```
searchKey: color.BenchmarkRGBToYCbCr
```

```Go
func BenchmarkRGBToYCbCr(b *testing.B)
```

### <a id="BenchmarkYCbCrToRGBA" href="#BenchmarkYCbCrToRGBA">func BenchmarkYCbCrToRGBA(b *testing.B)</a>

```
searchKey: color.BenchmarkYCbCrToRGBA
```

```Go
func BenchmarkYCbCrToRGBA(b *testing.B)
```

### <a id="BenchmarkNYCbCrAToRGBA" href="#BenchmarkNYCbCrAToRGBA">func BenchmarkNYCbCrAToRGBA(b *testing.B)</a>

```
searchKey: color.BenchmarkNYCbCrAToRGBA
```

```Go
func BenchmarkNYCbCrAToRGBA(b *testing.B)
```

