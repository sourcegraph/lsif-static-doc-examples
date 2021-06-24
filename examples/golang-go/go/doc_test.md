# Package doc_test

## Index

* [Constants](#const)
    * [const exampleEmpty](#exampleEmpty)
    * [const exampleEmptyOutput](#exampleEmptyOutput)
    * [const exampleHelloPlay](#exampleHelloPlay)
    * [const exampleImportPlay](#exampleImportPlay)
    * [const exampleInspectSignature](#exampleInspectSignature)
    * [const exampleInspectSignatureOutput](#exampleInspectSignatureOutput)
    * [const exampleKeyValueImportPlay](#exampleKeyValueImportPlay)
    * [const exampleKeyValuePlay](#exampleKeyValuePlay)
    * [const exampleKeyValueTopDeclPlay](#exampleKeyValueTopDeclPlay)
    * [const exampleSortPlay](#exampleSortPlay)
    * [const exampleTestFile](#exampleTestFile)
    * [const exampleWholeFile](#exampleWholeFile)
    * [const exampleWholeFileExternalFunction](#exampleWholeFileExternalFunction)
    * [const exampleWholeFileExternalFunctionOutput](#exampleWholeFileExternalFunctionOutput)
    * [const exampleWholeFileFunction](#exampleWholeFileFunction)
    * [const exampleWholeFileFunctionOutput](#exampleWholeFileFunctionOutput)
    * [const exampleWholeFileOutput](#exampleWholeFileOutput)
* [Variables](#var)
    * [var exampleTestCases](#exampleTestCases)
    * [var exampleWholeFileTestCases](#exampleWholeFileTestCases)
* [Functions](#func)
    * [func ExampleNewFromFiles()](#ExampleNewFromFiles)
    * [func TestClassifyExamples(t *testing.T)](#TestClassifyExamples)
    * [func TestExampleEmpty(t *testing.T)](#TestExampleEmpty)
    * [func TestExampleInspectSignature(t *testing.T)](#TestExampleInspectSignature)
    * [func TestExamples(t *testing.T)](#TestExamples)
    * [func TestExamplesWholeFile(t *testing.T)](#TestExamplesWholeFile)
    * [func exampleNames(exs []*doc.Example) (out []string)](#exampleNames)
    * [func formatFile(t *testing.T, fset *token.FileSet, n *ast.File) string](#formatFile)
    * [func mustParse(fset *token.FileSet, filename, src string) *ast.File](#mustParse)


## <a id="const" href="#const">Constants</a>

```
tags: [package private]
```

### <a id="exampleEmpty" href="#exampleEmpty">const exampleEmpty</a>

```
searchKey: doc_test.exampleEmpty
tags: [constant string private]
```

```Go
const exampleEmpty = `
package p
func Example() {}
func Example_a()
`
```

### <a id="exampleEmptyOutput" href="#exampleEmptyOutput">const exampleEmptyOutput</a>

```
searchKey: doc_test.exampleEmptyOutput
tags: [constant string private]
```

```Go
const exampleEmptyOutput = `package main

func main() {}
func main()
`
```

### <a id="exampleHelloPlay" href="#exampleHelloPlay">const exampleHelloPlay</a>

```
searchKey: doc_test.exampleHelloPlay
tags: [constant string private]
```

```Go
const exampleHelloPlay = ...
```

### <a id="exampleImportPlay" href="#exampleImportPlay">const exampleImportPlay</a>

```
searchKey: doc_test.exampleImportPlay
tags: [constant string private]
```

```Go
const exampleImportPlay = ...
```

### <a id="exampleInspectSignature" href="#exampleInspectSignature">const exampleInspectSignature</a>

```
searchKey: doc_test.exampleInspectSignature
tags: [constant string private]
```

```Go
const exampleInspectSignature = ...
```

### <a id="exampleInspectSignatureOutput" href="#exampleInspectSignatureOutput">const exampleInspectSignatureOutput</a>

```
searchKey: doc_test.exampleInspectSignatureOutput
tags: [constant string private]
```

```Go
const exampleInspectSignatureOutput = ...
```

### <a id="exampleKeyValueImportPlay" href="#exampleKeyValueImportPlay">const exampleKeyValueImportPlay</a>

```
searchKey: doc_test.exampleKeyValueImportPlay
tags: [constant string private]
```

```Go
const exampleKeyValueImportPlay = ...
```

### <a id="exampleKeyValuePlay" href="#exampleKeyValuePlay">const exampleKeyValuePlay</a>

```
searchKey: doc_test.exampleKeyValuePlay
tags: [constant string private]
```

```Go
const exampleKeyValuePlay = ...
```

### <a id="exampleKeyValueTopDeclPlay" href="#exampleKeyValueTopDeclPlay">const exampleKeyValueTopDeclPlay</a>

```
searchKey: doc_test.exampleKeyValueTopDeclPlay
tags: [constant string private]
```

```Go
const exampleKeyValueTopDeclPlay = ...
```

### <a id="exampleSortPlay" href="#exampleSortPlay">const exampleSortPlay</a>

```
searchKey: doc_test.exampleSortPlay
tags: [constant string private]
```

```Go
const exampleSortPlay = ...
```

### <a id="exampleTestFile" href="#exampleTestFile">const exampleTestFile</a>

```
searchKey: doc_test.exampleTestFile
tags: [constant string private]
```

```Go
const exampleTestFile = ...
```

### <a id="exampleWholeFile" href="#exampleWholeFile">const exampleWholeFile</a>

```
searchKey: doc_test.exampleWholeFile
tags: [constant string private]
```

```Go
const exampleWholeFile = ...
```

### <a id="exampleWholeFileExternalFunction" href="#exampleWholeFileExternalFunction">const exampleWholeFileExternalFunction</a>

```
searchKey: doc_test.exampleWholeFileExternalFunction
tags: [constant string private]
```

```Go
const exampleWholeFileExternalFunction = ...
```

### <a id="exampleWholeFileExternalFunctionOutput" href="#exampleWholeFileExternalFunctionOutput">const exampleWholeFileExternalFunctionOutput</a>

```
searchKey: doc_test.exampleWholeFileExternalFunctionOutput
tags: [constant string private]
```

```Go
const exampleWholeFileExternalFunctionOutput = ...
```

### <a id="exampleWholeFileFunction" href="#exampleWholeFileFunction">const exampleWholeFileFunction</a>

```
searchKey: doc_test.exampleWholeFileFunction
tags: [constant string private]
```

```Go
const exampleWholeFileFunction = ...
```

### <a id="exampleWholeFileFunctionOutput" href="#exampleWholeFileFunctionOutput">const exampleWholeFileFunctionOutput</a>

```
searchKey: doc_test.exampleWholeFileFunctionOutput
tags: [constant string private]
```

```Go
const exampleWholeFileFunctionOutput = ...
```

### <a id="exampleWholeFileOutput" href="#exampleWholeFileOutput">const exampleWholeFileOutput</a>

```
searchKey: doc_test.exampleWholeFileOutput
tags: [constant string private]
```

```Go
const exampleWholeFileOutput = ...
```

## <a id="var" href="#var">Variables</a>

```
tags: [package private]
```

### <a id="exampleTestCases" href="#exampleTestCases">var exampleTestCases</a>

```
searchKey: doc_test.exampleTestCases
tags: [variable array struct private]
```

```Go
var exampleTestCases = ...
```

### <a id="exampleWholeFileTestCases" href="#exampleWholeFileTestCases">var exampleWholeFileTestCases</a>

```
searchKey: doc_test.exampleWholeFileTestCases
tags: [variable array struct private]
```

```Go
var exampleWholeFileTestCases = ...
```

## <a id="func" href="#func">Functions</a>

```
tags: [package private]
```

### <a id="ExampleNewFromFiles" href="#ExampleNewFromFiles">func ExampleNewFromFiles()</a>

```
searchKey: doc_test.ExampleNewFromFiles
tags: [function private]
```

```Go
func ExampleNewFromFiles()
```

This example illustrates how to use NewFromFiles to compute package documentation with examples. 

### <a id="TestClassifyExamples" href="#TestClassifyExamples">func TestClassifyExamples(t *testing.T)</a>

```
searchKey: doc_test.TestClassifyExamples
tags: [method private test]
```

```Go
func TestClassifyExamples(t *testing.T)
```

### <a id="TestExampleEmpty" href="#TestExampleEmpty">func TestExampleEmpty(t *testing.T)</a>

```
searchKey: doc_test.TestExampleEmpty
tags: [method private test]
```

```Go
func TestExampleEmpty(t *testing.T)
```

### <a id="TestExampleInspectSignature" href="#TestExampleInspectSignature">func TestExampleInspectSignature(t *testing.T)</a>

```
searchKey: doc_test.TestExampleInspectSignature
tags: [method private test]
```

```Go
func TestExampleInspectSignature(t *testing.T)
```

### <a id="TestExamples" href="#TestExamples">func TestExamples(t *testing.T)</a>

```
searchKey: doc_test.TestExamples
tags: [method private test]
```

```Go
func TestExamples(t *testing.T)
```

### <a id="TestExamplesWholeFile" href="#TestExamplesWholeFile">func TestExamplesWholeFile(t *testing.T)</a>

```
searchKey: doc_test.TestExamplesWholeFile
tags: [method private test]
```

```Go
func TestExamplesWholeFile(t *testing.T)
```

### <a id="exampleNames" href="#exampleNames">func exampleNames(exs []*doc.Example) (out []string)</a>

```
searchKey: doc_test.exampleNames
tags: [method private]
```

```Go
func exampleNames(exs []*doc.Example) (out []string)
```

### <a id="formatFile" href="#formatFile">func formatFile(t *testing.T, fset *token.FileSet, n *ast.File) string</a>

```
searchKey: doc_test.formatFile
tags: [method private]
```

```Go
func formatFile(t *testing.T, fset *token.FileSet, n *ast.File) string
```

### <a id="mustParse" href="#mustParse">func mustParse(fset *token.FileSet, filename, src string) *ast.File</a>

```
searchKey: doc_test.mustParse
tags: [method private]
```

```Go
func mustParse(fset *token.FileSet, filename, src string) *ast.File
```

