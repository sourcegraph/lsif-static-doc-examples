# Package apitest

Package apitest provided types used in testing. 

## Index

* [Types](#type)
    * [type Action struct](#Action)
    * [type ActionConnection struct](#ActionConnection)
    * [type ActionEmail struct](#ActionEmail)
    * [type ActionEvent struct](#ActionEvent)
    * [type ActionEventConnection struct](#ActionEventConnection)
    * [type Monitor struct](#Monitor)
    * [type MonitorConnection struct](#MonitorConnection)
    * [type Node struct](#Node)
    * [type PageInfo struct](#PageInfo)
    * [type RecipientsConnection struct](#RecipientsConnection)
    * [type Response struct](#Response)
    * [type Trigger struct](#Trigger)
    * [type TriggerEvent struct](#TriggerEvent)
    * [type TriggerEventConnection struct](#TriggerEventConnection)
    * [type UpdateCodeMonitorResponse struct](#UpdateCodeMonitorResponse)
    * [type User struct](#User)
    * [type UserOrg struct](#UserOrg)


## <a id="type" href="#type">Types</a>

```
tags: [package private]
```

### <a id="Action" href="#Action">type Action struct</a>

```
searchKey: apitest.Action
tags: [struct]
```

```Go
type Action struct {
	ActionEmail
}
```

### <a id="ActionConnection" href="#ActionConnection">type ActionConnection struct</a>

```
searchKey: apitest.ActionConnection
tags: [struct]
```

```Go
type ActionConnection struct {
	Nodes      []Action
	TotalCount int
	PageInfo   PageInfo
}
```

### <a id="ActionEmail" href="#ActionEmail">type ActionEmail struct</a>

```
searchKey: apitest.ActionEmail
tags: [struct]
```

```Go
type ActionEmail struct {
	Id         string
	Enabled    bool
	Priority   string
	Recipients RecipientsConnection
	Header     string
	Events     ActionEventConnection
}
```

### <a id="ActionEvent" href="#ActionEvent">type ActionEvent struct</a>

```
searchKey: apitest.ActionEvent
tags: [struct]
```

```Go
type ActionEvent struct {
	Id        string
	Status    string
	Timestamp string
	Message   *string
}
```

### <a id="ActionEventConnection" href="#ActionEventConnection">type ActionEventConnection struct</a>

```
searchKey: apitest.ActionEventConnection
tags: [struct]
```

```Go
type ActionEventConnection struct {
	Nodes      []ActionEvent
	TotalCount int
	PageInfo   PageInfo
}
```

### <a id="Monitor" href="#Monitor">type Monitor struct</a>

```
searchKey: apitest.Monitor
tags: [struct]
```

```Go
type Monitor struct {
	Id          string
	Description string
	Enabled     bool
	Owner       UserOrg
	CreatedBy   UserOrg
	CreatedAt   string
	Trigger     Trigger
	Actions     ActionConnection
}
```

### <a id="MonitorConnection" href="#MonitorConnection">type MonitorConnection struct</a>

```
searchKey: apitest.MonitorConnection
tags: [struct]
```

```Go
type MonitorConnection struct {
	Nodes      []Monitor
	TotalCount int
	PageInfo   PageInfo
}
```

### <a id="Node" href="#Node">type Node struct</a>

```
searchKey: apitest.Node
tags: [struct]
```

```Go
type Node struct {
	Node Monitor
}
```

### <a id="PageInfo" href="#PageInfo">type PageInfo struct</a>

```
searchKey: apitest.PageInfo
tags: [struct]
```

```Go
type PageInfo struct {
	HasNextPage bool
	EndCursor   *string
}
```

### <a id="RecipientsConnection" href="#RecipientsConnection">type RecipientsConnection struct</a>

```
searchKey: apitest.RecipientsConnection
tags: [struct]
```

```Go
type RecipientsConnection struct {
	Nodes      []UserOrg
	TotalCount int
	PageInfo   PageInfo
}
```

### <a id="Response" href="#Response">type Response struct</a>

```
searchKey: apitest.Response
tags: [struct]
```

```Go
type Response struct {
	User User
}
```

### <a id="Trigger" href="#Trigger">type Trigger struct</a>

```
searchKey: apitest.Trigger
tags: [struct]
```

```Go
type Trigger struct {
	Id     string
	Query  string
	Events TriggerEventConnection
}
```

### <a id="TriggerEvent" href="#TriggerEvent">type TriggerEvent struct</a>

```
searchKey: apitest.TriggerEvent
tags: [struct]
```

```Go
type TriggerEvent struct {
	Id        string
	Status    string
	Timestamp string
	Message   *string
}
```

### <a id="TriggerEventConnection" href="#TriggerEventConnection">type TriggerEventConnection struct</a>

```
searchKey: apitest.TriggerEventConnection
tags: [struct]
```

```Go
type TriggerEventConnection struct {
	Nodes      []TriggerEvent
	TotalCount int
	PageInfo   PageInfo
}
```

### <a id="UpdateCodeMonitorResponse" href="#UpdateCodeMonitorResponse">type UpdateCodeMonitorResponse struct</a>

```
searchKey: apitest.UpdateCodeMonitorResponse
tags: [struct]
```

```Go
type UpdateCodeMonitorResponse struct {
	UpdateCodeMonitor Monitor
}
```

### <a id="User" href="#User">type User struct</a>

```
searchKey: apitest.User
tags: [struct]
```

```Go
type User struct {
	Monitors MonitorConnection
}
```

### <a id="UserOrg" href="#UserOrg">type UserOrg struct</a>

```
searchKey: apitest.UserOrg
tags: [struct]
```

```Go
type UserOrg struct {
	Name string `json:"username"`
}
```

