# Package main

## Index

* [Constants](#const)
    * [const beginAssigneeMarkerFmt](#beginAssigneeMarkerFmt)
    * [const beginWorkMarker](#beginWorkMarker)
    * [const costPerSearch](#costPerSearch)
    * [const endAssigneeMarker](#endAssigneeMarker)
    * [const endWorkMarker](#endWorkMarker)
    * [const issueFields](#issueFields)
    * [const maxCostPerRequest](#maxCostPerRequest)
    * [const pullRequestFields](#pullRequestFields)
    * [const queriesPerLoadRequest](#queriesPerLoadRequest)
* [Variables](#var)
    * [var categorizers](#categorizers)
    * [var customerMatcher](#customerMatcher)
    * [var emojis](#emojis)
    * [var issueOrPullRequestMatcher](#issueOrPullRequestMatcher)
    * [var now](#now)
    * [var testIssues](#testIssues)
    * [var testUpdate](#testUpdate)
    * [var testUpdateFixture](#testUpdateFixture)
* [Types](#type)
    * [type AssigneeRenderer struct](#AssigneeRenderer)
        * [func NewAssigneeRenderer(context IssueContext, assignee string) *AssigneeRenderer](#NewAssigneeRenderer)
        * [func (ar *AssigneeRenderer) Render() string](#AssigneeRenderer.Render)
        * [func (ar *AssigneeRenderer) doRenderIssue(issue *Issue, milestone string) string](#AssigneeRenderer.doRenderIssue)
        * [func (ar *AssigneeRenderer) findIssue(v *Issue) (int, bool)](#AssigneeRenderer.findIssue)
        * [func (ar *AssigneeRenderer) findPullRequest(v *PullRequest) (int, bool)](#AssigneeRenderer.findPullRequest)
        * [func (ar *AssigneeRenderer) readTrackingIssueURLs() (urls []string)](#AssigneeRenderer.readTrackingIssueURLs)
        * [func (ar *AssigneeRenderer) renderCompletedIssues() (completedParts []MarkdownByIntegerKeyPair)](#AssigneeRenderer.renderCompletedIssues)
        * [func (ar *AssigneeRenderer) renderCompletedPullRequests() (completedParts []MarkdownByIntegerKeyPair)](#AssigneeRenderer.renderCompletedPullRequests)
        * [func (ar *AssigneeRenderer) renderCompletedTrackingIssues() (completedParts []MarkdownByIntegerKeyPair)](#AssigneeRenderer.renderCompletedTrackingIssues)
        * [func (ar *AssigneeRenderer) renderCompletedWork() string](#AssigneeRenderer.renderCompletedWork)
        * [func (ar *AssigneeRenderer) renderIssue(issue *Issue) string](#AssigneeRenderer.renderIssue)
        * [func (ar *AssigneeRenderer) renderPendingIssues() (parts []MarkdownByStringKey)](#AssigneeRenderer.renderPendingIssues)
        * [func (ar *AssigneeRenderer) renderPendingPullRequests() (parts []MarkdownByStringKey)](#AssigneeRenderer.renderPendingPullRequests)
        * [func (ar *AssigneeRenderer) renderPendingTrackingIssues() (parts []MarkdownByStringKey)](#AssigneeRenderer.renderPendingTrackingIssues)
        * [func (ar *AssigneeRenderer) renderPendingWork() string](#AssigneeRenderer.renderPendingWork)
        * [func (ar *AssigneeRenderer) renderPullRequest(pullRequest *PullRequest) string](#AssigneeRenderer.renderPullRequest)
        * [func (ar *AssigneeRenderer) resetDisplayFlags()](#AssigneeRenderer.resetDisplayFlags)
    * [type FixturePayload struct](#FixturePayload)
    * [type Issue struct](#Issue)
        * [func unmarshalIssue(n SearchNode) *Issue](#unmarshalIssue)
        * [func (issue *Issue) Closed() bool](#Issue.Closed)
        * [func (issue *Issue) SafeLabels() []string](#Issue.SafeLabels)
        * [func (issue *Issue) SafeTitle() string](#Issue.SafeTitle)
        * [func (issue *Issue) UpdateBody(markdown string) (updated bool, ok bool)](#Issue.UpdateBody)
    * [type IssueContext struct](#IssueContext)
        * [func NewIssueContext(trackingIssue *Issue, trackingIssues []*Issue, issues []*Issue, pullRequests []*PullRequest) IssueContext](#NewIssueContext)
        * [func (context IssueContext) Match(matcher *Matcher) IssueContext](#IssueContext.Match)
    * [type IssueLoader struct](#IssueLoader)
        * [func NewIssueLoader(queries []string) *IssueLoader](#NewIssueLoader)
        * [func (l *IssueLoader) Load(ctx context.Context, cli *graphql.Client) (issues []*Issue, pullRequests []*PullRequest, _ error)](#IssueLoader.Load)
        * [func (l *IssueLoader) makeNextRequest() (*graphql.Request, bool)](#IssueLoader.makeNextRequest)
        * [func (l *IssueLoader) performRequest(ctx context.Context, cli *graphql.Client, r *graphql.Request) (issues []*Issue, pullRequests []*PullRequest, _ error)](#IssueLoader.performRequest)
    * [type MarkdownByIntegerKeyPair struct](#MarkdownByIntegerKeyPair)
    * [type MarkdownByStringKey struct](#MarkdownByStringKey)
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
        * [func (pullRequest *PullRequest) Done() bool](#PullRequest.Done)
        * [func (pullRequest *PullRequest) Merged() bool](#PullRequest.Merged)
        * [func (pullRequest *PullRequest) SafeLabels() []string](#PullRequest.SafeLabels)
        * [func (pullRequest *PullRequest) SafeTitle() string](#PullRequest.SafeTitle)
    * [type SearchNode struct](#SearchNode)
    * [type SearchResult struct](#SearchResult)
* [Functions](#func)
    * [func Emojis(labels []string, repository, body string, additional map[string]string) string](#Emojis)
    * [func ListTrackingIssues(ctx context.Context, cli *graphql.Client, org string) ([]*Issue, error)](#ListTrackingIssues)
    * [func LoadIssues(ctx context.Context, cli *graphql.Client, queries []string) (issues []*Issue, pullRequests []*PullRequest, err error)](#LoadIssues)
    * [func LoadTrackingIssues(ctx context.Context, cli *graphql.Client, org string, trackingIssues []*Issue) ([]*Issue, []*PullRequest, error)](#LoadTrackingIssues)
    * [func RenderTrackingIssue(context IssueContext) string](#RenderTrackingIssue)
    * [func Resolve(trackingIssues, issues []*Issue, pullRequests []*PullRequest) error](#Resolve)
    * [func SortByIntegerKeyPair(parts []MarkdownByIntegerKeyPair) (markdown []string)](#SortByIntegerKeyPair)
    * [func TestIntegration(t *testing.T)](#TestIntegration)
    * [func categorizeCustomerIssue(labels []string, repository, body string, categories map[string]string)](#categorizeCustomerIssue)
    * [func categorizeLabels(labels []string, repository, body string, categories map[string]string)](#categorizeLabels)
    * [func categorizeSecurityIssue(labels []string, repository, body string, categories map[string]string)](#categorizeSecurityIssue)
    * [func checkForCycles(trackingIssues, issues []*Issue, pullRequests []*PullRequest) error](#checkForCycles)
    * [func chunkQueries(queries []string) (chunks [][]string)](#chunkQueries)
    * [func contains(haystack []string, needle string) bool](#contains)
    * [func deduplicateIssues(issues []*Issue) (deduplicated []*Issue)](#deduplicateIssues)
    * [func deduplicatePullRequests(pullRequests []*PullRequest) (deduplicated []*PullRequest)](#deduplicatePullRequests)
    * [func estimateFromLabelSet(labels []string) float64](#estimateFromLabelSet)
    * [func estimateFromLabelSets(labels [][]string) (days float64)](#estimateFromLabelSets)
    * [func findAssignees(context IssueContext) (assignees []string)](#findAssignees)
    * [func formatTimeSince(t time.Time) string](#formatTimeSince)
    * [func getOrUpdateLastUpdateTime(update bool) (time.Time, error)](#getOrUpdateLastUpdateTime)
    * [func indexOf(s, marker string) (int, bool)](#indexOf)
    * [func linkPullRequestsAndIssues(trackingIssues, issues []*Issue, pullRequests []*PullRequest)](#linkPullRequestsAndIssues)
    * [func linkTrackingIssues(trackingIssues, issues []*Issue, pullRequests []*PullRequest)](#linkTrackingIssues)
    * [func loadIssues(ctx context.Context, cli *graphql.Client, queries []string) (issues []*Issue, pullRequests []*PullRequest, _ error)](#loadIssues)
    * [func main()](#main)
    * [func makeFragmentArgs(n int) (fragments []string, args [][]string)](#makeFragmentArgs)
    * [func makeQueries(org string, trackingIssues []*Issue) (queries []string)](#makeQueries)
    * [func makeSearchQuery(alias string) string](#makeSearchQuery)
    * [func matchingIssues(trackingIssue *Issue, issues []*Issue, matcher *Matcher) (matchingIssues []*Issue)](#matchingIssues)
    * [func matchingPullRequests(pullRequests []*PullRequest, matcher *Matcher) (matchingPullRequests []*PullRequest)](#matchingPullRequests)
    * [func matchingTrackingIssues(trackingIssue *Issue, issues []*Issue, pullRequests []*PullRequest, matcher *Matcher) (matchingTrackingIssues []*Issue)](#matchingTrackingIssues)
    * [func mockLastUpdate(t *testing.T)](#mockLastUpdate)
    * [func nonTrackingLabels(labels []string) (filtered []string)](#nonTrackingLabels)
    * [func partition(s, beginMarker, endMarker string) (string, string, string, bool)](#partition)
    * [func readFixturesFile() (trackingIssues []*Issue, issues []*Issue, pullRequests []*PullRequest, _ error)](#readFixturesFile)
    * [func redactLabels(labels []string) (redacted []string)](#redactLabels)
    * [func renderPullRequest(pullRequest *PullRequest) string](#renderPullRequest)
    * [func run(token, org string, dry, verbose bool) (err error)](#run)
    * [func testAll(tests ...bool) bool](#testAll)
    * [func testFixtures() (trackingIssues []*Issue, issues []*Issue, pullRequests []*PullRequest, _ error)](#testFixtures)
    * [func unmarshalSearchNodes(nodes []SearchNode) (issues []*Issue, prs []*PullRequest)](#unmarshalSearchNodes)
    * [func updateIssue(ctx context.Context, cli *graphql.Client, issue *Issue) (err error)](#updateIssue)
    * [func updateIssues(ctx context.Context, cli *graphql.Client, issues []*Issue) (err error)](#updateIssues)
    * [func updateTestFixtures() (trackingIssues []*Issue, issues []*Issue, pullRequests []*PullRequest, _ error)](#updateTestFixtures)
    * [func visitNode(issue *Issue, visited map[string]struct{}) bool](#visitNode)
    * [func writeFixturesFile(trackingIssues []*Issue, issues []*Issue, pullRequests []*PullRequest) error](#writeFixturesFile)


## <a id="const" href="#const">Constants</a>

```
tags: [package private]
```

### <a id="beginAssigneeMarkerFmt" href="#beginAssigneeMarkerFmt">const beginAssigneeMarkerFmt</a>

```
searchKey: main.beginAssigneeMarkerFmt
tags: [constant string private]
```

```Go
const beginAssigneeMarkerFmt = "<!-- BEGIN ASSIGNEE: %s -->"
```

### <a id="beginWorkMarker" href="#beginWorkMarker">const beginWorkMarker</a>

```
searchKey: main.beginWorkMarker
tags: [constant string private]
```

```Go
const beginWorkMarker = "<!-- BEGIN WORK -->"
```

### <a id="costPerSearch" href="#costPerSearch">const costPerSearch</a>

```
searchKey: main.costPerSearch
tags: [constant number private]
```

```Go
const costPerSearch = 30
```

### <a id="endAssigneeMarker" href="#endAssigneeMarker">const endAssigneeMarker</a>

```
searchKey: main.endAssigneeMarker
tags: [constant string private]
```

```Go
const endAssigneeMarker = "<!-- END ASSIGNEE -->"
```

### <a id="endWorkMarker" href="#endWorkMarker">const endWorkMarker</a>

```
searchKey: main.endWorkMarker
tags: [constant string private]
```

```Go
const endWorkMarker = "<!-- END WORK -->"
```

### <a id="issueFields" href="#issueFields">const issueFields</a>

```
searchKey: main.issueFields
tags: [constant string private]
```

```Go
const issueFields = ...
```

### <a id="maxCostPerRequest" href="#maxCostPerRequest">const maxCostPerRequest</a>

```
searchKey: main.maxCostPerRequest
tags: [constant number private]
```

```Go
const maxCostPerRequest = 1000
```

### <a id="pullRequestFields" href="#pullRequestFields">const pullRequestFields</a>

```
searchKey: main.pullRequestFields
tags: [constant string private]
```

```Go
const pullRequestFields = issueFields + `
	commits(first: 1) { nodes { commit { authoredDate } } }
`
```

### <a id="queriesPerLoadRequest" href="#queriesPerLoadRequest">const queriesPerLoadRequest</a>

```
searchKey: main.queriesPerLoadRequest
tags: [constant number private]
```

```Go
const queriesPerLoadRequest = 10
```

## <a id="var" href="#var">Variables</a>

```
tags: [package private]
```

### <a id="categorizers" href="#categorizers">var categorizers</a>

```
searchKey: main.categorizers
tags: [variable array function private]
```

```Go
var categorizers = ...
```

### <a id="customerMatcher" href="#customerMatcher">var customerMatcher</a>

```
searchKey: main.customerMatcher
tags: [variable struct private]
```

```Go
var customerMatcher = regexp.MustCompile(`https://app\.hubspot\.com/contacts/2762526/company/\d+`)
```

### <a id="emojis" href="#emojis">var emojis</a>

```
searchKey: main.emojis
tags: [variable object private]
```

```Go
var emojis = ...
```

### <a id="issueOrPullRequestMatcher" href="#issueOrPullRequestMatcher">var issueOrPullRequestMatcher</a>

```
searchKey: main.issueOrPullRequestMatcher
tags: [variable struct private]
```

```Go
var issueOrPullRequestMatcher = ...
```

### <a id="now" href="#now">var now</a>

```
searchKey: main.now
tags: [variable function private]
```

```Go
var now = time.Now
```

now returns the current time for relative formatting. This is overwritten during tests to ensure that our output can be byte-for-byte compared against the golden output file. 

### <a id="testIssues" href="#testIssues">var testIssues</a>

```
searchKey: main.testIssues
tags: [variable array number private]
```

```Go
var testIssues = []int{
	13675,
	13987,
	13988,
	14166,
}
```

### <a id="testUpdate" href="#testUpdate">var testUpdate</a>

```
searchKey: main.testUpdate
tags: [variable boolean private]
```

```Go
var testUpdate = flag.Bool("update", false, "update testdata golden")
```

### <a id="testUpdateFixture" href="#testUpdateFixture">var testUpdateFixture</a>

```
searchKey: main.testUpdateFixture
tags: [variable boolean private]
```

```Go
var testUpdateFixture = flag.Bool("update.fixture", false, "update testdata API response")
```

## <a id="type" href="#type">Types</a>

```
tags: [package private]
```

### <a id="AssigneeRenderer" href="#AssigneeRenderer">type AssigneeRenderer struct</a>

```
searchKey: main.AssigneeRenderer
tags: [struct]
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
tags: [method]
```

```Go
func NewAssigneeRenderer(context IssueContext, assignee string) *AssigneeRenderer
```

#### <a id="AssigneeRenderer.Render" href="#AssigneeRenderer.Render">func (ar *AssigneeRenderer) Render() string</a>

```
searchKey: main.AssigneeRenderer.Render
tags: [function]
```

```Go
func (ar *AssigneeRenderer) Render() string
```

Render returns the assignee section of the configured tracking issue for the configured assignee. 

#### <a id="AssigneeRenderer.doRenderIssue" href="#AssigneeRenderer.doRenderIssue">func (ar *AssigneeRenderer) doRenderIssue(issue *Issue, milestone string) string</a>

```
searchKey: main.AssigneeRenderer.doRenderIssue
tags: [method private]
```

```Go
func (ar *AssigneeRenderer) doRenderIssue(issue *Issue, milestone string) string
```

doRenderIssue returns the given issue rendered in markdown. 

#### <a id="AssigneeRenderer.findIssue" href="#AssigneeRenderer.findIssue">func (ar *AssigneeRenderer) findIssue(v *Issue) (int, bool)</a>

```
searchKey: main.AssigneeRenderer.findIssue
tags: [method private]
```

```Go
func (ar *AssigneeRenderer) findIssue(v *Issue) (int, bool)
```

findIssue returns the index of the given issue in the current context. If the issue does not exist then a false-valued flag is returned. 

#### <a id="AssigneeRenderer.findPullRequest" href="#AssigneeRenderer.findPullRequest">func (ar *AssigneeRenderer) findPullRequest(v *PullRequest) (int, bool)</a>

```
searchKey: main.AssigneeRenderer.findPullRequest
tags: [method private]
```

```Go
func (ar *AssigneeRenderer) findPullRequest(v *PullRequest) (int, bool)
```

findPullRequest returns the index of the given pull request in the current context. If the pull request does not exist then a false-valued flag is returned. 

#### <a id="AssigneeRenderer.readTrackingIssueURLs" href="#AssigneeRenderer.readTrackingIssueURLs">func (ar *AssigneeRenderer) readTrackingIssueURLs() (urls []string)</a>

```
searchKey: main.AssigneeRenderer.readTrackingIssueURLs
tags: [function private]
```

```Go
func (ar *AssigneeRenderer) readTrackingIssueURLs() (urls []string)
```

readTrackingIssueURLs reads each line of the current tracking issue body and extracts issue and pull request references. The order of the output slice is the order in which each URL is first referenced and is used to maintain a stable ordering in the GitHub UI. 

Note: We use the fact that rendered work items always reference themselves first, and any additional issue or pull request URLs on that line are only references. By parsing line-by-line and pulling the first URL we see, we should get an accurate ordering. 

#### <a id="AssigneeRenderer.renderCompletedIssues" href="#AssigneeRenderer.renderCompletedIssues">func (ar *AssigneeRenderer) renderCompletedIssues() (completedParts []MarkdownByIntegerKeyPair)</a>

```
searchKey: main.AssigneeRenderer.renderCompletedIssues
tags: [function private]
```

```Go
func (ar *AssigneeRenderer) renderCompletedIssues() (completedParts []MarkdownByIntegerKeyPair)
```

renderCompletedIssues returns a rendered list of closed issues along with that issue's closed-at time and that issue's number for later reordering of the resulting list. 

#### <a id="AssigneeRenderer.renderCompletedPullRequests" href="#AssigneeRenderer.renderCompletedPullRequests">func (ar *AssigneeRenderer) renderCompletedPullRequests() (completedParts []MarkdownByIntegerKeyPair)</a>

```
searchKey: main.AssigneeRenderer.renderCompletedPullRequests
tags: [function private]
```

```Go
func (ar *AssigneeRenderer) renderCompletedPullRequests() (completedParts []MarkdownByIntegerKeyPair)
```

renderCompletedPullRequests returns a rendered list of closed pull request along with that pull request's closed-at time and that pull request's number for later reordering of the resulting list. 

#### <a id="AssigneeRenderer.renderCompletedTrackingIssues" href="#AssigneeRenderer.renderCompletedTrackingIssues">func (ar *AssigneeRenderer) renderCompletedTrackingIssues() (completedParts []MarkdownByIntegerKeyPair)</a>

```
searchKey: main.AssigneeRenderer.renderCompletedTrackingIssues
tags: [function private]
```

```Go
func (ar *AssigneeRenderer) renderCompletedTrackingIssues() (completedParts []MarkdownByIntegerKeyPair)
```

renderCompletedTrackingIsssues returns a rendered list of closed tracking issues along with that issue's closed-at time and that issue's number for later reordering of the resulting list. This will also set the completed flag on all tracked issues and pull requests. 

#### <a id="AssigneeRenderer.renderCompletedWork" href="#AssigneeRenderer.renderCompletedWork">func (ar *AssigneeRenderer) renderCompletedWork() string</a>

```
searchKey: main.AssigneeRenderer.renderCompletedWork
tags: [function private]
```

```Go
func (ar *AssigneeRenderer) renderCompletedWork() string
```

renderCompletedWork returns a list of completed work items rendered in markdown. 

#### <a id="AssigneeRenderer.renderIssue" href="#AssigneeRenderer.renderIssue">func (ar *AssigneeRenderer) renderIssue(issue *Issue) string</a>

```
searchKey: main.AssigneeRenderer.renderIssue
tags: [method private]
```

```Go
func (ar *AssigneeRenderer) renderIssue(issue *Issue) string
```

renderIssue returns the given issue rendered as markdown. This will also set the displayed flag on this issue as well as all linked pull requests. 

#### <a id="AssigneeRenderer.renderPendingIssues" href="#AssigneeRenderer.renderPendingIssues">func (ar *AssigneeRenderer) renderPendingIssues() (parts []MarkdownByStringKey)</a>

```
searchKey: main.AssigneeRenderer.renderPendingIssues
tags: [function private]
```

```Go
func (ar *AssigneeRenderer) renderPendingIssues() (parts []MarkdownByStringKey)
```

renderPendingIssues returns a rendered list of unclosed issues along with that issue's URL for later reordering of the resulting list. The resulting list does not include any issue that was already rendered by renderPendingTrackingIssues. 

#### <a id="AssigneeRenderer.renderPendingPullRequests" href="#AssigneeRenderer.renderPendingPullRequests">func (ar *AssigneeRenderer) renderPendingPullRequests() (parts []MarkdownByStringKey)</a>

```
searchKey: main.AssigneeRenderer.renderPendingPullRequests
tags: [function private]
```

```Go
func (ar *AssigneeRenderer) renderPendingPullRequests() (parts []MarkdownByStringKey)
```

renderPendingPullRequests returns a rendered list of unclosed pull requests along with that issue's URL for later reordering of the resulting list. The resulting list does not include any pull request that was already rendered by renderPendingTrackingIssues or renderPendingIssues. 

#### <a id="AssigneeRenderer.renderPendingTrackingIssues" href="#AssigneeRenderer.renderPendingTrackingIssues">func (ar *AssigneeRenderer) renderPendingTrackingIssues() (parts []MarkdownByStringKey)</a>

```
searchKey: main.AssigneeRenderer.renderPendingTrackingIssues
tags: [function private]
```

```Go
func (ar *AssigneeRenderer) renderPendingTrackingIssues() (parts []MarkdownByStringKey)
```

renderPendingTrackingIssues returns a rendered list of tracking issues (with rendered children) along with that tracking issue's URL for later reordering of the resulting list. 

#### <a id="AssigneeRenderer.renderPendingWork" href="#AssigneeRenderer.renderPendingWork">func (ar *AssigneeRenderer) renderPendingWork() string</a>

```
searchKey: main.AssigneeRenderer.renderPendingWork
tags: [function private]
```

```Go
func (ar *AssigneeRenderer) renderPendingWork() string
```

renderPendingWork returns a list of pending work items rendered in markdown. 

#### <a id="AssigneeRenderer.renderPullRequest" href="#AssigneeRenderer.renderPullRequest">func (ar *AssigneeRenderer) renderPullRequest(pullRequest *PullRequest) string</a>

```
searchKey: main.AssigneeRenderer.renderPullRequest
tags: [method private]
```

```Go
func (ar *AssigneeRenderer) renderPullRequest(pullRequest *PullRequest) string
```

renderPullRequest returns the given pull request rendered as markdown. This will also set the displayed flag on the pull request. 

#### <a id="AssigneeRenderer.resetDisplayFlags" href="#AssigneeRenderer.resetDisplayFlags">func (ar *AssigneeRenderer) resetDisplayFlags()</a>

```
searchKey: main.AssigneeRenderer.resetDisplayFlags
tags: [function private]
```

```Go
func (ar *AssigneeRenderer) resetDisplayFlags()
```

resetDisplayFlags unsets the displayed flag for all issues and pull requests. 

### <a id="FixturePayload" href="#FixturePayload">type FixturePayload struct</a>

```
searchKey: main.FixturePayload
tags: [struct private]
```

```Go
type FixturePayload struct {
	TrackingIssues []*Issue
	Issues         []*Issue
	PullRequests   []*PullRequest
}
```

### <a id="Issue" href="#Issue">type Issue struct</a>

```
searchKey: main.Issue
tags: [struct]
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
tags: [method private]
```

```Go
func unmarshalIssue(n SearchNode) *Issue
```

unmarshalIssue unmarshals the given node into an issue object. 

#### <a id="Issue.Closed" href="#Issue.Closed">func (issue *Issue) Closed() bool</a>

```
searchKey: main.Issue.Closed
tags: [function]
```

```Go
func (issue *Issue) Closed() bool
```

#### <a id="Issue.SafeLabels" href="#Issue.SafeLabels">func (issue *Issue) SafeLabels() []string</a>

```
searchKey: main.Issue.SafeLabels
tags: [function]
```

```Go
func (issue *Issue) SafeLabels() []string
```

#### <a id="Issue.SafeTitle" href="#Issue.SafeTitle">func (issue *Issue) SafeTitle() string</a>

```
searchKey: main.Issue.SafeTitle
tags: [function]
```

```Go
func (issue *Issue) SafeTitle() string
```

#### <a id="Issue.UpdateBody" href="#Issue.UpdateBody">func (issue *Issue) UpdateBody(markdown string) (updated bool, ok bool)</a>

```
searchKey: main.Issue.UpdateBody
tags: [method]
```

```Go
func (issue *Issue) UpdateBody(markdown string) (updated bool, ok bool)
```

### <a id="IssueContext" href="#IssueContext">type IssueContext struct</a>

```
searchKey: main.IssueContext
tags: [struct]
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
tags: [method]
```

```Go
func NewIssueContext(trackingIssue *Issue, trackingIssues []*Issue, issues []*Issue, pullRequests []*PullRequest) IssueContext
```

NewIssueContext creates  anew issue context with the given visible issues, tracking issues, and pull requests. 

#### <a id="IssueContext.Match" href="#IssueContext.Match">func (context IssueContext) Match(matcher *Matcher) IssueContext</a>

```
searchKey: main.IssueContext.Match
tags: [method]
```

```Go
func (context IssueContext) Match(matcher *Matcher) IssueContext
```

Match will return a new issue context where all visible issues and pull requests match the given matcher. 

### <a id="IssueLoader" href="#IssueLoader">type IssueLoader struct</a>

```
searchKey: main.IssueLoader
tags: [struct]
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
tags: [method]
```

```Go
func NewIssueLoader(queries []string) *IssueLoader
```

NewIssueLoader creates a new IssueLoader with the given queries. 

#### <a id="IssueLoader.Load" href="#IssueLoader.Load">func (l *IssueLoader) Load(ctx context.Context, cli *graphql.Client) (issues []*Issue, pullRequests []*PullRequest, _ error)</a>

```
searchKey: main.IssueLoader.Load
tags: [method]
```

```Go
func (l *IssueLoader) Load(ctx context.Context, cli *graphql.Client) (issues []*Issue, pullRequests []*PullRequest, _ error)
```

Load will load all issues and pull requests matching the configured queries. Tracking issues are filtered out of the resulting issues list. 

#### <a id="IssueLoader.makeNextRequest" href="#IssueLoader.makeNextRequest">func (l *IssueLoader) makeNextRequest() (*graphql.Request, bool)</a>

```
searchKey: main.IssueLoader.makeNextRequest
tags: [function private]
```

```Go
func (l *IssueLoader) makeNextRequest() (*graphql.Request, bool)
```

makeNextRequest will construct a new request based on the given cursor values. If no request should be performed, this method will return a false-valued flag. 

#### <a id="IssueLoader.performRequest" href="#IssueLoader.performRequest">func (l *IssueLoader) performRequest(ctx context.Context, cli *graphql.Client, r *graphql.Request) (issues []*Issue, pullRequests []*PullRequest, _ error)</a>

```
searchKey: main.IssueLoader.performRequest
tags: [method private]
```

```Go
func (l *IssueLoader) performRequest(ctx context.Context, cli *graphql.Client, r *graphql.Request) (issues []*Issue, pullRequests []*PullRequest, _ error)
```

performRequest will perform the given request and return the deserialized list of issues and pull requests. 

### <a id="MarkdownByIntegerKeyPair" href="#MarkdownByIntegerKeyPair">type MarkdownByIntegerKeyPair struct</a>

```
searchKey: main.MarkdownByIntegerKeyPair
tags: [struct]
```

```Go
type MarkdownByIntegerKeyPair struct {
	markdown string
	key1     int64
	key2     int64
}
```

### <a id="MarkdownByStringKey" href="#MarkdownByStringKey">type MarkdownByStringKey struct</a>

```
searchKey: main.MarkdownByStringKey
tags: [struct]
```

```Go
type MarkdownByStringKey struct {
	markdown string
	key      string
}
```

### <a id="Matcher" href="#Matcher">type Matcher struct</a>

```
searchKey: main.Matcher
tags: [struct]
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
tags: [method]
```

```Go
func NewMatcher(labels []string, milestone string, assignee string, noAssignee bool) *Matcher
```

NewMatcher returns a matcher with the given expected properties. 

#### <a id="Matcher.Issue" href="#Matcher.Issue">func (m *Matcher) Issue(issue *Issue) bool</a>

```
searchKey: main.Matcher.Issue
tags: [method]
```

```Go
func (m *Matcher) Issue(issue *Issue) bool
```

Issue returns true if the given issue matches the expected properties. An issue with the tracking issue will never be matched. 

#### <a id="Matcher.PullRequest" href="#Matcher.PullRequest">func (m *Matcher) PullRequest(pullRequest *PullRequest) bool</a>

```
searchKey: main.Matcher.PullRequest
tags: [method]
```

```Go
func (m *Matcher) PullRequest(pullRequest *PullRequest) bool
```

PullRequest returns true if the given pull request matches the expected properties. 

#### <a id="Matcher.testAssignee" href="#Matcher.testAssignee">func (m *Matcher) testAssignee(assignees ...string) bool</a>

```
searchKey: main.Matcher.testAssignee
tags: [method private]
```

```Go
func (m *Matcher) testAssignee(assignees ...string) bool
```

testAssignee returns true if this matcher was configured with a non-empty assignee that is present in the given list of assignees. 

#### <a id="Matcher.testLabels" href="#Matcher.testLabels">func (m *Matcher) testLabels(labels []string) bool</a>

```
searchKey: main.Matcher.testLabels
tags: [method private]
```

```Go
func (m *Matcher) testLabels(labels []string) bool
```

testLabels returns true if every label that this matcher was configured with exists in the given label list. 

#### <a id="Matcher.testMilestone" href="#Matcher.testMilestone">func (m *Matcher) testMilestone(milestone string, labels []string) bool</a>

```
searchKey: main.Matcher.testMilestone
tags: [method private]
```

```Go
func (m *Matcher) testMilestone(milestone string, labels []string) bool
```

testMilestone returns true if the given milestone matches the milestone the matcher was configured with, if the given labels contains a planned/{milestone} label, or the milestone on the tracking issue is not restricted. 

### <a id="PullRequest" href="#PullRequest">type PullRequest struct</a>

```
searchKey: main.PullRequest
tags: [struct]
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
tags: [method private]
```

```Go
func unmarshalPullRequest(n SearchNode) *PullRequest
```

unmarshalPullRequest unmarshals the given node into an pull request object. 

#### <a id="PullRequest.Closed" href="#PullRequest.Closed">func (pullRequest *PullRequest) Closed() bool</a>

```
searchKey: main.PullRequest.Closed
tags: [function]
```

```Go
func (pullRequest *PullRequest) Closed() bool
```

#### <a id="PullRequest.Done" href="#PullRequest.Done">func (pullRequest *PullRequest) Done() bool</a>

```
searchKey: main.PullRequest.Done
tags: [function]
```

```Go
func (pullRequest *PullRequest) Done() bool
```

#### <a id="PullRequest.Merged" href="#PullRequest.Merged">func (pullRequest *PullRequest) Merged() bool</a>

```
searchKey: main.PullRequest.Merged
tags: [function]
```

```Go
func (pullRequest *PullRequest) Merged() bool
```

#### <a id="PullRequest.SafeLabels" href="#PullRequest.SafeLabels">func (pullRequest *PullRequest) SafeLabels() []string</a>

```
searchKey: main.PullRequest.SafeLabels
tags: [function]
```

```Go
func (pullRequest *PullRequest) SafeLabels() []string
```

#### <a id="PullRequest.SafeTitle" href="#PullRequest.SafeTitle">func (pullRequest *PullRequest) SafeTitle() string</a>

```
searchKey: main.PullRequest.SafeTitle
tags: [function]
```

```Go
func (pullRequest *PullRequest) SafeTitle() string
```

### <a id="SearchNode" href="#SearchNode">type SearchNode struct</a>

```
searchKey: main.SearchNode
tags: [struct]
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

### <a id="SearchResult" href="#SearchResult">type SearchResult struct</a>

```
searchKey: main.SearchResult
tags: [struct]
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

## <a id="func" href="#func">Functions</a>

```
tags: [package private]
```

### <a id="Emojis" href="#Emojis">func Emojis(labels []string, repository, body string, additional map[string]string) string</a>

```
searchKey: main.Emojis
tags: [method]
```

```Go
func Emojis(labels []string, repository, body string, additional map[string]string) string
```

Emojis returns a string of emojis that should be displayed with an issue or a pull request. Additional emojis can be supplied and will overwrite any emoji with the same category. 

### <a id="ListTrackingIssues" href="#ListTrackingIssues">func ListTrackingIssues(ctx context.Context, cli *graphql.Client, org string) ([]*Issue, error)</a>

```
searchKey: main.ListTrackingIssues
tags: [method]
```

```Go
func ListTrackingIssues(ctx context.Context, cli *graphql.Client, org string) ([]*Issue, error)
```

ListTrackingIssues returns all issues with the `tracking` label (and at least one other label) in the given organization. 

### <a id="LoadIssues" href="#LoadIssues">func LoadIssues(ctx context.Context, cli *graphql.Client, queries []string) (issues []*Issue, pullRequests []*PullRequest, err error)</a>

```
searchKey: main.LoadIssues
tags: [method]
```

```Go
func LoadIssues(ctx context.Context, cli *graphql.Client, queries []string) (issues []*Issue, pullRequests []*PullRequest, err error)
```

LoadIssues will load all issues and pull requests matching the configured queries by making multiple queries in parallel and merging and deduplicating the result. Tracking issues are filtered out of the resulting issues list. 

### <a id="LoadTrackingIssues" href="#LoadTrackingIssues">func LoadTrackingIssues(ctx context.Context, cli *graphql.Client, org string, trackingIssues []*Issue) ([]*Issue, []*PullRequest, error)</a>

```
searchKey: main.LoadTrackingIssues
tags: [method]
```

```Go
func LoadTrackingIssues(ctx context.Context, cli *graphql.Client, org string, trackingIssues []*Issue) ([]*Issue, []*PullRequest, error)
```

LoadTrackingIssues returns all issues and pull requests which are relevant to the given set of tracking issues in the given organization. The result of this function may be a superset of objects that should be rendered for the tracking issue. 

### <a id="RenderTrackingIssue" href="#RenderTrackingIssue">func RenderTrackingIssue(context IssueContext) string</a>

```
searchKey: main.RenderTrackingIssue
tags: [method]
```

```Go
func RenderTrackingIssue(context IssueContext) string
```

RenderTrackingIssue renders the work section of the given tracking issue. 

### <a id="Resolve" href="#Resolve">func Resolve(trackingIssues, issues []*Issue, pullRequests []*PullRequest) error</a>

```
searchKey: main.Resolve
tags: [method]
```

```Go
func Resolve(trackingIssues, issues []*Issue, pullRequests []*PullRequest) error
```

Resolve will populate the relationship fields of the registered issues and pull requests objects. 

### <a id="SortByIntegerKeyPair" href="#SortByIntegerKeyPair">func SortByIntegerKeyPair(parts []MarkdownByIntegerKeyPair) (markdown []string)</a>

```
searchKey: main.SortByIntegerKeyPair
tags: [method]
```

```Go
func SortByIntegerKeyPair(parts []MarkdownByIntegerKeyPair) (markdown []string)
```

### <a id="TestIntegration" href="#TestIntegration">func TestIntegration(t *testing.T)</a>

```
searchKey: main.TestIntegration
tags: [method private test]
```

```Go
func TestIntegration(t *testing.T)
```

### <a id="categorizeCustomerIssue" href="#categorizeCustomerIssue">func categorizeCustomerIssue(labels []string, repository, body string, categories map[string]string)</a>

```
searchKey: main.categorizeCustomerIssue
tags: [method private]
```

```Go
func categorizeCustomerIssue(labels []string, repository, body string, categories map[string]string)
```

categorizeCustomerIssue adds a customer emoji if the repository matches sourcegraph/customer or if the issue contains a hubspot URL. 

### <a id="categorizeLabels" href="#categorizeLabels">func categorizeLabels(labels []string, repository, body string, categories map[string]string)</a>

```
searchKey: main.categorizeLabels
tags: [method private]
```

```Go
func categorizeLabels(labels []string, repository, body string, categories map[string]string)
```

categorizeLabels adds emojis based on the issue labels. 

### <a id="categorizeSecurityIssue" href="#categorizeSecurityIssue">func categorizeSecurityIssue(labels []string, repository, body string, categories map[string]string)</a>

```
searchKey: main.categorizeSecurityIssue
tags: [method private]
```

```Go
func categorizeSecurityIssue(labels []string, repository, body string, categories map[string]string)
```

categorizeSecurityIssue adds a security emoji if the repository matches sourcegraph/security-issues. 

### <a id="checkForCycles" href="#checkForCycles">func checkForCycles(trackingIssues, issues []*Issue, pullRequests []*PullRequest) error</a>

```
searchKey: main.checkForCycles
tags: [method private]
```

```Go
func checkForCycles(trackingIssues, issues []*Issue, pullRequests []*PullRequest) error
```

checkForCycles checks for a cycle over the tracked issues relationship in the set of resolved issues. We currently check this condition because the rendering pass does not check for cycles and can create an infinite loop. 

### <a id="chunkQueries" href="#chunkQueries">func chunkQueries(queries []string) (chunks [][]string)</a>

```
searchKey: main.chunkQueries
tags: [method private]
```

```Go
func chunkQueries(queries []string) (chunks [][]string)
```

chunkQueries returns the given queries spread across a number of slices. Each slice should contain at most queriesPerLoadRequest elements. 

### <a id="contains" href="#contains">func contains(haystack []string, needle string) bool</a>

```
searchKey: main.contains
tags: [method private]
```

```Go
func contains(haystack []string, needle string) bool
```

### <a id="deduplicateIssues" href="#deduplicateIssues">func deduplicateIssues(issues []*Issue) (deduplicated []*Issue)</a>

```
searchKey: main.deduplicateIssues
tags: [method private]
```

```Go
func deduplicateIssues(issues []*Issue) (deduplicated []*Issue)
```

### <a id="deduplicatePullRequests" href="#deduplicatePullRequests">func deduplicatePullRequests(pullRequests []*PullRequest) (deduplicated []*PullRequest)</a>

```
searchKey: main.deduplicatePullRequests
tags: [method private]
```

```Go
func deduplicatePullRequests(pullRequests []*PullRequest) (deduplicated []*PullRequest)
```

### <a id="estimateFromLabelSet" href="#estimateFromLabelSet">func estimateFromLabelSet(labels []string) float64</a>

```
searchKey: main.estimateFromLabelSet
tags: [method private]
```

```Go
func estimateFromLabelSet(labels []string) float64
```

estimateFromLabelSet returns the value of a `estimate/` lables in the given label set. 

### <a id="estimateFromLabelSets" href="#estimateFromLabelSets">func estimateFromLabelSets(labels [][]string) (days float64)</a>

```
searchKey: main.estimateFromLabelSets
tags: [method private]
```

```Go
func estimateFromLabelSets(labels [][]string) (days float64)
```

estimateFromLabelSets returns the sum of `estimate/` labels in the given label sets. 

### <a id="findAssignees" href="#findAssignees">func findAssignees(context IssueContext) (assignees []string)</a>

```
searchKey: main.findAssignees
tags: [method private]
```

```Go
func findAssignees(context IssueContext) (assignees []string)
```

findAssignees returns the list of assignees for the given tracking issue. A user is an assignee for a tracking issue if there is a _leaf_ (non-tracking) issue or a pull request with that user as the assignee or author, respectively. 

### <a id="formatTimeSince" href="#formatTimeSince">func formatTimeSince(t time.Time) string</a>

```
searchKey: main.formatTimeSince
tags: [method private]
```

```Go
func formatTimeSince(t time.Time) string
```

formatTimeSince will return a string containing the number of days since the given time. 

### <a id="getOrUpdateLastUpdateTime" href="#getOrUpdateLastUpdateTime">func getOrUpdateLastUpdateTime(update bool) (time.Time, error)</a>

```
searchKey: main.getOrUpdateLastUpdateTime
tags: [method private]
```

```Go
func getOrUpdateLastUpdateTime(update bool) (time.Time, error)
```

### <a id="indexOf" href="#indexOf">func indexOf(s, marker string) (int, bool)</a>

```
searchKey: main.indexOf
tags: [method private]
```

```Go
func indexOf(s, marker string) (int, bool)
```

### <a id="linkPullRequestsAndIssues" href="#linkPullRequestsAndIssues">func linkPullRequestsAndIssues(trackingIssues, issues []*Issue, pullRequests []*PullRequest)</a>

```
searchKey: main.linkPullRequestsAndIssues
tags: [method private]
```

```Go
func linkPullRequestsAndIssues(trackingIssues, issues []*Issue, pullRequests []*PullRequest)
```

linkPullRequestsAndIssues populates the LinkedPullRequests and LinkedIssues fields of each resolved issue and pull request value. A pull request and an issue are linked if the pull request body contains a reference to the issue number. 

### <a id="linkTrackingIssues" href="#linkTrackingIssues">func linkTrackingIssues(trackingIssues, issues []*Issue, pullRequests []*PullRequest)</a>

```
searchKey: main.linkTrackingIssues
tags: [method private]
```

```Go
func linkTrackingIssues(trackingIssues, issues []*Issue, pullRequests []*PullRequest)
```

linkTrackingIssues populates the TrackedIssues, TrackedPullRequests, and TrackedBy fields of each resolved issue and pull request value. An issue or pull request is tracked by a tracking issue if the labels, milestone, and assignees all match the tracking issue properties (if supplied). 

### <a id="loadIssues" href="#loadIssues">func loadIssues(ctx context.Context, cli *graphql.Client, queries []string) (issues []*Issue, pullRequests []*PullRequest, _ error)</a>

```
searchKey: main.loadIssues
tags: [method private]
```

```Go
func loadIssues(ctx context.Context, cli *graphql.Client, queries []string) (issues []*Issue, pullRequests []*PullRequest, _ error)
```

loadIssues will load all issues and pull requests matching the configured queries. Tracking issues are filtered out of the resulting issues list. 

### <a id="main" href="#main">func main()</a>

```
searchKey: main.main
tags: [function private]
```

```Go
func main()
```

### <a id="makeFragmentArgs" href="#makeFragmentArgs">func makeFragmentArgs(n int) (fragments []string, args [][]string)</a>

```
searchKey: main.makeFragmentArgs
tags: [method private]
```

```Go
func makeFragmentArgs(n int) (fragments []string, args [][]string)
```

makeFragmentArgs makes `n` named GraphQL fragment and an associated set of variables. This is used to later construct a GraphQL request with a subset of these queries. 

### <a id="makeQueries" href="#makeQueries">func makeQueries(org string, trackingIssues []*Issue) (queries []string)</a>

```
searchKey: main.makeQueries
tags: [method private]
```

```Go
func makeQueries(org string, trackingIssues []*Issue) (queries []string)
```

makeQueries returns a set of search queries that, when queried together, should return all of the relevant issue and pull requests for the given tracking issues. 

### <a id="makeSearchQuery" href="#makeSearchQuery">func makeSearchQuery(alias string) string</a>

```
searchKey: main.makeSearchQuery
tags: [method private]
```

```Go
func makeSearchQuery(alias string) string
```

makeSearchQuery creates a GraphQL `search` fragment that captures the fields of issue and pull request types. This fragment expects that the outer request defines the variables `query${alias}`, `count${alias}`, and `cursor${alias}`. 

### <a id="matchingIssues" href="#matchingIssues">func matchingIssues(trackingIssue *Issue, issues []*Issue, matcher *Matcher) (matchingIssues []*Issue)</a>

```
searchKey: main.matchingIssues
tags: [method private]
```

```Go
func matchingIssues(trackingIssue *Issue, issues []*Issue, matcher *Matcher) (matchingIssues []*Issue)
```

matchingIssues returns the given issues that match the given matcher. 

### <a id="matchingPullRequests" href="#matchingPullRequests">func matchingPullRequests(pullRequests []*PullRequest, matcher *Matcher) (matchingPullRequests []*PullRequest)</a>

```
searchKey: main.matchingPullRequests
tags: [method private]
```

```Go
func matchingPullRequests(pullRequests []*PullRequest, matcher *Matcher) (matchingPullRequests []*PullRequest)
```

matchingPullRequests returns the given pull requests that match the given matcher. 

### <a id="matchingTrackingIssues" href="#matchingTrackingIssues">func matchingTrackingIssues(trackingIssue *Issue, issues []*Issue, pullRequests []*PullRequest, matcher *Matcher) (matchingTrackingIssues []*Issue)</a>

```
searchKey: main.matchingTrackingIssues
tags: [method private]
```

```Go
func matchingTrackingIssues(trackingIssue *Issue, issues []*Issue, pullRequests []*PullRequest, matcher *Matcher) (matchingTrackingIssues []*Issue)
```

matchingTrackingIssues returns the given tracking issues that match the matcher and do not track only a `team/*` label. 

### <a id="mockLastUpdate" href="#mockLastUpdate">func mockLastUpdate(t *testing.T)</a>

```
searchKey: main.mockLastUpdate
tags: [method private]
```

```Go
func mockLastUpdate(t *testing.T)
```

### <a id="nonTrackingLabels" href="#nonTrackingLabels">func nonTrackingLabels(labels []string) (filtered []string)</a>

```
searchKey: main.nonTrackingLabels
tags: [method private]
```

```Go
func nonTrackingLabels(labels []string) (filtered []string)
```

### <a id="partition" href="#partition">func partition(s, beginMarker, endMarker string) (string, string, string, bool)</a>

```
searchKey: main.partition
tags: [method private]
```

```Go
func partition(s, beginMarker, endMarker string) (string, string, string, bool)
```

### <a id="readFixturesFile" href="#readFixturesFile">func readFixturesFile() (trackingIssues []*Issue, issues []*Issue, pullRequests []*PullRequest, _ error)</a>

```
searchKey: main.readFixturesFile
tags: [function private]
```

```Go
func readFixturesFile() (trackingIssues []*Issue, issues []*Issue, pullRequests []*PullRequest, _ error)
```

### <a id="redactLabels" href="#redactLabels">func redactLabels(labels []string) (redacted []string)</a>

```
searchKey: main.redactLabels
tags: [method private]
```

```Go
func redactLabels(labels []string) (redacted []string)
```

### <a id="renderPullRequest" href="#renderPullRequest">func renderPullRequest(pullRequest *PullRequest) string</a>

```
searchKey: main.renderPullRequest
tags: [method private]
```

```Go
func renderPullRequest(pullRequest *PullRequest) string
```

renderPullRequest returns the given pull request rendered in markdown. 

### <a id="run" href="#run">func run(token, org string, dry, verbose bool) (err error)</a>

```
searchKey: main.run
tags: [method private]
```

```Go
func run(token, org string, dry, verbose bool) (err error)
```

### <a id="testAll" href="#testAll">func testAll(tests ...bool) bool</a>

```
searchKey: main.testAll
tags: [method private]
```

```Go
func testAll(tests ...bool) bool
```

testAll returns true if all of the given values are true. 

### <a id="testFixtures" href="#testFixtures">func testFixtures() (trackingIssues []*Issue, issues []*Issue, pullRequests []*PullRequest, _ error)</a>

```
searchKey: main.testFixtures
tags: [function private]
```

```Go
func testFixtures() (trackingIssues []*Issue, issues []*Issue, pullRequests []*PullRequest, _ error)
```

### <a id="unmarshalSearchNodes" href="#unmarshalSearchNodes">func unmarshalSearchNodes(nodes []SearchNode) (issues []*Issue, prs []*PullRequest)</a>

```
searchKey: main.unmarshalSearchNodes
tags: [method private]
```

```Go
func unmarshalSearchNodes(nodes []SearchNode) (issues []*Issue, prs []*PullRequest)
```

unmarshalSearchNodes unmarshals the given nodes into a list of issues and a list of pull requests. 

### <a id="updateIssue" href="#updateIssue">func updateIssue(ctx context.Context, cli *graphql.Client, issue *Issue) (err error)</a>

```
searchKey: main.updateIssue
tags: [method private]
```

```Go
func updateIssue(ctx context.Context, cli *graphql.Client, issue *Issue) (err error)
```

### <a id="updateIssues" href="#updateIssues">func updateIssues(ctx context.Context, cli *graphql.Client, issues []*Issue) (err error)</a>

```
searchKey: main.updateIssues
tags: [method private]
```

```Go
func updateIssues(ctx context.Context, cli *graphql.Client, issues []*Issue) (err error)
```

updateIssues will update the body of each of the given issues. Each issue update is performed as a separate GraphQL query over multiple goroutines (one per logical processor). The returned error value, if any, will be an aggregate of errors over all requests. 

### <a id="updateTestFixtures" href="#updateTestFixtures">func updateTestFixtures() (trackingIssues []*Issue, issues []*Issue, pullRequests []*PullRequest, _ error)</a>

```
searchKey: main.updateTestFixtures
tags: [function private]
```

```Go
func updateTestFixtures() (trackingIssues []*Issue, issues []*Issue, pullRequests []*PullRequest, _ error)
```

### <a id="visitNode" href="#visitNode">func visitNode(issue *Issue, visited map[string]struct{}) bool</a>

```
searchKey: main.visitNode
tags: [method private]
```

```Go
func visitNode(issue *Issue, visited map[string]struct{}) bool
```

visitNode performs a depth-first-search over tracked issues relationships. This function will return false if the traversal encounters a node that has already been visited. 

### <a id="writeFixturesFile" href="#writeFixturesFile">func writeFixturesFile(trackingIssues []*Issue, issues []*Issue, pullRequests []*PullRequest) error</a>

```
searchKey: main.writeFixturesFile
tags: [method private]
```

```Go
func writeFixturesFile(trackingIssues []*Issue, issues []*Issue, pullRequests []*PullRequest) error
```

