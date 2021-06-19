# Package ci

Package ci is responsible for generating a Buildkite pipeline configuration. It is invoked by the gen-pipeline.go command. 

## Index

* [Variables](#var)
    * [var ignoredRootFiles](#ignoredRootFiles)
* [Types](#type)
    * [type Config struct](#Config)
        * [func ComputeConfig() Config](#ComputeConfig)
        * [func (c Config) shortCommit() string](#Config.shortCommit)
        * [func (c *Config) isMainBranch() bool](#Config.isMainBranch)
        * [func (c Config) ensureCommit() error](#Config.ensureCommit)
        * [func (c Config) isPR() bool](#Config.isPR)
        * [func (c Config) isDocsOnly() bool](#Config.isDocsOnly)
        * [func (c Config) isSgOnly() bool](#Config.isSgOnly)
        * [func (c Config) isGoOnly() bool](#Config.isGoOnly)
        * [func (c Config) shouldRunE2EandQA() bool](#Config.shouldRunE2EandQA)
        * [func (c Config) candidateImageTag() string](#Config.candidateImageTag)
        * [func (c Config) isStorybookAffected() bool](#Config.isStorybookAffected)
* [Functions](#func)
    * [func contains(s []string, str string) bool](#contains)
    * [func isAllowedRootFile(p string) bool](#isAllowedRootFile)
    * [func addDocs(pipeline *bk.Pipeline)](#addDocs)
    * [func addCheck(pipeline *bk.Pipeline)](#addCheck)
    * [func addLint(pipeline *bk.Pipeline)](#addLint)
    * [func addWebApp(pipeline *bk.Pipeline)](#addWebApp)
    * [func addBrowserExt(pipeline *bk.Pipeline)](#addBrowserExt)
    * [func addSharedTests(c Config) func(pipeline *bk.Pipeline)](#addSharedTests)
    * [func addBrandedTests(pipeline *bk.Pipeline)](#addBrandedTests)
    * [func addPostgresBackcompat(pipeline *bk.Pipeline)](#addPostgresBackcompat)
    * [func addGoTests(pipeline *bk.Pipeline)](#addGoTests)
    * [func addGoBuild(pipeline *bk.Pipeline)](#addGoBuild)
    * [func addDockerfileLint(pipeline *bk.Pipeline)](#addDockerfileLint)
    * [func addBackendIntegrationTests(c Config) func(*bk.Pipeline)](#addBackendIntegrationTests)
    * [func addBrowserExtensionE2ESteps(pipeline *bk.Pipeline)](#addBrowserExtensionE2ESteps)
    * [func addBrowserExtensionReleaseSteps(pipeline *bk.Pipeline)](#addBrowserExtensionReleaseSteps)
    * [func wait(pipeline *bk.Pipeline)](#wait)
    * [func triggerAsync(c Config) func(*bk.Pipeline)](#triggerAsync)
    * [func triggerUpdaterPipeline(c Config) func(*bk.Pipeline)](#triggerUpdaterPipeline)
    * [func clusterDockerImages(images []string) string](#clusterDockerImages)
    * [func triggerE2EandQA(c Config, commonEnv map[string]string) func(*bk.Pipeline)](#triggerE2EandQA)
    * [func copyEnv(keys ...string) map[string]string](#copyEnv)
    * [func addDockerImages(c Config, final bool) func(*bk.Pipeline)](#addDockerImages)
    * [func addCandidateDockerImage(c Config, app string) func(*bk.Pipeline)](#addCandidateDockerImage)
    * [func addFinalDockerImage(c Config, app string, insiders bool) func(*bk.Pipeline)](#addFinalDockerImage)
    * [func GeneratePipeline(c Config) (*bk.Pipeline, error)](#GeneratePipeline)


## <a id="var" href="#var">Variables</a>

### <a id="ignoredRootFiles" href="#ignoredRootFiles">var ignoredRootFiles</a>

```
searchKey: ci.ignoredRootFiles
```

```Go
var ignoredRootFiles = ...
```

Changes in the files below will be ignored by the Storybook workflow. 

## <a id="type" href="#type">Types</a>

### <a id="Config" href="#Config">type Config struct</a>

```
searchKey: ci.Config
tags: [exported]
```

```Go
type Config struct {
	now         time.Time
	branch      string
	version     string
	commit      string
	buildNumber int

	// mustIncludeCommit, if non-empty, is a list of commits at least one of which must be present
	// in the branch. If empty, then no check is enforced.
	mustIncludeCommit []string

	// changedFiles is the list of files that have changed since the
	// merge-base with origin/master.
	changedFiles []string

	taggedRelease         bool
	releaseBranch         bool
	isBextReleaseBranch   bool
	isBextNightly         bool
	isRenovateBranch      bool
	patch                 bool
	patchNoTest           bool
	buildCandidatesNoTest bool
	isQuick               bool
	isMainDryRun          bool
	isBackendDryRun       bool

	// profilingEnabled, if true, tells buildkite to print timing and resource utilization information
	// for each command
	profilingEnabled bool
}
```

Config is the set of configuration parameters that determine the structure of the CI build. These parameters are extracted from the build environment (branch name, commit hash, timestamp, etc.) 

#### <a id="ComputeConfig" href="#ComputeConfig">func ComputeConfig() Config</a>

```
searchKey: ci.ComputeConfig
tags: [exported]
```

```Go
func ComputeConfig() Config
```

#### <a id="Config.shortCommit" href="#Config.shortCommit">func (c Config) shortCommit() string</a>

```
searchKey: ci.Config.shortCommit
```

```Go
func (c Config) shortCommit() string
```

#### <a id="Config.isMainBranch" href="#Config.isMainBranch">func (c *Config) isMainBranch() bool</a>

```
searchKey: ci.Config.isMainBranch
```

```Go
func (c *Config) isMainBranch() bool
```

#### <a id="Config.ensureCommit" href="#Config.ensureCommit">func (c Config) ensureCommit() error</a>

```
searchKey: ci.Config.ensureCommit
```

```Go
func (c Config) ensureCommit() error
```

#### <a id="Config.isPR" href="#Config.isPR">func (c Config) isPR() bool</a>

```
searchKey: ci.Config.isPR
```

```Go
func (c Config) isPR() bool
```

#### <a id="Config.isDocsOnly" href="#Config.isDocsOnly">func (c Config) isDocsOnly() bool</a>

```
searchKey: ci.Config.isDocsOnly
```

```Go
func (c Config) isDocsOnly() bool
```

#### <a id="Config.isSgOnly" href="#Config.isSgOnly">func (c Config) isSgOnly() bool</a>

```
searchKey: ci.Config.isSgOnly
```

```Go
func (c Config) isSgOnly() bool
```

isSgOnly returns whether the changedFiles are only in the ./dev/sg folder. 

#### <a id="Config.isGoOnly" href="#Config.isGoOnly">func (c Config) isGoOnly() bool</a>

```
searchKey: ci.Config.isGoOnly
```

```Go
func (c Config) isGoOnly() bool
```

#### <a id="Config.shouldRunE2EandQA" href="#Config.shouldRunE2EandQA">func (c Config) shouldRunE2EandQA() bool</a>

```
searchKey: ci.Config.shouldRunE2EandQA
```

```Go
func (c Config) shouldRunE2EandQA() bool
```

#### <a id="Config.candidateImageTag" href="#Config.candidateImageTag">func (c Config) candidateImageTag() string</a>

```
searchKey: ci.Config.candidateImageTag
```

```Go
func (c Config) candidateImageTag() string
```

candidateImageTag provides the tag for a candidate image built for this Buildkite run. 

Note that the availability of this image depends on whether a candidate gets built, as determined in `addDockerImages()`. 

#### <a id="Config.isStorybookAffected" href="#Config.isStorybookAffected">func (c Config) isStorybookAffected() bool</a>

```
searchKey: ci.Config.isStorybookAffected
```

```Go
func (c Config) isStorybookAffected() bool
```

Run Storybook workflow only if related files were changed. 

## <a id="func" href="#func">Functions</a>

### <a id="contains" href="#contains">func contains(s []string, str string) bool</a>

```
searchKey: ci.contains
```

```Go
func contains(s []string, str string) bool
```

### <a id="isAllowedRootFile" href="#isAllowedRootFile">func isAllowedRootFile(p string) bool</a>

```
searchKey: ci.isAllowedRootFile
```

```Go
func isAllowedRootFile(p string) bool
```

### <a id="addDocs" href="#addDocs">func addDocs(pipeline *bk.Pipeline)</a>

```
searchKey: ci.addDocs
```

```Go
func addDocs(pipeline *bk.Pipeline)
```

Verifies the docs formatting and builds the `docsite` command. 

### <a id="addCheck" href="#addCheck">func addCheck(pipeline *bk.Pipeline)</a>

```
searchKey: ci.addCheck
```

```Go
func addCheck(pipeline *bk.Pipeline)
```

Adds the static check test step. 

### <a id="addLint" href="#addLint">func addLint(pipeline *bk.Pipeline)</a>

```
searchKey: ci.addLint
```

```Go
func addLint(pipeline *bk.Pipeline)
```

Adds the lint test step. 

### <a id="addWebApp" href="#addWebApp">func addWebApp(pipeline *bk.Pipeline)</a>

```
searchKey: ci.addWebApp
```

```Go
func addWebApp(pipeline *bk.Pipeline)
```

Adds steps for the OSS and Enterprise web app builds. Runs the web app tests. 

### <a id="addBrowserExt" href="#addBrowserExt">func addBrowserExt(pipeline *bk.Pipeline)</a>

```
searchKey: ci.addBrowserExt
```

```Go
func addBrowserExt(pipeline *bk.Pipeline)
```

Builds and tests the browser extension. 

### <a id="addSharedTests" href="#addSharedTests">func addSharedTests(c Config) func(pipeline *bk.Pipeline)</a>

```
searchKey: ci.addSharedTests
```

```Go
func addSharedTests(c Config) func(pipeline *bk.Pipeline)
```

Adds the shared frontend tests (shared between the web app and browser extension). 

### <a id="addBrandedTests" href="#addBrandedTests">func addBrandedTests(pipeline *bk.Pipeline)</a>

```
searchKey: ci.addBrandedTests
```

```Go
func addBrandedTests(pipeline *bk.Pipeline)
```

### <a id="addPostgresBackcompat" href="#addPostgresBackcompat">func addPostgresBackcompat(pipeline *bk.Pipeline)</a>

```
searchKey: ci.addPostgresBackcompat
```

```Go
func addPostgresBackcompat(pipeline *bk.Pipeline)
```

Adds PostgreSQL backcompat tests. 

### <a id="addGoTests" href="#addGoTests">func addGoTests(pipeline *bk.Pipeline)</a>

```
searchKey: ci.addGoTests
```

```Go
func addGoTests(pipeline *bk.Pipeline)
```

Adds the Go test step. 

### <a id="addGoBuild" href="#addGoBuild">func addGoBuild(pipeline *bk.Pipeline)</a>

```
searchKey: ci.addGoBuild
```

```Go
func addGoBuild(pipeline *bk.Pipeline)
```

Builds the OSS and Enterprise Go commands. 

### <a id="addDockerfileLint" href="#addDockerfileLint">func addDockerfileLint(pipeline *bk.Pipeline)</a>

```
searchKey: ci.addDockerfileLint
```

```Go
func addDockerfileLint(pipeline *bk.Pipeline)
```

Lints the Dockerfiles. 

### <a id="addBackendIntegrationTests" href="#addBackendIntegrationTests">func addBackendIntegrationTests(c Config) func(*bk.Pipeline)</a>

```
searchKey: ci.addBackendIntegrationTests
```

```Go
func addBackendIntegrationTests(c Config) func(*bk.Pipeline)
```

Adds backend integration tests step. 

### <a id="addBrowserExtensionE2ESteps" href="#addBrowserExtensionE2ESteps">func addBrowserExtensionE2ESteps(pipeline *bk.Pipeline)</a>

```
searchKey: ci.addBrowserExtensionE2ESteps
```

```Go
func addBrowserExtensionE2ESteps(pipeline *bk.Pipeline)
```

### <a id="addBrowserExtensionReleaseSteps" href="#addBrowserExtensionReleaseSteps">func addBrowserExtensionReleaseSteps(pipeline *bk.Pipeline)</a>

```
searchKey: ci.addBrowserExtensionReleaseSteps
```

```Go
func addBrowserExtensionReleaseSteps(pipeline *bk.Pipeline)
```

Release the browser extension. 

### <a id="wait" href="#wait">func wait(pipeline *bk.Pipeline)</a>

```
searchKey: ci.wait
```

```Go
func wait(pipeline *bk.Pipeline)
```

Adds a Buildkite pipeline "Wait". 

### <a id="triggerAsync" href="#triggerAsync">func triggerAsync(c Config) func(*bk.Pipeline)</a>

```
searchKey: ci.triggerAsync
```

```Go
func triggerAsync(c Config) func(*bk.Pipeline)
```

Trigger the async pipeline to run. 

### <a id="triggerUpdaterPipeline" href="#triggerUpdaterPipeline">func triggerUpdaterPipeline(c Config) func(*bk.Pipeline)</a>

```
searchKey: ci.triggerUpdaterPipeline
```

```Go
func triggerUpdaterPipeline(c Config) func(*bk.Pipeline)
```

### <a id="clusterDockerImages" href="#clusterDockerImages">func clusterDockerImages(images []string) string</a>

```
searchKey: ci.clusterDockerImages
```

```Go
func clusterDockerImages(images []string) string
```

images used by cluster-qa test 

### <a id="triggerE2EandQA" href="#triggerE2EandQA">func triggerE2EandQA(c Config, commonEnv map[string]string) func(*bk.Pipeline)</a>

```
searchKey: ci.triggerE2EandQA
```

```Go
func triggerE2EandQA(c Config, commonEnv map[string]string) func(*bk.Pipeline)
```

### <a id="copyEnv" href="#copyEnv">func copyEnv(keys ...string) map[string]string</a>

```
searchKey: ci.copyEnv
```

```Go
func copyEnv(keys ...string) map[string]string
```

### <a id="addDockerImages" href="#addDockerImages">func addDockerImages(c Config, final bool) func(*bk.Pipeline)</a>

```
searchKey: ci.addDockerImages
```

```Go
func addDockerImages(c Config, final bool) func(*bk.Pipeline)
```

Build all relevant Docker images for Sourcegraph (for example, candidates and final images), given the current CI case (e.g., "tagged release", "release branch", "master branch", etc.) 

Notes: 

- Publishing of `insiders` implies deployment - See `images.go` for more details on what images get built and where they get published 

### <a id="addCandidateDockerImage" href="#addCandidateDockerImage">func addCandidateDockerImage(c Config, app string) func(*bk.Pipeline)</a>

```
searchKey: ci.addCandidateDockerImage
```

```Go
func addCandidateDockerImage(c Config, app string) func(*bk.Pipeline)
```

Build a candidate docker image that will re-tagged with the final tags once the e2e tests pass. 

### <a id="addFinalDockerImage" href="#addFinalDockerImage">func addFinalDockerImage(c Config, app string, insiders bool) func(*bk.Pipeline)</a>

```
searchKey: ci.addFinalDockerImage
```

```Go
func addFinalDockerImage(c Config, app string, insiders bool) func(*bk.Pipeline)
```

Tag and push final Docker image for the service defined by `app` after the e2e tests pass. 

### <a id="GeneratePipeline" href="#GeneratePipeline">func GeneratePipeline(c Config) (*bk.Pipeline, error)</a>

```
searchKey: ci.GeneratePipeline
tags: [exported]
```

```Go
func GeneratePipeline(c Config) (*bk.Pipeline, error)
```

GeneratePipeline is the main pipeline generation function. It defines the build pipeline for each of the main CI cases, which are defined in the main switch statement in the function. 

