# Package http

package http contains Sourcegraph's streaming HTTP protocol, which is based on Server Sent Events (SSE). 

## Index

* [Constants](#const)
    * [const CommitMatchType](#CommitMatchType)
    * [const FileMatchType](#FileMatchType)
    * [const RepoMatchType](#RepoMatchType)
    * [const SymbolMatchType](#SymbolMatchType)
* [Types](#type)
    * [type Decoder struct](#Decoder)
        * [func (rr Decoder) ReadAll(r io.Reader) error](#Decoder.ReadAll)
    * [type EventAlert struct](#EventAlert)
    * [type EventCommitMatch struct](#EventCommitMatch)
        * [func (e *EventCommitMatch) eventMatch()](#EventCommitMatch.eventMatch)
    * [type EventError struct](#EventError)
    * [type EventFileMatch struct](#EventFileMatch)
        * [func (e *EventFileMatch) eventMatch()](#EventFileMatch.eventMatch)
    * [type EventFilter struct](#EventFilter)
    * [type EventLineMatch struct](#EventLineMatch)
    * [type EventMatch interface](#EventMatch)
    * [type EventRepoMatch struct](#EventRepoMatch)
        * [func (e *EventRepoMatch) eventMatch()](#EventRepoMatch.eventMatch)
    * [type EventSymbolMatch struct](#EventSymbolMatch)
        * [func (e *EventSymbolMatch) eventMatch()](#EventSymbolMatch.eventMatch)
    * [type MatchType int](#MatchType)
        * [func (t MatchType) MarshalJSON() ([]byte, error)](#MatchType.MarshalJSON)
        * [func (t *MatchType) UnmarshalJSON(b []byte) error](#MatchType.UnmarshalJSON)
    * [type ProposedQuery struct](#ProposedQuery)
    * [type Symbol struct](#Symbol)
    * [type Writer struct](#Writer)
        * [func NewWriter(w http.ResponseWriter) (*Writer, error)](#NewWriter)
        * [func (e *Writer) Event(event string, data interface{}) error](#Writer.Event)
        * [func (e *Writer) EventBytes(event string, dataLine []byte) (err error)](#Writer.EventBytes)
    * [type WriterStat struct](#WriterStat)
    * [type eventMatchUnmarshaller struct](#eventMatchUnmarshaller)
        * [func (r *eventMatchUnmarshaller) UnmarshalJSON(b []byte) error](#eventMatchUnmarshaller.UnmarshalJSON)
* [Functions](#func)
    * [func NewRequest(baseURL string, query string) (*http.Request, error)](#NewRequest)
    * [func TestDecoder(t *testing.T)](#TestDecoder)
    * [func splitColon(data []byte) ([]byte, []byte)](#splitColon)


## <a id="const" href="#const">Constants</a>

```
tags: [private]
```

### <a id="CommitMatchType" href="#CommitMatchType">const CommitMatchType</a>

```
searchKey: http.CommitMatchType
tags: [constant number]
```

```Go
const CommitMatchType
```

### <a id="FileMatchType" href="#FileMatchType">const FileMatchType</a>

```
searchKey: http.FileMatchType
tags: [constant number]
```

```Go
const FileMatchType MatchType = iota
```

### <a id="RepoMatchType" href="#RepoMatchType">const RepoMatchType</a>

```
searchKey: http.RepoMatchType
tags: [constant number]
```

```Go
const RepoMatchType
```

### <a id="SymbolMatchType" href="#SymbolMatchType">const SymbolMatchType</a>

```
searchKey: http.SymbolMatchType
tags: [constant number]
```

```Go
const SymbolMatchType
```

## <a id="type" href="#type">Types</a>

```
tags: [private]
```

### <a id="Decoder" href="#Decoder">type Decoder struct</a>

```
searchKey: http.Decoder
tags: [struct]
```

```Go
type Decoder struct {
	OnProgress func(*api.Progress)
	OnMatches  func([]EventMatch)
	OnFilters  func([]*EventFilter)
	OnAlert    func(*EventAlert)
	OnError    func(*EventError)
	OnUnknown  func(event, data []byte)
}
```

Decoder decodes streaming events from a Server Sent Event stream. We only support streams which are generated by Sourcegraph. IE this is not a fully compliant Server Sent Events decoder. 

#### <a id="Decoder.ReadAll" href="#Decoder.ReadAll">func (rr Decoder) ReadAll(r io.Reader) error</a>

```
searchKey: http.Decoder.ReadAll
tags: [method]
```

```Go
func (rr Decoder) ReadAll(r io.Reader) error
```

### <a id="EventAlert" href="#EventAlert">type EventAlert struct</a>

```
searchKey: http.EventAlert
tags: [struct]
```

```Go
type EventAlert struct {
	Title           string          `json:"title"`
	Description     string          `json:"description,omitempty"`
	ProposedQueries []ProposedQuery `json:"proposedQueries"`
}
```

EventAlert is GQL.SearchAlert. It replaces when sent to match existing behaviour. 

### <a id="EventCommitMatch" href="#EventCommitMatch">type EventCommitMatch struct</a>

```
searchKey: http.EventCommitMatch
tags: [struct]
```

```Go
type EventCommitMatch struct {
	// Type is always CommitMatchType. Included here for marshalling.
	Type MatchType `json:"type"`

	Label      string `json:"label"`
	URL        string `json:"url"`
	Detail     string `json:"detail"`
	Repository string `json:"repository"`
	RepoStars  int    `json:"repoStars,omitempty"`
	Content    string `json:"content"`
	// [line, character, length]
	Ranges [][3]int32 `json:"ranges"`
}
```

EventCommitMatch is the generic results interface from GQL. There is a lot of potential data that may be useful here, and some thought needs to be put into what is actually useful in a commit result / or if we should have a "type" for that. 

#### <a id="EventCommitMatch.eventMatch" href="#EventCommitMatch.eventMatch">func (e *EventCommitMatch) eventMatch()</a>

```
searchKey: http.EventCommitMatch.eventMatch
tags: [method private]
```

```Go
func (e *EventCommitMatch) eventMatch()
```

### <a id="EventError" href="#EventError">type EventError struct</a>

```
searchKey: http.EventError
tags: [struct]
```

```Go
type EventError struct {
	Message string `json:"message"`
}
```

EventError emulates a JavaScript error with a message property as is returned when the search encounters an error. 

### <a id="EventFileMatch" href="#EventFileMatch">type EventFileMatch struct</a>

```
searchKey: http.EventFileMatch
tags: [struct]
```

```Go
type EventFileMatch struct {
	// Type is always FileMatchType. Included here for marshalling.
	Type MatchType `json:"type"`

	Path       string   `json:"name"`
	Repository string   `json:"repository"`
	RepoStars  int      `json:"repoStars,omitempty"`
	Branches   []string `json:"branches,omitempty"`
	Version    string   `json:"version,omitempty"`

	LineMatches []EventLineMatch `json:"lineMatches"`
}
```

EventFileMatch is a subset of zoekt.FileMatch for our Event API. 

#### <a id="EventFileMatch.eventMatch" href="#EventFileMatch.eventMatch">func (e *EventFileMatch) eventMatch()</a>

```
searchKey: http.EventFileMatch.eventMatch
tags: [method private]
```

```Go
func (e *EventFileMatch) eventMatch()
```

### <a id="EventFilter" href="#EventFilter">type EventFilter struct</a>

```
searchKey: http.EventFilter
tags: [struct]
```

```Go
type EventFilter struct {
	Value    string `json:"value"`
	Label    string `json:"label"`
	Count    int    `json:"count"`
	LimitHit bool   `json:"limitHit"`
	Kind     string `json:"kind"`
}
```

EventFilter is a suggestion for a search filter. Currently has a 1-1 correspondance with the SearchFilter graphql type. 

### <a id="EventLineMatch" href="#EventLineMatch">type EventLineMatch struct</a>

```
searchKey: http.EventLineMatch
tags: [struct]
```

```Go
type EventLineMatch struct {
	Line             string     `json:"line"`
	LineNumber       int32      `json:"lineNumber"`
	OffsetAndLengths [][2]int32 `json:"offsetAndLengths"`
}
```

EventLineMatch is a subset of zoekt.LineMatch for our Event API. 

### <a id="EventMatch" href="#EventMatch">type EventMatch interface</a>

```
searchKey: http.EventMatch
tags: [interface]
```

```Go
type EventMatch interface {
	// private marker method so only top level event match types are allowed.
	eventMatch()
}
```

EventMatch is an interface which only the top level match event types implement. Use this for your results slice rather than interface{}. 

### <a id="EventRepoMatch" href="#EventRepoMatch">type EventRepoMatch struct</a>

```
searchKey: http.EventRepoMatch
tags: [struct]
```

```Go
type EventRepoMatch struct {
	// Type is always RepoMatchType. Included here for marshalling.
	Type MatchType `json:"type"`

	Repository  string   `json:"repository"`
	Branches    []string `json:"branches,omitempty"`
	RepoStars   int      `json:"repoStars,omitempty"`
	Description string   `json:"description,omitempty"`
	Fork        bool     `json:"fork,omitempty"`
	Archived    bool     `json:"archived,omitempty"`
}
```

EventRepoMatch is a subset of zoekt.FileMatch for our Event API. 

#### <a id="EventRepoMatch.eventMatch" href="#EventRepoMatch.eventMatch">func (e *EventRepoMatch) eventMatch()</a>

```
searchKey: http.EventRepoMatch.eventMatch
tags: [method private]
```

```Go
func (e *EventRepoMatch) eventMatch()
```

### <a id="EventSymbolMatch" href="#EventSymbolMatch">type EventSymbolMatch struct</a>

```
searchKey: http.EventSymbolMatch
tags: [struct]
```

```Go
type EventSymbolMatch struct {
	// Type is always SymbolMatchType. Included here for marshalling.
	Type MatchType `json:"type"`

	Path       string   `json:"name"`
	Repository string   `json:"repository"`
	RepoStars  int      `json:"repoStars,omitempty"`
	Branches   []string `json:"branches,omitempty"`
	Version    string   `json:"version,omitempty"`

	Symbols []Symbol `json:"symbols"`
}
```

EventSymbolMatch is EventFileMatch but with Symbols instead of LineMatches 

#### <a id="EventSymbolMatch.eventMatch" href="#EventSymbolMatch.eventMatch">func (e *EventSymbolMatch) eventMatch()</a>

```
searchKey: http.EventSymbolMatch.eventMatch
tags: [method private]
```

```Go
func (e *EventSymbolMatch) eventMatch()
```

### <a id="MatchType" href="#MatchType">type MatchType int</a>

```
searchKey: http.MatchType
tags: [number]
```

```Go
type MatchType int
```

#### <a id="MatchType.MarshalJSON" href="#MatchType.MarshalJSON">func (t MatchType) MarshalJSON() ([]byte, error)</a>

```
searchKey: http.MatchType.MarshalJSON
tags: [method]
```

```Go
func (t MatchType) MarshalJSON() ([]byte, error)
```

#### <a id="MatchType.UnmarshalJSON" href="#MatchType.UnmarshalJSON">func (t *MatchType) UnmarshalJSON(b []byte) error</a>

```
searchKey: http.MatchType.UnmarshalJSON
tags: [method]
```

```Go
func (t *MatchType) UnmarshalJSON(b []byte) error
```

### <a id="ProposedQuery" href="#ProposedQuery">type ProposedQuery struct</a>

```
searchKey: http.ProposedQuery
tags: [struct]
```

```Go
type ProposedQuery struct {
	Description string `json:"description,omitempty"`
	Query       string `json:"query"`
}
```

ProposedQuery is a suggested query to run when we emit an alert. 

### <a id="Symbol" href="#Symbol">type Symbol struct</a>

```
searchKey: http.Symbol
tags: [struct]
```

```Go
type Symbol struct {
	URL           string `json:"url"`
	Name          string `json:"name"`
	ContainerName string `json:"containerName"`
	Kind          string `json:"kind"`
}
```

### <a id="Writer" href="#Writer">type Writer struct</a>

```
searchKey: http.Writer
tags: [struct]
```

```Go
type Writer struct {
	w     io.Writer
	flush func()

	StatHook func(WriterStat)
}
```

#### <a id="NewWriter" href="#NewWriter">func NewWriter(w http.ResponseWriter) (*Writer, error)</a>

```
searchKey: http.NewWriter
tags: [function]
```

```Go
func NewWriter(w http.ResponseWriter) (*Writer, error)
```

#### <a id="Writer.Event" href="#Writer.Event">func (e *Writer) Event(event string, data interface{}) error</a>

```
searchKey: http.Writer.Event
tags: [method]
```

```Go
func (e *Writer) Event(event string, data interface{}) error
```

Event writes event with data json marshalled. 

#### <a id="Writer.EventBytes" href="#Writer.EventBytes">func (e *Writer) EventBytes(event string, dataLine []byte) (err error)</a>

```
searchKey: http.Writer.EventBytes
tags: [method]
```

```Go
func (e *Writer) EventBytes(event string, dataLine []byte) (err error)
```

EventBytes writes dataLine as an event. dataLine is not allowed to contain a newline. 

### <a id="WriterStat" href="#WriterStat">type WriterStat struct</a>

```
searchKey: http.WriterStat
tags: [struct]
```

```Go
type WriterStat struct {
	Event    string
	Bytes    int
	Duration time.Duration
	Error    error
}
```

### <a id="eventMatchUnmarshaller" href="#eventMatchUnmarshaller">type eventMatchUnmarshaller struct</a>

```
searchKey: http.eventMatchUnmarshaller
tags: [struct private]
```

```Go
type eventMatchUnmarshaller struct {
	EventMatch
}
```

#### <a id="eventMatchUnmarshaller.UnmarshalJSON" href="#eventMatchUnmarshaller.UnmarshalJSON">func (r *eventMatchUnmarshaller) UnmarshalJSON(b []byte) error</a>

```
searchKey: http.eventMatchUnmarshaller.UnmarshalJSON
tags: [method private]
```

```Go
func (r *eventMatchUnmarshaller) UnmarshalJSON(b []byte) error
```

## <a id="func" href="#func">Functions</a>

```
tags: [private]
```

### <a id="NewRequest" href="#NewRequest">func NewRequest(baseURL string, query string) (*http.Request, error)</a>

```
searchKey: http.NewRequest
tags: [function]
```

```Go
func NewRequest(baseURL string, query string) (*http.Request, error)
```

NewRequest returns an http.Request against the streaming API for query. 

### <a id="TestDecoder" href="#TestDecoder">func TestDecoder(t *testing.T)</a>

```
searchKey: http.TestDecoder
tags: [function private test]
```

```Go
func TestDecoder(t *testing.T)
```

### <a id="splitColon" href="#splitColon">func splitColon(data []byte) ([]byte, []byte)</a>

```
searchKey: http.splitColon
tags: [function private]
```

```Go
func splitColon(data []byte) ([]byte, []byte)
```

