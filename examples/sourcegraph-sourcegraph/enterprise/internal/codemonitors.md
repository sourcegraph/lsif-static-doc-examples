# Package codemonitors

## Index

* Subpages
  * [enterprise/internal/codemonitors/background](codemonitors/background.md)
  * [enterprise/internal/codemonitors/email](codemonitors/email.md)
  * [enterprise/internal/codemonitors/resolvers](codemonitors/resolvers.md)
  * [enterprise/internal/codemonitors/storetest](codemonitors/storetest.md)
* [Constants](#const)
    * [const totalCountActionEmailsFmtStr](#totalCountActionEmailsFmtStr)
    * [const actionEmailByIDFmtStr](#actionEmailByIDFmtStr)
    * [const updateActionEmailFmtStr](#updateActionEmailFmtStr)
    * [const readActionEmailFmtStr](#readActionEmailFmtStr)
    * [const createActionEmailFmtStr](#createActionEmailFmtStr)
    * [const deleteActionEmailFmtStr](#deleteActionEmailFmtStr)
    * [const readActionEmailEventsFmtStr](#readActionEmailEventsFmtStr)
    * [const totalActionEmailEventsFmtStr](#totalActionEmailEventsFmtStr)
    * [const enqueueActionEmailFmtStr](#enqueueActionEmailFmtStr)
    * [const getActionJobMetadataFmtStr](#getActionJobMetadataFmtStr)
    * [const actionJobForIDFmtStr](#actionJobForIDFmtStr)
    * [const monitorByIDFmtStr](#monitorByIDFmtStr)
    * [const totalCountMonitorsFmtStr](#totalCountMonitorsFmtStr)
    * [const monitorsFmtStr](#monitorsFmtStr)
    * [const toggleCodeMonitorFmtStr](#toggleCodeMonitorFmtStr)
    * [const insertCodeMonitorFmtStr](#insertCodeMonitorFmtStr)
    * [const updateCodeMonitorFmtStr](#updateCodeMonitorFmtStr)
    * [const deleteMonitorFmtStr](#deleteMonitorFmtStr)
    * [const triggerQueryByMonitorFmtStr](#triggerQueryByMonitorFmtStr)
    * [const triggerQueryByIDFmtStr](#triggerQueryByIDFmtStr)
    * [const resetTriggerQueryTimestamps](#resetTriggerQueryTimestamps)
    * [const createTriggerQueryFmtStr](#createTriggerQueryFmtStr)
    * [const updateTriggerQueryFmtStr](#updateTriggerQueryFmtStr)
    * [const getQueryByRecordIDFmtStr](#getQueryByRecordIDFmtStr)
    * [const setTriggerQueryNextRunFmtStr](#setTriggerQueryNextRunFmtStr)
    * [const allRecipientsForEmailIDInt64FmtStr](#allRecipientsForEmailIDInt64FmtStr)
    * [const createRecipientFmtStr](#createRecipientFmtStr)
    * [const totalCountRecipientsFmtStr](#totalCountRecipientsFmtStr)
    * [const deleteRecipientFmtStr](#deleteRecipientFmtStr)
    * [const readRecipientQueryFmtStr](#readRecipientQueryFmtStr)
    * [const enqueueTriggerQueryFmtStr](#enqueueTriggerQueryFmtStr)
    * [const logSearchFmtStr](#logSearchFmtStr)
    * [const deleteObsoleteJobLogsFmtStr](#deleteObsoleteJobLogsFmtStr)
    * [const deleteOldJobLogsFmtStr](#deleteOldJobLogsFmtStr)
    * [const getEventsForQueryIDInt64FmtStr](#getEventsForQueryIDInt64FmtStr)
    * [const totalCountEventsForQueryIDInt64FmtStr](#totalCountEventsForQueryIDInt64FmtStr)
    * [const testQuery](#testQuery)
    * [const testDescription](#testDescription)
    * [const setToCompletedFmtStr](#setToCompletedFmtStr)
    * [const getJobIDs](#getJobIDs)
* [Variables](#var)
    * [var EmailsColumns](#EmailsColumns)
    * [var ActionJobsColumns](#ActionJobsColumns)
    * [var monitorColumns](#monitorColumns)
    * [var queryColumns](#queryColumns)
    * [var TriggerJobsColumns](#TriggerJobsColumns)
* [Types](#type)
    * [type MonitorEmail struct](#MonitorEmail)
    * [type ActionJob struct](#ActionJob)
        * [func (a *ActionJob) RecordID() int](#ActionJob.RecordID)
    * [type ActionJobMetadata struct](#ActionJobMetadata)
    * [type Monitor struct](#Monitor)
    * [type MonitorQuery struct](#MonitorQuery)
    * [type Recipient struct](#Recipient)
    * [type Store struct](#Store)
        * [func NewStore(db dbutil.DB) *Store](#NewStore)
        * [func NewStoreWithClock(db dbutil.DB, clock func() time.Time) *Store](#NewStoreWithClock)
        * [func newTestStore(t *testing.T) (context.Context, *Store)](#newTestStore)
        * [func (s *Store) UpdateActionEmail(ctx context.Context, monitorID int64, action *graphqlbackend.EditActionArgs) (e *MonitorEmail, err error)](#Store.UpdateActionEmail)
        * [func (s *Store) CreateActionEmail(ctx context.Context, monitorID int64, action *graphqlbackend.CreateActionArgs) (e *MonitorEmail, err error)](#Store.CreateActionEmail)
        * [func (s *Store) DeleteActionsInt64(ctx context.Context, actionIDs []int64, monitorID int64) (err error)](#Store.DeleteActionsInt64)
        * [func (s *Store) TotalCountActionEmails(ctx context.Context, monitorID int64) (count int32, err error)](#Store.TotalCountActionEmails)
        * [func (s *Store) ActionEmailByIDInt64(ctx context.Context, emailID int64) (m *MonitorEmail, err error)](#Store.ActionEmailByIDInt64)
        * [func (s *Store) runEmailQuery(ctx context.Context, q *sqlf.Query) (*MonitorEmail, error)](#Store.runEmailQuery)
        * [func (s *Store) updateActionEmailQuery(ctx context.Context, monitorID int64, args *graphqlbackend.EditActionEmailArgs) (q *sqlf.Query, err error)](#Store.updateActionEmailQuery)
        * [func (s *Store) ReadActionEmailQuery(ctx context.Context, monitorID int64, args *graphqlbackend.ListActionArgs) (*sqlf.Query, error)](#Store.ReadActionEmailQuery)
        * [func (s *Store) createActionEmailQuery(ctx context.Context, monitorID int64, args *graphqlbackend.CreateActionEmailArgs) (*sqlf.Query, error)](#Store.createActionEmailQuery)
        * [func (s *Store) ReadActionEmailEvents(ctx context.Context, emailID int64, triggerEventID *int, args *graphqlbackend.ListEventsArgs) (js []*ActionJob, err error)](#Store.ReadActionEmailEvents)
        * [func (s *Store) TotalActionEmailEvents(ctx context.Context, emailID int64, triggerEventID *int) (totalCount int32, err error)](#Store.TotalActionEmailEvents)
        * [func (s *Store) EnqueueActionEmailsForQueryIDInt64(ctx context.Context, queryID int64, triggerEventID int) (err error)](#Store.EnqueueActionEmailsForQueryIDInt64)
        * [func (s *Store) GetActionJobMetadata(ctx context.Context, recordID int) (m *ActionJobMetadata, err error)](#Store.GetActionJobMetadata)
        * [func (s *Store) ActionJobForIDInt(ctx context.Context, recordID int) (*ActionJob, error)](#Store.ActionJobForIDInt)
        * [func (s *Store) runActionJobQuery(ctx context.Context, q *sqlf.Query) (ajs *ActionJob, err error)](#Store.runActionJobQuery)
        * [func (s *Store) CreateActions(ctx context.Context, args []*graphqlbackend.CreateActionArgs, monitorID int64) (err error)](#Store.CreateActions)
        * [func (s *Store) CreateCodeMonitor(ctx context.Context, args *graphqlbackend.CreateCodeMonitorArgs) (m *Monitor, err error)](#Store.CreateCodeMonitor)
        * [func (s *Store) CreateMonitor(ctx context.Context, args *graphqlbackend.CreateMonitorArgs) (m *Monitor, err error)](#Store.CreateMonitor)
        * [func (s *Store) UpdateMonitor(ctx context.Context, args *graphqlbackend.UpdateCodeMonitorArgs) (m *Monitor, err error)](#Store.UpdateMonitor)
        * [func (s *Store) ToggleMonitor(ctx context.Context, args *graphqlbackend.ToggleCodeMonitorArgs) (m *Monitor, err error)](#Store.ToggleMonitor)
        * [func (s *Store) DeleteMonitor(ctx context.Context, args *graphqlbackend.DeleteCodeMonitorArgs) (err error)](#Store.DeleteMonitor)
        * [func (s *Store) Monitors(ctx context.Context, userID int32, args *graphqlbackend.ListMonitorsArgs) ([]*Monitor, error)](#Store.Monitors)
        * [func (s *Store) MonitorByIDInt64(ctx context.Context, monitorID int64) (m *Monitor, err error)](#Store.MonitorByIDInt64)
        * [func (s *Store) TotalCountMonitors(ctx context.Context, userID int32) (count int32, err error)](#Store.TotalCountMonitors)
        * [func (s *Store) toggleCodeMonitorQuery(ctx context.Context, args *graphqlbackend.ToggleCodeMonitorArgs) (*sqlf.Query, error)](#Store.toggleCodeMonitorQuery)
        * [func (s *Store) createCodeMonitorQuery(ctx context.Context, args *graphqlbackend.CreateMonitorArgs) (*sqlf.Query, error)](#Store.createCodeMonitorQuery)
        * [func (s *Store) updateCodeMonitorQuery(ctx context.Context, args *graphqlbackend.UpdateCodeMonitorArgs) (*sqlf.Query, error)](#Store.updateCodeMonitorQuery)
        * [func (s *Store) deleteMonitorQuery(ctx context.Context, args *graphqlbackend.DeleteCodeMonitorArgs) (*sqlf.Query, error)](#Store.deleteMonitorQuery)
        * [func (s *Store) runMonitorQuery(ctx context.Context, q *sqlf.Query) (*Monitor, error)](#Store.runMonitorQuery)
        * [func (s *Store) CreateTriggerQuery(ctx context.Context, monitorID int64, args *graphqlbackend.CreateTriggerArgs) (err error)](#Store.CreateTriggerQuery)
        * [func (s *Store) UpdateTriggerQuery(ctx context.Context, args *graphqlbackend.UpdateCodeMonitorArgs) (err error)](#Store.UpdateTriggerQuery)
        * [func (s *Store) TriggerQueryByMonitorIDInt64(ctx context.Context, monitorID int64) (*MonitorQuery, error)](#Store.TriggerQueryByMonitorIDInt64)
        * [func (s *Store) triggerQueryByIDInt64(ctx context.Context, queryID int64) (*MonitorQuery, error)](#Store.triggerQueryByIDInt64)
        * [func (s *Store) ResetTriggerQueryTimestamps(ctx context.Context, queryID int64) error](#Store.ResetTriggerQueryTimestamps)
        * [func (s *Store) createTriggerQueryQuery(ctx context.Context, monitorID int64, args *graphqlbackend.CreateTriggerArgs) (*sqlf.Query, error)](#Store.createTriggerQueryQuery)
        * [func (s *Store) updateTriggerQueryQuery(ctx context.Context, args *graphqlbackend.UpdateCodeMonitorArgs) (q *sqlf.Query, err error)](#Store.updateTriggerQueryQuery)
        * [func (s *Store) GetQueryByRecordID(ctx context.Context, recordID int) (query *MonitorQuery, err error)](#Store.GetQueryByRecordID)
        * [func (s *Store) SetTriggerQueryNextRun(ctx context.Context, triggerQueryID int64, next time.Time, latestResults time.Time) error](#Store.SetTriggerQueryNextRun)
        * [func (s *Store) runTriggerQuery(ctx context.Context, q *sqlf.Query) (*MonitorQuery, error)](#Store.runTriggerQuery)
        * [func (s *Store) CreateRecipients(ctx context.Context, recipients []graphql.ID, emailID int64) (err error)](#Store.CreateRecipients)
        * [func (s *Store) DeleteRecipients(ctx context.Context, emailID int64) (err error)](#Store.DeleteRecipients)
        * [func (s *Store) RecipientsForEmailIDInt64(ctx context.Context, emailID int64, args *graphqlbackend.ListRecipientsArgs) ([]*Recipient, error)](#Store.RecipientsForEmailIDInt64)
        * [func (s *Store) AllRecipientsForEmailIDInt64(ctx context.Context, emailID int64) (rs []*Recipient, err error)](#Store.AllRecipientsForEmailIDInt64)
        * [func (s *Store) createRecipient(ctx context.Context, recipient graphql.ID, emailID int64) (err error)](#Store.createRecipient)
        * [func (s *Store) TotalCountRecipients(ctx context.Context, emailID int64) (count int32, err error)](#Store.TotalCountRecipients)
        * [func (s *Store) With(other basestore.ShareableStore) *Store](#Store.With)
        * [func (s *Store) Clock() func() time.Time](#Store.Clock)
        * [func (s *Store) Now() time.Time](#Store.Now)
        * [func (s *Store) Transact(ctx context.Context) (*Store, error)](#Store.Transact)
        * [func (s *Store) EnqueueTriggerQueries(ctx context.Context) (err error)](#Store.EnqueueTriggerQueries)
        * [func (s *Store) LogSearch(ctx context.Context, queryString string, numResults int, recordID int) error](#Store.LogSearch)
        * [func (s *Store) DeleteObsoleteJobLogs(ctx context.Context) error](#Store.DeleteObsoleteJobLogs)
        * [func (s *Store) DeleteOldJobLogs(ctx context.Context, retentionInDays int) error](#Store.DeleteOldJobLogs)
        * [func (s *Store) GetEventsForQueryIDInt64(ctx context.Context, queryID int64, args *graphqlbackend.ListEventsArgs) ([]*TriggerJobs, error)](#Store.GetEventsForQueryIDInt64)
        * [func (s *Store) TotalCountEventsForQueryIDInt64(ctx context.Context, queryID int64) (totalCount int32, err error)](#Store.TotalCountEventsForQueryIDInt64)
        * [func (s *Store) insertTestMonitor(ctx context.Context, t *testing.T) (*Monitor, error)](#Store.insertTestMonitor)
    * [type TriggerJobs struct](#TriggerJobs)
        * [func (r *TriggerJobs) RecordID() int](#TriggerJobs.RecordID)
* [Functions](#func)
    * [func deleteActionsEmailQuery(ctx context.Context, actionIDs []int64, monitorID int64) (*sqlf.Query, error)](#deleteActionsEmailQuery)
    * [func ScanEmails(rows *sql.Rows) (ms []*MonitorEmail, err error)](#ScanEmails)
    * [func ScanActionJobs(rows *sql.Rows, err error) (workerutil.Record, bool, error)](#ScanActionJobs)
    * [func scanActionJobs(rows *sql.Rows, err error) ([]*ActionJob, error)](#scanActionJobs)
    * [func monitorsQuery(userID int32, args *graphqlbackend.ListMonitorsArgs) (*sqlf.Query, error)](#monitorsQuery)
    * [func scanMonitors(rows *sql.Rows) ([]*Monitor, error)](#scanMonitors)
    * [func scanTriggerQueries(rows *sql.Rows) (ms []*MonitorQuery, err error)](#scanTriggerQueries)
    * [func scanRecipients(rows *sql.Rows) (ms []*Recipient, err error)](#scanRecipients)
    * [func deleteRecipientsQuery(ctx context.Context, emailId int64) (*sqlf.Query, error)](#deleteRecipientsQuery)
    * [func readRecipientQuery(ctx context.Context, emailId int64, args *graphqlbackend.ListRecipientsArgs) (*sqlf.Query, error)](#readRecipientQuery)
    * [func nilOrInt32(n int32) *int32](#nilOrInt32)
    * [func ScanTriggerJobs(rows *sql.Rows, err error) (workerutil.Record, bool, error)](#ScanTriggerJobs)
    * [func scanTriggerJobs(rows *sql.Rows, err error) ([]*TriggerJobs, error)](#scanTriggerJobs)
    * [func unmarshalAfter(after *string) (int64, error)](#unmarshalAfter)
    * [func TestEnqueueActionEmailsForQueryIDInt64QueryByRecordID(t *testing.T)](#TestEnqueueActionEmailsForQueryIDInt64QueryByRecordID)
    * [func TestGetActionJobMetadata(t *testing.T)](#TestGetActionJobMetadata)
    * [func TestScanActionJobs(t *testing.T)](#TestScanActionJobs)
    * [func init()](#init.main_test.go)
    * [func newTestUser(ctx context.Context, t *testing.T) (name string, id int32, namespace graphql.ID, userContext context.Context)](#newTestUser)
    * [func insertTestUser(t *testing.T, db *sql.DB, name string, isAdmin bool) (userID int32)](#insertTestUser)
    * [func TestQueryByRecordID(t *testing.T)](#TestQueryByRecordID)
    * [func TestTriggerQueryNextRun(t *testing.T)](#TestTriggerQueryNextRun)
    * [func TestResetTriggerQueryTimestamps(t *testing.T)](#TestResetTriggerQueryTimestamps)
    * [func TestAllRecipientsForEmailIDInt64(t *testing.T)](#TestAllRecipientsForEmailIDInt64)
    * [func TestDeleteOldJobLogs(t *testing.T)](#TestDeleteOldJobLogs)


## <a id="const" href="#const">Constants</a>

```
tags: [private]
```

### <a id="totalCountActionEmailsFmtStr" href="#totalCountActionEmailsFmtStr">const totalCountActionEmailsFmtStr</a>

```
searchKey: codemonitors.totalCountActionEmailsFmtStr
tags: [private]
```

```Go
const totalCountActionEmailsFmtStr = `
SELECT COUNT(*)
FROM cm_emails
WHERE monitor = %s;
`
```

### <a id="actionEmailByIDFmtStr" href="#actionEmailByIDFmtStr">const actionEmailByIDFmtStr</a>

```
searchKey: codemonitors.actionEmailByIDFmtStr
tags: [private]
```

```Go
const actionEmailByIDFmtStr = ...
```

### <a id="updateActionEmailFmtStr" href="#updateActionEmailFmtStr">const updateActionEmailFmtStr</a>

```
searchKey: codemonitors.updateActionEmailFmtStr
tags: [private]
```

```Go
const updateActionEmailFmtStr = ...
```

### <a id="readActionEmailFmtStr" href="#readActionEmailFmtStr">const readActionEmailFmtStr</a>

```
searchKey: codemonitors.readActionEmailFmtStr
tags: [private]
```

```Go
const readActionEmailFmtStr = ...
```

### <a id="createActionEmailFmtStr" href="#createActionEmailFmtStr">const createActionEmailFmtStr</a>

```
searchKey: codemonitors.createActionEmailFmtStr
tags: [private]
```

```Go
const createActionEmailFmtStr = ...
```

### <a id="deleteActionEmailFmtStr" href="#deleteActionEmailFmtStr">const deleteActionEmailFmtStr</a>

```
searchKey: codemonitors.deleteActionEmailFmtStr
tags: [private]
```

```Go
const deleteActionEmailFmtStr = `DELETE FROM cm_emails WHERE id in (%s) AND MONITOR = %s`
```

### <a id="readActionEmailEventsFmtStr" href="#readActionEmailEventsFmtStr">const readActionEmailEventsFmtStr</a>

```
searchKey: codemonitors.readActionEmailEventsFmtStr
tags: [private]
```

```Go
const readActionEmailEventsFmtStr = ...
```

### <a id="totalActionEmailEventsFmtStr" href="#totalActionEmailEventsFmtStr">const totalActionEmailEventsFmtStr</a>

```
searchKey: codemonitors.totalActionEmailEventsFmtStr
tags: [private]
```

```Go
const totalActionEmailEventsFmtStr = `
SELECT COUNT(*)
FROM cm_action_jobs
WHERE %s
`
```

### <a id="enqueueActionEmailFmtStr" href="#enqueueActionEmailFmtStr">const enqueueActionEmailFmtStr</a>

```
searchKey: codemonitors.enqueueActionEmailFmtStr
tags: [private]
```

```Go
const enqueueActionEmailFmtStr = ...
```

### <a id="getActionJobMetadataFmtStr" href="#getActionJobMetadataFmtStr">const getActionJobMetadataFmtStr</a>

```
searchKey: codemonitors.getActionJobMetadataFmtStr
tags: [private]
```

```Go
const getActionJobMetadataFmtStr = ...
```

### <a id="actionJobForIDFmtStr" href="#actionJobForIDFmtStr">const actionJobForIDFmtStr</a>

```
searchKey: codemonitors.actionJobForIDFmtStr
tags: [private]
```

```Go
const actionJobForIDFmtStr = ...
```

### <a id="monitorByIDFmtStr" href="#monitorByIDFmtStr">const monitorByIDFmtStr</a>

```
searchKey: codemonitors.monitorByIDFmtStr
tags: [private]
```

```Go
const monitorByIDFmtStr = ...
```

### <a id="totalCountMonitorsFmtStr" href="#totalCountMonitorsFmtStr">const totalCountMonitorsFmtStr</a>

```
searchKey: codemonitors.totalCountMonitorsFmtStr
tags: [private]
```

```Go
const totalCountMonitorsFmtStr = `
SELECT COUNT(*)
FROM cm_monitors
WHERE namespace_user_id = %s;
`
```

### <a id="monitorsFmtStr" href="#monitorsFmtStr">const monitorsFmtStr</a>

```
searchKey: codemonitors.monitorsFmtStr
tags: [private]
```

```Go
const monitorsFmtStr = ...
```

### <a id="toggleCodeMonitorFmtStr" href="#toggleCodeMonitorFmtStr">const toggleCodeMonitorFmtStr</a>

```
searchKey: codemonitors.toggleCodeMonitorFmtStr
tags: [private]
```

```Go
const toggleCodeMonitorFmtStr = ...
```

### <a id="insertCodeMonitorFmtStr" href="#insertCodeMonitorFmtStr">const insertCodeMonitorFmtStr</a>

```
searchKey: codemonitors.insertCodeMonitorFmtStr
tags: [private]
```

```Go
const insertCodeMonitorFmtStr = ...
```

### <a id="updateCodeMonitorFmtStr" href="#updateCodeMonitorFmtStr">const updateCodeMonitorFmtStr</a>

```
searchKey: codemonitors.updateCodeMonitorFmtStr
tags: [private]
```

```Go
const updateCodeMonitorFmtStr = ...
```

### <a id="deleteMonitorFmtStr" href="#deleteMonitorFmtStr">const deleteMonitorFmtStr</a>

```
searchKey: codemonitors.deleteMonitorFmtStr
tags: [private]
```

```Go
const deleteMonitorFmtStr = `DELETE FROM cm_monitors WHERE id = %s`
```

### <a id="triggerQueryByMonitorFmtStr" href="#triggerQueryByMonitorFmtStr">const triggerQueryByMonitorFmtStr</a>

```
searchKey: codemonitors.triggerQueryByMonitorFmtStr
tags: [private]
```

```Go
const triggerQueryByMonitorFmtStr = ...
```

### <a id="triggerQueryByIDFmtStr" href="#triggerQueryByIDFmtStr">const triggerQueryByIDFmtStr</a>

```
searchKey: codemonitors.triggerQueryByIDFmtStr
tags: [private]
```

```Go
const triggerQueryByIDFmtStr = ...
```

### <a id="resetTriggerQueryTimestamps" href="#resetTriggerQueryTimestamps">const resetTriggerQueryTimestamps</a>

```
searchKey: codemonitors.resetTriggerQueryTimestamps
tags: [private]
```

```Go
const resetTriggerQueryTimestamps = ...
```

### <a id="createTriggerQueryFmtStr" href="#createTriggerQueryFmtStr">const createTriggerQueryFmtStr</a>

```
searchKey: codemonitors.createTriggerQueryFmtStr
tags: [private]
```

```Go
const createTriggerQueryFmtStr = ...
```

### <a id="updateTriggerQueryFmtStr" href="#updateTriggerQueryFmtStr">const updateTriggerQueryFmtStr</a>

```
searchKey: codemonitors.updateTriggerQueryFmtStr
tags: [private]
```

```Go
const updateTriggerQueryFmtStr = ...
```

### <a id="getQueryByRecordIDFmtStr" href="#getQueryByRecordIDFmtStr">const getQueryByRecordIDFmtStr</a>

```
searchKey: codemonitors.getQueryByRecordIDFmtStr
tags: [private]
```

```Go
const getQueryByRecordIDFmtStr = ...
```

### <a id="setTriggerQueryNextRunFmtStr" href="#setTriggerQueryNextRunFmtStr">const setTriggerQueryNextRunFmtStr</a>

```
searchKey: codemonitors.setTriggerQueryNextRunFmtStr
tags: [private]
```

```Go
const setTriggerQueryNextRunFmtStr = ...
```

### <a id="allRecipientsForEmailIDInt64FmtStr" href="#allRecipientsForEmailIDInt64FmtStr">const allRecipientsForEmailIDInt64FmtStr</a>

```
searchKey: codemonitors.allRecipientsForEmailIDInt64FmtStr
tags: [private]
```

```Go
const allRecipientsForEmailIDInt64FmtStr = ...
```

### <a id="createRecipientFmtStr" href="#createRecipientFmtStr">const createRecipientFmtStr</a>

```
searchKey: codemonitors.createRecipientFmtStr
tags: [private]
```

```Go
const createRecipientFmtStr = ...
```

### <a id="totalCountRecipientsFmtStr" href="#totalCountRecipientsFmtStr">const totalCountRecipientsFmtStr</a>

```
searchKey: codemonitors.totalCountRecipientsFmtStr
tags: [private]
```

```Go
const totalCountRecipientsFmtStr = `
SELECT COUNT(*)
FROM cm_recipients
WHERE email = %s
`
```

### <a id="deleteRecipientFmtStr" href="#deleteRecipientFmtStr">const deleteRecipientFmtStr</a>

```
searchKey: codemonitors.deleteRecipientFmtStr
tags: [private]
```

```Go
const deleteRecipientFmtStr = `DELETE FROM cm_recipients WHERE email = %s`
```

### <a id="readRecipientQueryFmtStr" href="#readRecipientQueryFmtStr">const readRecipientQueryFmtStr</a>

```
searchKey: codemonitors.readRecipientQueryFmtStr
tags: [private]
```

```Go
const readRecipientQueryFmtStr = ...
```

### <a id="enqueueTriggerQueryFmtStr" href="#enqueueTriggerQueryFmtStr">const enqueueTriggerQueryFmtStr</a>

```
searchKey: codemonitors.enqueueTriggerQueryFmtStr
tags: [private]
```

```Go
const enqueueTriggerQueryFmtStr = ...
```

### <a id="logSearchFmtStr" href="#logSearchFmtStr">const logSearchFmtStr</a>

```
searchKey: codemonitors.logSearchFmtStr
tags: [private]
```

```Go
const logSearchFmtStr = ...
```

### <a id="deleteObsoleteJobLogsFmtStr" href="#deleteObsoleteJobLogsFmtStr">const deleteObsoleteJobLogsFmtStr</a>

```
searchKey: codemonitors.deleteObsoleteJobLogsFmtStr
tags: [private]
```

```Go
const deleteObsoleteJobLogsFmtStr = ...
```

### <a id="deleteOldJobLogsFmtStr" href="#deleteOldJobLogsFmtStr">const deleteOldJobLogsFmtStr</a>

```
searchKey: codemonitors.deleteOldJobLogsFmtStr
tags: [private]
```

```Go
const deleteOldJobLogsFmtStr = ...
```

### <a id="getEventsForQueryIDInt64FmtStr" href="#getEventsForQueryIDInt64FmtStr">const getEventsForQueryIDInt64FmtStr</a>

```
searchKey: codemonitors.getEventsForQueryIDInt64FmtStr
tags: [private]
```

```Go
const getEventsForQueryIDInt64FmtStr = ...
```

### <a id="totalCountEventsForQueryIDInt64FmtStr" href="#totalCountEventsForQueryIDInt64FmtStr">const totalCountEventsForQueryIDInt64FmtStr</a>

```
searchKey: codemonitors.totalCountEventsForQueryIDInt64FmtStr
tags: [private]
```

```Go
const totalCountEventsForQueryIDInt64FmtStr = ...
```

### <a id="testQuery" href="#testQuery">const testQuery</a>

```
searchKey: codemonitors.testQuery
tags: [private]
```

```Go
const testQuery = "repo:github\\.com/sourcegraph/sourcegraph func type:diff patternType:literal"
```

### <a id="testDescription" href="#testDescription">const testDescription</a>

```
searchKey: codemonitors.testDescription
tags: [private]
```

```Go
const testDescription = "test description"
```

### <a id="setToCompletedFmtStr" href="#setToCompletedFmtStr">const setToCompletedFmtStr</a>

```
searchKey: codemonitors.setToCompletedFmtStr
tags: [private]
```

```Go
const setToCompletedFmtStr = ...
```

### <a id="getJobIDs" href="#getJobIDs">const getJobIDs</a>

```
searchKey: codemonitors.getJobIDs
tags: [private]
```

```Go
const getJobIDs = `
SELECT id
FROM cm_trigger_jobs;
`
```

## <a id="var" href="#var">Variables</a>

```
tags: [private]
```

### <a id="EmailsColumns" href="#EmailsColumns">var EmailsColumns</a>

```
searchKey: codemonitors.EmailsColumns
```

```Go
var EmailsColumns = ...
```

### <a id="ActionJobsColumns" href="#ActionJobsColumns">var ActionJobsColumns</a>

```
searchKey: codemonitors.ActionJobsColumns
```

```Go
var ActionJobsColumns = ...
```

### <a id="monitorColumns" href="#monitorColumns">var monitorColumns</a>

```
searchKey: codemonitors.monitorColumns
tags: [private]
```

```Go
var monitorColumns = ...
```

### <a id="queryColumns" href="#queryColumns">var queryColumns</a>

```
searchKey: codemonitors.queryColumns
tags: [private]
```

```Go
var queryColumns = ...
```

### <a id="TriggerJobsColumns" href="#TriggerJobsColumns">var TriggerJobsColumns</a>

```
searchKey: codemonitors.TriggerJobsColumns
```

```Go
var TriggerJobsColumns = ...
```

## <a id="type" href="#type">Types</a>

```
tags: [private]
```

### <a id="MonitorEmail" href="#MonitorEmail">type MonitorEmail struct</a>

```
searchKey: codemonitors.MonitorEmail
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

### <a id="ActionJob" href="#ActionJob">type ActionJob struct</a>

```
searchKey: codemonitors.ActionJob
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
```

```Go
func (a *ActionJob) RecordID() int
```

### <a id="ActionJobMetadata" href="#ActionJobMetadata">type ActionJobMetadata struct</a>

```
searchKey: codemonitors.ActionJobMetadata
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

### <a id="MonitorQuery" href="#MonitorQuery">type MonitorQuery struct</a>

```
searchKey: codemonitors.MonitorQuery
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
```

```Go
func NewStore(db dbutil.DB) *Store
```

NewStore returns a new Store backed by the given database. 

#### <a id="NewStoreWithClock" href="#NewStoreWithClock">func NewStoreWithClock(db dbutil.DB, clock func() time.Time) *Store</a>

```
searchKey: codemonitors.NewStoreWithClock
```

```Go
func NewStoreWithClock(db dbutil.DB, clock func() time.Time) *Store
```

NewStoreWithClock returns a new Store backed by the given database and clock for timestamps. 

#### <a id="newTestStore" href="#newTestStore">func newTestStore(t *testing.T) (context.Context, *Store)</a>

```
searchKey: codemonitors.newTestStore
tags: [private]
```

```Go
func newTestStore(t *testing.T) (context.Context, *Store)
```

#### <a id="Store.UpdateActionEmail" href="#Store.UpdateActionEmail">func (s *Store) UpdateActionEmail(ctx context.Context, monitorID int64, action *graphqlbackend.EditActionArgs) (e *MonitorEmail, err error)</a>

```
searchKey: codemonitors.Store.UpdateActionEmail
```

```Go
func (s *Store) UpdateActionEmail(ctx context.Context, monitorID int64, action *graphqlbackend.EditActionArgs) (e *MonitorEmail, err error)
```

#### <a id="Store.CreateActionEmail" href="#Store.CreateActionEmail">func (s *Store) CreateActionEmail(ctx context.Context, monitorID int64, action *graphqlbackend.CreateActionArgs) (e *MonitorEmail, err error)</a>

```
searchKey: codemonitors.Store.CreateActionEmail
```

```Go
func (s *Store) CreateActionEmail(ctx context.Context, monitorID int64, action *graphqlbackend.CreateActionArgs) (e *MonitorEmail, err error)
```

#### <a id="Store.DeleteActionsInt64" href="#Store.DeleteActionsInt64">func (s *Store) DeleteActionsInt64(ctx context.Context, actionIDs []int64, monitorID int64) (err error)</a>

```
searchKey: codemonitors.Store.DeleteActionsInt64
```

```Go
func (s *Store) DeleteActionsInt64(ctx context.Context, actionIDs []int64, monitorID int64) (err error)
```

#### <a id="Store.TotalCountActionEmails" href="#Store.TotalCountActionEmails">func (s *Store) TotalCountActionEmails(ctx context.Context, monitorID int64) (count int32, err error)</a>

```
searchKey: codemonitors.Store.TotalCountActionEmails
```

```Go
func (s *Store) TotalCountActionEmails(ctx context.Context, monitorID int64) (count int32, err error)
```

#### <a id="Store.ActionEmailByIDInt64" href="#Store.ActionEmailByIDInt64">func (s *Store) ActionEmailByIDInt64(ctx context.Context, emailID int64) (m *MonitorEmail, err error)</a>

```
searchKey: codemonitors.Store.ActionEmailByIDInt64
```

```Go
func (s *Store) ActionEmailByIDInt64(ctx context.Context, emailID int64) (m *MonitorEmail, err error)
```

#### <a id="Store.runEmailQuery" href="#Store.runEmailQuery">func (s *Store) runEmailQuery(ctx context.Context, q *sqlf.Query) (*MonitorEmail, error)</a>

```
searchKey: codemonitors.Store.runEmailQuery
tags: [private]
```

```Go
func (s *Store) runEmailQuery(ctx context.Context, q *sqlf.Query) (*MonitorEmail, error)
```

#### <a id="Store.updateActionEmailQuery" href="#Store.updateActionEmailQuery">func (s *Store) updateActionEmailQuery(ctx context.Context, monitorID int64, args *graphqlbackend.EditActionEmailArgs) (q *sqlf.Query, err error)</a>

```
searchKey: codemonitors.Store.updateActionEmailQuery
tags: [private]
```

```Go
func (s *Store) updateActionEmailQuery(ctx context.Context, monitorID int64, args *graphqlbackend.EditActionEmailArgs) (q *sqlf.Query, err error)
```

#### <a id="Store.ReadActionEmailQuery" href="#Store.ReadActionEmailQuery">func (s *Store) ReadActionEmailQuery(ctx context.Context, monitorID int64, args *graphqlbackend.ListActionArgs) (*sqlf.Query, error)</a>

```
searchKey: codemonitors.Store.ReadActionEmailQuery
```

```Go
func (s *Store) ReadActionEmailQuery(ctx context.Context, monitorID int64, args *graphqlbackend.ListActionArgs) (*sqlf.Query, error)
```

#### <a id="Store.createActionEmailQuery" href="#Store.createActionEmailQuery">func (s *Store) createActionEmailQuery(ctx context.Context, monitorID int64, args *graphqlbackend.CreateActionEmailArgs) (*sqlf.Query, error)</a>

```
searchKey: codemonitors.Store.createActionEmailQuery
tags: [private]
```

```Go
func (s *Store) createActionEmailQuery(ctx context.Context, monitorID int64, args *graphqlbackend.CreateActionEmailArgs) (*sqlf.Query, error)
```

#### <a id="Store.ReadActionEmailEvents" href="#Store.ReadActionEmailEvents">func (s *Store) ReadActionEmailEvents(ctx context.Context, emailID int64, triggerEventID *int, args *graphqlbackend.ListEventsArgs) (js []*ActionJob, err error)</a>

```
searchKey: codemonitors.Store.ReadActionEmailEvents
```

```Go
func (s *Store) ReadActionEmailEvents(ctx context.Context, emailID int64, triggerEventID *int, args *graphqlbackend.ListEventsArgs) (js []*ActionJob, err error)
```

#### <a id="Store.TotalActionEmailEvents" href="#Store.TotalActionEmailEvents">func (s *Store) TotalActionEmailEvents(ctx context.Context, emailID int64, triggerEventID *int) (totalCount int32, err error)</a>

```
searchKey: codemonitors.Store.TotalActionEmailEvents
```

```Go
func (s *Store) TotalActionEmailEvents(ctx context.Context, emailID int64, triggerEventID *int) (totalCount int32, err error)
```

#### <a id="Store.EnqueueActionEmailsForQueryIDInt64" href="#Store.EnqueueActionEmailsForQueryIDInt64">func (s *Store) EnqueueActionEmailsForQueryIDInt64(ctx context.Context, queryID int64, triggerEventID int) (err error)</a>

```
searchKey: codemonitors.Store.EnqueueActionEmailsForQueryIDInt64
```

```Go
func (s *Store) EnqueueActionEmailsForQueryIDInt64(ctx context.Context, queryID int64, triggerEventID int) (err error)
```

#### <a id="Store.GetActionJobMetadata" href="#Store.GetActionJobMetadata">func (s *Store) GetActionJobMetadata(ctx context.Context, recordID int) (m *ActionJobMetadata, err error)</a>

```
searchKey: codemonitors.Store.GetActionJobMetadata
```

```Go
func (s *Store) GetActionJobMetadata(ctx context.Context, recordID int) (m *ActionJobMetadata, err error)
```

#### <a id="Store.ActionJobForIDInt" href="#Store.ActionJobForIDInt">func (s *Store) ActionJobForIDInt(ctx context.Context, recordID int) (*ActionJob, error)</a>

```
searchKey: codemonitors.Store.ActionJobForIDInt
```

```Go
func (s *Store) ActionJobForIDInt(ctx context.Context, recordID int) (*ActionJob, error)
```

#### <a id="Store.runActionJobQuery" href="#Store.runActionJobQuery">func (s *Store) runActionJobQuery(ctx context.Context, q *sqlf.Query) (ajs *ActionJob, err error)</a>

```
searchKey: codemonitors.Store.runActionJobQuery
tags: [private]
```

```Go
func (s *Store) runActionJobQuery(ctx context.Context, q *sqlf.Query) (ajs *ActionJob, err error)
```

#### <a id="Store.CreateActions" href="#Store.CreateActions">func (s *Store) CreateActions(ctx context.Context, args []*graphqlbackend.CreateActionArgs, monitorID int64) (err error)</a>

```
searchKey: codemonitors.Store.CreateActions
```

```Go
func (s *Store) CreateActions(ctx context.Context, args []*graphqlbackend.CreateActionArgs, monitorID int64) (err error)
```

#### <a id="Store.CreateCodeMonitor" href="#Store.CreateCodeMonitor">func (s *Store) CreateCodeMonitor(ctx context.Context, args *graphqlbackend.CreateCodeMonitorArgs) (m *Monitor, err error)</a>

```
searchKey: codemonitors.Store.CreateCodeMonitor
```

```Go
func (s *Store) CreateCodeMonitor(ctx context.Context, args *graphqlbackend.CreateCodeMonitorArgs) (m *Monitor, err error)
```

#### <a id="Store.CreateMonitor" href="#Store.CreateMonitor">func (s *Store) CreateMonitor(ctx context.Context, args *graphqlbackend.CreateMonitorArgs) (m *Monitor, err error)</a>

```
searchKey: codemonitors.Store.CreateMonitor
```

```Go
func (s *Store) CreateMonitor(ctx context.Context, args *graphqlbackend.CreateMonitorArgs) (m *Monitor, err error)
```

#### <a id="Store.UpdateMonitor" href="#Store.UpdateMonitor">func (s *Store) UpdateMonitor(ctx context.Context, args *graphqlbackend.UpdateCodeMonitorArgs) (m *Monitor, err error)</a>

```
searchKey: codemonitors.Store.UpdateMonitor
```

```Go
func (s *Store) UpdateMonitor(ctx context.Context, args *graphqlbackend.UpdateCodeMonitorArgs) (m *Monitor, err error)
```

#### <a id="Store.ToggleMonitor" href="#Store.ToggleMonitor">func (s *Store) ToggleMonitor(ctx context.Context, args *graphqlbackend.ToggleCodeMonitorArgs) (m *Monitor, err error)</a>

```
searchKey: codemonitors.Store.ToggleMonitor
```

```Go
func (s *Store) ToggleMonitor(ctx context.Context, args *graphqlbackend.ToggleCodeMonitorArgs) (m *Monitor, err error)
```

#### <a id="Store.DeleteMonitor" href="#Store.DeleteMonitor">func (s *Store) DeleteMonitor(ctx context.Context, args *graphqlbackend.DeleteCodeMonitorArgs) (err error)</a>

```
searchKey: codemonitors.Store.DeleteMonitor
```

```Go
func (s *Store) DeleteMonitor(ctx context.Context, args *graphqlbackend.DeleteCodeMonitorArgs) (err error)
```

#### <a id="Store.Monitors" href="#Store.Monitors">func (s *Store) Monitors(ctx context.Context, userID int32, args *graphqlbackend.ListMonitorsArgs) ([]*Monitor, error)</a>

```
searchKey: codemonitors.Store.Monitors
```

```Go
func (s *Store) Monitors(ctx context.Context, userID int32, args *graphqlbackend.ListMonitorsArgs) ([]*Monitor, error)
```

#### <a id="Store.MonitorByIDInt64" href="#Store.MonitorByIDInt64">func (s *Store) MonitorByIDInt64(ctx context.Context, monitorID int64) (m *Monitor, err error)</a>

```
searchKey: codemonitors.Store.MonitorByIDInt64
```

```Go
func (s *Store) MonitorByIDInt64(ctx context.Context, monitorID int64) (m *Monitor, err error)
```

#### <a id="Store.TotalCountMonitors" href="#Store.TotalCountMonitors">func (s *Store) TotalCountMonitors(ctx context.Context, userID int32) (count int32, err error)</a>

```
searchKey: codemonitors.Store.TotalCountMonitors
```

```Go
func (s *Store) TotalCountMonitors(ctx context.Context, userID int32) (count int32, err error)
```

#### <a id="Store.toggleCodeMonitorQuery" href="#Store.toggleCodeMonitorQuery">func (s *Store) toggleCodeMonitorQuery(ctx context.Context, args *graphqlbackend.ToggleCodeMonitorArgs) (*sqlf.Query, error)</a>

```
searchKey: codemonitors.Store.toggleCodeMonitorQuery
tags: [private]
```

```Go
func (s *Store) toggleCodeMonitorQuery(ctx context.Context, args *graphqlbackend.ToggleCodeMonitorArgs) (*sqlf.Query, error)
```

#### <a id="Store.createCodeMonitorQuery" href="#Store.createCodeMonitorQuery">func (s *Store) createCodeMonitorQuery(ctx context.Context, args *graphqlbackend.CreateMonitorArgs) (*sqlf.Query, error)</a>

```
searchKey: codemonitors.Store.createCodeMonitorQuery
tags: [private]
```

```Go
func (s *Store) createCodeMonitorQuery(ctx context.Context, args *graphqlbackend.CreateMonitorArgs) (*sqlf.Query, error)
```

#### <a id="Store.updateCodeMonitorQuery" href="#Store.updateCodeMonitorQuery">func (s *Store) updateCodeMonitorQuery(ctx context.Context, args *graphqlbackend.UpdateCodeMonitorArgs) (*sqlf.Query, error)</a>

```
searchKey: codemonitors.Store.updateCodeMonitorQuery
tags: [private]
```

```Go
func (s *Store) updateCodeMonitorQuery(ctx context.Context, args *graphqlbackend.UpdateCodeMonitorArgs) (*sqlf.Query, error)
```

#### <a id="Store.deleteMonitorQuery" href="#Store.deleteMonitorQuery">func (s *Store) deleteMonitorQuery(ctx context.Context, args *graphqlbackend.DeleteCodeMonitorArgs) (*sqlf.Query, error)</a>

```
searchKey: codemonitors.Store.deleteMonitorQuery
tags: [private]
```

```Go
func (s *Store) deleteMonitorQuery(ctx context.Context, args *graphqlbackend.DeleteCodeMonitorArgs) (*sqlf.Query, error)
```

#### <a id="Store.runMonitorQuery" href="#Store.runMonitorQuery">func (s *Store) runMonitorQuery(ctx context.Context, q *sqlf.Query) (*Monitor, error)</a>

```
searchKey: codemonitors.Store.runMonitorQuery
tags: [private]
```

```Go
func (s *Store) runMonitorQuery(ctx context.Context, q *sqlf.Query) (*Monitor, error)
```

#### <a id="Store.CreateTriggerQuery" href="#Store.CreateTriggerQuery">func (s *Store) CreateTriggerQuery(ctx context.Context, monitorID int64, args *graphqlbackend.CreateTriggerArgs) (err error)</a>

```
searchKey: codemonitors.Store.CreateTriggerQuery
```

```Go
func (s *Store) CreateTriggerQuery(ctx context.Context, monitorID int64, args *graphqlbackend.CreateTriggerArgs) (err error)
```

#### <a id="Store.UpdateTriggerQuery" href="#Store.UpdateTriggerQuery">func (s *Store) UpdateTriggerQuery(ctx context.Context, args *graphqlbackend.UpdateCodeMonitorArgs) (err error)</a>

```
searchKey: codemonitors.Store.UpdateTriggerQuery
```

```Go
func (s *Store) UpdateTriggerQuery(ctx context.Context, args *graphqlbackend.UpdateCodeMonitorArgs) (err error)
```

#### <a id="Store.TriggerQueryByMonitorIDInt64" href="#Store.TriggerQueryByMonitorIDInt64">func (s *Store) TriggerQueryByMonitorIDInt64(ctx context.Context, monitorID int64) (*MonitorQuery, error)</a>

```
searchKey: codemonitors.Store.TriggerQueryByMonitorIDInt64
```

```Go
func (s *Store) TriggerQueryByMonitorIDInt64(ctx context.Context, monitorID int64) (*MonitorQuery, error)
```

#### <a id="Store.triggerQueryByIDInt64" href="#Store.triggerQueryByIDInt64">func (s *Store) triggerQueryByIDInt64(ctx context.Context, queryID int64) (*MonitorQuery, error)</a>

```
searchKey: codemonitors.Store.triggerQueryByIDInt64
tags: [private]
```

```Go
func (s *Store) triggerQueryByIDInt64(ctx context.Context, queryID int64) (*MonitorQuery, error)
```

#### <a id="Store.ResetTriggerQueryTimestamps" href="#Store.ResetTriggerQueryTimestamps">func (s *Store) ResetTriggerQueryTimestamps(ctx context.Context, queryID int64) error</a>

```
searchKey: codemonitors.Store.ResetTriggerQueryTimestamps
```

```Go
func (s *Store) ResetTriggerQueryTimestamps(ctx context.Context, queryID int64) error
```

#### <a id="Store.createTriggerQueryQuery" href="#Store.createTriggerQueryQuery">func (s *Store) createTriggerQueryQuery(ctx context.Context, monitorID int64, args *graphqlbackend.CreateTriggerArgs) (*sqlf.Query, error)</a>

```
searchKey: codemonitors.Store.createTriggerQueryQuery
tags: [private]
```

```Go
func (s *Store) createTriggerQueryQuery(ctx context.Context, monitorID int64, args *graphqlbackend.CreateTriggerArgs) (*sqlf.Query, error)
```

#### <a id="Store.updateTriggerQueryQuery" href="#Store.updateTriggerQueryQuery">func (s *Store) updateTriggerQueryQuery(ctx context.Context, args *graphqlbackend.UpdateCodeMonitorArgs) (q *sqlf.Query, err error)</a>

```
searchKey: codemonitors.Store.updateTriggerQueryQuery
tags: [private]
```

```Go
func (s *Store) updateTriggerQueryQuery(ctx context.Context, args *graphqlbackend.UpdateCodeMonitorArgs) (q *sqlf.Query, err error)
```

#### <a id="Store.GetQueryByRecordID" href="#Store.GetQueryByRecordID">func (s *Store) GetQueryByRecordID(ctx context.Context, recordID int) (query *MonitorQuery, err error)</a>

```
searchKey: codemonitors.Store.GetQueryByRecordID
```

```Go
func (s *Store) GetQueryByRecordID(ctx context.Context, recordID int) (query *MonitorQuery, err error)
```

#### <a id="Store.SetTriggerQueryNextRun" href="#Store.SetTriggerQueryNextRun">func (s *Store) SetTriggerQueryNextRun(ctx context.Context, triggerQueryID int64, next time.Time, latestResults time.Time) error</a>

```
searchKey: codemonitors.Store.SetTriggerQueryNextRun
```

```Go
func (s *Store) SetTriggerQueryNextRun(ctx context.Context, triggerQueryID int64, next time.Time, latestResults time.Time) error
```

#### <a id="Store.runTriggerQuery" href="#Store.runTriggerQuery">func (s *Store) runTriggerQuery(ctx context.Context, q *sqlf.Query) (*MonitorQuery, error)</a>

```
searchKey: codemonitors.Store.runTriggerQuery
tags: [private]
```

```Go
func (s *Store) runTriggerQuery(ctx context.Context, q *sqlf.Query) (*MonitorQuery, error)
```

#### <a id="Store.CreateRecipients" href="#Store.CreateRecipients">func (s *Store) CreateRecipients(ctx context.Context, recipients []graphql.ID, emailID int64) (err error)</a>

```
searchKey: codemonitors.Store.CreateRecipients
```

```Go
func (s *Store) CreateRecipients(ctx context.Context, recipients []graphql.ID, emailID int64) (err error)
```

#### <a id="Store.DeleteRecipients" href="#Store.DeleteRecipients">func (s *Store) DeleteRecipients(ctx context.Context, emailID int64) (err error)</a>

```
searchKey: codemonitors.Store.DeleteRecipients
```

```Go
func (s *Store) DeleteRecipients(ctx context.Context, emailID int64) (err error)
```

#### <a id="Store.RecipientsForEmailIDInt64" href="#Store.RecipientsForEmailIDInt64">func (s *Store) RecipientsForEmailIDInt64(ctx context.Context, emailID int64, args *graphqlbackend.ListRecipientsArgs) ([]*Recipient, error)</a>

```
searchKey: codemonitors.Store.RecipientsForEmailIDInt64
```

```Go
func (s *Store) RecipientsForEmailIDInt64(ctx context.Context, emailID int64, args *graphqlbackend.ListRecipientsArgs) ([]*Recipient, error)
```

#### <a id="Store.AllRecipientsForEmailIDInt64" href="#Store.AllRecipientsForEmailIDInt64">func (s *Store) AllRecipientsForEmailIDInt64(ctx context.Context, emailID int64) (rs []*Recipient, err error)</a>

```
searchKey: codemonitors.Store.AllRecipientsForEmailIDInt64
```

```Go
func (s *Store) AllRecipientsForEmailIDInt64(ctx context.Context, emailID int64) (rs []*Recipient, err error)
```

#### <a id="Store.createRecipient" href="#Store.createRecipient">func (s *Store) createRecipient(ctx context.Context, recipient graphql.ID, emailID int64) (err error)</a>

```
searchKey: codemonitors.Store.createRecipient
tags: [private]
```

```Go
func (s *Store) createRecipient(ctx context.Context, recipient graphql.ID, emailID int64) (err error)
```

#### <a id="Store.TotalCountRecipients" href="#Store.TotalCountRecipients">func (s *Store) TotalCountRecipients(ctx context.Context, emailID int64) (count int32, err error)</a>

```
searchKey: codemonitors.Store.TotalCountRecipients
```

```Go
func (s *Store) TotalCountRecipients(ctx context.Context, emailID int64) (count int32, err error)
```

#### <a id="Store.With" href="#Store.With">func (s *Store) With(other basestore.ShareableStore) *Store</a>

```
searchKey: codemonitors.Store.With
```

```Go
func (s *Store) With(other basestore.ShareableStore) *Store
```

With creates a new store with the underlying database handle from the given store. 

#### <a id="Store.Clock" href="#Store.Clock">func (s *Store) Clock() func() time.Time</a>

```
searchKey: codemonitors.Store.Clock
```

```Go
func (s *Store) Clock() func() time.Time
```

Clock returns the clock of the underlying store. 

#### <a id="Store.Now" href="#Store.Now">func (s *Store) Now() time.Time</a>

```
searchKey: codemonitors.Store.Now
```

```Go
func (s *Store) Now() time.Time
```

#### <a id="Store.Transact" href="#Store.Transact">func (s *Store) Transact(ctx context.Context) (*Store, error)</a>

```
searchKey: codemonitors.Store.Transact
```

```Go
func (s *Store) Transact(ctx context.Context) (*Store, error)
```

Transact creates a new transaction. It's required to implement this method and wrap the Transact method of the underlying basestore.Store. 

#### <a id="Store.EnqueueTriggerQueries" href="#Store.EnqueueTriggerQueries">func (s *Store) EnqueueTriggerQueries(ctx context.Context) (err error)</a>

```
searchKey: codemonitors.Store.EnqueueTriggerQueries
```

```Go
func (s *Store) EnqueueTriggerQueries(ctx context.Context) (err error)
```

#### <a id="Store.LogSearch" href="#Store.LogSearch">func (s *Store) LogSearch(ctx context.Context, queryString string, numResults int, recordID int) error</a>

```
searchKey: codemonitors.Store.LogSearch
```

```Go
func (s *Store) LogSearch(ctx context.Context, queryString string, numResults int, recordID int) error
```

#### <a id="Store.DeleteObsoleteJobLogs" href="#Store.DeleteObsoleteJobLogs">func (s *Store) DeleteObsoleteJobLogs(ctx context.Context) error</a>

```
searchKey: codemonitors.Store.DeleteObsoleteJobLogs
```

```Go
func (s *Store) DeleteObsoleteJobLogs(ctx context.Context) error
```

DeleteObsoleteJobLogs deletes all runs which are marked as completed and did not return results. 

#### <a id="Store.DeleteOldJobLogs" href="#Store.DeleteOldJobLogs">func (s *Store) DeleteOldJobLogs(ctx context.Context, retentionInDays int) error</a>

```
searchKey: codemonitors.Store.DeleteOldJobLogs
```

```Go
func (s *Store) DeleteOldJobLogs(ctx context.Context, retentionInDays int) error
```

DeleteOldJobLogs deletes trigger jobs which have finished and are older than 'retention' days. Due to cascading, action jobs will be deleted as well. 

#### <a id="Store.GetEventsForQueryIDInt64" href="#Store.GetEventsForQueryIDInt64">func (s *Store) GetEventsForQueryIDInt64(ctx context.Context, queryID int64, args *graphqlbackend.ListEventsArgs) ([]*TriggerJobs, error)</a>

```
searchKey: codemonitors.Store.GetEventsForQueryIDInt64
```

```Go
func (s *Store) GetEventsForQueryIDInt64(ctx context.Context, queryID int64, args *graphqlbackend.ListEventsArgs) ([]*TriggerJobs, error)
```

#### <a id="Store.TotalCountEventsForQueryIDInt64" href="#Store.TotalCountEventsForQueryIDInt64">func (s *Store) TotalCountEventsForQueryIDInt64(ctx context.Context, queryID int64) (totalCount int32, err error)</a>

```
searchKey: codemonitors.Store.TotalCountEventsForQueryIDInt64
```

```Go
func (s *Store) TotalCountEventsForQueryIDInt64(ctx context.Context, queryID int64) (totalCount int32, err error)
```

#### <a id="Store.insertTestMonitor" href="#Store.insertTestMonitor">func (s *Store) insertTestMonitor(ctx context.Context, t *testing.T) (*Monitor, error)</a>

```
searchKey: codemonitors.Store.insertTestMonitor
tags: [private]
```

```Go
func (s *Store) insertTestMonitor(ctx context.Context, t *testing.T) (*Monitor, error)
```

### <a id="TriggerJobs" href="#TriggerJobs">type TriggerJobs struct</a>

```
searchKey: codemonitors.TriggerJobs
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
```

```Go
func (r *TriggerJobs) RecordID() int
```

## <a id="func" href="#func">Functions</a>

```
tags: [private]
```

### <a id="deleteActionsEmailQuery" href="#deleteActionsEmailQuery">func deleteActionsEmailQuery(ctx context.Context, actionIDs []int64, monitorID int64) (*sqlf.Query, error)</a>

```
searchKey: codemonitors.deleteActionsEmailQuery
tags: [private]
```

```Go
func deleteActionsEmailQuery(ctx context.Context, actionIDs []int64, monitorID int64) (*sqlf.Query, error)
```

### <a id="ScanEmails" href="#ScanEmails">func ScanEmails(rows *sql.Rows) (ms []*MonitorEmail, err error)</a>

```
searchKey: codemonitors.ScanEmails
```

```Go
func ScanEmails(rows *sql.Rows) (ms []*MonitorEmail, err error)
```

### <a id="ScanActionJobs" href="#ScanActionJobs">func ScanActionJobs(rows *sql.Rows, err error) (workerutil.Record, bool, error)</a>

```
searchKey: codemonitors.ScanActionJobs
```

```Go
func ScanActionJobs(rows *sql.Rows, err error) (workerutil.Record, bool, error)
```

### <a id="scanActionJobs" href="#scanActionJobs">func scanActionJobs(rows *sql.Rows, err error) ([]*ActionJob, error)</a>

```
searchKey: codemonitors.scanActionJobs
tags: [private]
```

```Go
func scanActionJobs(rows *sql.Rows, err error) ([]*ActionJob, error)
```

### <a id="monitorsQuery" href="#monitorsQuery">func monitorsQuery(userID int32, args *graphqlbackend.ListMonitorsArgs) (*sqlf.Query, error)</a>

```
searchKey: codemonitors.monitorsQuery
tags: [private]
```

```Go
func monitorsQuery(userID int32, args *graphqlbackend.ListMonitorsArgs) (*sqlf.Query, error)
```

### <a id="scanMonitors" href="#scanMonitors">func scanMonitors(rows *sql.Rows) ([]*Monitor, error)</a>

```
searchKey: codemonitors.scanMonitors
tags: [private]
```

```Go
func scanMonitors(rows *sql.Rows) ([]*Monitor, error)
```

### <a id="scanTriggerQueries" href="#scanTriggerQueries">func scanTriggerQueries(rows *sql.Rows) (ms []*MonitorQuery, err error)</a>

```
searchKey: codemonitors.scanTriggerQueries
tags: [private]
```

```Go
func scanTriggerQueries(rows *sql.Rows) (ms []*MonitorQuery, err error)
```

### <a id="scanRecipients" href="#scanRecipients">func scanRecipients(rows *sql.Rows) (ms []*Recipient, err error)</a>

```
searchKey: codemonitors.scanRecipients
tags: [private]
```

```Go
func scanRecipients(rows *sql.Rows) (ms []*Recipient, err error)
```

### <a id="deleteRecipientsQuery" href="#deleteRecipientsQuery">func deleteRecipientsQuery(ctx context.Context, emailId int64) (*sqlf.Query, error)</a>

```
searchKey: codemonitors.deleteRecipientsQuery
tags: [private]
```

```Go
func deleteRecipientsQuery(ctx context.Context, emailId int64) (*sqlf.Query, error)
```

### <a id="readRecipientQuery" href="#readRecipientQuery">func readRecipientQuery(ctx context.Context, emailId int64, args *graphqlbackend.ListRecipientsArgs) (*sqlf.Query, error)</a>

```
searchKey: codemonitors.readRecipientQuery
tags: [private]
```

```Go
func readRecipientQuery(ctx context.Context, emailId int64, args *graphqlbackend.ListRecipientsArgs) (*sqlf.Query, error)
```

### <a id="nilOrInt32" href="#nilOrInt32">func nilOrInt32(n int32) *int32</a>

```
searchKey: codemonitors.nilOrInt32
tags: [private]
```

```Go
func nilOrInt32(n int32) *int32
```

### <a id="ScanTriggerJobs" href="#ScanTriggerJobs">func ScanTriggerJobs(rows *sql.Rows, err error) (workerutil.Record, bool, error)</a>

```
searchKey: codemonitors.ScanTriggerJobs
```

```Go
func ScanTriggerJobs(rows *sql.Rows, err error) (workerutil.Record, bool, error)
```

### <a id="scanTriggerJobs" href="#scanTriggerJobs">func scanTriggerJobs(rows *sql.Rows, err error) ([]*TriggerJobs, error)</a>

```
searchKey: codemonitors.scanTriggerJobs
tags: [private]
```

```Go
func scanTriggerJobs(rows *sql.Rows, err error) ([]*TriggerJobs, error)
```

### <a id="unmarshalAfter" href="#unmarshalAfter">func unmarshalAfter(after *string) (int64, error)</a>

```
searchKey: codemonitors.unmarshalAfter
tags: [private]
```

```Go
func unmarshalAfter(after *string) (int64, error)
```

### <a id="TestEnqueueActionEmailsForQueryIDInt64QueryByRecordID" href="#TestEnqueueActionEmailsForQueryIDInt64QueryByRecordID">func TestEnqueueActionEmailsForQueryIDInt64QueryByRecordID(t *testing.T)</a>

```
searchKey: codemonitors.TestEnqueueActionEmailsForQueryIDInt64QueryByRecordID
tags: [private]
```

```Go
func TestEnqueueActionEmailsForQueryIDInt64QueryByRecordID(t *testing.T)
```

### <a id="TestGetActionJobMetadata" href="#TestGetActionJobMetadata">func TestGetActionJobMetadata(t *testing.T)</a>

```
searchKey: codemonitors.TestGetActionJobMetadata
tags: [private]
```

```Go
func TestGetActionJobMetadata(t *testing.T)
```

### <a id="TestScanActionJobs" href="#TestScanActionJobs">func TestScanActionJobs(t *testing.T)</a>

```
searchKey: codemonitors.TestScanActionJobs
tags: [private]
```

```Go
func TestScanActionJobs(t *testing.T)
```

### <a id="init.main_test.go" href="#init.main_test.go">func init()</a>

```
searchKey: codemonitors.init
tags: [private]
```

```Go
func init()
```

### <a id="newTestUser" href="#newTestUser">func newTestUser(ctx context.Context, t *testing.T) (name string, id int32, namespace graphql.ID, userContext context.Context)</a>

```
searchKey: codemonitors.newTestUser
tags: [private]
```

```Go
func newTestUser(ctx context.Context, t *testing.T) (name string, id int32, namespace graphql.ID, userContext context.Context)
```

### <a id="insertTestUser" href="#insertTestUser">func insertTestUser(t *testing.T, db *sql.DB, name string, isAdmin bool) (userID int32)</a>

```
searchKey: codemonitors.insertTestUser
tags: [private]
```

```Go
func insertTestUser(t *testing.T, db *sql.DB, name string, isAdmin bool) (userID int32)
```

### <a id="TestQueryByRecordID" href="#TestQueryByRecordID">func TestQueryByRecordID(t *testing.T)</a>

```
searchKey: codemonitors.TestQueryByRecordID
tags: [private]
```

```Go
func TestQueryByRecordID(t *testing.T)
```

### <a id="TestTriggerQueryNextRun" href="#TestTriggerQueryNextRun">func TestTriggerQueryNextRun(t *testing.T)</a>

```
searchKey: codemonitors.TestTriggerQueryNextRun
tags: [private]
```

```Go
func TestTriggerQueryNextRun(t *testing.T)
```

### <a id="TestResetTriggerQueryTimestamps" href="#TestResetTriggerQueryTimestamps">func TestResetTriggerQueryTimestamps(t *testing.T)</a>

```
searchKey: codemonitors.TestResetTriggerQueryTimestamps
tags: [private]
```

```Go
func TestResetTriggerQueryTimestamps(t *testing.T)
```

### <a id="TestAllRecipientsForEmailIDInt64" href="#TestAllRecipientsForEmailIDInt64">func TestAllRecipientsForEmailIDInt64(t *testing.T)</a>

```
searchKey: codemonitors.TestAllRecipientsForEmailIDInt64
tags: [private]
```

```Go
func TestAllRecipientsForEmailIDInt64(t *testing.T)
```

### <a id="TestDeleteOldJobLogs" href="#TestDeleteOldJobLogs">func TestDeleteOldJobLogs(t *testing.T)</a>

```
searchKey: codemonitors.TestDeleteOldJobLogs
tags: [private]
```

```Go
func TestDeleteOldJobLogs(t *testing.T)
```

