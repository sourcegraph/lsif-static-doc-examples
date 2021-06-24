# Package webhookhandlers

## Index

* [Types](#type)
    * [type memberGetter interface](#memberGetter)
    * [type membershipGetter interface](#membershipGetter)
    * [type repoGetter interface](#repoGetter)
* [Functions](#func)
    * [func Init(w *webhooks.GitHubWebhook)](#Init)
    * [func handleGitHubRepoAuthzEvent(ctx context.Context, extSvc *types.ExternalService, payload interface{}) error](#handleGitHubRepoAuthzEvent)
    * [func handleGitHubUserAuthzEvent(ctx context.Context, extSvc *types.ExternalService, payload interface{}) error](#handleGitHubUserAuthzEvent)
    * [func scheduleRepoUpdate(ctx context.Context, repo *gh.Repository) error](#scheduleRepoUpdate)
    * [func scheduleUserUpdate(ctx context.Context, extSvc *types.ExternalService, githubUser *gh.User) error](#scheduleUserUpdate)


## <a id="type" href="#type">Types</a>

```
tags: [package private]
```

### <a id="memberGetter" href="#memberGetter">type memberGetter interface</a>

```
searchKey: webhookhandlers.memberGetter
tags: [interface private]
```

```Go
type memberGetter interface {
	GetMember() *gh.User
}
```

### <a id="membershipGetter" href="#membershipGetter">type membershipGetter interface</a>

```
searchKey: webhookhandlers.membershipGetter
tags: [interface private]
```

```Go
type membershipGetter interface {
	GetMembership() *gh.Membership
}
```

### <a id="repoGetter" href="#repoGetter">type repoGetter interface</a>

```
searchKey: webhookhandlers.repoGetter
tags: [interface private]
```

```Go
type repoGetter interface {
	GetRepo() *gh.Repository
}
```

## <a id="func" href="#func">Functions</a>

```
tags: [package private]
```

### <a id="Init" href="#Init">func Init(w *webhooks.GitHubWebhook)</a>

```
searchKey: webhookhandlers.Init
tags: [method]
```

```Go
func Init(w *webhooks.GitHubWebhook)
```

### <a id="handleGitHubRepoAuthzEvent" href="#handleGitHubRepoAuthzEvent">func handleGitHubRepoAuthzEvent(ctx context.Context, extSvc *types.ExternalService, payload interface{}) error</a>

```
searchKey: webhookhandlers.handleGitHubRepoAuthzEvent
tags: [method private]
```

```Go
func handleGitHubRepoAuthzEvent(ctx context.Context, extSvc *types.ExternalService, payload interface{}) error
```

handleGithubRepoAuthzEvent handles any github event containing a repository field, and enqueues the contained repo for permissions synchronisation. 

### <a id="handleGitHubUserAuthzEvent" href="#handleGitHubUserAuthzEvent">func handleGitHubUserAuthzEvent(ctx context.Context, extSvc *types.ExternalService, payload interface{}) error</a>

```
searchKey: webhookhandlers.handleGitHubUserAuthzEvent
tags: [method private]
```

```Go
func handleGitHubUserAuthzEvent(ctx context.Context, extSvc *types.ExternalService, payload interface{}) error
```

handleGitHubUserAuthzEvent handles a github webhook for the events described in webhookhandlers/handlers.go extracting a user from the github event and scheduling it for a perms update in repo-updater 

### <a id="scheduleRepoUpdate" href="#scheduleRepoUpdate">func scheduleRepoUpdate(ctx context.Context, repo *gh.Repository) error</a>

```
searchKey: webhookhandlers.scheduleRepoUpdate
tags: [method private]
```

```Go
func scheduleRepoUpdate(ctx context.Context, repo *gh.Repository) error
```

scheduleRepoUpdate finds an internal repo from a github repo, and posts it to repo-updater to schedule a permissions update 🚨 SECURITY: we want to be able to find any private repo here, so the DB call uses internal actor 

### <a id="scheduleUserUpdate" href="#scheduleUserUpdate">func scheduleUserUpdate(ctx context.Context, extSvc *types.ExternalService, githubUser *gh.User) error</a>

```
searchKey: webhookhandlers.scheduleUserUpdate
tags: [method private]
```

```Go
func scheduleUserUpdate(ctx context.Context, extSvc *types.ExternalService, githubUser *gh.User) error
```

