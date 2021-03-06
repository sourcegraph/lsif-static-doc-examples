# Package shared

Package shared provides the entrypoint to Sourcegraph's single docker image. It has functionality to setup the shared environment variables, as well as create the Procfile for goreman to run. 

## Index

* Subpages
  * [cmd/server/shared/assets](shared/assets.md)
* [Constants](#const)
    * [const FrontendInternalHost](#FrontendInternalHost)
    * [const grafanaProcLine](#grafanaProcLine)
    * [const jaegerProcLine](#jaegerProcLine)
    * [const prometheusProcLine](#prometheusProcLine)
* [Variables](#var)
    * [var DataDir](#DataDir)
    * [var DefaultEnv](#DefaultEnv)
    * [var ProcfileAdditions](#ProcfileAdditions)
    * [var SrcProfServices](#SrcProfServices)
    * [var databases](#databases)
    * [var logLevelConverter](#logLevelConverter)
    * [var redisCacheConfTmpl](#redisCacheConfTmpl)
    * [var redisStoreConfTmpl](#redisStoreConfTmpl)
    * [var verbose](#verbose)
* [Types](#type)
    * [type errorFilter func(err error, out string) bool](#errorFilter)
    * [type execer struct](#execer)
        * [func (e *execer) Command(name string, arg ...string)](#execer.Command)
        * [func (e *execer) CommandWithFilter(errorFilter errorFilter, name string, arg ...string)](#execer.CommandWithFilter)
        * [func (e execer) Error() error](#execer.Error)
        * [func (e *execer) Run(cmd *exec.Cmd)](#execer.Run)
        * [func (e *execer) RunWithFilter(errorFilter errorFilter, cmd *exec.Cmd)](#execer.RunWithFilter)
    * [type redisProcfileConfig struct](#redisProcfileConfig)
    * [type yesReader struct](#yesReader)
        * [func (r *yesReader) Read(p []byte) (int, error)](#yesReader.Read)
* [Functions](#func)
    * [func Main()](#Main)
    * [func SetDefaultEnv(k, v string) string](#SetDefaultEnv)
    * [func TestMain(m *testing.M)](#TestMain)
    * [func TestNginx(t *testing.T)](#TestNginx)
    * [func TestRedisFixAOF(t *testing.T)](#TestRedisFixAOF)
    * [func TestYesReader(t *testing.T)](#TestYesReader)
    * [func convertLogLevel(level string) string](#convertLogLevel)
    * [func copyConfigs() error](#copyConfigs)
    * [func copySSH() error](#copySSH)
    * [func defaultErrorFilter(err error, out string) bool](#defaultErrorFilter)
    * [func fileExists(path string) (bool, error)](#fileExists)
    * [func isPostgresConfigured(prefix string) bool](#isPostgresConfigured)
    * [func maybeMinio() []string](#maybeMinio)
    * [func maybeMonitoring() ([]string, error)](#maybeMonitoring)
    * [func maybePostgresProcFile() (string, error)](#maybePostgresProcFile)
    * [func maybeRedisCacheProcFile() (string, error)](#maybeRedisCacheProcFile)
    * [func maybeRedisProcFile(c redisProcfileConfig) (string, error)](#maybeRedisProcFile)
    * [func maybeRedisStoreProcFile() (string, error)](#maybeRedisStoreProcFile)
    * [func maybeZoektProcFile() []string](#maybeZoektProcFile)
    * [func nginxProcFile() (string, error)](#nginxProcFile)
    * [func nginxWriteFiles(configDir string) (string, error)](#nginxWriteFiles)
    * [func pgPrintf(format string, args ...interface{})](#pgPrintf)
    * [func postgresProcfile() (string, error)](#postgresProcfile)
    * [func redisCmd(out io.Writer, parts ...string)](#redisCmd)
    * [func redisFixAOF(rootDataDir string, c redisProcfileConfig)](#redisFixAOF)
    * [func redisProcFileEntry(name, conf string) string](#redisProcFileEntry)
    * [func tryCreateRedisConf(c redisProcfileConfig) (string, error)](#tryCreateRedisConf)


## <a id="const" href="#const">Constants</a>

### <a id="FrontendInternalHost" href="#FrontendInternalHost">const FrontendInternalHost</a>

```
searchKey: shared.FrontendInternalHost
tags: [constant string]
```

```Go
const FrontendInternalHost = "127.0.0.1:3090"
```

FrontendInternalHost is the value of SRC_FRONTEND_INTERNAL. 

### <a id="grafanaProcLine" href="#grafanaProcLine">const grafanaProcLine</a>

```
searchKey: shared.grafanaProcLine
tags: [constant string private]
```

```Go
const grafanaProcLine = ...
```

### <a id="jaegerProcLine" href="#jaegerProcLine">const jaegerProcLine</a>

```
searchKey: shared.jaegerProcLine
tags: [constant string private]
```

```Go
const jaegerProcLine = ...
```

### <a id="prometheusProcLine" href="#prometheusProcLine">const prometheusProcLine</a>

```
searchKey: shared.prometheusProcLine
tags: [constant string private]
```

```Go
const prometheusProcLine = ...
```

## <a id="var" href="#var">Variables</a>

### <a id="DataDir" href="#DataDir">var DataDir</a>

```
searchKey: shared.DataDir
tags: [variable string]
```

```Go
var DataDir = SetDefaultEnv("DATA_DIR", "/var/opt/sourcegraph")
```

DataDir is the root directory for storing persistent data. It should NOT be modified by any external package. 

### <a id="DefaultEnv" href="#DefaultEnv">var DefaultEnv</a>

```
searchKey: shared.DefaultEnv
tags: [variable object]
```

```Go
var DefaultEnv = ...
```

DefaultEnv is environment variables that will be set if not already set. 

If it is modified by an external package, it must be modified immediately on startup, before `shared.Main` is called. 

### <a id="ProcfileAdditions" href="#ProcfileAdditions">var ProcfileAdditions</a>

```
searchKey: shared.ProcfileAdditions
tags: [variable array string]
```

```Go
var ProcfileAdditions []string
```

ProcfileAdditions is a list of Procfile lines that should be added to the emitted Procfile that defines the services configuration. 

If it is modified by an external package, it must be modified immediately on startup, before `shared.Main` is called. 

### <a id="SrcProfServices" href="#SrcProfServices">var SrcProfServices</a>

```
searchKey: shared.SrcProfServices
tags: [variable array object]
```

```Go
var SrcProfServices = ...
```

SrcProfServices defines the default value for SRC_PROF_SERVICES. 

If it is modified by an external package, it must be modified immediately on startup, before `shared.Main` is called. 

This should be kept in sync with dev/src-prof-services.json. 

### <a id="databases" href="#databases">var databases</a>

```
searchKey: shared.databases
tags: [variable object private]
```

```Go
var databases = ...
```

### <a id="logLevelConverter" href="#logLevelConverter">var logLevelConverter</a>

```
searchKey: shared.logLevelConverter
tags: [variable object private]
```

```Go
var logLevelConverter = ...
```

### <a id="redisCacheConfTmpl" href="#redisCacheConfTmpl">var redisCacheConfTmpl</a>

```
searchKey: shared.redisCacheConfTmpl
tags: [variable struct private]
```

```Go
var redisCacheConfTmpl = ...
```

### <a id="redisStoreConfTmpl" href="#redisStoreConfTmpl">var redisStoreConfTmpl</a>

```
searchKey: shared.redisStoreConfTmpl
tags: [variable struct private]
```

```Go
var redisStoreConfTmpl = ...
```

### <a id="verbose" href="#verbose">var verbose</a>

```
searchKey: shared.verbose
tags: [variable boolean private]
```

```Go
var verbose = os.Getenv("SRC_LOG_LEVEL") == "dbug" || os.Getenv("SRC_LOG_LEVEL") == "info"
```

Set verbosity based on simple interpretation of env var to avoid external dependencies (such as on github.com/sourcegraph/sourcegraph/internal/env). 

## <a id="type" href="#type">Types</a>

### <a id="errorFilter" href="#errorFilter">type errorFilter func(err error, out string) bool</a>

```
searchKey: shared.errorFilter
tags: [function private]
```

```Go
type errorFilter func(err error, out string) bool
```

### <a id="execer" href="#execer">type execer struct</a>

```
searchKey: shared.execer
tags: [struct private]
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
tags: [method private]
```

```Go
func (e *execer) Command(name string, arg ...string)
```

Command creates an exec.Command connected to stdout/stderr and runs it. 

#### <a id="execer.CommandWithFilter" href="#execer.CommandWithFilter">func (e *execer) CommandWithFilter(errorFilter errorFilter, name string, arg ...string)</a>

```
searchKey: shared.execer.CommandWithFilter
tags: [method private]
```

```Go
func (e *execer) CommandWithFilter(errorFilter errorFilter, name string, arg ...string)
```

CommandWithFilter is like Command but will not set an error on the command object if the given error filter returns false. The command filter is given both the (non-nil) error value and the output of the command. 

#### <a id="execer.Error" href="#execer.Error">func (e execer) Error() error</a>

```
searchKey: shared.execer.Error
tags: [method private]
```

```Go
func (e execer) Error() error
```

Error returns the first error encountered. 

#### <a id="execer.Run" href="#execer.Run">func (e *execer) Run(cmd *exec.Cmd)</a>

```
searchKey: shared.execer.Run
tags: [method private]
```

```Go
func (e *execer) Run(cmd *exec.Cmd)
```

#### <a id="execer.RunWithFilter" href="#execer.RunWithFilter">func (e *execer) RunWithFilter(errorFilter errorFilter, cmd *exec.Cmd)</a>

```
searchKey: shared.execer.RunWithFilter
tags: [method private]
```

```Go
func (e *execer) RunWithFilter(errorFilter errorFilter, cmd *exec.Cmd)
```

RunWithFilter is like Run but will not set an error on the command object if the given error filter returns false. The command filter is given both the (non-nil) error value and the output of the command. 

### <a id="redisProcfileConfig" href="#redisProcfileConfig">type redisProcfileConfig struct</a>

```
searchKey: shared.redisProcfileConfig
tags: [struct private]
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
tags: [struct private]
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
tags: [method private]
```

```Go
func (r *yesReader) Read(p []byte) (int, error)
```

## <a id="func" href="#func">Functions</a>

### <a id="Main" href="#Main">func Main()</a>

```
searchKey: shared.Main
tags: [function]
```

```Go
func Main()
```

Main is the main server command function which is shared between Sourcegraph server's open-source and enterprise variant. 

### <a id="SetDefaultEnv" href="#SetDefaultEnv">func SetDefaultEnv(k, v string) string</a>

```
searchKey: shared.SetDefaultEnv
tags: [function]
```

```Go
func SetDefaultEnv(k, v string) string
```

SetDefaultEnv will set the environment variable if it is not set. 

### <a id="TestMain" href="#TestMain">func TestMain(m *testing.M)</a>

```
searchKey: shared.TestMain
tags: [function private test]
```

```Go
func TestMain(m *testing.M)
```

### <a id="TestNginx" href="#TestNginx">func TestNginx(t *testing.T)</a>

```
searchKey: shared.TestNginx
tags: [function private test]
```

```Go
func TestNginx(t *testing.T)
```

### <a id="TestRedisFixAOF" href="#TestRedisFixAOF">func TestRedisFixAOF(t *testing.T)</a>

```
searchKey: shared.TestRedisFixAOF
tags: [function private test]
```

```Go
func TestRedisFixAOF(t *testing.T)
```

### <a id="TestYesReader" href="#TestYesReader">func TestYesReader(t *testing.T)</a>

```
searchKey: shared.TestYesReader
tags: [function private test]
```

```Go
func TestYesReader(t *testing.T)
```

### <a id="convertLogLevel" href="#convertLogLevel">func convertLogLevel(level string) string</a>

```
searchKey: shared.convertLogLevel
tags: [function private]
```

```Go
func convertLogLevel(level string) string
```

convertLogLevel converts a sourcegraph log level (dbug, info, warn, error, crit) into values postgres exporter accepts (debug, info, warn, error, fatal) If value cannot be converted returns "warn" which seems like a good middle-ground. 

### <a id="copyConfigs" href="#copyConfigs">func copyConfigs() error</a>

```
searchKey: shared.copyConfigs
tags: [function private]
```

```Go
func copyConfigs() error
```

copyConfigs will copy /etc/sourcegraph/{netrc,gitconfig} to locations read by other tools. 

### <a id="copySSH" href="#copySSH">func copySSH() error</a>

```
searchKey: shared.copySSH
tags: [function private]
```

```Go
func copySSH() error
```

copySSH will copy the files at /etc/sourcegraph/ssh and put them into ~/.ssh 

### <a id="defaultErrorFilter" href="#defaultErrorFilter">func defaultErrorFilter(err error, out string) bool</a>

```
searchKey: shared.defaultErrorFilter
tags: [function private]
```

```Go
func defaultErrorFilter(err error, out string) bool
```

### <a id="fileExists" href="#fileExists">func fileExists(path string) (bool, error)</a>

```
searchKey: shared.fileExists
tags: [function private]
```

```Go
func fileExists(path string) (bool, error)
```

### <a id="isPostgresConfigured" href="#isPostgresConfigured">func isPostgresConfigured(prefix string) bool</a>

```
searchKey: shared.isPostgresConfigured
tags: [function private]
```

```Go
func isPostgresConfigured(prefix string) bool
```

### <a id="maybeMinio" href="#maybeMinio">func maybeMinio() []string</a>

```
searchKey: shared.maybeMinio
tags: [function private]
```

```Go
func maybeMinio() []string
```

### <a id="maybeMonitoring" href="#maybeMonitoring">func maybeMonitoring() ([]string, error)</a>

```
searchKey: shared.maybeMonitoring
tags: [function private]
```

```Go
func maybeMonitoring() ([]string, error)
```

### <a id="maybePostgresProcFile" href="#maybePostgresProcFile">func maybePostgresProcFile() (string, error)</a>

```
searchKey: shared.maybePostgresProcFile
tags: [function private]
```

```Go
func maybePostgresProcFile() (string, error)
```

### <a id="maybeRedisCacheProcFile" href="#maybeRedisCacheProcFile">func maybeRedisCacheProcFile() (string, error)</a>

```
searchKey: shared.maybeRedisCacheProcFile
tags: [function private]
```

```Go
func maybeRedisCacheProcFile() (string, error)
```

### <a id="maybeRedisProcFile" href="#maybeRedisProcFile">func maybeRedisProcFile(c redisProcfileConfig) (string, error)</a>

```
searchKey: shared.maybeRedisProcFile
tags: [function private]
```

```Go
func maybeRedisProcFile(c redisProcfileConfig) (string, error)
```

### <a id="maybeRedisStoreProcFile" href="#maybeRedisStoreProcFile">func maybeRedisStoreProcFile() (string, error)</a>

```
searchKey: shared.maybeRedisStoreProcFile
tags: [function private]
```

```Go
func maybeRedisStoreProcFile() (string, error)
```

### <a id="maybeZoektProcFile" href="#maybeZoektProcFile">func maybeZoektProcFile() []string</a>

```
searchKey: shared.maybeZoektProcFile
tags: [function private]
```

```Go
func maybeZoektProcFile() []string
```

### <a id="nginxProcFile" href="#nginxProcFile">func nginxProcFile() (string, error)</a>

```
searchKey: shared.nginxProcFile
tags: [function private]
```

```Go
func nginxProcFile() (string, error)
```

nginxProcFile will return a procfile entry for nginx, as well as setup configuration for it. 

### <a id="nginxWriteFiles" href="#nginxWriteFiles">func nginxWriteFiles(configDir string) (string, error)</a>

```
searchKey: shared.nginxWriteFiles
tags: [function private]
```

```Go
func nginxWriteFiles(configDir string) (string, error)
```

nginxWriteFiles writes the nginx related configuration files to configDir. It returns the path to the main nginx.conf. 

### <a id="pgPrintf" href="#pgPrintf">func pgPrintf(format string, args ...interface{})</a>

```
searchKey: shared.pgPrintf
tags: [function private]
```

```Go
func pgPrintf(format string, args ...interface{})
```

### <a id="postgresProcfile" href="#postgresProcfile">func postgresProcfile() (string, error)</a>

```
searchKey: shared.postgresProcfile
tags: [function private]
```

```Go
func postgresProcfile() (string, error)
```

### <a id="redisCmd" href="#redisCmd">func redisCmd(out io.Writer, parts ...string)</a>

```
searchKey: shared.redisCmd
tags: [function private]
```

```Go
func redisCmd(out io.Writer, parts ...string)
```

### <a id="redisFixAOF" href="#redisFixAOF">func redisFixAOF(rootDataDir string, c redisProcfileConfig)</a>

```
searchKey: shared.redisFixAOF
tags: [function private]
```

```Go
func redisFixAOF(rootDataDir string, c redisProcfileConfig)
```

redisFixAOF does a best-effort repair of the AOF file in case it is corrupted [https://github.com/sourcegraph/sourcegraph/issues/651](https://github.com/sourcegraph/sourcegraph/issues/651) 

### <a id="redisProcFileEntry" href="#redisProcFileEntry">func redisProcFileEntry(name, conf string) string</a>

```
searchKey: shared.redisProcFileEntry
tags: [function private]
```

```Go
func redisProcFileEntry(name, conf string) string
```

### <a id="tryCreateRedisConf" href="#tryCreateRedisConf">func tryCreateRedisConf(c redisProcfileConfig) (string, error)</a>

```
searchKey: shared.tryCreateRedisConf
tags: [function private]
```

```Go
func tryCreateRedisConf(c redisProcfileConfig) (string, error)
```

