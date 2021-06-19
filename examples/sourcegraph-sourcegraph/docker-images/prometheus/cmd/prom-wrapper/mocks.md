# Package mocks

## Index

* [Types](#type)
    * [type MockAPI struct](#MockAPI)
        * [func NewMockAPI() *MockAPI](#NewMockAPI)
        * [func NewMockAPIFrom(i v1.API) *MockAPI](#NewMockAPIFrom)
        * [func (m *MockAPI) AlertManagers(v0 context.Context) (v1.AlertManagersResult, error)](#MockAPI.AlertManagers)
        * [func (m *MockAPI) Alerts(v0 context.Context) (v1.AlertsResult, error)](#MockAPI.Alerts)
        * [func (m *MockAPI) CleanTombstones(v0 context.Context) error](#MockAPI.CleanTombstones)
        * [func (m *MockAPI) Config(v0 context.Context) (v1.ConfigResult, error)](#MockAPI.Config)
        * [func (m *MockAPI) DeleteSeries(v0 context.Context, v1 []string, v2 time.Time, v3 time.Time) error](#MockAPI.DeleteSeries)
        * [func (m *MockAPI) Flags(v0 context.Context) (v1.FlagsResult, error)](#MockAPI.Flags)
        * [func (m *MockAPI) LabelNames(v0 context.Context, v1 time.Time, v2 time.Time) ([]string, v1.Warnings, error)](#MockAPI.LabelNames)
        * [func (m *MockAPI) LabelValues(v0 context.Context, v1 string, v2 time.Time, v3 time.Time) (model.LabelValues, v1.Warnings, error)](#MockAPI.LabelValues)
        * [func (m *MockAPI) Metadata(v0 context.Context, v1 string, v2 string) (map[string][]v1.Metadata, error)](#MockAPI.Metadata)
        * [func (m *MockAPI) Query(v0 context.Context, v1 string, v2 time.Time) (model.Value, v1.Warnings, error)](#MockAPI.Query)
        * [func (m *MockAPI) QueryRange(v0 context.Context, v1 string, v2 v1.Range) (model.Value, v1.Warnings, error)](#MockAPI.QueryRange)
        * [func (m *MockAPI) Rules(v0 context.Context) (v1.RulesResult, error)](#MockAPI.Rules)
        * [func (m *MockAPI) Runtimeinfo(v0 context.Context) (v1.RuntimeinfoResult, error)](#MockAPI.Runtimeinfo)
        * [func (m *MockAPI) Series(v0 context.Context, v1 []string, v2 time.Time, v3 time.Time) ([]model.LabelSet, v1.Warnings, error)](#MockAPI.Series)
        * [func (m *MockAPI) Snapshot(v0 context.Context, v1 bool) (v1.SnapshotResult, error)](#MockAPI.Snapshot)
        * [func (m *MockAPI) TSDB(v0 context.Context) (v1.TSDBResult, error)](#MockAPI.TSDB)
        * [func (m *MockAPI) Targets(v0 context.Context) (v1.TargetsResult, error)](#MockAPI.Targets)
        * [func (m *MockAPI) TargetsMetadata(v0 context.Context, v1 string, v2 string, v3 string) ([]v1.MetricMetadata, error)](#MockAPI.TargetsMetadata)
    * [type APIAlertManagersFunc struct](#APIAlertManagersFunc)
        * [func (f *APIAlertManagersFunc) SetDefaultHook(hook func(context.Context) (v1.AlertManagersResult, error))](#APIAlertManagersFunc.SetDefaultHook)
        * [func (f *APIAlertManagersFunc) PushHook(hook func(context.Context) (v1.AlertManagersResult, error))](#APIAlertManagersFunc.PushHook)
        * [func (f *APIAlertManagersFunc) SetDefaultReturn(r0 v1.AlertManagersResult, r1 error)](#APIAlertManagersFunc.SetDefaultReturn)
        * [func (f *APIAlertManagersFunc) PushReturn(r0 v1.AlertManagersResult, r1 error)](#APIAlertManagersFunc.PushReturn)
        * [func (f *APIAlertManagersFunc) nextHook() func(context.Context) (v1.AlertManagersResult, error)](#APIAlertManagersFunc.nextHook)
        * [func (f *APIAlertManagersFunc) appendCall(r0 APIAlertManagersFuncCall)](#APIAlertManagersFunc.appendCall)
        * [func (f *APIAlertManagersFunc) History() []APIAlertManagersFuncCall](#APIAlertManagersFunc.History)
    * [type APIAlertManagersFuncCall struct](#APIAlertManagersFuncCall)
        * [func (c APIAlertManagersFuncCall) Args() []interface{}](#APIAlertManagersFuncCall.Args)
        * [func (c APIAlertManagersFuncCall) Results() []interface{}](#APIAlertManagersFuncCall.Results)
    * [type APIAlertsFunc struct](#APIAlertsFunc)
        * [func (f *APIAlertsFunc) SetDefaultHook(hook func(context.Context) (v1.AlertsResult, error))](#APIAlertsFunc.SetDefaultHook)
        * [func (f *APIAlertsFunc) PushHook(hook func(context.Context) (v1.AlertsResult, error))](#APIAlertsFunc.PushHook)
        * [func (f *APIAlertsFunc) SetDefaultReturn(r0 v1.AlertsResult, r1 error)](#APIAlertsFunc.SetDefaultReturn)
        * [func (f *APIAlertsFunc) PushReturn(r0 v1.AlertsResult, r1 error)](#APIAlertsFunc.PushReturn)
        * [func (f *APIAlertsFunc) nextHook() func(context.Context) (v1.AlertsResult, error)](#APIAlertsFunc.nextHook)
        * [func (f *APIAlertsFunc) appendCall(r0 APIAlertsFuncCall)](#APIAlertsFunc.appendCall)
        * [func (f *APIAlertsFunc) History() []APIAlertsFuncCall](#APIAlertsFunc.History)
    * [type APIAlertsFuncCall struct](#APIAlertsFuncCall)
        * [func (c APIAlertsFuncCall) Args() []interface{}](#APIAlertsFuncCall.Args)
        * [func (c APIAlertsFuncCall) Results() []interface{}](#APIAlertsFuncCall.Results)
    * [type APICleanTombstonesFunc struct](#APICleanTombstonesFunc)
        * [func (f *APICleanTombstonesFunc) SetDefaultHook(hook func(context.Context) error)](#APICleanTombstonesFunc.SetDefaultHook)
        * [func (f *APICleanTombstonesFunc) PushHook(hook func(context.Context) error)](#APICleanTombstonesFunc.PushHook)
        * [func (f *APICleanTombstonesFunc) SetDefaultReturn(r0 error)](#APICleanTombstonesFunc.SetDefaultReturn)
        * [func (f *APICleanTombstonesFunc) PushReturn(r0 error)](#APICleanTombstonesFunc.PushReturn)
        * [func (f *APICleanTombstonesFunc) nextHook() func(context.Context) error](#APICleanTombstonesFunc.nextHook)
        * [func (f *APICleanTombstonesFunc) appendCall(r0 APICleanTombstonesFuncCall)](#APICleanTombstonesFunc.appendCall)
        * [func (f *APICleanTombstonesFunc) History() []APICleanTombstonesFuncCall](#APICleanTombstonesFunc.History)
    * [type APICleanTombstonesFuncCall struct](#APICleanTombstonesFuncCall)
        * [func (c APICleanTombstonesFuncCall) Args() []interface{}](#APICleanTombstonesFuncCall.Args)
        * [func (c APICleanTombstonesFuncCall) Results() []interface{}](#APICleanTombstonesFuncCall.Results)
    * [type APIConfigFunc struct](#APIConfigFunc)
        * [func (f *APIConfigFunc) SetDefaultHook(hook func(context.Context) (v1.ConfigResult, error))](#APIConfigFunc.SetDefaultHook)
        * [func (f *APIConfigFunc) PushHook(hook func(context.Context) (v1.ConfigResult, error))](#APIConfigFunc.PushHook)
        * [func (f *APIConfigFunc) SetDefaultReturn(r0 v1.ConfigResult, r1 error)](#APIConfigFunc.SetDefaultReturn)
        * [func (f *APIConfigFunc) PushReturn(r0 v1.ConfigResult, r1 error)](#APIConfigFunc.PushReturn)
        * [func (f *APIConfigFunc) nextHook() func(context.Context) (v1.ConfigResult, error)](#APIConfigFunc.nextHook)
        * [func (f *APIConfigFunc) appendCall(r0 APIConfigFuncCall)](#APIConfigFunc.appendCall)
        * [func (f *APIConfigFunc) History() []APIConfigFuncCall](#APIConfigFunc.History)
    * [type APIConfigFuncCall struct](#APIConfigFuncCall)
        * [func (c APIConfigFuncCall) Args() []interface{}](#APIConfigFuncCall.Args)
        * [func (c APIConfigFuncCall) Results() []interface{}](#APIConfigFuncCall.Results)
    * [type APIDeleteSeriesFunc struct](#APIDeleteSeriesFunc)
        * [func (f *APIDeleteSeriesFunc) SetDefaultHook(hook func(context.Context, []string, time.Time, time.Time) error)](#APIDeleteSeriesFunc.SetDefaultHook)
        * [func (f *APIDeleteSeriesFunc) PushHook(hook func(context.Context, []string, time.Time, time.Time) error)](#APIDeleteSeriesFunc.PushHook)
        * [func (f *APIDeleteSeriesFunc) SetDefaultReturn(r0 error)](#APIDeleteSeriesFunc.SetDefaultReturn)
        * [func (f *APIDeleteSeriesFunc) PushReturn(r0 error)](#APIDeleteSeriesFunc.PushReturn)
        * [func (f *APIDeleteSeriesFunc) nextHook() func(context.Context, []string, time.Time, time.Time) error](#APIDeleteSeriesFunc.nextHook)
        * [func (f *APIDeleteSeriesFunc) appendCall(r0 APIDeleteSeriesFuncCall)](#APIDeleteSeriesFunc.appendCall)
        * [func (f *APIDeleteSeriesFunc) History() []APIDeleteSeriesFuncCall](#APIDeleteSeriesFunc.History)
    * [type APIDeleteSeriesFuncCall struct](#APIDeleteSeriesFuncCall)
        * [func (c APIDeleteSeriesFuncCall) Args() []interface{}](#APIDeleteSeriesFuncCall.Args)
        * [func (c APIDeleteSeriesFuncCall) Results() []interface{}](#APIDeleteSeriesFuncCall.Results)
    * [type APIFlagsFunc struct](#APIFlagsFunc)
        * [func (f *APIFlagsFunc) SetDefaultHook(hook func(context.Context) (v1.FlagsResult, error))](#APIFlagsFunc.SetDefaultHook)
        * [func (f *APIFlagsFunc) PushHook(hook func(context.Context) (v1.FlagsResult, error))](#APIFlagsFunc.PushHook)
        * [func (f *APIFlagsFunc) SetDefaultReturn(r0 v1.FlagsResult, r1 error)](#APIFlagsFunc.SetDefaultReturn)
        * [func (f *APIFlagsFunc) PushReturn(r0 v1.FlagsResult, r1 error)](#APIFlagsFunc.PushReturn)
        * [func (f *APIFlagsFunc) nextHook() func(context.Context) (v1.FlagsResult, error)](#APIFlagsFunc.nextHook)
        * [func (f *APIFlagsFunc) appendCall(r0 APIFlagsFuncCall)](#APIFlagsFunc.appendCall)
        * [func (f *APIFlagsFunc) History() []APIFlagsFuncCall](#APIFlagsFunc.History)
    * [type APIFlagsFuncCall struct](#APIFlagsFuncCall)
        * [func (c APIFlagsFuncCall) Args() []interface{}](#APIFlagsFuncCall.Args)
        * [func (c APIFlagsFuncCall) Results() []interface{}](#APIFlagsFuncCall.Results)
    * [type APILabelNamesFunc struct](#APILabelNamesFunc)
        * [func (f *APILabelNamesFunc) SetDefaultHook(hook func(context.Context, time.Time, time.Time) ([]string, v1.Warnings, error))](#APILabelNamesFunc.SetDefaultHook)
        * [func (f *APILabelNamesFunc) PushHook(hook func(context.Context, time.Time, time.Time) ([]string, v1.Warnings, error))](#APILabelNamesFunc.PushHook)
        * [func (f *APILabelNamesFunc) SetDefaultReturn(r0 []string, r1 v1.Warnings, r2 error)](#APILabelNamesFunc.SetDefaultReturn)
        * [func (f *APILabelNamesFunc) PushReturn(r0 []string, r1 v1.Warnings, r2 error)](#APILabelNamesFunc.PushReturn)
        * [func (f *APILabelNamesFunc) nextHook() func(context.Context, time.Time, time.Time) ([]string, v1.Warnings, error)](#APILabelNamesFunc.nextHook)
        * [func (f *APILabelNamesFunc) appendCall(r0 APILabelNamesFuncCall)](#APILabelNamesFunc.appendCall)
        * [func (f *APILabelNamesFunc) History() []APILabelNamesFuncCall](#APILabelNamesFunc.History)
    * [type APILabelNamesFuncCall struct](#APILabelNamesFuncCall)
        * [func (c APILabelNamesFuncCall) Args() []interface{}](#APILabelNamesFuncCall.Args)
        * [func (c APILabelNamesFuncCall) Results() []interface{}](#APILabelNamesFuncCall.Results)
    * [type APILabelValuesFunc struct](#APILabelValuesFunc)
        * [func (f *APILabelValuesFunc) SetDefaultHook(hook func(context.Context, string, time.Time, time.Time) (model.LabelValues, v1.Warnings, error))](#APILabelValuesFunc.SetDefaultHook)
        * [func (f *APILabelValuesFunc) PushHook(hook func(context.Context, string, time.Time, time.Time) (model.LabelValues, v1.Warnings, error))](#APILabelValuesFunc.PushHook)
        * [func (f *APILabelValuesFunc) SetDefaultReturn(r0 model.LabelValues, r1 v1.Warnings, r2 error)](#APILabelValuesFunc.SetDefaultReturn)
        * [func (f *APILabelValuesFunc) PushReturn(r0 model.LabelValues, r1 v1.Warnings, r2 error)](#APILabelValuesFunc.PushReturn)
        * [func (f *APILabelValuesFunc) nextHook() func(context.Context, string, time.Time, time.Time) (model.LabelValues, v1.Warnings, error)](#APILabelValuesFunc.nextHook)
        * [func (f *APILabelValuesFunc) appendCall(r0 APILabelValuesFuncCall)](#APILabelValuesFunc.appendCall)
        * [func (f *APILabelValuesFunc) History() []APILabelValuesFuncCall](#APILabelValuesFunc.History)
    * [type APILabelValuesFuncCall struct](#APILabelValuesFuncCall)
        * [func (c APILabelValuesFuncCall) Args() []interface{}](#APILabelValuesFuncCall.Args)
        * [func (c APILabelValuesFuncCall) Results() []interface{}](#APILabelValuesFuncCall.Results)
    * [type APIMetadataFunc struct](#APIMetadataFunc)
        * [func (f *APIMetadataFunc) SetDefaultHook(hook func(context.Context, string, string) (map[string][]v1.Metadata, error))](#APIMetadataFunc.SetDefaultHook)
        * [func (f *APIMetadataFunc) PushHook(hook func(context.Context, string, string) (map[string][]v1.Metadata, error))](#APIMetadataFunc.PushHook)
        * [func (f *APIMetadataFunc) SetDefaultReturn(r0 map[string][]v1.Metadata, r1 error)](#APIMetadataFunc.SetDefaultReturn)
        * [func (f *APIMetadataFunc) PushReturn(r0 map[string][]v1.Metadata, r1 error)](#APIMetadataFunc.PushReturn)
        * [func (f *APIMetadataFunc) nextHook() func(context.Context, string, string) (map[string][]v1.Metadata, error)](#APIMetadataFunc.nextHook)
        * [func (f *APIMetadataFunc) appendCall(r0 APIMetadataFuncCall)](#APIMetadataFunc.appendCall)
        * [func (f *APIMetadataFunc) History() []APIMetadataFuncCall](#APIMetadataFunc.History)
    * [type APIMetadataFuncCall struct](#APIMetadataFuncCall)
        * [func (c APIMetadataFuncCall) Args() []interface{}](#APIMetadataFuncCall.Args)
        * [func (c APIMetadataFuncCall) Results() []interface{}](#APIMetadataFuncCall.Results)
    * [type APIQueryFunc struct](#APIQueryFunc)
        * [func (f *APIQueryFunc) SetDefaultHook(hook func(context.Context, string, time.Time) (model.Value, v1.Warnings, error))](#APIQueryFunc.SetDefaultHook)
        * [func (f *APIQueryFunc) PushHook(hook func(context.Context, string, time.Time) (model.Value, v1.Warnings, error))](#APIQueryFunc.PushHook)
        * [func (f *APIQueryFunc) SetDefaultReturn(r0 model.Value, r1 v1.Warnings, r2 error)](#APIQueryFunc.SetDefaultReturn)
        * [func (f *APIQueryFunc) PushReturn(r0 model.Value, r1 v1.Warnings, r2 error)](#APIQueryFunc.PushReturn)
        * [func (f *APIQueryFunc) nextHook() func(context.Context, string, time.Time) (model.Value, v1.Warnings, error)](#APIQueryFunc.nextHook)
        * [func (f *APIQueryFunc) appendCall(r0 APIQueryFuncCall)](#APIQueryFunc.appendCall)
        * [func (f *APIQueryFunc) History() []APIQueryFuncCall](#APIQueryFunc.History)
    * [type APIQueryFuncCall struct](#APIQueryFuncCall)
        * [func (c APIQueryFuncCall) Args() []interface{}](#APIQueryFuncCall.Args)
        * [func (c APIQueryFuncCall) Results() []interface{}](#APIQueryFuncCall.Results)
    * [type APIQueryRangeFunc struct](#APIQueryRangeFunc)
        * [func (f *APIQueryRangeFunc) SetDefaultHook(hook func(context.Context, string, v1.Range) (model.Value, v1.Warnings, error))](#APIQueryRangeFunc.SetDefaultHook)
        * [func (f *APIQueryRangeFunc) PushHook(hook func(context.Context, string, v1.Range) (model.Value, v1.Warnings, error))](#APIQueryRangeFunc.PushHook)
        * [func (f *APIQueryRangeFunc) SetDefaultReturn(r0 model.Value, r1 v1.Warnings, r2 error)](#APIQueryRangeFunc.SetDefaultReturn)
        * [func (f *APIQueryRangeFunc) PushReturn(r0 model.Value, r1 v1.Warnings, r2 error)](#APIQueryRangeFunc.PushReturn)
        * [func (f *APIQueryRangeFunc) nextHook() func(context.Context, string, v1.Range) (model.Value, v1.Warnings, error)](#APIQueryRangeFunc.nextHook)
        * [func (f *APIQueryRangeFunc) appendCall(r0 APIQueryRangeFuncCall)](#APIQueryRangeFunc.appendCall)
        * [func (f *APIQueryRangeFunc) History() []APIQueryRangeFuncCall](#APIQueryRangeFunc.History)
    * [type APIQueryRangeFuncCall struct](#APIQueryRangeFuncCall)
        * [func (c APIQueryRangeFuncCall) Args() []interface{}](#APIQueryRangeFuncCall.Args)
        * [func (c APIQueryRangeFuncCall) Results() []interface{}](#APIQueryRangeFuncCall.Results)
    * [type APIRulesFunc struct](#APIRulesFunc)
        * [func (f *APIRulesFunc) SetDefaultHook(hook func(context.Context) (v1.RulesResult, error))](#APIRulesFunc.SetDefaultHook)
        * [func (f *APIRulesFunc) PushHook(hook func(context.Context) (v1.RulesResult, error))](#APIRulesFunc.PushHook)
        * [func (f *APIRulesFunc) SetDefaultReturn(r0 v1.RulesResult, r1 error)](#APIRulesFunc.SetDefaultReturn)
        * [func (f *APIRulesFunc) PushReturn(r0 v1.RulesResult, r1 error)](#APIRulesFunc.PushReturn)
        * [func (f *APIRulesFunc) nextHook() func(context.Context) (v1.RulesResult, error)](#APIRulesFunc.nextHook)
        * [func (f *APIRulesFunc) appendCall(r0 APIRulesFuncCall)](#APIRulesFunc.appendCall)
        * [func (f *APIRulesFunc) History() []APIRulesFuncCall](#APIRulesFunc.History)
    * [type APIRulesFuncCall struct](#APIRulesFuncCall)
        * [func (c APIRulesFuncCall) Args() []interface{}](#APIRulesFuncCall.Args)
        * [func (c APIRulesFuncCall) Results() []interface{}](#APIRulesFuncCall.Results)
    * [type APIRuntimeinfoFunc struct](#APIRuntimeinfoFunc)
        * [func (f *APIRuntimeinfoFunc) SetDefaultHook(hook func(context.Context) (v1.RuntimeinfoResult, error))](#APIRuntimeinfoFunc.SetDefaultHook)
        * [func (f *APIRuntimeinfoFunc) PushHook(hook func(context.Context) (v1.RuntimeinfoResult, error))](#APIRuntimeinfoFunc.PushHook)
        * [func (f *APIRuntimeinfoFunc) SetDefaultReturn(r0 v1.RuntimeinfoResult, r1 error)](#APIRuntimeinfoFunc.SetDefaultReturn)
        * [func (f *APIRuntimeinfoFunc) PushReturn(r0 v1.RuntimeinfoResult, r1 error)](#APIRuntimeinfoFunc.PushReturn)
        * [func (f *APIRuntimeinfoFunc) nextHook() func(context.Context) (v1.RuntimeinfoResult, error)](#APIRuntimeinfoFunc.nextHook)
        * [func (f *APIRuntimeinfoFunc) appendCall(r0 APIRuntimeinfoFuncCall)](#APIRuntimeinfoFunc.appendCall)
        * [func (f *APIRuntimeinfoFunc) History() []APIRuntimeinfoFuncCall](#APIRuntimeinfoFunc.History)
    * [type APIRuntimeinfoFuncCall struct](#APIRuntimeinfoFuncCall)
        * [func (c APIRuntimeinfoFuncCall) Args() []interface{}](#APIRuntimeinfoFuncCall.Args)
        * [func (c APIRuntimeinfoFuncCall) Results() []interface{}](#APIRuntimeinfoFuncCall.Results)
    * [type APISeriesFunc struct](#APISeriesFunc)
        * [func (f *APISeriesFunc) SetDefaultHook(hook func(context.Context, []string, time.Time, time.Time) ([]model.LabelSet, v1.Warnings, error))](#APISeriesFunc.SetDefaultHook)
        * [func (f *APISeriesFunc) PushHook(hook func(context.Context, []string, time.Time, time.Time) ([]model.LabelSet, v1.Warnings, error))](#APISeriesFunc.PushHook)
        * [func (f *APISeriesFunc) SetDefaultReturn(r0 []model.LabelSet, r1 v1.Warnings, r2 error)](#APISeriesFunc.SetDefaultReturn)
        * [func (f *APISeriesFunc) PushReturn(r0 []model.LabelSet, r1 v1.Warnings, r2 error)](#APISeriesFunc.PushReturn)
        * [func (f *APISeriesFunc) nextHook() func(context.Context, []string, time.Time, time.Time) ([]model.LabelSet, v1.Warnings, error)](#APISeriesFunc.nextHook)
        * [func (f *APISeriesFunc) appendCall(r0 APISeriesFuncCall)](#APISeriesFunc.appendCall)
        * [func (f *APISeriesFunc) History() []APISeriesFuncCall](#APISeriesFunc.History)
    * [type APISeriesFuncCall struct](#APISeriesFuncCall)
        * [func (c APISeriesFuncCall) Args() []interface{}](#APISeriesFuncCall.Args)
        * [func (c APISeriesFuncCall) Results() []interface{}](#APISeriesFuncCall.Results)
    * [type APISnapshotFunc struct](#APISnapshotFunc)
        * [func (f *APISnapshotFunc) SetDefaultHook(hook func(context.Context, bool) (v1.SnapshotResult, error))](#APISnapshotFunc.SetDefaultHook)
        * [func (f *APISnapshotFunc) PushHook(hook func(context.Context, bool) (v1.SnapshotResult, error))](#APISnapshotFunc.PushHook)
        * [func (f *APISnapshotFunc) SetDefaultReturn(r0 v1.SnapshotResult, r1 error)](#APISnapshotFunc.SetDefaultReturn)
        * [func (f *APISnapshotFunc) PushReturn(r0 v1.SnapshotResult, r1 error)](#APISnapshotFunc.PushReturn)
        * [func (f *APISnapshotFunc) nextHook() func(context.Context, bool) (v1.SnapshotResult, error)](#APISnapshotFunc.nextHook)
        * [func (f *APISnapshotFunc) appendCall(r0 APISnapshotFuncCall)](#APISnapshotFunc.appendCall)
        * [func (f *APISnapshotFunc) History() []APISnapshotFuncCall](#APISnapshotFunc.History)
    * [type APISnapshotFuncCall struct](#APISnapshotFuncCall)
        * [func (c APISnapshotFuncCall) Args() []interface{}](#APISnapshotFuncCall.Args)
        * [func (c APISnapshotFuncCall) Results() []interface{}](#APISnapshotFuncCall.Results)
    * [type APITSDBFunc struct](#APITSDBFunc)
        * [func (f *APITSDBFunc) SetDefaultHook(hook func(context.Context) (v1.TSDBResult, error))](#APITSDBFunc.SetDefaultHook)
        * [func (f *APITSDBFunc) PushHook(hook func(context.Context) (v1.TSDBResult, error))](#APITSDBFunc.PushHook)
        * [func (f *APITSDBFunc) SetDefaultReturn(r0 v1.TSDBResult, r1 error)](#APITSDBFunc.SetDefaultReturn)
        * [func (f *APITSDBFunc) PushReturn(r0 v1.TSDBResult, r1 error)](#APITSDBFunc.PushReturn)
        * [func (f *APITSDBFunc) nextHook() func(context.Context) (v1.TSDBResult, error)](#APITSDBFunc.nextHook)
        * [func (f *APITSDBFunc) appendCall(r0 APITSDBFuncCall)](#APITSDBFunc.appendCall)
        * [func (f *APITSDBFunc) History() []APITSDBFuncCall](#APITSDBFunc.History)
    * [type APITSDBFuncCall struct](#APITSDBFuncCall)
        * [func (c APITSDBFuncCall) Args() []interface{}](#APITSDBFuncCall.Args)
        * [func (c APITSDBFuncCall) Results() []interface{}](#APITSDBFuncCall.Results)
    * [type APITargetsFunc struct](#APITargetsFunc)
        * [func (f *APITargetsFunc) SetDefaultHook(hook func(context.Context) (v1.TargetsResult, error))](#APITargetsFunc.SetDefaultHook)
        * [func (f *APITargetsFunc) PushHook(hook func(context.Context) (v1.TargetsResult, error))](#APITargetsFunc.PushHook)
        * [func (f *APITargetsFunc) SetDefaultReturn(r0 v1.TargetsResult, r1 error)](#APITargetsFunc.SetDefaultReturn)
        * [func (f *APITargetsFunc) PushReturn(r0 v1.TargetsResult, r1 error)](#APITargetsFunc.PushReturn)
        * [func (f *APITargetsFunc) nextHook() func(context.Context) (v1.TargetsResult, error)](#APITargetsFunc.nextHook)
        * [func (f *APITargetsFunc) appendCall(r0 APITargetsFuncCall)](#APITargetsFunc.appendCall)
        * [func (f *APITargetsFunc) History() []APITargetsFuncCall](#APITargetsFunc.History)
    * [type APITargetsFuncCall struct](#APITargetsFuncCall)
        * [func (c APITargetsFuncCall) Args() []interface{}](#APITargetsFuncCall.Args)
        * [func (c APITargetsFuncCall) Results() []interface{}](#APITargetsFuncCall.Results)
    * [type APITargetsMetadataFunc struct](#APITargetsMetadataFunc)
        * [func (f *APITargetsMetadataFunc) SetDefaultHook(hook func(context.Context, string, string, string) ([]v1.MetricMetadata, error))](#APITargetsMetadataFunc.SetDefaultHook)
        * [func (f *APITargetsMetadataFunc) PushHook(hook func(context.Context, string, string, string) ([]v1.MetricMetadata, error))](#APITargetsMetadataFunc.PushHook)
        * [func (f *APITargetsMetadataFunc) SetDefaultReturn(r0 []v1.MetricMetadata, r1 error)](#APITargetsMetadataFunc.SetDefaultReturn)
        * [func (f *APITargetsMetadataFunc) PushReturn(r0 []v1.MetricMetadata, r1 error)](#APITargetsMetadataFunc.PushReturn)
        * [func (f *APITargetsMetadataFunc) nextHook() func(context.Context, string, string, string) ([]v1.MetricMetadata, error)](#APITargetsMetadataFunc.nextHook)
        * [func (f *APITargetsMetadataFunc) appendCall(r0 APITargetsMetadataFuncCall)](#APITargetsMetadataFunc.appendCall)
        * [func (f *APITargetsMetadataFunc) History() []APITargetsMetadataFuncCall](#APITargetsMetadataFunc.History)
    * [type APITargetsMetadataFuncCall struct](#APITargetsMetadataFuncCall)
        * [func (c APITargetsMetadataFuncCall) Args() []interface{}](#APITargetsMetadataFuncCall.Args)
        * [func (c APITargetsMetadataFuncCall) Results() []interface{}](#APITargetsMetadataFuncCall.Results)


## <a id="type" href="#type">Types</a>

```
tags: [exported]
```

### <a id="MockAPI" href="#MockAPI">type MockAPI struct</a>

```
searchKey: mocks.MockAPI
tags: [exported]
```

```Go
type MockAPI struct {
	// AlertManagersFunc is an instance of a mock function object
	// controlling the behavior of the method AlertManagers.
	AlertManagersFunc *APIAlertManagersFunc
	// AlertsFunc is an instance of a mock function object controlling the
	// behavior of the method Alerts.
	AlertsFunc *APIAlertsFunc
	// CleanTombstonesFunc is an instance of a mock function object
	// controlling the behavior of the method CleanTombstones.
	CleanTombstonesFunc *APICleanTombstonesFunc
	// ConfigFunc is an instance of a mock function object controlling the
	// behavior of the method Config.
	ConfigFunc *APIConfigFunc
	// DeleteSeriesFunc is an instance of a mock function object controlling
	// the behavior of the method DeleteSeries.
	DeleteSeriesFunc *APIDeleteSeriesFunc
	// FlagsFunc is an instance of a mock function object controlling the
	// behavior of the method Flags.
	FlagsFunc *APIFlagsFunc
	// LabelNamesFunc is an instance of a mock function object controlling
	// the behavior of the method LabelNames.
	LabelNamesFunc *APILabelNamesFunc
	// LabelValuesFunc is an instance of a mock function object controlling
	// the behavior of the method LabelValues.
	LabelValuesFunc *APILabelValuesFunc
	// MetadataFunc is an instance of a mock function object controlling the
	// behavior of the method Metadata.
	MetadataFunc *APIMetadataFunc
	// QueryFunc is an instance of a mock function object controlling the
	// behavior of the method Query.
	QueryFunc *APIQueryFunc
	// QueryRangeFunc is an instance of a mock function object controlling
	// the behavior of the method QueryRange.
	QueryRangeFunc *APIQueryRangeFunc
	// RulesFunc is an instance of a mock function object controlling the
	// behavior of the method Rules.
	RulesFunc *APIRulesFunc
	// RuntimeinfoFunc is an instance of a mock function object controlling
	// the behavior of the method Runtimeinfo.
	RuntimeinfoFunc *APIRuntimeinfoFunc
	// SeriesFunc is an instance of a mock function object controlling the
	// behavior of the method Series.
	SeriesFunc *APISeriesFunc
	// SnapshotFunc is an instance of a mock function object controlling the
	// behavior of the method Snapshot.
	SnapshotFunc *APISnapshotFunc
	// TSDBFunc is an instance of a mock function object controlling the
	// behavior of the method TSDB.
	TSDBFunc *APITSDBFunc
	// TargetsFunc is an instance of a mock function object controlling the
	// behavior of the method Targets.
	TargetsFunc *APITargetsFunc
	// TargetsMetadataFunc is an instance of a mock function object
	// controlling the behavior of the method TargetsMetadata.
	TargetsMetadataFunc *APITargetsMetadataFunc
}
```

MockAPI is a mock implementation of the API interface (from the package github.com/prometheus/client_golang/api/prometheus/v1) used for unit testing. 

#### <a id="NewMockAPI" href="#NewMockAPI">func NewMockAPI() *MockAPI</a>

```
searchKey: mocks.NewMockAPI
tags: [exported]
```

```Go
func NewMockAPI() *MockAPI
```

NewMockAPI creates a new mock of the API interface. All methods return zero values for all results, unless overwritten. 

#### <a id="NewMockAPIFrom" href="#NewMockAPIFrom">func NewMockAPIFrom(i v1.API) *MockAPI</a>

```
searchKey: mocks.NewMockAPIFrom
tags: [exported]
```

```Go
func NewMockAPIFrom(i v1.API) *MockAPI
```

NewMockAPIFrom creates a new mock of the MockAPI interface. All methods delegate to the given implementation, unless overwritten. 

#### <a id="MockAPI.AlertManagers" href="#MockAPI.AlertManagers">func (m *MockAPI) AlertManagers(v0 context.Context) (v1.AlertManagersResult, error)</a>

```
searchKey: mocks.MockAPI.AlertManagers
tags: [exported]
```

```Go
func (m *MockAPI) AlertManagers(v0 context.Context) (v1.AlertManagersResult, error)
```

AlertManagers delegates to the next hook function in the queue and stores the parameter and result values of this invocation. 

#### <a id="MockAPI.Alerts" href="#MockAPI.Alerts">func (m *MockAPI) Alerts(v0 context.Context) (v1.AlertsResult, error)</a>

```
searchKey: mocks.MockAPI.Alerts
tags: [exported]
```

```Go
func (m *MockAPI) Alerts(v0 context.Context) (v1.AlertsResult, error)
```

Alerts delegates to the next hook function in the queue and stores the parameter and result values of this invocation. 

#### <a id="MockAPI.CleanTombstones" href="#MockAPI.CleanTombstones">func (m *MockAPI) CleanTombstones(v0 context.Context) error</a>

```
searchKey: mocks.MockAPI.CleanTombstones
tags: [exported]
```

```Go
func (m *MockAPI) CleanTombstones(v0 context.Context) error
```

CleanTombstones delegates to the next hook function in the queue and stores the parameter and result values of this invocation. 

#### <a id="MockAPI.Config" href="#MockAPI.Config">func (m *MockAPI) Config(v0 context.Context) (v1.ConfigResult, error)</a>

```
searchKey: mocks.MockAPI.Config
tags: [exported]
```

```Go
func (m *MockAPI) Config(v0 context.Context) (v1.ConfigResult, error)
```

Config delegates to the next hook function in the queue and stores the parameter and result values of this invocation. 

#### <a id="MockAPI.DeleteSeries" href="#MockAPI.DeleteSeries">func (m *MockAPI) DeleteSeries(v0 context.Context, v1 []string, v2 time.Time, v3 time.Time) error</a>

```
searchKey: mocks.MockAPI.DeleteSeries
tags: [exported]
```

```Go
func (m *MockAPI) DeleteSeries(v0 context.Context, v1 []string, v2 time.Time, v3 time.Time) error
```

DeleteSeries delegates to the next hook function in the queue and stores the parameter and result values of this invocation. 

#### <a id="MockAPI.Flags" href="#MockAPI.Flags">func (m *MockAPI) Flags(v0 context.Context) (v1.FlagsResult, error)</a>

```
searchKey: mocks.MockAPI.Flags
tags: [exported]
```

```Go
func (m *MockAPI) Flags(v0 context.Context) (v1.FlagsResult, error)
```

Flags delegates to the next hook function in the queue and stores the parameter and result values of this invocation. 

#### <a id="MockAPI.LabelNames" href="#MockAPI.LabelNames">func (m *MockAPI) LabelNames(v0 context.Context, v1 time.Time, v2 time.Time) ([]string, v1.Warnings, error)</a>

```
searchKey: mocks.MockAPI.LabelNames
tags: [exported]
```

```Go
func (m *MockAPI) LabelNames(v0 context.Context, v1 time.Time, v2 time.Time) ([]string, v1.Warnings, error)
```

LabelNames delegates to the next hook function in the queue and stores the parameter and result values of this invocation. 

#### <a id="MockAPI.LabelValues" href="#MockAPI.LabelValues">func (m *MockAPI) LabelValues(v0 context.Context, v1 string, v2 time.Time, v3 time.Time) (model.LabelValues, v1.Warnings, error)</a>

```
searchKey: mocks.MockAPI.LabelValues
tags: [exported]
```

```Go
func (m *MockAPI) LabelValues(v0 context.Context, v1 string, v2 time.Time, v3 time.Time) (model.LabelValues, v1.Warnings, error)
```

LabelValues delegates to the next hook function in the queue and stores the parameter and result values of this invocation. 

#### <a id="MockAPI.Metadata" href="#MockAPI.Metadata">func (m *MockAPI) Metadata(v0 context.Context, v1 string, v2 string) (map[string][]v1.Metadata, error)</a>

```
searchKey: mocks.MockAPI.Metadata
tags: [exported]
```

```Go
func (m *MockAPI) Metadata(v0 context.Context, v1 string, v2 string) (map[string][]v1.Metadata, error)
```

Metadata delegates to the next hook function in the queue and stores the parameter and result values of this invocation. 

#### <a id="MockAPI.Query" href="#MockAPI.Query">func (m *MockAPI) Query(v0 context.Context, v1 string, v2 time.Time) (model.Value, v1.Warnings, error)</a>

```
searchKey: mocks.MockAPI.Query
tags: [exported]
```

```Go
func (m *MockAPI) Query(v0 context.Context, v1 string, v2 time.Time) (model.Value, v1.Warnings, error)
```

Query delegates to the next hook function in the queue and stores the parameter and result values of this invocation. 

#### <a id="MockAPI.QueryRange" href="#MockAPI.QueryRange">func (m *MockAPI) QueryRange(v0 context.Context, v1 string, v2 v1.Range) (model.Value, v1.Warnings, error)</a>

```
searchKey: mocks.MockAPI.QueryRange
tags: [exported]
```

```Go
func (m *MockAPI) QueryRange(v0 context.Context, v1 string, v2 v1.Range) (model.Value, v1.Warnings, error)
```

QueryRange delegates to the next hook function in the queue and stores the parameter and result values of this invocation. 

#### <a id="MockAPI.Rules" href="#MockAPI.Rules">func (m *MockAPI) Rules(v0 context.Context) (v1.RulesResult, error)</a>

```
searchKey: mocks.MockAPI.Rules
tags: [exported]
```

```Go
func (m *MockAPI) Rules(v0 context.Context) (v1.RulesResult, error)
```

Rules delegates to the next hook function in the queue and stores the parameter and result values of this invocation. 

#### <a id="MockAPI.Runtimeinfo" href="#MockAPI.Runtimeinfo">func (m *MockAPI) Runtimeinfo(v0 context.Context) (v1.RuntimeinfoResult, error)</a>

```
searchKey: mocks.MockAPI.Runtimeinfo
tags: [exported]
```

```Go
func (m *MockAPI) Runtimeinfo(v0 context.Context) (v1.RuntimeinfoResult, error)
```

Runtimeinfo delegates to the next hook function in the queue and stores the parameter and result values of this invocation. 

#### <a id="MockAPI.Series" href="#MockAPI.Series">func (m *MockAPI) Series(v0 context.Context, v1 []string, v2 time.Time, v3 time.Time) ([]model.LabelSet, v1.Warnings, error)</a>

```
searchKey: mocks.MockAPI.Series
tags: [exported]
```

```Go
func (m *MockAPI) Series(v0 context.Context, v1 []string, v2 time.Time, v3 time.Time) ([]model.LabelSet, v1.Warnings, error)
```

Series delegates to the next hook function in the queue and stores the parameter and result values of this invocation. 

#### <a id="MockAPI.Snapshot" href="#MockAPI.Snapshot">func (m *MockAPI) Snapshot(v0 context.Context, v1 bool) (v1.SnapshotResult, error)</a>

```
searchKey: mocks.MockAPI.Snapshot
tags: [exported]
```

```Go
func (m *MockAPI) Snapshot(v0 context.Context, v1 bool) (v1.SnapshotResult, error)
```

Snapshot delegates to the next hook function in the queue and stores the parameter and result values of this invocation. 

#### <a id="MockAPI.TSDB" href="#MockAPI.TSDB">func (m *MockAPI) TSDB(v0 context.Context) (v1.TSDBResult, error)</a>

```
searchKey: mocks.MockAPI.TSDB
tags: [exported]
```

```Go
func (m *MockAPI) TSDB(v0 context.Context) (v1.TSDBResult, error)
```

TSDB delegates to the next hook function in the queue and stores the parameter and result values of this invocation. 

#### <a id="MockAPI.Targets" href="#MockAPI.Targets">func (m *MockAPI) Targets(v0 context.Context) (v1.TargetsResult, error)</a>

```
searchKey: mocks.MockAPI.Targets
tags: [exported]
```

```Go
func (m *MockAPI) Targets(v0 context.Context) (v1.TargetsResult, error)
```

Targets delegates to the next hook function in the queue and stores the parameter and result values of this invocation. 

#### <a id="MockAPI.TargetsMetadata" href="#MockAPI.TargetsMetadata">func (m *MockAPI) TargetsMetadata(v0 context.Context, v1 string, v2 string, v3 string) ([]v1.MetricMetadata, error)</a>

```
searchKey: mocks.MockAPI.TargetsMetadata
tags: [exported]
```

```Go
func (m *MockAPI) TargetsMetadata(v0 context.Context, v1 string, v2 string, v3 string) ([]v1.MetricMetadata, error)
```

TargetsMetadata delegates to the next hook function in the queue and stores the parameter and result values of this invocation. 

### <a id="APIAlertManagersFunc" href="#APIAlertManagersFunc">type APIAlertManagersFunc struct</a>

```
searchKey: mocks.APIAlertManagersFunc
tags: [exported]
```

```Go
type APIAlertManagersFunc struct {
	defaultHook func(context.Context) (v1.AlertManagersResult, error)
	hooks       []func(context.Context) (v1.AlertManagersResult, error)
	history     []APIAlertManagersFuncCall
	mutex       sync.Mutex
}
```

APIAlertManagersFunc describes the behavior when the AlertManagers method of the parent MockAPI instance is invoked. 

#### <a id="APIAlertManagersFunc.SetDefaultHook" href="#APIAlertManagersFunc.SetDefaultHook">func (f *APIAlertManagersFunc) SetDefaultHook(hook func(context.Context) (v1.AlertManagersResult, error))</a>

```
searchKey: mocks.APIAlertManagersFunc.SetDefaultHook
tags: [exported]
```

```Go
func (f *APIAlertManagersFunc) SetDefaultHook(hook func(context.Context) (v1.AlertManagersResult, error))
```

SetDefaultHook sets function that is called when the AlertManagers method of the parent MockAPI instance is invoked and the hook queue is empty. 

#### <a id="APIAlertManagersFunc.PushHook" href="#APIAlertManagersFunc.PushHook">func (f *APIAlertManagersFunc) PushHook(hook func(context.Context) (v1.AlertManagersResult, error))</a>

```
searchKey: mocks.APIAlertManagersFunc.PushHook
tags: [exported]
```

```Go
func (f *APIAlertManagersFunc) PushHook(hook func(context.Context) (v1.AlertManagersResult, error))
```

PushHook adds a function to the end of hook queue. Each invocation of the AlertManagers method of the parent MockAPI instance invokes the hook at the front of the queue and discards it. After the queue is empty, the default hook function is invoked for any future action. 

#### <a id="APIAlertManagersFunc.SetDefaultReturn" href="#APIAlertManagersFunc.SetDefaultReturn">func (f *APIAlertManagersFunc) SetDefaultReturn(r0 v1.AlertManagersResult, r1 error)</a>

```
searchKey: mocks.APIAlertManagersFunc.SetDefaultReturn
tags: [exported]
```

```Go
func (f *APIAlertManagersFunc) SetDefaultReturn(r0 v1.AlertManagersResult, r1 error)
```

SetDefaultReturn calls SetDefaultDefaultHook with a function that returns the given values. 

#### <a id="APIAlertManagersFunc.PushReturn" href="#APIAlertManagersFunc.PushReturn">func (f *APIAlertManagersFunc) PushReturn(r0 v1.AlertManagersResult, r1 error)</a>

```
searchKey: mocks.APIAlertManagersFunc.PushReturn
tags: [exported]
```

```Go
func (f *APIAlertManagersFunc) PushReturn(r0 v1.AlertManagersResult, r1 error)
```

PushReturn calls PushDefaultHook with a function that returns the given values. 

#### <a id="APIAlertManagersFunc.nextHook" href="#APIAlertManagersFunc.nextHook">func (f *APIAlertManagersFunc) nextHook() func(context.Context) (v1.AlertManagersResult, error)</a>

```
searchKey: mocks.APIAlertManagersFunc.nextHook
```

```Go
func (f *APIAlertManagersFunc) nextHook() func(context.Context) (v1.AlertManagersResult, error)
```

#### <a id="APIAlertManagersFunc.appendCall" href="#APIAlertManagersFunc.appendCall">func (f *APIAlertManagersFunc) appendCall(r0 APIAlertManagersFuncCall)</a>

```
searchKey: mocks.APIAlertManagersFunc.appendCall
```

```Go
func (f *APIAlertManagersFunc) appendCall(r0 APIAlertManagersFuncCall)
```

#### <a id="APIAlertManagersFunc.History" href="#APIAlertManagersFunc.History">func (f *APIAlertManagersFunc) History() []APIAlertManagersFuncCall</a>

```
searchKey: mocks.APIAlertManagersFunc.History
tags: [exported]
```

```Go
func (f *APIAlertManagersFunc) History() []APIAlertManagersFuncCall
```

History returns a sequence of APIAlertManagersFuncCall objects describing the invocations of this function. 

### <a id="APIAlertManagersFuncCall" href="#APIAlertManagersFuncCall">type APIAlertManagersFuncCall struct</a>

```
searchKey: mocks.APIAlertManagersFuncCall
tags: [exported]
```

```Go
type APIAlertManagersFuncCall struct {
	// Arg0 is the value of the 1st argument passed to this method
	// invocation.
	Arg0 context.Context
	// Result0 is the value of the 1st result returned from this method
	// invocation.
	Result0 v1.AlertManagersResult
	// Result1 is the value of the 2nd result returned from this method
	// invocation.
	Result1 error
}
```

APIAlertManagersFuncCall is an object that describes an invocation of method AlertManagers on an instance of MockAPI. 

#### <a id="APIAlertManagersFuncCall.Args" href="#APIAlertManagersFuncCall.Args">func (c APIAlertManagersFuncCall) Args() []interface{}</a>

```
searchKey: mocks.APIAlertManagersFuncCall.Args
tags: [exported]
```

```Go
func (c APIAlertManagersFuncCall) Args() []interface{}
```

Args returns an interface slice containing the arguments of this invocation. 

#### <a id="APIAlertManagersFuncCall.Results" href="#APIAlertManagersFuncCall.Results">func (c APIAlertManagersFuncCall) Results() []interface{}</a>

```
searchKey: mocks.APIAlertManagersFuncCall.Results
tags: [exported]
```

```Go
func (c APIAlertManagersFuncCall) Results() []interface{}
```

Results returns an interface slice containing the results of this invocation. 

### <a id="APIAlertsFunc" href="#APIAlertsFunc">type APIAlertsFunc struct</a>

```
searchKey: mocks.APIAlertsFunc
tags: [exported]
```

```Go
type APIAlertsFunc struct {
	defaultHook func(context.Context) (v1.AlertsResult, error)
	hooks       []func(context.Context) (v1.AlertsResult, error)
	history     []APIAlertsFuncCall
	mutex       sync.Mutex
}
```

APIAlertsFunc describes the behavior when the Alerts method of the parent MockAPI instance is invoked. 

#### <a id="APIAlertsFunc.SetDefaultHook" href="#APIAlertsFunc.SetDefaultHook">func (f *APIAlertsFunc) SetDefaultHook(hook func(context.Context) (v1.AlertsResult, error))</a>

```
searchKey: mocks.APIAlertsFunc.SetDefaultHook
tags: [exported]
```

```Go
func (f *APIAlertsFunc) SetDefaultHook(hook func(context.Context) (v1.AlertsResult, error))
```

SetDefaultHook sets function that is called when the Alerts method of the parent MockAPI instance is invoked and the hook queue is empty. 

#### <a id="APIAlertsFunc.PushHook" href="#APIAlertsFunc.PushHook">func (f *APIAlertsFunc) PushHook(hook func(context.Context) (v1.AlertsResult, error))</a>

```
searchKey: mocks.APIAlertsFunc.PushHook
tags: [exported]
```

```Go
func (f *APIAlertsFunc) PushHook(hook func(context.Context) (v1.AlertsResult, error))
```

PushHook adds a function to the end of hook queue. Each invocation of the Alerts method of the parent MockAPI instance invokes the hook at the front of the queue and discards it. After the queue is empty, the default hook function is invoked for any future action. 

#### <a id="APIAlertsFunc.SetDefaultReturn" href="#APIAlertsFunc.SetDefaultReturn">func (f *APIAlertsFunc) SetDefaultReturn(r0 v1.AlertsResult, r1 error)</a>

```
searchKey: mocks.APIAlertsFunc.SetDefaultReturn
tags: [exported]
```

```Go
func (f *APIAlertsFunc) SetDefaultReturn(r0 v1.AlertsResult, r1 error)
```

SetDefaultReturn calls SetDefaultDefaultHook with a function that returns the given values. 

#### <a id="APIAlertsFunc.PushReturn" href="#APIAlertsFunc.PushReturn">func (f *APIAlertsFunc) PushReturn(r0 v1.AlertsResult, r1 error)</a>

```
searchKey: mocks.APIAlertsFunc.PushReturn
tags: [exported]
```

```Go
func (f *APIAlertsFunc) PushReturn(r0 v1.AlertsResult, r1 error)
```

PushReturn calls PushDefaultHook with a function that returns the given values. 

#### <a id="APIAlertsFunc.nextHook" href="#APIAlertsFunc.nextHook">func (f *APIAlertsFunc) nextHook() func(context.Context) (v1.AlertsResult, error)</a>

```
searchKey: mocks.APIAlertsFunc.nextHook
```

```Go
func (f *APIAlertsFunc) nextHook() func(context.Context) (v1.AlertsResult, error)
```

#### <a id="APIAlertsFunc.appendCall" href="#APIAlertsFunc.appendCall">func (f *APIAlertsFunc) appendCall(r0 APIAlertsFuncCall)</a>

```
searchKey: mocks.APIAlertsFunc.appendCall
```

```Go
func (f *APIAlertsFunc) appendCall(r0 APIAlertsFuncCall)
```

#### <a id="APIAlertsFunc.History" href="#APIAlertsFunc.History">func (f *APIAlertsFunc) History() []APIAlertsFuncCall</a>

```
searchKey: mocks.APIAlertsFunc.History
tags: [exported]
```

```Go
func (f *APIAlertsFunc) History() []APIAlertsFuncCall
```

History returns a sequence of APIAlertsFuncCall objects describing the invocations of this function. 

### <a id="APIAlertsFuncCall" href="#APIAlertsFuncCall">type APIAlertsFuncCall struct</a>

```
searchKey: mocks.APIAlertsFuncCall
tags: [exported]
```

```Go
type APIAlertsFuncCall struct {
	// Arg0 is the value of the 1st argument passed to this method
	// invocation.
	Arg0 context.Context
	// Result0 is the value of the 1st result returned from this method
	// invocation.
	Result0 v1.AlertsResult
	// Result1 is the value of the 2nd result returned from this method
	// invocation.
	Result1 error
}
```

APIAlertsFuncCall is an object that describes an invocation of method Alerts on an instance of MockAPI. 

#### <a id="APIAlertsFuncCall.Args" href="#APIAlertsFuncCall.Args">func (c APIAlertsFuncCall) Args() []interface{}</a>

```
searchKey: mocks.APIAlertsFuncCall.Args
tags: [exported]
```

```Go
func (c APIAlertsFuncCall) Args() []interface{}
```

Args returns an interface slice containing the arguments of this invocation. 

#### <a id="APIAlertsFuncCall.Results" href="#APIAlertsFuncCall.Results">func (c APIAlertsFuncCall) Results() []interface{}</a>

```
searchKey: mocks.APIAlertsFuncCall.Results
tags: [exported]
```

```Go
func (c APIAlertsFuncCall) Results() []interface{}
```

Results returns an interface slice containing the results of this invocation. 

### <a id="APICleanTombstonesFunc" href="#APICleanTombstonesFunc">type APICleanTombstonesFunc struct</a>

```
searchKey: mocks.APICleanTombstonesFunc
tags: [exported]
```

```Go
type APICleanTombstonesFunc struct {
	defaultHook func(context.Context) error
	hooks       []func(context.Context) error
	history     []APICleanTombstonesFuncCall
	mutex       sync.Mutex
}
```

APICleanTombstonesFunc describes the behavior when the CleanTombstones method of the parent MockAPI instance is invoked. 

#### <a id="APICleanTombstonesFunc.SetDefaultHook" href="#APICleanTombstonesFunc.SetDefaultHook">func (f *APICleanTombstonesFunc) SetDefaultHook(hook func(context.Context) error)</a>

```
searchKey: mocks.APICleanTombstonesFunc.SetDefaultHook
tags: [exported]
```

```Go
func (f *APICleanTombstonesFunc) SetDefaultHook(hook func(context.Context) error)
```

SetDefaultHook sets function that is called when the CleanTombstones method of the parent MockAPI instance is invoked and the hook queue is empty. 

#### <a id="APICleanTombstonesFunc.PushHook" href="#APICleanTombstonesFunc.PushHook">func (f *APICleanTombstonesFunc) PushHook(hook func(context.Context) error)</a>

```
searchKey: mocks.APICleanTombstonesFunc.PushHook
tags: [exported]
```

```Go
func (f *APICleanTombstonesFunc) PushHook(hook func(context.Context) error)
```

PushHook adds a function to the end of hook queue. Each invocation of the CleanTombstones method of the parent MockAPI instance invokes the hook at the front of the queue and discards it. After the queue is empty, the default hook function is invoked for any future action. 

#### <a id="APICleanTombstonesFunc.SetDefaultReturn" href="#APICleanTombstonesFunc.SetDefaultReturn">func (f *APICleanTombstonesFunc) SetDefaultReturn(r0 error)</a>

```
searchKey: mocks.APICleanTombstonesFunc.SetDefaultReturn
tags: [exported]
```

```Go
func (f *APICleanTombstonesFunc) SetDefaultReturn(r0 error)
```

SetDefaultReturn calls SetDefaultDefaultHook with a function that returns the given values. 

#### <a id="APICleanTombstonesFunc.PushReturn" href="#APICleanTombstonesFunc.PushReturn">func (f *APICleanTombstonesFunc) PushReturn(r0 error)</a>

```
searchKey: mocks.APICleanTombstonesFunc.PushReturn
tags: [exported]
```

```Go
func (f *APICleanTombstonesFunc) PushReturn(r0 error)
```

PushReturn calls PushDefaultHook with a function that returns the given values. 

#### <a id="APICleanTombstonesFunc.nextHook" href="#APICleanTombstonesFunc.nextHook">func (f *APICleanTombstonesFunc) nextHook() func(context.Context) error</a>

```
searchKey: mocks.APICleanTombstonesFunc.nextHook
```

```Go
func (f *APICleanTombstonesFunc) nextHook() func(context.Context) error
```

#### <a id="APICleanTombstonesFunc.appendCall" href="#APICleanTombstonesFunc.appendCall">func (f *APICleanTombstonesFunc) appendCall(r0 APICleanTombstonesFuncCall)</a>

```
searchKey: mocks.APICleanTombstonesFunc.appendCall
```

```Go
func (f *APICleanTombstonesFunc) appendCall(r0 APICleanTombstonesFuncCall)
```

#### <a id="APICleanTombstonesFunc.History" href="#APICleanTombstonesFunc.History">func (f *APICleanTombstonesFunc) History() []APICleanTombstonesFuncCall</a>

```
searchKey: mocks.APICleanTombstonesFunc.History
tags: [exported]
```

```Go
func (f *APICleanTombstonesFunc) History() []APICleanTombstonesFuncCall
```

History returns a sequence of APICleanTombstonesFuncCall objects describing the invocations of this function. 

### <a id="APICleanTombstonesFuncCall" href="#APICleanTombstonesFuncCall">type APICleanTombstonesFuncCall struct</a>

```
searchKey: mocks.APICleanTombstonesFuncCall
tags: [exported]
```

```Go
type APICleanTombstonesFuncCall struct {
	// Arg0 is the value of the 1st argument passed to this method
	// invocation.
	Arg0 context.Context
	// Result0 is the value of the 1st result returned from this method
	// invocation.
	Result0 error
}
```

APICleanTombstonesFuncCall is an object that describes an invocation of method CleanTombstones on an instance of MockAPI. 

#### <a id="APICleanTombstonesFuncCall.Args" href="#APICleanTombstonesFuncCall.Args">func (c APICleanTombstonesFuncCall) Args() []interface{}</a>

```
searchKey: mocks.APICleanTombstonesFuncCall.Args
tags: [exported]
```

```Go
func (c APICleanTombstonesFuncCall) Args() []interface{}
```

Args returns an interface slice containing the arguments of this invocation. 

#### <a id="APICleanTombstonesFuncCall.Results" href="#APICleanTombstonesFuncCall.Results">func (c APICleanTombstonesFuncCall) Results() []interface{}</a>

```
searchKey: mocks.APICleanTombstonesFuncCall.Results
tags: [exported]
```

```Go
func (c APICleanTombstonesFuncCall) Results() []interface{}
```

Results returns an interface slice containing the results of this invocation. 

### <a id="APIConfigFunc" href="#APIConfigFunc">type APIConfigFunc struct</a>

```
searchKey: mocks.APIConfigFunc
tags: [exported]
```

```Go
type APIConfigFunc struct {
	defaultHook func(context.Context) (v1.ConfigResult, error)
	hooks       []func(context.Context) (v1.ConfigResult, error)
	history     []APIConfigFuncCall
	mutex       sync.Mutex
}
```

APIConfigFunc describes the behavior when the Config method of the parent MockAPI instance is invoked. 

#### <a id="APIConfigFunc.SetDefaultHook" href="#APIConfigFunc.SetDefaultHook">func (f *APIConfigFunc) SetDefaultHook(hook func(context.Context) (v1.ConfigResult, error))</a>

```
searchKey: mocks.APIConfigFunc.SetDefaultHook
tags: [exported]
```

```Go
func (f *APIConfigFunc) SetDefaultHook(hook func(context.Context) (v1.ConfigResult, error))
```

SetDefaultHook sets function that is called when the Config method of the parent MockAPI instance is invoked and the hook queue is empty. 

#### <a id="APIConfigFunc.PushHook" href="#APIConfigFunc.PushHook">func (f *APIConfigFunc) PushHook(hook func(context.Context) (v1.ConfigResult, error))</a>

```
searchKey: mocks.APIConfigFunc.PushHook
tags: [exported]
```

```Go
func (f *APIConfigFunc) PushHook(hook func(context.Context) (v1.ConfigResult, error))
```

PushHook adds a function to the end of hook queue. Each invocation of the Config method of the parent MockAPI instance invokes the hook at the front of the queue and discards it. After the queue is empty, the default hook function is invoked for any future action. 

#### <a id="APIConfigFunc.SetDefaultReturn" href="#APIConfigFunc.SetDefaultReturn">func (f *APIConfigFunc) SetDefaultReturn(r0 v1.ConfigResult, r1 error)</a>

```
searchKey: mocks.APIConfigFunc.SetDefaultReturn
tags: [exported]
```

```Go
func (f *APIConfigFunc) SetDefaultReturn(r0 v1.ConfigResult, r1 error)
```

SetDefaultReturn calls SetDefaultDefaultHook with a function that returns the given values. 

#### <a id="APIConfigFunc.PushReturn" href="#APIConfigFunc.PushReturn">func (f *APIConfigFunc) PushReturn(r0 v1.ConfigResult, r1 error)</a>

```
searchKey: mocks.APIConfigFunc.PushReturn
tags: [exported]
```

```Go
func (f *APIConfigFunc) PushReturn(r0 v1.ConfigResult, r1 error)
```

PushReturn calls PushDefaultHook with a function that returns the given values. 

#### <a id="APIConfigFunc.nextHook" href="#APIConfigFunc.nextHook">func (f *APIConfigFunc) nextHook() func(context.Context) (v1.ConfigResult, error)</a>

```
searchKey: mocks.APIConfigFunc.nextHook
```

```Go
func (f *APIConfigFunc) nextHook() func(context.Context) (v1.ConfigResult, error)
```

#### <a id="APIConfigFunc.appendCall" href="#APIConfigFunc.appendCall">func (f *APIConfigFunc) appendCall(r0 APIConfigFuncCall)</a>

```
searchKey: mocks.APIConfigFunc.appendCall
```

```Go
func (f *APIConfigFunc) appendCall(r0 APIConfigFuncCall)
```

#### <a id="APIConfigFunc.History" href="#APIConfigFunc.History">func (f *APIConfigFunc) History() []APIConfigFuncCall</a>

```
searchKey: mocks.APIConfigFunc.History
tags: [exported]
```

```Go
func (f *APIConfigFunc) History() []APIConfigFuncCall
```

History returns a sequence of APIConfigFuncCall objects describing the invocations of this function. 

### <a id="APIConfigFuncCall" href="#APIConfigFuncCall">type APIConfigFuncCall struct</a>

```
searchKey: mocks.APIConfigFuncCall
tags: [exported]
```

```Go
type APIConfigFuncCall struct {
	// Arg0 is the value of the 1st argument passed to this method
	// invocation.
	Arg0 context.Context
	// Result0 is the value of the 1st result returned from this method
	// invocation.
	Result0 v1.ConfigResult
	// Result1 is the value of the 2nd result returned from this method
	// invocation.
	Result1 error
}
```

APIConfigFuncCall is an object that describes an invocation of method Config on an instance of MockAPI. 

#### <a id="APIConfigFuncCall.Args" href="#APIConfigFuncCall.Args">func (c APIConfigFuncCall) Args() []interface{}</a>

```
searchKey: mocks.APIConfigFuncCall.Args
tags: [exported]
```

```Go
func (c APIConfigFuncCall) Args() []interface{}
```

Args returns an interface slice containing the arguments of this invocation. 

#### <a id="APIConfigFuncCall.Results" href="#APIConfigFuncCall.Results">func (c APIConfigFuncCall) Results() []interface{}</a>

```
searchKey: mocks.APIConfigFuncCall.Results
tags: [exported]
```

```Go
func (c APIConfigFuncCall) Results() []interface{}
```

Results returns an interface slice containing the results of this invocation. 

### <a id="APIDeleteSeriesFunc" href="#APIDeleteSeriesFunc">type APIDeleteSeriesFunc struct</a>

```
searchKey: mocks.APIDeleteSeriesFunc
tags: [exported]
```

```Go
type APIDeleteSeriesFunc struct {
	defaultHook func(context.Context, []string, time.Time, time.Time) error
	hooks       []func(context.Context, []string, time.Time, time.Time) error
	history     []APIDeleteSeriesFuncCall
	mutex       sync.Mutex
}
```

APIDeleteSeriesFunc describes the behavior when the DeleteSeries method of the parent MockAPI instance is invoked. 

#### <a id="APIDeleteSeriesFunc.SetDefaultHook" href="#APIDeleteSeriesFunc.SetDefaultHook">func (f *APIDeleteSeriesFunc) SetDefaultHook(hook func(context.Context, []string, time.Time, time.Time) error)</a>

```
searchKey: mocks.APIDeleteSeriesFunc.SetDefaultHook
tags: [exported]
```

```Go
func (f *APIDeleteSeriesFunc) SetDefaultHook(hook func(context.Context, []string, time.Time, time.Time) error)
```

SetDefaultHook sets function that is called when the DeleteSeries method of the parent MockAPI instance is invoked and the hook queue is empty. 

#### <a id="APIDeleteSeriesFunc.PushHook" href="#APIDeleteSeriesFunc.PushHook">func (f *APIDeleteSeriesFunc) PushHook(hook func(context.Context, []string, time.Time, time.Time) error)</a>

```
searchKey: mocks.APIDeleteSeriesFunc.PushHook
tags: [exported]
```

```Go
func (f *APIDeleteSeriesFunc) PushHook(hook func(context.Context, []string, time.Time, time.Time) error)
```

PushHook adds a function to the end of hook queue. Each invocation of the DeleteSeries method of the parent MockAPI instance invokes the hook at the front of the queue and discards it. After the queue is empty, the default hook function is invoked for any future action. 

#### <a id="APIDeleteSeriesFunc.SetDefaultReturn" href="#APIDeleteSeriesFunc.SetDefaultReturn">func (f *APIDeleteSeriesFunc) SetDefaultReturn(r0 error)</a>

```
searchKey: mocks.APIDeleteSeriesFunc.SetDefaultReturn
tags: [exported]
```

```Go
func (f *APIDeleteSeriesFunc) SetDefaultReturn(r0 error)
```

SetDefaultReturn calls SetDefaultDefaultHook with a function that returns the given values. 

#### <a id="APIDeleteSeriesFunc.PushReturn" href="#APIDeleteSeriesFunc.PushReturn">func (f *APIDeleteSeriesFunc) PushReturn(r0 error)</a>

```
searchKey: mocks.APIDeleteSeriesFunc.PushReturn
tags: [exported]
```

```Go
func (f *APIDeleteSeriesFunc) PushReturn(r0 error)
```

PushReturn calls PushDefaultHook with a function that returns the given values. 

#### <a id="APIDeleteSeriesFunc.nextHook" href="#APIDeleteSeriesFunc.nextHook">func (f *APIDeleteSeriesFunc) nextHook() func(context.Context, []string, time.Time, time.Time) error</a>

```
searchKey: mocks.APIDeleteSeriesFunc.nextHook
```

```Go
func (f *APIDeleteSeriesFunc) nextHook() func(context.Context, []string, time.Time, time.Time) error
```

#### <a id="APIDeleteSeriesFunc.appendCall" href="#APIDeleteSeriesFunc.appendCall">func (f *APIDeleteSeriesFunc) appendCall(r0 APIDeleteSeriesFuncCall)</a>

```
searchKey: mocks.APIDeleteSeriesFunc.appendCall
```

```Go
func (f *APIDeleteSeriesFunc) appendCall(r0 APIDeleteSeriesFuncCall)
```

#### <a id="APIDeleteSeriesFunc.History" href="#APIDeleteSeriesFunc.History">func (f *APIDeleteSeriesFunc) History() []APIDeleteSeriesFuncCall</a>

```
searchKey: mocks.APIDeleteSeriesFunc.History
tags: [exported]
```

```Go
func (f *APIDeleteSeriesFunc) History() []APIDeleteSeriesFuncCall
```

History returns a sequence of APIDeleteSeriesFuncCall objects describing the invocations of this function. 

### <a id="APIDeleteSeriesFuncCall" href="#APIDeleteSeriesFuncCall">type APIDeleteSeriesFuncCall struct</a>

```
searchKey: mocks.APIDeleteSeriesFuncCall
tags: [exported]
```

```Go
type APIDeleteSeriesFuncCall struct {
	// Arg0 is the value of the 1st argument passed to this method
	// invocation.
	Arg0 context.Context
	// Arg1 is the value of the 2nd argument passed to this method
	// invocation.
	Arg1 []string
	// Arg2 is the value of the 3rd argument passed to this method
	// invocation.
	Arg2 time.Time
	// Arg3 is the value of the 4th argument passed to this method
	// invocation.
	Arg3 time.Time
	// Result0 is the value of the 1st result returned from this method
	// invocation.
	Result0 error
}
```

APIDeleteSeriesFuncCall is an object that describes an invocation of method DeleteSeries on an instance of MockAPI. 

#### <a id="APIDeleteSeriesFuncCall.Args" href="#APIDeleteSeriesFuncCall.Args">func (c APIDeleteSeriesFuncCall) Args() []interface{}</a>

```
searchKey: mocks.APIDeleteSeriesFuncCall.Args
tags: [exported]
```

```Go
func (c APIDeleteSeriesFuncCall) Args() []interface{}
```

Args returns an interface slice containing the arguments of this invocation. 

#### <a id="APIDeleteSeriesFuncCall.Results" href="#APIDeleteSeriesFuncCall.Results">func (c APIDeleteSeriesFuncCall) Results() []interface{}</a>

```
searchKey: mocks.APIDeleteSeriesFuncCall.Results
tags: [exported]
```

```Go
func (c APIDeleteSeriesFuncCall) Results() []interface{}
```

Results returns an interface slice containing the results of this invocation. 

### <a id="APIFlagsFunc" href="#APIFlagsFunc">type APIFlagsFunc struct</a>

```
searchKey: mocks.APIFlagsFunc
tags: [exported]
```

```Go
type APIFlagsFunc struct {
	defaultHook func(context.Context) (v1.FlagsResult, error)
	hooks       []func(context.Context) (v1.FlagsResult, error)
	history     []APIFlagsFuncCall
	mutex       sync.Mutex
}
```

APIFlagsFunc describes the behavior when the Flags method of the parent MockAPI instance is invoked. 

#### <a id="APIFlagsFunc.SetDefaultHook" href="#APIFlagsFunc.SetDefaultHook">func (f *APIFlagsFunc) SetDefaultHook(hook func(context.Context) (v1.FlagsResult, error))</a>

```
searchKey: mocks.APIFlagsFunc.SetDefaultHook
tags: [exported]
```

```Go
func (f *APIFlagsFunc) SetDefaultHook(hook func(context.Context) (v1.FlagsResult, error))
```

SetDefaultHook sets function that is called when the Flags method of the parent MockAPI instance is invoked and the hook queue is empty. 

#### <a id="APIFlagsFunc.PushHook" href="#APIFlagsFunc.PushHook">func (f *APIFlagsFunc) PushHook(hook func(context.Context) (v1.FlagsResult, error))</a>

```
searchKey: mocks.APIFlagsFunc.PushHook
tags: [exported]
```

```Go
func (f *APIFlagsFunc) PushHook(hook func(context.Context) (v1.FlagsResult, error))
```

PushHook adds a function to the end of hook queue. Each invocation of the Flags method of the parent MockAPI instance invokes the hook at the front of the queue and discards it. After the queue is empty, the default hook function is invoked for any future action. 

#### <a id="APIFlagsFunc.SetDefaultReturn" href="#APIFlagsFunc.SetDefaultReturn">func (f *APIFlagsFunc) SetDefaultReturn(r0 v1.FlagsResult, r1 error)</a>

```
searchKey: mocks.APIFlagsFunc.SetDefaultReturn
tags: [exported]
```

```Go
func (f *APIFlagsFunc) SetDefaultReturn(r0 v1.FlagsResult, r1 error)
```

SetDefaultReturn calls SetDefaultDefaultHook with a function that returns the given values. 

#### <a id="APIFlagsFunc.PushReturn" href="#APIFlagsFunc.PushReturn">func (f *APIFlagsFunc) PushReturn(r0 v1.FlagsResult, r1 error)</a>

```
searchKey: mocks.APIFlagsFunc.PushReturn
tags: [exported]
```

```Go
func (f *APIFlagsFunc) PushReturn(r0 v1.FlagsResult, r1 error)
```

PushReturn calls PushDefaultHook with a function that returns the given values. 

#### <a id="APIFlagsFunc.nextHook" href="#APIFlagsFunc.nextHook">func (f *APIFlagsFunc) nextHook() func(context.Context) (v1.FlagsResult, error)</a>

```
searchKey: mocks.APIFlagsFunc.nextHook
```

```Go
func (f *APIFlagsFunc) nextHook() func(context.Context) (v1.FlagsResult, error)
```

#### <a id="APIFlagsFunc.appendCall" href="#APIFlagsFunc.appendCall">func (f *APIFlagsFunc) appendCall(r0 APIFlagsFuncCall)</a>

```
searchKey: mocks.APIFlagsFunc.appendCall
```

```Go
func (f *APIFlagsFunc) appendCall(r0 APIFlagsFuncCall)
```

#### <a id="APIFlagsFunc.History" href="#APIFlagsFunc.History">func (f *APIFlagsFunc) History() []APIFlagsFuncCall</a>

```
searchKey: mocks.APIFlagsFunc.History
tags: [exported]
```

```Go
func (f *APIFlagsFunc) History() []APIFlagsFuncCall
```

History returns a sequence of APIFlagsFuncCall objects describing the invocations of this function. 

### <a id="APIFlagsFuncCall" href="#APIFlagsFuncCall">type APIFlagsFuncCall struct</a>

```
searchKey: mocks.APIFlagsFuncCall
tags: [exported]
```

```Go
type APIFlagsFuncCall struct {
	// Arg0 is the value of the 1st argument passed to this method
	// invocation.
	Arg0 context.Context
	// Result0 is the value of the 1st result returned from this method
	// invocation.
	Result0 v1.FlagsResult
	// Result1 is the value of the 2nd result returned from this method
	// invocation.
	Result1 error
}
```

APIFlagsFuncCall is an object that describes an invocation of method Flags on an instance of MockAPI. 

#### <a id="APIFlagsFuncCall.Args" href="#APIFlagsFuncCall.Args">func (c APIFlagsFuncCall) Args() []interface{}</a>

```
searchKey: mocks.APIFlagsFuncCall.Args
tags: [exported]
```

```Go
func (c APIFlagsFuncCall) Args() []interface{}
```

Args returns an interface slice containing the arguments of this invocation. 

#### <a id="APIFlagsFuncCall.Results" href="#APIFlagsFuncCall.Results">func (c APIFlagsFuncCall) Results() []interface{}</a>

```
searchKey: mocks.APIFlagsFuncCall.Results
tags: [exported]
```

```Go
func (c APIFlagsFuncCall) Results() []interface{}
```

Results returns an interface slice containing the results of this invocation. 

### <a id="APILabelNamesFunc" href="#APILabelNamesFunc">type APILabelNamesFunc struct</a>

```
searchKey: mocks.APILabelNamesFunc
tags: [exported]
```

```Go
type APILabelNamesFunc struct {
	defaultHook func(context.Context, time.Time, time.Time) ([]string, v1.Warnings, error)
	hooks       []func(context.Context, time.Time, time.Time) ([]string, v1.Warnings, error)
	history     []APILabelNamesFuncCall
	mutex       sync.Mutex
}
```

APILabelNamesFunc describes the behavior when the LabelNames method of the parent MockAPI instance is invoked. 

#### <a id="APILabelNamesFunc.SetDefaultHook" href="#APILabelNamesFunc.SetDefaultHook">func (f *APILabelNamesFunc) SetDefaultHook(hook func(context.Context, time.Time, time.Time) ([]string, v1.Warnings, error))</a>

```
searchKey: mocks.APILabelNamesFunc.SetDefaultHook
tags: [exported]
```

```Go
func (f *APILabelNamesFunc) SetDefaultHook(hook func(context.Context, time.Time, time.Time) ([]string, v1.Warnings, error))
```

SetDefaultHook sets function that is called when the LabelNames method of the parent MockAPI instance is invoked and the hook queue is empty. 

#### <a id="APILabelNamesFunc.PushHook" href="#APILabelNamesFunc.PushHook">func (f *APILabelNamesFunc) PushHook(hook func(context.Context, time.Time, time.Time) ([]string, v1.Warnings, error))</a>

```
searchKey: mocks.APILabelNamesFunc.PushHook
tags: [exported]
```

```Go
func (f *APILabelNamesFunc) PushHook(hook func(context.Context, time.Time, time.Time) ([]string, v1.Warnings, error))
```

PushHook adds a function to the end of hook queue. Each invocation of the LabelNames method of the parent MockAPI instance invokes the hook at the front of the queue and discards it. After the queue is empty, the default hook function is invoked for any future action. 

#### <a id="APILabelNamesFunc.SetDefaultReturn" href="#APILabelNamesFunc.SetDefaultReturn">func (f *APILabelNamesFunc) SetDefaultReturn(r0 []string, r1 v1.Warnings, r2 error)</a>

```
searchKey: mocks.APILabelNamesFunc.SetDefaultReturn
tags: [exported]
```

```Go
func (f *APILabelNamesFunc) SetDefaultReturn(r0 []string, r1 v1.Warnings, r2 error)
```

SetDefaultReturn calls SetDefaultDefaultHook with a function that returns the given values. 

#### <a id="APILabelNamesFunc.PushReturn" href="#APILabelNamesFunc.PushReturn">func (f *APILabelNamesFunc) PushReturn(r0 []string, r1 v1.Warnings, r2 error)</a>

```
searchKey: mocks.APILabelNamesFunc.PushReturn
tags: [exported]
```

```Go
func (f *APILabelNamesFunc) PushReturn(r0 []string, r1 v1.Warnings, r2 error)
```

PushReturn calls PushDefaultHook with a function that returns the given values. 

#### <a id="APILabelNamesFunc.nextHook" href="#APILabelNamesFunc.nextHook">func (f *APILabelNamesFunc) nextHook() func(context.Context, time.Time, time.Time) ([]string, v1.Warnings, error)</a>

```
searchKey: mocks.APILabelNamesFunc.nextHook
```

```Go
func (f *APILabelNamesFunc) nextHook() func(context.Context, time.Time, time.Time) ([]string, v1.Warnings, error)
```

#### <a id="APILabelNamesFunc.appendCall" href="#APILabelNamesFunc.appendCall">func (f *APILabelNamesFunc) appendCall(r0 APILabelNamesFuncCall)</a>

```
searchKey: mocks.APILabelNamesFunc.appendCall
```

```Go
func (f *APILabelNamesFunc) appendCall(r0 APILabelNamesFuncCall)
```

#### <a id="APILabelNamesFunc.History" href="#APILabelNamesFunc.History">func (f *APILabelNamesFunc) History() []APILabelNamesFuncCall</a>

```
searchKey: mocks.APILabelNamesFunc.History
tags: [exported]
```

```Go
func (f *APILabelNamesFunc) History() []APILabelNamesFuncCall
```

History returns a sequence of APILabelNamesFuncCall objects describing the invocations of this function. 

### <a id="APILabelNamesFuncCall" href="#APILabelNamesFuncCall">type APILabelNamesFuncCall struct</a>

```
searchKey: mocks.APILabelNamesFuncCall
tags: [exported]
```

```Go
type APILabelNamesFuncCall struct {
	// Arg0 is the value of the 1st argument passed to this method
	// invocation.
	Arg0 context.Context
	// Arg1 is the value of the 2nd argument passed to this method
	// invocation.
	Arg1 time.Time
	// Arg2 is the value of the 3rd argument passed to this method
	// invocation.
	Arg2 time.Time
	// Result0 is the value of the 1st result returned from this method
	// invocation.
	Result0 []string
	// Result1 is the value of the 2nd result returned from this method
	// invocation.
	Result1 v1.Warnings
	// Result2 is the value of the 3rd result returned from this method
	// invocation.
	Result2 error
}
```

APILabelNamesFuncCall is an object that describes an invocation of method LabelNames on an instance of MockAPI. 

#### <a id="APILabelNamesFuncCall.Args" href="#APILabelNamesFuncCall.Args">func (c APILabelNamesFuncCall) Args() []interface{}</a>

```
searchKey: mocks.APILabelNamesFuncCall.Args
tags: [exported]
```

```Go
func (c APILabelNamesFuncCall) Args() []interface{}
```

Args returns an interface slice containing the arguments of this invocation. 

#### <a id="APILabelNamesFuncCall.Results" href="#APILabelNamesFuncCall.Results">func (c APILabelNamesFuncCall) Results() []interface{}</a>

```
searchKey: mocks.APILabelNamesFuncCall.Results
tags: [exported]
```

```Go
func (c APILabelNamesFuncCall) Results() []interface{}
```

Results returns an interface slice containing the results of this invocation. 

### <a id="APILabelValuesFunc" href="#APILabelValuesFunc">type APILabelValuesFunc struct</a>

```
searchKey: mocks.APILabelValuesFunc
tags: [exported]
```

```Go
type APILabelValuesFunc struct {
	defaultHook func(context.Context, string, time.Time, time.Time) (model.LabelValues, v1.Warnings, error)
	hooks       []func(context.Context, string, time.Time, time.Time) (model.LabelValues, v1.Warnings, error)
	history     []APILabelValuesFuncCall
	mutex       sync.Mutex
}
```

APILabelValuesFunc describes the behavior when the LabelValues method of the parent MockAPI instance is invoked. 

#### <a id="APILabelValuesFunc.SetDefaultHook" href="#APILabelValuesFunc.SetDefaultHook">func (f *APILabelValuesFunc) SetDefaultHook(hook func(context.Context, string, time.Time, time.Time) (model.LabelValues, v1.Warnings, error))</a>

```
searchKey: mocks.APILabelValuesFunc.SetDefaultHook
tags: [exported]
```

```Go
func (f *APILabelValuesFunc) SetDefaultHook(hook func(context.Context, string, time.Time, time.Time) (model.LabelValues, v1.Warnings, error))
```

SetDefaultHook sets function that is called when the LabelValues method of the parent MockAPI instance is invoked and the hook queue is empty. 

#### <a id="APILabelValuesFunc.PushHook" href="#APILabelValuesFunc.PushHook">func (f *APILabelValuesFunc) PushHook(hook func(context.Context, string, time.Time, time.Time) (model.LabelValues, v1.Warnings, error))</a>

```
searchKey: mocks.APILabelValuesFunc.PushHook
tags: [exported]
```

```Go
func (f *APILabelValuesFunc) PushHook(hook func(context.Context, string, time.Time, time.Time) (model.LabelValues, v1.Warnings, error))
```

PushHook adds a function to the end of hook queue. Each invocation of the LabelValues method of the parent MockAPI instance invokes the hook at the front of the queue and discards it. After the queue is empty, the default hook function is invoked for any future action. 

#### <a id="APILabelValuesFunc.SetDefaultReturn" href="#APILabelValuesFunc.SetDefaultReturn">func (f *APILabelValuesFunc) SetDefaultReturn(r0 model.LabelValues, r1 v1.Warnings, r2 error)</a>

```
searchKey: mocks.APILabelValuesFunc.SetDefaultReturn
tags: [exported]
```

```Go
func (f *APILabelValuesFunc) SetDefaultReturn(r0 model.LabelValues, r1 v1.Warnings, r2 error)
```

SetDefaultReturn calls SetDefaultDefaultHook with a function that returns the given values. 

#### <a id="APILabelValuesFunc.PushReturn" href="#APILabelValuesFunc.PushReturn">func (f *APILabelValuesFunc) PushReturn(r0 model.LabelValues, r1 v1.Warnings, r2 error)</a>

```
searchKey: mocks.APILabelValuesFunc.PushReturn
tags: [exported]
```

```Go
func (f *APILabelValuesFunc) PushReturn(r0 model.LabelValues, r1 v1.Warnings, r2 error)
```

PushReturn calls PushDefaultHook with a function that returns the given values. 

#### <a id="APILabelValuesFunc.nextHook" href="#APILabelValuesFunc.nextHook">func (f *APILabelValuesFunc) nextHook() func(context.Context, string, time.Time, time.Time) (model.LabelValues, v1.Warnings, error)</a>

```
searchKey: mocks.APILabelValuesFunc.nextHook
```

```Go
func (f *APILabelValuesFunc) nextHook() func(context.Context, string, time.Time, time.Time) (model.LabelValues, v1.Warnings, error)
```

#### <a id="APILabelValuesFunc.appendCall" href="#APILabelValuesFunc.appendCall">func (f *APILabelValuesFunc) appendCall(r0 APILabelValuesFuncCall)</a>

```
searchKey: mocks.APILabelValuesFunc.appendCall
```

```Go
func (f *APILabelValuesFunc) appendCall(r0 APILabelValuesFuncCall)
```

#### <a id="APILabelValuesFunc.History" href="#APILabelValuesFunc.History">func (f *APILabelValuesFunc) History() []APILabelValuesFuncCall</a>

```
searchKey: mocks.APILabelValuesFunc.History
tags: [exported]
```

```Go
func (f *APILabelValuesFunc) History() []APILabelValuesFuncCall
```

History returns a sequence of APILabelValuesFuncCall objects describing the invocations of this function. 

### <a id="APILabelValuesFuncCall" href="#APILabelValuesFuncCall">type APILabelValuesFuncCall struct</a>

```
searchKey: mocks.APILabelValuesFuncCall
tags: [exported]
```

```Go
type APILabelValuesFuncCall struct {
	// Arg0 is the value of the 1st argument passed to this method
	// invocation.
	Arg0 context.Context
	// Arg1 is the value of the 2nd argument passed to this method
	// invocation.
	Arg1 string
	// Arg2 is the value of the 3rd argument passed to this method
	// invocation.
	Arg2 time.Time
	// Arg3 is the value of the 4th argument passed to this method
	// invocation.
	Arg3 time.Time
	// Result0 is the value of the 1st result returned from this method
	// invocation.
	Result0 model.LabelValues
	// Result1 is the value of the 2nd result returned from this method
	// invocation.
	Result1 v1.Warnings
	// Result2 is the value of the 3rd result returned from this method
	// invocation.
	Result2 error
}
```

APILabelValuesFuncCall is an object that describes an invocation of method LabelValues on an instance of MockAPI. 

#### <a id="APILabelValuesFuncCall.Args" href="#APILabelValuesFuncCall.Args">func (c APILabelValuesFuncCall) Args() []interface{}</a>

```
searchKey: mocks.APILabelValuesFuncCall.Args
tags: [exported]
```

```Go
func (c APILabelValuesFuncCall) Args() []interface{}
```

Args returns an interface slice containing the arguments of this invocation. 

#### <a id="APILabelValuesFuncCall.Results" href="#APILabelValuesFuncCall.Results">func (c APILabelValuesFuncCall) Results() []interface{}</a>

```
searchKey: mocks.APILabelValuesFuncCall.Results
tags: [exported]
```

```Go
func (c APILabelValuesFuncCall) Results() []interface{}
```

Results returns an interface slice containing the results of this invocation. 

### <a id="APIMetadataFunc" href="#APIMetadataFunc">type APIMetadataFunc struct</a>

```
searchKey: mocks.APIMetadataFunc
tags: [exported]
```

```Go
type APIMetadataFunc struct {
	defaultHook func(context.Context, string, string) (map[string][]v1.Metadata, error)
	hooks       []func(context.Context, string, string) (map[string][]v1.Metadata, error)
	history     []APIMetadataFuncCall
	mutex       sync.Mutex
}
```

APIMetadataFunc describes the behavior when the Metadata method of the parent MockAPI instance is invoked. 

#### <a id="APIMetadataFunc.SetDefaultHook" href="#APIMetadataFunc.SetDefaultHook">func (f *APIMetadataFunc) SetDefaultHook(hook func(context.Context, string, string) (map[string][]v1.Metadata, error))</a>

```
searchKey: mocks.APIMetadataFunc.SetDefaultHook
tags: [exported]
```

```Go
func (f *APIMetadataFunc) SetDefaultHook(hook func(context.Context, string, string) (map[string][]v1.Metadata, error))
```

SetDefaultHook sets function that is called when the Metadata method of the parent MockAPI instance is invoked and the hook queue is empty. 

#### <a id="APIMetadataFunc.PushHook" href="#APIMetadataFunc.PushHook">func (f *APIMetadataFunc) PushHook(hook func(context.Context, string, string) (map[string][]v1.Metadata, error))</a>

```
searchKey: mocks.APIMetadataFunc.PushHook
tags: [exported]
```

```Go
func (f *APIMetadataFunc) PushHook(hook func(context.Context, string, string) (map[string][]v1.Metadata, error))
```

PushHook adds a function to the end of hook queue. Each invocation of the Metadata method of the parent MockAPI instance invokes the hook at the front of the queue and discards it. After the queue is empty, the default hook function is invoked for any future action. 

#### <a id="APIMetadataFunc.SetDefaultReturn" href="#APIMetadataFunc.SetDefaultReturn">func (f *APIMetadataFunc) SetDefaultReturn(r0 map[string][]v1.Metadata, r1 error)</a>

```
searchKey: mocks.APIMetadataFunc.SetDefaultReturn
tags: [exported]
```

```Go
func (f *APIMetadataFunc) SetDefaultReturn(r0 map[string][]v1.Metadata, r1 error)
```

SetDefaultReturn calls SetDefaultDefaultHook with a function that returns the given values. 

#### <a id="APIMetadataFunc.PushReturn" href="#APIMetadataFunc.PushReturn">func (f *APIMetadataFunc) PushReturn(r0 map[string][]v1.Metadata, r1 error)</a>

```
searchKey: mocks.APIMetadataFunc.PushReturn
tags: [exported]
```

```Go
func (f *APIMetadataFunc) PushReturn(r0 map[string][]v1.Metadata, r1 error)
```

PushReturn calls PushDefaultHook with a function that returns the given values. 

#### <a id="APIMetadataFunc.nextHook" href="#APIMetadataFunc.nextHook">func (f *APIMetadataFunc) nextHook() func(context.Context, string, string) (map[string][]v1.Metadata, error)</a>

```
searchKey: mocks.APIMetadataFunc.nextHook
```

```Go
func (f *APIMetadataFunc) nextHook() func(context.Context, string, string) (map[string][]v1.Metadata, error)
```

#### <a id="APIMetadataFunc.appendCall" href="#APIMetadataFunc.appendCall">func (f *APIMetadataFunc) appendCall(r0 APIMetadataFuncCall)</a>

```
searchKey: mocks.APIMetadataFunc.appendCall
```

```Go
func (f *APIMetadataFunc) appendCall(r0 APIMetadataFuncCall)
```

#### <a id="APIMetadataFunc.History" href="#APIMetadataFunc.History">func (f *APIMetadataFunc) History() []APIMetadataFuncCall</a>

```
searchKey: mocks.APIMetadataFunc.History
tags: [exported]
```

```Go
func (f *APIMetadataFunc) History() []APIMetadataFuncCall
```

History returns a sequence of APIMetadataFuncCall objects describing the invocations of this function. 

### <a id="APIMetadataFuncCall" href="#APIMetadataFuncCall">type APIMetadataFuncCall struct</a>

```
searchKey: mocks.APIMetadataFuncCall
tags: [exported]
```

```Go
type APIMetadataFuncCall struct {
	// Arg0 is the value of the 1st argument passed to this method
	// invocation.
	Arg0 context.Context
	// Arg1 is the value of the 2nd argument passed to this method
	// invocation.
	Arg1 string
	// Arg2 is the value of the 3rd argument passed to this method
	// invocation.
	Arg2 string
	// Result0 is the value of the 1st result returned from this method
	// invocation.
	Result0 map[string][]v1.Metadata
	// Result1 is the value of the 2nd result returned from this method
	// invocation.
	Result1 error
}
```

APIMetadataFuncCall is an object that describes an invocation of method Metadata on an instance of MockAPI. 

#### <a id="APIMetadataFuncCall.Args" href="#APIMetadataFuncCall.Args">func (c APIMetadataFuncCall) Args() []interface{}</a>

```
searchKey: mocks.APIMetadataFuncCall.Args
tags: [exported]
```

```Go
func (c APIMetadataFuncCall) Args() []interface{}
```

Args returns an interface slice containing the arguments of this invocation. 

#### <a id="APIMetadataFuncCall.Results" href="#APIMetadataFuncCall.Results">func (c APIMetadataFuncCall) Results() []interface{}</a>

```
searchKey: mocks.APIMetadataFuncCall.Results
tags: [exported]
```

```Go
func (c APIMetadataFuncCall) Results() []interface{}
```

Results returns an interface slice containing the results of this invocation. 

### <a id="APIQueryFunc" href="#APIQueryFunc">type APIQueryFunc struct</a>

```
searchKey: mocks.APIQueryFunc
tags: [exported]
```

```Go
type APIQueryFunc struct {
	defaultHook func(context.Context, string, time.Time) (model.Value, v1.Warnings, error)
	hooks       []func(context.Context, string, time.Time) (model.Value, v1.Warnings, error)
	history     []APIQueryFuncCall
	mutex       sync.Mutex
}
```

APIQueryFunc describes the behavior when the Query method of the parent MockAPI instance is invoked. 

#### <a id="APIQueryFunc.SetDefaultHook" href="#APIQueryFunc.SetDefaultHook">func (f *APIQueryFunc) SetDefaultHook(hook func(context.Context, string, time.Time) (model.Value, v1.Warnings, error))</a>

```
searchKey: mocks.APIQueryFunc.SetDefaultHook
tags: [exported]
```

```Go
func (f *APIQueryFunc) SetDefaultHook(hook func(context.Context, string, time.Time) (model.Value, v1.Warnings, error))
```

SetDefaultHook sets function that is called when the Query method of the parent MockAPI instance is invoked and the hook queue is empty. 

#### <a id="APIQueryFunc.PushHook" href="#APIQueryFunc.PushHook">func (f *APIQueryFunc) PushHook(hook func(context.Context, string, time.Time) (model.Value, v1.Warnings, error))</a>

```
searchKey: mocks.APIQueryFunc.PushHook
tags: [exported]
```

```Go
func (f *APIQueryFunc) PushHook(hook func(context.Context, string, time.Time) (model.Value, v1.Warnings, error))
```

PushHook adds a function to the end of hook queue. Each invocation of the Query method of the parent MockAPI instance invokes the hook at the front of the queue and discards it. After the queue is empty, the default hook function is invoked for any future action. 

#### <a id="APIQueryFunc.SetDefaultReturn" href="#APIQueryFunc.SetDefaultReturn">func (f *APIQueryFunc) SetDefaultReturn(r0 model.Value, r1 v1.Warnings, r2 error)</a>

```
searchKey: mocks.APIQueryFunc.SetDefaultReturn
tags: [exported]
```

```Go
func (f *APIQueryFunc) SetDefaultReturn(r0 model.Value, r1 v1.Warnings, r2 error)
```

SetDefaultReturn calls SetDefaultDefaultHook with a function that returns the given values. 

#### <a id="APIQueryFunc.PushReturn" href="#APIQueryFunc.PushReturn">func (f *APIQueryFunc) PushReturn(r0 model.Value, r1 v1.Warnings, r2 error)</a>

```
searchKey: mocks.APIQueryFunc.PushReturn
tags: [exported]
```

```Go
func (f *APIQueryFunc) PushReturn(r0 model.Value, r1 v1.Warnings, r2 error)
```

PushReturn calls PushDefaultHook with a function that returns the given values. 

#### <a id="APIQueryFunc.nextHook" href="#APIQueryFunc.nextHook">func (f *APIQueryFunc) nextHook() func(context.Context, string, time.Time) (model.Value, v1.Warnings, error)</a>

```
searchKey: mocks.APIQueryFunc.nextHook
```

```Go
func (f *APIQueryFunc) nextHook() func(context.Context, string, time.Time) (model.Value, v1.Warnings, error)
```

#### <a id="APIQueryFunc.appendCall" href="#APIQueryFunc.appendCall">func (f *APIQueryFunc) appendCall(r0 APIQueryFuncCall)</a>

```
searchKey: mocks.APIQueryFunc.appendCall
```

```Go
func (f *APIQueryFunc) appendCall(r0 APIQueryFuncCall)
```

#### <a id="APIQueryFunc.History" href="#APIQueryFunc.History">func (f *APIQueryFunc) History() []APIQueryFuncCall</a>

```
searchKey: mocks.APIQueryFunc.History
tags: [exported]
```

```Go
func (f *APIQueryFunc) History() []APIQueryFuncCall
```

History returns a sequence of APIQueryFuncCall objects describing the invocations of this function. 

### <a id="APIQueryFuncCall" href="#APIQueryFuncCall">type APIQueryFuncCall struct</a>

```
searchKey: mocks.APIQueryFuncCall
tags: [exported]
```

```Go
type APIQueryFuncCall struct {
	// Arg0 is the value of the 1st argument passed to this method
	// invocation.
	Arg0 context.Context
	// Arg1 is the value of the 2nd argument passed to this method
	// invocation.
	Arg1 string
	// Arg2 is the value of the 3rd argument passed to this method
	// invocation.
	Arg2 time.Time
	// Result0 is the value of the 1st result returned from this method
	// invocation.
	Result0 model.Value
	// Result1 is the value of the 2nd result returned from this method
	// invocation.
	Result1 v1.Warnings
	// Result2 is the value of the 3rd result returned from this method
	// invocation.
	Result2 error
}
```

APIQueryFuncCall is an object that describes an invocation of method Query on an instance of MockAPI. 

#### <a id="APIQueryFuncCall.Args" href="#APIQueryFuncCall.Args">func (c APIQueryFuncCall) Args() []interface{}</a>

```
searchKey: mocks.APIQueryFuncCall.Args
tags: [exported]
```

```Go
func (c APIQueryFuncCall) Args() []interface{}
```

Args returns an interface slice containing the arguments of this invocation. 

#### <a id="APIQueryFuncCall.Results" href="#APIQueryFuncCall.Results">func (c APIQueryFuncCall) Results() []interface{}</a>

```
searchKey: mocks.APIQueryFuncCall.Results
tags: [exported]
```

```Go
func (c APIQueryFuncCall) Results() []interface{}
```

Results returns an interface slice containing the results of this invocation. 

### <a id="APIQueryRangeFunc" href="#APIQueryRangeFunc">type APIQueryRangeFunc struct</a>

```
searchKey: mocks.APIQueryRangeFunc
tags: [exported]
```

```Go
type APIQueryRangeFunc struct {
	defaultHook func(context.Context, string, v1.Range) (model.Value, v1.Warnings, error)
	hooks       []func(context.Context, string, v1.Range) (model.Value, v1.Warnings, error)
	history     []APIQueryRangeFuncCall
	mutex       sync.Mutex
}
```

APIQueryRangeFunc describes the behavior when the QueryRange method of the parent MockAPI instance is invoked. 

#### <a id="APIQueryRangeFunc.SetDefaultHook" href="#APIQueryRangeFunc.SetDefaultHook">func (f *APIQueryRangeFunc) SetDefaultHook(hook func(context.Context, string, v1.Range) (model.Value, v1.Warnings, error))</a>

```
searchKey: mocks.APIQueryRangeFunc.SetDefaultHook
tags: [exported]
```

```Go
func (f *APIQueryRangeFunc) SetDefaultHook(hook func(context.Context, string, v1.Range) (model.Value, v1.Warnings, error))
```

SetDefaultHook sets function that is called when the QueryRange method of the parent MockAPI instance is invoked and the hook queue is empty. 

#### <a id="APIQueryRangeFunc.PushHook" href="#APIQueryRangeFunc.PushHook">func (f *APIQueryRangeFunc) PushHook(hook func(context.Context, string, v1.Range) (model.Value, v1.Warnings, error))</a>

```
searchKey: mocks.APIQueryRangeFunc.PushHook
tags: [exported]
```

```Go
func (f *APIQueryRangeFunc) PushHook(hook func(context.Context, string, v1.Range) (model.Value, v1.Warnings, error))
```

PushHook adds a function to the end of hook queue. Each invocation of the QueryRange method of the parent MockAPI instance invokes the hook at the front of the queue and discards it. After the queue is empty, the default hook function is invoked for any future action. 

#### <a id="APIQueryRangeFunc.SetDefaultReturn" href="#APIQueryRangeFunc.SetDefaultReturn">func (f *APIQueryRangeFunc) SetDefaultReturn(r0 model.Value, r1 v1.Warnings, r2 error)</a>

```
searchKey: mocks.APIQueryRangeFunc.SetDefaultReturn
tags: [exported]
```

```Go
func (f *APIQueryRangeFunc) SetDefaultReturn(r0 model.Value, r1 v1.Warnings, r2 error)
```

SetDefaultReturn calls SetDefaultDefaultHook with a function that returns the given values. 

#### <a id="APIQueryRangeFunc.PushReturn" href="#APIQueryRangeFunc.PushReturn">func (f *APIQueryRangeFunc) PushReturn(r0 model.Value, r1 v1.Warnings, r2 error)</a>

```
searchKey: mocks.APIQueryRangeFunc.PushReturn
tags: [exported]
```

```Go
func (f *APIQueryRangeFunc) PushReturn(r0 model.Value, r1 v1.Warnings, r2 error)
```

PushReturn calls PushDefaultHook with a function that returns the given values. 

#### <a id="APIQueryRangeFunc.nextHook" href="#APIQueryRangeFunc.nextHook">func (f *APIQueryRangeFunc) nextHook() func(context.Context, string, v1.Range) (model.Value, v1.Warnings, error)</a>

```
searchKey: mocks.APIQueryRangeFunc.nextHook
```

```Go
func (f *APIQueryRangeFunc) nextHook() func(context.Context, string, v1.Range) (model.Value, v1.Warnings, error)
```

#### <a id="APIQueryRangeFunc.appendCall" href="#APIQueryRangeFunc.appendCall">func (f *APIQueryRangeFunc) appendCall(r0 APIQueryRangeFuncCall)</a>

```
searchKey: mocks.APIQueryRangeFunc.appendCall
```

```Go
func (f *APIQueryRangeFunc) appendCall(r0 APIQueryRangeFuncCall)
```

#### <a id="APIQueryRangeFunc.History" href="#APIQueryRangeFunc.History">func (f *APIQueryRangeFunc) History() []APIQueryRangeFuncCall</a>

```
searchKey: mocks.APIQueryRangeFunc.History
tags: [exported]
```

```Go
func (f *APIQueryRangeFunc) History() []APIQueryRangeFuncCall
```

History returns a sequence of APIQueryRangeFuncCall objects describing the invocations of this function. 

### <a id="APIQueryRangeFuncCall" href="#APIQueryRangeFuncCall">type APIQueryRangeFuncCall struct</a>

```
searchKey: mocks.APIQueryRangeFuncCall
tags: [exported]
```

```Go
type APIQueryRangeFuncCall struct {
	// Arg0 is the value of the 1st argument passed to this method
	// invocation.
	Arg0 context.Context
	// Arg1 is the value of the 2nd argument passed to this method
	// invocation.
	Arg1 string
	// Arg2 is the value of the 3rd argument passed to this method
	// invocation.
	Arg2 v1.Range
	// Result0 is the value of the 1st result returned from this method
	// invocation.
	Result0 model.Value
	// Result1 is the value of the 2nd result returned from this method
	// invocation.
	Result1 v1.Warnings
	// Result2 is the value of the 3rd result returned from this method
	// invocation.
	Result2 error
}
```

APIQueryRangeFuncCall is an object that describes an invocation of method QueryRange on an instance of MockAPI. 

#### <a id="APIQueryRangeFuncCall.Args" href="#APIQueryRangeFuncCall.Args">func (c APIQueryRangeFuncCall) Args() []interface{}</a>

```
searchKey: mocks.APIQueryRangeFuncCall.Args
tags: [exported]
```

```Go
func (c APIQueryRangeFuncCall) Args() []interface{}
```

Args returns an interface slice containing the arguments of this invocation. 

#### <a id="APIQueryRangeFuncCall.Results" href="#APIQueryRangeFuncCall.Results">func (c APIQueryRangeFuncCall) Results() []interface{}</a>

```
searchKey: mocks.APIQueryRangeFuncCall.Results
tags: [exported]
```

```Go
func (c APIQueryRangeFuncCall) Results() []interface{}
```

Results returns an interface slice containing the results of this invocation. 

### <a id="APIRulesFunc" href="#APIRulesFunc">type APIRulesFunc struct</a>

```
searchKey: mocks.APIRulesFunc
tags: [exported]
```

```Go
type APIRulesFunc struct {
	defaultHook func(context.Context) (v1.RulesResult, error)
	hooks       []func(context.Context) (v1.RulesResult, error)
	history     []APIRulesFuncCall
	mutex       sync.Mutex
}
```

APIRulesFunc describes the behavior when the Rules method of the parent MockAPI instance is invoked. 

#### <a id="APIRulesFunc.SetDefaultHook" href="#APIRulesFunc.SetDefaultHook">func (f *APIRulesFunc) SetDefaultHook(hook func(context.Context) (v1.RulesResult, error))</a>

```
searchKey: mocks.APIRulesFunc.SetDefaultHook
tags: [exported]
```

```Go
func (f *APIRulesFunc) SetDefaultHook(hook func(context.Context) (v1.RulesResult, error))
```

SetDefaultHook sets function that is called when the Rules method of the parent MockAPI instance is invoked and the hook queue is empty. 

#### <a id="APIRulesFunc.PushHook" href="#APIRulesFunc.PushHook">func (f *APIRulesFunc) PushHook(hook func(context.Context) (v1.RulesResult, error))</a>

```
searchKey: mocks.APIRulesFunc.PushHook
tags: [exported]
```

```Go
func (f *APIRulesFunc) PushHook(hook func(context.Context) (v1.RulesResult, error))
```

PushHook adds a function to the end of hook queue. Each invocation of the Rules method of the parent MockAPI instance invokes the hook at the front of the queue and discards it. After the queue is empty, the default hook function is invoked for any future action. 

#### <a id="APIRulesFunc.SetDefaultReturn" href="#APIRulesFunc.SetDefaultReturn">func (f *APIRulesFunc) SetDefaultReturn(r0 v1.RulesResult, r1 error)</a>

```
searchKey: mocks.APIRulesFunc.SetDefaultReturn
tags: [exported]
```

```Go
func (f *APIRulesFunc) SetDefaultReturn(r0 v1.RulesResult, r1 error)
```

SetDefaultReturn calls SetDefaultDefaultHook with a function that returns the given values. 

#### <a id="APIRulesFunc.PushReturn" href="#APIRulesFunc.PushReturn">func (f *APIRulesFunc) PushReturn(r0 v1.RulesResult, r1 error)</a>

```
searchKey: mocks.APIRulesFunc.PushReturn
tags: [exported]
```

```Go
func (f *APIRulesFunc) PushReturn(r0 v1.RulesResult, r1 error)
```

PushReturn calls PushDefaultHook with a function that returns the given values. 

#### <a id="APIRulesFunc.nextHook" href="#APIRulesFunc.nextHook">func (f *APIRulesFunc) nextHook() func(context.Context) (v1.RulesResult, error)</a>

```
searchKey: mocks.APIRulesFunc.nextHook
```

```Go
func (f *APIRulesFunc) nextHook() func(context.Context) (v1.RulesResult, error)
```

#### <a id="APIRulesFunc.appendCall" href="#APIRulesFunc.appendCall">func (f *APIRulesFunc) appendCall(r0 APIRulesFuncCall)</a>

```
searchKey: mocks.APIRulesFunc.appendCall
```

```Go
func (f *APIRulesFunc) appendCall(r0 APIRulesFuncCall)
```

#### <a id="APIRulesFunc.History" href="#APIRulesFunc.History">func (f *APIRulesFunc) History() []APIRulesFuncCall</a>

```
searchKey: mocks.APIRulesFunc.History
tags: [exported]
```

```Go
func (f *APIRulesFunc) History() []APIRulesFuncCall
```

History returns a sequence of APIRulesFuncCall objects describing the invocations of this function. 

### <a id="APIRulesFuncCall" href="#APIRulesFuncCall">type APIRulesFuncCall struct</a>

```
searchKey: mocks.APIRulesFuncCall
tags: [exported]
```

```Go
type APIRulesFuncCall struct {
	// Arg0 is the value of the 1st argument passed to this method
	// invocation.
	Arg0 context.Context
	// Result0 is the value of the 1st result returned from this method
	// invocation.
	Result0 v1.RulesResult
	// Result1 is the value of the 2nd result returned from this method
	// invocation.
	Result1 error
}
```

APIRulesFuncCall is an object that describes an invocation of method Rules on an instance of MockAPI. 

#### <a id="APIRulesFuncCall.Args" href="#APIRulesFuncCall.Args">func (c APIRulesFuncCall) Args() []interface{}</a>

```
searchKey: mocks.APIRulesFuncCall.Args
tags: [exported]
```

```Go
func (c APIRulesFuncCall) Args() []interface{}
```

Args returns an interface slice containing the arguments of this invocation. 

#### <a id="APIRulesFuncCall.Results" href="#APIRulesFuncCall.Results">func (c APIRulesFuncCall) Results() []interface{}</a>

```
searchKey: mocks.APIRulesFuncCall.Results
tags: [exported]
```

```Go
func (c APIRulesFuncCall) Results() []interface{}
```

Results returns an interface slice containing the results of this invocation. 

### <a id="APIRuntimeinfoFunc" href="#APIRuntimeinfoFunc">type APIRuntimeinfoFunc struct</a>

```
searchKey: mocks.APIRuntimeinfoFunc
tags: [exported]
```

```Go
type APIRuntimeinfoFunc struct {
	defaultHook func(context.Context) (v1.RuntimeinfoResult, error)
	hooks       []func(context.Context) (v1.RuntimeinfoResult, error)
	history     []APIRuntimeinfoFuncCall
	mutex       sync.Mutex
}
```

APIRuntimeinfoFunc describes the behavior when the Runtimeinfo method of the parent MockAPI instance is invoked. 

#### <a id="APIRuntimeinfoFunc.SetDefaultHook" href="#APIRuntimeinfoFunc.SetDefaultHook">func (f *APIRuntimeinfoFunc) SetDefaultHook(hook func(context.Context) (v1.RuntimeinfoResult, error))</a>

```
searchKey: mocks.APIRuntimeinfoFunc.SetDefaultHook
tags: [exported]
```

```Go
func (f *APIRuntimeinfoFunc) SetDefaultHook(hook func(context.Context) (v1.RuntimeinfoResult, error))
```

SetDefaultHook sets function that is called when the Runtimeinfo method of the parent MockAPI instance is invoked and the hook queue is empty. 

#### <a id="APIRuntimeinfoFunc.PushHook" href="#APIRuntimeinfoFunc.PushHook">func (f *APIRuntimeinfoFunc) PushHook(hook func(context.Context) (v1.RuntimeinfoResult, error))</a>

```
searchKey: mocks.APIRuntimeinfoFunc.PushHook
tags: [exported]
```

```Go
func (f *APIRuntimeinfoFunc) PushHook(hook func(context.Context) (v1.RuntimeinfoResult, error))
```

PushHook adds a function to the end of hook queue. Each invocation of the Runtimeinfo method of the parent MockAPI instance invokes the hook at the front of the queue and discards it. After the queue is empty, the default hook function is invoked for any future action. 

#### <a id="APIRuntimeinfoFunc.SetDefaultReturn" href="#APIRuntimeinfoFunc.SetDefaultReturn">func (f *APIRuntimeinfoFunc) SetDefaultReturn(r0 v1.RuntimeinfoResult, r1 error)</a>

```
searchKey: mocks.APIRuntimeinfoFunc.SetDefaultReturn
tags: [exported]
```

```Go
func (f *APIRuntimeinfoFunc) SetDefaultReturn(r0 v1.RuntimeinfoResult, r1 error)
```

SetDefaultReturn calls SetDefaultDefaultHook with a function that returns the given values. 

#### <a id="APIRuntimeinfoFunc.PushReturn" href="#APIRuntimeinfoFunc.PushReturn">func (f *APIRuntimeinfoFunc) PushReturn(r0 v1.RuntimeinfoResult, r1 error)</a>

```
searchKey: mocks.APIRuntimeinfoFunc.PushReturn
tags: [exported]
```

```Go
func (f *APIRuntimeinfoFunc) PushReturn(r0 v1.RuntimeinfoResult, r1 error)
```

PushReturn calls PushDefaultHook with a function that returns the given values. 

#### <a id="APIRuntimeinfoFunc.nextHook" href="#APIRuntimeinfoFunc.nextHook">func (f *APIRuntimeinfoFunc) nextHook() func(context.Context) (v1.RuntimeinfoResult, error)</a>

```
searchKey: mocks.APIRuntimeinfoFunc.nextHook
```

```Go
func (f *APIRuntimeinfoFunc) nextHook() func(context.Context) (v1.RuntimeinfoResult, error)
```

#### <a id="APIRuntimeinfoFunc.appendCall" href="#APIRuntimeinfoFunc.appendCall">func (f *APIRuntimeinfoFunc) appendCall(r0 APIRuntimeinfoFuncCall)</a>

```
searchKey: mocks.APIRuntimeinfoFunc.appendCall
```

```Go
func (f *APIRuntimeinfoFunc) appendCall(r0 APIRuntimeinfoFuncCall)
```

#### <a id="APIRuntimeinfoFunc.History" href="#APIRuntimeinfoFunc.History">func (f *APIRuntimeinfoFunc) History() []APIRuntimeinfoFuncCall</a>

```
searchKey: mocks.APIRuntimeinfoFunc.History
tags: [exported]
```

```Go
func (f *APIRuntimeinfoFunc) History() []APIRuntimeinfoFuncCall
```

History returns a sequence of APIRuntimeinfoFuncCall objects describing the invocations of this function. 

### <a id="APIRuntimeinfoFuncCall" href="#APIRuntimeinfoFuncCall">type APIRuntimeinfoFuncCall struct</a>

```
searchKey: mocks.APIRuntimeinfoFuncCall
tags: [exported]
```

```Go
type APIRuntimeinfoFuncCall struct {
	// Arg0 is the value of the 1st argument passed to this method
	// invocation.
	Arg0 context.Context
	// Result0 is the value of the 1st result returned from this method
	// invocation.
	Result0 v1.RuntimeinfoResult
	// Result1 is the value of the 2nd result returned from this method
	// invocation.
	Result1 error
}
```

APIRuntimeinfoFuncCall is an object that describes an invocation of method Runtimeinfo on an instance of MockAPI. 

#### <a id="APIRuntimeinfoFuncCall.Args" href="#APIRuntimeinfoFuncCall.Args">func (c APIRuntimeinfoFuncCall) Args() []interface{}</a>

```
searchKey: mocks.APIRuntimeinfoFuncCall.Args
tags: [exported]
```

```Go
func (c APIRuntimeinfoFuncCall) Args() []interface{}
```

Args returns an interface slice containing the arguments of this invocation. 

#### <a id="APIRuntimeinfoFuncCall.Results" href="#APIRuntimeinfoFuncCall.Results">func (c APIRuntimeinfoFuncCall) Results() []interface{}</a>

```
searchKey: mocks.APIRuntimeinfoFuncCall.Results
tags: [exported]
```

```Go
func (c APIRuntimeinfoFuncCall) Results() []interface{}
```

Results returns an interface slice containing the results of this invocation. 

### <a id="APISeriesFunc" href="#APISeriesFunc">type APISeriesFunc struct</a>

```
searchKey: mocks.APISeriesFunc
tags: [exported]
```

```Go
type APISeriesFunc struct {
	defaultHook func(context.Context, []string, time.Time, time.Time) ([]model.LabelSet, v1.Warnings, error)
	hooks       []func(context.Context, []string, time.Time, time.Time) ([]model.LabelSet, v1.Warnings, error)
	history     []APISeriesFuncCall
	mutex       sync.Mutex
}
```

APISeriesFunc describes the behavior when the Series method of the parent MockAPI instance is invoked. 

#### <a id="APISeriesFunc.SetDefaultHook" href="#APISeriesFunc.SetDefaultHook">func (f *APISeriesFunc) SetDefaultHook(hook func(context.Context, []string, time.Time, time.Time) ([]model.LabelSet, v1.Warnings, error))</a>

```
searchKey: mocks.APISeriesFunc.SetDefaultHook
tags: [exported]
```

```Go
func (f *APISeriesFunc) SetDefaultHook(hook func(context.Context, []string, time.Time, time.Time) ([]model.LabelSet, v1.Warnings, error))
```

SetDefaultHook sets function that is called when the Series method of the parent MockAPI instance is invoked and the hook queue is empty. 

#### <a id="APISeriesFunc.PushHook" href="#APISeriesFunc.PushHook">func (f *APISeriesFunc) PushHook(hook func(context.Context, []string, time.Time, time.Time) ([]model.LabelSet, v1.Warnings, error))</a>

```
searchKey: mocks.APISeriesFunc.PushHook
tags: [exported]
```

```Go
func (f *APISeriesFunc) PushHook(hook func(context.Context, []string, time.Time, time.Time) ([]model.LabelSet, v1.Warnings, error))
```

PushHook adds a function to the end of hook queue. Each invocation of the Series method of the parent MockAPI instance invokes the hook at the front of the queue and discards it. After the queue is empty, the default hook function is invoked for any future action. 

#### <a id="APISeriesFunc.SetDefaultReturn" href="#APISeriesFunc.SetDefaultReturn">func (f *APISeriesFunc) SetDefaultReturn(r0 []model.LabelSet, r1 v1.Warnings, r2 error)</a>

```
searchKey: mocks.APISeriesFunc.SetDefaultReturn
tags: [exported]
```

```Go
func (f *APISeriesFunc) SetDefaultReturn(r0 []model.LabelSet, r1 v1.Warnings, r2 error)
```

SetDefaultReturn calls SetDefaultDefaultHook with a function that returns the given values. 

#### <a id="APISeriesFunc.PushReturn" href="#APISeriesFunc.PushReturn">func (f *APISeriesFunc) PushReturn(r0 []model.LabelSet, r1 v1.Warnings, r2 error)</a>

```
searchKey: mocks.APISeriesFunc.PushReturn
tags: [exported]
```

```Go
func (f *APISeriesFunc) PushReturn(r0 []model.LabelSet, r1 v1.Warnings, r2 error)
```

PushReturn calls PushDefaultHook with a function that returns the given values. 

#### <a id="APISeriesFunc.nextHook" href="#APISeriesFunc.nextHook">func (f *APISeriesFunc) nextHook() func(context.Context, []string, time.Time, time.Time) ([]model.LabelSet, v1.Warnings, error)</a>

```
searchKey: mocks.APISeriesFunc.nextHook
```

```Go
func (f *APISeriesFunc) nextHook() func(context.Context, []string, time.Time, time.Time) ([]model.LabelSet, v1.Warnings, error)
```

#### <a id="APISeriesFunc.appendCall" href="#APISeriesFunc.appendCall">func (f *APISeriesFunc) appendCall(r0 APISeriesFuncCall)</a>

```
searchKey: mocks.APISeriesFunc.appendCall
```

```Go
func (f *APISeriesFunc) appendCall(r0 APISeriesFuncCall)
```

#### <a id="APISeriesFunc.History" href="#APISeriesFunc.History">func (f *APISeriesFunc) History() []APISeriesFuncCall</a>

```
searchKey: mocks.APISeriesFunc.History
tags: [exported]
```

```Go
func (f *APISeriesFunc) History() []APISeriesFuncCall
```

History returns a sequence of APISeriesFuncCall objects describing the invocations of this function. 

### <a id="APISeriesFuncCall" href="#APISeriesFuncCall">type APISeriesFuncCall struct</a>

```
searchKey: mocks.APISeriesFuncCall
tags: [exported]
```

```Go
type APISeriesFuncCall struct {
	// Arg0 is the value of the 1st argument passed to this method
	// invocation.
	Arg0 context.Context
	// Arg1 is the value of the 2nd argument passed to this method
	// invocation.
	Arg1 []string
	// Arg2 is the value of the 3rd argument passed to this method
	// invocation.
	Arg2 time.Time
	// Arg3 is the value of the 4th argument passed to this method
	// invocation.
	Arg3 time.Time
	// Result0 is the value of the 1st result returned from this method
	// invocation.
	Result0 []model.LabelSet
	// Result1 is the value of the 2nd result returned from this method
	// invocation.
	Result1 v1.Warnings
	// Result2 is the value of the 3rd result returned from this method
	// invocation.
	Result2 error
}
```

APISeriesFuncCall is an object that describes an invocation of method Series on an instance of MockAPI. 

#### <a id="APISeriesFuncCall.Args" href="#APISeriesFuncCall.Args">func (c APISeriesFuncCall) Args() []interface{}</a>

```
searchKey: mocks.APISeriesFuncCall.Args
tags: [exported]
```

```Go
func (c APISeriesFuncCall) Args() []interface{}
```

Args returns an interface slice containing the arguments of this invocation. 

#### <a id="APISeriesFuncCall.Results" href="#APISeriesFuncCall.Results">func (c APISeriesFuncCall) Results() []interface{}</a>

```
searchKey: mocks.APISeriesFuncCall.Results
tags: [exported]
```

```Go
func (c APISeriesFuncCall) Results() []interface{}
```

Results returns an interface slice containing the results of this invocation. 

### <a id="APISnapshotFunc" href="#APISnapshotFunc">type APISnapshotFunc struct</a>

```
searchKey: mocks.APISnapshotFunc
tags: [exported]
```

```Go
type APISnapshotFunc struct {
	defaultHook func(context.Context, bool) (v1.SnapshotResult, error)
	hooks       []func(context.Context, bool) (v1.SnapshotResult, error)
	history     []APISnapshotFuncCall
	mutex       sync.Mutex
}
```

APISnapshotFunc describes the behavior when the Snapshot method of the parent MockAPI instance is invoked. 

#### <a id="APISnapshotFunc.SetDefaultHook" href="#APISnapshotFunc.SetDefaultHook">func (f *APISnapshotFunc) SetDefaultHook(hook func(context.Context, bool) (v1.SnapshotResult, error))</a>

```
searchKey: mocks.APISnapshotFunc.SetDefaultHook
tags: [exported]
```

```Go
func (f *APISnapshotFunc) SetDefaultHook(hook func(context.Context, bool) (v1.SnapshotResult, error))
```

SetDefaultHook sets function that is called when the Snapshot method of the parent MockAPI instance is invoked and the hook queue is empty. 

#### <a id="APISnapshotFunc.PushHook" href="#APISnapshotFunc.PushHook">func (f *APISnapshotFunc) PushHook(hook func(context.Context, bool) (v1.SnapshotResult, error))</a>

```
searchKey: mocks.APISnapshotFunc.PushHook
tags: [exported]
```

```Go
func (f *APISnapshotFunc) PushHook(hook func(context.Context, bool) (v1.SnapshotResult, error))
```

PushHook adds a function to the end of hook queue. Each invocation of the Snapshot method of the parent MockAPI instance invokes the hook at the front of the queue and discards it. After the queue is empty, the default hook function is invoked for any future action. 

#### <a id="APISnapshotFunc.SetDefaultReturn" href="#APISnapshotFunc.SetDefaultReturn">func (f *APISnapshotFunc) SetDefaultReturn(r0 v1.SnapshotResult, r1 error)</a>

```
searchKey: mocks.APISnapshotFunc.SetDefaultReturn
tags: [exported]
```

```Go
func (f *APISnapshotFunc) SetDefaultReturn(r0 v1.SnapshotResult, r1 error)
```

SetDefaultReturn calls SetDefaultDefaultHook with a function that returns the given values. 

#### <a id="APISnapshotFunc.PushReturn" href="#APISnapshotFunc.PushReturn">func (f *APISnapshotFunc) PushReturn(r0 v1.SnapshotResult, r1 error)</a>

```
searchKey: mocks.APISnapshotFunc.PushReturn
tags: [exported]
```

```Go
func (f *APISnapshotFunc) PushReturn(r0 v1.SnapshotResult, r1 error)
```

PushReturn calls PushDefaultHook with a function that returns the given values. 

#### <a id="APISnapshotFunc.nextHook" href="#APISnapshotFunc.nextHook">func (f *APISnapshotFunc) nextHook() func(context.Context, bool) (v1.SnapshotResult, error)</a>

```
searchKey: mocks.APISnapshotFunc.nextHook
```

```Go
func (f *APISnapshotFunc) nextHook() func(context.Context, bool) (v1.SnapshotResult, error)
```

#### <a id="APISnapshotFunc.appendCall" href="#APISnapshotFunc.appendCall">func (f *APISnapshotFunc) appendCall(r0 APISnapshotFuncCall)</a>

```
searchKey: mocks.APISnapshotFunc.appendCall
```

```Go
func (f *APISnapshotFunc) appendCall(r0 APISnapshotFuncCall)
```

#### <a id="APISnapshotFunc.History" href="#APISnapshotFunc.History">func (f *APISnapshotFunc) History() []APISnapshotFuncCall</a>

```
searchKey: mocks.APISnapshotFunc.History
tags: [exported]
```

```Go
func (f *APISnapshotFunc) History() []APISnapshotFuncCall
```

History returns a sequence of APISnapshotFuncCall objects describing the invocations of this function. 

### <a id="APISnapshotFuncCall" href="#APISnapshotFuncCall">type APISnapshotFuncCall struct</a>

```
searchKey: mocks.APISnapshotFuncCall
tags: [exported]
```

```Go
type APISnapshotFuncCall struct {
	// Arg0 is the value of the 1st argument passed to this method
	// invocation.
	Arg0 context.Context
	// Arg1 is the value of the 2nd argument passed to this method
	// invocation.
	Arg1 bool
	// Result0 is the value of the 1st result returned from this method
	// invocation.
	Result0 v1.SnapshotResult
	// Result1 is the value of the 2nd result returned from this method
	// invocation.
	Result1 error
}
```

APISnapshotFuncCall is an object that describes an invocation of method Snapshot on an instance of MockAPI. 

#### <a id="APISnapshotFuncCall.Args" href="#APISnapshotFuncCall.Args">func (c APISnapshotFuncCall) Args() []interface{}</a>

```
searchKey: mocks.APISnapshotFuncCall.Args
tags: [exported]
```

```Go
func (c APISnapshotFuncCall) Args() []interface{}
```

Args returns an interface slice containing the arguments of this invocation. 

#### <a id="APISnapshotFuncCall.Results" href="#APISnapshotFuncCall.Results">func (c APISnapshotFuncCall) Results() []interface{}</a>

```
searchKey: mocks.APISnapshotFuncCall.Results
tags: [exported]
```

```Go
func (c APISnapshotFuncCall) Results() []interface{}
```

Results returns an interface slice containing the results of this invocation. 

### <a id="APITSDBFunc" href="#APITSDBFunc">type APITSDBFunc struct</a>

```
searchKey: mocks.APITSDBFunc
tags: [exported]
```

```Go
type APITSDBFunc struct {
	defaultHook func(context.Context) (v1.TSDBResult, error)
	hooks       []func(context.Context) (v1.TSDBResult, error)
	history     []APITSDBFuncCall
	mutex       sync.Mutex
}
```

APITSDBFunc describes the behavior when the TSDB method of the parent MockAPI instance is invoked. 

#### <a id="APITSDBFunc.SetDefaultHook" href="#APITSDBFunc.SetDefaultHook">func (f *APITSDBFunc) SetDefaultHook(hook func(context.Context) (v1.TSDBResult, error))</a>

```
searchKey: mocks.APITSDBFunc.SetDefaultHook
tags: [exported]
```

```Go
func (f *APITSDBFunc) SetDefaultHook(hook func(context.Context) (v1.TSDBResult, error))
```

SetDefaultHook sets function that is called when the TSDB method of the parent MockAPI instance is invoked and the hook queue is empty. 

#### <a id="APITSDBFunc.PushHook" href="#APITSDBFunc.PushHook">func (f *APITSDBFunc) PushHook(hook func(context.Context) (v1.TSDBResult, error))</a>

```
searchKey: mocks.APITSDBFunc.PushHook
tags: [exported]
```

```Go
func (f *APITSDBFunc) PushHook(hook func(context.Context) (v1.TSDBResult, error))
```

PushHook adds a function to the end of hook queue. Each invocation of the TSDB method of the parent MockAPI instance invokes the hook at the front of the queue and discards it. After the queue is empty, the default hook function is invoked for any future action. 

#### <a id="APITSDBFunc.SetDefaultReturn" href="#APITSDBFunc.SetDefaultReturn">func (f *APITSDBFunc) SetDefaultReturn(r0 v1.TSDBResult, r1 error)</a>

```
searchKey: mocks.APITSDBFunc.SetDefaultReturn
tags: [exported]
```

```Go
func (f *APITSDBFunc) SetDefaultReturn(r0 v1.TSDBResult, r1 error)
```

SetDefaultReturn calls SetDefaultDefaultHook with a function that returns the given values. 

#### <a id="APITSDBFunc.PushReturn" href="#APITSDBFunc.PushReturn">func (f *APITSDBFunc) PushReturn(r0 v1.TSDBResult, r1 error)</a>

```
searchKey: mocks.APITSDBFunc.PushReturn
tags: [exported]
```

```Go
func (f *APITSDBFunc) PushReturn(r0 v1.TSDBResult, r1 error)
```

PushReturn calls PushDefaultHook with a function that returns the given values. 

#### <a id="APITSDBFunc.nextHook" href="#APITSDBFunc.nextHook">func (f *APITSDBFunc) nextHook() func(context.Context) (v1.TSDBResult, error)</a>

```
searchKey: mocks.APITSDBFunc.nextHook
```

```Go
func (f *APITSDBFunc) nextHook() func(context.Context) (v1.TSDBResult, error)
```

#### <a id="APITSDBFunc.appendCall" href="#APITSDBFunc.appendCall">func (f *APITSDBFunc) appendCall(r0 APITSDBFuncCall)</a>

```
searchKey: mocks.APITSDBFunc.appendCall
```

```Go
func (f *APITSDBFunc) appendCall(r0 APITSDBFuncCall)
```

#### <a id="APITSDBFunc.History" href="#APITSDBFunc.History">func (f *APITSDBFunc) History() []APITSDBFuncCall</a>

```
searchKey: mocks.APITSDBFunc.History
tags: [exported]
```

```Go
func (f *APITSDBFunc) History() []APITSDBFuncCall
```

History returns a sequence of APITSDBFuncCall objects describing the invocations of this function. 

### <a id="APITSDBFuncCall" href="#APITSDBFuncCall">type APITSDBFuncCall struct</a>

```
searchKey: mocks.APITSDBFuncCall
tags: [exported]
```

```Go
type APITSDBFuncCall struct {
	// Arg0 is the value of the 1st argument passed to this method
	// invocation.
	Arg0 context.Context
	// Result0 is the value of the 1st result returned from this method
	// invocation.
	Result0 v1.TSDBResult
	// Result1 is the value of the 2nd result returned from this method
	// invocation.
	Result1 error
}
```

APITSDBFuncCall is an object that describes an invocation of method TSDB on an instance of MockAPI. 

#### <a id="APITSDBFuncCall.Args" href="#APITSDBFuncCall.Args">func (c APITSDBFuncCall) Args() []interface{}</a>

```
searchKey: mocks.APITSDBFuncCall.Args
tags: [exported]
```

```Go
func (c APITSDBFuncCall) Args() []interface{}
```

Args returns an interface slice containing the arguments of this invocation. 

#### <a id="APITSDBFuncCall.Results" href="#APITSDBFuncCall.Results">func (c APITSDBFuncCall) Results() []interface{}</a>

```
searchKey: mocks.APITSDBFuncCall.Results
tags: [exported]
```

```Go
func (c APITSDBFuncCall) Results() []interface{}
```

Results returns an interface slice containing the results of this invocation. 

### <a id="APITargetsFunc" href="#APITargetsFunc">type APITargetsFunc struct</a>

```
searchKey: mocks.APITargetsFunc
tags: [exported]
```

```Go
type APITargetsFunc struct {
	defaultHook func(context.Context) (v1.TargetsResult, error)
	hooks       []func(context.Context) (v1.TargetsResult, error)
	history     []APITargetsFuncCall
	mutex       sync.Mutex
}
```

APITargetsFunc describes the behavior when the Targets method of the parent MockAPI instance is invoked. 

#### <a id="APITargetsFunc.SetDefaultHook" href="#APITargetsFunc.SetDefaultHook">func (f *APITargetsFunc) SetDefaultHook(hook func(context.Context) (v1.TargetsResult, error))</a>

```
searchKey: mocks.APITargetsFunc.SetDefaultHook
tags: [exported]
```

```Go
func (f *APITargetsFunc) SetDefaultHook(hook func(context.Context) (v1.TargetsResult, error))
```

SetDefaultHook sets function that is called when the Targets method of the parent MockAPI instance is invoked and the hook queue is empty. 

#### <a id="APITargetsFunc.PushHook" href="#APITargetsFunc.PushHook">func (f *APITargetsFunc) PushHook(hook func(context.Context) (v1.TargetsResult, error))</a>

```
searchKey: mocks.APITargetsFunc.PushHook
tags: [exported]
```

```Go
func (f *APITargetsFunc) PushHook(hook func(context.Context) (v1.TargetsResult, error))
```

PushHook adds a function to the end of hook queue. Each invocation of the Targets method of the parent MockAPI instance invokes the hook at the front of the queue and discards it. After the queue is empty, the default hook function is invoked for any future action. 

#### <a id="APITargetsFunc.SetDefaultReturn" href="#APITargetsFunc.SetDefaultReturn">func (f *APITargetsFunc) SetDefaultReturn(r0 v1.TargetsResult, r1 error)</a>

```
searchKey: mocks.APITargetsFunc.SetDefaultReturn
tags: [exported]
```

```Go
func (f *APITargetsFunc) SetDefaultReturn(r0 v1.TargetsResult, r1 error)
```

SetDefaultReturn calls SetDefaultDefaultHook with a function that returns the given values. 

#### <a id="APITargetsFunc.PushReturn" href="#APITargetsFunc.PushReturn">func (f *APITargetsFunc) PushReturn(r0 v1.TargetsResult, r1 error)</a>

```
searchKey: mocks.APITargetsFunc.PushReturn
tags: [exported]
```

```Go
func (f *APITargetsFunc) PushReturn(r0 v1.TargetsResult, r1 error)
```

PushReturn calls PushDefaultHook with a function that returns the given values. 

#### <a id="APITargetsFunc.nextHook" href="#APITargetsFunc.nextHook">func (f *APITargetsFunc) nextHook() func(context.Context) (v1.TargetsResult, error)</a>

```
searchKey: mocks.APITargetsFunc.nextHook
```

```Go
func (f *APITargetsFunc) nextHook() func(context.Context) (v1.TargetsResult, error)
```

#### <a id="APITargetsFunc.appendCall" href="#APITargetsFunc.appendCall">func (f *APITargetsFunc) appendCall(r0 APITargetsFuncCall)</a>

```
searchKey: mocks.APITargetsFunc.appendCall
```

```Go
func (f *APITargetsFunc) appendCall(r0 APITargetsFuncCall)
```

#### <a id="APITargetsFunc.History" href="#APITargetsFunc.History">func (f *APITargetsFunc) History() []APITargetsFuncCall</a>

```
searchKey: mocks.APITargetsFunc.History
tags: [exported]
```

```Go
func (f *APITargetsFunc) History() []APITargetsFuncCall
```

History returns a sequence of APITargetsFuncCall objects describing the invocations of this function. 

### <a id="APITargetsFuncCall" href="#APITargetsFuncCall">type APITargetsFuncCall struct</a>

```
searchKey: mocks.APITargetsFuncCall
tags: [exported]
```

```Go
type APITargetsFuncCall struct {
	// Arg0 is the value of the 1st argument passed to this method
	// invocation.
	Arg0 context.Context
	// Result0 is the value of the 1st result returned from this method
	// invocation.
	Result0 v1.TargetsResult
	// Result1 is the value of the 2nd result returned from this method
	// invocation.
	Result1 error
}
```

APITargetsFuncCall is an object that describes an invocation of method Targets on an instance of MockAPI. 

#### <a id="APITargetsFuncCall.Args" href="#APITargetsFuncCall.Args">func (c APITargetsFuncCall) Args() []interface{}</a>

```
searchKey: mocks.APITargetsFuncCall.Args
tags: [exported]
```

```Go
func (c APITargetsFuncCall) Args() []interface{}
```

Args returns an interface slice containing the arguments of this invocation. 

#### <a id="APITargetsFuncCall.Results" href="#APITargetsFuncCall.Results">func (c APITargetsFuncCall) Results() []interface{}</a>

```
searchKey: mocks.APITargetsFuncCall.Results
tags: [exported]
```

```Go
func (c APITargetsFuncCall) Results() []interface{}
```

Results returns an interface slice containing the results of this invocation. 

### <a id="APITargetsMetadataFunc" href="#APITargetsMetadataFunc">type APITargetsMetadataFunc struct</a>

```
searchKey: mocks.APITargetsMetadataFunc
tags: [exported]
```

```Go
type APITargetsMetadataFunc struct {
	defaultHook func(context.Context, string, string, string) ([]v1.MetricMetadata, error)
	hooks       []func(context.Context, string, string, string) ([]v1.MetricMetadata, error)
	history     []APITargetsMetadataFuncCall
	mutex       sync.Mutex
}
```

APITargetsMetadataFunc describes the behavior when the TargetsMetadata method of the parent MockAPI instance is invoked. 

#### <a id="APITargetsMetadataFunc.SetDefaultHook" href="#APITargetsMetadataFunc.SetDefaultHook">func (f *APITargetsMetadataFunc) SetDefaultHook(hook func(context.Context, string, string, string) ([]v1.MetricMetadata, error))</a>

```
searchKey: mocks.APITargetsMetadataFunc.SetDefaultHook
tags: [exported]
```

```Go
func (f *APITargetsMetadataFunc) SetDefaultHook(hook func(context.Context, string, string, string) ([]v1.MetricMetadata, error))
```

SetDefaultHook sets function that is called when the TargetsMetadata method of the parent MockAPI instance is invoked and the hook queue is empty. 

#### <a id="APITargetsMetadataFunc.PushHook" href="#APITargetsMetadataFunc.PushHook">func (f *APITargetsMetadataFunc) PushHook(hook func(context.Context, string, string, string) ([]v1.MetricMetadata, error))</a>

```
searchKey: mocks.APITargetsMetadataFunc.PushHook
tags: [exported]
```

```Go
func (f *APITargetsMetadataFunc) PushHook(hook func(context.Context, string, string, string) ([]v1.MetricMetadata, error))
```

PushHook adds a function to the end of hook queue. Each invocation of the TargetsMetadata method of the parent MockAPI instance invokes the hook at the front of the queue and discards it. After the queue is empty, the default hook function is invoked for any future action. 

#### <a id="APITargetsMetadataFunc.SetDefaultReturn" href="#APITargetsMetadataFunc.SetDefaultReturn">func (f *APITargetsMetadataFunc) SetDefaultReturn(r0 []v1.MetricMetadata, r1 error)</a>

```
searchKey: mocks.APITargetsMetadataFunc.SetDefaultReturn
tags: [exported]
```

```Go
func (f *APITargetsMetadataFunc) SetDefaultReturn(r0 []v1.MetricMetadata, r1 error)
```

SetDefaultReturn calls SetDefaultDefaultHook with a function that returns the given values. 

#### <a id="APITargetsMetadataFunc.PushReturn" href="#APITargetsMetadataFunc.PushReturn">func (f *APITargetsMetadataFunc) PushReturn(r0 []v1.MetricMetadata, r1 error)</a>

```
searchKey: mocks.APITargetsMetadataFunc.PushReturn
tags: [exported]
```

```Go
func (f *APITargetsMetadataFunc) PushReturn(r0 []v1.MetricMetadata, r1 error)
```

PushReturn calls PushDefaultHook with a function that returns the given values. 

#### <a id="APITargetsMetadataFunc.nextHook" href="#APITargetsMetadataFunc.nextHook">func (f *APITargetsMetadataFunc) nextHook() func(context.Context, string, string, string) ([]v1.MetricMetadata, error)</a>

```
searchKey: mocks.APITargetsMetadataFunc.nextHook
```

```Go
func (f *APITargetsMetadataFunc) nextHook() func(context.Context, string, string, string) ([]v1.MetricMetadata, error)
```

#### <a id="APITargetsMetadataFunc.appendCall" href="#APITargetsMetadataFunc.appendCall">func (f *APITargetsMetadataFunc) appendCall(r0 APITargetsMetadataFuncCall)</a>

```
searchKey: mocks.APITargetsMetadataFunc.appendCall
```

```Go
func (f *APITargetsMetadataFunc) appendCall(r0 APITargetsMetadataFuncCall)
```

#### <a id="APITargetsMetadataFunc.History" href="#APITargetsMetadataFunc.History">func (f *APITargetsMetadataFunc) History() []APITargetsMetadataFuncCall</a>

```
searchKey: mocks.APITargetsMetadataFunc.History
tags: [exported]
```

```Go
func (f *APITargetsMetadataFunc) History() []APITargetsMetadataFuncCall
```

History returns a sequence of APITargetsMetadataFuncCall objects describing the invocations of this function. 

### <a id="APITargetsMetadataFuncCall" href="#APITargetsMetadataFuncCall">type APITargetsMetadataFuncCall struct</a>

```
searchKey: mocks.APITargetsMetadataFuncCall
tags: [exported]
```

```Go
type APITargetsMetadataFuncCall struct {
	// Arg0 is the value of the 1st argument passed to this method
	// invocation.
	Arg0 context.Context
	// Arg1 is the value of the 2nd argument passed to this method
	// invocation.
	Arg1 string
	// Arg2 is the value of the 3rd argument passed to this method
	// invocation.
	Arg2 string
	// Arg3 is the value of the 4th argument passed to this method
	// invocation.
	Arg3 string
	// Result0 is the value of the 1st result returned from this method
	// invocation.
	Result0 []v1.MetricMetadata
	// Result1 is the value of the 2nd result returned from this method
	// invocation.
	Result1 error
}
```

APITargetsMetadataFuncCall is an object that describes an invocation of method TargetsMetadata on an instance of MockAPI. 

#### <a id="APITargetsMetadataFuncCall.Args" href="#APITargetsMetadataFuncCall.Args">func (c APITargetsMetadataFuncCall) Args() []interface{}</a>

```
searchKey: mocks.APITargetsMetadataFuncCall.Args
tags: [exported]
```

```Go
func (c APITargetsMetadataFuncCall) Args() []interface{}
```

Args returns an interface slice containing the arguments of this invocation. 

#### <a id="APITargetsMetadataFuncCall.Results" href="#APITargetsMetadataFuncCall.Results">func (c APITargetsMetadataFuncCall) Results() []interface{}</a>

```
searchKey: mocks.APITargetsMetadataFuncCall.Results
tags: [exported]
```

```Go
func (c APITargetsMetadataFuncCall) Results() []interface{}
```

Results returns an interface slice containing the results of this invocation. 

