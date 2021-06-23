# Package doc_test

## Index

* [Constants](#const)
    * [const exampleTestFile](#exampleTestFile)
    * [const exampleHelloPlay](#exampleHelloPlay)
    * [const exampleImportPlay](#exampleImportPlay)
    * [const exampleKeyValuePlay](#exampleKeyValuePlay)
    * [const exampleKeyValueImportPlay](#exampleKeyValueImportPlay)
    * [const exampleKeyValueTopDeclPlay](#exampleKeyValueTopDeclPlay)
    * [const exampleSortPlay](#exampleSortPlay)
    * [const exampleWholeFile](#exampleWholeFile)
    * [const exampleWholeFileOutput](#exampleWholeFileOutput)
    * [const exampleWholeFileFunction](#exampleWholeFileFunction)
    * [const exampleWholeFileFunctionOutput](#exampleWholeFileFunctionOutput)
    * [const exampleWholeFileExternalFunction](#exampleWholeFileExternalFunction)
    * [const exampleWholeFileExternalFunctionOutput](#exampleWholeFileExternalFunctionOutput)
    * [const exampleInspectSignature](#exampleInspectSignature)
    * [const exampleInspectSignatureOutput](#exampleInspectSignatureOutput)
    * [const exampleEmpty](#exampleEmpty)
    * [const exampleEmptyOutput](#exampleEmptyOutput)
* [Variables](#var)
    * [var exampleTestCases](#exampleTestCases)
    * [var exampleWholeFileTestCases](#exampleWholeFileTestCases)
* [Functions](#func)
    * [func TestExamples(t *testing.T)](#TestExamples)
    * [func TestExamplesWholeFile(t *testing.T)](#TestExamplesWholeFile)
    * [func TestExampleInspectSignature(t *testing.T)](#TestExampleInspectSignature)
    * [func TestExampleEmpty(t *testing.T)](#TestExampleEmpty)
    * [func formatFile(t *testing.T, fset *token.FileSet, n *ast.File) string](#formatFile)
    * [func ExampleNewFromFiles()](#ExampleNewFromFiles)
    * [func TestClassifyExamples(t *testing.T)](#TestClassifyExamples)
    * [func exampleNames(exs []*doc.Example) (out []string)](#exampleNames)
    * [func mustParse(fset *token.FileSet, filename, src string) *ast.File](#mustParse)


## <a id="const" href="#const">Constants</a>

```
tags: [private]
```

### <a id="exampleTestFile" href="#exampleTestFile">const exampleTestFile</a>

```
searchKey: doc_test.exampleTestFile
tags: [private]
```

```Go
const exampleTestFile = ...
```

### <a id="exampleHelloPlay" href="#exampleHelloPlay">const exampleHelloPlay</a>

```
searchKey: doc_test.exampleHelloPlay
tags: [private]
```

```Go
const exampleHelloPlay = ...
```

### <a id="exampleImportPlay" href="#exampleImportPlay">const exampleImportPlay</a>

```
searchKey: doc_test.exampleImportPlay
tags: [private]
```

```Go
const exampleImportPlay = ...
```

### <a id="exampleKeyValuePlay" href="#exampleKeyValuePlay">const exampleKeyValuePlay</a>

```
searchKey: doc_test.exampleKeyValuePlay
tags: [private]
```

```Go
const exampleKeyValuePlay = ...
```

### <a id="exampleKeyValueImportPlay" href="#exampleKeyValueImportPlay">const exampleKeyValueImportPlay</a>

```
searchKey: doc_test.exampleKeyValueImportPlay
tags: [private]
```

```Go
const exampleKeyValueImportPlay = ...
```

### <a id="exampleKeyValueTopDeclPlay" href="#exampleKeyValueTopDeclPlay">const exampleKeyValueTopDeclPlay</a>

```
searchKey: doc_test.exampleKeyValueTopDeclPlay
tags: [private]
```

```Go
const exampleKeyValueTopDeclPlay = ...
```

### <a id="exampleSortPlay" href="#exampleSortPlay">const exampleSortPlay</a>

```
searchKey: doc_test.exampleSortPlay
tags: [private]
```

```Go
const exampleSortPlay = ...
```

### <a id="exampleWholeFile" href="#exampleWholeFile">const exampleWholeFile</a>

```
searchKey: doc_test.exampleWholeFile
tags: [private]
```

```Go
const exampleWholeFile = ...
```

### <a id="exampleWholeFileOutput" href="#exampleWholeFileOutput">const exampleWholeFileOutput</a>

```
searchKey: doc_test.exampleWholeFileOutput
tags: [private]
```

```Go
const exampleWholeFileOutput = ...
```

### <a id="exampleWholeFileFunction" href="#exampleWholeFileFunction">const exampleWholeFileFunction</a>

```
searchKey: doc_test.exampleWholeFileFunction
tags: [private]
```

```Go
const exampleWholeFileFunction = ...
```

### <a id="exampleWholeFileFunctionOutput" href="#exampleWholeFileFunctionOutput">const exampleWholeFileFunctionOutput</a>

```
searchKey: doc_test.exampleWholeFileFunctionOutput
tags: [private]
```

```Go
const exampleWholeFileFunctionOutput = ...
```

### <a id="exampleWholeFileExternalFunction" href="#exampleWholeFileExternalFunction">const exampleWholeFileExternalFunction</a>

```
searchKey: doc_test.exampleWholeFileExternalFunction
tags: [private]
```

```Go
const exampleWholeFileExternalFunction = ...
```

### <a id="exampleWholeFileExternalFunctionOutput" href="#exampleWholeFileExternalFunctionOutput">const exampleWholeFileExternalFunctionOutput</a>

```
searchKey: doc_test.exampleWholeFileExternalFunctionOutput
tags: [private]
```

```Go
const exampleWholeFileExternalFunctionOutput = ...
```

### <a id="exampleInspectSignature" href="#exampleInspectSignature">const exampleInspectSignature</a>

```
searchKey: doc_test.exampleInspectSignature
tags: [private]
```

```Go
const exampleInspectSignature = ...
```

### <a id="exampleInspectSignatureOutput" href="#exampleInspectSignatureOutput">const exampleInspectSignatureOutput</a>

```
searchKey: doc_test.exampleInspectSignatureOutput
tags: [private]
```

```Go
const exampleInspectSignatureOutput = ...
```

### <a id="exampleEmpty" href="#exampleEmpty">const exampleEmpty</a>

```
searchKey: doc_test.exampleEmpty
tags: [private]
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
tags: [private]
```

```Go
const exampleEmptyOutput = `package main

func main() {}
func main()
`
```

## <a id="var" href="#var">Variables</a>

```
tags: [private]
```

### <a id="exampleTestCases" href="#exampleTestCases">var exampleTestCases</a>

```
searchKey: doc_test.exampleTestCases
tags: [private]
```

```Go
var exampleTestCases = ...
```

### <a id="exampleWholeFileTestCases" href="#exampleWholeFileTestCases">var exampleWholeFileTestCases</a>

```
searchKey: doc_test.exampleWholeFileTestCases
tags: [private]
```

```Go
var exampleWholeFileTestCases = ...
```

## <a id="func" href="#func">Functions</a>

```
tags: [private]
```

### <a id="TestExamples" href="#TestExamples">func TestExamples(t *testing.T)</a>

```
searchKey: doc_test.TestExamples
tags: [private]
```

```Go
func TestExamples(t *testing.T)
```

### <a id="TestExamplesWholeFile" href="#TestExamplesWholeFile">func TestExamplesWholeFile(t *testing.T)</a>

```
searchKey: doc_test.TestExamplesWholeFile
tags: [private]
```

```Go
func TestExamplesWholeFile(t *testing.T)
```

### <a id="TestExampleInspectSignature" href="#TestExampleInspectSignature">func TestExampleInspectSignature(t *testing.T)</a>

```
searchKey: doc_test.TestExampleInspectSignature
tags: [private]
```

```Go
func TestExampleInspectSignature(t *testing.T)
```

### <a id="TestExampleEmpty" href="#TestExampleEmpty">func TestExampleEmpty(t *testing.T)</a>

```
searchKey: doc_test.TestExampleEmpty
tags: [private]
```

```Go
func TestExampleEmpty(t *testing.T)
```

### <a id="formatFile" href="#formatFile">func formatFile(t *testing.T, fset *token.FileSet, n *ast.File) string</a>

```
searchKey: doc_test.formatFile
tags: [private]
```

```Go
func formatFile(t *testing.T, fset *token.FileSet, n *ast.File) string
```

### <a id="ExampleNewFromFiles" href="#ExampleNewFromFiles">func ExampleNewFromFiles()</a>

```
searchKey: doc_test.ExampleNewFromFiles
tags: [private]
```

```Go
func ExampleNewFromFiles()
```

This example illustrates how to use NewFromFiles to compute package documentation with examples. 

### <a id="TestClassifyExamples" href="#TestClassifyExamples">func TestClassifyExamples(t *testing.T)</a>

```
searchKey: doc_test.TestClassifyExamples
tags: [private]
```

```Go
func TestClassifyExamples(t *testing.T)
```

### <a id="exampleNames" href="#exampleNames">func exampleNames(exs []*doc.Example) (out []string)</a>

```
searchKey: doc_test.exampleNames
tags: [private]
```

```Go
func exampleNames(exs []*doc.Example) (out []string)
```

### <a id="mustParse" href="#mustParse">func mustParse(fset *token.FileSet, filename, src string) *ast.File</a>

```
searchKey: doc_test.mustParse
tags: [private]
```

```Go
func mustParse(fset *token.FileSet, filename, src string) *ast.File
```

