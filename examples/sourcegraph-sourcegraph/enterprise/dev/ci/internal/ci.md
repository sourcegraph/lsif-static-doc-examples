# Package ci

Package ci is responsible for generating a Buildkite pipeline configuration. It is invoked by the gen-pipeline.go command. 

## Index

* [Variables](#var)
    * [var ignoredRootFiles](#ignoredRootFiles)
* [Types](#type)
    * [type Config struct](#Config)
        * [func ComputeConfig() Config](#ComputeConfig)
        * [func (c Config) candidateImageTag() string](#Config.candidateImageTag)
        * [func (c Config) ensureCommit() error](#Config.ensureCommit)
        * [func (c Config) isDocsOnly() bool](#Config.isDocsOnly)
        * [func (c Config) isGoOnly() bool](#Config.isGoOnly)
        * [func (c *Config) isMainBranch() bool](#Config.isMainBranch)
        * [func (c Config) isPR() bool](#Config.isPR)
        * [func (c Config) isSgOnly() bool](#Config.isSgOnly)
        * [func (c Config) isStorybookAffected() bool](#Config.isStorybookAffected)
        * [func (c Config) shortCommit() string](#Config.shortCommit)
        * [func (c Config) shouldRunE2EandQA() bool](#Config.shouldRunE2EandQA)
* [Functions](#func)
    * [func GeneratePipeline(c Config) (*bk.Pipeline, error)](#GeneratePipeline)
    * [func addBackendIntegrationTests(c Config) func(*bk.Pipeline)](#addBackendIntegrationTests)
    * [func addBrandedTests(pipeline *bk.Pipeline)](#addBrandedTests)
    * [func addBrowserExt(pipeline *bk.Pipeline)](#addBrowserExt)
    * [func addBrowserExtensionE2ESteps(pipeline *bk.Pipeline)](#addBrowserExtensionE2ESteps)
    * [func addBrowserExtensionReleaseSteps(pipeline *bk.Pipeline)](#addBrowserExtensionReleaseSteps)
    * [func addCandidateDockerImage(c Config, app string) func(*bk.Pipeline)](#addCandidateDockerImage)
    * [func addCheck(pipeline *bk.Pipeline)](#addCheck)
    * [func addDockerImages(c Config, final bool) func(*bk.Pipeline)](#addDockerImages)
    * [func addDockerfileLint(pipeline *bk.Pipeline)](#addDockerfileLint)
    * [func addDocs(pipeline *bk.Pipeline)](#addDocs)
    * [func addFinalDockerImage(c Config, app string, insiders bool) func(*bk.Pipeline)](#addFinalDockerImage)
    * [func addGoBuild(pipeline *bk.Pipeline)](#addGoBuild)
    * [func addGoTests(pipeline *bk.Pipeline)](#addGoTests)
    * [func addLint(pipeline *bk.Pipeline)](#addLint)
    * [func addPostgresBackcompat(pipeline *bk.Pipeline)](#addPostgresBackcompat)
    * [func addSharedTests(c Config) func(pipeline *bk.Pipeline)](#addSharedTests)
    * [func addWebApp(pipeline *bk.Pipeline)](#addWebApp)
    * [func clusterDockerImages(images []string) string](#clusterDockerImages)
    * [func contains(s []string, str string) bool](#contains)
    * [func copyEnv(keys ...string) map[string]string](#copyEnv)
    * [func isAllowedRootFile(p string) bool](#isAllowedRootFile)
    * [func triggerAsync(c Config) func(*bk.Pipeline)](#triggerAsync)
    * [func triggerE2EandQA(c Config, commonEnv map[string]string) func(*bk.Pipeline)](#triggerE2EandQA)
    * [func triggerUpdaterPipeline(c Config) func(*bk.Pipeline)](#triggerUpdaterPipeline)
    * [func wait(pipeline *bk.Pipeline)](#wait)


## <a id="var" href="#var">Variables</a>

```
tags: [private]
```

### <a id="ignoredRootFiles" href="#ignoredRootFiles">var ignoredRootFiles</a>

```
searchKey: ci.ignoredRootFiles
tags: [variable array string private]
```

```Go
var ignoredRootFiles = ...
```

Changes in the files below will be ignored by the Storybook workflow. 

## <a id="type" href="#type">Types</a>

```
tags: [private]
```

### <a id="Config" href="#Config">type Config struct</a>

```
searchKey: ci.Config
tags: [struct]
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
tags: [function]
```

```Go
func ComputeConfig() Config
```

#### <a id="Config.candidateImageTag" href="#Config.candidateImageTag">func (c Config) candidateImageTag() string</a>

```
searchKey: ci.Config.candidateImageTag
tags: [method private]
```

```Go
func (c Config) candidateImageTag() string
```

candidateImageTag provides the tag for a candidate image built for this Buildkite run. 

Note that the availability of this image depends on whether a candidate gets built, as determined in `addDockerImages()`. 

#### <a id="Config.ensureCommit" href="#Config.ensureCommit">func (c Config) ensureCommit() error</a>

```
searchKey: ci.Config.ensureCommit
tags: [method private]
```

```Go
func (c Config) ensureCommit() error
```

#### <a id="Config.isDocsOnly" href="#Config.isDocsOnly">func (c Config) isDocsOnly() bool</a>

```
searchKey: ci.Config.isDocsOnly
tags: [method private]
```

```Go
func (c Config) isDocsOnly() bool
```

#### <a id="Config.isGoOnly" href="#Config.isGoOnly">func (c Config) isGoOnly() bool</a>

```
searchKey: ci.Config.isGoOnly
tags: [method private]
```

```Go
func (c Config) isGoOnly() bool
```

#### <a id="Config.isMainBranch" href="#Config.isMainBranch">func (c *Config) isMainBranch() bool</a>

```
searchKey: ci.Config.isMainBranch
tags: [method private]
```

```Go
func (c *Config) isMainBranch() bool
```

#### <a id="Config.isPR" href="#Config.isPR">func (c Config) isPR() bool</a>

```
searchKey: ci.Config.isPR
tags: [method private]
```

```Go
func (c Config) isPR() bool
```

#### <a id="Config.isSgOnly" href="#Config.isSgOnly">func (c Config) isSgOnly() bool</a>

```
searchKey: ci.Config.isSgOnly
tags: [method private]
```

```Go
func (c Config) isSgOnly() bool
```

isSgOnly returns whether the changedFiles are only in the ./dev/sg folder. 

#### <a id="Config.isStorybookAffected" href="#Config.isStorybookAffected">func (c Config) isStorybookAffected() bool</a>

```
searchKey: ci.Config.isStorybookAffected
tags: [method private]
```

```Go
func (c Config) isStorybookAffected() bool
```

Run Storybook workflow only if related files were changed. 

#### <a id="Config.shortCommit" href="#Config.shortCommit">func (c Config) shortCommit() string</a>

```
searchKey: ci.Config.shortCommit
tags: [method private]
```

```Go
func (c Config) shortCommit() string
```

#### <a id="Config.shouldRunE2EandQA" href="#Config.shouldRunE2EandQA">func (c Config) shouldRunE2EandQA() bool</a>

```
searchKey: ci.Config.shouldRunE2EandQA
tags: [method private]
```

```Go
func (c Config) shouldRunE2EandQA() bool
```

## <a id="func" href="#func">Functions</a>

```
tags: [private]
```

### <a id="GeneratePipeline" href="#GeneratePipeline">func GeneratePipeline(c Config) (*bk.Pipeline, error)</a>

```
searchKey: ci.GeneratePipeline
tags: [function]
```

```Go
func GeneratePipeline(c Config) (*bk.Pipeline, error)
```

GeneratePipeline is the main pipeline generation function. It defines the build pipeline for each of the main CI cases, which are defined in the main switch statement in the function. 

### <a id="addBackendIntegrationTests" href="#addBackendIntegrationTests">func addBackendIntegrationTests(c Config) func(*bk.Pipeline)</a>

```
searchKey: ci.addBackendIntegrationTests
tags: [function private]
```

```Go
func addBackendIntegrationTests(c Config) func(*bk.Pipeline)
```

Adds backend integration tests step. 

### <a id="addBrandedTests" href="#addBrandedTests">func addBrandedTests(pipeline *bk.Pipeline)</a>

```
searchKey: ci.addBrandedTests
tags: [function private]
```

```Go
func addBrandedTests(pipeline *bk.Pipeline)
```

### <a id="addBrowserExt" href="#addBrowserExt">func addBrowserExt(pipeline *bk.Pipeline)</a>

```
searchKey: ci.addBrowserExt
tags: [function private]
```

```Go
func addBrowserExt(pipeline *bk.Pipeline)
```

Builds and tests the browser extension. 

### <a id="addBrowserExtensionE2ESteps" href="#addBrowserExtensionE2ESteps">func addBrowserExtensionE2ESteps(pipeline *bk.Pipeline)</a>

```
searchKey: ci.addBrowserExtensionE2ESteps
tags: [function private]
```

```Go
func addBrowserExtensionE2ESteps(pipeline *bk.Pipeline)
```

### <a id="addBrowserExtensionReleaseSteps" href="#addBrowserExtensionReleaseSteps">func addBrowserExtensionReleaseSteps(pipeline *bk.Pipeline)</a>

```
searchKey: ci.addBrowserExtensionReleaseSteps
tags: [function private]
```

```Go
func addBrowserExtensionReleaseSteps(pipeline *bk.Pipeline)
```

Release the browser extension. 

### <a id="addCandidateDockerImage" href="#addCandidateDockerImage">func addCandidateDockerImage(c Config, app string) func(*bk.Pipeline)</a>

```
searchKey: ci.addCandidateDockerImage
tags: [function private]
```

```Go
func addCandidateDockerImage(c Config, app string) func(*bk.Pipeline)
```

Build a candidate docker image that will re-tagged with the final tags once the e2e tests pass. 

### <a id="addCheck" href="#addCheck">func addCheck(pipeline *bk.Pipeline)</a>

```
searchKey: ci.addCheck
tags: [function private]
```

```Go
func addCheck(pipeline *bk.Pipeline)
```

Adds the static check test step. 

### <a id="addDockerImages" href="#addDockerImages">func addDockerImages(c Config, final bool) func(*bk.Pipeline)</a>

```
searchKey: ci.addDockerImages
tags: [function private]
```

```Go
func addDockerImages(c Config, final bool) func(*bk.Pipeline)
```

Build all relevant Docker images for Sourcegraph (for example, candidates and final images), given the current CI case (e.g., "tagged release", "release branch", "master branch", etc.) 

Notes: 

- Publishing of `insiders` implies deployment - See `images.go` for more details on what images get built and where they get published 

### <a id="addDockerfileLint" href="#addDockerfileLint">func addDockerfileLint(pipeline *bk.Pipeline)</a>

```
searchKey: ci.addDockerfileLint
tags: [function private]
```

```Go
func addDockerfileLint(pipeline *bk.Pipeline)
```

Lints the Dockerfiles. 

### <a id="addDocs" href="#addDocs">func addDocs(pipeline *bk.Pipeline)</a>

```
searchKey: ci.addDocs
tags: [function private]
```

```Go
func addDocs(pipeline *bk.Pipeline)
```

Verifies the docs formatting and builds the `docsite` command. 

### <a id="addFinalDockerImage" href="#addFinalDockerImage">func addFinalDockerImage(c Config, app string, insiders bool) func(*bk.Pipeline)</a>

```
searchKey: ci.addFinalDockerImage
tags: [function private]
```

```Go
func addFinalDockerImage(c Config, app string, insiders bool) func(*bk.Pipeline)
```

Tag and push final Docker image for the service defined by `app` after the e2e tests pass. 

### <a id="addGoBuild" href="#addGoBuild">func addGoBuild(pipeline *bk.Pipeline)</a>

```
searchKey: ci.addGoBuild
tags: [function private]
```

```Go
func addGoBuild(pipeline *bk.Pipeline)
```

Builds the OSS and Enterprise Go commands. 

### <a id="addGoTests" href="#addGoTests">func addGoTests(pipeline *bk.Pipeline)</a>

```
searchKey: ci.addGoTests
tags: [function private]
```

```Go
func addGoTests(pipeline *bk.Pipeline)
```

Adds the Go test step. 

### <a id="addLint" href="#addLint">func addLint(pipeline *bk.Pipeline)</a>

```
searchKey: ci.addLint
tags: [function private]
```

```Go
func addLint(pipeline *bk.Pipeline)
```

Adds the lint test step. 

### <a id="addPostgresBackcompat" href="#addPostgresBackcompat">func addPostgresBackcompat(pipeline *bk.Pipeline)</a>

```
searchKey: ci.addPostgresBackcompat
tags: [function private]
```

```Go
func addPostgresBackcompat(pipeline *bk.Pipeline)
```

Adds PostgreSQL backcompat tests. 

### <a id="addSharedTests" href="#addSharedTests">func addSharedTests(c Config) func(pipeline *bk.Pipeline)</a>

```
searchKey: ci.addSharedTests
tags: [function private]
```

```Go
func addSharedTests(c Config) func(pipeline *bk.Pipeline)
```

Adds the shared frontend tests (shared between the web app and browser extension). 

### <a id="addWebApp" href="#addWebApp">func addWebApp(pipeline *bk.Pipeline)</a>

```
searchKey: ci.addWebApp
tags: [function private]
```

```Go
func addWebApp(pipeline *bk.Pipeline)
```

Adds steps for the OSS and Enterprise web app builds. Runs the web app tests. 

### <a id="clusterDockerImages" href="#clusterDockerImages">func clusterDockerImages(images []string) string</a>

```
searchKey: ci.clusterDockerImages
tags: [function private]
```

```Go
func clusterDockerImages(images []string) string
```

images used by cluster-qa test 

### <a id="contains" href="#contains">func contains(s []string, str string) bool</a>

```
searchKey: ci.contains
tags: [function private]
```

```Go
func contains(s []string, str string) bool
```

### <a id="copyEnv" href="#copyEnv">func copyEnv(keys ...string) map[string]string</a>

```
searchKey: ci.copyEnv
tags: [function private]
```

```Go
func copyEnv(keys ...string) map[string]string
```

### <a id="isAllowedRootFile" href="#isAllowedRootFile">func isAllowedRootFile(p string) bool</a>

```
searchKey: ci.isAllowedRootFile
tags: [function private]
```

```Go
func isAllowedRootFile(p string) bool
```

### <a id="triggerAsync" href="#triggerAsync">func triggerAsync(c Config) func(*bk.Pipeline)</a>

```
searchKey: ci.triggerAsync
tags: [function private]
```

```Go
func triggerAsync(c Config) func(*bk.Pipeline)
```

Trigger the async pipeline to run. 

### <a id="triggerE2EandQA" href="#triggerE2EandQA">func triggerE2EandQA(c Config, commonEnv map[string]string) func(*bk.Pipeline)</a>

```
searchKey: ci.triggerE2EandQA
tags: [function private]
```

```Go
func triggerE2EandQA(c Config, commonEnv map[string]string) func(*bk.Pipeline)
```

### <a id="triggerUpdaterPipeline" href="#triggerUpdaterPipeline">func triggerUpdaterPipeline(c Config) func(*bk.Pipeline)</a>

```
searchKey: ci.triggerUpdaterPipeline
tags: [function private]
```

```Go
func triggerUpdaterPipeline(c Config) func(*bk.Pipeline)
```

### <a id="wait" href="#wait">func wait(pipeline *bk.Pipeline)</a>

```
searchKey: ci.wait
tags: [function private]
```

```Go
func wait(pipeline *bk.Pipeline)
```

Adds a Buildkite pipeline "Wait". 

