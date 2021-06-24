# Package http_test

## Index

* [Constants](#const)
    * [const boundary](#boundary)
    * [const fileaContents](#fileaContents)
    * [const filebContents](#filebContents)
    * [const h1Mode](#h1Mode)
    * [const h2Mode](#h2Mode)
    * [const message](#message)
    * [const noTLS](#noTLS)
    * [const someResponse](#someResponse)
    * [const testFile](#testFile)
    * [const testFileLen](#testFileLen)
    * [const textaValue](#textaValue)
    * [const textbValue](#textbValue)
    * [const withTLS](#withTLS)
* [Variables](#var)
    * [var ServeFileRangeTests](#ServeFileRangeTests)
    * [var echoCookiesRedirectHandler](#echoCookiesRedirectHandler)
    * [var errFakeRoundTrip](#errFakeRoundTrip)
    * [var expectedCookies](#expectedCookies)
    * [var fsRedirectTestData](#fsRedirectTestData)
    * [var getBasicAuthTests](#getBasicAuthTests)
    * [var handlerBodyCloseTests](#handlerBodyCloseTests)
    * [var handlers](#handlers)
    * [var hostPortHandler](#hostPortHandler)
    * [var isDNSHijacked](#isDNSHijacked)
    * [var isDNSHijackedOnce](#isDNSHijackedOnce)
    * [var newRequestHostTests](#newRequestHostTests)
    * [var optQuietLog](#optQuietLog)
    * [var parseBasicAuthTests](#parseBasicAuthTests)
    * [var parseHTTPVersionTests](#parseHTTPVersionTests)
    * [var proxyFromEnvTests](#proxyFromEnvTests)
    * [var quietLog](#quietLog)
    * [var readRequestErrorTests](#readRequestErrorTests)
    * [var response](#response)
    * [var rgz](#rgz)
    * [var robotsTxtHandler](#robotsTxtHandler)
    * [var roundTripTests](#roundTripTests)
    * [var serveMuxRegister](#serveMuxRegister)
    * [var serveMuxTests](#serveMuxTests)
    * [var serveMuxTests2](#serveMuxTests2)
    * [var serverExpectTests](#serverExpectTests)
    * [var sniffTests](#sniffTests)
    * [var testHandlerBodyConsumers](#testHandlerBodyConsumers)
    * [var timeoutProtoErr](#timeoutProtoErr)
    * [var vtests](#vtests)
* [Types](#type)
    * [type RecordingJar struct](#RecordingJar)
        * [func (j *RecordingJar) Cookies(u *url.URL) []*Cookie](#RecordingJar.Cookies)
        * [func (j *RecordingJar) SetCookies(u *url.URL, cookies []*Cookie)](#RecordingJar.SetCookies)
        * [func (j *RecordingJar) logf(format string, args ...interface{})](#RecordingJar.logf)
    * [type TestJar struct](#TestJar)
        * [func (j *TestJar) Cookies(u *url.URL) []*Cookie](#TestJar.Cookies)
        * [func (j *TestJar) SetCookies(u *url.URL, cookies []*Cookie)](#TestJar.SetCookies)
    * [type apiHandler struct{}](#apiHandler)
        * [func (apiHandler) ServeHTTP(http.ResponseWriter, *http.Request)](#apiHandler.ServeHTTP)
    * [type basicAuthCredentialsTest struct](#basicAuthCredentialsTest)
    * [type blockingRemoteAddrConn struct](#blockingRemoteAddrConn)
        * [func (c *blockingRemoteAddrConn) RemoteAddr() net.Addr](#blockingRemoteAddrConn.RemoteAddr)
    * [type blockingRemoteAddrListener struct](#blockingRemoteAddrListener)
        * [func (l *blockingRemoteAddrListener) Accept() (net.Conn, error)](#blockingRemoteAddrListener.Accept)
    * [type bodyCloser bool](#bodyCloser)
        * [func (bc *bodyCloser) Close() error](#bodyCloser.Close)
        * [func (bc *bodyCloser) Read(b []byte) (n int, err error)](#bodyCloser.Read)
    * [type breakableConn struct](#breakableConn)
        * [func (w *breakableConn) Write(b []byte) (n int, err error)](#breakableConn.Write)
    * [type brokenState struct](#brokenState)
    * [type byteAtATimeReader struct](#byteAtATimeReader)
        * [func (b *byteAtATimeReader) Read(p []byte) (n int, err error)](#byteAtATimeReader.Read)
    * [type byteFromChanReader chan byte](#byteFromChanReader)
        * [func (c byteFromChanReader) Read(p []byte) (n int, err error)](#byteFromChanReader.Read)
    * [type chanWriter chan string](#chanWriter)
        * [func (w chanWriter) Write(p []byte) (n int, err error)](#chanWriter.Write)
    * [type clientServerTest struct](#clientServerTest)
        * [func newClientServerTest(t *testing.T, h2 bool, h Handler, opts ...interface{}) *clientServerTest](#newClientServerTest)
        * [func (t *clientServerTest) close()](#clientServerTest.close)
        * [func (t *clientServerTest) getURL(u string) string](#clientServerTest.getURL)
        * [func (t *clientServerTest) scheme() string](#clientServerTest.scheme)
    * [type closeWriteTestConn struct](#closeWriteTestConn)
        * [func (c *closeWriteTestConn) CloseWrite() error](#closeWriteTestConn.CloseWrite)
    * [type closerFunc func() error](#closerFunc)
        * [func (f closerFunc) Close() error](#closerFunc.Close)
    * [type contextCounter struct](#contextCounter)
        * [func (cc *contextCounter) Read() (live int64)](#contextCounter.Read)
        * [func (cc *contextCounter) Track(ctx context.Context) context.Context](#contextCounter.Track)
        * [func (cc *contextCounter) decrement(*countedContext)](#contextCounter.decrement)
    * [type countCloseListener struct](#countCloseListener)
        * [func (p *countCloseListener) Close() error](#countCloseListener.Close)
    * [type countCloseReader struct](#countCloseReader)
        * [func (cr countCloseReader) Close() error](#countCloseReader.Close)
    * [type countHandler struct](#countHandler)
        * [func (h *countHandler) ServeHTTP(w http.ResponseWriter, r *http.Request)](#countHandler.ServeHTTP)
    * [type countReader struct](#countReader)
        * [func (cr countReader) Read(p []byte) (n int, err error)](#countReader.Read)
    * [type countedConn struct](#countedConn)
    * [type countedContext struct](#countedContext)
    * [type countingDialer struct](#countingDialer)
        * [func (d *countingDialer) DialContext(ctx context.Context, network, address string) (net.Conn, error)](#countingDialer.DialContext)
        * [func (d *countingDialer) Read() (total, live int64)](#countingDialer.Read)
        * [func (d *countingDialer) decrement(*countedConn)](#countingDialer.decrement)
    * [type delayedEOFReader struct](#delayedEOFReader)
        * [func (dr delayedEOFReader) Read(p []byte) (n int, err error)](#delayedEOFReader.Read)
    * [type delegateReader struct](#delegateReader)
        * [func (r *delegateReader) Read(p []byte) (int, error)](#delegateReader.Read)
    * [type doneContext struct](#doneContext)
        * [func (doneContext) Done() <-chan struct{}](#doneContext.Done)
        * [func (d doneContext) Err() error](#doneContext.Err)
    * [type dotFileHidingFile struct](#dotFileHidingFile)
        * [func (f dotFileHidingFile) Readdir(n int) (fis []fs.FileInfo, err error)](#dotFileHidingFile.Readdir)
    * [type dotFileHidingFileSystem struct](#dotFileHidingFileSystem)
        * [func (fsys dotFileHidingFileSystem) Open(name string) (http.File, error)](#dotFileHidingFileSystem.Open)
    * [type dummyAddr string](#dummyAddr)
        * [func (a dummyAddr) Network() string](#dummyAddr.Network)
        * [func (a dummyAddr) String() string](#dummyAddr.String)
    * [type dumpConn struct](#dumpConn)
        * [func (c *dumpConn) Close() error](#dumpConn.Close)
        * [func (c *dumpConn) LocalAddr() net.Addr](#dumpConn.LocalAddr)
        * [func (c *dumpConn) RemoteAddr() net.Addr](#dumpConn.RemoteAddr)
        * [func (c *dumpConn) SetDeadline(t time.Time) error](#dumpConn.SetDeadline)
        * [func (c *dumpConn) SetReadDeadline(t time.Time) error](#dumpConn.SetReadDeadline)
        * [func (c *dumpConn) SetWriteDeadline(t time.Time) error](#dumpConn.SetWriteDeadline)
    * [type eofListenerNotComparable []int](#eofListenerNotComparable)
        * [func (eofListenerNotComparable) Accept() (net.Conn, error)](#eofListenerNotComparable.Accept)
        * [func (eofListenerNotComparable) Addr() net.Addr](#eofListenerNotComparable.Addr)
        * [func (eofListenerNotComparable) Close() error](#eofListenerNotComparable.Close)
    * [type eofReaderFunc func()](#eofReaderFunc)
        * [func (f eofReaderFunc) Read(p []byte) (n int, err error)](#eofReaderFunc.Read)
    * [type errorListener struct](#errorListener)
        * [func (l *errorListener) Accept() (c net.Conn, err error)](#errorListener.Accept)
        * [func (l *errorListener) Addr() net.Addr](#errorListener.Addr)
        * [func (l *errorListener) Close() error](#errorListener.Close)
    * [type fakeFS map[string]*http_test.fakeFileInfo](#fakeFS)
        * [func (fsys fakeFS) Open(name string) (File, error)](#fakeFS.Open)
    * [type fakeFile struct](#fakeFile)
        * [func (f *fakeFile) Close() error](#fakeFile.Close)
        * [func (f *fakeFile) Readdir(count int) ([]fs.FileInfo, error)](#fakeFile.Readdir)
        * [func (f *fakeFile) Stat() (fs.FileInfo, error)](#fakeFile.Stat)
    * [type fakeFileInfo struct](#fakeFileInfo)
        * [func (f *fakeFileInfo) IsDir() bool](#fakeFileInfo.IsDir)
        * [func (f *fakeFileInfo) ModTime() time.Time](#fakeFileInfo.ModTime)
        * [func (f *fakeFileInfo) Mode() fs.FileMode](#fakeFileInfo.Mode)
        * [func (f *fakeFileInfo) Name() string](#fakeFileInfo.Name)
        * [func (f *fakeFileInfo) Size() int64](#fakeFileInfo.Size)
        * [func (f *fakeFileInfo) Sys() interface{}](#fakeFileInfo.Sys)
    * [type fileServerCleanPathDir struct](#fileServerCleanPathDir)
        * [func (d fileServerCleanPathDir) Open(path string) (File, error)](#fileServerCleanPathDir.Open)
    * [type fooProto struct{}](#fooProto)
        * [func (fooProto) RoundTrip(req *Request) (*Response, error)](#fooProto.RoundTrip)
    * [type funcConn struct](#funcConn)
        * [func (c funcConn) Close() error](#funcConn.Close)
        * [func (c funcConn) Read(p []byte) (int, error)](#funcConn.Read)
        * [func (c funcConn) Write(p []byte) (int, error)](#funcConn.Write)
    * [type funcRoundTripper func()](#funcRoundTripper)
        * [func (fn funcRoundTripper) RoundTrip(*Request) (*Response, error)](#funcRoundTripper.RoundTrip)
    * [type funcWriter func([]byte) (int, error)](#funcWriter)
        * [func (f funcWriter) Write(p []byte) (int, error)](#funcWriter.Write)
    * [type getBasicAuthTest struct](#getBasicAuthTest)
    * [type h12Compare struct](#h12Compare)
        * [func (tt h12Compare) normalizeRes(t *testing.T, res *Response, wantProto string)](#h12Compare.normalizeRes)
        * [func (tt h12Compare) reqFunc() reqFunc](#h12Compare.reqFunc)
        * [func (tt h12Compare) run(t *testing.T)](#h12Compare.run)
    * [type handlerBodyCloseTest struct](#handlerBodyCloseTest)
        * [func (t handlerBodyCloseTest) connectionHeader() string](#handlerBodyCloseTest.connectionHeader)
    * [type handlerTest struct](#handlerTest)
        * [func newHandlerTest(h Handler) handlerTest](#newHandlerTest)
        * [func (ht *handlerTest) rawResponse(req string) string](#handlerTest.rawResponse)
    * [type http09Writer struct](#http09Writer)
        * [func (w http09Writer) Header() Header](#http09Writer.Header)
        * [func (w http09Writer) WriteHeader(int)](#http09Writer.WriteHeader)
    * [type infiniteReader struct](#infiniteReader)
        * [func (r *infiniteReader) Read(b []byte) (int, error)](#infiniteReader.Read)
    * [type issue12991FS struct{}](#issue12991FS)
        * [func (issue12991FS) Open(string) (File, error)](#issue12991FS.Open)
    * [type issue12991File struct](#issue12991File)
        * [func (issue12991File) Close() error](#issue12991File.Close)
        * [func (issue12991File) Stat() (fs.FileInfo, error)](#issue12991File.Stat)
    * [type issue15577Tripper struct{}](#issue15577Tripper)
        * [func (issue15577Tripper) RoundTrip(*Request) (*Response, error)](#issue15577Tripper.RoundTrip)
    * [type issue18239Body struct](#issue18239Body)
        * [func (b issue18239Body) Close() error](#issue18239Body.Close)
        * [func (b issue18239Body) Read([]byte) (int, error)](#issue18239Body.Read)
    * [type issue40382Body struct](#issue40382Body)
        * [func (b *issue40382Body) Close() error](#issue40382Body.Close)
        * [func (b *issue40382Body) Read(p []byte) (int, error)](#issue40382Body.Read)
    * [type lockedBytesBuffer struct](#lockedBytesBuffer)
        * [func (b *lockedBytesBuffer) Write(p []byte) (int, error)](#lockedBytesBuffer.Write)
    * [type logWrites struct](#logWrites)
        * [func (l logWrites) Write(p []byte) (n int, err error)](#logWrites.Write)
        * [func (l logWrites) WriteByte(c byte) error](#logWrites.WriteByte)
    * [type logWritesConn struct](#logWritesConn)
        * [func (c *logWritesConn) Close() error](#logWritesConn.Close)
        * [func (c *logWritesConn) Read(p []byte) (n int, err error)](#logWritesConn.Read)
        * [func (c *logWritesConn) Write(p []byte) (n int, err error)](#logWritesConn.Write)
    * [type neverEnding byte](#neverEnding)
        * [func (b neverEnding) Read(p []byte) (n int, err error)](#neverEnding.Read)
    * [type nilBodyRoundTripper struct{}](#nilBodyRoundTripper)
        * [func (nilBodyRoundTripper) RoundTrip(req *Request) (*Response, error)](#nilBodyRoundTripper.RoundTrip)
    * [type noopConn struct{}](#noopConn)
        * [func (noopConn) LocalAddr() net.Addr](#noopConn.LocalAddr)
        * [func (noopConn) RemoteAddr() net.Addr](#noopConn.RemoteAddr)
        * [func (noopConn) SetDeadline(t time.Time) error](#noopConn.SetDeadline)
        * [func (noopConn) SetReadDeadline(t time.Time) error](#noopConn.SetReadDeadline)
        * [func (noopConn) SetWriteDeadline(t time.Time) error](#noopConn.SetWriteDeadline)
    * [type noteCloseConn struct](#noteCloseConn)
        * [func (x noteCloseConn) Close() error](#noteCloseConn.Close)
    * [type oneConnListener struct](#oneConnListener)
        * [func (l *oneConnListener) Accept() (c net.Conn, err error)](#oneConnListener.Accept)
        * [func (l *oneConnListener) Addr() net.Addr](#oneConnListener.Addr)
        * [func (l *oneConnListener) Close() error](#oneConnListener.Close)
    * [type panicOnSeek struct](#panicOnSeek)
    * [type proxyFromEnvTest struct](#proxyFromEnvTest)
        * [func (t proxyFromEnvTest) String() string](#proxyFromEnvTest.String)
    * [type recordingTransport struct](#recordingTransport)
        * [func (t *recordingTransport) RoundTrip(req *Request) (resp *Response, err error)](#recordingTransport.RoundTrip)
    * [type redirectTest struct](#redirectTest)
    * [type repeatReader struct](#repeatReader)
        * [func (r *repeatReader) Read(p []byte) (n int, err error)](#repeatReader.Read)
    * [type reqFunc func(c *net/http.Client, url string) (*net/http.Response, error)](#reqFunc)
    * [type responseWriterJustWriter struct](#responseWriterJustWriter)
        * [func (responseWriterJustWriter) Header() Header](#responseWriterJustWriter.Header)
        * [func (responseWriterJustWriter) WriteHeader(int)](#responseWriterJustWriter.WriteHeader)
    * [type roundTripFunc func(r *net/http.Request) (*net/http.Response, error)](#roundTripFunc)
        * [func (f roundTripFunc) RoundTrip(r *Request) (*Response, error)](#roundTripFunc.RoundTrip)
    * [type roundTripperWithCloseIdle func()](#roundTripperWithCloseIdle)
        * [func (f roundTripperWithCloseIdle) CloseIdleConnections()](#roundTripperWithCloseIdle.CloseIdleConnections)
        * [func (roundTripperWithCloseIdle) RoundTrip(*Request) (*Response, error)](#roundTripperWithCloseIdle.RoundTrip)
    * [type roundTripperWithoutCloseIdle struct{}](#roundTripperWithoutCloseIdle)
        * [func (roundTripperWithoutCloseIdle) RoundTrip(*Request) (*Response, error)](#roundTripperWithoutCloseIdle.RoundTrip)
    * [type rwTestConn struct](#rwTestConn)
        * [func (c *rwTestConn) Close() error](#rwTestConn.Close)
    * [type serverExpectTest struct](#serverExpectTest)
        * [func expectTest(contentLength int, expectation string, readBody bool, expectedResponse string) serverExpectTest](#expectTest)
    * [type slowTestConn struct](#slowTestConn)
        * [func (c *slowTestConn) Close() error](#slowTestConn.Close)
        * [func (c *slowTestConn) Read(b []byte) (n int, err error)](#slowTestConn.Read)
        * [func (c *slowTestConn) SetDeadline(t time.Time) error](#slowTestConn.SetDeadline)
        * [func (c *slowTestConn) SetReadDeadline(t time.Time) error](#slowTestConn.SetReadDeadline)
        * [func (c *slowTestConn) SetWriteDeadline(t time.Time) error](#slowTestConn.SetWriteDeadline)
        * [func (c *slowTestConn) Write(b []byte) (int, error)](#slowTestConn.Write)
    * [type slurpResult struct](#slurpResult)
        * [func (sr slurpResult) String() string](#slurpResult.String)
    * [type stringHandler string](#stringHandler)
        * [func (s stringHandler) ServeHTTP(w ResponseWriter, r *Request)](#stringHandler.ServeHTTP)
    * [type terrorWriter struct](#terrorWriter)
        * [func (w terrorWriter) Write(p []byte) (int, error)](#terrorWriter.Write)
    * [type testCloseConn struct](#testCloseConn)
        * [func (c *testCloseConn) Close() error](#testCloseConn.Close)
    * [type testConn struct](#testConn)
        * [func (c *testConn) Close() error](#testConn.Close)
        * [func (c *testConn) Read(b []byte) (int, error)](#testConn.Read)
        * [func (c *testConn) Write(b []byte) (int, error)](#testConn.Write)
    * [type testConnSet struct](#testConnSet)
        * [func makeTestDial(t *testing.T) (*testConnSet, func(n, addr string) (net.Conn, error))](#makeTestDial)
        * [func (tcs *testConnSet) check(t *testing.T)](#testConnSet.check)
        * [func (tcs *testConnSet) insert(c net.Conn)](#testConnSet.insert)
        * [func (tcs *testConnSet) remove(c net.Conn)](#testConnSet.remove)
    * [type testErrorReader struct](#testErrorReader)
        * [func (r testErrorReader) Read(p []byte) (n int, err error)](#testErrorReader.Read)
    * [type testFileSystem struct](#testFileSystem)
        * [func (fs *testFileSystem) Open(name string) (File, error)](#testFileSystem.Open)
    * [type testHandlerBodyConsumer struct](#testHandlerBodyConsumer)
    * [type testMockTCPConn struct](#testMockTCPConn)
        * [func (c *testMockTCPConn) ReadFrom(r io.Reader) (int64, error)](#testMockTCPConn.ReadFrom)
    * [type timeoutProto struct{}](#timeoutProto)
        * [func (timeoutProto) RoundTrip(req *Request) (*Response, error)](#timeoutProto.RoundTrip)
    * [type trackLastConnListener struct](#trackLastConnListener)
        * [func (l trackLastConnListener) Accept() (c net.Conn, err error)](#trackLastConnListener.Accept)
    * [type wantRange struct](#wantRange)
    * [type writeCountingConn struct](#writeCountingConn)
        * [func (c *writeCountingConn) Write(p []byte) (int, error)](#writeCountingConn.Write)
    * [type writerFuncConn struct](#writerFuncConn)
        * [func (c writerFuncConn) Write(p []byte) (n int, err error)](#writerFuncConn.Write)
* [Functions](#func)
    * [func BenchmarkClient(b *testing.B)](#BenchmarkClient)
    * [func BenchmarkClientServer(b *testing.B)](#BenchmarkClientServer)
    * [func BenchmarkClientServerParallel4(b *testing.B)](#BenchmarkClientServerParallel4)
    * [func BenchmarkClientServerParallel64(b *testing.B)](#BenchmarkClientServerParallel64)
    * [func BenchmarkClientServerParallelTLS4(b *testing.B)](#BenchmarkClientServerParallelTLS4)
    * [func BenchmarkClientServerParallelTLS64(b *testing.B)](#BenchmarkClientServerParallelTLS64)
    * [func BenchmarkCloseNotifier(b *testing.B)](#BenchmarkCloseNotifier)
    * [func BenchmarkFileAndServer_16MB(b *testing.B)](#BenchmarkFileAndServer_16MB)
    * [func BenchmarkFileAndServer_1KB(b *testing.B)](#BenchmarkFileAndServer_1KB)
    * [func BenchmarkFileAndServer_64MB(b *testing.B)](#BenchmarkFileAndServer_64MB)
    * [func BenchmarkReadRequestApachebench(b *testing.B)](#BenchmarkReadRequestApachebench)
    * [func BenchmarkReadRequestChrome(b *testing.B)](#BenchmarkReadRequestChrome)
    * [func BenchmarkReadRequestCurl(b *testing.B)](#BenchmarkReadRequestCurl)
    * [func BenchmarkReadRequestSiege(b *testing.B)](#BenchmarkReadRequestSiege)
    * [func BenchmarkReadRequestWrk(b *testing.B)](#BenchmarkReadRequestWrk)
    * [func BenchmarkResponseStatusLine(b *testing.B)](#BenchmarkResponseStatusLine)
    * [func BenchmarkServeMux(b *testing.B)](#BenchmarkServeMux)
    * [func BenchmarkServeMux_SkipServe(b *testing.B)](#BenchmarkServeMux_SkipServe)
    * [func BenchmarkServer(b *testing.B)](#BenchmarkServer)
    * [func BenchmarkServerFakeConnNoKeepAlive(b *testing.B)](#BenchmarkServerFakeConnNoKeepAlive)
    * [func BenchmarkServerFakeConnWithKeepAlive(b *testing.B)](#BenchmarkServerFakeConnWithKeepAlive)
    * [func BenchmarkServerFakeConnWithKeepAliveLite(b *testing.B)](#BenchmarkServerFakeConnWithKeepAliveLite)
    * [func BenchmarkServerHandlerNoHeader(b *testing.B)](#BenchmarkServerHandlerNoHeader)
    * [func BenchmarkServerHandlerNoLen(b *testing.B)](#BenchmarkServerHandlerNoLen)
    * [func BenchmarkServerHandlerNoType(b *testing.B)](#BenchmarkServerHandlerNoType)
    * [func BenchmarkServerHandlerTypeLen(b *testing.B)](#BenchmarkServerHandlerTypeLen)
    * [func BenchmarkServerHijack(b *testing.B)](#BenchmarkServerHijack)
    * [func ExampleFileServer()](#ExampleFileServer)
    * [func ExampleFileServer_dotFileHiding()](#ExampleFileServer_dotFileHiding)
    * [func ExampleFileServer_stripPrefix()](#ExampleFileServer_stripPrefix)
    * [func ExampleGet()](#ExampleGet)
    * [func ExampleHandle()](#ExampleHandle)
    * [func ExampleHandleFunc()](#ExampleHandleFunc)
    * [func ExampleHijacker()](#ExampleHijacker)
    * [func ExampleListenAndServe()](#ExampleListenAndServe)
    * [func ExampleListenAndServeTLS()](#ExampleListenAndServeTLS)
    * [func ExampleNotFoundHandler()](#ExampleNotFoundHandler)
    * [func ExampleResponseWriter_trailers()](#ExampleResponseWriter_trailers)
    * [func ExampleServeMux_Handle()](#ExampleServeMux_Handle)
    * [func ExampleServer_Shutdown()](#ExampleServer_Shutdown)
    * [func ExampleStripPrefix()](#ExampleStripPrefix)
    * [func Test304Responses_h1(t *testing.T)](#Test304Responses_h1)
    * [func Test304Responses_h2(t *testing.T)](#Test304Responses_h2)
    * [func TestAcceptMaxFds(t *testing.T)](#TestAcceptMaxFds)
    * [func TestAltProtoCancellation(t *testing.T)](#TestAltProtoCancellation)
    * [func TestAppendTime(t *testing.T)](#TestAppendTime)
    * [func TestAutomaticHTTP2_ListenAndServe(t *testing.T)](#TestAutomaticHTTP2_ListenAndServe)
    * [func TestAutomaticHTTP2_ListenAndServe_GetCertificate(t *testing.T)](#TestAutomaticHTTP2_ListenAndServe_GetCertificate)
    * [func TestAutomaticHTTP2_Serve_H2TLSConfig(t *testing.T)](#TestAutomaticHTTP2_Serve_H2TLSConfig)
    * [func TestAutomaticHTTP2_Serve_NoTLSConfig(t *testing.T)](#TestAutomaticHTTP2_Serve_NoTLSConfig)
    * [func TestAutomaticHTTP2_Serve_NonH2TLSConfig(t *testing.T)](#TestAutomaticHTTP2_Serve_NonH2TLSConfig)
    * [func TestAutomaticHTTP2_Serve_WithTLSConfig(t *testing.T)](#TestAutomaticHTTP2_Serve_WithTLSConfig)
    * [func TestBadResponseAfterReadingBody(t *testing.T)](#TestBadResponseAfterReadingBody)
    * [func TestBasicAuth(t *testing.T)](#TestBasicAuth)
    * [func TestBasicAuthHeadersPreserved(t *testing.T)](#TestBasicAuthHeadersPreserved)
    * [func TestBidiStreamReverseProxy(t *testing.T)](#TestBidiStreamReverseProxy)
    * [func TestCancelRequestMidBody_h1(t *testing.T)](#TestCancelRequestMidBody_h1)
    * [func TestCancelRequestMidBody_h2(t *testing.T)](#TestCancelRequestMidBody_h2)
    * [func TestCancelRequestWhenSharingConnection(t *testing.T)](#TestCancelRequestWhenSharingConnection)
    * [func TestCancelRequestWithChannel(t *testing.T)](#TestCancelRequestWithChannel)
    * [func TestCancelRequestWithChannelBeforeDo_Cancel(t *testing.T)](#TestCancelRequestWithChannelBeforeDo_Cancel)
    * [func TestCancelRequestWithChannelBeforeDo_Context(t *testing.T)](#TestCancelRequestWithChannelBeforeDo_Context)
    * [func TestCaseSensitiveMethod_h1(t *testing.T)](#TestCaseSensitiveMethod_h1)
    * [func TestCaseSensitiveMethod_h2(t *testing.T)](#TestCaseSensitiveMethod_h2)
    * [func TestChunkedNoContent(t *testing.T)](#TestChunkedNoContent)
    * [func TestChunkedResponseHeaders_h1(t *testing.T)](#TestChunkedResponseHeaders_h1)
    * [func TestChunkedResponseHeaders_h2(t *testing.T)](#TestChunkedResponseHeaders_h2)
    * [func TestClient(t *testing.T)](#TestClient)
    * [func TestClientAltersCookiesOnRedirect(t *testing.T)](#TestClientAltersCookiesOnRedirect)
    * [func TestClientCallsCloseOnlyOnce(t *testing.T)](#TestClientCallsCloseOnlyOnce)
    * [func TestClientCanClose(t *testing.T)](#TestClientCanClose)
    * [func TestClientCloseIdleConnections(t *testing.T)](#TestClientCloseIdleConnections)
    * [func TestClientCopyHeadersOnRedirect(t *testing.T)](#TestClientCopyHeadersOnRedirect)
    * [func TestClientCopyHostOnRedirect(t *testing.T)](#TestClientCopyHostOnRedirect)
    * [func TestClientDoCanceledVsTimeout_h1(t *testing.T)](#TestClientDoCanceledVsTimeout_h1)
    * [func TestClientDoCanceledVsTimeout_h2(t *testing.T)](#TestClientDoCanceledVsTimeout_h2)
    * [func TestClientErrorWithRequestURI(t *testing.T)](#TestClientErrorWithRequestURI)
    * [func TestClientHeadContentLength_h1(t *testing.T)](#TestClientHeadContentLength_h1)
    * [func TestClientHeadContentLength_h2(t *testing.T)](#TestClientHeadContentLength_h2)
    * [func TestClientHead_h1(t *testing.T)](#TestClientHead_h1)
    * [func TestClientHead_h2(t *testing.T)](#TestClientHead_h2)
    * [func TestClientInsecureTransport(t *testing.T)](#TestClientInsecureTransport)
    * [func TestClientPopulatesNilResponseBody(t *testing.T)](#TestClientPopulatesNilResponseBody)
    * [func TestClientPropagatesTimeoutToContext(t *testing.T)](#TestClientPropagatesTimeoutToContext)
    * [func TestClientRedirect308NoGetBody(t *testing.T)](#TestClientRedirect308NoGetBody)
    * [func TestClientRedirect308NoLocation(t *testing.T)](#TestClientRedirect308NoLocation)
    * [func TestClientRedirectContext(t *testing.T)](#TestClientRedirectContext)
    * [func TestClientRedirectEatsBody_h1(t *testing.T)](#TestClientRedirectEatsBody_h1)
    * [func TestClientRedirectEatsBody_h2(t *testing.T)](#TestClientRedirectEatsBody_h2)
    * [func TestClientRedirectResponseWithoutRequest(t *testing.T)](#TestClientRedirectResponseWithoutRequest)
    * [func TestClientRedirectTypes(t *testing.T)](#TestClientRedirectTypes)
    * [func TestClientRedirectUseResponse(t *testing.T)](#TestClientRedirectUseResponse)
    * [func TestClientRedirects(t *testing.T)](#TestClientRedirects)
    * [func TestClientSendsCookieFromJar(t *testing.T)](#TestClientSendsCookieFromJar)
    * [func TestClientTimeoutCancel(t *testing.T)](#TestClientTimeoutCancel)
    * [func TestClientTimeoutKillsConn_AfterHeaders(t *testing.T)](#TestClientTimeoutKillsConn_AfterHeaders)
    * [func TestClientTimeoutKillsConn_BeforeHeaders(t *testing.T)](#TestClientTimeoutKillsConn_BeforeHeaders)
    * [func TestClientTimeout_Headers_h1(t *testing.T)](#TestClientTimeout_Headers_h1)
    * [func TestClientTimeout_Headers_h2(t *testing.T)](#TestClientTimeout_Headers_h2)
    * [func TestClientTimeout_h1(t *testing.T)](#TestClientTimeout_h1)
    * [func TestClientTimeout_h2(t *testing.T)](#TestClientTimeout_h2)
    * [func TestClientWithCorrectTLSServerName(t *testing.T)](#TestClientWithCorrectTLSServerName)
    * [func TestClientWithIncorrectTLSServerName(t *testing.T)](#TestClientWithIncorrectTLSServerName)
    * [func TestClientWriteShutdown(t *testing.T)](#TestClientWriteShutdown)
    * [func TestClientWrites(t *testing.T)](#TestClientWrites)
    * [func TestCloseIdleConnections_h1(t *testing.T)](#TestCloseIdleConnections_h1)
    * [func TestCloseIdleConnections_h2(t *testing.T)](#TestCloseIdleConnections_h2)
    * [func TestCloseNotifier(t *testing.T)](#TestCloseNotifier)
    * [func TestCloseNotifierChanLeak(t *testing.T)](#TestCloseNotifierChanLeak)
    * [func TestCloseNotifierPipelined(t *testing.T)](#TestCloseNotifierPipelined)
    * [func TestCloseWrite(t *testing.T)](#TestCloseWrite)
    * [func TestCodesPreventingContentTypeAndBody(t *testing.T)](#TestCodesPreventingContentTypeAndBody)
    * [func TestConcurrentReadWriteReqBody_h1(t *testing.T)](#TestConcurrentReadWriteReqBody_h1)
    * [func TestConcurrentReadWriteReqBody_h2(t *testing.T)](#TestConcurrentReadWriteReqBody_h2)
    * [func TestConcurrentServerServe(t *testing.T)](#TestConcurrentServerServe)
    * [func TestConnContextNotModifyingAllContexts(t *testing.T)](#TestConnContextNotModifyingAllContexts)
    * [func TestConnectRequest_h1(t *testing.T)](#TestConnectRequest_h1)
    * [func TestConnectRequest_h2(t *testing.T)](#TestConnectRequest_h2)
    * [func TestConsumingBodyOnNextConn(t *testing.T)](#TestConsumingBodyOnNextConn)
    * [func TestContentEncodingNoSniffing_h1(t *testing.T)](#TestContentEncodingNoSniffing_h1)
    * [func TestContentEncodingNoSniffing_h2(t *testing.T)](#TestContentEncodingNoSniffing_h2)
    * [func TestContentLengthZero(t *testing.T)](#TestContentLengthZero)
    * [func TestContentTypeOkayOn204(t *testing.T)](#TestContentTypeOkayOn204)
    * [func TestContentTypeWithVariousSources_h1(t *testing.T)](#TestContentTypeWithVariousSources_h1)
    * [func TestContentTypeWithVariousSources_h2(t *testing.T)](#TestContentTypeWithVariousSources_h2)
    * [func TestDeleteRedirects(t *testing.T)](#TestDeleteRedirects)
    * [func TestDetectContentType(t *testing.T)](#TestDetectContentType)
    * [func TestDirJoin(t *testing.T)](#TestDirJoin)
    * [func TestDirectoryIfNotModified(t *testing.T)](#TestDirectoryIfNotModified)
    * [func TestDisableKeepAliveUpgrade(t *testing.T)](#TestDisableKeepAliveUpgrade)
    * [func TestDontCacheBrokenHTTP2Conn(t *testing.T)](#TestDontCacheBrokenHTTP2Conn)
    * [func TestDoubleHijack(t *testing.T)](#TestDoubleHijack)
    * [func TestEmptyDirOpenCWD(t *testing.T)](#TestEmptyDirOpenCWD)
    * [func TestEmptyPasswordAuth(t *testing.T)](#TestEmptyPasswordAuth)
    * [func TestErrorWriteLoopRace(t *testing.T)](#TestErrorWriteLoopRace)
    * [func TestFSRedirect(t *testing.T)](#TestFSRedirect)
    * [func TestFileServerCleanPath(t *testing.T)](#TestFileServerCleanPath)
    * [func TestFileServerCleans(t *testing.T)](#TestFileServerCleans)
    * [func TestFileServerEscapesNames(t *testing.T)](#TestFileServerEscapesNames)
    * [func TestFileServerImplicitLeadingSlash(t *testing.T)](#TestFileServerImplicitLeadingSlash)
    * [func TestFileServerNotDirError(t *testing.T)](#TestFileServerNotDirError)
    * [func TestFileServerSortsNames(t *testing.T)](#TestFileServerSortsNames)
    * [func TestFileServerZeroByte(t *testing.T)](#TestFileServerZeroByte)
    * [func TestFormFileCallsParseMultipartForm(t *testing.T)](#TestFormFileCallsParseMultipartForm)
    * [func TestFormFileOrder(t *testing.T)](#TestFormFileOrder)
    * [func TestFormValueCallsParseMultipartForm(t *testing.T)](#TestFormValueCallsParseMultipartForm)
    * [func TestGetBasicAuth(t *testing.T)](#TestGetBasicAuth)
    * [func TestGetRequestFormat(t *testing.T)](#TestGetRequestFormat)
    * [func TestH12_200NoBody(t *testing.T)](#TestH12_200NoBody)
    * [func TestH12_AutoGzip(t *testing.T)](#TestH12_AutoGzip)
    * [func TestH12_AutoGzipWithDumpResponse(t *testing.T)](#TestH12_AutoGzipWithDumpResponse)
    * [func TestH12_AutoGzip_Disabled(t *testing.T)](#TestH12_AutoGzip_Disabled)
    * [func TestH12_ExplicitContentLength(t *testing.T)](#TestH12_ExplicitContentLength)
    * [func TestH12_FlushBeforeBody(t *testing.T)](#TestH12_FlushBeforeBody)
    * [func TestH12_FlushMidBody(t *testing.T)](#TestH12_FlushMidBody)
    * [func TestH12_HandlerWritesTooLittle(t *testing.T)](#TestH12_HandlerWritesTooLittle)
    * [func TestH12_HandlerWritesTooMuch(t *testing.T)](#TestH12_HandlerWritesTooMuch)
    * [func TestH12_HeadContentLengthLargeBody(t *testing.T)](#TestH12_HeadContentLengthLargeBody)
    * [func TestH12_HeadContentLengthNoBody(t *testing.T)](#TestH12_HeadContentLengthNoBody)
    * [func TestH12_HeadContentLengthSmallBody(t *testing.T)](#TestH12_HeadContentLengthSmallBody)
    * [func TestH12_Head_ExplicitLen(t *testing.T)](#TestH12_Head_ExplicitLen)
    * [func TestH12_Head_ImplicitLen(t *testing.T)](#TestH12_Head_ImplicitLen)
    * [func TestH12_RequestContentLength_Known_NonZero(t *testing.T)](#TestH12_RequestContentLength_Known_NonZero)
    * [func TestH12_RequestContentLength_Known_Zero(t *testing.T)](#TestH12_RequestContentLength_Known_Zero)
    * [func TestH12_RequestContentLength_Unknown(t *testing.T)](#TestH12_RequestContentLength_Unknown)
    * [func TestH12_ServerEmptyContentLength(t *testing.T)](#TestH12_ServerEmptyContentLength)
    * [func TestH12_SmallBody(t *testing.T)](#TestH12_SmallBody)
    * [func TestH12_WebSocketUpgrade(t *testing.T)](#TestH12_WebSocketUpgrade)
    * [func TestH2_204NoBody(t *testing.T)](#TestH2_204NoBody)
    * [func TestH2_304NoBody(t *testing.T)](#TestH2_304NoBody)
    * [func TestH2_404NoBody(t *testing.T)](#TestH2_404NoBody)
    * [func TestHTTP10ConnectionHeader(t *testing.T)](#TestHTTP10ConnectionHeader)
    * [func TestHTTP10KeepAlive204Response(t *testing.T)](#TestHTTP10KeepAlive204Response)
    * [func TestHTTP10KeepAlive304Response(t *testing.T)](#TestHTTP10KeepAlive304Response)
    * [func TestHTTP11KeepAlive204Response(t *testing.T)](#TestHTTP11KeepAlive204Response)
    * [func TestHTTP2NoWriteDeadline(t *testing.T)](#TestHTTP2NoWriteDeadline)
    * [func TestHTTP2UpgradeClosesConnection(t *testing.T)](#TestHTTP2UpgradeClosesConnection)
    * [func TestHTTP2WriteDeadlineEnforcedPerStream(t *testing.T)](#TestHTTP2WriteDeadlineEnforcedPerStream)
    * [func TestHTTP2WriteDeadlineExtendedOnNewRequest(t *testing.T)](#TestHTTP2WriteDeadlineExtendedOnNewRequest)
    * [func TestHTTPSClientDetectsHTTPServer(t *testing.T)](#TestHTTPSClientDetectsHTTPServer)
    * [func TestHandlerBodyClose(t *testing.T)](#TestHandlerBodyClose)
    * [func TestHandlerFinishSkipBigContentLengthRead(t *testing.T)](#TestHandlerFinishSkipBigContentLengthRead)
    * [func TestHandlerPanicNil_h1(t *testing.T)](#TestHandlerPanicNil_h1)
    * [func TestHandlerPanicNil_h2(t *testing.T)](#TestHandlerPanicNil_h2)
    * [func TestHandlerPanicWithHijack(t *testing.T)](#TestHandlerPanicWithHijack)
    * [func TestHandlerPanic_h1(t *testing.T)](#TestHandlerPanic_h1)
    * [func TestHandlerPanic_h2(t *testing.T)](#TestHandlerPanic_h2)
    * [func TestHandlerSetTransferEncodingChunked(t *testing.T)](#TestHandlerSetTransferEncodingChunked)
    * [func TestHandlerSetTransferEncodingGzip(t *testing.T)](#TestHandlerSetTransferEncodingGzip)
    * [func TestHandlerSetsBodyNil_h1(t *testing.T)](#TestHandlerSetsBodyNil_h1)
    * [func TestHandlerSetsBodyNil_h2(t *testing.T)](#TestHandlerSetsBodyNil_h2)
    * [func TestHandlersCanSetConnectionClose10(t *testing.T)](#TestHandlersCanSetConnectionClose10)
    * [func TestHandlersCanSetConnectionClose11(t *testing.T)](#TestHandlersCanSetConnectionClose11)
    * [func TestHeadResponses_h1(t *testing.T)](#TestHeadResponses_h1)
    * [func TestHeadResponses_h2(t *testing.T)](#TestHeadResponses_h2)
    * [func TestHeaderToWire(t *testing.T)](#TestHeaderToWire)
    * [func TestHijackAfterCloseNotifier(t *testing.T)](#TestHijackAfterCloseNotifier)
    * [func TestHijackBeforeRequestBodyRead(t *testing.T)](#TestHijackBeforeRequestBodyRead)
    * [func TestHostHandlers(t *testing.T)](#TestHostHandlers)
    * [func TestIdentityResponse(t *testing.T)](#TestIdentityResponse)
    * [func TestIdleConnChannelLeak(t *testing.T)](#TestIdleConnChannelLeak)
    * [func TestIdleConnH2Crash(t *testing.T)](#TestIdleConnH2Crash)
    * [func TestInterruptWithPanic_ErrAbortHandler_h1(t *testing.T)](#TestInterruptWithPanic_ErrAbortHandler_h1)
    * [func TestInterruptWithPanic_ErrAbortHandler_h2(t *testing.T)](#TestInterruptWithPanic_ErrAbortHandler_h2)
    * [func TestInterruptWithPanic_h1(t *testing.T)](#TestInterruptWithPanic_h1)
    * [func TestInterruptWithPanic_h2(t *testing.T)](#TestInterruptWithPanic_h2)
    * [func TestInterruptWithPanic_nil_h1(t *testing.T)](#TestInterruptWithPanic_nil_h1)
    * [func TestInterruptWithPanic_nil_h2(t *testing.T)](#TestInterruptWithPanic_nil_h2)
    * [func TestInvalidHeaderResponse(t *testing.T)](#TestInvalidHeaderResponse)
    * [func TestInvalidTrailerClosesConnection(t *testing.T)](#TestInvalidTrailerClosesConnection)
    * [func TestIs408(t *testing.T)](#TestIs408)
    * [func TestIssue10884_MaxBytesEOF(t *testing.T)](#TestIssue10884_MaxBytesEOF)
    * [func TestIssue11549_Expect100(t *testing.T)](#TestIssue11549_Expect100)
    * [func TestIssue13893_Expect100(t *testing.T)](#TestIssue13893_Expect100)
    * [func TestIssue32441(t *testing.T)](#TestIssue32441)
    * [func TestIssue3595(t *testing.T)](#TestIssue3595)
    * [func TestIssue3644(t *testing.T)](#TestIssue3644)
    * [func TestIssue4191_InfiniteGetTimeout(t *testing.T)](#TestIssue4191_InfiniteGetTimeout)
    * [func TestIssue4191_InfiniteGetToPutTimeout(t *testing.T)](#TestIssue4191_InfiniteGetToPutTimeout)
    * [func TestJarCalls(t *testing.T)](#TestJarCalls)
    * [func TestKeepAliveFinalChunkWithEOF(t *testing.T)](#TestKeepAliveFinalChunkWithEOF)
    * [func TestLinuxSendfile(t *testing.T)](#TestLinuxSendfile)
    * [func TestLinuxSendfileChild(*testing.T)](#TestLinuxSendfileChild)
    * [func TestMain(m *testing.M)](#TestMain)
    * [func TestMaxBytesReaderDifferentLimits(t *testing.T)](#TestMaxBytesReaderDifferentLimits)
    * [func TestMaxBytesReaderStickyError(t *testing.T)](#TestMaxBytesReaderStickyError)
    * [func TestMaxInt64ForMultipartFormMaxMemoryOverflow(t *testing.T)](#TestMaxInt64ForMultipartFormMaxMemoryOverflow)
    * [func TestMissingFileMultipartRequest(t *testing.T)](#TestMissingFileMultipartRequest)
    * [func TestMissingStatusNoPanic(t *testing.T)](#TestMissingStatusNoPanic)
    * [func TestMultipartReader(t *testing.T)](#TestMultipartReader)
    * [func TestMultipartReaderOrder(t *testing.T)](#TestMultipartReaderOrder)
    * [func TestMultipartRequest(t *testing.T)](#TestMultipartRequest)
    * [func TestMultipartRequestAuto(t *testing.T)](#TestMultipartRequestAuto)
    * [func TestMuxRedirectLeadingSlashes(t *testing.T)](#TestMuxRedirectLeadingSlashes)
    * [func TestMuxRedirectRelative(t *testing.T)](#TestMuxRedirectRelative)
    * [func TestNewClientServerTest(t *testing.T)](#TestNewClientServerTest)
    * [func TestNewRequestContentLength(t *testing.T)](#TestNewRequestContentLength)
    * [func TestNewRequestGetBody(t *testing.T)](#TestNewRequestGetBody)
    * [func TestNewRequestHost(t *testing.T)](#TestNewRequestHost)
    * [func TestNextProtoUpgrade(t *testing.T)](#TestNextProtoUpgrade)
    * [func TestNoBodyOnChunked304Response(t *testing.T)](#TestNoBodyOnChunked304Response)
    * [func TestNoContentLengthIfTransferEncoding(t *testing.T)](#TestNoContentLengthIfTransferEncoding)
    * [func TestNoCrashReturningTransportAltConn(t *testing.T)](#TestNoCrashReturningTransportAltConn)
    * [func TestNoPanicOnRoundTripWithBasicAuth_h1(t *testing.T)](#TestNoPanicOnRoundTripWithBasicAuth_h1)
    * [func TestNoPanicOnRoundTripWithBasicAuth_h2(t *testing.T)](#TestNoPanicOnRoundTripWithBasicAuth_h2)
    * [func TestNoSniffExpectRequestBody_h1(t *testing.T)](#TestNoSniffExpectRequestBody_h1)
    * [func TestNoSniffExpectRequestBody_h2(t *testing.T)](#TestNoSniffExpectRequestBody_h2)
    * [func TestOnlyWriteTimeout(t *testing.T)](#TestOnlyWriteTimeout)
    * [func TestOptions(t *testing.T)](#TestOptions)
    * [func TestParseBasicAuth(t *testing.T)](#TestParseBasicAuth)
    * [func TestParseFormInitializeOnError(t *testing.T)](#TestParseFormInitializeOnError)
    * [func TestParseFormQuery(t *testing.T)](#TestParseFormQuery)
    * [func TestParseFormQueryMethods(t *testing.T)](#TestParseFormQueryMethods)
    * [func TestParseFormSemicolonSeparator(t *testing.T)](#TestParseFormSemicolonSeparator)
    * [func TestParseFormUnknownContentType(t *testing.T)](#TestParseFormUnknownContentType)
    * [func TestParseHTTPVersion(t *testing.T)](#TestParseHTTPVersion)
    * [func TestParseMultipartForm(t *testing.T)](#TestParseMultipartForm)
    * [func TestParseMultipartFormFilename(t *testing.T)](#TestParseMultipartFormFilename)
    * [func TestParseMultipartFormOrder(t *testing.T)](#TestParseMultipartFormOrder)
    * [func TestParseMultipartFormPopulatesPostForm(t *testing.T)](#TestParseMultipartFormPopulatesPostForm)
    * [func TestParseMultipartFormSemicolonSeparator(t *testing.T)](#TestParseMultipartFormSemicolonSeparator)
    * [func TestPostFormRequestFormat(t *testing.T)](#TestPostFormRequestFormat)
    * [func TestPostRedirects(t *testing.T)](#TestPostRedirects)
    * [func TestPostRequestFormat(t *testing.T)](#TestPostRequestFormat)
    * [func TestProxyFromEnvironment(t *testing.T)](#TestProxyFromEnvironment)
    * [func TestProxyFromEnvironmentLowerCase(t *testing.T)](#TestProxyFromEnvironmentLowerCase)
    * [func TestQuery(t *testing.T)](#TestQuery)
    * [func TestQuerySemicolon(t *testing.T)](#TestQuerySemicolon)
    * [func TestReadRequestErrors(t *testing.T)](#TestReadRequestErrors)
    * [func TestRedirect(t *testing.T)](#TestRedirect)
    * [func TestRedirectBadPath(t *testing.T)](#TestRedirectBadPath)
    * [func TestRedirectContentTypeAndBody(t *testing.T)](#TestRedirectContentTypeAndBody)
    * [func TestRedirectCookiesJar(t *testing.T)](#TestRedirectCookiesJar)
    * [func TestRedirect_h1(t *testing.T)](#TestRedirect_h1)
    * [func TestRedirect_h2(t *testing.T)](#TestRedirect_h2)
    * [func TestReferer(t *testing.T)](#TestReferer)
    * [func TestRequestBadHost(t *testing.T)](#TestRequestBadHost)
    * [func TestRequestBodyCloseDoesntBlock(t *testing.T)](#TestRequestBodyCloseDoesntBlock)
    * [func TestRequestBodyLimit_h1(t *testing.T)](#TestRequestBodyLimit_h1)
    * [func TestRequestBodyLimit_h2(t *testing.T)](#TestRequestBodyLimit_h2)
    * [func TestRequestBodyReadErrorClosesConnection(t *testing.T)](#TestRequestBodyReadErrorClosesConnection)
    * [func TestRequestBodyTimeoutClosesConnection(t *testing.T)](#TestRequestBodyTimeoutClosesConnection)
    * [func TestRequestCloneTransferEncoding(t *testing.T)](#TestRequestCloneTransferEncoding)
    * [func TestRequestInvalidMethod(t *testing.T)](#TestRequestInvalidMethod)
    * [func TestRequestLimit_h1(t *testing.T)](#TestRequestLimit_h1)
    * [func TestRequestLimit_h2(t *testing.T)](#TestRequestLimit_h2)
    * [func TestRequestWriteBufferedWriter(t *testing.T)](#TestRequestWriteBufferedWriter)
    * [func TestResponseBodyReadAfterClose_h1(t *testing.T)](#TestResponseBodyReadAfterClose_h1)
    * [func TestResponseBodyReadAfterClose_h2(t *testing.T)](#TestResponseBodyReadAfterClose_h2)
    * [func TestResponseSetsTLSConnectionState(t *testing.T)](#TestResponseSetsTLSConnectionState)
    * [func TestResponseWriterWriteString(t *testing.T)](#TestResponseWriterWriteString)
    * [func TestRetryRequestsOnError(t *testing.T)](#TestRetryRequestsOnError)
    * [func TestReuseRequest(t *testing.T)](#TestReuseRequest)
    * [func TestRoundTripGzip(t *testing.T)](#TestRoundTripGzip)
    * [func TestRoundTripReturnsProxyError(t *testing.T)](#TestRoundTripReturnsProxyError)
    * [func TestSOCKS5Proxy(t *testing.T)](#TestSOCKS5Proxy)
    * [func TestServeContent(t *testing.T)](#TestServeContent)
    * [func TestServeContentErrorMessages(t *testing.T)](#TestServeContentErrorMessages)
    * [func TestServeDirWithoutTrailingSlash(t *testing.T)](#TestServeDirWithoutTrailingSlash)
    * [func TestServeFile(t *testing.T)](#TestServeFile)
    * [func TestServeFileContentType(t *testing.T)](#TestServeFileContentType)
    * [func TestServeFileDirPanicEmptyPath(t *testing.T)](#TestServeFileDirPanicEmptyPath)
    * [func TestServeFileFromCWD(t *testing.T)](#TestServeFileFromCWD)
    * [func TestServeFileMimeType(t *testing.T)](#TestServeFileMimeType)
    * [func TestServeFileRejectsInvalidSuffixLengths_h1(t *testing.T)](#TestServeFileRejectsInvalidSuffixLengths_h1)
    * [func TestServeFileRejectsInvalidSuffixLengths_h2(t *testing.T)](#TestServeFileRejectsInvalidSuffixLengths_h2)
    * [func TestServeFileWithContentEncoding_h1(t *testing.T)](#TestServeFileWithContentEncoding_h1)
    * [func TestServeFileWithContentEncoding_h2(t *testing.T)](#TestServeFileWithContentEncoding_h2)
    * [func TestServeFile_DotDot(t *testing.T)](#TestServeFile_DotDot)
    * [func TestServeHTTP10Close(t *testing.T)](#TestServeHTTP10Close)
    * [func TestServeIndexHtml(t *testing.T)](#TestServeIndexHtml)
    * [func TestServeIndexHtmlFS(t *testing.T)](#TestServeIndexHtmlFS)
    * [func TestServeMuxHandleFuncWithNilHandler(t *testing.T)](#TestServeMuxHandleFuncWithNilHandler)
    * [func TestServeMuxHandler(t *testing.T)](#TestServeMuxHandler)
    * [func TestServeMuxHandlerRedirects(t *testing.T)](#TestServeMuxHandlerRedirects)
    * [func TestServeTLS(t *testing.T)](#TestServeTLS)
    * [func TestServeWithSlashRedirectForHostPatterns(t *testing.T)](#TestServeWithSlashRedirectForHostPatterns)
    * [func TestServeWithSlashRedirectKeepsQueryString(t *testing.T)](#TestServeWithSlashRedirectKeepsQueryString)
    * [func TestServerAllowsBlockingRemoteAddr(t *testing.T)](#TestServerAllowsBlockingRemoteAddr)
    * [func TestServerBufferedChunking(t *testing.T)](#TestServerBufferedChunking)
    * [func TestServerCancelsReadTimeoutWhenIdle(t *testing.T)](#TestServerCancelsReadTimeoutWhenIdle)
    * [func TestServerCloseDeadlock(t *testing.T)](#TestServerCloseDeadlock)
    * [func TestServerCloseListenerOnce(t *testing.T)](#TestServerCloseListenerOnce)
    * [func TestServerConnState(t *testing.T)](#TestServerConnState)
    * [func TestServerConnStateNew(t *testing.T)](#TestServerConnStateNew)
    * [func TestServerContentType_h1(t *testing.T)](#TestServerContentType_h1)
    * [func TestServerContentType_h2(t *testing.T)](#TestServerContentType_h2)
    * [func TestServerContext_LocalAddrContextKey_h1(t *testing.T)](#TestServerContext_LocalAddrContextKey_h1)
    * [func TestServerContext_LocalAddrContextKey_h2(t *testing.T)](#TestServerContext_LocalAddrContextKey_h2)
    * [func TestServerContext_ServerContextKey_h1(t *testing.T)](#TestServerContext_ServerContextKey_h1)
    * [func TestServerContext_ServerContextKey_h2(t *testing.T)](#TestServerContext_ServerContextKey_h2)
    * [func TestServerContexts(t *testing.T)](#TestServerContexts)
    * [func TestServerContextsHTTP2(t *testing.T)](#TestServerContextsHTTP2)
    * [func TestServerDuplicateBackgroundRead(t *testing.T)](#TestServerDuplicateBackgroundRead)
    * [func TestServerEmptyBodyRace_h1(t *testing.T)](#TestServerEmptyBodyRace_h1)
    * [func TestServerEmptyBodyRace_h2(t *testing.T)](#TestServerEmptyBodyRace_h2)
    * [func TestServerExpect(t *testing.T)](#TestServerExpect)
    * [func TestServerFileStatError(t *testing.T)](#TestServerFileStatError)
    * [func TestServerFlushAndHijack(t *testing.T)](#TestServerFlushAndHijack)
    * [func TestServerGracefulClose(t *testing.T)](#TestServerGracefulClose)
    * [func TestServerHandlersCanHandleH2PRI(t *testing.T)](#TestServerHandlersCanHandleH2PRI)
    * [func TestServerHijackGetsBackgroundByte(t *testing.T)](#TestServerHijackGetsBackgroundByte)
    * [func TestServerHijackGetsBackgroundByte_big(t *testing.T)](#TestServerHijackGetsBackgroundByte_big)
    * [func TestServerIdleTimeout(t *testing.T)](#TestServerIdleTimeout)
    * [func TestServerIssue5953_h1(t *testing.T)](#TestServerIssue5953_h1)
    * [func TestServerIssue5953_h2(t *testing.T)](#TestServerIssue5953_h2)
    * [func TestServerKeepAliveAfterWriteError(t *testing.T)](#TestServerKeepAliveAfterWriteError)
    * [func TestServerKeepAlivesEnabled(t *testing.T)](#TestServerKeepAlivesEnabled)
    * [func TestServerKeepAlivesEnabled_h1(t *testing.T)](#TestServerKeepAlivesEnabled_h1)
    * [func TestServerKeepAlivesEnabled_h2(t *testing.T)](#TestServerKeepAlivesEnabled_h2)
    * [func TestServerListenNotComparableListener(t *testing.T)](#TestServerListenNotComparableListener)
    * [func TestServerNoContentType_h1(t *testing.T)](#TestServerNoContentType_h1)
    * [func TestServerNoContentType_h2(t *testing.T)](#TestServerNoContentType_h2)
    * [func TestServerNoDate_h1(t *testing.T)](#TestServerNoDate_h1)
    * [func TestServerNoDate_h2(t *testing.T)](#TestServerNoDate_h2)
    * [func TestServerReaderFromOrder_h1(t *testing.T)](#TestServerReaderFromOrder_h1)
    * [func TestServerReaderFromOrder_h2(t *testing.T)](#TestServerReaderFromOrder_h2)
    * [func TestServerRequestContextCancel_ConnClose(t *testing.T)](#TestServerRequestContextCancel_ConnClose)
    * [func TestServerRequestContextCancel_ServeHTTPDone_h1(t *testing.T)](#TestServerRequestContextCancel_ServeHTTPDone_h1)
    * [func TestServerRequestContextCancel_ServeHTTPDone_h2(t *testing.T)](#TestServerRequestContextCancel_ServeHTTPDone_h2)
    * [func TestServerSetKeepAlivesEnabledClosesConns(t *testing.T)](#TestServerSetKeepAlivesEnabledClosesConns)
    * [func TestServerShutdownStateNew(t *testing.T)](#TestServerShutdownStateNew)
    * [func TestServerShutdownThenServe(t *testing.T)](#TestServerShutdownThenServe)
    * [func TestServerShutdown_h1(t *testing.T)](#TestServerShutdown_h1)
    * [func TestServerShutdown_h2(t *testing.T)](#TestServerShutdown_h2)
    * [func TestServerTimeouts(t *testing.T)](#TestServerTimeouts)
    * [func TestServerUndeclaredTrailers_h1(t *testing.T)](#TestServerUndeclaredTrailers_h1)
    * [func TestServerUndeclaredTrailers_h2(t *testing.T)](#TestServerUndeclaredTrailers_h2)
    * [func TestServerUnreadRequestBodyLarge(t *testing.T)](#TestServerUnreadRequestBodyLarge)
    * [func TestServerUnreadRequestBodyLittle(t *testing.T)](#TestServerUnreadRequestBodyLittle)
    * [func TestServerValidatesHeaders(t *testing.T)](#TestServerValidatesHeaders)
    * [func TestServerValidatesHostHeader(t *testing.T)](#TestServerValidatesHostHeader)
    * [func TestServerValidatesMethod(t *testing.T)](#TestServerValidatesMethod)
    * [func TestServerWriteHijackZeroBytes(t *testing.T)](#TestServerWriteHijackZeroBytes)
    * [func TestSetBasicAuth(t *testing.T)](#TestSetBasicAuth)
    * [func TestSetsRemoteAddr_h1(t *testing.T)](#TestSetsRemoteAddr_h1)
    * [func TestSetsRemoteAddr_h2(t *testing.T)](#TestSetsRemoteAddr_h2)
    * [func TestShouldCopyHeaderOnRedirect(t *testing.T)](#TestShouldCopyHeaderOnRedirect)
    * [func TestShouldRedirectConcurrency(t *testing.T)](#TestShouldRedirectConcurrency)
    * [func TestSniffWriteSize_h1(t *testing.T)](#TestSniffWriteSize_h1)
    * [func TestSniffWriteSize_h2(t *testing.T)](#TestSniffWriteSize_h2)
    * [func TestStarRequest(t *testing.T)](#TestStarRequest)
    * [func TestStarRequestFoo_h1(t *testing.T)](#TestStarRequestFoo_h1)
    * [func TestStarRequestFoo_h2(t *testing.T)](#TestStarRequestFoo_h2)
    * [func TestStarRequestOptions_h1(t *testing.T)](#TestStarRequestOptions_h1)
    * [func TestStarRequestOptions_h2(t *testing.T)](#TestStarRequestOptions_h2)
    * [func TestStreamingGet_h1(t *testing.T)](#TestStreamingGet_h1)
    * [func TestStreamingGet_h2(t *testing.T)](#TestStreamingGet_h2)
    * [func TestStressSurpriseServerCloses(t *testing.T)](#TestStressSurpriseServerCloses)
    * [func TestStripPasswordFromError(t *testing.T)](#TestStripPasswordFromError)
    * [func TestStripPortFromHost(t *testing.T)](#TestStripPortFromHost)
    * [func TestStripPrefix(t *testing.T)](#TestStripPrefix)
    * [func TestStripPrefixNotModifyRequest(t *testing.T)](#TestStripPrefixNotModifyRequest)
    * [func TestTLSHandshakeTimeout(t *testing.T)](#TestTLSHandshakeTimeout)
    * [func TestTLSHandshakeTrace(t *testing.T)](#TestTLSHandshakeTrace)
    * [func TestTLSServer(t *testing.T)](#TestTLSServer)
    * [func TestTLSServerClosesConnection(t *testing.T)](#TestTLSServerClosesConnection)
    * [func TestTLSServerRejectHTTPRequests(t *testing.T)](#TestTLSServerRejectHTTPRequests)
    * [func TestTimeoutHandlerEmptyResponse(t *testing.T)](#TestTimeoutHandlerEmptyResponse)
    * [func TestTimeoutHandlerPanicRecovery(t *testing.T)](#TestTimeoutHandlerPanicRecovery)
    * [func TestTimeoutHandlerRace(t *testing.T)](#TestTimeoutHandlerRace)
    * [func TestTimeoutHandlerRaceHeader(t *testing.T)](#TestTimeoutHandlerRaceHeader)
    * [func TestTimeoutHandlerRaceHeaderTimeout(t *testing.T)](#TestTimeoutHandlerRaceHeaderTimeout)
    * [func TestTimeoutHandlerStartTimerWhenServing(t *testing.T)](#TestTimeoutHandlerStartTimerWhenServing)
    * [func TestTimeoutHandlerSuperfluousLogs(t *testing.T)](#TestTimeoutHandlerSuperfluousLogs)
    * [func TestTimeoutHandler_h1(t *testing.T)](#TestTimeoutHandler_h1)
    * [func TestTimeoutHandler_h2(t *testing.T)](#TestTimeoutHandler_h2)
    * [func TestTolerateCRLFBeforeRequestLine(t *testing.T)](#TestTolerateCRLFBeforeRequestLine)
    * [func TestTrailersClientToServer_h1(t *testing.T)](#TestTrailersClientToServer_h1)
    * [func TestTrailersClientToServer_h2(t *testing.T)](#TestTrailersClientToServer_h2)
    * [func TestTrailersServerToClient_Flush_h1(t *testing.T)](#TestTrailersServerToClient_Flush_h1)
    * [func TestTrailersServerToClient_Flush_h2(t *testing.T)](#TestTrailersServerToClient_Flush_h2)
    * [func TestTrailersServerToClient_h1(t *testing.T)](#TestTrailersServerToClient_h1)
    * [func TestTrailersServerToClient_h2(t *testing.T)](#TestTrailersServerToClient_h2)
    * [func TestTransportAltProto(t *testing.T)](#TestTransportAltProto)
    * [func TestTransportAndServerSharedBodyRace_h1(t *testing.T)](#TestTransportAndServerSharedBodyRace_h1)
    * [func TestTransportAndServerSharedBodyRace_h2(t *testing.T)](#TestTransportAndServerSharedBodyRace_h2)
    * [func TestTransportAutomaticHTTP2(t *testing.T)](#TestTransportAutomaticHTTP2)
    * [func TestTransportAutomaticHTTP2_DefaultTransport(t *testing.T)](#TestTransportAutomaticHTTP2_DefaultTransport)
    * [func TestTransportAutomaticHTTP2_Dial(t *testing.T)](#TestTransportAutomaticHTTP2_Dial)
    * [func TestTransportAutomaticHTTP2_DialContext(t *testing.T)](#TestTransportAutomaticHTTP2_DialContext)
    * [func TestTransportAutomaticHTTP2_DialTLS(t *testing.T)](#TestTransportAutomaticHTTP2_DialTLS)
    * [func TestTransportAutomaticHTTP2_DialerAndTLSConfigSupportsHTTP2AndTLSConfig(t *testing.T)](#TestTransportAutomaticHTTP2_DialerAndTLSConfigSupportsHTTP2AndTLSConfig)
    * [func TestTransportAutomaticHTTP2_ExpectContinueTimeout(t *testing.T)](#TestTransportAutomaticHTTP2_ExpectContinueTimeout)
    * [func TestTransportAutomaticHTTP2_TLSConfig(t *testing.T)](#TestTransportAutomaticHTTP2_TLSConfig)
    * [func TestTransportAutomaticHTTP2_TLSNextProto(t *testing.T)](#TestTransportAutomaticHTTP2_TLSNextProto)
    * [func TestTransportBodyReadError(t *testing.T)](#TestTransportBodyReadError)
    * [func TestTransportCONNECTBidi(t *testing.T)](#TestTransportCONNECTBidi)
    * [func TestTransportCancelBeforeResponseHeaders(t *testing.T)](#TestTransportCancelBeforeResponseHeaders)
    * [func TestTransportCancelRequest(t *testing.T)](#TestTransportCancelRequest)
    * [func TestTransportCancelRequestInDial(t *testing.T)](#TestTransportCancelRequestInDial)
    * [func TestTransportCancelRequestInDo(t *testing.T)](#TestTransportCancelRequestInDo)
    * [func TestTransportCancelRequestWithBodyInDo(t *testing.T)](#TestTransportCancelRequestWithBodyInDo)
    * [func TestTransportCheckContextDoneEarly(t *testing.T)](#TestTransportCheckContextDoneEarly)
    * [func TestTransportClone(t *testing.T)](#TestTransportClone)
    * [func TestTransportCloseIdleConnsThenReturn(t *testing.T)](#TestTransportCloseIdleConnsThenReturn)
    * [func TestTransportCloseResponseBody(t *testing.T)](#TestTransportCloseResponseBody)
    * [func TestTransportClosesBodyOnError(t *testing.T)](#TestTransportClosesBodyOnError)
    * [func TestTransportClosesBodyOnInvalidRequests(t *testing.T)](#TestTransportClosesBodyOnInvalidRequests)
    * [func TestTransportClosesRequestBody(t *testing.T)](#TestTransportClosesRequestBody)
    * [func TestTransportConcurrency(t *testing.T)](#TestTransportConcurrency)
    * [func TestTransportConnectionCloseOnRequest(t *testing.T)](#TestTransportConnectionCloseOnRequest)
    * [func TestTransportConnectionCloseOnRequestDisableKeepAlive(t *testing.T)](#TestTransportConnectionCloseOnRequestDisableKeepAlive)
    * [func TestTransportConnectionCloseOnResponse(t *testing.T)](#TestTransportConnectionCloseOnResponse)
    * [func TestTransportContentEncodingCaseInsensitive(t *testing.T)](#TestTransportContentEncodingCaseInsensitive)
    * [func TestTransportDecrementConnWhenIdleConnRemoved(t *testing.T)](#TestTransportDecrementConnWhenIdleConnRemoved)
    * [func TestTransportDialCancelRace(t *testing.T)](#TestTransportDialCancelRace)
    * [func TestTransportDialContext(t *testing.T)](#TestTransportDialContext)
    * [func TestTransportDialPreservesNetOpProxyError(t *testing.T)](#TestTransportDialPreservesNetOpProxyError)
    * [func TestTransportDialTLS(t *testing.T)](#TestTransportDialTLS)
    * [func TestTransportDialTLSContext(t *testing.T)](#TestTransportDialTLSContext)
    * [func TestTransportDiscardsUnneededConns(t *testing.T)](#TestTransportDiscardsUnneededConns)
    * [func TestTransportEmptyMethod(t *testing.T)](#TestTransportEmptyMethod)
    * [func TestTransportEventTrace(t *testing.T)](#TestTransportEventTrace)
    * [func TestTransportEventTraceRealDNS(t *testing.T)](#TestTransportEventTraceRealDNS)
    * [func TestTransportEventTraceTLSVerify(t *testing.T)](#TestTransportEventTraceTLSVerify)
    * [func TestTransportEventTrace_NoHooks(t *testing.T)](#TestTransportEventTrace_NoHooks)
    * [func TestTransportEventTrace_NoHooks_h2(t *testing.T)](#TestTransportEventTrace_NoHooks_h2)
    * [func TestTransportEventTrace_h2(t *testing.T)](#TestTransportEventTrace_h2)
    * [func TestTransportExpect100Continue(t *testing.T)](#TestTransportExpect100Continue)
    * [func TestTransportFlushesBodyChunks(t *testing.T)](#TestTransportFlushesBodyChunks)
    * [func TestTransportFlushesRequestHeader(t *testing.T)](#TestTransportFlushesRequestHeader)
    * [func TestTransportGCRequest_Body_h1(t *testing.T)](#TestTransportGCRequest_Body_h1)
    * [func TestTransportGCRequest_Body_h2(t *testing.T)](#TestTransportGCRequest_Body_h2)
    * [func TestTransportGCRequest_NoBody_h1(t *testing.T)](#TestTransportGCRequest_NoBody_h1)
    * [func TestTransportGCRequest_NoBody_h2(t *testing.T)](#TestTransportGCRequest_NoBody_h2)
    * [func TestTransportGzip(t *testing.T)](#TestTransportGzip)
    * [func TestTransportGzipRecursive(t *testing.T)](#TestTransportGzipRecursive)
    * [func TestTransportGzipShort(t *testing.T)](#TestTransportGzipShort)
    * [func TestTransportHeadChunkedResponse(t *testing.T)](#TestTransportHeadChunkedResponse)
    * [func TestTransportHeadResponses(t *testing.T)](#TestTransportHeadResponses)
    * [func TestTransportIDNA_h1(t *testing.T)](#TestTransportIDNA_h1)
    * [func TestTransportIDNA_h2(t *testing.T)](#TestTransportIDNA_h2)
    * [func TestTransportIdleCacheKeys(t *testing.T)](#TestTransportIdleCacheKeys)
    * [func TestTransportIdleConnCrash(t *testing.T)](#TestTransportIdleConnCrash)
    * [func TestTransportIdleConnTimeout_h1(t *testing.T)](#TestTransportIdleConnTimeout_h1)
    * [func TestTransportIdleConnTimeout_h2(t *testing.T)](#TestTransportIdleConnTimeout_h2)
    * [func TestTransportIgnore1xxResponses(t *testing.T)](#TestTransportIgnore1xxResponses)
    * [func TestTransportIgnores408(t *testing.T)](#TestTransportIgnores408)
    * [func TestTransportIssue10457(t *testing.T)](#TestTransportIssue10457)
    * [func TestTransportKeepAlives(t *testing.T)](#TestTransportKeepAlives)
    * [func TestTransportLimits1xxResponses(t *testing.T)](#TestTransportLimits1xxResponses)
    * [func TestTransportMaxConnsPerHost(t *testing.T)](#TestTransportMaxConnsPerHost)
    * [func TestTransportMaxConnsPerHostIncludeDialInProgress(t *testing.T)](#TestTransportMaxConnsPerHostIncludeDialInProgress)
    * [func TestTransportMaxIdleConns(t *testing.T)](#TestTransportMaxIdleConns)
    * [func TestTransportMaxPerHostIdleConns(t *testing.T)](#TestTransportMaxPerHostIdleConns)
    * [func TestTransportNoHost(t *testing.T)](#TestTransportNoHost)
    * [func TestTransportNoReuseAfterEarlyResponse(t *testing.T)](#TestTransportNoReuseAfterEarlyResponse)
    * [func TestTransportPersistConnContextLeakMaxConnsPerHost(t *testing.T)](#TestTransportPersistConnContextLeakMaxConnsPerHost)
    * [func TestTransportPersistConnLeak(t *testing.T)](#TestTransportPersistConnLeak)
    * [func TestTransportPersistConnLeakNeverIdle(t *testing.T)](#TestTransportPersistConnLeakNeverIdle)
    * [func TestTransportPersistConnLeakShortBody(t *testing.T)](#TestTransportPersistConnLeakShortBody)
    * [func TestTransportPrefersResponseOverWriteError(t *testing.T)](#TestTransportPrefersResponseOverWriteError)
    * [func TestTransportProxy(t *testing.T)](#TestTransportProxy)
    * [func TestTransportProxyConnectHeader(t *testing.T)](#TestTransportProxyConnectHeader)
    * [func TestTransportProxyDialDoesNotMutateProxyConnectHeader(t *testing.T)](#TestTransportProxyDialDoesNotMutateProxyConnectHeader)
    * [func TestTransportProxyGetConnectHeader(t *testing.T)](#TestTransportProxyGetConnectHeader)
    * [func TestTransportProxyHTTPSConnectLeak(t *testing.T)](#TestTransportProxyHTTPSConnectLeak)
    * [func TestTransportRangeAndGzip(t *testing.T)](#TestTransportRangeAndGzip)
    * [func TestTransportReadToEndReusesConn(t *testing.T)](#TestTransportReadToEndReusesConn)
    * [func TestTransportReading100Continue(t *testing.T)](#TestTransportReading100Continue)
    * [func TestTransportRejectsAlphaPort(t *testing.T)](#TestTransportRejectsAlphaPort)
    * [func TestTransportRejectsInvalidHeaders_h1(t *testing.T)](#TestTransportRejectsInvalidHeaders_h1)
    * [func TestTransportRejectsInvalidHeaders_h2(t *testing.T)](#TestTransportRejectsInvalidHeaders_h2)
    * [func TestTransportRejectsSignInContentLength(t *testing.T)](#TestTransportRejectsSignInContentLength)
    * [func TestTransportRemovesDeadIdleConnections(t *testing.T)](#TestTransportRemovesDeadIdleConnections)
    * [func TestTransportRemovesH2ConnsAfterIdle(t *testing.T)](#TestTransportRemovesH2ConnsAfterIdle)
    * [func TestTransportRequestReplayable(t *testing.T)](#TestTransportRequestReplayable)
    * [func TestTransportRequestWriteRoundTrip(t *testing.T)](#TestTransportRequestWriteRoundTrip)
    * [func TestTransportRespectRequestWantsClose(t *testing.T)](#TestTransportRespectRequestWantsClose)
    * [func TestTransportResponseBodyWritableOnProtocolSwitch(t *testing.T)](#TestTransportResponseBodyWritableOnProtocolSwitch)
    * [func TestTransportResponseCancelRace(t *testing.T)](#TestTransportResponseCancelRace)
    * [func TestTransportResponseHeaderLength(t *testing.T)](#TestTransportResponseHeaderLength)
    * [func TestTransportResponseHeaderTimeout(t *testing.T)](#TestTransportResponseHeaderTimeout)
    * [func TestTransportReturnsPeekError(t *testing.T)](#TestTransportReturnsPeekError)
    * [func TestTransportReuseConnEmptyResponseBody(t *testing.T)](#TestTransportReuseConnEmptyResponseBody)
    * [func TestTransportReuseConnection_Gzip_Chunked(t *testing.T)](#TestTransportReuseConnection_Gzip_Chunked)
    * [func TestTransportReuseConnection_Gzip_ContentLength(t *testing.T)](#TestTransportReuseConnection_Gzip_ContentLength)
    * [func TestTransportServerClosingUnexpectedly(t *testing.T)](#TestTransportServerClosingUnexpectedly)
    * [func TestTransportSocketLateBinding(t *testing.T)](#TestTransportSocketLateBinding)
    * [func TestTransportTLSHandshakeTimeout(t *testing.T)](#TestTransportTLSHandshakeTimeout)
    * [func TestTransportTraceGotConnH2IdleConns(t *testing.T)](#TestTransportTraceGotConnH2IdleConns)
    * [func TestTransportTreat101Terminal(t *testing.T)](#TestTransportTreat101Terminal)
    * [func TestTransportUserAgent_h1(t *testing.T)](#TestTransportUserAgent_h1)
    * [func TestTransportUserAgent_h2(t *testing.T)](#TestTransportUserAgent_h2)
    * [func TestTransportUsesTLSConfigServerName(t *testing.T)](#TestTransportUsesTLSConfigServerName)
    * [func TestUnsupportedTransferEncodingsReturn501(t *testing.T)](#TestUnsupportedTransferEncodingsReturn501)
    * [func TestWithContextDeepCopiesURL(t *testing.T)](#TestWithContextDeepCopiesURL)
    * [func TestWriteAfterHijack(t *testing.T)](#TestWriteAfterHijack)
    * [func TestWriteHeader0_h1(t *testing.T)](#TestWriteHeader0_h1)
    * [func TestWriteHeader0_h2(t *testing.T)](#TestWriteHeader0_h2)
    * [func TestWriteHeaderNoCodeCheck_h1(t *testing.T)](#TestWriteHeaderNoCodeCheck_h1)
    * [func TestWriteHeaderNoCodeCheck_h1hijack(t *testing.T)](#TestWriteHeaderNoCodeCheck_h1hijack)
    * [func TestWriteHeaderNoCodeCheck_h2(t *testing.T)](#TestWriteHeaderNoCodeCheck_h2)
    * [func TestZeroLengthPostAndResponse_h1(t *testing.T)](#TestZeroLengthPostAndResponse_h1)
    * [func TestZeroLengthPostAndResponse_h2(t *testing.T)](#TestZeroLengthPostAndResponse_h2)
    * [func Test_scanETag(t *testing.T)](#Test_scanETag)
    * [func afterTest(t testing.TB)](#afterTest)
    * [func benchmarkClientServerParallel(b *testing.B, parallelism int, useTLS bool)](#benchmarkClientServerParallel)
    * [func benchmarkFileAndServer(b *testing.B, n int64)](#benchmarkFileAndServer)
    * [func benchmarkHandler(b *testing.B, h Handler)](#benchmarkHandler)
    * [func benchmarkReadRequest(b *testing.B, request string)](#benchmarkReadRequest)
    * [func benchmarkServeMux(b *testing.B, runHandler bool)](#benchmarkServeMux)
    * [func checkQueryStringHandler(w ResponseWriter, r *Request)](#checkQueryStringHandler)
    * [func containsDotFile(name string) bool](#containsDotFile)
    * [func doFetchCheckPanic(tr *Transport, req *Request) (res *Response, err error, panicked bool)](#doFetchCheckPanic)
    * [func fetchWireResponse(host string, http1ReqBody []byte) ([]byte, error)](#fetchWireResponse)
    * [func get(t *testing.T, c *Client, url string) string](#get)
    * [func getBody(t *testing.T, testName string, req Request, client *Client) (*Response, []byte)](#getBody)
    * [func getNoBody(urlStr string) (*Response, error)](#getNoBody)
    * [func goroutineLeaked() bool](#goroutineLeaked)
    * [func h12requestContentLength(t *testing.T, bodyfn func() io.Reader, wantLen int64)](#h12requestContentLength)
    * [func handleTLSProtocol09(srv *Server, conn *tls.Conn, h Handler)](#handleTLSProtocol09)
    * [func interestingGoroutines() (gs []string)](#interestingGoroutines)
    * [func matchReturnedCookies(t *testing.T, expected, given []*Cookie)](#matchReturnedCookies)
    * [func mostlyCopy(r *Response) *Response](#mostlyCopy)
    * [func mustRemoveAll(dir string)](#mustRemoveAll)
    * [func mustStat(t *testing.T, fileName string) fs.FileInfo](#mustStat)
    * [func newLocalListener(t *testing.T) net.Listener](#newLocalListener)
    * [func newPeopleHandler() http.Handler](#newPeopleHandler)
    * [func newTestMultipartRequest(t *testing.T) *Request](#newTestMultipartRequest)
    * [func optWithServerLog(lg *log.Logger) func(*httptest.Server)](#optWithServerLog)
    * [func pedanticReadAll(r io.Reader) (b []byte, err error)](#pedanticReadAll)
    * [func removeCommonLines(a, b string) (asuffix, bsuffix string, commonLines int)](#removeCommonLines)
    * [func reqBytes(req string) []byte](#reqBytes)
    * [func runFileAndServerBenchmarks(b *testing.B, tlsOption bool, f *os.File, n int64)](#runFileAndServerBenchmarks)
    * [func runTimeSensitiveTest(t *testing.T, durations []time.Duration, test func(t *testing.T, d time.Duration) error)](#runTimeSensitiveTest)
    * [func runningBenchmarks() bool](#runningBenchmarks)
    * [func send204(w ResponseWriter, r *Request)](#send204)
    * [func send304(w ResponseWriter, r *Request)](#send304)
    * [func serve(code int) HandlerFunc](#serve)
    * [func setParallel(t *testing.T)](#setParallel)
    * [func skipIfDNSHijacked(t *testing.T)](#skipIfDNSHijacked)
    * [func test304Responses(t *testing.T, h2 bool)](#test304Responses)
    * [func testAutomaticHTTP2_ListenAndServe(t *testing.T, tlsConf *tls.Config)](#testAutomaticHTTP2_ListenAndServe)
    * [func testAutomaticHTTP2_Serve(t *testing.T, tlsConf *tls.Config, wantH2 bool)](#testAutomaticHTTP2_Serve)
    * [func testCancelRequestMidBody(t *testing.T, h2 bool)](#testCancelRequestMidBody)
    * [func testCancelRequestWithChannelBeforeDo(t *testing.T, withCtx bool)](#testCancelRequestWithChannelBeforeDo)
    * [func testCaseSensitiveMethod(t *testing.T, h2 bool)](#testCaseSensitiveMethod)
    * [func testChunkedResponseHeaders(t *testing.T, h2 bool)](#testChunkedResponseHeaders)
    * [func testClientDoCanceledVsTimeout(t *testing.T, h2 bool)](#testClientDoCanceledVsTimeout)
    * [func testClientHead(t *testing.T, h2 bool)](#testClientHead)
    * [func testClientHeadContentLength(t *testing.T, h2 bool)](#testClientHeadContentLength)
    * [func testClientRedirectEatsBody(t *testing.T, h2 bool)](#testClientRedirectEatsBody)
    * [func testClientTimeout(t *testing.T, h2 bool)](#testClientTimeout)
    * [func testClientTimeout_Headers(t *testing.T, h2 bool)](#testClientTimeout_Headers)
    * [func testCloseIdleConnections(t *testing.T, h2 bool)](#testCloseIdleConnections)
    * [func testConcurrentReadWriteReqBody(t *testing.T, h2 bool)](#testConcurrentReadWriteReqBody)
    * [func testConnectRequest(t *testing.T, h2 bool)](#testConnectRequest)
    * [func testContentEncodingNoSniffing(t *testing.T, h2 bool)](#testContentEncodingNoSniffing)
    * [func testContentTypeWithVariousSources(t *testing.T, h2 bool)](#testContentTypeWithVariousSources)
    * [func testH12_noBody(t *testing.T, status int)](#testH12_noBody)
    * [func testHTTP2NoWriteDeadline(timeout time.Duration) error](#testHTTP2NoWriteDeadline)
    * [func testHTTP2WriteDeadlineEnforcedPerStream(timeout time.Duration) error](#testHTTP2WriteDeadlineEnforcedPerStream)
    * [func testHandlerBodyClose(t *testing.T, i int, tt handlerBodyCloseTest)](#testHandlerBodyClose)
    * [func testHandlerPanic(t *testing.T, withHijack, h2 bool, wrapper func(Handler) Handler, panicValue interface{})](#testHandlerPanic)
    * [func testHandlerSetsBodyNil(t *testing.T, h2 bool)](#testHandlerSetsBodyNil)
    * [func testHeadResponses(t *testing.T, h2 bool)](#testHeadResponses)
    * [func testInterruptWithPanic(t *testing.T, h2 bool, panicValue interface{})](#testInterruptWithPanic)
    * [func testMissingFile(t *testing.T, req *Request)](#testMissingFile)
    * [func testMultipartFile(t *testing.T, req *Request, key, expectFilename, expectContent string) multipart.File](#testMultipartFile)
    * [func testNoPanicWithBasicAuth(t *testing.T, h2 bool)](#testNoPanicWithBasicAuth)
    * [func testNoSniffExpectRequestBody(t *testing.T, h2 bool)](#testNoSniffExpectRequestBody)
    * [func testProxyForRequest(t *testing.T, tt proxyFromEnvTest, proxyForRequest func(req *Request) (*url.URL, error))](#testProxyForRequest)
    * [func testQuerySemicolon(t *testing.T, query string, wantX string, allowSemicolons, expectWarning bool)](#testQuerySemicolon)
    * [func testRedirect(t *testing.T, h2 bool)](#testRedirect)
    * [func testRedirectsByMethod(t *testing.T, method string, table []redirectTest, want string)](#testRedirectsByMethod)
    * [func testRequestBodyLimit(t *testing.T, h2 bool)](#testRequestBodyLimit)
    * [func testRequestLimit(t *testing.T, h2 bool)](#testRequestLimit)
    * [func testResponseBodyReadAfterClose(t *testing.T, h2 bool)](#testResponseBodyReadAfterClose)
    * [func testServeFileRejectsInvalidSuffixLengths(t *testing.T, h2 bool)](#testServeFileRejectsInvalidSuffixLengths)
    * [func testServeFileWithContentEncoding(t *testing.T, h2 bool)](#testServeFileWithContentEncoding)
    * [func testServerContentType(t *testing.T, h2 bool)](#testServerContentType)
    * [func testServerContext_LocalAddrContextKey(t *testing.T, h2 bool)](#testServerContext_LocalAddrContextKey)
    * [func testServerContext_ServerContextKey(t *testing.T, h2 bool)](#testServerContext_ServerContextKey)
    * [func testServerEmptyBodyRace(t *testing.T, h2 bool)](#testServerEmptyBodyRace)
    * [func testServerIssue5953(t *testing.T, h2 bool)](#testServerIssue5953)
    * [func testServerKeepAlivesEnabled(t *testing.T, h2 bool)](#testServerKeepAlivesEnabled)
    * [func testServerNoHeader(t *testing.T, h2 bool, header string)](#testServerNoHeader)
    * [func testServerReaderFromOrder(t *testing.T, h2 bool)](#testServerReaderFromOrder)
    * [func testServerRequestContextCancel_ServeHTTPDone(t *testing.T, h2 bool)](#testServerRequestContextCancel_ServeHTTPDone)
    * [func testServerShutdown(t *testing.T, h2 bool)](#testServerShutdown)
    * [func testServerTimeouts(timeout time.Duration) error](#testServerTimeouts)
    * [func testServerUndeclaredTrailers(t *testing.T, h2 bool)](#testServerUndeclaredTrailers)
    * [func testSetsRemoteAddr(t *testing.T, h2 bool)](#testSetsRemoteAddr)
    * [func testSniffWriteSize(t *testing.T, h2 bool)](#testSniffWriteSize)
    * [func testStarRequest(t *testing.T, method string, h2 bool)](#testStarRequest)
    * [func testStreamingGet(t *testing.T, h2 bool)](#testStreamingGet)
    * [func testTCPConnectionCloses(t *testing.T, req string, h Handler)](#testTCPConnectionCloses)
    * [func testTCPConnectionStaysOpen(t *testing.T, req string, handler Handler)](#testTCPConnectionStaysOpen)
    * [func testTimeoutHandler(t *testing.T, h2 bool)](#testTimeoutHandler)
    * [func testTrailersClientToServer(t *testing.T, h2 bool)](#testTrailersClientToServer)
    * [func testTrailersServerToClient(t *testing.T, h2, flush bool)](#testTrailersServerToClient)
    * [func testTransportAndServerSharedBodyRace(t *testing.T, h2 bool)](#testTransportAndServerSharedBodyRace)
    * [func testTransportAutoHTTP(t *testing.T, tr *Transport, wantH2 bool)](#testTransportAutoHTTP)
    * [func testTransportCancelRequestInDo(t *testing.T, body io.Reader)](#testTransportCancelRequestInDo)
    * [func testTransportEventTrace(t *testing.T, h2 bool, noHooks bool)](#testTransportEventTrace)
    * [func testTransportGCRequest(t *testing.T, h2, body bool)](#testTransportGCRequest)
    * [func testTransportIDNA(t *testing.T, h2 bool)](#testTransportIDNA)
    * [func testTransportIdleConnTimeout(t *testing.T, h2 bool)](#testTransportIdleConnTimeout)
    * [func testTransportRace(req *Request)](#testTransportRace)
    * [func testTransportRejectsInvalidHeaders(t *testing.T, h2 bool)](#testTransportRejectsInvalidHeaders)
    * [func testTransportReuseConnection_Gzip(t *testing.T, chunked bool)](#testTransportReuseConnection_Gzip)
    * [func testTransportUserAgent(t *testing.T, h2 bool)](#testTransportUserAgent)
    * [func testWriteHeader0(t *testing.T, h2 bool)](#testWriteHeader0)
    * [func testWriteHeaderAfterWrite(t *testing.T, h2, hijack bool)](#testWriteHeaderAfterWrite)
    * [func testZeroLengthPostAndResponse(t *testing.T, h2 bool)](#testZeroLengthPostAndResponse)
    * [func tryTimeouts(t *testing.T, testFunc func(timeout time.Duration) error)](#tryTimeouts)
    * [func validateTestMultipartContents(t *testing.T, req *Request, allMem bool)](#validateTestMultipartContents)
    * [func waitCondition(waitFor, checkEvery time.Duration, fn func() bool) bool](#waitCondition)
    * [func waitErrCondition(waitFor, checkEvery time.Duration, fn func() error) error](#waitErrCondition)
    * [func waitNumGoroutine(nmax int) int](#waitNumGoroutine)
    * [func wantBody(res *Response, err error, want string) error](#wantBody)


## <a id="const" href="#const">Constants</a>

```
tags: [package private]
```

### <a id="boundary" href="#boundary">const boundary</a>

```
searchKey: http_test.boundary
tags: [constant string private]
```

```Go
const boundary = `MyBoundary`
```

### <a id="fileaContents" href="#fileaContents">const fileaContents</a>

```
searchKey: http_test.fileaContents
tags: [constant string private]
```

```Go
const fileaContents = "This is a test file."
```

### <a id="filebContents" href="#filebContents">const filebContents</a>

```
searchKey: http_test.filebContents
tags: [constant string private]
```

```Go
const filebContents = "Another test file."
```

### <a id="h1Mode" href="#h1Mode">const h1Mode</a>

```
searchKey: http_test.h1Mode
tags: [constant boolean private]
```

```Go
const h1Mode = false
```

### <a id="h2Mode" href="#h2Mode">const h2Mode</a>

```
searchKey: http_test.h2Mode
tags: [constant boolean private]
```

```Go
const h2Mode = true
```

### <a id="message" href="#message">const message</a>

```
searchKey: http_test.message
tags: [constant string private]
```

```Go
const message = ...
```

### <a id="noTLS" href="#noTLS">const noTLS</a>

```
searchKey: http_test.noTLS
tags: [constant boolean private]
```

```Go
const noTLS = false
```

### <a id="someResponse" href="#someResponse">const someResponse</a>

```
searchKey: http_test.someResponse
tags: [constant string private]
```

```Go
const someResponse = "<html>some response</html>"
```

### <a id="testFile" href="#testFile">const testFile</a>

```
searchKey: http_test.testFile
tags: [constant string private]
```

```Go
const testFile = "testdata/file"
```

### <a id="testFileLen" href="#testFileLen">const testFileLen</a>

```
searchKey: http_test.testFileLen
tags: [constant number private]
```

```Go
const testFileLen = 11
```

### <a id="textaValue" href="#textaValue">const textaValue</a>

```
searchKey: http_test.textaValue
tags: [constant string private]
```

```Go
const textaValue = "foo"
```

### <a id="textbValue" href="#textbValue">const textbValue</a>

```
searchKey: http_test.textbValue
tags: [constant string private]
```

```Go
const textbValue = "bar"
```

### <a id="withTLS" href="#withTLS">const withTLS</a>

```
searchKey: http_test.withTLS
tags: [constant boolean private]
```

```Go
const withTLS = true
```

## <a id="var" href="#var">Variables</a>

```
tags: [package private]
```

### <a id="ServeFileRangeTests" href="#ServeFileRangeTests">var ServeFileRangeTests</a>

```
searchKey: http_test.ServeFileRangeTests
tags: [variable array struct private]
```

```Go
var ServeFileRangeTests = ...
```

### <a id="echoCookiesRedirectHandler" href="#echoCookiesRedirectHandler">var echoCookiesRedirectHandler</a>

```
searchKey: http_test.echoCookiesRedirectHandler
tags: [variable function private]
```

```Go
var echoCookiesRedirectHandler = ...
```

### <a id="errFakeRoundTrip" href="#errFakeRoundTrip">var errFakeRoundTrip</a>

```
searchKey: http_test.errFakeRoundTrip
tags: [variable interface private]
```

```Go
var errFakeRoundTrip = errors.New("fake roundtrip")
```

### <a id="expectedCookies" href="#expectedCookies">var expectedCookies</a>

```
searchKey: http_test.expectedCookies
tags: [variable array struct private]
```

```Go
var expectedCookies = ...
```

### <a id="fsRedirectTestData" href="#fsRedirectTestData">var fsRedirectTestData</a>

```
searchKey: http_test.fsRedirectTestData
tags: [variable array struct private]
```

```Go
var fsRedirectTestData = ...
```

### <a id="getBasicAuthTests" href="#getBasicAuthTests">var getBasicAuthTests</a>

```
searchKey: http_test.getBasicAuthTests
tags: [variable array struct private]
```

```Go
var getBasicAuthTests = ...
```

### <a id="handlerBodyCloseTests" href="#handlerBodyCloseTests">var handlerBodyCloseTests</a>

```
searchKey: http_test.handlerBodyCloseTests
tags: [variable array struct private]
```

```Go
var handlerBodyCloseTests = ...
```

### <a id="handlers" href="#handlers">var handlers</a>

```
searchKey: http_test.handlers
tags: [variable array struct private]
```

```Go
var handlers = ...
```

### <a id="hostPortHandler" href="#hostPortHandler">var hostPortHandler</a>

```
searchKey: http_test.hostPortHandler
tags: [variable function private]
```

```Go
var hostPortHandler = ...
```

hostPortHandler writes back the client's "host:port". 

### <a id="isDNSHijacked" href="#isDNSHijacked">var isDNSHijacked</a>

```
searchKey: http_test.isDNSHijacked
tags: [variable boolean private]
```

```Go
var isDNSHijacked bool
```

### <a id="isDNSHijackedOnce" href="#isDNSHijackedOnce">var isDNSHijackedOnce</a>

```
searchKey: http_test.isDNSHijackedOnce
tags: [variable struct private]
```

```Go
var isDNSHijackedOnce sync.Once
```

### <a id="newRequestHostTests" href="#newRequestHostTests">var newRequestHostTests</a>

```
searchKey: http_test.newRequestHostTests
tags: [variable array struct private]
```

```Go
var newRequestHostTests = ...
```

### <a id="optQuietLog" href="#optQuietLog">var optQuietLog</a>

```
searchKey: http_test.optQuietLog
tags: [variable function private]
```

```Go
var optQuietLog = func(ts *httptest.Server) {
	ts.Config.ErrorLog = quietLog
}
```

### <a id="parseBasicAuthTests" href="#parseBasicAuthTests">var parseBasicAuthTests</a>

```
searchKey: http_test.parseBasicAuthTests
tags: [variable array struct private]
```

```Go
var parseBasicAuthTests = ...
```

### <a id="parseHTTPVersionTests" href="#parseHTTPVersionTests">var parseHTTPVersionTests</a>

```
searchKey: http_test.parseHTTPVersionTests
tags: [variable array struct private]
```

```Go
var parseHTTPVersionTests = ...
```

### <a id="proxyFromEnvTests" href="#proxyFromEnvTests">var proxyFromEnvTests</a>

```
searchKey: http_test.proxyFromEnvTests
tags: [variable array struct private]
```

```Go
var proxyFromEnvTests = ...
```

### <a id="quietLog" href="#quietLog">var quietLog</a>

```
searchKey: http_test.quietLog
tags: [variable struct private]
```

```Go
var quietLog = log.New(io.Discard, "", 0)
```

### <a id="readRequestErrorTests" href="#readRequestErrorTests">var readRequestErrorTests</a>

```
searchKey: http_test.readRequestErrorTests
tags: [variable array struct private]
```

```Go
var readRequestErrorTests = ...
```

### <a id="response" href="#response">var response</a>

```
searchKey: http_test.response
tags: [variable array number private]
```

```Go
var response = bytes.Repeat([]byte(someResponse), 2<<10/len(someResponse))
```

A Response that's just no bigger than 2KB, the buffer-before-chunking threshold. 

### <a id="rgz" href="#rgz">var rgz</a>

```
searchKey: http_test.rgz
tags: [variable array number private]
```

```Go
var rgz = ...
```

rgz is a gzip quine that uncompresses to itself. 

### <a id="robotsTxtHandler" href="#robotsTxtHandler">var robotsTxtHandler</a>

```
searchKey: http_test.robotsTxtHandler
tags: [variable function private]
```

```Go
var robotsTxtHandler = ...
```

### <a id="roundTripTests" href="#roundTripTests">var roundTripTests</a>

```
searchKey: http_test.roundTripTests
tags: [variable array struct private]
```

```Go
var roundTripTests = ...
```

### <a id="serveMuxRegister" href="#serveMuxRegister">var serveMuxRegister</a>

```
searchKey: http_test.serveMuxRegister
tags: [variable array struct private]
```

```Go
var serveMuxRegister = ...
```

### <a id="serveMuxTests" href="#serveMuxTests">var serveMuxTests</a>

```
searchKey: http_test.serveMuxTests
tags: [variable array struct private]
```

```Go
var serveMuxTests = ...
```

### <a id="serveMuxTests2" href="#serveMuxTests2">var serveMuxTests2</a>

```
searchKey: http_test.serveMuxTests2
tags: [variable array struct private]
```

```Go
var serveMuxTests2 = ...
```

### <a id="serverExpectTests" href="#serverExpectTests">var serverExpectTests</a>

```
searchKey: http_test.serverExpectTests
tags: [variable array struct private]
```

```Go
var serverExpectTests = ...
```

### <a id="sniffTests" href="#sniffTests">var sniffTests</a>

```
searchKey: http_test.sniffTests
tags: [variable array struct private]
```

```Go
var sniffTests = ...
```

### <a id="testHandlerBodyConsumers" href="#testHandlerBodyConsumers">var testHandlerBodyConsumers</a>

```
searchKey: http_test.testHandlerBodyConsumers
tags: [variable array struct private]
```

```Go
var testHandlerBodyConsumers = ...
```

### <a id="timeoutProtoErr" href="#timeoutProtoErr">var timeoutProtoErr</a>

```
searchKey: http_test.timeoutProtoErr
tags: [variable interface private]
```

```Go
var timeoutProtoErr = errors.New("canceled as expected")
```

### <a id="vtests" href="#vtests">var vtests</a>

```
searchKey: http_test.vtests
tags: [variable array struct private]
```

```Go
var vtests = ...
```

## <a id="type" href="#type">Types</a>

```
tags: [package private]
```

### <a id="RecordingJar" href="#RecordingJar">type RecordingJar struct</a>

```
searchKey: http_test.RecordingJar
tags: [struct private]
```

```Go
type RecordingJar struct {
	mu  sync.Mutex
	log bytes.Buffer
}
```

RecordingJar keeps a log of calls made to it, without tracking any cookies. 

#### <a id="RecordingJar.Cookies" href="#RecordingJar.Cookies">func (j *RecordingJar) Cookies(u *url.URL) []*Cookie</a>

```
searchKey: http_test.RecordingJar.Cookies
tags: [method private]
```

```Go
func (j *RecordingJar) Cookies(u *url.URL) []*Cookie
```

#### <a id="RecordingJar.SetCookies" href="#RecordingJar.SetCookies">func (j *RecordingJar) SetCookies(u *url.URL, cookies []*Cookie)</a>

```
searchKey: http_test.RecordingJar.SetCookies
tags: [method private]
```

```Go
func (j *RecordingJar) SetCookies(u *url.URL, cookies []*Cookie)
```

#### <a id="RecordingJar.logf" href="#RecordingJar.logf">func (j *RecordingJar) logf(format string, args ...interface{})</a>

```
searchKey: http_test.RecordingJar.logf
tags: [method private]
```

```Go
func (j *RecordingJar) logf(format string, args ...interface{})
```

### <a id="TestJar" href="#TestJar">type TestJar struct</a>

```
searchKey: http_test.TestJar
tags: [struct private]
```

```Go
type TestJar struct {
	m      sync.Mutex
	perURL map[string][]*Cookie
}
```

Just enough correctness for our redirect tests. Uses the URL.Host as the scope of all cookies. 

#### <a id="TestJar.Cookies" href="#TestJar.Cookies">func (j *TestJar) Cookies(u *url.URL) []*Cookie</a>

```
searchKey: http_test.TestJar.Cookies
tags: [method private]
```

```Go
func (j *TestJar) Cookies(u *url.URL) []*Cookie
```

#### <a id="TestJar.SetCookies" href="#TestJar.SetCookies">func (j *TestJar) SetCookies(u *url.URL, cookies []*Cookie)</a>

```
searchKey: http_test.TestJar.SetCookies
tags: [method private]
```

```Go
func (j *TestJar) SetCookies(u *url.URL, cookies []*Cookie)
```

### <a id="apiHandler" href="#apiHandler">type apiHandler struct{}</a>

```
searchKey: http_test.apiHandler
tags: [struct private]
```

```Go
type apiHandler struct{}
```

#### <a id="apiHandler.ServeHTTP" href="#apiHandler.ServeHTTP">func (apiHandler) ServeHTTP(http.ResponseWriter, *http.Request)</a>

```
searchKey: http_test.apiHandler.ServeHTTP
tags: [method private]
```

```Go
func (apiHandler) ServeHTTP(http.ResponseWriter, *http.Request)
```

### <a id="basicAuthCredentialsTest" href="#basicAuthCredentialsTest">type basicAuthCredentialsTest struct</a>

```
searchKey: http_test.basicAuthCredentialsTest
tags: [struct private]
```

```Go
type basicAuthCredentialsTest struct {
	username, password string
}
```

### <a id="blockingRemoteAddrConn" href="#blockingRemoteAddrConn">type blockingRemoteAddrConn struct</a>

```
searchKey: http_test.blockingRemoteAddrConn
tags: [struct private]
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
tags: [function private]
```

```Go
func (c *blockingRemoteAddrConn) RemoteAddr() net.Addr
```

### <a id="blockingRemoteAddrListener" href="#blockingRemoteAddrListener">type blockingRemoteAddrListener struct</a>

```
searchKey: http_test.blockingRemoteAddrListener
tags: [struct private]
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
tags: [function private]
```

```Go
func (l *blockingRemoteAddrListener) Accept() (net.Conn, error)
```

### <a id="bodyCloser" href="#bodyCloser">type bodyCloser bool</a>

```
searchKey: http_test.bodyCloser
tags: [boolean private]
```

```Go
type bodyCloser bool
```

#### <a id="bodyCloser.Close" href="#bodyCloser.Close">func (bc *bodyCloser) Close() error</a>

```
searchKey: http_test.bodyCloser.Close
tags: [function private]
```

```Go
func (bc *bodyCloser) Close() error
```

#### <a id="bodyCloser.Read" href="#bodyCloser.Read">func (bc *bodyCloser) Read(b []byte) (n int, err error)</a>

```
searchKey: http_test.bodyCloser.Read
tags: [method private]
```

```Go
func (bc *bodyCloser) Read(b []byte) (n int, err error)
```

### <a id="breakableConn" href="#breakableConn">type breakableConn struct</a>

```
searchKey: http_test.breakableConn
tags: [struct private]
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
tags: [method private]
```

```Go
func (w *breakableConn) Write(b []byte) (n int, err error)
```

### <a id="brokenState" href="#brokenState">type brokenState struct</a>

```
searchKey: http_test.brokenState
tags: [struct private]
```

```Go
type brokenState struct {
	sync.Mutex
	broken bool
}
```

### <a id="byteAtATimeReader" href="#byteAtATimeReader">type byteAtATimeReader struct</a>

```
searchKey: http_test.byteAtATimeReader
tags: [struct private]
```

```Go
type byteAtATimeReader struct {
	buf []byte
}
```

#### <a id="byteAtATimeReader.Read" href="#byteAtATimeReader.Read">func (b *byteAtATimeReader) Read(p []byte) (n int, err error)</a>

```
searchKey: http_test.byteAtATimeReader.Read
tags: [method private]
```

```Go
func (b *byteAtATimeReader) Read(p []byte) (n int, err error)
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
tags: [method private]
```

```Go
func (c byteFromChanReader) Read(p []byte) (n int, err error)
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
tags: [method private]
```

```Go
func (w chanWriter) Write(p []byte) (n int, err error)
```

### <a id="clientServerTest" href="#clientServerTest">type clientServerTest struct</a>

```
searchKey: http_test.clientServerTest
tags: [struct private]
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
tags: [method private]
```

```Go
func newClientServerTest(t *testing.T, h2 bool, h Handler, opts ...interface{}) *clientServerTest
```

#### <a id="clientServerTest.close" href="#clientServerTest.close">func (t *clientServerTest) close()</a>

```
searchKey: http_test.clientServerTest.close
tags: [function private]
```

```Go
func (t *clientServerTest) close()
```

#### <a id="clientServerTest.getURL" href="#clientServerTest.getURL">func (t *clientServerTest) getURL(u string) string</a>

```
searchKey: http_test.clientServerTest.getURL
tags: [method private]
```

```Go
func (t *clientServerTest) getURL(u string) string
```

#### <a id="clientServerTest.scheme" href="#clientServerTest.scheme">func (t *clientServerTest) scheme() string</a>

```
searchKey: http_test.clientServerTest.scheme
tags: [function private]
```

```Go
func (t *clientServerTest) scheme() string
```

### <a id="closeWriteTestConn" href="#closeWriteTestConn">type closeWriteTestConn struct</a>

```
searchKey: http_test.closeWriteTestConn
tags: [struct private]
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
tags: [function private]
```

```Go
func (c *closeWriteTestConn) CloseWrite() error
```

### <a id="closerFunc" href="#closerFunc">type closerFunc func() error</a>

```
searchKey: http_test.closerFunc
tags: [function private]
```

```Go
type closerFunc func() error
```

#### <a id="closerFunc.Close" href="#closerFunc.Close">func (f closerFunc) Close() error</a>

```
searchKey: http_test.closerFunc.Close
tags: [function private]
```

```Go
func (f closerFunc) Close() error
```

### <a id="contextCounter" href="#contextCounter">type contextCounter struct</a>

```
searchKey: http_test.contextCounter
tags: [struct private]
```

```Go
type contextCounter struct {
	mu   sync.Mutex
	live int64
}
```

#### <a id="contextCounter.Read" href="#contextCounter.Read">func (cc *contextCounter) Read() (live int64)</a>

```
searchKey: http_test.contextCounter.Read
tags: [function private]
```

```Go
func (cc *contextCounter) Read() (live int64)
```

#### <a id="contextCounter.Track" href="#contextCounter.Track">func (cc *contextCounter) Track(ctx context.Context) context.Context</a>

```
searchKey: http_test.contextCounter.Track
tags: [method private]
```

```Go
func (cc *contextCounter) Track(ctx context.Context) context.Context
```

#### <a id="contextCounter.decrement" href="#contextCounter.decrement">func (cc *contextCounter) decrement(*countedContext)</a>

```
searchKey: http_test.contextCounter.decrement
tags: [method private]
```

```Go
func (cc *contextCounter) decrement(*countedContext)
```

### <a id="countCloseListener" href="#countCloseListener">type countCloseListener struct</a>

```
searchKey: http_test.countCloseListener
tags: [struct private]
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
tags: [function private]
```

```Go
func (p *countCloseListener) Close() error
```

### <a id="countCloseReader" href="#countCloseReader">type countCloseReader struct</a>

```
searchKey: http_test.countCloseReader
tags: [struct private]
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
tags: [function private]
```

```Go
func (cr countCloseReader) Close() error
```

### <a id="countHandler" href="#countHandler">type countHandler struct</a>

```
searchKey: http_test.countHandler
tags: [struct private]
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
tags: [method private]
```

```Go
func (h *countHandler) ServeHTTP(w http.ResponseWriter, r *http.Request)
```

### <a id="countReader" href="#countReader">type countReader struct</a>

```
searchKey: http_test.countReader
tags: [struct private]
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
tags: [method private]
```

```Go
func (cr countReader) Read(p []byte) (n int, err error)
```

### <a id="countedConn" href="#countedConn">type countedConn struct</a>

```
searchKey: http_test.countedConn
tags: [struct private]
```

```Go
type countedConn struct {
	net.Conn
}
```

A countedConn is a net.Conn that decrements an atomic counter when finalized. 

### <a id="countedContext" href="#countedContext">type countedContext struct</a>

```
searchKey: http_test.countedContext
tags: [struct private]
```

```Go
type countedContext struct {
	context.Context
}
```

### <a id="countingDialer" href="#countingDialer">type countingDialer struct</a>

```
searchKey: http_test.countingDialer
tags: [struct private]
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
tags: [method private]
```

```Go
func (d *countingDialer) DialContext(ctx context.Context, network, address string) (net.Conn, error)
```

#### <a id="countingDialer.Read" href="#countingDialer.Read">func (d *countingDialer) Read() (total, live int64)</a>

```
searchKey: http_test.countingDialer.Read
tags: [function private]
```

```Go
func (d *countingDialer) Read() (total, live int64)
```

#### <a id="countingDialer.decrement" href="#countingDialer.decrement">func (d *countingDialer) decrement(*countedConn)</a>

```
searchKey: http_test.countingDialer.decrement
tags: [method private]
```

```Go
func (d *countingDialer) decrement(*countedConn)
```

### <a id="delayedEOFReader" href="#delayedEOFReader">type delayedEOFReader struct</a>

```
searchKey: http_test.delayedEOFReader
tags: [struct private]
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
tags: [method private]
```

```Go
func (dr delayedEOFReader) Read(p []byte) (n int, err error)
```

### <a id="delegateReader" href="#delegateReader">type delegateReader struct</a>

```
searchKey: http_test.delegateReader
tags: [struct private]
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
tags: [method private]
```

```Go
func (r *delegateReader) Read(p []byte) (int, error)
```

### <a id="doneContext" href="#doneContext">type doneContext struct</a>

```
searchKey: http_test.doneContext
tags: [struct private]
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
tags: [function private]
```

```Go
func (doneContext) Done() <-chan struct{}
```

#### <a id="doneContext.Err" href="#doneContext.Err">func (d doneContext) Err() error</a>

```
searchKey: http_test.doneContext.Err
tags: [function private]
```

```Go
func (d doneContext) Err() error
```

### <a id="dotFileHidingFile" href="#dotFileHidingFile">type dotFileHidingFile struct</a>

```
searchKey: http_test.dotFileHidingFile
tags: [struct private]
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
tags: [method private]
```

```Go
func (f dotFileHidingFile) Readdir(n int) (fis []fs.FileInfo, err error)
```

Readdir is a wrapper around the Readdir method of the embedded File that filters out all files that start with a period in their name. 

### <a id="dotFileHidingFileSystem" href="#dotFileHidingFileSystem">type dotFileHidingFileSystem struct</a>

```
searchKey: http_test.dotFileHidingFileSystem
tags: [struct private]
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
tags: [method private]
```

```Go
func (fsys dotFileHidingFileSystem) Open(name string) (http.File, error)
```

Open is a wrapper around the Open method of the embedded FileSystem that serves a 403 permission error when name has a file or directory with whose name starts with a period in its path. 

### <a id="dummyAddr" href="#dummyAddr">type dummyAddr string</a>

```
searchKey: http_test.dummyAddr
tags: [string private]
```

```Go
type dummyAddr string
```

#### <a id="dummyAddr.Network" href="#dummyAddr.Network">func (a dummyAddr) Network() string</a>

```
searchKey: http_test.dummyAddr.Network
tags: [function private]
```

```Go
func (a dummyAddr) Network() string
```

#### <a id="dummyAddr.String" href="#dummyAddr.String">func (a dummyAddr) String() string</a>

```
searchKey: http_test.dummyAddr.String
tags: [function private]
```

```Go
func (a dummyAddr) String() string
```

### <a id="dumpConn" href="#dumpConn">type dumpConn struct</a>

```
searchKey: http_test.dumpConn
tags: [struct private]
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
tags: [function private]
```

```Go
func (c *dumpConn) Close() error
```

#### <a id="dumpConn.LocalAddr" href="#dumpConn.LocalAddr">func (c *dumpConn) LocalAddr() net.Addr</a>

```
searchKey: http_test.dumpConn.LocalAddr
tags: [function private]
```

```Go
func (c *dumpConn) LocalAddr() net.Addr
```

#### <a id="dumpConn.RemoteAddr" href="#dumpConn.RemoteAddr">func (c *dumpConn) RemoteAddr() net.Addr</a>

```
searchKey: http_test.dumpConn.RemoteAddr
tags: [function private]
```

```Go
func (c *dumpConn) RemoteAddr() net.Addr
```

#### <a id="dumpConn.SetDeadline" href="#dumpConn.SetDeadline">func (c *dumpConn) SetDeadline(t time.Time) error</a>

```
searchKey: http_test.dumpConn.SetDeadline
tags: [method private]
```

```Go
func (c *dumpConn) SetDeadline(t time.Time) error
```

#### <a id="dumpConn.SetReadDeadline" href="#dumpConn.SetReadDeadline">func (c *dumpConn) SetReadDeadline(t time.Time) error</a>

```
searchKey: http_test.dumpConn.SetReadDeadline
tags: [method private]
```

```Go
func (c *dumpConn) SetReadDeadline(t time.Time) error
```

#### <a id="dumpConn.SetWriteDeadline" href="#dumpConn.SetWriteDeadline">func (c *dumpConn) SetWriteDeadline(t time.Time) error</a>

```
searchKey: http_test.dumpConn.SetWriteDeadline
tags: [method private]
```

```Go
func (c *dumpConn) SetWriteDeadline(t time.Time) error
```

### <a id="eofListenerNotComparable" href="#eofListenerNotComparable">type eofListenerNotComparable []int</a>

```
searchKey: http_test.eofListenerNotComparable
tags: [array number private]
```

```Go
type eofListenerNotComparable []int
```

Listener for TestServerListenNotComparableListener. 

#### <a id="eofListenerNotComparable.Accept" href="#eofListenerNotComparable.Accept">func (eofListenerNotComparable) Accept() (net.Conn, error)</a>

```
searchKey: http_test.eofListenerNotComparable.Accept
tags: [function private]
```

```Go
func (eofListenerNotComparable) Accept() (net.Conn, error)
```

#### <a id="eofListenerNotComparable.Addr" href="#eofListenerNotComparable.Addr">func (eofListenerNotComparable) Addr() net.Addr</a>

```
searchKey: http_test.eofListenerNotComparable.Addr
tags: [function private]
```

```Go
func (eofListenerNotComparable) Addr() net.Addr
```

#### <a id="eofListenerNotComparable.Close" href="#eofListenerNotComparable.Close">func (eofListenerNotComparable) Close() error</a>

```
searchKey: http_test.eofListenerNotComparable.Close
tags: [function private]
```

```Go
func (eofListenerNotComparable) Close() error
```

### <a id="eofReaderFunc" href="#eofReaderFunc">type eofReaderFunc func()</a>

```
searchKey: http_test.eofReaderFunc
tags: [function private]
```

```Go
type eofReaderFunc func()
```

eofReaderFunc is an io.Reader that runs itself, and then returns io.EOF. 

#### <a id="eofReaderFunc.Read" href="#eofReaderFunc.Read">func (f eofReaderFunc) Read(p []byte) (n int, err error)</a>

```
searchKey: http_test.eofReaderFunc.Read
tags: [method private]
```

```Go
func (f eofReaderFunc) Read(p []byte) (n int, err error)
```

### <a id="errorListener" href="#errorListener">type errorListener struct</a>

```
searchKey: http_test.errorListener
tags: [struct private]
```

```Go
type errorListener struct {
	errs []error
}
```

#### <a id="errorListener.Accept" href="#errorListener.Accept">func (l *errorListener) Accept() (c net.Conn, err error)</a>

```
searchKey: http_test.errorListener.Accept
tags: [function private]
```

```Go
func (l *errorListener) Accept() (c net.Conn, err error)
```

#### <a id="errorListener.Addr" href="#errorListener.Addr">func (l *errorListener) Addr() net.Addr</a>

```
searchKey: http_test.errorListener.Addr
tags: [function private]
```

```Go
func (l *errorListener) Addr() net.Addr
```

#### <a id="errorListener.Close" href="#errorListener.Close">func (l *errorListener) Close() error</a>

```
searchKey: http_test.errorListener.Close
tags: [function private]
```

```Go
func (l *errorListener) Close() error
```

### <a id="fakeFS" href="#fakeFS">type fakeFS map[string]*http_test.fakeFileInfo</a>

```
searchKey: http_test.fakeFS
tags: [object private]
```

```Go
type fakeFS map[string]*fakeFileInfo
```

#### <a id="fakeFS.Open" href="#fakeFS.Open">func (fsys fakeFS) Open(name string) (File, error)</a>

```
searchKey: http_test.fakeFS.Open
tags: [method private]
```

```Go
func (fsys fakeFS) Open(name string) (File, error)
```

### <a id="fakeFile" href="#fakeFile">type fakeFile struct</a>

```
searchKey: http_test.fakeFile
tags: [struct private]
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
tags: [function private]
```

```Go
func (f *fakeFile) Close() error
```

#### <a id="fakeFile.Readdir" href="#fakeFile.Readdir">func (f *fakeFile) Readdir(count int) ([]fs.FileInfo, error)</a>

```
searchKey: http_test.fakeFile.Readdir
tags: [method private]
```

```Go
func (f *fakeFile) Readdir(count int) ([]fs.FileInfo, error)
```

#### <a id="fakeFile.Stat" href="#fakeFile.Stat">func (f *fakeFile) Stat() (fs.FileInfo, error)</a>

```
searchKey: http_test.fakeFile.Stat
tags: [function private]
```

```Go
func (f *fakeFile) Stat() (fs.FileInfo, error)
```

### <a id="fakeFileInfo" href="#fakeFileInfo">type fakeFileInfo struct</a>

```
searchKey: http_test.fakeFileInfo
tags: [struct private]
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

#### <a id="fakeFileInfo.IsDir" href="#fakeFileInfo.IsDir">func (f *fakeFileInfo) IsDir() bool</a>

```
searchKey: http_test.fakeFileInfo.IsDir
tags: [function private]
```

```Go
func (f *fakeFileInfo) IsDir() bool
```

#### <a id="fakeFileInfo.ModTime" href="#fakeFileInfo.ModTime">func (f *fakeFileInfo) ModTime() time.Time</a>

```
searchKey: http_test.fakeFileInfo.ModTime
tags: [function private]
```

```Go
func (f *fakeFileInfo) ModTime() time.Time
```

#### <a id="fakeFileInfo.Mode" href="#fakeFileInfo.Mode">func (f *fakeFileInfo) Mode() fs.FileMode</a>

```
searchKey: http_test.fakeFileInfo.Mode
tags: [function private]
```

```Go
func (f *fakeFileInfo) Mode() fs.FileMode
```

#### <a id="fakeFileInfo.Name" href="#fakeFileInfo.Name">func (f *fakeFileInfo) Name() string</a>

```
searchKey: http_test.fakeFileInfo.Name
tags: [function private]
```

```Go
func (f *fakeFileInfo) Name() string
```

#### <a id="fakeFileInfo.Size" href="#fakeFileInfo.Size">func (f *fakeFileInfo) Size() int64</a>

```
searchKey: http_test.fakeFileInfo.Size
tags: [function private]
```

```Go
func (f *fakeFileInfo) Size() int64
```

#### <a id="fakeFileInfo.Sys" href="#fakeFileInfo.Sys">func (f *fakeFileInfo) Sys() interface{}</a>

```
searchKey: http_test.fakeFileInfo.Sys
tags: [function private]
```

```Go
func (f *fakeFileInfo) Sys() interface{}
```

### <a id="fileServerCleanPathDir" href="#fileServerCleanPathDir">type fileServerCleanPathDir struct</a>

```
searchKey: http_test.fileServerCleanPathDir
tags: [struct private]
```

```Go
type fileServerCleanPathDir struct {
	log *[]string
}
```

#### <a id="fileServerCleanPathDir.Open" href="#fileServerCleanPathDir.Open">func (d fileServerCleanPathDir) Open(path string) (File, error)</a>

```
searchKey: http_test.fileServerCleanPathDir.Open
tags: [method private]
```

```Go
func (d fileServerCleanPathDir) Open(path string) (File, error)
```

### <a id="fooProto" href="#fooProto">type fooProto struct{}</a>

```
searchKey: http_test.fooProto
tags: [struct private]
```

```Go
type fooProto struct{}
```

#### <a id="fooProto.RoundTrip" href="#fooProto.RoundTrip">func (fooProto) RoundTrip(req *Request) (*Response, error)</a>

```
searchKey: http_test.fooProto.RoundTrip
tags: [method private]
```

```Go
func (fooProto) RoundTrip(req *Request) (*Response, error)
```

### <a id="funcConn" href="#funcConn">type funcConn struct</a>

```
searchKey: http_test.funcConn
tags: [struct private]
```

```Go
type funcConn struct {
	net.Conn
	read  func([]byte) (int, error)
	write func([]byte) (int, error)
}
```

#### <a id="funcConn.Close" href="#funcConn.Close">func (c funcConn) Close() error</a>

```
searchKey: http_test.funcConn.Close
tags: [function private]
```

```Go
func (c funcConn) Close() error
```

#### <a id="funcConn.Read" href="#funcConn.Read">func (c funcConn) Read(p []byte) (int, error)</a>

```
searchKey: http_test.funcConn.Read
tags: [method private]
```

```Go
func (c funcConn) Read(p []byte) (int, error)
```

#### <a id="funcConn.Write" href="#funcConn.Write">func (c funcConn) Write(p []byte) (int, error)</a>

```
searchKey: http_test.funcConn.Write
tags: [method private]
```

```Go
func (c funcConn) Write(p []byte) (int, error)
```

### <a id="funcRoundTripper" href="#funcRoundTripper">type funcRoundTripper func()</a>

```
searchKey: http_test.funcRoundTripper
tags: [function private]
```

```Go
type funcRoundTripper func()
```

#### <a id="funcRoundTripper.RoundTrip" href="#funcRoundTripper.RoundTrip">func (fn funcRoundTripper) RoundTrip(*Request) (*Response, error)</a>

```
searchKey: http_test.funcRoundTripper.RoundTrip
tags: [method private]
```

```Go
func (fn funcRoundTripper) RoundTrip(*Request) (*Response, error)
```

### <a id="funcWriter" href="#funcWriter">type funcWriter func([]byte) (int, error)</a>

```
searchKey: http_test.funcWriter
tags: [function private]
```

```Go
type funcWriter func([]byte) (int, error)
```

#### <a id="funcWriter.Write" href="#funcWriter.Write">func (f funcWriter) Write(p []byte) (int, error)</a>

```
searchKey: http_test.funcWriter.Write
tags: [method private]
```

```Go
func (f funcWriter) Write(p []byte) (int, error)
```

### <a id="getBasicAuthTest" href="#getBasicAuthTest">type getBasicAuthTest struct</a>

```
searchKey: http_test.getBasicAuthTest
tags: [struct private]
```

```Go
type getBasicAuthTest struct {
	username, password string
	ok                 bool
}
```

### <a id="h12Compare" href="#h12Compare">type h12Compare struct</a>

```
searchKey: http_test.h12Compare
tags: [struct private]
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

#### <a id="h12Compare.normalizeRes" href="#h12Compare.normalizeRes">func (tt h12Compare) normalizeRes(t *testing.T, res *Response, wantProto string)</a>

```
searchKey: http_test.h12Compare.normalizeRes
tags: [method private]
```

```Go
func (tt h12Compare) normalizeRes(t *testing.T, res *Response, wantProto string)
```

#### <a id="h12Compare.reqFunc" href="#h12Compare.reqFunc">func (tt h12Compare) reqFunc() reqFunc</a>

```
searchKey: http_test.h12Compare.reqFunc
tags: [function private]
```

```Go
func (tt h12Compare) reqFunc() reqFunc
```

#### <a id="h12Compare.run" href="#h12Compare.run">func (tt h12Compare) run(t *testing.T)</a>

```
searchKey: http_test.h12Compare.run
tags: [method private]
```

```Go
func (tt h12Compare) run(t *testing.T)
```

### <a id="handlerBodyCloseTest" href="#handlerBodyCloseTest">type handlerBodyCloseTest struct</a>

```
searchKey: http_test.handlerBodyCloseTest
tags: [struct private]
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
tags: [function private]
```

```Go
func (t handlerBodyCloseTest) connectionHeader() string
```

### <a id="handlerTest" href="#handlerTest">type handlerTest struct</a>

```
searchKey: http_test.handlerTest
tags: [struct private]
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
tags: [method private]
```

```Go
func newHandlerTest(h Handler) handlerTest
```

#### <a id="handlerTest.rawResponse" href="#handlerTest.rawResponse">func (ht *handlerTest) rawResponse(req string) string</a>

```
searchKey: http_test.handlerTest.rawResponse
tags: [method private]
```

```Go
func (ht *handlerTest) rawResponse(req string) string
```

### <a id="http09Writer" href="#http09Writer">type http09Writer struct</a>

```
searchKey: http_test.http09Writer
tags: [struct private]
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
tags: [function private]
```

```Go
func (w http09Writer) Header() Header
```

#### <a id="http09Writer.WriteHeader" href="#http09Writer.WriteHeader">func (w http09Writer) WriteHeader(int)</a>

```
searchKey: http_test.http09Writer.WriteHeader
tags: [method private]
```

```Go
func (w http09Writer) WriteHeader(int)
```

### <a id="infiniteReader" href="#infiniteReader">type infiniteReader struct</a>

```
searchKey: http_test.infiniteReader
tags: [struct private]
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
tags: [method private]
```

```Go
func (r *infiniteReader) Read(b []byte) (int, error)
```

### <a id="issue12991FS" href="#issue12991FS">type issue12991FS struct{}</a>

```
searchKey: http_test.issue12991FS
tags: [struct private]
```

```Go
type issue12991FS struct{}
```

#### <a id="issue12991FS.Open" href="#issue12991FS.Open">func (issue12991FS) Open(string) (File, error)</a>

```
searchKey: http_test.issue12991FS.Open
tags: [method private]
```

```Go
func (issue12991FS) Open(string) (File, error)
```

### <a id="issue12991File" href="#issue12991File">type issue12991File struct</a>

```
searchKey: http_test.issue12991File
tags: [struct private]
```

```Go
type issue12991File struct{ File }
```

#### <a id="issue12991File.Close" href="#issue12991File.Close">func (issue12991File) Close() error</a>

```
searchKey: http_test.issue12991File.Close
tags: [function private]
```

```Go
func (issue12991File) Close() error
```

#### <a id="issue12991File.Stat" href="#issue12991File.Stat">func (issue12991File) Stat() (fs.FileInfo, error)</a>

```
searchKey: http_test.issue12991File.Stat
tags: [function private]
```

```Go
func (issue12991File) Stat() (fs.FileInfo, error)
```

### <a id="issue15577Tripper" href="#issue15577Tripper">type issue15577Tripper struct{}</a>

```
searchKey: http_test.issue15577Tripper
tags: [struct private]
```

```Go
type issue15577Tripper struct{}
```

issue15577Tripper returns a Response with a redirect response header and doesn't populate its Response.Request field. 

#### <a id="issue15577Tripper.RoundTrip" href="#issue15577Tripper.RoundTrip">func (issue15577Tripper) RoundTrip(*Request) (*Response, error)</a>

```
searchKey: http_test.issue15577Tripper.RoundTrip
tags: [method private]
```

```Go
func (issue15577Tripper) RoundTrip(*Request) (*Response, error)
```

### <a id="issue18239Body" href="#issue18239Body">type issue18239Body struct</a>

```
searchKey: http_test.issue18239Body
tags: [struct private]
```

```Go
type issue18239Body struct {
	readCalls  *int32
	closeCalls *int32
	readErr    error
}
```

issue18239Body is an io.ReadCloser for TestTransportBodyReadError. Its Read returns readErr and increments *readCalls atomically. Its Close returns nil and increments *closeCalls atomically. 

#### <a id="issue18239Body.Close" href="#issue18239Body.Close">func (b issue18239Body) Close() error</a>

```
searchKey: http_test.issue18239Body.Close
tags: [function private]
```

```Go
func (b issue18239Body) Close() error
```

#### <a id="issue18239Body.Read" href="#issue18239Body.Read">func (b issue18239Body) Read([]byte) (int, error)</a>

```
searchKey: http_test.issue18239Body.Read
tags: [method private]
```

```Go
func (b issue18239Body) Read([]byte) (int, error)
```

### <a id="issue40382Body" href="#issue40382Body">type issue40382Body struct</a>

```
searchKey: http_test.issue40382Body
tags: [struct private]
```

```Go
type issue40382Body struct {
	t                *testing.T
	n                int
	closeCallsAtomic int32
}
```

issue40382Body is an io.ReadCloser for TestClientCallsCloseOnlyOnce. Its Read reads n bytes before returning io.EOF. Its Close returns nil but fails the test if called more than once. 

#### <a id="issue40382Body.Close" href="#issue40382Body.Close">func (b *issue40382Body) Close() error</a>

```
searchKey: http_test.issue40382Body.Close
tags: [function private]
```

```Go
func (b *issue40382Body) Close() error
```

#### <a id="issue40382Body.Read" href="#issue40382Body.Read">func (b *issue40382Body) Read(p []byte) (int, error)</a>

```
searchKey: http_test.issue40382Body.Read
tags: [method private]
```

```Go
func (b *issue40382Body) Read(p []byte) (int, error)
```

### <a id="lockedBytesBuffer" href="#lockedBytesBuffer">type lockedBytesBuffer struct</a>

```
searchKey: http_test.lockedBytesBuffer
tags: [struct private]
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
tags: [method private]
```

```Go
func (b *lockedBytesBuffer) Write(p []byte) (int, error)
```

### <a id="logWrites" href="#logWrites">type logWrites struct</a>

```
searchKey: http_test.logWrites
tags: [struct private]
```

```Go
type logWrites struct {
	t   *testing.T
	dst *[]string
}
```

#### <a id="logWrites.Write" href="#logWrites.Write">func (l logWrites) Write(p []byte) (n int, err error)</a>

```
searchKey: http_test.logWrites.Write
tags: [method private]
```

```Go
func (l logWrites) Write(p []byte) (n int, err error)
```

#### <a id="logWrites.WriteByte" href="#logWrites.WriteByte">func (l logWrites) WriteByte(c byte) error</a>

```
searchKey: http_test.logWrites.WriteByte
tags: [method private]
```

```Go
func (l logWrites) WriteByte(c byte) error
```

### <a id="logWritesConn" href="#logWritesConn">type logWritesConn struct</a>

```
searchKey: http_test.logWritesConn
tags: [struct private]
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

#### <a id="logWritesConn.Close" href="#logWritesConn.Close">func (c *logWritesConn) Close() error</a>

```
searchKey: http_test.logWritesConn.Close
tags: [function private]
```

```Go
func (c *logWritesConn) Close() error
```

#### <a id="logWritesConn.Read" href="#logWritesConn.Read">func (c *logWritesConn) Read(p []byte) (n int, err error)</a>

```
searchKey: http_test.logWritesConn.Read
tags: [method private]
```

```Go
func (c *logWritesConn) Read(p []byte) (n int, err error)
```

#### <a id="logWritesConn.Write" href="#logWritesConn.Write">func (c *logWritesConn) Write(p []byte) (n int, err error)</a>

```
searchKey: http_test.logWritesConn.Write
tags: [method private]
```

```Go
func (c *logWritesConn) Write(p []byte) (n int, err error)
```

### <a id="neverEnding" href="#neverEnding">type neverEnding byte</a>

```
searchKey: http_test.neverEnding
tags: [number private]
```

```Go
type neverEnding byte
```

#### <a id="neverEnding.Read" href="#neverEnding.Read">func (b neverEnding) Read(p []byte) (n int, err error)</a>

```
searchKey: http_test.neverEnding.Read
tags: [method private]
```

```Go
func (b neverEnding) Read(p []byte) (n int, err error)
```

### <a id="nilBodyRoundTripper" href="#nilBodyRoundTripper">type nilBodyRoundTripper struct{}</a>

```
searchKey: http_test.nilBodyRoundTripper
tags: [struct private]
```

```Go
type nilBodyRoundTripper struct{}
```

#### <a id="nilBodyRoundTripper.RoundTrip" href="#nilBodyRoundTripper.RoundTrip">func (nilBodyRoundTripper) RoundTrip(req *Request) (*Response, error)</a>

```
searchKey: http_test.nilBodyRoundTripper.RoundTrip
tags: [method private]
```

```Go
func (nilBodyRoundTripper) RoundTrip(req *Request) (*Response, error)
```

### <a id="noopConn" href="#noopConn">type noopConn struct{}</a>

```
searchKey: http_test.noopConn
tags: [struct private]
```

```Go
type noopConn struct{}
```

#### <a id="noopConn.LocalAddr" href="#noopConn.LocalAddr">func (noopConn) LocalAddr() net.Addr</a>

```
searchKey: http_test.noopConn.LocalAddr
tags: [function private]
```

```Go
func (noopConn) LocalAddr() net.Addr
```

#### <a id="noopConn.RemoteAddr" href="#noopConn.RemoteAddr">func (noopConn) RemoteAddr() net.Addr</a>

```
searchKey: http_test.noopConn.RemoteAddr
tags: [function private]
```

```Go
func (noopConn) RemoteAddr() net.Addr
```

#### <a id="noopConn.SetDeadline" href="#noopConn.SetDeadline">func (noopConn) SetDeadline(t time.Time) error</a>

```
searchKey: http_test.noopConn.SetDeadline
tags: [method private]
```

```Go
func (noopConn) SetDeadline(t time.Time) error
```

#### <a id="noopConn.SetReadDeadline" href="#noopConn.SetReadDeadline">func (noopConn) SetReadDeadline(t time.Time) error</a>

```
searchKey: http_test.noopConn.SetReadDeadline
tags: [method private]
```

```Go
func (noopConn) SetReadDeadline(t time.Time) error
```

#### <a id="noopConn.SetWriteDeadline" href="#noopConn.SetWriteDeadline">func (noopConn) SetWriteDeadline(t time.Time) error</a>

```
searchKey: http_test.noopConn.SetWriteDeadline
tags: [method private]
```

```Go
func (noopConn) SetWriteDeadline(t time.Time) error
```

### <a id="noteCloseConn" href="#noteCloseConn">type noteCloseConn struct</a>

```
searchKey: http_test.noteCloseConn
tags: [struct private]
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
tags: [function private]
```

```Go
func (x noteCloseConn) Close() error
```

### <a id="oneConnListener" href="#oneConnListener">type oneConnListener struct</a>

```
searchKey: http_test.oneConnListener
tags: [struct private]
```

```Go
type oneConnListener struct {
	conn net.Conn
}
```

#### <a id="oneConnListener.Accept" href="#oneConnListener.Accept">func (l *oneConnListener) Accept() (c net.Conn, err error)</a>

```
searchKey: http_test.oneConnListener.Accept
tags: [function private]
```

```Go
func (l *oneConnListener) Accept() (c net.Conn, err error)
```

#### <a id="oneConnListener.Addr" href="#oneConnListener.Addr">func (l *oneConnListener) Addr() net.Addr</a>

```
searchKey: http_test.oneConnListener.Addr
tags: [function private]
```

```Go
func (l *oneConnListener) Addr() net.Addr
```

#### <a id="oneConnListener.Close" href="#oneConnListener.Close">func (l *oneConnListener) Close() error</a>

```
searchKey: http_test.oneConnListener.Close
tags: [function private]
```

```Go
func (l *oneConnListener) Close() error
```

### <a id="panicOnSeek" href="#panicOnSeek">type panicOnSeek struct</a>

```
searchKey: http_test.panicOnSeek
tags: [struct private]
```

```Go
type panicOnSeek struct{ io.ReadSeeker }
```

### <a id="proxyFromEnvTest" href="#proxyFromEnvTest">type proxyFromEnvTest struct</a>

```
searchKey: http_test.proxyFromEnvTest
tags: [struct private]
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
tags: [function private]
```

```Go
func (t proxyFromEnvTest) String() string
```

### <a id="recordingTransport" href="#recordingTransport">type recordingTransport struct</a>

```
searchKey: http_test.recordingTransport
tags: [struct private]
```

```Go
type recordingTransport struct {
	req *Request
}
```

#### <a id="recordingTransport.RoundTrip" href="#recordingTransport.RoundTrip">func (t *recordingTransport) RoundTrip(req *Request) (resp *Response, err error)</a>

```
searchKey: http_test.recordingTransport.RoundTrip
tags: [method private]
```

```Go
func (t *recordingTransport) RoundTrip(req *Request) (resp *Response, err error)
```

### <a id="redirectTest" href="#redirectTest">type redirectTest struct</a>

```
searchKey: http_test.redirectTest
tags: [struct private]
```

```Go
type redirectTest struct {
	suffix       string
	want         int // response code
	redirectBody string
}
```

### <a id="repeatReader" href="#repeatReader">type repeatReader struct</a>

```
searchKey: http_test.repeatReader
tags: [struct private]
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
tags: [method private]
```

```Go
func (r *repeatReader) Read(p []byte) (n int, err error)
```

### <a id="reqFunc" href="#reqFunc">type reqFunc func(c *net/http.Client, url string) (*net/http.Response, error)</a>

```
searchKey: http_test.reqFunc
tags: [function private]
```

```Go
type reqFunc func(c *Client, url string) (*Response, error)
```

### <a id="responseWriterJustWriter" href="#responseWriterJustWriter">type responseWriterJustWriter struct</a>

```
searchKey: http_test.responseWriterJustWriter
tags: [struct private]
```

```Go
type responseWriterJustWriter struct {
	io.Writer
}
```

#### <a id="responseWriterJustWriter.Header" href="#responseWriterJustWriter.Header">func (responseWriterJustWriter) Header() Header</a>

```
searchKey: http_test.responseWriterJustWriter.Header
tags: [function private]
```

```Go
func (responseWriterJustWriter) Header() Header
```

#### <a id="responseWriterJustWriter.WriteHeader" href="#responseWriterJustWriter.WriteHeader">func (responseWriterJustWriter) WriteHeader(int)</a>

```
searchKey: http_test.responseWriterJustWriter.WriteHeader
tags: [method private]
```

```Go
func (responseWriterJustWriter) WriteHeader(int)
```

### <a id="roundTripFunc" href="#roundTripFunc">type roundTripFunc func(r *net/http.Request) (*net/http.Response, error)</a>

```
searchKey: http_test.roundTripFunc
tags: [function private]
```

```Go
type roundTripFunc func(r *Request) (*Response, error)
```

#### <a id="roundTripFunc.RoundTrip" href="#roundTripFunc.RoundTrip">func (f roundTripFunc) RoundTrip(r *Request) (*Response, error)</a>

```
searchKey: http_test.roundTripFunc.RoundTrip
tags: [method private]
```

```Go
func (f roundTripFunc) RoundTrip(r *Request) (*Response, error)
```

### <a id="roundTripperWithCloseIdle" href="#roundTripperWithCloseIdle">type roundTripperWithCloseIdle func()</a>

```
searchKey: http_test.roundTripperWithCloseIdle
tags: [function private]
```

```Go
type roundTripperWithCloseIdle func() // underlying func is CloseIdleConnections func

```

#### <a id="roundTripperWithCloseIdle.CloseIdleConnections" href="#roundTripperWithCloseIdle.CloseIdleConnections">func (f roundTripperWithCloseIdle) CloseIdleConnections()</a>

```
searchKey: http_test.roundTripperWithCloseIdle.CloseIdleConnections
tags: [function private]
```

```Go
func (f roundTripperWithCloseIdle) CloseIdleConnections()
```

#### <a id="roundTripperWithCloseIdle.RoundTrip" href="#roundTripperWithCloseIdle.RoundTrip">func (roundTripperWithCloseIdle) RoundTrip(*Request) (*Response, error)</a>

```
searchKey: http_test.roundTripperWithCloseIdle.RoundTrip
tags: [method private]
```

```Go
func (roundTripperWithCloseIdle) RoundTrip(*Request) (*Response, error)
```

### <a id="roundTripperWithoutCloseIdle" href="#roundTripperWithoutCloseIdle">type roundTripperWithoutCloseIdle struct{}</a>

```
searchKey: http_test.roundTripperWithoutCloseIdle
tags: [struct private]
```

```Go
type roundTripperWithoutCloseIdle struct{}
```

#### <a id="roundTripperWithoutCloseIdle.RoundTrip" href="#roundTripperWithoutCloseIdle.RoundTrip">func (roundTripperWithoutCloseIdle) RoundTrip(*Request) (*Response, error)</a>

```
searchKey: http_test.roundTripperWithoutCloseIdle.RoundTrip
tags: [method private]
```

```Go
func (roundTripperWithoutCloseIdle) RoundTrip(*Request) (*Response, error)
```

### <a id="rwTestConn" href="#rwTestConn">type rwTestConn struct</a>

```
searchKey: http_test.rwTestConn
tags: [struct private]
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
tags: [function private]
```

```Go
func (c *rwTestConn) Close() error
```

### <a id="serverExpectTest" href="#serverExpectTest">type serverExpectTest struct</a>

```
searchKey: http_test.serverExpectTest
tags: [struct private]
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
tags: [method private]
```

```Go
func expectTest(contentLength int, expectation string, readBody bool, expectedResponse string) serverExpectTest
```

### <a id="slowTestConn" href="#slowTestConn">type slowTestConn struct</a>

```
searchKey: http_test.slowTestConn
tags: [struct private]
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

#### <a id="slowTestConn.Close" href="#slowTestConn.Close">func (c *slowTestConn) Close() error</a>

```
searchKey: http_test.slowTestConn.Close
tags: [function private]
```

```Go
func (c *slowTestConn) Close() error
```

#### <a id="slowTestConn.Read" href="#slowTestConn.Read">func (c *slowTestConn) Read(b []byte) (n int, err error)</a>

```
searchKey: http_test.slowTestConn.Read
tags: [method private]
```

```Go
func (c *slowTestConn) Read(b []byte) (n int, err error)
```

#### <a id="slowTestConn.SetDeadline" href="#slowTestConn.SetDeadline">func (c *slowTestConn) SetDeadline(t time.Time) error</a>

```
searchKey: http_test.slowTestConn.SetDeadline
tags: [method private]
```

```Go
func (c *slowTestConn) SetDeadline(t time.Time) error
```

#### <a id="slowTestConn.SetReadDeadline" href="#slowTestConn.SetReadDeadline">func (c *slowTestConn) SetReadDeadline(t time.Time) error</a>

```
searchKey: http_test.slowTestConn.SetReadDeadline
tags: [method private]
```

```Go
func (c *slowTestConn) SetReadDeadline(t time.Time) error
```

#### <a id="slowTestConn.SetWriteDeadline" href="#slowTestConn.SetWriteDeadline">func (c *slowTestConn) SetWriteDeadline(t time.Time) error</a>

```
searchKey: http_test.slowTestConn.SetWriteDeadline
tags: [method private]
```

```Go
func (c *slowTestConn) SetWriteDeadline(t time.Time) error
```

#### <a id="slowTestConn.Write" href="#slowTestConn.Write">func (c *slowTestConn) Write(b []byte) (int, error)</a>

```
searchKey: http_test.slowTestConn.Write
tags: [method private]
```

```Go
func (c *slowTestConn) Write(b []byte) (int, error)
```

### <a id="slurpResult" href="#slurpResult">type slurpResult struct</a>

```
searchKey: http_test.slurpResult
tags: [struct private]
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
tags: [function private]
```

```Go
func (sr slurpResult) String() string
```

### <a id="stringHandler" href="#stringHandler">type stringHandler string</a>

```
searchKey: http_test.stringHandler
tags: [string private]
```

```Go
type stringHandler string
```

#### <a id="stringHandler.ServeHTTP" href="#stringHandler.ServeHTTP">func (s stringHandler) ServeHTTP(w ResponseWriter, r *Request)</a>

```
searchKey: http_test.stringHandler.ServeHTTP
tags: [method private]
```

```Go
func (s stringHandler) ServeHTTP(w ResponseWriter, r *Request)
```

### <a id="terrorWriter" href="#terrorWriter">type terrorWriter struct</a>

```
searchKey: http_test.terrorWriter
tags: [struct private]
```

```Go
type terrorWriter struct{ t *testing.T }
```

#### <a id="terrorWriter.Write" href="#terrorWriter.Write">func (w terrorWriter) Write(p []byte) (int, error)</a>

```
searchKey: http_test.terrorWriter.Write
tags: [method private]
```

```Go
func (w terrorWriter) Write(p []byte) (int, error)
```

### <a id="testCloseConn" href="#testCloseConn">type testCloseConn struct</a>

```
searchKey: http_test.testCloseConn
tags: [struct private]
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
tags: [function private]
```

```Go
func (c *testCloseConn) Close() error
```

### <a id="testConn" href="#testConn">type testConn struct</a>

```
searchKey: http_test.testConn
tags: [struct private]
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

#### <a id="testConn.Close" href="#testConn.Close">func (c *testConn) Close() error</a>

```
searchKey: http_test.testConn.Close
tags: [function private]
```

```Go
func (c *testConn) Close() error
```

#### <a id="testConn.Read" href="#testConn.Read">func (c *testConn) Read(b []byte) (int, error)</a>

```
searchKey: http_test.testConn.Read
tags: [method private]
```

```Go
func (c *testConn) Read(b []byte) (int, error)
```

#### <a id="testConn.Write" href="#testConn.Write">func (c *testConn) Write(b []byte) (int, error)</a>

```
searchKey: http_test.testConn.Write
tags: [method private]
```

```Go
func (c *testConn) Write(b []byte) (int, error)
```

### <a id="testConnSet" href="#testConnSet">type testConnSet struct</a>

```
searchKey: http_test.testConnSet
tags: [struct private]
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
tags: [method private]
```

```Go
func makeTestDial(t *testing.T) (*testConnSet, func(n, addr string) (net.Conn, error))
```

some tests use this to manage raw tcp connections for later inspection 

#### <a id="testConnSet.check" href="#testConnSet.check">func (tcs *testConnSet) check(t *testing.T)</a>

```
searchKey: http_test.testConnSet.check
tags: [method private]
```

```Go
func (tcs *testConnSet) check(t *testing.T)
```

#### <a id="testConnSet.insert" href="#testConnSet.insert">func (tcs *testConnSet) insert(c net.Conn)</a>

```
searchKey: http_test.testConnSet.insert
tags: [method private]
```

```Go
func (tcs *testConnSet) insert(c net.Conn)
```

#### <a id="testConnSet.remove" href="#testConnSet.remove">func (tcs *testConnSet) remove(c net.Conn)</a>

```
searchKey: http_test.testConnSet.remove
tags: [method private]
```

```Go
func (tcs *testConnSet) remove(c net.Conn)
```

### <a id="testErrorReader" href="#testErrorReader">type testErrorReader struct</a>

```
searchKey: http_test.testErrorReader
tags: [struct private]
```

```Go
type testErrorReader struct{ t *testing.T }
```

#### <a id="testErrorReader.Read" href="#testErrorReader.Read">func (r testErrorReader) Read(p []byte) (n int, err error)</a>

```
searchKey: http_test.testErrorReader.Read
tags: [method private]
```

```Go
func (r testErrorReader) Read(p []byte) (n int, err error)
```

### <a id="testFileSystem" href="#testFileSystem">type testFileSystem struct</a>

```
searchKey: http_test.testFileSystem
tags: [struct private]
```

```Go
type testFileSystem struct {
	open func(name string) (File, error)
}
```

#### <a id="testFileSystem.Open" href="#testFileSystem.Open">func (fs *testFileSystem) Open(name string) (File, error)</a>

```
searchKey: http_test.testFileSystem.Open
tags: [method private]
```

```Go
func (fs *testFileSystem) Open(name string) (File, error)
```

### <a id="testHandlerBodyConsumer" href="#testHandlerBodyConsumer">type testHandlerBodyConsumer struct</a>

```
searchKey: http_test.testHandlerBodyConsumer
tags: [struct private]
```

```Go
type testHandlerBodyConsumer struct {
	name string
	f    func(io.ReadCloser)
}
```

testHandlerBodyConsumer represents a function injected into a test handler to vary work done on a request Body. 

### <a id="testMockTCPConn" href="#testMockTCPConn">type testMockTCPConn struct</a>

```
searchKey: http_test.testMockTCPConn
tags: [struct private]
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
tags: [method private]
```

```Go
func (c *testMockTCPConn) ReadFrom(r io.Reader) (int64, error)
```

### <a id="timeoutProto" href="#timeoutProto">type timeoutProto struct{}</a>

```
searchKey: http_test.timeoutProto
tags: [struct private]
```

```Go
type timeoutProto struct{}
```

#### <a id="timeoutProto.RoundTrip" href="#timeoutProto.RoundTrip">func (timeoutProto) RoundTrip(req *Request) (*Response, error)</a>

```
searchKey: http_test.timeoutProto.RoundTrip
tags: [method private]
```

```Go
func (timeoutProto) RoundTrip(req *Request) (*Response, error)
```

### <a id="trackLastConnListener" href="#trackLastConnListener">type trackLastConnListener struct</a>

```
searchKey: http_test.trackLastConnListener
tags: [struct private]
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
tags: [function private]
```

```Go
func (l trackLastConnListener) Accept() (c net.Conn, err error)
```

### <a id="wantRange" href="#wantRange">type wantRange struct</a>

```
searchKey: http_test.wantRange
tags: [struct private]
```

```Go
type wantRange struct {
	start, end int64 // range [start,end)
}
```

### <a id="writeCountingConn" href="#writeCountingConn">type writeCountingConn struct</a>

```
searchKey: http_test.writeCountingConn
tags: [struct private]
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
tags: [method private]
```

```Go
func (c *writeCountingConn) Write(p []byte) (int, error)
```

### <a id="writerFuncConn" href="#writerFuncConn">type writerFuncConn struct</a>

```
searchKey: http_test.writerFuncConn
tags: [struct private]
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
tags: [method private]
```

```Go
func (c writerFuncConn) Write(p []byte) (n int, err error)
```

## <a id="func" href="#func">Functions</a>

```
tags: [package private]
```

### <a id="BenchmarkClient" href="#BenchmarkClient">func BenchmarkClient(b *testing.B)</a>

```
searchKey: http_test.BenchmarkClient
tags: [method private benchmark]
```

```Go
func BenchmarkClient(b *testing.B)
```

A benchmark for profiling the client without the HTTP server code. The server code runs in a subprocess. 

### <a id="BenchmarkClientServer" href="#BenchmarkClientServer">func BenchmarkClientServer(b *testing.B)</a>

```
searchKey: http_test.BenchmarkClientServer
tags: [method private benchmark]
```

```Go
func BenchmarkClientServer(b *testing.B)
```

### <a id="BenchmarkClientServerParallel4" href="#BenchmarkClientServerParallel4">func BenchmarkClientServerParallel4(b *testing.B)</a>

```
searchKey: http_test.BenchmarkClientServerParallel4
tags: [method private benchmark]
```

```Go
func BenchmarkClientServerParallel4(b *testing.B)
```

### <a id="BenchmarkClientServerParallel64" href="#BenchmarkClientServerParallel64">func BenchmarkClientServerParallel64(b *testing.B)</a>

```
searchKey: http_test.BenchmarkClientServerParallel64
tags: [method private benchmark]
```

```Go
func BenchmarkClientServerParallel64(b *testing.B)
```

### <a id="BenchmarkClientServerParallelTLS4" href="#BenchmarkClientServerParallelTLS4">func BenchmarkClientServerParallelTLS4(b *testing.B)</a>

```
searchKey: http_test.BenchmarkClientServerParallelTLS4
tags: [method private benchmark]
```

```Go
func BenchmarkClientServerParallelTLS4(b *testing.B)
```

### <a id="BenchmarkClientServerParallelTLS64" href="#BenchmarkClientServerParallelTLS64">func BenchmarkClientServerParallelTLS64(b *testing.B)</a>

```
searchKey: http_test.BenchmarkClientServerParallelTLS64
tags: [method private benchmark]
```

```Go
func BenchmarkClientServerParallelTLS64(b *testing.B)
```

### <a id="BenchmarkCloseNotifier" href="#BenchmarkCloseNotifier">func BenchmarkCloseNotifier(b *testing.B)</a>

```
searchKey: http_test.BenchmarkCloseNotifier
tags: [method private benchmark]
```

```Go
func BenchmarkCloseNotifier(b *testing.B)
```

### <a id="BenchmarkFileAndServer_16MB" href="#BenchmarkFileAndServer_16MB">func BenchmarkFileAndServer_16MB(b *testing.B)</a>

```
searchKey: http_test.BenchmarkFileAndServer_16MB
tags: [method private benchmark]
```

```Go
func BenchmarkFileAndServer_16MB(b *testing.B)
```

### <a id="BenchmarkFileAndServer_1KB" href="#BenchmarkFileAndServer_1KB">func BenchmarkFileAndServer_1KB(b *testing.B)</a>

```
searchKey: http_test.BenchmarkFileAndServer_1KB
tags: [method private benchmark]
```

```Go
func BenchmarkFileAndServer_1KB(b *testing.B)
```

### <a id="BenchmarkFileAndServer_64MB" href="#BenchmarkFileAndServer_64MB">func BenchmarkFileAndServer_64MB(b *testing.B)</a>

```
searchKey: http_test.BenchmarkFileAndServer_64MB
tags: [method private benchmark]
```

```Go
func BenchmarkFileAndServer_64MB(b *testing.B)
```

### <a id="BenchmarkReadRequestApachebench" href="#BenchmarkReadRequestApachebench">func BenchmarkReadRequestApachebench(b *testing.B)</a>

```
searchKey: http_test.BenchmarkReadRequestApachebench
tags: [method private benchmark]
```

```Go
func BenchmarkReadRequestApachebench(b *testing.B)
```

### <a id="BenchmarkReadRequestChrome" href="#BenchmarkReadRequestChrome">func BenchmarkReadRequestChrome(b *testing.B)</a>

```
searchKey: http_test.BenchmarkReadRequestChrome
tags: [method private benchmark]
```

```Go
func BenchmarkReadRequestChrome(b *testing.B)
```

### <a id="BenchmarkReadRequestCurl" href="#BenchmarkReadRequestCurl">func BenchmarkReadRequestCurl(b *testing.B)</a>

```
searchKey: http_test.BenchmarkReadRequestCurl
tags: [method private benchmark]
```

```Go
func BenchmarkReadRequestCurl(b *testing.B)
```

### <a id="BenchmarkReadRequestSiege" href="#BenchmarkReadRequestSiege">func BenchmarkReadRequestSiege(b *testing.B)</a>

```
searchKey: http_test.BenchmarkReadRequestSiege
tags: [method private benchmark]
```

```Go
func BenchmarkReadRequestSiege(b *testing.B)
```

### <a id="BenchmarkReadRequestWrk" href="#BenchmarkReadRequestWrk">func BenchmarkReadRequestWrk(b *testing.B)</a>

```
searchKey: http_test.BenchmarkReadRequestWrk
tags: [method private benchmark]
```

```Go
func BenchmarkReadRequestWrk(b *testing.B)
```

### <a id="BenchmarkResponseStatusLine" href="#BenchmarkResponseStatusLine">func BenchmarkResponseStatusLine(b *testing.B)</a>

```
searchKey: http_test.BenchmarkResponseStatusLine
tags: [method private benchmark]
```

```Go
func BenchmarkResponseStatusLine(b *testing.B)
```

### <a id="BenchmarkServeMux" href="#BenchmarkServeMux">func BenchmarkServeMux(b *testing.B)</a>

```
searchKey: http_test.BenchmarkServeMux
tags: [method private benchmark]
```

```Go
func BenchmarkServeMux(b *testing.B)
```

### <a id="BenchmarkServeMux_SkipServe" href="#BenchmarkServeMux_SkipServe">func BenchmarkServeMux_SkipServe(b *testing.B)</a>

```
searchKey: http_test.BenchmarkServeMux_SkipServe
tags: [method private benchmark]
```

```Go
func BenchmarkServeMux_SkipServe(b *testing.B)
```

### <a id="BenchmarkServer" href="#BenchmarkServer">func BenchmarkServer(b *testing.B)</a>

```
searchKey: http_test.BenchmarkServer
tags: [method private benchmark]
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
### <a id="BenchmarkServerFakeConnNoKeepAlive" href="#BenchmarkServerFakeConnNoKeepAlive">func BenchmarkServerFakeConnNoKeepAlive(b *testing.B)</a>

```
searchKey: http_test.BenchmarkServerFakeConnNoKeepAlive
tags: [method private benchmark]
```

```Go
func BenchmarkServerFakeConnNoKeepAlive(b *testing.B)
```

### <a id="BenchmarkServerFakeConnWithKeepAlive" href="#BenchmarkServerFakeConnWithKeepAlive">func BenchmarkServerFakeConnWithKeepAlive(b *testing.B)</a>

```
searchKey: http_test.BenchmarkServerFakeConnWithKeepAlive
tags: [method private benchmark]
```

```Go
func BenchmarkServerFakeConnWithKeepAlive(b *testing.B)
```

### <a id="BenchmarkServerFakeConnWithKeepAliveLite" href="#BenchmarkServerFakeConnWithKeepAliveLite">func BenchmarkServerFakeConnWithKeepAliveLite(b *testing.B)</a>

```
searchKey: http_test.BenchmarkServerFakeConnWithKeepAliveLite
tags: [method private benchmark]
```

```Go
func BenchmarkServerFakeConnWithKeepAliveLite(b *testing.B)
```

same as above, but representing the most simple possible request and handler. Notably: the handler does not call rw.Header(). 

### <a id="BenchmarkServerHandlerNoHeader" href="#BenchmarkServerHandlerNoHeader">func BenchmarkServerHandlerNoHeader(b *testing.B)</a>

```
searchKey: http_test.BenchmarkServerHandlerNoHeader
tags: [method private benchmark]
```

```Go
func BenchmarkServerHandlerNoHeader(b *testing.B)
```

Neither a Content-Type or Content-Length, so sniffed and counted. 

### <a id="BenchmarkServerHandlerNoLen" href="#BenchmarkServerHandlerNoLen">func BenchmarkServerHandlerNoLen(b *testing.B)</a>

```
searchKey: http_test.BenchmarkServerHandlerNoLen
tags: [method private benchmark]
```

```Go
func BenchmarkServerHandlerNoLen(b *testing.B)
```

A Content-Type is set, but no length. No sniffing, but will count the Content-Length. 

### <a id="BenchmarkServerHandlerNoType" href="#BenchmarkServerHandlerNoType">func BenchmarkServerHandlerNoType(b *testing.B)</a>

```
searchKey: http_test.BenchmarkServerHandlerNoType
tags: [method private benchmark]
```

```Go
func BenchmarkServerHandlerNoType(b *testing.B)
```

A Content-Length is set, but the Content-Type will be sniffed. 

### <a id="BenchmarkServerHandlerTypeLen" href="#BenchmarkServerHandlerTypeLen">func BenchmarkServerHandlerTypeLen(b *testing.B)</a>

```
searchKey: http_test.BenchmarkServerHandlerTypeLen
tags: [method private benchmark]
```

```Go
func BenchmarkServerHandlerTypeLen(b *testing.B)
```

Both Content-Type and Content-Length set. Should be no buffering. 

### <a id="BenchmarkServerHijack" href="#BenchmarkServerHijack">func BenchmarkServerHijack(b *testing.B)</a>

```
searchKey: http_test.BenchmarkServerHijack
tags: [method private benchmark]
```

```Go
func BenchmarkServerHijack(b *testing.B)
```

### <a id="ExampleFileServer" href="#ExampleFileServer">func ExampleFileServer()</a>

```
searchKey: http_test.ExampleFileServer
tags: [function private]
```

```Go
func ExampleFileServer()
```

### <a id="ExampleFileServer_dotFileHiding" href="#ExampleFileServer_dotFileHiding">func ExampleFileServer_dotFileHiding()</a>

```
searchKey: http_test.ExampleFileServer_dotFileHiding
tags: [function private]
```

```Go
func ExampleFileServer_dotFileHiding()
```

### <a id="ExampleFileServer_stripPrefix" href="#ExampleFileServer_stripPrefix">func ExampleFileServer_stripPrefix()</a>

```
searchKey: http_test.ExampleFileServer_stripPrefix
tags: [function private]
```

```Go
func ExampleFileServer_stripPrefix()
```

### <a id="ExampleGet" href="#ExampleGet">func ExampleGet()</a>

```
searchKey: http_test.ExampleGet
tags: [function private]
```

```Go
func ExampleGet()
```

### <a id="ExampleHandle" href="#ExampleHandle">func ExampleHandle()</a>

```
searchKey: http_test.ExampleHandle
tags: [function private]
```

```Go
func ExampleHandle()
```

### <a id="ExampleHandleFunc" href="#ExampleHandleFunc">func ExampleHandleFunc()</a>

```
searchKey: http_test.ExampleHandleFunc
tags: [function private]
```

```Go
func ExampleHandleFunc()
```

### <a id="ExampleHijacker" href="#ExampleHijacker">func ExampleHijacker()</a>

```
searchKey: http_test.ExampleHijacker
tags: [function private]
```

```Go
func ExampleHijacker()
```

### <a id="ExampleListenAndServe" href="#ExampleListenAndServe">func ExampleListenAndServe()</a>

```
searchKey: http_test.ExampleListenAndServe
tags: [function private]
```

```Go
func ExampleListenAndServe()
```

### <a id="ExampleListenAndServeTLS" href="#ExampleListenAndServeTLS">func ExampleListenAndServeTLS()</a>

```
searchKey: http_test.ExampleListenAndServeTLS
tags: [function private]
```

```Go
func ExampleListenAndServeTLS()
```

### <a id="ExampleNotFoundHandler" href="#ExampleNotFoundHandler">func ExampleNotFoundHandler()</a>

```
searchKey: http_test.ExampleNotFoundHandler
tags: [function private]
```

```Go
func ExampleNotFoundHandler()
```

### <a id="ExampleResponseWriter_trailers" href="#ExampleResponseWriter_trailers">func ExampleResponseWriter_trailers()</a>

```
searchKey: http_test.ExampleResponseWriter_trailers
tags: [function private]
```

```Go
func ExampleResponseWriter_trailers()
```

HTTP Trailers are a set of key/value pairs like headers that come after the HTTP response, instead of before. 

### <a id="ExampleServeMux_Handle" href="#ExampleServeMux_Handle">func ExampleServeMux_Handle()</a>

```
searchKey: http_test.ExampleServeMux_Handle
tags: [function private]
```

```Go
func ExampleServeMux_Handle()
```

### <a id="ExampleServer_Shutdown" href="#ExampleServer_Shutdown">func ExampleServer_Shutdown()</a>

```
searchKey: http_test.ExampleServer_Shutdown
tags: [function private]
```

```Go
func ExampleServer_Shutdown()
```

### <a id="ExampleStripPrefix" href="#ExampleStripPrefix">func ExampleStripPrefix()</a>

```
searchKey: http_test.ExampleStripPrefix
tags: [function private]
```

```Go
func ExampleStripPrefix()
```

### <a id="Test304Responses_h1" href="#Test304Responses_h1">func Test304Responses_h1(t *testing.T)</a>

```
searchKey: http_test.Test304Responses_h1
tags: [method private test]
```

```Go
func Test304Responses_h1(t *testing.T)
```

Test304Responses verifies that 304s don't declare that they're chunking in their response headers and aren't allowed to produce output. 

### <a id="Test304Responses_h2" href="#Test304Responses_h2">func Test304Responses_h2(t *testing.T)</a>

```
searchKey: http_test.Test304Responses_h2
tags: [method private test]
```

```Go
func Test304Responses_h2(t *testing.T)
```

### <a id="TestAcceptMaxFds" href="#TestAcceptMaxFds">func TestAcceptMaxFds(t *testing.T)</a>

```
searchKey: http_test.TestAcceptMaxFds
tags: [method private test]
```

```Go
func TestAcceptMaxFds(t *testing.T)
```

### <a id="TestAltProtoCancellation" href="#TestAltProtoCancellation">func TestAltProtoCancellation(t *testing.T)</a>

```
searchKey: http_test.TestAltProtoCancellation
tags: [method private test]
```

```Go
func TestAltProtoCancellation(t *testing.T)
```

Issue 36820 Test that we use the older backward compatible cancellation protocol when a RoundTripper is registered via RegisterProtocol. 

### <a id="TestAppendTime" href="#TestAppendTime">func TestAppendTime(t *testing.T)</a>

```
searchKey: http_test.TestAppendTime
tags: [method private test]
```

```Go
func TestAppendTime(t *testing.T)
```

### <a id="TestAutomaticHTTP2_ListenAndServe" href="#TestAutomaticHTTP2_ListenAndServe">func TestAutomaticHTTP2_ListenAndServe(t *testing.T)</a>

```
searchKey: http_test.TestAutomaticHTTP2_ListenAndServe
tags: [method private test]
```

```Go
func TestAutomaticHTTP2_ListenAndServe(t *testing.T)
```

### <a id="TestAutomaticHTTP2_ListenAndServe_GetCertificate" href="#TestAutomaticHTTP2_ListenAndServe_GetCertificate">func TestAutomaticHTTP2_ListenAndServe_GetCertificate(t *testing.T)</a>

```
searchKey: http_test.TestAutomaticHTTP2_ListenAndServe_GetCertificate
tags: [method private test]
```

```Go
func TestAutomaticHTTP2_ListenAndServe_GetCertificate(t *testing.T)
```

### <a id="TestAutomaticHTTP2_Serve_H2TLSConfig" href="#TestAutomaticHTTP2_Serve_H2TLSConfig">func TestAutomaticHTTP2_Serve_H2TLSConfig(t *testing.T)</a>

```
searchKey: http_test.TestAutomaticHTTP2_Serve_H2TLSConfig
tags: [method private test]
```

```Go
func TestAutomaticHTTP2_Serve_H2TLSConfig(t *testing.T)
```

### <a id="TestAutomaticHTTP2_Serve_NoTLSConfig" href="#TestAutomaticHTTP2_Serve_NoTLSConfig">func TestAutomaticHTTP2_Serve_NoTLSConfig(t *testing.T)</a>

```
searchKey: http_test.TestAutomaticHTTP2_Serve_NoTLSConfig
tags: [method private test]
```

```Go
func TestAutomaticHTTP2_Serve_NoTLSConfig(t *testing.T)
```

Issue 15908 

### <a id="TestAutomaticHTTP2_Serve_NonH2TLSConfig" href="#TestAutomaticHTTP2_Serve_NonH2TLSConfig">func TestAutomaticHTTP2_Serve_NonH2TLSConfig(t *testing.T)</a>

```
searchKey: http_test.TestAutomaticHTTP2_Serve_NonH2TLSConfig
tags: [method private test]
```

```Go
func TestAutomaticHTTP2_Serve_NonH2TLSConfig(t *testing.T)
```

### <a id="TestAutomaticHTTP2_Serve_WithTLSConfig" href="#TestAutomaticHTTP2_Serve_WithTLSConfig">func TestAutomaticHTTP2_Serve_WithTLSConfig(t *testing.T)</a>

```
searchKey: http_test.TestAutomaticHTTP2_Serve_WithTLSConfig
tags: [method private test]
```

```Go
func TestAutomaticHTTP2_Serve_WithTLSConfig(t *testing.T)
```

### <a id="TestBadResponseAfterReadingBody" href="#TestBadResponseAfterReadingBody">func TestBadResponseAfterReadingBody(t *testing.T)</a>

```
searchKey: http_test.TestBadResponseAfterReadingBody
tags: [method private test]
```

```Go
func TestBadResponseAfterReadingBody(t *testing.T)
```

### <a id="TestBasicAuth" href="#TestBasicAuth">func TestBasicAuth(t *testing.T)</a>

```
searchKey: http_test.TestBasicAuth
tags: [method private test]
```

```Go
func TestBasicAuth(t *testing.T)
```

### <a id="TestBasicAuthHeadersPreserved" href="#TestBasicAuthHeadersPreserved">func TestBasicAuthHeadersPreserved(t *testing.T)</a>

```
searchKey: http_test.TestBasicAuthHeadersPreserved
tags: [method private test]
```

```Go
func TestBasicAuthHeadersPreserved(t *testing.T)
```

### <a id="TestBidiStreamReverseProxy" href="#TestBidiStreamReverseProxy">func TestBidiStreamReverseProxy(t *testing.T)</a>

```
searchKey: http_test.TestBidiStreamReverseProxy
tags: [method private test]
```

```Go
func TestBidiStreamReverseProxy(t *testing.T)
```

### <a id="TestCancelRequestMidBody_h1" href="#TestCancelRequestMidBody_h1">func TestCancelRequestMidBody_h1(t *testing.T)</a>

```
searchKey: http_test.TestCancelRequestMidBody_h1
tags: [method private test]
```

```Go
func TestCancelRequestMidBody_h1(t *testing.T)
```

Tests that closing the Request.Cancel channel also while still reading the response body. Issue 13159. 

### <a id="TestCancelRequestMidBody_h2" href="#TestCancelRequestMidBody_h2">func TestCancelRequestMidBody_h2(t *testing.T)</a>

```
searchKey: http_test.TestCancelRequestMidBody_h2
tags: [method private test]
```

```Go
func TestCancelRequestMidBody_h2(t *testing.T)
```

### <a id="TestCancelRequestWhenSharingConnection" href="#TestCancelRequestWhenSharingConnection">func TestCancelRequestWhenSharingConnection(t *testing.T)</a>

```
searchKey: http_test.TestCancelRequestWhenSharingConnection
tags: [method private test]
```

```Go
func TestCancelRequestWhenSharingConnection(t *testing.T)
```

Issue 41600 Test that a new request which uses the connection of an active request cannot cause it to be canceled as well. 

### <a id="TestCancelRequestWithChannel" href="#TestCancelRequestWithChannel">func TestCancelRequestWithChannel(t *testing.T)</a>

```
searchKey: http_test.TestCancelRequestWithChannel
tags: [method private test]
```

```Go
func TestCancelRequestWithChannel(t *testing.T)
```

### <a id="TestCancelRequestWithChannelBeforeDo_Cancel" href="#TestCancelRequestWithChannelBeforeDo_Cancel">func TestCancelRequestWithChannelBeforeDo_Cancel(t *testing.T)</a>

```
searchKey: http_test.TestCancelRequestWithChannelBeforeDo_Cancel
tags: [method private test]
```

```Go
func TestCancelRequestWithChannelBeforeDo_Cancel(t *testing.T)
```

### <a id="TestCancelRequestWithChannelBeforeDo_Context" href="#TestCancelRequestWithChannelBeforeDo_Context">func TestCancelRequestWithChannelBeforeDo_Context(t *testing.T)</a>

```
searchKey: http_test.TestCancelRequestWithChannelBeforeDo_Context
tags: [method private test]
```

```Go
func TestCancelRequestWithChannelBeforeDo_Context(t *testing.T)
```

### <a id="TestCaseSensitiveMethod_h1" href="#TestCaseSensitiveMethod_h1">func TestCaseSensitiveMethod_h1(t *testing.T)</a>

```
searchKey: http_test.TestCaseSensitiveMethod_h1
tags: [method private test]
```

```Go
func TestCaseSensitiveMethod_h1(t *testing.T)
```

### <a id="TestCaseSensitiveMethod_h2" href="#TestCaseSensitiveMethod_h2">func TestCaseSensitiveMethod_h2(t *testing.T)</a>

```
searchKey: http_test.TestCaseSensitiveMethod_h2
tags: [method private test]
```

```Go
func TestCaseSensitiveMethod_h2(t *testing.T)
```

### <a id="TestChunkedNoContent" href="#TestChunkedNoContent">func TestChunkedNoContent(t *testing.T)</a>

```
searchKey: http_test.TestChunkedNoContent
tags: [method private test]
```

```Go
func TestChunkedNoContent(t *testing.T)
```

From [https://golang.org/issue/4454](https://golang.org/issue/4454) , "client fails to handle requests with no body and chunked encoding" 

### <a id="TestChunkedResponseHeaders_h1" href="#TestChunkedResponseHeaders_h1">func TestChunkedResponseHeaders_h1(t *testing.T)</a>

```
searchKey: http_test.TestChunkedResponseHeaders_h1
tags: [method private test]
```

```Go
func TestChunkedResponseHeaders_h1(t *testing.T)
```

### <a id="TestChunkedResponseHeaders_h2" href="#TestChunkedResponseHeaders_h2">func TestChunkedResponseHeaders_h2(t *testing.T)</a>

```
searchKey: http_test.TestChunkedResponseHeaders_h2
tags: [method private test]
```

```Go
func TestChunkedResponseHeaders_h2(t *testing.T)
```

### <a id="TestClient" href="#TestClient">func TestClient(t *testing.T)</a>

```
searchKey: http_test.TestClient
tags: [method private test]
```

```Go
func TestClient(t *testing.T)
```

### <a id="TestClientAltersCookiesOnRedirect" href="#TestClientAltersCookiesOnRedirect">func TestClientAltersCookiesOnRedirect(t *testing.T)</a>

```
searchKey: http_test.TestClientAltersCookiesOnRedirect
tags: [method private test]
```

```Go
func TestClientAltersCookiesOnRedirect(t *testing.T)
```

Issue 17494: cookies should be altered when Client follows redirects. 

### <a id="TestClientCallsCloseOnlyOnce" href="#TestClientCallsCloseOnlyOnce">func TestClientCallsCloseOnlyOnce(t *testing.T)</a>

```
searchKey: http_test.TestClientCallsCloseOnlyOnce
tags: [method private test]
```

```Go
func TestClientCallsCloseOnlyOnce(t *testing.T)
```

Issue 40382: Client calls Close multiple times on Request.Body. 

### <a id="TestClientCanClose" href="#TestClientCanClose">func TestClientCanClose(t *testing.T)</a>

```
searchKey: http_test.TestClientCanClose
tags: [method private test]
```

```Go
func TestClientCanClose(t *testing.T)
```

TestClientCanClose verifies that clients can also force a connection to close. 

### <a id="TestClientCloseIdleConnections" href="#TestClientCloseIdleConnections">func TestClientCloseIdleConnections(t *testing.T)</a>

```
searchKey: http_test.TestClientCloseIdleConnections
tags: [method private test]
```

```Go
func TestClientCloseIdleConnections(t *testing.T)
```

### <a id="TestClientCopyHeadersOnRedirect" href="#TestClientCopyHeadersOnRedirect">func TestClientCopyHeadersOnRedirect(t *testing.T)</a>

```
searchKey: http_test.TestClientCopyHeadersOnRedirect
tags: [method private test]
```

```Go
func TestClientCopyHeadersOnRedirect(t *testing.T)
```

Issue 4800: copy (some) headers when Client follows a redirect. 

### <a id="TestClientCopyHostOnRedirect" href="#TestClientCopyHostOnRedirect">func TestClientCopyHostOnRedirect(t *testing.T)</a>

```
searchKey: http_test.TestClientCopyHostOnRedirect
tags: [method private test]
```

```Go
func TestClientCopyHostOnRedirect(t *testing.T)
```

Issue 22233: copy host when Client follows a relative redirect. 

### <a id="TestClientDoCanceledVsTimeout_h1" href="#TestClientDoCanceledVsTimeout_h1">func TestClientDoCanceledVsTimeout_h1(t *testing.T)</a>

```
searchKey: http_test.TestClientDoCanceledVsTimeout_h1
tags: [method private test]
```

```Go
func TestClientDoCanceledVsTimeout_h1(t *testing.T)
```

### <a id="TestClientDoCanceledVsTimeout_h2" href="#TestClientDoCanceledVsTimeout_h2">func TestClientDoCanceledVsTimeout_h2(t *testing.T)</a>

```
searchKey: http_test.TestClientDoCanceledVsTimeout_h2
tags: [method private test]
```

```Go
func TestClientDoCanceledVsTimeout_h2(t *testing.T)
```

### <a id="TestClientErrorWithRequestURI" href="#TestClientErrorWithRequestURI">func TestClientErrorWithRequestURI(t *testing.T)</a>

```
searchKey: http_test.TestClientErrorWithRequestURI
tags: [method private test]
```

```Go
func TestClientErrorWithRequestURI(t *testing.T)
```

### <a id="TestClientHeadContentLength_h1" href="#TestClientHeadContentLength_h1">func TestClientHeadContentLength_h1(t *testing.T)</a>

```
searchKey: http_test.TestClientHeadContentLength_h1
tags: [method private test]
```

```Go
func TestClientHeadContentLength_h1(t *testing.T)
```

Verify Response.ContentLength is populated. [https://golang.org/issue/4126](https://golang.org/issue/4126) 

### <a id="TestClientHeadContentLength_h2" href="#TestClientHeadContentLength_h2">func TestClientHeadContentLength_h2(t *testing.T)</a>

```
searchKey: http_test.TestClientHeadContentLength_h2
tags: [method private test]
```

```Go
func TestClientHeadContentLength_h2(t *testing.T)
```

### <a id="TestClientHead_h1" href="#TestClientHead_h1">func TestClientHead_h1(t *testing.T)</a>

```
searchKey: http_test.TestClientHead_h1
tags: [method private test]
```

```Go
func TestClientHead_h1(t *testing.T)
```

### <a id="TestClientHead_h2" href="#TestClientHead_h2">func TestClientHead_h2(t *testing.T)</a>

```
searchKey: http_test.TestClientHead_h2
tags: [method private test]
```

```Go
func TestClientHead_h2(t *testing.T)
```

### <a id="TestClientInsecureTransport" href="#TestClientInsecureTransport">func TestClientInsecureTransport(t *testing.T)</a>

```
searchKey: http_test.TestClientInsecureTransport
tags: [method private test]
```

```Go
func TestClientInsecureTransport(t *testing.T)
```

### <a id="TestClientPopulatesNilResponseBody" href="#TestClientPopulatesNilResponseBody">func TestClientPopulatesNilResponseBody(t *testing.T)</a>

```
searchKey: http_test.TestClientPopulatesNilResponseBody
tags: [method private test]
```

```Go
func TestClientPopulatesNilResponseBody(t *testing.T)
```

### <a id="TestClientPropagatesTimeoutToContext" href="#TestClientPropagatesTimeoutToContext">func TestClientPropagatesTimeoutToContext(t *testing.T)</a>

```
searchKey: http_test.TestClientPropagatesTimeoutToContext
tags: [method private test]
```

```Go
func TestClientPropagatesTimeoutToContext(t *testing.T)
```

### <a id="TestClientRedirect308NoGetBody" href="#TestClientRedirect308NoGetBody">func TestClientRedirect308NoGetBody(t *testing.T)</a>

```
searchKey: http_test.TestClientRedirect308NoGetBody
tags: [method private test]
```

```Go
func TestClientRedirect308NoGetBody(t *testing.T)
```

Don't follow a 307/308 if we can't resent the request body. 

### <a id="TestClientRedirect308NoLocation" href="#TestClientRedirect308NoLocation">func TestClientRedirect308NoLocation(t *testing.T)</a>

```
searchKey: http_test.TestClientRedirect308NoLocation
tags: [method private test]
```

```Go
func TestClientRedirect308NoLocation(t *testing.T)
```

Issue 17773: don't follow a 308 (or 307) if the response doesn't have a Location header. 

### <a id="TestClientRedirectContext" href="#TestClientRedirectContext">func TestClientRedirectContext(t *testing.T)</a>

```
searchKey: http_test.TestClientRedirectContext
tags: [method private test]
```

```Go
func TestClientRedirectContext(t *testing.T)
```

Tests that Client redirects' contexts are derived from the original request's context. 

### <a id="TestClientRedirectEatsBody_h1" href="#TestClientRedirectEatsBody_h1">func TestClientRedirectEatsBody_h1(t *testing.T)</a>

```
searchKey: http_test.TestClientRedirectEatsBody_h1
tags: [method private test]
```

```Go
func TestClientRedirectEatsBody_h1(t *testing.T)
```

### <a id="TestClientRedirectEatsBody_h2" href="#TestClientRedirectEatsBody_h2">func TestClientRedirectEatsBody_h2(t *testing.T)</a>

```
searchKey: http_test.TestClientRedirectEatsBody_h2
tags: [method private test]
```

```Go
func TestClientRedirectEatsBody_h2(t *testing.T)
```

### <a id="TestClientRedirectResponseWithoutRequest" href="#TestClientRedirectResponseWithoutRequest">func TestClientRedirectResponseWithoutRequest(t *testing.T)</a>

```
searchKey: http_test.TestClientRedirectResponseWithoutRequest
tags: [method private test]
```

```Go
func TestClientRedirectResponseWithoutRequest(t *testing.T)
```

Issue 15577: don't assume the roundtripper's response populates its Request field. 

### <a id="TestClientRedirectTypes" href="#TestClientRedirectTypes">func TestClientRedirectTypes(t *testing.T)</a>

```
searchKey: http_test.TestClientRedirectTypes
tags: [method private test]
```

```Go
func TestClientRedirectTypes(t *testing.T)
```

### <a id="TestClientRedirectUseResponse" href="#TestClientRedirectUseResponse">func TestClientRedirectUseResponse(t *testing.T)</a>

```
searchKey: http_test.TestClientRedirectUseResponse
tags: [method private test]
```

```Go
func TestClientRedirectUseResponse(t *testing.T)
```

### <a id="TestClientRedirects" href="#TestClientRedirects">func TestClientRedirects(t *testing.T)</a>

```
searchKey: http_test.TestClientRedirects
tags: [method private test]
```

```Go
func TestClientRedirects(t *testing.T)
```

### <a id="TestClientSendsCookieFromJar" href="#TestClientSendsCookieFromJar">func TestClientSendsCookieFromJar(t *testing.T)</a>

```
searchKey: http_test.TestClientSendsCookieFromJar
tags: [method private test]
```

```Go
func TestClientSendsCookieFromJar(t *testing.T)
```

### <a id="TestClientTimeoutCancel" href="#TestClientTimeoutCancel">func TestClientTimeoutCancel(t *testing.T)</a>

```
searchKey: http_test.TestClientTimeoutCancel
tags: [method private test]
```

```Go
func TestClientTimeoutCancel(t *testing.T)
```

Issue 16094: if Client.Timeout is set but not hit, a Timeout error shouldn't be returned. 

### <a id="TestClientTimeoutKillsConn_AfterHeaders" href="#TestClientTimeoutKillsConn_AfterHeaders">func TestClientTimeoutKillsConn_AfterHeaders(t *testing.T)</a>

```
searchKey: http_test.TestClientTimeoutKillsConn_AfterHeaders
tags: [method private test]
```

```Go
func TestClientTimeoutKillsConn_AfterHeaders(t *testing.T)
```

Issue 23399: verify that if a client request times out, the Transport's conn is closed so that it's not reused. 

This is the test variant that has the server send response headers first, and time out during the write of the response body. 

### <a id="TestClientTimeoutKillsConn_BeforeHeaders" href="#TestClientTimeoutKillsConn_BeforeHeaders">func TestClientTimeoutKillsConn_BeforeHeaders(t *testing.T)</a>

```
searchKey: http_test.TestClientTimeoutKillsConn_BeforeHeaders
tags: [method private test]
```

```Go
func TestClientTimeoutKillsConn_BeforeHeaders(t *testing.T)
```

Issue 23399: verify that if a client request times out, the Transport's conn is closed so that it's not reused. 

This is the test variant that times out before the server replies with any response headers. 

### <a id="TestClientTimeout_Headers_h1" href="#TestClientTimeout_Headers_h1">func TestClientTimeout_Headers_h1(t *testing.T)</a>

```
searchKey: http_test.TestClientTimeout_Headers_h1
tags: [method private test]
```

```Go
func TestClientTimeout_Headers_h1(t *testing.T)
```

### <a id="TestClientTimeout_Headers_h2" href="#TestClientTimeout_Headers_h2">func TestClientTimeout_Headers_h2(t *testing.T)</a>

```
searchKey: http_test.TestClientTimeout_Headers_h2
tags: [method private test]
```

```Go
func TestClientTimeout_Headers_h2(t *testing.T)
```

### <a id="TestClientTimeout_h1" href="#TestClientTimeout_h1">func TestClientTimeout_h1(t *testing.T)</a>

```
searchKey: http_test.TestClientTimeout_h1
tags: [method private test]
```

```Go
func TestClientTimeout_h1(t *testing.T)
```

### <a id="TestClientTimeout_h2" href="#TestClientTimeout_h2">func TestClientTimeout_h2(t *testing.T)</a>

```
searchKey: http_test.TestClientTimeout_h2
tags: [method private test]
```

```Go
func TestClientTimeout_h2(t *testing.T)
```

### <a id="TestClientWithCorrectTLSServerName" href="#TestClientWithCorrectTLSServerName">func TestClientWithCorrectTLSServerName(t *testing.T)</a>

```
searchKey: http_test.TestClientWithCorrectTLSServerName
tags: [method private test]
```

```Go
func TestClientWithCorrectTLSServerName(t *testing.T)
```

### <a id="TestClientWithIncorrectTLSServerName" href="#TestClientWithIncorrectTLSServerName">func TestClientWithIncorrectTLSServerName(t *testing.T)</a>

```
searchKey: http_test.TestClientWithIncorrectTLSServerName
tags: [method private test]
```

```Go
func TestClientWithIncorrectTLSServerName(t *testing.T)
```

### <a id="TestClientWriteShutdown" href="#TestClientWriteShutdown">func TestClientWriteShutdown(t *testing.T)</a>

```
searchKey: http_test.TestClientWriteShutdown
tags: [method private test]
```

```Go
func TestClientWriteShutdown(t *testing.T)
```

TestClientWriteShutdown tests that if the client shuts down the write side of their TCP connection, the server doesn't send a 400 Bad Request. 

### <a id="TestClientWrites" href="#TestClientWrites">func TestClientWrites(t *testing.T)</a>

```
searchKey: http_test.TestClientWrites
tags: [method private test]
```

```Go
func TestClientWrites(t *testing.T)
```

TestClientWrites verifies that client requests are buffered and we don't send a TCP packet per line of the http request + body. 

### <a id="TestCloseIdleConnections_h1" href="#TestCloseIdleConnections_h1">func TestCloseIdleConnections_h1(t *testing.T)</a>

```
searchKey: http_test.TestCloseIdleConnections_h1
tags: [method private test]
```

```Go
func TestCloseIdleConnections_h1(t *testing.T)
```

Issue 14607 

### <a id="TestCloseIdleConnections_h2" href="#TestCloseIdleConnections_h2">func TestCloseIdleConnections_h2(t *testing.T)</a>

```
searchKey: http_test.TestCloseIdleConnections_h2
tags: [method private test]
```

```Go
func TestCloseIdleConnections_h2(t *testing.T)
```

### <a id="TestCloseNotifier" href="#TestCloseNotifier">func TestCloseNotifier(t *testing.T)</a>

```
searchKey: http_test.TestCloseNotifier
tags: [method private test]
```

```Go
func TestCloseNotifier(t *testing.T)
```

### <a id="TestCloseNotifierChanLeak" href="#TestCloseNotifierChanLeak">func TestCloseNotifierChanLeak(t *testing.T)</a>

```
searchKey: http_test.TestCloseNotifierChanLeak
tags: [method private test]
```

```Go
func TestCloseNotifierChanLeak(t *testing.T)
```

### <a id="TestCloseNotifierPipelined" href="#TestCloseNotifierPipelined">func TestCloseNotifierPipelined(t *testing.T)</a>

```
searchKey: http_test.TestCloseNotifierPipelined
tags: [method private test]
```

```Go
func TestCloseNotifierPipelined(t *testing.T)
```

Tests that a pipelined request does not cause the first request's Handler's CloseNotify channel to fire. 

Issue 13165 (where it used to deadlock), but behavior changed in Issue 23921. 

### <a id="TestCloseWrite" href="#TestCloseWrite">func TestCloseWrite(t *testing.T)</a>

```
searchKey: http_test.TestCloseWrite
tags: [method private test]
```

```Go
func TestCloseWrite(t *testing.T)
```

### <a id="TestCodesPreventingContentTypeAndBody" href="#TestCodesPreventingContentTypeAndBody">func TestCodesPreventingContentTypeAndBody(t *testing.T)</a>

```
searchKey: http_test.TestCodesPreventingContentTypeAndBody
tags: [method private test]
```

```Go
func TestCodesPreventingContentTypeAndBody(t *testing.T)
```

Issue 6157, Issue 6685 

### <a id="TestConcurrentReadWriteReqBody_h1" href="#TestConcurrentReadWriteReqBody_h1">func TestConcurrentReadWriteReqBody_h1(t *testing.T)</a>

```
searchKey: http_test.TestConcurrentReadWriteReqBody_h1
tags: [method private test]
```

```Go
func TestConcurrentReadWriteReqBody_h1(t *testing.T)
```

### <a id="TestConcurrentReadWriteReqBody_h2" href="#TestConcurrentReadWriteReqBody_h2">func TestConcurrentReadWriteReqBody_h2(t *testing.T)</a>

```
searchKey: http_test.TestConcurrentReadWriteReqBody_h2
tags: [method private test]
```

```Go
func TestConcurrentReadWriteReqBody_h2(t *testing.T)
```

### <a id="TestConcurrentServerServe" href="#TestConcurrentServerServe">func TestConcurrentServerServe(t *testing.T)</a>

```
searchKey: http_test.TestConcurrentServerServe
tags: [method private test]
```

```Go
func TestConcurrentServerServe(t *testing.T)
```

Verify this doesn't race (Issue 16505) 

### <a id="TestConnContextNotModifyingAllContexts" href="#TestConnContextNotModifyingAllContexts">func TestConnContextNotModifyingAllContexts(t *testing.T)</a>

```
searchKey: http_test.TestConnContextNotModifyingAllContexts
tags: [method private test]
```

```Go
func TestConnContextNotModifyingAllContexts(t *testing.T)
```

Issue 35750: check ConnContext not modifying context for other connections 

### <a id="TestConnectRequest_h1" href="#TestConnectRequest_h1">func TestConnectRequest_h1(t *testing.T)</a>

```
searchKey: http_test.TestConnectRequest_h1
tags: [method private test]
```

```Go
func TestConnectRequest_h1(t *testing.T)
```

### <a id="TestConnectRequest_h2" href="#TestConnectRequest_h2">func TestConnectRequest_h2(t *testing.T)</a>

```
searchKey: http_test.TestConnectRequest_h2
tags: [method private test]
```

```Go
func TestConnectRequest_h2(t *testing.T)
```

### <a id="TestConsumingBodyOnNextConn" href="#TestConsumingBodyOnNextConn">func TestConsumingBodyOnNextConn(t *testing.T)</a>

```
searchKey: http_test.TestConsumingBodyOnNextConn
tags: [method private test]
```

```Go
func TestConsumingBodyOnNextConn(t *testing.T)
```

### <a id="TestContentEncodingNoSniffing_h1" href="#TestContentEncodingNoSniffing_h1">func TestContentEncodingNoSniffing_h1(t *testing.T)</a>

```
searchKey: http_test.TestContentEncodingNoSniffing_h1
tags: [method private test]
```

```Go
func TestContentEncodingNoSniffing_h1(t *testing.T)
```

### <a id="TestContentEncodingNoSniffing_h2" href="#TestContentEncodingNoSniffing_h2">func TestContentEncodingNoSniffing_h2(t *testing.T)</a>

```
searchKey: http_test.TestContentEncodingNoSniffing_h2
tags: [method private test]
```

```Go
func TestContentEncodingNoSniffing_h2(t *testing.T)
```

### <a id="TestContentLengthZero" href="#TestContentLengthZero">func TestContentLengthZero(t *testing.T)</a>

```
searchKey: http_test.TestContentLengthZero
tags: [method private test]
```

```Go
func TestContentLengthZero(t *testing.T)
```

TestContentLengthZero tests that for both an HTTP/1.0 and HTTP/1.1 request (both keep-alive), when a Handler never writes any response, the net/http package adds a "Content-Length: 0" response header. 

### <a id="TestContentTypeOkayOn204" href="#TestContentTypeOkayOn204">func TestContentTypeOkayOn204(t *testing.T)</a>

```
searchKey: http_test.TestContentTypeOkayOn204
tags: [method private test]
```

```Go
func TestContentTypeOkayOn204(t *testing.T)
```

### <a id="TestContentTypeWithVariousSources_h1" href="#TestContentTypeWithVariousSources_h1">func TestContentTypeWithVariousSources_h1(t *testing.T)</a>

```
searchKey: http_test.TestContentTypeWithVariousSources_h1
tags: [method private test]
```

```Go
func TestContentTypeWithVariousSources_h1(t *testing.T)
```

### <a id="TestContentTypeWithVariousSources_h2" href="#TestContentTypeWithVariousSources_h2">func TestContentTypeWithVariousSources_h2(t *testing.T)</a>

```
searchKey: http_test.TestContentTypeWithVariousSources_h2
tags: [method private test]
```

```Go
func TestContentTypeWithVariousSources_h2(t *testing.T)
```

### <a id="TestDeleteRedirects" href="#TestDeleteRedirects">func TestDeleteRedirects(t *testing.T)</a>

```
searchKey: http_test.TestDeleteRedirects
tags: [method private test]
```

```Go
func TestDeleteRedirects(t *testing.T)
```

### <a id="TestDetectContentType" href="#TestDetectContentType">func TestDetectContentType(t *testing.T)</a>

```
searchKey: http_test.TestDetectContentType
tags: [method private test]
```

```Go
func TestDetectContentType(t *testing.T)
```

### <a id="TestDirJoin" href="#TestDirJoin">func TestDirJoin(t *testing.T)</a>

```
searchKey: http_test.TestDirJoin
tags: [method private test]
```

```Go
func TestDirJoin(t *testing.T)
```

### <a id="TestDirectoryIfNotModified" href="#TestDirectoryIfNotModified">func TestDirectoryIfNotModified(t *testing.T)</a>

```
searchKey: http_test.TestDirectoryIfNotModified
tags: [method private test]
```

```Go
func TestDirectoryIfNotModified(t *testing.T)
```

### <a id="TestDisableKeepAliveUpgrade" href="#TestDisableKeepAliveUpgrade">func TestDisableKeepAliveUpgrade(t *testing.T)</a>

```
searchKey: http_test.TestDisableKeepAliveUpgrade
tags: [method private test]
```

```Go
func TestDisableKeepAliveUpgrade(t *testing.T)
```

### <a id="TestDontCacheBrokenHTTP2Conn" href="#TestDontCacheBrokenHTTP2Conn">func TestDontCacheBrokenHTTP2Conn(t *testing.T)</a>

```
searchKey: http_test.TestDontCacheBrokenHTTP2Conn
tags: [method private test]
```

```Go
func TestDontCacheBrokenHTTP2Conn(t *testing.T)
```

Issue 34978: don't cache a broken HTTP/2 connection 

### <a id="TestDoubleHijack" href="#TestDoubleHijack">func TestDoubleHijack(t *testing.T)</a>

```
searchKey: http_test.TestDoubleHijack
tags: [method private test]
```

```Go
func TestDoubleHijack(t *testing.T)
```

### <a id="TestEmptyDirOpenCWD" href="#TestEmptyDirOpenCWD">func TestEmptyDirOpenCWD(t *testing.T)</a>

```
searchKey: http_test.TestEmptyDirOpenCWD
tags: [method private test]
```

```Go
func TestEmptyDirOpenCWD(t *testing.T)
```

### <a id="TestEmptyPasswordAuth" href="#TestEmptyPasswordAuth">func TestEmptyPasswordAuth(t *testing.T)</a>

```
searchKey: http_test.TestEmptyPasswordAuth
tags: [method private test]
```

```Go
func TestEmptyPasswordAuth(t *testing.T)
```

### <a id="TestErrorWriteLoopRace" href="#TestErrorWriteLoopRace">func TestErrorWriteLoopRace(t *testing.T)</a>

```
searchKey: http_test.TestErrorWriteLoopRace
tags: [method private test]
```

```Go
func TestErrorWriteLoopRace(t *testing.T)
```

Issue 37669 Test that a cancellation doesn't result in a data race due to the writeLoop goroutine being left running, if the caller mutates the processed Request upon completion. 

### <a id="TestFSRedirect" href="#TestFSRedirect">func TestFSRedirect(t *testing.T)</a>

```
searchKey: http_test.TestFSRedirect
tags: [method private test]
```

```Go
func TestFSRedirect(t *testing.T)
```

### <a id="TestFileServerCleanPath" href="#TestFileServerCleanPath">func TestFileServerCleanPath(t *testing.T)</a>

```
searchKey: http_test.TestFileServerCleanPath
tags: [method private test]
```

```Go
func TestFileServerCleanPath(t *testing.T)
```

### <a id="TestFileServerCleans" href="#TestFileServerCleans">func TestFileServerCleans(t *testing.T)</a>

```
searchKey: http_test.TestFileServerCleans
tags: [method private test]
```

```Go
func TestFileServerCleans(t *testing.T)
```

### <a id="TestFileServerEscapesNames" href="#TestFileServerEscapesNames">func TestFileServerEscapesNames(t *testing.T)</a>

```
searchKey: http_test.TestFileServerEscapesNames
tags: [method private test]
```

```Go
func TestFileServerEscapesNames(t *testing.T)
```

### <a id="TestFileServerImplicitLeadingSlash" href="#TestFileServerImplicitLeadingSlash">func TestFileServerImplicitLeadingSlash(t *testing.T)</a>

```
searchKey: http_test.TestFileServerImplicitLeadingSlash
tags: [method private test]
```

```Go
func TestFileServerImplicitLeadingSlash(t *testing.T)
```

### <a id="TestFileServerNotDirError" href="#TestFileServerNotDirError">func TestFileServerNotDirError(t *testing.T)</a>

```
searchKey: http_test.TestFileServerNotDirError
tags: [method private test]
```

```Go
func TestFileServerNotDirError(t *testing.T)
```

Issue 18984: tests that requests for paths beyond files return not-found errors 

### <a id="TestFileServerSortsNames" href="#TestFileServerSortsNames">func TestFileServerSortsNames(t *testing.T)</a>

```
searchKey: http_test.TestFileServerSortsNames
tags: [method private test]
```

```Go
func TestFileServerSortsNames(t *testing.T)
```

### <a id="TestFileServerZeroByte" href="#TestFileServerZeroByte">func TestFileServerZeroByte(t *testing.T)</a>

```
searchKey: http_test.TestFileServerZeroByte
tags: [method private test]
```

```Go
func TestFileServerZeroByte(t *testing.T)
```

### <a id="TestFormFileCallsParseMultipartForm" href="#TestFormFileCallsParseMultipartForm">func TestFormFileCallsParseMultipartForm(t *testing.T)</a>

```
searchKey: http_test.TestFormFileCallsParseMultipartForm
tags: [method private test]
```

```Go
func TestFormFileCallsParseMultipartForm(t *testing.T)
```

Test that FormFile invokes ParseMultipartForm. 

### <a id="TestFormFileOrder" href="#TestFormFileOrder">func TestFormFileOrder(t *testing.T)</a>

```
searchKey: http_test.TestFormFileOrder
tags: [method private test]
```

```Go
func TestFormFileOrder(t *testing.T)
```

Test that FormFile errors if called after MultipartReader on the same request. 

### <a id="TestFormValueCallsParseMultipartForm" href="#TestFormValueCallsParseMultipartForm">func TestFormValueCallsParseMultipartForm(t *testing.T)</a>

```
searchKey: http_test.TestFormValueCallsParseMultipartForm
tags: [method private test]
```

```Go
func TestFormValueCallsParseMultipartForm(t *testing.T)
```

Test that FormValue invokes ParseMultipartForm. 

### <a id="TestGetBasicAuth" href="#TestGetBasicAuth">func TestGetBasicAuth(t *testing.T)</a>

```
searchKey: http_test.TestGetBasicAuth
tags: [method private test]
```

```Go
func TestGetBasicAuth(t *testing.T)
```

### <a id="TestGetRequestFormat" href="#TestGetRequestFormat">func TestGetRequestFormat(t *testing.T)</a>

```
searchKey: http_test.TestGetRequestFormat
tags: [method private test]
```

```Go
func TestGetRequestFormat(t *testing.T)
```

### <a id="TestH12_200NoBody" href="#TestH12_200NoBody">func TestH12_200NoBody(t *testing.T)</a>

```
searchKey: http_test.TestH12_200NoBody
tags: [method private test]
```

```Go
func TestH12_200NoBody(t *testing.T)
```

### <a id="TestH12_AutoGzip" href="#TestH12_AutoGzip">func TestH12_AutoGzip(t *testing.T)</a>

```
searchKey: http_test.TestH12_AutoGzip
tags: [method private test]
```

```Go
func TestH12_AutoGzip(t *testing.T)
```

Verify that both our HTTP/1 and HTTP/2 request and auto-decompress gzip. Some hosts send gzip even if you don't ask for it; see golang.org/issue/13298 

### <a id="TestH12_AutoGzipWithDumpResponse" href="#TestH12_AutoGzipWithDumpResponse">func TestH12_AutoGzipWithDumpResponse(t *testing.T)</a>

```
searchKey: http_test.TestH12_AutoGzipWithDumpResponse
tags: [method private test]
```

```Go
func TestH12_AutoGzipWithDumpResponse(t *testing.T)
```

Issue 15366 

### <a id="TestH12_AutoGzip_Disabled" href="#TestH12_AutoGzip_Disabled">func TestH12_AutoGzip_Disabled(t *testing.T)</a>

```
searchKey: http_test.TestH12_AutoGzip_Disabled
tags: [method private test]
```

```Go
func TestH12_AutoGzip_Disabled(t *testing.T)
```

### <a id="TestH12_ExplicitContentLength" href="#TestH12_ExplicitContentLength">func TestH12_ExplicitContentLength(t *testing.T)</a>

```
searchKey: http_test.TestH12_ExplicitContentLength
tags: [method private test]
```

```Go
func TestH12_ExplicitContentLength(t *testing.T)
```

### <a id="TestH12_FlushBeforeBody" href="#TestH12_FlushBeforeBody">func TestH12_FlushBeforeBody(t *testing.T)</a>

```
searchKey: http_test.TestH12_FlushBeforeBody
tags: [method private test]
```

```Go
func TestH12_FlushBeforeBody(t *testing.T)
```

### <a id="TestH12_FlushMidBody" href="#TestH12_FlushMidBody">func TestH12_FlushMidBody(t *testing.T)</a>

```
searchKey: http_test.TestH12_FlushMidBody
tags: [method private test]
```

```Go
func TestH12_FlushMidBody(t *testing.T)
```

### <a id="TestH12_HandlerWritesTooLittle" href="#TestH12_HandlerWritesTooLittle">func TestH12_HandlerWritesTooLittle(t *testing.T)</a>

```
searchKey: http_test.TestH12_HandlerWritesTooLittle
tags: [method private test]
```

```Go
func TestH12_HandlerWritesTooLittle(t *testing.T)
```

### <a id="TestH12_HandlerWritesTooMuch" href="#TestH12_HandlerWritesTooMuch">func TestH12_HandlerWritesTooMuch(t *testing.T)</a>

```
searchKey: http_test.TestH12_HandlerWritesTooMuch
tags: [method private test]
```

```Go
func TestH12_HandlerWritesTooMuch(t *testing.T)
```

Tests that the HTTP/1 and HTTP/2 servers prevent handlers from writing more than they declared. This test does not test whether the transport deals with too much data, though, since the server doesn't make it possible to send bogus data. For those tests, see transport_test.go (for HTTP/1) or x/net/http2/transport_test.go (for HTTP/2). 

### <a id="TestH12_HeadContentLengthLargeBody" href="#TestH12_HeadContentLengthLargeBody">func TestH12_HeadContentLengthLargeBody(t *testing.T)</a>

```
searchKey: http_test.TestH12_HeadContentLengthLargeBody
tags: [method private test]
```

```Go
func TestH12_HeadContentLengthLargeBody(t *testing.T)
```

### <a id="TestH12_HeadContentLengthNoBody" href="#TestH12_HeadContentLengthNoBody">func TestH12_HeadContentLengthNoBody(t *testing.T)</a>

```
searchKey: http_test.TestH12_HeadContentLengthNoBody
tags: [method private test]
```

```Go
func TestH12_HeadContentLengthNoBody(t *testing.T)
```

Issue 13532 

### <a id="TestH12_HeadContentLengthSmallBody" href="#TestH12_HeadContentLengthSmallBody">func TestH12_HeadContentLengthSmallBody(t *testing.T)</a>

```
searchKey: http_test.TestH12_HeadContentLengthSmallBody
tags: [method private test]
```

```Go
func TestH12_HeadContentLengthSmallBody(t *testing.T)
```

### <a id="TestH12_Head_ExplicitLen" href="#TestH12_Head_ExplicitLen">func TestH12_Head_ExplicitLen(t *testing.T)</a>

```
searchKey: http_test.TestH12_Head_ExplicitLen
tags: [method private test]
```

```Go
func TestH12_Head_ExplicitLen(t *testing.T)
```

### <a id="TestH12_Head_ImplicitLen" href="#TestH12_Head_ImplicitLen">func TestH12_Head_ImplicitLen(t *testing.T)</a>

```
searchKey: http_test.TestH12_Head_ImplicitLen
tags: [method private test]
```

```Go
func TestH12_Head_ImplicitLen(t *testing.T)
```

### <a id="TestH12_RequestContentLength_Known_NonZero" href="#TestH12_RequestContentLength_Known_NonZero">func TestH12_RequestContentLength_Known_NonZero(t *testing.T)</a>

```
searchKey: http_test.TestH12_RequestContentLength_Known_NonZero
tags: [method private test]
```

```Go
func TestH12_RequestContentLength_Known_NonZero(t *testing.T)
```

### <a id="TestH12_RequestContentLength_Known_Zero" href="#TestH12_RequestContentLength_Known_Zero">func TestH12_RequestContentLength_Known_Zero(t *testing.T)</a>

```
searchKey: http_test.TestH12_RequestContentLength_Known_Zero
tags: [method private test]
```

```Go
func TestH12_RequestContentLength_Known_Zero(t *testing.T)
```

### <a id="TestH12_RequestContentLength_Unknown" href="#TestH12_RequestContentLength_Unknown">func TestH12_RequestContentLength_Unknown(t *testing.T)</a>

```
searchKey: http_test.TestH12_RequestContentLength_Unknown
tags: [method private test]
```

```Go
func TestH12_RequestContentLength_Unknown(t *testing.T)
```

### <a id="TestH12_ServerEmptyContentLength" href="#TestH12_ServerEmptyContentLength">func TestH12_ServerEmptyContentLength(t *testing.T)</a>

```
searchKey: http_test.TestH12_ServerEmptyContentLength
tags: [method private test]
```

```Go
func TestH12_ServerEmptyContentLength(t *testing.T)
```

### <a id="TestH12_SmallBody" href="#TestH12_SmallBody">func TestH12_SmallBody(t *testing.T)</a>

```
searchKey: http_test.TestH12_SmallBody
tags: [method private test]
```

```Go
func TestH12_SmallBody(t *testing.T)
```

### <a id="TestH12_WebSocketUpgrade" href="#TestH12_WebSocketUpgrade">func TestH12_WebSocketUpgrade(t *testing.T)</a>

```
searchKey: http_test.TestH12_WebSocketUpgrade
tags: [method private test]
```

```Go
func TestH12_WebSocketUpgrade(t *testing.T)
```

Always use HTTP/1.1 for WebSocket upgrades. 

### <a id="TestH2_204NoBody" href="#TestH2_204NoBody">func TestH2_204NoBody(t *testing.T)</a>

```
searchKey: http_test.TestH2_204NoBody
tags: [method private test]
```

```Go
func TestH2_204NoBody(t *testing.T)
```

### <a id="TestH2_304NoBody" href="#TestH2_304NoBody">func TestH2_304NoBody(t *testing.T)</a>

```
searchKey: http_test.TestH2_304NoBody
tags: [method private test]
```

```Go
func TestH2_304NoBody(t *testing.T)
```

### <a id="TestH2_404NoBody" href="#TestH2_404NoBody">func TestH2_404NoBody(t *testing.T)</a>

```
searchKey: http_test.TestH2_404NoBody
tags: [method private test]
```

```Go
func TestH2_404NoBody(t *testing.T)
```

### <a id="TestHTTP10ConnectionHeader" href="#TestHTTP10ConnectionHeader">func TestHTTP10ConnectionHeader(t *testing.T)</a>

```
searchKey: http_test.TestHTTP10ConnectionHeader
tags: [method private test]
```

```Go
func TestHTTP10ConnectionHeader(t *testing.T)
```

[https://golang.org/issue/5955](https://golang.org/issue/5955) Note that this does not test the "request too large" exit path from the http server. This is intentional; not sending Connection: close is just a minor wire optimization and is pointless if dealing with a badly behaved client. 

### <a id="TestHTTP10KeepAlive204Response" href="#TestHTTP10KeepAlive204Response">func TestHTTP10KeepAlive204Response(t *testing.T)</a>

```
searchKey: http_test.TestHTTP10KeepAlive204Response
tags: [method private test]
```

```Go
func TestHTTP10KeepAlive204Response(t *testing.T)
```

Issue 15647: 204 responses can't have bodies, so HTTP/1.0 keep-alive conns should stay open. 

### <a id="TestHTTP10KeepAlive304Response" href="#TestHTTP10KeepAlive304Response">func TestHTTP10KeepAlive304Response(t *testing.T)</a>

```
searchKey: http_test.TestHTTP10KeepAlive304Response
tags: [method private test]
```

```Go
func TestHTTP10KeepAlive304Response(t *testing.T)
```

### <a id="TestHTTP11KeepAlive204Response" href="#TestHTTP11KeepAlive204Response">func TestHTTP11KeepAlive204Response(t *testing.T)</a>

```
searchKey: http_test.TestHTTP11KeepAlive204Response
tags: [method private test]
```

```Go
func TestHTTP11KeepAlive204Response(t *testing.T)
```

### <a id="TestHTTP2NoWriteDeadline" href="#TestHTTP2NoWriteDeadline">func TestHTTP2NoWriteDeadline(t *testing.T)</a>

```
searchKey: http_test.TestHTTP2NoWriteDeadline
tags: [method private test]
```

```Go
func TestHTTP2NoWriteDeadline(t *testing.T)
```

Test that the HTTP/2 server does not send RST when WriteDeadline not set. 

### <a id="TestHTTP2UpgradeClosesConnection" href="#TestHTTP2UpgradeClosesConnection">func TestHTTP2UpgradeClosesConnection(t *testing.T)</a>

```
searchKey: http_test.TestHTTP2UpgradeClosesConnection
tags: [method private test]
```

```Go
func TestHTTP2UpgradeClosesConnection(t *testing.T)
```

### <a id="TestHTTP2WriteDeadlineEnforcedPerStream" href="#TestHTTP2WriteDeadlineEnforcedPerStream">func TestHTTP2WriteDeadlineEnforcedPerStream(t *testing.T)</a>

```
searchKey: http_test.TestHTTP2WriteDeadlineEnforcedPerStream
tags: [method private test]
```

```Go
func TestHTTP2WriteDeadlineEnforcedPerStream(t *testing.T)
```

Test that the HTTP/2 server RSTs stream on slow write. 

### <a id="TestHTTP2WriteDeadlineExtendedOnNewRequest" href="#TestHTTP2WriteDeadlineExtendedOnNewRequest">func TestHTTP2WriteDeadlineExtendedOnNewRequest(t *testing.T)</a>

```
searchKey: http_test.TestHTTP2WriteDeadlineExtendedOnNewRequest
tags: [method private test]
```

```Go
func TestHTTP2WriteDeadlineExtendedOnNewRequest(t *testing.T)
```

Test that the HTTP/2 server handles Server.WriteTimeout (Issue 18437) 

### <a id="TestHTTPSClientDetectsHTTPServer" href="#TestHTTPSClientDetectsHTTPServer">func TestHTTPSClientDetectsHTTPServer(t *testing.T)</a>

```
searchKey: http_test.TestHTTPSClientDetectsHTTPServer
tags: [method private test]
```

```Go
func TestHTTPSClientDetectsHTTPServer(t *testing.T)
```

Check that an HTTPS client can interpret a particular TLS error to determine that the server is speaking HTTP. See golang.org/issue/11111. 

### <a id="TestHandlerBodyClose" href="#TestHandlerBodyClose">func TestHandlerBodyClose(t *testing.T)</a>

```
searchKey: http_test.TestHandlerBodyClose
tags: [method private test]
```

```Go
func TestHandlerBodyClose(t *testing.T)
```

### <a id="TestHandlerFinishSkipBigContentLengthRead" href="#TestHandlerFinishSkipBigContentLengthRead">func TestHandlerFinishSkipBigContentLengthRead(t *testing.T)</a>

```
searchKey: http_test.TestHandlerFinishSkipBigContentLengthRead
tags: [method private test]
```

```Go
func TestHandlerFinishSkipBigContentLengthRead(t *testing.T)
```

If a Handler finishes and there's an unread request body, verify the server try to do implicit read on it before replying. 

### <a id="TestHandlerPanicNil_h1" href="#TestHandlerPanicNil_h1">func TestHandlerPanicNil_h1(t *testing.T)</a>

```
searchKey: http_test.TestHandlerPanicNil_h1
tags: [method private test]
```

```Go
func TestHandlerPanicNil_h1(t *testing.T)
```

### <a id="TestHandlerPanicNil_h2" href="#TestHandlerPanicNil_h2">func TestHandlerPanicNil_h2(t *testing.T)</a>

```
searchKey: http_test.TestHandlerPanicNil_h2
tags: [method private test]
```

```Go
func TestHandlerPanicNil_h2(t *testing.T)
```

### <a id="TestHandlerPanicWithHijack" href="#TestHandlerPanicWithHijack">func TestHandlerPanicWithHijack(t *testing.T)</a>

```
searchKey: http_test.TestHandlerPanicWithHijack
tags: [method private test]
```

```Go
func TestHandlerPanicWithHijack(t *testing.T)
```

### <a id="TestHandlerPanic_h1" href="#TestHandlerPanic_h1">func TestHandlerPanic_h1(t *testing.T)</a>

```
searchKey: http_test.TestHandlerPanic_h1
tags: [method private test]
```

```Go
func TestHandlerPanic_h1(t *testing.T)
```

### <a id="TestHandlerPanic_h2" href="#TestHandlerPanic_h2">func TestHandlerPanic_h2(t *testing.T)</a>

```
searchKey: http_test.TestHandlerPanic_h2
tags: [method private test]
```

```Go
func TestHandlerPanic_h2(t *testing.T)
```

### <a id="TestHandlerSetTransferEncodingChunked" href="#TestHandlerSetTransferEncodingChunked">func TestHandlerSetTransferEncodingChunked(t *testing.T)</a>

```
searchKey: http_test.TestHandlerSetTransferEncodingChunked
tags: [method private test]
```

```Go
func TestHandlerSetTransferEncodingChunked(t *testing.T)
```

[https://golang.org/issue/15960](https://golang.org/issue/15960) 

### <a id="TestHandlerSetTransferEncodingGzip" href="#TestHandlerSetTransferEncodingGzip">func TestHandlerSetTransferEncodingGzip(t *testing.T)</a>

```
searchKey: http_test.TestHandlerSetTransferEncodingGzip
tags: [method private test]
```

```Go
func TestHandlerSetTransferEncodingGzip(t *testing.T)
```

[https://golang.org/issue/16063](https://golang.org/issue/16063) 

### <a id="TestHandlerSetsBodyNil_h1" href="#TestHandlerSetsBodyNil_h1">func TestHandlerSetsBodyNil_h1(t *testing.T)</a>

```
searchKey: http_test.TestHandlerSetsBodyNil_h1
tags: [method private test]
```

```Go
func TestHandlerSetsBodyNil_h1(t *testing.T)
```

### <a id="TestHandlerSetsBodyNil_h2" href="#TestHandlerSetsBodyNil_h2">func TestHandlerSetsBodyNil_h2(t *testing.T)</a>

```
searchKey: http_test.TestHandlerSetsBodyNil_h2
tags: [method private test]
```

```Go
func TestHandlerSetsBodyNil_h2(t *testing.T)
```

### <a id="TestHandlersCanSetConnectionClose10" href="#TestHandlersCanSetConnectionClose10">func TestHandlersCanSetConnectionClose10(t *testing.T)</a>

```
searchKey: http_test.TestHandlersCanSetConnectionClose10
tags: [method private test]
```

```Go
func TestHandlersCanSetConnectionClose10(t *testing.T)
```

### <a id="TestHandlersCanSetConnectionClose11" href="#TestHandlersCanSetConnectionClose11">func TestHandlersCanSetConnectionClose11(t *testing.T)</a>

```
searchKey: http_test.TestHandlersCanSetConnectionClose11
tags: [method private test]
```

```Go
func TestHandlersCanSetConnectionClose11(t *testing.T)
```

TestHandlersCanSetConnectionClose verifies that handlers can force a connection to close, even for HTTP/1.1 requests. 

### <a id="TestHeadResponses_h1" href="#TestHeadResponses_h1">func TestHeadResponses_h1(t *testing.T)</a>

```
searchKey: http_test.TestHeadResponses_h1
tags: [method private test]
```

```Go
func TestHeadResponses_h1(t *testing.T)
```

TestHeadResponses verifies that all MIME type sniffing and Content-Length counting of GET requests also happens on HEAD requests. 

### <a id="TestHeadResponses_h2" href="#TestHeadResponses_h2">func TestHeadResponses_h2(t *testing.T)</a>

```
searchKey: http_test.TestHeadResponses_h2
tags: [method private test]
```

```Go
func TestHeadResponses_h2(t *testing.T)
```

### <a id="TestHeaderToWire" href="#TestHeaderToWire">func TestHeaderToWire(t *testing.T)</a>

```
searchKey: http_test.TestHeaderToWire
tags: [method private test]
```

```Go
func TestHeaderToWire(t *testing.T)
```

Tests regarding the ordering of Write, WriteHeader, Header, and Flush calls. In Go 1.0, rw.WriteHeader immediately flushed the (*response).header to the wire. In Go 1.1, the actual wire flush is delayed, so we could maybe tack on a Content-Length and better Content-Type after we see more (or all) of the output. To preserve compatibility with Go 1, we need to be careful to track which headers were live at the time of WriteHeader, so we write the same ones, even if the handler modifies them (~erroneously) after the first Write. 

### <a id="TestHijackAfterCloseNotifier" href="#TestHijackAfterCloseNotifier">func TestHijackAfterCloseNotifier(t *testing.T)</a>

```
searchKey: http_test.TestHijackAfterCloseNotifier
tags: [method private test]
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
tags: [method private test]
```

```Go
func TestHijackBeforeRequestBodyRead(t *testing.T)
```

### <a id="TestHostHandlers" href="#TestHostHandlers">func TestHostHandlers(t *testing.T)</a>

```
searchKey: http_test.TestHostHandlers
tags: [method private test]
```

```Go
func TestHostHandlers(t *testing.T)
```

### <a id="TestIdentityResponse" href="#TestIdentityResponse">func TestIdentityResponse(t *testing.T)</a>

```
searchKey: http_test.TestIdentityResponse
tags: [method private test]
```

```Go
func TestIdentityResponse(t *testing.T)
```

TestIdentityResponse verifies that a handler can unset 

### <a id="TestIdleConnChannelLeak" href="#TestIdleConnChannelLeak">func TestIdleConnChannelLeak(t *testing.T)</a>

```
searchKey: http_test.TestIdleConnChannelLeak
tags: [method private test]
```

```Go
func TestIdleConnChannelLeak(t *testing.T)
```

### <a id="TestIdleConnH2Crash" href="#TestIdleConnH2Crash">func TestIdleConnH2Crash(t *testing.T)</a>

```
searchKey: http_test.TestIdleConnH2Crash
tags: [method private test]
```

```Go
func TestIdleConnH2Crash(t *testing.T)
```

Issue 16208: Go 1.7 crashed after Transport.IdleConnTimeout if an HTTP/2 connection was established but its caller no longer wanted it. (Assuming the connection cache was enabled, which it is by default) 

This test reproduced the crash by setting the IdleConnTimeout low (to make the test reasonable) and then making a request which is canceled by the DialTLS hook, which then also waits to return the real connection until after the RoundTrip saw the error.  Then we know the successful tls.Dial from DialTLS will need to go into the idle pool. Then we give it a of time to explode. 

### <a id="TestInterruptWithPanic_ErrAbortHandler_h1" href="#TestInterruptWithPanic_ErrAbortHandler_h1">func TestInterruptWithPanic_ErrAbortHandler_h1(t *testing.T)</a>

```
searchKey: http_test.TestInterruptWithPanic_ErrAbortHandler_h1
tags: [method private test]
```

```Go
func TestInterruptWithPanic_ErrAbortHandler_h1(t *testing.T)
```

### <a id="TestInterruptWithPanic_ErrAbortHandler_h2" href="#TestInterruptWithPanic_ErrAbortHandler_h2">func TestInterruptWithPanic_ErrAbortHandler_h2(t *testing.T)</a>

```
searchKey: http_test.TestInterruptWithPanic_ErrAbortHandler_h2
tags: [method private test]
```

```Go
func TestInterruptWithPanic_ErrAbortHandler_h2(t *testing.T)
```

### <a id="TestInterruptWithPanic_h1" href="#TestInterruptWithPanic_h1">func TestInterruptWithPanic_h1(t *testing.T)</a>

```
searchKey: http_test.TestInterruptWithPanic_h1
tags: [method private test]
```

```Go
func TestInterruptWithPanic_h1(t *testing.T)
```

### <a id="TestInterruptWithPanic_h2" href="#TestInterruptWithPanic_h2">func TestInterruptWithPanic_h2(t *testing.T)</a>

```
searchKey: http_test.TestInterruptWithPanic_h2
tags: [method private test]
```

```Go
func TestInterruptWithPanic_h2(t *testing.T)
```

### <a id="TestInterruptWithPanic_nil_h1" href="#TestInterruptWithPanic_nil_h1">func TestInterruptWithPanic_nil_h1(t *testing.T)</a>

```
searchKey: http_test.TestInterruptWithPanic_nil_h1
tags: [method private test]
```

```Go
func TestInterruptWithPanic_nil_h1(t *testing.T)
```

### <a id="TestInterruptWithPanic_nil_h2" href="#TestInterruptWithPanic_nil_h2">func TestInterruptWithPanic_nil_h2(t *testing.T)</a>

```
searchKey: http_test.TestInterruptWithPanic_nil_h2
tags: [method private test]
```

```Go
func TestInterruptWithPanic_nil_h2(t *testing.T)
```

### <a id="TestInvalidHeaderResponse" href="#TestInvalidHeaderResponse">func TestInvalidHeaderResponse(t *testing.T)</a>

```
searchKey: http_test.TestInvalidHeaderResponse
tags: [method private test]
```

```Go
func TestInvalidHeaderResponse(t *testing.T)
```

### <a id="TestInvalidTrailerClosesConnection" href="#TestInvalidTrailerClosesConnection">func TestInvalidTrailerClosesConnection(t *testing.T)</a>

```
searchKey: http_test.TestInvalidTrailerClosesConnection
tags: [method private test]
```

```Go
func TestInvalidTrailerClosesConnection(t *testing.T)
```

### <a id="TestIs408" href="#TestIs408">func TestIs408(t *testing.T)</a>

```
searchKey: http_test.TestIs408
tags: [method private test]
```

```Go
func TestIs408(t *testing.T)
```

### <a id="TestIssue10884_MaxBytesEOF" href="#TestIssue10884_MaxBytesEOF">func TestIssue10884_MaxBytesEOF(t *testing.T)</a>

```
searchKey: http_test.TestIssue10884_MaxBytesEOF
tags: [method private test]
```

```Go
func TestIssue10884_MaxBytesEOF(t *testing.T)
```

### <a id="TestIssue11549_Expect100" href="#TestIssue11549_Expect100">func TestIssue11549_Expect100(t *testing.T)</a>

```
searchKey: http_test.TestIssue11549_Expect100
tags: [method private test]
```

```Go
func TestIssue11549_Expect100(t *testing.T)
```

### <a id="TestIssue13893_Expect100" href="#TestIssue13893_Expect100">func TestIssue13893_Expect100(t *testing.T)</a>

```
searchKey: http_test.TestIssue13893_Expect100
tags: [method private test]
```

```Go
func TestIssue13893_Expect100(t *testing.T)
```

### <a id="TestIssue32441" href="#TestIssue32441">func TestIssue32441(t *testing.T)</a>

```
searchKey: http_test.TestIssue32441
tags: [method private test]
```

```Go
func TestIssue32441(t *testing.T)
```

Issue 32441: body is not reset after ErrSkipAltProtocol 

### <a id="TestIssue3595" href="#TestIssue3595">func TestIssue3595(t *testing.T)</a>

```
searchKey: http_test.TestIssue3595
tags: [method private test]
```

```Go
func TestIssue3595(t *testing.T)
```

Test that a client receives a server's reply, even if the server doesn't read the entire request body. 

### <a id="TestIssue3644" href="#TestIssue3644">func TestIssue3644(t *testing.T)</a>

```
searchKey: http_test.TestIssue3644
tags: [method private test]
```

```Go
func TestIssue3644(t *testing.T)
```

Test that the transport doesn't close the TCP connection early, before the response body has been read. This was a regression which sadly lacked a triggering test. The large response body made the old race easier to trigger. 

### <a id="TestIssue4191_InfiniteGetTimeout" href="#TestIssue4191_InfiniteGetTimeout">func TestIssue4191_InfiniteGetTimeout(t *testing.T)</a>

```
searchKey: http_test.TestIssue4191_InfiniteGetTimeout
tags: [method private test]
```

```Go
func TestIssue4191_InfiniteGetTimeout(t *testing.T)
```

### <a id="TestIssue4191_InfiniteGetToPutTimeout" href="#TestIssue4191_InfiniteGetToPutTimeout">func TestIssue4191_InfiniteGetToPutTimeout(t *testing.T)</a>

```
searchKey: http_test.TestIssue4191_InfiniteGetToPutTimeout
tags: [method private test]
```

```Go
func TestIssue4191_InfiniteGetToPutTimeout(t *testing.T)
```

### <a id="TestJarCalls" href="#TestJarCalls">func TestJarCalls(t *testing.T)</a>

```
searchKey: http_test.TestJarCalls
tags: [method private test]
```

```Go
func TestJarCalls(t *testing.T)
```

### <a id="TestKeepAliveFinalChunkWithEOF" href="#TestKeepAliveFinalChunkWithEOF">func TestKeepAliveFinalChunkWithEOF(t *testing.T)</a>

```
searchKey: http_test.TestKeepAliveFinalChunkWithEOF
tags: [method private test]
```

```Go
func TestKeepAliveFinalChunkWithEOF(t *testing.T)
```

Issue 15703 

### <a id="TestLinuxSendfile" href="#TestLinuxSendfile">func TestLinuxSendfile(t *testing.T)</a>

```
searchKey: http_test.TestLinuxSendfile
tags: [method private test]
```

```Go
func TestLinuxSendfile(t *testing.T)
```

verifies that sendfile is being used on Linux 

### <a id="TestLinuxSendfileChild" href="#TestLinuxSendfileChild">func TestLinuxSendfileChild(*testing.T)</a>

```
searchKey: http_test.TestLinuxSendfileChild
tags: [method private test]
```

```Go
func TestLinuxSendfileChild(*testing.T)
```

TestLinuxSendfileChild isn't a real test. It's used as a helper process for TestLinuxSendfile. 

### <a id="TestMain" href="#TestMain">func TestMain(m *testing.M)</a>

```
searchKey: http_test.TestMain
tags: [method private test]
```

```Go
func TestMain(m *testing.M)
```

### <a id="TestMaxBytesReaderDifferentLimits" href="#TestMaxBytesReaderDifferentLimits">func TestMaxBytesReaderDifferentLimits(t *testing.T)</a>

```
searchKey: http_test.TestMaxBytesReaderDifferentLimits
tags: [method private test]
```

```Go
func TestMaxBytesReaderDifferentLimits(t *testing.T)
```

Issue 45101: maxBytesReader's Read panicked when n < -1. This test also ensures that Read treats negative limits as equivalent to 0. 

### <a id="TestMaxBytesReaderStickyError" href="#TestMaxBytesReaderStickyError">func TestMaxBytesReaderStickyError(t *testing.T)</a>

```
searchKey: http_test.TestMaxBytesReaderStickyError
tags: [method private test]
```

```Go
func TestMaxBytesReaderStickyError(t *testing.T)
```

Issue 14981: MaxBytesReader's return error wasn't sticky. It doesn't technically need to be, but people expected it to be. 

### <a id="TestMaxInt64ForMultipartFormMaxMemoryOverflow" href="#TestMaxInt64ForMultipartFormMaxMemoryOverflow">func TestMaxInt64ForMultipartFormMaxMemoryOverflow(t *testing.T)</a>

```
searchKey: http_test.TestMaxInt64ForMultipartFormMaxMemoryOverflow
tags: [method private test]
```

```Go
func TestMaxInt64ForMultipartFormMaxMemoryOverflow(t *testing.T)
```

Issue #40430: Test that if maxMemory for ParseMultipartForm when combined with the payload size and the internal leeway buffer size of 10MiB overflows, that we correctly return an error. 

### <a id="TestMissingFileMultipartRequest" href="#TestMissingFileMultipartRequest">func TestMissingFileMultipartRequest(t *testing.T)</a>

```
searchKey: http_test.TestMissingFileMultipartRequest
tags: [method private test]
```

```Go
func TestMissingFileMultipartRequest(t *testing.T)
```

### <a id="TestMissingStatusNoPanic" href="#TestMissingStatusNoPanic">func TestMissingStatusNoPanic(t *testing.T)</a>

```
searchKey: http_test.TestMissingStatusNoPanic
tags: [method private test]
```

```Go
func TestMissingStatusNoPanic(t *testing.T)
```

Ensure that a missing status doesn't make the server panic See Issue [https://golang.org/issues/21701](https://golang.org/issues/21701) 

### <a id="TestMultipartReader" href="#TestMultipartReader">func TestMultipartReader(t *testing.T)</a>

```
searchKey: http_test.TestMultipartReader
tags: [method private test]
```

```Go
func TestMultipartReader(t *testing.T)
```

### <a id="TestMultipartReaderOrder" href="#TestMultipartReaderOrder">func TestMultipartReaderOrder(t *testing.T)</a>

```
searchKey: http_test.TestMultipartReaderOrder
tags: [method private test]
```

```Go
func TestMultipartReaderOrder(t *testing.T)
```

Test that MultipartReader errors if called after ParseMultipartForm on the same request. 

### <a id="TestMultipartRequest" href="#TestMultipartRequest">func TestMultipartRequest(t *testing.T)</a>

```
searchKey: http_test.TestMultipartRequest
tags: [method private test]
```

```Go
func TestMultipartRequest(t *testing.T)
```

### <a id="TestMultipartRequestAuto" href="#TestMultipartRequestAuto">func TestMultipartRequestAuto(t *testing.T)</a>

```
searchKey: http_test.TestMultipartRequestAuto
tags: [method private test]
```

```Go
func TestMultipartRequestAuto(t *testing.T)
```

### <a id="TestMuxRedirectLeadingSlashes" href="#TestMuxRedirectLeadingSlashes">func TestMuxRedirectLeadingSlashes(t *testing.T)</a>

```
searchKey: http_test.TestMuxRedirectLeadingSlashes
tags: [method private test]
```

```Go
func TestMuxRedirectLeadingSlashes(t *testing.T)
```

Tests for [https://golang.org/issue/900](https://golang.org/issue/900) 

### <a id="TestMuxRedirectRelative" href="#TestMuxRedirectRelative">func TestMuxRedirectRelative(t *testing.T)</a>

```
searchKey: http_test.TestMuxRedirectRelative
tags: [method private test]
```

```Go
func TestMuxRedirectRelative(t *testing.T)
```

### <a id="TestNewClientServerTest" href="#TestNewClientServerTest">func TestNewClientServerTest(t *testing.T)</a>

```
searchKey: http_test.TestNewClientServerTest
tags: [method private test]
```

```Go
func TestNewClientServerTest(t *testing.T)
```

Testing the newClientServerTest helper itself. 

### <a id="TestNewRequestContentLength" href="#TestNewRequestContentLength">func TestNewRequestContentLength(t *testing.T)</a>

```
searchKey: http_test.TestNewRequestContentLength
tags: [method private test]
```

```Go
func TestNewRequestContentLength(t *testing.T)
```

### <a id="TestNewRequestGetBody" href="#TestNewRequestGetBody">func TestNewRequestGetBody(t *testing.T)</a>

```
searchKey: http_test.TestNewRequestGetBody
tags: [method private test]
```

```Go
func TestNewRequestGetBody(t *testing.T)
```

verify that NewRequest sets Request.GetBody and that it works 

### <a id="TestNewRequestHost" href="#TestNewRequestHost">func TestNewRequestHost(t *testing.T)</a>

```
searchKey: http_test.TestNewRequestHost
tags: [method private test]
```

```Go
func TestNewRequestHost(t *testing.T)
```

### <a id="TestNextProtoUpgrade" href="#TestNextProtoUpgrade">func TestNextProtoUpgrade(t *testing.T)</a>

```
searchKey: http_test.TestNextProtoUpgrade
tags: [method private test]
```

```Go
func TestNextProtoUpgrade(t *testing.T)
```

### <a id="TestNoBodyOnChunked304Response" href="#TestNoBodyOnChunked304Response">func TestNoBodyOnChunked304Response(t *testing.T)</a>

```
searchKey: http_test.TestNoBodyOnChunked304Response
tags: [method private test]
```

```Go
func TestNoBodyOnChunked304Response(t *testing.T)
```

Issue 22330: do not allow the response body to be read when the status code forbids a response body. 

### <a id="TestNoContentLengthIfTransferEncoding" href="#TestNoContentLengthIfTransferEncoding">func TestNoContentLengthIfTransferEncoding(t *testing.T)</a>

```
searchKey: http_test.TestNoContentLengthIfTransferEncoding
tags: [method private test]
```

```Go
func TestNoContentLengthIfTransferEncoding(t *testing.T)
```

Issue 9987: shouldn't add automatic Content-Length (or Content-Type) if a Transfer-Encoding was set by the handler. 

### <a id="TestNoCrashReturningTransportAltConn" href="#TestNoCrashReturningTransportAltConn">func TestNoCrashReturningTransportAltConn(t *testing.T)</a>

```
searchKey: http_test.TestNoCrashReturningTransportAltConn
tags: [method private test]
```

```Go
func TestNoCrashReturningTransportAltConn(t *testing.T)
```

Issue 13839 

### <a id="TestNoPanicOnRoundTripWithBasicAuth_h1" href="#TestNoPanicOnRoundTripWithBasicAuth_h1">func TestNoPanicOnRoundTripWithBasicAuth_h1(t *testing.T)</a>

```
searchKey: http_test.TestNoPanicOnRoundTripWithBasicAuth_h1
tags: [method private test]
```

```Go
func TestNoPanicOnRoundTripWithBasicAuth_h1(t *testing.T)
```

### <a id="TestNoPanicOnRoundTripWithBasicAuth_h2" href="#TestNoPanicOnRoundTripWithBasicAuth_h2">func TestNoPanicOnRoundTripWithBasicAuth_h2(t *testing.T)</a>

```
searchKey: http_test.TestNoPanicOnRoundTripWithBasicAuth_h2
tags: [method private test]
```

```Go
func TestNoPanicOnRoundTripWithBasicAuth_h2(t *testing.T)
```

### <a id="TestNoSniffExpectRequestBody_h1" href="#TestNoSniffExpectRequestBody_h1">func TestNoSniffExpectRequestBody_h1(t *testing.T)</a>

```
searchKey: http_test.TestNoSniffExpectRequestBody_h1
tags: [method private test]
```

```Go
func TestNoSniffExpectRequestBody_h1(t *testing.T)
```

### <a id="TestNoSniffExpectRequestBody_h2" href="#TestNoSniffExpectRequestBody_h2">func TestNoSniffExpectRequestBody_h2(t *testing.T)</a>

```
searchKey: http_test.TestNoSniffExpectRequestBody_h2
tags: [method private test]
```

```Go
func TestNoSniffExpectRequestBody_h2(t *testing.T)
```

### <a id="TestOnlyWriteTimeout" href="#TestOnlyWriteTimeout">func TestOnlyWriteTimeout(t *testing.T)</a>

```
searchKey: http_test.TestOnlyWriteTimeout
tags: [method private test]
```

```Go
func TestOnlyWriteTimeout(t *testing.T)
```

golang.org/issue/4741 -- setting only a write timeout that triggers shouldn't cause a handler to block forever on reads (next HTTP request) that will never happen. 

### <a id="TestOptions" href="#TestOptions">func TestOptions(t *testing.T)</a>

```
searchKey: http_test.TestOptions
tags: [method private test]
```

```Go
func TestOptions(t *testing.T)
```

### <a id="TestParseBasicAuth" href="#TestParseBasicAuth">func TestParseBasicAuth(t *testing.T)</a>

```
searchKey: http_test.TestParseBasicAuth
tags: [method private test]
```

```Go
func TestParseBasicAuth(t *testing.T)
```

### <a id="TestParseFormInitializeOnError" href="#TestParseFormInitializeOnError">func TestParseFormInitializeOnError(t *testing.T)</a>

```
searchKey: http_test.TestParseFormInitializeOnError
tags: [method private test]
```

```Go
func TestParseFormInitializeOnError(t *testing.T)
```

### <a id="TestParseFormQuery" href="#TestParseFormQuery">func TestParseFormQuery(t *testing.T)</a>

```
searchKey: http_test.TestParseFormQuery
tags: [method private test]
```

```Go
func TestParseFormQuery(t *testing.T)
```

### <a id="TestParseFormQueryMethods" href="#TestParseFormQueryMethods">func TestParseFormQueryMethods(t *testing.T)</a>

```
searchKey: http_test.TestParseFormQueryMethods
tags: [method private test]
```

```Go
func TestParseFormQueryMethods(t *testing.T)
```

Tests that we only parse the form automatically for certain methods. 

### <a id="TestParseFormSemicolonSeparator" href="#TestParseFormSemicolonSeparator">func TestParseFormSemicolonSeparator(t *testing.T)</a>

```
searchKey: http_test.TestParseFormSemicolonSeparator
tags: [method private test]
```

```Go
func TestParseFormSemicolonSeparator(t *testing.T)
```

Issue #25192: Test that ParseForm fails but still parses the form when an URL containing a semicolon is provided. 

### <a id="TestParseFormUnknownContentType" href="#TestParseFormUnknownContentType">func TestParseFormUnknownContentType(t *testing.T)</a>

```
searchKey: http_test.TestParseFormUnknownContentType
tags: [method private test]
```

```Go
func TestParseFormUnknownContentType(t *testing.T)
```

### <a id="TestParseHTTPVersion" href="#TestParseHTTPVersion">func TestParseHTTPVersion(t *testing.T)</a>

```
searchKey: http_test.TestParseHTTPVersion
tags: [method private test]
```

```Go
func TestParseHTTPVersion(t *testing.T)
```

### <a id="TestParseMultipartForm" href="#TestParseMultipartForm">func TestParseMultipartForm(t *testing.T)</a>

```
searchKey: http_test.TestParseMultipartForm
tags: [method private test]
```

```Go
func TestParseMultipartForm(t *testing.T)
```

### <a id="TestParseMultipartFormFilename" href="#TestParseMultipartFormFilename">func TestParseMultipartFormFilename(t *testing.T)</a>

```
searchKey: http_test.TestParseMultipartFormFilename
tags: [method private test]
```

```Go
func TestParseMultipartFormFilename(t *testing.T)
```

Issue 45789: multipart form should not include directory path in filename 

### <a id="TestParseMultipartFormOrder" href="#TestParseMultipartFormOrder">func TestParseMultipartFormOrder(t *testing.T)</a>

```
searchKey: http_test.TestParseMultipartFormOrder
tags: [method private test]
```

```Go
func TestParseMultipartFormOrder(t *testing.T)
```

Test that ParseMultipartForm errors if called after MultipartReader on the same request. 

### <a id="TestParseMultipartFormPopulatesPostForm" href="#TestParseMultipartFormPopulatesPostForm">func TestParseMultipartFormPopulatesPostForm(t *testing.T)</a>

```
searchKey: http_test.TestParseMultipartFormPopulatesPostForm
tags: [method private test]
```

```Go
func TestParseMultipartFormPopulatesPostForm(t *testing.T)
```

Issue 9305: ParseMultipartForm should populate PostForm too 

### <a id="TestParseMultipartFormSemicolonSeparator" href="#TestParseMultipartFormSemicolonSeparator">func TestParseMultipartFormSemicolonSeparator(t *testing.T)</a>

```
searchKey: http_test.TestParseMultipartFormSemicolonSeparator
tags: [method private test]
```

```Go
func TestParseMultipartFormSemicolonSeparator(t *testing.T)
```

Issue #25192: Test that ParseMultipartForm fails but still parses the multi-part form when an URL containing a semicolon is provided. 

### <a id="TestPostFormRequestFormat" href="#TestPostFormRequestFormat">func TestPostFormRequestFormat(t *testing.T)</a>

```
searchKey: http_test.TestPostFormRequestFormat
tags: [method private test]
```

```Go
func TestPostFormRequestFormat(t *testing.T)
```

### <a id="TestPostRedirects" href="#TestPostRedirects">func TestPostRedirects(t *testing.T)</a>

```
searchKey: http_test.TestPostRedirects
tags: [method private test]
```

```Go
func TestPostRedirects(t *testing.T)
```

### <a id="TestPostRequestFormat" href="#TestPostRequestFormat">func TestPostRequestFormat(t *testing.T)</a>

```
searchKey: http_test.TestPostRequestFormat
tags: [method private test]
```

```Go
func TestPostRequestFormat(t *testing.T)
```

### <a id="TestProxyFromEnvironment" href="#TestProxyFromEnvironment">func TestProxyFromEnvironment(t *testing.T)</a>

```
searchKey: http_test.TestProxyFromEnvironment
tags: [method private test]
```

```Go
func TestProxyFromEnvironment(t *testing.T)
```

### <a id="TestProxyFromEnvironmentLowerCase" href="#TestProxyFromEnvironmentLowerCase">func TestProxyFromEnvironmentLowerCase(t *testing.T)</a>

```
searchKey: http_test.TestProxyFromEnvironmentLowerCase
tags: [method private test]
```

```Go
func TestProxyFromEnvironmentLowerCase(t *testing.T)
```

### <a id="TestQuery" href="#TestQuery">func TestQuery(t *testing.T)</a>

```
searchKey: http_test.TestQuery
tags: [method private test]
```

```Go
func TestQuery(t *testing.T)
```

### <a id="TestQuerySemicolon" href="#TestQuerySemicolon">func TestQuerySemicolon(t *testing.T)</a>

```
searchKey: http_test.TestQuerySemicolon
tags: [method private test]
```

```Go
func TestQuerySemicolon(t *testing.T)
```

TestQuerySemicolon tests the behavior of semicolons in queries. See Issue 25192. 

### <a id="TestReadRequestErrors" href="#TestReadRequestErrors">func TestReadRequestErrors(t *testing.T)</a>

```
searchKey: http_test.TestReadRequestErrors
tags: [method private test]
```

```Go
func TestReadRequestErrors(t *testing.T)
```

### <a id="TestRedirect" href="#TestRedirect">func TestRedirect(t *testing.T)</a>

```
searchKey: http_test.TestRedirect
tags: [method private test]
```

```Go
func TestRedirect(t *testing.T)
```

Test different URL formats and schemes 

### <a id="TestRedirectBadPath" href="#TestRedirectBadPath">func TestRedirectBadPath(t *testing.T)</a>

```
searchKey: http_test.TestRedirectBadPath
tags: [method private test]
```

```Go
func TestRedirectBadPath(t *testing.T)
```

### <a id="TestRedirectContentTypeAndBody" href="#TestRedirectContentTypeAndBody">func TestRedirectContentTypeAndBody(t *testing.T)</a>

```
searchKey: http_test.TestRedirectContentTypeAndBody
tags: [method private test]
```

```Go
func TestRedirectContentTypeAndBody(t *testing.T)
```

Test that Redirect sets Content-Type header for GET and HEAD requests and writes a short HTML body, unless the request already has a Content-Type header. 

### <a id="TestRedirectCookiesJar" href="#TestRedirectCookiesJar">func TestRedirectCookiesJar(t *testing.T)</a>

```
searchKey: http_test.TestRedirectCookiesJar
tags: [method private test]
```

```Go
func TestRedirectCookiesJar(t *testing.T)
```

### <a id="TestRedirect_h1" href="#TestRedirect_h1">func TestRedirect_h1(t *testing.T)</a>

```
searchKey: http_test.TestRedirect_h1
tags: [method private test]
```

```Go
func TestRedirect_h1(t *testing.T)
```

### <a id="TestRedirect_h2" href="#TestRedirect_h2">func TestRedirect_h2(t *testing.T)</a>

```
searchKey: http_test.TestRedirect_h2
tags: [method private test]
```

```Go
func TestRedirect_h2(t *testing.T)
```

### <a id="TestReferer" href="#TestReferer">func TestReferer(t *testing.T)</a>

```
searchKey: http_test.TestReferer
tags: [method private test]
```

```Go
func TestReferer(t *testing.T)
```

### <a id="TestRequestBadHost" href="#TestRequestBadHost">func TestRequestBadHost(t *testing.T)</a>

```
searchKey: http_test.TestRequestBadHost
tags: [method private test]
```

```Go
func TestRequestBadHost(t *testing.T)
```

### <a id="TestRequestBodyCloseDoesntBlock" href="#TestRequestBodyCloseDoesntBlock">func TestRequestBodyCloseDoesntBlock(t *testing.T)</a>

```
searchKey: http_test.TestRequestBodyCloseDoesntBlock
tags: [method private test]
```

```Go
func TestRequestBodyCloseDoesntBlock(t *testing.T)
```

Test that a hanging Request.Body.Read from another goroutine can't cause the Handler goroutine's Request.Body.Close to block. See issue 7121. 

### <a id="TestRequestBodyLimit_h1" href="#TestRequestBodyLimit_h1">func TestRequestBodyLimit_h1(t *testing.T)</a>

```
searchKey: http_test.TestRequestBodyLimit_h1
tags: [method private test]
```

```Go
func TestRequestBodyLimit_h1(t *testing.T)
```

### <a id="TestRequestBodyLimit_h2" href="#TestRequestBodyLimit_h2">func TestRequestBodyLimit_h2(t *testing.T)</a>

```
searchKey: http_test.TestRequestBodyLimit_h2
tags: [method private test]
```

```Go
func TestRequestBodyLimit_h2(t *testing.T)
```

### <a id="TestRequestBodyReadErrorClosesConnection" href="#TestRequestBodyReadErrorClosesConnection">func TestRequestBodyReadErrorClosesConnection(t *testing.T)</a>

```
searchKey: http_test.TestRequestBodyReadErrorClosesConnection
tags: [method private test]
```

```Go
func TestRequestBodyReadErrorClosesConnection(t *testing.T)
```

### <a id="TestRequestBodyTimeoutClosesConnection" href="#TestRequestBodyTimeoutClosesConnection">func TestRequestBodyTimeoutClosesConnection(t *testing.T)</a>

```
searchKey: http_test.TestRequestBodyTimeoutClosesConnection
tags: [method private test]
```

```Go
func TestRequestBodyTimeoutClosesConnection(t *testing.T)
```

### <a id="TestRequestCloneTransferEncoding" href="#TestRequestCloneTransferEncoding">func TestRequestCloneTransferEncoding(t *testing.T)</a>

```
searchKey: http_test.TestRequestCloneTransferEncoding
tags: [method private test]
```

```Go
func TestRequestCloneTransferEncoding(t *testing.T)
```

Ensure that Request.Clone creates a deep copy of TransferEncoding. See issue 41907. 

### <a id="TestRequestInvalidMethod" href="#TestRequestInvalidMethod">func TestRequestInvalidMethod(t *testing.T)</a>

```
searchKey: http_test.TestRequestInvalidMethod
tags: [method private test]
```

```Go
func TestRequestInvalidMethod(t *testing.T)
```

### <a id="TestRequestLimit_h1" href="#TestRequestLimit_h1">func TestRequestLimit_h1(t *testing.T)</a>

```
searchKey: http_test.TestRequestLimit_h1
tags: [method private test]
```

```Go
func TestRequestLimit_h1(t *testing.T)
```

### <a id="TestRequestLimit_h2" href="#TestRequestLimit_h2">func TestRequestLimit_h2(t *testing.T)</a>

```
searchKey: http_test.TestRequestLimit_h2
tags: [method private test]
```

```Go
func TestRequestLimit_h2(t *testing.T)
```

### <a id="TestRequestWriteBufferedWriter" href="#TestRequestWriteBufferedWriter">func TestRequestWriteBufferedWriter(t *testing.T)</a>

```
searchKey: http_test.TestRequestWriteBufferedWriter
tags: [method private test]
```

```Go
func TestRequestWriteBufferedWriter(t *testing.T)
```

### <a id="TestResponseBodyReadAfterClose_h1" href="#TestResponseBodyReadAfterClose_h1">func TestResponseBodyReadAfterClose_h1(t *testing.T)</a>

```
searchKey: http_test.TestResponseBodyReadAfterClose_h1
tags: [method private test]
```

```Go
func TestResponseBodyReadAfterClose_h1(t *testing.T)
```

Don't allow a Body.Read after Body.Close. Issue 13648. 

### <a id="TestResponseBodyReadAfterClose_h2" href="#TestResponseBodyReadAfterClose_h2">func TestResponseBodyReadAfterClose_h2(t *testing.T)</a>

```
searchKey: http_test.TestResponseBodyReadAfterClose_h2
tags: [method private test]
```

```Go
func TestResponseBodyReadAfterClose_h2(t *testing.T)
```

### <a id="TestResponseSetsTLSConnectionState" href="#TestResponseSetsTLSConnectionState">func TestResponseSetsTLSConnectionState(t *testing.T)</a>

```
searchKey: http_test.TestResponseSetsTLSConnectionState
tags: [method private test]
```

```Go
func TestResponseSetsTLSConnectionState(t *testing.T)
```

### <a id="TestResponseWriterWriteString" href="#TestResponseWriterWriteString">func TestResponseWriterWriteString(t *testing.T)</a>

```
searchKey: http_test.TestResponseWriterWriteString
tags: [method private test]
```

```Go
func TestResponseWriterWriteString(t *testing.T)
```

test that ResponseWriter implements io.StringWriter. 

### <a id="TestRetryRequestsOnError" href="#TestRetryRequestsOnError">func TestRetryRequestsOnError(t *testing.T)</a>

```
searchKey: http_test.TestRetryRequestsOnError
tags: [method private test]
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

### <a id="TestReuseRequest" href="#TestReuseRequest">func TestReuseRequest(t *testing.T)</a>

```
searchKey: http_test.TestReuseRequest
tags: [method private test]
```

```Go
func TestReuseRequest(t *testing.T)
```

### <a id="TestRoundTripGzip" href="#TestRoundTripGzip">func TestRoundTripGzip(t *testing.T)</a>

```
searchKey: http_test.TestRoundTripGzip
tags: [method private test]
```

```Go
func TestRoundTripGzip(t *testing.T)
```

Test that the modification made to the Request by the RoundTripper is cleaned up 

### <a id="TestRoundTripReturnsProxyError" href="#TestRoundTripReturnsProxyError">func TestRoundTripReturnsProxyError(t *testing.T)</a>

```
searchKey: http_test.TestRoundTripReturnsProxyError
tags: [method private test]
```

```Go
func TestRoundTripReturnsProxyError(t *testing.T)
```

Test for issue 8755 Ensure that if a proxy returns an error, it is exposed by RoundTrip 

### <a id="TestSOCKS5Proxy" href="#TestSOCKS5Proxy">func TestSOCKS5Proxy(t *testing.T)</a>

```
searchKey: http_test.TestSOCKS5Proxy
tags: [method private test]
```

```Go
func TestSOCKS5Proxy(t *testing.T)
```

### <a id="TestServeContent" href="#TestServeContent">func TestServeContent(t *testing.T)</a>

```
searchKey: http_test.TestServeContent
tags: [method private test]
```

```Go
func TestServeContent(t *testing.T)
```

### <a id="TestServeContentErrorMessages" href="#TestServeContentErrorMessages">func TestServeContentErrorMessages(t *testing.T)</a>

```
searchKey: http_test.TestServeContentErrorMessages
tags: [method private test]
```

```Go
func TestServeContentErrorMessages(t *testing.T)
```

### <a id="TestServeDirWithoutTrailingSlash" href="#TestServeDirWithoutTrailingSlash">func TestServeDirWithoutTrailingSlash(t *testing.T)</a>

```
searchKey: http_test.TestServeDirWithoutTrailingSlash
tags: [method private test]
```

```Go
func TestServeDirWithoutTrailingSlash(t *testing.T)
```

Issue 13996 

### <a id="TestServeFile" href="#TestServeFile">func TestServeFile(t *testing.T)</a>

```
searchKey: http_test.TestServeFile
tags: [method private test]
```

```Go
func TestServeFile(t *testing.T)
```

### <a id="TestServeFileContentType" href="#TestServeFileContentType">func TestServeFileContentType(t *testing.T)</a>

```
searchKey: http_test.TestServeFileContentType
tags: [method private test]
```

```Go
func TestServeFileContentType(t *testing.T)
```

### <a id="TestServeFileDirPanicEmptyPath" href="#TestServeFileDirPanicEmptyPath">func TestServeFileDirPanicEmptyPath(t *testing.T)</a>

```
searchKey: http_test.TestServeFileDirPanicEmptyPath
tags: [method private test]
```

```Go
func TestServeFileDirPanicEmptyPath(t *testing.T)
```

Tests that this doesn't panic. (Issue 30165) 

### <a id="TestServeFileFromCWD" href="#TestServeFileFromCWD">func TestServeFileFromCWD(t *testing.T)</a>

```
searchKey: http_test.TestServeFileFromCWD
tags: [method private test]
```

```Go
func TestServeFileFromCWD(t *testing.T)
```

### <a id="TestServeFileMimeType" href="#TestServeFileMimeType">func TestServeFileMimeType(t *testing.T)</a>

```
searchKey: http_test.TestServeFileMimeType
tags: [method private test]
```

```Go
func TestServeFileMimeType(t *testing.T)
```

### <a id="TestServeFileRejectsInvalidSuffixLengths_h1" href="#TestServeFileRejectsInvalidSuffixLengths_h1">func TestServeFileRejectsInvalidSuffixLengths_h1(t *testing.T)</a>

```
searchKey: http_test.TestServeFileRejectsInvalidSuffixLengths_h1
tags: [method private test]
```

```Go
func TestServeFileRejectsInvalidSuffixLengths_h1(t *testing.T)
```

Issue 40940: Ensure that we only accept non-negative suffix-lengths in "Range": "bytes=-N", and should reject "bytes=--2". 

### <a id="TestServeFileRejectsInvalidSuffixLengths_h2" href="#TestServeFileRejectsInvalidSuffixLengths_h2">func TestServeFileRejectsInvalidSuffixLengths_h2(t *testing.T)</a>

```
searchKey: http_test.TestServeFileRejectsInvalidSuffixLengths_h2
tags: [method private test]
```

```Go
func TestServeFileRejectsInvalidSuffixLengths_h2(t *testing.T)
```

### <a id="TestServeFileWithContentEncoding_h1" href="#TestServeFileWithContentEncoding_h1">func TestServeFileWithContentEncoding_h1(t *testing.T)</a>

```
searchKey: http_test.TestServeFileWithContentEncoding_h1
tags: [method private test]
```

```Go
func TestServeFileWithContentEncoding_h1(t *testing.T)
```

Tests that ServeFile doesn't add a Content-Length if a Content-Encoding is specified. 

### <a id="TestServeFileWithContentEncoding_h2" href="#TestServeFileWithContentEncoding_h2">func TestServeFileWithContentEncoding_h2(t *testing.T)</a>

```
searchKey: http_test.TestServeFileWithContentEncoding_h2
tags: [method private test]
```

```Go
func TestServeFileWithContentEncoding_h2(t *testing.T)
```

### <a id="TestServeFile_DotDot" href="#TestServeFile_DotDot">func TestServeFile_DotDot(t *testing.T)</a>

```
searchKey: http_test.TestServeFile_DotDot
tags: [method private test]
```

```Go
func TestServeFile_DotDot(t *testing.T)
```

### <a id="TestServeHTTP10Close" href="#TestServeHTTP10Close">func TestServeHTTP10Close(t *testing.T)</a>

```
searchKey: http_test.TestServeHTTP10Close
tags: [method private test]
```

```Go
func TestServeHTTP10Close(t *testing.T)
```

TestServeHTTP10Close verifies that HTTP/1.0 requests won't be kept alive. 

### <a id="TestServeIndexHtml" href="#TestServeIndexHtml">func TestServeIndexHtml(t *testing.T)</a>

```
searchKey: http_test.TestServeIndexHtml
tags: [method private test]
```

```Go
func TestServeIndexHtml(t *testing.T)
```

### <a id="TestServeIndexHtmlFS" href="#TestServeIndexHtmlFS">func TestServeIndexHtmlFS(t *testing.T)</a>

```
searchKey: http_test.TestServeIndexHtmlFS
tags: [method private test]
```

```Go
func TestServeIndexHtmlFS(t *testing.T)
```

### <a id="TestServeMuxHandleFuncWithNilHandler" href="#TestServeMuxHandleFuncWithNilHandler">func TestServeMuxHandleFuncWithNilHandler(t *testing.T)</a>

```
searchKey: http_test.TestServeMuxHandleFuncWithNilHandler
tags: [method private test]
```

```Go
func TestServeMuxHandleFuncWithNilHandler(t *testing.T)
```

Issue 24297 

### <a id="TestServeMuxHandler" href="#TestServeMuxHandler">func TestServeMuxHandler(t *testing.T)</a>

```
searchKey: http_test.TestServeMuxHandler
tags: [method private test]
```

```Go
func TestServeMuxHandler(t *testing.T)
```

### <a id="TestServeMuxHandlerRedirects" href="#TestServeMuxHandlerRedirects">func TestServeMuxHandlerRedirects(t *testing.T)</a>

```
searchKey: http_test.TestServeMuxHandlerRedirects
tags: [method private test]
```

```Go
func TestServeMuxHandlerRedirects(t *testing.T)
```

TestServeMuxHandlerRedirects tests that automatic redirects generated by mux.Handler() shouldn't clear the request's query string. 

### <a id="TestServeTLS" href="#TestServeTLS">func TestServeTLS(t *testing.T)</a>

```
searchKey: http_test.TestServeTLS
tags: [method private test]
```

```Go
func TestServeTLS(t *testing.T)
```

### <a id="TestServeWithSlashRedirectForHostPatterns" href="#TestServeWithSlashRedirectForHostPatterns">func TestServeWithSlashRedirectForHostPatterns(t *testing.T)</a>

```
searchKey: http_test.TestServeWithSlashRedirectForHostPatterns
tags: [method private test]
```

```Go
func TestServeWithSlashRedirectForHostPatterns(t *testing.T)
```

### <a id="TestServeWithSlashRedirectKeepsQueryString" href="#TestServeWithSlashRedirectKeepsQueryString">func TestServeWithSlashRedirectKeepsQueryString(t *testing.T)</a>

```
searchKey: http_test.TestServeWithSlashRedirectKeepsQueryString
tags: [method private test]
```

```Go
func TestServeWithSlashRedirectKeepsQueryString(t *testing.T)
```

Test that the special cased "/route" redirect implicitly created by a registered "/route/" properly sets the query string in the redirect URL. See Issue 17841. 

### <a id="TestServerAllowsBlockingRemoteAddr" href="#TestServerAllowsBlockingRemoteAddr">func TestServerAllowsBlockingRemoteAddr(t *testing.T)</a>

```
searchKey: http_test.TestServerAllowsBlockingRemoteAddr
tags: [method private test]
```

```Go
func TestServerAllowsBlockingRemoteAddr(t *testing.T)
```

Issue 12943 

### <a id="TestServerBufferedChunking" href="#TestServerBufferedChunking">func TestServerBufferedChunking(t *testing.T)</a>

```
searchKey: http_test.TestServerBufferedChunking
tags: [method private test]
```

```Go
func TestServerBufferedChunking(t *testing.T)
```

Tests that chunked server responses that write 1 byte at a time are buffered before chunk headers are added, not after chunk headers. 

### <a id="TestServerCancelsReadTimeoutWhenIdle" href="#TestServerCancelsReadTimeoutWhenIdle">func TestServerCancelsReadTimeoutWhenIdle(t *testing.T)</a>

```
searchKey: http_test.TestServerCancelsReadTimeoutWhenIdle
tags: [method private test]
```

```Go
func TestServerCancelsReadTimeoutWhenIdle(t *testing.T)
```

Issue 18447: test that the Server's ReadTimeout is stopped while the server's doing its 1-byte background read between requests, waiting for the connection to maybe close. 

### <a id="TestServerCloseDeadlock" href="#TestServerCloseDeadlock">func TestServerCloseDeadlock(t *testing.T)</a>

```
searchKey: http_test.TestServerCloseDeadlock
tags: [method private test]
```

```Go
func TestServerCloseDeadlock(t *testing.T)
```

Issue 17878: tests that we can call Close twice. 

### <a id="TestServerCloseListenerOnce" href="#TestServerCloseListenerOnce">func TestServerCloseListenerOnce(t *testing.T)</a>

```
searchKey: http_test.TestServerCloseListenerOnce
tags: [method private test]
```

```Go
func TestServerCloseListenerOnce(t *testing.T)
```

Issue 24803: don't call Listener.Close on Server.Shutdown. 

### <a id="TestServerConnState" href="#TestServerConnState">func TestServerConnState(t *testing.T)</a>

```
searchKey: http_test.TestServerConnState
tags: [method private test]
```

```Go
func TestServerConnState(t *testing.T)
```

### <a id="TestServerConnStateNew" href="#TestServerConnStateNew">func TestServerConnStateNew(t *testing.T)</a>

```
searchKey: http_test.TestServerConnStateNew
tags: [method private test]
```

```Go
func TestServerConnStateNew(t *testing.T)
```

### <a id="TestServerContentType_h1" href="#TestServerContentType_h1">func TestServerContentType_h1(t *testing.T)</a>

```
searchKey: http_test.TestServerContentType_h1
tags: [method private test]
```

```Go
func TestServerContentType_h1(t *testing.T)
```

### <a id="TestServerContentType_h2" href="#TestServerContentType_h2">func TestServerContentType_h2(t *testing.T)</a>

```
searchKey: http_test.TestServerContentType_h2
tags: [method private test]
```

```Go
func TestServerContentType_h2(t *testing.T)
```

### <a id="TestServerContext_LocalAddrContextKey_h1" href="#TestServerContext_LocalAddrContextKey_h1">func TestServerContext_LocalAddrContextKey_h1(t *testing.T)</a>

```
searchKey: http_test.TestServerContext_LocalAddrContextKey_h1
tags: [method private test]
```

```Go
func TestServerContext_LocalAddrContextKey_h1(t *testing.T)
```

### <a id="TestServerContext_LocalAddrContextKey_h2" href="#TestServerContext_LocalAddrContextKey_h2">func TestServerContext_LocalAddrContextKey_h2(t *testing.T)</a>

```
searchKey: http_test.TestServerContext_LocalAddrContextKey_h2
tags: [method private test]
```

```Go
func TestServerContext_LocalAddrContextKey_h2(t *testing.T)
```

### <a id="TestServerContext_ServerContextKey_h1" href="#TestServerContext_ServerContextKey_h1">func TestServerContext_ServerContextKey_h1(t *testing.T)</a>

```
searchKey: http_test.TestServerContext_ServerContextKey_h1
tags: [method private test]
```

```Go
func TestServerContext_ServerContextKey_h1(t *testing.T)
```

### <a id="TestServerContext_ServerContextKey_h2" href="#TestServerContext_ServerContextKey_h2">func TestServerContext_ServerContextKey_h2(t *testing.T)</a>

```
searchKey: http_test.TestServerContext_ServerContextKey_h2
tags: [method private test]
```

```Go
func TestServerContext_ServerContextKey_h2(t *testing.T)
```

### <a id="TestServerContexts" href="#TestServerContexts">func TestServerContexts(t *testing.T)</a>

```
searchKey: http_test.TestServerContexts
tags: [method private test]
```

```Go
func TestServerContexts(t *testing.T)
```

### <a id="TestServerContextsHTTP2" href="#TestServerContextsHTTP2">func TestServerContextsHTTP2(t *testing.T)</a>

```
searchKey: http_test.TestServerContextsHTTP2
tags: [method private test]
```

```Go
func TestServerContextsHTTP2(t *testing.T)
```

### <a id="TestServerDuplicateBackgroundRead" href="#TestServerDuplicateBackgroundRead">func TestServerDuplicateBackgroundRead(t *testing.T)</a>

```
searchKey: http_test.TestServerDuplicateBackgroundRead
tags: [method private test]
```

```Go
func TestServerDuplicateBackgroundRead(t *testing.T)
```

Issue 18535: test that the Server doesn't try to do a background read if it's already done one. 

### <a id="TestServerEmptyBodyRace_h1" href="#TestServerEmptyBodyRace_h1">func TestServerEmptyBodyRace_h1(t *testing.T)</a>

```
searchKey: http_test.TestServerEmptyBodyRace_h1
tags: [method private test]
```

```Go
func TestServerEmptyBodyRace_h1(t *testing.T)
```

golang.org/issue/7856 

### <a id="TestServerEmptyBodyRace_h2" href="#TestServerEmptyBodyRace_h2">func TestServerEmptyBodyRace_h2(t *testing.T)</a>

```
searchKey: http_test.TestServerEmptyBodyRace_h2
tags: [method private test]
```

```Go
func TestServerEmptyBodyRace_h2(t *testing.T)
```

### <a id="TestServerExpect" href="#TestServerExpect">func TestServerExpect(t *testing.T)</a>

```
searchKey: http_test.TestServerExpect
tags: [method private test]
```

```Go
func TestServerExpect(t *testing.T)
```

Tests that the server responds to the "Expect" request header correctly. http2 test: TestServer_Response_Automatic100Continue 

### <a id="TestServerFileStatError" href="#TestServerFileStatError">func TestServerFileStatError(t *testing.T)</a>

```
searchKey: http_test.TestServerFileStatError
tags: [method private test]
```

```Go
func TestServerFileStatError(t *testing.T)
```

Issue 12991 

### <a id="TestServerFlushAndHijack" href="#TestServerFlushAndHijack">func TestServerFlushAndHijack(t *testing.T)</a>

```
searchKey: http_test.TestServerFlushAndHijack
tags: [method private test]
```

```Go
func TestServerFlushAndHijack(t *testing.T)
```

This verifies that a handler can Flush and then Hijack. 

A similar test crashed once during development, but it was only testing this tangentially and temporarily until another TODO was fixed. 

So add an explicit test for this. 

### <a id="TestServerGracefulClose" href="#TestServerGracefulClose">func TestServerGracefulClose(t *testing.T)</a>

```
searchKey: http_test.TestServerGracefulClose
tags: [method private test]
```

```Go
func TestServerGracefulClose(t *testing.T)
```

Tests that the server flushes its response headers out when it's ignoring the response body and waits a bit before forcefully closing the TCP connection, causing the client to get a RST. See [https://golang.org/issue/3595](https://golang.org/issue/3595) 

### <a id="TestServerHandlersCanHandleH2PRI" href="#TestServerHandlersCanHandleH2PRI">func TestServerHandlersCanHandleH2PRI(t *testing.T)</a>

```
searchKey: http_test.TestServerHandlersCanHandleH2PRI
tags: [method private test]
```

```Go
func TestServerHandlersCanHandleH2PRI(t *testing.T)
```

### <a id="TestServerHijackGetsBackgroundByte" href="#TestServerHijackGetsBackgroundByte">func TestServerHijackGetsBackgroundByte(t *testing.T)</a>

```
searchKey: http_test.TestServerHijackGetsBackgroundByte
tags: [method private test]
```

```Go
func TestServerHijackGetsBackgroundByte(t *testing.T)
```

Test that the bufio.Reader returned by Hijack includes any buffered byte (from the Server's backgroundRead) in its buffer. We want the Handler code to be able to tell that a byte is available via bufio.Reader.Buffered(), without resorting to Reading it (potentially blocking) to get at it. 

### <a id="TestServerHijackGetsBackgroundByte_big" href="#TestServerHijackGetsBackgroundByte_big">func TestServerHijackGetsBackgroundByte_big(t *testing.T)</a>

```
searchKey: http_test.TestServerHijackGetsBackgroundByte_big
tags: [method private test]
```

```Go
func TestServerHijackGetsBackgroundByte_big(t *testing.T)
```

Like TestServerHijackGetsBackgroundByte above but sending a immediate 1MB of data to the server to fill up the server's 4KB buffer. 

### <a id="TestServerIdleTimeout" href="#TestServerIdleTimeout">func TestServerIdleTimeout(t *testing.T)</a>

```
searchKey: http_test.TestServerIdleTimeout
tags: [method private test]
```

```Go
func TestServerIdleTimeout(t *testing.T)
```

### <a id="TestServerIssue5953_h1" href="#TestServerIssue5953_h1">func TestServerIssue5953_h1(t *testing.T)</a>

```
searchKey: http_test.TestServerIssue5953_h1
tags: [method private test]
```

```Go
func TestServerIssue5953_h1(t *testing.T)
```

Issue 5953: shouldn't sniff if the handler set a Content-Type header, even if it's the empty string. 

### <a id="TestServerIssue5953_h2" href="#TestServerIssue5953_h2">func TestServerIssue5953_h2(t *testing.T)</a>

```
searchKey: http_test.TestServerIssue5953_h2
tags: [method private test]
```

```Go
func TestServerIssue5953_h2(t *testing.T)
```

### <a id="TestServerKeepAliveAfterWriteError" href="#TestServerKeepAliveAfterWriteError">func TestServerKeepAliveAfterWriteError(t *testing.T)</a>

```
searchKey: http_test.TestServerKeepAliveAfterWriteError
tags: [method private test]
```

```Go
func TestServerKeepAliveAfterWriteError(t *testing.T)
```

golang.org/issue/8534 -- the Server shouldn't reuse a connection for keep-alive after it's seen any Write error (e.g. a timeout) on that net.Conn. 

To test, verify we don't timeout or see fewer unique client addresses (== unique connections) than requests. 

### <a id="TestServerKeepAlivesEnabled" href="#TestServerKeepAlivesEnabled">func TestServerKeepAlivesEnabled(t *testing.T)</a>

```
searchKey: http_test.TestServerKeepAlivesEnabled
tags: [method private test]
```

```Go
func TestServerKeepAlivesEnabled(t *testing.T)
```

### <a id="TestServerKeepAlivesEnabled_h1" href="#TestServerKeepAlivesEnabled_h1">func TestServerKeepAlivesEnabled_h1(t *testing.T)</a>

```
searchKey: http_test.TestServerKeepAlivesEnabled_h1
tags: [method private test]
```

```Go
func TestServerKeepAlivesEnabled_h1(t *testing.T)
```

Issue 17717: tests that Server.SetKeepAlivesEnabled is respected by both HTTP/1 and HTTP/2. 

### <a id="TestServerKeepAlivesEnabled_h2" href="#TestServerKeepAlivesEnabled_h2">func TestServerKeepAlivesEnabled_h2(t *testing.T)</a>

```
searchKey: http_test.TestServerKeepAlivesEnabled_h2
tags: [method private test]
```

```Go
func TestServerKeepAlivesEnabled_h2(t *testing.T)
```

### <a id="TestServerListenNotComparableListener" href="#TestServerListenNotComparableListener">func TestServerListenNotComparableListener(t *testing.T)</a>

```
searchKey: http_test.TestServerListenNotComparableListener
tags: [method private test]
```

```Go
func TestServerListenNotComparableListener(t *testing.T)
```

Issue 24812: don't crash on non-comparable Listener 

### <a id="TestServerNoContentType_h1" href="#TestServerNoContentType_h1">func TestServerNoContentType_h1(t *testing.T)</a>

```
searchKey: http_test.TestServerNoContentType_h1
tags: [method private test]
```

```Go
func TestServerNoContentType_h1(t *testing.T)
```

### <a id="TestServerNoContentType_h2" href="#TestServerNoContentType_h2">func TestServerNoContentType_h2(t *testing.T)</a>

```
searchKey: http_test.TestServerNoContentType_h2
tags: [method private test]
```

```Go
func TestServerNoContentType_h2(t *testing.T)
```

### <a id="TestServerNoDate_h1" href="#TestServerNoDate_h1">func TestServerNoDate_h1(t *testing.T)</a>

```
searchKey: http_test.TestServerNoDate_h1
tags: [method private test]
```

```Go
func TestServerNoDate_h1(t *testing.T)
```

### <a id="TestServerNoDate_h2" href="#TestServerNoDate_h2">func TestServerNoDate_h2(t *testing.T)</a>

```
searchKey: http_test.TestServerNoDate_h2
tags: [method private test]
```

```Go
func TestServerNoDate_h2(t *testing.T)
```

### <a id="TestServerReaderFromOrder_h1" href="#TestServerReaderFromOrder_h1">func TestServerReaderFromOrder_h1(t *testing.T)</a>

```
searchKey: http_test.TestServerReaderFromOrder_h1
tags: [method private test]
```

```Go
func TestServerReaderFromOrder_h1(t *testing.T)
```

See golang.org/issue/5660 

### <a id="TestServerReaderFromOrder_h2" href="#TestServerReaderFromOrder_h2">func TestServerReaderFromOrder_h2(t *testing.T)</a>

```
searchKey: http_test.TestServerReaderFromOrder_h2
tags: [method private test]
```

```Go
func TestServerReaderFromOrder_h2(t *testing.T)
```

### <a id="TestServerRequestContextCancel_ConnClose" href="#TestServerRequestContextCancel_ConnClose">func TestServerRequestContextCancel_ConnClose(t *testing.T)</a>

```
searchKey: http_test.TestServerRequestContextCancel_ConnClose
tags: [method private test]
```

```Go
func TestServerRequestContextCancel_ConnClose(t *testing.T)
```

Tests that the Request.Context available to the Handler is canceled if the peer closes their TCP connection. This requires that the server is always blocked in a Read call so it notices the EOF from the client. See issues 15927 and 15224. 

### <a id="TestServerRequestContextCancel_ServeHTTPDone_h1" href="#TestServerRequestContextCancel_ServeHTTPDone_h1">func TestServerRequestContextCancel_ServeHTTPDone_h1(t *testing.T)</a>

```
searchKey: http_test.TestServerRequestContextCancel_ServeHTTPDone_h1
tags: [method private test]
```

```Go
func TestServerRequestContextCancel_ServeHTTPDone_h1(t *testing.T)
```

### <a id="TestServerRequestContextCancel_ServeHTTPDone_h2" href="#TestServerRequestContextCancel_ServeHTTPDone_h2">func TestServerRequestContextCancel_ServeHTTPDone_h2(t *testing.T)</a>

```
searchKey: http_test.TestServerRequestContextCancel_ServeHTTPDone_h2
tags: [method private test]
```

```Go
func TestServerRequestContextCancel_ServeHTTPDone_h2(t *testing.T)
```

### <a id="TestServerSetKeepAlivesEnabledClosesConns" href="#TestServerSetKeepAlivesEnabledClosesConns">func TestServerSetKeepAlivesEnabledClosesConns(t *testing.T)</a>

```
searchKey: http_test.TestServerSetKeepAlivesEnabledClosesConns
tags: [method private test]
```

```Go
func TestServerSetKeepAlivesEnabledClosesConns(t *testing.T)
```

Tests that calls to Server.SetKeepAlivesEnabled(false) closes any currently-open connections. 

### <a id="TestServerShutdownStateNew" href="#TestServerShutdownStateNew">func TestServerShutdownStateNew(t *testing.T)</a>

```
searchKey: http_test.TestServerShutdownStateNew
tags: [method private test]
```

```Go
func TestServerShutdownStateNew(t *testing.T)
```

### <a id="TestServerShutdownThenServe" href="#TestServerShutdownThenServe">func TestServerShutdownThenServe(t *testing.T)</a>

```
searchKey: http_test.TestServerShutdownThenServe
tags: [method private test]
```

```Go
func TestServerShutdownThenServe(t *testing.T)
```

Issue 20239: don't block in Serve if Shutdown is called first. 

### <a id="TestServerShutdown_h1" href="#TestServerShutdown_h1">func TestServerShutdown_h1(t *testing.T)</a>

```
searchKey: http_test.TestServerShutdown_h1
tags: [method private test]
```

```Go
func TestServerShutdown_h1(t *testing.T)
```

### <a id="TestServerShutdown_h2" href="#TestServerShutdown_h2">func TestServerShutdown_h2(t *testing.T)</a>

```
searchKey: http_test.TestServerShutdown_h2
tags: [method private test]
```

```Go
func TestServerShutdown_h2(t *testing.T)
```

### <a id="TestServerTimeouts" href="#TestServerTimeouts">func TestServerTimeouts(t *testing.T)</a>

```
searchKey: http_test.TestServerTimeouts
tags: [method private test]
```

```Go
func TestServerTimeouts(t *testing.T)
```

### <a id="TestServerUndeclaredTrailers_h1" href="#TestServerUndeclaredTrailers_h1">func TestServerUndeclaredTrailers_h1(t *testing.T)</a>

```
searchKey: http_test.TestServerUndeclaredTrailers_h1
tags: [method private test]
```

```Go
func TestServerUndeclaredTrailers_h1(t *testing.T)
```

### <a id="TestServerUndeclaredTrailers_h2" href="#TestServerUndeclaredTrailers_h2">func TestServerUndeclaredTrailers_h2(t *testing.T)</a>

```
searchKey: http_test.TestServerUndeclaredTrailers_h2
tags: [method private test]
```

```Go
func TestServerUndeclaredTrailers_h2(t *testing.T)
```

### <a id="TestServerUnreadRequestBodyLarge" href="#TestServerUnreadRequestBodyLarge">func TestServerUnreadRequestBodyLarge(t *testing.T)</a>

```
searchKey: http_test.TestServerUnreadRequestBodyLarge
tags: [method private test]
```

```Go
func TestServerUnreadRequestBodyLarge(t *testing.T)
```

Over a ~256KB (maxPostHandlerReadBytes) threshold, the server should ignore client request bodies that a handler didn't read and close the connection. 

### <a id="TestServerUnreadRequestBodyLittle" href="#TestServerUnreadRequestBodyLittle">func TestServerUnreadRequestBodyLittle(t *testing.T)</a>

```
searchKey: http_test.TestServerUnreadRequestBodyLittle
tags: [method private test]
```

```Go
func TestServerUnreadRequestBodyLittle(t *testing.T)
```

Under a ~256KB (maxPostHandlerReadBytes) threshold, the server should consume client request bodies that a handler didn't read. 

### <a id="TestServerValidatesHeaders" href="#TestServerValidatesHeaders">func TestServerValidatesHeaders(t *testing.T)</a>

```
searchKey: http_test.TestServerValidatesHeaders
tags: [method private test]
```

```Go
func TestServerValidatesHeaders(t *testing.T)
```

Test that we validate the valid bytes in HTTP/1 headers. Issue 11207. 

### <a id="TestServerValidatesHostHeader" href="#TestServerValidatesHostHeader">func TestServerValidatesHostHeader(t *testing.T)</a>

```
searchKey: http_test.TestServerValidatesHostHeader
tags: [method private test]
```

```Go
func TestServerValidatesHostHeader(t *testing.T)
```

Test that we validate the Host header. Issue 11206 (invalid bytes in Host) and 13624 (Host present in HTTP/1.1) 

### <a id="TestServerValidatesMethod" href="#TestServerValidatesMethod">func TestServerValidatesMethod(t *testing.T)</a>

```
searchKey: http_test.TestServerValidatesMethod
tags: [method private test]
```

```Go
func TestServerValidatesMethod(t *testing.T)
```

Issue 18319: test that the Server validates the request method. 

### <a id="TestServerWriteHijackZeroBytes" href="#TestServerWriteHijackZeroBytes">func TestServerWriteHijackZeroBytes(t *testing.T)</a>

```
searchKey: http_test.TestServerWriteHijackZeroBytes
tags: [method private test]
```

```Go
func TestServerWriteHijackZeroBytes(t *testing.T)
```

Issue 16456: allow writing 0 bytes on hijacked conn to test hijack without any log spam. 

### <a id="TestSetBasicAuth" href="#TestSetBasicAuth">func TestSetBasicAuth(t *testing.T)</a>

```
searchKey: http_test.TestSetBasicAuth
tags: [method private test]
```

```Go
func TestSetBasicAuth(t *testing.T)
```

### <a id="TestSetsRemoteAddr_h1" href="#TestSetsRemoteAddr_h1">func TestSetsRemoteAddr_h1(t *testing.T)</a>

```
searchKey: http_test.TestSetsRemoteAddr_h1
tags: [method private test]
```

```Go
func TestSetsRemoteAddr_h1(t *testing.T)
```

### <a id="TestSetsRemoteAddr_h2" href="#TestSetsRemoteAddr_h2">func TestSetsRemoteAddr_h2(t *testing.T)</a>

```
searchKey: http_test.TestSetsRemoteAddr_h2
tags: [method private test]
```

```Go
func TestSetsRemoteAddr_h2(t *testing.T)
```

### <a id="TestShouldCopyHeaderOnRedirect" href="#TestShouldCopyHeaderOnRedirect">func TestShouldCopyHeaderOnRedirect(t *testing.T)</a>

```
searchKey: http_test.TestShouldCopyHeaderOnRedirect
tags: [method private test]
```

```Go
func TestShouldCopyHeaderOnRedirect(t *testing.T)
```

Part of Issue 4800 

### <a id="TestShouldRedirectConcurrency" href="#TestShouldRedirectConcurrency">func TestShouldRedirectConcurrency(t *testing.T)</a>

```
searchKey: http_test.TestShouldRedirectConcurrency
tags: [method private test]
```

```Go
func TestShouldRedirectConcurrency(t *testing.T)
```

### <a id="TestSniffWriteSize_h1" href="#TestSniffWriteSize_h1">func TestSniffWriteSize_h1(t *testing.T)</a>

```
searchKey: http_test.TestSniffWriteSize_h1
tags: [method private test]
```

```Go
func TestSniffWriteSize_h1(t *testing.T)
```

### <a id="TestSniffWriteSize_h2" href="#TestSniffWriteSize_h2">func TestSniffWriteSize_h2(t *testing.T)</a>

```
searchKey: http_test.TestSniffWriteSize_h2
tags: [method private test]
```

```Go
func TestSniffWriteSize_h2(t *testing.T)
```

### <a id="TestStarRequest" href="#TestStarRequest">func TestStarRequest(t *testing.T)</a>

```
searchKey: http_test.TestStarRequest
tags: [method private test]
```

```Go
func TestStarRequest(t *testing.T)
```

### <a id="TestStarRequestFoo_h1" href="#TestStarRequestFoo_h1">func TestStarRequestFoo_h1(t *testing.T)</a>

```
searchKey: http_test.TestStarRequestFoo_h1
tags: [method private test]
```

```Go
func TestStarRequestFoo_h1(t *testing.T)
```

### <a id="TestStarRequestFoo_h2" href="#TestStarRequestFoo_h2">func TestStarRequestFoo_h2(t *testing.T)</a>

```
searchKey: http_test.TestStarRequestFoo_h2
tags: [method private test]
```

```Go
func TestStarRequestFoo_h2(t *testing.T)
```

### <a id="TestStarRequestOptions_h1" href="#TestStarRequestOptions_h1">func TestStarRequestOptions_h1(t *testing.T)</a>

```
searchKey: http_test.TestStarRequestOptions_h1
tags: [method private test]
```

```Go
func TestStarRequestOptions_h1(t *testing.T)
```

### <a id="TestStarRequestOptions_h2" href="#TestStarRequestOptions_h2">func TestStarRequestOptions_h2(t *testing.T)</a>

```
searchKey: http_test.TestStarRequestOptions_h2
tags: [method private test]
```

```Go
func TestStarRequestOptions_h2(t *testing.T)
```

### <a id="TestStreamingGet_h1" href="#TestStreamingGet_h1">func TestStreamingGet_h1(t *testing.T)</a>

```
searchKey: http_test.TestStreamingGet_h1
tags: [method private test]
```

```Go
func TestStreamingGet_h1(t *testing.T)
```

### <a id="TestStreamingGet_h2" href="#TestStreamingGet_h2">func TestStreamingGet_h2(t *testing.T)</a>

```
searchKey: http_test.TestStreamingGet_h2
tags: [method private test]
```

```Go
func TestStreamingGet_h2(t *testing.T)
```

### <a id="TestStressSurpriseServerCloses" href="#TestStressSurpriseServerCloses">func TestStressSurpriseServerCloses(t *testing.T)</a>

```
searchKey: http_test.TestStressSurpriseServerCloses
tags: [method private test]
```

```Go
func TestStressSurpriseServerCloses(t *testing.T)
```

Test for [https://golang.org/issue/2616](https://golang.org/issue/2616) (appropriate issue number) This fails pretty reliably with GOMAXPROCS=100 or something high. 

### <a id="TestStripPasswordFromError" href="#TestStripPasswordFromError">func TestStripPasswordFromError(t *testing.T)</a>

```
searchKey: http_test.TestStripPasswordFromError
tags: [method private test]
```

```Go
func TestStripPasswordFromError(t *testing.T)
```

### <a id="TestStripPortFromHost" href="#TestStripPortFromHost">func TestStripPortFromHost(t *testing.T)</a>

```
searchKey: http_test.TestStripPortFromHost
tags: [method private test]
```

```Go
func TestStripPortFromHost(t *testing.T)
```

Issue 23351: document and test behavior of ServeMux with ports 

### <a id="TestStripPrefix" href="#TestStripPrefix">func TestStripPrefix(t *testing.T)</a>

```
searchKey: http_test.TestStripPrefix
tags: [method private test]
```

```Go
func TestStripPrefix(t *testing.T)
```

### <a id="TestStripPrefixNotModifyRequest" href="#TestStripPrefixNotModifyRequest">func TestStripPrefixNotModifyRequest(t *testing.T)</a>

```
searchKey: http_test.TestStripPrefixNotModifyRequest
tags: [method private test]
```

```Go
func TestStripPrefixNotModifyRequest(t *testing.T)
```

[https://golang.org/issue/18952](https://golang.org/issue/18952). 

### <a id="TestTLSHandshakeTimeout" href="#TestTLSHandshakeTimeout">func TestTLSHandshakeTimeout(t *testing.T)</a>

```
searchKey: http_test.TestTLSHandshakeTimeout
tags: [method private test]
```

```Go
func TestTLSHandshakeTimeout(t *testing.T)
```

### <a id="TestTLSHandshakeTrace" href="#TestTLSHandshakeTrace">func TestTLSHandshakeTrace(t *testing.T)</a>

```
searchKey: http_test.TestTLSHandshakeTrace
tags: [method private test]
```

```Go
func TestTLSHandshakeTrace(t *testing.T)
```

Test the httptrace.TLSHandshake{Start,Done} hooks with a https http1 connections. The http2 test is done in TestTransportEventTrace_h2 

### <a id="TestTLSServer" href="#TestTLSServer">func TestTLSServer(t *testing.T)</a>

```
searchKey: http_test.TestTLSServer
tags: [method private test]
```

```Go
func TestTLSServer(t *testing.T)
```

### <a id="TestTLSServerClosesConnection" href="#TestTLSServerClosesConnection">func TestTLSServerClosesConnection(t *testing.T)</a>

```
searchKey: http_test.TestTLSServerClosesConnection
tags: [method private test]
```

```Go
func TestTLSServerClosesConnection(t *testing.T)
```

Trying to repro golang.org/issue/3514 

### <a id="TestTLSServerRejectHTTPRequests" href="#TestTLSServerRejectHTTPRequests">func TestTLSServerRejectHTTPRequests(t *testing.T)</a>

```
searchKey: http_test.TestTLSServerRejectHTTPRequests
tags: [method private test]
```

```Go
func TestTLSServerRejectHTTPRequests(t *testing.T)
```

Test that the HTTPS server nicely rejects plaintext HTTP/1.x requests. 

### <a id="TestTimeoutHandlerEmptyResponse" href="#TestTimeoutHandlerEmptyResponse">func TestTimeoutHandlerEmptyResponse(t *testing.T)</a>

```
searchKey: http_test.TestTimeoutHandlerEmptyResponse
tags: [method private test]
```

```Go
func TestTimeoutHandlerEmptyResponse(t *testing.T)
```

[https://golang.org/issue/15948](https://golang.org/issue/15948) 

### <a id="TestTimeoutHandlerPanicRecovery" href="#TestTimeoutHandlerPanicRecovery">func TestTimeoutHandlerPanicRecovery(t *testing.T)</a>

```
searchKey: http_test.TestTimeoutHandlerPanicRecovery
tags: [method private test]
```

```Go
func TestTimeoutHandlerPanicRecovery(t *testing.T)
```

[https://golang.org/issues/22084](https://golang.org/issues/22084) 

### <a id="TestTimeoutHandlerRace" href="#TestTimeoutHandlerRace">func TestTimeoutHandlerRace(t *testing.T)</a>

```
searchKey: http_test.TestTimeoutHandlerRace
tags: [method private test]
```

```Go
func TestTimeoutHandlerRace(t *testing.T)
```

See issues 8209 and 8414. 

### <a id="TestTimeoutHandlerRaceHeader" href="#TestTimeoutHandlerRaceHeader">func TestTimeoutHandlerRaceHeader(t *testing.T)</a>

```
searchKey: http_test.TestTimeoutHandlerRaceHeader
tags: [method private test]
```

```Go
func TestTimeoutHandlerRaceHeader(t *testing.T)
```

See issues 8209 and 8414. Both issues involved panics in the implementation of TimeoutHandler. 

### <a id="TestTimeoutHandlerRaceHeaderTimeout" href="#TestTimeoutHandlerRaceHeaderTimeout">func TestTimeoutHandlerRaceHeaderTimeout(t *testing.T)</a>

```
searchKey: http_test.TestTimeoutHandlerRaceHeaderTimeout
tags: [method private test]
```

```Go
func TestTimeoutHandlerRaceHeaderTimeout(t *testing.T)
```

Issue 9162 

### <a id="TestTimeoutHandlerStartTimerWhenServing" href="#TestTimeoutHandlerStartTimerWhenServing">func TestTimeoutHandlerStartTimerWhenServing(t *testing.T)</a>

```
searchKey: http_test.TestTimeoutHandlerStartTimerWhenServing
tags: [method private test]
```

```Go
func TestTimeoutHandlerStartTimerWhenServing(t *testing.T)
```

Issue 14568. 

### <a id="TestTimeoutHandlerSuperfluousLogs" href="#TestTimeoutHandlerSuperfluousLogs">func TestTimeoutHandlerSuperfluousLogs(t *testing.T)</a>

```
searchKey: http_test.TestTimeoutHandlerSuperfluousLogs
tags: [method private test]
```

```Go
func TestTimeoutHandlerSuperfluousLogs(t *testing.T)
```

Issue 30803: ensure that TimeoutHandler logs spurious WriteHeader calls, for consistency with other Handlers. 

### <a id="TestTimeoutHandler_h1" href="#TestTimeoutHandler_h1">func TestTimeoutHandler_h1(t *testing.T)</a>

```
searchKey: http_test.TestTimeoutHandler_h1
tags: [method private test]
```

```Go
func TestTimeoutHandler_h1(t *testing.T)
```

### <a id="TestTimeoutHandler_h2" href="#TestTimeoutHandler_h2">func TestTimeoutHandler_h2(t *testing.T)</a>

```
searchKey: http_test.TestTimeoutHandler_h2
tags: [method private test]
```

```Go
func TestTimeoutHandler_h2(t *testing.T)
```

### <a id="TestTolerateCRLFBeforeRequestLine" href="#TestTolerateCRLFBeforeRequestLine">func TestTolerateCRLFBeforeRequestLine(t *testing.T)</a>

```
searchKey: http_test.TestTolerateCRLFBeforeRequestLine
tags: [method private test]
```

```Go
func TestTolerateCRLFBeforeRequestLine(t *testing.T)
```

tolerate extra CRLF(s) before Request-Line on subsequent requests on a conn Issue 10876. 

### <a id="TestTrailersClientToServer_h1" href="#TestTrailersClientToServer_h1">func TestTrailersClientToServer_h1(t *testing.T)</a>

```
searchKey: http_test.TestTrailersClientToServer_h1
tags: [method private test]
```

```Go
func TestTrailersClientToServer_h1(t *testing.T)
```

Tests that clients can send trailers to a server and that the server can read them. 

### <a id="TestTrailersClientToServer_h2" href="#TestTrailersClientToServer_h2">func TestTrailersClientToServer_h2(t *testing.T)</a>

```
searchKey: http_test.TestTrailersClientToServer_h2
tags: [method private test]
```

```Go
func TestTrailersClientToServer_h2(t *testing.T)
```

### <a id="TestTrailersServerToClient_Flush_h1" href="#TestTrailersServerToClient_Flush_h1">func TestTrailersServerToClient_Flush_h1(t *testing.T)</a>

```
searchKey: http_test.TestTrailersServerToClient_Flush_h1
tags: [method private test]
```

```Go
func TestTrailersServerToClient_Flush_h1(t *testing.T)
```

### <a id="TestTrailersServerToClient_Flush_h2" href="#TestTrailersServerToClient_Flush_h2">func TestTrailersServerToClient_Flush_h2(t *testing.T)</a>

```
searchKey: http_test.TestTrailersServerToClient_Flush_h2
tags: [method private test]
```

```Go
func TestTrailersServerToClient_Flush_h2(t *testing.T)
```

### <a id="TestTrailersServerToClient_h1" href="#TestTrailersServerToClient_h1">func TestTrailersServerToClient_h1(t *testing.T)</a>

```
searchKey: http_test.TestTrailersServerToClient_h1
tags: [method private test]
```

```Go
func TestTrailersServerToClient_h1(t *testing.T)
```

Tests that servers send trailers to a client and that the client can read them. 

### <a id="TestTrailersServerToClient_h2" href="#TestTrailersServerToClient_h2">func TestTrailersServerToClient_h2(t *testing.T)</a>

```
searchKey: http_test.TestTrailersServerToClient_h2
tags: [method private test]
```

```Go
func TestTrailersServerToClient_h2(t *testing.T)
```

### <a id="TestTransportAltProto" href="#TestTransportAltProto">func TestTransportAltProto(t *testing.T)</a>

```
searchKey: http_test.TestTransportAltProto
tags: [method private test]
```

```Go
func TestTransportAltProto(t *testing.T)
```

### <a id="TestTransportAndServerSharedBodyRace_h1" href="#TestTransportAndServerSharedBodyRace_h1">func TestTransportAndServerSharedBodyRace_h1(t *testing.T)</a>

```
searchKey: http_test.TestTransportAndServerSharedBodyRace_h1
tags: [method private test]
```

```Go
func TestTransportAndServerSharedBodyRace_h1(t *testing.T)
```

Issue 6995 A server Handler can receive a Request, and then turn around and give a copy of that Request.Body out to the Transport (e.g. any proxy).  So then two people own that Request.Body (both the server and the http client), and both think they can close it on failure. Therefore, all incoming server requests Bodies need to be thread-safe. 

### <a id="TestTransportAndServerSharedBodyRace_h2" href="#TestTransportAndServerSharedBodyRace_h2">func TestTransportAndServerSharedBodyRace_h2(t *testing.T)</a>

```
searchKey: http_test.TestTransportAndServerSharedBodyRace_h2
tags: [method private test]
```

```Go
func TestTransportAndServerSharedBodyRace_h2(t *testing.T)
```

### <a id="TestTransportAutomaticHTTP2" href="#TestTransportAutomaticHTTP2">func TestTransportAutomaticHTTP2(t *testing.T)</a>

```
searchKey: http_test.TestTransportAutomaticHTTP2
tags: [method private test]
```

```Go
func TestTransportAutomaticHTTP2(t *testing.T)
```

### <a id="TestTransportAutomaticHTTP2_DefaultTransport" href="#TestTransportAutomaticHTTP2_DefaultTransport">func TestTransportAutomaticHTTP2_DefaultTransport(t *testing.T)</a>

```
searchKey: http_test.TestTransportAutomaticHTTP2_DefaultTransport
tags: [method private test]
```

```Go
func TestTransportAutomaticHTTP2_DefaultTransport(t *testing.T)
```

golang.org/issue/14391: also check DefaultTransport 

### <a id="TestTransportAutomaticHTTP2_Dial" href="#TestTransportAutomaticHTTP2_Dial">func TestTransportAutomaticHTTP2_Dial(t *testing.T)</a>

```
searchKey: http_test.TestTransportAutomaticHTTP2_Dial
tags: [method private test]
```

```Go
func TestTransportAutomaticHTTP2_Dial(t *testing.T)
```

### <a id="TestTransportAutomaticHTTP2_DialContext" href="#TestTransportAutomaticHTTP2_DialContext">func TestTransportAutomaticHTTP2_DialContext(t *testing.T)</a>

```
searchKey: http_test.TestTransportAutomaticHTTP2_DialContext
tags: [method private test]
```

```Go
func TestTransportAutomaticHTTP2_DialContext(t *testing.T)
```

### <a id="TestTransportAutomaticHTTP2_DialTLS" href="#TestTransportAutomaticHTTP2_DialTLS">func TestTransportAutomaticHTTP2_DialTLS(t *testing.T)</a>

```
searchKey: http_test.TestTransportAutomaticHTTP2_DialTLS
tags: [method private test]
```

```Go
func TestTransportAutomaticHTTP2_DialTLS(t *testing.T)
```

### <a id="TestTransportAutomaticHTTP2_DialerAndTLSConfigSupportsHTTP2AndTLSConfig" href="#TestTransportAutomaticHTTP2_DialerAndTLSConfigSupportsHTTP2AndTLSConfig">func TestTransportAutomaticHTTP2_DialerAndTLSConfigSupportsHTTP2AndTLSConfig(t *testing.T)</a>

```
searchKey: http_test.TestTransportAutomaticHTTP2_DialerAndTLSConfigSupportsHTTP2AndTLSConfig
tags: [method private test]
```

```Go
func TestTransportAutomaticHTTP2_DialerAndTLSConfigSupportsHTTP2AndTLSConfig(t *testing.T)
```

### <a id="TestTransportAutomaticHTTP2_ExpectContinueTimeout" href="#TestTransportAutomaticHTTP2_ExpectContinueTimeout">func TestTransportAutomaticHTTP2_ExpectContinueTimeout(t *testing.T)</a>

```
searchKey: http_test.TestTransportAutomaticHTTP2_ExpectContinueTimeout
tags: [method private test]
```

```Go
func TestTransportAutomaticHTTP2_ExpectContinueTimeout(t *testing.T)
```

### <a id="TestTransportAutomaticHTTP2_TLSConfig" href="#TestTransportAutomaticHTTP2_TLSConfig">func TestTransportAutomaticHTTP2_TLSConfig(t *testing.T)</a>

```
searchKey: http_test.TestTransportAutomaticHTTP2_TLSConfig
tags: [method private test]
```

```Go
func TestTransportAutomaticHTTP2_TLSConfig(t *testing.T)
```

### <a id="TestTransportAutomaticHTTP2_TLSNextProto" href="#TestTransportAutomaticHTTP2_TLSNextProto">func TestTransportAutomaticHTTP2_TLSNextProto(t *testing.T)</a>

```
searchKey: http_test.TestTransportAutomaticHTTP2_TLSNextProto
tags: [method private test]
```

```Go
func TestTransportAutomaticHTTP2_TLSNextProto(t *testing.T)
```

### <a id="TestTransportBodyReadError" href="#TestTransportBodyReadError">func TestTransportBodyReadError(t *testing.T)</a>

```
searchKey: http_test.TestTransportBodyReadError
tags: [method private test]
```

```Go
func TestTransportBodyReadError(t *testing.T)
```

Issue 18239: make sure the Transport doesn't retry requests with bodies if Request.GetBody is not defined. 

### <a id="TestTransportCONNECTBidi" href="#TestTransportCONNECTBidi">func TestTransportCONNECTBidi(t *testing.T)</a>

```
searchKey: http_test.TestTransportCONNECTBidi
tags: [method private test]
```

```Go
func TestTransportCONNECTBidi(t *testing.T)
```

### <a id="TestTransportCancelBeforeResponseHeaders" href="#TestTransportCancelBeforeResponseHeaders">func TestTransportCancelBeforeResponseHeaders(t *testing.T)</a>

```
searchKey: http_test.TestTransportCancelBeforeResponseHeaders
tags: [method private test]
```

```Go
func TestTransportCancelBeforeResponseHeaders(t *testing.T)
```

Issue 11020. The returned error message should be errRequestCanceled 

### <a id="TestTransportCancelRequest" href="#TestTransportCancelRequest">func TestTransportCancelRequest(t *testing.T)</a>

```
searchKey: http_test.TestTransportCancelRequest
tags: [method private test]
```

```Go
func TestTransportCancelRequest(t *testing.T)
```

### <a id="TestTransportCancelRequestInDial" href="#TestTransportCancelRequestInDial">func TestTransportCancelRequestInDial(t *testing.T)</a>

```
searchKey: http_test.TestTransportCancelRequestInDial
tags: [method private test]
```

```Go
func TestTransportCancelRequestInDial(t *testing.T)
```

### <a id="TestTransportCancelRequestInDo" href="#TestTransportCancelRequestInDo">func TestTransportCancelRequestInDo(t *testing.T)</a>

```
searchKey: http_test.TestTransportCancelRequestInDo
tags: [method private test]
```

```Go
func TestTransportCancelRequestInDo(t *testing.T)
```

### <a id="TestTransportCancelRequestWithBodyInDo" href="#TestTransportCancelRequestWithBodyInDo">func TestTransportCancelRequestWithBodyInDo(t *testing.T)</a>

```
searchKey: http_test.TestTransportCancelRequestWithBodyInDo
tags: [method private test]
```

```Go
func TestTransportCancelRequestWithBodyInDo(t *testing.T)
```

### <a id="TestTransportCheckContextDoneEarly" href="#TestTransportCheckContextDoneEarly">func TestTransportCheckContextDoneEarly(t *testing.T)</a>

```
searchKey: http_test.TestTransportCheckContextDoneEarly
tags: [method private test]
```

```Go
func TestTransportCheckContextDoneEarly(t *testing.T)
```

Issue 25852: Transport should check whether Context is done early. 

### <a id="TestTransportClone" href="#TestTransportClone">func TestTransportClone(t *testing.T)</a>

```
searchKey: http_test.TestTransportClone
tags: [method private test]
```

```Go
func TestTransportClone(t *testing.T)
```

### <a id="TestTransportCloseIdleConnsThenReturn" href="#TestTransportCloseIdleConnsThenReturn">func TestTransportCloseIdleConnsThenReturn(t *testing.T)</a>

```
searchKey: http_test.TestTransportCloseIdleConnsThenReturn
tags: [method private test]
```

```Go
func TestTransportCloseIdleConnsThenReturn(t *testing.T)
```

tests that putting an idle conn after a call to CloseIdleConns does return it 

### <a id="TestTransportCloseResponseBody" href="#TestTransportCloseResponseBody">func TestTransportCloseResponseBody(t *testing.T)</a>

```
searchKey: http_test.TestTransportCloseResponseBody
tags: [method private test]
```

```Go
func TestTransportCloseResponseBody(t *testing.T)
```

golang.org/issue/3672 -- Client can't close HTTP stream Calling Close on a Response.Body used to just read until EOF. Now it actually closes the TCP connection. 

### <a id="TestTransportClosesBodyOnError" href="#TestTransportClosesBodyOnError">func TestTransportClosesBodyOnError(t *testing.T)</a>

```
searchKey: http_test.TestTransportClosesBodyOnError
tags: [method private test]
```

```Go
func TestTransportClosesBodyOnError(t *testing.T)
```

Issue 6981 

### <a id="TestTransportClosesBodyOnInvalidRequests" href="#TestTransportClosesBodyOnInvalidRequests">func TestTransportClosesBodyOnInvalidRequests(t *testing.T)</a>

```
searchKey: http_test.TestTransportClosesBodyOnInvalidRequests
tags: [method private test]
```

```Go
func TestTransportClosesBodyOnInvalidRequests(t *testing.T)
```

Issue 35015: ensure that Transport closes the body on any error with an invalid request, as promised by Client.Do docs. 

### <a id="TestTransportClosesRequestBody" href="#TestTransportClosesRequestBody">func TestTransportClosesRequestBody(t *testing.T)</a>

```
searchKey: http_test.TestTransportClosesRequestBody
tags: [method private test]
```

```Go
func TestTransportClosesRequestBody(t *testing.T)
```

Verify the status quo: that the Client.Post function coerces its body into a ReadCloser if it's a Closer, and that the Transport then closes it. 

### <a id="TestTransportConcurrency" href="#TestTransportConcurrency">func TestTransportConcurrency(t *testing.T)</a>

```
searchKey: http_test.TestTransportConcurrency
tags: [method private test]
```

```Go
func TestTransportConcurrency(t *testing.T)
```

### <a id="TestTransportConnectionCloseOnRequest" href="#TestTransportConnectionCloseOnRequest">func TestTransportConnectionCloseOnRequest(t *testing.T)</a>

```
searchKey: http_test.TestTransportConnectionCloseOnRequest
tags: [method private test]
```

```Go
func TestTransportConnectionCloseOnRequest(t *testing.T)
```

### <a id="TestTransportConnectionCloseOnRequestDisableKeepAlive" href="#TestTransportConnectionCloseOnRequestDisableKeepAlive">func TestTransportConnectionCloseOnRequestDisableKeepAlive(t *testing.T)</a>

```
searchKey: http_test.TestTransportConnectionCloseOnRequestDisableKeepAlive
tags: [method private test]
```

```Go
func TestTransportConnectionCloseOnRequestDisableKeepAlive(t *testing.T)
```

if the Transport's DisableKeepAlives is set, all requests should send Connection: close. HTTP/1-only (Connection: close doesn't exist in h2) 

### <a id="TestTransportConnectionCloseOnResponse" href="#TestTransportConnectionCloseOnResponse">func TestTransportConnectionCloseOnResponse(t *testing.T)</a>

```
searchKey: http_test.TestTransportConnectionCloseOnResponse
tags: [method private test]
```

```Go
func TestTransportConnectionCloseOnResponse(t *testing.T)
```

### <a id="TestTransportContentEncodingCaseInsensitive" href="#TestTransportContentEncodingCaseInsensitive">func TestTransportContentEncodingCaseInsensitive(t *testing.T)</a>

```
searchKey: http_test.TestTransportContentEncodingCaseInsensitive
tags: [method private test]
```

```Go
func TestTransportContentEncodingCaseInsensitive(t *testing.T)
```

Test for issue 19248: Content-Encoding's value is case insensitive. 

### <a id="TestTransportDecrementConnWhenIdleConnRemoved" href="#TestTransportDecrementConnWhenIdleConnRemoved">func TestTransportDecrementConnWhenIdleConnRemoved(t *testing.T)</a>

```
searchKey: http_test.TestTransportDecrementConnWhenIdleConnRemoved
tags: [method private test]
```

```Go
func TestTransportDecrementConnWhenIdleConnRemoved(t *testing.T)
```

Issue 34941 When the client has too many concurrent requests on a single connection, http.http2noCachedConnError is reported on multiple requests. There should only be one decrement regardless of the number of failures. 

### <a id="TestTransportDialCancelRace" href="#TestTransportDialCancelRace">func TestTransportDialCancelRace(t *testing.T)</a>

```
searchKey: http_test.TestTransportDialCancelRace
tags: [method private test]
```

```Go
func TestTransportDialCancelRace(t *testing.T)
```

### <a id="TestTransportDialContext" href="#TestTransportDialContext">func TestTransportDialContext(t *testing.T)</a>

```
searchKey: http_test.TestTransportDialContext
tags: [method private test]
```

```Go
func TestTransportDialContext(t *testing.T)
```

### <a id="TestTransportDialPreservesNetOpProxyError" href="#TestTransportDialPreservesNetOpProxyError">func TestTransportDialPreservesNetOpProxyError(t *testing.T)</a>

```
searchKey: http_test.TestTransportDialPreservesNetOpProxyError
tags: [method private test]
```

```Go
func TestTransportDialPreservesNetOpProxyError(t *testing.T)
```

Issue 16997: test transport dial preserves typed errors 

### <a id="TestTransportDialTLS" href="#TestTransportDialTLS">func TestTransportDialTLS(t *testing.T)</a>

```
searchKey: http_test.TestTransportDialTLS
tags: [method private test]
```

```Go
func TestTransportDialTLS(t *testing.T)
```

### <a id="TestTransportDialTLSContext" href="#TestTransportDialTLSContext">func TestTransportDialTLSContext(t *testing.T)</a>

```
searchKey: http_test.TestTransportDialTLSContext
tags: [method private test]
```

```Go
func TestTransportDialTLSContext(t *testing.T)
```

### <a id="TestTransportDiscardsUnneededConns" href="#TestTransportDiscardsUnneededConns">func TestTransportDiscardsUnneededConns(t *testing.T)</a>

```
searchKey: http_test.TestTransportDiscardsUnneededConns
tags: [method private test]
```

```Go
func TestTransportDiscardsUnneededConns(t *testing.T)
```

Issue 13957 

### <a id="TestTransportEmptyMethod" href="#TestTransportEmptyMethod">func TestTransportEmptyMethod(t *testing.T)</a>

```
searchKey: http_test.TestTransportEmptyMethod
tags: [method private test]
```

```Go
func TestTransportEmptyMethod(t *testing.T)
```

Issue 13311 

### <a id="TestTransportEventTrace" href="#TestTransportEventTrace">func TestTransportEventTrace(t *testing.T)</a>

```
searchKey: http_test.TestTransportEventTrace
tags: [method private test]
```

```Go
func TestTransportEventTrace(t *testing.T)
```

### <a id="TestTransportEventTraceRealDNS" href="#TestTransportEventTraceRealDNS">func TestTransportEventTraceRealDNS(t *testing.T)</a>

```
searchKey: http_test.TestTransportEventTraceRealDNS
tags: [method private test]
```

```Go
func TestTransportEventTraceRealDNS(t *testing.T)
```

### <a id="TestTransportEventTraceTLSVerify" href="#TestTransportEventTraceTLSVerify">func TestTransportEventTraceTLSVerify(t *testing.T)</a>

```
searchKey: http_test.TestTransportEventTraceTLSVerify
tags: [method private test]
```

```Go
func TestTransportEventTraceTLSVerify(t *testing.T)
```

### <a id="TestTransportEventTrace_NoHooks" href="#TestTransportEventTrace_NoHooks">func TestTransportEventTrace_NoHooks(t *testing.T)</a>

```
searchKey: http_test.TestTransportEventTrace_NoHooks
tags: [method private test]
```

```Go
func TestTransportEventTrace_NoHooks(t *testing.T)
```

test a non-nil httptrace.ClientTrace but with all hooks set to zero. 

### <a id="TestTransportEventTrace_NoHooks_h2" href="#TestTransportEventTrace_NoHooks_h2">func TestTransportEventTrace_NoHooks_h2(t *testing.T)</a>

```
searchKey: http_test.TestTransportEventTrace_NoHooks_h2
tags: [method private test]
```

```Go
func TestTransportEventTrace_NoHooks_h2(t *testing.T)
```

### <a id="TestTransportEventTrace_h2" href="#TestTransportEventTrace_h2">func TestTransportEventTrace_h2(t *testing.T)</a>

```
searchKey: http_test.TestTransportEventTrace_h2
tags: [method private test]
```

```Go
func TestTransportEventTrace_h2(t *testing.T)
```

### <a id="TestTransportExpect100Continue" href="#TestTransportExpect100Continue">func TestTransportExpect100Continue(t *testing.T)</a>

```
searchKey: http_test.TestTransportExpect100Continue
tags: [method private test]
```

```Go
func TestTransportExpect100Continue(t *testing.T)
```

If a request has Expect:100-continue header, the request blocks sending body until the first response. Premature consumption of the request body should not be occurred. 

### <a id="TestTransportFlushesBodyChunks" href="#TestTransportFlushesBodyChunks">func TestTransportFlushesBodyChunks(t *testing.T)</a>

```
searchKey: http_test.TestTransportFlushesBodyChunks
tags: [method private test]
```

```Go
func TestTransportFlushesBodyChunks(t *testing.T)
```

Issue 6574 

### <a id="TestTransportFlushesRequestHeader" href="#TestTransportFlushesRequestHeader">func TestTransportFlushesRequestHeader(t *testing.T)</a>

```
searchKey: http_test.TestTransportFlushesRequestHeader
tags: [method private test]
```

```Go
func TestTransportFlushesRequestHeader(t *testing.T)
```

Issue 22088: flush Transport request headers if we're not sure the body won't block on read. 

### <a id="TestTransportGCRequest_Body_h1" href="#TestTransportGCRequest_Body_h1">func TestTransportGCRequest_Body_h1(t *testing.T)</a>

```
searchKey: http_test.TestTransportGCRequest_Body_h1
tags: [method private test]
```

```Go
func TestTransportGCRequest_Body_h1(t *testing.T)
```

tests that Transport doesn't retain a pointer to the provided request. 

### <a id="TestTransportGCRequest_Body_h2" href="#TestTransportGCRequest_Body_h2">func TestTransportGCRequest_Body_h2(t *testing.T)</a>

```
searchKey: http_test.TestTransportGCRequest_Body_h2
tags: [method private test]
```

```Go
func TestTransportGCRequest_Body_h2(t *testing.T)
```

### <a id="TestTransportGCRequest_NoBody_h1" href="#TestTransportGCRequest_NoBody_h1">func TestTransportGCRequest_NoBody_h1(t *testing.T)</a>

```
searchKey: http_test.TestTransportGCRequest_NoBody_h1
tags: [method private test]
```

```Go
func TestTransportGCRequest_NoBody_h1(t *testing.T)
```

### <a id="TestTransportGCRequest_NoBody_h2" href="#TestTransportGCRequest_NoBody_h2">func TestTransportGCRequest_NoBody_h2(t *testing.T)</a>

```
searchKey: http_test.TestTransportGCRequest_NoBody_h2
tags: [method private test]
```

```Go
func TestTransportGCRequest_NoBody_h2(t *testing.T)
```

### <a id="TestTransportGzip" href="#TestTransportGzip">func TestTransportGzip(t *testing.T)</a>

```
searchKey: http_test.TestTransportGzip
tags: [method private test]
```

```Go
func TestTransportGzip(t *testing.T)
```

### <a id="TestTransportGzipRecursive" href="#TestTransportGzipRecursive">func TestTransportGzipRecursive(t *testing.T)</a>

```
searchKey: http_test.TestTransportGzipRecursive
tags: [method private test]
```

```Go
func TestTransportGzipRecursive(t *testing.T)
```

TestTransportGzipRecursive sends a gzip quine and checks that the client gets the same value back. This is more cute than anything, but checks that we don't recurse forever, and checks that Content-Encoding is removed. 

### <a id="TestTransportGzipShort" href="#TestTransportGzipShort">func TestTransportGzipShort(t *testing.T)</a>

```
searchKey: http_test.TestTransportGzipShort
tags: [method private test]
```

```Go
func TestTransportGzipShort(t *testing.T)
```

golang.org/issue/7750: request fails when server replies with a short gzip body 

### <a id="TestTransportHeadChunkedResponse" href="#TestTransportHeadChunkedResponse">func TestTransportHeadChunkedResponse(t *testing.T)</a>

```
searchKey: http_test.TestTransportHeadChunkedResponse
tags: [method private test]
```

```Go
func TestTransportHeadChunkedResponse(t *testing.T)
```

TestTransportHeadChunkedResponse verifies that we ignore chunked transfer-encoding on responses to HEAD requests. 

### <a id="TestTransportHeadResponses" href="#TestTransportHeadResponses">func TestTransportHeadResponses(t *testing.T)</a>

```
searchKey: http_test.TestTransportHeadResponses
tags: [method private test]
```

```Go
func TestTransportHeadResponses(t *testing.T)
```

TestTransportHeadResponses verifies that we deal with Content-Lengths with no bodies properly 

### <a id="TestTransportIDNA_h1" href="#TestTransportIDNA_h1">func TestTransportIDNA_h1(t *testing.T)</a>

```
searchKey: http_test.TestTransportIDNA_h1
tags: [method private test]
```

```Go
func TestTransportIDNA_h1(t *testing.T)
```

Issue 13835: international domain names should work 

### <a id="TestTransportIDNA_h2" href="#TestTransportIDNA_h2">func TestTransportIDNA_h2(t *testing.T)</a>

```
searchKey: http_test.TestTransportIDNA_h2
tags: [method private test]
```

```Go
func TestTransportIDNA_h2(t *testing.T)
```

### <a id="TestTransportIdleCacheKeys" href="#TestTransportIdleCacheKeys">func TestTransportIdleCacheKeys(t *testing.T)</a>

```
searchKey: http_test.TestTransportIdleCacheKeys
tags: [method private test]
```

```Go
func TestTransportIdleCacheKeys(t *testing.T)
```

### <a id="TestTransportIdleConnCrash" href="#TestTransportIdleConnCrash">func TestTransportIdleConnCrash(t *testing.T)</a>

```
searchKey: http_test.TestTransportIdleConnCrash
tags: [method private test]
```

```Go
func TestTransportIdleConnCrash(t *testing.T)
```

This used to crash; [https://golang.org/issue/3266](https://golang.org/issue/3266) 

### <a id="TestTransportIdleConnTimeout_h1" href="#TestTransportIdleConnTimeout_h1">func TestTransportIdleConnTimeout_h1(t *testing.T)</a>

```
searchKey: http_test.TestTransportIdleConnTimeout_h1
tags: [method private test]
```

```Go
func TestTransportIdleConnTimeout_h1(t *testing.T)
```

### <a id="TestTransportIdleConnTimeout_h2" href="#TestTransportIdleConnTimeout_h2">func TestTransportIdleConnTimeout_h2(t *testing.T)</a>

```
searchKey: http_test.TestTransportIdleConnTimeout_h2
tags: [method private test]
```

```Go
func TestTransportIdleConnTimeout_h2(t *testing.T)
```

### <a id="TestTransportIgnore1xxResponses" href="#TestTransportIgnore1xxResponses">func TestTransportIgnore1xxResponses(t *testing.T)</a>

```
searchKey: http_test.TestTransportIgnore1xxResponses
tags: [method private test]
```

```Go
func TestTransportIgnore1xxResponses(t *testing.T)
```

Issue 17739: the HTTP client must ignore any unknown 1xx informational responses before the actual response. 

### <a id="TestTransportIgnores408" href="#TestTransportIgnores408">func TestTransportIgnores408(t *testing.T)</a>

```
searchKey: http_test.TestTransportIgnores408
tags: [method private test]
```

```Go
func TestTransportIgnores408(t *testing.T)
```

### <a id="TestTransportIssue10457" href="#TestTransportIssue10457">func TestTransportIssue10457(t *testing.T)</a>

```
searchKey: http_test.TestTransportIssue10457
tags: [method private test]
```

```Go
func TestTransportIssue10457(t *testing.T)
```

Tests that we don't leak Transport persistConn.readLoop goroutines when a server hangs up immediately after saying it would keep-alive. 

### <a id="TestTransportKeepAlives" href="#TestTransportKeepAlives">func TestTransportKeepAlives(t *testing.T)</a>

```
searchKey: http_test.TestTransportKeepAlives
tags: [method private test]
```

```Go
func TestTransportKeepAlives(t *testing.T)
```

Two subsequent requests and verify their response is the same. The response from the server is our own IP:port 

### <a id="TestTransportLimits1xxResponses" href="#TestTransportLimits1xxResponses">func TestTransportLimits1xxResponses(t *testing.T)</a>

```
searchKey: http_test.TestTransportLimits1xxResponses
tags: [method private test]
```

```Go
func TestTransportLimits1xxResponses(t *testing.T)
```

### <a id="TestTransportMaxConnsPerHost" href="#TestTransportMaxConnsPerHost">func TestTransportMaxConnsPerHost(t *testing.T)</a>

```
searchKey: http_test.TestTransportMaxConnsPerHost
tags: [method private test]
```

```Go
func TestTransportMaxConnsPerHost(t *testing.T)
```

### <a id="TestTransportMaxConnsPerHostIncludeDialInProgress" href="#TestTransportMaxConnsPerHostIncludeDialInProgress">func TestTransportMaxConnsPerHostIncludeDialInProgress(t *testing.T)</a>

```
searchKey: http_test.TestTransportMaxConnsPerHostIncludeDialInProgress
tags: [method private test]
```

```Go
func TestTransportMaxConnsPerHostIncludeDialInProgress(t *testing.T)
```

### <a id="TestTransportMaxIdleConns" href="#TestTransportMaxIdleConns">func TestTransportMaxIdleConns(t *testing.T)</a>

```
searchKey: http_test.TestTransportMaxIdleConns
tags: [method private test]
```

```Go
func TestTransportMaxIdleConns(t *testing.T)
```

### <a id="TestTransportMaxPerHostIdleConns" href="#TestTransportMaxPerHostIdleConns">func TestTransportMaxPerHostIdleConns(t *testing.T)</a>

```
searchKey: http_test.TestTransportMaxPerHostIdleConns
tags: [method private test]
```

```Go
func TestTransportMaxPerHostIdleConns(t *testing.T)
```

### <a id="TestTransportNoHost" href="#TestTransportNoHost">func TestTransportNoHost(t *testing.T)</a>

```
searchKey: http_test.TestTransportNoHost
tags: [method private test]
```

```Go
func TestTransportNoHost(t *testing.T)
```

### <a id="TestTransportNoReuseAfterEarlyResponse" href="#TestTransportNoReuseAfterEarlyResponse">func TestTransportNoReuseAfterEarlyResponse(t *testing.T)</a>

```
searchKey: http_test.TestTransportNoReuseAfterEarlyResponse
tags: [method private test]
```

```Go
func TestTransportNoReuseAfterEarlyResponse(t *testing.T)
```

Verifies that the Transport doesn't reuse a connection in the case where the server replies before the request has been fully written. We still honor that reply (see TestIssue3595), but don't send future requests on the connection because it's then in a questionable state. golang.org/issue/7569 

### <a id="TestTransportPersistConnContextLeakMaxConnsPerHost" href="#TestTransportPersistConnContextLeakMaxConnsPerHost">func TestTransportPersistConnContextLeakMaxConnsPerHost(t *testing.T)</a>

```
searchKey: http_test.TestTransportPersistConnContextLeakMaxConnsPerHost
tags: [method private test]
```

```Go
func TestTransportPersistConnContextLeakMaxConnsPerHost(t *testing.T)
```

### <a id="TestTransportPersistConnLeak" href="#TestTransportPersistConnLeak">func TestTransportPersistConnLeak(t *testing.T)</a>

```
searchKey: http_test.TestTransportPersistConnLeak
tags: [method private test]
```

```Go
func TestTransportPersistConnLeak(t *testing.T)
```

tests that persistent goroutine connections shut down when no longer desired. 

### <a id="TestTransportPersistConnLeakNeverIdle" href="#TestTransportPersistConnLeakNeverIdle">func TestTransportPersistConnLeakNeverIdle(t *testing.T)</a>

```
searchKey: http_test.TestTransportPersistConnLeakNeverIdle
tags: [method private test]
```

```Go
func TestTransportPersistConnLeakNeverIdle(t *testing.T)
```

### <a id="TestTransportPersistConnLeakShortBody" href="#TestTransportPersistConnLeakShortBody">func TestTransportPersistConnLeakShortBody(t *testing.T)</a>

```
searchKey: http_test.TestTransportPersistConnLeakShortBody
tags: [method private test]
```

```Go
func TestTransportPersistConnLeakShortBody(t *testing.T)
```

golang.org/issue/4531: Transport leaks goroutines when request.ContentLength is explicitly short 

### <a id="TestTransportPrefersResponseOverWriteError" href="#TestTransportPrefersResponseOverWriteError">func TestTransportPrefersResponseOverWriteError(t *testing.T)</a>

```
searchKey: http_test.TestTransportPrefersResponseOverWriteError
tags: [method private test]
```

```Go
func TestTransportPrefersResponseOverWriteError(t *testing.T)
```

Issue 11745. 

### <a id="TestTransportProxy" href="#TestTransportProxy">func TestTransportProxy(t *testing.T)</a>

```
searchKey: http_test.TestTransportProxy
tags: [method private test]
```

```Go
func TestTransportProxy(t *testing.T)
```

### <a id="TestTransportProxyConnectHeader" href="#TestTransportProxyConnectHeader">func TestTransportProxyConnectHeader(t *testing.T)</a>

```
searchKey: http_test.TestTransportProxyConnectHeader
tags: [method private test]
```

```Go
func TestTransportProxyConnectHeader(t *testing.T)
```

Issue 13290: send User-Agent in proxy CONNECT 

### <a id="TestTransportProxyDialDoesNotMutateProxyConnectHeader" href="#TestTransportProxyDialDoesNotMutateProxyConnectHeader">func TestTransportProxyDialDoesNotMutateProxyConnectHeader(t *testing.T)</a>

```
searchKey: http_test.TestTransportProxyDialDoesNotMutateProxyConnectHeader
tags: [method private test]
```

```Go
func TestTransportProxyDialDoesNotMutateProxyConnectHeader(t *testing.T)
```

Issue 36431: calls to RoundTrip should not mutate t.ProxyConnectHeader. 

(A bug caused dialConn to instead write the per-request Proxy-Authorization header through to the shared Header instance, introducing a data race.) 

### <a id="TestTransportProxyGetConnectHeader" href="#TestTransportProxyGetConnectHeader">func TestTransportProxyGetConnectHeader(t *testing.T)</a>

```
searchKey: http_test.TestTransportProxyGetConnectHeader
tags: [method private test]
```

```Go
func TestTransportProxyGetConnectHeader(t *testing.T)
```

### <a id="TestTransportProxyHTTPSConnectLeak" href="#TestTransportProxyHTTPSConnectLeak">func TestTransportProxyHTTPSConnectLeak(t *testing.T)</a>

```
searchKey: http_test.TestTransportProxyHTTPSConnectLeak
tags: [method private test]
```

```Go
func TestTransportProxyHTTPSConnectLeak(t *testing.T)
```

Issue 28012: verify that the Transport closes its TCP connection to http proxies when they're slow to reply to HTTPS CONNECT responses. 

### <a id="TestTransportRangeAndGzip" href="#TestTransportRangeAndGzip">func TestTransportRangeAndGzip(t *testing.T)</a>

```
searchKey: http_test.TestTransportRangeAndGzip
tags: [method private test]
```

```Go
func TestTransportRangeAndGzip(t *testing.T)
```

This tests that a client requesting a content range won't also implicitly ask for gzip support. If they want that, they need to do it on their own. golang.org/issue/8923 

### <a id="TestTransportReadToEndReusesConn" href="#TestTransportReadToEndReusesConn">func TestTransportReadToEndReusesConn(t *testing.T)</a>

```
searchKey: http_test.TestTransportReadToEndReusesConn
tags: [method private test]
```

```Go
func TestTransportReadToEndReusesConn(t *testing.T)
```

Tests that the HTTP transport re-uses connections when a client reads to the end of a response Body without closing it. 

### <a id="TestTransportReading100Continue" href="#TestTransportReading100Continue">func TestTransportReading100Continue(t *testing.T)</a>

```
searchKey: http_test.TestTransportReading100Continue
tags: [method private test]
```

```Go
func TestTransportReading100Continue(t *testing.T)
```

Issue 2184 

### <a id="TestTransportRejectsAlphaPort" href="#TestTransportRejectsAlphaPort">func TestTransportRejectsAlphaPort(t *testing.T)</a>

```
searchKey: http_test.TestTransportRejectsAlphaPort
tags: [method private test]
```

```Go
func TestTransportRejectsAlphaPort(t *testing.T)
```

Issue 14353: port can only contain digits. 

### <a id="TestTransportRejectsInvalidHeaders_h1" href="#TestTransportRejectsInvalidHeaders_h1">func TestTransportRejectsInvalidHeaders_h1(t *testing.T)</a>

```
searchKey: http_test.TestTransportRejectsInvalidHeaders_h1
tags: [method private test]
```

```Go
func TestTransportRejectsInvalidHeaders_h1(t *testing.T)
```

### <a id="TestTransportRejectsInvalidHeaders_h2" href="#TestTransportRejectsInvalidHeaders_h2">func TestTransportRejectsInvalidHeaders_h2(t *testing.T)</a>

```
searchKey: http_test.TestTransportRejectsInvalidHeaders_h2
tags: [method private test]
```

```Go
func TestTransportRejectsInvalidHeaders_h2(t *testing.T)
```

### <a id="TestTransportRejectsSignInContentLength" href="#TestTransportRejectsSignInContentLength">func TestTransportRejectsSignInContentLength(t *testing.T)</a>

```
searchKey: http_test.TestTransportRejectsSignInContentLength
tags: [method private test]
```

```Go
func TestTransportRejectsSignInContentLength(t *testing.T)
```

Issue 39017. Ensure that HTTP/1 transports reject Content-Length headers that contain a sign (eg. "+3"), per RFC 2616, Section 14.13. 

### <a id="TestTransportRemovesDeadIdleConnections" href="#TestTransportRemovesDeadIdleConnections">func TestTransportRemovesDeadIdleConnections(t *testing.T)</a>

```
searchKey: http_test.TestTransportRemovesDeadIdleConnections
tags: [method private test]
```

```Go
func TestTransportRemovesDeadIdleConnections(t *testing.T)
```

### <a id="TestTransportRemovesH2ConnsAfterIdle" href="#TestTransportRemovesH2ConnsAfterIdle">func TestTransportRemovesH2ConnsAfterIdle(t *testing.T)</a>

```
searchKey: http_test.TestTransportRemovesH2ConnsAfterIdle
tags: [method private test]
```

```Go
func TestTransportRemovesH2ConnsAfterIdle(t *testing.T)
```

### <a id="TestTransportRequestReplayable" href="#TestTransportRequestReplayable">func TestTransportRequestReplayable(t *testing.T)</a>

```
searchKey: http_test.TestTransportRequestReplayable
tags: [method private test]
```

```Go
func TestTransportRequestReplayable(t *testing.T)
```

### <a id="TestTransportRequestWriteRoundTrip" href="#TestTransportRequestWriteRoundTrip">func TestTransportRequestWriteRoundTrip(t *testing.T)</a>

```
searchKey: http_test.TestTransportRequestWriteRoundTrip
tags: [method private test]
```

```Go
func TestTransportRequestWriteRoundTrip(t *testing.T)
```

### <a id="TestTransportRespectRequestWantsClose" href="#TestTransportRespectRequestWantsClose">func TestTransportRespectRequestWantsClose(t *testing.T)</a>

```
searchKey: http_test.TestTransportRespectRequestWantsClose
tags: [method private test]
```

```Go
func TestTransportRespectRequestWantsClose(t *testing.T)
```

Test that Transport only sends one "Connection: close", regardless of how "close" was indicated. 

### <a id="TestTransportResponseBodyWritableOnProtocolSwitch" href="#TestTransportResponseBodyWritableOnProtocolSwitch">func TestTransportResponseBodyWritableOnProtocolSwitch(t *testing.T)</a>

```
searchKey: http_test.TestTransportResponseBodyWritableOnProtocolSwitch
tags: [method private test]
```

```Go
func TestTransportResponseBodyWritableOnProtocolSwitch(t *testing.T)
```

### <a id="TestTransportResponseCancelRace" href="#TestTransportResponseCancelRace">func TestTransportResponseCancelRace(t *testing.T)</a>

```
searchKey: http_test.TestTransportResponseCancelRace
tags: [method private test]
```

```Go
func TestTransportResponseCancelRace(t *testing.T)
```

Test for issue 10474 

### <a id="TestTransportResponseHeaderLength" href="#TestTransportResponseHeaderLength">func TestTransportResponseHeaderLength(t *testing.T)</a>

```
searchKey: http_test.TestTransportResponseHeaderLength
tags: [method private test]
```

```Go
func TestTransportResponseHeaderLength(t *testing.T)
```

### <a id="TestTransportResponseHeaderTimeout" href="#TestTransportResponseHeaderTimeout">func TestTransportResponseHeaderTimeout(t *testing.T)</a>

```
searchKey: http_test.TestTransportResponseHeaderTimeout
tags: [method private test]
```

```Go
func TestTransportResponseHeaderTimeout(t *testing.T)
```

### <a id="TestTransportReturnsPeekError" href="#TestTransportReturnsPeekError">func TestTransportReturnsPeekError(t *testing.T)</a>

```
searchKey: http_test.TestTransportReturnsPeekError
tags: [method private test]
```

```Go
func TestTransportReturnsPeekError(t *testing.T)
```

Issue 16465: Transport.RoundTrip should return the raw net.Conn.Read error from Peek back to the caller. 

### <a id="TestTransportReuseConnEmptyResponseBody" href="#TestTransportReuseConnEmptyResponseBody">func TestTransportReuseConnEmptyResponseBody(t *testing.T)</a>

```
searchKey: http_test.TestTransportReuseConnEmptyResponseBody
tags: [method private test]
```

```Go
func TestTransportReuseConnEmptyResponseBody(t *testing.T)
```

Issue 13633: there was a race where we returned bodyless responses to callers before recycling the persistent connection, which meant a client doing two subsequent requests could end up on different connections. It's somewhat harmless but enough tests assume it's not true in order to test other things that it's worth fixing. Plus it's nice to be consistent and not have timing-dependent behavior. 

### <a id="TestTransportReuseConnection_Gzip_Chunked" href="#TestTransportReuseConnection_Gzip_Chunked">func TestTransportReuseConnection_Gzip_Chunked(t *testing.T)</a>

```
searchKey: http_test.TestTransportReuseConnection_Gzip_Chunked
tags: [method private test]
```

```Go
func TestTransportReuseConnection_Gzip_Chunked(t *testing.T)
```

### <a id="TestTransportReuseConnection_Gzip_ContentLength" href="#TestTransportReuseConnection_Gzip_ContentLength">func TestTransportReuseConnection_Gzip_ContentLength(t *testing.T)</a>

```
searchKey: http_test.TestTransportReuseConnection_Gzip_ContentLength
tags: [method private test]
```

```Go
func TestTransportReuseConnection_Gzip_ContentLength(t *testing.T)
```

### <a id="TestTransportServerClosingUnexpectedly" href="#TestTransportServerClosingUnexpectedly">func TestTransportServerClosingUnexpectedly(t *testing.T)</a>

```
searchKey: http_test.TestTransportServerClosingUnexpectedly
tags: [method private test]
```

```Go
func TestTransportServerClosingUnexpectedly(t *testing.T)
```

Test that the Transport notices when a server hangs up on its unexpectedly (a keep-alive connection is closed). 

### <a id="TestTransportSocketLateBinding" href="#TestTransportSocketLateBinding">func TestTransportSocketLateBinding(t *testing.T)</a>

```
searchKey: http_test.TestTransportSocketLateBinding
tags: [method private test]
```

```Go
func TestTransportSocketLateBinding(t *testing.T)
```

### <a id="TestTransportTLSHandshakeTimeout" href="#TestTransportTLSHandshakeTimeout">func TestTransportTLSHandshakeTimeout(t *testing.T)</a>

```
searchKey: http_test.TestTransportTLSHandshakeTimeout
tags: [method private test]
```

```Go
func TestTransportTLSHandshakeTimeout(t *testing.T)
```

### <a id="TestTransportTraceGotConnH2IdleConns" href="#TestTransportTraceGotConnH2IdleConns">func TestTransportTraceGotConnH2IdleConns(t *testing.T)</a>

```
searchKey: http_test.TestTransportTraceGotConnH2IdleConns
tags: [method private test]
```

```Go
func TestTransportTraceGotConnH2IdleConns(t *testing.T)
```

Test for issue 34282 Ensure that getConn doesn't call the GotConn trace hook on a HTTP/2 idle conn 

### <a id="TestTransportTreat101Terminal" href="#TestTransportTreat101Terminal">func TestTransportTreat101Terminal(t *testing.T)</a>

```
searchKey: http_test.TestTransportTreat101Terminal
tags: [method private test]
```

```Go
func TestTransportTreat101Terminal(t *testing.T)
```

Issue 26161: the HTTP client must treat 101 responses as the final response. 

### <a id="TestTransportUserAgent_h1" href="#TestTransportUserAgent_h1">func TestTransportUserAgent_h1(t *testing.T)</a>

```
searchKey: http_test.TestTransportUserAgent_h1
tags: [method private test]
```

```Go
func TestTransportUserAgent_h1(t *testing.T)
```

### <a id="TestTransportUserAgent_h2" href="#TestTransportUserAgent_h2">func TestTransportUserAgent_h2(t *testing.T)</a>

```
searchKey: http_test.TestTransportUserAgent_h2
tags: [method private test]
```

```Go
func TestTransportUserAgent_h2(t *testing.T)
```

### <a id="TestTransportUsesTLSConfigServerName" href="#TestTransportUsesTLSConfigServerName">func TestTransportUsesTLSConfigServerName(t *testing.T)</a>

```
searchKey: http_test.TestTransportUsesTLSConfigServerName
tags: [method private test]
```

```Go
func TestTransportUsesTLSConfigServerName(t *testing.T)
```

Test for golang.org/issue/5829; the Transport should respect TLSClientConfig.ServerName when not empty. 

tls.Config.ServerName (non-empty, set to "example.com") takes precedence over "some-other-host.tld" which previously incorrectly took precedence. We don't actually connect to (or even resolve) "some-other-host.tld", though, because of the Transport.Dial hook. 

The httptest.Server has a cert with "example.com" as its name. 

### <a id="TestUnsupportedTransferEncodingsReturn501" href="#TestUnsupportedTransferEncodingsReturn501">func TestUnsupportedTransferEncodingsReturn501(t *testing.T)</a>

```
searchKey: http_test.TestUnsupportedTransferEncodingsReturn501
tags: [method private test]
```

```Go
func TestUnsupportedTransferEncodingsReturn501(t *testing.T)
```

Issue 30710: ensure that as per the spec, a server responds with 501 Not Implemented for unsupported transfer-encodings. 

### <a id="TestWithContextDeepCopiesURL" href="#TestWithContextDeepCopiesURL">func TestWithContextDeepCopiesURL(t *testing.T)</a>

```
searchKey: http_test.TestWithContextDeepCopiesURL
tags: [method private test]
```

```Go
func TestWithContextDeepCopiesURL(t *testing.T)
```

### <a id="TestWriteAfterHijack" href="#TestWriteAfterHijack">func TestWriteAfterHijack(t *testing.T)</a>

```
searchKey: http_test.TestWriteAfterHijack
tags: [method private test]
```

```Go
func TestWriteAfterHijack(t *testing.T)
```

### <a id="TestWriteHeader0_h1" href="#TestWriteHeader0_h1">func TestWriteHeader0_h1(t *testing.T)</a>

```
searchKey: http_test.TestWriteHeader0_h1
tags: [method private test]
```

```Go
func TestWriteHeader0_h1(t *testing.T)
```

### <a id="TestWriteHeader0_h2" href="#TestWriteHeader0_h2">func TestWriteHeader0_h2(t *testing.T)</a>

```
searchKey: http_test.TestWriteHeader0_h2
tags: [method private test]
```

```Go
func TestWriteHeader0_h2(t *testing.T)
```

### <a id="TestWriteHeaderNoCodeCheck_h1" href="#TestWriteHeaderNoCodeCheck_h1">func TestWriteHeaderNoCodeCheck_h1(t *testing.T)</a>

```
searchKey: http_test.TestWriteHeaderNoCodeCheck_h1
tags: [method private test]
```

```Go
func TestWriteHeaderNoCodeCheck_h1(t *testing.T)
```

Issue 23010: don't be super strict checking WriteHeader's code if it's not even valid to call WriteHeader then anyway. 

### <a id="TestWriteHeaderNoCodeCheck_h1hijack" href="#TestWriteHeaderNoCodeCheck_h1hijack">func TestWriteHeaderNoCodeCheck_h1hijack(t *testing.T)</a>

```
searchKey: http_test.TestWriteHeaderNoCodeCheck_h1hijack
tags: [method private test]
```

```Go
func TestWriteHeaderNoCodeCheck_h1hijack(t *testing.T)
```

### <a id="TestWriteHeaderNoCodeCheck_h2" href="#TestWriteHeaderNoCodeCheck_h2">func TestWriteHeaderNoCodeCheck_h2(t *testing.T)</a>

```
searchKey: http_test.TestWriteHeaderNoCodeCheck_h2
tags: [method private test]
```

```Go
func TestWriteHeaderNoCodeCheck_h2(t *testing.T)
```

### <a id="TestZeroLengthPostAndResponse_h1" href="#TestZeroLengthPostAndResponse_h1">func TestZeroLengthPostAndResponse_h1(t *testing.T)</a>

```
searchKey: http_test.TestZeroLengthPostAndResponse_h1
tags: [method private test]
```

```Go
func TestZeroLengthPostAndResponse_h1(t *testing.T)
```

TestZeroLengthPostAndResponse exercises an optimization done by the Transport: when there is no body (either because the method doesn't permit a body, or an explicit Content-Length of zero is present), then the transport can re-use the connection immediately. But when it re-uses the connection, it typically closes the previous request's body, which is not optimal for zero-lengthed bodies, as the client would then see http.ErrBodyReadAfterClose and not 0, io.EOF. 

### <a id="TestZeroLengthPostAndResponse_h2" href="#TestZeroLengthPostAndResponse_h2">func TestZeroLengthPostAndResponse_h2(t *testing.T)</a>

```
searchKey: http_test.TestZeroLengthPostAndResponse_h2
tags: [method private test]
```

```Go
func TestZeroLengthPostAndResponse_h2(t *testing.T)
```

### <a id="Test_scanETag" href="#Test_scanETag">func Test_scanETag(t *testing.T)</a>

```
searchKey: http_test.Test_scanETag
tags: [method private test]
```

```Go
func Test_scanETag(t *testing.T)
```

### <a id="afterTest" href="#afterTest">func afterTest(t testing.TB)</a>

```
searchKey: http_test.afterTest
tags: [method private]
```

```Go
func afterTest(t testing.TB)
```

### <a id="benchmarkClientServerParallel" href="#benchmarkClientServerParallel">func benchmarkClientServerParallel(b *testing.B, parallelism int, useTLS bool)</a>

```
searchKey: http_test.benchmarkClientServerParallel
tags: [method private]
```

```Go
func benchmarkClientServerParallel(b *testing.B, parallelism int, useTLS bool)
```

### <a id="benchmarkFileAndServer" href="#benchmarkFileAndServer">func benchmarkFileAndServer(b *testing.B, n int64)</a>

```
searchKey: http_test.benchmarkFileAndServer
tags: [method private]
```

```Go
func benchmarkFileAndServer(b *testing.B, n int64)
```

### <a id="benchmarkHandler" href="#benchmarkHandler">func benchmarkHandler(b *testing.B, h Handler)</a>

```
searchKey: http_test.benchmarkHandler
tags: [method private]
```

```Go
func benchmarkHandler(b *testing.B, h Handler)
```

### <a id="benchmarkReadRequest" href="#benchmarkReadRequest">func benchmarkReadRequest(b *testing.B, request string)</a>

```
searchKey: http_test.benchmarkReadRequest
tags: [method private]
```

```Go
func benchmarkReadRequest(b *testing.B, request string)
```

### <a id="benchmarkServeMux" href="#benchmarkServeMux">func benchmarkServeMux(b *testing.B, runHandler bool)</a>

```
searchKey: http_test.benchmarkServeMux
tags: [method private]
```

```Go
func benchmarkServeMux(b *testing.B, runHandler bool)
```

### <a id="checkQueryStringHandler" href="#checkQueryStringHandler">func checkQueryStringHandler(w ResponseWriter, r *Request)</a>

```
searchKey: http_test.checkQueryStringHandler
tags: [method private]
```

```Go
func checkQueryStringHandler(w ResponseWriter, r *Request)
```

checkQueryStringHandler checks if r.URL.RawQuery has the same value as the URL excluding the scheme and the query string and sends 200 response code if it is, 500 otherwise. 

### <a id="containsDotFile" href="#containsDotFile">func containsDotFile(name string) bool</a>

```
searchKey: http_test.containsDotFile
tags: [method private]
```

```Go
func containsDotFile(name string) bool
```

containsDotFile reports whether name contains a path element starting with a period. The name is assumed to be a delimited by forward slashes, as guaranteed by the http.FileSystem interface. 

### <a id="doFetchCheckPanic" href="#doFetchCheckPanic">func doFetchCheckPanic(tr *Transport, req *Request) (res *Response, err error, panicked bool)</a>

```
searchKey: http_test.doFetchCheckPanic
tags: [method private]
```

```Go
func doFetchCheckPanic(tr *Transport, req *Request) (res *Response, err error, panicked bool)
```

### <a id="fetchWireResponse" href="#fetchWireResponse">func fetchWireResponse(host string, http1ReqBody []byte) ([]byte, error)</a>

```
searchKey: http_test.fetchWireResponse
tags: [method private]
```

```Go
func fetchWireResponse(host string, http1ReqBody []byte) ([]byte, error)
```

fetchWireResponse is a helper for dialing to host, sending http1ReqBody as the payload and retrieving the response as it was sent on the wire. 

### <a id="get" href="#get">func get(t *testing.T, c *Client, url string) string</a>

```
searchKey: http_test.get
tags: [method private]
```

```Go
func get(t *testing.T, c *Client, url string) string
```

### <a id="getBody" href="#getBody">func getBody(t *testing.T, testName string, req Request, client *Client) (*Response, []byte)</a>

```
searchKey: http_test.getBody
tags: [method private]
```

```Go
func getBody(t *testing.T, testName string, req Request, client *Client) (*Response, []byte)
```

### <a id="getNoBody" href="#getNoBody">func getNoBody(urlStr string) (*Response, error)</a>

```
searchKey: http_test.getNoBody
tags: [method private]
```

```Go
func getNoBody(urlStr string) (*Response, error)
```

getNoBody wraps Get but closes any Response.Body before returning the response. 

### <a id="goroutineLeaked" href="#goroutineLeaked">func goroutineLeaked() bool</a>

```
searchKey: http_test.goroutineLeaked
tags: [function private]
```

```Go
func goroutineLeaked() bool
```

Verify the other tests didn't leave any goroutines running. 

### <a id="h12requestContentLength" href="#h12requestContentLength">func h12requestContentLength(t *testing.T, bodyfn func() io.Reader, wantLen int64)</a>

```
searchKey: http_test.h12requestContentLength
tags: [method private]
```

```Go
func h12requestContentLength(t *testing.T, bodyfn func() io.Reader, wantLen int64)
```

### <a id="handleTLSProtocol09" href="#handleTLSProtocol09">func handleTLSProtocol09(srv *Server, conn *tls.Conn, h Handler)</a>

```
searchKey: http_test.handleTLSProtocol09
tags: [method private]
```

```Go
func handleTLSProtocol09(srv *Server, conn *tls.Conn, h Handler)
```

handleTLSProtocol09 implements the HTTP/0.9 protocol over TLS, for the TestNextProtoUpgrade test. 

### <a id="interestingGoroutines" href="#interestingGoroutines">func interestingGoroutines() (gs []string)</a>

```
searchKey: http_test.interestingGoroutines
tags: [function private]
```

```Go
func interestingGoroutines() (gs []string)
```

### <a id="matchReturnedCookies" href="#matchReturnedCookies">func matchReturnedCookies(t *testing.T, expected, given []*Cookie)</a>

```
searchKey: http_test.matchReturnedCookies
tags: [method private]
```

```Go
func matchReturnedCookies(t *testing.T, expected, given []*Cookie)
```

### <a id="mostlyCopy" href="#mostlyCopy">func mostlyCopy(r *Response) *Response</a>

```
searchKey: http_test.mostlyCopy
tags: [method private]
```

```Go
func mostlyCopy(r *Response) *Response
```

### <a id="mustRemoveAll" href="#mustRemoveAll">func mustRemoveAll(dir string)</a>

```
searchKey: http_test.mustRemoveAll
tags: [method private]
```

```Go
func mustRemoveAll(dir string)
```

### <a id="mustStat" href="#mustStat">func mustStat(t *testing.T, fileName string) fs.FileInfo</a>

```
searchKey: http_test.mustStat
tags: [method private]
```

```Go
func mustStat(t *testing.T, fileName string) fs.FileInfo
```

### <a id="newLocalListener" href="#newLocalListener">func newLocalListener(t *testing.T) net.Listener</a>

```
searchKey: http_test.newLocalListener
tags: [method private]
```

```Go
func newLocalListener(t *testing.T) net.Listener
```

### <a id="newPeopleHandler" href="#newPeopleHandler">func newPeopleHandler() http.Handler</a>

```
searchKey: http_test.newPeopleHandler
tags: [function private]
```

```Go
func newPeopleHandler() http.Handler
```

### <a id="newTestMultipartRequest" href="#newTestMultipartRequest">func newTestMultipartRequest(t *testing.T) *Request</a>

```
searchKey: http_test.newTestMultipartRequest
tags: [method private]
```

```Go
func newTestMultipartRequest(t *testing.T) *Request
```

### <a id="optWithServerLog" href="#optWithServerLog">func optWithServerLog(lg *log.Logger) func(*httptest.Server)</a>

```
searchKey: http_test.optWithServerLog
tags: [method private]
```

```Go
func optWithServerLog(lg *log.Logger) func(*httptest.Server)
```

### <a id="pedanticReadAll" href="#pedanticReadAll">func pedanticReadAll(r io.Reader) (b []byte, err error)</a>

```
searchKey: http_test.pedanticReadAll
tags: [method private]
```

```Go
func pedanticReadAll(r io.Reader) (b []byte, err error)
```

pedanticReadAll works like io.ReadAll but additionally verifies that r obeys the documented io.Reader contract. 

### <a id="removeCommonLines" href="#removeCommonLines">func removeCommonLines(a, b string) (asuffix, bsuffix string, commonLines int)</a>

```
searchKey: http_test.removeCommonLines
tags: [method private]
```

```Go
func removeCommonLines(a, b string) (asuffix, bsuffix string, commonLines int)
```

### <a id="reqBytes" href="#reqBytes">func reqBytes(req string) []byte</a>

```
searchKey: http_test.reqBytes
tags: [method private]
```

```Go
func reqBytes(req string) []byte
```

reqBytes treats req as a request (with \n delimiters) and returns it with \r\n delimiters, ending in \r\n\r\n 

### <a id="runFileAndServerBenchmarks" href="#runFileAndServerBenchmarks">func runFileAndServerBenchmarks(b *testing.B, tlsOption bool, f *os.File, n int64)</a>

```
searchKey: http_test.runFileAndServerBenchmarks
tags: [method private]
```

```Go
func runFileAndServerBenchmarks(b *testing.B, tlsOption bool, f *os.File, n int64)
```

### <a id="runTimeSensitiveTest" href="#runTimeSensitiveTest">func runTimeSensitiveTest(t *testing.T, durations []time.Duration, test func(t *testing.T, d time.Duration) error)</a>

```
searchKey: http_test.runTimeSensitiveTest
tags: [method private]
```

```Go
func runTimeSensitiveTest(t *testing.T, durations []time.Duration, test func(t *testing.T, d time.Duration) error)
```

runTimeSensitiveTest runs test with the provided durations until one passes. If they all fail, t.Fatal is called with the last one's duration and error value. 

### <a id="runningBenchmarks" href="#runningBenchmarks">func runningBenchmarks() bool</a>

```
searchKey: http_test.runningBenchmarks
tags: [function private]
```

```Go
func runningBenchmarks() bool
```

### <a id="send204" href="#send204">func send204(w ResponseWriter, r *Request)</a>

```
searchKey: http_test.send204
tags: [method private]
```

```Go
func send204(w ResponseWriter, r *Request)
```

### <a id="send304" href="#send304">func send304(w ResponseWriter, r *Request)</a>

```
searchKey: http_test.send304
tags: [method private]
```

```Go
func send304(w ResponseWriter, r *Request)
```

### <a id="serve" href="#serve">func serve(code int) HandlerFunc</a>

```
searchKey: http_test.serve
tags: [method private]
```

```Go
func serve(code int) HandlerFunc
```

serve returns a handler that sends a response with the given code. 

### <a id="setParallel" href="#setParallel">func setParallel(t *testing.T)</a>

```
searchKey: http_test.setParallel
tags: [method private]
```

```Go
func setParallel(t *testing.T)
```

setParallel marks t as a parallel test if we're in short mode (all.bash), but as a serial test otherwise. Using t.Parallel isn't compatible with the afterTest func in non-short mode. 

### <a id="skipIfDNSHijacked" href="#skipIfDNSHijacked">func skipIfDNSHijacked(t *testing.T)</a>

```
searchKey: http_test.skipIfDNSHijacked
tags: [method private]
```

```Go
func skipIfDNSHijacked(t *testing.T)
```

### <a id="test304Responses" href="#test304Responses">func test304Responses(t *testing.T, h2 bool)</a>

```
searchKey: http_test.test304Responses
tags: [method private]
```

```Go
func test304Responses(t *testing.T, h2 bool)
```

### <a id="testAutomaticHTTP2_ListenAndServe" href="#testAutomaticHTTP2_ListenAndServe">func testAutomaticHTTP2_ListenAndServe(t *testing.T, tlsConf *tls.Config)</a>

```
searchKey: http_test.testAutomaticHTTP2_ListenAndServe
tags: [method private]
```

```Go
func testAutomaticHTTP2_ListenAndServe(t *testing.T, tlsConf *tls.Config)
```

### <a id="testAutomaticHTTP2_Serve" href="#testAutomaticHTTP2_Serve">func testAutomaticHTTP2_Serve(t *testing.T, tlsConf *tls.Config, wantH2 bool)</a>

```
searchKey: http_test.testAutomaticHTTP2_Serve
tags: [method private]
```

```Go
func testAutomaticHTTP2_Serve(t *testing.T, tlsConf *tls.Config, wantH2 bool)
```

### <a id="testCancelRequestMidBody" href="#testCancelRequestMidBody">func testCancelRequestMidBody(t *testing.T, h2 bool)</a>

```
searchKey: http_test.testCancelRequestMidBody
tags: [method private]
```

```Go
func testCancelRequestMidBody(t *testing.T, h2 bool)
```

### <a id="testCancelRequestWithChannelBeforeDo" href="#testCancelRequestWithChannelBeforeDo">func testCancelRequestWithChannelBeforeDo(t *testing.T, withCtx bool)</a>

```
searchKey: http_test.testCancelRequestWithChannelBeforeDo
tags: [method private]
```

```Go
func testCancelRequestWithChannelBeforeDo(t *testing.T, withCtx bool)
```

### <a id="testCaseSensitiveMethod" href="#testCaseSensitiveMethod">func testCaseSensitiveMethod(t *testing.T, h2 bool)</a>

```
searchKey: http_test.testCaseSensitiveMethod
tags: [method private]
```

```Go
func testCaseSensitiveMethod(t *testing.T, h2 bool)
```

### <a id="testChunkedResponseHeaders" href="#testChunkedResponseHeaders">func testChunkedResponseHeaders(t *testing.T, h2 bool)</a>

```
searchKey: http_test.testChunkedResponseHeaders
tags: [method private]
```

```Go
func testChunkedResponseHeaders(t *testing.T, h2 bool)
```

### <a id="testClientDoCanceledVsTimeout" href="#testClientDoCanceledVsTimeout">func testClientDoCanceledVsTimeout(t *testing.T, h2 bool)</a>

```
searchKey: http_test.testClientDoCanceledVsTimeout
tags: [method private]
```

```Go
func testClientDoCanceledVsTimeout(t *testing.T, h2 bool)
```

Issue 33545: lock-in the behavior promised by Client.Do's docs about request cancellation vs timing out. 

### <a id="testClientHead" href="#testClientHead">func testClientHead(t *testing.T, h2 bool)</a>

```
searchKey: http_test.testClientHead
tags: [method private]
```

```Go
func testClientHead(t *testing.T, h2 bool)
```

### <a id="testClientHeadContentLength" href="#testClientHeadContentLength">func testClientHeadContentLength(t *testing.T, h2 bool)</a>

```
searchKey: http_test.testClientHeadContentLength
tags: [method private]
```

```Go
func testClientHeadContentLength(t *testing.T, h2 bool)
```

### <a id="testClientRedirectEatsBody" href="#testClientRedirectEatsBody">func testClientRedirectEatsBody(t *testing.T, h2 bool)</a>

```
searchKey: http_test.testClientRedirectEatsBody
tags: [method private]
```

```Go
func testClientRedirectEatsBody(t *testing.T, h2 bool)
```

### <a id="testClientTimeout" href="#testClientTimeout">func testClientTimeout(t *testing.T, h2 bool)</a>

```
searchKey: http_test.testClientTimeout
tags: [method private]
```

```Go
func testClientTimeout(t *testing.T, h2 bool)
```

### <a id="testClientTimeout_Headers" href="#testClientTimeout_Headers">func testClientTimeout_Headers(t *testing.T, h2 bool)</a>

```
searchKey: http_test.testClientTimeout_Headers
tags: [method private]
```

```Go
func testClientTimeout_Headers(t *testing.T, h2 bool)
```

Client.Timeout firing before getting to the body 

### <a id="testCloseIdleConnections" href="#testCloseIdleConnections">func testCloseIdleConnections(t *testing.T, h2 bool)</a>

```
searchKey: http_test.testCloseIdleConnections
tags: [method private]
```

```Go
func testCloseIdleConnections(t *testing.T, h2 bool)
```

### <a id="testConcurrentReadWriteReqBody" href="#testConcurrentReadWriteReqBody">func testConcurrentReadWriteReqBody(t *testing.T, h2 bool)</a>

```
searchKey: http_test.testConcurrentReadWriteReqBody
tags: [method private]
```

```Go
func testConcurrentReadWriteReqBody(t *testing.T, h2 bool)
```

### <a id="testConnectRequest" href="#testConnectRequest">func testConnectRequest(t *testing.T, h2 bool)</a>

```
searchKey: http_test.testConnectRequest
tags: [method private]
```

```Go
func testConnectRequest(t *testing.T, h2 bool)
```

### <a id="testContentEncodingNoSniffing" href="#testContentEncodingNoSniffing">func testContentEncodingNoSniffing(t *testing.T, h2 bool)</a>

```
searchKey: http_test.testContentEncodingNoSniffing
tags: [method private]
```

```Go
func testContentEncodingNoSniffing(t *testing.T, h2 bool)
```

Issue 31753: don't sniff when Content-Encoding is set 

### <a id="testContentTypeWithVariousSources" href="#testContentTypeWithVariousSources">func testContentTypeWithVariousSources(t *testing.T, h2 bool)</a>

```
searchKey: http_test.testContentTypeWithVariousSources
tags: [method private]
```

```Go
func testContentTypeWithVariousSources(t *testing.T, h2 bool)
```

### <a id="testH12_noBody" href="#testH12_noBody">func testH12_noBody(t *testing.T, status int)</a>

```
searchKey: http_test.testH12_noBody
tags: [method private]
```

```Go
func testH12_noBody(t *testing.T, status int)
```

### <a id="testHTTP2NoWriteDeadline" href="#testHTTP2NoWriteDeadline">func testHTTP2NoWriteDeadline(timeout time.Duration) error</a>

```
searchKey: http_test.testHTTP2NoWriteDeadline
tags: [method private]
```

```Go
func testHTTP2NoWriteDeadline(timeout time.Duration) error
```

### <a id="testHTTP2WriteDeadlineEnforcedPerStream" href="#testHTTP2WriteDeadlineEnforcedPerStream">func testHTTP2WriteDeadlineEnforcedPerStream(timeout time.Duration) error</a>

```
searchKey: http_test.testHTTP2WriteDeadlineEnforcedPerStream
tags: [method private]
```

```Go
func testHTTP2WriteDeadlineEnforcedPerStream(timeout time.Duration) error
```

### <a id="testHandlerBodyClose" href="#testHandlerBodyClose">func testHandlerBodyClose(t *testing.T, i int, tt handlerBodyCloseTest)</a>

```
searchKey: http_test.testHandlerBodyClose
tags: [method private]
```

```Go
func testHandlerBodyClose(t *testing.T, i int, tt handlerBodyCloseTest)
```

### <a id="testHandlerPanic" href="#testHandlerPanic">func testHandlerPanic(t *testing.T, withHijack, h2 bool, wrapper func(Handler) Handler, panicValue interface{})</a>

```
searchKey: http_test.testHandlerPanic
tags: [method private]
```

```Go
func testHandlerPanic(t *testing.T, withHijack, h2 bool, wrapper func(Handler) Handler, panicValue interface{})
```

### <a id="testHandlerSetsBodyNil" href="#testHandlerSetsBodyNil">func testHandlerSetsBodyNil(t *testing.T, h2 bool)</a>

```
searchKey: http_test.testHandlerSetsBodyNil
tags: [method private]
```

```Go
func testHandlerSetsBodyNil(t *testing.T, h2 bool)
```

### <a id="testHeadResponses" href="#testHeadResponses">func testHeadResponses(t *testing.T, h2 bool)</a>

```
searchKey: http_test.testHeadResponses
tags: [method private]
```

```Go
func testHeadResponses(t *testing.T, h2 bool)
```

### <a id="testInterruptWithPanic" href="#testInterruptWithPanic">func testInterruptWithPanic(t *testing.T, h2 bool, panicValue interface{})</a>

```
searchKey: http_test.testInterruptWithPanic
tags: [method private]
```

```Go
func testInterruptWithPanic(t *testing.T, h2 bool, panicValue interface{})
```

### <a id="testMissingFile" href="#testMissingFile">func testMissingFile(t *testing.T, req *Request)</a>

```
searchKey: http_test.testMissingFile
tags: [method private]
```

```Go
func testMissingFile(t *testing.T, req *Request)
```

### <a id="testMultipartFile" href="#testMultipartFile">func testMultipartFile(t *testing.T, req *Request, key, expectFilename, expectContent string) multipart.File</a>

```
searchKey: http_test.testMultipartFile
tags: [method private]
```

```Go
func testMultipartFile(t *testing.T, req *Request, key, expectFilename, expectContent string) multipart.File
```

### <a id="testNoPanicWithBasicAuth" href="#testNoPanicWithBasicAuth">func testNoPanicWithBasicAuth(t *testing.T, h2 bool)</a>

```
searchKey: http_test.testNoPanicWithBasicAuth
tags: [method private]
```

```Go
func testNoPanicWithBasicAuth(t *testing.T, h2 bool)
```

Issue 34878: verify we don't panic when including basic auth (Go 1.13 regression) 

### <a id="testNoSniffExpectRequestBody" href="#testNoSniffExpectRequestBody">func testNoSniffExpectRequestBody(t *testing.T, h2 bool)</a>

```
searchKey: http_test.testNoSniffExpectRequestBody
tags: [method private]
```

```Go
func testNoSniffExpectRequestBody(t *testing.T, h2 bool)
```

### <a id="testProxyForRequest" href="#testProxyForRequest">func testProxyForRequest(t *testing.T, tt proxyFromEnvTest, proxyForRequest func(req *Request) (*url.URL, error))</a>

```
searchKey: http_test.testProxyForRequest
tags: [method private]
```

```Go
func testProxyForRequest(t *testing.T, tt proxyFromEnvTest, proxyForRequest func(req *Request) (*url.URL, error))
```

### <a id="testQuerySemicolon" href="#testQuerySemicolon">func testQuerySemicolon(t *testing.T, query string, wantX string, allowSemicolons, expectWarning bool)</a>

```
searchKey: http_test.testQuerySemicolon
tags: [method private]
```

```Go
func testQuerySemicolon(t *testing.T, query string, wantX string, allowSemicolons, expectWarning bool)
```

### <a id="testRedirect" href="#testRedirect">func testRedirect(t *testing.T, h2 bool)</a>

```
searchKey: http_test.testRedirect
tags: [method private]
```

```Go
func testRedirect(t *testing.T, h2 bool)
```

### <a id="testRedirectsByMethod" href="#testRedirectsByMethod">func testRedirectsByMethod(t *testing.T, method string, table []redirectTest, want string)</a>

```
searchKey: http_test.testRedirectsByMethod
tags: [method private]
```

```Go
func testRedirectsByMethod(t *testing.T, method string, table []redirectTest, want string)
```

### <a id="testRequestBodyLimit" href="#testRequestBodyLimit">func testRequestBodyLimit(t *testing.T, h2 bool)</a>

```
searchKey: http_test.testRequestBodyLimit
tags: [method private]
```

```Go
func testRequestBodyLimit(t *testing.T, h2 bool)
```

### <a id="testRequestLimit" href="#testRequestLimit">func testRequestLimit(t *testing.T, h2 bool)</a>

```
searchKey: http_test.testRequestLimit
tags: [method private]
```

```Go
func testRequestLimit(t *testing.T, h2 bool)
```

### <a id="testResponseBodyReadAfterClose" href="#testResponseBodyReadAfterClose">func testResponseBodyReadAfterClose(t *testing.T, h2 bool)</a>

```
searchKey: http_test.testResponseBodyReadAfterClose
tags: [method private]
```

```Go
func testResponseBodyReadAfterClose(t *testing.T, h2 bool)
```

### <a id="testServeFileRejectsInvalidSuffixLengths" href="#testServeFileRejectsInvalidSuffixLengths">func testServeFileRejectsInvalidSuffixLengths(t *testing.T, h2 bool)</a>

```
searchKey: http_test.testServeFileRejectsInvalidSuffixLengths
tags: [method private]
```

```Go
func testServeFileRejectsInvalidSuffixLengths(t *testing.T, h2 bool)
```

### <a id="testServeFileWithContentEncoding" href="#testServeFileWithContentEncoding">func testServeFileWithContentEncoding(t *testing.T, h2 bool)</a>

```
searchKey: http_test.testServeFileWithContentEncoding
tags: [method private]
```

```Go
func testServeFileWithContentEncoding(t *testing.T, h2 bool)
```

### <a id="testServerContentType" href="#testServerContentType">func testServerContentType(t *testing.T, h2 bool)</a>

```
searchKey: http_test.testServerContentType
tags: [method private]
```

```Go
func testServerContentType(t *testing.T, h2 bool)
```

### <a id="testServerContext_LocalAddrContextKey" href="#testServerContext_LocalAddrContextKey">func testServerContext_LocalAddrContextKey(t *testing.T, h2 bool)</a>

```
searchKey: http_test.testServerContext_LocalAddrContextKey
tags: [method private]
```

```Go
func testServerContext_LocalAddrContextKey(t *testing.T, h2 bool)
```

### <a id="testServerContext_ServerContextKey" href="#testServerContext_ServerContextKey">func testServerContext_ServerContextKey(t *testing.T, h2 bool)</a>

```
searchKey: http_test.testServerContext_ServerContextKey
tags: [method private]
```

```Go
func testServerContext_ServerContextKey(t *testing.T, h2 bool)
```

### <a id="testServerEmptyBodyRace" href="#testServerEmptyBodyRace">func testServerEmptyBodyRace(t *testing.T, h2 bool)</a>

```
searchKey: http_test.testServerEmptyBodyRace
tags: [method private]
```

```Go
func testServerEmptyBodyRace(t *testing.T, h2 bool)
```

### <a id="testServerIssue5953" href="#testServerIssue5953">func testServerIssue5953(t *testing.T, h2 bool)</a>

```
searchKey: http_test.testServerIssue5953
tags: [method private]
```

```Go
func testServerIssue5953(t *testing.T, h2 bool)
```

### <a id="testServerKeepAlivesEnabled" href="#testServerKeepAlivesEnabled">func testServerKeepAlivesEnabled(t *testing.T, h2 bool)</a>

```
searchKey: http_test.testServerKeepAlivesEnabled
tags: [method private]
```

```Go
func testServerKeepAlivesEnabled(t *testing.T, h2 bool)
```

### <a id="testServerNoHeader" href="#testServerNoHeader">func testServerNoHeader(t *testing.T, h2 bool, header string)</a>

```
searchKey: http_test.testServerNoHeader
tags: [method private]
```

```Go
func testServerNoHeader(t *testing.T, h2 bool, header string)
```

### <a id="testServerReaderFromOrder" href="#testServerReaderFromOrder">func testServerReaderFromOrder(t *testing.T, h2 bool)</a>

```
searchKey: http_test.testServerReaderFromOrder
tags: [method private]
```

```Go
func testServerReaderFromOrder(t *testing.T, h2 bool)
```

### <a id="testServerRequestContextCancel_ServeHTTPDone" href="#testServerRequestContextCancel_ServeHTTPDone">func testServerRequestContextCancel_ServeHTTPDone(t *testing.T, h2 bool)</a>

```
searchKey: http_test.testServerRequestContextCancel_ServeHTTPDone
tags: [method private]
```

```Go
func testServerRequestContextCancel_ServeHTTPDone(t *testing.T, h2 bool)
```

### <a id="testServerShutdown" href="#testServerShutdown">func testServerShutdown(t *testing.T, h2 bool)</a>

```
searchKey: http_test.testServerShutdown
tags: [method private]
```

```Go
func testServerShutdown(t *testing.T, h2 bool)
```

### <a id="testServerTimeouts" href="#testServerTimeouts">func testServerTimeouts(timeout time.Duration) error</a>

```
searchKey: http_test.testServerTimeouts
tags: [method private]
```

```Go
func testServerTimeouts(timeout time.Duration) error
```

### <a id="testServerUndeclaredTrailers" href="#testServerUndeclaredTrailers">func testServerUndeclaredTrailers(t *testing.T, h2 bool)</a>

```
searchKey: http_test.testServerUndeclaredTrailers
tags: [method private]
```

```Go
func testServerUndeclaredTrailers(t *testing.T, h2 bool)
```

### <a id="testSetsRemoteAddr" href="#testSetsRemoteAddr">func testSetsRemoteAddr(t *testing.T, h2 bool)</a>

```
searchKey: http_test.testSetsRemoteAddr
tags: [method private]
```

```Go
func testSetsRemoteAddr(t *testing.T, h2 bool)
```

### <a id="testSniffWriteSize" href="#testSniffWriteSize">func testSniffWriteSize(t *testing.T, h2 bool)</a>

```
searchKey: http_test.testSniffWriteSize
tags: [method private]
```

```Go
func testSniffWriteSize(t *testing.T, h2 bool)
```

### <a id="testStarRequest" href="#testStarRequest">func testStarRequest(t *testing.T, method string, h2 bool)</a>

```
searchKey: http_test.testStarRequest
tags: [method private]
```

```Go
func testStarRequest(t *testing.T, method string, h2 bool)
```

### <a id="testStreamingGet" href="#testStreamingGet">func testStreamingGet(t *testing.T, h2 bool)</a>

```
searchKey: http_test.testStreamingGet
tags: [method private]
```

```Go
func testStreamingGet(t *testing.T, h2 bool)
```

### <a id="testTCPConnectionCloses" href="#testTCPConnectionCloses">func testTCPConnectionCloses(t *testing.T, req string, h Handler)</a>

```
searchKey: http_test.testTCPConnectionCloses
tags: [method private]
```

```Go
func testTCPConnectionCloses(t *testing.T, req string, h Handler)
```

### <a id="testTCPConnectionStaysOpen" href="#testTCPConnectionStaysOpen">func testTCPConnectionStaysOpen(t *testing.T, req string, handler Handler)</a>

```
searchKey: http_test.testTCPConnectionStaysOpen
tags: [method private]
```

```Go
func testTCPConnectionStaysOpen(t *testing.T, req string, handler Handler)
```

### <a id="testTimeoutHandler" href="#testTimeoutHandler">func testTimeoutHandler(t *testing.T, h2 bool)</a>

```
searchKey: http_test.testTimeoutHandler
tags: [method private]
```

```Go
func testTimeoutHandler(t *testing.T, h2 bool)
```

### <a id="testTrailersClientToServer" href="#testTrailersClientToServer">func testTrailersClientToServer(t *testing.T, h2 bool)</a>

```
searchKey: http_test.testTrailersClientToServer
tags: [method private]
```

```Go
func testTrailersClientToServer(t *testing.T, h2 bool)
```

### <a id="testTrailersServerToClient" href="#testTrailersServerToClient">func testTrailersServerToClient(t *testing.T, h2, flush bool)</a>

```
searchKey: http_test.testTrailersServerToClient
tags: [method private]
```

```Go
func testTrailersServerToClient(t *testing.T, h2, flush bool)
```

### <a id="testTransportAndServerSharedBodyRace" href="#testTransportAndServerSharedBodyRace">func testTransportAndServerSharedBodyRace(t *testing.T, h2 bool)</a>

```
searchKey: http_test.testTransportAndServerSharedBodyRace
tags: [method private]
```

```Go
func testTransportAndServerSharedBodyRace(t *testing.T, h2 bool)
```

### <a id="testTransportAutoHTTP" href="#testTransportAutoHTTP">func testTransportAutoHTTP(t *testing.T, tr *Transport, wantH2 bool)</a>

```
searchKey: http_test.testTransportAutoHTTP
tags: [method private]
```

```Go
func testTransportAutoHTTP(t *testing.T, tr *Transport, wantH2 bool)
```

### <a id="testTransportCancelRequestInDo" href="#testTransportCancelRequestInDo">func testTransportCancelRequestInDo(t *testing.T, body io.Reader)</a>

```
searchKey: http_test.testTransportCancelRequestInDo
tags: [method private]
```

```Go
func testTransportCancelRequestInDo(t *testing.T, body io.Reader)
```

### <a id="testTransportEventTrace" href="#testTransportEventTrace">func testTransportEventTrace(t *testing.T, h2 bool, noHooks bool)</a>

```
searchKey: http_test.testTransportEventTrace
tags: [method private]
```

```Go
func testTransportEventTrace(t *testing.T, h2 bool, noHooks bool)
```

### <a id="testTransportGCRequest" href="#testTransportGCRequest">func testTransportGCRequest(t *testing.T, h2, body bool)</a>

```
searchKey: http_test.testTransportGCRequest
tags: [method private]
```

```Go
func testTransportGCRequest(t *testing.T, h2, body bool)
```

### <a id="testTransportIDNA" href="#testTransportIDNA">func testTransportIDNA(t *testing.T, h2 bool)</a>

```
searchKey: http_test.testTransportIDNA
tags: [method private]
```

```Go
func testTransportIDNA(t *testing.T, h2 bool)
```

### <a id="testTransportIdleConnTimeout" href="#testTransportIdleConnTimeout">func testTransportIdleConnTimeout(t *testing.T, h2 bool)</a>

```
searchKey: http_test.testTransportIdleConnTimeout
tags: [method private]
```

```Go
func testTransportIdleConnTimeout(t *testing.T, h2 bool)
```

### <a id="testTransportRace" href="#testTransportRace">func testTransportRace(req *Request)</a>

```
searchKey: http_test.testTransportRace
tags: [method private]
```

```Go
func testTransportRace(req *Request)
```

### <a id="testTransportRejectsInvalidHeaders" href="#testTransportRejectsInvalidHeaders">func testTransportRejectsInvalidHeaders(t *testing.T, h2 bool)</a>

```
searchKey: http_test.testTransportRejectsInvalidHeaders
tags: [method private]
```

```Go
func testTransportRejectsInvalidHeaders(t *testing.T, h2 bool)
```

### <a id="testTransportReuseConnection_Gzip" href="#testTransportReuseConnection_Gzip">func testTransportReuseConnection_Gzip(t *testing.T, chunked bool)</a>

```
searchKey: http_test.testTransportReuseConnection_Gzip
tags: [method private]
```

```Go
func testTransportReuseConnection_Gzip(t *testing.T, chunked bool)
```

Make sure we re-use underlying TCP connection for gzipped responses too. 

### <a id="testTransportUserAgent" href="#testTransportUserAgent">func testTransportUserAgent(t *testing.T, h2 bool)</a>

```
searchKey: http_test.testTransportUserAgent
tags: [method private]
```

```Go
func testTransportUserAgent(t *testing.T, h2 bool)
```

### <a id="testWriteHeader0" href="#testWriteHeader0">func testWriteHeader0(t *testing.T, h2 bool)</a>

```
searchKey: http_test.testWriteHeader0
tags: [method private]
```

```Go
func testWriteHeader0(t *testing.T, h2 bool)
```

### <a id="testWriteHeaderAfterWrite" href="#testWriteHeaderAfterWrite">func testWriteHeaderAfterWrite(t *testing.T, h2, hijack bool)</a>

```
searchKey: http_test.testWriteHeaderAfterWrite
tags: [method private]
```

```Go
func testWriteHeaderAfterWrite(t *testing.T, h2, hijack bool)
```

### <a id="testZeroLengthPostAndResponse" href="#testZeroLengthPostAndResponse">func testZeroLengthPostAndResponse(t *testing.T, h2 bool)</a>

```
searchKey: http_test.testZeroLengthPostAndResponse
tags: [method private]
```

```Go
func testZeroLengthPostAndResponse(t *testing.T, h2 bool)
```

### <a id="tryTimeouts" href="#tryTimeouts">func tryTimeouts(t *testing.T, testFunc func(timeout time.Duration) error)</a>

```
searchKey: http_test.tryTimeouts
tags: [method private]
```

```Go
func tryTimeouts(t *testing.T, testFunc func(timeout time.Duration) error)
```

tryTimeouts runs testFunc with increasing timeouts. Test passes on first success, and fails if all timeouts fail. 

### <a id="validateTestMultipartContents" href="#validateTestMultipartContents">func validateTestMultipartContents(t *testing.T, req *Request, allMem bool)</a>

```
searchKey: http_test.validateTestMultipartContents
tags: [method private]
```

```Go
func validateTestMultipartContents(t *testing.T, req *Request, allMem bool)
```

### <a id="waitCondition" href="#waitCondition">func waitCondition(waitFor, checkEvery time.Duration, fn func() bool) bool</a>

```
searchKey: http_test.waitCondition
tags: [method private]
```

```Go
func waitCondition(waitFor, checkEvery time.Duration, fn func() bool) bool
```

waitCondition reports whether fn eventually returned true, checking immediately and then every checkEvery amount, until waitFor has elapsed, at which point it returns false. 

### <a id="waitErrCondition" href="#waitErrCondition">func waitErrCondition(waitFor, checkEvery time.Duration, fn func() error) error</a>

```
searchKey: http_test.waitErrCondition
tags: [method private]
```

```Go
func waitErrCondition(waitFor, checkEvery time.Duration, fn func() error) error
```

waitErrCondition is like waitCondition but with errors instead of bools. 

### <a id="waitNumGoroutine" href="#waitNumGoroutine">func waitNumGoroutine(nmax int) int</a>

```
searchKey: http_test.waitNumGoroutine
tags: [method private]
```

```Go
func waitNumGoroutine(nmax int) int
```

Wait until number of goroutines is no greater than nmax, or time out. 

### <a id="wantBody" href="#wantBody">func wantBody(res *Response, err error, want string) error</a>

```
searchKey: http_test.wantBody
tags: [method private]
```

```Go
func wantBody(res *Response, err error, want string) error
```

