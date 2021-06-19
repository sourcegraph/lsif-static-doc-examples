# Package hubspot

## Index

* Subpages
  * [cmd/frontend/hubspot/hubspotutil](hubspot/hubspotutil.md)
* [Types](#type)
    * [type ContactProperties struct](#ContactProperties)
    * [type ContactResponse struct](#ContactResponse)
    * [type apiProperties struct](#apiProperties)
        * [func newAPIValues(h *ContactProperties) *apiProperties](#newAPIValues)
        * [func (h *apiProperties) set(property string, value interface{})](#apiProperties.set)
    * [type apiProperty struct](#apiProperty)
    * [type Client struct](#Client)
        * [func New(portalID, hapiKey string) *Client](#New)
        * [func (c *Client) CreateOrUpdateContact(email string, params *ContactProperties) (*ContactResponse, error)](#Client.CreateOrUpdateContact)
        * [func (c *Client) baseContactURL(email string) *url.URL](#Client.baseContactURL)
        * [func (c *Client) LogEvent(email string, eventID string, params map[string]string) error](#Client.LogEvent)
        * [func (c *Client) baseEventURL() *url.URL](#Client.baseEventURL)
        * [func (c *Client) SubmitForm(formID string, params interface{}) error](#Client.SubmitForm)
        * [func (c *Client) baseFormURL() *url.URL](#Client.baseFormURL)
        * [func (c *Client) postForm(methodName string, baseURL *url.URL, suffix string, body interface{}) error](#Client.postForm)
        * [func (c *Client) postJSON(methodName string, baseURL *url.URL, reqPayload, respPayload interface{}) error](#Client.postJSON)
        * [func (c *Client) get(methodName string, baseURL *url.URL, suffix string, params map[string]string) error](#Client.get)
* [Functions](#func)
    * [func wrapError(methodName string, err error) error](#wrapError)


## <a id="type" href="#type">Types</a>

```
tags: [exported]
```

### <a id="ContactProperties" href="#ContactProperties">type ContactProperties struct</a>

```
searchKey: hubspot.ContactProperties
tags: [exported]
```

```Go
type ContactProperties struct {
	UserID          string `json:"user_id"`
	IsServerAdmin   bool   `json:"is_server_admin"`
	LatestPing      int64  `json:"latest_ping"`
	AnonymousUserID string `json:"anonymous_user_id"`
	FirstSourceURL  string `json:"first_source_url"`
}
```

ContactProperties represent HubSpot user properties 

### <a id="ContactResponse" href="#ContactResponse">type ContactResponse struct</a>

```
searchKey: hubspot.ContactResponse
tags: [exported]
```

```Go
type ContactResponse struct {
	VID   int32 `json:"vid"`
	IsNew bool  `json:"isNew"`
}
```

ContactResponse represents HubSpot user properties returned after a CreateOrUpdate API call 

### <a id="apiProperties" href="#apiProperties">type apiProperties struct</a>

```
searchKey: hubspot.apiProperties
```

```Go
type apiProperties struct {
	Properties []*apiProperty `json:"properties"`
}
```

apiProperties represents a list of HubSpot API-compliant key-value pairs 

#### <a id="newAPIValues" href="#newAPIValues">func newAPIValues(h *ContactProperties) *apiProperties</a>

```
searchKey: hubspot.newAPIValues
```

```Go
func newAPIValues(h *ContactProperties) *apiProperties
```

newAPIValues converts a ContactProperties struct to a HubSpot API-compliant array of key-value pairs 

#### <a id="apiProperties.set" href="#apiProperties.set">func (h *apiProperties) set(property string, value interface{})</a>

```
searchKey: hubspot.apiProperties.set
```

```Go
func (h *apiProperties) set(property string, value interface{})
```

### <a id="apiProperty" href="#apiProperty">type apiProperty struct</a>

```
searchKey: hubspot.apiProperty
```

```Go
type apiProperty struct {
	Property string `json:"property"`
	Value    string `json:"value"`
}
```

### <a id="Client" href="#Client">type Client struct</a>

```
searchKey: hubspot.Client
tags: [exported]
```

```Go
type Client struct {
	portalID string
	hapiKey  string
}
```

Client is a HubSpot API client 

#### <a id="New" href="#New">func New(portalID, hapiKey string) *Client</a>

```
searchKey: hubspot.New
tags: [exported]
```

```Go
func New(portalID, hapiKey string) *Client
```

New returns a new HubSpot client using the given Portal ID. 

#### <a id="Client.CreateOrUpdateContact" href="#Client.CreateOrUpdateContact">func (c *Client) CreateOrUpdateContact(email string, params *ContactProperties) (*ContactResponse, error)</a>

```
searchKey: hubspot.Client.CreateOrUpdateContact
tags: [exported]
```

```Go
func (c *Client) CreateOrUpdateContact(email string, params *ContactProperties) (*ContactResponse, error)
```

CreateOrUpdateContact creates or updates a HubSpot contact (with email as primary key) 

The endpoint returns 200 with the contact's VID and an isNew field on success, or a 409 Conflict if we attempt to change a user's email address to a new one that is already taken 

[http://developers.hubspot.com/docs/methods/contacts/create_or_update](http://developers.hubspot.com/docs/methods/contacts/create_or_update) 

#### <a id="Client.baseContactURL" href="#Client.baseContactURL">func (c *Client) baseContactURL(email string) *url.URL</a>

```
searchKey: hubspot.Client.baseContactURL
```

```Go
func (c *Client) baseContactURL(email string) *url.URL
```

#### <a id="Client.LogEvent" href="#Client.LogEvent">func (c *Client) LogEvent(email string, eventID string, params map[string]string) error</a>

```
searchKey: hubspot.Client.LogEvent
tags: [exported]
```

```Go
func (c *Client) LogEvent(email string, eventID string, params map[string]string) error
```

LogEvent logs a user action or event. The response will have a status code of 200 with no data in the body 

[http://developers.hubspot.com/docs/methods/enterprise_events/http_api](http://developers.hubspot.com/docs/methods/enterprise_events/http_api) 

#### <a id="Client.baseEventURL" href="#Client.baseEventURL">func (c *Client) baseEventURL() *url.URL</a>

```
searchKey: hubspot.Client.baseEventURL
```

```Go
func (c *Client) baseEventURL() *url.URL
```

#### <a id="Client.SubmitForm" href="#Client.SubmitForm">func (c *Client) SubmitForm(formID string, params interface{}) error</a>

```
searchKey: hubspot.Client.SubmitForm
tags: [exported]
```

```Go
func (c *Client) SubmitForm(formID string, params interface{}) error
```

SubmitForm submits form data.  Form submissions return an empty body with status code 204 or 302 if submission was successful. 

`params` must be a map[string]string or a struct convertible to a URL querystring using query.Values(). The keys (or `url` tags in the struct) must be snake case, per HubSpot conventions. 

See [https://developers.hubspot.com/docs/methods/forms/submit_form](https://developers.hubspot.com/docs/methods/forms/submit_form). 

#### <a id="Client.baseFormURL" href="#Client.baseFormURL">func (c *Client) baseFormURL() *url.URL</a>

```
searchKey: hubspot.Client.baseFormURL
```

```Go
func (c *Client) baseFormURL() *url.URL
```

#### <a id="Client.postForm" href="#Client.postForm">func (c *Client) postForm(methodName string, baseURL *url.URL, suffix string, body interface{}) error</a>

```
searchKey: hubspot.Client.postForm
```

```Go
func (c *Client) postForm(methodName string, baseURL *url.URL, suffix string, body interface{}) error
```

Send a POST request with form data to HubSpot APIs that accept application/x-www-form-urlencoded data (e.g. the Forms API) 

#### <a id="Client.postJSON" href="#Client.postJSON">func (c *Client) postJSON(methodName string, baseURL *url.URL, reqPayload, respPayload interface{}) error</a>

```
searchKey: hubspot.Client.postJSON
```

```Go
func (c *Client) postJSON(methodName string, baseURL *url.URL, reqPayload, respPayload interface{}) error
```

Send a POST request with JSON data to HubSpot APIs that accept JSON (e.g. the Contacts, Lists, etc APIs) 

#### <a id="Client.get" href="#Client.get">func (c *Client) get(methodName string, baseURL *url.URL, suffix string, params map[string]string) error</a>

```
searchKey: hubspot.Client.get
```

```Go
func (c *Client) get(methodName string, baseURL *url.URL, suffix string, params map[string]string) error
```

Send a GET request to HubSpot APIs that accept JSON in a querystring (e.g. the Events API) 

## <a id="func" href="#func">Functions</a>

```
tags: [exported]
```

### <a id="wrapError" href="#wrapError">func wrapError(methodName string, err error) error</a>

```
searchKey: hubspot.wrapError
```

```Go
func wrapError(methodName string, err error) error
```

