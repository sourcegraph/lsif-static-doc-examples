# Package codemonitors

## Index

* Subpages
  * [enterprise/internal/codemonitors/background](codemonitors/background.md)
  * [enterprise/internal/codemonitors/email](codemonitors/email.md)
  * [enterprise/internal/codemonitors/resolvers](codemonitors/resolvers.md)
  * [enterprise/internal/codemonitors/storetest](codemonitors/storetest.md)
* [Constants](#const)
    * [const actionEmailByIDFmtStr](#actionEmailByIDFmtStr)
    * [const actionJobForIDFmtStr](#actionJobForIDFmtStr)
    * [const allRecipientsForEmailIDInt64FmtStr](#allRecipientsForEmailIDInt64FmtStr)
    * [const createActionEmailFmtStr](#createActionEmailFmtStr)
    * [const createRecipientFmtStr](#createRecipientFmtStr)
    * [const createTriggerQueryFmtStr](#createTriggerQueryFmtStr)
    * [const deleteActionEmailFmtStr](#deleteActionEmailFmtStr)
    * [const deleteMonitorFmtStr](#deleteMonitorFmtStr)
    * [const deleteObsoleteJobLogsFmtStr](#deleteObsoleteJobLogsFmtStr)
    * [const deleteOldJobLogsFmtStr](#deleteOldJobLogsFmtStr)
    * [const deleteRecipientFmtStr](#deleteRecipientFmtStr)
    * [const enqueueActionEmailFmtStr](#enqueueActionEmailFmtStr)
    * [const enqueueTriggerQueryFmtStr](#enqueueTriggerQueryFmtStr)
    * [const getActionJobMetadataFmtStr](#getActionJobMetadataFmtStr)
    * [const getEventsForQueryIDInt64FmtStr](#getEventsForQueryIDInt64FmtStr)
    * [const getJobIDs](#getJobIDs)
    * [const getQueryByRecordIDFmtStr](#getQueryByRecordIDFmtStr)
    * [const insertCodeMonitorFmtStr](#insertCodeMonitorFmtStr)
    * [const logSearchFmtStr](#logSearchFmtStr)
    * [const monitorByIDFmtStr](#monitorByIDFmtStr)
    * [const monitorsFmtStr](#monitorsFmtStr)
    * [const readActionEmailEventsFmtStr](#readActionEmailEventsFmtStr)
    * [const readActionEmailFmtStr](#readActionEmailFmtStr)
    * [const readRecipientQueryFmtStr](#readRecipientQueryFmtStr)
    * [const resetTriggerQueryTimestamps](#resetTriggerQueryTimestamps)
    * [const setToCompletedFmtStr](#setToCompletedFmtStr)
    * [const setTriggerQueryNextRunFmtStr](#setTriggerQueryNextRunFmtStr)
    * [const testDescription](#testDescription)
    * [const testQuery](#testQuery)
    * [const toggleCodeMonitorFmtStr](#toggleCodeMonitorFmtStr)
    * [const totalActionEmailEventsFmtStr](#totalActionEmailEventsFmtStr)
    * [const totalCountActionEmailsFmtStr](#totalCountActionEmailsFmtStr)
    * [const totalCountEventsForQueryIDInt64FmtStr](#totalCountEventsForQueryIDInt64FmtStr)
    * [const totalCountMonitorsFmtStr](#totalCountMonitorsFmtStr)
    * [const totalCountRecipientsFmtStr](#totalCountRecipientsFmtStr)
    * [const triggerQueryByIDFmtStr](#triggerQueryByIDFmtStr)
    * [const triggerQueryByMonitorFmtStr](#triggerQueryByMonitorFmtStr)
    * [const updateActionEmailFmtStr](#updateActionEmailFmtStr)
    * [const updateCodeMonitorFmtStr](#updateCodeMonitorFmtStr)
    * [const updateTriggerQueryFmtStr](#updateTriggerQueryFmtStr)
* [Variables](#var)
    * [var ActionJobsColumns](#ActionJobsColumns)
    * [var EmailsColumns](#EmailsColumns)
    * [var TriggerJobsColumns](#TriggerJobsColumns)
    * [var monitorColumns](#monitorColumns)
    * [var queryColumns](#queryColumns)
* [Types](#type)
    * [type ActionJob struct](#ActionJob)
        * [func (a *ActionJob) RecordID() int](#ActionJob.RecordID)
    * [type ActionJobMetadata struct](#ActionJobMetadata)
    * [type Monitor struct](#Monitor)
    * [type MonitorEmail struct](#MonitorEmail)
    * [type MonitorQuery struct](#MonitorQuery)
    * [type Recipient struct](#Recipient)
    * [type Store struct](#Store)
        * [func NewStore(db dbutil.DB) *Store](#NewStore)
        * [func NewStoreWithClock(db dbutil.DB, clock func() time.Time) *Store](#NewStoreWithClock)
        * [func newTestStore(t *testing.T) (context.Context, *Store)](#newTestStore)
        * [func (s *Store) ActionEmailByIDInt64(ctx context.Context, emailID int64) (m *MonitorEmail, err error)](#Store.ActionEmailByIDInt64)
        * [func (s *Store) ActionJobForIDInt(ctx context.Context, recordID int) (*ActionJob, error)](#Store.ActionJobForIDInt)
        * [func (s *Store) AllRecipientsForEmailIDInt64(ctx context.Context, emailID int64) (rs []*Recipient, err error)](#Store.AllRecipientsForEmailIDInt64)
        * [func (s *Store) Clock() func() time.Time](#Store.Clock)
        * [func (s *Store) CreateActionEmail(ctx context.Context, monitorID int64, action *graphqlbackend.CreateActionArgs) (e *MonitorEmail, err error)](#Store.CreateActionEmail)
        * [func (s *Store) CreateActions(ctx context.Context, args []*graphqlbackend.CreateActionArgs, monitorID int64) (err error)](#Store.CreateActions)
        * [func (s *Store) CreateCodeMonitor(ctx context.Context, args *graphqlbackend.CreateCodeMonitorArgs) (m *Monitor, err error)](#Store.CreateCodeMonitor)
        * [func (s *Store) CreateMonitor(ctx context.Context, args *graphqlbackend.CreateMonitorArgs) (m *Monitor, err error)](#Store.CreateMonitor)
        * [func (s *Store) CreateRecipients(ctx context.Context, recipients []graphql.ID, emailID int64) (err error)](#Store.CreateRecipients)
        * [func (s *Store) CreateTriggerQuery(ctx context.Context, monitorID int64, args *graphqlbackend.CreateTriggerArgs) (err error)](#Store.CreateTriggerQuery)
        * [func (s *Store) DeleteActionsInt64(ctx context.Context, actionIDs []int64, monitorID int64) (err error)](#Store.DeleteActionsInt64)
        * [func (s *Store) DeleteMonitor(ctx context.Context, args *graphqlbackend.DeleteCodeMonitorArgs) (err error)](#Store.DeleteMonitor)
        * [func (s *Store) DeleteObsoleteJobLogs(ctx context.Context) error](#Store.DeleteObsoleteJobLogs)
        * [func (s *Store) DeleteOldJobLogs(ctx context.Context, retentionInDays int) error](#Store.DeleteOldJobLogs)
        * [func (s *Store) DeleteRecipients(ctx context.Context, emailID int64) (err error)](#Store.DeleteRecipients)
        * [func (s *Store) EnqueueActionEmailsForQueryIDInt64(ctx context.Context, queryID int64, triggerEventID int) (err error)](#Store.EnqueueActionEmailsForQueryIDInt64)
        * [func (s *Store) EnqueueTriggerQueries(ctx context.Context) (err error)](#Store.EnqueueTriggerQueries)
        * [func (s *Store) GetActionJobMetadata(ctx context.Context, recordID int) (m *ActionJobMetadata, err error)](#Store.GetActionJobMetadata)
        * [func (s *Store) GetEventsForQueryIDInt64(ctx context.Context, queryID int64, args *graphqlbackend.ListEventsArgs) ([]*TriggerJobs, error)](#Store.GetEventsForQueryIDInt64)
        * [func (s *Store) GetQueryByRecordID(ctx context.Context, recordID int) (query *MonitorQuery, err error)](#Store.GetQueryByRecordID)
        * [func (s *Store) LogSearch(ctx context.Context, queryString string, numResults int, recordID int) error](#Store.LogSearch)
        * [func (s *Store) MonitorByIDInt64(ctx context.Context, monitorID int64) (m *Monitor, err error)](#Store.MonitorByIDInt64)
        * [func (s *Store) Monitors(ctx context.Context, userID int32, args *graphqlbackend.ListMonitorsArgs) ([]*Monitor, error)](#Store.Monitors)
        * [func (s *Store) Now() time.Time](#Store.Now)
        * [func (s *Store) ReadActionEmailEvents(ctx context.Context, emailID int64, triggerEventID *int, args *graphqlbackend.ListEventsArgs) (js []*ActionJob, err error)](#Store.ReadActionEmailEvents)
        * [func (s *Store) ReadActionEmailQuery(ctx context.Context, monitorID int64, args *graphqlbackend.ListActionArgs) (*sqlf.Query, error)](#Store.ReadActionEmailQuery)
        * [func (s *Store) RecipientsForEmailIDInt64(ctx context.Context, emailID int64, args *graphqlbackend.ListRecipientsArgs) ([]*Recipient, error)](#Store.RecipientsForEmailIDInt64)
        * [func (s *Store) ResetTriggerQueryTimestamps(ctx context.Context, queryID int64) error](#Store.ResetTriggerQueryTimestamps)
        * [func (s *Store) SetTriggerQueryNextRun(ctx context.Context, triggerQueryID int64, next time.Time, latestResults time.Time) error](#Store.SetTriggerQueryNextRun)
        * [func (s *Store) ToggleMonitor(ctx context.Context, args *graphqlbackend.ToggleCodeMonitorArgs) (m *Monitor, err error)](#Store.ToggleMonitor)
        * [func (s *Store) TotalActionEmailEvents(ctx context.Context, emailID int64, triggerEventID *int) (totalCount int32, err error)](#Store.TotalActionEmailEvents)
        * [func (s *Store) TotalCountActionEmails(ctx context.Context, monitorID int64) (count int32, err error)](#Store.TotalCountActionEmails)
        * [func (s *Store) TotalCountEventsForQueryIDInt64(ctx context.Context, queryID int64) (totalCount int32, err error)](#Store.TotalCountEventsForQueryIDInt64)
        * [func (s *Store) TotalCountMonitors(ctx context.Context, userID int32) (count int32, err error)](#Store.TotalCountMonitors)
        * [func (s *Store) TotalCountRecipients(ctx context.Context, emailID int64) (count int32, err error)](#Store.TotalCountRecipients)
        * [func (s *Store) Transact(ctx context.Context) (*Store, error)](#Store.Transact)
        * [func (s *Store) TriggerQueryByMonitorIDInt64(ctx context.Context, monitorID int64) (*MonitorQuery, error)](#Store.TriggerQueryByMonitorIDInt64)
        * [func (s *Store) UpdateActionEmail(ctx context.Context, monitorID int64, action *graphqlbackend.EditActionArgs) (e *MonitorEmail, err error)](#Store.UpdateActionEmail)
        * [func (s *Store) UpdateMonitor(ctx context.Context, args *graphqlbackend.UpdateCodeMonitorArgs) (m *Monitor, err error)](#Store.UpdateMonitor)
        * [func (s *Store) UpdateTriggerQuery(ctx context.Context, args *graphqlbackend.UpdateCodeMonitorArgs) (err error)](#Store.UpdateTriggerQuery)
        * [func (s *Store) With(other basestore.ShareableStore) *Store](#Store.With)
        * [func (s *Store) createActionEmailQuery(ctx context.Context, monitorID int64, args *graphqlbackend.CreateActionEmailArgs) (*sqlf.Query, error)](#Store.createActionEmailQuery)
        * [func (s *Store) createCodeMonitorQuery(ctx context.Context, args *graphqlbackend.CreateMonitorArgs) (*sqlf.Query, error)](#Store.createCodeMonitorQuery)
        * [func (s *Store) createRecipient(ctx context.Context, recipient graphql.ID, emailID int64) (err error)](#Store.createRecipient)
        * [func (s *Store) createTriggerQueryQuery(ctx context.Context, monitorID int64, args *graphqlbackend.CreateTriggerArgs) (*sqlf.Query, error)](#Store.createTriggerQueryQuery)
        * [func (s *Store) deleteMonitorQuery(ctx context.Context, args *graphqlbackend.DeleteCodeMonitorArgs) (*sqlf.Query, error)](#Store.deleteMonitorQuery)
        * [func (s *Store) insertTestMonitor(ctx context.Context, t *testing.T) (*Monitor, error)](#Store.insertTestMonitor)
        * [func (s *Store) runActionJobQuery(ctx context.Context, q *sqlf.Query) (ajs *ActionJob, err error)](#Store.runActionJobQuery)
        * [func (s *Store) runEmailQuery(ctx context.Context, q *sqlf.Query) (*MonitorEmail, error)](#Store.runEmailQuery)
        * [func (s *Store) runMonitorQuery(ctx context.Context, q *sqlf.Query) (*Monitor, error)](#Store.runMonitorQuery)
        * [func (s *Store) runTriggerQuery(ctx context.Context, q *sqlf.Query) (*MonitorQuery, error)](#Store.runTriggerQuery)
        * [func (s *Store) toggleCodeMonitorQuery(ctx context.Context, args *graphqlbackend.ToggleCodeMonitorArgs) (*sqlf.Query, error)](#Store.toggleCodeMonitorQuery)
        * [func (s *Store) triggerQueryByIDInt64(ctx context.Context, queryID int64) (*MonitorQuery, error)](#Store.triggerQueryByIDInt64)
        * [func (s *Store) updateActionEmailQuery(ctx context.Context, monitorID int64, args *graphqlbackend.EditActionEmailArgs) (q *sqlf.Query, err error)](#Store.updateActionEmailQuery)
        * [func (s *Store) updateCodeMonitorQuery(ctx context.Context, args *graphqlbackend.UpdateCodeMonitorArgs) (*sqlf.Query, error)](#Store.updateCodeMonitorQuery)
        * [func (s *Store) updateTriggerQueryQuery(ctx context.Context, args *graphqlbackend.UpdateCodeMonitorArgs) (q *sqlf.Query, err error)](#Store.updateTriggerQueryQuery)
    * [type TriggerJobs struct](#TriggerJobs)
        * [func (r *TriggerJobs) RecordID() int](#TriggerJobs.RecordID)
* [Functions](#func)
    * [func ScanActionJobs(rows *sql.Rows, err error) (workerutil.Record, bool, error)](#ScanActionJobs)
    * [func ScanEmails(rows *sql.Rows) (ms []*MonitorEmail, err error)](#ScanEmails)
    * [func ScanTriggerJobs(rows *sql.Rows, err error) (workerutil.Record, bool, error)](#ScanTriggerJobs)
    * [func TestAllRecipientsForEmailIDInt64(t *testing.T)](#TestAllRecipientsForEmailIDInt64)
    * [func TestDeleteOldJobLogs(t *testing.T)](#TestDeleteOldJobLogs)
    * [func TestEnqueueActionEmailsForQueryIDInt64QueryByRecordID(t *testing.T)](#TestEnqueueActionEmailsForQueryIDInt64QueryByRecordID)
    * [func TestGetActionJobMetadata(t *testing.T)](#TestGetActionJobMetadata)
    * [func TestQueryByRecordID(t *testing.T)](#TestQueryByRecordID)
    * [func TestResetTriggerQueryTimestamps(t *testing.T)](#TestResetTriggerQueryTimestamps)
    * [func TestScanActionJobs(t *testing.T)](#TestScanActionJobs)
    * [func TestTriggerQueryNextRun(t *testing.T)](#TestTriggerQueryNextRun)
    * [func deleteActionsEmailQuery(ctx context.Context, actionIDs []int64, monitorID int64) (*sqlf.Query, error)](#deleteActionsEmailQuery)
    * [func deleteRecipientsQuery(ctx context.Context, emailId int64) (*sqlf.Query, error)](#deleteRecipientsQuery)
    * [func init()](#init.main_test.go)
    * [func insertTestUser(t *testing.T, db *sql.DB, name string, isAdmin bool) (userID int32)](#insertTestUser)
    * [func monitorsQuery(userID int32, args *graphqlbackend.ListMonitorsArgs) (*sqlf.Query, error)](#monitorsQuery)
    * [func newTestUser(ctx context.Context, t *testing.T) (name string, id int32, namespace graphql.ID, userContext context.Context)](#newTestUser)
    * [func nilOrInt32(n int32) *int32](#nilOrInt32)
    * [func readRecipientQuery(ctx context.Context, emailId int64, args *graphqlbackend.ListRecipientsArgs) (*sqlf.Query, error)](#readRecipientQuery)
    * [func scanActionJobs(rows *sql.Rows, err error) ([]*ActionJob, error)](#scanActionJobs)
    * [func scanMonitors(rows *sql.Rows) ([]*Monitor, error)](#scanMonitors)
    * [func scanRecipients(rows *sql.Rows) (ms []*Recipient, err error)](#scanRecipients)
    * [func scanTriggerJobs(rows *sql.Rows, err error) ([]*TriggerJobs, error)](#scanTriggerJobs)
    * [func scanTriggerQueries(rows *sql.Rows) (ms []*MonitorQuery, err error)](#scanTriggerQueries)
    * [func unmarshalAfter(after *string) (int64, error)](#unmarshalAfter)


## <a id="const" href="#const">Constants</a>

```
tags: [private]
```

### <a id="actionEmailByIDFmtStr" href="#actionEmailByIDFmtStr">const actionEmailByIDFmtStr</a>

```
searchKey: codemonitors.actionEmailByIDFmtStr
tags: [constant string private]
```

```Go
const actionEmailByIDFmtStr = ...
```

### <a id="actionJobForIDFmtStr" href="#actionJobForIDFmtStr">const actionJobForIDFmtStr</a>

```
searchKey: codemonitors.actionJobForIDFmtStr
tags: [constant string private]
```

```Go
const actionJobForIDFmtStr = ...
```

### <a id="allRecipientsForEmailIDInt64FmtStr" href="#allRecipientsForEmailIDInt64FmtStr">const allRecipientsForEmailIDInt64FmtStr</a>

```
searchKey: codemonitors.allRecipientsForEmailIDInt64FmtStr
tags: [constant string private]
```

```Go
const allRecipientsForEmailIDInt64FmtStr = ...
```

### <a id="createActionEmailFmtStr" href="#createActionEmailFmtStr">const createActionEmailFmtStr</a>

```
searchKey: codemonitors.createActionEmailFmtStr
tags: [constant string private]
```

```Go
const createActionEmailFmtStr = ...
```

### <a id="createRecipientFmtStr" href="#createRecipientFmtStr">const createRecipientFmtStr</a>

```
searchKey: codemonitors.createRecipientFmtStr
tags: [constant string private]
```

```Go
const createRecipientFmtStr = ...
```

### <a id="createTriggerQueryFmtStr" href="#createTriggerQueryFmtStr">const createTriggerQueryFmtStr</a>

```
searchKey: codemonitors.createTriggerQueryFmtStr
tags: [constant string private]
```

```Go
const createTriggerQueryFmtStr = ...
```

### <a id="deleteActionEmailFmtStr" href="#deleteActionEmailFmtStr">const deleteActionEmailFmtStr</a>

```
searchKey: codemonitors.deleteActionEmailFmtStr
tags: [constant string private]
```

```Go
const deleteActionEmailFmtStr = `DELETE FROM cm_emails WHERE id in (%s) AND MONITOR = %s`
```

### <a id="deleteMonitorFmtStr" href="#deleteMonitorFmtStr">const deleteMonitorFmtStr</a>

```
searchKey: codemonitors.deleteMonitorFmtStr
tags: [constant string private]
```

```Go
const deleteMonitorFmtStr = `DELETE FROM cm_monitors WHERE id = %s`
```

### <a id="deleteObsoleteJobLogsFmtStr" href="#deleteObsoleteJobLogsFmtStr">const deleteObsoleteJobLogsFmtStr</a>

```
searchKey: codemonitors.deleteObsoleteJobLogsFmtStr
tags: [constant string private]
```

```Go
const deleteObsoleteJobLogsFmtStr = ...
```

### <a id="deleteOldJobLogsFmtStr" href="#deleteOldJobLogsFmtStr">const deleteOldJobLogsFmtStr</a>

```
searchKey: codemonitors.deleteOldJobLogsFmtStr
tags: [constant string private]
```

```Go
const deleteOldJobLogsFmtStr = ...
```

### <a id="deleteRecipientFmtStr" href="#deleteRecipientFmtStr">const deleteRecipientFmtStr</a>

```
searchKey: codemonitors.deleteRecipientFmtStr
tags: [constant string private]
```

```Go
const deleteRecipientFmtStr = `DELETE FROM cm_recipients WHERE email = %s`
```

### <a id="enqueueActionEmailFmtStr" href="#enqueueActionEmailFmtStr">const enqueueActionEmailFmtStr</a>

```
searchKey: codemonitors.enqueueActionEmailFmtStr
tags: [constant string private]
```

```Go
const enqueueActionEmailFmtStr = ...
```

### <a id="enqueueTriggerQueryFmtStr" href="#enqueueTriggerQueryFmtStr">const enqueueTriggerQueryFmtStr</a>

```
searchKey: codemonitors.enqueueTriggerQueryFmtStr
tags: [constant string private]
```

```Go
const enqueueTriggerQueryFmtStr = ...
```

### <a id="getActionJobMetadataFmtStr" href="#getActionJobMetadataFmtStr">const getActionJobMetadataFmtStr</a>

```
searchKey: codemonitors.getActionJobMetadataFmtStr
tags: [constant string private]
```

```Go
const getActionJobMetadataFmtStr = ...
```

### <a id="getEventsForQueryIDInt64FmtStr" href="#getEventsForQueryIDInt64FmtStr">const getEventsForQueryIDInt64FmtStr</a>

```
searchKey: codemonitors.getEventsForQueryIDInt64FmtStr
tags: [constant string private]
```

```Go
const getEventsForQueryIDInt64FmtStr = ...
```

### <a id="getJobIDs" href="#getJobIDs">const getJobIDs</a>

```
searchKey: codemonitors.getJobIDs
tags: [constant string private]
```

```Go
const getJobIDs = `
SELECT id
FROM cm_trigger_jobs;
`
```

### <a id="getQueryByRecordIDFmtStr" href="#getQueryByRecordIDFmtStr">const getQueryByRecordIDFmtStr</a>

```
searchKey: codemonitors.getQueryByRecordIDFmtStr
tags: [constant string private]
```

```Go
const getQueryByRecordIDFmtStr = ...
```

### <a id="insertCodeMonitorFmtStr" href="#insertCodeMonitorFmtStr">const insertCodeMonitorFmtStr</a>

```
searchKey: codemonitors.insertCodeMonitorFmtStr
tags: [constant string private]
```

```Go
const insertCodeMonitorFmtStr = ...
```

### <a id="logSearchFmtStr" href="#logSearchFmtStr">const logSearchFmtStr</a>

```
searchKey: codemonitors.logSearchFmtStr
tags: [constant string private]
```

```Go
const logSearchFmtStr = ...
```

### <a id="monitorByIDFmtStr" href="#monitorByIDFmtStr">const monitorByIDFmtStr</a>

```
searchKey: codemonitors.monitorByIDFmtStr
tags: [constant string private]
```

```Go
const monitorByIDFmtStr = ...
```

### <a id="monitorsFmtStr" href="#monitorsFmtStr">const monitorsFmtStr</a>

```
searchKey: codemonitors.monitorsFmtStr
tags: [constant string private]
```

```Go
const monitorsFmtStr = ...
```

### <a id="readActionEmailEventsFmtStr" href="#readActionEmailEventsFmtStr">const readActionEmailEventsFmtStr</a>

```
searchKey: codemonitors.readActionEmailEventsFmtStr
tags: [constant string private]
```

```Go
const readActionEmailEventsFmtStr = ...
```

### <a id="readActionEmailFmtStr" href="#readActionEmailFmtStr">const readActionEmailFmtStr</a>

```
searchKey: codemonitors.readActionEmailFmtStr
tags: [constant string private]
```

```Go
const readActionEmailFmtStr = ...
```

### <a id="readRecipientQueryFmtStr" href="#readRecipientQueryFmtStr">const readRecipientQueryFmtStr</a>

```
searchKey: codemonitors.readRecipientQueryFmtStr
tags: [constant string private]
```

```Go
const readRecipientQueryFmtStr = ...
```

### <a id="resetTriggerQueryTimestamps" href="#resetTriggerQueryTimestamps">const resetTriggerQueryTimestamps</a>

```
searchKey: codemonitors.resetTriggerQueryTimestamps
tags: [constant string private]
```

```Go
const resetTriggerQueryTimestamps = ...
```

### <a id="setToCompletedFmtStr" href="#setToCompletedFmtStr">const setToCompletedFmtStr</a>

```
searchKey: codemonitors.setToCompletedFmtStr
tags: [constant string private]
```

```Go
const setToCompletedFmtStr = ...
```

### <a id="setTriggerQueryNextRunFmtStr" href="#setTriggerQueryNextRunFmtStr">const setTriggerQueryNextRunFmtStr</a>

```
searchKey: codemonitors.setTriggerQueryNextRunFmtStr
tags: [constant string private]
```

```Go
const setTriggerQueryNextRunFmtStr = ...
```

### <a id="testDescription" href="#testDescription">const testDescription</a>

```
searchKey: codemonitors.testDescription
tags: [constant string private]
```

```Go
const testDescription = "test description"
```

### <a id="testQuery" href="#testQuery">const testQuery</a>

```
searchKey: codemonitors.testQuery
tags: [constant string private]
```

```Go
const testQuery = "repo:github\\.com/sourcegraph/sourcegraph func type:diff patternType:literal"
```

### <a id="toggleCodeMonitorFmtStr" href="#toggleCodeMonitorFmtStr">const toggleCodeMonitorFmtStr</a>

```
searchKey: codemonitors.toggleCodeMonitorFmtStr
tags: [constant string private]
```

```Go
const toggleCodeMonitorFmtStr = ...
```

### <a id="totalActionEmailEventsFmtStr" href="#totalActionEmailEventsFmtStr">const totalActionEmailEventsFmtStr</a>

```
searchKey: codemonitors.totalActionEmailEventsFmtStr
tags: [constant string private]
```

```Go
const totalActionEmailEventsFmtStr = `
SELECT COUNT(*)
FROM cm_action_jobs
WHERE %s
`
```

### <a id="totalCountActionEmailsFmtStr" href="#totalCountActionEmailsFmtStr">const totalCountActionEmailsFmtStr</a>

```
searchKey: codemonitors.totalCountActionEmailsFmtStr
tags: [constant string private]
```

```Go
const totalCountActionEmailsFmtStr = `
SELECT COUNT(*)
FROM cm_emails
WHERE monitor = %s;
`
```

### <a id="totalCountEventsForQueryIDInt64FmtStr" href="#totalCountEventsForQueryIDInt64FmtStr">const totalCountEventsForQueryIDInt64FmtStr</a>

```
searchKey: codemonitors.totalCountEventsForQueryIDInt64FmtStr
tags: [constant string private]
```

```Go
const totalCountEventsForQueryIDInt64FmtStr = ...
```

### <a id="totalCountMonitorsFmtStr" href="#totalCountMonitorsFmtStr">const totalCountMonitorsFmtStr</a>

```
searchKey: codemonitors.totalCountMonitorsFmtStr
tags: [constant string private]
```

```Go
const totalCountMonitorsFmtStr = `
SELECT COUNT(*)
FROM cm_monitors
WHERE namespace_user_id = %s;
`
```

### <a id="totalCountRecipientsFmtStr" href="#totalCountRecipientsFmtStr">const totalCountRecipientsFmtStr</a>

```
searchKey: codemonitors.totalCountRecipientsFmtStr
tags: [constant string private]
```

```Go
const totalCountRecipientsFmtStr = `
SELECT COUNT(*)
FROM cm_recipients
WHERE email = %s
`
```

### <a id="triggerQueryByIDFmtStr" href="#triggerQueryByIDFmtStr">const triggerQueryByIDFmtStr</a>

```
searchKey: codemonitors.triggerQueryByIDFmtStr
tags: [constant string private]
```

```Go
const triggerQueryByIDFmtStr = ...
```

### <a id="triggerQueryByMonitorFmtStr" href="#triggerQueryByMonitorFmtStr">const triggerQueryByMonitorFmtStr</a>

```
searchKey: codemonitors.triggerQueryByMonitorFmtStr
tags: [constant string private]
```

```Go
const triggerQueryByMonitorFmtStr = ...
```

### <a id="updateActionEmailFmtStr" href="#updateActionEmailFmtStr">const updateActionEmailFmtStr</a>

```
searchKey: codemonitors.updateActionEmailFmtStr
tags: [constant string private]
```

```Go
const updateActionEmailFmtStr = ...
```

### <a id="updateCodeMonitorFmtStr" href="#updateCodeMonitorFmtStr">const updateCodeMonitorFmtStr</a>

```
searchKey: codemonitors.updateCodeMonitorFmtStr
tags: [constant string private]
```

```Go
const updateCodeMonitorFmtStr = ...
```

### <a id="updateTriggerQueryFmtStr" href="#updateTriggerQueryFmtStr">const updateTriggerQueryFmtStr</a>

```
searchKey: codemonitors.updateTriggerQueryFmtStr
tags: [constant string private]
```

```Go
const updateTriggerQueryFmtStr = ...
```

## <a id="var" href="#var">Variables</a>

```
tags: [private]
```

### <a id="ActionJobsColumns" href="#ActionJobsColumns">var ActionJobsColumns</a>

```
searchKey: codemonitors.ActionJobsColumns
tags: [variable array struct]
```

```Go
var ActionJobsColumns = ...
```

### <a id="EmailsColumns" href="#EmailsColumns">var EmailsColumns</a>

```
searchKey: codemonitors.EmailsColumns
tags: [variable array struct]
```

```Go
var EmailsColumns = ...
```

### <a id="TriggerJobsColumns" href="#TriggerJobsColumns">var TriggerJobsColumns</a>

```
searchKey: codemonitors.TriggerJobsColumns
tags: [variable array struct]
```

```Go
var TriggerJobsColumns = ...
```

### <a id="monitorColumns" href="#monitorColumns">var monitorColumns</a>

```
searchKey: codemonitors.monitorColumns
tags: [variable array struct private]
```

```Go
var monitorColumns = ...
```

### <a id="queryColumns" href="#queryColumns">var queryColumns</a>

```
searchKey: codemonitors.queryColumns
tags: [variable array struct private]
```

```Go
var queryColumns = ...
```

## <a id="type" href="#type">Types</a>

```
tags: [private]
```

### <a id="ActionJob" href="#ActionJob">type ActionJob struct</a>

```
searchKey: codemonitors.ActionJob
tags: [struct]
```

```Go
type ActionJob struct {
	Id           int
	Email        int64
	TriggerEvent int

	// Fields demanded by any dbworker.
	State          string
	FailureMessage *string
	StartedAt      *time.Time
	FinishedAt     *time.Time
	ProcessAfter   *time.Time
	NumResets      int32
	NumFailures    int32
	LogContents    *string
}
```

#### <a id="ActionJob.RecordID" href="#ActionJob.RecordID">func (a *ActionJob) RecordID() int</a>

```
searchKey: codemonitors.ActionJob.RecordID
tags: [method]
```

```Go
func (a *ActionJob) RecordID() int
```

### <a id="ActionJobMetadata" href="#ActionJobMetadata">type ActionJobMetadata struct</a>

```
searchKey: codemonitors.ActionJobMetadata
tags: [struct]
```

```Go
type ActionJobMetadata struct {
	Description string
	MonitorID   int64
	NumResults  *int

	// The query with after: filter.
	Query string
}
```

### <a id="Monitor" href="#Monitor">type Monitor struct</a>

```
searchKey: codemonitors.Monitor
tags: [struct]
```

```Go
type Monitor struct {
	ID              int64
	CreatedBy       int32
	CreatedAt       time.Time
	ChangedBy       int32
	ChangedAt       time.Time
	Description     string
	Enabled         bool
	NamespaceUserID *int32
	NamespaceOrgID  *int32
}
```

### <a id="MonitorEmail" href="#MonitorEmail">type MonitorEmail struct</a>

```
searchKey: codemonitors.MonitorEmail
tags: [struct]
```

```Go
type MonitorEmail struct {
	Id        int64
	Monitor   int64
	Enabled   bool
	Priority  string
	Header    string
	CreatedBy int32
	CreatedAt time.Time
	ChangedBy int32
	ChangedAt time.Time
}
```

### <a id="MonitorQuery" href="#MonitorQuery">type MonitorQuery struct</a>

```
searchKey: codemonitors.MonitorQuery
tags: [struct]
```

```Go
type MonitorQuery struct {
	Id           int64
	Monitor      int64
	QueryString  string
	NextRun      time.Time
	LatestResult *time.Time
	CreatedBy    int32
	CreatedAt    time.Time
	ChangedBy    int32
	ChangedAt    time.Time
}
```

### <a id="Recipient" href="#Recipient">type Recipient struct</a>

```
searchKey: codemonitors.Recipient
tags: [struct]
```

```Go
type Recipient struct {
	ID              int64
	Email           int64
	NamespaceUserID *int32
	NamespaceOrgID  *int32
}
```

### <a id="Store" href="#Store">type Store struct</a>

```
searchKey: codemonitors.Store
tags: [struct]
```

```Go
type Store struct {
	*basestore.Store
	now func() time.Time
}
```

Store exposes methods to read and write codemonitors domain models from persistent storage. 

#### <a id="NewStore" href="#NewStore">func NewStore(db dbutil.DB) *Store</a>

```
searchKey: codemonitors.NewStore
tags: [function]
```

```Go
func NewStore(db dbutil.DB) *Store
```

NewStore returns a new Store backed by the given database. 

#### <a id="NewStoreWithClock" href="#NewStoreWithClock">func NewStoreWithClock(db dbutil.DB, clock func() time.Time) *Store</a>

```
searchKey: codemonitors.NewStoreWithClock
tags: [function]
```

```Go
func NewStoreWithClock(db dbutil.DB, clock func() time.Time) *Store
```

NewStoreWithClock returns a new Store backed by the given database and clock for timestamps. 

#### <a id="newTestStore" href="#newTestStore">func newTestStore(t *testing.T) (context.Context, *Store)</a>

```
searchKey: codemonitors.newTestStore
tags: [function private]
```

```Go
func newTestStore(t *testing.T) (context.Context, *Store)
```

#### <a id="Store.ActionEmailByIDInt64" href="#Store.ActionEmailByIDInt64">func (s *Store) ActionEmailByIDInt64(ctx context.Context, emailID int64) (m *MonitorEmail, err error)</a>

```
searchKey: codemonitors.Store.ActionEmailByIDInt64
tags: [method]
```

```Go
func (s *Store) ActionEmailByIDInt64(ctx context.Context, emailID int64) (m *MonitorEmail, err error)
```

#### <a id="Store.ActionJobForIDInt" href="#Store.ActionJobForIDInt">func (s *Store) ActionJobForIDInt(ctx context.Context, recordID int) (*ActionJob, error)</a>

```
searchKey: codemonitors.Store.ActionJobForIDInt
tags: [method]
```

```Go
func (s *Store) ActionJobForIDInt(ctx context.Context, recordID int) (*ActionJob, error)
```

#### <a id="Store.AllRecipientsForEmailIDInt64" href="#Store.AllRecipientsForEmailIDInt64">func (s *Store) AllRecipientsForEmailIDInt64(ctx context.Context, emailID int64) (rs []*Recipient, err error)</a>

```
searchKey: codemonitors.Store.AllRecipientsForEmailIDInt64
tags: [method]
```

```Go
func (s *Store) AllRecipientsForEmailIDInt64(ctx context.Context, emailID int64) (rs []*Recipient, err error)
```

#### <a id="Store.Clock" href="#Store.Clock">func (s *Store) Clock() func() time.Time</a>

```
searchKey: codemonitors.Store.Clock
tags: [method]
```

```Go
func (s *Store) Clock() func() time.Time
```

Clock returns the clock of the underlying store. 

#### <a id="Store.CreateActionEmail" href="#Store.CreateActionEmail">func (s *Store) CreateActionEmail(ctx context.Context, monitorID int64, action *graphqlbackend.CreateActionArgs) (e *MonitorEmail, err error)</a>

```
searchKey: codemonitors.Store.CreateActionEmail
tags: [method]
```

```Go
func (s *Store) CreateActionEmail(ctx context.Context, monitorID int64, action *graphqlbackend.CreateActionArgs) (e *MonitorEmail, err error)
```

#### <a id="Store.CreateActions" href="#Store.CreateActions">func (s *Store) CreateActions(ctx context.Context, args []*graphqlbackend.CreateActionArgs, monitorID int64) (err error)</a>

```
searchKey: codemonitors.Store.CreateActions
tags: [method]
```

```Go
func (s *Store) CreateActions(ctx context.Context, args []*graphqlbackend.CreateActionArgs, monitorID int64) (err error)
```

#### <a id="Store.CreateCodeMonitor" href="#Store.CreateCodeMonitor">func (s *Store) CreateCodeMonitor(ctx context.Context, args *graphqlbackend.CreateCodeMonitorArgs) (m *Monitor, err error)</a>

```
searchKey: codemonitors.Store.CreateCodeMonitor
tags: [method]
```

```Go
func (s *Store) CreateCodeMonitor(ctx context.Context, args *graphqlbackend.CreateCodeMonitorArgs) (m *Monitor, err error)
```

#### <a id="Store.CreateMonitor" href="#Store.CreateMonitor">func (s *Store) CreateMonitor(ctx context.Context, args *graphqlbackend.CreateMonitorArgs) (m *Monitor, err error)</a>

```
searchKey: codemonitors.Store.CreateMonitor
tags: [method]
```

```Go
func (s *Store) CreateMonitor(ctx context.Context, args *graphqlbackend.CreateMonitorArgs) (m *Monitor, err error)
```

#### <a id="Store.CreateRecipients" href="#Store.CreateRecipients">func (s *Store) CreateRecipients(ctx context.Context, recipients []graphql.ID, emailID int64) (err error)</a>

```
searchKey: codemonitors.Store.CreateRecipients
tags: [method]
```

```Go
func (s *Store) CreateRecipients(ctx context.Context, recipients []graphql.ID, emailID int64) (err error)
```

#### <a id="Store.CreateTriggerQuery" href="#Store.CreateTriggerQuery">func (s *Store) CreateTriggerQuery(ctx context.Context, monitorID int64, args *graphqlbackend.CreateTriggerArgs) (err error)</a>

```
searchKey: codemonitors.Store.CreateTriggerQuery
tags: [method]
```

```Go
func (s *Store) CreateTriggerQuery(ctx context.Context, monitorID int64, args *graphqlbackend.CreateTriggerArgs) (err error)
```

#### <a id="Store.DeleteActionsInt64" href="#Store.DeleteActionsInt64">func (s *Store) DeleteActionsInt64(ctx context.Context, actionIDs []int64, monitorID int64) (err error)</a>

```
searchKey: codemonitors.Store.DeleteActionsInt64
tags: [method]
```

```Go
func (s *Store) DeleteActionsInt64(ctx context.Context, actionIDs []int64, monitorID int64) (err error)
```

#### <a id="Store.DeleteMonitor" href="#Store.DeleteMonitor">func (s *Store) DeleteMonitor(ctx context.Context, args *graphqlbackend.DeleteCodeMonitorArgs) (err error)</a>

```
searchKey: codemonitors.Store.DeleteMonitor
tags: [method]
```

```Go
func (s *Store) DeleteMonitor(ctx context.Context, args *graphqlbackend.DeleteCodeMonitorArgs) (err error)
```

#### <a id="Store.DeleteObsoleteJobLogs" href="#Store.DeleteObsoleteJobLogs">func (s *Store) DeleteObsoleteJobLogs(ctx context.Context) error</a>

```
searchKey: codemonitors.Store.DeleteObsoleteJobLogs
tags: [method]
```

```Go
func (s *Store) DeleteObsoleteJobLogs(ctx context.Context) error
```

DeleteObsoleteJobLogs deletes all runs which are marked as completed and did not return results. 

#### <a id="Store.DeleteOldJobLogs" href="#Store.DeleteOldJobLogs">func (s *Store) DeleteOldJobLogs(ctx context.Context, retentionInDays int) error</a>

```
searchKey: codemonitors.Store.DeleteOldJobLogs
tags: [method]
```

```Go
func (s *Store) DeleteOldJobLogs(ctx context.Context, retentionInDays int) error
```

DeleteOldJobLogs deletes trigger jobs which have finished and are older than 'retention' days. Due to cascading, action jobs will be deleted as well. 

#### <a id="Store.DeleteRecipients" href="#Store.DeleteRecipients">func (s *Store) DeleteRecipients(ctx context.Context, emailID int64) (err error)</a>

```
searchKey: codemonitors.Store.DeleteRecipients
tags: [method]
```

```Go
func (s *Store) DeleteRecipients(ctx context.Context, emailID int64) (err error)
```

#### <a id="Store.EnqueueActionEmailsForQueryIDInt64" href="#Store.EnqueueActionEmailsForQueryIDInt64">func (s *Store) EnqueueActionEmailsForQueryIDInt64(ctx context.Context, queryID int64, triggerEventID int) (err error)</a>

```
searchKey: codemonitors.Store.EnqueueActionEmailsForQueryIDInt64
tags: [method]
```

```Go
func (s *Store) EnqueueActionEmailsForQueryIDInt64(ctx context.Context, queryID int64, triggerEventID int) (err error)
```

#### <a id="Store.EnqueueTriggerQueries" href="#Store.EnqueueTriggerQueries">func (s *Store) EnqueueTriggerQueries(ctx context.Context) (err error)</a>

```
searchKey: codemonitors.Store.EnqueueTriggerQueries
tags: [method]
```

```Go
func (s *Store) EnqueueTriggerQueries(ctx context.Context) (err error)
```

#### <a id="Store.GetActionJobMetadata" href="#Store.GetActionJobMetadata">func (s *Store) GetActionJobMetadata(ctx context.Context, recordID int) (m *ActionJobMetadata, err error)</a>

```
searchKey: codemonitors.Store.GetActionJobMetadata
tags: [method]
```

```Go
func (s *Store) GetActionJobMetadata(ctx context.Context, recordID int) (m *ActionJobMetadata, err error)
```

#### <a id="Store.GetEventsForQueryIDInt64" href="#Store.GetEventsForQueryIDInt64">func (s *Store) GetEventsForQueryIDInt64(ctx context.Context, queryID int64, args *graphqlbackend.ListEventsArgs) ([]*TriggerJobs, error)</a>

```
searchKey: codemonitors.Store.GetEventsForQueryIDInt64
tags: [method]
```

```Go
func (s *Store) GetEventsForQueryIDInt64(ctx context.Context, queryID int64, args *graphqlbackend.ListEventsArgs) ([]*TriggerJobs, error)
```

#### <a id="Store.GetQueryByRecordID" href="#Store.GetQueryByRecordID">func (s *Store) GetQueryByRecordID(ctx context.Context, recordID int) (query *MonitorQuery, err error)</a>

```
searchKey: codemonitors.Store.GetQueryByRecordID
tags: [method]
```

```Go
func (s *Store) GetQueryByRecordID(ctx context.Context, recordID int) (query *MonitorQuery, err error)
```

#### <a id="Store.LogSearch" href="#Store.LogSearch">func (s *Store) LogSearch(ctx context.Context, queryString string, numResults int, recordID int) error</a>

```
searchKey: codemonitors.Store.LogSearch
tags: [method]
```

```Go
func (s *Store) LogSearch(ctx context.Context, queryString string, numResults int, recordID int) error
```

#### <a id="Store.MonitorByIDInt64" href="#Store.MonitorByIDInt64">func (s *Store) MonitorByIDInt64(ctx context.Context, monitorID int64) (m *Monitor, err error)</a>

```
searchKey: codemonitors.Store.MonitorByIDInt64
tags: [method]
```

```Go
func (s *Store) MonitorByIDInt64(ctx context.Context, monitorID int64) (m *Monitor, err error)
```

#### <a id="Store.Monitors" href="#Store.Monitors">func (s *Store) Monitors(ctx context.Context, userID int32, args *graphqlbackend.ListMonitorsArgs) ([]*Monitor, error)</a>

```
searchKey: codemonitors.Store.Monitors
tags: [method]
```

```Go
func (s *Store) Monitors(ctx context.Context, userID int32, args *graphqlbackend.ListMonitorsArgs) ([]*Monitor, error)
```

#### <a id="Store.Now" href="#Store.Now">func (s *Store) Now() time.Time</a>

```
searchKey: codemonitors.Store.Now
tags: [method]
```

```Go
func (s *Store) Now() time.Time
```

#### <a id="Store.ReadActionEmailEvents" href="#Store.ReadActionEmailEvents">func (s *Store) ReadActionEmailEvents(ctx context.Context, emailID int64, triggerEventID *int, args *graphqlbackend.ListEventsArgs) (js []*ActionJob, err error)</a>

```
searchKey: codemonitors.Store.ReadActionEmailEvents
tags: [method]
```

```Go
func (s *Store) ReadActionEmailEvents(ctx context.Context, emailID int64, triggerEventID *int, args *graphqlbackend.ListEventsArgs) (js []*ActionJob, err error)
```

#### <a id="Store.ReadActionEmailQuery" href="#Store.ReadActionEmailQuery">func (s *Store) ReadActionEmailQuery(ctx context.Context, monitorID int64, args *graphqlbackend.ListActionArgs) (*sqlf.Query, error)</a>

```
searchKey: codemonitors.Store.ReadActionEmailQuery
tags: [method]
```

```Go
func (s *Store) ReadActionEmailQuery(ctx context.Context, monitorID int64, args *graphqlbackend.ListActionArgs) (*sqlf.Query, error)
```

#### <a id="Store.RecipientsForEmailIDInt64" href="#Store.RecipientsForEmailIDInt64">func (s *Store) RecipientsForEmailIDInt64(ctx context.Context, emailID int64, args *graphqlbackend.ListRecipientsArgs) ([]*Recipient, error)</a>

```
searchKey: codemonitors.Store.RecipientsForEmailIDInt64
tags: [method]
```

```Go
func (s *Store) RecipientsForEmailIDInt64(ctx context.Context, emailID int64, args *graphqlbackend.ListRecipientsArgs) ([]*Recipient, error)
```

#### <a id="Store.ResetTriggerQueryTimestamps" href="#Store.ResetTriggerQueryTimestamps">func (s *Store) ResetTriggerQueryTimestamps(ctx context.Context, queryID int64) error</a>

```
searchKey: codemonitors.Store.ResetTriggerQueryTimestamps
tags: [method]
```

```Go
func (s *Store) ResetTriggerQueryTimestamps(ctx context.Context, queryID int64) error
```

#### <a id="Store.SetTriggerQueryNextRun" href="#Store.SetTriggerQueryNextRun">func (s *Store) SetTriggerQueryNextRun(ctx context.Context, triggerQueryID int64, next time.Time, latestResults time.Time) error</a>

```
searchKey: codemonitors.Store.SetTriggerQueryNextRun
tags: [method]
```

```Go
func (s *Store) SetTriggerQueryNextRun(ctx context.Context, triggerQueryID int64, next time.Time, latestResults time.Time) error
```

#### <a id="Store.ToggleMonitor" href="#Store.ToggleMonitor">func (s *Store) ToggleMonitor(ctx context.Context, args *graphqlbackend.ToggleCodeMonitorArgs) (m *Monitor, err error)</a>

```
searchKey: codemonitors.Store.ToggleMonitor
tags: [method]
```

```Go
func (s *Store) ToggleMonitor(ctx context.Context, args *graphqlbackend.ToggleCodeMonitorArgs) (m *Monitor, err error)
```

#### <a id="Store.TotalActionEmailEvents" href="#Store.TotalActionEmailEvents">func (s *Store) TotalActionEmailEvents(ctx context.Context, emailID int64, triggerEventID *int) (totalCount int32, err error)</a>

```
searchKey: codemonitors.Store.TotalActionEmailEvents
tags: [method]
```

```Go
func (s *Store) TotalActionEmailEvents(ctx context.Context, emailID int64, triggerEventID *int) (totalCount int32, err error)
```

#### <a id="Store.TotalCountActionEmails" href="#Store.TotalCountActionEmails">func (s *Store) TotalCountActionEmails(ctx context.Context, monitorID int64) (count int32, err error)</a>

```
searchKey: codemonitors.Store.TotalCountActionEmails
tags: [method]
```

```Go
func (s *Store) TotalCountActionEmails(ctx context.Context, monitorID int64) (count int32, err error)
```

#### <a id="Store.TotalCountEventsForQueryIDInt64" href="#Store.TotalCountEventsForQueryIDInt64">func (s *Store) TotalCountEventsForQueryIDInt64(ctx context.Context, queryID int64) (totalCount int32, err error)</a>

```
searchKey: codemonitors.Store.TotalCountEventsForQueryIDInt64
tags: [method]
```

```Go
func (s *Store) TotalCountEventsForQueryIDInt64(ctx context.Context, queryID int64) (totalCount int32, err error)
```

#### <a id="Store.TotalCountMonitors" href="#Store.TotalCountMonitors">func (s *Store) TotalCountMonitors(ctx context.Context, userID int32) (count int32, err error)</a>

```
searchKey: codemonitors.Store.TotalCountMonitors
tags: [method]
```

```Go
func (s *Store) TotalCountMonitors(ctx context.Context, userID int32) (count int32, err error)
```

#### <a id="Store.TotalCountRecipients" href="#Store.TotalCountRecipients">func (s *Store) TotalCountRecipients(ctx context.Context, emailID int64) (count int32, err error)</a>

```
searchKey: codemonitors.Store.TotalCountRecipients
tags: [method]
```

```Go
func (s *Store) TotalCountRecipients(ctx context.Context, emailID int64) (count int32, err error)
```

#### <a id="Store.Transact" href="#Store.Transact">func (s *Store) Transact(ctx context.Context) (*Store, error)</a>

```
searchKey: codemonitors.Store.Transact
tags: [method]
```

```Go
func (s *Store) Transact(ctx context.Context) (*Store, error)
```

Transact creates a new transaction. It's required to implement this method and wrap the Transact method of the underlying basestore.Store. 

#### <a id="Store.TriggerQueryByMonitorIDInt64" href="#Store.TriggerQueryByMonitorIDInt64">func (s *Store) TriggerQueryByMonitorIDInt64(ctx context.Context, monitorID int64) (*MonitorQuery, error)</a>

```
searchKey: codemonitors.Store.TriggerQueryByMonitorIDInt64
tags: [method]
```

```Go
func (s *Store) TriggerQueryByMonitorIDInt64(ctx context.Context, monitorID int64) (*MonitorQuery, error)
```

#### <a id="Store.UpdateActionEmail" href="#Store.UpdateActionEmail">func (s *Store) UpdateActionEmail(ctx context.Context, monitorID int64, action *graphqlbackend.EditActionArgs) (e *MonitorEmail, err error)</a>

```
searchKey: codemonitors.Store.UpdateActionEmail
tags: [method]
```

```Go
func (s *Store) UpdateActionEmail(ctx context.Context, monitorID int64, action *graphqlbackend.EditActionArgs) (e *MonitorEmail, err error)
```

#### <a id="Store.UpdateMonitor" href="#Store.UpdateMonitor">func (s *Store) UpdateMonitor(ctx context.Context, args *graphqlbackend.UpdateCodeMonitorArgs) (m *Monitor, err error)</a>

```
searchKey: codemonitors.Store.UpdateMonitor
tags: [method]
```

```Go
func (s *Store) UpdateMonitor(ctx context.Context, args *graphqlbackend.UpdateCodeMonitorArgs) (m *Monitor, err error)
```

#### <a id="Store.UpdateTriggerQuery" href="#Store.UpdateTriggerQuery">func (s *Store) UpdateTriggerQuery(ctx context.Context, args *graphqlbackend.UpdateCodeMonitorArgs) (err error)</a>

```
searchKey: codemonitors.Store.UpdateTriggerQuery
tags: [method]
```

```Go
func (s *Store) UpdateTriggerQuery(ctx context.Context, args *graphqlbackend.UpdateCodeMonitorArgs) (err error)
```

#### <a id="Store.With" href="#Store.With">func (s *Store) With(other basestore.ShareableStore) *Store</a>

```
searchKey: codemonitors.Store.With
tags: [method]
```

```Go
func (s *Store) With(other basestore.ShareableStore) *Store
```

With creates a new store with the underlying database handle from the given store. 

#### <a id="Store.createActionEmailQuery" href="#Store.createActionEmailQuery">func (s *Store) createActionEmailQuery(ctx context.Context, monitorID int64, args *graphqlbackend.CreateActionEmailArgs) (*sqlf.Query, error)</a>

```
searchKey: codemonitors.Store.createActionEmailQuery
tags: [method private]
```

```Go
func (s *Store) createActionEmailQuery(ctx context.Context, monitorID int64, args *graphqlbackend.CreateActionEmailArgs) (*sqlf.Query, error)
```

#### <a id="Store.createCodeMonitorQuery" href="#Store.createCodeMonitorQuery">func (s *Store) createCodeMonitorQuery(ctx context.Context, args *graphqlbackend.CreateMonitorArgs) (*sqlf.Query, error)</a>

```
searchKey: codemonitors.Store.createCodeMonitorQuery
tags: [method private]
```

```Go
func (s *Store) createCodeMonitorQuery(ctx context.Context, args *graphqlbackend.CreateMonitorArgs) (*sqlf.Query, error)
```

#### <a id="Store.createRecipient" href="#Store.createRecipient">func (s *Store) createRecipient(ctx context.Context, recipient graphql.ID, emailID int64) (err error)</a>

```
searchKey: codemonitors.Store.createRecipient
tags: [method private]
```

```Go
func (s *Store) createRecipient(ctx context.Context, recipient graphql.ID, emailID int64) (err error)
```

#### <a id="Store.createTriggerQueryQuery" href="#Store.createTriggerQueryQuery">func (s *Store) createTriggerQueryQuery(ctx context.Context, monitorID int64, args *graphqlbackend.CreateTriggerArgs) (*sqlf.Query, error)</a>

```
searchKey: codemonitors.Store.createTriggerQueryQuery
tags: [method private]
```

```Go
func (s *Store) createTriggerQueryQuery(ctx context.Context, monitorID int64, args *graphqlbackend.CreateTriggerArgs) (*sqlf.Query, error)
```

#### <a id="Store.deleteMonitorQuery" href="#Store.deleteMonitorQuery">func (s *Store) deleteMonitorQuery(ctx context.Context, args *graphqlbackend.DeleteCodeMonitorArgs) (*sqlf.Query, error)</a>

```
searchKey: codemonitors.Store.deleteMonitorQuery
tags: [method private]
```

```Go
func (s *Store) deleteMonitorQuery(ctx context.Context, args *graphqlbackend.DeleteCodeMonitorArgs) (*sqlf.Query, error)
```

#### <a id="Store.insertTestMonitor" href="#Store.insertTestMonitor">func (s *Store) insertTestMonitor(ctx context.Context, t *testing.T) (*Monitor, error)</a>

```
searchKey: codemonitors.Store.insertTestMonitor
tags: [method private]
```

```Go
func (s *Store) insertTestMonitor(ctx context.Context, t *testing.T) (*Monitor, error)
```

#### <a id="Store.runActionJobQuery" href="#Store.runActionJobQuery">func (s *Store) runActionJobQuery(ctx context.Context, q *sqlf.Query) (ajs *ActionJob, err error)</a>

```
searchKey: codemonitors.Store.runActionJobQuery
tags: [method private]
```

```Go
func (s *Store) runActionJobQuery(ctx context.Context, q *sqlf.Query) (ajs *ActionJob, err error)
```

#### <a id="Store.runEmailQuery" href="#Store.runEmailQuery">func (s *Store) runEmailQuery(ctx context.Context, q *sqlf.Query) (*MonitorEmail, error)</a>

```
searchKey: codemonitors.Store.runEmailQuery
tags: [method private]
```

```Go
func (s *Store) runEmailQuery(ctx context.Context, q *sqlf.Query) (*MonitorEmail, error)
```

#### <a id="Store.runMonitorQuery" href="#Store.runMonitorQuery">func (s *Store) runMonitorQuery(ctx context.Context, q *sqlf.Query) (*Monitor, error)</a>

```
searchKey: codemonitors.Store.runMonitorQuery
tags: [method private]
```

```Go
func (s *Store) runMonitorQuery(ctx context.Context, q *sqlf.Query) (*Monitor, error)
```

#### <a id="Store.runTriggerQuery" href="#Store.runTriggerQuery">func (s *Store) runTriggerQuery(ctx context.Context, q *sqlf.Query) (*MonitorQuery, error)</a>

```
searchKey: codemonitors.Store.runTriggerQuery
tags: [method private]
```

```Go
func (s *Store) runTriggerQuery(ctx context.Context, q *sqlf.Query) (*MonitorQuery, error)
```

#### <a id="Store.toggleCodeMonitorQuery" href="#Store.toggleCodeMonitorQuery">func (s *Store) toggleCodeMonitorQuery(ctx context.Context, args *graphqlbackend.ToggleCodeMonitorArgs) (*sqlf.Query, error)</a>

```
searchKey: codemonitors.Store.toggleCodeMonitorQuery
tags: [method private]
```

```Go
func (s *Store) toggleCodeMonitorQuery(ctx context.Context, args *graphqlbackend.ToggleCodeMonitorArgs) (*sqlf.Query, error)
```

#### <a id="Store.triggerQueryByIDInt64" href="#Store.triggerQueryByIDInt64">func (s *Store) triggerQueryByIDInt64(ctx context.Context, queryID int64) (*MonitorQuery, error)</a>

```
searchKey: codemonitors.Store.triggerQueryByIDInt64
tags: [method private]
```

```Go
func (s *Store) triggerQueryByIDInt64(ctx context.Context, queryID int64) (*MonitorQuery, error)
```

#### <a id="Store.updateActionEmailQuery" href="#Store.updateActionEmailQuery">func (s *Store) updateActionEmailQuery(ctx context.Context, monitorID int64, args *graphqlbackend.EditActionEmailArgs) (q *sqlf.Query, err error)</a>

```
searchKey: codemonitors.Store.updateActionEmailQuery
tags: [method private]
```

```Go
func (s *Store) updateActionEmailQuery(ctx context.Context, monitorID int64, args *graphqlbackend.EditActionEmailArgs) (q *sqlf.Query, err error)
```

#### <a id="Store.updateCodeMonitorQuery" href="#Store.updateCodeMonitorQuery">func (s *Store) updateCodeMonitorQuery(ctx context.Context, args *graphqlbackend.UpdateCodeMonitorArgs) (*sqlf.Query, error)</a>

```
searchKey: codemonitors.Store.updateCodeMonitorQuery
tags: [method private]
```

```Go
func (s *Store) updateCodeMonitorQuery(ctx context.Context, args *graphqlbackend.UpdateCodeMonitorArgs) (*sqlf.Query, error)
```

#### <a id="Store.updateTriggerQueryQuery" href="#Store.updateTriggerQueryQuery">func (s *Store) updateTriggerQueryQuery(ctx context.Context, args *graphqlbackend.UpdateCodeMonitorArgs) (q *sqlf.Query, err error)</a>

```
searchKey: codemonitors.Store.updateTriggerQueryQuery
tags: [method private]
```

```Go
func (s *Store) updateTriggerQueryQuery(ctx context.Context, args *graphqlbackend.UpdateCodeMonitorArgs) (q *sqlf.Query, err error)
```

### <a id="TriggerJobs" href="#TriggerJobs">type TriggerJobs struct</a>

```
searchKey: codemonitors.TriggerJobs
tags: [struct]
```

```Go
type TriggerJobs struct {
	Id    int
	Query int64

	// The query we ran including after: filter.
	QueryString *string

	// Whether we got any results.
	Results    *bool
	NumResults *int

	// Fields demanded for any dbworker.
	State          string
	FailureMessage *string
	StartedAt      *time.Time
	FinishedAt     *time.Time
	ProcessAfter   *time.Time
	NumResets      int32
	NumFailures    int32
	LogContents    *string
}
```

#### <a id="TriggerJobs.RecordID" href="#TriggerJobs.RecordID">func (r *TriggerJobs) RecordID() int</a>

```
searchKey: codemonitors.TriggerJobs.RecordID
tags: [method]
```

```Go
func (r *TriggerJobs) RecordID() int
```

## <a id="func" href="#func">Functions</a>

```
tags: [private]
```

### <a id="ScanActionJobs" href="#ScanActionJobs">func ScanActionJobs(rows *sql.Rows, err error) (workerutil.Record, bool, error)</a>

```
searchKey: codemonitors.ScanActionJobs
tags: [function]
```

```Go
func ScanActionJobs(rows *sql.Rows, err error) (workerutil.Record, bool, error)
```

### <a id="ScanEmails" href="#ScanEmails">func ScanEmails(rows *sql.Rows) (ms []*MonitorEmail, err error)</a>

```
searchKey: codemonitors.ScanEmails
tags: [function]
```

```Go
func ScanEmails(rows *sql.Rows) (ms []*MonitorEmail, err error)
```

### <a id="ScanTriggerJobs" href="#ScanTriggerJobs">func ScanTriggerJobs(rows *sql.Rows, err error) (workerutil.Record, bool, error)</a>

```
searchKey: codemonitors.ScanTriggerJobs
tags: [function]
```

```Go
func ScanTriggerJobs(rows *sql.Rows, err error) (workerutil.Record, bool, error)
```

### <a id="TestAllRecipientsForEmailIDInt64" href="#TestAllRecipientsForEmailIDInt64">func TestAllRecipientsForEmailIDInt64(t *testing.T)</a>

```
searchKey: codemonitors.TestAllRecipientsForEmailIDInt64
tags: [function private test]
```

```Go
func TestAllRecipientsForEmailIDInt64(t *testing.T)
```

### <a id="TestDeleteOldJobLogs" href="#TestDeleteOldJobLogs">func TestDeleteOldJobLogs(t *testing.T)</a>

```
searchKey: codemonitors.TestDeleteOldJobLogs
tags: [function private test]
```

```Go
func TestDeleteOldJobLogs(t *testing.T)
```

### <a id="TestEnqueueActionEmailsForQueryIDInt64QueryByRecordID" href="#TestEnqueueActionEmailsForQueryIDInt64QueryByRecordID">func TestEnqueueActionEmailsForQueryIDInt64QueryByRecordID(t *testing.T)</a>

```
searchKey: codemonitors.TestEnqueueActionEmailsForQueryIDInt64QueryByRecordID
tags: [function private test]
```

```Go
func TestEnqueueActionEmailsForQueryIDInt64QueryByRecordID(t *testing.T)
```

### <a id="TestGetActionJobMetadata" href="#TestGetActionJobMetadata">func TestGetActionJobMetadata(t *testing.T)</a>

```
searchKey: codemonitors.TestGetActionJobMetadata
tags: [function private test]
```

```Go
func TestGetActionJobMetadata(t *testing.T)
```

### <a id="TestQueryByRecordID" href="#TestQueryByRecordID">func TestQueryByRecordID(t *testing.T)</a>

```
searchKey: codemonitors.TestQueryByRecordID
tags: [function private test]
```

```Go
func TestQueryByRecordID(t *testing.T)
```

### <a id="TestResetTriggerQueryTimestamps" href="#TestResetTriggerQueryTimestamps">func TestResetTriggerQueryTimestamps(t *testing.T)</a>

```
searchKey: codemonitors.TestResetTriggerQueryTimestamps
tags: [function private test]
```

```Go
func TestResetTriggerQueryTimestamps(t *testing.T)
```

### <a id="TestScanActionJobs" href="#TestScanActionJobs">func TestScanActionJobs(t *testing.T)</a>

```
searchKey: codemonitors.TestScanActionJobs
tags: [function private test]
```

```Go
func TestScanActionJobs(t *testing.T)
```

### <a id="TestTriggerQueryNextRun" href="#TestTriggerQueryNextRun">func TestTriggerQueryNextRun(t *testing.T)</a>

```
searchKey: codemonitors.TestTriggerQueryNextRun
tags: [function private test]
```

```Go
func TestTriggerQueryNextRun(t *testing.T)
```

### <a id="deleteActionsEmailQuery" href="#deleteActionsEmailQuery">func deleteActionsEmailQuery(ctx context.Context, actionIDs []int64, monitorID int64) (*sqlf.Query, error)</a>

```
searchKey: codemonitors.deleteActionsEmailQuery
tags: [function private]
```

```Go
func deleteActionsEmailQuery(ctx context.Context, actionIDs []int64, monitorID int64) (*sqlf.Query, error)
```

### <a id="deleteRecipientsQuery" href="#deleteRecipientsQuery">func deleteRecipientsQuery(ctx context.Context, emailId int64) (*sqlf.Query, error)</a>

```
searchKey: codemonitors.deleteRecipientsQuery
tags: [function private]
```

```Go
func deleteRecipientsQuery(ctx context.Context, emailId int64) (*sqlf.Query, error)
```

### <a id="init.main_test.go" href="#init.main_test.go">func init()</a>

```
searchKey: codemonitors.init
tags: [function private]
```

```Go
func init()
```

### <a id="insertTestUser" href="#insertTestUser">func insertTestUser(t *testing.T, db *sql.DB, name string, isAdmin bool) (userID int32)</a>

```
searchKey: codemonitors.insertTestUser
tags: [function private]
```

```Go
func insertTestUser(t *testing.T, db *sql.DB, name string, isAdmin bool) (userID int32)
```

### <a id="monitorsQuery" href="#monitorsQuery">func monitorsQuery(userID int32, args *graphqlbackend.ListMonitorsArgs) (*sqlf.Query, error)</a>

```
searchKey: codemonitors.monitorsQuery
tags: [function private]
```

```Go
func monitorsQuery(userID int32, args *graphqlbackend.ListMonitorsArgs) (*sqlf.Query, error)
```

### <a id="newTestUser" href="#newTestUser">func newTestUser(ctx context.Context, t *testing.T) (name string, id int32, namespace graphql.ID, userContext context.Context)</a>

```
searchKey: codemonitors.newTestUser
tags: [function private]
```

```Go
func newTestUser(ctx context.Context, t *testing.T) (name string, id int32, namespace graphql.ID, userContext context.Context)
```

### <a id="nilOrInt32" href="#nilOrInt32">func nilOrInt32(n int32) *int32</a>

```
searchKey: codemonitors.nilOrInt32
tags: [function private]
```

```Go
func nilOrInt32(n int32) *int32
```

### <a id="readRecipientQuery" href="#readRecipientQuery">func readRecipientQuery(ctx context.Context, emailId int64, args *graphqlbackend.ListRecipientsArgs) (*sqlf.Query, error)</a>

```
searchKey: codemonitors.readRecipientQuery
tags: [function private]
```

```Go
func readRecipientQuery(ctx context.Context, emailId int64, args *graphqlbackend.ListRecipientsArgs) (*sqlf.Query, error)
```

### <a id="scanActionJobs" href="#scanActionJobs">func scanActionJobs(rows *sql.Rows, err error) ([]*ActionJob, error)</a>

```
searchKey: codemonitors.scanActionJobs
tags: [function private]
```

```Go
func scanActionJobs(rows *sql.Rows, err error) ([]*ActionJob, error)
```

### <a id="scanMonitors" href="#scanMonitors">func scanMonitors(rows *sql.Rows) ([]*Monitor, error)</a>

```
searchKey: codemonitors.scanMonitors
tags: [function private]
```

```Go
func scanMonitors(rows *sql.Rows) ([]*Monitor, error)
```

### <a id="scanRecipients" href="#scanRecipients">func scanRecipients(rows *sql.Rows) (ms []*Recipient, err error)</a>

```
searchKey: codemonitors.scanRecipients
tags: [function private]
```

```Go
func scanRecipients(rows *sql.Rows) (ms []*Recipient, err error)
```

### <a id="scanTriggerJobs" href="#scanTriggerJobs">func scanTriggerJobs(rows *sql.Rows, err error) ([]*TriggerJobs, error)</a>

```
searchKey: codemonitors.scanTriggerJobs
tags: [function private]
```

```Go
func scanTriggerJobs(rows *sql.Rows, err error) ([]*TriggerJobs, error)
```

### <a id="scanTriggerQueries" href="#scanTriggerQueries">func scanTriggerQueries(rows *sql.Rows) (ms []*MonitorQuery, err error)</a>

```
searchKey: codemonitors.scanTriggerQueries
tags: [function private]
```

```Go
func scanTriggerQueries(rows *sql.Rows) (ms []*MonitorQuery, err error)
```

### <a id="unmarshalAfter" href="#unmarshalAfter">func unmarshalAfter(after *string) (int64, error)</a>

```
searchKey: codemonitors.unmarshalAfter
tags: [function private]
```

```Go
func unmarshalAfter(after *string) (int64, error)
```

