# Package shared

Package shared contains shared declarations between dashboards. In general, you should NOT be making changes to this package: we use a declarative style for monitoring intentionally, so you should err on the side of repeating yourself and NOT writing shared or programatically generated monitoring. 

When editing this package or introducing any shared declarations, you should abide strictly by the following rules: 

1. Do NOT declare a shared definition unless 5+ dashboards will use it. Sharing dashboard 

```
declarations means the codebase becomes more complex and non-declarative which we want to avoid
so repeat yourself instead if it applies to less than 5 dashboards.

```
2. ONLY declare shared Observables. Introducing shared Rows or Groups prevents individual dashboard 

```
maintainers from holistically considering both the layout of dashboards as well as the
metrics and alerts defined within them -- which we do not want.

```
3. Use the sharedObservable type and do NOT parameterize more than just the container name. It may 

```
be tempting to pass an alerting threshold as an argument, or parameterize whether a critical
alert is defined -- but this makes reasoning about alerts at a high level much more difficult.
If you have a need for this, it is a strong signal you should NOT be using the shared definition
anymore and should instead copy it and apply your modifications.

```
Learn more about monitoring in [https://about.sourcegraph.com/handbook/engineering/observability/monitoring_pillars](https://about.sourcegraph.com/handbook/engineering/observability/monitoring_pillars) 

## Index

* [Constants](#const)
    * [const TitleContainerMonitoring](#TitleContainerMonitoring)
    * [const TitleGolangMonitoring](#TitleGolangMonitoring)
    * [const TitleKubernetesMonitoring](#TitleKubernetesMonitoring)
    * [const TitleProvisioningIndicators](#TitleProvisioningIndicators)
* [Variables](#var)
    * [var ContainerMissing](#ContainerMissing)
    * [var ContainerMemoryUsage](#ContainerMemoryUsage)
    * [var ContainerCPUUsage](#ContainerCPUUsage)
    * [var ContainerIOUsage](#ContainerIOUsage)
    * [var FrontendInternalAPIErrorResponses](#FrontendInternalAPIErrorResponses)
    * [var GoGoroutines](#GoGoroutines)
    * [var GoGcDuration](#GoGcDuration)
    * [var KubernetesPodsAvailable](#KubernetesPodsAvailable)
    * [var ProvisioningCPUUsageLongTerm](#ProvisioningCPUUsageLongTerm)
    * [var ProvisioningMemoryUsageLongTerm](#ProvisioningMemoryUsageLongTerm)
    * [var ProvisioningCPUUsageShortTerm](#ProvisioningCPUUsageShortTerm)
    * [var ProvisioningMemoryUsageShortTerm](#ProvisioningMemoryUsageShortTerm)
* [Types](#type)
    * [type Observable monitoring.Observable](#Observable)
        * [func (o Observable) Observable() monitoring.Observable](#Observable.Observable)
        * [func (o Observable) WithWarning(a *monitoring.ObservableAlertDefinition) Observable](#Observable.WithWarning)
        * [func (o Observable) WithCritical(a *monitoring.ObservableAlertDefinition) Observable](#Observable.WithCritical)
        * [func (o Observable) WithNoAlerts(interpretation string) Observable](#Observable.WithNoAlerts)
    * [type sharedObservable func(containerName string, owner github.com/sourcegraph/sourcegraph/monitoring/monitoring.ObservableOwner) github.com/sourcegraph/sourcegraph/monitoring/definitions/shared.Observable](#sharedObservable)
* [Functions](#func)
    * [func CadvisorNameMatcher(containerName string) string](#CadvisorNameMatcher)


## <a id="const" href="#const">Constants</a>

### <a id="TitleContainerMonitoring" href="#TitleContainerMonitoring">const TitleContainerMonitoring</a>

```
searchKey: shared.TitleContainerMonitoring
```

```Go
const TitleContainerMonitoring = "Container monitoring (not available on server)"
```

Container monitoring overviews - these provide short-term overviews of container behaviour for a service. 

These observables should only use cAdvisor metrics, and are thus only available on Kubernetes and docker-compose deployments. 

cAdvisor metrics reference: [https://github.com/google/cadvisor/blob/master/docs/storage/prometheus.md#prometheus-container-metrics](https://github.com/google/cadvisor/blob/master/docs/storage/prometheus.md#prometheus-container-metrics) 

### <a id="TitleGolangMonitoring" href="#TitleGolangMonitoring">const TitleGolangMonitoring</a>

```
searchKey: shared.TitleGolangMonitoring
```

```Go
const TitleGolangMonitoring = "Golang runtime monitoring"
```

Golang monitoring overviews. 

Uses metrics exported by the Prometheus Golang library, so is available on all deployment types. 

### <a id="TitleKubernetesMonitoring" href="#TitleKubernetesMonitoring">const TitleKubernetesMonitoring</a>

```
searchKey: shared.TitleKubernetesMonitoring
```

```Go
const TitleKubernetesMonitoring = "Kubernetes monitoring (only available on Kubernetes)"
```

Kubernetes monitoring overviews. 

These observables should only use metrics exported by Kubernetes, or use Prometheus metrics in a way that only applies in Kubernetes deployments. 

### <a id="TitleProvisioningIndicators" href="#TitleProvisioningIndicators">const TitleProvisioningIndicators</a>

```
searchKey: shared.TitleProvisioningIndicators
```

```Go
const TitleProvisioningIndicators = "Provisioning indicators (not available on server)"
```

Provisioning indicator overviews - these provide long-term overviews of container resource usage. The goal of these observables are to provide guidance on whether or not a service requires more or less resources. 

These observables should only use cAdvisor metrics, and are thus only available on Kubernetes and docker-compose deployments. 

## <a id="var" href="#var">Variables</a>

### <a id="ContainerMissing" href="#ContainerMissing">var ContainerMissing</a>

```
searchKey: shared.ContainerMissing
```

```Go
var ContainerMissing sharedObservable = ...
```

### <a id="ContainerMemoryUsage" href="#ContainerMemoryUsage">var ContainerMemoryUsage</a>

```
searchKey: shared.ContainerMemoryUsage
```

```Go
var ContainerMemoryUsage sharedObservable = ...
```

### <a id="ContainerCPUUsage" href="#ContainerCPUUsage">var ContainerCPUUsage</a>

```
searchKey: shared.ContainerCPUUsage
```

```Go
var ContainerCPUUsage sharedObservable = ...
```

### <a id="ContainerIOUsage" href="#ContainerIOUsage">var ContainerIOUsage</a>

```
searchKey: shared.ContainerIOUsage
```

```Go
var ContainerIOUsage sharedObservable = ...
```

ContainerIOUsage monitors filesystem reads and writes, and is useful for services that use disk. 

### <a id="FrontendInternalAPIErrorResponses" href="#FrontendInternalAPIErrorResponses">var FrontendInternalAPIErrorResponses</a>

```
searchKey: shared.FrontendInternalAPIErrorResponses
```

```Go
var FrontendInternalAPIErrorResponses sharedObservable = ...
```

### <a id="GoGoroutines" href="#GoGoroutines">var GoGoroutines</a>

```
searchKey: shared.GoGoroutines
```

```Go
var GoGoroutines sharedObservable = ...
```

### <a id="GoGcDuration" href="#GoGcDuration">var GoGcDuration</a>

```
searchKey: shared.GoGcDuration
```

```Go
var GoGcDuration sharedObservable = ...
```

### <a id="KubernetesPodsAvailable" href="#KubernetesPodsAvailable">var KubernetesPodsAvailable</a>

```
searchKey: shared.KubernetesPodsAvailable
```

```Go
var KubernetesPodsAvailable sharedObservable = ...
```

### <a id="ProvisioningCPUUsageLongTerm" href="#ProvisioningCPUUsageLongTerm">var ProvisioningCPUUsageLongTerm</a>

```
searchKey: shared.ProvisioningCPUUsageLongTerm
```

```Go
var ProvisioningCPUUsageLongTerm sharedObservable = ...
```

### <a id="ProvisioningMemoryUsageLongTerm" href="#ProvisioningMemoryUsageLongTerm">var ProvisioningMemoryUsageLongTerm</a>

```
searchKey: shared.ProvisioningMemoryUsageLongTerm
```

```Go
var ProvisioningMemoryUsageLongTerm sharedObservable = ...
```

### <a id="ProvisioningCPUUsageShortTerm" href="#ProvisioningCPUUsageShortTerm">var ProvisioningCPUUsageShortTerm</a>

```
searchKey: shared.ProvisioningCPUUsageShortTerm
```

```Go
var ProvisioningCPUUsageShortTerm sharedObservable = ...
```

### <a id="ProvisioningMemoryUsageShortTerm" href="#ProvisioningMemoryUsageShortTerm">var ProvisioningMemoryUsageShortTerm</a>

```
searchKey: shared.ProvisioningMemoryUsageShortTerm
```

```Go
var ProvisioningMemoryUsageShortTerm sharedObservable = ...
```

## <a id="type" href="#type">Types</a>

### <a id="Observable" href="#Observable">type Observable monitoring.Observable</a>

```
searchKey: shared.Observable
```

```Go
type Observable monitoring.Observable
```

Observable is a variant of normal Observables that offer convenience functions for customizing shared observables. 

#### <a id="Observable.Observable" href="#Observable.Observable">func (o Observable) Observable() monitoring.Observable</a>

```
searchKey: shared.Observable.Observable
```

```Go
func (o Observable) Observable() monitoring.Observable
```

Observable is a convenience adapter that casts this SharedObservable as an normal Observable. 

#### <a id="Observable.WithWarning" href="#Observable.WithWarning">func (o Observable) WithWarning(a *monitoring.ObservableAlertDefinition) Observable</a>

```
searchKey: shared.Observable.WithWarning
```

```Go
func (o Observable) WithWarning(a *monitoring.ObservableAlertDefinition) Observable
```

WithWarning overrides this Observable's warning-level alert with the given alert. 

#### <a id="Observable.WithCritical" href="#Observable.WithCritical">func (o Observable) WithCritical(a *monitoring.ObservableAlertDefinition) Observable</a>

```
searchKey: shared.Observable.WithCritical
```

```Go
func (o Observable) WithCritical(a *monitoring.ObservableAlertDefinition) Observable
```

WithCritical overrides this Observable's critical-level alert with the given alert. 

#### <a id="Observable.WithNoAlerts" href="#Observable.WithNoAlerts">func (o Observable) WithNoAlerts(interpretation string) Observable</a>

```
searchKey: shared.Observable.WithNoAlerts
```

```Go
func (o Observable) WithNoAlerts(interpretation string) Observable
```

WithNoAlerts disables alerting on this Observable and sets the given interpretation instead. 

### <a id="sharedObservable" href="#sharedObservable">type sharedObservable func(containerName string, owner github.com/sourcegraph/sourcegraph/monitoring/monitoring.ObservableOwner) github.com/sourcegraph/sourcegraph/monitoring/definitions/shared.Observable</a>

```
searchKey: shared.sharedObservable
tags: [private]
```

```Go
type sharedObservable func(containerName string, owner monitoring.ObservableOwner) Observable
```

sharedObservable defines the type all shared observable variables should have in this package. 

## <a id="func" href="#func">Functions</a>

### <a id="CadvisorNameMatcher" href="#CadvisorNameMatcher">func CadvisorNameMatcher(containerName string) string</a>

```
searchKey: shared.CadvisorNameMatcher
```

```Go
func CadvisorNameMatcher(containerName string) string
```

CadvisorNameMatcher generates Prometheus matchers that capture metrics that match the given container name while excluding some irrelevant series. 

