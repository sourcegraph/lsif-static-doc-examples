# Package tls_test

## Index

* [Types](#type)
    * [type zeroSource struct{}](#zeroSource)
        * [func (zeroSource) Read(b []byte) (n int, err error)](#zeroSource.Read)
* [Functions](#func)
    * [func ExampleDial()](#ExampleDial)
    * [func ExampleConfig_keyLogWriter()](#ExampleConfig_keyLogWriter)
    * [func ExampleLoadX509KeyPair()](#ExampleLoadX509KeyPair)
    * [func ExampleX509KeyPair()](#ExampleX509KeyPair)
    * [func ExampleX509KeyPair_httpServer()](#ExampleX509KeyPair_httpServer)
    * [func ExampleConfig_verifyConnection()](#ExampleConfig_verifyConnection)


## <a id="type" href="#type">Types</a>

### <a id="zeroSource" href="#zeroSource">type zeroSource struct{}</a>

```
searchKey: tls_test.zeroSource
```

```Go
type zeroSource struct{}
```

zeroSource is an io.Reader that returns an unlimited number of zero bytes. 

#### <a id="zeroSource.Read" href="#zeroSource.Read">func (zeroSource) Read(b []byte) (n int, err error)</a>

```
searchKey: tls_test.zeroSource.Read
```

```Go
func (zeroSource) Read(b []byte) (n int, err error)
```

## <a id="func" href="#func">Functions</a>

### <a id="ExampleDial" href="#ExampleDial">func ExampleDial()</a>

```
searchKey: tls_test.ExampleDial
```

```Go
func ExampleDial()
```

### <a id="ExampleConfig_keyLogWriter" href="#ExampleConfig_keyLogWriter">func ExampleConfig_keyLogWriter()</a>

```
searchKey: tls_test.ExampleConfig_keyLogWriter
```

```Go
func ExampleConfig_keyLogWriter()
```

### <a id="ExampleLoadX509KeyPair" href="#ExampleLoadX509KeyPair">func ExampleLoadX509KeyPair()</a>

```
searchKey: tls_test.ExampleLoadX509KeyPair
```

```Go
func ExampleLoadX509KeyPair()
```

### <a id="ExampleX509KeyPair" href="#ExampleX509KeyPair">func ExampleX509KeyPair()</a>

```
searchKey: tls_test.ExampleX509KeyPair
```

```Go
func ExampleX509KeyPair()
```

### <a id="ExampleX509KeyPair_httpServer" href="#ExampleX509KeyPair_httpServer">func ExampleX509KeyPair_httpServer()</a>

```
searchKey: tls_test.ExampleX509KeyPair_httpServer
```

```Go
func ExampleX509KeyPair_httpServer()
```

### <a id="ExampleConfig_verifyConnection" href="#ExampleConfig_verifyConnection">func ExampleConfig_verifyConnection()</a>

```
searchKey: tls_test.ExampleConfig_verifyConnection
```

```Go
func ExampleConfig_verifyConnection()
```

