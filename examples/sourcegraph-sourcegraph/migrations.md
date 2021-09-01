# Package migrations

package migrations contains embedded migrate sources for our DB migrations. 

## Index

* [Variables](#var)
    * [var CodeInsights](#CodeInsights)
    * [var CodeIntel](#CodeIntel)
    * [var Frontend](#Frontend)
    * [var content](#content)
* [Functions](#func)
    * [func mustSub(dir string) fs.FS](#mustSub)


## <a id="var" href="#var">Variables</a>

### <a id="CodeInsights" href="#CodeInsights">var CodeInsights</a>

```
searchKey: migrations.CodeInsights
tags: [variable interface]
```

```Go
var CodeInsights = mustSub("codeinsights")
```

### <a id="CodeIntel" href="#CodeIntel">var CodeIntel</a>

```
searchKey: migrations.CodeIntel
tags: [variable interface]
```

```Go
var CodeIntel = mustSub("codeintel")
```

### <a id="Frontend" href="#Frontend">var Frontend</a>

```
searchKey: migrations.Frontend
tags: [variable interface]
```

```Go
var Frontend = mustSub("frontend")
```

### <a id="content" href="#content">var content</a>

```
searchKey: migrations.content
tags: [variable struct private]
```

```Go
var content embed.FS
```

## <a id="func" href="#func">Functions</a>

### <a id="mustSub" href="#mustSub">func mustSub(dir string) fs.FS</a>

```
searchKey: migrations.mustSub
tags: [function private]
```

```Go
func mustSub(dir string) fs.FS
```

