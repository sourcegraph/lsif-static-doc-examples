# Package auth

Package auth is imported for side-effects to enable enterprise-only SSO. 

## Index

* Subpages
  * [enterprise/cmd/frontend/internal/auth/githuboauth](auth/githuboauth.md)
  * [enterprise/cmd/frontend/internal/auth/gitlaboauth](auth/gitlaboauth.md)
  * [enterprise/cmd/frontend/internal/auth/httpheader](auth/httpheader.md)
  * [enterprise/cmd/frontend/internal/auth/oauth](auth/oauth.md)
  * [enterprise/cmd/frontend/internal/auth/openidconnect](auth/openidconnect.md)
  * [enterprise/cmd/frontend/internal/auth/saml](auth/saml.md)
* [Functions](#func)
    * [func Init(db dbutil.DB)](#Init)
    * [func ssoSignOutHandler(w http.ResponseWriter, r *http.Request)](#ssoSignOutHandler)


## <a id="func" href="#func">Functions</a>

```
tags: [package private]
```

### <a id="Init" href="#Init">func Init(db dbutil.DB)</a>

```
searchKey: auth.Init
tags: [method]
```

```Go
func Init(db dbutil.DB)
```

Init must be called by the frontend to initialize the auth middlewares. 

### <a id="ssoSignOutHandler" href="#ssoSignOutHandler">func ssoSignOutHandler(w http.ResponseWriter, r *http.Request)</a>

```
searchKey: auth.ssoSignOutHandler
tags: [method private]
```

```Go
func ssoSignOutHandler(w http.ResponseWriter, r *http.Request)
```

