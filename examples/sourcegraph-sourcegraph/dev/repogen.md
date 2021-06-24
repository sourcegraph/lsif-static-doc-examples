# Package main

## Index

* [Variables](#var)
    * [var fileSize](#fileSize)
    * [var numFiles](#numFiles)
* [Functions](#func)
    * [func inDir(d string, f func() error) error](#inDir)
    * [func main()](#main)
    * [func repogen(nf, size int) error](#repogen)
    * [func run(args ...string) error](#run)
    * [func write(w io.Writer, size int, b byte) error](#write)
    * [func writeIthFile(i, size int, dir string) error](#writeIthFile)


## <a id="var" href="#var">Variables</a>

```
tags: [package]
```

### <a id="fileSize" href="#fileSize">var fileSize</a>

```
searchKey: main.fileSize
tags: [variable number private]
```

```Go
var fileSize = flag.Int("size", 1024*1024, "size of each file")
```

### <a id="numFiles" href="#numFiles">var numFiles</a>

```
searchKey: main.numFiles
tags: [variable number private]
```

```Go
var numFiles = flag.Int("nf", 100, "number of files to write")
```

## <a id="func" href="#func">Functions</a>

```
tags: [package]
```

### <a id="inDir" href="#inDir">func inDir(d string, f func() error) error</a>

```
searchKey: main.inDir
tags: [method private]
```

```Go
func inDir(d string, f func() error) error
```

inDir runs function f in directory d. 

### <a id="main" href="#main">func main()</a>

```
searchKey: main.main
tags: [function private]
```

```Go
func main()
```

### <a id="repogen" href="#repogen">func repogen(nf, size int) error</a>

```
searchKey: main.repogen
tags: [method private]
```

```Go
func repogen(nf, size int) error
```

repogen creates a repo with nf files, each of the given size. 

### <a id="run" href="#run">func run(args ...string) error</a>

```
searchKey: main.run
tags: [method private]
```

```Go
func run(args ...string) error
```

run executes an external command. 

### <a id="write" href="#write">func write(w io.Writer, size int, b byte) error</a>

```
searchKey: main.write
tags: [method private]
```

```Go
func write(w io.Writer, size int, b byte) error
```

write writes a file with lots of the given byte b, up to the given size in bytes. 

### <a id="writeIthFile" href="#writeIthFile">func writeIthFile(i, size int, dir string) error</a>

```
searchKey: main.writeIthFile
tags: [method private]
```

```Go
func writeIthFile(i, size int, dir string) error
```

