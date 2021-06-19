# Package migrations

package migrations contains embedded migrate sources for our DB migrations. 

## Index

* [Variables](#var)
    * [var content](#content)
    * [var CodeInsights](#CodeInsights)
    * [var CodeIntel](#CodeIntel)
    * [var Frontend](#Frontend)
* [Functions](#func)
    * [func mustSub(dir string) fs.FS](#mustSub)


## <a id="var" href="#var">Variables</a>

```
tags: [exported]
```

### <a id="content" href="#content">var content</a>

```
searchKey: migrations.content
```

```Go
var content embed.FS
```

### <a id="CodeInsights" href="#CodeInsights">var CodeInsights</a>

```
searchKey: migrations.CodeInsights
tags: [exported]
```

```Go
var CodeInsights = mustSub("codeinsights")
```

### <a id="CodeIntel" href="#CodeIntel">var CodeIntel</a>

```
searchKey: migrations.CodeIntel
tags: [exported]
```

```Go
var CodeIntel = mustSub("codeintel")
```

### <a id="Frontend" href="#Frontend">var Frontend</a>

```
searchKey: migrations.Frontend
tags: [exported]
```

```Go
var Frontend = mustSub("frontend")
```

## <a id="func" href="#func">Functions</a>

```
tags: [exported]
```

### <a id="mustSub" href="#mustSub">func mustSub(dir string) fs.FS</a>

```
searchKey: migrations.mustSub
```

```Go
func mustSub(dir string) fs.FS
```

