# Package migration

## Index

* [Constants](#const)
    * [const committedAtProgressQuery](#committedAtProgressQuery)
    * [const committedAtSelectUpQuery](#committedAtSelectUpQuery)
    * [const committedAtProcesshandleCommitQuery](#committedAtProcesshandleCommitQuery)
    * [const committedAtDownQuery](#committedAtDownQuery)
    * [const CommittedAtMigrationID](#CommittedAtMigrationID)
* [Types](#type)
    * [type committedAtMigrator struct](#committedAtMigrator)
        * [func (m *committedAtMigrator) Progress(ctx context.Context) (float64, error)](#committedAtMigrator.Progress)
        * [func (m *committedAtMigrator) Up(ctx context.Context) (err error)](#committedAtMigrator.Up)
        * [func (m *committedAtMigrator) handleSourcedCommits(ctx context.Context, tx *dbstore.Store, sourcedCommits dbstore.SourcedCommits) error](#committedAtMigrator.handleSourcedCommits)
        * [func (m *committedAtMigrator) handleCommit(ctx context.Context, tx *dbstore.Store, repositoryID int, repositoryName, commit string) error](#committedAtMigrator.handleCommit)
        * [func (m *committedAtMigrator) Down(ctx context.Context) error](#committedAtMigrator.Down)
    * [type GitserverClient interface](#GitserverClient)
    * [type MockGitserverClient struct](#MockGitserverClient)
        * [func NewMockGitserverClient() *MockGitserverClient](#NewMockGitserverClient)
        * [func NewMockGitserverClientFrom(i GitserverClient) *MockGitserverClient](#NewMockGitserverClientFrom)
        * [func (m *MockGitserverClient) CommitDate(v0 context.Context, v1 int, v2 string) (time.Time, error)](#MockGitserverClient.CommitDate)
    * [type GitserverClientCommitDateFunc struct](#GitserverClientCommitDateFunc)
        * [func (f *GitserverClientCommitDateFunc) SetDefaultHook(hook func(context.Context, int, string) (time.Time, error))](#GitserverClientCommitDateFunc.SetDefaultHook)
        * [func (f *GitserverClientCommitDateFunc) PushHook(hook func(context.Context, int, string) (time.Time, error))](#GitserverClientCommitDateFunc.PushHook)
        * [func (f *GitserverClientCommitDateFunc) SetDefaultReturn(r0 time.Time, r1 error)](#GitserverClientCommitDateFunc.SetDefaultReturn)
        * [func (f *GitserverClientCommitDateFunc) PushReturn(r0 time.Time, r1 error)](#GitserverClientCommitDateFunc.PushReturn)
        * [func (f *GitserverClientCommitDateFunc) nextHook() func(context.Context, int, string) (time.Time, error)](#GitserverClientCommitDateFunc.nextHook)
        * [func (f *GitserverClientCommitDateFunc) appendCall(r0 GitserverClientCommitDateFuncCall)](#GitserverClientCommitDateFunc.appendCall)
        * [func (f *GitserverClientCommitDateFunc) History() []GitserverClientCommitDateFuncCall](#GitserverClientCommitDateFunc.History)
    * [type GitserverClientCommitDateFuncCall struct](#GitserverClientCommitDateFuncCall)
        * [func (c GitserverClientCommitDateFuncCall) Args() []interface{}](#GitserverClientCommitDateFuncCall.Args)
        * [func (c GitserverClientCommitDateFuncCall) Results() []interface{}](#GitserverClientCommitDateFuncCall.Results)
* [Functions](#func)
    * [func NewCommittedAtMigrator(store *dbstore.Store, gitserverClient GitserverClient, batchSize int) oobmigration.Migrator](#NewCommittedAtMigrator)
    * [func isRepositoryNotFound(err error) bool](#isRepositoryNotFound)
    * [func isRevisionNotFound(err error) bool](#isRevisionNotFound)
    * [func TestCommittedAtMigrator(t *testing.T)](#TestCommittedAtMigrator)
    * [func TestCommittedAtMigratorUnknownRepository(t *testing.T)](#TestCommittedAtMigratorUnknownRepository)
    * [func TestCommittedAtMigratorUnknownCommits(t *testing.T)](#TestCommittedAtMigratorUnknownCommits)
    * [func init()](#init.migration_test.go)


## <a id="const" href="#const">Constants</a>

```
tags: [private]
```

### <a id="committedAtProgressQuery" href="#committedAtProgressQuery">const committedAtProgressQuery</a>

```
searchKey: migration.committedAtProgressQuery
tags: [private]
```

```Go
const committedAtProgressQuery = ...
```

### <a id="committedAtSelectUpQuery" href="#committedAtSelectUpQuery">const committedAtSelectUpQuery</a>

```
searchKey: migration.committedAtSelectUpQuery
tags: [private]
```

```Go
const committedAtSelectUpQuery = ...
```

### <a id="committedAtProcesshandleCommitQuery" href="#committedAtProcesshandleCommitQuery">const committedAtProcesshandleCommitQuery</a>

```
searchKey: migration.committedAtProcesshandleCommitQuery
tags: [private]
```

```Go
const committedAtProcesshandleCommitQuery = ...
```

### <a id="committedAtDownQuery" href="#committedAtDownQuery">const committedAtDownQuery</a>

```
searchKey: migration.committedAtDownQuery
tags: [private]
```

```Go
const committedAtDownQuery = ...
```

### <a id="CommittedAtMigrationID" href="#CommittedAtMigrationID">const CommittedAtMigrationID</a>

```
searchKey: migration.CommittedAtMigrationID
```

```Go
const CommittedAtMigrationID = 8
```

CommittedAtMigrationID is the primary key of the migration record handled by an instance of committedAtMigrator. This is associated with the out-of-band migration record inserted in the file migrations/frontend/1528395817_lsif_uploads_committed_at.up.sql. 

## <a id="type" href="#type">Types</a>

```
tags: [private]
```

### <a id="committedAtMigrator" href="#committedAtMigrator">type committedAtMigrator struct</a>

```
searchKey: migration.committedAtMigrator
tags: [private]
```

```Go
type committedAtMigrator struct {
	store           *dbstore.Store
	gitserverClient GitserverClient
	batchSize       int
}
```

#### <a id="committedAtMigrator.Progress" href="#committedAtMigrator.Progress">func (m *committedAtMigrator) Progress(ctx context.Context) (float64, error)</a>

```
searchKey: migration.committedAtMigrator.Progress
tags: [private]
```

```Go
func (m *committedAtMigrator) Progress(ctx context.Context) (float64, error)
```

Progress returns the ratio between the number of upload records that have been completely migrated over the total number of upload records. This simply counts the number of completed upload records with and without a value for committed_at. 

#### <a id="committedAtMigrator.Up" href="#committedAtMigrator.Up">func (m *committedAtMigrator) Up(ctx context.Context) (err error)</a>

```
searchKey: migration.committedAtMigrator.Up
tags: [private]
```

```Go
func (m *committedAtMigrator) Up(ctx context.Context) (err error)
```

Up runs a batch of the migration. This method selects a batch of unique repository and commit pairs, then sets the committed_at field for all matching uploads. In this sense, the batch size controls the maximum number of gitserver requests, not the number of records updated. 

#### <a id="committedAtMigrator.handleSourcedCommits" href="#committedAtMigrator.handleSourcedCommits">func (m *committedAtMigrator) handleSourcedCommits(ctx context.Context, tx *dbstore.Store, sourcedCommits dbstore.SourcedCommits) error</a>

```
searchKey: migration.committedAtMigrator.handleSourcedCommits
tags: [private]
```

```Go
func (m *committedAtMigrator) handleSourcedCommits(ctx context.Context, tx *dbstore.Store, sourcedCommits dbstore.SourcedCommits) error
```

#### <a id="committedAtMigrator.handleCommit" href="#committedAtMigrator.handleCommit">func (m *committedAtMigrator) handleCommit(ctx context.Context, tx *dbstore.Store, repositoryID int, repositoryName, commit string) error</a>

```
searchKey: migration.committedAtMigrator.handleCommit
tags: [private]
```

```Go
func (m *committedAtMigrator) handleCommit(ctx context.Context, tx *dbstore.Store, repositoryID int, repositoryName, commit string) error
```

#### <a id="committedAtMigrator.Down" href="#committedAtMigrator.Down">func (m *committedAtMigrator) Down(ctx context.Context) error</a>

```
searchKey: migration.committedAtMigrator.Down
tags: [private]
```

```Go
func (m *committedAtMigrator) Down(ctx context.Context) error
```

Down runs a batch of the migration in reverse. This method simply sets the committed_at column to null for a number of records matching the configured batch size. 

### <a id="GitserverClient" href="#GitserverClient">type GitserverClient interface</a>

```
searchKey: migration.GitserverClient
```

```Go
type GitserverClient interface {
	CommitDate(ctx context.Context, repositoryID int, commit string) (time.Time, error)
}
```

### <a id="MockGitserverClient" href="#MockGitserverClient">type MockGitserverClient struct</a>

```
searchKey: migration.MockGitserverClient
```

```Go
type MockGitserverClient struct {
	// CommitDateFunc is an instance of a mock function object controlling
	// the behavior of the method CommitDate.
	CommitDateFunc *GitserverClientCommitDateFunc
}
```

MockGitserverClient is a mock implementation of the GitserverClient interface (from the package github.com/sourcegraph/sourcegraph/enterprise/internal/codeintel/stores/dbstore/migration) used for unit testing. 

#### <a id="NewMockGitserverClient" href="#NewMockGitserverClient">func NewMockGitserverClient() *MockGitserverClient</a>

```
searchKey: migration.NewMockGitserverClient
```

```Go
func NewMockGitserverClient() *MockGitserverClient
```

NewMockGitserverClient creates a new mock of the GitserverClient interface. All methods return zero values for all results, unless overwritten. 

#### <a id="NewMockGitserverClientFrom" href="#NewMockGitserverClientFrom">func NewMockGitserverClientFrom(i GitserverClient) *MockGitserverClient</a>

```
searchKey: migration.NewMockGitserverClientFrom
```

```Go
func NewMockGitserverClientFrom(i GitserverClient) *MockGitserverClient
```

NewMockGitserverClientFrom creates a new mock of the MockGitserverClient interface. All methods delegate to the given implementation, unless overwritten. 

#### <a id="MockGitserverClient.CommitDate" href="#MockGitserverClient.CommitDate">func (m *MockGitserverClient) CommitDate(v0 context.Context, v1 int, v2 string) (time.Time, error)</a>

```
searchKey: migration.MockGitserverClient.CommitDate
```

```Go
func (m *MockGitserverClient) CommitDate(v0 context.Context, v1 int, v2 string) (time.Time, error)
```

CommitDate delegates to the next hook function in the queue and stores the parameter and result values of this invocation. 

### <a id="GitserverClientCommitDateFunc" href="#GitserverClientCommitDateFunc">type GitserverClientCommitDateFunc struct</a>

```
searchKey: migration.GitserverClientCommitDateFunc
```

```Go
type GitserverClientCommitDateFunc struct {
	defaultHook func(context.Context, int, string) (time.Time, error)
	hooks       []func(context.Context, int, string) (time.Time, error)
	history     []GitserverClientCommitDateFuncCall
	mutex       sync.Mutex
}
```

GitserverClientCommitDateFunc describes the behavior when the CommitDate method of the parent MockGitserverClient instance is invoked. 

#### <a id="GitserverClientCommitDateFunc.SetDefaultHook" href="#GitserverClientCommitDateFunc.SetDefaultHook">func (f *GitserverClientCommitDateFunc) SetDefaultHook(hook func(context.Context, int, string) (time.Time, error))</a>

```
searchKey: migration.GitserverClientCommitDateFunc.SetDefaultHook
```

```Go
func (f *GitserverClientCommitDateFunc) SetDefaultHook(hook func(context.Context, int, string) (time.Time, error))
```

SetDefaultHook sets function that is called when the CommitDate method of the parent MockGitserverClient instance is invoked and the hook queue is empty. 

#### <a id="GitserverClientCommitDateFunc.PushHook" href="#GitserverClientCommitDateFunc.PushHook">func (f *GitserverClientCommitDateFunc) PushHook(hook func(context.Context, int, string) (time.Time, error))</a>

```
searchKey: migration.GitserverClientCommitDateFunc.PushHook
```

```Go
func (f *GitserverClientCommitDateFunc) PushHook(hook func(context.Context, int, string) (time.Time, error))
```

PushHook adds a function to the end of hook queue. Each invocation of the CommitDate method of the parent MockGitserverClient instance invokes the hook at the front of the queue and discards it. After the queue is empty, the default hook function is invoked for any future action. 

#### <a id="GitserverClientCommitDateFunc.SetDefaultReturn" href="#GitserverClientCommitDateFunc.SetDefaultReturn">func (f *GitserverClientCommitDateFunc) SetDefaultReturn(r0 time.Time, r1 error)</a>

```
searchKey: migration.GitserverClientCommitDateFunc.SetDefaultReturn
```

```Go
func (f *GitserverClientCommitDateFunc) SetDefaultReturn(r0 time.Time, r1 error)
```

SetDefaultReturn calls SetDefaultDefaultHook with a function that returns the given values. 

#### <a id="GitserverClientCommitDateFunc.PushReturn" href="#GitserverClientCommitDateFunc.PushReturn">func (f *GitserverClientCommitDateFunc) PushReturn(r0 time.Time, r1 error)</a>

```
searchKey: migration.GitserverClientCommitDateFunc.PushReturn
```

```Go
func (f *GitserverClientCommitDateFunc) PushReturn(r0 time.Time, r1 error)
```

PushReturn calls PushDefaultHook with a function that returns the given values. 

#### <a id="GitserverClientCommitDateFunc.nextHook" href="#GitserverClientCommitDateFunc.nextHook">func (f *GitserverClientCommitDateFunc) nextHook() func(context.Context, int, string) (time.Time, error)</a>

```
searchKey: migration.GitserverClientCommitDateFunc.nextHook
tags: [private]
```

```Go
func (f *GitserverClientCommitDateFunc) nextHook() func(context.Context, int, string) (time.Time, error)
```

#### <a id="GitserverClientCommitDateFunc.appendCall" href="#GitserverClientCommitDateFunc.appendCall">func (f *GitserverClientCommitDateFunc) appendCall(r0 GitserverClientCommitDateFuncCall)</a>

```
searchKey: migration.GitserverClientCommitDateFunc.appendCall
tags: [private]
```

```Go
func (f *GitserverClientCommitDateFunc) appendCall(r0 GitserverClientCommitDateFuncCall)
```

#### <a id="GitserverClientCommitDateFunc.History" href="#GitserverClientCommitDateFunc.History">func (f *GitserverClientCommitDateFunc) History() []GitserverClientCommitDateFuncCall</a>

```
searchKey: migration.GitserverClientCommitDateFunc.History
```

```Go
func (f *GitserverClientCommitDateFunc) History() []GitserverClientCommitDateFuncCall
```

History returns a sequence of GitserverClientCommitDateFuncCall objects describing the invocations of this function. 

### <a id="GitserverClientCommitDateFuncCall" href="#GitserverClientCommitDateFuncCall">type GitserverClientCommitDateFuncCall struct</a>

```
searchKey: migration.GitserverClientCommitDateFuncCall
```

```Go
type GitserverClientCommitDateFuncCall struct {
	// Arg0 is the value of the 1st argument passed to this method
	// invocation.
	Arg0 context.Context
	// Arg1 is the value of the 2nd argument passed to this method
	// invocation.
	Arg1 int
	// Arg2 is the value of the 3rd argument passed to this method
	// invocation.
	Arg2 string
	// Result0 is the value of the 1st result returned from this method
	// invocation.
	Result0 time.Time
	// Result1 is the value of the 2nd result returned from this method
	// invocation.
	Result1 error
}
```

GitserverClientCommitDateFuncCall is an object that describes an invocation of method CommitDate on an instance of MockGitserverClient. 

#### <a id="GitserverClientCommitDateFuncCall.Args" href="#GitserverClientCommitDateFuncCall.Args">func (c GitserverClientCommitDateFuncCall) Args() []interface{}</a>

```
searchKey: migration.GitserverClientCommitDateFuncCall.Args
```

```Go
func (c GitserverClientCommitDateFuncCall) Args() []interface{}
```

Args returns an interface slice containing the arguments of this invocation. 

#### <a id="GitserverClientCommitDateFuncCall.Results" href="#GitserverClientCommitDateFuncCall.Results">func (c GitserverClientCommitDateFuncCall) Results() []interface{}</a>

```
searchKey: migration.GitserverClientCommitDateFuncCall.Results
```

```Go
func (c GitserverClientCommitDateFuncCall) Results() []interface{}
```

Results returns an interface slice containing the results of this invocation. 

## <a id="func" href="#func">Functions</a>

```
tags: [private]
```

### <a id="NewCommittedAtMigrator" href="#NewCommittedAtMigrator">func NewCommittedAtMigrator(store *dbstore.Store, gitserverClient GitserverClient, batchSize int) oobmigration.Migrator</a>

```
searchKey: migration.NewCommittedAtMigrator
```

```Go
func NewCommittedAtMigrator(store *dbstore.Store, gitserverClient GitserverClient, batchSize int) oobmigration.Migrator
```

NewCommittedAtMigrator creates a new Migrator instance that reads records from the lsif_uploads table and populates the record's committed_at column based on data from gitserver. 

### <a id="isRepositoryNotFound" href="#isRepositoryNotFound">func isRepositoryNotFound(err error) bool</a>

```
searchKey: migration.isRepositoryNotFound
tags: [private]
```

```Go
func isRepositoryNotFound(err error) bool
```

### <a id="isRevisionNotFound" href="#isRevisionNotFound">func isRevisionNotFound(err error) bool</a>

```
searchKey: migration.isRevisionNotFound
tags: [private]
```

```Go
func isRevisionNotFound(err error) bool
```

### <a id="TestCommittedAtMigrator" href="#TestCommittedAtMigrator">func TestCommittedAtMigrator(t *testing.T)</a>

```
searchKey: migration.TestCommittedAtMigrator
tags: [private]
```

```Go
func TestCommittedAtMigrator(t *testing.T)
```

### <a id="TestCommittedAtMigratorUnknownRepository" href="#TestCommittedAtMigratorUnknownRepository">func TestCommittedAtMigratorUnknownRepository(t *testing.T)</a>

```
searchKey: migration.TestCommittedAtMigratorUnknownRepository
tags: [private]
```

```Go
func TestCommittedAtMigratorUnknownRepository(t *testing.T)
```

### <a id="TestCommittedAtMigratorUnknownCommits" href="#TestCommittedAtMigratorUnknownCommits">func TestCommittedAtMigratorUnknownCommits(t *testing.T)</a>

```
searchKey: migration.TestCommittedAtMigratorUnknownCommits
tags: [private]
```

```Go
func TestCommittedAtMigratorUnknownCommits(t *testing.T)
```

### <a id="init.migration_test.go" href="#init.migration_test.go">func init()</a>

```
searchKey: migration.init
tags: [private]
```

```Go
func init()
```

