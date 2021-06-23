# Package srccli

## Index

* [Constants](#const)
    * [const MinimumVersion](#MinimumVersion)
    * [const githubAPIReleasesEndpoint](#githubAPIReleasesEndpoint)
* [Types](#type)
    * [type releaseMeta struct](#releaseMeta)
* [Functions](#func)
    * [func Version() (string, error)](#Version)
    * [func highestMatchingVersion(minimumVersion *semver.Version, versions []*semver.Version) (*semver.Version, error)](#highestMatchingVersion)
    * [func releaseVersions(url string) ([]*semver.Version, error)](#releaseVersions)
    * [func releaseVersionsPage(url string) ([]*semver.Version, string, error)](#releaseVersionsPage)
    * [func TestHighestMatchingVersion(t *testing.T)](#TestHighestMatchingVersion)
    * [func TestReleaseVersions(t *testing.T)](#TestReleaseVersions)


## <a id="const" href="#const">Constants</a>

```
tags: [private]
```

### <a id="MinimumVersion" href="#MinimumVersion">const MinimumVersion</a>

```
searchKey: srccli.MinimumVersion
```

```Go
const MinimumVersion = "3.29.0"
```

MinimumVersion is the minimum src-cli release version that works with this instance. This must be updated manually between releases. The public HTTP API will return this (or an updated patch version) as the suggested download with this instance. 

At the time of a Sourcegraph release, this is always the latest src-cli version. 

### <a id="githubAPIReleasesEndpoint" href="#githubAPIReleasesEndpoint">const githubAPIReleasesEndpoint</a>

```
searchKey: srccli.githubAPIReleasesEndpoint
tags: [private]
```

```Go
const githubAPIReleasesEndpoint = "https://api.github.com/repos/sourcegraph/src-cli/releases"
```

## <a id="type" href="#type">Types</a>

```
tags: [private]
```

### <a id="releaseMeta" href="#releaseMeta">type releaseMeta struct</a>

```
searchKey: srccli.releaseMeta
tags: [private]
```

```Go
type releaseMeta struct {
	TagName    string `json:"tag_name"`
	Draft      bool   `json:"draft"`
	Prerelease bool   `json:"prerelease"`
}
```

## <a id="func" href="#func">Functions</a>

```
tags: [private]
```

### <a id="Version" href="#Version">func Version() (string, error)</a>

```
searchKey: srccli.Version
```

```Go
func Version() (string, error)
```

Version returns the highest public version currently available via the GitHub release page that has the same major and minor versions as the configured minimum version. This allows us to recommend patch updates without having to release a sourcegraph instance with a bumped constant. 

### <a id="highestMatchingVersion" href="#highestMatchingVersion">func highestMatchingVersion(minimumVersion *semver.Version, versions []*semver.Version) (*semver.Version, error)</a>

```
searchKey: srccli.highestMatchingVersion
tags: [private]
```

```Go
func highestMatchingVersion(minimumVersion *semver.Version, versions []*semver.Version) (*semver.Version, error)
```

highestMatchingVersion returns the highest version with the same major and minor value as the given minimum version. 

### <a id="releaseVersions" href="#releaseVersions">func releaseVersions(url string) ([]*semver.Version, error)</a>

```
searchKey: srccli.releaseVersions
tags: [private]
```

```Go
func releaseVersions(url string) ([]*semver.Version, error)
```

releaseVersions requests the given URL and all subsequent pages of releases. Returns the non-draft, non-prerelease items with a valid semver tag. 

### <a id="releaseVersionsPage" href="#releaseVersionsPage">func releaseVersionsPage(url string) ([]*semver.Version, string, error)</a>

```
searchKey: srccli.releaseVersionsPage
tags: [private]
```

```Go
func releaseVersionsPage(url string) ([]*semver.Version, string, error)
```

releaseVersionsPage requests the given URL and returns the non-draft, non-prerelease items with a valid semver tag and the url for the next page of results (if one exists). 

### <a id="TestHighestMatchingVersion" href="#TestHighestMatchingVersion">func TestHighestMatchingVersion(t *testing.T)</a>

```
searchKey: srccli.TestHighestMatchingVersion
tags: [private]
```

```Go
func TestHighestMatchingVersion(t *testing.T)
```

### <a id="TestReleaseVersions" href="#TestReleaseVersions">func TestReleaseVersions(t *testing.T)</a>

```
searchKey: srccli.TestReleaseVersions
tags: [private]
```

```Go
func TestReleaseVersions(t *testing.T)
```

