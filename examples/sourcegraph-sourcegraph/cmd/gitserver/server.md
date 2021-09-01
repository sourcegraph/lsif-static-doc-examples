# Package server

Package server implements the gitserver service. 

## Index

* [Constants](#const)
    * [const gitConfigMaybeCorrupt](#gitConfigMaybeCorrupt)
    * [const headFileRefPrefix](#headFileRefPrefix)
    * [const repoTTL](#repoTTL)
    * [const repoTTLGC](#repoTTLGC)
    * [const reposStatsName](#reposStatsName)
    * [const tempDirName](#tempDirName)
    * [const testRepoA](#testRepoA)
    * [const testRepoC](#testRepoC)
* [Variables](#var)
    * [var badRefs](#badRefs)
    * [var badRefsOnce](#badRefsOnce)
    * [var callSignPattern](#callSignPattern)
    * [var cloneQueue](#cloneQueue)
    * [var customGitFetch](#customGitFetch)
    * [var defaultGitolite](#defaultGitolite)
    * [var doBackgroundRepoUpdateMock](#doBackgroundRepoUpdateMock)
    * [var enableGCAuto](#enableGCAuto)
    * [var execDuration](#execDuration)
    * [var execRunning](#execRunning)
    * [var headBranchPattern](#headBranchPattern)
    * [var janitorRunning](#janitorRunning)
    * [var jobTimer](#jobTimer)
    * [var lastCheckAt](#lastCheckAt)
    * [var lastCheckMutex](#lastCheckMutex)
    * [var logUnflushableResponseWriterOnce](#logUnflushableResponseWriterOnce)
    * [var longGitCommandTimeout](#longGitCommandTimeout)
    * [var lsRemoteQueue](#lsRemoteQueue)
    * [var maybeCorruptStderrRe](#maybeCorruptStderrRe)
    * [var metricServiceDuration](#metricServiceDuration)
    * [var metricServiceRunning](#metricServiceRunning)
    * [var patchID](#patchID)
    * [var refspecOverrides](#refspecOverrides)
    * [var repoCloned](#repoCloned)
    * [var repoClonedCounter](#repoClonedCounter)
    * [var repoLastChanged](#repoLastChanged)
    * [var repoLastFetched](#repoLastFetched)
    * [var repoRemoteRefs](#repoRemoteRefs)
    * [var repoStateUpsertCounter](#repoStateUpsertCounter)
    * [var repoSyncStateCounter](#repoSyncStateCounter)
    * [var repoSyncStatePercentComplete](#repoSyncStatePercentComplete)
    * [var reposRecloned](#reposRecloned)
    * [var reposRemoved](#reposRemoved)
    * [var reposRemovedDiskPressure](#reposRemovedDiskPressure)
    * [var runCommandMock](#runCommandMock)
    * [var sshAgentSockID](#sshAgentSockID)
    * [var testGitRepoExists](#testGitRepoExists)
    * [var testRepoCorrupter](#testRepoCorrupter)
    * [var tlsExternal](#tlsExternal)
    * [var traceLogs](#traceLogs)
* [Types](#type)
    * [type DiskSizer interface](#DiskSizer)
    * [type GitDir string](#GitDir)
        * [func (dir GitDir) Path(elem ...string) string](#GitDir.Path)
        * [func (dir GitDir) Set(cmd *exec.Cmd)](#GitDir.Set)
    * [type GitRepoSyncer struct{}](#GitRepoSyncer)
        * [func (s *GitRepoSyncer) CloneCommand(ctx context.Context, remoteURL *vcs.URL, tmpPath string) (cmd *exec.Cmd, err error)](#GitRepoSyncer.CloneCommand)
        * [func (s *GitRepoSyncer) Fetch(ctx context.Context, remoteURL *vcs.URL, dir GitDir) error](#GitRepoSyncer.Fetch)
        * [func (s *GitRepoSyncer) IsCloneable(ctx context.Context, remoteURL *vcs.URL) error](#GitRepoSyncer.IsCloneable)
        * [func (s *GitRepoSyncer) RemoteShowCommand(ctx context.Context, remoteURL *vcs.URL) (cmd *exec.Cmd, err error)](#GitRepoSyncer.RemoteShowCommand)
        * [func (s *GitRepoSyncer) Type() string](#GitRepoSyncer.Type)
        * [func (s *GitRepoSyncer) fetchCommand(ctx context.Context, remoteURL *vcs.URL) (cmd *exec.Cmd, configRemoteOpts bool)](#GitRepoSyncer.fetchCommand)
    * [type PerforceDepotSyncer struct](#PerforceDepotSyncer)
        * [func (s *PerforceDepotSyncer) CloneCommand(ctx context.Context, remoteURL *vcs.URL, tmpPath string) (*exec.Cmd, error)](#PerforceDepotSyncer.CloneCommand)
        * [func (s *PerforceDepotSyncer) Fetch(ctx context.Context, remoteURL *vcs.URL, dir GitDir) error](#PerforceDepotSyncer.Fetch)
        * [func (s *PerforceDepotSyncer) IsCloneable(ctx context.Context, remoteURL *vcs.URL) error](#PerforceDepotSyncer.IsCloneable)
        * [func (s *PerforceDepotSyncer) RemoteShowCommand(ctx context.Context, remoteURL *vcs.URL) (cmd *exec.Cmd, err error)](#PerforceDepotSyncer.RemoteShowCommand)
        * [func (s *PerforceDepotSyncer) Type() string](#PerforceDepotSyncer.Type)
    * [type RepositoryLock struct](#RepositoryLock)
        * [func (l *RepositoryLock) Release()](#RepositoryLock.Release)
        * [func (l *RepositoryLock) SetStatus(status string)](#RepositoryLock.SetStatus)
    * [type RepositoryLocker struct](#RepositoryLocker)
        * [func (rl *RepositoryLocker) Status(dir GitDir) (status string, locked bool)](#RepositoryLocker.Status)
        * [func (rl *RepositoryLocker) TryAcquire(dir GitDir, initialStatus string) (lock *RepositoryLock, ok bool)](#RepositoryLocker.TryAcquire)
    * [type Server struct](#Server)
        * [func makeTestServer(ctx context.Context, repoDir, remote string, db dbutil.DB) *Server](#makeTestServer)
        * [func (s *Server) Handler() http.Handler](#Server.Handler)
        * [func (s *Server) Janitor(interval time.Duration)](#Server.Janitor)
        * [func (s *Server) RegisterMetrics()](#Server.RegisterMetrics)
        * [func (s *Server) SetupAndClearTmp() (string, error)](#Server.SetupAndClearTmp)
        * [func (s *Server) Stop()](#Server.Stop)
        * [func (s *Server) SyncRepoState(interval time.Duration, batchSize, perSecond int)](#Server.SyncRepoState)
        * [func (s *Server) acquireCloneLimiter(ctx context.Context) (context.Context, context.CancelFunc, error)](#Server.acquireCloneLimiter)
        * [func (s *Server) acquireCloneableLimiter(ctx context.Context) (context.Context, context.CancelFunc, error)](#Server.acquireCloneableLimiter)
        * [func (s *Server) cleanTmpFiles(dir GitDir)](#Server.cleanTmpFiles)
        * [func (s *Server) cleanupRepos()](#Server.cleanupRepos)
        * [func (s *Server) cloneRepo(ctx context.Context, repo api.RepoName, opts *cloneOptions) (string, error)](#Server.cloneRepo)
        * [func (s *Server) createCommitFromPatch(ctx context.Context, req protocol.CreateCommitFromPatchRequest) (int, protocol.CreateCommitFromPatchResponse)](#Server.createCommitFromPatch)
        * [func (s *Server) deleteRepo(repo api.RepoName) error](#Server.deleteRepo)
        * [func (s *Server) dir(name api.RepoName) GitDir](#Server.dir)
        * [func (s *Server) doBackgroundRepoUpdate(repo api.RepoName) error](#Server.doBackgroundRepoUpdate)
        * [func (s *Server) doRepoUpdate(ctx context.Context, repo api.RepoName) error](#Server.doRepoUpdate)
        * [func (s *Server) ensureRevision(ctx context.Context, repo api.RepoName, rev string, repoDir GitDir) (didUpdate bool)](#Server.ensureRevision)
        * [func (s *Server) exec(w http.ResponseWriter, r *http.Request, req *protocol.ExecRequest)](#Server.exec)
        * [func (s *Server) findGitDirs() ([]GitDir, error)](#Server.findGitDirs)
        * [func (s *Server) freeUpSpace(howManyBytesToFree int64) error](#Server.freeUpSpace)
        * [func (s *Server) getRemoteURL(ctx context.Context, name api.RepoName) (*vcs.URL, error)](#Server.getRemoteURL)
        * [func (s *Server) gitServiceHandler() *gitservice.Handler](#Server.gitServiceHandler)
        * [func (s *Server) handleArchive(w http.ResponseWriter, r *http.Request)](#Server.handleArchive)
        * [func (s *Server) handleCreateCommitFromPatch(w http.ResponseWriter, r *http.Request)](#Server.handleCreateCommitFromPatch)
        * [func (s *Server) handleExec(w http.ResponseWriter, r *http.Request)](#Server.handleExec)
        * [func (s *Server) handleGetGitolitePhabricatorMetadata(w http.ResponseWriter, r *http.Request)](#Server.handleGetGitolitePhabricatorMetadata)
        * [func (s *Server) handleIsRepoCloneable(w http.ResponseWriter, r *http.Request)](#Server.handleIsRepoCloneable)
        * [func (s *Server) handleIsRepoCloned(w http.ResponseWriter, r *http.Request)](#Server.handleIsRepoCloned)
        * [func (s *Server) handleList(w http.ResponseWriter, r *http.Request)](#Server.handleList)
        * [func (s *Server) handleListGitolite(w http.ResponseWriter, r *http.Request)](#Server.handleListGitolite)
        * [func (s *Server) handleP4Exec(w http.ResponseWriter, r *http.Request)](#Server.handleP4Exec)
        * [func (s *Server) handleRepoCloneProgress(w http.ResponseWriter, r *http.Request)](#Server.handleRepoCloneProgress)
        * [func (s *Server) handleRepoDelete(w http.ResponseWriter, r *http.Request)](#Server.handleRepoDelete)
        * [func (s *Server) handleRepoInfo(w http.ResponseWriter, r *http.Request)](#Server.handleRepoInfo)
        * [func (s *Server) handleRepoUpdate(w http.ResponseWriter, r *http.Request)](#Server.handleRepoUpdate)
        * [func (s *Server) handleReposStats(w http.ResponseWriter, r *http.Request)](#Server.handleReposStats)
        * [func (s *Server) hostnameMatch(addr string) bool](#Server.hostnameMatch)
        * [func (s *Server) howManyBytesToFree() (int64, error)](#Server.howManyBytesToFree)
        * [func (s *Server) ignorePath(path string) bool](#Server.ignorePath)
        * [func (s *Server) name(dir GitDir) api.RepoName](#Server.name)
        * [func (s *Server) p4exec(w http.ResponseWriter, r *http.Request, req *protocol.P4ExecRequest)](#Server.p4exec)
        * [func (s *Server) queryCloneLimiter() (cap, len int)](#Server.queryCloneLimiter)
        * [func (s *Server) removeRepoDirectory(gitDir GitDir) error](#Server.removeRepoDirectory)
        * [func (s *Server) repoCloneProgress(repo api.RepoName) (*protocol.RepoCloneProgress, error)](#Server.repoCloneProgress)
        * [func (s *Server) repoInfo(ctx context.Context, repo api.RepoName) (*protocol.RepoInfo, error)](#Server.repoInfo)
        * [func (s *Server) serverContext() (context.Context, context.CancelFunc)](#Server.serverContext)
        * [func (s *Server) setCloneStatus(ctx context.Context, name api.RepoName, status types.CloneStatus) (err error)](#Server.setCloneStatus)
        * [func (s *Server) setCloneStatusNonFatal(ctx context.Context, name api.RepoName, status types.CloneStatus)](#Server.setCloneStatusNonFatal)
        * [func (s *Server) setLastError(ctx context.Context, name api.RepoName, error string) (err error)](#Server.setLastError)
        * [func (s *Server) setLastErrorNonFatal(ctx context.Context, name api.RepoName, err error)](#Server.setLastErrorNonFatal)
        * [func (s *Server) syncRepoState(addrs []string, batchSize, perSecond int) error](#Server.syncRepoState)
        * [func (s *Server) tempDir(prefix string) (name string, err error)](#Server.tempDir)
    * [type StatDiskSizer struct{}](#StatDiskSizer)
        * [func (s *StatDiskSizer) BytesFreeOnDisk(mountPoint string) (uint64, error)](#StatDiskSizer.BytesFreeOnDisk)
        * [func (s *StatDiskSizer) DiskSizeBytes(mountPoint string) (uint64, error)](#StatDiskSizer.DiskSizeBytes)
    * [type Test struct](#Test)
    * [type VCSSyncer interface](#VCSSyncer)
    * [type cloneOptions struct](#cloneOptions)
    * [type fakeDiskSizer struct](#fakeDiskSizer)
        * [func (f *fakeDiskSizer) BytesFreeOnDisk(mountPoint string) (uint64, error)](#fakeDiskSizer.BytesFreeOnDisk)
        * [func (f *fakeDiskSizer) DiskSizeBytes(mountPoint string) (uint64, error)](#fakeDiskSizer.DiskSizeBytes)
    * [type flushFunc func()](#flushFunc)
        * [func (f flushFunc) Flush()](#flushFunc.Flush)
    * [type flushingResponseWriter struct](#flushingResponseWriter)
        * [func newFlushingResponseWriter(w http.ResponseWriter) *flushingResponseWriter](#newFlushingResponseWriter)
        * [func (f *flushingResponseWriter) Close()](#flushingResponseWriter.Close)
        * [func (f *flushingResponseWriter) Header() http.Header](#flushingResponseWriter.Header)
        * [func (f *flushingResponseWriter) Write(p []byte) (int, error)](#flushingResponseWriter.Write)
        * [func (f *flushingResponseWriter) WriteHeader(code int)](#flushingResponseWriter.WriteHeader)
        * [func (f *flushingResponseWriter) periodicFlush()](#flushingResponseWriter.periodicFlush)
    * [type gitoliteClient struct{}](#gitoliteClient)
        * [func (c gitoliteClient) ListRepos(ctx context.Context, host string) ([]*gitolite.Repo, error)](#gitoliteClient.ListRepos)
    * [type gitoliteFetcher struct](#gitoliteFetcher)
        * [func (g gitoliteFetcher) listRepos(ctx context.Context, gitoliteHost string, w http.ResponseWriter)](#gitoliteFetcher.listRepos)
    * [type iGitoliteClient interface](#iGitoliteClient)
    * [type limitWriter struct](#limitWriter)
        * [func (l *limitWriter) Write(p []byte) (int, error)](#limitWriter.Write)
    * [type locks struct](#locks)
    * [type progressWriter struct](#progressWriter)
        * [func (w *progressWriter) Bytes() []byte](#progressWriter.Bytes)
        * [func (w *progressWriter) String() string](#progressWriter.String)
        * [func (w *progressWriter) Write(p []byte) (n int, err error)](#progressWriter.Write)
    * [type sshAgent struct](#sshAgent)
        * [func newSSHAgent(raw, passphrase []byte) (*sshAgent, error)](#newSSHAgent)
        * [func (a *sshAgent) Close() error](#sshAgent.Close)
        * [func (a *sshAgent) Listen()](#sshAgent.Listen)
        * [func (a *sshAgent) Socket() string](#sshAgent.Socket)
    * [type stubGitoliteClient struct](#stubGitoliteClient)
        * [func (c stubGitoliteClient) ListRepos(ctx context.Context, host string) ([]*gitolite.Repo, error)](#stubGitoliteClient.ListRepos)
    * [type tlsConfig struct](#tlsConfig)
    * [type urlRedactor struct](#urlRedactor)
        * [func newURLRedactor(parsedURL *vcs.URL) *urlRedactor](#newURLRedactor)
        * [func (r *urlRedactor) redact(message string) string](#urlRedactor.redact)
    * [type writeCounter struct](#writeCounter)
        * [func (c *writeCounter) Write(p []byte) (n int, err error)](#writeCounter.Write)
* [Functions](#func)
    * [func BenchmarkQuickRevParseHeadQuickSymbolicRefHead_packed_refs(b *testing.B)](#BenchmarkQuickRevParseHeadQuickSymbolicRefHead_packed_refs)
    * [func BenchmarkQuickRevParseHeadQuickSymbolicRefHead_unpacked_refs(b *testing.B)](#BenchmarkQuickRevParseHeadQuickSymbolicRefHead_unpacked_refs)
    * [func TestCleanupExpired(t *testing.T)](#TestCleanupExpired)
    * [func TestCleanupInactive(t *testing.T)](#TestCleanupInactive)
    * [func TestCleanupOldLocks(t *testing.T)](#TestCleanupOldLocks)
    * [func TestCleanup_computeStats(t *testing.T)](#TestCleanup_computeStats)
    * [func TestCloneRepo(t *testing.T)](#TestCloneRepo)
    * [func TestCloneRepo_EnsureValidity(t *testing.T)](#TestCloneRepo_EnsureValidity)
    * [func TestConfigureRemoteGitCommand(t *testing.T)](#TestConfigureRemoteGitCommand)
    * [func TestConfigureRemoteGitCommand_tls(t *testing.T)](#TestConfigureRemoteGitCommand_tls)
    * [func TestCustomGitFetch(t *testing.T)](#TestCustomGitFetch)
    * [func TestDecomposePerforceRemoteURL(t *testing.T)](#TestDecomposePerforceRemoteURL)
    * [func TestEmptyCustomGitFetch(t *testing.T)](#TestEmptyCustomGitFetch)
    * [func TestFlushingResponseWriter(t *testing.T)](#TestFlushingResponseWriter)
    * [func TestFreeUpSpace(t *testing.T)](#TestFreeUpSpace)
    * [func TestGitGCAuto(t *testing.T)](#TestGitGCAuto)
    * [func TestHandleRepoUpdate(t *testing.T)](#TestHandleRepoUpdate)
    * [func TestHostnameMatch(t *testing.T)](#TestHostnameMatch)
    * [func TestHowManyBytesToFree(t *testing.T)](#TestHowManyBytesToFree)
    * [func TestJitterDuration(t *testing.T)](#TestJitterDuration)
    * [func TestMain(m *testing.M)](#TestMain)
    * [func TestMaybeCorruptStderrRe(t *testing.T)](#TestMaybeCorruptStderrRe)
    * [func TestProgressWriter(t *testing.T)](#TestProgressWriter)
    * [func TestRemoveBadRefs(t *testing.T)](#TestRemoveBadRefs)
    * [func TestRemoveRepoDirectory(t *testing.T)](#TestRemoveRepoDirectory)
    * [func TestRemoveRepoDirectory_Empty(t *testing.T)](#TestRemoveRepoDirectory_Empty)
    * [func TestRequest(t *testing.T)](#TestRequest)
    * [func TestSSHAgent(t *testing.T)](#TestSSHAgent)
    * [func TestServer_handleGet(t *testing.T)](#TestServer_handleGet)
    * [func TestServer_handleGet_invalid(t *testing.T)](#TestServer_handleGet_invalid)
    * [func TestServer_handleList(t *testing.T)](#TestServer_handleList)
    * [func TestServer_handleP4Exec(t *testing.T)](#TestServer_handleP4Exec)
    * [func TestServer_handleRepoInfo(t *testing.T)](#TestServer_handleRepoInfo)
    * [func TestSetupAndClearTmp(t *testing.T)](#TestSetupAndClearTmp)
    * [func TestSetupAndClearTmp_Empty(t *testing.T)](#TestSetupAndClearTmp_Empty)
    * [func TestSyncRepoState(t *testing.T)](#TestSyncRepoState)
    * [func TestUpdateFileIfDifferent(t *testing.T)](#TestUpdateFileIfDifferent)
    * [func TestUrlRedactor(t *testing.T)](#TestUrlRedactor)
    * [func Test_Gitolite_listRepos(t *testing.T)](#Test_Gitolite_listRepos)
    * [func assertPaths(t *testing.T, root string, want ...string)](#assertPaths)
    * [func bestEffortWalk(root string, walkFn func(path string, info fs.FileInfo) error) error](#bestEffortWalk)
    * [func buildCustomFetchMappings(c []*schema.CustomGitFetchMapping) map[string][]string](#buildCustomFetchMappings)
    * [func checkMaybeCorruptRepo(repo api.RepoName, dir GitDir, stderr string)](#checkMaybeCorruptRepo)
    * [func checkSpecArgSafety(spec string) error](#checkSpecArgSafety)
    * [func cleanUpTmpRepo(path string)](#cleanUpTmpRepo)
    * [func cloneStatus(cloned, cloning bool) types.CloneStatus](#cloneStatus)
    * [func computeLatestCommitTimestamp(dir GitDir) time.Time](#computeLatestCommitTimestamp)
    * [func computeRefHash(dir GitDir) ([]byte, error)](#computeRefHash)
    * [func configureRemoteGitCommand(cmd *exec.Cmd, tlsConf *tlsConfig)](#configureRemoteGitCommand)
    * [func customFetchCmd(ctx context.Context, remoteURL *vcs.URL) *exec.Cmd](#customFetchCmd)
    * [func debounce(name api.RepoName, since time.Duration) bool](#debounce)
    * [func decomposePerforceRemoteURL(remoteURL *vcs.URL) (username, password, host, depot string, err error)](#decomposePerforceRemoteURL)
    * [func dirSize(d string) int64](#dirSize)
    * [func ensureHEAD(dir GitDir)](#ensureHEAD)
    * [func ensureRefPrefix(ref string) string](#ensureRefPrefix)
    * [func errorString(err error) string](#errorString)
    * [func flowrateWriter(w io.Writer) io.Writer](#flowrateWriter)
    * [func fsync(path string) error](#fsync)
    * [func generateSocketFilename() string](#generateSocketFilename)
    * [func getGitolitePhabCallsign(ctx context.Context, gconf *schema.GitoliteConnection, repo, command string) (string, error)](#getGitolitePhabCallsign)
    * [func getRecloneTime(dir GitDir) (time.Time, error)](#getRecloneTime)
    * [func getRepositoryType(dir GitDir) (string, error)](#getRepositoryType)
    * [func gitConfigGet(dir GitDir, key string) (string, error)](#gitConfigGet)
    * [func gitConfigSet(dir GitDir, key, value string) error](#gitConfigSet)
    * [func gitConfigUnset(dir GitDir, key string) error](#gitConfigUnset)
    * [func gitDirModTime(d GitDir) (time.Time, error)](#gitDirModTime)
    * [func gitGC(dir GitDir) error](#gitGC)
    * [func hackilyGetHTTPFlusher(w http.ResponseWriter) http.Flusher](#hackilyGetHTTPFlusher)
    * [func honeySampleRate(cmd string) uint](#honeySampleRate)
    * [func init()](#init.server.go)
    * [func isAbsoluteRevision(s string) bool](#isAbsoluteRevision)
    * [func isAlwaysCloningTest(name api.RepoName) bool](#isAlwaysCloningTest)
    * [func isEmptyDir(path string) (bool, error)](#isEmptyDir)
    * [func jitterDuration(key string, d time.Duration) time.Duration](#jitterDuration)
    * [func makeFakeRepo(d string, sizeBytes int) error](#makeFakeRepo)
    * [func makeSingleCommitRepo(cmd func(string, ...string) string) string](#makeSingleCommitRepo)
    * [func mapToLog15Ctx(m map[string]interface{}) []interface{}](#mapToLog15Ctx)
    * [func mkFiles(t *testing.T, root string, paths ...string)](#mkFiles)
    * [func p4ping(ctx context.Context, host, username, password string) error](#p4ping)
    * [func p4pingWithTrust(ctx context.Context, host, username, password string) error](#p4pingWithTrust)
    * [func p4trust(ctx context.Context, host string) error](#p4trust)
    * [func quickRevParseHead(dir GitDir) (string, error)](#quickRevParseHead)
    * [func quickSymbolicRefHead(dir GitDir) (string, error)](#quickSymbolicRefHead)
    * [func readCloneProgress(redactor *urlRedactor, lock *RepositoryLock, pr io.Reader)](#readCloneProgress)
    * [func refspecOverridesFetchCmd(ctx context.Context, remoteURL *vcs.URL) *exec.Cmd](#refspecOverridesFetchCmd)
    * [func removeBadRefs(ctx context.Context, dir GitDir)](#removeBadRefs)
    * [func removeFileOlderThan(path string, maxAge time.Duration) error](#removeFileOlderThan)
    * [func renameAndSync(oldpath, newpath string) error](#renameAndSync)
    * [func runCmd(t *testing.T, dir string, cmd string, arg ...string) string](#runCmd)
    * [func runCommand(ctx context.Context, cmd *exec.Cmd) (exitCode int, err error)](#runCommand)
    * [func runWith(ctx context.Context, cmd *exec.Cmd, configRemoteOpts bool, progress io.Writer) ([]byte, error)](#runWith)
    * [func runWithRemoteOpts(ctx context.Context, cmd *exec.Cmd, progress io.Writer) ([]byte, error)](#runWithRemoteOpts)
    * [func scanCRLF(data []byte, atEOF bool) (advance int, token []byte, err error)](#scanCRLF)
    * [func setGitAttributes(dir GitDir) error](#setGitAttributes)
    * [func setHEAD(ctx context.Context, dir GitDir, syncer VCSSyncer, repo api.RepoName, remoteURL *vcs.URL) error](#setHEAD)
    * [func setLastChanged(dir GitDir) error](#setLastChanged)
    * [func setRecloneTime(dir GitDir, now time.Time) error](#setRecloneTime)
    * [func setRepositoryType(dir GitDir, typ string) error](#setRepositoryType)
    * [func shortGitCommandSlow(args []string) time.Duration](#shortGitCommandSlow)
    * [func shortGitCommandTimeout(args []string) time.Duration](#shortGitCommandTimeout)
    * [func staticGetRemoteURL(remote string) func(context.Context, api.RepoName) (string, error)](#staticGetRemoteURL)
    * [func updateFileIfDifferent(path string, content []byte) (bool, error)](#updateFileIfDifferent)
    * [func useRefspecOverrides() bool](#useRefspecOverrides)
    * [func wrapCmdError(cmd *exec.Cmd, err error) error](#wrapCmdError)
    * [func writeFile(t *testing.T, path string, content []byte)](#writeFile)
    * [func writeTempFile(pattern string, data []byte) (path string, err error)](#writeTempFile)


## <a id="const" href="#const">Constants</a>

### <a id="gitConfigMaybeCorrupt" href="#gitConfigMaybeCorrupt">const gitConfigMaybeCorrupt</a>

```
searchKey: server.gitConfigMaybeCorrupt
tags: [constant string private]
```

```Go
const gitConfigMaybeCorrupt = "sourcegraph.maybeCorruptRepo"
```

gitConfigMaybeCorrupt is a key we add to git config to signal that a repo may be corrupt on disk. 

### <a id="headFileRefPrefix" href="#headFileRefPrefix">const headFileRefPrefix</a>

```
searchKey: server.headFileRefPrefix
tags: [constant string private]
```

```Go
const headFileRefPrefix = "ref: "
```

### <a id="repoTTL" href="#repoTTL">const repoTTL</a>

```
searchKey: server.repoTTL
tags: [constant number private]
```

```Go
const repoTTL = time.Hour * 24 * 45
```

repoTTL is how often we should re-clone a repository. 

### <a id="repoTTLGC" href="#repoTTLGC">const repoTTLGC</a>

```
searchKey: server.repoTTLGC
tags: [constant number private]
```

```Go
const repoTTLGC = time.Hour * 24 * 2
```

repoTTLGC is how often we should re-clone a repository once it is reporting git gc issues. 

### <a id="reposStatsName" href="#reposStatsName">const reposStatsName</a>

```
searchKey: server.reposStatsName
tags: [constant string private]
```

```Go
const reposStatsName = "repos-stats.json"
```

### <a id="tempDirName" href="#tempDirName">const tempDirName</a>

```
searchKey: server.tempDirName
tags: [constant string private]
```

```Go
const tempDirName = ".tmp"
```

tempDirName is the name used for the temporary directory under ReposDir. 

### <a id="testRepoA" href="#testRepoA">const testRepoA</a>

```
searchKey: server.testRepoA
tags: [constant string private]
```

```Go
const testRepoA = "testrepo-A"
```

### <a id="testRepoC" href="#testRepoC">const testRepoC</a>

```
searchKey: server.testRepoC
tags: [constant string private]
```

```Go
const testRepoC = "testrepo-C"
```

## <a id="var" href="#var">Variables</a>

### <a id="badRefs" href="#badRefs">var badRefs</a>

```
searchKey: server.badRefs
tags: [variable array string private]
```

```Go
var badRefs []string
```

### <a id="badRefsOnce" href="#badRefsOnce">var badRefsOnce</a>

```
searchKey: server.badRefsOnce
tags: [variable struct private]
```

```Go
var badRefsOnce sync.Once
```

### <a id="callSignPattern" href="#callSignPattern">var callSignPattern</a>

```
searchKey: server.callSignPattern
tags: [variable struct private]
```

```Go
var callSignPattern = lazyregexp.New("^[A-Z]+$")
```

### <a id="cloneQueue" href="#cloneQueue">var cloneQueue</a>

```
searchKey: server.cloneQueue
tags: [variable interface private]
```

```Go
var cloneQueue = ...
```

### <a id="customGitFetch" href="#customGitFetch">var customGitFetch</a>

```
searchKey: server.customGitFetch
tags: [variable function private]
```

```Go
var customGitFetch = ...
```

### <a id="defaultGitolite" href="#defaultGitolite">var defaultGitolite</a>

```
searchKey: server.defaultGitolite
tags: [variable struct private]
```

```Go
var defaultGitolite = gitoliteFetcher{client: gitoliteClient{}}
```

### <a id="doBackgroundRepoUpdateMock" href="#doBackgroundRepoUpdateMock">var doBackgroundRepoUpdateMock</a>

```
searchKey: server.doBackgroundRepoUpdateMock
tags: [variable function private]
```

```Go
var doBackgroundRepoUpdateMock func(api.RepoName) error
```

### <a id="enableGCAuto" href="#enableGCAuto">var enableGCAuto</a>

```
searchKey: server.enableGCAuto
tags: [variable boolean private]
```

```Go
var enableGCAuto, _ = ...
```

EnableGCAuto is a temporary flag that allows us to control whether or not `git gc --auto` is invoked during janitorial activities. This flag will likely evolve into some form of site config value in the future. 

### <a id="execDuration" href="#execDuration">var execDuration</a>

```
searchKey: server.execDuration
tags: [variable struct private]
```

```Go
var execDuration = ...
```

### <a id="execRunning" href="#execRunning">var execRunning</a>

```
searchKey: server.execRunning
tags: [variable struct private]
```

```Go
var execRunning = ...
```

### <a id="headBranchPattern" href="#headBranchPattern">var headBranchPattern</a>

```
searchKey: server.headBranchPattern
tags: [variable struct private]
```

```Go
var headBranchPattern = lazyregexp.New(`HEAD branch: (.+?)\n`)
```

### <a id="janitorRunning" href="#janitorRunning">var janitorRunning</a>

```
searchKey: server.janitorRunning
tags: [variable interface private]
```

```Go
var janitorRunning = ...
```

### <a id="jobTimer" href="#jobTimer">var jobTimer</a>

```
searchKey: server.jobTimer
tags: [variable struct private]
```

```Go
var jobTimer = ...
```

### <a id="lastCheckAt" href="#lastCheckAt">var lastCheckAt</a>

```
searchKey: server.lastCheckAt
tags: [variable object private]
```

```Go
var lastCheckAt = make(map[api.RepoName]time.Time)
```

### <a id="lastCheckMutex" href="#lastCheckMutex">var lastCheckMutex</a>

```
searchKey: server.lastCheckMutex
tags: [variable struct private]
```

```Go
var lastCheckMutex sync.Mutex
```

### <a id="logUnflushableResponseWriterOnce" href="#logUnflushableResponseWriterOnce">var logUnflushableResponseWriterOnce</a>

```
searchKey: server.logUnflushableResponseWriterOnce
tags: [variable struct private]
```

```Go
var logUnflushableResponseWriterOnce sync.Once
```

### <a id="longGitCommandTimeout" href="#longGitCommandTimeout">var longGitCommandTimeout</a>

```
searchKey: server.longGitCommandTimeout
tags: [variable number private]
```

```Go
var longGitCommandTimeout = time.Hour
```

This is a timeout for long git commands like clone or remote update. that may take a while for large repos. These types of commands should be run in the background. 

### <a id="lsRemoteQueue" href="#lsRemoteQueue">var lsRemoteQueue</a>

```
searchKey: server.lsRemoteQueue
tags: [variable interface private]
```

```Go
var lsRemoteQueue = ...
```

### <a id="maybeCorruptStderrRe" href="#maybeCorruptStderrRe">var maybeCorruptStderrRe</a>

```
searchKey: server.maybeCorruptStderrRe
tags: [variable struct private]
```

```Go
var maybeCorruptStderrRe = lazyregexp.NewPOSIX(`^error: (Could not read|packfile) `)
```

maybeCorruptStderrRe matches stderr lines from git which indicate there might be repository corruption. 

See [https://github.com/sourcegraph/sourcegraph/issues/6676](https://github.com/sourcegraph/sourcegraph/issues/6676) for more context. 

### <a id="metricServiceDuration" href="#metricServiceDuration">var metricServiceDuration</a>

```
searchKey: server.metricServiceDuration
tags: [variable struct private]
```

```Go
var metricServiceDuration = ...
```

### <a id="metricServiceRunning" href="#metricServiceRunning">var metricServiceRunning</a>

```
searchKey: server.metricServiceRunning
tags: [variable struct private]
```

```Go
var metricServiceRunning = ...
```

### <a id="patchID" href="#patchID">var patchID</a>

```
searchKey: server.patchID
tags: [variable number private]
```

```Go
var patchID uint64
```

### <a id="refspecOverrides" href="#refspecOverrides">var refspecOverrides</a>

```
searchKey: server.refspecOverrides
tags: [variable array string private]
```

```Go
var refspecOverrides = ...
```

HACK(keegancsmith) workaround to experiment with cloning less in a large monorepo. [https://github.com/sourcegraph/customer/issues/19](https://github.com/sourcegraph/customer/issues/19) 

### <a id="repoCloned" href="#repoCloned">var repoCloned</a>

```
searchKey: server.repoCloned
tags: [variable function private]
```

```Go
var repoCloned = ...
```

repoCloned checks if dir or `${dir}/.git` is a valid GIT_DIR. 

### <a id="repoClonedCounter" href="#repoClonedCounter">var repoClonedCounter</a>

```
searchKey: server.repoClonedCounter
tags: [variable interface private]
```

```Go
var repoClonedCounter = ...
```

### <a id="repoLastChanged" href="#repoLastChanged">var repoLastChanged</a>

```
searchKey: server.repoLastChanged
tags: [variable function private]
```

```Go
var repoLastChanged = ...
```

repoLastChanged returns the mtime of the repo's sg_refhash, which is the cached timestamp of the most recent commit we could find in the tree. As a special case when sg_refhash is missing we return repoLastFetched(dir). 

This breaks on file systems that do not record mtime. This is a Sourcegraph extension to track last time a repo changed. The file is updated by setLastChanged via doBackgroundRepoUpdate. 

As a special case, tries both the directory given, and the .git subdirectory, because we're a bit inconsistent about which name to use. 

### <a id="repoLastFetched" href="#repoLastFetched">var repoLastFetched</a>

```
searchKey: server.repoLastFetched
tags: [variable function private]
```

```Go
var repoLastFetched = ...
```

repoLastFetched returns the mtime of the repo's FETCH_HEAD, which is the date of the last successful `git remote update` or `git fetch` (even if nothing new was fetched). As a special case when the repo has been cloned but none of those other two operations have been run (and so FETCH_HEAD does not exist), it will return the mtime of HEAD. 

This breaks on file systems that do not record mtime and if Git ever changes this undocumented behavior. 

### <a id="repoRemoteRefs" href="#repoRemoteRefs">var repoRemoteRefs</a>

```
searchKey: server.repoRemoteRefs
tags: [variable function private]
```

```Go
var repoRemoteRefs = ...
```

repoRemoteRefs returns a map containing ref + commit pairs from the remote Git repository starting with the specified prefix. 

The ref prefix `ref/<ref type>/` is stripped away from the returned refs. 

### <a id="repoStateUpsertCounter" href="#repoStateUpsertCounter">var repoStateUpsertCounter</a>

```
searchKey: server.repoStateUpsertCounter
tags: [variable struct private]
```

```Go
var repoStateUpsertCounter = ...
```

### <a id="repoSyncStateCounter" href="#repoSyncStateCounter">var repoSyncStateCounter</a>

```
searchKey: server.repoSyncStateCounter
tags: [variable struct private]
```

```Go
var repoSyncStateCounter = ...
```

### <a id="repoSyncStatePercentComplete" href="#repoSyncStatePercentComplete">var repoSyncStatePercentComplete</a>

```
searchKey: server.repoSyncStatePercentComplete
tags: [variable interface private]
```

```Go
var repoSyncStatePercentComplete = ...
```

### <a id="reposRecloned" href="#reposRecloned">var reposRecloned</a>

```
searchKey: server.reposRecloned
tags: [variable interface private]
```

```Go
var reposRecloned = ...
```

### <a id="reposRemoved" href="#reposRemoved">var reposRemoved</a>

```
searchKey: server.reposRemoved
tags: [variable interface private]
```

```Go
var reposRemoved = ...
```

### <a id="reposRemovedDiskPressure" href="#reposRemovedDiskPressure">var reposRemovedDiskPressure</a>

```
searchKey: server.reposRemovedDiskPressure
tags: [variable interface private]
```

```Go
var reposRemovedDiskPressure = ...
```

### <a id="runCommandMock" href="#runCommandMock">var runCommandMock</a>

```
searchKey: server.runCommandMock
tags: [variable function private]
```

```Go
var runCommandMock func(context.Context, *exec.Cmd) (int, error)
```

runCommandMock is set by tests. When non-nil it is run instead of runCommand 

### <a id="sshAgentSockID" href="#sshAgentSockID">var sshAgentSockID</a>

```
searchKey: server.sshAgentSockID
tags: [variable number private]
```

```Go
var sshAgentSockID int64 = 0
```

### <a id="testGitRepoExists" href="#testGitRepoExists">var testGitRepoExists</a>

```
searchKey: server.testGitRepoExists
tags: [variable function private]
```

```Go
var testGitRepoExists func(ctx context.Context, remoteURL *vcs.URL) error
```

testGitRepoExists is a test fixture that overrides the return value for GitRepoSyncer.IsCloneable when it is set. 

### <a id="testRepoCorrupter" href="#testRepoCorrupter">var testRepoCorrupter</a>

```
searchKey: server.testRepoCorrupter
tags: [variable function private]
```

```Go
var testRepoCorrupter func(ctx context.Context, tmpDir GitDir)
```

testRepoCorrupter is used by tests to disrupt a cloned repository (e.g. deleting HEAD, zeroing it out, etc.) 

### <a id="tlsExternal" href="#tlsExternal">var tlsExternal</a>

```
searchKey: server.tlsExternal
tags: [variable function private]
```

```Go
var tlsExternal = ...
```

### <a id="traceLogs" href="#traceLogs">var traceLogs</a>

```
searchKey: server.traceLogs
tags: [variable boolean private]
```

```Go
var traceLogs bool
```

traceLogs is controlled via the env SRC_GITSERVER_TRACE. If true we trace logs to stderr 

## <a id="type" href="#type">Types</a>

### <a id="DiskSizer" href="#DiskSizer">type DiskSizer interface</a>

```
searchKey: server.DiskSizer
tags: [interface]
```

```Go
type DiskSizer interface {
	BytesFreeOnDisk(mountPoint string) (uint64, error)
	DiskSizeBytes(mountPoint string) (uint64, error)
}
```

DiskSizer gets information about disk size and free space. 

### <a id="GitDir" href="#GitDir">type GitDir string</a>

```
searchKey: server.GitDir
tags: [string]
```

```Go
type GitDir string
```

GitDir is an absolute path to a GIT_DIR. They will all follow the form: 

```
${s.ReposDir}/${name}/.git

```
#### <a id="GitDir.Path" href="#GitDir.Path">func (dir GitDir) Path(elem ...string) string</a>

```
searchKey: server.GitDir.Path
tags: [method]
```

```Go
func (dir GitDir) Path(elem ...string) string
```

Path is a helper which returns filepath.Join(dir, elem...) 

#### <a id="GitDir.Set" href="#GitDir.Set">func (dir GitDir) Set(cmd *exec.Cmd)</a>

```
searchKey: server.GitDir.Set
tags: [method]
```

```Go
func (dir GitDir) Set(cmd *exec.Cmd)
```

Set updates cmd so that it will run in dir. 

Note: GitDir is always a valid GIT_DIR, so we additionally set the environment variable GIT_DIR. This is to avoid git doing discovery in case of a bad repo, leading to hard to diagnose error messages. 

### <a id="GitRepoSyncer" href="#GitRepoSyncer">type GitRepoSyncer struct{}</a>

```
searchKey: server.GitRepoSyncer
tags: [struct]
```

```Go
type GitRepoSyncer struct{}
```

GitRepoSyncer is a syncer for Git repositories. 

#### <a id="GitRepoSyncer.CloneCommand" href="#GitRepoSyncer.CloneCommand">func (s *GitRepoSyncer) CloneCommand(ctx context.Context, remoteURL *vcs.URL, tmpPath string) (cmd *exec.Cmd, err error)</a>

```
searchKey: server.GitRepoSyncer.CloneCommand
tags: [method]
```

```Go
func (s *GitRepoSyncer) CloneCommand(ctx context.Context, remoteURL *vcs.URL, tmpPath string) (cmd *exec.Cmd, err error)
```

CloneCommand returns the command to be executed for cloning a Git repository. 

#### <a id="GitRepoSyncer.Fetch" href="#GitRepoSyncer.Fetch">func (s *GitRepoSyncer) Fetch(ctx context.Context, remoteURL *vcs.URL, dir GitDir) error</a>

```
searchKey: server.GitRepoSyncer.Fetch
tags: [method]
```

```Go
func (s *GitRepoSyncer) Fetch(ctx context.Context, remoteURL *vcs.URL, dir GitDir) error
```

Fetch tries to fetch updates of a Git repository. 

#### <a id="GitRepoSyncer.IsCloneable" href="#GitRepoSyncer.IsCloneable">func (s *GitRepoSyncer) IsCloneable(ctx context.Context, remoteURL *vcs.URL) error</a>

```
searchKey: server.GitRepoSyncer.IsCloneable
tags: [method]
```

```Go
func (s *GitRepoSyncer) IsCloneable(ctx context.Context, remoteURL *vcs.URL) error
```

IsCloneable checks to see if the Git remote URL is cloneable. 

#### <a id="GitRepoSyncer.RemoteShowCommand" href="#GitRepoSyncer.RemoteShowCommand">func (s *GitRepoSyncer) RemoteShowCommand(ctx context.Context, remoteURL *vcs.URL) (cmd *exec.Cmd, err error)</a>

```
searchKey: server.GitRepoSyncer.RemoteShowCommand
tags: [method]
```

```Go
func (s *GitRepoSyncer) RemoteShowCommand(ctx context.Context, remoteURL *vcs.URL) (cmd *exec.Cmd, err error)
```

RemoteShowCommand returns the command to be executed for showing remote of a Git repository. 

#### <a id="GitRepoSyncer.Type" href="#GitRepoSyncer.Type">func (s *GitRepoSyncer) Type() string</a>

```
searchKey: server.GitRepoSyncer.Type
tags: [method]
```

```Go
func (s *GitRepoSyncer) Type() string
```

#### <a id="GitRepoSyncer.fetchCommand" href="#GitRepoSyncer.fetchCommand">func (s *GitRepoSyncer) fetchCommand(ctx context.Context, remoteURL *vcs.URL) (cmd *exec.Cmd, configRemoteOpts bool)</a>

```
searchKey: server.GitRepoSyncer.fetchCommand
tags: [method private]
```

```Go
func (s *GitRepoSyncer) fetchCommand(ctx context.Context, remoteURL *vcs.URL) (cmd *exec.Cmd, configRemoteOpts bool)
```

### <a id="PerforceDepotSyncer" href="#PerforceDepotSyncer">type PerforceDepotSyncer struct</a>

```
searchKey: server.PerforceDepotSyncer
tags: [struct]
```

```Go
type PerforceDepotSyncer struct {
	// MaxChanges indicates to only import at most n changes when possible.
	MaxChanges int
}
```

PerforceDepotSyncer is a syncer for Perforce depots. 

#### <a id="PerforceDepotSyncer.CloneCommand" href="#PerforceDepotSyncer.CloneCommand">func (s *PerforceDepotSyncer) CloneCommand(ctx context.Context, remoteURL *vcs.URL, tmpPath string) (*exec.Cmd, error)</a>

```
searchKey: server.PerforceDepotSyncer.CloneCommand
tags: [method]
```

```Go
func (s *PerforceDepotSyncer) CloneCommand(ctx context.Context, remoteURL *vcs.URL, tmpPath string) (*exec.Cmd, error)
```

CloneCommand returns the command to be executed for cloning a Perforce depot as a Git repository. 

#### <a id="PerforceDepotSyncer.Fetch" href="#PerforceDepotSyncer.Fetch">func (s *PerforceDepotSyncer) Fetch(ctx context.Context, remoteURL *vcs.URL, dir GitDir) error</a>

```
searchKey: server.PerforceDepotSyncer.Fetch
tags: [method]
```

```Go
func (s *PerforceDepotSyncer) Fetch(ctx context.Context, remoteURL *vcs.URL, dir GitDir) error
```

Fetch tries to fetch updates of a Perforce depot as a Git repository. 

#### <a id="PerforceDepotSyncer.IsCloneable" href="#PerforceDepotSyncer.IsCloneable">func (s *PerforceDepotSyncer) IsCloneable(ctx context.Context, remoteURL *vcs.URL) error</a>

```
searchKey: server.PerforceDepotSyncer.IsCloneable
tags: [method]
```

```Go
func (s *PerforceDepotSyncer) IsCloneable(ctx context.Context, remoteURL *vcs.URL) error
```

IsCloneable checks to see if the Perforce remote URL is cloneable. 

#### <a id="PerforceDepotSyncer.RemoteShowCommand" href="#PerforceDepotSyncer.RemoteShowCommand">func (s *PerforceDepotSyncer) RemoteShowCommand(ctx context.Context, remoteURL *vcs.URL) (cmd *exec.Cmd, err error)</a>

```
searchKey: server.PerforceDepotSyncer.RemoteShowCommand
tags: [method]
```

```Go
func (s *PerforceDepotSyncer) RemoteShowCommand(ctx context.Context, remoteURL *vcs.URL) (cmd *exec.Cmd, err error)
```

RemoteShowCommand returns the command to be executed for showing Git remote of a Perforce depot. 

#### <a id="PerforceDepotSyncer.Type" href="#PerforceDepotSyncer.Type">func (s *PerforceDepotSyncer) Type() string</a>

```
searchKey: server.PerforceDepotSyncer.Type
tags: [method]
```

```Go
func (s *PerforceDepotSyncer) Type() string
```

### <a id="RepositoryLock" href="#RepositoryLock">type RepositoryLock struct</a>

```
searchKey: server.RepositoryLock
tags: [struct]
```

```Go
type RepositoryLock struct {
	locker *RepositoryLocker
	dir    GitDir

	// done is protected by locker.mu
	done bool
}
```

RepositoryLock is returned by RepositoryLocker.TryAcquire. It allows updating the status of a directory lock, as well as releasing the lock. 

#### <a id="RepositoryLock.Release" href="#RepositoryLock.Release">func (l *RepositoryLock) Release()</a>

```
searchKey: server.RepositoryLock.Release
tags: [method]
```

```Go
func (l *RepositoryLock) Release()
```

Release releases the lock. 

#### <a id="RepositoryLock.SetStatus" href="#RepositoryLock.SetStatus">func (l *RepositoryLock) SetStatus(status string)</a>

```
searchKey: server.RepositoryLock.SetStatus
tags: [method]
```

```Go
func (l *RepositoryLock) SetStatus(status string)
```

SetStatus updates the status for the lock. If the lock has been released, this is a noop. 

### <a id="RepositoryLocker" href="#RepositoryLocker">type RepositoryLocker struct</a>

```
searchKey: server.RepositoryLocker
tags: [struct]
```

```Go
type RepositoryLocker struct {
	// mu protects status
	mu sync.RWMutex
	// status tracks directories that are locked. The value is the status. If
	// a directory is in status, the directory is locked.
	status map[GitDir]string
}
```

RepositoryLocker provides locks for doing operations to a repository directory. When a repository is locked, only the owner of the lock is allowed to run commands against it. 

Repositories are identified by the absolute path to their $GIT_DIR. 

The directory's $GIT_DIR does not have to exist when locked. The owner of the lock may remove the directory's $GIT_DIR while holding the lock. 

The main use of RepositoryLocker is to prevent concurrent clones. However, it is also used during maintenance tasks such as recloning/migrating/etc. 

#### <a id="RepositoryLocker.Status" href="#RepositoryLocker.Status">func (rl *RepositoryLocker) Status(dir GitDir) (status string, locked bool)</a>

```
searchKey: server.RepositoryLocker.Status
tags: [method]
```

```Go
func (rl *RepositoryLocker) Status(dir GitDir) (status string, locked bool)
```

Status returns the status of the locked directory dir. If dir is not locked, then locked is false. 

#### <a id="RepositoryLocker.TryAcquire" href="#RepositoryLocker.TryAcquire">func (rl *RepositoryLocker) TryAcquire(dir GitDir, initialStatus string) (lock *RepositoryLock, ok bool)</a>

```
searchKey: server.RepositoryLocker.TryAcquire
tags: [method]
```

```Go
func (rl *RepositoryLocker) TryAcquire(dir GitDir, initialStatus string) (lock *RepositoryLock, ok bool)
```

TryAcquire acquires the lock for dir. If it is already held, ok is false and lock is nil. Otherwise a non-nil lock is returned and true. When finished with the lock you must call lock.Release. 

### <a id="Server" href="#Server">type Server struct</a>

```
searchKey: server.Server
tags: [struct]
```

```Go
type Server struct {
	// ReposDir is the path to the base directory for gitserver storage.
	ReposDir string

	// DesiredPercentFree is the desired percentage of disk space to keep free.
	DesiredPercentFree int

	// DiskSizer tells how much disk is free and how large the disk is.
	DiskSizer DiskSizer

	// GetRemoteURLFunc is a function which returns the remote URL for a
	// repository. This is used when cloning or fetching a repository. In
	// production this will speak to the database to look up the clone URL. In
	// tests this is usually set to clone a local repository or intentionally
	// error.
	//
	// Note: internal uses should call getRemoteURL which will handle
	// GetRemoteURLFunc being nil.
	GetRemoteURLFunc func(context.Context, api.RepoName) (string, error)

	// GetVCSSyncer is a function which returns the VCS syncer for a repository.
	// This is used when cloning or fetching a repository. In production this will
	// speak to the database to determine the code host type. In tests this is
	// usually set to return a GitRepoSyncer.
	GetVCSSyncer func(context.Context, api.RepoName) (VCSSyncer, error)

	// Hostname is how we identify this instance of gitserver. Generally it is the
	// actual hostname but can also be overridden by the HOSTNAME environment variable.
	Hostname string

	// shared db handle
	DB dbutil.DB

	// skipCloneForTests is set by tests to avoid clones.
	skipCloneForTests bool

	// ctx is the context we use for all background jobs. It is done when the
	// server is stopped. Do not directly call this, rather call
	// Server.context()
	ctx      context.Context
	cancel   context.CancelFunc // used to shutdown background jobs
	cancelMu sync.Mutex         // protects canceled
	canceled bool
	wg       sync.WaitGroup // tracks running background jobs

	locker *RepositoryLocker

	// cloneLimiter and cloneableLimiter limits the number of concurrent
	// clones and ls-remotes respectively. Use s.acquireCloneLimiter() and
	// s.acquireClonableLimiter() instead of using these directly.
	cloneLimiter     *mutablelimiter.Limiter
	cloneableLimiter *mutablelimiter.Limiter

	// rpsLimiter limits the remote code host git operations done per second
	// per gitserver instance
	rpsLimiter *rate.Limiter

	repoUpdateLocksMu sync.Mutex // protects the map below and also updates to locks.once
	repoUpdateLocks   map[api.RepoName]*locks
}
```

Server is a gitserver server. 

#### <a id="makeTestServer" href="#makeTestServer">func makeTestServer(ctx context.Context, repoDir, remote string, db dbutil.DB) *Server</a>

```
searchKey: server.makeTestServer
tags: [function private]
```

```Go
func makeTestServer(ctx context.Context, repoDir, remote string, db dbutil.DB) *Server
```

#### <a id="Server.Handler" href="#Server.Handler">func (s *Server) Handler() http.Handler</a>

```
searchKey: server.Server.Handler
tags: [method]
```

```Go
func (s *Server) Handler() http.Handler
```

Handler returns the http.Handler that should be used to serve requests. 

#### <a id="Server.Janitor" href="#Server.Janitor">func (s *Server) Janitor(interval time.Duration)</a>

```
searchKey: server.Server.Janitor
tags: [method]
```

```Go
func (s *Server) Janitor(interval time.Duration)
```

Janitor does clean up tasks over s.ReposDir and is expected to run in a background goroutine. 

#### <a id="Server.RegisterMetrics" href="#Server.RegisterMetrics">func (s *Server) RegisterMetrics()</a>

```
searchKey: server.Server.RegisterMetrics
tags: [method]
```

```Go
func (s *Server) RegisterMetrics()
```

#### <a id="Server.SetupAndClearTmp" href="#Server.SetupAndClearTmp">func (s *Server) SetupAndClearTmp() (string, error)</a>

```
searchKey: server.Server.SetupAndClearTmp
tags: [method]
```

```Go
func (s *Server) SetupAndClearTmp() (string, error)
```

SetupAndClearTmp sets up the the tempdir for ReposDir as well as clearing it out. It returns the temporary directory location. 

#### <a id="Server.Stop" href="#Server.Stop">func (s *Server) Stop()</a>

```
searchKey: server.Server.Stop
tags: [method]
```

```Go
func (s *Server) Stop()
```

Stop cancels the running background jobs and returns when done. 

#### <a id="Server.SyncRepoState" href="#Server.SyncRepoState">func (s *Server) SyncRepoState(interval time.Duration, batchSize, perSecond int)</a>

```
searchKey: server.Server.SyncRepoState
tags: [method]
```

```Go
func (s *Server) SyncRepoState(interval time.Duration, batchSize, perSecond int)
```

SyncRepoState syncs state on disk to the database for all repos and is expected to run in a background goroutine. 

#### <a id="Server.acquireCloneLimiter" href="#Server.acquireCloneLimiter">func (s *Server) acquireCloneLimiter(ctx context.Context) (context.Context, context.CancelFunc, error)</a>

```
searchKey: server.Server.acquireCloneLimiter
tags: [method private]
```

```Go
func (s *Server) acquireCloneLimiter(ctx context.Context) (context.Context, context.CancelFunc, error)
```

acquireCloneLimiter() acquires a cancellable context associated with the clone limiter. 

#### <a id="Server.acquireCloneableLimiter" href="#Server.acquireCloneableLimiter">func (s *Server) acquireCloneableLimiter(ctx context.Context) (context.Context, context.CancelFunc, error)</a>

```
searchKey: server.Server.acquireCloneableLimiter
tags: [method private]
```

```Go
func (s *Server) acquireCloneableLimiter(ctx context.Context) (context.Context, context.CancelFunc, error)
```

#### <a id="Server.cleanTmpFiles" href="#Server.cleanTmpFiles">func (s *Server) cleanTmpFiles(dir GitDir)</a>

```
searchKey: server.Server.cleanTmpFiles
tags: [method private]
```

```Go
func (s *Server) cleanTmpFiles(dir GitDir)
```

cleanTmpFiles tries to remove tmp_pack_* files from .git/objects/pack. These files can be created by an interrupted fetch operation, and would be purged by `git gc --prune=now`, but `git gc` is very slow. Removing these files while they're in use will cause an operation to fail, but not damage the repository. 

#### <a id="Server.cleanupRepos" href="#Server.cleanupRepos">func (s *Server) cleanupRepos()</a>

```
searchKey: server.Server.cleanupRepos
tags: [method private]
```

```Go
func (s *Server) cleanupRepos()
```

cleanupRepos walks the repos directory and performs maintenance tasks: 

1. Compute the amount of space used by the repo 2. Remove corrupt repos. 3. Remove stale lock files. 4. Ensure correct git attributes 5. Scrub remote URLs 6. Perform garbage collection 7. Re-clone repos after a while. (simulate git gc) 8. Remove repos based on disk pressure. 

#### <a id="Server.cloneRepo" href="#Server.cloneRepo">func (s *Server) cloneRepo(ctx context.Context, repo api.RepoName, opts *cloneOptions) (string, error)</a>

```
searchKey: server.Server.cloneRepo
tags: [method private]
```

```Go
func (s *Server) cloneRepo(ctx context.Context, repo api.RepoName, opts *cloneOptions) (string, error)
```

cloneRepo performs a clone operation for the given repository. It is non-blocking by default. 

#### <a id="Server.createCommitFromPatch" href="#Server.createCommitFromPatch">func (s *Server) createCommitFromPatch(ctx context.Context, req protocol.CreateCommitFromPatchRequest) (int, protocol.CreateCommitFromPatchResponse)</a>

```
searchKey: server.Server.createCommitFromPatch
tags: [method private]
```

```Go
func (s *Server) createCommitFromPatch(ctx context.Context, req protocol.CreateCommitFromPatchRequest) (int, protocol.CreateCommitFromPatchResponse)
```

#### <a id="Server.deleteRepo" href="#Server.deleteRepo">func (s *Server) deleteRepo(repo api.RepoName) error</a>

```
searchKey: server.Server.deleteRepo
tags: [method private]
```

```Go
func (s *Server) deleteRepo(repo api.RepoName) error
```

#### <a id="Server.dir" href="#Server.dir">func (s *Server) dir(name api.RepoName) GitDir</a>

```
searchKey: server.Server.dir
tags: [method private]
```

```Go
func (s *Server) dir(name api.RepoName) GitDir
```

#### <a id="Server.doBackgroundRepoUpdate" href="#Server.doBackgroundRepoUpdate">func (s *Server) doBackgroundRepoUpdate(repo api.RepoName) error</a>

```
searchKey: server.Server.doBackgroundRepoUpdate
tags: [method private]
```

```Go
func (s *Server) doBackgroundRepoUpdate(repo api.RepoName) error
```

#### <a id="Server.doRepoUpdate" href="#Server.doRepoUpdate">func (s *Server) doRepoUpdate(ctx context.Context, repo api.RepoName) error</a>

```
searchKey: server.Server.doRepoUpdate
tags: [method private]
```

```Go
func (s *Server) doRepoUpdate(ctx context.Context, repo api.RepoName) error
```

#### <a id="Server.ensureRevision" href="#Server.ensureRevision">func (s *Server) ensureRevision(ctx context.Context, repo api.RepoName, rev string, repoDir GitDir) (didUpdate bool)</a>

```
searchKey: server.Server.ensureRevision
tags: [method private]
```

```Go
func (s *Server) ensureRevision(ctx context.Context, repo api.RepoName, rev string, repoDir GitDir) (didUpdate bool)
```

#### <a id="Server.exec" href="#Server.exec">func (s *Server) exec(w http.ResponseWriter, r *http.Request, req *protocol.ExecRequest)</a>

```
searchKey: server.Server.exec
tags: [method private]
```

```Go
func (s *Server) exec(w http.ResponseWriter, r *http.Request, req *protocol.ExecRequest)
```

#### <a id="Server.findGitDirs" href="#Server.findGitDirs">func (s *Server) findGitDirs() ([]GitDir, error)</a>

```
searchKey: server.Server.findGitDirs
tags: [method private]
```

```Go
func (s *Server) findGitDirs() ([]GitDir, error)
```

#### <a id="Server.freeUpSpace" href="#Server.freeUpSpace">func (s *Server) freeUpSpace(howManyBytesToFree int64) error</a>

```
searchKey: server.Server.freeUpSpace
tags: [method private]
```

```Go
func (s *Server) freeUpSpace(howManyBytesToFree int64) error
```

freeUpSpace removes git directories under ReposDir, in order from least recently to most recently used, until it has freed howManyBytesToFree. 

#### <a id="Server.getRemoteURL" href="#Server.getRemoteURL">func (s *Server) getRemoteURL(ctx context.Context, name api.RepoName) (*vcs.URL, error)</a>

```
searchKey: server.Server.getRemoteURL
tags: [method private]
```

```Go
func (s *Server) getRemoteURL(ctx context.Context, name api.RepoName) (*vcs.URL, error)
```

#### <a id="Server.gitServiceHandler" href="#Server.gitServiceHandler">func (s *Server) gitServiceHandler() *gitservice.Handler</a>

```
searchKey: server.Server.gitServiceHandler
tags: [method private]
```

```Go
func (s *Server) gitServiceHandler() *gitservice.Handler
```

#### <a id="Server.handleArchive" href="#Server.handleArchive">func (s *Server) handleArchive(w http.ResponseWriter, r *http.Request)</a>

```
searchKey: server.Server.handleArchive
tags: [method private]
```

```Go
func (s *Server) handleArchive(w http.ResponseWriter, r *http.Request)
```

#### <a id="Server.handleCreateCommitFromPatch" href="#Server.handleCreateCommitFromPatch">func (s *Server) handleCreateCommitFromPatch(w http.ResponseWriter, r *http.Request)</a>

```
searchKey: server.Server.handleCreateCommitFromPatch
tags: [method private]
```

```Go
func (s *Server) handleCreateCommitFromPatch(w http.ResponseWriter, r *http.Request)
```

#### <a id="Server.handleExec" href="#Server.handleExec">func (s *Server) handleExec(w http.ResponseWriter, r *http.Request)</a>

```
searchKey: server.Server.handleExec
tags: [method private]
```

```Go
func (s *Server) handleExec(w http.ResponseWriter, r *http.Request)
```

#### <a id="Server.handleGetGitolitePhabricatorMetadata" href="#Server.handleGetGitolitePhabricatorMetadata">func (s *Server) handleGetGitolitePhabricatorMetadata(w http.ResponseWriter, r *http.Request)</a>

```
searchKey: server.Server.handleGetGitolitePhabricatorMetadata
tags: [method private]
```

```Go
func (s *Server) handleGetGitolitePhabricatorMetadata(w http.ResponseWriter, r *http.Request)
```

handleGetGitolitePhabricatorMetadata serves the Gitolite Phabricator metadata endpoint, which returns the Phabricator metadata for a given repository by running a user-provided command. 

#### <a id="Server.handleIsRepoCloneable" href="#Server.handleIsRepoCloneable">func (s *Server) handleIsRepoCloneable(w http.ResponseWriter, r *http.Request)</a>

```
searchKey: server.Server.handleIsRepoCloneable
tags: [method private]
```

```Go
func (s *Server) handleIsRepoCloneable(w http.ResponseWriter, r *http.Request)
```

#### <a id="Server.handleIsRepoCloned" href="#Server.handleIsRepoCloned">func (s *Server) handleIsRepoCloned(w http.ResponseWriter, r *http.Request)</a>

```
searchKey: server.Server.handleIsRepoCloned
tags: [method private]
```

```Go
func (s *Server) handleIsRepoCloned(w http.ResponseWriter, r *http.Request)
```

#### <a id="Server.handleList" href="#Server.handleList">func (s *Server) handleList(w http.ResponseWriter, r *http.Request)</a>

```
searchKey: server.Server.handleList
tags: [method private]
```

```Go
func (s *Server) handleList(w http.ResponseWriter, r *http.Request)
```

#### <a id="Server.handleListGitolite" href="#Server.handleListGitolite">func (s *Server) handleListGitolite(w http.ResponseWriter, r *http.Request)</a>

```
searchKey: server.Server.handleListGitolite
tags: [method private]
```

```Go
func (s *Server) handleListGitolite(w http.ResponseWriter, r *http.Request)
```

#### <a id="Server.handleP4Exec" href="#Server.handleP4Exec">func (s *Server) handleP4Exec(w http.ResponseWriter, r *http.Request)</a>

```
searchKey: server.Server.handleP4Exec
tags: [method private]
```

```Go
func (s *Server) handleP4Exec(w http.ResponseWriter, r *http.Request)
```

#### <a id="Server.handleRepoCloneProgress" href="#Server.handleRepoCloneProgress">func (s *Server) handleRepoCloneProgress(w http.ResponseWriter, r *http.Request)</a>

```
searchKey: server.Server.handleRepoCloneProgress
tags: [method private]
```

```Go
func (s *Server) handleRepoCloneProgress(w http.ResponseWriter, r *http.Request)
```

#### <a id="Server.handleRepoDelete" href="#Server.handleRepoDelete">func (s *Server) handleRepoDelete(w http.ResponseWriter, r *http.Request)</a>

```
searchKey: server.Server.handleRepoDelete
tags: [method private]
```

```Go
func (s *Server) handleRepoDelete(w http.ResponseWriter, r *http.Request)
```

#### <a id="Server.handleRepoInfo" href="#Server.handleRepoInfo">func (s *Server) handleRepoInfo(w http.ResponseWriter, r *http.Request)</a>

```
searchKey: server.Server.handleRepoInfo
tags: [method private]
```

```Go
func (s *Server) handleRepoInfo(w http.ResponseWriter, r *http.Request)
```

#### <a id="Server.handleRepoUpdate" href="#Server.handleRepoUpdate">func (s *Server) handleRepoUpdate(w http.ResponseWriter, r *http.Request)</a>

```
searchKey: server.Server.handleRepoUpdate
tags: [method private]
```

```Go
func (s *Server) handleRepoUpdate(w http.ResponseWriter, r *http.Request)
```

handleRepoUpdate is a synchronous (waits for update to complete or time out) method so it can yield errors. Updates are not unconditional; we debounce them based on the provided interval, to avoid spam. 

#### <a id="Server.handleReposStats" href="#Server.handleReposStats">func (s *Server) handleReposStats(w http.ResponseWriter, r *http.Request)</a>

```
searchKey: server.Server.handleReposStats
tags: [method private]
```

```Go
func (s *Server) handleReposStats(w http.ResponseWriter, r *http.Request)
```

#### <a id="Server.hostnameMatch" href="#Server.hostnameMatch">func (s *Server) hostnameMatch(addr string) bool</a>

```
searchKey: server.Server.hostnameMatch
tags: [method private]
```

```Go
func (s *Server) hostnameMatch(addr string) bool
```

hostnameMatch checks whether the hostname matches the given address. If we don't find an exact match, we look at the initial prefix. 

#### <a id="Server.howManyBytesToFree" href="#Server.howManyBytesToFree">func (s *Server) howManyBytesToFree() (int64, error)</a>

```
searchKey: server.Server.howManyBytesToFree
tags: [method private]
```

```Go
func (s *Server) howManyBytesToFree() (int64, error)
```

howManyBytesToFree returns the number of bytes that should be freed to make sure there is sufficient disk space free to satisfy s.DesiredPercentFree. 

#### <a id="Server.ignorePath" href="#Server.ignorePath">func (s *Server) ignorePath(path string) bool</a>

```
searchKey: server.Server.ignorePath
tags: [method private]
```

```Go
func (s *Server) ignorePath(path string) bool
```

#### <a id="Server.name" href="#Server.name">func (s *Server) name(dir GitDir) api.RepoName</a>

```
searchKey: server.Server.name
tags: [method private]
```

```Go
func (s *Server) name(dir GitDir) api.RepoName
```

#### <a id="Server.p4exec" href="#Server.p4exec">func (s *Server) p4exec(w http.ResponseWriter, r *http.Request, req *protocol.P4ExecRequest)</a>

```
searchKey: server.Server.p4exec
tags: [method private]
```

```Go
func (s *Server) p4exec(w http.ResponseWriter, r *http.Request, req *protocol.P4ExecRequest)
```

#### <a id="Server.queryCloneLimiter" href="#Server.queryCloneLimiter">func (s *Server) queryCloneLimiter() (cap, len int)</a>

```
searchKey: server.Server.queryCloneLimiter
tags: [method private]
```

```Go
func (s *Server) queryCloneLimiter() (cap, len int)
```

queryCloneLimiter reports the capacity and length of the clone limiter's queue 

#### <a id="Server.removeRepoDirectory" href="#Server.removeRepoDirectory">func (s *Server) removeRepoDirectory(gitDir GitDir) error</a>

```
searchKey: server.Server.removeRepoDirectory
tags: [method private]
```

```Go
func (s *Server) removeRepoDirectory(gitDir GitDir) error
```

removeRepoDirectory atomically removes a directory from s.ReposDir. 

It first moves the directory to a temporary location to avoid leaving partial state in the event of server restart or concurrent modifications to the directory. 

Additionally it removes parent empty directories up until s.ReposDir. 

#### <a id="Server.repoCloneProgress" href="#Server.repoCloneProgress">func (s *Server) repoCloneProgress(repo api.RepoName) (*protocol.RepoCloneProgress, error)</a>

```
searchKey: server.Server.repoCloneProgress
tags: [method private]
```

```Go
func (s *Server) repoCloneProgress(repo api.RepoName) (*protocol.RepoCloneProgress, error)
```

#### <a id="Server.repoInfo" href="#Server.repoInfo">func (s *Server) repoInfo(ctx context.Context, repo api.RepoName) (*protocol.RepoInfo, error)</a>

```
searchKey: server.Server.repoInfo
tags: [method private]
```

```Go
func (s *Server) repoInfo(ctx context.Context, repo api.RepoName) (*protocol.RepoInfo, error)
```

#### <a id="Server.serverContext" href="#Server.serverContext">func (s *Server) serverContext() (context.Context, context.CancelFunc)</a>

```
searchKey: server.Server.serverContext
tags: [method private]
```

```Go
func (s *Server) serverContext() (context.Context, context.CancelFunc)
```

serverContext returns a child context tied to the lifecycle of server. 

#### <a id="Server.setCloneStatus" href="#Server.setCloneStatus">func (s *Server) setCloneStatus(ctx context.Context, name api.RepoName, status types.CloneStatus) (err error)</a>

```
searchKey: server.Server.setCloneStatus
tags: [method private]
```

```Go
func (s *Server) setCloneStatus(ctx context.Context, name api.RepoName, status types.CloneStatus) (err error)
```

#### <a id="Server.setCloneStatusNonFatal" href="#Server.setCloneStatusNonFatal">func (s *Server) setCloneStatusNonFatal(ctx context.Context, name api.RepoName, status types.CloneStatus)</a>

```
searchKey: server.Server.setCloneStatusNonFatal
tags: [method private]
```

```Go
func (s *Server) setCloneStatusNonFatal(ctx context.Context, name api.RepoName, status types.CloneStatus)
```

setCloneStatusNonFatal is the same as setCloneStatus but only logs errors 

#### <a id="Server.setLastError" href="#Server.setLastError">func (s *Server) setLastError(ctx context.Context, name api.RepoName, error string) (err error)</a>

```
searchKey: server.Server.setLastError
tags: [method private]
```

```Go
func (s *Server) setLastError(ctx context.Context, name api.RepoName, error string) (err error)
```

#### <a id="Server.setLastErrorNonFatal" href="#Server.setLastErrorNonFatal">func (s *Server) setLastErrorNonFatal(ctx context.Context, name api.RepoName, err error)</a>

```
searchKey: server.Server.setLastErrorNonFatal
tags: [method private]
```

```Go
func (s *Server) setLastErrorNonFatal(ctx context.Context, name api.RepoName, err error)
```

setLastErrorNonFatal is the same as setLastError but only logs errors 

#### <a id="Server.syncRepoState" href="#Server.syncRepoState">func (s *Server) syncRepoState(addrs []string, batchSize, perSecond int) error</a>

```
searchKey: server.Server.syncRepoState
tags: [method private]
```

```Go
func (s *Server) syncRepoState(addrs []string, batchSize, perSecond int) error
```

#### <a id="Server.tempDir" href="#Server.tempDir">func (s *Server) tempDir(prefix string) (name string, err error)</a>

```
searchKey: server.Server.tempDir
tags: [method private]
```

```Go
func (s *Server) tempDir(prefix string) (name string, err error)
```

tempDir is a wrapper around os.MkdirTemp, but using the server's temporary directory filepath.Join(s.ReposDir, tempDirName). 

This directory is cleaned up by gitserver and will be ignored by repository listing operations. 

### <a id="StatDiskSizer" href="#StatDiskSizer">type StatDiskSizer struct{}</a>

```
searchKey: server.StatDiskSizer
tags: [struct]
```

```Go
type StatDiskSizer struct{}
```

#### <a id="StatDiskSizer.BytesFreeOnDisk" href="#StatDiskSizer.BytesFreeOnDisk">func (s *StatDiskSizer) BytesFreeOnDisk(mountPoint string) (uint64, error)</a>

```
searchKey: server.StatDiskSizer.BytesFreeOnDisk
tags: [method]
```

```Go
func (s *StatDiskSizer) BytesFreeOnDisk(mountPoint string) (uint64, error)
```

#### <a id="StatDiskSizer.DiskSizeBytes" href="#StatDiskSizer.DiskSizeBytes">func (s *StatDiskSizer) DiskSizeBytes(mountPoint string) (uint64, error)</a>

```
searchKey: server.StatDiskSizer.DiskSizeBytes
tags: [method]
```

```Go
func (s *StatDiskSizer) DiskSizeBytes(mountPoint string) (uint64, error)
```

### <a id="Test" href="#Test">type Test struct</a>

```
searchKey: server.Test
tags: [struct private]
```

```Go
type Test struct {
	Name             string
	Request          *http.Request
	ExpectedCode     int
	ExpectedBody     string
	ExpectedTrailers http.Header
}
```

### <a id="VCSSyncer" href="#VCSSyncer">type VCSSyncer interface</a>

```
searchKey: server.VCSSyncer
tags: [interface]
```

```Go
type VCSSyncer interface {
	// Type returns the type of the syncer.
	Type() string
	// IsCloneable checks to see if the VCS remote URL is cloneable. Any non-nil
	// error indicates there is a problem.
	IsCloneable(ctx context.Context, remoteURL *vcs.URL) error
	// CloneCommand returns the command to be executed for cloning from remote.
	CloneCommand(ctx context.Context, remoteURL *vcs.URL, tmpPath string) (cmd *exec.Cmd, err error)
	// Fetch tries to fetch updates from the remote to given directory.
	Fetch(ctx context.Context, remoteURL *vcs.URL, dir GitDir) error
	// RemoteShowCommand returns the command to be executed for showing remote.
	RemoteShowCommand(ctx context.Context, remoteURL *vcs.URL) (cmd *exec.Cmd, err error)
}
```

VCSSyncer describes whether and how to sync content from a VCS remote to local disk. 

### <a id="cloneOptions" href="#cloneOptions">type cloneOptions struct</a>

```
searchKey: server.cloneOptions
tags: [struct private]
```

```Go
type cloneOptions struct {
	// Block will wait for the clone to finish before returning. If the clone
	// fails, the error will be returned. The passed in context is
	// respected. When not blocking the clone is done with a server background
	// context.
	Block bool

	// Overwrite will overwrite the existing clone.
	Overwrite bool
}
```

cloneOptions specify optional behaviour for the cloneRepo function. 

### <a id="fakeDiskSizer" href="#fakeDiskSizer">type fakeDiskSizer struct</a>

```
searchKey: server.fakeDiskSizer
tags: [struct private]
```

```Go
type fakeDiskSizer struct {
	bytesFree uint64
	diskSize  uint64
}
```

#### <a id="fakeDiskSizer.BytesFreeOnDisk" href="#fakeDiskSizer.BytesFreeOnDisk">func (f *fakeDiskSizer) BytesFreeOnDisk(mountPoint string) (uint64, error)</a>

```
searchKey: server.fakeDiskSizer.BytesFreeOnDisk
tags: [method private]
```

```Go
func (f *fakeDiskSizer) BytesFreeOnDisk(mountPoint string) (uint64, error)
```

#### <a id="fakeDiskSizer.DiskSizeBytes" href="#fakeDiskSizer.DiskSizeBytes">func (f *fakeDiskSizer) DiskSizeBytes(mountPoint string) (uint64, error)</a>

```
searchKey: server.fakeDiskSizer.DiskSizeBytes
tags: [method private]
```

```Go
func (f *fakeDiskSizer) DiskSizeBytes(mountPoint string) (uint64, error)
```

### <a id="flushFunc" href="#flushFunc">type flushFunc func()</a>

```
searchKey: server.flushFunc
tags: [function private]
```

```Go
type flushFunc func()
```

#### <a id="flushFunc.Flush" href="#flushFunc.Flush">func (f flushFunc) Flush()</a>

```
searchKey: server.flushFunc.Flush
tags: [method private]
```

```Go
func (f flushFunc) Flush()
```

### <a id="flushingResponseWriter" href="#flushingResponseWriter">type flushingResponseWriter struct</a>

```
searchKey: server.flushingResponseWriter
tags: [struct private]
```

```Go
type flushingResponseWriter struct {
	// mu ensures we don't concurrently call Flush and Write. It also protects
	// state.
	mu      sync.Mutex
	w       http.ResponseWriter
	flusher http.Flusher
	closed  bool
	doFlush bool
}
```

flushingResponseWriter is a http.ResponseWriter that flushes all writes to the underlying connection within a certain time period after Write is called (instead of buffering them indefinitely). 

This lets, e.g., clients with a context deadline see as much partial response body as possible. 

#### <a id="newFlushingResponseWriter" href="#newFlushingResponseWriter">func newFlushingResponseWriter(w http.ResponseWriter) *flushingResponseWriter</a>

```
searchKey: server.newFlushingResponseWriter
tags: [function private]
```

```Go
func newFlushingResponseWriter(w http.ResponseWriter) *flushingResponseWriter
```

newFlushingResponseWriter creates a new flushing response writer. Callers must call Close to free the resources created by the writer. 

If w does not support flushing, it returns nil. 

#### <a id="flushingResponseWriter.Close" href="#flushingResponseWriter.Close">func (f *flushingResponseWriter) Close()</a>

```
searchKey: server.flushingResponseWriter.Close
tags: [method private]
```

```Go
func (f *flushingResponseWriter) Close()
```

Close signals to the flush goroutine to stop. 

#### <a id="flushingResponseWriter.Header" href="#flushingResponseWriter.Header">func (f *flushingResponseWriter) Header() http.Header</a>

```
searchKey: server.flushingResponseWriter.Header
tags: [method private]
```

```Go
func (f *flushingResponseWriter) Header() http.Header
```

Header implements http.ResponseWriter. 

#### <a id="flushingResponseWriter.Write" href="#flushingResponseWriter.Write">func (f *flushingResponseWriter) Write(p []byte) (int, error)</a>

```
searchKey: server.flushingResponseWriter.Write
tags: [method private]
```

```Go
func (f *flushingResponseWriter) Write(p []byte) (int, error)
```

Write implements http.ResponseWriter. 

#### <a id="flushingResponseWriter.WriteHeader" href="#flushingResponseWriter.WriteHeader">func (f *flushingResponseWriter) WriteHeader(code int)</a>

```
searchKey: server.flushingResponseWriter.WriteHeader
tags: [method private]
```

```Go
func (f *flushingResponseWriter) WriteHeader(code int)
```

WriteHeader implements http.ResponseWriter. 

#### <a id="flushingResponseWriter.periodicFlush" href="#flushingResponseWriter.periodicFlush">func (f *flushingResponseWriter) periodicFlush()</a>

```
searchKey: server.flushingResponseWriter.periodicFlush
tags: [method private]
```

```Go
func (f *flushingResponseWriter) periodicFlush()
```

### <a id="gitoliteClient" href="#gitoliteClient">type gitoliteClient struct{}</a>

```
searchKey: server.gitoliteClient
tags: [struct private]
```

```Go
type gitoliteClient struct{}
```

#### <a id="gitoliteClient.ListRepos" href="#gitoliteClient.ListRepos">func (c gitoliteClient) ListRepos(ctx context.Context, host string) ([]*gitolite.Repo, error)</a>

```
searchKey: server.gitoliteClient.ListRepos
tags: [method private]
```

```Go
func (c gitoliteClient) ListRepos(ctx context.Context, host string) ([]*gitolite.Repo, error)
```

### <a id="gitoliteFetcher" href="#gitoliteFetcher">type gitoliteFetcher struct</a>

```
searchKey: server.gitoliteFetcher
tags: [struct private]
```

```Go
type gitoliteFetcher struct {
	client iGitoliteClient
}
```

#### <a id="gitoliteFetcher.listRepos" href="#gitoliteFetcher.listRepos">func (g gitoliteFetcher) listRepos(ctx context.Context, gitoliteHost string, w http.ResponseWriter)</a>

```
searchKey: server.gitoliteFetcher.listRepos
tags: [method private]
```

```Go
func (g gitoliteFetcher) listRepos(ctx context.Context, gitoliteHost string, w http.ResponseWriter)
```

listRepos lists the repos of a Gitolite server reachable at the address in gitoliteHost 

### <a id="iGitoliteClient" href="#iGitoliteClient">type iGitoliteClient interface</a>

```
searchKey: server.iGitoliteClient
tags: [interface private]
```

```Go
type iGitoliteClient interface {
	ListRepos(ctx context.Context, host string) ([]*gitolite.Repo, error)
}
```

### <a id="limitWriter" href="#limitWriter">type limitWriter struct</a>

```
searchKey: server.limitWriter
tags: [struct private]
```

```Go
type limitWriter struct {
	W io.Writer // underling writer
	N int       // max bytes remaining
}
```

limitWriter is a io.Writer that writes to an W but discards after N bytes. 

#### <a id="limitWriter.Write" href="#limitWriter.Write">func (l *limitWriter) Write(p []byte) (int, error)</a>

```
searchKey: server.limitWriter.Write
tags: [method private]
```

```Go
func (l *limitWriter) Write(p []byte) (int, error)
```

### <a id="locks" href="#locks">type locks struct</a>

```
searchKey: server.locks
tags: [struct private]
```

```Go
type locks struct {
	once *sync.Once  // consolidates multiple waiting updates
	mu   *sync.Mutex // prevents updates running in parallel
}
```

### <a id="progressWriter" href="#progressWriter">type progressWriter struct</a>

```
searchKey: server.progressWriter
tags: [struct private]
```

```Go
type progressWriter struct {
	// writeOffset is the offset in buf where the next write should begin.
	writeOffset int

	// afterLastNewline is the index after the last '\n' in buf
	// or 0 if there is no '\n' in buf.
	afterLastNewline int

	buf []byte
}
```

progressWriter is an io.Writer that writes to a buffer. '\r' resets the write offset to the index after last '\n' in the buffer, or the beginning of the buffer if a '\n' has not been written yet. 

#### <a id="progressWriter.Bytes" href="#progressWriter.Bytes">func (w *progressWriter) Bytes() []byte</a>

```
searchKey: server.progressWriter.Bytes
tags: [method private]
```

```Go
func (w *progressWriter) Bytes() []byte
```

Bytes returns the contents of the buffer. 

#### <a id="progressWriter.String" href="#progressWriter.String">func (w *progressWriter) String() string</a>

```
searchKey: server.progressWriter.String
tags: [method private]
```

```Go
func (w *progressWriter) String() string
```

String returns the contents of the buffer as a string. 

#### <a id="progressWriter.Write" href="#progressWriter.Write">func (w *progressWriter) Write(p []byte) (n int, err error)</a>

```
searchKey: server.progressWriter.Write
tags: [method private]
```

```Go
func (w *progressWriter) Write(p []byte) (n int, err error)
```

### <a id="sshAgent" href="#sshAgent">type sshAgent struct</a>

```
searchKey: server.sshAgent
tags: [struct private]
```

```Go
type sshAgent struct {
	l       net.Listener
	sock    string
	keyring agent.Agent
	done    chan struct{}
}
```

sshAgent speaks the ssh-agent protocol and can be used by gitserver to provide a private key to ssh when talking to the code host. 

#### <a id="newSSHAgent" href="#newSSHAgent">func newSSHAgent(raw, passphrase []byte) (*sshAgent, error)</a>

```
searchKey: server.newSSHAgent
tags: [function private]
```

```Go
func newSSHAgent(raw, passphrase []byte) (*sshAgent, error)
```

newSSHAgent takes a private key and it's passphrase and returns an `sshAgent`. 

#### <a id="sshAgent.Close" href="#sshAgent.Close">func (a *sshAgent) Close() error</a>

```
searchKey: server.sshAgent.Close
tags: [method private]
```

```Go
func (a *sshAgent) Close() error
```

Close closes the server. 

#### <a id="sshAgent.Listen" href="#sshAgent.Listen">func (a *sshAgent) Listen()</a>

```
searchKey: server.sshAgent.Listen
tags: [method private]
```

```Go
func (a *sshAgent) Listen()
```

Listen starts accepting connections of the ssh agent. 

#### <a id="sshAgent.Socket" href="#sshAgent.Socket">func (a *sshAgent) Socket() string</a>

```
searchKey: server.sshAgent.Socket
tags: [method private]
```

```Go
func (a *sshAgent) Socket() string
```

Socket returns the path to the unix socket the ssh-agent server is listening on. 

### <a id="stubGitoliteClient" href="#stubGitoliteClient">type stubGitoliteClient struct</a>

```
searchKey: server.stubGitoliteClient
tags: [struct private]
```

```Go
type stubGitoliteClient struct {
	ListRepos_ func(ctx context.Context, host string) ([]*gitolite.Repo, error)
}
```

#### <a id="stubGitoliteClient.ListRepos" href="#stubGitoliteClient.ListRepos">func (c stubGitoliteClient) ListRepos(ctx context.Context, host string) ([]*gitolite.Repo, error)</a>

```
searchKey: server.stubGitoliteClient.ListRepos
tags: [method private]
```

```Go
func (c stubGitoliteClient) ListRepos(ctx context.Context, host string) ([]*gitolite.Repo, error)
```

### <a id="tlsConfig" href="#tlsConfig">type tlsConfig struct</a>

```
searchKey: server.tlsConfig
tags: [struct private]
```

```Go
type tlsConfig struct {
	// Whether to not verify the SSL certificate when fetching or pushing over
	// HTTPS.
	//
	// https://git-scm.com/docs/git-config#Documentation/git-config.txt-httpsslVerify
	SSLNoVerify bool

	// File containing the certificates to verify the peer with when fetching
	// or pushing over HTTPS.
	//
	// https://git-scm.com/docs/git-config#Documentation/git-config.txt-httpsslCAInfo
	SSLCAInfo string
}
```

### <a id="urlRedactor" href="#urlRedactor">type urlRedactor struct</a>

```
searchKey: server.urlRedactor
tags: [struct private]
```

```Go
type urlRedactor struct {
	// sensitive are sensitive strings to be redacted.
	// The strings should not be empty.
	sensitive []string
}
```

urlRedactor redacts all sensitive strings from a message. 

#### <a id="newURLRedactor" href="#newURLRedactor">func newURLRedactor(parsedURL *vcs.URL) *urlRedactor</a>

```
searchKey: server.newURLRedactor
tags: [function private]
```

```Go
func newURLRedactor(parsedURL *vcs.URL) *urlRedactor
```

newURLRedactor returns a new urlRedactor that redacts credentials found in rawurl, and the rawurl itself. 

#### <a id="urlRedactor.redact" href="#urlRedactor.redact">func (r *urlRedactor) redact(message string) string</a>

```
searchKey: server.urlRedactor.redact
tags: [method private]
```

```Go
func (r *urlRedactor) redact(message string) string
```

redact returns a redacted version of message. Sensitive strings are replaced with "<redacted>". 

### <a id="writeCounter" href="#writeCounter">type writeCounter struct</a>

```
searchKey: server.writeCounter
tags: [struct private]
```

```Go
type writeCounter struct {
	w io.Writer
	// n is the number of bytes written to w
	n int64
}
```

writeCounter wraps an io.Writer and keeps track of bytes written. 

#### <a id="writeCounter.Write" href="#writeCounter.Write">func (c *writeCounter) Write(p []byte) (n int, err error)</a>

```
searchKey: server.writeCounter.Write
tags: [method private]
```

```Go
func (c *writeCounter) Write(p []byte) (n int, err error)
```

## <a id="func" href="#func">Functions</a>

### <a id="BenchmarkQuickRevParseHeadQuickSymbolicRefHead_packed_refs" href="#BenchmarkQuickRevParseHeadQuickSymbolicRefHead_packed_refs">func BenchmarkQuickRevParseHeadQuickSymbolicRefHead_packed_refs(b *testing.B)</a>

```
searchKey: server.BenchmarkQuickRevParseHeadQuickSymbolicRefHead_packed_refs
tags: [function private benchmark]
```

```Go
func BenchmarkQuickRevParseHeadQuickSymbolicRefHead_packed_refs(b *testing.B)
```

### <a id="BenchmarkQuickRevParseHeadQuickSymbolicRefHead_unpacked_refs" href="#BenchmarkQuickRevParseHeadQuickSymbolicRefHead_unpacked_refs">func BenchmarkQuickRevParseHeadQuickSymbolicRefHead_unpacked_refs(b *testing.B)</a>

```
searchKey: server.BenchmarkQuickRevParseHeadQuickSymbolicRefHead_unpacked_refs
tags: [function private benchmark]
```

```Go
func BenchmarkQuickRevParseHeadQuickSymbolicRefHead_unpacked_refs(b *testing.B)
```

### <a id="TestCleanupExpired" href="#TestCleanupExpired">func TestCleanupExpired(t *testing.T)</a>

```
searchKey: server.TestCleanupExpired
tags: [function private test]
```

```Go
func TestCleanupExpired(t *testing.T)
```

### <a id="TestCleanupInactive" href="#TestCleanupInactive">func TestCleanupInactive(t *testing.T)</a>

```
searchKey: server.TestCleanupInactive
tags: [function private test]
```

```Go
func TestCleanupInactive(t *testing.T)
```

### <a id="TestCleanupOldLocks" href="#TestCleanupOldLocks">func TestCleanupOldLocks(t *testing.T)</a>

```
searchKey: server.TestCleanupOldLocks
tags: [function private test]
```

```Go
func TestCleanupOldLocks(t *testing.T)
```

### <a id="TestCleanup_computeStats" href="#TestCleanup_computeStats">func TestCleanup_computeStats(t *testing.T)</a>

```
searchKey: server.TestCleanup_computeStats
tags: [function private test]
```

```Go
func TestCleanup_computeStats(t *testing.T)
```

### <a id="TestCloneRepo" href="#TestCloneRepo">func TestCloneRepo(t *testing.T)</a>

```
searchKey: server.TestCloneRepo
tags: [function private test]
```

```Go
func TestCloneRepo(t *testing.T)
```

### <a id="TestCloneRepo_EnsureValidity" href="#TestCloneRepo_EnsureValidity">func TestCloneRepo_EnsureValidity(t *testing.T)</a>

```
searchKey: server.TestCloneRepo_EnsureValidity
tags: [function private test]
```

```Go
func TestCloneRepo_EnsureValidity(t *testing.T)
```

### <a id="TestConfigureRemoteGitCommand" href="#TestConfigureRemoteGitCommand">func TestConfigureRemoteGitCommand(t *testing.T)</a>

```
searchKey: server.TestConfigureRemoteGitCommand
tags: [function private test]
```

```Go
func TestConfigureRemoteGitCommand(t *testing.T)
```

### <a id="TestConfigureRemoteGitCommand_tls" href="#TestConfigureRemoteGitCommand_tls">func TestConfigureRemoteGitCommand_tls(t *testing.T)</a>

```
searchKey: server.TestConfigureRemoteGitCommand_tls
tags: [function private test]
```

```Go
func TestConfigureRemoteGitCommand_tls(t *testing.T)
```

### <a id="TestCustomGitFetch" href="#TestCustomGitFetch">func TestCustomGitFetch(t *testing.T)</a>

```
searchKey: server.TestCustomGitFetch
tags: [function private test]
```

```Go
func TestCustomGitFetch(t *testing.T)
```

### <a id="TestDecomposePerforceRemoteURL" href="#TestDecomposePerforceRemoteURL">func TestDecomposePerforceRemoteURL(t *testing.T)</a>

```
searchKey: server.TestDecomposePerforceRemoteURL
tags: [function private test]
```

```Go
func TestDecomposePerforceRemoteURL(t *testing.T)
```

### <a id="TestEmptyCustomGitFetch" href="#TestEmptyCustomGitFetch">func TestEmptyCustomGitFetch(t *testing.T)</a>

```
searchKey: server.TestEmptyCustomGitFetch
tags: [function private test]
```

```Go
func TestEmptyCustomGitFetch(t *testing.T)
```

### <a id="TestFlushingResponseWriter" href="#TestFlushingResponseWriter">func TestFlushingResponseWriter(t *testing.T)</a>

```
searchKey: server.TestFlushingResponseWriter
tags: [function private test]
```

```Go
func TestFlushingResponseWriter(t *testing.T)
```

### <a id="TestFreeUpSpace" href="#TestFreeUpSpace">func TestFreeUpSpace(t *testing.T)</a>

```
searchKey: server.TestFreeUpSpace
tags: [function private test]
```

```Go
func TestFreeUpSpace(t *testing.T)
```

### <a id="TestGitGCAuto" href="#TestGitGCAuto">func TestGitGCAuto(t *testing.T)</a>

```
searchKey: server.TestGitGCAuto
tags: [function private test]
```

```Go
func TestGitGCAuto(t *testing.T)
```

Note that the exact values (e.g. 50 commits) below are related to git's internal heuristics regarding whether or not to invoke `git gc --auto`. 

They are stable today, but may become flaky in the future if/when the relevant internal magic numbers and transformations change. 

### <a id="TestHandleRepoUpdate" href="#TestHandleRepoUpdate">func TestHandleRepoUpdate(t *testing.T)</a>

```
searchKey: server.TestHandleRepoUpdate
tags: [function private test]
```

```Go
func TestHandleRepoUpdate(t *testing.T)
```

### <a id="TestHostnameMatch" href="#TestHostnameMatch">func TestHostnameMatch(t *testing.T)</a>

```
searchKey: server.TestHostnameMatch
tags: [function private test]
```

```Go
func TestHostnameMatch(t *testing.T)
```

### <a id="TestHowManyBytesToFree" href="#TestHowManyBytesToFree">func TestHowManyBytesToFree(t *testing.T)</a>

```
searchKey: server.TestHowManyBytesToFree
tags: [function private test]
```

```Go
func TestHowManyBytesToFree(t *testing.T)
```

### <a id="TestJitterDuration" href="#TestJitterDuration">func TestJitterDuration(t *testing.T)</a>

```
searchKey: server.TestJitterDuration
tags: [function private test]
```

```Go
func TestJitterDuration(t *testing.T)
```

### <a id="TestMain" href="#TestMain">func TestMain(m *testing.M)</a>

```
searchKey: server.TestMain
tags: [function private test]
```

```Go
func TestMain(m *testing.M)
```

### <a id="TestMaybeCorruptStderrRe" href="#TestMaybeCorruptStderrRe">func TestMaybeCorruptStderrRe(t *testing.T)</a>

```
searchKey: server.TestMaybeCorruptStderrRe
tags: [function private test]
```

```Go
func TestMaybeCorruptStderrRe(t *testing.T)
```

### <a id="TestProgressWriter" href="#TestProgressWriter">func TestProgressWriter(t *testing.T)</a>

```
searchKey: server.TestProgressWriter
tags: [function private test]
```

```Go
func TestProgressWriter(t *testing.T)
```

### <a id="TestRemoveBadRefs" href="#TestRemoveBadRefs">func TestRemoveBadRefs(t *testing.T)</a>

```
searchKey: server.TestRemoveBadRefs
tags: [function private test]
```

```Go
func TestRemoveBadRefs(t *testing.T)
```

### <a id="TestRemoveRepoDirectory" href="#TestRemoveRepoDirectory">func TestRemoveRepoDirectory(t *testing.T)</a>

```
searchKey: server.TestRemoveRepoDirectory
tags: [function private test]
```

```Go
func TestRemoveRepoDirectory(t *testing.T)
```

### <a id="TestRemoveRepoDirectory_Empty" href="#TestRemoveRepoDirectory_Empty">func TestRemoveRepoDirectory_Empty(t *testing.T)</a>

```
searchKey: server.TestRemoveRepoDirectory_Empty
tags: [function private test]
```

```Go
func TestRemoveRepoDirectory_Empty(t *testing.T)
```

### <a id="TestRequest" href="#TestRequest">func TestRequest(t *testing.T)</a>

```
searchKey: server.TestRequest
tags: [function private test]
```

```Go
func TestRequest(t *testing.T)
```

### <a id="TestSSHAgent" href="#TestSSHAgent">func TestSSHAgent(t *testing.T)</a>

```
searchKey: server.TestSSHAgent
tags: [function private test]
```

```Go
func TestSSHAgent(t *testing.T)
```

### <a id="TestServer_handleGet" href="#TestServer_handleGet">func TestServer_handleGet(t *testing.T)</a>

```
searchKey: server.TestServer_handleGet
tags: [function private test]
```

```Go
func TestServer_handleGet(t *testing.T)
```

### <a id="TestServer_handleGet_invalid" href="#TestServer_handleGet_invalid">func TestServer_handleGet_invalid(t *testing.T)</a>

```
searchKey: server.TestServer_handleGet_invalid
tags: [function private test]
```

```Go
func TestServer_handleGet_invalid(t *testing.T)
```

### <a id="TestServer_handleList" href="#TestServer_handleList">func TestServer_handleList(t *testing.T)</a>

```
searchKey: server.TestServer_handleList
tags: [function private test]
```

```Go
func TestServer_handleList(t *testing.T)
```

### <a id="TestServer_handleP4Exec" href="#TestServer_handleP4Exec">func TestServer_handleP4Exec(t *testing.T)</a>

```
searchKey: server.TestServer_handleP4Exec
tags: [function private test]
```

```Go
func TestServer_handleP4Exec(t *testing.T)
```

### <a id="TestServer_handleRepoInfo" href="#TestServer_handleRepoInfo">func TestServer_handleRepoInfo(t *testing.T)</a>

```
searchKey: server.TestServer_handleRepoInfo
tags: [function private test]
```

```Go
func TestServer_handleRepoInfo(t *testing.T)
```

### <a id="TestSetupAndClearTmp" href="#TestSetupAndClearTmp">func TestSetupAndClearTmp(t *testing.T)</a>

```
searchKey: server.TestSetupAndClearTmp
tags: [function private test]
```

```Go
func TestSetupAndClearTmp(t *testing.T)
```

### <a id="TestSetupAndClearTmp_Empty" href="#TestSetupAndClearTmp_Empty">func TestSetupAndClearTmp_Empty(t *testing.T)</a>

```
searchKey: server.TestSetupAndClearTmp_Empty
tags: [function private test]
```

```Go
func TestSetupAndClearTmp_Empty(t *testing.T)
```

### <a id="TestSyncRepoState" href="#TestSyncRepoState">func TestSyncRepoState(t *testing.T)</a>

```
searchKey: server.TestSyncRepoState
tags: [function private test]
```

```Go
func TestSyncRepoState(t *testing.T)
```

### <a id="TestUpdateFileIfDifferent" href="#TestUpdateFileIfDifferent">func TestUpdateFileIfDifferent(t *testing.T)</a>

```
searchKey: server.TestUpdateFileIfDifferent
tags: [function private test]
```

```Go
func TestUpdateFileIfDifferent(t *testing.T)
```

### <a id="TestUrlRedactor" href="#TestUrlRedactor">func TestUrlRedactor(t *testing.T)</a>

```
searchKey: server.TestUrlRedactor
tags: [function private test]
```

```Go
func TestUrlRedactor(t *testing.T)
```

### <a id="Test_Gitolite_listRepos" href="#Test_Gitolite_listRepos">func Test_Gitolite_listRepos(t *testing.T)</a>

```
searchKey: server.Test_Gitolite_listRepos
tags: [function private test]
```

```Go
func Test_Gitolite_listRepos(t *testing.T)
```

### <a id="assertPaths" href="#assertPaths">func assertPaths(t *testing.T, root string, want ...string)</a>

```
searchKey: server.assertPaths
tags: [function private]
```

```Go
func assertPaths(t *testing.T, root string, want ...string)
```

assertPaths checks that all paths under want exist. It excludes non-empty directories 

### <a id="bestEffortWalk" href="#bestEffortWalk">func bestEffortWalk(root string, walkFn func(path string, info fs.FileInfo) error) error</a>

```
searchKey: server.bestEffortWalk
tags: [function private]
```

```Go
func bestEffortWalk(root string, walkFn func(path string, info fs.FileInfo) error) error
```

bestEffortWalk is a filepath.Walk which ignores errors that can be passed to walkFn. This is a common pattern used in gitserver for best effort work. 

Note: We still respect errors returned by walkFn. 

filepath.Walk can return errors if we run into permission errors or a file disappears between readdir and the stat of the file. In either case this error can be ignored for best effort code. 

### <a id="buildCustomFetchMappings" href="#buildCustomFetchMappings">func buildCustomFetchMappings(c []*schema.CustomGitFetchMapping) map[string][]string</a>

```
searchKey: server.buildCustomFetchMappings
tags: [function private]
```

```Go
func buildCustomFetchMappings(c []*schema.CustomGitFetchMapping) map[string][]string
```

### <a id="checkMaybeCorruptRepo" href="#checkMaybeCorruptRepo">func checkMaybeCorruptRepo(repo api.RepoName, dir GitDir, stderr string)</a>

```
searchKey: server.checkMaybeCorruptRepo
tags: [function private]
```

```Go
func checkMaybeCorruptRepo(repo api.RepoName, dir GitDir, stderr string)
```

### <a id="checkSpecArgSafety" href="#checkSpecArgSafety">func checkSpecArgSafety(spec string) error</a>

```
searchKey: server.checkSpecArgSafety
tags: [function private]
```

```Go
func checkSpecArgSafety(spec string) error
```

checkSpecArgSafety returns a non-nil err if spec begins with a "-", which could cause it to be interpreted as a git command line argument. 

### <a id="cleanUpTmpRepo" href="#cleanUpTmpRepo">func cleanUpTmpRepo(path string)</a>

```
searchKey: server.cleanUpTmpRepo
tags: [function private]
```

```Go
func cleanUpTmpRepo(path string)
```

### <a id="cloneStatus" href="#cloneStatus">func cloneStatus(cloned, cloning bool) types.CloneStatus</a>

```
searchKey: server.cloneStatus
tags: [function private]
```

```Go
func cloneStatus(cloned, cloning bool) types.CloneStatus
```

### <a id="computeLatestCommitTimestamp" href="#computeLatestCommitTimestamp">func computeLatestCommitTimestamp(dir GitDir) time.Time</a>

```
searchKey: server.computeLatestCommitTimestamp
tags: [function private]
```

```Go
func computeLatestCommitTimestamp(dir GitDir) time.Time
```

computeLatestCommitTimestamp returns the timestamp of the most recent commit if any. If there are no commits or the latest commit is in the future, or there is any error, time.Now is returned. 

### <a id="computeRefHash" href="#computeRefHash">func computeRefHash(dir GitDir) ([]byte, error)</a>

```
searchKey: server.computeRefHash
tags: [function private]
```

```Go
func computeRefHash(dir GitDir) ([]byte, error)
```

computeRefHash returns a hash of the refs for dir. The hash should only change if the set of refs and the commits they point to change. 

### <a id="configureRemoteGitCommand" href="#configureRemoteGitCommand">func configureRemoteGitCommand(cmd *exec.Cmd, tlsConf *tlsConfig)</a>

```
searchKey: server.configureRemoteGitCommand
tags: [function private]
```

```Go
func configureRemoteGitCommand(cmd *exec.Cmd, tlsConf *tlsConfig)
```

### <a id="customFetchCmd" href="#customFetchCmd">func customFetchCmd(ctx context.Context, remoteURL *vcs.URL) *exec.Cmd</a>

```
searchKey: server.customFetchCmd
tags: [function private]
```

```Go
func customFetchCmd(ctx context.Context, remoteURL *vcs.URL) *exec.Cmd
```

### <a id="debounce" href="#debounce">func debounce(name api.RepoName, since time.Duration) bool</a>

```
searchKey: server.debounce
tags: [function private]
```

```Go
func debounce(name api.RepoName, since time.Duration) bool
```

debounce() provides some filtering to prevent spammy requests for the same repository. If the last fetch of the repository was within the given duration, returns false, otherwise returns true and updates the last fetch stamp. 

### <a id="decomposePerforceRemoteURL" href="#decomposePerforceRemoteURL">func decomposePerforceRemoteURL(remoteURL *vcs.URL) (username, password, host, depot string, err error)</a>

```
searchKey: server.decomposePerforceRemoteURL
tags: [function private]
```

```Go
func decomposePerforceRemoteURL(remoteURL *vcs.URL) (username, password, host, depot string, err error)
```

decomposePerforceRemoteURL decomposes information back from a clone URL for a Perforce depot. 

### <a id="dirSize" href="#dirSize">func dirSize(d string) int64</a>

```
searchKey: server.dirSize
tags: [function private]
```

```Go
func dirSize(d string) int64
```

dirSize returns the total size in bytes of all the files under d. 

### <a id="ensureHEAD" href="#ensureHEAD">func ensureHEAD(dir GitDir)</a>

```
searchKey: server.ensureHEAD
tags: [function private]
```

```Go
func ensureHEAD(dir GitDir)
```

ensureHEAD verifies that there is a HEAD file within the repo, and that it is of non-zero length. If either condition is met, we configure a best-effort default. 

### <a id="ensureRefPrefix" href="#ensureRefPrefix">func ensureRefPrefix(ref string) string</a>

```
searchKey: server.ensureRefPrefix
tags: [function private]
```

```Go
func ensureRefPrefix(ref string) string
```

ensureRefPrefix checks whether the ref is a full ref and contains the "refs/heads" prefix (i.e. "refs/heads/master") or just an abbreviated ref (i.e. "master") and adds the "refs/heads/" prefix if the latter is the case. 

Copied from git package to avoid cycle import when testing git package. 

### <a id="errorString" href="#errorString">func errorString(err error) string</a>

```
searchKey: server.errorString
tags: [function private]
```

```Go
func errorString(err error) string
```

errorString returns the error string. If err is nil it returns the empty string. 

### <a id="flowrateWriter" href="#flowrateWriter">func flowrateWriter(w io.Writer) io.Writer</a>

```
searchKey: server.flowrateWriter
tags: [function private]
```

```Go
func flowrateWriter(w io.Writer) io.Writer
```

flowrateWriter limits the write rate of w to 1 Gbps. 

We are cloning repositories from within the same network from another Sourcegraph service (zoekt-indexserver). This can end up being so fast that we harm our own network connectivity. In the case of zoekt-indexserver and gitserver running on the same host machine, we can even reach up to ~100 Gbps and effectively DoS the Docker network, temporarily disrupting other containers running on the host. 

Google Compute Engine has a network bandwidth of about 1.64 Gbps between nodes, and AWS varies widely depending on instance type. We play it safe and default to 1 Gbps here (~119 MiB/s), which means we can fetch a 1 GiB archive in ~8.5 seconds. 

### <a id="fsync" href="#fsync">func fsync(path string) error</a>

```
searchKey: server.fsync
tags: [function private]
```

```Go
func fsync(path string) error
```

### <a id="generateSocketFilename" href="#generateSocketFilename">func generateSocketFilename() string</a>

```
searchKey: server.generateSocketFilename
tags: [function private]
```

```Go
func generateSocketFilename() string
```

### <a id="getGitolitePhabCallsign" href="#getGitolitePhabCallsign">func getGitolitePhabCallsign(ctx context.Context, gconf *schema.GitoliteConnection, repo, command string) (string, error)</a>

```
searchKey: server.getGitolitePhabCallsign
tags: [function private]
```

```Go
func getGitolitePhabCallsign(ctx context.Context, gconf *schema.GitoliteConnection, repo, command string) (string, error)
```

### <a id="getRecloneTime" href="#getRecloneTime">func getRecloneTime(dir GitDir) (time.Time, error)</a>

```
searchKey: server.getRecloneTime
tags: [function private]
```

```Go
func getRecloneTime(dir GitDir) (time.Time, error)
```

getRecloneTime returns an approximate time a repository is cloned. If the value is not stored in the repository, the re-clone time for the repository is set to now. 

### <a id="getRepositoryType" href="#getRepositoryType">func getRepositoryType(dir GitDir) (string, error)</a>

```
searchKey: server.getRepositoryType
tags: [function private]
```

```Go
func getRepositoryType(dir GitDir) (string, error)
```

getRepositoryType returns the type of the repository. 

### <a id="gitConfigGet" href="#gitConfigGet">func gitConfigGet(dir GitDir, key string) (string, error)</a>

```
searchKey: server.gitConfigGet
tags: [function private]
```

```Go
func gitConfigGet(dir GitDir, key string) (string, error)
```

### <a id="gitConfigSet" href="#gitConfigSet">func gitConfigSet(dir GitDir, key, value string) error</a>

```
searchKey: server.gitConfigSet
tags: [function private]
```

```Go
func gitConfigSet(dir GitDir, key, value string) error
```

### <a id="gitConfigUnset" href="#gitConfigUnset">func gitConfigUnset(dir GitDir, key string) error</a>

```
searchKey: server.gitConfigUnset
tags: [function private]
```

```Go
func gitConfigUnset(dir GitDir, key string) error
```

### <a id="gitDirModTime" href="#gitDirModTime">func gitDirModTime(d GitDir) (time.Time, error)</a>

```
searchKey: server.gitDirModTime
tags: [function private]
```

```Go
func gitDirModTime(d GitDir) (time.Time, error)
```

### <a id="gitGC" href="#gitGC">func gitGC(dir GitDir) error</a>

```
searchKey: server.gitGC
tags: [function private]
```

```Go
func gitGC(dir GitDir) error
```

gitGC will invoke `git-gc` to clean up any garbage in the repo. It will operate synchronously and be aggressive with its internal heurisitcs when deciding to act (meaning it will act now at lower thresholds). 

### <a id="hackilyGetHTTPFlusher" href="#hackilyGetHTTPFlusher">func hackilyGetHTTPFlusher(w http.ResponseWriter) http.Flusher</a>

```
searchKey: server.hackilyGetHTTPFlusher
tags: [function private]
```

```Go
func hackilyGetHTTPFlusher(w http.ResponseWriter) http.Flusher
```

hackilyGetHTTPFlusher attempts to get an http.Flusher from w. It (hackily) handles the case where w is a nethttp.statusCodeTracker (which wraps http.ResponseWriter and does not implement http.Flusher). See [https://github.com/opentracing-contrib/go-stdlib/pull/11#discussion_r164295773](https://github.com/opentracing-contrib/go-stdlib/pull/11#discussion_r164295773) and [https://github.com/sourcegraph/sourcegraph/issues/9045](https://github.com/sourcegraph/sourcegraph/issues/9045). 

I (@sqs) wrote this hack instead of fixing it upstream immediately because seems to be some reluctance to merge a fix (because it'd make the http.ResponseWriter falsely appear to implement many interfaces that it doesn't actually implement, so it would break the correctness of Go type-assertion impl checks). 

### <a id="honeySampleRate" href="#honeySampleRate">func honeySampleRate(cmd string) uint</a>

```
searchKey: server.honeySampleRate
tags: [function private]
```

```Go
func honeySampleRate(cmd string) uint
```

Send 1 in 16 events to honeycomb. This is hardcoded since we only use this for Sourcegraph.com. 

2020-05-29 1 in 4. We are currently at the top tier for honeycomb (before enterprise) and using double our quota. This gives us room to grow. If you find we keep bumping this / missing data we care about we can look into more dynamic ways to sample in our application code. 

2020-07-20 1 in 16. Again hitting very high usage. Likely due to recent scaling up of the indexed search cluster. Will require more investigation, but we should probably segment user request path traffic vs internal batch traffic. 

2020-11-02 Dynamically sample. Again hitting very high usage. Same root cause as before, scaling out indexed search cluster. We update our sampling to isntead be dynamic, since "rev-parse" is 12 times more likely than the next most common command. 

### <a id="init.server.go" href="#init.server.go">func init()</a>

```
searchKey: server.init
tags: [function private]
```

```Go
func init()
```

### <a id="isAbsoluteRevision" href="#isAbsoluteRevision">func isAbsoluteRevision(s string) bool</a>

```
searchKey: server.isAbsoluteRevision
tags: [function private]
```

```Go
func isAbsoluteRevision(s string) bool
```

IsAbsoluteRevision checks if the revision is a git OID SHA string. 

Note: This doesn't mean the SHA exists in a repository, nor does it mean it isn't a ref. Git allows 40-char hexadecimal strings to be references. 

copied from internal/vcs/git to avoid cyclic import 

### <a id="isAlwaysCloningTest" href="#isAlwaysCloningTest">func isAlwaysCloningTest(name api.RepoName) bool</a>

```
searchKey: server.isAlwaysCloningTest
tags: [function private]
```

```Go
func isAlwaysCloningTest(name api.RepoName) bool
```

### <a id="isEmptyDir" href="#isEmptyDir">func isEmptyDir(path string) (bool, error)</a>

```
searchKey: server.isEmptyDir
tags: [function private]
```

```Go
func isEmptyDir(path string) (bool, error)
```

### <a id="jitterDuration" href="#jitterDuration">func jitterDuration(key string, d time.Duration) time.Duration</a>

```
searchKey: server.jitterDuration
tags: [function private]
```

```Go
func jitterDuration(key string, d time.Duration) time.Duration
```

jitterDuration returns a duration between [0, d) based on key. This is like a random duration, but instead of a random source it is computed via a hash on key. 

### <a id="makeFakeRepo" href="#makeFakeRepo">func makeFakeRepo(d string, sizeBytes int) error</a>

```
searchKey: server.makeFakeRepo
tags: [function private]
```

```Go
func makeFakeRepo(d string, sizeBytes int) error
```

### <a id="makeSingleCommitRepo" href="#makeSingleCommitRepo">func makeSingleCommitRepo(cmd func(string, ...string) string) string</a>

```
searchKey: server.makeSingleCommitRepo
tags: [function private]
```

```Go
func makeSingleCommitRepo(cmd func(string, ...string) string) string
```

makeSingleCommitRepo make create a new repo with a single commit and returns the HEAD SHA 

### <a id="mapToLog15Ctx" href="#mapToLog15Ctx">func mapToLog15Ctx(m map[string]interface{}) []interface{}</a>

```
searchKey: server.mapToLog15Ctx
tags: [function private]
```

```Go
func mapToLog15Ctx(m map[string]interface{}) []interface{}
```

mapToLog15Ctx translates a map to log15 context fields. 

### <a id="mkFiles" href="#mkFiles">func mkFiles(t *testing.T, root string, paths ...string)</a>

```
searchKey: server.mkFiles
tags: [function private]
```

```Go
func mkFiles(t *testing.T, root string, paths ...string)
```

### <a id="p4ping" href="#p4ping">func p4ping(ctx context.Context, host, username, password string) error</a>

```
searchKey: server.p4ping
tags: [function private]
```

```Go
func p4ping(ctx context.Context, host, username, password string) error
```

p4ping sends one message to the Perforce server to check connectivity. 

### <a id="p4pingWithTrust" href="#p4pingWithTrust">func p4pingWithTrust(ctx context.Context, host, username, password string) error</a>

```
searchKey: server.p4pingWithTrust
tags: [function private]
```

```Go
func p4pingWithTrust(ctx context.Context, host, username, password string) error
```

p4pingWithTrust attempts to ping the Perforce server and performs a trust operation when needed. 

### <a id="p4trust" href="#p4trust">func p4trust(ctx context.Context, host string) error</a>

```
searchKey: server.p4trust
tags: [function private]
```

```Go
func p4trust(ctx context.Context, host string) error
```

p4trust blindly accepts fingerprint of the Perforce server. 

### <a id="quickRevParseHead" href="#quickRevParseHead">func quickRevParseHead(dir GitDir) (string, error)</a>

```
searchKey: server.quickRevParseHead
tags: [function private]
```

```Go
func quickRevParseHead(dir GitDir) (string, error)
```

quickRevParseHead best-effort mimics the execution of `git rev-parse HEAD`, but doesn't exec a child process. It just reads the relevant files from the bare git repository directory. 

### <a id="quickSymbolicRefHead" href="#quickSymbolicRefHead">func quickSymbolicRefHead(dir GitDir) (string, error)</a>

```
searchKey: server.quickSymbolicRefHead
tags: [function private]
```

```Go
func quickSymbolicRefHead(dir GitDir) (string, error)
```

quickSymbolicRefHead best-effort mimics the execution of `git symbolic-ref HEAD`, but doesn't exec a child process. It just reads the .git/HEAD file from the bare git repository directory. 

### <a id="readCloneProgress" href="#readCloneProgress">func readCloneProgress(redactor *urlRedactor, lock *RepositoryLock, pr io.Reader)</a>

```
searchKey: server.readCloneProgress
tags: [function private]
```

```Go
func readCloneProgress(redactor *urlRedactor, lock *RepositoryLock, pr io.Reader)
```

readCloneProgress scans the reader and saves the most recent line of output as the lock status. 

### <a id="refspecOverridesFetchCmd" href="#refspecOverridesFetchCmd">func refspecOverridesFetchCmd(ctx context.Context, remoteURL *vcs.URL) *exec.Cmd</a>

```
searchKey: server.refspecOverridesFetchCmd
tags: [function private]
```

```Go
func refspecOverridesFetchCmd(ctx context.Context, remoteURL *vcs.URL) *exec.Cmd
```

HACK(keegancsmith) workaround to experiment with cloning less in a large monorepo. [https://github.com/sourcegraph/customer/issues/19](https://github.com/sourcegraph/customer/issues/19) 

### <a id="removeBadRefs" href="#removeBadRefs">func removeBadRefs(ctx context.Context, dir GitDir)</a>

```
searchKey: server.removeBadRefs
tags: [function private]
```

```Go
func removeBadRefs(ctx context.Context, dir GitDir)
```

removeBadRefs removes bad refs and tags from the git repo at dir. This should be run after a clone or fetch. If your repository contains a ref or tag called HEAD (case insensitive), most commands will output a warning from git: 

```
warning: refname 'HEAD' is ambiguous.

```
Instead we just remove this ref. 

### <a id="removeFileOlderThan" href="#removeFileOlderThan">func removeFileOlderThan(path string, maxAge time.Duration) error</a>

```
searchKey: server.removeFileOlderThan
tags: [function private]
```

```Go
func removeFileOlderThan(path string, maxAge time.Duration) error
```

removeFileOlderThan removes path if its mtime is older than maxAge. If the file is missing, no error is returned. 

### <a id="renameAndSync" href="#renameAndSync">func renameAndSync(oldpath, newpath string) error</a>

```
searchKey: server.renameAndSync
tags: [function private]
```

```Go
func renameAndSync(oldpath, newpath string) error
```

renameAndSync will do an os.Rename followed by fsync to ensure the rename is recorded 

### <a id="runCmd" href="#runCmd">func runCmd(t *testing.T, dir string, cmd string, arg ...string) string</a>

```
searchKey: server.runCmd
tags: [function private]
```

```Go
func runCmd(t *testing.T, dir string, cmd string, arg ...string) string
```

### <a id="runCommand" href="#runCommand">func runCommand(ctx context.Context, cmd *exec.Cmd) (exitCode int, err error)</a>

```
searchKey: server.runCommand
tags: [function private]
```

```Go
func runCommand(ctx context.Context, cmd *exec.Cmd) (exitCode int, err error)
```

runCommand runs the command and returns the exit status. All clients of this function should set the context in cmd themselves, but we have to pass the context separately here for the sake of tracing. 

### <a id="runWith" href="#runWith">func runWith(ctx context.Context, cmd *exec.Cmd, configRemoteOpts bool, progress io.Writer) ([]byte, error)</a>

```
searchKey: server.runWith
tags: [function private]
```

```Go
func runWith(ctx context.Context, cmd *exec.Cmd, configRemoteOpts bool, progress io.Writer) ([]byte, error)
```

runWithRemoteOpts runs the command after applying the remote options. If progress is not nil, all output is written to it in a separate goroutine. 

### <a id="runWithRemoteOpts" href="#runWithRemoteOpts">func runWithRemoteOpts(ctx context.Context, cmd *exec.Cmd, progress io.Writer) ([]byte, error)</a>

```
searchKey: server.runWithRemoteOpts
tags: [function private]
```

```Go
func runWithRemoteOpts(ctx context.Context, cmd *exec.Cmd, progress io.Writer) ([]byte, error)
```

### <a id="scanCRLF" href="#scanCRLF">func scanCRLF(data []byte, atEOF bool) (advance int, token []byte, err error)</a>

```
searchKey: server.scanCRLF
tags: [function private]
```

```Go
func scanCRLF(data []byte, atEOF bool) (advance int, token []byte, err error)
```

scanCRLF is similar to bufio.ScanLines except it splits on both '\r' and '\n' and it does not return tokens that contain only whitespace. 

### <a id="setGitAttributes" href="#setGitAttributes">func setGitAttributes(dir GitDir) error</a>

```
searchKey: server.setGitAttributes
tags: [function private]
```

```Go
func setGitAttributes(dir GitDir) error
```

setGitAttributes writes our global gitattributes to gitDir/info/attributes. This will override .gitattributes inside of repositories. It is used to unset attributes such as export-ignore. 

### <a id="setHEAD" href="#setHEAD">func setHEAD(ctx context.Context, dir GitDir, syncer VCSSyncer, repo api.RepoName, remoteURL *vcs.URL) error</a>

```
searchKey: server.setHEAD
tags: [function private]
```

```Go
func setHEAD(ctx context.Context, dir GitDir, syncer VCSSyncer, repo api.RepoName, remoteURL *vcs.URL) error
```

setHEAD configures git repo defaults (such as what HEAD is) which are needed for git commands to work. 

### <a id="setLastChanged" href="#setLastChanged">func setLastChanged(dir GitDir) error</a>

```
searchKey: server.setLastChanged
tags: [function private]
```

```Go
func setLastChanged(dir GitDir) error
```

setLastChanged discerns an approximate last-changed timestamp for a repository. This can be approximate; it's used to determine how often we should run `git fetch`, but is not relied on strongly. The basic plan is as follows: If a repository has never had a timestamp before, we guess that the right stamp is *probably* the timestamp of the most chronologically-recent commit. If there are no commits, we just use the current time because that's probably usually a temporary state. 

If a timestamp already exists, we want to update it if and only if the set of references (as determined by `git show-ref`) has changed. 

To accomplish this, we assert that the file `sg_refhash` in the git directory should, if it exists, contain a hash of the output of `git show-ref`, and have a timestamp of "the last time this changed", except that if we're creating that file for the first time, we set it to the timestamp of the top commit. We then compute the hash of the show-ref output, and store it in the file if and only if it's different from the current contents. 

If show-ref fails, we use rev-list to determine whether that's just an empty repository (not an error) or some kind of actual error that is possibly causing our data to be incorrect, which should be reported. 

### <a id="setRecloneTime" href="#setRecloneTime">func setRecloneTime(dir GitDir, now time.Time) error</a>

```
searchKey: server.setRecloneTime
tags: [function private]
```

```Go
func setRecloneTime(dir GitDir, now time.Time) error
```

setRecloneTime sets the time a repository is cloned. 

### <a id="setRepositoryType" href="#setRepositoryType">func setRepositoryType(dir GitDir, typ string) error</a>

```
searchKey: server.setRepositoryType
tags: [function private]
```

```Go
func setRepositoryType(dir GitDir, typ string) error
```

setRepositoryType sets the type of the repository. 

### <a id="shortGitCommandSlow" href="#shortGitCommandSlow">func shortGitCommandSlow(args []string) time.Duration</a>

```
searchKey: server.shortGitCommandSlow
tags: [function private]
```

```Go
func shortGitCommandSlow(args []string) time.Duration
```

shortGitCommandSlow returns the threshold for regarding an git command as slow. Some commands such as "git archive" are inherently slower than "git rev-parse", so this will return an appropriate threshold given the command. 

### <a id="shortGitCommandTimeout" href="#shortGitCommandTimeout">func shortGitCommandTimeout(args []string) time.Duration</a>

```
searchKey: server.shortGitCommandTimeout
tags: [function private]
```

```Go
func shortGitCommandTimeout(args []string) time.Duration
```

shortGitCommandTimeout returns the timeout for git commands that should not take a long time. Some commands such as "git archive" are allowed more time than "git rev-parse", so this will return an appropriate timeout given the command. 

### <a id="staticGetRemoteURL" href="#staticGetRemoteURL">func staticGetRemoteURL(remote string) func(context.Context, api.RepoName) (string, error)</a>

```
searchKey: server.staticGetRemoteURL
tags: [function private]
```

```Go
func staticGetRemoteURL(remote string) func(context.Context, api.RepoName) (string, error)
```

### <a id="updateFileIfDifferent" href="#updateFileIfDifferent">func updateFileIfDifferent(path string, content []byte) (bool, error)</a>

```
searchKey: server.updateFileIfDifferent
tags: [function private]
```

```Go
func updateFileIfDifferent(path string, content []byte) (bool, error)
```

updateFileIfDifferent will atomically update the file if the contents are different. If it does an update ok is true. 

### <a id="useRefspecOverrides" href="#useRefspecOverrides">func useRefspecOverrides() bool</a>

```
searchKey: server.useRefspecOverrides
tags: [function private]
```

```Go
func useRefspecOverrides() bool
```

HACK(keegancsmith) workaround to experiment with cloning less in a large monorepo. [https://github.com/sourcegraph/customer/issues/19](https://github.com/sourcegraph/customer/issues/19) 

### <a id="wrapCmdError" href="#wrapCmdError">func wrapCmdError(cmd *exec.Cmd, err error) error</a>

```
searchKey: server.wrapCmdError
tags: [function private]
```

```Go
func wrapCmdError(cmd *exec.Cmd, err error) error
```

wrapCmdError will wrap errors for cmd to include the arguments. If the error is an exec.ExitError and cmd was invoked with Output(), it will also include the captured stderr. 

### <a id="writeFile" href="#writeFile">func writeFile(t *testing.T, path string, content []byte)</a>

```
searchKey: server.writeFile
tags: [function private]
```

```Go
func writeFile(t *testing.T, path string, content []byte)
```

### <a id="writeTempFile" href="#writeTempFile">func writeTempFile(pattern string, data []byte) (path string, err error)</a>

```
searchKey: server.writeTempFile
tags: [function private]
```

```Go
func writeTempFile(pattern string, data []byte) (path string, err error)
```

writeTempFile writes data to the TempFile with pattern. Returns the path of the tempfile. 

