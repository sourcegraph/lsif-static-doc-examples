# Package main

Command prom-wrapper provides a wrapper command for Prometheus that also handles Sourcegraph configuration changes and making changes to Prometheus. 

See [https://docs.sourcegraph.com/dev/background-information/observability/prometheus](https://docs.sourcegraph.com/dev/background-information/observability/prometheus) 

## Index

* Subpages
  * [docker-images/prometheus/cmd/prom-wrapper/mocks](prom-wrapper/mocks.md)
* [Constants](#const)
    * [const alertmanagerPathPrefix](#alertmanagerPathPrefix)
    * [const alertmanagerNoopReceiver](#alertmanagerNoopReceiver)
    * [const alertmanagerWarningReceiver](#alertmanagerWarningReceiver)
    * [const alertmanagerCriticalReceiver](#alertmanagerCriticalReceiver)
    * [const colorWarning](#colorWarning)
    * [const colorCritical](#colorCritical)
    * [const colorGood](#colorGood)
    * [const docsURL](#docsURL)
    * [const alertSolutionsPagePath](#alertSolutionsPagePath)
    * [const matcherRegexPrefix](#matcherRegexPrefix)
    * [const matcherRegexSuffix](#matcherRegexSuffix)
* [Variables](#var)
    * [var noConfig](#noConfig)
    * [var noAlertmanager](#noAlertmanager)
    * [var exportPort](#exportPort)
    * [var prometheusPort](#prometheusPort)
    * [var alertmanagerPort](#alertmanagerPort)
    * [var alertmanagerConfigPath](#alertmanagerConfigPath)
    * [var alertmanagerEnableCluster](#alertmanagerEnableCluster)
    * [var opsGenieAPIKey](#opsGenieAPIKey)
    * [var commonLabels](#commonLabels)
    * [var observableDocAnchorTemplate](#observableDocAnchorTemplate)
    * [var alertSolutionsURLTemplate](#alertSolutionsURLTemplate)
    * [var firingTitleTemplate](#firingTitleTemplate)
    * [var resolvedTitleTemplate](#resolvedTitleTemplate)
    * [var notificationTitleTemplate](#notificationTitleTemplate)
* [Types](#type)
    * [type ChangeContext struct](#ChangeContext)
    * [type ChangeResult struct](#ChangeResult)
        * [func changeReceivers(ctx context.Context, log log15.Logger, change ChangeContext, newConfig *subscribedSiteConfig) (result ChangeResult)](#changeReceivers)
        * [func changeSMTP(ctx context.Context, log log15.Logger, change ChangeContext, newConfig *subscribedSiteConfig) (result ChangeResult)](#changeSMTP)
        * [func changeSilences(ctx context.Context, log log15.Logger, change ChangeContext, newConfig *subscribedSiteConfig) (result ChangeResult)](#changeSilences)
    * [type Change func(ctx context.Context, log github.com/inconshreveable/log15.Logger, change github.com/sourcegraph/sourcegraph/docker-images/prometheus/cmd/prom-wrapper.ChangeContext, newConfig *github.com/sourcegraph/sourcegraph/docker-images/prometheus/cmd/prom-wrapper.subscribedSiteConfig) (result github.com/sourcegraph/sourcegraph/docker-images/prometheus/cmd/prom-wrapper.ChangeResult)](#Change)
    * [type siteEmailConfig struct](#siteEmailConfig)
    * [type subscribedSiteConfig struct](#subscribedSiteConfig)
        * [func newSubscribedSiteConfig(config schema.SiteConfiguration) *subscribedSiteConfig](#newSubscribedSiteConfig)
        * [func (c *subscribedSiteConfig) Diff(other *subscribedSiteConfig) []siteConfigDiff](#subscribedSiteConfig.Diff)
    * [type siteConfigDiff struct](#siteConfigDiff)
    * [type SiteConfigSubscriber struct](#SiteConfigSubscriber)
        * [func NewSiteConfigSubscriber(logger log15.Logger, alertmanager *amclient.Alertmanager) *SiteConfigSubscriber](#NewSiteConfigSubscriber)
        * [func (c *SiteConfigSubscriber) Handler() http.Handler](#SiteConfigSubscriber.Handler)
        * [func (c *SiteConfigSubscriber) Subscribe(ctx context.Context)](#SiteConfigSubscriber.Subscribe)
        * [func (c *SiteConfigSubscriber) execDiffs(ctx context.Context, newConfig *subscribedSiteConfig, diffs []siteConfigDiff)](#SiteConfigSubscriber.execDiffs)
    * [type AlertsStatusReporter struct](#AlertsStatusReporter)
        * [func NewAlertsStatusReporter(logger log15.Logger, alertmanager *amclient.Alertmanager, prom prometheus.API) *AlertsStatusReporter](#NewAlertsStatusReporter)
        * [func (s *AlertsStatusReporter) Handler() http.Handler](#AlertsStatusReporter.Handler)
* [Functions](#func)
    * [func waitForAlertmanager(ctx context.Context, alertmanager *amclient.Alertmanager) error](#waitForAlertmanager)
    * [func reloadAlertmanager(ctx context.Context) error](#reloadAlertmanager)
    * [func renderConfiguration(cfg *amconfig.Config) ([]byte, error)](#renderConfiguration)
    * [func applyConfiguration(ctx context.Context, cfg *amconfig.Config) error](#applyConfiguration)
    * [func duration(dur time.Duration) *model.Duration](#duration)
    * [func runCmd(log log15.Logger, errs chan<- error, cmd *exec.Cmd)](#runCmd)
    * [func NewPrometheusCmd(promArgs []string, promPort string) *exec.Cmd](#NewPrometheusCmd)
    * [func NewAlertmanagerCmd(configPath string) *exec.Cmd](#NewAlertmanagerCmd)
    * [func main()](#main)
    * [func alertSolutionsURL() string](#alertSolutionsURL)
    * [func newRoutesAndReceivers(newAlerts []*schema.ObservabilityAlerts, externalURL string, newProblem func(error)) ([]*amconfig.Receiver, []*amconfig.Route)](#newRoutesAndReceivers)
    * [func newRootRoute(routes []*amconfig.Route) *amconfig.Route](#newRootRoute)
    * [func stringP(v string) *string](#stringP)
    * [func boolP(v bool) *bool](#boolP)
    * [func newMatchersFromSilence(silence string) models.Matchers](#newMatchersFromSilence)
    * [func newSilenceFromMatchers(matchers models.Matchers) string](#newSilenceFromMatchers)
    * [func init()](#init)
    * [func TestAlertSolutionsURL(t *testing.T)](#TestAlertSolutionsURL)
    * [func TestNewRoutesAndReceivers(t *testing.T)](#TestNewRoutesAndReceivers)
    * [func TestMatchersAndSilences(t *testing.T)](#TestMatchersAndSilences)
    * [func TestAlertsStatusReporterHistory(t *testing.T)](#TestAlertsStatusReporterHistory)


## <a id="const" href="#const">Constants</a>

```
tags: [exported]
```

### <a id="alertmanagerPathPrefix" href="#alertmanagerPathPrefix">const alertmanagerPathPrefix</a>

```
searchKey: main.alertmanagerPathPrefix
```

```Go
const alertmanagerPathPrefix = "alertmanager"
```

Prefix to serve alertmanager on. If you change this, make sure you update prometheus.yml as well 

### <a id="alertmanagerNoopReceiver" href="#alertmanagerNoopReceiver">const alertmanagerNoopReceiver</a>

```
searchKey: main.alertmanagerNoopReceiver
```

```Go
const alertmanagerNoopReceiver = "src-noop-receiver"
```

### <a id="alertmanagerWarningReceiver" href="#alertmanagerWarningReceiver">const alertmanagerWarningReceiver</a>

```
searchKey: main.alertmanagerWarningReceiver
```

```Go
const alertmanagerWarningReceiver = "src-warning-receiver"
```

### <a id="alertmanagerCriticalReceiver" href="#alertmanagerCriticalReceiver">const alertmanagerCriticalReceiver</a>

```
searchKey: main.alertmanagerCriticalReceiver
```

```Go
const alertmanagerCriticalReceiver = "src-critical-receiver"
```

### <a id="colorWarning" href="#colorWarning">const colorWarning</a>

```
searchKey: main.colorWarning
```

```Go
const colorWarning = "#FFFF00" // yellow

```

### <a id="colorCritical" href="#colorCritical">const colorCritical</a>

```
searchKey: main.colorCritical
```

```Go
const colorCritical = "#FF0000" // red

```

### <a id="colorGood" href="#colorGood">const colorGood</a>

```
searchKey: main.colorGood
```

```Go
const colorGood = "#00FF00" // green

```

### <a id="docsURL" href="#docsURL">const docsURL</a>

```
searchKey: main.docsURL
```

```Go
const docsURL = "https://docs.sourcegraph.com"
```

### <a id="alertSolutionsPagePath" href="#alertSolutionsPagePath">const alertSolutionsPagePath</a>

```
searchKey: main.alertSolutionsPagePath
```

```Go
const alertSolutionsPagePath = "admin/observability/alert_solutions"
```

### <a id="matcherRegexPrefix" href="#matcherRegexPrefix">const matcherRegexPrefix</a>

```
searchKey: main.matcherRegexPrefix
```

```Go
const matcherRegexPrefix = "^("
```

### <a id="matcherRegexSuffix" href="#matcherRegexSuffix">const matcherRegexSuffix</a>

```
searchKey: main.matcherRegexSuffix
```

```Go
const matcherRegexSuffix = ")$"
```

## <a id="var" href="#var">Variables</a>

```
tags: [exported]
```

### <a id="noConfig" href="#noConfig">var noConfig</a>

```
searchKey: main.noConfig
```

```Go
var noConfig = os.Getenv("DISABLE_SOURCEGRAPH_CONFIG")
```

prom-wrapper configuration options 

### <a id="noAlertmanager" href="#noAlertmanager">var noAlertmanager</a>

```
searchKey: main.noAlertmanager
```

```Go
var noAlertmanager = os.Getenv("DISABLE_ALERTMANAGER")
```

prom-wrapper configuration options 

### <a id="exportPort" href="#exportPort">var exportPort</a>

```
searchKey: main.exportPort
```

```Go
var exportPort = ...
```

prom-wrapper configuration options 

### <a id="prometheusPort" href="#prometheusPort">var prometheusPort</a>

```
searchKey: main.prometheusPort
```

```Go
var prometheusPort = env.Get("PROMETHEUS_INTERNAL_PORT", "9092", "internal Prometheus port")
```

prom-wrapper configuration options 

### <a id="alertmanagerPort" href="#alertmanagerPort">var alertmanagerPort</a>

```
searchKey: main.alertmanagerPort
```

```Go
var alertmanagerPort = env.Get("ALERTMANAGER_INTERNAL_PORT", "9093", "internal Alertmanager port")
```

prom-wrapper configuration options 

### <a id="alertmanagerConfigPath" href="#alertmanagerConfigPath">var alertmanagerConfigPath</a>

```
searchKey: main.alertmanagerConfigPath
```

```Go
var alertmanagerConfigPath = ...
```

prom-wrapper configuration options 

### <a id="alertmanagerEnableCluster" href="#alertmanagerEnableCluster">var alertmanagerEnableCluster</a>

```
searchKey: main.alertmanagerEnableCluster
```

```Go
var alertmanagerEnableCluster = ...
```

prom-wrapper configuration options 

### <a id="opsGenieAPIKey" href="#opsGenieAPIKey">var opsGenieAPIKey</a>

```
searchKey: main.opsGenieAPIKey
```

```Go
var opsGenieAPIKey = os.Getenv("OPSGENIE_API_KEY")
```

prom-wrapper configuration options 

### <a id="commonLabels" href="#commonLabels">var commonLabels</a>

```
searchKey: main.commonLabels
```

```Go
var commonLabels = []string{"alertname", "level", "service_name", "name", "owner", "description"}
```

commonLabels defines the set of labels we group alerts by, such that each alert falls in a unique group. These labels are available in Alertmanager templates as fields of `.CommonLabels`. 

Note that `alertname` is provided as a fallback grouping only - combinations of the other labels should be unique for alerts provided by the Sourcegraph generator. 

When changing this, make sure to update the webhook body documentation in /doc/admin/observability/alerting.md 

### <a id="observableDocAnchorTemplate" href="#observableDocAnchorTemplate">var observableDocAnchorTemplate</a>

```
searchKey: main.observableDocAnchorTemplate
```

```Go
var observableDocAnchorTemplate = ...
```

Static alertmanager templates. Templating reference: [https://prometheus.io/docs/alerting/latest/notifications](https://prometheus.io/docs/alerting/latest/notifications) 

All `.CommonLabels` labels used in these templates should be included in `route.GroupByStr` in order for them to be available. 

observableDocAnchorTemplate must match anchors generated in `monitoring/monitoring/documentation.go`. 

### <a id="alertSolutionsURLTemplate" href="#alertSolutionsURLTemplate">var alertSolutionsURLTemplate</a>

```
searchKey: main.alertSolutionsURLTemplate
```

```Go
var alertSolutionsURLTemplate = ...
```

Static alertmanager templates. Templating reference: [https://prometheus.io/docs/alerting/latest/notifications](https://prometheus.io/docs/alerting/latest/notifications) 

All `.CommonLabels` labels used in these templates should be included in `route.GroupByStr` in order for them to be available. 

### <a id="firingTitleTemplate" href="#firingTitleTemplate">var firingTitleTemplate</a>

```
searchKey: main.firingTitleTemplate
```

```Go
var firingTitleTemplate = "[{{ .CommonLabels.level | toUpper }}] {{ .CommonLabels.description }}"
```

Static alertmanager templates. Templating reference: [https://prometheus.io/docs/alerting/latest/notifications](https://prometheus.io/docs/alerting/latest/notifications) 

All `.CommonLabels` labels used in these templates should be included in `route.GroupByStr` in order for them to be available. 

Title templates 

### <a id="resolvedTitleTemplate" href="#resolvedTitleTemplate">var resolvedTitleTemplate</a>

```
searchKey: main.resolvedTitleTemplate
```

```Go
var resolvedTitleTemplate = "[RESOLVED] {{ .CommonLabels.description }}"
```

Static alertmanager templates. Templating reference: [https://prometheus.io/docs/alerting/latest/notifications](https://prometheus.io/docs/alerting/latest/notifications) 

All `.CommonLabels` labels used in these templates should be included in `route.GroupByStr` in order for them to be available. 

### <a id="notificationTitleTemplate" href="#notificationTitleTemplate">var notificationTitleTemplate</a>

```
searchKey: main.notificationTitleTemplate
```

```Go
var notificationTitleTemplate = ...
```

Static alertmanager templates. Templating reference: [https://prometheus.io/docs/alerting/latest/notifications](https://prometheus.io/docs/alerting/latest/notifications) 

All `.CommonLabels` labels used in these templates should be included in `route.GroupByStr` in order for them to be available. 

## <a id="type" href="#type">Types</a>

```
tags: [exported]
```

### <a id="ChangeContext" href="#ChangeContext">type ChangeContext struct</a>

```
searchKey: main.ChangeContext
tags: [exported]
```

```Go
type ChangeContext struct {
	AMConfig *amconfig.Config // refer to https://prometheus.io/docs/alerting/latest/configuration/
	AMClient *amclient.Alertmanager
}
```

### <a id="ChangeResult" href="#ChangeResult">type ChangeResult struct</a>

```
searchKey: main.ChangeResult
tags: [exported]
```

```Go
type ChangeResult struct {
	Problems conf.Problems
}
```

ChangeResult indicates output from a Change 

#### <a id="changeReceivers" href="#changeReceivers">func changeReceivers(ctx context.Context, log log15.Logger, change ChangeContext, newConfig *subscribedSiteConfig) (result ChangeResult)</a>

```
searchKey: main.changeReceivers
```

```Go
func changeReceivers(ctx context.Context, log log15.Logger, change ChangeContext, newConfig *subscribedSiteConfig) (result ChangeResult)
```

changeReceivers applies `observability.alerts` as Alertmanager receivers. 

#### <a id="changeSMTP" href="#changeSMTP">func changeSMTP(ctx context.Context, log log15.Logger, change ChangeContext, newConfig *subscribedSiteConfig) (result ChangeResult)</a>

```
searchKey: main.changeSMTP
```

```Go
func changeSMTP(ctx context.Context, log log15.Logger, change ChangeContext, newConfig *subscribedSiteConfig) (result ChangeResult)
```

changeSMTP applies SMTP server configuration. 

#### <a id="changeSilences" href="#changeSilences">func changeSilences(ctx context.Context, log log15.Logger, change ChangeContext, newConfig *subscribedSiteConfig) (result ChangeResult)</a>

```
searchKey: main.changeSilences
```

```Go
func changeSilences(ctx context.Context, log log15.Logger, change ChangeContext, newConfig *subscribedSiteConfig) (result ChangeResult)
```

changeSilences syncs Alertmanager silences with silences configured in observability.silenceAlerts 

### <a id="Change" href="#Change">type Change func(ctx context.Context, log github.com/inconshreveable/log15.Logger, change github.com/sourcegraph/sourcegraph/docker-images/prometheus/cmd/prom-wrapper.ChangeContext, newConfig *github.com/sourcegraph/sourcegraph/docker-images/prometheus/cmd/prom-wrapper.subscribedSiteConfig) (result github.com/sourcegraph/sourcegraph/docker-images/prometheus/cmd/prom-wrapper.ChangeResult)</a>

```
searchKey: main.Change
tags: [exported]
```

```Go
type Change func(ctx context.Context, log log15.Logger, change ChangeContext, newConfig *subscribedSiteConfig) (result ChangeResult)
```

Change implements a change to configuration 

### <a id="siteEmailConfig" href="#siteEmailConfig">type siteEmailConfig struct</a>

```
searchKey: main.siteEmailConfig
```

```Go
type siteEmailConfig struct {
	SMTP    *schema.SMTPServerConfig
	Address string
}
```

### <a id="subscribedSiteConfig" href="#subscribedSiteConfig">type subscribedSiteConfig struct</a>

```
searchKey: main.subscribedSiteConfig
```

```Go
type subscribedSiteConfig struct {
	Alerts    []*schema.ObservabilityAlerts
	alertsSum [32]byte

	Email    *siteEmailConfig
	emailSum [32]byte

	SilencedAlerts    []string
	silencedAlertsSum [32]byte

	ExternalURL string
}
```

subscribedSiteConfig contains fields from SiteConfiguration relevant to the siteConfigSubscriber. 

#### <a id="newSubscribedSiteConfig" href="#newSubscribedSiteConfig">func newSubscribedSiteConfig(config schema.SiteConfiguration) *subscribedSiteConfig</a>

```
searchKey: main.newSubscribedSiteConfig
```

```Go
func newSubscribedSiteConfig(config schema.SiteConfiguration) *subscribedSiteConfig
```

newSubscribedSiteConfig creates a subscribedSiteConfig with sha256 sums calculated. 

#### <a id="subscribedSiteConfig.Diff" href="#subscribedSiteConfig.Diff">func (c *subscribedSiteConfig) Diff(other *subscribedSiteConfig) []siteConfigDiff</a>

```
searchKey: main.subscribedSiteConfig.Diff
```

```Go
func (c *subscribedSiteConfig) Diff(other *subscribedSiteConfig) []siteConfigDiff
```

Diff returns a set of changes to apply. 

### <a id="siteConfigDiff" href="#siteConfigDiff">type siteConfigDiff struct</a>

```
searchKey: main.siteConfigDiff
```

```Go
type siteConfigDiff struct {
	Type   string
	change Change
}
```

### <a id="SiteConfigSubscriber" href="#SiteConfigSubscriber">type SiteConfigSubscriber struct</a>

```
searchKey: main.SiteConfigSubscriber
tags: [exported]
```

```Go
type SiteConfigSubscriber struct {
	log          log15.Logger
	alertmanager *amclient.Alertmanager

	mux      sync.RWMutex
	config   *subscribedSiteConfig
	problems conf.Problems // exported by handler
}
```

SiteConfigSubscriber is a sidecar service that subscribes to Sourcegraph site configuration and applies relevant (subscribedSiteConfig) changes to Grafana. 

#### <a id="NewSiteConfigSubscriber" href="#NewSiteConfigSubscriber">func NewSiteConfigSubscriber(logger log15.Logger, alertmanager *amclient.Alertmanager) *SiteConfigSubscriber</a>

```
searchKey: main.NewSiteConfigSubscriber
tags: [exported]
```

```Go
func NewSiteConfigSubscriber(logger log15.Logger, alertmanager *amclient.Alertmanager) *SiteConfigSubscriber
```

#### <a id="SiteConfigSubscriber.Handler" href="#SiteConfigSubscriber.Handler">func (c *SiteConfigSubscriber) Handler() http.Handler</a>

```
searchKey: main.SiteConfigSubscriber.Handler
tags: [exported]
```

```Go
func (c *SiteConfigSubscriber) Handler() http.Handler
```

#### <a id="SiteConfigSubscriber.Subscribe" href="#SiteConfigSubscriber.Subscribe">func (c *SiteConfigSubscriber) Subscribe(ctx context.Context)</a>

```
searchKey: main.SiteConfigSubscriber.Subscribe
tags: [exported]
```

```Go
func (c *SiteConfigSubscriber) Subscribe(ctx context.Context)
```

#### <a id="SiteConfigSubscriber.execDiffs" href="#SiteConfigSubscriber.execDiffs">func (c *SiteConfigSubscriber) execDiffs(ctx context.Context, newConfig *subscribedSiteConfig, diffs []siteConfigDiff)</a>

```
searchKey: main.SiteConfigSubscriber.execDiffs
```

```Go
func (c *SiteConfigSubscriber) execDiffs(ctx context.Context, newConfig *subscribedSiteConfig, diffs []siteConfigDiff)
```

execDiffs updates grafanaAlertsSubscriber state and writes it to disk. It never returns an error, instead all errors are reported as problems 

### <a id="AlertsStatusReporter" href="#AlertsStatusReporter">type AlertsStatusReporter struct</a>

```
searchKey: main.AlertsStatusReporter
tags: [exported]
```

```Go
type AlertsStatusReporter struct {
	log          log15.Logger
	alertmanager *amclient.Alertmanager
	prometheus   prometheus.API
}
```

AlertsStatusReporter summarizes alert activity from Alertmanager 

#### <a id="NewAlertsStatusReporter" href="#NewAlertsStatusReporter">func NewAlertsStatusReporter(logger log15.Logger, alertmanager *amclient.Alertmanager, prom prometheus.API) *AlertsStatusReporter</a>

```
searchKey: main.NewAlertsStatusReporter
tags: [exported]
```

```Go
func NewAlertsStatusReporter(logger log15.Logger, alertmanager *amclient.Alertmanager, prom prometheus.API) *AlertsStatusReporter
```

#### <a id="AlertsStatusReporter.Handler" href="#AlertsStatusReporter.Handler">func (s *AlertsStatusReporter) Handler() http.Handler</a>

```
searchKey: main.AlertsStatusReporter.Handler
tags: [exported]
```

```Go
func (s *AlertsStatusReporter) Handler() http.Handler
```

## <a id="func" href="#func">Functions</a>

```
tags: [exported]
```

### <a id="waitForAlertmanager" href="#waitForAlertmanager">func waitForAlertmanager(ctx context.Context, alertmanager *amclient.Alertmanager) error</a>

```
searchKey: main.waitForAlertmanager
```

```Go
func waitForAlertmanager(ctx context.Context, alertmanager *amclient.Alertmanager) error
```

### <a id="reloadAlertmanager" href="#reloadAlertmanager">func reloadAlertmanager(ctx context.Context) error</a>

```
searchKey: main.reloadAlertmanager
```

```Go
func reloadAlertmanager(ctx context.Context) error
```

reloadAlertmanager triggers a realod of the Alertmanager configuration file, because package alertmanager/api/v2 does not have a wrapper for reload See [https://prometheus.io/docs/alerting/latest/management_api/#reload](https://prometheus.io/docs/alerting/latest/management_api/#reload) 

### <a id="renderConfiguration" href="#renderConfiguration">func renderConfiguration(cfg *amconfig.Config) ([]byte, error)</a>

```
searchKey: main.renderConfiguration
```

```Go
func renderConfiguration(cfg *amconfig.Config) ([]byte, error)
```

renderConfiguration marshals the given Alertmanager configuration to a format accepted by Alertmanager, and also validates that it will be accepted by Alertmanager. 

### <a id="applyConfiguration" href="#applyConfiguration">func applyConfiguration(ctx context.Context, cfg *amconfig.Config) error</a>

```
searchKey: main.applyConfiguration
```

```Go
func applyConfiguration(ctx context.Context, cfg *amconfig.Config) error
```

applyConfiguration writes validates and writes the given Alertmanager configuration to disk, and triggers a reload. 

### <a id="duration" href="#duration">func duration(dur time.Duration) *model.Duration</a>

```
searchKey: main.duration
```

```Go
func duration(dur time.Duration) *model.Duration
```

### <a id="runCmd" href="#runCmd">func runCmd(log log15.Logger, errs chan<- error, cmd *exec.Cmd)</a>

```
searchKey: main.runCmd
```

```Go
func runCmd(log log15.Logger, errs chan<- error, cmd *exec.Cmd)
```

### <a id="NewPrometheusCmd" href="#NewPrometheusCmd">func NewPrometheusCmd(promArgs []string, promPort string) *exec.Cmd</a>

```
searchKey: main.NewPrometheusCmd
tags: [exported]
```

```Go
func NewPrometheusCmd(promArgs []string, promPort string) *exec.Cmd
```

NewPrometheusCmd instantiates a new command to run Prometheus. Parameter promArgs replicates "$@" 

### <a id="NewAlertmanagerCmd" href="#NewAlertmanagerCmd">func NewAlertmanagerCmd(configPath string) *exec.Cmd</a>

```
searchKey: main.NewAlertmanagerCmd
tags: [exported]
```

```Go
func NewAlertmanagerCmd(configPath string) *exec.Cmd
```

### <a id="main" href="#main">func main()</a>

```
searchKey: main.main
```

```Go
func main()
```

### <a id="alertSolutionsURL" href="#alertSolutionsURL">func alertSolutionsURL() string</a>

```
searchKey: main.alertSolutionsURL
```

```Go
func alertSolutionsURL() string
```

alertSolutionsURL generates a link to the alert solutions page that embeds the appropriate version if it is available and it is a semantic version. 

### <a id="newRoutesAndReceivers" href="#newRoutesAndReceivers">func newRoutesAndReceivers(newAlerts []*schema.ObservabilityAlerts, externalURL string, newProblem func(error)) ([]*amconfig.Receiver, []*amconfig.Route)</a>

```
searchKey: main.newRoutesAndReceivers
```

```Go
func newRoutesAndReceivers(newAlerts []*schema.ObservabilityAlerts, externalURL string, newProblem func(error)) ([]*amconfig.Receiver, []*amconfig.Route)
```

newRoutesAndReceivers converts the given alerts from Sourcegraph site configuration into Alertmanager receivers and routes with the following strategy: 

* Each alert level has a receiver, which has configuration for all channels for that level. * Each alert level and owner combination has a receiver and route, which has configuration for all channels for that filter. * Additional routes can route alerts based on `alerts.on`, but all alerts still fall through to the per-level receivers. 

### <a id="newRootRoute" href="#newRootRoute">func newRootRoute(routes []*amconfig.Route) *amconfig.Route</a>

```
searchKey: main.newRootRoute
```

```Go
func newRootRoute(routes []*amconfig.Route) *amconfig.Route
```

newRootRoute generates a base Route required by Alertmanager to wrap all routes 

### <a id="stringP" href="#stringP">func stringP(v string) *string</a>

```
searchKey: main.stringP
```

```Go
func stringP(v string) *string
```

### <a id="boolP" href="#boolP">func boolP(v bool) *bool</a>

```
searchKey: main.boolP
```

```Go
func boolP(v bool) *bool
```

### <a id="newMatchersFromSilence" href="#newMatchersFromSilence">func newMatchersFromSilence(silence string) models.Matchers</a>

```
searchKey: main.newMatchersFromSilence
```

```Go
func newMatchersFromSilence(silence string) models.Matchers
```

newMatchersFromSilence creates Alertmanager alert matchers from a configured silence 

### <a id="newSilenceFromMatchers" href="#newSilenceFromMatchers">func newSilenceFromMatchers(matchers models.Matchers) string</a>

```
searchKey: main.newSilenceFromMatchers
```

```Go
func newSilenceFromMatchers(matchers models.Matchers) string
```

newSilenceFromMatchers returns the silenced alert from Alertmanager alert matchers 

### <a id="init" href="#init">func init()</a>

```
searchKey: main.init
```

```Go
func init()
```

### <a id="TestAlertSolutionsURL" href="#TestAlertSolutionsURL">func TestAlertSolutionsURL(t *testing.T)</a>

```
searchKey: main.TestAlertSolutionsURL
```

```Go
func TestAlertSolutionsURL(t *testing.T)
```

### <a id="TestNewRoutesAndReceivers" href="#TestNewRoutesAndReceivers">func TestNewRoutesAndReceivers(t *testing.T)</a>

```
searchKey: main.TestNewRoutesAndReceivers
```

```Go
func TestNewRoutesAndReceivers(t *testing.T)
```

### <a id="TestMatchersAndSilences" href="#TestMatchersAndSilences">func TestMatchersAndSilences(t *testing.T)</a>

```
searchKey: main.TestMatchersAndSilences
```

```Go
func TestMatchersAndSilences(t *testing.T)
```

### <a id="TestAlertsStatusReporterHistory" href="#TestAlertsStatusReporterHistory">func TestAlertsStatusReporterHistory(t *testing.T)</a>

```
searchKey: main.TestAlertsStatusReporterHistory
```

```Go
func TestAlertsStatusReporterHistory(t *testing.T)
```

