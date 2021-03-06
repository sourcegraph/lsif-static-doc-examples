# Package txemail

Package txemail sends transactional emails. 

## Index

* Subpages
  * [internal/txemail/txtypes](txemail/txtypes.md)
* [Variables](#var)
    * [var MockSend](#MockSend)
    * [var disableSilently](#disableSilently)
    * [var htmlFuncMap](#htmlFuncMap)
    * [var textFuncMap](#textFuncMap)
* [Types](#type)
    * [type Message struct](#Message)
* [Functions](#func)
    * [func DisableSilently()](#DisableSilently)
    * [func MustParseTemplate(input txtypes.Templates) txtypes.ParsedTemplates](#MustParseTemplate)
    * [func MustValidate(input txtypes.Templates) txtypes.Templates](#MustValidate)
    * [func ParseTemplate(input txtypes.Templates) (*txtypes.ParsedTemplates, error)](#ParseTemplate)
    * [func Send(ctx context.Context, message Message) error](#Send)
    * [func TestParseTemplate(t *testing.T)](#TestParseTemplate)
    * [func TestRender(t *testing.T)](#TestRender)
    * [func render(message Message) (*email.Email, error)](#render)
    * [func renderTemplate(t *txtypes.ParsedTemplates, data interface{}, m *email.Email) error](#renderTemplate)


## <a id="var" href="#var">Variables</a>

```
tags: [private]
```

### <a id="MockSend" href="#MockSend">var MockSend</a>

```
searchKey: txemail.MockSend
tags: [variable function]
```

```Go
var MockSend func(ctx context.Context, message Message) error
```

MockSend is used in tests to mock the Send func. 

### <a id="disableSilently" href="#disableSilently">var disableSilently</a>

```
searchKey: txemail.disableSilently
tags: [variable boolean private]
```

```Go
var disableSilently bool
```

### <a id="htmlFuncMap" href="#htmlFuncMap">var htmlFuncMap</a>

```
searchKey: txemail.htmlFuncMap
tags: [variable object private]
```

```Go
var htmlFuncMap = ...
```

### <a id="textFuncMap" href="#textFuncMap">var textFuncMap</a>

```
searchKey: txemail.textFuncMap
tags: [variable object private]
```

```Go
var textFuncMap = ...
```

## <a id="type" href="#type">Types</a>

```
tags: [private]
```

### <a id="Message" href="#Message">type Message struct</a>

```
searchKey: txemail.Message
tags: [struct]
```

```Go
type Message struct {
	FromName   string   // email "From" address proper name
	To         []string // email "To" recipients
	ReplyTo    *string  // optional "ReplyTo" address
	MessageID  *string  // optional "Message-ID" header
	References []string // optional "References" header list

	Template txtypes.Templates // unparsed subject/body templates
	Data     interface{}       // template data
}
```

Message describes an email message to be sent. 

## <a id="func" href="#func">Functions</a>

```
tags: [private]
```

### <a id="DisableSilently" href="#DisableSilently">func DisableSilently()</a>

```
searchKey: txemail.DisableSilently
tags: [function]
```

```Go
func DisableSilently()
```

DisableSilently prevents sending of emails, even if email sending is configured. Use it in tests to ensure that they do not send real emails. 

### <a id="MustParseTemplate" href="#MustParseTemplate">func MustParseTemplate(input txtypes.Templates) txtypes.ParsedTemplates</a>

```
searchKey: txemail.MustParseTemplate
tags: [function]
```

```Go
func MustParseTemplate(input txtypes.Templates) txtypes.ParsedTemplates
```

MustParseTemplate calls ParseTemplate and panics if an error is returned. It is intended to be called in a package init func. 

### <a id="MustValidate" href="#MustValidate">func MustValidate(input txtypes.Templates) txtypes.Templates</a>

```
searchKey: txemail.MustValidate
tags: [function]
```

```Go
func MustValidate(input txtypes.Templates) txtypes.Templates
```

MustValidate panics if the templates are unparsable, otherwise it returns them unmodified. 

### <a id="ParseTemplate" href="#ParseTemplate">func ParseTemplate(input txtypes.Templates) (*txtypes.ParsedTemplates, error)</a>

```
searchKey: txemail.ParseTemplate
tags: [function]
```

```Go
func ParseTemplate(input txtypes.Templates) (*txtypes.ParsedTemplates, error)
```

ParseTemplate is a helper func for parsing the text/template and html/template templates together. In the future it will also provide common template funcs and a common footer. 

### <a id="Send" href="#Send">func Send(ctx context.Context, message Message) error</a>

```
searchKey: txemail.Send
tags: [function]
```

```Go
func Send(ctx context.Context, message Message) error
```

Send sends a transactional email. 

Callers that do not live in the frontend should call api.InternalClient.SendEmail instead. TODO(slimsag): needs cleanup as part of upcoming configuration refactor. 

### <a id="TestParseTemplate" href="#TestParseTemplate">func TestParseTemplate(t *testing.T)</a>

```
searchKey: txemail.TestParseTemplate
tags: [function private test]
```

```Go
func TestParseTemplate(t *testing.T)
```

### <a id="TestRender" href="#TestRender">func TestRender(t *testing.T)</a>

```
searchKey: txemail.TestRender
tags: [function private test]
```

```Go
func TestRender(t *testing.T)
```

### <a id="render" href="#render">func render(message Message) (*email.Email, error)</a>

```
searchKey: txemail.render
tags: [function private]
```

```Go
func render(message Message) (*email.Email, error)
```

render returns the rendered message contents without sending email. 

### <a id="renderTemplate" href="#renderTemplate">func renderTemplate(t *txtypes.ParsedTemplates, data interface{}, m *email.Email) error</a>

```
searchKey: txemail.renderTemplate
tags: [function private]
```

```Go
func renderTemplate(t *txtypes.ParsedTemplates, data interface{}, m *email.Email) error
```

