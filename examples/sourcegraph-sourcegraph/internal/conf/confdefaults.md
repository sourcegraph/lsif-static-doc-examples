# Package confdefaults

Package confdefaults contains default configuration files for various deployment types. 

It is a separate package so that users of pkg/conf do not indirectly import pkg/database/confdb, which we have a linter to protect against. 

## Index

* [Variables](#var)
    * [var Default](#Default)
    * [var DevAndTesting](#DevAndTesting)
    * [var DockerContainer](#DockerContainer)
    * [var KubernetesOrDockerComposeOrPureDocker](#KubernetesOrDockerComposeOrPureDocker)


## <a id="var" href="#var">Variables</a>

```
tags: [private]
```

### <a id="Default" href="#Default">var Default</a>

```
searchKey: confdefaults.Default
tags: [variable struct]
```

```Go
var Default conftypes.RawUnified
```

Default is the default for *this* deployment type. It is populated by pkg/conf at init time. 

### <a id="DevAndTesting" href="#DevAndTesting">var DevAndTesting</a>

```
searchKey: confdefaults.DevAndTesting
tags: [variable struct]
```

```Go
var DevAndTesting = ...
```

DevAndTesting is the default configuration applied to dev instances of Sourcegraph, as well as what is used by default during Go testing. 

Tests that wish to use a specific configuration should use conf.Mock. 

Note: This actually generally only applies to 'go test' because we always override this configuration via *_CONFIG_FILE environment variables. 

### <a id="DockerContainer" href="#DockerContainer">var DockerContainer</a>

```
searchKey: confdefaults.DockerContainer
tags: [variable struct]
```

```Go
var DockerContainer = ...
```

DockerContainer is the default configuration applied to Docker single-container instances of Sourcegraph. 

### <a id="KubernetesOrDockerComposeOrPureDocker" href="#KubernetesOrDockerComposeOrPureDocker">var KubernetesOrDockerComposeOrPureDocker</a>

```
searchKey: confdefaults.KubernetesOrDockerComposeOrPureDocker
tags: [variable struct]
```

```Go
var KubernetesOrDockerComposeOrPureDocker = ...
```

KubernetesOrDockerComposeOrPureDocker is the default configuration applied to Kubernetes, Docker Compose, and pure Docker instances of Sourcegraph. 

