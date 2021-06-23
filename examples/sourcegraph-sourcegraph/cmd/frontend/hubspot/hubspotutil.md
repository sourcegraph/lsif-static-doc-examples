# Package hubspotutil

## Index

* [Variables](#var)
    * [var HubSpotHAPIKey](#HubSpotHAPIKey)
    * [var SurveyFormID](#SurveyFormID)
    * [var TrialFormID](#TrialFormID)
    * [var HappinessFeedbackFormID](#HappinessFeedbackFormID)
    * [var SignupEventID](#SignupEventID)
    * [var SelfHostedSiteInitEventID](#SelfHostedSiteInitEventID)
    * [var client](#client)
* [Functions](#func)
    * [func HasAPIKey() bool](#HasAPIKey)
    * [func init()](#init.hubspotutil.go)
    * [func Client() *hubspot.Client](#Client)
    * [func SyncUser(email, eventID string, contactParams *hubspot.ContactProperties)](#SyncUser)
    * [func syncHubSpotContact(email, eventID string, contactParams *hubspot.ContactProperties) error](#syncHubSpotContact)


## <a id="var" href="#var">Variables</a>

### <a id="HubSpotHAPIKey" href="#HubSpotHAPIKey">var HubSpotHAPIKey</a>

```
searchKey: hubspotutil.HubSpotHAPIKey
```

```Go
var HubSpotHAPIKey = ...
```

HubSpotHAPIKey is used by some requests to access their respective API endpoints 

### <a id="SurveyFormID" href="#SurveyFormID">var SurveyFormID</a>

```
searchKey: hubspotutil.SurveyFormID
```

```Go
var SurveyFormID = "a86bbac5-576d-4ca0-86c1-0c60837c3eab"
```

SurveyFormID is the ID for a satisfaction (NPS) survey. 

### <a id="TrialFormID" href="#TrialFormID">var TrialFormID</a>

```
searchKey: hubspotutil.TrialFormID
```

```Go
var TrialFormID = "0bbc9f90-3741-4c7a-b5f5-6c81f130ea9d"
```

TrialFormID is ID for the request trial form. 

### <a id="HappinessFeedbackFormID" href="#HappinessFeedbackFormID">var HappinessFeedbackFormID</a>

```
searchKey: hubspotutil.HappinessFeedbackFormID
```

```Go
var HappinessFeedbackFormID = "417ec50b-39b4-41fa-a267-75da6f56a7cf"
```

HappinessFeedbackFormID is the ID for a Happiness survey. 

### <a id="SignupEventID" href="#SignupEventID">var SignupEventID</a>

```
searchKey: hubspotutil.SignupEventID
```

```Go
var SignupEventID = "000001776813"
```

SignupEventID is the HubSpot ID for signup events. HubSpot Events and IDs are all defined in HubSpot "Events" web console: [https://app.hubspot.com/reports/2762526/events](https://app.hubspot.com/reports/2762526/events) 

### <a id="SelfHostedSiteInitEventID" href="#SelfHostedSiteInitEventID">var SelfHostedSiteInitEventID</a>

```
searchKey: hubspotutil.SelfHostedSiteInitEventID
```

```Go
var SelfHostedSiteInitEventID = "000010399089"
```

SelfHostedSiteInitEventID is the Hubstpot Event ID for when a new site is created in /site-admin/sites 

### <a id="client" href="#client">var client</a>

```
searchKey: hubspotutil.client
tags: [private]
```

```Go
var client *hubspot.Client
```

## <a id="func" href="#func">Functions</a>

### <a id="HasAPIKey" href="#HasAPIKey">func HasAPIKey() bool</a>

```
searchKey: hubspotutil.HasAPIKey
```

```Go
func HasAPIKey() bool
```

HasAPIKey returns true if a HubspotAPI key is present. A subset of requests require a HubSpot API key. 

### <a id="init.hubspotutil.go" href="#init.hubspotutil.go">func init()</a>

```
searchKey: hubspotutil.init
tags: [private]
```

```Go
func init()
```

### <a id="Client" href="#Client">func Client() *hubspot.Client</a>

```
searchKey: hubspotutil.Client
```

```Go
func Client() *hubspot.Client
```

Client returns a hubspot client 

### <a id="SyncUser" href="#SyncUser">func SyncUser(email, eventID string, contactParams *hubspot.ContactProperties)</a>

```
searchKey: hubspotutil.SyncUser
```

```Go
func SyncUser(email, eventID string, contactParams *hubspot.ContactProperties)
```

SyncUser handles creating or syncing a user profile in HubSpot, and if provided, logs a user event. 

### <a id="syncHubSpotContact" href="#syncHubSpotContact">func syncHubSpotContact(email, eventID string, contactParams *hubspot.ContactProperties) error</a>

```
searchKey: hubspotutil.syncHubSpotContact
tags: [private]
```

```Go
func syncHubSpotContact(email, eventID string, contactParams *hubspot.ContactProperties) error
```

