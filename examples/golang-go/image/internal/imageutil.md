# Package imageutil

Package imageutil contains code shared by image-related packages. 

## Index

* [Functions](#func)
    * [func DrawYCbCr(dst *image.RGBA, r image.Rectangle, src *image.YCbCr, sp image.Point) (ok bool)](#DrawYCbCr)


## <a id="func" href="#func">Functions</a>

```
tags: [package private]
```

### <a id="DrawYCbCr" href="#DrawYCbCr">func DrawYCbCr(dst *image.RGBA, r image.Rectangle, src *image.YCbCr, sp image.Point) (ok bool)</a>

```
searchKey: imageutil.DrawYCbCr
tags: [method]
```

```Go
func DrawYCbCr(dst *image.RGBA, r image.Rectangle, src *image.YCbCr, sp image.Point) (ok bool)
```

DrawYCbCr draws the YCbCr source image on the RGBA destination image with r.Min in dst aligned with sp in src. It reports whether the draw was successful. If it returns false, no dst pixels were changed. 

This function assumes that r is entirely within dst's bounds and the translation of r from dst coordinate space to src coordinate space is entirely within src's bounds. 

