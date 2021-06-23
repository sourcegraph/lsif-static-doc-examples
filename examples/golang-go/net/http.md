# Package http

Package http provides HTTP client and server implementations. 

Get, Head, Post, and PostForm make HTTP (or HTTPS) requests: 

```
resp, err := http.Get("[http://example.com/](http://example.com/)")
...
resp, err := http.Post("[http://example.com/upload](http://example.com/upload)", "image/jpeg", &buf)
...
resp, err := http.PostForm("[http://example.com/form](http://example.com/form)",
	url.Values{"key": {"Value"}, "id": {"123"}})

```
The client must close the response body when finished with it: 

```
resp, err := http.Get("[http://example.com/](http://example.com/)")
if err != nil {
	// handle error
}
defer resp.Body.Close()
body, err := io.ReadAll(resp.Body)
// ...

```
For control over HTTP client headers, redirect policy, and other settings, create a Client: 

```
client := &http.Client{
	CheckRedirect: redirectPolicyFunc,
}

resp, err := client.Get("[http://example.com](http://example.com)")
// ...

req, err := http.NewRequest("GET", "[http://example.com](http://example.com)", nil)
// ...
req.Header.Add("If-None-Match", `W/"wyzzy"`)
resp, err := client.Do(req)
// ...

```
For control over proxies, TLS configuration, keep-alives, compression, and other settings, create a Transport: 

```
tr := &http.Transport{
	MaxIdleConns:       10,
	IdleConnTimeout:    30 * time.Second,
	DisableCompression: true,
}
client := &http.Client{Transport: tr}
resp, err := client.Get("[https://example.com](https://example.com)")

```
Clients and Transports are safe for concurrent use by multiple goroutines and for efficiency should only be created once and re-used. 

ListenAndServe starts an HTTP server with a given address and handler. The handler is usually nil, which means to use DefaultServeMux. Handle and HandleFunc add handlers to DefaultServeMux: 

```
http.Handle("/foo", fooHandler)

http.HandleFunc("/bar", func(w http.ResponseWriter, r *http.Request) {
	fmt.Fprintf(w, "Hello, %q", html.EscapeString(r.URL.Path))
})

log.Fatal(http.ListenAndServe(":8080", nil))

```
More control over the server's behavior is available by creating a custom Server: 

```
s := &http.Server{
	Addr:           ":8080",
	Handler:        myHandler,
	ReadTimeout:    10 * time.Second,
	WriteTimeout:   10 * time.Second,
	MaxHeaderBytes: 1 << 20,
}
log.Fatal(s.ListenAndServe())

```
Starting with Go 1.6, the http package has transparent support for the HTTP/2 protocol when using HTTPS. Programs that must disable HTTP/2 can do so by setting Transport.TLSNextProto (for clients) or Server.TLSNextProto (for servers) to a non-nil, empty map. Alternatively, the following GODEBUG environment variables are currently supported: 

```
GODEBUG=http2client=0  # disable HTTP/2 client support
GODEBUG=http2server=0  # disable HTTP/2 server support
GODEBUG=http2debug=1   # enable verbose HTTP/2 debug logs
GODEBUG=http2debug=2   # ... even more verbose, with frame dumps

```
The GODEBUG variables are not covered by Go's API compatibility promise. Please report any issues before disabling HTTP/2 support: [https://golang.org/s/http2bug](https://golang.org/s/http2bug) 

The http package's Transport and Server both automatically enable HTTP/2 support for simple configurations. To enable HTTP/2 for more complex configurations, to use lower-level HTTP/2 features, or to use a newer version of Go's http2 package, import "golang.org/x/net/http2" directly and use its ConfigureTransport and/or ConfigureServer functions. Manually configuring HTTP/2 via the golang.org/x/net/http2 package takes precedence over the net/http package's built-in HTTP/2 support. 

## Index

* Subpages
  * [net/http/cgi](http/cgi.md)
  * [net/http/cookiejar](http/cookiejar.md)
  * [net/http/cookiejar_test](http/cookiejar_test.md)
  * [net/http/fcgi](http/fcgi.md)
  * [net/http/httptest](http/httptest.md)
  * [net/http/httptest_test](http/httptest_test.md)
  * [net/http/httptrace](http/httptrace.md)
  * [net/http/httptrace_test](http/httptrace_test.md)
  * [net/http/httputil](http/httputil.md)
  * [net/http/httputil_test](http/httputil_test.md)
  * [net/http/internal](http/internal.md)
  * [net/http/pprof](http/pprof.md)
* [Constants](#const)
    * [const SameSiteDefaultMode](#SameSiteDefaultMode)
    * [const SameSiteLaxMode](#SameSiteLaxMode)
    * [const SameSiteStrictMode](#SameSiteStrictMode)
    * [const SameSiteNoneMode](#SameSiteNoneMode)
    * [const condNone](#condNone)
    * [const condTrue](#condTrue)
    * [const condFalse](#condFalse)
    * [const http2cipher_TLS_NULL_WITH_NULL_NULL](#http2cipher_TLS_NULL_WITH_NULL_NULL)
    * [const http2cipher_TLS_RSA_WITH_NULL_MD5](#http2cipher_TLS_RSA_WITH_NULL_MD5)
    * [const http2cipher_TLS_RSA_WITH_NULL_SHA](#http2cipher_TLS_RSA_WITH_NULL_SHA)
    * [const http2cipher_TLS_RSA_EXPORT_WITH_RC4_40_MD5](#http2cipher_TLS_RSA_EXPORT_WITH_RC4_40_MD5)
    * [const http2cipher_TLS_RSA_WITH_RC4_128_MD5](#http2cipher_TLS_RSA_WITH_RC4_128_MD5)
    * [const http2cipher_TLS_RSA_WITH_RC4_128_SHA](#http2cipher_TLS_RSA_WITH_RC4_128_SHA)
    * [const http2cipher_TLS_RSA_EXPORT_WITH_RC2_CBC_40_MD5](#http2cipher_TLS_RSA_EXPORT_WITH_RC2_CBC_40_MD5)
    * [const http2cipher_TLS_RSA_WITH_IDEA_CBC_SHA](#http2cipher_TLS_RSA_WITH_IDEA_CBC_SHA)
    * [const http2cipher_TLS_RSA_EXPORT_WITH_DES40_CBC_SHA](#http2cipher_TLS_RSA_EXPORT_WITH_DES40_CBC_SHA)
    * [const http2cipher_TLS_RSA_WITH_DES_CBC_SHA](#http2cipher_TLS_RSA_WITH_DES_CBC_SHA)
    * [const http2cipher_TLS_RSA_WITH_3DES_EDE_CBC_SHA](#http2cipher_TLS_RSA_WITH_3DES_EDE_CBC_SHA)
    * [const http2cipher_TLS_DH_DSS_EXPORT_WITH_DES40_CBC_SHA](#http2cipher_TLS_DH_DSS_EXPORT_WITH_DES40_CBC_SHA)
    * [const http2cipher_TLS_DH_DSS_WITH_DES_CBC_SHA](#http2cipher_TLS_DH_DSS_WITH_DES_CBC_SHA)
    * [const http2cipher_TLS_DH_DSS_WITH_3DES_EDE_CBC_SHA](#http2cipher_TLS_DH_DSS_WITH_3DES_EDE_CBC_SHA)
    * [const http2cipher_TLS_DH_RSA_EXPORT_WITH_DES40_CBC_SHA](#http2cipher_TLS_DH_RSA_EXPORT_WITH_DES40_CBC_SHA)
    * [const http2cipher_TLS_DH_RSA_WITH_DES_CBC_SHA](#http2cipher_TLS_DH_RSA_WITH_DES_CBC_SHA)
    * [const http2cipher_TLS_DH_RSA_WITH_3DES_EDE_CBC_SHA](#http2cipher_TLS_DH_RSA_WITH_3DES_EDE_CBC_SHA)
    * [const http2cipher_TLS_DHE_DSS_EXPORT_WITH_DES40_CBC_SHA](#http2cipher_TLS_DHE_DSS_EXPORT_WITH_DES40_CBC_SHA)
    * [const http2cipher_TLS_DHE_DSS_WITH_DES_CBC_SHA](#http2cipher_TLS_DHE_DSS_WITH_DES_CBC_SHA)
    * [const http2cipher_TLS_DHE_DSS_WITH_3DES_EDE_CBC_SHA](#http2cipher_TLS_DHE_DSS_WITH_3DES_EDE_CBC_SHA)
    * [const http2cipher_TLS_DHE_RSA_EXPORT_WITH_DES40_CBC_SHA](#http2cipher_TLS_DHE_RSA_EXPORT_WITH_DES40_CBC_SHA)
    * [const http2cipher_TLS_DHE_RSA_WITH_DES_CBC_SHA](#http2cipher_TLS_DHE_RSA_WITH_DES_CBC_SHA)
    * [const http2cipher_TLS_DHE_RSA_WITH_3DES_EDE_CBC_SHA](#http2cipher_TLS_DHE_RSA_WITH_3DES_EDE_CBC_SHA)
    * [const http2cipher_TLS_DH_anon_EXPORT_WITH_RC4_40_MD5](#http2cipher_TLS_DH_anon_EXPORT_WITH_RC4_40_MD5)
    * [const http2cipher_TLS_DH_anon_WITH_RC4_128_MD5](#http2cipher_TLS_DH_anon_WITH_RC4_128_MD5)
    * [const http2cipher_TLS_DH_anon_EXPORT_WITH_DES40_CBC_SHA](#http2cipher_TLS_DH_anon_EXPORT_WITH_DES40_CBC_SHA)
    * [const http2cipher_TLS_DH_anon_WITH_DES_CBC_SHA](#http2cipher_TLS_DH_anon_WITH_DES_CBC_SHA)
    * [const http2cipher_TLS_DH_anon_WITH_3DES_EDE_CBC_SHA](#http2cipher_TLS_DH_anon_WITH_3DES_EDE_CBC_SHA)
    * [const http2cipher_TLS_KRB5_WITH_DES_CBC_SHA](#http2cipher_TLS_KRB5_WITH_DES_CBC_SHA)
    * [const http2cipher_TLS_KRB5_WITH_3DES_EDE_CBC_SHA](#http2cipher_TLS_KRB5_WITH_3DES_EDE_CBC_SHA)
    * [const http2cipher_TLS_KRB5_WITH_RC4_128_SHA](#http2cipher_TLS_KRB5_WITH_RC4_128_SHA)
    * [const http2cipher_TLS_KRB5_WITH_IDEA_CBC_SHA](#http2cipher_TLS_KRB5_WITH_IDEA_CBC_SHA)
    * [const http2cipher_TLS_KRB5_WITH_DES_CBC_MD5](#http2cipher_TLS_KRB5_WITH_DES_CBC_MD5)
    * [const http2cipher_TLS_KRB5_WITH_3DES_EDE_CBC_MD5](#http2cipher_TLS_KRB5_WITH_3DES_EDE_CBC_MD5)
    * [const http2cipher_TLS_KRB5_WITH_RC4_128_MD5](#http2cipher_TLS_KRB5_WITH_RC4_128_MD5)
    * [const http2cipher_TLS_KRB5_WITH_IDEA_CBC_MD5](#http2cipher_TLS_KRB5_WITH_IDEA_CBC_MD5)
    * [const http2cipher_TLS_KRB5_EXPORT_WITH_DES_CBC_40_SHA](#http2cipher_TLS_KRB5_EXPORT_WITH_DES_CBC_40_SHA)
    * [const http2cipher_TLS_KRB5_EXPORT_WITH_RC2_CBC_40_SHA](#http2cipher_TLS_KRB5_EXPORT_WITH_RC2_CBC_40_SHA)
    * [const http2cipher_TLS_KRB5_EXPORT_WITH_RC4_40_SHA](#http2cipher_TLS_KRB5_EXPORT_WITH_RC4_40_SHA)
    * [const http2cipher_TLS_KRB5_EXPORT_WITH_DES_CBC_40_MD5](#http2cipher_TLS_KRB5_EXPORT_WITH_DES_CBC_40_MD5)
    * [const http2cipher_TLS_KRB5_EXPORT_WITH_RC2_CBC_40_MD5](#http2cipher_TLS_KRB5_EXPORT_WITH_RC2_CBC_40_MD5)
    * [const http2cipher_TLS_KRB5_EXPORT_WITH_RC4_40_MD5](#http2cipher_TLS_KRB5_EXPORT_WITH_RC4_40_MD5)
    * [const http2cipher_TLS_PSK_WITH_NULL_SHA](#http2cipher_TLS_PSK_WITH_NULL_SHA)
    * [const http2cipher_TLS_DHE_PSK_WITH_NULL_SHA](#http2cipher_TLS_DHE_PSK_WITH_NULL_SHA)
    * [const http2cipher_TLS_RSA_PSK_WITH_NULL_SHA](#http2cipher_TLS_RSA_PSK_WITH_NULL_SHA)
    * [const http2cipher_TLS_RSA_WITH_AES_128_CBC_SHA](#http2cipher_TLS_RSA_WITH_AES_128_CBC_SHA)
    * [const http2cipher_TLS_DH_DSS_WITH_AES_128_CBC_SHA](#http2cipher_TLS_DH_DSS_WITH_AES_128_CBC_SHA)
    * [const http2cipher_TLS_DH_RSA_WITH_AES_128_CBC_SHA](#http2cipher_TLS_DH_RSA_WITH_AES_128_CBC_SHA)
    * [const http2cipher_TLS_DHE_DSS_WITH_AES_128_CBC_SHA](#http2cipher_TLS_DHE_DSS_WITH_AES_128_CBC_SHA)
    * [const http2cipher_TLS_DHE_RSA_WITH_AES_128_CBC_SHA](#http2cipher_TLS_DHE_RSA_WITH_AES_128_CBC_SHA)
    * [const http2cipher_TLS_DH_anon_WITH_AES_128_CBC_SHA](#http2cipher_TLS_DH_anon_WITH_AES_128_CBC_SHA)
    * [const http2cipher_TLS_RSA_WITH_AES_256_CBC_SHA](#http2cipher_TLS_RSA_WITH_AES_256_CBC_SHA)
    * [const http2cipher_TLS_DH_DSS_WITH_AES_256_CBC_SHA](#http2cipher_TLS_DH_DSS_WITH_AES_256_CBC_SHA)
    * [const http2cipher_TLS_DH_RSA_WITH_AES_256_CBC_SHA](#http2cipher_TLS_DH_RSA_WITH_AES_256_CBC_SHA)
    * [const http2cipher_TLS_DHE_DSS_WITH_AES_256_CBC_SHA](#http2cipher_TLS_DHE_DSS_WITH_AES_256_CBC_SHA)
    * [const http2cipher_TLS_DHE_RSA_WITH_AES_256_CBC_SHA](#http2cipher_TLS_DHE_RSA_WITH_AES_256_CBC_SHA)
    * [const http2cipher_TLS_DH_anon_WITH_AES_256_CBC_SHA](#http2cipher_TLS_DH_anon_WITH_AES_256_CBC_SHA)
    * [const http2cipher_TLS_RSA_WITH_NULL_SHA256](#http2cipher_TLS_RSA_WITH_NULL_SHA256)
    * [const http2cipher_TLS_RSA_WITH_AES_128_CBC_SHA256](#http2cipher_TLS_RSA_WITH_AES_128_CBC_SHA256)
    * [const http2cipher_TLS_RSA_WITH_AES_256_CBC_SHA256](#http2cipher_TLS_RSA_WITH_AES_256_CBC_SHA256)
    * [const http2cipher_TLS_DH_DSS_WITH_AES_128_CBC_SHA256](#http2cipher_TLS_DH_DSS_WITH_AES_128_CBC_SHA256)
    * [const http2cipher_TLS_DH_RSA_WITH_AES_128_CBC_SHA256](#http2cipher_TLS_DH_RSA_WITH_AES_128_CBC_SHA256)
    * [const http2cipher_TLS_DHE_DSS_WITH_AES_128_CBC_SHA256](#http2cipher_TLS_DHE_DSS_WITH_AES_128_CBC_SHA256)
    * [const http2cipher_TLS_RSA_WITH_CAMELLIA_128_CBC_SHA](#http2cipher_TLS_RSA_WITH_CAMELLIA_128_CBC_SHA)
    * [const http2cipher_TLS_DH_DSS_WITH_CAMELLIA_128_CBC_SHA](#http2cipher_TLS_DH_DSS_WITH_CAMELLIA_128_CBC_SHA)
    * [const http2cipher_TLS_DH_RSA_WITH_CAMELLIA_128_CBC_SHA](#http2cipher_TLS_DH_RSA_WITH_CAMELLIA_128_CBC_SHA)
    * [const http2cipher_TLS_DHE_DSS_WITH_CAMELLIA_128_CBC_SHA](#http2cipher_TLS_DHE_DSS_WITH_CAMELLIA_128_CBC_SHA)
    * [const http2cipher_TLS_DHE_RSA_WITH_CAMELLIA_128_CBC_SHA](#http2cipher_TLS_DHE_RSA_WITH_CAMELLIA_128_CBC_SHA)
    * [const http2cipher_TLS_DH_anon_WITH_CAMELLIA_128_CBC_SHA](#http2cipher_TLS_DH_anon_WITH_CAMELLIA_128_CBC_SHA)
    * [const http2cipher_TLS_DHE_RSA_WITH_AES_128_CBC_SHA256](#http2cipher_TLS_DHE_RSA_WITH_AES_128_CBC_SHA256)
    * [const http2cipher_TLS_DH_DSS_WITH_AES_256_CBC_SHA256](#http2cipher_TLS_DH_DSS_WITH_AES_256_CBC_SHA256)
    * [const http2cipher_TLS_DH_RSA_WITH_AES_256_CBC_SHA256](#http2cipher_TLS_DH_RSA_WITH_AES_256_CBC_SHA256)
    * [const http2cipher_TLS_DHE_DSS_WITH_AES_256_CBC_SHA256](#http2cipher_TLS_DHE_DSS_WITH_AES_256_CBC_SHA256)
    * [const http2cipher_TLS_DHE_RSA_WITH_AES_256_CBC_SHA256](#http2cipher_TLS_DHE_RSA_WITH_AES_256_CBC_SHA256)
    * [const http2cipher_TLS_DH_anon_WITH_AES_128_CBC_SHA256](#http2cipher_TLS_DH_anon_WITH_AES_128_CBC_SHA256)
    * [const http2cipher_TLS_DH_anon_WITH_AES_256_CBC_SHA256](#http2cipher_TLS_DH_anon_WITH_AES_256_CBC_SHA256)
    * [const http2cipher_TLS_RSA_WITH_CAMELLIA_256_CBC_SHA](#http2cipher_TLS_RSA_WITH_CAMELLIA_256_CBC_SHA)
    * [const http2cipher_TLS_DH_DSS_WITH_CAMELLIA_256_CBC_SHA](#http2cipher_TLS_DH_DSS_WITH_CAMELLIA_256_CBC_SHA)
    * [const http2cipher_TLS_DH_RSA_WITH_CAMELLIA_256_CBC_SHA](#http2cipher_TLS_DH_RSA_WITH_CAMELLIA_256_CBC_SHA)
    * [const http2cipher_TLS_DHE_DSS_WITH_CAMELLIA_256_CBC_SHA](#http2cipher_TLS_DHE_DSS_WITH_CAMELLIA_256_CBC_SHA)
    * [const http2cipher_TLS_DHE_RSA_WITH_CAMELLIA_256_CBC_SHA](#http2cipher_TLS_DHE_RSA_WITH_CAMELLIA_256_CBC_SHA)
    * [const http2cipher_TLS_DH_anon_WITH_CAMELLIA_256_CBC_SHA](#http2cipher_TLS_DH_anon_WITH_CAMELLIA_256_CBC_SHA)
    * [const http2cipher_TLS_PSK_WITH_RC4_128_SHA](#http2cipher_TLS_PSK_WITH_RC4_128_SHA)
    * [const http2cipher_TLS_PSK_WITH_3DES_EDE_CBC_SHA](#http2cipher_TLS_PSK_WITH_3DES_EDE_CBC_SHA)
    * [const http2cipher_TLS_PSK_WITH_AES_128_CBC_SHA](#http2cipher_TLS_PSK_WITH_AES_128_CBC_SHA)
    * [const http2cipher_TLS_PSK_WITH_AES_256_CBC_SHA](#http2cipher_TLS_PSK_WITH_AES_256_CBC_SHA)
    * [const http2cipher_TLS_DHE_PSK_WITH_RC4_128_SHA](#http2cipher_TLS_DHE_PSK_WITH_RC4_128_SHA)
    * [const http2cipher_TLS_DHE_PSK_WITH_3DES_EDE_CBC_SHA](#http2cipher_TLS_DHE_PSK_WITH_3DES_EDE_CBC_SHA)
    * [const http2cipher_TLS_DHE_PSK_WITH_AES_128_CBC_SHA](#http2cipher_TLS_DHE_PSK_WITH_AES_128_CBC_SHA)
    * [const http2cipher_TLS_DHE_PSK_WITH_AES_256_CBC_SHA](#http2cipher_TLS_DHE_PSK_WITH_AES_256_CBC_SHA)
    * [const http2cipher_TLS_RSA_PSK_WITH_RC4_128_SHA](#http2cipher_TLS_RSA_PSK_WITH_RC4_128_SHA)
    * [const http2cipher_TLS_RSA_PSK_WITH_3DES_EDE_CBC_SHA](#http2cipher_TLS_RSA_PSK_WITH_3DES_EDE_CBC_SHA)
    * [const http2cipher_TLS_RSA_PSK_WITH_AES_128_CBC_SHA](#http2cipher_TLS_RSA_PSK_WITH_AES_128_CBC_SHA)
    * [const http2cipher_TLS_RSA_PSK_WITH_AES_256_CBC_SHA](#http2cipher_TLS_RSA_PSK_WITH_AES_256_CBC_SHA)
    * [const http2cipher_TLS_RSA_WITH_SEED_CBC_SHA](#http2cipher_TLS_RSA_WITH_SEED_CBC_SHA)
    * [const http2cipher_TLS_DH_DSS_WITH_SEED_CBC_SHA](#http2cipher_TLS_DH_DSS_WITH_SEED_CBC_SHA)
    * [const http2cipher_TLS_DH_RSA_WITH_SEED_CBC_SHA](#http2cipher_TLS_DH_RSA_WITH_SEED_CBC_SHA)
    * [const http2cipher_TLS_DHE_DSS_WITH_SEED_CBC_SHA](#http2cipher_TLS_DHE_DSS_WITH_SEED_CBC_SHA)
    * [const http2cipher_TLS_DHE_RSA_WITH_SEED_CBC_SHA](#http2cipher_TLS_DHE_RSA_WITH_SEED_CBC_SHA)
    * [const http2cipher_TLS_DH_anon_WITH_SEED_CBC_SHA](#http2cipher_TLS_DH_anon_WITH_SEED_CBC_SHA)
    * [const http2cipher_TLS_RSA_WITH_AES_128_GCM_SHA256](#http2cipher_TLS_RSA_WITH_AES_128_GCM_SHA256)
    * [const http2cipher_TLS_RSA_WITH_AES_256_GCM_SHA384](#http2cipher_TLS_RSA_WITH_AES_256_GCM_SHA384)
    * [const http2cipher_TLS_DHE_RSA_WITH_AES_128_GCM_SHA256](#http2cipher_TLS_DHE_RSA_WITH_AES_128_GCM_SHA256)
    * [const http2cipher_TLS_DHE_RSA_WITH_AES_256_GCM_SHA384](#http2cipher_TLS_DHE_RSA_WITH_AES_256_GCM_SHA384)
    * [const http2cipher_TLS_DH_RSA_WITH_AES_128_GCM_SHA256](#http2cipher_TLS_DH_RSA_WITH_AES_128_GCM_SHA256)
    * [const http2cipher_TLS_DH_RSA_WITH_AES_256_GCM_SHA384](#http2cipher_TLS_DH_RSA_WITH_AES_256_GCM_SHA384)
    * [const http2cipher_TLS_DHE_DSS_WITH_AES_128_GCM_SHA256](#http2cipher_TLS_DHE_DSS_WITH_AES_128_GCM_SHA256)
    * [const http2cipher_TLS_DHE_DSS_WITH_AES_256_GCM_SHA384](#http2cipher_TLS_DHE_DSS_WITH_AES_256_GCM_SHA384)
    * [const http2cipher_TLS_DH_DSS_WITH_AES_128_GCM_SHA256](#http2cipher_TLS_DH_DSS_WITH_AES_128_GCM_SHA256)
    * [const http2cipher_TLS_DH_DSS_WITH_AES_256_GCM_SHA384](#http2cipher_TLS_DH_DSS_WITH_AES_256_GCM_SHA384)
    * [const http2cipher_TLS_DH_anon_WITH_AES_128_GCM_SHA256](#http2cipher_TLS_DH_anon_WITH_AES_128_GCM_SHA256)
    * [const http2cipher_TLS_DH_anon_WITH_AES_256_GCM_SHA384](#http2cipher_TLS_DH_anon_WITH_AES_256_GCM_SHA384)
    * [const http2cipher_TLS_PSK_WITH_AES_128_GCM_SHA256](#http2cipher_TLS_PSK_WITH_AES_128_GCM_SHA256)
    * [const http2cipher_TLS_PSK_WITH_AES_256_GCM_SHA384](#http2cipher_TLS_PSK_WITH_AES_256_GCM_SHA384)
    * [const http2cipher_TLS_DHE_PSK_WITH_AES_128_GCM_SHA256](#http2cipher_TLS_DHE_PSK_WITH_AES_128_GCM_SHA256)
    * [const http2cipher_TLS_DHE_PSK_WITH_AES_256_GCM_SHA384](#http2cipher_TLS_DHE_PSK_WITH_AES_256_GCM_SHA384)
    * [const http2cipher_TLS_RSA_PSK_WITH_AES_128_GCM_SHA256](#http2cipher_TLS_RSA_PSK_WITH_AES_128_GCM_SHA256)
    * [const http2cipher_TLS_RSA_PSK_WITH_AES_256_GCM_SHA384](#http2cipher_TLS_RSA_PSK_WITH_AES_256_GCM_SHA384)
    * [const http2cipher_TLS_PSK_WITH_AES_128_CBC_SHA256](#http2cipher_TLS_PSK_WITH_AES_128_CBC_SHA256)
    * [const http2cipher_TLS_PSK_WITH_AES_256_CBC_SHA384](#http2cipher_TLS_PSK_WITH_AES_256_CBC_SHA384)
    * [const http2cipher_TLS_PSK_WITH_NULL_SHA256](#http2cipher_TLS_PSK_WITH_NULL_SHA256)
    * [const http2cipher_TLS_PSK_WITH_NULL_SHA384](#http2cipher_TLS_PSK_WITH_NULL_SHA384)
    * [const http2cipher_TLS_DHE_PSK_WITH_AES_128_CBC_SHA256](#http2cipher_TLS_DHE_PSK_WITH_AES_128_CBC_SHA256)
    * [const http2cipher_TLS_DHE_PSK_WITH_AES_256_CBC_SHA384](#http2cipher_TLS_DHE_PSK_WITH_AES_256_CBC_SHA384)
    * [const http2cipher_TLS_DHE_PSK_WITH_NULL_SHA256](#http2cipher_TLS_DHE_PSK_WITH_NULL_SHA256)
    * [const http2cipher_TLS_DHE_PSK_WITH_NULL_SHA384](#http2cipher_TLS_DHE_PSK_WITH_NULL_SHA384)
    * [const http2cipher_TLS_RSA_PSK_WITH_AES_128_CBC_SHA256](#http2cipher_TLS_RSA_PSK_WITH_AES_128_CBC_SHA256)
    * [const http2cipher_TLS_RSA_PSK_WITH_AES_256_CBC_SHA384](#http2cipher_TLS_RSA_PSK_WITH_AES_256_CBC_SHA384)
    * [const http2cipher_TLS_RSA_PSK_WITH_NULL_SHA256](#http2cipher_TLS_RSA_PSK_WITH_NULL_SHA256)
    * [const http2cipher_TLS_RSA_PSK_WITH_NULL_SHA384](#http2cipher_TLS_RSA_PSK_WITH_NULL_SHA384)
    * [const http2cipher_TLS_RSA_WITH_CAMELLIA_128_CBC_SHA256](#http2cipher_TLS_RSA_WITH_CAMELLIA_128_CBC_SHA256)
    * [const http2cipher_TLS_DH_DSS_WITH_CAMELLIA_128_CBC_SHA256](#http2cipher_TLS_DH_DSS_WITH_CAMELLIA_128_CBC_SHA256)
    * [const http2cipher_TLS_DH_RSA_WITH_CAMELLIA_128_CBC_SHA256](#http2cipher_TLS_DH_RSA_WITH_CAMELLIA_128_CBC_SHA256)
    * [const http2cipher_TLS_DHE_DSS_WITH_CAMELLIA_128_CBC_SHA256](#http2cipher_TLS_DHE_DSS_WITH_CAMELLIA_128_CBC_SHA256)
    * [const http2cipher_TLS_DHE_RSA_WITH_CAMELLIA_128_CBC_SHA256](#http2cipher_TLS_DHE_RSA_WITH_CAMELLIA_128_CBC_SHA256)
    * [const http2cipher_TLS_DH_anon_WITH_CAMELLIA_128_CBC_SHA256](#http2cipher_TLS_DH_anon_WITH_CAMELLIA_128_CBC_SHA256)
    * [const http2cipher_TLS_RSA_WITH_CAMELLIA_256_CBC_SHA256](#http2cipher_TLS_RSA_WITH_CAMELLIA_256_CBC_SHA256)
    * [const http2cipher_TLS_DH_DSS_WITH_CAMELLIA_256_CBC_SHA256](#http2cipher_TLS_DH_DSS_WITH_CAMELLIA_256_CBC_SHA256)
    * [const http2cipher_TLS_DH_RSA_WITH_CAMELLIA_256_CBC_SHA256](#http2cipher_TLS_DH_RSA_WITH_CAMELLIA_256_CBC_SHA256)
    * [const http2cipher_TLS_DHE_DSS_WITH_CAMELLIA_256_CBC_SHA256](#http2cipher_TLS_DHE_DSS_WITH_CAMELLIA_256_CBC_SHA256)
    * [const http2cipher_TLS_DHE_RSA_WITH_CAMELLIA_256_CBC_SHA256](#http2cipher_TLS_DHE_RSA_WITH_CAMELLIA_256_CBC_SHA256)
    * [const http2cipher_TLS_DH_anon_WITH_CAMELLIA_256_CBC_SHA256](#http2cipher_TLS_DH_anon_WITH_CAMELLIA_256_CBC_SHA256)
    * [const http2cipher_TLS_EMPTY_RENEGOTIATION_INFO_SCSV](#http2cipher_TLS_EMPTY_RENEGOTIATION_INFO_SCSV)
    * [const http2cipher_TLS_FALLBACK_SCSV](#http2cipher_TLS_FALLBACK_SCSV)
    * [const http2cipher_TLS_ECDH_ECDSA_WITH_NULL_SHA](#http2cipher_TLS_ECDH_ECDSA_WITH_NULL_SHA)
    * [const http2cipher_TLS_ECDH_ECDSA_WITH_RC4_128_SHA](#http2cipher_TLS_ECDH_ECDSA_WITH_RC4_128_SHA)
    * [const http2cipher_TLS_ECDH_ECDSA_WITH_3DES_EDE_CBC_SHA](#http2cipher_TLS_ECDH_ECDSA_WITH_3DES_EDE_CBC_SHA)
    * [const http2cipher_TLS_ECDH_ECDSA_WITH_AES_128_CBC_SHA](#http2cipher_TLS_ECDH_ECDSA_WITH_AES_128_CBC_SHA)
    * [const http2cipher_TLS_ECDH_ECDSA_WITH_AES_256_CBC_SHA](#http2cipher_TLS_ECDH_ECDSA_WITH_AES_256_CBC_SHA)
    * [const http2cipher_TLS_ECDHE_ECDSA_WITH_NULL_SHA](#http2cipher_TLS_ECDHE_ECDSA_WITH_NULL_SHA)
    * [const http2cipher_TLS_ECDHE_ECDSA_WITH_RC4_128_SHA](#http2cipher_TLS_ECDHE_ECDSA_WITH_RC4_128_SHA)
    * [const http2cipher_TLS_ECDHE_ECDSA_WITH_3DES_EDE_CBC_SHA](#http2cipher_TLS_ECDHE_ECDSA_WITH_3DES_EDE_CBC_SHA)
    * [const http2cipher_TLS_ECDHE_ECDSA_WITH_AES_128_CBC_SHA](#http2cipher_TLS_ECDHE_ECDSA_WITH_AES_128_CBC_SHA)
    * [const http2cipher_TLS_ECDHE_ECDSA_WITH_AES_256_CBC_SHA](#http2cipher_TLS_ECDHE_ECDSA_WITH_AES_256_CBC_SHA)
    * [const http2cipher_TLS_ECDH_RSA_WITH_NULL_SHA](#http2cipher_TLS_ECDH_RSA_WITH_NULL_SHA)
    * [const http2cipher_TLS_ECDH_RSA_WITH_RC4_128_SHA](#http2cipher_TLS_ECDH_RSA_WITH_RC4_128_SHA)
    * [const http2cipher_TLS_ECDH_RSA_WITH_3DES_EDE_CBC_SHA](#http2cipher_TLS_ECDH_RSA_WITH_3DES_EDE_CBC_SHA)
    * [const http2cipher_TLS_ECDH_RSA_WITH_AES_128_CBC_SHA](#http2cipher_TLS_ECDH_RSA_WITH_AES_128_CBC_SHA)
    * [const http2cipher_TLS_ECDH_RSA_WITH_AES_256_CBC_SHA](#http2cipher_TLS_ECDH_RSA_WITH_AES_256_CBC_SHA)
    * [const http2cipher_TLS_ECDHE_RSA_WITH_NULL_SHA](#http2cipher_TLS_ECDHE_RSA_WITH_NULL_SHA)
    * [const http2cipher_TLS_ECDHE_RSA_WITH_RC4_128_SHA](#http2cipher_TLS_ECDHE_RSA_WITH_RC4_128_SHA)
    * [const http2cipher_TLS_ECDHE_RSA_WITH_3DES_EDE_CBC_SHA](#http2cipher_TLS_ECDHE_RSA_WITH_3DES_EDE_CBC_SHA)
    * [const http2cipher_TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA](#http2cipher_TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA)
    * [const http2cipher_TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA](#http2cipher_TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA)
    * [const http2cipher_TLS_ECDH_anon_WITH_NULL_SHA](#http2cipher_TLS_ECDH_anon_WITH_NULL_SHA)
    * [const http2cipher_TLS_ECDH_anon_WITH_RC4_128_SHA](#http2cipher_TLS_ECDH_anon_WITH_RC4_128_SHA)
    * [const http2cipher_TLS_ECDH_anon_WITH_3DES_EDE_CBC_SHA](#http2cipher_TLS_ECDH_anon_WITH_3DES_EDE_CBC_SHA)
    * [const http2cipher_TLS_ECDH_anon_WITH_AES_128_CBC_SHA](#http2cipher_TLS_ECDH_anon_WITH_AES_128_CBC_SHA)
    * [const http2cipher_TLS_ECDH_anon_WITH_AES_256_CBC_SHA](#http2cipher_TLS_ECDH_anon_WITH_AES_256_CBC_SHA)
    * [const http2cipher_TLS_SRP_SHA_WITH_3DES_EDE_CBC_SHA](#http2cipher_TLS_SRP_SHA_WITH_3DES_EDE_CBC_SHA)
    * [const http2cipher_TLS_SRP_SHA_RSA_WITH_3DES_EDE_CBC_SHA](#http2cipher_TLS_SRP_SHA_RSA_WITH_3DES_EDE_CBC_SHA)
    * [const http2cipher_TLS_SRP_SHA_DSS_WITH_3DES_EDE_CBC_SHA](#http2cipher_TLS_SRP_SHA_DSS_WITH_3DES_EDE_CBC_SHA)
    * [const http2cipher_TLS_SRP_SHA_WITH_AES_128_CBC_SHA](#http2cipher_TLS_SRP_SHA_WITH_AES_128_CBC_SHA)
    * [const http2cipher_TLS_SRP_SHA_RSA_WITH_AES_128_CBC_SHA](#http2cipher_TLS_SRP_SHA_RSA_WITH_AES_128_CBC_SHA)
    * [const http2cipher_TLS_SRP_SHA_DSS_WITH_AES_128_CBC_SHA](#http2cipher_TLS_SRP_SHA_DSS_WITH_AES_128_CBC_SHA)
    * [const http2cipher_TLS_SRP_SHA_WITH_AES_256_CBC_SHA](#http2cipher_TLS_SRP_SHA_WITH_AES_256_CBC_SHA)
    * [const http2cipher_TLS_SRP_SHA_RSA_WITH_AES_256_CBC_SHA](#http2cipher_TLS_SRP_SHA_RSA_WITH_AES_256_CBC_SHA)
    * [const http2cipher_TLS_SRP_SHA_DSS_WITH_AES_256_CBC_SHA](#http2cipher_TLS_SRP_SHA_DSS_WITH_AES_256_CBC_SHA)
    * [const http2cipher_TLS_ECDHE_ECDSA_WITH_AES_128_CBC_SHA256](#http2cipher_TLS_ECDHE_ECDSA_WITH_AES_128_CBC_SHA256)
    * [const http2cipher_TLS_ECDHE_ECDSA_WITH_AES_256_CBC_SHA384](#http2cipher_TLS_ECDHE_ECDSA_WITH_AES_256_CBC_SHA384)
    * [const http2cipher_TLS_ECDH_ECDSA_WITH_AES_128_CBC_SHA256](#http2cipher_TLS_ECDH_ECDSA_WITH_AES_128_CBC_SHA256)
    * [const http2cipher_TLS_ECDH_ECDSA_WITH_AES_256_CBC_SHA384](#http2cipher_TLS_ECDH_ECDSA_WITH_AES_256_CBC_SHA384)
    * [const http2cipher_TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256](#http2cipher_TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256)
    * [const http2cipher_TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384](#http2cipher_TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384)
    * [const http2cipher_TLS_ECDH_RSA_WITH_AES_128_CBC_SHA256](#http2cipher_TLS_ECDH_RSA_WITH_AES_128_CBC_SHA256)
    * [const http2cipher_TLS_ECDH_RSA_WITH_AES_256_CBC_SHA384](#http2cipher_TLS_ECDH_RSA_WITH_AES_256_CBC_SHA384)
    * [const http2cipher_TLS_ECDHE_ECDSA_WITH_AES_128_GCM_SHA256](#http2cipher_TLS_ECDHE_ECDSA_WITH_AES_128_GCM_SHA256)
    * [const http2cipher_TLS_ECDHE_ECDSA_WITH_AES_256_GCM_SHA384](#http2cipher_TLS_ECDHE_ECDSA_WITH_AES_256_GCM_SHA384)
    * [const http2cipher_TLS_ECDH_ECDSA_WITH_AES_128_GCM_SHA256](#http2cipher_TLS_ECDH_ECDSA_WITH_AES_128_GCM_SHA256)
    * [const http2cipher_TLS_ECDH_ECDSA_WITH_AES_256_GCM_SHA384](#http2cipher_TLS_ECDH_ECDSA_WITH_AES_256_GCM_SHA384)
    * [const http2cipher_TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256](#http2cipher_TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256)
    * [const http2cipher_TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384](#http2cipher_TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384)
    * [const http2cipher_TLS_ECDH_RSA_WITH_AES_128_GCM_SHA256](#http2cipher_TLS_ECDH_RSA_WITH_AES_128_GCM_SHA256)
    * [const http2cipher_TLS_ECDH_RSA_WITH_AES_256_GCM_SHA384](#http2cipher_TLS_ECDH_RSA_WITH_AES_256_GCM_SHA384)
    * [const http2cipher_TLS_ECDHE_PSK_WITH_RC4_128_SHA](#http2cipher_TLS_ECDHE_PSK_WITH_RC4_128_SHA)
    * [const http2cipher_TLS_ECDHE_PSK_WITH_3DES_EDE_CBC_SHA](#http2cipher_TLS_ECDHE_PSK_WITH_3DES_EDE_CBC_SHA)
    * [const http2cipher_TLS_ECDHE_PSK_WITH_AES_128_CBC_SHA](#http2cipher_TLS_ECDHE_PSK_WITH_AES_128_CBC_SHA)
    * [const http2cipher_TLS_ECDHE_PSK_WITH_AES_256_CBC_SHA](#http2cipher_TLS_ECDHE_PSK_WITH_AES_256_CBC_SHA)
    * [const http2cipher_TLS_ECDHE_PSK_WITH_AES_128_CBC_SHA256](#http2cipher_TLS_ECDHE_PSK_WITH_AES_128_CBC_SHA256)
    * [const http2cipher_TLS_ECDHE_PSK_WITH_AES_256_CBC_SHA384](#http2cipher_TLS_ECDHE_PSK_WITH_AES_256_CBC_SHA384)
    * [const http2cipher_TLS_ECDHE_PSK_WITH_NULL_SHA](#http2cipher_TLS_ECDHE_PSK_WITH_NULL_SHA)
    * [const http2cipher_TLS_ECDHE_PSK_WITH_NULL_SHA256](#http2cipher_TLS_ECDHE_PSK_WITH_NULL_SHA256)
    * [const http2cipher_TLS_ECDHE_PSK_WITH_NULL_SHA384](#http2cipher_TLS_ECDHE_PSK_WITH_NULL_SHA384)
    * [const http2cipher_TLS_RSA_WITH_ARIA_128_CBC_SHA256](#http2cipher_TLS_RSA_WITH_ARIA_128_CBC_SHA256)
    * [const http2cipher_TLS_RSA_WITH_ARIA_256_CBC_SHA384](#http2cipher_TLS_RSA_WITH_ARIA_256_CBC_SHA384)
    * [const http2cipher_TLS_DH_DSS_WITH_ARIA_128_CBC_SHA256](#http2cipher_TLS_DH_DSS_WITH_ARIA_128_CBC_SHA256)
    * [const http2cipher_TLS_DH_DSS_WITH_ARIA_256_CBC_SHA384](#http2cipher_TLS_DH_DSS_WITH_ARIA_256_CBC_SHA384)
    * [const http2cipher_TLS_DH_RSA_WITH_ARIA_128_CBC_SHA256](#http2cipher_TLS_DH_RSA_WITH_ARIA_128_CBC_SHA256)
    * [const http2cipher_TLS_DH_RSA_WITH_ARIA_256_CBC_SHA384](#http2cipher_TLS_DH_RSA_WITH_ARIA_256_CBC_SHA384)
    * [const http2cipher_TLS_DHE_DSS_WITH_ARIA_128_CBC_SHA256](#http2cipher_TLS_DHE_DSS_WITH_ARIA_128_CBC_SHA256)
    * [const http2cipher_TLS_DHE_DSS_WITH_ARIA_256_CBC_SHA384](#http2cipher_TLS_DHE_DSS_WITH_ARIA_256_CBC_SHA384)
    * [const http2cipher_TLS_DHE_RSA_WITH_ARIA_128_CBC_SHA256](#http2cipher_TLS_DHE_RSA_WITH_ARIA_128_CBC_SHA256)
    * [const http2cipher_TLS_DHE_RSA_WITH_ARIA_256_CBC_SHA384](#http2cipher_TLS_DHE_RSA_WITH_ARIA_256_CBC_SHA384)
    * [const http2cipher_TLS_DH_anon_WITH_ARIA_128_CBC_SHA256](#http2cipher_TLS_DH_anon_WITH_ARIA_128_CBC_SHA256)
    * [const http2cipher_TLS_DH_anon_WITH_ARIA_256_CBC_SHA384](#http2cipher_TLS_DH_anon_WITH_ARIA_256_CBC_SHA384)
    * [const http2cipher_TLS_ECDHE_ECDSA_WITH_ARIA_128_CBC_SHA256](#http2cipher_TLS_ECDHE_ECDSA_WITH_ARIA_128_CBC_SHA256)
    * [const http2cipher_TLS_ECDHE_ECDSA_WITH_ARIA_256_CBC_SHA384](#http2cipher_TLS_ECDHE_ECDSA_WITH_ARIA_256_CBC_SHA384)
    * [const http2cipher_TLS_ECDH_ECDSA_WITH_ARIA_128_CBC_SHA256](#http2cipher_TLS_ECDH_ECDSA_WITH_ARIA_128_CBC_SHA256)
    * [const http2cipher_TLS_ECDH_ECDSA_WITH_ARIA_256_CBC_SHA384](#http2cipher_TLS_ECDH_ECDSA_WITH_ARIA_256_CBC_SHA384)
    * [const http2cipher_TLS_ECDHE_RSA_WITH_ARIA_128_CBC_SHA256](#http2cipher_TLS_ECDHE_RSA_WITH_ARIA_128_CBC_SHA256)
    * [const http2cipher_TLS_ECDHE_RSA_WITH_ARIA_256_CBC_SHA384](#http2cipher_TLS_ECDHE_RSA_WITH_ARIA_256_CBC_SHA384)
    * [const http2cipher_TLS_ECDH_RSA_WITH_ARIA_128_CBC_SHA256](#http2cipher_TLS_ECDH_RSA_WITH_ARIA_128_CBC_SHA256)
    * [const http2cipher_TLS_ECDH_RSA_WITH_ARIA_256_CBC_SHA384](#http2cipher_TLS_ECDH_RSA_WITH_ARIA_256_CBC_SHA384)
    * [const http2cipher_TLS_RSA_WITH_ARIA_128_GCM_SHA256](#http2cipher_TLS_RSA_WITH_ARIA_128_GCM_SHA256)
    * [const http2cipher_TLS_RSA_WITH_ARIA_256_GCM_SHA384](#http2cipher_TLS_RSA_WITH_ARIA_256_GCM_SHA384)
    * [const http2cipher_TLS_DHE_RSA_WITH_ARIA_128_GCM_SHA256](#http2cipher_TLS_DHE_RSA_WITH_ARIA_128_GCM_SHA256)
    * [const http2cipher_TLS_DHE_RSA_WITH_ARIA_256_GCM_SHA384](#http2cipher_TLS_DHE_RSA_WITH_ARIA_256_GCM_SHA384)
    * [const http2cipher_TLS_DH_RSA_WITH_ARIA_128_GCM_SHA256](#http2cipher_TLS_DH_RSA_WITH_ARIA_128_GCM_SHA256)
    * [const http2cipher_TLS_DH_RSA_WITH_ARIA_256_GCM_SHA384](#http2cipher_TLS_DH_RSA_WITH_ARIA_256_GCM_SHA384)
    * [const http2cipher_TLS_DHE_DSS_WITH_ARIA_128_GCM_SHA256](#http2cipher_TLS_DHE_DSS_WITH_ARIA_128_GCM_SHA256)
    * [const http2cipher_TLS_DHE_DSS_WITH_ARIA_256_GCM_SHA384](#http2cipher_TLS_DHE_DSS_WITH_ARIA_256_GCM_SHA384)
    * [const http2cipher_TLS_DH_DSS_WITH_ARIA_128_GCM_SHA256](#http2cipher_TLS_DH_DSS_WITH_ARIA_128_GCM_SHA256)
    * [const http2cipher_TLS_DH_DSS_WITH_ARIA_256_GCM_SHA384](#http2cipher_TLS_DH_DSS_WITH_ARIA_256_GCM_SHA384)
    * [const http2cipher_TLS_DH_anon_WITH_ARIA_128_GCM_SHA256](#http2cipher_TLS_DH_anon_WITH_ARIA_128_GCM_SHA256)
    * [const http2cipher_TLS_DH_anon_WITH_ARIA_256_GCM_SHA384](#http2cipher_TLS_DH_anon_WITH_ARIA_256_GCM_SHA384)
    * [const http2cipher_TLS_ECDHE_ECDSA_WITH_ARIA_128_GCM_SHA256](#http2cipher_TLS_ECDHE_ECDSA_WITH_ARIA_128_GCM_SHA256)
    * [const http2cipher_TLS_ECDHE_ECDSA_WITH_ARIA_256_GCM_SHA384](#http2cipher_TLS_ECDHE_ECDSA_WITH_ARIA_256_GCM_SHA384)
    * [const http2cipher_TLS_ECDH_ECDSA_WITH_ARIA_128_GCM_SHA256](#http2cipher_TLS_ECDH_ECDSA_WITH_ARIA_128_GCM_SHA256)
    * [const http2cipher_TLS_ECDH_ECDSA_WITH_ARIA_256_GCM_SHA384](#http2cipher_TLS_ECDH_ECDSA_WITH_ARIA_256_GCM_SHA384)
    * [const http2cipher_TLS_ECDHE_RSA_WITH_ARIA_128_GCM_SHA256](#http2cipher_TLS_ECDHE_RSA_WITH_ARIA_128_GCM_SHA256)
    * [const http2cipher_TLS_ECDHE_RSA_WITH_ARIA_256_GCM_SHA384](#http2cipher_TLS_ECDHE_RSA_WITH_ARIA_256_GCM_SHA384)
    * [const http2cipher_TLS_ECDH_RSA_WITH_ARIA_128_GCM_SHA256](#http2cipher_TLS_ECDH_RSA_WITH_ARIA_128_GCM_SHA256)
    * [const http2cipher_TLS_ECDH_RSA_WITH_ARIA_256_GCM_SHA384](#http2cipher_TLS_ECDH_RSA_WITH_ARIA_256_GCM_SHA384)
    * [const http2cipher_TLS_PSK_WITH_ARIA_128_CBC_SHA256](#http2cipher_TLS_PSK_WITH_ARIA_128_CBC_SHA256)
    * [const http2cipher_TLS_PSK_WITH_ARIA_256_CBC_SHA384](#http2cipher_TLS_PSK_WITH_ARIA_256_CBC_SHA384)
    * [const http2cipher_TLS_DHE_PSK_WITH_ARIA_128_CBC_SHA256](#http2cipher_TLS_DHE_PSK_WITH_ARIA_128_CBC_SHA256)
    * [const http2cipher_TLS_DHE_PSK_WITH_ARIA_256_CBC_SHA384](#http2cipher_TLS_DHE_PSK_WITH_ARIA_256_CBC_SHA384)
    * [const http2cipher_TLS_RSA_PSK_WITH_ARIA_128_CBC_SHA256](#http2cipher_TLS_RSA_PSK_WITH_ARIA_128_CBC_SHA256)
    * [const http2cipher_TLS_RSA_PSK_WITH_ARIA_256_CBC_SHA384](#http2cipher_TLS_RSA_PSK_WITH_ARIA_256_CBC_SHA384)
    * [const http2cipher_TLS_PSK_WITH_ARIA_128_GCM_SHA256](#http2cipher_TLS_PSK_WITH_ARIA_128_GCM_SHA256)
    * [const http2cipher_TLS_PSK_WITH_ARIA_256_GCM_SHA384](#http2cipher_TLS_PSK_WITH_ARIA_256_GCM_SHA384)
    * [const http2cipher_TLS_DHE_PSK_WITH_ARIA_128_GCM_SHA256](#http2cipher_TLS_DHE_PSK_WITH_ARIA_128_GCM_SHA256)
    * [const http2cipher_TLS_DHE_PSK_WITH_ARIA_256_GCM_SHA384](#http2cipher_TLS_DHE_PSK_WITH_ARIA_256_GCM_SHA384)
    * [const http2cipher_TLS_RSA_PSK_WITH_ARIA_128_GCM_SHA256](#http2cipher_TLS_RSA_PSK_WITH_ARIA_128_GCM_SHA256)
    * [const http2cipher_TLS_RSA_PSK_WITH_ARIA_256_GCM_SHA384](#http2cipher_TLS_RSA_PSK_WITH_ARIA_256_GCM_SHA384)
    * [const http2cipher_TLS_ECDHE_PSK_WITH_ARIA_128_CBC_SHA256](#http2cipher_TLS_ECDHE_PSK_WITH_ARIA_128_CBC_SHA256)
    * [const http2cipher_TLS_ECDHE_PSK_WITH_ARIA_256_CBC_SHA384](#http2cipher_TLS_ECDHE_PSK_WITH_ARIA_256_CBC_SHA384)
    * [const http2cipher_TLS_ECDHE_ECDSA_WITH_CAMELLIA_128_CBC_SHA256](#http2cipher_TLS_ECDHE_ECDSA_WITH_CAMELLIA_128_CBC_SHA256)
    * [const http2cipher_TLS_ECDHE_ECDSA_WITH_CAMELLIA_256_CBC_SHA384](#http2cipher_TLS_ECDHE_ECDSA_WITH_CAMELLIA_256_CBC_SHA384)
    * [const http2cipher_TLS_ECDH_ECDSA_WITH_CAMELLIA_128_CBC_SHA256](#http2cipher_TLS_ECDH_ECDSA_WITH_CAMELLIA_128_CBC_SHA256)
    * [const http2cipher_TLS_ECDH_ECDSA_WITH_CAMELLIA_256_CBC_SHA384](#http2cipher_TLS_ECDH_ECDSA_WITH_CAMELLIA_256_CBC_SHA384)
    * [const http2cipher_TLS_ECDHE_RSA_WITH_CAMELLIA_128_CBC_SHA256](#http2cipher_TLS_ECDHE_RSA_WITH_CAMELLIA_128_CBC_SHA256)
    * [const http2cipher_TLS_ECDHE_RSA_WITH_CAMELLIA_256_CBC_SHA384](#http2cipher_TLS_ECDHE_RSA_WITH_CAMELLIA_256_CBC_SHA384)
    * [const http2cipher_TLS_ECDH_RSA_WITH_CAMELLIA_128_CBC_SHA256](#http2cipher_TLS_ECDH_RSA_WITH_CAMELLIA_128_CBC_SHA256)
    * [const http2cipher_TLS_ECDH_RSA_WITH_CAMELLIA_256_CBC_SHA384](#http2cipher_TLS_ECDH_RSA_WITH_CAMELLIA_256_CBC_SHA384)
    * [const http2cipher_TLS_RSA_WITH_CAMELLIA_128_GCM_SHA256](#http2cipher_TLS_RSA_WITH_CAMELLIA_128_GCM_SHA256)
    * [const http2cipher_TLS_RSA_WITH_CAMELLIA_256_GCM_SHA384](#http2cipher_TLS_RSA_WITH_CAMELLIA_256_GCM_SHA384)
    * [const http2cipher_TLS_DHE_RSA_WITH_CAMELLIA_128_GCM_SHA256](#http2cipher_TLS_DHE_RSA_WITH_CAMELLIA_128_GCM_SHA256)
    * [const http2cipher_TLS_DHE_RSA_WITH_CAMELLIA_256_GCM_SHA384](#http2cipher_TLS_DHE_RSA_WITH_CAMELLIA_256_GCM_SHA384)
    * [const http2cipher_TLS_DH_RSA_WITH_CAMELLIA_128_GCM_SHA256](#http2cipher_TLS_DH_RSA_WITH_CAMELLIA_128_GCM_SHA256)
    * [const http2cipher_TLS_DH_RSA_WITH_CAMELLIA_256_GCM_SHA384](#http2cipher_TLS_DH_RSA_WITH_CAMELLIA_256_GCM_SHA384)
    * [const http2cipher_TLS_DHE_DSS_WITH_CAMELLIA_128_GCM_SHA256](#http2cipher_TLS_DHE_DSS_WITH_CAMELLIA_128_GCM_SHA256)
    * [const http2cipher_TLS_DHE_DSS_WITH_CAMELLIA_256_GCM_SHA384](#http2cipher_TLS_DHE_DSS_WITH_CAMELLIA_256_GCM_SHA384)
    * [const http2cipher_TLS_DH_DSS_WITH_CAMELLIA_128_GCM_SHA256](#http2cipher_TLS_DH_DSS_WITH_CAMELLIA_128_GCM_SHA256)
    * [const http2cipher_TLS_DH_DSS_WITH_CAMELLIA_256_GCM_SHA384](#http2cipher_TLS_DH_DSS_WITH_CAMELLIA_256_GCM_SHA384)
    * [const http2cipher_TLS_DH_anon_WITH_CAMELLIA_128_GCM_SHA256](#http2cipher_TLS_DH_anon_WITH_CAMELLIA_128_GCM_SHA256)
    * [const http2cipher_TLS_DH_anon_WITH_CAMELLIA_256_GCM_SHA384](#http2cipher_TLS_DH_anon_WITH_CAMELLIA_256_GCM_SHA384)
    * [const http2cipher_TLS_ECDHE_ECDSA_WITH_CAMELLIA_128_GCM_SHA256](#http2cipher_TLS_ECDHE_ECDSA_WITH_CAMELLIA_128_GCM_SHA256)
    * [const http2cipher_TLS_ECDHE_ECDSA_WITH_CAMELLIA_256_GCM_SHA384](#http2cipher_TLS_ECDHE_ECDSA_WITH_CAMELLIA_256_GCM_SHA384)
    * [const http2cipher_TLS_ECDH_ECDSA_WITH_CAMELLIA_128_GCM_SHA256](#http2cipher_TLS_ECDH_ECDSA_WITH_CAMELLIA_128_GCM_SHA256)
    * [const http2cipher_TLS_ECDH_ECDSA_WITH_CAMELLIA_256_GCM_SHA384](#http2cipher_TLS_ECDH_ECDSA_WITH_CAMELLIA_256_GCM_SHA384)
    * [const http2cipher_TLS_ECDHE_RSA_WITH_CAMELLIA_128_GCM_SHA256](#http2cipher_TLS_ECDHE_RSA_WITH_CAMELLIA_128_GCM_SHA256)
    * [const http2cipher_TLS_ECDHE_RSA_WITH_CAMELLIA_256_GCM_SHA384](#http2cipher_TLS_ECDHE_RSA_WITH_CAMELLIA_256_GCM_SHA384)
    * [const http2cipher_TLS_ECDH_RSA_WITH_CAMELLIA_128_GCM_SHA256](#http2cipher_TLS_ECDH_RSA_WITH_CAMELLIA_128_GCM_SHA256)
    * [const http2cipher_TLS_ECDH_RSA_WITH_CAMELLIA_256_GCM_SHA384](#http2cipher_TLS_ECDH_RSA_WITH_CAMELLIA_256_GCM_SHA384)
    * [const http2cipher_TLS_PSK_WITH_CAMELLIA_128_GCM_SHA256](#http2cipher_TLS_PSK_WITH_CAMELLIA_128_GCM_SHA256)
    * [const http2cipher_TLS_PSK_WITH_CAMELLIA_256_GCM_SHA384](#http2cipher_TLS_PSK_WITH_CAMELLIA_256_GCM_SHA384)
    * [const http2cipher_TLS_DHE_PSK_WITH_CAMELLIA_128_GCM_SHA256](#http2cipher_TLS_DHE_PSK_WITH_CAMELLIA_128_GCM_SHA256)
    * [const http2cipher_TLS_DHE_PSK_WITH_CAMELLIA_256_GCM_SHA384](#http2cipher_TLS_DHE_PSK_WITH_CAMELLIA_256_GCM_SHA384)
    * [const http2cipher_TLS_RSA_PSK_WITH_CAMELLIA_128_GCM_SHA256](#http2cipher_TLS_RSA_PSK_WITH_CAMELLIA_128_GCM_SHA256)
    * [const http2cipher_TLS_RSA_PSK_WITH_CAMELLIA_256_GCM_SHA384](#http2cipher_TLS_RSA_PSK_WITH_CAMELLIA_256_GCM_SHA384)
    * [const http2cipher_TLS_PSK_WITH_CAMELLIA_128_CBC_SHA256](#http2cipher_TLS_PSK_WITH_CAMELLIA_128_CBC_SHA256)
    * [const http2cipher_TLS_PSK_WITH_CAMELLIA_256_CBC_SHA384](#http2cipher_TLS_PSK_WITH_CAMELLIA_256_CBC_SHA384)
    * [const http2cipher_TLS_DHE_PSK_WITH_CAMELLIA_128_CBC_SHA256](#http2cipher_TLS_DHE_PSK_WITH_CAMELLIA_128_CBC_SHA256)
    * [const http2cipher_TLS_DHE_PSK_WITH_CAMELLIA_256_CBC_SHA384](#http2cipher_TLS_DHE_PSK_WITH_CAMELLIA_256_CBC_SHA384)
    * [const http2cipher_TLS_RSA_PSK_WITH_CAMELLIA_128_CBC_SHA256](#http2cipher_TLS_RSA_PSK_WITH_CAMELLIA_128_CBC_SHA256)
    * [const http2cipher_TLS_RSA_PSK_WITH_CAMELLIA_256_CBC_SHA384](#http2cipher_TLS_RSA_PSK_WITH_CAMELLIA_256_CBC_SHA384)
    * [const http2cipher_TLS_ECDHE_PSK_WITH_CAMELLIA_128_CBC_SHA256](#http2cipher_TLS_ECDHE_PSK_WITH_CAMELLIA_128_CBC_SHA256)
    * [const http2cipher_TLS_ECDHE_PSK_WITH_CAMELLIA_256_CBC_SHA384](#http2cipher_TLS_ECDHE_PSK_WITH_CAMELLIA_256_CBC_SHA384)
    * [const http2cipher_TLS_RSA_WITH_AES_128_CCM](#http2cipher_TLS_RSA_WITH_AES_128_CCM)
    * [const http2cipher_TLS_RSA_WITH_AES_256_CCM](#http2cipher_TLS_RSA_WITH_AES_256_CCM)
    * [const http2cipher_TLS_DHE_RSA_WITH_AES_128_CCM](#http2cipher_TLS_DHE_RSA_WITH_AES_128_CCM)
    * [const http2cipher_TLS_DHE_RSA_WITH_AES_256_CCM](#http2cipher_TLS_DHE_RSA_WITH_AES_256_CCM)
    * [const http2cipher_TLS_RSA_WITH_AES_128_CCM_8](#http2cipher_TLS_RSA_WITH_AES_128_CCM_8)
    * [const http2cipher_TLS_RSA_WITH_AES_256_CCM_8](#http2cipher_TLS_RSA_WITH_AES_256_CCM_8)
    * [const http2cipher_TLS_DHE_RSA_WITH_AES_128_CCM_8](#http2cipher_TLS_DHE_RSA_WITH_AES_128_CCM_8)
    * [const http2cipher_TLS_DHE_RSA_WITH_AES_256_CCM_8](#http2cipher_TLS_DHE_RSA_WITH_AES_256_CCM_8)
    * [const http2cipher_TLS_PSK_WITH_AES_128_CCM](#http2cipher_TLS_PSK_WITH_AES_128_CCM)
    * [const http2cipher_TLS_PSK_WITH_AES_256_CCM](#http2cipher_TLS_PSK_WITH_AES_256_CCM)
    * [const http2cipher_TLS_DHE_PSK_WITH_AES_128_CCM](#http2cipher_TLS_DHE_PSK_WITH_AES_128_CCM)
    * [const http2cipher_TLS_DHE_PSK_WITH_AES_256_CCM](#http2cipher_TLS_DHE_PSK_WITH_AES_256_CCM)
    * [const http2cipher_TLS_PSK_WITH_AES_128_CCM_8](#http2cipher_TLS_PSK_WITH_AES_128_CCM_8)
    * [const http2cipher_TLS_PSK_WITH_AES_256_CCM_8](#http2cipher_TLS_PSK_WITH_AES_256_CCM_8)
    * [const http2cipher_TLS_PSK_DHE_WITH_AES_128_CCM_8](#http2cipher_TLS_PSK_DHE_WITH_AES_128_CCM_8)
    * [const http2cipher_TLS_PSK_DHE_WITH_AES_256_CCM_8](#http2cipher_TLS_PSK_DHE_WITH_AES_256_CCM_8)
    * [const http2cipher_TLS_ECDHE_ECDSA_WITH_AES_128_CCM](#http2cipher_TLS_ECDHE_ECDSA_WITH_AES_128_CCM)
    * [const http2cipher_TLS_ECDHE_ECDSA_WITH_AES_256_CCM](#http2cipher_TLS_ECDHE_ECDSA_WITH_AES_256_CCM)
    * [const http2cipher_TLS_ECDHE_ECDSA_WITH_AES_128_CCM_8](#http2cipher_TLS_ECDHE_ECDSA_WITH_AES_128_CCM_8)
    * [const http2cipher_TLS_ECDHE_ECDSA_WITH_AES_256_CCM_8](#http2cipher_TLS_ECDHE_ECDSA_WITH_AES_256_CCM_8)
    * [const http2cipher_TLS_ECDHE_RSA_WITH_CHACHA20_POLY1305_SHA256](#http2cipher_TLS_ECDHE_RSA_WITH_CHACHA20_POLY1305_SHA256)
    * [const http2cipher_TLS_ECDHE_ECDSA_WITH_CHACHA20_POLY1305_SHA256](#http2cipher_TLS_ECDHE_ECDSA_WITH_CHACHA20_POLY1305_SHA256)
    * [const http2cipher_TLS_DHE_RSA_WITH_CHACHA20_POLY1305_SHA256](#http2cipher_TLS_DHE_RSA_WITH_CHACHA20_POLY1305_SHA256)
    * [const http2cipher_TLS_PSK_WITH_CHACHA20_POLY1305_SHA256](#http2cipher_TLS_PSK_WITH_CHACHA20_POLY1305_SHA256)
    * [const http2cipher_TLS_ECDHE_PSK_WITH_CHACHA20_POLY1305_SHA256](#http2cipher_TLS_ECDHE_PSK_WITH_CHACHA20_POLY1305_SHA256)
    * [const http2cipher_TLS_DHE_PSK_WITH_CHACHA20_POLY1305_SHA256](#http2cipher_TLS_DHE_PSK_WITH_CHACHA20_POLY1305_SHA256)
    * [const http2cipher_TLS_RSA_PSK_WITH_CHACHA20_POLY1305_SHA256](#http2cipher_TLS_RSA_PSK_WITH_CHACHA20_POLY1305_SHA256)
    * [const http2dialOnMiss](#http2dialOnMiss)
    * [const http2noDialOnMiss](#http2noDialOnMiss)
    * [const http2ErrCodeNo](#http2ErrCodeNo)
    * [const http2ErrCodeProtocol](#http2ErrCodeProtocol)
    * [const http2ErrCodeInternal](#http2ErrCodeInternal)
    * [const http2ErrCodeFlowControl](#http2ErrCodeFlowControl)
    * [const http2ErrCodeSettingsTimeout](#http2ErrCodeSettingsTimeout)
    * [const http2ErrCodeStreamClosed](#http2ErrCodeStreamClosed)
    * [const http2ErrCodeFrameSize](#http2ErrCodeFrameSize)
    * [const http2ErrCodeRefusedStream](#http2ErrCodeRefusedStream)
    * [const http2ErrCodeCancel](#http2ErrCodeCancel)
    * [const http2ErrCodeCompression](#http2ErrCodeCompression)
    * [const http2ErrCodeConnect](#http2ErrCodeConnect)
    * [const http2ErrCodeEnhanceYourCalm](#http2ErrCodeEnhanceYourCalm)
    * [const http2ErrCodeInadequateSecurity](#http2ErrCodeInadequateSecurity)
    * [const http2ErrCodeHTTP11Required](#http2ErrCodeHTTP11Required)
    * [const http2frameHeaderLen](#http2frameHeaderLen)
    * [const http2FrameData](#http2FrameData)
    * [const http2FrameHeaders](#http2FrameHeaders)
    * [const http2FramePriority](#http2FramePriority)
    * [const http2FrameRSTStream](#http2FrameRSTStream)
    * [const http2FrameSettings](#http2FrameSettings)
    * [const http2FramePushPromise](#http2FramePushPromise)
    * [const http2FramePing](#http2FramePing)
    * [const http2FrameGoAway](#http2FrameGoAway)
    * [const http2FrameWindowUpdate](#http2FrameWindowUpdate)
    * [const http2FrameContinuation](#http2FrameContinuation)
    * [const http2FlagDataEndStream](#http2FlagDataEndStream)
    * [const http2FlagDataPadded](#http2FlagDataPadded)
    * [const http2FlagHeadersEndStream](#http2FlagHeadersEndStream)
    * [const http2FlagHeadersEndHeaders](#http2FlagHeadersEndHeaders)
    * [const http2FlagHeadersPadded](#http2FlagHeadersPadded)
    * [const http2FlagHeadersPriority](#http2FlagHeadersPriority)
    * [const http2FlagSettingsAck](#http2FlagSettingsAck)
    * [const http2FlagPingAck](#http2FlagPingAck)
    * [const http2FlagContinuationEndHeaders](#http2FlagContinuationEndHeaders)
    * [const http2FlagPushPromiseEndHeaders](#http2FlagPushPromiseEndHeaders)
    * [const http2FlagPushPromisePadded](#http2FlagPushPromisePadded)
    * [const http2minMaxFrameSize](#http2minMaxFrameSize)
    * [const http2maxFrameSize](#http2maxFrameSize)
    * [const http2ClientPreface](#http2ClientPreface)
    * [const http2initialMaxFrameSize](#http2initialMaxFrameSize)
    * [const http2NextProtoTLS](#http2NextProtoTLS)
    * [const http2initialHeaderTableSize](#http2initialHeaderTableSize)
    * [const http2initialWindowSize](#http2initialWindowSize)
    * [const http2defaultMaxReadFrameSize](#http2defaultMaxReadFrameSize)
    * [const http2stateIdle](#http2stateIdle)
    * [const http2stateOpen](#http2stateOpen)
    * [const http2stateHalfClosedLocal](#http2stateHalfClosedLocal)
    * [const http2stateHalfClosedRemote](#http2stateHalfClosedRemote)
    * [const http2stateClosed](#http2stateClosed)
    * [const http2SettingHeaderTableSize](#http2SettingHeaderTableSize)
    * [const http2SettingEnablePush](#http2SettingEnablePush)
    * [const http2SettingMaxConcurrentStreams](#http2SettingMaxConcurrentStreams)
    * [const http2SettingInitialWindowSize](#http2SettingInitialWindowSize)
    * [const http2SettingMaxFrameSize](#http2SettingMaxFrameSize)
    * [const http2SettingMaxHeaderListSize](#http2SettingMaxHeaderListSize)
    * [const http2bufWriterPoolBufferSize](#http2bufWriterPoolBufferSize)
    * [const http2prefaceTimeout](#http2prefaceTimeout)
    * [const http2firstSettingsTimeout](#http2firstSettingsTimeout)
    * [const http2handlerChunkWriteSize](#http2handlerChunkWriteSize)
    * [const http2defaultMaxStreams](#http2defaultMaxStreams)
    * [const http2maxQueuedControlFrames](#http2maxQueuedControlFrames)
    * [const http2TrailerPrefix](#http2TrailerPrefix)
    * [const http2transportDefaultConnFlow](#http2transportDefaultConnFlow)
    * [const http2transportDefaultStreamFlow](#http2transportDefaultStreamFlow)
    * [const http2transportDefaultStreamMinRefresh](#http2transportDefaultStreamMinRefresh)
    * [const http2defaultUserAgent](#http2defaultUserAgent)
    * [const http2maxAllocFrameSize](#http2maxAllocFrameSize)
    * [const http2priorityDefaultWeight](#http2priorityDefaultWeight)
    * [const http2priorityNodeOpen](#http2priorityNodeOpen)
    * [const http2priorityNodeClosed](#http2priorityNodeClosed)
    * [const http2priorityNodeIdle](#http2priorityNodeIdle)
    * [const maxInt64](#maxInt64)
    * [const MethodGet](#MethodGet)
    * [const MethodHead](#MethodHead)
    * [const MethodPost](#MethodPost)
    * [const MethodPut](#MethodPut)
    * [const MethodPatch](#MethodPatch)
    * [const MethodDelete](#MethodDelete)
    * [const MethodConnect](#MethodConnect)
    * [const MethodOptions](#MethodOptions)
    * [const MethodTrace](#MethodTrace)
    * [const defaultMaxMemory](#defaultMaxMemory)
    * [const defaultUserAgent](#defaultUserAgent)
    * [const bufferBeforeChunkingSize](#bufferBeforeChunkingSize)
    * [const TrailerPrefix](#TrailerPrefix)
    * [const debugServerConnections](#debugServerConnections)
    * [const DefaultMaxHeaderBytes](#DefaultMaxHeaderBytes)
    * [const TimeFormat](#TimeFormat)
    * [const maxPostHandlerReadBytes](#maxPostHandlerReadBytes)
    * [const rstAvoidanceDelay](#rstAvoidanceDelay)
    * [const runHooks](#runHooks)
    * [const skipHooks](#skipHooks)
    * [const shutdownPollIntervalMax](#shutdownPollIntervalMax)
    * [const StateNew](#StateNew)
    * [const StateActive](#StateActive)
    * [const StateIdle](#StateIdle)
    * [const StateHijacked](#StateHijacked)
    * [const StateClosed](#StateClosed)
    * [const sniffLen](#sniffLen)
    * [const socksVersion5](#socksVersion5)
    * [const socksAddrTypeIPv4](#socksAddrTypeIPv4)
    * [const socksAddrTypeFQDN](#socksAddrTypeFQDN)
    * [const socksAddrTypeIPv6](#socksAddrTypeIPv6)
    * [const socksCmdConnect](#socksCmdConnect)
    * [const sockscmdBind](#sockscmdBind)
    * [const socksAuthMethodNotRequired](#socksAuthMethodNotRequired)
    * [const socksAuthMethodUsernamePassword](#socksAuthMethodUsernamePassword)
    * [const socksAuthMethodNoAcceptableMethods](#socksAuthMethodNoAcceptableMethods)
    * [const socksStatusSucceeded](#socksStatusSucceeded)
    * [const socksauthUsernamePasswordVersion](#socksauthUsernamePasswordVersion)
    * [const socksauthStatusSucceeded](#socksauthStatusSucceeded)
    * [const StatusContinue](#StatusContinue)
    * [const StatusSwitchingProtocols](#StatusSwitchingProtocols)
    * [const StatusProcessing](#StatusProcessing)
    * [const StatusEarlyHints](#StatusEarlyHints)
    * [const StatusOK](#StatusOK)
    * [const StatusCreated](#StatusCreated)
    * [const StatusAccepted](#StatusAccepted)
    * [const StatusNonAuthoritativeInfo](#StatusNonAuthoritativeInfo)
    * [const StatusNoContent](#StatusNoContent)
    * [const StatusResetContent](#StatusResetContent)
    * [const StatusPartialContent](#StatusPartialContent)
    * [const StatusMultiStatus](#StatusMultiStatus)
    * [const StatusAlreadyReported](#StatusAlreadyReported)
    * [const StatusIMUsed](#StatusIMUsed)
    * [const StatusMultipleChoices](#StatusMultipleChoices)
    * [const StatusMovedPermanently](#StatusMovedPermanently)
    * [const StatusFound](#StatusFound)
    * [const StatusSeeOther](#StatusSeeOther)
    * [const StatusNotModified](#StatusNotModified)
    * [const StatusUseProxy](#StatusUseProxy)
    * [const StatusTemporaryRedirect](#StatusTemporaryRedirect)
    * [const StatusPermanentRedirect](#StatusPermanentRedirect)
    * [const StatusBadRequest](#StatusBadRequest)
    * [const StatusUnauthorized](#StatusUnauthorized)
    * [const StatusPaymentRequired](#StatusPaymentRequired)
    * [const StatusForbidden](#StatusForbidden)
    * [const StatusNotFound](#StatusNotFound)
    * [const StatusMethodNotAllowed](#StatusMethodNotAllowed)
    * [const StatusNotAcceptable](#StatusNotAcceptable)
    * [const StatusProxyAuthRequired](#StatusProxyAuthRequired)
    * [const StatusRequestTimeout](#StatusRequestTimeout)
    * [const StatusConflict](#StatusConflict)
    * [const StatusGone](#StatusGone)
    * [const StatusLengthRequired](#StatusLengthRequired)
    * [const StatusPreconditionFailed](#StatusPreconditionFailed)
    * [const StatusRequestEntityTooLarge](#StatusRequestEntityTooLarge)
    * [const StatusRequestURITooLong](#StatusRequestURITooLong)
    * [const StatusUnsupportedMediaType](#StatusUnsupportedMediaType)
    * [const StatusRequestedRangeNotSatisfiable](#StatusRequestedRangeNotSatisfiable)
    * [const StatusExpectationFailed](#StatusExpectationFailed)
    * [const StatusTeapot](#StatusTeapot)
    * [const StatusMisdirectedRequest](#StatusMisdirectedRequest)
    * [const StatusUnprocessableEntity](#StatusUnprocessableEntity)
    * [const StatusLocked](#StatusLocked)
    * [const StatusFailedDependency](#StatusFailedDependency)
    * [const StatusTooEarly](#StatusTooEarly)
    * [const StatusUpgradeRequired](#StatusUpgradeRequired)
    * [const StatusPreconditionRequired](#StatusPreconditionRequired)
    * [const StatusTooManyRequests](#StatusTooManyRequests)
    * [const StatusRequestHeaderFieldsTooLarge](#StatusRequestHeaderFieldsTooLarge)
    * [const StatusUnavailableForLegalReasons](#StatusUnavailableForLegalReasons)
    * [const StatusInternalServerError](#StatusInternalServerError)
    * [const StatusNotImplemented](#StatusNotImplemented)
    * [const StatusBadGateway](#StatusBadGateway)
    * [const StatusServiceUnavailable](#StatusServiceUnavailable)
    * [const StatusGatewayTimeout](#StatusGatewayTimeout)
    * [const StatusHTTPVersionNotSupported](#StatusHTTPVersionNotSupported)
    * [const StatusVariantAlsoNegotiates](#StatusVariantAlsoNegotiates)
    * [const StatusInsufficientStorage](#StatusInsufficientStorage)
    * [const StatusLoopDetected](#StatusLoopDetected)
    * [const StatusNotExtended](#StatusNotExtended)
    * [const StatusNetworkAuthenticationRequired](#StatusNetworkAuthenticationRequired)
    * [const DefaultMaxIdleConnsPerHost](#DefaultMaxIdleConnsPerHost)
    * [const maxWriteWaitBeforeConnReuse](#maxWriteWaitBeforeConnReuse)
    * [const MaxWriteWaitBeforeConnReuse](#MaxWriteWaitBeforeConnReuse)
* [Variables](#var)
    * [var DefaultClient](#DefaultClient)
    * [var ErrUseLastResponse](#ErrUseLastResponse)
    * [var testHookClientDoResult](#testHookClientDoResult)
    * [var cookieNameSanitizer](#cookieNameSanitizer)
    * [var errSeeker](#errSeeker)
    * [var errNoOverlap](#errNoOverlap)
    * [var unixEpochTime](#unixEpochTime)
    * [var errMissingSeek](#errMissingSeek)
    * [var errMissingReadDir](#errMissingReadDir)
    * [var http2dataChunkSizeClasses](#http2dataChunkSizeClasses)
    * [var http2dataChunkPools](#http2dataChunkPools)
    * [var http2errReadEmpty](#http2errReadEmpty)
    * [var http2errCodeName](#http2errCodeName)
    * [var http2errMixPseudoHeaderTypes](#http2errMixPseudoHeaderTypes)
    * [var http2errPseudoAfterRegular](#http2errPseudoAfterRegular)
    * [var http2padZeros](#http2padZeros)
    * [var http2frameName](#http2frameName)
    * [var http2flagName](#http2flagName)
    * [var http2frameParsers](#http2frameParsers)
    * [var http2fhBytes](#http2fhBytes)
    * [var http2ErrFrameTooLarge](#http2ErrFrameTooLarge)
    * [var http2errStreamID](#http2errStreamID)
    * [var http2errDepStreamID](#http2errDepStreamID)
    * [var http2errPadLength](#http2errPadLength)
    * [var http2errPadBytes](#http2errPadBytes)
    * [var http2DebugGoroutines](#http2DebugGoroutines)
    * [var http2goroutineSpace](#http2goroutineSpace)
    * [var http2littleBuf](#http2littleBuf)
    * [var http2commonBuildOnce](#http2commonBuildOnce)
    * [var http2commonLowerHeader](#http2commonLowerHeader)
    * [var http2commonCanonHeader](#http2commonCanonHeader)
    * [var http2VerboseLogs](#http2VerboseLogs)
    * [var http2logFrameWrites](#http2logFrameWrites)
    * [var http2logFrameReads](#http2logFrameReads)
    * [var http2inTests](#http2inTests)
    * [var http2clientPreface](#http2clientPreface)
    * [var http2stateName](#http2stateName)
    * [var http2settingName](#http2settingName)
    * [var http2bufWriterPool](#http2bufWriterPool)
    * [var http2errTimeout](#http2errTimeout)
    * [var http2sorterPool](#http2sorterPool)
    * [var http2errClosedPipeWrite](#http2errClosedPipeWrite)
    * [var http2errClientDisconnected](#http2errClientDisconnected)
    * [var http2errClosedBody](#http2errClosedBody)
    * [var http2errHandlerComplete](#http2errHandlerComplete)
    * [var http2errStreamClosed](#http2errStreamClosed)
    * [var http2responseWriterStatePool](#http2responseWriterStatePool)
    * [var http2testHookOnConn](#http2testHookOnConn)
    * [var http2testHookGetServerConn](#http2testHookGetServerConn)
    * [var http2testHookOnPanicMu](#http2testHookOnPanicMu)
    * [var http2testHookOnPanic](#http2testHookOnPanic)
    * [var http2settingsTimerMsg](#http2settingsTimerMsg)
    * [var http2idleTimerMsg](#http2idleTimerMsg)
    * [var http2shutdownTimerMsg](#http2shutdownTimerMsg)
    * [var http2gracefulShutdownMsg](#http2gracefulShutdownMsg)
    * [var http2errPrefaceTimeout](#http2errPrefaceTimeout)
    * [var http2errChanPool](#http2errChanPool)
    * [var http2writeDataPool](#http2writeDataPool)
    * [var http2errHandlerPanicked](#http2errHandlerPanicked)
    * [var http2goAwayTimeout](#http2goAwayTimeout)
    * [var http2ErrRecursivePush](#http2ErrRecursivePush)
    * [var http2ErrPushLimitReached](#http2ErrPushLimitReached)
    * [var http2connHeaders](#http2connHeaders)
    * [var http2got1xxFuncForTests](#http2got1xxFuncForTests)
    * [var http2ErrNoCachedConn](#http2ErrNoCachedConn)
    * [var http2errClientConnClosed](#http2errClientConnClosed)
    * [var http2errClientConnUnusable](#http2errClientConnUnusable)
    * [var http2errClientConnGotGoAway](#http2errClientConnGotGoAway)
    * [var http2shutdownEnterWaitStateHook](#http2shutdownEnterWaitStateHook)
    * [var http2errRequestCanceled](#http2errRequestCanceled)
    * [var http2errStopReqBodyWrite](#http2errStopReqBodyWrite)
    * [var http2errStopReqBodyWriteAndCancel](#http2errStopReqBodyWriteAndCancel)
    * [var http2errReqBodyTooLong](#http2errReqBodyTooLong)
    * [var http2errClosedResponseBody](#http2errClosedResponseBody)
    * [var http2errResponseHeaderListSize](#http2errResponseHeaderListSize)
    * [var http2errRequestHeaderListSize](#http2errRequestHeaderListSize)
    * [var http2noBody](#http2noBody)
    * [var timeFormats](#timeFormats)
    * [var headerNewlineToSpace](#headerNewlineToSpace)
    * [var headerSorterPool](#headerSorterPool)
    * [var aLongTimeAgo](#aLongTimeAgo)
    * [var omitBundledHTTP2](#omitBundledHTTP2)
    * [var NoBody](#NoBody)
    * [var ErrMissingFile](#ErrMissingFile)
    * [var ErrNotSupported](#ErrNotSupported)
    * [var ErrUnexpectedTrailer](#ErrUnexpectedTrailer)
    * [var ErrMissingBoundary](#ErrMissingBoundary)
    * [var ErrNotMultipart](#ErrNotMultipart)
    * [var ErrHeaderTooLong](#ErrHeaderTooLong)
    * [var ErrShortBody](#ErrShortBody)
    * [var ErrMissingContentLength](#ErrMissingContentLength)
    * [var reqWriteExcludeHeader](#reqWriteExcludeHeader)
    * [var ErrNoCookie](#ErrNoCookie)
    * [var multipartByReader](#multipartByReader)
    * [var errMissingHost](#errMissingHost)
    * [var textprotoReaderPool](#textprotoReaderPool)
    * [var respExcludeHeader](#respExcludeHeader)
    * [var ErrNoLocation](#ErrNoLocation)
    * [var ErrBodyNotAllowed](#ErrBodyNotAllowed)
    * [var ErrHijacked](#ErrHijacked)
    * [var ErrContentLength](#ErrContentLength)
    * [var ErrWriteAfterFlush](#ErrWriteAfterFlush)
    * [var ServerContextKey](#ServerContextKey)
    * [var LocalAddrContextKey](#LocalAddrContextKey)
    * [var crlf](#crlf)
    * [var colonSpace](#colonSpace)
    * [var bufioReaderPool](#bufioReaderPool)
    * [var bufioWriter2kPool](#bufioWriter2kPool)
    * [var bufioWriter4kPool](#bufioWriter4kPool)
    * [var copyBufPool](#copyBufPool)
    * [var errTooLarge](#errTooLarge)
    * [var extraHeaderKeys](#extraHeaderKeys)
    * [var headerContentLength](#headerContentLength)
    * [var headerDate](#headerDate)
    * [var ErrAbortHandler](#ErrAbortHandler)
    * [var htmlReplacer](#htmlReplacer)
    * [var DefaultServeMux](#DefaultServeMux)
    * [var defaultServeMux](#defaultServeMux)
    * [var stateName](#stateName)
    * [var silenceSemWarnContextKey](#silenceSemWarnContextKey)
    * [var testHookServerServe](#testHookServerServe)
    * [var ErrServerClosed](#ErrServerClosed)
    * [var ErrHandlerTimeout](#ErrHandlerTimeout)
    * [var uniqNameMu](#uniqNameMu)
    * [var uniqNameNext](#uniqNameNext)
    * [var sniffSignatures](#sniffSignatures)
    * [var mp4ftype](#mp4ftype)
    * [var mp4](#mp4)
    * [var socksnoDeadline](#socksnoDeadline)
    * [var socksaLongTimeAgo](#socksaLongTimeAgo)
    * [var statusText](#statusText)
    * [var ErrLineTooLong](#ErrLineTooLong)
    * [var suppressedHeaders304](#suppressedHeaders304)
    * [var suppressedHeadersNoBody](#suppressedHeadersNoBody)
    * [var ErrBodyReadAfterClose](#ErrBodyReadAfterClose)
    * [var singleCRLF](#singleCRLF)
    * [var doubleCRLF](#doubleCRLF)
    * [var errTrailerEOF](#errTrailerEOF)
    * [var nopCloserType](#nopCloserType)
    * [var DefaultTransport](#DefaultTransport)
    * [var errCannotRewind](#errCannotRewind)
    * [var ErrSkipAltProtocol](#ErrSkipAltProtocol)
    * [var envProxyOnce](#envProxyOnce)
    * [var envProxyFuncValue](#envProxyFuncValue)
    * [var errKeepAlivesDisabled](#errKeepAlivesDisabled)
    * [var errConnBroken](#errConnBroken)
    * [var errCloseIdle](#errCloseIdle)
    * [var errTooManyIdle](#errTooManyIdle)
    * [var errTooManyIdleHost](#errTooManyIdleHost)
    * [var errCloseIdleConns](#errCloseIdleConns)
    * [var errReadLoopExiting](#errReadLoopExiting)
    * [var errIdleConnTimeout](#errIdleConnTimeout)
    * [var errServerClosedIdle](#errServerClosedIdle)
    * [var zeroDialer](#zeroDialer)
    * [var errCallerOwnsConn](#errCallerOwnsConn)
    * [var errTimeout](#errTimeout)
    * [var errRequestCanceled](#errRequestCanceled)
    * [var errRequestCanceledConn](#errRequestCanceledConn)
    * [var testHookEnterRoundTrip](#testHookEnterRoundTrip)
    * [var testHookWaitResLoop](#testHookWaitResLoop)
    * [var testHookRoundTripRetried](#testHookRoundTripRetried)
    * [var testHookPrePendingDial](#testHookPrePendingDial)
    * [var testHookPostPendingDial](#testHookPostPendingDial)
    * [var testHookMu](#testHookMu)
    * [var testHookReadLoopBeforeNextRead](#testHookReadLoopBeforeNextRead)
    * [var portMap](#portMap)
    * [var errReadOnClosedResBody](#errReadOnClosedResBody)
    * [var writeSetCookiesTests](#writeSetCookiesTests)
    * [var addCookieTests](#addCookieTests)
    * [var readSetCookiesTests](#readSetCookiesTests)
    * [var readCookiesTests](#readCookiesTests)
    * [var DefaultUserAgent](#DefaultUserAgent)
    * [var NewLoggingConn](#NewLoggingConn)
    * [var ExportAppendTime](#ExportAppendTime)
    * [var ExportRefererForURL](#ExportRefererForURL)
    * [var ExportServerNewConn](#ExportServerNewConn)
    * [var ExportCloseWriteAndWait](#ExportCloseWriteAndWait)
    * [var ExportErrRequestCanceled](#ExportErrRequestCanceled)
    * [var ExportErrRequestCanceledConn](#ExportErrRequestCanceledConn)
    * [var ExportErrServerClosedIdle](#ExportErrServerClosedIdle)
    * [var ExportServeFile](#ExportServeFile)
    * [var ExportScanETag](#ExportScanETag)
    * [var ExportHttp2ConfigureServer](#ExportHttp2ConfigureServer)
    * [var Export_shouldCopyHeaderOnRedirect](#Export_shouldCopyHeaderOnRedirect)
    * [var Export_writeStatusLine](#Export_writeStatusLine)
    * [var Export_is408Message](#Export_is408Message)
    * [var SetEnterRoundTripHook](#SetEnterRoundTripHook)
    * [var SetRoundTripRetried](#SetRoundTripRetried)
    * [var headerWriteTests](#headerWriteTests)
    * [var parseTimeTests](#parseTimeTests)
    * [var hasTokenTests](#hasTokenTests)
    * [var testHeader](#testHeader)
    * [var buf](#buf)
    * [var valuesCount](#valuesCount)
    * [var forbiddenStringsFunctions](#forbiddenStringsFunctions)
    * [var cacheKeysTests](#cacheKeysTests)
    * [var ParseRangeTests](#ParseRangeTests)
    * [var noError](#noError)
    * [var noBodyStr](#noBodyStr)
    * [var noTrailer](#noTrailer)
    * [var reqTests](#reqTests)
    * [var badRequestTests](#badRequestTests)
    * [var reqWriteTests](#reqWriteTests)
    * [var respTests](#respTests)
    * [var readResponseCloseInMiddleTests](#readResponseCloseInMiddleTests)
    * [var responseLocationTests](#responseLocationTests)
* [Types](#type)
    * [type Client struct](#Client)
        * [func (c *Client) send(req *Request, deadline time.Time) (resp *Response, didTimeout func() bool, err error)](#Client.send)
        * [func (c *Client) deadline() time.Time](#Client.deadline)
        * [func (c *Client) transport() RoundTripper](#Client.transport)
        * [func (c *Client) Get(url string) (resp *Response, err error)](#Client.Get)
        * [func (c *Client) checkRedirect(req *Request, via []*Request) error](#Client.checkRedirect)
        * [func (c *Client) Do(req *Request) (*Response, error)](#Client.Do)
        * [func (c *Client) do(req *Request) (retres *Response, reterr error)](#Client.do)
        * [func (c *Client) makeHeadersCopier(ireq *Request) func(*Request)](#Client.makeHeadersCopier)
        * [func (c *Client) Post(url, contentType string, body io.Reader) (resp *Response, err error)](#Client.Post)
        * [func (c *Client) PostForm(url string, data url.Values) (resp *Response, err error)](#Client.PostForm)
        * [func (c *Client) Head(url string) (resp *Response, err error)](#Client.Head)
        * [func (c *Client) CloseIdleConnections()](#Client.CloseIdleConnections)
    * [type RoundTripper interface](#RoundTripper)
        * [func NewFileTransport(fs FileSystem) RoundTripper](#NewFileTransport)
    * [type cancelTimerBody struct](#cancelTimerBody)
        * [func (b *cancelTimerBody) Read(p []byte) (n int, err error)](#cancelTimerBody.Read)
        * [func (b *cancelTimerBody) Close() error](#cancelTimerBody.Close)
    * [type Cookie struct](#Cookie)
        * [func (c *Cookie) String() string](#Cookie.String)
    * [type SameSite int](#SameSite)
    * [type fileTransport struct](#fileTransport)
        * [func (t fileTransport) RoundTrip(req *Request) (resp *Response, err error)](#fileTransport.RoundTrip)
    * [type populateResponse struct](#populateResponse)
        * [func newPopulateResponseWriter() (*populateResponse, <-chan *Response)](#newPopulateResponseWriter)
        * [func (pr *populateResponse) finish()](#populateResponse.finish)
        * [func (pr *populateResponse) sendResponse()](#populateResponse.sendResponse)
        * [func (pr *populateResponse) Header() Header](#populateResponse.Header)
        * [func (pr *populateResponse) WriteHeader(code int)](#populateResponse.WriteHeader)
        * [func (pr *populateResponse) Write(p []byte) (n int, err error)](#populateResponse.Write)
    * [type Dir string](#Dir)
        * [func (d Dir) Open(name string) (File, error)](#Dir.Open)
    * [type FileSystem interface](#FileSystem)
        * [func FS(fsys fs.FS) FileSystem](#FS)
    * [type File interface](#File)
    * [type anyDirs interface](#anyDirs)
    * [type fileInfoDirs []fs.FileInfo](#fileInfoDirs)
        * [func (d fileInfoDirs) len() int](#fileInfoDirs.len)
        * [func (d fileInfoDirs) isDir(i int) bool](#fileInfoDirs.isDir)
        * [func (d fileInfoDirs) name(i int) string](#fileInfoDirs.name)
    * [type dirEntryDirs []fs.DirEntry](#dirEntryDirs)
        * [func (d dirEntryDirs) len() int](#dirEntryDirs.len)
        * [func (d dirEntryDirs) isDir(i int) bool](#dirEntryDirs.isDir)
        * [func (d dirEntryDirs) name(i int) string](#dirEntryDirs.name)
    * [type condResult int](#condResult)
        * [func checkIfMatch(w ResponseWriter, r *Request) condResult](#checkIfMatch)
        * [func checkIfUnmodifiedSince(r *Request, modtime time.Time) condResult](#checkIfUnmodifiedSince)
        * [func checkIfNoneMatch(w ResponseWriter, r *Request) condResult](#checkIfNoneMatch)
        * [func checkIfModifiedSince(r *Request, modtime time.Time) condResult](#checkIfModifiedSince)
        * [func checkIfRange(w ResponseWriter, r *Request, modtime time.Time) condResult](#checkIfRange)
    * [type fileHandler struct](#fileHandler)
        * [func (f *fileHandler) ServeHTTP(w ResponseWriter, r *Request)](#fileHandler.ServeHTTP)
    * [type ioFS struct](#ioFS)
        * [func (f ioFS) Open(name string) (File, error)](#ioFS.Open)
    * [type ioFile struct](#ioFile)
        * [func (f ioFile) Close() error](#ioFile.Close)
        * [func (f ioFile) Read(b []byte) (int, error)](#ioFile.Read)
        * [func (f ioFile) Stat() (fs.FileInfo, error)](#ioFile.Stat)
        * [func (f ioFile) Seek(offset int64, whence int) (int64, error)](#ioFile.Seek)
        * [func (f ioFile) ReadDir(count int) ([]fs.DirEntry, error)](#ioFile.ReadDir)
        * [func (f ioFile) Readdir(count int) ([]fs.FileInfo, error)](#ioFile.Readdir)
    * [type httpRange struct](#httpRange)
        * [func (r httpRange) contentRange(size int64) string](#httpRange.contentRange)
        * [func (r httpRange) mimeHeader(contentType string, size int64) textproto.MIMEHeader](#httpRange.mimeHeader)
    * [type countingWriter int64](#countingWriter)
        * [func (w *countingWriter) Write(p []byte) (n int, err error)](#countingWriter.Write)
    * [type http2ClientConnPool interface](#http2ClientConnPool)
    * [type http2clientConnPoolIdleCloser interface](#http2clientConnPoolIdleCloser)
    * [type http2clientConnPool struct](#http2clientConnPool)
        * [func (p *http2clientConnPool) GetClientConn(req *Request, addr string) (*http2ClientConn, error)](#http2clientConnPool.GetClientConn)
        * [func (p *http2clientConnPool) shouldTraceGetConn(st http2clientConnIdleState) bool](#http2clientConnPool.shouldTraceGetConn)
        * [func (p *http2clientConnPool) getClientConn(req *Request, addr string, dialOnMiss bool) (*http2ClientConn, error)](#http2clientConnPool.getClientConn)
        * [func (p *http2clientConnPool) getStartDialLocked(ctx context.Context, addr string) *http2dialCall](#http2clientConnPool.getStartDialLocked)
        * [func (p *http2clientConnPool) addConnIfNeeded(key string, t *http2Transport, c *tls.Conn) (used bool, err error)](#http2clientConnPool.addConnIfNeeded)
        * [func (p *http2clientConnPool) addConnLocked(key string, cc *http2ClientConn)](#http2clientConnPool.addConnLocked)
        * [func (p *http2clientConnPool) MarkDead(cc *http2ClientConn)](#http2clientConnPool.MarkDead)
        * [func (p *http2clientConnPool) closeIdleConnections()](#http2clientConnPool.closeIdleConnections)
    * [type http2dialCall struct](#http2dialCall)
        * [func (c *http2dialCall) dial(ctx context.Context, addr string)](#http2dialCall.dial)
    * [type http2addConnCall struct](#http2addConnCall)
        * [func (c *http2addConnCall) run(t *http2Transport, key string, tc *tls.Conn)](#http2addConnCall.run)
    * [type http2noDialClientConnPool struct](#http2noDialClientConnPool)
        * [func (p http2noDialClientConnPool) GetClientConn(req *Request, addr string) (*http2ClientConn, error)](#http2noDialClientConnPool.GetClientConn)
    * [type http2dataBuffer struct](#http2dataBuffer)
        * [func (b *http2dataBuffer) Read(p []byte) (int, error)](#http2dataBuffer.Read)
        * [func (b *http2dataBuffer) bytesFromFirstChunk() []byte](#http2dataBuffer.bytesFromFirstChunk)
        * [func (b *http2dataBuffer) Len() int](#http2dataBuffer.Len)
        * [func (b *http2dataBuffer) Write(p []byte) (int, error)](#http2dataBuffer.Write)
        * [func (b *http2dataBuffer) lastChunkOrAlloc(want int64) []byte](#http2dataBuffer.lastChunkOrAlloc)
    * [type http2ErrCode uint32](#http2ErrCode)
        * [func (e http2ErrCode) String() string](#http2ErrCode.String)
    * [type http2ConnectionError http.http2ErrCode](#http2ConnectionError)
        * [func (e http2ConnectionError) Error() string](#http2ConnectionError.Error)
    * [type http2StreamError struct](#http2StreamError)
        * [func http2streamError(id uint32, code http2ErrCode) http2StreamError](#http2streamError)
        * [func (e http2StreamError) Error() string](#http2StreamError.Error)
        * [func (se http2StreamError) writeFrame(ctx http2writeContext) error](#http2StreamError.writeFrame)
        * [func (se http2StreamError) staysWithinBuffer(max int) bool](#http2StreamError.staysWithinBuffer)
    * [type http2goAwayFlowError struct{}](#http2goAwayFlowError)
        * [func (http2goAwayFlowError) Error() string](#http2goAwayFlowError.Error)
    * [type http2connError struct](#http2connError)
        * [func (e http2connError) Error() string](#http2connError.Error)
    * [type http2pseudoHeaderError string](#http2pseudoHeaderError)
        * [func (e http2pseudoHeaderError) Error() string](#http2pseudoHeaderError.Error)
    * [type http2duplicatePseudoHeaderError string](#http2duplicatePseudoHeaderError)
        * [func (e http2duplicatePseudoHeaderError) Error() string](#http2duplicatePseudoHeaderError.Error)
    * [type http2headerFieldNameError string](#http2headerFieldNameError)
        * [func (e http2headerFieldNameError) Error() string](#http2headerFieldNameError.Error)
    * [type http2headerFieldValueError string](#http2headerFieldValueError)
        * [func (e http2headerFieldValueError) Error() string](#http2headerFieldValueError.Error)
    * [type http2flow struct](#http2flow)
        * [func (f *http2flow) setConnFlow(cf *http2flow)](#http2flow.setConnFlow)
        * [func (f *http2flow) available() int32](#http2flow.available)
        * [func (f *http2flow) take(n int32)](#http2flow.take)
        * [func (f *http2flow) add(n int32) bool](#http2flow.add)
    * [type http2FrameType uint8](#http2FrameType)
        * [func (t http2FrameType) String() string](#http2FrameType.String)
    * [type http2Flags uint8](#http2Flags)
        * [func (f http2Flags) Has(v http2Flags) bool](#http2Flags.Has)
    * [type http2frameParser func(fc *std/net/http.http2frameCache, fh std/net/http.http2FrameHeader, payload []byte) (std/net/http.http2Frame, error)](#http2frameParser)
        * [func http2typeFrameParser(t http2FrameType) http2frameParser](#http2typeFrameParser)
    * [type http2FrameHeader struct](#http2FrameHeader)
        * [func http2ReadFrameHeader(r io.Reader) (http2FrameHeader, error)](#http2ReadFrameHeader)
        * [func http2readFrameHeader(buf []byte, r io.Reader) (http2FrameHeader, error)](#http2readFrameHeader)
        * [func (h http2FrameHeader) Header() http2FrameHeader](#http2FrameHeader.Header)
        * [func (h http2FrameHeader) String() string](#http2FrameHeader.String)
        * [func (h http2FrameHeader) writeDebug(buf *bytes.Buffer)](#http2FrameHeader.writeDebug)
        * [func (h *http2FrameHeader) checkValid()](#http2FrameHeader.checkValid)
        * [func (h *http2FrameHeader) invalidate()](#http2FrameHeader.invalidate)
    * [type http2Frame interface](#http2Frame)
        * [func http2parseDataFrame(fc *http2frameCache, fh http2FrameHeader, payload []byte) (http2Frame, error)](#http2parseDataFrame)
        * [func http2parseSettingsFrame(_ *http2frameCache, fh http2FrameHeader, p []byte) (http2Frame, error)](#http2parseSettingsFrame)
        * [func http2parsePingFrame(_ *http2frameCache, fh http2FrameHeader, payload []byte) (http2Frame, error)](#http2parsePingFrame)
        * [func http2parseGoAwayFrame(_ *http2frameCache, fh http2FrameHeader, p []byte) (http2Frame, error)](#http2parseGoAwayFrame)
        * [func http2parseUnknownFrame(_ *http2frameCache, fh http2FrameHeader, p []byte) (http2Frame, error)](#http2parseUnknownFrame)
        * [func http2parseWindowUpdateFrame(_ *http2frameCache, fh http2FrameHeader, p []byte) (http2Frame, error)](#http2parseWindowUpdateFrame)
        * [func http2parseHeadersFrame(_ *http2frameCache, fh http2FrameHeader, p []byte) (_ http2Frame, err error)](#http2parseHeadersFrame)
        * [func http2parsePriorityFrame(_ *http2frameCache, fh http2FrameHeader, payload []byte) (http2Frame, error)](#http2parsePriorityFrame)
        * [func http2parseRSTStreamFrame(_ *http2frameCache, fh http2FrameHeader, p []byte) (http2Frame, error)](#http2parseRSTStreamFrame)
        * [func http2parseContinuationFrame(_ *http2frameCache, fh http2FrameHeader, p []byte) (http2Frame, error)](#http2parseContinuationFrame)
        * [func http2parsePushPromise(_ *http2frameCache, fh http2FrameHeader, p []byte) (_ http2Frame, err error)](#http2parsePushPromise)
    * [type http2Framer struct](#http2Framer)
        * [func http2NewFramer(w io.Writer, r io.Reader) *http2Framer](#http2NewFramer)
        * [func (fr *http2Framer) maxHeaderListSize() uint32](#http2Framer.maxHeaderListSize)
        * [func (f *http2Framer) startWrite(ftype http2FrameType, flags http2Flags, streamID uint32)](#http2Framer.startWrite)
        * [func (f *http2Framer) endWrite() error](#http2Framer.endWrite)
        * [func (f *http2Framer) logWrite()](#http2Framer.logWrite)
        * [func (f *http2Framer) writeByte(v byte)](#http2Framer.writeByte)
        * [func (f *http2Framer) writeBytes(v []byte)](#http2Framer.writeBytes)
        * [func (f *http2Framer) writeUint16(v uint16)](#http2Framer.writeUint16)
        * [func (f *http2Framer) writeUint32(v uint32)](#http2Framer.writeUint32)
        * [func (fr *http2Framer) SetReuseFrames()](#http2Framer.SetReuseFrames)
        * [func (fr *http2Framer) SetMaxReadFrameSize(v uint32)](#http2Framer.SetMaxReadFrameSize)
        * [func (fr *http2Framer) ErrorDetail() error](#http2Framer.ErrorDetail)
        * [func (fr *http2Framer) ReadFrame() (http2Frame, error)](#http2Framer.ReadFrame)
        * [func (fr *http2Framer) connError(code http2ErrCode, reason string) error](#http2Framer.connError)
        * [func (fr *http2Framer) checkFrameOrder(f http2Frame) error](#http2Framer.checkFrameOrder)
        * [func (f *http2Framer) WriteData(streamID uint32, endStream bool, data []byte) error](#http2Framer.WriteData)
        * [func (f *http2Framer) WriteDataPadded(streamID uint32, endStream bool, data, pad []byte) error](#http2Framer.WriteDataPadded)
        * [func (f *http2Framer) WriteSettings(settings ...http2Setting) error](#http2Framer.WriteSettings)
        * [func (f *http2Framer) WriteSettingsAck() error](#http2Framer.WriteSettingsAck)
        * [func (f *http2Framer) WritePing(ack bool, data [8]byte) error](#http2Framer.WritePing)
        * [func (f *http2Framer) WriteGoAway(maxStreamID uint32, code http2ErrCode, debugData []byte) error](#http2Framer.WriteGoAway)
        * [func (f *http2Framer) WriteWindowUpdate(streamID, incr uint32) error](#http2Framer.WriteWindowUpdate)
        * [func (f *http2Framer) WriteHeaders(p http2HeadersFrameParam) error](#http2Framer.WriteHeaders)
        * [func (f *http2Framer) WritePriority(streamID uint32, p http2PriorityParam) error](#http2Framer.WritePriority)
        * [func (f *http2Framer) WriteRSTStream(streamID uint32, code http2ErrCode) error](#http2Framer.WriteRSTStream)
        * [func (f *http2Framer) WriteContinuation(streamID uint32, endHeaders bool, headerBlockFragment []byte) error](#http2Framer.WriteContinuation)
        * [func (f *http2Framer) WritePushPromise(p http2PushPromiseParam) error](#http2Framer.WritePushPromise)
        * [func (f *http2Framer) WriteRawFrame(t http2FrameType, flags http2Flags, streamID uint32, payload []byte) error](#http2Framer.WriteRawFrame)
        * [func (fr *http2Framer) maxHeaderStringLen() int](#http2Framer.maxHeaderStringLen)
        * [func (fr *http2Framer) readMetaFrame(hf *http2HeadersFrame) (*http2MetaHeadersFrame, error)](#http2Framer.readMetaFrame)
    * [type http2frameCache struct](#http2frameCache)
        * [func (fc *http2frameCache) getDataFrame() *http2DataFrame](#http2frameCache.getDataFrame)
    * [type http2DataFrame struct](#http2DataFrame)
        * [func (f *http2DataFrame) StreamEnded() bool](#http2DataFrame.StreamEnded)
        * [func (f *http2DataFrame) Data() []byte](#http2DataFrame.Data)
    * [type http2SettingsFrame struct](#http2SettingsFrame)
        * [func (f *http2SettingsFrame) IsAck() bool](#http2SettingsFrame.IsAck)
        * [func (f *http2SettingsFrame) Value(id http2SettingID) (v uint32, ok bool)](#http2SettingsFrame.Value)
        * [func (f *http2SettingsFrame) Setting(i int) http2Setting](#http2SettingsFrame.Setting)
        * [func (f *http2SettingsFrame) NumSettings() int](#http2SettingsFrame.NumSettings)
        * [func (f *http2SettingsFrame) HasDuplicates() bool](#http2SettingsFrame.HasDuplicates)
        * [func (f *http2SettingsFrame) ForeachSetting(fn func(http2Setting) error) error](#http2SettingsFrame.ForeachSetting)
    * [type http2PingFrame struct](#http2PingFrame)
        * [func (f *http2PingFrame) IsAck() bool](#http2PingFrame.IsAck)
    * [type http2GoAwayFrame struct](#http2GoAwayFrame)
        * [func (f *http2GoAwayFrame) DebugData() []byte](#http2GoAwayFrame.DebugData)
    * [type http2UnknownFrame struct](#http2UnknownFrame)
        * [func (f *http2UnknownFrame) Payload() []byte](#http2UnknownFrame.Payload)
    * [type http2WindowUpdateFrame struct](#http2WindowUpdateFrame)
    * [type http2HeadersFrame struct](#http2HeadersFrame)
        * [func (f *http2HeadersFrame) HeaderBlockFragment() []byte](#http2HeadersFrame.HeaderBlockFragment)
        * [func (f *http2HeadersFrame) HeadersEnded() bool](#http2HeadersFrame.HeadersEnded)
        * [func (f *http2HeadersFrame) StreamEnded() bool](#http2HeadersFrame.StreamEnded)
        * [func (f *http2HeadersFrame) HasPriority() bool](#http2HeadersFrame.HasPriority)
    * [type http2HeadersFrameParam struct](#http2HeadersFrameParam)
    * [type http2PriorityFrame struct](#http2PriorityFrame)
    * [type http2PriorityParam struct](#http2PriorityParam)
        * [func (p http2PriorityParam) IsZero() bool](#http2PriorityParam.IsZero)
    * [type http2RSTStreamFrame struct](#http2RSTStreamFrame)
    * [type http2ContinuationFrame struct](#http2ContinuationFrame)
        * [func (f *http2ContinuationFrame) HeaderBlockFragment() []byte](#http2ContinuationFrame.HeaderBlockFragment)
        * [func (f *http2ContinuationFrame) HeadersEnded() bool](#http2ContinuationFrame.HeadersEnded)
    * [type http2PushPromiseFrame struct](#http2PushPromiseFrame)
        * [func (f *http2PushPromiseFrame) HeaderBlockFragment() []byte](#http2PushPromiseFrame.HeaderBlockFragment)
        * [func (f *http2PushPromiseFrame) HeadersEnded() bool](#http2PushPromiseFrame.HeadersEnded)
    * [type http2PushPromiseParam struct](#http2PushPromiseParam)
    * [type http2streamEnder interface](#http2streamEnder)
    * [type http2headersEnder interface](#http2headersEnder)
    * [type http2headersOrContinuation interface](#http2headersOrContinuation)
    * [type http2MetaHeadersFrame struct](#http2MetaHeadersFrame)
        * [func (mh *http2MetaHeadersFrame) PseudoValue(pseudo string) string](#http2MetaHeadersFrame.PseudoValue)
        * [func (mh *http2MetaHeadersFrame) RegularFields() []hpack.HeaderField](#http2MetaHeadersFrame.RegularFields)
        * [func (mh *http2MetaHeadersFrame) PseudoFields() []hpack.HeaderField](#http2MetaHeadersFrame.PseudoFields)
        * [func (mh *http2MetaHeadersFrame) checkPseudos() error](#http2MetaHeadersFrame.checkPseudos)
    * [type http2goroutineLock uint64](#http2goroutineLock)
        * [func http2newGoroutineLock() http2goroutineLock](#http2newGoroutineLock)
        * [func (g http2goroutineLock) check()](#http2goroutineLock.check)
        * [func (g http2goroutineLock) checkNotOn()](#http2goroutineLock.checkNotOn)
    * [type http2streamState int](#http2streamState)
        * [func (st http2streamState) String() string](#http2streamState.String)
    * [type http2Setting struct](#http2Setting)
        * [func (s http2Setting) String() string](#http2Setting.String)
        * [func (s http2Setting) Valid() error](#http2Setting.Valid)
    * [type http2SettingID uint16](#http2SettingID)
        * [func (s http2SettingID) String() string](#http2SettingID.String)
    * [type http2stringWriter interface](#http2stringWriter)
    * [type http2gate chan struct{}](#http2gate)
        * [func (g http2gate) Done()](#http2gate.Done)
        * [func (g http2gate) Wait()](#http2gate.Wait)
    * [type http2closeWaiter chan struct{}](#http2closeWaiter)
        * [func (cw *http2closeWaiter) Init()](#http2closeWaiter.Init)
        * [func (cw http2closeWaiter) Close()](#http2closeWaiter.Close)
        * [func (cw http2closeWaiter) Wait()](#http2closeWaiter.Wait)
    * [type http2bufferedWriter struct](#http2bufferedWriter)
        * [func http2newBufferedWriter(w io.Writer) *http2bufferedWriter](#http2newBufferedWriter)
        * [func (w *http2bufferedWriter) Available() int](#http2bufferedWriter.Available)
        * [func (w *http2bufferedWriter) Write(p []byte) (n int, err error)](#http2bufferedWriter.Write)
        * [func (w *http2bufferedWriter) Flush() error](#http2bufferedWriter.Flush)
    * [type http2httpError struct](#http2httpError)
        * [func (e *http2httpError) Error() string](#http2httpError.Error)
        * [func (e *http2httpError) Timeout() bool](#http2httpError.Timeout)
        * [func (e *http2httpError) Temporary() bool](#http2httpError.Temporary)
    * [type http2connectionStater interface](#http2connectionStater)
    * [type http2sorter struct](#http2sorter)
        * [func (s *http2sorter) Len() int](#http2sorter.Len)
        * [func (s *http2sorter) Swap(i, j int)](#http2sorter.Swap)
        * [func (s *http2sorter) Less(i, j int) bool](#http2sorter.Less)
        * [func (s *http2sorter) Keys(h Header) []string](#http2sorter.Keys)
        * [func (s *http2sorter) SortStrings(ss []string)](#http2sorter.SortStrings)
    * [type http2incomparable [0]func()](#http2incomparable)
    * [type http2pipe struct](#http2pipe)
        * [func (p *http2pipe) Len() int](#http2pipe.Len)
        * [func (p *http2pipe) Read(d []byte) (n int, err error)](#http2pipe.Read)
        * [func (p *http2pipe) Write(d []byte) (n int, err error)](#http2pipe.Write)
        * [func (p *http2pipe) CloseWithError(err error)](#http2pipe.CloseWithError)
        * [func (p *http2pipe) BreakWithError(err error)](#http2pipe.BreakWithError)
        * [func (p *http2pipe) closeWithErrorAndCode(err error, fn func())](#http2pipe.closeWithErrorAndCode)
        * [func (p *http2pipe) closeWithError(dst *error, err error, fn func())](#http2pipe.closeWithError)
        * [func (p *http2pipe) closeDoneLocked()](#http2pipe.closeDoneLocked)
        * [func (p *http2pipe) Err() error](#http2pipe.Err)
        * [func (p *http2pipe) Done() <-chan struct{}](#http2pipe.Done)
    * [type http2pipeBuffer interface](#http2pipeBuffer)
    * [type http2Server struct](#http2Server)
        * [func (s *http2Server) initialConnRecvWindowSize() int32](#http2Server.initialConnRecvWindowSize)
        * [func (s *http2Server) initialStreamRecvWindowSize() int32](#http2Server.initialStreamRecvWindowSize)
        * [func (s *http2Server) maxReadFrameSize() uint32](#http2Server.maxReadFrameSize)
        * [func (s *http2Server) maxConcurrentStreams() uint32](#http2Server.maxConcurrentStreams)
        * [func (s *http2Server) maxQueuedControlFrames() int](#http2Server.maxQueuedControlFrames)
        * [func (s *http2Server) ServeConn(c net.Conn, opts *http2ServeConnOpts)](#http2Server.ServeConn)
    * [type http2serverInternalState struct](#http2serverInternalState)
        * [func (s *http2serverInternalState) registerConn(sc *http2serverConn)](#http2serverInternalState.registerConn)
        * [func (s *http2serverInternalState) unregisterConn(sc *http2serverConn)](#http2serverInternalState.unregisterConn)
        * [func (s *http2serverInternalState) startGracefulShutdown()](#http2serverInternalState.startGracefulShutdown)
    * [type http2ServeConnOpts struct](#http2ServeConnOpts)
        * [func (o *http2ServeConnOpts) context() context.Context](#http2ServeConnOpts.context)
        * [func (o *http2ServeConnOpts) baseConfig() *Server](#http2ServeConnOpts.baseConfig)
        * [func (o *http2ServeConnOpts) handler() Handler](#http2ServeConnOpts.handler)
    * [type http2serverConn struct](#http2serverConn)
        * [func (sc *http2serverConn) rejectConn(err http2ErrCode, debug string)](#http2serverConn.rejectConn)
        * [func (sc *http2serverConn) maxHeaderListSize() uint32](#http2serverConn.maxHeaderListSize)
        * [func (sc *http2serverConn) curOpenStreams() uint32](#http2serverConn.curOpenStreams)
        * [func (sc *http2serverConn) Framer() *http2Framer](#http2serverConn.Framer)
        * [func (sc *http2serverConn) CloseConn() error](#http2serverConn.CloseConn)
        * [func (sc *http2serverConn) Flush() error](#http2serverConn.Flush)
        * [func (sc *http2serverConn) HeaderEncoder() (*hpack.Encoder, *bytes.Buffer)](#http2serverConn.HeaderEncoder)
        * [func (sc *http2serverConn) state(streamID uint32) (http2streamState, *http2stream)](#http2serverConn.state)
        * [func (sc *http2serverConn) setConnState(state ConnState)](#http2serverConn.setConnState)
        * [func (sc *http2serverConn) vlogf(format string, args ...interface{})](#http2serverConn.vlogf)
        * [func (sc *http2serverConn) logf(format string, args ...interface{})](#http2serverConn.logf)
        * [func (sc *http2serverConn) condlogf(err error, format string, args ...interface{})](#http2serverConn.condlogf)
        * [func (sc *http2serverConn) canonicalHeader(v string) string](#http2serverConn.canonicalHeader)
        * [func (sc *http2serverConn) readFrames()](#http2serverConn.readFrames)
        * [func (sc *http2serverConn) writeFrameAsync(wr http2FrameWriteRequest)](#http2serverConn.writeFrameAsync)
        * [func (sc *http2serverConn) closeAllStreamsOnConnClose()](#http2serverConn.closeAllStreamsOnConnClose)
        * [func (sc *http2serverConn) stopShutdownTimer()](#http2serverConn.stopShutdownTimer)
        * [func (sc *http2serverConn) notePanic()](#http2serverConn.notePanic)
        * [func (sc *http2serverConn) serve()](#http2serverConn.serve)
        * [func (sc *http2serverConn) awaitGracefulShutdown(sharedCh <-chan struct{}, privateCh chan struct{})](#http2serverConn.awaitGracefulShutdown)
        * [func (sc *http2serverConn) onSettingsTimer()](#http2serverConn.onSettingsTimer)
        * [func (sc *http2serverConn) onIdleTimer()](#http2serverConn.onIdleTimer)
        * [func (sc *http2serverConn) onShutdownTimer()](#http2serverConn.onShutdownTimer)
        * [func (sc *http2serverConn) sendServeMsg(msg interface{})](#http2serverConn.sendServeMsg)
        * [func (sc *http2serverConn) readPreface() error](#http2serverConn.readPreface)
        * [func (sc *http2serverConn) writeDataFromHandler(stream *http2stream, data []byte, endStream bool) error](#http2serverConn.writeDataFromHandler)
        * [func (sc *http2serverConn) writeFrameFromHandler(wr http2FrameWriteRequest) error](#http2serverConn.writeFrameFromHandler)
        * [func (sc *http2serverConn) writeFrame(wr http2FrameWriteRequest)](#http2serverConn.writeFrame)
        * [func (sc *http2serverConn) startFrameWrite(wr http2FrameWriteRequest)](#http2serverConn.startFrameWrite)
        * [func (sc *http2serverConn) wroteFrame(res http2frameWriteResult)](#http2serverConn.wroteFrame)
        * [func (sc *http2serverConn) scheduleFrameWrite()](#http2serverConn.scheduleFrameWrite)
        * [func (sc *http2serverConn) startGracefulShutdown()](#http2serverConn.startGracefulShutdown)
        * [func (sc *http2serverConn) startGracefulShutdownInternal()](#http2serverConn.startGracefulShutdownInternal)
        * [func (sc *http2serverConn) goAway(code http2ErrCode)](#http2serverConn.goAway)
        * [func (sc *http2serverConn) shutDownIn(d time.Duration)](#http2serverConn.shutDownIn)
        * [func (sc *http2serverConn) resetStream(se http2StreamError)](#http2serverConn.resetStream)
        * [func (sc *http2serverConn) processFrameFromReader(res http2readFrameResult) bool](#http2serverConn.processFrameFromReader)
        * [func (sc *http2serverConn) processFrame(f http2Frame) error](#http2serverConn.processFrame)
        * [func (sc *http2serverConn) processPing(f *http2PingFrame) error](#http2serverConn.processPing)
        * [func (sc *http2serverConn) processWindowUpdate(f *http2WindowUpdateFrame) error](#http2serverConn.processWindowUpdate)
        * [func (sc *http2serverConn) processResetStream(f *http2RSTStreamFrame) error](#http2serverConn.processResetStream)
        * [func (sc *http2serverConn) closeStream(st *http2stream, err error)](#http2serverConn.closeStream)
        * [func (sc *http2serverConn) processSettings(f *http2SettingsFrame) error](#http2serverConn.processSettings)
        * [func (sc *http2serverConn) processSetting(s http2Setting) error](#http2serverConn.processSetting)
        * [func (sc *http2serverConn) processSettingInitialWindowSize(val uint32) error](#http2serverConn.processSettingInitialWindowSize)
        * [func (sc *http2serverConn) processData(f *http2DataFrame) error](#http2serverConn.processData)
        * [func (sc *http2serverConn) processGoAway(f *http2GoAwayFrame) error](#http2serverConn.processGoAway)
        * [func (sc *http2serverConn) processHeaders(f *http2MetaHeadersFrame) error](#http2serverConn.processHeaders)
        * [func (sc *http2serverConn) processPriority(f *http2PriorityFrame) error](#http2serverConn.processPriority)
        * [func (sc *http2serverConn) newStream(id, pusherID uint32, state http2streamState) *http2stream](#http2serverConn.newStream)
        * [func (sc *http2serverConn) newWriterAndRequest(st *http2stream, f *http2MetaHeadersFrame) (*http2responseWriter, *Request, error)](#http2serverConn.newWriterAndRequest)
        * [func (sc *http2serverConn) newWriterAndRequestNoBody(st *http2stream, rp http2requestParam) (*http2responseWriter, *Request, error)](#http2serverConn.newWriterAndRequestNoBody)
        * [func (sc *http2serverConn) runHandler(rw *http2responseWriter, req *Request, handler func(ResponseWriter, *Request))](#http2serverConn.runHandler)
        * [func (sc *http2serverConn) writeHeaders(st *http2stream, headerData *http2writeResHeaders) error](#http2serverConn.writeHeaders)
        * [func (sc *http2serverConn) write100ContinueHeaders(st *http2stream)](#http2serverConn.write100ContinueHeaders)
        * [func (sc *http2serverConn) noteBodyReadFromHandler(st *http2stream, n int, err error)](#http2serverConn.noteBodyReadFromHandler)
        * [func (sc *http2serverConn) noteBodyRead(st *http2stream, n int)](#http2serverConn.noteBodyRead)
        * [func (sc *http2serverConn) sendWindowUpdate(st *http2stream, n int)](#http2serverConn.sendWindowUpdate)
        * [func (sc *http2serverConn) sendWindowUpdate32(st *http2stream, n int32)](#http2serverConn.sendWindowUpdate32)
        * [func (sc *http2serverConn) startPush(msg *http2startPushRequest)](#http2serverConn.startPush)
    * [type http2stream struct](#http2stream)
        * [func (st *http2stream) isPushed() bool](#http2stream.isPushed)
        * [func (st *http2stream) endStream()](#http2stream.endStream)
        * [func (st *http2stream) copyTrailersToHandlerRequest()](#http2stream.copyTrailersToHandlerRequest)
        * [func (st *http2stream) onWriteTimeout()](#http2stream.onWriteTimeout)
        * [func (st *http2stream) processTrailerHeaders(f *http2MetaHeadersFrame) error](#http2stream.processTrailerHeaders)
    * [type http2readFrameResult struct](#http2readFrameResult)
    * [type http2frameWriteResult struct](#http2frameWriteResult)
    * [type http2serverMessage int](#http2serverMessage)
    * [type http2requestParam struct](#http2requestParam)
    * [type http2bodyReadMsg struct](#http2bodyReadMsg)
    * [type http2requestBody struct](#http2requestBody)
        * [func (b *http2requestBody) Close() error](#http2requestBody.Close)
        * [func (b *http2requestBody) Read(p []byte) (n int, err error)](#http2requestBody.Read)
    * [type http2responseWriter struct](#http2responseWriter)
        * [func (w *http2responseWriter) Flush()](#http2responseWriter.Flush)
        * [func (w *http2responseWriter) CloseNotify() <-chan bool](#http2responseWriter.CloseNotify)
        * [func (w *http2responseWriter) Header() Header](#http2responseWriter.Header)
        * [func (w *http2responseWriter) WriteHeader(code int)](#http2responseWriter.WriteHeader)
        * [func (w *http2responseWriter) Write(p []byte) (n int, err error)](#http2responseWriter.Write)
        * [func (w *http2responseWriter) WriteString(s string) (n int, err error)](#http2responseWriter.WriteString)
        * [func (w *http2responseWriter) write(lenData int, dataB []byte, dataS string) (n int, err error)](#http2responseWriter.write)
        * [func (w *http2responseWriter) handlerDone()](#http2responseWriter.handlerDone)
        * [func (w *http2responseWriter) Push(target string, opts *PushOptions) error](#http2responseWriter.Push)
    * [type http2responseWriterState struct](#http2responseWriterState)
        * [func (rws *http2responseWriterState) hasTrailers() bool](#http2responseWriterState.hasTrailers)
        * [func (rws *http2responseWriterState) hasNonemptyTrailers() bool](#http2responseWriterState.hasNonemptyTrailers)
        * [func (rws *http2responseWriterState) declareTrailer(k string)](#http2responseWriterState.declareTrailer)
        * [func (rws *http2responseWriterState) writeChunk(p []byte) (n int, err error)](#http2responseWriterState.writeChunk)
        * [func (rws *http2responseWriterState) promoteUndeclaredTrailers()](#http2responseWriterState.promoteUndeclaredTrailers)
        * [func (rws *http2responseWriterState) writeHeader(code int)](#http2responseWriterState.writeHeader)
    * [type http2chunkWriter struct](#http2chunkWriter)
        * [func (cw http2chunkWriter) Write(p []byte) (n int, err error)](#http2chunkWriter.Write)
    * [type http2startPushRequest struct](#http2startPushRequest)
    * [type http2Transport struct](#http2Transport)
        * [func http2ConfigureTransports(t1 *Transport) (*http2Transport, error)](#http2ConfigureTransports)
        * [func http2configureTransports(t1 *Transport) (*http2Transport, error)](#http2configureTransports)
        * [func (t *http2Transport) dialTLSWithContext(ctx context.Context, network, addr string, cfg *tls.Config) (*tls.Conn, error)](#http2Transport.dialTLSWithContext)
        * [func (t *http2Transport) maxHeaderListSize() uint32](#http2Transport.maxHeaderListSize)
        * [func (t *http2Transport) disableCompression() bool](#http2Transport.disableCompression)
        * [func (t *http2Transport) pingTimeout() time.Duration](#http2Transport.pingTimeout)
        * [func (t *http2Transport) connPool() http2ClientConnPool](#http2Transport.connPool)
        * [func (t *http2Transport) initConnPool()](#http2Transport.initConnPool)
        * [func (t *http2Transport) RoundTrip(req *Request) (*Response, error)](#http2Transport.RoundTrip)
        * [func (t *http2Transport) RoundTripOpt(req *Request, opt http2RoundTripOpt) (*Response, error)](#http2Transport.RoundTripOpt)
        * [func (t *http2Transport) CloseIdleConnections()](#http2Transport.CloseIdleConnections)
        * [func (t *http2Transport) dialClientConn(ctx context.Context, addr string, singleUse bool) (*http2ClientConn, error)](#http2Transport.dialClientConn)
        * [func (t *http2Transport) newTLSConfig(host string) *tls.Config](#http2Transport.newTLSConfig)
        * [func (t *http2Transport) dialTLS(ctx context.Context) func(string, string, *tls.Config) (net.Conn, error)](#http2Transport.dialTLS)
        * [func (t *http2Transport) disableKeepAlives() bool](#http2Transport.disableKeepAlives)
        * [func (t *http2Transport) expectContinueTimeout() time.Duration](#http2Transport.expectContinueTimeout)
        * [func (t *http2Transport) NewClientConn(c net.Conn) (*http2ClientConn, error)](#http2Transport.NewClientConn)
        * [func (t *http2Transport) newClientConn(c net.Conn, singleUse bool) (*http2ClientConn, error)](#http2Transport.newClientConn)
        * [func (t *http2Transport) vlogf(format string, args ...interface{})](#http2Transport.vlogf)
        * [func (t *http2Transport) logf(format string, args ...interface{})](#http2Transport.logf)
        * [func (t *http2Transport) getBodyWriterState(cs *http2clientStream, body io.Reader) (s http2bodyWriterState)](#http2Transport.getBodyWriterState)
        * [func (t *http2Transport) idleConnTimeout() time.Duration](#http2Transport.idleConnTimeout)
    * [type http2ClientConn struct](#http2ClientConn)
        * [func (cc *http2ClientConn) healthCheck()](#http2ClientConn.healthCheck)
        * [func (cc *http2ClientConn) setGoAway(f *http2GoAwayFrame)](#http2ClientConn.setGoAway)
        * [func (cc *http2ClientConn) CanTakeNewRequest() bool](#http2ClientConn.CanTakeNewRequest)
        * [func (cc *http2ClientConn) idleState() http2clientConnIdleState](#http2ClientConn.idleState)
        * [func (cc *http2ClientConn) idleStateLocked() (st http2clientConnIdleState)](#http2ClientConn.idleStateLocked)
        * [func (cc *http2ClientConn) canTakeNewRequestLocked() bool](#http2ClientConn.canTakeNewRequestLocked)
        * [func (cc *http2ClientConn) tooIdleLocked() bool](#http2ClientConn.tooIdleLocked)
        * [func (cc *http2ClientConn) onIdleTimeout()](#http2ClientConn.onIdleTimeout)
        * [func (cc *http2ClientConn) closeIfIdle()](#http2ClientConn.closeIfIdle)
        * [func (cc *http2ClientConn) Shutdown(ctx context.Context) error](#http2ClientConn.Shutdown)
        * [func (cc *http2ClientConn) sendGoAway() error](#http2ClientConn.sendGoAway)
        * [func (cc *http2ClientConn) closeForError(err error) error](#http2ClientConn.closeForError)
        * [func (cc *http2ClientConn) Close() error](#http2ClientConn.Close)
        * [func (cc *http2ClientConn) closeForLostPing() error](#http2ClientConn.closeForLostPing)
        * [func (cc *http2ClientConn) frameScratchBuffer() []byte](#http2ClientConn.frameScratchBuffer)
        * [func (cc *http2ClientConn) putFrameScratchBuffer(buf []byte)](#http2ClientConn.putFrameScratchBuffer)
        * [func (cc *http2ClientConn) responseHeaderTimeout() time.Duration](#http2ClientConn.responseHeaderTimeout)
        * [func (cc *http2ClientConn) RoundTrip(req *Request) (*Response, error)](#http2ClientConn.RoundTrip)
        * [func (cc *http2ClientConn) roundTrip(req *Request) (res *Response, gotErrAfterReqBodyWrite bool, err error)](#http2ClientConn.roundTrip)
        * [func (cc *http2ClientConn) awaitOpenSlotForRequest(req *Request) error](#http2ClientConn.awaitOpenSlotForRequest)
        * [func (cc *http2ClientConn) writeHeaders(streamID uint32, endStream bool, maxFrameSize int, hdrs []byte) error](#http2ClientConn.writeHeaders)
        * [func (cc *http2ClientConn) encodeHeaders(req *Request, addGzipHeader bool, trailers string, contentLength int64) ([]byte, error)](#http2ClientConn.encodeHeaders)
        * [func (cc *http2ClientConn) encodeTrailers(req *Request) ([]byte, error)](#http2ClientConn.encodeTrailers)
        * [func (cc *http2ClientConn) writeHeader(name, value string)](#http2ClientConn.writeHeader)
        * [func (cc *http2ClientConn) newStream() *http2clientStream](#http2ClientConn.newStream)
        * [func (cc *http2ClientConn) forgetStreamID(id uint32)](#http2ClientConn.forgetStreamID)
        * [func (cc *http2ClientConn) streamByID(id uint32, andRemove bool) *http2clientStream](#http2ClientConn.streamByID)
        * [func (cc *http2ClientConn) readLoop()](#http2ClientConn.readLoop)
        * [func (cc *http2ClientConn) Ping(ctx context.Context) error](#http2ClientConn.Ping)
        * [func (cc *http2ClientConn) writeStreamReset(streamID uint32, code http2ErrCode, err error)](#http2ClientConn.writeStreamReset)
        * [func (cc *http2ClientConn) logf(format string, args ...interface{})](#http2ClientConn.logf)
        * [func (cc *http2ClientConn) vlogf(format string, args ...interface{})](#http2ClientConn.vlogf)
    * [type http2clientStream struct](#http2clientStream)
        * [func (cs *http2clientStream) get1xxTraceFunc() func(int, textproto.MIMEHeader) error](#http2clientStream.get1xxTraceFunc)
        * [func (cs *http2clientStream) awaitRequestCancel(req *Request)](#http2clientStream.awaitRequestCancel)
        * [func (cs *http2clientStream) cancelStream()](#http2clientStream.cancelStream)
        * [func (cs *http2clientStream) checkResetOrDone() error](#http2clientStream.checkResetOrDone)
        * [func (cs *http2clientStream) getStartedWrite() bool](#http2clientStream.getStartedWrite)
        * [func (cs *http2clientStream) abortRequestBodyWrite(err error)](#http2clientStream.abortRequestBodyWrite)
        * [func (cs *http2clientStream) writeRequestBody(body io.Reader, bodyCloser io.Closer) (err error)](#http2clientStream.writeRequestBody)
        * [func (cs *http2clientStream) awaitFlowControl(maxBytes int) (taken int32, err error)](#http2clientStream.awaitFlowControl)
        * [func (cs *http2clientStream) copyTrailers()](#http2clientStream.copyTrailers)
    * [type http2stickyErrWriter struct](#http2stickyErrWriter)
        * [func (sew http2stickyErrWriter) Write(p []byte) (n int, err error)](#http2stickyErrWriter.Write)
    * [type http2noCachedConnError struct{}](#http2noCachedConnError)
        * [func (http2noCachedConnError) IsHTTP2NoCachedConnError()](#http2noCachedConnError.IsHTTP2NoCachedConnError)
        * [func (http2noCachedConnError) Error() string](#http2noCachedConnError.Error)
    * [type http2RoundTripOpt struct](#http2RoundTripOpt)
    * [type http2clientConnIdleState struct](#http2clientConnIdleState)
    * [type http2resAndError struct](#http2resAndError)
    * [type http2clientConnReadLoop struct](#http2clientConnReadLoop)
        * [func (rl *http2clientConnReadLoop) cleanup()](#http2clientConnReadLoop.cleanup)
        * [func (rl *http2clientConnReadLoop) run() error](#http2clientConnReadLoop.run)
        * [func (rl *http2clientConnReadLoop) processHeaders(f *http2MetaHeadersFrame) error](#http2clientConnReadLoop.processHeaders)
        * [func (rl *http2clientConnReadLoop) handleResponse(cs *http2clientStream, f *http2MetaHeadersFrame) (*Response, error)](#http2clientConnReadLoop.handleResponse)
        * [func (rl *http2clientConnReadLoop) processTrailers(cs *http2clientStream, f *http2MetaHeadersFrame) error](#http2clientConnReadLoop.processTrailers)
        * [func (rl *http2clientConnReadLoop) processData(f *http2DataFrame) error](#http2clientConnReadLoop.processData)
        * [func (rl *http2clientConnReadLoop) endStream(cs *http2clientStream)](#http2clientConnReadLoop.endStream)
        * [func (rl *http2clientConnReadLoop) endStreamError(cs *http2clientStream, err error)](#http2clientConnReadLoop.endStreamError)
        * [func (rl *http2clientConnReadLoop) processGoAway(f *http2GoAwayFrame) error](#http2clientConnReadLoop.processGoAway)
        * [func (rl *http2clientConnReadLoop) processSettings(f *http2SettingsFrame) error](#http2clientConnReadLoop.processSettings)
        * [func (rl *http2clientConnReadLoop) processWindowUpdate(f *http2WindowUpdateFrame) error](#http2clientConnReadLoop.processWindowUpdate)
        * [func (rl *http2clientConnReadLoop) processResetStream(f *http2RSTStreamFrame) error](#http2clientConnReadLoop.processResetStream)
        * [func (rl *http2clientConnReadLoop) processPing(f *http2PingFrame) error](#http2clientConnReadLoop.processPing)
        * [func (rl *http2clientConnReadLoop) processPushPromise(f *http2PushPromiseFrame) error](#http2clientConnReadLoop.processPushPromise)
    * [type http2GoAwayError struct](#http2GoAwayError)
        * [func (e http2GoAwayError) Error() string](#http2GoAwayError.Error)
    * [type http2transportResponseBody struct](#http2transportResponseBody)
        * [func (b http2transportResponseBody) Read(p []byte) (n int, err error)](#http2transportResponseBody.Read)
        * [func (b http2transportResponseBody) Close() error](#http2transportResponseBody.Close)
    * [type http2erringRoundTripper struct](#http2erringRoundTripper)
        * [func (rt http2erringRoundTripper) RoundTripErr() error](#http2erringRoundTripper.RoundTripErr)
        * [func (rt http2erringRoundTripper) RoundTrip(*Request) (*Response, error)](#http2erringRoundTripper.RoundTrip)
    * [type http2gzipReader struct](#http2gzipReader)
        * [func (gz *http2gzipReader) Read(p []byte) (n int, err error)](#http2gzipReader.Read)
        * [func (gz *http2gzipReader) Close() error](#http2gzipReader.Close)
    * [type http2errorReader struct](#http2errorReader)
        * [func (r http2errorReader) Read(p []byte) (int, error)](#http2errorReader.Read)
    * [type http2bodyWriterState struct](#http2bodyWriterState)
        * [func (s http2bodyWriterState) cancel()](#http2bodyWriterState.cancel)
        * [func (s http2bodyWriterState) on100()](#http2bodyWriterState.on100)
        * [func (s http2bodyWriterState) scheduleBodyWrite()](#http2bodyWriterState.scheduleBodyWrite)
    * [type http2noDialH2RoundTripper struct](#http2noDialH2RoundTripper)
        * [func (rt http2noDialH2RoundTripper) RoundTrip(req *Request) (*Response, error)](#http2noDialH2RoundTripper.RoundTrip)
    * [type http2writeFramer interface](#http2writeFramer)
    * [type http2writeContext interface](#http2writeContext)
    * [type http2flushFrameWriter struct{}](#http2flushFrameWriter)
        * [func (http2flushFrameWriter) writeFrame(ctx http2writeContext) error](#http2flushFrameWriter.writeFrame)
        * [func (http2flushFrameWriter) staysWithinBuffer(max int) bool](#http2flushFrameWriter.staysWithinBuffer)
    * [type http2writeSettings []http.http2Setting](#http2writeSettings)
        * [func (s http2writeSettings) staysWithinBuffer(max int) bool](#http2writeSettings.staysWithinBuffer)
        * [func (s http2writeSettings) writeFrame(ctx http2writeContext) error](#http2writeSettings.writeFrame)
    * [type http2writeGoAway struct](#http2writeGoAway)
        * [func (p *http2writeGoAway) writeFrame(ctx http2writeContext) error](#http2writeGoAway.writeFrame)
        * [func (*http2writeGoAway) staysWithinBuffer(max int) bool](#http2writeGoAway.staysWithinBuffer)
    * [type http2writeData struct](#http2writeData)
        * [func (w *http2writeData) String() string](#http2writeData.String)
        * [func (w *http2writeData) writeFrame(ctx http2writeContext) error](#http2writeData.writeFrame)
        * [func (w *http2writeData) staysWithinBuffer(max int) bool](#http2writeData.staysWithinBuffer)
    * [type http2handlerPanicRST struct](#http2handlerPanicRST)
        * [func (hp http2handlerPanicRST) writeFrame(ctx http2writeContext) error](#http2handlerPanicRST.writeFrame)
        * [func (hp http2handlerPanicRST) staysWithinBuffer(max int) bool](#http2handlerPanicRST.staysWithinBuffer)
    * [type http2writePingAck struct](#http2writePingAck)
        * [func (w http2writePingAck) writeFrame(ctx http2writeContext) error](#http2writePingAck.writeFrame)
        * [func (w http2writePingAck) staysWithinBuffer(max int) bool](#http2writePingAck.staysWithinBuffer)
    * [type http2writeSettingsAck struct{}](#http2writeSettingsAck)
        * [func (http2writeSettingsAck) writeFrame(ctx http2writeContext) error](#http2writeSettingsAck.writeFrame)
        * [func (http2writeSettingsAck) staysWithinBuffer(max int) bool](#http2writeSettingsAck.staysWithinBuffer)
    * [type http2writeResHeaders struct](#http2writeResHeaders)
        * [func (w *http2writeResHeaders) staysWithinBuffer(max int) bool](#http2writeResHeaders.staysWithinBuffer)
        * [func (w *http2writeResHeaders) writeFrame(ctx http2writeContext) error](#http2writeResHeaders.writeFrame)
        * [func (w *http2writeResHeaders) writeHeaderBlock(ctx http2writeContext, frag []byte, firstFrag, lastFrag bool) error](#http2writeResHeaders.writeHeaderBlock)
    * [type http2writePushPromise struct](#http2writePushPromise)
        * [func (w *http2writePushPromise) staysWithinBuffer(max int) bool](#http2writePushPromise.staysWithinBuffer)
        * [func (w *http2writePushPromise) writeFrame(ctx http2writeContext) error](#http2writePushPromise.writeFrame)
        * [func (w *http2writePushPromise) writeHeaderBlock(ctx http2writeContext, frag []byte, firstFrag, lastFrag bool) error](#http2writePushPromise.writeHeaderBlock)
    * [type http2write100ContinueHeadersFrame struct](#http2write100ContinueHeadersFrame)
        * [func (w http2write100ContinueHeadersFrame) writeFrame(ctx http2writeContext) error](#http2write100ContinueHeadersFrame.writeFrame)
        * [func (w http2write100ContinueHeadersFrame) staysWithinBuffer(max int) bool](#http2write100ContinueHeadersFrame.staysWithinBuffer)
    * [type http2writeWindowUpdate struct](#http2writeWindowUpdate)
        * [func (wu http2writeWindowUpdate) staysWithinBuffer(max int) bool](#http2writeWindowUpdate.staysWithinBuffer)
        * [func (wu http2writeWindowUpdate) writeFrame(ctx http2writeContext) error](#http2writeWindowUpdate.writeFrame)
    * [type http2WriteScheduler interface](#http2WriteScheduler)
        * [func http2NewPriorityWriteScheduler(cfg *http2PriorityWriteSchedulerConfig) http2WriteScheduler](#http2NewPriorityWriteScheduler)
        * [func http2NewRandomWriteScheduler() http2WriteScheduler](#http2NewRandomWriteScheduler)
    * [type http2OpenStreamOptions struct](#http2OpenStreamOptions)
    * [type http2FrameWriteRequest struct](#http2FrameWriteRequest)
        * [func (wr http2FrameWriteRequest) StreamID() uint32](#http2FrameWriteRequest.StreamID)
        * [func (wr http2FrameWriteRequest) isControl() bool](#http2FrameWriteRequest.isControl)
        * [func (wr http2FrameWriteRequest) DataSize() int](#http2FrameWriteRequest.DataSize)
        * [func (wr http2FrameWriteRequest) Consume(n int32) (http2FrameWriteRequest, http2FrameWriteRequest, int)](#http2FrameWriteRequest.Consume)
        * [func (wr http2FrameWriteRequest) String() string](#http2FrameWriteRequest.String)
        * [func (wr *http2FrameWriteRequest) replyToWriter(err error)](#http2FrameWriteRequest.replyToWriter)
    * [type http2writeQueue struct](#http2writeQueue)
        * [func (q *http2writeQueue) empty() bool](#http2writeQueue.empty)
        * [func (q *http2writeQueue) push(wr http2FrameWriteRequest)](#http2writeQueue.push)
        * [func (q *http2writeQueue) shift() http2FrameWriteRequest](#http2writeQueue.shift)
        * [func (q *http2writeQueue) consume(n int32) (http2FrameWriteRequest, bool)](#http2writeQueue.consume)
    * [type http2writeQueuePool []*http.http2writeQueue](#http2writeQueuePool)
        * [func (p *http2writeQueuePool) put(q *http2writeQueue)](#http2writeQueuePool.put)
        * [func (p *http2writeQueuePool) get() *http2writeQueue](#http2writeQueuePool.get)
    * [type http2PriorityWriteSchedulerConfig struct](#http2PriorityWriteSchedulerConfig)
    * [type http2priorityNodeState int](#http2priorityNodeState)
    * [type http2priorityNode struct](#http2priorityNode)
        * [func (n *http2priorityNode) setParent(parent *http2priorityNode)](#http2priorityNode.setParent)
        * [func (n *http2priorityNode) addBytes(b int64)](#http2priorityNode.addBytes)
        * [func (n *http2priorityNode) walkReadyInOrder(openParent bool, tmp *[]*http2priorityNode, f func(*http2priorityNode, bool) bool) bool](#http2priorityNode.walkReadyInOrder)
    * [type http2sortPriorityNodeSiblings []*http.http2priorityNode](#http2sortPriorityNodeSiblings)
        * [func (z http2sortPriorityNodeSiblings) Len() int](#http2sortPriorityNodeSiblings.Len)
        * [func (z http2sortPriorityNodeSiblings) Swap(i, k int)](#http2sortPriorityNodeSiblings.Swap)
        * [func (z http2sortPriorityNodeSiblings) Less(i, k int) bool](#http2sortPriorityNodeSiblings.Less)
    * [type http2priorityWriteScheduler struct](#http2priorityWriteScheduler)
        * [func (ws *http2priorityWriteScheduler) OpenStream(streamID uint32, options http2OpenStreamOptions)](#http2priorityWriteScheduler.OpenStream)
        * [func (ws *http2priorityWriteScheduler) CloseStream(streamID uint32)](#http2priorityWriteScheduler.CloseStream)
        * [func (ws *http2priorityWriteScheduler) AdjustStream(streamID uint32, priority http2PriorityParam)](#http2priorityWriteScheduler.AdjustStream)
        * [func (ws *http2priorityWriteScheduler) Push(wr http2FrameWriteRequest)](#http2priorityWriteScheduler.Push)
        * [func (ws *http2priorityWriteScheduler) Pop() (wr http2FrameWriteRequest, ok bool)](#http2priorityWriteScheduler.Pop)
        * [func (ws *http2priorityWriteScheduler) addClosedOrIdleNode(list *[]*http2priorityNode, maxSize int, n *http2priorityNode)](#http2priorityWriteScheduler.addClosedOrIdleNode)
        * [func (ws *http2priorityWriteScheduler) removeNode(n *http2priorityNode)](#http2priorityWriteScheduler.removeNode)
    * [type http2randomWriteScheduler struct](#http2randomWriteScheduler)
        * [func (ws *http2randomWriteScheduler) OpenStream(streamID uint32, options http2OpenStreamOptions)](#http2randomWriteScheduler.OpenStream)
        * [func (ws *http2randomWriteScheduler) CloseStream(streamID uint32)](#http2randomWriteScheduler.CloseStream)
        * [func (ws *http2randomWriteScheduler) AdjustStream(streamID uint32, priority http2PriorityParam)](#http2randomWriteScheduler.AdjustStream)
        * [func (ws *http2randomWriteScheduler) Push(wr http2FrameWriteRequest)](#http2randomWriteScheduler.Push)
        * [func (ws *http2randomWriteScheduler) Pop() (http2FrameWriteRequest, bool)](#http2randomWriteScheduler.Pop)
    * [type Header map[string][]string](#Header)
        * [func cloneOrMakeHeader(hdr Header) Header](#cloneOrMakeHeader)
        * [func http2cloneHeader(h Header) Header](#http2cloneHeader)
        * [func fixTrailer(header Header, chunked bool) (Header, error)](#fixTrailer)
        * [func (h Header) Add(key, value string)](#Header.Add)
        * [func (h Header) Set(key, value string)](#Header.Set)
        * [func (h Header) Get(key string) string](#Header.Get)
        * [func (h Header) Values(key string) []string](#Header.Values)
        * [func (h Header) get(key string) string](#Header.get)
        * [func (h Header) has(key string) bool](#Header.has)
        * [func (h Header) Del(key string)](#Header.Del)
        * [func (h Header) Write(w io.Writer) error](#Header.Write)
        * [func (h Header) write(w io.Writer, trace *httptrace.ClientTrace) error](#Header.write)
        * [func (h Header) Clone() Header](#Header.Clone)
        * [func (h Header) sortedKeyValues(exclude map[string]bool) (kvs []keyValues, hs *headerSorter)](#Header.sortedKeyValues)
        * [func (h Header) WriteSubset(w io.Writer, exclude map[string]bool) error](#Header.WriteSubset)
        * [func (h Header) writeSubset(w io.Writer, exclude map[string]bool, trace *httptrace.ClientTrace) error](#Header.writeSubset)
    * [type stringWriter struct](#stringWriter)
        * [func (w stringWriter) WriteString(s string) (n int, err error)](#stringWriter.WriteString)
    * [type keyValues struct](#keyValues)
    * [type headerSorter struct](#headerSorter)
        * [func (s *headerSorter) Len() int](#headerSorter.Len)
        * [func (s *headerSorter) Swap(i, j int)](#headerSorter.Swap)
        * [func (s *headerSorter) Less(i, j int) bool](#headerSorter.Less)
    * [type incomparable [0]func()](#incomparable)
    * [type contextKey struct](#contextKey)
        * [func (k *contextKey) String() string](#contextKey.String)
    * [type noBody struct{}](#noBody)
        * [func (noBody) Read([]byte) (int, error)](#noBody.Read)
        * [func (noBody) Close() error](#noBody.Close)
        * [func (noBody) WriteTo(io.Writer) (int64, error)](#noBody.WriteTo)
    * [type PushOptions struct](#PushOptions)
    * [type Pusher interface](#Pusher)
    * [type CookieJar interface](#CookieJar)
    * [type ProtocolError struct](#ProtocolError)
        * [func (pe *ProtocolError) Error() string](#ProtocolError.Error)
    * [type Request struct](#Request)
        * [func http2shouldRetryRequest(req *Request, err error, afterBodyWrite bool) (*Request, error)](#http2shouldRetryRequest)
        * [func NewRequest(method, url string, body io.Reader) (*Request, error)](#NewRequest)
        * [func NewRequestWithContext(ctx context.Context, method, url string, body io.Reader) (*Request, error)](#NewRequestWithContext)
        * [func ReadRequest(b *bufio.Reader) (*Request, error)](#ReadRequest)
        * [func readRequest(b *bufio.Reader) (req *Request, err error)](#readRequest)
        * [func setupRewindBody(req *Request) *Request](#setupRewindBody)
        * [func rewindBody(req *Request) (rewound *Request, err error)](#rewindBody)
        * [func dummyReq(method string) *Request](#dummyReq)
        * [func dummyReq11(method string) *Request](#dummyReq11)
        * [func dummyRequest(method string) *Request](#dummyRequest)
        * [func dummyRequestWithBody(method string) *Request](#dummyRequestWithBody)
        * [func dummyRequestWithBodyNoGetBody(method string) *Request](#dummyRequestWithBodyNoGetBody)
        * [func (r *Request) Context() context.Context](#Request.Context)
        * [func (r *Request) WithContext(ctx context.Context) *Request](#Request.WithContext)
        * [func (r *Request) Clone(ctx context.Context) *Request](#Request.Clone)
        * [func (r *Request) ProtoAtLeast(major, minor int) bool](#Request.ProtoAtLeast)
        * [func (r *Request) UserAgent() string](#Request.UserAgent)
        * [func (r *Request) Cookies() []*Cookie](#Request.Cookies)
        * [func (r *Request) Cookie(name string) (*Cookie, error)](#Request.Cookie)
        * [func (r *Request) AddCookie(c *Cookie)](#Request.AddCookie)
        * [func (r *Request) Referer() string](#Request.Referer)
        * [func (r *Request) MultipartReader() (*multipart.Reader, error)](#Request.MultipartReader)
        * [func (r *Request) multipartReader(allowMixed bool) (*multipart.Reader, error)](#Request.multipartReader)
        * [func (r *Request) isH2Upgrade() bool](#Request.isH2Upgrade)
        * [func (r *Request) Write(w io.Writer) error](#Request.Write)
        * [func (r *Request) WriteProxy(w io.Writer) error](#Request.WriteProxy)
        * [func (r *Request) write(w io.Writer, usingProxy bool, extraHeaders Header, waitForContinue func() bool) (err error)](#Request.write)
        * [func (r *Request) BasicAuth() (username, password string, ok bool)](#Request.BasicAuth)
        * [func (r *Request) SetBasicAuth(username, password string)](#Request.SetBasicAuth)
        * [func (r *Request) ParseForm() error](#Request.ParseForm)
        * [func (r *Request) ParseMultipartForm(maxMemory int64) error](#Request.ParseMultipartForm)
        * [func (r *Request) FormValue(key string) string](#Request.FormValue)
        * [func (r *Request) PostFormValue(key string) string](#Request.PostFormValue)
        * [func (r *Request) FormFile(key string) (multipart.File, *multipart.FileHeader, error)](#Request.FormFile)
        * [func (r *Request) expectsContinue() bool](#Request.expectsContinue)
        * [func (r *Request) wantsHttp10KeepAlive() bool](#Request.wantsHttp10KeepAlive)
        * [func (r *Request) wantsClose() bool](#Request.wantsClose)
        * [func (r *Request) closeBody() error](#Request.closeBody)
        * [func (r *Request) isReplayable() bool](#Request.isReplayable)
        * [func (r *Request) outgoingLength() int64](#Request.outgoingLength)
        * [func (r *Request) requiresHTTP1() bool](#Request.requiresHTTP1)
        * [func (r *Request) WithT(t *testing.T) *Request](#Request.WithT)
        * [func (r *Request) ExportIsReplayable() bool](#Request.ExportIsReplayable)
    * [type requestBodyReadError struct](#requestBodyReadError)
    * [type maxBytesReader struct](#maxBytesReader)
        * [func (l *maxBytesReader) Read(p []byte) (n int, err error)](#maxBytesReader.Read)
        * [func (l *maxBytesReader) Close() error](#maxBytesReader.Close)
    * [type Response struct](#Response)
        * [func send(ireq *Request, rt RoundTripper, deadline time.Time) (resp *Response, didTimeout func() bool, err error)](#send)
        * [func Get(url string) (resp *Response, err error)](#Get)
        * [func Post(url, contentType string, body io.Reader) (resp *Response, err error)](#Post)
        * [func PostForm(url string, data url.Values) (resp *Response, err error)](#PostForm)
        * [func Head(url string) (resp *Response, err error)](#Head)
        * [func ReadResponse(r *bufio.Reader, req *Request) (*Response, error)](#ReadResponse)
        * [func (r *Response) Cookies() []*Cookie](#Response.Cookies)
        * [func (r *Response) Location() (*url.URL, error)](#Response.Location)
        * [func (r *Response) ProtoAtLeast(major, minor int) bool](#Response.ProtoAtLeast)
        * [func (r *Response) Write(w io.Writer) error](#Response.Write)
        * [func (r *Response) closeBody()](#Response.closeBody)
        * [func (r *Response) bodyIsWritable() bool](#Response.bodyIsWritable)
        * [func (r *Response) isProtocolSwitch() bool](#Response.isProtocolSwitch)
    * [type Handler interface](#Handler)
        * [func FileServer(root FileSystem) Handler](#FileServer)
        * [func NotFoundHandler() Handler](#NotFoundHandler)
        * [func StripPrefix(prefix string, h Handler) Handler](#StripPrefix)
        * [func RedirectHandler(url string, code int) Handler](#RedirectHandler)
        * [func AllowQuerySemicolons(h Handler) Handler](#AllowQuerySemicolons)
        * [func TimeoutHandler(h Handler, dt time.Duration, msg string) Handler](#TimeoutHandler)
        * [func NewTestTimeoutHandler(handler Handler, ch <-chan time.Time) Handler](#NewTestTimeoutHandler)
    * [type ResponseWriter interface](#ResponseWriter)
    * [type Flusher interface](#Flusher)
    * [type Hijacker interface](#Hijacker)
    * [type CloseNotifier interface](#CloseNotifier)
    * [type conn struct](#conn)
        * [func (c *conn) hijacked() bool](#conn.hijacked)
        * [func (c *conn) hijackLocked() (rwc net.Conn, buf *bufio.ReadWriter, err error)](#conn.hijackLocked)
        * [func (c *conn) readRequest(ctx context.Context) (w *response, err error)](#conn.readRequest)
        * [func (c *conn) finalFlush()](#conn.finalFlush)
        * [func (c *conn) close()](#conn.close)
        * [func (c *conn) closeWriteAndWait()](#conn.closeWriteAndWait)
        * [func (c *conn) setState(nc net.Conn, state ConnState, runHook bool)](#conn.setState)
        * [func (c *conn) getState() (state ConnState, unixSec int64)](#conn.getState)
        * [func (c *conn) serve(ctx context.Context)](#conn.serve)
    * [type chunkWriter struct](#chunkWriter)
        * [func (cw *chunkWriter) Write(p []byte) (n int, err error)](#chunkWriter.Write)
        * [func (cw *chunkWriter) flush()](#chunkWriter.flush)
        * [func (cw *chunkWriter) close()](#chunkWriter.close)
        * [func (cw *chunkWriter) writeHeader(p []byte)](#chunkWriter.writeHeader)
    * [type response struct](#response)
        * [func (w *response) finalTrailers() Header](#response.finalTrailers)
        * [func (w *response) declareTrailer(k string)](#response.declareTrailer)
        * [func (w *response) requestTooLarge()](#response.requestTooLarge)
        * [func (w *response) needsSniff() bool](#response.needsSniff)
        * [func (w *response) ReadFrom(src io.Reader) (n int64, err error)](#response.ReadFrom)
        * [func (w *response) Header() Header](#response.Header)
        * [func (w *response) WriteHeader(code int)](#response.WriteHeader)
        * [func (w *response) bodyAllowed() bool](#response.bodyAllowed)
        * [func (w *response) Write(data []byte) (n int, err error)](#response.Write)
        * [func (w *response) WriteString(data string) (n int, err error)](#response.WriteString)
        * [func (w *response) write(lenData int, dataB []byte, dataS string) (n int, err error)](#response.write)
        * [func (w *response) finishRequest()](#response.finishRequest)
        * [func (w *response) shouldReuseConnection() bool](#response.shouldReuseConnection)
        * [func (w *response) closedRequestBodyEarly() bool](#response.closedRequestBodyEarly)
        * [func (w *response) Flush()](#response.Flush)
        * [func (w *response) sendExpectationFailed()](#response.sendExpectationFailed)
        * [func (w *response) Hijack() (rwc net.Conn, buf *bufio.ReadWriter, err error)](#response.Hijack)
        * [func (w *response) CloseNotify() <-chan bool](#response.CloseNotify)
    * [type atomicBool int32](#atomicBool)
        * [func (b *atomicBool) isSet() bool](#atomicBool.isSet)
        * [func (b *atomicBool) setTrue()](#atomicBool.setTrue)
        * [func (b *atomicBool) setFalse()](#atomicBool.setFalse)
    * [type writerOnly struct](#writerOnly)
    * [type readResult struct](#readResult)
    * [type connReader struct](#connReader)
        * [func (cr *connReader) lock()](#connReader.lock)
        * [func (cr *connReader) unlock()](#connReader.unlock)
        * [func (cr *connReader) startBackgroundRead()](#connReader.startBackgroundRead)
        * [func (cr *connReader) backgroundRead()](#connReader.backgroundRead)
        * [func (cr *connReader) abortPendingRead()](#connReader.abortPendingRead)
        * [func (cr *connReader) setReadLimit(remain int64)](#connReader.setReadLimit)
        * [func (cr *connReader) setInfiniteReadLimit()](#connReader.setInfiniteReadLimit)
        * [func (cr *connReader) hitReadLimit() bool](#connReader.hitReadLimit)
        * [func (cr *connReader) handleReadError(_ error)](#connReader.handleReadError)
        * [func (cr *connReader) closeNotify()](#connReader.closeNotify)
        * [func (cr *connReader) Read(p []byte) (n int, err error)](#connReader.Read)
    * [type expectContinueReader struct](#expectContinueReader)
        * [func (ecr *expectContinueReader) Read(p []byte) (n int, err error)](#expectContinueReader.Read)
        * [func (ecr *expectContinueReader) Close() error](#expectContinueReader.Close)
    * [type extraHeader struct](#extraHeader)
        * [func (h extraHeader) Write(w *bufio.Writer)](#extraHeader.Write)
    * [type closeWriter interface](#closeWriter)
    * [type statusError struct](#statusError)
        * [func (e statusError) Error() string](#statusError.Error)
    * [type HandlerFunc func(std/net/http.ResponseWriter, *std/net/http.Request)](#HandlerFunc)
        * [func http2new400Handler(err error) HandlerFunc](#http2new400Handler)
        * [func (f HandlerFunc) ServeHTTP(w ResponseWriter, r *Request)](#HandlerFunc.ServeHTTP)
    * [type redirectHandler struct](#redirectHandler)
        * [func (rh *redirectHandler) ServeHTTP(w ResponseWriter, r *Request)](#redirectHandler.ServeHTTP)
    * [type ServeMux struct](#ServeMux)
        * [func NewServeMux() *ServeMux](#NewServeMux)
        * [func (mux *ServeMux) match(path string) (h Handler, pattern string)](#ServeMux.match)
        * [func (mux *ServeMux) redirectToPathSlash(host, path string, u *url.URL) (*url.URL, bool)](#ServeMux.redirectToPathSlash)
        * [func (mux *ServeMux) shouldRedirectRLocked(host, path string) bool](#ServeMux.shouldRedirectRLocked)
        * [func (mux *ServeMux) Handler(r *Request) (h Handler, pattern string)](#ServeMux.Handler)
        * [func (mux *ServeMux) handler(host, path string) (h Handler, pattern string)](#ServeMux.handler)
        * [func (mux *ServeMux) ServeHTTP(w ResponseWriter, r *Request)](#ServeMux.ServeHTTP)
        * [func (mux *ServeMux) Handle(pattern string, handler Handler)](#ServeMux.Handle)
        * [func (mux *ServeMux) HandleFunc(pattern string, handler func(ResponseWriter, *Request))](#ServeMux.HandleFunc)
    * [type muxEntry struct](#muxEntry)
    * [type Server struct](#Server)
        * [func (srv *Server) newConn(rwc net.Conn) *conn](#Server.newConn)
        * [func (srv *Server) maxHeaderBytes() int](#Server.maxHeaderBytes)
        * [func (srv *Server) initialReadLimitSize() int64](#Server.initialReadLimitSize)
        * [func (s *Server) getDoneChan() <-chan struct{}](#Server.getDoneChan)
        * [func (s *Server) getDoneChanLocked() chan struct{}](#Server.getDoneChanLocked)
        * [func (s *Server) closeDoneChanLocked()](#Server.closeDoneChanLocked)
        * [func (srv *Server) Close() error](#Server.Close)
        * [func (srv *Server) Shutdown(ctx context.Context) error](#Server.Shutdown)
        * [func (srv *Server) RegisterOnShutdown(f func())](#Server.RegisterOnShutdown)
        * [func (s *Server) numListeners() int](#Server.numListeners)
        * [func (s *Server) closeIdleConns() bool](#Server.closeIdleConns)
        * [func (s *Server) closeListenersLocked() error](#Server.closeListenersLocked)
        * [func (srv *Server) ListenAndServe() error](#Server.ListenAndServe)
        * [func (srv *Server) shouldConfigureHTTP2ForServe() bool](#Server.shouldConfigureHTTP2ForServe)
        * [func (srv *Server) Serve(l net.Listener) error](#Server.Serve)
        * [func (srv *Server) ServeTLS(l net.Listener, certFile, keyFile string) error](#Server.ServeTLS)
        * [func (s *Server) trackListener(ln *net.Listener, add bool) bool](#Server.trackListener)
        * [func (s *Server) trackConn(c *conn, add bool)](#Server.trackConn)
        * [func (s *Server) idleTimeout() time.Duration](#Server.idleTimeout)
        * [func (s *Server) readHeaderTimeout() time.Duration](#Server.readHeaderTimeout)
        * [func (s *Server) doKeepAlives() bool](#Server.doKeepAlives)
        * [func (s *Server) shuttingDown() bool](#Server.shuttingDown)
        * [func (srv *Server) SetKeepAlivesEnabled(v bool)](#Server.SetKeepAlivesEnabled)
        * [func (s *Server) logf(format string, args ...interface{})](#Server.logf)
        * [func (srv *Server) ListenAndServeTLS(certFile, keyFile string) error](#Server.ListenAndServeTLS)
        * [func (srv *Server) setupHTTP2_ServeTLS() error](#Server.setupHTTP2_ServeTLS)
        * [func (srv *Server) setupHTTP2_Serve() error](#Server.setupHTTP2_Serve)
        * [func (srv *Server) onceSetNextProtoDefaults_Serve()](#Server.onceSetNextProtoDefaults_Serve)
        * [func (srv *Server) onceSetNextProtoDefaults()](#Server.onceSetNextProtoDefaults)
        * [func (s *Server) ExportAllConnsIdle() bool](#Server.ExportAllConnsIdle)
        * [func (s *Server) ExportAllConnsByState() map[ConnState]int](#Server.ExportAllConnsByState)
    * [type ConnState int](#ConnState)
        * [func (c ConnState) String() string](#ConnState.String)
    * [type serverHandler struct](#serverHandler)
        * [func (sh serverHandler) ServeHTTP(rw ResponseWriter, req *Request)](#serverHandler.ServeHTTP)
    * [type timeoutHandler struct](#timeoutHandler)
        * [func (h *timeoutHandler) errorBody() string](#timeoutHandler.errorBody)
        * [func (h *timeoutHandler) ServeHTTP(w ResponseWriter, r *Request)](#timeoutHandler.ServeHTTP)
    * [type timeoutWriter struct](#timeoutWriter)
        * [func (tw *timeoutWriter) Push(target string, opts *PushOptions) error](#timeoutWriter.Push)
        * [func (tw *timeoutWriter) Header() Header](#timeoutWriter.Header)
        * [func (tw *timeoutWriter) Write(p []byte) (int, error)](#timeoutWriter.Write)
        * [func (tw *timeoutWriter) writeHeaderLocked(code int)](#timeoutWriter.writeHeaderLocked)
        * [func (tw *timeoutWriter) WriteHeader(code int)](#timeoutWriter.WriteHeader)
    * [type onceCloseListener struct](#onceCloseListener)
        * [func (oc *onceCloseListener) Close() error](#onceCloseListener.Close)
        * [func (oc *onceCloseListener) close()](#onceCloseListener.close)
    * [type globalOptionsHandler struct{}](#globalOptionsHandler)
        * [func (globalOptionsHandler) ServeHTTP(w ResponseWriter, r *Request)](#globalOptionsHandler.ServeHTTP)
    * [type initALPNRequest struct](#initALPNRequest)
        * [func (h initALPNRequest) BaseContext() context.Context](#initALPNRequest.BaseContext)
        * [func (h initALPNRequest) ServeHTTP(rw ResponseWriter, req *Request)](#initALPNRequest.ServeHTTP)
    * [type loggingConn struct](#loggingConn)
        * [func (c *loggingConn) Write(p []byte) (n int, err error)](#loggingConn.Write)
        * [func (c *loggingConn) Read(p []byte) (n int, err error)](#loggingConn.Read)
        * [func (c *loggingConn) Close() (err error)](#loggingConn.Close)
    * [type checkConnErrorWriter struct](#checkConnErrorWriter)
        * [func (w checkConnErrorWriter) Write(p []byte) (n int, err error)](#checkConnErrorWriter.Write)
    * [type sniffSig interface](#sniffSig)
    * [type exactSig struct](#exactSig)
        * [func (e *exactSig) match(data []byte, firstNonWS int) string](#exactSig.match)
    * [type maskedSig struct](#maskedSig)
        * [func (m *maskedSig) match(data []byte, firstNonWS int) string](#maskedSig.match)
    * [type htmlSig []byte](#htmlSig)
        * [func (h htmlSig) match(data []byte, firstNonWS int) string](#htmlSig.match)
    * [type mp4Sig struct{}](#mp4Sig)
        * [func (mp4Sig) match(data []byte, firstNonWS int) string](#mp4Sig.match)
    * [type textSig struct{}](#textSig)
        * [func (textSig) match(data []byte, firstNonWS int) string](#textSig.match)
    * [type socksCommand int](#socksCommand)
        * [func (cmd socksCommand) String() string](#socksCommand.String)
    * [type socksAuthMethod int](#socksAuthMethod)
    * [type socksReply int](#socksReply)
        * [func (code socksReply) String() string](#socksReply.String)
    * [type socksAddr struct](#socksAddr)
        * [func (a *socksAddr) Network() string](#socksAddr.Network)
        * [func (a *socksAddr) String() string](#socksAddr.String)
    * [type socksConn struct](#socksConn)
        * [func (c *socksConn) BoundAddr() net.Addr](#socksConn.BoundAddr)
    * [type socksDialer struct](#socksDialer)
        * [func socksNewDialer(network, address string) *socksDialer](#socksNewDialer)
        * [func (d *socksDialer) connect(ctx context.Context, c net.Conn, address string) (_ net.Addr, ctxErr error)](#socksDialer.connect)
        * [func (d *socksDialer) DialContext(ctx context.Context, network, address string) (net.Conn, error)](#socksDialer.DialContext)
        * [func (d *socksDialer) DialWithConn(ctx context.Context, c net.Conn, network, address string) (net.Addr, error)](#socksDialer.DialWithConn)
        * [func (d *socksDialer) Dial(network, address string) (net.Conn, error)](#socksDialer.Dial)
        * [func (d *socksDialer) validateTarget(network, address string) error](#socksDialer.validateTarget)
        * [func (d *socksDialer) pathAddrs(address string) (proxy, dst net.Addr, err error)](#socksDialer.pathAddrs)
    * [type socksUsernamePassword struct](#socksUsernamePassword)
        * [func (up *socksUsernamePassword) Authenticate(ctx context.Context, rw io.ReadWriter, auth socksAuthMethod) error](#socksUsernamePassword.Authenticate)
    * [type errorReader struct](#errorReader)
        * [func (r errorReader) Read(p []byte) (n int, err error)](#errorReader.Read)
    * [type byteReader struct](#byteReader)
        * [func (br *byteReader) Read(p []byte) (n int, err error)](#byteReader.Read)
    * [type transferWriter struct](#transferWriter)
        * [func newTransferWriter(r interface{}) (t *transferWriter, err error)](#newTransferWriter)
        * [func (t *transferWriter) shouldSendChunkedRequestBody() bool](#transferWriter.shouldSendChunkedRequestBody)
        * [func (t *transferWriter) probeRequestBody()](#transferWriter.probeRequestBody)
        * [func (t *transferWriter) shouldSendContentLength() bool](#transferWriter.shouldSendContentLength)
        * [func (t *transferWriter) writeHeader(w io.Writer, trace *httptrace.ClientTrace) error](#transferWriter.writeHeader)
        * [func (t *transferWriter) writeBody(w io.Writer) (err error)](#transferWriter.writeBody)
        * [func (t *transferWriter) doBodyCopy(dst io.Writer, src io.Reader) (n int64, err error)](#transferWriter.doBodyCopy)
        * [func (t *transferWriter) unwrapBody() io.Reader](#transferWriter.unwrapBody)
    * [type transferReader struct](#transferReader)
        * [func (t *transferReader) protoAtLeast(m, n int) bool](#transferReader.protoAtLeast)
        * [func (t *transferReader) parseTransferEncoding() error](#transferReader.parseTransferEncoding)
    * [type unsupportedTEError struct](#unsupportedTEError)
        * [func (uste *unsupportedTEError) Error() string](#unsupportedTEError.Error)
    * [type body struct](#body)
        * [func (b *body) Read(p []byte) (n int, err error)](#body.Read)
        * [func (b *body) readLocked(p []byte) (n int, err error)](#body.readLocked)
        * [func (b *body) readTrailer() error](#body.readTrailer)
        * [func (b *body) unreadDataSizeLocked() int64](#body.unreadDataSizeLocked)
        * [func (b *body) Close() error](#body.Close)
        * [func (b *body) didEarlyClose() bool](#body.didEarlyClose)
        * [func (b *body) bodyRemains() bool](#body.bodyRemains)
        * [func (b *body) registerOnHitEOF(fn func())](#body.registerOnHitEOF)
    * [type bodyLocked struct](#bodyLocked)
        * [func (bl bodyLocked) Read(p []byte) (n int, err error)](#bodyLocked.Read)
    * [type finishAsyncByteRead struct](#finishAsyncByteRead)
        * [func (fr finishAsyncByteRead) Read(p []byte) (n int, err error)](#finishAsyncByteRead.Read)
    * [type bufioFlushWriter struct](#bufioFlushWriter)
        * [func (fw bufioFlushWriter) Write(p []byte) (n int, err error)](#bufioFlushWriter.Write)
    * [type Transport struct](#Transport)
        * [func (t *Transport) RoundTrip(req *Request) (*Response, error)](#Transport.RoundTrip)
        * [func (t *Transport) writeBufferSize() int](#Transport.writeBufferSize)
        * [func (t *Transport) readBufferSize() int](#Transport.readBufferSize)
        * [func (t *Transport) Clone() *Transport](#Transport.Clone)
        * [func (t *Transport) hasCustomTLSDialer() bool](#Transport.hasCustomTLSDialer)
        * [func (t *Transport) onceSetNextProtoDefaults()](#Transport.onceSetNextProtoDefaults)
        * [func (t *Transport) useRegisteredProtocol(req *Request) bool](#Transport.useRegisteredProtocol)
        * [func (t *Transport) alternateRoundTripper(req *Request) RoundTripper](#Transport.alternateRoundTripper)
        * [func (t *Transport) roundTrip(req *Request) (*Response, error)](#Transport.roundTrip)
        * [func (t *Transport) RegisterProtocol(scheme string, rt RoundTripper)](#Transport.RegisterProtocol)
        * [func (t *Transport) CloseIdleConnections()](#Transport.CloseIdleConnections)
        * [func (t *Transport) CancelRequest(req *Request)](#Transport.CancelRequest)
        * [func (t *Transport) cancelRequest(key cancelKey, err error) bool](#Transport.cancelRequest)
        * [func (t *Transport) connectMethodForRequest(treq *transportRequest) (cm connectMethod, err error)](#Transport.connectMethodForRequest)
        * [func (t *Transport) putOrCloseIdleConn(pconn *persistConn)](#Transport.putOrCloseIdleConn)
        * [func (t *Transport) maxIdleConnsPerHost() int](#Transport.maxIdleConnsPerHost)
        * [func (t *Transport) tryPutIdleConn(pconn *persistConn) error](#Transport.tryPutIdleConn)
        * [func (t *Transport) queueForIdleConn(w *wantConn) (delivered bool)](#Transport.queueForIdleConn)
        * [func (t *Transport) removeIdleConn(pconn *persistConn) bool](#Transport.removeIdleConn)
        * [func (t *Transport) removeIdleConnLocked(pconn *persistConn) bool](#Transport.removeIdleConnLocked)
        * [func (t *Transport) setReqCanceler(key cancelKey, fn func(error))](#Transport.setReqCanceler)
        * [func (t *Transport) replaceReqCanceler(key cancelKey, fn func(error)) bool](#Transport.replaceReqCanceler)
        * [func (t *Transport) dial(ctx context.Context, network, addr string) (net.Conn, error)](#Transport.dial)
        * [func (t *Transport) customDialTLS(ctx context.Context, network, addr string) (conn net.Conn, err error)](#Transport.customDialTLS)
        * [func (t *Transport) getConn(treq *transportRequest, cm connectMethod) (pc *persistConn, err error)](#Transport.getConn)
        * [func (t *Transport) queueForDial(w *wantConn)](#Transport.queueForDial)
        * [func (t *Transport) dialConnFor(w *wantConn)](#Transport.dialConnFor)
        * [func (t *Transport) decConnsPerHost(key connectMethodKey)](#Transport.decConnsPerHost)
        * [func (t *Transport) dialConn(ctx context.Context, cm connectMethod) (pconn *persistConn, err error)](#Transport.dialConn)
        * [func (t *Transport) NumPendingRequestsForTesting() int](#Transport.NumPendingRequestsForTesting)
        * [func (t *Transport) IdleConnKeysForTesting() (keys []string)](#Transport.IdleConnKeysForTesting)
        * [func (t *Transport) IdleConnKeyCountForTesting() int](#Transport.IdleConnKeyCountForTesting)
        * [func (t *Transport) IdleConnStrsForTesting() []string](#Transport.IdleConnStrsForTesting)
        * [func (t *Transport) IdleConnStrsForTesting_h2() []string](#Transport.IdleConnStrsForTesting_h2)
        * [func (t *Transport) IdleConnCountForTesting(scheme, addr string) int](#Transport.IdleConnCountForTesting)
        * [func (t *Transport) IdleConnWaitMapSizeForTesting() int](#Transport.IdleConnWaitMapSizeForTesting)
        * [func (t *Transport) IsIdleForTesting() bool](#Transport.IsIdleForTesting)
        * [func (t *Transport) QueueForIdleConnForTesting()](#Transport.QueueForIdleConnForTesting)
        * [func (t *Transport) PutIdleTestConn(scheme, addr string) bool](#Transport.PutIdleTestConn)
        * [func (t *Transport) PutIdleTestConnH2(scheme, addr string, alt RoundTripper) bool](#Transport.PutIdleTestConnH2)
    * [type cancelKey struct](#cancelKey)
    * [type h2Transport interface](#h2Transport)
    * [type transportRequest struct](#transportRequest)
        * [func (tr *transportRequest) extraHeaders() Header](#transportRequest.extraHeaders)
        * [func (tr *transportRequest) setError(err error)](#transportRequest.setError)
        * [func (tr *transportRequest) logf(format string, args ...interface{})](#transportRequest.logf)
    * [type readTrackingBody struct](#readTrackingBody)
        * [func (r *readTrackingBody) Read(data []byte) (int, error)](#readTrackingBody.Read)
        * [func (r *readTrackingBody) Close() error](#readTrackingBody.Close)
    * [type transportReadFromServerError struct](#transportReadFromServerError)
        * [func (e transportReadFromServerError) Unwrap() error](#transportReadFromServerError.Unwrap)
        * [func (e transportReadFromServerError) Error() string](#transportReadFromServerError.Error)
    * [type wantConn struct](#wantConn)
        * [func (w *wantConn) waiting() bool](#wantConn.waiting)
        * [func (w *wantConn) tryDeliver(pc *persistConn, err error) bool](#wantConn.tryDeliver)
        * [func (w *wantConn) cancel(t *Transport, err error)](#wantConn.cancel)
    * [type wantConnQueue struct](#wantConnQueue)
        * [func (q *wantConnQueue) len() int](#wantConnQueue.len)
        * [func (q *wantConnQueue) pushBack(w *wantConn)](#wantConnQueue.pushBack)
        * [func (q *wantConnQueue) popFront() *wantConn](#wantConnQueue.popFront)
        * [func (q *wantConnQueue) peekFront() *wantConn](#wantConnQueue.peekFront)
        * [func (q *wantConnQueue) cleanFront() (cleaned bool)](#wantConnQueue.cleanFront)
    * [type erringRoundTripper interface](#erringRoundTripper)
    * [type persistConnWriter struct](#persistConnWriter)
        * [func (w persistConnWriter) Write(p []byte) (n int, err error)](#persistConnWriter.Write)
        * [func (w persistConnWriter) ReadFrom(r io.Reader) (n int64, err error)](#persistConnWriter.ReadFrom)
    * [type connectMethod struct](#connectMethod)
        * [func (cm *connectMethod) proxyAuth() string](#connectMethod.proxyAuth)
        * [func (cm *connectMethod) key() connectMethodKey](#connectMethod.key)
        * [func (cm *connectMethod) scheme() string](#connectMethod.scheme)
        * [func (cm *connectMethod) addr() string](#connectMethod.addr)
        * [func (cm *connectMethod) tlsHost() string](#connectMethod.tlsHost)
    * [type connectMethodKey struct](#connectMethodKey)
        * [func (k connectMethodKey) String() string](#connectMethodKey.String)
    * [type persistConn struct](#persistConn)
        * [func (pc *persistConn) shouldRetryRequest(req *Request, err error) bool](#persistConn.shouldRetryRequest)
        * [func (pconn *persistConn) addTLS(ctx context.Context, name string, trace *httptrace.ClientTrace) error](#persistConn.addTLS)
        * [func (pc *persistConn) maxHeaderResponseSize() int64](#persistConn.maxHeaderResponseSize)
        * [func (pc *persistConn) Read(p []byte) (n int, err error)](#persistConn.Read)
        * [func (pc *persistConn) isBroken() bool](#persistConn.isBroken)
        * [func (pc *persistConn) canceled() error](#persistConn.canceled)
        * [func (pc *persistConn) isReused() bool](#persistConn.isReused)
        * [func (pc *persistConn) gotIdleConnTrace(idleAt time.Time) (t httptrace.GotConnInfo)](#persistConn.gotIdleConnTrace)
        * [func (pc *persistConn) cancelRequest(err error)](#persistConn.cancelRequest)
        * [func (pc *persistConn) closeConnIfStillIdle()](#persistConn.closeConnIfStillIdle)
        * [func (pc *persistConn) mapRoundTripError(req *transportRequest, startBytesWritten int64, err error) error](#persistConn.mapRoundTripError)
        * [func (pc *persistConn) readLoop()](#persistConn.readLoop)
        * [func (pc *persistConn) readLoopPeekFailLocked(peekErr error)](#persistConn.readLoopPeekFailLocked)
        * [func (pc *persistConn) readResponse(rc requestAndChan, trace *httptrace.ClientTrace) (resp *Response, err error)](#persistConn.readResponse)
        * [func (pc *persistConn) waitForContinue(continueCh <-chan struct{}) func() bool](#persistConn.waitForContinue)
        * [func (pc *persistConn) writeLoop()](#persistConn.writeLoop)
        * [func (pc *persistConn) wroteRequest() bool](#persistConn.wroteRequest)
        * [func (pc *persistConn) roundTrip(req *transportRequest) (resp *Response, err error)](#persistConn.roundTrip)
        * [func (pc *persistConn) markReused()](#persistConn.markReused)
        * [func (pc *persistConn) close(err error)](#persistConn.close)
        * [func (pc *persistConn) closeLocked(err error)](#persistConn.closeLocked)
    * [type readWriteCloserBody struct](#readWriteCloserBody)
        * [func (b *readWriteCloserBody) Read(p []byte) (n int, err error)](#readWriteCloserBody.Read)
    * [type nothingWrittenError struct](#nothingWrittenError)
    * [type responseAndError struct](#responseAndError)
    * [type requestAndChan struct](#requestAndChan)
    * [type writeRequest struct](#writeRequest)
    * [type httpError struct](#httpError)
        * [func (e *httpError) Error() string](#httpError.Error)
        * [func (e *httpError) Timeout() bool](#httpError.Timeout)
        * [func (e *httpError) Temporary() bool](#httpError.Temporary)
    * [type tLogKey struct{}](#tLogKey)
    * [type bodyEOFSignal struct](#bodyEOFSignal)
        * [func (es *bodyEOFSignal) Read(p []byte) (n int, err error)](#bodyEOFSignal.Read)
        * [func (es *bodyEOFSignal) Close() error](#bodyEOFSignal.Close)
        * [func (es *bodyEOFSignal) condfn(err error) error](#bodyEOFSignal.condfn)
    * [type gzipReader struct](#gzipReader)
        * [func (gz *gzipReader) Read(p []byte) (n int, err error)](#gzipReader.Read)
        * [func (gz *gzipReader) Close() error](#gzipReader.Close)
    * [type tlsHandshakeTimeoutError struct{}](#tlsHandshakeTimeoutError)
        * [func (tlsHandshakeTimeoutError) Timeout() bool](#tlsHandshakeTimeoutError.Timeout)
        * [func (tlsHandshakeTimeoutError) Temporary() bool](#tlsHandshakeTimeoutError.Temporary)
        * [func (tlsHandshakeTimeoutError) Error() string](#tlsHandshakeTimeoutError.Error)
    * [type fakeLocker struct{}](#fakeLocker)
        * [func (fakeLocker) Lock()](#fakeLocker.Lock)
        * [func (fakeLocker) Unlock()](#fakeLocker.Unlock)
    * [type connLRU struct](#connLRU)
        * [func (cl *connLRU) add(pc *persistConn)](#connLRU.add)
        * [func (cl *connLRU) removeOldest() *persistConn](#connLRU.removeOldest)
        * [func (cl *connLRU) remove(pc *persistConn)](#connLRU.remove)
        * [func (cl *connLRU) len() int](#connLRU.len)
    * [type headerOnlyResponseWriter http.Header](#headerOnlyResponseWriter)
        * [func (ho headerOnlyResponseWriter) Header() Header](#headerOnlyResponseWriter.Header)
        * [func (ho headerOnlyResponseWriter) Write([]byte) (int, error)](#headerOnlyResponseWriter.Write)
        * [func (ho headerOnlyResponseWriter) WriteHeader(int)](#headerOnlyResponseWriter.WriteHeader)
    * [type hasTokenTest struct](#hasTokenTest)
    * [type reqTest struct](#reqTest)
    * [type reqWriteTest struct](#reqWriteTest)
    * [type closeChecker struct](#closeChecker)
        * [func (rc *closeChecker) Close() error](#closeChecker.Close)
    * [type writerFunc func([]byte) (int, error)](#writerFunc)
        * [func (f writerFunc) Write(p []byte) (int, error)](#writerFunc.Write)
    * [type delegateReader struct](#delegateReader)
        * [func (r *delegateReader) Read(p []byte) (int, error)](#delegateReader.Read)
    * [type dumpConn struct](#dumpConn)
        * [func (c *dumpConn) Close() error](#dumpConn.Close)
        * [func (c *dumpConn) LocalAddr() net.Addr](#dumpConn.LocalAddr)
        * [func (c *dumpConn) RemoteAddr() net.Addr](#dumpConn.RemoteAddr)
        * [func (c *dumpConn) SetDeadline(t time.Time) error](#dumpConn.SetDeadline)
        * [func (c *dumpConn) SetReadDeadline(t time.Time) error](#dumpConn.SetReadDeadline)
        * [func (c *dumpConn) SetWriteDeadline(t time.Time) error](#dumpConn.SetWriteDeadline)
    * [type respTest struct](#respTest)
    * [type readerAndCloser struct](#readerAndCloser)
    * [type responseLocationTest struct](#responseLocationTest)
    * [type respWriteTest struct](#respWriteTest)
    * [type mockTransferWriter struct](#mockTransferWriter)
        * [func (w *mockTransferWriter) ReadFrom(r io.Reader) (int64, error)](#mockTransferWriter.ReadFrom)
        * [func (w *mockTransferWriter) Write(p []byte) (int, error)](#mockTransferWriter.Write)
    * [type issue22091Error struct{}](#issue22091Error)
        * [func (issue22091Error) IsHTTP2NoCachedConnError()](#issue22091Error.IsHTTP2NoCachedConnError)
        * [func (issue22091Error) Error() string](#issue22091Error.Error)
    * [type roundTripFunc func(r *std/net/http.Request) (*std/net/http.Response, error)](#roundTripFunc)
        * [func (f roundTripFunc) RoundTrip(r *Request) (*Response, error)](#roundTripFunc.RoundTrip)
* [Functions](#func)
    * [func refererForURL(lastReq, newReq *url.URL) string](#refererForURL)
    * [func timeBeforeContextDeadline(t time.Time, ctx context.Context) bool](#timeBeforeContextDeadline)
    * [func knownRoundTripperImpl(rt RoundTripper, req *Request) bool](#knownRoundTripperImpl)
    * [func setRequestCancel(req *Request, rt RoundTripper, deadline time.Time) (stopTimer func(), didTimeout func() bool)](#setRequestCancel)
    * [func basicAuth(username, password string) string](#basicAuth)
    * [func alwaysFalse() bool](#alwaysFalse)
    * [func redirectBehavior(reqMethod string, resp *Response, ireq *Request) (redirectMethod string, shouldRedirect, includeBody bool)](#redirectBehavior)
    * [func urlErrorOp(method string) string](#urlErrorOp)
    * [func defaultCheckRedirect(req *Request, via []*Request) error](#defaultCheckRedirect)
    * [func shouldCopyHeaderOnRedirect(headerKey string, initial, dest *url.URL) bool](#shouldCopyHeaderOnRedirect)
    * [func isDomainOrSubdomain(sub, parent string) bool](#isDomainOrSubdomain)
    * [func stripPassword(u *url.URL) string](#stripPassword)
    * [func cloneURLValues(v url.Values) url.Values](#cloneURLValues)
    * [func cloneURL(u *url.URL) *url.URL](#cloneURL)
    * [func cloneMultipartForm(f *multipart.Form) *multipart.Form](#cloneMultipartForm)
    * [func cloneMultipartFileHeader(fh *multipart.FileHeader) *multipart.FileHeader](#cloneMultipartFileHeader)
    * [func readSetCookies(h Header) []*Cookie](#readSetCookies)
    * [func SetCookie(w ResponseWriter, cookie *Cookie)](#SetCookie)
    * [func readCookies(h Header, filter string) []*Cookie](#readCookies)
    * [func validCookieDomain(v string) bool](#validCookieDomain)
    * [func validCookieExpires(t time.Time) bool](#validCookieExpires)
    * [func isCookieDomainName(s string) bool](#isCookieDomainName)
    * [func sanitizeCookieName(n string) string](#sanitizeCookieName)
    * [func sanitizeCookieValue(v string) string](#sanitizeCookieValue)
    * [func validCookieValueByte(b byte) bool](#validCookieValueByte)
    * [func sanitizeCookiePath(v string) string](#sanitizeCookiePath)
    * [func validCookiePathByte(b byte) bool](#validCookiePathByte)
    * [func sanitizeOrWarn(fieldName string, valid func(byte) bool, v string) string](#sanitizeOrWarn)
    * [func parseCookieValue(raw string, allowDoubleQuote bool) (string, bool)](#parseCookieValue)
    * [func isCookieNameValid(raw string) bool](#isCookieNameValid)
    * [func mapDirOpenError(originalErr error, name string) error](#mapDirOpenError)
    * [func dirList(w ResponseWriter, r *Request, f File)](#dirList)
    * [func ServeContent(w ResponseWriter, req *Request, name string, modtime time.Time, content io.ReadSeeker)](#ServeContent)
    * [func serveContent(w ResponseWriter, r *Request, name string, modtime time.Time, sizeFunc func() (int64, error), content io.ReadSeeker)](#serveContent)
    * [func scanETag(s string) (etag string, remain string)](#scanETag)
    * [func etagStrongMatch(a, b string) bool](#etagStrongMatch)
    * [func etagWeakMatch(a, b string) bool](#etagWeakMatch)
    * [func isZeroTime(t time.Time) bool](#isZeroTime)
    * [func setLastModified(w ResponseWriter, modtime time.Time)](#setLastModified)
    * [func writeNotModified(w ResponseWriter)](#writeNotModified)
    * [func checkPreconditions(w ResponseWriter, r *Request, modtime time.Time) (done bool, rangeHeader string)](#checkPreconditions)
    * [func serveFile(w ResponseWriter, r *Request, fs FileSystem, name string, redirect bool)](#serveFile)
    * [func toHTTPError(err error) (msg string, httpStatus int)](#toHTTPError)
    * [func localRedirect(w ResponseWriter, r *Request, newPath string)](#localRedirect)
    * [func ServeFile(w ResponseWriter, r *Request, name string)](#ServeFile)
    * [func containsDotDot(v string) bool](#containsDotDot)
    * [func isSlashRune(r rune) bool](#isSlashRune)
    * [func parseRange(s string, size int64) ([]httpRange, error)](#parseRange)
    * [func rangesMIMESize(ranges []httpRange, contentType string, contentSize int64) (encSize int64)](#rangesMIMESize)
    * [func sumRangesSize(ranges []httpRange) (size int64)](#sumRangesSize)
    * [func http2asciiEqualFold(s, t string) bool](#http2asciiEqualFold)
    * [func http2lower(b byte) byte](#http2lower)
    * [func http2isASCIIPrint(s string) bool](#http2isASCIIPrint)
    * [func http2asciiToLower(s string) (lower string, ok bool)](#http2asciiToLower)
    * [func http2isBadCipher(cipher uint16) bool](#http2isBadCipher)
    * [func http2filterOutClientConn(in []*http2ClientConn, exclude *http2ClientConn) []*http2ClientConn](#http2filterOutClientConn)
    * [func http2shouldRetryDial(call *http2dialCall, req *Request) bool](#http2shouldRetryDial)
    * [func http2getDataBufferChunk(size int64) []byte](#http2getDataBufferChunk)
    * [func http2putDataBufferChunk(p []byte)](#http2putDataBufferChunk)
    * [func http2terminalReadFrameError(err error) bool](#http2terminalReadFrameError)
    * [func http2validStreamIDOrZero(streamID uint32) bool](#http2validStreamIDOrZero)
    * [func http2validStreamID(streamID uint32) bool](#http2validStreamID)
    * [func http2readByte(p []byte) (remain []byte, b byte, err error)](#http2readByte)
    * [func http2readUint32(p []byte) (remain []byte, v uint32, err error)](#http2readUint32)
    * [func http2summarizeFrame(f http2Frame) string](#http2summarizeFrame)
    * [func http2traceHasWroteHeaderField(trace *httptrace.ClientTrace) bool](#http2traceHasWroteHeaderField)
    * [func http2traceWroteHeaderField(trace *httptrace.ClientTrace, k, v string)](#http2traceWroteHeaderField)
    * [func http2traceGot1xxResponseFunc(trace *httptrace.ClientTrace) func(int, textproto.MIMEHeader) error](#http2traceGot1xxResponseFunc)
    * [func http2curGoroutineID() uint64](#http2curGoroutineID)
    * [func http2parseUintBytes(s []byte, base int, bitSize int) (n uint64, err error)](#http2parseUintBytes)
    * [func http2cutoff64(base int) uint64](#http2cutoff64)
    * [func http2buildCommonHeaderMapsOnce()](#http2buildCommonHeaderMapsOnce)
    * [func http2buildCommonHeaderMaps()](#http2buildCommonHeaderMaps)
    * [func http2lowerHeader(v string) (lower string, ascii bool)](#http2lowerHeader)
    * [func init()](#init.h2_bundle.go)
    * [func http2validWireHeaderFieldName(v string) bool](#http2validWireHeaderFieldName)
    * [func http2httpCodeString(code int) string](#http2httpCodeString)
    * [func http2mustUint31(v int32) uint32](#http2mustUint31)
    * [func http2bodyAllowedForStatus(status int) bool](#http2bodyAllowedForStatus)
    * [func http2validPseudoPath(v string) bool](#http2validPseudoPath)
    * [func http2ConfigureServer(s *Server, conf *http2Server) error](#http2ConfigureServer)
    * [func http2serverConnBaseContext(c net.Conn, opts *http2ServeConnOpts) (ctx context.Context, cancel func())](#http2serverConnBaseContext)
    * [func http2errno(v error) uintptr](#http2errno)
    * [func http2isClosedConnError(err error) bool](#http2isClosedConnError)
    * [func http2checkPriority(streamID uint32, p http2PriorityParam) error](#http2checkPriority)
    * [func http2handleHeaderListTooLong(w ResponseWriter, r *Request)](#http2handleHeaderListTooLong)
    * [func http2checkWriteHeaderCode(code int)](#http2checkWriteHeaderCode)
    * [func http2foreachHeaderElement(v string, fn func(string))](#http2foreachHeaderElement)
    * [func http2checkValidHTTP2RequestHeaders(h Header) error](#http2checkValidHTTP2RequestHeaders)
    * [func http2h1ServerKeepAlivesDisabled(hs *Server) bool](#http2h1ServerKeepAlivesDisabled)
    * [func http2ConfigureTransport(t1 *Transport) error](#http2ConfigureTransport)
    * [func http2awaitRequestCancel(req *Request, done <-chan struct{}) error](#http2awaitRequestCancel)
    * [func http2isNoCachedConnError(err error) bool](#http2isNoCachedConnError)
    * [func http2authorityAddr(scheme string, authority string) (addr string)](#http2authorityAddr)
    * [func http2canRetryError(err error) bool](#http2canRetryError)
    * [func http2commaSeparatedTrailers(req *Request) (string, error)](#http2commaSeparatedTrailers)
    * [func http2checkConnHeaders(req *Request) error](#http2checkConnHeaders)
    * [func http2actualContentLength(req *Request) int64](#http2actualContentLength)
    * [func http2shouldSendReqContentLength(method string, contentLength int64) bool](#http2shouldSendReqContentLength)
    * [func http2isEOFOrNetReadError(err error) bool](#http2isEOFOrNetReadError)
    * [func http2strSliceContains(ss []string, s string) bool](#http2strSliceContains)
    * [func http2isConnectionCloseRequest(req *Request) bool](#http2isConnectionCloseRequest)
    * [func http2registerHTTPSProtocol(t *Transport, rt http2noDialH2RoundTripper) (err error)](#http2registerHTTPSProtocol)
    * [func http2traceGetConn(req *Request, hostPort string)](#http2traceGetConn)
    * [func http2traceGotConn(req *Request, cc *http2ClientConn, reused bool)](#http2traceGotConn)
    * [func http2traceWroteHeaders(trace *httptrace.ClientTrace)](#http2traceWroteHeaders)
    * [func http2traceGot100Continue(trace *httptrace.ClientTrace)](#http2traceGot100Continue)
    * [func http2traceWait100Continue(trace *httptrace.ClientTrace)](#http2traceWait100Continue)
    * [func http2traceWroteRequest(trace *httptrace.ClientTrace, err error)](#http2traceWroteRequest)
    * [func http2traceFirstResponseByte(trace *httptrace.ClientTrace)](#http2traceFirstResponseByte)
    * [func http2writeEndsStream(w http2writeFramer) bool](#http2writeEndsStream)
    * [func http2splitHeaderBlock(ctx http2writeContext, headerBlock []byte, fn func(ctx http2writeContext, frag []byte, firstFrag, lastFrag bool) error) error](#http2splitHeaderBlock)
    * [func http2encKV(enc *hpack.Encoder, k, v string)](#http2encKV)
    * [func http2encodeHeaders(enc *hpack.Encoder, h Header, keys []string)](#http2encodeHeaders)
    * [func ParseTime(text string) (t time.Time, err error)](#ParseTime)
    * [func CanonicalHeaderKey(s string) string](#CanonicalHeaderKey)
    * [func hasToken(v, token string) bool](#hasToken)
    * [func isTokenBoundary(b byte) bool](#isTokenBoundary)
    * [func hasPort(s string) bool](#hasPort)
    * [func removeEmptyPort(host string) string](#removeEmptyPort)
    * [func isNotToken(r rune) bool](#isNotToken)
    * [func stringContainsCTLByte(s string) bool](#stringContainsCTLByte)
    * [func hexEscapeNonASCII(s string) string](#hexEscapeNonASCII)
    * [func badStringError(what, val string) error](#badStringError)
    * [func valueOrDefault(value, def string) string](#valueOrDefault)
    * [func idnaASCII(v string) (string, error)](#idnaASCII)
    * [func cleanHost(in string) string](#cleanHost)
    * [func removeZone(host string) string](#removeZone)
    * [func ParseHTTPVersion(vers string) (major, minor int, ok bool)](#ParseHTTPVersion)
    * [func validMethod(method string) bool](#validMethod)
    * [func parseBasicAuth(auth string) (username, password string, ok bool)](#parseBasicAuth)
    * [func parseRequestLine(line string) (method, requestURI, proto string, ok bool)](#parseRequestLine)
    * [func newTextprotoReader(br *bufio.Reader) *textproto.Reader](#newTextprotoReader)
    * [func putTextprotoReader(r *textproto.Reader)](#putTextprotoReader)
    * [func MaxBytesReader(w ResponseWriter, r io.ReadCloser, n int64) io.ReadCloser](#MaxBytesReader)
    * [func copyValues(dst, src url.Values)](#copyValues)
    * [func parsePostForm(r *Request) (vs url.Values, err error)](#parsePostForm)
    * [func requestMethodUsuallyLacksBody(method string) bool](#requestMethodUsuallyLacksBody)
    * [func fixPragmaCacheControl(header Header)](#fixPragmaCacheControl)
    * [func isProtocolSwitchResponse(code int, h Header) bool](#isProtocolSwitchResponse)
    * [func isProtocolSwitchHeader(h Header) bool](#isProtocolSwitchHeader)
    * [func bufioWriterPool(size int) *sync.Pool](#bufioWriterPool)
    * [func newBufioReader(r io.Reader) *bufio.Reader](#newBufioReader)
    * [func putBufioReader(br *bufio.Reader)](#putBufioReader)
    * [func newBufioWriterSize(w io.Writer, size int) *bufio.Writer](#newBufioWriterSize)
    * [func putBufioWriter(bw *bufio.Writer)](#putBufioWriter)
    * [func appendTime(b []byte, t time.Time) []byte](#appendTime)
    * [func http1ServerSupportsRequest(req *Request) bool](#http1ServerSupportsRequest)
    * [func checkWriteHeaderCode(code int)](#checkWriteHeaderCode)
    * [func relevantCaller() runtime.Frame](#relevantCaller)
    * [func foreachHeaderElement(v string, fn func(string))](#foreachHeaderElement)
    * [func writeStatusLine(bw *bufio.Writer, is11 bool, code int, scratch []byte)](#writeStatusLine)
    * [func validNextProto(proto string) bool](#validNextProto)
    * [func badRequestError(e string) error](#badRequestError)
    * [func isCommonNetReadError(err error) bool](#isCommonNetReadError)
    * [func registerOnHitEOF(rc io.ReadCloser, fn func())](#registerOnHitEOF)
    * [func requestBodyRemains(rc io.ReadCloser) bool](#requestBodyRemains)
    * [func Error(w ResponseWriter, error string, code int)](#Error)
    * [func NotFound(w ResponseWriter, r *Request)](#NotFound)
    * [func Redirect(w ResponseWriter, r *Request, url string, code int)](#Redirect)
    * [func htmlEscape(s string) string](#htmlEscape)
    * [func cleanPath(p string) string](#cleanPath)
    * [func stripHostPort(h string) string](#stripHostPort)
    * [func appendSorted(es []muxEntry, e muxEntry) []muxEntry](#appendSorted)
    * [func Handle(pattern string, handler Handler)](#Handle)
    * [func HandleFunc(pattern string, handler func(ResponseWriter, *Request))](#HandleFunc)
    * [func Serve(l net.Listener, handler Handler) error](#Serve)
    * [func ServeTLS(l net.Listener, handler Handler, certFile, keyFile string) error](#ServeTLS)
    * [func logf(r *Request, format string, args ...interface{})](#logf)
    * [func ListenAndServe(addr string, handler Handler) error](#ListenAndServe)
    * [func ListenAndServeTLS(addr, certFile, keyFile string, handler Handler) error](#ListenAndServeTLS)
    * [func newLoggingConn(baseName string, c net.Conn) net.Conn](#newLoggingConn)
    * [func numLeadingCRorLF(v []byte) (n int)](#numLeadingCRorLF)
    * [func strSliceContains(ss []string, s string) bool](#strSliceContains)
    * [func tlsRecordHeaderLooksLikeHTTP(hdr [5]byte) bool](#tlsRecordHeaderLooksLikeHTTP)
    * [func DetectContentType(data []byte) string](#DetectContentType)
    * [func isWS(b byte) bool](#isWS)
    * [func isTT(b byte) bool](#isTT)
    * [func sockssplitHostPort(address string) (string, int, error)](#sockssplitHostPort)
    * [func StatusText(code int) string](#StatusText)
    * [func noResponseBodyExpected(requestMethod string) bool](#noResponseBodyExpected)
    * [func bodyAllowedForStatus(status int) bool](#bodyAllowedForStatus)
    * [func suppressedHeaders(status int) []string](#suppressedHeaders)
    * [func readTransfer(msg interface{}, r *bufio.Reader) (err error)](#readTransfer)
    * [func chunked(te []string) bool](#chunked)
    * [func isIdentity(te []string) bool](#isIdentity)
    * [func isUnsupportedTEError(err error) bool](#isUnsupportedTEError)
    * [func fixLength(isResponse bool, status int, requestMethod string, header Header, chunked bool) (int64, error)](#fixLength)
    * [func shouldClose(major, minor int, header Header, removeCloseHeader bool) bool](#shouldClose)
    * [func seeUpcomingDoubleCRLF(r *bufio.Reader) bool](#seeUpcomingDoubleCRLF)
    * [func mergeSetHeader(dst *Header, src Header)](#mergeSetHeader)
    * [func parseContentLength(cl string) (int64, error)](#parseContentLength)
    * [func isKnownInMemoryReader(r io.Reader) bool](#isKnownInMemoryReader)
    * [func ProxyFromEnvironment(req *Request) (*url.URL, error)](#ProxyFromEnvironment)
    * [func ProxyURL(fixedURL *url.URL) func(*Request) (*url.URL, error)](#ProxyURL)
    * [func envProxyFunc() func(*url.URL) (*url.URL, error)](#envProxyFunc)
    * [func resetProxyConfig()](#resetProxyConfig)
    * [func is408Message(buf []byte) bool](#is408Message)
    * [func newReadWriteCloserBody(br *bufio.Reader, rwc io.ReadWriteCloser) io.ReadWriteCloser](#newReadWriteCloserBody)
    * [func nop()](#nop)
    * [func canonicalAddr(url *url.URL) string](#canonicalAddr)
    * [func cloneTLSConfig(cfg *tls.Config) *tls.Config](#cloneTLSConfig)
    * [func TestWriteSetCookies(t *testing.T)](#TestWriteSetCookies)
    * [func TestSetCookie(t *testing.T)](#TestSetCookie)
    * [func TestAddCookie(t *testing.T)](#TestAddCookie)
    * [func toJSON(v interface{}) string](#toJSON)
    * [func TestReadSetCookies(t *testing.T)](#TestReadSetCookies)
    * [func TestReadCookies(t *testing.T)](#TestReadCookies)
    * [func TestSetCookieDoubleQuotes(t *testing.T)](#TestSetCookieDoubleQuotes)
    * [func TestCookieSanitizeValue(t *testing.T)](#TestCookieSanitizeValue)
    * [func TestCookieSanitizePath(t *testing.T)](#TestCookieSanitizePath)
    * [func BenchmarkCookieString(b *testing.B)](#BenchmarkCookieString)
    * [func BenchmarkReadSetCookies(b *testing.B)](#BenchmarkReadSetCookies)
    * [func BenchmarkReadCookies(b *testing.B)](#BenchmarkReadCookies)
    * [func init()](#init.export_test.go)
    * [func CondSkipHTTP2(t *testing.T)](#CondSkipHTTP2)
    * [func SetReadLoopBeforeNextReadHook(f func())](#SetReadLoopBeforeNextReadHook)
    * [func SetPendingDialHooks(before, after func())](#SetPendingDialHooks)
    * [func SetTestHookServerServe(fn func(*Server, net.Listener))](#SetTestHookServerServe)
    * [func ResetCachedEnvironment()](#ResetCachedEnvironment)
    * [func unnilTestHook(f *func())](#unnilTestHook)
    * [func hookSetter(dst *func()) func(func())](#hookSetter)
    * [func ExportHttp2ConfigureTransport(t *Transport) error](#ExportHttp2ConfigureTransport)
    * [func ExportSetH2GoawayTimeout(d time.Duration) (restore func())](#ExportSetH2GoawayTimeout)
    * [func ExportCloseTransportConnsAbruptly(tr *Transport)](#ExportCloseTransportConnsAbruptly)
    * [func checker(t *testing.T) func(string, error)](#checker)
    * [func TestFileTransport(t *testing.T)](#TestFileTransport)
    * [func TestHeaderWrite(t *testing.T)](#TestHeaderWrite)
    * [func TestParseTime(t *testing.T)](#TestParseTime)
    * [func TestHasToken(t *testing.T)](#TestHasToken)
    * [func TestNilHeaderClone(t *testing.T)](#TestNilHeaderClone)
    * [func BenchmarkHeaderWriteSubset(b *testing.B)](#BenchmarkHeaderWriteSubset)
    * [func TestHeaderWriteSubsetAllocs(t *testing.T)](#TestHeaderWriteSubsetAllocs)
    * [func TestCloneOrMakeHeader(t *testing.T)](#TestCloneOrMakeHeader)
    * [func TestForeachHeaderElement(t *testing.T)](#TestForeachHeaderElement)
    * [func TestCleanHost(t *testing.T)](#TestCleanHost)
    * [func TestCmdGoNoHTTPServer(t *testing.T)](#TestCmdGoNoHTTPServer)
    * [func TestOmitHTTP2(t *testing.T)](#TestOmitHTTP2)
    * [func TestOmitHTTP2Vet(t *testing.T)](#TestOmitHTTP2Vet)
    * [func BenchmarkCopyValues(b *testing.B)](#BenchmarkCopyValues)
    * [func TestNoUnicodeStrings(t *testing.T)](#TestNoUnicodeStrings)
    * [func TestCacheKeys(t *testing.T)](#TestCacheKeys)
    * [func ResetProxyEnv()](#ResetProxyEnv)
    * [func TestParseRange(t *testing.T)](#TestParseRange)
    * [func TestReadRequest(t *testing.T)](#TestReadRequest)
    * [func reqBytes(req string) []byte](#reqBytes)
    * [func TestReadRequest_Bad(t *testing.T)](#TestReadRequest_Bad)
    * [func TestRequestWrite(t *testing.T)](#TestRequestWrite)
    * [func TestRequestWriteTransport(t *testing.T)](#TestRequestWriteTransport)
    * [func TestRequestWriteClosesBody(t *testing.T)](#TestRequestWriteClosesBody)
    * [func chunk(s string) string](#chunk)
    * [func mustParseURL(s string) *url.URL](#mustParseURL)
    * [func TestRequestWriteError(t *testing.T)](#TestRequestWriteError)
    * [func dumpRequestOut(req *Request, onReadHeaders func()) ([]byte, error)](#dumpRequestOut)
    * [func TestReadResponse(t *testing.T)](#TestReadResponse)
    * [func TestWriteResponse(t *testing.T)](#TestWriteResponse)
    * [func TestReadResponseCloseInMiddle(t *testing.T)](#TestReadResponseCloseInMiddle)
    * [func diff(t *testing.T, prefix string, have, want interface{})](#diff)
    * [func TestLocationResponse(t *testing.T)](#TestLocationResponse)
    * [func TestResponseStatusStutter(t *testing.T)](#TestResponseStatusStutter)
    * [func TestResponseContentLengthShortBody(t *testing.T)](#TestResponseContentLengthShortBody)
    * [func TestReadResponseErrors(t *testing.T)](#TestReadResponseErrors)
    * [func matchErr(err error, wantErr interface{}) error](#matchErr)
    * [func TestNeedsSniff(t *testing.T)](#TestNeedsSniff)
    * [func TestResponseWritesOnlySingleConnectionClose(t *testing.T)](#TestResponseWritesOnlySingleConnectionClose)
    * [func TestResponseWrite(t *testing.T)](#TestResponseWrite)
    * [func BenchmarkServerMatch(b *testing.B)](#BenchmarkServerMatch)
    * [func TestBodyReadBadTrailer(t *testing.T)](#TestBodyReadBadTrailer)
    * [func TestFinalChunkedBodyReadEOF(t *testing.T)](#TestFinalChunkedBodyReadEOF)
    * [func TestDetectInMemoryReaders(t *testing.T)](#TestDetectInMemoryReaders)
    * [func TestTransferWriterWriteBodyReaderTypes(t *testing.T)](#TestTransferWriterWriteBodyReaderTypes)
    * [func TestParseTransferEncoding(t *testing.T)](#TestParseTransferEncoding)
    * [func TestParseContentLength(t *testing.T)](#TestParseContentLength)
    * [func TestTransportPersistConnReadLoopEOF(t *testing.T)](#TestTransportPersistConnReadLoopEOF)
    * [func isTransportReadFromServerError(err error) bool](#isTransportReadFromServerError)
    * [func newLocalListener(t *testing.T) net.Listener](#newLocalListener)
    * [func TestTransportShouldRetryRequest(t *testing.T)](#TestTransportShouldRetryRequest)
    * [func TestTransportBodyAltRewind(t *testing.T)](#TestTransportBodyAltRewind)


## <a id="const" href="#const">Constants</a>

### <a id="SameSiteDefaultMode" href="#SameSiteDefaultMode">const SameSiteDefaultMode</a>

```
searchKey: http.SameSiteDefaultMode
```

```Go
const SameSiteDefaultMode SameSite = iota + 1
```

### <a id="SameSiteLaxMode" href="#SameSiteLaxMode">const SameSiteLaxMode</a>

```
searchKey: http.SameSiteLaxMode
```

```Go
const SameSiteLaxMode
```

### <a id="SameSiteStrictMode" href="#SameSiteStrictMode">const SameSiteStrictMode</a>

```
searchKey: http.SameSiteStrictMode
```

```Go
const SameSiteStrictMode
```

### <a id="SameSiteNoneMode" href="#SameSiteNoneMode">const SameSiteNoneMode</a>

```
searchKey: http.SameSiteNoneMode
```

```Go
const SameSiteNoneMode
```

### <a id="condNone" href="#condNone">const condNone</a>

```
searchKey: http.condNone
tags: [private]
```

```Go
const condNone condResult = iota
```

### <a id="condTrue" href="#condTrue">const condTrue</a>

```
searchKey: http.condTrue
tags: [private]
```

```Go
const condTrue
```

### <a id="condFalse" href="#condFalse">const condFalse</a>

```
searchKey: http.condFalse
tags: [private]
```

```Go
const condFalse
```

### <a id="http2cipher_TLS_NULL_WITH_NULL_NULL" href="#http2cipher_TLS_NULL_WITH_NULL_NULL">const http2cipher_TLS_NULL_WITH_NULL_NULL</a>

```
searchKey: http.http2cipher_TLS_NULL_WITH_NULL_NULL
tags: [private]
```

```Go
const http2cipher_TLS_NULL_WITH_NULL_NULL uint16 = 0x0000
```

### <a id="http2cipher_TLS_RSA_WITH_NULL_MD5" href="#http2cipher_TLS_RSA_WITH_NULL_MD5">const http2cipher_TLS_RSA_WITH_NULL_MD5</a>

```
searchKey: http.http2cipher_TLS_RSA_WITH_NULL_MD5
tags: [private]
```

```Go
const http2cipher_TLS_RSA_WITH_NULL_MD5 uint16 = 0x0001
```

### <a id="http2cipher_TLS_RSA_WITH_NULL_SHA" href="#http2cipher_TLS_RSA_WITH_NULL_SHA">const http2cipher_TLS_RSA_WITH_NULL_SHA</a>

```
searchKey: http.http2cipher_TLS_RSA_WITH_NULL_SHA
tags: [private]
```

```Go
const http2cipher_TLS_RSA_WITH_NULL_SHA uint16 = 0x0002
```

### <a id="http2cipher_TLS_RSA_EXPORT_WITH_RC4_40_MD5" href="#http2cipher_TLS_RSA_EXPORT_WITH_RC4_40_MD5">const http2cipher_TLS_RSA_EXPORT_WITH_RC4_40_MD5</a>

```
searchKey: http.http2cipher_TLS_RSA_EXPORT_WITH_RC4_40_MD5
tags: [private]
```

```Go
const http2cipher_TLS_RSA_EXPORT_WITH_RC4_40_MD5 uint16 = 0x0003
```

### <a id="http2cipher_TLS_RSA_WITH_RC4_128_MD5" href="#http2cipher_TLS_RSA_WITH_RC4_128_MD5">const http2cipher_TLS_RSA_WITH_RC4_128_MD5</a>

```
searchKey: http.http2cipher_TLS_RSA_WITH_RC4_128_MD5
tags: [private]
```

```Go
const http2cipher_TLS_RSA_WITH_RC4_128_MD5 uint16 = 0x0004
```

### <a id="http2cipher_TLS_RSA_WITH_RC4_128_SHA" href="#http2cipher_TLS_RSA_WITH_RC4_128_SHA">const http2cipher_TLS_RSA_WITH_RC4_128_SHA</a>

```
searchKey: http.http2cipher_TLS_RSA_WITH_RC4_128_SHA
tags: [private]
```

```Go
const http2cipher_TLS_RSA_WITH_RC4_128_SHA uint16 = 0x0005
```

### <a id="http2cipher_TLS_RSA_EXPORT_WITH_RC2_CBC_40_MD5" href="#http2cipher_TLS_RSA_EXPORT_WITH_RC2_CBC_40_MD5">const http2cipher_TLS_RSA_EXPORT_WITH_RC2_CBC_40_MD5</a>

```
searchKey: http.http2cipher_TLS_RSA_EXPORT_WITH_RC2_CBC_40_MD5
tags: [private]
```

```Go
const http2cipher_TLS_RSA_EXPORT_WITH_RC2_CBC_40_MD5 uint16 = 0x0006
```

### <a id="http2cipher_TLS_RSA_WITH_IDEA_CBC_SHA" href="#http2cipher_TLS_RSA_WITH_IDEA_CBC_SHA">const http2cipher_TLS_RSA_WITH_IDEA_CBC_SHA</a>

```
searchKey: http.http2cipher_TLS_RSA_WITH_IDEA_CBC_SHA
tags: [private]
```

```Go
const http2cipher_TLS_RSA_WITH_IDEA_CBC_SHA uint16 = 0x0007
```

### <a id="http2cipher_TLS_RSA_EXPORT_WITH_DES40_CBC_SHA" href="#http2cipher_TLS_RSA_EXPORT_WITH_DES40_CBC_SHA">const http2cipher_TLS_RSA_EXPORT_WITH_DES40_CBC_SHA</a>

```
searchKey: http.http2cipher_TLS_RSA_EXPORT_WITH_DES40_CBC_SHA
tags: [private]
```

```Go
const http2cipher_TLS_RSA_EXPORT_WITH_DES40_CBC_SHA uint16 = 0x0008
```

### <a id="http2cipher_TLS_RSA_WITH_DES_CBC_SHA" href="#http2cipher_TLS_RSA_WITH_DES_CBC_SHA">const http2cipher_TLS_RSA_WITH_DES_CBC_SHA</a>

```
searchKey: http.http2cipher_TLS_RSA_WITH_DES_CBC_SHA
tags: [private]
```

```Go
const http2cipher_TLS_RSA_WITH_DES_CBC_SHA uint16 = 0x0009
```

### <a id="http2cipher_TLS_RSA_WITH_3DES_EDE_CBC_SHA" href="#http2cipher_TLS_RSA_WITH_3DES_EDE_CBC_SHA">const http2cipher_TLS_RSA_WITH_3DES_EDE_CBC_SHA</a>

```
searchKey: http.http2cipher_TLS_RSA_WITH_3DES_EDE_CBC_SHA
tags: [private]
```

```Go
const http2cipher_TLS_RSA_WITH_3DES_EDE_CBC_SHA uint16 = 0x000A
```

### <a id="http2cipher_TLS_DH_DSS_EXPORT_WITH_DES40_CBC_SHA" href="#http2cipher_TLS_DH_DSS_EXPORT_WITH_DES40_CBC_SHA">const http2cipher_TLS_DH_DSS_EXPORT_WITH_DES40_CBC_SHA</a>

```
searchKey: http.http2cipher_TLS_DH_DSS_EXPORT_WITH_DES40_CBC_SHA
tags: [private]
```

```Go
const http2cipher_TLS_DH_DSS_EXPORT_WITH_DES40_CBC_SHA uint16 = 0x000B
```

### <a id="http2cipher_TLS_DH_DSS_WITH_DES_CBC_SHA" href="#http2cipher_TLS_DH_DSS_WITH_DES_CBC_SHA">const http2cipher_TLS_DH_DSS_WITH_DES_CBC_SHA</a>

```
searchKey: http.http2cipher_TLS_DH_DSS_WITH_DES_CBC_SHA
tags: [private]
```

```Go
const http2cipher_TLS_DH_DSS_WITH_DES_CBC_SHA uint16 = 0x000C
```

### <a id="http2cipher_TLS_DH_DSS_WITH_3DES_EDE_CBC_SHA" href="#http2cipher_TLS_DH_DSS_WITH_3DES_EDE_CBC_SHA">const http2cipher_TLS_DH_DSS_WITH_3DES_EDE_CBC_SHA</a>

```
searchKey: http.http2cipher_TLS_DH_DSS_WITH_3DES_EDE_CBC_SHA
tags: [private]
```

```Go
const http2cipher_TLS_DH_DSS_WITH_3DES_EDE_CBC_SHA uint16 = 0x000D
```

### <a id="http2cipher_TLS_DH_RSA_EXPORT_WITH_DES40_CBC_SHA" href="#http2cipher_TLS_DH_RSA_EXPORT_WITH_DES40_CBC_SHA">const http2cipher_TLS_DH_RSA_EXPORT_WITH_DES40_CBC_SHA</a>

```
searchKey: http.http2cipher_TLS_DH_RSA_EXPORT_WITH_DES40_CBC_SHA
tags: [private]
```

```Go
const http2cipher_TLS_DH_RSA_EXPORT_WITH_DES40_CBC_SHA uint16 = 0x000E
```

### <a id="http2cipher_TLS_DH_RSA_WITH_DES_CBC_SHA" href="#http2cipher_TLS_DH_RSA_WITH_DES_CBC_SHA">const http2cipher_TLS_DH_RSA_WITH_DES_CBC_SHA</a>

```
searchKey: http.http2cipher_TLS_DH_RSA_WITH_DES_CBC_SHA
tags: [private]
```

```Go
const http2cipher_TLS_DH_RSA_WITH_DES_CBC_SHA uint16 = 0x000F
```

### <a id="http2cipher_TLS_DH_RSA_WITH_3DES_EDE_CBC_SHA" href="#http2cipher_TLS_DH_RSA_WITH_3DES_EDE_CBC_SHA">const http2cipher_TLS_DH_RSA_WITH_3DES_EDE_CBC_SHA</a>

```
searchKey: http.http2cipher_TLS_DH_RSA_WITH_3DES_EDE_CBC_SHA
tags: [private]
```

```Go
const http2cipher_TLS_DH_RSA_WITH_3DES_EDE_CBC_SHA uint16 = 0x0010
```

### <a id="http2cipher_TLS_DHE_DSS_EXPORT_WITH_DES40_CBC_SHA" href="#http2cipher_TLS_DHE_DSS_EXPORT_WITH_DES40_CBC_SHA">const http2cipher_TLS_DHE_DSS_EXPORT_WITH_DES40_CBC_SHA</a>

```
searchKey: http.http2cipher_TLS_DHE_DSS_EXPORT_WITH_DES40_CBC_SHA
tags: [private]
```

```Go
const http2cipher_TLS_DHE_DSS_EXPORT_WITH_DES40_CBC_SHA uint16 = 0x0011
```

### <a id="http2cipher_TLS_DHE_DSS_WITH_DES_CBC_SHA" href="#http2cipher_TLS_DHE_DSS_WITH_DES_CBC_SHA">const http2cipher_TLS_DHE_DSS_WITH_DES_CBC_SHA</a>

```
searchKey: http.http2cipher_TLS_DHE_DSS_WITH_DES_CBC_SHA
tags: [private]
```

```Go
const http2cipher_TLS_DHE_DSS_WITH_DES_CBC_SHA uint16 = 0x0012
```

### <a id="http2cipher_TLS_DHE_DSS_WITH_3DES_EDE_CBC_SHA" href="#http2cipher_TLS_DHE_DSS_WITH_3DES_EDE_CBC_SHA">const http2cipher_TLS_DHE_DSS_WITH_3DES_EDE_CBC_SHA</a>

```
searchKey: http.http2cipher_TLS_DHE_DSS_WITH_3DES_EDE_CBC_SHA
tags: [private]
```

```Go
const http2cipher_TLS_DHE_DSS_WITH_3DES_EDE_CBC_SHA uint16 = 0x0013
```

### <a id="http2cipher_TLS_DHE_RSA_EXPORT_WITH_DES40_CBC_SHA" href="#http2cipher_TLS_DHE_RSA_EXPORT_WITH_DES40_CBC_SHA">const http2cipher_TLS_DHE_RSA_EXPORT_WITH_DES40_CBC_SHA</a>

```
searchKey: http.http2cipher_TLS_DHE_RSA_EXPORT_WITH_DES40_CBC_SHA
tags: [private]
```

```Go
const http2cipher_TLS_DHE_RSA_EXPORT_WITH_DES40_CBC_SHA uint16 = 0x0014
```

### <a id="http2cipher_TLS_DHE_RSA_WITH_DES_CBC_SHA" href="#http2cipher_TLS_DHE_RSA_WITH_DES_CBC_SHA">const http2cipher_TLS_DHE_RSA_WITH_DES_CBC_SHA</a>

```
searchKey: http.http2cipher_TLS_DHE_RSA_WITH_DES_CBC_SHA
tags: [private]
```

```Go
const http2cipher_TLS_DHE_RSA_WITH_DES_CBC_SHA uint16 = 0x0015
```

### <a id="http2cipher_TLS_DHE_RSA_WITH_3DES_EDE_CBC_SHA" href="#http2cipher_TLS_DHE_RSA_WITH_3DES_EDE_CBC_SHA">const http2cipher_TLS_DHE_RSA_WITH_3DES_EDE_CBC_SHA</a>

```
searchKey: http.http2cipher_TLS_DHE_RSA_WITH_3DES_EDE_CBC_SHA
tags: [private]
```

```Go
const http2cipher_TLS_DHE_RSA_WITH_3DES_EDE_CBC_SHA uint16 = 0x0016
```

### <a id="http2cipher_TLS_DH_anon_EXPORT_WITH_RC4_40_MD5" href="#http2cipher_TLS_DH_anon_EXPORT_WITH_RC4_40_MD5">const http2cipher_TLS_DH_anon_EXPORT_WITH_RC4_40_MD5</a>

```
searchKey: http.http2cipher_TLS_DH_anon_EXPORT_WITH_RC4_40_MD5
tags: [private]
```

```Go
const http2cipher_TLS_DH_anon_EXPORT_WITH_RC4_40_MD5 uint16 = 0x0017
```

### <a id="http2cipher_TLS_DH_anon_WITH_RC4_128_MD5" href="#http2cipher_TLS_DH_anon_WITH_RC4_128_MD5">const http2cipher_TLS_DH_anon_WITH_RC4_128_MD5</a>

```
searchKey: http.http2cipher_TLS_DH_anon_WITH_RC4_128_MD5
tags: [private]
```

```Go
const http2cipher_TLS_DH_anon_WITH_RC4_128_MD5 uint16 = 0x0018
```

### <a id="http2cipher_TLS_DH_anon_EXPORT_WITH_DES40_CBC_SHA" href="#http2cipher_TLS_DH_anon_EXPORT_WITH_DES40_CBC_SHA">const http2cipher_TLS_DH_anon_EXPORT_WITH_DES40_CBC_SHA</a>

```
searchKey: http.http2cipher_TLS_DH_anon_EXPORT_WITH_DES40_CBC_SHA
tags: [private]
```

```Go
const http2cipher_TLS_DH_anon_EXPORT_WITH_DES40_CBC_SHA uint16 = 0x0019
```

### <a id="http2cipher_TLS_DH_anon_WITH_DES_CBC_SHA" href="#http2cipher_TLS_DH_anon_WITH_DES_CBC_SHA">const http2cipher_TLS_DH_anon_WITH_DES_CBC_SHA</a>

```
searchKey: http.http2cipher_TLS_DH_anon_WITH_DES_CBC_SHA
tags: [private]
```

```Go
const http2cipher_TLS_DH_anon_WITH_DES_CBC_SHA uint16 = 0x001A
```

### <a id="http2cipher_TLS_DH_anon_WITH_3DES_EDE_CBC_SHA" href="#http2cipher_TLS_DH_anon_WITH_3DES_EDE_CBC_SHA">const http2cipher_TLS_DH_anon_WITH_3DES_EDE_CBC_SHA</a>

```
searchKey: http.http2cipher_TLS_DH_anon_WITH_3DES_EDE_CBC_SHA
tags: [private]
```

```Go
const http2cipher_TLS_DH_anon_WITH_3DES_EDE_CBC_SHA uint16 = 0x001B
```

### <a id="http2cipher_TLS_KRB5_WITH_DES_CBC_SHA" href="#http2cipher_TLS_KRB5_WITH_DES_CBC_SHA">const http2cipher_TLS_KRB5_WITH_DES_CBC_SHA</a>

```
searchKey: http.http2cipher_TLS_KRB5_WITH_DES_CBC_SHA
tags: [private]
```

```Go
const http2cipher_TLS_KRB5_WITH_DES_CBC_SHA uint16 = 0x001E
```

Reserved uint16 =  0x001C-1D 

### <a id="http2cipher_TLS_KRB5_WITH_3DES_EDE_CBC_SHA" href="#http2cipher_TLS_KRB5_WITH_3DES_EDE_CBC_SHA">const http2cipher_TLS_KRB5_WITH_3DES_EDE_CBC_SHA</a>

```
searchKey: http.http2cipher_TLS_KRB5_WITH_3DES_EDE_CBC_SHA
tags: [private]
```

```Go
const http2cipher_TLS_KRB5_WITH_3DES_EDE_CBC_SHA uint16 = 0x001F
```

### <a id="http2cipher_TLS_KRB5_WITH_RC4_128_SHA" href="#http2cipher_TLS_KRB5_WITH_RC4_128_SHA">const http2cipher_TLS_KRB5_WITH_RC4_128_SHA</a>

```
searchKey: http.http2cipher_TLS_KRB5_WITH_RC4_128_SHA
tags: [private]
```

```Go
const http2cipher_TLS_KRB5_WITH_RC4_128_SHA uint16 = 0x0020
```

### <a id="http2cipher_TLS_KRB5_WITH_IDEA_CBC_SHA" href="#http2cipher_TLS_KRB5_WITH_IDEA_CBC_SHA">const http2cipher_TLS_KRB5_WITH_IDEA_CBC_SHA</a>

```
searchKey: http.http2cipher_TLS_KRB5_WITH_IDEA_CBC_SHA
tags: [private]
```

```Go
const http2cipher_TLS_KRB5_WITH_IDEA_CBC_SHA uint16 = 0x0021
```

### <a id="http2cipher_TLS_KRB5_WITH_DES_CBC_MD5" href="#http2cipher_TLS_KRB5_WITH_DES_CBC_MD5">const http2cipher_TLS_KRB5_WITH_DES_CBC_MD5</a>

```
searchKey: http.http2cipher_TLS_KRB5_WITH_DES_CBC_MD5
tags: [private]
```

```Go
const http2cipher_TLS_KRB5_WITH_DES_CBC_MD5 uint16 = 0x0022
```

### <a id="http2cipher_TLS_KRB5_WITH_3DES_EDE_CBC_MD5" href="#http2cipher_TLS_KRB5_WITH_3DES_EDE_CBC_MD5">const http2cipher_TLS_KRB5_WITH_3DES_EDE_CBC_MD5</a>

```
searchKey: http.http2cipher_TLS_KRB5_WITH_3DES_EDE_CBC_MD5
tags: [private]
```

```Go
const http2cipher_TLS_KRB5_WITH_3DES_EDE_CBC_MD5 uint16 = 0x0023
```

### <a id="http2cipher_TLS_KRB5_WITH_RC4_128_MD5" href="#http2cipher_TLS_KRB5_WITH_RC4_128_MD5">const http2cipher_TLS_KRB5_WITH_RC4_128_MD5</a>

```
searchKey: http.http2cipher_TLS_KRB5_WITH_RC4_128_MD5
tags: [private]
```

```Go
const http2cipher_TLS_KRB5_WITH_RC4_128_MD5 uint16 = 0x0024
```

### <a id="http2cipher_TLS_KRB5_WITH_IDEA_CBC_MD5" href="#http2cipher_TLS_KRB5_WITH_IDEA_CBC_MD5">const http2cipher_TLS_KRB5_WITH_IDEA_CBC_MD5</a>

```
searchKey: http.http2cipher_TLS_KRB5_WITH_IDEA_CBC_MD5
tags: [private]
```

```Go
const http2cipher_TLS_KRB5_WITH_IDEA_CBC_MD5 uint16 = 0x0025
```

### <a id="http2cipher_TLS_KRB5_EXPORT_WITH_DES_CBC_40_SHA" href="#http2cipher_TLS_KRB5_EXPORT_WITH_DES_CBC_40_SHA">const http2cipher_TLS_KRB5_EXPORT_WITH_DES_CBC_40_SHA</a>

```
searchKey: http.http2cipher_TLS_KRB5_EXPORT_WITH_DES_CBC_40_SHA
tags: [private]
```

```Go
const http2cipher_TLS_KRB5_EXPORT_WITH_DES_CBC_40_SHA uint16 = 0x0026
```

### <a id="http2cipher_TLS_KRB5_EXPORT_WITH_RC2_CBC_40_SHA" href="#http2cipher_TLS_KRB5_EXPORT_WITH_RC2_CBC_40_SHA">const http2cipher_TLS_KRB5_EXPORT_WITH_RC2_CBC_40_SHA</a>

```
searchKey: http.http2cipher_TLS_KRB5_EXPORT_WITH_RC2_CBC_40_SHA
tags: [private]
```

```Go
const http2cipher_TLS_KRB5_EXPORT_WITH_RC2_CBC_40_SHA uint16 = 0x0027
```

### <a id="http2cipher_TLS_KRB5_EXPORT_WITH_RC4_40_SHA" href="#http2cipher_TLS_KRB5_EXPORT_WITH_RC4_40_SHA">const http2cipher_TLS_KRB5_EXPORT_WITH_RC4_40_SHA</a>

```
searchKey: http.http2cipher_TLS_KRB5_EXPORT_WITH_RC4_40_SHA
tags: [private]
```

```Go
const http2cipher_TLS_KRB5_EXPORT_WITH_RC4_40_SHA uint16 = 0x0028
```

### <a id="http2cipher_TLS_KRB5_EXPORT_WITH_DES_CBC_40_MD5" href="#http2cipher_TLS_KRB5_EXPORT_WITH_DES_CBC_40_MD5">const http2cipher_TLS_KRB5_EXPORT_WITH_DES_CBC_40_MD5</a>

```
searchKey: http.http2cipher_TLS_KRB5_EXPORT_WITH_DES_CBC_40_MD5
tags: [private]
```

```Go
const http2cipher_TLS_KRB5_EXPORT_WITH_DES_CBC_40_MD5 uint16 = 0x0029
```

### <a id="http2cipher_TLS_KRB5_EXPORT_WITH_RC2_CBC_40_MD5" href="#http2cipher_TLS_KRB5_EXPORT_WITH_RC2_CBC_40_MD5">const http2cipher_TLS_KRB5_EXPORT_WITH_RC2_CBC_40_MD5</a>

```
searchKey: http.http2cipher_TLS_KRB5_EXPORT_WITH_RC2_CBC_40_MD5
tags: [private]
```

```Go
const http2cipher_TLS_KRB5_EXPORT_WITH_RC2_CBC_40_MD5 uint16 = 0x002A
```

### <a id="http2cipher_TLS_KRB5_EXPORT_WITH_RC4_40_MD5" href="#http2cipher_TLS_KRB5_EXPORT_WITH_RC4_40_MD5">const http2cipher_TLS_KRB5_EXPORT_WITH_RC4_40_MD5</a>

```
searchKey: http.http2cipher_TLS_KRB5_EXPORT_WITH_RC4_40_MD5
tags: [private]
```

```Go
const http2cipher_TLS_KRB5_EXPORT_WITH_RC4_40_MD5 uint16 = 0x002B
```

### <a id="http2cipher_TLS_PSK_WITH_NULL_SHA" href="#http2cipher_TLS_PSK_WITH_NULL_SHA">const http2cipher_TLS_PSK_WITH_NULL_SHA</a>

```
searchKey: http.http2cipher_TLS_PSK_WITH_NULL_SHA
tags: [private]
```

```Go
const http2cipher_TLS_PSK_WITH_NULL_SHA uint16 = 0x002C
```

### <a id="http2cipher_TLS_DHE_PSK_WITH_NULL_SHA" href="#http2cipher_TLS_DHE_PSK_WITH_NULL_SHA">const http2cipher_TLS_DHE_PSK_WITH_NULL_SHA</a>

```
searchKey: http.http2cipher_TLS_DHE_PSK_WITH_NULL_SHA
tags: [private]
```

```Go
const http2cipher_TLS_DHE_PSK_WITH_NULL_SHA uint16 = 0x002D
```

### <a id="http2cipher_TLS_RSA_PSK_WITH_NULL_SHA" href="#http2cipher_TLS_RSA_PSK_WITH_NULL_SHA">const http2cipher_TLS_RSA_PSK_WITH_NULL_SHA</a>

```
searchKey: http.http2cipher_TLS_RSA_PSK_WITH_NULL_SHA
tags: [private]
```

```Go
const http2cipher_TLS_RSA_PSK_WITH_NULL_SHA uint16 = 0x002E
```

### <a id="http2cipher_TLS_RSA_WITH_AES_128_CBC_SHA" href="#http2cipher_TLS_RSA_WITH_AES_128_CBC_SHA">const http2cipher_TLS_RSA_WITH_AES_128_CBC_SHA</a>

```
searchKey: http.http2cipher_TLS_RSA_WITH_AES_128_CBC_SHA
tags: [private]
```

```Go
const http2cipher_TLS_RSA_WITH_AES_128_CBC_SHA uint16 = 0x002F
```

### <a id="http2cipher_TLS_DH_DSS_WITH_AES_128_CBC_SHA" href="#http2cipher_TLS_DH_DSS_WITH_AES_128_CBC_SHA">const http2cipher_TLS_DH_DSS_WITH_AES_128_CBC_SHA</a>

```
searchKey: http.http2cipher_TLS_DH_DSS_WITH_AES_128_CBC_SHA
tags: [private]
```

```Go
const http2cipher_TLS_DH_DSS_WITH_AES_128_CBC_SHA uint16 = 0x0030
```

### <a id="http2cipher_TLS_DH_RSA_WITH_AES_128_CBC_SHA" href="#http2cipher_TLS_DH_RSA_WITH_AES_128_CBC_SHA">const http2cipher_TLS_DH_RSA_WITH_AES_128_CBC_SHA</a>

```
searchKey: http.http2cipher_TLS_DH_RSA_WITH_AES_128_CBC_SHA
tags: [private]
```

```Go
const http2cipher_TLS_DH_RSA_WITH_AES_128_CBC_SHA uint16 = 0x0031
```

### <a id="http2cipher_TLS_DHE_DSS_WITH_AES_128_CBC_SHA" href="#http2cipher_TLS_DHE_DSS_WITH_AES_128_CBC_SHA">const http2cipher_TLS_DHE_DSS_WITH_AES_128_CBC_SHA</a>

```
searchKey: http.http2cipher_TLS_DHE_DSS_WITH_AES_128_CBC_SHA
tags: [private]
```

```Go
const http2cipher_TLS_DHE_DSS_WITH_AES_128_CBC_SHA uint16 = 0x0032
```

### <a id="http2cipher_TLS_DHE_RSA_WITH_AES_128_CBC_SHA" href="#http2cipher_TLS_DHE_RSA_WITH_AES_128_CBC_SHA">const http2cipher_TLS_DHE_RSA_WITH_AES_128_CBC_SHA</a>

```
searchKey: http.http2cipher_TLS_DHE_RSA_WITH_AES_128_CBC_SHA
tags: [private]
```

```Go
const http2cipher_TLS_DHE_RSA_WITH_AES_128_CBC_SHA uint16 = 0x0033
```

### <a id="http2cipher_TLS_DH_anon_WITH_AES_128_CBC_SHA" href="#http2cipher_TLS_DH_anon_WITH_AES_128_CBC_SHA">const http2cipher_TLS_DH_anon_WITH_AES_128_CBC_SHA</a>

```
searchKey: http.http2cipher_TLS_DH_anon_WITH_AES_128_CBC_SHA
tags: [private]
```

```Go
const http2cipher_TLS_DH_anon_WITH_AES_128_CBC_SHA uint16 = 0x0034
```

### <a id="http2cipher_TLS_RSA_WITH_AES_256_CBC_SHA" href="#http2cipher_TLS_RSA_WITH_AES_256_CBC_SHA">const http2cipher_TLS_RSA_WITH_AES_256_CBC_SHA</a>

```
searchKey: http.http2cipher_TLS_RSA_WITH_AES_256_CBC_SHA
tags: [private]
```

```Go
const http2cipher_TLS_RSA_WITH_AES_256_CBC_SHA uint16 = 0x0035
```

### <a id="http2cipher_TLS_DH_DSS_WITH_AES_256_CBC_SHA" href="#http2cipher_TLS_DH_DSS_WITH_AES_256_CBC_SHA">const http2cipher_TLS_DH_DSS_WITH_AES_256_CBC_SHA</a>

```
searchKey: http.http2cipher_TLS_DH_DSS_WITH_AES_256_CBC_SHA
tags: [private]
```

```Go
const http2cipher_TLS_DH_DSS_WITH_AES_256_CBC_SHA uint16 = 0x0036
```

### <a id="http2cipher_TLS_DH_RSA_WITH_AES_256_CBC_SHA" href="#http2cipher_TLS_DH_RSA_WITH_AES_256_CBC_SHA">const http2cipher_TLS_DH_RSA_WITH_AES_256_CBC_SHA</a>

```
searchKey: http.http2cipher_TLS_DH_RSA_WITH_AES_256_CBC_SHA
tags: [private]
```

```Go
const http2cipher_TLS_DH_RSA_WITH_AES_256_CBC_SHA uint16 = 0x0037
```

### <a id="http2cipher_TLS_DHE_DSS_WITH_AES_256_CBC_SHA" href="#http2cipher_TLS_DHE_DSS_WITH_AES_256_CBC_SHA">const http2cipher_TLS_DHE_DSS_WITH_AES_256_CBC_SHA</a>

```
searchKey: http.http2cipher_TLS_DHE_DSS_WITH_AES_256_CBC_SHA
tags: [private]
```

```Go
const http2cipher_TLS_DHE_DSS_WITH_AES_256_CBC_SHA uint16 = 0x0038
```

### <a id="http2cipher_TLS_DHE_RSA_WITH_AES_256_CBC_SHA" href="#http2cipher_TLS_DHE_RSA_WITH_AES_256_CBC_SHA">const http2cipher_TLS_DHE_RSA_WITH_AES_256_CBC_SHA</a>

```
searchKey: http.http2cipher_TLS_DHE_RSA_WITH_AES_256_CBC_SHA
tags: [private]
```

```Go
const http2cipher_TLS_DHE_RSA_WITH_AES_256_CBC_SHA uint16 = 0x0039
```

### <a id="http2cipher_TLS_DH_anon_WITH_AES_256_CBC_SHA" href="#http2cipher_TLS_DH_anon_WITH_AES_256_CBC_SHA">const http2cipher_TLS_DH_anon_WITH_AES_256_CBC_SHA</a>

```
searchKey: http.http2cipher_TLS_DH_anon_WITH_AES_256_CBC_SHA
tags: [private]
```

```Go
const http2cipher_TLS_DH_anon_WITH_AES_256_CBC_SHA uint16 = 0x003A
```

### <a id="http2cipher_TLS_RSA_WITH_NULL_SHA256" href="#http2cipher_TLS_RSA_WITH_NULL_SHA256">const http2cipher_TLS_RSA_WITH_NULL_SHA256</a>

```
searchKey: http.http2cipher_TLS_RSA_WITH_NULL_SHA256
tags: [private]
```

```Go
const http2cipher_TLS_RSA_WITH_NULL_SHA256 uint16 = 0x003B
```

### <a id="http2cipher_TLS_RSA_WITH_AES_128_CBC_SHA256" href="#http2cipher_TLS_RSA_WITH_AES_128_CBC_SHA256">const http2cipher_TLS_RSA_WITH_AES_128_CBC_SHA256</a>

```
searchKey: http.http2cipher_TLS_RSA_WITH_AES_128_CBC_SHA256
tags: [private]
```

```Go
const http2cipher_TLS_RSA_WITH_AES_128_CBC_SHA256 uint16 = 0x003C
```

### <a id="http2cipher_TLS_RSA_WITH_AES_256_CBC_SHA256" href="#http2cipher_TLS_RSA_WITH_AES_256_CBC_SHA256">const http2cipher_TLS_RSA_WITH_AES_256_CBC_SHA256</a>

```
searchKey: http.http2cipher_TLS_RSA_WITH_AES_256_CBC_SHA256
tags: [private]
```

```Go
const http2cipher_TLS_RSA_WITH_AES_256_CBC_SHA256 uint16 = 0x003D
```

### <a id="http2cipher_TLS_DH_DSS_WITH_AES_128_CBC_SHA256" href="#http2cipher_TLS_DH_DSS_WITH_AES_128_CBC_SHA256">const http2cipher_TLS_DH_DSS_WITH_AES_128_CBC_SHA256</a>

```
searchKey: http.http2cipher_TLS_DH_DSS_WITH_AES_128_CBC_SHA256
tags: [private]
```

```Go
const http2cipher_TLS_DH_DSS_WITH_AES_128_CBC_SHA256 uint16 = 0x003E
```

### <a id="http2cipher_TLS_DH_RSA_WITH_AES_128_CBC_SHA256" href="#http2cipher_TLS_DH_RSA_WITH_AES_128_CBC_SHA256">const http2cipher_TLS_DH_RSA_WITH_AES_128_CBC_SHA256</a>

```
searchKey: http.http2cipher_TLS_DH_RSA_WITH_AES_128_CBC_SHA256
tags: [private]
```

```Go
const http2cipher_TLS_DH_RSA_WITH_AES_128_CBC_SHA256 uint16 = 0x003F
```

### <a id="http2cipher_TLS_DHE_DSS_WITH_AES_128_CBC_SHA256" href="#http2cipher_TLS_DHE_DSS_WITH_AES_128_CBC_SHA256">const http2cipher_TLS_DHE_DSS_WITH_AES_128_CBC_SHA256</a>

```
searchKey: http.http2cipher_TLS_DHE_DSS_WITH_AES_128_CBC_SHA256
tags: [private]
```

```Go
const http2cipher_TLS_DHE_DSS_WITH_AES_128_CBC_SHA256 uint16 = 0x0040
```

### <a id="http2cipher_TLS_RSA_WITH_CAMELLIA_128_CBC_SHA" href="#http2cipher_TLS_RSA_WITH_CAMELLIA_128_CBC_SHA">const http2cipher_TLS_RSA_WITH_CAMELLIA_128_CBC_SHA</a>

```
searchKey: http.http2cipher_TLS_RSA_WITH_CAMELLIA_128_CBC_SHA
tags: [private]
```

```Go
const http2cipher_TLS_RSA_WITH_CAMELLIA_128_CBC_SHA uint16 = 0x0041
```

### <a id="http2cipher_TLS_DH_DSS_WITH_CAMELLIA_128_CBC_SHA" href="#http2cipher_TLS_DH_DSS_WITH_CAMELLIA_128_CBC_SHA">const http2cipher_TLS_DH_DSS_WITH_CAMELLIA_128_CBC_SHA</a>

```
searchKey: http.http2cipher_TLS_DH_DSS_WITH_CAMELLIA_128_CBC_SHA
tags: [private]
```

```Go
const http2cipher_TLS_DH_DSS_WITH_CAMELLIA_128_CBC_SHA uint16 = 0x0042
```

### <a id="http2cipher_TLS_DH_RSA_WITH_CAMELLIA_128_CBC_SHA" href="#http2cipher_TLS_DH_RSA_WITH_CAMELLIA_128_CBC_SHA">const http2cipher_TLS_DH_RSA_WITH_CAMELLIA_128_CBC_SHA</a>

```
searchKey: http.http2cipher_TLS_DH_RSA_WITH_CAMELLIA_128_CBC_SHA
tags: [private]
```

```Go
const http2cipher_TLS_DH_RSA_WITH_CAMELLIA_128_CBC_SHA uint16 = 0x0043
```

### <a id="http2cipher_TLS_DHE_DSS_WITH_CAMELLIA_128_CBC_SHA" href="#http2cipher_TLS_DHE_DSS_WITH_CAMELLIA_128_CBC_SHA">const http2cipher_TLS_DHE_DSS_WITH_CAMELLIA_128_CBC_SHA</a>

```
searchKey: http.http2cipher_TLS_DHE_DSS_WITH_CAMELLIA_128_CBC_SHA
tags: [private]
```

```Go
const http2cipher_TLS_DHE_DSS_WITH_CAMELLIA_128_CBC_SHA uint16 = 0x0044
```

### <a id="http2cipher_TLS_DHE_RSA_WITH_CAMELLIA_128_CBC_SHA" href="#http2cipher_TLS_DHE_RSA_WITH_CAMELLIA_128_CBC_SHA">const http2cipher_TLS_DHE_RSA_WITH_CAMELLIA_128_CBC_SHA</a>

```
searchKey: http.http2cipher_TLS_DHE_RSA_WITH_CAMELLIA_128_CBC_SHA
tags: [private]
```

```Go
const http2cipher_TLS_DHE_RSA_WITH_CAMELLIA_128_CBC_SHA uint16 = 0x0045
```

### <a id="http2cipher_TLS_DH_anon_WITH_CAMELLIA_128_CBC_SHA" href="#http2cipher_TLS_DH_anon_WITH_CAMELLIA_128_CBC_SHA">const http2cipher_TLS_DH_anon_WITH_CAMELLIA_128_CBC_SHA</a>

```
searchKey: http.http2cipher_TLS_DH_anon_WITH_CAMELLIA_128_CBC_SHA
tags: [private]
```

```Go
const http2cipher_TLS_DH_anon_WITH_CAMELLIA_128_CBC_SHA uint16 = 0x0046
```

### <a id="http2cipher_TLS_DHE_RSA_WITH_AES_128_CBC_SHA256" href="#http2cipher_TLS_DHE_RSA_WITH_AES_128_CBC_SHA256">const http2cipher_TLS_DHE_RSA_WITH_AES_128_CBC_SHA256</a>

```
searchKey: http.http2cipher_TLS_DHE_RSA_WITH_AES_128_CBC_SHA256
tags: [private]
```

```Go
const http2cipher_TLS_DHE_RSA_WITH_AES_128_CBC_SHA256 uint16 = 0x0067
```

Reserved uint16 =  0x0047-4F Reserved uint16 =  0x0050-58 Reserved uint16 =  0x0059-5C Unassigned uint16 =  0x005D-5F Reserved uint16 =  0x0060-66 

### <a id="http2cipher_TLS_DH_DSS_WITH_AES_256_CBC_SHA256" href="#http2cipher_TLS_DH_DSS_WITH_AES_256_CBC_SHA256">const http2cipher_TLS_DH_DSS_WITH_AES_256_CBC_SHA256</a>

```
searchKey: http.http2cipher_TLS_DH_DSS_WITH_AES_256_CBC_SHA256
tags: [private]
```

```Go
const http2cipher_TLS_DH_DSS_WITH_AES_256_CBC_SHA256 uint16 = 0x0068
```

### <a id="http2cipher_TLS_DH_RSA_WITH_AES_256_CBC_SHA256" href="#http2cipher_TLS_DH_RSA_WITH_AES_256_CBC_SHA256">const http2cipher_TLS_DH_RSA_WITH_AES_256_CBC_SHA256</a>

```
searchKey: http.http2cipher_TLS_DH_RSA_WITH_AES_256_CBC_SHA256
tags: [private]
```

```Go
const http2cipher_TLS_DH_RSA_WITH_AES_256_CBC_SHA256 uint16 = 0x0069
```

### <a id="http2cipher_TLS_DHE_DSS_WITH_AES_256_CBC_SHA256" href="#http2cipher_TLS_DHE_DSS_WITH_AES_256_CBC_SHA256">const http2cipher_TLS_DHE_DSS_WITH_AES_256_CBC_SHA256</a>

```
searchKey: http.http2cipher_TLS_DHE_DSS_WITH_AES_256_CBC_SHA256
tags: [private]
```

```Go
const http2cipher_TLS_DHE_DSS_WITH_AES_256_CBC_SHA256 uint16 = 0x006A
```

### <a id="http2cipher_TLS_DHE_RSA_WITH_AES_256_CBC_SHA256" href="#http2cipher_TLS_DHE_RSA_WITH_AES_256_CBC_SHA256">const http2cipher_TLS_DHE_RSA_WITH_AES_256_CBC_SHA256</a>

```
searchKey: http.http2cipher_TLS_DHE_RSA_WITH_AES_256_CBC_SHA256
tags: [private]
```

```Go
const http2cipher_TLS_DHE_RSA_WITH_AES_256_CBC_SHA256 uint16 = 0x006B
```

### <a id="http2cipher_TLS_DH_anon_WITH_AES_128_CBC_SHA256" href="#http2cipher_TLS_DH_anon_WITH_AES_128_CBC_SHA256">const http2cipher_TLS_DH_anon_WITH_AES_128_CBC_SHA256</a>

```
searchKey: http.http2cipher_TLS_DH_anon_WITH_AES_128_CBC_SHA256
tags: [private]
```

```Go
const http2cipher_TLS_DH_anon_WITH_AES_128_CBC_SHA256 uint16 = 0x006C
```

### <a id="http2cipher_TLS_DH_anon_WITH_AES_256_CBC_SHA256" href="#http2cipher_TLS_DH_anon_WITH_AES_256_CBC_SHA256">const http2cipher_TLS_DH_anon_WITH_AES_256_CBC_SHA256</a>

```
searchKey: http.http2cipher_TLS_DH_anon_WITH_AES_256_CBC_SHA256
tags: [private]
```

```Go
const http2cipher_TLS_DH_anon_WITH_AES_256_CBC_SHA256 uint16 = 0x006D
```

### <a id="http2cipher_TLS_RSA_WITH_CAMELLIA_256_CBC_SHA" href="#http2cipher_TLS_RSA_WITH_CAMELLIA_256_CBC_SHA">const http2cipher_TLS_RSA_WITH_CAMELLIA_256_CBC_SHA</a>

```
searchKey: http.http2cipher_TLS_RSA_WITH_CAMELLIA_256_CBC_SHA
tags: [private]
```

```Go
const http2cipher_TLS_RSA_WITH_CAMELLIA_256_CBC_SHA uint16 = 0x0084
```

Unassigned uint16 =  0x006E-83 

### <a id="http2cipher_TLS_DH_DSS_WITH_CAMELLIA_256_CBC_SHA" href="#http2cipher_TLS_DH_DSS_WITH_CAMELLIA_256_CBC_SHA">const http2cipher_TLS_DH_DSS_WITH_CAMELLIA_256_CBC_SHA</a>

```
searchKey: http.http2cipher_TLS_DH_DSS_WITH_CAMELLIA_256_CBC_SHA
tags: [private]
```

```Go
const http2cipher_TLS_DH_DSS_WITH_CAMELLIA_256_CBC_SHA uint16 = 0x0085
```

### <a id="http2cipher_TLS_DH_RSA_WITH_CAMELLIA_256_CBC_SHA" href="#http2cipher_TLS_DH_RSA_WITH_CAMELLIA_256_CBC_SHA">const http2cipher_TLS_DH_RSA_WITH_CAMELLIA_256_CBC_SHA</a>

```
searchKey: http.http2cipher_TLS_DH_RSA_WITH_CAMELLIA_256_CBC_SHA
tags: [private]
```

```Go
const http2cipher_TLS_DH_RSA_WITH_CAMELLIA_256_CBC_SHA uint16 = 0x0086
```

### <a id="http2cipher_TLS_DHE_DSS_WITH_CAMELLIA_256_CBC_SHA" href="#http2cipher_TLS_DHE_DSS_WITH_CAMELLIA_256_CBC_SHA">const http2cipher_TLS_DHE_DSS_WITH_CAMELLIA_256_CBC_SHA</a>

```
searchKey: http.http2cipher_TLS_DHE_DSS_WITH_CAMELLIA_256_CBC_SHA
tags: [private]
```

```Go
const http2cipher_TLS_DHE_DSS_WITH_CAMELLIA_256_CBC_SHA uint16 = 0x0087
```

### <a id="http2cipher_TLS_DHE_RSA_WITH_CAMELLIA_256_CBC_SHA" href="#http2cipher_TLS_DHE_RSA_WITH_CAMELLIA_256_CBC_SHA">const http2cipher_TLS_DHE_RSA_WITH_CAMELLIA_256_CBC_SHA</a>

```
searchKey: http.http2cipher_TLS_DHE_RSA_WITH_CAMELLIA_256_CBC_SHA
tags: [private]
```

```Go
const http2cipher_TLS_DHE_RSA_WITH_CAMELLIA_256_CBC_SHA uint16 = 0x0088
```

### <a id="http2cipher_TLS_DH_anon_WITH_CAMELLIA_256_CBC_SHA" href="#http2cipher_TLS_DH_anon_WITH_CAMELLIA_256_CBC_SHA">const http2cipher_TLS_DH_anon_WITH_CAMELLIA_256_CBC_SHA</a>

```
searchKey: http.http2cipher_TLS_DH_anon_WITH_CAMELLIA_256_CBC_SHA
tags: [private]
```

```Go
const http2cipher_TLS_DH_anon_WITH_CAMELLIA_256_CBC_SHA uint16 = 0x0089
```

### <a id="http2cipher_TLS_PSK_WITH_RC4_128_SHA" href="#http2cipher_TLS_PSK_WITH_RC4_128_SHA">const http2cipher_TLS_PSK_WITH_RC4_128_SHA</a>

```
searchKey: http.http2cipher_TLS_PSK_WITH_RC4_128_SHA
tags: [private]
```

```Go
const http2cipher_TLS_PSK_WITH_RC4_128_SHA uint16 = 0x008A
```

### <a id="http2cipher_TLS_PSK_WITH_3DES_EDE_CBC_SHA" href="#http2cipher_TLS_PSK_WITH_3DES_EDE_CBC_SHA">const http2cipher_TLS_PSK_WITH_3DES_EDE_CBC_SHA</a>

```
searchKey: http.http2cipher_TLS_PSK_WITH_3DES_EDE_CBC_SHA
tags: [private]
```

```Go
const http2cipher_TLS_PSK_WITH_3DES_EDE_CBC_SHA uint16 = 0x008B
```

### <a id="http2cipher_TLS_PSK_WITH_AES_128_CBC_SHA" href="#http2cipher_TLS_PSK_WITH_AES_128_CBC_SHA">const http2cipher_TLS_PSK_WITH_AES_128_CBC_SHA</a>

```
searchKey: http.http2cipher_TLS_PSK_WITH_AES_128_CBC_SHA
tags: [private]
```

```Go
const http2cipher_TLS_PSK_WITH_AES_128_CBC_SHA uint16 = 0x008C
```

### <a id="http2cipher_TLS_PSK_WITH_AES_256_CBC_SHA" href="#http2cipher_TLS_PSK_WITH_AES_256_CBC_SHA">const http2cipher_TLS_PSK_WITH_AES_256_CBC_SHA</a>

```
searchKey: http.http2cipher_TLS_PSK_WITH_AES_256_CBC_SHA
tags: [private]
```

```Go
const http2cipher_TLS_PSK_WITH_AES_256_CBC_SHA uint16 = 0x008D
```

### <a id="http2cipher_TLS_DHE_PSK_WITH_RC4_128_SHA" href="#http2cipher_TLS_DHE_PSK_WITH_RC4_128_SHA">const http2cipher_TLS_DHE_PSK_WITH_RC4_128_SHA</a>

```
searchKey: http.http2cipher_TLS_DHE_PSK_WITH_RC4_128_SHA
tags: [private]
```

```Go
const http2cipher_TLS_DHE_PSK_WITH_RC4_128_SHA uint16 = 0x008E
```

### <a id="http2cipher_TLS_DHE_PSK_WITH_3DES_EDE_CBC_SHA" href="#http2cipher_TLS_DHE_PSK_WITH_3DES_EDE_CBC_SHA">const http2cipher_TLS_DHE_PSK_WITH_3DES_EDE_CBC_SHA</a>

```
searchKey: http.http2cipher_TLS_DHE_PSK_WITH_3DES_EDE_CBC_SHA
tags: [private]
```

```Go
const http2cipher_TLS_DHE_PSK_WITH_3DES_EDE_CBC_SHA uint16 = 0x008F
```

### <a id="http2cipher_TLS_DHE_PSK_WITH_AES_128_CBC_SHA" href="#http2cipher_TLS_DHE_PSK_WITH_AES_128_CBC_SHA">const http2cipher_TLS_DHE_PSK_WITH_AES_128_CBC_SHA</a>

```
searchKey: http.http2cipher_TLS_DHE_PSK_WITH_AES_128_CBC_SHA
tags: [private]
```

```Go
const http2cipher_TLS_DHE_PSK_WITH_AES_128_CBC_SHA uint16 = 0x0090
```

### <a id="http2cipher_TLS_DHE_PSK_WITH_AES_256_CBC_SHA" href="#http2cipher_TLS_DHE_PSK_WITH_AES_256_CBC_SHA">const http2cipher_TLS_DHE_PSK_WITH_AES_256_CBC_SHA</a>

```
searchKey: http.http2cipher_TLS_DHE_PSK_WITH_AES_256_CBC_SHA
tags: [private]
```

```Go
const http2cipher_TLS_DHE_PSK_WITH_AES_256_CBC_SHA uint16 = 0x0091
```

### <a id="http2cipher_TLS_RSA_PSK_WITH_RC4_128_SHA" href="#http2cipher_TLS_RSA_PSK_WITH_RC4_128_SHA">const http2cipher_TLS_RSA_PSK_WITH_RC4_128_SHA</a>

```
searchKey: http.http2cipher_TLS_RSA_PSK_WITH_RC4_128_SHA
tags: [private]
```

```Go
const http2cipher_TLS_RSA_PSK_WITH_RC4_128_SHA uint16 = 0x0092
```

### <a id="http2cipher_TLS_RSA_PSK_WITH_3DES_EDE_CBC_SHA" href="#http2cipher_TLS_RSA_PSK_WITH_3DES_EDE_CBC_SHA">const http2cipher_TLS_RSA_PSK_WITH_3DES_EDE_CBC_SHA</a>

```
searchKey: http.http2cipher_TLS_RSA_PSK_WITH_3DES_EDE_CBC_SHA
tags: [private]
```

```Go
const http2cipher_TLS_RSA_PSK_WITH_3DES_EDE_CBC_SHA uint16 = 0x0093
```

### <a id="http2cipher_TLS_RSA_PSK_WITH_AES_128_CBC_SHA" href="#http2cipher_TLS_RSA_PSK_WITH_AES_128_CBC_SHA">const http2cipher_TLS_RSA_PSK_WITH_AES_128_CBC_SHA</a>

```
searchKey: http.http2cipher_TLS_RSA_PSK_WITH_AES_128_CBC_SHA
tags: [private]
```

```Go
const http2cipher_TLS_RSA_PSK_WITH_AES_128_CBC_SHA uint16 = 0x0094
```

### <a id="http2cipher_TLS_RSA_PSK_WITH_AES_256_CBC_SHA" href="#http2cipher_TLS_RSA_PSK_WITH_AES_256_CBC_SHA">const http2cipher_TLS_RSA_PSK_WITH_AES_256_CBC_SHA</a>

```
searchKey: http.http2cipher_TLS_RSA_PSK_WITH_AES_256_CBC_SHA
tags: [private]
```

```Go
const http2cipher_TLS_RSA_PSK_WITH_AES_256_CBC_SHA uint16 = 0x0095
```

### <a id="http2cipher_TLS_RSA_WITH_SEED_CBC_SHA" href="#http2cipher_TLS_RSA_WITH_SEED_CBC_SHA">const http2cipher_TLS_RSA_WITH_SEED_CBC_SHA</a>

```
searchKey: http.http2cipher_TLS_RSA_WITH_SEED_CBC_SHA
tags: [private]
```

```Go
const http2cipher_TLS_RSA_WITH_SEED_CBC_SHA uint16 = 0x0096
```

### <a id="http2cipher_TLS_DH_DSS_WITH_SEED_CBC_SHA" href="#http2cipher_TLS_DH_DSS_WITH_SEED_CBC_SHA">const http2cipher_TLS_DH_DSS_WITH_SEED_CBC_SHA</a>

```
searchKey: http.http2cipher_TLS_DH_DSS_WITH_SEED_CBC_SHA
tags: [private]
```

```Go
const http2cipher_TLS_DH_DSS_WITH_SEED_CBC_SHA uint16 = 0x0097
```

### <a id="http2cipher_TLS_DH_RSA_WITH_SEED_CBC_SHA" href="#http2cipher_TLS_DH_RSA_WITH_SEED_CBC_SHA">const http2cipher_TLS_DH_RSA_WITH_SEED_CBC_SHA</a>

```
searchKey: http.http2cipher_TLS_DH_RSA_WITH_SEED_CBC_SHA
tags: [private]
```

```Go
const http2cipher_TLS_DH_RSA_WITH_SEED_CBC_SHA uint16 = 0x0098
```

### <a id="http2cipher_TLS_DHE_DSS_WITH_SEED_CBC_SHA" href="#http2cipher_TLS_DHE_DSS_WITH_SEED_CBC_SHA">const http2cipher_TLS_DHE_DSS_WITH_SEED_CBC_SHA</a>

```
searchKey: http.http2cipher_TLS_DHE_DSS_WITH_SEED_CBC_SHA
tags: [private]
```

```Go
const http2cipher_TLS_DHE_DSS_WITH_SEED_CBC_SHA uint16 = 0x0099
```

### <a id="http2cipher_TLS_DHE_RSA_WITH_SEED_CBC_SHA" href="#http2cipher_TLS_DHE_RSA_WITH_SEED_CBC_SHA">const http2cipher_TLS_DHE_RSA_WITH_SEED_CBC_SHA</a>

```
searchKey: http.http2cipher_TLS_DHE_RSA_WITH_SEED_CBC_SHA
tags: [private]
```

```Go
const http2cipher_TLS_DHE_RSA_WITH_SEED_CBC_SHA uint16 = 0x009A
```

### <a id="http2cipher_TLS_DH_anon_WITH_SEED_CBC_SHA" href="#http2cipher_TLS_DH_anon_WITH_SEED_CBC_SHA">const http2cipher_TLS_DH_anon_WITH_SEED_CBC_SHA</a>

```
searchKey: http.http2cipher_TLS_DH_anon_WITH_SEED_CBC_SHA
tags: [private]
```

```Go
const http2cipher_TLS_DH_anon_WITH_SEED_CBC_SHA uint16 = 0x009B
```

### <a id="http2cipher_TLS_RSA_WITH_AES_128_GCM_SHA256" href="#http2cipher_TLS_RSA_WITH_AES_128_GCM_SHA256">const http2cipher_TLS_RSA_WITH_AES_128_GCM_SHA256</a>

```
searchKey: http.http2cipher_TLS_RSA_WITH_AES_128_GCM_SHA256
tags: [private]
```

```Go
const http2cipher_TLS_RSA_WITH_AES_128_GCM_SHA256 uint16 = 0x009C
```

### <a id="http2cipher_TLS_RSA_WITH_AES_256_GCM_SHA384" href="#http2cipher_TLS_RSA_WITH_AES_256_GCM_SHA384">const http2cipher_TLS_RSA_WITH_AES_256_GCM_SHA384</a>

```
searchKey: http.http2cipher_TLS_RSA_WITH_AES_256_GCM_SHA384
tags: [private]
```

```Go
const http2cipher_TLS_RSA_WITH_AES_256_GCM_SHA384 uint16 = 0x009D
```

### <a id="http2cipher_TLS_DHE_RSA_WITH_AES_128_GCM_SHA256" href="#http2cipher_TLS_DHE_RSA_WITH_AES_128_GCM_SHA256">const http2cipher_TLS_DHE_RSA_WITH_AES_128_GCM_SHA256</a>

```
searchKey: http.http2cipher_TLS_DHE_RSA_WITH_AES_128_GCM_SHA256
tags: [private]
```

```Go
const http2cipher_TLS_DHE_RSA_WITH_AES_128_GCM_SHA256 uint16 = 0x009E
```

### <a id="http2cipher_TLS_DHE_RSA_WITH_AES_256_GCM_SHA384" href="#http2cipher_TLS_DHE_RSA_WITH_AES_256_GCM_SHA384">const http2cipher_TLS_DHE_RSA_WITH_AES_256_GCM_SHA384</a>

```
searchKey: http.http2cipher_TLS_DHE_RSA_WITH_AES_256_GCM_SHA384
tags: [private]
```

```Go
const http2cipher_TLS_DHE_RSA_WITH_AES_256_GCM_SHA384 uint16 = 0x009F
```

### <a id="http2cipher_TLS_DH_RSA_WITH_AES_128_GCM_SHA256" href="#http2cipher_TLS_DH_RSA_WITH_AES_128_GCM_SHA256">const http2cipher_TLS_DH_RSA_WITH_AES_128_GCM_SHA256</a>

```
searchKey: http.http2cipher_TLS_DH_RSA_WITH_AES_128_GCM_SHA256
tags: [private]
```

```Go
const http2cipher_TLS_DH_RSA_WITH_AES_128_GCM_SHA256 uint16 = 0x00A0
```

### <a id="http2cipher_TLS_DH_RSA_WITH_AES_256_GCM_SHA384" href="#http2cipher_TLS_DH_RSA_WITH_AES_256_GCM_SHA384">const http2cipher_TLS_DH_RSA_WITH_AES_256_GCM_SHA384</a>

```
searchKey: http.http2cipher_TLS_DH_RSA_WITH_AES_256_GCM_SHA384
tags: [private]
```

```Go
const http2cipher_TLS_DH_RSA_WITH_AES_256_GCM_SHA384 uint16 = 0x00A1
```

### <a id="http2cipher_TLS_DHE_DSS_WITH_AES_128_GCM_SHA256" href="#http2cipher_TLS_DHE_DSS_WITH_AES_128_GCM_SHA256">const http2cipher_TLS_DHE_DSS_WITH_AES_128_GCM_SHA256</a>

```
searchKey: http.http2cipher_TLS_DHE_DSS_WITH_AES_128_GCM_SHA256
tags: [private]
```

```Go
const http2cipher_TLS_DHE_DSS_WITH_AES_128_GCM_SHA256 uint16 = 0x00A2
```

### <a id="http2cipher_TLS_DHE_DSS_WITH_AES_256_GCM_SHA384" href="#http2cipher_TLS_DHE_DSS_WITH_AES_256_GCM_SHA384">const http2cipher_TLS_DHE_DSS_WITH_AES_256_GCM_SHA384</a>

```
searchKey: http.http2cipher_TLS_DHE_DSS_WITH_AES_256_GCM_SHA384
tags: [private]
```

```Go
const http2cipher_TLS_DHE_DSS_WITH_AES_256_GCM_SHA384 uint16 = 0x00A3
```

### <a id="http2cipher_TLS_DH_DSS_WITH_AES_128_GCM_SHA256" href="#http2cipher_TLS_DH_DSS_WITH_AES_128_GCM_SHA256">const http2cipher_TLS_DH_DSS_WITH_AES_128_GCM_SHA256</a>

```
searchKey: http.http2cipher_TLS_DH_DSS_WITH_AES_128_GCM_SHA256
tags: [private]
```

```Go
const http2cipher_TLS_DH_DSS_WITH_AES_128_GCM_SHA256 uint16 = 0x00A4
```

### <a id="http2cipher_TLS_DH_DSS_WITH_AES_256_GCM_SHA384" href="#http2cipher_TLS_DH_DSS_WITH_AES_256_GCM_SHA384">const http2cipher_TLS_DH_DSS_WITH_AES_256_GCM_SHA384</a>

```
searchKey: http.http2cipher_TLS_DH_DSS_WITH_AES_256_GCM_SHA384
tags: [private]
```

```Go
const http2cipher_TLS_DH_DSS_WITH_AES_256_GCM_SHA384 uint16 = 0x00A5
```

### <a id="http2cipher_TLS_DH_anon_WITH_AES_128_GCM_SHA256" href="#http2cipher_TLS_DH_anon_WITH_AES_128_GCM_SHA256">const http2cipher_TLS_DH_anon_WITH_AES_128_GCM_SHA256</a>

```
searchKey: http.http2cipher_TLS_DH_anon_WITH_AES_128_GCM_SHA256
tags: [private]
```

```Go
const http2cipher_TLS_DH_anon_WITH_AES_128_GCM_SHA256 uint16 = 0x00A6
```

### <a id="http2cipher_TLS_DH_anon_WITH_AES_256_GCM_SHA384" href="#http2cipher_TLS_DH_anon_WITH_AES_256_GCM_SHA384">const http2cipher_TLS_DH_anon_WITH_AES_256_GCM_SHA384</a>

```
searchKey: http.http2cipher_TLS_DH_anon_WITH_AES_256_GCM_SHA384
tags: [private]
```

```Go
const http2cipher_TLS_DH_anon_WITH_AES_256_GCM_SHA384 uint16 = 0x00A7
```

### <a id="http2cipher_TLS_PSK_WITH_AES_128_GCM_SHA256" href="#http2cipher_TLS_PSK_WITH_AES_128_GCM_SHA256">const http2cipher_TLS_PSK_WITH_AES_128_GCM_SHA256</a>

```
searchKey: http.http2cipher_TLS_PSK_WITH_AES_128_GCM_SHA256
tags: [private]
```

```Go
const http2cipher_TLS_PSK_WITH_AES_128_GCM_SHA256 uint16 = 0x00A8
```

### <a id="http2cipher_TLS_PSK_WITH_AES_256_GCM_SHA384" href="#http2cipher_TLS_PSK_WITH_AES_256_GCM_SHA384">const http2cipher_TLS_PSK_WITH_AES_256_GCM_SHA384</a>

```
searchKey: http.http2cipher_TLS_PSK_WITH_AES_256_GCM_SHA384
tags: [private]
```

```Go
const http2cipher_TLS_PSK_WITH_AES_256_GCM_SHA384 uint16 = 0x00A9
```

### <a id="http2cipher_TLS_DHE_PSK_WITH_AES_128_GCM_SHA256" href="#http2cipher_TLS_DHE_PSK_WITH_AES_128_GCM_SHA256">const http2cipher_TLS_DHE_PSK_WITH_AES_128_GCM_SHA256</a>

```
searchKey: http.http2cipher_TLS_DHE_PSK_WITH_AES_128_GCM_SHA256
tags: [private]
```

```Go
const http2cipher_TLS_DHE_PSK_WITH_AES_128_GCM_SHA256 uint16 = 0x00AA
```

### <a id="http2cipher_TLS_DHE_PSK_WITH_AES_256_GCM_SHA384" href="#http2cipher_TLS_DHE_PSK_WITH_AES_256_GCM_SHA384">const http2cipher_TLS_DHE_PSK_WITH_AES_256_GCM_SHA384</a>

```
searchKey: http.http2cipher_TLS_DHE_PSK_WITH_AES_256_GCM_SHA384
tags: [private]
```

```Go
const http2cipher_TLS_DHE_PSK_WITH_AES_256_GCM_SHA384 uint16 = 0x00AB
```

### <a id="http2cipher_TLS_RSA_PSK_WITH_AES_128_GCM_SHA256" href="#http2cipher_TLS_RSA_PSK_WITH_AES_128_GCM_SHA256">const http2cipher_TLS_RSA_PSK_WITH_AES_128_GCM_SHA256</a>

```
searchKey: http.http2cipher_TLS_RSA_PSK_WITH_AES_128_GCM_SHA256
tags: [private]
```

```Go
const http2cipher_TLS_RSA_PSK_WITH_AES_128_GCM_SHA256 uint16 = 0x00AC
```

### <a id="http2cipher_TLS_RSA_PSK_WITH_AES_256_GCM_SHA384" href="#http2cipher_TLS_RSA_PSK_WITH_AES_256_GCM_SHA384">const http2cipher_TLS_RSA_PSK_WITH_AES_256_GCM_SHA384</a>

```
searchKey: http.http2cipher_TLS_RSA_PSK_WITH_AES_256_GCM_SHA384
tags: [private]
```

```Go
const http2cipher_TLS_RSA_PSK_WITH_AES_256_GCM_SHA384 uint16 = 0x00AD
```

### <a id="http2cipher_TLS_PSK_WITH_AES_128_CBC_SHA256" href="#http2cipher_TLS_PSK_WITH_AES_128_CBC_SHA256">const http2cipher_TLS_PSK_WITH_AES_128_CBC_SHA256</a>

```
searchKey: http.http2cipher_TLS_PSK_WITH_AES_128_CBC_SHA256
tags: [private]
```

```Go
const http2cipher_TLS_PSK_WITH_AES_128_CBC_SHA256 uint16 = 0x00AE
```

### <a id="http2cipher_TLS_PSK_WITH_AES_256_CBC_SHA384" href="#http2cipher_TLS_PSK_WITH_AES_256_CBC_SHA384">const http2cipher_TLS_PSK_WITH_AES_256_CBC_SHA384</a>

```
searchKey: http.http2cipher_TLS_PSK_WITH_AES_256_CBC_SHA384
tags: [private]
```

```Go
const http2cipher_TLS_PSK_WITH_AES_256_CBC_SHA384 uint16 = 0x00AF
```

### <a id="http2cipher_TLS_PSK_WITH_NULL_SHA256" href="#http2cipher_TLS_PSK_WITH_NULL_SHA256">const http2cipher_TLS_PSK_WITH_NULL_SHA256</a>

```
searchKey: http.http2cipher_TLS_PSK_WITH_NULL_SHA256
tags: [private]
```

```Go
const http2cipher_TLS_PSK_WITH_NULL_SHA256 uint16 = 0x00B0
```

### <a id="http2cipher_TLS_PSK_WITH_NULL_SHA384" href="#http2cipher_TLS_PSK_WITH_NULL_SHA384">const http2cipher_TLS_PSK_WITH_NULL_SHA384</a>

```
searchKey: http.http2cipher_TLS_PSK_WITH_NULL_SHA384
tags: [private]
```

```Go
const http2cipher_TLS_PSK_WITH_NULL_SHA384 uint16 = 0x00B1
```

### <a id="http2cipher_TLS_DHE_PSK_WITH_AES_128_CBC_SHA256" href="#http2cipher_TLS_DHE_PSK_WITH_AES_128_CBC_SHA256">const http2cipher_TLS_DHE_PSK_WITH_AES_128_CBC_SHA256</a>

```
searchKey: http.http2cipher_TLS_DHE_PSK_WITH_AES_128_CBC_SHA256
tags: [private]
```

```Go
const http2cipher_TLS_DHE_PSK_WITH_AES_128_CBC_SHA256 uint16 = 0x00B2
```

### <a id="http2cipher_TLS_DHE_PSK_WITH_AES_256_CBC_SHA384" href="#http2cipher_TLS_DHE_PSK_WITH_AES_256_CBC_SHA384">const http2cipher_TLS_DHE_PSK_WITH_AES_256_CBC_SHA384</a>

```
searchKey: http.http2cipher_TLS_DHE_PSK_WITH_AES_256_CBC_SHA384
tags: [private]
```

```Go
const http2cipher_TLS_DHE_PSK_WITH_AES_256_CBC_SHA384 uint16 = 0x00B3
```

### <a id="http2cipher_TLS_DHE_PSK_WITH_NULL_SHA256" href="#http2cipher_TLS_DHE_PSK_WITH_NULL_SHA256">const http2cipher_TLS_DHE_PSK_WITH_NULL_SHA256</a>

```
searchKey: http.http2cipher_TLS_DHE_PSK_WITH_NULL_SHA256
tags: [private]
```

```Go
const http2cipher_TLS_DHE_PSK_WITH_NULL_SHA256 uint16 = 0x00B4
```

### <a id="http2cipher_TLS_DHE_PSK_WITH_NULL_SHA384" href="#http2cipher_TLS_DHE_PSK_WITH_NULL_SHA384">const http2cipher_TLS_DHE_PSK_WITH_NULL_SHA384</a>

```
searchKey: http.http2cipher_TLS_DHE_PSK_WITH_NULL_SHA384
tags: [private]
```

```Go
const http2cipher_TLS_DHE_PSK_WITH_NULL_SHA384 uint16 = 0x00B5
```

### <a id="http2cipher_TLS_RSA_PSK_WITH_AES_128_CBC_SHA256" href="#http2cipher_TLS_RSA_PSK_WITH_AES_128_CBC_SHA256">const http2cipher_TLS_RSA_PSK_WITH_AES_128_CBC_SHA256</a>

```
searchKey: http.http2cipher_TLS_RSA_PSK_WITH_AES_128_CBC_SHA256
tags: [private]
```

```Go
const http2cipher_TLS_RSA_PSK_WITH_AES_128_CBC_SHA256 uint16 = 0x00B6
```

### <a id="http2cipher_TLS_RSA_PSK_WITH_AES_256_CBC_SHA384" href="#http2cipher_TLS_RSA_PSK_WITH_AES_256_CBC_SHA384">const http2cipher_TLS_RSA_PSK_WITH_AES_256_CBC_SHA384</a>

```
searchKey: http.http2cipher_TLS_RSA_PSK_WITH_AES_256_CBC_SHA384
tags: [private]
```

```Go
const http2cipher_TLS_RSA_PSK_WITH_AES_256_CBC_SHA384 uint16 = 0x00B7
```

### <a id="http2cipher_TLS_RSA_PSK_WITH_NULL_SHA256" href="#http2cipher_TLS_RSA_PSK_WITH_NULL_SHA256">const http2cipher_TLS_RSA_PSK_WITH_NULL_SHA256</a>

```
searchKey: http.http2cipher_TLS_RSA_PSK_WITH_NULL_SHA256
tags: [private]
```

```Go
const http2cipher_TLS_RSA_PSK_WITH_NULL_SHA256 uint16 = 0x00B8
```

### <a id="http2cipher_TLS_RSA_PSK_WITH_NULL_SHA384" href="#http2cipher_TLS_RSA_PSK_WITH_NULL_SHA384">const http2cipher_TLS_RSA_PSK_WITH_NULL_SHA384</a>

```
searchKey: http.http2cipher_TLS_RSA_PSK_WITH_NULL_SHA384
tags: [private]
```

```Go
const http2cipher_TLS_RSA_PSK_WITH_NULL_SHA384 uint16 = 0x00B9
```

### <a id="http2cipher_TLS_RSA_WITH_CAMELLIA_128_CBC_SHA256" href="#http2cipher_TLS_RSA_WITH_CAMELLIA_128_CBC_SHA256">const http2cipher_TLS_RSA_WITH_CAMELLIA_128_CBC_SHA256</a>

```
searchKey: http.http2cipher_TLS_RSA_WITH_CAMELLIA_128_CBC_SHA256
tags: [private]
```

```Go
const http2cipher_TLS_RSA_WITH_CAMELLIA_128_CBC_SHA256 uint16 = 0x00BA
```

### <a id="http2cipher_TLS_DH_DSS_WITH_CAMELLIA_128_CBC_SHA256" href="#http2cipher_TLS_DH_DSS_WITH_CAMELLIA_128_CBC_SHA256">const http2cipher_TLS_DH_DSS_WITH_CAMELLIA_128_CBC_SHA256</a>

```
searchKey: http.http2cipher_TLS_DH_DSS_WITH_CAMELLIA_128_CBC_SHA256
tags: [private]
```

```Go
const http2cipher_TLS_DH_DSS_WITH_CAMELLIA_128_CBC_SHA256 uint16 = 0x00BB
```

### <a id="http2cipher_TLS_DH_RSA_WITH_CAMELLIA_128_CBC_SHA256" href="#http2cipher_TLS_DH_RSA_WITH_CAMELLIA_128_CBC_SHA256">const http2cipher_TLS_DH_RSA_WITH_CAMELLIA_128_CBC_SHA256</a>

```
searchKey: http.http2cipher_TLS_DH_RSA_WITH_CAMELLIA_128_CBC_SHA256
tags: [private]
```

```Go
const http2cipher_TLS_DH_RSA_WITH_CAMELLIA_128_CBC_SHA256 uint16 = 0x00BC
```

### <a id="http2cipher_TLS_DHE_DSS_WITH_CAMELLIA_128_CBC_SHA256" href="#http2cipher_TLS_DHE_DSS_WITH_CAMELLIA_128_CBC_SHA256">const http2cipher_TLS_DHE_DSS_WITH_CAMELLIA_128_CBC_SHA256</a>

```
searchKey: http.http2cipher_TLS_DHE_DSS_WITH_CAMELLIA_128_CBC_SHA256
tags: [private]
```

```Go
const http2cipher_TLS_DHE_DSS_WITH_CAMELLIA_128_CBC_SHA256 uint16 = 0x00BD
```

### <a id="http2cipher_TLS_DHE_RSA_WITH_CAMELLIA_128_CBC_SHA256" href="#http2cipher_TLS_DHE_RSA_WITH_CAMELLIA_128_CBC_SHA256">const http2cipher_TLS_DHE_RSA_WITH_CAMELLIA_128_CBC_SHA256</a>

```
searchKey: http.http2cipher_TLS_DHE_RSA_WITH_CAMELLIA_128_CBC_SHA256
tags: [private]
```

```Go
const http2cipher_TLS_DHE_RSA_WITH_CAMELLIA_128_CBC_SHA256 uint16 = 0x00BE
```

### <a id="http2cipher_TLS_DH_anon_WITH_CAMELLIA_128_CBC_SHA256" href="#http2cipher_TLS_DH_anon_WITH_CAMELLIA_128_CBC_SHA256">const http2cipher_TLS_DH_anon_WITH_CAMELLIA_128_CBC_SHA256</a>

```
searchKey: http.http2cipher_TLS_DH_anon_WITH_CAMELLIA_128_CBC_SHA256
tags: [private]
```

```Go
const http2cipher_TLS_DH_anon_WITH_CAMELLIA_128_CBC_SHA256 uint16 = 0x00BF
```

### <a id="http2cipher_TLS_RSA_WITH_CAMELLIA_256_CBC_SHA256" href="#http2cipher_TLS_RSA_WITH_CAMELLIA_256_CBC_SHA256">const http2cipher_TLS_RSA_WITH_CAMELLIA_256_CBC_SHA256</a>

```
searchKey: http.http2cipher_TLS_RSA_WITH_CAMELLIA_256_CBC_SHA256
tags: [private]
```

```Go
const http2cipher_TLS_RSA_WITH_CAMELLIA_256_CBC_SHA256 uint16 = 0x00C0
```

### <a id="http2cipher_TLS_DH_DSS_WITH_CAMELLIA_256_CBC_SHA256" href="#http2cipher_TLS_DH_DSS_WITH_CAMELLIA_256_CBC_SHA256">const http2cipher_TLS_DH_DSS_WITH_CAMELLIA_256_CBC_SHA256</a>

```
searchKey: http.http2cipher_TLS_DH_DSS_WITH_CAMELLIA_256_CBC_SHA256
tags: [private]
```

```Go
const http2cipher_TLS_DH_DSS_WITH_CAMELLIA_256_CBC_SHA256 uint16 = 0x00C1
```

### <a id="http2cipher_TLS_DH_RSA_WITH_CAMELLIA_256_CBC_SHA256" href="#http2cipher_TLS_DH_RSA_WITH_CAMELLIA_256_CBC_SHA256">const http2cipher_TLS_DH_RSA_WITH_CAMELLIA_256_CBC_SHA256</a>

```
searchKey: http.http2cipher_TLS_DH_RSA_WITH_CAMELLIA_256_CBC_SHA256
tags: [private]
```

```Go
const http2cipher_TLS_DH_RSA_WITH_CAMELLIA_256_CBC_SHA256 uint16 = 0x00C2
```

### <a id="http2cipher_TLS_DHE_DSS_WITH_CAMELLIA_256_CBC_SHA256" href="#http2cipher_TLS_DHE_DSS_WITH_CAMELLIA_256_CBC_SHA256">const http2cipher_TLS_DHE_DSS_WITH_CAMELLIA_256_CBC_SHA256</a>

```
searchKey: http.http2cipher_TLS_DHE_DSS_WITH_CAMELLIA_256_CBC_SHA256
tags: [private]
```

```Go
const http2cipher_TLS_DHE_DSS_WITH_CAMELLIA_256_CBC_SHA256 uint16 = 0x00C3
```

### <a id="http2cipher_TLS_DHE_RSA_WITH_CAMELLIA_256_CBC_SHA256" href="#http2cipher_TLS_DHE_RSA_WITH_CAMELLIA_256_CBC_SHA256">const http2cipher_TLS_DHE_RSA_WITH_CAMELLIA_256_CBC_SHA256</a>

```
searchKey: http.http2cipher_TLS_DHE_RSA_WITH_CAMELLIA_256_CBC_SHA256
tags: [private]
```

```Go
const http2cipher_TLS_DHE_RSA_WITH_CAMELLIA_256_CBC_SHA256 uint16 = 0x00C4
```

### <a id="http2cipher_TLS_DH_anon_WITH_CAMELLIA_256_CBC_SHA256" href="#http2cipher_TLS_DH_anon_WITH_CAMELLIA_256_CBC_SHA256">const http2cipher_TLS_DH_anon_WITH_CAMELLIA_256_CBC_SHA256</a>

```
searchKey: http.http2cipher_TLS_DH_anon_WITH_CAMELLIA_256_CBC_SHA256
tags: [private]
```

```Go
const http2cipher_TLS_DH_anon_WITH_CAMELLIA_256_CBC_SHA256 uint16 = 0x00C5
```

### <a id="http2cipher_TLS_EMPTY_RENEGOTIATION_INFO_SCSV" href="#http2cipher_TLS_EMPTY_RENEGOTIATION_INFO_SCSV">const http2cipher_TLS_EMPTY_RENEGOTIATION_INFO_SCSV</a>

```
searchKey: http.http2cipher_TLS_EMPTY_RENEGOTIATION_INFO_SCSV
tags: [private]
```

```Go
const http2cipher_TLS_EMPTY_RENEGOTIATION_INFO_SCSV uint16 = 0x00FF
```

Unassigned uint16 =  0x00C6-FE 

### <a id="http2cipher_TLS_FALLBACK_SCSV" href="#http2cipher_TLS_FALLBACK_SCSV">const http2cipher_TLS_FALLBACK_SCSV</a>

```
searchKey: http.http2cipher_TLS_FALLBACK_SCSV
tags: [private]
```

```Go
const http2cipher_TLS_FALLBACK_SCSV uint16 = 0x5600
```

Unassigned uint16 =  0x01-55,* 

### <a id="http2cipher_TLS_ECDH_ECDSA_WITH_NULL_SHA" href="#http2cipher_TLS_ECDH_ECDSA_WITH_NULL_SHA">const http2cipher_TLS_ECDH_ECDSA_WITH_NULL_SHA</a>

```
searchKey: http.http2cipher_TLS_ECDH_ECDSA_WITH_NULL_SHA
tags: [private]
```

```Go
const http2cipher_TLS_ECDH_ECDSA_WITH_NULL_SHA uint16 = 0xC001
```

Unassigned                                   uint16 = 0x5601 - 0xC000 

### <a id="http2cipher_TLS_ECDH_ECDSA_WITH_RC4_128_SHA" href="#http2cipher_TLS_ECDH_ECDSA_WITH_RC4_128_SHA">const http2cipher_TLS_ECDH_ECDSA_WITH_RC4_128_SHA</a>

```
searchKey: http.http2cipher_TLS_ECDH_ECDSA_WITH_RC4_128_SHA
tags: [private]
```

```Go
const http2cipher_TLS_ECDH_ECDSA_WITH_RC4_128_SHA uint16 = 0xC002
```

### <a id="http2cipher_TLS_ECDH_ECDSA_WITH_3DES_EDE_CBC_SHA" href="#http2cipher_TLS_ECDH_ECDSA_WITH_3DES_EDE_CBC_SHA">const http2cipher_TLS_ECDH_ECDSA_WITH_3DES_EDE_CBC_SHA</a>

```
searchKey: http.http2cipher_TLS_ECDH_ECDSA_WITH_3DES_EDE_CBC_SHA
tags: [private]
```

```Go
const http2cipher_TLS_ECDH_ECDSA_WITH_3DES_EDE_CBC_SHA uint16 = 0xC003
```

### <a id="http2cipher_TLS_ECDH_ECDSA_WITH_AES_128_CBC_SHA" href="#http2cipher_TLS_ECDH_ECDSA_WITH_AES_128_CBC_SHA">const http2cipher_TLS_ECDH_ECDSA_WITH_AES_128_CBC_SHA</a>

```
searchKey: http.http2cipher_TLS_ECDH_ECDSA_WITH_AES_128_CBC_SHA
tags: [private]
```

```Go
const http2cipher_TLS_ECDH_ECDSA_WITH_AES_128_CBC_SHA uint16 = 0xC004
```

### <a id="http2cipher_TLS_ECDH_ECDSA_WITH_AES_256_CBC_SHA" href="#http2cipher_TLS_ECDH_ECDSA_WITH_AES_256_CBC_SHA">const http2cipher_TLS_ECDH_ECDSA_WITH_AES_256_CBC_SHA</a>

```
searchKey: http.http2cipher_TLS_ECDH_ECDSA_WITH_AES_256_CBC_SHA
tags: [private]
```

```Go
const http2cipher_TLS_ECDH_ECDSA_WITH_AES_256_CBC_SHA uint16 = 0xC005
```

### <a id="http2cipher_TLS_ECDHE_ECDSA_WITH_NULL_SHA" href="#http2cipher_TLS_ECDHE_ECDSA_WITH_NULL_SHA">const http2cipher_TLS_ECDHE_ECDSA_WITH_NULL_SHA</a>

```
searchKey: http.http2cipher_TLS_ECDHE_ECDSA_WITH_NULL_SHA
tags: [private]
```

```Go
const http2cipher_TLS_ECDHE_ECDSA_WITH_NULL_SHA uint16 = 0xC006
```

### <a id="http2cipher_TLS_ECDHE_ECDSA_WITH_RC4_128_SHA" href="#http2cipher_TLS_ECDHE_ECDSA_WITH_RC4_128_SHA">const http2cipher_TLS_ECDHE_ECDSA_WITH_RC4_128_SHA</a>

```
searchKey: http.http2cipher_TLS_ECDHE_ECDSA_WITH_RC4_128_SHA
tags: [private]
```

```Go
const http2cipher_TLS_ECDHE_ECDSA_WITH_RC4_128_SHA uint16 = 0xC007
```

### <a id="http2cipher_TLS_ECDHE_ECDSA_WITH_3DES_EDE_CBC_SHA" href="#http2cipher_TLS_ECDHE_ECDSA_WITH_3DES_EDE_CBC_SHA">const http2cipher_TLS_ECDHE_ECDSA_WITH_3DES_EDE_CBC_SHA</a>

```
searchKey: http.http2cipher_TLS_ECDHE_ECDSA_WITH_3DES_EDE_CBC_SHA
tags: [private]
```

```Go
const http2cipher_TLS_ECDHE_ECDSA_WITH_3DES_EDE_CBC_SHA uint16 = 0xC008
```

### <a id="http2cipher_TLS_ECDHE_ECDSA_WITH_AES_128_CBC_SHA" href="#http2cipher_TLS_ECDHE_ECDSA_WITH_AES_128_CBC_SHA">const http2cipher_TLS_ECDHE_ECDSA_WITH_AES_128_CBC_SHA</a>

```
searchKey: http.http2cipher_TLS_ECDHE_ECDSA_WITH_AES_128_CBC_SHA
tags: [private]
```

```Go
const http2cipher_TLS_ECDHE_ECDSA_WITH_AES_128_CBC_SHA uint16 = 0xC009
```

### <a id="http2cipher_TLS_ECDHE_ECDSA_WITH_AES_256_CBC_SHA" href="#http2cipher_TLS_ECDHE_ECDSA_WITH_AES_256_CBC_SHA">const http2cipher_TLS_ECDHE_ECDSA_WITH_AES_256_CBC_SHA</a>

```
searchKey: http.http2cipher_TLS_ECDHE_ECDSA_WITH_AES_256_CBC_SHA
tags: [private]
```

```Go
const http2cipher_TLS_ECDHE_ECDSA_WITH_AES_256_CBC_SHA uint16 = 0xC00A
```

### <a id="http2cipher_TLS_ECDH_RSA_WITH_NULL_SHA" href="#http2cipher_TLS_ECDH_RSA_WITH_NULL_SHA">const http2cipher_TLS_ECDH_RSA_WITH_NULL_SHA</a>

```
searchKey: http.http2cipher_TLS_ECDH_RSA_WITH_NULL_SHA
tags: [private]
```

```Go
const http2cipher_TLS_ECDH_RSA_WITH_NULL_SHA uint16 = 0xC00B
```

### <a id="http2cipher_TLS_ECDH_RSA_WITH_RC4_128_SHA" href="#http2cipher_TLS_ECDH_RSA_WITH_RC4_128_SHA">const http2cipher_TLS_ECDH_RSA_WITH_RC4_128_SHA</a>

```
searchKey: http.http2cipher_TLS_ECDH_RSA_WITH_RC4_128_SHA
tags: [private]
```

```Go
const http2cipher_TLS_ECDH_RSA_WITH_RC4_128_SHA uint16 = 0xC00C
```

### <a id="http2cipher_TLS_ECDH_RSA_WITH_3DES_EDE_CBC_SHA" href="#http2cipher_TLS_ECDH_RSA_WITH_3DES_EDE_CBC_SHA">const http2cipher_TLS_ECDH_RSA_WITH_3DES_EDE_CBC_SHA</a>

```
searchKey: http.http2cipher_TLS_ECDH_RSA_WITH_3DES_EDE_CBC_SHA
tags: [private]
```

```Go
const http2cipher_TLS_ECDH_RSA_WITH_3DES_EDE_CBC_SHA uint16 = 0xC00D
```

### <a id="http2cipher_TLS_ECDH_RSA_WITH_AES_128_CBC_SHA" href="#http2cipher_TLS_ECDH_RSA_WITH_AES_128_CBC_SHA">const http2cipher_TLS_ECDH_RSA_WITH_AES_128_CBC_SHA</a>

```
searchKey: http.http2cipher_TLS_ECDH_RSA_WITH_AES_128_CBC_SHA
tags: [private]
```

```Go
const http2cipher_TLS_ECDH_RSA_WITH_AES_128_CBC_SHA uint16 = 0xC00E
```

### <a id="http2cipher_TLS_ECDH_RSA_WITH_AES_256_CBC_SHA" href="#http2cipher_TLS_ECDH_RSA_WITH_AES_256_CBC_SHA">const http2cipher_TLS_ECDH_RSA_WITH_AES_256_CBC_SHA</a>

```
searchKey: http.http2cipher_TLS_ECDH_RSA_WITH_AES_256_CBC_SHA
tags: [private]
```

```Go
const http2cipher_TLS_ECDH_RSA_WITH_AES_256_CBC_SHA uint16 = 0xC00F
```

### <a id="http2cipher_TLS_ECDHE_RSA_WITH_NULL_SHA" href="#http2cipher_TLS_ECDHE_RSA_WITH_NULL_SHA">const http2cipher_TLS_ECDHE_RSA_WITH_NULL_SHA</a>

```
searchKey: http.http2cipher_TLS_ECDHE_RSA_WITH_NULL_SHA
tags: [private]
```

```Go
const http2cipher_TLS_ECDHE_RSA_WITH_NULL_SHA uint16 = 0xC010
```

### <a id="http2cipher_TLS_ECDHE_RSA_WITH_RC4_128_SHA" href="#http2cipher_TLS_ECDHE_RSA_WITH_RC4_128_SHA">const http2cipher_TLS_ECDHE_RSA_WITH_RC4_128_SHA</a>

```
searchKey: http.http2cipher_TLS_ECDHE_RSA_WITH_RC4_128_SHA
tags: [private]
```

```Go
const http2cipher_TLS_ECDHE_RSA_WITH_RC4_128_SHA uint16 = 0xC011
```

### <a id="http2cipher_TLS_ECDHE_RSA_WITH_3DES_EDE_CBC_SHA" href="#http2cipher_TLS_ECDHE_RSA_WITH_3DES_EDE_CBC_SHA">const http2cipher_TLS_ECDHE_RSA_WITH_3DES_EDE_CBC_SHA</a>

```
searchKey: http.http2cipher_TLS_ECDHE_RSA_WITH_3DES_EDE_CBC_SHA
tags: [private]
```

```Go
const http2cipher_TLS_ECDHE_RSA_WITH_3DES_EDE_CBC_SHA uint16 = 0xC012
```

### <a id="http2cipher_TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA" href="#http2cipher_TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA">const http2cipher_TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA</a>

```
searchKey: http.http2cipher_TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA
tags: [private]
```

```Go
const http2cipher_TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA uint16 = 0xC013
```

### <a id="http2cipher_TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA" href="#http2cipher_TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA">const http2cipher_TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA</a>

```
searchKey: http.http2cipher_TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA
tags: [private]
```

```Go
const http2cipher_TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA uint16 = 0xC014
```

### <a id="http2cipher_TLS_ECDH_anon_WITH_NULL_SHA" href="#http2cipher_TLS_ECDH_anon_WITH_NULL_SHA">const http2cipher_TLS_ECDH_anon_WITH_NULL_SHA</a>

```
searchKey: http.http2cipher_TLS_ECDH_anon_WITH_NULL_SHA
tags: [private]
```

```Go
const http2cipher_TLS_ECDH_anon_WITH_NULL_SHA uint16 = 0xC015
```

### <a id="http2cipher_TLS_ECDH_anon_WITH_RC4_128_SHA" href="#http2cipher_TLS_ECDH_anon_WITH_RC4_128_SHA">const http2cipher_TLS_ECDH_anon_WITH_RC4_128_SHA</a>

```
searchKey: http.http2cipher_TLS_ECDH_anon_WITH_RC4_128_SHA
tags: [private]
```

```Go
const http2cipher_TLS_ECDH_anon_WITH_RC4_128_SHA uint16 = 0xC016
```

### <a id="http2cipher_TLS_ECDH_anon_WITH_3DES_EDE_CBC_SHA" href="#http2cipher_TLS_ECDH_anon_WITH_3DES_EDE_CBC_SHA">const http2cipher_TLS_ECDH_anon_WITH_3DES_EDE_CBC_SHA</a>

```
searchKey: http.http2cipher_TLS_ECDH_anon_WITH_3DES_EDE_CBC_SHA
tags: [private]
```

```Go
const http2cipher_TLS_ECDH_anon_WITH_3DES_EDE_CBC_SHA uint16 = 0xC017
```

### <a id="http2cipher_TLS_ECDH_anon_WITH_AES_128_CBC_SHA" href="#http2cipher_TLS_ECDH_anon_WITH_AES_128_CBC_SHA">const http2cipher_TLS_ECDH_anon_WITH_AES_128_CBC_SHA</a>

```
searchKey: http.http2cipher_TLS_ECDH_anon_WITH_AES_128_CBC_SHA
tags: [private]
```

```Go
const http2cipher_TLS_ECDH_anon_WITH_AES_128_CBC_SHA uint16 = 0xC018
```

### <a id="http2cipher_TLS_ECDH_anon_WITH_AES_256_CBC_SHA" href="#http2cipher_TLS_ECDH_anon_WITH_AES_256_CBC_SHA">const http2cipher_TLS_ECDH_anon_WITH_AES_256_CBC_SHA</a>

```
searchKey: http.http2cipher_TLS_ECDH_anon_WITH_AES_256_CBC_SHA
tags: [private]
```

```Go
const http2cipher_TLS_ECDH_anon_WITH_AES_256_CBC_SHA uint16 = 0xC019
```

### <a id="http2cipher_TLS_SRP_SHA_WITH_3DES_EDE_CBC_SHA" href="#http2cipher_TLS_SRP_SHA_WITH_3DES_EDE_CBC_SHA">const http2cipher_TLS_SRP_SHA_WITH_3DES_EDE_CBC_SHA</a>

```
searchKey: http.http2cipher_TLS_SRP_SHA_WITH_3DES_EDE_CBC_SHA
tags: [private]
```

```Go
const http2cipher_TLS_SRP_SHA_WITH_3DES_EDE_CBC_SHA uint16 = 0xC01A
```

### <a id="http2cipher_TLS_SRP_SHA_RSA_WITH_3DES_EDE_CBC_SHA" href="#http2cipher_TLS_SRP_SHA_RSA_WITH_3DES_EDE_CBC_SHA">const http2cipher_TLS_SRP_SHA_RSA_WITH_3DES_EDE_CBC_SHA</a>

```
searchKey: http.http2cipher_TLS_SRP_SHA_RSA_WITH_3DES_EDE_CBC_SHA
tags: [private]
```

```Go
const http2cipher_TLS_SRP_SHA_RSA_WITH_3DES_EDE_CBC_SHA uint16 = 0xC01B
```

### <a id="http2cipher_TLS_SRP_SHA_DSS_WITH_3DES_EDE_CBC_SHA" href="#http2cipher_TLS_SRP_SHA_DSS_WITH_3DES_EDE_CBC_SHA">const http2cipher_TLS_SRP_SHA_DSS_WITH_3DES_EDE_CBC_SHA</a>

```
searchKey: http.http2cipher_TLS_SRP_SHA_DSS_WITH_3DES_EDE_CBC_SHA
tags: [private]
```

```Go
const http2cipher_TLS_SRP_SHA_DSS_WITH_3DES_EDE_CBC_SHA uint16 = 0xC01C
```

### <a id="http2cipher_TLS_SRP_SHA_WITH_AES_128_CBC_SHA" href="#http2cipher_TLS_SRP_SHA_WITH_AES_128_CBC_SHA">const http2cipher_TLS_SRP_SHA_WITH_AES_128_CBC_SHA</a>

```
searchKey: http.http2cipher_TLS_SRP_SHA_WITH_AES_128_CBC_SHA
tags: [private]
```

```Go
const http2cipher_TLS_SRP_SHA_WITH_AES_128_CBC_SHA uint16 = 0xC01D
```

### <a id="http2cipher_TLS_SRP_SHA_RSA_WITH_AES_128_CBC_SHA" href="#http2cipher_TLS_SRP_SHA_RSA_WITH_AES_128_CBC_SHA">const http2cipher_TLS_SRP_SHA_RSA_WITH_AES_128_CBC_SHA</a>

```
searchKey: http.http2cipher_TLS_SRP_SHA_RSA_WITH_AES_128_CBC_SHA
tags: [private]
```

```Go
const http2cipher_TLS_SRP_SHA_RSA_WITH_AES_128_CBC_SHA uint16 = 0xC01E
```

### <a id="http2cipher_TLS_SRP_SHA_DSS_WITH_AES_128_CBC_SHA" href="#http2cipher_TLS_SRP_SHA_DSS_WITH_AES_128_CBC_SHA">const http2cipher_TLS_SRP_SHA_DSS_WITH_AES_128_CBC_SHA</a>

```
searchKey: http.http2cipher_TLS_SRP_SHA_DSS_WITH_AES_128_CBC_SHA
tags: [private]
```

```Go
const http2cipher_TLS_SRP_SHA_DSS_WITH_AES_128_CBC_SHA uint16 = 0xC01F
```

### <a id="http2cipher_TLS_SRP_SHA_WITH_AES_256_CBC_SHA" href="#http2cipher_TLS_SRP_SHA_WITH_AES_256_CBC_SHA">const http2cipher_TLS_SRP_SHA_WITH_AES_256_CBC_SHA</a>

```
searchKey: http.http2cipher_TLS_SRP_SHA_WITH_AES_256_CBC_SHA
tags: [private]
```

```Go
const http2cipher_TLS_SRP_SHA_WITH_AES_256_CBC_SHA uint16 = 0xC020
```

### <a id="http2cipher_TLS_SRP_SHA_RSA_WITH_AES_256_CBC_SHA" href="#http2cipher_TLS_SRP_SHA_RSA_WITH_AES_256_CBC_SHA">const http2cipher_TLS_SRP_SHA_RSA_WITH_AES_256_CBC_SHA</a>

```
searchKey: http.http2cipher_TLS_SRP_SHA_RSA_WITH_AES_256_CBC_SHA
tags: [private]
```

```Go
const http2cipher_TLS_SRP_SHA_RSA_WITH_AES_256_CBC_SHA uint16 = 0xC021
```

### <a id="http2cipher_TLS_SRP_SHA_DSS_WITH_AES_256_CBC_SHA" href="#http2cipher_TLS_SRP_SHA_DSS_WITH_AES_256_CBC_SHA">const http2cipher_TLS_SRP_SHA_DSS_WITH_AES_256_CBC_SHA</a>

```
searchKey: http.http2cipher_TLS_SRP_SHA_DSS_WITH_AES_256_CBC_SHA
tags: [private]
```

```Go
const http2cipher_TLS_SRP_SHA_DSS_WITH_AES_256_CBC_SHA uint16 = 0xC022
```

### <a id="http2cipher_TLS_ECDHE_ECDSA_WITH_AES_128_CBC_SHA256" href="#http2cipher_TLS_ECDHE_ECDSA_WITH_AES_128_CBC_SHA256">const http2cipher_TLS_ECDHE_ECDSA_WITH_AES_128_CBC_SHA256</a>

```
searchKey: http.http2cipher_TLS_ECDHE_ECDSA_WITH_AES_128_CBC_SHA256
tags: [private]
```

```Go
const http2cipher_TLS_ECDHE_ECDSA_WITH_AES_128_CBC_SHA256 uint16 = 0xC023
```

### <a id="http2cipher_TLS_ECDHE_ECDSA_WITH_AES_256_CBC_SHA384" href="#http2cipher_TLS_ECDHE_ECDSA_WITH_AES_256_CBC_SHA384">const http2cipher_TLS_ECDHE_ECDSA_WITH_AES_256_CBC_SHA384</a>

```
searchKey: http.http2cipher_TLS_ECDHE_ECDSA_WITH_AES_256_CBC_SHA384
tags: [private]
```

```Go
const http2cipher_TLS_ECDHE_ECDSA_WITH_AES_256_CBC_SHA384 uint16 = 0xC024
```

### <a id="http2cipher_TLS_ECDH_ECDSA_WITH_AES_128_CBC_SHA256" href="#http2cipher_TLS_ECDH_ECDSA_WITH_AES_128_CBC_SHA256">const http2cipher_TLS_ECDH_ECDSA_WITH_AES_128_CBC_SHA256</a>

```
searchKey: http.http2cipher_TLS_ECDH_ECDSA_WITH_AES_128_CBC_SHA256
tags: [private]
```

```Go
const http2cipher_TLS_ECDH_ECDSA_WITH_AES_128_CBC_SHA256 uint16 = 0xC025
```

### <a id="http2cipher_TLS_ECDH_ECDSA_WITH_AES_256_CBC_SHA384" href="#http2cipher_TLS_ECDH_ECDSA_WITH_AES_256_CBC_SHA384">const http2cipher_TLS_ECDH_ECDSA_WITH_AES_256_CBC_SHA384</a>

```
searchKey: http.http2cipher_TLS_ECDH_ECDSA_WITH_AES_256_CBC_SHA384
tags: [private]
```

```Go
const http2cipher_TLS_ECDH_ECDSA_WITH_AES_256_CBC_SHA384 uint16 = 0xC026
```

### <a id="http2cipher_TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256" href="#http2cipher_TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256">const http2cipher_TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256</a>

```
searchKey: http.http2cipher_TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256
tags: [private]
```

```Go
const http2cipher_TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256 uint16 = 0xC027
```

### <a id="http2cipher_TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384" href="#http2cipher_TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384">const http2cipher_TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384</a>

```
searchKey: http.http2cipher_TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384
tags: [private]
```

```Go
const http2cipher_TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384 uint16 = 0xC028
```

### <a id="http2cipher_TLS_ECDH_RSA_WITH_AES_128_CBC_SHA256" href="#http2cipher_TLS_ECDH_RSA_WITH_AES_128_CBC_SHA256">const http2cipher_TLS_ECDH_RSA_WITH_AES_128_CBC_SHA256</a>

```
searchKey: http.http2cipher_TLS_ECDH_RSA_WITH_AES_128_CBC_SHA256
tags: [private]
```

```Go
const http2cipher_TLS_ECDH_RSA_WITH_AES_128_CBC_SHA256 uint16 = 0xC029
```

### <a id="http2cipher_TLS_ECDH_RSA_WITH_AES_256_CBC_SHA384" href="#http2cipher_TLS_ECDH_RSA_WITH_AES_256_CBC_SHA384">const http2cipher_TLS_ECDH_RSA_WITH_AES_256_CBC_SHA384</a>

```
searchKey: http.http2cipher_TLS_ECDH_RSA_WITH_AES_256_CBC_SHA384
tags: [private]
```

```Go
const http2cipher_TLS_ECDH_RSA_WITH_AES_256_CBC_SHA384 uint16 = 0xC02A
```

### <a id="http2cipher_TLS_ECDHE_ECDSA_WITH_AES_128_GCM_SHA256" href="#http2cipher_TLS_ECDHE_ECDSA_WITH_AES_128_GCM_SHA256">const http2cipher_TLS_ECDHE_ECDSA_WITH_AES_128_GCM_SHA256</a>

```
searchKey: http.http2cipher_TLS_ECDHE_ECDSA_WITH_AES_128_GCM_SHA256
tags: [private]
```

```Go
const http2cipher_TLS_ECDHE_ECDSA_WITH_AES_128_GCM_SHA256 uint16 = 0xC02B
```

### <a id="http2cipher_TLS_ECDHE_ECDSA_WITH_AES_256_GCM_SHA384" href="#http2cipher_TLS_ECDHE_ECDSA_WITH_AES_256_GCM_SHA384">const http2cipher_TLS_ECDHE_ECDSA_WITH_AES_256_GCM_SHA384</a>

```
searchKey: http.http2cipher_TLS_ECDHE_ECDSA_WITH_AES_256_GCM_SHA384
tags: [private]
```

```Go
const http2cipher_TLS_ECDHE_ECDSA_WITH_AES_256_GCM_SHA384 uint16 = 0xC02C
```

### <a id="http2cipher_TLS_ECDH_ECDSA_WITH_AES_128_GCM_SHA256" href="#http2cipher_TLS_ECDH_ECDSA_WITH_AES_128_GCM_SHA256">const http2cipher_TLS_ECDH_ECDSA_WITH_AES_128_GCM_SHA256</a>

```
searchKey: http.http2cipher_TLS_ECDH_ECDSA_WITH_AES_128_GCM_SHA256
tags: [private]
```

```Go
const http2cipher_TLS_ECDH_ECDSA_WITH_AES_128_GCM_SHA256 uint16 = 0xC02D
```

### <a id="http2cipher_TLS_ECDH_ECDSA_WITH_AES_256_GCM_SHA384" href="#http2cipher_TLS_ECDH_ECDSA_WITH_AES_256_GCM_SHA384">const http2cipher_TLS_ECDH_ECDSA_WITH_AES_256_GCM_SHA384</a>

```
searchKey: http.http2cipher_TLS_ECDH_ECDSA_WITH_AES_256_GCM_SHA384
tags: [private]
```

```Go
const http2cipher_TLS_ECDH_ECDSA_WITH_AES_256_GCM_SHA384 uint16 = 0xC02E
```

### <a id="http2cipher_TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256" href="#http2cipher_TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256">const http2cipher_TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256</a>

```
searchKey: http.http2cipher_TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
tags: [private]
```

```Go
const http2cipher_TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 uint16 = 0xC02F
```

### <a id="http2cipher_TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384" href="#http2cipher_TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384">const http2cipher_TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384</a>

```
searchKey: http.http2cipher_TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
tags: [private]
```

```Go
const http2cipher_TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 uint16 = 0xC030
```

### <a id="http2cipher_TLS_ECDH_RSA_WITH_AES_128_GCM_SHA256" href="#http2cipher_TLS_ECDH_RSA_WITH_AES_128_GCM_SHA256">const http2cipher_TLS_ECDH_RSA_WITH_AES_128_GCM_SHA256</a>

```
searchKey: http.http2cipher_TLS_ECDH_RSA_WITH_AES_128_GCM_SHA256
tags: [private]
```

```Go
const http2cipher_TLS_ECDH_RSA_WITH_AES_128_GCM_SHA256 uint16 = 0xC031
```

### <a id="http2cipher_TLS_ECDH_RSA_WITH_AES_256_GCM_SHA384" href="#http2cipher_TLS_ECDH_RSA_WITH_AES_256_GCM_SHA384">const http2cipher_TLS_ECDH_RSA_WITH_AES_256_GCM_SHA384</a>

```
searchKey: http.http2cipher_TLS_ECDH_RSA_WITH_AES_256_GCM_SHA384
tags: [private]
```

```Go
const http2cipher_TLS_ECDH_RSA_WITH_AES_256_GCM_SHA384 uint16 = 0xC032
```

### <a id="http2cipher_TLS_ECDHE_PSK_WITH_RC4_128_SHA" href="#http2cipher_TLS_ECDHE_PSK_WITH_RC4_128_SHA">const http2cipher_TLS_ECDHE_PSK_WITH_RC4_128_SHA</a>

```
searchKey: http.http2cipher_TLS_ECDHE_PSK_WITH_RC4_128_SHA
tags: [private]
```

```Go
const http2cipher_TLS_ECDHE_PSK_WITH_RC4_128_SHA uint16 = 0xC033
```

### <a id="http2cipher_TLS_ECDHE_PSK_WITH_3DES_EDE_CBC_SHA" href="#http2cipher_TLS_ECDHE_PSK_WITH_3DES_EDE_CBC_SHA">const http2cipher_TLS_ECDHE_PSK_WITH_3DES_EDE_CBC_SHA</a>

```
searchKey: http.http2cipher_TLS_ECDHE_PSK_WITH_3DES_EDE_CBC_SHA
tags: [private]
```

```Go
const http2cipher_TLS_ECDHE_PSK_WITH_3DES_EDE_CBC_SHA uint16 = 0xC034
```

### <a id="http2cipher_TLS_ECDHE_PSK_WITH_AES_128_CBC_SHA" href="#http2cipher_TLS_ECDHE_PSK_WITH_AES_128_CBC_SHA">const http2cipher_TLS_ECDHE_PSK_WITH_AES_128_CBC_SHA</a>

```
searchKey: http.http2cipher_TLS_ECDHE_PSK_WITH_AES_128_CBC_SHA
tags: [private]
```

```Go
const http2cipher_TLS_ECDHE_PSK_WITH_AES_128_CBC_SHA uint16 = 0xC035
```

### <a id="http2cipher_TLS_ECDHE_PSK_WITH_AES_256_CBC_SHA" href="#http2cipher_TLS_ECDHE_PSK_WITH_AES_256_CBC_SHA">const http2cipher_TLS_ECDHE_PSK_WITH_AES_256_CBC_SHA</a>

```
searchKey: http.http2cipher_TLS_ECDHE_PSK_WITH_AES_256_CBC_SHA
tags: [private]
```

```Go
const http2cipher_TLS_ECDHE_PSK_WITH_AES_256_CBC_SHA uint16 = 0xC036
```

### <a id="http2cipher_TLS_ECDHE_PSK_WITH_AES_128_CBC_SHA256" href="#http2cipher_TLS_ECDHE_PSK_WITH_AES_128_CBC_SHA256">const http2cipher_TLS_ECDHE_PSK_WITH_AES_128_CBC_SHA256</a>

```
searchKey: http.http2cipher_TLS_ECDHE_PSK_WITH_AES_128_CBC_SHA256
tags: [private]
```

```Go
const http2cipher_TLS_ECDHE_PSK_WITH_AES_128_CBC_SHA256 uint16 = 0xC037
```

### <a id="http2cipher_TLS_ECDHE_PSK_WITH_AES_256_CBC_SHA384" href="#http2cipher_TLS_ECDHE_PSK_WITH_AES_256_CBC_SHA384">const http2cipher_TLS_ECDHE_PSK_WITH_AES_256_CBC_SHA384</a>

```
searchKey: http.http2cipher_TLS_ECDHE_PSK_WITH_AES_256_CBC_SHA384
tags: [private]
```

```Go
const http2cipher_TLS_ECDHE_PSK_WITH_AES_256_CBC_SHA384 uint16 = 0xC038
```

### <a id="http2cipher_TLS_ECDHE_PSK_WITH_NULL_SHA" href="#http2cipher_TLS_ECDHE_PSK_WITH_NULL_SHA">const http2cipher_TLS_ECDHE_PSK_WITH_NULL_SHA</a>

```
searchKey: http.http2cipher_TLS_ECDHE_PSK_WITH_NULL_SHA
tags: [private]
```

```Go
const http2cipher_TLS_ECDHE_PSK_WITH_NULL_SHA uint16 = 0xC039
```

### <a id="http2cipher_TLS_ECDHE_PSK_WITH_NULL_SHA256" href="#http2cipher_TLS_ECDHE_PSK_WITH_NULL_SHA256">const http2cipher_TLS_ECDHE_PSK_WITH_NULL_SHA256</a>

```
searchKey: http.http2cipher_TLS_ECDHE_PSK_WITH_NULL_SHA256
tags: [private]
```

```Go
const http2cipher_TLS_ECDHE_PSK_WITH_NULL_SHA256 uint16 = 0xC03A
```

### <a id="http2cipher_TLS_ECDHE_PSK_WITH_NULL_SHA384" href="#http2cipher_TLS_ECDHE_PSK_WITH_NULL_SHA384">const http2cipher_TLS_ECDHE_PSK_WITH_NULL_SHA384</a>

```
searchKey: http.http2cipher_TLS_ECDHE_PSK_WITH_NULL_SHA384
tags: [private]
```

```Go
const http2cipher_TLS_ECDHE_PSK_WITH_NULL_SHA384 uint16 = 0xC03B
```

### <a id="http2cipher_TLS_RSA_WITH_ARIA_128_CBC_SHA256" href="#http2cipher_TLS_RSA_WITH_ARIA_128_CBC_SHA256">const http2cipher_TLS_RSA_WITH_ARIA_128_CBC_SHA256</a>

```
searchKey: http.http2cipher_TLS_RSA_WITH_ARIA_128_CBC_SHA256
tags: [private]
```

```Go
const http2cipher_TLS_RSA_WITH_ARIA_128_CBC_SHA256 uint16 = 0xC03C
```

### <a id="http2cipher_TLS_RSA_WITH_ARIA_256_CBC_SHA384" href="#http2cipher_TLS_RSA_WITH_ARIA_256_CBC_SHA384">const http2cipher_TLS_RSA_WITH_ARIA_256_CBC_SHA384</a>

```
searchKey: http.http2cipher_TLS_RSA_WITH_ARIA_256_CBC_SHA384
tags: [private]
```

```Go
const http2cipher_TLS_RSA_WITH_ARIA_256_CBC_SHA384 uint16 = 0xC03D
```

### <a id="http2cipher_TLS_DH_DSS_WITH_ARIA_128_CBC_SHA256" href="#http2cipher_TLS_DH_DSS_WITH_ARIA_128_CBC_SHA256">const http2cipher_TLS_DH_DSS_WITH_ARIA_128_CBC_SHA256</a>

```
searchKey: http.http2cipher_TLS_DH_DSS_WITH_ARIA_128_CBC_SHA256
tags: [private]
```

```Go
const http2cipher_TLS_DH_DSS_WITH_ARIA_128_CBC_SHA256 uint16 = 0xC03E
```

### <a id="http2cipher_TLS_DH_DSS_WITH_ARIA_256_CBC_SHA384" href="#http2cipher_TLS_DH_DSS_WITH_ARIA_256_CBC_SHA384">const http2cipher_TLS_DH_DSS_WITH_ARIA_256_CBC_SHA384</a>

```
searchKey: http.http2cipher_TLS_DH_DSS_WITH_ARIA_256_CBC_SHA384
tags: [private]
```

```Go
const http2cipher_TLS_DH_DSS_WITH_ARIA_256_CBC_SHA384 uint16 = 0xC03F
```

### <a id="http2cipher_TLS_DH_RSA_WITH_ARIA_128_CBC_SHA256" href="#http2cipher_TLS_DH_RSA_WITH_ARIA_128_CBC_SHA256">const http2cipher_TLS_DH_RSA_WITH_ARIA_128_CBC_SHA256</a>

```
searchKey: http.http2cipher_TLS_DH_RSA_WITH_ARIA_128_CBC_SHA256
tags: [private]
```

```Go
const http2cipher_TLS_DH_RSA_WITH_ARIA_128_CBC_SHA256 uint16 = 0xC040
```

### <a id="http2cipher_TLS_DH_RSA_WITH_ARIA_256_CBC_SHA384" href="#http2cipher_TLS_DH_RSA_WITH_ARIA_256_CBC_SHA384">const http2cipher_TLS_DH_RSA_WITH_ARIA_256_CBC_SHA384</a>

```
searchKey: http.http2cipher_TLS_DH_RSA_WITH_ARIA_256_CBC_SHA384
tags: [private]
```

```Go
const http2cipher_TLS_DH_RSA_WITH_ARIA_256_CBC_SHA384 uint16 = 0xC041
```

### <a id="http2cipher_TLS_DHE_DSS_WITH_ARIA_128_CBC_SHA256" href="#http2cipher_TLS_DHE_DSS_WITH_ARIA_128_CBC_SHA256">const http2cipher_TLS_DHE_DSS_WITH_ARIA_128_CBC_SHA256</a>

```
searchKey: http.http2cipher_TLS_DHE_DSS_WITH_ARIA_128_CBC_SHA256
tags: [private]
```

```Go
const http2cipher_TLS_DHE_DSS_WITH_ARIA_128_CBC_SHA256 uint16 = 0xC042
```

### <a id="http2cipher_TLS_DHE_DSS_WITH_ARIA_256_CBC_SHA384" href="#http2cipher_TLS_DHE_DSS_WITH_ARIA_256_CBC_SHA384">const http2cipher_TLS_DHE_DSS_WITH_ARIA_256_CBC_SHA384</a>

```
searchKey: http.http2cipher_TLS_DHE_DSS_WITH_ARIA_256_CBC_SHA384
tags: [private]
```

```Go
const http2cipher_TLS_DHE_DSS_WITH_ARIA_256_CBC_SHA384 uint16 = 0xC043
```

### <a id="http2cipher_TLS_DHE_RSA_WITH_ARIA_128_CBC_SHA256" href="#http2cipher_TLS_DHE_RSA_WITH_ARIA_128_CBC_SHA256">const http2cipher_TLS_DHE_RSA_WITH_ARIA_128_CBC_SHA256</a>

```
searchKey: http.http2cipher_TLS_DHE_RSA_WITH_ARIA_128_CBC_SHA256
tags: [private]
```

```Go
const http2cipher_TLS_DHE_RSA_WITH_ARIA_128_CBC_SHA256 uint16 = 0xC044
```

### <a id="http2cipher_TLS_DHE_RSA_WITH_ARIA_256_CBC_SHA384" href="#http2cipher_TLS_DHE_RSA_WITH_ARIA_256_CBC_SHA384">const http2cipher_TLS_DHE_RSA_WITH_ARIA_256_CBC_SHA384</a>

```
searchKey: http.http2cipher_TLS_DHE_RSA_WITH_ARIA_256_CBC_SHA384
tags: [private]
```

```Go
const http2cipher_TLS_DHE_RSA_WITH_ARIA_256_CBC_SHA384 uint16 = 0xC045
```

### <a id="http2cipher_TLS_DH_anon_WITH_ARIA_128_CBC_SHA256" href="#http2cipher_TLS_DH_anon_WITH_ARIA_128_CBC_SHA256">const http2cipher_TLS_DH_anon_WITH_ARIA_128_CBC_SHA256</a>

```
searchKey: http.http2cipher_TLS_DH_anon_WITH_ARIA_128_CBC_SHA256
tags: [private]
```

```Go
const http2cipher_TLS_DH_anon_WITH_ARIA_128_CBC_SHA256 uint16 = 0xC046
```

### <a id="http2cipher_TLS_DH_anon_WITH_ARIA_256_CBC_SHA384" href="#http2cipher_TLS_DH_anon_WITH_ARIA_256_CBC_SHA384">const http2cipher_TLS_DH_anon_WITH_ARIA_256_CBC_SHA384</a>

```
searchKey: http.http2cipher_TLS_DH_anon_WITH_ARIA_256_CBC_SHA384
tags: [private]
```

```Go
const http2cipher_TLS_DH_anon_WITH_ARIA_256_CBC_SHA384 uint16 = 0xC047
```

### <a id="http2cipher_TLS_ECDHE_ECDSA_WITH_ARIA_128_CBC_SHA256" href="#http2cipher_TLS_ECDHE_ECDSA_WITH_ARIA_128_CBC_SHA256">const http2cipher_TLS_ECDHE_ECDSA_WITH_ARIA_128_CBC_SHA256</a>

```
searchKey: http.http2cipher_TLS_ECDHE_ECDSA_WITH_ARIA_128_CBC_SHA256
tags: [private]
```

```Go
const http2cipher_TLS_ECDHE_ECDSA_WITH_ARIA_128_CBC_SHA256 uint16 = 0xC048
```

### <a id="http2cipher_TLS_ECDHE_ECDSA_WITH_ARIA_256_CBC_SHA384" href="#http2cipher_TLS_ECDHE_ECDSA_WITH_ARIA_256_CBC_SHA384">const http2cipher_TLS_ECDHE_ECDSA_WITH_ARIA_256_CBC_SHA384</a>

```
searchKey: http.http2cipher_TLS_ECDHE_ECDSA_WITH_ARIA_256_CBC_SHA384
tags: [private]
```

```Go
const http2cipher_TLS_ECDHE_ECDSA_WITH_ARIA_256_CBC_SHA384 uint16 = 0xC049
```

### <a id="http2cipher_TLS_ECDH_ECDSA_WITH_ARIA_128_CBC_SHA256" href="#http2cipher_TLS_ECDH_ECDSA_WITH_ARIA_128_CBC_SHA256">const http2cipher_TLS_ECDH_ECDSA_WITH_ARIA_128_CBC_SHA256</a>

```
searchKey: http.http2cipher_TLS_ECDH_ECDSA_WITH_ARIA_128_CBC_SHA256
tags: [private]
```

```Go
const http2cipher_TLS_ECDH_ECDSA_WITH_ARIA_128_CBC_SHA256 uint16 = 0xC04A
```

### <a id="http2cipher_TLS_ECDH_ECDSA_WITH_ARIA_256_CBC_SHA384" href="#http2cipher_TLS_ECDH_ECDSA_WITH_ARIA_256_CBC_SHA384">const http2cipher_TLS_ECDH_ECDSA_WITH_ARIA_256_CBC_SHA384</a>

```
searchKey: http.http2cipher_TLS_ECDH_ECDSA_WITH_ARIA_256_CBC_SHA384
tags: [private]
```

```Go
const http2cipher_TLS_ECDH_ECDSA_WITH_ARIA_256_CBC_SHA384 uint16 = 0xC04B
```

### <a id="http2cipher_TLS_ECDHE_RSA_WITH_ARIA_128_CBC_SHA256" href="#http2cipher_TLS_ECDHE_RSA_WITH_ARIA_128_CBC_SHA256">const http2cipher_TLS_ECDHE_RSA_WITH_ARIA_128_CBC_SHA256</a>

```
searchKey: http.http2cipher_TLS_ECDHE_RSA_WITH_ARIA_128_CBC_SHA256
tags: [private]
```

```Go
const http2cipher_TLS_ECDHE_RSA_WITH_ARIA_128_CBC_SHA256 uint16 = 0xC04C
```

### <a id="http2cipher_TLS_ECDHE_RSA_WITH_ARIA_256_CBC_SHA384" href="#http2cipher_TLS_ECDHE_RSA_WITH_ARIA_256_CBC_SHA384">const http2cipher_TLS_ECDHE_RSA_WITH_ARIA_256_CBC_SHA384</a>

```
searchKey: http.http2cipher_TLS_ECDHE_RSA_WITH_ARIA_256_CBC_SHA384
tags: [private]
```

```Go
const http2cipher_TLS_ECDHE_RSA_WITH_ARIA_256_CBC_SHA384 uint16 = 0xC04D
```

### <a id="http2cipher_TLS_ECDH_RSA_WITH_ARIA_128_CBC_SHA256" href="#http2cipher_TLS_ECDH_RSA_WITH_ARIA_128_CBC_SHA256">const http2cipher_TLS_ECDH_RSA_WITH_ARIA_128_CBC_SHA256</a>

```
searchKey: http.http2cipher_TLS_ECDH_RSA_WITH_ARIA_128_CBC_SHA256
tags: [private]
```

```Go
const http2cipher_TLS_ECDH_RSA_WITH_ARIA_128_CBC_SHA256 uint16 = 0xC04E
```

### <a id="http2cipher_TLS_ECDH_RSA_WITH_ARIA_256_CBC_SHA384" href="#http2cipher_TLS_ECDH_RSA_WITH_ARIA_256_CBC_SHA384">const http2cipher_TLS_ECDH_RSA_WITH_ARIA_256_CBC_SHA384</a>

```
searchKey: http.http2cipher_TLS_ECDH_RSA_WITH_ARIA_256_CBC_SHA384
tags: [private]
```

```Go
const http2cipher_TLS_ECDH_RSA_WITH_ARIA_256_CBC_SHA384 uint16 = 0xC04F
```

### <a id="http2cipher_TLS_RSA_WITH_ARIA_128_GCM_SHA256" href="#http2cipher_TLS_RSA_WITH_ARIA_128_GCM_SHA256">const http2cipher_TLS_RSA_WITH_ARIA_128_GCM_SHA256</a>

```
searchKey: http.http2cipher_TLS_RSA_WITH_ARIA_128_GCM_SHA256
tags: [private]
```

```Go
const http2cipher_TLS_RSA_WITH_ARIA_128_GCM_SHA256 uint16 = 0xC050
```

### <a id="http2cipher_TLS_RSA_WITH_ARIA_256_GCM_SHA384" href="#http2cipher_TLS_RSA_WITH_ARIA_256_GCM_SHA384">const http2cipher_TLS_RSA_WITH_ARIA_256_GCM_SHA384</a>

```
searchKey: http.http2cipher_TLS_RSA_WITH_ARIA_256_GCM_SHA384
tags: [private]
```

```Go
const http2cipher_TLS_RSA_WITH_ARIA_256_GCM_SHA384 uint16 = 0xC051
```

### <a id="http2cipher_TLS_DHE_RSA_WITH_ARIA_128_GCM_SHA256" href="#http2cipher_TLS_DHE_RSA_WITH_ARIA_128_GCM_SHA256">const http2cipher_TLS_DHE_RSA_WITH_ARIA_128_GCM_SHA256</a>

```
searchKey: http.http2cipher_TLS_DHE_RSA_WITH_ARIA_128_GCM_SHA256
tags: [private]
```

```Go
const http2cipher_TLS_DHE_RSA_WITH_ARIA_128_GCM_SHA256 uint16 = 0xC052
```

### <a id="http2cipher_TLS_DHE_RSA_WITH_ARIA_256_GCM_SHA384" href="#http2cipher_TLS_DHE_RSA_WITH_ARIA_256_GCM_SHA384">const http2cipher_TLS_DHE_RSA_WITH_ARIA_256_GCM_SHA384</a>

```
searchKey: http.http2cipher_TLS_DHE_RSA_WITH_ARIA_256_GCM_SHA384
tags: [private]
```

```Go
const http2cipher_TLS_DHE_RSA_WITH_ARIA_256_GCM_SHA384 uint16 = 0xC053
```

### <a id="http2cipher_TLS_DH_RSA_WITH_ARIA_128_GCM_SHA256" href="#http2cipher_TLS_DH_RSA_WITH_ARIA_128_GCM_SHA256">const http2cipher_TLS_DH_RSA_WITH_ARIA_128_GCM_SHA256</a>

```
searchKey: http.http2cipher_TLS_DH_RSA_WITH_ARIA_128_GCM_SHA256
tags: [private]
```

```Go
const http2cipher_TLS_DH_RSA_WITH_ARIA_128_GCM_SHA256 uint16 = 0xC054
```

### <a id="http2cipher_TLS_DH_RSA_WITH_ARIA_256_GCM_SHA384" href="#http2cipher_TLS_DH_RSA_WITH_ARIA_256_GCM_SHA384">const http2cipher_TLS_DH_RSA_WITH_ARIA_256_GCM_SHA384</a>

```
searchKey: http.http2cipher_TLS_DH_RSA_WITH_ARIA_256_GCM_SHA384
tags: [private]
```

```Go
const http2cipher_TLS_DH_RSA_WITH_ARIA_256_GCM_SHA384 uint16 = 0xC055
```

### <a id="http2cipher_TLS_DHE_DSS_WITH_ARIA_128_GCM_SHA256" href="#http2cipher_TLS_DHE_DSS_WITH_ARIA_128_GCM_SHA256">const http2cipher_TLS_DHE_DSS_WITH_ARIA_128_GCM_SHA256</a>

```
searchKey: http.http2cipher_TLS_DHE_DSS_WITH_ARIA_128_GCM_SHA256
tags: [private]
```

```Go
const http2cipher_TLS_DHE_DSS_WITH_ARIA_128_GCM_SHA256 uint16 = 0xC056
```

### <a id="http2cipher_TLS_DHE_DSS_WITH_ARIA_256_GCM_SHA384" href="#http2cipher_TLS_DHE_DSS_WITH_ARIA_256_GCM_SHA384">const http2cipher_TLS_DHE_DSS_WITH_ARIA_256_GCM_SHA384</a>

```
searchKey: http.http2cipher_TLS_DHE_DSS_WITH_ARIA_256_GCM_SHA384
tags: [private]
```

```Go
const http2cipher_TLS_DHE_DSS_WITH_ARIA_256_GCM_SHA384 uint16 = 0xC057
```

### <a id="http2cipher_TLS_DH_DSS_WITH_ARIA_128_GCM_SHA256" href="#http2cipher_TLS_DH_DSS_WITH_ARIA_128_GCM_SHA256">const http2cipher_TLS_DH_DSS_WITH_ARIA_128_GCM_SHA256</a>

```
searchKey: http.http2cipher_TLS_DH_DSS_WITH_ARIA_128_GCM_SHA256
tags: [private]
```

```Go
const http2cipher_TLS_DH_DSS_WITH_ARIA_128_GCM_SHA256 uint16 = 0xC058
```

### <a id="http2cipher_TLS_DH_DSS_WITH_ARIA_256_GCM_SHA384" href="#http2cipher_TLS_DH_DSS_WITH_ARIA_256_GCM_SHA384">const http2cipher_TLS_DH_DSS_WITH_ARIA_256_GCM_SHA384</a>

```
searchKey: http.http2cipher_TLS_DH_DSS_WITH_ARIA_256_GCM_SHA384
tags: [private]
```

```Go
const http2cipher_TLS_DH_DSS_WITH_ARIA_256_GCM_SHA384 uint16 = 0xC059
```

### <a id="http2cipher_TLS_DH_anon_WITH_ARIA_128_GCM_SHA256" href="#http2cipher_TLS_DH_anon_WITH_ARIA_128_GCM_SHA256">const http2cipher_TLS_DH_anon_WITH_ARIA_128_GCM_SHA256</a>

```
searchKey: http.http2cipher_TLS_DH_anon_WITH_ARIA_128_GCM_SHA256
tags: [private]
```

```Go
const http2cipher_TLS_DH_anon_WITH_ARIA_128_GCM_SHA256 uint16 = 0xC05A
```

### <a id="http2cipher_TLS_DH_anon_WITH_ARIA_256_GCM_SHA384" href="#http2cipher_TLS_DH_anon_WITH_ARIA_256_GCM_SHA384">const http2cipher_TLS_DH_anon_WITH_ARIA_256_GCM_SHA384</a>

```
searchKey: http.http2cipher_TLS_DH_anon_WITH_ARIA_256_GCM_SHA384
tags: [private]
```

```Go
const http2cipher_TLS_DH_anon_WITH_ARIA_256_GCM_SHA384 uint16 = 0xC05B
```

### <a id="http2cipher_TLS_ECDHE_ECDSA_WITH_ARIA_128_GCM_SHA256" href="#http2cipher_TLS_ECDHE_ECDSA_WITH_ARIA_128_GCM_SHA256">const http2cipher_TLS_ECDHE_ECDSA_WITH_ARIA_128_GCM_SHA256</a>

```
searchKey: http.http2cipher_TLS_ECDHE_ECDSA_WITH_ARIA_128_GCM_SHA256
tags: [private]
```

```Go
const http2cipher_TLS_ECDHE_ECDSA_WITH_ARIA_128_GCM_SHA256 uint16 = 0xC05C
```

### <a id="http2cipher_TLS_ECDHE_ECDSA_WITH_ARIA_256_GCM_SHA384" href="#http2cipher_TLS_ECDHE_ECDSA_WITH_ARIA_256_GCM_SHA384">const http2cipher_TLS_ECDHE_ECDSA_WITH_ARIA_256_GCM_SHA384</a>

```
searchKey: http.http2cipher_TLS_ECDHE_ECDSA_WITH_ARIA_256_GCM_SHA384
tags: [private]
```

```Go
const http2cipher_TLS_ECDHE_ECDSA_WITH_ARIA_256_GCM_SHA384 uint16 = 0xC05D
```

### <a id="http2cipher_TLS_ECDH_ECDSA_WITH_ARIA_128_GCM_SHA256" href="#http2cipher_TLS_ECDH_ECDSA_WITH_ARIA_128_GCM_SHA256">const http2cipher_TLS_ECDH_ECDSA_WITH_ARIA_128_GCM_SHA256</a>

```
searchKey: http.http2cipher_TLS_ECDH_ECDSA_WITH_ARIA_128_GCM_SHA256
tags: [private]
```

```Go
const http2cipher_TLS_ECDH_ECDSA_WITH_ARIA_128_GCM_SHA256 uint16 = 0xC05E
```

### <a id="http2cipher_TLS_ECDH_ECDSA_WITH_ARIA_256_GCM_SHA384" href="#http2cipher_TLS_ECDH_ECDSA_WITH_ARIA_256_GCM_SHA384">const http2cipher_TLS_ECDH_ECDSA_WITH_ARIA_256_GCM_SHA384</a>

```
searchKey: http.http2cipher_TLS_ECDH_ECDSA_WITH_ARIA_256_GCM_SHA384
tags: [private]
```

```Go
const http2cipher_TLS_ECDH_ECDSA_WITH_ARIA_256_GCM_SHA384 uint16 = 0xC05F
```

### <a id="http2cipher_TLS_ECDHE_RSA_WITH_ARIA_128_GCM_SHA256" href="#http2cipher_TLS_ECDHE_RSA_WITH_ARIA_128_GCM_SHA256">const http2cipher_TLS_ECDHE_RSA_WITH_ARIA_128_GCM_SHA256</a>

```
searchKey: http.http2cipher_TLS_ECDHE_RSA_WITH_ARIA_128_GCM_SHA256
tags: [private]
```

```Go
const http2cipher_TLS_ECDHE_RSA_WITH_ARIA_128_GCM_SHA256 uint16 = 0xC060
```

### <a id="http2cipher_TLS_ECDHE_RSA_WITH_ARIA_256_GCM_SHA384" href="#http2cipher_TLS_ECDHE_RSA_WITH_ARIA_256_GCM_SHA384">const http2cipher_TLS_ECDHE_RSA_WITH_ARIA_256_GCM_SHA384</a>

```
searchKey: http.http2cipher_TLS_ECDHE_RSA_WITH_ARIA_256_GCM_SHA384
tags: [private]
```

```Go
const http2cipher_TLS_ECDHE_RSA_WITH_ARIA_256_GCM_SHA384 uint16 = 0xC061
```

### <a id="http2cipher_TLS_ECDH_RSA_WITH_ARIA_128_GCM_SHA256" href="#http2cipher_TLS_ECDH_RSA_WITH_ARIA_128_GCM_SHA256">const http2cipher_TLS_ECDH_RSA_WITH_ARIA_128_GCM_SHA256</a>

```
searchKey: http.http2cipher_TLS_ECDH_RSA_WITH_ARIA_128_GCM_SHA256
tags: [private]
```

```Go
const http2cipher_TLS_ECDH_RSA_WITH_ARIA_128_GCM_SHA256 uint16 = 0xC062
```

### <a id="http2cipher_TLS_ECDH_RSA_WITH_ARIA_256_GCM_SHA384" href="#http2cipher_TLS_ECDH_RSA_WITH_ARIA_256_GCM_SHA384">const http2cipher_TLS_ECDH_RSA_WITH_ARIA_256_GCM_SHA384</a>

```
searchKey: http.http2cipher_TLS_ECDH_RSA_WITH_ARIA_256_GCM_SHA384
tags: [private]
```

```Go
const http2cipher_TLS_ECDH_RSA_WITH_ARIA_256_GCM_SHA384 uint16 = 0xC063
```

### <a id="http2cipher_TLS_PSK_WITH_ARIA_128_CBC_SHA256" href="#http2cipher_TLS_PSK_WITH_ARIA_128_CBC_SHA256">const http2cipher_TLS_PSK_WITH_ARIA_128_CBC_SHA256</a>

```
searchKey: http.http2cipher_TLS_PSK_WITH_ARIA_128_CBC_SHA256
tags: [private]
```

```Go
const http2cipher_TLS_PSK_WITH_ARIA_128_CBC_SHA256 uint16 = 0xC064
```

### <a id="http2cipher_TLS_PSK_WITH_ARIA_256_CBC_SHA384" href="#http2cipher_TLS_PSK_WITH_ARIA_256_CBC_SHA384">const http2cipher_TLS_PSK_WITH_ARIA_256_CBC_SHA384</a>

```
searchKey: http.http2cipher_TLS_PSK_WITH_ARIA_256_CBC_SHA384
tags: [private]
```

```Go
const http2cipher_TLS_PSK_WITH_ARIA_256_CBC_SHA384 uint16 = 0xC065
```

### <a id="http2cipher_TLS_DHE_PSK_WITH_ARIA_128_CBC_SHA256" href="#http2cipher_TLS_DHE_PSK_WITH_ARIA_128_CBC_SHA256">const http2cipher_TLS_DHE_PSK_WITH_ARIA_128_CBC_SHA256</a>

```
searchKey: http.http2cipher_TLS_DHE_PSK_WITH_ARIA_128_CBC_SHA256
tags: [private]
```

```Go
const http2cipher_TLS_DHE_PSK_WITH_ARIA_128_CBC_SHA256 uint16 = 0xC066
```

### <a id="http2cipher_TLS_DHE_PSK_WITH_ARIA_256_CBC_SHA384" href="#http2cipher_TLS_DHE_PSK_WITH_ARIA_256_CBC_SHA384">const http2cipher_TLS_DHE_PSK_WITH_ARIA_256_CBC_SHA384</a>

```
searchKey: http.http2cipher_TLS_DHE_PSK_WITH_ARIA_256_CBC_SHA384
tags: [private]
```

```Go
const http2cipher_TLS_DHE_PSK_WITH_ARIA_256_CBC_SHA384 uint16 = 0xC067
```

### <a id="http2cipher_TLS_RSA_PSK_WITH_ARIA_128_CBC_SHA256" href="#http2cipher_TLS_RSA_PSK_WITH_ARIA_128_CBC_SHA256">const http2cipher_TLS_RSA_PSK_WITH_ARIA_128_CBC_SHA256</a>

```
searchKey: http.http2cipher_TLS_RSA_PSK_WITH_ARIA_128_CBC_SHA256
tags: [private]
```

```Go
const http2cipher_TLS_RSA_PSK_WITH_ARIA_128_CBC_SHA256 uint16 = 0xC068
```

### <a id="http2cipher_TLS_RSA_PSK_WITH_ARIA_256_CBC_SHA384" href="#http2cipher_TLS_RSA_PSK_WITH_ARIA_256_CBC_SHA384">const http2cipher_TLS_RSA_PSK_WITH_ARIA_256_CBC_SHA384</a>

```
searchKey: http.http2cipher_TLS_RSA_PSK_WITH_ARIA_256_CBC_SHA384
tags: [private]
```

```Go
const http2cipher_TLS_RSA_PSK_WITH_ARIA_256_CBC_SHA384 uint16 = 0xC069
```

### <a id="http2cipher_TLS_PSK_WITH_ARIA_128_GCM_SHA256" href="#http2cipher_TLS_PSK_WITH_ARIA_128_GCM_SHA256">const http2cipher_TLS_PSK_WITH_ARIA_128_GCM_SHA256</a>

```
searchKey: http.http2cipher_TLS_PSK_WITH_ARIA_128_GCM_SHA256
tags: [private]
```

```Go
const http2cipher_TLS_PSK_WITH_ARIA_128_GCM_SHA256 uint16 = 0xC06A
```

### <a id="http2cipher_TLS_PSK_WITH_ARIA_256_GCM_SHA384" href="#http2cipher_TLS_PSK_WITH_ARIA_256_GCM_SHA384">const http2cipher_TLS_PSK_WITH_ARIA_256_GCM_SHA384</a>

```
searchKey: http.http2cipher_TLS_PSK_WITH_ARIA_256_GCM_SHA384
tags: [private]
```

```Go
const http2cipher_TLS_PSK_WITH_ARIA_256_GCM_SHA384 uint16 = 0xC06B
```

### <a id="http2cipher_TLS_DHE_PSK_WITH_ARIA_128_GCM_SHA256" href="#http2cipher_TLS_DHE_PSK_WITH_ARIA_128_GCM_SHA256">const http2cipher_TLS_DHE_PSK_WITH_ARIA_128_GCM_SHA256</a>

```
searchKey: http.http2cipher_TLS_DHE_PSK_WITH_ARIA_128_GCM_SHA256
tags: [private]
```

```Go
const http2cipher_TLS_DHE_PSK_WITH_ARIA_128_GCM_SHA256 uint16 = 0xC06C
```

### <a id="http2cipher_TLS_DHE_PSK_WITH_ARIA_256_GCM_SHA384" href="#http2cipher_TLS_DHE_PSK_WITH_ARIA_256_GCM_SHA384">const http2cipher_TLS_DHE_PSK_WITH_ARIA_256_GCM_SHA384</a>

```
searchKey: http.http2cipher_TLS_DHE_PSK_WITH_ARIA_256_GCM_SHA384
tags: [private]
```

```Go
const http2cipher_TLS_DHE_PSK_WITH_ARIA_256_GCM_SHA384 uint16 = 0xC06D
```

### <a id="http2cipher_TLS_RSA_PSK_WITH_ARIA_128_GCM_SHA256" href="#http2cipher_TLS_RSA_PSK_WITH_ARIA_128_GCM_SHA256">const http2cipher_TLS_RSA_PSK_WITH_ARIA_128_GCM_SHA256</a>

```
searchKey: http.http2cipher_TLS_RSA_PSK_WITH_ARIA_128_GCM_SHA256
tags: [private]
```

```Go
const http2cipher_TLS_RSA_PSK_WITH_ARIA_128_GCM_SHA256 uint16 = 0xC06E
```

### <a id="http2cipher_TLS_RSA_PSK_WITH_ARIA_256_GCM_SHA384" href="#http2cipher_TLS_RSA_PSK_WITH_ARIA_256_GCM_SHA384">const http2cipher_TLS_RSA_PSK_WITH_ARIA_256_GCM_SHA384</a>

```
searchKey: http.http2cipher_TLS_RSA_PSK_WITH_ARIA_256_GCM_SHA384
tags: [private]
```

```Go
const http2cipher_TLS_RSA_PSK_WITH_ARIA_256_GCM_SHA384 uint16 = 0xC06F
```

### <a id="http2cipher_TLS_ECDHE_PSK_WITH_ARIA_128_CBC_SHA256" href="#http2cipher_TLS_ECDHE_PSK_WITH_ARIA_128_CBC_SHA256">const http2cipher_TLS_ECDHE_PSK_WITH_ARIA_128_CBC_SHA256</a>

```
searchKey: http.http2cipher_TLS_ECDHE_PSK_WITH_ARIA_128_CBC_SHA256
tags: [private]
```

```Go
const http2cipher_TLS_ECDHE_PSK_WITH_ARIA_128_CBC_SHA256 uint16 = 0xC070
```

### <a id="http2cipher_TLS_ECDHE_PSK_WITH_ARIA_256_CBC_SHA384" href="#http2cipher_TLS_ECDHE_PSK_WITH_ARIA_256_CBC_SHA384">const http2cipher_TLS_ECDHE_PSK_WITH_ARIA_256_CBC_SHA384</a>

```
searchKey: http.http2cipher_TLS_ECDHE_PSK_WITH_ARIA_256_CBC_SHA384
tags: [private]
```

```Go
const http2cipher_TLS_ECDHE_PSK_WITH_ARIA_256_CBC_SHA384 uint16 = 0xC071
```

### <a id="http2cipher_TLS_ECDHE_ECDSA_WITH_CAMELLIA_128_CBC_SHA256" href="#http2cipher_TLS_ECDHE_ECDSA_WITH_CAMELLIA_128_CBC_SHA256">const http2cipher_TLS_ECDHE_ECDSA_WITH_CAMELLIA_128_CBC_SHA256</a>

```
searchKey: http.http2cipher_TLS_ECDHE_ECDSA_WITH_CAMELLIA_128_CBC_SHA256
tags: [private]
```

```Go
const http2cipher_TLS_ECDHE_ECDSA_WITH_CAMELLIA_128_CBC_SHA256 uint16 = 0xC072
```

### <a id="http2cipher_TLS_ECDHE_ECDSA_WITH_CAMELLIA_256_CBC_SHA384" href="#http2cipher_TLS_ECDHE_ECDSA_WITH_CAMELLIA_256_CBC_SHA384">const http2cipher_TLS_ECDHE_ECDSA_WITH_CAMELLIA_256_CBC_SHA384</a>

```
searchKey: http.http2cipher_TLS_ECDHE_ECDSA_WITH_CAMELLIA_256_CBC_SHA384
tags: [private]
```

```Go
const http2cipher_TLS_ECDHE_ECDSA_WITH_CAMELLIA_256_CBC_SHA384 uint16 = 0xC073
```

### <a id="http2cipher_TLS_ECDH_ECDSA_WITH_CAMELLIA_128_CBC_SHA256" href="#http2cipher_TLS_ECDH_ECDSA_WITH_CAMELLIA_128_CBC_SHA256">const http2cipher_TLS_ECDH_ECDSA_WITH_CAMELLIA_128_CBC_SHA256</a>

```
searchKey: http.http2cipher_TLS_ECDH_ECDSA_WITH_CAMELLIA_128_CBC_SHA256
tags: [private]
```

```Go
const http2cipher_TLS_ECDH_ECDSA_WITH_CAMELLIA_128_CBC_SHA256 uint16 = 0xC074
```

### <a id="http2cipher_TLS_ECDH_ECDSA_WITH_CAMELLIA_256_CBC_SHA384" href="#http2cipher_TLS_ECDH_ECDSA_WITH_CAMELLIA_256_CBC_SHA384">const http2cipher_TLS_ECDH_ECDSA_WITH_CAMELLIA_256_CBC_SHA384</a>

```
searchKey: http.http2cipher_TLS_ECDH_ECDSA_WITH_CAMELLIA_256_CBC_SHA384
tags: [private]
```

```Go
const http2cipher_TLS_ECDH_ECDSA_WITH_CAMELLIA_256_CBC_SHA384 uint16 = 0xC075
```

### <a id="http2cipher_TLS_ECDHE_RSA_WITH_CAMELLIA_128_CBC_SHA256" href="#http2cipher_TLS_ECDHE_RSA_WITH_CAMELLIA_128_CBC_SHA256">const http2cipher_TLS_ECDHE_RSA_WITH_CAMELLIA_128_CBC_SHA256</a>

```
searchKey: http.http2cipher_TLS_ECDHE_RSA_WITH_CAMELLIA_128_CBC_SHA256
tags: [private]
```

```Go
const http2cipher_TLS_ECDHE_RSA_WITH_CAMELLIA_128_CBC_SHA256 uint16 = 0xC076
```

### <a id="http2cipher_TLS_ECDHE_RSA_WITH_CAMELLIA_256_CBC_SHA384" href="#http2cipher_TLS_ECDHE_RSA_WITH_CAMELLIA_256_CBC_SHA384">const http2cipher_TLS_ECDHE_RSA_WITH_CAMELLIA_256_CBC_SHA384</a>

```
searchKey: http.http2cipher_TLS_ECDHE_RSA_WITH_CAMELLIA_256_CBC_SHA384
tags: [private]
```

```Go
const http2cipher_TLS_ECDHE_RSA_WITH_CAMELLIA_256_CBC_SHA384 uint16 = 0xC077
```

### <a id="http2cipher_TLS_ECDH_RSA_WITH_CAMELLIA_128_CBC_SHA256" href="#http2cipher_TLS_ECDH_RSA_WITH_CAMELLIA_128_CBC_SHA256">const http2cipher_TLS_ECDH_RSA_WITH_CAMELLIA_128_CBC_SHA256</a>

```
searchKey: http.http2cipher_TLS_ECDH_RSA_WITH_CAMELLIA_128_CBC_SHA256
tags: [private]
```

```Go
const http2cipher_TLS_ECDH_RSA_WITH_CAMELLIA_128_CBC_SHA256 uint16 = 0xC078
```

### <a id="http2cipher_TLS_ECDH_RSA_WITH_CAMELLIA_256_CBC_SHA384" href="#http2cipher_TLS_ECDH_RSA_WITH_CAMELLIA_256_CBC_SHA384">const http2cipher_TLS_ECDH_RSA_WITH_CAMELLIA_256_CBC_SHA384</a>

```
searchKey: http.http2cipher_TLS_ECDH_RSA_WITH_CAMELLIA_256_CBC_SHA384
tags: [private]
```

```Go
const http2cipher_TLS_ECDH_RSA_WITH_CAMELLIA_256_CBC_SHA384 uint16 = 0xC079
```

### <a id="http2cipher_TLS_RSA_WITH_CAMELLIA_128_GCM_SHA256" href="#http2cipher_TLS_RSA_WITH_CAMELLIA_128_GCM_SHA256">const http2cipher_TLS_RSA_WITH_CAMELLIA_128_GCM_SHA256</a>

```
searchKey: http.http2cipher_TLS_RSA_WITH_CAMELLIA_128_GCM_SHA256
tags: [private]
```

```Go
const http2cipher_TLS_RSA_WITH_CAMELLIA_128_GCM_SHA256 uint16 = 0xC07A
```

### <a id="http2cipher_TLS_RSA_WITH_CAMELLIA_256_GCM_SHA384" href="#http2cipher_TLS_RSA_WITH_CAMELLIA_256_GCM_SHA384">const http2cipher_TLS_RSA_WITH_CAMELLIA_256_GCM_SHA384</a>

```
searchKey: http.http2cipher_TLS_RSA_WITH_CAMELLIA_256_GCM_SHA384
tags: [private]
```

```Go
const http2cipher_TLS_RSA_WITH_CAMELLIA_256_GCM_SHA384 uint16 = 0xC07B
```

### <a id="http2cipher_TLS_DHE_RSA_WITH_CAMELLIA_128_GCM_SHA256" href="#http2cipher_TLS_DHE_RSA_WITH_CAMELLIA_128_GCM_SHA256">const http2cipher_TLS_DHE_RSA_WITH_CAMELLIA_128_GCM_SHA256</a>

```
searchKey: http.http2cipher_TLS_DHE_RSA_WITH_CAMELLIA_128_GCM_SHA256
tags: [private]
```

```Go
const http2cipher_TLS_DHE_RSA_WITH_CAMELLIA_128_GCM_SHA256 uint16 = 0xC07C
```

### <a id="http2cipher_TLS_DHE_RSA_WITH_CAMELLIA_256_GCM_SHA384" href="#http2cipher_TLS_DHE_RSA_WITH_CAMELLIA_256_GCM_SHA384">const http2cipher_TLS_DHE_RSA_WITH_CAMELLIA_256_GCM_SHA384</a>

```
searchKey: http.http2cipher_TLS_DHE_RSA_WITH_CAMELLIA_256_GCM_SHA384
tags: [private]
```

```Go
const http2cipher_TLS_DHE_RSA_WITH_CAMELLIA_256_GCM_SHA384 uint16 = 0xC07D
```

### <a id="http2cipher_TLS_DH_RSA_WITH_CAMELLIA_128_GCM_SHA256" href="#http2cipher_TLS_DH_RSA_WITH_CAMELLIA_128_GCM_SHA256">const http2cipher_TLS_DH_RSA_WITH_CAMELLIA_128_GCM_SHA256</a>

```
searchKey: http.http2cipher_TLS_DH_RSA_WITH_CAMELLIA_128_GCM_SHA256
tags: [private]
```

```Go
const http2cipher_TLS_DH_RSA_WITH_CAMELLIA_128_GCM_SHA256 uint16 = 0xC07E
```

### <a id="http2cipher_TLS_DH_RSA_WITH_CAMELLIA_256_GCM_SHA384" href="#http2cipher_TLS_DH_RSA_WITH_CAMELLIA_256_GCM_SHA384">const http2cipher_TLS_DH_RSA_WITH_CAMELLIA_256_GCM_SHA384</a>

```
searchKey: http.http2cipher_TLS_DH_RSA_WITH_CAMELLIA_256_GCM_SHA384
tags: [private]
```

```Go
const http2cipher_TLS_DH_RSA_WITH_CAMELLIA_256_GCM_SHA384 uint16 = 0xC07F
```

### <a id="http2cipher_TLS_DHE_DSS_WITH_CAMELLIA_128_GCM_SHA256" href="#http2cipher_TLS_DHE_DSS_WITH_CAMELLIA_128_GCM_SHA256">const http2cipher_TLS_DHE_DSS_WITH_CAMELLIA_128_GCM_SHA256</a>

```
searchKey: http.http2cipher_TLS_DHE_DSS_WITH_CAMELLIA_128_GCM_SHA256
tags: [private]
```

```Go
const http2cipher_TLS_DHE_DSS_WITH_CAMELLIA_128_GCM_SHA256 uint16 = 0xC080
```

### <a id="http2cipher_TLS_DHE_DSS_WITH_CAMELLIA_256_GCM_SHA384" href="#http2cipher_TLS_DHE_DSS_WITH_CAMELLIA_256_GCM_SHA384">const http2cipher_TLS_DHE_DSS_WITH_CAMELLIA_256_GCM_SHA384</a>

```
searchKey: http.http2cipher_TLS_DHE_DSS_WITH_CAMELLIA_256_GCM_SHA384
tags: [private]
```

```Go
const http2cipher_TLS_DHE_DSS_WITH_CAMELLIA_256_GCM_SHA384 uint16 = 0xC081
```

### <a id="http2cipher_TLS_DH_DSS_WITH_CAMELLIA_128_GCM_SHA256" href="#http2cipher_TLS_DH_DSS_WITH_CAMELLIA_128_GCM_SHA256">const http2cipher_TLS_DH_DSS_WITH_CAMELLIA_128_GCM_SHA256</a>

```
searchKey: http.http2cipher_TLS_DH_DSS_WITH_CAMELLIA_128_GCM_SHA256
tags: [private]
```

```Go
const http2cipher_TLS_DH_DSS_WITH_CAMELLIA_128_GCM_SHA256 uint16 = 0xC082
```

### <a id="http2cipher_TLS_DH_DSS_WITH_CAMELLIA_256_GCM_SHA384" href="#http2cipher_TLS_DH_DSS_WITH_CAMELLIA_256_GCM_SHA384">const http2cipher_TLS_DH_DSS_WITH_CAMELLIA_256_GCM_SHA384</a>

```
searchKey: http.http2cipher_TLS_DH_DSS_WITH_CAMELLIA_256_GCM_SHA384
tags: [private]
```

```Go
const http2cipher_TLS_DH_DSS_WITH_CAMELLIA_256_GCM_SHA384 uint16 = 0xC083
```

### <a id="http2cipher_TLS_DH_anon_WITH_CAMELLIA_128_GCM_SHA256" href="#http2cipher_TLS_DH_anon_WITH_CAMELLIA_128_GCM_SHA256">const http2cipher_TLS_DH_anon_WITH_CAMELLIA_128_GCM_SHA256</a>

```
searchKey: http.http2cipher_TLS_DH_anon_WITH_CAMELLIA_128_GCM_SHA256
tags: [private]
```

```Go
const http2cipher_TLS_DH_anon_WITH_CAMELLIA_128_GCM_SHA256 uint16 = 0xC084
```

### <a id="http2cipher_TLS_DH_anon_WITH_CAMELLIA_256_GCM_SHA384" href="#http2cipher_TLS_DH_anon_WITH_CAMELLIA_256_GCM_SHA384">const http2cipher_TLS_DH_anon_WITH_CAMELLIA_256_GCM_SHA384</a>

```
searchKey: http.http2cipher_TLS_DH_anon_WITH_CAMELLIA_256_GCM_SHA384
tags: [private]
```

```Go
const http2cipher_TLS_DH_anon_WITH_CAMELLIA_256_GCM_SHA384 uint16 = 0xC085
```

### <a id="http2cipher_TLS_ECDHE_ECDSA_WITH_CAMELLIA_128_GCM_SHA256" href="#http2cipher_TLS_ECDHE_ECDSA_WITH_CAMELLIA_128_GCM_SHA256">const http2cipher_TLS_ECDHE_ECDSA_WITH_CAMELLIA_128_GCM_SHA256</a>

```
searchKey: http.http2cipher_TLS_ECDHE_ECDSA_WITH_CAMELLIA_128_GCM_SHA256
tags: [private]
```

```Go
const http2cipher_TLS_ECDHE_ECDSA_WITH_CAMELLIA_128_GCM_SHA256 uint16 = 0xC086
```

### <a id="http2cipher_TLS_ECDHE_ECDSA_WITH_CAMELLIA_256_GCM_SHA384" href="#http2cipher_TLS_ECDHE_ECDSA_WITH_CAMELLIA_256_GCM_SHA384">const http2cipher_TLS_ECDHE_ECDSA_WITH_CAMELLIA_256_GCM_SHA384</a>

```
searchKey: http.http2cipher_TLS_ECDHE_ECDSA_WITH_CAMELLIA_256_GCM_SHA384
tags: [private]
```

```Go
const http2cipher_TLS_ECDHE_ECDSA_WITH_CAMELLIA_256_GCM_SHA384 uint16 = 0xC087
```

### <a id="http2cipher_TLS_ECDH_ECDSA_WITH_CAMELLIA_128_GCM_SHA256" href="#http2cipher_TLS_ECDH_ECDSA_WITH_CAMELLIA_128_GCM_SHA256">const http2cipher_TLS_ECDH_ECDSA_WITH_CAMELLIA_128_GCM_SHA256</a>

```
searchKey: http.http2cipher_TLS_ECDH_ECDSA_WITH_CAMELLIA_128_GCM_SHA256
tags: [private]
```

```Go
const http2cipher_TLS_ECDH_ECDSA_WITH_CAMELLIA_128_GCM_SHA256 uint16 = 0xC088
```

### <a id="http2cipher_TLS_ECDH_ECDSA_WITH_CAMELLIA_256_GCM_SHA384" href="#http2cipher_TLS_ECDH_ECDSA_WITH_CAMELLIA_256_GCM_SHA384">const http2cipher_TLS_ECDH_ECDSA_WITH_CAMELLIA_256_GCM_SHA384</a>

```
searchKey: http.http2cipher_TLS_ECDH_ECDSA_WITH_CAMELLIA_256_GCM_SHA384
tags: [private]
```

```Go
const http2cipher_TLS_ECDH_ECDSA_WITH_CAMELLIA_256_GCM_SHA384 uint16 = 0xC089
```

### <a id="http2cipher_TLS_ECDHE_RSA_WITH_CAMELLIA_128_GCM_SHA256" href="#http2cipher_TLS_ECDHE_RSA_WITH_CAMELLIA_128_GCM_SHA256">const http2cipher_TLS_ECDHE_RSA_WITH_CAMELLIA_128_GCM_SHA256</a>

```
searchKey: http.http2cipher_TLS_ECDHE_RSA_WITH_CAMELLIA_128_GCM_SHA256
tags: [private]
```

```Go
const http2cipher_TLS_ECDHE_RSA_WITH_CAMELLIA_128_GCM_SHA256 uint16 = 0xC08A
```

### <a id="http2cipher_TLS_ECDHE_RSA_WITH_CAMELLIA_256_GCM_SHA384" href="#http2cipher_TLS_ECDHE_RSA_WITH_CAMELLIA_256_GCM_SHA384">const http2cipher_TLS_ECDHE_RSA_WITH_CAMELLIA_256_GCM_SHA384</a>

```
searchKey: http.http2cipher_TLS_ECDHE_RSA_WITH_CAMELLIA_256_GCM_SHA384
tags: [private]
```

```Go
const http2cipher_TLS_ECDHE_RSA_WITH_CAMELLIA_256_GCM_SHA384 uint16 = 0xC08B
```

### <a id="http2cipher_TLS_ECDH_RSA_WITH_CAMELLIA_128_GCM_SHA256" href="#http2cipher_TLS_ECDH_RSA_WITH_CAMELLIA_128_GCM_SHA256">const http2cipher_TLS_ECDH_RSA_WITH_CAMELLIA_128_GCM_SHA256</a>

```
searchKey: http.http2cipher_TLS_ECDH_RSA_WITH_CAMELLIA_128_GCM_SHA256
tags: [private]
```

```Go
const http2cipher_TLS_ECDH_RSA_WITH_CAMELLIA_128_GCM_SHA256 uint16 = 0xC08C
```

### <a id="http2cipher_TLS_ECDH_RSA_WITH_CAMELLIA_256_GCM_SHA384" href="#http2cipher_TLS_ECDH_RSA_WITH_CAMELLIA_256_GCM_SHA384">const http2cipher_TLS_ECDH_RSA_WITH_CAMELLIA_256_GCM_SHA384</a>

```
searchKey: http.http2cipher_TLS_ECDH_RSA_WITH_CAMELLIA_256_GCM_SHA384
tags: [private]
```

```Go
const http2cipher_TLS_ECDH_RSA_WITH_CAMELLIA_256_GCM_SHA384 uint16 = 0xC08D
```

### <a id="http2cipher_TLS_PSK_WITH_CAMELLIA_128_GCM_SHA256" href="#http2cipher_TLS_PSK_WITH_CAMELLIA_128_GCM_SHA256">const http2cipher_TLS_PSK_WITH_CAMELLIA_128_GCM_SHA256</a>

```
searchKey: http.http2cipher_TLS_PSK_WITH_CAMELLIA_128_GCM_SHA256
tags: [private]
```

```Go
const http2cipher_TLS_PSK_WITH_CAMELLIA_128_GCM_SHA256 uint16 = 0xC08E
```

### <a id="http2cipher_TLS_PSK_WITH_CAMELLIA_256_GCM_SHA384" href="#http2cipher_TLS_PSK_WITH_CAMELLIA_256_GCM_SHA384">const http2cipher_TLS_PSK_WITH_CAMELLIA_256_GCM_SHA384</a>

```
searchKey: http.http2cipher_TLS_PSK_WITH_CAMELLIA_256_GCM_SHA384
tags: [private]
```

```Go
const http2cipher_TLS_PSK_WITH_CAMELLIA_256_GCM_SHA384 uint16 = 0xC08F
```

### <a id="http2cipher_TLS_DHE_PSK_WITH_CAMELLIA_128_GCM_SHA256" href="#http2cipher_TLS_DHE_PSK_WITH_CAMELLIA_128_GCM_SHA256">const http2cipher_TLS_DHE_PSK_WITH_CAMELLIA_128_GCM_SHA256</a>

```
searchKey: http.http2cipher_TLS_DHE_PSK_WITH_CAMELLIA_128_GCM_SHA256
tags: [private]
```

```Go
const http2cipher_TLS_DHE_PSK_WITH_CAMELLIA_128_GCM_SHA256 uint16 = 0xC090
```

### <a id="http2cipher_TLS_DHE_PSK_WITH_CAMELLIA_256_GCM_SHA384" href="#http2cipher_TLS_DHE_PSK_WITH_CAMELLIA_256_GCM_SHA384">const http2cipher_TLS_DHE_PSK_WITH_CAMELLIA_256_GCM_SHA384</a>

```
searchKey: http.http2cipher_TLS_DHE_PSK_WITH_CAMELLIA_256_GCM_SHA384
tags: [private]
```

```Go
const http2cipher_TLS_DHE_PSK_WITH_CAMELLIA_256_GCM_SHA384 uint16 = 0xC091
```

### <a id="http2cipher_TLS_RSA_PSK_WITH_CAMELLIA_128_GCM_SHA256" href="#http2cipher_TLS_RSA_PSK_WITH_CAMELLIA_128_GCM_SHA256">const http2cipher_TLS_RSA_PSK_WITH_CAMELLIA_128_GCM_SHA256</a>

```
searchKey: http.http2cipher_TLS_RSA_PSK_WITH_CAMELLIA_128_GCM_SHA256
tags: [private]
```

```Go
const http2cipher_TLS_RSA_PSK_WITH_CAMELLIA_128_GCM_SHA256 uint16 = 0xC092
```

### <a id="http2cipher_TLS_RSA_PSK_WITH_CAMELLIA_256_GCM_SHA384" href="#http2cipher_TLS_RSA_PSK_WITH_CAMELLIA_256_GCM_SHA384">const http2cipher_TLS_RSA_PSK_WITH_CAMELLIA_256_GCM_SHA384</a>

```
searchKey: http.http2cipher_TLS_RSA_PSK_WITH_CAMELLIA_256_GCM_SHA384
tags: [private]
```

```Go
const http2cipher_TLS_RSA_PSK_WITH_CAMELLIA_256_GCM_SHA384 uint16 = 0xC093
```

### <a id="http2cipher_TLS_PSK_WITH_CAMELLIA_128_CBC_SHA256" href="#http2cipher_TLS_PSK_WITH_CAMELLIA_128_CBC_SHA256">const http2cipher_TLS_PSK_WITH_CAMELLIA_128_CBC_SHA256</a>

```
searchKey: http.http2cipher_TLS_PSK_WITH_CAMELLIA_128_CBC_SHA256
tags: [private]
```

```Go
const http2cipher_TLS_PSK_WITH_CAMELLIA_128_CBC_SHA256 uint16 = 0xC094
```

### <a id="http2cipher_TLS_PSK_WITH_CAMELLIA_256_CBC_SHA384" href="#http2cipher_TLS_PSK_WITH_CAMELLIA_256_CBC_SHA384">const http2cipher_TLS_PSK_WITH_CAMELLIA_256_CBC_SHA384</a>

```
searchKey: http.http2cipher_TLS_PSK_WITH_CAMELLIA_256_CBC_SHA384
tags: [private]
```

```Go
const http2cipher_TLS_PSK_WITH_CAMELLIA_256_CBC_SHA384 uint16 = 0xC095
```

### <a id="http2cipher_TLS_DHE_PSK_WITH_CAMELLIA_128_CBC_SHA256" href="#http2cipher_TLS_DHE_PSK_WITH_CAMELLIA_128_CBC_SHA256">const http2cipher_TLS_DHE_PSK_WITH_CAMELLIA_128_CBC_SHA256</a>

```
searchKey: http.http2cipher_TLS_DHE_PSK_WITH_CAMELLIA_128_CBC_SHA256
tags: [private]
```

```Go
const http2cipher_TLS_DHE_PSK_WITH_CAMELLIA_128_CBC_SHA256 uint16 = 0xC096
```

### <a id="http2cipher_TLS_DHE_PSK_WITH_CAMELLIA_256_CBC_SHA384" href="#http2cipher_TLS_DHE_PSK_WITH_CAMELLIA_256_CBC_SHA384">const http2cipher_TLS_DHE_PSK_WITH_CAMELLIA_256_CBC_SHA384</a>

```
searchKey: http.http2cipher_TLS_DHE_PSK_WITH_CAMELLIA_256_CBC_SHA384
tags: [private]
```

```Go
const http2cipher_TLS_DHE_PSK_WITH_CAMELLIA_256_CBC_SHA384 uint16 = 0xC097
```

### <a id="http2cipher_TLS_RSA_PSK_WITH_CAMELLIA_128_CBC_SHA256" href="#http2cipher_TLS_RSA_PSK_WITH_CAMELLIA_128_CBC_SHA256">const http2cipher_TLS_RSA_PSK_WITH_CAMELLIA_128_CBC_SHA256</a>

```
searchKey: http.http2cipher_TLS_RSA_PSK_WITH_CAMELLIA_128_CBC_SHA256
tags: [private]
```

```Go
const http2cipher_TLS_RSA_PSK_WITH_CAMELLIA_128_CBC_SHA256 uint16 = 0xC098
```

### <a id="http2cipher_TLS_RSA_PSK_WITH_CAMELLIA_256_CBC_SHA384" href="#http2cipher_TLS_RSA_PSK_WITH_CAMELLIA_256_CBC_SHA384">const http2cipher_TLS_RSA_PSK_WITH_CAMELLIA_256_CBC_SHA384</a>

```
searchKey: http.http2cipher_TLS_RSA_PSK_WITH_CAMELLIA_256_CBC_SHA384
tags: [private]
```

```Go
const http2cipher_TLS_RSA_PSK_WITH_CAMELLIA_256_CBC_SHA384 uint16 = 0xC099
```

### <a id="http2cipher_TLS_ECDHE_PSK_WITH_CAMELLIA_128_CBC_SHA256" href="#http2cipher_TLS_ECDHE_PSK_WITH_CAMELLIA_128_CBC_SHA256">const http2cipher_TLS_ECDHE_PSK_WITH_CAMELLIA_128_CBC_SHA256</a>

```
searchKey: http.http2cipher_TLS_ECDHE_PSK_WITH_CAMELLIA_128_CBC_SHA256
tags: [private]
```

```Go
const http2cipher_TLS_ECDHE_PSK_WITH_CAMELLIA_128_CBC_SHA256 uint16 = 0xC09A
```

### <a id="http2cipher_TLS_ECDHE_PSK_WITH_CAMELLIA_256_CBC_SHA384" href="#http2cipher_TLS_ECDHE_PSK_WITH_CAMELLIA_256_CBC_SHA384">const http2cipher_TLS_ECDHE_PSK_WITH_CAMELLIA_256_CBC_SHA384</a>

```
searchKey: http.http2cipher_TLS_ECDHE_PSK_WITH_CAMELLIA_256_CBC_SHA384
tags: [private]
```

```Go
const http2cipher_TLS_ECDHE_PSK_WITH_CAMELLIA_256_CBC_SHA384 uint16 = 0xC09B
```

### <a id="http2cipher_TLS_RSA_WITH_AES_128_CCM" href="#http2cipher_TLS_RSA_WITH_AES_128_CCM">const http2cipher_TLS_RSA_WITH_AES_128_CCM</a>

```
searchKey: http.http2cipher_TLS_RSA_WITH_AES_128_CCM
tags: [private]
```

```Go
const http2cipher_TLS_RSA_WITH_AES_128_CCM uint16 = 0xC09C
```

### <a id="http2cipher_TLS_RSA_WITH_AES_256_CCM" href="#http2cipher_TLS_RSA_WITH_AES_256_CCM">const http2cipher_TLS_RSA_WITH_AES_256_CCM</a>

```
searchKey: http.http2cipher_TLS_RSA_WITH_AES_256_CCM
tags: [private]
```

```Go
const http2cipher_TLS_RSA_WITH_AES_256_CCM uint16 = 0xC09D
```

### <a id="http2cipher_TLS_DHE_RSA_WITH_AES_128_CCM" href="#http2cipher_TLS_DHE_RSA_WITH_AES_128_CCM">const http2cipher_TLS_DHE_RSA_WITH_AES_128_CCM</a>

```
searchKey: http.http2cipher_TLS_DHE_RSA_WITH_AES_128_CCM
tags: [private]
```

```Go
const http2cipher_TLS_DHE_RSA_WITH_AES_128_CCM uint16 = 0xC09E
```

### <a id="http2cipher_TLS_DHE_RSA_WITH_AES_256_CCM" href="#http2cipher_TLS_DHE_RSA_WITH_AES_256_CCM">const http2cipher_TLS_DHE_RSA_WITH_AES_256_CCM</a>

```
searchKey: http.http2cipher_TLS_DHE_RSA_WITH_AES_256_CCM
tags: [private]
```

```Go
const http2cipher_TLS_DHE_RSA_WITH_AES_256_CCM uint16 = 0xC09F
```

### <a id="http2cipher_TLS_RSA_WITH_AES_128_CCM_8" href="#http2cipher_TLS_RSA_WITH_AES_128_CCM_8">const http2cipher_TLS_RSA_WITH_AES_128_CCM_8</a>

```
searchKey: http.http2cipher_TLS_RSA_WITH_AES_128_CCM_8
tags: [private]
```

```Go
const http2cipher_TLS_RSA_WITH_AES_128_CCM_8 uint16 = 0xC0A0
```

### <a id="http2cipher_TLS_RSA_WITH_AES_256_CCM_8" href="#http2cipher_TLS_RSA_WITH_AES_256_CCM_8">const http2cipher_TLS_RSA_WITH_AES_256_CCM_8</a>

```
searchKey: http.http2cipher_TLS_RSA_WITH_AES_256_CCM_8
tags: [private]
```

```Go
const http2cipher_TLS_RSA_WITH_AES_256_CCM_8 uint16 = 0xC0A1
```

### <a id="http2cipher_TLS_DHE_RSA_WITH_AES_128_CCM_8" href="#http2cipher_TLS_DHE_RSA_WITH_AES_128_CCM_8">const http2cipher_TLS_DHE_RSA_WITH_AES_128_CCM_8</a>

```
searchKey: http.http2cipher_TLS_DHE_RSA_WITH_AES_128_CCM_8
tags: [private]
```

```Go
const http2cipher_TLS_DHE_RSA_WITH_AES_128_CCM_8 uint16 = 0xC0A2
```

### <a id="http2cipher_TLS_DHE_RSA_WITH_AES_256_CCM_8" href="#http2cipher_TLS_DHE_RSA_WITH_AES_256_CCM_8">const http2cipher_TLS_DHE_RSA_WITH_AES_256_CCM_8</a>

```
searchKey: http.http2cipher_TLS_DHE_RSA_WITH_AES_256_CCM_8
tags: [private]
```

```Go
const http2cipher_TLS_DHE_RSA_WITH_AES_256_CCM_8 uint16 = 0xC0A3
```

### <a id="http2cipher_TLS_PSK_WITH_AES_128_CCM" href="#http2cipher_TLS_PSK_WITH_AES_128_CCM">const http2cipher_TLS_PSK_WITH_AES_128_CCM</a>

```
searchKey: http.http2cipher_TLS_PSK_WITH_AES_128_CCM
tags: [private]
```

```Go
const http2cipher_TLS_PSK_WITH_AES_128_CCM uint16 = 0xC0A4
```

### <a id="http2cipher_TLS_PSK_WITH_AES_256_CCM" href="#http2cipher_TLS_PSK_WITH_AES_256_CCM">const http2cipher_TLS_PSK_WITH_AES_256_CCM</a>

```
searchKey: http.http2cipher_TLS_PSK_WITH_AES_256_CCM
tags: [private]
```

```Go
const http2cipher_TLS_PSK_WITH_AES_256_CCM uint16 = 0xC0A5
```

### <a id="http2cipher_TLS_DHE_PSK_WITH_AES_128_CCM" href="#http2cipher_TLS_DHE_PSK_WITH_AES_128_CCM">const http2cipher_TLS_DHE_PSK_WITH_AES_128_CCM</a>

```
searchKey: http.http2cipher_TLS_DHE_PSK_WITH_AES_128_CCM
tags: [private]
```

```Go
const http2cipher_TLS_DHE_PSK_WITH_AES_128_CCM uint16 = 0xC0A6
```

### <a id="http2cipher_TLS_DHE_PSK_WITH_AES_256_CCM" href="#http2cipher_TLS_DHE_PSK_WITH_AES_256_CCM">const http2cipher_TLS_DHE_PSK_WITH_AES_256_CCM</a>

```
searchKey: http.http2cipher_TLS_DHE_PSK_WITH_AES_256_CCM
tags: [private]
```

```Go
const http2cipher_TLS_DHE_PSK_WITH_AES_256_CCM uint16 = 0xC0A7
```

### <a id="http2cipher_TLS_PSK_WITH_AES_128_CCM_8" href="#http2cipher_TLS_PSK_WITH_AES_128_CCM_8">const http2cipher_TLS_PSK_WITH_AES_128_CCM_8</a>

```
searchKey: http.http2cipher_TLS_PSK_WITH_AES_128_CCM_8
tags: [private]
```

```Go
const http2cipher_TLS_PSK_WITH_AES_128_CCM_8 uint16 = 0xC0A8
```

### <a id="http2cipher_TLS_PSK_WITH_AES_256_CCM_8" href="#http2cipher_TLS_PSK_WITH_AES_256_CCM_8">const http2cipher_TLS_PSK_WITH_AES_256_CCM_8</a>

```
searchKey: http.http2cipher_TLS_PSK_WITH_AES_256_CCM_8
tags: [private]
```

```Go
const http2cipher_TLS_PSK_WITH_AES_256_CCM_8 uint16 = 0xC0A9
```

### <a id="http2cipher_TLS_PSK_DHE_WITH_AES_128_CCM_8" href="#http2cipher_TLS_PSK_DHE_WITH_AES_128_CCM_8">const http2cipher_TLS_PSK_DHE_WITH_AES_128_CCM_8</a>

```
searchKey: http.http2cipher_TLS_PSK_DHE_WITH_AES_128_CCM_8
tags: [private]
```

```Go
const http2cipher_TLS_PSK_DHE_WITH_AES_128_CCM_8 uint16 = 0xC0AA
```

### <a id="http2cipher_TLS_PSK_DHE_WITH_AES_256_CCM_8" href="#http2cipher_TLS_PSK_DHE_WITH_AES_256_CCM_8">const http2cipher_TLS_PSK_DHE_WITH_AES_256_CCM_8</a>

```
searchKey: http.http2cipher_TLS_PSK_DHE_WITH_AES_256_CCM_8
tags: [private]
```

```Go
const http2cipher_TLS_PSK_DHE_WITH_AES_256_CCM_8 uint16 = 0xC0AB
```

### <a id="http2cipher_TLS_ECDHE_ECDSA_WITH_AES_128_CCM" href="#http2cipher_TLS_ECDHE_ECDSA_WITH_AES_128_CCM">const http2cipher_TLS_ECDHE_ECDSA_WITH_AES_128_CCM</a>

```
searchKey: http.http2cipher_TLS_ECDHE_ECDSA_WITH_AES_128_CCM
tags: [private]
```

```Go
const http2cipher_TLS_ECDHE_ECDSA_WITH_AES_128_CCM uint16 = 0xC0AC
```

### <a id="http2cipher_TLS_ECDHE_ECDSA_WITH_AES_256_CCM" href="#http2cipher_TLS_ECDHE_ECDSA_WITH_AES_256_CCM">const http2cipher_TLS_ECDHE_ECDSA_WITH_AES_256_CCM</a>

```
searchKey: http.http2cipher_TLS_ECDHE_ECDSA_WITH_AES_256_CCM
tags: [private]
```

```Go
const http2cipher_TLS_ECDHE_ECDSA_WITH_AES_256_CCM uint16 = 0xC0AD
```

### <a id="http2cipher_TLS_ECDHE_ECDSA_WITH_AES_128_CCM_8" href="#http2cipher_TLS_ECDHE_ECDSA_WITH_AES_128_CCM_8">const http2cipher_TLS_ECDHE_ECDSA_WITH_AES_128_CCM_8</a>

```
searchKey: http.http2cipher_TLS_ECDHE_ECDSA_WITH_AES_128_CCM_8
tags: [private]
```

```Go
const http2cipher_TLS_ECDHE_ECDSA_WITH_AES_128_CCM_8 uint16 = 0xC0AE
```

### <a id="http2cipher_TLS_ECDHE_ECDSA_WITH_AES_256_CCM_8" href="#http2cipher_TLS_ECDHE_ECDSA_WITH_AES_256_CCM_8">const http2cipher_TLS_ECDHE_ECDSA_WITH_AES_256_CCM_8</a>

```
searchKey: http.http2cipher_TLS_ECDHE_ECDSA_WITH_AES_256_CCM_8
tags: [private]
```

```Go
const http2cipher_TLS_ECDHE_ECDSA_WITH_AES_256_CCM_8 uint16 = 0xC0AF
```

### <a id="http2cipher_TLS_ECDHE_RSA_WITH_CHACHA20_POLY1305_SHA256" href="#http2cipher_TLS_ECDHE_RSA_WITH_CHACHA20_POLY1305_SHA256">const http2cipher_TLS_ECDHE_RSA_WITH_CHACHA20_POLY1305_SHA256</a>

```
searchKey: http.http2cipher_TLS_ECDHE_RSA_WITH_CHACHA20_POLY1305_SHA256
tags: [private]
```

```Go
const http2cipher_TLS_ECDHE_RSA_WITH_CHACHA20_POLY1305_SHA256 uint16 = 0xCCA8
```

Unassigned uint16 =  0xC0B0-FF Unassigned uint16 =  0xC1-CB,* Unassigned uint16 =  0xCC00-A7 

### <a id="http2cipher_TLS_ECDHE_ECDSA_WITH_CHACHA20_POLY1305_SHA256" href="#http2cipher_TLS_ECDHE_ECDSA_WITH_CHACHA20_POLY1305_SHA256">const http2cipher_TLS_ECDHE_ECDSA_WITH_CHACHA20_POLY1305_SHA256</a>

```
searchKey: http.http2cipher_TLS_ECDHE_ECDSA_WITH_CHACHA20_POLY1305_SHA256
tags: [private]
```

```Go
const http2cipher_TLS_ECDHE_ECDSA_WITH_CHACHA20_POLY1305_SHA256 uint16 = 0xCCA9
```

### <a id="http2cipher_TLS_DHE_RSA_WITH_CHACHA20_POLY1305_SHA256" href="#http2cipher_TLS_DHE_RSA_WITH_CHACHA20_POLY1305_SHA256">const http2cipher_TLS_DHE_RSA_WITH_CHACHA20_POLY1305_SHA256</a>

```
searchKey: http.http2cipher_TLS_DHE_RSA_WITH_CHACHA20_POLY1305_SHA256
tags: [private]
```

```Go
const http2cipher_TLS_DHE_RSA_WITH_CHACHA20_POLY1305_SHA256 uint16 = 0xCCAA
```

### <a id="http2cipher_TLS_PSK_WITH_CHACHA20_POLY1305_SHA256" href="#http2cipher_TLS_PSK_WITH_CHACHA20_POLY1305_SHA256">const http2cipher_TLS_PSK_WITH_CHACHA20_POLY1305_SHA256</a>

```
searchKey: http.http2cipher_TLS_PSK_WITH_CHACHA20_POLY1305_SHA256
tags: [private]
```

```Go
const http2cipher_TLS_PSK_WITH_CHACHA20_POLY1305_SHA256 uint16 = 0xCCAB
```

### <a id="http2cipher_TLS_ECDHE_PSK_WITH_CHACHA20_POLY1305_SHA256" href="#http2cipher_TLS_ECDHE_PSK_WITH_CHACHA20_POLY1305_SHA256">const http2cipher_TLS_ECDHE_PSK_WITH_CHACHA20_POLY1305_SHA256</a>

```
searchKey: http.http2cipher_TLS_ECDHE_PSK_WITH_CHACHA20_POLY1305_SHA256
tags: [private]
```

```Go
const http2cipher_TLS_ECDHE_PSK_WITH_CHACHA20_POLY1305_SHA256 uint16 = 0xCCAC
```

### <a id="http2cipher_TLS_DHE_PSK_WITH_CHACHA20_POLY1305_SHA256" href="#http2cipher_TLS_DHE_PSK_WITH_CHACHA20_POLY1305_SHA256">const http2cipher_TLS_DHE_PSK_WITH_CHACHA20_POLY1305_SHA256</a>

```
searchKey: http.http2cipher_TLS_DHE_PSK_WITH_CHACHA20_POLY1305_SHA256
tags: [private]
```

```Go
const http2cipher_TLS_DHE_PSK_WITH_CHACHA20_POLY1305_SHA256 uint16 = 0xCCAD
```

### <a id="http2cipher_TLS_RSA_PSK_WITH_CHACHA20_POLY1305_SHA256" href="#http2cipher_TLS_RSA_PSK_WITH_CHACHA20_POLY1305_SHA256">const http2cipher_TLS_RSA_PSK_WITH_CHACHA20_POLY1305_SHA256</a>

```
searchKey: http.http2cipher_TLS_RSA_PSK_WITH_CHACHA20_POLY1305_SHA256
tags: [private]
```

```Go
const http2cipher_TLS_RSA_PSK_WITH_CHACHA20_POLY1305_SHA256 uint16 = 0xCCAE
```

### <a id="http2dialOnMiss" href="#http2dialOnMiss">const http2dialOnMiss</a>

```
searchKey: http.http2dialOnMiss
tags: [private]
```

```Go
const http2dialOnMiss = true
```

### <a id="http2noDialOnMiss" href="#http2noDialOnMiss">const http2noDialOnMiss</a>

```
searchKey: http.http2noDialOnMiss
tags: [private]
```

```Go
const http2noDialOnMiss = false
```

### <a id="http2ErrCodeNo" href="#http2ErrCodeNo">const http2ErrCodeNo</a>

```
searchKey: http.http2ErrCodeNo
tags: [private]
```

```Go
const http2ErrCodeNo http2ErrCode = 0x0
```

### <a id="http2ErrCodeProtocol" href="#http2ErrCodeProtocol">const http2ErrCodeProtocol</a>

```
searchKey: http.http2ErrCodeProtocol
tags: [private]
```

```Go
const http2ErrCodeProtocol http2ErrCode = 0x1
```

### <a id="http2ErrCodeInternal" href="#http2ErrCodeInternal">const http2ErrCodeInternal</a>

```
searchKey: http.http2ErrCodeInternal
tags: [private]
```

```Go
const http2ErrCodeInternal http2ErrCode = 0x2
```

### <a id="http2ErrCodeFlowControl" href="#http2ErrCodeFlowControl">const http2ErrCodeFlowControl</a>

```
searchKey: http.http2ErrCodeFlowControl
tags: [private]
```

```Go
const http2ErrCodeFlowControl http2ErrCode = 0x3
```

### <a id="http2ErrCodeSettingsTimeout" href="#http2ErrCodeSettingsTimeout">const http2ErrCodeSettingsTimeout</a>

```
searchKey: http.http2ErrCodeSettingsTimeout
tags: [private]
```

```Go
const http2ErrCodeSettingsTimeout http2ErrCode = 0x4
```

### <a id="http2ErrCodeStreamClosed" href="#http2ErrCodeStreamClosed">const http2ErrCodeStreamClosed</a>

```
searchKey: http.http2ErrCodeStreamClosed
tags: [private]
```

```Go
const http2ErrCodeStreamClosed http2ErrCode = 0x5
```

### <a id="http2ErrCodeFrameSize" href="#http2ErrCodeFrameSize">const http2ErrCodeFrameSize</a>

```
searchKey: http.http2ErrCodeFrameSize
tags: [private]
```

```Go
const http2ErrCodeFrameSize http2ErrCode = 0x6
```

### <a id="http2ErrCodeRefusedStream" href="#http2ErrCodeRefusedStream">const http2ErrCodeRefusedStream</a>

```
searchKey: http.http2ErrCodeRefusedStream
tags: [private]
```

```Go
const http2ErrCodeRefusedStream http2ErrCode = 0x7
```

### <a id="http2ErrCodeCancel" href="#http2ErrCodeCancel">const http2ErrCodeCancel</a>

```
searchKey: http.http2ErrCodeCancel
tags: [private]
```

```Go
const http2ErrCodeCancel http2ErrCode = 0x8
```

### <a id="http2ErrCodeCompression" href="#http2ErrCodeCompression">const http2ErrCodeCompression</a>

```
searchKey: http.http2ErrCodeCompression
tags: [private]
```

```Go
const http2ErrCodeCompression http2ErrCode = 0x9
```

### <a id="http2ErrCodeConnect" href="#http2ErrCodeConnect">const http2ErrCodeConnect</a>

```
searchKey: http.http2ErrCodeConnect
tags: [private]
```

```Go
const http2ErrCodeConnect http2ErrCode = 0xa
```

### <a id="http2ErrCodeEnhanceYourCalm" href="#http2ErrCodeEnhanceYourCalm">const http2ErrCodeEnhanceYourCalm</a>

```
searchKey: http.http2ErrCodeEnhanceYourCalm
tags: [private]
```

```Go
const http2ErrCodeEnhanceYourCalm http2ErrCode = 0xb
```

### <a id="http2ErrCodeInadequateSecurity" href="#http2ErrCodeInadequateSecurity">const http2ErrCodeInadequateSecurity</a>

```
searchKey: http.http2ErrCodeInadequateSecurity
tags: [private]
```

```Go
const http2ErrCodeInadequateSecurity http2ErrCode = 0xc
```

### <a id="http2ErrCodeHTTP11Required" href="#http2ErrCodeHTTP11Required">const http2ErrCodeHTTP11Required</a>

```
searchKey: http.http2ErrCodeHTTP11Required
tags: [private]
```

```Go
const http2ErrCodeHTTP11Required http2ErrCode = 0xd
```

### <a id="http2frameHeaderLen" href="#http2frameHeaderLen">const http2frameHeaderLen</a>

```
searchKey: http.http2frameHeaderLen
tags: [private]
```

```Go
const http2frameHeaderLen = 9
```

### <a id="http2FrameData" href="#http2FrameData">const http2FrameData</a>

```
searchKey: http.http2FrameData
tags: [private]
```

```Go
const http2FrameData http2FrameType = 0x0
```

### <a id="http2FrameHeaders" href="#http2FrameHeaders">const http2FrameHeaders</a>

```
searchKey: http.http2FrameHeaders
tags: [private]
```

```Go
const http2FrameHeaders http2FrameType = 0x1
```

### <a id="http2FramePriority" href="#http2FramePriority">const http2FramePriority</a>

```
searchKey: http.http2FramePriority
tags: [private]
```

```Go
const http2FramePriority http2FrameType = 0x2
```

### <a id="http2FrameRSTStream" href="#http2FrameRSTStream">const http2FrameRSTStream</a>

```
searchKey: http.http2FrameRSTStream
tags: [private]
```

```Go
const http2FrameRSTStream http2FrameType = 0x3
```

### <a id="http2FrameSettings" href="#http2FrameSettings">const http2FrameSettings</a>

```
searchKey: http.http2FrameSettings
tags: [private]
```

```Go
const http2FrameSettings http2FrameType = 0x4
```

### <a id="http2FramePushPromise" href="#http2FramePushPromise">const http2FramePushPromise</a>

```
searchKey: http.http2FramePushPromise
tags: [private]
```

```Go
const http2FramePushPromise http2FrameType = 0x5
```

### <a id="http2FramePing" href="#http2FramePing">const http2FramePing</a>

```
searchKey: http.http2FramePing
tags: [private]
```

```Go
const http2FramePing http2FrameType = 0x6
```

### <a id="http2FrameGoAway" href="#http2FrameGoAway">const http2FrameGoAway</a>

```
searchKey: http.http2FrameGoAway
tags: [private]
```

```Go
const http2FrameGoAway http2FrameType = 0x7
```

### <a id="http2FrameWindowUpdate" href="#http2FrameWindowUpdate">const http2FrameWindowUpdate</a>

```
searchKey: http.http2FrameWindowUpdate
tags: [private]
```

```Go
const http2FrameWindowUpdate http2FrameType = 0x8
```

### <a id="http2FrameContinuation" href="#http2FrameContinuation">const http2FrameContinuation</a>

```
searchKey: http.http2FrameContinuation
tags: [private]
```

```Go
const http2FrameContinuation http2FrameType = 0x9
```

### <a id="http2FlagDataEndStream" href="#http2FlagDataEndStream">const http2FlagDataEndStream</a>

```
searchKey: http.http2FlagDataEndStream
tags: [private]
```

```Go
const http2FlagDataEndStream http2Flags = 0x1
```

Frame-specific FrameHeader flag bits. 

Data Frame 

### <a id="http2FlagDataPadded" href="#http2FlagDataPadded">const http2FlagDataPadded</a>

```
searchKey: http.http2FlagDataPadded
tags: [private]
```

```Go
const http2FlagDataPadded http2Flags = 0x8
```

Frame-specific FrameHeader flag bits. 

### <a id="http2FlagHeadersEndStream" href="#http2FlagHeadersEndStream">const http2FlagHeadersEndStream</a>

```
searchKey: http.http2FlagHeadersEndStream
tags: [private]
```

```Go
const http2FlagHeadersEndStream http2Flags = 0x1
```

Frame-specific FrameHeader flag bits. 

Headers Frame 

### <a id="http2FlagHeadersEndHeaders" href="#http2FlagHeadersEndHeaders">const http2FlagHeadersEndHeaders</a>

```
searchKey: http.http2FlagHeadersEndHeaders
tags: [private]
```

```Go
const http2FlagHeadersEndHeaders http2Flags = 0x4
```

Frame-specific FrameHeader flag bits. 

### <a id="http2FlagHeadersPadded" href="#http2FlagHeadersPadded">const http2FlagHeadersPadded</a>

```
searchKey: http.http2FlagHeadersPadded
tags: [private]
```

```Go
const http2FlagHeadersPadded http2Flags = 0x8
```

Frame-specific FrameHeader flag bits. 

### <a id="http2FlagHeadersPriority" href="#http2FlagHeadersPriority">const http2FlagHeadersPriority</a>

```
searchKey: http.http2FlagHeadersPriority
tags: [private]
```

```Go
const http2FlagHeadersPriority http2Flags = 0x20
```

Frame-specific FrameHeader flag bits. 

### <a id="http2FlagSettingsAck" href="#http2FlagSettingsAck">const http2FlagSettingsAck</a>

```
searchKey: http.http2FlagSettingsAck
tags: [private]
```

```Go
const http2FlagSettingsAck http2Flags = 0x1
```

Frame-specific FrameHeader flag bits. 

Settings Frame 

### <a id="http2FlagPingAck" href="#http2FlagPingAck">const http2FlagPingAck</a>

```
searchKey: http.http2FlagPingAck
tags: [private]
```

```Go
const http2FlagPingAck http2Flags = 0x1
```

Frame-specific FrameHeader flag bits. 

Ping Frame 

### <a id="http2FlagContinuationEndHeaders" href="#http2FlagContinuationEndHeaders">const http2FlagContinuationEndHeaders</a>

```
searchKey: http.http2FlagContinuationEndHeaders
tags: [private]
```

```Go
const http2FlagContinuationEndHeaders http2Flags = 0x4
```

Frame-specific FrameHeader flag bits. 

Continuation Frame 

### <a id="http2FlagPushPromiseEndHeaders" href="#http2FlagPushPromiseEndHeaders">const http2FlagPushPromiseEndHeaders</a>

```
searchKey: http.http2FlagPushPromiseEndHeaders
tags: [private]
```

```Go
const http2FlagPushPromiseEndHeaders http2Flags = 0x4
```

Frame-specific FrameHeader flag bits. 

### <a id="http2FlagPushPromisePadded" href="#http2FlagPushPromisePadded">const http2FlagPushPromisePadded</a>

```
searchKey: http.http2FlagPushPromisePadded
tags: [private]
```

```Go
const http2FlagPushPromisePadded http2Flags = 0x8
```

Frame-specific FrameHeader flag bits. 

### <a id="http2minMaxFrameSize" href="#http2minMaxFrameSize">const http2minMaxFrameSize</a>

```
searchKey: http.http2minMaxFrameSize
tags: [private]
```

```Go
const http2minMaxFrameSize = 1 << 14
```

### <a id="http2maxFrameSize" href="#http2maxFrameSize">const http2maxFrameSize</a>

```
searchKey: http.http2maxFrameSize
tags: [private]
```

```Go
const http2maxFrameSize = 1<<24 - 1
```

### <a id="http2ClientPreface" href="#http2ClientPreface">const http2ClientPreface</a>

```
searchKey: http.http2ClientPreface
tags: [private]
```

```Go
const http2ClientPreface = "PRI * HTTP/2.0\r\n\r\nSM\r\n\r\n"
```

ClientPreface is the string that must be sent by new connections from clients. 

### <a id="http2initialMaxFrameSize" href="#http2initialMaxFrameSize">const http2initialMaxFrameSize</a>

```
searchKey: http.http2initialMaxFrameSize
tags: [private]
```

```Go
const http2initialMaxFrameSize = 16384
```

SETTINGS_MAX_FRAME_SIZE default [http://http2.github.io/http2-spec/#rfc.section.6.5.2](http://http2.github.io/http2-spec/#rfc.section.6.5.2) 

### <a id="http2NextProtoTLS" href="#http2NextProtoTLS">const http2NextProtoTLS</a>

```
searchKey: http.http2NextProtoTLS
tags: [private]
```

```Go
const http2NextProtoTLS = "h2"
```

NextProtoTLS is the NPN/ALPN protocol negotiated during HTTP/2's TLS setup. 

### <a id="http2initialHeaderTableSize" href="#http2initialHeaderTableSize">const http2initialHeaderTableSize</a>

```
searchKey: http.http2initialHeaderTableSize
tags: [private]
```

```Go
const http2initialHeaderTableSize = 4096
```

[http://http2.github.io/http2-spec/#SettingValues](http://http2.github.io/http2-spec/#SettingValues) 

### <a id="http2initialWindowSize" href="#http2initialWindowSize">const http2initialWindowSize</a>

```
searchKey: http.http2initialWindowSize
tags: [private]
```

```Go
const http2initialWindowSize = 65535 // 6.9.2 Initial Flow Control Window Size

```

### <a id="http2defaultMaxReadFrameSize" href="#http2defaultMaxReadFrameSize">const http2defaultMaxReadFrameSize</a>

```
searchKey: http.http2defaultMaxReadFrameSize
tags: [private]
```

```Go
const http2defaultMaxReadFrameSize = 1 << 20
```

### <a id="http2stateIdle" href="#http2stateIdle">const http2stateIdle</a>

```
searchKey: http.http2stateIdle
tags: [private]
```

```Go
const http2stateIdle http2streamState = iota
```

HTTP/2 stream states. 

See [http://tools.ietf.org/html/rfc7540#section-5.1](http://tools.ietf.org/html/rfc7540#section-5.1). 

For simplicity, the server code merges "reserved (local)" into "half-closed (remote)". This is one less state transition to track. The only downside is that we send PUSH_PROMISEs slightly less liberally than allowable. More discussion here: [https://lists.w3.org/Archives/Public/ietf-http-wg/2016JulSep/0599.html](https://lists.w3.org/Archives/Public/ietf-http-wg/2016JulSep/0599.html) 

"reserved (remote)" is omitted since the client code does not support server push. 

### <a id="http2stateOpen" href="#http2stateOpen">const http2stateOpen</a>

```
searchKey: http.http2stateOpen
tags: [private]
```

```Go
const http2stateOpen
```

HTTP/2 stream states. 

See [http://tools.ietf.org/html/rfc7540#section-5.1](http://tools.ietf.org/html/rfc7540#section-5.1). 

For simplicity, the server code merges "reserved (local)" into "half-closed (remote)". This is one less state transition to track. The only downside is that we send PUSH_PROMISEs slightly less liberally than allowable. More discussion here: [https://lists.w3.org/Archives/Public/ietf-http-wg/2016JulSep/0599.html](https://lists.w3.org/Archives/Public/ietf-http-wg/2016JulSep/0599.html) 

"reserved (remote)" is omitted since the client code does not support server push. 

### <a id="http2stateHalfClosedLocal" href="#http2stateHalfClosedLocal">const http2stateHalfClosedLocal</a>

```
searchKey: http.http2stateHalfClosedLocal
tags: [private]
```

```Go
const http2stateHalfClosedLocal
```

HTTP/2 stream states. 

See [http://tools.ietf.org/html/rfc7540#section-5.1](http://tools.ietf.org/html/rfc7540#section-5.1). 

For simplicity, the server code merges "reserved (local)" into "half-closed (remote)". This is one less state transition to track. The only downside is that we send PUSH_PROMISEs slightly less liberally than allowable. More discussion here: [https://lists.w3.org/Archives/Public/ietf-http-wg/2016JulSep/0599.html](https://lists.w3.org/Archives/Public/ietf-http-wg/2016JulSep/0599.html) 

"reserved (remote)" is omitted since the client code does not support server push. 

### <a id="http2stateHalfClosedRemote" href="#http2stateHalfClosedRemote">const http2stateHalfClosedRemote</a>

```
searchKey: http.http2stateHalfClosedRemote
tags: [private]
```

```Go
const http2stateHalfClosedRemote
```

HTTP/2 stream states. 

See [http://tools.ietf.org/html/rfc7540#section-5.1](http://tools.ietf.org/html/rfc7540#section-5.1). 

For simplicity, the server code merges "reserved (local)" into "half-closed (remote)". This is one less state transition to track. The only downside is that we send PUSH_PROMISEs slightly less liberally than allowable. More discussion here: [https://lists.w3.org/Archives/Public/ietf-http-wg/2016JulSep/0599.html](https://lists.w3.org/Archives/Public/ietf-http-wg/2016JulSep/0599.html) 

"reserved (remote)" is omitted since the client code does not support server push. 

### <a id="http2stateClosed" href="#http2stateClosed">const http2stateClosed</a>

```
searchKey: http.http2stateClosed
tags: [private]
```

```Go
const http2stateClosed
```

HTTP/2 stream states. 

See [http://tools.ietf.org/html/rfc7540#section-5.1](http://tools.ietf.org/html/rfc7540#section-5.1). 

For simplicity, the server code merges "reserved (local)" into "half-closed (remote)". This is one less state transition to track. The only downside is that we send PUSH_PROMISEs slightly less liberally than allowable. More discussion here: [https://lists.w3.org/Archives/Public/ietf-http-wg/2016JulSep/0599.html](https://lists.w3.org/Archives/Public/ietf-http-wg/2016JulSep/0599.html) 

"reserved (remote)" is omitted since the client code does not support server push. 

### <a id="http2SettingHeaderTableSize" href="#http2SettingHeaderTableSize">const http2SettingHeaderTableSize</a>

```
searchKey: http.http2SettingHeaderTableSize
tags: [private]
```

```Go
const http2SettingHeaderTableSize http2SettingID = 0x1
```

### <a id="http2SettingEnablePush" href="#http2SettingEnablePush">const http2SettingEnablePush</a>

```
searchKey: http.http2SettingEnablePush
tags: [private]
```

```Go
const http2SettingEnablePush http2SettingID = 0x2
```

### <a id="http2SettingMaxConcurrentStreams" href="#http2SettingMaxConcurrentStreams">const http2SettingMaxConcurrentStreams</a>

```
searchKey: http.http2SettingMaxConcurrentStreams
tags: [private]
```

```Go
const http2SettingMaxConcurrentStreams http2SettingID = 0x3
```

### <a id="http2SettingInitialWindowSize" href="#http2SettingInitialWindowSize">const http2SettingInitialWindowSize</a>

```
searchKey: http.http2SettingInitialWindowSize
tags: [private]
```

```Go
const http2SettingInitialWindowSize http2SettingID = 0x4
```

### <a id="http2SettingMaxFrameSize" href="#http2SettingMaxFrameSize">const http2SettingMaxFrameSize</a>

```
searchKey: http.http2SettingMaxFrameSize
tags: [private]
```

```Go
const http2SettingMaxFrameSize http2SettingID = 0x5
```

### <a id="http2SettingMaxHeaderListSize" href="#http2SettingMaxHeaderListSize">const http2SettingMaxHeaderListSize</a>

```
searchKey: http.http2SettingMaxHeaderListSize
tags: [private]
```

```Go
const http2SettingMaxHeaderListSize http2SettingID = 0x6
```

### <a id="http2bufWriterPoolBufferSize" href="#http2bufWriterPoolBufferSize">const http2bufWriterPoolBufferSize</a>

```
searchKey: http.http2bufWriterPoolBufferSize
tags: [private]
```

```Go
const http2bufWriterPoolBufferSize = 4 << 10
```

bufWriterPoolBufferSize is the size of bufio.Writer's buffers created using bufWriterPool. 

TODO: pick a less arbitrary value? this is a bit under (3 x typical 1500 byte MTU) at least. Other than that, not much thought went into it. 

### <a id="http2prefaceTimeout" href="#http2prefaceTimeout">const http2prefaceTimeout</a>

```
searchKey: http.http2prefaceTimeout
tags: [private]
```

```Go
const http2prefaceTimeout = 10 * time.Second
```

### <a id="http2firstSettingsTimeout" href="#http2firstSettingsTimeout">const http2firstSettingsTimeout</a>

```
searchKey: http.http2firstSettingsTimeout
tags: [private]
```

```Go
const http2firstSettingsTimeout = 2 * time.Second // should be in-flight with preface anyway

```

### <a id="http2handlerChunkWriteSize" href="#http2handlerChunkWriteSize">const http2handlerChunkWriteSize</a>

```
searchKey: http.http2handlerChunkWriteSize
tags: [private]
```

```Go
const http2handlerChunkWriteSize = 4 << 10
```

### <a id="http2defaultMaxStreams" href="#http2defaultMaxStreams">const http2defaultMaxStreams</a>

```
searchKey: http.http2defaultMaxStreams
tags: [private]
```

```Go
const http2defaultMaxStreams = 250 // TODO: make this 100 as the GFE seems to?

```

### <a id="http2maxQueuedControlFrames" href="#http2maxQueuedControlFrames">const http2maxQueuedControlFrames</a>

```
searchKey: http.http2maxQueuedControlFrames
tags: [private]
```

```Go
const http2maxQueuedControlFrames = 10000
```

### <a id="http2TrailerPrefix" href="#http2TrailerPrefix">const http2TrailerPrefix</a>

```
searchKey: http.http2TrailerPrefix
tags: [private]
```

```Go
const http2TrailerPrefix = "Trailer:"
```

TrailerPrefix is a magic prefix for ResponseWriter.Header map keys that, if present, signals that the map entry is actually for the response trailers, and not the response headers. The prefix is stripped after the ServeHTTP call finishes and the values are sent in the trailers. 

This mechanism is intended only for trailers that are not known prior to the headers being written. If the set of trailers is fixed or known before the header is written, the normal Go trailers mechanism is preferred: 

```
[https://golang.org/pkg/net/http/#ResponseWriter](https://golang.org/pkg/net/http/#ResponseWriter)
[https://golang.org/pkg/net/http/#example_ResponseWriter_trailers](https://golang.org/pkg/net/http/#example_ResponseWriter_trailers)

```
### <a id="http2transportDefaultConnFlow" href="#http2transportDefaultConnFlow">const http2transportDefaultConnFlow</a>

```
searchKey: http.http2transportDefaultConnFlow
tags: [private]
```

```Go
const http2transportDefaultConnFlow = 1 << 30
```

transportDefaultConnFlow is how many connection-level flow control tokens we give the server at start-up, past the default 64k. 

### <a id="http2transportDefaultStreamFlow" href="#http2transportDefaultStreamFlow">const http2transportDefaultStreamFlow</a>

```
searchKey: http.http2transportDefaultStreamFlow
tags: [private]
```

```Go
const http2transportDefaultStreamFlow = 4 << 20
```

transportDefaultStreamFlow is how many stream-level flow control tokens we announce to the peer, and how many bytes we buffer per stream. 

### <a id="http2transportDefaultStreamMinRefresh" href="#http2transportDefaultStreamMinRefresh">const http2transportDefaultStreamMinRefresh</a>

```
searchKey: http.http2transportDefaultStreamMinRefresh
tags: [private]
```

```Go
const http2transportDefaultStreamMinRefresh = 4 << 10
```

transportDefaultStreamMinRefresh is the minimum number of bytes we'll send a stream-level WINDOW_UPDATE for at a time. 

### <a id="http2defaultUserAgent" href="#http2defaultUserAgent">const http2defaultUserAgent</a>

```
searchKey: http.http2defaultUserAgent
tags: [private]
```

```Go
const http2defaultUserAgent = "Go-http-client/2.0"
```

### <a id="http2maxAllocFrameSize" href="#http2maxAllocFrameSize">const http2maxAllocFrameSize</a>

```
searchKey: http.http2maxAllocFrameSize
tags: [private]
```

```Go
const http2maxAllocFrameSize = 512 << 10
```

### <a id="http2priorityDefaultWeight" href="#http2priorityDefaultWeight">const http2priorityDefaultWeight</a>

```
searchKey: http.http2priorityDefaultWeight
tags: [private]
```

```Go
const http2priorityDefaultWeight = 15 // 16 = 15 + 1

```

RFC 7540, Section 5.3.5: the default weight is 16. 

### <a id="http2priorityNodeOpen" href="#http2priorityNodeOpen">const http2priorityNodeOpen</a>

```
searchKey: http.http2priorityNodeOpen
tags: [private]
```

```Go
const http2priorityNodeOpen http2priorityNodeState = iota
```

### <a id="http2priorityNodeClosed" href="#http2priorityNodeClosed">const http2priorityNodeClosed</a>

```
searchKey: http.http2priorityNodeClosed
tags: [private]
```

```Go
const http2priorityNodeClosed
```

### <a id="http2priorityNodeIdle" href="#http2priorityNodeIdle">const http2priorityNodeIdle</a>

```
searchKey: http.http2priorityNodeIdle
tags: [private]
```

```Go
const http2priorityNodeIdle
```

### <a id="maxInt64" href="#maxInt64">const maxInt64</a>

```
searchKey: http.maxInt64
tags: [private]
```

```Go
const maxInt64 = 1<<63 - 1
```

maxInt64 is the effective "infinite" value for the Server and Transport's byte-limiting readers. 

### <a id="MethodGet" href="#MethodGet">const MethodGet</a>

```
searchKey: http.MethodGet
```

```Go
const MethodGet = "GET"
```

Common HTTP methods. 

Unless otherwise noted, these are defined in RFC 7231 section 4.3. 

### <a id="MethodHead" href="#MethodHead">const MethodHead</a>

```
searchKey: http.MethodHead
```

```Go
const MethodHead = "HEAD"
```

Common HTTP methods. 

Unless otherwise noted, these are defined in RFC 7231 section 4.3. 

### <a id="MethodPost" href="#MethodPost">const MethodPost</a>

```
searchKey: http.MethodPost
```

```Go
const MethodPost = "POST"
```

Common HTTP methods. 

Unless otherwise noted, these are defined in RFC 7231 section 4.3. 

### <a id="MethodPut" href="#MethodPut">const MethodPut</a>

```
searchKey: http.MethodPut
```

```Go
const MethodPut = "PUT"
```

Common HTTP methods. 

Unless otherwise noted, these are defined in RFC 7231 section 4.3. 

### <a id="MethodPatch" href="#MethodPatch">const MethodPatch</a>

```
searchKey: http.MethodPatch
```

```Go
const MethodPatch = "PATCH" // RFC 5789

```

Common HTTP methods. 

Unless otherwise noted, these are defined in RFC 7231 section 4.3. 

### <a id="MethodDelete" href="#MethodDelete">const MethodDelete</a>

```
searchKey: http.MethodDelete
```

```Go
const MethodDelete = "DELETE"
```

Common HTTP methods. 

Unless otherwise noted, these are defined in RFC 7231 section 4.3. 

### <a id="MethodConnect" href="#MethodConnect">const MethodConnect</a>

```
searchKey: http.MethodConnect
```

```Go
const MethodConnect = "CONNECT"
```

Common HTTP methods. 

Unless otherwise noted, these are defined in RFC 7231 section 4.3. 

### <a id="MethodOptions" href="#MethodOptions">const MethodOptions</a>

```
searchKey: http.MethodOptions
```

```Go
const MethodOptions = "OPTIONS"
```

Common HTTP methods. 

Unless otherwise noted, these are defined in RFC 7231 section 4.3. 

### <a id="MethodTrace" href="#MethodTrace">const MethodTrace</a>

```
searchKey: http.MethodTrace
```

```Go
const MethodTrace = "TRACE"
```

Common HTTP methods. 

Unless otherwise noted, these are defined in RFC 7231 section 4.3. 

### <a id="defaultMaxMemory" href="#defaultMaxMemory">const defaultMaxMemory</a>

```
searchKey: http.defaultMaxMemory
tags: [private]
```

```Go
const defaultMaxMemory = 32 << 20 // 32 MB

```

### <a id="defaultUserAgent" href="#defaultUserAgent">const defaultUserAgent</a>

```
searchKey: http.defaultUserAgent
tags: [private]
```

```Go
const defaultUserAgent = "Go-http-client/1.1"
```

NOTE: This is not intended to reflect the actual Go version being used. It was changed at the time of Go 1.1 release because the former User-Agent had ended up blocked by some intrusion detection systems. See [https://codereview.appspot.com/7532043](https://codereview.appspot.com/7532043). 

### <a id="bufferBeforeChunkingSize" href="#bufferBeforeChunkingSize">const bufferBeforeChunkingSize</a>

```
searchKey: http.bufferBeforeChunkingSize
tags: [private]
```

```Go
const bufferBeforeChunkingSize = 2048
```

This should be >= 512 bytes for DetectContentType, but otherwise it's somewhat arbitrary. 

### <a id="TrailerPrefix" href="#TrailerPrefix">const TrailerPrefix</a>

```
searchKey: http.TrailerPrefix
```

```Go
const TrailerPrefix = "Trailer:"
```

TrailerPrefix is a magic prefix for ResponseWriter.Header map keys that, if present, signals that the map entry is actually for the response trailers, and not the response headers. The prefix is stripped after the ServeHTTP call finishes and the values are sent in the trailers. 

This mechanism is intended only for trailers that are not known prior to the headers being written. If the set of trailers is fixed or known before the header is written, the normal Go trailers mechanism is preferred: 

```
[https://golang.org/pkg/net/http/#ResponseWriter](https://golang.org/pkg/net/http/#ResponseWriter)
[https://golang.org/pkg/net/http/#example_ResponseWriter_trailers](https://golang.org/pkg/net/http/#example_ResponseWriter_trailers)

```
### <a id="debugServerConnections" href="#debugServerConnections">const debugServerConnections</a>

```
searchKey: http.debugServerConnections
tags: [private]
```

```Go
const debugServerConnections = false
```

debugServerConnections controls whether all server connections are wrapped with a verbose logging wrapper. 

### <a id="DefaultMaxHeaderBytes" href="#DefaultMaxHeaderBytes">const DefaultMaxHeaderBytes</a>

```
searchKey: http.DefaultMaxHeaderBytes
```

```Go
const DefaultMaxHeaderBytes = 1 << 20 // 1 MB

```

DefaultMaxHeaderBytes is the maximum permitted size of the headers in an HTTP request. This can be overridden by setting Server.MaxHeaderBytes. 

### <a id="TimeFormat" href="#TimeFormat">const TimeFormat</a>

```
searchKey: http.TimeFormat
```

```Go
const TimeFormat = "Mon, 02 Jan 2006 15:04:05 GMT"
```

TimeFormat is the time format to use when generating times in HTTP headers. It is like time.RFC1123 but hard-codes GMT as the time zone. The time being formatted must be in UTC for Format to generate the correct format. 

For parsing this time format, see ParseTime. 

### <a id="maxPostHandlerReadBytes" href="#maxPostHandlerReadBytes">const maxPostHandlerReadBytes</a>

```
searchKey: http.maxPostHandlerReadBytes
tags: [private]
```

```Go
const maxPostHandlerReadBytes = 256 << 10
```

maxPostHandlerReadBytes is the max number of Request.Body bytes not consumed by a handler that the server will read from the client in order to keep a connection alive. If there are more bytes than this then the server to be paranoid instead sends a "Connection: close" response. 

This number is approximately what a typical machine's TCP buffer size is anyway.  (if we have the bytes on the machine, we might as well read them) 

### <a id="rstAvoidanceDelay" href="#rstAvoidanceDelay">const rstAvoidanceDelay</a>

```
searchKey: http.rstAvoidanceDelay
tags: [private]
```

```Go
const rstAvoidanceDelay = 500 * time.Millisecond
```

rstAvoidanceDelay is the amount of time we sleep after closing the write side of a TCP connection before closing the entire socket. By sleeping, we increase the chances that the client sees our FIN and processes its final data before they process the subsequent RST from closing a connection with known unread data. This RST seems to occur mostly on BSD systems. (And Windows?) This timeout is somewhat arbitrary (~latency around the planet). 

### <a id="runHooks" href="#runHooks">const runHooks</a>

```
searchKey: http.runHooks
tags: [private]
```

```Go
const runHooks = true
```

### <a id="skipHooks" href="#skipHooks">const skipHooks</a>

```
searchKey: http.skipHooks
tags: [private]
```

```Go
const skipHooks = false
```

### <a id="shutdownPollIntervalMax" href="#shutdownPollIntervalMax">const shutdownPollIntervalMax</a>

```
searchKey: http.shutdownPollIntervalMax
tags: [private]
```

```Go
const shutdownPollIntervalMax = 500 * time.Millisecond
```

shutdownPollIntervalMax is the max polling interval when checking quiescence during Server.Shutdown. Polling starts with a small interval and backs off to the max. Ideally we could find a solution that doesn't involve polling, but which also doesn't have a high runtime cost (and doesn't involve any contentious mutexes), but that is left as an exercise for the reader. 

### <a id="StateNew" href="#StateNew">const StateNew</a>

```
searchKey: http.StateNew
```

```Go
const StateNew ConnState = iota
```

StateNew represents a new connection that is expected to send a request immediately. Connections begin at this state and then transition to either StateActive or StateClosed. 

### <a id="StateActive" href="#StateActive">const StateActive</a>

```
searchKey: http.StateActive
```

```Go
const StateActive
```

StateActive represents a connection that has read 1 or more bytes of a request. The Server.ConnState hook for StateActive fires before the request has entered a handler and doesn't fire again until the request has been handled. After the request is handled, the state transitions to StateClosed, StateHijacked, or StateIdle. For HTTP/2, StateActive fires on the transition from zero to one active request, and only transitions away once all active requests are complete. That means that ConnState cannot be used to do per-request work; ConnState only notes the overall state of the connection. 

### <a id="StateIdle" href="#StateIdle">const StateIdle</a>

```
searchKey: http.StateIdle
```

```Go
const StateIdle
```

StateIdle represents a connection that has finished handling a request and is in the keep-alive state, waiting for a new request. Connections transition from StateIdle to either StateActive or StateClosed. 

### <a id="StateHijacked" href="#StateHijacked">const StateHijacked</a>

```
searchKey: http.StateHijacked
```

```Go
const StateHijacked
```

StateHijacked represents a hijacked connection. This is a terminal state. It does not transition to StateClosed. 

### <a id="StateClosed" href="#StateClosed">const StateClosed</a>

```
searchKey: http.StateClosed
```

```Go
const StateClosed
```

StateClosed represents a closed connection. This is a terminal state. Hijacked connections do not transition to StateClosed. 

### <a id="sniffLen" href="#sniffLen">const sniffLen</a>

```
searchKey: http.sniffLen
tags: [private]
```

```Go
const sniffLen = 512
```

The algorithm uses at most sniffLen bytes to make its decision. 

### <a id="socksVersion5" href="#socksVersion5">const socksVersion5</a>

```
searchKey: http.socksVersion5
tags: [private]
```

```Go
const socksVersion5 = 0x05
```

Wire protocol constants. 

### <a id="socksAddrTypeIPv4" href="#socksAddrTypeIPv4">const socksAddrTypeIPv4</a>

```
searchKey: http.socksAddrTypeIPv4
tags: [private]
```

```Go
const socksAddrTypeIPv4 = 0x01
```

Wire protocol constants. 

### <a id="socksAddrTypeFQDN" href="#socksAddrTypeFQDN">const socksAddrTypeFQDN</a>

```
searchKey: http.socksAddrTypeFQDN
tags: [private]
```

```Go
const socksAddrTypeFQDN = 0x03
```

Wire protocol constants. 

### <a id="socksAddrTypeIPv6" href="#socksAddrTypeIPv6">const socksAddrTypeIPv6</a>

```
searchKey: http.socksAddrTypeIPv6
tags: [private]
```

```Go
const socksAddrTypeIPv6 = 0x04
```

Wire protocol constants. 

### <a id="socksCmdConnect" href="#socksCmdConnect">const socksCmdConnect</a>

```
searchKey: http.socksCmdConnect
tags: [private]
```

```Go
const socksCmdConnect socksCommand = 0x01 // establishes an active-open forward proxy connection

```

Wire protocol constants. 

### <a id="sockscmdBind" href="#sockscmdBind">const sockscmdBind</a>

```
searchKey: http.sockscmdBind
tags: [private]
```

```Go
const sockscmdBind socksCommand = 0x02 // establishes a passive-open forward proxy connection

```

Wire protocol constants. 

### <a id="socksAuthMethodNotRequired" href="#socksAuthMethodNotRequired">const socksAuthMethodNotRequired</a>

```
searchKey: http.socksAuthMethodNotRequired
tags: [private]
```

```Go
const socksAuthMethodNotRequired socksAuthMethod = 0x00 // no authentication required

```

Wire protocol constants. 

### <a id="socksAuthMethodUsernamePassword" href="#socksAuthMethodUsernamePassword">const socksAuthMethodUsernamePassword</a>

```
searchKey: http.socksAuthMethodUsernamePassword
tags: [private]
```

```Go
const socksAuthMethodUsernamePassword socksAuthMethod = 0x02 // use username/password

```

Wire protocol constants. 

### <a id="socksAuthMethodNoAcceptableMethods" href="#socksAuthMethodNoAcceptableMethods">const socksAuthMethodNoAcceptableMethods</a>

```
searchKey: http.socksAuthMethodNoAcceptableMethods
tags: [private]
```

```Go
const socksAuthMethodNoAcceptableMethods socksAuthMethod // no acceptable authentication methods
 = ...
```

Wire protocol constants. 

### <a id="socksStatusSucceeded" href="#socksStatusSucceeded">const socksStatusSucceeded</a>

```
searchKey: http.socksStatusSucceeded
tags: [private]
```

```Go
const socksStatusSucceeded socksReply = 0x00
```

Wire protocol constants. 

### <a id="socksauthUsernamePasswordVersion" href="#socksauthUsernamePasswordVersion">const socksauthUsernamePasswordVersion</a>

```
searchKey: http.socksauthUsernamePasswordVersion
tags: [private]
```

```Go
const socksauthUsernamePasswordVersion = 0x01
```

### <a id="socksauthStatusSucceeded" href="#socksauthStatusSucceeded">const socksauthStatusSucceeded</a>

```
searchKey: http.socksauthStatusSucceeded
tags: [private]
```

```Go
const socksauthStatusSucceeded = 0x00
```

### <a id="StatusContinue" href="#StatusContinue">const StatusContinue</a>

```
searchKey: http.StatusContinue
```

```Go
const StatusContinue = 100 // RFC 7231, 6.2.1

```

HTTP status codes as registered with IANA. See: [https://www.iana.org/assignments/http-status-codes/http-status-codes.xhtml](https://www.iana.org/assignments/http-status-codes/http-status-codes.xhtml) 

### <a id="StatusSwitchingProtocols" href="#StatusSwitchingProtocols">const StatusSwitchingProtocols</a>

```
searchKey: http.StatusSwitchingProtocols
```

```Go
const StatusSwitchingProtocols = 101 // RFC 7231, 6.2.2

```

HTTP status codes as registered with IANA. See: [https://www.iana.org/assignments/http-status-codes/http-status-codes.xhtml](https://www.iana.org/assignments/http-status-codes/http-status-codes.xhtml) 

### <a id="StatusProcessing" href="#StatusProcessing">const StatusProcessing</a>

```
searchKey: http.StatusProcessing
```

```Go
const StatusProcessing = 102 // RFC 2518, 10.1

```

HTTP status codes as registered with IANA. See: [https://www.iana.org/assignments/http-status-codes/http-status-codes.xhtml](https://www.iana.org/assignments/http-status-codes/http-status-codes.xhtml) 

### <a id="StatusEarlyHints" href="#StatusEarlyHints">const StatusEarlyHints</a>

```
searchKey: http.StatusEarlyHints
```

```Go
const StatusEarlyHints = 103 // RFC 8297

```

HTTP status codes as registered with IANA. See: [https://www.iana.org/assignments/http-status-codes/http-status-codes.xhtml](https://www.iana.org/assignments/http-status-codes/http-status-codes.xhtml) 

### <a id="StatusOK" href="#StatusOK">const StatusOK</a>

```
searchKey: http.StatusOK
```

```Go
const StatusOK = 200 // RFC 7231, 6.3.1

```

HTTP status codes as registered with IANA. See: [https://www.iana.org/assignments/http-status-codes/http-status-codes.xhtml](https://www.iana.org/assignments/http-status-codes/http-status-codes.xhtml) 

### <a id="StatusCreated" href="#StatusCreated">const StatusCreated</a>

```
searchKey: http.StatusCreated
```

```Go
const StatusCreated = 201 // RFC 7231, 6.3.2

```

HTTP status codes as registered with IANA. See: [https://www.iana.org/assignments/http-status-codes/http-status-codes.xhtml](https://www.iana.org/assignments/http-status-codes/http-status-codes.xhtml) 

### <a id="StatusAccepted" href="#StatusAccepted">const StatusAccepted</a>

```
searchKey: http.StatusAccepted
```

```Go
const StatusAccepted = 202 // RFC 7231, 6.3.3

```

HTTP status codes as registered with IANA. See: [https://www.iana.org/assignments/http-status-codes/http-status-codes.xhtml](https://www.iana.org/assignments/http-status-codes/http-status-codes.xhtml) 

### <a id="StatusNonAuthoritativeInfo" href="#StatusNonAuthoritativeInfo">const StatusNonAuthoritativeInfo</a>

```
searchKey: http.StatusNonAuthoritativeInfo
```

```Go
const StatusNonAuthoritativeInfo = 203 // RFC 7231, 6.3.4

```

HTTP status codes as registered with IANA. See: [https://www.iana.org/assignments/http-status-codes/http-status-codes.xhtml](https://www.iana.org/assignments/http-status-codes/http-status-codes.xhtml) 

### <a id="StatusNoContent" href="#StatusNoContent">const StatusNoContent</a>

```
searchKey: http.StatusNoContent
```

```Go
const StatusNoContent = 204 // RFC 7231, 6.3.5

```

HTTP status codes as registered with IANA. See: [https://www.iana.org/assignments/http-status-codes/http-status-codes.xhtml](https://www.iana.org/assignments/http-status-codes/http-status-codes.xhtml) 

### <a id="StatusResetContent" href="#StatusResetContent">const StatusResetContent</a>

```
searchKey: http.StatusResetContent
```

```Go
const StatusResetContent = 205 // RFC 7231, 6.3.6

```

HTTP status codes as registered with IANA. See: [https://www.iana.org/assignments/http-status-codes/http-status-codes.xhtml](https://www.iana.org/assignments/http-status-codes/http-status-codes.xhtml) 

### <a id="StatusPartialContent" href="#StatusPartialContent">const StatusPartialContent</a>

```
searchKey: http.StatusPartialContent
```

```Go
const StatusPartialContent = 206 // RFC 7233, 4.1

```

HTTP status codes as registered with IANA. See: [https://www.iana.org/assignments/http-status-codes/http-status-codes.xhtml](https://www.iana.org/assignments/http-status-codes/http-status-codes.xhtml) 

### <a id="StatusMultiStatus" href="#StatusMultiStatus">const StatusMultiStatus</a>

```
searchKey: http.StatusMultiStatus
```

```Go
const StatusMultiStatus = 207 // RFC 4918, 11.1

```

HTTP status codes as registered with IANA. See: [https://www.iana.org/assignments/http-status-codes/http-status-codes.xhtml](https://www.iana.org/assignments/http-status-codes/http-status-codes.xhtml) 

### <a id="StatusAlreadyReported" href="#StatusAlreadyReported">const StatusAlreadyReported</a>

```
searchKey: http.StatusAlreadyReported
```

```Go
const StatusAlreadyReported = 208 // RFC 5842, 7.1

```

HTTP status codes as registered with IANA. See: [https://www.iana.org/assignments/http-status-codes/http-status-codes.xhtml](https://www.iana.org/assignments/http-status-codes/http-status-codes.xhtml) 

### <a id="StatusIMUsed" href="#StatusIMUsed">const StatusIMUsed</a>

```
searchKey: http.StatusIMUsed
```

```Go
const StatusIMUsed = 226 // RFC 3229, 10.4.1

```

HTTP status codes as registered with IANA. See: [https://www.iana.org/assignments/http-status-codes/http-status-codes.xhtml](https://www.iana.org/assignments/http-status-codes/http-status-codes.xhtml) 

### <a id="StatusMultipleChoices" href="#StatusMultipleChoices">const StatusMultipleChoices</a>

```
searchKey: http.StatusMultipleChoices
```

```Go
const StatusMultipleChoices = 300 // RFC 7231, 6.4.1

```

HTTP status codes as registered with IANA. See: [https://www.iana.org/assignments/http-status-codes/http-status-codes.xhtml](https://www.iana.org/assignments/http-status-codes/http-status-codes.xhtml) 

### <a id="StatusMovedPermanently" href="#StatusMovedPermanently">const StatusMovedPermanently</a>

```
searchKey: http.StatusMovedPermanently
```

```Go
const StatusMovedPermanently = 301 // RFC 7231, 6.4.2

```

HTTP status codes as registered with IANA. See: [https://www.iana.org/assignments/http-status-codes/http-status-codes.xhtml](https://www.iana.org/assignments/http-status-codes/http-status-codes.xhtml) 

### <a id="StatusFound" href="#StatusFound">const StatusFound</a>

```
searchKey: http.StatusFound
```

```Go
const StatusFound = 302 // RFC 7231, 6.4.3

```

HTTP status codes as registered with IANA. See: [https://www.iana.org/assignments/http-status-codes/http-status-codes.xhtml](https://www.iana.org/assignments/http-status-codes/http-status-codes.xhtml) 

### <a id="StatusSeeOther" href="#StatusSeeOther">const StatusSeeOther</a>

```
searchKey: http.StatusSeeOther
```

```Go
const StatusSeeOther = 303 // RFC 7231, 6.4.4

```

HTTP status codes as registered with IANA. See: [https://www.iana.org/assignments/http-status-codes/http-status-codes.xhtml](https://www.iana.org/assignments/http-status-codes/http-status-codes.xhtml) 

### <a id="StatusNotModified" href="#StatusNotModified">const StatusNotModified</a>

```
searchKey: http.StatusNotModified
```

```Go
const StatusNotModified = 304 // RFC 7232, 4.1

```

HTTP status codes as registered with IANA. See: [https://www.iana.org/assignments/http-status-codes/http-status-codes.xhtml](https://www.iana.org/assignments/http-status-codes/http-status-codes.xhtml) 

### <a id="StatusUseProxy" href="#StatusUseProxy">const StatusUseProxy</a>

```
searchKey: http.StatusUseProxy
```

```Go
const StatusUseProxy = 305 // RFC 7231, 6.4.5

```

HTTP status codes as registered with IANA. See: [https://www.iana.org/assignments/http-status-codes/http-status-codes.xhtml](https://www.iana.org/assignments/http-status-codes/http-status-codes.xhtml) 

### <a id="StatusTemporaryRedirect" href="#StatusTemporaryRedirect">const StatusTemporaryRedirect</a>

```
searchKey: http.StatusTemporaryRedirect
```

```Go
const StatusTemporaryRedirect = 307 // RFC 7231, 6.4.7

```

HTTP status codes as registered with IANA. See: [https://www.iana.org/assignments/http-status-codes/http-status-codes.xhtml](https://www.iana.org/assignments/http-status-codes/http-status-codes.xhtml) 

### <a id="StatusPermanentRedirect" href="#StatusPermanentRedirect">const StatusPermanentRedirect</a>

```
searchKey: http.StatusPermanentRedirect
```

```Go
const StatusPermanentRedirect = 308 // RFC 7538, 3

```

HTTP status codes as registered with IANA. See: [https://www.iana.org/assignments/http-status-codes/http-status-codes.xhtml](https://www.iana.org/assignments/http-status-codes/http-status-codes.xhtml) 

### <a id="StatusBadRequest" href="#StatusBadRequest">const StatusBadRequest</a>

```
searchKey: http.StatusBadRequest
```

```Go
const StatusBadRequest = 400 // RFC 7231, 6.5.1

```

HTTP status codes as registered with IANA. See: [https://www.iana.org/assignments/http-status-codes/http-status-codes.xhtml](https://www.iana.org/assignments/http-status-codes/http-status-codes.xhtml) 

### <a id="StatusUnauthorized" href="#StatusUnauthorized">const StatusUnauthorized</a>

```
searchKey: http.StatusUnauthorized
```

```Go
const StatusUnauthorized = 401 // RFC 7235, 3.1

```

HTTP status codes as registered with IANA. See: [https://www.iana.org/assignments/http-status-codes/http-status-codes.xhtml](https://www.iana.org/assignments/http-status-codes/http-status-codes.xhtml) 

### <a id="StatusPaymentRequired" href="#StatusPaymentRequired">const StatusPaymentRequired</a>

```
searchKey: http.StatusPaymentRequired
```

```Go
const StatusPaymentRequired = 402 // RFC 7231, 6.5.2

```

HTTP status codes as registered with IANA. See: [https://www.iana.org/assignments/http-status-codes/http-status-codes.xhtml](https://www.iana.org/assignments/http-status-codes/http-status-codes.xhtml) 

### <a id="StatusForbidden" href="#StatusForbidden">const StatusForbidden</a>

```
searchKey: http.StatusForbidden
```

```Go
const StatusForbidden = 403 // RFC 7231, 6.5.3

```

HTTP status codes as registered with IANA. See: [https://www.iana.org/assignments/http-status-codes/http-status-codes.xhtml](https://www.iana.org/assignments/http-status-codes/http-status-codes.xhtml) 

### <a id="StatusNotFound" href="#StatusNotFound">const StatusNotFound</a>

```
searchKey: http.StatusNotFound
```

```Go
const StatusNotFound = 404 // RFC 7231, 6.5.4

```

HTTP status codes as registered with IANA. See: [https://www.iana.org/assignments/http-status-codes/http-status-codes.xhtml](https://www.iana.org/assignments/http-status-codes/http-status-codes.xhtml) 

### <a id="StatusMethodNotAllowed" href="#StatusMethodNotAllowed">const StatusMethodNotAllowed</a>

```
searchKey: http.StatusMethodNotAllowed
```

```Go
const StatusMethodNotAllowed = 405 // RFC 7231, 6.5.5

```

HTTP status codes as registered with IANA. See: [https://www.iana.org/assignments/http-status-codes/http-status-codes.xhtml](https://www.iana.org/assignments/http-status-codes/http-status-codes.xhtml) 

### <a id="StatusNotAcceptable" href="#StatusNotAcceptable">const StatusNotAcceptable</a>

```
searchKey: http.StatusNotAcceptable
```

```Go
const StatusNotAcceptable = 406 // RFC 7231, 6.5.6

```

HTTP status codes as registered with IANA. See: [https://www.iana.org/assignments/http-status-codes/http-status-codes.xhtml](https://www.iana.org/assignments/http-status-codes/http-status-codes.xhtml) 

### <a id="StatusProxyAuthRequired" href="#StatusProxyAuthRequired">const StatusProxyAuthRequired</a>

```
searchKey: http.StatusProxyAuthRequired
```

```Go
const StatusProxyAuthRequired = 407 // RFC 7235, 3.2

```

HTTP status codes as registered with IANA. See: [https://www.iana.org/assignments/http-status-codes/http-status-codes.xhtml](https://www.iana.org/assignments/http-status-codes/http-status-codes.xhtml) 

### <a id="StatusRequestTimeout" href="#StatusRequestTimeout">const StatusRequestTimeout</a>

```
searchKey: http.StatusRequestTimeout
```

```Go
const StatusRequestTimeout = 408 // RFC 7231, 6.5.7

```

HTTP status codes as registered with IANA. See: [https://www.iana.org/assignments/http-status-codes/http-status-codes.xhtml](https://www.iana.org/assignments/http-status-codes/http-status-codes.xhtml) 

### <a id="StatusConflict" href="#StatusConflict">const StatusConflict</a>

```
searchKey: http.StatusConflict
```

```Go
const StatusConflict = 409 // RFC 7231, 6.5.8

```

HTTP status codes as registered with IANA. See: [https://www.iana.org/assignments/http-status-codes/http-status-codes.xhtml](https://www.iana.org/assignments/http-status-codes/http-status-codes.xhtml) 

### <a id="StatusGone" href="#StatusGone">const StatusGone</a>

```
searchKey: http.StatusGone
```

```Go
const StatusGone = 410 // RFC 7231, 6.5.9

```

HTTP status codes as registered with IANA. See: [https://www.iana.org/assignments/http-status-codes/http-status-codes.xhtml](https://www.iana.org/assignments/http-status-codes/http-status-codes.xhtml) 

### <a id="StatusLengthRequired" href="#StatusLengthRequired">const StatusLengthRequired</a>

```
searchKey: http.StatusLengthRequired
```

```Go
const StatusLengthRequired = 411 // RFC 7231, 6.5.10

```

HTTP status codes as registered with IANA. See: [https://www.iana.org/assignments/http-status-codes/http-status-codes.xhtml](https://www.iana.org/assignments/http-status-codes/http-status-codes.xhtml) 

### <a id="StatusPreconditionFailed" href="#StatusPreconditionFailed">const StatusPreconditionFailed</a>

```
searchKey: http.StatusPreconditionFailed
```

```Go
const StatusPreconditionFailed = 412 // RFC 7232, 4.2

```

HTTP status codes as registered with IANA. See: [https://www.iana.org/assignments/http-status-codes/http-status-codes.xhtml](https://www.iana.org/assignments/http-status-codes/http-status-codes.xhtml) 

### <a id="StatusRequestEntityTooLarge" href="#StatusRequestEntityTooLarge">const StatusRequestEntityTooLarge</a>

```
searchKey: http.StatusRequestEntityTooLarge
```

```Go
const StatusRequestEntityTooLarge = 413 // RFC 7231, 6.5.11

```

HTTP status codes as registered with IANA. See: [https://www.iana.org/assignments/http-status-codes/http-status-codes.xhtml](https://www.iana.org/assignments/http-status-codes/http-status-codes.xhtml) 

### <a id="StatusRequestURITooLong" href="#StatusRequestURITooLong">const StatusRequestURITooLong</a>

```
searchKey: http.StatusRequestURITooLong
```

```Go
const StatusRequestURITooLong = 414 // RFC 7231, 6.5.12

```

HTTP status codes as registered with IANA. See: [https://www.iana.org/assignments/http-status-codes/http-status-codes.xhtml](https://www.iana.org/assignments/http-status-codes/http-status-codes.xhtml) 

### <a id="StatusUnsupportedMediaType" href="#StatusUnsupportedMediaType">const StatusUnsupportedMediaType</a>

```
searchKey: http.StatusUnsupportedMediaType
```

```Go
const StatusUnsupportedMediaType = 415 // RFC 7231, 6.5.13

```

HTTP status codes as registered with IANA. See: [https://www.iana.org/assignments/http-status-codes/http-status-codes.xhtml](https://www.iana.org/assignments/http-status-codes/http-status-codes.xhtml) 

### <a id="StatusRequestedRangeNotSatisfiable" href="#StatusRequestedRangeNotSatisfiable">const StatusRequestedRangeNotSatisfiable</a>

```
searchKey: http.StatusRequestedRangeNotSatisfiable
```

```Go
const StatusRequestedRangeNotSatisfiable = 416 // RFC 7233, 4.4

```

HTTP status codes as registered with IANA. See: [https://www.iana.org/assignments/http-status-codes/http-status-codes.xhtml](https://www.iana.org/assignments/http-status-codes/http-status-codes.xhtml) 

### <a id="StatusExpectationFailed" href="#StatusExpectationFailed">const StatusExpectationFailed</a>

```
searchKey: http.StatusExpectationFailed
```

```Go
const StatusExpectationFailed = 417 // RFC 7231, 6.5.14

```

HTTP status codes as registered with IANA. See: [https://www.iana.org/assignments/http-status-codes/http-status-codes.xhtml](https://www.iana.org/assignments/http-status-codes/http-status-codes.xhtml) 

### <a id="StatusTeapot" href="#StatusTeapot">const StatusTeapot</a>

```
searchKey: http.StatusTeapot
```

```Go
const StatusTeapot = 418 // RFC 7168, 2.3.3

```

HTTP status codes as registered with IANA. See: [https://www.iana.org/assignments/http-status-codes/http-status-codes.xhtml](https://www.iana.org/assignments/http-status-codes/http-status-codes.xhtml) 

### <a id="StatusMisdirectedRequest" href="#StatusMisdirectedRequest">const StatusMisdirectedRequest</a>

```
searchKey: http.StatusMisdirectedRequest
```

```Go
const StatusMisdirectedRequest = 421 // RFC 7540, 9.1.2

```

HTTP status codes as registered with IANA. See: [https://www.iana.org/assignments/http-status-codes/http-status-codes.xhtml](https://www.iana.org/assignments/http-status-codes/http-status-codes.xhtml) 

### <a id="StatusUnprocessableEntity" href="#StatusUnprocessableEntity">const StatusUnprocessableEntity</a>

```
searchKey: http.StatusUnprocessableEntity
```

```Go
const StatusUnprocessableEntity = 422 // RFC 4918, 11.2

```

HTTP status codes as registered with IANA. See: [https://www.iana.org/assignments/http-status-codes/http-status-codes.xhtml](https://www.iana.org/assignments/http-status-codes/http-status-codes.xhtml) 

### <a id="StatusLocked" href="#StatusLocked">const StatusLocked</a>

```
searchKey: http.StatusLocked
```

```Go
const StatusLocked = 423 // RFC 4918, 11.3

```

HTTP status codes as registered with IANA. See: [https://www.iana.org/assignments/http-status-codes/http-status-codes.xhtml](https://www.iana.org/assignments/http-status-codes/http-status-codes.xhtml) 

### <a id="StatusFailedDependency" href="#StatusFailedDependency">const StatusFailedDependency</a>

```
searchKey: http.StatusFailedDependency
```

```Go
const StatusFailedDependency = 424 // RFC 4918, 11.4

```

HTTP status codes as registered with IANA. See: [https://www.iana.org/assignments/http-status-codes/http-status-codes.xhtml](https://www.iana.org/assignments/http-status-codes/http-status-codes.xhtml) 

### <a id="StatusTooEarly" href="#StatusTooEarly">const StatusTooEarly</a>

```
searchKey: http.StatusTooEarly
```

```Go
const StatusTooEarly = 425 // RFC 8470, 5.2.

```

HTTP status codes as registered with IANA. See: [https://www.iana.org/assignments/http-status-codes/http-status-codes.xhtml](https://www.iana.org/assignments/http-status-codes/http-status-codes.xhtml) 

### <a id="StatusUpgradeRequired" href="#StatusUpgradeRequired">const StatusUpgradeRequired</a>

```
searchKey: http.StatusUpgradeRequired
```

```Go
const StatusUpgradeRequired = 426 // RFC 7231, 6.5.15

```

HTTP status codes as registered with IANA. See: [https://www.iana.org/assignments/http-status-codes/http-status-codes.xhtml](https://www.iana.org/assignments/http-status-codes/http-status-codes.xhtml) 

### <a id="StatusPreconditionRequired" href="#StatusPreconditionRequired">const StatusPreconditionRequired</a>

```
searchKey: http.StatusPreconditionRequired
```

```Go
const StatusPreconditionRequired = 428 // RFC 6585, 3

```

HTTP status codes as registered with IANA. See: [https://www.iana.org/assignments/http-status-codes/http-status-codes.xhtml](https://www.iana.org/assignments/http-status-codes/http-status-codes.xhtml) 

### <a id="StatusTooManyRequests" href="#StatusTooManyRequests">const StatusTooManyRequests</a>

```
searchKey: http.StatusTooManyRequests
```

```Go
const StatusTooManyRequests = 429 // RFC 6585, 4

```

HTTP status codes as registered with IANA. See: [https://www.iana.org/assignments/http-status-codes/http-status-codes.xhtml](https://www.iana.org/assignments/http-status-codes/http-status-codes.xhtml) 

### <a id="StatusRequestHeaderFieldsTooLarge" href="#StatusRequestHeaderFieldsTooLarge">const StatusRequestHeaderFieldsTooLarge</a>

```
searchKey: http.StatusRequestHeaderFieldsTooLarge
```

```Go
const StatusRequestHeaderFieldsTooLarge = 431 // RFC 6585, 5

```

HTTP status codes as registered with IANA. See: [https://www.iana.org/assignments/http-status-codes/http-status-codes.xhtml](https://www.iana.org/assignments/http-status-codes/http-status-codes.xhtml) 

### <a id="StatusUnavailableForLegalReasons" href="#StatusUnavailableForLegalReasons">const StatusUnavailableForLegalReasons</a>

```
searchKey: http.StatusUnavailableForLegalReasons
```

```Go
const StatusUnavailableForLegalReasons = 451 // RFC 7725, 3

```

HTTP status codes as registered with IANA. See: [https://www.iana.org/assignments/http-status-codes/http-status-codes.xhtml](https://www.iana.org/assignments/http-status-codes/http-status-codes.xhtml) 

### <a id="StatusInternalServerError" href="#StatusInternalServerError">const StatusInternalServerError</a>

```
searchKey: http.StatusInternalServerError
```

```Go
const StatusInternalServerError = 500 // RFC 7231, 6.6.1

```

HTTP status codes as registered with IANA. See: [https://www.iana.org/assignments/http-status-codes/http-status-codes.xhtml](https://www.iana.org/assignments/http-status-codes/http-status-codes.xhtml) 

### <a id="StatusNotImplemented" href="#StatusNotImplemented">const StatusNotImplemented</a>

```
searchKey: http.StatusNotImplemented
```

```Go
const StatusNotImplemented = 501 // RFC 7231, 6.6.2

```

HTTP status codes as registered with IANA. See: [https://www.iana.org/assignments/http-status-codes/http-status-codes.xhtml](https://www.iana.org/assignments/http-status-codes/http-status-codes.xhtml) 

### <a id="StatusBadGateway" href="#StatusBadGateway">const StatusBadGateway</a>

```
searchKey: http.StatusBadGateway
```

```Go
const StatusBadGateway = 502 // RFC 7231, 6.6.3

```

HTTP status codes as registered with IANA. See: [https://www.iana.org/assignments/http-status-codes/http-status-codes.xhtml](https://www.iana.org/assignments/http-status-codes/http-status-codes.xhtml) 

### <a id="StatusServiceUnavailable" href="#StatusServiceUnavailable">const StatusServiceUnavailable</a>

```
searchKey: http.StatusServiceUnavailable
```

```Go
const StatusServiceUnavailable = 503 // RFC 7231, 6.6.4

```

HTTP status codes as registered with IANA. See: [https://www.iana.org/assignments/http-status-codes/http-status-codes.xhtml](https://www.iana.org/assignments/http-status-codes/http-status-codes.xhtml) 

### <a id="StatusGatewayTimeout" href="#StatusGatewayTimeout">const StatusGatewayTimeout</a>

```
searchKey: http.StatusGatewayTimeout
```

```Go
const StatusGatewayTimeout = 504 // RFC 7231, 6.6.5

```

HTTP status codes as registered with IANA. See: [https://www.iana.org/assignments/http-status-codes/http-status-codes.xhtml](https://www.iana.org/assignments/http-status-codes/http-status-codes.xhtml) 

### <a id="StatusHTTPVersionNotSupported" href="#StatusHTTPVersionNotSupported">const StatusHTTPVersionNotSupported</a>

```
searchKey: http.StatusHTTPVersionNotSupported
```

```Go
const StatusHTTPVersionNotSupported = 505 // RFC 7231, 6.6.6

```

HTTP status codes as registered with IANA. See: [https://www.iana.org/assignments/http-status-codes/http-status-codes.xhtml](https://www.iana.org/assignments/http-status-codes/http-status-codes.xhtml) 

### <a id="StatusVariantAlsoNegotiates" href="#StatusVariantAlsoNegotiates">const StatusVariantAlsoNegotiates</a>

```
searchKey: http.StatusVariantAlsoNegotiates
```

```Go
const StatusVariantAlsoNegotiates = 506 // RFC 2295, 8.1

```

HTTP status codes as registered with IANA. See: [https://www.iana.org/assignments/http-status-codes/http-status-codes.xhtml](https://www.iana.org/assignments/http-status-codes/http-status-codes.xhtml) 

### <a id="StatusInsufficientStorage" href="#StatusInsufficientStorage">const StatusInsufficientStorage</a>

```
searchKey: http.StatusInsufficientStorage
```

```Go
const StatusInsufficientStorage = 507 // RFC 4918, 11.5

```

HTTP status codes as registered with IANA. See: [https://www.iana.org/assignments/http-status-codes/http-status-codes.xhtml](https://www.iana.org/assignments/http-status-codes/http-status-codes.xhtml) 

### <a id="StatusLoopDetected" href="#StatusLoopDetected">const StatusLoopDetected</a>

```
searchKey: http.StatusLoopDetected
```

```Go
const StatusLoopDetected = 508 // RFC 5842, 7.2

```

HTTP status codes as registered with IANA. See: [https://www.iana.org/assignments/http-status-codes/http-status-codes.xhtml](https://www.iana.org/assignments/http-status-codes/http-status-codes.xhtml) 

### <a id="StatusNotExtended" href="#StatusNotExtended">const StatusNotExtended</a>

```
searchKey: http.StatusNotExtended
```

```Go
const StatusNotExtended = 510 // RFC 2774, 7

```

HTTP status codes as registered with IANA. See: [https://www.iana.org/assignments/http-status-codes/http-status-codes.xhtml](https://www.iana.org/assignments/http-status-codes/http-status-codes.xhtml) 

### <a id="StatusNetworkAuthenticationRequired" href="#StatusNetworkAuthenticationRequired">const StatusNetworkAuthenticationRequired</a>

```
searchKey: http.StatusNetworkAuthenticationRequired
```

```Go
const StatusNetworkAuthenticationRequired = 511 // RFC 6585, 6

```

HTTP status codes as registered with IANA. See: [https://www.iana.org/assignments/http-status-codes/http-status-codes.xhtml](https://www.iana.org/assignments/http-status-codes/http-status-codes.xhtml) 

### <a id="DefaultMaxIdleConnsPerHost" href="#DefaultMaxIdleConnsPerHost">const DefaultMaxIdleConnsPerHost</a>

```
searchKey: http.DefaultMaxIdleConnsPerHost
```

```Go
const DefaultMaxIdleConnsPerHost = 2
```

DefaultMaxIdleConnsPerHost is the default value of Transport's MaxIdleConnsPerHost. 

### <a id="maxWriteWaitBeforeConnReuse" href="#maxWriteWaitBeforeConnReuse">const maxWriteWaitBeforeConnReuse</a>

```
searchKey: http.maxWriteWaitBeforeConnReuse
tags: [private]
```

```Go
const maxWriteWaitBeforeConnReuse = 50 * time.Millisecond
```

maxWriteWaitBeforeConnReuse is how long the a Transport RoundTrip will wait to see the Request's Body.Write result after getting a response from the server. See comments in (*persistConn).wroteRequest. 

### <a id="MaxWriteWaitBeforeConnReuse" href="#MaxWriteWaitBeforeConnReuse">const MaxWriteWaitBeforeConnReuse</a>

```
searchKey: http.MaxWriteWaitBeforeConnReuse
tags: [private]
```

```Go
const MaxWriteWaitBeforeConnReuse = maxWriteWaitBeforeConnReuse
```

## <a id="var" href="#var">Variables</a>

### <a id="DefaultClient" href="#DefaultClient">var DefaultClient</a>

```
searchKey: http.DefaultClient
```

```Go
var DefaultClient = &Client{}
```

DefaultClient is the default Client and is used by Get, Head, and Post. 

### <a id="ErrUseLastResponse" href="#ErrUseLastResponse">var ErrUseLastResponse</a>

```
searchKey: http.ErrUseLastResponse
```

```Go
var ErrUseLastResponse = errors.New("net/http: use last response")
```

ErrUseLastResponse can be returned by Client.CheckRedirect hooks to control how redirects are processed. If returned, the next request is not sent and the most recent response is returned with its body unclosed. 

### <a id="testHookClientDoResult" href="#testHookClientDoResult">var testHookClientDoResult</a>

```
searchKey: http.testHookClientDoResult
tags: [private]
```

```Go
var testHookClientDoResult func(retres *Response, reterr error)
```

### <a id="cookieNameSanitizer" href="#cookieNameSanitizer">var cookieNameSanitizer</a>

```
searchKey: http.cookieNameSanitizer
tags: [private]
```

```Go
var cookieNameSanitizer = strings.NewReplacer("\n", "-", "\r", "-")
```

### <a id="errSeeker" href="#errSeeker">var errSeeker</a>

```
searchKey: http.errSeeker
tags: [private]
```

```Go
var errSeeker = errors.New("seeker can't seek")
```

errSeeker is returned by ServeContent's sizeFunc when the content doesn't seek properly. The underlying Seeker's error text isn't included in the sizeFunc reply so it's not sent over HTTP to end users. 

### <a id="errNoOverlap" href="#errNoOverlap">var errNoOverlap</a>

```
searchKey: http.errNoOverlap
tags: [private]
```

```Go
var errNoOverlap = errors.New("invalid range: failed to overlap")
```

errNoOverlap is returned by serveContent's parseRange if first-byte-pos of all of the byte-range-spec values is greater than the content size. 

### <a id="unixEpochTime" href="#unixEpochTime">var unixEpochTime</a>

```
searchKey: http.unixEpochTime
tags: [private]
```

```Go
var unixEpochTime = time.Unix(0, 0)
```

### <a id="errMissingSeek" href="#errMissingSeek">var errMissingSeek</a>

```
searchKey: http.errMissingSeek
tags: [private]
```

```Go
var errMissingSeek = errors.New("io.File missing Seek method")
```

### <a id="errMissingReadDir" href="#errMissingReadDir">var errMissingReadDir</a>

```
searchKey: http.errMissingReadDir
tags: [private]
```

```Go
var errMissingReadDir = errors.New("io.File directory missing ReadDir method")
```

### <a id="http2dataChunkSizeClasses" href="#http2dataChunkSizeClasses">var http2dataChunkSizeClasses</a>

```
searchKey: http.http2dataChunkSizeClasses
tags: [private]
```

```Go
var http2dataChunkSizeClasses = []int{
	1 << 10,
	2 << 10,
	4 << 10,
	8 << 10,
	16 << 10,
}
```

Buffer chunks are allocated from a pool to reduce pressure on GC. The maximum wasted space per dataBuffer is 2x the largest size class, which happens when the dataBuffer has multiple chunks and there is one unread byte in both the first and last chunks. We use a few size classes to minimize overheads for servers that typically receive very small request bodies. 

TODO: Benchmark to determine if the pools are necessary. The GC may have improved enough that we can instead allocate chunks like this: make([]byte, max(16<<10, expectedBytesRemaining)) 

### <a id="http2dataChunkPools" href="#http2dataChunkPools">var http2dataChunkPools</a>

```
searchKey: http.http2dataChunkPools
tags: [private]
```

```Go
var http2dataChunkPools = ...
```

Buffer chunks are allocated from a pool to reduce pressure on GC. The maximum wasted space per dataBuffer is 2x the largest size class, which happens when the dataBuffer has multiple chunks and there is one unread byte in both the first and last chunks. We use a few size classes to minimize overheads for servers that typically receive very small request bodies. 

TODO: Benchmark to determine if the pools are necessary. The GC may have improved enough that we can instead allocate chunks like this: make([]byte, max(16<<10, expectedBytesRemaining)) 

### <a id="http2errReadEmpty" href="#http2errReadEmpty">var http2errReadEmpty</a>

```
searchKey: http.http2errReadEmpty
tags: [private]
```

```Go
var http2errReadEmpty = errors.New("read from empty dataBuffer")
```

### <a id="http2errCodeName" href="#http2errCodeName">var http2errCodeName</a>

```
searchKey: http.http2errCodeName
tags: [private]
```

```Go
var http2errCodeName = ...
```

### <a id="http2errMixPseudoHeaderTypes" href="#http2errMixPseudoHeaderTypes">var http2errMixPseudoHeaderTypes</a>

```
searchKey: http.http2errMixPseudoHeaderTypes
tags: [private]
```

```Go
var http2errMixPseudoHeaderTypes = errors.New("mix of request and response pseudo headers")
```

### <a id="http2errPseudoAfterRegular" href="#http2errPseudoAfterRegular">var http2errPseudoAfterRegular</a>

```
searchKey: http.http2errPseudoAfterRegular
tags: [private]
```

```Go
var http2errPseudoAfterRegular = errors.New("pseudo header field after regular")
```

### <a id="http2padZeros" href="#http2padZeros">var http2padZeros</a>

```
searchKey: http.http2padZeros
tags: [private]
```

```Go
var http2padZeros = make([]byte, 255) // zeros for padding

```

### <a id="http2frameName" href="#http2frameName">var http2frameName</a>

```
searchKey: http.http2frameName
tags: [private]
```

```Go
var http2frameName = ...
```

### <a id="http2flagName" href="#http2flagName">var http2flagName</a>

```
searchKey: http.http2flagName
tags: [private]
```

```Go
var http2flagName = ...
```

### <a id="http2frameParsers" href="#http2frameParsers">var http2frameParsers</a>

```
searchKey: http.http2frameParsers
tags: [private]
```

```Go
var http2frameParsers = ...
```

### <a id="http2fhBytes" href="#http2fhBytes">var http2fhBytes</a>

```
searchKey: http.http2fhBytes
tags: [private]
```

```Go
var http2fhBytes = ...
```

frame header bytes. Used only by ReadFrameHeader. 

### <a id="http2ErrFrameTooLarge" href="#http2ErrFrameTooLarge">var http2ErrFrameTooLarge</a>

```
searchKey: http.http2ErrFrameTooLarge
tags: [private]
```

```Go
var http2ErrFrameTooLarge = errors.New("http2: frame too large")
```

ErrFrameTooLarge is returned from Framer.ReadFrame when the peer sends a frame that is larger than declared with SetMaxReadFrameSize. 

### <a id="http2errStreamID" href="#http2errStreamID">var http2errStreamID</a>

```
searchKey: http.http2errStreamID
tags: [private]
```

```Go
var http2errStreamID = errors.New("invalid stream ID")
```

### <a id="http2errDepStreamID" href="#http2errDepStreamID">var http2errDepStreamID</a>

```
searchKey: http.http2errDepStreamID
tags: [private]
```

```Go
var http2errDepStreamID = errors.New("invalid dependent stream ID")
```

### <a id="http2errPadLength" href="#http2errPadLength">var http2errPadLength</a>

```
searchKey: http.http2errPadLength
tags: [private]
```

```Go
var http2errPadLength = errors.New("pad length too large")
```

### <a id="http2errPadBytes" href="#http2errPadBytes">var http2errPadBytes</a>

```
searchKey: http.http2errPadBytes
tags: [private]
```

```Go
var http2errPadBytes = ...
```

### <a id="http2DebugGoroutines" href="#http2DebugGoroutines">var http2DebugGoroutines</a>

```
searchKey: http.http2DebugGoroutines
tags: [private]
```

```Go
var http2DebugGoroutines = os.Getenv("DEBUG_HTTP2_GOROUTINES") == "1"
```

### <a id="http2goroutineSpace" href="#http2goroutineSpace">var http2goroutineSpace</a>

```
searchKey: http.http2goroutineSpace
tags: [private]
```

```Go
var http2goroutineSpace = []byte("goroutine ")
```

### <a id="http2littleBuf" href="#http2littleBuf">var http2littleBuf</a>

```
searchKey: http.http2littleBuf
tags: [private]
```

```Go
var http2littleBuf = ...
```

### <a id="http2commonBuildOnce" href="#http2commonBuildOnce">var http2commonBuildOnce</a>

```
searchKey: http.http2commonBuildOnce
tags: [private]
```

```Go
var http2commonBuildOnce sync.Once
```

### <a id="http2commonLowerHeader" href="#http2commonLowerHeader">var http2commonLowerHeader</a>

```
searchKey: http.http2commonLowerHeader
tags: [private]
```

```Go
var http2commonLowerHeader map[string]string // Go-Canonical-Case -> lower-case

```

### <a id="http2commonCanonHeader" href="#http2commonCanonHeader">var http2commonCanonHeader</a>

```
searchKey: http.http2commonCanonHeader
tags: [private]
```

```Go
var http2commonCanonHeader map[string]string // lower-case -> Go-Canonical-Case

```

### <a id="http2VerboseLogs" href="#http2VerboseLogs">var http2VerboseLogs</a>

```
searchKey: http.http2VerboseLogs
tags: [private]
```

```Go
var http2VerboseLogs bool
```

### <a id="http2logFrameWrites" href="#http2logFrameWrites">var http2logFrameWrites</a>

```
searchKey: http.http2logFrameWrites
tags: [private]
```

```Go
var http2logFrameWrites bool
```

### <a id="http2logFrameReads" href="#http2logFrameReads">var http2logFrameReads</a>

```
searchKey: http.http2logFrameReads
tags: [private]
```

```Go
var http2logFrameReads bool
```

### <a id="http2inTests" href="#http2inTests">var http2inTests</a>

```
searchKey: http.http2inTests
tags: [private]
```

```Go
var http2inTests bool
```

### <a id="http2clientPreface" href="#http2clientPreface">var http2clientPreface</a>

```
searchKey: http.http2clientPreface
tags: [private]
```

```Go
var http2clientPreface = []byte(http2ClientPreface)
```

### <a id="http2stateName" href="#http2stateName">var http2stateName</a>

```
searchKey: http.http2stateName
tags: [private]
```

```Go
var http2stateName = ...
```

### <a id="http2settingName" href="#http2settingName">var http2settingName</a>

```
searchKey: http.http2settingName
tags: [private]
```

```Go
var http2settingName = ...
```

### <a id="http2bufWriterPool" href="#http2bufWriterPool">var http2bufWriterPool</a>

```
searchKey: http.http2bufWriterPool
tags: [private]
```

```Go
var http2bufWriterPool = ...
```

### <a id="http2errTimeout" href="#http2errTimeout">var http2errTimeout</a>

```
searchKey: http.http2errTimeout
tags: [private]
```

```Go
var http2errTimeout error = ...
```

### <a id="http2sorterPool" href="#http2sorterPool">var http2sorterPool</a>

```
searchKey: http.http2sorterPool
tags: [private]
```

```Go
var http2sorterPool = sync.Pool{New: func() interface{} { return new(http2sorter) }}
```

### <a id="http2errClosedPipeWrite" href="#http2errClosedPipeWrite">var http2errClosedPipeWrite</a>

```
searchKey: http.http2errClosedPipeWrite
tags: [private]
```

```Go
var http2errClosedPipeWrite = errors.New("write on closed buffer")
```

### <a id="http2errClientDisconnected" href="#http2errClientDisconnected">var http2errClientDisconnected</a>

```
searchKey: http.http2errClientDisconnected
tags: [private]
```

```Go
var http2errClientDisconnected = errors.New("client disconnected")
```

### <a id="http2errClosedBody" href="#http2errClosedBody">var http2errClosedBody</a>

```
searchKey: http.http2errClosedBody
tags: [private]
```

```Go
var http2errClosedBody = errors.New("body closed by handler")
```

### <a id="http2errHandlerComplete" href="#http2errHandlerComplete">var http2errHandlerComplete</a>

```
searchKey: http.http2errHandlerComplete
tags: [private]
```

```Go
var http2errHandlerComplete = errors.New("http2: request body closed due to handler exiting")
```

### <a id="http2errStreamClosed" href="#http2errStreamClosed">var http2errStreamClosed</a>

```
searchKey: http.http2errStreamClosed
tags: [private]
```

```Go
var http2errStreamClosed = errors.New("http2: stream closed")
```

### <a id="http2responseWriterStatePool" href="#http2responseWriterStatePool">var http2responseWriterStatePool</a>

```
searchKey: http.http2responseWriterStatePool
tags: [private]
```

```Go
var http2responseWriterStatePool = ...
```

### <a id="http2testHookOnConn" href="#http2testHookOnConn">var http2testHookOnConn</a>

```
searchKey: http.http2testHookOnConn
tags: [private]
```

```Go
var http2testHookOnConn func()
```

Test hooks. 

### <a id="http2testHookGetServerConn" href="#http2testHookGetServerConn">var http2testHookGetServerConn</a>

```
searchKey: http.http2testHookGetServerConn
tags: [private]
```

```Go
var http2testHookGetServerConn func(*http2serverConn)
```

Test hooks. 

### <a id="http2testHookOnPanicMu" href="#http2testHookOnPanicMu">var http2testHookOnPanicMu</a>

```
searchKey: http.http2testHookOnPanicMu
tags: [private]
```

```Go
var http2testHookOnPanicMu *sync.Mutex // nil except in tests

```

Test hooks. 

### <a id="http2testHookOnPanic" href="#http2testHookOnPanic">var http2testHookOnPanic</a>

```
searchKey: http.http2testHookOnPanic
tags: [private]
```

```Go
var http2testHookOnPanic func(sc *http2serverConn, panicVal interface{}) (rePanic bool)
```

Test hooks. 

### <a id="http2settingsTimerMsg" href="#http2settingsTimerMsg">var http2settingsTimerMsg</a>

```
searchKey: http.http2settingsTimerMsg
tags: [private]
```

```Go
var http2settingsTimerMsg = new(http2serverMessage)
```

Message values sent to serveMsgCh. 

### <a id="http2idleTimerMsg" href="#http2idleTimerMsg">var http2idleTimerMsg</a>

```
searchKey: http.http2idleTimerMsg
tags: [private]
```

```Go
var http2idleTimerMsg = new(http2serverMessage)
```

Message values sent to serveMsgCh. 

### <a id="http2shutdownTimerMsg" href="#http2shutdownTimerMsg">var http2shutdownTimerMsg</a>

```
searchKey: http.http2shutdownTimerMsg
tags: [private]
```

```Go
var http2shutdownTimerMsg = new(http2serverMessage)
```

Message values sent to serveMsgCh. 

### <a id="http2gracefulShutdownMsg" href="#http2gracefulShutdownMsg">var http2gracefulShutdownMsg</a>

```
searchKey: http.http2gracefulShutdownMsg
tags: [private]
```

```Go
var http2gracefulShutdownMsg = new(http2serverMessage)
```

Message values sent to serveMsgCh. 

### <a id="http2errPrefaceTimeout" href="#http2errPrefaceTimeout">var http2errPrefaceTimeout</a>

```
searchKey: http.http2errPrefaceTimeout
tags: [private]
```

```Go
var http2errPrefaceTimeout = errors.New("timeout waiting for client preface")
```

### <a id="http2errChanPool" href="#http2errChanPool">var http2errChanPool</a>

```
searchKey: http.http2errChanPool
tags: [private]
```

```Go
var http2errChanPool = sync.Pool{
	New: func() interface{} { return make(chan error, 1) },
}
```

### <a id="http2writeDataPool" href="#http2writeDataPool">var http2writeDataPool</a>

```
searchKey: http.http2writeDataPool
tags: [private]
```

```Go
var http2writeDataPool = sync.Pool{
	New: func() interface{} { return new(http2writeData) },
}
```

### <a id="http2errHandlerPanicked" href="#http2errHandlerPanicked">var http2errHandlerPanicked</a>

```
searchKey: http.http2errHandlerPanicked
tags: [private]
```

```Go
var http2errHandlerPanicked = errors.New("http2: handler panicked")
```

errHandlerPanicked is the error given to any callers blocked in a read from Request.Body when the main goroutine panics. Since most handlers read in the main ServeHTTP goroutine, this will show up rarely. 

### <a id="http2goAwayTimeout" href="#http2goAwayTimeout">var http2goAwayTimeout</a>

```
searchKey: http.http2goAwayTimeout
tags: [private]
```

```Go
var http2goAwayTimeout = 1 * time.Second
```

After sending GOAWAY with an error code (non-graceful shutdown), the connection will close after goAwayTimeout. 

If we close the connection immediately after sending GOAWAY, there may be unsent data in our kernel receive buffer, which will cause the kernel to send a TCP RST on close() instead of a FIN. This RST will abort the connection immediately, whether or not the client had received the GOAWAY. 

Ideally we should delay for at least 1 RTT + epsilon so the client has a chance to read the GOAWAY and stop sending messages. Measuring RTT is hard, so we approximate with 1 second. See golang.org/issue/18701. 

This is a var so it can be shorter in tests, where all requests uses the loopback interface making the expected RTT very small. 

TODO: configurable? 

### <a id="http2ErrRecursivePush" href="#http2ErrRecursivePush">var http2ErrRecursivePush</a>

```
searchKey: http.http2ErrRecursivePush
tags: [private]
```

```Go
var http2ErrRecursivePush = errors.New("http2: recursive push not allowed")
```

Push errors. 

### <a id="http2ErrPushLimitReached" href="#http2ErrPushLimitReached">var http2ErrPushLimitReached</a>

```
searchKey: http.http2ErrPushLimitReached
tags: [private]
```

```Go
var http2ErrPushLimitReached = ...
```

Push errors. 

### <a id="http2connHeaders" href="#http2connHeaders">var http2connHeaders</a>

```
searchKey: http.http2connHeaders
tags: [private]
```

```Go
var http2connHeaders = ...
```

From [http://httpwg.org/specs/rfc7540.html#rfc.section.8.1.2.2](http://httpwg.org/specs/rfc7540.html#rfc.section.8.1.2.2) 

### <a id="http2got1xxFuncForTests" href="#http2got1xxFuncForTests">var http2got1xxFuncForTests</a>

```
searchKey: http.http2got1xxFuncForTests
tags: [private]
```

```Go
var http2got1xxFuncForTests func(int, textproto.MIMEHeader) error
```

### <a id="http2ErrNoCachedConn" href="#http2ErrNoCachedConn">var http2ErrNoCachedConn</a>

```
searchKey: http.http2ErrNoCachedConn
tags: [private]
```

```Go
var http2ErrNoCachedConn error = http2noCachedConnError{}
```

### <a id="http2errClientConnClosed" href="#http2errClientConnClosed">var http2errClientConnClosed</a>

```
searchKey: http.http2errClientConnClosed
tags: [private]
```

```Go
var http2errClientConnClosed = errors.New("http2: client conn is closed")
```

### <a id="http2errClientConnUnusable" href="#http2errClientConnUnusable">var http2errClientConnUnusable</a>

```
searchKey: http.http2errClientConnUnusable
tags: [private]
```

```Go
var http2errClientConnUnusable = errors.New("http2: client conn not usable")
```

### <a id="http2errClientConnGotGoAway" href="#http2errClientConnGotGoAway">var http2errClientConnGotGoAway</a>

```
searchKey: http.http2errClientConnGotGoAway
tags: [private]
```

```Go
var http2errClientConnGotGoAway = ...
```

### <a id="http2shutdownEnterWaitStateHook" href="#http2shutdownEnterWaitStateHook">var http2shutdownEnterWaitStateHook</a>

```
searchKey: http.http2shutdownEnterWaitStateHook
tags: [private]
```

```Go
var http2shutdownEnterWaitStateHook = func() {}
```

### <a id="http2errRequestCanceled" href="#http2errRequestCanceled">var http2errRequestCanceled</a>

```
searchKey: http.http2errRequestCanceled
tags: [private]
```

```Go
var http2errRequestCanceled = errors.New("net/http: request canceled")
```

errRequestCanceled is a copy of net/http's errRequestCanceled because it's not exported. At least they'll be DeepEqual for h1-vs-h2 comparisons tests. 

### <a id="http2errStopReqBodyWrite" href="#http2errStopReqBodyWrite">var http2errStopReqBodyWrite</a>

```
searchKey: http.http2errStopReqBodyWrite
tags: [private]
```

```Go
var http2errStopReqBodyWrite = errors.New("http2: aborting request body write")
```

internal error values; they don't escape to callers 

abort request body write; don't send cancel 

### <a id="http2errStopReqBodyWriteAndCancel" href="#http2errStopReqBodyWriteAndCancel">var http2errStopReqBodyWriteAndCancel</a>

```
searchKey: http.http2errStopReqBodyWriteAndCancel
tags: [private]
```

```Go
var http2errStopReqBodyWriteAndCancel = errors.New("http2: canceling request")
```

internal error values; they don't escape to callers 

abort request body write, but send stream reset of cancel. 

### <a id="http2errReqBodyTooLong" href="#http2errReqBodyTooLong">var http2errReqBodyTooLong</a>

```
searchKey: http.http2errReqBodyTooLong
tags: [private]
```

```Go
var http2errReqBodyTooLong = errors.New("http2: request body larger than specified content length")
```

internal error values; they don't escape to callers 

### <a id="http2errClosedResponseBody" href="#http2errClosedResponseBody">var http2errClosedResponseBody</a>

```
searchKey: http.http2errClosedResponseBody
tags: [private]
```

```Go
var http2errClosedResponseBody = errors.New("http2: response body closed")
```

### <a id="http2errResponseHeaderListSize" href="#http2errResponseHeaderListSize">var http2errResponseHeaderListSize</a>

```
searchKey: http.http2errResponseHeaderListSize
tags: [private]
```

```Go
var http2errResponseHeaderListSize = ...
```

### <a id="http2errRequestHeaderListSize" href="#http2errRequestHeaderListSize">var http2errRequestHeaderListSize</a>

```
searchKey: http.http2errRequestHeaderListSize
tags: [private]
```

```Go
var http2errRequestHeaderListSize = ...
```

### <a id="http2noBody" href="#http2noBody">var http2noBody</a>

```
searchKey: http.http2noBody
tags: [private]
```

```Go
var http2noBody io.ReadCloser = ioutil.NopCloser(bytes.NewReader(nil))
```

### <a id="timeFormats" href="#timeFormats">var timeFormats</a>

```
searchKey: http.timeFormats
tags: [private]
```

```Go
var timeFormats = []string{
	TimeFormat,
	time.RFC850,
	time.ANSIC,
}
```

### <a id="headerNewlineToSpace" href="#headerNewlineToSpace">var headerNewlineToSpace</a>

```
searchKey: http.headerNewlineToSpace
tags: [private]
```

```Go
var headerNewlineToSpace = strings.NewReplacer("\n", " ", "\r", " ")
```

### <a id="headerSorterPool" href="#headerSorterPool">var headerSorterPool</a>

```
searchKey: http.headerSorterPool
tags: [private]
```

```Go
var headerSorterPool = sync.Pool{
	New: func() interface{} { return new(headerSorter) },
}
```

### <a id="aLongTimeAgo" href="#aLongTimeAgo">var aLongTimeAgo</a>

```
searchKey: http.aLongTimeAgo
tags: [private]
```

```Go
var aLongTimeAgo = time.Unix(1, 0)
```

aLongTimeAgo is a non-zero time, far in the past, used for immediate cancellation of network operations. 

### <a id="omitBundledHTTP2" href="#omitBundledHTTP2">var omitBundledHTTP2</a>

```
searchKey: http.omitBundledHTTP2
tags: [private]
```

```Go
var omitBundledHTTP2 bool
```

omitBundledHTTP2 is set by omithttp2.go when the nethttpomithttp2 build tag is set. That means h2_bundle.go isn't compiled in and we shouldn't try to use it. 

### <a id="NoBody" href="#NoBody">var NoBody</a>

```
searchKey: http.NoBody
```

```Go
var NoBody = noBody{}
```

NoBody is an io.ReadCloser with no bytes. Read always returns EOF and Close always returns nil. It can be used in an outgoing client request to explicitly signal that a request has zero bytes. An alternative, however, is to simply set Request.Body to nil. 

### <a id="ErrMissingFile" href="#ErrMissingFile">var ErrMissingFile</a>

```
searchKey: http.ErrMissingFile
```

```Go
var ErrMissingFile = errors.New("http: no such file")
```

ErrMissingFile is returned by FormFile when the provided file field name is either not present in the request or not a file field. 

### <a id="ErrNotSupported" href="#ErrNotSupported">var ErrNotSupported</a>

```
searchKey: http.ErrNotSupported
```

```Go
var ErrNotSupported = &ProtocolError{"feature not supported"}
```

ErrNotSupported is returned by the Push method of Pusher implementations to indicate that HTTP/2 Push support is not available. 

### <a id="ErrUnexpectedTrailer" href="#ErrUnexpectedTrailer">var ErrUnexpectedTrailer</a>

```
searchKey: http.ErrUnexpectedTrailer
tags: [deprecated]
```

```Go
var ErrUnexpectedTrailer = &ProtocolError{"trailer header without chunked transfer encoding"}
```

Deprecated: ErrUnexpectedTrailer is no longer returned by anything in the net/http package. Callers should not compare errors against this variable. 

### <a id="ErrMissingBoundary" href="#ErrMissingBoundary">var ErrMissingBoundary</a>

```
searchKey: http.ErrMissingBoundary
```

```Go
var ErrMissingBoundary = &ProtocolError{"no multipart boundary param in Content-Type"}
```

ErrMissingBoundary is returned by Request.MultipartReader when the request's Content-Type does not include a "boundary" parameter. 

### <a id="ErrNotMultipart" href="#ErrNotMultipart">var ErrNotMultipart</a>

```
searchKey: http.ErrNotMultipart
```

```Go
var ErrNotMultipart = &ProtocolError{"request Content-Type isn't multipart/form-data"}
```

ErrNotMultipart is returned by Request.MultipartReader when the request's Content-Type is not multipart/form-data. 

### <a id="ErrHeaderTooLong" href="#ErrHeaderTooLong">var ErrHeaderTooLong</a>

```
searchKey: http.ErrHeaderTooLong
tags: [deprecated]
```

```Go
var ErrHeaderTooLong = &ProtocolError{"header too long"}
```

Deprecated: ErrHeaderTooLong is no longer returned by anything in the net/http package. Callers should not compare errors against this variable. 

### <a id="ErrShortBody" href="#ErrShortBody">var ErrShortBody</a>

```
searchKey: http.ErrShortBody
tags: [deprecated]
```

```Go
var ErrShortBody = &ProtocolError{"entity body too short"}
```

Deprecated: ErrShortBody is no longer returned by anything in the net/http package. Callers should not compare errors against this variable. 

### <a id="ErrMissingContentLength" href="#ErrMissingContentLength">var ErrMissingContentLength</a>

```
searchKey: http.ErrMissingContentLength
tags: [deprecated]
```

```Go
var ErrMissingContentLength = &ProtocolError{"missing ContentLength in HEAD response"}
```

Deprecated: ErrMissingContentLength is no longer returned by anything in the net/http package. Callers should not compare errors against this variable. 

### <a id="reqWriteExcludeHeader" href="#reqWriteExcludeHeader">var reqWriteExcludeHeader</a>

```
searchKey: http.reqWriteExcludeHeader
tags: [private]
```

```Go
var reqWriteExcludeHeader = ...
```

Headers that Request.Write handles itself and should be skipped. 

### <a id="ErrNoCookie" href="#ErrNoCookie">var ErrNoCookie</a>

```
searchKey: http.ErrNoCookie
```

```Go
var ErrNoCookie = errors.New("http: named cookie not present")
```

ErrNoCookie is returned by Request's Cookie method when a cookie is not found. 

### <a id="multipartByReader" href="#multipartByReader">var multipartByReader</a>

```
searchKey: http.multipartByReader
tags: [private]
```

```Go
var multipartByReader = ...
```

multipartByReader is a sentinel value. Its presence in Request.MultipartForm indicates that parsing of the request body has been handed off to a MultipartReader instead of ParseMultipartForm. 

### <a id="errMissingHost" href="#errMissingHost">var errMissingHost</a>

```
searchKey: http.errMissingHost
tags: [private]
```

```Go
var errMissingHost = errors.New("http: Request.Write on Request with no Host or URL set")
```

errMissingHost is returned by Write when there is no Host or URL present in the Request. 

### <a id="textprotoReaderPool" href="#textprotoReaderPool">var textprotoReaderPool</a>

```
searchKey: http.textprotoReaderPool
tags: [private]
```

```Go
var textprotoReaderPool sync.Pool
```

### <a id="respExcludeHeader" href="#respExcludeHeader">var respExcludeHeader</a>

```
searchKey: http.respExcludeHeader
tags: [private]
```

```Go
var respExcludeHeader = ...
```

### <a id="ErrNoLocation" href="#ErrNoLocation">var ErrNoLocation</a>

```
searchKey: http.ErrNoLocation
```

```Go
var ErrNoLocation = errors.New("http: no Location header in response")
```

ErrNoLocation is returned by Response's Location method when no Location header is present. 

### <a id="ErrBodyNotAllowed" href="#ErrBodyNotAllowed">var ErrBodyNotAllowed</a>

```
searchKey: http.ErrBodyNotAllowed
```

```Go
var ErrBodyNotAllowed = ...
```

Errors used by the HTTP server. 

ErrBodyNotAllowed is returned by ResponseWriter.Write calls when the HTTP method or response code does not permit a body. 

### <a id="ErrHijacked" href="#ErrHijacked">var ErrHijacked</a>

```
searchKey: http.ErrHijacked
```

```Go
var ErrHijacked = errors.New("http: connection has been hijacked")
```

Errors used by the HTTP server. 

ErrHijacked is returned by ResponseWriter.Write calls when the underlying connection has been hijacked using the Hijacker interface. A zero-byte write on a hijacked connection will return ErrHijacked without any other side effects. 

### <a id="ErrContentLength" href="#ErrContentLength">var ErrContentLength</a>

```
searchKey: http.ErrContentLength
```

```Go
var ErrContentLength = errors.New("http: wrote more than the declared Content-Length")
```

Errors used by the HTTP server. 

ErrContentLength is returned by ResponseWriter.Write calls when a Handler set a Content-Length response header with a declared size and then attempted to write more bytes than declared. 

### <a id="ErrWriteAfterFlush" href="#ErrWriteAfterFlush">var ErrWriteAfterFlush</a>

```
searchKey: http.ErrWriteAfterFlush
tags: [deprecated]
```

```Go
var ErrWriteAfterFlush = errors.New("unused")
```

Errors used by the HTTP server. 

Deprecated: ErrWriteAfterFlush is no longer returned by anything in the net/http package. Callers should not compare errors against this variable. 

### <a id="ServerContextKey" href="#ServerContextKey">var ServerContextKey</a>

```
searchKey: http.ServerContextKey
```

```Go
var ServerContextKey = &contextKey{"http-server"}
```

ServerContextKey is a context key. It can be used in HTTP handlers with Context.Value to access the server that started the handler. The associated value will be of type *Server. 

### <a id="LocalAddrContextKey" href="#LocalAddrContextKey">var LocalAddrContextKey</a>

```
searchKey: http.LocalAddrContextKey
```

```Go
var LocalAddrContextKey = &contextKey{"local-addr"}
```

LocalAddrContextKey is a context key. It can be used in HTTP handlers with Context.Value to access the local address the connection arrived on. The associated value will be of type net.Addr. 

### <a id="crlf" href="#crlf">var crlf</a>

```
searchKey: http.crlf
tags: [private]
```

```Go
var crlf = []byte("\r\n")
```

### <a id="colonSpace" href="#colonSpace">var colonSpace</a>

```
searchKey: http.colonSpace
tags: [private]
```

```Go
var colonSpace = []byte(": ")
```

### <a id="bufioReaderPool" href="#bufioReaderPool">var bufioReaderPool</a>

```
searchKey: http.bufioReaderPool
tags: [private]
```

```Go
var bufioReaderPool sync.Pool
```

### <a id="bufioWriter2kPool" href="#bufioWriter2kPool">var bufioWriter2kPool</a>

```
searchKey: http.bufioWriter2kPool
tags: [private]
```

```Go
var bufioWriter2kPool sync.Pool
```

### <a id="bufioWriter4kPool" href="#bufioWriter4kPool">var bufioWriter4kPool</a>

```
searchKey: http.bufioWriter4kPool
tags: [private]
```

```Go
var bufioWriter4kPool sync.Pool
```

### <a id="copyBufPool" href="#copyBufPool">var copyBufPool</a>

```
searchKey: http.copyBufPool
tags: [private]
```

```Go
var copyBufPool = ...
```

### <a id="errTooLarge" href="#errTooLarge">var errTooLarge</a>

```
searchKey: http.errTooLarge
tags: [private]
```

```Go
var errTooLarge = errors.New("http: request too large")
```

### <a id="extraHeaderKeys" href="#extraHeaderKeys">var extraHeaderKeys</a>

```
searchKey: http.extraHeaderKeys
tags: [private]
```

```Go
var extraHeaderKeys = ...
```

Sorted the same as extraHeader.Write's loop. 

### <a id="headerContentLength" href="#headerContentLength">var headerContentLength</a>

```
searchKey: http.headerContentLength
tags: [private]
```

```Go
var headerContentLength = []byte("Content-Length: ")
```

### <a id="headerDate" href="#headerDate">var headerDate</a>

```
searchKey: http.headerDate
tags: [private]
```

```Go
var headerDate = []byte("Date: ")
```

### <a id="ErrAbortHandler" href="#ErrAbortHandler">var ErrAbortHandler</a>

```
searchKey: http.ErrAbortHandler
```

```Go
var ErrAbortHandler = errors.New("net/http: abort Handler")
```

ErrAbortHandler is a sentinel panic value to abort a handler. While any panic from ServeHTTP aborts the response to the client, panicking with ErrAbortHandler also suppresses logging of a stack trace to the server's error log. 

### <a id="htmlReplacer" href="#htmlReplacer">var htmlReplacer</a>

```
searchKey: http.htmlReplacer
tags: [private]
```

```Go
var htmlReplacer = ...
```

### <a id="DefaultServeMux" href="#DefaultServeMux">var DefaultServeMux</a>

```
searchKey: http.DefaultServeMux
```

```Go
var DefaultServeMux = &defaultServeMux
```

DefaultServeMux is the default ServeMux used by Serve. 

### <a id="defaultServeMux" href="#defaultServeMux">var defaultServeMux</a>

```
searchKey: http.defaultServeMux
tags: [private]
```

```Go
var defaultServeMux ServeMux
```

### <a id="stateName" href="#stateName">var stateName</a>

```
searchKey: http.stateName
tags: [private]
```

```Go
var stateName = ...
```

### <a id="silenceSemWarnContextKey" href="#silenceSemWarnContextKey">var silenceSemWarnContextKey</a>

```
searchKey: http.silenceSemWarnContextKey
tags: [private]
```

```Go
var silenceSemWarnContextKey = &contextKey{"silence-semicolons"}
```

### <a id="testHookServerServe" href="#testHookServerServe">var testHookServerServe</a>

```
searchKey: http.testHookServerServe
tags: [private]
```

```Go
var testHookServerServe func(*Server, net.Listener) // used if non-nil

```

### <a id="ErrServerClosed" href="#ErrServerClosed">var ErrServerClosed</a>

```
searchKey: http.ErrServerClosed
```

```Go
var ErrServerClosed = errors.New("http: Server closed")
```

ErrServerClosed is returned by the Server's Serve, ServeTLS, ListenAndServe, and ListenAndServeTLS methods after a call to Shutdown or Close. 

### <a id="ErrHandlerTimeout" href="#ErrHandlerTimeout">var ErrHandlerTimeout</a>

```
searchKey: http.ErrHandlerTimeout
```

```Go
var ErrHandlerTimeout = errors.New("http: Handler timeout")
```

ErrHandlerTimeout is returned on ResponseWriter Write calls in handlers which have timed out. 

### <a id="uniqNameMu" href="#uniqNameMu">var uniqNameMu</a>

```
searchKey: http.uniqNameMu
tags: [private]
```

```Go
var uniqNameMu sync.Mutex
```

### <a id="uniqNameNext" href="#uniqNameNext">var uniqNameNext</a>

```
searchKey: http.uniqNameNext
tags: [private]
```

```Go
var uniqNameNext = make(map[string]int)
```

### <a id="sniffSignatures" href="#sniffSignatures">var sniffSignatures</a>

```
searchKey: http.sniffSignatures
tags: [private]
```

```Go
var sniffSignatures = ...
```

Data matching the table in section 6. 

### <a id="mp4ftype" href="#mp4ftype">var mp4ftype</a>

```
searchKey: http.mp4ftype
tags: [private]
```

```Go
var mp4ftype = []byte("ftyp")
```

### <a id="mp4" href="#mp4">var mp4</a>

```
searchKey: http.mp4
tags: [private]
```

```Go
var mp4 = []byte("mp4")
```

### <a id="socksnoDeadline" href="#socksnoDeadline">var socksnoDeadline</a>

```
searchKey: http.socksnoDeadline
tags: [private]
```

```Go
var socksnoDeadline = time.Time{}
```

### <a id="socksaLongTimeAgo" href="#socksaLongTimeAgo">var socksaLongTimeAgo</a>

```
searchKey: http.socksaLongTimeAgo
tags: [private]
```

```Go
var socksaLongTimeAgo = time.Unix(1, 0)
```

### <a id="statusText" href="#statusText">var statusText</a>

```
searchKey: http.statusText
tags: [private]
```

```Go
var statusText = ...
```

### <a id="ErrLineTooLong" href="#ErrLineTooLong">var ErrLineTooLong</a>

```
searchKey: http.ErrLineTooLong
```

```Go
var ErrLineTooLong = internal.ErrLineTooLong
```

ErrLineTooLong is returned when reading request or response bodies with malformed chunked encoding. 

### <a id="suppressedHeaders304" href="#suppressedHeaders304">var suppressedHeaders304</a>

```
searchKey: http.suppressedHeaders304
tags: [private]
```

```Go
var suppressedHeaders304 = []string{"Content-Type", "Content-Length", "Transfer-Encoding"}
```

### <a id="suppressedHeadersNoBody" href="#suppressedHeadersNoBody">var suppressedHeadersNoBody</a>

```
searchKey: http.suppressedHeadersNoBody
tags: [private]
```

```Go
var suppressedHeadersNoBody = []string{"Content-Length", "Transfer-Encoding"}
```

### <a id="ErrBodyReadAfterClose" href="#ErrBodyReadAfterClose">var ErrBodyReadAfterClose</a>

```
searchKey: http.ErrBodyReadAfterClose
```

```Go
var ErrBodyReadAfterClose = errors.New("http: invalid Read on closed Body")
```

ErrBodyReadAfterClose is returned when reading a Request or Response Body after the body has been closed. This typically happens when the body is read after an HTTP Handler calls WriteHeader or Write on its ResponseWriter. 

### <a id="singleCRLF" href="#singleCRLF">var singleCRLF</a>

```
searchKey: http.singleCRLF
tags: [private]
```

```Go
var singleCRLF = []byte("\r\n")
```

### <a id="doubleCRLF" href="#doubleCRLF">var doubleCRLF</a>

```
searchKey: http.doubleCRLF
tags: [private]
```

```Go
var doubleCRLF = []byte("\r\n\r\n")
```

### <a id="errTrailerEOF" href="#errTrailerEOF">var errTrailerEOF</a>

```
searchKey: http.errTrailerEOF
tags: [private]
```

```Go
var errTrailerEOF = errors.New("http: unexpected EOF reading trailer")
```

### <a id="nopCloserType" href="#nopCloserType">var nopCloserType</a>

```
searchKey: http.nopCloserType
tags: [private]
```

```Go
var nopCloserType = reflect.TypeOf(io.NopCloser(nil))
```

### <a id="DefaultTransport" href="#DefaultTransport">var DefaultTransport</a>

```
searchKey: http.DefaultTransport
```

```Go
var DefaultTransport RoundTripper = ...
```

DefaultTransport is the default implementation of Transport and is used by DefaultClient. It establishes network connections as needed and caches them for reuse by subsequent calls. It uses HTTP proxies as directed by the $HTTP_PROXY and $NO_PROXY (or $http_proxy and $no_proxy) environment variables. 

### <a id="errCannotRewind" href="#errCannotRewind">var errCannotRewind</a>

```
searchKey: http.errCannotRewind
tags: [private]
```

```Go
var errCannotRewind = errors.New("net/http: cannot rewind body after connection loss")
```

### <a id="ErrSkipAltProtocol" href="#ErrSkipAltProtocol">var ErrSkipAltProtocol</a>

```
searchKey: http.ErrSkipAltProtocol
```

```Go
var ErrSkipAltProtocol = errors.New("net/http: skip alternate protocol")
```

ErrSkipAltProtocol is a sentinel error value defined by Transport.RegisterProtocol. 

### <a id="envProxyOnce" href="#envProxyOnce">var envProxyOnce</a>

```
searchKey: http.envProxyOnce
tags: [private]
```

```Go
var envProxyOnce sync.Once
```

proxyConfigOnce guards proxyConfig 

### <a id="envProxyFuncValue" href="#envProxyFuncValue">var envProxyFuncValue</a>

```
searchKey: http.envProxyFuncValue
tags: [private]
```

```Go
var envProxyFuncValue func(*url.URL) (*url.URL, error)
```

### <a id="errKeepAlivesDisabled" href="#errKeepAlivesDisabled">var errKeepAlivesDisabled</a>

```
searchKey: http.errKeepAlivesDisabled
tags: [private]
```

```Go
var errKeepAlivesDisabled = errors.New("http: putIdleConn: keep alives disabled")
```

error values for debugging and testing, not seen by users. 

### <a id="errConnBroken" href="#errConnBroken">var errConnBroken</a>

```
searchKey: http.errConnBroken
tags: [private]
```

```Go
var errConnBroken = errors.New("http: putIdleConn: connection is in bad state")
```

error values for debugging and testing, not seen by users. 

### <a id="errCloseIdle" href="#errCloseIdle">var errCloseIdle</a>

```
searchKey: http.errCloseIdle
tags: [private]
```

```Go
var errCloseIdle = errors.New("http: putIdleConn: CloseIdleConnections was called")
```

error values for debugging and testing, not seen by users. 

### <a id="errTooManyIdle" href="#errTooManyIdle">var errTooManyIdle</a>

```
searchKey: http.errTooManyIdle
tags: [private]
```

```Go
var errTooManyIdle = errors.New("http: putIdleConn: too many idle connections")
```

error values for debugging and testing, not seen by users. 

### <a id="errTooManyIdleHost" href="#errTooManyIdleHost">var errTooManyIdleHost</a>

```
searchKey: http.errTooManyIdleHost
tags: [private]
```

```Go
var errTooManyIdleHost = errors.New("http: putIdleConn: too many idle connections for host")
```

error values for debugging and testing, not seen by users. 

### <a id="errCloseIdleConns" href="#errCloseIdleConns">var errCloseIdleConns</a>

```
searchKey: http.errCloseIdleConns
tags: [private]
```

```Go
var errCloseIdleConns = errors.New("http: CloseIdleConnections called")
```

error values for debugging and testing, not seen by users. 

### <a id="errReadLoopExiting" href="#errReadLoopExiting">var errReadLoopExiting</a>

```
searchKey: http.errReadLoopExiting
tags: [private]
```

```Go
var errReadLoopExiting = errors.New("http: persistConn.readLoop exiting")
```

error values for debugging and testing, not seen by users. 

### <a id="errIdleConnTimeout" href="#errIdleConnTimeout">var errIdleConnTimeout</a>

```
searchKey: http.errIdleConnTimeout
tags: [private]
```

```Go
var errIdleConnTimeout = errors.New("http: idle connection timeout")
```

error values for debugging and testing, not seen by users. 

### <a id="errServerClosedIdle" href="#errServerClosedIdle">var errServerClosedIdle</a>

```
searchKey: http.errServerClosedIdle
tags: [private]
```

```Go
var errServerClosedIdle = errors.New("http: server closed idle connection")
```

error values for debugging and testing, not seen by users. 

errServerClosedIdle is not seen by users for idempotent requests, but may be seen by a user if the server shuts down an idle connection and sends its FIN in flight with already-written POST body bytes from the client. See [https://github.com/golang/go/issues/19943#issuecomment-355607646](https://github.com/golang/go/issues/19943#issuecomment-355607646) 

### <a id="zeroDialer" href="#zeroDialer">var zeroDialer</a>

```
searchKey: http.zeroDialer
tags: [private]
```

```Go
var zeroDialer net.Dialer
```

### <a id="errCallerOwnsConn" href="#errCallerOwnsConn">var errCallerOwnsConn</a>

```
searchKey: http.errCallerOwnsConn
tags: [private]
```

```Go
var errCallerOwnsConn = errors.New("read loop ending; caller owns writable underlying conn")
```

errCallerOwnsConn is an internal sentinel error used when we hand off a writable response.Body to the caller. We use this to prevent closing a net.Conn that is now owned by the caller. 

### <a id="errTimeout" href="#errTimeout">var errTimeout</a>

```
searchKey: http.errTimeout
tags: [private]
```

```Go
var errTimeout error = &httpError{err: "net/http: timeout awaiting response headers", timeout: true}
```

### <a id="errRequestCanceled" href="#errRequestCanceled">var errRequestCanceled</a>

```
searchKey: http.errRequestCanceled
tags: [private]
```

```Go
var errRequestCanceled = http2errRequestCanceled
```

errRequestCanceled is set to be identical to the one from h2 to facilitate testing. 

### <a id="errRequestCanceledConn" href="#errRequestCanceledConn">var errRequestCanceledConn</a>

```
searchKey: http.errRequestCanceledConn
tags: [private]
```

```Go
var errRequestCanceledConn // TODO: unify?
 = ...
```

### <a id="testHookEnterRoundTrip" href="#testHookEnterRoundTrip">var testHookEnterRoundTrip</a>

```
searchKey: http.testHookEnterRoundTrip
tags: [private]
```

```Go
var testHookEnterRoundTrip = nop
```

testHooks. Always non-nil. 

### <a id="testHookWaitResLoop" href="#testHookWaitResLoop">var testHookWaitResLoop</a>

```
searchKey: http.testHookWaitResLoop
tags: [private]
```

```Go
var testHookWaitResLoop = nop
```

testHooks. Always non-nil. 

### <a id="testHookRoundTripRetried" href="#testHookRoundTripRetried">var testHookRoundTripRetried</a>

```
searchKey: http.testHookRoundTripRetried
tags: [private]
```

```Go
var testHookRoundTripRetried = nop
```

testHooks. Always non-nil. 

### <a id="testHookPrePendingDial" href="#testHookPrePendingDial">var testHookPrePendingDial</a>

```
searchKey: http.testHookPrePendingDial
tags: [private]
```

```Go
var testHookPrePendingDial = nop
```

testHooks. Always non-nil. 

### <a id="testHookPostPendingDial" href="#testHookPostPendingDial">var testHookPostPendingDial</a>

```
searchKey: http.testHookPostPendingDial
tags: [private]
```

```Go
var testHookPostPendingDial = nop
```

testHooks. Always non-nil. 

### <a id="testHookMu" href="#testHookMu">var testHookMu</a>

```
searchKey: http.testHookMu
tags: [private]
```

```Go
var testHookMu sync.Locker = fakeLocker{} // guards following

```

testHooks. Always non-nil. 

### <a id="testHookReadLoopBeforeNextRead" href="#testHookReadLoopBeforeNextRead">var testHookReadLoopBeforeNextRead</a>

```
searchKey: http.testHookReadLoopBeforeNextRead
tags: [private]
```

```Go
var testHookReadLoopBeforeNextRead = nop
```

testHooks. Always non-nil. 

### <a id="portMap" href="#portMap">var portMap</a>

```
searchKey: http.portMap
tags: [private]
```

```Go
var portMap = map[string]string{
	"http":   "80",
	"https":  "443",
	"socks5": "1080",
}
```

### <a id="errReadOnClosedResBody" href="#errReadOnClosedResBody">var errReadOnClosedResBody</a>

```
searchKey: http.errReadOnClosedResBody
tags: [private]
```

```Go
var errReadOnClosedResBody = errors.New("http: read on closed response body")
```

### <a id="writeSetCookiesTests" href="#writeSetCookiesTests">var writeSetCookiesTests</a>

```
searchKey: http.writeSetCookiesTests
tags: [private]
```

```Go
var writeSetCookiesTests = ...
```

### <a id="addCookieTests" href="#addCookieTests">var addCookieTests</a>

```
searchKey: http.addCookieTests
tags: [private]
```

```Go
var addCookieTests = ...
```

### <a id="readSetCookiesTests" href="#readSetCookiesTests">var readSetCookiesTests</a>

```
searchKey: http.readSetCookiesTests
tags: [private]
```

```Go
var readSetCookiesTests = ...
```

### <a id="readCookiesTests" href="#readCookiesTests">var readCookiesTests</a>

```
searchKey: http.readCookiesTests
tags: [private]
```

```Go
var readCookiesTests = ...
```

### <a id="DefaultUserAgent" href="#DefaultUserAgent">var DefaultUserAgent</a>

```
searchKey: http.DefaultUserAgent
tags: [private]
```

```Go
var DefaultUserAgent = defaultUserAgent
```

### <a id="NewLoggingConn" href="#NewLoggingConn">var NewLoggingConn</a>

```
searchKey: http.NewLoggingConn
tags: [private]
```

```Go
var NewLoggingConn = newLoggingConn
```

### <a id="ExportAppendTime" href="#ExportAppendTime">var ExportAppendTime</a>

```
searchKey: http.ExportAppendTime
tags: [private]
```

```Go
var ExportAppendTime = appendTime
```

### <a id="ExportRefererForURL" href="#ExportRefererForURL">var ExportRefererForURL</a>

```
searchKey: http.ExportRefererForURL
tags: [private]
```

```Go
var ExportRefererForURL = refererForURL
```

### <a id="ExportServerNewConn" href="#ExportServerNewConn">var ExportServerNewConn</a>

```
searchKey: http.ExportServerNewConn
tags: [private]
```

```Go
var ExportServerNewConn = (*Server).newConn
```

### <a id="ExportCloseWriteAndWait" href="#ExportCloseWriteAndWait">var ExportCloseWriteAndWait</a>

```
searchKey: http.ExportCloseWriteAndWait
tags: [private]
```

```Go
var ExportCloseWriteAndWait = (*conn).closeWriteAndWait
```

### <a id="ExportErrRequestCanceled" href="#ExportErrRequestCanceled">var ExportErrRequestCanceled</a>

```
searchKey: http.ExportErrRequestCanceled
tags: [private]
```

```Go
var ExportErrRequestCanceled = errRequestCanceled
```

### <a id="ExportErrRequestCanceledConn" href="#ExportErrRequestCanceledConn">var ExportErrRequestCanceledConn</a>

```
searchKey: http.ExportErrRequestCanceledConn
tags: [private]
```

```Go
var ExportErrRequestCanceledConn = errRequestCanceledConn
```

### <a id="ExportErrServerClosedIdle" href="#ExportErrServerClosedIdle">var ExportErrServerClosedIdle</a>

```
searchKey: http.ExportErrServerClosedIdle
tags: [private]
```

```Go
var ExportErrServerClosedIdle = errServerClosedIdle
```

### <a id="ExportServeFile" href="#ExportServeFile">var ExportServeFile</a>

```
searchKey: http.ExportServeFile
tags: [private]
```

```Go
var ExportServeFile = serveFile
```

### <a id="ExportScanETag" href="#ExportScanETag">var ExportScanETag</a>

```
searchKey: http.ExportScanETag
tags: [private]
```

```Go
var ExportScanETag = scanETag
```

### <a id="ExportHttp2ConfigureServer" href="#ExportHttp2ConfigureServer">var ExportHttp2ConfigureServer</a>

```
searchKey: http.ExportHttp2ConfigureServer
tags: [private]
```

```Go
var ExportHttp2ConfigureServer = http2ConfigureServer
```

### <a id="Export_shouldCopyHeaderOnRedirect" href="#Export_shouldCopyHeaderOnRedirect">var Export_shouldCopyHeaderOnRedirect</a>

```
searchKey: http.Export_shouldCopyHeaderOnRedirect
tags: [private]
```

```Go
var Export_shouldCopyHeaderOnRedirect = shouldCopyHeaderOnRedirect
```

### <a id="Export_writeStatusLine" href="#Export_writeStatusLine">var Export_writeStatusLine</a>

```
searchKey: http.Export_writeStatusLine
tags: [private]
```

```Go
var Export_writeStatusLine = writeStatusLine
```

### <a id="Export_is408Message" href="#Export_is408Message">var Export_is408Message</a>

```
searchKey: http.Export_is408Message
tags: [private]
```

```Go
var Export_is408Message = is408Message
```

### <a id="SetEnterRoundTripHook" href="#SetEnterRoundTripHook">var SetEnterRoundTripHook</a>

```
searchKey: http.SetEnterRoundTripHook
tags: [private]
```

```Go
var SetEnterRoundTripHook = hookSetter(&testHookEnterRoundTrip)
```

### <a id="SetRoundTripRetried" href="#SetRoundTripRetried">var SetRoundTripRetried</a>

```
searchKey: http.SetRoundTripRetried
tags: [private]
```

```Go
var SetRoundTripRetried = hookSetter(&testHookRoundTripRetried)
```

### <a id="headerWriteTests" href="#headerWriteTests">var headerWriteTests</a>

```
searchKey: http.headerWriteTests
tags: [private]
```

```Go
var headerWriteTests = ...
```

### <a id="parseTimeTests" href="#parseTimeTests">var parseTimeTests</a>

```
searchKey: http.parseTimeTests
tags: [private]
```

```Go
var parseTimeTests = ...
```

### <a id="hasTokenTests" href="#hasTokenTests">var hasTokenTests</a>

```
searchKey: http.hasTokenTests
tags: [private]
```

```Go
var hasTokenTests = ...
```

### <a id="testHeader" href="#testHeader">var testHeader</a>

```
searchKey: http.testHeader
tags: [private]
```

```Go
var testHeader = ...
```

### <a id="buf" href="#buf">var buf</a>

```
searchKey: http.buf
tags: [private]
```

```Go
var buf bytes.Buffer
```

### <a id="valuesCount" href="#valuesCount">var valuesCount</a>

```
searchKey: http.valuesCount
tags: [private]
```

```Go
var valuesCount int
```

### <a id="forbiddenStringsFunctions" href="#forbiddenStringsFunctions">var forbiddenStringsFunctions</a>

```
searchKey: http.forbiddenStringsFunctions
tags: [private]
```

```Go
var forbiddenStringsFunctions = ...
```

### <a id="cacheKeysTests" href="#cacheKeysTests">var cacheKeysTests</a>

```
searchKey: http.cacheKeysTests
tags: [private]
```

```Go
var cacheKeysTests = ...
```

### <a id="ParseRangeTests" href="#ParseRangeTests">var ParseRangeTests</a>

```
searchKey: http.ParseRangeTests
tags: [private]
```

```Go
var ParseRangeTests = ...
```

### <a id="noError" href="#noError">var noError</a>

```
searchKey: http.noError
tags: [private]
```

```Go
var noError = ""
```

### <a id="noBodyStr" href="#noBodyStr">var noBodyStr</a>

```
searchKey: http.noBodyStr
tags: [private]
```

```Go
var noBodyStr = ""
```

### <a id="noTrailer" href="#noTrailer">var noTrailer</a>

```
searchKey: http.noTrailer
tags: [private]
```

```Go
var noTrailer Header = nil
```

### <a id="reqTests" href="#reqTests">var reqTests</a>

```
searchKey: http.reqTests
tags: [private]
```

```Go
var reqTests = ...
```

### <a id="badRequestTests" href="#badRequestTests">var badRequestTests</a>

```
searchKey: http.badRequestTests
tags: [private]
```

```Go
var badRequestTests = ...
```

### <a id="reqWriteTests" href="#reqWriteTests">var reqWriteTests</a>

```
searchKey: http.reqWriteTests
tags: [private]
```

```Go
var reqWriteTests = ...
```

### <a id="respTests" href="#respTests">var respTests</a>

```
searchKey: http.respTests
tags: [private]
```

```Go
var respTests = ...
```

### <a id="readResponseCloseInMiddleTests" href="#readResponseCloseInMiddleTests">var readResponseCloseInMiddleTests</a>

```
searchKey: http.readResponseCloseInMiddleTests
tags: [private]
```

```Go
var readResponseCloseInMiddleTests = ...
```

### <a id="responseLocationTests" href="#responseLocationTests">var responseLocationTests</a>

```
searchKey: http.responseLocationTests
tags: [private]
```

```Go
var responseLocationTests = ...
```

## <a id="type" href="#type">Types</a>

### <a id="Client" href="#Client">type Client struct</a>

```
searchKey: http.Client
```

```Go
type Client struct {
	// Transport specifies the mechanism by which individual
	// HTTP requests are made.
	// If nil, DefaultTransport is used.
	Transport RoundTripper

	// CheckRedirect specifies the policy for handling redirects.
	// If CheckRedirect is not nil, the client calls it before
	// following an HTTP redirect. The arguments req and via are
	// the upcoming request and the requests made already, oldest
	// first. If CheckRedirect returns an error, the Client's Get
	// method returns both the previous Response (with its Body
	// closed) and CheckRedirect's error (wrapped in a url.Error)
	// instead of issuing the Request req.
	// As a special case, if CheckRedirect returns ErrUseLastResponse,
	// then the most recent response is returned with its body
	// unclosed, along with a nil error.
	//
	// If CheckRedirect is nil, the Client uses its default policy,
	// which is to stop after 10 consecutive requests.
	CheckRedirect func(req *Request, via []*Request) error

	// Jar specifies the cookie jar.
	//
	// The Jar is used to insert relevant cookies into every
	// outbound Request and is updated with the cookie values
	// of every inbound Response. The Jar is consulted for every
	// redirect that the Client follows.
	//
	// If Jar is nil, cookies are only sent if they are explicitly
	// set on the Request.
	Jar CookieJar

	// Timeout specifies a time limit for requests made by this
	// Client. The timeout includes connection time, any
	// redirects, and reading the response body. The timer remains
	// running after Get, Head, Post, or Do return and will
	// interrupt reading of the Response.Body.
	//
	// A Timeout of zero means no timeout.
	//
	// The Client cancels requests to the underlying Transport
	// as if the Request's Context ended.
	//
	// For compatibility, the Client will also use the deprecated
	// CancelRequest method on Transport if found. New
	// RoundTripper implementations should use the Request's Context
	// for cancellation instead of implementing CancelRequest.
	Timeout time.Duration
}
```

A Client is an HTTP client. Its zero value (DefaultClient) is a usable client that uses DefaultTransport. 

The Client's Transport typically has internal state (cached TCP connections), so Clients should be reused instead of created as needed. Clients are safe for concurrent use by multiple goroutines. 

A Client is higher-level than a RoundTripper (such as Transport) and additionally handles HTTP details such as cookies and redirects. 

When following redirects, the Client will forward all headers set on the initial Request except: 

• when forwarding sensitive headers like "Authorization", "WWW-Authenticate", and "Cookie" to untrusted targets. These headers will be ignored when following a redirect to a domain that is not a subdomain match or exact match of the initial domain. For example, a redirect from "foo.com" to either "foo.com" or "sub.foo.com" will forward the sensitive headers, but a redirect to "bar.com" will not. 

• when forwarding the "Cookie" header with a non-nil cookie Jar. Since each redirect may mutate the state of the cookie jar, a redirect may possibly alter a cookie set in the initial request. When forwarding the "Cookie" header, any mutated cookies will be omitted, with the expectation that the Jar will insert those mutated cookies with the updated values (assuming the origin matches). If Jar is nil, the initial cookies are forwarded without change. 

#### <a id="Client.send" href="#Client.send">func (c *Client) send(req *Request, deadline time.Time) (resp *Response, didTimeout func() bool, err error)</a>

```
searchKey: http.Client.send
tags: [private]
```

```Go
func (c *Client) send(req *Request, deadline time.Time) (resp *Response, didTimeout func() bool, err error)
```

didTimeout is non-nil only if err != nil. 

#### <a id="Client.deadline" href="#Client.deadline">func (c *Client) deadline() time.Time</a>

```
searchKey: http.Client.deadline
tags: [private]
```

```Go
func (c *Client) deadline() time.Time
```

#### <a id="Client.transport" href="#Client.transport">func (c *Client) transport() RoundTripper</a>

```
searchKey: http.Client.transport
tags: [private]
```

```Go
func (c *Client) transport() RoundTripper
```

#### <a id="Client.Get" href="#Client.Get">func (c *Client) Get(url string) (resp *Response, err error)</a>

```
searchKey: http.Client.Get
```

```Go
func (c *Client) Get(url string) (resp *Response, err error)
```

Get issues a GET to the specified URL. If the response is one of the following redirect codes, Get follows the redirect after calling the Client's CheckRedirect function: 

```
301 (Moved Permanently)
302 (Found)
303 (See Other)
307 (Temporary Redirect)
308 (Permanent Redirect)

```
An error is returned if the Client's CheckRedirect function fails or if there was an HTTP protocol error. A non-2xx response doesn't cause an error. Any returned error will be of type *url.Error. The url.Error value's Timeout method will report true if the request timed out. 

When err is nil, resp always contains a non-nil resp.Body. Caller should close resp.Body when done reading from it. 

To make a request with custom headers, use NewRequest and Client.Do. 

To make a request with a specified context.Context, use NewRequestWithContext and Client.Do. 

#### <a id="Client.checkRedirect" href="#Client.checkRedirect">func (c *Client) checkRedirect(req *Request, via []*Request) error</a>

```
searchKey: http.Client.checkRedirect
tags: [private]
```

```Go
func (c *Client) checkRedirect(req *Request, via []*Request) error
```

checkRedirect calls either the user's configured CheckRedirect function, or the default. 

#### <a id="Client.Do" href="#Client.Do">func (c *Client) Do(req *Request) (*Response, error)</a>

```
searchKey: http.Client.Do
```

```Go
func (c *Client) Do(req *Request) (*Response, error)
```

Do sends an HTTP request and returns an HTTP response, following policy (such as redirects, cookies, auth) as configured on the client. 

An error is returned if caused by client policy (such as CheckRedirect), or failure to speak HTTP (such as a network connectivity problem). A non-2xx status code doesn't cause an error. 

If the returned error is nil, the Response will contain a non-nil Body which the user is expected to close. If the Body is not both read to EOF and closed, the Client's underlying RoundTripper (typically Transport) may not be able to re-use a persistent TCP connection to the server for a subsequent "keep-alive" request. 

The request Body, if non-nil, will be closed by the underlying Transport, even on errors. 

On error, any Response can be ignored. A non-nil Response with a non-nil error only occurs when CheckRedirect fails, and even then the returned Response.Body is already closed. 

Generally Get, Post, or PostForm will be used instead of Do. 

If the server replies with a redirect, the Client first uses the CheckRedirect function to determine whether the redirect should be followed. If permitted, a 301, 302, or 303 redirect causes subsequent requests to use HTTP method GET (or HEAD if the original request was HEAD), with no body. A 307 or 308 redirect preserves the original HTTP method and body, provided that the Request.GetBody function is defined. The NewRequest function automatically sets GetBody for common standard library body types. 

Any returned error will be of type *url.Error. The url.Error value's Timeout method will report true if the request timed out. 

#### <a id="Client.do" href="#Client.do">func (c *Client) do(req *Request) (retres *Response, reterr error)</a>

```
searchKey: http.Client.do
tags: [private]
```

```Go
func (c *Client) do(req *Request) (retres *Response, reterr error)
```

#### <a id="Client.makeHeadersCopier" href="#Client.makeHeadersCopier">func (c *Client) makeHeadersCopier(ireq *Request) func(*Request)</a>

```
searchKey: http.Client.makeHeadersCopier
tags: [private]
```

```Go
func (c *Client) makeHeadersCopier(ireq *Request) func(*Request)
```

makeHeadersCopier makes a function that copies headers from the initial Request, ireq. For every redirect, this function must be called so that it can copy headers into the upcoming Request. 

#### <a id="Client.Post" href="#Client.Post">func (c *Client) Post(url, contentType string, body io.Reader) (resp *Response, err error)</a>

```
searchKey: http.Client.Post
```

```Go
func (c *Client) Post(url, contentType string, body io.Reader) (resp *Response, err error)
```

Post issues a POST to the specified URL. 

Caller should close resp.Body when done reading from it. 

If the provided body is an io.Closer, it is closed after the request. 

To set custom headers, use NewRequest and Client.Do. 

To make a request with a specified context.Context, use NewRequestWithContext and Client.Do. 

See the Client.Do method documentation for details on how redirects are handled. 

#### <a id="Client.PostForm" href="#Client.PostForm">func (c *Client) PostForm(url string, data url.Values) (resp *Response, err error)</a>

```
searchKey: http.Client.PostForm
```

```Go
func (c *Client) PostForm(url string, data url.Values) (resp *Response, err error)
```

PostForm issues a POST to the specified URL, with data's keys and values URL-encoded as the request body. 

The Content-Type header is set to application/x-www-form-urlencoded. To set other headers, use NewRequest and Client.Do. 

When err is nil, resp always contains a non-nil resp.Body. Caller should close resp.Body when done reading from it. 

See the Client.Do method documentation for details on how redirects are handled. 

To make a request with a specified context.Context, use NewRequestWithContext and Client.Do. 

#### <a id="Client.Head" href="#Client.Head">func (c *Client) Head(url string) (resp *Response, err error)</a>

```
searchKey: http.Client.Head
```

```Go
func (c *Client) Head(url string) (resp *Response, err error)
```

Head issues a HEAD to the specified URL. If the response is one of the following redirect codes, Head follows the redirect after calling the Client's CheckRedirect function: 

```
301 (Moved Permanently)
302 (Found)
303 (See Other)
307 (Temporary Redirect)
308 (Permanent Redirect)

```
To make a request with a specified context.Context, use NewRequestWithContext and Client.Do. 

#### <a id="Client.CloseIdleConnections" href="#Client.CloseIdleConnections">func (c *Client) CloseIdleConnections()</a>

```
searchKey: http.Client.CloseIdleConnections
```

```Go
func (c *Client) CloseIdleConnections()
```

CloseIdleConnections closes any connections on its Transport which were previously connected from previous requests but are now sitting idle in a "keep-alive" state. It does not interrupt any connections currently in use. 

If the Client's Transport does not have a CloseIdleConnections method then this method does nothing. 

### <a id="RoundTripper" href="#RoundTripper">type RoundTripper interface</a>

```
searchKey: http.RoundTripper
```

```Go
type RoundTripper interface {
	// RoundTrip executes a single HTTP transaction, returning
	// a Response for the provided Request.
	//
	// RoundTrip should not attempt to interpret the response. In
	// particular, RoundTrip must return err == nil if it obtained
	// a response, regardless of the response's HTTP status code.
	// A non-nil err should be reserved for failure to obtain a
	// response. Similarly, RoundTrip should not attempt to
	// handle higher-level protocol details such as redirects,
	// authentication, or cookies.
	//
	// RoundTrip should not modify the request, except for
	// consuming and closing the Request's Body. RoundTrip may
	// read fields of the request in a separate goroutine. Callers
	// should not mutate or reuse the request until the Response's
	// Body has been closed.
	//
	// RoundTrip must always close the body, including on errors,
	// but depending on the implementation may do so in a separate
	// goroutine even after RoundTrip returns. This means that
	// callers wanting to reuse the body for subsequent requests
	// must arrange to wait for the Close call before doing so.
	//
	// The Request's URL and Header fields must be initialized.
	RoundTrip(*Request) (*Response, error)
}
```

RoundTripper is an interface representing the ability to execute a single HTTP transaction, obtaining the Response for a given Request. 

A RoundTripper must be safe for concurrent use by multiple goroutines. 

#### <a id="NewFileTransport" href="#NewFileTransport">func NewFileTransport(fs FileSystem) RoundTripper</a>

```
searchKey: http.NewFileTransport
```

```Go
func NewFileTransport(fs FileSystem) RoundTripper
```

NewFileTransport returns a new RoundTripper, serving the provided FileSystem. The returned RoundTripper ignores the URL host in its incoming requests, as well as most other properties of the request. 

The typical use case for NewFileTransport is to register the "file" protocol with a Transport, as in: 

```
t := &http.Transport{}
t.RegisterProtocol("file", http.NewFileTransport(http.Dir("/")))
c := &http.Client{Transport: t}
res, err := c.Get("file:///etc/passwd")
...

```
### <a id="cancelTimerBody" href="#cancelTimerBody">type cancelTimerBody struct</a>

```
searchKey: http.cancelTimerBody
tags: [private]
```

```Go
type cancelTimerBody struct {
	stop          func() // stops the time.Timer waiting to cancel the request
	rc            io.ReadCloser
	reqDidTimeout func() bool
}
```

cancelTimerBody is an io.ReadCloser that wraps rc with two features: 1) on Read error or close, the stop func is called. 2) On Read failure, if reqDidTimeout is true, the error is wrapped and 

```
marked as net.Error that hit its timeout.

```
#### <a id="cancelTimerBody.Read" href="#cancelTimerBody.Read">func (b *cancelTimerBody) Read(p []byte) (n int, err error)</a>

```
searchKey: http.cancelTimerBody.Read
tags: [private]
```

```Go
func (b *cancelTimerBody) Read(p []byte) (n int, err error)
```

#### <a id="cancelTimerBody.Close" href="#cancelTimerBody.Close">func (b *cancelTimerBody) Close() error</a>

```
searchKey: http.cancelTimerBody.Close
tags: [private]
```

```Go
func (b *cancelTimerBody) Close() error
```

### <a id="Cookie" href="#Cookie">type Cookie struct</a>

```
searchKey: http.Cookie
```

```Go
type Cookie struct {
	Name  string
	Value string

	Path       string    // optional
	Domain     string    // optional
	Expires    time.Time // optional
	RawExpires string    // for reading cookies only

	// MaxAge=0 means no 'Max-Age' attribute specified.
	// MaxAge<0 means delete cookie now, equivalently 'Max-Age: 0'
	// MaxAge>0 means Max-Age attribute present and given in seconds
	MaxAge   int
	Secure   bool
	HttpOnly bool
	SameSite SameSite
	Raw      string
	Unparsed []string // Raw text of unparsed attribute-value pairs
}
```

A Cookie represents an HTTP cookie as sent in the Set-Cookie header of an HTTP response or the Cookie header of an HTTP request. 

See [https://tools.ietf.org/html/rfc6265](https://tools.ietf.org/html/rfc6265) for details. 

#### <a id="Cookie.String" href="#Cookie.String">func (c *Cookie) String() string</a>

```
searchKey: http.Cookie.String
```

```Go
func (c *Cookie) String() string
```

String returns the serialization of the cookie for use in a Cookie header (if only Name and Value are set) or a Set-Cookie response header (if other fields are set). If c is nil or c.Name is invalid, the empty string is returned. 

### <a id="SameSite" href="#SameSite">type SameSite int</a>

```
searchKey: http.SameSite
```

```Go
type SameSite int
```

SameSite allows a server to define a cookie attribute making it impossible for the browser to send this cookie along with cross-site requests. The main goal is to mitigate the risk of cross-origin information leakage, and provide some protection against cross-site request forgery attacks. 

See [https://tools.ietf.org/html/draft-ietf-httpbis-cookie-same-site-00](https://tools.ietf.org/html/draft-ietf-httpbis-cookie-same-site-00) for details. 

### <a id="fileTransport" href="#fileTransport">type fileTransport struct</a>

```
searchKey: http.fileTransport
tags: [private]
```

```Go
type fileTransport struct {
	fh fileHandler
}
```

fileTransport implements RoundTripper for the 'file' protocol. 

#### <a id="fileTransport.RoundTrip" href="#fileTransport.RoundTrip">func (t fileTransport) RoundTrip(req *Request) (resp *Response, err error)</a>

```
searchKey: http.fileTransport.RoundTrip
tags: [private]
```

```Go
func (t fileTransport) RoundTrip(req *Request) (resp *Response, err error)
```

### <a id="populateResponse" href="#populateResponse">type populateResponse struct</a>

```
searchKey: http.populateResponse
tags: [private]
```

```Go
type populateResponse struct {
	res          *Response
	ch           chan *Response
	wroteHeader  bool
	hasContent   bool
	sentResponse bool
	pw           *io.PipeWriter
}
```

populateResponse is a ResponseWriter that populates the *Response in res, and writes its body to a pipe connected to the response body. Once writes begin or finish() is called, the response is sent on ch. 

#### <a id="newPopulateResponseWriter" href="#newPopulateResponseWriter">func newPopulateResponseWriter() (*populateResponse, <-chan *Response)</a>

```
searchKey: http.newPopulateResponseWriter
tags: [private]
```

```Go
func newPopulateResponseWriter() (*populateResponse, <-chan *Response)
```

#### <a id="populateResponse.finish" href="#populateResponse.finish">func (pr *populateResponse) finish()</a>

```
searchKey: http.populateResponse.finish
tags: [private]
```

```Go
func (pr *populateResponse) finish()
```

#### <a id="populateResponse.sendResponse" href="#populateResponse.sendResponse">func (pr *populateResponse) sendResponse()</a>

```
searchKey: http.populateResponse.sendResponse
tags: [private]
```

```Go
func (pr *populateResponse) sendResponse()
```

#### <a id="populateResponse.Header" href="#populateResponse.Header">func (pr *populateResponse) Header() Header</a>

```
searchKey: http.populateResponse.Header
tags: [private]
```

```Go
func (pr *populateResponse) Header() Header
```

#### <a id="populateResponse.WriteHeader" href="#populateResponse.WriteHeader">func (pr *populateResponse) WriteHeader(code int)</a>

```
searchKey: http.populateResponse.WriteHeader
tags: [private]
```

```Go
func (pr *populateResponse) WriteHeader(code int)
```

#### <a id="populateResponse.Write" href="#populateResponse.Write">func (pr *populateResponse) Write(p []byte) (n int, err error)</a>

```
searchKey: http.populateResponse.Write
tags: [private]
```

```Go
func (pr *populateResponse) Write(p []byte) (n int, err error)
```

### <a id="Dir" href="#Dir">type Dir string</a>

```
searchKey: http.Dir
```

```Go
type Dir string
```

A Dir implements FileSystem using the native file system restricted to a specific directory tree. 

While the FileSystem.Open method takes '/'-separated paths, a Dir's string value is a filename on the native file system, not a URL, so it is separated by filepath.Separator, which isn't necessarily '/'. 

Note that Dir could expose sensitive files and directories. Dir will follow symlinks pointing out of the directory tree, which can be especially dangerous if serving from a directory in which users are able to create arbitrary symlinks. Dir will also allow access to files and directories starting with a period, which could expose sensitive directories like .git or sensitive files like .htpasswd. To exclude files with a leading period, remove the files/directories from the server or create a custom FileSystem implementation. 

An empty Dir is treated as ".". 

#### <a id="Dir.Open" href="#Dir.Open">func (d Dir) Open(name string) (File, error)</a>

```
searchKey: http.Dir.Open
```

```Go
func (d Dir) Open(name string) (File, error)
```

Open implements FileSystem using os.Open, opening files for reading rooted and relative to the directory d. 

### <a id="FileSystem" href="#FileSystem">type FileSystem interface</a>

```
searchKey: http.FileSystem
```

```Go
type FileSystem interface {
	Open(name string) (File, error)
}
```

A FileSystem implements access to a collection of named files. The elements in a file path are separated by slash ('/', U+002F) characters, regardless of host operating system convention. See the FileServer function to convert a FileSystem to a Handler. 

This interface predates the fs.FS interface, which can be used instead: the FS adapter function converts an fs.FS to a FileSystem. 

#### <a id="FS" href="#FS">func FS(fsys fs.FS) FileSystem</a>

```
searchKey: http.FS
```

```Go
func FS(fsys fs.FS) FileSystem
```

FS converts fsys to a FileSystem implementation, for use with FileServer and NewFileTransport. 

### <a id="File" href="#File">type File interface</a>

```
searchKey: http.File
```

```Go
type File interface {
	io.Closer
	io.Reader
	io.Seeker
	Readdir(count int) ([]fs.FileInfo, error)
	Stat() (fs.FileInfo, error)
}
```

A File is returned by a FileSystem's Open method and can be served by the FileServer implementation. 

The methods should behave the same as those on an *os.File. 

### <a id="anyDirs" href="#anyDirs">type anyDirs interface</a>

```
searchKey: http.anyDirs
tags: [private]
```

```Go
type anyDirs interface {
	len() int
	name(i int) string
	isDir(i int) bool
}
```

### <a id="fileInfoDirs" href="#fileInfoDirs">type fileInfoDirs []fs.FileInfo</a>

```
searchKey: http.fileInfoDirs
tags: [private]
```

```Go
type fileInfoDirs []fs.FileInfo
```

#### <a id="fileInfoDirs.len" href="#fileInfoDirs.len">func (d fileInfoDirs) len() int</a>

```
searchKey: http.fileInfoDirs.len
tags: [private]
```

```Go
func (d fileInfoDirs) len() int
```

#### <a id="fileInfoDirs.isDir" href="#fileInfoDirs.isDir">func (d fileInfoDirs) isDir(i int) bool</a>

```
searchKey: http.fileInfoDirs.isDir
tags: [private]
```

```Go
func (d fileInfoDirs) isDir(i int) bool
```

#### <a id="fileInfoDirs.name" href="#fileInfoDirs.name">func (d fileInfoDirs) name(i int) string</a>

```
searchKey: http.fileInfoDirs.name
tags: [private]
```

```Go
func (d fileInfoDirs) name(i int) string
```

### <a id="dirEntryDirs" href="#dirEntryDirs">type dirEntryDirs []fs.DirEntry</a>

```
searchKey: http.dirEntryDirs
tags: [private]
```

```Go
type dirEntryDirs []fs.DirEntry
```

#### <a id="dirEntryDirs.len" href="#dirEntryDirs.len">func (d dirEntryDirs) len() int</a>

```
searchKey: http.dirEntryDirs.len
tags: [private]
```

```Go
func (d dirEntryDirs) len() int
```

#### <a id="dirEntryDirs.isDir" href="#dirEntryDirs.isDir">func (d dirEntryDirs) isDir(i int) bool</a>

```
searchKey: http.dirEntryDirs.isDir
tags: [private]
```

```Go
func (d dirEntryDirs) isDir(i int) bool
```

#### <a id="dirEntryDirs.name" href="#dirEntryDirs.name">func (d dirEntryDirs) name(i int) string</a>

```
searchKey: http.dirEntryDirs.name
tags: [private]
```

```Go
func (d dirEntryDirs) name(i int) string
```

### <a id="condResult" href="#condResult">type condResult int</a>

```
searchKey: http.condResult
tags: [private]
```

```Go
type condResult int
```

condResult is the result of an HTTP request precondition check. See [https://tools.ietf.org/html/rfc7232](https://tools.ietf.org/html/rfc7232) section 3. 

#### <a id="checkIfMatch" href="#checkIfMatch">func checkIfMatch(w ResponseWriter, r *Request) condResult</a>

```
searchKey: http.checkIfMatch
tags: [private]
```

```Go
func checkIfMatch(w ResponseWriter, r *Request) condResult
```

#### <a id="checkIfUnmodifiedSince" href="#checkIfUnmodifiedSince">func checkIfUnmodifiedSince(r *Request, modtime time.Time) condResult</a>

```
searchKey: http.checkIfUnmodifiedSince
tags: [private]
```

```Go
func checkIfUnmodifiedSince(r *Request, modtime time.Time) condResult
```

#### <a id="checkIfNoneMatch" href="#checkIfNoneMatch">func checkIfNoneMatch(w ResponseWriter, r *Request) condResult</a>

```
searchKey: http.checkIfNoneMatch
tags: [private]
```

```Go
func checkIfNoneMatch(w ResponseWriter, r *Request) condResult
```

#### <a id="checkIfModifiedSince" href="#checkIfModifiedSince">func checkIfModifiedSince(r *Request, modtime time.Time) condResult</a>

```
searchKey: http.checkIfModifiedSince
tags: [private]
```

```Go
func checkIfModifiedSince(r *Request, modtime time.Time) condResult
```

#### <a id="checkIfRange" href="#checkIfRange">func checkIfRange(w ResponseWriter, r *Request, modtime time.Time) condResult</a>

```
searchKey: http.checkIfRange
tags: [private]
```

```Go
func checkIfRange(w ResponseWriter, r *Request, modtime time.Time) condResult
```

### <a id="fileHandler" href="#fileHandler">type fileHandler struct</a>

```
searchKey: http.fileHandler
tags: [private]
```

```Go
type fileHandler struct {
	root FileSystem
}
```

#### <a id="fileHandler.ServeHTTP" href="#fileHandler.ServeHTTP">func (f *fileHandler) ServeHTTP(w ResponseWriter, r *Request)</a>

```
searchKey: http.fileHandler.ServeHTTP
tags: [private]
```

```Go
func (f *fileHandler) ServeHTTP(w ResponseWriter, r *Request)
```

### <a id="ioFS" href="#ioFS">type ioFS struct</a>

```
searchKey: http.ioFS
tags: [private]
```

```Go
type ioFS struct {
	fsys fs.FS
}
```

#### <a id="ioFS.Open" href="#ioFS.Open">func (f ioFS) Open(name string) (File, error)</a>

```
searchKey: http.ioFS.Open
tags: [private]
```

```Go
func (f ioFS) Open(name string) (File, error)
```

### <a id="ioFile" href="#ioFile">type ioFile struct</a>

```
searchKey: http.ioFile
tags: [private]
```

```Go
type ioFile struct {
	file fs.File
}
```

#### <a id="ioFile.Close" href="#ioFile.Close">func (f ioFile) Close() error</a>

```
searchKey: http.ioFile.Close
tags: [private]
```

```Go
func (f ioFile) Close() error
```

#### <a id="ioFile.Read" href="#ioFile.Read">func (f ioFile) Read(b []byte) (int, error)</a>

```
searchKey: http.ioFile.Read
tags: [private]
```

```Go
func (f ioFile) Read(b []byte) (int, error)
```

#### <a id="ioFile.Stat" href="#ioFile.Stat">func (f ioFile) Stat() (fs.FileInfo, error)</a>

```
searchKey: http.ioFile.Stat
tags: [private]
```

```Go
func (f ioFile) Stat() (fs.FileInfo, error)
```

#### <a id="ioFile.Seek" href="#ioFile.Seek">func (f ioFile) Seek(offset int64, whence int) (int64, error)</a>

```
searchKey: http.ioFile.Seek
tags: [private]
```

```Go
func (f ioFile) Seek(offset int64, whence int) (int64, error)
```

#### <a id="ioFile.ReadDir" href="#ioFile.ReadDir">func (f ioFile) ReadDir(count int) ([]fs.DirEntry, error)</a>

```
searchKey: http.ioFile.ReadDir
tags: [private]
```

```Go
func (f ioFile) ReadDir(count int) ([]fs.DirEntry, error)
```

#### <a id="ioFile.Readdir" href="#ioFile.Readdir">func (f ioFile) Readdir(count int) ([]fs.FileInfo, error)</a>

```
searchKey: http.ioFile.Readdir
tags: [private]
```

```Go
func (f ioFile) Readdir(count int) ([]fs.FileInfo, error)
```

### <a id="httpRange" href="#httpRange">type httpRange struct</a>

```
searchKey: http.httpRange
tags: [private]
```

```Go
type httpRange struct {
	start, length int64
}
```

httpRange specifies the byte range to be sent to the client. 

#### <a id="httpRange.contentRange" href="#httpRange.contentRange">func (r httpRange) contentRange(size int64) string</a>

```
searchKey: http.httpRange.contentRange
tags: [private]
```

```Go
func (r httpRange) contentRange(size int64) string
```

#### <a id="httpRange.mimeHeader" href="#httpRange.mimeHeader">func (r httpRange) mimeHeader(contentType string, size int64) textproto.MIMEHeader</a>

```
searchKey: http.httpRange.mimeHeader
tags: [private]
```

```Go
func (r httpRange) mimeHeader(contentType string, size int64) textproto.MIMEHeader
```

### <a id="countingWriter" href="#countingWriter">type countingWriter int64</a>

```
searchKey: http.countingWriter
tags: [private]
```

```Go
type countingWriter int64
```

countingWriter counts how many bytes have been written to it. 

#### <a id="countingWriter.Write" href="#countingWriter.Write">func (w *countingWriter) Write(p []byte) (n int, err error)</a>

```
searchKey: http.countingWriter.Write
tags: [private]
```

```Go
func (w *countingWriter) Write(p []byte) (n int, err error)
```

### <a id="http2ClientConnPool" href="#http2ClientConnPool">type http2ClientConnPool interface</a>

```
searchKey: http.http2ClientConnPool
tags: [private]
```

```Go
type http2ClientConnPool interface {
	GetClientConn(req *Request, addr string) (*http2ClientConn, error)
	MarkDead(*http2ClientConn)
}
```

ClientConnPool manages a pool of HTTP/2 client connections. 

### <a id="http2clientConnPoolIdleCloser" href="#http2clientConnPoolIdleCloser">type http2clientConnPoolIdleCloser interface</a>

```
searchKey: http.http2clientConnPoolIdleCloser
tags: [private]
```

```Go
type http2clientConnPoolIdleCloser interface {
	http2ClientConnPool
	closeIdleConnections()
}
```

clientConnPoolIdleCloser is the interface implemented by ClientConnPool implementations which can close their idle connections. 

### <a id="http2clientConnPool" href="#http2clientConnPool">type http2clientConnPool struct</a>

```
searchKey: http.http2clientConnPool
tags: [private]
```

```Go
type http2clientConnPool struct {
	t *http2Transport

	mu sync.Mutex // TODO: maybe switch to RWMutex
	// TODO: add support for sharing conns based on cert names
	// (e.g. share conn for googleapis.com and appspot.com)
	conns        map[string][]*http2ClientConn // key is host:port
	dialing      map[string]*http2dialCall     // currently in-flight dials
	keys         map[*http2ClientConn][]string
	addConnCalls map[string]*http2addConnCall // in-flight addConnIfNeede calls
}
```

TODO: use singleflight for dialing and addConnCalls? 

#### <a id="http2clientConnPool.GetClientConn" href="#http2clientConnPool.GetClientConn">func (p *http2clientConnPool) GetClientConn(req *Request, addr string) (*http2ClientConn, error)</a>

```
searchKey: http.http2clientConnPool.GetClientConn
tags: [private]
```

```Go
func (p *http2clientConnPool) GetClientConn(req *Request, addr string) (*http2ClientConn, error)
```

#### <a id="http2clientConnPool.shouldTraceGetConn" href="#http2clientConnPool.shouldTraceGetConn">func (p *http2clientConnPool) shouldTraceGetConn(st http2clientConnIdleState) bool</a>

```
searchKey: http.http2clientConnPool.shouldTraceGetConn
tags: [private]
```

```Go
func (p *http2clientConnPool) shouldTraceGetConn(st http2clientConnIdleState) bool
```

shouldTraceGetConn reports whether getClientConn should call any ClientTrace.GetConn hook associated with the http.Request. 

This complexity is needed to avoid double calls of the GetConn hook during the back-and-forth between net/http and x/net/http2 (when the net/http.Transport is upgraded to also speak http2), as well as support the case where x/net/http2 is being used directly. 

#### <a id="http2clientConnPool.getClientConn" href="#http2clientConnPool.getClientConn">func (p *http2clientConnPool) getClientConn(req *Request, addr string, dialOnMiss bool) (*http2ClientConn, error)</a>

```
searchKey: http.http2clientConnPool.getClientConn
tags: [private]
```

```Go
func (p *http2clientConnPool) getClientConn(req *Request, addr string, dialOnMiss bool) (*http2ClientConn, error)
```

#### <a id="http2clientConnPool.getStartDialLocked" href="#http2clientConnPool.getStartDialLocked">func (p *http2clientConnPool) getStartDialLocked(ctx context.Context, addr string) *http2dialCall</a>

```
searchKey: http.http2clientConnPool.getStartDialLocked
tags: [private]
```

```Go
func (p *http2clientConnPool) getStartDialLocked(ctx context.Context, addr string) *http2dialCall
```

requires p.mu is held. 

#### <a id="http2clientConnPool.addConnIfNeeded" href="#http2clientConnPool.addConnIfNeeded">func (p *http2clientConnPool) addConnIfNeeded(key string, t *http2Transport, c *tls.Conn) (used bool, err error)</a>

```
searchKey: http.http2clientConnPool.addConnIfNeeded
tags: [private]
```

```Go
func (p *http2clientConnPool) addConnIfNeeded(key string, t *http2Transport, c *tls.Conn) (used bool, err error)
```

addConnIfNeeded makes a NewClientConn out of c if a connection for key doesn't already exist. It coalesces concurrent calls with the same key. This is used by the http1 Transport code when it creates a new connection. Because the http1 Transport doesn't de-dup TCP dials to outbound hosts (because it doesn't know the protocol), it can get into a situation where it has multiple TLS connections. This code decides which ones live or die. The return value used is whether c was used. c is never closed. 

#### <a id="http2clientConnPool.addConnLocked" href="#http2clientConnPool.addConnLocked">func (p *http2clientConnPool) addConnLocked(key string, cc *http2ClientConn)</a>

```
searchKey: http.http2clientConnPool.addConnLocked
tags: [private]
```

```Go
func (p *http2clientConnPool) addConnLocked(key string, cc *http2ClientConn)
```

p.mu must be held 

#### <a id="http2clientConnPool.MarkDead" href="#http2clientConnPool.MarkDead">func (p *http2clientConnPool) MarkDead(cc *http2ClientConn)</a>

```
searchKey: http.http2clientConnPool.MarkDead
tags: [private]
```

```Go
func (p *http2clientConnPool) MarkDead(cc *http2ClientConn)
```

#### <a id="http2clientConnPool.closeIdleConnections" href="#http2clientConnPool.closeIdleConnections">func (p *http2clientConnPool) closeIdleConnections()</a>

```
searchKey: http.http2clientConnPool.closeIdleConnections
tags: [private]
```

```Go
func (p *http2clientConnPool) closeIdleConnections()
```

### <a id="http2dialCall" href="#http2dialCall">type http2dialCall struct</a>

```
searchKey: http.http2dialCall
tags: [private]
```

```Go
type http2dialCall struct {
	_ http2incomparable
	p *http2clientConnPool
	// the context associated with the request
	// that created this dialCall
	ctx  context.Context
	done chan struct{}    // closed when done
	res  *http2ClientConn // valid after done is closed
	err  error            // valid after done is closed
}
```

dialCall is an in-flight Transport dial call to a host. 

#### <a id="http2dialCall.dial" href="#http2dialCall.dial">func (c *http2dialCall) dial(ctx context.Context, addr string)</a>

```
searchKey: http.http2dialCall.dial
tags: [private]
```

```Go
func (c *http2dialCall) dial(ctx context.Context, addr string)
```

run in its own goroutine. 

### <a id="http2addConnCall" href="#http2addConnCall">type http2addConnCall struct</a>

```
searchKey: http.http2addConnCall
tags: [private]
```

```Go
type http2addConnCall struct {
	_    http2incomparable
	p    *http2clientConnPool
	done chan struct{} // closed when done
	err  error
}
```

#### <a id="http2addConnCall.run" href="#http2addConnCall.run">func (c *http2addConnCall) run(t *http2Transport, key string, tc *tls.Conn)</a>

```
searchKey: http.http2addConnCall.run
tags: [private]
```

```Go
func (c *http2addConnCall) run(t *http2Transport, key string, tc *tls.Conn)
```

### <a id="http2noDialClientConnPool" href="#http2noDialClientConnPool">type http2noDialClientConnPool struct</a>

```
searchKey: http.http2noDialClientConnPool
tags: [private]
```

```Go
type http2noDialClientConnPool struct{ *http2clientConnPool }
```

noDialClientConnPool is an implementation of http2.ClientConnPool which never dials. We let the HTTP/1.1 client dial and use its TLS connection instead. 

#### <a id="http2noDialClientConnPool.GetClientConn" href="#http2noDialClientConnPool.GetClientConn">func (p http2noDialClientConnPool) GetClientConn(req *Request, addr string) (*http2ClientConn, error)</a>

```
searchKey: http.http2noDialClientConnPool.GetClientConn
tags: [private]
```

```Go
func (p http2noDialClientConnPool) GetClientConn(req *Request, addr string) (*http2ClientConn, error)
```

### <a id="http2dataBuffer" href="#http2dataBuffer">type http2dataBuffer struct</a>

```
searchKey: http.http2dataBuffer
tags: [private]
```

```Go
type http2dataBuffer struct {
	chunks   [][]byte
	r        int   // next byte to read is chunks[0][r]
	w        int   // next byte to write is chunks[len(chunks)-1][w]
	size     int   // total buffered bytes
	expected int64 // we expect at least this many bytes in future Write calls (ignored if <= 0)
}
```

dataBuffer is an io.ReadWriter backed by a list of data chunks. Each dataBuffer is used to read DATA frames on a single stream. The buffer is divided into chunks so the server can limit the total memory used by a single connection without limiting the request body size on any single stream. 

#### <a id="http2dataBuffer.Read" href="#http2dataBuffer.Read">func (b *http2dataBuffer) Read(p []byte) (int, error)</a>

```
searchKey: http.http2dataBuffer.Read
tags: [private]
```

```Go
func (b *http2dataBuffer) Read(p []byte) (int, error)
```

Read copies bytes from the buffer into p. It is an error to read when no data is available. 

#### <a id="http2dataBuffer.bytesFromFirstChunk" href="#http2dataBuffer.bytesFromFirstChunk">func (b *http2dataBuffer) bytesFromFirstChunk() []byte</a>

```
searchKey: http.http2dataBuffer.bytesFromFirstChunk
tags: [private]
```

```Go
func (b *http2dataBuffer) bytesFromFirstChunk() []byte
```

#### <a id="http2dataBuffer.Len" href="#http2dataBuffer.Len">func (b *http2dataBuffer) Len() int</a>

```
searchKey: http.http2dataBuffer.Len
tags: [private]
```

```Go
func (b *http2dataBuffer) Len() int
```

Len returns the number of bytes of the unread portion of the buffer. 

#### <a id="http2dataBuffer.Write" href="#http2dataBuffer.Write">func (b *http2dataBuffer) Write(p []byte) (int, error)</a>

```
searchKey: http.http2dataBuffer.Write
tags: [private]
```

```Go
func (b *http2dataBuffer) Write(p []byte) (int, error)
```

Write appends p to the buffer. 

#### <a id="http2dataBuffer.lastChunkOrAlloc" href="#http2dataBuffer.lastChunkOrAlloc">func (b *http2dataBuffer) lastChunkOrAlloc(want int64) []byte</a>

```
searchKey: http.http2dataBuffer.lastChunkOrAlloc
tags: [private]
```

```Go
func (b *http2dataBuffer) lastChunkOrAlloc(want int64) []byte
```

### <a id="http2ErrCode" href="#http2ErrCode">type http2ErrCode uint32</a>

```
searchKey: http.http2ErrCode
tags: [private]
```

```Go
type http2ErrCode uint32
```

An ErrCode is an unsigned 32-bit error code as defined in the HTTP/2 spec. 

#### <a id="http2ErrCode.String" href="#http2ErrCode.String">func (e http2ErrCode) String() string</a>

```
searchKey: http.http2ErrCode.String
tags: [private]
```

```Go
func (e http2ErrCode) String() string
```

### <a id="http2ConnectionError" href="#http2ConnectionError">type http2ConnectionError http.http2ErrCode</a>

```
searchKey: http.http2ConnectionError
tags: [private]
```

```Go
type http2ConnectionError http2ErrCode
```

ConnectionError is an error that results in the termination of the entire connection. 

#### <a id="http2ConnectionError.Error" href="#http2ConnectionError.Error">func (e http2ConnectionError) Error() string</a>

```
searchKey: http.http2ConnectionError.Error
tags: [private]
```

```Go
func (e http2ConnectionError) Error() string
```

### <a id="http2StreamError" href="#http2StreamError">type http2StreamError struct</a>

```
searchKey: http.http2StreamError
tags: [private]
```

```Go
type http2StreamError struct {
	StreamID uint32
	Code     http2ErrCode
	Cause    error // optional additional detail
}
```

StreamError is an error that only affects one stream within an HTTP/2 connection. 

#### <a id="http2streamError" href="#http2streamError">func http2streamError(id uint32, code http2ErrCode) http2StreamError</a>

```
searchKey: http.http2streamError
tags: [private]
```

```Go
func http2streamError(id uint32, code http2ErrCode) http2StreamError
```

#### <a id="http2StreamError.Error" href="#http2StreamError.Error">func (e http2StreamError) Error() string</a>

```
searchKey: http.http2StreamError.Error
tags: [private]
```

```Go
func (e http2StreamError) Error() string
```

#### <a id="http2StreamError.writeFrame" href="#http2StreamError.writeFrame">func (se http2StreamError) writeFrame(ctx http2writeContext) error</a>

```
searchKey: http.http2StreamError.writeFrame
tags: [private]
```

```Go
func (se http2StreamError) writeFrame(ctx http2writeContext) error
```

#### <a id="http2StreamError.staysWithinBuffer" href="#http2StreamError.staysWithinBuffer">func (se http2StreamError) staysWithinBuffer(max int) bool</a>

```
searchKey: http.http2StreamError.staysWithinBuffer
tags: [private]
```

```Go
func (se http2StreamError) staysWithinBuffer(max int) bool
```

### <a id="http2goAwayFlowError" href="#http2goAwayFlowError">type http2goAwayFlowError struct{}</a>

```
searchKey: http.http2goAwayFlowError
tags: [private]
```

```Go
type http2goAwayFlowError struct{}
```

6.9.1 The Flow Control Window "If a sender receives a WINDOW_UPDATE that causes a flow control window to exceed this maximum it MUST terminate either the stream or the connection, as appropriate. For streams, [...]; for the connection, a GOAWAY frame with a FLOW_CONTROL_ERROR code." 

#### <a id="http2goAwayFlowError.Error" href="#http2goAwayFlowError.Error">func (http2goAwayFlowError) Error() string</a>

```
searchKey: http.http2goAwayFlowError.Error
tags: [private]
```

```Go
func (http2goAwayFlowError) Error() string
```

### <a id="http2connError" href="#http2connError">type http2connError struct</a>

```
searchKey: http.http2connError
tags: [private]
```

```Go
type http2connError struct {
	Code   http2ErrCode // the ConnectionError error code
	Reason string       // additional reason
}
```

connError represents an HTTP/2 ConnectionError error code, along with a string (for debugging) explaining why. 

Errors of this type are only returned by the frame parser functions and converted into ConnectionError(Code), after stashing away the Reason into the Framer's errDetail field, accessible via the (*Framer).ErrorDetail method. 

#### <a id="http2connError.Error" href="#http2connError.Error">func (e http2connError) Error() string</a>

```
searchKey: http.http2connError.Error
tags: [private]
```

```Go
func (e http2connError) Error() string
```

### <a id="http2pseudoHeaderError" href="#http2pseudoHeaderError">type http2pseudoHeaderError string</a>

```
searchKey: http.http2pseudoHeaderError
tags: [private]
```

```Go
type http2pseudoHeaderError string
```

#### <a id="http2pseudoHeaderError.Error" href="#http2pseudoHeaderError.Error">func (e http2pseudoHeaderError) Error() string</a>

```
searchKey: http.http2pseudoHeaderError.Error
tags: [private]
```

```Go
func (e http2pseudoHeaderError) Error() string
```

### <a id="http2duplicatePseudoHeaderError" href="#http2duplicatePseudoHeaderError">type http2duplicatePseudoHeaderError string</a>

```
searchKey: http.http2duplicatePseudoHeaderError
tags: [private]
```

```Go
type http2duplicatePseudoHeaderError string
```

#### <a id="http2duplicatePseudoHeaderError.Error" href="#http2duplicatePseudoHeaderError.Error">func (e http2duplicatePseudoHeaderError) Error() string</a>

```
searchKey: http.http2duplicatePseudoHeaderError.Error
tags: [private]
```

```Go
func (e http2duplicatePseudoHeaderError) Error() string
```

### <a id="http2headerFieldNameError" href="#http2headerFieldNameError">type http2headerFieldNameError string</a>

```
searchKey: http.http2headerFieldNameError
tags: [private]
```

```Go
type http2headerFieldNameError string
```

#### <a id="http2headerFieldNameError.Error" href="#http2headerFieldNameError.Error">func (e http2headerFieldNameError) Error() string</a>

```
searchKey: http.http2headerFieldNameError.Error
tags: [private]
```

```Go
func (e http2headerFieldNameError) Error() string
```

### <a id="http2headerFieldValueError" href="#http2headerFieldValueError">type http2headerFieldValueError string</a>

```
searchKey: http.http2headerFieldValueError
tags: [private]
```

```Go
type http2headerFieldValueError string
```

#### <a id="http2headerFieldValueError.Error" href="#http2headerFieldValueError.Error">func (e http2headerFieldValueError) Error() string</a>

```
searchKey: http.http2headerFieldValueError.Error
tags: [private]
```

```Go
func (e http2headerFieldValueError) Error() string
```

### <a id="http2flow" href="#http2flow">type http2flow struct</a>

```
searchKey: http.http2flow
tags: [private]
```

```Go
type http2flow struct {
	_ http2incomparable

	// n is the number of DATA bytes we're allowed to send.
	// A flow is kept both on a conn and a per-stream.
	n int32

	// conn points to the shared connection-level flow that is
	// shared by all streams on that conn. It is nil for the flow
	// that's on the conn directly.
	conn *http2flow
}
```

flow is the flow control window's size. 

#### <a id="http2flow.setConnFlow" href="#http2flow.setConnFlow">func (f *http2flow) setConnFlow(cf *http2flow)</a>

```
searchKey: http.http2flow.setConnFlow
tags: [private]
```

```Go
func (f *http2flow) setConnFlow(cf *http2flow)
```

#### <a id="http2flow.available" href="#http2flow.available">func (f *http2flow) available() int32</a>

```
searchKey: http.http2flow.available
tags: [private]
```

```Go
func (f *http2flow) available() int32
```

#### <a id="http2flow.take" href="#http2flow.take">func (f *http2flow) take(n int32)</a>

```
searchKey: http.http2flow.take
tags: [private]
```

```Go
func (f *http2flow) take(n int32)
```

#### <a id="http2flow.add" href="#http2flow.add">func (f *http2flow) add(n int32) bool</a>

```
searchKey: http.http2flow.add
tags: [private]
```

```Go
func (f *http2flow) add(n int32) bool
```

add adds n bytes (positive or negative) to the flow control window. It returns false if the sum would exceed 2^31-1. 

### <a id="http2FrameType" href="#http2FrameType">type http2FrameType uint8</a>

```
searchKey: http.http2FrameType
tags: [private]
```

```Go
type http2FrameType uint8
```

A FrameType is a registered frame type as defined in [http://http2.github.io/http2-spec/#rfc.section.11.2](http://http2.github.io/http2-spec/#rfc.section.11.2) 

#### <a id="http2FrameType.String" href="#http2FrameType.String">func (t http2FrameType) String() string</a>

```
searchKey: http.http2FrameType.String
tags: [private]
```

```Go
func (t http2FrameType) String() string
```

### <a id="http2Flags" href="#http2Flags">type http2Flags uint8</a>

```
searchKey: http.http2Flags
tags: [private]
```

```Go
type http2Flags uint8
```

Flags is a bitmask of HTTP/2 flags. The meaning of flags varies depending on the frame type. 

#### <a id="http2Flags.Has" href="#http2Flags.Has">func (f http2Flags) Has(v http2Flags) bool</a>

```
searchKey: http.http2Flags.Has
tags: [private]
```

```Go
func (f http2Flags) Has(v http2Flags) bool
```

Has reports whether f contains all (0 or more) flags in v. 

### <a id="http2frameParser" href="#http2frameParser">type http2frameParser func(fc *std/net/http.http2frameCache, fh std/net/http.http2FrameHeader, payload []byte) (std/net/http.http2Frame, error)</a>

```
searchKey: http.http2frameParser
tags: [private]
```

```Go
type http2frameParser func(fc *http2frameCache, fh http2FrameHeader, payload []byte) (http2Frame, error)
```

a frameParser parses a frame given its FrameHeader and payload bytes. The length of payload will always equal fh.Length (which might be 0). 

#### <a id="http2typeFrameParser" href="#http2typeFrameParser">func http2typeFrameParser(t http2FrameType) http2frameParser</a>

```
searchKey: http.http2typeFrameParser
tags: [private]
```

```Go
func http2typeFrameParser(t http2FrameType) http2frameParser
```

### <a id="http2FrameHeader" href="#http2FrameHeader">type http2FrameHeader struct</a>

```
searchKey: http.http2FrameHeader
tags: [private]
```

```Go
type http2FrameHeader struct {
	valid bool // caller can access []byte fields in the Frame

	// Type is the 1 byte frame type. There are ten standard frame
	// types, but extension frame types may be written by WriteRawFrame
	// and will be returned by ReadFrame (as UnknownFrame).
	Type http2FrameType

	// Flags are the 1 byte of 8 potential bit flags per frame.
	// They are specific to the frame type.
	Flags http2Flags

	// Length is the length of the frame, not including the 9 byte header.
	// The maximum size is one byte less than 16MB (uint24), but only
	// frames up to 16KB are allowed without peer agreement.
	Length uint32

	// StreamID is which stream this frame is for. Certain frames
	// are not stream-specific, in which case this field is 0.
	StreamID uint32
}
```

A FrameHeader is the 9 byte header of all HTTP/2 frames. 

See [http://http2.github.io/http2-spec/#FrameHeader](http://http2.github.io/http2-spec/#FrameHeader) 

#### <a id="http2ReadFrameHeader" href="#http2ReadFrameHeader">func http2ReadFrameHeader(r io.Reader) (http2FrameHeader, error)</a>

```
searchKey: http.http2ReadFrameHeader
tags: [private]
```

```Go
func http2ReadFrameHeader(r io.Reader) (http2FrameHeader, error)
```

ReadFrameHeader reads 9 bytes from r and returns a FrameHeader. Most users should use Framer.ReadFrame instead. 

#### <a id="http2readFrameHeader" href="#http2readFrameHeader">func http2readFrameHeader(buf []byte, r io.Reader) (http2FrameHeader, error)</a>

```
searchKey: http.http2readFrameHeader
tags: [private]
```

```Go
func http2readFrameHeader(buf []byte, r io.Reader) (http2FrameHeader, error)
```

#### <a id="http2FrameHeader.Header" href="#http2FrameHeader.Header">func (h http2FrameHeader) Header() http2FrameHeader</a>

```
searchKey: http.http2FrameHeader.Header
tags: [private]
```

```Go
func (h http2FrameHeader) Header() http2FrameHeader
```

Header returns h. It exists so FrameHeaders can be embedded in other specific frame types and implement the Frame interface. 

#### <a id="http2FrameHeader.String" href="#http2FrameHeader.String">func (h http2FrameHeader) String() string</a>

```
searchKey: http.http2FrameHeader.String
tags: [private]
```

```Go
func (h http2FrameHeader) String() string
```

#### <a id="http2FrameHeader.writeDebug" href="#http2FrameHeader.writeDebug">func (h http2FrameHeader) writeDebug(buf *bytes.Buffer)</a>

```
searchKey: http.http2FrameHeader.writeDebug
tags: [private]
```

```Go
func (h http2FrameHeader) writeDebug(buf *bytes.Buffer)
```

#### <a id="http2FrameHeader.checkValid" href="#http2FrameHeader.checkValid">func (h *http2FrameHeader) checkValid()</a>

```
searchKey: http.http2FrameHeader.checkValid
tags: [private]
```

```Go
func (h *http2FrameHeader) checkValid()
```

#### <a id="http2FrameHeader.invalidate" href="#http2FrameHeader.invalidate">func (h *http2FrameHeader) invalidate()</a>

```
searchKey: http.http2FrameHeader.invalidate
tags: [private]
```

```Go
func (h *http2FrameHeader) invalidate()
```

### <a id="http2Frame" href="#http2Frame">type http2Frame interface</a>

```
searchKey: http.http2Frame
tags: [private]
```

```Go
type http2Frame interface {
	Header() http2FrameHeader

	// invalidate is called by Framer.ReadFrame to make this
	// frame's buffers as being invalid, since the subsequent
	// frame will reuse them.
	invalidate()
}
```

A Frame is the base interface implemented by all frame types. Callers will generally type-assert the specific frame type: *HeadersFrame, *SettingsFrame, *WindowUpdateFrame, etc. 

Frames are only valid until the next call to Framer.ReadFrame. 

#### <a id="http2parseDataFrame" href="#http2parseDataFrame">func http2parseDataFrame(fc *http2frameCache, fh http2FrameHeader, payload []byte) (http2Frame, error)</a>

```
searchKey: http.http2parseDataFrame
tags: [private]
```

```Go
func http2parseDataFrame(fc *http2frameCache, fh http2FrameHeader, payload []byte) (http2Frame, error)
```

#### <a id="http2parseSettingsFrame" href="#http2parseSettingsFrame">func http2parseSettingsFrame(_ *http2frameCache, fh http2FrameHeader, p []byte) (http2Frame, error)</a>

```
searchKey: http.http2parseSettingsFrame
tags: [private]
```

```Go
func http2parseSettingsFrame(_ *http2frameCache, fh http2FrameHeader, p []byte) (http2Frame, error)
```

#### <a id="http2parsePingFrame" href="#http2parsePingFrame">func http2parsePingFrame(_ *http2frameCache, fh http2FrameHeader, payload []byte) (http2Frame, error)</a>

```
searchKey: http.http2parsePingFrame
tags: [private]
```

```Go
func http2parsePingFrame(_ *http2frameCache, fh http2FrameHeader, payload []byte) (http2Frame, error)
```

#### <a id="http2parseGoAwayFrame" href="#http2parseGoAwayFrame">func http2parseGoAwayFrame(_ *http2frameCache, fh http2FrameHeader, p []byte) (http2Frame, error)</a>

```
searchKey: http.http2parseGoAwayFrame
tags: [private]
```

```Go
func http2parseGoAwayFrame(_ *http2frameCache, fh http2FrameHeader, p []byte) (http2Frame, error)
```

#### <a id="http2parseUnknownFrame" href="#http2parseUnknownFrame">func http2parseUnknownFrame(_ *http2frameCache, fh http2FrameHeader, p []byte) (http2Frame, error)</a>

```
searchKey: http.http2parseUnknownFrame
tags: [private]
```

```Go
func http2parseUnknownFrame(_ *http2frameCache, fh http2FrameHeader, p []byte) (http2Frame, error)
```

#### <a id="http2parseWindowUpdateFrame" href="#http2parseWindowUpdateFrame">func http2parseWindowUpdateFrame(_ *http2frameCache, fh http2FrameHeader, p []byte) (http2Frame, error)</a>

```
searchKey: http.http2parseWindowUpdateFrame
tags: [private]
```

```Go
func http2parseWindowUpdateFrame(_ *http2frameCache, fh http2FrameHeader, p []byte) (http2Frame, error)
```

#### <a id="http2parseHeadersFrame" href="#http2parseHeadersFrame">func http2parseHeadersFrame(_ *http2frameCache, fh http2FrameHeader, p []byte) (_ http2Frame, err error)</a>

```
searchKey: http.http2parseHeadersFrame
tags: [private]
```

```Go
func http2parseHeadersFrame(_ *http2frameCache, fh http2FrameHeader, p []byte) (_ http2Frame, err error)
```

#### <a id="http2parsePriorityFrame" href="#http2parsePriorityFrame">func http2parsePriorityFrame(_ *http2frameCache, fh http2FrameHeader, payload []byte) (http2Frame, error)</a>

```
searchKey: http.http2parsePriorityFrame
tags: [private]
```

```Go
func http2parsePriorityFrame(_ *http2frameCache, fh http2FrameHeader, payload []byte) (http2Frame, error)
```

#### <a id="http2parseRSTStreamFrame" href="#http2parseRSTStreamFrame">func http2parseRSTStreamFrame(_ *http2frameCache, fh http2FrameHeader, p []byte) (http2Frame, error)</a>

```
searchKey: http.http2parseRSTStreamFrame
tags: [private]
```

```Go
func http2parseRSTStreamFrame(_ *http2frameCache, fh http2FrameHeader, p []byte) (http2Frame, error)
```

#### <a id="http2parseContinuationFrame" href="#http2parseContinuationFrame">func http2parseContinuationFrame(_ *http2frameCache, fh http2FrameHeader, p []byte) (http2Frame, error)</a>

```
searchKey: http.http2parseContinuationFrame
tags: [private]
```

```Go
func http2parseContinuationFrame(_ *http2frameCache, fh http2FrameHeader, p []byte) (http2Frame, error)
```

#### <a id="http2parsePushPromise" href="#http2parsePushPromise">func http2parsePushPromise(_ *http2frameCache, fh http2FrameHeader, p []byte) (_ http2Frame, err error)</a>

```
searchKey: http.http2parsePushPromise
tags: [private]
```

```Go
func http2parsePushPromise(_ *http2frameCache, fh http2FrameHeader, p []byte) (_ http2Frame, err error)
```

### <a id="http2Framer" href="#http2Framer">type http2Framer struct</a>

```
searchKey: http.http2Framer
tags: [private]
```

```Go
type http2Framer struct {
	r         io.Reader
	lastFrame http2Frame
	errDetail error

	// lastHeaderStream is non-zero if the last frame was an
	// unfinished HEADERS/CONTINUATION.
	lastHeaderStream uint32

	maxReadSize uint32
	headerBuf   [http2frameHeaderLen]byte

	// TODO: let getReadBuf be configurable, and use a less memory-pinning
	// allocator in server.go to minimize memory pinned for many idle conns.
	// Will probably also need to make frame invalidation have a hook too.
	getReadBuf func(size uint32) []byte
	readBuf    []byte // cache for default getReadBuf

	maxWriteSize uint32 // zero means unlimited; TODO: implement

	w    io.Writer
	wbuf []byte

	// AllowIllegalWrites permits the Framer's Write methods to
	// write frames that do not conform to the HTTP/2 spec. This
	// permits using the Framer to test other HTTP/2
	// implementations' conformance to the spec.
	// If false, the Write methods will prefer to return an error
	// rather than comply.
	AllowIllegalWrites bool

	// AllowIllegalReads permits the Framer's ReadFrame method
	// to return non-compliant frames or frame orders.
	// This is for testing and permits using the Framer to test
	// other HTTP/2 implementations' conformance to the spec.
	// It is not compatible with ReadMetaHeaders.
	AllowIllegalReads bool

	// ReadMetaHeaders if non-nil causes ReadFrame to merge
	// HEADERS and CONTINUATION frames together and return
	// MetaHeadersFrame instead.
	ReadMetaHeaders *hpack.Decoder

	// MaxHeaderListSize is the http2 MAX_HEADER_LIST_SIZE.
	// It's used only if ReadMetaHeaders is set; 0 means a sane default
	// (currently 16MB)
	// If the limit is hit, MetaHeadersFrame.Truncated is set true.
	MaxHeaderListSize uint32

	logReads, logWrites bool

	debugFramer       *http2Framer // only use for logging written writes
	debugFramerBuf    *bytes.Buffer
	debugReadLoggerf  func(string, ...interface{})
	debugWriteLoggerf func(string, ...interface{})

	frameCache *http2frameCache // nil if frames aren't reused (default)
}
```

A Framer reads and writes Frames. 

#### <a id="http2NewFramer" href="#http2NewFramer">func http2NewFramer(w io.Writer, r io.Reader) *http2Framer</a>

```
searchKey: http.http2NewFramer
tags: [private]
```

```Go
func http2NewFramer(w io.Writer, r io.Reader) *http2Framer
```

NewFramer returns a Framer that writes frames to w and reads them from r. 

#### <a id="http2Framer.maxHeaderListSize" href="#http2Framer.maxHeaderListSize">func (fr *http2Framer) maxHeaderListSize() uint32</a>

```
searchKey: http.http2Framer.maxHeaderListSize
tags: [private]
```

```Go
func (fr *http2Framer) maxHeaderListSize() uint32
```

#### <a id="http2Framer.startWrite" href="#http2Framer.startWrite">func (f *http2Framer) startWrite(ftype http2FrameType, flags http2Flags, streamID uint32)</a>

```
searchKey: http.http2Framer.startWrite
tags: [private]
```

```Go
func (f *http2Framer) startWrite(ftype http2FrameType, flags http2Flags, streamID uint32)
```

#### <a id="http2Framer.endWrite" href="#http2Framer.endWrite">func (f *http2Framer) endWrite() error</a>

```
searchKey: http.http2Framer.endWrite
tags: [private]
```

```Go
func (f *http2Framer) endWrite() error
```

#### <a id="http2Framer.logWrite" href="#http2Framer.logWrite">func (f *http2Framer) logWrite()</a>

```
searchKey: http.http2Framer.logWrite
tags: [private]
```

```Go
func (f *http2Framer) logWrite()
```

#### <a id="http2Framer.writeByte" href="#http2Framer.writeByte">func (f *http2Framer) writeByte(v byte)</a>

```
searchKey: http.http2Framer.writeByte
tags: [private]
```

```Go
func (f *http2Framer) writeByte(v byte)
```

#### <a id="http2Framer.writeBytes" href="#http2Framer.writeBytes">func (f *http2Framer) writeBytes(v []byte)</a>

```
searchKey: http.http2Framer.writeBytes
tags: [private]
```

```Go
func (f *http2Framer) writeBytes(v []byte)
```

#### <a id="http2Framer.writeUint16" href="#http2Framer.writeUint16">func (f *http2Framer) writeUint16(v uint16)</a>

```
searchKey: http.http2Framer.writeUint16
tags: [private]
```

```Go
func (f *http2Framer) writeUint16(v uint16)
```

#### <a id="http2Framer.writeUint32" href="#http2Framer.writeUint32">func (f *http2Framer) writeUint32(v uint32)</a>

```
searchKey: http.http2Framer.writeUint32
tags: [private]
```

```Go
func (f *http2Framer) writeUint32(v uint32)
```

#### <a id="http2Framer.SetReuseFrames" href="#http2Framer.SetReuseFrames">func (fr *http2Framer) SetReuseFrames()</a>

```
searchKey: http.http2Framer.SetReuseFrames
tags: [private]
```

```Go
func (fr *http2Framer) SetReuseFrames()
```

SetReuseFrames allows the Framer to reuse Frames. If called on a Framer, Frames returned by calls to ReadFrame are only valid until the next call to ReadFrame. 

#### <a id="http2Framer.SetMaxReadFrameSize" href="#http2Framer.SetMaxReadFrameSize">func (fr *http2Framer) SetMaxReadFrameSize(v uint32)</a>

```
searchKey: http.http2Framer.SetMaxReadFrameSize
tags: [private]
```

```Go
func (fr *http2Framer) SetMaxReadFrameSize(v uint32)
```

SetMaxReadFrameSize sets the maximum size of a frame that will be read by a subsequent call to ReadFrame. It is the caller's responsibility to advertise this limit with a SETTINGS frame. 

#### <a id="http2Framer.ErrorDetail" href="#http2Framer.ErrorDetail">func (fr *http2Framer) ErrorDetail() error</a>

```
searchKey: http.http2Framer.ErrorDetail
tags: [private]
```

```Go
func (fr *http2Framer) ErrorDetail() error
```

ErrorDetail returns a more detailed error of the last error returned by Framer.ReadFrame. For instance, if ReadFrame returns a StreamError with code PROTOCOL_ERROR, ErrorDetail will say exactly what was invalid. ErrorDetail is not guaranteed to return a non-nil value and like the rest of the http2 package, its return value is not protected by an API compatibility promise. ErrorDetail is reset after the next call to ReadFrame. 

#### <a id="http2Framer.ReadFrame" href="#http2Framer.ReadFrame">func (fr *http2Framer) ReadFrame() (http2Frame, error)</a>

```
searchKey: http.http2Framer.ReadFrame
tags: [private]
```

```Go
func (fr *http2Framer) ReadFrame() (http2Frame, error)
```

ReadFrame reads a single frame. The returned Frame is only valid until the next call to ReadFrame. 

If the frame is larger than previously set with SetMaxReadFrameSize, the returned error is ErrFrameTooLarge. Other errors may be of type ConnectionError, StreamError, or anything else from the underlying reader. 

#### <a id="http2Framer.connError" href="#http2Framer.connError">func (fr *http2Framer) connError(code http2ErrCode, reason string) error</a>

```
searchKey: http.http2Framer.connError
tags: [private]
```

```Go
func (fr *http2Framer) connError(code http2ErrCode, reason string) error
```

connError returns ConnectionError(code) but first stashes away a public reason to the caller can optionally relay it to the peer before hanging up on them. This might help others debug their implementations. 

#### <a id="http2Framer.checkFrameOrder" href="#http2Framer.checkFrameOrder">func (fr *http2Framer) checkFrameOrder(f http2Frame) error</a>

```
searchKey: http.http2Framer.checkFrameOrder
tags: [private]
```

```Go
func (fr *http2Framer) checkFrameOrder(f http2Frame) error
```

checkFrameOrder reports an error if f is an invalid frame to return next from ReadFrame. Mostly it checks whether HEADERS and CONTINUATION frames are contiguous. 

#### <a id="http2Framer.WriteData" href="#http2Framer.WriteData">func (f *http2Framer) WriteData(streamID uint32, endStream bool, data []byte) error</a>

```
searchKey: http.http2Framer.WriteData
tags: [private]
```

```Go
func (f *http2Framer) WriteData(streamID uint32, endStream bool, data []byte) error
```

WriteData writes a DATA frame. 

It will perform exactly one Write to the underlying Writer. It is the caller's responsibility not to violate the maximum frame size and to not call other Write methods concurrently. 

#### <a id="http2Framer.WriteDataPadded" href="#http2Framer.WriteDataPadded">func (f *http2Framer) WriteDataPadded(streamID uint32, endStream bool, data, pad []byte) error</a>

```
searchKey: http.http2Framer.WriteDataPadded
tags: [private]
```

```Go
func (f *http2Framer) WriteDataPadded(streamID uint32, endStream bool, data, pad []byte) error
```

WriteDataPadded writes a DATA frame with optional padding. 

If pad is nil, the padding bit is not sent. The length of pad must not exceed 255 bytes. The bytes of pad must all be zero, unless f.AllowIllegalWrites is set. 

It will perform exactly one Write to the underlying Writer. It is the caller's responsibility not to violate the maximum frame size and to not call other Write methods concurrently. 

#### <a id="http2Framer.WriteSettings" href="#http2Framer.WriteSettings">func (f *http2Framer) WriteSettings(settings ...http2Setting) error</a>

```
searchKey: http.http2Framer.WriteSettings
tags: [private]
```

```Go
func (f *http2Framer) WriteSettings(settings ...http2Setting) error
```

WriteSettings writes a SETTINGS frame with zero or more settings specified and the ACK bit not set. 

It will perform exactly one Write to the underlying Writer. It is the caller's responsibility to not call other Write methods concurrently. 

#### <a id="http2Framer.WriteSettingsAck" href="#http2Framer.WriteSettingsAck">func (f *http2Framer) WriteSettingsAck() error</a>

```
searchKey: http.http2Framer.WriteSettingsAck
tags: [private]
```

```Go
func (f *http2Framer) WriteSettingsAck() error
```

WriteSettingsAck writes an empty SETTINGS frame with the ACK bit set. 

It will perform exactly one Write to the underlying Writer. It is the caller's responsibility to not call other Write methods concurrently. 

#### <a id="http2Framer.WritePing" href="#http2Framer.WritePing">func (f *http2Framer) WritePing(ack bool, data [8]byte) error</a>

```
searchKey: http.http2Framer.WritePing
tags: [private]
```

```Go
func (f *http2Framer) WritePing(ack bool, data [8]byte) error
```

#### <a id="http2Framer.WriteGoAway" href="#http2Framer.WriteGoAway">func (f *http2Framer) WriteGoAway(maxStreamID uint32, code http2ErrCode, debugData []byte) error</a>

```
searchKey: http.http2Framer.WriteGoAway
tags: [private]
```

```Go
func (f *http2Framer) WriteGoAway(maxStreamID uint32, code http2ErrCode, debugData []byte) error
```

#### <a id="http2Framer.WriteWindowUpdate" href="#http2Framer.WriteWindowUpdate">func (f *http2Framer) WriteWindowUpdate(streamID, incr uint32) error</a>

```
searchKey: http.http2Framer.WriteWindowUpdate
tags: [private]
```

```Go
func (f *http2Framer) WriteWindowUpdate(streamID, incr uint32) error
```

WriteWindowUpdate writes a WINDOW_UPDATE frame. The increment value must be between 1 and 2,147,483,647, inclusive. If the Stream ID is zero, the window update applies to the connection as a whole. 

#### <a id="http2Framer.WriteHeaders" href="#http2Framer.WriteHeaders">func (f *http2Framer) WriteHeaders(p http2HeadersFrameParam) error</a>

```
searchKey: http.http2Framer.WriteHeaders
tags: [private]
```

```Go
func (f *http2Framer) WriteHeaders(p http2HeadersFrameParam) error
```

WriteHeaders writes a single HEADERS frame. 

This is a low-level header writing method. Encoding headers and splitting them into any necessary CONTINUATION frames is handled elsewhere. 

It will perform exactly one Write to the underlying Writer. It is the caller's responsibility to not call other Write methods concurrently. 

#### <a id="http2Framer.WritePriority" href="#http2Framer.WritePriority">func (f *http2Framer) WritePriority(streamID uint32, p http2PriorityParam) error</a>

```
searchKey: http.http2Framer.WritePriority
tags: [private]
```

```Go
func (f *http2Framer) WritePriority(streamID uint32, p http2PriorityParam) error
```

WritePriority writes a PRIORITY frame. 

It will perform exactly one Write to the underlying Writer. It is the caller's responsibility to not call other Write methods concurrently. 

#### <a id="http2Framer.WriteRSTStream" href="#http2Framer.WriteRSTStream">func (f *http2Framer) WriteRSTStream(streamID uint32, code http2ErrCode) error</a>

```
searchKey: http.http2Framer.WriteRSTStream
tags: [private]
```

```Go
func (f *http2Framer) WriteRSTStream(streamID uint32, code http2ErrCode) error
```

WriteRSTStream writes a RST_STREAM frame. 

It will perform exactly one Write to the underlying Writer. It is the caller's responsibility to not call other Write methods concurrently. 

#### <a id="http2Framer.WriteContinuation" href="#http2Framer.WriteContinuation">func (f *http2Framer) WriteContinuation(streamID uint32, endHeaders bool, headerBlockFragment []byte) error</a>

```
searchKey: http.http2Framer.WriteContinuation
tags: [private]
```

```Go
func (f *http2Framer) WriteContinuation(streamID uint32, endHeaders bool, headerBlockFragment []byte) error
```

WriteContinuation writes a CONTINUATION frame. 

It will perform exactly one Write to the underlying Writer. It is the caller's responsibility to not call other Write methods concurrently. 

#### <a id="http2Framer.WritePushPromise" href="#http2Framer.WritePushPromise">func (f *http2Framer) WritePushPromise(p http2PushPromiseParam) error</a>

```
searchKey: http.http2Framer.WritePushPromise
tags: [private]
```

```Go
func (f *http2Framer) WritePushPromise(p http2PushPromiseParam) error
```

WritePushPromise writes a single PushPromise Frame. 

As with Header Frames, This is the low level call for writing individual frames. Continuation frames are handled elsewhere. 

It will perform exactly one Write to the underlying Writer. It is the caller's responsibility to not call other Write methods concurrently. 

#### <a id="http2Framer.WriteRawFrame" href="#http2Framer.WriteRawFrame">func (f *http2Framer) WriteRawFrame(t http2FrameType, flags http2Flags, streamID uint32, payload []byte) error</a>

```
searchKey: http.http2Framer.WriteRawFrame
tags: [private]
```

```Go
func (f *http2Framer) WriteRawFrame(t http2FrameType, flags http2Flags, streamID uint32, payload []byte) error
```

WriteRawFrame writes a raw frame. This can be used to write extension frames unknown to this package. 

#### <a id="http2Framer.maxHeaderStringLen" href="#http2Framer.maxHeaderStringLen">func (fr *http2Framer) maxHeaderStringLen() int</a>

```
searchKey: http.http2Framer.maxHeaderStringLen
tags: [private]
```

```Go
func (fr *http2Framer) maxHeaderStringLen() int
```

#### <a id="http2Framer.readMetaFrame" href="#http2Framer.readMetaFrame">func (fr *http2Framer) readMetaFrame(hf *http2HeadersFrame) (*http2MetaHeadersFrame, error)</a>

```
searchKey: http.http2Framer.readMetaFrame
tags: [private]
```

```Go
func (fr *http2Framer) readMetaFrame(hf *http2HeadersFrame) (*http2MetaHeadersFrame, error)
```

readMetaFrame returns 0 or more CONTINUATION frames from fr and merge them into the provided hf and returns a MetaHeadersFrame with the decoded hpack values. 

### <a id="http2frameCache" href="#http2frameCache">type http2frameCache struct</a>

```
searchKey: http.http2frameCache
tags: [private]
```

```Go
type http2frameCache struct {
	dataFrame http2DataFrame
}
```

#### <a id="http2frameCache.getDataFrame" href="#http2frameCache.getDataFrame">func (fc *http2frameCache) getDataFrame() *http2DataFrame</a>

```
searchKey: http.http2frameCache.getDataFrame
tags: [private]
```

```Go
func (fc *http2frameCache) getDataFrame() *http2DataFrame
```

### <a id="http2DataFrame" href="#http2DataFrame">type http2DataFrame struct</a>

```
searchKey: http.http2DataFrame
tags: [private]
```

```Go
type http2DataFrame struct {
	http2FrameHeader
	data []byte
}
```

A DataFrame conveys arbitrary, variable-length sequences of octets associated with a stream. See [http://http2.github.io/http2-spec/#rfc.section.6.1](http://http2.github.io/http2-spec/#rfc.section.6.1) 

#### <a id="http2DataFrame.StreamEnded" href="#http2DataFrame.StreamEnded">func (f *http2DataFrame) StreamEnded() bool</a>

```
searchKey: http.http2DataFrame.StreamEnded
tags: [private]
```

```Go
func (f *http2DataFrame) StreamEnded() bool
```

#### <a id="http2DataFrame.Data" href="#http2DataFrame.Data">func (f *http2DataFrame) Data() []byte</a>

```
searchKey: http.http2DataFrame.Data
tags: [private]
```

```Go
func (f *http2DataFrame) Data() []byte
```

Data returns the frame's data octets, not including any padding size byte or padding suffix bytes. The caller must not retain the returned memory past the next call to ReadFrame. 

### <a id="http2SettingsFrame" href="#http2SettingsFrame">type http2SettingsFrame struct</a>

```
searchKey: http.http2SettingsFrame
tags: [private]
```

```Go
type http2SettingsFrame struct {
	http2FrameHeader
	p []byte
}
```

A SettingsFrame conveys configuration parameters that affect how endpoints communicate, such as preferences and constraints on peer behavior. 

See [http://http2.github.io/http2-spec/#SETTINGS](http://http2.github.io/http2-spec/#SETTINGS) 

#### <a id="http2SettingsFrame.IsAck" href="#http2SettingsFrame.IsAck">func (f *http2SettingsFrame) IsAck() bool</a>

```
searchKey: http.http2SettingsFrame.IsAck
tags: [private]
```

```Go
func (f *http2SettingsFrame) IsAck() bool
```

#### <a id="http2SettingsFrame.Value" href="#http2SettingsFrame.Value">func (f *http2SettingsFrame) Value(id http2SettingID) (v uint32, ok bool)</a>

```
searchKey: http.http2SettingsFrame.Value
tags: [private]
```

```Go
func (f *http2SettingsFrame) Value(id http2SettingID) (v uint32, ok bool)
```

#### <a id="http2SettingsFrame.Setting" href="#http2SettingsFrame.Setting">func (f *http2SettingsFrame) Setting(i int) http2Setting</a>

```
searchKey: http.http2SettingsFrame.Setting
tags: [private]
```

```Go
func (f *http2SettingsFrame) Setting(i int) http2Setting
```

Setting returns the setting from the frame at the given 0-based index. The index must be >= 0 and less than f.NumSettings(). 

#### <a id="http2SettingsFrame.NumSettings" href="#http2SettingsFrame.NumSettings">func (f *http2SettingsFrame) NumSettings() int</a>

```
searchKey: http.http2SettingsFrame.NumSettings
tags: [private]
```

```Go
func (f *http2SettingsFrame) NumSettings() int
```

#### <a id="http2SettingsFrame.HasDuplicates" href="#http2SettingsFrame.HasDuplicates">func (f *http2SettingsFrame) HasDuplicates() bool</a>

```
searchKey: http.http2SettingsFrame.HasDuplicates
tags: [private]
```

```Go
func (f *http2SettingsFrame) HasDuplicates() bool
```

HasDuplicates reports whether f contains any duplicate setting IDs. 

#### <a id="http2SettingsFrame.ForeachSetting" href="#http2SettingsFrame.ForeachSetting">func (f *http2SettingsFrame) ForeachSetting(fn func(http2Setting) error) error</a>

```
searchKey: http.http2SettingsFrame.ForeachSetting
tags: [private]
```

```Go
func (f *http2SettingsFrame) ForeachSetting(fn func(http2Setting) error) error
```

ForeachSetting runs fn for each setting. It stops and returns the first error. 

### <a id="http2PingFrame" href="#http2PingFrame">type http2PingFrame struct</a>

```
searchKey: http.http2PingFrame
tags: [private]
```

```Go
type http2PingFrame struct {
	http2FrameHeader
	Data [8]byte
}
```

A PingFrame is a mechanism for measuring a minimal round trip time from the sender, as well as determining whether an idle connection is still functional. See [http://http2.github.io/http2-spec/#rfc.section.6.7](http://http2.github.io/http2-spec/#rfc.section.6.7) 

#### <a id="http2PingFrame.IsAck" href="#http2PingFrame.IsAck">func (f *http2PingFrame) IsAck() bool</a>

```
searchKey: http.http2PingFrame.IsAck
tags: [private]
```

```Go
func (f *http2PingFrame) IsAck() bool
```

### <a id="http2GoAwayFrame" href="#http2GoAwayFrame">type http2GoAwayFrame struct</a>

```
searchKey: http.http2GoAwayFrame
tags: [private]
```

```Go
type http2GoAwayFrame struct {
	http2FrameHeader
	LastStreamID uint32
	ErrCode      http2ErrCode
	debugData    []byte
}
```

A GoAwayFrame informs the remote peer to stop creating streams on this connection. See [http://http2.github.io/http2-spec/#rfc.section.6.8](http://http2.github.io/http2-spec/#rfc.section.6.8) 

#### <a id="http2GoAwayFrame.DebugData" href="#http2GoAwayFrame.DebugData">func (f *http2GoAwayFrame) DebugData() []byte</a>

```
searchKey: http.http2GoAwayFrame.DebugData
tags: [private]
```

```Go
func (f *http2GoAwayFrame) DebugData() []byte
```

DebugData returns any debug data in the GOAWAY frame. Its contents are not defined. The caller must not retain the returned memory past the next call to ReadFrame. 

### <a id="http2UnknownFrame" href="#http2UnknownFrame">type http2UnknownFrame struct</a>

```
searchKey: http.http2UnknownFrame
tags: [private]
```

```Go
type http2UnknownFrame struct {
	http2FrameHeader
	p []byte
}
```

An UnknownFrame is the frame type returned when the frame type is unknown or no specific frame type parser exists. 

#### <a id="http2UnknownFrame.Payload" href="#http2UnknownFrame.Payload">func (f *http2UnknownFrame) Payload() []byte</a>

```
searchKey: http.http2UnknownFrame.Payload
tags: [private]
```

```Go
func (f *http2UnknownFrame) Payload() []byte
```

Payload returns the frame's payload (after the header).  It is not valid to call this method after a subsequent call to Framer.ReadFrame, nor is it valid to retain the returned slice. The memory is owned by the Framer and is invalidated when the next frame is read. 

### <a id="http2WindowUpdateFrame" href="#http2WindowUpdateFrame">type http2WindowUpdateFrame struct</a>

```
searchKey: http.http2WindowUpdateFrame
tags: [private]
```

```Go
type http2WindowUpdateFrame struct {
	http2FrameHeader
	Increment uint32 // never read with high bit set
}
```

A WindowUpdateFrame is used to implement flow control. See [http://http2.github.io/http2-spec/#rfc.section.6.9](http://http2.github.io/http2-spec/#rfc.section.6.9) 

### <a id="http2HeadersFrame" href="#http2HeadersFrame">type http2HeadersFrame struct</a>

```
searchKey: http.http2HeadersFrame
tags: [private]
```

```Go
type http2HeadersFrame struct {
	http2FrameHeader

	// Priority is set if FlagHeadersPriority is set in the FrameHeader.
	Priority http2PriorityParam

	headerFragBuf []byte // not owned
}
```

A HeadersFrame is used to open a stream and additionally carries a header block fragment. 

#### <a id="http2HeadersFrame.HeaderBlockFragment" href="#http2HeadersFrame.HeaderBlockFragment">func (f *http2HeadersFrame) HeaderBlockFragment() []byte</a>

```
searchKey: http.http2HeadersFrame.HeaderBlockFragment
tags: [private]
```

```Go
func (f *http2HeadersFrame) HeaderBlockFragment() []byte
```

#### <a id="http2HeadersFrame.HeadersEnded" href="#http2HeadersFrame.HeadersEnded">func (f *http2HeadersFrame) HeadersEnded() bool</a>

```
searchKey: http.http2HeadersFrame.HeadersEnded
tags: [private]
```

```Go
func (f *http2HeadersFrame) HeadersEnded() bool
```

#### <a id="http2HeadersFrame.StreamEnded" href="#http2HeadersFrame.StreamEnded">func (f *http2HeadersFrame) StreamEnded() bool</a>

```
searchKey: http.http2HeadersFrame.StreamEnded
tags: [private]
```

```Go
func (f *http2HeadersFrame) StreamEnded() bool
```

#### <a id="http2HeadersFrame.HasPriority" href="#http2HeadersFrame.HasPriority">func (f *http2HeadersFrame) HasPriority() bool</a>

```
searchKey: http.http2HeadersFrame.HasPriority
tags: [private]
```

```Go
func (f *http2HeadersFrame) HasPriority() bool
```

### <a id="http2HeadersFrameParam" href="#http2HeadersFrameParam">type http2HeadersFrameParam struct</a>

```
searchKey: http.http2HeadersFrameParam
tags: [private]
```

```Go
type http2HeadersFrameParam struct {
	// StreamID is the required Stream ID to initiate.
	StreamID uint32
	// BlockFragment is part (or all) of a Header Block.
	BlockFragment []byte

	// EndStream indicates that the header block is the last that
	// the endpoint will send for the identified stream. Setting
	// this flag causes the stream to enter one of "half closed"
	// states.
	EndStream bool

	// EndHeaders indicates that this frame contains an entire
	// header block and is not followed by any
	// CONTINUATION frames.
	EndHeaders bool

	// PadLength is the optional number of bytes of zeros to add
	// to this frame.
	PadLength uint8

	// Priority, if non-zero, includes stream priority information
	// in the HEADER frame.
	Priority http2PriorityParam
}
```

HeadersFrameParam are the parameters for writing a HEADERS frame. 

### <a id="http2PriorityFrame" href="#http2PriorityFrame">type http2PriorityFrame struct</a>

```
searchKey: http.http2PriorityFrame
tags: [private]
```

```Go
type http2PriorityFrame struct {
	http2FrameHeader
	http2PriorityParam
}
```

A PriorityFrame specifies the sender-advised priority of a stream. See [http://http2.github.io/http2-spec/#rfc.section.6.3](http://http2.github.io/http2-spec/#rfc.section.6.3) 

### <a id="http2PriorityParam" href="#http2PriorityParam">type http2PriorityParam struct</a>

```
searchKey: http.http2PriorityParam
tags: [private]
```

```Go
type http2PriorityParam struct {
	// StreamDep is a 31-bit stream identifier for the
	// stream that this stream depends on. Zero means no
	// dependency.
	StreamDep uint32

	// Exclusive is whether the dependency is exclusive.
	Exclusive bool

	// Weight is the stream's zero-indexed weight. It should be
	// set together with StreamDep, or neither should be set. Per
	// the spec, "Add one to the value to obtain a weight between
	// 1 and 256."
	Weight uint8
}
```

PriorityParam are the stream prioritzation parameters. 

#### <a id="http2PriorityParam.IsZero" href="#http2PriorityParam.IsZero">func (p http2PriorityParam) IsZero() bool</a>

```
searchKey: http.http2PriorityParam.IsZero
tags: [private]
```

```Go
func (p http2PriorityParam) IsZero() bool
```

### <a id="http2RSTStreamFrame" href="#http2RSTStreamFrame">type http2RSTStreamFrame struct</a>

```
searchKey: http.http2RSTStreamFrame
tags: [private]
```

```Go
type http2RSTStreamFrame struct {
	http2FrameHeader
	ErrCode http2ErrCode
}
```

A RSTStreamFrame allows for abnormal termination of a stream. See [http://http2.github.io/http2-spec/#rfc.section.6.4](http://http2.github.io/http2-spec/#rfc.section.6.4) 

### <a id="http2ContinuationFrame" href="#http2ContinuationFrame">type http2ContinuationFrame struct</a>

```
searchKey: http.http2ContinuationFrame
tags: [private]
```

```Go
type http2ContinuationFrame struct {
	http2FrameHeader
	headerFragBuf []byte
}
```

A ContinuationFrame is used to continue a sequence of header block fragments. See [http://http2.github.io/http2-spec/#rfc.section.6.10](http://http2.github.io/http2-spec/#rfc.section.6.10) 

#### <a id="http2ContinuationFrame.HeaderBlockFragment" href="#http2ContinuationFrame.HeaderBlockFragment">func (f *http2ContinuationFrame) HeaderBlockFragment() []byte</a>

```
searchKey: http.http2ContinuationFrame.HeaderBlockFragment
tags: [private]
```

```Go
func (f *http2ContinuationFrame) HeaderBlockFragment() []byte
```

#### <a id="http2ContinuationFrame.HeadersEnded" href="#http2ContinuationFrame.HeadersEnded">func (f *http2ContinuationFrame) HeadersEnded() bool</a>

```
searchKey: http.http2ContinuationFrame.HeadersEnded
tags: [private]
```

```Go
func (f *http2ContinuationFrame) HeadersEnded() bool
```

### <a id="http2PushPromiseFrame" href="#http2PushPromiseFrame">type http2PushPromiseFrame struct</a>

```
searchKey: http.http2PushPromiseFrame
tags: [private]
```

```Go
type http2PushPromiseFrame struct {
	http2FrameHeader
	PromiseID     uint32
	headerFragBuf []byte // not owned
}
```

A PushPromiseFrame is used to initiate a server stream. See [http://http2.github.io/http2-spec/#rfc.section.6.6](http://http2.github.io/http2-spec/#rfc.section.6.6) 

#### <a id="http2PushPromiseFrame.HeaderBlockFragment" href="#http2PushPromiseFrame.HeaderBlockFragment">func (f *http2PushPromiseFrame) HeaderBlockFragment() []byte</a>

```
searchKey: http.http2PushPromiseFrame.HeaderBlockFragment
tags: [private]
```

```Go
func (f *http2PushPromiseFrame) HeaderBlockFragment() []byte
```

#### <a id="http2PushPromiseFrame.HeadersEnded" href="#http2PushPromiseFrame.HeadersEnded">func (f *http2PushPromiseFrame) HeadersEnded() bool</a>

```
searchKey: http.http2PushPromiseFrame.HeadersEnded
tags: [private]
```

```Go
func (f *http2PushPromiseFrame) HeadersEnded() bool
```

### <a id="http2PushPromiseParam" href="#http2PushPromiseParam">type http2PushPromiseParam struct</a>

```
searchKey: http.http2PushPromiseParam
tags: [private]
```

```Go
type http2PushPromiseParam struct {
	// StreamID is the required Stream ID to initiate.
	StreamID uint32

	// PromiseID is the required Stream ID which this
	// Push Promises
	PromiseID uint32

	// BlockFragment is part (or all) of a Header Block.
	BlockFragment []byte

	// EndHeaders indicates that this frame contains an entire
	// header block and is not followed by any
	// CONTINUATION frames.
	EndHeaders bool

	// PadLength is the optional number of bytes of zeros to add
	// to this frame.
	PadLength uint8
}
```

PushPromiseParam are the parameters for writing a PUSH_PROMISE frame. 

### <a id="http2streamEnder" href="#http2streamEnder">type http2streamEnder interface</a>

```
searchKey: http.http2streamEnder
tags: [private]
```

```Go
type http2streamEnder interface {
	StreamEnded() bool
}
```

### <a id="http2headersEnder" href="#http2headersEnder">type http2headersEnder interface</a>

```
searchKey: http.http2headersEnder
tags: [private]
```

```Go
type http2headersEnder interface {
	HeadersEnded() bool
}
```

### <a id="http2headersOrContinuation" href="#http2headersOrContinuation">type http2headersOrContinuation interface</a>

```
searchKey: http.http2headersOrContinuation
tags: [private]
```

```Go
type http2headersOrContinuation interface {
	http2headersEnder
	HeaderBlockFragment() []byte
}
```

### <a id="http2MetaHeadersFrame" href="#http2MetaHeadersFrame">type http2MetaHeadersFrame struct</a>

```
searchKey: http.http2MetaHeadersFrame
tags: [private]
```

```Go
type http2MetaHeadersFrame struct {
	*http2HeadersFrame

	// Fields are the fields contained in the HEADERS and
	// CONTINUATION frames. The underlying slice is owned by the
	// Framer and must not be retained after the next call to
	// ReadFrame.
	//
	// Fields are guaranteed to be in the correct http2 order and
	// not have unknown pseudo header fields or invalid header
	// field names or values. Required pseudo header fields may be
	// missing, however. Use the MetaHeadersFrame.Pseudo accessor
	// method access pseudo headers.
	Fields []hpack.HeaderField

	// Truncated is whether the max header list size limit was hit
	// and Fields is incomplete. The hpack decoder state is still
	// valid, however.
	Truncated bool
}
```

A MetaHeadersFrame is the representation of one HEADERS frame and zero or more contiguous CONTINUATION frames and the decoding of their HPACK-encoded contents. 

This type of frame does not appear on the wire and is only returned by the Framer when Framer.ReadMetaHeaders is set. 

#### <a id="http2MetaHeadersFrame.PseudoValue" href="#http2MetaHeadersFrame.PseudoValue">func (mh *http2MetaHeadersFrame) PseudoValue(pseudo string) string</a>

```
searchKey: http.http2MetaHeadersFrame.PseudoValue
tags: [private]
```

```Go
func (mh *http2MetaHeadersFrame) PseudoValue(pseudo string) string
```

PseudoValue returns the given pseudo header field's value. The provided pseudo field should not contain the leading colon. 

#### <a id="http2MetaHeadersFrame.RegularFields" href="#http2MetaHeadersFrame.RegularFields">func (mh *http2MetaHeadersFrame) RegularFields() []hpack.HeaderField</a>

```
searchKey: http.http2MetaHeadersFrame.RegularFields
tags: [private]
```

```Go
func (mh *http2MetaHeadersFrame) RegularFields() []hpack.HeaderField
```

RegularFields returns the regular (non-pseudo) header fields of mh. The caller does not own the returned slice. 

#### <a id="http2MetaHeadersFrame.PseudoFields" href="#http2MetaHeadersFrame.PseudoFields">func (mh *http2MetaHeadersFrame) PseudoFields() []hpack.HeaderField</a>

```
searchKey: http.http2MetaHeadersFrame.PseudoFields
tags: [private]
```

```Go
func (mh *http2MetaHeadersFrame) PseudoFields() []hpack.HeaderField
```

PseudoFields returns the pseudo header fields of mh. The caller does not own the returned slice. 

#### <a id="http2MetaHeadersFrame.checkPseudos" href="#http2MetaHeadersFrame.checkPseudos">func (mh *http2MetaHeadersFrame) checkPseudos() error</a>

```
searchKey: http.http2MetaHeadersFrame.checkPseudos
tags: [private]
```

```Go
func (mh *http2MetaHeadersFrame) checkPseudos() error
```

### <a id="http2goroutineLock" href="#http2goroutineLock">type http2goroutineLock uint64</a>

```
searchKey: http.http2goroutineLock
tags: [private]
```

```Go
type http2goroutineLock uint64
```

#### <a id="http2newGoroutineLock" href="#http2newGoroutineLock">func http2newGoroutineLock() http2goroutineLock</a>

```
searchKey: http.http2newGoroutineLock
tags: [private]
```

```Go
func http2newGoroutineLock() http2goroutineLock
```

#### <a id="http2goroutineLock.check" href="#http2goroutineLock.check">func (g http2goroutineLock) check()</a>

```
searchKey: http.http2goroutineLock.check
tags: [private]
```

```Go
func (g http2goroutineLock) check()
```

#### <a id="http2goroutineLock.checkNotOn" href="#http2goroutineLock.checkNotOn">func (g http2goroutineLock) checkNotOn()</a>

```
searchKey: http.http2goroutineLock.checkNotOn
tags: [private]
```

```Go
func (g http2goroutineLock) checkNotOn()
```

### <a id="http2streamState" href="#http2streamState">type http2streamState int</a>

```
searchKey: http.http2streamState
tags: [private]
```

```Go
type http2streamState int
```

#### <a id="http2streamState.String" href="#http2streamState.String">func (st http2streamState) String() string</a>

```
searchKey: http.http2streamState.String
tags: [private]
```

```Go
func (st http2streamState) String() string
```

### <a id="http2Setting" href="#http2Setting">type http2Setting struct</a>

```
searchKey: http.http2Setting
tags: [private]
```

```Go
type http2Setting struct {
	// ID is which setting is being set.
	// See http://http2.github.io/http2-spec/#SettingValues
	ID http2SettingID

	// Val is the value.
	Val uint32
}
```

Setting is a setting parameter: which setting it is, and its value. 

#### <a id="http2Setting.String" href="#http2Setting.String">func (s http2Setting) String() string</a>

```
searchKey: http.http2Setting.String
tags: [private]
```

```Go
func (s http2Setting) String() string
```

#### <a id="http2Setting.Valid" href="#http2Setting.Valid">func (s http2Setting) Valid() error</a>

```
searchKey: http.http2Setting.Valid
tags: [private]
```

```Go
func (s http2Setting) Valid() error
```

Valid reports whether the setting is valid. 

### <a id="http2SettingID" href="#http2SettingID">type http2SettingID uint16</a>

```
searchKey: http.http2SettingID
tags: [private]
```

```Go
type http2SettingID uint16
```

A SettingID is an HTTP/2 setting as defined in [http://http2.github.io/http2-spec/#iana-settings](http://http2.github.io/http2-spec/#iana-settings) 

#### <a id="http2SettingID.String" href="#http2SettingID.String">func (s http2SettingID) String() string</a>

```
searchKey: http.http2SettingID.String
tags: [private]
```

```Go
func (s http2SettingID) String() string
```

### <a id="http2stringWriter" href="#http2stringWriter">type http2stringWriter interface</a>

```
searchKey: http.http2stringWriter
tags: [private]
```

```Go
type http2stringWriter interface {
	WriteString(s string) (n int, err error)
}
```

from pkg io 

### <a id="http2gate" href="#http2gate">type http2gate chan struct{}</a>

```
searchKey: http.http2gate
tags: [private]
```

```Go
type http2gate chan struct{}
```

A gate lets two goroutines coordinate their activities. 

#### <a id="http2gate.Done" href="#http2gate.Done">func (g http2gate) Done()</a>

```
searchKey: http.http2gate.Done
tags: [private]
```

```Go
func (g http2gate) Done()
```

#### <a id="http2gate.Wait" href="#http2gate.Wait">func (g http2gate) Wait()</a>

```
searchKey: http.http2gate.Wait
tags: [private]
```

```Go
func (g http2gate) Wait()
```

### <a id="http2closeWaiter" href="#http2closeWaiter">type http2closeWaiter chan struct{}</a>

```
searchKey: http.http2closeWaiter
tags: [private]
```

```Go
type http2closeWaiter chan struct{}
```

A closeWaiter is like a sync.WaitGroup but only goes 1 to 0 (open to closed). 

#### <a id="http2closeWaiter.Init" href="#http2closeWaiter.Init">func (cw *http2closeWaiter) Init()</a>

```
searchKey: http.http2closeWaiter.Init
tags: [private]
```

```Go
func (cw *http2closeWaiter) Init()
```

Init makes a closeWaiter usable. It exists because so a closeWaiter value can be placed inside a larger struct and have the Mutex and Cond's memory in the same allocation. 

#### <a id="http2closeWaiter.Close" href="#http2closeWaiter.Close">func (cw http2closeWaiter) Close()</a>

```
searchKey: http.http2closeWaiter.Close
tags: [private]
```

```Go
func (cw http2closeWaiter) Close()
```

Close marks the closeWaiter as closed and unblocks any waiters. 

#### <a id="http2closeWaiter.Wait" href="#http2closeWaiter.Wait">func (cw http2closeWaiter) Wait()</a>

```
searchKey: http.http2closeWaiter.Wait
tags: [private]
```

```Go
func (cw http2closeWaiter) Wait()
```

Wait waits for the closeWaiter to become closed. 

### <a id="http2bufferedWriter" href="#http2bufferedWriter">type http2bufferedWriter struct</a>

```
searchKey: http.http2bufferedWriter
tags: [private]
```

```Go
type http2bufferedWriter struct {
	_  http2incomparable
	w  io.Writer     // immutable
	bw *bufio.Writer // non-nil when data is buffered
}
```

bufferedWriter is a buffered writer that writes to w. Its buffered writer is lazily allocated as needed, to minimize idle memory usage with many connections. 

#### <a id="http2newBufferedWriter" href="#http2newBufferedWriter">func http2newBufferedWriter(w io.Writer) *http2bufferedWriter</a>

```
searchKey: http.http2newBufferedWriter
tags: [private]
```

```Go
func http2newBufferedWriter(w io.Writer) *http2bufferedWriter
```

#### <a id="http2bufferedWriter.Available" href="#http2bufferedWriter.Available">func (w *http2bufferedWriter) Available() int</a>

```
searchKey: http.http2bufferedWriter.Available
tags: [private]
```

```Go
func (w *http2bufferedWriter) Available() int
```

#### <a id="http2bufferedWriter.Write" href="#http2bufferedWriter.Write">func (w *http2bufferedWriter) Write(p []byte) (n int, err error)</a>

```
searchKey: http.http2bufferedWriter.Write
tags: [private]
```

```Go
func (w *http2bufferedWriter) Write(p []byte) (n int, err error)
```

#### <a id="http2bufferedWriter.Flush" href="#http2bufferedWriter.Flush">func (w *http2bufferedWriter) Flush() error</a>

```
searchKey: http.http2bufferedWriter.Flush
tags: [private]
```

```Go
func (w *http2bufferedWriter) Flush() error
```

### <a id="http2httpError" href="#http2httpError">type http2httpError struct</a>

```
searchKey: http.http2httpError
tags: [private]
```

```Go
type http2httpError struct {
	_       http2incomparable
	msg     string
	timeout bool
}
```

#### <a id="http2httpError.Error" href="#http2httpError.Error">func (e *http2httpError) Error() string</a>

```
searchKey: http.http2httpError.Error
tags: [private]
```

```Go
func (e *http2httpError) Error() string
```

#### <a id="http2httpError.Timeout" href="#http2httpError.Timeout">func (e *http2httpError) Timeout() bool</a>

```
searchKey: http.http2httpError.Timeout
tags: [private]
```

```Go
func (e *http2httpError) Timeout() bool
```

#### <a id="http2httpError.Temporary" href="#http2httpError.Temporary">func (e *http2httpError) Temporary() bool</a>

```
searchKey: http.http2httpError.Temporary
tags: [private]
```

```Go
func (e *http2httpError) Temporary() bool
```

### <a id="http2connectionStater" href="#http2connectionStater">type http2connectionStater interface</a>

```
searchKey: http.http2connectionStater
tags: [private]
```

```Go
type http2connectionStater interface {
	ConnectionState() tls.ConnectionState
}
```

### <a id="http2sorter" href="#http2sorter">type http2sorter struct</a>

```
searchKey: http.http2sorter
tags: [private]
```

```Go
type http2sorter struct {
	v []string // owned by sorter
}
```

#### <a id="http2sorter.Len" href="#http2sorter.Len">func (s *http2sorter) Len() int</a>

```
searchKey: http.http2sorter.Len
tags: [private]
```

```Go
func (s *http2sorter) Len() int
```

#### <a id="http2sorter.Swap" href="#http2sorter.Swap">func (s *http2sorter) Swap(i, j int)</a>

```
searchKey: http.http2sorter.Swap
tags: [private]
```

```Go
func (s *http2sorter) Swap(i, j int)
```

#### <a id="http2sorter.Less" href="#http2sorter.Less">func (s *http2sorter) Less(i, j int) bool</a>

```
searchKey: http.http2sorter.Less
tags: [private]
```

```Go
func (s *http2sorter) Less(i, j int) bool
```

#### <a id="http2sorter.Keys" href="#http2sorter.Keys">func (s *http2sorter) Keys(h Header) []string</a>

```
searchKey: http.http2sorter.Keys
tags: [private]
```

```Go
func (s *http2sorter) Keys(h Header) []string
```

Keys returns the sorted keys of h. 

The returned slice is only valid until s used again or returned to its pool. 

#### <a id="http2sorter.SortStrings" href="#http2sorter.SortStrings">func (s *http2sorter) SortStrings(ss []string)</a>

```
searchKey: http.http2sorter.SortStrings
tags: [private]
```

```Go
func (s *http2sorter) SortStrings(ss []string)
```

### <a id="http2incomparable" href="#http2incomparable">type http2incomparable [0]func()</a>

```
searchKey: http.http2incomparable
tags: [private]
```

```Go
type http2incomparable [0]func()
```

incomparable is a zero-width, non-comparable type. Adding it to a struct makes that struct also non-comparable, and generally doesn't add any size (as long as it's first). 

### <a id="http2pipe" href="#http2pipe">type http2pipe struct</a>

```
searchKey: http.http2pipe
tags: [private]
```

```Go
type http2pipe struct {
	mu       sync.Mutex
	c        sync.Cond       // c.L lazily initialized to &p.mu
	b        http2pipeBuffer // nil when done reading
	unread   int             // bytes unread when done
	err      error           // read error once empty. non-nil means closed.
	breakErr error           // immediate read error (caller doesn't see rest of b)
	donec    chan struct{}   // closed on error
	readFn   func()          // optional code to run in Read before error
}
```

pipe is a goroutine-safe io.Reader/io.Writer pair. It's like io.Pipe except there are no PipeReader/PipeWriter halves, and the underlying buffer is an interface. (io.Pipe is always unbuffered) 

#### <a id="http2pipe.Len" href="#http2pipe.Len">func (p *http2pipe) Len() int</a>

```
searchKey: http.http2pipe.Len
tags: [private]
```

```Go
func (p *http2pipe) Len() int
```

#### <a id="http2pipe.Read" href="#http2pipe.Read">func (p *http2pipe) Read(d []byte) (n int, err error)</a>

```
searchKey: http.http2pipe.Read
tags: [private]
```

```Go
func (p *http2pipe) Read(d []byte) (n int, err error)
```

Read waits until data is available and copies bytes from the buffer into p. 

#### <a id="http2pipe.Write" href="#http2pipe.Write">func (p *http2pipe) Write(d []byte) (n int, err error)</a>

```
searchKey: http.http2pipe.Write
tags: [private]
```

```Go
func (p *http2pipe) Write(d []byte) (n int, err error)
```

Write copies bytes from p into the buffer and wakes a reader. It is an error to write more data than the buffer can hold. 

#### <a id="http2pipe.CloseWithError" href="#http2pipe.CloseWithError">func (p *http2pipe) CloseWithError(err error)</a>

```
searchKey: http.http2pipe.CloseWithError
tags: [private]
```

```Go
func (p *http2pipe) CloseWithError(err error)
```

CloseWithError causes the next Read (waking up a current blocked Read if needed) to return the provided err after all data has been read. 

The error must be non-nil. 

#### <a id="http2pipe.BreakWithError" href="#http2pipe.BreakWithError">func (p *http2pipe) BreakWithError(err error)</a>

```
searchKey: http.http2pipe.BreakWithError
tags: [private]
```

```Go
func (p *http2pipe) BreakWithError(err error)
```

BreakWithError causes the next Read (waking up a current blocked Read if needed) to return the provided err immediately, without waiting for unread data. 

#### <a id="http2pipe.closeWithErrorAndCode" href="#http2pipe.closeWithErrorAndCode">func (p *http2pipe) closeWithErrorAndCode(err error, fn func())</a>

```
searchKey: http.http2pipe.closeWithErrorAndCode
tags: [private]
```

```Go
func (p *http2pipe) closeWithErrorAndCode(err error, fn func())
```

closeWithErrorAndCode is like CloseWithError but also sets some code to run in the caller's goroutine before returning the error. 

#### <a id="http2pipe.closeWithError" href="#http2pipe.closeWithError">func (p *http2pipe) closeWithError(dst *error, err error, fn func())</a>

```
searchKey: http.http2pipe.closeWithError
tags: [private]
```

```Go
func (p *http2pipe) closeWithError(dst *error, err error, fn func())
```

#### <a id="http2pipe.closeDoneLocked" href="#http2pipe.closeDoneLocked">func (p *http2pipe) closeDoneLocked()</a>

```
searchKey: http.http2pipe.closeDoneLocked
tags: [private]
```

```Go
func (p *http2pipe) closeDoneLocked()
```

requires p.mu be held. 

#### <a id="http2pipe.Err" href="#http2pipe.Err">func (p *http2pipe) Err() error</a>

```
searchKey: http.http2pipe.Err
tags: [private]
```

```Go
func (p *http2pipe) Err() error
```

Err returns the error (if any) first set by BreakWithError or CloseWithError. 

#### <a id="http2pipe.Done" href="#http2pipe.Done">func (p *http2pipe) Done() <-chan struct{}</a>

```
searchKey: http.http2pipe.Done
tags: [private]
```

```Go
func (p *http2pipe) Done() <-chan struct{}
```

Done returns a channel which is closed if and when this pipe is closed with CloseWithError. 

### <a id="http2pipeBuffer" href="#http2pipeBuffer">type http2pipeBuffer interface</a>

```
searchKey: http.http2pipeBuffer
tags: [private]
```

```Go
type http2pipeBuffer interface {
	Len() int
	io.Writer
	io.Reader
}
```

### <a id="http2Server" href="#http2Server">type http2Server struct</a>

```
searchKey: http.http2Server
tags: [private]
```

```Go
type http2Server struct {
	// MaxHandlers limits the number of http.Handler ServeHTTP goroutines
	// which may run at a time over all connections.
	// Negative or zero no limit.
	// TODO: implement
	MaxHandlers int

	// MaxConcurrentStreams optionally specifies the number of
	// concurrent streams that each client may have open at a
	// time. This is unrelated to the number of http.Handler goroutines
	// which may be active globally, which is MaxHandlers.
	// If zero, MaxConcurrentStreams defaults to at least 100, per
	// the HTTP/2 spec's recommendations.
	MaxConcurrentStreams uint32

	// MaxReadFrameSize optionally specifies the largest frame
	// this server is willing to read. A valid value is between
	// 16k and 16M, inclusive. If zero or otherwise invalid, a
	// default value is used.
	MaxReadFrameSize uint32

	// PermitProhibitedCipherSuites, if true, permits the use of
	// cipher suites prohibited by the HTTP/2 spec.
	PermitProhibitedCipherSuites bool

	// IdleTimeout specifies how long until idle clients should be
	// closed with a GOAWAY frame. PING frames are not considered
	// activity for the purposes of IdleTimeout.
	IdleTimeout time.Duration

	// MaxUploadBufferPerConnection is the size of the initial flow
	// control window for each connections. The HTTP/2 spec does not
	// allow this to be smaller than 65535 or larger than 2^32-1.
	// If the value is outside this range, a default value will be
	// used instead.
	MaxUploadBufferPerConnection int32

	// MaxUploadBufferPerStream is the size of the initial flow control
	// window for each stream. The HTTP/2 spec does not allow this to
	// be larger than 2^32-1. If the value is zero or larger than the
	// maximum, a default value will be used instead.
	MaxUploadBufferPerStream int32

	// NewWriteScheduler constructs a write scheduler for a connection.
	// If nil, a default scheduler is chosen.
	NewWriteScheduler func() http2WriteScheduler

	// Internal state. This is a pointer (rather than embedded directly)
	// so that we don't embed a Mutex in this struct, which will make the
	// struct non-copyable, which might break some callers.
	state *http2serverInternalState
}
```

Server is an HTTP/2 server. 

#### <a id="http2Server.initialConnRecvWindowSize" href="#http2Server.initialConnRecvWindowSize">func (s *http2Server) initialConnRecvWindowSize() int32</a>

```
searchKey: http.http2Server.initialConnRecvWindowSize
tags: [private]
```

```Go
func (s *http2Server) initialConnRecvWindowSize() int32
```

#### <a id="http2Server.initialStreamRecvWindowSize" href="#http2Server.initialStreamRecvWindowSize">func (s *http2Server) initialStreamRecvWindowSize() int32</a>

```
searchKey: http.http2Server.initialStreamRecvWindowSize
tags: [private]
```

```Go
func (s *http2Server) initialStreamRecvWindowSize() int32
```

#### <a id="http2Server.maxReadFrameSize" href="#http2Server.maxReadFrameSize">func (s *http2Server) maxReadFrameSize() uint32</a>

```
searchKey: http.http2Server.maxReadFrameSize
tags: [private]
```

```Go
func (s *http2Server) maxReadFrameSize() uint32
```

#### <a id="http2Server.maxConcurrentStreams" href="#http2Server.maxConcurrentStreams">func (s *http2Server) maxConcurrentStreams() uint32</a>

```
searchKey: http.http2Server.maxConcurrentStreams
tags: [private]
```

```Go
func (s *http2Server) maxConcurrentStreams() uint32
```

#### <a id="http2Server.maxQueuedControlFrames" href="#http2Server.maxQueuedControlFrames">func (s *http2Server) maxQueuedControlFrames() int</a>

```
searchKey: http.http2Server.maxQueuedControlFrames
tags: [private]
```

```Go
func (s *http2Server) maxQueuedControlFrames() int
```

maxQueuedControlFrames is the maximum number of control frames like SETTINGS, PING and RST_STREAM that will be queued for writing before the connection is closed to prevent memory exhaustion attacks. 

#### <a id="http2Server.ServeConn" href="#http2Server.ServeConn">func (s *http2Server) ServeConn(c net.Conn, opts *http2ServeConnOpts)</a>

```
searchKey: http.http2Server.ServeConn
tags: [private]
```

```Go
func (s *http2Server) ServeConn(c net.Conn, opts *http2ServeConnOpts)
```

ServeConn serves HTTP/2 requests on the provided connection and blocks until the connection is no longer readable. 

ServeConn starts speaking HTTP/2 assuming that c has not had any reads or writes. It writes its initial settings frame and expects to be able to read the preface and settings frame from the client. If c has a ConnectionState method like a *tls.Conn, the ConnectionState is used to verify the TLS ciphersuite and to set the Request.TLS field in Handlers. 

ServeConn does not support h2c by itself. Any h2c support must be implemented in terms of providing a suitably-behaving net.Conn. 

The opts parameter is optional. If nil, default values are used. 

### <a id="http2serverInternalState" href="#http2serverInternalState">type http2serverInternalState struct</a>

```
searchKey: http.http2serverInternalState
tags: [private]
```

```Go
type http2serverInternalState struct {
	mu          sync.Mutex
	activeConns map[*http2serverConn]struct{}
}
```

#### <a id="http2serverInternalState.registerConn" href="#http2serverInternalState.registerConn">func (s *http2serverInternalState) registerConn(sc *http2serverConn)</a>

```
searchKey: http.http2serverInternalState.registerConn
tags: [private]
```

```Go
func (s *http2serverInternalState) registerConn(sc *http2serverConn)
```

#### <a id="http2serverInternalState.unregisterConn" href="#http2serverInternalState.unregisterConn">func (s *http2serverInternalState) unregisterConn(sc *http2serverConn)</a>

```
searchKey: http.http2serverInternalState.unregisterConn
tags: [private]
```

```Go
func (s *http2serverInternalState) unregisterConn(sc *http2serverConn)
```

#### <a id="http2serverInternalState.startGracefulShutdown" href="#http2serverInternalState.startGracefulShutdown">func (s *http2serverInternalState) startGracefulShutdown()</a>

```
searchKey: http.http2serverInternalState.startGracefulShutdown
tags: [private]
```

```Go
func (s *http2serverInternalState) startGracefulShutdown()
```

### <a id="http2ServeConnOpts" href="#http2ServeConnOpts">type http2ServeConnOpts struct</a>

```
searchKey: http.http2ServeConnOpts
tags: [private]
```

```Go
type http2ServeConnOpts struct {
	// Context is the base context to use.
	// If nil, context.Background is used.
	Context context.Context

	// BaseConfig optionally sets the base configuration
	// for values. If nil, defaults are used.
	BaseConfig *Server

	// Handler specifies which handler to use for processing
	// requests. If nil, BaseConfig.Handler is used. If BaseConfig
	// or BaseConfig.Handler is nil, http.DefaultServeMux is used.
	Handler Handler
}
```

ServeConnOpts are options for the Server.ServeConn method. 

#### <a id="http2ServeConnOpts.context" href="#http2ServeConnOpts.context">func (o *http2ServeConnOpts) context() context.Context</a>

```
searchKey: http.http2ServeConnOpts.context
tags: [private]
```

```Go
func (o *http2ServeConnOpts) context() context.Context
```

#### <a id="http2ServeConnOpts.baseConfig" href="#http2ServeConnOpts.baseConfig">func (o *http2ServeConnOpts) baseConfig() *Server</a>

```
searchKey: http.http2ServeConnOpts.baseConfig
tags: [private]
```

```Go
func (o *http2ServeConnOpts) baseConfig() *Server
```

#### <a id="http2ServeConnOpts.handler" href="#http2ServeConnOpts.handler">func (o *http2ServeConnOpts) handler() Handler</a>

```
searchKey: http.http2ServeConnOpts.handler
tags: [private]
```

```Go
func (o *http2ServeConnOpts) handler() Handler
```

### <a id="http2serverConn" href="#http2serverConn">type http2serverConn struct</a>

```
searchKey: http.http2serverConn
tags: [private]
```

```Go
type http2serverConn struct {
	// Immutable:
	srv              *http2Server
	hs               *Server
	conn             net.Conn
	bw               *http2bufferedWriter // writing to conn
	handler          Handler
	baseCtx          context.Context
	framer           *http2Framer
	doneServing      chan struct{}               // closed when serverConn.serve ends
	readFrameCh      chan http2readFrameResult   // written by serverConn.readFrames
	wantWriteFrameCh chan http2FrameWriteRequest // from handlers -> serve
	wroteFrameCh     chan http2frameWriteResult  // from writeFrameAsync -> serve, tickles more frame writes
	bodyReadCh       chan http2bodyReadMsg       // from handlers -> serve
	serveMsgCh       chan interface{}            // misc messages & code to send to / run on the serve loop
	flow             http2flow                   // conn-wide (not stream-specific) outbound flow control
	inflow           http2flow                   // conn-wide inbound flow control
	tlsState         *tls.ConnectionState        // shared by all handlers, like net/http
	remoteAddrStr    string
	writeSched       http2WriteScheduler

	// Everything following is owned by the serve loop; use serveG.check():
	serveG                      http2goroutineLock // used to verify funcs are on serve()
	pushEnabled                 bool
	sawFirstSettings            bool // got the initial SETTINGS frame after the preface
	needToSendSettingsAck       bool
	unackedSettings             int    // how many SETTINGS have we sent without ACKs?
	queuedControlFrames         int    // control frames in the writeSched queue
	clientMaxStreams            uint32 // SETTINGS_MAX_CONCURRENT_STREAMS from client (our PUSH_PROMISE limit)
	advMaxStreams               uint32 // our SETTINGS_MAX_CONCURRENT_STREAMS advertised the client
	curClientStreams            uint32 // number of open streams initiated by the client
	curPushedStreams            uint32 // number of open streams initiated by server push
	maxClientStreamID           uint32 // max ever seen from client (odd), or 0 if there have been no client requests
	maxPushPromiseID            uint32 // ID of the last push promise (even), or 0 if there have been no pushes
	streams                     map[uint32]*http2stream
	initialStreamSendWindowSize int32
	maxFrameSize                int32
	headerTableSize             uint32
	peerMaxHeaderListSize       uint32            // zero means unknown (default)
	canonHeader                 map[string]string // http2-lower-case -> Go-Canonical-Case
	writingFrame                bool              // started writing a frame (on serve goroutine or separate)
	writingFrameAsync           bool              // started a frame on its own goroutine but haven't heard back on wroteFrameCh
	needsFrameFlush             bool              // last frame write wasn't a flush
	inGoAway                    bool              // we've started to or sent GOAWAY
	inFrameScheduleLoop         bool              // whether we're in the scheduleFrameWrite loop
	needToSendGoAway            bool              // we need to schedule a GOAWAY frame write
	goAwayCode                  http2ErrCode
	shutdownTimer               *time.Timer // nil until used
	idleTimer                   *time.Timer // nil if unused

	// Owned by the writeFrameAsync goroutine:
	headerWriteBuf bytes.Buffer
	hpackEncoder   *hpack.Encoder

	// Used by startGracefulShutdown.
	shutdownOnce sync.Once
}
```

#### <a id="http2serverConn.rejectConn" href="#http2serverConn.rejectConn">func (sc *http2serverConn) rejectConn(err http2ErrCode, debug string)</a>

```
searchKey: http.http2serverConn.rejectConn
tags: [private]
```

```Go
func (sc *http2serverConn) rejectConn(err http2ErrCode, debug string)
```

#### <a id="http2serverConn.maxHeaderListSize" href="#http2serverConn.maxHeaderListSize">func (sc *http2serverConn) maxHeaderListSize() uint32</a>

```
searchKey: http.http2serverConn.maxHeaderListSize
tags: [private]
```

```Go
func (sc *http2serverConn) maxHeaderListSize() uint32
```

#### <a id="http2serverConn.curOpenStreams" href="#http2serverConn.curOpenStreams">func (sc *http2serverConn) curOpenStreams() uint32</a>

```
searchKey: http.http2serverConn.curOpenStreams
tags: [private]
```

```Go
func (sc *http2serverConn) curOpenStreams() uint32
```

#### <a id="http2serverConn.Framer" href="#http2serverConn.Framer">func (sc *http2serverConn) Framer() *http2Framer</a>

```
searchKey: http.http2serverConn.Framer
tags: [private]
```

```Go
func (sc *http2serverConn) Framer() *http2Framer
```

#### <a id="http2serverConn.CloseConn" href="#http2serverConn.CloseConn">func (sc *http2serverConn) CloseConn() error</a>

```
searchKey: http.http2serverConn.CloseConn
tags: [private]
```

```Go
func (sc *http2serverConn) CloseConn() error
```

#### <a id="http2serverConn.Flush" href="#http2serverConn.Flush">func (sc *http2serverConn) Flush() error</a>

```
searchKey: http.http2serverConn.Flush
tags: [private]
```

```Go
func (sc *http2serverConn) Flush() error
```

#### <a id="http2serverConn.HeaderEncoder" href="#http2serverConn.HeaderEncoder">func (sc *http2serverConn) HeaderEncoder() (*hpack.Encoder, *bytes.Buffer)</a>

```
searchKey: http.http2serverConn.HeaderEncoder
tags: [private]
```

```Go
func (sc *http2serverConn) HeaderEncoder() (*hpack.Encoder, *bytes.Buffer)
```

#### <a id="http2serverConn.state" href="#http2serverConn.state">func (sc *http2serverConn) state(streamID uint32) (http2streamState, *http2stream)</a>

```
searchKey: http.http2serverConn.state
tags: [private]
```

```Go
func (sc *http2serverConn) state(streamID uint32) (http2streamState, *http2stream)
```

#### <a id="http2serverConn.setConnState" href="#http2serverConn.setConnState">func (sc *http2serverConn) setConnState(state ConnState)</a>

```
searchKey: http.http2serverConn.setConnState
tags: [private]
```

```Go
func (sc *http2serverConn) setConnState(state ConnState)
```

setConnState calls the net/http ConnState hook for this connection, if configured. Note that the net/http package does StateNew and StateClosed for us. There is currently no plan for StateHijacked or hijacking HTTP/2 connections. 

#### <a id="http2serverConn.vlogf" href="#http2serverConn.vlogf">func (sc *http2serverConn) vlogf(format string, args ...interface{})</a>

```
searchKey: http.http2serverConn.vlogf
tags: [private]
```

```Go
func (sc *http2serverConn) vlogf(format string, args ...interface{})
```

#### <a id="http2serverConn.logf" href="#http2serverConn.logf">func (sc *http2serverConn) logf(format string, args ...interface{})</a>

```
searchKey: http.http2serverConn.logf
tags: [private]
```

```Go
func (sc *http2serverConn) logf(format string, args ...interface{})
```

#### <a id="http2serverConn.condlogf" href="#http2serverConn.condlogf">func (sc *http2serverConn) condlogf(err error, format string, args ...interface{})</a>

```
searchKey: http.http2serverConn.condlogf
tags: [private]
```

```Go
func (sc *http2serverConn) condlogf(err error, format string, args ...interface{})
```

#### <a id="http2serverConn.canonicalHeader" href="#http2serverConn.canonicalHeader">func (sc *http2serverConn) canonicalHeader(v string) string</a>

```
searchKey: http.http2serverConn.canonicalHeader
tags: [private]
```

```Go
func (sc *http2serverConn) canonicalHeader(v string) string
```

#### <a id="http2serverConn.readFrames" href="#http2serverConn.readFrames">func (sc *http2serverConn) readFrames()</a>

```
searchKey: http.http2serverConn.readFrames
tags: [private]
```

```Go
func (sc *http2serverConn) readFrames()
```

readFrames is the loop that reads incoming frames. It takes care to only read one frame at a time, blocking until the consumer is done with the frame. It's run on its own goroutine. 

#### <a id="http2serverConn.writeFrameAsync" href="#http2serverConn.writeFrameAsync">func (sc *http2serverConn) writeFrameAsync(wr http2FrameWriteRequest)</a>

```
searchKey: http.http2serverConn.writeFrameAsync
tags: [private]
```

```Go
func (sc *http2serverConn) writeFrameAsync(wr http2FrameWriteRequest)
```

writeFrameAsync runs in its own goroutine and writes a single frame and then reports when it's done. At most one goroutine can be running writeFrameAsync at a time per serverConn. 

#### <a id="http2serverConn.closeAllStreamsOnConnClose" href="#http2serverConn.closeAllStreamsOnConnClose">func (sc *http2serverConn) closeAllStreamsOnConnClose()</a>

```
searchKey: http.http2serverConn.closeAllStreamsOnConnClose
tags: [private]
```

```Go
func (sc *http2serverConn) closeAllStreamsOnConnClose()
```

#### <a id="http2serverConn.stopShutdownTimer" href="#http2serverConn.stopShutdownTimer">func (sc *http2serverConn) stopShutdownTimer()</a>

```
searchKey: http.http2serverConn.stopShutdownTimer
tags: [private]
```

```Go
func (sc *http2serverConn) stopShutdownTimer()
```

#### <a id="http2serverConn.notePanic" href="#http2serverConn.notePanic">func (sc *http2serverConn) notePanic()</a>

```
searchKey: http.http2serverConn.notePanic
tags: [private]
```

```Go
func (sc *http2serverConn) notePanic()
```

#### <a id="http2serverConn.serve" href="#http2serverConn.serve">func (sc *http2serverConn) serve()</a>

```
searchKey: http.http2serverConn.serve
tags: [private]
```

```Go
func (sc *http2serverConn) serve()
```

#### <a id="http2serverConn.awaitGracefulShutdown" href="#http2serverConn.awaitGracefulShutdown">func (sc *http2serverConn) awaitGracefulShutdown(sharedCh <-chan struct{}, privateCh chan struct{})</a>

```
searchKey: http.http2serverConn.awaitGracefulShutdown
tags: [private]
```

```Go
func (sc *http2serverConn) awaitGracefulShutdown(sharedCh <-chan struct{}, privateCh chan struct{})
```

#### <a id="http2serverConn.onSettingsTimer" href="#http2serverConn.onSettingsTimer">func (sc *http2serverConn) onSettingsTimer()</a>

```
searchKey: http.http2serverConn.onSettingsTimer
tags: [private]
```

```Go
func (sc *http2serverConn) onSettingsTimer()
```

#### <a id="http2serverConn.onIdleTimer" href="#http2serverConn.onIdleTimer">func (sc *http2serverConn) onIdleTimer()</a>

```
searchKey: http.http2serverConn.onIdleTimer
tags: [private]
```

```Go
func (sc *http2serverConn) onIdleTimer()
```

#### <a id="http2serverConn.onShutdownTimer" href="#http2serverConn.onShutdownTimer">func (sc *http2serverConn) onShutdownTimer()</a>

```
searchKey: http.http2serverConn.onShutdownTimer
tags: [private]
```

```Go
func (sc *http2serverConn) onShutdownTimer()
```

#### <a id="http2serverConn.sendServeMsg" href="#http2serverConn.sendServeMsg">func (sc *http2serverConn) sendServeMsg(msg interface{})</a>

```
searchKey: http.http2serverConn.sendServeMsg
tags: [private]
```

```Go
func (sc *http2serverConn) sendServeMsg(msg interface{})
```

#### <a id="http2serverConn.readPreface" href="#http2serverConn.readPreface">func (sc *http2serverConn) readPreface() error</a>

```
searchKey: http.http2serverConn.readPreface
tags: [private]
```

```Go
func (sc *http2serverConn) readPreface() error
```

readPreface reads the ClientPreface greeting from the peer or returns errPrefaceTimeout on timeout, or an error if the greeting is invalid. 

#### <a id="http2serverConn.writeDataFromHandler" href="#http2serverConn.writeDataFromHandler">func (sc *http2serverConn) writeDataFromHandler(stream *http2stream, data []byte, endStream bool) error</a>

```
searchKey: http.http2serverConn.writeDataFromHandler
tags: [private]
```

```Go
func (sc *http2serverConn) writeDataFromHandler(stream *http2stream, data []byte, endStream bool) error
```

writeDataFromHandler writes DATA response frames from a handler on the given stream. 

#### <a id="http2serverConn.writeFrameFromHandler" href="#http2serverConn.writeFrameFromHandler">func (sc *http2serverConn) writeFrameFromHandler(wr http2FrameWriteRequest) error</a>

```
searchKey: http.http2serverConn.writeFrameFromHandler
tags: [private]
```

```Go
func (sc *http2serverConn) writeFrameFromHandler(wr http2FrameWriteRequest) error
```

writeFrameFromHandler sends wr to sc.wantWriteFrameCh, but aborts if the connection has gone away. 

This must not be run from the serve goroutine itself, else it might deadlock writing to sc.wantWriteFrameCh (which is only mildly buffered and is read by serve itself). If you're on the serve goroutine, call writeFrame instead. 

#### <a id="http2serverConn.writeFrame" href="#http2serverConn.writeFrame">func (sc *http2serverConn) writeFrame(wr http2FrameWriteRequest)</a>

```
searchKey: http.http2serverConn.writeFrame
tags: [private]
```

```Go
func (sc *http2serverConn) writeFrame(wr http2FrameWriteRequest)
```

writeFrame schedules a frame to write and sends it if there's nothing already being written. 

There is no pushback here (the serve goroutine never blocks). It's the http.Handlers that block, waiting for their previous frames to make it onto the wire 

If you're not on the serve goroutine, use writeFrameFromHandler instead. 

#### <a id="http2serverConn.startFrameWrite" href="#http2serverConn.startFrameWrite">func (sc *http2serverConn) startFrameWrite(wr http2FrameWriteRequest)</a>

```
searchKey: http.http2serverConn.startFrameWrite
tags: [private]
```

```Go
func (sc *http2serverConn) startFrameWrite(wr http2FrameWriteRequest)
```

startFrameWrite starts a goroutine to write wr (in a separate goroutine since that might block on the network), and updates the serve goroutine's state about the world, updated from info in wr. 

#### <a id="http2serverConn.wroteFrame" href="#http2serverConn.wroteFrame">func (sc *http2serverConn) wroteFrame(res http2frameWriteResult)</a>

```
searchKey: http.http2serverConn.wroteFrame
tags: [private]
```

```Go
func (sc *http2serverConn) wroteFrame(res http2frameWriteResult)
```

wroteFrame is called on the serve goroutine with the result of whatever happened on writeFrameAsync. 

#### <a id="http2serverConn.scheduleFrameWrite" href="#http2serverConn.scheduleFrameWrite">func (sc *http2serverConn) scheduleFrameWrite()</a>

```
searchKey: http.http2serverConn.scheduleFrameWrite
tags: [private]
```

```Go
func (sc *http2serverConn) scheduleFrameWrite()
```

scheduleFrameWrite tickles the frame writing scheduler. 

If a frame is already being written, nothing happens. This will be called again when the frame is done being written. 

If a frame isn't being written and we need to send one, the best frame to send is selected by writeSched. 

If a frame isn't being written and there's nothing else to send, we flush the write buffer. 

#### <a id="http2serverConn.startGracefulShutdown" href="#http2serverConn.startGracefulShutdown">func (sc *http2serverConn) startGracefulShutdown()</a>

```
searchKey: http.http2serverConn.startGracefulShutdown
tags: [private]
```

```Go
func (sc *http2serverConn) startGracefulShutdown()
```

startGracefulShutdown gracefully shuts down a connection. This sends GOAWAY with ErrCodeNo to tell the client we're gracefully shutting down. The connection isn't closed until all current streams are done. 

startGracefulShutdown returns immediately; it does not wait until the connection has shut down. 

#### <a id="http2serverConn.startGracefulShutdownInternal" href="#http2serverConn.startGracefulShutdownInternal">func (sc *http2serverConn) startGracefulShutdownInternal()</a>

```
searchKey: http.http2serverConn.startGracefulShutdownInternal
tags: [private]
```

```Go
func (sc *http2serverConn) startGracefulShutdownInternal()
```

#### <a id="http2serverConn.goAway" href="#http2serverConn.goAway">func (sc *http2serverConn) goAway(code http2ErrCode)</a>

```
searchKey: http.http2serverConn.goAway
tags: [private]
```

```Go
func (sc *http2serverConn) goAway(code http2ErrCode)
```

#### <a id="http2serverConn.shutDownIn" href="#http2serverConn.shutDownIn">func (sc *http2serverConn) shutDownIn(d time.Duration)</a>

```
searchKey: http.http2serverConn.shutDownIn
tags: [private]
```

```Go
func (sc *http2serverConn) shutDownIn(d time.Duration)
```

#### <a id="http2serverConn.resetStream" href="#http2serverConn.resetStream">func (sc *http2serverConn) resetStream(se http2StreamError)</a>

```
searchKey: http.http2serverConn.resetStream
tags: [private]
```

```Go
func (sc *http2serverConn) resetStream(se http2StreamError)
```

#### <a id="http2serverConn.processFrameFromReader" href="#http2serverConn.processFrameFromReader">func (sc *http2serverConn) processFrameFromReader(res http2readFrameResult) bool</a>

```
searchKey: http.http2serverConn.processFrameFromReader
tags: [private]
```

```Go
func (sc *http2serverConn) processFrameFromReader(res http2readFrameResult) bool
```

processFrameFromReader processes the serve loop's read from readFrameCh from the frame-reading goroutine. processFrameFromReader returns whether the connection should be kept open. 

#### <a id="http2serverConn.processFrame" href="#http2serverConn.processFrame">func (sc *http2serverConn) processFrame(f http2Frame) error</a>

```
searchKey: http.http2serverConn.processFrame
tags: [private]
```

```Go
func (sc *http2serverConn) processFrame(f http2Frame) error
```

#### <a id="http2serverConn.processPing" href="#http2serverConn.processPing">func (sc *http2serverConn) processPing(f *http2PingFrame) error</a>

```
searchKey: http.http2serverConn.processPing
tags: [private]
```

```Go
func (sc *http2serverConn) processPing(f *http2PingFrame) error
```

#### <a id="http2serverConn.processWindowUpdate" href="#http2serverConn.processWindowUpdate">func (sc *http2serverConn) processWindowUpdate(f *http2WindowUpdateFrame) error</a>

```
searchKey: http.http2serverConn.processWindowUpdate
tags: [private]
```

```Go
func (sc *http2serverConn) processWindowUpdate(f *http2WindowUpdateFrame) error
```

#### <a id="http2serverConn.processResetStream" href="#http2serverConn.processResetStream">func (sc *http2serverConn) processResetStream(f *http2RSTStreamFrame) error</a>

```
searchKey: http.http2serverConn.processResetStream
tags: [private]
```

```Go
func (sc *http2serverConn) processResetStream(f *http2RSTStreamFrame) error
```

#### <a id="http2serverConn.closeStream" href="#http2serverConn.closeStream">func (sc *http2serverConn) closeStream(st *http2stream, err error)</a>

```
searchKey: http.http2serverConn.closeStream
tags: [private]
```

```Go
func (sc *http2serverConn) closeStream(st *http2stream, err error)
```

#### <a id="http2serverConn.processSettings" href="#http2serverConn.processSettings">func (sc *http2serverConn) processSettings(f *http2SettingsFrame) error</a>

```
searchKey: http.http2serverConn.processSettings
tags: [private]
```

```Go
func (sc *http2serverConn) processSettings(f *http2SettingsFrame) error
```

#### <a id="http2serverConn.processSetting" href="#http2serverConn.processSetting">func (sc *http2serverConn) processSetting(s http2Setting) error</a>

```
searchKey: http.http2serverConn.processSetting
tags: [private]
```

```Go
func (sc *http2serverConn) processSetting(s http2Setting) error
```

#### <a id="http2serverConn.processSettingInitialWindowSize" href="#http2serverConn.processSettingInitialWindowSize">func (sc *http2serverConn) processSettingInitialWindowSize(val uint32) error</a>

```
searchKey: http.http2serverConn.processSettingInitialWindowSize
tags: [private]
```

```Go
func (sc *http2serverConn) processSettingInitialWindowSize(val uint32) error
```

#### <a id="http2serverConn.processData" href="#http2serverConn.processData">func (sc *http2serverConn) processData(f *http2DataFrame) error</a>

```
searchKey: http.http2serverConn.processData
tags: [private]
```

```Go
func (sc *http2serverConn) processData(f *http2DataFrame) error
```

#### <a id="http2serverConn.processGoAway" href="#http2serverConn.processGoAway">func (sc *http2serverConn) processGoAway(f *http2GoAwayFrame) error</a>

```
searchKey: http.http2serverConn.processGoAway
tags: [private]
```

```Go
func (sc *http2serverConn) processGoAway(f *http2GoAwayFrame) error
```

#### <a id="http2serverConn.processHeaders" href="#http2serverConn.processHeaders">func (sc *http2serverConn) processHeaders(f *http2MetaHeadersFrame) error</a>

```
searchKey: http.http2serverConn.processHeaders
tags: [private]
```

```Go
func (sc *http2serverConn) processHeaders(f *http2MetaHeadersFrame) error
```

#### <a id="http2serverConn.processPriority" href="#http2serverConn.processPriority">func (sc *http2serverConn) processPriority(f *http2PriorityFrame) error</a>

```
searchKey: http.http2serverConn.processPriority
tags: [private]
```

```Go
func (sc *http2serverConn) processPriority(f *http2PriorityFrame) error
```

#### <a id="http2serverConn.newStream" href="#http2serverConn.newStream">func (sc *http2serverConn) newStream(id, pusherID uint32, state http2streamState) *http2stream</a>

```
searchKey: http.http2serverConn.newStream
tags: [private]
```

```Go
func (sc *http2serverConn) newStream(id, pusherID uint32, state http2streamState) *http2stream
```

#### <a id="http2serverConn.newWriterAndRequest" href="#http2serverConn.newWriterAndRequest">func (sc *http2serverConn) newWriterAndRequest(st *http2stream, f *http2MetaHeadersFrame) (*http2responseWriter, *Request, error)</a>

```
searchKey: http.http2serverConn.newWriterAndRequest
tags: [private]
```

```Go
func (sc *http2serverConn) newWriterAndRequest(st *http2stream, f *http2MetaHeadersFrame) (*http2responseWriter, *Request, error)
```

#### <a id="http2serverConn.newWriterAndRequestNoBody" href="#http2serverConn.newWriterAndRequestNoBody">func (sc *http2serverConn) newWriterAndRequestNoBody(st *http2stream, rp http2requestParam) (*http2responseWriter, *Request, error)</a>

```
searchKey: http.http2serverConn.newWriterAndRequestNoBody
tags: [private]
```

```Go
func (sc *http2serverConn) newWriterAndRequestNoBody(st *http2stream, rp http2requestParam) (*http2responseWriter, *Request, error)
```

#### <a id="http2serverConn.runHandler" href="#http2serverConn.runHandler">func (sc *http2serverConn) runHandler(rw *http2responseWriter, req *Request, handler func(ResponseWriter, *Request))</a>

```
searchKey: http.http2serverConn.runHandler
tags: [private]
```

```Go
func (sc *http2serverConn) runHandler(rw *http2responseWriter, req *Request, handler func(ResponseWriter, *Request))
```

Run on its own goroutine. 

#### <a id="http2serverConn.writeHeaders" href="#http2serverConn.writeHeaders">func (sc *http2serverConn) writeHeaders(st *http2stream, headerData *http2writeResHeaders) error</a>

```
searchKey: http.http2serverConn.writeHeaders
tags: [private]
```

```Go
func (sc *http2serverConn) writeHeaders(st *http2stream, headerData *http2writeResHeaders) error
```

called from handler goroutines. h may be nil. 

#### <a id="http2serverConn.write100ContinueHeaders" href="#http2serverConn.write100ContinueHeaders">func (sc *http2serverConn) write100ContinueHeaders(st *http2stream)</a>

```
searchKey: http.http2serverConn.write100ContinueHeaders
tags: [private]
```

```Go
func (sc *http2serverConn) write100ContinueHeaders(st *http2stream)
```

called from handler goroutines. 

#### <a id="http2serverConn.noteBodyReadFromHandler" href="#http2serverConn.noteBodyReadFromHandler">func (sc *http2serverConn) noteBodyReadFromHandler(st *http2stream, n int, err error)</a>

```
searchKey: http.http2serverConn.noteBodyReadFromHandler
tags: [private]
```

```Go
func (sc *http2serverConn) noteBodyReadFromHandler(st *http2stream, n int, err error)
```

called from handler goroutines. Notes that the handler for the given stream ID read n bytes of its body and schedules flow control tokens to be sent. 

#### <a id="http2serverConn.noteBodyRead" href="#http2serverConn.noteBodyRead">func (sc *http2serverConn) noteBodyRead(st *http2stream, n int)</a>

```
searchKey: http.http2serverConn.noteBodyRead
tags: [private]
```

```Go
func (sc *http2serverConn) noteBodyRead(st *http2stream, n int)
```

#### <a id="http2serverConn.sendWindowUpdate" href="#http2serverConn.sendWindowUpdate">func (sc *http2serverConn) sendWindowUpdate(st *http2stream, n int)</a>

```
searchKey: http.http2serverConn.sendWindowUpdate
tags: [private]
```

```Go
func (sc *http2serverConn) sendWindowUpdate(st *http2stream, n int)
```

st may be nil for conn-level 

#### <a id="http2serverConn.sendWindowUpdate32" href="#http2serverConn.sendWindowUpdate32">func (sc *http2serverConn) sendWindowUpdate32(st *http2stream, n int32)</a>

```
searchKey: http.http2serverConn.sendWindowUpdate32
tags: [private]
```

```Go
func (sc *http2serverConn) sendWindowUpdate32(st *http2stream, n int32)
```

st may be nil for conn-level 

#### <a id="http2serverConn.startPush" href="#http2serverConn.startPush">func (sc *http2serverConn) startPush(msg *http2startPushRequest)</a>

```
searchKey: http.http2serverConn.startPush
tags: [private]
```

```Go
func (sc *http2serverConn) startPush(msg *http2startPushRequest)
```

### <a id="http2stream" href="#http2stream">type http2stream struct</a>

```
searchKey: http.http2stream
tags: [private]
```

```Go
type http2stream struct {
	// immutable:
	sc        *http2serverConn
	id        uint32
	body      *http2pipe       // non-nil if expecting DATA frames
	cw        http2closeWaiter // closed wait stream transitions to closed state
	ctx       context.Context
	cancelCtx func()

	// owned by serverConn's serve loop:
	bodyBytes        int64     // body bytes seen so far
	declBodyBytes    int64     // or -1 if undeclared
	flow             http2flow // limits writing from Handler to client
	inflow           http2flow // what the client is allowed to POST/etc to us
	state            http2streamState
	resetQueued      bool        // RST_STREAM queued for write; set by sc.resetStream
	gotTrailerHeader bool        // HEADER frame for trailers was seen
	wroteHeaders     bool        // whether we wrote headers (not status 100)
	writeDeadline    *time.Timer // nil if unused

	trailer    Header // accumulated trailers
	reqTrailer Header // handler's Request.Trailer
}
```

stream represents a stream. This is the minimal metadata needed by the serve goroutine. Most of the actual stream state is owned by the http.Handler's goroutine in the responseWriter. Because the responseWriter's responseWriterState is recycled at the end of a handler, this struct intentionally has no pointer to the *responseWriter{,State} itself, as the Handler ending nils out the responseWriter's state field. 

#### <a id="http2stream.isPushed" href="#http2stream.isPushed">func (st *http2stream) isPushed() bool</a>

```
searchKey: http.http2stream.isPushed
tags: [private]
```

```Go
func (st *http2stream) isPushed() bool
```

isPushed reports whether the stream is server-initiated. 

#### <a id="http2stream.endStream" href="#http2stream.endStream">func (st *http2stream) endStream()</a>

```
searchKey: http.http2stream.endStream
tags: [private]
```

```Go
func (st *http2stream) endStream()
```

endStream closes a Request.Body's pipe. It is called when a DATA frame says a request body is over (or after trailers). 

#### <a id="http2stream.copyTrailersToHandlerRequest" href="#http2stream.copyTrailersToHandlerRequest">func (st *http2stream) copyTrailersToHandlerRequest()</a>

```
searchKey: http.http2stream.copyTrailersToHandlerRequest
tags: [private]
```

```Go
func (st *http2stream) copyTrailersToHandlerRequest()
```

copyTrailersToHandlerRequest is run in the Handler's goroutine in its Request.Body.Read just before it gets io.EOF. 

#### <a id="http2stream.onWriteTimeout" href="#http2stream.onWriteTimeout">func (st *http2stream) onWriteTimeout()</a>

```
searchKey: http.http2stream.onWriteTimeout
tags: [private]
```

```Go
func (st *http2stream) onWriteTimeout()
```

onWriteTimeout is run on its own goroutine (from time.AfterFunc) when the stream's WriteTimeout has fired. 

#### <a id="http2stream.processTrailerHeaders" href="#http2stream.processTrailerHeaders">func (st *http2stream) processTrailerHeaders(f *http2MetaHeadersFrame) error</a>

```
searchKey: http.http2stream.processTrailerHeaders
tags: [private]
```

```Go
func (st *http2stream) processTrailerHeaders(f *http2MetaHeadersFrame) error
```

### <a id="http2readFrameResult" href="#http2readFrameResult">type http2readFrameResult struct</a>

```
searchKey: http.http2readFrameResult
tags: [private]
```

```Go
type http2readFrameResult struct {
	f   http2Frame // valid until readMore is called
	err error

	// readMore should be called once the consumer no longer needs or
	// retains f. After readMore, f is invalid and more frames can be
	// read.
	readMore func()
}
```

### <a id="http2frameWriteResult" href="#http2frameWriteResult">type http2frameWriteResult struct</a>

```
searchKey: http.http2frameWriteResult
tags: [private]
```

```Go
type http2frameWriteResult struct {
	_   http2incomparable
	wr  http2FrameWriteRequest // what was written (or attempted)
	err error                  // result of the writeFrame call
}
```

frameWriteResult is the message passed from writeFrameAsync to the serve goroutine. 

### <a id="http2serverMessage" href="#http2serverMessage">type http2serverMessage int</a>

```
searchKey: http.http2serverMessage
tags: [private]
```

```Go
type http2serverMessage int
```

### <a id="http2requestParam" href="#http2requestParam">type http2requestParam struct</a>

```
searchKey: http.http2requestParam
tags: [private]
```

```Go
type http2requestParam struct {
	method                  string
	scheme, authority, path string
	header                  Header
}
```

### <a id="http2bodyReadMsg" href="#http2bodyReadMsg">type http2bodyReadMsg struct</a>

```
searchKey: http.http2bodyReadMsg
tags: [private]
```

```Go
type http2bodyReadMsg struct {
	st *http2stream
	n  int
}
```

A bodyReadMsg tells the server loop that the http.Handler read n bytes of the DATA from the client on the given stream. 

### <a id="http2requestBody" href="#http2requestBody">type http2requestBody struct</a>

```
searchKey: http.http2requestBody
tags: [private]
```

```Go
type http2requestBody struct {
	_             http2incomparable
	stream        *http2stream
	conn          *http2serverConn
	closed        bool       // for use by Close only
	sawEOF        bool       // for use by Read only
	pipe          *http2pipe // non-nil if we have a HTTP entity message body
	needsContinue bool       // need to send a 100-continue
}
```

requestBody is the Handler's Request.Body type. Read and Close may be called concurrently. 

#### <a id="http2requestBody.Close" href="#http2requestBody.Close">func (b *http2requestBody) Close() error</a>

```
searchKey: http.http2requestBody.Close
tags: [private]
```

```Go
func (b *http2requestBody) Close() error
```

#### <a id="http2requestBody.Read" href="#http2requestBody.Read">func (b *http2requestBody) Read(p []byte) (n int, err error)</a>

```
searchKey: http.http2requestBody.Read
tags: [private]
```

```Go
func (b *http2requestBody) Read(p []byte) (n int, err error)
```

### <a id="http2responseWriter" href="#http2responseWriter">type http2responseWriter struct</a>

```
searchKey: http.http2responseWriter
tags: [private]
```

```Go
type http2responseWriter struct {
	rws *http2responseWriterState
}
```

responseWriter is the http.ResponseWriter implementation. It's intentionally small (1 pointer wide) to minimize garbage. The responseWriterState pointer inside is zeroed at the end of a request (in handlerDone) and calls on the responseWriter thereafter simply crash (caller's mistake), but the much larger responseWriterState and buffers are reused between multiple requests. 

#### <a id="http2responseWriter.Flush" href="#http2responseWriter.Flush">func (w *http2responseWriter) Flush()</a>

```
searchKey: http.http2responseWriter.Flush
tags: [private]
```

```Go
func (w *http2responseWriter) Flush()
```

#### <a id="http2responseWriter.CloseNotify" href="#http2responseWriter.CloseNotify">func (w *http2responseWriter) CloseNotify() <-chan bool</a>

```
searchKey: http.http2responseWriter.CloseNotify
tags: [private]
```

```Go
func (w *http2responseWriter) CloseNotify() <-chan bool
```

#### <a id="http2responseWriter.Header" href="#http2responseWriter.Header">func (w *http2responseWriter) Header() Header</a>

```
searchKey: http.http2responseWriter.Header
tags: [private]
```

```Go
func (w *http2responseWriter) Header() Header
```

#### <a id="http2responseWriter.WriteHeader" href="#http2responseWriter.WriteHeader">func (w *http2responseWriter) WriteHeader(code int)</a>

```
searchKey: http.http2responseWriter.WriteHeader
tags: [private]
```

```Go
func (w *http2responseWriter) WriteHeader(code int)
```

#### <a id="http2responseWriter.Write" href="#http2responseWriter.Write">func (w *http2responseWriter) Write(p []byte) (n int, err error)</a>

```
searchKey: http.http2responseWriter.Write
tags: [private]
```

```Go
func (w *http2responseWriter) Write(p []byte) (n int, err error)
```

The Life Of A Write is like this: 

* Handler calls w.Write or w.WriteString -> * -> rws.bw (*bufio.Writer) -> * (Handler might call Flush) * -> chunkWriter{rws} * -> responseWriterState.writeChunk(p []byte) * -> responseWriterState.writeChunk (most of the magic; see comment there) 

#### <a id="http2responseWriter.WriteString" href="#http2responseWriter.WriteString">func (w *http2responseWriter) WriteString(s string) (n int, err error)</a>

```
searchKey: http.http2responseWriter.WriteString
tags: [private]
```

```Go
func (w *http2responseWriter) WriteString(s string) (n int, err error)
```

#### <a id="http2responseWriter.write" href="#http2responseWriter.write">func (w *http2responseWriter) write(lenData int, dataB []byte, dataS string) (n int, err error)</a>

```
searchKey: http.http2responseWriter.write
tags: [private]
```

```Go
func (w *http2responseWriter) write(lenData int, dataB []byte, dataS string) (n int, err error)
```

either dataB or dataS is non-zero. 

#### <a id="http2responseWriter.handlerDone" href="#http2responseWriter.handlerDone">func (w *http2responseWriter) handlerDone()</a>

```
searchKey: http.http2responseWriter.handlerDone
tags: [private]
```

```Go
func (w *http2responseWriter) handlerDone()
```

#### <a id="http2responseWriter.Push" href="#http2responseWriter.Push">func (w *http2responseWriter) Push(target string, opts *PushOptions) error</a>

```
searchKey: http.http2responseWriter.Push
tags: [private]
```

```Go
func (w *http2responseWriter) Push(target string, opts *PushOptions) error
```

### <a id="http2responseWriterState" href="#http2responseWriterState">type http2responseWriterState struct</a>

```
searchKey: http.http2responseWriterState
tags: [private]
```

```Go
type http2responseWriterState struct {
	// immutable within a request:
	stream *http2stream
	req    *Request
	body   *http2requestBody // to close at end of request, if DATA frames didn't
	conn   *http2serverConn

	// TODO: adjust buffer writing sizes based on server config, frame size updates from peer, etc
	bw *bufio.Writer // writing to a chunkWriter{this *responseWriterState}

	// mutated by http.Handler goroutine:
	handlerHeader Header   // nil until called
	snapHeader    Header   // snapshot of handlerHeader at WriteHeader time
	trailers      []string // set in writeChunk
	status        int      // status code passed to WriteHeader
	wroteHeader   bool     // WriteHeader called (explicitly or implicitly). Not necessarily sent to user yet.
	sentHeader    bool     // have we sent the header frame?
	handlerDone   bool     // handler has finished
	dirty         bool     // a Write failed; don't reuse this responseWriterState

	sentContentLen int64 // non-zero if handler set a Content-Length header
	wroteBytes     int64

	closeNotifierMu sync.Mutex // guards closeNotifierCh
	closeNotifierCh chan bool  // nil until first used
}
```

#### <a id="http2responseWriterState.hasTrailers" href="#http2responseWriterState.hasTrailers">func (rws *http2responseWriterState) hasTrailers() bool</a>

```
searchKey: http.http2responseWriterState.hasTrailers
tags: [private]
```

```Go
func (rws *http2responseWriterState) hasTrailers() bool
```

#### <a id="http2responseWriterState.hasNonemptyTrailers" href="#http2responseWriterState.hasNonemptyTrailers">func (rws *http2responseWriterState) hasNonemptyTrailers() bool</a>

```
searchKey: http.http2responseWriterState.hasNonemptyTrailers
tags: [private]
```

```Go
func (rws *http2responseWriterState) hasNonemptyTrailers() bool
```

#### <a id="http2responseWriterState.declareTrailer" href="#http2responseWriterState.declareTrailer">func (rws *http2responseWriterState) declareTrailer(k string)</a>

```
searchKey: http.http2responseWriterState.declareTrailer
tags: [private]
```

```Go
func (rws *http2responseWriterState) declareTrailer(k string)
```

declareTrailer is called for each Trailer header when the response header is written. It notes that a header will need to be written in the trailers at the end of the response. 

#### <a id="http2responseWriterState.writeChunk" href="#http2responseWriterState.writeChunk">func (rws *http2responseWriterState) writeChunk(p []byte) (n int, err error)</a>

```
searchKey: http.http2responseWriterState.writeChunk
tags: [private]
```

```Go
func (rws *http2responseWriterState) writeChunk(p []byte) (n int, err error)
```

writeChunk writes chunks from the bufio.Writer. But because bufio.Writer may bypass its chunking, sometimes p may be arbitrarily large. 

writeChunk is also responsible (on the first chunk) for sending the HEADER response. 

#### <a id="http2responseWriterState.promoteUndeclaredTrailers" href="#http2responseWriterState.promoteUndeclaredTrailers">func (rws *http2responseWriterState) promoteUndeclaredTrailers()</a>

```
searchKey: http.http2responseWriterState.promoteUndeclaredTrailers
tags: [private]
```

```Go
func (rws *http2responseWriterState) promoteUndeclaredTrailers()
```

promoteUndeclaredTrailers permits http.Handlers to set trailers after the header has already been flushed. Because the Go ResponseWriter interface has no way to set Trailers (only the Header), and because we didn't want to expand the ResponseWriter interface, and because nobody used trailers, and because RFC 7230 says you SHOULD (but not must) predeclare any trailers in the header, the official ResponseWriter rules said trailers in Go must be predeclared, and then we reuse the same ResponseWriter.Header() map to mean both Headers and Trailers. When it's time to write the Trailers, we pick out the fields of Headers that were declared as trailers. That worked for a while, until we found the first major user of Trailers in the wild: gRPC (using them only over http2), and gRPC libraries permit setting trailers mid-stream without predeclaring them. So: change of plans. We still permit the old way, but we also permit this hack: if a Header() key begins with "Trailer:", the suffix of that key is a Trailer. Because ':' is an invalid token byte anyway, there is no ambiguity. (And it's already filtered out) It's mildly hacky, but not terrible. 

This method runs after the Handler is done and promotes any Header fields to be trailers. 

#### <a id="http2responseWriterState.writeHeader" href="#http2responseWriterState.writeHeader">func (rws *http2responseWriterState) writeHeader(code int)</a>

```
searchKey: http.http2responseWriterState.writeHeader
tags: [private]
```

```Go
func (rws *http2responseWriterState) writeHeader(code int)
```

### <a id="http2chunkWriter" href="#http2chunkWriter">type http2chunkWriter struct</a>

```
searchKey: http.http2chunkWriter
tags: [private]
```

```Go
type http2chunkWriter struct{ rws *http2responseWriterState }
```

#### <a id="http2chunkWriter.Write" href="#http2chunkWriter.Write">func (cw http2chunkWriter) Write(p []byte) (n int, err error)</a>

```
searchKey: http.http2chunkWriter.Write
tags: [private]
```

```Go
func (cw http2chunkWriter) Write(p []byte) (n int, err error)
```

### <a id="http2startPushRequest" href="#http2startPushRequest">type http2startPushRequest struct</a>

```
searchKey: http.http2startPushRequest
tags: [private]
```

```Go
type http2startPushRequest struct {
	parent *http2stream
	method string
	url    *url.URL
	header Header
	done   chan error
}
```

### <a id="http2Transport" href="#http2Transport">type http2Transport struct</a>

```
searchKey: http.http2Transport
tags: [private]
```

```Go
type http2Transport struct {
	// DialTLS specifies an optional dial function for creating
	// TLS connections for requests.
	//
	// If DialTLS is nil, tls.Dial is used.
	//
	// If the returned net.Conn has a ConnectionState method like tls.Conn,
	// it will be used to set http.Response.TLS.
	DialTLS func(network, addr string, cfg *tls.Config) (net.Conn, error)

	// TLSClientConfig specifies the TLS configuration to use with
	// tls.Client. If nil, the default configuration is used.
	TLSClientConfig *tls.Config

	// ConnPool optionally specifies an alternate connection pool to use.
	// If nil, the default is used.
	ConnPool http2ClientConnPool

	// DisableCompression, if true, prevents the Transport from
	// requesting compression with an "Accept-Encoding: gzip"
	// request header when the Request contains no existing
	// Accept-Encoding value. If the Transport requests gzip on
	// its own and gets a gzipped response, it's transparently
	// decoded in the Response.Body. However, if the user
	// explicitly requested gzip it is not automatically
	// uncompressed.
	DisableCompression bool

	// AllowHTTP, if true, permits HTTP/2 requests using the insecure,
	// plain-text "http" scheme. Note that this does not enable h2c support.
	AllowHTTP bool

	// MaxHeaderListSize is the http2 SETTINGS_MAX_HEADER_LIST_SIZE to
	// send in the initial settings frame. It is how many bytes
	// of response headers are allowed. Unlike the http2 spec, zero here
	// means to use a default limit (currently 10MB). If you actually
	// want to advertise an unlimited value to the peer, Transport
	// interprets the highest possible value here (0xffffffff or 1<<32-1)
	// to mean no limit.
	MaxHeaderListSize uint32

	// StrictMaxConcurrentStreams controls whether the server's
	// SETTINGS_MAX_CONCURRENT_STREAMS should be respected
	// globally. If false, new TCP connections are created to the
	// server as needed to keep each under the per-connection
	// SETTINGS_MAX_CONCURRENT_STREAMS limit. If true, the
	// server's SETTINGS_MAX_CONCURRENT_STREAMS is interpreted as
	// a global limit and callers of RoundTrip block when needed,
	// waiting for their turn.
	StrictMaxConcurrentStreams bool

	// ReadIdleTimeout is the timeout after which a health check using ping
	// frame will be carried out if no frame is received on the connection.
	// Note that a ping response will is considered a received frame, so if
	// there is no other traffic on the connection, the health check will
	// be performed every ReadIdleTimeout interval.
	// If zero, no health check is performed.
	ReadIdleTimeout time.Duration

	// PingTimeout is the timeout after which the connection will be closed
	// if a response to Ping is not received.
	// Defaults to 15s.
	PingTimeout time.Duration

	// t1, if non-nil, is the standard library Transport using
	// this transport. Its settings are used (but not its
	// RoundTrip method, etc).
	t1 *Transport

	connPoolOnce  sync.Once
	connPoolOrDef http2ClientConnPool // non-nil version of ConnPool
}
```

Transport is an HTTP/2 Transport. 

A Transport internally caches connections to servers. It is safe for concurrent use by multiple goroutines. 

#### <a id="http2ConfigureTransports" href="#http2ConfigureTransports">func http2ConfigureTransports(t1 *Transport) (*http2Transport, error)</a>

```
searchKey: http.http2ConfigureTransports
tags: [private]
```

```Go
func http2ConfigureTransports(t1 *Transport) (*http2Transport, error)
```

ConfigureTransports configures a net/http HTTP/1 Transport to use HTTP/2. It returns a new HTTP/2 Transport for further configuration. It returns an error if t1 has already been HTTP/2-enabled. 

#### <a id="http2configureTransports" href="#http2configureTransports">func http2configureTransports(t1 *Transport) (*http2Transport, error)</a>

```
searchKey: http.http2configureTransports
tags: [private]
```

```Go
func http2configureTransports(t1 *Transport) (*http2Transport, error)
```

#### <a id="http2Transport.dialTLSWithContext" href="#http2Transport.dialTLSWithContext">func (t *http2Transport) dialTLSWithContext(ctx context.Context, network, addr string, cfg *tls.Config) (*tls.Conn, error)</a>

```
searchKey: http.http2Transport.dialTLSWithContext
tags: [private]
```

```Go
func (t *http2Transport) dialTLSWithContext(ctx context.Context, network, addr string, cfg *tls.Config) (*tls.Conn, error)
```

dialTLSWithContext uses tls.Dialer, added in Go 1.15, to open a TLS connection. 

#### <a id="http2Transport.maxHeaderListSize" href="#http2Transport.maxHeaderListSize">func (t *http2Transport) maxHeaderListSize() uint32</a>

```
searchKey: http.http2Transport.maxHeaderListSize
tags: [private]
```

```Go
func (t *http2Transport) maxHeaderListSize() uint32
```

#### <a id="http2Transport.disableCompression" href="#http2Transport.disableCompression">func (t *http2Transport) disableCompression() bool</a>

```
searchKey: http.http2Transport.disableCompression
tags: [private]
```

```Go
func (t *http2Transport) disableCompression() bool
```

#### <a id="http2Transport.pingTimeout" href="#http2Transport.pingTimeout">func (t *http2Transport) pingTimeout() time.Duration</a>

```
searchKey: http.http2Transport.pingTimeout
tags: [private]
```

```Go
func (t *http2Transport) pingTimeout() time.Duration
```

#### <a id="http2Transport.connPool" href="#http2Transport.connPool">func (t *http2Transport) connPool() http2ClientConnPool</a>

```
searchKey: http.http2Transport.connPool
tags: [private]
```

```Go
func (t *http2Transport) connPool() http2ClientConnPool
```

#### <a id="http2Transport.initConnPool" href="#http2Transport.initConnPool">func (t *http2Transport) initConnPool()</a>

```
searchKey: http.http2Transport.initConnPool
tags: [private]
```

```Go
func (t *http2Transport) initConnPool()
```

#### <a id="http2Transport.RoundTrip" href="#http2Transport.RoundTrip">func (t *http2Transport) RoundTrip(req *Request) (*Response, error)</a>

```
searchKey: http.http2Transport.RoundTrip
tags: [private]
```

```Go
func (t *http2Transport) RoundTrip(req *Request) (*Response, error)
```

#### <a id="http2Transport.RoundTripOpt" href="#http2Transport.RoundTripOpt">func (t *http2Transport) RoundTripOpt(req *Request, opt http2RoundTripOpt) (*Response, error)</a>

```
searchKey: http.http2Transport.RoundTripOpt
tags: [private]
```

```Go
func (t *http2Transport) RoundTripOpt(req *Request, opt http2RoundTripOpt) (*Response, error)
```

RoundTripOpt is like RoundTrip, but takes options. 

#### <a id="http2Transport.CloseIdleConnections" href="#http2Transport.CloseIdleConnections">func (t *http2Transport) CloseIdleConnections()</a>

```
searchKey: http.http2Transport.CloseIdleConnections
tags: [private]
```

```Go
func (t *http2Transport) CloseIdleConnections()
```

CloseIdleConnections closes any connections which were previously connected from previous requests but are now sitting idle. It does not interrupt any connections currently in use. 

#### <a id="http2Transport.dialClientConn" href="#http2Transport.dialClientConn">func (t *http2Transport) dialClientConn(ctx context.Context, addr string, singleUse bool) (*http2ClientConn, error)</a>

```
searchKey: http.http2Transport.dialClientConn
tags: [private]
```

```Go
func (t *http2Transport) dialClientConn(ctx context.Context, addr string, singleUse bool) (*http2ClientConn, error)
```

#### <a id="http2Transport.newTLSConfig" href="#http2Transport.newTLSConfig">func (t *http2Transport) newTLSConfig(host string) *tls.Config</a>

```
searchKey: http.http2Transport.newTLSConfig
tags: [private]
```

```Go
func (t *http2Transport) newTLSConfig(host string) *tls.Config
```

#### <a id="http2Transport.dialTLS" href="#http2Transport.dialTLS">func (t *http2Transport) dialTLS(ctx context.Context) func(string, string, *tls.Config) (net.Conn, error)</a>

```
searchKey: http.http2Transport.dialTLS
tags: [private]
```

```Go
func (t *http2Transport) dialTLS(ctx context.Context) func(string, string, *tls.Config) (net.Conn, error)
```

#### <a id="http2Transport.disableKeepAlives" href="#http2Transport.disableKeepAlives">func (t *http2Transport) disableKeepAlives() bool</a>

```
searchKey: http.http2Transport.disableKeepAlives
tags: [private]
```

```Go
func (t *http2Transport) disableKeepAlives() bool
```

disableKeepAlives reports whether connections should be closed as soon as possible after handling the first request. 

#### <a id="http2Transport.expectContinueTimeout" href="#http2Transport.expectContinueTimeout">func (t *http2Transport) expectContinueTimeout() time.Duration</a>

```
searchKey: http.http2Transport.expectContinueTimeout
tags: [private]
```

```Go
func (t *http2Transport) expectContinueTimeout() time.Duration
```

#### <a id="http2Transport.NewClientConn" href="#http2Transport.NewClientConn">func (t *http2Transport) NewClientConn(c net.Conn) (*http2ClientConn, error)</a>

```
searchKey: http.http2Transport.NewClientConn
tags: [private]
```

```Go
func (t *http2Transport) NewClientConn(c net.Conn) (*http2ClientConn, error)
```

#### <a id="http2Transport.newClientConn" href="#http2Transport.newClientConn">func (t *http2Transport) newClientConn(c net.Conn, singleUse bool) (*http2ClientConn, error)</a>

```
searchKey: http.http2Transport.newClientConn
tags: [private]
```

```Go
func (t *http2Transport) newClientConn(c net.Conn, singleUse bool) (*http2ClientConn, error)
```

#### <a id="http2Transport.vlogf" href="#http2Transport.vlogf">func (t *http2Transport) vlogf(format string, args ...interface{})</a>

```
searchKey: http.http2Transport.vlogf
tags: [private]
```

```Go
func (t *http2Transport) vlogf(format string, args ...interface{})
```

#### <a id="http2Transport.logf" href="#http2Transport.logf">func (t *http2Transport) logf(format string, args ...interface{})</a>

```
searchKey: http.http2Transport.logf
tags: [private]
```

```Go
func (t *http2Transport) logf(format string, args ...interface{})
```

#### <a id="http2Transport.getBodyWriterState" href="#http2Transport.getBodyWriterState">func (t *http2Transport) getBodyWriterState(cs *http2clientStream, body io.Reader) (s http2bodyWriterState)</a>

```
searchKey: http.http2Transport.getBodyWriterState
tags: [private]
```

```Go
func (t *http2Transport) getBodyWriterState(cs *http2clientStream, body io.Reader) (s http2bodyWriterState)
```

#### <a id="http2Transport.idleConnTimeout" href="#http2Transport.idleConnTimeout">func (t *http2Transport) idleConnTimeout() time.Duration</a>

```
searchKey: http.http2Transport.idleConnTimeout
tags: [private]
```

```Go
func (t *http2Transport) idleConnTimeout() time.Duration
```

### <a id="http2ClientConn" href="#http2ClientConn">type http2ClientConn struct</a>

```
searchKey: http.http2ClientConn
tags: [private]
```

```Go
type http2ClientConn struct {
	t         *http2Transport
	tconn     net.Conn             // usually *tls.Conn, except specialized impls
	tlsState  *tls.ConnectionState // nil only for specialized impls
	reused    uint32               // whether conn is being reused; atomic
	singleUse bool                 // whether being used for a single http.Request

	// readLoop goroutine fields:
	readerDone chan struct{} // closed on error
	readerErr  error         // set before readerDone is closed

	idleTimeout time.Duration // or 0 for never
	idleTimer   *time.Timer

	mu              sync.Mutex // guards following
	cond            *sync.Cond // hold mu; broadcast on flow/closed changes
	flow            http2flow  // our conn-level flow control quota (cs.flow is per stream)
	inflow          http2flow  // peer's conn-level flow control
	closing         bool
	closed          bool
	wantSettingsAck bool                          // we sent a SETTINGS frame and haven't heard back
	goAway          *http2GoAwayFrame             // if non-nil, the GoAwayFrame we received
	goAwayDebug     string                        // goAway frame's debug data, retained as a string
	streams         map[uint32]*http2clientStream // client-initiated
	nextStreamID    uint32
	pendingRequests int                       // requests blocked and waiting to be sent because len(streams) == maxConcurrentStreams
	pings           map[[8]byte]chan struct{} // in flight ping data to notification channel
	bw              *bufio.Writer
	br              *bufio.Reader
	fr              *http2Framer
	lastActive      time.Time
	lastIdle        time.Time // time last idle
	// Settings from peer: (also guarded by mu)
	maxFrameSize          uint32
	maxConcurrentStreams  uint32
	peerMaxHeaderListSize uint64
	initialWindowSize     uint32

	hbuf    bytes.Buffer // HPACK encoder writes into this
	henc    *hpack.Encoder
	freeBuf [][]byte

	wmu  sync.Mutex // held while writing; acquire AFTER mu if holding both
	werr error      // first write error that has occurred
}
```

ClientConn is the state of a single HTTP/2 client connection to an HTTP/2 server. 

#### <a id="http2ClientConn.healthCheck" href="#http2ClientConn.healthCheck">func (cc *http2ClientConn) healthCheck()</a>

```
searchKey: http.http2ClientConn.healthCheck
tags: [private]
```

```Go
func (cc *http2ClientConn) healthCheck()
```

#### <a id="http2ClientConn.setGoAway" href="#http2ClientConn.setGoAway">func (cc *http2ClientConn) setGoAway(f *http2GoAwayFrame)</a>

```
searchKey: http.http2ClientConn.setGoAway
tags: [private]
```

```Go
func (cc *http2ClientConn) setGoAway(f *http2GoAwayFrame)
```

#### <a id="http2ClientConn.CanTakeNewRequest" href="#http2ClientConn.CanTakeNewRequest">func (cc *http2ClientConn) CanTakeNewRequest() bool</a>

```
searchKey: http.http2ClientConn.CanTakeNewRequest
tags: [private]
```

```Go
func (cc *http2ClientConn) CanTakeNewRequest() bool
```

CanTakeNewRequest reports whether the connection can take a new request, meaning it has not been closed or received or sent a GOAWAY. 

#### <a id="http2ClientConn.idleState" href="#http2ClientConn.idleState">func (cc *http2ClientConn) idleState() http2clientConnIdleState</a>

```
searchKey: http.http2ClientConn.idleState
tags: [private]
```

```Go
func (cc *http2ClientConn) idleState() http2clientConnIdleState
```

#### <a id="http2ClientConn.idleStateLocked" href="#http2ClientConn.idleStateLocked">func (cc *http2ClientConn) idleStateLocked() (st http2clientConnIdleState)</a>

```
searchKey: http.http2ClientConn.idleStateLocked
tags: [private]
```

```Go
func (cc *http2ClientConn) idleStateLocked() (st http2clientConnIdleState)
```

#### <a id="http2ClientConn.canTakeNewRequestLocked" href="#http2ClientConn.canTakeNewRequestLocked">func (cc *http2ClientConn) canTakeNewRequestLocked() bool</a>

```
searchKey: http.http2ClientConn.canTakeNewRequestLocked
tags: [private]
```

```Go
func (cc *http2ClientConn) canTakeNewRequestLocked() bool
```

#### <a id="http2ClientConn.tooIdleLocked" href="#http2ClientConn.tooIdleLocked">func (cc *http2ClientConn) tooIdleLocked() bool</a>

```
searchKey: http.http2ClientConn.tooIdleLocked
tags: [private]
```

```Go
func (cc *http2ClientConn) tooIdleLocked() bool
```

tooIdleLocked reports whether this connection has been been sitting idle for too much wall time. 

#### <a id="http2ClientConn.onIdleTimeout" href="#http2ClientConn.onIdleTimeout">func (cc *http2ClientConn) onIdleTimeout()</a>

```
searchKey: http.http2ClientConn.onIdleTimeout
tags: [private]
```

```Go
func (cc *http2ClientConn) onIdleTimeout()
```

onIdleTimeout is called from a time.AfterFunc goroutine. It will only be called when we're idle, but because we're coming from a new goroutine, there could be a new request coming in at the same time, so this simply calls the synchronized closeIfIdle to shut down this connection. The timer could just call closeIfIdle, but this is more clear. 

#### <a id="http2ClientConn.closeIfIdle" href="#http2ClientConn.closeIfIdle">func (cc *http2ClientConn) closeIfIdle()</a>

```
searchKey: http.http2ClientConn.closeIfIdle
tags: [private]
```

```Go
func (cc *http2ClientConn) closeIfIdle()
```

#### <a id="http2ClientConn.Shutdown" href="#http2ClientConn.Shutdown">func (cc *http2ClientConn) Shutdown(ctx context.Context) error</a>

```
searchKey: http.http2ClientConn.Shutdown
tags: [private]
```

```Go
func (cc *http2ClientConn) Shutdown(ctx context.Context) error
```

Shutdown gracefully close the client connection, waiting for running streams to complete. 

#### <a id="http2ClientConn.sendGoAway" href="#http2ClientConn.sendGoAway">func (cc *http2ClientConn) sendGoAway() error</a>

```
searchKey: http.http2ClientConn.sendGoAway
tags: [private]
```

```Go
func (cc *http2ClientConn) sendGoAway() error
```

#### <a id="http2ClientConn.closeForError" href="#http2ClientConn.closeForError">func (cc *http2ClientConn) closeForError(err error) error</a>

```
searchKey: http.http2ClientConn.closeForError
tags: [private]
```

```Go
func (cc *http2ClientConn) closeForError(err error) error
```

closes the client connection immediately. In-flight requests are interrupted. err is sent to streams. 

#### <a id="http2ClientConn.Close" href="#http2ClientConn.Close">func (cc *http2ClientConn) Close() error</a>

```
searchKey: http.http2ClientConn.Close
tags: [private]
```

```Go
func (cc *http2ClientConn) Close() error
```

Close closes the client connection immediately. 

In-flight requests are interrupted. For a graceful shutdown, use Shutdown instead. 

#### <a id="http2ClientConn.closeForLostPing" href="#http2ClientConn.closeForLostPing">func (cc *http2ClientConn) closeForLostPing() error</a>

```
searchKey: http.http2ClientConn.closeForLostPing
tags: [private]
```

```Go
func (cc *http2ClientConn) closeForLostPing() error
```

closes the client connection immediately. In-flight requests are interrupted. 

#### <a id="http2ClientConn.frameScratchBuffer" href="#http2ClientConn.frameScratchBuffer">func (cc *http2ClientConn) frameScratchBuffer() []byte</a>

```
searchKey: http.http2ClientConn.frameScratchBuffer
tags: [private]
```

```Go
func (cc *http2ClientConn) frameScratchBuffer() []byte
```

frameBuffer returns a scratch buffer suitable for writing DATA frames. They're capped at the min of the peer's max frame size or 512KB (kinda arbitrarily), but definitely capped so we don't allocate 4GB bufers. 

#### <a id="http2ClientConn.putFrameScratchBuffer" href="#http2ClientConn.putFrameScratchBuffer">func (cc *http2ClientConn) putFrameScratchBuffer(buf []byte)</a>

```
searchKey: http.http2ClientConn.putFrameScratchBuffer
tags: [private]
```

```Go
func (cc *http2ClientConn) putFrameScratchBuffer(buf []byte)
```

#### <a id="http2ClientConn.responseHeaderTimeout" href="#http2ClientConn.responseHeaderTimeout">func (cc *http2ClientConn) responseHeaderTimeout() time.Duration</a>

```
searchKey: http.http2ClientConn.responseHeaderTimeout
tags: [private]
```

```Go
func (cc *http2ClientConn) responseHeaderTimeout() time.Duration
```

#### <a id="http2ClientConn.RoundTrip" href="#http2ClientConn.RoundTrip">func (cc *http2ClientConn) RoundTrip(req *Request) (*Response, error)</a>

```
searchKey: http.http2ClientConn.RoundTrip
tags: [private]
```

```Go
func (cc *http2ClientConn) RoundTrip(req *Request) (*Response, error)
```

#### <a id="http2ClientConn.roundTrip" href="#http2ClientConn.roundTrip">func (cc *http2ClientConn) roundTrip(req *Request) (res *Response, gotErrAfterReqBodyWrite bool, err error)</a>

```
searchKey: http.http2ClientConn.roundTrip
tags: [private]
```

```Go
func (cc *http2ClientConn) roundTrip(req *Request) (res *Response, gotErrAfterReqBodyWrite bool, err error)
```

#### <a id="http2ClientConn.awaitOpenSlotForRequest" href="#http2ClientConn.awaitOpenSlotForRequest">func (cc *http2ClientConn) awaitOpenSlotForRequest(req *Request) error</a>

```
searchKey: http.http2ClientConn.awaitOpenSlotForRequest
tags: [private]
```

```Go
func (cc *http2ClientConn) awaitOpenSlotForRequest(req *Request) error
```

awaitOpenSlotForRequest waits until len(streams) < maxConcurrentStreams. Must hold cc.mu. 

#### <a id="http2ClientConn.writeHeaders" href="#http2ClientConn.writeHeaders">func (cc *http2ClientConn) writeHeaders(streamID uint32, endStream bool, maxFrameSize int, hdrs []byte) error</a>

```
searchKey: http.http2ClientConn.writeHeaders
tags: [private]
```

```Go
func (cc *http2ClientConn) writeHeaders(streamID uint32, endStream bool, maxFrameSize int, hdrs []byte) error
```

requires cc.wmu be held 

#### <a id="http2ClientConn.encodeHeaders" href="#http2ClientConn.encodeHeaders">func (cc *http2ClientConn) encodeHeaders(req *Request, addGzipHeader bool, trailers string, contentLength int64) ([]byte, error)</a>

```
searchKey: http.http2ClientConn.encodeHeaders
tags: [private]
```

```Go
func (cc *http2ClientConn) encodeHeaders(req *Request, addGzipHeader bool, trailers string, contentLength int64) ([]byte, error)
```

requires cc.mu be held. 

#### <a id="http2ClientConn.encodeTrailers" href="#http2ClientConn.encodeTrailers">func (cc *http2ClientConn) encodeTrailers(req *Request) ([]byte, error)</a>

```
searchKey: http.http2ClientConn.encodeTrailers
tags: [private]
```

```Go
func (cc *http2ClientConn) encodeTrailers(req *Request) ([]byte, error)
```

requires cc.mu be held. 

#### <a id="http2ClientConn.writeHeader" href="#http2ClientConn.writeHeader">func (cc *http2ClientConn) writeHeader(name, value string)</a>

```
searchKey: http.http2ClientConn.writeHeader
tags: [private]
```

```Go
func (cc *http2ClientConn) writeHeader(name, value string)
```

#### <a id="http2ClientConn.newStream" href="#http2ClientConn.newStream">func (cc *http2ClientConn) newStream() *http2clientStream</a>

```
searchKey: http.http2ClientConn.newStream
tags: [private]
```

```Go
func (cc *http2ClientConn) newStream() *http2clientStream
```

requires cc.mu be held. 

#### <a id="http2ClientConn.forgetStreamID" href="#http2ClientConn.forgetStreamID">func (cc *http2ClientConn) forgetStreamID(id uint32)</a>

```
searchKey: http.http2ClientConn.forgetStreamID
tags: [private]
```

```Go
func (cc *http2ClientConn) forgetStreamID(id uint32)
```

#### <a id="http2ClientConn.streamByID" href="#http2ClientConn.streamByID">func (cc *http2ClientConn) streamByID(id uint32, andRemove bool) *http2clientStream</a>

```
searchKey: http.http2ClientConn.streamByID
tags: [private]
```

```Go
func (cc *http2ClientConn) streamByID(id uint32, andRemove bool) *http2clientStream
```

#### <a id="http2ClientConn.readLoop" href="#http2ClientConn.readLoop">func (cc *http2ClientConn) readLoop()</a>

```
searchKey: http.http2ClientConn.readLoop
tags: [private]
```

```Go
func (cc *http2ClientConn) readLoop()
```

readLoop runs in its own goroutine and reads and dispatches frames. 

#### <a id="http2ClientConn.Ping" href="#http2ClientConn.Ping">func (cc *http2ClientConn) Ping(ctx context.Context) error</a>

```
searchKey: http.http2ClientConn.Ping
tags: [private]
```

```Go
func (cc *http2ClientConn) Ping(ctx context.Context) error
```

Ping sends a PING frame to the server and waits for the ack. 

#### <a id="http2ClientConn.writeStreamReset" href="#http2ClientConn.writeStreamReset">func (cc *http2ClientConn) writeStreamReset(streamID uint32, code http2ErrCode, err error)</a>

```
searchKey: http.http2ClientConn.writeStreamReset
tags: [private]
```

```Go
func (cc *http2ClientConn) writeStreamReset(streamID uint32, code http2ErrCode, err error)
```

#### <a id="http2ClientConn.logf" href="#http2ClientConn.logf">func (cc *http2ClientConn) logf(format string, args ...interface{})</a>

```
searchKey: http.http2ClientConn.logf
tags: [private]
```

```Go
func (cc *http2ClientConn) logf(format string, args ...interface{})
```

#### <a id="http2ClientConn.vlogf" href="#http2ClientConn.vlogf">func (cc *http2ClientConn) vlogf(format string, args ...interface{})</a>

```
searchKey: http.http2ClientConn.vlogf
tags: [private]
```

```Go
func (cc *http2ClientConn) vlogf(format string, args ...interface{})
```

### <a id="http2clientStream" href="#http2clientStream">type http2clientStream struct</a>

```
searchKey: http.http2clientStream
tags: [private]
```

```Go
type http2clientStream struct {
	cc            *http2ClientConn
	req           *Request
	trace         *httptrace.ClientTrace // or nil
	ID            uint32
	resc          chan http2resAndError
	bufPipe       http2pipe // buffered pipe with the flow-controlled response payload
	startedWrite  bool      // started request body write; guarded by cc.mu
	requestedGzip bool
	on100         func() // optional code to run if get a 100 continue response

	flow        http2flow // guarded by cc.mu
	inflow      http2flow // guarded by cc.mu
	bytesRemain int64     // -1 means unknown; owned by transportResponseBody.Read
	readErr     error     // sticky read error; owned by transportResponseBody.Read
	stopReqBody error     // if non-nil, stop writing req body; guarded by cc.mu
	didReset    bool      // whether we sent a RST_STREAM to the server; guarded by cc.mu

	peerReset chan struct{} // closed on peer reset
	resetErr  error         // populated before peerReset is closed

	done chan struct{} // closed when stream remove from cc.streams map; close calls guarded by cc.mu

	// owned by clientConnReadLoop:
	firstByte    bool  // got the first response byte
	pastHeaders  bool  // got first MetaHeadersFrame (actual headers)
	pastTrailers bool  // got optional second MetaHeadersFrame (trailers)
	num1xx       uint8 // number of 1xx responses seen

	trailer    Header  // accumulated trailers
	resTrailer *Header // client's Response.Trailer
}
```

clientStream is the state for a single HTTP/2 stream. One of these is created for each Transport.RoundTrip call. 

#### <a id="http2clientStream.get1xxTraceFunc" href="#http2clientStream.get1xxTraceFunc">func (cs *http2clientStream) get1xxTraceFunc() func(int, textproto.MIMEHeader) error</a>

```
searchKey: http.http2clientStream.get1xxTraceFunc
tags: [private]
```

```Go
func (cs *http2clientStream) get1xxTraceFunc() func(int, textproto.MIMEHeader) error
```

get1xxTraceFunc returns the value of request's httptrace.ClientTrace.Got1xxResponse func, if any. It returns nil if not set or if the Go version is too old. 

#### <a id="http2clientStream.awaitRequestCancel" href="#http2clientStream.awaitRequestCancel">func (cs *http2clientStream) awaitRequestCancel(req *Request)</a>

```
searchKey: http.http2clientStream.awaitRequestCancel
tags: [private]
```

```Go
func (cs *http2clientStream) awaitRequestCancel(req *Request)
```

awaitRequestCancel waits for the user to cancel a request, its context to expire, or for the request to be done (any way it might be removed from the cc.streams map: peer reset, successful completion, TCP connection breakage, etc). If the request is canceled, then cs will be canceled and closed. 

#### <a id="http2clientStream.cancelStream" href="#http2clientStream.cancelStream">func (cs *http2clientStream) cancelStream()</a>

```
searchKey: http.http2clientStream.cancelStream
tags: [private]
```

```Go
func (cs *http2clientStream) cancelStream()
```

#### <a id="http2clientStream.checkResetOrDone" href="#http2clientStream.checkResetOrDone">func (cs *http2clientStream) checkResetOrDone() error</a>

```
searchKey: http.http2clientStream.checkResetOrDone
tags: [private]
```

```Go
func (cs *http2clientStream) checkResetOrDone() error
```

checkResetOrDone reports any error sent in a RST_STREAM frame by the server, or errStreamClosed if the stream is complete. 

#### <a id="http2clientStream.getStartedWrite" href="#http2clientStream.getStartedWrite">func (cs *http2clientStream) getStartedWrite() bool</a>

```
searchKey: http.http2clientStream.getStartedWrite
tags: [private]
```

```Go
func (cs *http2clientStream) getStartedWrite() bool
```

#### <a id="http2clientStream.abortRequestBodyWrite" href="#http2clientStream.abortRequestBodyWrite">func (cs *http2clientStream) abortRequestBodyWrite(err error)</a>

```
searchKey: http.http2clientStream.abortRequestBodyWrite
tags: [private]
```

```Go
func (cs *http2clientStream) abortRequestBodyWrite(err error)
```

#### <a id="http2clientStream.writeRequestBody" href="#http2clientStream.writeRequestBody">func (cs *http2clientStream) writeRequestBody(body io.Reader, bodyCloser io.Closer) (err error)</a>

```
searchKey: http.http2clientStream.writeRequestBody
tags: [private]
```

```Go
func (cs *http2clientStream) writeRequestBody(body io.Reader, bodyCloser io.Closer) (err error)
```

#### <a id="http2clientStream.awaitFlowControl" href="#http2clientStream.awaitFlowControl">func (cs *http2clientStream) awaitFlowControl(maxBytes int) (taken int32, err error)</a>

```
searchKey: http.http2clientStream.awaitFlowControl
tags: [private]
```

```Go
func (cs *http2clientStream) awaitFlowControl(maxBytes int) (taken int32, err error)
```

awaitFlowControl waits for [1, min(maxBytes, cc.cs.maxFrameSize)] flow control tokens from the server. It returns either the non-zero number of tokens taken or an error if the stream is dead. 

#### <a id="http2clientStream.copyTrailers" href="#http2clientStream.copyTrailers">func (cs *http2clientStream) copyTrailers()</a>

```
searchKey: http.http2clientStream.copyTrailers
tags: [private]
```

```Go
func (cs *http2clientStream) copyTrailers()
```

### <a id="http2stickyErrWriter" href="#http2stickyErrWriter">type http2stickyErrWriter struct</a>

```
searchKey: http.http2stickyErrWriter
tags: [private]
```

```Go
type http2stickyErrWriter struct {
	w   io.Writer
	err *error
}
```

#### <a id="http2stickyErrWriter.Write" href="#http2stickyErrWriter.Write">func (sew http2stickyErrWriter) Write(p []byte) (n int, err error)</a>

```
searchKey: http.http2stickyErrWriter.Write
tags: [private]
```

```Go
func (sew http2stickyErrWriter) Write(p []byte) (n int, err error)
```

### <a id="http2noCachedConnError" href="#http2noCachedConnError">type http2noCachedConnError struct{}</a>

```
searchKey: http.http2noCachedConnError
tags: [private]
```

```Go
type http2noCachedConnError struct{}
```

noCachedConnError is the concrete type of ErrNoCachedConn, which needs to be detected by net/http regardless of whether it's its bundled version (in h2_bundle.go with a rewritten type name) or from a user's x/net/http2. As such, as it has a unique method name (IsHTTP2NoCachedConnError) that net/http sniffs for via func isNoCachedConnError. 

#### <a id="http2noCachedConnError.IsHTTP2NoCachedConnError" href="#http2noCachedConnError.IsHTTP2NoCachedConnError">func (http2noCachedConnError) IsHTTP2NoCachedConnError()</a>

```
searchKey: http.http2noCachedConnError.IsHTTP2NoCachedConnError
tags: [private]
```

```Go
func (http2noCachedConnError) IsHTTP2NoCachedConnError()
```

#### <a id="http2noCachedConnError.Error" href="#http2noCachedConnError.Error">func (http2noCachedConnError) Error() string</a>

```
searchKey: http.http2noCachedConnError.Error
tags: [private]
```

```Go
func (http2noCachedConnError) Error() string
```

### <a id="http2RoundTripOpt" href="#http2RoundTripOpt">type http2RoundTripOpt struct</a>

```
searchKey: http.http2RoundTripOpt
tags: [private]
```

```Go
type http2RoundTripOpt struct {
	// OnlyCachedConn controls whether RoundTripOpt may
	// create a new TCP connection. If set true and
	// no cached connection is available, RoundTripOpt
	// will return ErrNoCachedConn.
	OnlyCachedConn bool
}
```

RoundTripOpt are options for the Transport.RoundTripOpt method. 

### <a id="http2clientConnIdleState" href="#http2clientConnIdleState">type http2clientConnIdleState struct</a>

```
searchKey: http.http2clientConnIdleState
tags: [private]
```

```Go
type http2clientConnIdleState struct {
	canTakeNewRequest bool
	freshConn         bool // whether it's unused by any previous request
}
```

clientConnIdleState describes the suitability of a client connection to initiate a new RoundTrip request. 

### <a id="http2resAndError" href="#http2resAndError">type http2resAndError struct</a>

```
searchKey: http.http2resAndError
tags: [private]
```

```Go
type http2resAndError struct {
	_   http2incomparable
	res *Response
	err error
}
```

### <a id="http2clientConnReadLoop" href="#http2clientConnReadLoop">type http2clientConnReadLoop struct</a>

```
searchKey: http.http2clientConnReadLoop
tags: [private]
```

```Go
type http2clientConnReadLoop struct {
	_             http2incomparable
	cc            *http2ClientConn
	closeWhenIdle bool
}
```

clientConnReadLoop is the state owned by the clientConn's frame-reading readLoop. 

#### <a id="http2clientConnReadLoop.cleanup" href="#http2clientConnReadLoop.cleanup">func (rl *http2clientConnReadLoop) cleanup()</a>

```
searchKey: http.http2clientConnReadLoop.cleanup
tags: [private]
```

```Go
func (rl *http2clientConnReadLoop) cleanup()
```

#### <a id="http2clientConnReadLoop.run" href="#http2clientConnReadLoop.run">func (rl *http2clientConnReadLoop) run() error</a>

```
searchKey: http.http2clientConnReadLoop.run
tags: [private]
```

```Go
func (rl *http2clientConnReadLoop) run() error
```

#### <a id="http2clientConnReadLoop.processHeaders" href="#http2clientConnReadLoop.processHeaders">func (rl *http2clientConnReadLoop) processHeaders(f *http2MetaHeadersFrame) error</a>

```
searchKey: http.http2clientConnReadLoop.processHeaders
tags: [private]
```

```Go
func (rl *http2clientConnReadLoop) processHeaders(f *http2MetaHeadersFrame) error
```

#### <a id="http2clientConnReadLoop.handleResponse" href="#http2clientConnReadLoop.handleResponse">func (rl *http2clientConnReadLoop) handleResponse(cs *http2clientStream, f *http2MetaHeadersFrame) (*Response, error)</a>

```
searchKey: http.http2clientConnReadLoop.handleResponse
tags: [private]
```

```Go
func (rl *http2clientConnReadLoop) handleResponse(cs *http2clientStream, f *http2MetaHeadersFrame) (*Response, error)
```

may return error types nil, or ConnectionError. Any other error value is a StreamError of type ErrCodeProtocol. The returned error in that case is the detail. 

As a special case, handleResponse may return (nil, nil) to skip the frame (currently only used for 1xx responses). 

#### <a id="http2clientConnReadLoop.processTrailers" href="#http2clientConnReadLoop.processTrailers">func (rl *http2clientConnReadLoop) processTrailers(cs *http2clientStream, f *http2MetaHeadersFrame) error</a>

```
searchKey: http.http2clientConnReadLoop.processTrailers
tags: [private]
```

```Go
func (rl *http2clientConnReadLoop) processTrailers(cs *http2clientStream, f *http2MetaHeadersFrame) error
```

#### <a id="http2clientConnReadLoop.processData" href="#http2clientConnReadLoop.processData">func (rl *http2clientConnReadLoop) processData(f *http2DataFrame) error</a>

```
searchKey: http.http2clientConnReadLoop.processData
tags: [private]
```

```Go
func (rl *http2clientConnReadLoop) processData(f *http2DataFrame) error
```

#### <a id="http2clientConnReadLoop.endStream" href="#http2clientConnReadLoop.endStream">func (rl *http2clientConnReadLoop) endStream(cs *http2clientStream)</a>

```
searchKey: http.http2clientConnReadLoop.endStream
tags: [private]
```

```Go
func (rl *http2clientConnReadLoop) endStream(cs *http2clientStream)
```

#### <a id="http2clientConnReadLoop.endStreamError" href="#http2clientConnReadLoop.endStreamError">func (rl *http2clientConnReadLoop) endStreamError(cs *http2clientStream, err error)</a>

```
searchKey: http.http2clientConnReadLoop.endStreamError
tags: [private]
```

```Go
func (rl *http2clientConnReadLoop) endStreamError(cs *http2clientStream, err error)
```

#### <a id="http2clientConnReadLoop.processGoAway" href="#http2clientConnReadLoop.processGoAway">func (rl *http2clientConnReadLoop) processGoAway(f *http2GoAwayFrame) error</a>

```
searchKey: http.http2clientConnReadLoop.processGoAway
tags: [private]
```

```Go
func (rl *http2clientConnReadLoop) processGoAway(f *http2GoAwayFrame) error
```

#### <a id="http2clientConnReadLoop.processSettings" href="#http2clientConnReadLoop.processSettings">func (rl *http2clientConnReadLoop) processSettings(f *http2SettingsFrame) error</a>

```
searchKey: http.http2clientConnReadLoop.processSettings
tags: [private]
```

```Go
func (rl *http2clientConnReadLoop) processSettings(f *http2SettingsFrame) error
```

#### <a id="http2clientConnReadLoop.processWindowUpdate" href="#http2clientConnReadLoop.processWindowUpdate">func (rl *http2clientConnReadLoop) processWindowUpdate(f *http2WindowUpdateFrame) error</a>

```
searchKey: http.http2clientConnReadLoop.processWindowUpdate
tags: [private]
```

```Go
func (rl *http2clientConnReadLoop) processWindowUpdate(f *http2WindowUpdateFrame) error
```

#### <a id="http2clientConnReadLoop.processResetStream" href="#http2clientConnReadLoop.processResetStream">func (rl *http2clientConnReadLoop) processResetStream(f *http2RSTStreamFrame) error</a>

```
searchKey: http.http2clientConnReadLoop.processResetStream
tags: [private]
```

```Go
func (rl *http2clientConnReadLoop) processResetStream(f *http2RSTStreamFrame) error
```

#### <a id="http2clientConnReadLoop.processPing" href="#http2clientConnReadLoop.processPing">func (rl *http2clientConnReadLoop) processPing(f *http2PingFrame) error</a>

```
searchKey: http.http2clientConnReadLoop.processPing
tags: [private]
```

```Go
func (rl *http2clientConnReadLoop) processPing(f *http2PingFrame) error
```

#### <a id="http2clientConnReadLoop.processPushPromise" href="#http2clientConnReadLoop.processPushPromise">func (rl *http2clientConnReadLoop) processPushPromise(f *http2PushPromiseFrame) error</a>

```
searchKey: http.http2clientConnReadLoop.processPushPromise
tags: [private]
```

```Go
func (rl *http2clientConnReadLoop) processPushPromise(f *http2PushPromiseFrame) error
```

### <a id="http2GoAwayError" href="#http2GoAwayError">type http2GoAwayError struct</a>

```
searchKey: http.http2GoAwayError
tags: [private]
```

```Go
type http2GoAwayError struct {
	LastStreamID uint32
	ErrCode      http2ErrCode
	DebugData    string
}
```

GoAwayError is returned by the Transport when the server closes the TCP connection after sending a GOAWAY frame. 

#### <a id="http2GoAwayError.Error" href="#http2GoAwayError.Error">func (e http2GoAwayError) Error() string</a>

```
searchKey: http.http2GoAwayError.Error
tags: [private]
```

```Go
func (e http2GoAwayError) Error() string
```

### <a id="http2transportResponseBody" href="#http2transportResponseBody">type http2transportResponseBody struct</a>

```
searchKey: http.http2transportResponseBody
tags: [private]
```

```Go
type http2transportResponseBody struct {
	cs *http2clientStream
}
```

transportResponseBody is the concrete type of Transport.RoundTrip's Response.Body. It is an io.ReadCloser. On Read, it reads from cs.body. On Close it sends RST_STREAM if EOF wasn't already seen. 

#### <a id="http2transportResponseBody.Read" href="#http2transportResponseBody.Read">func (b http2transportResponseBody) Read(p []byte) (n int, err error)</a>

```
searchKey: http.http2transportResponseBody.Read
tags: [private]
```

```Go
func (b http2transportResponseBody) Read(p []byte) (n int, err error)
```

#### <a id="http2transportResponseBody.Close" href="#http2transportResponseBody.Close">func (b http2transportResponseBody) Close() error</a>

```
searchKey: http.http2transportResponseBody.Close
tags: [private]
```

```Go
func (b http2transportResponseBody) Close() error
```

### <a id="http2erringRoundTripper" href="#http2erringRoundTripper">type http2erringRoundTripper struct</a>

```
searchKey: http.http2erringRoundTripper
tags: [private]
```

```Go
type http2erringRoundTripper struct{ err error }
```

#### <a id="http2erringRoundTripper.RoundTripErr" href="#http2erringRoundTripper.RoundTripErr">func (rt http2erringRoundTripper) RoundTripErr() error</a>

```
searchKey: http.http2erringRoundTripper.RoundTripErr
tags: [private]
```

```Go
func (rt http2erringRoundTripper) RoundTripErr() error
```

#### <a id="http2erringRoundTripper.RoundTrip" href="#http2erringRoundTripper.RoundTrip">func (rt http2erringRoundTripper) RoundTrip(*Request) (*Response, error)</a>

```
searchKey: http.http2erringRoundTripper.RoundTrip
tags: [private]
```

```Go
func (rt http2erringRoundTripper) RoundTrip(*Request) (*Response, error)
```

### <a id="http2gzipReader" href="#http2gzipReader">type http2gzipReader struct</a>

```
searchKey: http.http2gzipReader
tags: [private]
```

```Go
type http2gzipReader struct {
	_    http2incomparable
	body io.ReadCloser // underlying Response.Body
	zr   *gzip.Reader  // lazily-initialized gzip reader
	zerr error         // sticky error
}
```

gzipReader wraps a response body so it can lazily call gzip.NewReader on the first call to Read 

#### <a id="http2gzipReader.Read" href="#http2gzipReader.Read">func (gz *http2gzipReader) Read(p []byte) (n int, err error)</a>

```
searchKey: http.http2gzipReader.Read
tags: [private]
```

```Go
func (gz *http2gzipReader) Read(p []byte) (n int, err error)
```

#### <a id="http2gzipReader.Close" href="#http2gzipReader.Close">func (gz *http2gzipReader) Close() error</a>

```
searchKey: http.http2gzipReader.Close
tags: [private]
```

```Go
func (gz *http2gzipReader) Close() error
```

### <a id="http2errorReader" href="#http2errorReader">type http2errorReader struct</a>

```
searchKey: http.http2errorReader
tags: [private]
```

```Go
type http2errorReader struct{ err error }
```

#### <a id="http2errorReader.Read" href="#http2errorReader.Read">func (r http2errorReader) Read(p []byte) (int, error)</a>

```
searchKey: http.http2errorReader.Read
tags: [private]
```

```Go
func (r http2errorReader) Read(p []byte) (int, error)
```

### <a id="http2bodyWriterState" href="#http2bodyWriterState">type http2bodyWriterState struct</a>

```
searchKey: http.http2bodyWriterState
tags: [private]
```

```Go
type http2bodyWriterState struct {
	cs     *http2clientStream
	timer  *time.Timer   // if non-nil, we're doing a delayed write
	fnonce *sync.Once    // to call fn with
	fn     func()        // the code to run in the goroutine, writing the body
	resc   chan error    // result of fn's execution
	delay  time.Duration // how long we should delay a delayed write for
}
```

bodyWriterState encapsulates various state around the Transport's writing of the request body, particularly regarding doing delayed writes of the body when the request contains "Expect: 100-continue". 

#### <a id="http2bodyWriterState.cancel" href="#http2bodyWriterState.cancel">func (s http2bodyWriterState) cancel()</a>

```
searchKey: http.http2bodyWriterState.cancel
tags: [private]
```

```Go
func (s http2bodyWriterState) cancel()
```

#### <a id="http2bodyWriterState.on100" href="#http2bodyWriterState.on100">func (s http2bodyWriterState) on100()</a>

```
searchKey: http.http2bodyWriterState.on100
tags: [private]
```

```Go
func (s http2bodyWriterState) on100()
```

#### <a id="http2bodyWriterState.scheduleBodyWrite" href="#http2bodyWriterState.scheduleBodyWrite">func (s http2bodyWriterState) scheduleBodyWrite()</a>

```
searchKey: http.http2bodyWriterState.scheduleBodyWrite
tags: [private]
```

```Go
func (s http2bodyWriterState) scheduleBodyWrite()
```

scheduleBodyWrite starts writing the body, either immediately (in the common case) or after the delay timeout. It should not be called until after the headers have been written. 

### <a id="http2noDialH2RoundTripper" href="#http2noDialH2RoundTripper">type http2noDialH2RoundTripper struct</a>

```
searchKey: http.http2noDialH2RoundTripper
tags: [private]
```

```Go
type http2noDialH2RoundTripper struct{ *http2Transport }
```

noDialH2RoundTripper is a RoundTripper which only tries to complete the request if there's already has a cached connection to the host. (The field is exported so it can be accessed via reflect from net/http; tested by TestNoDialH2RoundTripperType) 

#### <a id="http2noDialH2RoundTripper.RoundTrip" href="#http2noDialH2RoundTripper.RoundTrip">func (rt http2noDialH2RoundTripper) RoundTrip(req *Request) (*Response, error)</a>

```
searchKey: http.http2noDialH2RoundTripper.RoundTrip
tags: [private]
```

```Go
func (rt http2noDialH2RoundTripper) RoundTrip(req *Request) (*Response, error)
```

### <a id="http2writeFramer" href="#http2writeFramer">type http2writeFramer interface</a>

```
searchKey: http.http2writeFramer
tags: [private]
```

```Go
type http2writeFramer interface {
	writeFrame(http2writeContext) error

	// staysWithinBuffer reports whether this writer promises that
	// it will only write less than or equal to size bytes, and it
	// won't Flush the write context.
	staysWithinBuffer(size int) bool
}
```

writeFramer is implemented by any type that is used to write frames. 

### <a id="http2writeContext" href="#http2writeContext">type http2writeContext interface</a>

```
searchKey: http.http2writeContext
tags: [private]
```

```Go
type http2writeContext interface {
	Framer() *http2Framer
	Flush() error
	CloseConn() error
	// HeaderEncoder returns an HPACK encoder that writes to the
	// returned buffer.
	HeaderEncoder() (*hpack.Encoder, *bytes.Buffer)
}
```

writeContext is the interface needed by the various frame writer types below. All the writeFrame methods below are scheduled via the frame writing scheduler (see writeScheduler in writesched.go). 

This interface is implemented by *serverConn. 

TODO: decide whether to a) use this in the client code (which didn't end up using this yet, because it has a simpler design, not currently implementing priorities), or b) delete this and make the server code a bit more concrete. 

### <a id="http2flushFrameWriter" href="#http2flushFrameWriter">type http2flushFrameWriter struct{}</a>

```
searchKey: http.http2flushFrameWriter
tags: [private]
```

```Go
type http2flushFrameWriter struct{}
```

#### <a id="http2flushFrameWriter.writeFrame" href="#http2flushFrameWriter.writeFrame">func (http2flushFrameWriter) writeFrame(ctx http2writeContext) error</a>

```
searchKey: http.http2flushFrameWriter.writeFrame
tags: [private]
```

```Go
func (http2flushFrameWriter) writeFrame(ctx http2writeContext) error
```

#### <a id="http2flushFrameWriter.staysWithinBuffer" href="#http2flushFrameWriter.staysWithinBuffer">func (http2flushFrameWriter) staysWithinBuffer(max int) bool</a>

```
searchKey: http.http2flushFrameWriter.staysWithinBuffer
tags: [private]
```

```Go
func (http2flushFrameWriter) staysWithinBuffer(max int) bool
```

### <a id="http2writeSettings" href="#http2writeSettings">type http2writeSettings []http.http2Setting</a>

```
searchKey: http.http2writeSettings
tags: [private]
```

```Go
type http2writeSettings []http2Setting
```

#### <a id="http2writeSettings.staysWithinBuffer" href="#http2writeSettings.staysWithinBuffer">func (s http2writeSettings) staysWithinBuffer(max int) bool</a>

```
searchKey: http.http2writeSettings.staysWithinBuffer
tags: [private]
```

```Go
func (s http2writeSettings) staysWithinBuffer(max int) bool
```

#### <a id="http2writeSettings.writeFrame" href="#http2writeSettings.writeFrame">func (s http2writeSettings) writeFrame(ctx http2writeContext) error</a>

```
searchKey: http.http2writeSettings.writeFrame
tags: [private]
```

```Go
func (s http2writeSettings) writeFrame(ctx http2writeContext) error
```

### <a id="http2writeGoAway" href="#http2writeGoAway">type http2writeGoAway struct</a>

```
searchKey: http.http2writeGoAway
tags: [private]
```

```Go
type http2writeGoAway struct {
	maxStreamID uint32
	code        http2ErrCode
}
```

#### <a id="http2writeGoAway.writeFrame" href="#http2writeGoAway.writeFrame">func (p *http2writeGoAway) writeFrame(ctx http2writeContext) error</a>

```
searchKey: http.http2writeGoAway.writeFrame
tags: [private]
```

```Go
func (p *http2writeGoAway) writeFrame(ctx http2writeContext) error
```

#### <a id="http2writeGoAway.staysWithinBuffer" href="#http2writeGoAway.staysWithinBuffer">func (*http2writeGoAway) staysWithinBuffer(max int) bool</a>

```
searchKey: http.http2writeGoAway.staysWithinBuffer
tags: [private]
```

```Go
func (*http2writeGoAway) staysWithinBuffer(max int) bool
```

### <a id="http2writeData" href="#http2writeData">type http2writeData struct</a>

```
searchKey: http.http2writeData
tags: [private]
```

```Go
type http2writeData struct {
	streamID  uint32
	p         []byte
	endStream bool
}
```

#### <a id="http2writeData.String" href="#http2writeData.String">func (w *http2writeData) String() string</a>

```
searchKey: http.http2writeData.String
tags: [private]
```

```Go
func (w *http2writeData) String() string
```

#### <a id="http2writeData.writeFrame" href="#http2writeData.writeFrame">func (w *http2writeData) writeFrame(ctx http2writeContext) error</a>

```
searchKey: http.http2writeData.writeFrame
tags: [private]
```

```Go
func (w *http2writeData) writeFrame(ctx http2writeContext) error
```

#### <a id="http2writeData.staysWithinBuffer" href="#http2writeData.staysWithinBuffer">func (w *http2writeData) staysWithinBuffer(max int) bool</a>

```
searchKey: http.http2writeData.staysWithinBuffer
tags: [private]
```

```Go
func (w *http2writeData) staysWithinBuffer(max int) bool
```

### <a id="http2handlerPanicRST" href="#http2handlerPanicRST">type http2handlerPanicRST struct</a>

```
searchKey: http.http2handlerPanicRST
tags: [private]
```

```Go
type http2handlerPanicRST struct {
	StreamID uint32
}
```

handlerPanicRST is the message sent from handler goroutines when the handler panics. 

#### <a id="http2handlerPanicRST.writeFrame" href="#http2handlerPanicRST.writeFrame">func (hp http2handlerPanicRST) writeFrame(ctx http2writeContext) error</a>

```
searchKey: http.http2handlerPanicRST.writeFrame
tags: [private]
```

```Go
func (hp http2handlerPanicRST) writeFrame(ctx http2writeContext) error
```

#### <a id="http2handlerPanicRST.staysWithinBuffer" href="#http2handlerPanicRST.staysWithinBuffer">func (hp http2handlerPanicRST) staysWithinBuffer(max int) bool</a>

```
searchKey: http.http2handlerPanicRST.staysWithinBuffer
tags: [private]
```

```Go
func (hp http2handlerPanicRST) staysWithinBuffer(max int) bool
```

### <a id="http2writePingAck" href="#http2writePingAck">type http2writePingAck struct</a>

```
searchKey: http.http2writePingAck
tags: [private]
```

```Go
type http2writePingAck struct{ pf *http2PingFrame }
```

#### <a id="http2writePingAck.writeFrame" href="#http2writePingAck.writeFrame">func (w http2writePingAck) writeFrame(ctx http2writeContext) error</a>

```
searchKey: http.http2writePingAck.writeFrame
tags: [private]
```

```Go
func (w http2writePingAck) writeFrame(ctx http2writeContext) error
```

#### <a id="http2writePingAck.staysWithinBuffer" href="#http2writePingAck.staysWithinBuffer">func (w http2writePingAck) staysWithinBuffer(max int) bool</a>

```
searchKey: http.http2writePingAck.staysWithinBuffer
tags: [private]
```

```Go
func (w http2writePingAck) staysWithinBuffer(max int) bool
```

### <a id="http2writeSettingsAck" href="#http2writeSettingsAck">type http2writeSettingsAck struct{}</a>

```
searchKey: http.http2writeSettingsAck
tags: [private]
```

```Go
type http2writeSettingsAck struct{}
```

#### <a id="http2writeSettingsAck.writeFrame" href="#http2writeSettingsAck.writeFrame">func (http2writeSettingsAck) writeFrame(ctx http2writeContext) error</a>

```
searchKey: http.http2writeSettingsAck.writeFrame
tags: [private]
```

```Go
func (http2writeSettingsAck) writeFrame(ctx http2writeContext) error
```

#### <a id="http2writeSettingsAck.staysWithinBuffer" href="#http2writeSettingsAck.staysWithinBuffer">func (http2writeSettingsAck) staysWithinBuffer(max int) bool</a>

```
searchKey: http.http2writeSettingsAck.staysWithinBuffer
tags: [private]
```

```Go
func (http2writeSettingsAck) staysWithinBuffer(max int) bool
```

### <a id="http2writeResHeaders" href="#http2writeResHeaders">type http2writeResHeaders struct</a>

```
searchKey: http.http2writeResHeaders
tags: [private]
```

```Go
type http2writeResHeaders struct {
	streamID    uint32
	httpResCode int      // 0 means no ":status" line
	h           Header   // may be nil
	trailers    []string // if non-nil, which keys of h to write. nil means all.
	endStream   bool

	date          string
	contentType   string
	contentLength string
}
```

writeResHeaders is a request to write a HEADERS and 0+ CONTINUATION frames for HTTP response headers or trailers from a server handler. 

#### <a id="http2writeResHeaders.staysWithinBuffer" href="#http2writeResHeaders.staysWithinBuffer">func (w *http2writeResHeaders) staysWithinBuffer(max int) bool</a>

```
searchKey: http.http2writeResHeaders.staysWithinBuffer
tags: [private]
```

```Go
func (w *http2writeResHeaders) staysWithinBuffer(max int) bool
```

#### <a id="http2writeResHeaders.writeFrame" href="#http2writeResHeaders.writeFrame">func (w *http2writeResHeaders) writeFrame(ctx http2writeContext) error</a>

```
searchKey: http.http2writeResHeaders.writeFrame
tags: [private]
```

```Go
func (w *http2writeResHeaders) writeFrame(ctx http2writeContext) error
```

#### <a id="http2writeResHeaders.writeHeaderBlock" href="#http2writeResHeaders.writeHeaderBlock">func (w *http2writeResHeaders) writeHeaderBlock(ctx http2writeContext, frag []byte, firstFrag, lastFrag bool) error</a>

```
searchKey: http.http2writeResHeaders.writeHeaderBlock
tags: [private]
```

```Go
func (w *http2writeResHeaders) writeHeaderBlock(ctx http2writeContext, frag []byte, firstFrag, lastFrag bool) error
```

### <a id="http2writePushPromise" href="#http2writePushPromise">type http2writePushPromise struct</a>

```
searchKey: http.http2writePushPromise
tags: [private]
```

```Go
type http2writePushPromise struct {
	streamID uint32   // pusher stream
	method   string   // for :method
	url      *url.URL // for :scheme, :authority, :path
	h        Header

	// Creates an ID for a pushed stream. This runs on serveG just before
	// the frame is written. The returned ID is copied to promisedID.
	allocatePromisedID func() (uint32, error)
	promisedID         uint32
}
```

writePushPromise is a request to write a PUSH_PROMISE and 0+ CONTINUATION frames. 

#### <a id="http2writePushPromise.staysWithinBuffer" href="#http2writePushPromise.staysWithinBuffer">func (w *http2writePushPromise) staysWithinBuffer(max int) bool</a>

```
searchKey: http.http2writePushPromise.staysWithinBuffer
tags: [private]
```

```Go
func (w *http2writePushPromise) staysWithinBuffer(max int) bool
```

#### <a id="http2writePushPromise.writeFrame" href="#http2writePushPromise.writeFrame">func (w *http2writePushPromise) writeFrame(ctx http2writeContext) error</a>

```
searchKey: http.http2writePushPromise.writeFrame
tags: [private]
```

```Go
func (w *http2writePushPromise) writeFrame(ctx http2writeContext) error
```

#### <a id="http2writePushPromise.writeHeaderBlock" href="#http2writePushPromise.writeHeaderBlock">func (w *http2writePushPromise) writeHeaderBlock(ctx http2writeContext, frag []byte, firstFrag, lastFrag bool) error</a>

```
searchKey: http.http2writePushPromise.writeHeaderBlock
tags: [private]
```

```Go
func (w *http2writePushPromise) writeHeaderBlock(ctx http2writeContext, frag []byte, firstFrag, lastFrag bool) error
```

### <a id="http2write100ContinueHeadersFrame" href="#http2write100ContinueHeadersFrame">type http2write100ContinueHeadersFrame struct</a>

```
searchKey: http.http2write100ContinueHeadersFrame
tags: [private]
```

```Go
type http2write100ContinueHeadersFrame struct {
	streamID uint32
}
```

#### <a id="http2write100ContinueHeadersFrame.writeFrame" href="#http2write100ContinueHeadersFrame.writeFrame">func (w http2write100ContinueHeadersFrame) writeFrame(ctx http2writeContext) error</a>

```
searchKey: http.http2write100ContinueHeadersFrame.writeFrame
tags: [private]
```

```Go
func (w http2write100ContinueHeadersFrame) writeFrame(ctx http2writeContext) error
```

#### <a id="http2write100ContinueHeadersFrame.staysWithinBuffer" href="#http2write100ContinueHeadersFrame.staysWithinBuffer">func (w http2write100ContinueHeadersFrame) staysWithinBuffer(max int) bool</a>

```
searchKey: http.http2write100ContinueHeadersFrame.staysWithinBuffer
tags: [private]
```

```Go
func (w http2write100ContinueHeadersFrame) staysWithinBuffer(max int) bool
```

### <a id="http2writeWindowUpdate" href="#http2writeWindowUpdate">type http2writeWindowUpdate struct</a>

```
searchKey: http.http2writeWindowUpdate
tags: [private]
```

```Go
type http2writeWindowUpdate struct {
	streamID uint32 // or 0 for conn-level
	n        uint32
}
```

#### <a id="http2writeWindowUpdate.staysWithinBuffer" href="#http2writeWindowUpdate.staysWithinBuffer">func (wu http2writeWindowUpdate) staysWithinBuffer(max int) bool</a>

```
searchKey: http.http2writeWindowUpdate.staysWithinBuffer
tags: [private]
```

```Go
func (wu http2writeWindowUpdate) staysWithinBuffer(max int) bool
```

#### <a id="http2writeWindowUpdate.writeFrame" href="#http2writeWindowUpdate.writeFrame">func (wu http2writeWindowUpdate) writeFrame(ctx http2writeContext) error</a>

```
searchKey: http.http2writeWindowUpdate.writeFrame
tags: [private]
```

```Go
func (wu http2writeWindowUpdate) writeFrame(ctx http2writeContext) error
```

### <a id="http2WriteScheduler" href="#http2WriteScheduler">type http2WriteScheduler interface</a>

```
searchKey: http.http2WriteScheduler
tags: [private]
```

```Go
type http2WriteScheduler interface {
	// OpenStream opens a new stream in the write scheduler.
	// It is illegal to call this with streamID=0 or with a streamID that is
	// already open -- the call may panic.
	OpenStream(streamID uint32, options http2OpenStreamOptions)

	// CloseStream closes a stream in the write scheduler. Any frames queued on
	// this stream should be discarded. It is illegal to call this on a stream
	// that is not open -- the call may panic.
	CloseStream(streamID uint32)

	// AdjustStream adjusts the priority of the given stream. This may be called
	// on a stream that has not yet been opened or has been closed. Note that
	// RFC 7540 allows PRIORITY frames to be sent on streams in any state. See:
	// https://tools.ietf.org/html/rfc7540#section-5.1
	AdjustStream(streamID uint32, priority http2PriorityParam)

	// Push queues a frame in the scheduler. In most cases, this will not be
	// called with wr.StreamID()!=0 unless that stream is currently open. The one
	// exception is RST_STREAM frames, which may be sent on idle or closed streams.
	Push(wr http2FrameWriteRequest)

	// Pop dequeues the next frame to write. Returns false if no frames can
	// be written. Frames with a given wr.StreamID() are Pop'd in the same
	// order they are Push'd. No frames should be discarded except by CloseStream.
	Pop() (wr http2FrameWriteRequest, ok bool)
}
```

WriteScheduler is the interface implemented by HTTP/2 write schedulers. Methods are never called concurrently. 

#### <a id="http2NewPriorityWriteScheduler" href="#http2NewPriorityWriteScheduler">func http2NewPriorityWriteScheduler(cfg *http2PriorityWriteSchedulerConfig) http2WriteScheduler</a>

```
searchKey: http.http2NewPriorityWriteScheduler
tags: [private]
```

```Go
func http2NewPriorityWriteScheduler(cfg *http2PriorityWriteSchedulerConfig) http2WriteScheduler
```

NewPriorityWriteScheduler constructs a WriteScheduler that schedules frames by following HTTP/2 priorities as described in RFC 7540 Section 5.3. If cfg is nil, default options are used. 

#### <a id="http2NewRandomWriteScheduler" href="#http2NewRandomWriteScheduler">func http2NewRandomWriteScheduler() http2WriteScheduler</a>

```
searchKey: http.http2NewRandomWriteScheduler
tags: [private]
```

```Go
func http2NewRandomWriteScheduler() http2WriteScheduler
```

NewRandomWriteScheduler constructs a WriteScheduler that ignores HTTP/2 priorities. Control frames like SETTINGS and PING are written before DATA frames, but if no control frames are queued and multiple streams have queued HEADERS or DATA frames, Pop selects a ready stream arbitrarily. 

### <a id="http2OpenStreamOptions" href="#http2OpenStreamOptions">type http2OpenStreamOptions struct</a>

```
searchKey: http.http2OpenStreamOptions
tags: [private]
```

```Go
type http2OpenStreamOptions struct {
	// PusherID is zero if the stream was initiated by the client. Otherwise,
	// PusherID names the stream that pushed the newly opened stream.
	PusherID uint32
}
```

OpenStreamOptions specifies extra options for WriteScheduler.OpenStream. 

### <a id="http2FrameWriteRequest" href="#http2FrameWriteRequest">type http2FrameWriteRequest struct</a>

```
searchKey: http.http2FrameWriteRequest
tags: [private]
```

```Go
type http2FrameWriteRequest struct {
	// write is the interface value that does the writing, once the
	// WriteScheduler has selected this frame to write. The write
	// functions are all defined in write.go.
	write http2writeFramer

	// stream is the stream on which this frame will be written.
	// nil for non-stream frames like PING and SETTINGS.
	stream *http2stream

	// done, if non-nil, must be a buffered channel with space for
	// 1 message and is sent the return value from write (or an
	// earlier error) when the frame has been written.
	done chan error
}
```

FrameWriteRequest is a request to write a frame. 

#### <a id="http2FrameWriteRequest.StreamID" href="#http2FrameWriteRequest.StreamID">func (wr http2FrameWriteRequest) StreamID() uint32</a>

```
searchKey: http.http2FrameWriteRequest.StreamID
tags: [private]
```

```Go
func (wr http2FrameWriteRequest) StreamID() uint32
```

StreamID returns the id of the stream this frame will be written to. 0 is used for non-stream frames such as PING and SETTINGS. 

#### <a id="http2FrameWriteRequest.isControl" href="#http2FrameWriteRequest.isControl">func (wr http2FrameWriteRequest) isControl() bool</a>

```
searchKey: http.http2FrameWriteRequest.isControl
tags: [private]
```

```Go
func (wr http2FrameWriteRequest) isControl() bool
```

isControl reports whether wr is a control frame for MaxQueuedControlFrames purposes. That includes non-stream frames and RST_STREAM frames. 

#### <a id="http2FrameWriteRequest.DataSize" href="#http2FrameWriteRequest.DataSize">func (wr http2FrameWriteRequest) DataSize() int</a>

```
searchKey: http.http2FrameWriteRequest.DataSize
tags: [private]
```

```Go
func (wr http2FrameWriteRequest) DataSize() int
```

DataSize returns the number of flow control bytes that must be consumed to write this entire frame. This is 0 for non-DATA frames. 

#### <a id="http2FrameWriteRequest.Consume" href="#http2FrameWriteRequest.Consume">func (wr http2FrameWriteRequest) Consume(n int32) (http2FrameWriteRequest, http2FrameWriteRequest, int)</a>

```
searchKey: http.http2FrameWriteRequest.Consume
tags: [private]
```

```Go
func (wr http2FrameWriteRequest) Consume(n int32) (http2FrameWriteRequest, http2FrameWriteRequest, int)
```

Consume consumes min(n, available) bytes from this frame, where available is the number of flow control bytes available on the stream. Consume returns 0, 1, or 2 frames, where the integer return value gives the number of frames returned. 

If flow control prevents consuming any bytes, this returns (_, _, 0). If the entire frame was consumed, this returns (wr, _, 1). Otherwise, this returns (consumed, rest, 2), where 'consumed' contains the consumed bytes and 'rest' contains the remaining bytes. The consumed bytes are deducted from the underlying stream's flow control budget. 

#### <a id="http2FrameWriteRequest.String" href="#http2FrameWriteRequest.String">func (wr http2FrameWriteRequest) String() string</a>

```
searchKey: http.http2FrameWriteRequest.String
tags: [private]
```

```Go
func (wr http2FrameWriteRequest) String() string
```

String is for debugging only. 

#### <a id="http2FrameWriteRequest.replyToWriter" href="#http2FrameWriteRequest.replyToWriter">func (wr *http2FrameWriteRequest) replyToWriter(err error)</a>

```
searchKey: http.http2FrameWriteRequest.replyToWriter
tags: [private]
```

```Go
func (wr *http2FrameWriteRequest) replyToWriter(err error)
```

replyToWriter sends err to wr.done and panics if the send must block This does nothing if wr.done is nil. 

### <a id="http2writeQueue" href="#http2writeQueue">type http2writeQueue struct</a>

```
searchKey: http.http2writeQueue
tags: [private]
```

```Go
type http2writeQueue struct {
	s []http2FrameWriteRequest
}
```

writeQueue is used by implementations of WriteScheduler. 

#### <a id="http2writeQueue.empty" href="#http2writeQueue.empty">func (q *http2writeQueue) empty() bool</a>

```
searchKey: http.http2writeQueue.empty
tags: [private]
```

```Go
func (q *http2writeQueue) empty() bool
```

#### <a id="http2writeQueue.push" href="#http2writeQueue.push">func (q *http2writeQueue) push(wr http2FrameWriteRequest)</a>

```
searchKey: http.http2writeQueue.push
tags: [private]
```

```Go
func (q *http2writeQueue) push(wr http2FrameWriteRequest)
```

#### <a id="http2writeQueue.shift" href="#http2writeQueue.shift">func (q *http2writeQueue) shift() http2FrameWriteRequest</a>

```
searchKey: http.http2writeQueue.shift
tags: [private]
```

```Go
func (q *http2writeQueue) shift() http2FrameWriteRequest
```

#### <a id="http2writeQueue.consume" href="#http2writeQueue.consume">func (q *http2writeQueue) consume(n int32) (http2FrameWriteRequest, bool)</a>

```
searchKey: http.http2writeQueue.consume
tags: [private]
```

```Go
func (q *http2writeQueue) consume(n int32) (http2FrameWriteRequest, bool)
```

consume consumes up to n bytes from q.s[0]. If the frame is entirely consumed, it is removed from the queue. If the frame is partially consumed, the frame is kept with the consumed bytes removed. Returns true iff any bytes were consumed. 

### <a id="http2writeQueuePool" href="#http2writeQueuePool">type http2writeQueuePool []*http.http2writeQueue</a>

```
searchKey: http.http2writeQueuePool
tags: [private]
```

```Go
type http2writeQueuePool []*http2writeQueue
```

#### <a id="http2writeQueuePool.put" href="#http2writeQueuePool.put">func (p *http2writeQueuePool) put(q *http2writeQueue)</a>

```
searchKey: http.http2writeQueuePool.put
tags: [private]
```

```Go
func (p *http2writeQueuePool) put(q *http2writeQueue)
```

put inserts an unused writeQueue into the pool. 

#### <a id="http2writeQueuePool.get" href="#http2writeQueuePool.get">func (p *http2writeQueuePool) get() *http2writeQueue</a>

```
searchKey: http.http2writeQueuePool.get
tags: [private]
```

```Go
func (p *http2writeQueuePool) get() *http2writeQueue
```

get returns an empty writeQueue. 

### <a id="http2PriorityWriteSchedulerConfig" href="#http2PriorityWriteSchedulerConfig">type http2PriorityWriteSchedulerConfig struct</a>

```
searchKey: http.http2PriorityWriteSchedulerConfig
tags: [private]
```

```Go
type http2PriorityWriteSchedulerConfig struct {
	// MaxClosedNodesInTree controls the maximum number of closed streams to
	// retain in the priority tree. Setting this to zero saves a small amount
	// of memory at the cost of performance.
	//
	// See RFC 7540, Section 5.3.4:
	//   "It is possible for a stream to become closed while prioritization
	//   information ... is in transit. ... This potentially creates suboptimal
	//   prioritization, since the stream could be given a priority that is
	//   different from what is intended. To avoid these problems, an endpoint
	//   SHOULD retain stream prioritization state for a period after streams
	//   become closed. The longer state is retained, the lower the chance that
	//   streams are assigned incorrect or default priority values."
	MaxClosedNodesInTree int

	// MaxIdleNodesInTree controls the maximum number of idle streams to
	// retain in the priority tree. Setting this to zero saves a small amount
	// of memory at the cost of performance.
	//
	// See RFC 7540, Section 5.3.4:
	//   Similarly, streams that are in the "idle" state can be assigned
	//   priority or become a parent of other streams. This allows for the
	//   creation of a grouping node in the dependency tree, which enables
	//   more flexible expressions of priority. Idle streams begin with a
	//   default priority (Section 5.3.5).
	MaxIdleNodesInTree int

	// ThrottleOutOfOrderWrites enables write throttling to help ensure that
	// data is delivered in priority order. This works around a race where
	// stream B depends on stream A and both streams are about to call Write
	// to queue DATA frames. If B wins the race, a naive scheduler would eagerly
	// write as much data from B as possible, but this is suboptimal because A
	// is a higher-priority stream. With throttling enabled, we write a small
	// amount of data from B to minimize the amount of bandwidth that B can
	// steal from A.
	ThrottleOutOfOrderWrites bool
}
```

PriorityWriteSchedulerConfig configures a priorityWriteScheduler. 

### <a id="http2priorityNodeState" href="#http2priorityNodeState">type http2priorityNodeState int</a>

```
searchKey: http.http2priorityNodeState
tags: [private]
```

```Go
type http2priorityNodeState int
```

### <a id="http2priorityNode" href="#http2priorityNode">type http2priorityNode struct</a>

```
searchKey: http.http2priorityNode
tags: [private]
```

```Go
type http2priorityNode struct {
	q            http2writeQueue        // queue of pending frames to write
	id           uint32                 // id of the stream, or 0 for the root of the tree
	weight       uint8                  // the actual weight is weight+1, so the value is in [1,256]
	state        http2priorityNodeState // open | closed | idle
	bytes        int64                  // number of bytes written by this node, or 0 if closed
	subtreeBytes int64                  // sum(node.bytes) of all nodes in this subtree

	// These links form the priority tree.
	parent     *http2priorityNode
	kids       *http2priorityNode // start of the kids list
	prev, next *http2priorityNode // doubly-linked list of siblings
}
```

priorityNode is a node in an HTTP/2 priority tree. Each node is associated with a single stream ID. See RFC 7540, Section 5.3. 

#### <a id="http2priorityNode.setParent" href="#http2priorityNode.setParent">func (n *http2priorityNode) setParent(parent *http2priorityNode)</a>

```
searchKey: http.http2priorityNode.setParent
tags: [private]
```

```Go
func (n *http2priorityNode) setParent(parent *http2priorityNode)
```

#### <a id="http2priorityNode.addBytes" href="#http2priorityNode.addBytes">func (n *http2priorityNode) addBytes(b int64)</a>

```
searchKey: http.http2priorityNode.addBytes
tags: [private]
```

```Go
func (n *http2priorityNode) addBytes(b int64)
```

#### <a id="http2priorityNode.walkReadyInOrder" href="#http2priorityNode.walkReadyInOrder">func (n *http2priorityNode) walkReadyInOrder(openParent bool, tmp *[]*http2priorityNode, f func(*http2priorityNode, bool) bool) bool</a>

```
searchKey: http.http2priorityNode.walkReadyInOrder
tags: [private]
```

```Go
func (n *http2priorityNode) walkReadyInOrder(openParent bool, tmp *[]*http2priorityNode, f func(*http2priorityNode, bool) bool) bool
```

walkReadyInOrder iterates over the tree in priority order, calling f for each node with a non-empty write queue. When f returns true, this function returns true and the walk halts. tmp is used as scratch space for sorting. 

f(n, openParent) takes two arguments: the node to visit, n, and a bool that is true if any ancestor p of n is still open (ignoring the root node). 

### <a id="http2sortPriorityNodeSiblings" href="#http2sortPriorityNodeSiblings">type http2sortPriorityNodeSiblings []*http.http2priorityNode</a>

```
searchKey: http.http2sortPriorityNodeSiblings
tags: [private]
```

```Go
type http2sortPriorityNodeSiblings []*http2priorityNode
```

#### <a id="http2sortPriorityNodeSiblings.Len" href="#http2sortPriorityNodeSiblings.Len">func (z http2sortPriorityNodeSiblings) Len() int</a>

```
searchKey: http.http2sortPriorityNodeSiblings.Len
tags: [private]
```

```Go
func (z http2sortPriorityNodeSiblings) Len() int
```

#### <a id="http2sortPriorityNodeSiblings.Swap" href="#http2sortPriorityNodeSiblings.Swap">func (z http2sortPriorityNodeSiblings) Swap(i, k int)</a>

```
searchKey: http.http2sortPriorityNodeSiblings.Swap
tags: [private]
```

```Go
func (z http2sortPriorityNodeSiblings) Swap(i, k int)
```

#### <a id="http2sortPriorityNodeSiblings.Less" href="#http2sortPriorityNodeSiblings.Less">func (z http2sortPriorityNodeSiblings) Less(i, k int) bool</a>

```
searchKey: http.http2sortPriorityNodeSiblings.Less
tags: [private]
```

```Go
func (z http2sortPriorityNodeSiblings) Less(i, k int) bool
```

### <a id="http2priorityWriteScheduler" href="#http2priorityWriteScheduler">type http2priorityWriteScheduler struct</a>

```
searchKey: http.http2priorityWriteScheduler
tags: [private]
```

```Go
type http2priorityWriteScheduler struct {
	// root is the root of the priority tree, where root.id = 0.
	// The root queues control frames that are not associated with any stream.
	root http2priorityNode

	// nodes maps stream ids to priority tree nodes.
	nodes map[uint32]*http2priorityNode

	// maxID is the maximum stream id in nodes.
	maxID uint32

	// lists of nodes that have been closed or are idle, but are kept in
	// the tree for improved prioritization. When the lengths exceed either
	// maxClosedNodesInTree or maxIdleNodesInTree, old nodes are discarded.
	closedNodes, idleNodes []*http2priorityNode

	// From the config.
	maxClosedNodesInTree int
	maxIdleNodesInTree   int
	writeThrottleLimit   int32
	enableWriteThrottle  bool

	// tmp is scratch space for priorityNode.walkReadyInOrder to reduce allocations.
	tmp []*http2priorityNode

	// pool of empty queues for reuse.
	queuePool http2writeQueuePool
}
```

#### <a id="http2priorityWriteScheduler.OpenStream" href="#http2priorityWriteScheduler.OpenStream">func (ws *http2priorityWriteScheduler) OpenStream(streamID uint32, options http2OpenStreamOptions)</a>

```
searchKey: http.http2priorityWriteScheduler.OpenStream
tags: [private]
```

```Go
func (ws *http2priorityWriteScheduler) OpenStream(streamID uint32, options http2OpenStreamOptions)
```

#### <a id="http2priorityWriteScheduler.CloseStream" href="#http2priorityWriteScheduler.CloseStream">func (ws *http2priorityWriteScheduler) CloseStream(streamID uint32)</a>

```
searchKey: http.http2priorityWriteScheduler.CloseStream
tags: [private]
```

```Go
func (ws *http2priorityWriteScheduler) CloseStream(streamID uint32)
```

#### <a id="http2priorityWriteScheduler.AdjustStream" href="#http2priorityWriteScheduler.AdjustStream">func (ws *http2priorityWriteScheduler) AdjustStream(streamID uint32, priority http2PriorityParam)</a>

```
searchKey: http.http2priorityWriteScheduler.AdjustStream
tags: [private]
```

```Go
func (ws *http2priorityWriteScheduler) AdjustStream(streamID uint32, priority http2PriorityParam)
```

#### <a id="http2priorityWriteScheduler.Push" href="#http2priorityWriteScheduler.Push">func (ws *http2priorityWriteScheduler) Push(wr http2FrameWriteRequest)</a>

```
searchKey: http.http2priorityWriteScheduler.Push
tags: [private]
```

```Go
func (ws *http2priorityWriteScheduler) Push(wr http2FrameWriteRequest)
```

#### <a id="http2priorityWriteScheduler.Pop" href="#http2priorityWriteScheduler.Pop">func (ws *http2priorityWriteScheduler) Pop() (wr http2FrameWriteRequest, ok bool)</a>

```
searchKey: http.http2priorityWriteScheduler.Pop
tags: [private]
```

```Go
func (ws *http2priorityWriteScheduler) Pop() (wr http2FrameWriteRequest, ok bool)
```

#### <a id="http2priorityWriteScheduler.addClosedOrIdleNode" href="#http2priorityWriteScheduler.addClosedOrIdleNode">func (ws *http2priorityWriteScheduler) addClosedOrIdleNode(list *[]*http2priorityNode, maxSize int, n *http2priorityNode)</a>

```
searchKey: http.http2priorityWriteScheduler.addClosedOrIdleNode
tags: [private]
```

```Go
func (ws *http2priorityWriteScheduler) addClosedOrIdleNode(list *[]*http2priorityNode, maxSize int, n *http2priorityNode)
```

#### <a id="http2priorityWriteScheduler.removeNode" href="#http2priorityWriteScheduler.removeNode">func (ws *http2priorityWriteScheduler) removeNode(n *http2priorityNode)</a>

```
searchKey: http.http2priorityWriteScheduler.removeNode
tags: [private]
```

```Go
func (ws *http2priorityWriteScheduler) removeNode(n *http2priorityNode)
```

### <a id="http2randomWriteScheduler" href="#http2randomWriteScheduler">type http2randomWriteScheduler struct</a>

```
searchKey: http.http2randomWriteScheduler
tags: [private]
```

```Go
type http2randomWriteScheduler struct {
	// zero are frames not associated with a specific stream.
	zero http2writeQueue

	// sq contains the stream-specific queues, keyed by stream ID.
	// When a stream is idle, closed, or emptied, it's deleted
	// from the map.
	sq map[uint32]*http2writeQueue

	// pool of empty queues for reuse.
	queuePool http2writeQueuePool
}
```

#### <a id="http2randomWriteScheduler.OpenStream" href="#http2randomWriteScheduler.OpenStream">func (ws *http2randomWriteScheduler) OpenStream(streamID uint32, options http2OpenStreamOptions)</a>

```
searchKey: http.http2randomWriteScheduler.OpenStream
tags: [private]
```

```Go
func (ws *http2randomWriteScheduler) OpenStream(streamID uint32, options http2OpenStreamOptions)
```

#### <a id="http2randomWriteScheduler.CloseStream" href="#http2randomWriteScheduler.CloseStream">func (ws *http2randomWriteScheduler) CloseStream(streamID uint32)</a>

```
searchKey: http.http2randomWriteScheduler.CloseStream
tags: [private]
```

```Go
func (ws *http2randomWriteScheduler) CloseStream(streamID uint32)
```

#### <a id="http2randomWriteScheduler.AdjustStream" href="#http2randomWriteScheduler.AdjustStream">func (ws *http2randomWriteScheduler) AdjustStream(streamID uint32, priority http2PriorityParam)</a>

```
searchKey: http.http2randomWriteScheduler.AdjustStream
tags: [private]
```

```Go
func (ws *http2randomWriteScheduler) AdjustStream(streamID uint32, priority http2PriorityParam)
```

#### <a id="http2randomWriteScheduler.Push" href="#http2randomWriteScheduler.Push">func (ws *http2randomWriteScheduler) Push(wr http2FrameWriteRequest)</a>

```
searchKey: http.http2randomWriteScheduler.Push
tags: [private]
```

```Go
func (ws *http2randomWriteScheduler) Push(wr http2FrameWriteRequest)
```

#### <a id="http2randomWriteScheduler.Pop" href="#http2randomWriteScheduler.Pop">func (ws *http2randomWriteScheduler) Pop() (http2FrameWriteRequest, bool)</a>

```
searchKey: http.http2randomWriteScheduler.Pop
tags: [private]
```

```Go
func (ws *http2randomWriteScheduler) Pop() (http2FrameWriteRequest, bool)
```

### <a id="Header" href="#Header">type Header map[string][]string</a>

```
searchKey: http.Header
```

```Go
type Header map[string][]string
```

A Header represents the key-value pairs in an HTTP header. 

The keys should be in canonical form, as returned by CanonicalHeaderKey. 

#### <a id="cloneOrMakeHeader" href="#cloneOrMakeHeader">func cloneOrMakeHeader(hdr Header) Header</a>

```
searchKey: http.cloneOrMakeHeader
tags: [private]
```

```Go
func cloneOrMakeHeader(hdr Header) Header
```

cloneOrMakeHeader invokes Header.Clone but if the result is nil, it'll instead make and return a non-nil Header. 

#### <a id="http2cloneHeader" href="#http2cloneHeader">func http2cloneHeader(h Header) Header</a>

```
searchKey: http.http2cloneHeader
tags: [private]
```

```Go
func http2cloneHeader(h Header) Header
```

#### <a id="fixTrailer" href="#fixTrailer">func fixTrailer(header Header, chunked bool) (Header, error)</a>

```
searchKey: http.fixTrailer
tags: [private]
```

```Go
func fixTrailer(header Header, chunked bool) (Header, error)
```

Parse the trailer header 

#### <a id="Header.Add" href="#Header.Add">func (h Header) Add(key, value string)</a>

```
searchKey: http.Header.Add
```

```Go
func (h Header) Add(key, value string)
```

Add adds the key, value pair to the header. It appends to any existing values associated with key. The key is case insensitive; it is canonicalized by CanonicalHeaderKey. 

#### <a id="Header.Set" href="#Header.Set">func (h Header) Set(key, value string)</a>

```
searchKey: http.Header.Set
```

```Go
func (h Header) Set(key, value string)
```

Set sets the header entries associated with key to the single element value. It replaces any existing values associated with key. The key is case insensitive; it is canonicalized by textproto.CanonicalMIMEHeaderKey. To use non-canonical keys, assign to the map directly. 

#### <a id="Header.Get" href="#Header.Get">func (h Header) Get(key string) string</a>

```
searchKey: http.Header.Get
```

```Go
func (h Header) Get(key string) string
```

Get gets the first value associated with the given key. If there are no values associated with the key, Get returns "". It is case insensitive; textproto.CanonicalMIMEHeaderKey is used to canonicalize the provided key. To use non-canonical keys, access the map directly. 

#### <a id="Header.Values" href="#Header.Values">func (h Header) Values(key string) []string</a>

```
searchKey: http.Header.Values
```

```Go
func (h Header) Values(key string) []string
```

Values returns all values associated with the given key. It is case insensitive; textproto.CanonicalMIMEHeaderKey is used to canonicalize the provided key. To use non-canonical keys, access the map directly. The returned slice is not a copy. 

#### <a id="Header.get" href="#Header.get">func (h Header) get(key string) string</a>

```
searchKey: http.Header.get
tags: [private]
```

```Go
func (h Header) get(key string) string
```

get is like Get, but key must already be in CanonicalHeaderKey form. 

#### <a id="Header.has" href="#Header.has">func (h Header) has(key string) bool</a>

```
searchKey: http.Header.has
tags: [private]
```

```Go
func (h Header) has(key string) bool
```

has reports whether h has the provided key defined, even if it's set to 0-length slice. 

#### <a id="Header.Del" href="#Header.Del">func (h Header) Del(key string)</a>

```
searchKey: http.Header.Del
```

```Go
func (h Header) Del(key string)
```

Del deletes the values associated with key. The key is case insensitive; it is canonicalized by CanonicalHeaderKey. 

#### <a id="Header.Write" href="#Header.Write">func (h Header) Write(w io.Writer) error</a>

```
searchKey: http.Header.Write
```

```Go
func (h Header) Write(w io.Writer) error
```

Write writes a header in wire format. 

#### <a id="Header.write" href="#Header.write">func (h Header) write(w io.Writer, trace *httptrace.ClientTrace) error</a>

```
searchKey: http.Header.write
tags: [private]
```

```Go
func (h Header) write(w io.Writer, trace *httptrace.ClientTrace) error
```

#### <a id="Header.Clone" href="#Header.Clone">func (h Header) Clone() Header</a>

```
searchKey: http.Header.Clone
```

```Go
func (h Header) Clone() Header
```

Clone returns a copy of h or nil if h is nil. 

#### <a id="Header.sortedKeyValues" href="#Header.sortedKeyValues">func (h Header) sortedKeyValues(exclude map[string]bool) (kvs []keyValues, hs *headerSorter)</a>

```
searchKey: http.Header.sortedKeyValues
tags: [private]
```

```Go
func (h Header) sortedKeyValues(exclude map[string]bool) (kvs []keyValues, hs *headerSorter)
```

sortedKeyValues returns h's keys sorted in the returned kvs slice. The headerSorter used to sort is also returned, for possible return to headerSorterCache. 

#### <a id="Header.WriteSubset" href="#Header.WriteSubset">func (h Header) WriteSubset(w io.Writer, exclude map[string]bool) error</a>

```
searchKey: http.Header.WriteSubset
```

```Go
func (h Header) WriteSubset(w io.Writer, exclude map[string]bool) error
```

WriteSubset writes a header in wire format. If exclude is not nil, keys where exclude[key] == true are not written. Keys are not canonicalized before checking the exclude map. 

#### <a id="Header.writeSubset" href="#Header.writeSubset">func (h Header) writeSubset(w io.Writer, exclude map[string]bool, trace *httptrace.ClientTrace) error</a>

```
searchKey: http.Header.writeSubset
tags: [private]
```

```Go
func (h Header) writeSubset(w io.Writer, exclude map[string]bool, trace *httptrace.ClientTrace) error
```

### <a id="stringWriter" href="#stringWriter">type stringWriter struct</a>

```
searchKey: http.stringWriter
tags: [private]
```

```Go
type stringWriter struct {
	w io.Writer
}
```

stringWriter implements WriteString on a Writer. 

#### <a id="stringWriter.WriteString" href="#stringWriter.WriteString">func (w stringWriter) WriteString(s string) (n int, err error)</a>

```
searchKey: http.stringWriter.WriteString
tags: [private]
```

```Go
func (w stringWriter) WriteString(s string) (n int, err error)
```

### <a id="keyValues" href="#keyValues">type keyValues struct</a>

```
searchKey: http.keyValues
tags: [private]
```

```Go
type keyValues struct {
	key    string
	values []string
}
```

### <a id="headerSorter" href="#headerSorter">type headerSorter struct</a>

```
searchKey: http.headerSorter
tags: [private]
```

```Go
type headerSorter struct {
	kvs []keyValues
}
```

A headerSorter implements sort.Interface by sorting a []keyValues by key. It's used as a pointer, so it can fit in a sort.Interface interface value without allocation. 

#### <a id="headerSorter.Len" href="#headerSorter.Len">func (s *headerSorter) Len() int</a>

```
searchKey: http.headerSorter.Len
tags: [private]
```

```Go
func (s *headerSorter) Len() int
```

#### <a id="headerSorter.Swap" href="#headerSorter.Swap">func (s *headerSorter) Swap(i, j int)</a>

```
searchKey: http.headerSorter.Swap
tags: [private]
```

```Go
func (s *headerSorter) Swap(i, j int)
```

#### <a id="headerSorter.Less" href="#headerSorter.Less">func (s *headerSorter) Less(i, j int) bool</a>

```
searchKey: http.headerSorter.Less
tags: [private]
```

```Go
func (s *headerSorter) Less(i, j int) bool
```

### <a id="incomparable" href="#incomparable">type incomparable [0]func()</a>

```
searchKey: http.incomparable
tags: [private]
```

```Go
type incomparable [0]func()
```

incomparable is a zero-width, non-comparable type. Adding it to a struct makes that struct also non-comparable, and generally doesn't add any size (as long as it's first). 

### <a id="contextKey" href="#contextKey">type contextKey struct</a>

```
searchKey: http.contextKey
tags: [private]
```

```Go
type contextKey struct {
	name string
}
```

contextKey is a value for use with context.WithValue. It's used as a pointer so it fits in an interface{} without allocation. 

#### <a id="contextKey.String" href="#contextKey.String">func (k *contextKey) String() string</a>

```
searchKey: http.contextKey.String
tags: [private]
```

```Go
func (k *contextKey) String() string
```

### <a id="noBody" href="#noBody">type noBody struct{}</a>

```
searchKey: http.noBody
tags: [private]
```

```Go
type noBody struct{}
```

#### <a id="noBody.Read" href="#noBody.Read">func (noBody) Read([]byte) (int, error)</a>

```
searchKey: http.noBody.Read
tags: [private]
```

```Go
func (noBody) Read([]byte) (int, error)
```

#### <a id="noBody.Close" href="#noBody.Close">func (noBody) Close() error</a>

```
searchKey: http.noBody.Close
tags: [private]
```

```Go
func (noBody) Close() error
```

#### <a id="noBody.WriteTo" href="#noBody.WriteTo">func (noBody) WriteTo(io.Writer) (int64, error)</a>

```
searchKey: http.noBody.WriteTo
tags: [private]
```

```Go
func (noBody) WriteTo(io.Writer) (int64, error)
```

### <a id="PushOptions" href="#PushOptions">type PushOptions struct</a>

```
searchKey: http.PushOptions
```

```Go
type PushOptions struct {
	// Method specifies the HTTP method for the promised request.
	// If set, it must be "GET" or "HEAD". Empty means "GET".
	Method string

	// Header specifies additional promised request headers. This cannot
	// include HTTP/2 pseudo header fields like ":path" and ":scheme",
	// which will be added automatically.
	Header Header
}
```

PushOptions describes options for Pusher.Push. 

### <a id="Pusher" href="#Pusher">type Pusher interface</a>

```
searchKey: http.Pusher
```

```Go
type Pusher interface {
	// Push initiates an HTTP/2 server push. This constructs a synthetic
	// request using the given target and options, serializes that request
	// into a PUSH_PROMISE frame, then dispatches that request using the
	// server's request handler. If opts is nil, default options are used.
	//
	// The target must either be an absolute path (like "/path") or an absolute
	// URL that contains a valid host and the same scheme as the parent request.
	// If the target is a path, it will inherit the scheme and host of the
	// parent request.
	//
	// The HTTP/2 spec disallows recursive pushes and cross-authority pushes.
	// Push may or may not detect these invalid pushes; however, invalid
	// pushes will be detected and canceled by conforming clients.
	//
	// Handlers that wish to push URL X should call Push before sending any
	// data that may trigger a request for URL X. This avoids a race where the
	// client issues requests for X before receiving the PUSH_PROMISE for X.
	//
	// Push will run in a separate goroutine making the order of arrival
	// non-deterministic. Any required synchronization needs to be implemented
	// by the caller.
	//
	// Push returns ErrNotSupported if the client has disabled push or if push
	// is not supported on the underlying connection.
	Push(target string, opts *PushOptions) error
}
```

Pusher is the interface implemented by ResponseWriters that support HTTP/2 server push. For more background, see [https://tools.ietf.org/html/rfc7540#section-8.2](https://tools.ietf.org/html/rfc7540#section-8.2). 

### <a id="CookieJar" href="#CookieJar">type CookieJar interface</a>

```
searchKey: http.CookieJar
```

```Go
type CookieJar interface {
	// SetCookies handles the receipt of the cookies in a reply for the
	// given URL.  It may or may not choose to save the cookies, depending
	// on the jar's policy and implementation.
	SetCookies(u *url.URL, cookies []*Cookie)

	// Cookies returns the cookies to send in a request for the given URL.
	// It is up to the implementation to honor the standard cookie use
	// restrictions such as in RFC 6265.
	Cookies(u *url.URL) []*Cookie
}
```

A CookieJar manages storage and use of cookies in HTTP requests. 

Implementations of CookieJar must be safe for concurrent use by multiple goroutines. 

The net/http/cookiejar package provides a CookieJar implementation. 

### <a id="ProtocolError" href="#ProtocolError">type ProtocolError struct</a>

```
searchKey: http.ProtocolError
```

```Go
type ProtocolError struct {
	ErrorString string
}
```

ProtocolError represents an HTTP protocol error. 

Deprecated: Not all errors in the http package related to protocol errors are of type ProtocolError. 

#### <a id="ProtocolError.Error" href="#ProtocolError.Error">func (pe *ProtocolError) Error() string</a>

```
searchKey: http.ProtocolError.Error
```

```Go
func (pe *ProtocolError) Error() string
```

### <a id="Request" href="#Request">type Request struct</a>

```
searchKey: http.Request
```

```Go
type Request struct {
	// Method specifies the HTTP method (GET, POST, PUT, etc.).
	// For client requests, an empty string means GET.
	//
	// Go's HTTP client does not support sending a request with
	// the CONNECT method. See the documentation on Transport for
	// details.
	Method string

	// URL specifies either the URI being requested (for server
	// requests) or the URL to access (for client requests).
	//
	// For server requests, the URL is parsed from the URI
	// supplied on the Request-Line as stored in RequestURI.  For
	// most requests, fields other than Path and RawQuery will be
	// empty. (See RFC 7230, Section 5.3)
	//
	// For client requests, the URL's Host specifies the server to
	// connect to, while the Request's Host field optionally
	// specifies the Host header value to send in the HTTP
	// request.
	URL *url.URL

	// The protocol version for incoming server requests.
	//
	// For client requests, these fields are ignored. The HTTP
	// client code always uses either HTTP/1.1 or HTTP/2.
	// See the docs on Transport for details.
	Proto      string // "HTTP/1.0"
	ProtoMajor int    // 1
	ProtoMinor int    // 0

	// Header contains the request header fields either received
	// by the server or to be sent by the client.
	//
	// If a server received a request with header lines,
	//
	//	Host: example.com
	//	accept-encoding: gzip, deflate
	//	Accept-Language: en-us
	//	fOO: Bar
	//	foo: two
	//
	// then
	//
	//	Header = map[string][]string{
	//		"Accept-Encoding": {"gzip, deflate"},
	//		"Accept-Language": {"en-us"},
	//		"Foo": {"Bar", "two"},
	//	}
	//
	// For incoming requests, the Host header is promoted to the
	// Request.Host field and removed from the Header map.
	//
	// HTTP defines that header names are case-insensitive. The
	// request parser implements this by using CanonicalHeaderKey,
	// making the first character and any characters following a
	// hyphen uppercase and the rest lowercase.
	//
	// For client requests, certain headers such as Content-Length
	// and Connection are automatically written when needed and
	// values in Header may be ignored. See the documentation
	// for the Request.Write method.
	Header Header

	// Body is the request's body.
	//
	// For client requests, a nil body means the request has no
	// body, such as a GET request. The HTTP Client's Transport
	// is responsible for calling the Close method.
	//
	// For server requests, the Request Body is always non-nil
	// but will return EOF immediately when no body is present.
	// The Server will close the request body. The ServeHTTP
	// Handler does not need to.
	//
	// Body must allow Read to be called concurrently with Close.
	// In particular, calling Close should unblock a Read waiting
	// for input.
	Body io.ReadCloser

	// GetBody defines an optional func to return a new copy of
	// Body. It is used for client requests when a redirect requires
	// reading the body more than once. Use of GetBody still
	// requires setting Body.
	//
	// For server requests, it is unused.
	GetBody func() (io.ReadCloser, error)

	// ContentLength records the length of the associated content.
	// The value -1 indicates that the length is unknown.
	// Values >= 0 indicate that the given number of bytes may
	// be read from Body.
	//
	// For client requests, a value of 0 with a non-nil Body is
	// also treated as unknown.
	ContentLength int64

	// TransferEncoding lists the transfer encodings from outermost to
	// innermost. An empty list denotes the "identity" encoding.
	// TransferEncoding can usually be ignored; chunked encoding is
	// automatically added and removed as necessary when sending and
	// receiving requests.
	TransferEncoding []string

	// Close indicates whether to close the connection after
	// replying to this request (for servers) or after sending this
	// request and reading its response (for clients).
	//
	// For server requests, the HTTP server handles this automatically
	// and this field is not needed by Handlers.
	//
	// For client requests, setting this field prevents re-use of
	// TCP connections between requests to the same hosts, as if
	// Transport.DisableKeepAlives were set.
	Close bool

	// For server requests, Host specifies the host on which the
	// URL is sought. For HTTP/1 (per RFC 7230, section 5.4), this
	// is either the value of the "Host" header or the host name
	// given in the URL itself. For HTTP/2, it is the value of the
	// ":authority" pseudo-header field.
	// It may be of the form "host:port". For international domain
	// names, Host may be in Punycode or Unicode form. Use
	// golang.org/x/net/idna to convert it to either format if
	// needed.
	// To prevent DNS rebinding attacks, server Handlers should
	// validate that the Host header has a value for which the
	// Handler considers itself authoritative. The included
	// ServeMux supports patterns registered to particular host
	// names and thus protects its registered Handlers.
	//
	// For client requests, Host optionally overrides the Host
	// header to send. If empty, the Request.Write method uses
	// the value of URL.Host. Host may contain an international
	// domain name.
	Host string

	// Form contains the parsed form data, including both the URL
	// field's query parameters and the PATCH, POST, or PUT form data.
	// This field is only available after ParseForm is called.
	// The HTTP client ignores Form and uses Body instead.
	Form url.Values

	// PostForm contains the parsed form data from PATCH, POST
	// or PUT body parameters.
	//
	// This field is only available after ParseForm is called.
	// The HTTP client ignores PostForm and uses Body instead.
	PostForm url.Values

	// MultipartForm is the parsed multipart form, including file uploads.
	// This field is only available after ParseMultipartForm is called.
	// The HTTP client ignores MultipartForm and uses Body instead.
	MultipartForm *multipart.Form

	// Trailer specifies additional headers that are sent after the request
	// body.
	//
	// For server requests, the Trailer map initially contains only the
	// trailer keys, with nil values. (The client declares which trailers it
	// will later send.)  While the handler is reading from Body, it must
	// not reference Trailer. After reading from Body returns EOF, Trailer
	// can be read again and will contain non-nil values, if they were sent
	// by the client.
	//
	// For client requests, Trailer must be initialized to a map containing
	// the trailer keys to later send. The values may be nil or their final
	// values. The ContentLength must be 0 or -1, to send a chunked request.
	// After the HTTP request is sent the map values can be updated while
	// the request body is read. Once the body returns EOF, the caller must
	// not mutate Trailer.
	//
	// Few HTTP clients, servers, or proxies support HTTP trailers.
	Trailer Header

	// RemoteAddr allows HTTP servers and other software to record
	// the network address that sent the request, usually for
	// logging. This field is not filled in by ReadRequest and
	// has no defined format. The HTTP server in this package
	// sets RemoteAddr to an "IP:port" address before invoking a
	// handler.
	// This field is ignored by the HTTP client.
	RemoteAddr string

	// RequestURI is the unmodified request-target of the
	// Request-Line (RFC 7230, Section 3.1.1) as sent by the client
	// to a server. Usually the URL field should be used instead.
	// It is an error to set this field in an HTTP client request.
	RequestURI string

	// TLS allows HTTP servers and other software to record
	// information about the TLS connection on which the request
	// was received. This field is not filled in by ReadRequest.
	// The HTTP server in this package sets the field for
	// TLS-enabled connections before invoking a handler;
	// otherwise it leaves the field nil.
	// This field is ignored by the HTTP client.
	TLS *tls.ConnectionState

	// Cancel is an optional channel whose closure indicates that the client
	// request should be regarded as canceled. Not all implementations of
	// RoundTripper may support Cancel.
	//
	// For server requests, this field is not applicable.
	//
	// Deprecated: Set the Request's context with NewRequestWithContext
	// instead. If a Request's Cancel field and context are both
	// set, it is undefined whether Cancel is respected.
	Cancel <-chan struct{}

	// Response is the redirect response which caused this request
	// to be created. This field is only populated during client
	// redirects.
	Response *Response

	// ctx is either the client or server context. It should only
	// be modified via copying the whole Request using WithContext.
	// It is unexported to prevent people from using Context wrong
	// and mutating the contexts held by callers of the same request.
	ctx context.Context
}
```

A Request represents an HTTP request received by a server or to be sent by a client. 

The field semantics differ slightly between client and server usage. In addition to the notes on the fields below, see the documentation for Request.Write and RoundTripper. 

#### <a id="http2shouldRetryRequest" href="#http2shouldRetryRequest">func http2shouldRetryRequest(req *Request, err error, afterBodyWrite bool) (*Request, error)</a>

```
searchKey: http.http2shouldRetryRequest
tags: [private]
```

```Go
func http2shouldRetryRequest(req *Request, err error, afterBodyWrite bool) (*Request, error)
```

shouldRetryRequest is called by RoundTrip when a request fails to get response headers. It is always called with a non-nil error. It returns either a request to retry (either the same request, or a modified clone), or an error if the request can't be replayed. 

#### <a id="NewRequest" href="#NewRequest">func NewRequest(method, url string, body io.Reader) (*Request, error)</a>

```
searchKey: http.NewRequest
```

```Go
func NewRequest(method, url string, body io.Reader) (*Request, error)
```

NewRequest wraps NewRequestWithContext using context.Background. 

#### <a id="NewRequestWithContext" href="#NewRequestWithContext">func NewRequestWithContext(ctx context.Context, method, url string, body io.Reader) (*Request, error)</a>

```
searchKey: http.NewRequestWithContext
```

```Go
func NewRequestWithContext(ctx context.Context, method, url string, body io.Reader) (*Request, error)
```

NewRequestWithContext returns a new Request given a method, URL, and optional body. 

If the provided body is also an io.Closer, the returned Request.Body is set to body and will be closed by the Client methods Do, Post, and PostForm, and Transport.RoundTrip. 

NewRequestWithContext returns a Request suitable for use with Client.Do or Transport.RoundTrip. To create a request for use with testing a Server Handler, either use the NewRequest function in the net/http/httptest package, use ReadRequest, or manually update the Request fields. For an outgoing client request, the context controls the entire lifetime of a request and its response: obtaining a connection, sending the request, and reading the response headers and body. See the Request type's documentation for the difference between inbound and outbound request fields. 

If body is of type *bytes.Buffer, *bytes.Reader, or *strings.Reader, the returned request's ContentLength is set to its exact value (instead of -1), GetBody is populated (so 307 and 308 redirects can replay the body), and Body is set to NoBody if the ContentLength is 0. 

#### <a id="ReadRequest" href="#ReadRequest">func ReadRequest(b *bufio.Reader) (*Request, error)</a>

```
searchKey: http.ReadRequest
```

```Go
func ReadRequest(b *bufio.Reader) (*Request, error)
```

ReadRequest reads and parses an incoming request from b. 

ReadRequest is a low-level function and should only be used for specialized applications; most code should use the Server to read requests and handle them via the Handler interface. ReadRequest only supports HTTP/1.x requests. For HTTP/2, use golang.org/x/net/http2. 

#### <a id="readRequest" href="#readRequest">func readRequest(b *bufio.Reader) (req *Request, err error)</a>

```
searchKey: http.readRequest
tags: [private]
```

```Go
func readRequest(b *bufio.Reader) (req *Request, err error)
```

#### <a id="setupRewindBody" href="#setupRewindBody">func setupRewindBody(req *Request) *Request</a>

```
searchKey: http.setupRewindBody
tags: [private]
```

```Go
func setupRewindBody(req *Request) *Request
```

setupRewindBody returns a new request with a custom body wrapper that can report whether the body needs rewinding. This lets rewindBody avoid an error result when the request does not have GetBody but the body hasn't been read at all yet. 

#### <a id="rewindBody" href="#rewindBody">func rewindBody(req *Request) (rewound *Request, err error)</a>

```
searchKey: http.rewindBody
tags: [private]
```

```Go
func rewindBody(req *Request) (rewound *Request, err error)
```

rewindBody returns a new request with the body rewound. It returns req unmodified if the body does not need rewinding. rewindBody takes care of closing req.Body when appropriate (in all cases except when rewindBody returns req unmodified). 

#### <a id="dummyReq" href="#dummyReq">func dummyReq(method string) *Request</a>

```
searchKey: http.dummyReq
tags: [private]
```

```Go
func dummyReq(method string) *Request
```

#### <a id="dummyReq11" href="#dummyReq11">func dummyReq11(method string) *Request</a>

```
searchKey: http.dummyReq11
tags: [private]
```

```Go
func dummyReq11(method string) *Request
```

#### <a id="dummyRequest" href="#dummyRequest">func dummyRequest(method string) *Request</a>

```
searchKey: http.dummyRequest
tags: [private]
```

```Go
func dummyRequest(method string) *Request
```

#### <a id="dummyRequestWithBody" href="#dummyRequestWithBody">func dummyRequestWithBody(method string) *Request</a>

```
searchKey: http.dummyRequestWithBody
tags: [private]
```

```Go
func dummyRequestWithBody(method string) *Request
```

#### <a id="dummyRequestWithBodyNoGetBody" href="#dummyRequestWithBodyNoGetBody">func dummyRequestWithBodyNoGetBody(method string) *Request</a>

```
searchKey: http.dummyRequestWithBodyNoGetBody
tags: [private]
```

```Go
func dummyRequestWithBodyNoGetBody(method string) *Request
```

#### <a id="Request.Context" href="#Request.Context">func (r *Request) Context() context.Context</a>

```
searchKey: http.Request.Context
```

```Go
func (r *Request) Context() context.Context
```

Context returns the request's context. To change the context, use WithContext. 

The returned context is always non-nil; it defaults to the background context. 

For outgoing client requests, the context controls cancellation. 

For incoming server requests, the context is canceled when the client's connection closes, the request is canceled (with HTTP/2), or when the ServeHTTP method returns. 

#### <a id="Request.WithContext" href="#Request.WithContext">func (r *Request) WithContext(ctx context.Context) *Request</a>

```
searchKey: http.Request.WithContext
```

```Go
func (r *Request) WithContext(ctx context.Context) *Request
```

WithContext returns a shallow copy of r with its context changed to ctx. The provided ctx must be non-nil. 

For outgoing client request, the context controls the entire lifetime of a request and its response: obtaining a connection, sending the request, and reading the response headers and body. 

To create a new request with a context, use NewRequestWithContext. To change the context of a request, such as an incoming request you want to modify before sending back out, use Request.Clone. Between those two uses, it's rare to need WithContext. 

#### <a id="Request.Clone" href="#Request.Clone">func (r *Request) Clone(ctx context.Context) *Request</a>

```
searchKey: http.Request.Clone
```

```Go
func (r *Request) Clone(ctx context.Context) *Request
```

Clone returns a deep copy of r with its context changed to ctx. The provided ctx must be non-nil. 

For an outgoing client request, the context controls the entire lifetime of a request and its response: obtaining a connection, sending the request, and reading the response headers and body. 

#### <a id="Request.ProtoAtLeast" href="#Request.ProtoAtLeast">func (r *Request) ProtoAtLeast(major, minor int) bool</a>

```
searchKey: http.Request.ProtoAtLeast
```

```Go
func (r *Request) ProtoAtLeast(major, minor int) bool
```

ProtoAtLeast reports whether the HTTP protocol used in the request is at least major.minor. 

#### <a id="Request.UserAgent" href="#Request.UserAgent">func (r *Request) UserAgent() string</a>

```
searchKey: http.Request.UserAgent
```

```Go
func (r *Request) UserAgent() string
```

UserAgent returns the client's User-Agent, if sent in the request. 

#### <a id="Request.Cookies" href="#Request.Cookies">func (r *Request) Cookies() []*Cookie</a>

```
searchKey: http.Request.Cookies
```

```Go
func (r *Request) Cookies() []*Cookie
```

Cookies parses and returns the HTTP cookies sent with the request. 

#### <a id="Request.Cookie" href="#Request.Cookie">func (r *Request) Cookie(name string) (*Cookie, error)</a>

```
searchKey: http.Request.Cookie
```

```Go
func (r *Request) Cookie(name string) (*Cookie, error)
```

Cookie returns the named cookie provided in the request or ErrNoCookie if not found. If multiple cookies match the given name, only one cookie will be returned. 

#### <a id="Request.AddCookie" href="#Request.AddCookie">func (r *Request) AddCookie(c *Cookie)</a>

```
searchKey: http.Request.AddCookie
```

```Go
func (r *Request) AddCookie(c *Cookie)
```

AddCookie adds a cookie to the request. Per RFC 6265 section 5.4, AddCookie does not attach more than one Cookie header field. That means all cookies, if any, are written into the same line, separated by semicolon. AddCookie only sanitizes c's name and value, and does not sanitize a Cookie header already present in the request. 

#### <a id="Request.Referer" href="#Request.Referer">func (r *Request) Referer() string</a>

```
searchKey: http.Request.Referer
```

```Go
func (r *Request) Referer() string
```

Referer returns the referring URL, if sent in the request. 

Referer is misspelled as in the request itself, a mistake from the earliest days of HTTP.  This value can also be fetched from the Header map as Header["Referer"]; the benefit of making it available as a method is that the compiler can diagnose programs that use the alternate (correct English) spelling req.Referrer() but cannot diagnose programs that use Header["Referrer"]. 

#### <a id="Request.MultipartReader" href="#Request.MultipartReader">func (r *Request) MultipartReader() (*multipart.Reader, error)</a>

```
searchKey: http.Request.MultipartReader
```

```Go
func (r *Request) MultipartReader() (*multipart.Reader, error)
```

MultipartReader returns a MIME multipart reader if this is a multipart/form-data or a multipart/mixed POST request, else returns nil and an error. Use this function instead of ParseMultipartForm to process the request body as a stream. 

#### <a id="Request.multipartReader" href="#Request.multipartReader">func (r *Request) multipartReader(allowMixed bool) (*multipart.Reader, error)</a>

```
searchKey: http.Request.multipartReader
tags: [private]
```

```Go
func (r *Request) multipartReader(allowMixed bool) (*multipart.Reader, error)
```

#### <a id="Request.isH2Upgrade" href="#Request.isH2Upgrade">func (r *Request) isH2Upgrade() bool</a>

```
searchKey: http.Request.isH2Upgrade
tags: [private]
```

```Go
func (r *Request) isH2Upgrade() bool
```

isH2Upgrade reports whether r represents the http2 "client preface" magic string. 

#### <a id="Request.Write" href="#Request.Write">func (r *Request) Write(w io.Writer) error</a>

```
searchKey: http.Request.Write
```

```Go
func (r *Request) Write(w io.Writer) error
```

Write writes an HTTP/1.1 request, which is the header and body, in wire format. This method consults the following fields of the request: 

```
Host
URL
Method (defaults to "GET")
Header
ContentLength
TransferEncoding
Body

```
If Body is present, Content-Length is <= 0 and TransferEncoding hasn't been set to "identity", Write adds "Transfer-Encoding: chunked" to the header. Body is closed after it is sent. 

#### <a id="Request.WriteProxy" href="#Request.WriteProxy">func (r *Request) WriteProxy(w io.Writer) error</a>

```
searchKey: http.Request.WriteProxy
```

```Go
func (r *Request) WriteProxy(w io.Writer) error
```

WriteProxy is like Write but writes the request in the form expected by an HTTP proxy. In particular, WriteProxy writes the initial Request-URI line of the request with an absolute URI, per section 5.3 of RFC 7230, including the scheme and host. In either case, WriteProxy also writes a Host header, using either r.Host or r.URL.Host. 

#### <a id="Request.write" href="#Request.write">func (r *Request) write(w io.Writer, usingProxy bool, extraHeaders Header, waitForContinue func() bool) (err error)</a>

```
searchKey: http.Request.write
tags: [private]
```

```Go
func (r *Request) write(w io.Writer, usingProxy bool, extraHeaders Header, waitForContinue func() bool) (err error)
```

extraHeaders may be nil waitForContinue may be nil always closes body 

#### <a id="Request.BasicAuth" href="#Request.BasicAuth">func (r *Request) BasicAuth() (username, password string, ok bool)</a>

```
searchKey: http.Request.BasicAuth
```

```Go
func (r *Request) BasicAuth() (username, password string, ok bool)
```

BasicAuth returns the username and password provided in the request's Authorization header, if the request uses HTTP Basic Authentication. See RFC 2617, Section 2. 

#### <a id="Request.SetBasicAuth" href="#Request.SetBasicAuth">func (r *Request) SetBasicAuth(username, password string)</a>

```
searchKey: http.Request.SetBasicAuth
```

```Go
func (r *Request) SetBasicAuth(username, password string)
```

SetBasicAuth sets the request's Authorization header to use HTTP Basic Authentication with the provided username and password. 

With HTTP Basic Authentication the provided username and password are not encrypted. 

Some protocols may impose additional requirements on pre-escaping the username and password. For instance, when used with OAuth2, both arguments must be URL encoded first with url.QueryEscape. 

#### <a id="Request.ParseForm" href="#Request.ParseForm">func (r *Request) ParseForm() error</a>

```
searchKey: http.Request.ParseForm
```

```Go
func (r *Request) ParseForm() error
```

ParseForm populates r.Form and r.PostForm. 

For all requests, ParseForm parses the raw query from the URL and updates r.Form. 

For POST, PUT, and PATCH requests, it also reads the request body, parses it as a form and puts the results into both r.PostForm and r.Form. Request body parameters take precedence over URL query string values in r.Form. 

If the request Body's size has not already been limited by MaxBytesReader, the size is capped at 10MB. 

For other HTTP methods, or when the Content-Type is not application/x-www-form-urlencoded, the request Body is not read, and r.PostForm is initialized to a non-nil, empty value. 

ParseMultipartForm calls ParseForm automatically. ParseForm is idempotent. 

#### <a id="Request.ParseMultipartForm" href="#Request.ParseMultipartForm">func (r *Request) ParseMultipartForm(maxMemory int64) error</a>

```
searchKey: http.Request.ParseMultipartForm
```

```Go
func (r *Request) ParseMultipartForm(maxMemory int64) error
```

ParseMultipartForm parses a request body as multipart/form-data. The whole request body is parsed and up to a total of maxMemory bytes of its file parts are stored in memory, with the remainder stored on disk in temporary files. ParseMultipartForm calls ParseForm if necessary. If ParseForm returns an error, ParseMultipartForm returns it but also continues parsing the request body. After one call to ParseMultipartForm, subsequent calls have no effect. 

#### <a id="Request.FormValue" href="#Request.FormValue">func (r *Request) FormValue(key string) string</a>

```
searchKey: http.Request.FormValue
```

```Go
func (r *Request) FormValue(key string) string
```

FormValue returns the first value for the named component of the query. POST and PUT body parameters take precedence over URL query string values. FormValue calls ParseMultipartForm and ParseForm if necessary and ignores any errors returned by these functions. If key is not present, FormValue returns the empty string. To access multiple values of the same key, call ParseForm and then inspect Request.Form directly. 

#### <a id="Request.PostFormValue" href="#Request.PostFormValue">func (r *Request) PostFormValue(key string) string</a>

```
searchKey: http.Request.PostFormValue
```

```Go
func (r *Request) PostFormValue(key string) string
```

PostFormValue returns the first value for the named component of the POST, PATCH, or PUT request body. URL query parameters are ignored. PostFormValue calls ParseMultipartForm and ParseForm if necessary and ignores any errors returned by these functions. If key is not present, PostFormValue returns the empty string. 

#### <a id="Request.FormFile" href="#Request.FormFile">func (r *Request) FormFile(key string) (multipart.File, *multipart.FileHeader, error)</a>

```
searchKey: http.Request.FormFile
```

```Go
func (r *Request) FormFile(key string) (multipart.File, *multipart.FileHeader, error)
```

FormFile returns the first file for the provided form key. FormFile calls ParseMultipartForm and ParseForm if necessary. 

#### <a id="Request.expectsContinue" href="#Request.expectsContinue">func (r *Request) expectsContinue() bool</a>

```
searchKey: http.Request.expectsContinue
tags: [private]
```

```Go
func (r *Request) expectsContinue() bool
```

#### <a id="Request.wantsHttp10KeepAlive" href="#Request.wantsHttp10KeepAlive">func (r *Request) wantsHttp10KeepAlive() bool</a>

```
searchKey: http.Request.wantsHttp10KeepAlive
tags: [private]
```

```Go
func (r *Request) wantsHttp10KeepAlive() bool
```

#### <a id="Request.wantsClose" href="#Request.wantsClose">func (r *Request) wantsClose() bool</a>

```
searchKey: http.Request.wantsClose
tags: [private]
```

```Go
func (r *Request) wantsClose() bool
```

#### <a id="Request.closeBody" href="#Request.closeBody">func (r *Request) closeBody() error</a>

```
searchKey: http.Request.closeBody
tags: [private]
```

```Go
func (r *Request) closeBody() error
```

#### <a id="Request.isReplayable" href="#Request.isReplayable">func (r *Request) isReplayable() bool</a>

```
searchKey: http.Request.isReplayable
tags: [private]
```

```Go
func (r *Request) isReplayable() bool
```

#### <a id="Request.outgoingLength" href="#Request.outgoingLength">func (r *Request) outgoingLength() int64</a>

```
searchKey: http.Request.outgoingLength
tags: [private]
```

```Go
func (r *Request) outgoingLength() int64
```

outgoingLength reports the Content-Length of this outgoing (Client) request. It maps 0 into -1 (unknown) when the Body is non-nil. 

#### <a id="Request.requiresHTTP1" href="#Request.requiresHTTP1">func (r *Request) requiresHTTP1() bool</a>

```
searchKey: http.Request.requiresHTTP1
tags: [private]
```

```Go
func (r *Request) requiresHTTP1() bool
```

requiresHTTP1 reports whether this request requires being sent on an HTTP/1 connection. 

#### <a id="Request.WithT" href="#Request.WithT">func (r *Request) WithT(t *testing.T) *Request</a>

```
searchKey: http.Request.WithT
tags: [private]
```

```Go
func (r *Request) WithT(t *testing.T) *Request
```

#### <a id="Request.ExportIsReplayable" href="#Request.ExportIsReplayable">func (r *Request) ExportIsReplayable() bool</a>

```
searchKey: http.Request.ExportIsReplayable
tags: [private]
```

```Go
func (r *Request) ExportIsReplayable() bool
```

### <a id="requestBodyReadError" href="#requestBodyReadError">type requestBodyReadError struct</a>

```
searchKey: http.requestBodyReadError
tags: [private]
```

```Go
type requestBodyReadError struct{ error }
```

requestBodyReadError wraps an error from (*Request).write to indicate that the error came from a Read call on the Request.Body. This error type should not escape the net/http package to users. 

### <a id="maxBytesReader" href="#maxBytesReader">type maxBytesReader struct</a>

```
searchKey: http.maxBytesReader
tags: [private]
```

```Go
type maxBytesReader struct {
	w   ResponseWriter
	r   io.ReadCloser // underlying reader
	n   int64         // max bytes remaining
	err error         // sticky error
}
```

#### <a id="maxBytesReader.Read" href="#maxBytesReader.Read">func (l *maxBytesReader) Read(p []byte) (n int, err error)</a>

```
searchKey: http.maxBytesReader.Read
tags: [private]
```

```Go
func (l *maxBytesReader) Read(p []byte) (n int, err error)
```

#### <a id="maxBytesReader.Close" href="#maxBytesReader.Close">func (l *maxBytesReader) Close() error</a>

```
searchKey: http.maxBytesReader.Close
tags: [private]
```

```Go
func (l *maxBytesReader) Close() error
```

### <a id="Response" href="#Response">type Response struct</a>

```
searchKey: http.Response
```

```Go
type Response struct {
	Status     string // e.g. "200 OK"
	StatusCode int    // e.g. 200
	Proto      string // e.g. "HTTP/1.0"
	ProtoMajor int    // e.g. 1
	ProtoMinor int    // e.g. 0

	// Header maps header keys to values. If the response had multiple
	// headers with the same key, they may be concatenated, with comma
	// delimiters.  (RFC 7230, section 3.2.2 requires that multiple headers
	// be semantically equivalent to a comma-delimited sequence.) When
	// Header values are duplicated by other fields in this struct (e.g.,
	// ContentLength, TransferEncoding, Trailer), the field values are
	// authoritative.
	//
	// Keys in the map are canonicalized (see CanonicalHeaderKey).
	Header Header

	// Body represents the response body.
	//
	// The response body is streamed on demand as the Body field
	// is read. If the network connection fails or the server
	// terminates the response, Body.Read calls return an error.
	//
	// The http Client and Transport guarantee that Body is always
	// non-nil, even on responses without a body or responses with
	// a zero-length body. It is the caller's responsibility to
	// close Body. The default HTTP client's Transport may not
	// reuse HTTP/1.x "keep-alive" TCP connections if the Body is
	// not read to completion and closed.
	//
	// The Body is automatically dechunked if the server replied
	// with a "chunked" Transfer-Encoding.
	//
	// As of Go 1.12, the Body will also implement io.Writer
	// on a successful "101 Switching Protocols" response,
	// as used by WebSockets and HTTP/2's "h2c" mode.
	Body io.ReadCloser

	// ContentLength records the length of the associated content. The
	// value -1 indicates that the length is unknown. Unless Request.Method
	// is "HEAD", values >= 0 indicate that the given number of bytes may
	// be read from Body.
	ContentLength int64

	// Contains transfer encodings from outer-most to inner-most. Value is
	// nil, means that "identity" encoding is used.
	TransferEncoding []string

	// Close records whether the header directed that the connection be
	// closed after reading Body. The value is advice for clients: neither
	// ReadResponse nor Response.Write ever closes a connection.
	Close bool

	// Uncompressed reports whether the response was sent compressed but
	// was decompressed by the http package. When true, reading from
	// Body yields the uncompressed content instead of the compressed
	// content actually set from the server, ContentLength is set to -1,
	// and the "Content-Length" and "Content-Encoding" fields are deleted
	// from the responseHeader. To get the original response from
	// the server, set Transport.DisableCompression to true.
	Uncompressed bool

	// Trailer maps trailer keys to values in the same
	// format as Header.
	//
	// The Trailer initially contains only nil values, one for
	// each key specified in the server's "Trailer" header
	// value. Those values are not added to Header.
	//
	// Trailer must not be accessed concurrently with Read calls
	// on the Body.
	//
	// After Body.Read has returned io.EOF, Trailer will contain
	// any trailer values sent by the server.
	Trailer Header

	// Request is the request that was sent to obtain this Response.
	// Request's Body is nil (having already been consumed).
	// This is only populated for Client requests.
	Request *Request

	// TLS contains information about the TLS connection on which the
	// response was received. It is nil for unencrypted responses.
	// The pointer is shared between responses and should not be
	// modified.
	TLS *tls.ConnectionState
}
```

Response represents the response from an HTTP request. 

The Client and Transport return Responses from servers once the response headers have been received. The response body is streamed on demand as the Body field is read. 

#### <a id="send" href="#send">func send(ireq *Request, rt RoundTripper, deadline time.Time) (resp *Response, didTimeout func() bool, err error)</a>

```
searchKey: http.send
tags: [private]
```

```Go
func send(ireq *Request, rt RoundTripper, deadline time.Time) (resp *Response, didTimeout func() bool, err error)
```

send issues an HTTP request. Caller should close resp.Body when done reading from it. 

#### <a id="Get" href="#Get">func Get(url string) (resp *Response, err error)</a>

```
searchKey: http.Get
```

```Go
func Get(url string) (resp *Response, err error)
```

Get issues a GET to the specified URL. If the response is one of the following redirect codes, Get follows the redirect, up to a maximum of 10 redirects: 

```
301 (Moved Permanently)
302 (Found)
303 (See Other)
307 (Temporary Redirect)
308 (Permanent Redirect)

```
An error is returned if there were too many redirects or if there was an HTTP protocol error. A non-2xx response doesn't cause an error. Any returned error will be of type *url.Error. The url.Error value's Timeout method will report true if the request timed out. 

When err is nil, resp always contains a non-nil resp.Body. Caller should close resp.Body when done reading from it. 

Get is a wrapper around DefaultClient.Get. 

To make a request with custom headers, use NewRequest and DefaultClient.Do. 

To make a request with a specified context.Context, use NewRequestWithContext and DefaultClient.Do. 

#### <a id="Post" href="#Post">func Post(url, contentType string, body io.Reader) (resp *Response, err error)</a>

```
searchKey: http.Post
```

```Go
func Post(url, contentType string, body io.Reader) (resp *Response, err error)
```

Post issues a POST to the specified URL. 

Caller should close resp.Body when done reading from it. 

If the provided body is an io.Closer, it is closed after the request. 

Post is a wrapper around DefaultClient.Post. 

To set custom headers, use NewRequest and DefaultClient.Do. 

See the Client.Do method documentation for details on how redirects are handled. 

To make a request with a specified context.Context, use NewRequestWithContext and DefaultClient.Do. 

#### <a id="PostForm" href="#PostForm">func PostForm(url string, data url.Values) (resp *Response, err error)</a>

```
searchKey: http.PostForm
```

```Go
func PostForm(url string, data url.Values) (resp *Response, err error)
```

PostForm issues a POST to the specified URL, with data's keys and values URL-encoded as the request body. 

The Content-Type header is set to application/x-www-form-urlencoded. To set other headers, use NewRequest and DefaultClient.Do. 

When err is nil, resp always contains a non-nil resp.Body. Caller should close resp.Body when done reading from it. 

PostForm is a wrapper around DefaultClient.PostForm. 

See the Client.Do method documentation for details on how redirects are handled. 

To make a request with a specified context.Context, use NewRequestWithContext and DefaultClient.Do. 

#### <a id="Head" href="#Head">func Head(url string) (resp *Response, err error)</a>

```
searchKey: http.Head
```

```Go
func Head(url string) (resp *Response, err error)
```

Head issues a HEAD to the specified URL. If the response is one of the following redirect codes, Head follows the redirect, up to a maximum of 10 redirects: 

```
301 (Moved Permanently)
302 (Found)
303 (See Other)
307 (Temporary Redirect)
308 (Permanent Redirect)

```
Head is a wrapper around DefaultClient.Head 

To make a request with a specified context.Context, use NewRequestWithContext and DefaultClient.Do. 

#### <a id="ReadResponse" href="#ReadResponse">func ReadResponse(r *bufio.Reader, req *Request) (*Response, error)</a>

```
searchKey: http.ReadResponse
```

```Go
func ReadResponse(r *bufio.Reader, req *Request) (*Response, error)
```

ReadResponse reads and returns an HTTP response from r. The req parameter optionally specifies the Request that corresponds to this Response. If nil, a GET request is assumed. Clients must call resp.Body.Close when finished reading resp.Body. After that call, clients can inspect resp.Trailer to find key/value pairs included in the response trailer. 

#### <a id="Response.Cookies" href="#Response.Cookies">func (r *Response) Cookies() []*Cookie</a>

```
searchKey: http.Response.Cookies
```

```Go
func (r *Response) Cookies() []*Cookie
```

Cookies parses and returns the cookies set in the Set-Cookie headers. 

#### <a id="Response.Location" href="#Response.Location">func (r *Response) Location() (*url.URL, error)</a>

```
searchKey: http.Response.Location
```

```Go
func (r *Response) Location() (*url.URL, error)
```

Location returns the URL of the response's "Location" header, if present. Relative redirects are resolved relative to the Response's Request. ErrNoLocation is returned if no Location header is present. 

#### <a id="Response.ProtoAtLeast" href="#Response.ProtoAtLeast">func (r *Response) ProtoAtLeast(major, minor int) bool</a>

```
searchKey: http.Response.ProtoAtLeast
```

```Go
func (r *Response) ProtoAtLeast(major, minor int) bool
```

ProtoAtLeast reports whether the HTTP protocol used in the response is at least major.minor. 

#### <a id="Response.Write" href="#Response.Write">func (r *Response) Write(w io.Writer) error</a>

```
searchKey: http.Response.Write
```

```Go
func (r *Response) Write(w io.Writer) error
```

Write writes r to w in the HTTP/1.x server response format, including the status line, headers, body, and optional trailer. 

This method consults the following fields of the response r: 

```
StatusCode
ProtoMajor
ProtoMinor
Request.Method
TransferEncoding
Trailer
Body
ContentLength
Header, values for non-canonical keys will have unpredictable behavior

```
The Response Body is closed after it is sent. 

#### <a id="Response.closeBody" href="#Response.closeBody">func (r *Response) closeBody()</a>

```
searchKey: http.Response.closeBody
tags: [private]
```

```Go
func (r *Response) closeBody()
```

#### <a id="Response.bodyIsWritable" href="#Response.bodyIsWritable">func (r *Response) bodyIsWritable() bool</a>

```
searchKey: http.Response.bodyIsWritable
tags: [private]
```

```Go
func (r *Response) bodyIsWritable() bool
```

bodyIsWritable reports whether the Body supports writing. The Transport returns Writable bodies for 101 Switching Protocols responses. The Transport uses this method to determine whether a persistent connection is done being managed from its perspective. Once we return a writable response body to a user, the net/http package is done managing that connection. 

#### <a id="Response.isProtocolSwitch" href="#Response.isProtocolSwitch">func (r *Response) isProtocolSwitch() bool</a>

```
searchKey: http.Response.isProtocolSwitch
tags: [private]
```

```Go
func (r *Response) isProtocolSwitch() bool
```

isProtocolSwitch reports whether the response code and header indicate a successful protocol upgrade response. 

### <a id="Handler" href="#Handler">type Handler interface</a>

```
searchKey: http.Handler
```

```Go
type Handler interface {
	ServeHTTP(ResponseWriter, *Request)
}
```

A Handler responds to an HTTP request. 

ServeHTTP should write reply headers and data to the ResponseWriter and then return. Returning signals that the request is finished; it is not valid to use the ResponseWriter or read from the Request.Body after or concurrently with the completion of the ServeHTTP call. 

Depending on the HTTP client software, HTTP protocol version, and any intermediaries between the client and the Go server, it may not be possible to read from the Request.Body after writing to the ResponseWriter. Cautious handlers should read the Request.Body first, and then reply. 

Except for reading the body, handlers should not modify the provided Request. 

If ServeHTTP panics, the server (the caller of ServeHTTP) assumes that the effect of the panic was isolated to the active request. It recovers the panic, logs a stack trace to the server error log, and either closes the network connection or sends an HTTP/2 RST_STREAM, depending on the HTTP protocol. To abort a handler so the client sees an interrupted response but the server doesn't log an error, panic with the value ErrAbortHandler. 

#### <a id="FileServer" href="#FileServer">func FileServer(root FileSystem) Handler</a>

```
searchKey: http.FileServer
```

```Go
func FileServer(root FileSystem) Handler
```

FileServer returns a handler that serves HTTP requests with the contents of the file system rooted at root. 

As a special case, the returned file server redirects any request ending in "/index.html" to the same path, without the final "index.html". 

To use the operating system's file system implementation, use http.Dir: 

```
http.Handle("/", http.FileServer(http.Dir("/tmp")))

```
To use an fs.FS implementation, use http.FS to convert it: 

```
http.Handle("/", http.FileServer(http.FS(fsys)))

```
#### <a id="NotFoundHandler" href="#NotFoundHandler">func NotFoundHandler() Handler</a>

```
searchKey: http.NotFoundHandler
```

```Go
func NotFoundHandler() Handler
```

NotFoundHandler returns a simple request handler that replies to each request with a `404 page not found' reply. 

#### <a id="StripPrefix" href="#StripPrefix">func StripPrefix(prefix string, h Handler) Handler</a>

```
searchKey: http.StripPrefix
```

```Go
func StripPrefix(prefix string, h Handler) Handler
```

StripPrefix returns a handler that serves HTTP requests by removing the given prefix from the request URL's Path (and RawPath if set) and invoking the handler h. StripPrefix handles a request for a path that doesn't begin with prefix by replying with an HTTP 404 not found error. The prefix must match exactly: if the prefix in the request contains escaped characters the reply is also an HTTP 404 not found error. 

#### <a id="RedirectHandler" href="#RedirectHandler">func RedirectHandler(url string, code int) Handler</a>

```
searchKey: http.RedirectHandler
```

```Go
func RedirectHandler(url string, code int) Handler
```

RedirectHandler returns a request handler that redirects each request it receives to the given url using the given status code. 

The provided code should be in the 3xx range and is usually StatusMovedPermanently, StatusFound or StatusSeeOther. 

#### <a id="AllowQuerySemicolons" href="#AllowQuerySemicolons">func AllowQuerySemicolons(h Handler) Handler</a>

```
searchKey: http.AllowQuerySemicolons
```

```Go
func AllowQuerySemicolons(h Handler) Handler
```

AllowQuerySemicolons returns a handler that serves requests by converting any unescaped semicolons in the URL query to ampersands, and invoking the handler h. 

This restores the pre-Go 1.17 behavior of splitting query parameters on both semicolons and ampersands. (See golang.org/issue/25192). Note that this behavior doesn't match that of many proxies, and the mismatch can lead to security issues. 

AllowQuerySemicolons should be invoked before Request.ParseForm is called. 

#### <a id="TimeoutHandler" href="#TimeoutHandler">func TimeoutHandler(h Handler, dt time.Duration, msg string) Handler</a>

```
searchKey: http.TimeoutHandler
```

```Go
func TimeoutHandler(h Handler, dt time.Duration, msg string) Handler
```

TimeoutHandler returns a Handler that runs h with the given time limit. 

The new Handler calls h.ServeHTTP to handle each request, but if a call runs for longer than its time limit, the handler responds with a 503 Service Unavailable error and the given message in its body. (If msg is empty, a suitable default message will be sent.) After such a timeout, writes by h to its ResponseWriter will return ErrHandlerTimeout. 

TimeoutHandler supports the Pusher interface but does not support the Hijacker or Flusher interfaces. 

#### <a id="NewTestTimeoutHandler" href="#NewTestTimeoutHandler">func NewTestTimeoutHandler(handler Handler, ch <-chan time.Time) Handler</a>

```
searchKey: http.NewTestTimeoutHandler
tags: [private]
```

```Go
func NewTestTimeoutHandler(handler Handler, ch <-chan time.Time) Handler
```

### <a id="ResponseWriter" href="#ResponseWriter">type ResponseWriter interface</a>

```
searchKey: http.ResponseWriter
```

```Go
type ResponseWriter interface {
	// Header returns the header map that will be sent by
	// WriteHeader. The Header map also is the mechanism with which
	// Handlers can set HTTP trailers.
	//
	// Changing the header map after a call to WriteHeader (or
	// Write) has no effect unless the modified headers are
	// trailers.
	//
	// There are two ways to set Trailers. The preferred way is to
	// predeclare in the headers which trailers you will later
	// send by setting the "Trailer" header to the names of the
	// trailer keys which will come later. In this case, those
	// keys of the Header map are treated as if they were
	// trailers. See the example. The second way, for trailer
	// keys not known to the Handler until after the first Write,
	// is to prefix the Header map keys with the TrailerPrefix
	// constant value. See TrailerPrefix.
	//
	// To suppress automatic response headers (such as "Date"), set
	// their value to nil.
	Header() Header

	// Write writes the data to the connection as part of an HTTP reply.
	//
	// If WriteHeader has not yet been called, Write calls
	// WriteHeader(http.StatusOK) before writing the data. If the Header
	// does not contain a Content-Type line, Write adds a Content-Type set
	// to the result of passing the initial 512 bytes of written data to
	// DetectContentType. Additionally, if the total size of all written
	// data is under a few KB and there are no Flush calls, the
	// Content-Length header is added automatically.
	//
	// Depending on the HTTP protocol version and the client, calling
	// Write or WriteHeader may prevent future reads on the
	// Request.Body. For HTTP/1.x requests, handlers should read any
	// needed request body data before writing the response. Once the
	// headers have been flushed (due to either an explicit Flusher.Flush
	// call or writing enough data to trigger a flush), the request body
	// may be unavailable. For HTTP/2 requests, the Go HTTP server permits
	// handlers to continue to read the request body while concurrently
	// writing the response. However, such behavior may not be supported
	// by all HTTP/2 clients. Handlers should read before writing if
	// possible to maximize compatibility.
	Write([]byte) (int, error)

	// WriteHeader sends an HTTP response header with the provided
	// status code.
	//
	// If WriteHeader is not called explicitly, the first call to Write
	// will trigger an implicit WriteHeader(http.StatusOK).
	// Thus explicit calls to WriteHeader are mainly used to
	// send error codes.
	//
	// The provided code must be a valid HTTP 1xx-5xx status code.
	// Only one header may be written. Go does not currently
	// support sending user-defined 1xx informational headers,
	// with the exception of 100-continue response header that the
	// Server sends automatically when the Request.Body is read.
	WriteHeader(statusCode int)
}
```

A ResponseWriter interface is used by an HTTP handler to construct an HTTP response. 

A ResponseWriter may not be used after the Handler.ServeHTTP method has returned. 

### <a id="Flusher" href="#Flusher">type Flusher interface</a>

```
searchKey: http.Flusher
```

```Go
type Flusher interface {
	// Flush sends any buffered data to the client.
	Flush()
}
```

The Flusher interface is implemented by ResponseWriters that allow an HTTP handler to flush buffered data to the client. 

The default HTTP/1.x and HTTP/2 ResponseWriter implementations support Flusher, but ResponseWriter wrappers may not. Handlers should always test for this ability at runtime. 

Note that even for ResponseWriters that support Flush, if the client is connected through an HTTP proxy, the buffered data may not reach the client until the response completes. 

### <a id="Hijacker" href="#Hijacker">type Hijacker interface</a>

```
searchKey: http.Hijacker
```

```Go
type Hijacker interface {
	// Hijack lets the caller take over the connection.
	// After a call to Hijack the HTTP server library
	// will not do anything else with the connection.
	//
	// It becomes the caller's responsibility to manage
	// and close the connection.
	//
	// The returned net.Conn may have read or write deadlines
	// already set, depending on the configuration of the
	// Server. It is the caller's responsibility to set
	// or clear those deadlines as needed.
	//
	// The returned bufio.Reader may contain unprocessed buffered
	// data from the client.
	//
	// After a call to Hijack, the original Request.Body must not
	// be used. The original Request's Context remains valid and
	// is not canceled until the Request's ServeHTTP method
	// returns.
	Hijack() (net.Conn, *bufio.ReadWriter, error)
}
```

The Hijacker interface is implemented by ResponseWriters that allow an HTTP handler to take over the connection. 

The default ResponseWriter for HTTP/1.x connections supports Hijacker, but HTTP/2 connections intentionally do not. ResponseWriter wrappers may also not support Hijacker. Handlers should always test for this ability at runtime. 

### <a id="CloseNotifier" href="#CloseNotifier">type CloseNotifier interface</a>

```
searchKey: http.CloseNotifier
```

```Go
type CloseNotifier interface {
	// CloseNotify returns a channel that receives at most a
	// single value (true) when the client connection has gone
	// away.
	//
	// CloseNotify may wait to notify until Request.Body has been
	// fully read.
	//
	// After the Handler has returned, there is no guarantee
	// that the channel receives a value.
	//
	// If the protocol is HTTP/1.1 and CloseNotify is called while
	// processing an idempotent request (such a GET) while
	// HTTP/1.1 pipelining is in use, the arrival of a subsequent
	// pipelined request may cause a value to be sent on the
	// returned channel. In practice HTTP/1.1 pipelining is not
	// enabled in browsers and not seen often in the wild. If this
	// is a problem, use HTTP/2 or only use CloseNotify on methods
	// such as POST.
	CloseNotify() <-chan bool
}
```

The CloseNotifier interface is implemented by ResponseWriters which allow detecting when the underlying connection has gone away. 

This mechanism can be used to cancel long operations on the server if the client has disconnected before the response is ready. 

Deprecated: the CloseNotifier interface predates Go's context package. New code should use Request.Context instead. 

### <a id="conn" href="#conn">type conn struct</a>

```
searchKey: http.conn
tags: [private]
```

```Go
type conn struct {
	// server is the server on which the connection arrived.
	// Immutable; never nil.
	server *Server

	// cancelCtx cancels the connection-level context.
	cancelCtx context.CancelFunc

	// rwc is the underlying network connection.
	// This is never wrapped by other types and is the value given out
	// to CloseNotifier callers. It is usually of type *net.TCPConn or
	// *tls.Conn.
	rwc net.Conn

	// remoteAddr is rwc.RemoteAddr().String(). It is not populated synchronously
	// inside the Listener's Accept goroutine, as some implementations block.
	// It is populated immediately inside the (*conn).serve goroutine.
	// This is the value of a Handler's (*Request).RemoteAddr.
	remoteAddr string

	// tlsState is the TLS connection state when using TLS.
	// nil means not TLS.
	tlsState *tls.ConnectionState

	// werr is set to the first write error to rwc.
	// It is set via checkConnErrorWriter{w}, where bufw writes.
	werr error

	// r is bufr's read source. It's a wrapper around rwc that provides
	// io.LimitedReader-style limiting (while reading request headers)
	// and functionality to support CloseNotifier. See *connReader docs.
	r *connReader

	// bufr reads from r.
	bufr *bufio.Reader

	// bufw writes to checkConnErrorWriter{c}, which populates werr on error.
	bufw *bufio.Writer

	// lastMethod is the method of the most recent request
	// on this connection, if any.
	lastMethod string

	curReq atomic.Value // of *response (which has a Request in it)

	curState struct{ atomic uint64 } // packed (unixtime<<8|uint8(ConnState))

	// mu guards hijackedv
	mu sync.Mutex

	// hijackedv is whether this connection has been hijacked
	// by a Handler with the Hijacker interface.
	// It is guarded by mu.
	hijackedv bool
}
```

A conn represents the server side of an HTTP connection. 

#### <a id="conn.hijacked" href="#conn.hijacked">func (c *conn) hijacked() bool</a>

```
searchKey: http.conn.hijacked
tags: [private]
```

```Go
func (c *conn) hijacked() bool
```

#### <a id="conn.hijackLocked" href="#conn.hijackLocked">func (c *conn) hijackLocked() (rwc net.Conn, buf *bufio.ReadWriter, err error)</a>

```
searchKey: http.conn.hijackLocked
tags: [private]
```

```Go
func (c *conn) hijackLocked() (rwc net.Conn, buf *bufio.ReadWriter, err error)
```

c.mu must be held. 

#### <a id="conn.readRequest" href="#conn.readRequest">func (c *conn) readRequest(ctx context.Context) (w *response, err error)</a>

```
searchKey: http.conn.readRequest
tags: [private]
```

```Go
func (c *conn) readRequest(ctx context.Context) (w *response, err error)
```

Read next request from connection. 

#### <a id="conn.finalFlush" href="#conn.finalFlush">func (c *conn) finalFlush()</a>

```
searchKey: http.conn.finalFlush
tags: [private]
```

```Go
func (c *conn) finalFlush()
```

#### <a id="conn.close" href="#conn.close">func (c *conn) close()</a>

```
searchKey: http.conn.close
tags: [private]
```

```Go
func (c *conn) close()
```

Close the connection. 

#### <a id="conn.closeWriteAndWait" href="#conn.closeWriteAndWait">func (c *conn) closeWriteAndWait()</a>

```
searchKey: http.conn.closeWriteAndWait
tags: [private]
```

```Go
func (c *conn) closeWriteAndWait()
```

closeWrite flushes any outstanding data and sends a FIN packet (if client is connected via TCP), signalling that we're done. We then pause for a bit, hoping the client processes it before any subsequent RST. 

See [https://golang.org/issue/3595](https://golang.org/issue/3595) 

#### <a id="conn.setState" href="#conn.setState">func (c *conn) setState(nc net.Conn, state ConnState, runHook bool)</a>

```
searchKey: http.conn.setState
tags: [private]
```

```Go
func (c *conn) setState(nc net.Conn, state ConnState, runHook bool)
```

#### <a id="conn.getState" href="#conn.getState">func (c *conn) getState() (state ConnState, unixSec int64)</a>

```
searchKey: http.conn.getState
tags: [private]
```

```Go
func (c *conn) getState() (state ConnState, unixSec int64)
```

#### <a id="conn.serve" href="#conn.serve">func (c *conn) serve(ctx context.Context)</a>

```
searchKey: http.conn.serve
tags: [private]
```

```Go
func (c *conn) serve(ctx context.Context)
```

Serve a new connection. 

### <a id="chunkWriter" href="#chunkWriter">type chunkWriter struct</a>

```
searchKey: http.chunkWriter
tags: [private]
```

```Go
type chunkWriter struct {
	res *response

	// header is either nil or a deep clone of res.handlerHeader
	// at the time of res.writeHeader, if res.writeHeader is
	// called and extra buffering is being done to calculate
	// Content-Type and/or Content-Length.
	header Header

	// wroteHeader tells whether the header's been written to "the
	// wire" (or rather: w.conn.buf). this is unlike
	// (*response).wroteHeader, which tells only whether it was
	// logically written.
	wroteHeader bool

	// set by the writeHeader method:
	chunking bool // using chunked transfer encoding for reply body
}
```

chunkWriter writes to a response's conn buffer, and is the writer wrapped by the response.w buffered writer. 

chunkWriter also is responsible for finalizing the Header, including conditionally setting the Content-Type and setting a Content-Length in cases where the handler's final output is smaller than the buffer size. It also conditionally adds chunk headers, when in chunking mode. 

See the comment above (*response).Write for the entire write flow. 

#### <a id="chunkWriter.Write" href="#chunkWriter.Write">func (cw *chunkWriter) Write(p []byte) (n int, err error)</a>

```
searchKey: http.chunkWriter.Write
tags: [private]
```

```Go
func (cw *chunkWriter) Write(p []byte) (n int, err error)
```

#### <a id="chunkWriter.flush" href="#chunkWriter.flush">func (cw *chunkWriter) flush()</a>

```
searchKey: http.chunkWriter.flush
tags: [private]
```

```Go
func (cw *chunkWriter) flush()
```

#### <a id="chunkWriter.close" href="#chunkWriter.close">func (cw *chunkWriter) close()</a>

```
searchKey: http.chunkWriter.close
tags: [private]
```

```Go
func (cw *chunkWriter) close()
```

#### <a id="chunkWriter.writeHeader" href="#chunkWriter.writeHeader">func (cw *chunkWriter) writeHeader(p []byte)</a>

```
searchKey: http.chunkWriter.writeHeader
tags: [private]
```

```Go
func (cw *chunkWriter) writeHeader(p []byte)
```

writeHeader finalizes the header sent to the client and writes it to cw.res.conn.bufw. 

p is not written by writeHeader, but is the first chunk of the body that will be written. It is sniffed for a Content-Type if none is set explicitly. It's also used to set the Content-Length, if the total body size was small and the handler has already finished running. 

### <a id="response" href="#response">type response struct</a>

```
searchKey: http.response
tags: [private]
```

```Go
type response struct {
	conn             *conn
	req              *Request // request for this response
	reqBody          io.ReadCloser
	cancelCtx        context.CancelFunc // when ServeHTTP exits
	wroteHeader      bool               // reply header has been (logically) written
	wroteContinue    bool               // 100 Continue response was written
	wants10KeepAlive bool               // HTTP/1.0 w/ Connection "keep-alive"
	wantsClose       bool               // HTTP request has Connection "close"

	// canWriteContinue is a boolean value accessed as an atomic int32
	// that says whether or not a 100 Continue header can be written
	// to the connection.
	// writeContinueMu must be held while writing the header.
	// These two fields together synchronize the body reader
	// (the expectContinueReader, which wants to write 100 Continue)
	// against the main writer.
	canWriteContinue atomicBool
	writeContinueMu  sync.Mutex

	w  *bufio.Writer // buffers output in chunks to chunkWriter
	cw chunkWriter

	// handlerHeader is the Header that Handlers get access to,
	// which may be retained and mutated even after WriteHeader.
	// handlerHeader is copied into cw.header at WriteHeader
	// time, and privately mutated thereafter.
	handlerHeader Header
	calledHeader  bool // handler accessed handlerHeader via Header

	written       int64 // number of bytes written in body
	contentLength int64 // explicitly-declared Content-Length; or -1
	status        int   // status code passed to WriteHeader

	// close connection after this reply.  set on request and
	// updated after response from handler if there's a
	// "Connection: keep-alive" response header and a
	// Content-Length.
	closeAfterReply bool

	// requestBodyLimitHit is set by requestTooLarge when
	// maxBytesReader hits its max size. It is checked in
	// WriteHeader, to make sure we don't consume the
	// remaining request body to try to advance to the next HTTP
	// request. Instead, when this is set, we stop reading
	// subsequent requests on this connection and stop reading
	// input from it.
	requestBodyLimitHit bool

	// trailers are the headers to be sent after the handler
	// finishes writing the body. This field is initialized from
	// the Trailer response header when the response header is
	// written.
	trailers []string

	handlerDone atomicBool // set true when the handler exits

	// Buffers for Date, Content-Length, and status code
	dateBuf   [len(TimeFormat)]byte
	clenBuf   [10]byte
	statusBuf [3]byte

	// closeNotifyCh is the channel returned by CloseNotify.
	// TODO(bradfitz): this is currently (for Go 1.8) always
	// non-nil. Make this lazily-created again as it used to be?
	closeNotifyCh  chan bool
	didCloseNotify int32 // atomic (only 0->1 winner should send)
}
```

A response represents the server side of an HTTP response. 

#### <a id="response.finalTrailers" href="#response.finalTrailers">func (w *response) finalTrailers() Header</a>

```
searchKey: http.response.finalTrailers
tags: [private]
```

```Go
func (w *response) finalTrailers() Header
```

finalTrailers is called after the Handler exits and returns a non-nil value if the Handler set any trailers. 

#### <a id="response.declareTrailer" href="#response.declareTrailer">func (w *response) declareTrailer(k string)</a>

```
searchKey: http.response.declareTrailer
tags: [private]
```

```Go
func (w *response) declareTrailer(k string)
```

declareTrailer is called for each Trailer header when the response header is written. It notes that a header will need to be written in the trailers at the end of the response. 

#### <a id="response.requestTooLarge" href="#response.requestTooLarge">func (w *response) requestTooLarge()</a>

```
searchKey: http.response.requestTooLarge
tags: [private]
```

```Go
func (w *response) requestTooLarge()
```

requestTooLarge is called by maxBytesReader when too much input has been read from the client. 

#### <a id="response.needsSniff" href="#response.needsSniff">func (w *response) needsSniff() bool</a>

```
searchKey: http.response.needsSniff
tags: [private]
```

```Go
func (w *response) needsSniff() bool
```

needsSniff reports whether a Content-Type still needs to be sniffed. 

#### <a id="response.ReadFrom" href="#response.ReadFrom">func (w *response) ReadFrom(src io.Reader) (n int64, err error)</a>

```
searchKey: http.response.ReadFrom
tags: [private]
```

```Go
func (w *response) ReadFrom(src io.Reader) (n int64, err error)
```

ReadFrom is here to optimize copying from an *os.File regular file to a *net.TCPConn with sendfile, or from a supported src type such as a *net.TCPConn on Linux with splice. 

#### <a id="response.Header" href="#response.Header">func (w *response) Header() Header</a>

```
searchKey: http.response.Header
tags: [private]
```

```Go
func (w *response) Header() Header
```

#### <a id="response.WriteHeader" href="#response.WriteHeader">func (w *response) WriteHeader(code int)</a>

```
searchKey: http.response.WriteHeader
tags: [private]
```

```Go
func (w *response) WriteHeader(code int)
```

#### <a id="response.bodyAllowed" href="#response.bodyAllowed">func (w *response) bodyAllowed() bool</a>

```
searchKey: http.response.bodyAllowed
tags: [private]
```

```Go
func (w *response) bodyAllowed() bool
```

bodyAllowed reports whether a Write is allowed for this response type. It's illegal to call this before the header has been flushed. 

#### <a id="response.Write" href="#response.Write">func (w *response) Write(data []byte) (n int, err error)</a>

```
searchKey: http.response.Write
tags: [private]
```

```Go
func (w *response) Write(data []byte) (n int, err error)
```

The Life Of A Write is like this: 

Handler starts. No header has been sent. The handler can either write a header, or just start writing. Writing before sending a header sends an implicitly empty 200 OK header. 

If the handler didn't declare a Content-Length up front, we either go into chunking mode or, if the handler finishes running before the chunking buffer size, we compute a Content-Length and send that in the header instead. 

Likewise, if the handler didn't set a Content-Type, we sniff that from the initial chunk of output. 

The Writers are wired together like: 

1. *response (the ResponseWriter) -> 2. (*response).w, a *bufio.Writer of bufferBeforeChunkingSize bytes -> 3. chunkWriter.Writer (whose writeHeader finalizes Content-Length/Type) 

```
and which writes the chunk headers, if needed ->

```
4. conn.bufw, a *bufio.Writer of default (4kB) bytes, writing to -> 5. checkConnErrorWriter{c}, which notes any non-nil error on Write 

```
and populates c.werr with it if so, but otherwise writes to ->

```
6. the rwc, the net.Conn. 

TODO(bradfitz): short-circuit some of the buffering when the initial header contains both a Content-Type and Content-Length. Also short-circuit in (1) when the header's been sent and not in chunking mode, writing directly to (4) instead, if (2) has no buffered data. More generally, we could short-circuit from (1) to (3) even in chunking mode if the write size from (1) is over some threshold and nothing is in (2).  The answer might be mostly making bufferBeforeChunkingSize smaller and having bufio's fast-paths deal with this instead. 

#### <a id="response.WriteString" href="#response.WriteString">func (w *response) WriteString(data string) (n int, err error)</a>

```
searchKey: http.response.WriteString
tags: [private]
```

```Go
func (w *response) WriteString(data string) (n int, err error)
```

#### <a id="response.write" href="#response.write">func (w *response) write(lenData int, dataB []byte, dataS string) (n int, err error)</a>

```
searchKey: http.response.write
tags: [private]
```

```Go
func (w *response) write(lenData int, dataB []byte, dataS string) (n int, err error)
```

either dataB or dataS is non-zero. 

#### <a id="response.finishRequest" href="#response.finishRequest">func (w *response) finishRequest()</a>

```
searchKey: http.response.finishRequest
tags: [private]
```

```Go
func (w *response) finishRequest()
```

#### <a id="response.shouldReuseConnection" href="#response.shouldReuseConnection">func (w *response) shouldReuseConnection() bool</a>

```
searchKey: http.response.shouldReuseConnection
tags: [private]
```

```Go
func (w *response) shouldReuseConnection() bool
```

shouldReuseConnection reports whether the underlying TCP connection can be reused. It must only be called after the handler is done executing. 

#### <a id="response.closedRequestBodyEarly" href="#response.closedRequestBodyEarly">func (w *response) closedRequestBodyEarly() bool</a>

```
searchKey: http.response.closedRequestBodyEarly
tags: [private]
```

```Go
func (w *response) closedRequestBodyEarly() bool
```

#### <a id="response.Flush" href="#response.Flush">func (w *response) Flush()</a>

```
searchKey: http.response.Flush
tags: [private]
```

```Go
func (w *response) Flush()
```

#### <a id="response.sendExpectationFailed" href="#response.sendExpectationFailed">func (w *response) sendExpectationFailed()</a>

```
searchKey: http.response.sendExpectationFailed
tags: [private]
```

```Go
func (w *response) sendExpectationFailed()
```

#### <a id="response.Hijack" href="#response.Hijack">func (w *response) Hijack() (rwc net.Conn, buf *bufio.ReadWriter, err error)</a>

```
searchKey: http.response.Hijack
tags: [private]
```

```Go
func (w *response) Hijack() (rwc net.Conn, buf *bufio.ReadWriter, err error)
```

Hijack implements the Hijacker.Hijack method. Our response is both a ResponseWriter and a Hijacker. 

#### <a id="response.CloseNotify" href="#response.CloseNotify">func (w *response) CloseNotify() <-chan bool</a>

```
searchKey: http.response.CloseNotify
tags: [private]
```

```Go
func (w *response) CloseNotify() <-chan bool
```

### <a id="atomicBool" href="#atomicBool">type atomicBool int32</a>

```
searchKey: http.atomicBool
tags: [private]
```

```Go
type atomicBool int32
```

#### <a id="atomicBool.isSet" href="#atomicBool.isSet">func (b *atomicBool) isSet() bool</a>

```
searchKey: http.atomicBool.isSet
tags: [private]
```

```Go
func (b *atomicBool) isSet() bool
```

#### <a id="atomicBool.setTrue" href="#atomicBool.setTrue">func (b *atomicBool) setTrue()</a>

```
searchKey: http.atomicBool.setTrue
tags: [private]
```

```Go
func (b *atomicBool) setTrue()
```

#### <a id="atomicBool.setFalse" href="#atomicBool.setFalse">func (b *atomicBool) setFalse()</a>

```
searchKey: http.atomicBool.setFalse
tags: [private]
```

```Go
func (b *atomicBool) setFalse()
```

### <a id="writerOnly" href="#writerOnly">type writerOnly struct</a>

```
searchKey: http.writerOnly
tags: [private]
```

```Go
type writerOnly struct {
	io.Writer
}
```

writerOnly hides an io.Writer value's optional ReadFrom method from io.Copy. 

### <a id="readResult" href="#readResult">type readResult struct</a>

```
searchKey: http.readResult
tags: [private]
```

```Go
type readResult struct {
	_   incomparable
	n   int
	err error
	b   byte // byte read, if n == 1
}
```

### <a id="connReader" href="#connReader">type connReader struct</a>

```
searchKey: http.connReader
tags: [private]
```

```Go
type connReader struct {
	conn *conn

	mu      sync.Mutex // guards following
	hasByte bool
	byteBuf [1]byte
	cond    *sync.Cond
	inRead  bool
	aborted bool  // set true before conn.rwc deadline is set to past
	remain  int64 // bytes remaining
}
```

connReader is the io.Reader wrapper used by *conn. It combines a selectively-activated io.LimitedReader (to bound request header read sizes) with support for selectively keeping an io.Reader.Read call blocked in a background goroutine to wait for activity and trigger a CloseNotifier channel. 

#### <a id="connReader.lock" href="#connReader.lock">func (cr *connReader) lock()</a>

```
searchKey: http.connReader.lock
tags: [private]
```

```Go
func (cr *connReader) lock()
```

#### <a id="connReader.unlock" href="#connReader.unlock">func (cr *connReader) unlock()</a>

```
searchKey: http.connReader.unlock
tags: [private]
```

```Go
func (cr *connReader) unlock()
```

#### <a id="connReader.startBackgroundRead" href="#connReader.startBackgroundRead">func (cr *connReader) startBackgroundRead()</a>

```
searchKey: http.connReader.startBackgroundRead
tags: [private]
```

```Go
func (cr *connReader) startBackgroundRead()
```

#### <a id="connReader.backgroundRead" href="#connReader.backgroundRead">func (cr *connReader) backgroundRead()</a>

```
searchKey: http.connReader.backgroundRead
tags: [private]
```

```Go
func (cr *connReader) backgroundRead()
```

#### <a id="connReader.abortPendingRead" href="#connReader.abortPendingRead">func (cr *connReader) abortPendingRead()</a>

```
searchKey: http.connReader.abortPendingRead
tags: [private]
```

```Go
func (cr *connReader) abortPendingRead()
```

#### <a id="connReader.setReadLimit" href="#connReader.setReadLimit">func (cr *connReader) setReadLimit(remain int64)</a>

```
searchKey: http.connReader.setReadLimit
tags: [private]
```

```Go
func (cr *connReader) setReadLimit(remain int64)
```

#### <a id="connReader.setInfiniteReadLimit" href="#connReader.setInfiniteReadLimit">func (cr *connReader) setInfiniteReadLimit()</a>

```
searchKey: http.connReader.setInfiniteReadLimit
tags: [private]
```

```Go
func (cr *connReader) setInfiniteReadLimit()
```

#### <a id="connReader.hitReadLimit" href="#connReader.hitReadLimit">func (cr *connReader) hitReadLimit() bool</a>

```
searchKey: http.connReader.hitReadLimit
tags: [private]
```

```Go
func (cr *connReader) hitReadLimit() bool
```

#### <a id="connReader.handleReadError" href="#connReader.handleReadError">func (cr *connReader) handleReadError(_ error)</a>

```
searchKey: http.connReader.handleReadError
tags: [private]
```

```Go
func (cr *connReader) handleReadError(_ error)
```

handleReadError is called whenever a Read from the client returns a non-nil error. 

The provided non-nil err is almost always io.EOF or a "use of closed network connection". In any case, the error is not particularly interesting, except perhaps for debugging during development. Any error means the connection is dead and we should down its context. 

It may be called from multiple goroutines. 

#### <a id="connReader.closeNotify" href="#connReader.closeNotify">func (cr *connReader) closeNotify()</a>

```
searchKey: http.connReader.closeNotify
tags: [private]
```

```Go
func (cr *connReader) closeNotify()
```

may be called from multiple goroutines. 

#### <a id="connReader.Read" href="#connReader.Read">func (cr *connReader) Read(p []byte) (n int, err error)</a>

```
searchKey: http.connReader.Read
tags: [private]
```

```Go
func (cr *connReader) Read(p []byte) (n int, err error)
```

### <a id="expectContinueReader" href="#expectContinueReader">type expectContinueReader struct</a>

```
searchKey: http.expectContinueReader
tags: [private]
```

```Go
type expectContinueReader struct {
	resp       *response
	readCloser io.ReadCloser
	closed     atomicBool
	sawEOF     atomicBool
}
```

wrapper around io.ReadCloser which on first read, sends an HTTP/1.1 100 Continue header 

#### <a id="expectContinueReader.Read" href="#expectContinueReader.Read">func (ecr *expectContinueReader) Read(p []byte) (n int, err error)</a>

```
searchKey: http.expectContinueReader.Read
tags: [private]
```

```Go
func (ecr *expectContinueReader) Read(p []byte) (n int, err error)
```

#### <a id="expectContinueReader.Close" href="#expectContinueReader.Close">func (ecr *expectContinueReader) Close() error</a>

```
searchKey: http.expectContinueReader.Close
tags: [private]
```

```Go
func (ecr *expectContinueReader) Close() error
```

### <a id="extraHeader" href="#extraHeader">type extraHeader struct</a>

```
searchKey: http.extraHeader
tags: [private]
```

```Go
type extraHeader struct {
	contentType      string
	connection       string
	transferEncoding string
	date             []byte // written if not nil
	contentLength    []byte // written if not nil
}
```

extraHeader is the set of headers sometimes added by chunkWriter.writeHeader. This type is used to avoid extra allocations from cloning and/or populating the response Header map and all its 1-element slices. 

#### <a id="extraHeader.Write" href="#extraHeader.Write">func (h extraHeader) Write(w *bufio.Writer)</a>

```
searchKey: http.extraHeader.Write
tags: [private]
```

```Go
func (h extraHeader) Write(w *bufio.Writer)
```

Write writes the headers described in h to w. 

This method has a value receiver, despite the somewhat large size of h, because it prevents an allocation. The escape analysis isn't smart enough to realize this function doesn't mutate h. 

### <a id="closeWriter" href="#closeWriter">type closeWriter interface</a>

```
searchKey: http.closeWriter
tags: [private]
```

```Go
type closeWriter interface {
	CloseWrite() error
}
```

### <a id="statusError" href="#statusError">type statusError struct</a>

```
searchKey: http.statusError
tags: [private]
```

```Go
type statusError struct {
	code int
	text string
}
```

statusError is an error used to respond to a request with an HTTP status. The text should be plain text without user info or other embedded errors. 

#### <a id="statusError.Error" href="#statusError.Error">func (e statusError) Error() string</a>

```
searchKey: http.statusError.Error
tags: [private]
```

```Go
func (e statusError) Error() string
```

### <a id="HandlerFunc" href="#HandlerFunc">type HandlerFunc func(std/net/http.ResponseWriter, *std/net/http.Request)</a>

```
searchKey: http.HandlerFunc
```

```Go
type HandlerFunc func(ResponseWriter, *Request)
```

The HandlerFunc type is an adapter to allow the use of ordinary functions as HTTP handlers. If f is a function with the appropriate signature, HandlerFunc(f) is a Handler that calls f. 

#### <a id="http2new400Handler" href="#http2new400Handler">func http2new400Handler(err error) HandlerFunc</a>

```
searchKey: http.http2new400Handler
tags: [private]
```

```Go
func http2new400Handler(err error) HandlerFunc
```

#### <a id="HandlerFunc.ServeHTTP" href="#HandlerFunc.ServeHTTP">func (f HandlerFunc) ServeHTTP(w ResponseWriter, r *Request)</a>

```
searchKey: http.HandlerFunc.ServeHTTP
```

```Go
func (f HandlerFunc) ServeHTTP(w ResponseWriter, r *Request)
```

ServeHTTP calls f(w, r). 

### <a id="redirectHandler" href="#redirectHandler">type redirectHandler struct</a>

```
searchKey: http.redirectHandler
tags: [private]
```

```Go
type redirectHandler struct {
	url  string
	code int
}
```

Redirect to a fixed URL 

#### <a id="redirectHandler.ServeHTTP" href="#redirectHandler.ServeHTTP">func (rh *redirectHandler) ServeHTTP(w ResponseWriter, r *Request)</a>

```
searchKey: http.redirectHandler.ServeHTTP
tags: [private]
```

```Go
func (rh *redirectHandler) ServeHTTP(w ResponseWriter, r *Request)
```

### <a id="ServeMux" href="#ServeMux">type ServeMux struct</a>

```
searchKey: http.ServeMux
```

```Go
type ServeMux struct {
	mu    sync.RWMutex
	m     map[string]muxEntry
	es    []muxEntry // slice of entries sorted from longest to shortest.
	hosts bool       // whether any patterns contain hostnames
}
```

ServeMux is an HTTP request multiplexer. It matches the URL of each incoming request against a list of registered patterns and calls the handler for the pattern that most closely matches the URL. 

Patterns name fixed, rooted paths, like "/favicon.ico", or rooted subtrees, like "/images/" (note the trailing slash). Longer patterns take precedence over shorter ones, so that if there are handlers registered for both "/images/" and "/images/thumbnails/", the latter handler will be called for paths beginning "/images/thumbnails/" and the former will receive requests for any other paths in the "/images/" subtree. 

Note that since a pattern ending in a slash names a rooted subtree, the pattern "/" matches all paths not matched by other registered patterns, not just the URL with Path == "/". 

If a subtree has been registered and a request is received naming the subtree root without its trailing slash, ServeMux redirects that request to the subtree root (adding the trailing slash). This behavior can be overridden with a separate registration for the path without the trailing slash. For example, registering "/images/" causes ServeMux to redirect a request for "/images" to "/images/", unless "/images" has been registered separately. 

Patterns may optionally begin with a host name, restricting matches to URLs on that host only. Host-specific patterns take precedence over general patterns, so that a handler might register for the two patterns "/codesearch" and "codesearch.google.com/" without also taking over requests for "[http://www.google.com/](http://www.google.com/)". 

ServeMux also takes care of sanitizing the URL request path and the Host header, stripping the port number and redirecting any request containing . or .. elements or repeated slashes to an equivalent, cleaner URL. 

#### <a id="NewServeMux" href="#NewServeMux">func NewServeMux() *ServeMux</a>

```
searchKey: http.NewServeMux
```

```Go
func NewServeMux() *ServeMux
```

NewServeMux allocates and returns a new ServeMux. 

#### <a id="ServeMux.match" href="#ServeMux.match">func (mux *ServeMux) match(path string) (h Handler, pattern string)</a>

```
searchKey: http.ServeMux.match
tags: [private]
```

```Go
func (mux *ServeMux) match(path string) (h Handler, pattern string)
```

Find a handler on a handler map given a path string. Most-specific (longest) pattern wins. 

#### <a id="ServeMux.redirectToPathSlash" href="#ServeMux.redirectToPathSlash">func (mux *ServeMux) redirectToPathSlash(host, path string, u *url.URL) (*url.URL, bool)</a>

```
searchKey: http.ServeMux.redirectToPathSlash
tags: [private]
```

```Go
func (mux *ServeMux) redirectToPathSlash(host, path string, u *url.URL) (*url.URL, bool)
```

redirectToPathSlash determines if the given path needs appending "/" to it. This occurs when a handler for path + "/" was already registered, but not for path itself. If the path needs appending to, it creates a new URL, setting the path to u.Path + "/" and returning true to indicate so. 

#### <a id="ServeMux.shouldRedirectRLocked" href="#ServeMux.shouldRedirectRLocked">func (mux *ServeMux) shouldRedirectRLocked(host, path string) bool</a>

```
searchKey: http.ServeMux.shouldRedirectRLocked
tags: [private]
```

```Go
func (mux *ServeMux) shouldRedirectRLocked(host, path string) bool
```

shouldRedirectRLocked reports whether the given path and host should be redirected to path+"/". This should happen if a handler is registered for path+"/" but not path -- see comments at ServeMux. 

#### <a id="ServeMux.Handler" href="#ServeMux.Handler">func (mux *ServeMux) Handler(r *Request) (h Handler, pattern string)</a>

```
searchKey: http.ServeMux.Handler
```

```Go
func (mux *ServeMux) Handler(r *Request) (h Handler, pattern string)
```

Handler returns the handler to use for the given request, consulting r.Method, r.Host, and r.URL.Path. It always returns a non-nil handler. If the path is not in its canonical form, the handler will be an internally-generated handler that redirects to the canonical path. If the host contains a port, it is ignored when matching handlers. 

The path and host are used unchanged for CONNECT requests. 

Handler also returns the registered pattern that matches the request or, in the case of internally-generated redirects, the pattern that will match after following the redirect. 

If there is no registered handler that applies to the request, Handler returns a `page not found' handler and an empty pattern. 

#### <a id="ServeMux.handler" href="#ServeMux.handler">func (mux *ServeMux) handler(host, path string) (h Handler, pattern string)</a>

```
searchKey: http.ServeMux.handler
tags: [private]
```

```Go
func (mux *ServeMux) handler(host, path string) (h Handler, pattern string)
```

handler is the main implementation of Handler. The path is known to be in canonical form, except for CONNECT methods. 

#### <a id="ServeMux.ServeHTTP" href="#ServeMux.ServeHTTP">func (mux *ServeMux) ServeHTTP(w ResponseWriter, r *Request)</a>

```
searchKey: http.ServeMux.ServeHTTP
```

```Go
func (mux *ServeMux) ServeHTTP(w ResponseWriter, r *Request)
```

ServeHTTP dispatches the request to the handler whose pattern most closely matches the request URL. 

#### <a id="ServeMux.Handle" href="#ServeMux.Handle">func (mux *ServeMux) Handle(pattern string, handler Handler)</a>

```
searchKey: http.ServeMux.Handle
```

```Go
func (mux *ServeMux) Handle(pattern string, handler Handler)
```

Handle registers the handler for the given pattern. If a handler already exists for pattern, Handle panics. 

#### <a id="ServeMux.HandleFunc" href="#ServeMux.HandleFunc">func (mux *ServeMux) HandleFunc(pattern string, handler func(ResponseWriter, *Request))</a>

```
searchKey: http.ServeMux.HandleFunc
```

```Go
func (mux *ServeMux) HandleFunc(pattern string, handler func(ResponseWriter, *Request))
```

HandleFunc registers the handler function for the given pattern. 

### <a id="muxEntry" href="#muxEntry">type muxEntry struct</a>

```
searchKey: http.muxEntry
tags: [private]
```

```Go
type muxEntry struct {
	h       Handler
	pattern string
}
```

### <a id="Server" href="#Server">type Server struct</a>

```
searchKey: http.Server
```

```Go
type Server struct {
	// Addr optionally specifies the TCP address for the server to listen on,
	// in the form "host:port". If empty, ":http" (port 80) is used.
	// The service names are defined in RFC 6335 and assigned by IANA.
	// See net.Dial for details of the address format.
	Addr string

	Handler Handler // handler to invoke, http.DefaultServeMux if nil

	// TLSConfig optionally provides a TLS configuration for use
	// by ServeTLS and ListenAndServeTLS. Note that this value is
	// cloned by ServeTLS and ListenAndServeTLS, so it's not
	// possible to modify the configuration with methods like
	// tls.Config.SetSessionTicketKeys. To use
	// SetSessionTicketKeys, use Server.Serve with a TLS Listener
	// instead.
	TLSConfig *tls.Config

	// ReadTimeout is the maximum duration for reading the entire
	// request, including the body. A zero or negative value means
	// there will be no timeout.
	//
	// Because ReadTimeout does not let Handlers make per-request
	// decisions on each request body's acceptable deadline or
	// upload rate, most users will prefer to use
	// ReadHeaderTimeout. It is valid to use them both.
	ReadTimeout time.Duration

	// ReadHeaderTimeout is the amount of time allowed to read
	// request headers. The connection's read deadline is reset
	// after reading the headers and the Handler can decide what
	// is considered too slow for the body. If ReadHeaderTimeout
	// is zero, the value of ReadTimeout is used. If both are
	// zero, there is no timeout.
	ReadHeaderTimeout time.Duration

	// WriteTimeout is the maximum duration before timing out
	// writes of the response. It is reset whenever a new
	// request's header is read. Like ReadTimeout, it does not
	// let Handlers make decisions on a per-request basis.
	// A zero or negative value means there will be no timeout.
	WriteTimeout time.Duration

	// IdleTimeout is the maximum amount of time to wait for the
	// next request when keep-alives are enabled. If IdleTimeout
	// is zero, the value of ReadTimeout is used. If both are
	// zero, there is no timeout.
	IdleTimeout time.Duration

	// MaxHeaderBytes controls the maximum number of bytes the
	// server will read parsing the request header's keys and
	// values, including the request line. It does not limit the
	// size of the request body.
	// If zero, DefaultMaxHeaderBytes is used.
	MaxHeaderBytes int

	// TLSNextProto optionally specifies a function to take over
	// ownership of the provided TLS connection when an ALPN
	// protocol upgrade has occurred. The map key is the protocol
	// name negotiated. The Handler argument should be used to
	// handle HTTP requests and will initialize the Request's TLS
	// and RemoteAddr if not already set. The connection is
	// automatically closed when the function returns.
	// If TLSNextProto is not nil, HTTP/2 support is not enabled
	// automatically.
	TLSNextProto map[string]func(*Server, *tls.Conn, Handler)

	// ConnState specifies an optional callback function that is
	// called when a client connection changes state. See the
	// ConnState type and associated constants for details.
	ConnState func(net.Conn, ConnState)

	// ErrorLog specifies an optional logger for errors accepting
	// connections, unexpected behavior from handlers, and
	// underlying FileSystem errors.
	// If nil, logging is done via the log package's standard logger.
	ErrorLog *log.Logger

	// BaseContext optionally specifies a function that returns
	// the base context for incoming requests on this server.
	// The provided Listener is the specific Listener that's
	// about to start accepting requests.
	// If BaseContext is nil, the default is context.Background().
	// If non-nil, it must return a non-nil context.
	BaseContext func(net.Listener) context.Context

	// ConnContext optionally specifies a function that modifies
	// the context used for a new connection c. The provided ctx
	// is derived from the base context and has a ServerContextKey
	// value.
	ConnContext func(ctx context.Context, c net.Conn) context.Context

	inShutdown atomicBool // true when server is in shutdown

	disableKeepAlives int32     // accessed atomically.
	nextProtoOnce     sync.Once // guards setupHTTP2_* init
	nextProtoErr      error     // result of http2.ConfigureServer if used

	mu         sync.Mutex
	listeners  map[*net.Listener]struct{}
	activeConn map[*conn]struct{}
	doneChan   chan struct{}
	onShutdown []func()
}
```

A Server defines parameters for running an HTTP server. The zero value for Server is a valid configuration. 

#### <a id="Server.newConn" href="#Server.newConn">func (srv *Server) newConn(rwc net.Conn) *conn</a>

```
searchKey: http.Server.newConn
tags: [private]
```

```Go
func (srv *Server) newConn(rwc net.Conn) *conn
```

Create new connection from rwc. 

#### <a id="Server.maxHeaderBytes" href="#Server.maxHeaderBytes">func (srv *Server) maxHeaderBytes() int</a>

```
searchKey: http.Server.maxHeaderBytes
tags: [private]
```

```Go
func (srv *Server) maxHeaderBytes() int
```

#### <a id="Server.initialReadLimitSize" href="#Server.initialReadLimitSize">func (srv *Server) initialReadLimitSize() int64</a>

```
searchKey: http.Server.initialReadLimitSize
tags: [private]
```

```Go
func (srv *Server) initialReadLimitSize() int64
```

#### <a id="Server.getDoneChan" href="#Server.getDoneChan">func (s *Server) getDoneChan() <-chan struct{}</a>

```
searchKey: http.Server.getDoneChan
tags: [private]
```

```Go
func (s *Server) getDoneChan() <-chan struct{}
```

#### <a id="Server.getDoneChanLocked" href="#Server.getDoneChanLocked">func (s *Server) getDoneChanLocked() chan struct{}</a>

```
searchKey: http.Server.getDoneChanLocked
tags: [private]
```

```Go
func (s *Server) getDoneChanLocked() chan struct{}
```

#### <a id="Server.closeDoneChanLocked" href="#Server.closeDoneChanLocked">func (s *Server) closeDoneChanLocked()</a>

```
searchKey: http.Server.closeDoneChanLocked
tags: [private]
```

```Go
func (s *Server) closeDoneChanLocked()
```

#### <a id="Server.Close" href="#Server.Close">func (srv *Server) Close() error</a>

```
searchKey: http.Server.Close
```

```Go
func (srv *Server) Close() error
```

Close immediately closes all active net.Listeners and any connections in state StateNew, StateActive, or StateIdle. For a graceful shutdown, use Shutdown. 

Close does not attempt to close (and does not even know about) any hijacked connections, such as WebSockets. 

Close returns any error returned from closing the Server's underlying Listener(s). 

#### <a id="Server.Shutdown" href="#Server.Shutdown">func (srv *Server) Shutdown(ctx context.Context) error</a>

```
searchKey: http.Server.Shutdown
```

```Go
func (srv *Server) Shutdown(ctx context.Context) error
```

Shutdown gracefully shuts down the server without interrupting any active connections. Shutdown works by first closing all open listeners, then closing all idle connections, and then waiting indefinitely for connections to return to idle and then shut down. If the provided context expires before the shutdown is complete, Shutdown returns the context's error, otherwise it returns any error returned from closing the Server's underlying Listener(s). 

When Shutdown is called, Serve, ListenAndServe, and ListenAndServeTLS immediately return ErrServerClosed. Make sure the program doesn't exit and waits instead for Shutdown to return. 

Shutdown does not attempt to close nor wait for hijacked connections such as WebSockets. The caller of Shutdown should separately notify such long-lived connections of shutdown and wait for them to close, if desired. See RegisterOnShutdown for a way to register shutdown notification functions. 

Once Shutdown has been called on a server, it may not be reused; future calls to methods such as Serve will return ErrServerClosed. 

#### <a id="Server.RegisterOnShutdown" href="#Server.RegisterOnShutdown">func (srv *Server) RegisterOnShutdown(f func())</a>

```
searchKey: http.Server.RegisterOnShutdown
```

```Go
func (srv *Server) RegisterOnShutdown(f func())
```

RegisterOnShutdown registers a function to call on Shutdown. This can be used to gracefully shutdown connections that have undergone ALPN protocol upgrade or that have been hijacked. This function should start protocol-specific graceful shutdown, but should not wait for shutdown to complete. 

#### <a id="Server.numListeners" href="#Server.numListeners">func (s *Server) numListeners() int</a>

```
searchKey: http.Server.numListeners
tags: [private]
```

```Go
func (s *Server) numListeners() int
```

#### <a id="Server.closeIdleConns" href="#Server.closeIdleConns">func (s *Server) closeIdleConns() bool</a>

```
searchKey: http.Server.closeIdleConns
tags: [private]
```

```Go
func (s *Server) closeIdleConns() bool
```

closeIdleConns closes all idle connections and reports whether the server is quiescent. 

#### <a id="Server.closeListenersLocked" href="#Server.closeListenersLocked">func (s *Server) closeListenersLocked() error</a>

```
searchKey: http.Server.closeListenersLocked
tags: [private]
```

```Go
func (s *Server) closeListenersLocked() error
```

#### <a id="Server.ListenAndServe" href="#Server.ListenAndServe">func (srv *Server) ListenAndServe() error</a>

```
searchKey: http.Server.ListenAndServe
```

```Go
func (srv *Server) ListenAndServe() error
```

ListenAndServe listens on the TCP network address srv.Addr and then calls Serve to handle requests on incoming connections. Accepted connections are configured to enable TCP keep-alives. 

If srv.Addr is blank, ":http" is used. 

ListenAndServe always returns a non-nil error. After Shutdown or Close, the returned error is ErrServerClosed. 

#### <a id="Server.shouldConfigureHTTP2ForServe" href="#Server.shouldConfigureHTTP2ForServe">func (srv *Server) shouldConfigureHTTP2ForServe() bool</a>

```
searchKey: http.Server.shouldConfigureHTTP2ForServe
tags: [private]
```

```Go
func (srv *Server) shouldConfigureHTTP2ForServe() bool
```

shouldDoServeHTTP2 reports whether Server.Serve should configure automatic HTTP/2. (which sets up the srv.TLSNextProto map) 

#### <a id="Server.Serve" href="#Server.Serve">func (srv *Server) Serve(l net.Listener) error</a>

```
searchKey: http.Server.Serve
```

```Go
func (srv *Server) Serve(l net.Listener) error
```

Serve accepts incoming connections on the Listener l, creating a new service goroutine for each. The service goroutines read requests and then call srv.Handler to reply to them. 

HTTP/2 support is only enabled if the Listener returns *tls.Conn connections and they were configured with "h2" in the TLS Config.NextProtos. 

Serve always returns a non-nil error and closes l. After Shutdown or Close, the returned error is ErrServerClosed. 

#### <a id="Server.ServeTLS" href="#Server.ServeTLS">func (srv *Server) ServeTLS(l net.Listener, certFile, keyFile string) error</a>

```
searchKey: http.Server.ServeTLS
```

```Go
func (srv *Server) ServeTLS(l net.Listener, certFile, keyFile string) error
```

ServeTLS accepts incoming connections on the Listener l, creating a new service goroutine for each. The service goroutines perform TLS setup and then read requests, calling srv.Handler to reply to them. 

Files containing a certificate and matching private key for the server must be provided if neither the Server's TLSConfig.Certificates nor TLSConfig.GetCertificate are populated. If the certificate is signed by a certificate authority, the certFile should be the concatenation of the server's certificate, any intermediates, and the CA's certificate. 

ServeTLS always returns a non-nil error. After Shutdown or Close, the returned error is ErrServerClosed. 

#### <a id="Server.trackListener" href="#Server.trackListener">func (s *Server) trackListener(ln *net.Listener, add bool) bool</a>

```
searchKey: http.Server.trackListener
tags: [private]
```

```Go
func (s *Server) trackListener(ln *net.Listener, add bool) bool
```

trackListener adds or removes a net.Listener to the set of tracked listeners. 

We store a pointer to interface in the map set, in case the net.Listener is not comparable. This is safe because we only call trackListener via Serve and can track+defer untrack the same pointer to local variable there. We never need to compare a Listener from another caller. 

It reports whether the server is still up (not Shutdown or Closed). 

#### <a id="Server.trackConn" href="#Server.trackConn">func (s *Server) trackConn(c *conn, add bool)</a>

```
searchKey: http.Server.trackConn
tags: [private]
```

```Go
func (s *Server) trackConn(c *conn, add bool)
```

#### <a id="Server.idleTimeout" href="#Server.idleTimeout">func (s *Server) idleTimeout() time.Duration</a>

```
searchKey: http.Server.idleTimeout
tags: [private]
```

```Go
func (s *Server) idleTimeout() time.Duration
```

#### <a id="Server.readHeaderTimeout" href="#Server.readHeaderTimeout">func (s *Server) readHeaderTimeout() time.Duration</a>

```
searchKey: http.Server.readHeaderTimeout
tags: [private]
```

```Go
func (s *Server) readHeaderTimeout() time.Duration
```

#### <a id="Server.doKeepAlives" href="#Server.doKeepAlives">func (s *Server) doKeepAlives() bool</a>

```
searchKey: http.Server.doKeepAlives
tags: [private]
```

```Go
func (s *Server) doKeepAlives() bool
```

#### <a id="Server.shuttingDown" href="#Server.shuttingDown">func (s *Server) shuttingDown() bool</a>

```
searchKey: http.Server.shuttingDown
tags: [private]
```

```Go
func (s *Server) shuttingDown() bool
```

#### <a id="Server.SetKeepAlivesEnabled" href="#Server.SetKeepAlivesEnabled">func (srv *Server) SetKeepAlivesEnabled(v bool)</a>

```
searchKey: http.Server.SetKeepAlivesEnabled
```

```Go
func (srv *Server) SetKeepAlivesEnabled(v bool)
```

SetKeepAlivesEnabled controls whether HTTP keep-alives are enabled. By default, keep-alives are always enabled. Only very resource-constrained environments or servers in the process of shutting down should disable them. 

#### <a id="Server.logf" href="#Server.logf">func (s *Server) logf(format string, args ...interface{})</a>

```
searchKey: http.Server.logf
tags: [private]
```

```Go
func (s *Server) logf(format string, args ...interface{})
```

#### <a id="Server.ListenAndServeTLS" href="#Server.ListenAndServeTLS">func (srv *Server) ListenAndServeTLS(certFile, keyFile string) error</a>

```
searchKey: http.Server.ListenAndServeTLS
```

```Go
func (srv *Server) ListenAndServeTLS(certFile, keyFile string) error
```

ListenAndServeTLS listens on the TCP network address srv.Addr and then calls ServeTLS to handle requests on incoming TLS connections. Accepted connections are configured to enable TCP keep-alives. 

Filenames containing a certificate and matching private key for the server must be provided if neither the Server's TLSConfig.Certificates nor TLSConfig.GetCertificate are populated. If the certificate is signed by a certificate authority, the certFile should be the concatenation of the server's certificate, any intermediates, and the CA's certificate. 

If srv.Addr is blank, ":https" is used. 

ListenAndServeTLS always returns a non-nil error. After Shutdown or Close, the returned error is ErrServerClosed. 

#### <a id="Server.setupHTTP2_ServeTLS" href="#Server.setupHTTP2_ServeTLS">func (srv *Server) setupHTTP2_ServeTLS() error</a>

```
searchKey: http.Server.setupHTTP2_ServeTLS
tags: [private]
```

```Go
func (srv *Server) setupHTTP2_ServeTLS() error
```

setupHTTP2_ServeTLS conditionally configures HTTP/2 on srv and reports whether there was an error setting it up. If it is not configured for policy reasons, nil is returned. 

#### <a id="Server.setupHTTP2_Serve" href="#Server.setupHTTP2_Serve">func (srv *Server) setupHTTP2_Serve() error</a>

```
searchKey: http.Server.setupHTTP2_Serve
tags: [private]
```

```Go
func (srv *Server) setupHTTP2_Serve() error
```

setupHTTP2_Serve is called from (*Server).Serve and conditionally configures HTTP/2 on srv using a more conservative policy than setupHTTP2_ServeTLS because Serve is called after tls.Listen, and may be called concurrently. See shouldConfigureHTTP2ForServe. 

The tests named TestTransportAutomaticHTTP2* and TestConcurrentServerServe in server_test.go demonstrate some of the supported use cases and motivations. 

#### <a id="Server.onceSetNextProtoDefaults_Serve" href="#Server.onceSetNextProtoDefaults_Serve">func (srv *Server) onceSetNextProtoDefaults_Serve()</a>

```
searchKey: http.Server.onceSetNextProtoDefaults_Serve
tags: [private]
```

```Go
func (srv *Server) onceSetNextProtoDefaults_Serve()
```

#### <a id="Server.onceSetNextProtoDefaults" href="#Server.onceSetNextProtoDefaults">func (srv *Server) onceSetNextProtoDefaults()</a>

```
searchKey: http.Server.onceSetNextProtoDefaults
tags: [private]
```

```Go
func (srv *Server) onceSetNextProtoDefaults()
```

onceSetNextProtoDefaults configures HTTP/2, if the user hasn't configured otherwise. (by setting srv.TLSNextProto non-nil) It must only be called via srv.nextProtoOnce (use srv.setupHTTP2_*). 

#### <a id="Server.ExportAllConnsIdle" href="#Server.ExportAllConnsIdle">func (s *Server) ExportAllConnsIdle() bool</a>

```
searchKey: http.Server.ExportAllConnsIdle
tags: [private]
```

```Go
func (s *Server) ExportAllConnsIdle() bool
```

#### <a id="Server.ExportAllConnsByState" href="#Server.ExportAllConnsByState">func (s *Server) ExportAllConnsByState() map[ConnState]int</a>

```
searchKey: http.Server.ExportAllConnsByState
tags: [private]
```

```Go
func (s *Server) ExportAllConnsByState() map[ConnState]int
```

### <a id="ConnState" href="#ConnState">type ConnState int</a>

```
searchKey: http.ConnState
```

```Go
type ConnState int
```

A ConnState represents the state of a client connection to a server. It's used by the optional Server.ConnState hook. 

#### <a id="ConnState.String" href="#ConnState.String">func (c ConnState) String() string</a>

```
searchKey: http.ConnState.String
```

```Go
func (c ConnState) String() string
```

### <a id="serverHandler" href="#serverHandler">type serverHandler struct</a>

```
searchKey: http.serverHandler
tags: [private]
```

```Go
type serverHandler struct {
	srv *Server
}
```

serverHandler delegates to either the server's Handler or DefaultServeMux and also handles "OPTIONS *" requests. 

#### <a id="serverHandler.ServeHTTP" href="#serverHandler.ServeHTTP">func (sh serverHandler) ServeHTTP(rw ResponseWriter, req *Request)</a>

```
searchKey: http.serverHandler.ServeHTTP
tags: [private]
```

```Go
func (sh serverHandler) ServeHTTP(rw ResponseWriter, req *Request)
```

### <a id="timeoutHandler" href="#timeoutHandler">type timeoutHandler struct</a>

```
searchKey: http.timeoutHandler
tags: [private]
```

```Go
type timeoutHandler struct {
	handler Handler
	body    string
	dt      time.Duration

	// When set, no context will be created and this context will
	// be used instead.
	testContext context.Context
}
```

#### <a id="timeoutHandler.errorBody" href="#timeoutHandler.errorBody">func (h *timeoutHandler) errorBody() string</a>

```
searchKey: http.timeoutHandler.errorBody
tags: [private]
```

```Go
func (h *timeoutHandler) errorBody() string
```

#### <a id="timeoutHandler.ServeHTTP" href="#timeoutHandler.ServeHTTP">func (h *timeoutHandler) ServeHTTP(w ResponseWriter, r *Request)</a>

```
searchKey: http.timeoutHandler.ServeHTTP
tags: [private]
```

```Go
func (h *timeoutHandler) ServeHTTP(w ResponseWriter, r *Request)
```

### <a id="timeoutWriter" href="#timeoutWriter">type timeoutWriter struct</a>

```
searchKey: http.timeoutWriter
tags: [private]
```

```Go
type timeoutWriter struct {
	w    ResponseWriter
	h    Header
	wbuf bytes.Buffer
	req  *Request

	mu          sync.Mutex
	timedOut    bool
	wroteHeader bool
	code        int
}
```

#### <a id="timeoutWriter.Push" href="#timeoutWriter.Push">func (tw *timeoutWriter) Push(target string, opts *PushOptions) error</a>

```
searchKey: http.timeoutWriter.Push
tags: [private]
```

```Go
func (tw *timeoutWriter) Push(target string, opts *PushOptions) error
```

Push implements the Pusher interface. 

#### <a id="timeoutWriter.Header" href="#timeoutWriter.Header">func (tw *timeoutWriter) Header() Header</a>

```
searchKey: http.timeoutWriter.Header
tags: [private]
```

```Go
func (tw *timeoutWriter) Header() Header
```

#### <a id="timeoutWriter.Write" href="#timeoutWriter.Write">func (tw *timeoutWriter) Write(p []byte) (int, error)</a>

```
searchKey: http.timeoutWriter.Write
tags: [private]
```

```Go
func (tw *timeoutWriter) Write(p []byte) (int, error)
```

#### <a id="timeoutWriter.writeHeaderLocked" href="#timeoutWriter.writeHeaderLocked">func (tw *timeoutWriter) writeHeaderLocked(code int)</a>

```
searchKey: http.timeoutWriter.writeHeaderLocked
tags: [private]
```

```Go
func (tw *timeoutWriter) writeHeaderLocked(code int)
```

#### <a id="timeoutWriter.WriteHeader" href="#timeoutWriter.WriteHeader">func (tw *timeoutWriter) WriteHeader(code int)</a>

```
searchKey: http.timeoutWriter.WriteHeader
tags: [private]
```

```Go
func (tw *timeoutWriter) WriteHeader(code int)
```

### <a id="onceCloseListener" href="#onceCloseListener">type onceCloseListener struct</a>

```
searchKey: http.onceCloseListener
tags: [private]
```

```Go
type onceCloseListener struct {
	net.Listener
	once     sync.Once
	closeErr error
}
```

onceCloseListener wraps a net.Listener, protecting it from multiple Close calls. 

#### <a id="onceCloseListener.Close" href="#onceCloseListener.Close">func (oc *onceCloseListener) Close() error</a>

```
searchKey: http.onceCloseListener.Close
tags: [private]
```

```Go
func (oc *onceCloseListener) Close() error
```

#### <a id="onceCloseListener.close" href="#onceCloseListener.close">func (oc *onceCloseListener) close()</a>

```
searchKey: http.onceCloseListener.close
tags: [private]
```

```Go
func (oc *onceCloseListener) close()
```

### <a id="globalOptionsHandler" href="#globalOptionsHandler">type globalOptionsHandler struct{}</a>

```
searchKey: http.globalOptionsHandler
tags: [private]
```

```Go
type globalOptionsHandler struct{}
```

globalOptionsHandler responds to "OPTIONS *" requests. 

#### <a id="globalOptionsHandler.ServeHTTP" href="#globalOptionsHandler.ServeHTTP">func (globalOptionsHandler) ServeHTTP(w ResponseWriter, r *Request)</a>

```
searchKey: http.globalOptionsHandler.ServeHTTP
tags: [private]
```

```Go
func (globalOptionsHandler) ServeHTTP(w ResponseWriter, r *Request)
```

### <a id="initALPNRequest" href="#initALPNRequest">type initALPNRequest struct</a>

```
searchKey: http.initALPNRequest
tags: [private]
```

```Go
type initALPNRequest struct {
	ctx context.Context
	c   *tls.Conn
	h   serverHandler
}
```

initALPNRequest is an HTTP handler that initializes certain uninitialized fields in its *Request. Such partially-initialized Requests come from ALPN protocol handlers. 

#### <a id="initALPNRequest.BaseContext" href="#initALPNRequest.BaseContext">func (h initALPNRequest) BaseContext() context.Context</a>

```
searchKey: http.initALPNRequest.BaseContext
tags: [private]
```

```Go
func (h initALPNRequest) BaseContext() context.Context
```

BaseContext is an exported but unadvertised http.Handler method recognized by x/net/http2 to pass down a context; the TLSNextProto API predates context support so we shoehorn through the only interface we have available. 

#### <a id="initALPNRequest.ServeHTTP" href="#initALPNRequest.ServeHTTP">func (h initALPNRequest) ServeHTTP(rw ResponseWriter, req *Request)</a>

```
searchKey: http.initALPNRequest.ServeHTTP
tags: [private]
```

```Go
func (h initALPNRequest) ServeHTTP(rw ResponseWriter, req *Request)
```

### <a id="loggingConn" href="#loggingConn">type loggingConn struct</a>

```
searchKey: http.loggingConn
tags: [private]
```

```Go
type loggingConn struct {
	name string
	net.Conn
}
```

loggingConn is used for debugging. 

#### <a id="loggingConn.Write" href="#loggingConn.Write">func (c *loggingConn) Write(p []byte) (n int, err error)</a>

```
searchKey: http.loggingConn.Write
tags: [private]
```

```Go
func (c *loggingConn) Write(p []byte) (n int, err error)
```

#### <a id="loggingConn.Read" href="#loggingConn.Read">func (c *loggingConn) Read(p []byte) (n int, err error)</a>

```
searchKey: http.loggingConn.Read
tags: [private]
```

```Go
func (c *loggingConn) Read(p []byte) (n int, err error)
```

#### <a id="loggingConn.Close" href="#loggingConn.Close">func (c *loggingConn) Close() (err error)</a>

```
searchKey: http.loggingConn.Close
tags: [private]
```

```Go
func (c *loggingConn) Close() (err error)
```

### <a id="checkConnErrorWriter" href="#checkConnErrorWriter">type checkConnErrorWriter struct</a>

```
searchKey: http.checkConnErrorWriter
tags: [private]
```

```Go
type checkConnErrorWriter struct {
	c *conn
}
```

checkConnErrorWriter writes to c.rwc and records any write errors to c.werr. It only contains one field (and a pointer field at that), so it fits in an interface value without an extra allocation. 

#### <a id="checkConnErrorWriter.Write" href="#checkConnErrorWriter.Write">func (w checkConnErrorWriter) Write(p []byte) (n int, err error)</a>

```
searchKey: http.checkConnErrorWriter.Write
tags: [private]
```

```Go
func (w checkConnErrorWriter) Write(p []byte) (n int, err error)
```

### <a id="sniffSig" href="#sniffSig">type sniffSig interface</a>

```
searchKey: http.sniffSig
tags: [private]
```

```Go
type sniffSig interface {
	// match returns the MIME type of the data, or "" if unknown.
	match(data []byte, firstNonWS int) string
}
```

### <a id="exactSig" href="#exactSig">type exactSig struct</a>

```
searchKey: http.exactSig
tags: [private]
```

```Go
type exactSig struct {
	sig []byte
	ct  string
}
```

#### <a id="exactSig.match" href="#exactSig.match">func (e *exactSig) match(data []byte, firstNonWS int) string</a>

```
searchKey: http.exactSig.match
tags: [private]
```

```Go
func (e *exactSig) match(data []byte, firstNonWS int) string
```

### <a id="maskedSig" href="#maskedSig">type maskedSig struct</a>

```
searchKey: http.maskedSig
tags: [private]
```

```Go
type maskedSig struct {
	mask, pat []byte
	skipWS    bool
	ct        string
}
```

#### <a id="maskedSig.match" href="#maskedSig.match">func (m *maskedSig) match(data []byte, firstNonWS int) string</a>

```
searchKey: http.maskedSig.match
tags: [private]
```

```Go
func (m *maskedSig) match(data []byte, firstNonWS int) string
```

### <a id="htmlSig" href="#htmlSig">type htmlSig []byte</a>

```
searchKey: http.htmlSig
tags: [private]
```

```Go
type htmlSig []byte
```

#### <a id="htmlSig.match" href="#htmlSig.match">func (h htmlSig) match(data []byte, firstNonWS int) string</a>

```
searchKey: http.htmlSig.match
tags: [private]
```

```Go
func (h htmlSig) match(data []byte, firstNonWS int) string
```

### <a id="mp4Sig" href="#mp4Sig">type mp4Sig struct{}</a>

```
searchKey: http.mp4Sig
tags: [private]
```

```Go
type mp4Sig struct{}
```

#### <a id="mp4Sig.match" href="#mp4Sig.match">func (mp4Sig) match(data []byte, firstNonWS int) string</a>

```
searchKey: http.mp4Sig.match
tags: [private]
```

```Go
func (mp4Sig) match(data []byte, firstNonWS int) string
```

### <a id="textSig" href="#textSig">type textSig struct{}</a>

```
searchKey: http.textSig
tags: [private]
```

```Go
type textSig struct{}
```

#### <a id="textSig.match" href="#textSig.match">func (textSig) match(data []byte, firstNonWS int) string</a>

```
searchKey: http.textSig.match
tags: [private]
```

```Go
func (textSig) match(data []byte, firstNonWS int) string
```

### <a id="socksCommand" href="#socksCommand">type socksCommand int</a>

```
searchKey: http.socksCommand
tags: [private]
```

```Go
type socksCommand int
```

A Command represents a SOCKS command. 

#### <a id="socksCommand.String" href="#socksCommand.String">func (cmd socksCommand) String() string</a>

```
searchKey: http.socksCommand.String
tags: [private]
```

```Go
func (cmd socksCommand) String() string
```

### <a id="socksAuthMethod" href="#socksAuthMethod">type socksAuthMethod int</a>

```
searchKey: http.socksAuthMethod
tags: [private]
```

```Go
type socksAuthMethod int
```

An AuthMethod represents a SOCKS authentication method. 

### <a id="socksReply" href="#socksReply">type socksReply int</a>

```
searchKey: http.socksReply
tags: [private]
```

```Go
type socksReply int
```

A Reply represents a SOCKS command reply code. 

#### <a id="socksReply.String" href="#socksReply.String">func (code socksReply) String() string</a>

```
searchKey: http.socksReply.String
tags: [private]
```

```Go
func (code socksReply) String() string
```

### <a id="socksAddr" href="#socksAddr">type socksAddr struct</a>

```
searchKey: http.socksAddr
tags: [private]
```

```Go
type socksAddr struct {
	Name string // fully-qualified domain name
	IP   net.IP
	Port int
}
```

An Addr represents a SOCKS-specific address. Either Name or IP is used exclusively. 

#### <a id="socksAddr.Network" href="#socksAddr.Network">func (a *socksAddr) Network() string</a>

```
searchKey: http.socksAddr.Network
tags: [private]
```

```Go
func (a *socksAddr) Network() string
```

#### <a id="socksAddr.String" href="#socksAddr.String">func (a *socksAddr) String() string</a>

```
searchKey: http.socksAddr.String
tags: [private]
```

```Go
func (a *socksAddr) String() string
```

### <a id="socksConn" href="#socksConn">type socksConn struct</a>

```
searchKey: http.socksConn
tags: [private]
```

```Go
type socksConn struct {
	net.Conn

	boundAddr net.Addr
}
```

A Conn represents a forward proxy connection. 

#### <a id="socksConn.BoundAddr" href="#socksConn.BoundAddr">func (c *socksConn) BoundAddr() net.Addr</a>

```
searchKey: http.socksConn.BoundAddr
tags: [private]
```

```Go
func (c *socksConn) BoundAddr() net.Addr
```

BoundAddr returns the address assigned by the proxy server for connecting to the command target address from the proxy server. 

### <a id="socksDialer" href="#socksDialer">type socksDialer struct</a>

```
searchKey: http.socksDialer
tags: [private]
```

```Go
type socksDialer struct {
	cmd          socksCommand // either CmdConnect or cmdBind
	proxyNetwork string       // network between a proxy server and a client
	proxyAddress string       // proxy server address

	// ProxyDial specifies the optional dial function for
	// establishing the transport connection.
	ProxyDial func(context.Context, string, string) (net.Conn, error)

	// AuthMethods specifies the list of request authentication
	// methods.
	// If empty, SOCKS client requests only AuthMethodNotRequired.
	AuthMethods []socksAuthMethod

	// Authenticate specifies the optional authentication
	// function. It must be non-nil when AuthMethods is not empty.
	// It must return an error when the authentication is failed.
	Authenticate func(context.Context, io.ReadWriter, socksAuthMethod) error
}
```

A Dialer holds SOCKS-specific options. 

#### <a id="socksNewDialer" href="#socksNewDialer">func socksNewDialer(network, address string) *socksDialer</a>

```
searchKey: http.socksNewDialer
tags: [private]
```

```Go
func socksNewDialer(network, address string) *socksDialer
```

NewDialer returns a new Dialer that dials through the provided proxy server's network and address. 

#### <a id="socksDialer.connect" href="#socksDialer.connect">func (d *socksDialer) connect(ctx context.Context, c net.Conn, address string) (_ net.Addr, ctxErr error)</a>

```
searchKey: http.socksDialer.connect
tags: [private]
```

```Go
func (d *socksDialer) connect(ctx context.Context, c net.Conn, address string) (_ net.Addr, ctxErr error)
```

#### <a id="socksDialer.DialContext" href="#socksDialer.DialContext">func (d *socksDialer) DialContext(ctx context.Context, network, address string) (net.Conn, error)</a>

```
searchKey: http.socksDialer.DialContext
tags: [private]
```

```Go
func (d *socksDialer) DialContext(ctx context.Context, network, address string) (net.Conn, error)
```

DialContext connects to the provided address on the provided network. 

The returned error value may be a net.OpError. When the Op field of net.OpError contains "socks", the Source field contains a proxy server address and the Addr field contains a command target address. 

See func Dial of the net package of standard library for a description of the network and address parameters. 

#### <a id="socksDialer.DialWithConn" href="#socksDialer.DialWithConn">func (d *socksDialer) DialWithConn(ctx context.Context, c net.Conn, network, address string) (net.Addr, error)</a>

```
searchKey: http.socksDialer.DialWithConn
tags: [private]
```

```Go
func (d *socksDialer) DialWithConn(ctx context.Context, c net.Conn, network, address string) (net.Addr, error)
```

DialWithConn initiates a connection from SOCKS server to the target network and address using the connection c that is already connected to the SOCKS server. 

It returns the connection's local address assigned by the SOCKS server. 

#### <a id="socksDialer.Dial" href="#socksDialer.Dial">func (d *socksDialer) Dial(network, address string) (net.Conn, error)</a>

```
searchKey: http.socksDialer.Dial
tags: [private deprecated]
```

```Go
func (d *socksDialer) Dial(network, address string) (net.Conn, error)
```

Dial connects to the provided address on the provided network. 

Unlike DialContext, it returns a raw transport connection instead of a forward proxy connection. 

Deprecated: Use DialContext or DialWithConn instead. 

#### <a id="socksDialer.validateTarget" href="#socksDialer.validateTarget">func (d *socksDialer) validateTarget(network, address string) error</a>

```
searchKey: http.socksDialer.validateTarget
tags: [private]
```

```Go
func (d *socksDialer) validateTarget(network, address string) error
```

#### <a id="socksDialer.pathAddrs" href="#socksDialer.pathAddrs">func (d *socksDialer) pathAddrs(address string) (proxy, dst net.Addr, err error)</a>

```
searchKey: http.socksDialer.pathAddrs
tags: [private]
```

```Go
func (d *socksDialer) pathAddrs(address string) (proxy, dst net.Addr, err error)
```

### <a id="socksUsernamePassword" href="#socksUsernamePassword">type socksUsernamePassword struct</a>

```
searchKey: http.socksUsernamePassword
tags: [private]
```

```Go
type socksUsernamePassword struct {
	Username string
	Password string
}
```

UsernamePassword are the credentials for the username/password authentication method. 

#### <a id="socksUsernamePassword.Authenticate" href="#socksUsernamePassword.Authenticate">func (up *socksUsernamePassword) Authenticate(ctx context.Context, rw io.ReadWriter, auth socksAuthMethod) error</a>

```
searchKey: http.socksUsernamePassword.Authenticate
tags: [private]
```

```Go
func (up *socksUsernamePassword) Authenticate(ctx context.Context, rw io.ReadWriter, auth socksAuthMethod) error
```

Authenticate authenticates a pair of username and password with the proxy server. 

### <a id="errorReader" href="#errorReader">type errorReader struct</a>

```
searchKey: http.errorReader
tags: [private]
```

```Go
type errorReader struct {
	err error
}
```

#### <a id="errorReader.Read" href="#errorReader.Read">func (r errorReader) Read(p []byte) (n int, err error)</a>

```
searchKey: http.errorReader.Read
tags: [private]
```

```Go
func (r errorReader) Read(p []byte) (n int, err error)
```

### <a id="byteReader" href="#byteReader">type byteReader struct</a>

```
searchKey: http.byteReader
tags: [private]
```

```Go
type byteReader struct {
	b    byte
	done bool
}
```

#### <a id="byteReader.Read" href="#byteReader.Read">func (br *byteReader) Read(p []byte) (n int, err error)</a>

```
searchKey: http.byteReader.Read
tags: [private]
```

```Go
func (br *byteReader) Read(p []byte) (n int, err error)
```

### <a id="transferWriter" href="#transferWriter">type transferWriter struct</a>

```
searchKey: http.transferWriter
tags: [private]
```

```Go
type transferWriter struct {
	Method           string
	Body             io.Reader
	BodyCloser       io.Closer
	ResponseToHEAD   bool
	ContentLength    int64 // -1 means unknown, 0 means exactly none
	Close            bool
	TransferEncoding []string
	Header           Header
	Trailer          Header
	IsResponse       bool
	bodyReadError    error // any non-EOF error from reading Body

	FlushHeaders bool            // flush headers to network before body
	ByteReadCh   chan readResult // non-nil if probeRequestBody called
}
```

transferWriter inspects the fields of a user-supplied Request or Response, sanitizes them without changing the user object and provides methods for writing the respective header, body and trailer in wire format. 

#### <a id="newTransferWriter" href="#newTransferWriter">func newTransferWriter(r interface{}) (t *transferWriter, err error)</a>

```
searchKey: http.newTransferWriter
tags: [private]
```

```Go
func newTransferWriter(r interface{}) (t *transferWriter, err error)
```

#### <a id="transferWriter.shouldSendChunkedRequestBody" href="#transferWriter.shouldSendChunkedRequestBody">func (t *transferWriter) shouldSendChunkedRequestBody() bool</a>

```
searchKey: http.transferWriter.shouldSendChunkedRequestBody
tags: [private]
```

```Go
func (t *transferWriter) shouldSendChunkedRequestBody() bool
```

shouldSendChunkedRequestBody reports whether we should try to send a chunked request body to the server. In particular, the case we really want to prevent is sending a GET or other typically-bodyless request to a server with a chunked body when the body has zero bytes, since GETs with bodies (while acceptable according to specs), even zero-byte chunked bodies, are approximately never seen in the wild and confuse most servers. See Issue 18257, as one example. 

The only reason we'd send such a request is if the user set the Body to a non-nil value (say, io.NopCloser(bytes.NewReader(nil))) and didn't set ContentLength, or NewRequest set it to -1 (unknown), so then we assume there's bytes to send. 

This code tries to read a byte from the Request.Body in such cases to see whether the body actually has content (super rare) or is actually just a non-nil content-less ReadCloser (the more common case). In that more common case, we act as if their Body were nil instead, and don't send a body. 

#### <a id="transferWriter.probeRequestBody" href="#transferWriter.probeRequestBody">func (t *transferWriter) probeRequestBody()</a>

```
searchKey: http.transferWriter.probeRequestBody
tags: [private]
```

```Go
func (t *transferWriter) probeRequestBody()
```

probeRequestBody reads a byte from t.Body to see whether it's empty (returns io.EOF right away). 

But because we've had problems with this blocking users in the past (issue 17480) when the body is a pipe (perhaps waiting on the response headers before the pipe is fed data), we need to be careful and bound how long we wait for it. This delay will only affect users if all the following are true: 

```
* the request body blocks
* the content length is not set (or set to -1)
* the method doesn't usually have a body (GET, HEAD, DELETE, ...)
* there is no transfer-encoding=chunked already set.

```
In other words, this delay will not normally affect anybody, and there are workarounds if it does. 

#### <a id="transferWriter.shouldSendContentLength" href="#transferWriter.shouldSendContentLength">func (t *transferWriter) shouldSendContentLength() bool</a>

```
searchKey: http.transferWriter.shouldSendContentLength
tags: [private]
```

```Go
func (t *transferWriter) shouldSendContentLength() bool
```

#### <a id="transferWriter.writeHeader" href="#transferWriter.writeHeader">func (t *transferWriter) writeHeader(w io.Writer, trace *httptrace.ClientTrace) error</a>

```
searchKey: http.transferWriter.writeHeader
tags: [private]
```

```Go
func (t *transferWriter) writeHeader(w io.Writer, trace *httptrace.ClientTrace) error
```

#### <a id="transferWriter.writeBody" href="#transferWriter.writeBody">func (t *transferWriter) writeBody(w io.Writer) (err error)</a>

```
searchKey: http.transferWriter.writeBody
tags: [private]
```

```Go
func (t *transferWriter) writeBody(w io.Writer) (err error)
```

always closes t.BodyCloser 

#### <a id="transferWriter.doBodyCopy" href="#transferWriter.doBodyCopy">func (t *transferWriter) doBodyCopy(dst io.Writer, src io.Reader) (n int64, err error)</a>

```
searchKey: http.transferWriter.doBodyCopy
tags: [private]
```

```Go
func (t *transferWriter) doBodyCopy(dst io.Writer, src io.Reader) (n int64, err error)
```

doBodyCopy wraps a copy operation, with any resulting error also being saved in bodyReadError. 

This function is only intended for use in writeBody. 

#### <a id="transferWriter.unwrapBody" href="#transferWriter.unwrapBody">func (t *transferWriter) unwrapBody() io.Reader</a>

```
searchKey: http.transferWriter.unwrapBody
tags: [private]
```

```Go
func (t *transferWriter) unwrapBody() io.Reader
```

unwrapBodyReader unwraps the body's inner reader if it's a nopCloser. This is to ensure that body writes sourced from local files (*os.File types) are properly optimized. 

This function is only intended for use in writeBody. 

### <a id="transferReader" href="#transferReader">type transferReader struct</a>

```
searchKey: http.transferReader
tags: [private]
```

```Go
type transferReader struct {
	// Input
	Header        Header
	StatusCode    int
	RequestMethod string
	ProtoMajor    int
	ProtoMinor    int
	// Output
	Body          io.ReadCloser
	ContentLength int64
	Chunked       bool
	Close         bool
	Trailer       Header
}
```

#### <a id="transferReader.protoAtLeast" href="#transferReader.protoAtLeast">func (t *transferReader) protoAtLeast(m, n int) bool</a>

```
searchKey: http.transferReader.protoAtLeast
tags: [private]
```

```Go
func (t *transferReader) protoAtLeast(m, n int) bool
```

#### <a id="transferReader.parseTransferEncoding" href="#transferReader.parseTransferEncoding">func (t *transferReader) parseTransferEncoding() error</a>

```
searchKey: http.transferReader.parseTransferEncoding
tags: [private]
```

```Go
func (t *transferReader) parseTransferEncoding() error
```

parseTransferEncoding sets t.Chunked based on the Transfer-Encoding header. 

### <a id="unsupportedTEError" href="#unsupportedTEError">type unsupportedTEError struct</a>

```
searchKey: http.unsupportedTEError
tags: [private]
```

```Go
type unsupportedTEError struct {
	err string
}
```

unsupportedTEError reports unsupported transfer-encodings. 

#### <a id="unsupportedTEError.Error" href="#unsupportedTEError.Error">func (uste *unsupportedTEError) Error() string</a>

```
searchKey: http.unsupportedTEError.Error
tags: [private]
```

```Go
func (uste *unsupportedTEError) Error() string
```

### <a id="body" href="#body">type body struct</a>

```
searchKey: http.body
tags: [private]
```

```Go
type body struct {
	src          io.Reader
	hdr          interface{}   // non-nil (Response or Request) value means read trailer
	r            *bufio.Reader // underlying wire-format reader for the trailer
	closing      bool          // is the connection to be closed after reading body?
	doEarlyClose bool          // whether Close should stop early

	mu         sync.Mutex // guards following, and calls to Read and Close
	sawEOF     bool
	closed     bool
	earlyClose bool   // Close called and we didn't read to the end of src
	onHitEOF   func() // if non-nil, func to call when EOF is Read
}
```

body turns a Reader into a ReadCloser. Close ensures that the body has been fully read and then reads the trailer if necessary. 

#### <a id="body.Read" href="#body.Read">func (b *body) Read(p []byte) (n int, err error)</a>

```
searchKey: http.body.Read
tags: [private]
```

```Go
func (b *body) Read(p []byte) (n int, err error)
```

#### <a id="body.readLocked" href="#body.readLocked">func (b *body) readLocked(p []byte) (n int, err error)</a>

```
searchKey: http.body.readLocked
tags: [private]
```

```Go
func (b *body) readLocked(p []byte) (n int, err error)
```

Must hold b.mu. 

#### <a id="body.readTrailer" href="#body.readTrailer">func (b *body) readTrailer() error</a>

```
searchKey: http.body.readTrailer
tags: [private]
```

```Go
func (b *body) readTrailer() error
```

#### <a id="body.unreadDataSizeLocked" href="#body.unreadDataSizeLocked">func (b *body) unreadDataSizeLocked() int64</a>

```
searchKey: http.body.unreadDataSizeLocked
tags: [private]
```

```Go
func (b *body) unreadDataSizeLocked() int64
```

unreadDataSizeLocked returns the number of bytes of unread input. It returns -1 if unknown. b.mu must be held. 

#### <a id="body.Close" href="#body.Close">func (b *body) Close() error</a>

```
searchKey: http.body.Close
tags: [private]
```

```Go
func (b *body) Close() error
```

#### <a id="body.didEarlyClose" href="#body.didEarlyClose">func (b *body) didEarlyClose() bool</a>

```
searchKey: http.body.didEarlyClose
tags: [private]
```

```Go
func (b *body) didEarlyClose() bool
```

#### <a id="body.bodyRemains" href="#body.bodyRemains">func (b *body) bodyRemains() bool</a>

```
searchKey: http.body.bodyRemains
tags: [private]
```

```Go
func (b *body) bodyRemains() bool
```

bodyRemains reports whether future Read calls might yield data. 

#### <a id="body.registerOnHitEOF" href="#body.registerOnHitEOF">func (b *body) registerOnHitEOF(fn func())</a>

```
searchKey: http.body.registerOnHitEOF
tags: [private]
```

```Go
func (b *body) registerOnHitEOF(fn func())
```

### <a id="bodyLocked" href="#bodyLocked">type bodyLocked struct</a>

```
searchKey: http.bodyLocked
tags: [private]
```

```Go
type bodyLocked struct {
	b *body
}
```

bodyLocked is a io.Reader reading from a *body when its mutex is already held. 

#### <a id="bodyLocked.Read" href="#bodyLocked.Read">func (bl bodyLocked) Read(p []byte) (n int, err error)</a>

```
searchKey: http.bodyLocked.Read
tags: [private]
```

```Go
func (bl bodyLocked) Read(p []byte) (n int, err error)
```

### <a id="finishAsyncByteRead" href="#finishAsyncByteRead">type finishAsyncByteRead struct</a>

```
searchKey: http.finishAsyncByteRead
tags: [private]
```

```Go
type finishAsyncByteRead struct {
	tw *transferWriter
}
```

finishAsyncByteRead finishes reading the 1-byte sniff from the ContentLength==0, Body!=nil case. 

#### <a id="finishAsyncByteRead.Read" href="#finishAsyncByteRead.Read">func (fr finishAsyncByteRead) Read(p []byte) (n int, err error)</a>

```
searchKey: http.finishAsyncByteRead.Read
tags: [private]
```

```Go
func (fr finishAsyncByteRead) Read(p []byte) (n int, err error)
```

### <a id="bufioFlushWriter" href="#bufioFlushWriter">type bufioFlushWriter struct</a>

```
searchKey: http.bufioFlushWriter
tags: [private]
```

```Go
type bufioFlushWriter struct{ w io.Writer }
```

bufioFlushWriter is an io.Writer wrapper that flushes all writes on its wrapped writer if it's a *bufio.Writer. 

#### <a id="bufioFlushWriter.Write" href="#bufioFlushWriter.Write">func (fw bufioFlushWriter) Write(p []byte) (n int, err error)</a>

```
searchKey: http.bufioFlushWriter.Write
tags: [private]
```

```Go
func (fw bufioFlushWriter) Write(p []byte) (n int, err error)
```

### <a id="Transport" href="#Transport">type Transport struct</a>

```
searchKey: http.Transport
```

```Go
type Transport struct {
	idleMu       sync.Mutex
	closeIdle    bool                                // user has requested to close all idle conns
	idleConn     map[connectMethodKey][]*persistConn // most recently used at end
	idleConnWait map[connectMethodKey]wantConnQueue  // waiting getConns
	idleLRU      connLRU

	reqMu       sync.Mutex
	reqCanceler map[cancelKey]func(error)

	altMu    sync.Mutex   // guards changing altProto only
	altProto atomic.Value // of nil or map[string]RoundTripper, key is URI scheme

	connsPerHostMu   sync.Mutex
	connsPerHost     map[connectMethodKey]int
	connsPerHostWait map[connectMethodKey]wantConnQueue // waiting getConns

	// Proxy specifies a function to return a proxy for a given
	// Request. If the function returns a non-nil error, the
	// request is aborted with the provided error.
	//
	// The proxy type is determined by the URL scheme. "http",
	// "https", and "socks5" are supported. If the scheme is empty,
	// "http" is assumed.
	//
	// If Proxy is nil or returns a nil *URL, no proxy is used.
	Proxy func(*Request) (*url.URL, error)

	// DialContext specifies the dial function for creating unencrypted TCP connections.
	// If DialContext is nil (and the deprecated Dial below is also nil),
	// then the transport dials using package net.
	//
	// DialContext runs concurrently with calls to RoundTrip.
	// A RoundTrip call that initiates a dial may end up using
	// a connection dialed previously when the earlier connection
	// becomes idle before the later DialContext completes.
	DialContext func(ctx context.Context, network, addr string) (net.Conn, error)

	// Dial specifies the dial function for creating unencrypted TCP connections.
	//
	// Dial runs concurrently with calls to RoundTrip.
	// A RoundTrip call that initiates a dial may end up using
	// a connection dialed previously when the earlier connection
	// becomes idle before the later Dial completes.
	//
	// Deprecated: Use DialContext instead, which allows the transport
	// to cancel dials as soon as they are no longer needed.
	// If both are set, DialContext takes priority.
	Dial func(network, addr string) (net.Conn, error)

	// DialTLSContext specifies an optional dial function for creating
	// TLS connections for non-proxied HTTPS requests.
	//
	// If DialTLSContext is nil (and the deprecated DialTLS below is also nil),
	// DialContext and TLSClientConfig are used.
	//
	// If DialTLSContext is set, the Dial and DialContext hooks are not used for HTTPS
	// requests and the TLSClientConfig and TLSHandshakeTimeout
	// are ignored. The returned net.Conn is assumed to already be
	// past the TLS handshake.
	DialTLSContext func(ctx context.Context, network, addr string) (net.Conn, error)

	// DialTLS specifies an optional dial function for creating
	// TLS connections for non-proxied HTTPS requests.
	//
	// Deprecated: Use DialTLSContext instead, which allows the transport
	// to cancel dials as soon as they are no longer needed.
	// If both are set, DialTLSContext takes priority.
	DialTLS func(network, addr string) (net.Conn, error)

	// TLSClientConfig specifies the TLS configuration to use with
	// tls.Client.
	// If nil, the default configuration is used.
	// If non-nil, HTTP/2 support may not be enabled by default.
	TLSClientConfig *tls.Config

	// TLSHandshakeTimeout specifies the maximum amount of time waiting to
	// wait for a TLS handshake. Zero means no timeout.
	TLSHandshakeTimeout time.Duration

	// DisableKeepAlives, if true, disables HTTP keep-alives and
	// will only use the connection to the server for a single
	// HTTP request.
	//
	// This is unrelated to the similarly named TCP keep-alives.
	DisableKeepAlives bool

	// DisableCompression, if true, prevents the Transport from
	// requesting compression with an "Accept-Encoding: gzip"
	// request header when the Request contains no existing
	// Accept-Encoding value. If the Transport requests gzip on
	// its own and gets a gzipped response, it's transparently
	// decoded in the Response.Body. However, if the user
	// explicitly requested gzip it is not automatically
	// uncompressed.
	DisableCompression bool

	// MaxIdleConns controls the maximum number of idle (keep-alive)
	// connections across all hosts. Zero means no limit.
	MaxIdleConns int

	// MaxIdleConnsPerHost, if non-zero, controls the maximum idle
	// (keep-alive) connections to keep per-host. If zero,
	// DefaultMaxIdleConnsPerHost is used.
	MaxIdleConnsPerHost int

	// MaxConnsPerHost optionally limits the total number of
	// connections per host, including connections in the dialing,
	// active, and idle states. On limit violation, dials will block.
	//
	// Zero means no limit.
	MaxConnsPerHost int

	// IdleConnTimeout is the maximum amount of time an idle
	// (keep-alive) connection will remain idle before closing
	// itself.
	// Zero means no limit.
	IdleConnTimeout time.Duration

	// ResponseHeaderTimeout, if non-zero, specifies the amount of
	// time to wait for a server's response headers after fully
	// writing the request (including its body, if any). This
	// time does not include the time to read the response body.
	ResponseHeaderTimeout time.Duration

	// ExpectContinueTimeout, if non-zero, specifies the amount of
	// time to wait for a server's first response headers after fully
	// writing the request headers if the request has an
	// "Expect: 100-continue" header. Zero means no timeout and
	// causes the body to be sent immediately, without
	// waiting for the server to approve.
	// This time does not include the time to send the request header.
	ExpectContinueTimeout time.Duration

	// TLSNextProto specifies how the Transport switches to an
	// alternate protocol (such as HTTP/2) after a TLS ALPN
	// protocol negotiation. If Transport dials an TLS connection
	// with a non-empty protocol name and TLSNextProto contains a
	// map entry for that key (such as "h2"), then the func is
	// called with the request's authority (such as "example.com"
	// or "example.com:1234") and the TLS connection. The function
	// must return a RoundTripper that then handles the request.
	// If TLSNextProto is not nil, HTTP/2 support is not enabled
	// automatically.
	TLSNextProto map[string]func(authority string, c *tls.Conn) RoundTripper

	// ProxyConnectHeader optionally specifies headers to send to
	// proxies during CONNECT requests.
	// To set the header dynamically, see GetProxyConnectHeader.
	ProxyConnectHeader Header

	// GetProxyConnectHeader optionally specifies a func to return
	// headers to send to proxyURL during a CONNECT request to the
	// ip:port target.
	// If it returns an error, the Transport's RoundTrip fails with
	// that error. It can return (nil, nil) to not add headers.
	// If GetProxyConnectHeader is non-nil, ProxyConnectHeader is
	// ignored.
	GetProxyConnectHeader func(ctx context.Context, proxyURL *url.URL, target string) (Header, error)

	// MaxResponseHeaderBytes specifies a limit on how many
	// response bytes are allowed in the server's response
	// header.
	//
	// Zero means to use a default limit.
	MaxResponseHeaderBytes int64

	// WriteBufferSize specifies the size of the write buffer used
	// when writing to the transport.
	// If zero, a default (currently 4KB) is used.
	WriteBufferSize int

	// ReadBufferSize specifies the size of the read buffer used
	// when reading from the transport.
	// If zero, a default (currently 4KB) is used.
	ReadBufferSize int

	// nextProtoOnce guards initialization of TLSNextProto and
	// h2transport (via onceSetNextProtoDefaults)
	nextProtoOnce      sync.Once
	h2transport        h2Transport // non-nil if http2 wired up
	tlsNextProtoWasNil bool        // whether TLSNextProto was nil when the Once fired

	// ForceAttemptHTTP2 controls whether HTTP/2 is enabled when a non-zero
	// Dial, DialTLS, or DialContext func or TLSClientConfig is provided.
	// By default, use of any those fields conservatively disables HTTP/2.
	// To use a custom dialer or TLS config and still attempt HTTP/2
	// upgrades, set this to true.
	ForceAttemptHTTP2 bool
}
```

Transport is an implementation of RoundTripper that supports HTTP, HTTPS, and HTTP proxies (for either HTTP or HTTPS with CONNECT). 

By default, Transport caches connections for future re-use. This may leave many open connections when accessing many hosts. This behavior can be managed using Transport's CloseIdleConnections method and the MaxIdleConnsPerHost and DisableKeepAlives fields. 

Transports should be reused instead of created as needed. Transports are safe for concurrent use by multiple goroutines. 

A Transport is a low-level primitive for making HTTP and HTTPS requests. For high-level functionality, such as cookies and redirects, see Client. 

Transport uses HTTP/1.1 for HTTP URLs and either HTTP/1.1 or HTTP/2 for HTTPS URLs, depending on whether the server supports HTTP/2, and how the Transport is configured. The DefaultTransport supports HTTP/2. To explicitly enable HTTP/2 on a transport, use golang.org/x/net/http2 and call ConfigureTransport. See the package docs for more about HTTP/2. 

Responses with status codes in the 1xx range are either handled automatically (100 expect-continue) or ignored. The one exception is HTTP status code 101 (Switching Protocols), which is considered a terminal status and returned by RoundTrip. To see the ignored 1xx responses, use the httptrace trace package's ClientTrace.Got1xxResponse. 

Transport only retries a request upon encountering a network error if the request is idempotent and either has no body or has its Request.GetBody defined. HTTP requests are considered idempotent if they have HTTP methods GET, HEAD, OPTIONS, or TRACE; or if their Header map contains an "Idempotency-Key" or "X-Idempotency-Key" entry. If the idempotency key value is a zero-length slice, the request is treated as idempotent but the header is not sent on the wire. 

#### <a id="Transport.RoundTrip" href="#Transport.RoundTrip">func (t *Transport) RoundTrip(req *Request) (*Response, error)</a>

```
searchKey: http.Transport.RoundTrip
```

```Go
func (t *Transport) RoundTrip(req *Request) (*Response, error)
```

RoundTrip implements the RoundTripper interface. 

For higher-level HTTP client support (such as handling of cookies and redirects), see Get, Post, and the Client type. 

Like the RoundTripper interface, the error types returned by RoundTrip are unspecified. 

#### <a id="Transport.writeBufferSize" href="#Transport.writeBufferSize">func (t *Transport) writeBufferSize() int</a>

```
searchKey: http.Transport.writeBufferSize
tags: [private]
```

```Go
func (t *Transport) writeBufferSize() int
```

#### <a id="Transport.readBufferSize" href="#Transport.readBufferSize">func (t *Transport) readBufferSize() int</a>

```
searchKey: http.Transport.readBufferSize
tags: [private]
```

```Go
func (t *Transport) readBufferSize() int
```

#### <a id="Transport.Clone" href="#Transport.Clone">func (t *Transport) Clone() *Transport</a>

```
searchKey: http.Transport.Clone
```

```Go
func (t *Transport) Clone() *Transport
```

Clone returns a deep copy of t's exported fields. 

#### <a id="Transport.hasCustomTLSDialer" href="#Transport.hasCustomTLSDialer">func (t *Transport) hasCustomTLSDialer() bool</a>

```
searchKey: http.Transport.hasCustomTLSDialer
tags: [private]
```

```Go
func (t *Transport) hasCustomTLSDialer() bool
```

#### <a id="Transport.onceSetNextProtoDefaults" href="#Transport.onceSetNextProtoDefaults">func (t *Transport) onceSetNextProtoDefaults()</a>

```
searchKey: http.Transport.onceSetNextProtoDefaults
tags: [private]
```

```Go
func (t *Transport) onceSetNextProtoDefaults()
```

onceSetNextProtoDefaults initializes TLSNextProto. It must be called via t.nextProtoOnce.Do. 

#### <a id="Transport.useRegisteredProtocol" href="#Transport.useRegisteredProtocol">func (t *Transport) useRegisteredProtocol(req *Request) bool</a>

```
searchKey: http.Transport.useRegisteredProtocol
tags: [private]
```

```Go
func (t *Transport) useRegisteredProtocol(req *Request) bool
```

useRegisteredProtocol reports whether an alternate protocol (as registered with Transport.RegisterProtocol) should be respected for this request. 

#### <a id="Transport.alternateRoundTripper" href="#Transport.alternateRoundTripper">func (t *Transport) alternateRoundTripper(req *Request) RoundTripper</a>

```
searchKey: http.Transport.alternateRoundTripper
tags: [private]
```

```Go
func (t *Transport) alternateRoundTripper(req *Request) RoundTripper
```

alternateRoundTripper returns the alternate RoundTripper to use for this request if the Request's URL scheme requires one, or nil for the normal case of using the Transport. 

#### <a id="Transport.roundTrip" href="#Transport.roundTrip">func (t *Transport) roundTrip(req *Request) (*Response, error)</a>

```
searchKey: http.Transport.roundTrip
tags: [private]
```

```Go
func (t *Transport) roundTrip(req *Request) (*Response, error)
```

roundTrip implements a RoundTripper over HTTP. 

#### <a id="Transport.RegisterProtocol" href="#Transport.RegisterProtocol">func (t *Transport) RegisterProtocol(scheme string, rt RoundTripper)</a>

```
searchKey: http.Transport.RegisterProtocol
```

```Go
func (t *Transport) RegisterProtocol(scheme string, rt RoundTripper)
```

RegisterProtocol registers a new protocol with scheme. The Transport will pass requests using the given scheme to rt. It is rt's responsibility to simulate HTTP request semantics. 

RegisterProtocol can be used by other packages to provide implementations of protocol schemes like "ftp" or "file". 

If rt.RoundTrip returns ErrSkipAltProtocol, the Transport will handle the RoundTrip itself for that one request, as if the protocol were not registered. 

#### <a id="Transport.CloseIdleConnections" href="#Transport.CloseIdleConnections">func (t *Transport) CloseIdleConnections()</a>

```
searchKey: http.Transport.CloseIdleConnections
```

```Go
func (t *Transport) CloseIdleConnections()
```

CloseIdleConnections closes any connections which were previously connected from previous requests but are now sitting idle in a "keep-alive" state. It does not interrupt any connections currently in use. 

#### <a id="Transport.CancelRequest" href="#Transport.CancelRequest">func (t *Transport) CancelRequest(req *Request)</a>

```
searchKey: http.Transport.CancelRequest
tags: [deprecated]
```

```Go
func (t *Transport) CancelRequest(req *Request)
```

CancelRequest cancels an in-flight request by closing its connection. CancelRequest should only be called after RoundTrip has returned. 

Deprecated: Use Request.WithContext to create a request with a cancelable context instead. CancelRequest cannot cancel HTTP/2 requests. 

#### <a id="Transport.cancelRequest" href="#Transport.cancelRequest">func (t *Transport) cancelRequest(key cancelKey, err error) bool</a>

```
searchKey: http.Transport.cancelRequest
tags: [private]
```

```Go
func (t *Transport) cancelRequest(key cancelKey, err error) bool
```

Cancel an in-flight request, recording the error value. Returns whether the request was canceled. 

#### <a id="Transport.connectMethodForRequest" href="#Transport.connectMethodForRequest">func (t *Transport) connectMethodForRequest(treq *transportRequest) (cm connectMethod, err error)</a>

```
searchKey: http.Transport.connectMethodForRequest
tags: [private]
```

```Go
func (t *Transport) connectMethodForRequest(treq *transportRequest) (cm connectMethod, err error)
```

#### <a id="Transport.putOrCloseIdleConn" href="#Transport.putOrCloseIdleConn">func (t *Transport) putOrCloseIdleConn(pconn *persistConn)</a>

```
searchKey: http.Transport.putOrCloseIdleConn
tags: [private]
```

```Go
func (t *Transport) putOrCloseIdleConn(pconn *persistConn)
```

#### <a id="Transport.maxIdleConnsPerHost" href="#Transport.maxIdleConnsPerHost">func (t *Transport) maxIdleConnsPerHost() int</a>

```
searchKey: http.Transport.maxIdleConnsPerHost
tags: [private]
```

```Go
func (t *Transport) maxIdleConnsPerHost() int
```

#### <a id="Transport.tryPutIdleConn" href="#Transport.tryPutIdleConn">func (t *Transport) tryPutIdleConn(pconn *persistConn) error</a>

```
searchKey: http.Transport.tryPutIdleConn
tags: [private]
```

```Go
func (t *Transport) tryPutIdleConn(pconn *persistConn) error
```

tryPutIdleConn adds pconn to the list of idle persistent connections awaiting a new request. If pconn is no longer needed or not in a good state, tryPutIdleConn returns an error explaining why it wasn't registered. tryPutIdleConn does not close pconn. Use putOrCloseIdleConn instead for that. 

#### <a id="Transport.queueForIdleConn" href="#Transport.queueForIdleConn">func (t *Transport) queueForIdleConn(w *wantConn) (delivered bool)</a>

```
searchKey: http.Transport.queueForIdleConn
tags: [private]
```

```Go
func (t *Transport) queueForIdleConn(w *wantConn) (delivered bool)
```

queueForIdleConn queues w to receive the next idle connection for w.cm. As an optimization hint to the caller, queueForIdleConn reports whether it successfully delivered an already-idle connection. 

#### <a id="Transport.removeIdleConn" href="#Transport.removeIdleConn">func (t *Transport) removeIdleConn(pconn *persistConn) bool</a>

```
searchKey: http.Transport.removeIdleConn
tags: [private]
```

```Go
func (t *Transport) removeIdleConn(pconn *persistConn) bool
```

removeIdleConn marks pconn as dead. 

#### <a id="Transport.removeIdleConnLocked" href="#Transport.removeIdleConnLocked">func (t *Transport) removeIdleConnLocked(pconn *persistConn) bool</a>

```
searchKey: http.Transport.removeIdleConnLocked
tags: [private]
```

```Go
func (t *Transport) removeIdleConnLocked(pconn *persistConn) bool
```

t.idleMu must be held. 

#### <a id="Transport.setReqCanceler" href="#Transport.setReqCanceler">func (t *Transport) setReqCanceler(key cancelKey, fn func(error))</a>

```
searchKey: http.Transport.setReqCanceler
tags: [private]
```

```Go
func (t *Transport) setReqCanceler(key cancelKey, fn func(error))
```

#### <a id="Transport.replaceReqCanceler" href="#Transport.replaceReqCanceler">func (t *Transport) replaceReqCanceler(key cancelKey, fn func(error)) bool</a>

```
searchKey: http.Transport.replaceReqCanceler
tags: [private]
```

```Go
func (t *Transport) replaceReqCanceler(key cancelKey, fn func(error)) bool
```

replaceReqCanceler replaces an existing cancel function. If there is no cancel function for the request, we don't set the function and return false. Since CancelRequest will clear the canceler, we can use the return value to detect if the request was canceled since the last setReqCancel call. 

#### <a id="Transport.dial" href="#Transport.dial">func (t *Transport) dial(ctx context.Context, network, addr string) (net.Conn, error)</a>

```
searchKey: http.Transport.dial
tags: [private]
```

```Go
func (t *Transport) dial(ctx context.Context, network, addr string) (net.Conn, error)
```

#### <a id="Transport.customDialTLS" href="#Transport.customDialTLS">func (t *Transport) customDialTLS(ctx context.Context, network, addr string) (conn net.Conn, err error)</a>

```
searchKey: http.Transport.customDialTLS
tags: [private]
```

```Go
func (t *Transport) customDialTLS(ctx context.Context, network, addr string) (conn net.Conn, err error)
```

#### <a id="Transport.getConn" href="#Transport.getConn">func (t *Transport) getConn(treq *transportRequest, cm connectMethod) (pc *persistConn, err error)</a>

```
searchKey: http.Transport.getConn
tags: [private]
```

```Go
func (t *Transport) getConn(treq *transportRequest, cm connectMethod) (pc *persistConn, err error)
```

getConn dials and creates a new persistConn to the target as specified in the connectMethod. This includes doing a proxy CONNECT and/or setting up TLS.  If this doesn't return an error, the persistConn is ready to write requests to. 

#### <a id="Transport.queueForDial" href="#Transport.queueForDial">func (t *Transport) queueForDial(w *wantConn)</a>

```
searchKey: http.Transport.queueForDial
tags: [private]
```

```Go
func (t *Transport) queueForDial(w *wantConn)
```

queueForDial queues w to wait for permission to begin dialing. Once w receives permission to dial, it will do so in a separate goroutine. 

#### <a id="Transport.dialConnFor" href="#Transport.dialConnFor">func (t *Transport) dialConnFor(w *wantConn)</a>

```
searchKey: http.Transport.dialConnFor
tags: [private]
```

```Go
func (t *Transport) dialConnFor(w *wantConn)
```

dialConnFor dials on behalf of w and delivers the result to w. dialConnFor has received permission to dial w.cm and is counted in t.connCount[w.cm.key()]. If the dial is canceled or unsuccessful, dialConnFor decrements t.connCount[w.cm.key()]. 

#### <a id="Transport.decConnsPerHost" href="#Transport.decConnsPerHost">func (t *Transport) decConnsPerHost(key connectMethodKey)</a>

```
searchKey: http.Transport.decConnsPerHost
tags: [private]
```

```Go
func (t *Transport) decConnsPerHost(key connectMethodKey)
```

decConnsPerHost decrements the per-host connection count for key, which may in turn give a different waiting goroutine permission to dial. 

#### <a id="Transport.dialConn" href="#Transport.dialConn">func (t *Transport) dialConn(ctx context.Context, cm connectMethod) (pconn *persistConn, err error)</a>

```
searchKey: http.Transport.dialConn
tags: [private]
```

```Go
func (t *Transport) dialConn(ctx context.Context, cm connectMethod) (pconn *persistConn, err error)
```

#### <a id="Transport.NumPendingRequestsForTesting" href="#Transport.NumPendingRequestsForTesting">func (t *Transport) NumPendingRequestsForTesting() int</a>

```
searchKey: http.Transport.NumPendingRequestsForTesting
tags: [private]
```

```Go
func (t *Transport) NumPendingRequestsForTesting() int
```

#### <a id="Transport.IdleConnKeysForTesting" href="#Transport.IdleConnKeysForTesting">func (t *Transport) IdleConnKeysForTesting() (keys []string)</a>

```
searchKey: http.Transport.IdleConnKeysForTesting
tags: [private]
```

```Go
func (t *Transport) IdleConnKeysForTesting() (keys []string)
```

#### <a id="Transport.IdleConnKeyCountForTesting" href="#Transport.IdleConnKeyCountForTesting">func (t *Transport) IdleConnKeyCountForTesting() int</a>

```
searchKey: http.Transport.IdleConnKeyCountForTesting
tags: [private]
```

```Go
func (t *Transport) IdleConnKeyCountForTesting() int
```

#### <a id="Transport.IdleConnStrsForTesting" href="#Transport.IdleConnStrsForTesting">func (t *Transport) IdleConnStrsForTesting() []string</a>

```
searchKey: http.Transport.IdleConnStrsForTesting
tags: [private]
```

```Go
func (t *Transport) IdleConnStrsForTesting() []string
```

#### <a id="Transport.IdleConnStrsForTesting_h2" href="#Transport.IdleConnStrsForTesting_h2">func (t *Transport) IdleConnStrsForTesting_h2() []string</a>

```
searchKey: http.Transport.IdleConnStrsForTesting_h2
tags: [private]
```

```Go
func (t *Transport) IdleConnStrsForTesting_h2() []string
```

#### <a id="Transport.IdleConnCountForTesting" href="#Transport.IdleConnCountForTesting">func (t *Transport) IdleConnCountForTesting(scheme, addr string) int</a>

```
searchKey: http.Transport.IdleConnCountForTesting
tags: [private]
```

```Go
func (t *Transport) IdleConnCountForTesting(scheme, addr string) int
```

#### <a id="Transport.IdleConnWaitMapSizeForTesting" href="#Transport.IdleConnWaitMapSizeForTesting">func (t *Transport) IdleConnWaitMapSizeForTesting() int</a>

```
searchKey: http.Transport.IdleConnWaitMapSizeForTesting
tags: [private]
```

```Go
func (t *Transport) IdleConnWaitMapSizeForTesting() int
```

#### <a id="Transport.IsIdleForTesting" href="#Transport.IsIdleForTesting">func (t *Transport) IsIdleForTesting() bool</a>

```
searchKey: http.Transport.IsIdleForTesting
tags: [private]
```

```Go
func (t *Transport) IsIdleForTesting() bool
```

#### <a id="Transport.QueueForIdleConnForTesting" href="#Transport.QueueForIdleConnForTesting">func (t *Transport) QueueForIdleConnForTesting()</a>

```
searchKey: http.Transport.QueueForIdleConnForTesting
tags: [private]
```

```Go
func (t *Transport) QueueForIdleConnForTesting()
```

#### <a id="Transport.PutIdleTestConn" href="#Transport.PutIdleTestConn">func (t *Transport) PutIdleTestConn(scheme, addr string) bool</a>

```
searchKey: http.Transport.PutIdleTestConn
tags: [private]
```

```Go
func (t *Transport) PutIdleTestConn(scheme, addr string) bool
```

PutIdleTestConn reports whether it was able to insert a fresh persistConn for scheme, addr into the idle connection pool. 

#### <a id="Transport.PutIdleTestConnH2" href="#Transport.PutIdleTestConnH2">func (t *Transport) PutIdleTestConnH2(scheme, addr string, alt RoundTripper) bool</a>

```
searchKey: http.Transport.PutIdleTestConnH2
tags: [private]
```

```Go
func (t *Transport) PutIdleTestConnH2(scheme, addr string, alt RoundTripper) bool
```

PutIdleTestConnH2 reports whether it was able to insert a fresh HTTP/2 persistConn for scheme, addr into the idle connection pool. 

### <a id="cancelKey" href="#cancelKey">type cancelKey struct</a>

```
searchKey: http.cancelKey
tags: [private]
```

```Go
type cancelKey struct {
	req *Request
}
```

A cancelKey is the key of the reqCanceler map. We wrap the *Request in this type since we want to use the original request, not any transient one created by roundTrip. 

### <a id="h2Transport" href="#h2Transport">type h2Transport interface</a>

```
searchKey: http.h2Transport
tags: [private]
```

```Go
type h2Transport interface {
	CloseIdleConnections()
}
```

h2Transport is the interface we expect to be able to call from net/http against an *http2.Transport that's either bundled into h2_bundle.go or supplied by the user via x/net/http2. 

We name it with the "h2" prefix to stay out of the "http2" prefix namespace used by x/tools/cmd/bundle for h2_bundle.go. 

### <a id="transportRequest" href="#transportRequest">type transportRequest struct</a>

```
searchKey: http.transportRequest
tags: [private]
```

```Go
type transportRequest struct {
	*Request                         // original request, not to be mutated
	extra     Header                 // extra headers to write, or nil
	trace     *httptrace.ClientTrace // optional
	cancelKey cancelKey

	mu  sync.Mutex // guards err
	err error      // first setError value for mapRoundTripError to consider
}
```

transportRequest is a wrapper around a *Request that adds optional extra headers to write and stores any error to return from roundTrip. 

#### <a id="transportRequest.extraHeaders" href="#transportRequest.extraHeaders">func (tr *transportRequest) extraHeaders() Header</a>

```
searchKey: http.transportRequest.extraHeaders
tags: [private]
```

```Go
func (tr *transportRequest) extraHeaders() Header
```

#### <a id="transportRequest.setError" href="#transportRequest.setError">func (tr *transportRequest) setError(err error)</a>

```
searchKey: http.transportRequest.setError
tags: [private]
```

```Go
func (tr *transportRequest) setError(err error)
```

#### <a id="transportRequest.logf" href="#transportRequest.logf">func (tr *transportRequest) logf(format string, args ...interface{})</a>

```
searchKey: http.transportRequest.logf
tags: [private]
```

```Go
func (tr *transportRequest) logf(format string, args ...interface{})
```

### <a id="readTrackingBody" href="#readTrackingBody">type readTrackingBody struct</a>

```
searchKey: http.readTrackingBody
tags: [private]
```

```Go
type readTrackingBody struct {
	io.ReadCloser
	didRead  bool
	didClose bool
}
```

#### <a id="readTrackingBody.Read" href="#readTrackingBody.Read">func (r *readTrackingBody) Read(data []byte) (int, error)</a>

```
searchKey: http.readTrackingBody.Read
tags: [private]
```

```Go
func (r *readTrackingBody) Read(data []byte) (int, error)
```

#### <a id="readTrackingBody.Close" href="#readTrackingBody.Close">func (r *readTrackingBody) Close() error</a>

```
searchKey: http.readTrackingBody.Close
tags: [private]
```

```Go
func (r *readTrackingBody) Close() error
```

### <a id="transportReadFromServerError" href="#transportReadFromServerError">type transportReadFromServerError struct</a>

```
searchKey: http.transportReadFromServerError
tags: [private]
```

```Go
type transportReadFromServerError struct {
	err error
}
```

transportReadFromServerError is used by Transport.readLoop when the 1 byte peek read fails and we're actually anticipating a response. Usually this is just due to the inherent keep-alive shut down race, where the server closed the connection at the same time the client wrote. The underlying err field is usually io.EOF or some ECONNRESET sort of thing which varies by platform. But it might be the user's custom net.Conn.Read error too, so we carry it along for them to return from Transport.RoundTrip. 

#### <a id="transportReadFromServerError.Unwrap" href="#transportReadFromServerError.Unwrap">func (e transportReadFromServerError) Unwrap() error</a>

```
searchKey: http.transportReadFromServerError.Unwrap
tags: [private]
```

```Go
func (e transportReadFromServerError) Unwrap() error
```

#### <a id="transportReadFromServerError.Error" href="#transportReadFromServerError.Error">func (e transportReadFromServerError) Error() string</a>

```
searchKey: http.transportReadFromServerError.Error
tags: [private]
```

```Go
func (e transportReadFromServerError) Error() string
```

### <a id="wantConn" href="#wantConn">type wantConn struct</a>

```
searchKey: http.wantConn
tags: [private]
```

```Go
type wantConn struct {
	cm    connectMethod
	key   connectMethodKey // cm.key()
	ctx   context.Context  // context for dial
	ready chan struct{}    // closed when pc, err pair is delivered

	// hooks for testing to know when dials are done
	// beforeDial is called in the getConn goroutine when the dial is queued.
	// afterDial is called when the dial is completed or canceled.
	beforeDial func()
	afterDial  func()

	mu  sync.Mutex // protects pc, err, close(ready)
	pc  *persistConn
	err error
}
```

A wantConn records state about a wanted connection (that is, an active call to getConn). The conn may be gotten by dialing or by finding an idle connection, or a cancellation may make the conn no longer wanted. These three options are racing against each other and use wantConn to coordinate and agree about the winning outcome. 

#### <a id="wantConn.waiting" href="#wantConn.waiting">func (w *wantConn) waiting() bool</a>

```
searchKey: http.wantConn.waiting
tags: [private]
```

```Go
func (w *wantConn) waiting() bool
```

waiting reports whether w is still waiting for an answer (connection or error). 

#### <a id="wantConn.tryDeliver" href="#wantConn.tryDeliver">func (w *wantConn) tryDeliver(pc *persistConn, err error) bool</a>

```
searchKey: http.wantConn.tryDeliver
tags: [private]
```

```Go
func (w *wantConn) tryDeliver(pc *persistConn, err error) bool
```

tryDeliver attempts to deliver pc, err to w and reports whether it succeeded. 

#### <a id="wantConn.cancel" href="#wantConn.cancel">func (w *wantConn) cancel(t *Transport, err error)</a>

```
searchKey: http.wantConn.cancel
tags: [private]
```

```Go
func (w *wantConn) cancel(t *Transport, err error)
```

cancel marks w as no longer wanting a result (for example, due to cancellation). If a connection has been delivered already, cancel returns it with t.putOrCloseIdleConn. 

### <a id="wantConnQueue" href="#wantConnQueue">type wantConnQueue struct</a>

```
searchKey: http.wantConnQueue
tags: [private]
```

```Go
type wantConnQueue struct {
	// This is a queue, not a deque.
	// It is split into two stages - head[headPos:] and tail.
	// popFront is trivial (headPos++) on the first stage, and
	// pushBack is trivial (append) on the second stage.
	// If the first stage is empty, popFront can swap the
	// first and second stages to remedy the situation.
	//
	// This two-stage split is analogous to the use of two lists
	// in Okasaki's purely functional queue but without the
	// overhead of reversing the list when swapping stages.
	head    []*wantConn
	headPos int
	tail    []*wantConn
}
```

A wantConnQueue is a queue of wantConns. 

#### <a id="wantConnQueue.len" href="#wantConnQueue.len">func (q *wantConnQueue) len() int</a>

```
searchKey: http.wantConnQueue.len
tags: [private]
```

```Go
func (q *wantConnQueue) len() int
```

len returns the number of items in the queue. 

#### <a id="wantConnQueue.pushBack" href="#wantConnQueue.pushBack">func (q *wantConnQueue) pushBack(w *wantConn)</a>

```
searchKey: http.wantConnQueue.pushBack
tags: [private]
```

```Go
func (q *wantConnQueue) pushBack(w *wantConn)
```

pushBack adds w to the back of the queue. 

#### <a id="wantConnQueue.popFront" href="#wantConnQueue.popFront">func (q *wantConnQueue) popFront() *wantConn</a>

```
searchKey: http.wantConnQueue.popFront
tags: [private]
```

```Go
func (q *wantConnQueue) popFront() *wantConn
```

popFront removes and returns the wantConn at the front of the queue. 

#### <a id="wantConnQueue.peekFront" href="#wantConnQueue.peekFront">func (q *wantConnQueue) peekFront() *wantConn</a>

```
searchKey: http.wantConnQueue.peekFront
tags: [private]
```

```Go
func (q *wantConnQueue) peekFront() *wantConn
```

peekFront returns the wantConn at the front of the queue without removing it. 

#### <a id="wantConnQueue.cleanFront" href="#wantConnQueue.cleanFront">func (q *wantConnQueue) cleanFront() (cleaned bool)</a>

```
searchKey: http.wantConnQueue.cleanFront
tags: [private]
```

```Go
func (q *wantConnQueue) cleanFront() (cleaned bool)
```

cleanFront pops any wantConns that are no longer waiting from the head of the queue, reporting whether any were popped. 

### <a id="erringRoundTripper" href="#erringRoundTripper">type erringRoundTripper interface</a>

```
searchKey: http.erringRoundTripper
tags: [private]
```

```Go
type erringRoundTripper interface {
	RoundTripErr() error
}
```

### <a id="persistConnWriter" href="#persistConnWriter">type persistConnWriter struct</a>

```
searchKey: http.persistConnWriter
tags: [private]
```

```Go
type persistConnWriter struct {
	pc *persistConn
}
```

persistConnWriter is the io.Writer written to by pc.bw. It accumulates the number of bytes written to the underlying conn, so the retry logic can determine whether any bytes made it across the wire. This is exactly 1 pointer field wide so it can go into an interface without allocation. 

#### <a id="persistConnWriter.Write" href="#persistConnWriter.Write">func (w persistConnWriter) Write(p []byte) (n int, err error)</a>

```
searchKey: http.persistConnWriter.Write
tags: [private]
```

```Go
func (w persistConnWriter) Write(p []byte) (n int, err error)
```

#### <a id="persistConnWriter.ReadFrom" href="#persistConnWriter.ReadFrom">func (w persistConnWriter) ReadFrom(r io.Reader) (n int64, err error)</a>

```
searchKey: http.persistConnWriter.ReadFrom
tags: [private]
```

```Go
func (w persistConnWriter) ReadFrom(r io.Reader) (n int64, err error)
```

ReadFrom exposes persistConnWriter's underlying Conn to io.Copy and if the Conn implements io.ReaderFrom, it can take advantage of optimizations such as sendfile. 

### <a id="connectMethod" href="#connectMethod">type connectMethod struct</a>

```
searchKey: http.connectMethod
tags: [private]
```

```Go
type connectMethod struct {
	_            incomparable
	proxyURL     *url.URL // nil for no proxy, else full proxy URL
	targetScheme string   // "http" or "https"
	// If proxyURL specifies an http or https proxy, and targetScheme is http (not https),
	// then targetAddr is not included in the connect method key, because the socket can
	// be reused for different targetAddr values.
	targetAddr string
	onlyH1     bool // whether to disable HTTP/2 and force HTTP/1
}
```

connectMethod is the map key (in its String form) for keeping persistent TCP connections alive for subsequent HTTP requests. 

A connect method may be of the following types: 

```
connectMethod.key().String()      Description
------------------------------    -------------------------
|http|foo.com                     http directly to server, no proxy
|https|foo.com                    https directly to server, no proxy
|https,h1|foo.com                 https directly to server w/o HTTP/2, no proxy
[http://proxy.com](http://proxy.com)|https|foo.com    http to proxy, then CONNECT to foo.com
[http://proxy.com](http://proxy.com)|http             http to proxy, http to anywhere after that
socks5://proxy.com|http|foo.com   socks5 to proxy, then http to foo.com
socks5://proxy.com|https|foo.com  socks5 to proxy, then https to foo.com
[https://proxy.com](https://proxy.com)|https|foo.com   https to proxy, then CONNECT to foo.com
[https://proxy.com](https://proxy.com)|http            https to proxy, http to anywhere after that

```
#### <a id="connectMethod.proxyAuth" href="#connectMethod.proxyAuth">func (cm *connectMethod) proxyAuth() string</a>

```
searchKey: http.connectMethod.proxyAuth
tags: [private]
```

```Go
func (cm *connectMethod) proxyAuth() string
```

proxyAuth returns the Proxy-Authorization header to set on requests, if applicable. 

#### <a id="connectMethod.key" href="#connectMethod.key">func (cm *connectMethod) key() connectMethodKey</a>

```
searchKey: http.connectMethod.key
tags: [private]
```

```Go
func (cm *connectMethod) key() connectMethodKey
```

#### <a id="connectMethod.scheme" href="#connectMethod.scheme">func (cm *connectMethod) scheme() string</a>

```
searchKey: http.connectMethod.scheme
tags: [private]
```

```Go
func (cm *connectMethod) scheme() string
```

scheme returns the first hop scheme: http, https, or socks5 

#### <a id="connectMethod.addr" href="#connectMethod.addr">func (cm *connectMethod) addr() string</a>

```
searchKey: http.connectMethod.addr
tags: [private]
```

```Go
func (cm *connectMethod) addr() string
```

addr returns the first hop "host:port" to which we need to TCP connect. 

#### <a id="connectMethod.tlsHost" href="#connectMethod.tlsHost">func (cm *connectMethod) tlsHost() string</a>

```
searchKey: http.connectMethod.tlsHost
tags: [private]
```

```Go
func (cm *connectMethod) tlsHost() string
```

tlsHost returns the host name to match against the peer's TLS certificate. 

### <a id="connectMethodKey" href="#connectMethodKey">type connectMethodKey struct</a>

```
searchKey: http.connectMethodKey
tags: [private]
```

```Go
type connectMethodKey struct {
	proxy, scheme, addr string
	onlyH1              bool
}
```

connectMethodKey is the map key version of connectMethod, with a stringified proxy URL (or the empty string) instead of a pointer to a URL. 

#### <a id="connectMethodKey.String" href="#connectMethodKey.String">func (k connectMethodKey) String() string</a>

```
searchKey: http.connectMethodKey.String
tags: [private]
```

```Go
func (k connectMethodKey) String() string
```

### <a id="persistConn" href="#persistConn">type persistConn struct</a>

```
searchKey: http.persistConn
tags: [private]
```

```Go
type persistConn struct {
	// alt optionally specifies the TLS NextProto RoundTripper.
	// This is used for HTTP/2 today and future protocols later.
	// If it's non-nil, the rest of the fields are unused.
	alt RoundTripper

	t         *Transport
	cacheKey  connectMethodKey
	conn      net.Conn
	tlsState  *tls.ConnectionState
	br        *bufio.Reader       // from conn
	bw        *bufio.Writer       // to conn
	nwrite    int64               // bytes written
	reqch     chan requestAndChan // written by roundTrip; read by readLoop
	writech   chan writeRequest   // written by roundTrip; read by writeLoop
	closech   chan struct{}       // closed when conn closed
	isProxy   bool
	sawEOF    bool  // whether we've seen EOF from conn; owned by readLoop
	readLimit int64 // bytes allowed to be read; owned by readLoop
	// writeErrCh passes the request write error (usually nil)
	// from the writeLoop goroutine to the readLoop which passes
	// it off to the res.Body reader, which then uses it to decide
	// whether or not a connection can be reused. Issue 7569.
	writeErrCh chan error

	writeLoopDone chan struct{} // closed when write loop ends

	// Both guarded by Transport.idleMu:
	idleAt    time.Time   // time it last become idle
	idleTimer *time.Timer // holding an AfterFunc to close it

	mu                   sync.Mutex // guards following fields
	numExpectedResponses int
	closed               error // set non-nil when conn is closed, before closech is closed
	canceledErr          error // set non-nil if conn is canceled
	broken               bool  // an error has happened on this connection; marked broken so it's not reused.
	reused               bool  // whether conn has had successful request/response and is being reused.
	// mutateHeaderFunc is an optional func to modify extra
	// headers on each outbound request before it's written. (the
	// original Request given to RoundTrip is not modified)
	mutateHeaderFunc func(Header)
}
```

persistConn wraps a connection, usually a persistent one (but may be used for non-keep-alive requests as well) 

#### <a id="persistConn.shouldRetryRequest" href="#persistConn.shouldRetryRequest">func (pc *persistConn) shouldRetryRequest(req *Request, err error) bool</a>

```
searchKey: http.persistConn.shouldRetryRequest
tags: [private]
```

```Go
func (pc *persistConn) shouldRetryRequest(req *Request, err error) bool
```

shouldRetryRequest reports whether we should retry sending a failed HTTP request on a new connection. The non-nil input error is the error from roundTrip. 

#### <a id="persistConn.addTLS" href="#persistConn.addTLS">func (pconn *persistConn) addTLS(ctx context.Context, name string, trace *httptrace.ClientTrace) error</a>

```
searchKey: http.persistConn.addTLS
tags: [private]
```

```Go
func (pconn *persistConn) addTLS(ctx context.Context, name string, trace *httptrace.ClientTrace) error
```

Add TLS to a persistent connection, i.e. negotiate a TLS session. If pconn is already a TLS tunnel, this function establishes a nested TLS session inside the encrypted channel. The remote endpoint's name may be overridden by TLSClientConfig.ServerName. 

#### <a id="persistConn.maxHeaderResponseSize" href="#persistConn.maxHeaderResponseSize">func (pc *persistConn) maxHeaderResponseSize() int64</a>

```
searchKey: http.persistConn.maxHeaderResponseSize
tags: [private]
```

```Go
func (pc *persistConn) maxHeaderResponseSize() int64
```

#### <a id="persistConn.Read" href="#persistConn.Read">func (pc *persistConn) Read(p []byte) (n int, err error)</a>

```
searchKey: http.persistConn.Read
tags: [private]
```

```Go
func (pc *persistConn) Read(p []byte) (n int, err error)
```

#### <a id="persistConn.isBroken" href="#persistConn.isBroken">func (pc *persistConn) isBroken() bool</a>

```
searchKey: http.persistConn.isBroken
tags: [private]
```

```Go
func (pc *persistConn) isBroken() bool
```

isBroken reports whether this connection is in a known broken state. 

#### <a id="persistConn.canceled" href="#persistConn.canceled">func (pc *persistConn) canceled() error</a>

```
searchKey: http.persistConn.canceled
tags: [private]
```

```Go
func (pc *persistConn) canceled() error
```

canceled returns non-nil if the connection was closed due to CancelRequest or due to context cancellation. 

#### <a id="persistConn.isReused" href="#persistConn.isReused">func (pc *persistConn) isReused() bool</a>

```
searchKey: http.persistConn.isReused
tags: [private]
```

```Go
func (pc *persistConn) isReused() bool
```

isReused reports whether this connection has been used before. 

#### <a id="persistConn.gotIdleConnTrace" href="#persistConn.gotIdleConnTrace">func (pc *persistConn) gotIdleConnTrace(idleAt time.Time) (t httptrace.GotConnInfo)</a>

```
searchKey: http.persistConn.gotIdleConnTrace
tags: [private]
```

```Go
func (pc *persistConn) gotIdleConnTrace(idleAt time.Time) (t httptrace.GotConnInfo)
```

#### <a id="persistConn.cancelRequest" href="#persistConn.cancelRequest">func (pc *persistConn) cancelRequest(err error)</a>

```
searchKey: http.persistConn.cancelRequest
tags: [private]
```

```Go
func (pc *persistConn) cancelRequest(err error)
```

#### <a id="persistConn.closeConnIfStillIdle" href="#persistConn.closeConnIfStillIdle">func (pc *persistConn) closeConnIfStillIdle()</a>

```
searchKey: http.persistConn.closeConnIfStillIdle
tags: [private]
```

```Go
func (pc *persistConn) closeConnIfStillIdle()
```

closeConnIfStillIdle closes the connection if it's still sitting idle. This is what's called by the persistConn's idleTimer, and is run in its own goroutine. 

#### <a id="persistConn.mapRoundTripError" href="#persistConn.mapRoundTripError">func (pc *persistConn) mapRoundTripError(req *transportRequest, startBytesWritten int64, err error) error</a>

```
searchKey: http.persistConn.mapRoundTripError
tags: [private]
```

```Go
func (pc *persistConn) mapRoundTripError(req *transportRequest, startBytesWritten int64, err error) error
```

mapRoundTripError returns the appropriate error value for persistConn.roundTrip. 

The provided err is the first error that (*persistConn).roundTrip happened to receive from its select statement. 

The startBytesWritten value should be the value of pc.nwrite before the roundTrip started writing the request. 

#### <a id="persistConn.readLoop" href="#persistConn.readLoop">func (pc *persistConn) readLoop()</a>

```
searchKey: http.persistConn.readLoop
tags: [private]
```

```Go
func (pc *persistConn) readLoop()
```

#### <a id="persistConn.readLoopPeekFailLocked" href="#persistConn.readLoopPeekFailLocked">func (pc *persistConn) readLoopPeekFailLocked(peekErr error)</a>

```
searchKey: http.persistConn.readLoopPeekFailLocked
tags: [private]
```

```Go
func (pc *persistConn) readLoopPeekFailLocked(peekErr error)
```

#### <a id="persistConn.readResponse" href="#persistConn.readResponse">func (pc *persistConn) readResponse(rc requestAndChan, trace *httptrace.ClientTrace) (resp *Response, err error)</a>

```
searchKey: http.persistConn.readResponse
tags: [private]
```

```Go
func (pc *persistConn) readResponse(rc requestAndChan, trace *httptrace.ClientTrace) (resp *Response, err error)
```

readResponse reads an HTTP response (or two, in the case of "Expect: 100-continue") from the server. It returns the final non-100 one. trace is optional. 

#### <a id="persistConn.waitForContinue" href="#persistConn.waitForContinue">func (pc *persistConn) waitForContinue(continueCh <-chan struct{}) func() bool</a>

```
searchKey: http.persistConn.waitForContinue
tags: [private]
```

```Go
func (pc *persistConn) waitForContinue(continueCh <-chan struct{}) func() bool
```

waitForContinue returns the function to block until any response, timeout or connection close. After any of them, the function returns a bool which indicates if the body should be sent. 

#### <a id="persistConn.writeLoop" href="#persistConn.writeLoop">func (pc *persistConn) writeLoop()</a>

```
searchKey: http.persistConn.writeLoop
tags: [private]
```

```Go
func (pc *persistConn) writeLoop()
```

#### <a id="persistConn.wroteRequest" href="#persistConn.wroteRequest">func (pc *persistConn) wroteRequest() bool</a>

```
searchKey: http.persistConn.wroteRequest
tags: [private]
```

```Go
func (pc *persistConn) wroteRequest() bool
```

wroteRequest is a check before recycling a connection that the previous write (from writeLoop above) happened and was successful. 

#### <a id="persistConn.roundTrip" href="#persistConn.roundTrip">func (pc *persistConn) roundTrip(req *transportRequest) (resp *Response, err error)</a>

```
searchKey: http.persistConn.roundTrip
tags: [private]
```

```Go
func (pc *persistConn) roundTrip(req *transportRequest) (resp *Response, err error)
```

#### <a id="persistConn.markReused" href="#persistConn.markReused">func (pc *persistConn) markReused()</a>

```
searchKey: http.persistConn.markReused
tags: [private]
```

```Go
func (pc *persistConn) markReused()
```

markReused marks this connection as having been successfully used for a request and response. 

#### <a id="persistConn.close" href="#persistConn.close">func (pc *persistConn) close(err error)</a>

```
searchKey: http.persistConn.close
tags: [private]
```

```Go
func (pc *persistConn) close(err error)
```

close closes the underlying TCP connection and closes the pc.closech channel. 

The provided err is only for testing and debugging; in normal circumstances it should never be seen by users. 

#### <a id="persistConn.closeLocked" href="#persistConn.closeLocked">func (pc *persistConn) closeLocked(err error)</a>

```
searchKey: http.persistConn.closeLocked
tags: [private]
```

```Go
func (pc *persistConn) closeLocked(err error)
```

### <a id="readWriteCloserBody" href="#readWriteCloserBody">type readWriteCloserBody struct</a>

```
searchKey: http.readWriteCloserBody
tags: [private]
```

```Go
type readWriteCloserBody struct {
	_  incomparable
	br *bufio.Reader // used until empty
	io.ReadWriteCloser
}
```

readWriteCloserBody is the Response.Body type used when we want to give users write access to the Body through the underlying connection (TCP, unless using custom dialers). This is then the concrete type for a Response.Body on the 101 Switching Protocols response, as used by WebSockets, h2c, etc. 

#### <a id="readWriteCloserBody.Read" href="#readWriteCloserBody.Read">func (b *readWriteCloserBody) Read(p []byte) (n int, err error)</a>

```
searchKey: http.readWriteCloserBody.Read
tags: [private]
```

```Go
func (b *readWriteCloserBody) Read(p []byte) (n int, err error)
```

### <a id="nothingWrittenError" href="#nothingWrittenError">type nothingWrittenError struct</a>

```
searchKey: http.nothingWrittenError
tags: [private]
```

```Go
type nothingWrittenError struct {
	error
}
```

nothingWrittenError wraps a write errors which ended up writing zero bytes. 

### <a id="responseAndError" href="#responseAndError">type responseAndError struct</a>

```
searchKey: http.responseAndError
tags: [private]
```

```Go
type responseAndError struct {
	_   incomparable
	res *Response // else use this response (see res method)
	err error
}
```

responseAndError is how the goroutine reading from an HTTP/1 server communicates with the goroutine doing the RoundTrip. 

### <a id="requestAndChan" href="#requestAndChan">type requestAndChan struct</a>

```
searchKey: http.requestAndChan
tags: [private]
```

```Go
type requestAndChan struct {
	_         incomparable
	req       *Request
	cancelKey cancelKey
	ch        chan responseAndError // unbuffered; always send in select on callerGone

	// whether the Transport (as opposed to the user client code)
	// added the Accept-Encoding gzip header. If the Transport
	// set it, only then do we transparently decode the gzip.
	addedGzip bool

	// Optional blocking chan for Expect: 100-continue (for send).
	// If the request has an "Expect: 100-continue" header and
	// the server responds 100 Continue, readLoop send a value
	// to writeLoop via this chan.
	continueCh chan<- struct{}

	callerGone <-chan struct{} // closed when roundTrip caller has returned
}
```

### <a id="writeRequest" href="#writeRequest">type writeRequest struct</a>

```
searchKey: http.writeRequest
tags: [private]
```

```Go
type writeRequest struct {
	req *transportRequest
	ch  chan<- error

	// Optional blocking chan for Expect: 100-continue (for receive).
	// If not nil, writeLoop blocks sending request body until
	// it receives from this chan.
	continueCh <-chan struct{}
}
```

A writeRequest is sent by the readLoop's goroutine to the writeLoop's goroutine to write a request while the read loop concurrently waits on both the write response and the server's reply. 

### <a id="httpError" href="#httpError">type httpError struct</a>

```
searchKey: http.httpError
tags: [private]
```

```Go
type httpError struct {
	err     string
	timeout bool
}
```

#### <a id="httpError.Error" href="#httpError.Error">func (e *httpError) Error() string</a>

```
searchKey: http.httpError.Error
tags: [private]
```

```Go
func (e *httpError) Error() string
```

#### <a id="httpError.Timeout" href="#httpError.Timeout">func (e *httpError) Timeout() bool</a>

```
searchKey: http.httpError.Timeout
tags: [private]
```

```Go
func (e *httpError) Timeout() bool
```

#### <a id="httpError.Temporary" href="#httpError.Temporary">func (e *httpError) Temporary() bool</a>

```
searchKey: http.httpError.Temporary
tags: [private]
```

```Go
func (e *httpError) Temporary() bool
```

### <a id="tLogKey" href="#tLogKey">type tLogKey struct{}</a>

```
searchKey: http.tLogKey
tags: [private]
```

```Go
type tLogKey struct{}
```

tLogKey is a context WithValue key for test debugging contexts containing a t.Logf func. See export_test.go's Request.WithT method. 

### <a id="bodyEOFSignal" href="#bodyEOFSignal">type bodyEOFSignal struct</a>

```
searchKey: http.bodyEOFSignal
tags: [private]
```

```Go
type bodyEOFSignal struct {
	body         io.ReadCloser
	mu           sync.Mutex        // guards following 4 fields
	closed       bool              // whether Close has been called
	rerr         error             // sticky Read error
	fn           func(error) error // err will be nil on Read io.EOF
	earlyCloseFn func() error      // optional alt Close func used if io.EOF not seen
}
```

bodyEOFSignal is used by the HTTP/1 transport when reading response bodies to make sure we see the end of a response body before proceeding and reading on the connection again. 

It wraps a ReadCloser but runs fn (if non-nil) at most once, right before its final (error-producing) Read or Close call returns. fn should return the new error to return from Read or Close. 

If earlyCloseFn is non-nil and Close is called before io.EOF is seen, earlyCloseFn is called instead of fn, and its return value is the return value from Close. 

#### <a id="bodyEOFSignal.Read" href="#bodyEOFSignal.Read">func (es *bodyEOFSignal) Read(p []byte) (n int, err error)</a>

```
searchKey: http.bodyEOFSignal.Read
tags: [private]
```

```Go
func (es *bodyEOFSignal) Read(p []byte) (n int, err error)
```

#### <a id="bodyEOFSignal.Close" href="#bodyEOFSignal.Close">func (es *bodyEOFSignal) Close() error</a>

```
searchKey: http.bodyEOFSignal.Close
tags: [private]
```

```Go
func (es *bodyEOFSignal) Close() error
```

#### <a id="bodyEOFSignal.condfn" href="#bodyEOFSignal.condfn">func (es *bodyEOFSignal) condfn(err error) error</a>

```
searchKey: http.bodyEOFSignal.condfn
tags: [private]
```

```Go
func (es *bodyEOFSignal) condfn(err error) error
```

caller must hold es.mu. 

### <a id="gzipReader" href="#gzipReader">type gzipReader struct</a>

```
searchKey: http.gzipReader
tags: [private]
```

```Go
type gzipReader struct {
	_    incomparable
	body *bodyEOFSignal // underlying HTTP/1 response body framing
	zr   *gzip.Reader   // lazily-initialized gzip reader
	zerr error          // any error from gzip.NewReader; sticky
}
```

gzipReader wraps a response body so it can lazily call gzip.NewReader on the first call to Read 

#### <a id="gzipReader.Read" href="#gzipReader.Read">func (gz *gzipReader) Read(p []byte) (n int, err error)</a>

```
searchKey: http.gzipReader.Read
tags: [private]
```

```Go
func (gz *gzipReader) Read(p []byte) (n int, err error)
```

#### <a id="gzipReader.Close" href="#gzipReader.Close">func (gz *gzipReader) Close() error</a>

```
searchKey: http.gzipReader.Close
tags: [private]
```

```Go
func (gz *gzipReader) Close() error
```

### <a id="tlsHandshakeTimeoutError" href="#tlsHandshakeTimeoutError">type tlsHandshakeTimeoutError struct{}</a>

```
searchKey: http.tlsHandshakeTimeoutError
tags: [private]
```

```Go
type tlsHandshakeTimeoutError struct{}
```

#### <a id="tlsHandshakeTimeoutError.Timeout" href="#tlsHandshakeTimeoutError.Timeout">func (tlsHandshakeTimeoutError) Timeout() bool</a>

```
searchKey: http.tlsHandshakeTimeoutError.Timeout
tags: [private]
```

```Go
func (tlsHandshakeTimeoutError) Timeout() bool
```

#### <a id="tlsHandshakeTimeoutError.Temporary" href="#tlsHandshakeTimeoutError.Temporary">func (tlsHandshakeTimeoutError) Temporary() bool</a>

```
searchKey: http.tlsHandshakeTimeoutError.Temporary
tags: [private]
```

```Go
func (tlsHandshakeTimeoutError) Temporary() bool
```

#### <a id="tlsHandshakeTimeoutError.Error" href="#tlsHandshakeTimeoutError.Error">func (tlsHandshakeTimeoutError) Error() string</a>

```
searchKey: http.tlsHandshakeTimeoutError.Error
tags: [private]
```

```Go
func (tlsHandshakeTimeoutError) Error() string
```

### <a id="fakeLocker" href="#fakeLocker">type fakeLocker struct{}</a>

```
searchKey: http.fakeLocker
tags: [private]
```

```Go
type fakeLocker struct{}
```

fakeLocker is a sync.Locker which does nothing. It's used to guard test-only fields when not under test, to avoid runtime atomic overhead. 

#### <a id="fakeLocker.Lock" href="#fakeLocker.Lock">func (fakeLocker) Lock()</a>

```
searchKey: http.fakeLocker.Lock
tags: [private]
```

```Go
func (fakeLocker) Lock()
```

#### <a id="fakeLocker.Unlock" href="#fakeLocker.Unlock">func (fakeLocker) Unlock()</a>

```
searchKey: http.fakeLocker.Unlock
tags: [private]
```

```Go
func (fakeLocker) Unlock()
```

### <a id="connLRU" href="#connLRU">type connLRU struct</a>

```
searchKey: http.connLRU
tags: [private]
```

```Go
type connLRU struct {
	ll *list.List // list.Element.Value type is of *persistConn
	m  map[*persistConn]*list.Element
}
```

#### <a id="connLRU.add" href="#connLRU.add">func (cl *connLRU) add(pc *persistConn)</a>

```
searchKey: http.connLRU.add
tags: [private]
```

```Go
func (cl *connLRU) add(pc *persistConn)
```

add adds pc to the head of the linked list. 

#### <a id="connLRU.removeOldest" href="#connLRU.removeOldest">func (cl *connLRU) removeOldest() *persistConn</a>

```
searchKey: http.connLRU.removeOldest
tags: [private]
```

```Go
func (cl *connLRU) removeOldest() *persistConn
```

#### <a id="connLRU.remove" href="#connLRU.remove">func (cl *connLRU) remove(pc *persistConn)</a>

```
searchKey: http.connLRU.remove
tags: [private]
```

```Go
func (cl *connLRU) remove(pc *persistConn)
```

remove removes pc from cl. 

#### <a id="connLRU.len" href="#connLRU.len">func (cl *connLRU) len() int</a>

```
searchKey: http.connLRU.len
tags: [private]
```

```Go
func (cl *connLRU) len() int
```

len returns the number of items in the cache. 

### <a id="headerOnlyResponseWriter" href="#headerOnlyResponseWriter">type headerOnlyResponseWriter http.Header</a>

```
searchKey: http.headerOnlyResponseWriter
tags: [private]
```

```Go
type headerOnlyResponseWriter Header
```

#### <a id="headerOnlyResponseWriter.Header" href="#headerOnlyResponseWriter.Header">func (ho headerOnlyResponseWriter) Header() Header</a>

```
searchKey: http.headerOnlyResponseWriter.Header
tags: [private]
```

```Go
func (ho headerOnlyResponseWriter) Header() Header
```

#### <a id="headerOnlyResponseWriter.Write" href="#headerOnlyResponseWriter.Write">func (ho headerOnlyResponseWriter) Write([]byte) (int, error)</a>

```
searchKey: http.headerOnlyResponseWriter.Write
tags: [private]
```

```Go
func (ho headerOnlyResponseWriter) Write([]byte) (int, error)
```

#### <a id="headerOnlyResponseWriter.WriteHeader" href="#headerOnlyResponseWriter.WriteHeader">func (ho headerOnlyResponseWriter) WriteHeader(int)</a>

```
searchKey: http.headerOnlyResponseWriter.WriteHeader
tags: [private]
```

```Go
func (ho headerOnlyResponseWriter) WriteHeader(int)
```

### <a id="hasTokenTest" href="#hasTokenTest">type hasTokenTest struct</a>

```
searchKey: http.hasTokenTest
tags: [private]
```

```Go
type hasTokenTest struct {
	header string
	token  string
	want   bool
}
```

### <a id="reqTest" href="#reqTest">type reqTest struct</a>

```
searchKey: http.reqTest
tags: [private]
```

```Go
type reqTest struct {
	Raw     string
	Req     *Request
	Body    string
	Trailer Header
	Error   string
}
```

### <a id="reqWriteTest" href="#reqWriteTest">type reqWriteTest struct</a>

```
searchKey: http.reqWriteTest
tags: [private]
```

```Go
type reqWriteTest struct {
	Req  Request
	Body interface{} // optional []byte or func() io.ReadCloser to populate Req.Body

	// Any of these three may be empty to skip that test.
	WantWrite string // Request.Write
	WantProxy string // Request.WriteProxy

	WantError error // wanted error from Request.Write
}
```

### <a id="closeChecker" href="#closeChecker">type closeChecker struct</a>

```
searchKey: http.closeChecker
tags: [private]
```

```Go
type closeChecker struct {
	io.Reader
	closed bool
}
```

#### <a id="closeChecker.Close" href="#closeChecker.Close">func (rc *closeChecker) Close() error</a>

```
searchKey: http.closeChecker.Close
tags: [private]
```

```Go
func (rc *closeChecker) Close() error
```

### <a id="writerFunc" href="#writerFunc">type writerFunc func([]byte) (int, error)</a>

```
searchKey: http.writerFunc
tags: [private]
```

```Go
type writerFunc func([]byte) (int, error)
```

#### <a id="writerFunc.Write" href="#writerFunc.Write">func (f writerFunc) Write(p []byte) (int, error)</a>

```
searchKey: http.writerFunc.Write
tags: [private]
```

```Go
func (f writerFunc) Write(p []byte) (int, error)
```

### <a id="delegateReader" href="#delegateReader">type delegateReader struct</a>

```
searchKey: http.delegateReader
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
searchKey: http.delegateReader.Read
tags: [private]
```

```Go
func (r *delegateReader) Read(p []byte) (int, error)
```

### <a id="dumpConn" href="#dumpConn">type dumpConn struct</a>

```
searchKey: http.dumpConn
tags: [private]
```

```Go
type dumpConn struct {
	io.Writer
	io.Reader
}
```

dumpConn is a net.Conn that writes to Writer and reads from Reader. 

#### <a id="dumpConn.Close" href="#dumpConn.Close">func (c *dumpConn) Close() error</a>

```
searchKey: http.dumpConn.Close
tags: [private]
```

```Go
func (c *dumpConn) Close() error
```

#### <a id="dumpConn.LocalAddr" href="#dumpConn.LocalAddr">func (c *dumpConn) LocalAddr() net.Addr</a>

```
searchKey: http.dumpConn.LocalAddr
tags: [private]
```

```Go
func (c *dumpConn) LocalAddr() net.Addr
```

#### <a id="dumpConn.RemoteAddr" href="#dumpConn.RemoteAddr">func (c *dumpConn) RemoteAddr() net.Addr</a>

```
searchKey: http.dumpConn.RemoteAddr
tags: [private]
```

```Go
func (c *dumpConn) RemoteAddr() net.Addr
```

#### <a id="dumpConn.SetDeadline" href="#dumpConn.SetDeadline">func (c *dumpConn) SetDeadline(t time.Time) error</a>

```
searchKey: http.dumpConn.SetDeadline
tags: [private]
```

```Go
func (c *dumpConn) SetDeadline(t time.Time) error
```

#### <a id="dumpConn.SetReadDeadline" href="#dumpConn.SetReadDeadline">func (c *dumpConn) SetReadDeadline(t time.Time) error</a>

```
searchKey: http.dumpConn.SetReadDeadline
tags: [private]
```

```Go
func (c *dumpConn) SetReadDeadline(t time.Time) error
```

#### <a id="dumpConn.SetWriteDeadline" href="#dumpConn.SetWriteDeadline">func (c *dumpConn) SetWriteDeadline(t time.Time) error</a>

```
searchKey: http.dumpConn.SetWriteDeadline
tags: [private]
```

```Go
func (c *dumpConn) SetWriteDeadline(t time.Time) error
```

### <a id="respTest" href="#respTest">type respTest struct</a>

```
searchKey: http.respTest
tags: [private]
```

```Go
type respTest struct {
	Raw  string
	Resp Response
	Body string
}
```

### <a id="readerAndCloser" href="#readerAndCloser">type readerAndCloser struct</a>

```
searchKey: http.readerAndCloser
tags: [private]
```

```Go
type readerAndCloser struct {
	io.Reader
	io.Closer
}
```

### <a id="responseLocationTest" href="#responseLocationTest">type responseLocationTest struct</a>

```
searchKey: http.responseLocationTest
tags: [private]
```

```Go
type responseLocationTest struct {
	location string // Response's Location header or ""
	requrl   string // Response.Request.URL or ""
	want     string
	wantErr  error
}
```

### <a id="respWriteTest" href="#respWriteTest">type respWriteTest struct</a>

```
searchKey: http.respWriteTest
tags: [private]
```

```Go
type respWriteTest struct {
	Resp Response
	Raw  string
}
```

### <a id="mockTransferWriter" href="#mockTransferWriter">type mockTransferWriter struct</a>

```
searchKey: http.mockTransferWriter
tags: [private]
```

```Go
type mockTransferWriter struct {
	CalledReader io.Reader
	WriteCalled  bool
}
```

#### <a id="mockTransferWriter.ReadFrom" href="#mockTransferWriter.ReadFrom">func (w *mockTransferWriter) ReadFrom(r io.Reader) (int64, error)</a>

```
searchKey: http.mockTransferWriter.ReadFrom
tags: [private]
```

```Go
func (w *mockTransferWriter) ReadFrom(r io.Reader) (int64, error)
```

#### <a id="mockTransferWriter.Write" href="#mockTransferWriter.Write">func (w *mockTransferWriter) Write(p []byte) (int, error)</a>

```
searchKey: http.mockTransferWriter.Write
tags: [private]
```

```Go
func (w *mockTransferWriter) Write(p []byte) (int, error)
```

### <a id="issue22091Error" href="#issue22091Error">type issue22091Error struct{}</a>

```
searchKey: http.issue22091Error
tags: [private]
```

```Go
type issue22091Error struct{}
```

issue22091Error acts like a golang.org/x/net/http2.ErrNoCachedConn. 

#### <a id="issue22091Error.IsHTTP2NoCachedConnError" href="#issue22091Error.IsHTTP2NoCachedConnError">func (issue22091Error) IsHTTP2NoCachedConnError()</a>

```
searchKey: http.issue22091Error.IsHTTP2NoCachedConnError
tags: [private]
```

```Go
func (issue22091Error) IsHTTP2NoCachedConnError()
```

#### <a id="issue22091Error.Error" href="#issue22091Error.Error">func (issue22091Error) Error() string</a>

```
searchKey: http.issue22091Error.Error
tags: [private]
```

```Go
func (issue22091Error) Error() string
```

### <a id="roundTripFunc" href="#roundTripFunc">type roundTripFunc func(r *std/net/http.Request) (*std/net/http.Response, error)</a>

```
searchKey: http.roundTripFunc
tags: [private]
```

```Go
type roundTripFunc func(r *Request) (*Response, error)
```

#### <a id="roundTripFunc.RoundTrip" href="#roundTripFunc.RoundTrip">func (f roundTripFunc) RoundTrip(r *Request) (*Response, error)</a>

```
searchKey: http.roundTripFunc.RoundTrip
tags: [private]
```

```Go
func (f roundTripFunc) RoundTrip(r *Request) (*Response, error)
```

## <a id="func" href="#func">Functions</a>

### <a id="refererForURL" href="#refererForURL">func refererForURL(lastReq, newReq *url.URL) string</a>

```
searchKey: http.refererForURL
tags: [private]
```

```Go
func refererForURL(lastReq, newReq *url.URL) string
```

refererForURL returns a referer without any authentication info or an empty string if lastReq scheme is https and newReq scheme is http. 

### <a id="timeBeforeContextDeadline" href="#timeBeforeContextDeadline">func timeBeforeContextDeadline(t time.Time, ctx context.Context) bool</a>

```
searchKey: http.timeBeforeContextDeadline
tags: [private]
```

```Go
func timeBeforeContextDeadline(t time.Time, ctx context.Context) bool
```

timeBeforeContextDeadline reports whether the non-zero Time t is before ctx's deadline, if any. If ctx does not have a deadline, it always reports true (the deadline is considered infinite). 

### <a id="knownRoundTripperImpl" href="#knownRoundTripperImpl">func knownRoundTripperImpl(rt RoundTripper, req *Request) bool</a>

```
searchKey: http.knownRoundTripperImpl
tags: [private]
```

```Go
func knownRoundTripperImpl(rt RoundTripper, req *Request) bool
```

knownRoundTripperImpl reports whether rt is a RoundTripper that's maintained by the Go team and known to implement the latest optional semantics (notably contexts). The Request is used to check whether this particular request is using an alternate protocol, in which case we need to check the RoundTripper for that protocol. 

### <a id="setRequestCancel" href="#setRequestCancel">func setRequestCancel(req *Request, rt RoundTripper, deadline time.Time) (stopTimer func(), didTimeout func() bool)</a>

```
searchKey: http.setRequestCancel
tags: [private]
```

```Go
func setRequestCancel(req *Request, rt RoundTripper, deadline time.Time) (stopTimer func(), didTimeout func() bool)
```

setRequestCancel sets req.Cancel and adds a deadline context to req if deadline is non-zero. The RoundTripper's type is used to determine whether the legacy CancelRequest behavior should be used. 

As background, there are three ways to cancel a request: First was Transport.CancelRequest. (deprecated) Second was Request.Cancel. Third was Request.Context. This function populates the second and third, and uses the first if it really needs to. 

### <a id="basicAuth" href="#basicAuth">func basicAuth(username, password string) string</a>

```
searchKey: http.basicAuth
tags: [private]
```

```Go
func basicAuth(username, password string) string
```

See 2 (end of page 4) [https://www.ietf.org/rfc/rfc2617.txt](https://www.ietf.org/rfc/rfc2617.txt) "To receive authorization, the client sends the userid and password, separated by a single colon (":") character, within a base64 encoded string in the credentials." It is not meant to be urlencoded. 

### <a id="alwaysFalse" href="#alwaysFalse">func alwaysFalse() bool</a>

```
searchKey: http.alwaysFalse
tags: [private]
```

```Go
func alwaysFalse() bool
```

### <a id="redirectBehavior" href="#redirectBehavior">func redirectBehavior(reqMethod string, resp *Response, ireq *Request) (redirectMethod string, shouldRedirect, includeBody bool)</a>

```
searchKey: http.redirectBehavior
tags: [private]
```

```Go
func redirectBehavior(reqMethod string, resp *Response, ireq *Request) (redirectMethod string, shouldRedirect, includeBody bool)
```

redirectBehavior describes what should happen when the client encounters a 3xx status code from the server 

### <a id="urlErrorOp" href="#urlErrorOp">func urlErrorOp(method string) string</a>

```
searchKey: http.urlErrorOp
tags: [private]
```

```Go
func urlErrorOp(method string) string
```

urlErrorOp returns the (*url.Error).Op value to use for the provided (*Request).Method value. 

### <a id="defaultCheckRedirect" href="#defaultCheckRedirect">func defaultCheckRedirect(req *Request, via []*Request) error</a>

```
searchKey: http.defaultCheckRedirect
tags: [private]
```

```Go
func defaultCheckRedirect(req *Request, via []*Request) error
```

### <a id="shouldCopyHeaderOnRedirect" href="#shouldCopyHeaderOnRedirect">func shouldCopyHeaderOnRedirect(headerKey string, initial, dest *url.URL) bool</a>

```
searchKey: http.shouldCopyHeaderOnRedirect
tags: [private]
```

```Go
func shouldCopyHeaderOnRedirect(headerKey string, initial, dest *url.URL) bool
```

### <a id="isDomainOrSubdomain" href="#isDomainOrSubdomain">func isDomainOrSubdomain(sub, parent string) bool</a>

```
searchKey: http.isDomainOrSubdomain
tags: [private]
```

```Go
func isDomainOrSubdomain(sub, parent string) bool
```

isDomainOrSubdomain reports whether sub is a subdomain (or exact match) of the parent domain. 

Both domains must already be in canonical form. 

### <a id="stripPassword" href="#stripPassword">func stripPassword(u *url.URL) string</a>

```
searchKey: http.stripPassword
tags: [private]
```

```Go
func stripPassword(u *url.URL) string
```

### <a id="cloneURLValues" href="#cloneURLValues">func cloneURLValues(v url.Values) url.Values</a>

```
searchKey: http.cloneURLValues
tags: [private]
```

```Go
func cloneURLValues(v url.Values) url.Values
```

### <a id="cloneURL" href="#cloneURL">func cloneURL(u *url.URL) *url.URL</a>

```
searchKey: http.cloneURL
tags: [private]
```

```Go
func cloneURL(u *url.URL) *url.URL
```

### <a id="cloneMultipartForm" href="#cloneMultipartForm">func cloneMultipartForm(f *multipart.Form) *multipart.Form</a>

```
searchKey: http.cloneMultipartForm
tags: [private]
```

```Go
func cloneMultipartForm(f *multipart.Form) *multipart.Form
```

### <a id="cloneMultipartFileHeader" href="#cloneMultipartFileHeader">func cloneMultipartFileHeader(fh *multipart.FileHeader) *multipart.FileHeader</a>

```
searchKey: http.cloneMultipartFileHeader
tags: [private]
```

```Go
func cloneMultipartFileHeader(fh *multipart.FileHeader) *multipart.FileHeader
```

### <a id="readSetCookies" href="#readSetCookies">func readSetCookies(h Header) []*Cookie</a>

```
searchKey: http.readSetCookies
tags: [private]
```

```Go
func readSetCookies(h Header) []*Cookie
```

readSetCookies parses all "Set-Cookie" values from the header h and returns the successfully parsed Cookies. 

### <a id="SetCookie" href="#SetCookie">func SetCookie(w ResponseWriter, cookie *Cookie)</a>

```
searchKey: http.SetCookie
```

```Go
func SetCookie(w ResponseWriter, cookie *Cookie)
```

SetCookie adds a Set-Cookie header to the provided ResponseWriter's headers. The provided cookie must have a valid Name. Invalid cookies may be silently dropped. 

### <a id="readCookies" href="#readCookies">func readCookies(h Header, filter string) []*Cookie</a>

```
searchKey: http.readCookies
tags: [private]
```

```Go
func readCookies(h Header, filter string) []*Cookie
```

readCookies parses all "Cookie" values from the header h and returns the successfully parsed Cookies. 

if filter isn't empty, only cookies of that name are returned 

### <a id="validCookieDomain" href="#validCookieDomain">func validCookieDomain(v string) bool</a>

```
searchKey: http.validCookieDomain
tags: [private]
```

```Go
func validCookieDomain(v string) bool
```

validCookieDomain reports whether v is a valid cookie domain-value. 

### <a id="validCookieExpires" href="#validCookieExpires">func validCookieExpires(t time.Time) bool</a>

```
searchKey: http.validCookieExpires
tags: [private]
```

```Go
func validCookieExpires(t time.Time) bool
```

validCookieExpires reports whether v is a valid cookie expires-value. 

### <a id="isCookieDomainName" href="#isCookieDomainName">func isCookieDomainName(s string) bool</a>

```
searchKey: http.isCookieDomainName
tags: [private]
```

```Go
func isCookieDomainName(s string) bool
```

isCookieDomainName reports whether s is a valid domain name or a valid domain name with a leading dot '.'.  It is almost a direct copy of package net's isDomainName. 

### <a id="sanitizeCookieName" href="#sanitizeCookieName">func sanitizeCookieName(n string) string</a>

```
searchKey: http.sanitizeCookieName
tags: [private]
```

```Go
func sanitizeCookieName(n string) string
```

### <a id="sanitizeCookieValue" href="#sanitizeCookieValue">func sanitizeCookieValue(v string) string</a>

```
searchKey: http.sanitizeCookieValue
tags: [private]
```

```Go
func sanitizeCookieValue(v string) string
```

sanitizeCookieValue produces a suitable cookie-value from v. [https://tools.ietf.org/html/rfc6265#section-4.1.1](https://tools.ietf.org/html/rfc6265#section-4.1.1) cookie-value      = *cookie-octet / ( DQUOTE *cookie-octet DQUOTE ) cookie-octet      = %x21 / %x23-2B / %x2D-3A / %x3C-5B / %x5D-7E 

```
; US-ASCII characters excluding CTLs,
; whitespace DQUOTE, comma, semicolon,
; and backslash

```
We loosen this as spaces and commas are common in cookie values but we produce a quoted cookie-value if and only if v contains commas or spaces. See [https://golang.org/issue/7243](https://golang.org/issue/7243) for the discussion. 

### <a id="validCookieValueByte" href="#validCookieValueByte">func validCookieValueByte(b byte) bool</a>

```
searchKey: http.validCookieValueByte
tags: [private]
```

```Go
func validCookieValueByte(b byte) bool
```

### <a id="sanitizeCookiePath" href="#sanitizeCookiePath">func sanitizeCookiePath(v string) string</a>

```
searchKey: http.sanitizeCookiePath
tags: [private]
```

```Go
func sanitizeCookiePath(v string) string
```

path-av           = "Path=" path-value path-value        = <any CHAR except CTLs or ";"> 

### <a id="validCookiePathByte" href="#validCookiePathByte">func validCookiePathByte(b byte) bool</a>

```
searchKey: http.validCookiePathByte
tags: [private]
```

```Go
func validCookiePathByte(b byte) bool
```

### <a id="sanitizeOrWarn" href="#sanitizeOrWarn">func sanitizeOrWarn(fieldName string, valid func(byte) bool, v string) string</a>

```
searchKey: http.sanitizeOrWarn
tags: [private]
```

```Go
func sanitizeOrWarn(fieldName string, valid func(byte) bool, v string) string
```

### <a id="parseCookieValue" href="#parseCookieValue">func parseCookieValue(raw string, allowDoubleQuote bool) (string, bool)</a>

```
searchKey: http.parseCookieValue
tags: [private]
```

```Go
func parseCookieValue(raw string, allowDoubleQuote bool) (string, bool)
```

### <a id="isCookieNameValid" href="#isCookieNameValid">func isCookieNameValid(raw string) bool</a>

```
searchKey: http.isCookieNameValid
tags: [private]
```

```Go
func isCookieNameValid(raw string) bool
```

### <a id="mapDirOpenError" href="#mapDirOpenError">func mapDirOpenError(originalErr error, name string) error</a>

```
searchKey: http.mapDirOpenError
tags: [private]
```

```Go
func mapDirOpenError(originalErr error, name string) error
```

mapDirOpenError maps the provided non-nil error from opening name to a possibly better non-nil error. In particular, it turns OS-specific errors about opening files in non-directories into fs.ErrNotExist. See Issue 18984. 

### <a id="dirList" href="#dirList">func dirList(w ResponseWriter, r *Request, f File)</a>

```
searchKey: http.dirList
tags: [private]
```

```Go
func dirList(w ResponseWriter, r *Request, f File)
```

### <a id="ServeContent" href="#ServeContent">func ServeContent(w ResponseWriter, req *Request, name string, modtime time.Time, content io.ReadSeeker)</a>

```
searchKey: http.ServeContent
```

```Go
func ServeContent(w ResponseWriter, req *Request, name string, modtime time.Time, content io.ReadSeeker)
```

ServeContent replies to the request using the content in the provided ReadSeeker. The main benefit of ServeContent over io.Copy is that it handles Range requests properly, sets the MIME type, and handles If-Match, If-Unmodified-Since, If-None-Match, If-Modified-Since, and If-Range requests. 

If the response's Content-Type header is not set, ServeContent first tries to deduce the type from name's file extension and, if that fails, falls back to reading the first block of the content and passing it to DetectContentType. The name is otherwise unused; in particular it can be empty and is never sent in the response. 

If modtime is not the zero time or Unix epoch, ServeContent includes it in a Last-Modified header in the response. If the request includes an If-Modified-Since header, ServeContent uses modtime to decide whether the content needs to be sent at all. 

The content's Seek method must work: ServeContent uses a seek to the end of the content to determine its size. 

If the caller has set w's ETag header formatted per RFC 7232, section 2.3, ServeContent uses it to handle requests using If-Match, If-None-Match, or If-Range. 

Note that *os.File implements the io.ReadSeeker interface. 

### <a id="serveContent" href="#serveContent">func serveContent(w ResponseWriter, r *Request, name string, modtime time.Time, sizeFunc func() (int64, error), content io.ReadSeeker)</a>

```
searchKey: http.serveContent
tags: [private]
```

```Go
func serveContent(w ResponseWriter, r *Request, name string, modtime time.Time, sizeFunc func() (int64, error), content io.ReadSeeker)
```

if name is empty, filename is unknown. (used for mime type, before sniffing) if modtime.IsZero(), modtime is unknown. content must be seeked to the beginning of the file. The sizeFunc is called at most once. Its error, if any, is sent in the HTTP response. 

### <a id="scanETag" href="#scanETag">func scanETag(s string) (etag string, remain string)</a>

```
searchKey: http.scanETag
tags: [private]
```

```Go
func scanETag(s string) (etag string, remain string)
```

scanETag determines if a syntactically valid ETag is present at s. If so, the ETag and remaining text after consuming ETag is returned. Otherwise, it returns "", "". 

### <a id="etagStrongMatch" href="#etagStrongMatch">func etagStrongMatch(a, b string) bool</a>

```
searchKey: http.etagStrongMatch
tags: [private]
```

```Go
func etagStrongMatch(a, b string) bool
```

etagStrongMatch reports whether a and b match using strong ETag comparison. Assumes a and b are valid ETags. 

### <a id="etagWeakMatch" href="#etagWeakMatch">func etagWeakMatch(a, b string) bool</a>

```
searchKey: http.etagWeakMatch
tags: [private]
```

```Go
func etagWeakMatch(a, b string) bool
```

etagWeakMatch reports whether a and b match using weak ETag comparison. Assumes a and b are valid ETags. 

### <a id="isZeroTime" href="#isZeroTime">func isZeroTime(t time.Time) bool</a>

```
searchKey: http.isZeroTime
tags: [private]
```

```Go
func isZeroTime(t time.Time) bool
```

isZeroTime reports whether t is obviously unspecified (either zero or Unix()=0). 

### <a id="setLastModified" href="#setLastModified">func setLastModified(w ResponseWriter, modtime time.Time)</a>

```
searchKey: http.setLastModified
tags: [private]
```

```Go
func setLastModified(w ResponseWriter, modtime time.Time)
```

### <a id="writeNotModified" href="#writeNotModified">func writeNotModified(w ResponseWriter)</a>

```
searchKey: http.writeNotModified
tags: [private]
```

```Go
func writeNotModified(w ResponseWriter)
```

### <a id="checkPreconditions" href="#checkPreconditions">func checkPreconditions(w ResponseWriter, r *Request, modtime time.Time) (done bool, rangeHeader string)</a>

```
searchKey: http.checkPreconditions
tags: [private]
```

```Go
func checkPreconditions(w ResponseWriter, r *Request, modtime time.Time) (done bool, rangeHeader string)
```

checkPreconditions evaluates request preconditions and reports whether a precondition resulted in sending StatusNotModified or StatusPreconditionFailed. 

### <a id="serveFile" href="#serveFile">func serveFile(w ResponseWriter, r *Request, fs FileSystem, name string, redirect bool)</a>

```
searchKey: http.serveFile
tags: [private]
```

```Go
func serveFile(w ResponseWriter, r *Request, fs FileSystem, name string, redirect bool)
```

name is '/'-separated, not filepath.Separator. 

### <a id="toHTTPError" href="#toHTTPError">func toHTTPError(err error) (msg string, httpStatus int)</a>

```
searchKey: http.toHTTPError
tags: [private]
```

```Go
func toHTTPError(err error) (msg string, httpStatus int)
```

toHTTPError returns a non-specific HTTP error message and status code for a given non-nil error value. It's important that toHTTPError does not actually return err.Error(), since msg and httpStatus are returned to users, and historically Go's ServeContent always returned just "404 Not Found" for all errors. We don't want to start leaking information in error messages. 

### <a id="localRedirect" href="#localRedirect">func localRedirect(w ResponseWriter, r *Request, newPath string)</a>

```
searchKey: http.localRedirect
tags: [private]
```

```Go
func localRedirect(w ResponseWriter, r *Request, newPath string)
```

localRedirect gives a Moved Permanently response. It does not convert relative paths to absolute paths like Redirect does. 

### <a id="ServeFile" href="#ServeFile">func ServeFile(w ResponseWriter, r *Request, name string)</a>

```
searchKey: http.ServeFile
```

```Go
func ServeFile(w ResponseWriter, r *Request, name string)
```

ServeFile replies to the request with the contents of the named file or directory. 

If the provided file or directory name is a relative path, it is interpreted relative to the current directory and may ascend to parent directories. If the provided name is constructed from user input, it should be sanitized before calling ServeFile. 

As a precaution, ServeFile will reject requests where r.URL.Path contains a ".." path element; this protects against callers who might unsafely use filepath.Join on r.URL.Path without sanitizing it and then use that filepath.Join result as the name argument. 

As another special case, ServeFile redirects any request where r.URL.Path ends in "/index.html" to the same path, without the final "index.html". To avoid such redirects either modify the path or use ServeContent. 

Outside of those two special cases, ServeFile does not use r.URL.Path for selecting the file or directory to serve; only the file or directory provided in the name argument is used. 

### <a id="containsDotDot" href="#containsDotDot">func containsDotDot(v string) bool</a>

```
searchKey: http.containsDotDot
tags: [private]
```

```Go
func containsDotDot(v string) bool
```

### <a id="isSlashRune" href="#isSlashRune">func isSlashRune(r rune) bool</a>

```
searchKey: http.isSlashRune
tags: [private]
```

```Go
func isSlashRune(r rune) bool
```

### <a id="parseRange" href="#parseRange">func parseRange(s string, size int64) ([]httpRange, error)</a>

```
searchKey: http.parseRange
tags: [private]
```

```Go
func parseRange(s string, size int64) ([]httpRange, error)
```

parseRange parses a Range header string as per RFC 7233. errNoOverlap is returned if none of the ranges overlap. 

### <a id="rangesMIMESize" href="#rangesMIMESize">func rangesMIMESize(ranges []httpRange, contentType string, contentSize int64) (encSize int64)</a>

```
searchKey: http.rangesMIMESize
tags: [private]
```

```Go
func rangesMIMESize(ranges []httpRange, contentType string, contentSize int64) (encSize int64)
```

rangesMIMESize returns the number of bytes it takes to encode the provided ranges as a multipart response. 

### <a id="sumRangesSize" href="#sumRangesSize">func sumRangesSize(ranges []httpRange) (size int64)</a>

```
searchKey: http.sumRangesSize
tags: [private]
```

```Go
func sumRangesSize(ranges []httpRange) (size int64)
```

### <a id="http2asciiEqualFold" href="#http2asciiEqualFold">func http2asciiEqualFold(s, t string) bool</a>

```
searchKey: http.http2asciiEqualFold
tags: [private]
```

```Go
func http2asciiEqualFold(s, t string) bool
```

asciiEqualFold is strings.EqualFold, ASCII only. It reports whether s and t are equal, ASCII-case-insensitively. 

### <a id="http2lower" href="#http2lower">func http2lower(b byte) byte</a>

```
searchKey: http.http2lower
tags: [private]
```

```Go
func http2lower(b byte) byte
```

lower returns the ASCII lowercase version of b. 

### <a id="http2isASCIIPrint" href="#http2isASCIIPrint">func http2isASCIIPrint(s string) bool</a>

```
searchKey: http.http2isASCIIPrint
tags: [private]
```

```Go
func http2isASCIIPrint(s string) bool
```

isASCIIPrint returns whether s is ASCII and printable according to [https://tools.ietf.org/html/rfc20#section-4.2](https://tools.ietf.org/html/rfc20#section-4.2). 

### <a id="http2asciiToLower" href="#http2asciiToLower">func http2asciiToLower(s string) (lower string, ok bool)</a>

```
searchKey: http.http2asciiToLower
tags: [private]
```

```Go
func http2asciiToLower(s string) (lower string, ok bool)
```

asciiToLower returns the lowercase version of s if s is ASCII and printable, and whether or not it was. 

### <a id="http2isBadCipher" href="#http2isBadCipher">func http2isBadCipher(cipher uint16) bool</a>

```
searchKey: http.http2isBadCipher
tags: [private]
```

```Go
func http2isBadCipher(cipher uint16) bool
```

isBadCipher reports whether the cipher is blacklisted by the HTTP/2 spec. References: [https://tools.ietf.org/html/rfc7540#appendix-A](https://tools.ietf.org/html/rfc7540#appendix-A) Reject cipher suites from Appendix A. "This list includes those cipher suites that do not offer an ephemeral key exchange and those that are based on the TLS null, stream or block cipher type" 

### <a id="http2filterOutClientConn" href="#http2filterOutClientConn">func http2filterOutClientConn(in []*http2ClientConn, exclude *http2ClientConn) []*http2ClientConn</a>

```
searchKey: http.http2filterOutClientConn
tags: [private]
```

```Go
func http2filterOutClientConn(in []*http2ClientConn, exclude *http2ClientConn) []*http2ClientConn
```

### <a id="http2shouldRetryDial" href="#http2shouldRetryDial">func http2shouldRetryDial(call *http2dialCall, req *Request) bool</a>

```
searchKey: http.http2shouldRetryDial
tags: [private]
```

```Go
func http2shouldRetryDial(call *http2dialCall, req *Request) bool
```

shouldRetryDial reports whether the current request should retry dialing after the call finished unsuccessfully, for example if the dial was canceled because of a context cancellation or deadline expiry. 

### <a id="http2getDataBufferChunk" href="#http2getDataBufferChunk">func http2getDataBufferChunk(size int64) []byte</a>

```
searchKey: http.http2getDataBufferChunk
tags: [private]
```

```Go
func http2getDataBufferChunk(size int64) []byte
```

### <a id="http2putDataBufferChunk" href="#http2putDataBufferChunk">func http2putDataBufferChunk(p []byte)</a>

```
searchKey: http.http2putDataBufferChunk
tags: [private]
```

```Go
func http2putDataBufferChunk(p []byte)
```

### <a id="http2terminalReadFrameError" href="#http2terminalReadFrameError">func http2terminalReadFrameError(err error) bool</a>

```
searchKey: http.http2terminalReadFrameError
tags: [private]
```

```Go
func http2terminalReadFrameError(err error) bool
```

terminalReadFrameError reports whether err is an unrecoverable error from ReadFrame and no other frames should be read. 

### <a id="http2validStreamIDOrZero" href="#http2validStreamIDOrZero">func http2validStreamIDOrZero(streamID uint32) bool</a>

```
searchKey: http.http2validStreamIDOrZero
tags: [private]
```

```Go
func http2validStreamIDOrZero(streamID uint32) bool
```

### <a id="http2validStreamID" href="#http2validStreamID">func http2validStreamID(streamID uint32) bool</a>

```
searchKey: http.http2validStreamID
tags: [private]
```

```Go
func http2validStreamID(streamID uint32) bool
```

### <a id="http2readByte" href="#http2readByte">func http2readByte(p []byte) (remain []byte, b byte, err error)</a>

```
searchKey: http.http2readByte
tags: [private]
```

```Go
func http2readByte(p []byte) (remain []byte, b byte, err error)
```

### <a id="http2readUint32" href="#http2readUint32">func http2readUint32(p []byte) (remain []byte, v uint32, err error)</a>

```
searchKey: http.http2readUint32
tags: [private]
```

```Go
func http2readUint32(p []byte) (remain []byte, v uint32, err error)
```

### <a id="http2summarizeFrame" href="#http2summarizeFrame">func http2summarizeFrame(f http2Frame) string</a>

```
searchKey: http.http2summarizeFrame
tags: [private]
```

```Go
func http2summarizeFrame(f http2Frame) string
```

### <a id="http2traceHasWroteHeaderField" href="#http2traceHasWroteHeaderField">func http2traceHasWroteHeaderField(trace *httptrace.ClientTrace) bool</a>

```
searchKey: http.http2traceHasWroteHeaderField
tags: [private]
```

```Go
func http2traceHasWroteHeaderField(trace *httptrace.ClientTrace) bool
```

### <a id="http2traceWroteHeaderField" href="#http2traceWroteHeaderField">func http2traceWroteHeaderField(trace *httptrace.ClientTrace, k, v string)</a>

```
searchKey: http.http2traceWroteHeaderField
tags: [private]
```

```Go
func http2traceWroteHeaderField(trace *httptrace.ClientTrace, k, v string)
```

### <a id="http2traceGot1xxResponseFunc" href="#http2traceGot1xxResponseFunc">func http2traceGot1xxResponseFunc(trace *httptrace.ClientTrace) func(int, textproto.MIMEHeader) error</a>

```
searchKey: http.http2traceGot1xxResponseFunc
tags: [private]
```

```Go
func http2traceGot1xxResponseFunc(trace *httptrace.ClientTrace) func(int, textproto.MIMEHeader) error
```

### <a id="http2curGoroutineID" href="#http2curGoroutineID">func http2curGoroutineID() uint64</a>

```
searchKey: http.http2curGoroutineID
tags: [private]
```

```Go
func http2curGoroutineID() uint64
```

### <a id="http2parseUintBytes" href="#http2parseUintBytes">func http2parseUintBytes(s []byte, base int, bitSize int) (n uint64, err error)</a>

```
searchKey: http.http2parseUintBytes
tags: [private]
```

```Go
func http2parseUintBytes(s []byte, base int, bitSize int) (n uint64, err error)
```

parseUintBytes is like strconv.ParseUint, but using a []byte. 

### <a id="http2cutoff64" href="#http2cutoff64">func http2cutoff64(base int) uint64</a>

```
searchKey: http.http2cutoff64
tags: [private]
```

```Go
func http2cutoff64(base int) uint64
```

Return the first number n such that n*base >= 1<<64. 

### <a id="http2buildCommonHeaderMapsOnce" href="#http2buildCommonHeaderMapsOnce">func http2buildCommonHeaderMapsOnce()</a>

```
searchKey: http.http2buildCommonHeaderMapsOnce
tags: [private]
```

```Go
func http2buildCommonHeaderMapsOnce()
```

### <a id="http2buildCommonHeaderMaps" href="#http2buildCommonHeaderMaps">func http2buildCommonHeaderMaps()</a>

```
searchKey: http.http2buildCommonHeaderMaps
tags: [private]
```

```Go
func http2buildCommonHeaderMaps()
```

### <a id="http2lowerHeader" href="#http2lowerHeader">func http2lowerHeader(v string) (lower string, ascii bool)</a>

```
searchKey: http.http2lowerHeader
tags: [private]
```

```Go
func http2lowerHeader(v string) (lower string, ascii bool)
```

### <a id="init.h2_bundle.go" href="#init.h2_bundle.go">func init()</a>

```
searchKey: http.init
tags: [private]
```

```Go
func init()
```

### <a id="http2validWireHeaderFieldName" href="#http2validWireHeaderFieldName">func http2validWireHeaderFieldName(v string) bool</a>

```
searchKey: http.http2validWireHeaderFieldName
tags: [private]
```

```Go
func http2validWireHeaderFieldName(v string) bool
```

validWireHeaderFieldName reports whether v is a valid header field name (key). See httpguts.ValidHeaderName for the base rules. 

Further, http2 says: 

```
"Just as in HTTP/1.x, header field names are strings of ASCII
characters that are compared in a case-insensitive
fashion. However, header field names MUST be converted to
lowercase prior to their encoding in HTTP/2. "

```
### <a id="http2httpCodeString" href="#http2httpCodeString">func http2httpCodeString(code int) string</a>

```
searchKey: http.http2httpCodeString
tags: [private]
```

```Go
func http2httpCodeString(code int) string
```

### <a id="http2mustUint31" href="#http2mustUint31">func http2mustUint31(v int32) uint32</a>

```
searchKey: http.http2mustUint31
tags: [private]
```

```Go
func http2mustUint31(v int32) uint32
```

### <a id="http2bodyAllowedForStatus" href="#http2bodyAllowedForStatus">func http2bodyAllowedForStatus(status int) bool</a>

```
searchKey: http.http2bodyAllowedForStatus
tags: [private]
```

```Go
func http2bodyAllowedForStatus(status int) bool
```

bodyAllowedForStatus reports whether a given response status code permits a body. See RFC 7230, section 3.3. 

### <a id="http2validPseudoPath" href="#http2validPseudoPath">func http2validPseudoPath(v string) bool</a>

```
searchKey: http.http2validPseudoPath
tags: [private]
```

```Go
func http2validPseudoPath(v string) bool
```

validPseudoPath reports whether v is a valid :path pseudo-header value. It must be either: 

```
*) a non-empty string starting with '/'
*) the string '*', for OPTIONS requests.

```
For now this is only used a quick check for deciding when to clean up Opaque URLs before sending requests from the Transport. See golang.org/issue/16847 

We used to enforce that the path also didn't start with "//", but Google's GFE accepts such paths and Chrome sends them, so ignore that part of the spec. See golang.org/issue/19103. 

### <a id="http2ConfigureServer" href="#http2ConfigureServer">func http2ConfigureServer(s *Server, conf *http2Server) error</a>

```
searchKey: http.http2ConfigureServer
tags: [private]
```

```Go
func http2ConfigureServer(s *Server, conf *http2Server) error
```

ConfigureServer adds HTTP/2 support to a net/http Server. 

The configuration conf may be nil. 

ConfigureServer must be called before s begins serving. 

### <a id="http2serverConnBaseContext" href="#http2serverConnBaseContext">func http2serverConnBaseContext(c net.Conn, opts *http2ServeConnOpts) (ctx context.Context, cancel func())</a>

```
searchKey: http.http2serverConnBaseContext
tags: [private]
```

```Go
func http2serverConnBaseContext(c net.Conn, opts *http2ServeConnOpts) (ctx context.Context, cancel func())
```

### <a id="http2errno" href="#http2errno">func http2errno(v error) uintptr</a>

```
searchKey: http.http2errno
tags: [private]
```

```Go
func http2errno(v error) uintptr
```

errno returns v's underlying uintptr, else 0. 

TODO: remove this helper function once http2 can use build tags. See comment in isClosedConnError. 

### <a id="http2isClosedConnError" href="#http2isClosedConnError">func http2isClosedConnError(err error) bool</a>

```
searchKey: http.http2isClosedConnError
tags: [private]
```

```Go
func http2isClosedConnError(err error) bool
```

isClosedConnError reports whether err is an error from use of a closed network connection. 

### <a id="http2checkPriority" href="#http2checkPriority">func http2checkPriority(streamID uint32, p http2PriorityParam) error</a>

```
searchKey: http.http2checkPriority
tags: [private]
```

```Go
func http2checkPriority(streamID uint32, p http2PriorityParam) error
```

### <a id="http2handleHeaderListTooLong" href="#http2handleHeaderListTooLong">func http2handleHeaderListTooLong(w ResponseWriter, r *Request)</a>

```
searchKey: http.http2handleHeaderListTooLong
tags: [private]
```

```Go
func http2handleHeaderListTooLong(w ResponseWriter, r *Request)
```

### <a id="http2checkWriteHeaderCode" href="#http2checkWriteHeaderCode">func http2checkWriteHeaderCode(code int)</a>

```
searchKey: http.http2checkWriteHeaderCode
tags: [private]
```

```Go
func http2checkWriteHeaderCode(code int)
```

checkWriteHeaderCode is a copy of net/http's checkWriteHeaderCode. 

### <a id="http2foreachHeaderElement" href="#http2foreachHeaderElement">func http2foreachHeaderElement(v string, fn func(string))</a>

```
searchKey: http.http2foreachHeaderElement
tags: [private]
```

```Go
func http2foreachHeaderElement(v string, fn func(string))
```

foreachHeaderElement splits v according to the "#rule" construction in RFC 7230 section 7 and calls fn for each non-empty element. 

### <a id="http2checkValidHTTP2RequestHeaders" href="#http2checkValidHTTP2RequestHeaders">func http2checkValidHTTP2RequestHeaders(h Header) error</a>

```
searchKey: http.http2checkValidHTTP2RequestHeaders
tags: [private]
```

```Go
func http2checkValidHTTP2RequestHeaders(h Header) error
```

checkValidHTTP2RequestHeaders checks whether h is a valid HTTP/2 request, per RFC 7540 Section 8.1.2.2. The returned error is reported to users. 

### <a id="http2h1ServerKeepAlivesDisabled" href="#http2h1ServerKeepAlivesDisabled">func http2h1ServerKeepAlivesDisabled(hs *Server) bool</a>

```
searchKey: http.http2h1ServerKeepAlivesDisabled
tags: [private]
```

```Go
func http2h1ServerKeepAlivesDisabled(hs *Server) bool
```

h1ServerKeepAlivesDisabled reports whether hs has its keep-alives disabled. See comments on h1ServerShutdownChan above for why the code is written this way. 

### <a id="http2ConfigureTransport" href="#http2ConfigureTransport">func http2ConfigureTransport(t1 *Transport) error</a>

```
searchKey: http.http2ConfigureTransport
tags: [private]
```

```Go
func http2ConfigureTransport(t1 *Transport) error
```

ConfigureTransport configures a net/http HTTP/1 Transport to use HTTP/2. It returns an error if t1 has already been HTTP/2-enabled. 

Use ConfigureTransports instead to configure the HTTP/2 Transport. 

### <a id="http2awaitRequestCancel" href="#http2awaitRequestCancel">func http2awaitRequestCancel(req *Request, done <-chan struct{}) error</a>

```
searchKey: http.http2awaitRequestCancel
tags: [private]
```

```Go
func http2awaitRequestCancel(req *Request, done <-chan struct{}) error
```

awaitRequestCancel waits for the user to cancel a request or for the done channel to be signaled. A non-nil error is returned only if the request was canceled. 

### <a id="http2isNoCachedConnError" href="#http2isNoCachedConnError">func http2isNoCachedConnError(err error) bool</a>

```
searchKey: http.http2isNoCachedConnError
tags: [private]
```

```Go
func http2isNoCachedConnError(err error) bool
```

isNoCachedConnError reports whether err is of type noCachedConnError or its equivalent renamed type in net/http2's h2_bundle.go. Both types may coexist in the same running program. 

### <a id="http2authorityAddr" href="#http2authorityAddr">func http2authorityAddr(scheme string, authority string) (addr string)</a>

```
searchKey: http.http2authorityAddr
tags: [private]
```

```Go
func http2authorityAddr(scheme string, authority string) (addr string)
```

authorityAddr returns a given authority (a host/IP, or host:port / ip:port) and returns a host:port. The port 443 is added if needed. 

### <a id="http2canRetryError" href="#http2canRetryError">func http2canRetryError(err error) bool</a>

```
searchKey: http.http2canRetryError
tags: [private]
```

```Go
func http2canRetryError(err error) bool
```

### <a id="http2commaSeparatedTrailers" href="#http2commaSeparatedTrailers">func http2commaSeparatedTrailers(req *Request) (string, error)</a>

```
searchKey: http.http2commaSeparatedTrailers
tags: [private]
```

```Go
func http2commaSeparatedTrailers(req *Request) (string, error)
```

### <a id="http2checkConnHeaders" href="#http2checkConnHeaders">func http2checkConnHeaders(req *Request) error</a>

```
searchKey: http.http2checkConnHeaders
tags: [private]
```

```Go
func http2checkConnHeaders(req *Request) error
```

checkConnHeaders checks whether req has any invalid connection-level headers. per RFC 7540 section 8.1.2.2: Connection-Specific Header Fields. Certain headers are special-cased as okay but not transmitted later. 

### <a id="http2actualContentLength" href="#http2actualContentLength">func http2actualContentLength(req *Request) int64</a>

```
searchKey: http.http2actualContentLength
tags: [private]
```

```Go
func http2actualContentLength(req *Request) int64
```

actualContentLength returns a sanitized version of req.ContentLength, where 0 actually means zero (not unknown) and -1 means unknown. 

### <a id="http2shouldSendReqContentLength" href="#http2shouldSendReqContentLength">func http2shouldSendReqContentLength(method string, contentLength int64) bool</a>

```
searchKey: http.http2shouldSendReqContentLength
tags: [private]
```

```Go
func http2shouldSendReqContentLength(method string, contentLength int64) bool
```

shouldSendReqContentLength reports whether the http2.Transport should send a "content-length" request header. This logic is basically a copy of the net/http transferWriter.shouldSendContentLength. The contentLength is the corrected contentLength (so 0 means actually 0, not unknown). -1 means unknown. 

### <a id="http2isEOFOrNetReadError" href="#http2isEOFOrNetReadError">func http2isEOFOrNetReadError(err error) bool</a>

```
searchKey: http.http2isEOFOrNetReadError
tags: [private]
```

```Go
func http2isEOFOrNetReadError(err error) bool
```

### <a id="http2strSliceContains" href="#http2strSliceContains">func http2strSliceContains(ss []string, s string) bool</a>

```
searchKey: http.http2strSliceContains
tags: [private]
```

```Go
func http2strSliceContains(ss []string, s string) bool
```

### <a id="http2isConnectionCloseRequest" href="#http2isConnectionCloseRequest">func http2isConnectionCloseRequest(req *Request) bool</a>

```
searchKey: http.http2isConnectionCloseRequest
tags: [private]
```

```Go
func http2isConnectionCloseRequest(req *Request) bool
```

isConnectionCloseRequest reports whether req should use its own connection for a single request and then close the connection. 

### <a id="http2registerHTTPSProtocol" href="#http2registerHTTPSProtocol">func http2registerHTTPSProtocol(t *Transport, rt http2noDialH2RoundTripper) (err error)</a>

```
searchKey: http.http2registerHTTPSProtocol
tags: [private]
```

```Go
func http2registerHTTPSProtocol(t *Transport, rt http2noDialH2RoundTripper) (err error)
```

registerHTTPSProtocol calls Transport.RegisterProtocol but converting panics into errors. 

### <a id="http2traceGetConn" href="#http2traceGetConn">func http2traceGetConn(req *Request, hostPort string)</a>

```
searchKey: http.http2traceGetConn
tags: [private]
```

```Go
func http2traceGetConn(req *Request, hostPort string)
```

### <a id="http2traceGotConn" href="#http2traceGotConn">func http2traceGotConn(req *Request, cc *http2ClientConn, reused bool)</a>

```
searchKey: http.http2traceGotConn
tags: [private]
```

```Go
func http2traceGotConn(req *Request, cc *http2ClientConn, reused bool)
```

### <a id="http2traceWroteHeaders" href="#http2traceWroteHeaders">func http2traceWroteHeaders(trace *httptrace.ClientTrace)</a>

```
searchKey: http.http2traceWroteHeaders
tags: [private]
```

```Go
func http2traceWroteHeaders(trace *httptrace.ClientTrace)
```

### <a id="http2traceGot100Continue" href="#http2traceGot100Continue">func http2traceGot100Continue(trace *httptrace.ClientTrace)</a>

```
searchKey: http.http2traceGot100Continue
tags: [private]
```

```Go
func http2traceGot100Continue(trace *httptrace.ClientTrace)
```

### <a id="http2traceWait100Continue" href="#http2traceWait100Continue">func http2traceWait100Continue(trace *httptrace.ClientTrace)</a>

```
searchKey: http.http2traceWait100Continue
tags: [private]
```

```Go
func http2traceWait100Continue(trace *httptrace.ClientTrace)
```

### <a id="http2traceWroteRequest" href="#http2traceWroteRequest">func http2traceWroteRequest(trace *httptrace.ClientTrace, err error)</a>

```
searchKey: http.http2traceWroteRequest
tags: [private]
```

```Go
func http2traceWroteRequest(trace *httptrace.ClientTrace, err error)
```

### <a id="http2traceFirstResponseByte" href="#http2traceFirstResponseByte">func http2traceFirstResponseByte(trace *httptrace.ClientTrace)</a>

```
searchKey: http.http2traceFirstResponseByte
tags: [private]
```

```Go
func http2traceFirstResponseByte(trace *httptrace.ClientTrace)
```

### <a id="http2writeEndsStream" href="#http2writeEndsStream">func http2writeEndsStream(w http2writeFramer) bool</a>

```
searchKey: http.http2writeEndsStream
tags: [private]
```

```Go
func http2writeEndsStream(w http2writeFramer) bool
```

writeEndsStream reports whether w writes a frame that will transition the stream to a half-closed local state. This returns false for RST_STREAM, which closes the entire stream (not just the local half). 

### <a id="http2splitHeaderBlock" href="#http2splitHeaderBlock">func http2splitHeaderBlock(ctx http2writeContext, headerBlock []byte, fn func(ctx http2writeContext, frag []byte, firstFrag, lastFrag bool) error) error</a>

```
searchKey: http.http2splitHeaderBlock
tags: [private]
```

```Go
func http2splitHeaderBlock(ctx http2writeContext, headerBlock []byte, fn func(ctx http2writeContext, frag []byte, firstFrag, lastFrag bool) error) error
```

splitHeaderBlock splits headerBlock into fragments so that each fragment fits in a single frame, then calls fn for each fragment. firstFrag/lastFrag are true for the first/last fragment, respectively. 

### <a id="http2encKV" href="#http2encKV">func http2encKV(enc *hpack.Encoder, k, v string)</a>

```
searchKey: http.http2encKV
tags: [private]
```

```Go
func http2encKV(enc *hpack.Encoder, k, v string)
```

### <a id="http2encodeHeaders" href="#http2encodeHeaders">func http2encodeHeaders(enc *hpack.Encoder, h Header, keys []string)</a>

```
searchKey: http.http2encodeHeaders
tags: [private]
```

```Go
func http2encodeHeaders(enc *hpack.Encoder, h Header, keys []string)
```

encodeHeaders encodes an http.Header. If keys is not nil, then (k, h[k]) is encoded only if k is in keys. 

### <a id="ParseTime" href="#ParseTime">func ParseTime(text string) (t time.Time, err error)</a>

```
searchKey: http.ParseTime
```

```Go
func ParseTime(text string) (t time.Time, err error)
```

ParseTime parses a time header (such as the Date: header), trying each of the three formats allowed by HTTP/1.1: TimeFormat, time.RFC850, and time.ANSIC. 

### <a id="CanonicalHeaderKey" href="#CanonicalHeaderKey">func CanonicalHeaderKey(s string) string</a>

```
searchKey: http.CanonicalHeaderKey
```

```Go
func CanonicalHeaderKey(s string) string
```

CanonicalHeaderKey returns the canonical format of the header key s. The canonicalization converts the first letter and any letter following a hyphen to upper case; the rest are converted to lowercase. For example, the canonical key for "accept-encoding" is "Accept-Encoding". If s contains a space or invalid header field bytes, it is returned without modifications. 

### <a id="hasToken" href="#hasToken">func hasToken(v, token string) bool</a>

```
searchKey: http.hasToken
tags: [private]
```

```Go
func hasToken(v, token string) bool
```

hasToken reports whether token appears with v, ASCII case-insensitive, with space or comma boundaries. token must be all lowercase. v may contain mixed cased. 

### <a id="isTokenBoundary" href="#isTokenBoundary">func isTokenBoundary(b byte) bool</a>

```
searchKey: http.isTokenBoundary
tags: [private]
```

```Go
func isTokenBoundary(b byte) bool
```

### <a id="hasPort" href="#hasPort">func hasPort(s string) bool</a>

```
searchKey: http.hasPort
tags: [private]
```

```Go
func hasPort(s string) bool
```

Given a string of the form "host", "host:port", or "[ipv6::address]:port", return true if the string includes a port. 

### <a id="removeEmptyPort" href="#removeEmptyPort">func removeEmptyPort(host string) string</a>

```
searchKey: http.removeEmptyPort
tags: [private]
```

```Go
func removeEmptyPort(host string) string
```

removeEmptyPort strips the empty port in ":port" to "" as mandated by RFC 3986 Section 6.2.3. 

### <a id="isNotToken" href="#isNotToken">func isNotToken(r rune) bool</a>

```
searchKey: http.isNotToken
tags: [private]
```

```Go
func isNotToken(r rune) bool
```

### <a id="stringContainsCTLByte" href="#stringContainsCTLByte">func stringContainsCTLByte(s string) bool</a>

```
searchKey: http.stringContainsCTLByte
tags: [private]
```

```Go
func stringContainsCTLByte(s string) bool
```

stringContainsCTLByte reports whether s contains any ASCII control character. 

### <a id="hexEscapeNonASCII" href="#hexEscapeNonASCII">func hexEscapeNonASCII(s string) string</a>

```
searchKey: http.hexEscapeNonASCII
tags: [private]
```

```Go
func hexEscapeNonASCII(s string) string
```

### <a id="badStringError" href="#badStringError">func badStringError(what, val string) error</a>

```
searchKey: http.badStringError
tags: [private]
```

```Go
func badStringError(what, val string) error
```

### <a id="valueOrDefault" href="#valueOrDefault">func valueOrDefault(value, def string) string</a>

```
searchKey: http.valueOrDefault
tags: [private]
```

```Go
func valueOrDefault(value, def string) string
```

Return value if nonempty, def otherwise. 

### <a id="idnaASCII" href="#idnaASCII">func idnaASCII(v string) (string, error)</a>

```
searchKey: http.idnaASCII
tags: [private]
```

```Go
func idnaASCII(v string) (string, error)
```

### <a id="cleanHost" href="#cleanHost">func cleanHost(in string) string</a>

```
searchKey: http.cleanHost
tags: [private]
```

```Go
func cleanHost(in string) string
```

cleanHost cleans up the host sent in request's Host header. 

It both strips anything after '/' or ' ', and puts the value into Punycode form, if necessary. 

Ideally we'd clean the Host header according to the spec: 

```
[https://tools.ietf.org/html/rfc7230#section-5.4](https://tools.ietf.org/html/rfc7230#section-5.4) (Host = uri-host [ ":" port ]")
[https://tools.ietf.org/html/rfc7230#section-2.7](https://tools.ietf.org/html/rfc7230#section-2.7) (uri-host -> rfc3986's host)
[https://tools.ietf.org/html/rfc3986#section-3.2.2](https://tools.ietf.org/html/rfc3986#section-3.2.2) (definition of host)

```
But practically, what we are trying to avoid is the situation in issue 11206, where a malformed Host header used in the proxy context would create a bad request. So it is enough to just truncate at the first offending character. 

### <a id="removeZone" href="#removeZone">func removeZone(host string) string</a>

```
searchKey: http.removeZone
tags: [private]
```

```Go
func removeZone(host string) string
```

removeZone removes IPv6 zone identifier from host. E.g., "[fe80::1%en0]:8080" to "[fe80::1]:8080" 

### <a id="ParseHTTPVersion" href="#ParseHTTPVersion">func ParseHTTPVersion(vers string) (major, minor int, ok bool)</a>

```
searchKey: http.ParseHTTPVersion
```

```Go
func ParseHTTPVersion(vers string) (major, minor int, ok bool)
```

ParseHTTPVersion parses an HTTP version string. "HTTP/1.0" returns (1, 0, true). Note that strings without a minor version, such as "HTTP/2", are not valid. 

### <a id="validMethod" href="#validMethod">func validMethod(method string) bool</a>

```
searchKey: http.validMethod
tags: [private]
```

```Go
func validMethod(method string) bool
```

### <a id="parseBasicAuth" href="#parseBasicAuth">func parseBasicAuth(auth string) (username, password string, ok bool)</a>

```
searchKey: http.parseBasicAuth
tags: [private]
```

```Go
func parseBasicAuth(auth string) (username, password string, ok bool)
```

parseBasicAuth parses an HTTP Basic Authentication string. "Basic QWxhZGRpbjpvcGVuIHNlc2FtZQ==" returns ("Aladdin", "open sesame", true). 

### <a id="parseRequestLine" href="#parseRequestLine">func parseRequestLine(line string) (method, requestURI, proto string, ok bool)</a>

```
searchKey: http.parseRequestLine
tags: [private]
```

```Go
func parseRequestLine(line string) (method, requestURI, proto string, ok bool)
```

parseRequestLine parses "GET /foo HTTP/1.1" into its three parts. 

### <a id="newTextprotoReader" href="#newTextprotoReader">func newTextprotoReader(br *bufio.Reader) *textproto.Reader</a>

```
searchKey: http.newTextprotoReader
tags: [private]
```

```Go
func newTextprotoReader(br *bufio.Reader) *textproto.Reader
```

### <a id="putTextprotoReader" href="#putTextprotoReader">func putTextprotoReader(r *textproto.Reader)</a>

```
searchKey: http.putTextprotoReader
tags: [private]
```

```Go
func putTextprotoReader(r *textproto.Reader)
```

### <a id="MaxBytesReader" href="#MaxBytesReader">func MaxBytesReader(w ResponseWriter, r io.ReadCloser, n int64) io.ReadCloser</a>

```
searchKey: http.MaxBytesReader
```

```Go
func MaxBytesReader(w ResponseWriter, r io.ReadCloser, n int64) io.ReadCloser
```

MaxBytesReader is similar to io.LimitReader but is intended for limiting the size of incoming request bodies. In contrast to io.LimitReader, MaxBytesReader's result is a ReadCloser, returns a non-EOF error for a Read beyond the limit, and closes the underlying reader when its Close method is called. 

MaxBytesReader prevents clients from accidentally or maliciously sending a large request and wasting server resources. 

### <a id="copyValues" href="#copyValues">func copyValues(dst, src url.Values)</a>

```
searchKey: http.copyValues
tags: [private]
```

```Go
func copyValues(dst, src url.Values)
```

### <a id="parsePostForm" href="#parsePostForm">func parsePostForm(r *Request) (vs url.Values, err error)</a>

```
searchKey: http.parsePostForm
tags: [private]
```

```Go
func parsePostForm(r *Request) (vs url.Values, err error)
```

### <a id="requestMethodUsuallyLacksBody" href="#requestMethodUsuallyLacksBody">func requestMethodUsuallyLacksBody(method string) bool</a>

```
searchKey: http.requestMethodUsuallyLacksBody
tags: [private]
```

```Go
func requestMethodUsuallyLacksBody(method string) bool
```

requestMethodUsuallyLacksBody reports whether the given request method is one that typically does not involve a request body. This is used by the Transport (via transferWriter.shouldSendChunkedRequestBody) to determine whether we try to test-read a byte from a non-nil Request.Body when Request.outgoingLength() returns -1. See the comments in shouldSendChunkedRequestBody. 

### <a id="fixPragmaCacheControl" href="#fixPragmaCacheControl">func fixPragmaCacheControl(header Header)</a>

```
searchKey: http.fixPragmaCacheControl
tags: [private]
```

```Go
func fixPragmaCacheControl(header Header)
```

RFC 7234, section 5.4: Should treat 

```
Pragma: no-cache

```
like 

```
Cache-Control: no-cache

```
### <a id="isProtocolSwitchResponse" href="#isProtocolSwitchResponse">func isProtocolSwitchResponse(code int, h Header) bool</a>

```
searchKey: http.isProtocolSwitchResponse
tags: [private]
```

```Go
func isProtocolSwitchResponse(code int, h Header) bool
```

isProtocolSwitchResponse reports whether the response code and response header indicate a successful protocol upgrade response. 

### <a id="isProtocolSwitchHeader" href="#isProtocolSwitchHeader">func isProtocolSwitchHeader(h Header) bool</a>

```
searchKey: http.isProtocolSwitchHeader
tags: [private]
```

```Go
func isProtocolSwitchHeader(h Header) bool
```

isProtocolSwitchHeader reports whether the request or response header is for a protocol switch. 

### <a id="bufioWriterPool" href="#bufioWriterPool">func bufioWriterPool(size int) *sync.Pool</a>

```
searchKey: http.bufioWriterPool
tags: [private]
```

```Go
func bufioWriterPool(size int) *sync.Pool
```

### <a id="newBufioReader" href="#newBufioReader">func newBufioReader(r io.Reader) *bufio.Reader</a>

```
searchKey: http.newBufioReader
tags: [private]
```

```Go
func newBufioReader(r io.Reader) *bufio.Reader
```

### <a id="putBufioReader" href="#putBufioReader">func putBufioReader(br *bufio.Reader)</a>

```
searchKey: http.putBufioReader
tags: [private]
```

```Go
func putBufioReader(br *bufio.Reader)
```

### <a id="newBufioWriterSize" href="#newBufioWriterSize">func newBufioWriterSize(w io.Writer, size int) *bufio.Writer</a>

```
searchKey: http.newBufioWriterSize
tags: [private]
```

```Go
func newBufioWriterSize(w io.Writer, size int) *bufio.Writer
```

### <a id="putBufioWriter" href="#putBufioWriter">func putBufioWriter(bw *bufio.Writer)</a>

```
searchKey: http.putBufioWriter
tags: [private]
```

```Go
func putBufioWriter(bw *bufio.Writer)
```

### <a id="appendTime" href="#appendTime">func appendTime(b []byte, t time.Time) []byte</a>

```
searchKey: http.appendTime
tags: [private]
```

```Go
func appendTime(b []byte, t time.Time) []byte
```

appendTime is a non-allocating version of []byte(t.UTC().Format(TimeFormat)) 

### <a id="http1ServerSupportsRequest" href="#http1ServerSupportsRequest">func http1ServerSupportsRequest(req *Request) bool</a>

```
searchKey: http.http1ServerSupportsRequest
tags: [private]
```

```Go
func http1ServerSupportsRequest(req *Request) bool
```

http1ServerSupportsRequest reports whether Go's HTTP/1.x server supports the given request. 

### <a id="checkWriteHeaderCode" href="#checkWriteHeaderCode">func checkWriteHeaderCode(code int)</a>

```
searchKey: http.checkWriteHeaderCode
tags: [private]
```

```Go
func checkWriteHeaderCode(code int)
```

### <a id="relevantCaller" href="#relevantCaller">func relevantCaller() runtime.Frame</a>

```
searchKey: http.relevantCaller
tags: [private]
```

```Go
func relevantCaller() runtime.Frame
```

relevantCaller searches the call stack for the first function outside of net/http. The purpose of this function is to provide more helpful error messages. 

### <a id="foreachHeaderElement" href="#foreachHeaderElement">func foreachHeaderElement(v string, fn func(string))</a>

```
searchKey: http.foreachHeaderElement
tags: [private]
```

```Go
func foreachHeaderElement(v string, fn func(string))
```

foreachHeaderElement splits v according to the "#rule" construction in RFC 7230 section 7 and calls fn for each non-empty element. 

### <a id="writeStatusLine" href="#writeStatusLine">func writeStatusLine(bw *bufio.Writer, is11 bool, code int, scratch []byte)</a>

```
searchKey: http.writeStatusLine
tags: [private]
```

```Go
func writeStatusLine(bw *bufio.Writer, is11 bool, code int, scratch []byte)
```

writeStatusLine writes an HTTP/1.x Status-Line (RFC 7230 Section 3.1.2) to bw. is11 is whether the HTTP request is HTTP/1.1. false means HTTP/1.0. code is the response status code. scratch is an optional scratch buffer. If it has at least capacity 3, it's used. 

### <a id="validNextProto" href="#validNextProto">func validNextProto(proto string) bool</a>

```
searchKey: http.validNextProto
tags: [private]
```

```Go
func validNextProto(proto string) bool
```

validNextProto reports whether the proto is a valid ALPN protocol name. Everything is valid except the empty string and built-in protocol types, so that those can't be overridden with alternate implementations. 

### <a id="badRequestError" href="#badRequestError">func badRequestError(e string) error</a>

```
searchKey: http.badRequestError
tags: [private]
```

```Go
func badRequestError(e string) error
```

badRequestError is a literal string (used by in the server in HTML, unescaped) to tell the user why their request was bad. It should be plain text without user info or other embedded errors. 

### <a id="isCommonNetReadError" href="#isCommonNetReadError">func isCommonNetReadError(err error) bool</a>

```
searchKey: http.isCommonNetReadError
tags: [private]
```

```Go
func isCommonNetReadError(err error) bool
```

isCommonNetReadError reports whether err is a common error encountered during reading a request off the network when the client has gone away or had its read fail somehow. This is used to determine which logs are interesting enough to log about. 

### <a id="registerOnHitEOF" href="#registerOnHitEOF">func registerOnHitEOF(rc io.ReadCloser, fn func())</a>

```
searchKey: http.registerOnHitEOF
tags: [private]
```

```Go
func registerOnHitEOF(rc io.ReadCloser, fn func())
```

### <a id="requestBodyRemains" href="#requestBodyRemains">func requestBodyRemains(rc io.ReadCloser) bool</a>

```
searchKey: http.requestBodyRemains
tags: [private]
```

```Go
func requestBodyRemains(rc io.ReadCloser) bool
```

requestBodyRemains reports whether future calls to Read on rc might yield more data. 

### <a id="Error" href="#Error">func Error(w ResponseWriter, error string, code int)</a>

```
searchKey: http.Error
```

```Go
func Error(w ResponseWriter, error string, code int)
```

Error replies to the request with the specified error message and HTTP code. It does not otherwise end the request; the caller should ensure no further writes are done to w. The error message should be plain text. 

### <a id="NotFound" href="#NotFound">func NotFound(w ResponseWriter, r *Request)</a>

```
searchKey: http.NotFound
```

```Go
func NotFound(w ResponseWriter, r *Request)
```

NotFound replies to the request with an HTTP 404 not found error. 

### <a id="Redirect" href="#Redirect">func Redirect(w ResponseWriter, r *Request, url string, code int)</a>

```
searchKey: http.Redirect
```

```Go
func Redirect(w ResponseWriter, r *Request, url string, code int)
```

Redirect replies to the request with a redirect to url, which may be a path relative to the request path. 

The provided code should be in the 3xx range and is usually StatusMovedPermanently, StatusFound or StatusSeeOther. 

If the Content-Type header has not been set, Redirect sets it to "text/html; charset=utf-8" and writes a small HTML body. Setting the Content-Type header to any value, including nil, disables that behavior. 

### <a id="htmlEscape" href="#htmlEscape">func htmlEscape(s string) string</a>

```
searchKey: http.htmlEscape
tags: [private]
```

```Go
func htmlEscape(s string) string
```

### <a id="cleanPath" href="#cleanPath">func cleanPath(p string) string</a>

```
searchKey: http.cleanPath
tags: [private]
```

```Go
func cleanPath(p string) string
```

cleanPath returns the canonical path for p, eliminating . and .. elements. 

### <a id="stripHostPort" href="#stripHostPort">func stripHostPort(h string) string</a>

```
searchKey: http.stripHostPort
tags: [private]
```

```Go
func stripHostPort(h string) string
```

stripHostPort returns h without any trailing ":<port>". 

### <a id="appendSorted" href="#appendSorted">func appendSorted(es []muxEntry, e muxEntry) []muxEntry</a>

```
searchKey: http.appendSorted
tags: [private]
```

```Go
func appendSorted(es []muxEntry, e muxEntry) []muxEntry
```

### <a id="Handle" href="#Handle">func Handle(pattern string, handler Handler)</a>

```
searchKey: http.Handle
```

```Go
func Handle(pattern string, handler Handler)
```

Handle registers the handler for the given pattern in the DefaultServeMux. The documentation for ServeMux explains how patterns are matched. 

### <a id="HandleFunc" href="#HandleFunc">func HandleFunc(pattern string, handler func(ResponseWriter, *Request))</a>

```
searchKey: http.HandleFunc
```

```Go
func HandleFunc(pattern string, handler func(ResponseWriter, *Request))
```

HandleFunc registers the handler function for the given pattern in the DefaultServeMux. The documentation for ServeMux explains how patterns are matched. 

### <a id="Serve" href="#Serve">func Serve(l net.Listener, handler Handler) error</a>

```
searchKey: http.Serve
```

```Go
func Serve(l net.Listener, handler Handler) error
```

Serve accepts incoming HTTP connections on the listener l, creating a new service goroutine for each. The service goroutines read requests and then call handler to reply to them. 

The handler is typically nil, in which case the DefaultServeMux is used. 

HTTP/2 support is only enabled if the Listener returns *tls.Conn connections and they were configured with "h2" in the TLS Config.NextProtos. 

Serve always returns a non-nil error. 

### <a id="ServeTLS" href="#ServeTLS">func ServeTLS(l net.Listener, handler Handler, certFile, keyFile string) error</a>

```
searchKey: http.ServeTLS
```

```Go
func ServeTLS(l net.Listener, handler Handler, certFile, keyFile string) error
```

ServeTLS accepts incoming HTTPS connections on the listener l, creating a new service goroutine for each. The service goroutines read requests and then call handler to reply to them. 

The handler is typically nil, in which case the DefaultServeMux is used. 

Additionally, files containing a certificate and matching private key for the server must be provided. If the certificate is signed by a certificate authority, the certFile should be the concatenation of the server's certificate, any intermediates, and the CA's certificate. 

ServeTLS always returns a non-nil error. 

### <a id="logf" href="#logf">func logf(r *Request, format string, args ...interface{})</a>

```
searchKey: http.logf
tags: [private]
```

```Go
func logf(r *Request, format string, args ...interface{})
```

logf prints to the ErrorLog of the *Server associated with request r via ServerContextKey. If there's no associated server, or if ErrorLog is nil, logging is done via the log package's standard logger. 

### <a id="ListenAndServe" href="#ListenAndServe">func ListenAndServe(addr string, handler Handler) error</a>

```
searchKey: http.ListenAndServe
```

```Go
func ListenAndServe(addr string, handler Handler) error
```

ListenAndServe listens on the TCP network address addr and then calls Serve with handler to handle requests on incoming connections. Accepted connections are configured to enable TCP keep-alives. 

The handler is typically nil, in which case the DefaultServeMux is used. 

ListenAndServe always returns a non-nil error. 

### <a id="ListenAndServeTLS" href="#ListenAndServeTLS">func ListenAndServeTLS(addr, certFile, keyFile string, handler Handler) error</a>

```
searchKey: http.ListenAndServeTLS
```

```Go
func ListenAndServeTLS(addr, certFile, keyFile string, handler Handler) error
```

ListenAndServeTLS acts identically to ListenAndServe, except that it expects HTTPS connections. Additionally, files containing a certificate and matching private key for the server must be provided. If the certificate is signed by a certificate authority, the certFile should be the concatenation of the server's certificate, any intermediates, and the CA's certificate. 

### <a id="newLoggingConn" href="#newLoggingConn">func newLoggingConn(baseName string, c net.Conn) net.Conn</a>

```
searchKey: http.newLoggingConn
tags: [private]
```

```Go
func newLoggingConn(baseName string, c net.Conn) net.Conn
```

### <a id="numLeadingCRorLF" href="#numLeadingCRorLF">func numLeadingCRorLF(v []byte) (n int)</a>

```
searchKey: http.numLeadingCRorLF
tags: [private]
```

```Go
func numLeadingCRorLF(v []byte) (n int)
```

### <a id="strSliceContains" href="#strSliceContains">func strSliceContains(ss []string, s string) bool</a>

```
searchKey: http.strSliceContains
tags: [private]
```

```Go
func strSliceContains(ss []string, s string) bool
```

### <a id="tlsRecordHeaderLooksLikeHTTP" href="#tlsRecordHeaderLooksLikeHTTP">func tlsRecordHeaderLooksLikeHTTP(hdr [5]byte) bool</a>

```
searchKey: http.tlsRecordHeaderLooksLikeHTTP
tags: [private]
```

```Go
func tlsRecordHeaderLooksLikeHTTP(hdr [5]byte) bool
```

tlsRecordHeaderLooksLikeHTTP reports whether a TLS record header looks like it might've been a misdirected plaintext HTTP request. 

### <a id="DetectContentType" href="#DetectContentType">func DetectContentType(data []byte) string</a>

```
searchKey: http.DetectContentType
```

```Go
func DetectContentType(data []byte) string
```

DetectContentType implements the algorithm described at [https://mimesniff.spec.whatwg.org/](https://mimesniff.spec.whatwg.org/) to determine the Content-Type of the given data. It considers at most the first 512 bytes of data. DetectContentType always returns a valid MIME type: if it cannot determine a more specific one, it returns "application/octet-stream". 

### <a id="isWS" href="#isWS">func isWS(b byte) bool</a>

```
searchKey: http.isWS
tags: [private]
```

```Go
func isWS(b byte) bool
```

isWS reports whether the provided byte is a whitespace byte (0xWS) as defined in [https://mimesniff.spec.whatwg.org/#terminology](https://mimesniff.spec.whatwg.org/#terminology). 

### <a id="isTT" href="#isTT">func isTT(b byte) bool</a>

```
searchKey: http.isTT
tags: [private]
```

```Go
func isTT(b byte) bool
```

isTT reports whether the provided byte is a tag-terminating byte (0xTT) as defined in [https://mimesniff.spec.whatwg.org/#terminology](https://mimesniff.spec.whatwg.org/#terminology). 

### <a id="sockssplitHostPort" href="#sockssplitHostPort">func sockssplitHostPort(address string) (string, int, error)</a>

```
searchKey: http.sockssplitHostPort
tags: [private]
```

```Go
func sockssplitHostPort(address string) (string, int, error)
```

### <a id="StatusText" href="#StatusText">func StatusText(code int) string</a>

```
searchKey: http.StatusText
```

```Go
func StatusText(code int) string
```

StatusText returns a text for the HTTP status code. It returns the empty string if the code is unknown. 

### <a id="noResponseBodyExpected" href="#noResponseBodyExpected">func noResponseBodyExpected(requestMethod string) bool</a>

```
searchKey: http.noResponseBodyExpected
tags: [private]
```

```Go
func noResponseBodyExpected(requestMethod string) bool
```

### <a id="bodyAllowedForStatus" href="#bodyAllowedForStatus">func bodyAllowedForStatus(status int) bool</a>

```
searchKey: http.bodyAllowedForStatus
tags: [private]
```

```Go
func bodyAllowedForStatus(status int) bool
```

bodyAllowedForStatus reports whether a given response status code permits a body. See RFC 7230, section 3.3. 

### <a id="suppressedHeaders" href="#suppressedHeaders">func suppressedHeaders(status int) []string</a>

```
searchKey: http.suppressedHeaders
tags: [private]
```

```Go
func suppressedHeaders(status int) []string
```

### <a id="readTransfer" href="#readTransfer">func readTransfer(msg interface{}, r *bufio.Reader) (err error)</a>

```
searchKey: http.readTransfer
tags: [private]
```

```Go
func readTransfer(msg interface{}, r *bufio.Reader) (err error)
```

msg is *Request or *Response. 

### <a id="chunked" href="#chunked">func chunked(te []string) bool</a>

```
searchKey: http.chunked
tags: [private]
```

```Go
func chunked(te []string) bool
```

Checks whether chunked is part of the encodings stack 

### <a id="isIdentity" href="#isIdentity">func isIdentity(te []string) bool</a>

```
searchKey: http.isIdentity
tags: [private]
```

```Go
func isIdentity(te []string) bool
```

Checks whether the encoding is explicitly "identity". 

### <a id="isUnsupportedTEError" href="#isUnsupportedTEError">func isUnsupportedTEError(err error) bool</a>

```
searchKey: http.isUnsupportedTEError
tags: [private]
```

```Go
func isUnsupportedTEError(err error) bool
```

isUnsupportedTEError checks if the error is of type unsupportedTEError. It is usually invoked with a non-nil err. 

### <a id="fixLength" href="#fixLength">func fixLength(isResponse bool, status int, requestMethod string, header Header, chunked bool) (int64, error)</a>

```
searchKey: http.fixLength
tags: [private]
```

```Go
func fixLength(isResponse bool, status int, requestMethod string, header Header, chunked bool) (int64, error)
```

Determine the expected body length, using RFC 7230 Section 3.3. This function is not a method, because ultimately it should be shared by ReadResponse and ReadRequest. 

### <a id="shouldClose" href="#shouldClose">func shouldClose(major, minor int, header Header, removeCloseHeader bool) bool</a>

```
searchKey: http.shouldClose
tags: [private]
```

```Go
func shouldClose(major, minor int, header Header, removeCloseHeader bool) bool
```

Determine whether to hang up after sending a request and body, or receiving a response and body 'header' is the request headers 

### <a id="seeUpcomingDoubleCRLF" href="#seeUpcomingDoubleCRLF">func seeUpcomingDoubleCRLF(r *bufio.Reader) bool</a>

```
searchKey: http.seeUpcomingDoubleCRLF
tags: [private]
```

```Go
func seeUpcomingDoubleCRLF(r *bufio.Reader) bool
```

### <a id="mergeSetHeader" href="#mergeSetHeader">func mergeSetHeader(dst *Header, src Header)</a>

```
searchKey: http.mergeSetHeader
tags: [private]
```

```Go
func mergeSetHeader(dst *Header, src Header)
```

### <a id="parseContentLength" href="#parseContentLength">func parseContentLength(cl string) (int64, error)</a>

```
searchKey: http.parseContentLength
tags: [private]
```

```Go
func parseContentLength(cl string) (int64, error)
```

parseContentLength trims whitespace from s and returns -1 if no value is set, or the value if it's >= 0. 

### <a id="isKnownInMemoryReader" href="#isKnownInMemoryReader">func isKnownInMemoryReader(r io.Reader) bool</a>

```
searchKey: http.isKnownInMemoryReader
tags: [private]
```

```Go
func isKnownInMemoryReader(r io.Reader) bool
```

isKnownInMemoryReader reports whether r is a type known to not block on Read. Its caller uses this as an optional optimization to send fewer TCP packets. 

### <a id="ProxyFromEnvironment" href="#ProxyFromEnvironment">func ProxyFromEnvironment(req *Request) (*url.URL, error)</a>

```
searchKey: http.ProxyFromEnvironment
```

```Go
func ProxyFromEnvironment(req *Request) (*url.URL, error)
```

ProxyFromEnvironment returns the URL of the proxy to use for a given request, as indicated by the environment variables HTTP_PROXY, HTTPS_PROXY and NO_PROXY (or the lowercase versions thereof). HTTPS_PROXY takes precedence over HTTP_PROXY for https requests. 

The environment values may be either a complete URL or a "host[:port]", in which case the "http" scheme is assumed. An error is returned if the value is a different form. 

A nil URL and nil error are returned if no proxy is defined in the environment, or a proxy should not be used for the given request, as defined by NO_PROXY. 

As a special case, if req.URL.Host is "localhost" (with or without a port number), then a nil URL and nil error will be returned. 

### <a id="ProxyURL" href="#ProxyURL">func ProxyURL(fixedURL *url.URL) func(*Request) (*url.URL, error)</a>

```
searchKey: http.ProxyURL
```

```Go
func ProxyURL(fixedURL *url.URL) func(*Request) (*url.URL, error)
```

ProxyURL returns a proxy function (for use in a Transport) that always returns the same URL. 

### <a id="envProxyFunc" href="#envProxyFunc">func envProxyFunc() func(*url.URL) (*url.URL, error)</a>

```
searchKey: http.envProxyFunc
tags: [private]
```

```Go
func envProxyFunc() func(*url.URL) (*url.URL, error)
```

defaultProxyConfig returns a ProxyConfig value looked up from the environment. This mitigates expensive lookups on some platforms (e.g. Windows). 

### <a id="resetProxyConfig" href="#resetProxyConfig">func resetProxyConfig()</a>

```
searchKey: http.resetProxyConfig
tags: [private]
```

```Go
func resetProxyConfig()
```

resetProxyConfig is used by tests. 

### <a id="is408Message" href="#is408Message">func is408Message(buf []byte) bool</a>

```
searchKey: http.is408Message
tags: [private]
```

```Go
func is408Message(buf []byte) bool
```

is408Message reports whether buf has the prefix of an HTTP 408 Request Timeout response. See golang.org/issue/32310. 

### <a id="newReadWriteCloserBody" href="#newReadWriteCloserBody">func newReadWriteCloserBody(br *bufio.Reader, rwc io.ReadWriteCloser) io.ReadWriteCloser</a>

```
searchKey: http.newReadWriteCloserBody
tags: [private]
```

```Go
func newReadWriteCloserBody(br *bufio.Reader, rwc io.ReadWriteCloser) io.ReadWriteCloser
```

### <a id="nop" href="#nop">func nop()</a>

```
searchKey: http.nop
tags: [private]
```

```Go
func nop()
```

### <a id="canonicalAddr" href="#canonicalAddr">func canonicalAddr(url *url.URL) string</a>

```
searchKey: http.canonicalAddr
tags: [private]
```

```Go
func canonicalAddr(url *url.URL) string
```

canonicalAddr returns url.Host but always with a ":port" suffix 

### <a id="cloneTLSConfig" href="#cloneTLSConfig">func cloneTLSConfig(cfg *tls.Config) *tls.Config</a>

```
searchKey: http.cloneTLSConfig
tags: [private]
```

```Go
func cloneTLSConfig(cfg *tls.Config) *tls.Config
```

cloneTLSConfig returns a shallow clone of cfg, or a new zero tls.Config if cfg is nil. This is safe to call even if cfg is in active use by a TLS client or server. 

### <a id="TestWriteSetCookies" href="#TestWriteSetCookies">func TestWriteSetCookies(t *testing.T)</a>

```
searchKey: http.TestWriteSetCookies
tags: [private]
```

```Go
func TestWriteSetCookies(t *testing.T)
```

### <a id="TestSetCookie" href="#TestSetCookie">func TestSetCookie(t *testing.T)</a>

```
searchKey: http.TestSetCookie
tags: [private]
```

```Go
func TestSetCookie(t *testing.T)
```

### <a id="TestAddCookie" href="#TestAddCookie">func TestAddCookie(t *testing.T)</a>

```
searchKey: http.TestAddCookie
tags: [private]
```

```Go
func TestAddCookie(t *testing.T)
```

### <a id="toJSON" href="#toJSON">func toJSON(v interface{}) string</a>

```
searchKey: http.toJSON
tags: [private]
```

```Go
func toJSON(v interface{}) string
```

### <a id="TestReadSetCookies" href="#TestReadSetCookies">func TestReadSetCookies(t *testing.T)</a>

```
searchKey: http.TestReadSetCookies
tags: [private]
```

```Go
func TestReadSetCookies(t *testing.T)
```

### <a id="TestReadCookies" href="#TestReadCookies">func TestReadCookies(t *testing.T)</a>

```
searchKey: http.TestReadCookies
tags: [private]
```

```Go
func TestReadCookies(t *testing.T)
```

### <a id="TestSetCookieDoubleQuotes" href="#TestSetCookieDoubleQuotes">func TestSetCookieDoubleQuotes(t *testing.T)</a>

```
searchKey: http.TestSetCookieDoubleQuotes
tags: [private]
```

```Go
func TestSetCookieDoubleQuotes(t *testing.T)
```

### <a id="TestCookieSanitizeValue" href="#TestCookieSanitizeValue">func TestCookieSanitizeValue(t *testing.T)</a>

```
searchKey: http.TestCookieSanitizeValue
tags: [private]
```

```Go
func TestCookieSanitizeValue(t *testing.T)
```

### <a id="TestCookieSanitizePath" href="#TestCookieSanitizePath">func TestCookieSanitizePath(t *testing.T)</a>

```
searchKey: http.TestCookieSanitizePath
tags: [private]
```

```Go
func TestCookieSanitizePath(t *testing.T)
```

### <a id="BenchmarkCookieString" href="#BenchmarkCookieString">func BenchmarkCookieString(b *testing.B)</a>

```
searchKey: http.BenchmarkCookieString
tags: [private]
```

```Go
func BenchmarkCookieString(b *testing.B)
```

### <a id="BenchmarkReadSetCookies" href="#BenchmarkReadSetCookies">func BenchmarkReadSetCookies(b *testing.B)</a>

```
searchKey: http.BenchmarkReadSetCookies
tags: [private]
```

```Go
func BenchmarkReadSetCookies(b *testing.B)
```

### <a id="BenchmarkReadCookies" href="#BenchmarkReadCookies">func BenchmarkReadCookies(b *testing.B)</a>

```
searchKey: http.BenchmarkReadCookies
tags: [private]
```

```Go
func BenchmarkReadCookies(b *testing.B)
```

### <a id="init.export_test.go" href="#init.export_test.go">func init()</a>

```
searchKey: http.init
tags: [private]
```

```Go
func init()
```

### <a id="CondSkipHTTP2" href="#CondSkipHTTP2">func CondSkipHTTP2(t *testing.T)</a>

```
searchKey: http.CondSkipHTTP2
tags: [private]
```

```Go
func CondSkipHTTP2(t *testing.T)
```

### <a id="SetReadLoopBeforeNextReadHook" href="#SetReadLoopBeforeNextReadHook">func SetReadLoopBeforeNextReadHook(f func())</a>

```
searchKey: http.SetReadLoopBeforeNextReadHook
tags: [private]
```

```Go
func SetReadLoopBeforeNextReadHook(f func())
```

### <a id="SetPendingDialHooks" href="#SetPendingDialHooks">func SetPendingDialHooks(before, after func())</a>

```
searchKey: http.SetPendingDialHooks
tags: [private]
```

```Go
func SetPendingDialHooks(before, after func())
```

SetPendingDialHooks sets the hooks that run before and after handling pending dials. 

### <a id="SetTestHookServerServe" href="#SetTestHookServerServe">func SetTestHookServerServe(fn func(*Server, net.Listener))</a>

```
searchKey: http.SetTestHookServerServe
tags: [private]
```

```Go
func SetTestHookServerServe(fn func(*Server, net.Listener))
```

### <a id="ResetCachedEnvironment" href="#ResetCachedEnvironment">func ResetCachedEnvironment()</a>

```
searchKey: http.ResetCachedEnvironment
tags: [private]
```

```Go
func ResetCachedEnvironment()
```

### <a id="unnilTestHook" href="#unnilTestHook">func unnilTestHook(f *func())</a>

```
searchKey: http.unnilTestHook
tags: [private]
```

```Go
func unnilTestHook(f *func())
```

All test hooks must be non-nil so they can be called directly, but the tests use nil to mean hook disabled. 

### <a id="hookSetter" href="#hookSetter">func hookSetter(dst *func()) func(func())</a>

```
searchKey: http.hookSetter
tags: [private]
```

```Go
func hookSetter(dst *func()) func(func())
```

### <a id="ExportHttp2ConfigureTransport" href="#ExportHttp2ConfigureTransport">func ExportHttp2ConfigureTransport(t *Transport) error</a>

```
searchKey: http.ExportHttp2ConfigureTransport
tags: [private]
```

```Go
func ExportHttp2ConfigureTransport(t *Transport) error
```

### <a id="ExportSetH2GoawayTimeout" href="#ExportSetH2GoawayTimeout">func ExportSetH2GoawayTimeout(d time.Duration) (restore func())</a>

```
searchKey: http.ExportSetH2GoawayTimeout
tags: [private]
```

```Go
func ExportSetH2GoawayTimeout(d time.Duration) (restore func())
```

### <a id="ExportCloseTransportConnsAbruptly" href="#ExportCloseTransportConnsAbruptly">func ExportCloseTransportConnsAbruptly(tr *Transport)</a>

```
searchKey: http.ExportCloseTransportConnsAbruptly
tags: [private]
```

```Go
func ExportCloseTransportConnsAbruptly(tr *Transport)
```

ExportCloseTransportConnsAbruptly closes all idle connections from tr in an abrupt way, just reaching into the underlying Conns and closing them, without telling the Transport or its persistConns that it's doing so. This is to simulate the server closing connections on the Transport. 

### <a id="checker" href="#checker">func checker(t *testing.T) func(string, error)</a>

```
searchKey: http.checker
tags: [private]
```

```Go
func checker(t *testing.T) func(string, error)
```

### <a id="TestFileTransport" href="#TestFileTransport">func TestFileTransport(t *testing.T)</a>

```
searchKey: http.TestFileTransport
tags: [private]
```

```Go
func TestFileTransport(t *testing.T)
```

### <a id="TestHeaderWrite" href="#TestHeaderWrite">func TestHeaderWrite(t *testing.T)</a>

```
searchKey: http.TestHeaderWrite
tags: [private]
```

```Go
func TestHeaderWrite(t *testing.T)
```

### <a id="TestParseTime" href="#TestParseTime">func TestParseTime(t *testing.T)</a>

```
searchKey: http.TestParseTime
tags: [private]
```

```Go
func TestParseTime(t *testing.T)
```

### <a id="TestHasToken" href="#TestHasToken">func TestHasToken(t *testing.T)</a>

```
searchKey: http.TestHasToken
tags: [private]
```

```Go
func TestHasToken(t *testing.T)
```

### <a id="TestNilHeaderClone" href="#TestNilHeaderClone">func TestNilHeaderClone(t *testing.T)</a>

```
searchKey: http.TestNilHeaderClone
tags: [private]
```

```Go
func TestNilHeaderClone(t *testing.T)
```

### <a id="BenchmarkHeaderWriteSubset" href="#BenchmarkHeaderWriteSubset">func BenchmarkHeaderWriteSubset(b *testing.B)</a>

```
searchKey: http.BenchmarkHeaderWriteSubset
tags: [private]
```

```Go
func BenchmarkHeaderWriteSubset(b *testing.B)
```

### <a id="TestHeaderWriteSubsetAllocs" href="#TestHeaderWriteSubsetAllocs">func TestHeaderWriteSubsetAllocs(t *testing.T)</a>

```
searchKey: http.TestHeaderWriteSubsetAllocs
tags: [private]
```

```Go
func TestHeaderWriteSubsetAllocs(t *testing.T)
```

### <a id="TestCloneOrMakeHeader" href="#TestCloneOrMakeHeader">func TestCloneOrMakeHeader(t *testing.T)</a>

```
searchKey: http.TestCloneOrMakeHeader
tags: [private]
```

```Go
func TestCloneOrMakeHeader(t *testing.T)
```

Issue 34878: test that every call to cloneOrMakeHeader never returns a nil Header. 

### <a id="TestForeachHeaderElement" href="#TestForeachHeaderElement">func TestForeachHeaderElement(t *testing.T)</a>

```
searchKey: http.TestForeachHeaderElement
tags: [private]
```

```Go
func TestForeachHeaderElement(t *testing.T)
```

### <a id="TestCleanHost" href="#TestCleanHost">func TestCleanHost(t *testing.T)</a>

```
searchKey: http.TestCleanHost
tags: [private]
```

```Go
func TestCleanHost(t *testing.T)
```

### <a id="TestCmdGoNoHTTPServer" href="#TestCmdGoNoHTTPServer">func TestCmdGoNoHTTPServer(t *testing.T)</a>

```
searchKey: http.TestCmdGoNoHTTPServer
tags: [private]
```

```Go
func TestCmdGoNoHTTPServer(t *testing.T)
```

Test that cmd/go doesn't link in the HTTP server. 

This catches accidental dependencies between the HTTP transport and server code. 

### <a id="TestOmitHTTP2" href="#TestOmitHTTP2">func TestOmitHTTP2(t *testing.T)</a>

```
searchKey: http.TestOmitHTTP2
tags: [private]
```

```Go
func TestOmitHTTP2(t *testing.T)
```

Tests that the nethttpomithttp2 build tag doesn't rot too much, even if there's not a regular builder on it. 

### <a id="TestOmitHTTP2Vet" href="#TestOmitHTTP2Vet">func TestOmitHTTP2Vet(t *testing.T)</a>

```
searchKey: http.TestOmitHTTP2Vet
tags: [private]
```

```Go
func TestOmitHTTP2Vet(t *testing.T)
```

Tests that the nethttpomithttp2 build tag at least type checks in short mode. The TestOmitHTTP2 test above actually runs tests (in long mode). 

### <a id="BenchmarkCopyValues" href="#BenchmarkCopyValues">func BenchmarkCopyValues(b *testing.B)</a>

```
searchKey: http.BenchmarkCopyValues
tags: [private]
```

```Go
func BenchmarkCopyValues(b *testing.B)
```

### <a id="TestNoUnicodeStrings" href="#TestNoUnicodeStrings">func TestNoUnicodeStrings(t *testing.T)</a>

```
searchKey: http.TestNoUnicodeStrings
tags: [private]
```

```Go
func TestNoUnicodeStrings(t *testing.T)
```

TestNoUnicodeStrings checks that nothing in net/http uses the Unicode-aware strings and bytes package functions. HTTP is mostly ASCII based, and doing Unicode-aware case folding or space stripping can introduce vulnerabilities. 

### <a id="TestCacheKeys" href="#TestCacheKeys">func TestCacheKeys(t *testing.T)</a>

```
searchKey: http.TestCacheKeys
tags: [private]
```

```Go
func TestCacheKeys(t *testing.T)
```

### <a id="ResetProxyEnv" href="#ResetProxyEnv">func ResetProxyEnv()</a>

```
searchKey: http.ResetProxyEnv
tags: [private]
```

```Go
func ResetProxyEnv()
```

### <a id="TestParseRange" href="#TestParseRange">func TestParseRange(t *testing.T)</a>

```
searchKey: http.TestParseRange
tags: [private]
```

```Go
func TestParseRange(t *testing.T)
```

### <a id="TestReadRequest" href="#TestReadRequest">func TestReadRequest(t *testing.T)</a>

```
searchKey: http.TestReadRequest
tags: [private]
```

```Go
func TestReadRequest(t *testing.T)
```

### <a id="reqBytes" href="#reqBytes">func reqBytes(req string) []byte</a>

```
searchKey: http.reqBytes
tags: [private]
```

```Go
func reqBytes(req string) []byte
```

reqBytes treats req as a request (with \n delimiters) and returns it with \r\n delimiters, ending in \r\n\r\n 

### <a id="TestReadRequest_Bad" href="#TestReadRequest_Bad">func TestReadRequest_Bad(t *testing.T)</a>

```
searchKey: http.TestReadRequest_Bad
tags: [private]
```

```Go
func TestReadRequest_Bad(t *testing.T)
```

### <a id="TestRequestWrite" href="#TestRequestWrite">func TestRequestWrite(t *testing.T)</a>

```
searchKey: http.TestRequestWrite
tags: [private]
```

```Go
func TestRequestWrite(t *testing.T)
```

### <a id="TestRequestWriteTransport" href="#TestRequestWriteTransport">func TestRequestWriteTransport(t *testing.T)</a>

```
searchKey: http.TestRequestWriteTransport
tags: [private]
```

```Go
func TestRequestWriteTransport(t *testing.T)
```

### <a id="TestRequestWriteClosesBody" href="#TestRequestWriteClosesBody">func TestRequestWriteClosesBody(t *testing.T)</a>

```
searchKey: http.TestRequestWriteClosesBody
tags: [private]
```

```Go
func TestRequestWriteClosesBody(t *testing.T)
```

TestRequestWriteClosesBody tests that Request.Write closes its request.Body. It also indirectly tests NewRequest and that it doesn't wrap an existing Closer inside a NopCloser, and that it serializes it correctly. 

### <a id="chunk" href="#chunk">func chunk(s string) string</a>

```
searchKey: http.chunk
tags: [private]
```

```Go
func chunk(s string) string
```

### <a id="mustParseURL" href="#mustParseURL">func mustParseURL(s string) *url.URL</a>

```
searchKey: http.mustParseURL
tags: [private]
```

```Go
func mustParseURL(s string) *url.URL
```

### <a id="TestRequestWriteError" href="#TestRequestWriteError">func TestRequestWriteError(t *testing.T)</a>

```
searchKey: http.TestRequestWriteError
tags: [private]
```

```Go
func TestRequestWriteError(t *testing.T)
```

TestRequestWriteError tests the Write err != nil checks in (*Request).write. 

### <a id="dumpRequestOut" href="#dumpRequestOut">func dumpRequestOut(req *Request, onReadHeaders func()) ([]byte, error)</a>

```
searchKey: http.dumpRequestOut
tags: [private]
```

```Go
func dumpRequestOut(req *Request, onReadHeaders func()) ([]byte, error)
```

dumpRequestOut is a modified copy of net/http/httputil.DumpRequestOut. Unlike the original, this version doesn't mutate the req.Body and try to restore it. It always dumps the whole body. And it doesn't support https. 

### <a id="TestReadResponse" href="#TestReadResponse">func TestReadResponse(t *testing.T)</a>

```
searchKey: http.TestReadResponse
tags: [private]
```

```Go
func TestReadResponse(t *testing.T)
```

tests successful calls to ReadResponse, and inspects the returned Response. For error cases, see TestReadResponseErrors below. 

### <a id="TestWriteResponse" href="#TestWriteResponse">func TestWriteResponse(t *testing.T)</a>

```
searchKey: http.TestWriteResponse
tags: [private]
```

```Go
func TestWriteResponse(t *testing.T)
```

### <a id="TestReadResponseCloseInMiddle" href="#TestReadResponseCloseInMiddle">func TestReadResponseCloseInMiddle(t *testing.T)</a>

```
searchKey: http.TestReadResponseCloseInMiddle
tags: [private]
```

```Go
func TestReadResponseCloseInMiddle(t *testing.T)
```

TestReadResponseCloseInMiddle tests that closing a body after reading only part of its contents advances the read to the end of the request, right up until the next request. 

### <a id="diff" href="#diff">func diff(t *testing.T, prefix string, have, want interface{})</a>

```
searchKey: http.diff
tags: [private]
```

```Go
func diff(t *testing.T, prefix string, have, want interface{})
```

### <a id="TestLocationResponse" href="#TestLocationResponse">func TestLocationResponse(t *testing.T)</a>

```
searchKey: http.TestLocationResponse
tags: [private]
```

```Go
func TestLocationResponse(t *testing.T)
```

### <a id="TestResponseStatusStutter" href="#TestResponseStatusStutter">func TestResponseStatusStutter(t *testing.T)</a>

```
searchKey: http.TestResponseStatusStutter
tags: [private]
```

```Go
func TestResponseStatusStutter(t *testing.T)
```

### <a id="TestResponseContentLengthShortBody" href="#TestResponseContentLengthShortBody">func TestResponseContentLengthShortBody(t *testing.T)</a>

```
searchKey: http.TestResponseContentLengthShortBody
tags: [private]
```

```Go
func TestResponseContentLengthShortBody(t *testing.T)
```

### <a id="TestReadResponseErrors" href="#TestReadResponseErrors">func TestReadResponseErrors(t *testing.T)</a>

```
searchKey: http.TestReadResponseErrors
tags: [private]
```

```Go
func TestReadResponseErrors(t *testing.T)
```

Test various ReadResponse error cases. (also tests success cases, but mostly it's about errors).  This does not test anything involving the bodies. Only the return value from ReadResponse itself. 

### <a id="matchErr" href="#matchErr">func matchErr(err error, wantErr interface{}) error</a>

```
searchKey: http.matchErr
tags: [private]
```

```Go
func matchErr(err error, wantErr interface{}) error
```

wantErr can be nil, an error value to match exactly, or type string to match a substring. 

### <a id="TestNeedsSniff" href="#TestNeedsSniff">func TestNeedsSniff(t *testing.T)</a>

```
searchKey: http.TestNeedsSniff
tags: [private]
```

```Go
func TestNeedsSniff(t *testing.T)
```

### <a id="TestResponseWritesOnlySingleConnectionClose" href="#TestResponseWritesOnlySingleConnectionClose">func TestResponseWritesOnlySingleConnectionClose(t *testing.T)</a>

```
searchKey: http.TestResponseWritesOnlySingleConnectionClose
tags: [private]
```

```Go
func TestResponseWritesOnlySingleConnectionClose(t *testing.T)
```

A response should only write out single Connection: close header. Tests #19499. 

### <a id="TestResponseWrite" href="#TestResponseWrite">func TestResponseWrite(t *testing.T)</a>

```
searchKey: http.TestResponseWrite
tags: [private]
```

```Go
func TestResponseWrite(t *testing.T)
```

### <a id="BenchmarkServerMatch" href="#BenchmarkServerMatch">func BenchmarkServerMatch(b *testing.B)</a>

```
searchKey: http.BenchmarkServerMatch
tags: [private]
```

```Go
func BenchmarkServerMatch(b *testing.B)
```

### <a id="TestBodyReadBadTrailer" href="#TestBodyReadBadTrailer">func TestBodyReadBadTrailer(t *testing.T)</a>

```
searchKey: http.TestBodyReadBadTrailer
tags: [private]
```

```Go
func TestBodyReadBadTrailer(t *testing.T)
```

### <a id="TestFinalChunkedBodyReadEOF" href="#TestFinalChunkedBodyReadEOF">func TestFinalChunkedBodyReadEOF(t *testing.T)</a>

```
searchKey: http.TestFinalChunkedBodyReadEOF
tags: [private]
```

```Go
func TestFinalChunkedBodyReadEOF(t *testing.T)
```

### <a id="TestDetectInMemoryReaders" href="#TestDetectInMemoryReaders">func TestDetectInMemoryReaders(t *testing.T)</a>

```
searchKey: http.TestDetectInMemoryReaders
tags: [private]
```

```Go
func TestDetectInMemoryReaders(t *testing.T)
```

### <a id="TestTransferWriterWriteBodyReaderTypes" href="#TestTransferWriterWriteBodyReaderTypes">func TestTransferWriterWriteBodyReaderTypes(t *testing.T)</a>

```
searchKey: http.TestTransferWriterWriteBodyReaderTypes
tags: [private]
```

```Go
func TestTransferWriterWriteBodyReaderTypes(t *testing.T)
```

### <a id="TestParseTransferEncoding" href="#TestParseTransferEncoding">func TestParseTransferEncoding(t *testing.T)</a>

```
searchKey: http.TestParseTransferEncoding
tags: [private]
```

```Go
func TestParseTransferEncoding(t *testing.T)
```

### <a id="TestParseContentLength" href="#TestParseContentLength">func TestParseContentLength(t *testing.T)</a>

```
searchKey: http.TestParseContentLength
tags: [private]
```

```Go
func TestParseContentLength(t *testing.T)
```

issue 39017 - disallow Content-Length values such as "+3" 

### <a id="TestTransportPersistConnReadLoopEOF" href="#TestTransportPersistConnReadLoopEOF">func TestTransportPersistConnReadLoopEOF(t *testing.T)</a>

```
searchKey: http.TestTransportPersistConnReadLoopEOF
tags: [private]
```

```Go
func TestTransportPersistConnReadLoopEOF(t *testing.T)
```

Issue 15446: incorrect wrapping of errors when server closes an idle connection. 

### <a id="isTransportReadFromServerError" href="#isTransportReadFromServerError">func isTransportReadFromServerError(err error) bool</a>

```
searchKey: http.isTransportReadFromServerError
tags: [private]
```

```Go
func isTransportReadFromServerError(err error) bool
```

### <a id="newLocalListener" href="#newLocalListener">func newLocalListener(t *testing.T) net.Listener</a>

```
searchKey: http.newLocalListener
tags: [private]
```

```Go
func newLocalListener(t *testing.T) net.Listener
```

### <a id="TestTransportShouldRetryRequest" href="#TestTransportShouldRetryRequest">func TestTransportShouldRetryRequest(t *testing.T)</a>

```
searchKey: http.TestTransportShouldRetryRequest
tags: [private]
```

```Go
func TestTransportShouldRetryRequest(t *testing.T)
```

### <a id="TestTransportBodyAltRewind" href="#TestTransportBodyAltRewind">func TestTransportBodyAltRewind(t *testing.T)</a>

```
searchKey: http.TestTransportBodyAltRewind
tags: [private]
```

```Go
func TestTransportBodyAltRewind(t *testing.T)
```

Issue 25009 

