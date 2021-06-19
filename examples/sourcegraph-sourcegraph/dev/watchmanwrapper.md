# Package main

Command watchmanwrapper runs watchman subscribe and parses its output to trigger another command with the files that have changed. See dev/changewatch for how it is invocated. 

## Index

* [Variables](#var)
    * [var neverRead](#neverRead)
* [Types](#type)
    * [type Response struct](#Response)
* [Functions](#func)
    * [func main()](#main)


## <a id="var" href="#var">Variables</a>

```
tags: [exported]
```

### <a id="neverRead" href="#neverRead">var neverRead</a>

```
searchKey: main.neverRead
```

```Go
var neverRead = (chan<- []string)(make(chan []string))
```

## <a id="type" href="#type">Types</a>

```
tags: [exported]
```

### <a id="Response" href="#Response">type Response struct</a>

```
searchKey: main.Response
tags: [exported]
```

```Go
type Response struct {
	IsFreshInstance bool     `json:"is_fresh_instance"`
	Files           []string `json:"files"`
}
```

## <a id="func" href="#func">Functions</a>

```
tags: [exported]
```

### <a id="main" href="#main">func main()</a>

```
searchKey: main.main
```

```Go
func main()
```

