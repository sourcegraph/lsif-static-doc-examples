# Package conf

Package conf provides functions for accessing the Site Configuration. 

## Index

* Subpages
  * [internal/conf/confdefaults](conf/confdefaults.md)
  * [internal/conf/conftypes](conf/conftypes.md)
  * [internal/conf/reposource](conf/reposource.md)
* [Constants](#const)
    * [const AccessTokensAdmin](#AccessTokensAdmin)
    * [const AccessTokensAll](#AccessTokensAll)
    * [const AccessTokensNone](#AccessTokensNone)
    * [const DeployDev](#DeployDev)
    * [const DeployDockerCompose](#DeployDockerCompose)
    * [const DeployKubernetes](#DeployKubernetes)
    * [const DeployPureDocker](#DeployPureDocker)
    * [const DeploySingleDocker](#DeploySingleDocker)
    * [const ExternalServiceModeAll](#ExternalServiceModeAll)
    * [const ExternalServiceModeDisabled](#ExternalServiceModeDisabled)
    * [const ExternalServiceModePublic](#ExternalServiceModePublic)
    * [const defaultPasswordLinkExpiry](#defaultPasswordLinkExpiry)
    * [const modeClient](#modeClient)
    * [const modeEmpty](#modeEmpty)
    * [const modeServer](#modeServer)
    * [const problemExternalService](#problemExternalService)
    * [const problemSite](#problemSite)
* [Variables](#var)
    * [var DefaultRemoteRegistry](#DefaultRemoteRegistry)
    * [var FormatOptions](#FormatOptions)
    * [var configurationServerFrontendOnlyInitialized](#configurationServerFrontendOnlyInitialized)
    * [var contributedValidators](#contributedValidators)
    * [var contributedWarnings](#contributedWarnings)
    * [var defaultClientOnce](#defaultClientOnce)
    * [var defaultClientVal](#defaultClientVal)
    * [var ignoreLegacyKubernetesFields](#ignoreLegacyKubernetesFields)
    * [var requireRestart](#requireRestart)
    * [var siteConfigEscapeHatchPath](#siteConfigEscapeHatchPath)
* [Types](#type)
    * [type AccessTokAllow string](#AccessTokAllow)
        * [func AccessTokensAllow() AccessTokAllow](#AccessTokensAllow)
    * [type ConfigurationSource interface](#ConfigurationSource)
    * [type Edits struct](#Edits)
    * [type ExternalServiceMode int](#ExternalServiceMode)
        * [func ExternalServiceUserMode() ExternalServiceMode](#ExternalServiceUserMode)
        * [func (e ExternalServiceMode) String() string](#ExternalServiceMode.String)
    * [type PlatformConfiguration struct](#PlatformConfiguration)
        * [func Extensions() *PlatformConfiguration](#Extensions)
    * [type Problem struct](#Problem)
        * [func NewExternalServiceProblem(msg string) *Problem](#NewExternalServiceProblem)
        * [func NewSiteProblem(msg string) *Problem](#NewSiteProblem)
        * [func (p Problem) IsExternalService() bool](#Problem.IsExternalService)
        * [func (p Problem) IsSite() bool](#Problem.IsSite)
        * [func (p *Problem) MarshalJSON() ([]byte, error)](#Problem.MarshalJSON)
        * [func (p Problem) String() string](#Problem.String)
        * [func (p *Problem) UnmarshalJSON(b []byte) error](#Problem.UnmarshalJSON)
    * [type Problems []*conf.Problem](#Problems)
        * [func GetWarnings() (problems Problems, err error)](#GetWarnings)
        * [func NewExternalServiceProblems(messages ...string) Problems](#NewExternalServiceProblems)
        * [func NewSiteProblems(messages ...string) Problems](#NewSiteProblems)
        * [func Validate(input conftypes.RawUnified) (problems Problems, err error)](#Validate)
        * [func newProblems(kind problemKind, messages ...string) Problems](#newProblems)
        * [func validateCustom(cfg Unified) (problems Problems)](#validateCustom)
        * [func validateCustomRaw(normalizedInput conftypes.RawUnified) (problems Problems, err error)](#validateCustomRaw)
        * [func (ps Problems) ExternalService() (problems Problems)](#Problems.ExternalService)
        * [func (ps Problems) Messages() []string](#Problems.Messages)
        * [func (ps Problems) Site() (problems Problems)](#Problems.Site)
    * [type Server struct](#Server)
        * [func InitConfigurationServerFrontendOnly(source ConfigurationSource) *Server](#InitConfigurationServerFrontendOnly)
        * [func NewServer(source ConfigurationSource) *Server](#NewServer)
        * [func (s *Server) Edit(ctx context.Context, computeEdits func(current *Unified, raw conftypes.RawUnified) (Edits, error)) error](#Server.Edit)
        * [func (s *Server) NeedServerRestart() bool](#Server.NeedServerRestart)
        * [func (s *Server) Raw() conftypes.RawUnified](#Server.Raw)
        * [func (s *Server) Start()](#Server.Start)
        * [func (s *Server) Write(ctx context.Context, input conftypes.RawUnified) error](#Server.Write)
        * [func (s *Server) markNeedServerRestart()](#Server.markNeedServerRestart)
        * [func (s *Server) updateFromSource(ctx context.Context) error](#Server.updateFromSource)
        * [func (s *Server) watchSource()](#Server.watchSource)
    * [type Unified struct](#Unified)
        * [func Get() *Unified](#Get)
        * [func ParseConfig(data conftypes.RawUnified) (*Unified, error)](#ParseConfig)
    * [type Validator func(github.com/sourcegraph/sourcegraph/internal/conf.Unified) github.com/sourcegraph/sourcegraph/internal/conf.Problems](#Validator)
    * [type cachedConfigurationSource struct](#cachedConfigurationSource)
        * [func (c *cachedConfigurationSource) Read(ctx context.Context) (conftypes.RawUnified, error)](#cachedConfigurationSource.Read)
        * [func (c *cachedConfigurationSource) Write(ctx context.Context, input conftypes.RawUnified) error](#cachedConfigurationSource.Write)
    * [type client struct](#client)
        * [func defaultClient() *client](#defaultClient)
        * [func initDefaultClient() *client](#initDefaultClient)
        * [func (c *client) Cached(f func() interface{}) (wrapped func() interface{})](#client.Cached)
        * [func (c *client) Get() *Unified](#client.Get)
        * [func (c *client) Mock(mockery *Unified)](#client.Mock)
        * [func (c *client) Raw() conftypes.RawUnified](#client.Raw)
        * [func (c *client) Watch(f func())](#client.Watch)
        * [func (c *client) continuouslyUpdate(optOnlySetByTests *continuousUpdateOptions)](#client.continuouslyUpdate)
        * [func (c *client) fetchAndUpdate() error](#client.fetchAndUpdate)
        * [func (c *client) notifyWatchers()](#client.notifyWatchers)
    * [type configurationMode int](#configurationMode)
        * [func getMode() configurationMode](#getMode)
    * [type continuousUpdateOptions struct](#continuousUpdateOptions)
    * [type jsonLoader struct](#jsonLoader)
        * [func (l jsonLoader) LoaderFactory() gojsonschema.JSONLoaderFactory](#jsonLoader.LoaderFactory)
    * [type jsonLoaderFactory struct{}](#jsonLoaderFactory)
        * [func (f jsonLoaderFactory) New(source string) gojsonschema.JSONLoader](#jsonLoaderFactory.New)
    * [type problemKind string](#problemKind)
    * [type store struct](#store)
        * [func newStore() *store](#newStore)
        * [func (s *store) LastValid() *Unified](#store.LastValid)
        * [func (s *store) MaybeUpdate(rawConfig conftypes.RawUnified) (updateResult, error)](#store.MaybeUpdate)
        * [func (s *store) Mock(mockery *Unified)](#store.Mock)
        * [func (s *store) Raw() conftypes.RawUnified](#store.Raw)
        * [func (s *store) WaitUntilInitialized()](#store.WaitUntilInitialized)
        * [func (s *store) checkDeadlock()](#store.checkDeadlock)
        * [func (s *store) initialize()](#store.initialize)
    * [type updateResult struct](#updateResult)
* [Functions](#func)
    * [func AWSCodeCommitConfigs(ctx context.Context) ([]*schema.AWSCodeCommitConnection, error)](#AWSCodeCommitConfigs)
    * [func AndOrQueryEnabled() bool](#AndOrQueryEnabled)
    * [func AuthAllowSignup() bool](#AuthAllowSignup)
    * [func AuthMinPasswordLength() int](#AuthMinPasswordLength)
    * [func AuthPasswordResetLinkExpiry() int](#AuthPasswordResetLinkExpiry)
    * [func AuthProviderType(p schema.AuthProviders) string](#AuthProviderType)
    * [func AuthPublic() bool](#AuthPublic)
    * [func BatchChangesEnabled() bool](#BatchChangesEnabled)
    * [func BatchChangesRestrictedToAdmins() bool](#BatchChangesRestrictedToAdmins)
    * [func BitbucketServerConfigs(ctx context.Context) ([]*schema.BitbucketServerConnection, error)](#BitbucketServerConfigs)
    * [func BitbucketServerPluginPerm() bool](#BitbucketServerPluginPerm)
    * [func Cached(f func() interface{}) (wrapped func() interface{})](#Cached)
    * [func CanSendEmail() bool](#CanSendEmail)
    * [func CodeIntelAutoIndexingEnabled() bool](#CodeIntelAutoIndexingEnabled)
    * [func ContributeValidator(f Validator)](#ContributeValidator)
    * [func ContributeWarning(f Validator)](#ContributeWarning)
    * [func DeployType() string](#DeployType)
    * [func EmailVerificationRequired() bool](#EmailVerificationRequired)
    * [func EventLoggingEnabled() bool](#EventLoggingEnabled)
    * [func ExperimentalFeatures() schema.ExperimentalFeatures](#ExperimentalFeatures)
    * [func ExternalURL() string](#ExternalURL)
    * [func GitHubConfigs(ctx context.Context) ([]*schema.GitHubConnection, error)](#GitHubConfigs)
    * [func GitLabConfigs(ctx context.Context) ([]*schema.GitLabConnection, error)](#GitLabConfigs)
    * [func GitMaxCodehostRequestsPerSecond() int](#GitMaxCodehostRequestsPerSecond)
    * [func GitoliteConfigs(ctx context.Context) ([]*schema.GitoliteConnection, error)](#GitoliteConfigs)
    * [func HasExternalAuthProvider(c Unified) bool](#HasExternalAuthProvider)
    * [func IsBuiltinSignupAllowed() bool](#IsBuiltinSignupAllowed)
    * [func IsDeployTypeDockerCompose(deployType string) bool](#IsDeployTypeDockerCompose)
    * [func IsDeployTypeKubernetes(deployType string) bool](#IsDeployTypeKubernetes)
    * [func IsDeployTypePureDocker(deployType string) bool](#IsDeployTypePureDocker)
    * [func IsDeployTypeSingleDockerContainer(deployType string) bool](#IsDeployTypeSingleDockerContainer)
    * [func IsDev(deployType string) bool](#IsDev)
    * [func IsExternalURLSecure() bool](#IsExternalURLSecure)
    * [func IsValidDeployType(deployType string) bool](#IsValidDeployType)
    * [func Mock(mockery *Unified)](#Mock)
    * [func MustValidateDefaults()](#MustValidateDefaults)
    * [func NeedRestartToApply(before, after *Unified) bool](#NeedRestartToApply)
    * [func PhabricatorConfigs(ctx context.Context) ([]*schema.PhabricatorConnection, error)](#PhabricatorConfigs)
    * [func ProductResearchPageEnabled() bool](#ProductResearchPageEnabled)
    * [func Raw() conftypes.RawUnified](#Raw)
    * [func SearchIndexEnabled() bool](#SearchIndexEnabled)
    * [func SearchSymbolsParallelism() int](#SearchSymbolsParallelism)
    * [func StructuralSearchEnabled() bool](#StructuralSearchEnabled)
    * [func TestAuthPasswordResetLinkDuration(t *testing.T)](#TestAuthPasswordResetLinkDuration)
    * [func TestAuthPublic(t *testing.T)](#TestAuthPublic)
    * [func TestClient_continuouslyUpdate(t *testing.T)](#TestClient_continuouslyUpdate)
    * [func TestDiff(t *testing.T)](#TestDiff)
    * [func TestExtensions(t *testing.T)](#TestExtensions)
    * [func TestGitMaxCodehostRequestsPerSecond(t *testing.T)](#TestGitMaxCodehostRequestsPerSecond)
    * [func TestProblems(t *testing.T)](#TestProblems)
    * [func TestSearchIndexEnabled(t *testing.T)](#TestSearchIndexEnabled)
    * [func TestValidate(t *testing.T)](#TestValidate)
    * [func TestValidateCustom(t *testing.T)](#TestValidateCustom)
    * [func TestValidator(t interface {...](#TestValidator)
    * [func UpdateChannel() string](#UpdateChannel)
    * [func UserReposMaxPerSite() int](#UserReposMaxPerSite)
    * [func UserReposMaxPerUser() int](#UserReposMaxPerUser)
    * [func UsingExternalURL() bool](#UsingExternalURL)
    * [func ValidateSetting(input string) (problems []string, err error)](#ValidateSetting)
    * [func ValidateSite(input string) (messages []string, err error)](#ValidateSite)
    * [func Watch(f func())](#Watch)
    * [func authAllowSignup(c *Unified) bool](#authAllowSignup)
    * [func boolPtr(b bool) *bool](#boolPtr)
    * [func defaultConfigForDeployment() conftypes.RawUnified](#defaultConfigForDeployment)
    * [func diff(before, after *Unified) (fields map[string]struct{})](#diff)
    * [func diffStruct(before, after interface{}, prefix string) (fields map[string]struct{})](#diffStruct)
    * [func doValidate(inputStr, schema string) (messages []string, err error)](#doValidate)
    * [func getJSONFields(vv interface{}, prefix string) (fields map[string]interface{})](#getJSONFields)
    * [func init()](#init.computed.go)
    * [func intPtr(i int) *int](#intPtr)
    * [func mustValidate(name string, cfg conftypes.RawUnified) conftypes.RawUnified](#mustValidate)
    * [func parseConfigData(data string, cfg interface{}) error](#parseConfigData)
    * [func parseJSONTag(tag string) string](#parseJSONTag)
    * [func setenv(t *testing.T, keyval string) func()](#setenv)
    * [func startSiteConfigEscapeHatchWorker(c ConfigurationSource)](#startSiteConfigEscapeHatchWorker)
    * [func toSlice(m map[string]struct{}) []string](#toSlice)
    * [func validate(schema, input []byte) (*gojsonschema.Result, error)](#validate)


## <a id="const" href="#const">Constants</a>

```
tags: [package private]
```

### <a id="AccessTokensAdmin" href="#AccessTokensAdmin">const AccessTokensAdmin</a>

```
searchKey: conf.AccessTokensAdmin
tags: [constant string]
```

```Go
const AccessTokensAdmin AccessTokAllow = "site-admin-create"
```

### <a id="AccessTokensAll" href="#AccessTokensAll">const AccessTokensAll</a>

```
searchKey: conf.AccessTokensAll
tags: [constant string]
```

```Go
const AccessTokensAll AccessTokAllow = "all-users-create"
```

### <a id="AccessTokensNone" href="#AccessTokensNone">const AccessTokensNone</a>

```
searchKey: conf.AccessTokensNone
tags: [constant string]
```

```Go
const AccessTokensNone AccessTokAllow = "none"
```

### <a id="DeployDev" href="#DeployDev">const DeployDev</a>

```
searchKey: conf.DeployDev
tags: [constant string]
```

```Go
const DeployDev = "dev"
```

Deploy type constants. Any changes here should be reflected in the DeployType type declared in web/src/globals.d.ts: [https://sourcegraph.com/search?q=r:github.com/sourcegraph/sourcegraph%24+%22type+DeployType%22](https://sourcegraph.com/search?q=r:github.com/sourcegraph/sourcegraph%24+%22type+DeployType%22) 

### <a id="DeployDockerCompose" href="#DeployDockerCompose">const DeployDockerCompose</a>

```
searchKey: conf.DeployDockerCompose
tags: [constant string]
```

```Go
const DeployDockerCompose = "docker-compose"
```

Deploy type constants. Any changes here should be reflected in the DeployType type declared in web/src/globals.d.ts: [https://sourcegraph.com/search?q=r:github.com/sourcegraph/sourcegraph%24+%22type+DeployType%22](https://sourcegraph.com/search?q=r:github.com/sourcegraph/sourcegraph%24+%22type+DeployType%22) 

### <a id="DeployKubernetes" href="#DeployKubernetes">const DeployKubernetes</a>

```
searchKey: conf.DeployKubernetes
tags: [constant string]
```

```Go
const DeployKubernetes = "kubernetes"
```

Deploy type constants. Any changes here should be reflected in the DeployType type declared in web/src/globals.d.ts: [https://sourcegraph.com/search?q=r:github.com/sourcegraph/sourcegraph%24+%22type+DeployType%22](https://sourcegraph.com/search?q=r:github.com/sourcegraph/sourcegraph%24+%22type+DeployType%22) 

### <a id="DeployPureDocker" href="#DeployPureDocker">const DeployPureDocker</a>

```
searchKey: conf.DeployPureDocker
tags: [constant string]
```

```Go
const DeployPureDocker = "pure-docker"
```

Deploy type constants. Any changes here should be reflected in the DeployType type declared in web/src/globals.d.ts: [https://sourcegraph.com/search?q=r:github.com/sourcegraph/sourcegraph%24+%22type+DeployType%22](https://sourcegraph.com/search?q=r:github.com/sourcegraph/sourcegraph%24+%22type+DeployType%22) 

### <a id="DeploySingleDocker" href="#DeploySingleDocker">const DeploySingleDocker</a>

```
searchKey: conf.DeploySingleDocker
tags: [constant string]
```

```Go
const DeploySingleDocker = "docker-container"
```

Deploy type constants. Any changes here should be reflected in the DeployType type declared in web/src/globals.d.ts: [https://sourcegraph.com/search?q=r:github.com/sourcegraph/sourcegraph%24+%22type+DeployType%22](https://sourcegraph.com/search?q=r:github.com/sourcegraph/sourcegraph%24+%22type+DeployType%22) 

### <a id="ExternalServiceModeAll" href="#ExternalServiceModeAll">const ExternalServiceModeAll</a>

```
searchKey: conf.ExternalServiceModeAll
tags: [constant number]
```

```Go
const ExternalServiceModeAll ExternalServiceMode = 2
```

### <a id="ExternalServiceModeDisabled" href="#ExternalServiceModeDisabled">const ExternalServiceModeDisabled</a>

```
searchKey: conf.ExternalServiceModeDisabled
tags: [constant number]
```

```Go
const ExternalServiceModeDisabled ExternalServiceMode = 0
```

### <a id="ExternalServiceModePublic" href="#ExternalServiceModePublic">const ExternalServiceModePublic</a>

```
searchKey: conf.ExternalServiceModePublic
tags: [constant number]
```

```Go
const ExternalServiceModePublic ExternalServiceMode = 1
```

### <a id="defaultPasswordLinkExpiry" href="#defaultPasswordLinkExpiry">const defaultPasswordLinkExpiry</a>

```
searchKey: conf.defaultPasswordLinkExpiry
tags: [constant number private]
```

```Go
const defaultPasswordLinkExpiry = 14400
```

By default, password reset links are valid for 4 hours. 

### <a id="modeClient" href="#modeClient">const modeClient</a>

```
searchKey: conf.modeClient
tags: [constant number private]
```

```Go
const modeClient
```

The user of pkg/conf only reads the configuration file. 

### <a id="modeEmpty" href="#modeEmpty">const modeEmpty</a>

```
searchKey: conf.modeEmpty
tags: [constant number private]
```

```Go
const modeEmpty
```

The user of pkg/conf is a test case or explicitly opted to have no configuration. 

### <a id="modeServer" href="#modeServer">const modeServer</a>

```
searchKey: conf.modeServer
tags: [constant number private]
```

```Go
const modeServer configurationMode = iota
```

The user of pkg/conf reads and writes to the configuration file. This should only ever be used by frontend. 

### <a id="problemExternalService" href="#problemExternalService">const problemExternalService</a>

```
searchKey: conf.problemExternalService
tags: [constant string private]
```

```Go
const problemExternalService problemKind = "ExternalService"
```

### <a id="problemSite" href="#problemSite">const problemSite</a>

```
searchKey: conf.problemSite
tags: [constant string private]
```

```Go
const problemSite problemKind = "SiteConfig"
```

## <a id="var" href="#var">Variables</a>

```
tags: [package private]
```

### <a id="DefaultRemoteRegistry" href="#DefaultRemoteRegistry">var DefaultRemoteRegistry</a>

```
searchKey: conf.DefaultRemoteRegistry
tags: [variable string]
```

```Go
var DefaultRemoteRegistry string
```

DefaultRemoteRegistry is the default value for the site configuration property "extensions"."remoteRegistry". 

It is intentionally not set in the OSS build. 

### <a id="FormatOptions" href="#FormatOptions">var FormatOptions</a>

```
searchKey: conf.FormatOptions
tags: [variable struct]
```

```Go
var FormatOptions = jsonx.FormatOptions{InsertSpaces: true, TabSize: 2, EOL: "\n"}
```

FormatOptions is the default format options that should be used for jsonx edit computation. 

### <a id="configurationServerFrontendOnlyInitialized" href="#configurationServerFrontendOnlyInitialized">var configurationServerFrontendOnlyInitialized</a>

```
searchKey: conf.configurationServerFrontendOnlyInitialized
tags: [variable private]
```

```Go
var configurationServerFrontendOnlyInitialized = make(chan struct{})
```

### <a id="contributedValidators" href="#contributedValidators">var contributedValidators</a>

```
searchKey: conf.contributedValidators
tags: [variable array function private]
```

```Go
var contributedValidators []Validator
```

### <a id="contributedWarnings" href="#contributedWarnings">var contributedWarnings</a>

```
searchKey: conf.contributedWarnings
tags: [variable array function private]
```

```Go
var contributedWarnings []Validator
```

### <a id="defaultClientOnce" href="#defaultClientOnce">var defaultClientOnce</a>

```
searchKey: conf.defaultClientOnce
tags: [variable struct private]
```

```Go
var defaultClientOnce sync.Once
```

### <a id="defaultClientVal" href="#defaultClientVal">var defaultClientVal</a>

```
searchKey: conf.defaultClientVal
tags: [variable struct private]
```

```Go
var defaultClientVal *client
```

### <a id="ignoreLegacyKubernetesFields" href="#ignoreLegacyKubernetesFields">var ignoreLegacyKubernetesFields</a>

```
searchKey: conf.ignoreLegacyKubernetesFields
tags: [variable object private]
```

```Go
var ignoreLegacyKubernetesFields = ...
```

ignoreLegacyKubernetesFields is the set of field names for which validation errors should be ignored. The validation errors occur only because deploy-sourcegraph config merged site config and Kubernetes cluster-specific config. This is deprecated. Until we have transitioned fully, we suppress validation errors on these fields. 

### <a id="requireRestart" href="#requireRestart">var requireRestart</a>

```
searchKey: conf.requireRestart
tags: [variable array string private]
```

```Go
var requireRestart = ...
```

requireRestart describes the list of config properties that require restarting the Sourcegraph Server in order for the change to take effect. 

Experimental features are special in that they are denoted individually via e.g. "experimentalFeatures::myFeatureFlag". 

### <a id="siteConfigEscapeHatchPath" href="#siteConfigEscapeHatchPath">var siteConfigEscapeHatchPath</a>

```
searchKey: conf.siteConfigEscapeHatchPath
tags: [variable string private]
```

```Go
var siteConfigEscapeHatchPath = ...
```

## <a id="type" href="#type">Types</a>

```
tags: [package private]
```

### <a id="AccessTokAllow" href="#AccessTokAllow">type AccessTokAllow string</a>

```
searchKey: conf.AccessTokAllow
tags: [string]
```

```Go
type AccessTokAllow string
```

#### <a id="AccessTokensAllow" href="#AccessTokensAllow">func AccessTokensAllow() AccessTokAllow</a>

```
searchKey: conf.AccessTokensAllow
tags: [function]
```

```Go
func AccessTokensAllow() AccessTokAllow
```

AccessTokensAllow returns whether access tokens are enabled, disabled, or restricted to creation by admin users. 

### <a id="ConfigurationSource" href="#ConfigurationSource">type ConfigurationSource interface</a>

```
searchKey: conf.ConfigurationSource
tags: [interface]
```

```Go
type ConfigurationSource interface {
	// Write updates the configuration. The Deployment field is ignored.
	Write(ctx context.Context, data conftypes.RawUnified) error
	Read(ctx context.Context) (conftypes.RawUnified, error)
}
```

ConfigurationSource provides direct access to read and write to the "raw" configuration. 

### <a id="Edits" href="#Edits">type Edits struct</a>

```
searchKey: conf.Edits
tags: [struct]
```

```Go
type Edits struct {
	Site []jsonx.Edit
}
```

Edits describes some JSON edits to apply to site configuration. 

### <a id="ExternalServiceMode" href="#ExternalServiceMode">type ExternalServiceMode int</a>

```
searchKey: conf.ExternalServiceMode
tags: [number]
```

```Go
type ExternalServiceMode int
```

#### <a id="ExternalServiceUserMode" href="#ExternalServiceUserMode">func ExternalServiceUserMode() ExternalServiceMode</a>

```
searchKey: conf.ExternalServiceUserMode
tags: [function]
```

```Go
func ExternalServiceUserMode() ExternalServiceMode
```

ExternalServiceUserMode returns the site level mode describing if users are allowed to add external services for public and private repositories. It does NOT take into account permissions granted to the current user. 

#### <a id="ExternalServiceMode.String" href="#ExternalServiceMode.String">func (e ExternalServiceMode) String() string</a>

```
searchKey: conf.ExternalServiceMode.String
tags: [function]
```

```Go
func (e ExternalServiceMode) String() string
```

### <a id="PlatformConfiguration" href="#PlatformConfiguration">type PlatformConfiguration struct</a>

```
searchKey: conf.PlatformConfiguration
tags: [struct]
```

```Go
type PlatformConfiguration struct {
	RemoteRegistryURL string
}
```

PlatformConfiguration contains site configuration for the Sourcegraph platform. 

#### <a id="Extensions" href="#Extensions">func Extensions() *PlatformConfiguration</a>

```
searchKey: conf.Extensions
tags: [function]
```

```Go
func Extensions() *PlatformConfiguration
```

Extensions returns the configuration for the Sourcegraph platform, or nil if it is disabled. 

### <a id="Problem" href="#Problem">type Problem struct</a>

```
searchKey: conf.Problem
tags: [struct]
```

```Go
type Problem struct {
	kind        problemKind
	description string
}
```

Problem contains kind and description of a specific configuration problem. 

#### <a id="NewExternalServiceProblem" href="#NewExternalServiceProblem">func NewExternalServiceProblem(msg string) *Problem</a>

```
searchKey: conf.NewExternalServiceProblem
tags: [method]
```

```Go
func NewExternalServiceProblem(msg string) *Problem
```

NewExternalServiceProblem creates a new external service config problem with given message. 

#### <a id="NewSiteProblem" href="#NewSiteProblem">func NewSiteProblem(msg string) *Problem</a>

```
searchKey: conf.NewSiteProblem
tags: [method]
```

```Go
func NewSiteProblem(msg string) *Problem
```

NewSiteProblem creates a new site config problem with given message. 

#### <a id="Problem.IsExternalService" href="#Problem.IsExternalService">func (p Problem) IsExternalService() bool</a>

```
searchKey: conf.Problem.IsExternalService
tags: [function]
```

```Go
func (p Problem) IsExternalService() bool
```

IsExternalService returns true if the problem is about external service config. 

#### <a id="Problem.IsSite" href="#Problem.IsSite">func (p Problem) IsSite() bool</a>

```
searchKey: conf.Problem.IsSite
tags: [function]
```

```Go
func (p Problem) IsSite() bool
```

IsSite returns true if the problem is about site config. 

#### <a id="Problem.MarshalJSON" href="#Problem.MarshalJSON">func (p *Problem) MarshalJSON() ([]byte, error)</a>

```
searchKey: conf.Problem.MarshalJSON
tags: [function]
```

```Go
func (p *Problem) MarshalJSON() ([]byte, error)
```

#### <a id="Problem.String" href="#Problem.String">func (p Problem) String() string</a>

```
searchKey: conf.Problem.String
tags: [function]
```

```Go
func (p Problem) String() string
```

#### <a id="Problem.UnmarshalJSON" href="#Problem.UnmarshalJSON">func (p *Problem) UnmarshalJSON(b []byte) error</a>

```
searchKey: conf.Problem.UnmarshalJSON
tags: [method]
```

```Go
func (p *Problem) UnmarshalJSON(b []byte) error
```

### <a id="Problems" href="#Problems">type Problems []*conf.Problem</a>

```
searchKey: conf.Problems
tags: [array struct]
```

```Go
type Problems []*Problem
```

Problems is a list of problems. 

#### <a id="GetWarnings" href="#GetWarnings">func GetWarnings() (problems Problems, err error)</a>

```
searchKey: conf.GetWarnings
tags: [function]
```

```Go
func GetWarnings() (problems Problems, err error)
```

GetWarnings identifies problems with the configuration that a site admin should address, but do not prevent Sourcegraph from running. 

#### <a id="NewExternalServiceProblems" href="#NewExternalServiceProblems">func NewExternalServiceProblems(messages ...string) Problems</a>

```
searchKey: conf.NewExternalServiceProblems
tags: [method]
```

```Go
func NewExternalServiceProblems(messages ...string) Problems
```

NewExternalServiceProblems converts a list of messages into external service config problems. 

#### <a id="NewSiteProblems" href="#NewSiteProblems">func NewSiteProblems(messages ...string) Problems</a>

```
searchKey: conf.NewSiteProblems
tags: [method]
```

```Go
func NewSiteProblems(messages ...string) Problems
```

NewSiteProblems converts a list of messages into site config problems. 

#### <a id="Validate" href="#Validate">func Validate(input conftypes.RawUnified) (problems Problems, err error)</a>

```
searchKey: conf.Validate
tags: [method]
```

```Go
func Validate(input conftypes.RawUnified) (problems Problems, err error)
```

Validate validates the configuration against the JSON Schema and other custom validation checks. 

#### <a id="newProblems" href="#newProblems">func newProblems(kind problemKind, messages ...string) Problems</a>

```
searchKey: conf.newProblems
tags: [method private]
```

```Go
func newProblems(kind problemKind, messages ...string) Problems
```

newProblems converts a list of messages with their kind into problems. 

#### <a id="validateCustom" href="#validateCustom">func validateCustom(cfg Unified) (problems Problems)</a>

```
searchKey: conf.validateCustom
tags: [method private]
```

```Go
func validateCustom(cfg Unified) (problems Problems)
```

validateCustom validates the site config using custom validation steps that are not able to be expressed in the JSON Schema. 

#### <a id="validateCustomRaw" href="#validateCustomRaw">func validateCustomRaw(normalizedInput conftypes.RawUnified) (problems Problems, err error)</a>

```
searchKey: conf.validateCustomRaw
tags: [method private]
```

```Go
func validateCustomRaw(normalizedInput conftypes.RawUnified) (problems Problems, err error)
```

#### <a id="Problems.ExternalService" href="#Problems.ExternalService">func (ps Problems) ExternalService() (problems Problems)</a>

```
searchKey: conf.Problems.ExternalService
tags: [function]
```

```Go
func (ps Problems) ExternalService() (problems Problems)
```

ExternalService returns all external service config problems in the list. 

#### <a id="Problems.Messages" href="#Problems.Messages">func (ps Problems) Messages() []string</a>

```
searchKey: conf.Problems.Messages
tags: [function]
```

```Go
func (ps Problems) Messages() []string
```

Messages returns the list of problems in strings. 

#### <a id="Problems.Site" href="#Problems.Site">func (ps Problems) Site() (problems Problems)</a>

```
searchKey: conf.Problems.Site
tags: [function]
```

```Go
func (ps Problems) Site() (problems Problems)
```

Site returns all site config problems in the list. 

### <a id="Server" href="#Server">type Server struct</a>

```
searchKey: conf.Server
tags: [struct]
```

```Go
type Server struct {
	Source ConfigurationSource

	store *store

	needRestartMu sync.RWMutex
	needRestart   bool

	// fileWrite signals when our app writes to the configuration file. The
	// secondary channel is closed when server.Raw() would return the new
	// configuration that has been written to disk.
	fileWrite chan chan struct{}

	once sync.Once
}
```

Server provides access and manages modifications to the site configuration. 

#### <a id="InitConfigurationServerFrontendOnly" href="#InitConfigurationServerFrontendOnly">func InitConfigurationServerFrontendOnly(source ConfigurationSource) *Server</a>

```
searchKey: conf.InitConfigurationServerFrontendOnly
tags: [method]
```

```Go
func InitConfigurationServerFrontendOnly(source ConfigurationSource) *Server
```

InitConfigurationServerFrontendOnly creates and returns a configuration server. This should only be invoked by the frontend, or else a panic will occur. This function should only ever be called once. 

#### <a id="NewServer" href="#NewServer">func NewServer(source ConfigurationSource) *Server</a>

```
searchKey: conf.NewServer
tags: [method]
```

```Go
func NewServer(source ConfigurationSource) *Server
```

NewServer returns a new Server instance that mangages the site config file that is stored at configSource. 

The server must be started with Start() before it can handle requests. 

#### <a id="Server.Edit" href="#Server.Edit">func (s *Server) Edit(ctx context.Context, computeEdits func(current *Unified, raw conftypes.RawUnified) (Edits, error)) error</a>

```
searchKey: conf.Server.Edit
tags: [method]
```

```Go
func (s *Server) Edit(ctx context.Context, computeEdits func(current *Unified, raw conftypes.RawUnified) (Edits, error)) error
```

Edit invokes the provided function to compute edits to the site configuration. It then applies and writes them. 

The computation function is provided the current configuration, which should NEVER be modified in any way. Always copy values. 

TODO(slimsag): Currently, edits may only be applied via the frontend. It may make sense to allow non-frontend services to apply edits as well. To do this we would need to pipe writes through the frontend's internal httpapi. 

#### <a id="Server.NeedServerRestart" href="#Server.NeedServerRestart">func (s *Server) NeedServerRestart() bool</a>

```
searchKey: conf.Server.NeedServerRestart
tags: [function]
```

```Go
func (s *Server) NeedServerRestart() bool
```

NeedServerRestart tells if the server needs to restart for pending configuration changes to take effect. 

#### <a id="Server.Raw" href="#Server.Raw">func (s *Server) Raw() conftypes.RawUnified</a>

```
searchKey: conf.Server.Raw
tags: [function]
```

```Go
func (s *Server) Raw() conftypes.RawUnified
```

Raw returns the raw text of the configuration file. 

#### <a id="Server.Start" href="#Server.Start">func (s *Server) Start()</a>

```
searchKey: conf.Server.Start
tags: [function]
```

```Go
func (s *Server) Start()
```

Start initializes the server instance. 

#### <a id="Server.Write" href="#Server.Write">func (s *Server) Write(ctx context.Context, input conftypes.RawUnified) error</a>

```
searchKey: conf.Server.Write
tags: [method]
```

```Go
func (s *Server) Write(ctx context.Context, input conftypes.RawUnified) error
```

Write writes the JSON config file to the config file's path. If the JSON configuration is invalid, an error is returned. 

#### <a id="Server.markNeedServerRestart" href="#Server.markNeedServerRestart">func (s *Server) markNeedServerRestart()</a>

```
searchKey: conf.Server.markNeedServerRestart
tags: [function private]
```

```Go
func (s *Server) markNeedServerRestart()
```

markNeedServerRestart marks the server as needing a restart so that pending configuration changes can take effect. 

#### <a id="Server.updateFromSource" href="#Server.updateFromSource">func (s *Server) updateFromSource(ctx context.Context) error</a>

```
searchKey: conf.Server.updateFromSource
tags: [method private]
```

```Go
func (s *Server) updateFromSource(ctx context.Context) error
```

#### <a id="Server.watchSource" href="#Server.watchSource">func (s *Server) watchSource()</a>

```
searchKey: conf.Server.watchSource
tags: [function private]
```

```Go
func (s *Server) watchSource()
```

watchSource reloads the configuration from the source at least every five seconds or whenever server.Write() is called. 

### <a id="Unified" href="#Unified">type Unified struct</a>

```
searchKey: conf.Unified
tags: [struct]
```

```Go
type Unified struct {
	schema.SiteConfiguration
	ServiceConnections conftypes.ServiceConnections
}
```

Unified represents the overall global Sourcegraph configuration from various sources: 

- The site configuration, from the database (from the site-admin panel). - Service connections, from the frontend (e.g. which gitservers to talk to). 

#### <a id="Get" href="#Get">func Get() *Unified</a>

```
searchKey: conf.Get
tags: [function]
```

```Go
func Get() *Unified
```

Get returns a copy of the configuration. The returned value should NEVER be modified. 

Important: The configuration can change while the process is running! Code should only call this in response to conf.Watch OR it should invoke it periodically or in direct response to a user action (e.g. inside an HTTP handler) to ensure it responds to configuration changes while the process is running. 

There are a select few configuration options that do restart the server, but these are the exception rather than the rule. In general, ANY use of configuration should be done in such a way that it responds to config changes while the process is running. 

Get is a wrapper around client.Get. 

#### <a id="ParseConfig" href="#ParseConfig">func ParseConfig(data conftypes.RawUnified) (*Unified, error)</a>

```
searchKey: conf.ParseConfig
tags: [method]
```

```Go
func ParseConfig(data conftypes.RawUnified) (*Unified, error)
```

ParseConfig parses the raw configuration. 

### <a id="Validator" href="#Validator">type Validator func(github.com/sourcegraph/sourcegraph/internal/conf.Unified) github.com/sourcegraph/sourcegraph/internal/conf.Problems</a>

```
searchKey: conf.Validator
tags: [function]
```

```Go
type Validator func(Unified) Problems
```

### <a id="cachedConfigurationSource" href="#cachedConfigurationSource">type cachedConfigurationSource struct</a>

```
searchKey: conf.cachedConfigurationSource
tags: [struct private]
```

```Go
type cachedConfigurationSource struct {
	source ConfigurationSource

	ttl       time.Duration
	entryMu   sync.Mutex
	entry     *conftypes.RawUnified
	entryTime time.Time
}
```

cachedConfigurationSource caches reads for a specified duration to reduce the number of reads against the underlying configuration source (e.g. a Postgres DB). 

#### <a id="cachedConfigurationSource.Read" href="#cachedConfigurationSource.Read">func (c *cachedConfigurationSource) Read(ctx context.Context) (conftypes.RawUnified, error)</a>

```
searchKey: conf.cachedConfigurationSource.Read
tags: [method private]
```

```Go
func (c *cachedConfigurationSource) Read(ctx context.Context) (conftypes.RawUnified, error)
```

#### <a id="cachedConfigurationSource.Write" href="#cachedConfigurationSource.Write">func (c *cachedConfigurationSource) Write(ctx context.Context, input conftypes.RawUnified) error</a>

```
searchKey: conf.cachedConfigurationSource.Write
tags: [method private]
```

```Go
func (c *cachedConfigurationSource) Write(ctx context.Context, input conftypes.RawUnified) error
```

### <a id="client" href="#client">type client struct</a>

```
searchKey: conf.client
tags: [struct private]
```

```Go
type client struct {
	store       *store
	passthrough ConfigurationSource
	watchersMu  sync.Mutex
	watchers    []chan struct{}
}
```

#### <a id="defaultClient" href="#defaultClient">func defaultClient() *client</a>

```
searchKey: conf.defaultClient
tags: [function private]
```

```Go
func defaultClient() *client
```

#### <a id="initDefaultClient" href="#initDefaultClient">func initDefaultClient() *client</a>

```
searchKey: conf.initDefaultClient
tags: [function private]
```

```Go
func initDefaultClient() *client
```

#### <a id="client.Cached" href="#client.Cached">func (c *client) Cached(f func() interface{}) (wrapped func() interface{})</a>

```
searchKey: conf.client.Cached
tags: [method private]
```

```Go
func (c *client) Cached(f func() interface{}) (wrapped func() interface{})
```

Cached will return a wrapper around f which caches the response. The value will be recomputed every time the config is updated. 

The first call to wrapped will block on config initialization. 

#### <a id="client.Get" href="#client.Get">func (c *client) Get() *Unified</a>

```
searchKey: conf.client.Get
tags: [function private]
```

```Go
func (c *client) Get() *Unified
```

Get returns a copy of the configuration. The returned value should NEVER be modified. 

Important: The configuration can change while the process is running! Code should only call this in response to conf.Watch OR it should invoke it periodically or in direct response to a user action (e.g. inside an HTTP handler) to ensure it responds to configuration changes while the process is running. 

There are a select few configuration options that do restart the server but these are the exception rather than the rule. In general, ANY use of configuration should be done in such a way that it responds to config changes while the process is running. 

#### <a id="client.Mock" href="#client.Mock">func (c *client) Mock(mockery *Unified)</a>

```
searchKey: conf.client.Mock
tags: [method private]
```

```Go
func (c *client) Mock(mockery *Unified)
```

Mock sets up mock data for the site configuration. 

#### <a id="client.Raw" href="#client.Raw">func (c *client) Raw() conftypes.RawUnified</a>

```
searchKey: conf.client.Raw
tags: [function private]
```

```Go
func (c *client) Raw() conftypes.RawUnified
```

Raw returns a copy of the raw configuration. 

#### <a id="client.Watch" href="#client.Watch">func (c *client) Watch(f func())</a>

```
searchKey: conf.client.Watch
tags: [method private]
```

```Go
func (c *client) Watch(f func())
```

Watch calls the given function in a separate goroutine whenever the configuration has changed. The new configuration can be received by calling conf.Get. 

Before Watch returns, it will invoke f to use the current configuration. 

#### <a id="client.continuouslyUpdate" href="#client.continuouslyUpdate">func (c *client) continuouslyUpdate(optOnlySetByTests *continuousUpdateOptions)</a>

```
searchKey: conf.client.continuouslyUpdate
tags: [method private]
```

```Go
func (c *client) continuouslyUpdate(optOnlySetByTests *continuousUpdateOptions)
```

continuouslyUpdate runs (*client).fetchAndUpdate in an infinite loop, with error logging and random sleep intervals. 

The optOnlySetByTests parameter is ONLY customized by tests. All callers in main code should pass nil (so that the same defaults are used). 

#### <a id="client.fetchAndUpdate" href="#client.fetchAndUpdate">func (c *client) fetchAndUpdate() error</a>

```
searchKey: conf.client.fetchAndUpdate
tags: [function private]
```

```Go
func (c *client) fetchAndUpdate() error
```

#### <a id="client.notifyWatchers" href="#client.notifyWatchers">func (c *client) notifyWatchers()</a>

```
searchKey: conf.client.notifyWatchers
tags: [function private]
```

```Go
func (c *client) notifyWatchers()
```

notifyWatchers runs all the callbacks registered via client.Watch() whenever the configuration has changed. 

### <a id="configurationMode" href="#configurationMode">type configurationMode int</a>

```
searchKey: conf.configurationMode
tags: [number private]
```

```Go
type configurationMode int
```

#### <a id="getMode" href="#getMode">func getMode() configurationMode</a>

```
searchKey: conf.getMode
tags: [function private]
```

```Go
func getMode() configurationMode
```

### <a id="continuousUpdateOptions" href="#continuousUpdateOptions">type continuousUpdateOptions struct</a>

```
searchKey: conf.continuousUpdateOptions
tags: [struct private]
```

```Go
type continuousUpdateOptions struct {
	// delayBeforeUnreachableLog is how long to wait before logging an error upon initial startup
	// due to the frontend being unreachable. It is used to avoid log spam when other services (that
	// contact the frontend for configuration) start up before the frontend.
	delayBeforeUnreachableLog time.Duration

	log   func(format string, v ...interface{}) // log.Printf equivalent
	sleep func()                                // sleep between updates
}
```

### <a id="jsonLoader" href="#jsonLoader">type jsonLoader struct</a>

```
searchKey: conf.jsonLoader
tags: [struct private]
```

```Go
type jsonLoader struct {
	gojsonschema.JSONLoader
}
```

#### <a id="jsonLoader.LoaderFactory" href="#jsonLoader.LoaderFactory">func (l jsonLoader) LoaderFactory() gojsonschema.JSONLoaderFactory</a>

```
searchKey: conf.jsonLoader.LoaderFactory
tags: [function private]
```

```Go
func (l jsonLoader) LoaderFactory() gojsonschema.JSONLoaderFactory
```

### <a id="jsonLoaderFactory" href="#jsonLoaderFactory">type jsonLoaderFactory struct{}</a>

```
searchKey: conf.jsonLoaderFactory
tags: [struct private]
```

```Go
type jsonLoaderFactory struct{}
```

#### <a id="jsonLoaderFactory.New" href="#jsonLoaderFactory.New">func (f jsonLoaderFactory) New(source string) gojsonschema.JSONLoader</a>

```
searchKey: conf.jsonLoaderFactory.New
tags: [method private]
```

```Go
func (f jsonLoaderFactory) New(source string) gojsonschema.JSONLoader
```

### <a id="problemKind" href="#problemKind">type problemKind string</a>

```
searchKey: conf.problemKind
tags: [string private]
```

```Go
type problemKind string
```

problemKind represents the kind of a configuration problem. 

### <a id="store" href="#store">type store struct</a>

```
searchKey: conf.store
tags: [struct private]
```

```Go
type store struct {
	configMu  sync.RWMutex
	lastValid *Unified
	mock      *Unified

	rawMu sync.RWMutex
	raw   conftypes.RawUnified

	ready chan struct{}
	once  sync.Once
}
```

store manages the in-memory storage, access, and updating of the site configuration in a threadsafe manner. 

#### <a id="newStore" href="#newStore">func newStore() *store</a>

```
searchKey: conf.newStore
tags: [function private]
```

```Go
func newStore() *store
```

newStore returns a new configuration store. 

#### <a id="store.LastValid" href="#store.LastValid">func (s *store) LastValid() *Unified</a>

```
searchKey: conf.store.LastValid
tags: [function private]
```

```Go
func (s *store) LastValid() *Unified
```

LastValid returns the last valid site configuration that this store was updated with. 

#### <a id="store.MaybeUpdate" href="#store.MaybeUpdate">func (s *store) MaybeUpdate(rawConfig conftypes.RawUnified) (updateResult, error)</a>

```
searchKey: conf.store.MaybeUpdate
tags: [method private]
```

```Go
func (s *store) MaybeUpdate(rawConfig conftypes.RawUnified) (updateResult, error)
```

MaybeUpdate attempts to update the store with the supplied rawConfig. 

If the rawConfig isn't syntactically valid JSON, the store's LastValid field. won't be updating and a parsing error will be returned from the previous time that this function was called. 

configChange is defined iff the cache was actually updated. TODO@ggilmore: write a less-vague description 

#### <a id="store.Mock" href="#store.Mock">func (s *store) Mock(mockery *Unified)</a>

```
searchKey: conf.store.Mock
tags: [method private]
```

```Go
func (s *store) Mock(mockery *Unified)
```

Mock sets up mock data for the site configuration. It uses the configuration mutex, to avoid possible races between test code and possible config watchers. 

#### <a id="store.Raw" href="#store.Raw">func (s *store) Raw() conftypes.RawUnified</a>

```
searchKey: conf.store.Raw
tags: [function private]
```

```Go
func (s *store) Raw() conftypes.RawUnified
```

Raw returns the last raw configuration that this store was updated with. 

#### <a id="store.WaitUntilInitialized" href="#store.WaitUntilInitialized">func (s *store) WaitUntilInitialized()</a>

```
searchKey: conf.store.WaitUntilInitialized
tags: [function private]
```

```Go
func (s *store) WaitUntilInitialized()
```

WaitUntilInitialized blocks and only returns to the caller once the store has initialized with a syntactically valid configuration file (via MaybeUpdate() or Mock()). 

#### <a id="store.checkDeadlock" href="#store.checkDeadlock">func (s *store) checkDeadlock()</a>

```
searchKey: conf.store.checkDeadlock
tags: [function private]
```

```Go
func (s *store) checkDeadlock()
```

#### <a id="store.initialize" href="#store.initialize">func (s *store) initialize()</a>

```
searchKey: conf.store.initialize
tags: [function private]
```

```Go
func (s *store) initialize()
```

### <a id="updateResult" href="#updateResult">type updateResult struct</a>

```
searchKey: conf.updateResult
tags: [struct private]
```

```Go
type updateResult struct {
	Changed bool
	Old     *Unified
	New     *Unified
}
```

## <a id="func" href="#func">Functions</a>

```
tags: [package private]
```

### <a id="AWSCodeCommitConfigs" href="#AWSCodeCommitConfigs">func AWSCodeCommitConfigs(ctx context.Context) ([]*schema.AWSCodeCommitConnection, error)</a>

```
searchKey: conf.AWSCodeCommitConfigs
tags: [method]
```

```Go
func AWSCodeCommitConfigs(ctx context.Context) ([]*schema.AWSCodeCommitConnection, error)
```

### <a id="AndOrQueryEnabled" href="#AndOrQueryEnabled">func AndOrQueryEnabled() bool</a>

```
searchKey: conf.AndOrQueryEnabled
tags: [function]
```

```Go
func AndOrQueryEnabled() bool
```

### <a id="AuthAllowSignup" href="#AuthAllowSignup">func AuthAllowSignup() bool</a>

```
searchKey: conf.AuthAllowSignup
tags: [function]
```

```Go
func AuthAllowSignup() bool
```

AuthAllowSignup reports whether the site allows signup. Currently only the builtin auth provider allows signup. AuthAllowSignup returns true if auth.providers' builtin provider has allowSignup true (in site config). 

### <a id="AuthMinPasswordLength" href="#AuthMinPasswordLength">func AuthMinPasswordLength() int</a>

```
searchKey: conf.AuthMinPasswordLength
tags: [function]
```

```Go
func AuthMinPasswordLength() int
```

AuthMinPasswordLength returns the value of minimum password length requirement. If not set, it returns the default value 12. 

### <a id="AuthPasswordResetLinkExpiry" href="#AuthPasswordResetLinkExpiry">func AuthPasswordResetLinkExpiry() int</a>

```
searchKey: conf.AuthPasswordResetLinkExpiry
tags: [function]
```

```Go
func AuthPasswordResetLinkExpiry() int
```

AuthPasswordResetLinkExpiry returns the time (in seconds) indicating how long password reset links are considered valid. If not set, it returns the default value. 

### <a id="AuthProviderType" href="#AuthProviderType">func AuthProviderType(p schema.AuthProviders) string</a>

```
searchKey: conf.AuthProviderType
tags: [method]
```

```Go
func AuthProviderType(p schema.AuthProviders) string
```

AuthProviderType returns the type string for the auth provider. 

### <a id="AuthPublic" href="#AuthPublic">func AuthPublic() bool</a>

```
searchKey: conf.AuthPublic
tags: [function]
```

```Go
func AuthPublic() bool
```

AuthPublic reports whether the site is public. Because many core features rely on persisted user settings, this leads to a degraded experience for most users. As a result, for self-hosted private usage it is preferable for all users to have accounts. But on sourcegraph.com, allowing users to opt-in to accounts remains worthwhile, despite the degraded UX. 

### <a id="BatchChangesEnabled" href="#BatchChangesEnabled">func BatchChangesEnabled() bool</a>

```
searchKey: conf.BatchChangesEnabled
tags: [function]
```

```Go
func BatchChangesEnabled() bool
```

### <a id="BatchChangesRestrictedToAdmins" href="#BatchChangesRestrictedToAdmins">func BatchChangesRestrictedToAdmins() bool</a>

```
searchKey: conf.BatchChangesRestrictedToAdmins
tags: [function]
```

```Go
func BatchChangesRestrictedToAdmins() bool
```

### <a id="BitbucketServerConfigs" href="#BitbucketServerConfigs">func BitbucketServerConfigs(ctx context.Context) ([]*schema.BitbucketServerConnection, error)</a>

```
searchKey: conf.BitbucketServerConfigs
tags: [method]
```

```Go
func BitbucketServerConfigs(ctx context.Context) ([]*schema.BitbucketServerConnection, error)
```

### <a id="BitbucketServerPluginPerm" href="#BitbucketServerPluginPerm">func BitbucketServerPluginPerm() bool</a>

```
searchKey: conf.BitbucketServerPluginPerm
tags: [function]
```

```Go
func BitbucketServerPluginPerm() bool
```

### <a id="Cached" href="#Cached">func Cached(f func() interface{}) (wrapped func() interface{})</a>

```
searchKey: conf.Cached
tags: [method]
```

```Go
func Cached(f func() interface{}) (wrapped func() interface{})
```

Cached will return a wrapper around f which caches the response. The value will be recomputed every time the config is updated. 

IMPORTANT: The first call to wrapped will block on config initialization. 

### <a id="CanSendEmail" href="#CanSendEmail">func CanSendEmail() bool</a>

```
searchKey: conf.CanSendEmail
tags: [function]
```

```Go
func CanSendEmail() bool
```

CanSendEmail returns whether the site can send emails (e.g., to reset a password or invite a user to an org). 

It's false for sites that do not have an email sending API key set up. 

### <a id="CodeIntelAutoIndexingEnabled" href="#CodeIntelAutoIndexingEnabled">func CodeIntelAutoIndexingEnabled() bool</a>

```
searchKey: conf.CodeIntelAutoIndexingEnabled
tags: [function]
```

```Go
func CodeIntelAutoIndexingEnabled() bool
```

### <a id="ContributeValidator" href="#ContributeValidator">func ContributeValidator(f Validator)</a>

```
searchKey: conf.ContributeValidator
tags: [method]
```

```Go
func ContributeValidator(f Validator)
```

ContributeValidator adds the site configuration validator function to the validation process. It is called to validate site configuration. Any strings it returns are shown as validation problems. 

It may only be called at init time. 

### <a id="ContributeWarning" href="#ContributeWarning">func ContributeWarning(f Validator)</a>

```
searchKey: conf.ContributeWarning
tags: [method]
```

```Go
func ContributeWarning(f Validator)
```

ContributeWarning adds the configuration validator function to the validation process. It is called to validate site configuration. Any problems it returns are shown as configuration warnings in the form of site alerts. 

It may only be called at init time. 

### <a id="DeployType" href="#DeployType">func DeployType() string</a>

```
searchKey: conf.DeployType
tags: [function]
```

```Go
func DeployType() string
```

DeployType tells the deployment type. 

### <a id="EmailVerificationRequired" href="#EmailVerificationRequired">func EmailVerificationRequired() bool</a>

```
searchKey: conf.EmailVerificationRequired
tags: [function]
```

```Go
func EmailVerificationRequired() bool
```

EmailVerificationRequired returns whether users must verify an email address before they can perform most actions on this site. 

It's false for sites that do not have an email sending API key set up. 

### <a id="EventLoggingEnabled" href="#EventLoggingEnabled">func EventLoggingEnabled() bool</a>

```
searchKey: conf.EventLoggingEnabled
tags: [function]
```

```Go
func EventLoggingEnabled() bool
```

### <a id="ExperimentalFeatures" href="#ExperimentalFeatures">func ExperimentalFeatures() schema.ExperimentalFeatures</a>

```
searchKey: conf.ExperimentalFeatures
tags: [function]
```

```Go
func ExperimentalFeatures() schema.ExperimentalFeatures
```

### <a id="ExternalURL" href="#ExternalURL">func ExternalURL() string</a>

```
searchKey: conf.ExternalURL
tags: [function]
```

```Go
func ExternalURL() string
```

### <a id="GitHubConfigs" href="#GitHubConfigs">func GitHubConfigs(ctx context.Context) ([]*schema.GitHubConnection, error)</a>

```
searchKey: conf.GitHubConfigs
tags: [method]
```

```Go
func GitHubConfigs(ctx context.Context) ([]*schema.GitHubConnection, error)
```

### <a id="GitLabConfigs" href="#GitLabConfigs">func GitLabConfigs(ctx context.Context) ([]*schema.GitLabConnection, error)</a>

```
searchKey: conf.GitLabConfigs
tags: [method]
```

```Go
func GitLabConfigs(ctx context.Context) ([]*schema.GitLabConnection, error)
```

### <a id="GitMaxCodehostRequestsPerSecond" href="#GitMaxCodehostRequestsPerSecond">func GitMaxCodehostRequestsPerSecond() int</a>

```
searchKey: conf.GitMaxCodehostRequestsPerSecond
tags: [function]
```

```Go
func GitMaxCodehostRequestsPerSecond() int
```

GitMaxCodehostRequestsPerSecond returns maximum number of remote code host git operations to be run per second per gitserver. If not set, it returns the default value -1. 

### <a id="GitoliteConfigs" href="#GitoliteConfigs">func GitoliteConfigs(ctx context.Context) ([]*schema.GitoliteConnection, error)</a>

```
searchKey: conf.GitoliteConfigs
tags: [method]
```

```Go
func GitoliteConfigs(ctx context.Context) ([]*schema.GitoliteConnection, error)
```

### <a id="HasExternalAuthProvider" href="#HasExternalAuthProvider">func HasExternalAuthProvider(c Unified) bool</a>

```
searchKey: conf.HasExternalAuthProvider
tags: [method]
```

```Go
func HasExternalAuthProvider(c Unified) bool
```

### <a id="IsBuiltinSignupAllowed" href="#IsBuiltinSignupAllowed">func IsBuiltinSignupAllowed() bool</a>

```
searchKey: conf.IsBuiltinSignupAllowed
tags: [function]
```

```Go
func IsBuiltinSignupAllowed() bool
```

### <a id="IsDeployTypeDockerCompose" href="#IsDeployTypeDockerCompose">func IsDeployTypeDockerCompose(deployType string) bool</a>

```
searchKey: conf.IsDeployTypeDockerCompose
tags: [method]
```

```Go
func IsDeployTypeDockerCompose(deployType string) bool
```

IsDeployTypeDockerCompose tells if the given deployment type is the Docker Compose deployment (and non-dev, not pure-docker, non-cluster, and non-single Docker image). 

### <a id="IsDeployTypeKubernetes" href="#IsDeployTypeKubernetes">func IsDeployTypeKubernetes(deployType string) bool</a>

```
searchKey: conf.IsDeployTypeKubernetes
tags: [method]
```

```Go
func IsDeployTypeKubernetes(deployType string) bool
```

IsDeployTypeKubernetes tells if the given deployment type is a Kubernetes cluster (and non-dev, not docker-compose, not pure-docker, and non-single Docker image). 

### <a id="IsDeployTypePureDocker" href="#IsDeployTypePureDocker">func IsDeployTypePureDocker(deployType string) bool</a>

```
searchKey: conf.IsDeployTypePureDocker
tags: [method]
```

```Go
func IsDeployTypePureDocker(deployType string) bool
```

IsDeployTypePureDocker tells if the given deployment type is the pure Docker deployment (and non-dev, not docker-compose, non-cluster, and non-single Docker image). 

### <a id="IsDeployTypeSingleDockerContainer" href="#IsDeployTypeSingleDockerContainer">func IsDeployTypeSingleDockerContainer(deployType string) bool</a>

```
searchKey: conf.IsDeployTypeSingleDockerContainer
tags: [method]
```

```Go
func IsDeployTypeSingleDockerContainer(deployType string) bool
```

IsDeployTypeSingleDockerContainer tells if the given deployment type is Docker sourcegraph/server single-container (non-Kubernetes, not docker-compose, not pure-docker, non-cluster, non-dev). 

### <a id="IsDev" href="#IsDev">func IsDev(deployType string) bool</a>

```
searchKey: conf.IsDev
tags: [method]
```

```Go
func IsDev(deployType string) bool
```

IsDev tells if the given deployment type is "dev". 

### <a id="IsExternalURLSecure" href="#IsExternalURLSecure">func IsExternalURLSecure() bool</a>

```
searchKey: conf.IsExternalURLSecure
tags: [function]
```

```Go
func IsExternalURLSecure() bool
```

### <a id="IsValidDeployType" href="#IsValidDeployType">func IsValidDeployType(deployType string) bool</a>

```
searchKey: conf.IsValidDeployType
tags: [method]
```

```Go
func IsValidDeployType(deployType string) bool
```

IsValidDeployType returns true iff the given deployType is a Kubernetes deployment, a Docker Compose deployment, a pure Docker deployment, a Docker deployment, or a local development environment. 

### <a id="Mock" href="#Mock">func Mock(mockery *Unified)</a>

```
searchKey: conf.Mock
tags: [method]
```

```Go
func Mock(mockery *Unified)
```

Mock sets up mock data for the site configuration. 

Mock is a wrapper around client.Mock. 

### <a id="MustValidateDefaults" href="#MustValidateDefaults">func MustValidateDefaults()</a>

```
searchKey: conf.MustValidateDefaults
tags: [function]
```

```Go
func MustValidateDefaults()
```

MustValidateDefaults should be called after all custom validators have been registered. It will panic if any of the default deployment configurations are invalid. 

### <a id="NeedRestartToApply" href="#NeedRestartToApply">func NeedRestartToApply(before, after *Unified) bool</a>

```
searchKey: conf.NeedRestartToApply
tags: [method]
```

```Go
func NeedRestartToApply(before, after *Unified) bool
```

NeedRestartToApply determines if a restart is needed to apply the changes between the two configurations. 

### <a id="PhabricatorConfigs" href="#PhabricatorConfigs">func PhabricatorConfigs(ctx context.Context) ([]*schema.PhabricatorConnection, error)</a>

```
searchKey: conf.PhabricatorConfigs
tags: [method]
```

```Go
func PhabricatorConfigs(ctx context.Context) ([]*schema.PhabricatorConnection, error)
```

### <a id="ProductResearchPageEnabled" href="#ProductResearchPageEnabled">func ProductResearchPageEnabled() bool</a>

```
searchKey: conf.ProductResearchPageEnabled
tags: [function]
```

```Go
func ProductResearchPageEnabled() bool
```

### <a id="Raw" href="#Raw">func Raw() conftypes.RawUnified</a>

```
searchKey: conf.Raw
tags: [function]
```

```Go
func Raw() conftypes.RawUnified
```

Raw returns a copy of the raw configuration. 

### <a id="SearchIndexEnabled" href="#SearchIndexEnabled">func SearchIndexEnabled() bool</a>

```
searchKey: conf.SearchIndexEnabled
tags: [function]
```

```Go
func SearchIndexEnabled() bool
```

SearchIndexEnabled returns true if sourcegraph should index all repositories for text search. If the configuration is unset, it returns false for the docker server image (due to resource usage) but true elsewhere. Additionally it also checks for the outdated environment variable INDEXED_SEARCH. 

### <a id="SearchSymbolsParallelism" href="#SearchSymbolsParallelism">func SearchSymbolsParallelism() int</a>

```
searchKey: conf.SearchSymbolsParallelism
tags: [function]
```

```Go
func SearchSymbolsParallelism() int
```

SearchSymbolsParallelism returns 20, or the site config "debug.search.symbolsParallelism" value if configured. 

### <a id="StructuralSearchEnabled" href="#StructuralSearchEnabled">func StructuralSearchEnabled() bool</a>

```
searchKey: conf.StructuralSearchEnabled
tags: [function]
```

```Go
func StructuralSearchEnabled() bool
```

### <a id="TestAuthPasswordResetLinkDuration" href="#TestAuthPasswordResetLinkDuration">func TestAuthPasswordResetLinkDuration(t *testing.T)</a>

```
searchKey: conf.TestAuthPasswordResetLinkDuration
tags: [method private test]
```

```Go
func TestAuthPasswordResetLinkDuration(t *testing.T)
```

### <a id="TestAuthPublic" href="#TestAuthPublic">func TestAuthPublic(t *testing.T)</a>

```
searchKey: conf.TestAuthPublic
tags: [method private test]
```

```Go
func TestAuthPublic(t *testing.T)
```

### <a id="TestClient_continuouslyUpdate" href="#TestClient_continuouslyUpdate">func TestClient_continuouslyUpdate(t *testing.T)</a>

```
searchKey: conf.TestClient_continuouslyUpdate
tags: [method private test]
```

```Go
func TestClient_continuouslyUpdate(t *testing.T)
```

### <a id="TestDiff" href="#TestDiff">func TestDiff(t *testing.T)</a>

```
searchKey: conf.TestDiff
tags: [method private test]
```

```Go
func TestDiff(t *testing.T)
```

### <a id="TestExtensions" href="#TestExtensions">func TestExtensions(t *testing.T)</a>

```
searchKey: conf.TestExtensions
tags: [method private test]
```

```Go
func TestExtensions(t *testing.T)
```

### <a id="TestGitMaxCodehostRequestsPerSecond" href="#TestGitMaxCodehostRequestsPerSecond">func TestGitMaxCodehostRequestsPerSecond(t *testing.T)</a>

```
searchKey: conf.TestGitMaxCodehostRequestsPerSecond
tags: [method private test]
```

```Go
func TestGitMaxCodehostRequestsPerSecond(t *testing.T)
```

### <a id="TestProblems" href="#TestProblems">func TestProblems(t *testing.T)</a>

```
searchKey: conf.TestProblems
tags: [method private test]
```

```Go
func TestProblems(t *testing.T)
```

### <a id="TestSearchIndexEnabled" href="#TestSearchIndexEnabled">func TestSearchIndexEnabled(t *testing.T)</a>

```
searchKey: conf.TestSearchIndexEnabled
tags: [method private test]
```

```Go
func TestSearchIndexEnabled(t *testing.T)
```

### <a id="TestValidate" href="#TestValidate">func TestValidate(t *testing.T)</a>

```
searchKey: conf.TestValidate
tags: [method private test]
```

```Go
func TestValidate(t *testing.T)
```

### <a id="TestValidateCustom" href="#TestValidateCustom">func TestValidateCustom(t *testing.T)</a>

```
searchKey: conf.TestValidateCustom
tags: [method private test]
```

```Go
func TestValidateCustom(t *testing.T)
```

### <a id="TestValidator" href="#TestValidator">func TestValidator(t interface {...</a>

```
searchKey: conf.TestValidator
tags: [method]
```

```Go
func TestValidator(t interface {
	Errorf(format string, args ...interface{})
	Helper()
}, c Unified, f Validator, wantProblems Problems)
```

TestValidator is an exported helper function for other packages to test their contributed validators (registered with ContributeValidator). It should only be called by tests. 

### <a id="UpdateChannel" href="#UpdateChannel">func UpdateChannel() string</a>

```
searchKey: conf.UpdateChannel
tags: [function]
```

```Go
func UpdateChannel() string
```

UpdateChannel tells the update channel. Default is "release". 

### <a id="UserReposMaxPerSite" href="#UserReposMaxPerSite">func UserReposMaxPerSite() int</a>

```
searchKey: conf.UserReposMaxPerSite
tags: [function]
```

```Go
func UserReposMaxPerSite() int
```

### <a id="UserReposMaxPerUser" href="#UserReposMaxPerUser">func UserReposMaxPerUser() int</a>

```
searchKey: conf.UserReposMaxPerUser
tags: [function]
```

```Go
func UserReposMaxPerUser() int
```

### <a id="UsingExternalURL" href="#UsingExternalURL">func UsingExternalURL() bool</a>

```
searchKey: conf.UsingExternalURL
tags: [function]
```

```Go
func UsingExternalURL() bool
```

### <a id="ValidateSetting" href="#ValidateSetting">func ValidateSetting(input string) (problems []string, err error)</a>

```
searchKey: conf.ValidateSetting
tags: [method]
```

```Go
func ValidateSetting(input string) (problems []string, err error)
```

### <a id="ValidateSite" href="#ValidateSite">func ValidateSite(input string) (messages []string, err error)</a>

```
searchKey: conf.ValidateSite
tags: [method]
```

```Go
func ValidateSite(input string) (messages []string, err error)
```

ValidateSite is like Validate, except it only validates the site configuration. 

### <a id="Watch" href="#Watch">func Watch(f func())</a>

```
searchKey: conf.Watch
tags: [method]
```

```Go
func Watch(f func())
```

Watch calls the given function whenever the configuration has changed. The new configuration is accessed by calling conf.Get. 

Before Watch returns, it will invoke f to use the current configuration. 

Watch is a wrapper around client.Watch. 

IMPORTANT: Watch will block on config initialization. It therefore should *never* be called synchronously in `init` functions. 

### <a id="authAllowSignup" href="#authAllowSignup">func authAllowSignup(c *Unified) bool</a>

```
searchKey: conf.authAllowSignup
tags: [method private]
```

```Go
func authAllowSignup(c *Unified) bool
```

### <a id="boolPtr" href="#boolPtr">func boolPtr(b bool) *bool</a>

```
searchKey: conf.boolPtr
tags: [method private]
```

```Go
func boolPtr(b bool) *bool
```

### <a id="defaultConfigForDeployment" href="#defaultConfigForDeployment">func defaultConfigForDeployment() conftypes.RawUnified</a>

```
searchKey: conf.defaultConfigForDeployment
tags: [function private]
```

```Go
func defaultConfigForDeployment() conftypes.RawUnified
```

### <a id="diff" href="#diff">func diff(before, after *Unified) (fields map[string]struct{})</a>

```
searchKey: conf.diff
tags: [method private]
```

```Go
func diff(before, after *Unified) (fields map[string]struct{})
```

diff returns names of the Go fields that have different values between the two configurations. 

### <a id="diffStruct" href="#diffStruct">func diffStruct(before, after interface{}, prefix string) (fields map[string]struct{})</a>

```
searchKey: conf.diffStruct
tags: [method private]
```

```Go
func diffStruct(before, after interface{}, prefix string) (fields map[string]struct{})
```

### <a id="doValidate" href="#doValidate">func doValidate(inputStr, schema string) (messages []string, err error)</a>

```
searchKey: conf.doValidate
tags: [method private]
```

```Go
func doValidate(inputStr, schema string) (messages []string, err error)
```

### <a id="getJSONFields" href="#getJSONFields">func getJSONFields(vv interface{}, prefix string) (fields map[string]interface{})</a>

```
searchKey: conf.getJSONFields
tags: [method private]
```

```Go
func getJSONFields(vv interface{}, prefix string) (fields map[string]interface{})
```

### <a id="init.computed.go" href="#init.computed.go">func init()</a>

```
searchKey: conf.init
tags: [function private]
```

```Go
func init()
```

### <a id="intPtr" href="#intPtr">func intPtr(i int) *int</a>

```
searchKey: conf.intPtr
tags: [method private]
```

```Go
func intPtr(i int) *int
```

### <a id="mustValidate" href="#mustValidate">func mustValidate(name string, cfg conftypes.RawUnified) conftypes.RawUnified</a>

```
searchKey: conf.mustValidate
tags: [method private]
```

```Go
func mustValidate(name string, cfg conftypes.RawUnified) conftypes.RawUnified
```

mustValidate panics if the configuration does not pass validation. 

### <a id="parseConfigData" href="#parseConfigData">func parseConfigData(data string, cfg interface{}) error</a>

```
searchKey: conf.parseConfigData
tags: [method private]
```

```Go
func parseConfigData(data string, cfg interface{}) error
```

parseConfigData parses the provided config string into the given cfg struct pointer. 

### <a id="parseJSONTag" href="#parseJSONTag">func parseJSONTag(tag string) string</a>

```
searchKey: conf.parseJSONTag
tags: [method private]
```

```Go
func parseJSONTag(tag string) string
```

parseJSONTag parses a JSON struct field tag to return the JSON field name. 

### <a id="setenv" href="#setenv">func setenv(t *testing.T, keyval string) func()</a>

```
searchKey: conf.setenv
tags: [method private]
```

```Go
func setenv(t *testing.T, keyval string) func()
```

### <a id="startSiteConfigEscapeHatchWorker" href="#startSiteConfigEscapeHatchWorker">func startSiteConfigEscapeHatchWorker(c ConfigurationSource)</a>

```
searchKey: conf.startSiteConfigEscapeHatchWorker
tags: [method private]
```

```Go
func startSiteConfigEscapeHatchWorker(c ConfigurationSource)
```

startSiteConfigEscapeHatchWorker handles ensuring that edits to the ephemeral on-disk site-config.json file are propagated to the persistent DB and vice-versa. This acts as an escape hatch such that if a site admin configures their instance in a way that they cannot access the UI (for example by configuring auth in a way that locks them out) they can simply edit this file in any of the frontend containers to undo the change. 

### <a id="toSlice" href="#toSlice">func toSlice(m map[string]struct{}) []string</a>

```
searchKey: conf.toSlice
tags: [method private]
```

```Go
func toSlice(m map[string]struct{}) []string
```

### <a id="validate" href="#validate">func validate(schema, input []byte) (*gojsonschema.Result, error)</a>

```
searchKey: conf.validate
tags: [method private]
```

```Go
func validate(schema, input []byte) (*gojsonschema.Result, error)
```

