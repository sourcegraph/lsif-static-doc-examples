# Package http_test

## Index

* [Constants](#const)
    * [const h1Mode](#h1Mode)
    * [const h2Mode](#h2Mode)
    * [const testFile](#testFile)
    * [const testFileLen](#testFileLen)
    * [const fileaContents](#fileaContents)
    * [const filebContents](#filebContents)
    * [const textaValue](#textaValue)
    * [const textbValue](#textbValue)
    * [const boundary](#boundary)
    * [const message](#message)
    * [const withTLS](#withTLS)
    * [const noTLS](#noTLS)
    * [const someResponse](#someResponse)
* [Variables](#var)
    * [var robotsTxtHandler](#robotsTxtHandler)
    * [var expectedCookies](#expectedCookies)
    * [var echoCookiesRedirectHandler](#echoCookiesRedirectHandler)
    * [var optQuietLog](#optQuietLog)
    * [var ServeFileRangeTests](#ServeFileRangeTests)
    * [var fsRedirectTestData](#fsRedirectTestData)
    * [var quietLog](#quietLog)
    * [var readRequestErrorTests](#readRequestErrorTests)
    * [var newRequestHostTests](#newRequestHostTests)
    * [var parseHTTPVersionTests](#parseHTTPVersionTests)
    * [var getBasicAuthTests](#getBasicAuthTests)
    * [var parseBasicAuthTests](#parseBasicAuthTests)
    * [var handlers](#handlers)
    * [var vtests](#vtests)
    * [var serveMuxRegister](#serveMuxRegister)
    * [var serveMuxTests](#serveMuxTests)
    * [var serveMuxTests2](#serveMuxTests2)
    * [var serverExpectTests](#serverExpectTests)
    * [var handlerBodyCloseTests](#handlerBodyCloseTests)
    * [var testHandlerBodyConsumers](#testHandlerBodyConsumers)
    * [var response](#response)
    * [var sniffTests](#sniffTests)
    * [var hostPortHandler](#hostPortHandler)
    * [var roundTripTests](#roundTripTests)
    * [var proxyFromEnvTests](#proxyFromEnvTests)
    * [var isDNSHijackedOnce](#isDNSHijackedOnce)
    * [var isDNSHijacked](#isDNSHijacked)
    * [var errFakeRoundTrip](#errFakeRoundTrip)
    * [var rgz](#rgz)
    * [var timeoutProtoErr](#timeoutProtoErr)
* [Types](#type)
    * [type http09Writer struct](#http09Writer)
        * [func (w http09Writer) Header() Header](#http09Writer.Header)
        * [func (w http09Writer) WriteHeader(int)](#http09Writer.WriteHeader)
    * [type chanWriter chan string](#chanWriter)
        * [func (w chanWriter) Write(p []byte) (n int, err error)](#chanWriter.Write)
    * [type recordingTransport struct](#recordingTransport)
        * [func (t *recordingTransport) RoundTrip(req *Request) (resp *Response, err error)](#recordingTransport.RoundTrip)
    * [type redirectTest struct](#redirectTest)
    * [type TestJar struct](#TestJar)
        * [func (j *TestJar) SetCookies(u *url.URL, cookies []*Cookie)](#TestJar.SetCookies)
        * [func (j *TestJar) Cookies(u *url.URL) []*Cookie](#TestJar.Cookies)
    * [type RecordingJar struct](#RecordingJar)
        * [func (j *RecordingJar) SetCookies(u *url.URL, cookies []*Cookie)](#RecordingJar.SetCookies)
        * [func (j *RecordingJar) Cookies(u *url.URL) []*Cookie](#RecordingJar.Cookies)
        * [func (j *RecordingJar) logf(format string, args ...interface{})](#RecordingJar.logf)
    * [type writeCountingConn struct](#writeCountingConn)
        * [func (c *writeCountingConn) Write(p []byte) (int, error)](#writeCountingConn.Write)
    * [type eofReaderFunc func()](#eofReaderFunc)
        * [func (f eofReaderFunc) Read(p []byte) (n int, err error)](#eofReaderFunc.Read)
    * [type issue15577Tripper struct{}](#issue15577Tripper)
        * [func (issue15577Tripper) RoundTrip(*Request) (*Response, error)](#issue15577Tripper.RoundTrip)
    * [type issue18239Body struct](#issue18239Body)
        * [func (b issue18239Body) Read([]byte) (int, error)](#issue18239Body.Read)
        * [func (b issue18239Body) Close() error](#issue18239Body.Close)
    * [type roundTripperWithoutCloseIdle struct{}](#roundTripperWithoutCloseIdle)
        * [func (roundTripperWithoutCloseIdle) RoundTrip(*Request) (*Response, error)](#roundTripperWithoutCloseIdle.RoundTrip)
    * [type roundTripperWithCloseIdle func()](#roundTripperWithCloseIdle)
        * [func (roundTripperWithCloseIdle) RoundTrip(*Request) (*Response, error)](#roundTripperWithCloseIdle.RoundTrip)
        * [func (f roundTripperWithCloseIdle) CloseIdleConnections()](#roundTripperWithCloseIdle.CloseIdleConnections)
    * [type nilBodyRoundTripper struct{}](#nilBodyRoundTripper)
        * [func (nilBodyRoundTripper) RoundTrip(req *Request) (*Response, error)](#nilBodyRoundTripper.RoundTrip)
    * [type issue40382Body struct](#issue40382Body)
        * [func (b *issue40382Body) Read(p []byte) (int, error)](#issue40382Body.Read)
        * [func (b *issue40382Body) Close() error](#issue40382Body.Close)
    * [type clientServerTest struct](#clientServerTest)
        * [func newClientServerTest(t *testing.T, h2 bool, h Handler, opts ...interface{}) *clientServerTest](#newClientServerTest)
        * [func (t *clientServerTest) close()](#clientServerTest.close)
        * [func (t *clientServerTest) getURL(u string) string](#clientServerTest.getURL)
        * [func (t *clientServerTest) scheme() string](#clientServerTest.scheme)
    * [type reqFunc func(c *net/http.Client, url string) (*net/http.Response, error)](#reqFunc)
    * [type h12Compare struct](#h12Compare)
        * [func (tt h12Compare) reqFunc() reqFunc](#h12Compare.reqFunc)
        * [func (tt h12Compare) run(t *testing.T)](#h12Compare.run)
        * [func (tt h12Compare) normalizeRes(t *testing.T, res *Response, wantProto string)](#h12Compare.normalizeRes)
    * [type slurpResult struct](#slurpResult)
        * [func (sr slurpResult) String() string](#slurpResult.String)
    * [type lockedBytesBuffer struct](#lockedBytesBuffer)
        * [func (b *lockedBytesBuffer) Write(p []byte) (int, error)](#lockedBytesBuffer.Write)
    * [type noteCloseConn struct](#noteCloseConn)
        * [func (x noteCloseConn) Close() error](#noteCloseConn.Close)
    * [type testErrorReader struct](#testErrorReader)
        * [func (r testErrorReader) Read(p []byte) (n int, err error)](#testErrorReader.Read)
    * [type dotFileHidingFile struct](#dotFileHidingFile)
        * [func (f dotFileHidingFile) Readdir(n int) (fis []fs.FileInfo, err error)](#dotFileHidingFile.Readdir)
    * [type dotFileHidingFileSystem struct](#dotFileHidingFileSystem)
        * [func (fsys dotFileHidingFileSystem) Open(name string) (http.File, error)](#dotFileHidingFileSystem.Open)
    * [type countHandler struct](#countHandler)
        * [func (h *countHandler) ServeHTTP(w http.ResponseWriter, r *http.Request)](#countHandler.ServeHTTP)
    * [type apiHandler struct{}](#apiHandler)
        * [func (apiHandler) ServeHTTP(http.ResponseWriter, *http.Request)](#apiHandler.ServeHTTP)
    * [type wantRange struct](#wantRange)
    * [type testFileSystem struct](#testFileSystem)
        * [func (fs *testFileSystem) Open(name string) (File, error)](#testFileSystem.Open)
    * [type fakeFileInfo struct](#fakeFileInfo)
        * [func (f *fakeFileInfo) Name() string](#fakeFileInfo.Name)
        * [func (f *fakeFileInfo) Sys() interface{}](#fakeFileInfo.Sys)
        * [func (f *fakeFileInfo) ModTime() time.Time](#fakeFileInfo.ModTime)
        * [func (f *fakeFileInfo) IsDir() bool](#fakeFileInfo.IsDir)
        * [func (f *fakeFileInfo) Size() int64](#fakeFileInfo.Size)
        * [func (f *fakeFileInfo) Mode() fs.FileMode](#fakeFileInfo.Mode)
    * [type fakeFile struct](#fakeFile)
        * [func (f *fakeFile) Close() error](#fakeFile.Close)
        * [func (f *fakeFile) Stat() (fs.FileInfo, error)](#fakeFile.Stat)
        * [func (f *fakeFile) Readdir(count int) ([]fs.FileInfo, error)](#fakeFile.Readdir)
    * [type fakeFS map[string]*http_test.fakeFileInfo](#fakeFS)
        * [func (fsys fakeFS) Open(name string) (File, error)](#fakeFS.Open)
    * [type issue12991FS struct{}](#issue12991FS)
        * [func (issue12991FS) Open(string) (File, error)](#issue12991FS.Open)
    * [type issue12991File struct](#issue12991File)
        * [func (issue12991File) Stat() (fs.FileInfo, error)](#issue12991File.Stat)
        * [func (issue12991File) Close() error](#issue12991File.Close)
    * [type fileServerCleanPathDir struct](#fileServerCleanPathDir)
        * [func (d fileServerCleanPathDir) Open(path string) (File, error)](#fileServerCleanPathDir.Open)
    * [type panicOnSeek struct](#panicOnSeek)
    * [type getBasicAuthTest struct](#getBasicAuthTest)
    * [type basicAuthCredentialsTest struct](#basicAuthCredentialsTest)
    * [type logWrites struct](#logWrites)
        * [func (l logWrites) WriteByte(c byte) error](#logWrites.WriteByte)
        * [func (l logWrites) Write(p []byte) (n int, err error)](#logWrites.Write)
    * [type responseWriterJustWriter struct](#responseWriterJustWriter)
        * [func (responseWriterJustWriter) Header() Header](#responseWriterJustWriter.Header)
        * [func (responseWriterJustWriter) WriteHeader(int)](#responseWriterJustWriter.WriteHeader)
    * [type delayedEOFReader struct](#delayedEOFReader)
        * [func (dr delayedEOFReader) Read(p []byte) (n int, err error)](#delayedEOFReader.Read)
    * [type infiniteReader struct](#infiniteReader)
        * [func (r *infiniteReader) Read(b []byte) (int, error)](#infiniteReader.Read)
    * [type dummyAddr string](#dummyAddr)
        * [func (a dummyAddr) Network() string](#dummyAddr.Network)
        * [func (a dummyAddr) String() string](#dummyAddr.String)
    * [type oneConnListener struct](#oneConnListener)
        * [func (l *oneConnListener) Accept() (c net.Conn, err error)](#oneConnListener.Accept)
        * [func (l *oneConnListener) Close() error](#oneConnListener.Close)
        * [func (l *oneConnListener) Addr() net.Addr](#oneConnListener.Addr)
    * [type noopConn struct{}](#noopConn)
        * [func (noopConn) LocalAddr() net.Addr](#noopConn.LocalAddr)
        * [func (noopConn) RemoteAddr() net.Addr](#noopConn.RemoteAddr)
        * [func (noopConn) SetDeadline(t time.Time) error](#noopConn.SetDeadline)
        * [func (noopConn) SetReadDeadline(t time.Time) error](#noopConn.SetReadDeadline)
        * [func (noopConn) SetWriteDeadline(t time.Time) error](#noopConn.SetWriteDeadline)
    * [type rwTestConn struct](#rwTestConn)
        * [func (c *rwTestConn) Close() error](#rwTestConn.Close)
    * [type testConn struct](#testConn)
        * [func (c *testConn) Read(b []byte) (int, error)](#testConn.Read)
        * [func (c *testConn) Write(b []byte) (int, error)](#testConn.Write)
        * [func (c *testConn) Close() error](#testConn.Close)
    * [type handlerTest struct](#handlerTest)
        * [func newHandlerTest(h Handler) handlerTest](#newHandlerTest)
        * [func (ht *handlerTest) rawResponse(req string) string](#handlerTest.rawResponse)
    * [type stringHandler string](#stringHandler)
        * [func (s stringHandler) ServeHTTP(w ResponseWriter, r *Request)](#stringHandler.ServeHTTP)
    * [type trackLastConnListener struct](#trackLastConnListener)
        * [func (l trackLastConnListener) Accept() (c net.Conn, err error)](#trackLastConnListener.Accept)
    * [type blockingRemoteAddrListener struct](#blockingRemoteAddrListener)
        * [func (l *blockingRemoteAddrListener) Accept() (net.Conn, error)](#blockingRemoteAddrListener.Accept)
    * [type blockingRemoteAddrConn struct](#blockingRemoteAddrConn)
        * [func (c *blockingRemoteAddrConn) RemoteAddr() net.Addr](#blockingRemoteAddrConn.RemoteAddr)
    * [type serverExpectTest struct](#serverExpectTest)
        * [func expectTest(contentLength int, expectation string, readBody bool, expectedResponse string) serverExpectTest](#expectTest)
    * [type handlerBodyCloseTest struct](#handlerBodyCloseTest)
        * [func (t handlerBodyCloseTest) connectionHeader() string](#handlerBodyCloseTest.connectionHeader)
    * [type testHandlerBodyConsumer struct](#testHandlerBodyConsumer)
    * [type slowTestConn struct](#slowTestConn)
        * [func (c *slowTestConn) SetDeadline(t time.Time) error](#slowTestConn.SetDeadline)
        * [func (c *slowTestConn) SetReadDeadline(t time.Time) error](#slowTestConn.SetReadDeadline)
        * [func (c *slowTestConn) SetWriteDeadline(t time.Time) error](#slowTestConn.SetWriteDeadline)
        * [func (c *slowTestConn) Read(b []byte) (n int, err error)](#slowTestConn.Read)
        * [func (c *slowTestConn) Close() error](#slowTestConn.Close)
        * [func (c *slowTestConn) Write(b []byte) (int, error)](#slowTestConn.Write)
    * [type terrorWriter struct](#terrorWriter)
        * [func (w terrorWriter) Write(p []byte) (int, error)](#terrorWriter.Write)
    * [type neverEnding byte](#neverEnding)
        * [func (b neverEnding) Read(p []byte) (n int, err error)](#neverEnding.Read)
    * [type countReader struct](#countReader)
        * [func (cr countReader) Read(p []byte) (n int, err error)](#countReader.Read)
    * [type errorListener struct](#errorListener)
        * [func (l *errorListener) Accept() (c net.Conn, err error)](#errorListener.Accept)
        * [func (l *errorListener) Close() error](#errorListener.Close)
        * [func (l *errorListener) Addr() net.Addr](#errorListener.Addr)
    * [type closeWriteTestConn struct](#closeWriteTestConn)
        * [func (c *closeWriteTestConn) CloseWrite() error](#closeWriteTestConn.CloseWrite)
    * [type repeatReader struct](#repeatReader)
        * [func (r *repeatReader) Read(p []byte) (n int, err error)](#repeatReader.Read)
    * [type eofListenerNotComparable []int](#eofListenerNotComparable)
        * [func (eofListenerNotComparable) Accept() (net.Conn, error)](#eofListenerNotComparable.Accept)
        * [func (eofListenerNotComparable) Addr() net.Addr](#eofListenerNotComparable.Addr)
        * [func (eofListenerNotComparable) Close() error](#eofListenerNotComparable.Close)
    * [type countCloseListener struct](#countCloseListener)
        * [func (p *countCloseListener) Close() error](#countCloseListener.Close)
    * [type byteAtATimeReader struct](#byteAtATimeReader)
        * [func (b *byteAtATimeReader) Read(p []byte) (n int, err error)](#byteAtATimeReader.Read)
    * [type testCloseConn struct](#testCloseConn)
        * [func (c *testCloseConn) Close() error](#testCloseConn.Close)
    * [type testConnSet struct](#testConnSet)
        * [func makeTestDial(t *testing.T) (*testConnSet, func(n, addr string) (net.Conn, error))](#makeTestDial)
        * [func (tcs *testConnSet) insert(c net.Conn)](#testConnSet.insert)
        * [func (tcs *testConnSet) remove(c net.Conn)](#testConnSet.remove)
        * [func (tcs *testConnSet) check(t *testing.T)](#testConnSet.check)
    * [type countedConn struct](#countedConn)
    * [type countingDialer struct](#countingDialer)
        * [func (d *countingDialer) DialContext(ctx context.Context, network, address string) (net.Conn, error)](#countingDialer.DialContext)
        * [func (d *countingDialer) decrement(*countedConn)](#countingDialer.decrement)
        * [func (d *countingDialer) Read() (total, live int64)](#countingDialer.Read)
    * [type countedContext struct](#countedContext)
    * [type contextCounter struct](#contextCounter)
        * [func (cc *contextCounter) Track(ctx context.Context) context.Context](#contextCounter.Track)
        * [func (cc *contextCounter) decrement(*countedContext)](#contextCounter.decrement)
        * [func (cc *contextCounter) Read() (live int64)](#contextCounter.Read)
    * [type fooProto struct{}](#fooProto)
        * [func (fooProto) RoundTrip(req *Request) (*Response, error)](#fooProto.RoundTrip)
    * [type proxyFromEnvTest struct](#proxyFromEnvTest)
        * [func (t proxyFromEnvTest) String() string](#proxyFromEnvTest.String)
    * [type byteFromChanReader chan byte](#byteFromChanReader)
        * [func (c byteFromChanReader) Read(p []byte) (n int, err error)](#byteFromChanReader.Read)
    * [type closerFunc func() error](#closerFunc)
        * [func (f closerFunc) Close() error](#closerFunc.Close)
    * [type writerFuncConn struct](#writerFuncConn)
        * [func (c writerFuncConn) Write(p []byte) (n int, err error)](#writerFuncConn.Write)
    * [type logWritesConn struct](#logWritesConn)
        * [func (c *logWritesConn) Write(p []byte) (n int, err error)](#logWritesConn.Write)
        * [func (c *logWritesConn) Read(p []byte) (n int, err error)](#logWritesConn.Read)
        * [func (c *logWritesConn) Close() error](#logWritesConn.Close)
    * [type funcConn struct](#funcConn)
        * [func (c funcConn) Read(p []byte) (int, error)](#funcConn.Read)
        * [func (c funcConn) Write(p []byte) (int, error)](#funcConn.Write)
        * [func (c funcConn) Close() error](#funcConn.Close)
    * [type funcRoundTripper func()](#funcRoundTripper)
        * [func (fn funcRoundTripper) RoundTrip(*Request) (*Response, error)](#funcRoundTripper.RoundTrip)
    * [type countCloseReader struct](#countCloseReader)
        * [func (cr countCloseReader) Close() error](#countCloseReader.Close)
    * [type funcWriter func([]byte) (int, error)](#funcWriter)
        * [func (f funcWriter) Write(p []byte) (int, error)](#funcWriter.Write)
    * [type doneContext struct](#doneContext)
        * [func (doneContext) Done() <-chan struct{}](#doneContext.Done)
        * [func (d doneContext) Err() error](#doneContext.Err)
    * [type testMockTCPConn struct](#testMockTCPConn)
        * [func (c *testMockTCPConn) ReadFrom(r io.Reader) (int64, error)](#testMockTCPConn.ReadFrom)
    * [type bodyCloser bool](#bodyCloser)
        * [func (bc *bodyCloser) Close() error](#bodyCloser.Close)
        * [func (bc *bodyCloser) Read(b []byte) (n int, err error)](#bodyCloser.Read)
    * [type breakableConn struct](#breakableConn)
        * [func (w *breakableConn) Write(b []byte) (n int, err error)](#breakableConn.Write)
    * [type brokenState struct](#brokenState)
    * [type timeoutProto struct{}](#timeoutProto)
        * [func (timeoutProto) RoundTrip(req *Request) (*Response, error)](#timeoutProto.RoundTrip)
    * [type roundTripFunc func(r *net/http.Request) (*net/http.Response, error)](#roundTripFunc)
        * [func (f roundTripFunc) RoundTrip(r *Request) (*Response, error)](#roundTripFunc.RoundTrip)
    * [type dumpConn struct](#dumpConn)
        * [func (c *dumpConn) Close() error](#dumpConn.Close)
        * [func (c *dumpConn) LocalAddr() net.Addr](#dumpConn.LocalAddr)
        * [func (c *dumpConn) RemoteAddr() net.Addr](#dumpConn.RemoteAddr)
        * [func (c *dumpConn) SetDeadline(t time.Time) error](#dumpConn.SetDeadline)
        * [func (c *dumpConn) SetReadDeadline(t time.Time) error](#dumpConn.SetReadDeadline)
        * [func (c *dumpConn) SetWriteDeadline(t time.Time) error](#dumpConn.SetWriteDeadline)
    * [type delegateReader struct](#delegateReader)
        * [func (r *delegateReader) Read(p []byte) (int, error)](#delegateReader.Read)
* [Functions](#func)
    * [func TestNextProtoUpgrade(t *testing.T)](#TestNextProtoUpgrade)
    * [func handleTLSProtocol09(srv *Server, conn *tls.Conn, h Handler)](#handleTLSProtocol09)
    * [func pedanticReadAll(r io.Reader) (b []byte, err error)](#pedanticReadAll)
    * [func TestClient(t *testing.T)](#TestClient)
    * [func TestClientHead_h1(t *testing.T)](#TestClientHead_h1)
    * [func TestClientHead_h2(t *testing.T)](#TestClientHead_h2)
    * [func testClientHead(t *testing.T, h2 bool)](#testClientHead)
    * [func TestGetRequestFormat(t *testing.T)](#TestGetRequestFormat)
    * [func TestPostRequestFormat(t *testing.T)](#TestPostRequestFormat)
    * [func TestPostFormRequestFormat(t *testing.T)](#TestPostFormRequestFormat)
    * [func TestClientRedirects(t *testing.T)](#TestClientRedirects)
    * [func TestClientRedirectContext(t *testing.T)](#TestClientRedirectContext)
    * [func TestPostRedirects(t *testing.T)](#TestPostRedirects)
    * [func TestDeleteRedirects(t *testing.T)](#TestDeleteRedirects)
    * [func testRedirectsByMethod(t *testing.T, method string, table []redirectTest, want string)](#testRedirectsByMethod)
    * [func removeCommonLines(a, b string) (asuffix, bsuffix string, commonLines int)](#removeCommonLines)
    * [func TestClientRedirectUseResponse(t *testing.T)](#TestClientRedirectUseResponse)
    * [func TestClientRedirect308NoLocation(t *testing.T)](#TestClientRedirect308NoLocation)
    * [func TestClientRedirect308NoGetBody(t *testing.T)](#TestClientRedirect308NoGetBody)
    * [func TestClientSendsCookieFromJar(t *testing.T)](#TestClientSendsCookieFromJar)
    * [func TestRedirectCookiesJar(t *testing.T)](#TestRedirectCookiesJar)
    * [func matchReturnedCookies(t *testing.T, expected, given []*Cookie)](#matchReturnedCookies)
    * [func TestJarCalls(t *testing.T)](#TestJarCalls)
    * [func TestStreamingGet_h1(t *testing.T)](#TestStreamingGet_h1)
    * [func TestStreamingGet_h2(t *testing.T)](#TestStreamingGet_h2)
    * [func testStreamingGet(t *testing.T, h2 bool)](#testStreamingGet)
    * [func TestClientWrites(t *testing.T)](#TestClientWrites)
    * [func TestClientInsecureTransport(t *testing.T)](#TestClientInsecureTransport)
    * [func TestClientErrorWithRequestURI(t *testing.T)](#TestClientErrorWithRequestURI)
    * [func TestClientWithCorrectTLSServerName(t *testing.T)](#TestClientWithCorrectTLSServerName)
    * [func TestClientWithIncorrectTLSServerName(t *testing.T)](#TestClientWithIncorrectTLSServerName)
    * [func TestTransportUsesTLSConfigServerName(t *testing.T)](#TestTransportUsesTLSConfigServerName)
    * [func TestResponseSetsTLSConnectionState(t *testing.T)](#TestResponseSetsTLSConnectionState)
    * [func TestHTTPSClientDetectsHTTPServer(t *testing.T)](#TestHTTPSClientDetectsHTTPServer)
    * [func TestClientHeadContentLength_h1(t *testing.T)](#TestClientHeadContentLength_h1)
    * [func TestClientHeadContentLength_h2(t *testing.T)](#TestClientHeadContentLength_h2)
    * [func testClientHeadContentLength(t *testing.T, h2 bool)](#testClientHeadContentLength)
    * [func TestEmptyPasswordAuth(t *testing.T)](#TestEmptyPasswordAuth)
    * [func TestBasicAuth(t *testing.T)](#TestBasicAuth)
    * [func TestBasicAuthHeadersPreserved(t *testing.T)](#TestBasicAuthHeadersPreserved)
    * [func TestStripPasswordFromError(t *testing.T)](#TestStripPasswordFromError)
    * [func TestClientTimeout_h1(t *testing.T)](#TestClientTimeout_h1)
    * [func TestClientTimeout_h2(t *testing.T)](#TestClientTimeout_h2)
    * [func testClientTimeout(t *testing.T, h2 bool)](#testClientTimeout)
    * [func TestClientTimeout_Headers_h1(t *testing.T)](#TestClientTimeout_Headers_h1)
    * [func TestClientTimeout_Headers_h2(t *testing.T)](#TestClientTimeout_Headers_h2)
    * [func testClientTimeout_Headers(t *testing.T, h2 bool)](#testClientTimeout_Headers)
    * [func TestClientTimeoutCancel(t *testing.T)](#TestClientTimeoutCancel)
    * [func TestClientRedirectEatsBody_h1(t *testing.T)](#TestClientRedirectEatsBody_h1)
    * [func TestClientRedirectEatsBody_h2(t *testing.T)](#TestClientRedirectEatsBody_h2)
    * [func testClientRedirectEatsBody(t *testing.T, h2 bool)](#testClientRedirectEatsBody)
    * [func TestReferer(t *testing.T)](#TestReferer)
    * [func TestClientRedirectResponseWithoutRequest(t *testing.T)](#TestClientRedirectResponseWithoutRequest)
    * [func TestClientCopyHeadersOnRedirect(t *testing.T)](#TestClientCopyHeadersOnRedirect)
    * [func TestClientCopyHostOnRedirect(t *testing.T)](#TestClientCopyHostOnRedirect)
    * [func TestClientAltersCookiesOnRedirect(t *testing.T)](#TestClientAltersCookiesOnRedirect)
    * [func TestShouldCopyHeaderOnRedirect(t *testing.T)](#TestShouldCopyHeaderOnRedirect)
    * [func TestClientRedirectTypes(t *testing.T)](#TestClientRedirectTypes)
    * [func TestTransportBodyReadError(t *testing.T)](#TestTransportBodyReadError)
    * [func TestClientCloseIdleConnections(t *testing.T)](#TestClientCloseIdleConnections)
    * [func TestClientPropagatesTimeoutToContext(t *testing.T)](#TestClientPropagatesTimeoutToContext)
    * [func TestClientDoCanceledVsTimeout_h1(t *testing.T)](#TestClientDoCanceledVsTimeout_h1)
    * [func TestClientDoCanceledVsTimeout_h2(t *testing.T)](#TestClientDoCanceledVsTimeout_h2)
    * [func testClientDoCanceledVsTimeout(t *testing.T, h2 bool)](#testClientDoCanceledVsTimeout)
    * [func TestClientPopulatesNilResponseBody(t *testing.T)](#TestClientPopulatesNilResponseBody)
    * [func TestClientCallsCloseOnlyOnce(t *testing.T)](#TestClientCallsCloseOnlyOnce)
    * [func optWithServerLog(lg *log.Logger) func(*httptest.Server)](#optWithServerLog)
    * [func TestNewClientServerTest(t *testing.T)](#TestNewClientServerTest)
    * [func TestChunkedResponseHeaders_h1(t *testing.T)](#TestChunkedResponseHeaders_h1)
    * [func TestChunkedResponseHeaders_h2(t *testing.T)](#TestChunkedResponseHeaders_h2)
    * [func testChunkedResponseHeaders(t *testing.T, h2 bool)](#testChunkedResponseHeaders)
    * [func mostlyCopy(r *Response) *Response](#mostlyCopy)
    * [func TestH12_HeadContentLengthNoBody(t *testing.T)](#TestH12_HeadContentLengthNoBody)
    * [func TestH12_HeadContentLengthSmallBody(t *testing.T)](#TestH12_HeadContentLengthSmallBody)
    * [func TestH12_HeadContentLengthLargeBody(t *testing.T)](#TestH12_HeadContentLengthLargeBody)
    * [func TestH12_200NoBody(t *testing.T)](#TestH12_200NoBody)
    * [func TestH2_204NoBody(t *testing.T)](#TestH2_204NoBody)
    * [func TestH2_304NoBody(t *testing.T)](#TestH2_304NoBody)
    * [func TestH2_404NoBody(t *testing.T)](#TestH2_404NoBody)
    * [func testH12_noBody(t *testing.T, status int)](#testH12_noBody)
    * [func TestH12_SmallBody(t *testing.T)](#TestH12_SmallBody)
    * [func TestH12_ExplicitContentLength(t *testing.T)](#TestH12_ExplicitContentLength)
    * [func TestH12_FlushBeforeBody(t *testing.T)](#TestH12_FlushBeforeBody)
    * [func TestH12_FlushMidBody(t *testing.T)](#TestH12_FlushMidBody)
    * [func TestH12_Head_ExplicitLen(t *testing.T)](#TestH12_Head_ExplicitLen)
    * [func TestH12_Head_ImplicitLen(t *testing.T)](#TestH12_Head_ImplicitLen)
    * [func TestH12_HandlerWritesTooLittle(t *testing.T)](#TestH12_HandlerWritesTooLittle)
    * [func TestH12_HandlerWritesTooMuch(t *testing.T)](#TestH12_HandlerWritesTooMuch)
    * [func TestH12_AutoGzip(t *testing.T)](#TestH12_AutoGzip)
    * [func TestH12_AutoGzip_Disabled(t *testing.T)](#TestH12_AutoGzip_Disabled)
    * [func Test304Responses_h1(t *testing.T)](#Test304Responses_h1)
    * [func Test304Responses_h2(t *testing.T)](#Test304Responses_h2)
    * [func test304Responses(t *testing.T, h2 bool)](#test304Responses)
    * [func TestH12_ServerEmptyContentLength(t *testing.T)](#TestH12_ServerEmptyContentLength)
    * [func TestH12_RequestContentLength_Known_NonZero(t *testing.T)](#TestH12_RequestContentLength_Known_NonZero)
    * [func TestH12_RequestContentLength_Known_Zero(t *testing.T)](#TestH12_RequestContentLength_Known_Zero)
    * [func TestH12_RequestContentLength_Unknown(t *testing.T)](#TestH12_RequestContentLength_Unknown)
    * [func h12requestContentLength(t *testing.T, bodyfn func() io.Reader, wantLen int64)](#h12requestContentLength)
    * [func TestCancelRequestMidBody_h1(t *testing.T)](#TestCancelRequestMidBody_h1)
    * [func TestCancelRequestMidBody_h2(t *testing.T)](#TestCancelRequestMidBody_h2)
    * [func testCancelRequestMidBody(t *testing.T, h2 bool)](#testCancelRequestMidBody)
    * [func TestTrailersClientToServer_h1(t *testing.T)](#TestTrailersClientToServer_h1)
    * [func TestTrailersClientToServer_h2(t *testing.T)](#TestTrailersClientToServer_h2)
    * [func testTrailersClientToServer(t *testing.T, h2 bool)](#testTrailersClientToServer)
    * [func TestTrailersServerToClient_h1(t *testing.T)](#TestTrailersServerToClient_h1)
    * [func TestTrailersServerToClient_h2(t *testing.T)](#TestTrailersServerToClient_h2)
    * [func TestTrailersServerToClient_Flush_h1(t *testing.T)](#TestTrailersServerToClient_Flush_h1)
    * [func TestTrailersServerToClient_Flush_h2(t *testing.T)](#TestTrailersServerToClient_Flush_h2)
    * [func testTrailersServerToClient(t *testing.T, h2, flush bool)](#testTrailersServerToClient)
    * [func TestResponseBodyReadAfterClose_h1(t *testing.T)](#TestResponseBodyReadAfterClose_h1)
    * [func TestResponseBodyReadAfterClose_h2(t *testing.T)](#TestResponseBodyReadAfterClose_h2)
    * [func testResponseBodyReadAfterClose(t *testing.T, h2 bool)](#testResponseBodyReadAfterClose)
    * [func TestConcurrentReadWriteReqBody_h1(t *testing.T)](#TestConcurrentReadWriteReqBody_h1)
    * [func TestConcurrentReadWriteReqBody_h2(t *testing.T)](#TestConcurrentReadWriteReqBody_h2)
    * [func testConcurrentReadWriteReqBody(t *testing.T, h2 bool)](#testConcurrentReadWriteReqBody)
    * [func TestConnectRequest_h1(t *testing.T)](#TestConnectRequest_h1)
    * [func TestConnectRequest_h2(t *testing.T)](#TestConnectRequest_h2)
    * [func testConnectRequest(t *testing.T, h2 bool)](#testConnectRequest)
    * [func TestTransportUserAgent_h1(t *testing.T)](#TestTransportUserAgent_h1)
    * [func TestTransportUserAgent_h2(t *testing.T)](#TestTransportUserAgent_h2)
    * [func testTransportUserAgent(t *testing.T, h2 bool)](#testTransportUserAgent)
    * [func TestStarRequestFoo_h1(t *testing.T)](#TestStarRequestFoo_h1)
    * [func TestStarRequestFoo_h2(t *testing.T)](#TestStarRequestFoo_h2)
    * [func TestStarRequestOptions_h1(t *testing.T)](#TestStarRequestOptions_h1)
    * [func TestStarRequestOptions_h2(t *testing.T)](#TestStarRequestOptions_h2)
    * [func testStarRequest(t *testing.T, method string, h2 bool)](#testStarRequest)
    * [func TestTransportDiscardsUnneededConns(t *testing.T)](#TestTransportDiscardsUnneededConns)
    * [func TestTransportGCRequest_Body_h1(t *testing.T)](#TestTransportGCRequest_Body_h1)
    * [func TestTransportGCRequest_Body_h2(t *testing.T)](#TestTransportGCRequest_Body_h2)
    * [func TestTransportGCRequest_NoBody_h1(t *testing.T)](#TestTransportGCRequest_NoBody_h1)
    * [func TestTransportGCRequest_NoBody_h2(t *testing.T)](#TestTransportGCRequest_NoBody_h2)
    * [func testTransportGCRequest(t *testing.T, h2, body bool)](#testTransportGCRequest)
    * [func TestTransportRejectsInvalidHeaders_h1(t *testing.T)](#TestTransportRejectsInvalidHeaders_h1)
    * [func TestTransportRejectsInvalidHeaders_h2(t *testing.T)](#TestTransportRejectsInvalidHeaders_h2)
    * [func testTransportRejectsInvalidHeaders(t *testing.T, h2 bool)](#testTransportRejectsInvalidHeaders)
    * [func TestInterruptWithPanic_h1(t *testing.T)](#TestInterruptWithPanic_h1)
    * [func TestInterruptWithPanic_h2(t *testing.T)](#TestInterruptWithPanic_h2)
    * [func TestInterruptWithPanic_nil_h1(t *testing.T)](#TestInterruptWithPanic_nil_h1)
    * [func TestInterruptWithPanic_nil_h2(t *testing.T)](#TestInterruptWithPanic_nil_h2)
    * [func TestInterruptWithPanic_ErrAbortHandler_h1(t *testing.T)](#TestInterruptWithPanic_ErrAbortHandler_h1)
    * [func TestInterruptWithPanic_ErrAbortHandler_h2(t *testing.T)](#TestInterruptWithPanic_ErrAbortHandler_h2)
    * [func testInterruptWithPanic(t *testing.T, h2 bool, panicValue interface{})](#testInterruptWithPanic)
    * [func TestH12_AutoGzipWithDumpResponse(t *testing.T)](#TestH12_AutoGzipWithDumpResponse)
    * [func TestCloseIdleConnections_h1(t *testing.T)](#TestCloseIdleConnections_h1)
    * [func TestCloseIdleConnections_h2(t *testing.T)](#TestCloseIdleConnections_h2)
    * [func testCloseIdleConnections(t *testing.T, h2 bool)](#testCloseIdleConnections)
    * [func TestNoSniffExpectRequestBody_h1(t *testing.T)](#TestNoSniffExpectRequestBody_h1)
    * [func TestNoSniffExpectRequestBody_h2(t *testing.T)](#TestNoSniffExpectRequestBody_h2)
    * [func testNoSniffExpectRequestBody(t *testing.T, h2 bool)](#testNoSniffExpectRequestBody)
    * [func TestServerUndeclaredTrailers_h1(t *testing.T)](#TestServerUndeclaredTrailers_h1)
    * [func TestServerUndeclaredTrailers_h2(t *testing.T)](#TestServerUndeclaredTrailers_h2)
    * [func testServerUndeclaredTrailers(t *testing.T, h2 bool)](#testServerUndeclaredTrailers)
    * [func TestBadResponseAfterReadingBody(t *testing.T)](#TestBadResponseAfterReadingBody)
    * [func TestWriteHeader0_h1(t *testing.T)](#TestWriteHeader0_h1)
    * [func TestWriteHeader0_h2(t *testing.T)](#TestWriteHeader0_h2)
    * [func testWriteHeader0(t *testing.T, h2 bool)](#testWriteHeader0)
    * [func TestWriteHeaderNoCodeCheck_h1(t *testing.T)](#TestWriteHeaderNoCodeCheck_h1)
    * [func TestWriteHeaderNoCodeCheck_h1hijack(t *testing.T)](#TestWriteHeaderNoCodeCheck_h1hijack)
    * [func TestWriteHeaderNoCodeCheck_h2(t *testing.T)](#TestWriteHeaderNoCodeCheck_h2)
    * [func testWriteHeaderAfterWrite(t *testing.T, h2, hijack bool)](#testWriteHeaderAfterWrite)
    * [func TestBidiStreamReverseProxy(t *testing.T)](#TestBidiStreamReverseProxy)
    * [func TestH12_WebSocketUpgrade(t *testing.T)](#TestH12_WebSocketUpgrade)
    * [func containsDotFile(name string) bool](#containsDotFile)
    * [func ExampleFileServer_dotFileHiding()](#ExampleFileServer_dotFileHiding)
    * [func ExampleHandle()](#ExampleHandle)
    * [func ExampleHijacker()](#ExampleHijacker)
    * [func ExampleGet()](#ExampleGet)
    * [func ExampleFileServer()](#ExampleFileServer)
    * [func ExampleFileServer_stripPrefix()](#ExampleFileServer_stripPrefix)
    * [func ExampleStripPrefix()](#ExampleStripPrefix)
    * [func ExampleServeMux_Handle()](#ExampleServeMux_Handle)
    * [func ExampleResponseWriter_trailers()](#ExampleResponseWriter_trailers)
    * [func ExampleServer_Shutdown()](#ExampleServer_Shutdown)
    * [func ExampleListenAndServeTLS()](#ExampleListenAndServeTLS)
    * [func ExampleListenAndServe()](#ExampleListenAndServe)
    * [func ExampleHandleFunc()](#ExampleHandleFunc)
    * [func newPeopleHandler() http.Handler](#newPeopleHandler)
    * [func ExampleNotFoundHandler()](#ExampleNotFoundHandler)
    * [func TestServeFile(t *testing.T)](#TestServeFile)
    * [func TestServeFile_DotDot(t *testing.T)](#TestServeFile_DotDot)
    * [func TestServeFileDirPanicEmptyPath(t *testing.T)](#TestServeFileDirPanicEmptyPath)
    * [func TestFSRedirect(t *testing.T)](#TestFSRedirect)
    * [func TestFileServerCleans(t *testing.T)](#TestFileServerCleans)
    * [func TestFileServerEscapesNames(t *testing.T)](#TestFileServerEscapesNames)
    * [func TestFileServerSortsNames(t *testing.T)](#TestFileServerSortsNames)
    * [func mustRemoveAll(dir string)](#mustRemoveAll)
    * [func TestFileServerImplicitLeadingSlash(t *testing.T)](#TestFileServerImplicitLeadingSlash)
    * [func TestDirJoin(t *testing.T)](#TestDirJoin)
    * [func TestEmptyDirOpenCWD(t *testing.T)](#TestEmptyDirOpenCWD)
    * [func TestServeFileContentType(t *testing.T)](#TestServeFileContentType)
    * [func TestServeFileMimeType(t *testing.T)](#TestServeFileMimeType)
    * [func TestServeFileFromCWD(t *testing.T)](#TestServeFileFromCWD)
    * [func TestServeDirWithoutTrailingSlash(t *testing.T)](#TestServeDirWithoutTrailingSlash)
    * [func TestServeFileWithContentEncoding_h1(t *testing.T)](#TestServeFileWithContentEncoding_h1)
    * [func TestServeFileWithContentEncoding_h2(t *testing.T)](#TestServeFileWithContentEncoding_h2)
    * [func testServeFileWithContentEncoding(t *testing.T, h2 bool)](#testServeFileWithContentEncoding)
    * [func TestServeIndexHtml(t *testing.T)](#TestServeIndexHtml)
    * [func TestServeIndexHtmlFS(t *testing.T)](#TestServeIndexHtmlFS)
    * [func TestFileServerZeroByte(t *testing.T)](#TestFileServerZeroByte)
    * [func TestDirectoryIfNotModified(t *testing.T)](#TestDirectoryIfNotModified)
    * [func mustStat(t *testing.T, fileName string) fs.FileInfo](#mustStat)
    * [func TestServeContent(t *testing.T)](#TestServeContent)
    * [func TestServerFileStatError(t *testing.T)](#TestServerFileStatError)
    * [func TestServeContentErrorMessages(t *testing.T)](#TestServeContentErrorMessages)
    * [func TestLinuxSendfile(t *testing.T)](#TestLinuxSendfile)
    * [func getBody(t *testing.T, testName string, req Request, client *Client) (*Response, []byte)](#getBody)
    * [func TestLinuxSendfileChild(*testing.T)](#TestLinuxSendfileChild)
    * [func TestFileServerNotDirError(t *testing.T)](#TestFileServerNotDirError)
    * [func TestFileServerCleanPath(t *testing.T)](#TestFileServerCleanPath)
    * [func Test_scanETag(t *testing.T)](#Test_scanETag)
    * [func TestServeFileRejectsInvalidSuffixLengths_h1(t *testing.T)](#TestServeFileRejectsInvalidSuffixLengths_h1)
    * [func TestServeFileRejectsInvalidSuffixLengths_h2(t *testing.T)](#TestServeFileRejectsInvalidSuffixLengths_h2)
    * [func testServeFileRejectsInvalidSuffixLengths(t *testing.T, h2 bool)](#testServeFileRejectsInvalidSuffixLengths)
    * [func TestMain(m *testing.M)](#TestMain)
    * [func interestingGoroutines() (gs []string)](#interestingGoroutines)
    * [func goroutineLeaked() bool](#goroutineLeaked)
    * [func setParallel(t *testing.T)](#setParallel)
    * [func runningBenchmarks() bool](#runningBenchmarks)
    * [func afterTest(t testing.TB)](#afterTest)
    * [func waitCondition(waitFor, checkEvery time.Duration, fn func() bool) bool](#waitCondition)
    * [func waitErrCondition(waitFor, checkEvery time.Duration, fn func() error) error](#waitErrCondition)
    * [func TestQuery(t *testing.T)](#TestQuery)
    * [func TestParseFormSemicolonSeparator(t *testing.T)](#TestParseFormSemicolonSeparator)
    * [func TestParseFormQuery(t *testing.T)](#TestParseFormQuery)
    * [func TestParseFormQueryMethods(t *testing.T)](#TestParseFormQueryMethods)
    * [func TestParseFormUnknownContentType(t *testing.T)](#TestParseFormUnknownContentType)
    * [func TestParseFormInitializeOnError(t *testing.T)](#TestParseFormInitializeOnError)
    * [func TestMultipartReader(t *testing.T)](#TestMultipartReader)
    * [func TestParseMultipartFormPopulatesPostForm(t *testing.T)](#TestParseMultipartFormPopulatesPostForm)
    * [func TestParseMultipartForm(t *testing.T)](#TestParseMultipartForm)
    * [func TestParseMultipartFormFilename(t *testing.T)](#TestParseMultipartFormFilename)
    * [func TestMaxInt64ForMultipartFormMaxMemoryOverflow(t *testing.T)](#TestMaxInt64ForMultipartFormMaxMemoryOverflow)
    * [func TestRedirect_h1(t *testing.T)](#TestRedirect_h1)
    * [func TestRedirect_h2(t *testing.T)](#TestRedirect_h2)
    * [func testRedirect(t *testing.T, h2 bool)](#testRedirect)
    * [func TestSetBasicAuth(t *testing.T)](#TestSetBasicAuth)
    * [func TestMultipartRequest(t *testing.T)](#TestMultipartRequest)
    * [func TestParseMultipartFormSemicolonSeparator(t *testing.T)](#TestParseMultipartFormSemicolonSeparator)
    * [func TestMultipartRequestAuto(t *testing.T)](#TestMultipartRequestAuto)
    * [func TestMissingFileMultipartRequest(t *testing.T)](#TestMissingFileMultipartRequest)
    * [func TestFormValueCallsParseMultipartForm(t *testing.T)](#TestFormValueCallsParseMultipartForm)
    * [func TestFormFileCallsParseMultipartForm(t *testing.T)](#TestFormFileCallsParseMultipartForm)
    * [func TestParseMultipartFormOrder(t *testing.T)](#TestParseMultipartFormOrder)
    * [func TestMultipartReaderOrder(t *testing.T)](#TestMultipartReaderOrder)
    * [func TestFormFileOrder(t *testing.T)](#TestFormFileOrder)
    * [func TestReadRequestErrors(t *testing.T)](#TestReadRequestErrors)
    * [func TestNewRequestHost(t *testing.T)](#TestNewRequestHost)
    * [func TestRequestInvalidMethod(t *testing.T)](#TestRequestInvalidMethod)
    * [func TestNewRequestContentLength(t *testing.T)](#TestNewRequestContentLength)
    * [func TestParseHTTPVersion(t *testing.T)](#TestParseHTTPVersion)
    * [func TestGetBasicAuth(t *testing.T)](#TestGetBasicAuth)
    * [func TestParseBasicAuth(t *testing.T)](#TestParseBasicAuth)
    * [func TestRequestWriteBufferedWriter(t *testing.T)](#TestRequestWriteBufferedWriter)
    * [func TestRequestBadHost(t *testing.T)](#TestRequestBadHost)
    * [func TestStarRequest(t *testing.T)](#TestStarRequest)
    * [func TestIssue10884_MaxBytesEOF(t *testing.T)](#TestIssue10884_MaxBytesEOF)
    * [func TestMaxBytesReaderStickyError(t *testing.T)](#TestMaxBytesReaderStickyError)
    * [func TestMaxBytesReaderDifferentLimits(t *testing.T)](#TestMaxBytesReaderDifferentLimits)
    * [func TestWithContextDeepCopiesURL(t *testing.T)](#TestWithContextDeepCopiesURL)
    * [func TestRequestCloneTransferEncoding(t *testing.T)](#TestRequestCloneTransferEncoding)
    * [func TestNoPanicOnRoundTripWithBasicAuth_h1(t *testing.T)](#TestNoPanicOnRoundTripWithBasicAuth_h1)
    * [func TestNoPanicOnRoundTripWithBasicAuth_h2(t *testing.T)](#TestNoPanicOnRoundTripWithBasicAuth_h2)
    * [func testNoPanicWithBasicAuth(t *testing.T, h2 bool)](#testNoPanicWithBasicAuth)
    * [func TestNewRequestGetBody(t *testing.T)](#TestNewRequestGetBody)
    * [func testMissingFile(t *testing.T, req *Request)](#testMissingFile)
    * [func newTestMultipartRequest(t *testing.T) *Request](#newTestMultipartRequest)
    * [func validateTestMultipartContents(t *testing.T, req *Request, allMem bool)](#validateTestMultipartContents)
    * [func testMultipartFile(t *testing.T, req *Request, key, expectFilename, expectContent string) multipart.File](#testMultipartFile)
    * [func benchmarkReadRequest(b *testing.B, request string)](#benchmarkReadRequest)
    * [func BenchmarkReadRequestChrome(b *testing.B)](#BenchmarkReadRequestChrome)
    * [func BenchmarkReadRequestCurl(b *testing.B)](#BenchmarkReadRequestCurl)
    * [func BenchmarkReadRequestApachebench(b *testing.B)](#BenchmarkReadRequestApachebench)
    * [func BenchmarkReadRequestSiege(b *testing.B)](#BenchmarkReadRequestSiege)
    * [func BenchmarkReadRequestWrk(b *testing.B)](#BenchmarkReadRequestWrk)
    * [func BenchmarkFileAndServer_1KB(b *testing.B)](#BenchmarkFileAndServer_1KB)
    * [func BenchmarkFileAndServer_16MB(b *testing.B)](#BenchmarkFileAndServer_16MB)
    * [func BenchmarkFileAndServer_64MB(b *testing.B)](#BenchmarkFileAndServer_64MB)
    * [func benchmarkFileAndServer(b *testing.B, n int64)](#benchmarkFileAndServer)
    * [func runFileAndServerBenchmarks(b *testing.B, tlsOption bool, f *os.File, n int64)](#runFileAndServerBenchmarks)
    * [func reqBytes(req string) []byte](#reqBytes)
    * [func TestConsumingBodyOnNextConn(t *testing.T)](#TestConsumingBodyOnNextConn)
    * [func TestHostHandlers(t *testing.T)](#TestHostHandlers)
    * [func serve(code int) HandlerFunc](#serve)
    * [func checkQueryStringHandler(w ResponseWriter, r *Request)](#checkQueryStringHandler)
    * [func TestServeMuxHandler(t *testing.T)](#TestServeMuxHandler)
    * [func TestServeMuxHandleFuncWithNilHandler(t *testing.T)](#TestServeMuxHandleFuncWithNilHandler)
    * [func TestServeMuxHandlerRedirects(t *testing.T)](#TestServeMuxHandlerRedirects)
    * [func TestMuxRedirectLeadingSlashes(t *testing.T)](#TestMuxRedirectLeadingSlashes)
    * [func TestServeWithSlashRedirectKeepsQueryString(t *testing.T)](#TestServeWithSlashRedirectKeepsQueryString)
    * [func TestServeWithSlashRedirectForHostPatterns(t *testing.T)](#TestServeWithSlashRedirectForHostPatterns)
    * [func TestShouldRedirectConcurrency(t *testing.T)](#TestShouldRedirectConcurrency)
    * [func BenchmarkServeMux(b *testing.B)](#BenchmarkServeMux)
    * [func BenchmarkServeMux_SkipServe(b *testing.B)](#BenchmarkServeMux_SkipServe)
    * [func benchmarkServeMux(b *testing.B, runHandler bool)](#benchmarkServeMux)
    * [func TestServerTimeouts(t *testing.T)](#TestServerTimeouts)
    * [func testServerTimeouts(timeout time.Duration) error](#testServerTimeouts)
    * [func TestHTTP2WriteDeadlineExtendedOnNewRequest(t *testing.T)](#TestHTTP2WriteDeadlineExtendedOnNewRequest)
    * [func tryTimeouts(t *testing.T, testFunc func(timeout time.Duration) error)](#tryTimeouts)
    * [func TestHTTP2WriteDeadlineEnforcedPerStream(t *testing.T)](#TestHTTP2WriteDeadlineEnforcedPerStream)
    * [func testHTTP2WriteDeadlineEnforcedPerStream(timeout time.Duration) error](#testHTTP2WriteDeadlineEnforcedPerStream)
    * [func TestHTTP2NoWriteDeadline(t *testing.T)](#TestHTTP2NoWriteDeadline)
    * [func testHTTP2NoWriteDeadline(timeout time.Duration) error](#testHTTP2NoWriteDeadline)
    * [func TestOnlyWriteTimeout(t *testing.T)](#TestOnlyWriteTimeout)
    * [func TestIdentityResponse(t *testing.T)](#TestIdentityResponse)
    * [func testTCPConnectionCloses(t *testing.T, req string, h Handler)](#testTCPConnectionCloses)
    * [func testTCPConnectionStaysOpen(t *testing.T, req string, handler Handler)](#testTCPConnectionStaysOpen)
    * [func TestServeHTTP10Close(t *testing.T)](#TestServeHTTP10Close)
    * [func TestClientCanClose(t *testing.T)](#TestClientCanClose)
    * [func TestHandlersCanSetConnectionClose11(t *testing.T)](#TestHandlersCanSetConnectionClose11)
    * [func TestHandlersCanSetConnectionClose10(t *testing.T)](#TestHandlersCanSetConnectionClose10)
    * [func TestHTTP2UpgradeClosesConnection(t *testing.T)](#TestHTTP2UpgradeClosesConnection)
    * [func send204(w ResponseWriter, r *Request)](#send204)
    * [func send304(w ResponseWriter, r *Request)](#send304)
    * [func TestHTTP10KeepAlive204Response(t *testing.T)](#TestHTTP10KeepAlive204Response)
    * [func TestHTTP11KeepAlive204Response(t *testing.T)](#TestHTTP11KeepAlive204Response)
    * [func TestHTTP10KeepAlive304Response(t *testing.T)](#TestHTTP10KeepAlive304Response)
    * [func TestKeepAliveFinalChunkWithEOF(t *testing.T)](#TestKeepAliveFinalChunkWithEOF)
    * [func TestSetsRemoteAddr_h1(t *testing.T)](#TestSetsRemoteAddr_h1)
    * [func TestSetsRemoteAddr_h2(t *testing.T)](#TestSetsRemoteAddr_h2)
    * [func testSetsRemoteAddr(t *testing.T, h2 bool)](#testSetsRemoteAddr)
    * [func TestServerAllowsBlockingRemoteAddr(t *testing.T)](#TestServerAllowsBlockingRemoteAddr)
    * [func TestHeadResponses_h1(t *testing.T)](#TestHeadResponses_h1)
    * [func TestHeadResponses_h2(t *testing.T)](#TestHeadResponses_h2)
    * [func testHeadResponses(t *testing.T, h2 bool)](#testHeadResponses)
    * [func TestTLSHandshakeTimeout(t *testing.T)](#TestTLSHandshakeTimeout)
    * [func TestTLSServer(t *testing.T)](#TestTLSServer)
    * [func TestServeTLS(t *testing.T)](#TestServeTLS)
    * [func TestTLSServerRejectHTTPRequests(t *testing.T)](#TestTLSServerRejectHTTPRequests)
    * [func TestAutomaticHTTP2_Serve_NoTLSConfig(t *testing.T)](#TestAutomaticHTTP2_Serve_NoTLSConfig)
    * [func TestAutomaticHTTP2_Serve_NonH2TLSConfig(t *testing.T)](#TestAutomaticHTTP2_Serve_NonH2TLSConfig)
    * [func TestAutomaticHTTP2_Serve_H2TLSConfig(t *testing.T)](#TestAutomaticHTTP2_Serve_H2TLSConfig)
    * [func testAutomaticHTTP2_Serve(t *testing.T, tlsConf *tls.Config, wantH2 bool)](#testAutomaticHTTP2_Serve)
    * [func TestAutomaticHTTP2_Serve_WithTLSConfig(t *testing.T)](#TestAutomaticHTTP2_Serve_WithTLSConfig)
    * [func TestAutomaticHTTP2_ListenAndServe(t *testing.T)](#TestAutomaticHTTP2_ListenAndServe)
    * [func TestAutomaticHTTP2_ListenAndServe_GetCertificate(t *testing.T)](#TestAutomaticHTTP2_ListenAndServe_GetCertificate)
    * [func testAutomaticHTTP2_ListenAndServe(t *testing.T, tlsConf *tls.Config)](#testAutomaticHTTP2_ListenAndServe)
    * [func TestServerExpect(t *testing.T)](#TestServerExpect)
    * [func TestServerUnreadRequestBodyLittle(t *testing.T)](#TestServerUnreadRequestBodyLittle)
    * [func TestServerUnreadRequestBodyLarge(t *testing.T)](#TestServerUnreadRequestBodyLarge)
    * [func TestHandlerBodyClose(t *testing.T)](#TestHandlerBodyClose)
    * [func testHandlerBodyClose(t *testing.T, i int, tt handlerBodyCloseTest)](#testHandlerBodyClose)
    * [func TestRequestBodyReadErrorClosesConnection(t *testing.T)](#TestRequestBodyReadErrorClosesConnection)
    * [func TestInvalidTrailerClosesConnection(t *testing.T)](#TestInvalidTrailerClosesConnection)
    * [func TestRequestBodyTimeoutClosesConnection(t *testing.T)](#TestRequestBodyTimeoutClosesConnection)
    * [func TestTimeoutHandler_h1(t *testing.T)](#TestTimeoutHandler_h1)
    * [func TestTimeoutHandler_h2(t *testing.T)](#TestTimeoutHandler_h2)
    * [func testTimeoutHandler(t *testing.T, h2 bool)](#testTimeoutHandler)
    * [func TestTimeoutHandlerRace(t *testing.T)](#TestTimeoutHandlerRace)
    * [func TestTimeoutHandlerRaceHeader(t *testing.T)](#TestTimeoutHandlerRaceHeader)
    * [func TestTimeoutHandlerRaceHeaderTimeout(t *testing.T)](#TestTimeoutHandlerRaceHeaderTimeout)
    * [func TestTimeoutHandlerStartTimerWhenServing(t *testing.T)](#TestTimeoutHandlerStartTimerWhenServing)
    * [func TestTimeoutHandlerEmptyResponse(t *testing.T)](#TestTimeoutHandlerEmptyResponse)
    * [func TestTimeoutHandlerPanicRecovery(t *testing.T)](#TestTimeoutHandlerPanicRecovery)
    * [func TestRedirectBadPath(t *testing.T)](#TestRedirectBadPath)
    * [func TestRedirect(t *testing.T)](#TestRedirect)
    * [func TestRedirectContentTypeAndBody(t *testing.T)](#TestRedirectContentTypeAndBody)
    * [func TestZeroLengthPostAndResponse_h1(t *testing.T)](#TestZeroLengthPostAndResponse_h1)
    * [func TestZeroLengthPostAndResponse_h2(t *testing.T)](#TestZeroLengthPostAndResponse_h2)
    * [func testZeroLengthPostAndResponse(t *testing.T, h2 bool)](#testZeroLengthPostAndResponse)
    * [func TestHandlerPanicNil_h1(t *testing.T)](#TestHandlerPanicNil_h1)
    * [func TestHandlerPanicNil_h2(t *testing.T)](#TestHandlerPanicNil_h2)
    * [func TestHandlerPanic_h1(t *testing.T)](#TestHandlerPanic_h1)
    * [func TestHandlerPanic_h2(t *testing.T)](#TestHandlerPanic_h2)
    * [func TestHandlerPanicWithHijack(t *testing.T)](#TestHandlerPanicWithHijack)
    * [func testHandlerPanic(t *testing.T, withHijack, h2 bool, wrapper func(Handler) Handler, panicValue interface{})](#testHandlerPanic)
    * [func TestServerWriteHijackZeroBytes(t *testing.T)](#TestServerWriteHijackZeroBytes)
    * [func TestServerNoDate_h1(t *testing.T)](#TestServerNoDate_h1)
    * [func TestServerNoDate_h2(t *testing.T)](#TestServerNoDate_h2)
    * [func TestServerNoContentType_h1(t *testing.T)](#TestServerNoContentType_h1)
    * [func TestServerNoContentType_h2(t *testing.T)](#TestServerNoContentType_h2)
    * [func testServerNoHeader(t *testing.T, h2 bool, header string)](#testServerNoHeader)
    * [func TestStripPrefix(t *testing.T)](#TestStripPrefix)
    * [func TestStripPrefixNotModifyRequest(t *testing.T)](#TestStripPrefixNotModifyRequest)
    * [func TestRequestLimit_h1(t *testing.T)](#TestRequestLimit_h1)
    * [func TestRequestLimit_h2(t *testing.T)](#TestRequestLimit_h2)
    * [func testRequestLimit(t *testing.T, h2 bool)](#testRequestLimit)
    * [func TestRequestBodyLimit_h1(t *testing.T)](#TestRequestBodyLimit_h1)
    * [func TestRequestBodyLimit_h2(t *testing.T)](#TestRequestBodyLimit_h2)
    * [func testRequestBodyLimit(t *testing.T, h2 bool)](#testRequestBodyLimit)
    * [func TestClientWriteShutdown(t *testing.T)](#TestClientWriteShutdown)
    * [func TestServerBufferedChunking(t *testing.T)](#TestServerBufferedChunking)
    * [func TestServerGracefulClose(t *testing.T)](#TestServerGracefulClose)
    * [func TestCaseSensitiveMethod_h1(t *testing.T)](#TestCaseSensitiveMethod_h1)
    * [func TestCaseSensitiveMethod_h2(t *testing.T)](#TestCaseSensitiveMethod_h2)
    * [func testCaseSensitiveMethod(t *testing.T, h2 bool)](#testCaseSensitiveMethod)
    * [func TestContentLengthZero(t *testing.T)](#TestContentLengthZero)
    * [func TestCloseNotifier(t *testing.T)](#TestCloseNotifier)
    * [func TestCloseNotifierPipelined(t *testing.T)](#TestCloseNotifierPipelined)
    * [func TestCloseNotifierChanLeak(t *testing.T)](#TestCloseNotifierChanLeak)
    * [func TestHijackAfterCloseNotifier(t *testing.T)](#TestHijackAfterCloseNotifier)
    * [func TestHijackBeforeRequestBodyRead(t *testing.T)](#TestHijackBeforeRequestBodyRead)
    * [func TestOptions(t *testing.T)](#TestOptions)
    * [func TestHeaderToWire(t *testing.T)](#TestHeaderToWire)
    * [func TestAcceptMaxFds(t *testing.T)](#TestAcceptMaxFds)
    * [func TestWriteAfterHijack(t *testing.T)](#TestWriteAfterHijack)
    * [func TestDoubleHijack(t *testing.T)](#TestDoubleHijack)
    * [func TestHTTP10ConnectionHeader(t *testing.T)](#TestHTTP10ConnectionHeader)
    * [func TestServerReaderFromOrder_h1(t *testing.T)](#TestServerReaderFromOrder_h1)
    * [func TestServerReaderFromOrder_h2(t *testing.T)](#TestServerReaderFromOrder_h2)
    * [func testServerReaderFromOrder(t *testing.T, h2 bool)](#testServerReaderFromOrder)
    * [func TestCodesPreventingContentTypeAndBody(t *testing.T)](#TestCodesPreventingContentTypeAndBody)
    * [func TestContentTypeOkayOn204(t *testing.T)](#TestContentTypeOkayOn204)
    * [func TestTransportAndServerSharedBodyRace_h1(t *testing.T)](#TestTransportAndServerSharedBodyRace_h1)
    * [func TestTransportAndServerSharedBodyRace_h2(t *testing.T)](#TestTransportAndServerSharedBodyRace_h2)
    * [func testTransportAndServerSharedBodyRace(t *testing.T, h2 bool)](#testTransportAndServerSharedBodyRace)
    * [func TestRequestBodyCloseDoesntBlock(t *testing.T)](#TestRequestBodyCloseDoesntBlock)
    * [func TestResponseWriterWriteString(t *testing.T)](#TestResponseWriterWriteString)
    * [func TestAppendTime(t *testing.T)](#TestAppendTime)
    * [func TestServerConnState(t *testing.T)](#TestServerConnState)
    * [func TestServerKeepAlivesEnabled(t *testing.T)](#TestServerKeepAlivesEnabled)
    * [func TestServerEmptyBodyRace_h1(t *testing.T)](#TestServerEmptyBodyRace_h1)
    * [func TestServerEmptyBodyRace_h2(t *testing.T)](#TestServerEmptyBodyRace_h2)
    * [func testServerEmptyBodyRace(t *testing.T, h2 bool)](#testServerEmptyBodyRace)
    * [func TestServerConnStateNew(t *testing.T)](#TestServerConnStateNew)
    * [func TestCloseWrite(t *testing.T)](#TestCloseWrite)
    * [func TestServerFlushAndHijack(t *testing.T)](#TestServerFlushAndHijack)
    * [func TestServerKeepAliveAfterWriteError(t *testing.T)](#TestServerKeepAliveAfterWriteError)
    * [func TestNoContentLengthIfTransferEncoding(t *testing.T)](#TestNoContentLengthIfTransferEncoding)
    * [func TestTolerateCRLFBeforeRequestLine(t *testing.T)](#TestTolerateCRLFBeforeRequestLine)
    * [func TestIssue13893_Expect100(t *testing.T)](#TestIssue13893_Expect100)
    * [func TestIssue11549_Expect100(t *testing.T)](#TestIssue11549_Expect100)
    * [func TestHandlerFinishSkipBigContentLengthRead(t *testing.T)](#TestHandlerFinishSkipBigContentLengthRead)
    * [func TestHandlerSetsBodyNil_h1(t *testing.T)](#TestHandlerSetsBodyNil_h1)
    * [func TestHandlerSetsBodyNil_h2(t *testing.T)](#TestHandlerSetsBodyNil_h2)
    * [func testHandlerSetsBodyNil(t *testing.T, h2 bool)](#testHandlerSetsBodyNil)
    * [func TestServerValidatesHostHeader(t *testing.T)](#TestServerValidatesHostHeader)
    * [func TestServerHandlersCanHandleH2PRI(t *testing.T)](#TestServerHandlersCanHandleH2PRI)
    * [func TestServerValidatesHeaders(t *testing.T)](#TestServerValidatesHeaders)
    * [func TestServerRequestContextCancel_ServeHTTPDone_h1(t *testing.T)](#TestServerRequestContextCancel_ServeHTTPDone_h1)
    * [func TestServerRequestContextCancel_ServeHTTPDone_h2(t *testing.T)](#TestServerRequestContextCancel_ServeHTTPDone_h2)
    * [func testServerRequestContextCancel_ServeHTTPDone(t *testing.T, h2 bool)](#testServerRequestContextCancel_ServeHTTPDone)
    * [func TestServerRequestContextCancel_ConnClose(t *testing.T)](#TestServerRequestContextCancel_ConnClose)
    * [func TestServerContext_ServerContextKey_h1(t *testing.T)](#TestServerContext_ServerContextKey_h1)
    * [func TestServerContext_ServerContextKey_h2(t *testing.T)](#TestServerContext_ServerContextKey_h2)
    * [func testServerContext_ServerContextKey(t *testing.T, h2 bool)](#testServerContext_ServerContextKey)
    * [func TestServerContext_LocalAddrContextKey_h1(t *testing.T)](#TestServerContext_LocalAddrContextKey_h1)
    * [func TestServerContext_LocalAddrContextKey_h2(t *testing.T)](#TestServerContext_LocalAddrContextKey_h2)
    * [func testServerContext_LocalAddrContextKey(t *testing.T, h2 bool)](#testServerContext_LocalAddrContextKey)
    * [func TestHandlerSetTransferEncodingChunked(t *testing.T)](#TestHandlerSetTransferEncodingChunked)
    * [func TestHandlerSetTransferEncodingGzip(t *testing.T)](#TestHandlerSetTransferEncodingGzip)
    * [func BenchmarkClientServer(b *testing.B)](#BenchmarkClientServer)
    * [func BenchmarkClientServerParallel4(b *testing.B)](#BenchmarkClientServerParallel4)
    * [func BenchmarkClientServerParallel64(b *testing.B)](#BenchmarkClientServerParallel64)
    * [func BenchmarkClientServerParallelTLS4(b *testing.B)](#BenchmarkClientServerParallelTLS4)
    * [func BenchmarkClientServerParallelTLS64(b *testing.B)](#BenchmarkClientServerParallelTLS64)
    * [func benchmarkClientServerParallel(b *testing.B, parallelism int, useTLS bool)](#benchmarkClientServerParallel)
    * [func BenchmarkServer(b *testing.B)](#BenchmarkServer)
    * [func getNoBody(urlStr string) (*Response, error)](#getNoBody)
    * [func BenchmarkClient(b *testing.B)](#BenchmarkClient)
    * [func BenchmarkServerFakeConnNoKeepAlive(b *testing.B)](#BenchmarkServerFakeConnNoKeepAlive)
    * [func BenchmarkServerFakeConnWithKeepAlive(b *testing.B)](#BenchmarkServerFakeConnWithKeepAlive)
    * [func BenchmarkServerFakeConnWithKeepAliveLite(b *testing.B)](#BenchmarkServerFakeConnWithKeepAliveLite)
    * [func BenchmarkServerHandlerTypeLen(b *testing.B)](#BenchmarkServerHandlerTypeLen)
    * [func BenchmarkServerHandlerNoLen(b *testing.B)](#BenchmarkServerHandlerNoLen)
    * [func BenchmarkServerHandlerNoType(b *testing.B)](#BenchmarkServerHandlerNoType)
    * [func BenchmarkServerHandlerNoHeader(b *testing.B)](#BenchmarkServerHandlerNoHeader)
    * [func benchmarkHandler(b *testing.B, h Handler)](#benchmarkHandler)
    * [func BenchmarkServerHijack(b *testing.B)](#BenchmarkServerHijack)
    * [func BenchmarkCloseNotifier(b *testing.B)](#BenchmarkCloseNotifier)
    * [func TestConcurrentServerServe(t *testing.T)](#TestConcurrentServerServe)
    * [func TestServerIdleTimeout(t *testing.T)](#TestServerIdleTimeout)
    * [func get(t *testing.T, c *Client, url string) string](#get)
    * [func TestServerSetKeepAlivesEnabledClosesConns(t *testing.T)](#TestServerSetKeepAlivesEnabledClosesConns)
    * [func TestServerShutdown_h1(t *testing.T)](#TestServerShutdown_h1)
    * [func TestServerShutdown_h2(t *testing.T)](#TestServerShutdown_h2)
    * [func testServerShutdown(t *testing.T, h2 bool)](#testServerShutdown)
    * [func TestServerShutdownStateNew(t *testing.T)](#TestServerShutdownStateNew)
    * [func TestServerCloseDeadlock(t *testing.T)](#TestServerCloseDeadlock)
    * [func TestServerKeepAlivesEnabled_h1(t *testing.T)](#TestServerKeepAlivesEnabled_h1)
    * [func TestServerKeepAlivesEnabled_h2(t *testing.T)](#TestServerKeepAlivesEnabled_h2)
    * [func testServerKeepAlivesEnabled(t *testing.T, h2 bool)](#testServerKeepAlivesEnabled)
    * [func TestServerCancelsReadTimeoutWhenIdle(t *testing.T)](#TestServerCancelsReadTimeoutWhenIdle)
    * [func runTimeSensitiveTest(t *testing.T, durations []time.Duration, test func(t *testing.T, d time.Duration) error)](#runTimeSensitiveTest)
    * [func TestServerDuplicateBackgroundRead(t *testing.T)](#TestServerDuplicateBackgroundRead)
    * [func TestServerHijackGetsBackgroundByte(t *testing.T)](#TestServerHijackGetsBackgroundByte)
    * [func TestServerHijackGetsBackgroundByte_big(t *testing.T)](#TestServerHijackGetsBackgroundByte_big)
    * [func TestServerValidatesMethod(t *testing.T)](#TestServerValidatesMethod)
    * [func TestServerListenNotComparableListener(t *testing.T)](#TestServerListenNotComparableListener)
    * [func TestServerCloseListenerOnce(t *testing.T)](#TestServerCloseListenerOnce)
    * [func TestServerShutdownThenServe(t *testing.T)](#TestServerShutdownThenServe)
    * [func TestStripPortFromHost(t *testing.T)](#TestStripPortFromHost)
    * [func TestServerContexts(t *testing.T)](#TestServerContexts)
    * [func TestServerContextsHTTP2(t *testing.T)](#TestServerContextsHTTP2)
    * [func TestConnContextNotModifyingAllContexts(t *testing.T)](#TestConnContextNotModifyingAllContexts)
    * [func TestUnsupportedTransferEncodingsReturn501(t *testing.T)](#TestUnsupportedTransferEncodingsReturn501)
    * [func TestContentEncodingNoSniffing_h1(t *testing.T)](#TestContentEncodingNoSniffing_h1)
    * [func TestContentEncodingNoSniffing_h2(t *testing.T)](#TestContentEncodingNoSniffing_h2)
    * [func testContentEncodingNoSniffing(t *testing.T, h2 bool)](#testContentEncodingNoSniffing)
    * [func TestTimeoutHandlerSuperfluousLogs(t *testing.T)](#TestTimeoutHandlerSuperfluousLogs)
    * [func fetchWireResponse(host string, http1ReqBody []byte) ([]byte, error)](#fetchWireResponse)
    * [func BenchmarkResponseStatusLine(b *testing.B)](#BenchmarkResponseStatusLine)
    * [func TestDisableKeepAliveUpgrade(t *testing.T)](#TestDisableKeepAliveUpgrade)
    * [func TestMuxRedirectRelative(t *testing.T)](#TestMuxRedirectRelative)
    * [func TestQuerySemicolon(t *testing.T)](#TestQuerySemicolon)
    * [func testQuerySemicolon(t *testing.T, query string, wantX string, allowSemicolons, expectWarning bool)](#testQuerySemicolon)
    * [func TestDetectContentType(t *testing.T)](#TestDetectContentType)
    * [func TestServerContentType_h1(t *testing.T)](#TestServerContentType_h1)
    * [func TestServerContentType_h2(t *testing.T)](#TestServerContentType_h2)
    * [func testServerContentType(t *testing.T, h2 bool)](#testServerContentType)
    * [func TestServerIssue5953_h1(t *testing.T)](#TestServerIssue5953_h1)
    * [func TestServerIssue5953_h2(t *testing.T)](#TestServerIssue5953_h2)
    * [func testServerIssue5953(t *testing.T, h2 bool)](#testServerIssue5953)
    * [func TestContentTypeWithVariousSources_h1(t *testing.T)](#TestContentTypeWithVariousSources_h1)
    * [func TestContentTypeWithVariousSources_h2(t *testing.T)](#TestContentTypeWithVariousSources_h2)
    * [func testContentTypeWithVariousSources(t *testing.T, h2 bool)](#testContentTypeWithVariousSources)
    * [func TestSniffWriteSize_h1(t *testing.T)](#TestSniffWriteSize_h1)
    * [func TestSniffWriteSize_h2(t *testing.T)](#TestSniffWriteSize_h2)
    * [func testSniffWriteSize(t *testing.T, h2 bool)](#testSniffWriteSize)
    * [func TestReuseRequest(t *testing.T)](#TestReuseRequest)
    * [func TestTransportKeepAlives(t *testing.T)](#TestTransportKeepAlives)
    * [func TestTransportConnectionCloseOnResponse(t *testing.T)](#TestTransportConnectionCloseOnResponse)
    * [func TestTransportConnectionCloseOnRequest(t *testing.T)](#TestTransportConnectionCloseOnRequest)
    * [func TestTransportConnectionCloseOnRequestDisableKeepAlive(t *testing.T)](#TestTransportConnectionCloseOnRequestDisableKeepAlive)
    * [func TestTransportRespectRequestWantsClose(t *testing.T)](#TestTransportRespectRequestWantsClose)
    * [func TestTransportIdleCacheKeys(t *testing.T)](#TestTransportIdleCacheKeys)
    * [func TestTransportReadToEndReusesConn(t *testing.T)](#TestTransportReadToEndReusesConn)
    * [func TestTransportMaxPerHostIdleConns(t *testing.T)](#TestTransportMaxPerHostIdleConns)
    * [func TestTransportMaxConnsPerHostIncludeDialInProgress(t *testing.T)](#TestTransportMaxConnsPerHostIncludeDialInProgress)
    * [func TestTransportMaxConnsPerHost(t *testing.T)](#TestTransportMaxConnsPerHost)
    * [func TestTransportRemovesDeadIdleConnections(t *testing.T)](#TestTransportRemovesDeadIdleConnections)
    * [func TestTransportServerClosingUnexpectedly(t *testing.T)](#TestTransportServerClosingUnexpectedly)
    * [func TestStressSurpriseServerCloses(t *testing.T)](#TestStressSurpriseServerCloses)
    * [func TestTransportHeadResponses(t *testing.T)](#TestTransportHeadResponses)
    * [func TestTransportHeadChunkedResponse(t *testing.T)](#TestTransportHeadChunkedResponse)
    * [func TestRoundTripGzip(t *testing.T)](#TestRoundTripGzip)
    * [func TestTransportGzip(t *testing.T)](#TestTransportGzip)
    * [func TestTransportExpect100Continue(t *testing.T)](#TestTransportExpect100Continue)
    * [func TestSOCKS5Proxy(t *testing.T)](#TestSOCKS5Proxy)
    * [func TestTransportProxy(t *testing.T)](#TestTransportProxy)
    * [func TestTransportProxyHTTPSConnectLeak(t *testing.T)](#TestTransportProxyHTTPSConnectLeak)
    * [func TestTransportDialPreservesNetOpProxyError(t *testing.T)](#TestTransportDialPreservesNetOpProxyError)
    * [func TestTransportProxyDialDoesNotMutateProxyConnectHeader(t *testing.T)](#TestTransportProxyDialDoesNotMutateProxyConnectHeader)
    * [func TestTransportGzipRecursive(t *testing.T)](#TestTransportGzipRecursive)
    * [func TestTransportGzipShort(t *testing.T)](#TestTransportGzipShort)
    * [func waitNumGoroutine(nmax int) int](#waitNumGoroutine)
    * [func TestTransportPersistConnLeak(t *testing.T)](#TestTransportPersistConnLeak)
    * [func TestTransportPersistConnLeakShortBody(t *testing.T)](#TestTransportPersistConnLeakShortBody)
    * [func TestTransportPersistConnLeakNeverIdle(t *testing.T)](#TestTransportPersistConnLeakNeverIdle)
    * [func TestTransportPersistConnContextLeakMaxConnsPerHost(t *testing.T)](#TestTransportPersistConnContextLeakMaxConnsPerHost)
    * [func TestTransportIdleConnCrash(t *testing.T)](#TestTransportIdleConnCrash)
    * [func TestIssue3644(t *testing.T)](#TestIssue3644)
    * [func TestIssue3595(t *testing.T)](#TestIssue3595)
    * [func TestChunkedNoContent(t *testing.T)](#TestChunkedNoContent)
    * [func TestTransportConcurrency(t *testing.T)](#TestTransportConcurrency)
    * [func TestIssue4191_InfiniteGetTimeout(t *testing.T)](#TestIssue4191_InfiniteGetTimeout)
    * [func TestIssue4191_InfiniteGetToPutTimeout(t *testing.T)](#TestIssue4191_InfiniteGetToPutTimeout)
    * [func TestTransportResponseHeaderTimeout(t *testing.T)](#TestTransportResponseHeaderTimeout)
    * [func TestTransportCancelRequest(t *testing.T)](#TestTransportCancelRequest)
    * [func testTransportCancelRequestInDo(t *testing.T, body io.Reader)](#testTransportCancelRequestInDo)
    * [func TestTransportCancelRequestInDo(t *testing.T)](#TestTransportCancelRequestInDo)
    * [func TestTransportCancelRequestWithBodyInDo(t *testing.T)](#TestTransportCancelRequestWithBodyInDo)
    * [func TestTransportCancelRequestInDial(t *testing.T)](#TestTransportCancelRequestInDial)
    * [func TestCancelRequestWithChannel(t *testing.T)](#TestCancelRequestWithChannel)
    * [func TestCancelRequestWithChannelBeforeDo_Cancel(t *testing.T)](#TestCancelRequestWithChannelBeforeDo_Cancel)
    * [func TestCancelRequestWithChannelBeforeDo_Context(t *testing.T)](#TestCancelRequestWithChannelBeforeDo_Context)
    * [func testCancelRequestWithChannelBeforeDo(t *testing.T, withCtx bool)](#testCancelRequestWithChannelBeforeDo)
    * [func TestTransportCancelBeforeResponseHeaders(t *testing.T)](#TestTransportCancelBeforeResponseHeaders)
    * [func TestTransportCloseResponseBody(t *testing.T)](#TestTransportCloseResponseBody)
    * [func TestTransportAltProto(t *testing.T)](#TestTransportAltProto)
    * [func TestTransportNoHost(t *testing.T)](#TestTransportNoHost)
    * [func TestTransportEmptyMethod(t *testing.T)](#TestTransportEmptyMethod)
    * [func TestTransportSocketLateBinding(t *testing.T)](#TestTransportSocketLateBinding)
    * [func TestTransportReading100Continue(t *testing.T)](#TestTransportReading100Continue)
    * [func TestTransportIgnore1xxResponses(t *testing.T)](#TestTransportIgnore1xxResponses)
    * [func TestTransportLimits1xxResponses(t *testing.T)](#TestTransportLimits1xxResponses)
    * [func TestTransportTreat101Terminal(t *testing.T)](#TestTransportTreat101Terminal)
    * [func testProxyForRequest(t *testing.T, tt proxyFromEnvTest, proxyForRequest func(req *Request) (*url.URL, error))](#testProxyForRequest)
    * [func TestProxyFromEnvironment(t *testing.T)](#TestProxyFromEnvironment)
    * [func TestProxyFromEnvironmentLowerCase(t *testing.T)](#TestProxyFromEnvironmentLowerCase)
    * [func TestIdleConnChannelLeak(t *testing.T)](#TestIdleConnChannelLeak)
    * [func TestTransportClosesRequestBody(t *testing.T)](#TestTransportClosesRequestBody)
    * [func TestTransportTLSHandshakeTimeout(t *testing.T)](#TestTransportTLSHandshakeTimeout)
    * [func TestTLSServerClosesConnection(t *testing.T)](#TestTLSServerClosesConnection)
    * [func TestTransportNoReuseAfterEarlyResponse(t *testing.T)](#TestTransportNoReuseAfterEarlyResponse)
    * [func TestTransportIssue10457(t *testing.T)](#TestTransportIssue10457)
    * [func TestRetryRequestsOnError(t *testing.T)](#TestRetryRequestsOnError)
    * [func TestTransportClosesBodyOnError(t *testing.T)](#TestTransportClosesBodyOnError)
    * [func TestTransportDialTLS(t *testing.T)](#TestTransportDialTLS)
    * [func TestTransportDialContext(t *testing.T)](#TestTransportDialContext)
    * [func TestTransportDialTLSContext(t *testing.T)](#TestTransportDialTLSContext)
    * [func TestRoundTripReturnsProxyError(t *testing.T)](#TestRoundTripReturnsProxyError)
    * [func TestTransportCloseIdleConnsThenReturn(t *testing.T)](#TestTransportCloseIdleConnsThenReturn)
    * [func TestTransportTraceGotConnH2IdleConns(t *testing.T)](#TestTransportTraceGotConnH2IdleConns)
    * [func TestTransportRemovesH2ConnsAfterIdle(t *testing.T)](#TestTransportRemovesH2ConnsAfterIdle)
    * [func TestTransportRangeAndGzip(t *testing.T)](#TestTransportRangeAndGzip)
    * [func TestTransportResponseCancelRace(t *testing.T)](#TestTransportResponseCancelRace)
    * [func TestTransportContentEncodingCaseInsensitive(t *testing.T)](#TestTransportContentEncodingCaseInsensitive)
    * [func TestTransportDialCancelRace(t *testing.T)](#TestTransportDialCancelRace)
    * [func TestTransportFlushesBodyChunks(t *testing.T)](#TestTransportFlushesBodyChunks)
    * [func TestTransportFlushesRequestHeader(t *testing.T)](#TestTransportFlushesRequestHeader)
    * [func TestTransportPrefersResponseOverWriteError(t *testing.T)](#TestTransportPrefersResponseOverWriteError)
    * [func TestTransportAutomaticHTTP2(t *testing.T)](#TestTransportAutomaticHTTP2)
    * [func TestTransportAutomaticHTTP2_DialerAndTLSConfigSupportsHTTP2AndTLSConfig(t *testing.T)](#TestTransportAutomaticHTTP2_DialerAndTLSConfigSupportsHTTP2AndTLSConfig)
    * [func TestTransportAutomaticHTTP2_DefaultTransport(t *testing.T)](#TestTransportAutomaticHTTP2_DefaultTransport)
    * [func TestTransportAutomaticHTTP2_TLSNextProto(t *testing.T)](#TestTransportAutomaticHTTP2_TLSNextProto)
    * [func TestTransportAutomaticHTTP2_TLSConfig(t *testing.T)](#TestTransportAutomaticHTTP2_TLSConfig)
    * [func TestTransportAutomaticHTTP2_ExpectContinueTimeout(t *testing.T)](#TestTransportAutomaticHTTP2_ExpectContinueTimeout)
    * [func TestTransportAutomaticHTTP2_Dial(t *testing.T)](#TestTransportAutomaticHTTP2_Dial)
    * [func TestTransportAutomaticHTTP2_DialContext(t *testing.T)](#TestTransportAutomaticHTTP2_DialContext)
    * [func TestTransportAutomaticHTTP2_DialTLS(t *testing.T)](#TestTransportAutomaticHTTP2_DialTLS)
    * [func testTransportAutoHTTP(t *testing.T, tr *Transport, wantH2 bool)](#testTransportAutoHTTP)
    * [func TestTransportReuseConnEmptyResponseBody(t *testing.T)](#TestTransportReuseConnEmptyResponseBody)
    * [func TestNoCrashReturningTransportAltConn(t *testing.T)](#TestNoCrashReturningTransportAltConn)
    * [func TestTransportReuseConnection_Gzip_Chunked(t *testing.T)](#TestTransportReuseConnection_Gzip_Chunked)
    * [func TestTransportReuseConnection_Gzip_ContentLength(t *testing.T)](#TestTransportReuseConnection_Gzip_ContentLength)
    * [func testTransportReuseConnection_Gzip(t *testing.T, chunked bool)](#testTransportReuseConnection_Gzip)
    * [func TestTransportResponseHeaderLength(t *testing.T)](#TestTransportResponseHeaderLength)
    * [func TestTransportEventTrace(t *testing.T)](#TestTransportEventTrace)
    * [func TestTransportEventTrace_h2(t *testing.T)](#TestTransportEventTrace_h2)
    * [func TestTransportEventTrace_NoHooks(t *testing.T)](#TestTransportEventTrace_NoHooks)
    * [func TestTransportEventTrace_NoHooks_h2(t *testing.T)](#TestTransportEventTrace_NoHooks_h2)
    * [func testTransportEventTrace(t *testing.T, h2 bool, noHooks bool)](#testTransportEventTrace)
    * [func TestTransportEventTraceTLSVerify(t *testing.T)](#TestTransportEventTraceTLSVerify)
    * [func skipIfDNSHijacked(t *testing.T)](#skipIfDNSHijacked)
    * [func TestTransportEventTraceRealDNS(t *testing.T)](#TestTransportEventTraceRealDNS)
    * [func TestTransportRejectsAlphaPort(t *testing.T)](#TestTransportRejectsAlphaPort)
    * [func TestTLSHandshakeTrace(t *testing.T)](#TestTLSHandshakeTrace)
    * [func TestTransportMaxIdleConns(t *testing.T)](#TestTransportMaxIdleConns)
    * [func TestTransportIdleConnTimeout_h1(t *testing.T)](#TestTransportIdleConnTimeout_h1)
    * [func TestTransportIdleConnTimeout_h2(t *testing.T)](#TestTransportIdleConnTimeout_h2)
    * [func testTransportIdleConnTimeout(t *testing.T, h2 bool)](#testTransportIdleConnTimeout)
    * [func TestIdleConnH2Crash(t *testing.T)](#TestIdleConnH2Crash)
    * [func TestTransportReturnsPeekError(t *testing.T)](#TestTransportReturnsPeekError)
    * [func TestTransportIDNA_h1(t *testing.T)](#TestTransportIDNA_h1)
    * [func TestTransportIDNA_h2(t *testing.T)](#TestTransportIDNA_h2)
    * [func testTransportIDNA(t *testing.T, h2 bool)](#testTransportIDNA)
    * [func TestTransportProxyConnectHeader(t *testing.T)](#TestTransportProxyConnectHeader)
    * [func TestTransportProxyGetConnectHeader(t *testing.T)](#TestTransportProxyGetConnectHeader)
    * [func wantBody(res *Response, err error, want string) error](#wantBody)
    * [func newLocalListener(t *testing.T) net.Listener](#newLocalListener)
    * [func TestMissingStatusNoPanic(t *testing.T)](#TestMissingStatusNoPanic)
    * [func doFetchCheckPanic(tr *Transport, req *Request) (res *Response, err error, panicked bool)](#doFetchCheckPanic)
    * [func TestNoBodyOnChunked304Response(t *testing.T)](#TestNoBodyOnChunked304Response)
    * [func TestTransportCheckContextDoneEarly(t *testing.T)](#TestTransportCheckContextDoneEarly)
    * [func TestClientTimeoutKillsConn_BeforeHeaders(t *testing.T)](#TestClientTimeoutKillsConn_BeforeHeaders)
    * [func TestClientTimeoutKillsConn_AfterHeaders(t *testing.T)](#TestClientTimeoutKillsConn_AfterHeaders)
    * [func TestTransportResponseBodyWritableOnProtocolSwitch(t *testing.T)](#TestTransportResponseBodyWritableOnProtocolSwitch)
    * [func TestTransportCONNECTBidi(t *testing.T)](#TestTransportCONNECTBidi)
    * [func TestTransportRequestReplayable(t *testing.T)](#TestTransportRequestReplayable)
    * [func TestTransportRequestWriteRoundTrip(t *testing.T)](#TestTransportRequestWriteRoundTrip)
    * [func TestTransportClone(t *testing.T)](#TestTransportClone)
    * [func TestIs408(t *testing.T)](#TestIs408)
    * [func TestTransportIgnores408(t *testing.T)](#TestTransportIgnores408)
    * [func TestInvalidHeaderResponse(t *testing.T)](#TestInvalidHeaderResponse)
    * [func TestTransportClosesBodyOnInvalidRequests(t *testing.T)](#TestTransportClosesBodyOnInvalidRequests)
    * [func TestDontCacheBrokenHTTP2Conn(t *testing.T)](#TestDontCacheBrokenHTTP2Conn)
    * [func TestTransportDecrementConnWhenIdleConnRemoved(t *testing.T)](#TestTransportDecrementConnWhenIdleConnRemoved)
    * [func TestAltProtoCancellation(t *testing.T)](#TestAltProtoCancellation)
    * [func TestIssue32441(t *testing.T)](#TestIssue32441)
    * [func TestTransportRejectsSignInContentLength(t *testing.T)](#TestTransportRejectsSignInContentLength)
    * [func testTransportRace(req *Request)](#testTransportRace)
    * [func TestErrorWriteLoopRace(t *testing.T)](#TestErrorWriteLoopRace)
    * [func TestCancelRequestWhenSharingConnection(t *testing.T)](#TestCancelRequestWhenSharingConnection)


## <a id="const" href="#const">Constants</a>

```
tags: [private]
```

### <a id="h1Mode" href="#h1Mode">const h1Mode</a>

```
searchKey: http_test.h1Mode
tags: [private]
```

```Go
const h1Mode = false
```

### <a id="h2Mode" href="#h2Mode">const h2Mode</a>

```
searchKey: http_test.h2Mode
tags: [private]
```

```Go
const h2Mode = true
```

### <a id="testFile" href="#testFile">const testFile</a>

```
searchKey: http_test.testFile
tags: [private]
```

```Go
const testFile = "testdata/file"
```

### <a id="testFileLen" href="#testFileLen">const testFileLen</a>

```
searchKey: http_test.testFileLen
tags: [private]
```

```Go
const testFileLen = 11
```

### <a id="fileaContents" href="#fileaContents">const fileaContents</a>

```
searchKey: http_test.fileaContents
tags: [private]
```

```Go
const fileaContents = "This is a test file."
```

### <a id="filebContents" href="#filebContents">const filebContents</a>

```
searchKey: http_test.filebContents
tags: [private]
```

```Go
const filebContents = "Another test file."
```

### <a id="textaValue" href="#textaValue">const textaValue</a>

```
searchKey: http_test.textaValue
tags: [private]
```

```Go
const textaValue = "foo"
```

### <a id="textbValue" href="#textbValue">const textbValue</a>

```
searchKey: http_test.textbValue
tags: [private]
```

```Go
const textbValue = "bar"
```

### <a id="boundary" href="#boundary">const boundary</a>

```
searchKey: http_test.boundary
tags: [private]
```

```Go
const boundary = `MyBoundary`
```

### <a id="message" href="#message">const message</a>

```
searchKey: http_test.message
tags: [private]
```

```Go
const message = ...
```

### <a id="withTLS" href="#withTLS">const withTLS</a>

```
searchKey: http_test.withTLS
tags: [private]
```

```Go
const withTLS = true
```

### <a id="noTLS" href="#noTLS">const noTLS</a>

```
searchKey: http_test.noTLS
tags: [private]
```

```Go
const noTLS = false
```

### <a id="someResponse" href="#someResponse">const someResponse</a>

```
searchKey: http_test.someResponse
tags: [private]
```

```Go
const someResponse = "<html>some response</html>"
```

## <a id="var" href="#var">Variables</a>

```
tags: [private]
```

### <a id="robotsTxtHandler" href="#robotsTxtHandler">var robotsTxtHandler</a>

```
searchKey: http_test.robotsTxtHandler
tags: [private]
```

```Go
var robotsTxtHandler = ...
```

### <a id="expectedCookies" href="#expectedCookies">var expectedCookies</a>

```
searchKey: http_test.expectedCookies
tags: [private]
```

```Go
var expectedCookies = ...
```

### <a id="echoCookiesRedirectHandler" href="#echoCookiesRedirectHandler">var echoCookiesRedirectHandler</a>

```
searchKey: http_test.echoCookiesRedirectHandler
tags: [private]
```

```Go
var echoCookiesRedirectHandler = ...
```

### <a id="optQuietLog" href="#optQuietLog">var optQuietLog</a>

```
searchKey: http_test.optQuietLog
tags: [private]
```

```Go
var optQuietLog = func(ts *httptest.Server) {
	ts.Config.ErrorLog = quietLog
}
```

### <a id="ServeFileRangeTests" href="#ServeFileRangeTests">var ServeFileRangeTests</a>

```
searchKey: http_test.ServeFileRangeTests
tags: [private]
```

```Go
var ServeFileRangeTests = ...
```

### <a id="fsRedirectTestData" href="#fsRedirectTestData">var fsRedirectTestData</a>

```
searchKey: http_test.fsRedirectTestData
tags: [private]
```

```Go
var fsRedirectTestData = ...
```

### <a id="quietLog" href="#quietLog">var quietLog</a>

```
searchKey: http_test.quietLog
tags: [private]
```

```Go
var quietLog = log.New(io.Discard, "", 0)
```

### <a id="readRequestErrorTests" href="#readRequestErrorTests">var readRequestErrorTests</a>

```
searchKey: http_test.readRequestErrorTests
tags: [private]
```

```Go
var readRequestErrorTests = ...
```

### <a id="newRequestHostTests" href="#newRequestHostTests">var newRequestHostTests</a>

```
searchKey: http_test.newRequestHostTests
tags: [private]
```

```Go
var newRequestHostTests = ...
```

### <a id="parseHTTPVersionTests" href="#parseHTTPVersionTests">var parseHTTPVersionTests</a>

```
searchKey: http_test.parseHTTPVersionTests
tags: [private]
```

```Go
var parseHTTPVersionTests = ...
```

### <a id="getBasicAuthTests" href="#getBasicAuthTests">var getBasicAuthTests</a>

```
searchKey: http_test.getBasicAuthTests
tags: [private]
```

```Go
var getBasicAuthTests = ...
```

### <a id="parseBasicAuthTests" href="#parseBasicAuthTests">var parseBasicAuthTests</a>

```
searchKey: http_test.parseBasicAuthTests
tags: [private]
```

```Go
var parseBasicAuthTests = ...
```

### <a id="handlers" href="#handlers">var handlers</a>

```
searchKey: http_test.handlers
tags: [private]
```

```Go
var handlers = ...
```

### <a id="vtests" href="#vtests">var vtests</a>

```
searchKey: http_test.vtests
tags: [private]
```

```Go
var vtests = ...
```

### <a id="serveMuxRegister" href="#serveMuxRegister">var serveMuxRegister</a>

```
searchKey: http_test.serveMuxRegister
tags: [private]
```

```Go
var serveMuxRegister = ...
```

### <a id="serveMuxTests" href="#serveMuxTests">var serveMuxTests</a>

```
searchKey: http_test.serveMuxTests
tags: [private]
```

```Go
var serveMuxTests = ...
```

### <a id="serveMuxTests2" href="#serveMuxTests2">var serveMuxTests2</a>

```
searchKey: http_test.serveMuxTests2
tags: [private]
```

```Go
var serveMuxTests2 = ...
```

### <a id="serverExpectTests" href="#serverExpectTests">var serverExpectTests</a>

```
searchKey: http_test.serverExpectTests
tags: [private]
```

```Go
var serverExpectTests = ...
```

### <a id="handlerBodyCloseTests" href="#handlerBodyCloseTests">var handlerBodyCloseTests</a>

```
searchKey: http_test.handlerBodyCloseTests
tags: [private]
```

```Go
var handlerBodyCloseTests = ...
```

### <a id="testHandlerBodyConsumers" href="#testHandlerBodyConsumers">var testHandlerBodyConsumers</a>

```
searchKey: http_test.testHandlerBodyConsumers
tags: [private]
```

```Go
var testHandlerBodyConsumers = ...
```

### <a id="response" href="#response">var response</a>

```
searchKey: http_test.response
tags: [private]
```

```Go
var response = bytes.Repeat([]byte(someResponse), 2<<10/len(someResponse))
```

A Response that's just no bigger than 2KB, the buffer-before-chunking threshold. 

### <a id="sniffTests" href="#sniffTests">var sniffTests</a>

```
searchKey: http_test.sniffTests
tags: [private]
```

```Go
var sniffTests = ...
```

### <a id="hostPortHandler" href="#hostPortHandler">var hostPortHandler</a>

```
searchKey: http_test.hostPortHandler
tags: [private]
```

```Go
var hostPortHandler = ...
```

hostPortHandler writes back the client's "host:port". 

### <a id="roundTripTests" href="#roundTripTests">var roundTripTests</a>

```
searchKey: http_test.roundTripTests
tags: [private]
```

```Go
var roundTripTests = ...
```

### <a id="proxyFromEnvTests" href="#proxyFromEnvTests">var proxyFromEnvTests</a>

```
searchKey: http_test.proxyFromEnvTests
tags: [private]
```

```Go
var proxyFromEnvTests = ...
```

### <a id="isDNSHijackedOnce" href="#isDNSHijackedOnce">var isDNSHijackedOnce</a>

```
searchKey: http_test.isDNSHijackedOnce
tags: [private]
```

```Go
var isDNSHijackedOnce sync.Once
```

### <a id="isDNSHijacked" href="#isDNSHijacked">var isDNSHijacked</a>

```
searchKey: http_test.isDNSHijacked
tags: [private]
```

```Go
var isDNSHijacked bool
```

### <a id="errFakeRoundTrip" href="#errFakeRoundTrip">var errFakeRoundTrip</a>

```
searchKey: http_test.errFakeRoundTrip
tags: [private]
```

```Go
var errFakeRoundTrip = errors.New("fake roundtrip")
```

### <a id="rgz" href="#rgz">var rgz</a>

```
searchKey: http_test.rgz
tags: [private]
```

```Go
var rgz = ...
```

rgz is a gzip quine that uncompresses to itself. 

### <a id="timeoutProtoErr" href="#timeoutProtoErr">var timeoutProtoErr</a>

```
searchKey: http_test.timeoutProtoErr
tags: [private]
```

```Go
var timeoutProtoErr = errors.New("canceled as expected")
```

## <a id="type" href="#type">Types</a>

```
tags: [private]
```

### <a id="http09Writer" href="#http09Writer">type http09Writer struct</a>

```
searchKey: http_test.http09Writer
tags: [private]
```

```Go
type http09Writer struct {
	io.Writer
	h Header
}
```

#### <a id="http09Writer.Header" href="#http09Writer.Header">func (w http09Writer) Header() Header</a>

```
searchKey: http_test.http09Writer.Header
tags: [private]
```

```Go
func (w http09Writer) Header() Header
```

#### <a id="http09Writer.WriteHeader" href="#http09Writer.WriteHeader">func (w http09Writer) WriteHeader(int)</a>

```
searchKey: http_test.http09Writer.WriteHeader
tags: [private]
```

```Go
func (w http09Writer) WriteHeader(int)
```

### <a id="chanWriter" href="#chanWriter">type chanWriter chan string</a>

```
searchKey: http_test.chanWriter
tags: [private]
```

```Go
type chanWriter chan string
```

#### <a id="chanWriter.Write" href="#chanWriter.Write">func (w chanWriter) Write(p []byte) (n int, err error)</a>

```
searchKey: http_test.chanWriter.Write
tags: [private]
```

```Go
func (w chanWriter) Write(p []byte) (n int, err error)
```

### <a id="recordingTransport" href="#recordingTransport">type recordingTransport struct</a>

```
searchKey: http_test.recordingTransport
tags: [private]
```

```Go
type recordingTransport struct {
	req *Request
}
```

#### <a id="recordingTransport.RoundTrip" href="#recordingTransport.RoundTrip">func (t *recordingTransport) RoundTrip(req *Request) (resp *Response, err error)</a>

```
searchKey: http_test.recordingTransport.RoundTrip
tags: [private]
```

```Go
func (t *recordingTransport) RoundTrip(req *Request) (resp *Response, err error)
```

### <a id="redirectTest" href="#redirectTest">type redirectTest struct</a>

```
searchKey: http_test.redirectTest
tags: [private]
```

```Go
type redirectTest struct {
	suffix       string
	want         int // response code
	redirectBody string
}
```

### <a id="TestJar" href="#TestJar">type TestJar struct</a>

```
searchKey: http_test.TestJar
tags: [private]
```

```Go
type TestJar struct {
	m      sync.Mutex
	perURL map[string][]*Cookie
}
```

Just enough correctness for our redirect tests. Uses the URL.Host as the scope of all cookies. 

#### <a id="TestJar.SetCookies" href="#TestJar.SetCookies">func (j *TestJar) SetCookies(u *url.URL, cookies []*Cookie)</a>

```
searchKey: http_test.TestJar.SetCookies
tags: [private]
```

```Go
func (j *TestJar) SetCookies(u *url.URL, cookies []*Cookie)
```

#### <a id="TestJar.Cookies" href="#TestJar.Cookies">func (j *TestJar) Cookies(u *url.URL) []*Cookie</a>

```
searchKey: http_test.TestJar.Cookies
tags: [private]
```

```Go
func (j *TestJar) Cookies(u *url.URL) []*Cookie
```

### <a id="RecordingJar" href="#RecordingJar">type RecordingJar struct</a>

```
searchKey: http_test.RecordingJar
tags: [private]
```

```Go
type RecordingJar struct {
	mu  sync.Mutex
	log bytes.Buffer
}
```

RecordingJar keeps a log of calls made to it, without tracking any cookies. 

#### <a id="RecordingJar.SetCookies" href="#RecordingJar.SetCookies">func (j *RecordingJar) SetCookies(u *url.URL, cookies []*Cookie)</a>

```
searchKey: http_test.RecordingJar.SetCookies
tags: [private]
```

```Go
func (j *RecordingJar) SetCookies(u *url.URL, cookies []*Cookie)
```

#### <a id="RecordingJar.Cookies" href="#RecordingJar.Cookies">func (j *RecordingJar) Cookies(u *url.URL) []*Cookie</a>

```
searchKey: http_test.RecordingJar.Cookies
tags: [private]
```

```Go
func (j *RecordingJar) Cookies(u *url.URL) []*Cookie
```

#### <a id="RecordingJar.logf" href="#RecordingJar.logf">func (j *RecordingJar) logf(format string, args ...interface{})</a>

```
searchKey: http_test.RecordingJar.logf
tags: [private]
```

```Go
func (j *RecordingJar) logf(format string, args ...interface{})
```

### <a id="writeCountingConn" href="#writeCountingConn">type writeCountingConn struct</a>

```
searchKey: http_test.writeCountingConn
tags: [private]
```

```Go
type writeCountingConn struct {
	net.Conn
	count *int
}
```

#### <a id="writeCountingConn.Write" href="#writeCountingConn.Write">func (c *writeCountingConn) Write(p []byte) (int, error)</a>

```
searchKey: http_test.writeCountingConn.Write
tags: [private]
```

```Go
func (c *writeCountingConn) Write(p []byte) (int, error)
```

### <a id="eofReaderFunc" href="#eofReaderFunc">type eofReaderFunc func()</a>

```
searchKey: http_test.eofReaderFunc
tags: [private]
```

```Go
type eofReaderFunc func()
```

eofReaderFunc is an io.Reader that runs itself, and then returns io.EOF. 

#### <a id="eofReaderFunc.Read" href="#eofReaderFunc.Read">func (f eofReaderFunc) Read(p []byte) (n int, err error)</a>

```
searchKey: http_test.eofReaderFunc.Read
tags: [private]
```

```Go
func (f eofReaderFunc) Read(p []byte) (n int, err error)
```

### <a id="issue15577Tripper" href="#issue15577Tripper">type issue15577Tripper struct{}</a>

```
searchKey: http_test.issue15577Tripper
tags: [private]
```

```Go
type issue15577Tripper struct{}
```

issue15577Tripper returns a Response with a redirect response header and doesn't populate its Response.Request field. 

#### <a id="issue15577Tripper.RoundTrip" href="#issue15577Tripper.RoundTrip">func (issue15577Tripper) RoundTrip(*Request) (*Response, error)</a>

```
searchKey: http_test.issue15577Tripper.RoundTrip
tags: [private]
```

```Go
func (issue15577Tripper) RoundTrip(*Request) (*Response, error)
```

### <a id="issue18239Body" href="#issue18239Body">type issue18239Body struct</a>

```
searchKey: http_test.issue18239Body
tags: [private]
```

```Go
type issue18239Body struct {
	readCalls  *int32
	closeCalls *int32
	readErr    error
}
```

issue18239Body is an io.ReadCloser for TestTransportBodyReadError. Its Read returns readErr and increments *readCalls atomically. Its Close returns nil and increments *closeCalls atomically. 

#### <a id="issue18239Body.Read" href="#issue18239Body.Read">func (b issue18239Body) Read([]byte) (int, error)</a>

```
searchKey: http_test.issue18239Body.Read
tags: [private]
```

```Go
func (b issue18239Body) Read([]byte) (int, error)
```

#### <a id="issue18239Body.Close" href="#issue18239Body.Close">func (b issue18239Body) Close() error</a>

```
searchKey: http_test.issue18239Body.Close
tags: [private]
```

```Go
func (b issue18239Body) Close() error
```

### <a id="roundTripperWithoutCloseIdle" href="#roundTripperWithoutCloseIdle">type roundTripperWithoutCloseIdle struct{}</a>

```
searchKey: http_test.roundTripperWithoutCloseIdle
tags: [private]
```

```Go
type roundTripperWithoutCloseIdle struct{}
```

#### <a id="roundTripperWithoutCloseIdle.RoundTrip" href="#roundTripperWithoutCloseIdle.RoundTrip">func (roundTripperWithoutCloseIdle) RoundTrip(*Request) (*Response, error)</a>

```
searchKey: http_test.roundTripperWithoutCloseIdle.RoundTrip
tags: [private]
```

```Go
func (roundTripperWithoutCloseIdle) RoundTrip(*Request) (*Response, error)
```

### <a id="roundTripperWithCloseIdle" href="#roundTripperWithCloseIdle">type roundTripperWithCloseIdle func()</a>

```
searchKey: http_test.roundTripperWithCloseIdle
tags: [private]
```

```Go
type roundTripperWithCloseIdle func() // underlying func is CloseIdleConnections func

```

#### <a id="roundTripperWithCloseIdle.RoundTrip" href="#roundTripperWithCloseIdle.RoundTrip">func (roundTripperWithCloseIdle) RoundTrip(*Request) (*Response, error)</a>

```
searchKey: http_test.roundTripperWithCloseIdle.RoundTrip
tags: [private]
```

```Go
func (roundTripperWithCloseIdle) RoundTrip(*Request) (*Response, error)
```

#### <a id="roundTripperWithCloseIdle.CloseIdleConnections" href="#roundTripperWithCloseIdle.CloseIdleConnections">func (f roundTripperWithCloseIdle) CloseIdleConnections()</a>

```
searchKey: http_test.roundTripperWithCloseIdle.CloseIdleConnections
tags: [private]
```

```Go
func (f roundTripperWithCloseIdle) CloseIdleConnections()
```

### <a id="nilBodyRoundTripper" href="#nilBodyRoundTripper">type nilBodyRoundTripper struct{}</a>

```
searchKey: http_test.nilBodyRoundTripper
tags: [private]
```

```Go
type nilBodyRoundTripper struct{}
```

#### <a id="nilBodyRoundTripper.RoundTrip" href="#nilBodyRoundTripper.RoundTrip">func (nilBodyRoundTripper) RoundTrip(req *Request) (*Response, error)</a>

```
searchKey: http_test.nilBodyRoundTripper.RoundTrip
tags: [private]
```

```Go
func (nilBodyRoundTripper) RoundTrip(req *Request) (*Response, error)
```

### <a id="issue40382Body" href="#issue40382Body">type issue40382Body struct</a>

```
searchKey: http_test.issue40382Body
tags: [private]
```

```Go
type issue40382Body struct {
	t                *testing.T
	n                int
	closeCallsAtomic int32
}
```

issue40382Body is an io.ReadCloser for TestClientCallsCloseOnlyOnce. Its Read reads n bytes before returning io.EOF. Its Close returns nil but fails the test if called more than once. 

#### <a id="issue40382Body.Read" href="#issue40382Body.Read">func (b *issue40382Body) Read(p []byte) (int, error)</a>

```
searchKey: http_test.issue40382Body.Read
tags: [private]
```

```Go
func (b *issue40382Body) Read(p []byte) (int, error)
```

#### <a id="issue40382Body.Close" href="#issue40382Body.Close">func (b *issue40382Body) Close() error</a>

```
searchKey: http_test.issue40382Body.Close
tags: [private]
```

```Go
func (b *issue40382Body) Close() error
```

### <a id="clientServerTest" href="#clientServerTest">type clientServerTest struct</a>

```
searchKey: http_test.clientServerTest
tags: [private]
```

```Go
type clientServerTest struct {
	t  *testing.T
	h2 bool
	h  Handler
	ts *httptest.Server
	tr *Transport
	c  *Client
}
```

#### <a id="newClientServerTest" href="#newClientServerTest">func newClientServerTest(t *testing.T, h2 bool, h Handler, opts ...interface{}) *clientServerTest</a>

```
searchKey: http_test.newClientServerTest
tags: [private]
```

```Go
func newClientServerTest(t *testing.T, h2 bool, h Handler, opts ...interface{}) *clientServerTest
```

#### <a id="clientServerTest.close" href="#clientServerTest.close">func (t *clientServerTest) close()</a>

```
searchKey: http_test.clientServerTest.close
tags: [private]
```

```Go
func (t *clientServerTest) close()
```

#### <a id="clientServerTest.getURL" href="#clientServerTest.getURL">func (t *clientServerTest) getURL(u string) string</a>

```
searchKey: http_test.clientServerTest.getURL
tags: [private]
```

```Go
func (t *clientServerTest) getURL(u string) string
```

#### <a id="clientServerTest.scheme" href="#clientServerTest.scheme">func (t *clientServerTest) scheme() string</a>

```
searchKey: http_test.clientServerTest.scheme
tags: [private]
```

```Go
func (t *clientServerTest) scheme() string
```

### <a id="reqFunc" href="#reqFunc">type reqFunc func(c *net/http.Client, url string) (*net/http.Response, error)</a>

```
searchKey: http_test.reqFunc
tags: [private]
```

```Go
type reqFunc func(c *Client, url string) (*Response, error)
```

### <a id="h12Compare" href="#h12Compare">type h12Compare struct</a>

```
searchKey: http_test.h12Compare
tags: [private]
```

```Go
type h12Compare struct {
	Handler            func(ResponseWriter, *Request)    // required
	ReqFunc            reqFunc                           // optional
	CheckResponse      func(proto string, res *Response) // optional
	EarlyCheckResponse func(proto string, res *Response) // optional; pre-normalize
	Opts               []interface{}
}
```

h12Compare is a test that compares HTTP/1 and HTTP/2 behavior against each other. 

#### <a id="h12Compare.reqFunc" href="#h12Compare.reqFunc">func (tt h12Compare) reqFunc() reqFunc</a>

```
searchKey: http_test.h12Compare.reqFunc
tags: [private]
```

```Go
func (tt h12Compare) reqFunc() reqFunc
```

#### <a id="h12Compare.run" href="#h12Compare.run">func (tt h12Compare) run(t *testing.T)</a>

```
searchKey: http_test.h12Compare.run
tags: [private]
```

```Go
func (tt h12Compare) run(t *testing.T)
```

#### <a id="h12Compare.normalizeRes" href="#h12Compare.normalizeRes">func (tt h12Compare) normalizeRes(t *testing.T, res *Response, wantProto string)</a>

```
searchKey: http_test.h12Compare.normalizeRes
tags: [private]
```

```Go
func (tt h12Compare) normalizeRes(t *testing.T, res *Response, wantProto string)
```

### <a id="slurpResult" href="#slurpResult">type slurpResult struct</a>

```
searchKey: http_test.slurpResult
tags: [private]
```

```Go
type slurpResult struct {
	io.ReadCloser
	body []byte
	err  error
}
```

#### <a id="slurpResult.String" href="#slurpResult.String">func (sr slurpResult) String() string</a>

```
searchKey: http_test.slurpResult.String
tags: [private]
```

```Go
func (sr slurpResult) String() string
```

### <a id="lockedBytesBuffer" href="#lockedBytesBuffer">type lockedBytesBuffer struct</a>

```
searchKey: http_test.lockedBytesBuffer
tags: [private]
```

```Go
type lockedBytesBuffer struct {
	sync.Mutex
	bytes.Buffer
}
```

#### <a id="lockedBytesBuffer.Write" href="#lockedBytesBuffer.Write">func (b *lockedBytesBuffer) Write(p []byte) (int, error)</a>

```
searchKey: http_test.lockedBytesBuffer.Write
tags: [private]
```

```Go
func (b *lockedBytesBuffer) Write(p []byte) (int, error)
```

### <a id="noteCloseConn" href="#noteCloseConn">type noteCloseConn struct</a>

```
searchKey: http_test.noteCloseConn
tags: [private]
```

```Go
type noteCloseConn struct {
	net.Conn
	closeFunc func()
}
```

#### <a id="noteCloseConn.Close" href="#noteCloseConn.Close">func (x noteCloseConn) Close() error</a>

```
searchKey: http_test.noteCloseConn.Close
tags: [private]
```

```Go
func (x noteCloseConn) Close() error
```

### <a id="testErrorReader" href="#testErrorReader">type testErrorReader struct</a>

```
searchKey: http_test.testErrorReader
tags: [private]
```

```Go
type testErrorReader struct{ t *testing.T }
```

#### <a id="testErrorReader.Read" href="#testErrorReader.Read">func (r testErrorReader) Read(p []byte) (n int, err error)</a>

```
searchKey: http_test.testErrorReader.Read
tags: [private]
```

```Go
func (r testErrorReader) Read(p []byte) (n int, err error)
```

### <a id="dotFileHidingFile" href="#dotFileHidingFile">type dotFileHidingFile struct</a>

```
searchKey: http_test.dotFileHidingFile
tags: [private]
```

```Go
type dotFileHidingFile struct {
	http.File
}
```

dotFileHidingFile is the http.File use in dotFileHidingFileSystem. It is used to wrap the Readdir method of http.File so that we can remove files and directories that start with a period from its output. 

#### <a id="dotFileHidingFile.Readdir" href="#dotFileHidingFile.Readdir">func (f dotFileHidingFile) Readdir(n int) (fis []fs.FileInfo, err error)</a>

```
searchKey: http_test.dotFileHidingFile.Readdir
tags: [private]
```

```Go
func (f dotFileHidingFile) Readdir(n int) (fis []fs.FileInfo, err error)
```

Readdir is a wrapper around the Readdir method of the embedded File that filters out all files that start with a period in their name. 

### <a id="dotFileHidingFileSystem" href="#dotFileHidingFileSystem">type dotFileHidingFileSystem struct</a>

```
searchKey: http_test.dotFileHidingFileSystem
tags: [private]
```

```Go
type dotFileHidingFileSystem struct {
	http.FileSystem
}
```

dotFileHidingFileSystem is an http.FileSystem that hides hidden "dot files" from being served. 

#### <a id="dotFileHidingFileSystem.Open" href="#dotFileHidingFileSystem.Open">func (fsys dotFileHidingFileSystem) Open(name string) (http.File, error)</a>

```
searchKey: http_test.dotFileHidingFileSystem.Open
tags: [private]
```

```Go
func (fsys dotFileHidingFileSystem) Open(name string) (http.File, error)
```

Open is a wrapper around the Open method of the embedded FileSystem that serves a 403 permission error when name has a file or directory with whose name starts with a period in its path. 

### <a id="countHandler" href="#countHandler">type countHandler struct</a>

```
searchKey: http_test.countHandler
tags: [private]
```

```Go
type countHandler struct {
	mu sync.Mutex // guards n
	n  int
}
```

#### <a id="countHandler.ServeHTTP" href="#countHandler.ServeHTTP">func (h *countHandler) ServeHTTP(w http.ResponseWriter, r *http.Request)</a>

```
searchKey: http_test.countHandler.ServeHTTP
tags: [private]
```

```Go
func (h *countHandler) ServeHTTP(w http.ResponseWriter, r *http.Request)
```

### <a id="apiHandler" href="#apiHandler">type apiHandler struct{}</a>

```
searchKey: http_test.apiHandler
tags: [private]
```

```Go
type apiHandler struct{}
```

#### <a id="apiHandler.ServeHTTP" href="#apiHandler.ServeHTTP">func (apiHandler) ServeHTTP(http.ResponseWriter, *http.Request)</a>

```
searchKey: http_test.apiHandler.ServeHTTP
tags: [private]
```

```Go
func (apiHandler) ServeHTTP(http.ResponseWriter, *http.Request)
```

### <a id="wantRange" href="#wantRange">type wantRange struct</a>

```
searchKey: http_test.wantRange
tags: [private]
```

```Go
type wantRange struct {
	start, end int64 // range [start,end)
}
```

### <a id="testFileSystem" href="#testFileSystem">type testFileSystem struct</a>

```
searchKey: http_test.testFileSystem
tags: [private]
```

```Go
type testFileSystem struct {
	open func(name string) (File, error)
}
```

#### <a id="testFileSystem.Open" href="#testFileSystem.Open">func (fs *testFileSystem) Open(name string) (File, error)</a>

```
searchKey: http_test.testFileSystem.Open
tags: [private]
```

```Go
func (fs *testFileSystem) Open(name string) (File, error)
```

### <a id="fakeFileInfo" href="#fakeFileInfo">type fakeFileInfo struct</a>

```
searchKey: http_test.fakeFileInfo
tags: [private]
```

```Go
type fakeFileInfo struct {
	dir      bool
	basename string
	modtime  time.Time
	ents     []*fakeFileInfo
	contents string
	err      error
}
```

#### <a id="fakeFileInfo.Name" href="#fakeFileInfo.Name">func (f *fakeFileInfo) Name() string</a>

```
searchKey: http_test.fakeFileInfo.Name
tags: [private]
```

```Go
func (f *fakeFileInfo) Name() string
```

#### <a id="fakeFileInfo.Sys" href="#fakeFileInfo.Sys">func (f *fakeFileInfo) Sys() interface{}</a>

```
searchKey: http_test.fakeFileInfo.Sys
tags: [private]
```

```Go
func (f *fakeFileInfo) Sys() interface{}
```

#### <a id="fakeFileInfo.ModTime" href="#fakeFileInfo.ModTime">func (f *fakeFileInfo) ModTime() time.Time</a>

```
searchKey: http_test.fakeFileInfo.ModTime
tags: [private]
```

```Go
func (f *fakeFileInfo) ModTime() time.Time
```

#### <a id="fakeFileInfo.IsDir" href="#fakeFileInfo.IsDir">func (f *fakeFileInfo) IsDir() bool</a>

```
searchKey: http_test.fakeFileInfo.IsDir
tags: [private]
```

```Go
func (f *fakeFileInfo) IsDir() bool
```

#### <a id="fakeFileInfo.Size" href="#fakeFileInfo.Size">func (f *fakeFileInfo) Size() int64</a>

```
searchKey: http_test.fakeFileInfo.Size
tags: [private]
```

```Go
func (f *fakeFileInfo) Size() int64
```

#### <a id="fakeFileInfo.Mode" href="#fakeFileInfo.Mode">func (f *fakeFileInfo) Mode() fs.FileMode</a>

```
searchKey: http_test.fakeFileInfo.Mode
tags: [private]
```

```Go
func (f *fakeFileInfo) Mode() fs.FileMode
```

### <a id="fakeFile" href="#fakeFile">type fakeFile struct</a>

```
searchKey: http_test.fakeFile
tags: [private]
```

```Go
type fakeFile struct {
	io.ReadSeeker
	fi     *fakeFileInfo
	path   string // as opened
	entpos int
}
```

#### <a id="fakeFile.Close" href="#fakeFile.Close">func (f *fakeFile) Close() error</a>

```
searchKey: http_test.fakeFile.Close
tags: [private]
```

```Go
func (f *fakeFile) Close() error
```

#### <a id="fakeFile.Stat" href="#fakeFile.Stat">func (f *fakeFile) Stat() (fs.FileInfo, error)</a>

```
searchKey: http_test.fakeFile.Stat
tags: [private]
```

```Go
func (f *fakeFile) Stat() (fs.FileInfo, error)
```

#### <a id="fakeFile.Readdir" href="#fakeFile.Readdir">func (f *fakeFile) Readdir(count int) ([]fs.FileInfo, error)</a>

```
searchKey: http_test.fakeFile.Readdir
tags: [private]
```

```Go
func (f *fakeFile) Readdir(count int) ([]fs.FileInfo, error)
```

### <a id="fakeFS" href="#fakeFS">type fakeFS map[string]*http_test.fakeFileInfo</a>

```
searchKey: http_test.fakeFS
tags: [private]
```

```Go
type fakeFS map[string]*fakeFileInfo
```

#### <a id="fakeFS.Open" href="#fakeFS.Open">func (fsys fakeFS) Open(name string) (File, error)</a>

```
searchKey: http_test.fakeFS.Open
tags: [private]
```

```Go
func (fsys fakeFS) Open(name string) (File, error)
```

### <a id="issue12991FS" href="#issue12991FS">type issue12991FS struct{}</a>

```
searchKey: http_test.issue12991FS
tags: [private]
```

```Go
type issue12991FS struct{}
```

#### <a id="issue12991FS.Open" href="#issue12991FS.Open">func (issue12991FS) Open(string) (File, error)</a>

```
searchKey: http_test.issue12991FS.Open
tags: [private]
```

```Go
func (issue12991FS) Open(string) (File, error)
```

### <a id="issue12991File" href="#issue12991File">type issue12991File struct</a>

```
searchKey: http_test.issue12991File
tags: [private]
```

```Go
type issue12991File struct{ File }
```

#### <a id="issue12991File.Stat" href="#issue12991File.Stat">func (issue12991File) Stat() (fs.FileInfo, error)</a>

```
searchKey: http_test.issue12991File.Stat
tags: [private]
```

```Go
func (issue12991File) Stat() (fs.FileInfo, error)
```

#### <a id="issue12991File.Close" href="#issue12991File.Close">func (issue12991File) Close() error</a>

```
searchKey: http_test.issue12991File.Close
tags: [private]
```

```Go
func (issue12991File) Close() error
```

### <a id="fileServerCleanPathDir" href="#fileServerCleanPathDir">type fileServerCleanPathDir struct</a>

```
searchKey: http_test.fileServerCleanPathDir
tags: [private]
```

```Go
type fileServerCleanPathDir struct {
	log *[]string
}
```

#### <a id="fileServerCleanPathDir.Open" href="#fileServerCleanPathDir.Open">func (d fileServerCleanPathDir) Open(path string) (File, error)</a>

```
searchKey: http_test.fileServerCleanPathDir.Open
tags: [private]
```

```Go
func (d fileServerCleanPathDir) Open(path string) (File, error)
```

### <a id="panicOnSeek" href="#panicOnSeek">type panicOnSeek struct</a>

```
searchKey: http_test.panicOnSeek
tags: [private]
```

```Go
type panicOnSeek struct{ io.ReadSeeker }
```

### <a id="getBasicAuthTest" href="#getBasicAuthTest">type getBasicAuthTest struct</a>

```
searchKey: http_test.getBasicAuthTest
tags: [private]
```

```Go
type getBasicAuthTest struct {
	username, password string
	ok                 bool
}
```

### <a id="basicAuthCredentialsTest" href="#basicAuthCredentialsTest">type basicAuthCredentialsTest struct</a>

```
searchKey: http_test.basicAuthCredentialsTest
tags: [private]
```

```Go
type basicAuthCredentialsTest struct {
	username, password string
}
```

### <a id="logWrites" href="#logWrites">type logWrites struct</a>

```
searchKey: http_test.logWrites
tags: [private]
```

```Go
type logWrites struct {
	t   *testing.T
	dst *[]string
}
```

#### <a id="logWrites.WriteByte" href="#logWrites.WriteByte">func (l logWrites) WriteByte(c byte) error</a>

```
searchKey: http_test.logWrites.WriteByte
tags: [private]
```

```Go
func (l logWrites) WriteByte(c byte) error
```

#### <a id="logWrites.Write" href="#logWrites.Write">func (l logWrites) Write(p []byte) (n int, err error)</a>

```
searchKey: http_test.logWrites.Write
tags: [private]
```

```Go
func (l logWrites) Write(p []byte) (n int, err error)
```

### <a id="responseWriterJustWriter" href="#responseWriterJustWriter">type responseWriterJustWriter struct</a>

```
searchKey: http_test.responseWriterJustWriter
tags: [private]
```

```Go
type responseWriterJustWriter struct {
	io.Writer
}
```

#### <a id="responseWriterJustWriter.Header" href="#responseWriterJustWriter.Header">func (responseWriterJustWriter) Header() Header</a>

```
searchKey: http_test.responseWriterJustWriter.Header
tags: [private]
```

```Go
func (responseWriterJustWriter) Header() Header
```

#### <a id="responseWriterJustWriter.WriteHeader" href="#responseWriterJustWriter.WriteHeader">func (responseWriterJustWriter) WriteHeader(int)</a>

```
searchKey: http_test.responseWriterJustWriter.WriteHeader
tags: [private]
```

```Go
func (responseWriterJustWriter) WriteHeader(int)
```

### <a id="delayedEOFReader" href="#delayedEOFReader">type delayedEOFReader struct</a>

```
searchKey: http_test.delayedEOFReader
tags: [private]
```

```Go
type delayedEOFReader struct {
	r io.Reader
}
```

delayedEOFReader never returns (n > 0, io.EOF), instead putting off the io.EOF until a subsequent Read call. 

#### <a id="delayedEOFReader.Read" href="#delayedEOFReader.Read">func (dr delayedEOFReader) Read(p []byte) (n int, err error)</a>

```
searchKey: http_test.delayedEOFReader.Read
tags: [private]
```

```Go
func (dr delayedEOFReader) Read(p []byte) (n int, err error)
```

### <a id="infiniteReader" href="#infiniteReader">type infiniteReader struct</a>

```
searchKey: http_test.infiniteReader
tags: [private]
```

```Go
type infiniteReader struct {
	buf    []byte
	offset int
}
```

infiniteReader satisfies Read requests as if the contents of buf loop indefinitely. 

#### <a id="infiniteReader.Read" href="#infiniteReader.Read">func (r *infiniteReader) Read(b []byte) (int, error)</a>

```
searchKey: http_test.infiniteReader.Read
tags: [private]
```

```Go
func (r *infiniteReader) Read(b []byte) (int, error)
```

### <a id="dummyAddr" href="#dummyAddr">type dummyAddr string</a>

```
searchKey: http_test.dummyAddr
tags: [private]
```

```Go
type dummyAddr string
```

#### <a id="dummyAddr.Network" href="#dummyAddr.Network">func (a dummyAddr) Network() string</a>

```
searchKey: http_test.dummyAddr.Network
tags: [private]
```

```Go
func (a dummyAddr) Network() string
```

#### <a id="dummyAddr.String" href="#dummyAddr.String">func (a dummyAddr) String() string</a>

```
searchKey: http_test.dummyAddr.String
tags: [private]
```

```Go
func (a dummyAddr) String() string
```

### <a id="oneConnListener" href="#oneConnListener">type oneConnListener struct</a>

```
searchKey: http_test.oneConnListener
tags: [private]
```

```Go
type oneConnListener struct {
	conn net.Conn
}
```

#### <a id="oneConnListener.Accept" href="#oneConnListener.Accept">func (l *oneConnListener) Accept() (c net.Conn, err error)</a>

```
searchKey: http_test.oneConnListener.Accept
tags: [private]
```

```Go
func (l *oneConnListener) Accept() (c net.Conn, err error)
```

#### <a id="oneConnListener.Close" href="#oneConnListener.Close">func (l *oneConnListener) Close() error</a>

```
searchKey: http_test.oneConnListener.Close
tags: [private]
```

```Go
func (l *oneConnListener) Close() error
```

#### <a id="oneConnListener.Addr" href="#oneConnListener.Addr">func (l *oneConnListener) Addr() net.Addr</a>

```
searchKey: http_test.oneConnListener.Addr
tags: [private]
```

```Go
func (l *oneConnListener) Addr() net.Addr
```

### <a id="noopConn" href="#noopConn">type noopConn struct{}</a>

```
searchKey: http_test.noopConn
tags: [private]
```

```Go
type noopConn struct{}
```

#### <a id="noopConn.LocalAddr" href="#noopConn.LocalAddr">func (noopConn) LocalAddr() net.Addr</a>

```
searchKey: http_test.noopConn.LocalAddr
tags: [private]
```

```Go
func (noopConn) LocalAddr() net.Addr
```

#### <a id="noopConn.RemoteAddr" href="#noopConn.RemoteAddr">func (noopConn) RemoteAddr() net.Addr</a>

```
searchKey: http_test.noopConn.RemoteAddr
tags: [private]
```

```Go
func (noopConn) RemoteAddr() net.Addr
```

#### <a id="noopConn.SetDeadline" href="#noopConn.SetDeadline">func (noopConn) SetDeadline(t time.Time) error</a>

```
searchKey: http_test.noopConn.SetDeadline
tags: [private]
```

```Go
func (noopConn) SetDeadline(t time.Time) error
```

#### <a id="noopConn.SetReadDeadline" href="#noopConn.SetReadDeadline">func (noopConn) SetReadDeadline(t time.Time) error</a>

```
searchKey: http_test.noopConn.SetReadDeadline
tags: [private]
```

```Go
func (noopConn) SetReadDeadline(t time.Time) error
```

#### <a id="noopConn.SetWriteDeadline" href="#noopConn.SetWriteDeadline">func (noopConn) SetWriteDeadline(t time.Time) error</a>

```
searchKey: http_test.noopConn.SetWriteDeadline
tags: [private]
```

```Go
func (noopConn) SetWriteDeadline(t time.Time) error
```

### <a id="rwTestConn" href="#rwTestConn">type rwTestConn struct</a>

```
searchKey: http_test.rwTestConn
tags: [private]
```

```Go
type rwTestConn struct {
	io.Reader
	io.Writer
	noopConn

	closeFunc func() error // called if non-nil
	closec    chan bool    // else, if non-nil, send value to it on close
}
```

#### <a id="rwTestConn.Close" href="#rwTestConn.Close">func (c *rwTestConn) Close() error</a>

```
searchKey: http_test.rwTestConn.Close
tags: [private]
```

```Go
func (c *rwTestConn) Close() error
```

### <a id="testConn" href="#testConn">type testConn struct</a>

```
searchKey: http_test.testConn
tags: [private]
```

```Go
type testConn struct {
	readMu   sync.Mutex // for TestHandlerBodyClose
	readBuf  bytes.Buffer
	writeBuf bytes.Buffer
	closec   chan bool // if non-nil, send value to it on close
	noopConn
}
```

#### <a id="testConn.Read" href="#testConn.Read">func (c *testConn) Read(b []byte) (int, error)</a>

```
searchKey: http_test.testConn.Read
tags: [private]
```

```Go
func (c *testConn) Read(b []byte) (int, error)
```

#### <a id="testConn.Write" href="#testConn.Write">func (c *testConn) Write(b []byte) (int, error)</a>

```
searchKey: http_test.testConn.Write
tags: [private]
```

```Go
func (c *testConn) Write(b []byte) (int, error)
```

#### <a id="testConn.Close" href="#testConn.Close">func (c *testConn) Close() error</a>

```
searchKey: http_test.testConn.Close
tags: [private]
```

```Go
func (c *testConn) Close() error
```

### <a id="handlerTest" href="#handlerTest">type handlerTest struct</a>

```
searchKey: http_test.handlerTest
tags: [private]
```

```Go
type handlerTest struct {
	logbuf  bytes.Buffer
	handler Handler
}
```

#### <a id="newHandlerTest" href="#newHandlerTest">func newHandlerTest(h Handler) handlerTest</a>

```
searchKey: http_test.newHandlerTest
tags: [private]
```

```Go
func newHandlerTest(h Handler) handlerTest
```

#### <a id="handlerTest.rawResponse" href="#handlerTest.rawResponse">func (ht *handlerTest) rawResponse(req string) string</a>

```
searchKey: http_test.handlerTest.rawResponse
tags: [private]
```

```Go
func (ht *handlerTest) rawResponse(req string) string
```

### <a id="stringHandler" href="#stringHandler">type stringHandler string</a>

```
searchKey: http_test.stringHandler
tags: [private]
```

```Go
type stringHandler string
```

#### <a id="stringHandler.ServeHTTP" href="#stringHandler.ServeHTTP">func (s stringHandler) ServeHTTP(w ResponseWriter, r *Request)</a>

```
searchKey: http_test.stringHandler.ServeHTTP
tags: [private]
```

```Go
func (s stringHandler) ServeHTTP(w ResponseWriter, r *Request)
```

### <a id="trackLastConnListener" href="#trackLastConnListener">type trackLastConnListener struct</a>

```
searchKey: http_test.trackLastConnListener
tags: [private]
```

```Go
type trackLastConnListener struct {
	net.Listener

	mu   *sync.RWMutex
	last *net.Conn // destination
}
```

trackLastConnListener tracks the last net.Conn that was accepted. 

#### <a id="trackLastConnListener.Accept" href="#trackLastConnListener.Accept">func (l trackLastConnListener) Accept() (c net.Conn, err error)</a>

```
searchKey: http_test.trackLastConnListener.Accept
tags: [private]
```

```Go
func (l trackLastConnListener) Accept() (c net.Conn, err error)
```

### <a id="blockingRemoteAddrListener" href="#blockingRemoteAddrListener">type blockingRemoteAddrListener struct</a>

```
searchKey: http_test.blockingRemoteAddrListener
tags: [private]
```

```Go
type blockingRemoteAddrListener struct {
	net.Listener
	conns chan<- net.Conn
}
```

#### <a id="blockingRemoteAddrListener.Accept" href="#blockingRemoteAddrListener.Accept">func (l *blockingRemoteAddrListener) Accept() (net.Conn, error)</a>

```
searchKey: http_test.blockingRemoteAddrListener.Accept
tags: [private]
```

```Go
func (l *blockingRemoteAddrListener) Accept() (net.Conn, error)
```

### <a id="blockingRemoteAddrConn" href="#blockingRemoteAddrConn">type blockingRemoteAddrConn struct</a>

```
searchKey: http_test.blockingRemoteAddrConn
tags: [private]
```

```Go
type blockingRemoteAddrConn struct {
	net.Conn
	addrs chan net.Addr
}
```

#### <a id="blockingRemoteAddrConn.RemoteAddr" href="#blockingRemoteAddrConn.RemoteAddr">func (c *blockingRemoteAddrConn) RemoteAddr() net.Addr</a>

```
searchKey: http_test.blockingRemoteAddrConn.RemoteAddr
tags: [private]
```

```Go
func (c *blockingRemoteAddrConn) RemoteAddr() net.Addr
```

### <a id="serverExpectTest" href="#serverExpectTest">type serverExpectTest struct</a>

```
searchKey: http_test.serverExpectTest
tags: [private]
```

```Go
type serverExpectTest struct {
	contentLength    int // of request body
	chunked          bool
	expectation      string // e.g. "100-continue"
	readBody         bool   // whether handler should read the body (if false, sends StatusUnauthorized)
	expectedResponse string // expected substring in first line of http response
}
```

#### <a id="expectTest" href="#expectTest">func expectTest(contentLength int, expectation string, readBody bool, expectedResponse string) serverExpectTest</a>

```
searchKey: http_test.expectTest
tags: [private]
```

```Go
func expectTest(contentLength int, expectation string, readBody bool, expectedResponse string) serverExpectTest
```

### <a id="handlerBodyCloseTest" href="#handlerBodyCloseTest">type handlerBodyCloseTest struct</a>

```
searchKey: http_test.handlerBodyCloseTest
tags: [private]
```

```Go
type handlerBodyCloseTest struct {
	bodySize     int
	bodyChunked  bool
	reqConnClose bool

	wantEOFSearch bool // should Handler's Body.Close do Reads, looking for EOF?
	wantNextReq   bool // should it find the next request on the same conn?
}
```

#### <a id="handlerBodyCloseTest.connectionHeader" href="#handlerBodyCloseTest.connectionHeader">func (t handlerBodyCloseTest) connectionHeader() string</a>

```
searchKey: http_test.handlerBodyCloseTest.connectionHeader
tags: [private]
```

```Go
func (t handlerBodyCloseTest) connectionHeader() string
```

### <a id="testHandlerBodyConsumer" href="#testHandlerBodyConsumer">type testHandlerBodyConsumer struct</a>

```
searchKey: http_test.testHandlerBodyConsumer
tags: [private]
```

```Go
type testHandlerBodyConsumer struct {
	name string
	f    func(io.ReadCloser)
}
```

testHandlerBodyConsumer represents a function injected into a test handler to vary work done on a request Body. 

### <a id="slowTestConn" href="#slowTestConn">type slowTestConn struct</a>

```
searchKey: http_test.slowTestConn
tags: [private]
```

```Go
type slowTestConn struct {
	// over multiple calls to Read, time.Durations are slept, strings are read.
	script []interface{}
	closec chan bool

	mu     sync.Mutex // guards rd/wd
	rd, wd time.Time  // read, write deadline
	noopConn
}
```

slowTestConn is a net.Conn that provides a means to simulate parts of a request being received piecemeal. Deadlines can be set and enforced in both Read and Write. 

#### <a id="slowTestConn.SetDeadline" href="#slowTestConn.SetDeadline">func (c *slowTestConn) SetDeadline(t time.Time) error</a>

```
searchKey: http_test.slowTestConn.SetDeadline
tags: [private]
```

```Go
func (c *slowTestConn) SetDeadline(t time.Time) error
```

#### <a id="slowTestConn.SetReadDeadline" href="#slowTestConn.SetReadDeadline">func (c *slowTestConn) SetReadDeadline(t time.Time) error</a>

```
searchKey: http_test.slowTestConn.SetReadDeadline
tags: [private]
```

```Go
func (c *slowTestConn) SetReadDeadline(t time.Time) error
```

#### <a id="slowTestConn.SetWriteDeadline" href="#slowTestConn.SetWriteDeadline">func (c *slowTestConn) SetWriteDeadline(t time.Time) error</a>

```
searchKey: http_test.slowTestConn.SetWriteDeadline
tags: [private]
```

```Go
func (c *slowTestConn) SetWriteDeadline(t time.Time) error
```

#### <a id="slowTestConn.Read" href="#slowTestConn.Read">func (c *slowTestConn) Read(b []byte) (n int, err error)</a>

```
searchKey: http_test.slowTestConn.Read
tags: [private]
```

```Go
func (c *slowTestConn) Read(b []byte) (n int, err error)
```

#### <a id="slowTestConn.Close" href="#slowTestConn.Close">func (c *slowTestConn) Close() error</a>

```
searchKey: http_test.slowTestConn.Close
tags: [private]
```

```Go
func (c *slowTestConn) Close() error
```

#### <a id="slowTestConn.Write" href="#slowTestConn.Write">func (c *slowTestConn) Write(b []byte) (int, error)</a>

```
searchKey: http_test.slowTestConn.Write
tags: [private]
```

```Go
func (c *slowTestConn) Write(b []byte) (int, error)
```

### <a id="terrorWriter" href="#terrorWriter">type terrorWriter struct</a>

```
searchKey: http_test.terrorWriter
tags: [private]
```

```Go
type terrorWriter struct{ t *testing.T }
```

#### <a id="terrorWriter.Write" href="#terrorWriter.Write">func (w terrorWriter) Write(p []byte) (int, error)</a>

```
searchKey: http_test.terrorWriter.Write
tags: [private]
```

```Go
func (w terrorWriter) Write(p []byte) (int, error)
```

### <a id="neverEnding" href="#neverEnding">type neverEnding byte</a>

```
searchKey: http_test.neverEnding
tags: [private]
```

```Go
type neverEnding byte
```

#### <a id="neverEnding.Read" href="#neverEnding.Read">func (b neverEnding) Read(p []byte) (n int, err error)</a>

```
searchKey: http_test.neverEnding.Read
tags: [private]
```

```Go
func (b neverEnding) Read(p []byte) (n int, err error)
```

### <a id="countReader" href="#countReader">type countReader struct</a>

```
searchKey: http_test.countReader
tags: [private]
```

```Go
type countReader struct {
	r io.Reader
	n *int64
}
```

#### <a id="countReader.Read" href="#countReader.Read">func (cr countReader) Read(p []byte) (n int, err error)</a>

```
searchKey: http_test.countReader.Read
tags: [private]
```

```Go
func (cr countReader) Read(p []byte) (n int, err error)
```

### <a id="errorListener" href="#errorListener">type errorListener struct</a>

```
searchKey: http_test.errorListener
tags: [private]
```

```Go
type errorListener struct {
	errs []error
}
```

#### <a id="errorListener.Accept" href="#errorListener.Accept">func (l *errorListener) Accept() (c net.Conn, err error)</a>

```
searchKey: http_test.errorListener.Accept
tags: [private]
```

```Go
func (l *errorListener) Accept() (c net.Conn, err error)
```

#### <a id="errorListener.Close" href="#errorListener.Close">func (l *errorListener) Close() error</a>

```
searchKey: http_test.errorListener.Close
tags: [private]
```

```Go
func (l *errorListener) Close() error
```

#### <a id="errorListener.Addr" href="#errorListener.Addr">func (l *errorListener) Addr() net.Addr</a>

```
searchKey: http_test.errorListener.Addr
tags: [private]
```

```Go
func (l *errorListener) Addr() net.Addr
```

### <a id="closeWriteTestConn" href="#closeWriteTestConn">type closeWriteTestConn struct</a>

```
searchKey: http_test.closeWriteTestConn
tags: [private]
```

```Go
type closeWriteTestConn struct {
	rwTestConn
	didCloseWrite bool
}
```

#### <a id="closeWriteTestConn.CloseWrite" href="#closeWriteTestConn.CloseWrite">func (c *closeWriteTestConn) CloseWrite() error</a>

```
searchKey: http_test.closeWriteTestConn.CloseWrite
tags: [private]
```

```Go
func (c *closeWriteTestConn) CloseWrite() error
```

### <a id="repeatReader" href="#repeatReader">type repeatReader struct</a>

```
searchKey: http_test.repeatReader
tags: [private]
```

```Go
type repeatReader struct {
	content []byte
	count   int
	off     int
}
```

repeatReader reads content count times, then EOFs. 

#### <a id="repeatReader.Read" href="#repeatReader.Read">func (r *repeatReader) Read(p []byte) (n int, err error)</a>

```
searchKey: http_test.repeatReader.Read
tags: [private]
```

```Go
func (r *repeatReader) Read(p []byte) (n int, err error)
```

### <a id="eofListenerNotComparable" href="#eofListenerNotComparable">type eofListenerNotComparable []int</a>

```
searchKey: http_test.eofListenerNotComparable
tags: [private]
```

```Go
type eofListenerNotComparable []int
```

Listener for TestServerListenNotComparableListener. 

#### <a id="eofListenerNotComparable.Accept" href="#eofListenerNotComparable.Accept">func (eofListenerNotComparable) Accept() (net.Conn, error)</a>

```
searchKey: http_test.eofListenerNotComparable.Accept
tags: [private]
```

```Go
func (eofListenerNotComparable) Accept() (net.Conn, error)
```

#### <a id="eofListenerNotComparable.Addr" href="#eofListenerNotComparable.Addr">func (eofListenerNotComparable) Addr() net.Addr</a>

```
searchKey: http_test.eofListenerNotComparable.Addr
tags: [private]
```

```Go
func (eofListenerNotComparable) Addr() net.Addr
```

#### <a id="eofListenerNotComparable.Close" href="#eofListenerNotComparable.Close">func (eofListenerNotComparable) Close() error</a>

```
searchKey: http_test.eofListenerNotComparable.Close
tags: [private]
```

```Go
func (eofListenerNotComparable) Close() error
```

### <a id="countCloseListener" href="#countCloseListener">type countCloseListener struct</a>

```
searchKey: http_test.countCloseListener
tags: [private]
```

```Go
type countCloseListener struct {
	net.Listener
	closes int32 // atomic
}
```

countCloseListener is a Listener wrapper that counts the number of Close calls. 

#### <a id="countCloseListener.Close" href="#countCloseListener.Close">func (p *countCloseListener) Close() error</a>

```
searchKey: http_test.countCloseListener.Close
tags: [private]
```

```Go
func (p *countCloseListener) Close() error
```

### <a id="byteAtATimeReader" href="#byteAtATimeReader">type byteAtATimeReader struct</a>

```
searchKey: http_test.byteAtATimeReader
tags: [private]
```

```Go
type byteAtATimeReader struct {
	buf []byte
}
```

#### <a id="byteAtATimeReader.Read" href="#byteAtATimeReader.Read">func (b *byteAtATimeReader) Read(p []byte) (n int, err error)</a>

```
searchKey: http_test.byteAtATimeReader.Read
tags: [private]
```

```Go
func (b *byteAtATimeReader) Read(p []byte) (n int, err error)
```

### <a id="testCloseConn" href="#testCloseConn">type testCloseConn struct</a>

```
searchKey: http_test.testCloseConn
tags: [private]
```

```Go
type testCloseConn struct {
	net.Conn
	set *testConnSet
}
```

testCloseConn is a net.Conn tracked by a testConnSet. 

#### <a id="testCloseConn.Close" href="#testCloseConn.Close">func (c *testCloseConn) Close() error</a>

```
searchKey: http_test.testCloseConn.Close
tags: [private]
```

```Go
func (c *testCloseConn) Close() error
```

### <a id="testConnSet" href="#testConnSet">type testConnSet struct</a>

```
searchKey: http_test.testConnSet
tags: [private]
```

```Go
type testConnSet struct {
	t      *testing.T
	mu     sync.Mutex // guards closed and list
	closed map[net.Conn]bool
	list   []net.Conn // in order created
}
```

testConnSet tracks a set of TCP connections and whether they've been closed. 

#### <a id="makeTestDial" href="#makeTestDial">func makeTestDial(t *testing.T) (*testConnSet, func(n, addr string) (net.Conn, error))</a>

```
searchKey: http_test.makeTestDial
tags: [private]
```

```Go
func makeTestDial(t *testing.T) (*testConnSet, func(n, addr string) (net.Conn, error))
```

some tests use this to manage raw tcp connections for later inspection 

#### <a id="testConnSet.insert" href="#testConnSet.insert">func (tcs *testConnSet) insert(c net.Conn)</a>

```
searchKey: http_test.testConnSet.insert
tags: [private]
```

```Go
func (tcs *testConnSet) insert(c net.Conn)
```

#### <a id="testConnSet.remove" href="#testConnSet.remove">func (tcs *testConnSet) remove(c net.Conn)</a>

```
searchKey: http_test.testConnSet.remove
tags: [private]
```

```Go
func (tcs *testConnSet) remove(c net.Conn)
```

#### <a id="testConnSet.check" href="#testConnSet.check">func (tcs *testConnSet) check(t *testing.T)</a>

```
searchKey: http_test.testConnSet.check
tags: [private]
```

```Go
func (tcs *testConnSet) check(t *testing.T)
```

### <a id="countedConn" href="#countedConn">type countedConn struct</a>

```
searchKey: http_test.countedConn
tags: [private]
```

```Go
type countedConn struct {
	net.Conn
}
```

A countedConn is a net.Conn that decrements an atomic counter when finalized. 

### <a id="countingDialer" href="#countingDialer">type countingDialer struct</a>

```
searchKey: http_test.countingDialer
tags: [private]
```

```Go
type countingDialer struct {
	dialer      net.Dialer
	mu          sync.Mutex
	total, live int64
}
```

A countingDialer dials connections and counts the number that remain reachable. 

#### <a id="countingDialer.DialContext" href="#countingDialer.DialContext">func (d *countingDialer) DialContext(ctx context.Context, network, address string) (net.Conn, error)</a>

```
searchKey: http_test.countingDialer.DialContext
tags: [private]
```

```Go
func (d *countingDialer) DialContext(ctx context.Context, network, address string) (net.Conn, error)
```

#### <a id="countingDialer.decrement" href="#countingDialer.decrement">func (d *countingDialer) decrement(*countedConn)</a>

```
searchKey: http_test.countingDialer.decrement
tags: [private]
```

```Go
func (d *countingDialer) decrement(*countedConn)
```

#### <a id="countingDialer.Read" href="#countingDialer.Read">func (d *countingDialer) Read() (total, live int64)</a>

```
searchKey: http_test.countingDialer.Read
tags: [private]
```

```Go
func (d *countingDialer) Read() (total, live int64)
```

### <a id="countedContext" href="#countedContext">type countedContext struct</a>

```
searchKey: http_test.countedContext
tags: [private]
```

```Go
type countedContext struct {
	context.Context
}
```

### <a id="contextCounter" href="#contextCounter">type contextCounter struct</a>

```
searchKey: http_test.contextCounter
tags: [private]
```

```Go
type contextCounter struct {
	mu   sync.Mutex
	live int64
}
```

#### <a id="contextCounter.Track" href="#contextCounter.Track">func (cc *contextCounter) Track(ctx context.Context) context.Context</a>

```
searchKey: http_test.contextCounter.Track
tags: [private]
```

```Go
func (cc *contextCounter) Track(ctx context.Context) context.Context
```

#### <a id="contextCounter.decrement" href="#contextCounter.decrement">func (cc *contextCounter) decrement(*countedContext)</a>

```
searchKey: http_test.contextCounter.decrement
tags: [private]
```

```Go
func (cc *contextCounter) decrement(*countedContext)
```

#### <a id="contextCounter.Read" href="#contextCounter.Read">func (cc *contextCounter) Read() (live int64)</a>

```
searchKey: http_test.contextCounter.Read
tags: [private]
```

```Go
func (cc *contextCounter) Read() (live int64)
```

### <a id="fooProto" href="#fooProto">type fooProto struct{}</a>

```
searchKey: http_test.fooProto
tags: [private]
```

```Go
type fooProto struct{}
```

#### <a id="fooProto.RoundTrip" href="#fooProto.RoundTrip">func (fooProto) RoundTrip(req *Request) (*Response, error)</a>

```
searchKey: http_test.fooProto.RoundTrip
tags: [private]
```

```Go
func (fooProto) RoundTrip(req *Request) (*Response, error)
```

### <a id="proxyFromEnvTest" href="#proxyFromEnvTest">type proxyFromEnvTest struct</a>

```
searchKey: http_test.proxyFromEnvTest
tags: [private]
```

```Go
type proxyFromEnvTest struct {
	req string // URL to fetch; blank means "http://example.com"

	env      string // HTTP_PROXY
	httpsenv string // HTTPS_PROXY
	noenv    string // NO_PROXY
	reqmeth  string // REQUEST_METHOD

	want    string
	wanterr error
}
```

#### <a id="proxyFromEnvTest.String" href="#proxyFromEnvTest.String">func (t proxyFromEnvTest) String() string</a>

```
searchKey: http_test.proxyFromEnvTest.String
tags: [private]
```

```Go
func (t proxyFromEnvTest) String() string
```

### <a id="byteFromChanReader" href="#byteFromChanReader">type byteFromChanReader chan byte</a>

```
searchKey: http_test.byteFromChanReader
tags: [private]
```

```Go
type byteFromChanReader chan byte
```

byteFromChanReader is an io.Reader that reads a single byte at a time from the channel. When the channel is closed, the reader returns io.EOF. 

#### <a id="byteFromChanReader.Read" href="#byteFromChanReader.Read">func (c byteFromChanReader) Read(p []byte) (n int, err error)</a>

```
searchKey: http_test.byteFromChanReader.Read
tags: [private]
```

```Go
func (c byteFromChanReader) Read(p []byte) (n int, err error)
```

### <a id="closerFunc" href="#closerFunc">type closerFunc func() error</a>

```
searchKey: http_test.closerFunc
tags: [private]
```

```Go
type closerFunc func() error
```

#### <a id="closerFunc.Close" href="#closerFunc.Close">func (f closerFunc) Close() error</a>

```
searchKey: http_test.closerFunc.Close
tags: [private]
```

```Go
func (f closerFunc) Close() error
```

### <a id="writerFuncConn" href="#writerFuncConn">type writerFuncConn struct</a>

```
searchKey: http_test.writerFuncConn
tags: [private]
```

```Go
type writerFuncConn struct {
	net.Conn
	write func(p []byte) (n int, err error)
}
```

#### <a id="writerFuncConn.Write" href="#writerFuncConn.Write">func (c writerFuncConn) Write(p []byte) (n int, err error)</a>

```
searchKey: http_test.writerFuncConn.Write
tags: [private]
```

```Go
func (c writerFuncConn) Write(p []byte) (n int, err error)
```

### <a id="logWritesConn" href="#logWritesConn">type logWritesConn struct</a>

```
searchKey: http_test.logWritesConn
tags: [private]
```

```Go
type logWritesConn struct {
	net.Conn // nil. crash on use.

	w io.Writer

	rch <-chan io.Reader
	r   io.Reader // nil until received by rch

	mu     sync.Mutex
	writes []string
}
```

logWritesConn is a net.Conn that logs each Write call to writes and then proxies to w. It proxies Read calls to a reader it receives from rch. 

#### <a id="logWritesConn.Write" href="#logWritesConn.Write">func (c *logWritesConn) Write(p []byte) (n int, err error)</a>

```
searchKey: http_test.logWritesConn.Write
tags: [private]
```

```Go
func (c *logWritesConn) Write(p []byte) (n int, err error)
```

#### <a id="logWritesConn.Read" href="#logWritesConn.Read">func (c *logWritesConn) Read(p []byte) (n int, err error)</a>

```
searchKey: http_test.logWritesConn.Read
tags: [private]
```

```Go
func (c *logWritesConn) Read(p []byte) (n int, err error)
```

#### <a id="logWritesConn.Close" href="#logWritesConn.Close">func (c *logWritesConn) Close() error</a>

```
searchKey: http_test.logWritesConn.Close
tags: [private]
```

```Go
func (c *logWritesConn) Close() error
```

### <a id="funcConn" href="#funcConn">type funcConn struct</a>

```
searchKey: http_test.funcConn
tags: [private]
```

```Go
type funcConn struct {
	net.Conn
	read  func([]byte) (int, error)
	write func([]byte) (int, error)
}
```

#### <a id="funcConn.Read" href="#funcConn.Read">func (c funcConn) Read(p []byte) (int, error)</a>

```
searchKey: http_test.funcConn.Read
tags: [private]
```

```Go
func (c funcConn) Read(p []byte) (int, error)
```

#### <a id="funcConn.Write" href="#funcConn.Write">func (c funcConn) Write(p []byte) (int, error)</a>

```
searchKey: http_test.funcConn.Write
tags: [private]
```

```Go
func (c funcConn) Write(p []byte) (int, error)
```

#### <a id="funcConn.Close" href="#funcConn.Close">func (c funcConn) Close() error</a>

```
searchKey: http_test.funcConn.Close
tags: [private]
```

```Go
func (c funcConn) Close() error
```

### <a id="funcRoundTripper" href="#funcRoundTripper">type funcRoundTripper func()</a>

```
searchKey: http_test.funcRoundTripper
tags: [private]
```

```Go
type funcRoundTripper func()
```

#### <a id="funcRoundTripper.RoundTrip" href="#funcRoundTripper.RoundTrip">func (fn funcRoundTripper) RoundTrip(*Request) (*Response, error)</a>

```
searchKey: http_test.funcRoundTripper.RoundTrip
tags: [private]
```

```Go
func (fn funcRoundTripper) RoundTrip(*Request) (*Response, error)
```

### <a id="countCloseReader" href="#countCloseReader">type countCloseReader struct</a>

```
searchKey: http_test.countCloseReader
tags: [private]
```

```Go
type countCloseReader struct {
	n *int
	io.Reader
}
```

#### <a id="countCloseReader.Close" href="#countCloseReader.Close">func (cr countCloseReader) Close() error</a>

```
searchKey: http_test.countCloseReader.Close
tags: [private]
```

```Go
func (cr countCloseReader) Close() error
```

### <a id="funcWriter" href="#funcWriter">type funcWriter func([]byte) (int, error)</a>

```
searchKey: http_test.funcWriter
tags: [private]
```

```Go
type funcWriter func([]byte) (int, error)
```

#### <a id="funcWriter.Write" href="#funcWriter.Write">func (f funcWriter) Write(p []byte) (int, error)</a>

```
searchKey: http_test.funcWriter.Write
tags: [private]
```

```Go
func (f funcWriter) Write(p []byte) (int, error)
```

### <a id="doneContext" href="#doneContext">type doneContext struct</a>

```
searchKey: http_test.doneContext
tags: [private]
```

```Go
type doneContext struct {
	context.Context
	err error
}
```

#### <a id="doneContext.Done" href="#doneContext.Done">func (doneContext) Done() <-chan struct{}</a>

```
searchKey: http_test.doneContext.Done
tags: [private]
```

```Go
func (doneContext) Done() <-chan struct{}
```

#### <a id="doneContext.Err" href="#doneContext.Err">func (d doneContext) Err() error</a>

```
searchKey: http_test.doneContext.Err
tags: [private]
```

```Go
func (d doneContext) Err() error
```

### <a id="testMockTCPConn" href="#testMockTCPConn">type testMockTCPConn struct</a>

```
searchKey: http_test.testMockTCPConn
tags: [private]
```

```Go
type testMockTCPConn struct {
	*net.TCPConn

	ReadFromCalled bool
}
```

testMockTCPConn is a mock TCP connection used to test that ReadFrom is called when sending the request body. 

#### <a id="testMockTCPConn.ReadFrom" href="#testMockTCPConn.ReadFrom">func (c *testMockTCPConn) ReadFrom(r io.Reader) (int64, error)</a>

```
searchKey: http_test.testMockTCPConn.ReadFrom
tags: [private]
```

```Go
func (c *testMockTCPConn) ReadFrom(r io.Reader) (int64, error)
```

### <a id="bodyCloser" href="#bodyCloser">type bodyCloser bool</a>

```
searchKey: http_test.bodyCloser
tags: [private]
```

```Go
type bodyCloser bool
```

#### <a id="bodyCloser.Close" href="#bodyCloser.Close">func (bc *bodyCloser) Close() error</a>

```
searchKey: http_test.bodyCloser.Close
tags: [private]
```

```Go
func (bc *bodyCloser) Close() error
```

#### <a id="bodyCloser.Read" href="#bodyCloser.Read">func (bc *bodyCloser) Read(b []byte) (n int, err error)</a>

```
searchKey: http_test.bodyCloser.Read
tags: [private]
```

```Go
func (bc *bodyCloser) Read(b []byte) (n int, err error)
```

### <a id="breakableConn" href="#breakableConn">type breakableConn struct</a>

```
searchKey: http_test.breakableConn
tags: [private]
```

```Go
type breakableConn struct {
	net.Conn
	*brokenState
}
```

breakableConn is a net.Conn wrapper with a Write method that will fail when its brokenState is true. 

#### <a id="breakableConn.Write" href="#breakableConn.Write">func (w *breakableConn) Write(b []byte) (n int, err error)</a>

```
searchKey: http_test.breakableConn.Write
tags: [private]
```

```Go
func (w *breakableConn) Write(b []byte) (n int, err error)
```

### <a id="brokenState" href="#brokenState">type brokenState struct</a>

```
searchKey: http_test.brokenState
tags: [private]
```

```Go
type brokenState struct {
	sync.Mutex
	broken bool
}
```

### <a id="timeoutProto" href="#timeoutProto">type timeoutProto struct{}</a>

```
searchKey: http_test.timeoutProto
tags: [private]
```

```Go
type timeoutProto struct{}
```

#### <a id="timeoutProto.RoundTrip" href="#timeoutProto.RoundTrip">func (timeoutProto) RoundTrip(req *Request) (*Response, error)</a>

```
searchKey: http_test.timeoutProto.RoundTrip
tags: [private]
```

```Go
func (timeoutProto) RoundTrip(req *Request) (*Response, error)
```

### <a id="roundTripFunc" href="#roundTripFunc">type roundTripFunc func(r *net/http.Request) (*net/http.Response, error)</a>

```
searchKey: http_test.roundTripFunc
tags: [private]
```

```Go
type roundTripFunc func(r *Request) (*Response, error)
```

#### <a id="roundTripFunc.RoundTrip" href="#roundTripFunc.RoundTrip">func (f roundTripFunc) RoundTrip(r *Request) (*Response, error)</a>

```
searchKey: http_test.roundTripFunc.RoundTrip
tags: [private]
```

```Go
func (f roundTripFunc) RoundTrip(r *Request) (*Response, error)
```

### <a id="dumpConn" href="#dumpConn">type dumpConn struct</a>

```
searchKey: http_test.dumpConn
tags: [private]
```

```Go
type dumpConn struct {
	io.Writer
	io.Reader
}
```

dumpConn is a net.Conn which writes to Writer and reads from Reader 

#### <a id="dumpConn.Close" href="#dumpConn.Close">func (c *dumpConn) Close() error</a>

```
searchKey: http_test.dumpConn.Close
tags: [private]
```

```Go
func (c *dumpConn) Close() error
```

#### <a id="dumpConn.LocalAddr" href="#dumpConn.LocalAddr">func (c *dumpConn) LocalAddr() net.Addr</a>

```
searchKey: http_test.dumpConn.LocalAddr
tags: [private]
```

```Go
func (c *dumpConn) LocalAddr() net.Addr
```

#### <a id="dumpConn.RemoteAddr" href="#dumpConn.RemoteAddr">func (c *dumpConn) RemoteAddr() net.Addr</a>

```
searchKey: http_test.dumpConn.RemoteAddr
tags: [private]
```

```Go
func (c *dumpConn) RemoteAddr() net.Addr
```

#### <a id="dumpConn.SetDeadline" href="#dumpConn.SetDeadline">func (c *dumpConn) SetDeadline(t time.Time) error</a>

```
searchKey: http_test.dumpConn.SetDeadline
tags: [private]
```

```Go
func (c *dumpConn) SetDeadline(t time.Time) error
```

#### <a id="dumpConn.SetReadDeadline" href="#dumpConn.SetReadDeadline">func (c *dumpConn) SetReadDeadline(t time.Time) error</a>

```
searchKey: http_test.dumpConn.SetReadDeadline
tags: [private]
```

```Go
func (c *dumpConn) SetReadDeadline(t time.Time) error
```

#### <a id="dumpConn.SetWriteDeadline" href="#dumpConn.SetWriteDeadline">func (c *dumpConn) SetWriteDeadline(t time.Time) error</a>

```
searchKey: http_test.dumpConn.SetWriteDeadline
tags: [private]
```

```Go
func (c *dumpConn) SetWriteDeadline(t time.Time) error
```

### <a id="delegateReader" href="#delegateReader">type delegateReader struct</a>

```
searchKey: http_test.delegateReader
tags: [private]
```

```Go
type delegateReader struct {
	c chan io.Reader
	r io.Reader // nil until received from c
}
```

delegateReader is a reader that delegates to another reader, once it arrives on a channel. 

#### <a id="delegateReader.Read" href="#delegateReader.Read">func (r *delegateReader) Read(p []byte) (int, error)</a>

```
searchKey: http_test.delegateReader.Read
tags: [private]
```

```Go
func (r *delegateReader) Read(p []byte) (int, error)
```

## <a id="func" href="#func">Functions</a>

```
tags: [private]
```

### <a id="TestNextProtoUpgrade" href="#TestNextProtoUpgrade">func TestNextProtoUpgrade(t *testing.T)</a>

```
searchKey: http_test.TestNextProtoUpgrade
tags: [private]
```

```Go
func TestNextProtoUpgrade(t *testing.T)
```

### <a id="handleTLSProtocol09" href="#handleTLSProtocol09">func handleTLSProtocol09(srv *Server, conn *tls.Conn, h Handler)</a>

```
searchKey: http_test.handleTLSProtocol09
tags: [private]
```

```Go
func handleTLSProtocol09(srv *Server, conn *tls.Conn, h Handler)
```

handleTLSProtocol09 implements the HTTP/0.9 protocol over TLS, for the TestNextProtoUpgrade test. 

### <a id="pedanticReadAll" href="#pedanticReadAll">func pedanticReadAll(r io.Reader) (b []byte, err error)</a>

```
searchKey: http_test.pedanticReadAll
tags: [private]
```

```Go
func pedanticReadAll(r io.Reader) (b []byte, err error)
```

pedanticReadAll works like io.ReadAll but additionally verifies that r obeys the documented io.Reader contract. 

### <a id="TestClient" href="#TestClient">func TestClient(t *testing.T)</a>

```
searchKey: http_test.TestClient
tags: [private]
```

```Go
func TestClient(t *testing.T)
```

### <a id="TestClientHead_h1" href="#TestClientHead_h1">func TestClientHead_h1(t *testing.T)</a>

```
searchKey: http_test.TestClientHead_h1
tags: [private]
```

```Go
func TestClientHead_h1(t *testing.T)
```

### <a id="TestClientHead_h2" href="#TestClientHead_h2">func TestClientHead_h2(t *testing.T)</a>

```
searchKey: http_test.TestClientHead_h2
tags: [private]
```

```Go
func TestClientHead_h2(t *testing.T)
```

### <a id="testClientHead" href="#testClientHead">func testClientHead(t *testing.T, h2 bool)</a>

```
searchKey: http_test.testClientHead
tags: [private]
```

```Go
func testClientHead(t *testing.T, h2 bool)
```

### <a id="TestGetRequestFormat" href="#TestGetRequestFormat">func TestGetRequestFormat(t *testing.T)</a>

```
searchKey: http_test.TestGetRequestFormat
tags: [private]
```

```Go
func TestGetRequestFormat(t *testing.T)
```

### <a id="TestPostRequestFormat" href="#TestPostRequestFormat">func TestPostRequestFormat(t *testing.T)</a>

```
searchKey: http_test.TestPostRequestFormat
tags: [private]
```

```Go
func TestPostRequestFormat(t *testing.T)
```

### <a id="TestPostFormRequestFormat" href="#TestPostFormRequestFormat">func TestPostFormRequestFormat(t *testing.T)</a>

```
searchKey: http_test.TestPostFormRequestFormat
tags: [private]
```

```Go
func TestPostFormRequestFormat(t *testing.T)
```

### <a id="TestClientRedirects" href="#TestClientRedirects">func TestClientRedirects(t *testing.T)</a>

```
searchKey: http_test.TestClientRedirects
tags: [private]
```

```Go
func TestClientRedirects(t *testing.T)
```

### <a id="TestClientRedirectContext" href="#TestClientRedirectContext">func TestClientRedirectContext(t *testing.T)</a>

```
searchKey: http_test.TestClientRedirectContext
tags: [private]
```

```Go
func TestClientRedirectContext(t *testing.T)
```

Tests that Client redirects' contexts are derived from the original request's context. 

### <a id="TestPostRedirects" href="#TestPostRedirects">func TestPostRedirects(t *testing.T)</a>

```
searchKey: http_test.TestPostRedirects
tags: [private]
```

```Go
func TestPostRedirects(t *testing.T)
```

### <a id="TestDeleteRedirects" href="#TestDeleteRedirects">func TestDeleteRedirects(t *testing.T)</a>

```
searchKey: http_test.TestDeleteRedirects
tags: [private]
```

```Go
func TestDeleteRedirects(t *testing.T)
```

### <a id="testRedirectsByMethod" href="#testRedirectsByMethod">func testRedirectsByMethod(t *testing.T, method string, table []redirectTest, want string)</a>

```
searchKey: http_test.testRedirectsByMethod
tags: [private]
```

```Go
func testRedirectsByMethod(t *testing.T, method string, table []redirectTest, want string)
```

### <a id="removeCommonLines" href="#removeCommonLines">func removeCommonLines(a, b string) (asuffix, bsuffix string, commonLines int)</a>

```
searchKey: http_test.removeCommonLines
tags: [private]
```

```Go
func removeCommonLines(a, b string) (asuffix, bsuffix string, commonLines int)
```

### <a id="TestClientRedirectUseResponse" href="#TestClientRedirectUseResponse">func TestClientRedirectUseResponse(t *testing.T)</a>

```
searchKey: http_test.TestClientRedirectUseResponse
tags: [private]
```

```Go
func TestClientRedirectUseResponse(t *testing.T)
```

### <a id="TestClientRedirect308NoLocation" href="#TestClientRedirect308NoLocation">func TestClientRedirect308NoLocation(t *testing.T)</a>

```
searchKey: http_test.TestClientRedirect308NoLocation
tags: [private]
```

```Go
func TestClientRedirect308NoLocation(t *testing.T)
```

Issue 17773: don't follow a 308 (or 307) if the response doesn't have a Location header. 

### <a id="TestClientRedirect308NoGetBody" href="#TestClientRedirect308NoGetBody">func TestClientRedirect308NoGetBody(t *testing.T)</a>

```
searchKey: http_test.TestClientRedirect308NoGetBody
tags: [private]
```

```Go
func TestClientRedirect308NoGetBody(t *testing.T)
```

Don't follow a 307/308 if we can't resent the request body. 

### <a id="TestClientSendsCookieFromJar" href="#TestClientSendsCookieFromJar">func TestClientSendsCookieFromJar(t *testing.T)</a>

```
searchKey: http_test.TestClientSendsCookieFromJar
tags: [private]
```

```Go
func TestClientSendsCookieFromJar(t *testing.T)
```

### <a id="TestRedirectCookiesJar" href="#TestRedirectCookiesJar">func TestRedirectCookiesJar(t *testing.T)</a>

```
searchKey: http_test.TestRedirectCookiesJar
tags: [private]
```

```Go
func TestRedirectCookiesJar(t *testing.T)
```

### <a id="matchReturnedCookies" href="#matchReturnedCookies">func matchReturnedCookies(t *testing.T, expected, given []*Cookie)</a>

```
searchKey: http_test.matchReturnedCookies
tags: [private]
```

```Go
func matchReturnedCookies(t *testing.T, expected, given []*Cookie)
```

### <a id="TestJarCalls" href="#TestJarCalls">func TestJarCalls(t *testing.T)</a>

```
searchKey: http_test.TestJarCalls
tags: [private]
```

```Go
func TestJarCalls(t *testing.T)
```

### <a id="TestStreamingGet_h1" href="#TestStreamingGet_h1">func TestStreamingGet_h1(t *testing.T)</a>

```
searchKey: http_test.TestStreamingGet_h1
tags: [private]
```

```Go
func TestStreamingGet_h1(t *testing.T)
```

### <a id="TestStreamingGet_h2" href="#TestStreamingGet_h2">func TestStreamingGet_h2(t *testing.T)</a>

```
searchKey: http_test.TestStreamingGet_h2
tags: [private]
```

```Go
func TestStreamingGet_h2(t *testing.T)
```

### <a id="testStreamingGet" href="#testStreamingGet">func testStreamingGet(t *testing.T, h2 bool)</a>

```
searchKey: http_test.testStreamingGet
tags: [private]
```

```Go
func testStreamingGet(t *testing.T, h2 bool)
```

### <a id="TestClientWrites" href="#TestClientWrites">func TestClientWrites(t *testing.T)</a>

```
searchKey: http_test.TestClientWrites
tags: [private]
```

```Go
func TestClientWrites(t *testing.T)
```

TestClientWrites verifies that client requests are buffered and we don't send a TCP packet per line of the http request + body. 

### <a id="TestClientInsecureTransport" href="#TestClientInsecureTransport">func TestClientInsecureTransport(t *testing.T)</a>

```
searchKey: http_test.TestClientInsecureTransport
tags: [private]
```

```Go
func TestClientInsecureTransport(t *testing.T)
```

### <a id="TestClientErrorWithRequestURI" href="#TestClientErrorWithRequestURI">func TestClientErrorWithRequestURI(t *testing.T)</a>

```
searchKey: http_test.TestClientErrorWithRequestURI
tags: [private]
```

```Go
func TestClientErrorWithRequestURI(t *testing.T)
```

### <a id="TestClientWithCorrectTLSServerName" href="#TestClientWithCorrectTLSServerName">func TestClientWithCorrectTLSServerName(t *testing.T)</a>

```
searchKey: http_test.TestClientWithCorrectTLSServerName
tags: [private]
```

```Go
func TestClientWithCorrectTLSServerName(t *testing.T)
```

### <a id="TestClientWithIncorrectTLSServerName" href="#TestClientWithIncorrectTLSServerName">func TestClientWithIncorrectTLSServerName(t *testing.T)</a>

```
searchKey: http_test.TestClientWithIncorrectTLSServerName
tags: [private]
```

```Go
func TestClientWithIncorrectTLSServerName(t *testing.T)
```

### <a id="TestTransportUsesTLSConfigServerName" href="#TestTransportUsesTLSConfigServerName">func TestTransportUsesTLSConfigServerName(t *testing.T)</a>

```
searchKey: http_test.TestTransportUsesTLSConfigServerName
tags: [private]
```

```Go
func TestTransportUsesTLSConfigServerName(t *testing.T)
```

Test for golang.org/issue/5829; the Transport should respect TLSClientConfig.ServerName when not empty. 

tls.Config.ServerName (non-empty, set to "example.com") takes precedence over "some-other-host.tld" which previously incorrectly took precedence. We don't actually connect to (or even resolve) "some-other-host.tld", though, because of the Transport.Dial hook. 

The httptest.Server has a cert with "example.com" as its name. 

### <a id="TestResponseSetsTLSConnectionState" href="#TestResponseSetsTLSConnectionState">func TestResponseSetsTLSConnectionState(t *testing.T)</a>

```
searchKey: http_test.TestResponseSetsTLSConnectionState
tags: [private]
```

```Go
func TestResponseSetsTLSConnectionState(t *testing.T)
```

### <a id="TestHTTPSClientDetectsHTTPServer" href="#TestHTTPSClientDetectsHTTPServer">func TestHTTPSClientDetectsHTTPServer(t *testing.T)</a>

```
searchKey: http_test.TestHTTPSClientDetectsHTTPServer
tags: [private]
```

```Go
func TestHTTPSClientDetectsHTTPServer(t *testing.T)
```

Check that an HTTPS client can interpret a particular TLS error to determine that the server is speaking HTTP. See golang.org/issue/11111. 

### <a id="TestClientHeadContentLength_h1" href="#TestClientHeadContentLength_h1">func TestClientHeadContentLength_h1(t *testing.T)</a>

```
searchKey: http_test.TestClientHeadContentLength_h1
tags: [private]
```

```Go
func TestClientHeadContentLength_h1(t *testing.T)
```

Verify Response.ContentLength is populated. [https://golang.org/issue/4126](https://golang.org/issue/4126) 

### <a id="TestClientHeadContentLength_h2" href="#TestClientHeadContentLength_h2">func TestClientHeadContentLength_h2(t *testing.T)</a>

```
searchKey: http_test.TestClientHeadContentLength_h2
tags: [private]
```

```Go
func TestClientHeadContentLength_h2(t *testing.T)
```

### <a id="testClientHeadContentLength" href="#testClientHeadContentLength">func testClientHeadContentLength(t *testing.T, h2 bool)</a>

```
searchKey: http_test.testClientHeadContentLength
tags: [private]
```

```Go
func testClientHeadContentLength(t *testing.T, h2 bool)
```

### <a id="TestEmptyPasswordAuth" href="#TestEmptyPasswordAuth">func TestEmptyPasswordAuth(t *testing.T)</a>

```
searchKey: http_test.TestEmptyPasswordAuth
tags: [private]
```

```Go
func TestEmptyPasswordAuth(t *testing.T)
```

### <a id="TestBasicAuth" href="#TestBasicAuth">func TestBasicAuth(t *testing.T)</a>

```
searchKey: http_test.TestBasicAuth
tags: [private]
```

```Go
func TestBasicAuth(t *testing.T)
```

### <a id="TestBasicAuthHeadersPreserved" href="#TestBasicAuthHeadersPreserved">func TestBasicAuthHeadersPreserved(t *testing.T)</a>

```
searchKey: http_test.TestBasicAuthHeadersPreserved
tags: [private]
```

```Go
func TestBasicAuthHeadersPreserved(t *testing.T)
```

### <a id="TestStripPasswordFromError" href="#TestStripPasswordFromError">func TestStripPasswordFromError(t *testing.T)</a>

```
searchKey: http_test.TestStripPasswordFromError
tags: [private]
```

```Go
func TestStripPasswordFromError(t *testing.T)
```

### <a id="TestClientTimeout_h1" href="#TestClientTimeout_h1">func TestClientTimeout_h1(t *testing.T)</a>

```
searchKey: http_test.TestClientTimeout_h1
tags: [private]
```

```Go
func TestClientTimeout_h1(t *testing.T)
```

### <a id="TestClientTimeout_h2" href="#TestClientTimeout_h2">func TestClientTimeout_h2(t *testing.T)</a>

```
searchKey: http_test.TestClientTimeout_h2
tags: [private]
```

```Go
func TestClientTimeout_h2(t *testing.T)
```

### <a id="testClientTimeout" href="#testClientTimeout">func testClientTimeout(t *testing.T, h2 bool)</a>

```
searchKey: http_test.testClientTimeout
tags: [private]
```

```Go
func testClientTimeout(t *testing.T, h2 bool)
```

### <a id="TestClientTimeout_Headers_h1" href="#TestClientTimeout_Headers_h1">func TestClientTimeout_Headers_h1(t *testing.T)</a>

```
searchKey: http_test.TestClientTimeout_Headers_h1
tags: [private]
```

```Go
func TestClientTimeout_Headers_h1(t *testing.T)
```

### <a id="TestClientTimeout_Headers_h2" href="#TestClientTimeout_Headers_h2">func TestClientTimeout_Headers_h2(t *testing.T)</a>

```
searchKey: http_test.TestClientTimeout_Headers_h2
tags: [private]
```

```Go
func TestClientTimeout_Headers_h2(t *testing.T)
```

### <a id="testClientTimeout_Headers" href="#testClientTimeout_Headers">func testClientTimeout_Headers(t *testing.T, h2 bool)</a>

```
searchKey: http_test.testClientTimeout_Headers
tags: [private]
```

```Go
func testClientTimeout_Headers(t *testing.T, h2 bool)
```

Client.Timeout firing before getting to the body 

### <a id="TestClientTimeoutCancel" href="#TestClientTimeoutCancel">func TestClientTimeoutCancel(t *testing.T)</a>

```
searchKey: http_test.TestClientTimeoutCancel
tags: [private]
```

```Go
func TestClientTimeoutCancel(t *testing.T)
```

Issue 16094: if Client.Timeout is set but not hit, a Timeout error shouldn't be returned. 

### <a id="TestClientRedirectEatsBody_h1" href="#TestClientRedirectEatsBody_h1">func TestClientRedirectEatsBody_h1(t *testing.T)</a>

```
searchKey: http_test.TestClientRedirectEatsBody_h1
tags: [private]
```

```Go
func TestClientRedirectEatsBody_h1(t *testing.T)
```

### <a id="TestClientRedirectEatsBody_h2" href="#TestClientRedirectEatsBody_h2">func TestClientRedirectEatsBody_h2(t *testing.T)</a>

```
searchKey: http_test.TestClientRedirectEatsBody_h2
tags: [private]
```

```Go
func TestClientRedirectEatsBody_h2(t *testing.T)
```

### <a id="testClientRedirectEatsBody" href="#testClientRedirectEatsBody">func testClientRedirectEatsBody(t *testing.T, h2 bool)</a>

```
searchKey: http_test.testClientRedirectEatsBody
tags: [private]
```

```Go
func testClientRedirectEatsBody(t *testing.T, h2 bool)
```

### <a id="TestReferer" href="#TestReferer">func TestReferer(t *testing.T)</a>

```
searchKey: http_test.TestReferer
tags: [private]
```

```Go
func TestReferer(t *testing.T)
```

### <a id="TestClientRedirectResponseWithoutRequest" href="#TestClientRedirectResponseWithoutRequest">func TestClientRedirectResponseWithoutRequest(t *testing.T)</a>

```
searchKey: http_test.TestClientRedirectResponseWithoutRequest
tags: [private]
```

```Go
func TestClientRedirectResponseWithoutRequest(t *testing.T)
```

Issue 15577: don't assume the roundtripper's response populates its Request field. 

### <a id="TestClientCopyHeadersOnRedirect" href="#TestClientCopyHeadersOnRedirect">func TestClientCopyHeadersOnRedirect(t *testing.T)</a>

```
searchKey: http_test.TestClientCopyHeadersOnRedirect
tags: [private]
```

```Go
func TestClientCopyHeadersOnRedirect(t *testing.T)
```

Issue 4800: copy (some) headers when Client follows a redirect. 

### <a id="TestClientCopyHostOnRedirect" href="#TestClientCopyHostOnRedirect">func TestClientCopyHostOnRedirect(t *testing.T)</a>

```
searchKey: http_test.TestClientCopyHostOnRedirect
tags: [private]
```

```Go
func TestClientCopyHostOnRedirect(t *testing.T)
```

Issue 22233: copy host when Client follows a relative redirect. 

### <a id="TestClientAltersCookiesOnRedirect" href="#TestClientAltersCookiesOnRedirect">func TestClientAltersCookiesOnRedirect(t *testing.T)</a>

```
searchKey: http_test.TestClientAltersCookiesOnRedirect
tags: [private]
```

```Go
func TestClientAltersCookiesOnRedirect(t *testing.T)
```

Issue 17494: cookies should be altered when Client follows redirects. 

### <a id="TestShouldCopyHeaderOnRedirect" href="#TestShouldCopyHeaderOnRedirect">func TestShouldCopyHeaderOnRedirect(t *testing.T)</a>

```
searchKey: http_test.TestShouldCopyHeaderOnRedirect
tags: [private]
```

```Go
func TestShouldCopyHeaderOnRedirect(t *testing.T)
```

Part of Issue 4800 

### <a id="TestClientRedirectTypes" href="#TestClientRedirectTypes">func TestClientRedirectTypes(t *testing.T)</a>

```
searchKey: http_test.TestClientRedirectTypes
tags: [private]
```

```Go
func TestClientRedirectTypes(t *testing.T)
```

### <a id="TestTransportBodyReadError" href="#TestTransportBodyReadError">func TestTransportBodyReadError(t *testing.T)</a>

```
searchKey: http_test.TestTransportBodyReadError
tags: [private]
```

```Go
func TestTransportBodyReadError(t *testing.T)
```

Issue 18239: make sure the Transport doesn't retry requests with bodies if Request.GetBody is not defined. 

### <a id="TestClientCloseIdleConnections" href="#TestClientCloseIdleConnections">func TestClientCloseIdleConnections(t *testing.T)</a>

```
searchKey: http_test.TestClientCloseIdleConnections
tags: [private]
```

```Go
func TestClientCloseIdleConnections(t *testing.T)
```

### <a id="TestClientPropagatesTimeoutToContext" href="#TestClientPropagatesTimeoutToContext">func TestClientPropagatesTimeoutToContext(t *testing.T)</a>

```
searchKey: http_test.TestClientPropagatesTimeoutToContext
tags: [private]
```

```Go
func TestClientPropagatesTimeoutToContext(t *testing.T)
```

### <a id="TestClientDoCanceledVsTimeout_h1" href="#TestClientDoCanceledVsTimeout_h1">func TestClientDoCanceledVsTimeout_h1(t *testing.T)</a>

```
searchKey: http_test.TestClientDoCanceledVsTimeout_h1
tags: [private]
```

```Go
func TestClientDoCanceledVsTimeout_h1(t *testing.T)
```

### <a id="TestClientDoCanceledVsTimeout_h2" href="#TestClientDoCanceledVsTimeout_h2">func TestClientDoCanceledVsTimeout_h2(t *testing.T)</a>

```
searchKey: http_test.TestClientDoCanceledVsTimeout_h2
tags: [private]
```

```Go
func TestClientDoCanceledVsTimeout_h2(t *testing.T)
```

### <a id="testClientDoCanceledVsTimeout" href="#testClientDoCanceledVsTimeout">func testClientDoCanceledVsTimeout(t *testing.T, h2 bool)</a>

```
searchKey: http_test.testClientDoCanceledVsTimeout
tags: [private]
```

```Go
func testClientDoCanceledVsTimeout(t *testing.T, h2 bool)
```

Issue 33545: lock-in the behavior promised by Client.Do's docs about request cancellation vs timing out. 

### <a id="TestClientPopulatesNilResponseBody" href="#TestClientPopulatesNilResponseBody">func TestClientPopulatesNilResponseBody(t *testing.T)</a>

```
searchKey: http_test.TestClientPopulatesNilResponseBody
tags: [private]
```

```Go
func TestClientPopulatesNilResponseBody(t *testing.T)
```

### <a id="TestClientCallsCloseOnlyOnce" href="#TestClientCallsCloseOnlyOnce">func TestClientCallsCloseOnlyOnce(t *testing.T)</a>

```
searchKey: http_test.TestClientCallsCloseOnlyOnce
tags: [private]
```

```Go
func TestClientCallsCloseOnlyOnce(t *testing.T)
```

Issue 40382: Client calls Close multiple times on Request.Body. 

### <a id="optWithServerLog" href="#optWithServerLog">func optWithServerLog(lg *log.Logger) func(*httptest.Server)</a>

```
searchKey: http_test.optWithServerLog
tags: [private]
```

```Go
func optWithServerLog(lg *log.Logger) func(*httptest.Server)
```

### <a id="TestNewClientServerTest" href="#TestNewClientServerTest">func TestNewClientServerTest(t *testing.T)</a>

```
searchKey: http_test.TestNewClientServerTest
tags: [private]
```

```Go
func TestNewClientServerTest(t *testing.T)
```

Testing the newClientServerTest helper itself. 

### <a id="TestChunkedResponseHeaders_h1" href="#TestChunkedResponseHeaders_h1">func TestChunkedResponseHeaders_h1(t *testing.T)</a>

```
searchKey: http_test.TestChunkedResponseHeaders_h1
tags: [private]
```

```Go
func TestChunkedResponseHeaders_h1(t *testing.T)
```

### <a id="TestChunkedResponseHeaders_h2" href="#TestChunkedResponseHeaders_h2">func TestChunkedResponseHeaders_h2(t *testing.T)</a>

```
searchKey: http_test.TestChunkedResponseHeaders_h2
tags: [private]
```

```Go
func TestChunkedResponseHeaders_h2(t *testing.T)
```

### <a id="testChunkedResponseHeaders" href="#testChunkedResponseHeaders">func testChunkedResponseHeaders(t *testing.T, h2 bool)</a>

```
searchKey: http_test.testChunkedResponseHeaders
tags: [private]
```

```Go
func testChunkedResponseHeaders(t *testing.T, h2 bool)
```

### <a id="mostlyCopy" href="#mostlyCopy">func mostlyCopy(r *Response) *Response</a>

```
searchKey: http_test.mostlyCopy
tags: [private]
```

```Go
func mostlyCopy(r *Response) *Response
```

### <a id="TestH12_HeadContentLengthNoBody" href="#TestH12_HeadContentLengthNoBody">func TestH12_HeadContentLengthNoBody(t *testing.T)</a>

```
searchKey: http_test.TestH12_HeadContentLengthNoBody
tags: [private]
```

```Go
func TestH12_HeadContentLengthNoBody(t *testing.T)
```

Issue 13532 

### <a id="TestH12_HeadContentLengthSmallBody" href="#TestH12_HeadContentLengthSmallBody">func TestH12_HeadContentLengthSmallBody(t *testing.T)</a>

```
searchKey: http_test.TestH12_HeadContentLengthSmallBody
tags: [private]
```

```Go
func TestH12_HeadContentLengthSmallBody(t *testing.T)
```

### <a id="TestH12_HeadContentLengthLargeBody" href="#TestH12_HeadContentLengthLargeBody">func TestH12_HeadContentLengthLargeBody(t *testing.T)</a>

```
searchKey: http_test.TestH12_HeadContentLengthLargeBody
tags: [private]
```

```Go
func TestH12_HeadContentLengthLargeBody(t *testing.T)
```

### <a id="TestH12_200NoBody" href="#TestH12_200NoBody">func TestH12_200NoBody(t *testing.T)</a>

```
searchKey: http_test.TestH12_200NoBody
tags: [private]
```

```Go
func TestH12_200NoBody(t *testing.T)
```

### <a id="TestH2_204NoBody" href="#TestH2_204NoBody">func TestH2_204NoBody(t *testing.T)</a>

```
searchKey: http_test.TestH2_204NoBody
tags: [private]
```

```Go
func TestH2_204NoBody(t *testing.T)
```

### <a id="TestH2_304NoBody" href="#TestH2_304NoBody">func TestH2_304NoBody(t *testing.T)</a>

```
searchKey: http_test.TestH2_304NoBody
tags: [private]
```

```Go
func TestH2_304NoBody(t *testing.T)
```

### <a id="TestH2_404NoBody" href="#TestH2_404NoBody">func TestH2_404NoBody(t *testing.T)</a>

```
searchKey: http_test.TestH2_404NoBody
tags: [private]
```

```Go
func TestH2_404NoBody(t *testing.T)
```

### <a id="testH12_noBody" href="#testH12_noBody">func testH12_noBody(t *testing.T, status int)</a>

```
searchKey: http_test.testH12_noBody
tags: [private]
```

```Go
func testH12_noBody(t *testing.T, status int)
```

### <a id="TestH12_SmallBody" href="#TestH12_SmallBody">func TestH12_SmallBody(t *testing.T)</a>

```
searchKey: http_test.TestH12_SmallBody
tags: [private]
```

```Go
func TestH12_SmallBody(t *testing.T)
```

### <a id="TestH12_ExplicitContentLength" href="#TestH12_ExplicitContentLength">func TestH12_ExplicitContentLength(t *testing.T)</a>

```
searchKey: http_test.TestH12_ExplicitContentLength
tags: [private]
```

```Go
func TestH12_ExplicitContentLength(t *testing.T)
```

### <a id="TestH12_FlushBeforeBody" href="#TestH12_FlushBeforeBody">func TestH12_FlushBeforeBody(t *testing.T)</a>

```
searchKey: http_test.TestH12_FlushBeforeBody
tags: [private]
```

```Go
func TestH12_FlushBeforeBody(t *testing.T)
```

### <a id="TestH12_FlushMidBody" href="#TestH12_FlushMidBody">func TestH12_FlushMidBody(t *testing.T)</a>

```
searchKey: http_test.TestH12_FlushMidBody
tags: [private]
```

```Go
func TestH12_FlushMidBody(t *testing.T)
```

### <a id="TestH12_Head_ExplicitLen" href="#TestH12_Head_ExplicitLen">func TestH12_Head_ExplicitLen(t *testing.T)</a>

```
searchKey: http_test.TestH12_Head_ExplicitLen
tags: [private]
```

```Go
func TestH12_Head_ExplicitLen(t *testing.T)
```

### <a id="TestH12_Head_ImplicitLen" href="#TestH12_Head_ImplicitLen">func TestH12_Head_ImplicitLen(t *testing.T)</a>

```
searchKey: http_test.TestH12_Head_ImplicitLen
tags: [private]
```

```Go
func TestH12_Head_ImplicitLen(t *testing.T)
```

### <a id="TestH12_HandlerWritesTooLittle" href="#TestH12_HandlerWritesTooLittle">func TestH12_HandlerWritesTooLittle(t *testing.T)</a>

```
searchKey: http_test.TestH12_HandlerWritesTooLittle
tags: [private]
```

```Go
func TestH12_HandlerWritesTooLittle(t *testing.T)
```

### <a id="TestH12_HandlerWritesTooMuch" href="#TestH12_HandlerWritesTooMuch">func TestH12_HandlerWritesTooMuch(t *testing.T)</a>

```
searchKey: http_test.TestH12_HandlerWritesTooMuch
tags: [private]
```

```Go
func TestH12_HandlerWritesTooMuch(t *testing.T)
```

Tests that the HTTP/1 and HTTP/2 servers prevent handlers from writing more than they declared. This test does not test whether the transport deals with too much data, though, since the server doesn't make it possible to send bogus data. For those tests, see transport_test.go (for HTTP/1) or x/net/http2/transport_test.go (for HTTP/2). 

### <a id="TestH12_AutoGzip" href="#TestH12_AutoGzip">func TestH12_AutoGzip(t *testing.T)</a>

```
searchKey: http_test.TestH12_AutoGzip
tags: [private]
```

```Go
func TestH12_AutoGzip(t *testing.T)
```

Verify that both our HTTP/1 and HTTP/2 request and auto-decompress gzip. Some hosts send gzip even if you don't ask for it; see golang.org/issue/13298 

### <a id="TestH12_AutoGzip_Disabled" href="#TestH12_AutoGzip_Disabled">func TestH12_AutoGzip_Disabled(t *testing.T)</a>

```
searchKey: http_test.TestH12_AutoGzip_Disabled
tags: [private]
```

```Go
func TestH12_AutoGzip_Disabled(t *testing.T)
```

### <a id="Test304Responses_h1" href="#Test304Responses_h1">func Test304Responses_h1(t *testing.T)</a>

```
searchKey: http_test.Test304Responses_h1
tags: [private]
```

```Go
func Test304Responses_h1(t *testing.T)
```

Test304Responses verifies that 304s don't declare that they're chunking in their response headers and aren't allowed to produce output. 

### <a id="Test304Responses_h2" href="#Test304Responses_h2">func Test304Responses_h2(t *testing.T)</a>

```
searchKey: http_test.Test304Responses_h2
tags: [private]
```

```Go
func Test304Responses_h2(t *testing.T)
```

### <a id="test304Responses" href="#test304Responses">func test304Responses(t *testing.T, h2 bool)</a>

```
searchKey: http_test.test304Responses
tags: [private]
```

```Go
func test304Responses(t *testing.T, h2 bool)
```

### <a id="TestH12_ServerEmptyContentLength" href="#TestH12_ServerEmptyContentLength">func TestH12_ServerEmptyContentLength(t *testing.T)</a>

```
searchKey: http_test.TestH12_ServerEmptyContentLength
tags: [private]
```

```Go
func TestH12_ServerEmptyContentLength(t *testing.T)
```

### <a id="TestH12_RequestContentLength_Known_NonZero" href="#TestH12_RequestContentLength_Known_NonZero">func TestH12_RequestContentLength_Known_NonZero(t *testing.T)</a>

```
searchKey: http_test.TestH12_RequestContentLength_Known_NonZero
tags: [private]
```

```Go
func TestH12_RequestContentLength_Known_NonZero(t *testing.T)
```

### <a id="TestH12_RequestContentLength_Known_Zero" href="#TestH12_RequestContentLength_Known_Zero">func TestH12_RequestContentLength_Known_Zero(t *testing.T)</a>

```
searchKey: http_test.TestH12_RequestContentLength_Known_Zero
tags: [private]
```

```Go
func TestH12_RequestContentLength_Known_Zero(t *testing.T)
```

### <a id="TestH12_RequestContentLength_Unknown" href="#TestH12_RequestContentLength_Unknown">func TestH12_RequestContentLength_Unknown(t *testing.T)</a>

```
searchKey: http_test.TestH12_RequestContentLength_Unknown
tags: [private]
```

```Go
func TestH12_RequestContentLength_Unknown(t *testing.T)
```

### <a id="h12requestContentLength" href="#h12requestContentLength">func h12requestContentLength(t *testing.T, bodyfn func() io.Reader, wantLen int64)</a>

```
searchKey: http_test.h12requestContentLength
tags: [private]
```

```Go
func h12requestContentLength(t *testing.T, bodyfn func() io.Reader, wantLen int64)
```

### <a id="TestCancelRequestMidBody_h1" href="#TestCancelRequestMidBody_h1">func TestCancelRequestMidBody_h1(t *testing.T)</a>

```
searchKey: http_test.TestCancelRequestMidBody_h1
tags: [private]
```

```Go
func TestCancelRequestMidBody_h1(t *testing.T)
```

Tests that closing the Request.Cancel channel also while still reading the response body. Issue 13159. 

### <a id="TestCancelRequestMidBody_h2" href="#TestCancelRequestMidBody_h2">func TestCancelRequestMidBody_h2(t *testing.T)</a>

```
searchKey: http_test.TestCancelRequestMidBody_h2
tags: [private]
```

```Go
func TestCancelRequestMidBody_h2(t *testing.T)
```

### <a id="testCancelRequestMidBody" href="#testCancelRequestMidBody">func testCancelRequestMidBody(t *testing.T, h2 bool)</a>

```
searchKey: http_test.testCancelRequestMidBody
tags: [private]
```

```Go
func testCancelRequestMidBody(t *testing.T, h2 bool)
```

### <a id="TestTrailersClientToServer_h1" href="#TestTrailersClientToServer_h1">func TestTrailersClientToServer_h1(t *testing.T)</a>

```
searchKey: http_test.TestTrailersClientToServer_h1
tags: [private]
```

```Go
func TestTrailersClientToServer_h1(t *testing.T)
```

Tests that clients can send trailers to a server and that the server can read them. 

### <a id="TestTrailersClientToServer_h2" href="#TestTrailersClientToServer_h2">func TestTrailersClientToServer_h2(t *testing.T)</a>

```
searchKey: http_test.TestTrailersClientToServer_h2
tags: [private]
```

```Go
func TestTrailersClientToServer_h2(t *testing.T)
```

### <a id="testTrailersClientToServer" href="#testTrailersClientToServer">func testTrailersClientToServer(t *testing.T, h2 bool)</a>

```
searchKey: http_test.testTrailersClientToServer
tags: [private]
```

```Go
func testTrailersClientToServer(t *testing.T, h2 bool)
```

### <a id="TestTrailersServerToClient_h1" href="#TestTrailersServerToClient_h1">func TestTrailersServerToClient_h1(t *testing.T)</a>

```
searchKey: http_test.TestTrailersServerToClient_h1
tags: [private]
```

```Go
func TestTrailersServerToClient_h1(t *testing.T)
```

Tests that servers send trailers to a client and that the client can read them. 

### <a id="TestTrailersServerToClient_h2" href="#TestTrailersServerToClient_h2">func TestTrailersServerToClient_h2(t *testing.T)</a>

```
searchKey: http_test.TestTrailersServerToClient_h2
tags: [private]
```

```Go
func TestTrailersServerToClient_h2(t *testing.T)
```

### <a id="TestTrailersServerToClient_Flush_h1" href="#TestTrailersServerToClient_Flush_h1">func TestTrailersServerToClient_Flush_h1(t *testing.T)</a>

```
searchKey: http_test.TestTrailersServerToClient_Flush_h1
tags: [private]
```

```Go
func TestTrailersServerToClient_Flush_h1(t *testing.T)
```

### <a id="TestTrailersServerToClient_Flush_h2" href="#TestTrailersServerToClient_Flush_h2">func TestTrailersServerToClient_Flush_h2(t *testing.T)</a>

```
searchKey: http_test.TestTrailersServerToClient_Flush_h2
tags: [private]
```

```Go
func TestTrailersServerToClient_Flush_h2(t *testing.T)
```

### <a id="testTrailersServerToClient" href="#testTrailersServerToClient">func testTrailersServerToClient(t *testing.T, h2, flush bool)</a>

```
searchKey: http_test.testTrailersServerToClient
tags: [private]
```

```Go
func testTrailersServerToClient(t *testing.T, h2, flush bool)
```

### <a id="TestResponseBodyReadAfterClose_h1" href="#TestResponseBodyReadAfterClose_h1">func TestResponseBodyReadAfterClose_h1(t *testing.T)</a>

```
searchKey: http_test.TestResponseBodyReadAfterClose_h1
tags: [private]
```

```Go
func TestResponseBodyReadAfterClose_h1(t *testing.T)
```

Don't allow a Body.Read after Body.Close. Issue 13648. 

### <a id="TestResponseBodyReadAfterClose_h2" href="#TestResponseBodyReadAfterClose_h2">func TestResponseBodyReadAfterClose_h2(t *testing.T)</a>

```
searchKey: http_test.TestResponseBodyReadAfterClose_h2
tags: [private]
```

```Go
func TestResponseBodyReadAfterClose_h2(t *testing.T)
```

### <a id="testResponseBodyReadAfterClose" href="#testResponseBodyReadAfterClose">func testResponseBodyReadAfterClose(t *testing.T, h2 bool)</a>

```
searchKey: http_test.testResponseBodyReadAfterClose
tags: [private]
```

```Go
func testResponseBodyReadAfterClose(t *testing.T, h2 bool)
```

### <a id="TestConcurrentReadWriteReqBody_h1" href="#TestConcurrentReadWriteReqBody_h1">func TestConcurrentReadWriteReqBody_h1(t *testing.T)</a>

```
searchKey: http_test.TestConcurrentReadWriteReqBody_h1
tags: [private]
```

```Go
func TestConcurrentReadWriteReqBody_h1(t *testing.T)
```

### <a id="TestConcurrentReadWriteReqBody_h2" href="#TestConcurrentReadWriteReqBody_h2">func TestConcurrentReadWriteReqBody_h2(t *testing.T)</a>

```
searchKey: http_test.TestConcurrentReadWriteReqBody_h2
tags: [private]
```

```Go
func TestConcurrentReadWriteReqBody_h2(t *testing.T)
```

### <a id="testConcurrentReadWriteReqBody" href="#testConcurrentReadWriteReqBody">func testConcurrentReadWriteReqBody(t *testing.T, h2 bool)</a>

```
searchKey: http_test.testConcurrentReadWriteReqBody
tags: [private]
```

```Go
func testConcurrentReadWriteReqBody(t *testing.T, h2 bool)
```

### <a id="TestConnectRequest_h1" href="#TestConnectRequest_h1">func TestConnectRequest_h1(t *testing.T)</a>

```
searchKey: http_test.TestConnectRequest_h1
tags: [private]
```

```Go
func TestConnectRequest_h1(t *testing.T)
```

### <a id="TestConnectRequest_h2" href="#TestConnectRequest_h2">func TestConnectRequest_h2(t *testing.T)</a>

```
searchKey: http_test.TestConnectRequest_h2
tags: [private]
```

```Go
func TestConnectRequest_h2(t *testing.T)
```

### <a id="testConnectRequest" href="#testConnectRequest">func testConnectRequest(t *testing.T, h2 bool)</a>

```
searchKey: http_test.testConnectRequest
tags: [private]
```

```Go
func testConnectRequest(t *testing.T, h2 bool)
```

### <a id="TestTransportUserAgent_h1" href="#TestTransportUserAgent_h1">func TestTransportUserAgent_h1(t *testing.T)</a>

```
searchKey: http_test.TestTransportUserAgent_h1
tags: [private]
```

```Go
func TestTransportUserAgent_h1(t *testing.T)
```

### <a id="TestTransportUserAgent_h2" href="#TestTransportUserAgent_h2">func TestTransportUserAgent_h2(t *testing.T)</a>

```
searchKey: http_test.TestTransportUserAgent_h2
tags: [private]
```

```Go
func TestTransportUserAgent_h2(t *testing.T)
```

### <a id="testTransportUserAgent" href="#testTransportUserAgent">func testTransportUserAgent(t *testing.T, h2 bool)</a>

```
searchKey: http_test.testTransportUserAgent
tags: [private]
```

```Go
func testTransportUserAgent(t *testing.T, h2 bool)
```

### <a id="TestStarRequestFoo_h1" href="#TestStarRequestFoo_h1">func TestStarRequestFoo_h1(t *testing.T)</a>

```
searchKey: http_test.TestStarRequestFoo_h1
tags: [private]
```

```Go
func TestStarRequestFoo_h1(t *testing.T)
```

### <a id="TestStarRequestFoo_h2" href="#TestStarRequestFoo_h2">func TestStarRequestFoo_h2(t *testing.T)</a>

```
searchKey: http_test.TestStarRequestFoo_h2
tags: [private]
```

```Go
func TestStarRequestFoo_h2(t *testing.T)
```

### <a id="TestStarRequestOptions_h1" href="#TestStarRequestOptions_h1">func TestStarRequestOptions_h1(t *testing.T)</a>

```
searchKey: http_test.TestStarRequestOptions_h1
tags: [private]
```

```Go
func TestStarRequestOptions_h1(t *testing.T)
```

### <a id="TestStarRequestOptions_h2" href="#TestStarRequestOptions_h2">func TestStarRequestOptions_h2(t *testing.T)</a>

```
searchKey: http_test.TestStarRequestOptions_h2
tags: [private]
```

```Go
func TestStarRequestOptions_h2(t *testing.T)
```

### <a id="testStarRequest" href="#testStarRequest">func testStarRequest(t *testing.T, method string, h2 bool)</a>

```
searchKey: http_test.testStarRequest
tags: [private]
```

```Go
func testStarRequest(t *testing.T, method string, h2 bool)
```

### <a id="TestTransportDiscardsUnneededConns" href="#TestTransportDiscardsUnneededConns">func TestTransportDiscardsUnneededConns(t *testing.T)</a>

```
searchKey: http_test.TestTransportDiscardsUnneededConns
tags: [private]
```

```Go
func TestTransportDiscardsUnneededConns(t *testing.T)
```

Issue 13957 

### <a id="TestTransportGCRequest_Body_h1" href="#TestTransportGCRequest_Body_h1">func TestTransportGCRequest_Body_h1(t *testing.T)</a>

```
searchKey: http_test.TestTransportGCRequest_Body_h1
tags: [private]
```

```Go
func TestTransportGCRequest_Body_h1(t *testing.T)
```

tests that Transport doesn't retain a pointer to the provided request. 

### <a id="TestTransportGCRequest_Body_h2" href="#TestTransportGCRequest_Body_h2">func TestTransportGCRequest_Body_h2(t *testing.T)</a>

```
searchKey: http_test.TestTransportGCRequest_Body_h2
tags: [private]
```

```Go
func TestTransportGCRequest_Body_h2(t *testing.T)
```

### <a id="TestTransportGCRequest_NoBody_h1" href="#TestTransportGCRequest_NoBody_h1">func TestTransportGCRequest_NoBody_h1(t *testing.T)</a>

```
searchKey: http_test.TestTransportGCRequest_NoBody_h1
tags: [private]
```

```Go
func TestTransportGCRequest_NoBody_h1(t *testing.T)
```

### <a id="TestTransportGCRequest_NoBody_h2" href="#TestTransportGCRequest_NoBody_h2">func TestTransportGCRequest_NoBody_h2(t *testing.T)</a>

```
searchKey: http_test.TestTransportGCRequest_NoBody_h2
tags: [private]
```

```Go
func TestTransportGCRequest_NoBody_h2(t *testing.T)
```

### <a id="testTransportGCRequest" href="#testTransportGCRequest">func testTransportGCRequest(t *testing.T, h2, body bool)</a>

```
searchKey: http_test.testTransportGCRequest
tags: [private]
```

```Go
func testTransportGCRequest(t *testing.T, h2, body bool)
```

### <a id="TestTransportRejectsInvalidHeaders_h1" href="#TestTransportRejectsInvalidHeaders_h1">func TestTransportRejectsInvalidHeaders_h1(t *testing.T)</a>

```
searchKey: http_test.TestTransportRejectsInvalidHeaders_h1
tags: [private]
```

```Go
func TestTransportRejectsInvalidHeaders_h1(t *testing.T)
```

### <a id="TestTransportRejectsInvalidHeaders_h2" href="#TestTransportRejectsInvalidHeaders_h2">func TestTransportRejectsInvalidHeaders_h2(t *testing.T)</a>

```
searchKey: http_test.TestTransportRejectsInvalidHeaders_h2
tags: [private]
```

```Go
func TestTransportRejectsInvalidHeaders_h2(t *testing.T)
```

### <a id="testTransportRejectsInvalidHeaders" href="#testTransportRejectsInvalidHeaders">func testTransportRejectsInvalidHeaders(t *testing.T, h2 bool)</a>

```
searchKey: http_test.testTransportRejectsInvalidHeaders
tags: [private]
```

```Go
func testTransportRejectsInvalidHeaders(t *testing.T, h2 bool)
```

### <a id="TestInterruptWithPanic_h1" href="#TestInterruptWithPanic_h1">func TestInterruptWithPanic_h1(t *testing.T)</a>

```
searchKey: http_test.TestInterruptWithPanic_h1
tags: [private]
```

```Go
func TestInterruptWithPanic_h1(t *testing.T)
```

### <a id="TestInterruptWithPanic_h2" href="#TestInterruptWithPanic_h2">func TestInterruptWithPanic_h2(t *testing.T)</a>

```
searchKey: http_test.TestInterruptWithPanic_h2
tags: [private]
```

```Go
func TestInterruptWithPanic_h2(t *testing.T)
```

### <a id="TestInterruptWithPanic_nil_h1" href="#TestInterruptWithPanic_nil_h1">func TestInterruptWithPanic_nil_h1(t *testing.T)</a>

```
searchKey: http_test.TestInterruptWithPanic_nil_h1
tags: [private]
```

```Go
func TestInterruptWithPanic_nil_h1(t *testing.T)
```

### <a id="TestInterruptWithPanic_nil_h2" href="#TestInterruptWithPanic_nil_h2">func TestInterruptWithPanic_nil_h2(t *testing.T)</a>

```
searchKey: http_test.TestInterruptWithPanic_nil_h2
tags: [private]
```

```Go
func TestInterruptWithPanic_nil_h2(t *testing.T)
```

### <a id="TestInterruptWithPanic_ErrAbortHandler_h1" href="#TestInterruptWithPanic_ErrAbortHandler_h1">func TestInterruptWithPanic_ErrAbortHandler_h1(t *testing.T)</a>

```
searchKey: http_test.TestInterruptWithPanic_ErrAbortHandler_h1
tags: [private]
```

```Go
func TestInterruptWithPanic_ErrAbortHandler_h1(t *testing.T)
```

### <a id="TestInterruptWithPanic_ErrAbortHandler_h2" href="#TestInterruptWithPanic_ErrAbortHandler_h2">func TestInterruptWithPanic_ErrAbortHandler_h2(t *testing.T)</a>

```
searchKey: http_test.TestInterruptWithPanic_ErrAbortHandler_h2
tags: [private]
```

```Go
func TestInterruptWithPanic_ErrAbortHandler_h2(t *testing.T)
```

### <a id="testInterruptWithPanic" href="#testInterruptWithPanic">func testInterruptWithPanic(t *testing.T, h2 bool, panicValue interface{})</a>

```
searchKey: http_test.testInterruptWithPanic
tags: [private]
```

```Go
func testInterruptWithPanic(t *testing.T, h2 bool, panicValue interface{})
```

### <a id="TestH12_AutoGzipWithDumpResponse" href="#TestH12_AutoGzipWithDumpResponse">func TestH12_AutoGzipWithDumpResponse(t *testing.T)</a>

```
searchKey: http_test.TestH12_AutoGzipWithDumpResponse
tags: [private]
```

```Go
func TestH12_AutoGzipWithDumpResponse(t *testing.T)
```

Issue 15366 

### <a id="TestCloseIdleConnections_h1" href="#TestCloseIdleConnections_h1">func TestCloseIdleConnections_h1(t *testing.T)</a>

```
searchKey: http_test.TestCloseIdleConnections_h1
tags: [private]
```

```Go
func TestCloseIdleConnections_h1(t *testing.T)
```

Issue 14607 

### <a id="TestCloseIdleConnections_h2" href="#TestCloseIdleConnections_h2">func TestCloseIdleConnections_h2(t *testing.T)</a>

```
searchKey: http_test.TestCloseIdleConnections_h2
tags: [private]
```

```Go
func TestCloseIdleConnections_h2(t *testing.T)
```

### <a id="testCloseIdleConnections" href="#testCloseIdleConnections">func testCloseIdleConnections(t *testing.T, h2 bool)</a>

```
searchKey: http_test.testCloseIdleConnections
tags: [private]
```

```Go
func testCloseIdleConnections(t *testing.T, h2 bool)
```

### <a id="TestNoSniffExpectRequestBody_h1" href="#TestNoSniffExpectRequestBody_h1">func TestNoSniffExpectRequestBody_h1(t *testing.T)</a>

```
searchKey: http_test.TestNoSniffExpectRequestBody_h1
tags: [private]
```

```Go
func TestNoSniffExpectRequestBody_h1(t *testing.T)
```

### <a id="TestNoSniffExpectRequestBody_h2" href="#TestNoSniffExpectRequestBody_h2">func TestNoSniffExpectRequestBody_h2(t *testing.T)</a>

```
searchKey: http_test.TestNoSniffExpectRequestBody_h2
tags: [private]
```

```Go
func TestNoSniffExpectRequestBody_h2(t *testing.T)
```

### <a id="testNoSniffExpectRequestBody" href="#testNoSniffExpectRequestBody">func testNoSniffExpectRequestBody(t *testing.T, h2 bool)</a>

```
searchKey: http_test.testNoSniffExpectRequestBody
tags: [private]
```

```Go
func testNoSniffExpectRequestBody(t *testing.T, h2 bool)
```

### <a id="TestServerUndeclaredTrailers_h1" href="#TestServerUndeclaredTrailers_h1">func TestServerUndeclaredTrailers_h1(t *testing.T)</a>

```
searchKey: http_test.TestServerUndeclaredTrailers_h1
tags: [private]
```

```Go
func TestServerUndeclaredTrailers_h1(t *testing.T)
```

### <a id="TestServerUndeclaredTrailers_h2" href="#TestServerUndeclaredTrailers_h2">func TestServerUndeclaredTrailers_h2(t *testing.T)</a>

```
searchKey: http_test.TestServerUndeclaredTrailers_h2
tags: [private]
```

```Go
func TestServerUndeclaredTrailers_h2(t *testing.T)
```

### <a id="testServerUndeclaredTrailers" href="#testServerUndeclaredTrailers">func testServerUndeclaredTrailers(t *testing.T, h2 bool)</a>

```
searchKey: http_test.testServerUndeclaredTrailers
tags: [private]
```

```Go
func testServerUndeclaredTrailers(t *testing.T, h2 bool)
```

### <a id="TestBadResponseAfterReadingBody" href="#TestBadResponseAfterReadingBody">func TestBadResponseAfterReadingBody(t *testing.T)</a>

```
searchKey: http_test.TestBadResponseAfterReadingBody
tags: [private]
```

```Go
func TestBadResponseAfterReadingBody(t *testing.T)
```

### <a id="TestWriteHeader0_h1" href="#TestWriteHeader0_h1">func TestWriteHeader0_h1(t *testing.T)</a>

```
searchKey: http_test.TestWriteHeader0_h1
tags: [private]
```

```Go
func TestWriteHeader0_h1(t *testing.T)
```

### <a id="TestWriteHeader0_h2" href="#TestWriteHeader0_h2">func TestWriteHeader0_h2(t *testing.T)</a>

```
searchKey: http_test.TestWriteHeader0_h2
tags: [private]
```

```Go
func TestWriteHeader0_h2(t *testing.T)
```

### <a id="testWriteHeader0" href="#testWriteHeader0">func testWriteHeader0(t *testing.T, h2 bool)</a>

```
searchKey: http_test.testWriteHeader0
tags: [private]
```

```Go
func testWriteHeader0(t *testing.T, h2 bool)
```

### <a id="TestWriteHeaderNoCodeCheck_h1" href="#TestWriteHeaderNoCodeCheck_h1">func TestWriteHeaderNoCodeCheck_h1(t *testing.T)</a>

```
searchKey: http_test.TestWriteHeaderNoCodeCheck_h1
tags: [private]
```

```Go
func TestWriteHeaderNoCodeCheck_h1(t *testing.T)
```

Issue 23010: don't be super strict checking WriteHeader's code if it's not even valid to call WriteHeader then anyway. 

### <a id="TestWriteHeaderNoCodeCheck_h1hijack" href="#TestWriteHeaderNoCodeCheck_h1hijack">func TestWriteHeaderNoCodeCheck_h1hijack(t *testing.T)</a>

```
searchKey: http_test.TestWriteHeaderNoCodeCheck_h1hijack
tags: [private]
```

```Go
func TestWriteHeaderNoCodeCheck_h1hijack(t *testing.T)
```

### <a id="TestWriteHeaderNoCodeCheck_h2" href="#TestWriteHeaderNoCodeCheck_h2">func TestWriteHeaderNoCodeCheck_h2(t *testing.T)</a>

```
searchKey: http_test.TestWriteHeaderNoCodeCheck_h2
tags: [private]
```

```Go
func TestWriteHeaderNoCodeCheck_h2(t *testing.T)
```

### <a id="testWriteHeaderAfterWrite" href="#testWriteHeaderAfterWrite">func testWriteHeaderAfterWrite(t *testing.T, h2, hijack bool)</a>

```
searchKey: http_test.testWriteHeaderAfterWrite
tags: [private]
```

```Go
func testWriteHeaderAfterWrite(t *testing.T, h2, hijack bool)
```

### <a id="TestBidiStreamReverseProxy" href="#TestBidiStreamReverseProxy">func TestBidiStreamReverseProxy(t *testing.T)</a>

```
searchKey: http_test.TestBidiStreamReverseProxy
tags: [private]
```

```Go
func TestBidiStreamReverseProxy(t *testing.T)
```

### <a id="TestH12_WebSocketUpgrade" href="#TestH12_WebSocketUpgrade">func TestH12_WebSocketUpgrade(t *testing.T)</a>

```
searchKey: http_test.TestH12_WebSocketUpgrade
tags: [private]
```

```Go
func TestH12_WebSocketUpgrade(t *testing.T)
```

Always use HTTP/1.1 for WebSocket upgrades. 

### <a id="containsDotFile" href="#containsDotFile">func containsDotFile(name string) bool</a>

```
searchKey: http_test.containsDotFile
tags: [private]
```

```Go
func containsDotFile(name string) bool
```

containsDotFile reports whether name contains a path element starting with a period. The name is assumed to be a delimited by forward slashes, as guaranteed by the http.FileSystem interface. 

### <a id="ExampleFileServer_dotFileHiding" href="#ExampleFileServer_dotFileHiding">func ExampleFileServer_dotFileHiding()</a>

```
searchKey: http_test.ExampleFileServer_dotFileHiding
tags: [private]
```

```Go
func ExampleFileServer_dotFileHiding()
```

### <a id="ExampleHandle" href="#ExampleHandle">func ExampleHandle()</a>

```
searchKey: http_test.ExampleHandle
tags: [private]
```

```Go
func ExampleHandle()
```

### <a id="ExampleHijacker" href="#ExampleHijacker">func ExampleHijacker()</a>

```
searchKey: http_test.ExampleHijacker
tags: [private]
```

```Go
func ExampleHijacker()
```

### <a id="ExampleGet" href="#ExampleGet">func ExampleGet()</a>

```
searchKey: http_test.ExampleGet
tags: [private]
```

```Go
func ExampleGet()
```

### <a id="ExampleFileServer" href="#ExampleFileServer">func ExampleFileServer()</a>

```
searchKey: http_test.ExampleFileServer
tags: [private]
```

```Go
func ExampleFileServer()
```

### <a id="ExampleFileServer_stripPrefix" href="#ExampleFileServer_stripPrefix">func ExampleFileServer_stripPrefix()</a>

```
searchKey: http_test.ExampleFileServer_stripPrefix
tags: [private]
```

```Go
func ExampleFileServer_stripPrefix()
```

### <a id="ExampleStripPrefix" href="#ExampleStripPrefix">func ExampleStripPrefix()</a>

```
searchKey: http_test.ExampleStripPrefix
tags: [private]
```

```Go
func ExampleStripPrefix()
```

### <a id="ExampleServeMux_Handle" href="#ExampleServeMux_Handle">func ExampleServeMux_Handle()</a>

```
searchKey: http_test.ExampleServeMux_Handle
tags: [private]
```

```Go
func ExampleServeMux_Handle()
```

### <a id="ExampleResponseWriter_trailers" href="#ExampleResponseWriter_trailers">func ExampleResponseWriter_trailers()</a>

```
searchKey: http_test.ExampleResponseWriter_trailers
tags: [private]
```

```Go
func ExampleResponseWriter_trailers()
```

HTTP Trailers are a set of key/value pairs like headers that come after the HTTP response, instead of before. 

### <a id="ExampleServer_Shutdown" href="#ExampleServer_Shutdown">func ExampleServer_Shutdown()</a>

```
searchKey: http_test.ExampleServer_Shutdown
tags: [private]
```

```Go
func ExampleServer_Shutdown()
```

### <a id="ExampleListenAndServeTLS" href="#ExampleListenAndServeTLS">func ExampleListenAndServeTLS()</a>

```
searchKey: http_test.ExampleListenAndServeTLS
tags: [private]
```

```Go
func ExampleListenAndServeTLS()
```

### <a id="ExampleListenAndServe" href="#ExampleListenAndServe">func ExampleListenAndServe()</a>

```
searchKey: http_test.ExampleListenAndServe
tags: [private]
```

```Go
func ExampleListenAndServe()
```

### <a id="ExampleHandleFunc" href="#ExampleHandleFunc">func ExampleHandleFunc()</a>

```
searchKey: http_test.ExampleHandleFunc
tags: [private]
```

```Go
func ExampleHandleFunc()
```

### <a id="newPeopleHandler" href="#newPeopleHandler">func newPeopleHandler() http.Handler</a>

```
searchKey: http_test.newPeopleHandler
tags: [private]
```

```Go
func newPeopleHandler() http.Handler
```

### <a id="ExampleNotFoundHandler" href="#ExampleNotFoundHandler">func ExampleNotFoundHandler()</a>

```
searchKey: http_test.ExampleNotFoundHandler
tags: [private]
```

```Go
func ExampleNotFoundHandler()
```

### <a id="TestServeFile" href="#TestServeFile">func TestServeFile(t *testing.T)</a>

```
searchKey: http_test.TestServeFile
tags: [private]
```

```Go
func TestServeFile(t *testing.T)
```

### <a id="TestServeFile_DotDot" href="#TestServeFile_DotDot">func TestServeFile_DotDot(t *testing.T)</a>

```
searchKey: http_test.TestServeFile_DotDot
tags: [private]
```

```Go
func TestServeFile_DotDot(t *testing.T)
```

### <a id="TestServeFileDirPanicEmptyPath" href="#TestServeFileDirPanicEmptyPath">func TestServeFileDirPanicEmptyPath(t *testing.T)</a>

```
searchKey: http_test.TestServeFileDirPanicEmptyPath
tags: [private]
```

```Go
func TestServeFileDirPanicEmptyPath(t *testing.T)
```

Tests that this doesn't panic. (Issue 30165) 

### <a id="TestFSRedirect" href="#TestFSRedirect">func TestFSRedirect(t *testing.T)</a>

```
searchKey: http_test.TestFSRedirect
tags: [private]
```

```Go
func TestFSRedirect(t *testing.T)
```

### <a id="TestFileServerCleans" href="#TestFileServerCleans">func TestFileServerCleans(t *testing.T)</a>

```
searchKey: http_test.TestFileServerCleans
tags: [private]
```

```Go
func TestFileServerCleans(t *testing.T)
```

### <a id="TestFileServerEscapesNames" href="#TestFileServerEscapesNames">func TestFileServerEscapesNames(t *testing.T)</a>

```
searchKey: http_test.TestFileServerEscapesNames
tags: [private]
```

```Go
func TestFileServerEscapesNames(t *testing.T)
```

### <a id="TestFileServerSortsNames" href="#TestFileServerSortsNames">func TestFileServerSortsNames(t *testing.T)</a>

```
searchKey: http_test.TestFileServerSortsNames
tags: [private]
```

```Go
func TestFileServerSortsNames(t *testing.T)
```

### <a id="mustRemoveAll" href="#mustRemoveAll">func mustRemoveAll(dir string)</a>

```
searchKey: http_test.mustRemoveAll
tags: [private]
```

```Go
func mustRemoveAll(dir string)
```

### <a id="TestFileServerImplicitLeadingSlash" href="#TestFileServerImplicitLeadingSlash">func TestFileServerImplicitLeadingSlash(t *testing.T)</a>

```
searchKey: http_test.TestFileServerImplicitLeadingSlash
tags: [private]
```

```Go
func TestFileServerImplicitLeadingSlash(t *testing.T)
```

### <a id="TestDirJoin" href="#TestDirJoin">func TestDirJoin(t *testing.T)</a>

```
searchKey: http_test.TestDirJoin
tags: [private]
```

```Go
func TestDirJoin(t *testing.T)
```

### <a id="TestEmptyDirOpenCWD" href="#TestEmptyDirOpenCWD">func TestEmptyDirOpenCWD(t *testing.T)</a>

```
searchKey: http_test.TestEmptyDirOpenCWD
tags: [private]
```

```Go
func TestEmptyDirOpenCWD(t *testing.T)
```

### <a id="TestServeFileContentType" href="#TestServeFileContentType">func TestServeFileContentType(t *testing.T)</a>

```
searchKey: http_test.TestServeFileContentType
tags: [private]
```

```Go
func TestServeFileContentType(t *testing.T)
```

### <a id="TestServeFileMimeType" href="#TestServeFileMimeType">func TestServeFileMimeType(t *testing.T)</a>

```
searchKey: http_test.TestServeFileMimeType
tags: [private]
```

```Go
func TestServeFileMimeType(t *testing.T)
```

### <a id="TestServeFileFromCWD" href="#TestServeFileFromCWD">func TestServeFileFromCWD(t *testing.T)</a>

```
searchKey: http_test.TestServeFileFromCWD
tags: [private]
```

```Go
func TestServeFileFromCWD(t *testing.T)
```

### <a id="TestServeDirWithoutTrailingSlash" href="#TestServeDirWithoutTrailingSlash">func TestServeDirWithoutTrailingSlash(t *testing.T)</a>

```
searchKey: http_test.TestServeDirWithoutTrailingSlash
tags: [private]
```

```Go
func TestServeDirWithoutTrailingSlash(t *testing.T)
```

Issue 13996 

### <a id="TestServeFileWithContentEncoding_h1" href="#TestServeFileWithContentEncoding_h1">func TestServeFileWithContentEncoding_h1(t *testing.T)</a>

```
searchKey: http_test.TestServeFileWithContentEncoding_h1
tags: [private]
```

```Go
func TestServeFileWithContentEncoding_h1(t *testing.T)
```

Tests that ServeFile doesn't add a Content-Length if a Content-Encoding is specified. 

### <a id="TestServeFileWithContentEncoding_h2" href="#TestServeFileWithContentEncoding_h2">func TestServeFileWithContentEncoding_h2(t *testing.T)</a>

```
searchKey: http_test.TestServeFileWithContentEncoding_h2
tags: [private]
```

```Go
func TestServeFileWithContentEncoding_h2(t *testing.T)
```

### <a id="testServeFileWithContentEncoding" href="#testServeFileWithContentEncoding">func testServeFileWithContentEncoding(t *testing.T, h2 bool)</a>

```
searchKey: http_test.testServeFileWithContentEncoding
tags: [private]
```

```Go
func testServeFileWithContentEncoding(t *testing.T, h2 bool)
```

### <a id="TestServeIndexHtml" href="#TestServeIndexHtml">func TestServeIndexHtml(t *testing.T)</a>

```
searchKey: http_test.TestServeIndexHtml
tags: [private]
```

```Go
func TestServeIndexHtml(t *testing.T)
```

### <a id="TestServeIndexHtmlFS" href="#TestServeIndexHtmlFS">func TestServeIndexHtmlFS(t *testing.T)</a>

```
searchKey: http_test.TestServeIndexHtmlFS
tags: [private]
```

```Go
func TestServeIndexHtmlFS(t *testing.T)
```

### <a id="TestFileServerZeroByte" href="#TestFileServerZeroByte">func TestFileServerZeroByte(t *testing.T)</a>

```
searchKey: http_test.TestFileServerZeroByte
tags: [private]
```

```Go
func TestFileServerZeroByte(t *testing.T)
```

### <a id="TestDirectoryIfNotModified" href="#TestDirectoryIfNotModified">func TestDirectoryIfNotModified(t *testing.T)</a>

```
searchKey: http_test.TestDirectoryIfNotModified
tags: [private]
```

```Go
func TestDirectoryIfNotModified(t *testing.T)
```

### <a id="mustStat" href="#mustStat">func mustStat(t *testing.T, fileName string) fs.FileInfo</a>

```
searchKey: http_test.mustStat
tags: [private]
```

```Go
func mustStat(t *testing.T, fileName string) fs.FileInfo
```

### <a id="TestServeContent" href="#TestServeContent">func TestServeContent(t *testing.T)</a>

```
searchKey: http_test.TestServeContent
tags: [private]
```

```Go
func TestServeContent(t *testing.T)
```

### <a id="TestServerFileStatError" href="#TestServerFileStatError">func TestServerFileStatError(t *testing.T)</a>

```
searchKey: http_test.TestServerFileStatError
tags: [private]
```

```Go
func TestServerFileStatError(t *testing.T)
```

Issue 12991 

### <a id="TestServeContentErrorMessages" href="#TestServeContentErrorMessages">func TestServeContentErrorMessages(t *testing.T)</a>

```
searchKey: http_test.TestServeContentErrorMessages
tags: [private]
```

```Go
func TestServeContentErrorMessages(t *testing.T)
```

### <a id="TestLinuxSendfile" href="#TestLinuxSendfile">func TestLinuxSendfile(t *testing.T)</a>

```
searchKey: http_test.TestLinuxSendfile
tags: [private]
```

```Go
func TestLinuxSendfile(t *testing.T)
```

verifies that sendfile is being used on Linux 

### <a id="getBody" href="#getBody">func getBody(t *testing.T, testName string, req Request, client *Client) (*Response, []byte)</a>

```
searchKey: http_test.getBody
tags: [private]
```

```Go
func getBody(t *testing.T, testName string, req Request, client *Client) (*Response, []byte)
```

### <a id="TestLinuxSendfileChild" href="#TestLinuxSendfileChild">func TestLinuxSendfileChild(*testing.T)</a>

```
searchKey: http_test.TestLinuxSendfileChild
tags: [private]
```

```Go
func TestLinuxSendfileChild(*testing.T)
```

TestLinuxSendfileChild isn't a real test. It's used as a helper process for TestLinuxSendfile. 

### <a id="TestFileServerNotDirError" href="#TestFileServerNotDirError">func TestFileServerNotDirError(t *testing.T)</a>

```
searchKey: http_test.TestFileServerNotDirError
tags: [private]
```

```Go
func TestFileServerNotDirError(t *testing.T)
```

Issue 18984: tests that requests for paths beyond files return not-found errors 

### <a id="TestFileServerCleanPath" href="#TestFileServerCleanPath">func TestFileServerCleanPath(t *testing.T)</a>

```
searchKey: http_test.TestFileServerCleanPath
tags: [private]
```

```Go
func TestFileServerCleanPath(t *testing.T)
```

### <a id="Test_scanETag" href="#Test_scanETag">func Test_scanETag(t *testing.T)</a>

```
searchKey: http_test.Test_scanETag
tags: [private]
```

```Go
func Test_scanETag(t *testing.T)
```

### <a id="TestServeFileRejectsInvalidSuffixLengths_h1" href="#TestServeFileRejectsInvalidSuffixLengths_h1">func TestServeFileRejectsInvalidSuffixLengths_h1(t *testing.T)</a>

```
searchKey: http_test.TestServeFileRejectsInvalidSuffixLengths_h1
tags: [private]
```

```Go
func TestServeFileRejectsInvalidSuffixLengths_h1(t *testing.T)
```

Issue 40940: Ensure that we only accept non-negative suffix-lengths in "Range": "bytes=-N", and should reject "bytes=--2". 

### <a id="TestServeFileRejectsInvalidSuffixLengths_h2" href="#TestServeFileRejectsInvalidSuffixLengths_h2">func TestServeFileRejectsInvalidSuffixLengths_h2(t *testing.T)</a>

```
searchKey: http_test.TestServeFileRejectsInvalidSuffixLengths_h2
tags: [private]
```

```Go
func TestServeFileRejectsInvalidSuffixLengths_h2(t *testing.T)
```

### <a id="testServeFileRejectsInvalidSuffixLengths" href="#testServeFileRejectsInvalidSuffixLengths">func testServeFileRejectsInvalidSuffixLengths(t *testing.T, h2 bool)</a>

```
searchKey: http_test.testServeFileRejectsInvalidSuffixLengths
tags: [private]
```

```Go
func testServeFileRejectsInvalidSuffixLengths(t *testing.T, h2 bool)
```

### <a id="TestMain" href="#TestMain">func TestMain(m *testing.M)</a>

```
searchKey: http_test.TestMain
tags: [private]
```

```Go
func TestMain(m *testing.M)
```

### <a id="interestingGoroutines" href="#interestingGoroutines">func interestingGoroutines() (gs []string)</a>

```
searchKey: http_test.interestingGoroutines
tags: [private]
```

```Go
func interestingGoroutines() (gs []string)
```

### <a id="goroutineLeaked" href="#goroutineLeaked">func goroutineLeaked() bool</a>

```
searchKey: http_test.goroutineLeaked
tags: [private]
```

```Go
func goroutineLeaked() bool
```

Verify the other tests didn't leave any goroutines running. 

### <a id="setParallel" href="#setParallel">func setParallel(t *testing.T)</a>

```
searchKey: http_test.setParallel
tags: [private]
```

```Go
func setParallel(t *testing.T)
```

setParallel marks t as a parallel test if we're in short mode (all.bash), but as a serial test otherwise. Using t.Parallel isn't compatible with the afterTest func in non-short mode. 

### <a id="runningBenchmarks" href="#runningBenchmarks">func runningBenchmarks() bool</a>

```
searchKey: http_test.runningBenchmarks
tags: [private]
```

```Go
func runningBenchmarks() bool
```

### <a id="afterTest" href="#afterTest">func afterTest(t testing.TB)</a>

```
searchKey: http_test.afterTest
tags: [private]
```

```Go
func afterTest(t testing.TB)
```

### <a id="waitCondition" href="#waitCondition">func waitCondition(waitFor, checkEvery time.Duration, fn func() bool) bool</a>

```
searchKey: http_test.waitCondition
tags: [private]
```

```Go
func waitCondition(waitFor, checkEvery time.Duration, fn func() bool) bool
```

waitCondition reports whether fn eventually returned true, checking immediately and then every checkEvery amount, until waitFor has elapsed, at which point it returns false. 

### <a id="waitErrCondition" href="#waitErrCondition">func waitErrCondition(waitFor, checkEvery time.Duration, fn func() error) error</a>

```
searchKey: http_test.waitErrCondition
tags: [private]
```

```Go
func waitErrCondition(waitFor, checkEvery time.Duration, fn func() error) error
```

waitErrCondition is like waitCondition but with errors instead of bools. 

### <a id="TestQuery" href="#TestQuery">func TestQuery(t *testing.T)</a>

```
searchKey: http_test.TestQuery
tags: [private]
```

```Go
func TestQuery(t *testing.T)
```

### <a id="TestParseFormSemicolonSeparator" href="#TestParseFormSemicolonSeparator">func TestParseFormSemicolonSeparator(t *testing.T)</a>

```
searchKey: http_test.TestParseFormSemicolonSeparator
tags: [private]
```

```Go
func TestParseFormSemicolonSeparator(t *testing.T)
```

Issue #25192: Test that ParseForm fails but still parses the form when an URL containing a semicolon is provided. 

### <a id="TestParseFormQuery" href="#TestParseFormQuery">func TestParseFormQuery(t *testing.T)</a>

```
searchKey: http_test.TestParseFormQuery
tags: [private]
```

```Go
func TestParseFormQuery(t *testing.T)
```

### <a id="TestParseFormQueryMethods" href="#TestParseFormQueryMethods">func TestParseFormQueryMethods(t *testing.T)</a>

```
searchKey: http_test.TestParseFormQueryMethods
tags: [private]
```

```Go
func TestParseFormQueryMethods(t *testing.T)
```

Tests that we only parse the form automatically for certain methods. 

### <a id="TestParseFormUnknownContentType" href="#TestParseFormUnknownContentType">func TestParseFormUnknownContentType(t *testing.T)</a>

```
searchKey: http_test.TestParseFormUnknownContentType
tags: [private]
```

```Go
func TestParseFormUnknownContentType(t *testing.T)
```

### <a id="TestParseFormInitializeOnError" href="#TestParseFormInitializeOnError">func TestParseFormInitializeOnError(t *testing.T)</a>

```
searchKey: http_test.TestParseFormInitializeOnError
tags: [private]
```

```Go
func TestParseFormInitializeOnError(t *testing.T)
```

### <a id="TestMultipartReader" href="#TestMultipartReader">func TestMultipartReader(t *testing.T)</a>

```
searchKey: http_test.TestMultipartReader
tags: [private]
```

```Go
func TestMultipartReader(t *testing.T)
```

### <a id="TestParseMultipartFormPopulatesPostForm" href="#TestParseMultipartFormPopulatesPostForm">func TestParseMultipartFormPopulatesPostForm(t *testing.T)</a>

```
searchKey: http_test.TestParseMultipartFormPopulatesPostForm
tags: [private]
```

```Go
func TestParseMultipartFormPopulatesPostForm(t *testing.T)
```

Issue 9305: ParseMultipartForm should populate PostForm too 

### <a id="TestParseMultipartForm" href="#TestParseMultipartForm">func TestParseMultipartForm(t *testing.T)</a>

```
searchKey: http_test.TestParseMultipartForm
tags: [private]
```

```Go
func TestParseMultipartForm(t *testing.T)
```

### <a id="TestParseMultipartFormFilename" href="#TestParseMultipartFormFilename">func TestParseMultipartFormFilename(t *testing.T)</a>

```
searchKey: http_test.TestParseMultipartFormFilename
tags: [private]
```

```Go
func TestParseMultipartFormFilename(t *testing.T)
```

Issue 45789: multipart form should not include directory path in filename 

### <a id="TestMaxInt64ForMultipartFormMaxMemoryOverflow" href="#TestMaxInt64ForMultipartFormMaxMemoryOverflow">func TestMaxInt64ForMultipartFormMaxMemoryOverflow(t *testing.T)</a>

```
searchKey: http_test.TestMaxInt64ForMultipartFormMaxMemoryOverflow
tags: [private]
```

```Go
func TestMaxInt64ForMultipartFormMaxMemoryOverflow(t *testing.T)
```

Issue #40430: Test that if maxMemory for ParseMultipartForm when combined with the payload size and the internal leeway buffer size of 10MiB overflows, that we correctly return an error. 

### <a id="TestRedirect_h1" href="#TestRedirect_h1">func TestRedirect_h1(t *testing.T)</a>

```
searchKey: http_test.TestRedirect_h1
tags: [private]
```

```Go
func TestRedirect_h1(t *testing.T)
```

### <a id="TestRedirect_h2" href="#TestRedirect_h2">func TestRedirect_h2(t *testing.T)</a>

```
searchKey: http_test.TestRedirect_h2
tags: [private]
```

```Go
func TestRedirect_h2(t *testing.T)
```

### <a id="testRedirect" href="#testRedirect">func testRedirect(t *testing.T, h2 bool)</a>

```
searchKey: http_test.testRedirect
tags: [private]
```

```Go
func testRedirect(t *testing.T, h2 bool)
```

### <a id="TestSetBasicAuth" href="#TestSetBasicAuth">func TestSetBasicAuth(t *testing.T)</a>

```
searchKey: http_test.TestSetBasicAuth
tags: [private]
```

```Go
func TestSetBasicAuth(t *testing.T)
```

### <a id="TestMultipartRequest" href="#TestMultipartRequest">func TestMultipartRequest(t *testing.T)</a>

```
searchKey: http_test.TestMultipartRequest
tags: [private]
```

```Go
func TestMultipartRequest(t *testing.T)
```

### <a id="TestParseMultipartFormSemicolonSeparator" href="#TestParseMultipartFormSemicolonSeparator">func TestParseMultipartFormSemicolonSeparator(t *testing.T)</a>

```
searchKey: http_test.TestParseMultipartFormSemicolonSeparator
tags: [private]
```

```Go
func TestParseMultipartFormSemicolonSeparator(t *testing.T)
```

Issue #25192: Test that ParseMultipartForm fails but still parses the multi-part form when an URL containing a semicolon is provided. 

### <a id="TestMultipartRequestAuto" href="#TestMultipartRequestAuto">func TestMultipartRequestAuto(t *testing.T)</a>

```
searchKey: http_test.TestMultipartRequestAuto
tags: [private]
```

```Go
func TestMultipartRequestAuto(t *testing.T)
```

### <a id="TestMissingFileMultipartRequest" href="#TestMissingFileMultipartRequest">func TestMissingFileMultipartRequest(t *testing.T)</a>

```
searchKey: http_test.TestMissingFileMultipartRequest
tags: [private]
```

```Go
func TestMissingFileMultipartRequest(t *testing.T)
```

### <a id="TestFormValueCallsParseMultipartForm" href="#TestFormValueCallsParseMultipartForm">func TestFormValueCallsParseMultipartForm(t *testing.T)</a>

```
searchKey: http_test.TestFormValueCallsParseMultipartForm
tags: [private]
```

```Go
func TestFormValueCallsParseMultipartForm(t *testing.T)
```

Test that FormValue invokes ParseMultipartForm. 

### <a id="TestFormFileCallsParseMultipartForm" href="#TestFormFileCallsParseMultipartForm">func TestFormFileCallsParseMultipartForm(t *testing.T)</a>

```
searchKey: http_test.TestFormFileCallsParseMultipartForm
tags: [private]
```

```Go
func TestFormFileCallsParseMultipartForm(t *testing.T)
```

Test that FormFile invokes ParseMultipartForm. 

### <a id="TestParseMultipartFormOrder" href="#TestParseMultipartFormOrder">func TestParseMultipartFormOrder(t *testing.T)</a>

```
searchKey: http_test.TestParseMultipartFormOrder
tags: [private]
```

```Go
func TestParseMultipartFormOrder(t *testing.T)
```

Test that ParseMultipartForm errors if called after MultipartReader on the same request. 

### <a id="TestMultipartReaderOrder" href="#TestMultipartReaderOrder">func TestMultipartReaderOrder(t *testing.T)</a>

```
searchKey: http_test.TestMultipartReaderOrder
tags: [private]
```

```Go
func TestMultipartReaderOrder(t *testing.T)
```

Test that MultipartReader errors if called after ParseMultipartForm on the same request. 

### <a id="TestFormFileOrder" href="#TestFormFileOrder">func TestFormFileOrder(t *testing.T)</a>

```
searchKey: http_test.TestFormFileOrder
tags: [private]
```

```Go
func TestFormFileOrder(t *testing.T)
```

Test that FormFile errors if called after MultipartReader on the same request. 

### <a id="TestReadRequestErrors" href="#TestReadRequestErrors">func TestReadRequestErrors(t *testing.T)</a>

```
searchKey: http_test.TestReadRequestErrors
tags: [private]
```

```Go
func TestReadRequestErrors(t *testing.T)
```

### <a id="TestNewRequestHost" href="#TestNewRequestHost">func TestNewRequestHost(t *testing.T)</a>

```
searchKey: http_test.TestNewRequestHost
tags: [private]
```

```Go
func TestNewRequestHost(t *testing.T)
```

### <a id="TestRequestInvalidMethod" href="#TestRequestInvalidMethod">func TestRequestInvalidMethod(t *testing.T)</a>

```
searchKey: http_test.TestRequestInvalidMethod
tags: [private]
```

```Go
func TestRequestInvalidMethod(t *testing.T)
```

### <a id="TestNewRequestContentLength" href="#TestNewRequestContentLength">func TestNewRequestContentLength(t *testing.T)</a>

```
searchKey: http_test.TestNewRequestContentLength
tags: [private]
```

```Go
func TestNewRequestContentLength(t *testing.T)
```

### <a id="TestParseHTTPVersion" href="#TestParseHTTPVersion">func TestParseHTTPVersion(t *testing.T)</a>

```
searchKey: http_test.TestParseHTTPVersion
tags: [private]
```

```Go
func TestParseHTTPVersion(t *testing.T)
```

### <a id="TestGetBasicAuth" href="#TestGetBasicAuth">func TestGetBasicAuth(t *testing.T)</a>

```
searchKey: http_test.TestGetBasicAuth
tags: [private]
```

```Go
func TestGetBasicAuth(t *testing.T)
```

### <a id="TestParseBasicAuth" href="#TestParseBasicAuth">func TestParseBasicAuth(t *testing.T)</a>

```
searchKey: http_test.TestParseBasicAuth
tags: [private]
```

```Go
func TestParseBasicAuth(t *testing.T)
```

### <a id="TestRequestWriteBufferedWriter" href="#TestRequestWriteBufferedWriter">func TestRequestWriteBufferedWriter(t *testing.T)</a>

```
searchKey: http_test.TestRequestWriteBufferedWriter
tags: [private]
```

```Go
func TestRequestWriteBufferedWriter(t *testing.T)
```

### <a id="TestRequestBadHost" href="#TestRequestBadHost">func TestRequestBadHost(t *testing.T)</a>

```
searchKey: http_test.TestRequestBadHost
tags: [private]
```

```Go
func TestRequestBadHost(t *testing.T)
```

### <a id="TestStarRequest" href="#TestStarRequest">func TestStarRequest(t *testing.T)</a>

```
searchKey: http_test.TestStarRequest
tags: [private]
```

```Go
func TestStarRequest(t *testing.T)
```

### <a id="TestIssue10884_MaxBytesEOF" href="#TestIssue10884_MaxBytesEOF">func TestIssue10884_MaxBytesEOF(t *testing.T)</a>

```
searchKey: http_test.TestIssue10884_MaxBytesEOF
tags: [private]
```

```Go
func TestIssue10884_MaxBytesEOF(t *testing.T)
```

### <a id="TestMaxBytesReaderStickyError" href="#TestMaxBytesReaderStickyError">func TestMaxBytesReaderStickyError(t *testing.T)</a>

```
searchKey: http_test.TestMaxBytesReaderStickyError
tags: [private]
```

```Go
func TestMaxBytesReaderStickyError(t *testing.T)
```

Issue 14981: MaxBytesReader's return error wasn't sticky. It doesn't technically need to be, but people expected it to be. 

### <a id="TestMaxBytesReaderDifferentLimits" href="#TestMaxBytesReaderDifferentLimits">func TestMaxBytesReaderDifferentLimits(t *testing.T)</a>

```
searchKey: http_test.TestMaxBytesReaderDifferentLimits
tags: [private]
```

```Go
func TestMaxBytesReaderDifferentLimits(t *testing.T)
```

Issue 45101: maxBytesReader's Read panicked when n < -1. This test also ensures that Read treats negative limits as equivalent to 0. 

### <a id="TestWithContextDeepCopiesURL" href="#TestWithContextDeepCopiesURL">func TestWithContextDeepCopiesURL(t *testing.T)</a>

```
searchKey: http_test.TestWithContextDeepCopiesURL
tags: [private]
```

```Go
func TestWithContextDeepCopiesURL(t *testing.T)
```

### <a id="TestRequestCloneTransferEncoding" href="#TestRequestCloneTransferEncoding">func TestRequestCloneTransferEncoding(t *testing.T)</a>

```
searchKey: http_test.TestRequestCloneTransferEncoding
tags: [private]
```

```Go
func TestRequestCloneTransferEncoding(t *testing.T)
```

Ensure that Request.Clone creates a deep copy of TransferEncoding. See issue 41907. 

### <a id="TestNoPanicOnRoundTripWithBasicAuth_h1" href="#TestNoPanicOnRoundTripWithBasicAuth_h1">func TestNoPanicOnRoundTripWithBasicAuth_h1(t *testing.T)</a>

```
searchKey: http_test.TestNoPanicOnRoundTripWithBasicAuth_h1
tags: [private]
```

```Go
func TestNoPanicOnRoundTripWithBasicAuth_h1(t *testing.T)
```

### <a id="TestNoPanicOnRoundTripWithBasicAuth_h2" href="#TestNoPanicOnRoundTripWithBasicAuth_h2">func TestNoPanicOnRoundTripWithBasicAuth_h2(t *testing.T)</a>

```
searchKey: http_test.TestNoPanicOnRoundTripWithBasicAuth_h2
tags: [private]
```

```Go
func TestNoPanicOnRoundTripWithBasicAuth_h2(t *testing.T)
```

### <a id="testNoPanicWithBasicAuth" href="#testNoPanicWithBasicAuth">func testNoPanicWithBasicAuth(t *testing.T, h2 bool)</a>

```
searchKey: http_test.testNoPanicWithBasicAuth
tags: [private]
```

```Go
func testNoPanicWithBasicAuth(t *testing.T, h2 bool)
```

Issue 34878: verify we don't panic when including basic auth (Go 1.13 regression) 

### <a id="TestNewRequestGetBody" href="#TestNewRequestGetBody">func TestNewRequestGetBody(t *testing.T)</a>

```
searchKey: http_test.TestNewRequestGetBody
tags: [private]
```

```Go
func TestNewRequestGetBody(t *testing.T)
```

verify that NewRequest sets Request.GetBody and that it works 

### <a id="testMissingFile" href="#testMissingFile">func testMissingFile(t *testing.T, req *Request)</a>

```
searchKey: http_test.testMissingFile
tags: [private]
```

```Go
func testMissingFile(t *testing.T, req *Request)
```

### <a id="newTestMultipartRequest" href="#newTestMultipartRequest">func newTestMultipartRequest(t *testing.T) *Request</a>

```
searchKey: http_test.newTestMultipartRequest
tags: [private]
```

```Go
func newTestMultipartRequest(t *testing.T) *Request
```

### <a id="validateTestMultipartContents" href="#validateTestMultipartContents">func validateTestMultipartContents(t *testing.T, req *Request, allMem bool)</a>

```
searchKey: http_test.validateTestMultipartContents
tags: [private]
```

```Go
func validateTestMultipartContents(t *testing.T, req *Request, allMem bool)
```

### <a id="testMultipartFile" href="#testMultipartFile">func testMultipartFile(t *testing.T, req *Request, key, expectFilename, expectContent string) multipart.File</a>

```
searchKey: http_test.testMultipartFile
tags: [private]
```

```Go
func testMultipartFile(t *testing.T, req *Request, key, expectFilename, expectContent string) multipart.File
```

### <a id="benchmarkReadRequest" href="#benchmarkReadRequest">func benchmarkReadRequest(b *testing.B, request string)</a>

```
searchKey: http_test.benchmarkReadRequest
tags: [private]
```

```Go
func benchmarkReadRequest(b *testing.B, request string)
```

### <a id="BenchmarkReadRequestChrome" href="#BenchmarkReadRequestChrome">func BenchmarkReadRequestChrome(b *testing.B)</a>

```
searchKey: http_test.BenchmarkReadRequestChrome
tags: [private]
```

```Go
func BenchmarkReadRequestChrome(b *testing.B)
```

### <a id="BenchmarkReadRequestCurl" href="#BenchmarkReadRequestCurl">func BenchmarkReadRequestCurl(b *testing.B)</a>

```
searchKey: http_test.BenchmarkReadRequestCurl
tags: [private]
```

```Go
func BenchmarkReadRequestCurl(b *testing.B)
```

### <a id="BenchmarkReadRequestApachebench" href="#BenchmarkReadRequestApachebench">func BenchmarkReadRequestApachebench(b *testing.B)</a>

```
searchKey: http_test.BenchmarkReadRequestApachebench
tags: [private]
```

```Go
func BenchmarkReadRequestApachebench(b *testing.B)
```

### <a id="BenchmarkReadRequestSiege" href="#BenchmarkReadRequestSiege">func BenchmarkReadRequestSiege(b *testing.B)</a>

```
searchKey: http_test.BenchmarkReadRequestSiege
tags: [private]
```

```Go
func BenchmarkReadRequestSiege(b *testing.B)
```

### <a id="BenchmarkReadRequestWrk" href="#BenchmarkReadRequestWrk">func BenchmarkReadRequestWrk(b *testing.B)</a>

```
searchKey: http_test.BenchmarkReadRequestWrk
tags: [private]
```

```Go
func BenchmarkReadRequestWrk(b *testing.B)
```

### <a id="BenchmarkFileAndServer_1KB" href="#BenchmarkFileAndServer_1KB">func BenchmarkFileAndServer_1KB(b *testing.B)</a>

```
searchKey: http_test.BenchmarkFileAndServer_1KB
tags: [private]
```

```Go
func BenchmarkFileAndServer_1KB(b *testing.B)
```

### <a id="BenchmarkFileAndServer_16MB" href="#BenchmarkFileAndServer_16MB">func BenchmarkFileAndServer_16MB(b *testing.B)</a>

```
searchKey: http_test.BenchmarkFileAndServer_16MB
tags: [private]
```

```Go
func BenchmarkFileAndServer_16MB(b *testing.B)
```

### <a id="BenchmarkFileAndServer_64MB" href="#BenchmarkFileAndServer_64MB">func BenchmarkFileAndServer_64MB(b *testing.B)</a>

```
searchKey: http_test.BenchmarkFileAndServer_64MB
tags: [private]
```

```Go
func BenchmarkFileAndServer_64MB(b *testing.B)
```

### <a id="benchmarkFileAndServer" href="#benchmarkFileAndServer">func benchmarkFileAndServer(b *testing.B, n int64)</a>

```
searchKey: http_test.benchmarkFileAndServer
tags: [private]
```

```Go
func benchmarkFileAndServer(b *testing.B, n int64)
```

### <a id="runFileAndServerBenchmarks" href="#runFileAndServerBenchmarks">func runFileAndServerBenchmarks(b *testing.B, tlsOption bool, f *os.File, n int64)</a>

```
searchKey: http_test.runFileAndServerBenchmarks
tags: [private]
```

```Go
func runFileAndServerBenchmarks(b *testing.B, tlsOption bool, f *os.File, n int64)
```

### <a id="reqBytes" href="#reqBytes">func reqBytes(req string) []byte</a>

```
searchKey: http_test.reqBytes
tags: [private]
```

```Go
func reqBytes(req string) []byte
```

reqBytes treats req as a request (with \n delimiters) and returns it with \r\n delimiters, ending in \r\n\r\n 

### <a id="TestConsumingBodyOnNextConn" href="#TestConsumingBodyOnNextConn">func TestConsumingBodyOnNextConn(t *testing.T)</a>

```
searchKey: http_test.TestConsumingBodyOnNextConn
tags: [private]
```

```Go
func TestConsumingBodyOnNextConn(t *testing.T)
```

### <a id="TestHostHandlers" href="#TestHostHandlers">func TestHostHandlers(t *testing.T)</a>

```
searchKey: http_test.TestHostHandlers
tags: [private]
```

```Go
func TestHostHandlers(t *testing.T)
```

### <a id="serve" href="#serve">func serve(code int) HandlerFunc</a>

```
searchKey: http_test.serve
tags: [private]
```

```Go
func serve(code int) HandlerFunc
```

serve returns a handler that sends a response with the given code. 

### <a id="checkQueryStringHandler" href="#checkQueryStringHandler">func checkQueryStringHandler(w ResponseWriter, r *Request)</a>

```
searchKey: http_test.checkQueryStringHandler
tags: [private]
```

```Go
func checkQueryStringHandler(w ResponseWriter, r *Request)
```

checkQueryStringHandler checks if r.URL.RawQuery has the same value as the URL excluding the scheme and the query string and sends 200 response code if it is, 500 otherwise. 

### <a id="TestServeMuxHandler" href="#TestServeMuxHandler">func TestServeMuxHandler(t *testing.T)</a>

```
searchKey: http_test.TestServeMuxHandler
tags: [private]
```

```Go
func TestServeMuxHandler(t *testing.T)
```

### <a id="TestServeMuxHandleFuncWithNilHandler" href="#TestServeMuxHandleFuncWithNilHandler">func TestServeMuxHandleFuncWithNilHandler(t *testing.T)</a>

```
searchKey: http_test.TestServeMuxHandleFuncWithNilHandler
tags: [private]
```

```Go
func TestServeMuxHandleFuncWithNilHandler(t *testing.T)
```

Issue 24297 

### <a id="TestServeMuxHandlerRedirects" href="#TestServeMuxHandlerRedirects">func TestServeMuxHandlerRedirects(t *testing.T)</a>

```
searchKey: http_test.TestServeMuxHandlerRedirects
tags: [private]
```

```Go
func TestServeMuxHandlerRedirects(t *testing.T)
```

TestServeMuxHandlerRedirects tests that automatic redirects generated by mux.Handler() shouldn't clear the request's query string. 

### <a id="TestMuxRedirectLeadingSlashes" href="#TestMuxRedirectLeadingSlashes">func TestMuxRedirectLeadingSlashes(t *testing.T)</a>

```
searchKey: http_test.TestMuxRedirectLeadingSlashes
tags: [private]
```

```Go
func TestMuxRedirectLeadingSlashes(t *testing.T)
```

Tests for [https://golang.org/issue/900](https://golang.org/issue/900) 

### <a id="TestServeWithSlashRedirectKeepsQueryString" href="#TestServeWithSlashRedirectKeepsQueryString">func TestServeWithSlashRedirectKeepsQueryString(t *testing.T)</a>

```
searchKey: http_test.TestServeWithSlashRedirectKeepsQueryString
tags: [private]
```

```Go
func TestServeWithSlashRedirectKeepsQueryString(t *testing.T)
```

Test that the special cased "/route" redirect implicitly created by a registered "/route/" properly sets the query string in the redirect URL. See Issue 17841. 

### <a id="TestServeWithSlashRedirectForHostPatterns" href="#TestServeWithSlashRedirectForHostPatterns">func TestServeWithSlashRedirectForHostPatterns(t *testing.T)</a>

```
searchKey: http_test.TestServeWithSlashRedirectForHostPatterns
tags: [private]
```

```Go
func TestServeWithSlashRedirectForHostPatterns(t *testing.T)
```

### <a id="TestShouldRedirectConcurrency" href="#TestShouldRedirectConcurrency">func TestShouldRedirectConcurrency(t *testing.T)</a>

```
searchKey: http_test.TestShouldRedirectConcurrency
tags: [private]
```

```Go
func TestShouldRedirectConcurrency(t *testing.T)
```

### <a id="BenchmarkServeMux" href="#BenchmarkServeMux">func BenchmarkServeMux(b *testing.B)</a>

```
searchKey: http_test.BenchmarkServeMux
tags: [private]
```

```Go
func BenchmarkServeMux(b *testing.B)
```

### <a id="BenchmarkServeMux_SkipServe" href="#BenchmarkServeMux_SkipServe">func BenchmarkServeMux_SkipServe(b *testing.B)</a>

```
searchKey: http_test.BenchmarkServeMux_SkipServe
tags: [private]
```

```Go
func BenchmarkServeMux_SkipServe(b *testing.B)
```

### <a id="benchmarkServeMux" href="#benchmarkServeMux">func benchmarkServeMux(b *testing.B, runHandler bool)</a>

```
searchKey: http_test.benchmarkServeMux
tags: [private]
```

```Go
func benchmarkServeMux(b *testing.B, runHandler bool)
```

### <a id="TestServerTimeouts" href="#TestServerTimeouts">func TestServerTimeouts(t *testing.T)</a>

```
searchKey: http_test.TestServerTimeouts
tags: [private]
```

```Go
func TestServerTimeouts(t *testing.T)
```

### <a id="testServerTimeouts" href="#testServerTimeouts">func testServerTimeouts(timeout time.Duration) error</a>

```
searchKey: http_test.testServerTimeouts
tags: [private]
```

```Go
func testServerTimeouts(timeout time.Duration) error
```

### <a id="TestHTTP2WriteDeadlineExtendedOnNewRequest" href="#TestHTTP2WriteDeadlineExtendedOnNewRequest">func TestHTTP2WriteDeadlineExtendedOnNewRequest(t *testing.T)</a>

```
searchKey: http_test.TestHTTP2WriteDeadlineExtendedOnNewRequest
tags: [private]
```

```Go
func TestHTTP2WriteDeadlineExtendedOnNewRequest(t *testing.T)
```

Test that the HTTP/2 server handles Server.WriteTimeout (Issue 18437) 

### <a id="tryTimeouts" href="#tryTimeouts">func tryTimeouts(t *testing.T, testFunc func(timeout time.Duration) error)</a>

```
searchKey: http_test.tryTimeouts
tags: [private]
```

```Go
func tryTimeouts(t *testing.T, testFunc func(timeout time.Duration) error)
```

tryTimeouts runs testFunc with increasing timeouts. Test passes on first success, and fails if all timeouts fail. 

### <a id="TestHTTP2WriteDeadlineEnforcedPerStream" href="#TestHTTP2WriteDeadlineEnforcedPerStream">func TestHTTP2WriteDeadlineEnforcedPerStream(t *testing.T)</a>

```
searchKey: http_test.TestHTTP2WriteDeadlineEnforcedPerStream
tags: [private]
```

```Go
func TestHTTP2WriteDeadlineEnforcedPerStream(t *testing.T)
```

Test that the HTTP/2 server RSTs stream on slow write. 

### <a id="testHTTP2WriteDeadlineEnforcedPerStream" href="#testHTTP2WriteDeadlineEnforcedPerStream">func testHTTP2WriteDeadlineEnforcedPerStream(timeout time.Duration) error</a>

```
searchKey: http_test.testHTTP2WriteDeadlineEnforcedPerStream
tags: [private]
```

```Go
func testHTTP2WriteDeadlineEnforcedPerStream(timeout time.Duration) error
```

### <a id="TestHTTP2NoWriteDeadline" href="#TestHTTP2NoWriteDeadline">func TestHTTP2NoWriteDeadline(t *testing.T)</a>

```
searchKey: http_test.TestHTTP2NoWriteDeadline
tags: [private]
```

```Go
func TestHTTP2NoWriteDeadline(t *testing.T)
```

Test that the HTTP/2 server does not send RST when WriteDeadline not set. 

### <a id="testHTTP2NoWriteDeadline" href="#testHTTP2NoWriteDeadline">func testHTTP2NoWriteDeadline(timeout time.Duration) error</a>

```
searchKey: http_test.testHTTP2NoWriteDeadline
tags: [private]
```

```Go
func testHTTP2NoWriteDeadline(timeout time.Duration) error
```

### <a id="TestOnlyWriteTimeout" href="#TestOnlyWriteTimeout">func TestOnlyWriteTimeout(t *testing.T)</a>

```
searchKey: http_test.TestOnlyWriteTimeout
tags: [private]
```

```Go
func TestOnlyWriteTimeout(t *testing.T)
```

golang.org/issue/4741 -- setting only a write timeout that triggers shouldn't cause a handler to block forever on reads (next HTTP request) that will never happen. 

### <a id="TestIdentityResponse" href="#TestIdentityResponse">func TestIdentityResponse(t *testing.T)</a>

```
searchKey: http_test.TestIdentityResponse
tags: [private]
```

```Go
func TestIdentityResponse(t *testing.T)
```

TestIdentityResponse verifies that a handler can unset 

### <a id="testTCPConnectionCloses" href="#testTCPConnectionCloses">func testTCPConnectionCloses(t *testing.T, req string, h Handler)</a>

```
searchKey: http_test.testTCPConnectionCloses
tags: [private]
```

```Go
func testTCPConnectionCloses(t *testing.T, req string, h Handler)
```

### <a id="testTCPConnectionStaysOpen" href="#testTCPConnectionStaysOpen">func testTCPConnectionStaysOpen(t *testing.T, req string, handler Handler)</a>

```
searchKey: http_test.testTCPConnectionStaysOpen
tags: [private]
```

```Go
func testTCPConnectionStaysOpen(t *testing.T, req string, handler Handler)
```

### <a id="TestServeHTTP10Close" href="#TestServeHTTP10Close">func TestServeHTTP10Close(t *testing.T)</a>

```
searchKey: http_test.TestServeHTTP10Close
tags: [private]
```

```Go
func TestServeHTTP10Close(t *testing.T)
```

TestServeHTTP10Close verifies that HTTP/1.0 requests won't be kept alive. 

### <a id="TestClientCanClose" href="#TestClientCanClose">func TestClientCanClose(t *testing.T)</a>

```
searchKey: http_test.TestClientCanClose
tags: [private]
```

```Go
func TestClientCanClose(t *testing.T)
```

TestClientCanClose verifies that clients can also force a connection to close. 

### <a id="TestHandlersCanSetConnectionClose11" href="#TestHandlersCanSetConnectionClose11">func TestHandlersCanSetConnectionClose11(t *testing.T)</a>

```
searchKey: http_test.TestHandlersCanSetConnectionClose11
tags: [private]
```

```Go
func TestHandlersCanSetConnectionClose11(t *testing.T)
```

TestHandlersCanSetConnectionClose verifies that handlers can force a connection to close, even for HTTP/1.1 requests. 

### <a id="TestHandlersCanSetConnectionClose10" href="#TestHandlersCanSetConnectionClose10">func TestHandlersCanSetConnectionClose10(t *testing.T)</a>

```
searchKey: http_test.TestHandlersCanSetConnectionClose10
tags: [private]
```

```Go
func TestHandlersCanSetConnectionClose10(t *testing.T)
```

### <a id="TestHTTP2UpgradeClosesConnection" href="#TestHTTP2UpgradeClosesConnection">func TestHTTP2UpgradeClosesConnection(t *testing.T)</a>

```
searchKey: http_test.TestHTTP2UpgradeClosesConnection
tags: [private]
```

```Go
func TestHTTP2UpgradeClosesConnection(t *testing.T)
```

### <a id="send204" href="#send204">func send204(w ResponseWriter, r *Request)</a>

```
searchKey: http_test.send204
tags: [private]
```

```Go
func send204(w ResponseWriter, r *Request)
```

### <a id="send304" href="#send304">func send304(w ResponseWriter, r *Request)</a>

```
searchKey: http_test.send304
tags: [private]
```

```Go
func send304(w ResponseWriter, r *Request)
```

### <a id="TestHTTP10KeepAlive204Response" href="#TestHTTP10KeepAlive204Response">func TestHTTP10KeepAlive204Response(t *testing.T)</a>

```
searchKey: http_test.TestHTTP10KeepAlive204Response
tags: [private]
```

```Go
func TestHTTP10KeepAlive204Response(t *testing.T)
```

Issue 15647: 204 responses can't have bodies, so HTTP/1.0 keep-alive conns should stay open. 

### <a id="TestHTTP11KeepAlive204Response" href="#TestHTTP11KeepAlive204Response">func TestHTTP11KeepAlive204Response(t *testing.T)</a>

```
searchKey: http_test.TestHTTP11KeepAlive204Response
tags: [private]
```

```Go
func TestHTTP11KeepAlive204Response(t *testing.T)
```

### <a id="TestHTTP10KeepAlive304Response" href="#TestHTTP10KeepAlive304Response">func TestHTTP10KeepAlive304Response(t *testing.T)</a>

```
searchKey: http_test.TestHTTP10KeepAlive304Response
tags: [private]
```

```Go
func TestHTTP10KeepAlive304Response(t *testing.T)
```

### <a id="TestKeepAliveFinalChunkWithEOF" href="#TestKeepAliveFinalChunkWithEOF">func TestKeepAliveFinalChunkWithEOF(t *testing.T)</a>

```
searchKey: http_test.TestKeepAliveFinalChunkWithEOF
tags: [private]
```

```Go
func TestKeepAliveFinalChunkWithEOF(t *testing.T)
```

Issue 15703 

### <a id="TestSetsRemoteAddr_h1" href="#TestSetsRemoteAddr_h1">func TestSetsRemoteAddr_h1(t *testing.T)</a>

```
searchKey: http_test.TestSetsRemoteAddr_h1
tags: [private]
```

```Go
func TestSetsRemoteAddr_h1(t *testing.T)
```

### <a id="TestSetsRemoteAddr_h2" href="#TestSetsRemoteAddr_h2">func TestSetsRemoteAddr_h2(t *testing.T)</a>

```
searchKey: http_test.TestSetsRemoteAddr_h2
tags: [private]
```

```Go
func TestSetsRemoteAddr_h2(t *testing.T)
```

### <a id="testSetsRemoteAddr" href="#testSetsRemoteAddr">func testSetsRemoteAddr(t *testing.T, h2 bool)</a>

```
searchKey: http_test.testSetsRemoteAddr
tags: [private]
```

```Go
func testSetsRemoteAddr(t *testing.T, h2 bool)
```

### <a id="TestServerAllowsBlockingRemoteAddr" href="#TestServerAllowsBlockingRemoteAddr">func TestServerAllowsBlockingRemoteAddr(t *testing.T)</a>

```
searchKey: http_test.TestServerAllowsBlockingRemoteAddr
tags: [private]
```

```Go
func TestServerAllowsBlockingRemoteAddr(t *testing.T)
```

Issue 12943 

### <a id="TestHeadResponses_h1" href="#TestHeadResponses_h1">func TestHeadResponses_h1(t *testing.T)</a>

```
searchKey: http_test.TestHeadResponses_h1
tags: [private]
```

```Go
func TestHeadResponses_h1(t *testing.T)
```

TestHeadResponses verifies that all MIME type sniffing and Content-Length counting of GET requests also happens on HEAD requests. 

### <a id="TestHeadResponses_h2" href="#TestHeadResponses_h2">func TestHeadResponses_h2(t *testing.T)</a>

```
searchKey: http_test.TestHeadResponses_h2
tags: [private]
```

```Go
func TestHeadResponses_h2(t *testing.T)
```

### <a id="testHeadResponses" href="#testHeadResponses">func testHeadResponses(t *testing.T, h2 bool)</a>

```
searchKey: http_test.testHeadResponses
tags: [private]
```

```Go
func testHeadResponses(t *testing.T, h2 bool)
```

### <a id="TestTLSHandshakeTimeout" href="#TestTLSHandshakeTimeout">func TestTLSHandshakeTimeout(t *testing.T)</a>

```
searchKey: http_test.TestTLSHandshakeTimeout
tags: [private]
```

```Go
func TestTLSHandshakeTimeout(t *testing.T)
```

### <a id="TestTLSServer" href="#TestTLSServer">func TestTLSServer(t *testing.T)</a>

```
searchKey: http_test.TestTLSServer
tags: [private]
```

```Go
func TestTLSServer(t *testing.T)
```

### <a id="TestServeTLS" href="#TestServeTLS">func TestServeTLS(t *testing.T)</a>

```
searchKey: http_test.TestServeTLS
tags: [private]
```

```Go
func TestServeTLS(t *testing.T)
```

### <a id="TestTLSServerRejectHTTPRequests" href="#TestTLSServerRejectHTTPRequests">func TestTLSServerRejectHTTPRequests(t *testing.T)</a>

```
searchKey: http_test.TestTLSServerRejectHTTPRequests
tags: [private]
```

```Go
func TestTLSServerRejectHTTPRequests(t *testing.T)
```

Test that the HTTPS server nicely rejects plaintext HTTP/1.x requests. 

### <a id="TestAutomaticHTTP2_Serve_NoTLSConfig" href="#TestAutomaticHTTP2_Serve_NoTLSConfig">func TestAutomaticHTTP2_Serve_NoTLSConfig(t *testing.T)</a>

```
searchKey: http_test.TestAutomaticHTTP2_Serve_NoTLSConfig
tags: [private]
```

```Go
func TestAutomaticHTTP2_Serve_NoTLSConfig(t *testing.T)
```

Issue 15908 

### <a id="TestAutomaticHTTP2_Serve_NonH2TLSConfig" href="#TestAutomaticHTTP2_Serve_NonH2TLSConfig">func TestAutomaticHTTP2_Serve_NonH2TLSConfig(t *testing.T)</a>

```
searchKey: http_test.TestAutomaticHTTP2_Serve_NonH2TLSConfig
tags: [private]
```

```Go
func TestAutomaticHTTP2_Serve_NonH2TLSConfig(t *testing.T)
```

### <a id="TestAutomaticHTTP2_Serve_H2TLSConfig" href="#TestAutomaticHTTP2_Serve_H2TLSConfig">func TestAutomaticHTTP2_Serve_H2TLSConfig(t *testing.T)</a>

```
searchKey: http_test.TestAutomaticHTTP2_Serve_H2TLSConfig
tags: [private]
```

```Go
func TestAutomaticHTTP2_Serve_H2TLSConfig(t *testing.T)
```

### <a id="testAutomaticHTTP2_Serve" href="#testAutomaticHTTP2_Serve">func testAutomaticHTTP2_Serve(t *testing.T, tlsConf *tls.Config, wantH2 bool)</a>

```
searchKey: http_test.testAutomaticHTTP2_Serve
tags: [private]
```

```Go
func testAutomaticHTTP2_Serve(t *testing.T, tlsConf *tls.Config, wantH2 bool)
```

### <a id="TestAutomaticHTTP2_Serve_WithTLSConfig" href="#TestAutomaticHTTP2_Serve_WithTLSConfig">func TestAutomaticHTTP2_Serve_WithTLSConfig(t *testing.T)</a>

```
searchKey: http_test.TestAutomaticHTTP2_Serve_WithTLSConfig
tags: [private]
```

```Go
func TestAutomaticHTTP2_Serve_WithTLSConfig(t *testing.T)
```

### <a id="TestAutomaticHTTP2_ListenAndServe" href="#TestAutomaticHTTP2_ListenAndServe">func TestAutomaticHTTP2_ListenAndServe(t *testing.T)</a>

```
searchKey: http_test.TestAutomaticHTTP2_ListenAndServe
tags: [private]
```

```Go
func TestAutomaticHTTP2_ListenAndServe(t *testing.T)
```

### <a id="TestAutomaticHTTP2_ListenAndServe_GetCertificate" href="#TestAutomaticHTTP2_ListenAndServe_GetCertificate">func TestAutomaticHTTP2_ListenAndServe_GetCertificate(t *testing.T)</a>

```
searchKey: http_test.TestAutomaticHTTP2_ListenAndServe_GetCertificate
tags: [private]
```

```Go
func TestAutomaticHTTP2_ListenAndServe_GetCertificate(t *testing.T)
```

### <a id="testAutomaticHTTP2_ListenAndServe" href="#testAutomaticHTTP2_ListenAndServe">func testAutomaticHTTP2_ListenAndServe(t *testing.T, tlsConf *tls.Config)</a>

```
searchKey: http_test.testAutomaticHTTP2_ListenAndServe
tags: [private]
```

```Go
func testAutomaticHTTP2_ListenAndServe(t *testing.T, tlsConf *tls.Config)
```

### <a id="TestServerExpect" href="#TestServerExpect">func TestServerExpect(t *testing.T)</a>

```
searchKey: http_test.TestServerExpect
tags: [private]
```

```Go
func TestServerExpect(t *testing.T)
```

Tests that the server responds to the "Expect" request header correctly. http2 test: TestServer_Response_Automatic100Continue 

### <a id="TestServerUnreadRequestBodyLittle" href="#TestServerUnreadRequestBodyLittle">func TestServerUnreadRequestBodyLittle(t *testing.T)</a>

```
searchKey: http_test.TestServerUnreadRequestBodyLittle
tags: [private]
```

```Go
func TestServerUnreadRequestBodyLittle(t *testing.T)
```

Under a ~256KB (maxPostHandlerReadBytes) threshold, the server should consume client request bodies that a handler didn't read. 

### <a id="TestServerUnreadRequestBodyLarge" href="#TestServerUnreadRequestBodyLarge">func TestServerUnreadRequestBodyLarge(t *testing.T)</a>

```
searchKey: http_test.TestServerUnreadRequestBodyLarge
tags: [private]
```

```Go
func TestServerUnreadRequestBodyLarge(t *testing.T)
```

Over a ~256KB (maxPostHandlerReadBytes) threshold, the server should ignore client request bodies that a handler didn't read and close the connection. 

### <a id="TestHandlerBodyClose" href="#TestHandlerBodyClose">func TestHandlerBodyClose(t *testing.T)</a>

```
searchKey: http_test.TestHandlerBodyClose
tags: [private]
```

```Go
func TestHandlerBodyClose(t *testing.T)
```

### <a id="testHandlerBodyClose" href="#testHandlerBodyClose">func testHandlerBodyClose(t *testing.T, i int, tt handlerBodyCloseTest)</a>

```
searchKey: http_test.testHandlerBodyClose
tags: [private]
```

```Go
func testHandlerBodyClose(t *testing.T, i int, tt handlerBodyCloseTest)
```

### <a id="TestRequestBodyReadErrorClosesConnection" href="#TestRequestBodyReadErrorClosesConnection">func TestRequestBodyReadErrorClosesConnection(t *testing.T)</a>

```
searchKey: http_test.TestRequestBodyReadErrorClosesConnection
tags: [private]
```

```Go
func TestRequestBodyReadErrorClosesConnection(t *testing.T)
```

### <a id="TestInvalidTrailerClosesConnection" href="#TestInvalidTrailerClosesConnection">func TestInvalidTrailerClosesConnection(t *testing.T)</a>

```
searchKey: http_test.TestInvalidTrailerClosesConnection
tags: [private]
```

```Go
func TestInvalidTrailerClosesConnection(t *testing.T)
```

### <a id="TestRequestBodyTimeoutClosesConnection" href="#TestRequestBodyTimeoutClosesConnection">func TestRequestBodyTimeoutClosesConnection(t *testing.T)</a>

```
searchKey: http_test.TestRequestBodyTimeoutClosesConnection
tags: [private]
```

```Go
func TestRequestBodyTimeoutClosesConnection(t *testing.T)
```

### <a id="TestTimeoutHandler_h1" href="#TestTimeoutHandler_h1">func TestTimeoutHandler_h1(t *testing.T)</a>

```
searchKey: http_test.TestTimeoutHandler_h1
tags: [private]
```

```Go
func TestTimeoutHandler_h1(t *testing.T)
```

### <a id="TestTimeoutHandler_h2" href="#TestTimeoutHandler_h2">func TestTimeoutHandler_h2(t *testing.T)</a>

```
searchKey: http_test.TestTimeoutHandler_h2
tags: [private]
```

```Go
func TestTimeoutHandler_h2(t *testing.T)
```

### <a id="testTimeoutHandler" href="#testTimeoutHandler">func testTimeoutHandler(t *testing.T, h2 bool)</a>

```
searchKey: http_test.testTimeoutHandler
tags: [private]
```

```Go
func testTimeoutHandler(t *testing.T, h2 bool)
```

### <a id="TestTimeoutHandlerRace" href="#TestTimeoutHandlerRace">func TestTimeoutHandlerRace(t *testing.T)</a>

```
searchKey: http_test.TestTimeoutHandlerRace
tags: [private]
```

```Go
func TestTimeoutHandlerRace(t *testing.T)
```

See issues 8209 and 8414. 

### <a id="TestTimeoutHandlerRaceHeader" href="#TestTimeoutHandlerRaceHeader">func TestTimeoutHandlerRaceHeader(t *testing.T)</a>

```
searchKey: http_test.TestTimeoutHandlerRaceHeader
tags: [private]
```

```Go
func TestTimeoutHandlerRaceHeader(t *testing.T)
```

See issues 8209 and 8414. Both issues involved panics in the implementation of TimeoutHandler. 

### <a id="TestTimeoutHandlerRaceHeaderTimeout" href="#TestTimeoutHandlerRaceHeaderTimeout">func TestTimeoutHandlerRaceHeaderTimeout(t *testing.T)</a>

```
searchKey: http_test.TestTimeoutHandlerRaceHeaderTimeout
tags: [private]
```

```Go
func TestTimeoutHandlerRaceHeaderTimeout(t *testing.T)
```

Issue 9162 

### <a id="TestTimeoutHandlerStartTimerWhenServing" href="#TestTimeoutHandlerStartTimerWhenServing">func TestTimeoutHandlerStartTimerWhenServing(t *testing.T)</a>

```
searchKey: http_test.TestTimeoutHandlerStartTimerWhenServing
tags: [private]
```

```Go
func TestTimeoutHandlerStartTimerWhenServing(t *testing.T)
```

Issue 14568. 

### <a id="TestTimeoutHandlerEmptyResponse" href="#TestTimeoutHandlerEmptyResponse">func TestTimeoutHandlerEmptyResponse(t *testing.T)</a>

```
searchKey: http_test.TestTimeoutHandlerEmptyResponse
tags: [private]
```

```Go
func TestTimeoutHandlerEmptyResponse(t *testing.T)
```

[https://golang.org/issue/15948](https://golang.org/issue/15948) 

### <a id="TestTimeoutHandlerPanicRecovery" href="#TestTimeoutHandlerPanicRecovery">func TestTimeoutHandlerPanicRecovery(t *testing.T)</a>

```
searchKey: http_test.TestTimeoutHandlerPanicRecovery
tags: [private]
```

```Go
func TestTimeoutHandlerPanicRecovery(t *testing.T)
```

[https://golang.org/issues/22084](https://golang.org/issues/22084) 

### <a id="TestRedirectBadPath" href="#TestRedirectBadPath">func TestRedirectBadPath(t *testing.T)</a>

```
searchKey: http_test.TestRedirectBadPath
tags: [private]
```

```Go
func TestRedirectBadPath(t *testing.T)
```

### <a id="TestRedirect" href="#TestRedirect">func TestRedirect(t *testing.T)</a>

```
searchKey: http_test.TestRedirect
tags: [private]
```

```Go
func TestRedirect(t *testing.T)
```

Test different URL formats and schemes 

### <a id="TestRedirectContentTypeAndBody" href="#TestRedirectContentTypeAndBody">func TestRedirectContentTypeAndBody(t *testing.T)</a>

```
searchKey: http_test.TestRedirectContentTypeAndBody
tags: [private]
```

```Go
func TestRedirectContentTypeAndBody(t *testing.T)
```

Test that Redirect sets Content-Type header for GET and HEAD requests and writes a short HTML body, unless the request already has a Content-Type header. 

### <a id="TestZeroLengthPostAndResponse_h1" href="#TestZeroLengthPostAndResponse_h1">func TestZeroLengthPostAndResponse_h1(t *testing.T)</a>

```
searchKey: http_test.TestZeroLengthPostAndResponse_h1
tags: [private]
```

```Go
func TestZeroLengthPostAndResponse_h1(t *testing.T)
```

TestZeroLengthPostAndResponse exercises an optimization done by the Transport: when there is no body (either because the method doesn't permit a body, or an explicit Content-Length of zero is present), then the transport can re-use the connection immediately. But when it re-uses the connection, it typically closes the previous request's body, which is not optimal for zero-lengthed bodies, as the client would then see http.ErrBodyReadAfterClose and not 0, io.EOF. 

### <a id="TestZeroLengthPostAndResponse_h2" href="#TestZeroLengthPostAndResponse_h2">func TestZeroLengthPostAndResponse_h2(t *testing.T)</a>

```
searchKey: http_test.TestZeroLengthPostAndResponse_h2
tags: [private]
```

```Go
func TestZeroLengthPostAndResponse_h2(t *testing.T)
```

### <a id="testZeroLengthPostAndResponse" href="#testZeroLengthPostAndResponse">func testZeroLengthPostAndResponse(t *testing.T, h2 bool)</a>

```
searchKey: http_test.testZeroLengthPostAndResponse
tags: [private]
```

```Go
func testZeroLengthPostAndResponse(t *testing.T, h2 bool)
```

### <a id="TestHandlerPanicNil_h1" href="#TestHandlerPanicNil_h1">func TestHandlerPanicNil_h1(t *testing.T)</a>

```
searchKey: http_test.TestHandlerPanicNil_h1
tags: [private]
```

```Go
func TestHandlerPanicNil_h1(t *testing.T)
```

### <a id="TestHandlerPanicNil_h2" href="#TestHandlerPanicNil_h2">func TestHandlerPanicNil_h2(t *testing.T)</a>

```
searchKey: http_test.TestHandlerPanicNil_h2
tags: [private]
```

```Go
func TestHandlerPanicNil_h2(t *testing.T)
```

### <a id="TestHandlerPanic_h1" href="#TestHandlerPanic_h1">func TestHandlerPanic_h1(t *testing.T)</a>

```
searchKey: http_test.TestHandlerPanic_h1
tags: [private]
```

```Go
func TestHandlerPanic_h1(t *testing.T)
```

### <a id="TestHandlerPanic_h2" href="#TestHandlerPanic_h2">func TestHandlerPanic_h2(t *testing.T)</a>

```
searchKey: http_test.TestHandlerPanic_h2
tags: [private]
```

```Go
func TestHandlerPanic_h2(t *testing.T)
```

### <a id="TestHandlerPanicWithHijack" href="#TestHandlerPanicWithHijack">func TestHandlerPanicWithHijack(t *testing.T)</a>

```
searchKey: http_test.TestHandlerPanicWithHijack
tags: [private]
```

```Go
func TestHandlerPanicWithHijack(t *testing.T)
```

### <a id="testHandlerPanic" href="#testHandlerPanic">func testHandlerPanic(t *testing.T, withHijack, h2 bool, wrapper func(Handler) Handler, panicValue interface{})</a>

```
searchKey: http_test.testHandlerPanic
tags: [private]
```

```Go
func testHandlerPanic(t *testing.T, withHijack, h2 bool, wrapper func(Handler) Handler, panicValue interface{})
```

### <a id="TestServerWriteHijackZeroBytes" href="#TestServerWriteHijackZeroBytes">func TestServerWriteHijackZeroBytes(t *testing.T)</a>

```
searchKey: http_test.TestServerWriteHijackZeroBytes
tags: [private]
```

```Go
func TestServerWriteHijackZeroBytes(t *testing.T)
```

Issue 16456: allow writing 0 bytes on hijacked conn to test hijack without any log spam. 

### <a id="TestServerNoDate_h1" href="#TestServerNoDate_h1">func TestServerNoDate_h1(t *testing.T)</a>

```
searchKey: http_test.TestServerNoDate_h1
tags: [private]
```

```Go
func TestServerNoDate_h1(t *testing.T)
```

### <a id="TestServerNoDate_h2" href="#TestServerNoDate_h2">func TestServerNoDate_h2(t *testing.T)</a>

```
searchKey: http_test.TestServerNoDate_h2
tags: [private]
```

```Go
func TestServerNoDate_h2(t *testing.T)
```

### <a id="TestServerNoContentType_h1" href="#TestServerNoContentType_h1">func TestServerNoContentType_h1(t *testing.T)</a>

```
searchKey: http_test.TestServerNoContentType_h1
tags: [private]
```

```Go
func TestServerNoContentType_h1(t *testing.T)
```

### <a id="TestServerNoContentType_h2" href="#TestServerNoContentType_h2">func TestServerNoContentType_h2(t *testing.T)</a>

```
searchKey: http_test.TestServerNoContentType_h2
tags: [private]
```

```Go
func TestServerNoContentType_h2(t *testing.T)
```

### <a id="testServerNoHeader" href="#testServerNoHeader">func testServerNoHeader(t *testing.T, h2 bool, header string)</a>

```
searchKey: http_test.testServerNoHeader
tags: [private]
```

```Go
func testServerNoHeader(t *testing.T, h2 bool, header string)
```

### <a id="TestStripPrefix" href="#TestStripPrefix">func TestStripPrefix(t *testing.T)</a>

```
searchKey: http_test.TestStripPrefix
tags: [private]
```

```Go
func TestStripPrefix(t *testing.T)
```

### <a id="TestStripPrefixNotModifyRequest" href="#TestStripPrefixNotModifyRequest">func TestStripPrefixNotModifyRequest(t *testing.T)</a>

```
searchKey: http_test.TestStripPrefixNotModifyRequest
tags: [private]
```

```Go
func TestStripPrefixNotModifyRequest(t *testing.T)
```

[https://golang.org/issue/18952](https://golang.org/issue/18952). 

### <a id="TestRequestLimit_h1" href="#TestRequestLimit_h1">func TestRequestLimit_h1(t *testing.T)</a>

```
searchKey: http_test.TestRequestLimit_h1
tags: [private]
```

```Go
func TestRequestLimit_h1(t *testing.T)
```

### <a id="TestRequestLimit_h2" href="#TestRequestLimit_h2">func TestRequestLimit_h2(t *testing.T)</a>

```
searchKey: http_test.TestRequestLimit_h2
tags: [private]
```

```Go
func TestRequestLimit_h2(t *testing.T)
```

### <a id="testRequestLimit" href="#testRequestLimit">func testRequestLimit(t *testing.T, h2 bool)</a>

```
searchKey: http_test.testRequestLimit
tags: [private]
```

```Go
func testRequestLimit(t *testing.T, h2 bool)
```

### <a id="TestRequestBodyLimit_h1" href="#TestRequestBodyLimit_h1">func TestRequestBodyLimit_h1(t *testing.T)</a>

```
searchKey: http_test.TestRequestBodyLimit_h1
tags: [private]
```

```Go
func TestRequestBodyLimit_h1(t *testing.T)
```

### <a id="TestRequestBodyLimit_h2" href="#TestRequestBodyLimit_h2">func TestRequestBodyLimit_h2(t *testing.T)</a>

```
searchKey: http_test.TestRequestBodyLimit_h2
tags: [private]
```

```Go
func TestRequestBodyLimit_h2(t *testing.T)
```

### <a id="testRequestBodyLimit" href="#testRequestBodyLimit">func testRequestBodyLimit(t *testing.T, h2 bool)</a>

```
searchKey: http_test.testRequestBodyLimit
tags: [private]
```

```Go
func testRequestBodyLimit(t *testing.T, h2 bool)
```

### <a id="TestClientWriteShutdown" href="#TestClientWriteShutdown">func TestClientWriteShutdown(t *testing.T)</a>

```
searchKey: http_test.TestClientWriteShutdown
tags: [private]
```

```Go
func TestClientWriteShutdown(t *testing.T)
```

TestClientWriteShutdown tests that if the client shuts down the write side of their TCP connection, the server doesn't send a 400 Bad Request. 

### <a id="TestServerBufferedChunking" href="#TestServerBufferedChunking">func TestServerBufferedChunking(t *testing.T)</a>

```
searchKey: http_test.TestServerBufferedChunking
tags: [private]
```

```Go
func TestServerBufferedChunking(t *testing.T)
```

Tests that chunked server responses that write 1 byte at a time are buffered before chunk headers are added, not after chunk headers. 

### <a id="TestServerGracefulClose" href="#TestServerGracefulClose">func TestServerGracefulClose(t *testing.T)</a>

```
searchKey: http_test.TestServerGracefulClose
tags: [private]
```

```Go
func TestServerGracefulClose(t *testing.T)
```

Tests that the server flushes its response headers out when it's ignoring the response body and waits a bit before forcefully closing the TCP connection, causing the client to get a RST. See [https://golang.org/issue/3595](https://golang.org/issue/3595) 

### <a id="TestCaseSensitiveMethod_h1" href="#TestCaseSensitiveMethod_h1">func TestCaseSensitiveMethod_h1(t *testing.T)</a>

```
searchKey: http_test.TestCaseSensitiveMethod_h1
tags: [private]
```

```Go
func TestCaseSensitiveMethod_h1(t *testing.T)
```

### <a id="TestCaseSensitiveMethod_h2" href="#TestCaseSensitiveMethod_h2">func TestCaseSensitiveMethod_h2(t *testing.T)</a>

```
searchKey: http_test.TestCaseSensitiveMethod_h2
tags: [private]
```

```Go
func TestCaseSensitiveMethod_h2(t *testing.T)
```

### <a id="testCaseSensitiveMethod" href="#testCaseSensitiveMethod">func testCaseSensitiveMethod(t *testing.T, h2 bool)</a>

```
searchKey: http_test.testCaseSensitiveMethod
tags: [private]
```

```Go
func testCaseSensitiveMethod(t *testing.T, h2 bool)
```

### <a id="TestContentLengthZero" href="#TestContentLengthZero">func TestContentLengthZero(t *testing.T)</a>

```
searchKey: http_test.TestContentLengthZero
tags: [private]
```

```Go
func TestContentLengthZero(t *testing.T)
```

TestContentLengthZero tests that for both an HTTP/1.0 and HTTP/1.1 request (both keep-alive), when a Handler never writes any response, the net/http package adds a "Content-Length: 0" response header. 

### <a id="TestCloseNotifier" href="#TestCloseNotifier">func TestCloseNotifier(t *testing.T)</a>

```
searchKey: http_test.TestCloseNotifier
tags: [private]
```

```Go
func TestCloseNotifier(t *testing.T)
```

### <a id="TestCloseNotifierPipelined" href="#TestCloseNotifierPipelined">func TestCloseNotifierPipelined(t *testing.T)</a>

```
searchKey: http_test.TestCloseNotifierPipelined
tags: [private]
```

```Go
func TestCloseNotifierPipelined(t *testing.T)
```

Tests that a pipelined request does not cause the first request's Handler's CloseNotify channel to fire. 

Issue 13165 (where it used to deadlock), but behavior changed in Issue 23921. 

### <a id="TestCloseNotifierChanLeak" href="#TestCloseNotifierChanLeak">func TestCloseNotifierChanLeak(t *testing.T)</a>

```
searchKey: http_test.TestCloseNotifierChanLeak
tags: [private]
```

```Go
func TestCloseNotifierChanLeak(t *testing.T)
```

### <a id="TestHijackAfterCloseNotifier" href="#TestHijackAfterCloseNotifier">func TestHijackAfterCloseNotifier(t *testing.T)</a>

```
searchKey: http_test.TestHijackAfterCloseNotifier
tags: [private]
```

```Go
func TestHijackAfterCloseNotifier(t *testing.T)
```

Tests that we can use CloseNotifier in one request, and later call Hijack on a second request on the same connection. 

It also tests that the connReader stitches together its background 1-byte read for CloseNotifier when CloseNotifier doesn't fire with the rest of the second HTTP later. 

Issue 9763. HTTP/1-only test. (http2 doesn't have Hijack) 

### <a id="TestHijackBeforeRequestBodyRead" href="#TestHijackBeforeRequestBodyRead">func TestHijackBeforeRequestBodyRead(t *testing.T)</a>

```
searchKey: http_test.TestHijackBeforeRequestBodyRead
tags: [private]
```

```Go
func TestHijackBeforeRequestBodyRead(t *testing.T)
```

### <a id="TestOptions" href="#TestOptions">func TestOptions(t *testing.T)</a>

```
searchKey: http_test.TestOptions
tags: [private]
```

```Go
func TestOptions(t *testing.T)
```

### <a id="TestHeaderToWire" href="#TestHeaderToWire">func TestHeaderToWire(t *testing.T)</a>

```
searchKey: http_test.TestHeaderToWire
tags: [private]
```

```Go
func TestHeaderToWire(t *testing.T)
```

Tests regarding the ordering of Write, WriteHeader, Header, and Flush calls. In Go 1.0, rw.WriteHeader immediately flushed the (*response).header to the wire. In Go 1.1, the actual wire flush is delayed, so we could maybe tack on a Content-Length and better Content-Type after we see more (or all) of the output. To preserve compatibility with Go 1, we need to be careful to track which headers were live at the time of WriteHeader, so we write the same ones, even if the handler modifies them (~erroneously) after the first Write. 

### <a id="TestAcceptMaxFds" href="#TestAcceptMaxFds">func TestAcceptMaxFds(t *testing.T)</a>

```
searchKey: http_test.TestAcceptMaxFds
tags: [private]
```

```Go
func TestAcceptMaxFds(t *testing.T)
```

### <a id="TestWriteAfterHijack" href="#TestWriteAfterHijack">func TestWriteAfterHijack(t *testing.T)</a>

```
searchKey: http_test.TestWriteAfterHijack
tags: [private]
```

```Go
func TestWriteAfterHijack(t *testing.T)
```

### <a id="TestDoubleHijack" href="#TestDoubleHijack">func TestDoubleHijack(t *testing.T)</a>

```
searchKey: http_test.TestDoubleHijack
tags: [private]
```

```Go
func TestDoubleHijack(t *testing.T)
```

### <a id="TestHTTP10ConnectionHeader" href="#TestHTTP10ConnectionHeader">func TestHTTP10ConnectionHeader(t *testing.T)</a>

```
searchKey: http_test.TestHTTP10ConnectionHeader
tags: [private]
```

```Go
func TestHTTP10ConnectionHeader(t *testing.T)
```

[https://golang.org/issue/5955](https://golang.org/issue/5955) Note that this does not test the "request too large" exit path from the http server. This is intentional; not sending Connection: close is just a minor wire optimization and is pointless if dealing with a badly behaved client. 

### <a id="TestServerReaderFromOrder_h1" href="#TestServerReaderFromOrder_h1">func TestServerReaderFromOrder_h1(t *testing.T)</a>

```
searchKey: http_test.TestServerReaderFromOrder_h1
tags: [private]
```

```Go
func TestServerReaderFromOrder_h1(t *testing.T)
```

See golang.org/issue/5660 

### <a id="TestServerReaderFromOrder_h2" href="#TestServerReaderFromOrder_h2">func TestServerReaderFromOrder_h2(t *testing.T)</a>

```
searchKey: http_test.TestServerReaderFromOrder_h2
tags: [private]
```

```Go
func TestServerReaderFromOrder_h2(t *testing.T)
```

### <a id="testServerReaderFromOrder" href="#testServerReaderFromOrder">func testServerReaderFromOrder(t *testing.T, h2 bool)</a>

```
searchKey: http_test.testServerReaderFromOrder
tags: [private]
```

```Go
func testServerReaderFromOrder(t *testing.T, h2 bool)
```

### <a id="TestCodesPreventingContentTypeAndBody" href="#TestCodesPreventingContentTypeAndBody">func TestCodesPreventingContentTypeAndBody(t *testing.T)</a>

```
searchKey: http_test.TestCodesPreventingContentTypeAndBody
tags: [private]
```

```Go
func TestCodesPreventingContentTypeAndBody(t *testing.T)
```

Issue 6157, Issue 6685 

### <a id="TestContentTypeOkayOn204" href="#TestContentTypeOkayOn204">func TestContentTypeOkayOn204(t *testing.T)</a>

```
searchKey: http_test.TestContentTypeOkayOn204
tags: [private]
```

```Go
func TestContentTypeOkayOn204(t *testing.T)
```

### <a id="TestTransportAndServerSharedBodyRace_h1" href="#TestTransportAndServerSharedBodyRace_h1">func TestTransportAndServerSharedBodyRace_h1(t *testing.T)</a>

```
searchKey: http_test.TestTransportAndServerSharedBodyRace_h1
tags: [private]
```

```Go
func TestTransportAndServerSharedBodyRace_h1(t *testing.T)
```

Issue 6995 A server Handler can receive a Request, and then turn around and give a copy of that Request.Body out to the Transport (e.g. any proxy).  So then two people own that Request.Body (both the server and the http client), and both think they can close it on failure. Therefore, all incoming server requests Bodies need to be thread-safe. 

### <a id="TestTransportAndServerSharedBodyRace_h2" href="#TestTransportAndServerSharedBodyRace_h2">func TestTransportAndServerSharedBodyRace_h2(t *testing.T)</a>

```
searchKey: http_test.TestTransportAndServerSharedBodyRace_h2
tags: [private]
```

```Go
func TestTransportAndServerSharedBodyRace_h2(t *testing.T)
```

### <a id="testTransportAndServerSharedBodyRace" href="#testTransportAndServerSharedBodyRace">func testTransportAndServerSharedBodyRace(t *testing.T, h2 bool)</a>

```
searchKey: http_test.testTransportAndServerSharedBodyRace
tags: [private]
```

```Go
func testTransportAndServerSharedBodyRace(t *testing.T, h2 bool)
```

### <a id="TestRequestBodyCloseDoesntBlock" href="#TestRequestBodyCloseDoesntBlock">func TestRequestBodyCloseDoesntBlock(t *testing.T)</a>

```
searchKey: http_test.TestRequestBodyCloseDoesntBlock
tags: [private]
```

```Go
func TestRequestBodyCloseDoesntBlock(t *testing.T)
```

Test that a hanging Request.Body.Read from another goroutine can't cause the Handler goroutine's Request.Body.Close to block. See issue 7121. 

### <a id="TestResponseWriterWriteString" href="#TestResponseWriterWriteString">func TestResponseWriterWriteString(t *testing.T)</a>

```
searchKey: http_test.TestResponseWriterWriteString
tags: [private]
```

```Go
func TestResponseWriterWriteString(t *testing.T)
```

test that ResponseWriter implements io.StringWriter. 

### <a id="TestAppendTime" href="#TestAppendTime">func TestAppendTime(t *testing.T)</a>

```
searchKey: http_test.TestAppendTime
tags: [private]
```

```Go
func TestAppendTime(t *testing.T)
```

### <a id="TestServerConnState" href="#TestServerConnState">func TestServerConnState(t *testing.T)</a>

```
searchKey: http_test.TestServerConnState
tags: [private]
```

```Go
func TestServerConnState(t *testing.T)
```

### <a id="TestServerKeepAlivesEnabled" href="#TestServerKeepAlivesEnabled">func TestServerKeepAlivesEnabled(t *testing.T)</a>

```
searchKey: http_test.TestServerKeepAlivesEnabled
tags: [private]
```

```Go
func TestServerKeepAlivesEnabled(t *testing.T)
```

### <a id="TestServerEmptyBodyRace_h1" href="#TestServerEmptyBodyRace_h1">func TestServerEmptyBodyRace_h1(t *testing.T)</a>

```
searchKey: http_test.TestServerEmptyBodyRace_h1
tags: [private]
```

```Go
func TestServerEmptyBodyRace_h1(t *testing.T)
```

golang.org/issue/7856 

### <a id="TestServerEmptyBodyRace_h2" href="#TestServerEmptyBodyRace_h2">func TestServerEmptyBodyRace_h2(t *testing.T)</a>

```
searchKey: http_test.TestServerEmptyBodyRace_h2
tags: [private]
```

```Go
func TestServerEmptyBodyRace_h2(t *testing.T)
```

### <a id="testServerEmptyBodyRace" href="#testServerEmptyBodyRace">func testServerEmptyBodyRace(t *testing.T, h2 bool)</a>

```
searchKey: http_test.testServerEmptyBodyRace
tags: [private]
```

```Go
func testServerEmptyBodyRace(t *testing.T, h2 bool)
```

### <a id="TestServerConnStateNew" href="#TestServerConnStateNew">func TestServerConnStateNew(t *testing.T)</a>

```
searchKey: http_test.TestServerConnStateNew
tags: [private]
```

```Go
func TestServerConnStateNew(t *testing.T)
```

### <a id="TestCloseWrite" href="#TestCloseWrite">func TestCloseWrite(t *testing.T)</a>

```
searchKey: http_test.TestCloseWrite
tags: [private]
```

```Go
func TestCloseWrite(t *testing.T)
```

### <a id="TestServerFlushAndHijack" href="#TestServerFlushAndHijack">func TestServerFlushAndHijack(t *testing.T)</a>

```
searchKey: http_test.TestServerFlushAndHijack
tags: [private]
```

```Go
func TestServerFlushAndHijack(t *testing.T)
```

This verifies that a handler can Flush and then Hijack. 

A similar test crashed once during development, but it was only testing this tangentially and temporarily until another TODO was fixed. 

So add an explicit test for this. 

### <a id="TestServerKeepAliveAfterWriteError" href="#TestServerKeepAliveAfterWriteError">func TestServerKeepAliveAfterWriteError(t *testing.T)</a>

```
searchKey: http_test.TestServerKeepAliveAfterWriteError
tags: [private]
```

```Go
func TestServerKeepAliveAfterWriteError(t *testing.T)
```

golang.org/issue/8534 -- the Server shouldn't reuse a connection for keep-alive after it's seen any Write error (e.g. a timeout) on that net.Conn. 

To test, verify we don't timeout or see fewer unique client addresses (== unique connections) than requests. 

### <a id="TestNoContentLengthIfTransferEncoding" href="#TestNoContentLengthIfTransferEncoding">func TestNoContentLengthIfTransferEncoding(t *testing.T)</a>

```
searchKey: http_test.TestNoContentLengthIfTransferEncoding
tags: [private]
```

```Go
func TestNoContentLengthIfTransferEncoding(t *testing.T)
```

Issue 9987: shouldn't add automatic Content-Length (or Content-Type) if a Transfer-Encoding was set by the handler. 

### <a id="TestTolerateCRLFBeforeRequestLine" href="#TestTolerateCRLFBeforeRequestLine">func TestTolerateCRLFBeforeRequestLine(t *testing.T)</a>

```
searchKey: http_test.TestTolerateCRLFBeforeRequestLine
tags: [private]
```

```Go
func TestTolerateCRLFBeforeRequestLine(t *testing.T)
```

tolerate extra CRLF(s) before Request-Line on subsequent requests on a conn Issue 10876. 

### <a id="TestIssue13893_Expect100" href="#TestIssue13893_Expect100">func TestIssue13893_Expect100(t *testing.T)</a>

```
searchKey: http_test.TestIssue13893_Expect100
tags: [private]
```

```Go
func TestIssue13893_Expect100(t *testing.T)
```

### <a id="TestIssue11549_Expect100" href="#TestIssue11549_Expect100">func TestIssue11549_Expect100(t *testing.T)</a>

```
searchKey: http_test.TestIssue11549_Expect100
tags: [private]
```

```Go
func TestIssue11549_Expect100(t *testing.T)
```

### <a id="TestHandlerFinishSkipBigContentLengthRead" href="#TestHandlerFinishSkipBigContentLengthRead">func TestHandlerFinishSkipBigContentLengthRead(t *testing.T)</a>

```
searchKey: http_test.TestHandlerFinishSkipBigContentLengthRead
tags: [private]
```

```Go
func TestHandlerFinishSkipBigContentLengthRead(t *testing.T)
```

If a Handler finishes and there's an unread request body, verify the server try to do implicit read on it before replying. 

### <a id="TestHandlerSetsBodyNil_h1" href="#TestHandlerSetsBodyNil_h1">func TestHandlerSetsBodyNil_h1(t *testing.T)</a>

```
searchKey: http_test.TestHandlerSetsBodyNil_h1
tags: [private]
```

```Go
func TestHandlerSetsBodyNil_h1(t *testing.T)
```

### <a id="TestHandlerSetsBodyNil_h2" href="#TestHandlerSetsBodyNil_h2">func TestHandlerSetsBodyNil_h2(t *testing.T)</a>

```
searchKey: http_test.TestHandlerSetsBodyNil_h2
tags: [private]
```

```Go
func TestHandlerSetsBodyNil_h2(t *testing.T)
```

### <a id="testHandlerSetsBodyNil" href="#testHandlerSetsBodyNil">func testHandlerSetsBodyNil(t *testing.T, h2 bool)</a>

```
searchKey: http_test.testHandlerSetsBodyNil
tags: [private]
```

```Go
func testHandlerSetsBodyNil(t *testing.T, h2 bool)
```

### <a id="TestServerValidatesHostHeader" href="#TestServerValidatesHostHeader">func TestServerValidatesHostHeader(t *testing.T)</a>

```
searchKey: http_test.TestServerValidatesHostHeader
tags: [private]
```

```Go
func TestServerValidatesHostHeader(t *testing.T)
```

Test that we validate the Host header. Issue 11206 (invalid bytes in Host) and 13624 (Host present in HTTP/1.1) 

### <a id="TestServerHandlersCanHandleH2PRI" href="#TestServerHandlersCanHandleH2PRI">func TestServerHandlersCanHandleH2PRI(t *testing.T)</a>

```
searchKey: http_test.TestServerHandlersCanHandleH2PRI
tags: [private]
```

```Go
func TestServerHandlersCanHandleH2PRI(t *testing.T)
```

### <a id="TestServerValidatesHeaders" href="#TestServerValidatesHeaders">func TestServerValidatesHeaders(t *testing.T)</a>

```
searchKey: http_test.TestServerValidatesHeaders
tags: [private]
```

```Go
func TestServerValidatesHeaders(t *testing.T)
```

Test that we validate the valid bytes in HTTP/1 headers. Issue 11207. 

### <a id="TestServerRequestContextCancel_ServeHTTPDone_h1" href="#TestServerRequestContextCancel_ServeHTTPDone_h1">func TestServerRequestContextCancel_ServeHTTPDone_h1(t *testing.T)</a>

```
searchKey: http_test.TestServerRequestContextCancel_ServeHTTPDone_h1
tags: [private]
```

```Go
func TestServerRequestContextCancel_ServeHTTPDone_h1(t *testing.T)
```

### <a id="TestServerRequestContextCancel_ServeHTTPDone_h2" href="#TestServerRequestContextCancel_ServeHTTPDone_h2">func TestServerRequestContextCancel_ServeHTTPDone_h2(t *testing.T)</a>

```
searchKey: http_test.TestServerRequestContextCancel_ServeHTTPDone_h2
tags: [private]
```

```Go
func TestServerRequestContextCancel_ServeHTTPDone_h2(t *testing.T)
```

### <a id="testServerRequestContextCancel_ServeHTTPDone" href="#testServerRequestContextCancel_ServeHTTPDone">func testServerRequestContextCancel_ServeHTTPDone(t *testing.T, h2 bool)</a>

```
searchKey: http_test.testServerRequestContextCancel_ServeHTTPDone
tags: [private]
```

```Go
func testServerRequestContextCancel_ServeHTTPDone(t *testing.T, h2 bool)
```

### <a id="TestServerRequestContextCancel_ConnClose" href="#TestServerRequestContextCancel_ConnClose">func TestServerRequestContextCancel_ConnClose(t *testing.T)</a>

```
searchKey: http_test.TestServerRequestContextCancel_ConnClose
tags: [private]
```

```Go
func TestServerRequestContextCancel_ConnClose(t *testing.T)
```

Tests that the Request.Context available to the Handler is canceled if the peer closes their TCP connection. This requires that the server is always blocked in a Read call so it notices the EOF from the client. See issues 15927 and 15224. 

### <a id="TestServerContext_ServerContextKey_h1" href="#TestServerContext_ServerContextKey_h1">func TestServerContext_ServerContextKey_h1(t *testing.T)</a>

```
searchKey: http_test.TestServerContext_ServerContextKey_h1
tags: [private]
```

```Go
func TestServerContext_ServerContextKey_h1(t *testing.T)
```

### <a id="TestServerContext_ServerContextKey_h2" href="#TestServerContext_ServerContextKey_h2">func TestServerContext_ServerContextKey_h2(t *testing.T)</a>

```
searchKey: http_test.TestServerContext_ServerContextKey_h2
tags: [private]
```

```Go
func TestServerContext_ServerContextKey_h2(t *testing.T)
```

### <a id="testServerContext_ServerContextKey" href="#testServerContext_ServerContextKey">func testServerContext_ServerContextKey(t *testing.T, h2 bool)</a>

```
searchKey: http_test.testServerContext_ServerContextKey
tags: [private]
```

```Go
func testServerContext_ServerContextKey(t *testing.T, h2 bool)
```

### <a id="TestServerContext_LocalAddrContextKey_h1" href="#TestServerContext_LocalAddrContextKey_h1">func TestServerContext_LocalAddrContextKey_h1(t *testing.T)</a>

```
searchKey: http_test.TestServerContext_LocalAddrContextKey_h1
tags: [private]
```

```Go
func TestServerContext_LocalAddrContextKey_h1(t *testing.T)
```

### <a id="TestServerContext_LocalAddrContextKey_h2" href="#TestServerContext_LocalAddrContextKey_h2">func TestServerContext_LocalAddrContextKey_h2(t *testing.T)</a>

```
searchKey: http_test.TestServerContext_LocalAddrContextKey_h2
tags: [private]
```

```Go
func TestServerContext_LocalAddrContextKey_h2(t *testing.T)
```

### <a id="testServerContext_LocalAddrContextKey" href="#testServerContext_LocalAddrContextKey">func testServerContext_LocalAddrContextKey(t *testing.T, h2 bool)</a>

```
searchKey: http_test.testServerContext_LocalAddrContextKey
tags: [private]
```

```Go
func testServerContext_LocalAddrContextKey(t *testing.T, h2 bool)
```

### <a id="TestHandlerSetTransferEncodingChunked" href="#TestHandlerSetTransferEncodingChunked">func TestHandlerSetTransferEncodingChunked(t *testing.T)</a>

```
searchKey: http_test.TestHandlerSetTransferEncodingChunked
tags: [private]
```

```Go
func TestHandlerSetTransferEncodingChunked(t *testing.T)
```

[https://golang.org/issue/15960](https://golang.org/issue/15960) 

### <a id="TestHandlerSetTransferEncodingGzip" href="#TestHandlerSetTransferEncodingGzip">func TestHandlerSetTransferEncodingGzip(t *testing.T)</a>

```
searchKey: http_test.TestHandlerSetTransferEncodingGzip
tags: [private]
```

```Go
func TestHandlerSetTransferEncodingGzip(t *testing.T)
```

[https://golang.org/issue/16063](https://golang.org/issue/16063) 

### <a id="BenchmarkClientServer" href="#BenchmarkClientServer">func BenchmarkClientServer(b *testing.B)</a>

```
searchKey: http_test.BenchmarkClientServer
tags: [private]
```

```Go
func BenchmarkClientServer(b *testing.B)
```

### <a id="BenchmarkClientServerParallel4" href="#BenchmarkClientServerParallel4">func BenchmarkClientServerParallel4(b *testing.B)</a>

```
searchKey: http_test.BenchmarkClientServerParallel4
tags: [private]
```

```Go
func BenchmarkClientServerParallel4(b *testing.B)
```

### <a id="BenchmarkClientServerParallel64" href="#BenchmarkClientServerParallel64">func BenchmarkClientServerParallel64(b *testing.B)</a>

```
searchKey: http_test.BenchmarkClientServerParallel64
tags: [private]
```

```Go
func BenchmarkClientServerParallel64(b *testing.B)
```

### <a id="BenchmarkClientServerParallelTLS4" href="#BenchmarkClientServerParallelTLS4">func BenchmarkClientServerParallelTLS4(b *testing.B)</a>

```
searchKey: http_test.BenchmarkClientServerParallelTLS4
tags: [private]
```

```Go
func BenchmarkClientServerParallelTLS4(b *testing.B)
```

### <a id="BenchmarkClientServerParallelTLS64" href="#BenchmarkClientServerParallelTLS64">func BenchmarkClientServerParallelTLS64(b *testing.B)</a>

```
searchKey: http_test.BenchmarkClientServerParallelTLS64
tags: [private]
```

```Go
func BenchmarkClientServerParallelTLS64(b *testing.B)
```

### <a id="benchmarkClientServerParallel" href="#benchmarkClientServerParallel">func benchmarkClientServerParallel(b *testing.B, parallelism int, useTLS bool)</a>

```
searchKey: http_test.benchmarkClientServerParallel
tags: [private]
```

```Go
func benchmarkClientServerParallel(b *testing.B, parallelism int, useTLS bool)
```

### <a id="BenchmarkServer" href="#BenchmarkServer">func BenchmarkServer(b *testing.B)</a>

```
searchKey: http_test.BenchmarkServer
tags: [private]
```

```Go
func BenchmarkServer(b *testing.B)
```

A benchmark for profiling the server without the HTTP client code. The client code runs in a subprocess. 

For use like: 

```
$ go test -c
$ ./http.test -test.run=XX -test.bench=BenchmarkServer -test.benchtime=15s -test.cpuprofile=http.prof
$ go tool pprof http.test http.prof
(pprof) web

```
### <a id="getNoBody" href="#getNoBody">func getNoBody(urlStr string) (*Response, error)</a>

```
searchKey: http_test.getNoBody
tags: [private]
```

```Go
func getNoBody(urlStr string) (*Response, error)
```

getNoBody wraps Get but closes any Response.Body before returning the response. 

### <a id="BenchmarkClient" href="#BenchmarkClient">func BenchmarkClient(b *testing.B)</a>

```
searchKey: http_test.BenchmarkClient
tags: [private]
```

```Go
func BenchmarkClient(b *testing.B)
```

A benchmark for profiling the client without the HTTP server code. The server code runs in a subprocess. 

### <a id="BenchmarkServerFakeConnNoKeepAlive" href="#BenchmarkServerFakeConnNoKeepAlive">func BenchmarkServerFakeConnNoKeepAlive(b *testing.B)</a>

```
searchKey: http_test.BenchmarkServerFakeConnNoKeepAlive
tags: [private]
```

```Go
func BenchmarkServerFakeConnNoKeepAlive(b *testing.B)
```

### <a id="BenchmarkServerFakeConnWithKeepAlive" href="#BenchmarkServerFakeConnWithKeepAlive">func BenchmarkServerFakeConnWithKeepAlive(b *testing.B)</a>

```
searchKey: http_test.BenchmarkServerFakeConnWithKeepAlive
tags: [private]
```

```Go
func BenchmarkServerFakeConnWithKeepAlive(b *testing.B)
```

### <a id="BenchmarkServerFakeConnWithKeepAliveLite" href="#BenchmarkServerFakeConnWithKeepAliveLite">func BenchmarkServerFakeConnWithKeepAliveLite(b *testing.B)</a>

```
searchKey: http_test.BenchmarkServerFakeConnWithKeepAliveLite
tags: [private]
```

```Go
func BenchmarkServerFakeConnWithKeepAliveLite(b *testing.B)
```

same as above, but representing the most simple possible request and handler. Notably: the handler does not call rw.Header(). 

### <a id="BenchmarkServerHandlerTypeLen" href="#BenchmarkServerHandlerTypeLen">func BenchmarkServerHandlerTypeLen(b *testing.B)</a>

```
searchKey: http_test.BenchmarkServerHandlerTypeLen
tags: [private]
```

```Go
func BenchmarkServerHandlerTypeLen(b *testing.B)
```

Both Content-Type and Content-Length set. Should be no buffering. 

### <a id="BenchmarkServerHandlerNoLen" href="#BenchmarkServerHandlerNoLen">func BenchmarkServerHandlerNoLen(b *testing.B)</a>

```
searchKey: http_test.BenchmarkServerHandlerNoLen
tags: [private]
```

```Go
func BenchmarkServerHandlerNoLen(b *testing.B)
```

A Content-Type is set, but no length. No sniffing, but will count the Content-Length. 

### <a id="BenchmarkServerHandlerNoType" href="#BenchmarkServerHandlerNoType">func BenchmarkServerHandlerNoType(b *testing.B)</a>

```
searchKey: http_test.BenchmarkServerHandlerNoType
tags: [private]
```

```Go
func BenchmarkServerHandlerNoType(b *testing.B)
```

A Content-Length is set, but the Content-Type will be sniffed. 

### <a id="BenchmarkServerHandlerNoHeader" href="#BenchmarkServerHandlerNoHeader">func BenchmarkServerHandlerNoHeader(b *testing.B)</a>

```
searchKey: http_test.BenchmarkServerHandlerNoHeader
tags: [private]
```

```Go
func BenchmarkServerHandlerNoHeader(b *testing.B)
```

Neither a Content-Type or Content-Length, so sniffed and counted. 

### <a id="benchmarkHandler" href="#benchmarkHandler">func benchmarkHandler(b *testing.B, h Handler)</a>

```
searchKey: http_test.benchmarkHandler
tags: [private]
```

```Go
func benchmarkHandler(b *testing.B, h Handler)
```

### <a id="BenchmarkServerHijack" href="#BenchmarkServerHijack">func BenchmarkServerHijack(b *testing.B)</a>

```
searchKey: http_test.BenchmarkServerHijack
tags: [private]
```

```Go
func BenchmarkServerHijack(b *testing.B)
```

### <a id="BenchmarkCloseNotifier" href="#BenchmarkCloseNotifier">func BenchmarkCloseNotifier(b *testing.B)</a>

```
searchKey: http_test.BenchmarkCloseNotifier
tags: [private]
```

```Go
func BenchmarkCloseNotifier(b *testing.B)
```

### <a id="TestConcurrentServerServe" href="#TestConcurrentServerServe">func TestConcurrentServerServe(t *testing.T)</a>

```
searchKey: http_test.TestConcurrentServerServe
tags: [private]
```

```Go
func TestConcurrentServerServe(t *testing.T)
```

Verify this doesn't race (Issue 16505) 

### <a id="TestServerIdleTimeout" href="#TestServerIdleTimeout">func TestServerIdleTimeout(t *testing.T)</a>

```
searchKey: http_test.TestServerIdleTimeout
tags: [private]
```

```Go
func TestServerIdleTimeout(t *testing.T)
```

### <a id="get" href="#get">func get(t *testing.T, c *Client, url string) string</a>

```
searchKey: http_test.get
tags: [private]
```

```Go
func get(t *testing.T, c *Client, url string) string
```

### <a id="TestServerSetKeepAlivesEnabledClosesConns" href="#TestServerSetKeepAlivesEnabledClosesConns">func TestServerSetKeepAlivesEnabledClosesConns(t *testing.T)</a>

```
searchKey: http_test.TestServerSetKeepAlivesEnabledClosesConns
tags: [private]
```

```Go
func TestServerSetKeepAlivesEnabledClosesConns(t *testing.T)
```

Tests that calls to Server.SetKeepAlivesEnabled(false) closes any currently-open connections. 

### <a id="TestServerShutdown_h1" href="#TestServerShutdown_h1">func TestServerShutdown_h1(t *testing.T)</a>

```
searchKey: http_test.TestServerShutdown_h1
tags: [private]
```

```Go
func TestServerShutdown_h1(t *testing.T)
```

### <a id="TestServerShutdown_h2" href="#TestServerShutdown_h2">func TestServerShutdown_h2(t *testing.T)</a>

```
searchKey: http_test.TestServerShutdown_h2
tags: [private]
```

```Go
func TestServerShutdown_h2(t *testing.T)
```

### <a id="testServerShutdown" href="#testServerShutdown">func testServerShutdown(t *testing.T, h2 bool)</a>

```
searchKey: http_test.testServerShutdown
tags: [private]
```

```Go
func testServerShutdown(t *testing.T, h2 bool)
```

### <a id="TestServerShutdownStateNew" href="#TestServerShutdownStateNew">func TestServerShutdownStateNew(t *testing.T)</a>

```
searchKey: http_test.TestServerShutdownStateNew
tags: [private]
```

```Go
func TestServerShutdownStateNew(t *testing.T)
```

### <a id="TestServerCloseDeadlock" href="#TestServerCloseDeadlock">func TestServerCloseDeadlock(t *testing.T)</a>

```
searchKey: http_test.TestServerCloseDeadlock
tags: [private]
```

```Go
func TestServerCloseDeadlock(t *testing.T)
```

Issue 17878: tests that we can call Close twice. 

### <a id="TestServerKeepAlivesEnabled_h1" href="#TestServerKeepAlivesEnabled_h1">func TestServerKeepAlivesEnabled_h1(t *testing.T)</a>

```
searchKey: http_test.TestServerKeepAlivesEnabled_h1
tags: [private]
```

```Go
func TestServerKeepAlivesEnabled_h1(t *testing.T)
```

Issue 17717: tests that Server.SetKeepAlivesEnabled is respected by both HTTP/1 and HTTP/2. 

### <a id="TestServerKeepAlivesEnabled_h2" href="#TestServerKeepAlivesEnabled_h2">func TestServerKeepAlivesEnabled_h2(t *testing.T)</a>

```
searchKey: http_test.TestServerKeepAlivesEnabled_h2
tags: [private]
```

```Go
func TestServerKeepAlivesEnabled_h2(t *testing.T)
```

### <a id="testServerKeepAlivesEnabled" href="#testServerKeepAlivesEnabled">func testServerKeepAlivesEnabled(t *testing.T, h2 bool)</a>

```
searchKey: http_test.testServerKeepAlivesEnabled
tags: [private]
```

```Go
func testServerKeepAlivesEnabled(t *testing.T, h2 bool)
```

### <a id="TestServerCancelsReadTimeoutWhenIdle" href="#TestServerCancelsReadTimeoutWhenIdle">func TestServerCancelsReadTimeoutWhenIdle(t *testing.T)</a>

```
searchKey: http_test.TestServerCancelsReadTimeoutWhenIdle
tags: [private]
```

```Go
func TestServerCancelsReadTimeoutWhenIdle(t *testing.T)
```

Issue 18447: test that the Server's ReadTimeout is stopped while the server's doing its 1-byte background read between requests, waiting for the connection to maybe close. 

### <a id="runTimeSensitiveTest" href="#runTimeSensitiveTest">func runTimeSensitiveTest(t *testing.T, durations []time.Duration, test func(t *testing.T, d time.Duration) error)</a>

```
searchKey: http_test.runTimeSensitiveTest
tags: [private]
```

```Go
func runTimeSensitiveTest(t *testing.T, durations []time.Duration, test func(t *testing.T, d time.Duration) error)
```

runTimeSensitiveTest runs test with the provided durations until one passes. If they all fail, t.Fatal is called with the last one's duration and error value. 

### <a id="TestServerDuplicateBackgroundRead" href="#TestServerDuplicateBackgroundRead">func TestServerDuplicateBackgroundRead(t *testing.T)</a>

```
searchKey: http_test.TestServerDuplicateBackgroundRead
tags: [private]
```

```Go
func TestServerDuplicateBackgroundRead(t *testing.T)
```

Issue 18535: test that the Server doesn't try to do a background read if it's already done one. 

### <a id="TestServerHijackGetsBackgroundByte" href="#TestServerHijackGetsBackgroundByte">func TestServerHijackGetsBackgroundByte(t *testing.T)</a>

```
searchKey: http_test.TestServerHijackGetsBackgroundByte
tags: [private]
```

```Go
func TestServerHijackGetsBackgroundByte(t *testing.T)
```

Test that the bufio.Reader returned by Hijack includes any buffered byte (from the Server's backgroundRead) in its buffer. We want the Handler code to be able to tell that a byte is available via bufio.Reader.Buffered(), without resorting to Reading it (potentially blocking) to get at it. 

### <a id="TestServerHijackGetsBackgroundByte_big" href="#TestServerHijackGetsBackgroundByte_big">func TestServerHijackGetsBackgroundByte_big(t *testing.T)</a>

```
searchKey: http_test.TestServerHijackGetsBackgroundByte_big
tags: [private]
```

```Go
func TestServerHijackGetsBackgroundByte_big(t *testing.T)
```

Like TestServerHijackGetsBackgroundByte above but sending a immediate 1MB of data to the server to fill up the server's 4KB buffer. 

### <a id="TestServerValidatesMethod" href="#TestServerValidatesMethod">func TestServerValidatesMethod(t *testing.T)</a>

```
searchKey: http_test.TestServerValidatesMethod
tags: [private]
```

```Go
func TestServerValidatesMethod(t *testing.T)
```

Issue 18319: test that the Server validates the request method. 

### <a id="TestServerListenNotComparableListener" href="#TestServerListenNotComparableListener">func TestServerListenNotComparableListener(t *testing.T)</a>

```
searchKey: http_test.TestServerListenNotComparableListener
tags: [private]
```

```Go
func TestServerListenNotComparableListener(t *testing.T)
```

Issue 24812: don't crash on non-comparable Listener 

### <a id="TestServerCloseListenerOnce" href="#TestServerCloseListenerOnce">func TestServerCloseListenerOnce(t *testing.T)</a>

```
searchKey: http_test.TestServerCloseListenerOnce
tags: [private]
```

```Go
func TestServerCloseListenerOnce(t *testing.T)
```

Issue 24803: don't call Listener.Close on Server.Shutdown. 

### <a id="TestServerShutdownThenServe" href="#TestServerShutdownThenServe">func TestServerShutdownThenServe(t *testing.T)</a>

```
searchKey: http_test.TestServerShutdownThenServe
tags: [private]
```

```Go
func TestServerShutdownThenServe(t *testing.T)
```

Issue 20239: don't block in Serve if Shutdown is called first. 

### <a id="TestStripPortFromHost" href="#TestStripPortFromHost">func TestStripPortFromHost(t *testing.T)</a>

```
searchKey: http_test.TestStripPortFromHost
tags: [private]
```

```Go
func TestStripPortFromHost(t *testing.T)
```

Issue 23351: document and test behavior of ServeMux with ports 

### <a id="TestServerContexts" href="#TestServerContexts">func TestServerContexts(t *testing.T)</a>

```
searchKey: http_test.TestServerContexts
tags: [private]
```

```Go
func TestServerContexts(t *testing.T)
```

### <a id="TestServerContextsHTTP2" href="#TestServerContextsHTTP2">func TestServerContextsHTTP2(t *testing.T)</a>

```
searchKey: http_test.TestServerContextsHTTP2
tags: [private]
```

```Go
func TestServerContextsHTTP2(t *testing.T)
```

### <a id="TestConnContextNotModifyingAllContexts" href="#TestConnContextNotModifyingAllContexts">func TestConnContextNotModifyingAllContexts(t *testing.T)</a>

```
searchKey: http_test.TestConnContextNotModifyingAllContexts
tags: [private]
```

```Go
func TestConnContextNotModifyingAllContexts(t *testing.T)
```

Issue 35750: check ConnContext not modifying context for other connections 

### <a id="TestUnsupportedTransferEncodingsReturn501" href="#TestUnsupportedTransferEncodingsReturn501">func TestUnsupportedTransferEncodingsReturn501(t *testing.T)</a>

```
searchKey: http_test.TestUnsupportedTransferEncodingsReturn501
tags: [private]
```

```Go
func TestUnsupportedTransferEncodingsReturn501(t *testing.T)
```

Issue 30710: ensure that as per the spec, a server responds with 501 Not Implemented for unsupported transfer-encodings. 

### <a id="TestContentEncodingNoSniffing_h1" href="#TestContentEncodingNoSniffing_h1">func TestContentEncodingNoSniffing_h1(t *testing.T)</a>

```
searchKey: http_test.TestContentEncodingNoSniffing_h1
tags: [private]
```

```Go
func TestContentEncodingNoSniffing_h1(t *testing.T)
```

### <a id="TestContentEncodingNoSniffing_h2" href="#TestContentEncodingNoSniffing_h2">func TestContentEncodingNoSniffing_h2(t *testing.T)</a>

```
searchKey: http_test.TestContentEncodingNoSniffing_h2
tags: [private]
```

```Go
func TestContentEncodingNoSniffing_h2(t *testing.T)
```

### <a id="testContentEncodingNoSniffing" href="#testContentEncodingNoSniffing">func testContentEncodingNoSniffing(t *testing.T, h2 bool)</a>

```
searchKey: http_test.testContentEncodingNoSniffing
tags: [private]
```

```Go
func testContentEncodingNoSniffing(t *testing.T, h2 bool)
```

Issue 31753: don't sniff when Content-Encoding is set 

### <a id="TestTimeoutHandlerSuperfluousLogs" href="#TestTimeoutHandlerSuperfluousLogs">func TestTimeoutHandlerSuperfluousLogs(t *testing.T)</a>

```
searchKey: http_test.TestTimeoutHandlerSuperfluousLogs
tags: [private]
```

```Go
func TestTimeoutHandlerSuperfluousLogs(t *testing.T)
```

Issue 30803: ensure that TimeoutHandler logs spurious WriteHeader calls, for consistency with other Handlers. 

### <a id="fetchWireResponse" href="#fetchWireResponse">func fetchWireResponse(host string, http1ReqBody []byte) ([]byte, error)</a>

```
searchKey: http_test.fetchWireResponse
tags: [private]
```

```Go
func fetchWireResponse(host string, http1ReqBody []byte) ([]byte, error)
```

fetchWireResponse is a helper for dialing to host, sending http1ReqBody as the payload and retrieving the response as it was sent on the wire. 

### <a id="BenchmarkResponseStatusLine" href="#BenchmarkResponseStatusLine">func BenchmarkResponseStatusLine(b *testing.B)</a>

```
searchKey: http_test.BenchmarkResponseStatusLine
tags: [private]
```

```Go
func BenchmarkResponseStatusLine(b *testing.B)
```

### <a id="TestDisableKeepAliveUpgrade" href="#TestDisableKeepAliveUpgrade">func TestDisableKeepAliveUpgrade(t *testing.T)</a>

```
searchKey: http_test.TestDisableKeepAliveUpgrade
tags: [private]
```

```Go
func TestDisableKeepAliveUpgrade(t *testing.T)
```

### <a id="TestMuxRedirectRelative" href="#TestMuxRedirectRelative">func TestMuxRedirectRelative(t *testing.T)</a>

```
searchKey: http_test.TestMuxRedirectRelative
tags: [private]
```

```Go
func TestMuxRedirectRelative(t *testing.T)
```

### <a id="TestQuerySemicolon" href="#TestQuerySemicolon">func TestQuerySemicolon(t *testing.T)</a>

```
searchKey: http_test.TestQuerySemicolon
tags: [private]
```

```Go
func TestQuerySemicolon(t *testing.T)
```

TestQuerySemicolon tests the behavior of semicolons in queries. See Issue 25192. 

### <a id="testQuerySemicolon" href="#testQuerySemicolon">func testQuerySemicolon(t *testing.T, query string, wantX string, allowSemicolons, expectWarning bool)</a>

```
searchKey: http_test.testQuerySemicolon
tags: [private]
```

```Go
func testQuerySemicolon(t *testing.T, query string, wantX string, allowSemicolons, expectWarning bool)
```

### <a id="TestDetectContentType" href="#TestDetectContentType">func TestDetectContentType(t *testing.T)</a>

```
searchKey: http_test.TestDetectContentType
tags: [private]
```

```Go
func TestDetectContentType(t *testing.T)
```

### <a id="TestServerContentType_h1" href="#TestServerContentType_h1">func TestServerContentType_h1(t *testing.T)</a>

```
searchKey: http_test.TestServerContentType_h1
tags: [private]
```

```Go
func TestServerContentType_h1(t *testing.T)
```

### <a id="TestServerContentType_h2" href="#TestServerContentType_h2">func TestServerContentType_h2(t *testing.T)</a>

```
searchKey: http_test.TestServerContentType_h2
tags: [private]
```

```Go
func TestServerContentType_h2(t *testing.T)
```

### <a id="testServerContentType" href="#testServerContentType">func testServerContentType(t *testing.T, h2 bool)</a>

```
searchKey: http_test.testServerContentType
tags: [private]
```

```Go
func testServerContentType(t *testing.T, h2 bool)
```

### <a id="TestServerIssue5953_h1" href="#TestServerIssue5953_h1">func TestServerIssue5953_h1(t *testing.T)</a>

```
searchKey: http_test.TestServerIssue5953_h1
tags: [private]
```

```Go
func TestServerIssue5953_h1(t *testing.T)
```

Issue 5953: shouldn't sniff if the handler set a Content-Type header, even if it's the empty string. 

### <a id="TestServerIssue5953_h2" href="#TestServerIssue5953_h2">func TestServerIssue5953_h2(t *testing.T)</a>

```
searchKey: http_test.TestServerIssue5953_h2
tags: [private]
```

```Go
func TestServerIssue5953_h2(t *testing.T)
```

### <a id="testServerIssue5953" href="#testServerIssue5953">func testServerIssue5953(t *testing.T, h2 bool)</a>

```
searchKey: http_test.testServerIssue5953
tags: [private]
```

```Go
func testServerIssue5953(t *testing.T, h2 bool)
```

### <a id="TestContentTypeWithVariousSources_h1" href="#TestContentTypeWithVariousSources_h1">func TestContentTypeWithVariousSources_h1(t *testing.T)</a>

```
searchKey: http_test.TestContentTypeWithVariousSources_h1
tags: [private]
```

```Go
func TestContentTypeWithVariousSources_h1(t *testing.T)
```

### <a id="TestContentTypeWithVariousSources_h2" href="#TestContentTypeWithVariousSources_h2">func TestContentTypeWithVariousSources_h2(t *testing.T)</a>

```
searchKey: http_test.TestContentTypeWithVariousSources_h2
tags: [private]
```

```Go
func TestContentTypeWithVariousSources_h2(t *testing.T)
```

### <a id="testContentTypeWithVariousSources" href="#testContentTypeWithVariousSources">func testContentTypeWithVariousSources(t *testing.T, h2 bool)</a>

```
searchKey: http_test.testContentTypeWithVariousSources
tags: [private]
```

```Go
func testContentTypeWithVariousSources(t *testing.T, h2 bool)
```

### <a id="TestSniffWriteSize_h1" href="#TestSniffWriteSize_h1">func TestSniffWriteSize_h1(t *testing.T)</a>

```
searchKey: http_test.TestSniffWriteSize_h1
tags: [private]
```

```Go
func TestSniffWriteSize_h1(t *testing.T)
```

### <a id="TestSniffWriteSize_h2" href="#TestSniffWriteSize_h2">func TestSniffWriteSize_h2(t *testing.T)</a>

```
searchKey: http_test.TestSniffWriteSize_h2
tags: [private]
```

```Go
func TestSniffWriteSize_h2(t *testing.T)
```

### <a id="testSniffWriteSize" href="#testSniffWriteSize">func testSniffWriteSize(t *testing.T, h2 bool)</a>

```
searchKey: http_test.testSniffWriteSize
tags: [private]
```

```Go
func testSniffWriteSize(t *testing.T, h2 bool)
```

### <a id="TestReuseRequest" href="#TestReuseRequest">func TestReuseRequest(t *testing.T)</a>

```
searchKey: http_test.TestReuseRequest
tags: [private]
```

```Go
func TestReuseRequest(t *testing.T)
```

### <a id="TestTransportKeepAlives" href="#TestTransportKeepAlives">func TestTransportKeepAlives(t *testing.T)</a>

```
searchKey: http_test.TestTransportKeepAlives
tags: [private]
```

```Go
func TestTransportKeepAlives(t *testing.T)
```

Two subsequent requests and verify their response is the same. The response from the server is our own IP:port 

### <a id="TestTransportConnectionCloseOnResponse" href="#TestTransportConnectionCloseOnResponse">func TestTransportConnectionCloseOnResponse(t *testing.T)</a>

```
searchKey: http_test.TestTransportConnectionCloseOnResponse
tags: [private]
```

```Go
func TestTransportConnectionCloseOnResponse(t *testing.T)
```

### <a id="TestTransportConnectionCloseOnRequest" href="#TestTransportConnectionCloseOnRequest">func TestTransportConnectionCloseOnRequest(t *testing.T)</a>

```
searchKey: http_test.TestTransportConnectionCloseOnRequest
tags: [private]
```

```Go
func TestTransportConnectionCloseOnRequest(t *testing.T)
```

### <a id="TestTransportConnectionCloseOnRequestDisableKeepAlive" href="#TestTransportConnectionCloseOnRequestDisableKeepAlive">func TestTransportConnectionCloseOnRequestDisableKeepAlive(t *testing.T)</a>

```
searchKey: http_test.TestTransportConnectionCloseOnRequestDisableKeepAlive
tags: [private]
```

```Go
func TestTransportConnectionCloseOnRequestDisableKeepAlive(t *testing.T)
```

if the Transport's DisableKeepAlives is set, all requests should send Connection: close. HTTP/1-only (Connection: close doesn't exist in h2) 

### <a id="TestTransportRespectRequestWantsClose" href="#TestTransportRespectRequestWantsClose">func TestTransportRespectRequestWantsClose(t *testing.T)</a>

```
searchKey: http_test.TestTransportRespectRequestWantsClose
tags: [private]
```

```Go
func TestTransportRespectRequestWantsClose(t *testing.T)
```

Test that Transport only sends one "Connection: close", regardless of how "close" was indicated. 

### <a id="TestTransportIdleCacheKeys" href="#TestTransportIdleCacheKeys">func TestTransportIdleCacheKeys(t *testing.T)</a>

```
searchKey: http_test.TestTransportIdleCacheKeys
tags: [private]
```

```Go
func TestTransportIdleCacheKeys(t *testing.T)
```

### <a id="TestTransportReadToEndReusesConn" href="#TestTransportReadToEndReusesConn">func TestTransportReadToEndReusesConn(t *testing.T)</a>

```
searchKey: http_test.TestTransportReadToEndReusesConn
tags: [private]
```

```Go
func TestTransportReadToEndReusesConn(t *testing.T)
```

Tests that the HTTP transport re-uses connections when a client reads to the end of a response Body without closing it. 

### <a id="TestTransportMaxPerHostIdleConns" href="#TestTransportMaxPerHostIdleConns">func TestTransportMaxPerHostIdleConns(t *testing.T)</a>

```
searchKey: http_test.TestTransportMaxPerHostIdleConns
tags: [private]
```

```Go
func TestTransportMaxPerHostIdleConns(t *testing.T)
```

### <a id="TestTransportMaxConnsPerHostIncludeDialInProgress" href="#TestTransportMaxConnsPerHostIncludeDialInProgress">func TestTransportMaxConnsPerHostIncludeDialInProgress(t *testing.T)</a>

```
searchKey: http_test.TestTransportMaxConnsPerHostIncludeDialInProgress
tags: [private]
```

```Go
func TestTransportMaxConnsPerHostIncludeDialInProgress(t *testing.T)
```

### <a id="TestTransportMaxConnsPerHost" href="#TestTransportMaxConnsPerHost">func TestTransportMaxConnsPerHost(t *testing.T)</a>

```
searchKey: http_test.TestTransportMaxConnsPerHost
tags: [private]
```

```Go
func TestTransportMaxConnsPerHost(t *testing.T)
```

### <a id="TestTransportRemovesDeadIdleConnections" href="#TestTransportRemovesDeadIdleConnections">func TestTransportRemovesDeadIdleConnections(t *testing.T)</a>

```
searchKey: http_test.TestTransportRemovesDeadIdleConnections
tags: [private]
```

```Go
func TestTransportRemovesDeadIdleConnections(t *testing.T)
```

### <a id="TestTransportServerClosingUnexpectedly" href="#TestTransportServerClosingUnexpectedly">func TestTransportServerClosingUnexpectedly(t *testing.T)</a>

```
searchKey: http_test.TestTransportServerClosingUnexpectedly
tags: [private]
```

```Go
func TestTransportServerClosingUnexpectedly(t *testing.T)
```

Test that the Transport notices when a server hangs up on its unexpectedly (a keep-alive connection is closed). 

### <a id="TestStressSurpriseServerCloses" href="#TestStressSurpriseServerCloses">func TestStressSurpriseServerCloses(t *testing.T)</a>

```
searchKey: http_test.TestStressSurpriseServerCloses
tags: [private]
```

```Go
func TestStressSurpriseServerCloses(t *testing.T)
```

Test for [https://golang.org/issue/2616](https://golang.org/issue/2616) (appropriate issue number) This fails pretty reliably with GOMAXPROCS=100 or something high. 

### <a id="TestTransportHeadResponses" href="#TestTransportHeadResponses">func TestTransportHeadResponses(t *testing.T)</a>

```
searchKey: http_test.TestTransportHeadResponses
tags: [private]
```

```Go
func TestTransportHeadResponses(t *testing.T)
```

TestTransportHeadResponses verifies that we deal with Content-Lengths with no bodies properly 

### <a id="TestTransportHeadChunkedResponse" href="#TestTransportHeadChunkedResponse">func TestTransportHeadChunkedResponse(t *testing.T)</a>

```
searchKey: http_test.TestTransportHeadChunkedResponse
tags: [private]
```

```Go
func TestTransportHeadChunkedResponse(t *testing.T)
```

TestTransportHeadChunkedResponse verifies that we ignore chunked transfer-encoding on responses to HEAD requests. 

### <a id="TestRoundTripGzip" href="#TestRoundTripGzip">func TestRoundTripGzip(t *testing.T)</a>

```
searchKey: http_test.TestRoundTripGzip
tags: [private]
```

```Go
func TestRoundTripGzip(t *testing.T)
```

Test that the modification made to the Request by the RoundTripper is cleaned up 

### <a id="TestTransportGzip" href="#TestTransportGzip">func TestTransportGzip(t *testing.T)</a>

```
searchKey: http_test.TestTransportGzip
tags: [private]
```

```Go
func TestTransportGzip(t *testing.T)
```

### <a id="TestTransportExpect100Continue" href="#TestTransportExpect100Continue">func TestTransportExpect100Continue(t *testing.T)</a>

```
searchKey: http_test.TestTransportExpect100Continue
tags: [private]
```

```Go
func TestTransportExpect100Continue(t *testing.T)
```

If a request has Expect:100-continue header, the request blocks sending body until the first response. Premature consumption of the request body should not be occurred. 

### <a id="TestSOCKS5Proxy" href="#TestSOCKS5Proxy">func TestSOCKS5Proxy(t *testing.T)</a>

```
searchKey: http_test.TestSOCKS5Proxy
tags: [private]
```

```Go
func TestSOCKS5Proxy(t *testing.T)
```

### <a id="TestTransportProxy" href="#TestTransportProxy">func TestTransportProxy(t *testing.T)</a>

```
searchKey: http_test.TestTransportProxy
tags: [private]
```

```Go
func TestTransportProxy(t *testing.T)
```

### <a id="TestTransportProxyHTTPSConnectLeak" href="#TestTransportProxyHTTPSConnectLeak">func TestTransportProxyHTTPSConnectLeak(t *testing.T)</a>

```
searchKey: http_test.TestTransportProxyHTTPSConnectLeak
tags: [private]
```

```Go
func TestTransportProxyHTTPSConnectLeak(t *testing.T)
```

Issue 28012: verify that the Transport closes its TCP connection to http proxies when they're slow to reply to HTTPS CONNECT responses. 

### <a id="TestTransportDialPreservesNetOpProxyError" href="#TestTransportDialPreservesNetOpProxyError">func TestTransportDialPreservesNetOpProxyError(t *testing.T)</a>

```
searchKey: http_test.TestTransportDialPreservesNetOpProxyError
tags: [private]
```

```Go
func TestTransportDialPreservesNetOpProxyError(t *testing.T)
```

Issue 16997: test transport dial preserves typed errors 

### <a id="TestTransportProxyDialDoesNotMutateProxyConnectHeader" href="#TestTransportProxyDialDoesNotMutateProxyConnectHeader">func TestTransportProxyDialDoesNotMutateProxyConnectHeader(t *testing.T)</a>

```
searchKey: http_test.TestTransportProxyDialDoesNotMutateProxyConnectHeader
tags: [private]
```

```Go
func TestTransportProxyDialDoesNotMutateProxyConnectHeader(t *testing.T)
```

Issue 36431: calls to RoundTrip should not mutate t.ProxyConnectHeader. 

(A bug caused dialConn to instead write the per-request Proxy-Authorization header through to the shared Header instance, introducing a data race.) 

### <a id="TestTransportGzipRecursive" href="#TestTransportGzipRecursive">func TestTransportGzipRecursive(t *testing.T)</a>

```
searchKey: http_test.TestTransportGzipRecursive
tags: [private]
```

```Go
func TestTransportGzipRecursive(t *testing.T)
```

TestTransportGzipRecursive sends a gzip quine and checks that the client gets the same value back. This is more cute than anything, but checks that we don't recurse forever, and checks that Content-Encoding is removed. 

### <a id="TestTransportGzipShort" href="#TestTransportGzipShort">func TestTransportGzipShort(t *testing.T)</a>

```
searchKey: http_test.TestTransportGzipShort
tags: [private]
```

```Go
func TestTransportGzipShort(t *testing.T)
```

golang.org/issue/7750: request fails when server replies with a short gzip body 

### <a id="waitNumGoroutine" href="#waitNumGoroutine">func waitNumGoroutine(nmax int) int</a>

```
searchKey: http_test.waitNumGoroutine
tags: [private]
```

```Go
func waitNumGoroutine(nmax int) int
```

Wait until number of goroutines is no greater than nmax, or time out. 

### <a id="TestTransportPersistConnLeak" href="#TestTransportPersistConnLeak">func TestTransportPersistConnLeak(t *testing.T)</a>

```
searchKey: http_test.TestTransportPersistConnLeak
tags: [private]
```

```Go
func TestTransportPersistConnLeak(t *testing.T)
```

tests that persistent goroutine connections shut down when no longer desired. 

### <a id="TestTransportPersistConnLeakShortBody" href="#TestTransportPersistConnLeakShortBody">func TestTransportPersistConnLeakShortBody(t *testing.T)</a>

```
searchKey: http_test.TestTransportPersistConnLeakShortBody
tags: [private]
```

```Go
func TestTransportPersistConnLeakShortBody(t *testing.T)
```

golang.org/issue/4531: Transport leaks goroutines when request.ContentLength is explicitly short 

### <a id="TestTransportPersistConnLeakNeverIdle" href="#TestTransportPersistConnLeakNeverIdle">func TestTransportPersistConnLeakNeverIdle(t *testing.T)</a>

```
searchKey: http_test.TestTransportPersistConnLeakNeverIdle
tags: [private]
```

```Go
func TestTransportPersistConnLeakNeverIdle(t *testing.T)
```

### <a id="TestTransportPersistConnContextLeakMaxConnsPerHost" href="#TestTransportPersistConnContextLeakMaxConnsPerHost">func TestTransportPersistConnContextLeakMaxConnsPerHost(t *testing.T)</a>

```
searchKey: http_test.TestTransportPersistConnContextLeakMaxConnsPerHost
tags: [private]
```

```Go
func TestTransportPersistConnContextLeakMaxConnsPerHost(t *testing.T)
```

### <a id="TestTransportIdleConnCrash" href="#TestTransportIdleConnCrash">func TestTransportIdleConnCrash(t *testing.T)</a>

```
searchKey: http_test.TestTransportIdleConnCrash
tags: [private]
```

```Go
func TestTransportIdleConnCrash(t *testing.T)
```

This used to crash; [https://golang.org/issue/3266](https://golang.org/issue/3266) 

### <a id="TestIssue3644" href="#TestIssue3644">func TestIssue3644(t *testing.T)</a>

```
searchKey: http_test.TestIssue3644
tags: [private]
```

```Go
func TestIssue3644(t *testing.T)
```

Test that the transport doesn't close the TCP connection early, before the response body has been read. This was a regression which sadly lacked a triggering test. The large response body made the old race easier to trigger. 

### <a id="TestIssue3595" href="#TestIssue3595">func TestIssue3595(t *testing.T)</a>

```
searchKey: http_test.TestIssue3595
tags: [private]
```

```Go
func TestIssue3595(t *testing.T)
```

Test that a client receives a server's reply, even if the server doesn't read the entire request body. 

### <a id="TestChunkedNoContent" href="#TestChunkedNoContent">func TestChunkedNoContent(t *testing.T)</a>

```
searchKey: http_test.TestChunkedNoContent
tags: [private]
```

```Go
func TestChunkedNoContent(t *testing.T)
```

From [https://golang.org/issue/4454](https://golang.org/issue/4454) , "client fails to handle requests with no body and chunked encoding" 

### <a id="TestTransportConcurrency" href="#TestTransportConcurrency">func TestTransportConcurrency(t *testing.T)</a>

```
searchKey: http_test.TestTransportConcurrency
tags: [private]
```

```Go
func TestTransportConcurrency(t *testing.T)
```

### <a id="TestIssue4191_InfiniteGetTimeout" href="#TestIssue4191_InfiniteGetTimeout">func TestIssue4191_InfiniteGetTimeout(t *testing.T)</a>

```
searchKey: http_test.TestIssue4191_InfiniteGetTimeout
tags: [private]
```

```Go
func TestIssue4191_InfiniteGetTimeout(t *testing.T)
```

### <a id="TestIssue4191_InfiniteGetToPutTimeout" href="#TestIssue4191_InfiniteGetToPutTimeout">func TestIssue4191_InfiniteGetToPutTimeout(t *testing.T)</a>

```
searchKey: http_test.TestIssue4191_InfiniteGetToPutTimeout
tags: [private]
```

```Go
func TestIssue4191_InfiniteGetToPutTimeout(t *testing.T)
```

### <a id="TestTransportResponseHeaderTimeout" href="#TestTransportResponseHeaderTimeout">func TestTransportResponseHeaderTimeout(t *testing.T)</a>

```
searchKey: http_test.TestTransportResponseHeaderTimeout
tags: [private]
```

```Go
func TestTransportResponseHeaderTimeout(t *testing.T)
```

### <a id="TestTransportCancelRequest" href="#TestTransportCancelRequest">func TestTransportCancelRequest(t *testing.T)</a>

```
searchKey: http_test.TestTransportCancelRequest
tags: [private]
```

```Go
func TestTransportCancelRequest(t *testing.T)
```

### <a id="testTransportCancelRequestInDo" href="#testTransportCancelRequestInDo">func testTransportCancelRequestInDo(t *testing.T, body io.Reader)</a>

```
searchKey: http_test.testTransportCancelRequestInDo
tags: [private]
```

```Go
func testTransportCancelRequestInDo(t *testing.T, body io.Reader)
```

### <a id="TestTransportCancelRequestInDo" href="#TestTransportCancelRequestInDo">func TestTransportCancelRequestInDo(t *testing.T)</a>

```
searchKey: http_test.TestTransportCancelRequestInDo
tags: [private]
```

```Go
func TestTransportCancelRequestInDo(t *testing.T)
```

### <a id="TestTransportCancelRequestWithBodyInDo" href="#TestTransportCancelRequestWithBodyInDo">func TestTransportCancelRequestWithBodyInDo(t *testing.T)</a>

```
searchKey: http_test.TestTransportCancelRequestWithBodyInDo
tags: [private]
```

```Go
func TestTransportCancelRequestWithBodyInDo(t *testing.T)
```

### <a id="TestTransportCancelRequestInDial" href="#TestTransportCancelRequestInDial">func TestTransportCancelRequestInDial(t *testing.T)</a>

```
searchKey: http_test.TestTransportCancelRequestInDial
tags: [private]
```

```Go
func TestTransportCancelRequestInDial(t *testing.T)
```

### <a id="TestCancelRequestWithChannel" href="#TestCancelRequestWithChannel">func TestCancelRequestWithChannel(t *testing.T)</a>

```
searchKey: http_test.TestCancelRequestWithChannel
tags: [private]
```

```Go
func TestCancelRequestWithChannel(t *testing.T)
```

### <a id="TestCancelRequestWithChannelBeforeDo_Cancel" href="#TestCancelRequestWithChannelBeforeDo_Cancel">func TestCancelRequestWithChannelBeforeDo_Cancel(t *testing.T)</a>

```
searchKey: http_test.TestCancelRequestWithChannelBeforeDo_Cancel
tags: [private]
```

```Go
func TestCancelRequestWithChannelBeforeDo_Cancel(t *testing.T)
```

### <a id="TestCancelRequestWithChannelBeforeDo_Context" href="#TestCancelRequestWithChannelBeforeDo_Context">func TestCancelRequestWithChannelBeforeDo_Context(t *testing.T)</a>

```
searchKey: http_test.TestCancelRequestWithChannelBeforeDo_Context
tags: [private]
```

```Go
func TestCancelRequestWithChannelBeforeDo_Context(t *testing.T)
```

### <a id="testCancelRequestWithChannelBeforeDo" href="#testCancelRequestWithChannelBeforeDo">func testCancelRequestWithChannelBeforeDo(t *testing.T, withCtx bool)</a>

```
searchKey: http_test.testCancelRequestWithChannelBeforeDo
tags: [private]
```

```Go
func testCancelRequestWithChannelBeforeDo(t *testing.T, withCtx bool)
```

### <a id="TestTransportCancelBeforeResponseHeaders" href="#TestTransportCancelBeforeResponseHeaders">func TestTransportCancelBeforeResponseHeaders(t *testing.T)</a>

```
searchKey: http_test.TestTransportCancelBeforeResponseHeaders
tags: [private]
```

```Go
func TestTransportCancelBeforeResponseHeaders(t *testing.T)
```

Issue 11020. The returned error message should be errRequestCanceled 

### <a id="TestTransportCloseResponseBody" href="#TestTransportCloseResponseBody">func TestTransportCloseResponseBody(t *testing.T)</a>

```
searchKey: http_test.TestTransportCloseResponseBody
tags: [private]
```

```Go
func TestTransportCloseResponseBody(t *testing.T)
```

golang.org/issue/3672 -- Client can't close HTTP stream Calling Close on a Response.Body used to just read until EOF. Now it actually closes the TCP connection. 

### <a id="TestTransportAltProto" href="#TestTransportAltProto">func TestTransportAltProto(t *testing.T)</a>

```
searchKey: http_test.TestTransportAltProto
tags: [private]
```

```Go
func TestTransportAltProto(t *testing.T)
```

### <a id="TestTransportNoHost" href="#TestTransportNoHost">func TestTransportNoHost(t *testing.T)</a>

```
searchKey: http_test.TestTransportNoHost
tags: [private]
```

```Go
func TestTransportNoHost(t *testing.T)
```

### <a id="TestTransportEmptyMethod" href="#TestTransportEmptyMethod">func TestTransportEmptyMethod(t *testing.T)</a>

```
searchKey: http_test.TestTransportEmptyMethod
tags: [private]
```

```Go
func TestTransportEmptyMethod(t *testing.T)
```

Issue 13311 

### <a id="TestTransportSocketLateBinding" href="#TestTransportSocketLateBinding">func TestTransportSocketLateBinding(t *testing.T)</a>

```
searchKey: http_test.TestTransportSocketLateBinding
tags: [private]
```

```Go
func TestTransportSocketLateBinding(t *testing.T)
```

### <a id="TestTransportReading100Continue" href="#TestTransportReading100Continue">func TestTransportReading100Continue(t *testing.T)</a>

```
searchKey: http_test.TestTransportReading100Continue
tags: [private]
```

```Go
func TestTransportReading100Continue(t *testing.T)
```

Issue 2184 

### <a id="TestTransportIgnore1xxResponses" href="#TestTransportIgnore1xxResponses">func TestTransportIgnore1xxResponses(t *testing.T)</a>

```
searchKey: http_test.TestTransportIgnore1xxResponses
tags: [private]
```

```Go
func TestTransportIgnore1xxResponses(t *testing.T)
```

Issue 17739: the HTTP client must ignore any unknown 1xx informational responses before the actual response. 

### <a id="TestTransportLimits1xxResponses" href="#TestTransportLimits1xxResponses">func TestTransportLimits1xxResponses(t *testing.T)</a>

```
searchKey: http_test.TestTransportLimits1xxResponses
tags: [private]
```

```Go
func TestTransportLimits1xxResponses(t *testing.T)
```

### <a id="TestTransportTreat101Terminal" href="#TestTransportTreat101Terminal">func TestTransportTreat101Terminal(t *testing.T)</a>

```
searchKey: http_test.TestTransportTreat101Terminal
tags: [private]
```

```Go
func TestTransportTreat101Terminal(t *testing.T)
```

Issue 26161: the HTTP client must treat 101 responses as the final response. 

### <a id="testProxyForRequest" href="#testProxyForRequest">func testProxyForRequest(t *testing.T, tt proxyFromEnvTest, proxyForRequest func(req *Request) (*url.URL, error))</a>

```
searchKey: http_test.testProxyForRequest
tags: [private]
```

```Go
func testProxyForRequest(t *testing.T, tt proxyFromEnvTest, proxyForRequest func(req *Request) (*url.URL, error))
```

### <a id="TestProxyFromEnvironment" href="#TestProxyFromEnvironment">func TestProxyFromEnvironment(t *testing.T)</a>

```
searchKey: http_test.TestProxyFromEnvironment
tags: [private]
```

```Go
func TestProxyFromEnvironment(t *testing.T)
```

### <a id="TestProxyFromEnvironmentLowerCase" href="#TestProxyFromEnvironmentLowerCase">func TestProxyFromEnvironmentLowerCase(t *testing.T)</a>

```
searchKey: http_test.TestProxyFromEnvironmentLowerCase
tags: [private]
```

```Go
func TestProxyFromEnvironmentLowerCase(t *testing.T)
```

### <a id="TestIdleConnChannelLeak" href="#TestIdleConnChannelLeak">func TestIdleConnChannelLeak(t *testing.T)</a>

```
searchKey: http_test.TestIdleConnChannelLeak
tags: [private]
```

```Go
func TestIdleConnChannelLeak(t *testing.T)
```

### <a id="TestTransportClosesRequestBody" href="#TestTransportClosesRequestBody">func TestTransportClosesRequestBody(t *testing.T)</a>

```
searchKey: http_test.TestTransportClosesRequestBody
tags: [private]
```

```Go
func TestTransportClosesRequestBody(t *testing.T)
```

Verify the status quo: that the Client.Post function coerces its body into a ReadCloser if it's a Closer, and that the Transport then closes it. 

### <a id="TestTransportTLSHandshakeTimeout" href="#TestTransportTLSHandshakeTimeout">func TestTransportTLSHandshakeTimeout(t *testing.T)</a>

```
searchKey: http_test.TestTransportTLSHandshakeTimeout
tags: [private]
```

```Go
func TestTransportTLSHandshakeTimeout(t *testing.T)
```

### <a id="TestTLSServerClosesConnection" href="#TestTLSServerClosesConnection">func TestTLSServerClosesConnection(t *testing.T)</a>

```
searchKey: http_test.TestTLSServerClosesConnection
tags: [private]
```

```Go
func TestTLSServerClosesConnection(t *testing.T)
```

Trying to repro golang.org/issue/3514 

### <a id="TestTransportNoReuseAfterEarlyResponse" href="#TestTransportNoReuseAfterEarlyResponse">func TestTransportNoReuseAfterEarlyResponse(t *testing.T)</a>

```
searchKey: http_test.TestTransportNoReuseAfterEarlyResponse
tags: [private]
```

```Go
func TestTransportNoReuseAfterEarlyResponse(t *testing.T)
```

Verifies that the Transport doesn't reuse a connection in the case where the server replies before the request has been fully written. We still honor that reply (see TestIssue3595), but don't send future requests on the connection because it's then in a questionable state. golang.org/issue/7569 

### <a id="TestTransportIssue10457" href="#TestTransportIssue10457">func TestTransportIssue10457(t *testing.T)</a>

```
searchKey: http_test.TestTransportIssue10457
tags: [private]
```

```Go
func TestTransportIssue10457(t *testing.T)
```

Tests that we don't leak Transport persistConn.readLoop goroutines when a server hangs up immediately after saying it would keep-alive. 

### <a id="TestRetryRequestsOnError" href="#TestRetryRequestsOnError">func TestRetryRequestsOnError(t *testing.T)</a>

```
searchKey: http_test.TestRetryRequestsOnError
tags: [private]
```

```Go
func TestRetryRequestsOnError(t *testing.T)
```

Issues 4677, 18241, and 17844. If we try to reuse a connection that the server is in the process of closing, we may end up successfully writing out our request (or a portion of our request) only to find a connection error when we try to read from (or finish writing to) the socket. 

NOTE: we resend a request only if: 

```
- we reused a keep-alive connection
- we haven't yet received any header data
- either we wrote no bytes to the server, or the request is idempotent

```
This automatically prevents an infinite resend loop because we'll run out of the cached keep-alive connections eventually. 

### <a id="TestTransportClosesBodyOnError" href="#TestTransportClosesBodyOnError">func TestTransportClosesBodyOnError(t *testing.T)</a>

```
searchKey: http_test.TestTransportClosesBodyOnError
tags: [private]
```

```Go
func TestTransportClosesBodyOnError(t *testing.T)
```

Issue 6981 

### <a id="TestTransportDialTLS" href="#TestTransportDialTLS">func TestTransportDialTLS(t *testing.T)</a>

```
searchKey: http_test.TestTransportDialTLS
tags: [private]
```

```Go
func TestTransportDialTLS(t *testing.T)
```

### <a id="TestTransportDialContext" href="#TestTransportDialContext">func TestTransportDialContext(t *testing.T)</a>

```
searchKey: http_test.TestTransportDialContext
tags: [private]
```

```Go
func TestTransportDialContext(t *testing.T)
```

### <a id="TestTransportDialTLSContext" href="#TestTransportDialTLSContext">func TestTransportDialTLSContext(t *testing.T)</a>

```
searchKey: http_test.TestTransportDialTLSContext
tags: [private]
```

```Go
func TestTransportDialTLSContext(t *testing.T)
```

### <a id="TestRoundTripReturnsProxyError" href="#TestRoundTripReturnsProxyError">func TestRoundTripReturnsProxyError(t *testing.T)</a>

```
searchKey: http_test.TestRoundTripReturnsProxyError
tags: [private]
```

```Go
func TestRoundTripReturnsProxyError(t *testing.T)
```

Test for issue 8755 Ensure that if a proxy returns an error, it is exposed by RoundTrip 

### <a id="TestTransportCloseIdleConnsThenReturn" href="#TestTransportCloseIdleConnsThenReturn">func TestTransportCloseIdleConnsThenReturn(t *testing.T)</a>

```
searchKey: http_test.TestTransportCloseIdleConnsThenReturn
tags: [private]
```

```Go
func TestTransportCloseIdleConnsThenReturn(t *testing.T)
```

tests that putting an idle conn after a call to CloseIdleConns does return it 

### <a id="TestTransportTraceGotConnH2IdleConns" href="#TestTransportTraceGotConnH2IdleConns">func TestTransportTraceGotConnH2IdleConns(t *testing.T)</a>

```
searchKey: http_test.TestTransportTraceGotConnH2IdleConns
tags: [private]
```

```Go
func TestTransportTraceGotConnH2IdleConns(t *testing.T)
```

Test for issue 34282 Ensure that getConn doesn't call the GotConn trace hook on a HTTP/2 idle conn 

### <a id="TestTransportRemovesH2ConnsAfterIdle" href="#TestTransportRemovesH2ConnsAfterIdle">func TestTransportRemovesH2ConnsAfterIdle(t *testing.T)</a>

```
searchKey: http_test.TestTransportRemovesH2ConnsAfterIdle
tags: [private]
```

```Go
func TestTransportRemovesH2ConnsAfterIdle(t *testing.T)
```

### <a id="TestTransportRangeAndGzip" href="#TestTransportRangeAndGzip">func TestTransportRangeAndGzip(t *testing.T)</a>

```
searchKey: http_test.TestTransportRangeAndGzip
tags: [private]
```

```Go
func TestTransportRangeAndGzip(t *testing.T)
```

This tests that a client requesting a content range won't also implicitly ask for gzip support. If they want that, they need to do it on their own. golang.org/issue/8923 

### <a id="TestTransportResponseCancelRace" href="#TestTransportResponseCancelRace">func TestTransportResponseCancelRace(t *testing.T)</a>

```
searchKey: http_test.TestTransportResponseCancelRace
tags: [private]
```

```Go
func TestTransportResponseCancelRace(t *testing.T)
```

Test for issue 10474 

### <a id="TestTransportContentEncodingCaseInsensitive" href="#TestTransportContentEncodingCaseInsensitive">func TestTransportContentEncodingCaseInsensitive(t *testing.T)</a>

```
searchKey: http_test.TestTransportContentEncodingCaseInsensitive
tags: [private]
```

```Go
func TestTransportContentEncodingCaseInsensitive(t *testing.T)
```

Test for issue 19248: Content-Encoding's value is case insensitive. 

### <a id="TestTransportDialCancelRace" href="#TestTransportDialCancelRace">func TestTransportDialCancelRace(t *testing.T)</a>

```
searchKey: http_test.TestTransportDialCancelRace
tags: [private]
```

```Go
func TestTransportDialCancelRace(t *testing.T)
```

### <a id="TestTransportFlushesBodyChunks" href="#TestTransportFlushesBodyChunks">func TestTransportFlushesBodyChunks(t *testing.T)</a>

```
searchKey: http_test.TestTransportFlushesBodyChunks
tags: [private]
```

```Go
func TestTransportFlushesBodyChunks(t *testing.T)
```

Issue 6574 

### <a id="TestTransportFlushesRequestHeader" href="#TestTransportFlushesRequestHeader">func TestTransportFlushesRequestHeader(t *testing.T)</a>

```
searchKey: http_test.TestTransportFlushesRequestHeader
tags: [private]
```

```Go
func TestTransportFlushesRequestHeader(t *testing.T)
```

Issue 22088: flush Transport request headers if we're not sure the body won't block on read. 

### <a id="TestTransportPrefersResponseOverWriteError" href="#TestTransportPrefersResponseOverWriteError">func TestTransportPrefersResponseOverWriteError(t *testing.T)</a>

```
searchKey: http_test.TestTransportPrefersResponseOverWriteError
tags: [private]
```

```Go
func TestTransportPrefersResponseOverWriteError(t *testing.T)
```

Issue 11745. 

### <a id="TestTransportAutomaticHTTP2" href="#TestTransportAutomaticHTTP2">func TestTransportAutomaticHTTP2(t *testing.T)</a>

```
searchKey: http_test.TestTransportAutomaticHTTP2
tags: [private]
```

```Go
func TestTransportAutomaticHTTP2(t *testing.T)
```

### <a id="TestTransportAutomaticHTTP2_DialerAndTLSConfigSupportsHTTP2AndTLSConfig" href="#TestTransportAutomaticHTTP2_DialerAndTLSConfigSupportsHTTP2AndTLSConfig">func TestTransportAutomaticHTTP2_DialerAndTLSConfigSupportsHTTP2AndTLSConfig(t *testing.T)</a>

```
searchKey: http_test.TestTransportAutomaticHTTP2_DialerAndTLSConfigSupportsHTTP2AndTLSConfig
tags: [private]
```

```Go
func TestTransportAutomaticHTTP2_DialerAndTLSConfigSupportsHTTP2AndTLSConfig(t *testing.T)
```

### <a id="TestTransportAutomaticHTTP2_DefaultTransport" href="#TestTransportAutomaticHTTP2_DefaultTransport">func TestTransportAutomaticHTTP2_DefaultTransport(t *testing.T)</a>

```
searchKey: http_test.TestTransportAutomaticHTTP2_DefaultTransport
tags: [private]
```

```Go
func TestTransportAutomaticHTTP2_DefaultTransport(t *testing.T)
```

golang.org/issue/14391: also check DefaultTransport 

### <a id="TestTransportAutomaticHTTP2_TLSNextProto" href="#TestTransportAutomaticHTTP2_TLSNextProto">func TestTransportAutomaticHTTP2_TLSNextProto(t *testing.T)</a>

```
searchKey: http_test.TestTransportAutomaticHTTP2_TLSNextProto
tags: [private]
```

```Go
func TestTransportAutomaticHTTP2_TLSNextProto(t *testing.T)
```

### <a id="TestTransportAutomaticHTTP2_TLSConfig" href="#TestTransportAutomaticHTTP2_TLSConfig">func TestTransportAutomaticHTTP2_TLSConfig(t *testing.T)</a>

```
searchKey: http_test.TestTransportAutomaticHTTP2_TLSConfig
tags: [private]
```

```Go
func TestTransportAutomaticHTTP2_TLSConfig(t *testing.T)
```

### <a id="TestTransportAutomaticHTTP2_ExpectContinueTimeout" href="#TestTransportAutomaticHTTP2_ExpectContinueTimeout">func TestTransportAutomaticHTTP2_ExpectContinueTimeout(t *testing.T)</a>

```
searchKey: http_test.TestTransportAutomaticHTTP2_ExpectContinueTimeout
tags: [private]
```

```Go
func TestTransportAutomaticHTTP2_ExpectContinueTimeout(t *testing.T)
```

### <a id="TestTransportAutomaticHTTP2_Dial" href="#TestTransportAutomaticHTTP2_Dial">func TestTransportAutomaticHTTP2_Dial(t *testing.T)</a>

```
searchKey: http_test.TestTransportAutomaticHTTP2_Dial
tags: [private]
```

```Go
func TestTransportAutomaticHTTP2_Dial(t *testing.T)
```

### <a id="TestTransportAutomaticHTTP2_DialContext" href="#TestTransportAutomaticHTTP2_DialContext">func TestTransportAutomaticHTTP2_DialContext(t *testing.T)</a>

```
searchKey: http_test.TestTransportAutomaticHTTP2_DialContext
tags: [private]
```

```Go
func TestTransportAutomaticHTTP2_DialContext(t *testing.T)
```

### <a id="TestTransportAutomaticHTTP2_DialTLS" href="#TestTransportAutomaticHTTP2_DialTLS">func TestTransportAutomaticHTTP2_DialTLS(t *testing.T)</a>

```
searchKey: http_test.TestTransportAutomaticHTTP2_DialTLS
tags: [private]
```

```Go
func TestTransportAutomaticHTTP2_DialTLS(t *testing.T)
```

### <a id="testTransportAutoHTTP" href="#testTransportAutoHTTP">func testTransportAutoHTTP(t *testing.T, tr *Transport, wantH2 bool)</a>

```
searchKey: http_test.testTransportAutoHTTP
tags: [private]
```

```Go
func testTransportAutoHTTP(t *testing.T, tr *Transport, wantH2 bool)
```

### <a id="TestTransportReuseConnEmptyResponseBody" href="#TestTransportReuseConnEmptyResponseBody">func TestTransportReuseConnEmptyResponseBody(t *testing.T)</a>

```
searchKey: http_test.TestTransportReuseConnEmptyResponseBody
tags: [private]
```

```Go
func TestTransportReuseConnEmptyResponseBody(t *testing.T)
```

Issue 13633: there was a race where we returned bodyless responses to callers before recycling the persistent connection, which meant a client doing two subsequent requests could end up on different connections. It's somewhat harmless but enough tests assume it's not true in order to test other things that it's worth fixing. Plus it's nice to be consistent and not have timing-dependent behavior. 

### <a id="TestNoCrashReturningTransportAltConn" href="#TestNoCrashReturningTransportAltConn">func TestNoCrashReturningTransportAltConn(t *testing.T)</a>

```
searchKey: http_test.TestNoCrashReturningTransportAltConn
tags: [private]
```

```Go
func TestNoCrashReturningTransportAltConn(t *testing.T)
```

Issue 13839 

### <a id="TestTransportReuseConnection_Gzip_Chunked" href="#TestTransportReuseConnection_Gzip_Chunked">func TestTransportReuseConnection_Gzip_Chunked(t *testing.T)</a>

```
searchKey: http_test.TestTransportReuseConnection_Gzip_Chunked
tags: [private]
```

```Go
func TestTransportReuseConnection_Gzip_Chunked(t *testing.T)
```

### <a id="TestTransportReuseConnection_Gzip_ContentLength" href="#TestTransportReuseConnection_Gzip_ContentLength">func TestTransportReuseConnection_Gzip_ContentLength(t *testing.T)</a>

```
searchKey: http_test.TestTransportReuseConnection_Gzip_ContentLength
tags: [private]
```

```Go
func TestTransportReuseConnection_Gzip_ContentLength(t *testing.T)
```

### <a id="testTransportReuseConnection_Gzip" href="#testTransportReuseConnection_Gzip">func testTransportReuseConnection_Gzip(t *testing.T, chunked bool)</a>

```
searchKey: http_test.testTransportReuseConnection_Gzip
tags: [private]
```

```Go
func testTransportReuseConnection_Gzip(t *testing.T, chunked bool)
```

Make sure we re-use underlying TCP connection for gzipped responses too. 

### <a id="TestTransportResponseHeaderLength" href="#TestTransportResponseHeaderLength">func TestTransportResponseHeaderLength(t *testing.T)</a>

```
searchKey: http_test.TestTransportResponseHeaderLength
tags: [private]
```

```Go
func TestTransportResponseHeaderLength(t *testing.T)
```

### <a id="TestTransportEventTrace" href="#TestTransportEventTrace">func TestTransportEventTrace(t *testing.T)</a>

```
searchKey: http_test.TestTransportEventTrace
tags: [private]
```

```Go
func TestTransportEventTrace(t *testing.T)
```

### <a id="TestTransportEventTrace_h2" href="#TestTransportEventTrace_h2">func TestTransportEventTrace_h2(t *testing.T)</a>

```
searchKey: http_test.TestTransportEventTrace_h2
tags: [private]
```

```Go
func TestTransportEventTrace_h2(t *testing.T)
```

### <a id="TestTransportEventTrace_NoHooks" href="#TestTransportEventTrace_NoHooks">func TestTransportEventTrace_NoHooks(t *testing.T)</a>

```
searchKey: http_test.TestTransportEventTrace_NoHooks
tags: [private]
```

```Go
func TestTransportEventTrace_NoHooks(t *testing.T)
```

test a non-nil httptrace.ClientTrace but with all hooks set to zero. 

### <a id="TestTransportEventTrace_NoHooks_h2" href="#TestTransportEventTrace_NoHooks_h2">func TestTransportEventTrace_NoHooks_h2(t *testing.T)</a>

```
searchKey: http_test.TestTransportEventTrace_NoHooks_h2
tags: [private]
```

```Go
func TestTransportEventTrace_NoHooks_h2(t *testing.T)
```

### <a id="testTransportEventTrace" href="#testTransportEventTrace">func testTransportEventTrace(t *testing.T, h2 bool, noHooks bool)</a>

```
searchKey: http_test.testTransportEventTrace
tags: [private]
```

```Go
func testTransportEventTrace(t *testing.T, h2 bool, noHooks bool)
```

### <a id="TestTransportEventTraceTLSVerify" href="#TestTransportEventTraceTLSVerify">func TestTransportEventTraceTLSVerify(t *testing.T)</a>

```
searchKey: http_test.TestTransportEventTraceTLSVerify
tags: [private]
```

```Go
func TestTransportEventTraceTLSVerify(t *testing.T)
```

### <a id="skipIfDNSHijacked" href="#skipIfDNSHijacked">func skipIfDNSHijacked(t *testing.T)</a>

```
searchKey: http_test.skipIfDNSHijacked
tags: [private]
```

```Go
func skipIfDNSHijacked(t *testing.T)
```

### <a id="TestTransportEventTraceRealDNS" href="#TestTransportEventTraceRealDNS">func TestTransportEventTraceRealDNS(t *testing.T)</a>

```
searchKey: http_test.TestTransportEventTraceRealDNS
tags: [private]
```

```Go
func TestTransportEventTraceRealDNS(t *testing.T)
```

### <a id="TestTransportRejectsAlphaPort" href="#TestTransportRejectsAlphaPort">func TestTransportRejectsAlphaPort(t *testing.T)</a>

```
searchKey: http_test.TestTransportRejectsAlphaPort
tags: [private]
```

```Go
func TestTransportRejectsAlphaPort(t *testing.T)
```

Issue 14353: port can only contain digits. 

### <a id="TestTLSHandshakeTrace" href="#TestTLSHandshakeTrace">func TestTLSHandshakeTrace(t *testing.T)</a>

```
searchKey: http_test.TestTLSHandshakeTrace
tags: [private]
```

```Go
func TestTLSHandshakeTrace(t *testing.T)
```

Test the httptrace.TLSHandshake{Start,Done} hooks with a https http1 connections. The http2 test is done in TestTransportEventTrace_h2 

### <a id="TestTransportMaxIdleConns" href="#TestTransportMaxIdleConns">func TestTransportMaxIdleConns(t *testing.T)</a>

```
searchKey: http_test.TestTransportMaxIdleConns
tags: [private]
```

```Go
func TestTransportMaxIdleConns(t *testing.T)
```

### <a id="TestTransportIdleConnTimeout_h1" href="#TestTransportIdleConnTimeout_h1">func TestTransportIdleConnTimeout_h1(t *testing.T)</a>

```
searchKey: http_test.TestTransportIdleConnTimeout_h1
tags: [private]
```

```Go
func TestTransportIdleConnTimeout_h1(t *testing.T)
```

### <a id="TestTransportIdleConnTimeout_h2" href="#TestTransportIdleConnTimeout_h2">func TestTransportIdleConnTimeout_h2(t *testing.T)</a>

```
searchKey: http_test.TestTransportIdleConnTimeout_h2
tags: [private]
```

```Go
func TestTransportIdleConnTimeout_h2(t *testing.T)
```

### <a id="testTransportIdleConnTimeout" href="#testTransportIdleConnTimeout">func testTransportIdleConnTimeout(t *testing.T, h2 bool)</a>

```
searchKey: http_test.testTransportIdleConnTimeout
tags: [private]
```

```Go
func testTransportIdleConnTimeout(t *testing.T, h2 bool)
```

### <a id="TestIdleConnH2Crash" href="#TestIdleConnH2Crash">func TestIdleConnH2Crash(t *testing.T)</a>

```
searchKey: http_test.TestIdleConnH2Crash
tags: [private]
```

```Go
func TestIdleConnH2Crash(t *testing.T)
```

Issue 16208: Go 1.7 crashed after Transport.IdleConnTimeout if an HTTP/2 connection was established but its caller no longer wanted it. (Assuming the connection cache was enabled, which it is by default) 

This test reproduced the crash by setting the IdleConnTimeout low (to make the test reasonable) and then making a request which is canceled by the DialTLS hook, which then also waits to return the real connection until after the RoundTrip saw the error.  Then we know the successful tls.Dial from DialTLS will need to go into the idle pool. Then we give it a of time to explode. 

### <a id="TestTransportReturnsPeekError" href="#TestTransportReturnsPeekError">func TestTransportReturnsPeekError(t *testing.T)</a>

```
searchKey: http_test.TestTransportReturnsPeekError
tags: [private]
```

```Go
func TestTransportReturnsPeekError(t *testing.T)
```

Issue 16465: Transport.RoundTrip should return the raw net.Conn.Read error from Peek back to the caller. 

### <a id="TestTransportIDNA_h1" href="#TestTransportIDNA_h1">func TestTransportIDNA_h1(t *testing.T)</a>

```
searchKey: http_test.TestTransportIDNA_h1
tags: [private]
```

```Go
func TestTransportIDNA_h1(t *testing.T)
```

Issue 13835: international domain names should work 

### <a id="TestTransportIDNA_h2" href="#TestTransportIDNA_h2">func TestTransportIDNA_h2(t *testing.T)</a>

```
searchKey: http_test.TestTransportIDNA_h2
tags: [private]
```

```Go
func TestTransportIDNA_h2(t *testing.T)
```

### <a id="testTransportIDNA" href="#testTransportIDNA">func testTransportIDNA(t *testing.T, h2 bool)</a>

```
searchKey: http_test.testTransportIDNA
tags: [private]
```

```Go
func testTransportIDNA(t *testing.T, h2 bool)
```

### <a id="TestTransportProxyConnectHeader" href="#TestTransportProxyConnectHeader">func TestTransportProxyConnectHeader(t *testing.T)</a>

```
searchKey: http_test.TestTransportProxyConnectHeader
tags: [private]
```

```Go
func TestTransportProxyConnectHeader(t *testing.T)
```

Issue 13290: send User-Agent in proxy CONNECT 

### <a id="TestTransportProxyGetConnectHeader" href="#TestTransportProxyGetConnectHeader">func TestTransportProxyGetConnectHeader(t *testing.T)</a>

```
searchKey: http_test.TestTransportProxyGetConnectHeader
tags: [private]
```

```Go
func TestTransportProxyGetConnectHeader(t *testing.T)
```

### <a id="wantBody" href="#wantBody">func wantBody(res *Response, err error, want string) error</a>

```
searchKey: http_test.wantBody
tags: [private]
```

```Go
func wantBody(res *Response, err error, want string) error
```

### <a id="newLocalListener" href="#newLocalListener">func newLocalListener(t *testing.T) net.Listener</a>

```
searchKey: http_test.newLocalListener
tags: [private]
```

```Go
func newLocalListener(t *testing.T) net.Listener
```

### <a id="TestMissingStatusNoPanic" href="#TestMissingStatusNoPanic">func TestMissingStatusNoPanic(t *testing.T)</a>

```
searchKey: http_test.TestMissingStatusNoPanic
tags: [private]
```

```Go
func TestMissingStatusNoPanic(t *testing.T)
```

Ensure that a missing status doesn't make the server panic See Issue [https://golang.org/issues/21701](https://golang.org/issues/21701) 

### <a id="doFetchCheckPanic" href="#doFetchCheckPanic">func doFetchCheckPanic(tr *Transport, req *Request) (res *Response, err error, panicked bool)</a>

```
searchKey: http_test.doFetchCheckPanic
tags: [private]
```

```Go
func doFetchCheckPanic(tr *Transport, req *Request) (res *Response, err error, panicked bool)
```

### <a id="TestNoBodyOnChunked304Response" href="#TestNoBodyOnChunked304Response">func TestNoBodyOnChunked304Response(t *testing.T)</a>

```
searchKey: http_test.TestNoBodyOnChunked304Response
tags: [private]
```

```Go
func TestNoBodyOnChunked304Response(t *testing.T)
```

Issue 22330: do not allow the response body to be read when the status code forbids a response body. 

### <a id="TestTransportCheckContextDoneEarly" href="#TestTransportCheckContextDoneEarly">func TestTransportCheckContextDoneEarly(t *testing.T)</a>

```
searchKey: http_test.TestTransportCheckContextDoneEarly
tags: [private]
```

```Go
func TestTransportCheckContextDoneEarly(t *testing.T)
```

Issue 25852: Transport should check whether Context is done early. 

### <a id="TestClientTimeoutKillsConn_BeforeHeaders" href="#TestClientTimeoutKillsConn_BeforeHeaders">func TestClientTimeoutKillsConn_BeforeHeaders(t *testing.T)</a>

```
searchKey: http_test.TestClientTimeoutKillsConn_BeforeHeaders
tags: [private]
```

```Go
func TestClientTimeoutKillsConn_BeforeHeaders(t *testing.T)
```

Issue 23399: verify that if a client request times out, the Transport's conn is closed so that it's not reused. 

This is the test variant that times out before the server replies with any response headers. 

### <a id="TestClientTimeoutKillsConn_AfterHeaders" href="#TestClientTimeoutKillsConn_AfterHeaders">func TestClientTimeoutKillsConn_AfterHeaders(t *testing.T)</a>

```
searchKey: http_test.TestClientTimeoutKillsConn_AfterHeaders
tags: [private]
```

```Go
func TestClientTimeoutKillsConn_AfterHeaders(t *testing.T)
```

Issue 23399: verify that if a client request times out, the Transport's conn is closed so that it's not reused. 

This is the test variant that has the server send response headers first, and time out during the write of the response body. 

### <a id="TestTransportResponseBodyWritableOnProtocolSwitch" href="#TestTransportResponseBodyWritableOnProtocolSwitch">func TestTransportResponseBodyWritableOnProtocolSwitch(t *testing.T)</a>

```
searchKey: http_test.TestTransportResponseBodyWritableOnProtocolSwitch
tags: [private]
```

```Go
func TestTransportResponseBodyWritableOnProtocolSwitch(t *testing.T)
```

### <a id="TestTransportCONNECTBidi" href="#TestTransportCONNECTBidi">func TestTransportCONNECTBidi(t *testing.T)</a>

```
searchKey: http_test.TestTransportCONNECTBidi
tags: [private]
```

```Go
func TestTransportCONNECTBidi(t *testing.T)
```

### <a id="TestTransportRequestReplayable" href="#TestTransportRequestReplayable">func TestTransportRequestReplayable(t *testing.T)</a>

```
searchKey: http_test.TestTransportRequestReplayable
tags: [private]
```

```Go
func TestTransportRequestReplayable(t *testing.T)
```

### <a id="TestTransportRequestWriteRoundTrip" href="#TestTransportRequestWriteRoundTrip">func TestTransportRequestWriteRoundTrip(t *testing.T)</a>

```
searchKey: http_test.TestTransportRequestWriteRoundTrip
tags: [private]
```

```Go
func TestTransportRequestWriteRoundTrip(t *testing.T)
```

### <a id="TestTransportClone" href="#TestTransportClone">func TestTransportClone(t *testing.T)</a>

```
searchKey: http_test.TestTransportClone
tags: [private]
```

```Go
func TestTransportClone(t *testing.T)
```

### <a id="TestIs408" href="#TestIs408">func TestIs408(t *testing.T)</a>

```
searchKey: http_test.TestIs408
tags: [private]
```

```Go
func TestIs408(t *testing.T)
```

### <a id="TestTransportIgnores408" href="#TestTransportIgnores408">func TestTransportIgnores408(t *testing.T)</a>

```
searchKey: http_test.TestTransportIgnores408
tags: [private]
```

```Go
func TestTransportIgnores408(t *testing.T)
```

### <a id="TestInvalidHeaderResponse" href="#TestInvalidHeaderResponse">func TestInvalidHeaderResponse(t *testing.T)</a>

```
searchKey: http_test.TestInvalidHeaderResponse
tags: [private]
```

```Go
func TestInvalidHeaderResponse(t *testing.T)
```

### <a id="TestTransportClosesBodyOnInvalidRequests" href="#TestTransportClosesBodyOnInvalidRequests">func TestTransportClosesBodyOnInvalidRequests(t *testing.T)</a>

```
searchKey: http_test.TestTransportClosesBodyOnInvalidRequests
tags: [private]
```

```Go
func TestTransportClosesBodyOnInvalidRequests(t *testing.T)
```

Issue 35015: ensure that Transport closes the body on any error with an invalid request, as promised by Client.Do docs. 

### <a id="TestDontCacheBrokenHTTP2Conn" href="#TestDontCacheBrokenHTTP2Conn">func TestDontCacheBrokenHTTP2Conn(t *testing.T)</a>

```
searchKey: http_test.TestDontCacheBrokenHTTP2Conn
tags: [private]
```

```Go
func TestDontCacheBrokenHTTP2Conn(t *testing.T)
```

Issue 34978: don't cache a broken HTTP/2 connection 

### <a id="TestTransportDecrementConnWhenIdleConnRemoved" href="#TestTransportDecrementConnWhenIdleConnRemoved">func TestTransportDecrementConnWhenIdleConnRemoved(t *testing.T)</a>

```
searchKey: http_test.TestTransportDecrementConnWhenIdleConnRemoved
tags: [private]
```

```Go
func TestTransportDecrementConnWhenIdleConnRemoved(t *testing.T)
```

Issue 34941 When the client has too many concurrent requests on a single connection, http.http2noCachedConnError is reported on multiple requests. There should only be one decrement regardless of the number of failures. 

### <a id="TestAltProtoCancellation" href="#TestAltProtoCancellation">func TestAltProtoCancellation(t *testing.T)</a>

```
searchKey: http_test.TestAltProtoCancellation
tags: [private]
```

```Go
func TestAltProtoCancellation(t *testing.T)
```

Issue 36820 Test that we use the older backward compatible cancellation protocol when a RoundTripper is registered via RegisterProtocol. 

### <a id="TestIssue32441" href="#TestIssue32441">func TestIssue32441(t *testing.T)</a>

```
searchKey: http_test.TestIssue32441
tags: [private]
```

```Go
func TestIssue32441(t *testing.T)
```

Issue 32441: body is not reset after ErrSkipAltProtocol 

### <a id="TestTransportRejectsSignInContentLength" href="#TestTransportRejectsSignInContentLength">func TestTransportRejectsSignInContentLength(t *testing.T)</a>

```
searchKey: http_test.TestTransportRejectsSignInContentLength
tags: [private]
```

```Go
func TestTransportRejectsSignInContentLength(t *testing.T)
```

Issue 39017. Ensure that HTTP/1 transports reject Content-Length headers that contain a sign (eg. "+3"), per RFC 2616, Section 14.13. 

### <a id="testTransportRace" href="#testTransportRace">func testTransportRace(req *Request)</a>

```
searchKey: http_test.testTransportRace
tags: [private]
```

```Go
func testTransportRace(req *Request)
```

### <a id="TestErrorWriteLoopRace" href="#TestErrorWriteLoopRace">func TestErrorWriteLoopRace(t *testing.T)</a>

```
searchKey: http_test.TestErrorWriteLoopRace
tags: [private]
```

```Go
func TestErrorWriteLoopRace(t *testing.T)
```

Issue 37669 Test that a cancellation doesn't result in a data race due to the writeLoop goroutine being left running, if the caller mutates the processed Request upon completion. 

### <a id="TestCancelRequestWhenSharingConnection" href="#TestCancelRequestWhenSharingConnection">func TestCancelRequestWhenSharingConnection(t *testing.T)</a>

```
searchKey: http_test.TestCancelRequestWhenSharingConnection
tags: [private]
```

```Go
func TestCancelRequestWhenSharingConnection(t *testing.T)
```

Issue 41600 Test that a new request which uses the connection of an active request cannot cause it to be canceled as well. 

