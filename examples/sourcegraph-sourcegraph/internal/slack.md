# Package slack

Package slack is used to send notifications of an organization's activity to a given Slack webhook. 

## Index

* [Types](#type)
    * [type Attachment struct](#Attachment)
    * [type Client struct](#Client)
        * [func New(webhookURL string) *Client](#New)
        * [func (c *Client) Post(ctx context.Context, payload *Payload) error](#Client.Post)
    * [type Field struct](#Field)
    * [type Payload struct](#Payload)


## <a id="type" href="#type">Types</a>

```
tags: [private]
```

### <a id="Attachment" href="#Attachment">type Attachment struct</a>

```
searchKey: slack.Attachment
tags: [struct]
```

```Go
type Attachment struct {
	AuthorIcon string   `json:"author_icon,omitempty"`
	AuthorLink string   `json:"author_link,omitempty"`
	AuthorName string   `json:"author_name,omitempty"`
	Color      string   `json:"color"`
	Fallback   string   `json:"fallback"`
	Fields     []*Field `json:"fields"`
	Footer     string   `json:"footer"`
	MarkdownIn []string `json:"mrkdwn_in"`
	ThumbURL   string   `json:"thumb_url"`
	Text       string   `json:"text,omitempty"`
	Timestamp  int64    `json:"ts"`
	Title      string   `json:"title"`
	TitleLink  string   `json:"title_link,omitempty"`
}
```

Attachment is a Slack message attachment, defined at: [https://api.slack.com/docs/message-attachments](https://api.slack.com/docs/message-attachments) 

### <a id="Client" href="#Client">type Client struct</a>

```
searchKey: slack.Client
tags: [struct]
```

```Go
type Client struct {
	WebhookURL string
}
```

Client is capable of posting a message to a Slack webhook 

#### <a id="New" href="#New">func New(webhookURL string) *Client</a>

```
searchKey: slack.New
tags: [function]
```

```Go
func New(webhookURL string) *Client
```

New creates a new Slack client 

#### <a id="Client.Post" href="#Client.Post">func (c *Client) Post(ctx context.Context, payload *Payload) error</a>

```
searchKey: slack.Client.Post
tags: [method]
```

```Go
func (c *Client) Post(ctx context.Context, payload *Payload) error
```

Post sends payload to a Slack channel. 

### <a id="Field" href="#Field">type Field struct</a>

```
searchKey: slack.Field
tags: [struct]
```

```Go
type Field struct {
	Short bool   `json:"short"`
	Title string `json:"title"`
	Value string `json:"value"`
}
```

Field is a single item within an attachment, defined at: [https://api.slack.com/docs/message-attachments](https://api.slack.com/docs/message-attachments) 

### <a id="Payload" href="#Payload">type Payload struct</a>

```
searchKey: slack.Payload
tags: [struct]
```

```Go
type Payload struct {
	Username    string        `json:"username,omitempty"`
	IconEmoji   string        `json:"icon_emoji,omitempty"`
	UnfurlLinks bool          `json:"unfurl_links,omitempty"`
	UnfurlMedia bool          `json:"unfurl_media,omitempty"`
	Text        string        `json:"text,omitempty"`
	Attachments []*Attachment `json:"attachments,omitempty"`
}
```

Payload is the wrapper for a Slack message, defined at: [https://api.slack.com/docs/message-formatting](https://api.slack.com/docs/message-formatting) 

