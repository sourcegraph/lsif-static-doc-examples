# Package storetest

## Index

* [Constants](#const)
    * [const ActionJobs](#ActionJobs)
    * [const Completed](#Completed)
    * [const Errored](#Errored)
    * [const Failed](#Failed)
    * [const Processing](#Processing)
    * [const Queued](#Queued)
    * [const TriggerJobs](#TriggerJobs)
    * [const setStatusFmtStr](#setStatusFmtStr)
    * [const testDescription](#testDescription)
    * [const testQuery](#testQuery)
* [Types](#type)
    * [type JobState int](#JobState)
    * [type JobTable int](#JobTable)
    * [type TestStore struct](#TestStore)
        * [func NewTestStoreWithStore(t *testing.T, store *codemonitors.Store) (context.Context, *TestStore)](#NewTestStoreWithStore)
        * [func (s *TestStore) InsertTestMonitor(ctx context.Context, t *testing.T) (*codemonitors.Monitor, error)](#TestStore.InsertTestMonitor)
        * [func (s *TestStore) SetJobStatus(ctx context.Context, table JobTable, state JobState, id int) error](#TestStore.SetJobStatus)
* [Functions](#func)
    * [func NewTestUser(ctx context.Context, t *testing.T) (name string, id int32, namespace graphql.ID, userContext context.Context)](#NewTestUser)
    * [func init()](#init.monitor_creator.go)
    * [func insertTestUser(t *testing.T, db *sql.DB, name string, isAdmin bool) (userID int32)](#insertTestUser)
    * [func quote(s string) *sqlf.Query](#quote)


## <a id="const" href="#const">Constants</a>

```
tags: [package private]
```

### <a id="ActionJobs" href="#ActionJobs">const ActionJobs</a>

```
searchKey: storetest.ActionJobs
tags: [constant number]
```

```Go
const ActionJobs
```

### <a id="Completed" href="#Completed">const Completed</a>

```
searchKey: storetest.Completed
tags: [constant number]
```

```Go
const Completed
```

### <a id="Errored" href="#Errored">const Errored</a>

```
searchKey: storetest.Errored
tags: [constant number]
```

```Go
const Errored
```

### <a id="Failed" href="#Failed">const Failed</a>

```
searchKey: storetest.Failed
tags: [constant number]
```

```Go
const Failed
```

### <a id="Processing" href="#Processing">const Processing</a>

```
searchKey: storetest.Processing
tags: [constant number]
```

```Go
const Processing
```

### <a id="Queued" href="#Queued">const Queued</a>

```
searchKey: storetest.Queued
tags: [constant number]
```

```Go
const Queued JobState = iota
```

### <a id="TriggerJobs" href="#TriggerJobs">const TriggerJobs</a>

```
searchKey: storetest.TriggerJobs
tags: [constant number]
```

```Go
const TriggerJobs JobTable = iota
```

### <a id="setStatusFmtStr" href="#setStatusFmtStr">const setStatusFmtStr</a>

```
searchKey: storetest.setStatusFmtStr
tags: [constant string private]
```

```Go
const setStatusFmtStr = ...
```

### <a id="testDescription" href="#testDescription">const testDescription</a>

```
searchKey: storetest.testDescription
tags: [constant string private]
```

```Go
const testDescription = "test description"
```

### <a id="testQuery" href="#testQuery">const testQuery</a>

```
searchKey: storetest.testQuery
tags: [constant string private]
```

```Go
const testQuery = "repo:github\\.com/sourcegraph/sourcegraph func type:diff patternType:literal"
```

## <a id="type" href="#type">Types</a>

```
tags: [package private]
```

### <a id="JobState" href="#JobState">type JobState int</a>

```
searchKey: storetest.JobState
tags: [number]
```

```Go
type JobState int
```

### <a id="JobTable" href="#JobTable">type JobTable int</a>

```
searchKey: storetest.JobTable
tags: [number]
```

```Go
type JobTable int
```

### <a id="TestStore" href="#TestStore">type TestStore struct</a>

```
searchKey: storetest.TestStore
tags: [struct]
```

```Go
type TestStore struct {
	*codemonitors.Store
}
```

#### <a id="NewTestStoreWithStore" href="#NewTestStoreWithStore">func NewTestStoreWithStore(t *testing.T, store *codemonitors.Store) (context.Context, *TestStore)</a>

```
searchKey: storetest.NewTestStoreWithStore
tags: [method]
```

```Go
func NewTestStoreWithStore(t *testing.T, store *codemonitors.Store) (context.Context, *TestStore)
```

#### <a id="TestStore.InsertTestMonitor" href="#TestStore.InsertTestMonitor">func (s *TestStore) InsertTestMonitor(ctx context.Context, t *testing.T) (*codemonitors.Monitor, error)</a>

```
searchKey: storetest.TestStore.InsertTestMonitor
tags: [method]
```

```Go
func (s *TestStore) InsertTestMonitor(ctx context.Context, t *testing.T) (*codemonitors.Monitor, error)
```

#### <a id="TestStore.SetJobStatus" href="#TestStore.SetJobStatus">func (s *TestStore) SetJobStatus(ctx context.Context, table JobTable, state JobState, id int) error</a>

```
searchKey: storetest.TestStore.SetJobStatus
tags: [method]
```

```Go
func (s *TestStore) SetJobStatus(ctx context.Context, table JobTable, state JobState, id int) error
```

## <a id="func" href="#func">Functions</a>

```
tags: [package private]
```

### <a id="NewTestUser" href="#NewTestUser">func NewTestUser(ctx context.Context, t *testing.T) (name string, id int32, namespace graphql.ID, userContext context.Context)</a>

```
searchKey: storetest.NewTestUser
tags: [method]
```

```Go
func NewTestUser(ctx context.Context, t *testing.T) (name string, id int32, namespace graphql.ID, userContext context.Context)
```

### <a id="init.monitor_creator.go" href="#init.monitor_creator.go">func init()</a>

```
searchKey: storetest.init
tags: [function private]
```

```Go
func init()
```

### <a id="insertTestUser" href="#insertTestUser">func insertTestUser(t *testing.T, db *sql.DB, name string, isAdmin bool) (userID int32)</a>

```
searchKey: storetest.insertTestUser
tags: [method private]
```

```Go
func insertTestUser(t *testing.T, db *sql.DB, name string, isAdmin bool) (userID int32)
```

### <a id="quote" href="#quote">func quote(s string) *sqlf.Query</a>

```
searchKey: storetest.quote
tags: [method private]
```

```Go
func quote(s string) *sqlf.Query
```

quote wraps the given string in a *sqlf.Query so that it is not passed to the database as a parameter. It is necessary to quote things such as table names, columns, and other expressions that are not simple values. 

