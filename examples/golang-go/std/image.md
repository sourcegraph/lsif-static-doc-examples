# Package image

Package image implements a basic 2-D image library. 

The fundamental interface is called Image. An Image contains colors, which are described in the image/color package. 

Values of the Image interface are created either by calling functions such as NewRGBA and NewPaletted, or by calling Decode on an io.Reader containing image data in a format such as GIF, JPEG or PNG. Decoding any particular image format requires the prior registration of a decoder function. Registration is typically automatic as a side effect of initializing that format's package so that, to decode a PNG image, it suffices to have 

```
import _ "image/png"

```
in a program's main package. The _ means to import a package purely for its initialization side effects. 

See "The Go image package" for more details: [https://golang.org/doc/articles/image_package.html](https://golang.org/doc/articles/image_package.html) 

## Index

* Subpages
  * [std/image/internal](image/internal.md)
  * [std/image/color](image/color.md)
  * [std/image/draw](image/draw.md)
  * [std/image/draw_test](image/draw_test.md)
  * [std/image/gif](image/gif.md)
  * [std/image/jpeg](image/jpeg.md)
  * [std/image/png](image/png.md)
  * [std/image/png_test](image/png_test.md)
* [Constants](#const)
    * [const YCbCrSubsampleRatio444](#YCbCrSubsampleRatio444)
    * [const YCbCrSubsampleRatio422](#YCbCrSubsampleRatio422)
    * [const YCbCrSubsampleRatio420](#YCbCrSubsampleRatio420)
    * [const YCbCrSubsampleRatio440](#YCbCrSubsampleRatio440)
    * [const YCbCrSubsampleRatio411](#YCbCrSubsampleRatio411)
    * [const YCbCrSubsampleRatio410](#YCbCrSubsampleRatio410)
* [Variables](#var)
    * [var ErrFormat](#ErrFormat)
    * [var formatsMu](#formatsMu)
    * [var atomicFormats](#atomicFormats)
    * [var ZP](#ZP)
    * [var ZR](#ZR)
    * [var Black](#Black)
    * [var White](#White)
    * [var Transparent](#Transparent)
    * [var Opaque](#Opaque)
    * [var testImages](#testImages)
* [Types](#type)
    * [type format struct](#format)
        * [func sniff(r reader) format](#sniff)
    * [type reader interface](#reader)
        * [func asReader(r io.Reader) reader](#asReader)
    * [type Point struct](#Point)
        * [func Pt(X, Y int) Point](#Pt)
        * [func (p Point) String() string](#Point.String)
        * [func (p Point) Add(q Point) Point](#Point.Add)
        * [func (p Point) Sub(q Point) Point](#Point.Sub)
        * [func (p Point) Mul(k int) Point](#Point.Mul)
        * [func (p Point) Div(k int) Point](#Point.Div)
        * [func (p Point) In(r Rectangle) bool](#Point.In)
        * [func (p Point) Mod(r Rectangle) Point](#Point.Mod)
        * [func (p Point) Eq(q Point) bool](#Point.Eq)
    * [type Rectangle struct](#Rectangle)
        * [func Rect(x0, y0, x1, y1 int) Rectangle](#Rect)
        * [func (r Rectangle) String() string](#Rectangle.String)
        * [func (r Rectangle) Dx() int](#Rectangle.Dx)
        * [func (r Rectangle) Dy() int](#Rectangle.Dy)
        * [func (r Rectangle) Size() Point](#Rectangle.Size)
        * [func (r Rectangle) Add(p Point) Rectangle](#Rectangle.Add)
        * [func (r Rectangle) Sub(p Point) Rectangle](#Rectangle.Sub)
        * [func (r Rectangle) Inset(n int) Rectangle](#Rectangle.Inset)
        * [func (r Rectangle) Intersect(s Rectangle) Rectangle](#Rectangle.Intersect)
        * [func (r Rectangle) Union(s Rectangle) Rectangle](#Rectangle.Union)
        * [func (r Rectangle) Empty() bool](#Rectangle.Empty)
        * [func (r Rectangle) Eq(s Rectangle) bool](#Rectangle.Eq)
        * [func (r Rectangle) Overlaps(s Rectangle) bool](#Rectangle.Overlaps)
        * [func (r Rectangle) In(s Rectangle) bool](#Rectangle.In)
        * [func (r Rectangle) Canon() Rectangle](#Rectangle.Canon)
        * [func (r Rectangle) At(x, y int) color.Color](#Rectangle.At)
        * [func (r Rectangle) Bounds() Rectangle](#Rectangle.Bounds)
        * [func (r Rectangle) ColorModel() color.Model](#Rectangle.ColorModel)
    * [type Config struct](#Config)
        * [func DecodeConfig(r io.Reader) (Config, string, error)](#DecodeConfig)
    * [type Image interface](#Image)
        * [func Decode(r io.Reader) (Image, string, error)](#Decode)
    * [type RGBA64Image interface](#RGBA64Image)
    * [type PalettedImage interface](#PalettedImage)
    * [type RGBA struct](#RGBA)
        * [func NewRGBA(r Rectangle) *RGBA](#NewRGBA)
        * [func (p *RGBA) ColorModel() color.Model](#RGBA.ColorModel)
        * [func (p *RGBA) Bounds() Rectangle](#RGBA.Bounds)
        * [func (p *RGBA) At(x, y int) color.Color](#RGBA.At)
        * [func (p *RGBA) RGBA64At(x, y int) color.RGBA64](#RGBA.RGBA64At)
        * [func (p *RGBA) RGBAAt(x, y int) color.RGBA](#RGBA.RGBAAt)
        * [func (p *RGBA) PixOffset(x, y int) int](#RGBA.PixOffset)
        * [func (p *RGBA) Set(x, y int, c color.Color)](#RGBA.Set)
        * [func (p *RGBA) SetRGBA64(x, y int, c color.RGBA64)](#RGBA.SetRGBA64)
        * [func (p *RGBA) SetRGBA(x, y int, c color.RGBA)](#RGBA.SetRGBA)
        * [func (p *RGBA) SubImage(r Rectangle) Image](#RGBA.SubImage)
        * [func (p *RGBA) Opaque() bool](#RGBA.Opaque)
    * [type RGBA64 struct](#RGBA64)
        * [func NewRGBA64(r Rectangle) *RGBA64](#NewRGBA64)
        * [func (p *RGBA64) ColorModel() color.Model](#RGBA64.ColorModel)
        * [func (p *RGBA64) Bounds() Rectangle](#RGBA64.Bounds)
        * [func (p *RGBA64) At(x, y int) color.Color](#RGBA64.At)
        * [func (p *RGBA64) RGBA64At(x, y int) color.RGBA64](#RGBA64.RGBA64At)
        * [func (p *RGBA64) PixOffset(x, y int) int](#RGBA64.PixOffset)
        * [func (p *RGBA64) Set(x, y int, c color.Color)](#RGBA64.Set)
        * [func (p *RGBA64) SetRGBA64(x, y int, c color.RGBA64)](#RGBA64.SetRGBA64)
        * [func (p *RGBA64) SubImage(r Rectangle) Image](#RGBA64.SubImage)
        * [func (p *RGBA64) Opaque() bool](#RGBA64.Opaque)
    * [type NRGBA struct](#NRGBA)
        * [func NewNRGBA(r Rectangle) *NRGBA](#NewNRGBA)
        * [func (p *NRGBA) ColorModel() color.Model](#NRGBA.ColorModel)
        * [func (p *NRGBA) Bounds() Rectangle](#NRGBA.Bounds)
        * [func (p *NRGBA) At(x, y int) color.Color](#NRGBA.At)
        * [func (p *NRGBA) RGBA64At(x, y int) color.RGBA64](#NRGBA.RGBA64At)
        * [func (p *NRGBA) NRGBAAt(x, y int) color.NRGBA](#NRGBA.NRGBAAt)
        * [func (p *NRGBA) PixOffset(x, y int) int](#NRGBA.PixOffset)
        * [func (p *NRGBA) Set(x, y int, c color.Color)](#NRGBA.Set)
        * [func (p *NRGBA) SetRGBA64(x, y int, c color.RGBA64)](#NRGBA.SetRGBA64)
        * [func (p *NRGBA) SetNRGBA(x, y int, c color.NRGBA)](#NRGBA.SetNRGBA)
        * [func (p *NRGBA) SubImage(r Rectangle) Image](#NRGBA.SubImage)
        * [func (p *NRGBA) Opaque() bool](#NRGBA.Opaque)
    * [type NRGBA64 struct](#NRGBA64)
        * [func NewNRGBA64(r Rectangle) *NRGBA64](#NewNRGBA64)
        * [func (p *NRGBA64) ColorModel() color.Model](#NRGBA64.ColorModel)
        * [func (p *NRGBA64) Bounds() Rectangle](#NRGBA64.Bounds)
        * [func (p *NRGBA64) At(x, y int) color.Color](#NRGBA64.At)
        * [func (p *NRGBA64) RGBA64At(x, y int) color.RGBA64](#NRGBA64.RGBA64At)
        * [func (p *NRGBA64) NRGBA64At(x, y int) color.NRGBA64](#NRGBA64.NRGBA64At)
        * [func (p *NRGBA64) PixOffset(x, y int) int](#NRGBA64.PixOffset)
        * [func (p *NRGBA64) Set(x, y int, c color.Color)](#NRGBA64.Set)
        * [func (p *NRGBA64) SetRGBA64(x, y int, c color.RGBA64)](#NRGBA64.SetRGBA64)
        * [func (p *NRGBA64) SetNRGBA64(x, y int, c color.NRGBA64)](#NRGBA64.SetNRGBA64)
        * [func (p *NRGBA64) SubImage(r Rectangle) Image](#NRGBA64.SubImage)
        * [func (p *NRGBA64) Opaque() bool](#NRGBA64.Opaque)
    * [type Alpha struct](#Alpha)
        * [func NewAlpha(r Rectangle) *Alpha](#NewAlpha)
        * [func (p *Alpha) ColorModel() color.Model](#Alpha.ColorModel)
        * [func (p *Alpha) Bounds() Rectangle](#Alpha.Bounds)
        * [func (p *Alpha) At(x, y int) color.Color](#Alpha.At)
        * [func (p *Alpha) RGBA64At(x, y int) color.RGBA64](#Alpha.RGBA64At)
        * [func (p *Alpha) AlphaAt(x, y int) color.Alpha](#Alpha.AlphaAt)
        * [func (p *Alpha) PixOffset(x, y int) int](#Alpha.PixOffset)
        * [func (p *Alpha) Set(x, y int, c color.Color)](#Alpha.Set)
        * [func (p *Alpha) SetRGBA64(x, y int, c color.RGBA64)](#Alpha.SetRGBA64)
        * [func (p *Alpha) SetAlpha(x, y int, c color.Alpha)](#Alpha.SetAlpha)
        * [func (p *Alpha) SubImage(r Rectangle) Image](#Alpha.SubImage)
        * [func (p *Alpha) Opaque() bool](#Alpha.Opaque)
    * [type Alpha16 struct](#Alpha16)
        * [func NewAlpha16(r Rectangle) *Alpha16](#NewAlpha16)
        * [func (p *Alpha16) ColorModel() color.Model](#Alpha16.ColorModel)
        * [func (p *Alpha16) Bounds() Rectangle](#Alpha16.Bounds)
        * [func (p *Alpha16) At(x, y int) color.Color](#Alpha16.At)
        * [func (p *Alpha16) RGBA64At(x, y int) color.RGBA64](#Alpha16.RGBA64At)
        * [func (p *Alpha16) Alpha16At(x, y int) color.Alpha16](#Alpha16.Alpha16At)
        * [func (p *Alpha16) PixOffset(x, y int) int](#Alpha16.PixOffset)
        * [func (p *Alpha16) Set(x, y int, c color.Color)](#Alpha16.Set)
        * [func (p *Alpha16) SetRGBA64(x, y int, c color.RGBA64)](#Alpha16.SetRGBA64)
        * [func (p *Alpha16) SetAlpha16(x, y int, c color.Alpha16)](#Alpha16.SetAlpha16)
        * [func (p *Alpha16) SubImage(r Rectangle) Image](#Alpha16.SubImage)
        * [func (p *Alpha16) Opaque() bool](#Alpha16.Opaque)
    * [type Gray struct](#Gray)
        * [func NewGray(r Rectangle) *Gray](#NewGray)
        * [func (p *Gray) ColorModel() color.Model](#Gray.ColorModel)
        * [func (p *Gray) Bounds() Rectangle](#Gray.Bounds)
        * [func (p *Gray) At(x, y int) color.Color](#Gray.At)
        * [func (p *Gray) RGBA64At(x, y int) color.RGBA64](#Gray.RGBA64At)
        * [func (p *Gray) GrayAt(x, y int) color.Gray](#Gray.GrayAt)
        * [func (p *Gray) PixOffset(x, y int) int](#Gray.PixOffset)
        * [func (p *Gray) Set(x, y int, c color.Color)](#Gray.Set)
        * [func (p *Gray) SetRGBA64(x, y int, c color.RGBA64)](#Gray.SetRGBA64)
        * [func (p *Gray) SetGray(x, y int, c color.Gray)](#Gray.SetGray)
        * [func (p *Gray) SubImage(r Rectangle) Image](#Gray.SubImage)
        * [func (p *Gray) Opaque() bool](#Gray.Opaque)
    * [type Gray16 struct](#Gray16)
        * [func NewGray16(r Rectangle) *Gray16](#NewGray16)
        * [func (p *Gray16) ColorModel() color.Model](#Gray16.ColorModel)
        * [func (p *Gray16) Bounds() Rectangle](#Gray16.Bounds)
        * [func (p *Gray16) At(x, y int) color.Color](#Gray16.At)
        * [func (p *Gray16) RGBA64At(x, y int) color.RGBA64](#Gray16.RGBA64At)
        * [func (p *Gray16) Gray16At(x, y int) color.Gray16](#Gray16.Gray16At)
        * [func (p *Gray16) PixOffset(x, y int) int](#Gray16.PixOffset)
        * [func (p *Gray16) Set(x, y int, c color.Color)](#Gray16.Set)
        * [func (p *Gray16) SetRGBA64(x, y int, c color.RGBA64)](#Gray16.SetRGBA64)
        * [func (p *Gray16) SetGray16(x, y int, c color.Gray16)](#Gray16.SetGray16)
        * [func (p *Gray16) SubImage(r Rectangle) Image](#Gray16.SubImage)
        * [func (p *Gray16) Opaque() bool](#Gray16.Opaque)
    * [type CMYK struct](#CMYK)
        * [func NewCMYK(r Rectangle) *CMYK](#NewCMYK)
        * [func (p *CMYK) ColorModel() color.Model](#CMYK.ColorModel)
        * [func (p *CMYK) Bounds() Rectangle](#CMYK.Bounds)
        * [func (p *CMYK) At(x, y int) color.Color](#CMYK.At)
        * [func (p *CMYK) RGBA64At(x, y int) color.RGBA64](#CMYK.RGBA64At)
        * [func (p *CMYK) CMYKAt(x, y int) color.CMYK](#CMYK.CMYKAt)
        * [func (p *CMYK) PixOffset(x, y int) int](#CMYK.PixOffset)
        * [func (p *CMYK) Set(x, y int, c color.Color)](#CMYK.Set)
        * [func (p *CMYK) SetRGBA64(x, y int, c color.RGBA64)](#CMYK.SetRGBA64)
        * [func (p *CMYK) SetCMYK(x, y int, c color.CMYK)](#CMYK.SetCMYK)
        * [func (p *CMYK) SubImage(r Rectangle) Image](#CMYK.SubImage)
        * [func (p *CMYK) Opaque() bool](#CMYK.Opaque)
    * [type Paletted struct](#Paletted)
        * [func NewPaletted(r Rectangle, p color.Palette) *Paletted](#NewPaletted)
        * [func (p *Paletted) ColorModel() color.Model](#Paletted.ColorModel)
        * [func (p *Paletted) Bounds() Rectangle](#Paletted.Bounds)
        * [func (p *Paletted) At(x, y int) color.Color](#Paletted.At)
        * [func (p *Paletted) RGBA64At(x, y int) color.RGBA64](#Paletted.RGBA64At)
        * [func (p *Paletted) PixOffset(x, y int) int](#Paletted.PixOffset)
        * [func (p *Paletted) Set(x, y int, c color.Color)](#Paletted.Set)
        * [func (p *Paletted) SetRGBA64(x, y int, c color.RGBA64)](#Paletted.SetRGBA64)
        * [func (p *Paletted) ColorIndexAt(x, y int) uint8](#Paletted.ColorIndexAt)
        * [func (p *Paletted) SetColorIndex(x, y int, index uint8)](#Paletted.SetColorIndex)
        * [func (p *Paletted) SubImage(r Rectangle) Image](#Paletted.SubImage)
        * [func (p *Paletted) Opaque() bool](#Paletted.Opaque)
    * [type Uniform struct](#Uniform)
        * [func NewUniform(c color.Color) *Uniform](#NewUniform)
        * [func (c *Uniform) RGBA() (r, g, b, a uint32)](#Uniform.RGBA)
        * [func (c *Uniform) ColorModel() color.Model](#Uniform.ColorModel)
        * [func (c *Uniform) Convert(color.Color) color.Color](#Uniform.Convert)
        * [func (c *Uniform) Bounds() Rectangle](#Uniform.Bounds)
        * [func (c *Uniform) At(x, y int) color.Color](#Uniform.At)
        * [func (c *Uniform) Opaque() bool](#Uniform.Opaque)
    * [type YCbCrSubsampleRatio int](#YCbCrSubsampleRatio)
        * [func (s YCbCrSubsampleRatio) String() string](#YCbCrSubsampleRatio.String)
    * [type YCbCr struct](#YCbCr)
        * [func NewYCbCr(r Rectangle, subsampleRatio YCbCrSubsampleRatio) *YCbCr](#NewYCbCr)
        * [func (p *YCbCr) ColorModel() color.Model](#YCbCr.ColorModel)
        * [func (p *YCbCr) Bounds() Rectangle](#YCbCr.Bounds)
        * [func (p *YCbCr) At(x, y int) color.Color](#YCbCr.At)
        * [func (p *YCbCr) RGBA64At(x, y int) color.RGBA64](#YCbCr.RGBA64At)
        * [func (p *YCbCr) YCbCrAt(x, y int) color.YCbCr](#YCbCr.YCbCrAt)
        * [func (p *YCbCr) YOffset(x, y int) int](#YCbCr.YOffset)
        * [func (p *YCbCr) COffset(x, y int) int](#YCbCr.COffset)
        * [func (p *YCbCr) SubImage(r Rectangle) Image](#YCbCr.SubImage)
        * [func (p *YCbCr) Opaque() bool](#YCbCr.Opaque)
    * [type NYCbCrA struct](#NYCbCrA)
        * [func NewNYCbCrA(r Rectangle, subsampleRatio YCbCrSubsampleRatio) *NYCbCrA](#NewNYCbCrA)
        * [func (p *NYCbCrA) ColorModel() color.Model](#NYCbCrA.ColorModel)
        * [func (p *NYCbCrA) At(x, y int) color.Color](#NYCbCrA.At)
        * [func (p *NYCbCrA) RGBA64At(x, y int) color.RGBA64](#NYCbCrA.RGBA64At)
        * [func (p *NYCbCrA) NYCbCrAAt(x, y int) color.NYCbCrA](#NYCbCrA.NYCbCrAAt)
        * [func (p *NYCbCrA) AOffset(x, y int) int](#NYCbCrA.AOffset)
        * [func (p *NYCbCrA) SubImage(r Rectangle) Image](#NYCbCrA.SubImage)
        * [func (p *NYCbCrA) Opaque() bool](#NYCbCrA.Opaque)
    * [type image interface](#image)
* [Functions](#func)
    * [func RegisterFormat(name, magic string, decode func(io.Reader) (Image, error), decodeConfig func(io.Reader) (Config, error))](#RegisterFormat)
    * [func match(magic string, b []byte) bool](#match)
    * [func mul3NonNeg(x int, y int, z int) int](#mul3NonNeg)
    * [func add2NonNeg(x int, y int) int](#add2NonNeg)
    * [func pixelBufferLength(bytesPerPixel int, r Rectangle, imageTypeName string) int](#pixelBufferLength)
    * [func yCbCrSize(r Rectangle, subsampleRatio YCbCrSubsampleRatio) (w, h, cw, ch int)](#yCbCrSize)
    * [func TestRectangle(t *testing.T)](#TestRectangle)
    * [func cmp(cm color.Model, c0, c1 color.Color) bool](#cmp)
    * [func TestImage(t *testing.T)](#TestImage)
    * [func TestNewXxxBadRectangle(t *testing.T)](#TestNewXxxBadRectangle)
    * [func Test16BitsPerColorChannel(t *testing.T)](#Test16BitsPerColorChannel)
    * [func TestRGBA64Image(t *testing.T)](#TestRGBA64Image)
    * [func BenchmarkAt(b *testing.B)](#BenchmarkAt)
    * [func BenchmarkSet(b *testing.B)](#BenchmarkSet)
    * [func BenchmarkRGBAAt(b *testing.B)](#BenchmarkRGBAAt)
    * [func BenchmarkRGBASetRGBA(b *testing.B)](#BenchmarkRGBASetRGBA)
    * [func BenchmarkRGBA64At(b *testing.B)](#BenchmarkRGBA64At)
    * [func BenchmarkRGBA64SetRGBA64(b *testing.B)](#BenchmarkRGBA64SetRGBA64)
    * [func BenchmarkNRGBAAt(b *testing.B)](#BenchmarkNRGBAAt)
    * [func BenchmarkNRGBASetNRGBA(b *testing.B)](#BenchmarkNRGBASetNRGBA)
    * [func BenchmarkNRGBA64At(b *testing.B)](#BenchmarkNRGBA64At)
    * [func BenchmarkNRGBA64SetNRGBA64(b *testing.B)](#BenchmarkNRGBA64SetNRGBA64)
    * [func BenchmarkAlphaAt(b *testing.B)](#BenchmarkAlphaAt)
    * [func BenchmarkAlphaSetAlpha(b *testing.B)](#BenchmarkAlphaSetAlpha)
    * [func BenchmarkAlpha16At(b *testing.B)](#BenchmarkAlpha16At)
    * [func BenchmarkAlphaSetAlpha16(b *testing.B)](#BenchmarkAlphaSetAlpha16)
    * [func BenchmarkGrayAt(b *testing.B)](#BenchmarkGrayAt)
    * [func BenchmarkGraySetGray(b *testing.B)](#BenchmarkGraySetGray)
    * [func BenchmarkGray16At(b *testing.B)](#BenchmarkGray16At)
    * [func BenchmarkGraySetGray16(b *testing.B)](#BenchmarkGraySetGray16)
    * [func TestYCbCr(t *testing.T)](#TestYCbCr)
    * [func testYCbCr(t *testing.T, r Rectangle, subsampleRatio YCbCrSubsampleRatio, delta Point)](#testYCbCr)
    * [func TestYCbCrSlicesDontOverlap(t *testing.T)](#TestYCbCrSlicesDontOverlap)


## <a id="const" href="#const">Constants</a>

```
tags: [exported]
```

### <a id="YCbCrSubsampleRatio444" href="#YCbCrSubsampleRatio444">const YCbCrSubsampleRatio444</a>

```
searchKey: image.YCbCrSubsampleRatio444
tags: [exported]
```

```Go
const YCbCrSubsampleRatio444 YCbCrSubsampleRatio = iota
```

### <a id="YCbCrSubsampleRatio422" href="#YCbCrSubsampleRatio422">const YCbCrSubsampleRatio422</a>

```
searchKey: image.YCbCrSubsampleRatio422
tags: [exported]
```

```Go
const YCbCrSubsampleRatio422
```

### <a id="YCbCrSubsampleRatio420" href="#YCbCrSubsampleRatio420">const YCbCrSubsampleRatio420</a>

```
searchKey: image.YCbCrSubsampleRatio420
tags: [exported]
```

```Go
const YCbCrSubsampleRatio420
```

### <a id="YCbCrSubsampleRatio440" href="#YCbCrSubsampleRatio440">const YCbCrSubsampleRatio440</a>

```
searchKey: image.YCbCrSubsampleRatio440
tags: [exported]
```

```Go
const YCbCrSubsampleRatio440
```

### <a id="YCbCrSubsampleRatio411" href="#YCbCrSubsampleRatio411">const YCbCrSubsampleRatio411</a>

```
searchKey: image.YCbCrSubsampleRatio411
tags: [exported]
```

```Go
const YCbCrSubsampleRatio411
```

### <a id="YCbCrSubsampleRatio410" href="#YCbCrSubsampleRatio410">const YCbCrSubsampleRatio410</a>

```
searchKey: image.YCbCrSubsampleRatio410
tags: [exported]
```

```Go
const YCbCrSubsampleRatio410
```

## <a id="var" href="#var">Variables</a>

```
tags: [exported]
```

### <a id="ErrFormat" href="#ErrFormat">var ErrFormat</a>

```
searchKey: image.ErrFormat
tags: [exported]
```

```Go
var ErrFormat = errors.New("image: unknown format")
```

ErrFormat indicates that decoding encountered an unknown format. 

### <a id="formatsMu" href="#formatsMu">var formatsMu</a>

```
searchKey: image.formatsMu
```

```Go
var formatsMu sync.Mutex
```

Formats is the list of registered formats. 

### <a id="atomicFormats" href="#atomicFormats">var atomicFormats</a>

```
searchKey: image.atomicFormats
```

```Go
var atomicFormats atomic.Value
```

Formats is the list of registered formats. 

### <a id="ZP" href="#ZP">var ZP</a>

```
searchKey: image.ZP
tags: [exported]
```

```Go
var ZP Point
```

ZP is the zero Point. 

Deprecated: Use a literal image.Point{} instead. 

### <a id="ZR" href="#ZR">var ZR</a>

```
searchKey: image.ZR
tags: [exported]
```

```Go
var ZR Rectangle
```

ZR is the zero Rectangle. 

Deprecated: Use a literal image.Rectangle{} instead. 

### <a id="Black" href="#Black">var Black</a>

```
searchKey: image.Black
tags: [exported]
```

```Go
var Black = NewUniform(color.Black)
```

Black is an opaque black uniform image. 

### <a id="White" href="#White">var White</a>

```
searchKey: image.White
tags: [exported]
```

```Go
var White = NewUniform(color.White)
```

White is an opaque white uniform image. 

### <a id="Transparent" href="#Transparent">var Transparent</a>

```
searchKey: image.Transparent
tags: [exported]
```

```Go
var Transparent = NewUniform(color.Transparent)
```

Transparent is a fully transparent uniform image. 

### <a id="Opaque" href="#Opaque">var Opaque</a>

```
searchKey: image.Opaque
tags: [exported]
```

```Go
var Opaque = NewUniform(color.Opaque)
```

Opaque is a fully opaque uniform image. 

### <a id="testImages" href="#testImages">var testImages</a>

```
searchKey: image.testImages
```

```Go
var testImages = ...
```

## <a id="type" href="#type">Types</a>

```
tags: [exported]
```

### <a id="format" href="#format">type format struct</a>

```
searchKey: image.format
```

```Go
type format struct {
	name, magic  string
	decode       func(io.Reader) (Image, error)
	decodeConfig func(io.Reader) (Config, error)
}
```

A format holds an image format's name, magic header and how to decode it. 

#### <a id="sniff" href="#sniff">func sniff(r reader) format</a>

```
searchKey: image.sniff
```

```Go
func sniff(r reader) format
```

Sniff determines the format of r's data. 

### <a id="reader" href="#reader">type reader interface</a>

```
searchKey: image.reader
```

```Go
type reader interface {
	io.Reader
	Peek(int) ([]byte, error)
}
```

A reader is an io.Reader that can also peek ahead. 

#### <a id="asReader" href="#asReader">func asReader(r io.Reader) reader</a>

```
searchKey: image.asReader
```

```Go
func asReader(r io.Reader) reader
```

asReader converts an io.Reader to a reader. 

### <a id="Point" href="#Point">type Point struct</a>

```
searchKey: image.Point
tags: [exported]
```

```Go
type Point struct {
	X, Y int
}
```

A Point is an X, Y coordinate pair. The axes increase right and down. 

#### <a id="Pt" href="#Pt">func Pt(X, Y int) Point</a>

```
searchKey: image.Pt
tags: [exported]
```

```Go
func Pt(X, Y int) Point
```

Pt is shorthand for Point{X, Y}. 

#### <a id="Point.String" href="#Point.String">func (p Point) String() string</a>

```
searchKey: image.Point.String
tags: [exported]
```

```Go
func (p Point) String() string
```

String returns a string representation of p like "(3,4)". 

#### <a id="Point.Add" href="#Point.Add">func (p Point) Add(q Point) Point</a>

```
searchKey: image.Point.Add
tags: [exported]
```

```Go
func (p Point) Add(q Point) Point
```

Add returns the vector p+q. 

#### <a id="Point.Sub" href="#Point.Sub">func (p Point) Sub(q Point) Point</a>

```
searchKey: image.Point.Sub
tags: [exported]
```

```Go
func (p Point) Sub(q Point) Point
```

Sub returns the vector p-q. 

#### <a id="Point.Mul" href="#Point.Mul">func (p Point) Mul(k int) Point</a>

```
searchKey: image.Point.Mul
tags: [exported]
```

```Go
func (p Point) Mul(k int) Point
```

Mul returns the vector p*k. 

#### <a id="Point.Div" href="#Point.Div">func (p Point) Div(k int) Point</a>

```
searchKey: image.Point.Div
tags: [exported]
```

```Go
func (p Point) Div(k int) Point
```

Div returns the vector p/k. 

#### <a id="Point.In" href="#Point.In">func (p Point) In(r Rectangle) bool</a>

```
searchKey: image.Point.In
tags: [exported]
```

```Go
func (p Point) In(r Rectangle) bool
```

In reports whether p is in r. 

#### <a id="Point.Mod" href="#Point.Mod">func (p Point) Mod(r Rectangle) Point</a>

```
searchKey: image.Point.Mod
tags: [exported]
```

```Go
func (p Point) Mod(r Rectangle) Point
```

Mod returns the point q in r such that p.X-q.X is a multiple of r's width and p.Y-q.Y is a multiple of r's height. 

#### <a id="Point.Eq" href="#Point.Eq">func (p Point) Eq(q Point) bool</a>

```
searchKey: image.Point.Eq
tags: [exported]
```

```Go
func (p Point) Eq(q Point) bool
```

Eq reports whether p and q are equal. 

### <a id="Rectangle" href="#Rectangle">type Rectangle struct</a>

```
searchKey: image.Rectangle
tags: [exported]
```

```Go
type Rectangle struct {
	Min, Max Point
}
```

A Rectangle contains the points with Min.X <= X < Max.X, Min.Y <= Y < Max.Y. It is well-formed if Min.X <= Max.X and likewise for Y. Points are always well-formed. A rectangle's methods always return well-formed outputs for well-formed inputs. 

A Rectangle is also an Image whose bounds are the rectangle itself. At returns color.Opaque for points in the rectangle and color.Transparent otherwise. 

#### <a id="Rect" href="#Rect">func Rect(x0, y0, x1, y1 int) Rectangle</a>

```
searchKey: image.Rect
tags: [exported]
```

```Go
func Rect(x0, y0, x1, y1 int) Rectangle
```

Rect is shorthand for Rectangle{Pt(x0, y0), Pt(x1, y1)}. The returned rectangle has minimum and maximum coordinates swapped if necessary so that it is well-formed. 

#### <a id="Rectangle.String" href="#Rectangle.String">func (r Rectangle) String() string</a>

```
searchKey: image.Rectangle.String
tags: [exported]
```

```Go
func (r Rectangle) String() string
```

String returns a string representation of r like "(3,4)-(6,5)". 

#### <a id="Rectangle.Dx" href="#Rectangle.Dx">func (r Rectangle) Dx() int</a>

```
searchKey: image.Rectangle.Dx
tags: [exported]
```

```Go
func (r Rectangle) Dx() int
```

Dx returns r's width. 

#### <a id="Rectangle.Dy" href="#Rectangle.Dy">func (r Rectangle) Dy() int</a>

```
searchKey: image.Rectangle.Dy
tags: [exported]
```

```Go
func (r Rectangle) Dy() int
```

Dy returns r's height. 

#### <a id="Rectangle.Size" href="#Rectangle.Size">func (r Rectangle) Size() Point</a>

```
searchKey: image.Rectangle.Size
tags: [exported]
```

```Go
func (r Rectangle) Size() Point
```

Size returns r's width and height. 

#### <a id="Rectangle.Add" href="#Rectangle.Add">func (r Rectangle) Add(p Point) Rectangle</a>

```
searchKey: image.Rectangle.Add
tags: [exported]
```

```Go
func (r Rectangle) Add(p Point) Rectangle
```

Add returns the rectangle r translated by p. 

#### <a id="Rectangle.Sub" href="#Rectangle.Sub">func (r Rectangle) Sub(p Point) Rectangle</a>

```
searchKey: image.Rectangle.Sub
tags: [exported]
```

```Go
func (r Rectangle) Sub(p Point) Rectangle
```

Sub returns the rectangle r translated by -p. 

#### <a id="Rectangle.Inset" href="#Rectangle.Inset">func (r Rectangle) Inset(n int) Rectangle</a>

```
searchKey: image.Rectangle.Inset
tags: [exported]
```

```Go
func (r Rectangle) Inset(n int) Rectangle
```

Inset returns the rectangle r inset by n, which may be negative. If either of r's dimensions is less than 2*n then an empty rectangle near the center of r will be returned. 

#### <a id="Rectangle.Intersect" href="#Rectangle.Intersect">func (r Rectangle) Intersect(s Rectangle) Rectangle</a>

```
searchKey: image.Rectangle.Intersect
tags: [exported]
```

```Go
func (r Rectangle) Intersect(s Rectangle) Rectangle
```

Intersect returns the largest rectangle contained by both r and s. If the two rectangles do not overlap then the zero rectangle will be returned. 

#### <a id="Rectangle.Union" href="#Rectangle.Union">func (r Rectangle) Union(s Rectangle) Rectangle</a>

```
searchKey: image.Rectangle.Union
tags: [exported]
```

```Go
func (r Rectangle) Union(s Rectangle) Rectangle
```

Union returns the smallest rectangle that contains both r and s. 

#### <a id="Rectangle.Empty" href="#Rectangle.Empty">func (r Rectangle) Empty() bool</a>

```
searchKey: image.Rectangle.Empty
tags: [exported]
```

```Go
func (r Rectangle) Empty() bool
```

Empty reports whether the rectangle contains no points. 

#### <a id="Rectangle.Eq" href="#Rectangle.Eq">func (r Rectangle) Eq(s Rectangle) bool</a>

```
searchKey: image.Rectangle.Eq
tags: [exported]
```

```Go
func (r Rectangle) Eq(s Rectangle) bool
```

Eq reports whether r and s contain the same set of points. All empty rectangles are considered equal. 

#### <a id="Rectangle.Overlaps" href="#Rectangle.Overlaps">func (r Rectangle) Overlaps(s Rectangle) bool</a>

```
searchKey: image.Rectangle.Overlaps
tags: [exported]
```

```Go
func (r Rectangle) Overlaps(s Rectangle) bool
```

Overlaps reports whether r and s have a non-empty intersection. 

#### <a id="Rectangle.In" href="#Rectangle.In">func (r Rectangle) In(s Rectangle) bool</a>

```
searchKey: image.Rectangle.In
tags: [exported]
```

```Go
func (r Rectangle) In(s Rectangle) bool
```

In reports whether every point in r is in s. 

#### <a id="Rectangle.Canon" href="#Rectangle.Canon">func (r Rectangle) Canon() Rectangle</a>

```
searchKey: image.Rectangle.Canon
tags: [exported]
```

```Go
func (r Rectangle) Canon() Rectangle
```

Canon returns the canonical version of r. The returned rectangle has minimum and maximum coordinates swapped if necessary so that it is well-formed. 

#### <a id="Rectangle.At" href="#Rectangle.At">func (r Rectangle) At(x, y int) color.Color</a>

```
searchKey: image.Rectangle.At
tags: [exported]
```

```Go
func (r Rectangle) At(x, y int) color.Color
```

At implements the Image interface. 

#### <a id="Rectangle.Bounds" href="#Rectangle.Bounds">func (r Rectangle) Bounds() Rectangle</a>

```
searchKey: image.Rectangle.Bounds
tags: [exported]
```

```Go
func (r Rectangle) Bounds() Rectangle
```

Bounds implements the Image interface. 

#### <a id="Rectangle.ColorModel" href="#Rectangle.ColorModel">func (r Rectangle) ColorModel() color.Model</a>

```
searchKey: image.Rectangle.ColorModel
tags: [exported]
```

```Go
func (r Rectangle) ColorModel() color.Model
```

ColorModel implements the Image interface. 

### <a id="Config" href="#Config">type Config struct</a>

```
searchKey: image.Config
tags: [exported]
```

```Go
type Config struct {
	ColorModel    color.Model
	Width, Height int
}
```

Config holds an image's color model and dimensions. 

#### <a id="DecodeConfig" href="#DecodeConfig">func DecodeConfig(r io.Reader) (Config, string, error)</a>

```
searchKey: image.DecodeConfig
tags: [exported]
```

```Go
func DecodeConfig(r io.Reader) (Config, string, error)
```

DecodeConfig decodes the color model and dimensions of an image that has been encoded in a registered format. The string returned is the format name used during format registration. Format registration is typically done by an init function in the codec-specific package. 

### <a id="Image" href="#Image">type Image interface</a>

```
searchKey: image.Image
tags: [exported]
```

```Go
type Image interface {
	// ColorModel returns the Image's color model.
	ColorModel() color.Model
	// Bounds returns the domain for which At can return non-zero color.
	// The bounds do not necessarily contain the point (0, 0).
	Bounds() Rectangle
	// At returns the color of the pixel at (x, y).
	// At(Bounds().Min.X, Bounds().Min.Y) returns the upper-left pixel of the grid.
	// At(Bounds().Max.X-1, Bounds().Max.Y-1) returns the lower-right one.
	At(x, y int) color.Color
}
```

Image is a finite rectangular grid of color.Color values taken from a color model. 

#### <a id="Decode" href="#Decode">func Decode(r io.Reader) (Image, string, error)</a>

```
searchKey: image.Decode
tags: [exported]
```

```Go
func Decode(r io.Reader) (Image, string, error)
```

Decode decodes an image that has been encoded in a registered format. The string returned is the format name used during format registration. Format registration is typically done by an init function in the codec- specific package. 

### <a id="RGBA64Image" href="#RGBA64Image">type RGBA64Image interface</a>

```
searchKey: image.RGBA64Image
tags: [exported]
```

```Go
type RGBA64Image interface {
	// RGBA64At returns the RGBA64 color of the pixel at (x, y). It is
	// equivalent to calling At(x, y).RGBA() and converting the resulting
	// 32-bit return values to a color.RGBA64, but it can avoid allocations
	// from converting concrete color types to the color.Color interface type.
	RGBA64At(x, y int) color.RGBA64
	Image
}
```

RGBA64Image is an Image whose pixels can be converted directly to a color.RGBA64. 

### <a id="PalettedImage" href="#PalettedImage">type PalettedImage interface</a>

```
searchKey: image.PalettedImage
tags: [exported]
```

```Go
type PalettedImage interface {
	// ColorIndexAt returns the palette index of the pixel at (x, y).
	ColorIndexAt(x, y int) uint8
	Image
}
```

PalettedImage is an image whose colors may come from a limited palette. If m is a PalettedImage and m.ColorModel() returns a color.Palette p, then m.At(x, y) should be equivalent to p[m.ColorIndexAt(x, y)]. If m's color model is not a color.Palette, then ColorIndexAt's behavior is undefined. 

### <a id="RGBA" href="#RGBA">type RGBA struct</a>

```
searchKey: image.RGBA
tags: [exported]
```

```Go
type RGBA struct {
	// Pix holds the image's pixels, in R, G, B, A order. The pixel at
	// (x, y) starts at Pix[(y-Rect.Min.Y)*Stride + (x-Rect.Min.X)*4].
	Pix []uint8
	// Stride is the Pix stride (in bytes) between vertically adjacent pixels.
	Stride int
	// Rect is the image's bounds.
	Rect Rectangle
}
```

RGBA is an in-memory image whose At method returns color.RGBA values. 

#### <a id="NewRGBA" href="#NewRGBA">func NewRGBA(r Rectangle) *RGBA</a>

```
searchKey: image.NewRGBA
tags: [exported]
```

```Go
func NewRGBA(r Rectangle) *RGBA
```

NewRGBA returns a new RGBA image with the given bounds. 

#### <a id="RGBA.ColorModel" href="#RGBA.ColorModel">func (p *RGBA) ColorModel() color.Model</a>

```
searchKey: image.RGBA.ColorModel
tags: [exported]
```

```Go
func (p *RGBA) ColorModel() color.Model
```

#### <a id="RGBA.Bounds" href="#RGBA.Bounds">func (p *RGBA) Bounds() Rectangle</a>

```
searchKey: image.RGBA.Bounds
tags: [exported]
```

```Go
func (p *RGBA) Bounds() Rectangle
```

#### <a id="RGBA.At" href="#RGBA.At">func (p *RGBA) At(x, y int) color.Color</a>

```
searchKey: image.RGBA.At
tags: [exported]
```

```Go
func (p *RGBA) At(x, y int) color.Color
```

#### <a id="RGBA.RGBA64At" href="#RGBA.RGBA64At">func (p *RGBA) RGBA64At(x, y int) color.RGBA64</a>

```
searchKey: image.RGBA.RGBA64At
tags: [exported]
```

```Go
func (p *RGBA) RGBA64At(x, y int) color.RGBA64
```

#### <a id="RGBA.RGBAAt" href="#RGBA.RGBAAt">func (p *RGBA) RGBAAt(x, y int) color.RGBA</a>

```
searchKey: image.RGBA.RGBAAt
tags: [exported]
```

```Go
func (p *RGBA) RGBAAt(x, y int) color.RGBA
```

#### <a id="RGBA.PixOffset" href="#RGBA.PixOffset">func (p *RGBA) PixOffset(x, y int) int</a>

```
searchKey: image.RGBA.PixOffset
tags: [exported]
```

```Go
func (p *RGBA) PixOffset(x, y int) int
```

PixOffset returns the index of the first element of Pix that corresponds to the pixel at (x, y). 

#### <a id="RGBA.Set" href="#RGBA.Set">func (p *RGBA) Set(x, y int, c color.Color)</a>

```
searchKey: image.RGBA.Set
tags: [exported]
```

```Go
func (p *RGBA) Set(x, y int, c color.Color)
```

#### <a id="RGBA.SetRGBA64" href="#RGBA.SetRGBA64">func (p *RGBA) SetRGBA64(x, y int, c color.RGBA64)</a>

```
searchKey: image.RGBA.SetRGBA64
tags: [exported]
```

```Go
func (p *RGBA) SetRGBA64(x, y int, c color.RGBA64)
```

#### <a id="RGBA.SetRGBA" href="#RGBA.SetRGBA">func (p *RGBA) SetRGBA(x, y int, c color.RGBA)</a>

```
searchKey: image.RGBA.SetRGBA
tags: [exported]
```

```Go
func (p *RGBA) SetRGBA(x, y int, c color.RGBA)
```

#### <a id="RGBA.SubImage" href="#RGBA.SubImage">func (p *RGBA) SubImage(r Rectangle) Image</a>

```
searchKey: image.RGBA.SubImage
tags: [exported]
```

```Go
func (p *RGBA) SubImage(r Rectangle) Image
```

SubImage returns an image representing the portion of the image p visible through r. The returned value shares pixels with the original image. 

#### <a id="RGBA.Opaque" href="#RGBA.Opaque">func (p *RGBA) Opaque() bool</a>

```
searchKey: image.RGBA.Opaque
tags: [exported]
```

```Go
func (p *RGBA) Opaque() bool
```

Opaque scans the entire image and reports whether it is fully opaque. 

### <a id="RGBA64" href="#RGBA64">type RGBA64 struct</a>

```
searchKey: image.RGBA64
tags: [exported]
```

```Go
type RGBA64 struct {
	// Pix holds the image's pixels, in R, G, B, A order and big-endian format. The pixel at
	// (x, y) starts at Pix[(y-Rect.Min.Y)*Stride + (x-Rect.Min.X)*8].
	Pix []uint8
	// Stride is the Pix stride (in bytes) between vertically adjacent pixels.
	Stride int
	// Rect is the image's bounds.
	Rect Rectangle
}
```

RGBA64 is an in-memory image whose At method returns color.RGBA64 values. 

#### <a id="NewRGBA64" href="#NewRGBA64">func NewRGBA64(r Rectangle) *RGBA64</a>

```
searchKey: image.NewRGBA64
tags: [exported]
```

```Go
func NewRGBA64(r Rectangle) *RGBA64
```

NewRGBA64 returns a new RGBA64 image with the given bounds. 

#### <a id="RGBA64.ColorModel" href="#RGBA64.ColorModel">func (p *RGBA64) ColorModel() color.Model</a>

```
searchKey: image.RGBA64.ColorModel
tags: [exported]
```

```Go
func (p *RGBA64) ColorModel() color.Model
```

#### <a id="RGBA64.Bounds" href="#RGBA64.Bounds">func (p *RGBA64) Bounds() Rectangle</a>

```
searchKey: image.RGBA64.Bounds
tags: [exported]
```

```Go
func (p *RGBA64) Bounds() Rectangle
```

#### <a id="RGBA64.At" href="#RGBA64.At">func (p *RGBA64) At(x, y int) color.Color</a>

```
searchKey: image.RGBA64.At
tags: [exported]
```

```Go
func (p *RGBA64) At(x, y int) color.Color
```

#### <a id="RGBA64.RGBA64At" href="#RGBA64.RGBA64At">func (p *RGBA64) RGBA64At(x, y int) color.RGBA64</a>

```
searchKey: image.RGBA64.RGBA64At
tags: [exported]
```

```Go
func (p *RGBA64) RGBA64At(x, y int) color.RGBA64
```

#### <a id="RGBA64.PixOffset" href="#RGBA64.PixOffset">func (p *RGBA64) PixOffset(x, y int) int</a>

```
searchKey: image.RGBA64.PixOffset
tags: [exported]
```

```Go
func (p *RGBA64) PixOffset(x, y int) int
```

PixOffset returns the index of the first element of Pix that corresponds to the pixel at (x, y). 

#### <a id="RGBA64.Set" href="#RGBA64.Set">func (p *RGBA64) Set(x, y int, c color.Color)</a>

```
searchKey: image.RGBA64.Set
tags: [exported]
```

```Go
func (p *RGBA64) Set(x, y int, c color.Color)
```

#### <a id="RGBA64.SetRGBA64" href="#RGBA64.SetRGBA64">func (p *RGBA64) SetRGBA64(x, y int, c color.RGBA64)</a>

```
searchKey: image.RGBA64.SetRGBA64
tags: [exported]
```

```Go
func (p *RGBA64) SetRGBA64(x, y int, c color.RGBA64)
```

#### <a id="RGBA64.SubImage" href="#RGBA64.SubImage">func (p *RGBA64) SubImage(r Rectangle) Image</a>

```
searchKey: image.RGBA64.SubImage
tags: [exported]
```

```Go
func (p *RGBA64) SubImage(r Rectangle) Image
```

SubImage returns an image representing the portion of the image p visible through r. The returned value shares pixels with the original image. 

#### <a id="RGBA64.Opaque" href="#RGBA64.Opaque">func (p *RGBA64) Opaque() bool</a>

```
searchKey: image.RGBA64.Opaque
tags: [exported]
```

```Go
func (p *RGBA64) Opaque() bool
```

Opaque scans the entire image and reports whether it is fully opaque. 

### <a id="NRGBA" href="#NRGBA">type NRGBA struct</a>

```
searchKey: image.NRGBA
tags: [exported]
```

```Go
type NRGBA struct {
	// Pix holds the image's pixels, in R, G, B, A order. The pixel at
	// (x, y) starts at Pix[(y-Rect.Min.Y)*Stride + (x-Rect.Min.X)*4].
	Pix []uint8
	// Stride is the Pix stride (in bytes) between vertically adjacent pixels.
	Stride int
	// Rect is the image's bounds.
	Rect Rectangle
}
```

NRGBA is an in-memory image whose At method returns color.NRGBA values. 

#### <a id="NewNRGBA" href="#NewNRGBA">func NewNRGBA(r Rectangle) *NRGBA</a>

```
searchKey: image.NewNRGBA
tags: [exported]
```

```Go
func NewNRGBA(r Rectangle) *NRGBA
```

NewNRGBA returns a new NRGBA image with the given bounds. 

#### <a id="NRGBA.ColorModel" href="#NRGBA.ColorModel">func (p *NRGBA) ColorModel() color.Model</a>

```
searchKey: image.NRGBA.ColorModel
tags: [exported]
```

```Go
func (p *NRGBA) ColorModel() color.Model
```

#### <a id="NRGBA.Bounds" href="#NRGBA.Bounds">func (p *NRGBA) Bounds() Rectangle</a>

```
searchKey: image.NRGBA.Bounds
tags: [exported]
```

```Go
func (p *NRGBA) Bounds() Rectangle
```

#### <a id="NRGBA.At" href="#NRGBA.At">func (p *NRGBA) At(x, y int) color.Color</a>

```
searchKey: image.NRGBA.At
tags: [exported]
```

```Go
func (p *NRGBA) At(x, y int) color.Color
```

#### <a id="NRGBA.RGBA64At" href="#NRGBA.RGBA64At">func (p *NRGBA) RGBA64At(x, y int) color.RGBA64</a>

```
searchKey: image.NRGBA.RGBA64At
tags: [exported]
```

```Go
func (p *NRGBA) RGBA64At(x, y int) color.RGBA64
```

#### <a id="NRGBA.NRGBAAt" href="#NRGBA.NRGBAAt">func (p *NRGBA) NRGBAAt(x, y int) color.NRGBA</a>

```
searchKey: image.NRGBA.NRGBAAt
tags: [exported]
```

```Go
func (p *NRGBA) NRGBAAt(x, y int) color.NRGBA
```

#### <a id="NRGBA.PixOffset" href="#NRGBA.PixOffset">func (p *NRGBA) PixOffset(x, y int) int</a>

```
searchKey: image.NRGBA.PixOffset
tags: [exported]
```

```Go
func (p *NRGBA) PixOffset(x, y int) int
```

PixOffset returns the index of the first element of Pix that corresponds to the pixel at (x, y). 

#### <a id="NRGBA.Set" href="#NRGBA.Set">func (p *NRGBA) Set(x, y int, c color.Color)</a>

```
searchKey: image.NRGBA.Set
tags: [exported]
```

```Go
func (p *NRGBA) Set(x, y int, c color.Color)
```

#### <a id="NRGBA.SetRGBA64" href="#NRGBA.SetRGBA64">func (p *NRGBA) SetRGBA64(x, y int, c color.RGBA64)</a>

```
searchKey: image.NRGBA.SetRGBA64
tags: [exported]
```

```Go
func (p *NRGBA) SetRGBA64(x, y int, c color.RGBA64)
```

#### <a id="NRGBA.SetNRGBA" href="#NRGBA.SetNRGBA">func (p *NRGBA) SetNRGBA(x, y int, c color.NRGBA)</a>

```
searchKey: image.NRGBA.SetNRGBA
tags: [exported]
```

```Go
func (p *NRGBA) SetNRGBA(x, y int, c color.NRGBA)
```

#### <a id="NRGBA.SubImage" href="#NRGBA.SubImage">func (p *NRGBA) SubImage(r Rectangle) Image</a>

```
searchKey: image.NRGBA.SubImage
tags: [exported]
```

```Go
func (p *NRGBA) SubImage(r Rectangle) Image
```

SubImage returns an image representing the portion of the image p visible through r. The returned value shares pixels with the original image. 

#### <a id="NRGBA.Opaque" href="#NRGBA.Opaque">func (p *NRGBA) Opaque() bool</a>

```
searchKey: image.NRGBA.Opaque
tags: [exported]
```

```Go
func (p *NRGBA) Opaque() bool
```

Opaque scans the entire image and reports whether it is fully opaque. 

### <a id="NRGBA64" href="#NRGBA64">type NRGBA64 struct</a>

```
searchKey: image.NRGBA64
tags: [exported]
```

```Go
type NRGBA64 struct {
	// Pix holds the image's pixels, in R, G, B, A order and big-endian format. The pixel at
	// (x, y) starts at Pix[(y-Rect.Min.Y)*Stride + (x-Rect.Min.X)*8].
	Pix []uint8
	// Stride is the Pix stride (in bytes) between vertically adjacent pixels.
	Stride int
	// Rect is the image's bounds.
	Rect Rectangle
}
```

NRGBA64 is an in-memory image whose At method returns color.NRGBA64 values. 

#### <a id="NewNRGBA64" href="#NewNRGBA64">func NewNRGBA64(r Rectangle) *NRGBA64</a>

```
searchKey: image.NewNRGBA64
tags: [exported]
```

```Go
func NewNRGBA64(r Rectangle) *NRGBA64
```

NewNRGBA64 returns a new NRGBA64 image with the given bounds. 

#### <a id="NRGBA64.ColorModel" href="#NRGBA64.ColorModel">func (p *NRGBA64) ColorModel() color.Model</a>

```
searchKey: image.NRGBA64.ColorModel
tags: [exported]
```

```Go
func (p *NRGBA64) ColorModel() color.Model
```

#### <a id="NRGBA64.Bounds" href="#NRGBA64.Bounds">func (p *NRGBA64) Bounds() Rectangle</a>

```
searchKey: image.NRGBA64.Bounds
tags: [exported]
```

```Go
func (p *NRGBA64) Bounds() Rectangle
```

#### <a id="NRGBA64.At" href="#NRGBA64.At">func (p *NRGBA64) At(x, y int) color.Color</a>

```
searchKey: image.NRGBA64.At
tags: [exported]
```

```Go
func (p *NRGBA64) At(x, y int) color.Color
```

#### <a id="NRGBA64.RGBA64At" href="#NRGBA64.RGBA64At">func (p *NRGBA64) RGBA64At(x, y int) color.RGBA64</a>

```
searchKey: image.NRGBA64.RGBA64At
tags: [exported]
```

```Go
func (p *NRGBA64) RGBA64At(x, y int) color.RGBA64
```

#### <a id="NRGBA64.NRGBA64At" href="#NRGBA64.NRGBA64At">func (p *NRGBA64) NRGBA64At(x, y int) color.NRGBA64</a>

```
searchKey: image.NRGBA64.NRGBA64At
tags: [exported]
```

```Go
func (p *NRGBA64) NRGBA64At(x, y int) color.NRGBA64
```

#### <a id="NRGBA64.PixOffset" href="#NRGBA64.PixOffset">func (p *NRGBA64) PixOffset(x, y int) int</a>

```
searchKey: image.NRGBA64.PixOffset
tags: [exported]
```

```Go
func (p *NRGBA64) PixOffset(x, y int) int
```

PixOffset returns the index of the first element of Pix that corresponds to the pixel at (x, y). 

#### <a id="NRGBA64.Set" href="#NRGBA64.Set">func (p *NRGBA64) Set(x, y int, c color.Color)</a>

```
searchKey: image.NRGBA64.Set
tags: [exported]
```

```Go
func (p *NRGBA64) Set(x, y int, c color.Color)
```

#### <a id="NRGBA64.SetRGBA64" href="#NRGBA64.SetRGBA64">func (p *NRGBA64) SetRGBA64(x, y int, c color.RGBA64)</a>

```
searchKey: image.NRGBA64.SetRGBA64
tags: [exported]
```

```Go
func (p *NRGBA64) SetRGBA64(x, y int, c color.RGBA64)
```

#### <a id="NRGBA64.SetNRGBA64" href="#NRGBA64.SetNRGBA64">func (p *NRGBA64) SetNRGBA64(x, y int, c color.NRGBA64)</a>

```
searchKey: image.NRGBA64.SetNRGBA64
tags: [exported]
```

```Go
func (p *NRGBA64) SetNRGBA64(x, y int, c color.NRGBA64)
```

#### <a id="NRGBA64.SubImage" href="#NRGBA64.SubImage">func (p *NRGBA64) SubImage(r Rectangle) Image</a>

```
searchKey: image.NRGBA64.SubImage
tags: [exported]
```

```Go
func (p *NRGBA64) SubImage(r Rectangle) Image
```

SubImage returns an image representing the portion of the image p visible through r. The returned value shares pixels with the original image. 

#### <a id="NRGBA64.Opaque" href="#NRGBA64.Opaque">func (p *NRGBA64) Opaque() bool</a>

```
searchKey: image.NRGBA64.Opaque
tags: [exported]
```

```Go
func (p *NRGBA64) Opaque() bool
```

Opaque scans the entire image and reports whether it is fully opaque. 

### <a id="Alpha" href="#Alpha">type Alpha struct</a>

```
searchKey: image.Alpha
tags: [exported]
```

```Go
type Alpha struct {
	// Pix holds the image's pixels, as alpha values. The pixel at
	// (x, y) starts at Pix[(y-Rect.Min.Y)*Stride + (x-Rect.Min.X)*1].
	Pix []uint8
	// Stride is the Pix stride (in bytes) between vertically adjacent pixels.
	Stride int
	// Rect is the image's bounds.
	Rect Rectangle
}
```

Alpha is an in-memory image whose At method returns color.Alpha values. 

#### <a id="NewAlpha" href="#NewAlpha">func NewAlpha(r Rectangle) *Alpha</a>

```
searchKey: image.NewAlpha
tags: [exported]
```

```Go
func NewAlpha(r Rectangle) *Alpha
```

NewAlpha returns a new Alpha image with the given bounds. 

#### <a id="Alpha.ColorModel" href="#Alpha.ColorModel">func (p *Alpha) ColorModel() color.Model</a>

```
searchKey: image.Alpha.ColorModel
tags: [exported]
```

```Go
func (p *Alpha) ColorModel() color.Model
```

#### <a id="Alpha.Bounds" href="#Alpha.Bounds">func (p *Alpha) Bounds() Rectangle</a>

```
searchKey: image.Alpha.Bounds
tags: [exported]
```

```Go
func (p *Alpha) Bounds() Rectangle
```

#### <a id="Alpha.At" href="#Alpha.At">func (p *Alpha) At(x, y int) color.Color</a>

```
searchKey: image.Alpha.At
tags: [exported]
```

```Go
func (p *Alpha) At(x, y int) color.Color
```

#### <a id="Alpha.RGBA64At" href="#Alpha.RGBA64At">func (p *Alpha) RGBA64At(x, y int) color.RGBA64</a>

```
searchKey: image.Alpha.RGBA64At
tags: [exported]
```

```Go
func (p *Alpha) RGBA64At(x, y int) color.RGBA64
```

#### <a id="Alpha.AlphaAt" href="#Alpha.AlphaAt">func (p *Alpha) AlphaAt(x, y int) color.Alpha</a>

```
searchKey: image.Alpha.AlphaAt
tags: [exported]
```

```Go
func (p *Alpha) AlphaAt(x, y int) color.Alpha
```

#### <a id="Alpha.PixOffset" href="#Alpha.PixOffset">func (p *Alpha) PixOffset(x, y int) int</a>

```
searchKey: image.Alpha.PixOffset
tags: [exported]
```

```Go
func (p *Alpha) PixOffset(x, y int) int
```

PixOffset returns the index of the first element of Pix that corresponds to the pixel at (x, y). 

#### <a id="Alpha.Set" href="#Alpha.Set">func (p *Alpha) Set(x, y int, c color.Color)</a>

```
searchKey: image.Alpha.Set
tags: [exported]
```

```Go
func (p *Alpha) Set(x, y int, c color.Color)
```

#### <a id="Alpha.SetRGBA64" href="#Alpha.SetRGBA64">func (p *Alpha) SetRGBA64(x, y int, c color.RGBA64)</a>

```
searchKey: image.Alpha.SetRGBA64
tags: [exported]
```

```Go
func (p *Alpha) SetRGBA64(x, y int, c color.RGBA64)
```

#### <a id="Alpha.SetAlpha" href="#Alpha.SetAlpha">func (p *Alpha) SetAlpha(x, y int, c color.Alpha)</a>

```
searchKey: image.Alpha.SetAlpha
tags: [exported]
```

```Go
func (p *Alpha) SetAlpha(x, y int, c color.Alpha)
```

#### <a id="Alpha.SubImage" href="#Alpha.SubImage">func (p *Alpha) SubImage(r Rectangle) Image</a>

```
searchKey: image.Alpha.SubImage
tags: [exported]
```

```Go
func (p *Alpha) SubImage(r Rectangle) Image
```

SubImage returns an image representing the portion of the image p visible through r. The returned value shares pixels with the original image. 

#### <a id="Alpha.Opaque" href="#Alpha.Opaque">func (p *Alpha) Opaque() bool</a>

```
searchKey: image.Alpha.Opaque
tags: [exported]
```

```Go
func (p *Alpha) Opaque() bool
```

Opaque scans the entire image and reports whether it is fully opaque. 

### <a id="Alpha16" href="#Alpha16">type Alpha16 struct</a>

```
searchKey: image.Alpha16
tags: [exported]
```

```Go
type Alpha16 struct {
	// Pix holds the image's pixels, as alpha values in big-endian format. The pixel at
	// (x, y) starts at Pix[(y-Rect.Min.Y)*Stride + (x-Rect.Min.X)*2].
	Pix []uint8
	// Stride is the Pix stride (in bytes) between vertically adjacent pixels.
	Stride int
	// Rect is the image's bounds.
	Rect Rectangle
}
```

Alpha16 is an in-memory image whose At method returns color.Alpha16 values. 

#### <a id="NewAlpha16" href="#NewAlpha16">func NewAlpha16(r Rectangle) *Alpha16</a>

```
searchKey: image.NewAlpha16
tags: [exported]
```

```Go
func NewAlpha16(r Rectangle) *Alpha16
```

NewAlpha16 returns a new Alpha16 image with the given bounds. 

#### <a id="Alpha16.ColorModel" href="#Alpha16.ColorModel">func (p *Alpha16) ColorModel() color.Model</a>

```
searchKey: image.Alpha16.ColorModel
tags: [exported]
```

```Go
func (p *Alpha16) ColorModel() color.Model
```

#### <a id="Alpha16.Bounds" href="#Alpha16.Bounds">func (p *Alpha16) Bounds() Rectangle</a>

```
searchKey: image.Alpha16.Bounds
tags: [exported]
```

```Go
func (p *Alpha16) Bounds() Rectangle
```

#### <a id="Alpha16.At" href="#Alpha16.At">func (p *Alpha16) At(x, y int) color.Color</a>

```
searchKey: image.Alpha16.At
tags: [exported]
```

```Go
func (p *Alpha16) At(x, y int) color.Color
```

#### <a id="Alpha16.RGBA64At" href="#Alpha16.RGBA64At">func (p *Alpha16) RGBA64At(x, y int) color.RGBA64</a>

```
searchKey: image.Alpha16.RGBA64At
tags: [exported]
```

```Go
func (p *Alpha16) RGBA64At(x, y int) color.RGBA64
```

#### <a id="Alpha16.Alpha16At" href="#Alpha16.Alpha16At">func (p *Alpha16) Alpha16At(x, y int) color.Alpha16</a>

```
searchKey: image.Alpha16.Alpha16At
tags: [exported]
```

```Go
func (p *Alpha16) Alpha16At(x, y int) color.Alpha16
```

#### <a id="Alpha16.PixOffset" href="#Alpha16.PixOffset">func (p *Alpha16) PixOffset(x, y int) int</a>

```
searchKey: image.Alpha16.PixOffset
tags: [exported]
```

```Go
func (p *Alpha16) PixOffset(x, y int) int
```

PixOffset returns the index of the first element of Pix that corresponds to the pixel at (x, y). 

#### <a id="Alpha16.Set" href="#Alpha16.Set">func (p *Alpha16) Set(x, y int, c color.Color)</a>

```
searchKey: image.Alpha16.Set
tags: [exported]
```

```Go
func (p *Alpha16) Set(x, y int, c color.Color)
```

#### <a id="Alpha16.SetRGBA64" href="#Alpha16.SetRGBA64">func (p *Alpha16) SetRGBA64(x, y int, c color.RGBA64)</a>

```
searchKey: image.Alpha16.SetRGBA64
tags: [exported]
```

```Go
func (p *Alpha16) SetRGBA64(x, y int, c color.RGBA64)
```

#### <a id="Alpha16.SetAlpha16" href="#Alpha16.SetAlpha16">func (p *Alpha16) SetAlpha16(x, y int, c color.Alpha16)</a>

```
searchKey: image.Alpha16.SetAlpha16
tags: [exported]
```

```Go
func (p *Alpha16) SetAlpha16(x, y int, c color.Alpha16)
```

#### <a id="Alpha16.SubImage" href="#Alpha16.SubImage">func (p *Alpha16) SubImage(r Rectangle) Image</a>

```
searchKey: image.Alpha16.SubImage
tags: [exported]
```

```Go
func (p *Alpha16) SubImage(r Rectangle) Image
```

SubImage returns an image representing the portion of the image p visible through r. The returned value shares pixels with the original image. 

#### <a id="Alpha16.Opaque" href="#Alpha16.Opaque">func (p *Alpha16) Opaque() bool</a>

```
searchKey: image.Alpha16.Opaque
tags: [exported]
```

```Go
func (p *Alpha16) Opaque() bool
```

Opaque scans the entire image and reports whether it is fully opaque. 

### <a id="Gray" href="#Gray">type Gray struct</a>

```
searchKey: image.Gray
tags: [exported]
```

```Go
type Gray struct {
	// Pix holds the image's pixels, as gray values. The pixel at
	// (x, y) starts at Pix[(y-Rect.Min.Y)*Stride + (x-Rect.Min.X)*1].
	Pix []uint8
	// Stride is the Pix stride (in bytes) between vertically adjacent pixels.
	Stride int
	// Rect is the image's bounds.
	Rect Rectangle
}
```

Gray is an in-memory image whose At method returns color.Gray values. 

#### <a id="NewGray" href="#NewGray">func NewGray(r Rectangle) *Gray</a>

```
searchKey: image.NewGray
tags: [exported]
```

```Go
func NewGray(r Rectangle) *Gray
```

NewGray returns a new Gray image with the given bounds. 

#### <a id="Gray.ColorModel" href="#Gray.ColorModel">func (p *Gray) ColorModel() color.Model</a>

```
searchKey: image.Gray.ColorModel
tags: [exported]
```

```Go
func (p *Gray) ColorModel() color.Model
```

#### <a id="Gray.Bounds" href="#Gray.Bounds">func (p *Gray) Bounds() Rectangle</a>

```
searchKey: image.Gray.Bounds
tags: [exported]
```

```Go
func (p *Gray) Bounds() Rectangle
```

#### <a id="Gray.At" href="#Gray.At">func (p *Gray) At(x, y int) color.Color</a>

```
searchKey: image.Gray.At
tags: [exported]
```

```Go
func (p *Gray) At(x, y int) color.Color
```

#### <a id="Gray.RGBA64At" href="#Gray.RGBA64At">func (p *Gray) RGBA64At(x, y int) color.RGBA64</a>

```
searchKey: image.Gray.RGBA64At
tags: [exported]
```

```Go
func (p *Gray) RGBA64At(x, y int) color.RGBA64
```

#### <a id="Gray.GrayAt" href="#Gray.GrayAt">func (p *Gray) GrayAt(x, y int) color.Gray</a>

```
searchKey: image.Gray.GrayAt
tags: [exported]
```

```Go
func (p *Gray) GrayAt(x, y int) color.Gray
```

#### <a id="Gray.PixOffset" href="#Gray.PixOffset">func (p *Gray) PixOffset(x, y int) int</a>

```
searchKey: image.Gray.PixOffset
tags: [exported]
```

```Go
func (p *Gray) PixOffset(x, y int) int
```

PixOffset returns the index of the first element of Pix that corresponds to the pixel at (x, y). 

#### <a id="Gray.Set" href="#Gray.Set">func (p *Gray) Set(x, y int, c color.Color)</a>

```
searchKey: image.Gray.Set
tags: [exported]
```

```Go
func (p *Gray) Set(x, y int, c color.Color)
```

#### <a id="Gray.SetRGBA64" href="#Gray.SetRGBA64">func (p *Gray) SetRGBA64(x, y int, c color.RGBA64)</a>

```
searchKey: image.Gray.SetRGBA64
tags: [exported]
```

```Go
func (p *Gray) SetRGBA64(x, y int, c color.RGBA64)
```

#### <a id="Gray.SetGray" href="#Gray.SetGray">func (p *Gray) SetGray(x, y int, c color.Gray)</a>

```
searchKey: image.Gray.SetGray
tags: [exported]
```

```Go
func (p *Gray) SetGray(x, y int, c color.Gray)
```

#### <a id="Gray.SubImage" href="#Gray.SubImage">func (p *Gray) SubImage(r Rectangle) Image</a>

```
searchKey: image.Gray.SubImage
tags: [exported]
```

```Go
func (p *Gray) SubImage(r Rectangle) Image
```

SubImage returns an image representing the portion of the image p visible through r. The returned value shares pixels with the original image. 

#### <a id="Gray.Opaque" href="#Gray.Opaque">func (p *Gray) Opaque() bool</a>

```
searchKey: image.Gray.Opaque
tags: [exported]
```

```Go
func (p *Gray) Opaque() bool
```

Opaque scans the entire image and reports whether it is fully opaque. 

### <a id="Gray16" href="#Gray16">type Gray16 struct</a>

```
searchKey: image.Gray16
tags: [exported]
```

```Go
type Gray16 struct {
	// Pix holds the image's pixels, as gray values in big-endian format. The pixel at
	// (x, y) starts at Pix[(y-Rect.Min.Y)*Stride + (x-Rect.Min.X)*2].
	Pix []uint8
	// Stride is the Pix stride (in bytes) between vertically adjacent pixels.
	Stride int
	// Rect is the image's bounds.
	Rect Rectangle
}
```

Gray16 is an in-memory image whose At method returns color.Gray16 values. 

#### <a id="NewGray16" href="#NewGray16">func NewGray16(r Rectangle) *Gray16</a>

```
searchKey: image.NewGray16
tags: [exported]
```

```Go
func NewGray16(r Rectangle) *Gray16
```

NewGray16 returns a new Gray16 image with the given bounds. 

#### <a id="Gray16.ColorModel" href="#Gray16.ColorModel">func (p *Gray16) ColorModel() color.Model</a>

```
searchKey: image.Gray16.ColorModel
tags: [exported]
```

```Go
func (p *Gray16) ColorModel() color.Model
```

#### <a id="Gray16.Bounds" href="#Gray16.Bounds">func (p *Gray16) Bounds() Rectangle</a>

```
searchKey: image.Gray16.Bounds
tags: [exported]
```

```Go
func (p *Gray16) Bounds() Rectangle
```

#### <a id="Gray16.At" href="#Gray16.At">func (p *Gray16) At(x, y int) color.Color</a>

```
searchKey: image.Gray16.At
tags: [exported]
```

```Go
func (p *Gray16) At(x, y int) color.Color
```

#### <a id="Gray16.RGBA64At" href="#Gray16.RGBA64At">func (p *Gray16) RGBA64At(x, y int) color.RGBA64</a>

```
searchKey: image.Gray16.RGBA64At
tags: [exported]
```

```Go
func (p *Gray16) RGBA64At(x, y int) color.RGBA64
```

#### <a id="Gray16.Gray16At" href="#Gray16.Gray16At">func (p *Gray16) Gray16At(x, y int) color.Gray16</a>

```
searchKey: image.Gray16.Gray16At
tags: [exported]
```

```Go
func (p *Gray16) Gray16At(x, y int) color.Gray16
```

#### <a id="Gray16.PixOffset" href="#Gray16.PixOffset">func (p *Gray16) PixOffset(x, y int) int</a>

```
searchKey: image.Gray16.PixOffset
tags: [exported]
```

```Go
func (p *Gray16) PixOffset(x, y int) int
```

PixOffset returns the index of the first element of Pix that corresponds to the pixel at (x, y). 

#### <a id="Gray16.Set" href="#Gray16.Set">func (p *Gray16) Set(x, y int, c color.Color)</a>

```
searchKey: image.Gray16.Set
tags: [exported]
```

```Go
func (p *Gray16) Set(x, y int, c color.Color)
```

#### <a id="Gray16.SetRGBA64" href="#Gray16.SetRGBA64">func (p *Gray16) SetRGBA64(x, y int, c color.RGBA64)</a>

```
searchKey: image.Gray16.SetRGBA64
tags: [exported]
```

```Go
func (p *Gray16) SetRGBA64(x, y int, c color.RGBA64)
```

#### <a id="Gray16.SetGray16" href="#Gray16.SetGray16">func (p *Gray16) SetGray16(x, y int, c color.Gray16)</a>

```
searchKey: image.Gray16.SetGray16
tags: [exported]
```

```Go
func (p *Gray16) SetGray16(x, y int, c color.Gray16)
```

#### <a id="Gray16.SubImage" href="#Gray16.SubImage">func (p *Gray16) SubImage(r Rectangle) Image</a>

```
searchKey: image.Gray16.SubImage
tags: [exported]
```

```Go
func (p *Gray16) SubImage(r Rectangle) Image
```

SubImage returns an image representing the portion of the image p visible through r. The returned value shares pixels with the original image. 

#### <a id="Gray16.Opaque" href="#Gray16.Opaque">func (p *Gray16) Opaque() bool</a>

```
searchKey: image.Gray16.Opaque
tags: [exported]
```

```Go
func (p *Gray16) Opaque() bool
```

Opaque scans the entire image and reports whether it is fully opaque. 

### <a id="CMYK" href="#CMYK">type CMYK struct</a>

```
searchKey: image.CMYK
tags: [exported]
```

```Go
type CMYK struct {
	// Pix holds the image's pixels, in C, M, Y, K order. The pixel at
	// (x, y) starts at Pix[(y-Rect.Min.Y)*Stride + (x-Rect.Min.X)*4].
	Pix []uint8
	// Stride is the Pix stride (in bytes) between vertically adjacent pixels.
	Stride int
	// Rect is the image's bounds.
	Rect Rectangle
}
```

CMYK is an in-memory image whose At method returns color.CMYK values. 

#### <a id="NewCMYK" href="#NewCMYK">func NewCMYK(r Rectangle) *CMYK</a>

```
searchKey: image.NewCMYK
tags: [exported]
```

```Go
func NewCMYK(r Rectangle) *CMYK
```

NewCMYK returns a new CMYK image with the given bounds. 

#### <a id="CMYK.ColorModel" href="#CMYK.ColorModel">func (p *CMYK) ColorModel() color.Model</a>

```
searchKey: image.CMYK.ColorModel
tags: [exported]
```

```Go
func (p *CMYK) ColorModel() color.Model
```

#### <a id="CMYK.Bounds" href="#CMYK.Bounds">func (p *CMYK) Bounds() Rectangle</a>

```
searchKey: image.CMYK.Bounds
tags: [exported]
```

```Go
func (p *CMYK) Bounds() Rectangle
```

#### <a id="CMYK.At" href="#CMYK.At">func (p *CMYK) At(x, y int) color.Color</a>

```
searchKey: image.CMYK.At
tags: [exported]
```

```Go
func (p *CMYK) At(x, y int) color.Color
```

#### <a id="CMYK.RGBA64At" href="#CMYK.RGBA64At">func (p *CMYK) RGBA64At(x, y int) color.RGBA64</a>

```
searchKey: image.CMYK.RGBA64At
tags: [exported]
```

```Go
func (p *CMYK) RGBA64At(x, y int) color.RGBA64
```

#### <a id="CMYK.CMYKAt" href="#CMYK.CMYKAt">func (p *CMYK) CMYKAt(x, y int) color.CMYK</a>

```
searchKey: image.CMYK.CMYKAt
tags: [exported]
```

```Go
func (p *CMYK) CMYKAt(x, y int) color.CMYK
```

#### <a id="CMYK.PixOffset" href="#CMYK.PixOffset">func (p *CMYK) PixOffset(x, y int) int</a>

```
searchKey: image.CMYK.PixOffset
tags: [exported]
```

```Go
func (p *CMYK) PixOffset(x, y int) int
```

PixOffset returns the index of the first element of Pix that corresponds to the pixel at (x, y). 

#### <a id="CMYK.Set" href="#CMYK.Set">func (p *CMYK) Set(x, y int, c color.Color)</a>

```
searchKey: image.CMYK.Set
tags: [exported]
```

```Go
func (p *CMYK) Set(x, y int, c color.Color)
```

#### <a id="CMYK.SetRGBA64" href="#CMYK.SetRGBA64">func (p *CMYK) SetRGBA64(x, y int, c color.RGBA64)</a>

```
searchKey: image.CMYK.SetRGBA64
tags: [exported]
```

```Go
func (p *CMYK) SetRGBA64(x, y int, c color.RGBA64)
```

#### <a id="CMYK.SetCMYK" href="#CMYK.SetCMYK">func (p *CMYK) SetCMYK(x, y int, c color.CMYK)</a>

```
searchKey: image.CMYK.SetCMYK
tags: [exported]
```

```Go
func (p *CMYK) SetCMYK(x, y int, c color.CMYK)
```

#### <a id="CMYK.SubImage" href="#CMYK.SubImage">func (p *CMYK) SubImage(r Rectangle) Image</a>

```
searchKey: image.CMYK.SubImage
tags: [exported]
```

```Go
func (p *CMYK) SubImage(r Rectangle) Image
```

SubImage returns an image representing the portion of the image p visible through r. The returned value shares pixels with the original image. 

#### <a id="CMYK.Opaque" href="#CMYK.Opaque">func (p *CMYK) Opaque() bool</a>

```
searchKey: image.CMYK.Opaque
tags: [exported]
```

```Go
func (p *CMYK) Opaque() bool
```

Opaque scans the entire image and reports whether it is fully opaque. 

### <a id="Paletted" href="#Paletted">type Paletted struct</a>

```
searchKey: image.Paletted
tags: [exported]
```

```Go
type Paletted struct {
	// Pix holds the image's pixels, as palette indices. The pixel at
	// (x, y) starts at Pix[(y-Rect.Min.Y)*Stride + (x-Rect.Min.X)*1].
	Pix []uint8
	// Stride is the Pix stride (in bytes) between vertically adjacent pixels.
	Stride int
	// Rect is the image's bounds.
	Rect Rectangle
	// Palette is the image's palette.
	Palette color.Palette
}
```

Paletted is an in-memory image of uint8 indices into a given palette. 

#### <a id="NewPaletted" href="#NewPaletted">func NewPaletted(r Rectangle, p color.Palette) *Paletted</a>

```
searchKey: image.NewPaletted
tags: [exported]
```

```Go
func NewPaletted(r Rectangle, p color.Palette) *Paletted
```

NewPaletted returns a new Paletted image with the given width, height and palette. 

#### <a id="Paletted.ColorModel" href="#Paletted.ColorModel">func (p *Paletted) ColorModel() color.Model</a>

```
searchKey: image.Paletted.ColorModel
tags: [exported]
```

```Go
func (p *Paletted) ColorModel() color.Model
```

#### <a id="Paletted.Bounds" href="#Paletted.Bounds">func (p *Paletted) Bounds() Rectangle</a>

```
searchKey: image.Paletted.Bounds
tags: [exported]
```

```Go
func (p *Paletted) Bounds() Rectangle
```

#### <a id="Paletted.At" href="#Paletted.At">func (p *Paletted) At(x, y int) color.Color</a>

```
searchKey: image.Paletted.At
tags: [exported]
```

```Go
func (p *Paletted) At(x, y int) color.Color
```

#### <a id="Paletted.RGBA64At" href="#Paletted.RGBA64At">func (p *Paletted) RGBA64At(x, y int) color.RGBA64</a>

```
searchKey: image.Paletted.RGBA64At
tags: [exported]
```

```Go
func (p *Paletted) RGBA64At(x, y int) color.RGBA64
```

#### <a id="Paletted.PixOffset" href="#Paletted.PixOffset">func (p *Paletted) PixOffset(x, y int) int</a>

```
searchKey: image.Paletted.PixOffset
tags: [exported]
```

```Go
func (p *Paletted) PixOffset(x, y int) int
```

PixOffset returns the index of the first element of Pix that corresponds to the pixel at (x, y). 

#### <a id="Paletted.Set" href="#Paletted.Set">func (p *Paletted) Set(x, y int, c color.Color)</a>

```
searchKey: image.Paletted.Set
tags: [exported]
```

```Go
func (p *Paletted) Set(x, y int, c color.Color)
```

#### <a id="Paletted.SetRGBA64" href="#Paletted.SetRGBA64">func (p *Paletted) SetRGBA64(x, y int, c color.RGBA64)</a>

```
searchKey: image.Paletted.SetRGBA64
tags: [exported]
```

```Go
func (p *Paletted) SetRGBA64(x, y int, c color.RGBA64)
```

#### <a id="Paletted.ColorIndexAt" href="#Paletted.ColorIndexAt">func (p *Paletted) ColorIndexAt(x, y int) uint8</a>

```
searchKey: image.Paletted.ColorIndexAt
tags: [exported]
```

```Go
func (p *Paletted) ColorIndexAt(x, y int) uint8
```

#### <a id="Paletted.SetColorIndex" href="#Paletted.SetColorIndex">func (p *Paletted) SetColorIndex(x, y int, index uint8)</a>

```
searchKey: image.Paletted.SetColorIndex
tags: [exported]
```

```Go
func (p *Paletted) SetColorIndex(x, y int, index uint8)
```

#### <a id="Paletted.SubImage" href="#Paletted.SubImage">func (p *Paletted) SubImage(r Rectangle) Image</a>

```
searchKey: image.Paletted.SubImage
tags: [exported]
```

```Go
func (p *Paletted) SubImage(r Rectangle) Image
```

SubImage returns an image representing the portion of the image p visible through r. The returned value shares pixels with the original image. 

#### <a id="Paletted.Opaque" href="#Paletted.Opaque">func (p *Paletted) Opaque() bool</a>

```
searchKey: image.Paletted.Opaque
tags: [exported]
```

```Go
func (p *Paletted) Opaque() bool
```

Opaque scans the entire image and reports whether it is fully opaque. 

### <a id="Uniform" href="#Uniform">type Uniform struct</a>

```
searchKey: image.Uniform
tags: [exported]
```

```Go
type Uniform struct {
	C color.Color
}
```

Uniform is an infinite-sized Image of uniform color. It implements the color.Color, color.Model, and Image interfaces. 

#### <a id="NewUniform" href="#NewUniform">func NewUniform(c color.Color) *Uniform</a>

```
searchKey: image.NewUniform
tags: [exported]
```

```Go
func NewUniform(c color.Color) *Uniform
```

NewUniform returns a new Uniform image of the given color. 

#### <a id="Uniform.RGBA" href="#Uniform.RGBA">func (c *Uniform) RGBA() (r, g, b, a uint32)</a>

```
searchKey: image.Uniform.RGBA
tags: [exported]
```

```Go
func (c *Uniform) RGBA() (r, g, b, a uint32)
```

#### <a id="Uniform.ColorModel" href="#Uniform.ColorModel">func (c *Uniform) ColorModel() color.Model</a>

```
searchKey: image.Uniform.ColorModel
tags: [exported]
```

```Go
func (c *Uniform) ColorModel() color.Model
```

#### <a id="Uniform.Convert" href="#Uniform.Convert">func (c *Uniform) Convert(color.Color) color.Color</a>

```
searchKey: image.Uniform.Convert
tags: [exported]
```

```Go
func (c *Uniform) Convert(color.Color) color.Color
```

#### <a id="Uniform.Bounds" href="#Uniform.Bounds">func (c *Uniform) Bounds() Rectangle</a>

```
searchKey: image.Uniform.Bounds
tags: [exported]
```

```Go
func (c *Uniform) Bounds() Rectangle
```

#### <a id="Uniform.At" href="#Uniform.At">func (c *Uniform) At(x, y int) color.Color</a>

```
searchKey: image.Uniform.At
tags: [exported]
```

```Go
func (c *Uniform) At(x, y int) color.Color
```

#### <a id="Uniform.Opaque" href="#Uniform.Opaque">func (c *Uniform) Opaque() bool</a>

```
searchKey: image.Uniform.Opaque
tags: [exported]
```

```Go
func (c *Uniform) Opaque() bool
```

Opaque scans the entire image and reports whether it is fully opaque. 

### <a id="YCbCrSubsampleRatio" href="#YCbCrSubsampleRatio">type YCbCrSubsampleRatio int</a>

```
searchKey: image.YCbCrSubsampleRatio
tags: [exported]
```

```Go
type YCbCrSubsampleRatio int
```

YCbCrSubsampleRatio is the chroma subsample ratio used in a YCbCr image. 

#### <a id="YCbCrSubsampleRatio.String" href="#YCbCrSubsampleRatio.String">func (s YCbCrSubsampleRatio) String() string</a>

```
searchKey: image.YCbCrSubsampleRatio.String
tags: [exported]
```

```Go
func (s YCbCrSubsampleRatio) String() string
```

### <a id="YCbCr" href="#YCbCr">type YCbCr struct</a>

```
searchKey: image.YCbCr
tags: [exported]
```

```Go
type YCbCr struct {
	Y, Cb, Cr      []uint8
	YStride        int
	CStride        int
	SubsampleRatio YCbCrSubsampleRatio
	Rect           Rectangle
}
```

YCbCr is an in-memory image of Y'CbCr colors. There is one Y sample per pixel, but each Cb and Cr sample can span one or more pixels. YStride is the Y slice index delta between vertically adjacent pixels. CStride is the Cb and Cr slice index delta between vertically adjacent pixels that map to separate chroma samples. It is not an absolute requirement, but YStride and len(Y) are typically multiples of 8, and: 

```
For 4:4:4, CStride == YStride/1 && len(Cb) == len(Cr) == len(Y)/1.
For 4:2:2, CStride == YStride/2 && len(Cb) == len(Cr) == len(Y)/2.
For 4:2:0, CStride == YStride/2 && len(Cb) == len(Cr) == len(Y)/4.
For 4:4:0, CStride == YStride/1 && len(Cb) == len(Cr) == len(Y)/2.
For 4:1:1, CStride == YStride/4 && len(Cb) == len(Cr) == len(Y)/4.
For 4:1:0, CStride == YStride/4 && len(Cb) == len(Cr) == len(Y)/8.

```
#### <a id="NewYCbCr" href="#NewYCbCr">func NewYCbCr(r Rectangle, subsampleRatio YCbCrSubsampleRatio) *YCbCr</a>

```
searchKey: image.NewYCbCr
tags: [exported]
```

```Go
func NewYCbCr(r Rectangle, subsampleRatio YCbCrSubsampleRatio) *YCbCr
```

NewYCbCr returns a new YCbCr image with the given bounds and subsample ratio. 

#### <a id="YCbCr.ColorModel" href="#YCbCr.ColorModel">func (p *YCbCr) ColorModel() color.Model</a>

```
searchKey: image.YCbCr.ColorModel
tags: [exported]
```

```Go
func (p *YCbCr) ColorModel() color.Model
```

#### <a id="YCbCr.Bounds" href="#YCbCr.Bounds">func (p *YCbCr) Bounds() Rectangle</a>

```
searchKey: image.YCbCr.Bounds
tags: [exported]
```

```Go
func (p *YCbCr) Bounds() Rectangle
```

#### <a id="YCbCr.At" href="#YCbCr.At">func (p *YCbCr) At(x, y int) color.Color</a>

```
searchKey: image.YCbCr.At
tags: [exported]
```

```Go
func (p *YCbCr) At(x, y int) color.Color
```

#### <a id="YCbCr.RGBA64At" href="#YCbCr.RGBA64At">func (p *YCbCr) RGBA64At(x, y int) color.RGBA64</a>

```
searchKey: image.YCbCr.RGBA64At
tags: [exported]
```

```Go
func (p *YCbCr) RGBA64At(x, y int) color.RGBA64
```

#### <a id="YCbCr.YCbCrAt" href="#YCbCr.YCbCrAt">func (p *YCbCr) YCbCrAt(x, y int) color.YCbCr</a>

```
searchKey: image.YCbCr.YCbCrAt
tags: [exported]
```

```Go
func (p *YCbCr) YCbCrAt(x, y int) color.YCbCr
```

#### <a id="YCbCr.YOffset" href="#YCbCr.YOffset">func (p *YCbCr) YOffset(x, y int) int</a>

```
searchKey: image.YCbCr.YOffset
tags: [exported]
```

```Go
func (p *YCbCr) YOffset(x, y int) int
```

YOffset returns the index of the first element of Y that corresponds to the pixel at (x, y). 

#### <a id="YCbCr.COffset" href="#YCbCr.COffset">func (p *YCbCr) COffset(x, y int) int</a>

```
searchKey: image.YCbCr.COffset
tags: [exported]
```

```Go
func (p *YCbCr) COffset(x, y int) int
```

COffset returns the index of the first element of Cb or Cr that corresponds to the pixel at (x, y). 

#### <a id="YCbCr.SubImage" href="#YCbCr.SubImage">func (p *YCbCr) SubImage(r Rectangle) Image</a>

```
searchKey: image.YCbCr.SubImage
tags: [exported]
```

```Go
func (p *YCbCr) SubImage(r Rectangle) Image
```

SubImage returns an image representing the portion of the image p visible through r. The returned value shares pixels with the original image. 

#### <a id="YCbCr.Opaque" href="#YCbCr.Opaque">func (p *YCbCr) Opaque() bool</a>

```
searchKey: image.YCbCr.Opaque
tags: [exported]
```

```Go
func (p *YCbCr) Opaque() bool
```

### <a id="NYCbCrA" href="#NYCbCrA">type NYCbCrA struct</a>

```
searchKey: image.NYCbCrA
tags: [exported]
```

```Go
type NYCbCrA struct {
	YCbCr
	A       []uint8
	AStride int
}
```

NYCbCrA is an in-memory image of non-alpha-premultiplied Y'CbCr-with-alpha colors. A and AStride are analogous to the Y and YStride fields of the embedded YCbCr. 

#### <a id="NewNYCbCrA" href="#NewNYCbCrA">func NewNYCbCrA(r Rectangle, subsampleRatio YCbCrSubsampleRatio) *NYCbCrA</a>

```
searchKey: image.NewNYCbCrA
tags: [exported]
```

```Go
func NewNYCbCrA(r Rectangle, subsampleRatio YCbCrSubsampleRatio) *NYCbCrA
```

NewNYCbCrA returns a new NYCbCrA image with the given bounds and subsample ratio. 

#### <a id="NYCbCrA.ColorModel" href="#NYCbCrA.ColorModel">func (p *NYCbCrA) ColorModel() color.Model</a>

```
searchKey: image.NYCbCrA.ColorModel
tags: [exported]
```

```Go
func (p *NYCbCrA) ColorModel() color.Model
```

#### <a id="NYCbCrA.At" href="#NYCbCrA.At">func (p *NYCbCrA) At(x, y int) color.Color</a>

```
searchKey: image.NYCbCrA.At
tags: [exported]
```

```Go
func (p *NYCbCrA) At(x, y int) color.Color
```

#### <a id="NYCbCrA.RGBA64At" href="#NYCbCrA.RGBA64At">func (p *NYCbCrA) RGBA64At(x, y int) color.RGBA64</a>

```
searchKey: image.NYCbCrA.RGBA64At
tags: [exported]
```

```Go
func (p *NYCbCrA) RGBA64At(x, y int) color.RGBA64
```

#### <a id="NYCbCrA.NYCbCrAAt" href="#NYCbCrA.NYCbCrAAt">func (p *NYCbCrA) NYCbCrAAt(x, y int) color.NYCbCrA</a>

```
searchKey: image.NYCbCrA.NYCbCrAAt
tags: [exported]
```

```Go
func (p *NYCbCrA) NYCbCrAAt(x, y int) color.NYCbCrA
```

#### <a id="NYCbCrA.AOffset" href="#NYCbCrA.AOffset">func (p *NYCbCrA) AOffset(x, y int) int</a>

```
searchKey: image.NYCbCrA.AOffset
tags: [exported]
```

```Go
func (p *NYCbCrA) AOffset(x, y int) int
```

AOffset returns the index of the first element of A that corresponds to the pixel at (x, y). 

#### <a id="NYCbCrA.SubImage" href="#NYCbCrA.SubImage">func (p *NYCbCrA) SubImage(r Rectangle) Image</a>

```
searchKey: image.NYCbCrA.SubImage
tags: [exported]
```

```Go
func (p *NYCbCrA) SubImage(r Rectangle) Image
```

SubImage returns an image representing the portion of the image p visible through r. The returned value shares pixels with the original image. 

#### <a id="NYCbCrA.Opaque" href="#NYCbCrA.Opaque">func (p *NYCbCrA) Opaque() bool</a>

```
searchKey: image.NYCbCrA.Opaque
tags: [exported]
```

```Go
func (p *NYCbCrA) Opaque() bool
```

Opaque scans the entire image and reports whether it is fully opaque. 

### <a id="image" href="#image">type image interface</a>

```
searchKey: image.image
```

```Go
type image interface {
	Image
	Opaque() bool
	Set(int, int, color.Color)
	SubImage(Rectangle) Image
}
```

## <a id="func" href="#func">Functions</a>

```
tags: [exported]
```

### <a id="RegisterFormat" href="#RegisterFormat">func RegisterFormat(name, magic string, decode func(io.Reader) (Image, error), decodeConfig func(io.Reader) (Config, error))</a>

```
searchKey: image.RegisterFormat
tags: [exported]
```

```Go
func RegisterFormat(name, magic string, decode func(io.Reader) (Image, error), decodeConfig func(io.Reader) (Config, error))
```

RegisterFormat registers an image format for use by Decode. Name is the name of the format, like "jpeg" or "png". Magic is the magic prefix that identifies the format's encoding. The magic string can contain "?" wildcards that each match any one byte. Decode is the function that decodes the encoded image. DecodeConfig is the function that decodes just its configuration. 

### <a id="match" href="#match">func match(magic string, b []byte) bool</a>

```
searchKey: image.match
```

```Go
func match(magic string, b []byte) bool
```

Match reports whether magic matches b. Magic may contain "?" wildcards. 

### <a id="mul3NonNeg" href="#mul3NonNeg">func mul3NonNeg(x int, y int, z int) int</a>

```
searchKey: image.mul3NonNeg
```

```Go
func mul3NonNeg(x int, y int, z int) int
```

mul3NonNeg returns (x * y * z), unless at least one argument is negative or if the computation overflows the int type, in which case it returns -1. 

### <a id="add2NonNeg" href="#add2NonNeg">func add2NonNeg(x int, y int) int</a>

```
searchKey: image.add2NonNeg
```

```Go
func add2NonNeg(x int, y int) int
```

add2NonNeg returns (x + y), unless at least one argument is negative or if the computation overflows the int type, in which case it returns -1. 

### <a id="pixelBufferLength" href="#pixelBufferLength">func pixelBufferLength(bytesPerPixel int, r Rectangle, imageTypeName string) int</a>

```
searchKey: image.pixelBufferLength
```

```Go
func pixelBufferLength(bytesPerPixel int, r Rectangle, imageTypeName string) int
```

pixelBufferLength returns the length of the []uint8 typed Pix slice field for the NewXxx functions. Conceptually, this is just (bpp * width * height), but this function panics if at least one of those is negative or if the computation would overflow the int type. 

This panics instead of returning an error because of backwards compatibility. The NewXxx functions do not return an error. 

### <a id="yCbCrSize" href="#yCbCrSize">func yCbCrSize(r Rectangle, subsampleRatio YCbCrSubsampleRatio) (w, h, cw, ch int)</a>

```
searchKey: image.yCbCrSize
```

```Go
func yCbCrSize(r Rectangle, subsampleRatio YCbCrSubsampleRatio) (w, h, cw, ch int)
```

### <a id="TestRectangle" href="#TestRectangle">func TestRectangle(t *testing.T)</a>

```
searchKey: image.TestRectangle
```

```Go
func TestRectangle(t *testing.T)
```

### <a id="cmp" href="#cmp">func cmp(cm color.Model, c0, c1 color.Color) bool</a>

```
searchKey: image.cmp
```

```Go
func cmp(cm color.Model, c0, c1 color.Color) bool
```

### <a id="TestImage" href="#TestImage">func TestImage(t *testing.T)</a>

```
searchKey: image.TestImage
```

```Go
func TestImage(t *testing.T)
```

### <a id="TestNewXxxBadRectangle" href="#TestNewXxxBadRectangle">func TestNewXxxBadRectangle(t *testing.T)</a>

```
searchKey: image.TestNewXxxBadRectangle
```

```Go
func TestNewXxxBadRectangle(t *testing.T)
```

### <a id="Test16BitsPerColorChannel" href="#Test16BitsPerColorChannel">func Test16BitsPerColorChannel(t *testing.T)</a>

```
searchKey: image.Test16BitsPerColorChannel
```

```Go
func Test16BitsPerColorChannel(t *testing.T)
```

### <a id="TestRGBA64Image" href="#TestRGBA64Image">func TestRGBA64Image(t *testing.T)</a>

```
searchKey: image.TestRGBA64Image
```

```Go
func TestRGBA64Image(t *testing.T)
```

### <a id="BenchmarkAt" href="#BenchmarkAt">func BenchmarkAt(b *testing.B)</a>

```
searchKey: image.BenchmarkAt
```

```Go
func BenchmarkAt(b *testing.B)
```

### <a id="BenchmarkSet" href="#BenchmarkSet">func BenchmarkSet(b *testing.B)</a>

```
searchKey: image.BenchmarkSet
```

```Go
func BenchmarkSet(b *testing.B)
```

### <a id="BenchmarkRGBAAt" href="#BenchmarkRGBAAt">func BenchmarkRGBAAt(b *testing.B)</a>

```
searchKey: image.BenchmarkRGBAAt
```

```Go
func BenchmarkRGBAAt(b *testing.B)
```

### <a id="BenchmarkRGBASetRGBA" href="#BenchmarkRGBASetRGBA">func BenchmarkRGBASetRGBA(b *testing.B)</a>

```
searchKey: image.BenchmarkRGBASetRGBA
```

```Go
func BenchmarkRGBASetRGBA(b *testing.B)
```

### <a id="BenchmarkRGBA64At" href="#BenchmarkRGBA64At">func BenchmarkRGBA64At(b *testing.B)</a>

```
searchKey: image.BenchmarkRGBA64At
```

```Go
func BenchmarkRGBA64At(b *testing.B)
```

### <a id="BenchmarkRGBA64SetRGBA64" href="#BenchmarkRGBA64SetRGBA64">func BenchmarkRGBA64SetRGBA64(b *testing.B)</a>

```
searchKey: image.BenchmarkRGBA64SetRGBA64
```

```Go
func BenchmarkRGBA64SetRGBA64(b *testing.B)
```

### <a id="BenchmarkNRGBAAt" href="#BenchmarkNRGBAAt">func BenchmarkNRGBAAt(b *testing.B)</a>

```
searchKey: image.BenchmarkNRGBAAt
```

```Go
func BenchmarkNRGBAAt(b *testing.B)
```

### <a id="BenchmarkNRGBASetNRGBA" href="#BenchmarkNRGBASetNRGBA">func BenchmarkNRGBASetNRGBA(b *testing.B)</a>

```
searchKey: image.BenchmarkNRGBASetNRGBA
```

```Go
func BenchmarkNRGBASetNRGBA(b *testing.B)
```

### <a id="BenchmarkNRGBA64At" href="#BenchmarkNRGBA64At">func BenchmarkNRGBA64At(b *testing.B)</a>

```
searchKey: image.BenchmarkNRGBA64At
```

```Go
func BenchmarkNRGBA64At(b *testing.B)
```

### <a id="BenchmarkNRGBA64SetNRGBA64" href="#BenchmarkNRGBA64SetNRGBA64">func BenchmarkNRGBA64SetNRGBA64(b *testing.B)</a>

```
searchKey: image.BenchmarkNRGBA64SetNRGBA64
```

```Go
func BenchmarkNRGBA64SetNRGBA64(b *testing.B)
```

### <a id="BenchmarkAlphaAt" href="#BenchmarkAlphaAt">func BenchmarkAlphaAt(b *testing.B)</a>

```
searchKey: image.BenchmarkAlphaAt
```

```Go
func BenchmarkAlphaAt(b *testing.B)
```

### <a id="BenchmarkAlphaSetAlpha" href="#BenchmarkAlphaSetAlpha">func BenchmarkAlphaSetAlpha(b *testing.B)</a>

```
searchKey: image.BenchmarkAlphaSetAlpha
```

```Go
func BenchmarkAlphaSetAlpha(b *testing.B)
```

### <a id="BenchmarkAlpha16At" href="#BenchmarkAlpha16At">func BenchmarkAlpha16At(b *testing.B)</a>

```
searchKey: image.BenchmarkAlpha16At
```

```Go
func BenchmarkAlpha16At(b *testing.B)
```

### <a id="BenchmarkAlphaSetAlpha16" href="#BenchmarkAlphaSetAlpha16">func BenchmarkAlphaSetAlpha16(b *testing.B)</a>

```
searchKey: image.BenchmarkAlphaSetAlpha16
```

```Go
func BenchmarkAlphaSetAlpha16(b *testing.B)
```

### <a id="BenchmarkGrayAt" href="#BenchmarkGrayAt">func BenchmarkGrayAt(b *testing.B)</a>

```
searchKey: image.BenchmarkGrayAt
```

```Go
func BenchmarkGrayAt(b *testing.B)
```

### <a id="BenchmarkGraySetGray" href="#BenchmarkGraySetGray">func BenchmarkGraySetGray(b *testing.B)</a>

```
searchKey: image.BenchmarkGraySetGray
```

```Go
func BenchmarkGraySetGray(b *testing.B)
```

### <a id="BenchmarkGray16At" href="#BenchmarkGray16At">func BenchmarkGray16At(b *testing.B)</a>

```
searchKey: image.BenchmarkGray16At
```

```Go
func BenchmarkGray16At(b *testing.B)
```

### <a id="BenchmarkGraySetGray16" href="#BenchmarkGraySetGray16">func BenchmarkGraySetGray16(b *testing.B)</a>

```
searchKey: image.BenchmarkGraySetGray16
```

```Go
func BenchmarkGraySetGray16(b *testing.B)
```

### <a id="TestYCbCr" href="#TestYCbCr">func TestYCbCr(t *testing.T)</a>

```
searchKey: image.TestYCbCr
```

```Go
func TestYCbCr(t *testing.T)
```

### <a id="testYCbCr" href="#testYCbCr">func testYCbCr(t *testing.T, r Rectangle, subsampleRatio YCbCrSubsampleRatio, delta Point)</a>

```
searchKey: image.testYCbCr
```

```Go
func testYCbCr(t *testing.T, r Rectangle, subsampleRatio YCbCrSubsampleRatio, delta Point)
```

### <a id="TestYCbCrSlicesDontOverlap" href="#TestYCbCrSlicesDontOverlap">func TestYCbCrSlicesDontOverlap(t *testing.T)</a>

```
searchKey: image.TestYCbCrSlicesDontOverlap
```

```Go
func TestYCbCrSlicesDontOverlap(t *testing.T)
```

