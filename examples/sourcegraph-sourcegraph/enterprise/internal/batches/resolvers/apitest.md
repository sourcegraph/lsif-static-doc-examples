# Package apitest

## Index

* [Types](#type)
    * [type GitTarget struct](#GitTarget)
    * [type DiffRange struct](#DiffRange)
    * [type DiffStat struct](#DiffStat)
        * [func (ds DiffStat) ToDiffStat() *diff.Stat](#DiffStat.ToDiffStat)
    * [type FileDiffHunk struct](#FileDiffHunk)
    * [type File struct](#File)
    * [type FileDiff struct](#FileDiff)
    * [type FileDiffs struct](#FileDiffs)
    * [type User struct](#User)
    * [type Org struct](#Org)
    * [type UserOrg struct](#UserOrg)
    * [type BatchChange struct](#BatchChange)
    * [type BatchChangeConnection struct](#BatchChangeConnection)
    * [type ChangesetEvent struct](#ChangesetEvent)
    * [type ChangesetEventConnection struct](#ChangesetEventConnection)
    * [type Repository struct](#Repository)
    * [type ExternalURL struct](#ExternalURL)
    * [type Changeset struct](#Changeset)
    * [type Comparison struct](#Comparison)
    * [type Label struct](#Label)
    * [type ChangesetConnection struct](#ChangesetConnection)
    * [type ChangesetsStats struct](#ChangesetsStats)
    * [type ChangesetCounts struct](#ChangesetCounts)
    * [type BatchSpec struct](#BatchSpec)
    * [type ChangesetSpecDelta struct](#ChangesetSpecDelta)
    * [type ChangesetSpec struct](#ChangesetSpec)
    * [type ChangesetSpecConnection struct](#ChangesetSpecConnection)
    * [type ChangesetApplyPreviewConnection struct](#ChangesetApplyPreviewConnection)
    * [type ChangesetApplyPreviewConnectionStats struct](#ChangesetApplyPreviewConnectionStats)
    * [type ChangesetApplyPreview struct](#ChangesetApplyPreview)
    * [type ChangesetApplyPreviewTargets struct](#ChangesetApplyPreviewTargets)
    * [type ChangesetSpecDescription struct](#ChangesetSpecDescription)
    * [type GitCommitDescription struct](#GitCommitDescription)
    * [type PageInfo struct](#PageInfo)
    * [type Person struct](#Person)
    * [type BatchChangesCredential struct](#BatchChangesCredential)
    * [type EmptyResponse struct](#EmptyResponse)
    * [type BatchChangesCodeHostsConnection struct](#BatchChangesCodeHostsConnection)
    * [type BatchChangesCodeHost struct](#BatchChangesCodeHost)
    * [type BulkOperation struct](#BulkOperation)
    * [type ChangesetJobError struct](#ChangesetJobError)
    * [type BulkOperationConnection struct](#BulkOperationConnection)
* [Functions](#func)
    * [func MustExec(ctx context.Context,...](#MustExec)
    * [func Exec(ctx context.Context,...](#Exec)
    * [func toJSON(t testing.TB, v interface{}) string](#toJSON)


## <a id="type" href="#type">Types</a>

### <a id="GitTarget" href="#GitTarget">type GitTarget struct</a>

```
searchKey: apitest.GitTarget
tags: [exported]
```

```Go
type GitTarget struct {
	OID            string
	AbbreviatedOID string
	TargetType     string `json:"type"`
}
```

### <a id="DiffRange" href="#DiffRange">type DiffRange struct</a>

```
searchKey: apitest.DiffRange
tags: [exported]
```

```Go
type DiffRange struct{ StartLine, Lines int }
```

### <a id="DiffStat" href="#DiffStat">type DiffStat struct</a>

```
searchKey: apitest.DiffStat
tags: [exported]
```

```Go
type DiffStat struct{ Added, Deleted, Changed int32 }
```

#### <a id="DiffStat.ToDiffStat" href="#DiffStat.ToDiffStat">func (ds DiffStat) ToDiffStat() *diff.Stat</a>

```
searchKey: apitest.DiffStat.ToDiffStat
tags: [exported]
```

```Go
func (ds DiffStat) ToDiffStat() *diff.Stat
```

### <a id="FileDiffHunk" href="#FileDiffHunk">type FileDiffHunk struct</a>

```
searchKey: apitest.FileDiffHunk
tags: [exported]
```

```Go
type FileDiffHunk struct {
	Body, Section      string
	OldNoNewlineAt     bool
	OldRange, NewRange DiffRange
}
```

### <a id="File" href="#File">type File struct</a>

```
searchKey: apitest.File
tags: [exported]
```

```Go
type File struct {
	Name string
}
```

### <a id="FileDiff" href="#FileDiff">type FileDiff struct</a>

```
searchKey: apitest.FileDiff
tags: [exported]
```

```Go
type FileDiff struct {
	OldPath, NewPath string
	Hunks            []FileDiffHunk
	Stat             DiffStat
	OldFile          File
}
```

### <a id="FileDiffs" href="#FileDiffs">type FileDiffs struct</a>

```
searchKey: apitest.FileDiffs
tags: [exported]
```

```Go
type FileDiffs struct {
	RawDiff    string
	DiffStat   DiffStat
	PageInfo   PageInfo
	Nodes      []FileDiff
	TotalCount int
}
```

### <a id="User" href="#User">type User struct</a>

```
searchKey: apitest.User
tags: [exported]
```

```Go
type User struct {
	ID         string
	DatabaseID int32
	SiteAdmin  bool

	BatchChanges          BatchChangeConnection
	BatchChangesCodeHosts BatchChangesCodeHostsConnection
}
```

### <a id="Org" href="#Org">type Org struct</a>

```
searchKey: apitest.Org
tags: [exported]
```

```Go
type Org struct {
	ID   string
	Name string

	BatchChanges BatchChangeConnection
}
```

### <a id="UserOrg" href="#UserOrg">type UserOrg struct</a>

```
searchKey: apitest.UserOrg
tags: [exported]
```

```Go
type UserOrg struct {
	ID         string
	DatabaseID int32
	SiteAdmin  bool
	Name       string
}
```

### <a id="BatchChange" href="#BatchChange">type BatchChange struct</a>

```
searchKey: apitest.BatchChange
tags: [exported]
```

```Go
type BatchChange struct {
	ID                      string
	Name                    string
	Description             string
	SpecCreator             *User
	InitialApplier          *User
	LastApplier             *User
	LastAppliedAt           string
	ViewerCanAdminister     bool
	Namespace               UserOrg
	CreatedAt               string
	UpdatedAt               string
	ClosedAt                string
	URL                     string
	ChangesetsStats         ChangesetsStats
	Changesets              ChangesetConnection
	ChangesetCountsOverTime []ChangesetCounts
	DiffStat                DiffStat
	BulkOperations          BulkOperationConnection
}
```

### <a id="BatchChangeConnection" href="#BatchChangeConnection">type BatchChangeConnection struct</a>

```
searchKey: apitest.BatchChangeConnection
tags: [exported]
```

```Go
type BatchChangeConnection struct {
	Nodes      []BatchChange
	TotalCount int
	PageInfo   PageInfo
}
```

### <a id="ChangesetEvent" href="#ChangesetEvent">type ChangesetEvent struct</a>

```
searchKey: apitest.ChangesetEvent
tags: [exported]
```

```Go
type ChangesetEvent struct {
	ID        string
	Changeset struct{ ID string }
	CreatedAt string
}
```

### <a id="ChangesetEventConnection" href="#ChangesetEventConnection">type ChangesetEventConnection struct</a>

```
searchKey: apitest.ChangesetEventConnection
tags: [exported]
```

```Go
type ChangesetEventConnection struct {
	TotalCount int
	PageInfo   PageInfo
	Nodes      []ChangesetEvent
}
```

### <a id="Repository" href="#Repository">type Repository struct</a>

```
searchKey: apitest.Repository
tags: [exported]
```

```Go
type Repository struct {
	ID   string
	Name string
}
```

### <a id="ExternalURL" href="#ExternalURL">type ExternalURL struct</a>

```
searchKey: apitest.ExternalURL
tags: [exported]
```

```Go
type ExternalURL struct {
	URL         string
	ServiceKind string
	ServiceType string
}
```

### <a id="Changeset" href="#Changeset">type Changeset struct</a>

```
searchKey: apitest.Changeset
tags: [exported]
```

```Go
type Changeset struct {
	Typename           string `json:"__typename"`
	ID                 string
	Repository         Repository
	BatchChanges       BatchChangeConnection
	CreatedAt          string
	UpdatedAt          string
	NextSyncAt         string
	ScheduleEstimateAt string
	Title              string
	Body               string
	Error              string
	State              string
	ExternalID         string
	ExternalURL        ExternalURL
	ReviewState        string
	CheckState         string
	Events             ChangesetEventConnection

	Diff Comparison

	Labels []Label

	CurrentSpec ChangesetSpec
}
```

### <a id="Comparison" href="#Comparison">type Comparison struct</a>

```
searchKey: apitest.Comparison
tags: [exported]
```

```Go
type Comparison struct {
	Typename  string `json:"__typename"`
	FileDiffs FileDiffs
}
```

### <a id="Label" href="#Label">type Label struct</a>

```
searchKey: apitest.Label
tags: [exported]
```

```Go
type Label struct {
	Text        string
	Color       string
	Description *string
}
```

### <a id="ChangesetConnection" href="#ChangesetConnection">type ChangesetConnection struct</a>

```
searchKey: apitest.ChangesetConnection
tags: [exported]
```

```Go
type ChangesetConnection struct {
	Nodes      []Changeset
	TotalCount int
	PageInfo   PageInfo
}
```

### <a id="ChangesetsStats" href="#ChangesetsStats">type ChangesetsStats struct</a>

```
searchKey: apitest.ChangesetsStats
tags: [exported]
```

```Go
type ChangesetsStats struct {
	Unpublished int
	Draft       int
	Open        int
	Merged      int
	Closed      int
	Deleted     int
	Total       int
}
```

### <a id="ChangesetCounts" href="#ChangesetCounts">type ChangesetCounts struct</a>

```
searchKey: apitest.ChangesetCounts
tags: [exported]
```

```Go
type ChangesetCounts struct {
	Date                 string
	Total                int32
	Merged               int32
	Closed               int32
	Open                 int32
	Draft                int32
	OpenApproved         int32
	OpenChangesRequested int32
	OpenPending          int32
}
```

### <a id="BatchSpec" href="#BatchSpec">type BatchSpec struct</a>

```
searchKey: apitest.BatchSpec
tags: [exported]
```

```Go
type BatchSpec struct {
	Typename string `json:"__typename"`
	ID       string

	OriginalInput string
	ParsedInput   graphqlbackend.JSONValue

	ApplyURL string

	Namespace UserOrg
	Creator   *User

	ChangesetSpecs ChangesetSpecConnection
	ApplyPreview   ChangesetApplyPreviewConnection

	ViewerCanAdminister bool

	DiffStat DiffStat

	// Alias for the above.
	AllCodeHosts BatchChangesCodeHostsConnection
	// Alias for the above.
	OnlyWithoutCredential BatchChangesCodeHostsConnection

	CreatedAt graphqlbackend.DateTime
	ExpiresAt *graphqlbackend.DateTime

	// NEW
	SupersedingBatchSpec *BatchSpec
	AppliesToBatchChange BatchChange
}
```

### <a id="ChangesetSpecDelta" href="#ChangesetSpecDelta">type ChangesetSpecDelta struct</a>

```
searchKey: apitest.ChangesetSpecDelta
tags: [exported]
```

```Go
type ChangesetSpecDelta struct {
	TitleChanged         bool
	BodyChanged          bool
	Undraft              bool
	BaseRefChanged       bool
	DiffChanged          bool
	CommitMessageChanged bool
	AuthorNameChanged    bool
	AuthorEmailChanged   bool
}
```

ChangesetSpecDelta is the delta between two ChangesetSpecs describing the same Changeset. 

### <a id="ChangesetSpec" href="#ChangesetSpec">type ChangesetSpec struct</a>

```
searchKey: apitest.ChangesetSpec
tags: [exported]
```

```Go
type ChangesetSpec struct {
	Typename string `json:"__typename"`
	ID       string

	Description ChangesetSpecDescription

	ExpiresAt *graphqlbackend.DateTime
}
```

### <a id="ChangesetSpecConnection" href="#ChangesetSpecConnection">type ChangesetSpecConnection struct</a>

```
searchKey: apitest.ChangesetSpecConnection
tags: [exported]
```

```Go
type ChangesetSpecConnection struct {
	Nodes      []ChangesetSpec
	TotalCount int
	PageInfo   PageInfo
}
```

### <a id="ChangesetApplyPreviewConnection" href="#ChangesetApplyPreviewConnection">type ChangesetApplyPreviewConnection struct</a>

```
searchKey: apitest.ChangesetApplyPreviewConnection
tags: [exported]
```

```Go
type ChangesetApplyPreviewConnection struct {
	Nodes      []ChangesetApplyPreview
	TotalCount int
	PageInfo   PageInfo
	Stats      ChangesetApplyPreviewConnectionStats
}
```

### <a id="ChangesetApplyPreviewConnectionStats" href="#ChangesetApplyPreviewConnectionStats">type ChangesetApplyPreviewConnectionStats struct</a>

```
searchKey: apitest.ChangesetApplyPreviewConnectionStats
tags: [exported]
```

```Go
type ChangesetApplyPreviewConnectionStats struct {
	Push         int32
	Update       int32
	Undraft      int32
	Publish      int32
	PublishDraft int32
	Sync         int32
	Import       int32
	Close        int32
	Reopen       int32
	Sleep        int32
	Detach       int32
}
```

### <a id="ChangesetApplyPreview" href="#ChangesetApplyPreview">type ChangesetApplyPreview struct</a>

```
searchKey: apitest.ChangesetApplyPreview
tags: [exported]
```

```Go
type ChangesetApplyPreview struct {
	Typename string `json:"__typename"`

	Operations []btypes.ReconcilerOperation
	Delta      ChangesetSpecDelta
	Targets    ChangesetApplyPreviewTargets
}
```

### <a id="ChangesetApplyPreviewTargets" href="#ChangesetApplyPreviewTargets">type ChangesetApplyPreviewTargets struct</a>

```
searchKey: apitest.ChangesetApplyPreviewTargets
tags: [exported]
```

```Go
type ChangesetApplyPreviewTargets struct {
	Typename string `json:"__typename"`

	ChangesetSpec ChangesetSpec
	Changeset     Changeset
}
```

### <a id="ChangesetSpecDescription" href="#ChangesetSpecDescription">type ChangesetSpecDescription struct</a>

```
searchKey: apitest.ChangesetSpecDescription
tags: [exported]
```

```Go
type ChangesetSpecDescription struct {
	Typename string `json:"__typename"`

	BaseRepository Repository
	ExternalID     string
	BaseRef        string

	HeadRepository Repository
	HeadRef        string

	Title string
	Body  string

	Commits []GitCommitDescription

	Published batches.PublishedValue

	Diff struct {
		FileDiffs FileDiffs
	}
	DiffStat DiffStat
}
```

### <a id="GitCommitDescription" href="#GitCommitDescription">type GitCommitDescription struct</a>

```
searchKey: apitest.GitCommitDescription
tags: [exported]
```

```Go
type GitCommitDescription struct {
	Author  Person
	Message string
	Subject string
	Body    string
	Diff    string
}
```

### <a id="PageInfo" href="#PageInfo">type PageInfo struct</a>

```
searchKey: apitest.PageInfo
tags: [exported]
```

```Go
type PageInfo struct {
	HasNextPage bool
	EndCursor   *string
}
```

### <a id="Person" href="#Person">type Person struct</a>

```
searchKey: apitest.Person
tags: [exported]
```

```Go
type Person struct {
	Name  string
	Email string
	User  *User
}
```

### <a id="BatchChangesCredential" href="#BatchChangesCredential">type BatchChangesCredential struct</a>

```
searchKey: apitest.BatchChangesCredential
tags: [exported]
```

```Go
type BatchChangesCredential struct {
	ID                  string
	ExternalServiceKind string
	ExternalServiceURL  string
	IsSiteCredential    bool
	CreatedAt           string
}
```

### <a id="EmptyResponse" href="#EmptyResponse">type EmptyResponse struct</a>

```
searchKey: apitest.EmptyResponse
tags: [exported]
```

```Go
type EmptyResponse struct {
	AlwaysNil string
}
```

### <a id="BatchChangesCodeHostsConnection" href="#BatchChangesCodeHostsConnection">type BatchChangesCodeHostsConnection struct</a>

```
searchKey: apitest.BatchChangesCodeHostsConnection
tags: [exported]
```

```Go
type BatchChangesCodeHostsConnection struct {
	PageInfo   PageInfo
	Nodes      []BatchChangesCodeHost
	TotalCount int
}
```

### <a id="BatchChangesCodeHost" href="#BatchChangesCodeHost">type BatchChangesCodeHost struct</a>

```
searchKey: apitest.BatchChangesCodeHost
tags: [exported]
```

```Go
type BatchChangesCodeHost struct {
	ExternalServiceKind string
	ExternalServiceURL  string
	Credential          BatchChangesCredential
}
```

### <a id="BulkOperation" href="#BulkOperation">type BulkOperation struct</a>

```
searchKey: apitest.BulkOperation
tags: [exported]
```

```Go
type BulkOperation struct {
	ID         string
	Type       string
	State      string
	Progress   float64
	Errors     []*ChangesetJobError
	CreatedAt  string
	FinishedAt string
}
```

### <a id="ChangesetJobError" href="#ChangesetJobError">type ChangesetJobError struct</a>

```
searchKey: apitest.ChangesetJobError
tags: [exported]
```

```Go
type ChangesetJobError struct {
	Changeset *Changeset
	Error     *string
}
```

### <a id="BulkOperationConnection" href="#BulkOperationConnection">type BulkOperationConnection struct</a>

```
searchKey: apitest.BulkOperationConnection
tags: [exported]
```

```Go
type BulkOperationConnection struct {
	Nodes      []BulkOperation
	TotalCount int
	PageInfo   PageInfo
}
```

## <a id="func" href="#func">Functions</a>

### <a id="MustExec" href="#MustExec">func MustExec(ctx context.Context,...</a>

```
searchKey: apitest.MustExec
tags: [exported]
```

```Go
func MustExec(
	ctx context.Context,
	t testing.TB,
	s *graphql.Schema,
	in map[string]interface{},
	out interface{},
	query string,
)
```

MustExec uses Exec to execute the given query and calls t.Fatalf if Exec failed. 

### <a id="Exec" href="#Exec">func Exec(ctx context.Context,...</a>

```
searchKey: apitest.Exec
tags: [exported]
```

```Go
func Exec(
	ctx context.Context,
	t testing.TB,
	s *graphql.Schema,
	in map[string]interface{},
	out interface{},
	query string,
) []*gqlerrors.QueryError
```

Exec executes the given query with the given input in the given graphql.Schema. The response will be rendered into out. 

### <a id="toJSON" href="#toJSON">func toJSON(t testing.TB, v interface{}) string</a>

```
searchKey: apitest.toJSON
```

```Go
func toJSON(t testing.TB, v interface{}) string
```

