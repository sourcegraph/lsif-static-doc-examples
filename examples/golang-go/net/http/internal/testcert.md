# Package testcert

Package testcert contains a test-only localhost certificate. 

## Index

* [Variables](#var)
    * [var LocalhostCert](#LocalhostCert)
    * [var LocalhostKey](#LocalhostKey)
* [Functions](#func)
    * [func testingKey(s string) string](#testingKey)


## <a id="var" href="#var">Variables</a>

```
tags: [private]
```

### <a id="LocalhostCert" href="#LocalhostCert">var LocalhostCert</a>

```
searchKey: testcert.LocalhostCert
tags: [variable array number]
```

```Go
var LocalhostCert = ...
```

LocalhostCert is a PEM-encoded TLS cert with SAN IPs "127.0.0.1" and "[::1]", expiring at Jan 29 16:00:00 2084 GMT. generated from src/crypto/tls: go run generate_cert.go  --rsa-bits 1024 --host 127.0.0.1,::1,example.com --ca --start-date "Jan 1 00:00:00 1970" --duration=1000000h 

### <a id="LocalhostKey" href="#LocalhostKey">var LocalhostKey</a>

```
searchKey: testcert.LocalhostKey
tags: [variable array number]
```

```Go
var LocalhostKey = ...
```

LocalhostKey is the private key for LocalhostCert. 

## <a id="func" href="#func">Functions</a>

```
tags: [private]
```

### <a id="testingKey" href="#testingKey">func testingKey(s string) string</a>

```
searchKey: testcert.testingKey
tags: [function private]
```

```Go
func testingKey(s string) string
```

