# Package session

Package session implements a redis backed user sessions HTTP middleware. 

## Index

* [Constants](#const)
    * [const cookieName](#cookieName)
    * [const defaultExpiryPeriod](#defaultExpiryPeriod)
* [Variables](#var)
    * [var sessionCookieKey](#sessionCookieKey)
    * [var sessionStore](#sessionStore)
* [Types](#type)
    * [type sessionInfo struct](#sessionInfo)
    * [type sessionsStore struct](#sessionsStore)
        * [func (st *sessionsStore) Get(r *http.Request, name string) (s *sessions.Session, err error)](#sessionsStore.Get)
        * [func (st *sessionsStore) New(r *http.Request, name string) (s *sessions.Session, err error)](#sessionsStore.New)
        * [func (st *sessionsStore) setSecureOptions(s *sessions.Session)](#sessionsStore.setSecureOptions)
* [Functions](#func)
    * [func CookieMiddleware(next http.Handler) http.Handler](#CookieMiddleware)
    * [func CookieMiddlewareWithCSRFSafety(next http.Handler, corsAllowHeader string, isTrustedOrigin func(*http.Request) bool) http.Handler](#CookieMiddlewareWithCSRFSafety)
    * [func GetData(r *http.Request, key string, value interface{}) error](#GetData)
    * [func InvalidateSessionCurrentUser(w http.ResponseWriter, r *http.Request) error](#InvalidateSessionCurrentUser)
    * [func InvalidateSessionsByID(ctx context.Context, id int32) error](#InvalidateSessionsByID)
    * [func NewRedisStore(secureCookie func() bool) sessions.Store](#NewRedisStore)
    * [func Ping() error](#Ping)
    * [func ResetMockSessionStore(t *testing.T) (cleanup func())](#ResetMockSessionStore)
    * [func SetActor(w http.ResponseWriter, r *http.Request, actor *actor.Actor, expiryPeriod time.Duration, userCreatedAt time.Time) error](#SetActor)
    * [func SetData(w http.ResponseWriter, r *http.Request, key string, value interface{}) error](#SetData)
    * [func SetSessionStore(s sessions.Store)](#SetSessionStore)
    * [func TestCookieMiddleware(t *testing.T)](#TestCookieMiddleware)
    * [func TestManualSessionExpiry(t *testing.T)](#TestManualSessionExpiry)
    * [func TestMismatchedUserCreationFails(t *testing.T)](#TestMismatchedUserCreationFails)
    * [func TestOldUserSessionSucceeds(t *testing.T)](#TestOldUserSessionSucceeds)
    * [func TestRecoverFromInvalidCookieValue(t *testing.T)](#TestRecoverFromInvalidCookieValue)
    * [func TestSessionExpiry(t *testing.T)](#TestSessionExpiry)
    * [func TestSetActorDeleteSession(t *testing.T)](#TestSetActorDeleteSession)
    * [func authenticateByCookie(r *http.Request, w http.ResponseWriter) context.Context](#authenticateByCookie)
    * [func checkCookieDeleted(t *testing.T, resp *http.Response)](#checkCookieDeleted)
    * [func deleteSession(w http.ResponseWriter, r *http.Request) error](#deleteSession)
    * [func hasSessionCookie(r *http.Request) bool](#hasSessionCookie)
    * [func init()](#init.session.go)
    * [func ping(s *redistore.RediStore) error](#ping)
    * [func sessionCookie(r *http.Request) string](#sessionCookie)
    * [func setSessionSecureOptions(opts *sessions.Options, secure bool)](#setSessionSecureOptions)
    * [func waitForRedis(s *redistore.RediStore)](#waitForRedis)


## <a id="const" href="#const">Constants</a>

```
tags: [package private]
```

### <a id="cookieName" href="#cookieName">const cookieName</a>

```
searchKey: session.cookieName
tags: [constant string private]
```

```Go
const cookieName = "sgs"
```

cookieName is the name of the HTTP cookie that stores the session ID. 

### <a id="defaultExpiryPeriod" href="#defaultExpiryPeriod">const defaultExpiryPeriod</a>

```
searchKey: session.defaultExpiryPeriod
tags: [constant number private]
```

```Go
const defaultExpiryPeriod = 90 * 24 * time.Hour
```

defaultExpiryPeriod is the default session expiry period (if none is specified explicitly): 90 days. 

## <a id="var" href="#var">Variables</a>

```
tags: [package private]
```

### <a id="sessionCookieKey" href="#sessionCookieKey">var sessionCookieKey</a>

```
searchKey: session.sessionCookieKey
tags: [variable string private]
```

```Go
var sessionCookieKey = ...
```

### <a id="sessionStore" href="#sessionStore">var sessionStore</a>

```
searchKey: session.sessionStore
tags: [variable interface private]
```

```Go
var sessionStore sessions.Store
```

## <a id="type" href="#type">Types</a>

```
tags: [package private]
```

### <a id="sessionInfo" href="#sessionInfo">type sessionInfo struct</a>

```
searchKey: session.sessionInfo
tags: [struct private]
```

```Go
type sessionInfo struct {
	Actor         *actor.Actor  `json:"actor"`
	LastActive    time.Time     `json:"lastActive"`
	ExpiryPeriod  time.Duration `json:"expiryPeriod"`
	UserCreatedAt time.Time     `json:"userCreatedAt"`
}
```

sessionInfo is the information we store in the session. The gorilla/sessions library doesn't appear to enforce the maxAge field in its session store implementations, so we include the expiry here. 

### <a id="sessionsStore" href="#sessionsStore">type sessionsStore struct</a>

```
searchKey: session.sessionsStore
tags: [struct private]
```

```Go
type sessionsStore struct {
	sessions.Store
	secure func() bool
}
```

sessionsStore wraps another sessions.Store to dynamically set the values of the session.Options.Secure and session.Options.SameSite fields to what is returned by the secure closure at invocation time. 

#### <a id="sessionsStore.Get" href="#sessionsStore.Get">func (st *sessionsStore) Get(r *http.Request, name string) (s *sessions.Session, err error)</a>

```
searchKey: session.sessionsStore.Get
tags: [method private]
```

```Go
func (st *sessionsStore) Get(r *http.Request, name string) (s *sessions.Session, err error)
```

Get returns a cached session, setting the secure cookie option dynamically. 

#### <a id="sessionsStore.New" href="#sessionsStore.New">func (st *sessionsStore) New(r *http.Request, name string) (s *sessions.Session, err error)</a>

```
searchKey: session.sessionsStore.New
tags: [method private]
```

```Go
func (st *sessionsStore) New(r *http.Request, name string) (s *sessions.Session, err error)
```

New creates and returns a new session with the secure cookie setting option set dynamically. 

#### <a id="sessionsStore.setSecureOptions" href="#sessionsStore.setSecureOptions">func (st *sessionsStore) setSecureOptions(s *sessions.Session)</a>

```
searchKey: session.sessionsStore.setSecureOptions
tags: [method private]
```

```Go
func (st *sessionsStore) setSecureOptions(s *sessions.Session)
```

## <a id="func" href="#func">Functions</a>

```
tags: [package private]
```

### <a id="CookieMiddleware" href="#CookieMiddleware">func CookieMiddleware(next http.Handler) http.Handler</a>

```
searchKey: session.CookieMiddleware
tags: [method]
```

```Go
func CookieMiddleware(next http.Handler) http.Handler
```

CookieMiddleware is an http.Handler middleware that authenticates future HTTP request via cookie. 

### <a id="CookieMiddlewareWithCSRFSafety" href="#CookieMiddlewareWithCSRFSafety">func CookieMiddlewareWithCSRFSafety(next http.Handler, corsAllowHeader string, isTrustedOrigin func(*http.Request) bool) http.Handler</a>

```
searchKey: session.CookieMiddlewareWithCSRFSafety
tags: [method]
```

```Go
func CookieMiddlewareWithCSRFSafety(next http.Handler, corsAllowHeader string, isTrustedOrigin func(*http.Request) bool) http.Handler
```

CookieMiddlewareWithCSRFSafety is a middleware that authenticates HTTP requests using the provided cookie (if any), *only if* the request is a non-simple CORS request (see [https://www.w3.org/TR/cors/#cross-origin-request-with-preflight-0](https://www.w3.org/TR/cors/#cross-origin-request-with-preflight-0)). This relies on the client's CORS checks to guarantee that one of the following is true, thereby protecting against CSRF attacks: 

- The request originates from the same origin. -OR- 

- The request is cross-origin but passed the CORS preflight check (because otherwise the 

```
preflight OPTIONS response from secureHeadersMiddleware would have caused the browser to refuse
to send this HTTP request).

```
To determine if it's a non-simple CORS request, it checks for the presence of either "Content-Type: application/json; charset=utf-8" or a non-empty HTTP request header whose name is given in corsAllowHeader. 

If the request is a simple CORS request, or if neither of these is true, then the cookie is not used to authenticate the request. The request is still allowed to proceed (but will be unauthenticated unless some other authentication is provided, such as an access token). 

### <a id="GetData" href="#GetData">func GetData(r *http.Request, key string, value interface{}) error</a>

```
searchKey: session.GetData
tags: [method]
```

```Go
func GetData(r *http.Request, key string, value interface{}) error
```

GetData reads the session data at the key into the data structure addressed by value (which must be a pointer). 

The value is JSON-decoded from the raw bytes stored by the call to SetData. 

### <a id="InvalidateSessionCurrentUser" href="#InvalidateSessionCurrentUser">func InvalidateSessionCurrentUser(w http.ResponseWriter, r *http.Request) error</a>

```
searchKey: session.InvalidateSessionCurrentUser
tags: [method]
```

```Go
func InvalidateSessionCurrentUser(w http.ResponseWriter, r *http.Request) error
```

InvalidateSessionCurrentUser invalidates all sessions for the current user. 

### <a id="InvalidateSessionsByID" href="#InvalidateSessionsByID">func InvalidateSessionsByID(ctx context.Context, id int32) error</a>

```
searchKey: session.InvalidateSessionsByID
tags: [method]
```

```Go
func InvalidateSessionsByID(ctx context.Context, id int32) error
```

InvalidateSessionsByID invalidates all sessions for a user If an error occurs, it returns the error 

### <a id="NewRedisStore" href="#NewRedisStore">func NewRedisStore(secureCookie func() bool) sessions.Store</a>

```
searchKey: session.NewRedisStore
tags: [method]
```

```Go
func NewRedisStore(secureCookie func() bool) sessions.Store
```

NewRedisStore creates a new session store backed by Redis. 

### <a id="Ping" href="#Ping">func Ping() error</a>

```
searchKey: session.Ping
tags: [function]
```

```Go
func Ping() error
```

Ping attempts to contact Redis and returns a non-nil error upon failure. It is intended to be used by health checks. 

### <a id="ResetMockSessionStore" href="#ResetMockSessionStore">func ResetMockSessionStore(t *testing.T) (cleanup func())</a>

```
searchKey: session.ResetMockSessionStore
tags: [method]
```

```Go
func ResetMockSessionStore(t *testing.T) (cleanup func())
```

### <a id="SetActor" href="#SetActor">func SetActor(w http.ResponseWriter, r *http.Request, actor *actor.Actor, expiryPeriod time.Duration, userCreatedAt time.Time) error</a>

```
searchKey: session.SetActor
tags: [method]
```

```Go
func SetActor(w http.ResponseWriter, r *http.Request, actor *actor.Actor, expiryPeriod time.Duration, userCreatedAt time.Time) error
```

SetActor sets the actor in the session, or removes it if actor == nil. If no session exists, a new session is created. 

If expiryPeriod is 0, the default expiry period is used. 

### <a id="SetData" href="#SetData">func SetData(w http.ResponseWriter, r *http.Request, key string, value interface{}) error</a>

```
searchKey: session.SetData
tags: [method]
```

```Go
func SetData(w http.ResponseWriter, r *http.Request, key string, value interface{}) error
```

SetData sets the session data at the key. The session data is a map of keys to values. If no session exists, a new session is created. 

The value is JSON-encoded before being stored. 

### <a id="SetSessionStore" href="#SetSessionStore">func SetSessionStore(s sessions.Store)</a>

```
searchKey: session.SetSessionStore
tags: [method]
```

```Go
func SetSessionStore(s sessions.Store)
```

SetSessionStore sets the backing store used for storing sessions on the server. It should be called exactly once. 

### <a id="TestCookieMiddleware" href="#TestCookieMiddleware">func TestCookieMiddleware(t *testing.T)</a>

```
searchKey: session.TestCookieMiddleware
tags: [method private test]
```

```Go
func TestCookieMiddleware(t *testing.T)
```

### <a id="TestManualSessionExpiry" href="#TestManualSessionExpiry">func TestManualSessionExpiry(t *testing.T)</a>

```
searchKey: session.TestManualSessionExpiry
tags: [method private test]
```

```Go
func TestManualSessionExpiry(t *testing.T)
```

### <a id="TestMismatchedUserCreationFails" href="#TestMismatchedUserCreationFails">func TestMismatchedUserCreationFails(t *testing.T)</a>

```
searchKey: session.TestMismatchedUserCreationFails
tags: [method private test]
```

```Go
func TestMismatchedUserCreationFails(t *testing.T)
```

### <a id="TestOldUserSessionSucceeds" href="#TestOldUserSessionSucceeds">func TestOldUserSessionSucceeds(t *testing.T)</a>

```
searchKey: session.TestOldUserSessionSucceeds
tags: [method private test]
```

```Go
func TestOldUserSessionSucceeds(t *testing.T)
```

### <a id="TestRecoverFromInvalidCookieValue" href="#TestRecoverFromInvalidCookieValue">func TestRecoverFromInvalidCookieValue(t *testing.T)</a>

```
searchKey: session.TestRecoverFromInvalidCookieValue
tags: [method private test]
```

```Go
func TestRecoverFromInvalidCookieValue(t *testing.T)
```

### <a id="TestSessionExpiry" href="#TestSessionExpiry">func TestSessionExpiry(t *testing.T)</a>

```
searchKey: session.TestSessionExpiry
tags: [method private test]
```

```Go
func TestSessionExpiry(t *testing.T)
```

### <a id="TestSetActorDeleteSession" href="#TestSetActorDeleteSession">func TestSetActorDeleteSession(t *testing.T)</a>

```
searchKey: session.TestSetActorDeleteSession
tags: [method private test]
```

```Go
func TestSetActorDeleteSession(t *testing.T)
```

### <a id="authenticateByCookie" href="#authenticateByCookie">func authenticateByCookie(r *http.Request, w http.ResponseWriter) context.Context</a>

```
searchKey: session.authenticateByCookie
tags: [method private]
```

```Go
func authenticateByCookie(r *http.Request, w http.ResponseWriter) context.Context
```

### <a id="checkCookieDeleted" href="#checkCookieDeleted">func checkCookieDeleted(t *testing.T, resp *http.Response)</a>

```
searchKey: session.checkCookieDeleted
tags: [method private]
```

```Go
func checkCookieDeleted(t *testing.T, resp *http.Response)
```

### <a id="deleteSession" href="#deleteSession">func deleteSession(w http.ResponseWriter, r *http.Request) error</a>

```
searchKey: session.deleteSession
tags: [method private]
```

```Go
func deleteSession(w http.ResponseWriter, r *http.Request) error
```

deleteSession deletes the current session. If an error occurs, it returns the error but does not write an HTTP error response. 

It should only be used when there is an unrecoverable, permanent error in the session data. To sign out the current user, use SetActor(r, nil). 

### <a id="hasSessionCookie" href="#hasSessionCookie">func hasSessionCookie(r *http.Request) bool</a>

```
searchKey: session.hasSessionCookie
tags: [method private]
```

```Go
func hasSessionCookie(r *http.Request) bool
```

### <a id="init.session.go" href="#init.session.go">func init()</a>

```
searchKey: session.init
tags: [function private]
```

```Go
func init()
```

### <a id="ping" href="#ping">func ping(s *redistore.RediStore) error</a>

```
searchKey: session.ping
tags: [method private]
```

```Go
func ping(s *redistore.RediStore) error
```

### <a id="sessionCookie" href="#sessionCookie">func sessionCookie(r *http.Request) string</a>

```
searchKey: session.sessionCookie
tags: [method private]
```

```Go
func sessionCookie(r *http.Request) string
```

sessionCookie returns the session cookie from the header of the given request. 

### <a id="setSessionSecureOptions" href="#setSessionSecureOptions">func setSessionSecureOptions(opts *sessions.Options, secure bool)</a>

```
searchKey: session.setSessionSecureOptions
tags: [method private]
```

```Go
func setSessionSecureOptions(opts *sessions.Options, secure bool)
```

setSessionSecureOptions set the values of the session.Options.Secure and session.Options.SameSite fields depending on the value of the secure field. 

### <a id="waitForRedis" href="#waitForRedis">func waitForRedis(s *redistore.RediStore)</a>

```
searchKey: session.waitForRedis
tags: [method private]
```

```Go
func waitForRedis(s *redistore.RediStore)
```

waitForRedis waits up to a certain timeout for Redis to become reachable, to reduce the likelihood of the HTTP handlers starting to serve requests while Redis (and therefore session data) is still unavailable. After the timeout has elapsed, if Redis is still unreachable, it continues anyway (because that's probably better than the site not coming up at all). 

