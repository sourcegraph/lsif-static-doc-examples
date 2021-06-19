# Package markdown

## Index

* [Variables](#var)
    * [var once](#once)
    * [var policy](#policy)
* [Functions](#func)
    * [func Render(content string) string](#Render)


## <a id="var" href="#var">Variables</a>

### <a id="once" href="#once">var once</a>

```
searchKey: markdown.once
```

```Go
var once sync.Once
```

### <a id="policy" href="#policy">var policy</a>

```
searchKey: markdown.policy
```

```Go
var policy *bluemonday.Policy
```

## <a id="func" href="#func">Functions</a>

### <a id="Render" href="#Render">func Render(content string) string</a>

```
searchKey: markdown.Render
tags: [exported]
```

```Go
func Render(content string) string
```

Render renders Markdown content into sanitized HTML that is safe to render anywhere. 

