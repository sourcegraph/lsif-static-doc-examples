# Package schema

## Index

* [Variables](#var)
    * [var AWSCodeCommitSchemaJSON](#AWSCodeCommitSchemaJSON)
    * [var BatchSpecSchemaJSON](#BatchSpecSchemaJSON)
    * [var BitbucketCloudSchemaJSON](#BitbucketCloudSchemaJSON)
    * [var BitbucketServerSchemaJSON](#BitbucketServerSchemaJSON)
    * [var ChangesetSpecSchemaJSON](#ChangesetSpecSchemaJSON)
    * [var GitHubSchemaJSON](#GitHubSchemaJSON)
    * [var GitLabSchemaJSON](#GitLabSchemaJSON)
    * [var GitoliteSchemaJSON](#GitoliteSchemaJSON)
    * [var OtherExternalServiceSchemaJSON](#OtherExternalServiceSchemaJSON)
    * [var PerforceSchemaJSON](#PerforceSchemaJSON)
    * [var PhabricatorSchemaJSON](#PhabricatorSchemaJSON)
    * [var SettingsSchemaJSON](#SettingsSchemaJSON)
    * [var SiteSchemaJSON](#SiteSchemaJSON)
* [Types](#type)
    * [type AWSCodeCommitConnection struct](#AWSCodeCommitConnection)
    * [type AWSCodeCommitGitCredentials struct](#AWSCodeCommitGitCredentials)
    * [type AWSKMSEncryptionKey struct](#AWSKMSEncryptionKey)
    * [type Action struct](#Action)
    * [type ActionItem struct](#ActionItem)
    * [type AdditionalProperties struct](#AdditionalProperties)
    * [type ApiRatelimit struct](#ApiRatelimit)
    * [type AuthAccessTokens struct](#AuthAccessTokens)
    * [type AuthProviderCommon struct](#AuthProviderCommon)
    * [type AuthProviders struct](#AuthProviders)
        * [func (v AuthProviders) MarshalJSON() ([]byte, error)](#AuthProviders.MarshalJSON)
        * [func (v *AuthProviders) UnmarshalJSON(data []byte) error](#AuthProviders.UnmarshalJSON)
    * [type BatchChangeRolloutWindow struct](#BatchChangeRolloutWindow)
    * [type BatchSpec struct](#BatchSpec)
    * [type BitbucketCloudConnection struct](#BitbucketCloudConnection)
    * [type BitbucketCloudRateLimit struct](#BitbucketCloudRateLimit)
    * [type BitbucketServerAuthorization struct](#BitbucketServerAuthorization)
    * [type BitbucketServerConnection struct](#BitbucketServerConnection)
        * [func (c *BitbucketServerConnection) WebhookSecret() string](#BitbucketServerConnection.WebhookSecret)
    * [type BitbucketServerIdentityProvider struct](#BitbucketServerIdentityProvider)
        * [func (v BitbucketServerIdentityProvider) MarshalJSON() ([]byte, error)](#BitbucketServerIdentityProvider.MarshalJSON)
        * [func (v *BitbucketServerIdentityProvider) UnmarshalJSON(data []byte) error](#BitbucketServerIdentityProvider.UnmarshalJSON)
    * [type BitbucketServerOAuth struct](#BitbucketServerOAuth)
    * [type BitbucketServerPlugin struct](#BitbucketServerPlugin)
    * [type BitbucketServerPluginWebhooks struct](#BitbucketServerPluginWebhooks)
    * [type BitbucketServerRateLimit struct](#BitbucketServerRateLimit)
    * [type BitbucketServerUsernameIdentity struct](#BitbucketServerUsernameIdentity)
    * [type BrandAssets struct](#BrandAssets)
    * [type Branding struct](#Branding)
    * [type BuiltinAuthProvider struct](#BuiltinAuthProvider)
    * [type ChangesetTemplate struct](#ChangesetTemplate)
    * [type CloneURLToRepositoryName struct](#CloneURLToRepositoryName)
    * [type CloudKMSEncryptionKey struct](#CloudKMSEncryptionKey)
    * [type Contributions struct](#Contributions)
    * [type CustomGitFetchMapping struct](#CustomGitFetchMapping)
    * [type DebugLog struct](#DebugLog)
    * [type Dotcom struct](#Dotcom)
    * [type EncryptionKey struct](#EncryptionKey)
        * [func (v EncryptionKey) MarshalJSON() ([]byte, error)](#EncryptionKey.MarshalJSON)
        * [func (v *EncryptionKey) UnmarshalJSON(data []byte) error](#EncryptionKey.UnmarshalJSON)
    * [type EncryptionKeys struct](#EncryptionKeys)
    * [type ExcludedAWSCodeCommitRepo struct](#ExcludedAWSCodeCommitRepo)
    * [type ExcludedBitbucketCloudRepo struct](#ExcludedBitbucketCloudRepo)
    * [type ExcludedBitbucketServerRepo struct](#ExcludedBitbucketServerRepo)
    * [type ExcludedGitHubRepo struct](#ExcludedGitHubRepo)
    * [type ExcludedGitLabProject struct](#ExcludedGitLabProject)
    * [type ExcludedGitoliteRepo struct](#ExcludedGitoliteRepo)
    * [type ExpandedGitCommitDescription struct](#ExpandedGitCommitDescription)
    * [type ExperimentalFeatures struct](#ExperimentalFeatures)
    * [type ExtensionRepository struct](#ExtensionRepository)
    * [type Extensions struct](#Extensions)
    * [type ExternalIdentity struct](#ExternalIdentity)
    * [type GitCommitAuthor struct](#GitCommitAuthor)
    * [type GitCommitDescription struct](#GitCommitDescription)
    * [type GitHubAuthProvider struct](#GitHubAuthProvider)
    * [type GitHubAuthorization struct{}](#GitHubAuthorization)
    * [type GitHubConnection struct](#GitHubConnection)
        * [func (c *GitHubConnection) SetRepos(all bool, repos []string) error](#GitHubConnection.SetRepos)
    * [type GitHubRateLimit struct](#GitHubRateLimit)
    * [type GitHubWebhook struct](#GitHubWebhook)
    * [type GitLabAuthProvider struct](#GitLabAuthProvider)
    * [type GitLabAuthorization struct](#GitLabAuthorization)
    * [type GitLabConnection struct](#GitLabConnection)
        * [func (c *GitLabConnection) SetRepos(all bool, repos []string) error](#GitLabConnection.SetRepos)
    * [type GitLabNameTransformation struct](#GitLabNameTransformation)
    * [type GitLabProject struct](#GitLabProject)
    * [type GitLabRateLimit struct](#GitLabRateLimit)
    * [type GitLabWebhook struct](#GitLabWebhook)
    * [type GitoliteConnection struct](#GitoliteConnection)
    * [type HTTPHeaderAuthProvider struct](#HTTPHeaderAuthProvider)
    * [type IdentityProvider struct](#IdentityProvider)
        * [func (v IdentityProvider) MarshalJSON() ([]byte, error)](#IdentityProvider.MarshalJSON)
        * [func (v *IdentityProvider) UnmarshalJSON(data []byte) error](#IdentityProvider.UnmarshalJSON)
    * [type ImportChangesets struct](#ImportChangesets)
    * [type Insight struct](#Insight)
    * [type InsightSeries struct](#InsightSeries)
    * [type Log struct](#Log)
    * [type MenuItem struct](#MenuItem)
    * [type Menus struct](#Menus)
    * [type MountedEncryptionKey struct](#MountedEncryptionKey)
    * [type NoOpEncryptionKey struct](#NoOpEncryptionKey)
    * [type Notice struct](#Notice)
    * [type Notifier struct](#Notifier)
        * [func (v Notifier) MarshalJSON() ([]byte, error)](#Notifier.MarshalJSON)
        * [func (v *Notifier) UnmarshalJSON(data []byte) error](#Notifier.UnmarshalJSON)
    * [type NotifierEmail struct](#NotifierEmail)
    * [type NotifierOpsGenie struct](#NotifierOpsGenie)
    * [type NotifierPagerduty struct](#NotifierPagerduty)
    * [type NotifierSlack struct](#NotifierSlack)
    * [type NotifierWebhook struct](#NotifierWebhook)
    * [type OAuthIdentity struct](#OAuthIdentity)
    * [type ObservabilityAlerts struct](#ObservabilityAlerts)
    * [type ObservabilityTracing struct](#ObservabilityTracing)
    * [type OnQuery struct](#OnQuery)
    * [type OnRepository struct](#OnRepository)
    * [type OpenIDConnectAuthProvider struct](#OpenIDConnectAuthProvider)
    * [type OtherExternalServiceConnection struct](#OtherExternalServiceConnection)
    * [type Overrides struct](#Overrides)
    * [type ParentSourcegraph struct](#ParentSourcegraph)
    * [type PerforceAuthorization struct{}](#PerforceAuthorization)
    * [type PerforceConnection struct](#PerforceConnection)
    * [type PerforceRateLimit struct](#PerforceRateLimit)
    * [type PermissionsUserMapping struct](#PermissionsUserMapping)
    * [type Phabricator struct](#Phabricator)
    * [type PhabricatorConnection struct](#PhabricatorConnection)
    * [type QuickLink struct](#QuickLink)
    * [type Ranking struct](#Ranking)
    * [type Repos struct](#Repos)
    * [type Responders struct](#Responders)
    * [type SAMLAuthProvider struct](#SAMLAuthProvider)
    * [type SMTPServerConfig struct](#SMTPServerConfig)
    * [type SearchLimits struct](#SearchLimits)
    * [type SearchSavedQueries struct](#SearchSavedQueries)
    * [type SearchScope struct](#SearchScope)
    * [type Sentry struct](#Sentry)
    * [type Settings struct](#Settings)
    * [type SettingsExperimentalFeatures struct](#SettingsExperimentalFeatures)
    * [type SiteConfiguration struct](#SiteConfiguration)
    * [type SourcegraphExtensionManifest struct](#SourcegraphExtensionManifest)
    * [type Step struct](#Step)
    * [type TlsExternal struct](#TlsExternal)
    * [type TransformChanges struct](#TransformChanges)
    * [type UpdateIntervalRule struct](#UpdateIntervalRule)
    * [type UsernameIdentity struct](#UsernameIdentity)
    * [type VersionContext struct](#VersionContext)
    * [type VersionContextRevision struct](#VersionContextRevision)
    * [type Webhooks struct](#Webhooks)
    * [type WorkspaceConfiguration struct](#WorkspaceConfiguration)


## <a id="var" href="#var">Variables</a>

### <a id="AWSCodeCommitSchemaJSON" href="#AWSCodeCommitSchemaJSON">var AWSCodeCommitSchemaJSON</a>

```
searchKey: schema.AWSCodeCommitSchemaJSON
tags: [variable string]
```

```Go
var AWSCodeCommitSchemaJSON string
```

AWSCodeCommitSchemaJSON is the content of the file "aws_codecommit.schema.json". 

### <a id="BatchSpecSchemaJSON" href="#BatchSpecSchemaJSON">var BatchSpecSchemaJSON</a>

```
searchKey: schema.BatchSpecSchemaJSON
tags: [variable string]
```

```Go
var BatchSpecSchemaJSON string
```

BatchSpecSchemaJSON is the content of the file "batch_spec.schema.json". 

### <a id="BitbucketCloudSchemaJSON" href="#BitbucketCloudSchemaJSON">var BitbucketCloudSchemaJSON</a>

```
searchKey: schema.BitbucketCloudSchemaJSON
tags: [variable string]
```

```Go
var BitbucketCloudSchemaJSON string
```

BitbucketCloudSchemaJSON is the content of the file "bitbucket_cloud.schema.json". 

### <a id="BitbucketServerSchemaJSON" href="#BitbucketServerSchemaJSON">var BitbucketServerSchemaJSON</a>

```
searchKey: schema.BitbucketServerSchemaJSON
tags: [variable string]
```

```Go
var BitbucketServerSchemaJSON string
```

BitbucketServerSchemaJSON is the content of the file "bitbucket_server.schema.json". 

### <a id="ChangesetSpecSchemaJSON" href="#ChangesetSpecSchemaJSON">var ChangesetSpecSchemaJSON</a>

```
searchKey: schema.ChangesetSpecSchemaJSON
tags: [variable string]
```

```Go
var ChangesetSpecSchemaJSON string
```

ChangesetSpecSchemaJSON is the content of the file "changeset_spec.schema.json". 

### <a id="GitHubSchemaJSON" href="#GitHubSchemaJSON">var GitHubSchemaJSON</a>

```
searchKey: schema.GitHubSchemaJSON
tags: [variable string]
```

```Go
var GitHubSchemaJSON string
```

GitHubSchemaJSON is the content of the file "github.schema.json". 

### <a id="GitLabSchemaJSON" href="#GitLabSchemaJSON">var GitLabSchemaJSON</a>

```
searchKey: schema.GitLabSchemaJSON
tags: [variable string]
```

```Go
var GitLabSchemaJSON string
```

GitLabSchemaJSON is the content of the file "gitlab.schema.json". 

### <a id="GitoliteSchemaJSON" href="#GitoliteSchemaJSON">var GitoliteSchemaJSON</a>

```
searchKey: schema.GitoliteSchemaJSON
tags: [variable string]
```

```Go
var GitoliteSchemaJSON string
```

GitoliteSchemaJSON is the content of the file "gitolite.schema.json". 

### <a id="OtherExternalServiceSchemaJSON" href="#OtherExternalServiceSchemaJSON">var OtherExternalServiceSchemaJSON</a>

```
searchKey: schema.OtherExternalServiceSchemaJSON
tags: [variable string]
```

```Go
var OtherExternalServiceSchemaJSON string
```

OtherExternalServiceSchemaJSON is the content of the file "other_external_service.schema.json". 

### <a id="PerforceSchemaJSON" href="#PerforceSchemaJSON">var PerforceSchemaJSON</a>

```
searchKey: schema.PerforceSchemaJSON
tags: [variable string]
```

```Go
var PerforceSchemaJSON string
```

PerforceSchemaJSON is the content of the file "perforce.schema.json". 

### <a id="PhabricatorSchemaJSON" href="#PhabricatorSchemaJSON">var PhabricatorSchemaJSON</a>

```
searchKey: schema.PhabricatorSchemaJSON
tags: [variable string]
```

```Go
var PhabricatorSchemaJSON string
```

PhabricatorSchemaJSON is the content of the file "phabricator.schema.json". 

### <a id="SettingsSchemaJSON" href="#SettingsSchemaJSON">var SettingsSchemaJSON</a>

```
searchKey: schema.SettingsSchemaJSON
tags: [variable string]
```

```Go
var SettingsSchemaJSON string
```

SettingsSchemaJSON is the content of the file "settings.schema.json". 

### <a id="SiteSchemaJSON" href="#SiteSchemaJSON">var SiteSchemaJSON</a>

```
searchKey: schema.SiteSchemaJSON
tags: [variable string]
```

```Go
var SiteSchemaJSON string
```

SiteSchemaJSON is the content of the file "site.schema.json". 

## <a id="type" href="#type">Types</a>

### <a id="AWSCodeCommitConnection" href="#AWSCodeCommitConnection">type AWSCodeCommitConnection struct</a>

```
searchKey: schema.AWSCodeCommitConnection
tags: [struct]
```

```Go
type AWSCodeCommitConnection struct {
	// AccessKeyID description: The AWS access key ID to use when listing and updating repositories from AWS CodeCommit. Must have the AWSCodeCommitReadOnly IAM policy.
	AccessKeyID string `json:"accessKeyID"`
	// Exclude description: A list of repositories to never mirror from AWS CodeCommit.
	//
	// Supports excluding by name ({"name": "git-codecommit.us-west-1.amazonaws.com/repo-name"}) or by ARN ({"id": "arn:aws:codecommit:us-west-1:999999999999:name"}).
	Exclude []*ExcludedAWSCodeCommitRepo `json:"exclude,omitempty"`
	// GitCredentials description: The Git credentials used for authentication when cloning an AWS CodeCommit repository over HTTPS.
	//
	// See the AWS CodeCommit documentation on Git credentials for CodeCommit: https://docs.aws.amazon.com/IAM/latest/UserGuide/id_credentials_ssh-keys.html#git-credentials-code-commit.
	// For detailed instructions on how to create the credentials in IAM, see this page: https://docs.aws.amazon.com/codecommit/latest/userguide/setting-up-gc.html
	GitCredentials AWSCodeCommitGitCredentials `json:"gitCredentials"`
	// InitialRepositoryEnablement description: Deprecated and ignored field which will be removed entirely in the next release. AWS CodeCommit repositories can no longer be enabled or disabled explicitly. Configure which repositories should not be mirrored via "exclude" instead.
	InitialRepositoryEnablement bool `json:"initialRepositoryEnablement,omitempty"`
	// Region description: The AWS region in which to access AWS CodeCommit. See the list of supported regions at https://docs.aws.amazon.com/codecommit/latest/userguide/regions.html#regions-git.
	Region string `json:"region"`
	// RepositoryPathPattern description: The pattern used to generate a the corresponding Sourcegraph repository name for an AWS CodeCommit repository. In the pattern, the variable "{name}" is replaced with the repository's name.
	//
	// For example, if your Sourcegraph instance is at https://src.example.com, then a repositoryPathPattern of "awsrepos/{name}" would mean that a AWS CodeCommit repository named "myrepo" is available on Sourcegraph at https://src.example.com/awsrepos/myrepo.
	//
	// It is important that the Sourcegraph repository name generated with this pattern be unique to this code host. If different code hosts generate repository names that collide, Sourcegraph's behavior is undefined.
	RepositoryPathPattern string `json:"repositoryPathPattern,omitempty"`
	// SecretAccessKey description: The AWS secret access key (that corresponds to the AWS access key ID set in `accessKeyID`).
	SecretAccessKey string `json:"secretAccessKey"`
}
```

AWSCodeCommitConnection description: Configuration for a connection to AWS CodeCommit. 

### <a id="AWSCodeCommitGitCredentials" href="#AWSCodeCommitGitCredentials">type AWSCodeCommitGitCredentials struct</a>

```
searchKey: schema.AWSCodeCommitGitCredentials
tags: [struct]
```

```Go
type AWSCodeCommitGitCredentials struct {
	// Password description: The Git password
	Password string `json:"password"`
	// Username description: The Git username
	Username string `json:"username"`
}
```

AWSCodeCommitGitCredentials description: The Git credentials used for authentication when cloning an AWS CodeCommit repository over HTTPS. 

See the AWS CodeCommit documentation on Git credentials for CodeCommit: [https://docs.aws.amazon.com/IAM/latest/UserGuide/id_credentials_ssh-keys.html#git-credentials-code-commit](https://docs.aws.amazon.com/IAM/latest/UserGuide/id_credentials_ssh-keys.html#git-credentials-code-commit). For detailed instructions on how to create the credentials in IAM, see this page: [https://docs.aws.amazon.com/codecommit/latest/userguide/setting-up-gc.html](https://docs.aws.amazon.com/codecommit/latest/userguide/setting-up-gc.html) 

### <a id="AWSKMSEncryptionKey" href="#AWSKMSEncryptionKey">type AWSKMSEncryptionKey struct</a>

```
searchKey: schema.AWSKMSEncryptionKey
tags: [struct]
```

```Go
type AWSKMSEncryptionKey struct {
	CredentialsFile string `json:"credentialsFile,omitempty"`
	KeyId           string `json:"keyId"`
	Region          string `json:"region,omitempty"`
	Type            string `json:"type"`
}
```

AWSKMSEncryptionKey description: AWS KMS Encryption Key, used to encrypt data in AWS environments 

### <a id="Action" href="#Action">type Action struct</a>

```
searchKey: schema.Action
tags: [struct]
```

```Go
type Action struct {
	ActionItem       *ActionItem   `json:"actionItem,omitempty"`
	Category         string        `json:"category,omitempty"`
	Command          string        `json:"command,omitempty"`
	CommandArguments []interface{} `json:"commandArguments,omitempty"`
	IconURL          string        `json:"iconURL,omitempty"`
	Id               string        `json:"id,omitempty"`
	Title            string        `json:"title,omitempty"`
}
```

### <a id="ActionItem" href="#ActionItem">type ActionItem struct</a>

```
searchKey: schema.ActionItem
tags: [struct]
```

```Go
type ActionItem struct {
	Description string `json:"description,omitempty"`
	IconURL     string `json:"iconURL,omitempty"`
	Label       string `json:"label,omitempty"`
}
```

ActionItem description: The action item. 

### <a id="AdditionalProperties" href="#AdditionalProperties">type AdditionalProperties struct</a>

```
searchKey: schema.AdditionalProperties
tags: [struct]
```

```Go
type AdditionalProperties struct {
	// Format description: The expected format of the output. If set, the output is being parsed in that format before being stored in the var. If not set, 'text' is assumed to the format.
	Format string `json:"format,omitempty"`
	// Value description: The value of the output, which can be a template string.
	Value string `json:"value"`
}
```

### <a id="ApiRatelimit" href="#ApiRatelimit">type ApiRatelimit struct</a>

```
searchKey: schema.ApiRatelimit
tags: [struct]
```

```Go
type ApiRatelimit struct {
	// Enabled description: Whether API rate limiting is enabled
	Enabled bool `json:"enabled"`
	// Overrides description: An array of rate limit overrides
	Overrides []*Overrides `json:"overrides,omitempty"`
	// PerIP description: Limit granted per IP per hour, only applied to anonymous users
	PerIP int `json:"perIP"`
	// PerUser description: Limit granted per user per hour
	PerUser int `json:"perUser"`
}
```

ApiRatelimit description: Configuration for API rate limiting 

### <a id="AuthAccessTokens" href="#AuthAccessTokens">type AuthAccessTokens struct</a>

```
searchKey: schema.AuthAccessTokens
tags: [struct]
```

```Go
type AuthAccessTokens struct {
	// Allow description: Allow or restrict the use of access tokens. The default is "all-users-create", which enables all users to create access tokens. Use "none" to disable access tokens entirely. Use "site-admin-create" to restrict creation of new tokens to admin users (existing tokens will still work until revoked).
	Allow string `json:"allow,omitempty"`
}
```

AuthAccessTokens description: Settings for access tokens, which enable external tools to access the Sourcegraph API with the privileges of the user. 

### <a id="AuthProviderCommon" href="#AuthProviderCommon">type AuthProviderCommon struct</a>

```
searchKey: schema.AuthProviderCommon
tags: [struct]
```

```Go
type AuthProviderCommon struct {
	// DisplayName description: The name to use when displaying this authentication provider in the UI. Defaults to an auto-generated name with the type of authentication provider and other relevant identifiers (such as a hostname).
	DisplayName string `json:"displayName,omitempty"`
}
```

AuthProviderCommon description: Common properties for authentication providers. 

### <a id="AuthProviders" href="#AuthProviders">type AuthProviders struct</a>

```
searchKey: schema.AuthProviders
tags: [struct]
```

```Go
type AuthProviders struct {
	Builtin       *BuiltinAuthProvider
	Saml          *SAMLAuthProvider
	Openidconnect *OpenIDConnectAuthProvider
	HttpHeader    *HTTPHeaderAuthProvider
	Github        *GitHubAuthProvider
	Gitlab        *GitLabAuthProvider
}
```

#### <a id="AuthProviders.MarshalJSON" href="#AuthProviders.MarshalJSON">func (v AuthProviders) MarshalJSON() ([]byte, error)</a>

```
searchKey: schema.AuthProviders.MarshalJSON
tags: [method]
```

```Go
func (v AuthProviders) MarshalJSON() ([]byte, error)
```

#### <a id="AuthProviders.UnmarshalJSON" href="#AuthProviders.UnmarshalJSON">func (v *AuthProviders) UnmarshalJSON(data []byte) error</a>

```
searchKey: schema.AuthProviders.UnmarshalJSON
tags: [method]
```

```Go
func (v *AuthProviders) UnmarshalJSON(data []byte) error
```

### <a id="BatchChangeRolloutWindow" href="#BatchChangeRolloutWindow">type BatchChangeRolloutWindow struct</a>

```
searchKey: schema.BatchChangeRolloutWindow
tags: [struct]
```

```Go
type BatchChangeRolloutWindow struct {
	// Days description: Day(s) the window applies to. If omitted, this rule applies to all days of the week.
	Days []string `json:"days,omitempty"`
	// End description: Window end time. If omitted, no time window is applied to the day(s) that match this rule.
	End string `json:"end,omitempty"`
	// Rate description: The rate changesets will be published at.
	Rate interface{} `json:"rate"`
	// Start description: Window start time. If omitted, no time window is applied to the day(s) that match this rule.
	Start string `json:"start,omitempty"`
}
```

### <a id="BatchSpec" href="#BatchSpec">type BatchSpec struct</a>

```
searchKey: schema.BatchSpec
tags: [struct]
```

```Go
type BatchSpec struct {
	// ChangesetTemplate description: A template describing how to create (and update) changesets with the file changes produced by the command steps.
	ChangesetTemplate *ChangesetTemplate `json:"changesetTemplate,omitempty"`
	// Description description: The description of the batch change.
	Description string `json:"description,omitempty"`
	// ImportChangesets description: Import existing changesets on code hosts.
	ImportChangesets []*ImportChangesets `json:"importChangesets,omitempty"`
	// Name description: The name of the batch change, which is unique among all batch changes in the namespace. A batch change's name is case-preserving.
	Name string `json:"name"`
	// On description: The set of repositories (and branches) to run the batch change on, specified as a list of search queries (that match repositories) and/or specific repositories.
	On []interface{} `json:"on,omitempty"`
	// Steps description: The sequence of commands to run (for each repository branch matched in the `on` property) to produce the workspace changes that will be included in the batch change.
	Steps []*Step `json:"steps,omitempty"`
	// TransformChanges description: Optional transformations to apply to the changes produced in each repository.
	TransformChanges *TransformChanges `json:"transformChanges,omitempty"`
	// Workspaces description: Individual workspace configurations for one or more repositories that define which workspaces to use for the execution of steps in the repositories.
	Workspaces []*WorkspaceConfiguration `json:"workspaces,omitempty"`
}
```

BatchSpec description: A batch specification, which describes the batch change and what kinds of changes to make (or what existing changesets to track). 

### <a id="BitbucketCloudConnection" href="#BitbucketCloudConnection">type BitbucketCloudConnection struct</a>

```
searchKey: schema.BitbucketCloudConnection
tags: [struct]
```

```Go
type BitbucketCloudConnection struct {
	// ApiURL description: The API URL of Bitbucket Cloud, such as https://api.bitbucket.org. Generally, admin should not modify the value of this option because Bitbucket Cloud is a public hosting platform.
	ApiURL string `json:"apiURL,omitempty"`
	// AppPassword description: The app password to use when authenticating to the Bitbucket Cloud. Also set the corresponding "username" field.
	AppPassword string `json:"appPassword"`
	// Exclude description: A list of repositories to never mirror from Bitbucket Cloud. Takes precedence over "teams" configuration.
	//
	// Supports excluding by name ({"name": "myorg/myrepo"}) or by UUID ({"uuid": "{fceb73c7-cef6-4abe-956d-e471281126bd}"}).
	Exclude []*ExcludedBitbucketCloudRepo `json:"exclude,omitempty"`
	// GitURLType description: The type of Git URLs to use for cloning and fetching Git repositories on this Bitbucket Cloud.
	//
	// If "http", Sourcegraph will access Bitbucket Cloud repositories using Git URLs of the form https://bitbucket.org/myteam/myproject.git.
	//
	// If "ssh", Sourcegraph will access Bitbucket Cloud repositories using Git URLs of the form git@bitbucket.org:myteam/myproject.git. See the documentation for how to provide SSH private keys and known_hosts: https://docs.sourcegraph.com/admin/repo/auth#repositories-that-need-http-s-or-ssh-authentication.
	GitURLType string `json:"gitURLType,omitempty"`
	// RateLimit description: Rate limit applied when making background API requests to Bitbucket Cloud.
	RateLimit *BitbucketCloudRateLimit `json:"rateLimit,omitempty"`
	// RepositoryPathPattern description: The pattern used to generate the corresponding Sourcegraph repository name for a Bitbucket Cloud repository.
	//
	//  - "{host}" is replaced with the Bitbucket Cloud URL's host (such as bitbucket.org),  and "{nameWithOwner}" is replaced with the Bitbucket Cloud repository's "owner/path" (such as "myorg/myrepo").
	//
	// For example, if your Bitbucket Cloud is https://bitbucket.org and your Sourcegraph is https://src.example.com, then a repositoryPathPattern of "{host}/{nameWithOwner}" would mean that a Bitbucket Cloud repository at https://bitbucket.org/alice/my-repo is available on Sourcegraph at https://src.example.com/bitbucket.org/alice/my-repo.
	//
	// It is important that the Sourcegraph repository name generated with this pattern be unique to this code host. If different code hosts generate repository names that collide, Sourcegraph's behavior is undefined.
	RepositoryPathPattern string `json:"repositoryPathPattern,omitempty"`
	// Teams description: An array of team names identifying Bitbucket Cloud teams whose repositories should be mirrored on Sourcegraph.
	Teams []string `json:"teams,omitempty"`
	// Url description: URL of Bitbucket Cloud, such as https://bitbucket.org. Generally, admin should not modify the value of this option because Bitbucket Cloud is a public hosting platform.
	Url string `json:"url"`
	// Username description: The username to use when authenticating to the Bitbucket Cloud. Also set the corresponding "appPassword" field.
	Username string `json:"username"`
}
```

BitbucketCloudConnection description: Configuration for a connection to Bitbucket Cloud. 

### <a id="BitbucketCloudRateLimit" href="#BitbucketCloudRateLimit">type BitbucketCloudRateLimit struct</a>

```
searchKey: schema.BitbucketCloudRateLimit
tags: [struct]
```

```Go
type BitbucketCloudRateLimit struct {
	// Enabled description: true if rate limiting is enabled.
	Enabled bool `json:"enabled"`
	// RequestsPerHour description: Requests per hour permitted. This is an average, calculated per second. Internally, the burst limit is set to 500, which implies that for a requests per hour limit as low as 1, users will continue to be able to send a maximum of 500 requests immediately, provided that the complexity cost of each request is 1.
	RequestsPerHour float64 `json:"requestsPerHour"`
}
```

BitbucketCloudRateLimit description: Rate limit applied when making background API requests to Bitbucket Cloud. 

### <a id="BitbucketServerAuthorization" href="#BitbucketServerAuthorization">type BitbucketServerAuthorization struct</a>

```
searchKey: schema.BitbucketServerAuthorization
tags: [struct]
```

```Go
type BitbucketServerAuthorization struct {
	// IdentityProvider description: The source of identity to use when computing permissions. This defines how to compute the Bitbucket Server identity to use for a given Sourcegraph user. When 'username' is used, Sourcegraph assumes usernames are identical in Sourcegraph and Bitbucket Server accounts and `auth.enableUsernameChanges` must be set to false for security reasons.
	IdentityProvider BitbucketServerIdentityProvider `json:"identityProvider"`
	// Oauth description: OAuth configuration specified when creating the Bitbucket Server Application Link with incoming authentication. Two Legged OAuth with 'ExecuteAs=admin' must be enabled as well as user impersonation.
	Oauth BitbucketServerOAuth `json:"oauth"`
}
```

BitbucketServerAuthorization description: If non-null, enforces Bitbucket Server repository permissions. 

### <a id="BitbucketServerConnection" href="#BitbucketServerConnection">type BitbucketServerConnection struct</a>

```
searchKey: schema.BitbucketServerConnection
tags: [struct]
```

```Go
type BitbucketServerConnection struct {
	// Authorization description: If non-null, enforces Bitbucket Server repository permissions.
	Authorization *BitbucketServerAuthorization `json:"authorization,omitempty"`
	// Certificate description: TLS certificate of the Bitbucket Server instance. This is only necessary if the certificate is self-signed or signed by an internal CA. To get the certificate run `openssl s_client -connect HOST:443 -showcerts < /dev/null 2> /dev/null | openssl x509 -outform PEM`. To escape the value into a JSON string, you may want to use a tool like https://json-escape-text.now.sh.
	Certificate string `json:"certificate,omitempty"`
	// Exclude description: A list of repositories to never mirror from this Bitbucket Server instance. Takes precedence over "repos" and "repositoryQuery".
	//
	// Supports excluding by name ({"name": "projectKey/repositorySlug"}) or by ID ({"id": 42}).
	Exclude []*ExcludedBitbucketServerRepo `json:"exclude,omitempty"`
	// ExcludePersonalRepositories description: Whether or not personal repositories should be excluded or not. When true, Sourcegraph will ignore personal repositories it may have access to. See https://docs.sourcegraph.com/integration/bitbucket_server#excluding-personal-repositories for more information.
	ExcludePersonalRepositories bool `json:"excludePersonalRepositories,omitempty"`
	// GitURLType description: The type of Git URLs to use for cloning and fetching Git repositories on this Bitbucket Server instance.
	//
	// If "http", Sourcegraph will access Bitbucket Server repositories using Git URLs of the form http(s)://bitbucket.example.com/scm/myproject/myrepo.git (using https: if the Bitbucket Server instance uses HTTPS).
	//
	// If "ssh", Sourcegraph will access Bitbucket Server repositories using Git URLs of the form ssh://git@example.bitbucket.com/myproject/myrepo.git. See the documentation for how to provide SSH private keys and known_hosts: https://docs.sourcegraph.com/admin/repo/auth#repositories-that-need-http-s-or-ssh-authentication.
	GitURLType string `json:"gitURLType,omitempty"`
	// InitialRepositoryEnablement description: Deprecated and ignored field which will be removed entirely in the next release. BitBucket repositories can no longer be enabled or disabled explicitly.
	InitialRepositoryEnablement bool `json:"initialRepositoryEnablement,omitempty"`
	// Password description: The password to use when authenticating to the Bitbucket Server instance. Also set the corresponding "username" field.
	//
	// For Bitbucket Server instances that support personal access tokens (Bitbucket Server version 5.5 and newer), it is recommended to provide a token instead (in the "token" field).
	Password string `json:"password,omitempty"`
	// Plugin description: Configuration for Bitbucket Server Sourcegraph plugin
	Plugin *BitbucketServerPlugin `json:"plugin,omitempty"`
	// RateLimit description: Rate limit applied when making background API requests to BitbucketServer.
	RateLimit *BitbucketServerRateLimit `json:"rateLimit,omitempty"`
	// Repos description: An array of repository "projectKey/repositorySlug" strings specifying repositories to mirror on Sourcegraph.
	Repos []string `json:"repos,omitempty"`
	// RepositoryPathPattern description: The pattern used to generate the corresponding Sourcegraph repository name for a Bitbucket Server repository.
	//
	//  - "{host}" is replaced with the Bitbucket Server URL's host (such as bitbucket.example.com)
	//  - "{projectKey}" is replaced with the Bitbucket repository's parent project key (such as "PRJ")
	//  - "{repositorySlug}" is replaced with the Bitbucket repository's slug key (such as "my-repo").
	//
	// For example, if your Bitbucket Server is https://bitbucket.example.com and your Sourcegraph is https://src.example.com, then a repositoryPathPattern of "{host}/{projectKey}/{repositorySlug}" would mean that a Bitbucket Server repository at https://bitbucket.example.com/projects/PRJ/repos/my-repo is available on Sourcegraph at https://src.example.com/bitbucket.example.com/PRJ/my-repo.
	//
	// It is important that the Sourcegraph repository name generated with this pattern be unique to this code host. If different code hosts generate repository names that collide, Sourcegraph's behavior is undefined.
	RepositoryPathPattern string `json:"repositoryPathPattern,omitempty"`
	// RepositoryQuery description: An array of strings specifying which repositories to mirror on Sourcegraph. Each string is a URL query string with parameters that filter the list of returned repos. Examples: "?name=my-repo&projectname=PROJECT&visibility=private".
	//
	// The special string "none" can be used as the only element to disable this feature. Repositories matched by multiple query strings are only imported once. Here's the official Bitbucket Server documentation about which query string parameters are valid: https://docs.atlassian.com/bitbucket-server/rest/6.1.2/bitbucket-rest.html#idp355
	RepositoryQuery []string `json:"repositoryQuery,omitempty"`
	// Token description: A Bitbucket Server personal access token with Read permissions. When using batch changes, the token needs Write permissions. Create one at https://[your-bitbucket-hostname]/plugins/servlet/access-tokens/add. Also set the corresponding "username" field.
	//
	// For Bitbucket Server instances that don't support personal access tokens (Bitbucket Server version 5.4 and older), specify user-password credentials in the "username" and "password" fields.
	Token string `json:"token,omitempty"`
	// Url description: URL of a Bitbucket Server instance, such as https://bitbucket.example.com.
	Url string `json:"url"`
	// Username description: The username to use when authenticating to the Bitbucket Server instance. Also set the corresponding "token" or "password" field.
	Username string `json:"username"`
	// Webhooks description: DEPRECATED: Switch to "plugin.webhooks"
	Webhooks *Webhooks `json:"webhooks,omitempty"`
}
```

BitbucketServerConnection description: Configuration for a connection to Bitbucket Server. 

#### <a id="BitbucketServerConnection.WebhookSecret" href="#BitbucketServerConnection.WebhookSecret">func (c *BitbucketServerConnection) WebhookSecret() string</a>

```
searchKey: schema.BitbucketServerConnection.WebhookSecret
tags: [method]
```

```Go
func (c *BitbucketServerConnection) WebhookSecret() string
```

WebhookSecret returns the webhook secret from a BBS config 

### <a id="BitbucketServerIdentityProvider" href="#BitbucketServerIdentityProvider">type BitbucketServerIdentityProvider struct</a>

```
searchKey: schema.BitbucketServerIdentityProvider
tags: [struct]
```

```Go
type BitbucketServerIdentityProvider struct {
	Username *BitbucketServerUsernameIdentity
}
```

BitbucketServerIdentityProvider description: The source of identity to use when computing permissions. This defines how to compute the Bitbucket Server identity to use for a given Sourcegraph user. When 'username' is used, Sourcegraph assumes usernames are identical in Sourcegraph and Bitbucket Server accounts and `auth.enableUsernameChanges` must be set to false for security reasons. 

#### <a id="BitbucketServerIdentityProvider.MarshalJSON" href="#BitbucketServerIdentityProvider.MarshalJSON">func (v BitbucketServerIdentityProvider) MarshalJSON() ([]byte, error)</a>

```
searchKey: schema.BitbucketServerIdentityProvider.MarshalJSON
tags: [method]
```

```Go
func (v BitbucketServerIdentityProvider) MarshalJSON() ([]byte, error)
```

#### <a id="BitbucketServerIdentityProvider.UnmarshalJSON" href="#BitbucketServerIdentityProvider.UnmarshalJSON">func (v *BitbucketServerIdentityProvider) UnmarshalJSON(data []byte) error</a>

```
searchKey: schema.BitbucketServerIdentityProvider.UnmarshalJSON
tags: [method]
```

```Go
func (v *BitbucketServerIdentityProvider) UnmarshalJSON(data []byte) error
```

### <a id="BitbucketServerOAuth" href="#BitbucketServerOAuth">type BitbucketServerOAuth struct</a>

```
searchKey: schema.BitbucketServerOAuth
tags: [struct]
```

```Go
type BitbucketServerOAuth struct {
	// ConsumerKey description: The OAuth consumer key specified when creating the Bitbucket Server Application Link with incoming authentication.
	ConsumerKey string `json:"consumerKey"`
	// SigningKey description: Base64 encoding of the OAuth PEM encoded RSA private key used to generate the public key specified when creating the Bitbucket Server Application Link with incoming authentication.
	SigningKey string `json:"signingKey"`
}
```

BitbucketServerOAuth description: OAuth configuration specified when creating the Bitbucket Server Application Link with incoming authentication. Two Legged OAuth with 'ExecuteAs=admin' must be enabled as well as user impersonation. 

### <a id="BitbucketServerPlugin" href="#BitbucketServerPlugin">type BitbucketServerPlugin struct</a>

```
searchKey: schema.BitbucketServerPlugin
tags: [struct]
```

```Go
type BitbucketServerPlugin struct {
	// Permissions description: Enables fetching Bitbucket Server permissions through the roaring bitmap endpoint. Warning: there may be performance degradation under significant load.
	Permissions string                         `json:"permissions,omitempty"`
	Webhooks    *BitbucketServerPluginWebhooks `json:"webhooks,omitempty"`
}
```

BitbucketServerPlugin description: Configuration for Bitbucket Server Sourcegraph plugin 

### <a id="BitbucketServerPluginWebhooks" href="#BitbucketServerPluginWebhooks">type BitbucketServerPluginWebhooks struct</a>

```
searchKey: schema.BitbucketServerPluginWebhooks
tags: [struct]
```

```Go
type BitbucketServerPluginWebhooks struct {
	// DisableSync description: Disallow Sourcegraph from automatically syncing webhook config with the Bitbucket Server instance. For details of how the webhook is configured, see our docs: https://docs.sourcegraph.com/admin/external_service/bitbucket_server#webhooks
	DisableSync bool `json:"disableSync,omitempty"`
	// Secret description: Secret for authenticating incoming webhook payloads
	Secret string `json:"secret"`
}
```

### <a id="BitbucketServerRateLimit" href="#BitbucketServerRateLimit">type BitbucketServerRateLimit struct</a>

```
searchKey: schema.BitbucketServerRateLimit
tags: [struct]
```

```Go
type BitbucketServerRateLimit struct {
	// Enabled description: true if rate limiting is enabled.
	Enabled bool `json:"enabled"`
	// RequestsPerHour description: Requests per hour permitted. This is an average, calculated per second. Internally, the burst limit is set to 500, which implies that for a requests per hour limit as low as 1, users will continue to be able to send a maximum of 500 requests immediately, provided that the complexity cost of each request is 1.
	RequestsPerHour float64 `json:"requestsPerHour"`
}
```

BitbucketServerRateLimit description: Rate limit applied when making background API requests to BitbucketServer. 

### <a id="BitbucketServerUsernameIdentity" href="#BitbucketServerUsernameIdentity">type BitbucketServerUsernameIdentity struct</a>

```
searchKey: schema.BitbucketServerUsernameIdentity
tags: [struct]
```

```Go
type BitbucketServerUsernameIdentity struct {
	Type string `json:"type"`
}
```

### <a id="BrandAssets" href="#BrandAssets">type BrandAssets struct</a>

```
searchKey: schema.BrandAssets
tags: [struct]
```

```Go
type BrandAssets struct {
	// Logo description: The URL to the image used on the homepage. This will replace the Sourcegraph logo on the homepage. Maximum width: 320px. We recommend using the following file formats: SVG, PNG
	Logo string `json:"logo,omitempty"`
	// Symbol description: The URL to the symbol used as the search icon. Recommended size: 24x24px. We recommend using the following file formats: SVG, PNG, ICO
	Symbol string `json:"symbol,omitempty"`
}
```

### <a id="Branding" href="#Branding">type Branding struct</a>

```
searchKey: schema.Branding
tags: [struct]
```

```Go
type Branding struct {
	// BrandName description: String to display everywhere the brand name should be displayed. Defaults to "Sourcegraph"
	BrandName string       `json:"brandName,omitempty"`
	Dark      *BrandAssets `json:"dark,omitempty"`
	// DisableSymbolSpin description: Prevents the icon in the top-left corner of the screen from spinning on hover.
	DisableSymbolSpin bool `json:"disableSymbolSpin,omitempty"`
	// Favicon description: The URL of the favicon to be used for your instance. We recommend using the following file format: ICO
	Favicon string       `json:"favicon,omitempty"`
	Light   *BrandAssets `json:"light,omitempty"`
}
```

Branding description: Customize Sourcegraph homepage logo and search icon. 

Only available in Sourcegraph Enterprise. 

### <a id="BuiltinAuthProvider" href="#BuiltinAuthProvider">type BuiltinAuthProvider struct</a>

```
searchKey: schema.BuiltinAuthProvider
tags: [struct]
```

```Go
type BuiltinAuthProvider struct {
	// AllowSignup description: Allows new visitors to sign up for accounts. The sign-up page will be enabled and accessible to all visitors.
	//
	// SECURITY: If the site has no users (i.e., during initial setup), it will always allow the first user to sign up and become site admin **without any approval** (first user to sign up becomes the admin).
	AllowSignup bool   `json:"allowSignup,omitempty"`
	Type        string `json:"type"`
}
```

BuiltinAuthProvider description: Configures the builtin username-password authentication provider. 

### <a id="ChangesetTemplate" href="#ChangesetTemplate">type ChangesetTemplate struct</a>

```
searchKey: schema.ChangesetTemplate
tags: [struct]
```

```Go
type ChangesetTemplate struct {
	// Body description: The body (description) of the changeset.
	Body string `json:"body,omitempty"`
	// Branch description: The name of the Git branch to create or update on each repository with the changes.
	Branch string `json:"branch"`
	// Commit description: The Git commit to create with the changes.
	Commit ExpandedGitCommitDescription `json:"commit"`
	// Published description: Whether to publish the changeset. An unpublished changeset can be previewed on Sourcegraph by any person who can view the batch change, but its commit, branch, and pull request aren't created on the code host. A published changeset results in a commit, branch, and pull request being created on the code host.
	Published interface{} `json:"published"`
	// Title description: The title of the changeset.
	Title string `json:"title"`
}
```

ChangesetTemplate description: A template describing how to create (and update) changesets with the file changes produced by the command steps. 

### <a id="CloneURLToRepositoryName" href="#CloneURLToRepositoryName">type CloneURLToRepositoryName struct</a>

```
searchKey: schema.CloneURLToRepositoryName
tags: [struct]
```

```Go
type CloneURLToRepositoryName struct {
	// From description: A regular expression that matches a set of clone URLs. The regular expression should use the Go regular expression syntax (https://golang.org/pkg/regexp/) and contain at least one named capturing group. The regular expression matches partially by default, so use "^...$" if whole-string matching is desired.
	From string `json:"from"`
	// To description: The repository name output pattern. This should use `{matchGroup}` syntax to reference the capturing groups from the `from` field.
	To string `json:"to"`
}
```

CloneURLToRepositoryName description: Describes a mapping from clone URL to repository name. The `from` field contains a regular expression with named capturing groups. The `to` field contains a template string that references capturing group names. For instance, if `from` is "^../(?P<name>\w+)$" and `to` is "github.com/user/{name}", the clone URL "../myRepository" would be mapped to the repository name "github.com/user/myRepository". 

### <a id="CloudKMSEncryptionKey" href="#CloudKMSEncryptionKey">type CloudKMSEncryptionKey struct</a>

```
searchKey: schema.CloudKMSEncryptionKey
tags: [struct]
```

```Go
type CloudKMSEncryptionKey struct {
	CredentialsFile string `json:"credentialsFile,omitempty"`
	Keyname         string `json:"keyname"`
	Type            string `json:"type"`
}
```

CloudKMSEncryptionKey description: Google Cloud KMS Encryption Key, used to encrypt data in Google Cloud environments 

### <a id="Contributions" href="#Contributions">type Contributions struct</a>

```
searchKey: schema.Contributions
tags: [struct]
```

```Go
type Contributions struct {
	Actions       []*Action          `json:"actions,omitempty"`
	Configuration *jsonschema.Schema `json:"configuration,omitempty"`
	Menus         *Menus             `json:"menus,omitempty"`
}
```

Contributions description: Features contributed by this extension. Extensions may also register certain types of contributions dynamically. 

### <a id="CustomGitFetchMapping" href="#CustomGitFetchMapping">type CustomGitFetchMapping struct</a>

```
searchKey: schema.CustomGitFetchMapping
tags: [struct]
```

```Go
type CustomGitFetchMapping struct {
	// DomainPath description: Git clone URL domain/path
	DomainPath string `json:"domainPath"`
	// Fetch description: Git fetch command
	Fetch string `json:"fetch"`
}
```

CustomGitFetchMapping description: Mapping from Git clone URl domain/path to git fetch command. The `domainPath` field contains the Git clone URL domain/path part. The `fetch` field contains the custom git fetch command. 

### <a id="DebugLog" href="#DebugLog">type DebugLog struct</a>

```
searchKey: schema.DebugLog
tags: [struct]
```

```Go
type DebugLog struct {
	// ExtsvcGitlab description: Log GitLab API requests.
	ExtsvcGitlab bool `json:"extsvc.gitlab,omitempty"`
}
```

DebugLog description: Turns on debug logging for specific debugging scenarios. 

### <a id="Dotcom" href="#Dotcom">type Dotcom struct</a>

```
searchKey: schema.Dotcom
tags: [struct]
```

```Go
type Dotcom struct {
	// SlackLicenseExpirationWebhook description: Slack webhook for upcoming license expiration notifications.
	SlackLicenseExpirationWebhook string `json:"slackLicenseExpirationWebhook,omitempty"`
}
```

Dotcom description: Configuration options for Sourcegraph.com only. 

### <a id="EncryptionKey" href="#EncryptionKey">type EncryptionKey struct</a>

```
searchKey: schema.EncryptionKey
tags: [struct]
```

```Go
type EncryptionKey struct {
	Cloudkms *CloudKMSEncryptionKey
	Awskms   *AWSKMSEncryptionKey
	Mounted  *MountedEncryptionKey
	Noop     *NoOpEncryptionKey
}
```

EncryptionKey description: Config for a key 

#### <a id="EncryptionKey.MarshalJSON" href="#EncryptionKey.MarshalJSON">func (v EncryptionKey) MarshalJSON() ([]byte, error)</a>

```
searchKey: schema.EncryptionKey.MarshalJSON
tags: [method]
```

```Go
func (v EncryptionKey) MarshalJSON() ([]byte, error)
```

#### <a id="EncryptionKey.UnmarshalJSON" href="#EncryptionKey.UnmarshalJSON">func (v *EncryptionKey) UnmarshalJSON(data []byte) error</a>

```
searchKey: schema.EncryptionKey.UnmarshalJSON
tags: [method]
```

```Go
func (v *EncryptionKey) UnmarshalJSON(data []byte) error
```

### <a id="EncryptionKeys" href="#EncryptionKeys">type EncryptionKeys struct</a>

```
searchKey: schema.EncryptionKeys
tags: [struct]
```

```Go
type EncryptionKeys struct {
	BatchChangesCredentialKey *EncryptionKey `json:"batchChangesCredentialKey,omitempty"`
	// CacheSize description: number of values to keep in LRU cache
	CacheSize int `json:"cacheSize,omitempty"`
	// EnableCache description: enable LRU cache for decryption APIs
	EnableCache            bool           `json:"enableCache,omitempty"`
	ExternalServiceKey     *EncryptionKey `json:"externalServiceKey,omitempty"`
	UserExternalAccountKey *EncryptionKey `json:"userExternalAccountKey,omitempty"`
}
```

EncryptionKeys description: Configuration for encryption keys used to encrypt data at rest in the database. 

### <a id="ExcludedAWSCodeCommitRepo" href="#ExcludedAWSCodeCommitRepo">type ExcludedAWSCodeCommitRepo struct</a>

```
searchKey: schema.ExcludedAWSCodeCommitRepo
tags: [struct]
```

```Go
type ExcludedAWSCodeCommitRepo struct {
	// Id description: The ID of an AWS Code Commit repository (as returned by the AWS API) to exclude from mirroring. Use this to exclude the repository, even if renamed, or to differentiate between repositories with the same name in multiple regions.
	Id string `json:"id,omitempty"`
	// Name description: The name of an AWS CodeCommit repository ("repo-name") to exclude from mirroring.
	Name string `json:"name,omitempty"`
}
```

### <a id="ExcludedBitbucketCloudRepo" href="#ExcludedBitbucketCloudRepo">type ExcludedBitbucketCloudRepo struct</a>

```
searchKey: schema.ExcludedBitbucketCloudRepo
tags: [struct]
```

```Go
type ExcludedBitbucketCloudRepo struct {
	// Name description: The name of a Bitbucket Cloud repo ("myorg/myrepo") to exclude from mirroring.
	Name string `json:"name,omitempty"`
	// Pattern description: Regular expression which matches against the name of a Bitbucket Cloud repo.
	Pattern string `json:"pattern,omitempty"`
	// Uuid description: The UUID of a Bitbucket Cloud repo (as returned by the Bitbucket Cloud's API) to exclude from mirroring.
	Uuid string `json:"uuid,omitempty"`
}
```

### <a id="ExcludedBitbucketServerRepo" href="#ExcludedBitbucketServerRepo">type ExcludedBitbucketServerRepo struct</a>

```
searchKey: schema.ExcludedBitbucketServerRepo
tags: [struct]
```

```Go
type ExcludedBitbucketServerRepo struct {
	// Id description: The ID of a Bitbucket Server repo (as returned by the Bitbucket Server instance's API) to exclude from mirroring.
	Id int `json:"id,omitempty"`
	// Name description: The name of a Bitbucket Server repo ("projectKey/repositorySlug") to exclude from mirroring.
	Name string `json:"name,omitempty"`
	// Pattern description: Regular expression which matches against the name of a Bitbucket Server repo.
	Pattern string `json:"pattern,omitempty"`
}
```

### <a id="ExcludedGitHubRepo" href="#ExcludedGitHubRepo">type ExcludedGitHubRepo struct</a>

```
searchKey: schema.ExcludedGitHubRepo
tags: [struct]
```

```Go
type ExcludedGitHubRepo struct {
	// Archived description: If set to true, archived repositories will be excluded.
	Archived bool `json:"archived,omitempty"`
	// Forks description: If set to true, forks will be excluded.
	Forks bool `json:"forks,omitempty"`
	// Id description: The node ID of a GitHub repository (as returned by the GitHub instance's API) to exclude from mirroring. Use this to exclude the repository, even if renamed. Note: This is the GraphQL ID, not the GitHub database ID. eg: "curl https://api.github.com/repos/vuejs/vue | jq .node_id"
	Id string `json:"id,omitempty"`
	// Name description: The name of a GitHub repository ("owner/name") to exclude from mirroring.
	Name string `json:"name,omitempty"`
	// Pattern description: Regular expression which matches against the name of a GitHub repository ("owner/name").
	Pattern string `json:"pattern,omitempty"`
}
```

### <a id="ExcludedGitLabProject" href="#ExcludedGitLabProject">type ExcludedGitLabProject struct</a>

```
searchKey: schema.ExcludedGitLabProject
tags: [struct]
```

```Go
type ExcludedGitLabProject struct {
	// Id description: The ID of a GitLab project (as returned by the GitLab instance's API) to exclude from mirroring.
	Id int `json:"id,omitempty"`
	// Name description: The name of a GitLab project ("group/name") to exclude from mirroring.
	Name string `json:"name,omitempty"`
}
```

### <a id="ExcludedGitoliteRepo" href="#ExcludedGitoliteRepo">type ExcludedGitoliteRepo struct</a>

```
searchKey: schema.ExcludedGitoliteRepo
tags: [struct]
```

```Go
type ExcludedGitoliteRepo struct {
	// Name description: The name of a Gitolite repo ("my-repo") to exclude from mirroring.
	Name string `json:"name,omitempty"`
	// Pattern description: Regular expression which matches against the name of a Gitolite repo to exclude from mirroring.
	Pattern string `json:"pattern,omitempty"`
}
```

### <a id="ExpandedGitCommitDescription" href="#ExpandedGitCommitDescription">type ExpandedGitCommitDescription struct</a>

```
searchKey: schema.ExpandedGitCommitDescription
tags: [struct]
```

```Go
type ExpandedGitCommitDescription struct {
	// Author description: The author of the Git commit.
	Author *GitCommitAuthor `json:"author,omitempty"`
	// Message description: The Git commit message.
	Message string `json:"message"`
}
```

ExpandedGitCommitDescription description: The Git commit to create with the changes. 

### <a id="ExperimentalFeatures" href="#ExperimentalFeatures">type ExperimentalFeatures struct</a>

```
searchKey: schema.ExperimentalFeatures
tags: [struct]
```

```Go
type ExperimentalFeatures struct {
	// AndOrQuery description: DEPRECATED: Interpret a search input query as an and/or query.
	AndOrQuery string `json:"andOrQuery,omitempty"`
	// BitbucketServerFastPerm description: DEPRECATED: Configure in Bitbucket Server config.
	BitbucketServerFastPerm string `json:"bitbucketServerFastPerm,omitempty"`
	// CustomGitFetch description: JSON array of configuration that maps from Git clone URL domain/path to custom git fetch command.
	CustomGitFetch []*CustomGitFetchMapping `json:"customGitFetch,omitempty"`
	// DebugLog description: Turns on debug logging for specific debugging scenarios.
	DebugLog *DebugLog `json:"debug.log,omitempty"`
	// EnablePermissionsWebhooks description: Enables webhook consumers to sync permissions from external services faster than the defaults schedule
	EnablePermissionsWebhooks bool `json:"enablePermissionsWebhooks,omitempty"`
	// EnablePostSignupFlow description: Enables post sign-up user flow to add code hosts and sync code
	EnablePostSignupFlow bool `json:"enablePostSignupFlow,omitempty"`
	// EventLogging description: Enables user event logging inside of the Sourcegraph instance. This will allow admins to have greater visibility of user activity, such as frequently viewed pages, frequent searches, and more. These event logs (and any specific user actions) are only stored locally, and never leave this Sourcegraph instance.
	EventLogging string `json:"eventLogging,omitempty"`
	// Perforce description: Allow adding Perforce code host connections
	Perforce string `json:"perforce,omitempty"`
	// Ranking description: Experimental search result ranking options.
	Ranking *Ranking `json:"ranking,omitempty"`
	// RateLimitAnonymous description: Configures the hourly rate limits for anonymous calls to the GraphQL API. Setting limit to 0 disables the limiter. This is only relevant if unauthenticated calls to the API are permitted.
	RateLimitAnonymous int `json:"rateLimitAnonymous,omitempty"`
	// SearchIndexBranches description: A map from repository name to a list of extra revs (branch, ref, tag, commit sha, etc) to index for a repository. We always index the default branch ("HEAD") and revisions in version contexts. This allows specifying additional revisions. Sourcegraph can index up to 64 branches per repository.
	SearchIndexBranches map[string][]string `json:"search.index.branches,omitempty"`
	// SearchMultipleRevisionsPerRepository description: DEPRECATED. Always on. Will be removed in 3.19.
	SearchMultipleRevisionsPerRepository *bool `json:"searchMultipleRevisionsPerRepository,omitempty"`
	// StructuralSearch description: Enables structural search.
	StructuralSearch string `json:"structuralSearch,omitempty"`
	// TlsExternal description: Global TLS/SSL settings for Sourcegraph to use when communicating with code hosts.
	TlsExternal *TlsExternal `json:"tls.external,omitempty"`
	// VersionContexts description: JSON array of version context configuration
	VersionContexts []*VersionContext `json:"versionContexts,omitempty"`
}
```

ExperimentalFeatures description: Experimental features to enable or disable. Features that are now enabled by default are marked as deprecated. 

### <a id="ExtensionRepository" href="#ExtensionRepository">type ExtensionRepository struct</a>

```
searchKey: schema.ExtensionRepository
tags: [struct]
```

```Go
type ExtensionRepository struct {
	Type string `json:"type,omitempty"`
	Url  string `json:"url"`
}
```

ExtensionRepository description: The location of the version control repository for this extension. 

### <a id="Extensions" href="#Extensions">type Extensions struct</a>

```
searchKey: schema.Extensions
tags: [struct]
```

```Go
type Extensions struct {
	// AllowRemoteExtensions description: Allow only the explicitly listed remote extensions (by extension ID, such as "alice/myextension") from the remote registry. If not set, all remote extensions may be used from the remote registry. To completely disable the remote registry, set `remoteRegistry` to `false`.
	//
	// Only available in Sourcegraph Enterprise.
	AllowRemoteExtensions []string `json:"allowRemoteExtensions,omitempty"`
	// Disabled description: Disable all usage of extensions.
	Disabled *bool `json:"disabled,omitempty"`
	// RemoteRegistry description: The remote extension registry URL, or `false` to not use a remote extension registry. If not set, the default remote extension registry URL is used.
	RemoteRegistry interface{} `json:"remoteRegistry,omitempty"`
}
```

Extensions description: Configures Sourcegraph extensions. 

### <a id="ExternalIdentity" href="#ExternalIdentity">type ExternalIdentity struct</a>

```
searchKey: schema.ExternalIdentity
tags: [struct]
```

```Go
type ExternalIdentity struct {
	// AuthProviderID description: The value of the `configID` field of the targeted authentication provider.
	AuthProviderID string `json:"authProviderID"`
	// AuthProviderType description: The `type` field of the targeted authentication provider.
	AuthProviderType string `json:"authProviderType"`
	// GitlabProvider description: The name that identifies the authentication provider to GitLab. This is passed to the `?provider=` query parameter in calls to the GitLab Users API. If you're not sure what this value is, you can look at the `identities` field of the GitLab Users API result (`curl  -H 'PRIVATE-TOKEN: $YOUR_TOKEN' $GITLAB_URL/api/v4/users`).
	GitlabProvider string `json:"gitlabProvider"`
	Type           string `json:"type"`
}
```

### <a id="GitCommitAuthor" href="#GitCommitAuthor">type GitCommitAuthor struct</a>

```
searchKey: schema.GitCommitAuthor
tags: [struct]
```

```Go
type GitCommitAuthor struct {
	// Email description: The Git commit author email.
	Email string `json:"email"`
	// Name description: The Git commit author name.
	Name string `json:"name"`
}
```

GitCommitAuthor description: The author of the Git commit. 

### <a id="GitCommitDescription" href="#GitCommitDescription">type GitCommitDescription struct</a>

```
searchKey: schema.GitCommitDescription
tags: [struct]
```

```Go
type GitCommitDescription struct {
	// AuthorEmail description: The Git commit author email.
	AuthorEmail string `json:"authorEmail"`
	// AuthorName description: The Git commit author name.
	AuthorName string `json:"authorName"`
	// Diff description: The commit diff (in unified diff format).
	Diff string `json:"diff"`
	// Message description: The Git commit message.
	Message string `json:"message"`
}
```

GitCommitDescription description: The Git commit to create with the changes. 

### <a id="GitHubAuthProvider" href="#GitHubAuthProvider">type GitHubAuthProvider struct</a>

```
searchKey: schema.GitHubAuthProvider
tags: [struct]
```

```Go
type GitHubAuthProvider struct {
	// AllowOrgs description: Restricts new logins to members of these GitHub organizations. Existing sessions won't be invalidated. Leave empty or unset for no org restrictions.
	AllowOrgs []string `json:"allowOrgs,omitempty"`
	// AllowSignup description: Allows new visitors to sign up for accounts via GitHub authentication. If false, users signing in via GitHub must have an existing Sourcegraph account, which will be linked to their GitHub identity after sign-in.
	AllowSignup bool `json:"allowSignup,omitempty"`
	// ClientID description: The Client ID of the GitHub OAuth app, accessible from https://github.com/settings/developers (or the same path on GitHub Enterprise).
	ClientID string `json:"clientID"`
	// ClientSecret description: The Client Secret of the GitHub OAuth app, accessible from https://github.com/settings/developers (or the same path on GitHub Enterprise).
	ClientSecret string `json:"clientSecret"`
	DisplayName  string `json:"displayName,omitempty"`
	Type         string `json:"type"`
	// Url description: URL of the GitHub instance, such as https://github.com or https://github-enterprise.example.com.
	Url string `json:"url,omitempty"`
}
```

GitHubAuthProvider description: Configures the GitHub (or GitHub Enterprise) OAuth authentication provider for SSO. In addition to specifying this configuration object, you must also create a OAuth App on your GitHub instance: [https://developer.github.com/apps/building-oauth-apps/creating-an-oauth-app/](https://developer.github.com/apps/building-oauth-apps/creating-an-oauth-app/). When a user signs into Sourcegraph or links their GitHub account to their existing Sourcegraph account, GitHub will prompt the user for the repo scope. 

### <a id="GitHubAuthorization" href="#GitHubAuthorization">type GitHubAuthorization struct{}</a>

```
searchKey: schema.GitHubAuthorization
tags: [struct]
```

```Go
type GitHubAuthorization struct {
}
```

GitHubAuthorization description: If non-null, enforces GitHub repository permissions. This requires that there is an item in the `auth.providers` field of type "github" with the same `url` field as specified in this `GitHubConnection`. 

### <a id="GitHubConnection" href="#GitHubConnection">type GitHubConnection struct</a>

```
searchKey: schema.GitHubConnection
tags: [struct]
```

```Go
type GitHubConnection struct {
	// Authorization description: If non-null, enforces GitHub repository permissions. This requires that there is an item in the `auth.providers` field of type "github" with the same `url` field as specified in this `GitHubConnection`.
	Authorization *GitHubAuthorization `json:"authorization,omitempty"`
	// Certificate description: TLS certificate of the GitHub Enterprise instance. This is only necessary if the certificate is self-signed or signed by an internal CA. To get the certificate run `openssl s_client -connect HOST:443 -showcerts < /dev/null 2> /dev/null | openssl x509 -outform PEM`. To escape the value into a JSON string, you may want to use a tool like https://json-escape-text.now.sh.
	Certificate string `json:"certificate,omitempty"`
	// CloudDefault description: Only used to override the cloud_default column from a config file specified by EXTSVC_CONFIG_FILE
	CloudDefault bool `json:"cloudDefault,omitempty"`
	// CloudGlobal description: When set to true, this external service will be chosen as our 'Global' GitHub service. Only valid on Sourcegraph.com. Only one service can have this flag set.
	CloudGlobal bool `json:"cloudGlobal,omitempty"`
	// Exclude description: A list of repositories to never mirror from this GitHub instance. Takes precedence over "orgs", "repos", and "repositoryQuery" configuration.
	//
	// Supports excluding by name ({"name": "owner/name"}) or by ID ({"id": "MDEwOlJlcG9zaXRvcnkxMTczMDM0Mg=="}).
	//
	// Note: ID is the GitHub GraphQL ID, not the GitHub database ID. eg: "curl https://api.github.com/repos/vuejs/vue | jq .node_id"
	Exclude []*ExcludedGitHubRepo `json:"exclude,omitempty"`
	// GitURLType description: The type of Git URLs to use for cloning and fetching Git repositories on this GitHub instance.
	//
	// If "http", Sourcegraph will access GitHub repositories using Git URLs of the form http(s)://github.com/myteam/myproject.git (using https: if the GitHub instance uses HTTPS).
	//
	// If "ssh", Sourcegraph will access GitHub repositories using Git URLs of the form git@github.com:myteam/myproject.git. See the documentation for how to provide SSH private keys and known_hosts: https://docs.sourcegraph.com/admin/repo/auth#repositories-that-need-http-s-or-ssh-authentication.
	GitURLType string `json:"gitURLType,omitempty"`
	// InitialRepositoryEnablement description: Deprecated and ignored field which will be removed entirely in the next release. GitHub repositories can no longer be enabled or disabled explicitly. Configure repositories to be mirrored via "repos", "exclude" and "repositoryQuery" instead.
	InitialRepositoryEnablement bool `json:"initialRepositoryEnablement,omitempty"`
	// Orgs description: An array of organization names identifying GitHub organizations whose repositories should be mirrored on Sourcegraph.
	Orgs []string `json:"orgs,omitempty"`
	// RateLimit description: Rate limit applied when making background API requests to GitHub.
	RateLimit *GitHubRateLimit `json:"rateLimit,omitempty"`
	// Repos description: An array of repository "owner/name" strings specifying which GitHub or GitHub Enterprise repositories to mirror on Sourcegraph.
	Repos []string `json:"repos,omitempty"`
	// RepositoryPathPattern description: The pattern used to generate the corresponding Sourcegraph repository name for a GitHub or GitHub Enterprise repository. In the pattern, the variable "{host}" is replaced with the GitHub host (such as github.example.com), and "{nameWithOwner}" is replaced with the GitHub repository's "owner/path" (such as "myorg/myrepo").
	//
	// For example, if your GitHub Enterprise URL is https://github.example.com and your Sourcegraph URL is https://src.example.com, then a repositoryPathPattern of "{host}/{nameWithOwner}" would mean that a GitHub repository at https://github.example.com/myorg/myrepo is available on Sourcegraph at https://src.example.com/github.example.com/myorg/myrepo.
	//
	// It is important that the Sourcegraph repository name generated with this pattern be unique to this code host. If different code hosts generate repository names that collide, Sourcegraph's behavior is undefined.
	RepositoryPathPattern string `json:"repositoryPathPattern,omitempty"`
	// RepositoryQuery description: An array of strings specifying which GitHub or GitHub Enterprise repositories to mirror on Sourcegraph. The valid values are:
	//
	// - `public` mirrors all public repositories for GitHub Enterprise and is the equivalent of `none` for GitHub
	//
	// - `affiliated` mirrors all repositories affiliated with the configured token's user:
	// 	- Private repositories with read access
	// 	- Public repositories owned by the user or their orgs
	// 	- Public repositories with write access
	//
	// - `none` mirrors no repositories (except those specified in the `repos` configuration property or added manually)
	//
	// - All other values are executed as a GitHub advanced repository search as described at https://github.com/search/advanced. Example: to sync all repositories from the "sourcegraph" organization including forks the query would be "org:sourcegraph fork:true".
	//
	// If multiple values are provided, their results are unioned.
	//
	// If you need to narrow the set of mirrored repositories further (and don't want to enumerate it with a list or query set as above), create a new bot/machine user on GitHub or GitHub Enterprise that is only affiliated with the desired repositories.
	RepositoryQuery []string `json:"repositoryQuery,omitempty"`
	// Token description: A GitHub personal access token. Create one for GitHub.com at https://github.com/settings/tokens/new?description=Sourcegraph (for GitHub Enterprise, replace github.com with your instance's hostname). See https://docs.sourcegraph.com/admin/external_service/github#github-api-token-and-access for which scopes are required for which use cases.
	Token string `json:"token"`
	// Url description: URL of a GitHub instance, such as https://github.com or https://github-enterprise.example.com.
	Url string `json:"url"`
	// Webhooks description: An array of configurations defining existing GitHub webhooks that send updates back to Sourcegraph.
	Webhooks []*GitHubWebhook `json:"webhooks,omitempty"`
}
```

GitHubConnection description: Configuration for a connection to GitHub or GitHub Enterprise. 

#### <a id="GitHubConnection.SetRepos" href="#GitHubConnection.SetRepos">func (c *GitHubConnection) SetRepos(all bool, repos []string) error</a>

```
searchKey: schema.GitHubConnection.SetRepos
tags: [method]
```

```Go
func (c *GitHubConnection) SetRepos(all bool, repos []string) error
```

### <a id="GitHubRateLimit" href="#GitHubRateLimit">type GitHubRateLimit struct</a>

```
searchKey: schema.GitHubRateLimit
tags: [struct]
```

```Go
type GitHubRateLimit struct {
	// Enabled description: true if rate limiting is enabled.
	Enabled bool `json:"enabled"`
	// RequestsPerHour description: Requests per hour permitted. This is an average, calculated per second. Internally, the burst limit is set to 100, which implies that for a requests per hour limit as low as 1, users will continue to be able to send a maximum of 100 requests immediately, provided that the complexity cost of each request is 1.
	RequestsPerHour float64 `json:"requestsPerHour"`
}
```

GitHubRateLimit description: Rate limit applied when making background API requests to GitHub. 

### <a id="GitHubWebhook" href="#GitHubWebhook">type GitHubWebhook struct</a>

```
searchKey: schema.GitHubWebhook
tags: [struct]
```

```Go
type GitHubWebhook struct {
	// Org description: The name of the GitHub organization to which the webhook belongs
	Org string `json:"org"`
	// Secret description: The secret used when creating the webhook
	Secret string `json:"secret"`
}
```

### <a id="GitLabAuthProvider" href="#GitLabAuthProvider">type GitLabAuthProvider struct</a>

```
searchKey: schema.GitLabAuthProvider
tags: [struct]
```

```Go
type GitLabAuthProvider struct {
	// ClientID description: The Client ID of the GitLab OAuth app, accessible from https://gitlab.com/oauth/applications (or the same path on your private GitLab instance).
	ClientID string `json:"clientID"`
	// ClientSecret description: The Client Secret of the GitLab OAuth app, accessible from https://gitlab.com/oauth/applications (or the same path on your private GitLab instance).
	ClientSecret string `json:"clientSecret"`
	DisplayName  string `json:"displayName,omitempty"`
	Type         string `json:"type"`
	// Url description: URL of the GitLab instance, such as https://gitlab.com or https://gitlab.example.com.
	Url string `json:"url,omitempty"`
}
```

GitLabAuthProvider description: Configures the GitLab OAuth authentication provider for SSO. In addition to specifying this configuration object, you must also create a OAuth App on your GitLab instance: [https://docs.gitlab.com/ee/integration/oauth_provider.html](https://docs.gitlab.com/ee/integration/oauth_provider.html). The application should have `api` and `read_user` scopes and the callback URL set to the concatenation of your Sourcegraph instance URL and "/.auth/gitlab/callback". 

### <a id="GitLabAuthorization" href="#GitLabAuthorization">type GitLabAuthorization struct</a>

```
searchKey: schema.GitLabAuthorization
tags: [struct]
```

```Go
type GitLabAuthorization struct {
	// IdentityProvider description: The source of identity to use when computing permissions. This defines how to compute the GitLab identity to use for a given Sourcegraph user.
	IdentityProvider IdentityProvider `json:"identityProvider"`
}
```

GitLabAuthorization description: If non-null, enforces GitLab repository permissions. This requires that there be an item in the `auth.providers` field of type "gitlab" with the same `url` field as specified in this `GitLabConnection`. 

### <a id="GitLabConnection" href="#GitLabConnection">type GitLabConnection struct</a>

```
searchKey: schema.GitLabConnection
tags: [struct]
```

```Go
type GitLabConnection struct {
	// Authorization description: If non-null, enforces GitLab repository permissions. This requires that there be an item in the `auth.providers` field of type "gitlab" with the same `url` field as specified in this `GitLabConnection`.
	Authorization *GitLabAuthorization `json:"authorization,omitempty"`
	// Certificate description: TLS certificate of the GitLab instance. This is only necessary if the certificate is self-signed or signed by an internal CA. To get the certificate run `openssl s_client -connect HOST:443 -showcerts < /dev/null 2> /dev/null | openssl x509 -outform PEM`. To escape the value into a JSON string, you may want to use a tool like https://json-escape-text.now.sh.
	Certificate string `json:"certificate,omitempty"`
	// CloudDefault description: Only used to override the cloud_default column from a config file specified by EXTSVC_CONFIG_FILE
	CloudDefault bool `json:"cloudDefault,omitempty"`
	// CloudGlobal description: When set to true, this external service will be chosen as our 'Global' GitLab service. Only valid on Sourcegraph.com. Only one service can have this flag set.
	CloudGlobal bool `json:"cloudGlobal,omitempty"`
	// Exclude description: A list of projects to never mirror from this GitLab instance. Takes precedence over "projects" and "projectQuery" configuration. Supports excluding by name ({"name": "group/name"}) or by ID ({"id": 42}).
	Exclude []*ExcludedGitLabProject `json:"exclude,omitempty"`
	// GitURLType description: The type of Git URLs to use for cloning and fetching Git repositories on this GitLab instance.
	//
	// If "http", Sourcegraph will access GitLab repositories using Git URLs of the form http(s)://gitlab.example.com/myteam/myproject.git (using https: if the GitLab instance uses HTTPS).
	//
	// If "ssh", Sourcegraph will access GitLab repositories using Git URLs of the form git@example.gitlab.com:myteam/myproject.git. See the documentation for how to provide SSH private keys and known_hosts: https://docs.sourcegraph.com/admin/repo/auth#repositories-that-need-http-s-or-ssh-authentication.
	GitURLType string `json:"gitURLType,omitempty"`
	// InitialRepositoryEnablement description: Deprecated and ignored field which will be removed entirely in the next release. GitLab repositories can no longer be enabled or disabled explicitly.
	InitialRepositoryEnablement bool `json:"initialRepositoryEnablement,omitempty"`
	// NameTransformations description: An array of transformations will apply to the repository name. Currently, only regex replacement is supported. All transformations happen after "repositoryPathPattern" is processed.
	NameTransformations []*GitLabNameTransformation `json:"nameTransformations,omitempty"`
	// ProjectQuery description: An array of strings specifying which GitLab projects to mirror on Sourcegraph. Each string is a URL path and query that targets a GitLab API endpoint returning a list of projects. If the string only contains a query, then "projects" is used as the path. Examples: "?membership=true&search=foo", "groups/mygroup/projects".
	//
	// The special string "none" can be used as the only element to disable this feature. Projects matched by multiple query strings are only imported once. Here are a few endpoints that return a list of projects: https://docs.gitlab.com/ee/api/projects.html#list-all-projects, https://docs.gitlab.com/ee/api/groups.html#list-a-groups-projects, https://docs.gitlab.com/ee/api/search.html#scope-projects.
	ProjectQuery []string `json:"projectQuery"`
	// Projects description: A list of projects to mirror from this GitLab instance. Supports including by name ({"name": "group/name"}) or by ID ({"id": 42}).
	Projects []*GitLabProject `json:"projects,omitempty"`
	// RateLimit description: Rate limit applied when making background API requests to GitLab.
	RateLimit *GitLabRateLimit `json:"rateLimit,omitempty"`
	// RepositoryPathPattern description: The pattern used to generate a the corresponding Sourcegraph repository name for a GitLab project. In the pattern, the variable "{host}" is replaced with the GitLab URL's host (such as gitlab.example.com), and "{pathWithNamespace}" is replaced with the GitLab project's "namespace/path" (such as "myteam/myproject").
	//
	// For example, if your GitLab is https://gitlab.example.com and your Sourcegraph is https://src.example.com, then a repositoryPathPattern of "{host}/{pathWithNamespace}" would mean that a GitLab project at https://gitlab.example.com/myteam/myproject is available on Sourcegraph at https://src.example.com/gitlab.example.com/myteam/myproject.
	//
	// It is important that the Sourcegraph repository name generated with this pattern be unique to this code host. If different code hosts generate repository names that collide, Sourcegraph's behavior is undefined.
	RepositoryPathPattern string `json:"repositoryPathPattern,omitempty"`
	// Token description: A GitLab access token with "api" scope. Can be a personal access token (PAT) or an OAuth token. If you are enabling permissions with identity provider type "external", this token should also have "sudo" scope.
	Token string `json:"token"`
	// TokenType description: The type of the token
	TokenType string `json:"token.type,omitempty"`
	// Url description: URL of a GitLab instance, such as https://gitlab.example.com or (for GitLab.com) https://gitlab.com.
	Url string `json:"url"`
	// Webhooks description: An array of webhook configurations
	Webhooks []*GitLabWebhook `json:"webhooks,omitempty"`
}
```

GitLabConnection description: Configuration for a connection to GitLab (GitLab.com or GitLab self-managed). 

#### <a id="GitLabConnection.SetRepos" href="#GitLabConnection.SetRepos">func (c *GitLabConnection) SetRepos(all bool, repos []string) error</a>

```
searchKey: schema.GitLabConnection.SetRepos
tags: [method]
```

```Go
func (c *GitLabConnection) SetRepos(all bool, repos []string) error
```

### <a id="GitLabNameTransformation" href="#GitLabNameTransformation">type GitLabNameTransformation struct</a>

```
searchKey: schema.GitLabNameTransformation
tags: [struct]
```

```Go
type GitLabNameTransformation struct {
	// Regex description: The regex to match for the occurrences of its replacement.
	Regex string `json:"regex,omitempty"`
	// Replacement description: The replacement used to replace all matched occurrences by the regex.
	Replacement string `json:"replacement,omitempty"`
}
```

### <a id="GitLabProject" href="#GitLabProject">type GitLabProject struct</a>

```
searchKey: schema.GitLabProject
tags: [struct]
```

```Go
type GitLabProject struct {
	// Id description: The ID of a GitLab project (as returned by the GitLab instance's API) to mirror.
	Id int `json:"id,omitempty"`
	// Name description: The name of a GitLab project ("group/name") to mirror.
	Name string `json:"name,omitempty"`
}
```

### <a id="GitLabRateLimit" href="#GitLabRateLimit">type GitLabRateLimit struct</a>

```
searchKey: schema.GitLabRateLimit
tags: [struct]
```

```Go
type GitLabRateLimit struct {
	// Enabled description: true if rate limiting is enabled.
	Enabled bool `json:"enabled"`
	// RequestsPerHour description: Requests per hour permitted. This is an average, calculated per second. Internally the burst limit is set to 100, which implies that for a requests per hour limit as low as 1, users will continue to be able to send a maximum of 100 requests immediately, provided that the complexity cost of each request is 1.
	RequestsPerHour float64 `json:"requestsPerHour"`
}
```

GitLabRateLimit description: Rate limit applied when making background API requests to GitLab. 

### <a id="GitLabWebhook" href="#GitLabWebhook">type GitLabWebhook struct</a>

```
searchKey: schema.GitLabWebhook
tags: [struct]
```

```Go
type GitLabWebhook struct {
	// Secret description: The secret used to authenticate incoming webhook requests
	Secret string `json:"secret"`
}
```

### <a id="GitoliteConnection" href="#GitoliteConnection">type GitoliteConnection struct</a>

```
searchKey: schema.GitoliteConnection
tags: [struct]
```

```Go
type GitoliteConnection struct {
	// Exclude description: A list of repositories to never mirror from this Gitolite instance. Supports excluding by exact name ({"name": "foo"}).
	Exclude []*ExcludedGitoliteRepo `json:"exclude,omitempty"`
	// Host description: Gitolite host that stores the repositories (e.g., git@gitolite.example.com, ssh://git@gitolite.example.com:2222/).
	Host string `json:"host"`
	// Phabricator description: Phabricator instance that integrates with this Gitolite instance
	Phabricator *Phabricator `json:"phabricator,omitempty"`
	// PhabricatorMetadataCommand description: This is DEPRECATED. Use the `phabricator` field instead.
	PhabricatorMetadataCommand string `json:"phabricatorMetadataCommand,omitempty"`
	// Prefix description: Repository name prefix that will map to this Gitolite host. This should likely end with a trailing slash. E.g., "gitolite.example.com/".
	//
	// It is important that the Sourcegraph repository name generated with this prefix be unique to this code host. If different code hosts generate repository names that collide, Sourcegraph's behavior is undefined.
	Prefix string `json:"prefix"`
}
```

GitoliteConnection description: Configuration for a connection to Gitolite. 

### <a id="HTTPHeaderAuthProvider" href="#HTTPHeaderAuthProvider">type HTTPHeaderAuthProvider struct</a>

```
searchKey: schema.HTTPHeaderAuthProvider
tags: [struct]
```

```Go
type HTTPHeaderAuthProvider struct {
	// EmailHeader description: The name (case-insensitive) of an HTTP header whose value is taken to be the email of the client requesting the page. Set this value when using an HTTP proxy that authenticates requests, and you don't want the extra configurability of the other authentication methods.
	EmailHeader string `json:"emailHeader,omitempty"`
	// StripUsernameHeaderPrefix description: The prefix that precedes the username portion of the HTTP header specified in `usernameHeader`. If specified, the prefix will be stripped from the header value and the remainder will be used as the username. For example, if using Google Identity-Aware Proxy (IAP) with Google Sign-In, set this value to `accounts.google.com:`.
	StripUsernameHeaderPrefix string `json:"stripUsernameHeaderPrefix,omitempty"`
	Type                      string `json:"type"`
	// UsernameHeader description: The name (case-insensitive) of an HTTP header whose value is taken to be the username of the client requesting the page. Set this value when using an HTTP proxy that authenticates requests, and you don't want the extra configurability of the other authentication methods.
	UsernameHeader string `json:"usernameHeader"`
}
```

HTTPHeaderAuthProvider description: Configures the HTTP header authentication provider (which authenticates users by consulting an HTTP request header set by an authentication proxy such as [https://github.com/bitly/oauth2_proxy](https://github.com/bitly/oauth2_proxy)). 

### <a id="IdentityProvider" href="#IdentityProvider">type IdentityProvider struct</a>

```
searchKey: schema.IdentityProvider
tags: [struct]
```

```Go
type IdentityProvider struct {
	Oauth    *OAuthIdentity
	Username *UsernameIdentity
	External *ExternalIdentity
}
```

IdentityProvider description: The source of identity to use when computing permissions. This defines how to compute the GitLab identity to use for a given Sourcegraph user. 

#### <a id="IdentityProvider.MarshalJSON" href="#IdentityProvider.MarshalJSON">func (v IdentityProvider) MarshalJSON() ([]byte, error)</a>

```
searchKey: schema.IdentityProvider.MarshalJSON
tags: [method]
```

```Go
func (v IdentityProvider) MarshalJSON() ([]byte, error)
```

#### <a id="IdentityProvider.UnmarshalJSON" href="#IdentityProvider.UnmarshalJSON">func (v *IdentityProvider) UnmarshalJSON(data []byte) error</a>

```
searchKey: schema.IdentityProvider.UnmarshalJSON
tags: [method]
```

```Go
func (v *IdentityProvider) UnmarshalJSON(data []byte) error
```

### <a id="ImportChangesets" href="#ImportChangesets">type ImportChangesets struct</a>

```
searchKey: schema.ImportChangesets
tags: [struct]
```

```Go
type ImportChangesets struct {
	// ExternalIDs description: The changesets to import from the code host. For GitHub this is the PR number, for GitLab this is the MR number, for Bitbucket Server this is the PR number.
	ExternalIDs []interface{} `json:"externalIDs"`
	// Repository description: The repository name as configured on your Sourcegraph instance.
	Repository string `json:"repository"`
}
```

### <a id="Insight" href="#Insight">type Insight struct</a>

```
searchKey: schema.Insight
tags: [struct]
```

```Go
type Insight struct {
	// Description description: The description of this insight
	Description string `json:"description"`
	// Series description: Series of data to show for this insight
	Series []*InsightSeries `json:"series"`
	// Title description: The short title of this insight
	Title string `json:"title"`
}
```

### <a id="InsightSeries" href="#InsightSeries">type InsightSeries struct</a>

```
searchKey: schema.InsightSeries
tags: [struct]
```

```Go
type InsightSeries struct {
	// Label description: The label to use for the series in the graph.
	Label string `json:"label"`
	// RepositoriesList description: Performs a search query and shows the number of results returned.
	RepositoriesList []interface{} `json:"repositoriesList,omitempty"`
	// Search description: Performs a search query and shows the number of results returned.
	Search string `json:"search,omitempty"`
	// Webhook description: (not yet supported) Fetch data from a webhook URL.
	Webhook string `json:"webhook,omitempty"`
}
```

### <a id="Log" href="#Log">type Log struct</a>

```
searchKey: schema.Log
tags: [struct]
```

```Go
type Log struct {
	// Sentry description: Configuration for Sentry
	Sentry *Sentry `json:"sentry,omitempty"`
}
```

Log description: Configuration for logging and alerting, including to external services. 

### <a id="MenuItem" href="#MenuItem">type MenuItem struct</a>

```
searchKey: schema.MenuItem
tags: [struct]
```

```Go
type MenuItem struct {
	Action string `json:"action,omitempty"`
	Alt    string `json:"alt,omitempty"`
	When   string `json:"when,omitempty"`
}
```

### <a id="Menus" href="#Menus">type Menus struct</a>

```
searchKey: schema.Menus
tags: [struct]
```

```Go
type Menus struct {
	CommandPalette []*MenuItem `json:"commandPalette,omitempty"`
	EditorTitle    []*MenuItem `json:"editor/title,omitempty"`
	Help           []*MenuItem `json:"help,omitempty"`
}
```

Menus description: Describes where to place actions in menus. 

### <a id="MountedEncryptionKey" href="#MountedEncryptionKey">type MountedEncryptionKey struct</a>

```
searchKey: schema.MountedEncryptionKey
tags: [struct]
```

```Go
type MountedEncryptionKey struct {
	EnvVarName string `json:"envVarName,omitempty"`
	Filepath   string `json:"filepath,omitempty"`
	Keyname    string `json:"keyname"`
	Type       string `json:"type"`
	Version    string `json:"version,omitempty"`
}
```

MountedEncryptionKey description: This encryption key is mounted from a given file path or an environment variable. 

### <a id="NoOpEncryptionKey" href="#NoOpEncryptionKey">type NoOpEncryptionKey struct</a>

```
searchKey: schema.NoOpEncryptionKey
tags: [struct]
```

```Go
type NoOpEncryptionKey struct {
	Type string `json:"type"`
}
```

NoOpEncryptionKey description: This encryption key is a no op, leaving your data in plaintext (not recommended). 

### <a id="Notice" href="#Notice">type Notice struct</a>

```
searchKey: schema.Notice
tags: [struct]
```

```Go
type Notice struct {
	// Dismissible description: Whether this notice can be dismissed (closed) by the user.
	Dismissible bool `json:"dismissible,omitempty"`
	// Location description: The location where this notice is shown: "top" for the top of every page, "home" for the homepage.
	Location string `json:"location"`
	// Message description: The message to display. Markdown formatting is supported.
	Message string `json:"message"`
}
```

### <a id="Notifier" href="#Notifier">type Notifier struct</a>

```
searchKey: schema.Notifier
tags: [struct]
```

```Go
type Notifier struct {
	Slack     *NotifierSlack
	Pagerduty *NotifierPagerduty
	Webhook   *NotifierWebhook
	Email     *NotifierEmail
	Opsgenie  *NotifierOpsGenie
}
```

#### <a id="Notifier.MarshalJSON" href="#Notifier.MarshalJSON">func (v Notifier) MarshalJSON() ([]byte, error)</a>

```
searchKey: schema.Notifier.MarshalJSON
tags: [method]
```

```Go
func (v Notifier) MarshalJSON() ([]byte, error)
```

#### <a id="Notifier.UnmarshalJSON" href="#Notifier.UnmarshalJSON">func (v *Notifier) UnmarshalJSON(data []byte) error</a>

```
searchKey: schema.Notifier.UnmarshalJSON
tags: [method]
```

```Go
func (v *Notifier) UnmarshalJSON(data []byte) error
```

### <a id="NotifierEmail" href="#NotifierEmail">type NotifierEmail struct</a>

```
searchKey: schema.NotifierEmail
tags: [struct]
```

```Go
type NotifierEmail struct {
	// Address description: Address to send email to
	Address string `json:"address"`
	Type    string `json:"type"`
}
```

NotifierEmail description: Email notifier 

### <a id="NotifierOpsGenie" href="#NotifierOpsGenie">type NotifierOpsGenie struct</a>

```
searchKey: schema.NotifierOpsGenie
tags: [struct]
```

```Go
type NotifierOpsGenie struct {
	ApiKey   string `json:"apiKey,omitempty"`
	ApiUrl   string `json:"apiUrl,omitempty"`
	Priority string `json:"priority,omitempty"`
	// Responders description: List of responders responsible for notifications.
	Responders []*Responders `json:"responders,omitempty"`
	Type       string        `json:"type"`
}
```

NotifierOpsGenie description: OpsGenie notifier 

### <a id="NotifierPagerduty" href="#NotifierPagerduty">type NotifierPagerduty struct</a>

```
searchKey: schema.NotifierPagerduty
tags: [struct]
```

```Go
type NotifierPagerduty struct {
	ApiUrl string `json:"apiUrl,omitempty"`
	// IntegrationKey description: Integration key for the PagerDuty Events API v2 - see https://developer.pagerduty.com/docs/events-api-v2/overview
	IntegrationKey string `json:"integrationKey"`
	// Severity description: Severity level for PagerDuty alert
	Severity string `json:"severity,omitempty"`
	Type     string `json:"type"`
}
```

NotifierPagerduty description: PagerDuty notifier 

### <a id="NotifierSlack" href="#NotifierSlack">type NotifierSlack struct</a>

```
searchKey: schema.NotifierSlack
tags: [struct]
```

```Go
type NotifierSlack struct {
	// Icon_emoji description: Provide an emoji to use as the icon for the bot’s message. Ex :smile:
	Icon_emoji string `json:"icon_emoji,omitempty"`
	// Icon_url description: Provide a URL to an image to use as the icon for the bot’s message.
	Icon_url string `json:"icon_url,omitempty"`
	// Recipient description: Allows you to override the Slack recipient. You must either provide a channel Slack ID, a user Slack ID, a username reference (@<user>, all lowercase, no whitespace), or a channel reference (#<channel>, all lowercase, no whitespace).
	Recipient string `json:"recipient,omitempty"`
	Type      string `json:"type"`
	// Url description: Slack incoming webhook URL.
	Url string `json:"url,omitempty"`
	// Username description: Set the username for the bot’s message.
	Username string `json:"username,omitempty"`
}
```

NotifierSlack description: Slack notifier 

### <a id="NotifierWebhook" href="#NotifierWebhook">type NotifierWebhook struct</a>

```
searchKey: schema.NotifierWebhook
tags: [struct]
```

```Go
type NotifierWebhook struct {
	BearerToken string `json:"bearerToken,omitempty"`
	Password    string `json:"password,omitempty"`
	Type        string `json:"type"`
	Url         string `json:"url"`
	Username    string `json:"username,omitempty"`
}
```

NotifierWebhook description: Webhook notifier 

### <a id="OAuthIdentity" href="#OAuthIdentity">type OAuthIdentity struct</a>

```
searchKey: schema.OAuthIdentity
tags: [struct]
```

```Go
type OAuthIdentity struct {
	Type string `json:"type"`
}
```

### <a id="ObservabilityAlerts" href="#ObservabilityAlerts">type ObservabilityAlerts struct</a>

```
searchKey: schema.ObservabilityAlerts
tags: [struct]
```

```Go
type ObservabilityAlerts struct {
	// DisableSendResolved description: Disable notifications when alerts resolve themselves.
	DisableSendResolved bool `json:"disableSendResolved,omitempty"`
	// Level description: Sourcegraph alert level to subscribe to notifications for.
	Level    string   `json:"level"`
	Notifier Notifier `json:"notifier"`
	// Owners description: Do not use. When set, only receive alerts owned by the specified teams. Used by Sourcegraph internally.
	Owners []string `json:"owners,omitempty"`
}
```

### <a id="ObservabilityTracing" href="#ObservabilityTracing">type ObservabilityTracing struct</a>

```
searchKey: schema.ObservabilityTracing
tags: [struct]
```

```Go
type ObservabilityTracing struct {
	// Debug description: Turns on debug logging of opentracing client requests. This can be useful for debugging connectivity issues between the tracing client and the Jaeger agent, the performance overhead of tracing, and other issues related to the use of distributed tracing.
	Debug bool `json:"debug,omitempty"`
	// Sampling description: Determines the requests for which distributed traces are recorded. "none" (default) turns off tracing entirely. "selective" sends traces whenever `?trace=1` is present in the URL. "all" sends traces on every request. Note that this only affects the behavior of the distributed tracing client. The Jaeger instance must be running for traces to be collected (as described in the Sourcegraph installation instructions). Additional downsampling can be configured in Jaeger, itself (https://www.jaegertracing.io/docs/1.17/sampling)
	Sampling string `json:"sampling,omitempty"`
}
```

ObservabilityTracing description: Controls the settings for distributed tracing. 

### <a id="OnQuery" href="#OnQuery">type OnQuery struct</a>

```
searchKey: schema.OnQuery
tags: [struct]
```

```Go
type OnQuery struct {
	// RepositoriesMatchingQuery description: A Sourcegraph search query that matches a set of repositories (and branches). If the query matches files, symbols, or some other object inside a repository, the object's repository is included.
	RepositoriesMatchingQuery string `json:"repositoriesMatchingQuery"`
}
```

OnQuery description: A Sourcegraph search query that matches a set of repositories (and branches). Each matched repository branch is added to the list of repositories that the batch change will be run on. 

### <a id="OnRepository" href="#OnRepository">type OnRepository struct</a>

```
searchKey: schema.OnRepository
tags: [struct]
```

```Go
type OnRepository struct {
	// Branch description: The branch on the repository to propose changes to. If unset, the repository's default branch is used.
	Branch string `json:"branch,omitempty"`
	// Repository description: The name of the repository (as it is known to Sourcegraph).
	Repository string `json:"repository"`
}
```

OnRepository description: A specific repository (and branch) that is added to the list of repositories that the batch change will be run on. 

### <a id="OpenIDConnectAuthProvider" href="#OpenIDConnectAuthProvider">type OpenIDConnectAuthProvider struct</a>

```
searchKey: schema.OpenIDConnectAuthProvider
tags: [struct]
```

```Go
type OpenIDConnectAuthProvider struct {
	// ClientID description: The client ID for the OpenID Connect client for this site.
	//
	// For Google Apps: obtain this value from the API console (https://console.developers.google.com), as described at https://developers.google.com/identity/protocols/OpenIDConnect#getcredentials
	ClientID string `json:"clientID"`
	// ClientSecret description: The client secret for the OpenID Connect client for this site.
	//
	// For Google Apps: obtain this value from the API console (https://console.developers.google.com), as described at https://developers.google.com/identity/protocols/OpenIDConnect#getcredentials
	ClientSecret string `json:"clientSecret"`
	// ConfigID description: An identifier that can be used to reference this authentication provider in other parts of the config. For example, in configuration for a code host, you may want to designate this authentication provider as the identity provider for the code host.
	ConfigID    string `json:"configID,omitempty"`
	DisplayName string `json:"displayName,omitempty"`
	// Issuer description: The URL of the OpenID Connect issuer.
	//
	// For Google Apps: https://accounts.google.com
	Issuer string `json:"issuer"`
	// RequireEmailDomain description: Only allow users to authenticate if their email domain is equal to this value (example: mycompany.com). Do not include a leading "@". If not set, all users on this OpenID Connect provider can authenticate to Sourcegraph.
	RequireEmailDomain string `json:"requireEmailDomain,omitempty"`
	Type               string `json:"type"`
}
```

OpenIDConnectAuthProvider description: Configures the OpenID Connect authentication provider for SSO. 

### <a id="OtherExternalServiceConnection" href="#OtherExternalServiceConnection">type OtherExternalServiceConnection struct</a>

```
searchKey: schema.OtherExternalServiceConnection
tags: [struct]
```

```Go
type OtherExternalServiceConnection struct {
	Repos []string `json:"repos"`
	// RepositoryPathPattern description: The pattern used to generate the corresponding Sourcegraph repository name for the repositories. In the pattern, the variable "{base}" is replaced with the Git clone base URL host and path, and "{repo}" is replaced with the repository path taken from the `repos` field.
	//
	// For example, if your Git clone base URL is https://git.example.com/repos and `repos` contains the value "my/repo", then a repositoryPathPattern of "{base}/{repo}" would mean that a repository at https://git.example.com/repos/my/repo is available on Sourcegraph at https://sourcegraph.example.com/git.example.com/repos/my/repo.
	//
	// It is important that the Sourcegraph repository name generated with this pattern be unique to this code host. If different code hosts generate repository names that collide, Sourcegraph's behavior is undefined.
	RepositoryPathPattern string `json:"repositoryPathPattern,omitempty"`
	Url                   string `json:"url,omitempty"`
}
```

OtherExternalServiceConnection description: Configuration for a Connection to Git repositories for which an external service integration isn't yet available. 

### <a id="Overrides" href="#Overrides">type Overrides struct</a>

```
searchKey: schema.Overrides
tags: [struct]
```

```Go
type Overrides struct {
	// Key description: The key that we want to override for example a username
	Key string `json:"key,omitempty"`
	// Limit description: The limit per hour, 'unlimited' or 'blocked'
	Limit interface{} `json:"limit,omitempty"`
}
```

### <a id="ParentSourcegraph" href="#ParentSourcegraph">type ParentSourcegraph struct</a>

```
searchKey: schema.ParentSourcegraph
tags: [struct]
```

```Go
type ParentSourcegraph struct {
	Url string `json:"url,omitempty"`
}
```

ParentSourcegraph description: URL to fetch unreachable repository details from. Defaults to "[https://sourcegraph.com](https://sourcegraph.com)" 

### <a id="PerforceAuthorization" href="#PerforceAuthorization">type PerforceAuthorization struct{}</a>

```
searchKey: schema.PerforceAuthorization
tags: [struct]
```

```Go
type PerforceAuthorization struct {
}
```

PerforceAuthorization description: If non-null, enforces Perforce depot permissions. 

### <a id="PerforceConnection" href="#PerforceConnection">type PerforceConnection struct</a>

```
searchKey: schema.PerforceConnection
tags: [struct]
```

```Go
type PerforceConnection struct {
	// Authorization description: If non-null, enforces Perforce depot permissions.
	Authorization *PerforceAuthorization `json:"authorization,omitempty"`
	// Depots description: Depots can have arbitrary paths, e.g. a path to depot root or a subdirectory.
	Depots []string `json:"depots,omitempty"`
	// MaxChanges description: Only import at most n changes when possible (git p4 clone --max-changes).
	MaxChanges float64 `json:"maxChanges,omitempty"`
	// P4Passwd description: The ticket value for the user (P4PASSWD).
	P4Passwd string `json:"p4.passwd"`
	// P4Port description: The Perforce Server address to be used for p4 CLI (P4PORT).
	P4Port string `json:"p4.port"`
	// P4User description: The user to be authenticated for p4 CLI (P4USER).
	P4User string `json:"p4.user"`
	// RateLimit description: Rate limit applied when making background API requests to Perforce.
	RateLimit *PerforceRateLimit `json:"rateLimit,omitempty"`
	// RepositoryPathPattern description: The pattern used to generate the corresponding Sourcegraph repository name for a Perforce depot. In the pattern, the variable "{depot}" is replaced with the Perforce depot's path.
	//
	// For example, if your Perforce depot path is "//Sourcegraph/" and your Sourcegraph URL is https://src.example.com, then a repositoryPathPattern of "perforce/{depot}" would mean that the Perforce depot is available on Sourcegraph at https://src.example.com/perforce/Sourcegraph.
	//
	// It is important that the Sourcegraph repository name generated with this pattern be unique to this Perforce Server. If different Perforce Servers generate repository names that collide, Sourcegraph's behavior is undefined.
	RepositoryPathPattern string `json:"repositoryPathPattern,omitempty"`
}
```

PerforceConnection description: Configuration for a connection to Perforce Server. 

### <a id="PerforceRateLimit" href="#PerforceRateLimit">type PerforceRateLimit struct</a>

```
searchKey: schema.PerforceRateLimit
tags: [struct]
```

```Go
type PerforceRateLimit struct {
	// Enabled description: true if rate limiting is enabled.
	Enabled bool `json:"enabled"`
	// RequestsPerHour description: Requests per hour permitted. This is an average, calculated per second. Internally, the burst limit is set to 100, which implies that for a requests per hour limit as low as 1, users will continue to be able to send a maximum of 100 requests immediately, provided that the complexity cost of each request is 1.
	RequestsPerHour float64 `json:"requestsPerHour"`
}
```

PerforceRateLimit description: Rate limit applied when making background API requests to Perforce. 

### <a id="PermissionsUserMapping" href="#PermissionsUserMapping">type PermissionsUserMapping struct</a>

```
searchKey: schema.PermissionsUserMapping
tags: [struct]
```

```Go
type PermissionsUserMapping struct {
	// BindID description: The type of identifier to identify a user. The default is "email", which uses the email address to identify a user. Use "username" to identify a user by their username. Changing this setting will erase any permissions created for users that do not yet exist.
	BindID string `json:"bindID,omitempty"`
	// Enabled description: Whether permissions user mapping is enabled. There must be no `authorization` field in any external service configuration before enabling this.
	Enabled bool `json:"enabled,omitempty"`
}
```

PermissionsUserMapping description: Settings for Sourcegraph permissions, which allow the site admin to explicitly manage repository permissions via the GraphQL API. This setting cannot be enabled if repository permissions for any specific external service are enabled (i.e., when the external service's `authorization` field is set). 

### <a id="Phabricator" href="#Phabricator">type Phabricator struct</a>

```
searchKey: schema.Phabricator
tags: [struct]
```

```Go
type Phabricator struct {
	// CallsignCommand description:  Bash command that prints out the Phabricator callsign for a Gitolite repository. This will be run with environment variable $REPO set to the name of the repository and used to obtain the Phabricator metadata for a Gitolite repository. (Note: this requires `bash` to be installed.)
	CallsignCommand string `json:"callsignCommand"`
	// Url description: URL of the Phabricator instance that integrates with this Gitolite instance. This should be set
	Url string `json:"url"`
}
```

Phabricator description: Phabricator instance that integrates with this Gitolite instance 

### <a id="PhabricatorConnection" href="#PhabricatorConnection">type PhabricatorConnection struct</a>

```
searchKey: schema.PhabricatorConnection
tags: [struct]
```

```Go
type PhabricatorConnection struct {
	// Repos description: The list of repositories available on Phabricator.
	Repos []*Repos `json:"repos,omitempty"`
	// Token description: API token for the Phabricator instance.
	Token string `json:"token,omitempty"`
	// Url description: URL of a Phabricator instance, such as https://phabricator.example.com
	Url string `json:"url,omitempty"`
}
```

PhabricatorConnection description: Configuration for a connection to Phabricator. 

### <a id="QuickLink" href="#QuickLink">type QuickLink struct</a>

```
searchKey: schema.QuickLink
tags: [struct]
```

```Go
type QuickLink struct {
	// Description description: A description for this quick link
	Description string `json:"description,omitempty"`
	// Name description: The human-readable name for this quick link
	Name string `json:"name"`
	// Url description: The URL of this quick link (absolute or relative)
	Url string `json:"url"`
}
```

### <a id="Ranking" href="#Ranking">type Ranking struct</a>

```
searchKey: schema.Ranking
tags: [struct]
```

```Go
type Ranking struct {
	// RepoScores description: a map of URI directories to numeric scores for specifying search result importance, like {"github.com": 500, "github.com/sourcegraph": 300, "github.com/sourcegraph/sourcegraph": 100}. Would rank "github.com/sourcegraph/sourcegraph" as 500+300+100=900, and "github.com/other/foo" as 500.
	RepoScores map[string]float64 `json:"repoScores,omitempty"`
}
```

Ranking description: Experimental search result ranking options. 

### <a id="Repos" href="#Repos">type Repos struct</a>

```
searchKey: schema.Repos
tags: [struct]
```

```Go
type Repos struct {
	// Callsign description: The unique Phabricator identifier for the repository, like 'MUX'.
	Callsign string `json:"callsign"`
	// Path description: Display path for the url e.g. gitolite/my/repo
	Path string `json:"path"`
}
```

### <a id="Responders" href="#Responders">type Responders struct</a>

```
searchKey: schema.Responders
tags: [struct]
```

```Go
type Responders struct {
	Id       string `json:"id,omitempty"`
	Name     string `json:"name,omitempty"`
	Type     string `json:"type,omitempty"`
	Username string `json:"username,omitempty"`
}
```

### <a id="SAMLAuthProvider" href="#SAMLAuthProvider">type SAMLAuthProvider struct</a>

```
searchKey: schema.SAMLAuthProvider
tags: [struct]
```

```Go
type SAMLAuthProvider struct {
	// AllowSignup description: Allows new visitors to sign up for accounts via SAML authentication. If false, users signing in via SAML must have an existing Sourcegraph account, which will be linked to their SAML identity after sign-in.
	AllowSignup *bool `json:"allowSignup,omitempty"`
	// ConfigID description: An identifier that can be used to reference this authentication provider in other parts of the config. For example, in configuration for a code host, you may want to designate this authentication provider as the identity provider for the code host.
	ConfigID    string `json:"configID,omitempty"`
	DisplayName string `json:"displayName,omitempty"`
	// IdentityProviderMetadata description: The SAML Identity Provider metadata XML contents (for static configuration of the SAML Service Provider). The value of this field should be an XML document whose root element is `<EntityDescriptor>` or `<EntityDescriptors>`. To escape the value into a JSON string, you may want to use a tool like https://json-escape-text.now.sh.
	IdentityProviderMetadata string `json:"identityProviderMetadata,omitempty"`
	// IdentityProviderMetadataURL description: The SAML Identity Provider metadata URL (for dynamic configuration of the SAML Service Provider).
	IdentityProviderMetadataURL string `json:"identityProviderMetadataURL,omitempty"`
	// InsecureSkipAssertionSignatureValidation description: Whether the Service Provider should (insecurely) accept assertions from the Identity Provider without a valid signature.
	InsecureSkipAssertionSignatureValidation bool `json:"insecureSkipAssertionSignatureValidation,omitempty"`
	// NameIDFormat description: The SAML NameID format to use when performing user authentication.
	NameIDFormat string `json:"nameIDFormat,omitempty"`
	// ServiceProviderCertificate description: The SAML Service Provider certificate in X.509 encoding (begins with "-----BEGIN CERTIFICATE-----"). This certificate is used by the Identity Provider to validate the Service Provider's AuthnRequests and LogoutRequests. It corresponds to the Service Provider's private key (`serviceProviderPrivateKey`). To escape the value into a JSON string, you may want to use a tool like https://json-escape-text.now.sh.
	ServiceProviderCertificate string `json:"serviceProviderCertificate,omitempty"`
	// ServiceProviderIssuer description: The SAML Service Provider name, used to identify this Service Provider. This is required if the "externalURL" field is not set (as the SAML metadata endpoint is computed as "<externalURL>.auth/saml/metadata"), or when using multiple SAML authentication providers.
	ServiceProviderIssuer string `json:"serviceProviderIssuer,omitempty"`
	// ServiceProviderPrivateKey description: The SAML Service Provider private key in PKCS#8 encoding (begins with "-----BEGIN PRIVATE KEY-----"). This private key is used to sign AuthnRequests and LogoutRequests. It corresponds to the Service Provider's certificate (`serviceProviderCertificate`). To escape the value into a JSON string, you may want to use a tool like https://json-escape-text.now.sh.
	ServiceProviderPrivateKey string `json:"serviceProviderPrivateKey,omitempty"`
	// SignRequests description: Sign AuthnRequests and LogoutRequests sent to the Identity Provider using the Service Provider's private key (`serviceProviderPrivateKey`). It defaults to true if the `serviceProviderPrivateKey` and `serviceProviderCertificate` are set, and false otherwise.
	SignRequests *bool  `json:"signRequests,omitempty"`
	Type         string `json:"type"`
}
```

SAMLAuthProvider description: Configures the SAML authentication provider for SSO. 

Note: if you are using IdP-initiated login, you must have *at most one* SAMLAuthProvider in the `auth.providers` array. 

### <a id="SMTPServerConfig" href="#SMTPServerConfig">type SMTPServerConfig struct</a>

```
searchKey: schema.SMTPServerConfig
tags: [struct]
```

```Go
type SMTPServerConfig struct {
	// Authentication description: The type of authentication to use for the SMTP server.
	Authentication string `json:"authentication"`
	// DisableTLS description: DEPRECATED: use noVerifyTLS instead, this field will be removed in a future release
	DisableTLS bool `json:"disableTLS,omitempty"`
	// Domain description: The HELO domain to provide to the SMTP server (if needed).
	Domain string `json:"domain,omitempty"`
	// Host description: The SMTP server host.
	Host string `json:"host"`
	// NoVerifyTLS description: Disable TLS verification
	NoVerifyTLS bool `json:"noVerifyTLS,omitempty"`
	// Password description: The password to use when communicating with the SMTP server.
	Password string `json:"password,omitempty"`
	// Port description: The SMTP server port.
	Port int `json:"port"`
	// Username description: The username to use when communicating with the SMTP server.
	Username string `json:"username,omitempty"`
}
```

SMTPServerConfig description: The SMTP server used to send transactional emails (such as email verifications, reset-password emails, and notifications). 

### <a id="SearchLimits" href="#SearchLimits">type SearchLimits struct</a>

```
searchKey: schema.SearchLimits
tags: [struct]
```

```Go
type SearchLimits struct {
	// CommitDiffMaxRepos description: The maximum number of repositories to search across when doing a "type:diff" or "type:commit". The user is prompted to narrow their query if the limit is exceeded. There is a separate limit (commitDiffWithTimeFilterMaxRepos) when "after:" or "before:" is specified because those queries are faster. Defaults to 50.
	CommitDiffMaxRepos int `json:"commitDiffMaxRepos,omitempty"`
	// CommitDiffWithTimeFilterMaxRepos description: The maximum number of repositories to search across when doing a "type:diff" or "type:commit" with a "after:" or "before:" filter. The user is prompted to narrow their query if the limit is exceeded. There is a separate limit (commitDiffMaxRepos) when "after:" or "before:" is not specified because those queries are slower. Defaults to 10000.
	CommitDiffWithTimeFilterMaxRepos int `json:"commitDiffWithTimeFilterMaxRepos,omitempty"`
	// MaxRepos description: The maximum number of repositories to search across. The user is prompted to narrow their query if exceeded. Any value less than or equal to zero means unlimited.
	MaxRepos int `json:"maxRepos,omitempty"`
	// MaxTimeoutSeconds description: The maximum value for "timeout:" that search will respect. "timeout:" values larger than maxTimeoutSeconds are capped at maxTimeoutSeconds. Note: You need to ensure your load balancer / reverse proxy in front of Sourcegraph won't timeout the request for larger values. Note: Too many large rearch requests may harm Soucregraph for other users. Defaults to 1 minute.
	MaxTimeoutSeconds int `json:"maxTimeoutSeconds,omitempty"`
}
```

SearchLimits description: Limits that search applies for number of repositories searched and timeouts. 

### <a id="SearchSavedQueries" href="#SearchSavedQueries">type SearchSavedQueries struct</a>

```
searchKey: schema.SearchSavedQueries
tags: [struct]
```

```Go
type SearchSavedQueries struct {
	// Description description: Description of this saved query
	Description string `json:"description"`
	// Key description: Unique key for this query in this file
	Key string `json:"key"`
	// Notify description: Notify the owner of this configuration file when new results are available
	Notify bool `json:"notify,omitempty"`
	// NotifySlack description: Notify Slack via the organization's Slack webhook URL when new results are available
	NotifySlack bool `json:"notifySlack,omitempty"`
	// Query description: Query string
	Query string `json:"query"`
	// ShowOnHomepage description: DEPRECATED: saved searches are no longer shown on the homepage. This will be removed in a future release.
	ShowOnHomepage bool `json:"showOnHomepage,omitempty"`
}
```

### <a id="SearchScope" href="#SearchScope">type SearchScope struct</a>

```
searchKey: schema.SearchScope
tags: [struct]
```

```Go
type SearchScope struct {
	// Name description: The human-readable name for this search scope
	Name string `json:"name"`
	// Value description: The query string of this search scope
	Value string `json:"value"`
}
```

### <a id="Sentry" href="#Sentry">type Sentry struct</a>

```
searchKey: schema.Sentry
tags: [struct]
```

```Go
type Sentry struct {
	// BackendDSN description: Sentry Data Source Name (DSN) for backend errors. Per the Sentry docs (https://docs.sentry.io/quickstart/#about-the-dsn), it should match the following pattern: '{PROTOCOL}://{PUBLIC_KEY}@{HOST}/{PATH}{PROJECT_ID}'.
	BackendDSN string `json:"backendDSN,omitempty"`
	// Dsn description: Sentry Data Source Name (DSN). Per the Sentry docs (https://docs.sentry.io/quickstart/#about-the-dsn), it should match the following pattern: '{PROTOCOL}://{PUBLIC_KEY}@{HOST}/{PATH}{PROJECT_ID}'.
	Dsn string `json:"dsn,omitempty"`
}
```

Sentry description: Configuration for Sentry 

### <a id="Settings" href="#Settings">type Settings struct</a>

```
searchKey: schema.Settings
tags: [struct]
```

```Go
type Settings struct {
	// AlertsCodeHostIntegrationMessaging description: What in-app messaging to use around availability of Sourcegraph's code intelligence on code hosts. If the native code host integration is installed, this should be set to "native-integration" and users won't need to install the Sourcegraph browser extension to get code intelligence on code hosts.
	AlertsCodeHostIntegrationMessaging string `json:"alerts.codeHostIntegrationMessaging,omitempty"`
	// AlertsHideObservabilitySiteAlerts description: Disables observability-related site alert banners.
	AlertsHideObservabilitySiteAlerts *bool `json:"alerts.hideObservabilitySiteAlerts,omitempty"`
	// AlertsShowPatchUpdates description: Whether to show alerts for patch version updates. Alerts for major and minor version updates will always be shown.
	AlertsShowPatchUpdates bool `json:"alerts.showPatchUpdates,omitempty"`
	// CodeHostUseNativeTooltips description: Whether to use the code host's native hover tooltips when they exist (GitHub's jump-to-definition tooltips, for example).
	CodeHostUseNativeTooltips bool `json:"codeHost.useNativeTooltips,omitempty"`
	// ExperimentalFeatures description: Experimental features to enable or disable. Features that are now enabled by default are marked as deprecated.
	ExperimentalFeatures *SettingsExperimentalFeatures `json:"experimentalFeatures,omitempty"`
	// Extensions description: The Sourcegraph extensions to use. Enable an extension by adding a property `"my/extension": true` (where `my/extension` is the extension ID). Override a previously enabled extension and disable it by setting its value to `false`.
	Extensions map[string]bool `json:"extensions,omitempty"`
	// ExtensionsActiveLoggers description: The Sourcegraph extensions, by ID (e.g. `my/extension`), whose logs should be visible in the console.
	ExtensionsActiveLoggers []string `json:"extensions.activeLoggers,omitempty"`
	// Insights description: EXPERIMENTAL: Code Insights
	Insights                            []*Insight `json:"insights,omitempty"`
	InsightsDisplayLocationDirectory    *bool      `json:"insights.displayLocation.directory,omitempty"`
	InsightsDisplayLocationHomepage     *bool      `json:"insights.displayLocation.homepage,omitempty"`
	InsightsDisplayLocationInsightsPage *bool      `json:"insights.displayLocation.insightsPage,omitempty"`
	// Motd description: DEPRECATED: Use `notices` instead.
	//
	// An array (often with just one element) of messages to display at the top of all pages, including for unauthenticated users. Users may dismiss a message (and any message with the same string value will remain dismissed for the user).
	//
	// Markdown formatting is supported.
	//
	// Usually this setting is used in global and organization settings. If set in user settings, the message will only be displayed to that user. (This is useful for testing the correctness of the message's Markdown formatting.)
	//
	// MOTD stands for "message of the day" (which is the conventional Unix name for this type of message).
	Motd []string `json:"motd,omitempty"`
	// Notices description: Custom informational messages to display to users at specific locations in the Sourcegraph user interface.
	//
	// Usually this setting is used in global and organization settings. If set in user settings, the message will only be displayed to that single user.
	Notices []*Notice `json:"notices,omitempty"`
	// Quicklinks description: Links that should be accessible quickly from the home and search pages.
	Quicklinks []*QuickLink `json:"quicklinks,omitempty"`
	// SearchContextLines description: The default number of lines to show as context below and above search results. Default is 1.
	SearchContextLines int `json:"search.contextLines,omitempty"`
	// SearchDefaultCaseSensitive description: Whether query patterns are treated case sensitively. Patterns are case insensitive by default.
	SearchDefaultCaseSensitive bool `json:"search.defaultCaseSensitive,omitempty"`
	// SearchDefaultPatternType description: The default pattern type (literal or regexp) that search queries will be intepreted as.
	SearchDefaultPatternType string `json:"search.defaultPatternType,omitempty"`
	// SearchGlobbing description: Enables globbing for supported field values
	SearchGlobbing *bool `json:"search.globbing,omitempty"`
	// SearchHideSuggestions description: Disable search suggestions below the search bar when constructing queries. Defaults to false.
	SearchHideSuggestions *bool `json:"search.hideSuggestions,omitempty"`
	// SearchIncludeArchived description: Whether searches should include searching archived repositories.
	SearchIncludeArchived *bool `json:"search.includeArchived,omitempty"`
	// SearchIncludeForks description: Whether searches should include searching forked repositories.
	SearchIncludeForks *bool `json:"search.includeForks,omitempty"`
	// SearchMigrateParser description: REMOVED. Previously, a flag to enable and/or-expressions in queries as an aid transition to new language features in versions <= 3.24.0.
	SearchMigrateParser *bool `json:"search.migrateParser,omitempty"`
	// SearchRepositoryGroups description: Named groups of repositories that can be referenced in a search query using the `repogroup:` operator. The list can contain string literals (to include single repositories) and JSON objects with a "regex" field (to include all repositories matching the regular expression). Retrieving repogroups via the GQL interface will currently exclude repositories matched by regex patterns. #14208.
	SearchRepositoryGroups map[string][]interface{} `json:"search.repositoryGroups,omitempty"`
	// SearchSavedQueries description: DEPRECATED: Saved search queries
	SearchSavedQueries []*SearchSavedQueries `json:"search.savedQueries,omitempty"`
	// SearchScopes description: Predefined search snippets that can be appended to any search (also known as search scopes)
	SearchScopes []*SearchScope `json:"search.scopes,omitempty"`
	// SearchUppercase description: REMOVED. Previously, when active, any uppercase characters in the pattern will make the entire query case-sensitive.
	SearchUppercase *bool `json:"search.uppercase,omitempty"`
}
```

Settings description: Configuration settings for users and organizations on Sourcegraph. 

### <a id="SettingsExperimentalFeatures" href="#SettingsExperimentalFeatures">type SettingsExperimentalFeatures struct</a>

```
searchKey: schema.SettingsExperimentalFeatures
tags: [struct]
```

```Go
type SettingsExperimentalFeatures struct {
	// AcceptSearchSuggestionOnEnter description: Whether the search bar should select completion suggestions when pressing enter
	AcceptSearchSuggestionOnEnter *bool `json:"acceptSearchSuggestionOnEnter,omitempty"`
	// ApiDocs description: Enables API documentation.
	ApiDocs *bool `json:"apiDocs,omitempty"`
	// CodeInsights description: Enables code insights on directory pages.
	CodeInsights *bool `json:"codeInsights,omitempty"`
	// CodeMonitoring description: Enables code monitoring.
	CodeMonitoring *bool `json:"codeMonitoring,omitempty"`
	// CopyQueryButton description: DEPRECATED: This feature is now permanently enabled. Enables displaying the copy query button in the search bar when hovering over the global navigation bar.
	CopyQueryButton *bool `json:"copyQueryButton,omitempty"`
	// DesignRefreshToggleEnabled description: Enables access to the design refresh toggle in the user menu.
	DesignRefreshToggleEnabled *bool `json:"designRefreshToggleEnabled,omitempty"`
	// EnableFastResultLoading description: Enables optimized search result loading (syntax highlighting / file contents fetching)
	EnableFastResultLoading *bool `json:"enableFastResultLoading,omitempty"`
	// EnableSmartQuery description: Enables contextual syntax highlighting and hovers for search queries in the web app
	EnableSmartQuery *bool `json:"enableSmartQuery,omitempty"`
	// FuzzyFinder description: Enables fuzzy finder with keyboard shortcut `t`.
	FuzzyFinder *bool `json:"fuzzyFinder,omitempty"`
	// FuzzyFinderCaseInsensitiveFileCountThreshold description: The maximum number of files a repo can have to use case-insensitive fuzzy finding
	FuzzyFinderCaseInsensitiveFileCountThreshold *float64 `json:"fuzzyFinderCaseInsensitiveFileCountThreshold,omitempty"`
	// SearchStats description: Enables a button on the search results page that shows language statistics about the results for a search query.
	SearchStats *bool `json:"searchStats,omitempty"`
	// SearchStreaming description: DEPRECATED: This feature is now permanently enabled. Enables streaming search support.
	SearchStreaming *bool `json:"searchStreaming,omitempty"`
	// ShowCodeMonitoringTestEmailButton description: Enables the 'Send test email' debugging button for code monitoring.
	ShowCodeMonitoringTestEmailButton *bool `json:"showCodeMonitoringTestEmailButton,omitempty"`
	// ShowEnterpriseHomePanels description: Enabled the homepage panels in the Enterprise homepage
	ShowEnterpriseHomePanels *bool `json:"showEnterpriseHomePanels,omitempty"`
	// ShowMultilineSearchConsole description: Enables the multiline search console at search/console
	ShowMultilineSearchConsole *bool `json:"showMultilineSearchConsole,omitempty"`
	// ShowOnboardingTour description: Enables the onboarding tour.
	ShowOnboardingTour *bool `json:"showOnboardingTour,omitempty"`
	// ShowQueryBuilder description: Enables the search query builder page at search/query-builder
	ShowQueryBuilder *bool `json:"showQueryBuilder,omitempty"`
	// ShowRepogroupHomepage description: Enables the repository group homepage
	ShowRepogroupHomepage *bool `json:"showRepogroupHomepage,omitempty"`
	// ShowSearchContext description: Enables the search context dropdown.
	ShowSearchContext *bool `json:"showSearchContext,omitempty"`
	// ShowSearchContextManagement description: Enables search context management.
	ShowSearchContextManagement *bool `json:"showSearchContextManagement,omitempty"`
}
```

SettingsExperimentalFeatures description: Experimental features to enable or disable. Features that are now enabled by default are marked as deprecated. 

### <a id="SiteConfiguration" href="#SiteConfiguration">type SiteConfiguration struct</a>

```
searchKey: schema.SiteConfiguration
tags: [struct]
```

```Go
type SiteConfiguration struct {
	// ApiRatelimit description: Configuration for API rate limiting
	ApiRatelimit *ApiRatelimit `json:"api.ratelimit,omitempty"`
	// AuthAccessTokens description: Settings for access tokens, which enable external tools to access the Sourcegraph API with the privileges of the user.
	AuthAccessTokens *AuthAccessTokens `json:"auth.accessTokens,omitempty"`
	// AuthEnableUsernameChanges description: Enables users to change their username after account creation. Warning: setting this to be true has security implications if you have enabled (or will at any point in the future enable) repository permissions with an option that relies on username equivalency between Sourcegraph and an external service or authentication provider. Do NOT set this to true if you are using non-built-in authentication OR rely on username equivalency for repository permissions.
	AuthEnableUsernameChanges bool `json:"auth.enableUsernameChanges,omitempty"`
	// AuthMinPasswordLength description: The minimum number of Unicode code points that a password must contain.
	AuthMinPasswordLength int `json:"auth.minPasswordLength,omitempty"`
	// AuthPasswordResetLinkExpiry description: The duration (in seconds) that a password reset link is considered valid.
	AuthPasswordResetLinkExpiry int `json:"auth.passwordResetLinkExpiry,omitempty"`
	// AuthProviders description: The authentication providers to use for identifying and signing in users. See instructions below for configuring SAML, OpenID Connect (including Google Workspace), and HTTP authentication proxies. Multiple authentication providers are supported (by specifying multiple elements in this array).
	AuthProviders []AuthProviders `json:"auth.providers,omitempty"`
	// AuthPublic description: WARNING: This option has been removed as of 3.8.
	AuthPublic bool `json:"auth.public,omitempty"`
	// AuthSessionExpiry description: The duration of a user session, after which it expires and the user is required to re-authenticate. The default is 90 days. There is typically no need to set this, but some users may have specific internal security requirements.
	//
	// The string format is that of the Duration type in the Go time package (https://golang.org/pkg/time/#ParseDuration). E.g., "720h", "43200m", "2592000s" all indicate a timespan of 30 days.
	//
	// Note: changing this field does not affect the expiration of existing sessions. If you would like to enforce this limit for existing sessions, you must log out currently signed-in users. You can force this by removing all keys beginning with "session_" from the Redis store:
	//
	// * For deployments using `sourcegraph/server`: `docker exec $CONTAINER_ID redis-cli --raw keys 'session_*' | xargs docker exec $CONTAINER_ID redis-cli del`
	// * For cluster deployments:
	//   ```
	//   REDIS_POD="$(kubectl get pods -l app=redis-store -o jsonpath={.items[0].metadata.name})";
	//   kubectl exec "$REDIS_POD" -- redis-cli --raw keys 'session_*' | xargs kubectl exec "$REDIS_POD" -- redis-cli --raw del;
	//   ```
	//
	AuthSessionExpiry string `json:"auth.sessionExpiry,omitempty"`
	// AuthUserOrgMap description: Ensure that matching users are members of the specified orgs (auto-joining users to the orgs if they are not already a member). Provide a JSON object of the form `{"*": ["org1", "org2"]}`, where org1 and org2 are orgs that all users are automatically joined to. Currently the only supported key is `"*"`.
	AuthUserOrgMap map[string][]string `json:"auth.userOrgMap,omitempty"`
	// AuthzEnforceForSiteAdmins description: When true, site admins will only be able to see private code they have access to via our authz system.
	AuthzEnforceForSiteAdmins bool `json:"authz.enforceForSiteAdmins,omitempty"`
	// BatchChangesEnabled description: Enables/disables the Batch Changes feature.
	BatchChangesEnabled *bool `json:"batchChanges.enabled,omitempty"`
	// BatchChangesRestrictToAdmins description: When enabled, only site admins can create and apply batch changes.
	BatchChangesRestrictToAdmins *bool `json:"batchChanges.restrictToAdmins,omitempty"`
	// BatchChangesRolloutWindows description: Specifies specific windows, which can have associated rate limits, to be used when publishing changesets. All days and times are handled in UTC.
	BatchChangesRolloutWindows *[]*BatchChangeRolloutWindow `json:"batchChanges.rolloutWindows,omitempty"`
	// Branding description: Customize Sourcegraph homepage logo and search icon.
	//
	// Only available in Sourcegraph Enterprise.
	Branding *Branding `json:"branding,omitempty"`
	// CampaignsEnabled description: DEPRECATED: Use batchChanges.enabled instead. Enables/disables the campaigns feature.
	CampaignsEnabled *bool `json:"campaigns.enabled,omitempty"`
	// CampaignsRestrictToAdmins description: DEPRECATED: Use batchChanges.restrictToAdmins instead. When enabled, only site admins can create and apply campaigns.
	CampaignsRestrictToAdmins *bool `json:"campaigns.restrictToAdmins,omitempty"`
	// CodeIntelAutoIndexingEnabled description: Enables/disables the code intel auto indexing feature.
	CodeIntelAutoIndexingEnabled *bool `json:"codeIntelAutoIndexing.enabled,omitempty"`
	// CorsOrigin description: Required when using any of the native code host integrations for Phabricator, GitLab, or Bitbucket Server. It is a space-separated list of allowed origins for cross-origin HTTP requests which should be the base URL for your Phabricator, GitLab, or Bitbucket Server instance.
	CorsOrigin string `json:"corsOrigin,omitempty"`
	// DebugSearchSymbolsParallelism description: (debug) controls the amount of symbol search parallelism. Defaults to 20. It is not recommended to change this outside of debugging scenarios. This option will be removed in a future version.
	DebugSearchSymbolsParallelism int `json:"debug.search.symbolsParallelism,omitempty"`
	// DisableAutoCodeHostSyncs description: Disable periodic syncs of configured code host connections (repository metadata, permissions, batch changes changesets, etc)
	DisableAutoCodeHostSyncs bool `json:"disableAutoCodeHostSyncs,omitempty"`
	// DisableAutoGitUpdates description: Disable periodically fetching git contents for existing repositories.
	DisableAutoGitUpdates bool `json:"disableAutoGitUpdates,omitempty"`
	// DisableBuiltInSearches description: Whether built-in searches should be hidden on the Searches page.
	DisableBuiltInSearches bool `json:"disableBuiltInSearches,omitempty"`
	// DisableNonCriticalTelemetry description: Disable aggregated event counts from being sent to Sourcegraph.com via pings.
	DisableNonCriticalTelemetry bool `json:"disableNonCriticalTelemetry,omitempty"`
	// DisablePublicRepoRedirects description: Disable redirects to sourcegraph.com when visiting public repositories that can't exist on this server.
	DisablePublicRepoRedirects bool `json:"disablePublicRepoRedirects,omitempty"`
	// DontIncludeSymbolResultsByDefault description: Set to `true` to not include symbol results if no `type:` filter was given
	DontIncludeSymbolResultsByDefault bool `json:"dontIncludeSymbolResultsByDefault,omitempty"`
	// Dotcom description: Configuration options for Sourcegraph.com only.
	Dotcom *Dotcom `json:"dotcom,omitempty"`
	// EmailAddress description: The "from" address for emails sent by this server.
	EmailAddress string `json:"email.address,omitempty"`
	// EmailSmtp description: The SMTP server used to send transactional emails (such as email verifications, reset-password emails, and notifications).
	EmailSmtp *SMTPServerConfig `json:"email.smtp,omitempty"`
	// EncryptionKeys description: Configuration for encryption keys used to encrypt data at rest in the database.
	EncryptionKeys *EncryptionKeys `json:"encryption.keys,omitempty"`
	// ExperimentalFeatures description: Experimental features to enable or disable. Features that are now enabled by default are marked as deprecated.
	ExperimentalFeatures *ExperimentalFeatures `json:"experimentalFeatures,omitempty"`
	// Extensions description: Configures Sourcegraph extensions.
	Extensions *Extensions `json:"extensions,omitempty"`
	// ExternalServiceUserMode description: Enable to allow users to add external services for public and private repositories to the Sourcegraph instance.
	ExternalServiceUserMode string `json:"externalService.userMode,omitempty"`
	// ExternalURL description: The externally accessible URL for Sourcegraph (i.e., what you type into your browser). Previously called `appURL`. Only root URLs are allowed.
	ExternalURL string `json:"externalURL,omitempty"`
	// GitCloneURLToRepositoryName description: JSON array of configuration that maps from Git clone URL to repository name. Sourcegraph automatically resolves remote clone URLs to their proper code host. However, there may be non-remote clone URLs (e.g., in submodule declarations) that Sourcegraph cannot automatically map to a code host. In this case, use this field to specify the mapping. The mappings are tried in the order they are specified and take precedence over automatic mappings.
	GitCloneURLToRepositoryName []*CloneURLToRepositoryName `json:"git.cloneURLToRepositoryName,omitempty"`
	// GitMaxCodehostRequestsPerSecond description: Maximum number of remote code host git operations (e.g. clone or ls-remote) to be run per second per gitserver. Default is -1, which is unlimited.
	GitMaxCodehostRequestsPerSecond *int `json:"gitMaxCodehostRequestsPerSecond,omitempty"`
	// GitMaxConcurrentClones description: Maximum number of git clone processes that will be run concurrently per gitserver to update repositories. Note: the global git update scheduler respects gitMaxConcurrentClones. However, we allow each gitserver to run upto gitMaxConcurrentClones to allow for urgent fetches. Urgent fetches are used when a user is browsing a PR and we do not have the commit yet.
	GitMaxConcurrentClones int `json:"gitMaxConcurrentClones,omitempty"`
	// GitUpdateInterval description: JSON array of repo name patterns and update intervals. If a repo matches a pattern, the associated interval will be used. If it matches no patterns a default backoff heuristic will be used. Pattern matches are attempted in the order they are provided.
	GitUpdateInterval []*UpdateIntervalRule `json:"gitUpdateInterval,omitempty"`
	// GithubClientID description: Client ID for GitHub. (DEPRECATED)
	GithubClientID string `json:"githubClientID,omitempty"`
	// GithubClientSecret description: Client secret for GitHub. (DEPRECATED)
	GithubClientSecret string `json:"githubClientSecret,omitempty"`
	// HtmlBodyBottom description: HTML to inject at the bottom of the `<body>` element on each page, for analytics scripts
	HtmlBodyBottom string `json:"htmlBodyBottom,omitempty"`
	// HtmlBodyTop description: HTML to inject at the top of the `<body>` element on each page, for analytics scripts
	HtmlBodyTop string `json:"htmlBodyTop,omitempty"`
	// HtmlHeadBottom description: HTML to inject at the bottom of the `<head>` element on each page, for analytics scripts
	HtmlHeadBottom string `json:"htmlHeadBottom,omitempty"`
	// HtmlHeadTop description: HTML to inject at the top of the `<head>` element on each page, for analytics scripts
	HtmlHeadTop string `json:"htmlHeadTop,omitempty"`
	// InsightsHistoricalFrameLength description: (debug) duration of historical insights timeframes, one point per repository will be recorded in each timeframe.
	InsightsHistoricalFrameLength string `json:"insights.historical.frameLength,omitempty"`
	// InsightsHistoricalFrames description: (debug) number of historical insights timeframes to populate
	InsightsHistoricalFrames int `json:"insights.historical.frames,omitempty"`
	// InsightsHistoricalSpeedFactor description: (debug) Speed factor for building historical insights data. A value like 1.5 indicates approximately to use 1.5x as much repo-updater and gitserver resources.
	InsightsHistoricalSpeedFactor *float64 `json:"insights.historical.speedFactor,omitempty"`
	// InsightsHistoricalWorkerRateLimit description: Maximum number of historical Code Insights data frames that may be analyzed per second.
	InsightsHistoricalWorkerRateLimit *float64 `json:"insights.historical.worker.rateLimit,omitempty"`
	// InsightsQueryWorkerConcurrency description: Number of concurrent executions of a code insight query on a worker node
	InsightsQueryWorkerConcurrency int `json:"insights.query.worker.concurrency,omitempty"`
	// InsightsQueryWorkerRateLimit description: Maximum number of Code Insights queries initiated per second on a worker node.
	InsightsQueryWorkerRateLimit *float64 `json:"insights.query.worker.rateLimit,omitempty"`
	// LicenseKey description: The license key associated with a Sourcegraph product subscription, which is necessary to activate Sourcegraph Enterprise functionality. To obtain this value, contact Sourcegraph to purchase a subscription. To escape the value into a JSON string, you may want to use a tool like https://json-escape-text.now.sh.
	LicenseKey string `json:"licenseKey,omitempty"`
	// Log description: Configuration for logging and alerting, including to external services.
	Log *Log `json:"log,omitempty"`
	// LsifEnforceAuth description: Whether or not LSIF uploads will be blocked unless a valid LSIF upload token is provided.
	LsifEnforceAuth bool `json:"lsifEnforceAuth,omitempty"`
	// MaxReposToSearch description: DEPRECATED: Configure maxRepos in search.limits. The maximum number of repositories to search across. The user is prompted to narrow their query if exceeded. Any value less than or equal to zero means unlimited.
	MaxReposToSearch int `json:"maxReposToSearch,omitempty"`
	// ObservabilityAlerts description: Configure notifications for Sourcegraph's built-in alerts.
	ObservabilityAlerts []*ObservabilityAlerts `json:"observability.alerts,omitempty"`
	// ObservabilityLogSlowGraphQLRequests description: (debug) logs all GraphQL requests slower than the specified number of milliseconds.
	ObservabilityLogSlowGraphQLRequests int `json:"observability.logSlowGraphQLRequests,omitempty"`
	// ObservabilityLogSlowSearches description: (debug) logs all search queries (issued by users, code intelligence, or API requests) slower than the specified number of milliseconds.
	ObservabilityLogSlowSearches int `json:"observability.logSlowSearches,omitempty"`
	// ObservabilitySilenceAlerts description: Silence individual Sourcegraph alerts by identifier.
	ObservabilitySilenceAlerts []string `json:"observability.silenceAlerts,omitempty"`
	// ObservabilityTracing description: Controls the settings for distributed tracing.
	ObservabilityTracing *ObservabilityTracing `json:"observability.tracing,omitempty"`
	// ParentSourcegraph description: URL to fetch unreachable repository details from. Defaults to "https://sourcegraph.com"
	ParentSourcegraph *ParentSourcegraph `json:"parentSourcegraph,omitempty"`
	// PermissionsUserMapping description: Settings for Sourcegraph permissions, which allow the site admin to explicitly manage repository permissions via the GraphQL API. This setting cannot be enabled if repository permissions for any specific external service are enabled (i.e., when the external service's `authorization` field is set).
	PermissionsUserMapping *PermissionsUserMapping `json:"permissions.userMapping,omitempty"`
	// ProductResearchPageEnabled description: Enables users access to the product research page in their settings.
	ProductResearchPageEnabled *bool `json:"productResearchPage.enabled,omitempty"`
	// RepoConcurrentExternalServiceSyncers description: The number of concurrent external service syncers that can run.
	RepoConcurrentExternalServiceSyncers int `json:"repoConcurrentExternalServiceSyncers,omitempty"`
	// RepoListUpdateInterval description: Interval (in minutes) for checking code hosts (such as GitHub, Gitolite, etc.) for new repositories.
	RepoListUpdateInterval int `json:"repoListUpdateInterval,omitempty"`
	// SearchIndexEnabled description: Whether indexed search is enabled. If unset Sourcegraph detects the environment to decide if indexed search is enabled. Indexed search is RAM heavy, and is disabled by default in the single docker image. All other environments will have it enabled by default. The size of all your repository working copies is the amount of additional RAM required.
	SearchIndexEnabled *bool `json:"search.index.enabled,omitempty"`
	// SearchIndexSymbolsEnabled description: Whether indexed symbol search is enabled. This is contingent on the indexed search configuration, and is true by default for instances with indexed search enabled. Enabling this will cause every repository to re-index, which is a time consuming (several hours) operation. Additionally, it requires more storage and ram to accommodate the added symbols information in the search index.
	SearchIndexSymbolsEnabled *bool `json:"search.index.symbols.enabled,omitempty"`
	// SearchLargeFiles description: A list of file glob patterns where matching files will be indexed and searched regardless of their size. Files still need to be valid utf-8 to be indexed. The glob pattern syntax can be found here: https://golang.org/pkg/path/filepath/#Match.
	SearchLargeFiles []string `json:"search.largeFiles,omitempty"`
	// SearchLimits description: Limits that search applies for number of repositories searched and timeouts.
	SearchLimits *SearchLimits `json:"search.limits,omitempty"`
	// UpdateChannel description: The channel on which to automatically check for Sourcegraph updates.
	UpdateChannel string `json:"update.channel,omitempty"`
	// UseJaeger description: DEPRECATED. Use `"observability.tracing": { "sampling": "all" }`, instead. Enables Jaeger tracing.
	UseJaeger bool `json:"useJaeger,omitempty"`
	// UserReposMaxPerSite description: The site wide maximum number of repos that can be added by non site admins
	UserReposMaxPerSite int `json:"userRepos.maxPerSite,omitempty"`
	// UserReposMaxPerUser description: The per user maximum number of repos that can be added by non site admins
	UserReposMaxPerUser int `json:"userRepos.maxPerUser,omitempty"`
}
```

SiteConfiguration description: Configuration for a Sourcegraph site. 

### <a id="SourcegraphExtensionManifest" href="#SourcegraphExtensionManifest">type SourcegraphExtensionManifest struct</a>

```
searchKey: schema.SourcegraphExtensionManifest
tags: [struct]
```

```Go
type SourcegraphExtensionManifest struct {
	ActivationEvents []string                `json:"activationEvents"`
	Args             *map[string]interface{} `json:"args,omitempty"`
	Contributes      *Contributions          `json:"contributes,omitempty"`
	Description      string                  `json:"description,omitempty"`
	Icon             string                  `json:"icon,omitempty"`
	Readme           string                  `json:"readme,omitempty"`
	Repository       *ExtensionRepository    `json:"repository,omitempty"`
	Wip              bool                    `json:"wip,omitempty"`
	Url              string                  `json:"url"`
}
```

SourcegraphExtensionManifest description: The Sourcegraph extension manifest describes the extension and the features it provides. 

### <a id="Step" href="#Step">type Step struct</a>

```
searchKey: schema.Step
tags: [struct]
```

```Go
type Step struct {
	// Container description: The Docker image used to launch the Docker container in which the shell command is run.
	Container string `json:"container"`
	// Env description: Environment variables to set in the step environment.
	Env interface{} `json:"env,omitempty"`
	// Files description: Files that should be mounted into or be created inside the Docker container.
	Files map[string]string `json:"files,omitempty"`
	// If description: A condition to check before executing steps. Supports templating. The value 'true' is interpreted as true.
	If interface{} `json:"if,omitempty"`
	// Outputs description: Output variables of this step that can be referenced in the changesetTemplate or other steps via outputs.<name-of-output>
	Outputs map[string]AdditionalProperties `json:"outputs,omitempty"`
	// Run description: The shell command to run in the container. It can also be a multi-line shell script. The working directory is the root directory of the repository checkout.
	Run string `json:"run"`
}
```

Step description: A command to run (as part of a sequence) in a repository branch to produce the required changes. 

### <a id="TlsExternal" href="#TlsExternal">type TlsExternal struct</a>

```
searchKey: schema.TlsExternal
tags: [struct]
```

```Go
type TlsExternal struct {
	// Certificates description: TLS certificates to accept. This is only necessary if you are using self-signed certificates or an internal CA. Can be an internal CA certificate or a self-signed certificate. To get the certificate of a webserver run `openssl s_client -connect HOST:443 -showcerts < /dev/null 2> /dev/null | openssl x509 -outform PEM`. To escape the value into a JSON string, you may want to use a tool like https://json-escape-text.now.sh.
	Certificates []string `json:"certificates,omitempty"`
	// InsecureSkipVerify description: insecureSkipVerify controls whether a client verifies the server's certificate chain and host name.
	// If InsecureSkipVerify is true, TLS accepts any certificate presented by the server and any host name in that certificate. In this mode, TLS is susceptible to man-in-the-middle attacks.
	InsecureSkipVerify bool `json:"insecureSkipVerify,omitempty"`
}
```

TlsExternal description: Global TLS/SSL settings for Sourcegraph to use when communicating with code hosts. 

### <a id="TransformChanges" href="#TransformChanges">type TransformChanges struct</a>

```
searchKey: schema.TransformChanges
tags: [struct]
```

```Go
type TransformChanges struct {
	// Group description: A list of groups of changes in a repository that each create a separate, additional changeset for this repository, with all ungrouped changes being in the default changeset.
	Group []interface{} `json:"group,omitempty"`
}
```

TransformChanges description: Optional transformations to apply to the changes produced in each repository. 

### <a id="UpdateIntervalRule" href="#UpdateIntervalRule">type UpdateIntervalRule struct</a>

```
searchKey: schema.UpdateIntervalRule
tags: [struct]
```

```Go
type UpdateIntervalRule struct {
	// Interval description: An integer representing the number of minutes to wait until the next update
	Interval int `json:"interval"`
	// Pattern description: A regular expression matching a repo name
	Pattern string `json:"pattern"`
}
```

### <a id="UsernameIdentity" href="#UsernameIdentity">type UsernameIdentity struct</a>

```
searchKey: schema.UsernameIdentity
tags: [struct]
```

```Go
type UsernameIdentity struct {
	Type string `json:"type"`
}
```

### <a id="VersionContext" href="#VersionContext">type VersionContext struct</a>

```
searchKey: schema.VersionContext
tags: [struct]
```

```Go
type VersionContext struct {
	// Description description: Description of the version context
	Description string `json:"description,omitempty"`
	// Name description: Name of the version context, it must be unique.
	Name string `json:"name"`
	// Revisions description: List of repositories of the version context
	Revisions []*VersionContextRevision `json:"revisions"`
}
```

VersionContext description: Configuration of the version context 

### <a id="VersionContextRevision" href="#VersionContextRevision">type VersionContextRevision struct</a>

```
searchKey: schema.VersionContextRevision
tags: [struct]
```

```Go
type VersionContextRevision struct {
	// Repo description: Repository name
	Repo string `json:"repo"`
	// Rev description: Branch, tag, or commit hash. "HEAD" or "" can be used for the default branch.
	Rev string `json:"rev"`
}
```

VersionContextRevision description: Description of the chosen repository and revision 

### <a id="Webhooks" href="#Webhooks">type Webhooks struct</a>

```
searchKey: schema.Webhooks
tags: [struct]
```

```Go
type Webhooks struct {
	// Secret description: Secret for authenticating incoming webhook payloads
	Secret string `json:"secret,omitempty"`
}
```

Webhooks description: DEPRECATED: Switch to "plugin.webhooks" 

### <a id="WorkspaceConfiguration" href="#WorkspaceConfiguration">type WorkspaceConfiguration struct</a>

```
searchKey: schema.WorkspaceConfiguration
tags: [struct]
```

```Go
type WorkspaceConfiguration struct {
	// In description: The repositories in which to apply the workspace configuration. Supports globbing.
	In string `json:"in,omitempty"`
	// OnlyFetchWorkspace description: If this is true only the files in the workspace (and additional .gitignore) are downloaded instead of an archive of the full repository.
	OnlyFetchWorkspace bool `json:"onlyFetchWorkspace,omitempty"`
	// RootAtLocationOf description: The name of the file that sits at the root of the desired workspace.
	RootAtLocationOf string `json:"rootAtLocationOf"`
}
```

WorkspaceConfiguration description: Configuration for how to setup workspaces in repositories 

