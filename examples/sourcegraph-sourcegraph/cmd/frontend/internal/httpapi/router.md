# Package router

Package router contains the URL router for the HTTP API. 

## Index

* [Constants](#const)
    * [const BitbucketServerWebhooks](#BitbucketServerWebhooks)
    * [const CanSendEmail](#CanSendEmail)
    * [const Configuration](#Configuration)
    * [const Extension](#Extension)
    * [const ExternalServiceConfigs](#ExternalServiceConfigs)
    * [const ExternalServicesList](#ExternalServicesList)
    * [const ExternalURL](#ExternalURL)
    * [const GitExec](#GitExec)
    * [const GitHubWebhooks](#GitHubWebhooks)
    * [const GitInfoRefs](#GitInfoRefs)
    * [const GitLabWebhooks](#GitLabWebhooks)
    * [const GitResolveRevision](#GitResolveRevision)
    * [const GitTar](#GitTar)
    * [const GitUploadPack](#GitUploadPack)
    * [const GraphQL](#GraphQL)
    * [const LSIFUpload](#LSIFUpload)
    * [const OrgsGetByName](#OrgsGetByName)
    * [const OrgsListUsers](#OrgsListUsers)
    * [const PhabricatorRepoCreate](#PhabricatorRepoCreate)
    * [const Registry](#Registry)
    * [const RepoRefresh](#RepoRefresh)
    * [const RepoShield](#RepoShield)
    * [const ReposGetByName](#ReposGetByName)
    * [const ReposIndex](#ReposIndex)
    * [const ReposInventory](#ReposInventory)
    * [const ReposInventoryUncached](#ReposInventoryUncached)
    * [const ReposList](#ReposList)
    * [const ReposListEnabled](#ReposListEnabled)
    * [const SavedQueriesDeleteInfo](#SavedQueriesDeleteInfo)
    * [const SavedQueriesGetInfo](#SavedQueriesGetInfo)
    * [const SavedQueriesListAll](#SavedQueriesListAll)
    * [const SavedQueriesSetInfo](#SavedQueriesSetInfo)
    * [const SearchConfiguration](#SearchConfiguration)
    * [const SearchStream](#SearchStream)
    * [const SendEmail](#SendEmail)
    * [const SettingsGetForSubject](#SettingsGetForSubject)
    * [const SrcCliDownload](#SrcCliDownload)
    * [const SrcCliVersion](#SrcCliVersion)
    * [const Telemetry](#Telemetry)
    * [const UserEmailsGetEmail](#UserEmailsGetEmail)
    * [const UsersGetByUsername](#UsersGetByUsername)
* [Functions](#func)
    * [func New(base *mux.Router) *mux.Router](#New)
    * [func NewInternal(base *mux.Router) *mux.Router](#NewInternal)
    * [func addGraphQLRoute(m *mux.Router)](#addGraphQLRoute)
    * [func addRegistryRoute(m *mux.Router)](#addRegistryRoute)


## <a id="const" href="#const">Constants</a>

```
tags: [private]
```

### <a id="BitbucketServerWebhooks" href="#BitbucketServerWebhooks">const BitbucketServerWebhooks</a>

```
searchKey: router.BitbucketServerWebhooks
tags: [constant string]
```

```Go
const BitbucketServerWebhooks = "bitbucketServer.webhooks"
```

### <a id="CanSendEmail" href="#CanSendEmail">const CanSendEmail</a>

```
searchKey: router.CanSendEmail
tags: [constant string]
```

```Go
const CanSendEmail = "internal.can-send-email"
```

### <a id="Configuration" href="#Configuration">const Configuration</a>

```
searchKey: router.Configuration
tags: [constant string]
```

```Go
const Configuration = "internal.configuration"
```

### <a id="Extension" href="#Extension">const Extension</a>

```
searchKey: router.Extension
tags: [constant string]
```

```Go
const Extension = "internal.extension"
```

### <a id="ExternalServiceConfigs" href="#ExternalServiceConfigs">const ExternalServiceConfigs</a>

```
searchKey: router.ExternalServiceConfigs
tags: [constant string]
```

```Go
const ExternalServiceConfigs = "internal.external-services.configs"
```

### <a id="ExternalServicesList" href="#ExternalServicesList">const ExternalServicesList</a>

```
searchKey: router.ExternalServicesList
tags: [constant string]
```

```Go
const ExternalServicesList = "internal.external-services.list"
```

### <a id="ExternalURL" href="#ExternalURL">const ExternalURL</a>

```
searchKey: router.ExternalURL
tags: [constant string]
```

```Go
const ExternalURL = "internal.app-url"
```

### <a id="GitExec" href="#GitExec">const GitExec</a>

```
searchKey: router.GitExec
tags: [constant string]
```

```Go
const GitExec = "internal.git.exec"
```

### <a id="GitHubWebhooks" href="#GitHubWebhooks">const GitHubWebhooks</a>

```
searchKey: router.GitHubWebhooks
tags: [constant string]
```

```Go
const GitHubWebhooks = "github.webhooks"
```

### <a id="GitInfoRefs" href="#GitInfoRefs">const GitInfoRefs</a>

```
searchKey: router.GitInfoRefs
tags: [constant string]
```

```Go
const GitInfoRefs = "internal.git.info-refs"
```

### <a id="GitLabWebhooks" href="#GitLabWebhooks">const GitLabWebhooks</a>

```
searchKey: router.GitLabWebhooks
tags: [constant string]
```

```Go
const GitLabWebhooks = "gitlab.webhooks"
```

### <a id="GitResolveRevision" href="#GitResolveRevision">const GitResolveRevision</a>

```
searchKey: router.GitResolveRevision
tags: [constant string]
```

```Go
const GitResolveRevision = "internal.git.resolve-revision"
```

### <a id="GitTar" href="#GitTar">const GitTar</a>

```
searchKey: router.GitTar
tags: [constant string]
```

```Go
const GitTar = "internal.git.tar"
```

### <a id="GitUploadPack" href="#GitUploadPack">const GitUploadPack</a>

```
searchKey: router.GitUploadPack
tags: [constant string]
```

```Go
const GitUploadPack = "internal.git.upload-pack"
```

### <a id="GraphQL" href="#GraphQL">const GraphQL</a>

```
searchKey: router.GraphQL
tags: [constant string]
```

```Go
const GraphQL = "graphql"
```

### <a id="LSIFUpload" href="#LSIFUpload">const LSIFUpload</a>

```
searchKey: router.LSIFUpload
tags: [constant string]
```

```Go
const LSIFUpload = "lsif.upload"
```

### <a id="OrgsGetByName" href="#OrgsGetByName">const OrgsGetByName</a>

```
searchKey: router.OrgsGetByName
tags: [constant string]
```

```Go
const OrgsGetByName = "internal.orgs.get-by-name"
```

### <a id="OrgsListUsers" href="#OrgsListUsers">const OrgsListUsers</a>

```
searchKey: router.OrgsListUsers
tags: [constant string]
```

```Go
const OrgsListUsers = "internal.orgs.list-users"
```

### <a id="PhabricatorRepoCreate" href="#PhabricatorRepoCreate">const PhabricatorRepoCreate</a>

```
searchKey: router.PhabricatorRepoCreate
tags: [constant string]
```

```Go
const PhabricatorRepoCreate = "internal.phabricator.repo.create"
```

### <a id="Registry" href="#Registry">const Registry</a>

```
searchKey: router.Registry
tags: [constant string]
```

```Go
const Registry = "registry"
```

### <a id="RepoRefresh" href="#RepoRefresh">const RepoRefresh</a>

```
searchKey: router.RepoRefresh
tags: [constant string]
```

```Go
const RepoRefresh = "repo.refresh"
```

### <a id="RepoShield" href="#RepoShield">const RepoShield</a>

```
searchKey: router.RepoShield
tags: [constant string]
```

```Go
const RepoShield = "repo.shield"
```

### <a id="ReposGetByName" href="#ReposGetByName">const ReposGetByName</a>

```
searchKey: router.ReposGetByName
tags: [constant string]
```

```Go
const ReposGetByName = "internal.repos.get-by-name"
```

### <a id="ReposIndex" href="#ReposIndex">const ReposIndex</a>

```
searchKey: router.ReposIndex
tags: [constant string]
```

```Go
const ReposIndex = "internal.repos.index"
```

### <a id="ReposInventory" href="#ReposInventory">const ReposInventory</a>

```
searchKey: router.ReposInventory
tags: [constant string]
```

```Go
const ReposInventory = "internal.repos.inventory"
```

### <a id="ReposInventoryUncached" href="#ReposInventoryUncached">const ReposInventoryUncached</a>

```
searchKey: router.ReposInventoryUncached
tags: [constant string]
```

```Go
const ReposInventoryUncached = "internal.repos.inventory-uncached"
```

### <a id="ReposList" href="#ReposList">const ReposList</a>

```
searchKey: router.ReposList
tags: [constant string]
```

```Go
const ReposList = "internal.repos.list"
```

### <a id="ReposListEnabled" href="#ReposListEnabled">const ReposListEnabled</a>

```
searchKey: router.ReposListEnabled
tags: [constant string]
```

```Go
const ReposListEnabled = "internal.repos.list-enabled"
```

### <a id="SavedQueriesDeleteInfo" href="#SavedQueriesDeleteInfo">const SavedQueriesDeleteInfo</a>

```
searchKey: router.SavedQueriesDeleteInfo
tags: [constant string]
```

```Go
const SavedQueriesDeleteInfo = "internal.saved-queries.delete-info"
```

### <a id="SavedQueriesGetInfo" href="#SavedQueriesGetInfo">const SavedQueriesGetInfo</a>

```
searchKey: router.SavedQueriesGetInfo
tags: [constant string]
```

```Go
const SavedQueriesGetInfo = "internal.saved-queries.get-info"
```

### <a id="SavedQueriesListAll" href="#SavedQueriesListAll">const SavedQueriesListAll</a>

```
searchKey: router.SavedQueriesListAll
tags: [constant string]
```

```Go
const SavedQueriesListAll = "internal.saved-queries.list-all"
```

### <a id="SavedQueriesSetInfo" href="#SavedQueriesSetInfo">const SavedQueriesSetInfo</a>

```
searchKey: router.SavedQueriesSetInfo
tags: [constant string]
```

```Go
const SavedQueriesSetInfo = "internal.saved-queries.set-info"
```

### <a id="SearchConfiguration" href="#SearchConfiguration">const SearchConfiguration</a>

```
searchKey: router.SearchConfiguration
tags: [constant string]
```

```Go
const SearchConfiguration = "internal.search-configuration"
```

### <a id="SearchStream" href="#SearchStream">const SearchStream</a>

```
searchKey: router.SearchStream
tags: [constant string]
```

```Go
const SearchStream = "search.stream"
```

### <a id="SendEmail" href="#SendEmail">const SendEmail</a>

```
searchKey: router.SendEmail
tags: [constant string]
```

```Go
const SendEmail = "internal.send-email"
```

### <a id="SettingsGetForSubject" href="#SettingsGetForSubject">const SettingsGetForSubject</a>

```
searchKey: router.SettingsGetForSubject
tags: [constant string]
```

```Go
const SettingsGetForSubject = "internal.settings.get-for-subject"
```

### <a id="SrcCliDownload" href="#SrcCliDownload">const SrcCliDownload</a>

```
searchKey: router.SrcCliDownload
tags: [constant string]
```

```Go
const SrcCliDownload = "src-cli.download"
```

### <a id="SrcCliVersion" href="#SrcCliVersion">const SrcCliVersion</a>

```
searchKey: router.SrcCliVersion
tags: [constant string]
```

```Go
const SrcCliVersion = "src-cli.version"
```

### <a id="Telemetry" href="#Telemetry">const Telemetry</a>

```
searchKey: router.Telemetry
tags: [constant string]
```

```Go
const Telemetry = "telemetry"
```

### <a id="UserEmailsGetEmail" href="#UserEmailsGetEmail">const UserEmailsGetEmail</a>

```
searchKey: router.UserEmailsGetEmail
tags: [constant string]
```

```Go
const UserEmailsGetEmail = "internal.user-emails.get-email"
```

### <a id="UsersGetByUsername" href="#UsersGetByUsername">const UsersGetByUsername</a>

```
searchKey: router.UsersGetByUsername
tags: [constant string]
```

```Go
const UsersGetByUsername = "internal.users.get-by-username"
```

## <a id="func" href="#func">Functions</a>

```
tags: [private]
```

### <a id="New" href="#New">func New(base *mux.Router) *mux.Router</a>

```
searchKey: router.New
tags: [function]
```

```Go
func New(base *mux.Router) *mux.Router
```

New creates a new API router with route URL pattern definitions but no handlers attached to the routes. 

### <a id="NewInternal" href="#NewInternal">func NewInternal(base *mux.Router) *mux.Router</a>

```
searchKey: router.NewInternal
tags: [function]
```

```Go
func NewInternal(base *mux.Router) *mux.Router
```

NewInternal creates a new API router for internal endpoints. 

### <a id="addGraphQLRoute" href="#addGraphQLRoute">func addGraphQLRoute(m *mux.Router)</a>

```
searchKey: router.addGraphQLRoute
tags: [function private]
```

```Go
func addGraphQLRoute(m *mux.Router)
```

### <a id="addRegistryRoute" href="#addRegistryRoute">func addRegistryRoute(m *mux.Router)</a>

```
searchKey: router.addRegistryRoute
tags: [function private]
```

```Go
func addRegistryRoute(m *mux.Router)
```

