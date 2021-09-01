# Package main

Command prom-wrapper provides a wrapper command for Prometheus that also handles Sourcegraph configuration changes and making changes to Prometheus. 

See [https://docs.sourcegraph.com/dev/background-information/observability/prometheus](https://docs.sourcegraph.com/dev/background-information/observability/prometheus) 

## Index

* Subpages
  * [docker-images/prometheus/cmd/prom-wrapper/mocks](prom-wrapper/mocks.md)
* [Constants](#const)
    * [const alertSolutionsPagePath](#alertSolutionsPagePath)
    * [const alertmanagerCriticalReceiver](#alertmanagerCriticalReceiver)
    * [const alertmanagerNoopReceiver](#alertmanagerNoopReceiver)
    * [const alertmanagerPathPrefix](#alertmanagerPathPrefix)
    * [const alertmanagerWarningReceiver](#alertmanagerWarningReceiver)
    * [const colorCritical](#colorCritical)
    * [const colorGood](#colorGood)
    * [const colorWarning](#colorWarning)
    * [const docsURL](#docsURL)
    * [const matcherRegexPrefix](#matcherRegexPrefix)
    * [const matcherRegexSuffix](#matcherRegexSuffix)
* [Variables](#var)
    * [var alertSolutionsURLTemplate](#alertSolutionsURLTemplate)
    * [var alertmanagerConfigPath](#alertmanagerConfigPath)
    * [var alertmanagerEnableCluster](#alertmanagerEnableCluster)
    * [var alertmanagerPort](#alertmanagerPort)
    * [var commonLabels](#commonLabels)
    * [var exportPort](#exportPort)
    * [var firingTitleTemplate](#firingTitleTemplate)
    * [var noAlertmanager](#noAlertmanager)
    * [var noConfig](#noConfig)
    * [var notificationTitleTemplate](#notificationTitleTemplate)
    * [var observableDocAnchorTemplate](#observableDocAnchorTemplate)
    * [var opsGenieAPIKey](#opsGenieAPIKey)
    * [var prometheusPort](#prometheusPort)
    * [var resolvedTitleTemplate](#resolvedTitleTemplate)
* [Types](#type)
    * [type AlertsStatusReporter struct](#AlertsStatusReporter)
        * [func NewAlertsStatusReporter(logger log15.Logger, alertmanager *amclient.Alertmanager, prom prometheus.API) *AlertsStatusReporter](#NewAlertsStatusReporter)
        * [func (s *AlertsStatusReporter) Handler() http.Handler](#AlertsStatusReporter.Handler)
    * [type Change func(ctx context.Context, log github.com/inconshreveable/log15.Logger, change github.com/sourcegraph/sourcegraph/docker-images/prometheus/cmd/prom-wrapper.ChangeContext, newConfig *github.com/sourcegraph/sourcegraph/docker-images/prometheus/cmd/prom-wrapper.subscribedSiteConfig) (result github.com/sourcegraph/sourcegraph/docker-images/prometheus/cmd/prom-wrapper.ChangeResult)](#Change)
    * [type ChangeContext struct](#ChangeContext)
    * [type ChangeResult struct](#ChangeResult)
        * [func changeReceivers(ctx context.Context, log log15.Logger, change ChangeContext, newConfig *subscribedSiteConfig) (result ChangeResult)](#changeReceivers)
        * [func changeSMTP(ctx context.Context, log log15.Logger, change ChangeContext, newConfig *subscribedSiteConfig) (result ChangeResult)](#changeSMTP)
        * [func changeSilences(ctx context.Context, log log15.Logger, change ChangeContext, newConfig *subscribedSiteConfig) (result ChangeResult)](#changeSilences)
    * [type SiteConfigSubscriber struct](#SiteConfigSubscriber)
        * [func NewSiteConfigSubscriber(logger log15.Logger, alertmanager *amclient.Alertmanager) *SiteConfigSubscriber](#NewSiteConfigSubscriber)
        * [func (c *SiteConfigSubscriber) Handler() http.Handler](#SiteConfigSubscriber.Handler)
        * [func (c *SiteConfigSubscriber) Subscribe(ctx context.Context)](#SiteConfigSubscriber.Subscribe)
        * [func (c *SiteConfigSubscriber) execDiffs(ctx context.Context, newConfig *subscribedSiteConfig, diffs []siteConfigDiff)](#SiteConfigSubscriber.execDiffs)
    * [type siteConfigDiff struct](#siteConfigDiff)
    * [type siteEmailConfig struct](#siteEmailConfig)
    * [type subscribedSiteConfig struct](#subscribedSiteConfig)
        * [func newSubscribedSiteConfig(config schema.SiteConfiguration) *subscribedSiteConfig](#newSubscribedSiteConfig)
        * [func (c *subscribedSiteConfig) Diff(other *subscribedSiteConfig) []siteConfigDiff](#subscribedSiteConfig.Diff)
* [Functions](#func)
    * [func NewAlertmanagerCmd(configPath string) *exec.Cmd](#NewAlertmanagerCmd)
    * [func NewPrometheusCmd(promArgs []string, promPort string) *exec.Cmd](#NewPrometheusCmd)
    * [func TestAlertSolutionsURL(t *testing.T)](#TestAlertSolutionsURL)
    * [func TestAlertsStatusReporterHistory(t *testing.T)](#TestAlertsStatusReporterHistory)
    * [func TestMatchersAndSilences(t *testing.T)](#TestMatchersAndSilences)
    * [func TestNewRoutesAndReceivers(t *testing.T)](#TestNewRoutesAndReceivers)
    * [func alertSolutionsURL() string](#alertSolutionsURL)
    * [func applyConfiguration(ctx context.Context, cfg *amconfig.Config) error](#applyConfiguration)
    * [func boolP(v bool) *bool](#boolP)
    * [func duration(dur time.Duration) *model.Duration](#duration)
    * [func init()](#init.siteconfig.go)
    * [func main()](#main)
    * [func newMatchersFromSilence(silence string) models.Matchers](#newMatchersFromSilence)
    * [func newRootRoute(routes []*amconfig.Route) *amconfig.Route](#newRootRoute)
    * [func newRoutesAndReceivers(newAlerts []*schema.ObservabilityAlerts, externalURL string, newProblem func(error)) ([]*amconfig.Receiver, []*amconfig.Route)](#newRoutesAndReceivers)
    * [func newSilenceFromMatchers(matchers models.Matchers) string](#newSilenceFromMatchers)
    * [func reloadAlertmanager(ctx context.Context) error](#reloadAlertmanager)
    * [func renderConfiguration(cfg *amconfig.Config) ([]byte, error)](#renderConfiguration)
    * [func runCmd(log log15.Logger, errs chan<- error, cmd *exec.Cmd)](#runCmd)
    * [func stringP(v string) *string](#stringP)
    * [func waitForAlertmanager(ctx context.Context, alertmanager *amclient.Alertmanager) error](#waitForAlertmanager)


## <a id="const" href="#const">Constants</a>

### <a id="alertSolutionsPagePath" href="#alertSolutionsPagePath">const alertSolutionsPagePath</a>

```
searchKey: main.alertSolutionsPagePath
tags: [constant string private]
```

```Go
const alertSolutionsPagePath = "admin/observability/alert_solutions"
```

### <a id="alertmanagerCriticalReceiver" href="#alertmanagerCriticalReceiver">const alertmanagerCriticalReceiver</a>

```
searchKey: main.alertmanagerCriticalReceiver
tags: [constant string private]
```

```Go
const alertmanagerCriticalReceiver = "src-critical-receiver"
```

### <a id="alertmanagerNoopReceiver" href="#alertmanagerNoopReceiver">const alertmanagerNoopReceiver</a>

```
searchKey: main.alertmanagerNoopReceiver
tags: [constant string private]
```

```Go
const alertmanagerNoopReceiver = "src-noop-receiver"
```

### <a id="alertmanagerPathPrefix" href="#alertmanagerPathPrefix">const alertmanagerPathPrefix</a>

```
searchKey: main.alertmanagerPathPrefix
tags: [constant string private]
```

```Go
const alertmanagerPathPrefix = "alertmanager"
```

Prefix to serve alertmanager on. If you change this, make sure you update prometheus.yml as well 

### <a id="alertmanagerWarningReceiver" href="#alertmanagerWarningReceiver">const alertmanagerWarningReceiver</a>

```
searchKey: main.alertmanagerWarningReceiver
tags: [constant string private]
```

```Go
const alertmanagerWarningReceiver = "src-warning-receiver"
```

### <a id="colorCritical" href="#colorCritical">const colorCritical</a>

```
searchKey: main.colorCritical
tags: [constant string private]
```

```Go
const colorCritical = "#FF0000" // red

```

### <a id="colorGood" href="#colorGood">const colorGood</a>

```
searchKey: main.colorGood
tags: [constant string private]
```

```Go
const colorGood = "#00FF00" // green

```

### <a id="colorWarning" href="#colorWarning">const colorWarning</a>

```
searchKey: main.colorWarning
tags: [constant string private]
```

```Go
const colorWarning = "#FFFF00" // yellow

```

### <a id="docsURL" href="#docsURL">const docsURL</a>

```
searchKey: main.docsURL
tags: [constant string private]
```

```Go
const docsURL = "https://docs.sourcegraph.com"
```

### <a id="matcherRegexPrefix" href="#matcherRegexPrefix">const matcherRegexPrefix</a>

```
searchKey: main.matcherRegexPrefix
tags: [constant string private]
```

```Go
const matcherRegexPrefix = "^("
```

### <a id="matcherRegexSuffix" href="#matcherRegexSuffix">const matcherRegexSuffix</a>

```
searchKey: main.matcherRegexSuffix
tags: [constant string private]
```

```Go
const matcherRegexSuffix = ")$"
```

## <a id="var" href="#var">Variables</a>

### <a id="alertSolutionsURLTemplate" href="#alertSolutionsURLTemplate">var alertSolutionsURLTemplate</a>

```
searchKey: main.alertSolutionsURLTemplate
tags: [variable string private]
```

```Go
var alertSolutionsURLTemplate = ...
```

Static alertmanager templates. Templating reference: [https://prometheus.io/docs/alerting/latest/notifications](https://prometheus.io/docs/alerting/latest/notifications) 

All `.CommonLabels` labels used in these templates should be included in `route.GroupByStr` in order for them to be available. 

### <a id="alertmanagerConfigPath" href="#alertmanagerConfigPath">var alertmanagerConfigPath</a>

```
searchKey: main.alertmanagerConfigPath
tags: [variable string private]
```

```Go
var alertmanagerConfigPath = ...
```

prom-wrapper configuration options 

### <a id="alertmanagerEnableCluster" href="#alertmanagerEnableCluster">var alertmanagerEnableCluster</a>

```
searchKey: main.alertmanagerEnableCluster
tags: [variable string private]
```

```Go
var alertmanagerEnableCluster = ...
```

prom-wrapper configuration options 

### <a id="alertmanagerPort" href="#alertmanagerPort">var alertmanagerPort</a>

```
searchKey: main.alertmanagerPort
tags: [variable string private]
```

```Go
var alertmanagerPort = env.Get("ALERTMANAGER_INTERNAL_PORT", "9093", "internal Alertmanager port")
```

prom-wrapper configuration options 

### <a id="commonLabels" href="#commonLabels">var commonLabels</a>

```
searchKey: main.commonLabels
tags: [variable array string private]
```

```Go
var commonLabels = []string{"alertname", "level", "service_name", "name", "owner", "description"}
```

commonLabels defines the set of labels we group alerts by, such that each alert falls in a unique group. These labels are available in Alertmanager templates as fields of `.CommonLabels`. 

Note that `alertname` is provided as a fallback grouping only - combinations of the other labels should be unique for alerts provided by the Sourcegraph generator. 

When changing this, make sure to update the webhook body documentation in /doc/admin/observability/alerting.md 

### <a id="exportPort" href="#exportPort">var exportPort</a>

```
searchKey: main.exportPort
tags: [variable string private]
```

```Go
var exportPort = ...
```

prom-wrapper configuration options 

### <a id="firingTitleTemplate" href="#firingTitleTemplate">var firingTitleTemplate</a>

```
searchKey: main.firingTitleTemplate
tags: [variable string private]
```

```Go
var firingTitleTemplate = "[{{ .CommonLabels.level | toUpper }}] {{ .CommonLabels.description }}"
```

Static alertmanager templates. Templating reference: [https://prometheus.io/docs/alerting/latest/notifications](https://prometheus.io/docs/alerting/latest/notifications) 

All `.CommonLabels` labels used in these templates should be included in `route.GroupByStr` in order for them to be available. 

Title templates 

### <a id="noAlertmanager" href="#noAlertmanager">var noAlertmanager</a>

```
searchKey: main.noAlertmanager
tags: [variable string private]
```

```Go
var noAlertmanager = os.Getenv("DISABLE_ALERTMANAGER")
```

prom-wrapper configuration options 

### <a id="noConfig" href="#noConfig">var noConfig</a>

```
searchKey: main.noConfig
tags: [variable string private]
```

```Go
var noConfig = os.Getenv("DISABLE_SOURCEGRAPH_CONFIG")
```

prom-wrapper configuration options 

### <a id="notificationTitleTemplate" href="#notificationTitleTemplate">var notificationTitleTemplate</a>

```
searchKey: main.notificationTitleTemplate
tags: [variable string private]
```

```Go
var notificationTitleTemplate = ...
```

Static alertmanager templates. Templating reference: [https://prometheus.io/docs/alerting/latest/notifications](https://prometheus.io/docs/alerting/latest/notifications) 

All `.CommonLabels` labels used in these templates should be included in `route.GroupByStr` in order for them to be available. 

### <a id="observableDocAnchorTemplate" href="#observableDocAnchorTemplate">var observableDocAnchorTemplate</a>

```
searchKey: main.observableDocAnchorTemplate
tags: [variable string private]
```

```Go
var observableDocAnchorTemplate = ...
```

Static alertmanager templates. Templating reference: [https://prometheus.io/docs/alerting/latest/notifications](https://prometheus.io/docs/alerting/latest/notifications) 

All `.CommonLabels` labels used in these templates should be included in `route.GroupByStr` in order for them to be available. 

observableDocAnchorTemplate must match anchors generated in `monitoring/monitoring/documentation.go`. 

### <a id="opsGenieAPIKey" href="#opsGenieAPIKey">var opsGenieAPIKey</a>

```
searchKey: main.opsGenieAPIKey
tags: [variable string private]
```

```Go
var opsGenieAPIKey = os.Getenv("OPSGENIE_API_KEY")
```

prom-wrapper configuration options 

### <a id="prometheusPort" href="#prometheusPort">var prometheusPort</a>

```
searchKey: main.prometheusPort
tags: [variable string private]
```

```Go
var prometheusPort = env.Get("PROMETHEUS_INTERNAL_PORT", "9092", "internal Prometheus port")
```

prom-wrapper configuration options 

### <a id="resolvedTitleTemplate" href="#resolvedTitleTemplate">var resolvedTitleTemplate</a>

```
searchKey: main.resolvedTitleTemplate
tags: [variable string private]
```

```Go
var resolvedTitleTemplate = "[RESOLVED] {{ .CommonLabels.description }}"
```

Static alertmanager templates. Templating reference: [https://prometheus.io/docs/alerting/latest/notifications](https://prometheus.io/docs/alerting/latest/notifications) 

All `.CommonLabels` labels used in these templates should be included in `route.GroupByStr` in order for them to be available. 

## <a id="type" href="#type">Types</a>

### <a id="AlertsStatusReporter" href="#AlertsStatusReporter">type AlertsStatusReporter struct</a>

```
searchKey: main.AlertsStatusReporter
tags: [struct]
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
tags: [function]
```

```Go
func NewAlertsStatusReporter(logger log15.Logger, alertmanager *amclient.Alertmanager, prom prometheus.API) *AlertsStatusReporter
```

#### <a id="AlertsStatusReporter.Handler" href="#AlertsStatusReporter.Handler">func (s *AlertsStatusReporter) Handler() http.Handler</a>

```
searchKey: main.AlertsStatusReporter.Handler
tags: [method]
```

```Go
func (s *AlertsStatusReporter) Handler() http.Handler
```

### <a id="Change" href="#Change">type Change func(ctx context.Context, log github.com/inconshreveable/log15.Logger, change github.com/sourcegraph/sourcegraph/docker-images/prometheus/cmd/prom-wrapper.ChangeContext, newConfig *github.com/sourcegraph/sourcegraph/docker-images/prometheus/cmd/prom-wrapper.subscribedSiteConfig) (result github.com/sourcegraph/sourcegraph/docker-images/prometheus/cmd/prom-wrapper.ChangeResult)</a>

```
searchKey: main.Change
tags: [function]
```

```Go
type Change func(ctx context.Context, log log15.Logger, change ChangeContext, newConfig *subscribedSiteConfig) (result ChangeResult)
```

Change implements a change to configuration 

### <a id="ChangeContext" href="#ChangeContext">type ChangeContext struct</a>

```
searchKey: main.ChangeContext
tags: [struct]
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
tags: [struct]
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
tags: [function private]
```

```Go
func changeReceivers(ctx context.Context, log log15.Logger, change ChangeContext, newConfig *subscribedSiteConfig) (result ChangeResult)
```

changeReceivers applies `observability.alerts` as Alertmanager receivers. 

#### <a id="changeSMTP" href="#changeSMTP">func changeSMTP(ctx context.Context, log log15.Logger, change ChangeContext, newConfig *subscribedSiteConfig) (result ChangeResult)</a>

```
searchKey: main.changeSMTP
tags: [function private]
```

```Go
func changeSMTP(ctx context.Context, log log15.Logger, change ChangeContext, newConfig *subscribedSiteConfig) (result ChangeResult)
```

changeSMTP applies SMTP server configuration. 

#### <a id="changeSilences" href="#changeSilences">func changeSilences(ctx context.Context, log log15.Logger, change ChangeContext, newConfig *subscribedSiteConfig) (result ChangeResult)</a>

```
searchKey: main.changeSilences
tags: [function private]
```

```Go
func changeSilences(ctx context.Context, log log15.Logger, change ChangeContext, newConfig *subscribedSiteConfig) (result ChangeResult)
```

changeSilences syncs Alertmanager silences with silences configured in observability.silenceAlerts 

### <a id="SiteConfigSubscriber" href="#SiteConfigSubscriber">type SiteConfigSubscriber struct</a>

```
searchKey: main.SiteConfigSubscriber
tags: [struct]
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
tags: [function]
```

```Go
func NewSiteConfigSubscriber(logger log15.Logger, alertmanager *amclient.Alertmanager) *SiteConfigSubscriber
```

#### <a id="SiteConfigSubscriber.Handler" href="#SiteConfigSubscriber.Handler">func (c *SiteConfigSubscriber) Handler() http.Handler</a>

```
searchKey: main.SiteConfigSubscriber.Handler
tags: [method]
```

```Go
func (c *SiteConfigSubscriber) Handler() http.Handler
```

#### <a id="SiteConfigSubscriber.Subscribe" href="#SiteConfigSubscriber.Subscribe">func (c *SiteConfigSubscriber) Subscribe(ctx context.Context)</a>

```
searchKey: main.SiteConfigSubscriber.Subscribe
tags: [method]
```

```Go
func (c *SiteConfigSubscriber) Subscribe(ctx context.Context)
```

#### <a id="SiteConfigSubscriber.execDiffs" href="#SiteConfigSubscriber.execDiffs">func (c *SiteConfigSubscriber) execDiffs(ctx context.Context, newConfig *subscribedSiteConfig, diffs []siteConfigDiff)</a>

```
searchKey: main.SiteConfigSubscriber.execDiffs
tags: [method private]
```

```Go
func (c *SiteConfigSubscriber) execDiffs(ctx context.Context, newConfig *subscribedSiteConfig, diffs []siteConfigDiff)
```

execDiffs updates grafanaAlertsSubscriber state and writes it to disk. It never returns an error, instead all errors are reported as problems 

### <a id="siteConfigDiff" href="#siteConfigDiff">type siteConfigDiff struct</a>

```
searchKey: main.siteConfigDiff
tags: [struct private]
```

```Go
type siteConfigDiff struct {
	Type   string
	change Change
}
```

### <a id="siteEmailConfig" href="#siteEmailConfig">type siteEmailConfig struct</a>

```
searchKey: main.siteEmailConfig
tags: [struct private]
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
tags: [struct private]
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
tags: [function private]
```

```Go
func newSubscribedSiteConfig(config schema.SiteConfiguration) *subscribedSiteConfig
```

newSubscribedSiteConfig creates a subscribedSiteConfig with sha256 sums calculated. 

#### <a id="subscribedSiteConfig.Diff" href="#subscribedSiteConfig.Diff">func (c *subscribedSiteConfig) Diff(other *subscribedSiteConfig) []siteConfigDiff</a>

```
searchKey: main.subscribedSiteConfig.Diff
tags: [method private]
```

```Go
func (c *subscribedSiteConfig) Diff(other *subscribedSiteConfig) []siteConfigDiff
```

Diff returns a set of changes to apply. 

## <a id="func" href="#func">Functions</a>

### <a id="NewAlertmanagerCmd" href="#NewAlertmanagerCmd">func NewAlertmanagerCmd(configPath string) *exec.Cmd</a>

```
searchKey: main.NewAlertmanagerCmd
tags: [function]
```

```Go
func NewAlertmanagerCmd(configPath string) *exec.Cmd
```

### <a id="NewPrometheusCmd" href="#NewPrometheusCmd">func NewPrometheusCmd(promArgs []string, promPort string) *exec.Cmd</a>

```
searchKey: main.NewPrometheusCmd
tags: [function]
```

```Go
func NewPrometheusCmd(promArgs []string, promPort string) *exec.Cmd
```

NewPrometheusCmd instantiates a new command to run Prometheus. Parameter promArgs replicates "$@" 

### <a id="TestAlertSolutionsURL" href="#TestAlertSolutionsURL">func TestAlertSolutionsURL(t *testing.T)</a>

```
searchKey: main.TestAlertSolutionsURL
tags: [function private test]
```

```Go
func TestAlertSolutionsURL(t *testing.T)
```

### <a id="TestAlertsStatusReporterHistory" href="#TestAlertsStatusReporterHistory">func TestAlertsStatusReporterHistory(t *testing.T)</a>

```
searchKey: main.TestAlertsStatusReporterHistory
tags: [function private test]
```

```Go
func TestAlertsStatusReporterHistory(t *testing.T)
```

### <a id="TestMatchersAndSilences" href="#TestMatchersAndSilences">func TestMatchersAndSilences(t *testing.T)</a>

```
searchKey: main.TestMatchersAndSilences
tags: [function private test]
```

```Go
func TestMatchersAndSilences(t *testing.T)
```

### <a id="TestNewRoutesAndReceivers" href="#TestNewRoutesAndReceivers">func TestNewRoutesAndReceivers(t *testing.T)</a>

```
searchKey: main.TestNewRoutesAndReceivers
tags: [function private test]
```

```Go
func TestNewRoutesAndReceivers(t *testing.T)
```

### <a id="alertSolutionsURL" href="#alertSolutionsURL">func alertSolutionsURL() string</a>

```
searchKey: main.alertSolutionsURL
tags: [function private]
```

```Go
func alertSolutionsURL() string
```

alertSolutionsURL generates a link to the alert solutions page that embeds the appropriate version if it is available and it is a semantic version. 

### <a id="applyConfiguration" href="#applyConfiguration">func applyConfiguration(ctx context.Context, cfg *amconfig.Config) error</a>

```
searchKey: main.applyConfiguration
tags: [function private]
```

```Go
func applyConfiguration(ctx context.Context, cfg *amconfig.Config) error
```

applyConfiguration writes validates and writes the given Alertmanager configuration to disk, and triggers a reload. 

### <a id="boolP" href="#boolP">func boolP(v bool) *bool</a>

```
searchKey: main.boolP
tags: [function private]
```

```Go
func boolP(v bool) *bool
```

### <a id="duration" href="#duration">func duration(dur time.Duration) *model.Duration</a>

```
searchKey: main.duration
tags: [function private]
```

```Go
func duration(dur time.Duration) *model.Duration
```

### <a id="init.siteconfig.go" href="#init.siteconfig.go">func init()</a>

```
searchKey: main.init
tags: [function private]
```

```Go
func init()
```

### <a id="main" href="#main">func main()</a>

```
searchKey: main.main
tags: [function private]
```

```Go
func main()
```

### <a id="newMatchersFromSilence" href="#newMatchersFromSilence">func newMatchersFromSilence(silence string) models.Matchers</a>

```
searchKey: main.newMatchersFromSilence
tags: [function private]
```

```Go
func newMatchersFromSilence(silence string) models.Matchers
```

newMatchersFromSilence creates Alertmanager alert matchers from a configured silence 

### <a id="newRootRoute" href="#newRootRoute">func newRootRoute(routes []*amconfig.Route) *amconfig.Route</a>

```
searchKey: main.newRootRoute
tags: [function private]
```

```Go
func newRootRoute(routes []*amconfig.Route) *amconfig.Route
```

newRootRoute generates a base Route required by Alertmanager to wrap all routes 

### <a id="newRoutesAndReceivers" href="#newRoutesAndReceivers">func newRoutesAndReceivers(newAlerts []*schema.ObservabilityAlerts, externalURL string, newProblem func(error)) ([]*amconfig.Receiver, []*amconfig.Route)</a>

```
searchKey: main.newRoutesAndReceivers
tags: [function private]
```

```Go
func newRoutesAndReceivers(newAlerts []*schema.ObservabilityAlerts, externalURL string, newProblem func(error)) ([]*amconfig.Receiver, []*amconfig.Route)
```

newRoutesAndReceivers converts the given alerts from Sourcegraph site configuration into Alertmanager receivers and routes with the following strategy: 

* Each alert level has a receiver, which has configuration for all channels for that level. * Each alert level and owner combination has a receiver and route, which has configuration for all channels for that filter. * Additional routes can route alerts based on `alerts.on`, but all alerts still fall through to the per-level receivers. 

### <a id="newSilenceFromMatchers" href="#newSilenceFromMatchers">func newSilenceFromMatchers(matchers models.Matchers) string</a>

```
searchKey: main.newSilenceFromMatchers
tags: [function private]
```

```Go
func newSilenceFromMatchers(matchers models.Matchers) string
```

newSilenceFromMatchers returns the silenced alert from Alertmanager alert matchers 

### <a id="reloadAlertmanager" href="#reloadAlertmanager">func reloadAlertmanager(ctx context.Context) error</a>

```
searchKey: main.reloadAlertmanager
tags: [function private]
```

```Go
func reloadAlertmanager(ctx context.Context) error
```

reloadAlertmanager triggers a realod of the Alertmanager configuration file, because package alertmanager/api/v2 does not have a wrapper for reload See [https://prometheus.io/docs/alerting/latest/management_api/#reload](https://prometheus.io/docs/alerting/latest/management_api/#reload) 

### <a id="renderConfiguration" href="#renderConfiguration">func renderConfiguration(cfg *amconfig.Config) ([]byte, error)</a>

```
searchKey: main.renderConfiguration
tags: [function private]
```

```Go
func renderConfiguration(cfg *amconfig.Config) ([]byte, error)
```

renderConfiguration marshals the given Alertmanager configuration to a format accepted by Alertmanager, and also validates that it will be accepted by Alertmanager. 

### <a id="runCmd" href="#runCmd">func runCmd(log log15.Logger, errs chan<- error, cmd *exec.Cmd)</a>

```
searchKey: main.runCmd
tags: [function private]
```

```Go
func runCmd(log log15.Logger, errs chan<- error, cmd *exec.Cmd)
```

### <a id="stringP" href="#stringP">func stringP(v string) *string</a>

```
searchKey: main.stringP
tags: [function private]
```

```Go
func stringP(v string) *string
```

### <a id="waitForAlertmanager" href="#waitForAlertmanager">func waitForAlertmanager(ctx context.Context, alertmanager *amclient.Alertmanager) error</a>

```
searchKey: main.waitForAlertmanager
tags: [function private]
```

```Go
func waitForAlertmanager(ctx context.Context, alertmanager *amclient.Alertmanager) error
```

