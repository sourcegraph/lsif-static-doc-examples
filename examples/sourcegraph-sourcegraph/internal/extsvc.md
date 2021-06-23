# Package extsvc

## Index

* Subpages
  * [internal/extsvc/auth](extsvc/auth.md)
  * [internal/extsvc/awscodecommit](extsvc/awscodecommit.md)
  * [internal/extsvc/bitbucketcloud](extsvc/bitbucketcloud.md)
  * [internal/extsvc/bitbucketserver](extsvc/bitbucketserver.md)
  * [internal/extsvc/github](extsvc/github.md)
  * [internal/extsvc/gitlab](extsvc/gitlab.md)
  * [internal/extsvc/gitolite](extsvc/gitolite.md)
  * [internal/extsvc/perforce](extsvc/perforce.md)
  * [internal/extsvc/phabricator](extsvc/phabricator.md)
  * [internal/extsvc/phabricator_test](extsvc/phabricator_test.md)
* [Constants](#const)
    * [const KindAWSCodeCommit](#KindAWSCodeCommit)
    * [const KindBitbucketServer](#KindBitbucketServer)
    * [const KindBitbucketCloud](#KindBitbucketCloud)
    * [const KindGitHub](#KindGitHub)
    * [const KindGitLab](#KindGitLab)
    * [const KindGitolite](#KindGitolite)
    * [const KindPerforce](#KindPerforce)
    * [const KindPhabricator](#KindPhabricator)
    * [const KindOther](#KindOther)
    * [const TypeAWSCodeCommit](#TypeAWSCodeCommit)
    * [const TypeBitbucketServer](#TypeBitbucketServer)
    * [const TypeBitbucketCloud](#TypeBitbucketCloud)
    * [const TypeGitHub](#TypeGitHub)
    * [const TypeGitLab](#TypeGitLab)
    * [const TypeGitolite](#TypeGitolite)
    * [const TypePerforce](#TypePerforce)
    * [const TypePhabricator](#TypePhabricator)
    * [const TypeOther](#TypeOther)
    * [const IDParam](#IDParam)
* [Variables](#var)
    * [var GitHubDotComURL](#GitHubDotComURL)
    * [var GitHubDotCom](#GitHubDotCom)
    * [var GitLabDotComURL](#GitLabDotComURL)
    * [var GitLabDotCom](#GitLabDotCom)
    * [var PublicCodeHosts](#PublicCodeHosts)
    * [var bbsLower](#bbsLower)
    * [var bbcLower](#bbcLower)
* [Types](#type)
    * [type CodeHost struct](#CodeHost)
        * [func NewCodeHost(baseURL *url.URL, serviceType string) *CodeHost](#NewCodeHost)
        * [func CodeHostOf(name api.RepoName, codehosts ...*CodeHost) *CodeHost](#CodeHostOf)
    * [type jsonError struct](#jsonError)
    * [type Account struct](#Account)
    * [type AccountSpec struct](#AccountSpec)
    * [type AccountData struct](#AccountData)
        * [func (d *AccountData) SetAccountData(v interface{})](#AccountData.SetAccountData)
        * [func (d *AccountData) SetAuthData(v interface{})](#AccountData.SetAuthData)
        * [func (d *AccountData) GetAccountData(v interface{}) error](#AccountData.GetAccountData)
        * [func (d *AccountData) GetAuthData(v interface{}) error](#AccountData.GetAuthData)
    * [type Repository struct](#Repository)
    * [type Accounts struct](#Accounts)
        * [func (s *Accounts) TracingFields() []otlog.Field](#Accounts.TracingFields)
    * [type AccountID string](#AccountID)
    * [type RepoID string](#RepoID)
    * [type RepoIDType string](#RepoIDType)
    * [type RateLimitConfig struct](#RateLimitConfig)
        * [func ExtractRateLimitConfig(config, kind, displayName string) (RateLimitConfig, error)](#ExtractRateLimitConfig)
        * [func GetLimitFromConfig(kind string, config interface{}) (rlc RateLimitConfig, err error)](#GetLimitFromConfig)
    * [type ErrRateLimitUnsupported struct](#ErrRateLimitUnsupported)
        * [func (e ErrRateLimitUnsupported) Error() string](#ErrRateLimitUnsupported.Error)
    * [type OtherRepoMetadata struct](#OtherRepoMetadata)
* [Functions](#func)
    * [func IsHostOfRepo(c *CodeHost, repo *api.ExternalRepoSpec) bool](#IsHostOfRepo)
    * [func IsHostOfAccount(c *CodeHost, account *Account) bool](#IsHostOfAccount)
    * [func NormalizeBaseURL(baseURL *url.URL) *url.URL](#NormalizeBaseURL)
    * [func mustParseURL(rawurl string) *url.URL](#mustParseURL)
    * [func setJSONOrError(field **json.RawMessage, value interface{})](#setJSONOrError)
    * [func getJSONOrError(field *json.RawMessage, v interface{}) error](#getJSONOrError)
    * [func KindToType(kind string) string](#KindToType)
    * [func TypeToKind(t string) string](#TypeToKind)
    * [func ParseServiceType(s string) (string, bool)](#ParseServiceType)
    * [func ParseServiceKind(s string) (string, bool)](#ParseServiceKind)
    * [func ParseConfig(kind, config string) (cfg interface{}, _ error)](#ParseConfig)
    * [func WebhookURL(kind string, externalServiceID int64, externalURL string) string](#WebhookURL)
    * [func limitOrInf(enabled bool, perHour float64) rate.Limit](#limitOrInf)
    * [func URN(kind string, id int64) string](#URN)
    * [func DecodeURN(urn string) (kind string, id int64)](#DecodeURN)
    * [func TestCodeHostOf(t *testing.T)](#TestCodeHostOf)
    * [func TestExtractRateLimitConfig(t *testing.T)](#TestExtractRateLimitConfig)
    * [func TestEncodeURN(t *testing.T)](#TestEncodeURN)
    * [func TestDecodeURN(t *testing.T)](#TestDecodeURN)


## <a id="const" href="#const">Constants</a>

```
tags: [private]
```

### <a id="KindAWSCodeCommit" href="#KindAWSCodeCommit">const KindAWSCodeCommit</a>

```
searchKey: extsvc.KindAWSCodeCommit
```

```Go
const KindAWSCodeCommit = "AWSCODECOMMIT"
```

### <a id="KindBitbucketServer" href="#KindBitbucketServer">const KindBitbucketServer</a>

```
searchKey: extsvc.KindBitbucketServer
```

```Go
const KindBitbucketServer = "BITBUCKETSERVER"
```

### <a id="KindBitbucketCloud" href="#KindBitbucketCloud">const KindBitbucketCloud</a>

```
searchKey: extsvc.KindBitbucketCloud
```

```Go
const KindBitbucketCloud = "BITBUCKETCLOUD"
```

### <a id="KindGitHub" href="#KindGitHub">const KindGitHub</a>

```
searchKey: extsvc.KindGitHub
```

```Go
const KindGitHub = "GITHUB"
```

### <a id="KindGitLab" href="#KindGitLab">const KindGitLab</a>

```
searchKey: extsvc.KindGitLab
```

```Go
const KindGitLab = "GITLAB"
```

### <a id="KindGitolite" href="#KindGitolite">const KindGitolite</a>

```
searchKey: extsvc.KindGitolite
```

```Go
const KindGitolite = "GITOLITE"
```

### <a id="KindPerforce" href="#KindPerforce">const KindPerforce</a>

```
searchKey: extsvc.KindPerforce
```

```Go
const KindPerforce = "PERFORCE"
```

### <a id="KindPhabricator" href="#KindPhabricator">const KindPhabricator</a>

```
searchKey: extsvc.KindPhabricator
```

```Go
const KindPhabricator = "PHABRICATOR"
```

### <a id="KindOther" href="#KindOther">const KindOther</a>

```
searchKey: extsvc.KindOther
```

```Go
const KindOther = "OTHER"
```

### <a id="TypeAWSCodeCommit" href="#TypeAWSCodeCommit">const TypeAWSCodeCommit</a>

```
searchKey: extsvc.TypeAWSCodeCommit
```

```Go
const TypeAWSCodeCommit = "awscodecommit"
```

TypeAWSCodeCommit is the (api.ExternalRepoSpec).ServiceType value for AWS CodeCommit repositories. The ServiceID value is the ARN (Amazon Resource Name) omitting the repository name suffix (e.g., "arn:aws:codecommit:us-west-1:123456789:"). 

### <a id="TypeBitbucketServer" href="#TypeBitbucketServer">const TypeBitbucketServer</a>

```
searchKey: extsvc.TypeBitbucketServer
```

```Go
const TypeBitbucketServer = "bitbucketServer"
```

TypeBitbucketServer is the (api.ExternalRepoSpec).ServiceType value for Bitbucket Server projects. The ServiceID value is the base URL to the Bitbucket Server instance. 

### <a id="TypeBitbucketCloud" href="#TypeBitbucketCloud">const TypeBitbucketCloud</a>

```
searchKey: extsvc.TypeBitbucketCloud
```

```Go
const TypeBitbucketCloud = "bitbucketCloud"
```

TypeBitbucketCloud is the (api.ExternalRepoSpec).ServiceType value for Bitbucket Cloud projects. The ServiceID value is the base URL to the Bitbucket Cloud. 

### <a id="TypeGitHub" href="#TypeGitHub">const TypeGitHub</a>

```
searchKey: extsvc.TypeGitHub
```

```Go
const TypeGitHub = "github"
```

TypeGitHub is the (api.ExternalRepoSpec).ServiceType value for GitHub repositories. The ServiceID value is the base URL to the GitHub instance ([https://github.com](https://github.com) or the GitHub Enterprise URL). 

### <a id="TypeGitLab" href="#TypeGitLab">const TypeGitLab</a>

```
searchKey: extsvc.TypeGitLab
```

```Go
const TypeGitLab = "gitlab"
```

TypeGitLab is the (api.ExternalRepoSpec).ServiceType value for GitLab projects. The ServiceID value is the base URL to the GitLab instance ([https://gitlab.com](https://gitlab.com) or self-hosted GitLab URL). 

### <a id="TypeGitolite" href="#TypeGitolite">const TypeGitolite</a>

```
searchKey: extsvc.TypeGitolite
```

```Go
const TypeGitolite = "gitolite"
```

TypeGitolite is the (api.ExternalRepoSpec).ServiceType value for Gitolite projects. 

### <a id="TypePerforce" href="#TypePerforce">const TypePerforce</a>

```
searchKey: extsvc.TypePerforce
```

```Go
const TypePerforce = "perforce"
```

TypePerforce is the (api.ExternalRepoSpec).ServiceType value for Perforce projects. 

### <a id="TypePhabricator" href="#TypePhabricator">const TypePhabricator</a>

```
searchKey: extsvc.TypePhabricator
```

```Go
const TypePhabricator = "phabricator"
```

TypePhabricator is the (api.ExternalRepoSpec).ServiceType value for Phabricator projects. 

### <a id="TypeOther" href="#TypeOther">const TypeOther</a>

```
searchKey: extsvc.TypeOther
```

```Go
const TypeOther = "other"
```

TypeOther is the (api.ExternalRepoSpec).ServiceType value for other projects. 

### <a id="IDParam" href="#IDParam">const IDParam</a>

```
searchKey: extsvc.IDParam
```

```Go
const IDParam = "externalServiceID"
```

## <a id="var" href="#var">Variables</a>

```
tags: [private]
```

### <a id="GitHubDotComURL" href="#GitHubDotComURL">var GitHubDotComURL</a>

```
searchKey: extsvc.GitHubDotComURL
```

```Go
var GitHubDotComURL = mustParseURL("https://github.com")
```

Known public code hosts and their URLs 

### <a id="GitHubDotCom" href="#GitHubDotCom">var GitHubDotCom</a>

```
searchKey: extsvc.GitHubDotCom
```

```Go
var GitHubDotCom = NewCodeHost(GitHubDotComURL, TypeGitHub)
```

Known public code hosts and their URLs 

### <a id="GitLabDotComURL" href="#GitLabDotComURL">var GitLabDotComURL</a>

```
searchKey: extsvc.GitLabDotComURL
```

```Go
var GitLabDotComURL = mustParseURL("https://gitlab.com")
```

Known public code hosts and their URLs 

### <a id="GitLabDotCom" href="#GitLabDotCom">var GitLabDotCom</a>

```
searchKey: extsvc.GitLabDotCom
```

```Go
var GitLabDotCom = NewCodeHost(GitLabDotComURL, TypeGitLab)
```

Known public code hosts and their URLs 

### <a id="PublicCodeHosts" href="#PublicCodeHosts">var PublicCodeHosts</a>

```
searchKey: extsvc.PublicCodeHosts
```

```Go
var PublicCodeHosts = []*CodeHost{
	GitHubDotCom,
	GitLabDotCom,
}
```

Known public code hosts and their URLs 

### <a id="bbsLower" href="#bbsLower">var bbsLower</a>

```
searchKey: extsvc.bbsLower
tags: [private]
```

```Go
var bbsLower = strings.ToLower(TypeBitbucketServer)
```

Precompute these for use in ParseServiceType below since the constants are mixed case 

### <a id="bbcLower" href="#bbcLower">var bbcLower</a>

```
searchKey: extsvc.bbcLower
tags: [private]
```

```Go
var bbcLower = strings.ToLower(TypeBitbucketCloud)
```

## <a id="type" href="#type">Types</a>

```
tags: [private]
```

### <a id="CodeHost" href="#CodeHost">type CodeHost struct</a>

```
searchKey: extsvc.CodeHost
```

```Go
type CodeHost struct {
	ServiceID   string
	ServiceType string
	BaseURL     *url.URL
}
```

#### <a id="NewCodeHost" href="#NewCodeHost">func NewCodeHost(baseURL *url.URL, serviceType string) *CodeHost</a>

```
searchKey: extsvc.NewCodeHost
```

```Go
func NewCodeHost(baseURL *url.URL, serviceType string) *CodeHost
```

#### <a id="CodeHostOf" href="#CodeHostOf">func CodeHostOf(name api.RepoName, codehosts ...*CodeHost) *CodeHost</a>

```
searchKey: extsvc.CodeHostOf
```

```Go
func CodeHostOf(name api.RepoName, codehosts ...*CodeHost) *CodeHost
```

CodeHostOf returns the CodeHost of the given repo, if any, as determined by a common prefix between the repo name and the code hosts' URL hostname component. 

### <a id="jsonError" href="#jsonError">type jsonError struct</a>

```
searchKey: extsvc.jsonError
tags: [private]
```

```Go
type jsonError struct {
	Error string `json:"__jsonError"`
}
```

### <a id="Account" href="#Account">type Account struct</a>

```
searchKey: extsvc.Account
```

```Go
type Account struct {
	ID          int32
	UserID      int32
	AccountSpec // ServiceType, ServiceID, ClientID, AccountID
	AccountData // AuthData, Data
	CreatedAt   time.Time
	UpdatedAt   time.Time
}
```

Account represents a row in the `user_external_accounts` table. See the GraphQL API's corresponding fields in "ExternalAccount" for documentation. 

### <a id="AccountSpec" href="#AccountSpec">type AccountSpec struct</a>

```
searchKey: extsvc.AccountSpec
```

```Go
type AccountSpec struct {
	ServiceType string
	ServiceID   string
	ClientID    string
	AccountID   string
}
```

AccountSpec specifies a user external account by its external identifier (i.e., by the identifier provided by the account's owner service), instead of by our database's serial ID. See the GraphQL API's corresponding fields in "ExternalAccount" for documentation. 

### <a id="AccountData" href="#AccountData">type AccountData struct</a>

```
searchKey: extsvc.AccountData
```

```Go
type AccountData struct {
	AuthData *json.RawMessage
	Data     *json.RawMessage
}
```

AccountData contains data that can be freely updated in the user external account after it has been created. See the GraphQL API's corresponding fields for documentation. 

#### <a id="AccountData.SetAccountData" href="#AccountData.SetAccountData">func (d *AccountData) SetAccountData(v interface{})</a>

```
searchKey: extsvc.AccountData.SetAccountData
```

```Go
func (d *AccountData) SetAccountData(v interface{})
```

SetAccountData sets the Data field to the (JSON-encoded) value. If an error occurs during JSON encoding, a JSON object describing the error is written to the field, instead. 

#### <a id="AccountData.SetAuthData" href="#AccountData.SetAuthData">func (d *AccountData) SetAuthData(v interface{})</a>

```
searchKey: extsvc.AccountData.SetAuthData
```

```Go
func (d *AccountData) SetAuthData(v interface{})
```

SetAuthData sets the AuthData field to the (JSON-encoded) value. If an error occurs during JSON encoding, a JSON object describing the error is written to the field, instead. 

#### <a id="AccountData.GetAccountData" href="#AccountData.GetAccountData">func (d *AccountData) GetAccountData(v interface{}) error</a>

```
searchKey: extsvc.AccountData.GetAccountData
```

```Go
func (d *AccountData) GetAccountData(v interface{}) error
```

GetAccountData reads the Data field into the value. The value should be a pointer type to the type that was passed to SetAccountData. 

#### <a id="AccountData.GetAuthData" href="#AccountData.GetAuthData">func (d *AccountData) GetAuthData(v interface{}) error</a>

```
searchKey: extsvc.AccountData.GetAuthData
```

```Go
func (d *AccountData) GetAuthData(v interface{}) error
```

GetAuthData reads the AuthData field into the value. The value should be a pointer type to the type that was passed to SetAuthData. 

### <a id="Repository" href="#Repository">type Repository struct</a>

```
searchKey: extsvc.Repository
```

```Go
type Repository struct {
	// URI is the full name for this repository, e.g. "github.com/user/repo".
	URI string
	api.ExternalRepoSpec
}
```

Repository contains necessary information to identify an external repository on the code host. 

### <a id="Accounts" href="#Accounts">type Accounts struct</a>

```
searchKey: extsvc.Accounts
```

```Go
type Accounts struct {
	ServiceType string
	ServiceID   string
	AccountIDs  []string
}
```

Accounts contains a list of accounts that belong to the same external service. All fields have a same meaning to AccountSpec. See GraphQL API's corresponding fields in "ExternalAccount" for documentation. 

#### <a id="Accounts.TracingFields" href="#Accounts.TracingFields">func (s *Accounts) TracingFields() []otlog.Field</a>

```
searchKey: extsvc.Accounts.TracingFields
```

```Go
func (s *Accounts) TracingFields() []otlog.Field
```

TracingFields returns tracing fields for the opentracing log. 

### <a id="AccountID" href="#AccountID">type AccountID string</a>

```
searchKey: extsvc.AccountID
```

```Go
type AccountID string
```

AccountID is a descriptive type for the external identifier of an external account on the code host. It can be the string representation of an integer (e.g. GitLab), a GraphQL ID (e.g. GitHub), or a username (e.g. Bitbucket Server) depends on the code host type. 

### <a id="RepoID" href="#RepoID">type RepoID string</a>

```
searchKey: extsvc.RepoID
```

```Go
type RepoID string
```

RepoID is a descriptive type for the external identifier of an external repository on the code host. It can be the string representation of an integer (e.g. GitLab and Bitbucket Server) or a GraphQL ID (e.g. GitHub) depends on the code host type. 

### <a id="RepoIDType" href="#RepoIDType">type RepoIDType string</a>

```
searchKey: extsvc.RepoIDType
```

```Go
type RepoIDType string
```

RepoIDType indicates the type of the RepoID. 

### <a id="RateLimitConfig" href="#RateLimitConfig">type RateLimitConfig struct</a>

```
searchKey: extsvc.RateLimitConfig
```

```Go
type RateLimitConfig struct {
	BaseURL     string
	DisplayName string
	Limit       rate.Limit
	IsDefault   bool
}
```

RateLimitConfig represents the internal rate limit configured for an external service 

#### <a id="ExtractRateLimitConfig" href="#ExtractRateLimitConfig">func ExtractRateLimitConfig(config, kind, displayName string) (RateLimitConfig, error)</a>

```
searchKey: extsvc.ExtractRateLimitConfig
```

```Go
func ExtractRateLimitConfig(config, kind, displayName string) (RateLimitConfig, error)
```

ExtractRateLimitConfig extracts the rate limit config from the given args. If rate limiting is not supported the error returned will be an ErrRateLimitUnsupported. 

#### <a id="GetLimitFromConfig" href="#GetLimitFromConfig">func GetLimitFromConfig(kind string, config interface{}) (rlc RateLimitConfig, err error)</a>

```
searchKey: extsvc.GetLimitFromConfig
```

```Go
func GetLimitFromConfig(kind string, config interface{}) (rlc RateLimitConfig, err error)
```

GetLimitFromConfig gets RateLimitConfig from an already parsed config schema. 

### <a id="ErrRateLimitUnsupported" href="#ErrRateLimitUnsupported">type ErrRateLimitUnsupported struct</a>

```
searchKey: extsvc.ErrRateLimitUnsupported
```

```Go
type ErrRateLimitUnsupported struct {
	codehostKind string
}
```

#### <a id="ErrRateLimitUnsupported.Error" href="#ErrRateLimitUnsupported.Error">func (e ErrRateLimitUnsupported) Error() string</a>

```
searchKey: extsvc.ErrRateLimitUnsupported.Error
```

```Go
func (e ErrRateLimitUnsupported) Error() string
```

### <a id="OtherRepoMetadata" href="#OtherRepoMetadata">type OtherRepoMetadata struct</a>

```
searchKey: extsvc.OtherRepoMetadata
```

```Go
type OtherRepoMetadata struct {
	// RelativePath is relative to ServiceID which is usually the host URL.
	// Joining them gives you the clone url.
	RelativePath string
}
```

## <a id="func" href="#func">Functions</a>

```
tags: [private]
```

### <a id="IsHostOfRepo" href="#IsHostOfRepo">func IsHostOfRepo(c *CodeHost, repo *api.ExternalRepoSpec) bool</a>

```
searchKey: extsvc.IsHostOfRepo
```

```Go
func IsHostOfRepo(c *CodeHost, repo *api.ExternalRepoSpec) bool
```

IsHostOfRepo returns true if the repository belongs to given code host. 

### <a id="IsHostOfAccount" href="#IsHostOfAccount">func IsHostOfAccount(c *CodeHost, account *Account) bool</a>

```
searchKey: extsvc.IsHostOfAccount
```

```Go
func IsHostOfAccount(c *CodeHost, account *Account) bool
```

IsHostOfAccount returns true if the account belongs to given code host. 

### <a id="NormalizeBaseURL" href="#NormalizeBaseURL">func NormalizeBaseURL(baseURL *url.URL) *url.URL</a>

```
searchKey: extsvc.NormalizeBaseURL
```

```Go
func NormalizeBaseURL(baseURL *url.URL) *url.URL
```

NormalizeBaseURL modifies the input and returns a normalized form of the a base URL with insignificant differences (such as in presence of a trailing slash, or hostname case) eliminated. Its return value should be used for the (ExternalRepoSpec).ServiceID field (and passed to XyzExternalRepoSpec) instead of a non-normalized base URL. 

### <a id="mustParseURL" href="#mustParseURL">func mustParseURL(rawurl string) *url.URL</a>

```
searchKey: extsvc.mustParseURL
tags: [private]
```

```Go
func mustParseURL(rawurl string) *url.URL
```

### <a id="setJSONOrError" href="#setJSONOrError">func setJSONOrError(field **json.RawMessage, value interface{})</a>

```
searchKey: extsvc.setJSONOrError
tags: [private]
```

```Go
func setJSONOrError(field **json.RawMessage, value interface{})
```

### <a id="getJSONOrError" href="#getJSONOrError">func getJSONOrError(field *json.RawMessage, v interface{}) error</a>

```
searchKey: extsvc.getJSONOrError
tags: [private]
```

```Go
func getJSONOrError(field *json.RawMessage, v interface{}) error
```

### <a id="KindToType" href="#KindToType">func KindToType(kind string) string</a>

```
searchKey: extsvc.KindToType
```

```Go
func KindToType(kind string) string
```

KindToType returns a Type constants given a Kind It will panic when given an unknown kind 

### <a id="TypeToKind" href="#TypeToKind">func TypeToKind(t string) string</a>

```
searchKey: extsvc.TypeToKind
```

```Go
func TypeToKind(t string) string
```

TypeToKind returns a Kind constants given a Type It will panic when given an unknown type. 

### <a id="ParseServiceType" href="#ParseServiceType">func ParseServiceType(s string) (string, bool)</a>

```
searchKey: extsvc.ParseServiceType
```

```Go
func ParseServiceType(s string) (string, bool)
```

ParseServiceType will return a ServiceType constant after doing a case insensitive match on s. It returns ("", false) if no match was found. 

### <a id="ParseServiceKind" href="#ParseServiceKind">func ParseServiceKind(s string) (string, bool)</a>

```
searchKey: extsvc.ParseServiceKind
```

```Go
func ParseServiceKind(s string) (string, bool)
```

ParseServiceKind will return a ServiceKind constant after doing a case insensitive match on s. It returns ("", false) if no match was found. 

### <a id="ParseConfig" href="#ParseConfig">func ParseConfig(kind, config string) (cfg interface{}, _ error)</a>

```
searchKey: extsvc.ParseConfig
```

```Go
func ParseConfig(kind, config string) (cfg interface{}, _ error)
```

ParseConfig attempts to unmarshal the given JSON config into a configuration struct defined in the schema package. 

### <a id="WebhookURL" href="#WebhookURL">func WebhookURL(kind string, externalServiceID int64, externalURL string) string</a>

```
searchKey: extsvc.WebhookURL
```

```Go
func WebhookURL(kind string, externalServiceID int64, externalURL string) string
```

### <a id="limitOrInf" href="#limitOrInf">func limitOrInf(enabled bool, perHour float64) rate.Limit</a>

```
searchKey: extsvc.limitOrInf
tags: [private]
```

```Go
func limitOrInf(enabled bool, perHour float64) rate.Limit
```

### <a id="URN" href="#URN">func URN(kind string, id int64) string</a>

```
searchKey: extsvc.URN
```

```Go
func URN(kind string, id int64) string
```

URN returns a unique resource identifier of an external service by given kind and ID. 

### <a id="DecodeURN" href="#DecodeURN">func DecodeURN(urn string) (kind string, id int64)</a>

```
searchKey: extsvc.DecodeURN
```

```Go
func DecodeURN(urn string) (kind string, id int64)
```

DecodeURN returns the kind of the external service and its ID. 

### <a id="TestCodeHostOf" href="#TestCodeHostOf">func TestCodeHostOf(t *testing.T)</a>

```
searchKey: extsvc.TestCodeHostOf
tags: [private]
```

```Go
func TestCodeHostOf(t *testing.T)
```

### <a id="TestExtractRateLimitConfig" href="#TestExtractRateLimitConfig">func TestExtractRateLimitConfig(t *testing.T)</a>

```
searchKey: extsvc.TestExtractRateLimitConfig
tags: [private]
```

```Go
func TestExtractRateLimitConfig(t *testing.T)
```

### <a id="TestEncodeURN" href="#TestEncodeURN">func TestEncodeURN(t *testing.T)</a>

```
searchKey: extsvc.TestEncodeURN
tags: [private]
```

```Go
func TestEncodeURN(t *testing.T)
```

### <a id="TestDecodeURN" href="#TestDecodeURN">func TestDecodeURN(t *testing.T)</a>

```
searchKey: extsvc.TestDecodeURN
tags: [private]
```

```Go
func TestDecodeURN(t *testing.T)
```

