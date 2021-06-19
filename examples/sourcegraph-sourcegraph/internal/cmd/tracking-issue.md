# Package main

## Index

* [Constants](#const)
    * [const costPerSearch](#costPerSearch)
    * [const maxCostPerRequest](#maxCostPerRequest)
    * [const queriesPerLoadRequest](#queriesPerLoadRequest)
    * [const beginWorkMarker](#beginWorkMarker)
    * [const endWorkMarker](#endWorkMarker)
    * [const beginAssigneeMarkerFmt](#beginAssigneeMarkerFmt)
    * [const endAssigneeMarker](#endAssigneeMarker)
    * [const issueFields](#issueFields)
    * [const pullRequestFields](#pullRequestFields)
* [Variables](#var)
    * [var categorizers](#categorizers)
    * [var customerMatcher](#customerMatcher)
    * [var emojis](#emojis)
    * [var issueOrPullRequestMatcher](#issueOrPullRequestMatcher)
    * [var now](#now)
    * [var testUpdate](#testUpdate)
    * [var testUpdateFixture](#testUpdateFixture)
    * [var testIssues](#testIssues)
* [Types](#type)
    * [type IssueContext struct](#IssueContext)
        * [func NewIssueContext(trackingIssue *Issue, trackingIssues []*Issue, issues []*Issue, pullRequests []*PullRequest) IssueContext](#NewIssueContext)
        * [func (context IssueContext) Match(matcher *Matcher) IssueContext](#IssueContext.Match)
    * [type Issue struct](#Issue)
        * [func unmarshalIssue(n SearchNode) *Issue](#unmarshalIssue)
        * [func (issue *Issue) Closed() bool](#Issue.Closed)
        * [func (issue *Issue) SafeTitle() string](#Issue.SafeTitle)
        * [func (issue *Issue) SafeLabels() []string](#Issue.SafeLabels)
        * [func (issue *Issue) UpdateBody(markdown string) (updated bool, ok bool)](#Issue.UpdateBody)
    * [type IssueLoader struct](#IssueLoader)
        * [func NewIssueLoader(queries []string) *IssueLoader](#NewIssueLoader)
        * [func (l *IssueLoader) Load(ctx context.Context, cli *graphql.Client) (issues []*Issue, pullRequests []*PullRequest, _ error)](#IssueLoader.Load)
        * [func (l *IssueLoader) makeNextRequest() (*graphql.Request, bool)](#IssueLoader.makeNextRequest)
        * [func (l *IssueLoader) performRequest(ctx context.Context, cli *graphql.Client, r *graphql.Request) (issues []*Issue, pullRequests []*PullRequest, _ error)](#IssueLoader.performRequest)
    * [type Matcher struct](#Matcher)
        * [func NewMatcher(labels []string, milestone string, assignee string, noAssignee bool) *Matcher](#NewMatcher)
        * [func (m *Matcher) Issue(issue *Issue) bool](#Matcher.Issue)
        * [func (m *Matcher) PullRequest(pullRequest *PullRequest) bool](#Matcher.PullRequest)
        * [func (m *Matcher) testAssignee(assignees ...string) bool](#Matcher.testAssignee)
        * [func (m *Matcher) testLabels(labels []string) bool](#Matcher.testLabels)
        * [func (m *Matcher) testMilestone(milestone string, labels []string) bool](#Matcher.testMilestone)
    * [type PullRequest struct](#PullRequest)
        * [func unmarshalPullRequest(n SearchNode) *PullRequest](#unmarshalPullRequest)
        * [func (pullRequest *PullRequest) Closed() bool](#PullRequest.Closed)
        * [func (pullRequest *PullRequest) Merged() bool](#PullRequest.Merged)
        * [func (pullRequest *PullRequest) Done() bool](#PullRequest.Done)
        * [func (pullRequest *PullRequest) SafeTitle() string](#PullRequest.SafeTitle)
        * [func (pullRequest *PullRequest) SafeLabels() []string](#PullRequest.SafeLabels)
    * [type AssigneeRenderer struct](#AssigneeRenderer)
        * [func NewAssigneeRenderer(context IssueContext, assignee string) *AssigneeRenderer](#NewAssigneeRenderer)
        * [func (ar *AssigneeRenderer) Render() string](#AssigneeRenderer.Render)
        * [func (ar *AssigneeRenderer) renderPendingWork() string](#AssigneeRenderer.renderPendingWork)
        * [func (ar *AssigneeRenderer) renderPendingTrackingIssues() (parts []MarkdownByStringKey)](#AssigneeRenderer.renderPendingTrackingIssues)
        * [func (ar *AssigneeRenderer) renderPendingIssues() (parts []MarkdownByStringKey)](#AssigneeRenderer.renderPendingIssues)
        * [func (ar *AssigneeRenderer) renderPendingPullRequests() (parts []MarkdownByStringKey)](#AssigneeRenderer.renderPendingPullRequests)
        * [func (ar *AssigneeRenderer) renderCompletedWork() string](#AssigneeRenderer.renderCompletedWork)
        * [func (ar *AssigneeRenderer) renderCompletedTrackingIssues() (completedParts []MarkdownByIntegerKeyPair)](#AssigneeRenderer.renderCompletedTrackingIssues)
        * [func (ar *AssigneeRenderer) renderCompletedIssues() (completedParts []MarkdownByIntegerKeyPair)](#AssigneeRenderer.renderCompletedIssues)
        * [func (ar *AssigneeRenderer) renderCompletedPullRequests() (completedParts []MarkdownByIntegerKeyPair)](#AssigneeRenderer.renderCompletedPullRequests)
        * [func (ar *AssigneeRenderer) renderIssue(issue *Issue) string](#AssigneeRenderer.renderIssue)
        * [func (ar *AssigneeRenderer) renderPullRequest(pullRequest *PullRequest) string](#AssigneeRenderer.renderPullRequest)
        * [func (ar *AssigneeRenderer) findIssue(v *Issue) (int, bool)](#AssigneeRenderer.findIssue)
        * [func (ar *AssigneeRenderer) findPullRequest(v *PullRequest) (int, bool)](#AssigneeRenderer.findPullRequest)
        * [func (ar *AssigneeRenderer) readTrackingIssueURLs() (urls []string)](#AssigneeRenderer.readTrackingIssueURLs)
        * [func (ar *AssigneeRenderer) resetDisplayFlags()](#AssigneeRenderer.resetDisplayFlags)
        * [func (ar *AssigneeRenderer) doRenderIssue(issue *Issue, milestone string) string](#AssigneeRenderer.doRenderIssue)
    * [type MarkdownByStringKey struct](#MarkdownByStringKey)
    * [type MarkdownByIntegerKeyPair struct](#MarkdownByIntegerKeyPair)
    * [type SearchResult struct](#SearchResult)
    * [type SearchNode struct](#SearchNode)
    * [type FixturePayload struct](#FixturePayload)
* [Functions](#func)
    * [func ListTrackingIssues(ctx context.Context, cli *graphql.Client, org string) ([]*Issue, error)](#ListTrackingIssues)
    * [func LoadTrackingIssues(ctx context.Context, cli *graphql.Client, org string, trackingIssues []*Issue) ([]*Issue, []*PullRequest, error)](#LoadTrackingIssues)
    * [func makeQueries(org string, trackingIssues []*Issue) (queries []string)](#makeQueries)
    * [func matchingIssues(trackingIssue *Issue, issues []*Issue, matcher *Matcher) (matchingIssues []*Issue)](#matchingIssues)
    * [func matchingPullRequests(pullRequests []*PullRequest, matcher *Matcher) (matchingPullRequests []*PullRequest)](#matchingPullRequests)
    * [func matchingTrackingIssues(trackingIssue *Issue, issues []*Issue, pullRequests []*PullRequest, matcher *Matcher) (matchingTrackingIssues []*Issue)](#matchingTrackingIssues)
    * [func deduplicateIssues(issues []*Issue) (deduplicated []*Issue)](#deduplicateIssues)
    * [func deduplicatePullRequests(pullRequests []*PullRequest) (deduplicated []*PullRequest)](#deduplicatePullRequests)
    * [func Emojis(labels []string, repository, body string, additional map[string]string) string](#Emojis)
    * [func categorizeSecurityIssue(labels []string, repository, body string, categories map[string]string)](#categorizeSecurityIssue)
    * [func categorizeCustomerIssue(labels []string, repository, body string, categories map[string]string)](#categorizeCustomerIssue)
    * [func categorizeLabels(labels []string, repository, body string, categories map[string]string)](#categorizeLabels)
    * [func LoadIssues(ctx context.Context, cli *graphql.Client, queries []string) (issues []*Issue, pullRequests []*PullRequest, err error)](#LoadIssues)
    * [func chunkQueries(queries []string) (chunks [][]string)](#chunkQueries)
    * [func loadIssues(ctx context.Context, cli *graphql.Client, queries []string) (issues []*Issue, pullRequests []*PullRequest, _ error)](#loadIssues)
    * [func makeFragmentArgs(n int) (fragments []string, args [][]string)](#makeFragmentArgs)
    * [func contains(haystack []string, needle string) bool](#contains)
    * [func nonTrackingLabels(labels []string) (filtered []string)](#nonTrackingLabels)
    * [func redactLabels(labels []string) (redacted []string)](#redactLabels)
    * [func main()](#main)
    * [func run(token, org string, dry, verbose bool) (err error)](#run)
    * [func testAll(tests ...bool) bool](#testAll)
    * [func RenderTrackingIssue(context IssueContext) string](#RenderTrackingIssue)
    * [func findAssignees(context IssueContext) (assignees []string)](#findAssignees)
    * [func SortByIntegerKeyPair(parts []MarkdownByIntegerKeyPair) (markdown []string)](#SortByIntegerKeyPair)
    * [func renderPullRequest(pullRequest *PullRequest) string](#renderPullRequest)
    * [func estimateFromLabelSets(labels [][]string) (days float64)](#estimateFromLabelSets)
    * [func estimateFromLabelSet(labels []string) float64](#estimateFromLabelSet)
    * [func Resolve(trackingIssues, issues []*Issue, pullRequests []*PullRequest) error](#Resolve)
    * [func linkPullRequestsAndIssues(trackingIssues, issues []*Issue, pullRequests []*PullRequest)](#linkPullRequestsAndIssues)
    * [func linkTrackingIssues(trackingIssues, issues []*Issue, pullRequests []*PullRequest)](#linkTrackingIssues)
    * [func checkForCycles(trackingIssues, issues []*Issue, pullRequests []*PullRequest) error](#checkForCycles)
    * [func visitNode(issue *Issue, visited map[string]struct{}) bool](#visitNode)
    * [func makeSearchQuery(alias string) string](#makeSearchQuery)
    * [func unmarshalSearchNodes(nodes []SearchNode) (issues []*Issue, prs []*PullRequest)](#unmarshalSearchNodes)
    * [func partition(s, beginMarker, endMarker string) (string, string, string, bool)](#partition)
    * [func indexOf(s, marker string) (int, bool)](#indexOf)
    * [func formatTimeSince(t time.Time) string](#formatTimeSince)
    * [func updateIssues(ctx context.Context, cli *graphql.Client, issues []*Issue) (err error)](#updateIssues)
    * [func updateIssue(ctx context.Context, cli *graphql.Client, issue *Issue) (err error)](#updateIssue)
    * [func TestIntegration(t *testing.T)](#TestIntegration)
    * [func mockLastUpdate(t *testing.T)](#mockLastUpdate)
    * [func getOrUpdateLastUpdateTime(update bool) (time.Time, error)](#getOrUpdateLastUpdateTime)
    * [func testFixtures() (trackingIssues []*Issue, issues []*Issue, pullRequests []*PullRequest, _ error)](#testFixtures)
    * [func updateTestFixtures() (trackingIssues []*Issue, issues []*Issue, pullRequests []*PullRequest, _ error)](#updateTestFixtures)
    * [func readFixturesFile() (trackingIssues []*Issue, issues []*Issue, pullRequests []*PullRequest, _ error)](#readFixturesFile)
    * [func writeFixturesFile(trackingIssues []*Issue, issues []*Issue, pullRequests []*PullRequest) error](#writeFixturesFile)


## <a id="const" href="#const">Constants</a>

### <a id="costPerSearch" href="#costPerSearch">const costPerSearch</a>

```
searchKey: main.costPerSearch
```

```Go
const costPerSearch = 30
```

### <a id="maxCostPerRequest" href="#maxCostPerRequest">const maxCostPerRequest</a>

```
searchKey: main.maxCostPerRequest
```

```Go
const maxCostPerRequest = 1000
```

### <a id="queriesPerLoadRequest" href="#queriesPerLoadRequest">const queriesPerLoadRequest</a>

```
searchKey: main.queriesPerLoadRequest
```

```Go
const queriesPerLoadRequest = 10
```

### <a id="beginWorkMarker" href="#beginWorkMarker">const beginWorkMarker</a>

```
searchKey: main.beginWorkMarker
```

```Go
const beginWorkMarker = "<!-- BEGIN WORK -->"
```

### <a id="endWorkMarker" href="#endWorkMarker">const endWorkMarker</a>

```
searchKey: main.endWorkMarker
```

```Go
const endWorkMarker = "<!-- END WORK -->"
```

### <a id="beginAssigneeMarkerFmt" href="#beginAssigneeMarkerFmt">const beginAssigneeMarkerFmt</a>

```
searchKey: main.beginAssigneeMarkerFmt
```

```Go
const beginAssigneeMarkerFmt = "<!-- BEGIN ASSIGNEE: %s -->"
```

### <a id="endAssigneeMarker" href="#endAssigneeMarker">const endAssigneeMarker</a>

```
searchKey: main.endAssigneeMarker
```

```Go
const endAssigneeMarker = "<!-- END ASSIGNEE -->"
```

### <a id="issueFields" href="#issueFields">const issueFields</a>

```
searchKey: main.issueFields
```

```Go
const issueFields = ...
```

### <a id="pullRequestFields" href="#pullRequestFields">const pullRequestFields</a>

```
searchKey: main.pullRequestFields
```

```Go
const pullRequestFields = issueFields + `
	commits(first: 1) { nodes { commit { authoredDate } } }
`
```

## <a id="var" href="#var">Variables</a>

### <a id="categorizers" href="#categorizers">var categorizers</a>

```
searchKey: main.categorizers
```

```Go
var categorizers = ...
```

### <a id="customerMatcher" href="#customerMatcher">var customerMatcher</a>

```
searchKey: main.customerMatcher
```

```Go
var customerMatcher = regexp.MustCompile(`https://app\.hubspot\.com/contacts/2762526/company/\d+`)
```

### <a id="emojis" href="#emojis">var emojis</a>

```
searchKey: main.emojis
```

```Go
var emojis = ...
```

### <a id="issueOrPullRequestMatcher" href="#issueOrPullRequestMatcher">var issueOrPullRequestMatcher</a>

```
searchKey: main.issueOrPullRequestMatcher
```

```Go
var issueOrPullRequestMatcher = ...
```

### <a id="now" href="#now">var now</a>

```
searchKey: main.now
```

```Go
var now = time.Now
```

now returns the current time for relative formatting. This is overwritten during tests to ensure that our output can be byte-for-byte compared against the golden output file. 

### <a id="testUpdate" href="#testUpdate">var testUpdate</a>

```
searchKey: main.testUpdate
```

```Go
var testUpdate = flag.Bool("update", false, "update testdata golden")
```

### <a id="testUpdateFixture" href="#testUpdateFixture">var testUpdateFixture</a>

```
searchKey: main.testUpdateFixture
```

```Go
var testUpdateFixture = flag.Bool("update.fixture", false, "update testdata API response")
```

### <a id="testIssues" href="#testIssues">var testIssues</a>

```
searchKey: main.testIssues
```

```Go
var testIssues = []int{
	13675,
	13987,
	13988,
	14166,
}
```

## <a id="type" href="#type">Types</a>

### <a id="IssueContext" href="#IssueContext">type IssueContext struct</a>

```
searchKey: main.IssueContext
tags: [exported]
```

```Go
type IssueContext struct {
	trackingIssue  *Issue
	trackingIssues []*Issue
	issues         []*Issue
	pullRequests   []*PullRequest
}
```

IssueContext tracks a visible set of issues, tracking issues, and pull requests with respect to a given tracking issue. The visible set of issues and pull requests can be refined with additional restrictions. 

#### <a id="NewIssueContext" href="#NewIssueContext">func NewIssueContext(trackingIssue *Issue, trackingIssues []*Issue, issues []*Issue, pullRequests []*PullRequest) IssueContext</a>

```
searchKey: main.NewIssueContext
tags: [exported]
```

```Go
func NewIssueContext(trackingIssue *Issue, trackingIssues []*Issue, issues []*Issue, pullRequests []*PullRequest) IssueContext
```

NewIssueContext creates  anew issue context with the given visible issues, tracking issues, and pull requests. 

#### <a id="IssueContext.Match" href="#IssueContext.Match">func (context IssueContext) Match(matcher *Matcher) IssueContext</a>

```
searchKey: main.IssueContext.Match
tags: [exported]
```

```Go
func (context IssueContext) Match(matcher *Matcher) IssueContext
```

Match will return a new issue context where all visible issues and pull requests match the given matcher. 

### <a id="Issue" href="#Issue">type Issue struct</a>

```
searchKey: main.Issue
tags: [exported]
```

```Go
type Issue struct {
	ID                  string
	Title               string
	Body                string
	Number              int
	URL                 string
	State               string
	Repository          string
	Private             bool
	Labels              []string
	Assignees           []string
	Milestone           string
	Author              string
	CreatedAt           time.Time
	UpdatedAt           time.Time
	ClosedAt            time.Time
	TrackedBy           []*Issue       `json:"-"`
	TrackedIssues       []*Issue       `json:"-"`
	TrackedPullRequests []*PullRequest `json:"-"`
	LinkedPullRequests  []*PullRequest `json:"-"`
}
```

Issue represents an existing GitHub Issue. 

#### <a id="unmarshalIssue" href="#unmarshalIssue">func unmarshalIssue(n SearchNode) *Issue</a>

```
searchKey: main.unmarshalIssue
```

```Go
func unmarshalIssue(n SearchNode) *Issue
```

unmarshalIssue unmarshals the given node into an issue object. 

#### <a id="Issue.Closed" href="#Issue.Closed">func (issue *Issue) Closed() bool</a>

```
searchKey: main.Issue.Closed
tags: [exported]
```

```Go
func (issue *Issue) Closed() bool
```

#### <a id="Issue.SafeTitle" href="#Issue.SafeTitle">func (issue *Issue) SafeTitle() string</a>

```
searchKey: main.Issue.SafeTitle
tags: [exported]
```

```Go
func (issue *Issue) SafeTitle() string
```

#### <a id="Issue.SafeLabels" href="#Issue.SafeLabels">func (issue *Issue) SafeLabels() []string</a>

```
searchKey: main.Issue.SafeLabels
tags: [exported]
```

```Go
func (issue *Issue) SafeLabels() []string
```

#### <a id="Issue.UpdateBody" href="#Issue.UpdateBody">func (issue *Issue) UpdateBody(markdown string) (updated bool, ok bool)</a>

```
searchKey: main.Issue.UpdateBody
tags: [exported]
```

```Go
func (issue *Issue) UpdateBody(markdown string) (updated bool, ok bool)
```

### <a id="IssueLoader" href="#IssueLoader">type IssueLoader struct</a>

```
searchKey: main.IssueLoader
tags: [exported]
```

```Go
type IssueLoader struct {
	queries   []string
	fragments []string
	args      [][]string
	cursors   []string
	done      []bool
}
```

IssueLoader efficiently fetches issues and pull request that match a given set of queries. 

#### <a id="NewIssueLoader" href="#NewIssueLoader">func NewIssueLoader(queries []string) *IssueLoader</a>

```
searchKey: main.NewIssueLoader
tags: [exported]
```

```Go
func NewIssueLoader(queries []string) *IssueLoader
```

NewIssueLoader creates a new IssueLoader with the given queries. 

#### <a id="IssueLoader.Load" href="#IssueLoader.Load">func (l *IssueLoader) Load(ctx context.Context, cli *graphql.Client) (issues []*Issue, pullRequests []*PullRequest, _ error)</a>

```
searchKey: main.IssueLoader.Load
tags: [exported]
```

```Go
func (l *IssueLoader) Load(ctx context.Context, cli *graphql.Client) (issues []*Issue, pullRequests []*PullRequest, _ error)
```

Load will load all issues and pull requests matching the configured queries. Tracking issues are filtered out of the resulting issues list. 

#### <a id="IssueLoader.makeNextRequest" href="#IssueLoader.makeNextRequest">func (l *IssueLoader) makeNextRequest() (*graphql.Request, bool)</a>

```
searchKey: main.IssueLoader.makeNextRequest
```

```Go
func (l *IssueLoader) makeNextRequest() (*graphql.Request, bool)
```

makeNextRequest will construct a new request based on the given cursor values. If no request should be performed, this method will return a false-valued flag. 

#### <a id="IssueLoader.performRequest" href="#IssueLoader.performRequest">func (l *IssueLoader) performRequest(ctx context.Context, cli *graphql.Client, r *graphql.Request) (issues []*Issue, pullRequests []*PullRequest, _ error)</a>

```
searchKey: main.IssueLoader.performRequest
```

```Go
func (l *IssueLoader) performRequest(ctx context.Context, cli *graphql.Client, r *graphql.Request) (issues []*Issue, pullRequests []*PullRequest, _ error)
```

performRequest will perform the given request and return the deserialized list of issues and pull requests. 

### <a id="Matcher" href="#Matcher">type Matcher struct</a>

```
searchKey: main.Matcher
tags: [exported]
```

```Go
type Matcher struct {
	labels     []string
	milestone  string
	assignee   string
	noAssignee bool
}
```

#### <a id="NewMatcher" href="#NewMatcher">func NewMatcher(labels []string, milestone string, assignee string, noAssignee bool) *Matcher</a>

```
searchKey: main.NewMatcher
tags: [exported]
```

```Go
func NewMatcher(labels []string, milestone string, assignee string, noAssignee bool) *Matcher
```

NewMatcher returns a matcher with the given expected properties. 

#### <a id="Matcher.Issue" href="#Matcher.Issue">func (m *Matcher) Issue(issue *Issue) bool</a>

```
searchKey: main.Matcher.Issue
tags: [exported]
```

```Go
func (m *Matcher) Issue(issue *Issue) bool
```

Issue returns true if the given issue matches the expected properties. An issue with the tracking issue will never be matched. 

#### <a id="Matcher.PullRequest" href="#Matcher.PullRequest">func (m *Matcher) PullRequest(pullRequest *PullRequest) bool</a>

```
searchKey: main.Matcher.PullRequest
tags: [exported]
```

```Go
func (m *Matcher) PullRequest(pullRequest *PullRequest) bool
```

PullRequest returns true if the given pull request matches the expected properties. 

#### <a id="Matcher.testAssignee" href="#Matcher.testAssignee">func (m *Matcher) testAssignee(assignees ...string) bool</a>

```
searchKey: main.Matcher.testAssignee
```

```Go
func (m *Matcher) testAssignee(assignees ...string) bool
```

testAssignee returns true if this matcher was configured with a non-empty assignee that is present in the given list of assignees. 

#### <a id="Matcher.testLabels" href="#Matcher.testLabels">func (m *Matcher) testLabels(labels []string) bool</a>

```
searchKey: main.Matcher.testLabels
```

```Go
func (m *Matcher) testLabels(labels []string) bool
```

testLabels returns true if every label that this matcher was configured with exists in the given label list. 

#### <a id="Matcher.testMilestone" href="#Matcher.testMilestone">func (m *Matcher) testMilestone(milestone string, labels []string) bool</a>

```
searchKey: main.Matcher.testMilestone
```

```Go
func (m *Matcher) testMilestone(milestone string, labels []string) bool
```

testMilestone returns true if the given milestone matches the milestone the matcher was configured with, if the given labels contains a planned/{milestone} label, or the milestone on the tracking issue is not restricted. 

### <a id="PullRequest" href="#PullRequest">type PullRequest struct</a>

```
searchKey: main.PullRequest
tags: [exported]
```

```Go
type PullRequest struct {
	ID           string
	Title        string
	Body         string
	Number       int
	URL          string
	State        string
	Repository   string
	Private      bool
	Labels       []string
	Assignees    []string
	Milestone    string
	Author       string
	CreatedAt    time.Time
	UpdatedAt    time.Time
	ClosedAt     time.Time
	BeganAt      time.Time // Time of the first authored commit
	TrackedBy    []*Issue  `json:"-"`
	LinkedIssues []*Issue  `json:"-"`
}
```

PullRequest represents an existing GitHub PullRequest. 

#### <a id="unmarshalPullRequest" href="#unmarshalPullRequest">func unmarshalPullRequest(n SearchNode) *PullRequest</a>

```
searchKey: main.unmarshalPullRequest
```

```Go
func unmarshalPullRequest(n SearchNode) *PullRequest
```

unmarshalPullRequest unmarshals the given node into an pull request object. 

#### <a id="PullRequest.Closed" href="#PullRequest.Closed">func (pullRequest *PullRequest) Closed() bool</a>

```
searchKey: main.PullRequest.Closed
tags: [exported]
```

```Go
func (pullRequest *PullRequest) Closed() bool
```

#### <a id="PullRequest.Merged" href="#PullRequest.Merged">func (pullRequest *PullRequest) Merged() bool</a>

```
searchKey: main.PullRequest.Merged
tags: [exported]
```

```Go
func (pullRequest *PullRequest) Merged() bool
```

#### <a id="PullRequest.Done" href="#PullRequest.Done">func (pullRequest *PullRequest) Done() bool</a>

```
searchKey: main.PullRequest.Done
tags: [exported]
```

```Go
func (pullRequest *PullRequest) Done() bool
```

#### <a id="PullRequest.SafeTitle" href="#PullRequest.SafeTitle">func (pullRequest *PullRequest) SafeTitle() string</a>

```
searchKey: main.PullRequest.SafeTitle
tags: [exported]
```

```Go
func (pullRequest *PullRequest) SafeTitle() string
```

#### <a id="PullRequest.SafeLabels" href="#PullRequest.SafeLabels">func (pullRequest *PullRequest) SafeLabels() []string</a>

```
searchKey: main.PullRequest.SafeLabels
tags: [exported]
```

```Go
func (pullRequest *PullRequest) SafeLabels() []string
```

### <a id="AssigneeRenderer" href="#AssigneeRenderer">type AssigneeRenderer struct</a>

```
searchKey: main.AssigneeRenderer
tags: [exported]
```

```Go
type AssigneeRenderer struct {
	context              IssueContext
	assignee             string
	issueDisplayed       []bool
	pullRequestDisplayed []bool
}
```

#### <a id="NewAssigneeRenderer" href="#NewAssigneeRenderer">func NewAssigneeRenderer(context IssueContext, assignee string) *AssigneeRenderer</a>

```
searchKey: main.NewAssigneeRenderer
tags: [exported]
```

```Go
func NewAssigneeRenderer(context IssueContext, assignee string) *AssigneeRenderer
```

#### <a id="AssigneeRenderer.Render" href="#AssigneeRenderer.Render">func (ar *AssigneeRenderer) Render() string</a>

```
searchKey: main.AssigneeRenderer.Render
tags: [exported]
```

```Go
func (ar *AssigneeRenderer) Render() string
```

Render returns the assignee section of the configured tracking issue for the configured assignee. 

#### <a id="AssigneeRenderer.renderPendingWork" href="#AssigneeRenderer.renderPendingWork">func (ar *AssigneeRenderer) renderPendingWork() string</a>

```
searchKey: main.AssigneeRenderer.renderPendingWork
```

```Go
func (ar *AssigneeRenderer) renderPendingWork() string
```

renderPendingWork returns a list of pending work items rendered in markdown. 

#### <a id="AssigneeRenderer.renderPendingTrackingIssues" href="#AssigneeRenderer.renderPendingTrackingIssues">func (ar *AssigneeRenderer) renderPendingTrackingIssues() (parts []MarkdownByStringKey)</a>

```
searchKey: main.AssigneeRenderer.renderPendingTrackingIssues
```

```Go
func (ar *AssigneeRenderer) renderPendingTrackingIssues() (parts []MarkdownByStringKey)
```

renderPendingTrackingIssues returns a rendered list of tracking issues (with rendered children) along with that tracking issue's URL for later reordering of the resulting list. 

#### <a id="AssigneeRenderer.renderPendingIssues" href="#AssigneeRenderer.renderPendingIssues">func (ar *AssigneeRenderer) renderPendingIssues() (parts []MarkdownByStringKey)</a>

```
searchKey: main.AssigneeRenderer.renderPendingIssues
```

```Go
func (ar *AssigneeRenderer) renderPendingIssues() (parts []MarkdownByStringKey)
```

renderPendingIssues returns a rendered list of unclosed issues along with that issue's URL for later reordering of the resulting list. The resulting list does not include any issue that was already rendered by renderPendingTrackingIssues. 

#### <a id="AssigneeRenderer.renderPendingPullRequests" href="#AssigneeRenderer.renderPendingPullRequests">func (ar *AssigneeRenderer) renderPendingPullRequests() (parts []MarkdownByStringKey)</a>

```
searchKey: main.AssigneeRenderer.renderPendingPullRequests
```

```Go
func (ar *AssigneeRenderer) renderPendingPullRequests() (parts []MarkdownByStringKey)
```

renderPendingPullRequests returns a rendered list of unclosed pull requests along with that issue's URL for later reordering of the resulting list. The resulting list does not include any pull request that was already rendered by renderPendingTrackingIssues or renderPendingIssues. 

#### <a id="AssigneeRenderer.renderCompletedWork" href="#AssigneeRenderer.renderCompletedWork">func (ar *AssigneeRenderer) renderCompletedWork() string</a>

```
searchKey: main.AssigneeRenderer.renderCompletedWork
```

```Go
func (ar *AssigneeRenderer) renderCompletedWork() string
```

renderCompletedWork returns a list of completed work items rendered in markdown. 

#### <a id="AssigneeRenderer.renderCompletedTrackingIssues" href="#AssigneeRenderer.renderCompletedTrackingIssues">func (ar *AssigneeRenderer) renderCompletedTrackingIssues() (completedParts []MarkdownByIntegerKeyPair)</a>

```
searchKey: main.AssigneeRenderer.renderCompletedTrackingIssues
```

```Go
func (ar *AssigneeRenderer) renderCompletedTrackingIssues() (completedParts []MarkdownByIntegerKeyPair)
```

renderCompletedTrackingIsssues returns a rendered list of closed tracking issues along with that issue's closed-at time and that issue's number for later reordering of the resulting list. This will also set the completed flag on all tracked issues and pull requests. 

#### <a id="AssigneeRenderer.renderCompletedIssues" href="#AssigneeRenderer.renderCompletedIssues">func (ar *AssigneeRenderer) renderCompletedIssues() (completedParts []MarkdownByIntegerKeyPair)</a>

```
searchKey: main.AssigneeRenderer.renderCompletedIssues
```

```Go
func (ar *AssigneeRenderer) renderCompletedIssues() (completedParts []MarkdownByIntegerKeyPair)
```

renderCompletedIssues returns a rendered list of closed issues along with that issue's closed-at time and that issue's number for later reordering of the resulting list. 

#### <a id="AssigneeRenderer.renderCompletedPullRequests" href="#AssigneeRenderer.renderCompletedPullRequests">func (ar *AssigneeRenderer) renderCompletedPullRequests() (completedParts []MarkdownByIntegerKeyPair)</a>

```
searchKey: main.AssigneeRenderer.renderCompletedPullRequests
```

```Go
func (ar *AssigneeRenderer) renderCompletedPullRequests() (completedParts []MarkdownByIntegerKeyPair)
```

renderCompletedPullRequests returns a rendered list of closed pull request along with that pull request's closed-at time and that pull request's number for later reordering of the resulting list. 

#### <a id="AssigneeRenderer.renderIssue" href="#AssigneeRenderer.renderIssue">func (ar *AssigneeRenderer) renderIssue(issue *Issue) string</a>

```
searchKey: main.AssigneeRenderer.renderIssue
```

```Go
func (ar *AssigneeRenderer) renderIssue(issue *Issue) string
```

renderIssue returns the given issue rendered as markdown. This will also set the displayed flag on this issue as well as all linked pull requests. 

#### <a id="AssigneeRenderer.renderPullRequest" href="#AssigneeRenderer.renderPullRequest">func (ar *AssigneeRenderer) renderPullRequest(pullRequest *PullRequest) string</a>

```
searchKey: main.AssigneeRenderer.renderPullRequest
```

```Go
func (ar *AssigneeRenderer) renderPullRequest(pullRequest *PullRequest) string
```

renderPullRequest returns the given pull request rendered as markdown. This will also set the displayed flag on the pull request. 

#### <a id="AssigneeRenderer.findIssue" href="#AssigneeRenderer.findIssue">func (ar *AssigneeRenderer) findIssue(v *Issue) (int, bool)</a>

```
searchKey: main.AssigneeRenderer.findIssue
```

```Go
func (ar *AssigneeRenderer) findIssue(v *Issue) (int, bool)
```

findIssue returns the index of the given issue in the current context. If the issue does not exist then a false-valued flag is returned. 

#### <a id="AssigneeRenderer.findPullRequest" href="#AssigneeRenderer.findPullRequest">func (ar *AssigneeRenderer) findPullRequest(v *PullRequest) (int, bool)</a>

```
searchKey: main.AssigneeRenderer.findPullRequest
```

```Go
func (ar *AssigneeRenderer) findPullRequest(v *PullRequest) (int, bool)
```

findPullRequest returns the index of the given pull request in the current context. If the pull request does not exist then a false-valued flag is returned. 

#### <a id="AssigneeRenderer.readTrackingIssueURLs" href="#AssigneeRenderer.readTrackingIssueURLs">func (ar *AssigneeRenderer) readTrackingIssueURLs() (urls []string)</a>

```
searchKey: main.AssigneeRenderer.readTrackingIssueURLs
```

```Go
func (ar *AssigneeRenderer) readTrackingIssueURLs() (urls []string)
```

readTrackingIssueURLs reads each line of the current tracking issue body and extracts issue and pull request references. The order of the output slice is the order in which each URL is first referenced and is used to maintain a stable ordering in the GitHub UI. 

Note: We use the fact that rendered work items always reference themselves first, and any additional issue or pull request URLs on that line are only references. By parsing line-by-line and pulling the first URL we see, we should get an accurate ordering. 

#### <a id="AssigneeRenderer.resetDisplayFlags" href="#AssigneeRenderer.resetDisplayFlags">func (ar *AssigneeRenderer) resetDisplayFlags()</a>

```
searchKey: main.AssigneeRenderer.resetDisplayFlags
```

```Go
func (ar *AssigneeRenderer) resetDisplayFlags()
```

resetDisplayFlags unsets the displayed flag for all issues and pull requests. 

#### <a id="AssigneeRenderer.doRenderIssue" href="#AssigneeRenderer.doRenderIssue">func (ar *AssigneeRenderer) doRenderIssue(issue *Issue, milestone string) string</a>

```
searchKey: main.AssigneeRenderer.doRenderIssue
```

```Go
func (ar *AssigneeRenderer) doRenderIssue(issue *Issue, milestone string) string
```

doRenderIssue returns the given issue rendered in markdown. 

### <a id="MarkdownByStringKey" href="#MarkdownByStringKey">type MarkdownByStringKey struct</a>

```
searchKey: main.MarkdownByStringKey
tags: [exported]
```

```Go
type MarkdownByStringKey struct {
	markdown string
	key      string
}
```

### <a id="MarkdownByIntegerKeyPair" href="#MarkdownByIntegerKeyPair">type MarkdownByIntegerKeyPair struct</a>

```
searchKey: main.MarkdownByIntegerKeyPair
tags: [exported]
```

```Go
type MarkdownByIntegerKeyPair struct {
	markdown string
	key1     int64
	key2     int64
}
```

### <a id="SearchResult" href="#SearchResult">type SearchResult struct</a>

```
searchKey: main.SearchResult
tags: [exported]
```

```Go
type SearchResult struct {
	Nodes    []SearchNode
	PageInfo struct {
		EndCursor   string
		HasNextPage bool
	}
}
```

### <a id="SearchNode" href="#SearchNode">type SearchNode struct</a>

```
searchKey: main.SearchNode
tags: [exported]
```

```Go
type SearchNode struct {
	Typename   string `json:"__typename"`
	ID         string
	Title      string
	Body       string
	State      string
	Number     int
	URL        string
	Repository struct {
		NameWithOwner string
		IsPrivate     bool
	}
	Author    struct{ Login string }
	Assignees struct{ Nodes []struct{ Login string } }
	Labels    struct{ Nodes []struct{ Name string } }
	Milestone struct{ Title string }
	Commits   struct {
		Nodes []struct {
			Commit struct{ AuthoredDate time.Time }
		}
	}
	CreatedAt time.Time
	UpdatedAt time.Time
	ClosedAt  time.Time
}
```

### <a id="FixturePayload" href="#FixturePayload">type FixturePayload struct</a>

```
searchKey: main.FixturePayload
```

```Go
type FixturePayload struct {
	TrackingIssues []*Issue
	Issues         []*Issue
	PullRequests   []*PullRequest
}
```

## <a id="func" href="#func">Functions</a>

### <a id="ListTrackingIssues" href="#ListTrackingIssues">func ListTrackingIssues(ctx context.Context, cli *graphql.Client, org string) ([]*Issue, error)</a>

```
searchKey: main.ListTrackingIssues
tags: [exported]
```

```Go
func ListTrackingIssues(ctx context.Context, cli *graphql.Client, org string) ([]*Issue, error)
```

ListTrackingIssues returns all issues with the `tracking` label (and at least one other label) in the given organization. 

### <a id="LoadTrackingIssues" href="#LoadTrackingIssues">func LoadTrackingIssues(ctx context.Context, cli *graphql.Client, org string, trackingIssues []*Issue) ([]*Issue, []*PullRequest, error)</a>

```
searchKey: main.LoadTrackingIssues
tags: [exported]
```

```Go
func LoadTrackingIssues(ctx context.Context, cli *graphql.Client, org string, trackingIssues []*Issue) ([]*Issue, []*PullRequest, error)
```

LoadTrackingIssues returns all issues and pull requests which are relevant to the given set of tracking issues in the given organization. The result of this function may be a superset of objects that should be rendered for the tracking issue. 

### <a id="makeQueries" href="#makeQueries">func makeQueries(org string, trackingIssues []*Issue) (queries []string)</a>

```
searchKey: main.makeQueries
```

```Go
func makeQueries(org string, trackingIssues []*Issue) (queries []string)
```

makeQueries returns a set of search queries that, when queried together, should return all of the relevant issue and pull requests for the given tracking issues. 

### <a id="matchingIssues" href="#matchingIssues">func matchingIssues(trackingIssue *Issue, issues []*Issue, matcher *Matcher) (matchingIssues []*Issue)</a>

```
searchKey: main.matchingIssues
```

```Go
func matchingIssues(trackingIssue *Issue, issues []*Issue, matcher *Matcher) (matchingIssues []*Issue)
```

matchingIssues returns the given issues that match the given matcher. 

### <a id="matchingPullRequests" href="#matchingPullRequests">func matchingPullRequests(pullRequests []*PullRequest, matcher *Matcher) (matchingPullRequests []*PullRequest)</a>

```
searchKey: main.matchingPullRequests
```

```Go
func matchingPullRequests(pullRequests []*PullRequest, matcher *Matcher) (matchingPullRequests []*PullRequest)
```

matchingPullRequests returns the given pull requests that match the given matcher. 

### <a id="matchingTrackingIssues" href="#matchingTrackingIssues">func matchingTrackingIssues(trackingIssue *Issue, issues []*Issue, pullRequests []*PullRequest, matcher *Matcher) (matchingTrackingIssues []*Issue)</a>

```
searchKey: main.matchingTrackingIssues
```

```Go
func matchingTrackingIssues(trackingIssue *Issue, issues []*Issue, pullRequests []*PullRequest, matcher *Matcher) (matchingTrackingIssues []*Issue)
```

matchingTrackingIssues returns the given tracking issues that match the matcher and do not track only a `team/*` label. 

### <a id="deduplicateIssues" href="#deduplicateIssues">func deduplicateIssues(issues []*Issue) (deduplicated []*Issue)</a>

```
searchKey: main.deduplicateIssues
```

```Go
func deduplicateIssues(issues []*Issue) (deduplicated []*Issue)
```

### <a id="deduplicatePullRequests" href="#deduplicatePullRequests">func deduplicatePullRequests(pullRequests []*PullRequest) (deduplicated []*PullRequest)</a>

```
searchKey: main.deduplicatePullRequests
```

```Go
func deduplicatePullRequests(pullRequests []*PullRequest) (deduplicated []*PullRequest)
```

### <a id="Emojis" href="#Emojis">func Emojis(labels []string, repository, body string, additional map[string]string) string</a>

```
searchKey: main.Emojis
tags: [exported]
```

```Go
func Emojis(labels []string, repository, body string, additional map[string]string) string
```

Emojis returns a string of emojis that should be displayed with an issue or a pull request. Additional emojis can be supplied and will overwrite any emoji with the same category. 

### <a id="categorizeSecurityIssue" href="#categorizeSecurityIssue">func categorizeSecurityIssue(labels []string, repository, body string, categories map[string]string)</a>

```
searchKey: main.categorizeSecurityIssue
```

```Go
func categorizeSecurityIssue(labels []string, repository, body string, categories map[string]string)
```

categorizeSecurityIssue adds a security emoji if the repository matches sourcegraph/security-issues. 

### <a id="categorizeCustomerIssue" href="#categorizeCustomerIssue">func categorizeCustomerIssue(labels []string, repository, body string, categories map[string]string)</a>

```
searchKey: main.categorizeCustomerIssue
```

```Go
func categorizeCustomerIssue(labels []string, repository, body string, categories map[string]string)
```

categorizeCustomerIssue adds a customer emoji if the repository matches sourcegraph/customer or if the issue contains a hubspot URL. 

### <a id="categorizeLabels" href="#categorizeLabels">func categorizeLabels(labels []string, repository, body string, categories map[string]string)</a>

```
searchKey: main.categorizeLabels
```

```Go
func categorizeLabels(labels []string, repository, body string, categories map[string]string)
```

categorizeLabels adds emojis based on the issue labels. 

### <a id="LoadIssues" href="#LoadIssues">func LoadIssues(ctx context.Context, cli *graphql.Client, queries []string) (issues []*Issue, pullRequests []*PullRequest, err error)</a>

```
searchKey: main.LoadIssues
tags: [exported]
```

```Go
func LoadIssues(ctx context.Context, cli *graphql.Client, queries []string) (issues []*Issue, pullRequests []*PullRequest, err error)
```

LoadIssues will load all issues and pull requests matching the configured queries by making multiple queries in parallel and merging and deduplicating the result. Tracking issues are filtered out of the resulting issues list. 

### <a id="chunkQueries" href="#chunkQueries">func chunkQueries(queries []string) (chunks [][]string)</a>

```
searchKey: main.chunkQueries
```

```Go
func chunkQueries(queries []string) (chunks [][]string)
```

chunkQueries returns the given queries spread across a number of slices. Each slice should contain at most queriesPerLoadRequest elements. 

### <a id="loadIssues" href="#loadIssues">func loadIssues(ctx context.Context, cli *graphql.Client, queries []string) (issues []*Issue, pullRequests []*PullRequest, _ error)</a>

```
searchKey: main.loadIssues
```

```Go
func loadIssues(ctx context.Context, cli *graphql.Client, queries []string) (issues []*Issue, pullRequests []*PullRequest, _ error)
```

loadIssues will load all issues and pull requests matching the configured queries. Tracking issues are filtered out of the resulting issues list. 

### <a id="makeFragmentArgs" href="#makeFragmentArgs">func makeFragmentArgs(n int) (fragments []string, args [][]string)</a>

```
searchKey: main.makeFragmentArgs
```

```Go
func makeFragmentArgs(n int) (fragments []string, args [][]string)
```

makeFragmentArgs makes `n` named GraphQL fragment and an associated set of variables. This is used to later construct a GraphQL request with a subset of these queries. 

### <a id="contains" href="#contains">func contains(haystack []string, needle string) bool</a>

```
searchKey: main.contains
```

```Go
func contains(haystack []string, needle string) bool
```

### <a id="nonTrackingLabels" href="#nonTrackingLabels">func nonTrackingLabels(labels []string) (filtered []string)</a>

```
searchKey: main.nonTrackingLabels
```

```Go
func nonTrackingLabels(labels []string) (filtered []string)
```

### <a id="redactLabels" href="#redactLabels">func redactLabels(labels []string) (redacted []string)</a>

```
searchKey: main.redactLabels
```

```Go
func redactLabels(labels []string) (redacted []string)
```

### <a id="main" href="#main">func main()</a>

```
searchKey: main.main
```

```Go
func main()
```

### <a id="run" href="#run">func run(token, org string, dry, verbose bool) (err error)</a>

```
searchKey: main.run
```

```Go
func run(token, org string, dry, verbose bool) (err error)
```

### <a id="testAll" href="#testAll">func testAll(tests ...bool) bool</a>

```
searchKey: main.testAll
```

```Go
func testAll(tests ...bool) bool
```

testAll returns true if all of the given values are true. 

### <a id="RenderTrackingIssue" href="#RenderTrackingIssue">func RenderTrackingIssue(context IssueContext) string</a>

```
searchKey: main.RenderTrackingIssue
tags: [exported]
```

```Go
func RenderTrackingIssue(context IssueContext) string
```

RenderTrackingIssue renders the work section of the given tracking issue. 

### <a id="findAssignees" href="#findAssignees">func findAssignees(context IssueContext) (assignees []string)</a>

```
searchKey: main.findAssignees
```

```Go
func findAssignees(context IssueContext) (assignees []string)
```

findAssignees returns the list of assignees for the given tracking issue. A user is an assignee for a tracking issue if there is a _leaf_ (non-tracking) issue or a pull request with that user as the assignee or author, respectively. 

### <a id="SortByIntegerKeyPair" href="#SortByIntegerKeyPair">func SortByIntegerKeyPair(parts []MarkdownByIntegerKeyPair) (markdown []string)</a>

```
searchKey: main.SortByIntegerKeyPair
tags: [exported]
```

```Go
func SortByIntegerKeyPair(parts []MarkdownByIntegerKeyPair) (markdown []string)
```

### <a id="renderPullRequest" href="#renderPullRequest">func renderPullRequest(pullRequest *PullRequest) string</a>

```
searchKey: main.renderPullRequest
```

```Go
func renderPullRequest(pullRequest *PullRequest) string
```

renderPullRequest returns the given pull request rendered in markdown. 

### <a id="estimateFromLabelSets" href="#estimateFromLabelSets">func estimateFromLabelSets(labels [][]string) (days float64)</a>

```
searchKey: main.estimateFromLabelSets
```

```Go
func estimateFromLabelSets(labels [][]string) (days float64)
```

estimateFromLabelSets returns the sum of `estimate/` labels in the given label sets. 

### <a id="estimateFromLabelSet" href="#estimateFromLabelSet">func estimateFromLabelSet(labels []string) float64</a>

```
searchKey: main.estimateFromLabelSet
```

```Go
func estimateFromLabelSet(labels []string) float64
```

estimateFromLabelSet returns the value of a `estimate/` lables in the given label set. 

### <a id="Resolve" href="#Resolve">func Resolve(trackingIssues, issues []*Issue, pullRequests []*PullRequest) error</a>

```
searchKey: main.Resolve
tags: [exported]
```

```Go
func Resolve(trackingIssues, issues []*Issue, pullRequests []*PullRequest) error
```

Resolve will populate the relationship fields of the registered issues and pull requests objects. 

### <a id="linkPullRequestsAndIssues" href="#linkPullRequestsAndIssues">func linkPullRequestsAndIssues(trackingIssues, issues []*Issue, pullRequests []*PullRequest)</a>

```
searchKey: main.linkPullRequestsAndIssues
```

```Go
func linkPullRequestsAndIssues(trackingIssues, issues []*Issue, pullRequests []*PullRequest)
```

linkPullRequestsAndIssues populates the LinkedPullRequests and LinkedIssues fields of each resolved issue and pull request value. A pull request and an issue are linked if the pull request body contains a reference to the issue number. 

### <a id="linkTrackingIssues" href="#linkTrackingIssues">func linkTrackingIssues(trackingIssues, issues []*Issue, pullRequests []*PullRequest)</a>

```
searchKey: main.linkTrackingIssues
```

```Go
func linkTrackingIssues(trackingIssues, issues []*Issue, pullRequests []*PullRequest)
```

linkTrackingIssues populates the TrackedIssues, TrackedPullRequests, and TrackedBy fields of each resolved issue and pull request value. An issue or pull request is tracked by a tracking issue if the labels, milestone, and assignees all match the tracking issue properties (if supplied). 

### <a id="checkForCycles" href="#checkForCycles">func checkForCycles(trackingIssues, issues []*Issue, pullRequests []*PullRequest) error</a>

```
searchKey: main.checkForCycles
```

```Go
func checkForCycles(trackingIssues, issues []*Issue, pullRequests []*PullRequest) error
```

checkForCycles checks for a cycle over the tracked issues relationship in the set of resolved issues. We currently check this condition because the rendering pass does not check for cycles and can create an infinite loop. 

### <a id="visitNode" href="#visitNode">func visitNode(issue *Issue, visited map[string]struct{}) bool</a>

```
searchKey: main.visitNode
```

```Go
func visitNode(issue *Issue, visited map[string]struct{}) bool
```

visitNode performs a depth-first-search over tracked issues relationships. This function will return false if the traversal encounters a node that has already been visited. 

### <a id="makeSearchQuery" href="#makeSearchQuery">func makeSearchQuery(alias string) string</a>

```
searchKey: main.makeSearchQuery
```

```Go
func makeSearchQuery(alias string) string
```

makeSearchQuery creates a GraphQL `search` fragment that captures the fields of issue and pull request types. This fragment expects that the outer request defines the variables `query${alias}`, `count${alias}`, and `cursor${alias}`. 

### <a id="unmarshalSearchNodes" href="#unmarshalSearchNodes">func unmarshalSearchNodes(nodes []SearchNode) (issues []*Issue, prs []*PullRequest)</a>

```
searchKey: main.unmarshalSearchNodes
```

```Go
func unmarshalSearchNodes(nodes []SearchNode) (issues []*Issue, prs []*PullRequest)
```

unmarshalSearchNodes unmarshals the given nodes into a list of issues and a list of pull requests. 

### <a id="partition" href="#partition">func partition(s, beginMarker, endMarker string) (string, string, string, bool)</a>

```
searchKey: main.partition
```

```Go
func partition(s, beginMarker, endMarker string) (string, string, string, bool)
```

### <a id="indexOf" href="#indexOf">func indexOf(s, marker string) (int, bool)</a>

```
searchKey: main.indexOf
```

```Go
func indexOf(s, marker string) (int, bool)
```

### <a id="formatTimeSince" href="#formatTimeSince">func formatTimeSince(t time.Time) string</a>

```
searchKey: main.formatTimeSince
```

```Go
func formatTimeSince(t time.Time) string
```

formatTimeSince will return a string containing the number of days since the given time. 

### <a id="updateIssues" href="#updateIssues">func updateIssues(ctx context.Context, cli *graphql.Client, issues []*Issue) (err error)</a>

```
searchKey: main.updateIssues
```

```Go
func updateIssues(ctx context.Context, cli *graphql.Client, issues []*Issue) (err error)
```

updateIssues will update the body of each of the given issues. Each issue update is performed as a separate GraphQL query over multiple goroutines (one per logical processor). The returned error value, if any, will be an aggregate of errors over all requests. 

### <a id="updateIssue" href="#updateIssue">func updateIssue(ctx context.Context, cli *graphql.Client, issue *Issue) (err error)</a>

```
searchKey: main.updateIssue
```

```Go
func updateIssue(ctx context.Context, cli *graphql.Client, issue *Issue) (err error)
```

### <a id="TestIntegration" href="#TestIntegration">func TestIntegration(t *testing.T)</a>

```
searchKey: main.TestIntegration
```

```Go
func TestIntegration(t *testing.T)
```

### <a id="mockLastUpdate" href="#mockLastUpdate">func mockLastUpdate(t *testing.T)</a>

```
searchKey: main.mockLastUpdate
```

```Go
func mockLastUpdate(t *testing.T)
```

### <a id="getOrUpdateLastUpdateTime" href="#getOrUpdateLastUpdateTime">func getOrUpdateLastUpdateTime(update bool) (time.Time, error)</a>

```
searchKey: main.getOrUpdateLastUpdateTime
```

```Go
func getOrUpdateLastUpdateTime(update bool) (time.Time, error)
```

### <a id="testFixtures" href="#testFixtures">func testFixtures() (trackingIssues []*Issue, issues []*Issue, pullRequests []*PullRequest, _ error)</a>

```
searchKey: main.testFixtures
```

```Go
func testFixtures() (trackingIssues []*Issue, issues []*Issue, pullRequests []*PullRequest, _ error)
```

### <a id="updateTestFixtures" href="#updateTestFixtures">func updateTestFixtures() (trackingIssues []*Issue, issues []*Issue, pullRequests []*PullRequest, _ error)</a>

```
searchKey: main.updateTestFixtures
```

```Go
func updateTestFixtures() (trackingIssues []*Issue, issues []*Issue, pullRequests []*PullRequest, _ error)
```

### <a id="readFixturesFile" href="#readFixturesFile">func readFixturesFile() (trackingIssues []*Issue, issues []*Issue, pullRequests []*PullRequest, _ error)</a>

```
searchKey: main.readFixturesFile
```

```Go
func readFixturesFile() (trackingIssues []*Issue, issues []*Issue, pullRequests []*PullRequest, _ error)
```

### <a id="writeFixturesFile" href="#writeFixturesFile">func writeFixturesFile(trackingIssues []*Issue, issues []*Issue, pullRequests []*PullRequest) error</a>

```
searchKey: main.writeFixturesFile
```

```Go
func writeFixturesFile(trackingIssues []*Issue, issues []*Issue, pullRequests []*PullRequest) error
```

