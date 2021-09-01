# Package cgi

Package cgi implements CGI (Common Gateway Interface) as specified in RFC 3875. 

Note that using CGI means starting a new process to handle each request, which is typically less efficient than using a long-running server. This package is intended primarily for compatibility with existing systems. 

## Index

* [Variables](#var)
    * [var cgiTested](#cgiTested)
    * [var cgiWorks](#cgiWorks)
    * [var osDefaultInheritEnv](#osDefaultInheritEnv)
    * [var testHookStartProcess](#testHookStartProcess)
    * [var trailingPort](#trailingPort)
* [Types](#type)
    * [type Handler struct](#Handler)
        * [func (h *Handler) ServeHTTP(rw http.ResponseWriter, req *http.Request)](#Handler.ServeHTTP)
        * [func (h *Handler) handleInternalRedirect(rw http.ResponseWriter, req *http.Request, path string)](#Handler.handleInternalRedirect)
        * [func (h *Handler) printf(format string, v ...interface{})](#Handler.printf)
        * [func (h *Handler) stderr() io.Writer](#Handler.stderr)
    * [type customWriterRecorder struct](#customWriterRecorder)
        * [func (r *customWriterRecorder) Write(p []byte) (n int, err error)](#customWriterRecorder.Write)
    * [type limitWriter struct](#limitWriter)
        * [func (w *limitWriter) Write(p []byte) (n int, err error)](#limitWriter.Write)
    * [type neverEnding byte](#neverEnding)
        * [func (b neverEnding) Read(p []byte) (n int, err error)](#neverEnding.Read)
    * [type response struct](#response)
        * [func (r *response) Flush()](#response.Flush)
        * [func (r *response) Header() http.Header](#response.Header)
        * [func (r *response) Write(p []byte) (n int, err error)](#response.Write)
        * [func (r *response) WriteHeader(code int)](#response.WriteHeader)
        * [func (r *response) writeCGIHeader(p []byte)](#response.writeCGIHeader)
* [Functions](#func)
    * [func Request() (*http.Request, error)](#Request)
    * [func RequestFromMap(params map[string]string) (*http.Request, error)](#RequestFromMap)
    * [func Serve(handler http.Handler) error](#Serve)
    * [func Test500WithEmptyHeaders(t *testing.T)](#Test500WithEmptyHeaders)
    * [func Test500WithNoContentType(t *testing.T)](#Test500WithNoContentType)
    * [func Test500WithNoHeaders(t *testing.T)](#Test500WithNoHeaders)
    * [func TestBeChildCGIProcess(t *testing.T)](#TestBeChildCGIProcess)
    * [func TestCGIBasicGet(t *testing.T)](#TestCGIBasicGet)
    * [func TestCGIBasicGetAbsPath(t *testing.T)](#TestCGIBasicGetAbsPath)
    * [func TestCGIBasicPost(t *testing.T)](#TestCGIBasicPost)
    * [func TestCGIEnvIPv6(t *testing.T)](#TestCGIEnvIPv6)
    * [func TestCGIPostChunked(t *testing.T)](#TestCGIPostChunked)
    * [func TestChildContentType(t *testing.T)](#TestChildContentType)
    * [func TestChildOnlyHeaders(t *testing.T)](#TestChildOnlyHeaders)
    * [func TestCopyError(t *testing.T)](#TestCopyError)
    * [func TestDirUnix(t *testing.T)](#TestDirUnix)
    * [func TestDirWindows(t *testing.T)](#TestDirWindows)
    * [func TestDropProxyHeader(t *testing.T)](#TestDropProxyHeader)
    * [func TestDupHeaders(t *testing.T)](#TestDupHeaders)
    * [func TestEnvOverride(t *testing.T)](#TestEnvOverride)
    * [func TestHandlerStderr(t *testing.T)](#TestHandlerStderr)
    * [func TestHostingOurselves(t *testing.T)](#TestHostingOurselves)
    * [func TestInternalRedirect(t *testing.T)](#TestInternalRedirect)
    * [func TestKillChildAfterCopyError(t *testing.T)](#TestKillChildAfterCopyError)
    * [func TestNilRequestBody(t *testing.T)](#TestNilRequestBody)
    * [func TestPathInfo(t *testing.T)](#TestPathInfo)
    * [func TestPathInfoDirRoot(t *testing.T)](#TestPathInfoDirRoot)
    * [func TestPathInfoNoRoot(t *testing.T)](#TestPathInfoNoRoot)
    * [func TestRedirect(t *testing.T)](#TestRedirect)
    * [func TestRemoveLeadingDuplicates(t *testing.T)](#TestRemoveLeadingDuplicates)
    * [func TestRequest(t *testing.T)](#TestRequest)
    * [func TestRequestWithTLS(t *testing.T)](#TestRequestWithTLS)
    * [func TestRequestWithoutHost(t *testing.T)](#TestRequestWithoutHost)
    * [func TestRequestWithoutRemotePort(t *testing.T)](#TestRequestWithoutRemotePort)
    * [func TestRequestWithoutRequestURI(t *testing.T)](#TestRequestWithoutRequestURI)
    * [func TestResponse(t *testing.T)](#TestResponse)
    * [func check(t *testing.T)](#check)
    * [func chunk(s string) string](#chunk)
    * [func envMap(env []string) map[string]string](#envMap)
    * [func findPerl(t *testing.T) string](#findPerl)
    * [func isProcessRunning(pid int) bool](#isProcessRunning)
    * [func newRequest(httpreq string) *http.Request](#newRequest)
    * [func removeLeadingDuplicates(env []string) (ret []string)](#removeLeadingDuplicates)
    * [func runCgiTest(t *testing.T, h *Handler,...](#runCgiTest)
    * [func runResponseChecks(t *testing.T, rw *httptest.ResponseRecorder,...](#runResponseChecks)
    * [func upperCaseAndUnderscore(r rune) rune](#upperCaseAndUnderscore)
    * [func want500Test(t *testing.T, path string)](#want500Test)


## <a id="var" href="#var">Variables</a>

### <a id="cgiTested" href="#cgiTested">var cgiTested</a>

```
searchKey: cgi.cgiTested
tags: [variable boolean private]
```

```Go
var cgiTested, cgiWorks bool
```

### <a id="cgiWorks" href="#cgiWorks">var cgiWorks</a>

```
searchKey: cgi.cgiWorks
tags: [variable boolean private]
```

```Go
var cgiTested, cgiWorks bool
```

### <a id="osDefaultInheritEnv" href="#osDefaultInheritEnv">var osDefaultInheritEnv</a>

```
searchKey: cgi.osDefaultInheritEnv
tags: [variable array string private]
```

```Go
var osDefaultInheritEnv = ...
```

### <a id="testHookStartProcess" href="#testHookStartProcess">var testHookStartProcess</a>

```
searchKey: cgi.testHookStartProcess
tags: [variable function private]
```

```Go
var testHookStartProcess func(*os.Process) // nil except for some tests

```

### <a id="trailingPort" href="#trailingPort">var trailingPort</a>

```
searchKey: cgi.trailingPort
tags: [variable struct private]
```

```Go
var trailingPort = regexp.MustCompile(`:([0-9]+)$`)
```

## <a id="type" href="#type">Types</a>

### <a id="Handler" href="#Handler">type Handler struct</a>

```
searchKey: cgi.Handler
tags: [struct]
```

```Go
type Handler struct {
	Path string // path to the CGI executable
	Root string // root URI prefix of handler or empty for "/"

	// Dir specifies the CGI executable's working directory.
	// If Dir is empty, the base directory of Path is used.
	// If Path has no base directory, the current working
	// directory is used.
	Dir string

	Env        []string    // extra environment variables to set, if any, as "key=value"
	InheritEnv []string    // environment variables to inherit from host, as "key"
	Logger     *log.Logger // optional log for errors or nil to use log.Print
	Args       []string    // optional arguments to pass to child process
	Stderr     io.Writer   // optional stderr for the child process; nil means os.Stderr

	// PathLocationHandler specifies the root http Handler that
	// should handle internal redirects when the CGI process
	// returns a Location header value starting with a "/", as
	// specified in RFC 3875 § 6.3.2. This will likely be
	// http.DefaultServeMux.
	//
	// If nil, a CGI response with a local URI path is instead sent
	// back to the client and not redirected internally.
	PathLocationHandler http.Handler
}
```

Handler runs an executable in a subprocess with a CGI environment. 

#### <a id="Handler.ServeHTTP" href="#Handler.ServeHTTP">func (h *Handler) ServeHTTP(rw http.ResponseWriter, req *http.Request)</a>

```
searchKey: cgi.Handler.ServeHTTP
tags: [method]
```

```Go
func (h *Handler) ServeHTTP(rw http.ResponseWriter, req *http.Request)
```

#### <a id="Handler.handleInternalRedirect" href="#Handler.handleInternalRedirect">func (h *Handler) handleInternalRedirect(rw http.ResponseWriter, req *http.Request, path string)</a>

```
searchKey: cgi.Handler.handleInternalRedirect
tags: [method private]
```

```Go
func (h *Handler) handleInternalRedirect(rw http.ResponseWriter, req *http.Request, path string)
```

#### <a id="Handler.printf" href="#Handler.printf">func (h *Handler) printf(format string, v ...interface{})</a>

```
searchKey: cgi.Handler.printf
tags: [method private]
```

```Go
func (h *Handler) printf(format string, v ...interface{})
```

#### <a id="Handler.stderr" href="#Handler.stderr">func (h *Handler) stderr() io.Writer</a>

```
searchKey: cgi.Handler.stderr
tags: [method private]
```

```Go
func (h *Handler) stderr() io.Writer
```

### <a id="customWriterRecorder" href="#customWriterRecorder">type customWriterRecorder struct</a>

```
searchKey: cgi.customWriterRecorder
tags: [struct private]
```

```Go
type customWriterRecorder struct {
	w io.Writer
	*httptest.ResponseRecorder
}
```

#### <a id="customWriterRecorder.Write" href="#customWriterRecorder.Write">func (r *customWriterRecorder) Write(p []byte) (n int, err error)</a>

```
searchKey: cgi.customWriterRecorder.Write
tags: [method private]
```

```Go
func (r *customWriterRecorder) Write(p []byte) (n int, err error)
```

### <a id="limitWriter" href="#limitWriter">type limitWriter struct</a>

```
searchKey: cgi.limitWriter
tags: [struct private]
```

```Go
type limitWriter struct {
	w io.Writer
	n int
}
```

#### <a id="limitWriter.Write" href="#limitWriter.Write">func (w *limitWriter) Write(p []byte) (n int, err error)</a>

```
searchKey: cgi.limitWriter.Write
tags: [method private]
```

```Go
func (w *limitWriter) Write(p []byte) (n int, err error)
```

### <a id="neverEnding" href="#neverEnding">type neverEnding byte</a>

```
searchKey: cgi.neverEnding
tags: [number private]
```

```Go
type neverEnding byte
```

#### <a id="neverEnding.Read" href="#neverEnding.Read">func (b neverEnding) Read(p []byte) (n int, err error)</a>

```
searchKey: cgi.neverEnding.Read
tags: [method private]
```

```Go
func (b neverEnding) Read(p []byte) (n int, err error)
```

### <a id="response" href="#response">type response struct</a>

```
searchKey: cgi.response
tags: [struct private]
```

```Go
type response struct {
	req            *http.Request
	header         http.Header
	code           int
	wroteHeader    bool
	wroteCGIHeader bool
	bufw           *bufio.Writer
}
```

#### <a id="response.Flush" href="#response.Flush">func (r *response) Flush()</a>

```
searchKey: cgi.response.Flush
tags: [method private]
```

```Go
func (r *response) Flush()
```

#### <a id="response.Header" href="#response.Header">func (r *response) Header() http.Header</a>

```
searchKey: cgi.response.Header
tags: [method private]
```

```Go
func (r *response) Header() http.Header
```

#### <a id="response.Write" href="#response.Write">func (r *response) Write(p []byte) (n int, err error)</a>

```
searchKey: cgi.response.Write
tags: [method private]
```

```Go
func (r *response) Write(p []byte) (n int, err error)
```

#### <a id="response.WriteHeader" href="#response.WriteHeader">func (r *response) WriteHeader(code int)</a>

```
searchKey: cgi.response.WriteHeader
tags: [method private]
```

```Go
func (r *response) WriteHeader(code int)
```

#### <a id="response.writeCGIHeader" href="#response.writeCGIHeader">func (r *response) writeCGIHeader(p []byte)</a>

```
searchKey: cgi.response.writeCGIHeader
tags: [method private]
```

```Go
func (r *response) writeCGIHeader(p []byte)
```

writeCGIHeader finalizes the header sent to the client and writes it to the output. p is not written by writeHeader, but is the first chunk of the body that will be written. It is sniffed for a Content-Type if none is set explicitly. 

## <a id="func" href="#func">Functions</a>

### <a id="Request" href="#Request">func Request() (*http.Request, error)</a>

```
searchKey: cgi.Request
tags: [function]
```

```Go
func Request() (*http.Request, error)
```

Request returns the HTTP request as represented in the current environment. This assumes the current program is being run by a web server in a CGI environment. The returned Request's Body is populated, if applicable. 

### <a id="RequestFromMap" href="#RequestFromMap">func RequestFromMap(params map[string]string) (*http.Request, error)</a>

```
searchKey: cgi.RequestFromMap
tags: [function]
```

```Go
func RequestFromMap(params map[string]string) (*http.Request, error)
```

RequestFromMap creates an http.Request from CGI variables. The returned Request's Body field is not populated. 

### <a id="Serve" href="#Serve">func Serve(handler http.Handler) error</a>

```
searchKey: cgi.Serve
tags: [function]
```

```Go
func Serve(handler http.Handler) error
```

Serve executes the provided Handler on the currently active CGI request, if any. If there's no current CGI environment an error is returned. The provided handler may be nil to use http.DefaultServeMux. 

### <a id="Test500WithEmptyHeaders" href="#Test500WithEmptyHeaders">func Test500WithEmptyHeaders(t *testing.T)</a>

```
searchKey: cgi.Test500WithEmptyHeaders
tags: [function private test]
```

```Go
func Test500WithEmptyHeaders(t *testing.T)
```

### <a id="Test500WithNoContentType" href="#Test500WithNoContentType">func Test500WithNoContentType(t *testing.T)</a>

```
searchKey: cgi.Test500WithNoContentType
tags: [function private test]
```

```Go
func Test500WithNoContentType(t *testing.T)
```

### <a id="Test500WithNoHeaders" href="#Test500WithNoHeaders">func Test500WithNoHeaders(t *testing.T)</a>

```
searchKey: cgi.Test500WithNoHeaders
tags: [function private test]
```

```Go
func Test500WithNoHeaders(t *testing.T)
```

golang.org/issue/7198 

### <a id="TestBeChildCGIProcess" href="#TestBeChildCGIProcess">func TestBeChildCGIProcess(t *testing.T)</a>

```
searchKey: cgi.TestBeChildCGIProcess
tags: [function private test]
```

```Go
func TestBeChildCGIProcess(t *testing.T)
```

Note: not actually a test. 

### <a id="TestCGIBasicGet" href="#TestCGIBasicGet">func TestCGIBasicGet(t *testing.T)</a>

```
searchKey: cgi.TestCGIBasicGet
tags: [function private test]
```

```Go
func TestCGIBasicGet(t *testing.T)
```

### <a id="TestCGIBasicGetAbsPath" href="#TestCGIBasicGetAbsPath">func TestCGIBasicGetAbsPath(t *testing.T)</a>

```
searchKey: cgi.TestCGIBasicGetAbsPath
tags: [function private test]
```

```Go
func TestCGIBasicGetAbsPath(t *testing.T)
```

### <a id="TestCGIBasicPost" href="#TestCGIBasicPost">func TestCGIBasicPost(t *testing.T)</a>

```
searchKey: cgi.TestCGIBasicPost
tags: [function private test]
```

```Go
func TestCGIBasicPost(t *testing.T)
```

### <a id="TestCGIEnvIPv6" href="#TestCGIEnvIPv6">func TestCGIEnvIPv6(t *testing.T)</a>

```
searchKey: cgi.TestCGIEnvIPv6
tags: [function private test]
```

```Go
func TestCGIEnvIPv6(t *testing.T)
```

### <a id="TestCGIPostChunked" href="#TestCGIPostChunked">func TestCGIPostChunked(t *testing.T)</a>

```
searchKey: cgi.TestCGIPostChunked
tags: [function private test]
```

```Go
func TestCGIPostChunked(t *testing.T)
```

The CGI spec doesn't allow chunked requests. 

### <a id="TestChildContentType" href="#TestChildContentType">func TestChildContentType(t *testing.T)</a>

```
searchKey: cgi.TestChildContentType
tags: [function private test]
```

```Go
func TestChildContentType(t *testing.T)
```

### <a id="TestChildOnlyHeaders" href="#TestChildOnlyHeaders">func TestChildOnlyHeaders(t *testing.T)</a>

```
searchKey: cgi.TestChildOnlyHeaders
tags: [function private test]
```

```Go
func TestChildOnlyHeaders(t *testing.T)
```

Test that a child handler writing only headers works. golang.org/issue/7196 

### <a id="TestCopyError" href="#TestCopyError">func TestCopyError(t *testing.T)</a>

```
searchKey: cgi.TestCopyError
tags: [function private test]
```

```Go
func TestCopyError(t *testing.T)
```

TestCopyError tests that we kill the process if there's an error copying its output. (for example, from the client having gone away) 

### <a id="TestDirUnix" href="#TestDirUnix">func TestDirUnix(t *testing.T)</a>

```
searchKey: cgi.TestDirUnix
tags: [function private test]
```

```Go
func TestDirUnix(t *testing.T)
```

### <a id="TestDirWindows" href="#TestDirWindows">func TestDirWindows(t *testing.T)</a>

```
searchKey: cgi.TestDirWindows
tags: [function private test]
```

```Go
func TestDirWindows(t *testing.T)
```

### <a id="TestDropProxyHeader" href="#TestDropProxyHeader">func TestDropProxyHeader(t *testing.T)</a>

```
searchKey: cgi.TestDropProxyHeader
tags: [function private test]
```

```Go
func TestDropProxyHeader(t *testing.T)
```

Issue 16405: CGI+http.Transport differing uses of HTTP_PROXY. Verify we don't set the HTTP_PROXY environment variable. Hope nobody was depending on it. It's not a known header, though. 

### <a id="TestDupHeaders" href="#TestDupHeaders">func TestDupHeaders(t *testing.T)</a>

```
searchKey: cgi.TestDupHeaders
tags: [function private test]
```

```Go
func TestDupHeaders(t *testing.T)
```

### <a id="TestEnvOverride" href="#TestEnvOverride">func TestEnvOverride(t *testing.T)</a>

```
searchKey: cgi.TestEnvOverride
tags: [function private test]
```

```Go
func TestEnvOverride(t *testing.T)
```

### <a id="TestHandlerStderr" href="#TestHandlerStderr">func TestHandlerStderr(t *testing.T)</a>

```
searchKey: cgi.TestHandlerStderr
tags: [function private test]
```

```Go
func TestHandlerStderr(t *testing.T)
```

### <a id="TestHostingOurselves" href="#TestHostingOurselves">func TestHostingOurselves(t *testing.T)</a>

```
searchKey: cgi.TestHostingOurselves
tags: [function private test]
```

```Go
func TestHostingOurselves(t *testing.T)
```

This test is a CGI host (testing host.go) that runs its own binary as a child process testing the other half of CGI (child.go). 

### <a id="TestInternalRedirect" href="#TestInternalRedirect">func TestInternalRedirect(t *testing.T)</a>

```
searchKey: cgi.TestInternalRedirect
tags: [function private test]
```

```Go
func TestInternalRedirect(t *testing.T)
```

### <a id="TestKillChildAfterCopyError" href="#TestKillChildAfterCopyError">func TestKillChildAfterCopyError(t *testing.T)</a>

```
searchKey: cgi.TestKillChildAfterCopyError
tags: [function private test]
```

```Go
func TestKillChildAfterCopyError(t *testing.T)
```

If there's an error copying the child's output to the parent, test that we kill the child. 

### <a id="TestNilRequestBody" href="#TestNilRequestBody">func TestNilRequestBody(t *testing.T)</a>

```
searchKey: cgi.TestNilRequestBody
tags: [function private test]
```

```Go
func TestNilRequestBody(t *testing.T)
```

Test that a child handler does not receive a nil Request Body. golang.org/issue/39190 

### <a id="TestPathInfo" href="#TestPathInfo">func TestPathInfo(t *testing.T)</a>

```
searchKey: cgi.TestPathInfo
tags: [function private test]
```

```Go
func TestPathInfo(t *testing.T)
```

### <a id="TestPathInfoDirRoot" href="#TestPathInfoDirRoot">func TestPathInfoDirRoot(t *testing.T)</a>

```
searchKey: cgi.TestPathInfoDirRoot
tags: [function private test]
```

```Go
func TestPathInfoDirRoot(t *testing.T)
```

### <a id="TestPathInfoNoRoot" href="#TestPathInfoNoRoot">func TestPathInfoNoRoot(t *testing.T)</a>

```
searchKey: cgi.TestPathInfoNoRoot
tags: [function private test]
```

```Go
func TestPathInfoNoRoot(t *testing.T)
```

### <a id="TestRedirect" href="#TestRedirect">func TestRedirect(t *testing.T)</a>

```
searchKey: cgi.TestRedirect
tags: [function private test]
```

```Go
func TestRedirect(t *testing.T)
```

### <a id="TestRemoveLeadingDuplicates" href="#TestRemoveLeadingDuplicates">func TestRemoveLeadingDuplicates(t *testing.T)</a>

```
searchKey: cgi.TestRemoveLeadingDuplicates
tags: [function private test]
```

```Go
func TestRemoveLeadingDuplicates(t *testing.T)
```

### <a id="TestRequest" href="#TestRequest">func TestRequest(t *testing.T)</a>

```
searchKey: cgi.TestRequest
tags: [function private test]
```

```Go
func TestRequest(t *testing.T)
```

### <a id="TestRequestWithTLS" href="#TestRequestWithTLS">func TestRequestWithTLS(t *testing.T)</a>

```
searchKey: cgi.TestRequestWithTLS
tags: [function private test]
```

```Go
func TestRequestWithTLS(t *testing.T)
```

### <a id="TestRequestWithoutHost" href="#TestRequestWithoutHost">func TestRequestWithoutHost(t *testing.T)</a>

```
searchKey: cgi.TestRequestWithoutHost
tags: [function private test]
```

```Go
func TestRequestWithoutHost(t *testing.T)
```

### <a id="TestRequestWithoutRemotePort" href="#TestRequestWithoutRemotePort">func TestRequestWithoutRemotePort(t *testing.T)</a>

```
searchKey: cgi.TestRequestWithoutRemotePort
tags: [function private test]
```

```Go
func TestRequestWithoutRemotePort(t *testing.T)
```

### <a id="TestRequestWithoutRequestURI" href="#TestRequestWithoutRequestURI">func TestRequestWithoutRequestURI(t *testing.T)</a>

```
searchKey: cgi.TestRequestWithoutRequestURI
tags: [function private test]
```

```Go
func TestRequestWithoutRequestURI(t *testing.T)
```

### <a id="TestResponse" href="#TestResponse">func TestResponse(t *testing.T)</a>

```
searchKey: cgi.TestResponse
tags: [function private test]
```

```Go
func TestResponse(t *testing.T)
```

### <a id="check" href="#check">func check(t *testing.T)</a>

```
searchKey: cgi.check
tags: [function private]
```

```Go
func check(t *testing.T)
```

### <a id="chunk" href="#chunk">func chunk(s string) string</a>

```
searchKey: cgi.chunk
tags: [function private]
```

```Go
func chunk(s string) string
```

### <a id="envMap" href="#envMap">func envMap(env []string) map[string]string</a>

```
searchKey: cgi.envMap
tags: [function private]
```

```Go
func envMap(env []string) map[string]string
```

### <a id="findPerl" href="#findPerl">func findPerl(t *testing.T) string</a>

```
searchKey: cgi.findPerl
tags: [function private]
```

```Go
func findPerl(t *testing.T) string
```

### <a id="isProcessRunning" href="#isProcessRunning">func isProcessRunning(pid int) bool</a>

```
searchKey: cgi.isProcessRunning
tags: [function private]
```

```Go
func isProcessRunning(pid int) bool
```

### <a id="newRequest" href="#newRequest">func newRequest(httpreq string) *http.Request</a>

```
searchKey: cgi.newRequest
tags: [function private]
```

```Go
func newRequest(httpreq string) *http.Request
```

### <a id="removeLeadingDuplicates" href="#removeLeadingDuplicates">func removeLeadingDuplicates(env []string) (ret []string)</a>

```
searchKey: cgi.removeLeadingDuplicates
tags: [function private]
```

```Go
func removeLeadingDuplicates(env []string) (ret []string)
```

removeLeadingDuplicates remove leading duplicate in environments. It's possible to override environment like following. 

```
cgi.Handler{
  ...
  Env: []string{"SCRIPT_FILENAME=foo.php"},
}

```
### <a id="runCgiTest" href="#runCgiTest">func runCgiTest(t *testing.T, h *Handler,...</a>

```
searchKey: cgi.runCgiTest
tags: [function private]
```

```Go
func runCgiTest(t *testing.T, h *Handler,
	httpreq string,
	expectedMap map[string]string, checks ...func(reqInfo map[string]string)) *httptest.ResponseRecorder
```

### <a id="runResponseChecks" href="#runResponseChecks">func runResponseChecks(t *testing.T, rw *httptest.ResponseRecorder,...</a>

```
searchKey: cgi.runResponseChecks
tags: [function private]
```

```Go
func runResponseChecks(t *testing.T, rw *httptest.ResponseRecorder,
	expectedMap map[string]string, checks ...func(reqInfo map[string]string))
```

### <a id="upperCaseAndUnderscore" href="#upperCaseAndUnderscore">func upperCaseAndUnderscore(r rune) rune</a>

```
searchKey: cgi.upperCaseAndUnderscore
tags: [function private]
```

```Go
func upperCaseAndUnderscore(r rune) rune
```

### <a id="want500Test" href="#want500Test">func want500Test(t *testing.T, path string)</a>

```
searchKey: cgi.want500Test
tags: [function private]
```

```Go
func want500Test(t *testing.T, path string)
```

