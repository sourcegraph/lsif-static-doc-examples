# Package assets

Package assets contains static assets for the front-end Web app. 

## Index

* [Variables](#var)
    * [var Assets](#Assets)
    * [var MockLoadWebpackManifest](#MockLoadWebpackManifest)
* [Types](#type)
    * [type WebpackManifest struct](#WebpackManifest)
        * [func LoadWebpackManifest() (m *WebpackManifest, err error)](#LoadWebpackManifest)


## <a id="var" href="#var">Variables</a>

### <a id="Assets" href="#Assets">var Assets</a>

```
searchKey: assets.Assets
tags: [variable string]
```

```Go
var Assets = http.Dir("./ui/assets")
```

### <a id="MockLoadWebpackManifest" href="#MockLoadWebpackManifest">var MockLoadWebpackManifest</a>

```
searchKey: assets.MockLoadWebpackManifest
tags: [variable function]
```

```Go
var MockLoadWebpackManifest func() (*WebpackManifest, error)
```

## <a id="type" href="#type">Types</a>

### <a id="WebpackManifest" href="#WebpackManifest">type WebpackManifest struct</a>

```
searchKey: assets.WebpackManifest
tags: [struct]
```

```Go
type WebpackManifest struct {
	// AppJSBundlePath contains the file name of the main
	// Webpack bundle that serves as the entrypoint
	// for the webapp code.
	AppJSBundlePath string `json:"app.js"`
	// Main CSS bundle, only present in production.
	AppCSSBundlePath *string `json:"app.css"`
}
```

#### <a id="LoadWebpackManifest" href="#LoadWebpackManifest">func LoadWebpackManifest() (m *WebpackManifest, err error)</a>

```
searchKey: assets.LoadWebpackManifest
tags: [function]
```

```Go
func LoadWebpackManifest() (m *WebpackManifest, err error)
```

LoadWebpackManifest uses Webpack manifest to extract hashed bundle names to serve to the client, see [https://webpack.js.org/concepts/manifest/](https://webpack.js.org/concepts/manifest/) for details. In dev mode, we load this file from disk on demand, so it doesn't have to exist at compile time, to avoid a build dependency between frontend and client. 

