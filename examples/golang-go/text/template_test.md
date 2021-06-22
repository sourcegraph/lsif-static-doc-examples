# Package template_test

## Index

* [Types](#type)
    * [type templateFile struct](#templateFile)
* [Functions](#func)
    * [func ExampleTemplate()](#ExampleTemplate)
    * [func ExampleTemplate_block()](#ExampleTemplate_block)
    * [func createTestDir(files []templateFile) string](#createTestDir)
    * [func ExampleTemplate_glob()](#ExampleTemplate_glob)
    * [func ExampleTemplate_helpers()](#ExampleTemplate_helpers)
    * [func ExampleTemplate_share()](#ExampleTemplate_share)
    * [func ExampleTemplate_func()](#ExampleTemplate_func)
    * [func TestLinkerGC(t *testing.T)](#TestLinkerGC)


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

## <a id="func" href="#func">Functions</a>

### <a id="ExampleTemplate" href="#ExampleTemplate">func ExampleTemplate()</a>

```
searchKey: template_test.ExampleTemplate
```

```Go
func ExampleTemplate()
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

### <a id="ExampleTemplate_func" href="#ExampleTemplate_func">func ExampleTemplate_func()</a>

```
searchKey: template_test.ExampleTemplate_func
```

```Go
func ExampleTemplate_func()
```

This example demonstrates a custom function to process template text. It installs the strings.Title function and uses it to Make Title Text Look Good In Our Template's Output. 

### <a id="TestLinkerGC" href="#TestLinkerGC">func TestLinkerGC(t *testing.T)</a>

```
searchKey: template_test.TestLinkerGC
```

```Go
func TestLinkerGC(t *testing.T)
```

Issue 36021: verify that text/template doesn't prevent the linker from removing unused methods. 

