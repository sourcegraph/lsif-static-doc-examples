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

### <a id="exampleTestFile" href="#exampleTestFile">const exampleTestFile</a>

```
searchKey: doc_test.exampleTestFile
```

```Go
const exampleTestFile = ...
```

### <a id="exampleHelloPlay" href="#exampleHelloPlay">const exampleHelloPlay</a>

```
searchKey: doc_test.exampleHelloPlay
```

```Go
const exampleHelloPlay = ...
```

### <a id="exampleImportPlay" href="#exampleImportPlay">const exampleImportPlay</a>

```
searchKey: doc_test.exampleImportPlay
```

```Go
const exampleImportPlay = ...
```

### <a id="exampleKeyValuePlay" href="#exampleKeyValuePlay">const exampleKeyValuePlay</a>

```
searchKey: doc_test.exampleKeyValuePlay
```

```Go
const exampleKeyValuePlay = ...
```

### <a id="exampleKeyValueImportPlay" href="#exampleKeyValueImportPlay">const exampleKeyValueImportPlay</a>

```
searchKey: doc_test.exampleKeyValueImportPlay
```

```Go
const exampleKeyValueImportPlay = ...
```

### <a id="exampleKeyValueTopDeclPlay" href="#exampleKeyValueTopDeclPlay">const exampleKeyValueTopDeclPlay</a>

```
searchKey: doc_test.exampleKeyValueTopDeclPlay
```

```Go
const exampleKeyValueTopDeclPlay = ...
```

### <a id="exampleSortPlay" href="#exampleSortPlay">const exampleSortPlay</a>

```
searchKey: doc_test.exampleSortPlay
```

```Go
const exampleSortPlay = ...
```

### <a id="exampleWholeFile" href="#exampleWholeFile">const exampleWholeFile</a>

```
searchKey: doc_test.exampleWholeFile
```

```Go
const exampleWholeFile = ...
```

### <a id="exampleWholeFileOutput" href="#exampleWholeFileOutput">const exampleWholeFileOutput</a>

```
searchKey: doc_test.exampleWholeFileOutput
```

```Go
const exampleWholeFileOutput = ...
```

### <a id="exampleWholeFileFunction" href="#exampleWholeFileFunction">const exampleWholeFileFunction</a>

```
searchKey: doc_test.exampleWholeFileFunction
```

```Go
const exampleWholeFileFunction = ...
```

### <a id="exampleWholeFileFunctionOutput" href="#exampleWholeFileFunctionOutput">const exampleWholeFileFunctionOutput</a>

```
searchKey: doc_test.exampleWholeFileFunctionOutput
```

```Go
const exampleWholeFileFunctionOutput = ...
```

### <a id="exampleWholeFileExternalFunction" href="#exampleWholeFileExternalFunction">const exampleWholeFileExternalFunction</a>

```
searchKey: doc_test.exampleWholeFileExternalFunction
```

```Go
const exampleWholeFileExternalFunction = ...
```

### <a id="exampleWholeFileExternalFunctionOutput" href="#exampleWholeFileExternalFunctionOutput">const exampleWholeFileExternalFunctionOutput</a>

```
searchKey: doc_test.exampleWholeFileExternalFunctionOutput
```

```Go
const exampleWholeFileExternalFunctionOutput = ...
```

### <a id="exampleInspectSignature" href="#exampleInspectSignature">const exampleInspectSignature</a>

```
searchKey: doc_test.exampleInspectSignature
```

```Go
const exampleInspectSignature = ...
```

### <a id="exampleInspectSignatureOutput" href="#exampleInspectSignatureOutput">const exampleInspectSignatureOutput</a>

```
searchKey: doc_test.exampleInspectSignatureOutput
```

```Go
const exampleInspectSignatureOutput = ...
```

### <a id="exampleEmpty" href="#exampleEmpty">const exampleEmpty</a>

```
searchKey: doc_test.exampleEmpty
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
```

```Go
const exampleEmptyOutput = `package main

func main() {}
func main()
`
```

## <a id="var" href="#var">Variables</a>

### <a id="exampleTestCases" href="#exampleTestCases">var exampleTestCases</a>

```
searchKey: doc_test.exampleTestCases
```

```Go
var exampleTestCases = ...
```

### <a id="exampleWholeFileTestCases" href="#exampleWholeFileTestCases">var exampleWholeFileTestCases</a>

```
searchKey: doc_test.exampleWholeFileTestCases
```

```Go
var exampleWholeFileTestCases = ...
```

## <a id="func" href="#func">Functions</a>

### <a id="TestExamples" href="#TestExamples">func TestExamples(t *testing.T)</a>

```
searchKey: doc_test.TestExamples
```

```Go
func TestExamples(t *testing.T)
```

### <a id="TestExamplesWholeFile" href="#TestExamplesWholeFile">func TestExamplesWholeFile(t *testing.T)</a>

```
searchKey: doc_test.TestExamplesWholeFile
```

```Go
func TestExamplesWholeFile(t *testing.T)
```

### <a id="TestExampleInspectSignature" href="#TestExampleInspectSignature">func TestExampleInspectSignature(t *testing.T)</a>

```
searchKey: doc_test.TestExampleInspectSignature
```

```Go
func TestExampleInspectSignature(t *testing.T)
```

### <a id="TestExampleEmpty" href="#TestExampleEmpty">func TestExampleEmpty(t *testing.T)</a>

```
searchKey: doc_test.TestExampleEmpty
```

```Go
func TestExampleEmpty(t *testing.T)
```

### <a id="formatFile" href="#formatFile">func formatFile(t *testing.T, fset *token.FileSet, n *ast.File) string</a>

```
searchKey: doc_test.formatFile
```

```Go
func formatFile(t *testing.T, fset *token.FileSet, n *ast.File) string
```

### <a id="ExampleNewFromFiles" href="#ExampleNewFromFiles">func ExampleNewFromFiles()</a>

```
searchKey: doc_test.ExampleNewFromFiles
```

```Go
func ExampleNewFromFiles()
```

This example illustrates how to use NewFromFiles to compute package documentation with examples. 

### <a id="TestClassifyExamples" href="#TestClassifyExamples">func TestClassifyExamples(t *testing.T)</a>

```
searchKey: doc_test.TestClassifyExamples
```

```Go
func TestClassifyExamples(t *testing.T)
```

### <a id="exampleNames" href="#exampleNames">func exampleNames(exs []*doc.Example) (out []string)</a>

```
searchKey: doc_test.exampleNames
```

```Go
func exampleNames(exs []*doc.Example) (out []string)
```

### <a id="mustParse" href="#mustParse">func mustParse(fset *token.FileSet, filename, src string) *ast.File</a>

```
searchKey: doc_test.mustParse
```

```Go
func mustParse(fset *token.FileSet, filename, src string) *ast.File
```

