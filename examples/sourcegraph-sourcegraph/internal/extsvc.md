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
    * [const IDParam](#IDParam)
    * [const KindAWSCodeCommit](#KindAWSCodeCommit)
    * [const KindBitbucketCloud](#KindBitbucketCloud)
    * [const KindBitbucketServer](#KindBitbucketServer)
    * [const KindGitHub](#KindGitHub)
    * [const KindGitLab](#KindGitLab)
    * [const KindGitolite](#KindGitolite)
    * [const KindOther](#KindOther)
    * [const KindPerforce](#KindPerforce)
    * [const KindPhabricator](#KindPhabricator)
    * [const TypeAWSCodeCommit](#TypeAWSCodeCommit)
    * [const TypeBitbucketCloud](#TypeBitbucketCloud)
    * [const TypeBitbucketServer](#TypeBitbucketServer)
    * [const TypeGitHub](#TypeGitHub)
    * [const TypeGitLab](#TypeGitLab)
    * [const TypeGitolite](#TypeGitolite)
    * [const TypeOther](#TypeOther)
    * [const TypePerforce](#TypePerforce)
    * [const TypePhabricator](#TypePhabricator)
* [Variables](#var)
    * [var GitHubDotCom](#GitHubDotCom)
    * [var GitHubDotComURL](#GitHubDotComURL)
    * [var GitLabDotCom](#GitLabDotCom)
    * [var GitLabDotComURL](#GitLabDotComURL)
    * [var PublicCodeHosts](#PublicCodeHosts)
    * [var bbcLower](#bbcLower)
    * [var bbsLower](#bbsLower)
* [Types](#type)
    * [type Account struct](#Account)
    * [type AccountData struct](#AccountData)
        * [func (d *AccountData) GetAccountData(v interface{}) error](#AccountData.GetAccountData)
        * [func (d *AccountData) GetAuthData(v interface{}) error](#AccountData.GetAuthData)
        * [func (d *AccountData) SetAccountData(v interface{})](#AccountData.SetAccountData)
        * [func (d *AccountData) SetAuthData(v interface{})](#AccountData.SetAuthData)
    * [type AccountID string](#AccountID)
    * [type AccountSpec struct](#AccountSpec)
    * [type Accounts struct](#Accounts)
        * [func (s *Accounts) TracingFields() []otlog.Field](#Accounts.TracingFields)
    * [type CodeHost struct](#CodeHost)
        * [func CodeHostOf(name api.RepoName, codehosts ...*CodeHost) *CodeHost](#CodeHostOf)
        * [func NewCodeHost(baseURL *url.URL, serviceType string) *CodeHost](#NewCodeHost)
    * [type ErrRateLimitUnsupported struct](#ErrRateLimitUnsupported)
        * [func (e ErrRateLimitUnsupported) Error() string](#ErrRateLimitUnsupported.Error)
    * [type OtherRepoMetadata struct](#OtherRepoMetadata)
    * [type RateLimitConfig struct](#RateLimitConfig)
        * [func ExtractRateLimitConfig(config, kind, displayName string) (RateLimitConfig, error)](#ExtractRateLimitConfig)
        * [func GetLimitFromConfig(kind string, config interface{}) (rlc RateLimitConfig, err error)](#GetLimitFromConfig)
    * [type RepoID string](#RepoID)
    * [type RepoIDType string](#RepoIDType)
    * [type Repository struct](#Repository)
    * [type jsonError struct](#jsonError)
* [Functions](#func)
    * [func DecodeURN(urn string) (kind string, id int64)](#DecodeURN)
    * [func IsHostOfAccount(c *CodeHost, account *Account) bool](#IsHostOfAccount)
    * [func IsHostOfRepo(c *CodeHost, repo *api.ExternalRepoSpec) bool](#IsHostOfRepo)
    * [func KindToType(kind string) string](#KindToType)
    * [func NormalizeBaseURL(baseURL *url.URL) *url.URL](#NormalizeBaseURL)
    * [func ParseConfig(kind, config string) (cfg interface{}, _ error)](#ParseConfig)
    * [func ParseServiceKind(s string) (string, bool)](#ParseServiceKind)
    * [func ParseServiceType(s string) (string, bool)](#ParseServiceType)
    * [func TestCodeHostOf(t *testing.T)](#TestCodeHostOf)
    * [func TestDecodeURN(t *testing.T)](#TestDecodeURN)
    * [func TestEncodeURN(t *testing.T)](#TestEncodeURN)
    * [func TestExtractRateLimitConfig(t *testing.T)](#TestExtractRateLimitConfig)
    * [func TypeToKind(t string) string](#TypeToKind)
    * [func URN(kind string, id int64) string](#URN)
    * [func WebhookURL(kind string, externalServiceID int64, externalURL string) string](#WebhookURL)
    * [func getJSONOrError(field *json.RawMessage, v interface{}) error](#getJSONOrError)
    * [func limitOrInf(enabled bool, perHour float64) rate.Limit](#limitOrInf)
    * [func mustParseURL(rawurl string) *url.URL](#mustParseURL)
    * [func setJSONOrError(field **json.RawMessage, value interface{})](#setJSONOrError)


## <a id="const" href="#const">Constants</a>

```
tags: [package private]
```

### <a id="IDParam" href="#IDParam">const IDParam</a>

```
searchKey: extsvc.IDParam
tags: [constant string]
```

```Go
const IDParam = "externalServiceID"
```

### <a id="KindAWSCodeCommit" href="#KindAWSCodeCommit">const KindAWSCodeCommit</a>

```
searchKey: extsvc.KindAWSCodeCommit
tags: [constant string]
```

```Go
const KindAWSCodeCommit = "AWSCODECOMMIT"
```

### <a id="KindBitbucketCloud" href="#KindBitbucketCloud">const KindBitbucketCloud</a>

```
searchKey: extsvc.KindBitbucketCloud
tags: [constant string]
```

```Go
const KindBitbucketCloud = "BITBUCKETCLOUD"
```

### <a id="KindBitbucketServer" href="#KindBitbucketServer">const KindBitbucketServer</a>

```
searchKey: extsvc.KindBitbucketServer
tags: [constant string]
```

```Go
const KindBitbucketServer = "BITBUCKETSERVER"
```

### <a id="KindGitHub" href="#KindGitHub">const KindGitHub</a>

```
searchKey: extsvc.KindGitHub
tags: [constant string]
```

```Go
const KindGitHub = "GITHUB"
```

### <a id="KindGitLab" href="#KindGitLab">const KindGitLab</a>

```
searchKey: extsvc.KindGitLab
tags: [constant string]
```

```Go
const KindGitLab = "GITLAB"
```

### <a id="KindGitolite" href="#KindGitolite">const KindGitolite</a>

```
searchKey: extsvc.KindGitolite
tags: [constant string]
```

```Go
const KindGitolite = "GITOLITE"
```

### <a id="KindOther" href="#KindOther">const KindOther</a>

```
searchKey: extsvc.KindOther
tags: [constant string]
```

```Go
const KindOther = "OTHER"
```

### <a id="KindPerforce" href="#KindPerforce">const KindPerforce</a>

```
searchKey: extsvc.KindPerforce
tags: [constant string]
```

```Go
const KindPerforce = "PERFORCE"
```

### <a id="KindPhabricator" href="#KindPhabricator">const KindPhabricator</a>

```
searchKey: extsvc.KindPhabricator
tags: [constant string]
```

```Go
const KindPhabricator = "PHABRICATOR"
```

### <a id="TypeAWSCodeCommit" href="#TypeAWSCodeCommit">const TypeAWSCodeCommit</a>

```
searchKey: extsvc.TypeAWSCodeCommit
tags: [constant string]
```

```Go
const TypeAWSCodeCommit = "awscodecommit"
```

TypeAWSCodeCommit is the (api.ExternalRepoSpec).ServiceType value for AWS CodeCommit repositories. The ServiceID value is the ARN (Amazon Resource Name) omitting the repository name suffix (e.g., "arn:aws:codecommit:us-west-1:123456789:"). 

### <a id="TypeBitbucketCloud" href="#TypeBitbucketCloud">const TypeBitbucketCloud</a>

```
searchKey: extsvc.TypeBitbucketCloud
tags: [constant string]
```

```Go
const TypeBitbucketCloud = "bitbucketCloud"
```

TypeBitbucketCloud is the (api.ExternalRepoSpec).ServiceType value for Bitbucket Cloud projects. The ServiceID value is the base URL to the Bitbucket Cloud. 

### <a id="TypeBitbucketServer" href="#TypeBitbucketServer">const TypeBitbucketServer</a>

```
searchKey: extsvc.TypeBitbucketServer
tags: [constant string]
```

```Go
const TypeBitbucketServer = "bitbucketServer"
```

TypeBitbucketServer is the (api.ExternalRepoSpec).ServiceType value for Bitbucket Server projects. The ServiceID value is the base URL to the Bitbucket Server instance. 

### <a id="TypeGitHub" href="#TypeGitHub">const TypeGitHub</a>

```
searchKey: extsvc.TypeGitHub
tags: [constant string]
```

```Go
const TypeGitHub = "github"
```

TypeGitHub is the (api.ExternalRepoSpec).ServiceType value for GitHub repositories. The ServiceID value is the base URL to the GitHub instance ([https://github.com](https://github.com) or the GitHub Enterprise URL). 

### <a id="TypeGitLab" href="#TypeGitLab">const TypeGitLab</a>

```
searchKey: extsvc.TypeGitLab
tags: [constant string]
```

```Go
const TypeGitLab = "gitlab"
```

TypeGitLab is the (api.ExternalRepoSpec).ServiceType value for GitLab projects. The ServiceID value is the base URL to the GitLab instance ([https://gitlab.com](https://gitlab.com) or self-hosted GitLab URL). 

### <a id="TypeGitolite" href="#TypeGitolite">const TypeGitolite</a>

```
searchKey: extsvc.TypeGitolite
tags: [constant string]
```

```Go
const TypeGitolite = "gitolite"
```

TypeGitolite is the (api.ExternalRepoSpec).ServiceType value for Gitolite projects. 

### <a id="TypeOther" href="#TypeOther">const TypeOther</a>

```
searchKey: extsvc.TypeOther
tags: [constant string]
```

```Go
const TypeOther = "other"
```

TypeOther is the (api.ExternalRepoSpec).ServiceType value for other projects. 

### <a id="TypePerforce" href="#TypePerforce">const TypePerforce</a>

```
searchKey: extsvc.TypePerforce
tags: [constant string]
```

```Go
const TypePerforce = "perforce"
```

TypePerforce is the (api.ExternalRepoSpec).ServiceType value for Perforce projects. 

### <a id="TypePhabricator" href="#TypePhabricator">const TypePhabricator</a>

```
searchKey: extsvc.TypePhabricator
tags: [constant string]
```

```Go
const TypePhabricator = "phabricator"
```

TypePhabricator is the (api.ExternalRepoSpec).ServiceType value for Phabricator projects. 

## <a id="var" href="#var">Variables</a>

```
tags: [package private]
```

### <a id="GitHubDotCom" href="#GitHubDotCom">var GitHubDotCom</a>

```
searchKey: extsvc.GitHubDotCom
tags: [variable struct]
```

```Go
var GitHubDotCom = NewCodeHost(GitHubDotComURL, TypeGitHub)
```

Known public code hosts and their URLs 

### <a id="GitHubDotComURL" href="#GitHubDotComURL">var GitHubDotComURL</a>

```
searchKey: extsvc.GitHubDotComURL
tags: [variable struct]
```

```Go
var GitHubDotComURL = mustParseURL("https://github.com")
```

Known public code hosts and their URLs 

### <a id="GitLabDotCom" href="#GitLabDotCom">var GitLabDotCom</a>

```
searchKey: extsvc.GitLabDotCom
tags: [variable struct]
```

```Go
var GitLabDotCom = NewCodeHost(GitLabDotComURL, TypeGitLab)
```

Known public code hosts and their URLs 

### <a id="GitLabDotComURL" href="#GitLabDotComURL">var GitLabDotComURL</a>

```
searchKey: extsvc.GitLabDotComURL
tags: [variable struct]
```

```Go
var GitLabDotComURL = mustParseURL("https://gitlab.com")
```

Known public code hosts and their URLs 

### <a id="PublicCodeHosts" href="#PublicCodeHosts">var PublicCodeHosts</a>

```
searchKey: extsvc.PublicCodeHosts
tags: [variable array struct]
```

```Go
var PublicCodeHosts = []*CodeHost{
	GitHubDotCom,
	GitLabDotCom,
}
```

Known public code hosts and their URLs 

### <a id="bbcLower" href="#bbcLower">var bbcLower</a>

```
searchKey: extsvc.bbcLower
tags: [variable string private]
```

```Go
var bbcLower = strings.ToLower(TypeBitbucketCloud)
```

### <a id="bbsLower" href="#bbsLower">var bbsLower</a>

```
searchKey: extsvc.bbsLower
tags: [variable string private]
```

```Go
var bbsLower = strings.ToLower(TypeBitbucketServer)
```

Precompute these for use in ParseServiceType below since the constants are mixed case 

## <a id="type" href="#type">Types</a>

```
tags: [package private]
```

### <a id="Account" href="#Account">type Account struct</a>

```
searchKey: extsvc.Account
tags: [struct]
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

### <a id="AccountData" href="#AccountData">type AccountData struct</a>

```
searchKey: extsvc.AccountData
tags: [struct]
```

```Go
type AccountData struct {
	AuthData *json.RawMessage
	Data     *json.RawMessage
}
```

AccountData contains data that can be freely updated in the user external account after it has been created. See the GraphQL API's corresponding fields for documentation. 

#### <a id="AccountData.GetAccountData" href="#AccountData.GetAccountData">func (d *AccountData) GetAccountData(v interface{}) error</a>

```
searchKey: extsvc.AccountData.GetAccountData
tags: [method]
```

```Go
func (d *AccountData) GetAccountData(v interface{}) error
```

GetAccountData reads the Data field into the value. The value should be a pointer type to the type that was passed to SetAccountData. 

#### <a id="AccountData.GetAuthData" href="#AccountData.GetAuthData">func (d *AccountData) GetAuthData(v interface{}) error</a>

```
searchKey: extsvc.AccountData.GetAuthData
tags: [method]
```

```Go
func (d *AccountData) GetAuthData(v interface{}) error
```

GetAuthData reads the AuthData field into the value. The value should be a pointer type to the type that was passed to SetAuthData. 

#### <a id="AccountData.SetAccountData" href="#AccountData.SetAccountData">func (d *AccountData) SetAccountData(v interface{})</a>

```
searchKey: extsvc.AccountData.SetAccountData
tags: [method]
```

```Go
func (d *AccountData) SetAccountData(v interface{})
```

SetAccountData sets the Data field to the (JSON-encoded) value. If an error occurs during JSON encoding, a JSON object describing the error is written to the field, instead. 

#### <a id="AccountData.SetAuthData" href="#AccountData.SetAuthData">func (d *AccountData) SetAuthData(v interface{})</a>

```
searchKey: extsvc.AccountData.SetAuthData
tags: [method]
```

```Go
func (d *AccountData) SetAuthData(v interface{})
```

SetAuthData sets the AuthData field to the (JSON-encoded) value. If an error occurs during JSON encoding, a JSON object describing the error is written to the field, instead. 

### <a id="AccountID" href="#AccountID">type AccountID string</a>

```
searchKey: extsvc.AccountID
tags: [string]
```

```Go
type AccountID string
```

AccountID is a descriptive type for the external identifier of an external account on the code host. It can be the string representation of an integer (e.g. GitLab), a GraphQL ID (e.g. GitHub), or a username (e.g. Bitbucket Server) depends on the code host type. 

### <a id="AccountSpec" href="#AccountSpec">type AccountSpec struct</a>

```
searchKey: extsvc.AccountSpec
tags: [struct]
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

### <a id="Accounts" href="#Accounts">type Accounts struct</a>

```
searchKey: extsvc.Accounts
tags: [struct]
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
tags: [function]
```

```Go
func (s *Accounts) TracingFields() []otlog.Field
```

TracingFields returns tracing fields for the opentracing log. 

### <a id="CodeHost" href="#CodeHost">type CodeHost struct</a>

```
searchKey: extsvc.CodeHost
tags: [struct]
```

```Go
type CodeHost struct {
	ServiceID   string
	ServiceType string
	BaseURL     *url.URL
}
```

#### <a id="CodeHostOf" href="#CodeHostOf">func CodeHostOf(name api.RepoName, codehosts ...*CodeHost) *CodeHost</a>

```
searchKey: extsvc.CodeHostOf
tags: [method]
```

```Go
func CodeHostOf(name api.RepoName, codehosts ...*CodeHost) *CodeHost
```

CodeHostOf returns the CodeHost of the given repo, if any, as determined by a common prefix between the repo name and the code hosts' URL hostname component. 

#### <a id="NewCodeHost" href="#NewCodeHost">func NewCodeHost(baseURL *url.URL, serviceType string) *CodeHost</a>

```
searchKey: extsvc.NewCodeHost
tags: [method]
```

```Go
func NewCodeHost(baseURL *url.URL, serviceType string) *CodeHost
```

### <a id="ErrRateLimitUnsupported" href="#ErrRateLimitUnsupported">type ErrRateLimitUnsupported struct</a>

```
searchKey: extsvc.ErrRateLimitUnsupported
tags: [struct]
```

```Go
type ErrRateLimitUnsupported struct {
	codehostKind string
}
```

#### <a id="ErrRateLimitUnsupported.Error" href="#ErrRateLimitUnsupported.Error">func (e ErrRateLimitUnsupported) Error() string</a>

```
searchKey: extsvc.ErrRateLimitUnsupported.Error
tags: [function]
```

```Go
func (e ErrRateLimitUnsupported) Error() string
```

### <a id="OtherRepoMetadata" href="#OtherRepoMetadata">type OtherRepoMetadata struct</a>

```
searchKey: extsvc.OtherRepoMetadata
tags: [struct]
```

```Go
type OtherRepoMetadata struct {
	// RelativePath is relative to ServiceID which is usually the host URL.
	// Joining them gives you the clone url.
	RelativePath string
}
```

### <a id="RateLimitConfig" href="#RateLimitConfig">type RateLimitConfig struct</a>

```
searchKey: extsvc.RateLimitConfig
tags: [struct]
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
tags: [method]
```

```Go
func ExtractRateLimitConfig(config, kind, displayName string) (RateLimitConfig, error)
```

ExtractRateLimitConfig extracts the rate limit config from the given args. If rate limiting is not supported the error returned will be an ErrRateLimitUnsupported. 

#### <a id="GetLimitFromConfig" href="#GetLimitFromConfig">func GetLimitFromConfig(kind string, config interface{}) (rlc RateLimitConfig, err error)</a>

```
searchKey: extsvc.GetLimitFromConfig
tags: [method]
```

```Go
func GetLimitFromConfig(kind string, config interface{}) (rlc RateLimitConfig, err error)
```

GetLimitFromConfig gets RateLimitConfig from an already parsed config schema. 

### <a id="RepoID" href="#RepoID">type RepoID string</a>

```
searchKey: extsvc.RepoID
tags: [string]
```

```Go
type RepoID string
```

RepoID is a descriptive type for the external identifier of an external repository on the code host. It can be the string representation of an integer (e.g. GitLab and Bitbucket Server) or a GraphQL ID (e.g. GitHub) depends on the code host type. 

### <a id="RepoIDType" href="#RepoIDType">type RepoIDType string</a>

```
searchKey: extsvc.RepoIDType
tags: [string]
```

```Go
type RepoIDType string
```

RepoIDType indicates the type of the RepoID. 

### <a id="Repository" href="#Repository">type Repository struct</a>

```
searchKey: extsvc.Repository
tags: [struct]
```

```Go
type Repository struct {
	// URI is the full name for this repository, e.g. "github.com/user/repo".
	URI string
	api.ExternalRepoSpec
}
```

Repository contains necessary information to identify an external repository on the code host. 

### <a id="jsonError" href="#jsonError">type jsonError struct</a>

```
searchKey: extsvc.jsonError
tags: [struct private]
```

```Go
type jsonError struct {
	Error string `json:"__jsonError"`
}
```

## <a id="func" href="#func">Functions</a>

```
tags: [package private]
```

### <a id="DecodeURN" href="#DecodeURN">func DecodeURN(urn string) (kind string, id int64)</a>

```
searchKey: extsvc.DecodeURN
tags: [method]
```

```Go
func DecodeURN(urn string) (kind string, id int64)
```

DecodeURN returns the kind of the external service and its ID. 

### <a id="IsHostOfAccount" href="#IsHostOfAccount">func IsHostOfAccount(c *CodeHost, account *Account) bool</a>

```
searchKey: extsvc.IsHostOfAccount
tags: [method]
```

```Go
func IsHostOfAccount(c *CodeHost, account *Account) bool
```

IsHostOfAccount returns true if the account belongs to given code host. 

### <a id="IsHostOfRepo" href="#IsHostOfRepo">func IsHostOfRepo(c *CodeHost, repo *api.ExternalRepoSpec) bool</a>

```
searchKey: extsvc.IsHostOfRepo
tags: [method]
```

```Go
func IsHostOfRepo(c *CodeHost, repo *api.ExternalRepoSpec) bool
```

IsHostOfRepo returns true if the repository belongs to given code host. 

### <a id="KindToType" href="#KindToType">func KindToType(kind string) string</a>

```
searchKey: extsvc.KindToType
tags: [method]
```

```Go
func KindToType(kind string) string
```

KindToType returns a Type constants given a Kind It will panic when given an unknown kind 

### <a id="NormalizeBaseURL" href="#NormalizeBaseURL">func NormalizeBaseURL(baseURL *url.URL) *url.URL</a>

```
searchKey: extsvc.NormalizeBaseURL
tags: [method]
```

```Go
func NormalizeBaseURL(baseURL *url.URL) *url.URL
```

NormalizeBaseURL modifies the input and returns a normalized form of the a base URL with insignificant differences (such as in presence of a trailing slash, or hostname case) eliminated. Its return value should be used for the (ExternalRepoSpec).ServiceID field (and passed to XyzExternalRepoSpec) instead of a non-normalized base URL. 

### <a id="ParseConfig" href="#ParseConfig">func ParseConfig(kind, config string) (cfg interface{}, _ error)</a>

```
searchKey: extsvc.ParseConfig
tags: [method]
```

```Go
func ParseConfig(kind, config string) (cfg interface{}, _ error)
```

ParseConfig attempts to unmarshal the given JSON config into a configuration struct defined in the schema package. 

### <a id="ParseServiceKind" href="#ParseServiceKind">func ParseServiceKind(s string) (string, bool)</a>

```
searchKey: extsvc.ParseServiceKind
tags: [method]
```

```Go
func ParseServiceKind(s string) (string, bool)
```

ParseServiceKind will return a ServiceKind constant after doing a case insensitive match on s. It returns ("", false) if no match was found. 

### <a id="ParseServiceType" href="#ParseServiceType">func ParseServiceType(s string) (string, bool)</a>

```
searchKey: extsvc.ParseServiceType
tags: [method]
```

```Go
func ParseServiceType(s string) (string, bool)
```

ParseServiceType will return a ServiceType constant after doing a case insensitive match on s. It returns ("", false) if no match was found. 

### <a id="TestCodeHostOf" href="#TestCodeHostOf">func TestCodeHostOf(t *testing.T)</a>

```
searchKey: extsvc.TestCodeHostOf
tags: [method private test]
```

```Go
func TestCodeHostOf(t *testing.T)
```

### <a id="TestDecodeURN" href="#TestDecodeURN">func TestDecodeURN(t *testing.T)</a>

```
searchKey: extsvc.TestDecodeURN
tags: [method private test]
```

```Go
func TestDecodeURN(t *testing.T)
```

### <a id="TestEncodeURN" href="#TestEncodeURN">func TestEncodeURN(t *testing.T)</a>

```
searchKey: extsvc.TestEncodeURN
tags: [method private test]
```

```Go
func TestEncodeURN(t *testing.T)
```

### <a id="TestExtractRateLimitConfig" href="#TestExtractRateLimitConfig">func TestExtractRateLimitConfig(t *testing.T)</a>

```
searchKey: extsvc.TestExtractRateLimitConfig
tags: [method private test]
```

```Go
func TestExtractRateLimitConfig(t *testing.T)
```

### <a id="TypeToKind" href="#TypeToKind">func TypeToKind(t string) string</a>

```
searchKey: extsvc.TypeToKind
tags: [method]
```

```Go
func TypeToKind(t string) string
```

TypeToKind returns a Kind constants given a Type It will panic when given an unknown type. 

### <a id="URN" href="#URN">func URN(kind string, id int64) string</a>

```
searchKey: extsvc.URN
tags: [method]
```

```Go
func URN(kind string, id int64) string
```

URN returns a unique resource identifier of an external service by given kind and ID. 

### <a id="WebhookURL" href="#WebhookURL">func WebhookURL(kind string, externalServiceID int64, externalURL string) string</a>

```
searchKey: extsvc.WebhookURL
tags: [method]
```

```Go
func WebhookURL(kind string, externalServiceID int64, externalURL string) string
```

### <a id="getJSONOrError" href="#getJSONOrError">func getJSONOrError(field *json.RawMessage, v interface{}) error</a>

```
searchKey: extsvc.getJSONOrError
tags: [method private]
```

```Go
func getJSONOrError(field *json.RawMessage, v interface{}) error
```

### <a id="limitOrInf" href="#limitOrInf">func limitOrInf(enabled bool, perHour float64) rate.Limit</a>

```
searchKey: extsvc.limitOrInf
tags: [method private]
```

```Go
func limitOrInf(enabled bool, perHour float64) rate.Limit
```

### <a id="mustParseURL" href="#mustParseURL">func mustParseURL(rawurl string) *url.URL</a>

```
searchKey: extsvc.mustParseURL
tags: [method private]
```

```Go
func mustParseURL(rawurl string) *url.URL
```

### <a id="setJSONOrError" href="#setJSONOrError">func setJSONOrError(field **json.RawMessage, value interface{})</a>

```
searchKey: extsvc.setJSONOrError
tags: [method private]
```

```Go
func setJSONOrError(field **json.RawMessage, value interface{})
```

