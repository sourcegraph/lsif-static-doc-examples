# Package palette

Package palette provides standard color palettes. 

## Index

* [Variables](#var)
    * [var Plan9](#Plan9)
    * [var WebSafe](#WebSafe)


## <a id="var" href="#var">Variables</a>

### <a id="Plan9" href="#Plan9">var Plan9</a>

```
searchKey: palette.Plan9
tags: [variable array interface]
```

```Go
var Plan9 = ...
```

Plan9 is a 256-color palette that partitions the 24-bit RGB space into 4×4×4 subdivision, with 4 shades in each subcube. Compared to the WebSafe, the idea is to reduce the color resolution by dicing the color cube into fewer cells, and to use the extra space to increase the intensity resolution. This results in 16 gray shades (4 gray subcubes with 4 samples in each), 13 shades of each primary and secondary color (3 subcubes with 4 samples plus black) and a reasonable selection of colors covering the rest of the color cube. The advantage is better representation of continuous tones. 

This palette was used in the Plan 9 Operating System, described at [https://9p.io/magic/man2html/6/color](https://9p.io/magic/man2html/6/color) 

### <a id="WebSafe" href="#WebSafe">var WebSafe</a>

```
searchKey: palette.WebSafe
tags: [variable array interface]
```

```Go
var WebSafe = ...
```

WebSafe is a 216-color palette that was popularized by early versions of Netscape Navigator. It is also known as the Netscape Color Cube. 

See [https://en.wikipedia.org/wiki/Web_colors#Web-safe_colors](https://en.wikipedia.org/wiki/Web_colors#Web-safe_colors) for details. 

