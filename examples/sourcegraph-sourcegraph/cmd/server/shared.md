# Package shared

Package shared provides the entrypoint to Sourcegraph's single docker image. It has functionality to setup the shared environment variables, as well as create the Procfile for goreman to run. 

## Index

* Subpages
  * [cmd/server/shared/assets](shared/assets.md)
* [Constants](#const)
    * [const prometheusProcLine](#prometheusProcLine)
    * [const grafanaProcLine](#grafanaProcLine)
    * [const jaegerProcLine](#jaegerProcLine)
    * [const FrontendInternalHost](#FrontendInternalHost)
* [Variables](#var)
    * [var SrcProfServices](#SrcProfServices)
    * [var ProcfileAdditions](#ProcfileAdditions)
    * [var DataDir](#DataDir)
    * [var databases](#databases)
    * [var logLevelConverter](#logLevelConverter)
    * [var redisStoreConfTmpl](#redisStoreConfTmpl)
    * [var redisCacheConfTmpl](#redisCacheConfTmpl)
    * [var DefaultEnv](#DefaultEnv)
    * [var verbose](#verbose)
* [Types](#type)
    * [type execer struct](#execer)
        * [func (e *execer) Command(name string, arg ...string)](#execer.Command)
        * [func (e *execer) Run(cmd *exec.Cmd)](#execer.Run)
        * [func (e *execer) CommandWithFilter(errorFilter errorFilter, name string, arg ...string)](#execer.CommandWithFilter)
        * [func (e *execer) RunWithFilter(errorFilter errorFilter, cmd *exec.Cmd)](#execer.RunWithFilter)
        * [func (e execer) Error() error](#execer.Error)
    * [type errorFilter func(err error, out string) bool](#errorFilter)
    * [type redisProcfileConfig struct](#redisProcfileConfig)
    * [type yesReader struct](#yesReader)
        * [func (r *yesReader) Read(p []byte) (int, error)](#yesReader.Read)
* [Functions](#func)
    * [func SetDefaultEnv(k, v string) string](#SetDefaultEnv)
    * [func copyConfigs() error](#copyConfigs)
    * [func copySSH() error](#copySSH)
    * [func defaultErrorFilter(err error, out string) bool](#defaultErrorFilter)
    * [func maybeMinio() []string](#maybeMinio)
    * [func maybeMonitoring() ([]string, error)](#maybeMonitoring)
    * [func nginxProcFile() (string, error)](#nginxProcFile)
    * [func nginxWriteFiles(configDir string) (string, error)](#nginxWriteFiles)
    * [func maybePostgresProcFile() (string, error)](#maybePostgresProcFile)
    * [func postgresProcfile() (string, error)](#postgresProcfile)
    * [func fileExists(path string) (bool, error)](#fileExists)
    * [func isPostgresConfigured(prefix string) bool](#isPostgresConfigured)
    * [func pgPrintf(format string, args ...interface{})](#pgPrintf)
    * [func convertLogLevel(level string) string](#convertLogLevel)
    * [func maybeRedisStoreProcFile() (string, error)](#maybeRedisStoreProcFile)
    * [func maybeRedisCacheProcFile() (string, error)](#maybeRedisCacheProcFile)
    * [func maybeRedisProcFile(c redisProcfileConfig) (string, error)](#maybeRedisProcFile)
    * [func tryCreateRedisConf(c redisProcfileConfig) (string, error)](#tryCreateRedisConf)
    * [func redisProcFileEntry(name, conf string) string](#redisProcFileEntry)
    * [func redisFixAOF(rootDataDir string, c redisProcfileConfig)](#redisFixAOF)
    * [func Main()](#Main)
    * [func maybeZoektProcFile() []string](#maybeZoektProcFile)
    * [func TestNginx(t *testing.T)](#TestNginx)
    * [func TestRedisFixAOF(t *testing.T)](#TestRedisFixAOF)
    * [func redisCmd(out io.Writer, parts ...string)](#redisCmd)
    * [func TestYesReader(t *testing.T)](#TestYesReader)
    * [func TestMain(m *testing.M)](#TestMain)


## <a id="const" href="#const">Constants</a>

```
tags: [exported]
```

### <a id="prometheusProcLine" href="#prometheusProcLine">const prometheusProcLine</a>

```
searchKey: shared.prometheusProcLine
```

```Go
const prometheusProcLine = ...
```

### <a id="grafanaProcLine" href="#grafanaProcLine">const grafanaProcLine</a>

```
searchKey: shared.grafanaProcLine
```

```Go
const grafanaProcLine = ...
```

### <a id="jaegerProcLine" href="#jaegerProcLine">const jaegerProcLine</a>

```
searchKey: shared.jaegerProcLine
```

```Go
const jaegerProcLine = ...
```

### <a id="FrontendInternalHost" href="#FrontendInternalHost">const FrontendInternalHost</a>

```
searchKey: shared.FrontendInternalHost
tags: [exported]
```

```Go
const FrontendInternalHost = "127.0.0.1:3090"
```

FrontendInternalHost is the value of SRC_FRONTEND_INTERNAL. 

## <a id="var" href="#var">Variables</a>

```
tags: [exported]
```

### <a id="SrcProfServices" href="#SrcProfServices">var SrcProfServices</a>

```
searchKey: shared.SrcProfServices
tags: [exported]
```

```Go
var SrcProfServices = ...
```

SrcProfServices defines the default value for SRC_PROF_SERVICES. 

If it is modified by an external package, it must be modified immediately on startup, before `shared.Main` is called. 

This should be kept in sync with dev/src-prof-services.json. 

### <a id="ProcfileAdditions" href="#ProcfileAdditions">var ProcfileAdditions</a>

```
searchKey: shared.ProcfileAdditions
tags: [exported]
```

```Go
var ProcfileAdditions []string
```

ProcfileAdditions is a list of Procfile lines that should be added to the emitted Procfile that defines the services configuration. 

If it is modified by an external package, it must be modified immediately on startup, before `shared.Main` is called. 

### <a id="DataDir" href="#DataDir">var DataDir</a>

```
searchKey: shared.DataDir
tags: [exported]
```

```Go
var DataDir = SetDefaultEnv("DATA_DIR", "/var/opt/sourcegraph")
```

DataDir is the root directory for storing persistent data. It should NOT be modified by any external package. 

### <a id="databases" href="#databases">var databases</a>

```
searchKey: shared.databases
```

```Go
var databases = ...
```

### <a id="logLevelConverter" href="#logLevelConverter">var logLevelConverter</a>

```
searchKey: shared.logLevelConverter
```

```Go
var logLevelConverter = ...
```

### <a id="redisStoreConfTmpl" href="#redisStoreConfTmpl">var redisStoreConfTmpl</a>

```
searchKey: shared.redisStoreConfTmpl
```

```Go
var redisStoreConfTmpl = ...
```

### <a id="redisCacheConfTmpl" href="#redisCacheConfTmpl">var redisCacheConfTmpl</a>

```
searchKey: shared.redisCacheConfTmpl
```

```Go
var redisCacheConfTmpl = ...
```

### <a id="DefaultEnv" href="#DefaultEnv">var DefaultEnv</a>

```
searchKey: shared.DefaultEnv
tags: [exported]
```

```Go
var DefaultEnv = ...
```

DefaultEnv is environment variables that will be set if not already set. 

If it is modified by an external package, it must be modified immediately on startup, before `shared.Main` is called. 

### <a id="verbose" href="#verbose">var verbose</a>

```
searchKey: shared.verbose
```

```Go
var verbose = os.Getenv("SRC_LOG_LEVEL") == "dbug" || os.Getenv("SRC_LOG_LEVEL") == "info"
```

Set verbosity based on simple interpretation of env var to avoid external dependencies (such as on github.com/sourcegraph/sourcegraph/internal/env). 

## <a id="type" href="#type">Types</a>

```
tags: [exported]
```

### <a id="execer" href="#execer">type execer struct</a>

```
searchKey: shared.execer
```

```Go
type execer struct {
	// Out if set will write the command, stdout and stderr to it
	Out io.Writer
	// Working directory of the command.
	Dir string

	err error
}
```

execer wraps exec.Command, but acts like "set -x". If a command fails, all future commands will return the original error. 

#### <a id="execer.Command" href="#execer.Command">func (e *execer) Command(name string, arg ...string)</a>

```
searchKey: shared.execer.Command
```

```Go
func (e *execer) Command(name string, arg ...string)
```

Command creates an exec.Command connected to stdout/stderr and runs it. 

#### <a id="execer.Run" href="#execer.Run">func (e *execer) Run(cmd *exec.Cmd)</a>

```
searchKey: shared.execer.Run
```

```Go
func (e *execer) Run(cmd *exec.Cmd)
```

#### <a id="execer.CommandWithFilter" href="#execer.CommandWithFilter">func (e *execer) CommandWithFilter(errorFilter errorFilter, name string, arg ...string)</a>

```
searchKey: shared.execer.CommandWithFilter
```

```Go
func (e *execer) CommandWithFilter(errorFilter errorFilter, name string, arg ...string)
```

CommandWithFilter is like Command but will not set an error on the command object if the given error filter returns false. The command filter is given both the (non-nil) error value and the output of the command. 

#### <a id="execer.RunWithFilter" href="#execer.RunWithFilter">func (e *execer) RunWithFilter(errorFilter errorFilter, cmd *exec.Cmd)</a>

```
searchKey: shared.execer.RunWithFilter
```

```Go
func (e *execer) RunWithFilter(errorFilter errorFilter, cmd *exec.Cmd)
```

RunWithFilter is like Run but will not set an error on the command object if the given error filter returns false. The command filter is given both the (non-nil) error value and the output of the command. 

#### <a id="execer.Error" href="#execer.Error">func (e execer) Error() error</a>

```
searchKey: shared.execer.Error
```

```Go
func (e execer) Error() error
```

Error returns the first error encountered. 

### <a id="errorFilter" href="#errorFilter">type errorFilter func(err error, out string) bool</a>

```
searchKey: shared.errorFilter
```

```Go
type errorFilter func(err error, out string) bool
```

### <a id="redisProcfileConfig" href="#redisProcfileConfig">type redisProcfileConfig struct</a>

```
searchKey: shared.redisProcfileConfig
```

```Go
type redisProcfileConfig struct {
	envVar  string
	name    string
	port    string
	tmpl    *template.Template
	dataDir string
}
```

### <a id="yesReader" href="#yesReader">type yesReader struct</a>

```
searchKey: shared.yesReader
```

```Go
type yesReader struct {
	Expletive []byte
	offset    int
}
```

yesReader simulates the output of the "yes" command. 

It is equivalent to bytes.NewReader(bytes.Repeat(Expletive, infinity)) 

#### <a id="yesReader.Read" href="#yesReader.Read">func (r *yesReader) Read(p []byte) (int, error)</a>

```
searchKey: shared.yesReader.Read
```

```Go
func (r *yesReader) Read(p []byte) (int, error)
```

## <a id="func" href="#func">Functions</a>

```
tags: [exported]
```

### <a id="SetDefaultEnv" href="#SetDefaultEnv">func SetDefaultEnv(k, v string) string</a>

```
searchKey: shared.SetDefaultEnv
tags: [exported]
```

```Go
func SetDefaultEnv(k, v string) string
```

SetDefaultEnv will set the environment variable if it is not set. 

### <a id="copyConfigs" href="#copyConfigs">func copyConfigs() error</a>

```
searchKey: shared.copyConfigs
```

```Go
func copyConfigs() error
```

copyConfigs will copy /etc/sourcegraph/{netrc,gitconfig} to locations read by other tools. 

### <a id="copySSH" href="#copySSH">func copySSH() error</a>

```
searchKey: shared.copySSH
```

```Go
func copySSH() error
```

copySSH will copy the files at /etc/sourcegraph/ssh and put them into ~/.ssh 

### <a id="defaultErrorFilter" href="#defaultErrorFilter">func defaultErrorFilter(err error, out string) bool</a>

```
searchKey: shared.defaultErrorFilter
```

```Go
func defaultErrorFilter(err error, out string) bool
```

### <a id="maybeMinio" href="#maybeMinio">func maybeMinio() []string</a>

```
searchKey: shared.maybeMinio
```

```Go
func maybeMinio() []string
```

### <a id="maybeMonitoring" href="#maybeMonitoring">func maybeMonitoring() ([]string, error)</a>

```
searchKey: shared.maybeMonitoring
```

```Go
func maybeMonitoring() ([]string, error)
```

### <a id="nginxProcFile" href="#nginxProcFile">func nginxProcFile() (string, error)</a>

```
searchKey: shared.nginxProcFile
```

```Go
func nginxProcFile() (string, error)
```

nginxProcFile will return a procfile entry for nginx, as well as setup configuration for it. 

### <a id="nginxWriteFiles" href="#nginxWriteFiles">func nginxWriteFiles(configDir string) (string, error)</a>

```
searchKey: shared.nginxWriteFiles
```

```Go
func nginxWriteFiles(configDir string) (string, error)
```

nginxWriteFiles writes the nginx related configuration files to configDir. It returns the path to the main nginx.conf. 

### <a id="maybePostgresProcFile" href="#maybePostgresProcFile">func maybePostgresProcFile() (string, error)</a>

```
searchKey: shared.maybePostgresProcFile
```

```Go
func maybePostgresProcFile() (string, error)
```

### <a id="postgresProcfile" href="#postgresProcfile">func postgresProcfile() (string, error)</a>

```
searchKey: shared.postgresProcfile
```

```Go
func postgresProcfile() (string, error)
```

### <a id="fileExists" href="#fileExists">func fileExists(path string) (bool, error)</a>

```
searchKey: shared.fileExists
```

```Go
func fileExists(path string) (bool, error)
```

### <a id="isPostgresConfigured" href="#isPostgresConfigured">func isPostgresConfigured(prefix string) bool</a>

```
searchKey: shared.isPostgresConfigured
```

```Go
func isPostgresConfigured(prefix string) bool
```

### <a id="pgPrintf" href="#pgPrintf">func pgPrintf(format string, args ...interface{})</a>

```
searchKey: shared.pgPrintf
```

```Go
func pgPrintf(format string, args ...interface{})
```

### <a id="convertLogLevel" href="#convertLogLevel">func convertLogLevel(level string) string</a>

```
searchKey: shared.convertLogLevel
```

```Go
func convertLogLevel(level string) string
```

convertLogLevel converts a sourcegraph log level (dbug, info, warn, error, crit) into values postgres exporter accepts (debug, info, warn, error, fatal) If value cannot be converted returns "warn" which seems like a good middle-ground. 

### <a id="maybeRedisStoreProcFile" href="#maybeRedisStoreProcFile">func maybeRedisStoreProcFile() (string, error)</a>

```
searchKey: shared.maybeRedisStoreProcFile
```

```Go
func maybeRedisStoreProcFile() (string, error)
```

### <a id="maybeRedisCacheProcFile" href="#maybeRedisCacheProcFile">func maybeRedisCacheProcFile() (string, error)</a>

```
searchKey: shared.maybeRedisCacheProcFile
```

```Go
func maybeRedisCacheProcFile() (string, error)
```

### <a id="maybeRedisProcFile" href="#maybeRedisProcFile">func maybeRedisProcFile(c redisProcfileConfig) (string, error)</a>

```
searchKey: shared.maybeRedisProcFile
```

```Go
func maybeRedisProcFile(c redisProcfileConfig) (string, error)
```

### <a id="tryCreateRedisConf" href="#tryCreateRedisConf">func tryCreateRedisConf(c redisProcfileConfig) (string, error)</a>

```
searchKey: shared.tryCreateRedisConf
```

```Go
func tryCreateRedisConf(c redisProcfileConfig) (string, error)
```

### <a id="redisProcFileEntry" href="#redisProcFileEntry">func redisProcFileEntry(name, conf string) string</a>

```
searchKey: shared.redisProcFileEntry
```

```Go
func redisProcFileEntry(name, conf string) string
```

### <a id="redisFixAOF" href="#redisFixAOF">func redisFixAOF(rootDataDir string, c redisProcfileConfig)</a>

```
searchKey: shared.redisFixAOF
```

```Go
func redisFixAOF(rootDataDir string, c redisProcfileConfig)
```

redisFixAOF does a best-effort repair of the AOF file in case it is corrupted [https://github.com/sourcegraph/sourcegraph/issues/651](https://github.com/sourcegraph/sourcegraph/issues/651) 

### <a id="Main" href="#Main">func Main()</a>

```
searchKey: shared.Main
tags: [exported]
```

```Go
func Main()
```

Main is the main server command function which is shared between Sourcegraph server's open-source and enterprise variant. 

### <a id="maybeZoektProcFile" href="#maybeZoektProcFile">func maybeZoektProcFile() []string</a>

```
searchKey: shared.maybeZoektProcFile
```

```Go
func maybeZoektProcFile() []string
```

### <a id="TestNginx" href="#TestNginx">func TestNginx(t *testing.T)</a>

```
searchKey: shared.TestNginx
```

```Go
func TestNginx(t *testing.T)
```

### <a id="TestRedisFixAOF" href="#TestRedisFixAOF">func TestRedisFixAOF(t *testing.T)</a>

```
searchKey: shared.TestRedisFixAOF
```

```Go
func TestRedisFixAOF(t *testing.T)
```

### <a id="redisCmd" href="#redisCmd">func redisCmd(out io.Writer, parts ...string)</a>

```
searchKey: shared.redisCmd
```

```Go
func redisCmd(out io.Writer, parts ...string)
```

### <a id="TestYesReader" href="#TestYesReader">func TestYesReader(t *testing.T)</a>

```
searchKey: shared.TestYesReader
```

```Go
func TestYesReader(t *testing.T)
```

### <a id="TestMain" href="#TestMain">func TestMain(m *testing.M)</a>

```
searchKey: shared.TestMain
```

```Go
func TestMain(m *testing.M)
```

