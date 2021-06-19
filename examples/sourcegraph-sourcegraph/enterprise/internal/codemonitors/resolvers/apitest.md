# Package apitest

Package apitest provided types used in testing. 

## Index

* [Types](#type)
    * [type Response struct](#Response)
    * [type UpdateCodeMonitorResponse struct](#UpdateCodeMonitorResponse)
    * [type User struct](#User)
    * [type Node struct](#Node)
    * [type MonitorConnection struct](#MonitorConnection)
    * [type Monitor struct](#Monitor)
    * [type UserOrg struct](#UserOrg)
    * [type PageInfo struct](#PageInfo)
    * [type ActionConnection struct](#ActionConnection)
    * [type Action struct](#Action)
    * [type ActionEmail struct](#ActionEmail)
    * [type RecipientsConnection struct](#RecipientsConnection)
    * [type Trigger struct](#Trigger)
    * [type TriggerEventConnection struct](#TriggerEventConnection)
    * [type TriggerEvent struct](#TriggerEvent)
    * [type ActionEventConnection struct](#ActionEventConnection)
    * [type ActionEvent struct](#ActionEvent)


## <a id="type" href="#type">Types</a>

### <a id="Response" href="#Response">type Response struct</a>

```
searchKey: apitest.Response
tags: [exported]
```

```Go
type Response struct {
	User User
}
```

### <a id="UpdateCodeMonitorResponse" href="#UpdateCodeMonitorResponse">type UpdateCodeMonitorResponse struct</a>

```
searchKey: apitest.UpdateCodeMonitorResponse
tags: [exported]
```

```Go
type UpdateCodeMonitorResponse struct {
	UpdateCodeMonitor Monitor
}
```

### <a id="User" href="#User">type User struct</a>

```
searchKey: apitest.User
tags: [exported]
```

```Go
type User struct {
	Monitors MonitorConnection
}
```

### <a id="Node" href="#Node">type Node struct</a>

```
searchKey: apitest.Node
tags: [exported]
```

```Go
type Node struct {
	Node Monitor
}
```

### <a id="MonitorConnection" href="#MonitorConnection">type MonitorConnection struct</a>

```
searchKey: apitest.MonitorConnection
tags: [exported]
```

```Go
type MonitorConnection struct {
	Nodes      []Monitor
	TotalCount int
	PageInfo   PageInfo
}
```

### <a id="Monitor" href="#Monitor">type Monitor struct</a>

```
searchKey: apitest.Monitor
tags: [exported]
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

### <a id="UserOrg" href="#UserOrg">type UserOrg struct</a>

```
searchKey: apitest.UserOrg
tags: [exported]
```

```Go
type UserOrg struct {
	Name string `json:"username"`
}
```

### <a id="PageInfo" href="#PageInfo">type PageInfo struct</a>

```
searchKey: apitest.PageInfo
tags: [exported]
```

```Go
type PageInfo struct {
	HasNextPage bool
	EndCursor   *string
}
```

### <a id="ActionConnection" href="#ActionConnection">type ActionConnection struct</a>

```
searchKey: apitest.ActionConnection
tags: [exported]
```

```Go
type ActionConnection struct {
	Nodes      []Action
	TotalCount int
	PageInfo   PageInfo
}
```

### <a id="Action" href="#Action">type Action struct</a>

```
searchKey: apitest.Action
tags: [exported]
```

```Go
type Action struct {
	ActionEmail
}
```

### <a id="ActionEmail" href="#ActionEmail">type ActionEmail struct</a>

```
searchKey: apitest.ActionEmail
tags: [exported]
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

### <a id="RecipientsConnection" href="#RecipientsConnection">type RecipientsConnection struct</a>

```
searchKey: apitest.RecipientsConnection
tags: [exported]
```

```Go
type RecipientsConnection struct {
	Nodes      []UserOrg
	TotalCount int
	PageInfo   PageInfo
}
```

### <a id="Trigger" href="#Trigger">type Trigger struct</a>

```
searchKey: apitest.Trigger
tags: [exported]
```

```Go
type Trigger struct {
	Id     string
	Query  string
	Events TriggerEventConnection
}
```

### <a id="TriggerEventConnection" href="#TriggerEventConnection">type TriggerEventConnection struct</a>

```
searchKey: apitest.TriggerEventConnection
tags: [exported]
```

```Go
type TriggerEventConnection struct {
	Nodes      []TriggerEvent
	TotalCount int
	PageInfo   PageInfo
}
```

### <a id="TriggerEvent" href="#TriggerEvent">type TriggerEvent struct</a>

```
searchKey: apitest.TriggerEvent
tags: [exported]
```

```Go
type TriggerEvent struct {
	Id        string
	Status    string
	Timestamp string
	Message   *string
}
```

### <a id="ActionEventConnection" href="#ActionEventConnection">type ActionEventConnection struct</a>

```
searchKey: apitest.ActionEventConnection
tags: [exported]
```

```Go
type ActionEventConnection struct {
	Nodes      []ActionEvent
	TotalCount int
	PageInfo   PageInfo
}
```

### <a id="ActionEvent" href="#ActionEvent">type ActionEvent struct</a>

```
searchKey: apitest.ActionEvent
tags: [exported]
```

```Go
type ActionEvent struct {
	Id        string
	Status    string
	Timestamp string
	Message   *string
}
```

