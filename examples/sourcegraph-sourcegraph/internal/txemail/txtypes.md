# Package txtypes

## Index

* [Types](#type)
    * [type Message struct](#Message)
    * [type Templates struct](#Templates)
    * [type ParsedTemplates struct](#ParsedTemplates)


## <a id="type" href="#type">Types</a>

### <a id="Message" href="#Message">type Message struct</a>

```
searchKey: txtypes.Message
tags: [exported]
```

```Go
type Message struct {
	FromName   string   // email "From" address proper name
	To         []string // email "To" recipients
	ReplyTo    *string  // optional "ReplyTo" address
	MessageID  *string  // optional "Message-ID" header
	References []string // optional "References" header list

	Template Templates   // unparsed subject/body templates
	Data     interface{} // template data
}
```

Message describes an email message to be sent. 

### <a id="Templates" href="#Templates">type Templates struct</a>

```
searchKey: txtypes.Templates
tags: [exported]
```

```Go
type Templates struct {
	Subject string // text/template subject template
	Text    string // text/template text body template
	HTML    string //  html/template HTML body template
}
```

Templates contains the text and HTML templates for an email. 

### <a id="ParsedTemplates" href="#ParsedTemplates">type ParsedTemplates struct</a>

```
searchKey: txtypes.ParsedTemplates
tags: [exported]
```

```Go
type ParsedTemplates struct {
	Subj *texttemplate.Template
	Text *texttemplate.Template
	Html *htmltemplate.Template
}
```

ParsedTemplates contains parsed text and HTML email templates. 

