# Package webhooks

## Index

* [Constants](#const)
    * [const TokenHeaderName](#TokenHeaderName)
* [Variables](#var)
    * [var ErrObjectKindUnknown](#ErrObjectKindUnknown)
* [Types](#type)
    * [type EventCommon struct](#EventCommon)
    * [type MergeRequestApprovedEvent struct](#MergeRequestApprovedEvent)
        * [func (e *MergeRequestApprovedEvent) ToEventCommon() *MergeRequestEventCommon](#MergeRequestApprovedEvent.ToEventCommon)
    * [type MergeRequestCloseEvent struct](#MergeRequestCloseEvent)
        * [func (e *MergeRequestCloseEvent) ToEvent() keyer](#MergeRequestCloseEvent.ToEvent)
        * [func (e *MergeRequestCloseEvent) ToEventCommon() *MergeRequestEventCommon](#MergeRequestCloseEvent.ToEventCommon)
    * [type MergeRequestDraftEvent struct](#MergeRequestDraftEvent)
        * [func (e *MergeRequestDraftEvent) ToEvent() keyer](#MergeRequestDraftEvent.ToEvent)
        * [func (e *MergeRequestDraftEvent) ToEventCommon() *MergeRequestEventCommon](#MergeRequestDraftEvent.ToEventCommon)
    * [type MergeRequestEventCommon struct](#MergeRequestEventCommon)
    * [type MergeRequestEventCommonContainer interface](#MergeRequestEventCommonContainer)
    * [type MergeRequestMergeEvent struct](#MergeRequestMergeEvent)
        * [func (e *MergeRequestMergeEvent) ToEvent() keyer](#MergeRequestMergeEvent.ToEvent)
        * [func (e *MergeRequestMergeEvent) ToEventCommon() *MergeRequestEventCommon](#MergeRequestMergeEvent.ToEventCommon)
    * [type MergeRequestReopenEvent struct](#MergeRequestReopenEvent)
        * [func (e *MergeRequestReopenEvent) ToEvent() keyer](#MergeRequestReopenEvent.ToEvent)
        * [func (e *MergeRequestReopenEvent) ToEventCommon() *MergeRequestEventCommon](#MergeRequestReopenEvent.ToEventCommon)
    * [type MergeRequestUnapprovedEvent struct](#MergeRequestUnapprovedEvent)
        * [func (e *MergeRequestUnapprovedEvent) ToEventCommon() *MergeRequestEventCommon](#MergeRequestUnapprovedEvent.ToEventCommon)
    * [type MergeRequestUndraftEvent struct](#MergeRequestUndraftEvent)
        * [func (e *MergeRequestUndraftEvent) ToEvent() keyer](#MergeRequestUndraftEvent.ToEvent)
        * [func (e *MergeRequestUndraftEvent) ToEventCommon() *MergeRequestEventCommon](#MergeRequestUndraftEvent.ToEventCommon)
    * [type MergeRequestUpdateEvent struct](#MergeRequestUpdateEvent)
        * [func (e *MergeRequestUpdateEvent) ToEventCommon() *MergeRequestEventCommon](#MergeRequestUpdateEvent.ToEventCommon)
    * [type PipelineEvent struct](#PipelineEvent)
    * [type UpsertableWebhookEvent interface](#UpsertableWebhookEvent)
    * [type downcaster interface](#downcaster)
    * [type keyer interface](#keyer)
    * [type mergeRequestEvent struct](#mergeRequestEvent)
        * [func (mre *mergeRequestEvent) downcast() (interface{}, error)](#mergeRequestEvent.downcast)
    * [type mergeRequestEventChanges struct](#mergeRequestEventChanges)
    * [type mergeRequestEventObjectAttributes struct](#mergeRequestEventObjectAttributes)
* [Functions](#func)
    * [func TestMergeRequestDowncast(t *testing.T)](#TestMergeRequestDowncast)
    * [func TestUnmarshalEvent(t *testing.T)](#TestUnmarshalEvent)
    * [func UnmarshalEvent(data []byte) (interface{}, error)](#UnmarshalEvent)


## <a id="const" href="#const">Constants</a>

```
tags: [private]
```

### <a id="TokenHeaderName" href="#TokenHeaderName">const TokenHeaderName</a>

```
searchKey: webhooks.TokenHeaderName
tags: [constant string]
```

```Go
const TokenHeaderName = "X-Gitlab-Token"
```

## <a id="var" href="#var">Variables</a>

```
tags: [private]
```

### <a id="ErrObjectKindUnknown" href="#ErrObjectKindUnknown">var ErrObjectKindUnknown</a>

```
searchKey: webhooks.ErrObjectKindUnknown
tags: [variable interface]
```

```Go
var ErrObjectKindUnknown = errors.New("unknown object kind")
```

## <a id="type" href="#type">Types</a>

```
tags: [private]
```

### <a id="EventCommon" href="#EventCommon">type EventCommon struct</a>

```
searchKey: webhooks.EventCommon
tags: [struct]
```

```Go
type EventCommon struct {
	ObjectKind string               `json:"object_kind"`
	EventType  string               `json:"event_type"`
	Project    gitlab.ProjectCommon `json:"project"`
}
```

EventCommon contains fields that are common to all webhook event types. 

### <a id="MergeRequestApprovedEvent" href="#MergeRequestApprovedEvent">type MergeRequestApprovedEvent struct</a>

```
searchKey: webhooks.MergeRequestApprovedEvent
tags: [struct]
```

```Go
type MergeRequestApprovedEvent struct{ MergeRequestEventCommon }
```

#### <a id="MergeRequestApprovedEvent.ToEventCommon" href="#MergeRequestApprovedEvent.ToEventCommon">func (e *MergeRequestApprovedEvent) ToEventCommon() *MergeRequestEventCommon</a>

```
searchKey: webhooks.MergeRequestApprovedEvent.ToEventCommon
tags: [method]
```

```Go
func (e *MergeRequestApprovedEvent) ToEventCommon() *MergeRequestEventCommon
```

### <a id="MergeRequestCloseEvent" href="#MergeRequestCloseEvent">type MergeRequestCloseEvent struct</a>

```
searchKey: webhooks.MergeRequestCloseEvent
tags: [struct]
```

```Go
type MergeRequestCloseEvent struct{ MergeRequestEventCommon }
```

#### <a id="MergeRequestCloseEvent.ToEvent" href="#MergeRequestCloseEvent.ToEvent">func (e *MergeRequestCloseEvent) ToEvent() keyer</a>

```
searchKey: webhooks.MergeRequestCloseEvent.ToEvent
tags: [method]
```

```Go
func (e *MergeRequestCloseEvent) ToEvent() keyer
```

#### <a id="MergeRequestCloseEvent.ToEventCommon" href="#MergeRequestCloseEvent.ToEventCommon">func (e *MergeRequestCloseEvent) ToEventCommon() *MergeRequestEventCommon</a>

```
searchKey: webhooks.MergeRequestCloseEvent.ToEventCommon
tags: [method]
```

```Go
func (e *MergeRequestCloseEvent) ToEventCommon() *MergeRequestEventCommon
```

### <a id="MergeRequestDraftEvent" href="#MergeRequestDraftEvent">type MergeRequestDraftEvent struct</a>

```
searchKey: webhooks.MergeRequestDraftEvent
tags: [struct]
```

```Go
type MergeRequestDraftEvent struct{ MergeRequestEventCommon }
```

#### <a id="MergeRequestDraftEvent.ToEvent" href="#MergeRequestDraftEvent.ToEvent">func (e *MergeRequestDraftEvent) ToEvent() keyer</a>

```
searchKey: webhooks.MergeRequestDraftEvent.ToEvent
tags: [method]
```

```Go
func (e *MergeRequestDraftEvent) ToEvent() keyer
```

#### <a id="MergeRequestDraftEvent.ToEventCommon" href="#MergeRequestDraftEvent.ToEventCommon">func (e *MergeRequestDraftEvent) ToEventCommon() *MergeRequestEventCommon</a>

```
searchKey: webhooks.MergeRequestDraftEvent.ToEventCommon
tags: [method]
```

```Go
func (e *MergeRequestDraftEvent) ToEventCommon() *MergeRequestEventCommon
```

### <a id="MergeRequestEventCommon" href="#MergeRequestEventCommon">type MergeRequestEventCommon struct</a>

```
searchKey: webhooks.MergeRequestEventCommon
tags: [struct]
```

```Go
type MergeRequestEventCommon struct {
	EventCommon

	MergeRequest *gitlab.MergeRequest     `json:"merge_request"`
	User         *gitlab.User             `json:"user"`
	Labels       *[]gitlab.Label          `json:"labels"`
	Changes      mergeRequestEventChanges `json:"changes"`
}
```

MergeRequestEventCommon is the common type that underpins the types defined for specific merge request actions. 

### <a id="MergeRequestEventCommonContainer" href="#MergeRequestEventCommonContainer">type MergeRequestEventCommonContainer interface</a>

```
searchKey: webhooks.MergeRequestEventCommonContainer
tags: [interface]
```

```Go
type MergeRequestEventCommonContainer interface {
	ToEventCommon() *MergeRequestEventCommon
}
```

MergeRequestEventCommonContainer is a common interface for types that embed MergeRequestEvent to provide a method that can return the embedded MergeRequestEvent. 

### <a id="MergeRequestMergeEvent" href="#MergeRequestMergeEvent">type MergeRequestMergeEvent struct</a>

```
searchKey: webhooks.MergeRequestMergeEvent
tags: [struct]
```

```Go
type MergeRequestMergeEvent struct{ MergeRequestEventCommon }
```

#### <a id="MergeRequestMergeEvent.ToEvent" href="#MergeRequestMergeEvent.ToEvent">func (e *MergeRequestMergeEvent) ToEvent() keyer</a>

```
searchKey: webhooks.MergeRequestMergeEvent.ToEvent
tags: [method]
```

```Go
func (e *MergeRequestMergeEvent) ToEvent() keyer
```

#### <a id="MergeRequestMergeEvent.ToEventCommon" href="#MergeRequestMergeEvent.ToEventCommon">func (e *MergeRequestMergeEvent) ToEventCommon() *MergeRequestEventCommon</a>

```
searchKey: webhooks.MergeRequestMergeEvent.ToEventCommon
tags: [method]
```

```Go
func (e *MergeRequestMergeEvent) ToEventCommon() *MergeRequestEventCommon
```

### <a id="MergeRequestReopenEvent" href="#MergeRequestReopenEvent">type MergeRequestReopenEvent struct</a>

```
searchKey: webhooks.MergeRequestReopenEvent
tags: [struct]
```

```Go
type MergeRequestReopenEvent struct{ MergeRequestEventCommon }
```

#### <a id="MergeRequestReopenEvent.ToEvent" href="#MergeRequestReopenEvent.ToEvent">func (e *MergeRequestReopenEvent) ToEvent() keyer</a>

```
searchKey: webhooks.MergeRequestReopenEvent.ToEvent
tags: [method]
```

```Go
func (e *MergeRequestReopenEvent) ToEvent() keyer
```

#### <a id="MergeRequestReopenEvent.ToEventCommon" href="#MergeRequestReopenEvent.ToEventCommon">func (e *MergeRequestReopenEvent) ToEventCommon() *MergeRequestEventCommon</a>

```
searchKey: webhooks.MergeRequestReopenEvent.ToEventCommon
tags: [method]
```

```Go
func (e *MergeRequestReopenEvent) ToEventCommon() *MergeRequestEventCommon
```

### <a id="MergeRequestUnapprovedEvent" href="#MergeRequestUnapprovedEvent">type MergeRequestUnapprovedEvent struct</a>

```
searchKey: webhooks.MergeRequestUnapprovedEvent
tags: [struct]
```

```Go
type MergeRequestUnapprovedEvent struct{ MergeRequestEventCommon }
```

#### <a id="MergeRequestUnapprovedEvent.ToEventCommon" href="#MergeRequestUnapprovedEvent.ToEventCommon">func (e *MergeRequestUnapprovedEvent) ToEventCommon() *MergeRequestEventCommon</a>

```
searchKey: webhooks.MergeRequestUnapprovedEvent.ToEventCommon
tags: [method]
```

```Go
func (e *MergeRequestUnapprovedEvent) ToEventCommon() *MergeRequestEventCommon
```

### <a id="MergeRequestUndraftEvent" href="#MergeRequestUndraftEvent">type MergeRequestUndraftEvent struct</a>

```
searchKey: webhooks.MergeRequestUndraftEvent
tags: [struct]
```

```Go
type MergeRequestUndraftEvent struct{ MergeRequestEventCommon }
```

#### <a id="MergeRequestUndraftEvent.ToEvent" href="#MergeRequestUndraftEvent.ToEvent">func (e *MergeRequestUndraftEvent) ToEvent() keyer</a>

```
searchKey: webhooks.MergeRequestUndraftEvent.ToEvent
tags: [method]
```

```Go
func (e *MergeRequestUndraftEvent) ToEvent() keyer
```

#### <a id="MergeRequestUndraftEvent.ToEventCommon" href="#MergeRequestUndraftEvent.ToEventCommon">func (e *MergeRequestUndraftEvent) ToEventCommon() *MergeRequestEventCommon</a>

```
searchKey: webhooks.MergeRequestUndraftEvent.ToEventCommon
tags: [method]
```

```Go
func (e *MergeRequestUndraftEvent) ToEventCommon() *MergeRequestEventCommon
```

### <a id="MergeRequestUpdateEvent" href="#MergeRequestUpdateEvent">type MergeRequestUpdateEvent struct</a>

```
searchKey: webhooks.MergeRequestUpdateEvent
tags: [struct]
```

```Go
type MergeRequestUpdateEvent struct{ MergeRequestEventCommon }
```

#### <a id="MergeRequestUpdateEvent.ToEventCommon" href="#MergeRequestUpdateEvent.ToEventCommon">func (e *MergeRequestUpdateEvent) ToEventCommon() *MergeRequestEventCommon</a>

```
searchKey: webhooks.MergeRequestUpdateEvent.ToEventCommon
tags: [method]
```

```Go
func (e *MergeRequestUpdateEvent) ToEventCommon() *MergeRequestEventCommon
```

### <a id="PipelineEvent" href="#PipelineEvent">type PipelineEvent struct</a>

```
searchKey: webhooks.PipelineEvent
tags: [struct]
```

```Go
type PipelineEvent struct {
	EventCommon

	User         gitlab.User          `json:"user"`
	Pipeline     gitlab.Pipeline      `json:"object_attributes"`
	MergeRequest *gitlab.MergeRequest `json:"merge_request"`
}
```

### <a id="UpsertableWebhookEvent" href="#UpsertableWebhookEvent">type UpsertableWebhookEvent interface</a>

```
searchKey: webhooks.UpsertableWebhookEvent
tags: [interface]
```

```Go
type UpsertableWebhookEvent interface {
	MergeRequestEventCommonContainer
	ToEvent() keyer
}
```

UpsertableWebhookEvent is a common interface for types that embed ToEvent to provide a method that can return a changeset event derived from the webhook payload. 

### <a id="downcaster" href="#downcaster">type downcaster interface</a>

```
searchKey: webhooks.downcaster
tags: [interface private]
```

```Go
type downcaster interface {
	downcast() (interface{}, error)
}
```

### <a id="keyer" href="#keyer">type keyer interface</a>

```
searchKey: webhooks.keyer
tags: [interface private]
```

```Go
type keyer interface {
	Key() string
}
```

### <a id="mergeRequestEvent" href="#mergeRequestEvent">type mergeRequestEvent struct</a>

```
searchKey: webhooks.mergeRequestEvent
tags: [struct private]
```

```Go
type mergeRequestEvent struct {
	EventCommon

	User    *gitlab.User             `json:"user"`
	Labels  *[]gitlab.Label          `json:"labels"`
	Changes mergeRequestEventChanges `json:"changes"`

	ObjectAttributes mergeRequestEventObjectAttributes `json:"object_attributes"`
}
```

mergeRequestEvent is an internal type used for initially unmarshalling the typed event before it is downcast into a more specific type later based on the "action" field in the JSON. 

#### <a id="mergeRequestEvent.downcast" href="#mergeRequestEvent.downcast">func (mre *mergeRequestEvent) downcast() (interface{}, error)</a>

```
searchKey: webhooks.mergeRequestEvent.downcast
tags: [method private]
```

```Go
func (mre *mergeRequestEvent) downcast() (interface{}, error)
```

### <a id="mergeRequestEventChanges" href="#mergeRequestEventChanges">type mergeRequestEventChanges struct</a>

```
searchKey: webhooks.mergeRequestEventChanges
tags: [struct private]
```

```Go
type mergeRequestEventChanges struct {
	Title struct {
		Previous string `json:"previous"`
		Current  string `json:"current"`
	} `json:"title"`
	UpdatedAt struct {
		Current gitlab.Time `json:"current"`
	} `json:"updated_at"`
}
```

### <a id="mergeRequestEventObjectAttributes" href="#mergeRequestEventObjectAttributes">type mergeRequestEventObjectAttributes struct</a>

```
searchKey: webhooks.mergeRequestEventObjectAttributes
tags: [struct private]
```

```Go
type mergeRequestEventObjectAttributes struct {
	*gitlab.MergeRequest
	Action string `json:"action"`
}
```

## <a id="func" href="#func">Functions</a>

```
tags: [private]
```

### <a id="TestMergeRequestDowncast" href="#TestMergeRequestDowncast">func TestMergeRequestDowncast(t *testing.T)</a>

```
searchKey: webhooks.TestMergeRequestDowncast
tags: [function private test]
```

```Go
func TestMergeRequestDowncast(t *testing.T)
```

### <a id="TestUnmarshalEvent" href="#TestUnmarshalEvent">func TestUnmarshalEvent(t *testing.T)</a>

```
searchKey: webhooks.TestUnmarshalEvent
tags: [function private test]
```

```Go
func TestUnmarshalEvent(t *testing.T)
```

### <a id="UnmarshalEvent" href="#UnmarshalEvent">func UnmarshalEvent(data []byte) (interface{}, error)</a>

```
searchKey: webhooks.UnmarshalEvent
tags: [function]
```

```Go
func UnmarshalEvent(data []byte) (interface{}, error)
```

UnmarshalEvent unmarshals the given JSON into an event type. Possible return types are *MergeRequestEvent. 

Errors caused by a valid payload being of an unknown type may be distinguished from other errors by checking for ErrObjectKindUnknown in the error chain; note that the top level error value will not be equal to ErrObjectKindUnknown in this case. 

