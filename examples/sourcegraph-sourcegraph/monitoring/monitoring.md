# Package monitoring

Package monitoring declares types for Sourcegraph's monitoring generator as well as the generator implementation itself. 

To learn more about developing monitoring, see the guide: [https://about.sourcegraph.com/handbook/engineering/observability/monitoring](https://about.sourcegraph.com/handbook/engineering/observability/monitoring) 

To learn more about the generator, see the top-level program: [https://github.com/sourcegraph/sourcegraph/tree/main/monitoring](https://github.com/sourcegraph/sourcegraph/tree/main/monitoring) 

## Index

* [Constants](#const)
    * [const BitsPerSecond](#BitsPerSecond)
    * [const Bytes](#Bytes)
    * [const Milliseconds](#Milliseconds)
    * [const Number](#Number)
    * [const ObservableOwnerBatches](#ObservableOwnerBatches)
    * [const ObservableOwnerCodeIntel](#ObservableOwnerCodeIntel)
    * [const ObservableOwnerCoreApplication](#ObservableOwnerCoreApplication)
    * [const ObservableOwnerDistribution](#ObservableOwnerDistribution)
    * [const ObservableOwnerSearch](#ObservableOwnerSearch)
    * [const ObservableOwnerSecurity](#ObservableOwnerSecurity)
    * [const ObservableOwnerWeb](#ObservableOwnerWeb)
    * [const Percentage](#Percentage)
    * [const ReadsPerSecond](#ReadsPerSecond)
    * [const Seconds](#Seconds)
    * [const WritesPerSecond](#WritesPerSecond)
    * [const alertRulesFileSuffix](#alertRulesFileSuffix)
    * [const alertSolutionsFile](#alertSolutionsFile)
    * [const alertSolutionsHeader](#alertSolutionsHeader)
    * [const canonicalAlertSolutionsURL](#canonicalAlertSolutionsURL)
    * [const canonicalDashboardsDocsURL](#canonicalDashboardsDocsURL)
    * [const dashboardsDocsFile](#dashboardsDocsFile)
    * [const dashboardsHeader](#dashboardsHeader)
    * [const localGrafanaCredentials](#localGrafanaCredentials)
    * [const localGrafanaURL](#localGrafanaURL)
    * [const localPrometheusURL](#localPrometheusURL)
* [Variables](#var)
    * [var PanelOptions](#PanelOptions)
* [Types](#type)
    * [type Container struct](#Container)
        * [func (c *Container) alertDescription(o Observable, alert *ObservableAlertDefinition) (string, error)](#Container.alertDescription)
        * [func (c *Container) renderDashboard() *sdk.Board](#Container.renderDashboard)
        * [func (c *Container) renderRules() (*promRulesFile, error)](#Container.renderRules)
        * [func (c *Container) validate() error](#Container.validate)
    * [type GenerateOptions struct](#GenerateOptions)
    * [type Group struct](#Group)
        * [func (g Group) validate() error](#Group.validate)
    * [type Observable struct](#Observable)
        * [func (o Observable) validate() error](#Observable.validate)
    * [type ObservableAlertDefinition struct](#ObservableAlertDefinition)
        * [func Alert() *ObservableAlertDefinition](#Alert)
        * [func (a *ObservableAlertDefinition) For(d time.Duration) *ObservableAlertDefinition](#ObservableAlertDefinition.For)
        * [func (a *ObservableAlertDefinition) Greater(f float64, aggregator *string) *ObservableAlertDefinition](#ObservableAlertDefinition.Greater)
        * [func (a *ObservableAlertDefinition) GreaterOrEqual(f float64, aggregator *string) *ObservableAlertDefinition](#ObservableAlertDefinition.GreaterOrEqual)
        * [func (a *ObservableAlertDefinition) Less(f float64, aggregator *string) *ObservableAlertDefinition](#ObservableAlertDefinition.Less)
        * [func (a *ObservableAlertDefinition) LessOrEqual(f float64, aggregator *string) *ObservableAlertDefinition](#ObservableAlertDefinition.LessOrEqual)
        * [func (a *ObservableAlertDefinition) isEmpty() bool](#ObservableAlertDefinition.isEmpty)
        * [func (a *ObservableAlertDefinition) validate() error](#ObservableAlertDefinition.validate)
    * [type ObservableOwner string](#ObservableOwner)
        * [func (o ObservableOwner) toMarkdown() string](#ObservableOwner.toMarkdown)
    * [type ObservablePanel struct](#ObservablePanel)
        * [func Panel() ObservablePanel](#Panel)
        * [func PanelHeatmap() ObservablePanel](#PanelHeatmap)
        * [func PanelMinimal() ObservablePanel](#PanelMinimal)
        * [func (p ObservablePanel) Interval(ms int) ObservablePanel](#ObservablePanel.Interval)
        * [func (p ObservablePanel) LegendFormat(format string) ObservablePanel](#ObservablePanel.LegendFormat)
        * [func (p ObservablePanel) Max(max float64) ObservablePanel](#ObservablePanel.Max)
        * [func (p ObservablePanel) Min(min float64) ObservablePanel](#ObservablePanel.Min)
        * [func (p ObservablePanel) MinAuto() ObservablePanel](#ObservablePanel.MinAuto)
        * [func (p ObservablePanel) Unit(t UnitType) ObservablePanel](#ObservablePanel.Unit)
        * [func (p ObservablePanel) With(ops ...ObservablePanelOption) ObservablePanel](#ObservablePanel.With)
        * [func (p ObservablePanel) build(o Observable, panel *sdk.Panel)](#ObservablePanel.build)
    * [type ObservablePanelOption func(github.com/sourcegraph/sourcegraph/monitoring/monitoring.Observable, *github.com/grafana-tools/sdk.Panel)](#ObservablePanelOption)
    * [type Row []monitoring.Observable](#Row)
        * [func (r Row) validate() error](#Row.validate)
    * [type UnitType string](#UnitType)
        * [func (u UnitType) short() string](#UnitType.short)
    * [type documentation struct](#documentation)
        * [func renderDocumentation(containers []*Container) (*documentation, error)](#renderDocumentation)
        * [func (d *documentation) renderAlertSolutionEntry(c *Container, o Observable) error](#documentation.renderAlertSolutionEntry)
        * [func (d *documentation) renderDashboardPanelEntry(c *Container, o Observable) error](#documentation.renderDashboardPanelEntry)
    * [type panelOptionsLibrary struct{}](#panelOptionsLibrary)
        * [func (panelOptionsLibrary) AlertThresholds() ObservablePanelOption](#panelOptionsLibrary.AlertThresholds)
        * [func (panelOptionsLibrary) ColorOverride(seriesName string, color string) ObservablePanelOption](#panelOptionsLibrary.ColorOverride)
        * [func (panelOptionsLibrary) Fill(fill int) ObservablePanelOption](#panelOptionsLibrary.Fill)
        * [func (panelOptionsLibrary) HoverShowAll() ObservablePanelOption](#panelOptionsLibrary.HoverShowAll)
        * [func (panelOptionsLibrary) HoverSort(order string) ObservablePanelOption](#panelOptionsLibrary.HoverSort)
        * [func (panelOptionsLibrary) LegendOnRight() ObservablePanelOption](#panelOptionsLibrary.LegendOnRight)
        * [func (panelOptionsLibrary) NoLegend() ObservablePanelOption](#panelOptionsLibrary.NoLegend)
        * [func (panelOptionsLibrary) OpinionatedDefaults() ObservablePanelOption](#panelOptionsLibrary.OpinionatedDefaults)
        * [func (panelOptionsLibrary) basicPanel() ObservablePanelOption](#panelOptionsLibrary.basicPanel)
    * [type promGroup struct](#promGroup)
        * [func (g *promGroup) appendRow(alertQuery string, labels map[string]string, duration time.Duration)](#promGroup.appendRow)
        * [func (g *promGroup) validate() error](#promGroup.validate)
    * [type promRule struct](#promRule)
        * [func (r *promRule) validate() error](#promRule.validate)
    * [type promRulesFile struct](#promRulesFile)
* [Functions](#func)
    * [func Generate(logger log15.Logger, opts GenerateOptions, containers ...*Container) error](#Generate)
    * [func Int64Ptr(i int64) *int64](#Int64Ptr)
    * [func StringPtr(s string) *string](#StringPtr)
    * [func boolPtr(b bool) *bool](#boolPtr)
    * [func fprintObservableHeader(w io.Writer, c *Container, o *Observable, headerLevel int)](#fprintObservableHeader)
    * [func fprintOwnedBy(w io.Writer, owner ObservableOwner)](#fprintOwnedBy)
    * [func fprintSubtitle(w io.Writer, text string)](#fprintSubtitle)
    * [func isValidGrafanaUID(s string) bool](#isValidGrafanaUID)
    * [func observableDocAnchor(c *Container, o Observable) string](#observableDocAnchor)
    * [func observablePanelID(groupIndex, rowIndex, observableIndex int) uint](#observablePanelID)
    * [func prometheusAlertName(level, service, name string) string](#prometheusAlertName)
    * [func pruneAssets(logger log15.Logger, filelist []string, grafanaDir, promDir string) error](#pruneAssets)
    * [func setPanelPos(p *sdk.Panel, x, y int)](#setPanelPos)
    * [func setPanelSize(p *sdk.Panel, width, height int)](#setPanelSize)
    * [func toMarkdown(m string, forceList bool) (string, error)](#toMarkdown)
    * [func upperFirst(s string) string](#upperFirst)
    * [func withPeriod(s string) string](#withPeriod)


## <a id="const" href="#const">Constants</a>

### <a id="BitsPerSecond" href="#BitsPerSecond">const BitsPerSecond</a>

```
searchKey: monitoring.BitsPerSecond
tags: [constant string]
```

```Go
const BitsPerSecond UnitType = "bps"
```

From [https://sourcegraph.com/github.com/grafana/grafana](https://sourcegraph.com/github.com/grafana/grafana)@b63b82976b3708b082326c0b7d42f38d4bc261fa/-/blob/packages/grafana-data/src/valueFormats/categories.ts#L23 

BitsPerSecond, e.g. for representing network and disk IO. 

### <a id="Bytes" href="#Bytes">const Bytes</a>

```
searchKey: monitoring.Bytes
tags: [constant string]
```

```Go
const Bytes UnitType = "bytes"
```

From [https://sourcegraph.com/github.com/grafana/grafana](https://sourcegraph.com/github.com/grafana/grafana)@b63b82976b3708b082326c0b7d42f38d4bc261fa/-/blob/packages/grafana-data/src/valueFormats/categories.ts#L23 

Bytes in IEC (1024) format, e.g. for representing storage sizes. 

### <a id="Milliseconds" href="#Milliseconds">const Milliseconds</a>

```
searchKey: monitoring.Milliseconds
tags: [constant string]
```

```Go
const Milliseconds UnitType = "ms"
```

From [https://sourcegraph.com/github.com/grafana/grafana](https://sourcegraph.com/github.com/grafana/grafana)@b63b82976b3708b082326c0b7d42f38d4bc261fa/-/blob/packages/grafana-data/src/valueFormats/categories.ts#L23 

Milliseconds for representing time. 

### <a id="Number" href="#Number">const Number</a>

```
searchKey: monitoring.Number
tags: [constant string]
```

```Go
const Number UnitType = "short"
```

From [https://sourcegraph.com/github.com/grafana/grafana](https://sourcegraph.com/github.com/grafana/grafana)@b63b82976b3708b082326c0b7d42f38d4bc261fa/-/blob/packages/grafana-data/src/valueFormats/categories.ts#L23 

Number is the default unit type. 

### <a id="ObservableOwnerBatches" href="#ObservableOwnerBatches">const ObservableOwnerBatches</a>

```
searchKey: monitoring.ObservableOwnerBatches
tags: [constant string]
```

```Go
const ObservableOwnerBatches ObservableOwner = "batches"
```

### <a id="ObservableOwnerCodeIntel" href="#ObservableOwnerCodeIntel">const ObservableOwnerCodeIntel</a>

```
searchKey: monitoring.ObservableOwnerCodeIntel
tags: [constant string]
```

```Go
const ObservableOwnerCodeIntel ObservableOwner = "code-intel"
```

### <a id="ObservableOwnerCoreApplication" href="#ObservableOwnerCoreApplication">const ObservableOwnerCoreApplication</a>

```
searchKey: monitoring.ObservableOwnerCoreApplication
tags: [constant string]
```

```Go
const ObservableOwnerCoreApplication ObservableOwner = "core application"
```

### <a id="ObservableOwnerDistribution" href="#ObservableOwnerDistribution">const ObservableOwnerDistribution</a>

```
searchKey: monitoring.ObservableOwnerDistribution
tags: [constant string]
```

```Go
const ObservableOwnerDistribution ObservableOwner = "distribution"
```

### <a id="ObservableOwnerSearch" href="#ObservableOwnerSearch">const ObservableOwnerSearch</a>

```
searchKey: monitoring.ObservableOwnerSearch
tags: [constant string]
```

```Go
const ObservableOwnerSearch ObservableOwner = "search"
```

### <a id="ObservableOwnerSecurity" href="#ObservableOwnerSecurity">const ObservableOwnerSecurity</a>

```
searchKey: monitoring.ObservableOwnerSecurity
tags: [constant string]
```

```Go
const ObservableOwnerSecurity ObservableOwner = "security"
```

### <a id="ObservableOwnerWeb" href="#ObservableOwnerWeb">const ObservableOwnerWeb</a>

```
searchKey: monitoring.ObservableOwnerWeb
tags: [constant string]
```

```Go
const ObservableOwnerWeb ObservableOwner = "web"
```

### <a id="Percentage" href="#Percentage">const Percentage</a>

```
searchKey: monitoring.Percentage
tags: [constant string]
```

```Go
const Percentage UnitType = "percent"
```

From [https://sourcegraph.com/github.com/grafana/grafana](https://sourcegraph.com/github.com/grafana/grafana)@b63b82976b3708b082326c0b7d42f38d4bc261fa/-/blob/packages/grafana-data/src/valueFormats/categories.ts#L23 

Percentage in the range of 0-100. 

### <a id="ReadsPerSecond" href="#ReadsPerSecond">const ReadsPerSecond</a>

```
searchKey: monitoring.ReadsPerSecond
tags: [constant string]
```

```Go
const ReadsPerSecond = "rps"
```

From [https://sourcegraph.com/github.com/grafana/grafana](https://sourcegraph.com/github.com/grafana/grafana)@b63b82976b3708b082326c0b7d42f38d4bc261fa/-/blob/packages/grafana-data/src/valueFormats/categories.ts#L23 

ReadsPerSecond, e.g for representing disk IO. 

### <a id="Seconds" href="#Seconds">const Seconds</a>

```
searchKey: monitoring.Seconds
tags: [constant string]
```

```Go
const Seconds UnitType = "s"
```

From [https://sourcegraph.com/github.com/grafana/grafana](https://sourcegraph.com/github.com/grafana/grafana)@b63b82976b3708b082326c0b7d42f38d4bc261fa/-/blob/packages/grafana-data/src/valueFormats/categories.ts#L23 

Seconds for representing time. 

### <a id="WritesPerSecond" href="#WritesPerSecond">const WritesPerSecond</a>

```
searchKey: monitoring.WritesPerSecond
tags: [constant string]
```

```Go
const WritesPerSecond = "wps"
```

From [https://sourcegraph.com/github.com/grafana/grafana](https://sourcegraph.com/github.com/grafana/grafana)@b63b82976b3708b082326c0b7d42f38d4bc261fa/-/blob/packages/grafana-data/src/valueFormats/categories.ts#L23 

WritesPerSecond, e.g for representing disk IO. 

### <a id="alertRulesFileSuffix" href="#alertRulesFileSuffix">const alertRulesFileSuffix</a>

```
searchKey: monitoring.alertRulesFileSuffix
tags: [constant string private]
```

```Go
const alertRulesFileSuffix = "_alert_rules.yml"
```

### <a id="alertSolutionsFile" href="#alertSolutionsFile">const alertSolutionsFile</a>

```
searchKey: monitoring.alertSolutionsFile
tags: [constant string private]
```

```Go
const alertSolutionsFile = "alert_solutions.md"
```

### <a id="alertSolutionsHeader" href="#alertSolutionsHeader">const alertSolutionsHeader</a>

```
searchKey: monitoring.alertSolutionsHeader
tags: [constant string private]
```

```Go
const alertSolutionsHeader = ...
```

### <a id="canonicalAlertSolutionsURL" href="#canonicalAlertSolutionsURL">const canonicalAlertSolutionsURL</a>

```
searchKey: monitoring.canonicalAlertSolutionsURL
tags: [constant string private]
```

```Go
const canonicalAlertSolutionsURL = ...
```

### <a id="canonicalDashboardsDocsURL" href="#canonicalDashboardsDocsURL">const canonicalDashboardsDocsURL</a>

```
searchKey: monitoring.canonicalDashboardsDocsURL
tags: [constant string private]
```

```Go
const canonicalDashboardsDocsURL = "https://docs.sourcegraph.com/admin/observability/dashboards"
```

### <a id="dashboardsDocsFile" href="#dashboardsDocsFile">const dashboardsDocsFile</a>

```
searchKey: monitoring.dashboardsDocsFile
tags: [constant string private]
```

```Go
const dashboardsDocsFile = "dashboards.md"
```

### <a id="dashboardsHeader" href="#dashboardsHeader">const dashboardsHeader</a>

```
searchKey: monitoring.dashboardsHeader
tags: [constant string private]
```

```Go
const dashboardsHeader = ...
```

### <a id="localGrafanaCredentials" href="#localGrafanaCredentials">const localGrafanaCredentials</a>

```
searchKey: monitoring.localGrafanaCredentials
tags: [constant string private]
```

```Go
const localGrafanaCredentials = "admin:admin"
```

### <a id="localGrafanaURL" href="#localGrafanaURL">const localGrafanaURL</a>

```
searchKey: monitoring.localGrafanaURL
tags: [constant string private]
```

```Go
const localGrafanaURL = "http://127.0.0.1:3370"
```

### <a id="localPrometheusURL" href="#localPrometheusURL">const localPrometheusURL</a>

```
searchKey: monitoring.localPrometheusURL
tags: [constant string private]
```

```Go
const localPrometheusURL = "http://127.0.0.1:9090"
```

## <a id="var" href="#var">Variables</a>

### <a id="PanelOptions" href="#PanelOptions">var PanelOptions</a>

```
searchKey: monitoring.PanelOptions
tags: [variable struct]
```

```Go
var PanelOptions panelOptionsLibrary
```

PanelOptions exports available shared `ObservablePanelOption` implementations. 

See `ObservablePanelOption` for more details. 

## <a id="type" href="#type">Types</a>

### <a id="Container" href="#Container">type Container struct</a>

```
searchKey: monitoring.Container
tags: [struct]
```

```Go
type Container struct {
	// Name of the Docker container, e.g. "syntect-server".
	Name string

	// Title of the Docker container, e.g. "Syntect Server".
	Title string

	// Description of the Docker container. It should describe what the container
	// is responsible for, so that the impact of issues in it is clear.
	Description string

	// List of Annotations to apply to the dashboard.
	Annotations []sdk.Annotation

	// List of Template Variables to apply to the dashboard
	Templates []sdk.TemplateVar

	// Groups of observable information about the container.
	Groups []Group

	// NoSourcegraphDebugServer indicates if this container does not export the standard
	// Sourcegraph debug server (package `internal/debugserver`).
	//
	// This is used to configure monitoring features that depend on information exported
	// by the standard Sourcegraph debug server.
	NoSourcegraphDebugServer bool
}
```

Container describes a Docker container to be observed. 

These correspond to dashboards in Grafana. 

#### <a id="Container.alertDescription" href="#Container.alertDescription">func (c *Container) alertDescription(o Observable, alert *ObservableAlertDefinition) (string, error)</a>

```
searchKey: monitoring.Container.alertDescription
tags: [method private]
```

```Go
func (c *Container) alertDescription(o Observable, alert *ObservableAlertDefinition) (string, error)
```

alertDescription generates an alert description for the specified coontainer's alert. 

#### <a id="Container.renderDashboard" href="#Container.renderDashboard">func (c *Container) renderDashboard() *sdk.Board</a>

```
searchKey: monitoring.Container.renderDashboard
tags: [method private]
```

```Go
func (c *Container) renderDashboard() *sdk.Board
```

renderDashboard generates the Grafana renderDashboard for this container. 

#### <a id="Container.renderRules" href="#Container.renderRules">func (c *Container) renderRules() (*promRulesFile, error)</a>

```
searchKey: monitoring.Container.renderRules
tags: [method private]
```

```Go
func (c *Container) renderRules() (*promRulesFile, error)
```

renderRules generates the Prometheus rules file which defines our high-level alerting metrics for the container. For more information about how these work, see: 

[https://docs.sourcegraph.com/admin/observability/metrics#high-level-alerting-metrics](https://docs.sourcegraph.com/admin/observability/metrics#high-level-alerting-metrics) 

#### <a id="Container.validate" href="#Container.validate">func (c *Container) validate() error</a>

```
searchKey: monitoring.Container.validate
tags: [method private]
```

```Go
func (c *Container) validate() error
```

### <a id="GenerateOptions" href="#GenerateOptions">type GenerateOptions struct</a>

```
searchKey: monitoring.GenerateOptions
tags: [struct]
```

```Go
type GenerateOptions struct {
	// Toggles pruning of dangling generated assets through simple heuristic, should be disabled during builds
	DisablePrune bool
	// Trigger reload of active Prometheus or Grafana instance (requires respective output directories)
	Reload bool

	// Output directory for generated Grafana assets
	GrafanaDir string
	// Output directory for generated Prometheus assets
	PrometheusDir string
	// Output directory for generated documentation
	DocsDir string
}
```

GenerateOptions declares options for the monitoring generator. 

### <a id="Group" href="#Group">type Group struct</a>

```
searchKey: monitoring.Group
tags: [struct]
```

```Go
type Group struct {
	// Title of the group, briefly summarizing what this group is about, or
	// "General" if the group is just about the container in general.
	Title string

	// Hidden indicates whether or not the group should be hidden by default.
	//
	// This should only be used when the dashboard is already full of information
	// and the information presented in this group is unlikely to be the cause of
	// issues and should generally only be inspected in the event that an alert
	// for that information is firing.
	Hidden bool

	// Rows of observable metrics.
	Rows []Row
}
```

Group describes a group of observable information about a container. 

These correspond to collapsible sections in a Grafana dashboard. 

#### <a id="Group.validate" href="#Group.validate">func (g Group) validate() error</a>

```
searchKey: monitoring.Group.validate
tags: [method private]
```

```Go
func (g Group) validate() error
```

### <a id="Observable" href="#Observable">type Observable struct</a>

```
searchKey: monitoring.Observable
tags: [struct]
```

```Go
type Observable struct {
	// Name is a short and human-readable lower_snake_case name describing what is being observed.
	//
	// It must be unique relative to the service name.
	//
	// Good examples:
	//
	//  github_rate_limit_remaining
	// 	search_error_rate
	//
	// Bad examples:
	//
	//  repo_updater_github_rate_limit
	// 	search_error_rate_over_5m
	//
	Name string

	// Description is a human-readable description of exactly what is being observed.
	// If a query groups by a label (such as with a `sum by(...)`), ensure that this is
	// reflected in the description by noting that this observable is grouped "by ...".
	//
	// Good examples:
	//
	// 	"remaining GitHub API rate limit quota"
	// 	"number of search errors every 5m"
	//  "90th percentile search request duration over 5m"
	//  "internal API error responses every 5m by route"
	//
	// Bad examples:
	//
	// 	"GitHub rate limit"
	// 	"search errors[5m]"
	// 	"P90 search latency"
	//
	Description string

	// Owner indicates the team that owns this Observable (including its alerts and maintainence).
	Owner ObservableOwner

	// Query is the actual Prometheus query that should be observed.
	Query string

	// DataMustExist indicates if the query must return data.
	//
	// For example, repo_updater_memory_usage should always have data present and an alert should
	// fire if for some reason that query is not returning any data, so this would be set to true.
	// In contrast, search_error_rate would depend on users actually performing searches and we
	// would not want an alert to fire if no data was present, so this will not need to be set.
	DataMustExist bool

	// Warning and Critical alert definitions.
	// Consider adding at least a Warning or Critical alert to each Observable to make it
	// easy to identify when the target of this metric is misbehaving. If no alerts are
	// provided, NoAlert must be set and Interpretation must be provided.
	Warning, Critical *ObservableAlertDefinition

	// NoAlerts must be set by Observables that do not have any alerts.
	// This ensures the omission of alerts is intentional. If set to true, an Interpretation
	// must be provided in place of PossibleSolutions.
	NoAlert bool

	// PossibleSolutions is Markdown describing possible solutions in the event that the
	// alert is firing. This field not required if no alerts are attached to this Observable.
	// If there is no clear potential resolution or there is no alert configured, "none"
	// must be explicitly stated.
	//
	// Use the Interpretation field for additional guidance on understanding this Observable
	// that isn't directly related to solving it.
	//
	// Contacting support should not be mentioned as part of a possible solution, as it is
	// communicated elsewhere.
	//
	// To make writing the Markdown more friendly in Go, string literals like this:
	//
	// 	Observable{
	// 		PossibleSolutions: `
	// 			- Foobar 'some code'
	// 		`
	// 	}
	//
	// Becomes:
	//
	// 	- Foobar `some code`
	//
	// In other words:
	//
	// 1. The preceding newline is removed.
	// 2. The indentation in the string literal is removed (based on the last line).
	// 3. Single quotes become backticks.
	// 4. The last line (which is all indention) is removed.
	// 5. Non-list items are converted to a list.
	//
	PossibleSolutions string

	// Interpretation is Markdown that can serve as a reference for interpreting this
	// observable. For example, Interpretation could provide guidance on what sort of
	// patterns to look for in the observable's graph and document why this observable is
	// useful.
	//
	// If no alerts are configured for an observable, this field is required. If the
	// Description is sufficient to capture what this Observable describes, "none" must be
	// explicitly stated.
	//
	// To make writing the Markdown more friendly in Go, string literal processing as
	// PossibleSolutions is provided, though the output is not converted to a list.
	Interpretation string

	// Panel provides options for how to render the metric in the Grafana panel.
	// A recommended set of options and customizations are available from the `Panel()`
	// constructor.
	//
	// Additional customizations can be made via `ObservablePanel.With()` for cases where
	// the provided `ObservablePanel` is insufficient - see `ObservablePanelOption` for
	// more details.
	Panel ObservablePanel
}
```

Observable describes a metric about a container that can be observed. For example, memory usage. 

These correspond to Grafana graphs. 

#### <a id="Observable.validate" href="#Observable.validate">func (o Observable) validate() error</a>

```
searchKey: monitoring.Observable.validate
tags: [method private]
```

```Go
func (o Observable) validate() error
```

### <a id="ObservableAlertDefinition" href="#ObservableAlertDefinition">type ObservableAlertDefinition struct</a>

```
searchKey: monitoring.ObservableAlertDefinition
tags: [struct]
```

```Go
type ObservableAlertDefinition struct {
	greaterThan bool
	lessThan    bool
	duration    time.Duration
	// Wrap the query in `max()` or `min()` so that if there are multiple series (e.g. per-container)
	// they get "flattened" into a single metric. The `aggregator` variable sets the required operator.
	//
	// We only support per-service alerts, not per-container/replica, and not doing so can cause issues.
	// See https://github.com/sourcegraph/sourcegraph/issues/11571#issuecomment-654571953,
	// https://github.com/sourcegraph/sourcegraph/issues/17599, and related pull requests.
	aggregator string
	// Comparator sets how a metric should be compared against a threshold
	comparator string
	// Threshold sets the value to be compared against
	threshold float64
}
```

ObservableAlertDefinition defines when an alert would be considered firing. 

#### <a id="Alert" href="#Alert">func Alert() *ObservableAlertDefinition</a>

```
searchKey: monitoring.Alert
tags: [function]
```

```Go
func Alert() *ObservableAlertDefinition
```

Alert provides a builder for defining alerting on an Observable. 

#### <a id="ObservableAlertDefinition.For" href="#ObservableAlertDefinition.For">func (a *ObservableAlertDefinition) For(d time.Duration) *ObservableAlertDefinition</a>

```
searchKey: monitoring.ObservableAlertDefinition.For
tags: [method]
```

```Go
func (a *ObservableAlertDefinition) For(d time.Duration) *ObservableAlertDefinition
```

For indicates how long the given thresholds must be exceeded for this alert to be considered firing. Defaults to 0s (immediately alerts when threshold is exceeded). 

#### <a id="ObservableAlertDefinition.Greater" href="#ObservableAlertDefinition.Greater">func (a *ObservableAlertDefinition) Greater(f float64, aggregator *string) *ObservableAlertDefinition</a>

```
searchKey: monitoring.ObservableAlertDefinition.Greater
tags: [method]
```

```Go
func (a *ObservableAlertDefinition) Greater(f float64, aggregator *string) *ObservableAlertDefinition
```

Greater indicates the alert should fire when strictly greater to this value. 

#### <a id="ObservableAlertDefinition.GreaterOrEqual" href="#ObservableAlertDefinition.GreaterOrEqual">func (a *ObservableAlertDefinition) GreaterOrEqual(f float64, aggregator *string) *ObservableAlertDefinition</a>

```
searchKey: monitoring.ObservableAlertDefinition.GreaterOrEqual
tags: [method]
```

```Go
func (a *ObservableAlertDefinition) GreaterOrEqual(f float64, aggregator *string) *ObservableAlertDefinition
```

GreaterOrEqual indicates the alert should fire when greater or equal the given value. 

#### <a id="ObservableAlertDefinition.Less" href="#ObservableAlertDefinition.Less">func (a *ObservableAlertDefinition) Less(f float64, aggregator *string) *ObservableAlertDefinition</a>

```
searchKey: monitoring.ObservableAlertDefinition.Less
tags: [method]
```

```Go
func (a *ObservableAlertDefinition) Less(f float64, aggregator *string) *ObservableAlertDefinition
```

Less indicates the alert should fire when strictly less than this value. 

#### <a id="ObservableAlertDefinition.LessOrEqual" href="#ObservableAlertDefinition.LessOrEqual">func (a *ObservableAlertDefinition) LessOrEqual(f float64, aggregator *string) *ObservableAlertDefinition</a>

```
searchKey: monitoring.ObservableAlertDefinition.LessOrEqual
tags: [method]
```

```Go
func (a *ObservableAlertDefinition) LessOrEqual(f float64, aggregator *string) *ObservableAlertDefinition
```

LessOrEqual indicates the alert should fire when less than or equal to the given value. 

#### <a id="ObservableAlertDefinition.isEmpty" href="#ObservableAlertDefinition.isEmpty">func (a *ObservableAlertDefinition) isEmpty() bool</a>

```
searchKey: monitoring.ObservableAlertDefinition.isEmpty
tags: [method private]
```

```Go
func (a *ObservableAlertDefinition) isEmpty() bool
```

#### <a id="ObservableAlertDefinition.validate" href="#ObservableAlertDefinition.validate">func (a *ObservableAlertDefinition) validate() error</a>

```
searchKey: monitoring.ObservableAlertDefinition.validate
tags: [method private]
```

```Go
func (a *ObservableAlertDefinition) validate() error
```

### <a id="ObservableOwner" href="#ObservableOwner">type ObservableOwner string</a>

```
searchKey: monitoring.ObservableOwner
tags: [string]
```

```Go
type ObservableOwner string
```

ObservableOwner denotes a team that owns an Observable. The current teams are described in the handbook: [https://about.sourcegraph.com/company/team/org_chart#engineering](https://about.sourcegraph.com/company/team/org_chart#engineering) 

#### <a id="ObservableOwner.toMarkdown" href="#ObservableOwner.toMarkdown">func (o ObservableOwner) toMarkdown() string</a>

```
searchKey: monitoring.ObservableOwner.toMarkdown
tags: [method private]
```

```Go
func (o ObservableOwner) toMarkdown() string
```

toMarkdown returns a Markdown string that also links to the owner's team page 

### <a id="ObservablePanel" href="#ObservablePanel">type ObservablePanel struct</a>

```
searchKey: monitoring.ObservablePanel
tags: [struct]
```

```Go
type ObservablePanel struct {
	options []ObservablePanelOption

	// panelType is "graph" or "heatmap"
	panelType string

	// unitType is used by other parts of the generator
	unitType UnitType
}
```

ObservablePanel declares options for visualizing an Observable, as well as some default customization options. A default panel can be instantiated with the `Panel()` constructor, and further customized using `ObservablePanel.With(ObservablePanelOption)`. 

#### <a id="Panel" href="#Panel">func Panel() ObservablePanel</a>

```
searchKey: monitoring.Panel
tags: [function]
```

```Go
func Panel() ObservablePanel
```

Panel provides a builder for customizing an Observable visualization, starting with recommended defaults. 

#### <a id="PanelHeatmap" href="#PanelHeatmap">func PanelHeatmap() ObservablePanel</a>

```
searchKey: monitoring.PanelHeatmap
tags: [function]
```

```Go
func PanelHeatmap() ObservablePanel
```

PanelHeatmap provides a builder for customizing an Observable visualization starting with an extremely minimal heatmap panel. 

#### <a id="PanelMinimal" href="#PanelMinimal">func PanelMinimal() ObservablePanel</a>

```
searchKey: monitoring.PanelMinimal
tags: [function]
```

```Go
func PanelMinimal() ObservablePanel
```

PanelMinimal provides a builder for customizing an Observable visualization starting with an extremely minimal graph panel. 

In general, we advise using Panel() instead to start with recommended defaults. 

#### <a id="ObservablePanel.Interval" href="#ObservablePanel.Interval">func (p ObservablePanel) Interval(ms int) ObservablePanel</a>

```
searchKey: monitoring.ObservablePanel.Interval
tags: [method]
```

```Go
func (p ObservablePanel) Interval(ms int) ObservablePanel
```

Interval declares the panel's interval in milliseconds. 

#### <a id="ObservablePanel.LegendFormat" href="#ObservablePanel.LegendFormat">func (p ObservablePanel) LegendFormat(format string) ObservablePanel</a>

```
searchKey: monitoring.ObservablePanel.LegendFormat
tags: [method]
```

```Go
func (p ObservablePanel) LegendFormat(format string) ObservablePanel
```

LegendFormat sets the panel's legend format, which may use Go template strings to select labels from the Prometheus query. 

#### <a id="ObservablePanel.Max" href="#ObservablePanel.Max">func (p ObservablePanel) Max(max float64) ObservablePanel</a>

```
searchKey: monitoring.ObservablePanel.Max
tags: [method]
```

```Go
func (p ObservablePanel) Max(max float64) ObservablePanel
```

Max sets the maximum value of the Y axis on the panel. The default is auto. 

#### <a id="ObservablePanel.Min" href="#ObservablePanel.Min">func (p ObservablePanel) Min(min float64) ObservablePanel</a>

```
searchKey: monitoring.ObservablePanel.Min
tags: [method]
```

```Go
func (p ObservablePanel) Min(min float64) ObservablePanel
```

Min sets the minimum value of the Y axis on the panel. The default is zero. 

#### <a id="ObservablePanel.MinAuto" href="#ObservablePanel.MinAuto">func (p ObservablePanel) MinAuto() ObservablePanel</a>

```
searchKey: monitoring.ObservablePanel.MinAuto
tags: [method]
```

```Go
func (p ObservablePanel) MinAuto() ObservablePanel
```

Min sets the minimum value of the Y axis on the panel to auto, instead of the default zero. 

This is generally only useful if trying to show negative numbers. 

#### <a id="ObservablePanel.Unit" href="#ObservablePanel.Unit">func (p ObservablePanel) Unit(t UnitType) ObservablePanel</a>

```
searchKey: monitoring.ObservablePanel.Unit
tags: [method]
```

```Go
func (p ObservablePanel) Unit(t UnitType) ObservablePanel
```

Unit sets the panel's Y axis unit type. 

#### <a id="ObservablePanel.With" href="#ObservablePanel.With">func (p ObservablePanel) With(ops ...ObservablePanelOption) ObservablePanel</a>

```
searchKey: monitoring.ObservablePanel.With
tags: [method]
```

```Go
func (p ObservablePanel) With(ops ...ObservablePanelOption) ObservablePanel
```

With adds the provided options to be applied when building this panel. 

Before using this, check if the customization you want is already included in the default `Panel()` or available as a function on `ObservablePanel`, such as `ObservablePanel.Unit(UnitType)` for setting the units on a panel. 

Shared customizations are exported by `PanelOptions`, or you can write your option - see `ObservablePanelOption` documentation for more details. 

#### <a id="ObservablePanel.build" href="#ObservablePanel.build">func (p ObservablePanel) build(o Observable, panel *sdk.Panel)</a>

```
searchKey: monitoring.ObservablePanel.build
tags: [method private]
```

```Go
func (p ObservablePanel) build(o Observable, panel *sdk.Panel)
```

build applies the configured options on this panel for the given `Observable`. 

### <a id="ObservablePanelOption" href="#ObservablePanelOption">type ObservablePanelOption func(github.com/sourcegraph/sourcegraph/monitoring/monitoring.Observable, *github.com/grafana-tools/sdk.Panel)</a>

```
searchKey: monitoring.ObservablePanelOption
tags: [function]
```

```Go
type ObservablePanelOption func(Observable, *sdk.Panel)
```

ObservablePanelOption declares an option for customizing a graph panel. `ObservablePanel` is responsible for collecting and applying options. 

You can make any customization you want to a graph panel by using `ObservablePanel.With`: 

```
Panel: monitoring.Panel().With(func(o monitoring.Observable, p *sdk.Panel) {
  // modify 'p.GraphPanel' with desired changes
}),

```
When writing a custom `ObservablePanelOption`, keep in mind that: 

- There are only ever two `YAxes`: left at `YAxes[0]` and right at `YAxes[1]`. Target customizations at the Y-axis you want to modify, e.g. `YAxes[0].Property = Value`. 

- The observable being graphed is configured in `Targets[0]`. Customize it by editing it directly, e.g. `Targets[0].Property = Value`. 

If an option could be leveraged by multiple observables, a shared panel option can be defined in the `monitoring` package. 

When creating a shared `ObservablePanelOption`, it should defined as a function on the `panelOptionsLibrary` that returns a `ObservablePanelOption`. The function should be It can then be used with the `ObservablePanel.With`: 

```
Panel: monitoring.Panel().With(monitoring.PanelOptions.MyCustomization),

```
Using a shared prefix helps with discoverability of available options. 

### <a id="Row" href="#Row">type Row []monitoring.Observable</a>

```
searchKey: monitoring.Row
tags: [array struct]
```

```Go
type Row []Observable
```

Row of observable metrics. 

These correspond to a row of Grafana graphs. 

#### <a id="Row.validate" href="#Row.validate">func (r Row) validate() error</a>

```
searchKey: monitoring.Row.validate
tags: [method private]
```

```Go
func (r Row) validate() error
```

### <a id="UnitType" href="#UnitType">type UnitType string</a>

```
searchKey: monitoring.UnitType
tags: [string]
```

```Go
type UnitType string
```

UnitType for controlling the unit type display on graphs. 

#### <a id="UnitType.short" href="#UnitType.short">func (u UnitType) short() string</a>

```
searchKey: monitoring.UnitType.short
tags: [method private]
```

```Go
func (u UnitType) short() string
```

short returns the short string description of the unit, for qualifying a number of this unit type as human-readable. 

### <a id="documentation" href="#documentation">type documentation struct</a>

```
searchKey: monitoring.documentation
tags: [struct private]
```

```Go
type documentation struct {
	alertSolutions bytes.Buffer
	dashboards     bytes.Buffer
}
```

#### <a id="renderDocumentation" href="#renderDocumentation">func renderDocumentation(containers []*Container) (*documentation, error)</a>

```
searchKey: monitoring.renderDocumentation
tags: [function private]
```

```Go
func renderDocumentation(containers []*Container) (*documentation, error)
```

#### <a id="documentation.renderAlertSolutionEntry" href="#documentation.renderAlertSolutionEntry">func (d *documentation) renderAlertSolutionEntry(c *Container, o Observable) error</a>

```
searchKey: monitoring.documentation.renderAlertSolutionEntry
tags: [method private]
```

```Go
func (d *documentation) renderAlertSolutionEntry(c *Container, o Observable) error
```

#### <a id="documentation.renderDashboardPanelEntry" href="#documentation.renderDashboardPanelEntry">func (d *documentation) renderDashboardPanelEntry(c *Container, o Observable) error</a>

```
searchKey: monitoring.documentation.renderDashboardPanelEntry
tags: [method private]
```

```Go
func (d *documentation) renderDashboardPanelEntry(c *Container, o Observable) error
```

### <a id="panelOptionsLibrary" href="#panelOptionsLibrary">type panelOptionsLibrary struct{}</a>

```
searchKey: monitoring.panelOptionsLibrary
tags: [struct private]
```

```Go
type panelOptionsLibrary struct{}
```

panelOptionsLibrary provides `ObservablePanelOption` implementations. 

Shared panel options should be declared as functions on this struct - see the `ObservablePanelOption` documentation for more details. 

#### <a id="panelOptionsLibrary.AlertThresholds" href="#panelOptionsLibrary.AlertThresholds">func (panelOptionsLibrary) AlertThresholds() ObservablePanelOption</a>

```
searchKey: monitoring.panelOptionsLibrary.AlertThresholds
tags: [method private]
```

```Go
func (panelOptionsLibrary) AlertThresholds() ObservablePanelOption
```

AlertThresholds draws threshold lines based on the Observable's configured alerts. 

It is applied in the default PanelOptions(). 

#### <a id="panelOptionsLibrary.ColorOverride" href="#panelOptionsLibrary.ColorOverride">func (panelOptionsLibrary) ColorOverride(seriesName string, color string) ObservablePanelOption</a>

```
searchKey: monitoring.panelOptionsLibrary.ColorOverride
tags: [method private]
```

```Go
func (panelOptionsLibrary) ColorOverride(seriesName string, color string) ObservablePanelOption
```

ColorOverride takes a seriesName (which can be a regex pattern) and a color in hex format (#ABABAB). Series that match the seriesName will be colored accordingly. 

#### <a id="panelOptionsLibrary.Fill" href="#panelOptionsLibrary.Fill">func (panelOptionsLibrary) Fill(fill int) ObservablePanelOption</a>

```
searchKey: monitoring.panelOptionsLibrary.Fill
tags: [method private]
```

```Go
func (panelOptionsLibrary) Fill(fill int) ObservablePanelOption
```

Fill sets the fill opacity for all series on the panel. Set to 0 to disable fill. 

#### <a id="panelOptionsLibrary.HoverShowAll" href="#panelOptionsLibrary.HoverShowAll">func (panelOptionsLibrary) HoverShowAll() ObservablePanelOption</a>

```
searchKey: monitoring.panelOptionsLibrary.HoverShowAll
tags: [method private]
```

```Go
func (panelOptionsLibrary) HoverShowAll() ObservablePanelOption
```

HoverShowAll makes hover tooltips show all series rather than just the one being hovered over 

#### <a id="panelOptionsLibrary.HoverSort" href="#panelOptionsLibrary.HoverSort">func (panelOptionsLibrary) HoverSort(order string) ObservablePanelOption</a>

```
searchKey: monitoring.panelOptionsLibrary.HoverSort
tags: [method private]
```

```Go
func (panelOptionsLibrary) HoverSort(order string) ObservablePanelOption
```

HoverSort sorts the series either "ascending", "descending", or "none". Default is "none". 

#### <a id="panelOptionsLibrary.LegendOnRight" href="#panelOptionsLibrary.LegendOnRight">func (panelOptionsLibrary) LegendOnRight() ObservablePanelOption</a>

```
searchKey: monitoring.panelOptionsLibrary.LegendOnRight
tags: [method private]
```

```Go
func (panelOptionsLibrary) LegendOnRight() ObservablePanelOption
```

LegendOnRight moves the legend to the right side of the panel 

#### <a id="panelOptionsLibrary.NoLegend" href="#panelOptionsLibrary.NoLegend">func (panelOptionsLibrary) NoLegend() ObservablePanelOption</a>

```
searchKey: monitoring.panelOptionsLibrary.NoLegend
tags: [method private]
```

```Go
func (panelOptionsLibrary) NoLegend() ObservablePanelOption
```

NoLegend disables the legend on the panel 

#### <a id="panelOptionsLibrary.OpinionatedDefaults" href="#panelOptionsLibrary.OpinionatedDefaults">func (panelOptionsLibrary) OpinionatedDefaults() ObservablePanelOption</a>

```
searchKey: monitoring.panelOptionsLibrary.OpinionatedDefaults
tags: [method private]
```

```Go
func (panelOptionsLibrary) OpinionatedDefaults() ObservablePanelOption
```

OptionOpinionatedDefaults sets some opinionated default properties aimed at encouraging good dashboard practices. 

It is applied in the default PanelOptions(). 

#### <a id="panelOptionsLibrary.basicPanel" href="#panelOptionsLibrary.basicPanel">func (panelOptionsLibrary) basicPanel() ObservablePanelOption</a>

```
searchKey: monitoring.panelOptionsLibrary.basicPanel
tags: [method private]
```

```Go
func (panelOptionsLibrary) basicPanel() ObservablePanelOption
```

basicPanel instantiates all properties of a graph that can be adjusted in an ObservablePanelOption, and some reasonable defaults aimed at maintaining a uniform look and feel. 

All ObservablePanelOptions start with this option. 

### <a id="promGroup" href="#promGroup">type promGroup struct</a>

```
searchKey: monitoring.promGroup
tags: [struct private]
```

```Go
type promGroup struct {
	Name  string
	Rules []promRule
}
```

#### <a id="promGroup.appendRow" href="#promGroup.appendRow">func (g *promGroup) appendRow(alertQuery string, labels map[string]string, duration time.Duration)</a>

```
searchKey: monitoring.promGroup.appendRow
tags: [method private]
```

```Go
func (g *promGroup) appendRow(alertQuery string, labels map[string]string, duration time.Duration)
```

#### <a id="promGroup.validate" href="#promGroup.validate">func (g *promGroup) validate() error</a>

```
searchKey: monitoring.promGroup.validate
tags: [method private]
```

```Go
func (g *promGroup) validate() error
```

### <a id="promRule" href="#promRule">type promRule struct</a>

```
searchKey: monitoring.promRule
tags: [struct private]
```

```Go
type promRule struct {
	// either Record or Alert
	Record string `yaml:",omitempty"` // https://prometheus.io/docs/prometheus/latest/configuration/recording_rules/
	Alert  string `yaml:",omitempty"` // https://prometheus.io/docs/prometheus/latest/configuration/alerting_rules/

	Labels map[string]string
	Expr   string

	// for Alert only
	For *model.Duration `yaml:",omitempty"`
}
```

promRule is a subset of a Prometheus recording or alert rule definition. 

#### <a id="promRule.validate" href="#promRule.validate">func (r *promRule) validate() error</a>

```
searchKey: monitoring.promRule.validate
tags: [method private]
```

```Go
func (r *promRule) validate() error
```

### <a id="promRulesFile" href="#promRulesFile">type promRulesFile struct</a>

```
searchKey: monitoring.promRulesFile
tags: [struct private]
```

```Go
type promRulesFile struct {
	Groups []promGroup
}
```

promRulesFile represents a Prometheus recording rules file (which we use for defining our alerts) see: 

[https://prometheus.io/docs/prometheus/latest/configuration/recording_rules/](https://prometheus.io/docs/prometheus/latest/configuration/recording_rules/) 

## <a id="func" href="#func">Functions</a>

### <a id="Generate" href="#Generate">func Generate(logger log15.Logger, opts GenerateOptions, containers ...*Container) error</a>

```
searchKey: monitoring.Generate
tags: [function]
```

```Go
func Generate(logger log15.Logger, opts GenerateOptions, containers ...*Container) error
```

Generate is the main Sourcegraph monitoring generator entrypoint. 

### <a id="Int64Ptr" href="#Int64Ptr">func Int64Ptr(i int64) *int64</a>

```
searchKey: monitoring.Int64Ptr
tags: [function]
```

```Go
func Int64Ptr(i int64) *int64
```

IntPtr converts an int64 value to a pointer, useful for setting fields in some APIs. 

### <a id="StringPtr" href="#StringPtr">func StringPtr(s string) *string</a>

```
searchKey: monitoring.StringPtr
tags: [function]
```

```Go
func StringPtr(s string) *string
```

StringPtr converts a string value to a pointer, useful for setting fields in some APIs. 

### <a id="boolPtr" href="#boolPtr">func boolPtr(b bool) *bool</a>

```
searchKey: monitoring.boolPtr
tags: [function private]
```

```Go
func boolPtr(b bool) *bool
```

boolPtr converts a boolean value to a pointer, useful for setting fields in some APIs. 

### <a id="fprintObservableHeader" href="#fprintObservableHeader">func fprintObservableHeader(w io.Writer, c *Container, o *Observable, headerLevel int)</a>

```
searchKey: monitoring.fprintObservableHeader
tags: [function private]
```

```Go
func fprintObservableHeader(w io.Writer, c *Container, o *Observable, headerLevel int)
```

Write a standardized Observable header that one can reliably generate an anchor link for. 

See `observableAnchor`. 

### <a id="fprintOwnedBy" href="#fprintOwnedBy">func fprintOwnedBy(w io.Writer, owner ObservableOwner)</a>

```
searchKey: monitoring.fprintOwnedBy
tags: [function private]
```

```Go
func fprintOwnedBy(w io.Writer, owner ObservableOwner)
```

fprintOwnedBy prints information about who owns a particular monitoring definition. 

### <a id="fprintSubtitle" href="#fprintSubtitle">func fprintSubtitle(w io.Writer, text string)</a>

```
searchKey: monitoring.fprintSubtitle
tags: [function private]
```

```Go
func fprintSubtitle(w io.Writer, text string)
```

fprintSubtitle prints subtitle-class text 

### <a id="isValidGrafanaUID" href="#isValidGrafanaUID">func isValidGrafanaUID(s string) bool</a>

```
searchKey: monitoring.isValidGrafanaUID
tags: [function private]
```

```Go
func isValidGrafanaUID(s string) bool
```

isValidGrafanaUID checks if the given string is a valid UID for entry into a Grafana dashboard. This is primarily used in the URL, e.g. /-/debug/grafana/d/syntect-server/<UID> and allows us to have static URLs we can document like: 

```
Go to [https://sourcegraph.example.com/-/debug/grafana/d/syntect-server/syntect-server](https://sourcegraph.example.com/-/debug/grafana/d/syntect-server/syntect-server)

```
Instead of having to describe all the steps to navigate there because the UID is random. 

### <a id="observableDocAnchor" href="#observableDocAnchor">func observableDocAnchor(c *Container, o Observable) string</a>

```
searchKey: monitoring.observableDocAnchor
tags: [function private]
```

```Go
func observableDocAnchor(c *Container, o Observable) string
```

Create an anchor link that matches `fprintObservableHeader` 

Must match Prometheus template in `docker-images/prometheus/cmd/prom-wrapper/receivers.go` 

### <a id="observablePanelID" href="#observablePanelID">func observablePanelID(groupIndex, rowIndex, observableIndex int) uint</a>

```
searchKey: monitoring.observablePanelID
tags: [function private]
```

```Go
func observablePanelID(groupIndex, rowIndex, observableIndex int) uint
```

observablePanelID generates a panel ID unique per dashboard for an observable at a given group and row. 

### <a id="prometheusAlertName" href="#prometheusAlertName">func prometheusAlertName(level, service, name string) string</a>

```
searchKey: monitoring.prometheusAlertName
tags: [function private]
```

```Go
func prometheusAlertName(level, service, name string) string
```

prometheusAlertName creates an alertname that is unique given the combination of parameters 

### <a id="pruneAssets" href="#pruneAssets">func pruneAssets(logger log15.Logger, filelist []string, grafanaDir, promDir string) error</a>

```
searchKey: monitoring.pruneAssets
tags: [function private]
```

```Go
func pruneAssets(logger log15.Logger, filelist []string, grafanaDir, promDir string) error
```

### <a id="setPanelPos" href="#setPanelPos">func setPanelPos(p *sdk.Panel, x, y int)</a>

```
searchKey: monitoring.setPanelPos
tags: [function private]
```

```Go
func setPanelPos(p *sdk.Panel, x, y int)
```

setPanelSize is a helper to set a panel's position. 

### <a id="setPanelSize" href="#setPanelSize">func setPanelSize(p *sdk.Panel, width, height int)</a>

```
searchKey: monitoring.setPanelSize
tags: [function private]
```

```Go
func setPanelSize(p *sdk.Panel, width, height int)
```

setPanelSize is a helper to set a panel's size. 

### <a id="toMarkdown" href="#toMarkdown">func toMarkdown(m string, forceList bool) (string, error)</a>

```
searchKey: monitoring.toMarkdown
tags: [function private]
```

```Go
func toMarkdown(m string, forceList bool) (string, error)
```

toMarkdown converts a Go string to Markdown, and optionally converts it to a list item if requested by forceList. 

### <a id="upperFirst" href="#upperFirst">func upperFirst(s string) string</a>

```
searchKey: monitoring.upperFirst
tags: [function private]
```

```Go
func upperFirst(s string) string
```

upperFirst returns s with an uppercase first rune. 

### <a id="withPeriod" href="#withPeriod">func withPeriod(s string) string</a>

```
searchKey: monitoring.withPeriod
tags: [function private]
```

```Go
func withPeriod(s string) string
```

withPeriod returns s ending with a period. 

