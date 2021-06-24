# Package sqliteutil

## Index

* [Variables](#var)
    * [var libSqlite3Pcre](#libSqlite3Pcre)
* [Functions](#func)
    * [func MustRegisterSqlite3WithPcre()](#MustRegisterSqlite3WithPcre)
    * [func SetLocalLibpath()](#SetLocalLibpath)


## <a id="var" href="#var">Variables</a>

```
tags: [package private]
```

### <a id="libSqlite3Pcre" href="#libSqlite3Pcre">var libSqlite3Pcre</a>

```
searchKey: sqliteutil.libSqlite3Pcre
tags: [variable string private]
```

```Go
var libSqlite3Pcre = env.Get("LIBSQLITE3_PCRE", "", "path to the libsqlite3-pcre library")
```

## <a id="func" href="#func">Functions</a>

```
tags: [package private]
```

### <a id="MustRegisterSqlite3WithPcre" href="#MustRegisterSqlite3WithPcre">func MustRegisterSqlite3WithPcre()</a>

```
searchKey: sqliteutil.MustRegisterSqlite3WithPcre
tags: [function]
```

```Go
func MustRegisterSqlite3WithPcre()
```

MustRegisterSqlite3WithPcre registers a sqlite3 driver with PCRE support and panics if it can't. 

### <a id="SetLocalLibpath" href="#SetLocalLibpath">func SetLocalLibpath()</a>

```
searchKey: sqliteutil.SetLocalLibpath
tags: [function]
```

```Go
func SetLocalLibpath()
```

SetLocalLibpath sets the path to the LIBSQLITE3_PCRE shared library. This should be called only in test environments. Production environments must require that the envvar be set explicitly. 

