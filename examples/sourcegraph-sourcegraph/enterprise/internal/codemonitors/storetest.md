# Package storetest

## Index

* [Constants](#const)
    * [const TriggerJobs](#TriggerJobs)
    * [const ActionJobs](#ActionJobs)
    * [const Queued](#Queued)
    * [const Processing](#Processing)
    * [const Completed](#Completed)
    * [const Errored](#Errored)
    * [const Failed](#Failed)
    * [const setStatusFmtStr](#setStatusFmtStr)
    * [const testQuery](#testQuery)
    * [const testDescription](#testDescription)
* [Types](#type)
    * [type JobTable int](#JobTable)
    * [type JobState int](#JobState)
    * [type TestStore struct](#TestStore)
        * [func NewTestStoreWithStore(t *testing.T, store *codemonitors.Store) (context.Context, *TestStore)](#NewTestStoreWithStore)
        * [func (s *TestStore) SetJobStatus(ctx context.Context, table JobTable, state JobState, id int) error](#TestStore.SetJobStatus)
        * [func (s *TestStore) InsertTestMonitor(ctx context.Context, t *testing.T) (*codemonitors.Monitor, error)](#TestStore.InsertTestMonitor)
* [Functions](#func)
    * [func quote(s string) *sqlf.Query](#quote)
    * [func init()](#init)
    * [func NewTestUser(ctx context.Context, t *testing.T) (name string, id int32, namespace graphql.ID, userContext context.Context)](#NewTestUser)
    * [func insertTestUser(t *testing.T, db *sql.DB, name string, isAdmin bool) (userID int32)](#insertTestUser)


## <a id="const" href="#const">Constants</a>

### <a id="TriggerJobs" href="#TriggerJobs">const TriggerJobs</a>

```
searchKey: storetest.TriggerJobs
tags: [exported]
```

```Go
const TriggerJobs JobTable = iota
```

### <a id="ActionJobs" href="#ActionJobs">const ActionJobs</a>

```
searchKey: storetest.ActionJobs
tags: [exported]
```

```Go
const ActionJobs
```

### <a id="Queued" href="#Queued">const Queued</a>

```
searchKey: storetest.Queued
tags: [exported]
```

```Go
const Queued JobState = iota
```

### <a id="Processing" href="#Processing">const Processing</a>

```
searchKey: storetest.Processing
tags: [exported]
```

```Go
const Processing
```

### <a id="Completed" href="#Completed">const Completed</a>

```
searchKey: storetest.Completed
tags: [exported]
```

```Go
const Completed
```

### <a id="Errored" href="#Errored">const Errored</a>

```
searchKey: storetest.Errored
tags: [exported]
```

```Go
const Errored
```

### <a id="Failed" href="#Failed">const Failed</a>

```
searchKey: storetest.Failed
tags: [exported]
```

```Go
const Failed
```

### <a id="setStatusFmtStr" href="#setStatusFmtStr">const setStatusFmtStr</a>

```
searchKey: storetest.setStatusFmtStr
```

```Go
const setStatusFmtStr = ...
```

### <a id="testQuery" href="#testQuery">const testQuery</a>

```
searchKey: storetest.testQuery
```

```Go
const testQuery = "repo:github\\.com/sourcegraph/sourcegraph func type:diff patternType:literal"
```

### <a id="testDescription" href="#testDescription">const testDescription</a>

```
searchKey: storetest.testDescription
```

```Go
const testDescription = "test description"
```

## <a id="type" href="#type">Types</a>

### <a id="JobTable" href="#JobTable">type JobTable int</a>

```
searchKey: storetest.JobTable
tags: [exported]
```

```Go
type JobTable int
```

### <a id="JobState" href="#JobState">type JobState int</a>

```
searchKey: storetest.JobState
tags: [exported]
```

```Go
type JobState int
```

### <a id="TestStore" href="#TestStore">type TestStore struct</a>

```
searchKey: storetest.TestStore
tags: [exported]
```

```Go
type TestStore struct {
	*codemonitors.Store
}
```

#### <a id="NewTestStoreWithStore" href="#NewTestStoreWithStore">func NewTestStoreWithStore(t *testing.T, store *codemonitors.Store) (context.Context, *TestStore)</a>

```
searchKey: storetest.NewTestStoreWithStore
tags: [exported]
```

```Go
func NewTestStoreWithStore(t *testing.T, store *codemonitors.Store) (context.Context, *TestStore)
```

#### <a id="TestStore.SetJobStatus" href="#TestStore.SetJobStatus">func (s *TestStore) SetJobStatus(ctx context.Context, table JobTable, state JobState, id int) error</a>

```
searchKey: storetest.TestStore.SetJobStatus
tags: [exported]
```

```Go
func (s *TestStore) SetJobStatus(ctx context.Context, table JobTable, state JobState, id int) error
```

#### <a id="TestStore.InsertTestMonitor" href="#TestStore.InsertTestMonitor">func (s *TestStore) InsertTestMonitor(ctx context.Context, t *testing.T) (*codemonitors.Monitor, error)</a>

```
searchKey: storetest.TestStore.InsertTestMonitor
tags: [exported]
```

```Go
func (s *TestStore) InsertTestMonitor(ctx context.Context, t *testing.T) (*codemonitors.Monitor, error)
```

## <a id="func" href="#func">Functions</a>

### <a id="quote" href="#quote">func quote(s string) *sqlf.Query</a>

```
searchKey: storetest.quote
```

```Go
func quote(s string) *sqlf.Query
```

quote wraps the given string in a *sqlf.Query so that it is not passed to the database as a parameter. It is necessary to quote things such as table names, columns, and other expressions that are not simple values. 

### <a id="init" href="#init">func init()</a>

```
searchKey: storetest.init
```

```Go
func init()
```

### <a id="NewTestUser" href="#NewTestUser">func NewTestUser(ctx context.Context, t *testing.T) (name string, id int32, namespace graphql.ID, userContext context.Context)</a>

```
searchKey: storetest.NewTestUser
tags: [exported]
```

```Go
func NewTestUser(ctx context.Context, t *testing.T) (name string, id int32, namespace graphql.ID, userContext context.Context)
```

### <a id="insertTestUser" href="#insertTestUser">func insertTestUser(t *testing.T, db *sql.DB, name string, isAdmin bool) (userID int32)</a>

```
searchKey: storetest.insertTestUser
```

```Go
func insertTestUser(t *testing.T, db *sql.DB, name string, isAdmin bool) (userID int32)
```

