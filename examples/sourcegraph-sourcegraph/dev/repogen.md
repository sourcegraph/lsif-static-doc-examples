# Package main

## Index

* [Variables](#var)
    * [var numFiles](#numFiles)
    * [var fileSize](#fileSize)
* [Functions](#func)
    * [func main()](#main)
    * [func repogen(nf, size int) error](#repogen)
    * [func inDir(d string, f func() error) error](#inDir)
    * [func run(args ...string) error](#run)
    * [func writeIthFile(i, size int, dir string) error](#writeIthFile)
    * [func write(w io.Writer, size int, b byte) error](#write)


## <a id="var" href="#var">Variables</a>

```
tags: [exported]
```

### <a id="numFiles" href="#numFiles">var numFiles</a>

```
searchKey: main.numFiles
```

```Go
var numFiles = flag.Int("nf", 100, "number of files to write")
```

### <a id="fileSize" href="#fileSize">var fileSize</a>

```
searchKey: main.fileSize
```

```Go
var fileSize = flag.Int("size", 1024*1024, "size of each file")
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

### <a id="repogen" href="#repogen">func repogen(nf, size int) error</a>

```
searchKey: main.repogen
```

```Go
func repogen(nf, size int) error
```

repogen creates a repo with nf files, each of the given size. 

### <a id="inDir" href="#inDir">func inDir(d string, f func() error) error</a>

```
searchKey: main.inDir
```

```Go
func inDir(d string, f func() error) error
```

inDir runs function f in directory d. 

### <a id="run" href="#run">func run(args ...string) error</a>

```
searchKey: main.run
```

```Go
func run(args ...string) error
```

run executes an external command. 

### <a id="writeIthFile" href="#writeIthFile">func writeIthFile(i, size int, dir string) error</a>

```
searchKey: main.writeIthFile
```

```Go
func writeIthFile(i, size int, dir string) error
```

### <a id="write" href="#write">func write(w io.Writer, size int, b byte) error</a>

```
searchKey: main.write
```

```Go
func write(w io.Writer, size int, b byte) error
```

write writes a file with lots of the given byte b, up to the given size in bytes. 

