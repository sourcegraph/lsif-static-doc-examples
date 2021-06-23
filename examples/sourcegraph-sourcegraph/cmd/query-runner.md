# Package main

Command query-runner runs saved queries and notifies subscribers when the queries have new results. 

## Index

* Subpages
  * [cmd/query-runner/queryrunnerapi](query-runner/queryrunnerapi.md)
* [Constants](#const)
    * [const gqlSearchQuery](#gqlSearchQuery)
    * [const port](#port)
    * [const utmSourceEmail](#utmSourceEmail)
    * [const utmSourceSlack](#utmSourceSlack)
* [Variables](#var)
    * [var testNotificationMu](#testNotificationMu)
    * [var newSearchResultsEmailTemplates](#newSearchResultsEmailTemplates)
    * [var notifySubscribedTemplate](#notifySubscribedTemplate)
    * [var notifyUnsubscribedTemplate](#notifyUnsubscribedTemplate)
    * [var forceRunInterval](#forceRunInterval)
    * [var debugPretendSavedQueryResultsExist](#debugPretendSavedQueryResultsExist)
    * [var executor](#executor)
    * [var externalURL](#externalURL)
* [Types](#type)
    * [type graphQLQuery struct](#graphQLQuery)
    * [type gqlSearchVars struct](#gqlSearchVars)
    * [type gqlSearchResponse struct](#gqlSearchResponse)
        * [func search(ctx context.Context, query string) (*gqlSearchResponse, error)](#search)
        * [func performSearch(ctx context.Context, query string) (v *gqlSearchResponse, execDuration time.Duration, err error)](#performSearch)
    * [type executorT struct](#executorT)
        * [func (e *executorT) run(ctx context.Context) error](#executorT.run)
        * [func (e *executorT) runQuery(ctx context.Context, spec api.SavedQueryIDSpec, query api.ConfigSavedQuery) error](#executorT.runQuery)
    * [type notifier struct](#notifier)
        * [func (n *notifier) emailNotify(ctx context.Context)](#notifier.emailNotify)
        * [func (n *notifier) slackNotify(ctx context.Context)](#notifier.slackNotify)
    * [type recipientSpec struct](#recipientSpec)
        * [func (r recipientSpec) String() string](#recipientSpec.String)
    * [type recipient struct](#recipient)
        * [func (r *recipient) String() string](#recipient.String)
    * [type recipients []*main.recipient](#recipients)
        * [func diffNotificationRecipients(old, new recipients) (removed, added recipients)](#diffNotificationRecipients)
        * [func (rs *recipients) add(r recipient)](#recipients.add)
        * [func (rs recipients) get(s recipientSpec) *recipient](#recipients.get)
* [Functions](#func)
    * [func diffSavedQueryConfigs(oldList, newList map[api.SavedQueryIDSpec]api.ConfigSavedQuery) (deleted, updated, created map[api.SavedQuerySpecAndConfig]api.SavedQuerySpecAndConfig)](#diffSavedQueryConfigs)
    * [func sendNotificationsForCreatedOrUpdatedOrDeleted(oldList, newList map[api.SavedQueryIDSpec]api.ConfigSavedQuery)](#sendNotificationsForCreatedOrUpdatedOrDeleted)
    * [func notifySavedQueryWasCreatedOrUpdated(oldValue, newValue api.SavedQuerySpecAndConfig) error](#notifySavedQueryWasCreatedOrUpdated)
    * [func serveTestNotification(w http.ResponseWriter, r *http.Request)](#serveTestNotification)
    * [func canSendEmail(ctx context.Context) error](#canSendEmail)
    * [func emailNotifySubscribeUnsubscribe(ctx context.Context, recipient *recipient, query api.SavedQuerySpecAndConfig, template txtypes.Templates) error](#emailNotifySubscribeUnsubscribe)
    * [func sendEmail(ctx context.Context, userID int32, eventType string, template txtypes.Templates, data interface{}) error](#sendEmail)
    * [func gqlURL(queryName string) (string, error)](#gqlURL)
    * [func extractTime(result interface{}) (t *time.Time, err error)](#extractTime)
    * [func main()](#main)
    * [func writeError(w http.ResponseWriter, err error)](#writeError)
    * [func latestResultTime(prevInfo *api.SavedQueryInfo, v *gqlSearchResponse, searchErr error) time.Time](#latestResultTime)
    * [func notify(ctx context.Context, spec api.SavedQueryIDSpec, query api.ConfigSavedQuery, newQuery string, results *gqlSearchResponse) error](#notify)
    * [func searchURL(query, utmSource string) string](#searchURL)
    * [func savedSearchListPageURL(utmSource string) string](#savedSearchListPageURL)
    * [func sourcegraphURL(path, query, utmSource string) string](#sourcegraphURL)
    * [func logEvent(userID int32, eventName, eventType string)](#logEvent)
    * [func getNotificationRecipients(ctx context.Context, spec api.SavedQueryIDSpec, query api.ConfigSavedQuery) ([]*recipient, error)](#getNotificationRecipients)
    * [func slackNotifySubscribed(ctx context.Context, recipient *recipient, query api.SavedQuerySpecAndConfig) error](#slackNotifySubscribed)
    * [func slackNotifyUnsubscribed(ctx context.Context, recipient *recipient, query api.SavedQuerySpecAndConfig) error](#slackNotifyUnsubscribed)
    * [func slackNotify(ctx context.Context, recipient *recipient, text string, slackWebhookURL *string) error](#slackNotify)
    * [func TestGetNotificationRecipients(t *testing.T)](#TestGetNotificationRecipients)
    * [func TestDiffNotificationRecipients(t *testing.T)](#TestDiffNotificationRecipients)


## <a id="const" href="#const">Constants</a>

### <a id="gqlSearchQuery" href="#gqlSearchQuery">const gqlSearchQuery</a>

```
searchKey: main.gqlSearchQuery
tags: [private]
```

```Go
const gqlSearchQuery = ...
```

### <a id="port" href="#port">const port</a>

```
searchKey: main.port
tags: [private]
```

```Go
const port = "3183"
```

### <a id="utmSourceEmail" href="#utmSourceEmail">const utmSourceEmail</a>

```
searchKey: main.utmSourceEmail
tags: [private]
```

```Go
const utmSourceEmail = "saved-search-email"
```

### <a id="utmSourceSlack" href="#utmSourceSlack">const utmSourceSlack</a>

```
searchKey: main.utmSourceSlack
tags: [private]
```

```Go
const utmSourceSlack = "saved-search-slack"
```

## <a id="var" href="#var">Variables</a>

### <a id="testNotificationMu" href="#testNotificationMu">var testNotificationMu</a>

```
searchKey: main.testNotificationMu
tags: [private]
```

```Go
var testNotificationMu sync.Mutex
```

### <a id="newSearchResultsEmailTemplates" href="#newSearchResultsEmailTemplates">var newSearchResultsEmailTemplates</a>

```
searchKey: main.newSearchResultsEmailTemplates
tags: [private]
```

```Go
var newSearchResultsEmailTemplates = ...
```

### <a id="notifySubscribedTemplate" href="#notifySubscribedTemplate">var notifySubscribedTemplate</a>

```
searchKey: main.notifySubscribedTemplate
tags: [private]
```

```Go
var notifySubscribedTemplate = ...
```

### <a id="notifyUnsubscribedTemplate" href="#notifyUnsubscribedTemplate">var notifyUnsubscribedTemplate</a>

```
searchKey: main.notifyUnsubscribedTemplate
tags: [private]
```

```Go
var notifyUnsubscribedTemplate = ...
```

### <a id="forceRunInterval" href="#forceRunInterval">var forceRunInterval</a>

```
searchKey: main.forceRunInterval
tags: [private]
```

```Go
var forceRunInterval = ...
```

### <a id="debugPretendSavedQueryResultsExist" href="#debugPretendSavedQueryResultsExist">var debugPretendSavedQueryResultsExist</a>

```
searchKey: main.debugPretendSavedQueryResultsExist
tags: [private]
```

```Go
var debugPretendSavedQueryResultsExist = false
```

Useful for debugging e.g. email and slack notifications. Set it to true and it will send one notification on server startup, effectively. 

### <a id="executor" href="#executor">var executor</a>

```
searchKey: main.executor
tags: [private]
```

```Go
var executor = &executorT{}
```

### <a id="externalURL" href="#externalURL">var externalURL</a>

```
searchKey: main.externalURL
tags: [private]
```

```Go
var externalURL *url.URL
```

## <a id="type" href="#type">Types</a>

### <a id="graphQLQuery" href="#graphQLQuery">type graphQLQuery struct</a>

```
searchKey: main.graphQLQuery
tags: [private]
```

```Go
type graphQLQuery struct {
	Query     string      `json:"query"`
	Variables interface{} `json:"variables"`
}
```

### <a id="gqlSearchVars" href="#gqlSearchVars">type gqlSearchVars struct</a>

```
searchKey: main.gqlSearchVars
tags: [private]
```

```Go
type gqlSearchVars struct {
	Query string `json:"query"`
}
```

### <a id="gqlSearchResponse" href="#gqlSearchResponse">type gqlSearchResponse struct</a>

```
searchKey: main.gqlSearchResponse
tags: [private]
```

```Go
type gqlSearchResponse struct {
	Data struct {
		Search struct {
			Results struct {
				ApproximateResultCount string
				Cloning                []*api.Repo
				Timedout               []*api.Repo
				Results                []interface{}
			}
		}
	}
	Errors []interface{}
}
```

#### <a id="search" href="#search">func search(ctx context.Context, query string) (*gqlSearchResponse, error)</a>

```
searchKey: main.search
tags: [private]
```

```Go
func search(ctx context.Context, query string) (*gqlSearchResponse, error)
```

#### <a id="performSearch" href="#performSearch">func performSearch(ctx context.Context, query string) (v *gqlSearchResponse, execDuration time.Duration, err error)</a>

```
searchKey: main.performSearch
tags: [private]
```

```Go
func performSearch(ctx context.Context, query string) (v *gqlSearchResponse, execDuration time.Duration, err error)
```

### <a id="executorT" href="#executorT">type executorT struct</a>

```
searchKey: main.executorT
tags: [private]
```

```Go
type executorT struct {
	forceRunInterval *time.Duration
}
```

#### <a id="executorT.run" href="#executorT.run">func (e *executorT) run(ctx context.Context) error</a>

```
searchKey: main.executorT.run
tags: [private]
```

```Go
func (e *executorT) run(ctx context.Context) error
```

#### <a id="executorT.runQuery" href="#executorT.runQuery">func (e *executorT) runQuery(ctx context.Context, spec api.SavedQueryIDSpec, query api.ConfigSavedQuery) error</a>

```
searchKey: main.executorT.runQuery
tags: [private]
```

```Go
func (e *executorT) runQuery(ctx context.Context, spec api.SavedQueryIDSpec, query api.ConfigSavedQuery) error
```

runQuery runs the given query if an appropriate amount of time has elapsed since it last ran. 

### <a id="notifier" href="#notifier">type notifier struct</a>

```
searchKey: main.notifier
tags: [private]
```

```Go
type notifier struct {
	spec       api.SavedQueryIDSpec
	query      api.ConfigSavedQuery
	newQuery   string
	results    *gqlSearchResponse
	recipients recipients
}
```

#### <a id="notifier.emailNotify" href="#notifier.emailNotify">func (n *notifier) emailNotify(ctx context.Context)</a>

```
searchKey: main.notifier.emailNotify
tags: [private]
```

```Go
func (n *notifier) emailNotify(ctx context.Context)
```

#### <a id="notifier.slackNotify" href="#notifier.slackNotify">func (n *notifier) slackNotify(ctx context.Context)</a>

```
searchKey: main.notifier.slackNotify
tags: [private]
```

```Go
func (n *notifier) slackNotify(ctx context.Context)
```

### <a id="recipientSpec" href="#recipientSpec">type recipientSpec struct</a>

```
searchKey: main.recipientSpec
tags: [private]
```

```Go
type recipientSpec struct {
	userID, orgID int32
}
```

recipientSpec identifies a recipient of a saved search notification. Exactly one of its fields is nonzero. 

#### <a id="recipientSpec.String" href="#recipientSpec.String">func (r recipientSpec) String() string</a>

```
searchKey: main.recipientSpec.String
tags: [private]
```

```Go
func (r recipientSpec) String() string
```

### <a id="recipient" href="#recipient">type recipient struct</a>

```
searchKey: main.recipient
tags: [private]
```

```Go
type recipient struct {
	spec  recipientSpec // the recipient's identity
	email bool          // send an email to the recipient
	slack bool          // post a Slack message to the recipient
}
```

recipient describes a recipient of a saved search notification and the type of notifications they're configured to receive. 

#### <a id="recipient.String" href="#recipient.String">func (r *recipient) String() string</a>

```
searchKey: main.recipient.String
tags: [private]
```

```Go
func (r *recipient) String() string
```

### <a id="recipients" href="#recipients">type recipients []*main.recipient</a>

```
searchKey: main.recipients
tags: [private]
```

```Go
type recipients []*recipient
```

#### <a id="diffNotificationRecipients" href="#diffNotificationRecipients">func diffNotificationRecipients(old, new recipients) (removed, added recipients)</a>

```
searchKey: main.diffNotificationRecipients
tags: [private]
```

```Go
func diffNotificationRecipients(old, new recipients) (removed, added recipients)
```

diffNotificationRecipients diffs old against new, returning the removed and added recipients. The same recipient identity may be returned in both the removed and added lists, if they changed the type of notifications they receive (e.g., unsubscribe from email, subscribe to Slack). 

#### <a id="recipients.add" href="#recipients.add">func (rs *recipients) add(r recipient)</a>

```
searchKey: main.recipients.add
tags: [private]
```

```Go
func (rs *recipients) add(r recipient)
```

add adds the new recipient, merging it into an existing slice element if one already exists for the userID or orgID. 

#### <a id="recipients.get" href="#recipients.get">func (rs recipients) get(s recipientSpec) *recipient</a>

```
searchKey: main.recipients.get
tags: [private]
```

```Go
func (rs recipients) get(s recipientSpec) *recipient
```

get returns the recipient with the given spec, if any, or else nil. 

## <a id="func" href="#func">Functions</a>

### <a id="diffSavedQueryConfigs" href="#diffSavedQueryConfigs">func diffSavedQueryConfigs(oldList, newList map[api.SavedQueryIDSpec]api.ConfigSavedQuery) (deleted, updated, created map[api.SavedQuerySpecAndConfig]api.SavedQuerySpecAndConfig)</a>

```
searchKey: main.diffSavedQueryConfigs
tags: [private]
```

```Go
func diffSavedQueryConfigs(oldList, newList map[api.SavedQueryIDSpec]api.ConfigSavedQuery) (deleted, updated, created map[api.SavedQuerySpecAndConfig]api.SavedQuerySpecAndConfig)
```

diffSavedQueryConfigs takes the old and new saved queries configurations. 

It returns maps whose keys represent the old value and value represent the new value, i.e. a map of the saved query in the oldList and what its new value is in the newList for each respective category. For deleted, the new value will be an empty struct. 

### <a id="sendNotificationsForCreatedOrUpdatedOrDeleted" href="#sendNotificationsForCreatedOrUpdatedOrDeleted">func sendNotificationsForCreatedOrUpdatedOrDeleted(oldList, newList map[api.SavedQueryIDSpec]api.ConfigSavedQuery)</a>

```
searchKey: main.sendNotificationsForCreatedOrUpdatedOrDeleted
tags: [private]
```

```Go
func sendNotificationsForCreatedOrUpdatedOrDeleted(oldList, newList map[api.SavedQueryIDSpec]api.ConfigSavedQuery)
```

### <a id="notifySavedQueryWasCreatedOrUpdated" href="#notifySavedQueryWasCreatedOrUpdated">func notifySavedQueryWasCreatedOrUpdated(oldValue, newValue api.SavedQuerySpecAndConfig) error</a>

```
searchKey: main.notifySavedQueryWasCreatedOrUpdated
tags: [private]
```

```Go
func notifySavedQueryWasCreatedOrUpdated(oldValue, newValue api.SavedQuerySpecAndConfig) error
```

### <a id="serveTestNotification" href="#serveTestNotification">func serveTestNotification(w http.ResponseWriter, r *http.Request)</a>

```
searchKey: main.serveTestNotification
tags: [private]
```

```Go
func serveTestNotification(w http.ResponseWriter, r *http.Request)
```

### <a id="canSendEmail" href="#canSendEmail">func canSendEmail(ctx context.Context) error</a>

```
searchKey: main.canSendEmail
tags: [private]
```

```Go
func canSendEmail(ctx context.Context) error
```

### <a id="emailNotifySubscribeUnsubscribe" href="#emailNotifySubscribeUnsubscribe">func emailNotifySubscribeUnsubscribe(ctx context.Context, recipient *recipient, query api.SavedQuerySpecAndConfig, template txtypes.Templates) error</a>

```
searchKey: main.emailNotifySubscribeUnsubscribe
tags: [private]
```

```Go
func emailNotifySubscribeUnsubscribe(ctx context.Context, recipient *recipient, query api.SavedQuerySpecAndConfig, template txtypes.Templates) error
```

### <a id="sendEmail" href="#sendEmail">func sendEmail(ctx context.Context, userID int32, eventType string, template txtypes.Templates, data interface{}) error</a>

```
searchKey: main.sendEmail
tags: [private]
```

```Go
func sendEmail(ctx context.Context, userID int32, eventType string, template txtypes.Templates, data interface{}) error
```

### <a id="gqlURL" href="#gqlURL">func gqlURL(queryName string) (string, error)</a>

```
searchKey: main.gqlURL
tags: [private]
```

```Go
func gqlURL(queryName string) (string, error)
```

### <a id="extractTime" href="#extractTime">func extractTime(result interface{}) (t *time.Time, err error)</a>

```
searchKey: main.extractTime
tags: [private]
```

```Go
func extractTime(result interface{}) (t *time.Time, err error)
```

extractTime extracts the time from the given search result. 

### <a id="main" href="#main">func main()</a>

```
searchKey: main.main
tags: [private]
```

```Go
func main()
```

### <a id="writeError" href="#writeError">func writeError(w http.ResponseWriter, err error)</a>

```
searchKey: main.writeError
tags: [private]
```

```Go
func writeError(w http.ResponseWriter, err error)
```

### <a id="latestResultTime" href="#latestResultTime">func latestResultTime(prevInfo *api.SavedQueryInfo, v *gqlSearchResponse, searchErr error) time.Time</a>

```
searchKey: main.latestResultTime
tags: [private]
```

```Go
func latestResultTime(prevInfo *api.SavedQueryInfo, v *gqlSearchResponse, searchErr error) time.Time
```

### <a id="notify" href="#notify">func notify(ctx context.Context, spec api.SavedQueryIDSpec, query api.ConfigSavedQuery, newQuery string, results *gqlSearchResponse) error</a>

```
searchKey: main.notify
tags: [private]
```

```Go
func notify(ctx context.Context, spec api.SavedQueryIDSpec, query api.ConfigSavedQuery, newQuery string, results *gqlSearchResponse) error
```

notify handles sending notifications for new search results. 

### <a id="searchURL" href="#searchURL">func searchURL(query, utmSource string) string</a>

```
searchKey: main.searchURL
tags: [private]
```

```Go
func searchURL(query, utmSource string) string
```

### <a id="savedSearchListPageURL" href="#savedSearchListPageURL">func savedSearchListPageURL(utmSource string) string</a>

```
searchKey: main.savedSearchListPageURL
tags: [private]
```

```Go
func savedSearchListPageURL(utmSource string) string
```

### <a id="sourcegraphURL" href="#sourcegraphURL">func sourcegraphURL(path, query, utmSource string) string</a>

```
searchKey: main.sourcegraphURL
tags: [private]
```

```Go
func sourcegraphURL(path, query, utmSource string) string
```

### <a id="logEvent" href="#logEvent">func logEvent(userID int32, eventName, eventType string)</a>

```
searchKey: main.logEvent
tags: [private]
```

```Go
func logEvent(userID int32, eventName, eventType string)
```

### <a id="getNotificationRecipients" href="#getNotificationRecipients">func getNotificationRecipients(ctx context.Context, spec api.SavedQueryIDSpec, query api.ConfigSavedQuery) ([]*recipient, error)</a>

```
searchKey: main.getNotificationRecipients
tags: [private]
```

```Go
func getNotificationRecipients(ctx context.Context, spec api.SavedQueryIDSpec, query api.ConfigSavedQuery) ([]*recipient, error)
```

getNotificationRecipients retrieves the list of recipients who should receive notifications for events related to the saved search. 

### <a id="slackNotifySubscribed" href="#slackNotifySubscribed">func slackNotifySubscribed(ctx context.Context, recipient *recipient, query api.SavedQuerySpecAndConfig) error</a>

```
searchKey: main.slackNotifySubscribed
tags: [private]
```

```Go
func slackNotifySubscribed(ctx context.Context, recipient *recipient, query api.SavedQuerySpecAndConfig) error
```

### <a id="slackNotifyUnsubscribed" href="#slackNotifyUnsubscribed">func slackNotifyUnsubscribed(ctx context.Context, recipient *recipient, query api.SavedQuerySpecAndConfig) error</a>

```
searchKey: main.slackNotifyUnsubscribed
tags: [private]
```

```Go
func slackNotifyUnsubscribed(ctx context.Context, recipient *recipient, query api.SavedQuerySpecAndConfig) error
```

### <a id="slackNotify" href="#slackNotify">func slackNotify(ctx context.Context, recipient *recipient, text string, slackWebhookURL *string) error</a>

```
searchKey: main.slackNotify
tags: [private]
```

```Go
func slackNotify(ctx context.Context, recipient *recipient, text string, slackWebhookURL *string) error
```

### <a id="TestGetNotificationRecipients" href="#TestGetNotificationRecipients">func TestGetNotificationRecipients(t *testing.T)</a>

```
searchKey: main.TestGetNotificationRecipients
tags: [private]
```

```Go
func TestGetNotificationRecipients(t *testing.T)
```

### <a id="TestDiffNotificationRecipients" href="#TestDiffNotificationRecipients">func TestDiffNotificationRecipients(t *testing.T)</a>

```
searchKey: main.TestDiffNotificationRecipients
tags: [private]
```

```Go
func TestDiffNotificationRecipients(t *testing.T)
```

