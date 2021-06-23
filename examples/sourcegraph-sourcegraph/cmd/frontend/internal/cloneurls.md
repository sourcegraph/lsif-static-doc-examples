# Package cloneurls

## Index

* [Functions](#func)
    * [func ReposourceCloneURLToRepoName(ctx context.Context, cloneURL string) (repoName api.RepoName, err error)](#ReposourceCloneURLToRepoName)
    * [func TestReposourceCloneURLToRepoName(t *testing.T)](#TestReposourceCloneURLToRepoName)


## <a id="func" href="#func">Functions</a>

```
tags: [private]
```

### <a id="ReposourceCloneURLToRepoName" href="#ReposourceCloneURLToRepoName">func ReposourceCloneURLToRepoName(ctx context.Context, cloneURL string) (repoName api.RepoName, err error)</a>

```
searchKey: cloneurls.ReposourceCloneURLToRepoName
```

```Go
func ReposourceCloneURLToRepoName(ctx context.Context, cloneURL string) (repoName api.RepoName, err error)
```

ReposourceCloneURLToRepoName maps a Git clone URL (format documented here: [https://git-scm.com/docs/git-clone#_git_urls_a_id_urls_a](https://git-scm.com/docs/git-clone#_git_urls_a_id_urls_a)) to the corresponding repo name if there exists a code host configuration that matches the clone URL. Implicitly, it includes a code host configuration for github.com, even if one is not explicitly specified. Returns the empty string and nil error if a matching code host could not be found. This function does not actually check the code host to see if the repository actually exists. 

### <a id="TestReposourceCloneURLToRepoName" href="#TestReposourceCloneURLToRepoName">func TestReposourceCloneURLToRepoName(t *testing.T)</a>

```
searchKey: cloneurls.TestReposourceCloneURLToRepoName
tags: [private]
```

```Go
func TestReposourceCloneURLToRepoName(t *testing.T)
```

