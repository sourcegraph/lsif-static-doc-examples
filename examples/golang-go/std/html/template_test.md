# Package template_test

## Index

* [Types](#type)
    * [type templateFile struct](#templateFile)
    * [type testCase struct](#testCase)
        * [func newTestCase(t *testing.T) *testCase](#newTestCase)
        * [func (c *testCase) lookup(name string) *Template](#testCase.lookup)
        * [func (c *testCase) mustParse(t *Template, text string)](#testCase.mustParse)
        * [func (c *testCase) mustNotParse(t *Template, text string)](#testCase.mustNotParse)
        * [func (c *testCase) mustExecute(t *Template, val interface{}, want string)](#testCase.mustExecute)
* [Functions](#func)
    * [func Example()](#Example)
    * [func Example_autoescaping()](#Example_autoescaping)
    * [func Example_escape()](#Example_escape)
    * [func ExampleTemplate_Delims()](#ExampleTemplate_Delims)
    * [func ExampleTemplate_block()](#ExampleTemplate_block)
    * [func createTestDir(files []templateFile) string](#createTestDir)
    * [func ExampleTemplate_glob()](#ExampleTemplate_glob)
    * [func ExampleTemplate_parsefiles()](#ExampleTemplate_parsefiles)
    * [func ExampleTemplate_helpers()](#ExampleTemplate_helpers)
    * [func ExampleTemplate_share()](#ExampleTemplate_share)
    * [func TestTemplateClone(t *testing.T)](#TestTemplateClone)
    * [func TestRedefineNonEmptyAfterExecution(t *testing.T)](#TestRedefineNonEmptyAfterExecution)
    * [func TestRedefineEmptyAfterExecution(t *testing.T)](#TestRedefineEmptyAfterExecution)
    * [func TestRedefineAfterNonExecution(t *testing.T)](#TestRedefineAfterNonExecution)
    * [func TestRedefineAfterNamedExecution(t *testing.T)](#TestRedefineAfterNamedExecution)
    * [func TestRedefineNestedByNameAfterExecution(t *testing.T)](#TestRedefineNestedByNameAfterExecution)
    * [func TestRedefineNestedByTemplateAfterExecution(t *testing.T)](#TestRedefineNestedByTemplateAfterExecution)
    * [func TestRedefineSafety(t *testing.T)](#TestRedefineSafety)
    * [func TestRedefineTopUse(t *testing.T)](#TestRedefineTopUse)
    * [func TestRedefineOtherParsers(t *testing.T)](#TestRedefineOtherParsers)
    * [func TestNumbers(t *testing.T)](#TestNumbers)
    * [func TestStringsInScriptsWithJsonContentTypeAreCorrectlyEscaped(t *testing.T)](#TestStringsInScriptsWithJsonContentTypeAreCorrectlyEscaped)
    * [func TestSkipEscapeComments(t *testing.T)](#TestSkipEscapeComments)


## <a id="type" href="#type">Types</a>

### <a id="templateFile" href="#templateFile">type templateFile struct</a>

```
searchKey: template_test.templateFile
```

```Go
type templateFile struct {
	name     string
	contents string
}
```

templateFile defines the contents of a template to be stored in a file, for testing. 

### <a id="testCase" href="#testCase">type testCase struct</a>

```
searchKey: template_test.testCase
```

```Go
type testCase struct {
	t    *testing.T
	root *Template
}
```

#### <a id="newTestCase" href="#newTestCase">func newTestCase(t *testing.T) *testCase</a>

```
searchKey: template_test.newTestCase
```

```Go
func newTestCase(t *testing.T) *testCase
```

#### <a id="testCase.lookup" href="#testCase.lookup">func (c *testCase) lookup(name string) *Template</a>

```
searchKey: template_test.testCase.lookup
```

```Go
func (c *testCase) lookup(name string) *Template
```

#### <a id="testCase.mustParse" href="#testCase.mustParse">func (c *testCase) mustParse(t *Template, text string)</a>

```
searchKey: template_test.testCase.mustParse
```

```Go
func (c *testCase) mustParse(t *Template, text string)
```

#### <a id="testCase.mustNotParse" href="#testCase.mustNotParse">func (c *testCase) mustNotParse(t *Template, text string)</a>

```
searchKey: template_test.testCase.mustNotParse
```

```Go
func (c *testCase) mustNotParse(t *Template, text string)
```

#### <a id="testCase.mustExecute" href="#testCase.mustExecute">func (c *testCase) mustExecute(t *Template, val interface{}, want string)</a>

```
searchKey: template_test.testCase.mustExecute
```

```Go
func (c *testCase) mustExecute(t *Template, val interface{}, want string)
```

## <a id="func" href="#func">Functions</a>

### <a id="Example" href="#Example">func Example()</a>

```
searchKey: template_test.Example
```

```Go
func Example()
```

### <a id="Example_autoescaping" href="#Example_autoescaping">func Example_autoescaping()</a>

```
searchKey: template_test.Example_autoescaping
```

```Go
func Example_autoescaping()
```

### <a id="Example_escape" href="#Example_escape">func Example_escape()</a>

```
searchKey: template_test.Example_escape
```

```Go
func Example_escape()
```

### <a id="ExampleTemplate_Delims" href="#ExampleTemplate_Delims">func ExampleTemplate_Delims()</a>

```
searchKey: template_test.ExampleTemplate_Delims
```

```Go
func ExampleTemplate_Delims()
```

### <a id="ExampleTemplate_block" href="#ExampleTemplate_block">func ExampleTemplate_block()</a>

```
searchKey: template_test.ExampleTemplate_block
```

```Go
func ExampleTemplate_block()
```

### <a id="createTestDir" href="#createTestDir">func createTestDir(files []templateFile) string</a>

```
searchKey: template_test.createTestDir
```

```Go
func createTestDir(files []templateFile) string
```

### <a id="ExampleTemplate_glob" href="#ExampleTemplate_glob">func ExampleTemplate_glob()</a>

```
searchKey: template_test.ExampleTemplate_glob
```

```Go
func ExampleTemplate_glob()
```

Here we demonstrate loading a set of templates from a directory. 

### <a id="ExampleTemplate_parsefiles" href="#ExampleTemplate_parsefiles">func ExampleTemplate_parsefiles()</a>

```
searchKey: template_test.ExampleTemplate_parsefiles
```

```Go
func ExampleTemplate_parsefiles()
```

Here we demonstrate loading a set of templates from files in different directories 

### <a id="ExampleTemplate_helpers" href="#ExampleTemplate_helpers">func ExampleTemplate_helpers()</a>

```
searchKey: template_test.ExampleTemplate_helpers
```

```Go
func ExampleTemplate_helpers()
```

This example demonstrates one way to share some templates and use them in different contexts. In this variant we add multiple driver templates by hand to an existing bundle of templates. 

### <a id="ExampleTemplate_share" href="#ExampleTemplate_share">func ExampleTemplate_share()</a>

```
searchKey: template_test.ExampleTemplate_share
```

```Go
func ExampleTemplate_share()
```

This example demonstrates how to use one group of driver templates with distinct sets of helper templates. 

### <a id="TestTemplateClone" href="#TestTemplateClone">func TestTemplateClone(t *testing.T)</a>

```
searchKey: template_test.TestTemplateClone
```

```Go
func TestTemplateClone(t *testing.T)
```

### <a id="TestRedefineNonEmptyAfterExecution" href="#TestRedefineNonEmptyAfterExecution">func TestRedefineNonEmptyAfterExecution(t *testing.T)</a>

```
searchKey: template_test.TestRedefineNonEmptyAfterExecution
```

```Go
func TestRedefineNonEmptyAfterExecution(t *testing.T)
```

### <a id="TestRedefineEmptyAfterExecution" href="#TestRedefineEmptyAfterExecution">func TestRedefineEmptyAfterExecution(t *testing.T)</a>

```
searchKey: template_test.TestRedefineEmptyAfterExecution
```

```Go
func TestRedefineEmptyAfterExecution(t *testing.T)
```

### <a id="TestRedefineAfterNonExecution" href="#TestRedefineAfterNonExecution">func TestRedefineAfterNonExecution(t *testing.T)</a>

```
searchKey: template_test.TestRedefineAfterNonExecution
```

```Go
func TestRedefineAfterNonExecution(t *testing.T)
```

### <a id="TestRedefineAfterNamedExecution" href="#TestRedefineAfterNamedExecution">func TestRedefineAfterNamedExecution(t *testing.T)</a>

```
searchKey: template_test.TestRedefineAfterNamedExecution
```

```Go
func TestRedefineAfterNamedExecution(t *testing.T)
```

### <a id="TestRedefineNestedByNameAfterExecution" href="#TestRedefineNestedByNameAfterExecution">func TestRedefineNestedByNameAfterExecution(t *testing.T)</a>

```
searchKey: template_test.TestRedefineNestedByNameAfterExecution
```

```Go
func TestRedefineNestedByNameAfterExecution(t *testing.T)
```

### <a id="TestRedefineNestedByTemplateAfterExecution" href="#TestRedefineNestedByTemplateAfterExecution">func TestRedefineNestedByTemplateAfterExecution(t *testing.T)</a>

```
searchKey: template_test.TestRedefineNestedByTemplateAfterExecution
```

```Go
func TestRedefineNestedByTemplateAfterExecution(t *testing.T)
```

### <a id="TestRedefineSafety" href="#TestRedefineSafety">func TestRedefineSafety(t *testing.T)</a>

```
searchKey: template_test.TestRedefineSafety
```

```Go
func TestRedefineSafety(t *testing.T)
```

### <a id="TestRedefineTopUse" href="#TestRedefineTopUse">func TestRedefineTopUse(t *testing.T)</a>

```
searchKey: template_test.TestRedefineTopUse
```

```Go
func TestRedefineTopUse(t *testing.T)
```

### <a id="TestRedefineOtherParsers" href="#TestRedefineOtherParsers">func TestRedefineOtherParsers(t *testing.T)</a>

```
searchKey: template_test.TestRedefineOtherParsers
```

```Go
func TestRedefineOtherParsers(t *testing.T)
```

### <a id="TestNumbers" href="#TestNumbers">func TestNumbers(t *testing.T)</a>

```
searchKey: template_test.TestNumbers
```

```Go
func TestNumbers(t *testing.T)
```

### <a id="TestStringsInScriptsWithJsonContentTypeAreCorrectlyEscaped" href="#TestStringsInScriptsWithJsonContentTypeAreCorrectlyEscaped">func TestStringsInScriptsWithJsonContentTypeAreCorrectlyEscaped(t *testing.T)</a>

```
searchKey: template_test.TestStringsInScriptsWithJsonContentTypeAreCorrectlyEscaped
```

```Go
func TestStringsInScriptsWithJsonContentTypeAreCorrectlyEscaped(t *testing.T)
```

### <a id="TestSkipEscapeComments" href="#TestSkipEscapeComments">func TestSkipEscapeComments(t *testing.T)</a>

```
searchKey: template_test.TestSkipEscapeComments
```

```Go
func TestSkipEscapeComments(t *testing.T)
```

