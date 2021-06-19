# Package email

## Index

* [Constants](#const)
    * [const MonitorKind](#MonitorKind)
    * [const utmSourceEmail](#utmSourceEmail)
    * [const priorityCritical](#priorityCritical)
* [Variables](#var)
    * [var externalURL](#externalURL)
    * [var MockSendEmailForNewSearchResult](#MockSendEmailForNewSearchResult)
    * [var MockExternalURL](#MockExternalURL)
    * [var newSearchResultsEmailTemplates](#newSearchResultsEmailTemplates)
* [Types](#type)
    * [type TemplateDataNewSearchResults struct](#TemplateDataNewSearchResults)
        * [func NewTemplateDataForNewSearchResults(ctx context.Context, monitorDescription, queryString string, email *codemonitors.MonitorEmail, numResults int) (d *TemplateDataNewSearchResults, err error)](#NewTemplateDataForNewSearchResults)
        * [func NewTestTemplateDataForNewSearchResults(ctx context.Context, monitorDescription string) *TemplateDataNewSearchResults](#NewTestTemplateDataForNewSearchResults)
* [Functions](#func)
    * [func SendEmailForNewSearchResult(ctx context.Context, userID int32, data *TemplateDataNewSearchResults) error](#SendEmailForNewSearchResult)
    * [func sendEmail(ctx context.Context, userID int32, template txtypes.Templates, data interface{}) error](#sendEmail)
    * [func getSearchURL(ctx context.Context, query, utmSource string) (string, error)](#getSearchURL)
    * [func getCodeMonitorURL(ctx context.Context, monitorID int64, utmSource string) (string, error)](#getCodeMonitorURL)
    * [func sourcegraphURL(ctx context.Context, path, query, utmSource string) (string, error)](#sourcegraphURL)


## <a id="const" href="#const">Constants</a>

### <a id="MonitorKind" href="#MonitorKind">const MonitorKind</a>

```
searchKey: email.MonitorKind
tags: [exported]
```

```Go
const MonitorKind = "CodeMonitor"
```

To avoid a circular dependency with the codemonitors/resolvers package we have to redeclare the MonitorKind. 

### <a id="utmSourceEmail" href="#utmSourceEmail">const utmSourceEmail</a>

```
searchKey: email.utmSourceEmail
```

```Go
const utmSourceEmail = "code-monitoring-email"
```

### <a id="priorityCritical" href="#priorityCritical">const priorityCritical</a>

```
searchKey: email.priorityCritical
```

```Go
const priorityCritical = "CRITICAL"
```

## <a id="var" href="#var">Variables</a>

### <a id="externalURL" href="#externalURL">var externalURL</a>

```
searchKey: email.externalURL
```

```Go
var externalURL *url.URL
```

### <a id="MockSendEmailForNewSearchResult" href="#MockSendEmailForNewSearchResult">var MockSendEmailForNewSearchResult</a>

```
searchKey: email.MockSendEmailForNewSearchResult
tags: [exported]
```

```Go
var MockSendEmailForNewSearchResult func(ctx context.Context, userID int32, data *TemplateDataNewSearchResults) error = ...
```

### <a id="MockExternalURL" href="#MockExternalURL">var MockExternalURL</a>

```
searchKey: email.MockExternalURL
tags: [exported]
```

```Go
var MockExternalURL func() *url.URL
```

### <a id="newSearchResultsEmailTemplates" href="#newSearchResultsEmailTemplates">var newSearchResultsEmailTemplates</a>

```
searchKey: email.newSearchResultsEmailTemplates
```

```Go
var newSearchResultsEmailTemplates = ...
```

## <a id="type" href="#type">Types</a>

### <a id="TemplateDataNewSearchResults" href="#TemplateDataNewSearchResults">type TemplateDataNewSearchResults struct</a>

```
searchKey: email.TemplateDataNewSearchResults
tags: [exported]
```

```Go
type TemplateDataNewSearchResults struct {
	Priority                  string
	CodeMonitorURL            string
	SearchURL                 string
	Description               string
	NumberOfResultsWithDetail string
	IsTest                    bool
}
```

#### <a id="NewTemplateDataForNewSearchResults" href="#NewTemplateDataForNewSearchResults">func NewTemplateDataForNewSearchResults(ctx context.Context, monitorDescription, queryString string, email *codemonitors.MonitorEmail, numResults int) (d *TemplateDataNewSearchResults, err error)</a>

```
searchKey: email.NewTemplateDataForNewSearchResults
tags: [exported]
```

```Go
func NewTemplateDataForNewSearchResults(ctx context.Context, monitorDescription, queryString string, email *codemonitors.MonitorEmail, numResults int) (d *TemplateDataNewSearchResults, err error)
```

#### <a id="NewTestTemplateDataForNewSearchResults" href="#NewTestTemplateDataForNewSearchResults">func NewTestTemplateDataForNewSearchResults(ctx context.Context, monitorDescription string) *TemplateDataNewSearchResults</a>

```
searchKey: email.NewTestTemplateDataForNewSearchResults
tags: [exported]
```

```Go
func NewTestTemplateDataForNewSearchResults(ctx context.Context, monitorDescription string) *TemplateDataNewSearchResults
```

## <a id="func" href="#func">Functions</a>

### <a id="SendEmailForNewSearchResult" href="#SendEmailForNewSearchResult">func SendEmailForNewSearchResult(ctx context.Context, userID int32, data *TemplateDataNewSearchResults) error</a>

```
searchKey: email.SendEmailForNewSearchResult
tags: [exported]
```

```Go
func SendEmailForNewSearchResult(ctx context.Context, userID int32, data *TemplateDataNewSearchResults) error
```

### <a id="sendEmail" href="#sendEmail">func sendEmail(ctx context.Context, userID int32, template txtypes.Templates, data interface{}) error</a>

```
searchKey: email.sendEmail
```

```Go
func sendEmail(ctx context.Context, userID int32, template txtypes.Templates, data interface{}) error
```

### <a id="getSearchURL" href="#getSearchURL">func getSearchURL(ctx context.Context, query, utmSource string) (string, error)</a>

```
searchKey: email.getSearchURL
```

```Go
func getSearchURL(ctx context.Context, query, utmSource string) (string, error)
```

### <a id="getCodeMonitorURL" href="#getCodeMonitorURL">func getCodeMonitorURL(ctx context.Context, monitorID int64, utmSource string) (string, error)</a>

```
searchKey: email.getCodeMonitorURL
```

```Go
func getCodeMonitorURL(ctx context.Context, monitorID int64, utmSource string) (string, error)
```

### <a id="sourcegraphURL" href="#sourcegraphURL">func sourcegraphURL(ctx context.Context, path, query, utmSource string) (string, error)</a>

```
searchKey: email.sourcegraphURL
```

```Go
func sourcegraphURL(ctx context.Context, path, query, utmSource string) (string, error)
```

