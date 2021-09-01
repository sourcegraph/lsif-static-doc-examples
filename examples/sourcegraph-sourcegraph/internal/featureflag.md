# Package featureflag

## Index

* [Types](#type)
    * [type FeatureFlag struct](#FeatureFlag)
        * [func (f *FeatureFlag) EvaluateForAnonymousUser(anonymousUID string) bool](#FeatureFlag.EvaluateForAnonymousUser)
        * [func (f *FeatureFlag) EvaluateForUser(userID int32) bool](#FeatureFlag.EvaluateForUser)
        * [func (f *FeatureFlag) EvaluateGlobal() (res bool, ok bool)](#FeatureFlag.EvaluateGlobal)
    * [type FeatureFlagBool struct](#FeatureFlagBool)
    * [type FeatureFlagRollout struct](#FeatureFlagRollout)
    * [type FeatureFlagStore interface](#FeatureFlagStore)
    * [type FlagSet map[string]bool](#FlagSet)
        * [func FromContext(ctx context.Context) FlagSet](#FromContext)
        * [func (f FlagSet) GetBool(flag string) (bool, bool)](#FlagSet.GetBool)
        * [func (f FlagSet) GetBoolOr(flag string, defaultVal bool) bool](#FlagSet.GetBoolOr)
    * [type Override struct](#Override)
    * [type flagContextKey struct{}](#flagContextKey)
* [Functions](#func)
    * [func Middleware(ffs FeatureFlagStore, next http.Handler) http.Handler](#Middleware)
    * [func contextWithFeatureFlags(ffs FeatureFlagStore, r *http.Request) context.Context](#contextWithFeatureFlags)
    * [func hashAnonymousUserAndFlag(anonymousUID, flagName string) uint32](#hashAnonymousUserAndFlag)
    * [func hashUserAndFlag(userID int32, flagName string) uint32](#hashUserAndFlag)


## <a id="type" href="#type">Types</a>

```
tags: [private]
```

### <a id="FeatureFlag" href="#FeatureFlag">type FeatureFlag struct</a>

```
searchKey: featureflag.FeatureFlag
tags: [struct]
```

```Go
type FeatureFlag struct {
	Name string

	// A feature flag is one of the following types.
	// Exactly one of the following will be set.
	Bool    *FeatureFlagBool
	Rollout *FeatureFlagRollout

	CreatedAt time.Time
	UpdatedAt time.Time
	DeletedAt *time.Time
}
```

#### <a id="FeatureFlag.EvaluateForAnonymousUser" href="#FeatureFlag.EvaluateForAnonymousUser">func (f *FeatureFlag) EvaluateForAnonymousUser(anonymousUID string) bool</a>

```
searchKey: featureflag.FeatureFlag.EvaluateForAnonymousUser
tags: [method]
```

```Go
func (f *FeatureFlag) EvaluateForAnonymousUser(anonymousUID string) bool
```

EvaluateForAnonymousUser evaluates the feature flag for an anonymous user ID. 

#### <a id="FeatureFlag.EvaluateForUser" href="#FeatureFlag.EvaluateForUser">func (f *FeatureFlag) EvaluateForUser(userID int32) bool</a>

```
searchKey: featureflag.FeatureFlag.EvaluateForUser
tags: [method]
```

```Go
func (f *FeatureFlag) EvaluateForUser(userID int32) bool
```

EvaluateForUser evaluates the feature flag for a userID. 

#### <a id="FeatureFlag.EvaluateGlobal" href="#FeatureFlag.EvaluateGlobal">func (f *FeatureFlag) EvaluateGlobal() (res bool, ok bool)</a>

```
searchKey: featureflag.FeatureFlag.EvaluateGlobal
tags: [method]
```

```Go
func (f *FeatureFlag) EvaluateGlobal() (res bool, ok bool)
```

EvaluateGlobal returns the evaluated feature flag for a global context (no user is associated with the request). If the flag is not evaluatable in the global context (i.e. the flag type is a rollout), then the second parameter will return false. 

### <a id="FeatureFlagBool" href="#FeatureFlagBool">type FeatureFlagBool struct</a>

```
searchKey: featureflag.FeatureFlagBool
tags: [struct]
```

```Go
type FeatureFlagBool struct {
	Value bool
}
```

### <a id="FeatureFlagRollout" href="#FeatureFlagRollout">type FeatureFlagRollout struct</a>

```
searchKey: featureflag.FeatureFlagRollout
tags: [struct]
```

```Go
type FeatureFlagRollout struct {
	// Rollout is an integer between 0 and 10000, representing the percent of
	// users for which this feature flag will evaluate to 'true' in increments
	// of 0.01%
	Rollout int32
}
```

### <a id="FeatureFlagStore" href="#FeatureFlagStore">type FeatureFlagStore interface</a>

```
searchKey: featureflag.FeatureFlagStore
tags: [interface]
```

```Go
type FeatureFlagStore interface {
	GetUserFlags(context.Context, int32) (map[string]bool, error)
	GetAnonymousUserFlags(context.Context, string) (map[string]bool, error)
	GetGlobalFeatureFlags(context.Context) (map[string]bool, error)
}
```

### <a id="FlagSet" href="#FlagSet">type FlagSet map[string]bool</a>

```
searchKey: featureflag.FlagSet
tags: [object]
```

```Go
type FlagSet map[string]bool
```

#### <a id="FromContext" href="#FromContext">func FromContext(ctx context.Context) FlagSet</a>

```
searchKey: featureflag.FromContext
tags: [function]
```

```Go
func FromContext(ctx context.Context) FlagSet
```

FromContext retrieves the current set of flags from the current request's context. 

#### <a id="FlagSet.GetBool" href="#FlagSet.GetBool">func (f FlagSet) GetBool(flag string) (bool, bool)</a>

```
searchKey: featureflag.FlagSet.GetBool
tags: [method]
```

```Go
func (f FlagSet) GetBool(flag string) (bool, bool)
```

#### <a id="FlagSet.GetBoolOr" href="#FlagSet.GetBoolOr">func (f FlagSet) GetBoolOr(flag string, defaultVal bool) bool</a>

```
searchKey: featureflag.FlagSet.GetBoolOr
tags: [method]
```

```Go
func (f FlagSet) GetBoolOr(flag string, defaultVal bool) bool
```

### <a id="Override" href="#Override">type Override struct</a>

```
searchKey: featureflag.Override
tags: [struct]
```

```Go
type Override struct {
	UserID   *int32
	OrgID    *int32
	FlagName string
	Value    bool
}
```

### <a id="flagContextKey" href="#flagContextKey">type flagContextKey struct{}</a>

```
searchKey: featureflag.flagContextKey
tags: [struct private]
```

```Go
type flagContextKey struct{}
```

## <a id="func" href="#func">Functions</a>

```
tags: [private]
```

### <a id="Middleware" href="#Middleware">func Middleware(ffs FeatureFlagStore, next http.Handler) http.Handler</a>

```
searchKey: featureflag.Middleware
tags: [function]
```

```Go
func Middleware(ffs FeatureFlagStore, next http.Handler) http.Handler
```

Middleware evaluates the feature flags for the current user and adds the feature flags to the current context. 

### <a id="contextWithFeatureFlags" href="#contextWithFeatureFlags">func contextWithFeatureFlags(ffs FeatureFlagStore, r *http.Request) context.Context</a>

```
searchKey: featureflag.contextWithFeatureFlags
tags: [function private]
```

```Go
func contextWithFeatureFlags(ffs FeatureFlagStore, r *http.Request) context.Context
```

### <a id="hashAnonymousUserAndFlag" href="#hashAnonymousUserAndFlag">func hashAnonymousUserAndFlag(anonymousUID, flagName string) uint32</a>

```
searchKey: featureflag.hashAnonymousUserAndFlag
tags: [function private]
```

```Go
func hashAnonymousUserAndFlag(anonymousUID, flagName string) uint32
```

### <a id="hashUserAndFlag" href="#hashUserAndFlag">func hashUserAndFlag(userID int32, flagName string) uint32</a>

```
searchKey: featureflag.hashUserAndFlag
tags: [function private]
```

```Go
func hashUserAndFlag(userID int32, flagName string) uint32
```

