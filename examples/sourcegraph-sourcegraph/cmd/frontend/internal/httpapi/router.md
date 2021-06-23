# Package router

Package router contains the URL router for the HTTP API. 

## Index

* [Constants](#const)
    * [const LSIFUpload](#LSIFUpload)
    * [const GraphQL](#GraphQL)
    * [const SearchStream](#SearchStream)
    * [const SrcCliVersion](#SrcCliVersion)
    * [const SrcCliDownload](#SrcCliDownload)
    * [const Registry](#Registry)
    * [const RepoShield](#RepoShield)
    * [const RepoRefresh](#RepoRefresh)
    * [const Telemetry](#Telemetry)
    * [const GitHubWebhooks](#GitHubWebhooks)
    * [const GitLabWebhooks](#GitLabWebhooks)
    * [const BitbucketServerWebhooks](#BitbucketServerWebhooks)
    * [const SavedQueriesListAll](#SavedQueriesListAll)
    * [const SavedQueriesGetInfo](#SavedQueriesGetInfo)
    * [const SavedQueriesSetInfo](#SavedQueriesSetInfo)
    * [const SavedQueriesDeleteInfo](#SavedQueriesDeleteInfo)
    * [const SettingsGetForSubject](#SettingsGetForSubject)
    * [const OrgsListUsers](#OrgsListUsers)
    * [const OrgsGetByName](#OrgsGetByName)
    * [const UsersGetByUsername](#UsersGetByUsername)
    * [const UserEmailsGetEmail](#UserEmailsGetEmail)
    * [const ExternalURL](#ExternalURL)
    * [const CanSendEmail](#CanSendEmail)
    * [const SendEmail](#SendEmail)
    * [const Extension](#Extension)
    * [const GitExec](#GitExec)
    * [const GitInfoRefs](#GitInfoRefs)
    * [const GitResolveRevision](#GitResolveRevision)
    * [const GitTar](#GitTar)
    * [const GitUploadPack](#GitUploadPack)
    * [const PhabricatorRepoCreate](#PhabricatorRepoCreate)
    * [const ReposGetByName](#ReposGetByName)
    * [const ReposInventoryUncached](#ReposInventoryUncached)
    * [const ReposInventory](#ReposInventory)
    * [const ReposList](#ReposList)
    * [const ReposIndex](#ReposIndex)
    * [const ReposListEnabled](#ReposListEnabled)
    * [const Configuration](#Configuration)
    * [const SearchConfiguration](#SearchConfiguration)
    * [const ExternalServiceConfigs](#ExternalServiceConfigs)
    * [const ExternalServicesList](#ExternalServicesList)
* [Functions](#func)
    * [func New(base *mux.Router) *mux.Router](#New)
    * [func NewInternal(base *mux.Router) *mux.Router](#NewInternal)
    * [func addRegistryRoute(m *mux.Router)](#addRegistryRoute)
    * [func addGraphQLRoute(m *mux.Router)](#addGraphQLRoute)


## <a id="const" href="#const">Constants</a>

```
tags: [private]
```

### <a id="LSIFUpload" href="#LSIFUpload">const LSIFUpload</a>

```
searchKey: router.LSIFUpload
```

```Go
const LSIFUpload = "lsif.upload"
```

### <a id="GraphQL" href="#GraphQL">const GraphQL</a>

```
searchKey: router.GraphQL
```

```Go
const GraphQL = "graphql"
```

### <a id="SearchStream" href="#SearchStream">const SearchStream</a>

```
searchKey: router.SearchStream
```

```Go
const SearchStream = "search.stream"
```

### <a id="SrcCliVersion" href="#SrcCliVersion">const SrcCliVersion</a>

```
searchKey: router.SrcCliVersion
```

```Go
const SrcCliVersion = "src-cli.version"
```

### <a id="SrcCliDownload" href="#SrcCliDownload">const SrcCliDownload</a>

```
searchKey: router.SrcCliDownload
```

```Go
const SrcCliDownload = "src-cli.download"
```

### <a id="Registry" href="#Registry">const Registry</a>

```
searchKey: router.Registry
```

```Go
const Registry = "registry"
```

### <a id="RepoShield" href="#RepoShield">const RepoShield</a>

```
searchKey: router.RepoShield
```

```Go
const RepoShield = "repo.shield"
```

### <a id="RepoRefresh" href="#RepoRefresh">const RepoRefresh</a>

```
searchKey: router.RepoRefresh
```

```Go
const RepoRefresh = "repo.refresh"
```

### <a id="Telemetry" href="#Telemetry">const Telemetry</a>

```
searchKey: router.Telemetry
```

```Go
const Telemetry = "telemetry"
```

### <a id="GitHubWebhooks" href="#GitHubWebhooks">const GitHubWebhooks</a>

```
searchKey: router.GitHubWebhooks
```

```Go
const GitHubWebhooks = "github.webhooks"
```

### <a id="GitLabWebhooks" href="#GitLabWebhooks">const GitLabWebhooks</a>

```
searchKey: router.GitLabWebhooks
```

```Go
const GitLabWebhooks = "gitlab.webhooks"
```

### <a id="BitbucketServerWebhooks" href="#BitbucketServerWebhooks">const BitbucketServerWebhooks</a>

```
searchKey: router.BitbucketServerWebhooks
```

```Go
const BitbucketServerWebhooks = "bitbucketServer.webhooks"
```

### <a id="SavedQueriesListAll" href="#SavedQueriesListAll">const SavedQueriesListAll</a>

```
searchKey: router.SavedQueriesListAll
```

```Go
const SavedQueriesListAll = "internal.saved-queries.list-all"
```

### <a id="SavedQueriesGetInfo" href="#SavedQueriesGetInfo">const SavedQueriesGetInfo</a>

```
searchKey: router.SavedQueriesGetInfo
```

```Go
const SavedQueriesGetInfo = "internal.saved-queries.get-info"
```

### <a id="SavedQueriesSetInfo" href="#SavedQueriesSetInfo">const SavedQueriesSetInfo</a>

```
searchKey: router.SavedQueriesSetInfo
```

```Go
const SavedQueriesSetInfo = "internal.saved-queries.set-info"
```

### <a id="SavedQueriesDeleteInfo" href="#SavedQueriesDeleteInfo">const SavedQueriesDeleteInfo</a>

```
searchKey: router.SavedQueriesDeleteInfo
```

```Go
const SavedQueriesDeleteInfo = "internal.saved-queries.delete-info"
```

### <a id="SettingsGetForSubject" href="#SettingsGetForSubject">const SettingsGetForSubject</a>

```
searchKey: router.SettingsGetForSubject
```

```Go
const SettingsGetForSubject = "internal.settings.get-for-subject"
```

### <a id="OrgsListUsers" href="#OrgsListUsers">const OrgsListUsers</a>

```
searchKey: router.OrgsListUsers
```

```Go
const OrgsListUsers = "internal.orgs.list-users"
```

### <a id="OrgsGetByName" href="#OrgsGetByName">const OrgsGetByName</a>

```
searchKey: router.OrgsGetByName
```

```Go
const OrgsGetByName = "internal.orgs.get-by-name"
```

### <a id="UsersGetByUsername" href="#UsersGetByUsername">const UsersGetByUsername</a>

```
searchKey: router.UsersGetByUsername
```

```Go
const UsersGetByUsername = "internal.users.get-by-username"
```

### <a id="UserEmailsGetEmail" href="#UserEmailsGetEmail">const UserEmailsGetEmail</a>

```
searchKey: router.UserEmailsGetEmail
```

```Go
const UserEmailsGetEmail = "internal.user-emails.get-email"
```

### <a id="ExternalURL" href="#ExternalURL">const ExternalURL</a>

```
searchKey: router.ExternalURL
```

```Go
const ExternalURL = "internal.app-url"
```

### <a id="CanSendEmail" href="#CanSendEmail">const CanSendEmail</a>

```
searchKey: router.CanSendEmail
```

```Go
const CanSendEmail = "internal.can-send-email"
```

### <a id="SendEmail" href="#SendEmail">const SendEmail</a>

```
searchKey: router.SendEmail
```

```Go
const SendEmail = "internal.send-email"
```

### <a id="Extension" href="#Extension">const Extension</a>

```
searchKey: router.Extension
```

```Go
const Extension = "internal.extension"
```

### <a id="GitExec" href="#GitExec">const GitExec</a>

```
searchKey: router.GitExec
```

```Go
const GitExec = "internal.git.exec"
```

### <a id="GitInfoRefs" href="#GitInfoRefs">const GitInfoRefs</a>

```
searchKey: router.GitInfoRefs
```

```Go
const GitInfoRefs = "internal.git.info-refs"
```

### <a id="GitResolveRevision" href="#GitResolveRevision">const GitResolveRevision</a>

```
searchKey: router.GitResolveRevision
```

```Go
const GitResolveRevision = "internal.git.resolve-revision"
```

### <a id="GitTar" href="#GitTar">const GitTar</a>

```
searchKey: router.GitTar
```

```Go
const GitTar = "internal.git.tar"
```

### <a id="GitUploadPack" href="#GitUploadPack">const GitUploadPack</a>

```
searchKey: router.GitUploadPack
```

```Go
const GitUploadPack = "internal.git.upload-pack"
```

### <a id="PhabricatorRepoCreate" href="#PhabricatorRepoCreate">const PhabricatorRepoCreate</a>

```
searchKey: router.PhabricatorRepoCreate
```

```Go
const PhabricatorRepoCreate = "internal.phabricator.repo.create"
```

### <a id="ReposGetByName" href="#ReposGetByName">const ReposGetByName</a>

```
searchKey: router.ReposGetByName
```

```Go
const ReposGetByName = "internal.repos.get-by-name"
```

### <a id="ReposInventoryUncached" href="#ReposInventoryUncached">const ReposInventoryUncached</a>

```
searchKey: router.ReposInventoryUncached
```

```Go
const ReposInventoryUncached = "internal.repos.inventory-uncached"
```

### <a id="ReposInventory" href="#ReposInventory">const ReposInventory</a>

```
searchKey: router.ReposInventory
```

```Go
const ReposInventory = "internal.repos.inventory"
```

### <a id="ReposList" href="#ReposList">const ReposList</a>

```
searchKey: router.ReposList
```

```Go
const ReposList = "internal.repos.list"
```

### <a id="ReposIndex" href="#ReposIndex">const ReposIndex</a>

```
searchKey: router.ReposIndex
```

```Go
const ReposIndex = "internal.repos.index"
```

### <a id="ReposListEnabled" href="#ReposListEnabled">const ReposListEnabled</a>

```
searchKey: router.ReposListEnabled
```

```Go
const ReposListEnabled = "internal.repos.list-enabled"
```

### <a id="Configuration" href="#Configuration">const Configuration</a>

```
searchKey: router.Configuration
```

```Go
const Configuration = "internal.configuration"
```

### <a id="SearchConfiguration" href="#SearchConfiguration">const SearchConfiguration</a>

```
searchKey: router.SearchConfiguration
```

```Go
const SearchConfiguration = "internal.search-configuration"
```

### <a id="ExternalServiceConfigs" href="#ExternalServiceConfigs">const ExternalServiceConfigs</a>

```
searchKey: router.ExternalServiceConfigs
```

```Go
const ExternalServiceConfigs = "internal.external-services.configs"
```

### <a id="ExternalServicesList" href="#ExternalServicesList">const ExternalServicesList</a>

```
searchKey: router.ExternalServicesList
```

```Go
const ExternalServicesList = "internal.external-services.list"
```

## <a id="func" href="#func">Functions</a>

```
tags: [private]
```

### <a id="New" href="#New">func New(base *mux.Router) *mux.Router</a>

```
searchKey: router.New
```

```Go
func New(base *mux.Router) *mux.Router
```

New creates a new API router with route URL pattern definitions but no handlers attached to the routes. 

### <a id="NewInternal" href="#NewInternal">func NewInternal(base *mux.Router) *mux.Router</a>

```
searchKey: router.NewInternal
```

```Go
func NewInternal(base *mux.Router) *mux.Router
```

NewInternal creates a new API router for internal endpoints. 

### <a id="addRegistryRoute" href="#addRegistryRoute">func addRegistryRoute(m *mux.Router)</a>

```
searchKey: router.addRegistryRoute
tags: [private]
```

```Go
func addRegistryRoute(m *mux.Router)
```

### <a id="addGraphQLRoute" href="#addGraphQLRoute">func addGraphQLRoute(m *mux.Router)</a>

```
searchKey: router.addGraphQLRoute
tags: [private]
```

```Go
func addGraphQLRoute(m *mux.Router)
```

