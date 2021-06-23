# Package webhooks

## Index

* [Constants](#const)
    * [const TokenHeaderName](#TokenHeaderName)
* [Variables](#var)
    * [var ErrObjectKindUnknown](#ErrObjectKindUnknown)
* [Types](#type)
    * [type EventCommon struct](#EventCommon)
    * [type PipelineEvent struct](#PipelineEvent)
    * [type downcaster interface](#downcaster)
    * [type MergeRequestEventCommon struct](#MergeRequestEventCommon)
    * [type mergeRequestEventChanges struct](#mergeRequestEventChanges)
    * [type MergeRequestEventCommonContainer interface](#MergeRequestEventCommonContainer)
    * [type keyer interface](#keyer)
    * [type UpsertableWebhookEvent interface](#UpsertableWebhookEvent)
    * [type MergeRequestApprovedEvent struct](#MergeRequestApprovedEvent)
        * [func (e *MergeRequestApprovedEvent) ToEventCommon() *MergeRequestEventCommon](#MergeRequestApprovedEvent.ToEventCommon)
    * [type MergeRequestUnapprovedEvent struct](#MergeRequestUnapprovedEvent)
        * [func (e *MergeRequestUnapprovedEvent) ToEventCommon() *MergeRequestEventCommon](#MergeRequestUnapprovedEvent.ToEventCommon)
    * [type MergeRequestUpdateEvent struct](#MergeRequestUpdateEvent)
        * [func (e *MergeRequestUpdateEvent) ToEventCommon() *MergeRequestEventCommon](#MergeRequestUpdateEvent.ToEventCommon)
    * [type MergeRequestCloseEvent struct](#MergeRequestCloseEvent)
        * [func (e *MergeRequestCloseEvent) ToEventCommon() *MergeRequestEventCommon](#MergeRequestCloseEvent.ToEventCommon)
        * [func (e *MergeRequestCloseEvent) ToEvent() keyer](#MergeRequestCloseEvent.ToEvent)
    * [type MergeRequestMergeEvent struct](#MergeRequestMergeEvent)
        * [func (e *MergeRequestMergeEvent) ToEventCommon() *MergeRequestEventCommon](#MergeRequestMergeEvent.ToEventCommon)
        * [func (e *MergeRequestMergeEvent) ToEvent() keyer](#MergeRequestMergeEvent.ToEvent)
    * [type MergeRequestReopenEvent struct](#MergeRequestReopenEvent)
        * [func (e *MergeRequestReopenEvent) ToEventCommon() *MergeRequestEventCommon](#MergeRequestReopenEvent.ToEventCommon)
        * [func (e *MergeRequestReopenEvent) ToEvent() keyer](#MergeRequestReopenEvent.ToEvent)
    * [type MergeRequestUndraftEvent struct](#MergeRequestUndraftEvent)
        * [func (e *MergeRequestUndraftEvent) ToEventCommon() *MergeRequestEventCommon](#MergeRequestUndraftEvent.ToEventCommon)
        * [func (e *MergeRequestUndraftEvent) ToEvent() keyer](#MergeRequestUndraftEvent.ToEvent)
    * [type MergeRequestDraftEvent struct](#MergeRequestDraftEvent)
        * [func (e *MergeRequestDraftEvent) ToEventCommon() *MergeRequestEventCommon](#MergeRequestDraftEvent.ToEventCommon)
        * [func (e *MergeRequestDraftEvent) ToEvent() keyer](#MergeRequestDraftEvent.ToEvent)
    * [type mergeRequestEvent struct](#mergeRequestEvent)
        * [func (mre *mergeRequestEvent) downcast() (interface{}, error)](#mergeRequestEvent.downcast)
    * [type mergeRequestEventObjectAttributes struct](#mergeRequestEventObjectAttributes)
* [Functions](#func)
    * [func UnmarshalEvent(data []byte) (interface{}, error)](#UnmarshalEvent)
    * [func TestUnmarshalEvent(t *testing.T)](#TestUnmarshalEvent)
    * [func TestMergeRequestDowncast(t *testing.T)](#TestMergeRequestDowncast)


## <a id="const" href="#const">Constants</a>

```
tags: [private]
```

### <a id="TokenHeaderName" href="#TokenHeaderName">const TokenHeaderName</a>

```
searchKey: webhooks.TokenHeaderName
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
```

```Go
type EventCommon struct {
	ObjectKind string               `json:"object_kind"`
	EventType  string               `json:"event_type"`
	Project    gitlab.ProjectCommon `json:"project"`
}
```

EventCommon contains fields that are common to all webhook event types. 

### <a id="PipelineEvent" href="#PipelineEvent">type PipelineEvent struct</a>

```
searchKey: webhooks.PipelineEvent
```

```Go
type PipelineEvent struct {
	EventCommon

	User         gitlab.User          `json:"user"`
	Pipeline     gitlab.Pipeline      `json:"object_attributes"`
	MergeRequest *gitlab.MergeRequest `json:"merge_request"`
}
```

### <a id="downcaster" href="#downcaster">type downcaster interface</a>

```
searchKey: webhooks.downcaster
tags: [private]
```

```Go
type downcaster interface {
	downcast() (interface{}, error)
}
```

### <a id="MergeRequestEventCommon" href="#MergeRequestEventCommon">type MergeRequestEventCommon struct</a>

```
searchKey: webhooks.MergeRequestEventCommon
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

### <a id="mergeRequestEventChanges" href="#mergeRequestEventChanges">type mergeRequestEventChanges struct</a>

```
searchKey: webhooks.mergeRequestEventChanges
tags: [private]
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

### <a id="MergeRequestEventCommonContainer" href="#MergeRequestEventCommonContainer">type MergeRequestEventCommonContainer interface</a>

```
searchKey: webhooks.MergeRequestEventCommonContainer
```

```Go
type MergeRequestEventCommonContainer interface {
	ToEventCommon() *MergeRequestEventCommon
}
```

MergeRequestEventCommonContainer is a common interface for types that embed MergeRequestEvent to provide a method that can return the embedded MergeRequestEvent. 

### <a id="keyer" href="#keyer">type keyer interface</a>

```
searchKey: webhooks.keyer
tags: [private]
```

```Go
type keyer interface {
	Key() string
}
```

### <a id="UpsertableWebhookEvent" href="#UpsertableWebhookEvent">type UpsertableWebhookEvent interface</a>

```
searchKey: webhooks.UpsertableWebhookEvent
```

```Go
type UpsertableWebhookEvent interface {
	MergeRequestEventCommonContainer
	ToEvent() keyer
}
```

UpsertableWebhookEvent is a common interface for types that embed ToEvent to provide a method that can return a changeset event derived from the webhook payload. 

### <a id="MergeRequestApprovedEvent" href="#MergeRequestApprovedEvent">type MergeRequestApprovedEvent struct</a>

```
searchKey: webhooks.MergeRequestApprovedEvent
```

```Go
type MergeRequestApprovedEvent struct{ MergeRequestEventCommon }
```

#### <a id="MergeRequestApprovedEvent.ToEventCommon" href="#MergeRequestApprovedEvent.ToEventCommon">func (e *MergeRequestApprovedEvent) ToEventCommon() *MergeRequestEventCommon</a>

```
searchKey: webhooks.MergeRequestApprovedEvent.ToEventCommon
```

```Go
func (e *MergeRequestApprovedEvent) ToEventCommon() *MergeRequestEventCommon
```

### <a id="MergeRequestUnapprovedEvent" href="#MergeRequestUnapprovedEvent">type MergeRequestUnapprovedEvent struct</a>

```
searchKey: webhooks.MergeRequestUnapprovedEvent
```

```Go
type MergeRequestUnapprovedEvent struct{ MergeRequestEventCommon }
```

#### <a id="MergeRequestUnapprovedEvent.ToEventCommon" href="#MergeRequestUnapprovedEvent.ToEventCommon">func (e *MergeRequestUnapprovedEvent) ToEventCommon() *MergeRequestEventCommon</a>

```
searchKey: webhooks.MergeRequestUnapprovedEvent.ToEventCommon
```

```Go
func (e *MergeRequestUnapprovedEvent) ToEventCommon() *MergeRequestEventCommon
```

### <a id="MergeRequestUpdateEvent" href="#MergeRequestUpdateEvent">type MergeRequestUpdateEvent struct</a>

```
searchKey: webhooks.MergeRequestUpdateEvent
```

```Go
type MergeRequestUpdateEvent struct{ MergeRequestEventCommon }
```

#### <a id="MergeRequestUpdateEvent.ToEventCommon" href="#MergeRequestUpdateEvent.ToEventCommon">func (e *MergeRequestUpdateEvent) ToEventCommon() *MergeRequestEventCommon</a>

```
searchKey: webhooks.MergeRequestUpdateEvent.ToEventCommon
```

```Go
func (e *MergeRequestUpdateEvent) ToEventCommon() *MergeRequestEventCommon
```

### <a id="MergeRequestCloseEvent" href="#MergeRequestCloseEvent">type MergeRequestCloseEvent struct</a>

```
searchKey: webhooks.MergeRequestCloseEvent
```

```Go
type MergeRequestCloseEvent struct{ MergeRequestEventCommon }
```

#### <a id="MergeRequestCloseEvent.ToEventCommon" href="#MergeRequestCloseEvent.ToEventCommon">func (e *MergeRequestCloseEvent) ToEventCommon() *MergeRequestEventCommon</a>

```
searchKey: webhooks.MergeRequestCloseEvent.ToEventCommon
```

```Go
func (e *MergeRequestCloseEvent) ToEventCommon() *MergeRequestEventCommon
```

#### <a id="MergeRequestCloseEvent.ToEvent" href="#MergeRequestCloseEvent.ToEvent">func (e *MergeRequestCloseEvent) ToEvent() keyer</a>

```
searchKey: webhooks.MergeRequestCloseEvent.ToEvent
```

```Go
func (e *MergeRequestCloseEvent) ToEvent() keyer
```

### <a id="MergeRequestMergeEvent" href="#MergeRequestMergeEvent">type MergeRequestMergeEvent struct</a>

```
searchKey: webhooks.MergeRequestMergeEvent
```

```Go
type MergeRequestMergeEvent struct{ MergeRequestEventCommon }
```

#### <a id="MergeRequestMergeEvent.ToEventCommon" href="#MergeRequestMergeEvent.ToEventCommon">func (e *MergeRequestMergeEvent) ToEventCommon() *MergeRequestEventCommon</a>

```
searchKey: webhooks.MergeRequestMergeEvent.ToEventCommon
```

```Go
func (e *MergeRequestMergeEvent) ToEventCommon() *MergeRequestEventCommon
```

#### <a id="MergeRequestMergeEvent.ToEvent" href="#MergeRequestMergeEvent.ToEvent">func (e *MergeRequestMergeEvent) ToEvent() keyer</a>

```
searchKey: webhooks.MergeRequestMergeEvent.ToEvent
```

```Go
func (e *MergeRequestMergeEvent) ToEvent() keyer
```

### <a id="MergeRequestReopenEvent" href="#MergeRequestReopenEvent">type MergeRequestReopenEvent struct</a>

```
searchKey: webhooks.MergeRequestReopenEvent
```

```Go
type MergeRequestReopenEvent struct{ MergeRequestEventCommon }
```

#### <a id="MergeRequestReopenEvent.ToEventCommon" href="#MergeRequestReopenEvent.ToEventCommon">func (e *MergeRequestReopenEvent) ToEventCommon() *MergeRequestEventCommon</a>

```
searchKey: webhooks.MergeRequestReopenEvent.ToEventCommon
```

```Go
func (e *MergeRequestReopenEvent) ToEventCommon() *MergeRequestEventCommon
```

#### <a id="MergeRequestReopenEvent.ToEvent" href="#MergeRequestReopenEvent.ToEvent">func (e *MergeRequestReopenEvent) ToEvent() keyer</a>

```
searchKey: webhooks.MergeRequestReopenEvent.ToEvent
```

```Go
func (e *MergeRequestReopenEvent) ToEvent() keyer
```

### <a id="MergeRequestUndraftEvent" href="#MergeRequestUndraftEvent">type MergeRequestUndraftEvent struct</a>

```
searchKey: webhooks.MergeRequestUndraftEvent
```

```Go
type MergeRequestUndraftEvent struct{ MergeRequestEventCommon }
```

#### <a id="MergeRequestUndraftEvent.ToEventCommon" href="#MergeRequestUndraftEvent.ToEventCommon">func (e *MergeRequestUndraftEvent) ToEventCommon() *MergeRequestEventCommon</a>

```
searchKey: webhooks.MergeRequestUndraftEvent.ToEventCommon
```

```Go
func (e *MergeRequestUndraftEvent) ToEventCommon() *MergeRequestEventCommon
```

#### <a id="MergeRequestUndraftEvent.ToEvent" href="#MergeRequestUndraftEvent.ToEvent">func (e *MergeRequestUndraftEvent) ToEvent() keyer</a>

```
searchKey: webhooks.MergeRequestUndraftEvent.ToEvent
```

```Go
func (e *MergeRequestUndraftEvent) ToEvent() keyer
```

### <a id="MergeRequestDraftEvent" href="#MergeRequestDraftEvent">type MergeRequestDraftEvent struct</a>

```
searchKey: webhooks.MergeRequestDraftEvent
```

```Go
type MergeRequestDraftEvent struct{ MergeRequestEventCommon }
```

#### <a id="MergeRequestDraftEvent.ToEventCommon" href="#MergeRequestDraftEvent.ToEventCommon">func (e *MergeRequestDraftEvent) ToEventCommon() *MergeRequestEventCommon</a>

```
searchKey: webhooks.MergeRequestDraftEvent.ToEventCommon
```

```Go
func (e *MergeRequestDraftEvent) ToEventCommon() *MergeRequestEventCommon
```

#### <a id="MergeRequestDraftEvent.ToEvent" href="#MergeRequestDraftEvent.ToEvent">func (e *MergeRequestDraftEvent) ToEvent() keyer</a>

```
searchKey: webhooks.MergeRequestDraftEvent.ToEvent
```

```Go
func (e *MergeRequestDraftEvent) ToEvent() keyer
```

### <a id="mergeRequestEvent" href="#mergeRequestEvent">type mergeRequestEvent struct</a>

```
searchKey: webhooks.mergeRequestEvent
tags: [private]
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
tags: [private]
```

```Go
func (mre *mergeRequestEvent) downcast() (interface{}, error)
```

### <a id="mergeRequestEventObjectAttributes" href="#mergeRequestEventObjectAttributes">type mergeRequestEventObjectAttributes struct</a>

```
searchKey: webhooks.mergeRequestEventObjectAttributes
tags: [private]
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

### <a id="UnmarshalEvent" href="#UnmarshalEvent">func UnmarshalEvent(data []byte) (interface{}, error)</a>

```
searchKey: webhooks.UnmarshalEvent
```

```Go
func UnmarshalEvent(data []byte) (interface{}, error)
```

UnmarshalEvent unmarshals the given JSON into an event type. Possible return types are *MergeRequestEvent. 

Errors caused by a valid payload being of an unknown type may be distinguished from other errors by checking for ErrObjectKindUnknown in the error chain; note that the top level error value will not be equal to ErrObjectKindUnknown in this case. 

### <a id="TestUnmarshalEvent" href="#TestUnmarshalEvent">func TestUnmarshalEvent(t *testing.T)</a>

```
searchKey: webhooks.TestUnmarshalEvent
tags: [private]
```

```Go
func TestUnmarshalEvent(t *testing.T)
```

### <a id="TestMergeRequestDowncast" href="#TestMergeRequestDowncast">func TestMergeRequestDowncast(t *testing.T)</a>

```
searchKey: webhooks.TestMergeRequestDowncast
tags: [private]
```

```Go
func TestMergeRequestDowncast(t *testing.T)
```

