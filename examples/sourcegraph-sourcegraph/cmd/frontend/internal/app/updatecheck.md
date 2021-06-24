# Package updatecheck

Package updatecheck provides a client and HTTP handler for checking and serving software update information for Sourcegraph versions. 

## Index

* [Constants](#const)
    * [const redisInfoCommand](#redisInfoCommand)
* [Variables](#var)
    * [var codeIntelActionNames](#codeIntelActionNames)
    * [var codeIntelSourceNames](#codeIntelSourceNames)
    * [var dateRegex](#dateRegex)
    * [var errorCounter](#errorCounter)
    * [var lastStatus](#lastStatus)
    * [var latestReleaseDockerComposeOrPureDocker](#latestReleaseDockerComposeOrPureDocker)
    * [var latestReleaseDockerServerImageBuild](#latestReleaseDockerServerImageBuild)
    * [var latestReleaseKubernetesBuild](#latestReleaseKubernetesBuild)
    * [var metricsRecorder](#metricsRecorder)
    * [var mu](#mu)
    * [var pubSubPingsTopicID](#pubSubPingsTopicID)
    * [var requestCounter](#requestCounter)
    * [var requestHasUpdateCounter](#requestHasUpdateCounter)
    * [var started](#started)
    * [var startedAt](#startedAt)
    * [var timeNow](#timeNow)
* [Types](#type)
    * [type Status struct](#Status)
        * [func Last() *Status](#Last)
        * [func (s Status) HasUpdate() bool](#Status.HasUpdate)
    * [type build struct](#build)
        * [func getLatestRelease(deployType string) build](#getLatestRelease)
        * [func newBuild(version string) build](#newBuild)
    * [type dependencyVersions struct](#dependencyVersions)
    * [type jsonCodeIntelUsage struct](#jsonCodeIntelUsage)
    * [type jsonEventSummary struct](#jsonEventSummary)
        * [func translateEventSummary(es types.CodeIntelEventSummary) jsonEventSummary](#translateEventSummary)
    * [type pingPayload struct](#pingPayload)
    * [type pingRequest struct](#pingRequest)
        * [func readPingRequest(r *http.Request) (*pingRequest, error)](#readPingRequest)
        * [func readPingRequestFromBody(body io.ReadCloser) (*pingRequest, error)](#readPingRequestFromBody)
        * [func readPingRequestFromQuery(q url.Values) (*pingRequest, error)](#readPingRequestFromQuery)
* [Functions](#func)
    * [func Handler(w http.ResponseWriter, r *http.Request)](#Handler)
    * [func IsPending() bool](#IsPending)
    * [func Start(db dbutil.DB)](#Start)
    * [func TestCanUpdate(t *testing.T)](#TestCanUpdate)
    * [func TestLatestDockerComposeOrPureDockerVersionPushed(t *testing.T)](#TestLatestDockerComposeOrPureDockerVersionPushed)
    * [func TestLatestDockerVersionPushed(t *testing.T)](#TestLatestDockerVersionPushed)
    * [func TestLatestKubernetesVersionPushed(t *testing.T)](#TestLatestKubernetesVersionPushed)
    * [func TestParseRedisInfo(t *testing.T)](#TestParseRedisInfo)
    * [func TestSerializeAutomationUsage(t *testing.T)](#TestSerializeAutomationUsage)
    * [func TestSerializeBasic(t *testing.T)](#TestSerializeBasic)
    * [func TestSerializeCodeIntelUsage(t *testing.T)](#TestSerializeCodeIntelUsage)
    * [func TestSerializeFromQuery(t *testing.T)](#TestSerializeFromQuery)
    * [func TestSerializeOldCodeIntelUsage(t *testing.T)](#TestSerializeOldCodeIntelUsage)
    * [func authProviderTypes() []string](#authProviderTypes)
    * [func canUpdate(clientVersionString string, latestReleaseBuild build) (bool, error)](#canUpdate)
    * [func canUpdateDate(clientVersionString string) (bool, error)](#canUpdateDate)
    * [func canUpdateVersion(clientVersionString string, latestReleaseBuild build) (bool, error)](#canUpdateVersion)
    * [func check(db dbutil.DB)](#check)
    * [func compareJSON(t *testing.T, actual []byte, expected string)](#compareJSON)
    * [func externalServiceKinds(ctx context.Context) (kinds []string, err error)](#externalServiceKinds)
    * [func getAndMarshalAggregatedCodeIntelUsageJSON(ctx context.Context, db dbutil.DB) (_ json.RawMessage, err error)](#getAndMarshalAggregatedCodeIntelUsageJSON)
    * [func getAndMarshalAggregatedSearchUsageJSON(ctx context.Context, db dbutil.DB) (_ json.RawMessage, err error)](#getAndMarshalAggregatedSearchUsageJSON)
    * [func getAndMarshalBatchChangesUsageJSON(ctx context.Context, db dbutil.DB) (_ json.RawMessage, err error)](#getAndMarshalBatchChangesUsageJSON)
    * [func getAndMarshalCodeInsightsUsageJSON(ctx context.Context, db dbutil.DB) (_ json.RawMessage, err error)](#getAndMarshalCodeInsightsUsageJSON)
    * [func getAndMarshalCodeMonitoringUsageJSON(ctx context.Context, db dbutil.DB) (_ json.RawMessage, err error)](#getAndMarshalCodeMonitoringUsageJSON)
    * [func getAndMarshalExtensionsUsageStatisticsJSON(ctx context.Context, db dbutil.DB) (_ json.RawMessage, err error)](#getAndMarshalExtensionsUsageStatisticsJSON)
    * [func getAndMarshalGrowthStatisticsJSON(ctx context.Context, db dbutil.DB) (_ json.RawMessage, err error)](#getAndMarshalGrowthStatisticsJSON)
    * [func getAndMarshalHomepagePanelsJSON(ctx context.Context, db dbutil.DB) (_ json.RawMessage, err error)](#getAndMarshalHomepagePanelsJSON)
    * [func getAndMarshalRepositoriesJSON(ctx context.Context) (_ json.RawMessage, err error)](#getAndMarshalRepositoriesJSON)
    * [func getAndMarshalRetentionStatisticsJSON(ctx context.Context, db dbutil.DB) (_ json.RawMessage, err error)](#getAndMarshalRetentionStatisticsJSON)
    * [func getAndMarshalSavedSearchesJSON(ctx context.Context, db dbutil.DB) (_ json.RawMessage, err error)](#getAndMarshalSavedSearchesJSON)
    * [func getAndMarshalSearchOnboardingJSON(ctx context.Context, db dbutil.DB) (_ json.RawMessage, err error)](#getAndMarshalSearchOnboardingJSON)
    * [func getAndMarshalSiteActivityJSON(ctx context.Context, db dbutil.DB, criticalOnly bool) (_ json.RawMessage, err error)](#getAndMarshalSiteActivityJSON)
    * [func getDependencyVersions(ctx context.Context, db dbutil.DB, logFunc func(string, ...interface{})) (json.RawMessage, error)](#getDependencyVersions)
    * [func getInitialSiteAdminEmail(ctx context.Context) (_ string, err error)](#getInitialSiteAdminEmail)
    * [func getRedisVersion(dialFunc func() (redis.Conn, error)) (string, error)](#getRedisVersion)
    * [func getTotalReposCount(ctx context.Context) (_ int, err error)](#getTotalReposCount)
    * [func getTotalUsersCount(ctx context.Context) (_ int, err error)](#getTotalUsersCount)
    * [func getUsersActiveTodayCount(ctx context.Context) (_ int, err error)](#getUsersActiveTodayCount)
    * [func hasFindRefsOccurred(ctx context.Context) (_ bool, err error)](#hasFindRefsOccurred)
    * [func hasSearchOccurred(ctx context.Context) (_ bool, err error)](#hasSearchOccurred)
    * [func logPing(r *http.Request, pr *pingRequest, hasUpdate bool)](#logPing)
    * [func marshalPing(pr *pingRequest, hasUpdate bool, clientAddr string, now time.Time) ([]byte, error)](#marshalPing)
    * [func parseRedisInfo(buf []byte) (map[string]string, error)](#parseRedisInfo)
    * [func recordOperation(method string) func(*error)](#recordOperation)
    * [func reserializeCodeIntelUsage(payload, fallbackPayload json.RawMessage) (json.RawMessage, error)](#reserializeCodeIntelUsage)
    * [func reserializeNewCodeIntelUsage(payload json.RawMessage) (json.RawMessage, error)](#reserializeNewCodeIntelUsage)
    * [func reserializeOldCodeIntelUsage(payload json.RawMessage) (json.RawMessage, error)](#reserializeOldCodeIntelUsage)
    * [func reserializeSearchUsage(payload json.RawMessage) (json.RawMessage, error)](#reserializeSearchUsage)
    * [func toBool(val string) bool](#toBool)
    * [func toInt(val string) int32](#toInt)
    * [func toRawMessage(val string) json.RawMessage](#toRawMessage)
    * [func updateBody(ctx context.Context, db dbutil.DB) (io.Reader, error)](#updateBody)


## <a id="const" href="#const">Constants</a>

```
tags: [package private]
```

### <a id="redisInfoCommand" href="#redisInfoCommand">const redisInfoCommand</a>

```
searchKey: updatecheck.redisInfoCommand
tags: [constant string private]
```

```Go
const redisInfoCommand = ...
```

output of running the INFO command in redis-cli 

## <a id="var" href="#var">Variables</a>

```
tags: [package private]
```

### <a id="codeIntelActionNames" href="#codeIntelActionNames">var codeIntelActionNames</a>

```
searchKey: updatecheck.codeIntelActionNames
tags: [variable object private]
```

```Go
var codeIntelActionNames = ...
```

### <a id="codeIntelSourceNames" href="#codeIntelSourceNames">var codeIntelSourceNames</a>

```
searchKey: updatecheck.codeIntelSourceNames
tags: [variable object private]
```

```Go
var codeIntelSourceNames = ...
```

### <a id="dateRegex" href="#dateRegex">var dateRegex</a>

```
searchKey: updatecheck.dateRegex
tags: [variable struct private]
```

```Go
var dateRegex = lazyregexp.New("_([0-9]{4}-[0-9]{2}-[0-9]{2})_")
```

### <a id="errorCounter" href="#errorCounter">var errorCounter</a>

```
searchKey: updatecheck.errorCounter
tags: [variable interface private]
```

```Go
var errorCounter = ...
```

### <a id="lastStatus" href="#lastStatus">var lastStatus</a>

```
searchKey: updatecheck.lastStatus
tags: [variable struct private]
```

```Go
var lastStatus *Status
```

### <a id="latestReleaseDockerComposeOrPureDocker" href="#latestReleaseDockerComposeOrPureDocker">var latestReleaseDockerComposeOrPureDocker</a>

```
searchKey: updatecheck.latestReleaseDockerComposeOrPureDocker
tags: [variable struct private]
```

```Go
var latestReleaseDockerComposeOrPureDocker = newBuild("3.29.0")
```

latestReleaseDockerComposeOrPureDocker is only used by sourcegraph.com to tell existing Sourcegraph Docker Compose or Pure Docker deployments what the latest version is. The version here _must_ be available in a tag at [https://github.com/sourcegraph/deploy-sourcegraph-docker](https://github.com/sourcegraph/deploy-sourcegraph-docker) before landing in master. 

### <a id="latestReleaseDockerServerImageBuild" href="#latestReleaseDockerServerImageBuild">var latestReleaseDockerServerImageBuild</a>

```
searchKey: updatecheck.latestReleaseDockerServerImageBuild
tags: [variable struct private]
```

```Go
var latestReleaseDockerServerImageBuild = newBuild("3.29.0")
```

latestReleaseDockerServerImageBuild is only used by sourcegraph.com to tell existing non-cluster, non-docker-compose, and non-pure-docker installations what the latest version is. The version here _must_ be available at [https://hub.docker.com/r/sourcegraph/server/tags/](https://hub.docker.com/r/sourcegraph/server/tags/) before landing in master. 

### <a id="latestReleaseKubernetesBuild" href="#latestReleaseKubernetesBuild">var latestReleaseKubernetesBuild</a>

```
searchKey: updatecheck.latestReleaseKubernetesBuild
tags: [variable struct private]
```

```Go
var latestReleaseKubernetesBuild = newBuild("3.29.0")
```

latestReleaseKubernetesBuild is only used by sourcegraph.com to tell existing Sourcegraph cluster deployments what the latest version is. The version here _must_ be available in a tag at [https://github.com/sourcegraph/deploy-sourcegraph](https://github.com/sourcegraph/deploy-sourcegraph) before landing in master. 

### <a id="metricsRecorder" href="#metricsRecorder">var metricsRecorder</a>

```
searchKey: updatecheck.metricsRecorder
tags: [variable struct private]
```

```Go
var metricsRecorder = ...
```

metricsRecorder records operational metrics for methods. 

### <a id="mu" href="#mu">var mu</a>

```
searchKey: updatecheck.mu
tags: [variable struct private]
```

```Go
var mu sync.Mutex
```

### <a id="pubSubPingsTopicID" href="#pubSubPingsTopicID">var pubSubPingsTopicID</a>

```
searchKey: updatecheck.pubSubPingsTopicID
tags: [variable string private]
```

```Go
var pubSubPingsTopicID = ...
```

pubSubPingsTopicID is the topic ID of the topic that forwards messages to Pings' pub/sub subscribers. 

### <a id="requestCounter" href="#requestCounter">var requestCounter</a>

```
searchKey: updatecheck.requestCounter
tags: [variable interface private]
```

```Go
var requestCounter = ...
```

### <a id="requestHasUpdateCounter" href="#requestHasUpdateCounter">var requestHasUpdateCounter</a>

```
searchKey: updatecheck.requestHasUpdateCounter
tags: [variable interface private]
```

```Go
var requestHasUpdateCounter = ...
```

### <a id="started" href="#started">var started</a>

```
searchKey: updatecheck.started
tags: [variable boolean private]
```

```Go
var started bool
```

### <a id="startedAt" href="#startedAt">var startedAt</a>

```
searchKey: updatecheck.startedAt
tags: [variable struct private]
```

```Go
var startedAt *time.Time
```

### <a id="timeNow" href="#timeNow">var timeNow</a>

```
searchKey: updatecheck.timeNow
tags: [variable function private]
```

```Go
var timeNow = time.Now
```

## <a id="type" href="#type">Types</a>

```
tags: [package private]
```

### <a id="Status" href="#Status">type Status struct</a>

```
searchKey: updatecheck.Status
tags: [struct]
```

```Go
type Status struct {
	Date          time.Time // the time that the last check completed
	Err           error     // the error that occurred, if any. When present, indicates the instance is offline / unable to contact Sourcegraph.com
	UpdateVersion string    // the version string of the updated version, if any
}
```

Status of the check for software updates for Sourcegraph. 

#### <a id="Last" href="#Last">func Last() *Status</a>

```
searchKey: updatecheck.Last
tags: [function]
```

```Go
func Last() *Status
```

Last returns the status of the last-completed software update check. 

#### <a id="Status.HasUpdate" href="#Status.HasUpdate">func (s Status) HasUpdate() bool</a>

```
searchKey: updatecheck.Status.HasUpdate
tags: [function]
```

```Go
func (s Status) HasUpdate() bool
```

HasUpdate reports whether the status indicates an update is available. 

### <a id="build" href="#build">type build struct</a>

```
searchKey: updatecheck.build
tags: [struct private]
```

```Go
type build struct {
	Version semver.Version `json:"version"`
}
```

build is the JSON shape of the update check handler's response body. 

#### <a id="getLatestRelease" href="#getLatestRelease">func getLatestRelease(deployType string) build</a>

```
searchKey: updatecheck.getLatestRelease
tags: [method private]
```

```Go
func getLatestRelease(deployType string) build
```

#### <a id="newBuild" href="#newBuild">func newBuild(version string) build</a>

```
searchKey: updatecheck.newBuild
tags: [method private]
```

```Go
func newBuild(version string) build
```

### <a id="dependencyVersions" href="#dependencyVersions">type dependencyVersions struct</a>

```
searchKey: updatecheck.dependencyVersions
tags: [struct private]
```

```Go
type dependencyVersions struct {
	PostgresVersion   string `json:"postgresVersion"`
	RedisCacheVersion string `json:"redisCacheVersion"`
	RedisStoreVersion string `json:"redisStoreVersion"`
}
```

### <a id="jsonCodeIntelUsage" href="#jsonCodeIntelUsage">type jsonCodeIntelUsage struct</a>

```
searchKey: updatecheck.jsonCodeIntelUsage
tags: [struct private]
```

```Go
type jsonCodeIntelUsage struct {
	StartOfWeek                         time.Time          `json:"start_time"`
	WAUs                                *int32             `json:"waus"`
	PreciseWAUs                         *int32             `json:"precise_waus"`
	SearchBasedWAUs                     *int32             `json:"search_waus"`
	CrossRepositoryWAUs                 *int32             `json:"xrepo_waus"`
	PreciseCrossRepositoryWAUs          *int32             `json:"precise_xrepo_waus"`
	SearchBasedCrossRepositoryWAUs      *int32             `json:"search_xrepo_waus"`
	EventSummaries                      []jsonEventSummary `json:"event_summaries"`
	NumRepositoriesWithUploadRecords    *int32             `json:"num_repositories_with_upload_records"`
	NumRepositoriesWithoutUploadRecords *int32             `json:"num_repositories_without_upload_records"`
}
```

### <a id="jsonEventSummary" href="#jsonEventSummary">type jsonEventSummary struct</a>

```
searchKey: updatecheck.jsonEventSummary
tags: [struct private]
```

```Go
type jsonEventSummary struct {
	Action          string `json:"action"`
	Source          string `json:"source"`
	LanguageID      string `json:"language_id"`
	CrossRepository bool   `json:"cross_repository"`
	WAUs            int32  `json:"waus"`
	TotalActions    int32  `json:"total_actions"`
}
```

#### <a id="translateEventSummary" href="#translateEventSummary">func translateEventSummary(es types.CodeIntelEventSummary) jsonEventSummary</a>

```
searchKey: updatecheck.translateEventSummary
tags: [method private]
```

```Go
func translateEventSummary(es types.CodeIntelEventSummary) jsonEventSummary
```

### <a id="pingPayload" href="#pingPayload">type pingPayload struct</a>

```
searchKey: updatecheck.pingPayload
tags: [struct private]
```

```Go
type pingPayload struct {
	RemoteIP             string          `json:"remote_ip"`
	RemoteSiteVersion    string          `json:"remote_site_version"`
	RemoteSiteID         string          `json:"remote_site_id"`
	LicenseKey           string          `json:"license_key"`
	HasUpdate            string          `json:"has_update"`
	UniqueUsersToday     string          `json:"unique_users_today"`
	SiteActivity         json.RawMessage `json:"site_activity"`
	BatchChangesUsage    json.RawMessage `json:"batch_changes_usage"`
	CodeIntelUsage       json.RawMessage `json:"code_intel_usage"`
	NewCodeIntelUsage    json.RawMessage `json:"new_code_intel_usage"`
	SearchUsage          json.RawMessage `json:"search_usage"`
	GrowthStatistics     json.RawMessage `json:"growth_statistics"`
	SavedSearches        json.RawMessage `json:"saved_searches"`
	HomepagePanels       json.RawMessage `json:"homepage_panels"`
	RetentionStatistics  json.RawMessage `json:"retention_statistics"`
	Repositories         json.RawMessage `json:"repositories"`
	SearchOnboarding     json.RawMessage `json:"search_onboarding"`
	DependencyVersions   json.RawMessage `json:"dependency_versions"`
	ExtensionsUsage      json.RawMessage `json:"extensions_usage"`
	CodeInsightsUsage    json.RawMessage `json:"code_insights_usage"`
	CodeMonitoringUsage  json.RawMessage `json:"code_monitoring_usage"`
	InstallerEmail       string          `json:"installer_email"`
	AuthProviders        string          `json:"auth_providers"`
	ExtServices          string          `json:"ext_services"`
	BuiltinSignupAllowed string          `json:"builtin_signup_allowed"`
	DeployType           string          `json:"deploy_type"`
	TotalUserAccounts    string          `json:"total_user_accounts"`
	HasExternalURL       string          `json:"has_external_url"`
	HasRepos             string          `json:"has_repos"`
	EverSearched         string          `json:"ever_searched"`
	EverFindRefs         string          `json:"ever_find_refs"`
	Timestamp            string          `json:"timestamp"`
}
```

### <a id="pingRequest" href="#pingRequest">type pingRequest struct</a>

```
searchKey: updatecheck.pingRequest
tags: [struct private]
```

```Go
type pingRequest struct {
	ClientSiteID         string `json:"site"`
	LicenseKey           string
	DeployType           string          `json:"deployType"`
	ClientVersionString  string          `json:"version"`
	DependencyVersions   json.RawMessage `json:"dependencyVersions"`
	AuthProviders        []string        `json:"auth"`
	ExternalServices     []string        `json:"extsvcs"`
	BuiltinSignupAllowed bool            `json:"signup"`
	HasExtURL            bool            `json:"hasExtURL"`
	UniqueUsers          int32           `json:"u"`
	Activity             json.RawMessage `json:"act"`
	BatchChangesUsage    json.RawMessage `json:"batchChangesUsage"`
	// AutomationUsage (campaigns) is deprecated, but here so we can receive pings from older instances
	AutomationUsage     json.RawMessage `json:"automationUsage"`
	GrowthStatistics    json.RawMessage `json:"growthStatistics"`
	SavedSearches       json.RawMessage `json:"savedSearches"`
	HomepagePanels      json.RawMessage `json:"homepagePanels"`
	SearchOnboarding    json.RawMessage `json:"searchOnboarding"`
	Repositories        json.RawMessage `json:"repositories"`
	RetentionStatistics json.RawMessage `json:"retentionStatistics"`
	CodeIntelUsage      json.RawMessage `json:"codeIntelUsage"`
	NewCodeIntelUsage   json.RawMessage `json:"newCodeIntelUsage"`
	SearchUsage         json.RawMessage `json:"searchUsage"`
	ExtensionsUsage     json.RawMessage `json:"extensionsUsage"`
	CodeInsightsUsage   json.RawMessage `json:"codeInsightsUsage"`
	CodeMonitoringUsage json.RawMessage `json:"codeMonitoringUsage"`
	InitialAdminEmail   string          `json:"initAdmin"`
	TotalUsers          int32           `json:"totalUsers"`
	HasRepos            bool            `json:"repos"`
	EverSearched        bool            `json:"searched"`
	EverFindRefs        bool            `json:"refs"`
}
```

pingRequest is the payload of the update check request. These values either supplied via query string or by a JSON body (when the request method is POST). We need to maintain backwards compatibility with the GET-only update checks while expanding the payload size for newer instance versions (via HTTP body). 

#### <a id="readPingRequest" href="#readPingRequest">func readPingRequest(r *http.Request) (*pingRequest, error)</a>

```
searchKey: updatecheck.readPingRequest
tags: [method private]
```

```Go
func readPingRequest(r *http.Request) (*pingRequest, error)
```

readPingRequest reads the ping request payload from the request. If the request method is GET, it will read all parameters from the query string. If the request method is POST, it will read the parameters via a JSON encoded HTTP body. 

#### <a id="readPingRequestFromBody" href="#readPingRequestFromBody">func readPingRequestFromBody(body io.ReadCloser) (*pingRequest, error)</a>

```
searchKey: updatecheck.readPingRequestFromBody
tags: [method private]
```

```Go
func readPingRequestFromBody(body io.ReadCloser) (*pingRequest, error)
```

#### <a id="readPingRequestFromQuery" href="#readPingRequestFromQuery">func readPingRequestFromQuery(q url.Values) (*pingRequest, error)</a>

```
searchKey: updatecheck.readPingRequestFromQuery
tags: [method private]
```

```Go
func readPingRequestFromQuery(q url.Values) (*pingRequest, error)
```

## <a id="func" href="#func">Functions</a>

```
tags: [package private]
```

### <a id="Handler" href="#Handler">func Handler(w http.ResponseWriter, r *http.Request)</a>

```
searchKey: updatecheck.Handler
tags: [method]
```

```Go
func Handler(w http.ResponseWriter, r *http.Request)
```

Handler is an HTTP handler that responds with information about software updates for Sourcegraph. 

### <a id="IsPending" href="#IsPending">func IsPending() bool</a>

```
searchKey: updatecheck.IsPending
tags: [function]
```

```Go
func IsPending() bool
```

IsPending returns whether an update check is in progress. 

### <a id="Start" href="#Start">func Start(db dbutil.DB)</a>

```
searchKey: updatecheck.Start
tags: [method]
```

```Go
func Start(db dbutil.DB)
```

Start starts checking for software updates periodically. 

### <a id="TestCanUpdate" href="#TestCanUpdate">func TestCanUpdate(t *testing.T)</a>

```
searchKey: updatecheck.TestCanUpdate
tags: [method private test]
```

```Go
func TestCanUpdate(t *testing.T)
```

### <a id="TestLatestDockerComposeOrPureDockerVersionPushed" href="#TestLatestDockerComposeOrPureDockerVersionPushed">func TestLatestDockerComposeOrPureDockerVersionPushed(t *testing.T)</a>

```
searchKey: updatecheck.TestLatestDockerComposeOrPureDockerVersionPushed
tags: [method private test]
```

```Go
func TestLatestDockerComposeOrPureDockerVersionPushed(t *testing.T)
```

### <a id="TestLatestDockerVersionPushed" href="#TestLatestDockerVersionPushed">func TestLatestDockerVersionPushed(t *testing.T)</a>

```
searchKey: updatecheck.TestLatestDockerVersionPushed
tags: [method private test]
```

```Go
func TestLatestDockerVersionPushed(t *testing.T)
```

### <a id="TestLatestKubernetesVersionPushed" href="#TestLatestKubernetesVersionPushed">func TestLatestKubernetesVersionPushed(t *testing.T)</a>

```
searchKey: updatecheck.TestLatestKubernetesVersionPushed
tags: [method private test]
```

```Go
func TestLatestKubernetesVersionPushed(t *testing.T)
```

### <a id="TestParseRedisInfo" href="#TestParseRedisInfo">func TestParseRedisInfo(t *testing.T)</a>

```
searchKey: updatecheck.TestParseRedisInfo
tags: [method private test]
```

```Go
func TestParseRedisInfo(t *testing.T)
```

### <a id="TestSerializeAutomationUsage" href="#TestSerializeAutomationUsage">func TestSerializeAutomationUsage(t *testing.T)</a>

```
searchKey: updatecheck.TestSerializeAutomationUsage
tags: [method private test]
```

```Go
func TestSerializeAutomationUsage(t *testing.T)
```

### <a id="TestSerializeBasic" href="#TestSerializeBasic">func TestSerializeBasic(t *testing.T)</a>

```
searchKey: updatecheck.TestSerializeBasic
tags: [method private test]
```

```Go
func TestSerializeBasic(t *testing.T)
```

### <a id="TestSerializeCodeIntelUsage" href="#TestSerializeCodeIntelUsage">func TestSerializeCodeIntelUsage(t *testing.T)</a>

```
searchKey: updatecheck.TestSerializeCodeIntelUsage
tags: [method private test]
```

```Go
func TestSerializeCodeIntelUsage(t *testing.T)
```

### <a id="TestSerializeFromQuery" href="#TestSerializeFromQuery">func TestSerializeFromQuery(t *testing.T)</a>

```
searchKey: updatecheck.TestSerializeFromQuery
tags: [method private test]
```

```Go
func TestSerializeFromQuery(t *testing.T)
```

### <a id="TestSerializeOldCodeIntelUsage" href="#TestSerializeOldCodeIntelUsage">func TestSerializeOldCodeIntelUsage(t *testing.T)</a>

```
searchKey: updatecheck.TestSerializeOldCodeIntelUsage
tags: [method private test]
```

```Go
func TestSerializeOldCodeIntelUsage(t *testing.T)
```

### <a id="authProviderTypes" href="#authProviderTypes">func authProviderTypes() []string</a>

```
searchKey: updatecheck.authProviderTypes
tags: [function private]
```

```Go
func authProviderTypes() []string
```

### <a id="canUpdate" href="#canUpdate">func canUpdate(clientVersionString string, latestReleaseBuild build) (bool, error)</a>

```
searchKey: updatecheck.canUpdate
tags: [method private]
```

```Go
func canUpdate(clientVersionString string, latestReleaseBuild build) (bool, error)
```

canUpdate returns true if the latestReleaseBuild is newer than the clientVersionString. 

### <a id="canUpdateDate" href="#canUpdateDate">func canUpdateDate(clientVersionString string) (bool, error)</a>

```
searchKey: updatecheck.canUpdateDate
tags: [method private]
```

```Go
func canUpdateDate(clientVersionString string) (bool, error)
```

canUpdateDate returns true if clientVersionString contains a date more than 40 days in the past. It returns an error if there is no parsable date in clientVersionString 

### <a id="canUpdateVersion" href="#canUpdateVersion">func canUpdateVersion(clientVersionString string, latestReleaseBuild build) (bool, error)</a>

```
searchKey: updatecheck.canUpdateVersion
tags: [method private]
```

```Go
func canUpdateVersion(clientVersionString string, latestReleaseBuild build) (bool, error)
```

canUpdateVersion returns true if the latest released build is newer than the clientVersionString. It returns an error if clientVersionString is not a semver. 

### <a id="check" href="#check">func check(db dbutil.DB)</a>

```
searchKey: updatecheck.check
tags: [method private]
```

```Go
func check(db dbutil.DB)
```

check performs an update check and updates the global state. 

### <a id="compareJSON" href="#compareJSON">func compareJSON(t *testing.T, actual []byte, expected string)</a>

```
searchKey: updatecheck.compareJSON
tags: [method private]
```

```Go
func compareJSON(t *testing.T, actual []byte, expected string)
```

### <a id="externalServiceKinds" href="#externalServiceKinds">func externalServiceKinds(ctx context.Context) (kinds []string, err error)</a>

```
searchKey: updatecheck.externalServiceKinds
tags: [method private]
```

```Go
func externalServiceKinds(ctx context.Context) (kinds []string, err error)
```

### <a id="getAndMarshalAggregatedCodeIntelUsageJSON" href="#getAndMarshalAggregatedCodeIntelUsageJSON">func getAndMarshalAggregatedCodeIntelUsageJSON(ctx context.Context, db dbutil.DB) (_ json.RawMessage, err error)</a>

```
searchKey: updatecheck.getAndMarshalAggregatedCodeIntelUsageJSON
tags: [method private]
```

```Go
func getAndMarshalAggregatedCodeIntelUsageJSON(ctx context.Context, db dbutil.DB) (_ json.RawMessage, err error)
```

### <a id="getAndMarshalAggregatedSearchUsageJSON" href="#getAndMarshalAggregatedSearchUsageJSON">func getAndMarshalAggregatedSearchUsageJSON(ctx context.Context, db dbutil.DB) (_ json.RawMessage, err error)</a>

```
searchKey: updatecheck.getAndMarshalAggregatedSearchUsageJSON
tags: [method private]
```

```Go
func getAndMarshalAggregatedSearchUsageJSON(ctx context.Context, db dbutil.DB) (_ json.RawMessage, err error)
```

### <a id="getAndMarshalBatchChangesUsageJSON" href="#getAndMarshalBatchChangesUsageJSON">func getAndMarshalBatchChangesUsageJSON(ctx context.Context, db dbutil.DB) (_ json.RawMessage, err error)</a>

```
searchKey: updatecheck.getAndMarshalBatchChangesUsageJSON
tags: [method private]
```

```Go
func getAndMarshalBatchChangesUsageJSON(ctx context.Context, db dbutil.DB) (_ json.RawMessage, err error)
```

### <a id="getAndMarshalCodeInsightsUsageJSON" href="#getAndMarshalCodeInsightsUsageJSON">func getAndMarshalCodeInsightsUsageJSON(ctx context.Context, db dbutil.DB) (_ json.RawMessage, err error)</a>

```
searchKey: updatecheck.getAndMarshalCodeInsightsUsageJSON
tags: [method private]
```

```Go
func getAndMarshalCodeInsightsUsageJSON(ctx context.Context, db dbutil.DB) (_ json.RawMessage, err error)
```

### <a id="getAndMarshalCodeMonitoringUsageJSON" href="#getAndMarshalCodeMonitoringUsageJSON">func getAndMarshalCodeMonitoringUsageJSON(ctx context.Context, db dbutil.DB) (_ json.RawMessage, err error)</a>

```
searchKey: updatecheck.getAndMarshalCodeMonitoringUsageJSON
tags: [method private]
```

```Go
func getAndMarshalCodeMonitoringUsageJSON(ctx context.Context, db dbutil.DB) (_ json.RawMessage, err error)
```

### <a id="getAndMarshalExtensionsUsageStatisticsJSON" href="#getAndMarshalExtensionsUsageStatisticsJSON">func getAndMarshalExtensionsUsageStatisticsJSON(ctx context.Context, db dbutil.DB) (_ json.RawMessage, err error)</a>

```
searchKey: updatecheck.getAndMarshalExtensionsUsageStatisticsJSON
tags: [method private]
```

```Go
func getAndMarshalExtensionsUsageStatisticsJSON(ctx context.Context, db dbutil.DB) (_ json.RawMessage, err error)
```

### <a id="getAndMarshalGrowthStatisticsJSON" href="#getAndMarshalGrowthStatisticsJSON">func getAndMarshalGrowthStatisticsJSON(ctx context.Context, db dbutil.DB) (_ json.RawMessage, err error)</a>

```
searchKey: updatecheck.getAndMarshalGrowthStatisticsJSON
tags: [method private]
```

```Go
func getAndMarshalGrowthStatisticsJSON(ctx context.Context, db dbutil.DB) (_ json.RawMessage, err error)
```

### <a id="getAndMarshalHomepagePanelsJSON" href="#getAndMarshalHomepagePanelsJSON">func getAndMarshalHomepagePanelsJSON(ctx context.Context, db dbutil.DB) (_ json.RawMessage, err error)</a>

```
searchKey: updatecheck.getAndMarshalHomepagePanelsJSON
tags: [method private]
```

```Go
func getAndMarshalHomepagePanelsJSON(ctx context.Context, db dbutil.DB) (_ json.RawMessage, err error)
```

### <a id="getAndMarshalRepositoriesJSON" href="#getAndMarshalRepositoriesJSON">func getAndMarshalRepositoriesJSON(ctx context.Context) (_ json.RawMessage, err error)</a>

```
searchKey: updatecheck.getAndMarshalRepositoriesJSON
tags: [method private]
```

```Go
func getAndMarshalRepositoriesJSON(ctx context.Context) (_ json.RawMessage, err error)
```

### <a id="getAndMarshalRetentionStatisticsJSON" href="#getAndMarshalRetentionStatisticsJSON">func getAndMarshalRetentionStatisticsJSON(ctx context.Context, db dbutil.DB) (_ json.RawMessage, err error)</a>

```
searchKey: updatecheck.getAndMarshalRetentionStatisticsJSON
tags: [method private]
```

```Go
func getAndMarshalRetentionStatisticsJSON(ctx context.Context, db dbutil.DB) (_ json.RawMessage, err error)
```

### <a id="getAndMarshalSavedSearchesJSON" href="#getAndMarshalSavedSearchesJSON">func getAndMarshalSavedSearchesJSON(ctx context.Context, db dbutil.DB) (_ json.RawMessage, err error)</a>

```
searchKey: updatecheck.getAndMarshalSavedSearchesJSON
tags: [method private]
```

```Go
func getAndMarshalSavedSearchesJSON(ctx context.Context, db dbutil.DB) (_ json.RawMessage, err error)
```

### <a id="getAndMarshalSearchOnboardingJSON" href="#getAndMarshalSearchOnboardingJSON">func getAndMarshalSearchOnboardingJSON(ctx context.Context, db dbutil.DB) (_ json.RawMessage, err error)</a>

```
searchKey: updatecheck.getAndMarshalSearchOnboardingJSON
tags: [method private]
```

```Go
func getAndMarshalSearchOnboardingJSON(ctx context.Context, db dbutil.DB) (_ json.RawMessage, err error)
```

### <a id="getAndMarshalSiteActivityJSON" href="#getAndMarshalSiteActivityJSON">func getAndMarshalSiteActivityJSON(ctx context.Context, db dbutil.DB, criticalOnly bool) (_ json.RawMessage, err error)</a>

```
searchKey: updatecheck.getAndMarshalSiteActivityJSON
tags: [method private]
```

```Go
func getAndMarshalSiteActivityJSON(ctx context.Context, db dbutil.DB, criticalOnly bool) (_ json.RawMessage, err error)
```

### <a id="getDependencyVersions" href="#getDependencyVersions">func getDependencyVersions(ctx context.Context, db dbutil.DB, logFunc func(string, ...interface{})) (json.RawMessage, error)</a>

```
searchKey: updatecheck.getDependencyVersions
tags: [method private]
```

```Go
func getDependencyVersions(ctx context.Context, db dbutil.DB, logFunc func(string, ...interface{})) (json.RawMessage, error)
```

### <a id="getInitialSiteAdminEmail" href="#getInitialSiteAdminEmail">func getInitialSiteAdminEmail(ctx context.Context) (_ string, err error)</a>

```
searchKey: updatecheck.getInitialSiteAdminEmail
tags: [method private]
```

```Go
func getInitialSiteAdminEmail(ctx context.Context) (_ string, err error)
```

### <a id="getRedisVersion" href="#getRedisVersion">func getRedisVersion(dialFunc func() (redis.Conn, error)) (string, error)</a>

```
searchKey: updatecheck.getRedisVersion
tags: [method private]
```

```Go
func getRedisVersion(dialFunc func() (redis.Conn, error)) (string, error)
```

### <a id="getTotalReposCount" href="#getTotalReposCount">func getTotalReposCount(ctx context.Context) (_ int, err error)</a>

```
searchKey: updatecheck.getTotalReposCount
tags: [method private]
```

```Go
func getTotalReposCount(ctx context.Context) (_ int, err error)
```

### <a id="getTotalUsersCount" href="#getTotalUsersCount">func getTotalUsersCount(ctx context.Context) (_ int, err error)</a>

```
searchKey: updatecheck.getTotalUsersCount
tags: [method private]
```

```Go
func getTotalUsersCount(ctx context.Context) (_ int, err error)
```

### <a id="getUsersActiveTodayCount" href="#getUsersActiveTodayCount">func getUsersActiveTodayCount(ctx context.Context) (_ int, err error)</a>

```
searchKey: updatecheck.getUsersActiveTodayCount
tags: [method private]
```

```Go
func getUsersActiveTodayCount(ctx context.Context) (_ int, err error)
```

### <a id="hasFindRefsOccurred" href="#hasFindRefsOccurred">func hasFindRefsOccurred(ctx context.Context) (_ bool, err error)</a>

```
searchKey: updatecheck.hasFindRefsOccurred
tags: [method private]
```

```Go
func hasFindRefsOccurred(ctx context.Context) (_ bool, err error)
```

### <a id="hasSearchOccurred" href="#hasSearchOccurred">func hasSearchOccurred(ctx context.Context) (_ bool, err error)</a>

```
searchKey: updatecheck.hasSearchOccurred
tags: [method private]
```

```Go
func hasSearchOccurred(ctx context.Context) (_ bool, err error)
```

### <a id="logPing" href="#logPing">func logPing(r *http.Request, pr *pingRequest, hasUpdate bool)</a>

```
searchKey: updatecheck.logPing
tags: [method private]
```

```Go
func logPing(r *http.Request, pr *pingRequest, hasUpdate bool)
```

### <a id="marshalPing" href="#marshalPing">func marshalPing(pr *pingRequest, hasUpdate bool, clientAddr string, now time.Time) ([]byte, error)</a>

```
searchKey: updatecheck.marshalPing
tags: [method private]
```

```Go
func marshalPing(pr *pingRequest, hasUpdate bool, clientAddr string, now time.Time) ([]byte, error)
```

### <a id="parseRedisInfo" href="#parseRedisInfo">func parseRedisInfo(buf []byte) (map[string]string, error)</a>

```
searchKey: updatecheck.parseRedisInfo
tags: [method private]
```

```Go
func parseRedisInfo(buf []byte) (map[string]string, error)
```

### <a id="recordOperation" href="#recordOperation">func recordOperation(method string) func(*error)</a>

```
searchKey: updatecheck.recordOperation
tags: [method private]
```

```Go
func recordOperation(method string) func(*error)
```

recordOperation returns a record fn that is called on any given return err. If an error is encountered it will register the err metric. The err is never altered. 

### <a id="reserializeCodeIntelUsage" href="#reserializeCodeIntelUsage">func reserializeCodeIntelUsage(payload, fallbackPayload json.RawMessage) (json.RawMessage, error)</a>

```
searchKey: updatecheck.reserializeCodeIntelUsage
tags: [method private]
```

```Go
func reserializeCodeIntelUsage(payload, fallbackPayload json.RawMessage) (json.RawMessage, error)
```

reserializeCodeIntelUsage returns the given data in the shape of the current code intel usage statistics format. The given payload should be populated with either the new-style 

### <a id="reserializeNewCodeIntelUsage" href="#reserializeNewCodeIntelUsage">func reserializeNewCodeIntelUsage(payload json.RawMessage) (json.RawMessage, error)</a>

```
searchKey: updatecheck.reserializeNewCodeIntelUsage
tags: [method private]
```

```Go
func reserializeNewCodeIntelUsage(payload json.RawMessage) (json.RawMessage, error)
```

### <a id="reserializeOldCodeIntelUsage" href="#reserializeOldCodeIntelUsage">func reserializeOldCodeIntelUsage(payload json.RawMessage) (json.RawMessage, error)</a>

```
searchKey: updatecheck.reserializeOldCodeIntelUsage
tags: [method private]
```

```Go
func reserializeOldCodeIntelUsage(payload json.RawMessage) (json.RawMessage, error)
```

### <a id="reserializeSearchUsage" href="#reserializeSearchUsage">func reserializeSearchUsage(payload json.RawMessage) (json.RawMessage, error)</a>

```
searchKey: updatecheck.reserializeSearchUsage
tags: [method private]
```

```Go
func reserializeSearchUsage(payload json.RawMessage) (json.RawMessage, error)
```

reserializeSearchUsage will reserialize a code intel usage statistics struct with only the first period in each period type. This reduces the complexity required in the BigQuery schema and downstream ETL transform logic. 

### <a id="toBool" href="#toBool">func toBool(val string) bool</a>

```
searchKey: updatecheck.toBool
tags: [method private]
```

```Go
func toBool(val string) bool
```

### <a id="toInt" href="#toInt">func toInt(val string) int32</a>

```
searchKey: updatecheck.toInt
tags: [method private]
```

```Go
func toInt(val string) int32
```

### <a id="toRawMessage" href="#toRawMessage">func toRawMessage(val string) json.RawMessage</a>

```
searchKey: updatecheck.toRawMessage
tags: [method private]
```

```Go
func toRawMessage(val string) json.RawMessage
```

### <a id="updateBody" href="#updateBody">func updateBody(ctx context.Context, db dbutil.DB) (io.Reader, error)</a>

```
searchKey: updatecheck.updateBody
tags: [method private]
```

```Go
func updateBody(ctx context.Context, db dbutil.DB) (io.Reader, error)
```

