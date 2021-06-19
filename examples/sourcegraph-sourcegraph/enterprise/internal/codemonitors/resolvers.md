# Package resolvers

## Index

* Subpages
  * [enterprise/internal/codemonitors/resolvers/apitest](resolvers/apitest.md)
* [Constants](#const)
    * [const MonitorKind](#MonitorKind)
    * [const monitorTriggerQueryKind](#monitorTriggerQueryKind)
    * [const monitorTriggerEventKind](#monitorTriggerEventKind)
    * [const monitorActionEmailKind](#monitorActionEmailKind)
    * [const monitorActionEventKind](#monitorActionEventKind)
    * [const monitorActionEmailRecipientKind](#monitorActionEmailRecipientKind)
    * [const queryByUserFmtStr](#queryByUserFmtStr)
    * [const editMonitor](#editMonitor)
    * [const recipientsPagingFmtStr](#recipientsPagingFmtStr)
    * [const queryMonitorByIDFmtStr](#queryMonitorByIDFmtStr)
    * [const monitorPagingFmtStr](#monitorPagingFmtStr)
    * [const actionPagingFmtStr](#actionPagingFmtStr)
    * [const triggerEventPagingFmtStr](#triggerEventPagingFmtStr)
    * [const actionEventPagingFmtStr](#actionEventPagingFmtStr)
* [Variables](#var)
    * [var stateToStatus](#stateToStatus)
* [Types](#type)
    * [type Resolver struct](#Resolver)
        * [func newTestResolver(t *testing.T, db dbutil.DB) *Resolver](#newTestResolver)
        * [func (r *Resolver) Now() time.Time](#Resolver.Now)
        * [func (r *Resolver) NodeResolvers() map[string]graphqlbackend.NodeByIDFunc](#Resolver.NodeResolvers)
        * [func (r *Resolver) Monitors(ctx context.Context, userID int32, args *graphqlbackend.ListMonitorsArgs) (graphqlbackend.MonitorConnectionResolver, error)](#Resolver.Monitors)
        * [func (r *Resolver) MonitorByID(ctx context.Context, id graphql.ID) (m graphqlbackend.MonitorResolver, err error)](#Resolver.MonitorByID)
        * [func (r *Resolver) CreateCodeMonitor(ctx context.Context, args *graphqlbackend.CreateCodeMonitorArgs) (m graphqlbackend.MonitorResolver, err error)](#Resolver.CreateCodeMonitor)
        * [func (r *Resolver) ToggleCodeMonitor(ctx context.Context, args *graphqlbackend.ToggleCodeMonitorArgs) (mr graphqlbackend.MonitorResolver, err error)](#Resolver.ToggleCodeMonitor)
        * [func (r *Resolver) DeleteCodeMonitor(ctx context.Context, args *graphqlbackend.DeleteCodeMonitorArgs) (*graphqlbackend.EmptyResponse, error)](#Resolver.DeleteCodeMonitor)
        * [func (r *Resolver) UpdateCodeMonitor(ctx context.Context, args *graphqlbackend.UpdateCodeMonitorArgs) (m graphqlbackend.MonitorResolver, err error)](#Resolver.UpdateCodeMonitor)
        * [func (r *Resolver) ResetTriggerQueryTimestamps(ctx context.Context, args *graphqlbackend.ResetTriggerQueryTimestampsArgs) (*graphqlbackend.EmptyResponse, error)](#Resolver.ResetTriggerQueryTimestamps)
        * [func (r *Resolver) TriggerTestEmailAction(ctx context.Context, args *graphqlbackend.TriggerTestEmailActionArgs) (*graphqlbackend.EmptyResponse, error)](#Resolver.TriggerTestEmailAction)
        * [func (r *Resolver) actionIDsForMonitorIDInt64(ctx context.Context, monitorID int64) (actionIDs []graphql.ID, err error)](#Resolver.actionIDsForMonitorIDInt64)
        * [func (r *Resolver) actionIDsForMonitorIDINT64SinglePage(ctx context.Context, q *sqlf.Query, limit int) (ids []graphql.ID, cursor *string, err error)](#Resolver.actionIDsForMonitorIDINT64SinglePage)
        * [func (r *Resolver) updateCodeMonitor(ctx context.Context, args *graphqlbackend.UpdateCodeMonitorArgs) (m graphqlbackend.MonitorResolver, err error)](#Resolver.updateCodeMonitor)
        * [func (r *Resolver) transact(ctx context.Context) (*Resolver, error)](#Resolver.transact)
        * [func (r *Resolver) isAllowedToEdit(ctx context.Context, monitorID graphql.ID) error](#Resolver.isAllowedToEdit)
        * [func (r *Resolver) isAllowedToCreate(ctx context.Context, owner graphql.ID) error](#Resolver.isAllowedToCreate)
        * [func (r *Resolver) ownerForID64(ctx context.Context, monitorID int64) (owner graphql.ID, err error)](#Resolver.ownerForID64)
        * [func (r *Resolver) actionConnectionResolverWithTriggerID(ctx context.Context, triggerEventID *int, monitorID int64, args *graphqlbackend.ListActionArgs) (graphqlbackend.MonitorActionConnectionResolver, error)](#Resolver.actionConnectionResolverWithTriggerID)
        * [func (r *Resolver) insertTestMonitorWithOpts(ctx context.Context, t *testing.T, opts ...Option) (graphqlbackend.MonitorResolver, error)](#Resolver.insertTestMonitorWithOpts)
    * [type monitorConnection struct](#monitorConnection)
        * [func (m *monitorConnection) Nodes(ctx context.Context) ([]graphqlbackend.MonitorResolver, error)](#monitorConnection.Nodes)
        * [func (m *monitorConnection) TotalCount(ctx context.Context) (int32, error)](#monitorConnection.TotalCount)
        * [func (m *monitorConnection) PageInfo(ctx context.Context) (*graphqlutil.PageInfo, error)](#monitorConnection.PageInfo)
    * [type monitor struct](#monitor)
        * [func (m *monitor) ID() graphql.ID](#monitor.ID)
        * [func (m *monitor) CreatedBy(ctx context.Context) (*graphqlbackend.UserResolver, error)](#monitor.CreatedBy)
        * [func (m *monitor) CreatedAt() graphqlbackend.DateTime](#monitor.CreatedAt)
        * [func (m *monitor) Description() string](#monitor.Description)
        * [func (m *monitor) Enabled() bool](#monitor.Enabled)
        * [func (m *monitor) Owner(ctx context.Context) (n graphqlbackend.NamespaceResolver, err error)](#monitor.Owner)
        * [func (m *monitor) Trigger(ctx context.Context) (graphqlbackend.MonitorTrigger, error)](#monitor.Trigger)
        * [func (m *monitor) Actions(ctx context.Context, args *graphqlbackend.ListActionArgs) (graphqlbackend.MonitorActionConnectionResolver, error)](#monitor.Actions)
    * [type monitorTrigger struct](#monitorTrigger)
        * [func (t *monitorTrigger) ToMonitorQuery() (graphqlbackend.MonitorQueryResolver, bool)](#monitorTrigger.ToMonitorQuery)
    * [type monitorQuery struct](#monitorQuery)
        * [func (q *monitorQuery) ID() graphql.ID](#monitorQuery.ID)
        * [func (q *monitorQuery) Query() string](#monitorQuery.Query)
        * [func (q *monitorQuery) Events(ctx context.Context, args *graphqlbackend.ListEventsArgs) (graphqlbackend.MonitorTriggerEventConnectionResolver, error)](#monitorQuery.Events)
    * [type monitorTriggerEventConnection struct](#monitorTriggerEventConnection)
        * [func (a *monitorTriggerEventConnection) Nodes(ctx context.Context) ([]graphqlbackend.MonitorTriggerEventResolver, error)](#monitorTriggerEventConnection.Nodes)
        * [func (a *monitorTriggerEventConnection) TotalCount(ctx context.Context) (int32, error)](#monitorTriggerEventConnection.TotalCount)
        * [func (a *monitorTriggerEventConnection) PageInfo(ctx context.Context) (*graphqlutil.PageInfo, error)](#monitorTriggerEventConnection.PageInfo)
    * [type monitorTriggerEvent struct](#monitorTriggerEvent)
        * [func (m *monitorTriggerEvent) ID() graphql.ID](#monitorTriggerEvent.ID)
        * [func (m *monitorTriggerEvent) Status() (string, error)](#monitorTriggerEvent.Status)
        * [func (m *monitorTriggerEvent) Message() *string](#monitorTriggerEvent.Message)
        * [func (m *monitorTriggerEvent) Timestamp() (graphqlbackend.DateTime, error)](#monitorTriggerEvent.Timestamp)
        * [func (m *monitorTriggerEvent) Actions(ctx context.Context, args *graphqlbackend.ListActionArgs) (graphqlbackend.MonitorActionConnectionResolver, error)](#monitorTriggerEvent.Actions)
    * [type monitorActionConnection struct](#monitorActionConnection)
        * [func (a *monitorActionConnection) Nodes(ctx context.Context) ([]graphqlbackend.MonitorAction, error)](#monitorActionConnection.Nodes)
        * [func (a *monitorActionConnection) TotalCount(ctx context.Context) (int32, error)](#monitorActionConnection.TotalCount)
        * [func (a *monitorActionConnection) PageInfo(ctx context.Context) (*graphqlutil.PageInfo, error)](#monitorActionConnection.PageInfo)
    * [type action struct](#action)
        * [func (a *action) ToMonitorEmail() (graphqlbackend.MonitorEmailResolver, bool)](#action.ToMonitorEmail)
    * [type monitorEmail struct](#monitorEmail)
        * [func (m *monitorEmail) Recipients(ctx context.Context, args *graphqlbackend.ListRecipientsArgs) (c graphqlbackend.MonitorActionEmailRecipientsConnectionResolver, err error)](#monitorEmail.Recipients)
        * [func (m *monitorEmail) Enabled() bool](#monitorEmail.Enabled)
        * [func (m *monitorEmail) Priority() string](#monitorEmail.Priority)
        * [func (m *monitorEmail) Header() string](#monitorEmail.Header)
        * [func (m *monitorEmail) ID() graphql.ID](#monitorEmail.ID)
        * [func (m *monitorEmail) Events(ctx context.Context, args *graphqlbackend.ListEventsArgs) (graphqlbackend.MonitorActionEventConnectionResolver, error)](#monitorEmail.Events)
    * [type monitorActionEmailRecipientsConnection struct](#monitorActionEmailRecipientsConnection)
        * [func (a *monitorActionEmailRecipientsConnection) Nodes(ctx context.Context) ([]graphqlbackend.NamespaceResolver, error)](#monitorActionEmailRecipientsConnection.Nodes)
        * [func (a *monitorActionEmailRecipientsConnection) TotalCount(ctx context.Context) (int32, error)](#monitorActionEmailRecipientsConnection.TotalCount)
        * [func (a *monitorActionEmailRecipientsConnection) PageInfo(ctx context.Context) (*graphqlutil.PageInfo, error)](#monitorActionEmailRecipientsConnection.PageInfo)
    * [type monitorActionEventConnection struct](#monitorActionEventConnection)
        * [func (a *monitorActionEventConnection) Nodes(ctx context.Context) ([]graphqlbackend.MonitorActionEventResolver, error)](#monitorActionEventConnection.Nodes)
        * [func (a *monitorActionEventConnection) TotalCount(ctx context.Context) (int32, error)](#monitorActionEventConnection.TotalCount)
        * [func (a *monitorActionEventConnection) PageInfo(ctx context.Context) (*graphqlutil.PageInfo, error)](#monitorActionEventConnection.PageInfo)
    * [type monitorActionEvent struct](#monitorActionEvent)
        * [func (m *monitorActionEvent) ID() graphql.ID](#monitorActionEvent.ID)
        * [func (m *monitorActionEvent) Status() (string, error)](#monitorActionEvent.Status)
        * [func (m *monitorActionEvent) Message() *string](#monitorActionEvent.Message)
        * [func (m *monitorActionEvent) Timestamp() graphqlbackend.DateTime](#monitorActionEvent.Timestamp)
    * [type Option interface](#Option)
        * [func WithActions(actions []*graphqlbackend.CreateActionArgs) Option](#WithActions)
        * [func WithOwner(owner graphql.ID) Option](#WithOwner)
        * [func WithPostHooks(hooks []hook) Option](#WithPostHooks)
    * [type hook func() error](#hook)
    * [type options struct](#options)
    * [type actionOption struct](#actionOption)
        * [func (a actionOption) apply(opts *options)](#actionOption.apply)
    * [type ownerOption struct](#ownerOption)
        * [func (o ownerOption) apply(opts *options)](#ownerOption.apply)
    * [type postHookOption struct](#postHookOption)
        * [func (h postHookOption) apply(opts *options)](#postHookOption.apply)
    * [type testUser struct](#testUser)
        * [func (u *testUser) id() graphql.ID](#testUser.id)
* [Functions](#func)
    * [func NewResolver(db dbutil.DB) graphqlbackend.CodeMonitorsResolver](#NewResolver)
    * [func newResolverWithClock(db dbutil.DB, clock func() time.Time) graphqlbackend.CodeMonitorsResolver](#newResolverWithClock)
    * [func sendTestEmail(ctx context.Context, recipient graphql.ID, description string) error](#sendTestEmail)
    * [func splitActionIDs(ctx context.Context, args *graphqlbackend.UpdateCodeMonitorArgs, actionIDs []graphql.ID) (toCreate []*graphqlbackend.CreateActionArgs, toDelete []int64, err error)](#splitActionIDs)
    * [func ownerForID64Query(ctx context.Context, monitorID int64) (*sqlf.Query, error)](#ownerForID64Query)
    * [func insertTestUser(t *testing.T, db *sql.DB, name string, isAdmin bool) (userID int32)](#insertTestUser)
    * [func addUserToOrg(t *testing.T, db *sql.DB, userID int32, orgID int32)](#addUserToOrg)
    * [func marshalDateTime(t testing.TB, ts time.Time) string](#marshalDateTime)
    * [func init()](#init)
    * [func TestCreateCodeMonitor(t *testing.T)](#TestCreateCodeMonitor)
    * [func TestListCodeMonitors(t *testing.T)](#TestListCodeMonitors)
    * [func requireNodeCount(t *testing.T, r graphqlbackend.MonitorConnectionResolver, c int)](#requireNodeCount)
    * [func requireHasNextPage(t *testing.T, r graphqlbackend.MonitorConnectionResolver, hasNextPage bool)](#requireHasNextPage)
    * [func TestIsAllowedToEdit(t *testing.T)](#TestIsAllowedToEdit)
    * [func TestIsAllowedToCreate(t *testing.T)](#TestIsAllowedToCreate)
    * [func TestQueryMonitor(t *testing.T)](#TestQueryMonitor)
    * [func queryByUser(ctx context.Context, t *testing.T, schema *graphql.Schema, r *Resolver, user1 *testUser, user2 *testUser)](#queryByUser)
    * [func TestEditCodeMonitor(t *testing.T)](#TestEditCodeMonitor)
    * [func recipientPaging(ctx context.Context, t *testing.T, schema *graphql.Schema, user1 *testUser, user2 *testUser)](#recipientPaging)
    * [func queryByID(ctx context.Context, t *testing.T, schema *graphql.Schema, r *Resolver, m *monitor, user1 *testUser, user2 *testUser)](#queryByID)
    * [func monitorPaging(ctx context.Context, t *testing.T, schema *graphql.Schema, user1 *testUser)](#monitorPaging)
    * [func actionPaging(ctx context.Context, t *testing.T, schema *graphql.Schema, user1 *testUser)](#actionPaging)
    * [func triggerEventPaging(ctx context.Context, t *testing.T, schema *graphql.Schema, user1 *testUser)](#triggerEventPaging)
    * [func actionEventPaging(ctx context.Context, t *testing.T, schema *graphql.Schema, user1 *testUser)](#actionEventPaging)
    * [func TestTriggerTestEmailAction(t *testing.T)](#TestTriggerTestEmailAction)
    * [func TestMonitorKindEqualsResolvers(t *testing.T)](#TestMonitorKindEqualsResolvers)


## <a id="const" href="#const">Constants</a>

### <a id="MonitorKind" href="#MonitorKind">const MonitorKind</a>

```
searchKey: resolvers.MonitorKind
tags: [exported]
```

```Go
const MonitorKind = "CodeMonitor"
```

### <a id="monitorTriggerQueryKind" href="#monitorTriggerQueryKind">const monitorTriggerQueryKind</a>

```
searchKey: resolvers.monitorTriggerQueryKind
```

```Go
const monitorTriggerQueryKind = "CodeMonitorTriggerQuery"
```

### <a id="monitorTriggerEventKind" href="#monitorTriggerEventKind">const monitorTriggerEventKind</a>

```
searchKey: resolvers.monitorTriggerEventKind
```

```Go
const monitorTriggerEventKind = "CodeMonitorTriggerEvent"
```

### <a id="monitorActionEmailKind" href="#monitorActionEmailKind">const monitorActionEmailKind</a>

```
searchKey: resolvers.monitorActionEmailKind
```

```Go
const monitorActionEmailKind = "CodeMonitorActionEmail"
```

### <a id="monitorActionEventKind" href="#monitorActionEventKind">const monitorActionEventKind</a>

```
searchKey: resolvers.monitorActionEventKind
```

```Go
const monitorActionEventKind = "CodeMonitorActionEmailEvent"
```

### <a id="monitorActionEmailRecipientKind" href="#monitorActionEmailRecipientKind">const monitorActionEmailRecipientKind</a>

```
searchKey: resolvers.monitorActionEmailRecipientKind
```

```Go
const monitorActionEmailRecipientKind = "CodeMonitorActionEmailRecipient"
```

### <a id="queryByUserFmtStr" href="#queryByUserFmtStr">const queryByUserFmtStr</a>

```
searchKey: resolvers.queryByUserFmtStr
```

```Go
const queryByUserFmtStr = ...
```

### <a id="editMonitor" href="#editMonitor">const editMonitor</a>

```
searchKey: resolvers.editMonitor
```

```Go
const editMonitor = ...
```

### <a id="recipientsPagingFmtStr" href="#recipientsPagingFmtStr">const recipientsPagingFmtStr</a>

```
searchKey: resolvers.recipientsPagingFmtStr
```

```Go
const recipientsPagingFmtStr = ...
```

### <a id="queryMonitorByIDFmtStr" href="#queryMonitorByIDFmtStr">const queryMonitorByIDFmtStr</a>

```
searchKey: resolvers.queryMonitorByIDFmtStr
```

```Go
const queryMonitorByIDFmtStr = ...
```

### <a id="monitorPagingFmtStr" href="#monitorPagingFmtStr">const monitorPagingFmtStr</a>

```
searchKey: resolvers.monitorPagingFmtStr
```

```Go
const monitorPagingFmtStr = ...
```

### <a id="actionPagingFmtStr" href="#actionPagingFmtStr">const actionPagingFmtStr</a>

```
searchKey: resolvers.actionPagingFmtStr
```

```Go
const actionPagingFmtStr = ...
```

### <a id="triggerEventPagingFmtStr" href="#triggerEventPagingFmtStr">const triggerEventPagingFmtStr</a>

```
searchKey: resolvers.triggerEventPagingFmtStr
```

```Go
const triggerEventPagingFmtStr = ...
```

### <a id="actionEventPagingFmtStr" href="#actionEventPagingFmtStr">const actionEventPagingFmtStr</a>

```
searchKey: resolvers.actionEventPagingFmtStr
```

```Go
const actionEventPagingFmtStr = ...
```

## <a id="var" href="#var">Variables</a>

### <a id="stateToStatus" href="#stateToStatus">var stateToStatus</a>

```
searchKey: resolvers.stateToStatus
```

```Go
var stateToStatus = ...
```

stateToStatus maps the state of the dbworker job to the public GraphQL status of events. 

## <a id="type" href="#type">Types</a>

### <a id="Resolver" href="#Resolver">type Resolver struct</a>

```
searchKey: resolvers.Resolver
tags: [exported]
```

```Go
type Resolver struct {
	store *cm.Store
}
```

#### <a id="newTestResolver" href="#newTestResolver">func newTestResolver(t *testing.T, db dbutil.DB) *Resolver</a>

```
searchKey: resolvers.newTestResolver
```

```Go
func newTestResolver(t *testing.T, db dbutil.DB) *Resolver
```

newTestResolver returns a Resolver with stopped clock, which is useful to compare input and outputs in tests. 

#### <a id="Resolver.Now" href="#Resolver.Now">func (r *Resolver) Now() time.Time</a>

```
searchKey: resolvers.Resolver.Now
tags: [exported]
```

```Go
func (r *Resolver) Now() time.Time
```

#### <a id="Resolver.NodeResolvers" href="#Resolver.NodeResolvers">func (r *Resolver) NodeResolvers() map[string]graphqlbackend.NodeByIDFunc</a>

```
searchKey: resolvers.Resolver.NodeResolvers
tags: [exported]
```

```Go
func (r *Resolver) NodeResolvers() map[string]graphqlbackend.NodeByIDFunc
```

#### <a id="Resolver.Monitors" href="#Resolver.Monitors">func (r *Resolver) Monitors(ctx context.Context, userID int32, args *graphqlbackend.ListMonitorsArgs) (graphqlbackend.MonitorConnectionResolver, error)</a>

```
searchKey: resolvers.Resolver.Monitors
tags: [exported]
```

```Go
func (r *Resolver) Monitors(ctx context.Context, userID int32, args *graphqlbackend.ListMonitorsArgs) (graphqlbackend.MonitorConnectionResolver, error)
```

#### <a id="Resolver.MonitorByID" href="#Resolver.MonitorByID">func (r *Resolver) MonitorByID(ctx context.Context, id graphql.ID) (m graphqlbackend.MonitorResolver, err error)</a>

```
searchKey: resolvers.Resolver.MonitorByID
tags: [exported]
```

```Go
func (r *Resolver) MonitorByID(ctx context.Context, id graphql.ID) (m graphqlbackend.MonitorResolver, err error)
```

#### <a id="Resolver.CreateCodeMonitor" href="#Resolver.CreateCodeMonitor">func (r *Resolver) CreateCodeMonitor(ctx context.Context, args *graphqlbackend.CreateCodeMonitorArgs) (m graphqlbackend.MonitorResolver, err error)</a>

```
searchKey: resolvers.Resolver.CreateCodeMonitor
tags: [exported]
```

```Go
func (r *Resolver) CreateCodeMonitor(ctx context.Context, args *graphqlbackend.CreateCodeMonitorArgs) (m graphqlbackend.MonitorResolver, err error)
```

#### <a id="Resolver.ToggleCodeMonitor" href="#Resolver.ToggleCodeMonitor">func (r *Resolver) ToggleCodeMonitor(ctx context.Context, args *graphqlbackend.ToggleCodeMonitorArgs) (mr graphqlbackend.MonitorResolver, err error)</a>

```
searchKey: resolvers.Resolver.ToggleCodeMonitor
tags: [exported]
```

```Go
func (r *Resolver) ToggleCodeMonitor(ctx context.Context, args *graphqlbackend.ToggleCodeMonitorArgs) (mr graphqlbackend.MonitorResolver, err error)
```

#### <a id="Resolver.DeleteCodeMonitor" href="#Resolver.DeleteCodeMonitor">func (r *Resolver) DeleteCodeMonitor(ctx context.Context, args *graphqlbackend.DeleteCodeMonitorArgs) (*graphqlbackend.EmptyResponse, error)</a>

```
searchKey: resolvers.Resolver.DeleteCodeMonitor
tags: [exported]
```

```Go
func (r *Resolver) DeleteCodeMonitor(ctx context.Context, args *graphqlbackend.DeleteCodeMonitorArgs) (*graphqlbackend.EmptyResponse, error)
```

#### <a id="Resolver.UpdateCodeMonitor" href="#Resolver.UpdateCodeMonitor">func (r *Resolver) UpdateCodeMonitor(ctx context.Context, args *graphqlbackend.UpdateCodeMonitorArgs) (m graphqlbackend.MonitorResolver, err error)</a>

```
searchKey: resolvers.Resolver.UpdateCodeMonitor
tags: [exported]
```

```Go
func (r *Resolver) UpdateCodeMonitor(ctx context.Context, args *graphqlbackend.UpdateCodeMonitorArgs) (m graphqlbackend.MonitorResolver, err error)
```

#### <a id="Resolver.ResetTriggerQueryTimestamps" href="#Resolver.ResetTriggerQueryTimestamps">func (r *Resolver) ResetTriggerQueryTimestamps(ctx context.Context, args *graphqlbackend.ResetTriggerQueryTimestampsArgs) (*graphqlbackend.EmptyResponse, error)</a>

```
searchKey: resolvers.Resolver.ResetTriggerQueryTimestamps
tags: [exported]
```

```Go
func (r *Resolver) ResetTriggerQueryTimestamps(ctx context.Context, args *graphqlbackend.ResetTriggerQueryTimestampsArgs) (*graphqlbackend.EmptyResponse, error)
```

ResetTriggerQueryTimestamps is a convenience function which resets the timestamps `next_run` and `last_result` with the purpose to trigger associated actions (emails, webhooks) immediately. This is useful during development and troubleshooting. Only site admins can call this functions. 

#### <a id="Resolver.TriggerTestEmailAction" href="#Resolver.TriggerTestEmailAction">func (r *Resolver) TriggerTestEmailAction(ctx context.Context, args *graphqlbackend.TriggerTestEmailActionArgs) (*graphqlbackend.EmptyResponse, error)</a>

```
searchKey: resolvers.Resolver.TriggerTestEmailAction
tags: [exported]
```

```Go
func (r *Resolver) TriggerTestEmailAction(ctx context.Context, args *graphqlbackend.TriggerTestEmailActionArgs) (*graphqlbackend.EmptyResponse, error)
```

#### <a id="Resolver.actionIDsForMonitorIDInt64" href="#Resolver.actionIDsForMonitorIDInt64">func (r *Resolver) actionIDsForMonitorIDInt64(ctx context.Context, monitorID int64) (actionIDs []graphql.ID, err error)</a>

```
searchKey: resolvers.Resolver.actionIDsForMonitorIDInt64
```

```Go
func (r *Resolver) actionIDsForMonitorIDInt64(ctx context.Context, monitorID int64) (actionIDs []graphql.ID, err error)
```

#### <a id="Resolver.actionIDsForMonitorIDINT64SinglePage" href="#Resolver.actionIDsForMonitorIDINT64SinglePage">func (r *Resolver) actionIDsForMonitorIDINT64SinglePage(ctx context.Context, q *sqlf.Query, limit int) (ids []graphql.ID, cursor *string, err error)</a>

```
searchKey: resolvers.Resolver.actionIDsForMonitorIDINT64SinglePage
```

```Go
func (r *Resolver) actionIDsForMonitorIDINT64SinglePage(ctx context.Context, q *sqlf.Query, limit int) (ids []graphql.ID, cursor *string, err error)
```

#### <a id="Resolver.updateCodeMonitor" href="#Resolver.updateCodeMonitor">func (r *Resolver) updateCodeMonitor(ctx context.Context, args *graphqlbackend.UpdateCodeMonitorArgs) (m graphqlbackend.MonitorResolver, err error)</a>

```
searchKey: resolvers.Resolver.updateCodeMonitor
```

```Go
func (r *Resolver) updateCodeMonitor(ctx context.Context, args *graphqlbackend.UpdateCodeMonitorArgs) (m graphqlbackend.MonitorResolver, err error)
```

#### <a id="Resolver.transact" href="#Resolver.transact">func (r *Resolver) transact(ctx context.Context) (*Resolver, error)</a>

```
searchKey: resolvers.Resolver.transact
```

```Go
func (r *Resolver) transact(ctx context.Context) (*Resolver, error)
```

#### <a id="Resolver.isAllowedToEdit" href="#Resolver.isAllowedToEdit">func (r *Resolver) isAllowedToEdit(ctx context.Context, monitorID graphql.ID) error</a>

```
searchKey: resolvers.Resolver.isAllowedToEdit
```

```Go
func (r *Resolver) isAllowedToEdit(ctx context.Context, monitorID graphql.ID) error
```

isAllowedToEdit checks whether an actor is allowed to edit a given monitor. 

#### <a id="Resolver.isAllowedToCreate" href="#Resolver.isAllowedToCreate">func (r *Resolver) isAllowedToCreate(ctx context.Context, owner graphql.ID) error</a>

```
searchKey: resolvers.Resolver.isAllowedToCreate
```

```Go
func (r *Resolver) isAllowedToCreate(ctx context.Context, owner graphql.ID) error
```

isAllowedToCreate compares the owner of a monitor (user or org) to the actor of the request. A user can create a monitor if either of the following statements is true: - she is the owner - she is a member of the organization which is the owner of the monitor - she is a site-admin 

#### <a id="Resolver.ownerForID64" href="#Resolver.ownerForID64">func (r *Resolver) ownerForID64(ctx context.Context, monitorID int64) (owner graphql.ID, err error)</a>

```
searchKey: resolvers.Resolver.ownerForID64
```

```Go
func (r *Resolver) ownerForID64(ctx context.Context, monitorID int64) (owner graphql.ID, err error)
```

#### <a id="Resolver.actionConnectionResolverWithTriggerID" href="#Resolver.actionConnectionResolverWithTriggerID">func (r *Resolver) actionConnectionResolverWithTriggerID(ctx context.Context, triggerEventID *int, monitorID int64, args *graphqlbackend.ListActionArgs) (graphqlbackend.MonitorActionConnectionResolver, error)</a>

```
searchKey: resolvers.Resolver.actionConnectionResolverWithTriggerID
```

```Go
func (r *Resolver) actionConnectionResolverWithTriggerID(ctx context.Context, triggerEventID *int, monitorID int64, args *graphqlbackend.ListActionArgs) (graphqlbackend.MonitorActionConnectionResolver, error)
```

#### <a id="Resolver.insertTestMonitorWithOpts" href="#Resolver.insertTestMonitorWithOpts">func (r *Resolver) insertTestMonitorWithOpts(ctx context.Context, t *testing.T, opts ...Option) (graphqlbackend.MonitorResolver, error)</a>

```
searchKey: resolvers.Resolver.insertTestMonitorWithOpts
```

```Go
func (r *Resolver) insertTestMonitorWithOpts(ctx context.Context, t *testing.T, opts ...Option) (graphqlbackend.MonitorResolver, error)
```

insertTestMonitorWithOpts is a test helper that creates monitors for test purposes with sensible defaults. You can override the defaults by providing (optional) opts. 

### <a id="monitorConnection" href="#monitorConnection">type monitorConnection struct</a>

```
searchKey: resolvers.monitorConnection
```

```Go
type monitorConnection struct {
	*Resolver
	monitors    []graphqlbackend.MonitorResolver
	totalCount  int32
	hasNextPage bool
}
```

MonitorConnection 

#### <a id="monitorConnection.Nodes" href="#monitorConnection.Nodes">func (m *monitorConnection) Nodes(ctx context.Context) ([]graphqlbackend.MonitorResolver, error)</a>

```
searchKey: resolvers.monitorConnection.Nodes
```

```Go
func (m *monitorConnection) Nodes(ctx context.Context) ([]graphqlbackend.MonitorResolver, error)
```

#### <a id="monitorConnection.TotalCount" href="#monitorConnection.TotalCount">func (m *monitorConnection) TotalCount(ctx context.Context) (int32, error)</a>

```
searchKey: resolvers.monitorConnection.TotalCount
```

```Go
func (m *monitorConnection) TotalCount(ctx context.Context) (int32, error)
```

#### <a id="monitorConnection.PageInfo" href="#monitorConnection.PageInfo">func (m *monitorConnection) PageInfo(ctx context.Context) (*graphqlutil.PageInfo, error)</a>

```
searchKey: resolvers.monitorConnection.PageInfo
```

```Go
func (m *monitorConnection) PageInfo(ctx context.Context) (*graphqlutil.PageInfo, error)
```

### <a id="monitor" href="#monitor">type monitor struct</a>

```
searchKey: resolvers.monitor
```

```Go
type monitor struct {
	*Resolver
	*cm.Monitor
}
```

Monitor 

#### <a id="monitor.ID" href="#monitor.ID">func (m *monitor) ID() graphql.ID</a>

```
searchKey: resolvers.monitor.ID
```

```Go
func (m *monitor) ID() graphql.ID
```

#### <a id="monitor.CreatedBy" href="#monitor.CreatedBy">func (m *monitor) CreatedBy(ctx context.Context) (*graphqlbackend.UserResolver, error)</a>

```
searchKey: resolvers.monitor.CreatedBy
```

```Go
func (m *monitor) CreatedBy(ctx context.Context) (*graphqlbackend.UserResolver, error)
```

#### <a id="monitor.CreatedAt" href="#monitor.CreatedAt">func (m *monitor) CreatedAt() graphqlbackend.DateTime</a>

```
searchKey: resolvers.monitor.CreatedAt
```

```Go
func (m *monitor) CreatedAt() graphqlbackend.DateTime
```

#### <a id="monitor.Description" href="#monitor.Description">func (m *monitor) Description() string</a>

```
searchKey: resolvers.monitor.Description
```

```Go
func (m *monitor) Description() string
```

#### <a id="monitor.Enabled" href="#monitor.Enabled">func (m *monitor) Enabled() bool</a>

```
searchKey: resolvers.monitor.Enabled
```

```Go
func (m *monitor) Enabled() bool
```

#### <a id="monitor.Owner" href="#monitor.Owner">func (m *monitor) Owner(ctx context.Context) (n graphqlbackend.NamespaceResolver, err error)</a>

```
searchKey: resolvers.monitor.Owner
```

```Go
func (m *monitor) Owner(ctx context.Context) (n graphqlbackend.NamespaceResolver, err error)
```

#### <a id="monitor.Trigger" href="#monitor.Trigger">func (m *monitor) Trigger(ctx context.Context) (graphqlbackend.MonitorTrigger, error)</a>

```
searchKey: resolvers.monitor.Trigger
```

```Go
func (m *monitor) Trigger(ctx context.Context) (graphqlbackend.MonitorTrigger, error)
```

#### <a id="monitor.Actions" href="#monitor.Actions">func (m *monitor) Actions(ctx context.Context, args *graphqlbackend.ListActionArgs) (graphqlbackend.MonitorActionConnectionResolver, error)</a>

```
searchKey: resolvers.monitor.Actions
```

```Go
func (m *monitor) Actions(ctx context.Context, args *graphqlbackend.ListActionArgs) (graphqlbackend.MonitorActionConnectionResolver, error)
```

### <a id="monitorTrigger" href="#monitorTrigger">type monitorTrigger struct</a>

```
searchKey: resolvers.monitorTrigger
```

```Go
type monitorTrigger struct {
	query graphqlbackend.MonitorQueryResolver
}
```

MonitorTrigger <<UNION>> 

#### <a id="monitorTrigger.ToMonitorQuery" href="#monitorTrigger.ToMonitorQuery">func (t *monitorTrigger) ToMonitorQuery() (graphqlbackend.MonitorQueryResolver, bool)</a>

```
searchKey: resolvers.monitorTrigger.ToMonitorQuery
```

```Go
func (t *monitorTrigger) ToMonitorQuery() (graphqlbackend.MonitorQueryResolver, bool)
```

### <a id="monitorQuery" href="#monitorQuery">type monitorQuery struct</a>

```
searchKey: resolvers.monitorQuery
```

```Go
type monitorQuery struct {
	*Resolver
	*cm.MonitorQuery
}
```

Query 

#### <a id="monitorQuery.ID" href="#monitorQuery.ID">func (q *monitorQuery) ID() graphql.ID</a>

```
searchKey: resolvers.monitorQuery.ID
```

```Go
func (q *monitorQuery) ID() graphql.ID
```

#### <a id="monitorQuery.Query" href="#monitorQuery.Query">func (q *monitorQuery) Query() string</a>

```
searchKey: resolvers.monitorQuery.Query
```

```Go
func (q *monitorQuery) Query() string
```

#### <a id="monitorQuery.Events" href="#monitorQuery.Events">func (q *monitorQuery) Events(ctx context.Context, args *graphqlbackend.ListEventsArgs) (graphqlbackend.MonitorTriggerEventConnectionResolver, error)</a>

```
searchKey: resolvers.monitorQuery.Events
```

```Go
func (q *monitorQuery) Events(ctx context.Context, args *graphqlbackend.ListEventsArgs) (graphqlbackend.MonitorTriggerEventConnectionResolver, error)
```

### <a id="monitorTriggerEventConnection" href="#monitorTriggerEventConnection">type monitorTriggerEventConnection struct</a>

```
searchKey: resolvers.monitorTriggerEventConnection
```

```Go
type monitorTriggerEventConnection struct {
	*Resolver
	events     []graphqlbackend.MonitorTriggerEventResolver
	totalCount int32
}
```

MonitorTriggerEventConnection 

#### <a id="monitorTriggerEventConnection.Nodes" href="#monitorTriggerEventConnection.Nodes">func (a *monitorTriggerEventConnection) Nodes(ctx context.Context) ([]graphqlbackend.MonitorTriggerEventResolver, error)</a>

```
searchKey: resolvers.monitorTriggerEventConnection.Nodes
```

```Go
func (a *monitorTriggerEventConnection) Nodes(ctx context.Context) ([]graphqlbackend.MonitorTriggerEventResolver, error)
```

#### <a id="monitorTriggerEventConnection.TotalCount" href="#monitorTriggerEventConnection.TotalCount">func (a *monitorTriggerEventConnection) TotalCount(ctx context.Context) (int32, error)</a>

```
searchKey: resolvers.monitorTriggerEventConnection.TotalCount
```

```Go
func (a *monitorTriggerEventConnection) TotalCount(ctx context.Context) (int32, error)
```

#### <a id="monitorTriggerEventConnection.PageInfo" href="#monitorTriggerEventConnection.PageInfo">func (a *monitorTriggerEventConnection) PageInfo(ctx context.Context) (*graphqlutil.PageInfo, error)</a>

```
searchKey: resolvers.monitorTriggerEventConnection.PageInfo
```

```Go
func (a *monitorTriggerEventConnection) PageInfo(ctx context.Context) (*graphqlutil.PageInfo, error)
```

### <a id="monitorTriggerEvent" href="#monitorTriggerEvent">type monitorTriggerEvent struct</a>

```
searchKey: resolvers.monitorTriggerEvent
```

```Go
type monitorTriggerEvent struct {
	*Resolver
	*cm.TriggerJobs
	monitorID int64
}
```

MonitorTriggerEvent 

#### <a id="monitorTriggerEvent.ID" href="#monitorTriggerEvent.ID">func (m *monitorTriggerEvent) ID() graphql.ID</a>

```
searchKey: resolvers.monitorTriggerEvent.ID
```

```Go
func (m *monitorTriggerEvent) ID() graphql.ID
```

#### <a id="monitorTriggerEvent.Status" href="#monitorTriggerEvent.Status">func (m *monitorTriggerEvent) Status() (string, error)</a>

```
searchKey: resolvers.monitorTriggerEvent.Status
```

```Go
func (m *monitorTriggerEvent) Status() (string, error)
```

#### <a id="monitorTriggerEvent.Message" href="#monitorTriggerEvent.Message">func (m *monitorTriggerEvent) Message() *string</a>

```
searchKey: resolvers.monitorTriggerEvent.Message
```

```Go
func (m *monitorTriggerEvent) Message() *string
```

#### <a id="monitorTriggerEvent.Timestamp" href="#monitorTriggerEvent.Timestamp">func (m *monitorTriggerEvent) Timestamp() (graphqlbackend.DateTime, error)</a>

```
searchKey: resolvers.monitorTriggerEvent.Timestamp
```

```Go
func (m *monitorTriggerEvent) Timestamp() (graphqlbackend.DateTime, error)
```

#### <a id="monitorTriggerEvent.Actions" href="#monitorTriggerEvent.Actions">func (m *monitorTriggerEvent) Actions(ctx context.Context, args *graphqlbackend.ListActionArgs) (graphqlbackend.MonitorActionConnectionResolver, error)</a>

```
searchKey: resolvers.monitorTriggerEvent.Actions
```

```Go
func (m *monitorTriggerEvent) Actions(ctx context.Context, args *graphqlbackend.ListActionArgs) (graphqlbackend.MonitorActionConnectionResolver, error)
```

### <a id="monitorActionConnection" href="#monitorActionConnection">type monitorActionConnection struct</a>

```
searchKey: resolvers.monitorActionConnection
```

```Go
type monitorActionConnection struct {
	actions    []graphqlbackend.MonitorAction
	totalCount int32
}
```

ActionConnection 

#### <a id="monitorActionConnection.Nodes" href="#monitorActionConnection.Nodes">func (a *monitorActionConnection) Nodes(ctx context.Context) ([]graphqlbackend.MonitorAction, error)</a>

```
searchKey: resolvers.monitorActionConnection.Nodes
```

```Go
func (a *monitorActionConnection) Nodes(ctx context.Context) ([]graphqlbackend.MonitorAction, error)
```

#### <a id="monitorActionConnection.TotalCount" href="#monitorActionConnection.TotalCount">func (a *monitorActionConnection) TotalCount(ctx context.Context) (int32, error)</a>

```
searchKey: resolvers.monitorActionConnection.TotalCount
```

```Go
func (a *monitorActionConnection) TotalCount(ctx context.Context) (int32, error)
```

#### <a id="monitorActionConnection.PageInfo" href="#monitorActionConnection.PageInfo">func (a *monitorActionConnection) PageInfo(ctx context.Context) (*graphqlutil.PageInfo, error)</a>

```
searchKey: resolvers.monitorActionConnection.PageInfo
```

```Go
func (a *monitorActionConnection) PageInfo(ctx context.Context) (*graphqlutil.PageInfo, error)
```

### <a id="action" href="#action">type action struct</a>

```
searchKey: resolvers.action
```

```Go
type action struct {
	email graphqlbackend.MonitorEmailResolver
}
```

Action <<UNION>> 

#### <a id="action.ToMonitorEmail" href="#action.ToMonitorEmail">func (a *action) ToMonitorEmail() (graphqlbackend.MonitorEmailResolver, bool)</a>

```
searchKey: resolvers.action.ToMonitorEmail
```

```Go
func (a *action) ToMonitorEmail() (graphqlbackend.MonitorEmailResolver, bool)
```

### <a id="monitorEmail" href="#monitorEmail">type monitorEmail struct</a>

```
searchKey: resolvers.monitorEmail
```

```Go
type monitorEmail struct {
	*Resolver
	*cm.MonitorEmail

	// If triggerEventID == nil, all events of this action will be returned.
	// Otherwise, only those events of this action which are related to the specified
	// trigger event will be returned.
	triggerEventID *int
}
```

Email 

#### <a id="monitorEmail.Recipients" href="#monitorEmail.Recipients">func (m *monitorEmail) Recipients(ctx context.Context, args *graphqlbackend.ListRecipientsArgs) (c graphqlbackend.MonitorActionEmailRecipientsConnectionResolver, err error)</a>

```
searchKey: resolvers.monitorEmail.Recipients
```

```Go
func (m *monitorEmail) Recipients(ctx context.Context, args *graphqlbackend.ListRecipientsArgs) (c graphqlbackend.MonitorActionEmailRecipientsConnectionResolver, err error)
```

#### <a id="monitorEmail.Enabled" href="#monitorEmail.Enabled">func (m *monitorEmail) Enabled() bool</a>

```
searchKey: resolvers.monitorEmail.Enabled
```

```Go
func (m *monitorEmail) Enabled() bool
```

#### <a id="monitorEmail.Priority" href="#monitorEmail.Priority">func (m *monitorEmail) Priority() string</a>

```
searchKey: resolvers.monitorEmail.Priority
```

```Go
func (m *monitorEmail) Priority() string
```

#### <a id="monitorEmail.Header" href="#monitorEmail.Header">func (m *monitorEmail) Header() string</a>

```
searchKey: resolvers.monitorEmail.Header
```

```Go
func (m *monitorEmail) Header() string
```

#### <a id="monitorEmail.ID" href="#monitorEmail.ID">func (m *monitorEmail) ID() graphql.ID</a>

```
searchKey: resolvers.monitorEmail.ID
```

```Go
func (m *monitorEmail) ID() graphql.ID
```

#### <a id="monitorEmail.Events" href="#monitorEmail.Events">func (m *monitorEmail) Events(ctx context.Context, args *graphqlbackend.ListEventsArgs) (graphqlbackend.MonitorActionEventConnectionResolver, error)</a>

```
searchKey: resolvers.monitorEmail.Events
```

```Go
func (m *monitorEmail) Events(ctx context.Context, args *graphqlbackend.ListEventsArgs) (graphqlbackend.MonitorActionEventConnectionResolver, error)
```

### <a id="monitorActionEmailRecipientsConnection" href="#monitorActionEmailRecipientsConnection">type monitorActionEmailRecipientsConnection struct</a>

```
searchKey: resolvers.monitorActionEmailRecipientsConnection
```

```Go
type monitorActionEmailRecipientsConnection struct {
	recipients     []graphqlbackend.NamespaceResolver
	nextPageCursor string
	totalCount     int32
}
```

MonitorActionEmailRecipientConnection 

#### <a id="monitorActionEmailRecipientsConnection.Nodes" href="#monitorActionEmailRecipientsConnection.Nodes">func (a *monitorActionEmailRecipientsConnection) Nodes(ctx context.Context) ([]graphqlbackend.NamespaceResolver, error)</a>

```
searchKey: resolvers.monitorActionEmailRecipientsConnection.Nodes
```

```Go
func (a *monitorActionEmailRecipientsConnection) Nodes(ctx context.Context) ([]graphqlbackend.NamespaceResolver, error)
```

#### <a id="monitorActionEmailRecipientsConnection.TotalCount" href="#monitorActionEmailRecipientsConnection.TotalCount">func (a *monitorActionEmailRecipientsConnection) TotalCount(ctx context.Context) (int32, error)</a>

```
searchKey: resolvers.monitorActionEmailRecipientsConnection.TotalCount
```

```Go
func (a *monitorActionEmailRecipientsConnection) TotalCount(ctx context.Context) (int32, error)
```

#### <a id="monitorActionEmailRecipientsConnection.PageInfo" href="#monitorActionEmailRecipientsConnection.PageInfo">func (a *monitorActionEmailRecipientsConnection) PageInfo(ctx context.Context) (*graphqlutil.PageInfo, error)</a>

```
searchKey: resolvers.monitorActionEmailRecipientsConnection.PageInfo
```

```Go
func (a *monitorActionEmailRecipientsConnection) PageInfo(ctx context.Context) (*graphqlutil.PageInfo, error)
```

### <a id="monitorActionEventConnection" href="#monitorActionEventConnection">type monitorActionEventConnection struct</a>

```
searchKey: resolvers.monitorActionEventConnection
```

```Go
type monitorActionEventConnection struct {
	events     []graphqlbackend.MonitorActionEventResolver
	totalCount int32
}
```

MonitorActionEventConnection 

#### <a id="monitorActionEventConnection.Nodes" href="#monitorActionEventConnection.Nodes">func (a *monitorActionEventConnection) Nodes(ctx context.Context) ([]graphqlbackend.MonitorActionEventResolver, error)</a>

```
searchKey: resolvers.monitorActionEventConnection.Nodes
```

```Go
func (a *monitorActionEventConnection) Nodes(ctx context.Context) ([]graphqlbackend.MonitorActionEventResolver, error)
```

#### <a id="monitorActionEventConnection.TotalCount" href="#monitorActionEventConnection.TotalCount">func (a *monitorActionEventConnection) TotalCount(ctx context.Context) (int32, error)</a>

```
searchKey: resolvers.monitorActionEventConnection.TotalCount
```

```Go
func (a *monitorActionEventConnection) TotalCount(ctx context.Context) (int32, error)
```

#### <a id="monitorActionEventConnection.PageInfo" href="#monitorActionEventConnection.PageInfo">func (a *monitorActionEventConnection) PageInfo(ctx context.Context) (*graphqlutil.PageInfo, error)</a>

```
searchKey: resolvers.monitorActionEventConnection.PageInfo
```

```Go
func (a *monitorActionEventConnection) PageInfo(ctx context.Context) (*graphqlutil.PageInfo, error)
```

### <a id="monitorActionEvent" href="#monitorActionEvent">type monitorActionEvent struct</a>

```
searchKey: resolvers.monitorActionEvent
```

```Go
type monitorActionEvent struct {
	*Resolver
	*cm.ActionJob
}
```

MonitorEvent 

#### <a id="monitorActionEvent.ID" href="#monitorActionEvent.ID">func (m *monitorActionEvent) ID() graphql.ID</a>

```
searchKey: resolvers.monitorActionEvent.ID
```

```Go
func (m *monitorActionEvent) ID() graphql.ID
```

#### <a id="monitorActionEvent.Status" href="#monitorActionEvent.Status">func (m *monitorActionEvent) Status() (string, error)</a>

```
searchKey: resolvers.monitorActionEvent.Status
```

```Go
func (m *monitorActionEvent) Status() (string, error)
```

#### <a id="monitorActionEvent.Message" href="#monitorActionEvent.Message">func (m *monitorActionEvent) Message() *string</a>

```
searchKey: resolvers.monitorActionEvent.Message
```

```Go
func (m *monitorActionEvent) Message() *string
```

#### <a id="monitorActionEvent.Timestamp" href="#monitorActionEvent.Timestamp">func (m *monitorActionEvent) Timestamp() graphqlbackend.DateTime</a>

```
searchKey: resolvers.monitorActionEvent.Timestamp
```

```Go
func (m *monitorActionEvent) Timestamp() graphqlbackend.DateTime
```

### <a id="Option" href="#Option">type Option interface</a>

```
searchKey: resolvers.Option
```

```Go
type Option interface {
	apply(*options)
}
```

#### <a id="WithActions" href="#WithActions">func WithActions(actions []*graphqlbackend.CreateActionArgs) Option</a>

```
searchKey: resolvers.WithActions
```

```Go
func WithActions(actions []*graphqlbackend.CreateActionArgs) Option
```

#### <a id="WithOwner" href="#WithOwner">func WithOwner(owner graphql.ID) Option</a>

```
searchKey: resolvers.WithOwner
```

```Go
func WithOwner(owner graphql.ID) Option
```

#### <a id="WithPostHooks" href="#WithPostHooks">func WithPostHooks(hooks []hook) Option</a>

```
searchKey: resolvers.WithPostHooks
```

```Go
func WithPostHooks(hooks []hook) Option
```

### <a id="hook" href="#hook">type hook func() error</a>

```
searchKey: resolvers.hook
```

```Go
type hook func() error
```

### <a id="options" href="#options">type options struct</a>

```
searchKey: resolvers.options
```

```Go
type options struct {
	actions   []*graphqlbackend.CreateActionArgs
	owner     graphql.ID
	postHooks []hook
}
```

### <a id="actionOption" href="#actionOption">type actionOption struct</a>

```
searchKey: resolvers.actionOption
```

```Go
type actionOption struct {
	actions []*graphqlbackend.CreateActionArgs
}
```

#### <a id="actionOption.apply" href="#actionOption.apply">func (a actionOption) apply(opts *options)</a>

```
searchKey: resolvers.actionOption.apply
```

```Go
func (a actionOption) apply(opts *options)
```

### <a id="ownerOption" href="#ownerOption">type ownerOption struct</a>

```
searchKey: resolvers.ownerOption
```

```Go
type ownerOption struct {
	owner graphql.ID
}
```

#### <a id="ownerOption.apply" href="#ownerOption.apply">func (o ownerOption) apply(opts *options)</a>

```
searchKey: resolvers.ownerOption.apply
```

```Go
func (o ownerOption) apply(opts *options)
```

### <a id="postHookOption" href="#postHookOption">type postHookOption struct</a>

```
searchKey: resolvers.postHookOption
```

```Go
type postHookOption struct {
	hooks []hook
}
```

#### <a id="postHookOption.apply" href="#postHookOption.apply">func (h postHookOption) apply(opts *options)</a>

```
searchKey: resolvers.postHookOption.apply
```

```Go
func (h postHookOption) apply(opts *options)
```

### <a id="testUser" href="#testUser">type testUser struct</a>

```
searchKey: resolvers.testUser
```

```Go
type testUser struct {
	name    string
	idInt32 int32
}
```

#### <a id="testUser.id" href="#testUser.id">func (u *testUser) id() graphql.ID</a>

```
searchKey: resolvers.testUser.id
```

```Go
func (u *testUser) id() graphql.ID
```

## <a id="func" href="#func">Functions</a>

### <a id="NewResolver" href="#NewResolver">func NewResolver(db dbutil.DB) graphqlbackend.CodeMonitorsResolver</a>

```
searchKey: resolvers.NewResolver
tags: [exported]
```

```Go
func NewResolver(db dbutil.DB) graphqlbackend.CodeMonitorsResolver
```

NewResolver returns a new Resolver that uses the given database 

### <a id="newResolverWithClock" href="#newResolverWithClock">func newResolverWithClock(db dbutil.DB, clock func() time.Time) graphqlbackend.CodeMonitorsResolver</a>

```
searchKey: resolvers.newResolverWithClock
```

```Go
func newResolverWithClock(db dbutil.DB, clock func() time.Time) graphqlbackend.CodeMonitorsResolver
```

newResolverWithClock is used in tests to set the clock manually. 

### <a id="sendTestEmail" href="#sendTestEmail">func sendTestEmail(ctx context.Context, recipient graphql.ID, description string) error</a>

```
searchKey: resolvers.sendTestEmail
```

```Go
func sendTestEmail(ctx context.Context, recipient graphql.ID, description string) error
```

### <a id="splitActionIDs" href="#splitActionIDs">func splitActionIDs(ctx context.Context, args *graphqlbackend.UpdateCodeMonitorArgs, actionIDs []graphql.ID) (toCreate []*graphqlbackend.CreateActionArgs, toDelete []int64, err error)</a>

```
searchKey: resolvers.splitActionIDs
```

```Go
func splitActionIDs(ctx context.Context, args *graphqlbackend.UpdateCodeMonitorArgs, actionIDs []graphql.ID) (toCreate []*graphqlbackend.CreateActionArgs, toDelete []int64, err error)
```

splitActionIDs splits actions into three buckets: create, delete and update. Note: args is mutated. After splitActionIDs, args only contains actions to be updated. 

### <a id="ownerForID64Query" href="#ownerForID64Query">func ownerForID64Query(ctx context.Context, monitorID int64) (*sqlf.Query, error)</a>

```
searchKey: resolvers.ownerForID64Query
```

```Go
func ownerForID64Query(ctx context.Context, monitorID int64) (*sqlf.Query, error)
```

### <a id="insertTestUser" href="#insertTestUser">func insertTestUser(t *testing.T, db *sql.DB, name string, isAdmin bool) (userID int32)</a>

```
searchKey: resolvers.insertTestUser
```

```Go
func insertTestUser(t *testing.T, db *sql.DB, name string, isAdmin bool) (userID int32)
```

### <a id="addUserToOrg" href="#addUserToOrg">func addUserToOrg(t *testing.T, db *sql.DB, userID int32, orgID int32)</a>

```
searchKey: resolvers.addUserToOrg
```

```Go
func addUserToOrg(t *testing.T, db *sql.DB, userID int32, orgID int32)
```

### <a id="marshalDateTime" href="#marshalDateTime">func marshalDateTime(t testing.TB, ts time.Time) string</a>

```
searchKey: resolvers.marshalDateTime
```

```Go
func marshalDateTime(t testing.TB, ts time.Time) string
```

### <a id="init" href="#init">func init()</a>

```
searchKey: resolvers.init
```

```Go
func init()
```

### <a id="TestCreateCodeMonitor" href="#TestCreateCodeMonitor">func TestCreateCodeMonitor(t *testing.T)</a>

```
searchKey: resolvers.TestCreateCodeMonitor
```

```Go
func TestCreateCodeMonitor(t *testing.T)
```

### <a id="TestListCodeMonitors" href="#TestListCodeMonitors">func TestListCodeMonitors(t *testing.T)</a>

```
searchKey: resolvers.TestListCodeMonitors
```

```Go
func TestListCodeMonitors(t *testing.T)
```

### <a id="requireNodeCount" href="#requireNodeCount">func requireNodeCount(t *testing.T, r graphqlbackend.MonitorConnectionResolver, c int)</a>

```
searchKey: resolvers.requireNodeCount
```

```Go
func requireNodeCount(t *testing.T, r graphqlbackend.MonitorConnectionResolver, c int)
```

### <a id="requireHasNextPage" href="#requireHasNextPage">func requireHasNextPage(t *testing.T, r graphqlbackend.MonitorConnectionResolver, hasNextPage bool)</a>

```
searchKey: resolvers.requireHasNextPage
```

```Go
func requireHasNextPage(t *testing.T, r graphqlbackend.MonitorConnectionResolver, hasNextPage bool)
```

### <a id="TestIsAllowedToEdit" href="#TestIsAllowedToEdit">func TestIsAllowedToEdit(t *testing.T)</a>

```
searchKey: resolvers.TestIsAllowedToEdit
```

```Go
func TestIsAllowedToEdit(t *testing.T)
```

### <a id="TestIsAllowedToCreate" href="#TestIsAllowedToCreate">func TestIsAllowedToCreate(t *testing.T)</a>

```
searchKey: resolvers.TestIsAllowedToCreate
```

```Go
func TestIsAllowedToCreate(t *testing.T)
```

### <a id="TestQueryMonitor" href="#TestQueryMonitor">func TestQueryMonitor(t *testing.T)</a>

```
searchKey: resolvers.TestQueryMonitor
```

```Go
func TestQueryMonitor(t *testing.T)
```

### <a id="queryByUser" href="#queryByUser">func queryByUser(ctx context.Context, t *testing.T, schema *graphql.Schema, r *Resolver, user1 *testUser, user2 *testUser)</a>

```
searchKey: resolvers.queryByUser
```

```Go
func queryByUser(ctx context.Context, t *testing.T, schema *graphql.Schema, r *Resolver, user1 *testUser, user2 *testUser)
```

### <a id="TestEditCodeMonitor" href="#TestEditCodeMonitor">func TestEditCodeMonitor(t *testing.T)</a>

```
searchKey: resolvers.TestEditCodeMonitor
```

```Go
func TestEditCodeMonitor(t *testing.T)
```

### <a id="recipientPaging" href="#recipientPaging">func recipientPaging(ctx context.Context, t *testing.T, schema *graphql.Schema, user1 *testUser, user2 *testUser)</a>

```
searchKey: resolvers.recipientPaging
```

```Go
func recipientPaging(ctx context.Context, t *testing.T, schema *graphql.Schema, user1 *testUser, user2 *testUser)
```

### <a id="queryByID" href="#queryByID">func queryByID(ctx context.Context, t *testing.T, schema *graphql.Schema, r *Resolver, m *monitor, user1 *testUser, user2 *testUser)</a>

```
searchKey: resolvers.queryByID
```

```Go
func queryByID(ctx context.Context, t *testing.T, schema *graphql.Schema, r *Resolver, m *monitor, user1 *testUser, user2 *testUser)
```

### <a id="monitorPaging" href="#monitorPaging">func monitorPaging(ctx context.Context, t *testing.T, schema *graphql.Schema, user1 *testUser)</a>

```
searchKey: resolvers.monitorPaging
```

```Go
func monitorPaging(ctx context.Context, t *testing.T, schema *graphql.Schema, user1 *testUser)
```

### <a id="actionPaging" href="#actionPaging">func actionPaging(ctx context.Context, t *testing.T, schema *graphql.Schema, user1 *testUser)</a>

```
searchKey: resolvers.actionPaging
```

```Go
func actionPaging(ctx context.Context, t *testing.T, schema *graphql.Schema, user1 *testUser)
```

### <a id="triggerEventPaging" href="#triggerEventPaging">func triggerEventPaging(ctx context.Context, t *testing.T, schema *graphql.Schema, user1 *testUser)</a>

```
searchKey: resolvers.triggerEventPaging
```

```Go
func triggerEventPaging(ctx context.Context, t *testing.T, schema *graphql.Schema, user1 *testUser)
```

### <a id="actionEventPaging" href="#actionEventPaging">func actionEventPaging(ctx context.Context, t *testing.T, schema *graphql.Schema, user1 *testUser)</a>

```
searchKey: resolvers.actionEventPaging
```

```Go
func actionEventPaging(ctx context.Context, t *testing.T, schema *graphql.Schema, user1 *testUser)
```

### <a id="TestTriggerTestEmailAction" href="#TestTriggerTestEmailAction">func TestTriggerTestEmailAction(t *testing.T)</a>

```
searchKey: resolvers.TestTriggerTestEmailAction
```

```Go
func TestTriggerTestEmailAction(t *testing.T)
```

### <a id="TestMonitorKindEqualsResolvers" href="#TestMonitorKindEqualsResolvers">func TestMonitorKindEqualsResolvers(t *testing.T)</a>

```
searchKey: resolvers.TestMonitorKindEqualsResolvers
```

```Go
func TestMonitorKindEqualsResolvers(t *testing.T)
```

