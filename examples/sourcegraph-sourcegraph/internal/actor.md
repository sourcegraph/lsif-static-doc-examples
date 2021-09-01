# Package actor

Package actor provides the structures for representing an actor who has access to resources. 

## Index

* [Constants](#const)
    * [const actorKey](#actorKey)
* [Types](#type)
    * [type Actor struct](#Actor)
        * [func FromContext(ctx context.Context) *Actor](#FromContext)
        * [func FromUser(uid int32) *Actor](#FromUser)
        * [func (a *Actor) IsAuthenticated() bool](#Actor.IsAuthenticated)
        * [func (a *Actor) String() string](#Actor.String)
        * [func (a *Actor) UIDString() string](#Actor.UIDString)
    * [type key int](#key)
* [Functions](#func)
    * [func WithActor(ctx context.Context, a *Actor) context.Context](#WithActor)
    * [func WithInternalActor(ctx context.Context) context.Context](#WithInternalActor)


## <a id="const" href="#const">Constants</a>

```
tags: [private]
```

### <a id="actorKey" href="#actorKey">const actorKey</a>

```
searchKey: actor.actorKey
tags: [constant number private]
```

```Go
const actorKey key = iota
```

## <a id="type" href="#type">Types</a>

```
tags: [private]
```

### <a id="Actor" href="#Actor">type Actor struct</a>

```
searchKey: actor.Actor
tags: [struct]
```

```Go
type Actor struct {
	// UID is the unique ID of the authenticated user, or 0 for anonymous actors.
	UID int32 `json:",omitempty"`

	// Internal is true if the actor represents an internal Sourcegraph service (and is therefore
	// not tied to a specific user).
	Internal bool `json:",omitempty"`

	// FromSessionCookie is whether a session cookie was used to authenticate the actor. It is used
	// to selectively display a logout link. (If the actor wasn't authenticated with a session
	// cookie, logout would be ineffective.)
	FromSessionCookie bool `json:"-"`
}
```

Actor represents an agent that accesses resources. It can represent an anonymous user, an authenticated user, or an internal Sourcegraph service. 

#### <a id="FromContext" href="#FromContext">func FromContext(ctx context.Context) *Actor</a>

```
searchKey: actor.FromContext
tags: [function]
```

```Go
func FromContext(ctx context.Context) *Actor
```

#### <a id="FromUser" href="#FromUser">func FromUser(uid int32) *Actor</a>

```
searchKey: actor.FromUser
tags: [function]
```

```Go
func FromUser(uid int32) *Actor
```

FromUser returns an actor corresponding to a user 

#### <a id="Actor.IsAuthenticated" href="#Actor.IsAuthenticated">func (a *Actor) IsAuthenticated() bool</a>

```
searchKey: actor.Actor.IsAuthenticated
tags: [method]
```

```Go
func (a *Actor) IsAuthenticated() bool
```

IsAuthenticated returns true if the Actor is derived from an authenticated user. 

#### <a id="Actor.String" href="#Actor.String">func (a *Actor) String() string</a>

```
searchKey: actor.Actor.String
tags: [method]
```

```Go
func (a *Actor) String() string
```

#### <a id="Actor.UIDString" href="#Actor.UIDString">func (a *Actor) UIDString() string</a>

```
searchKey: actor.Actor.UIDString
tags: [method]
```

```Go
func (a *Actor) UIDString() string
```

UIDString is a helper method that returns the UID as a string. 

### <a id="key" href="#key">type key int</a>

```
searchKey: actor.key
tags: [number private]
```

```Go
type key int
```

## <a id="func" href="#func">Functions</a>

```
tags: [private]
```

### <a id="WithActor" href="#WithActor">func WithActor(ctx context.Context, a *Actor) context.Context</a>

```
searchKey: actor.WithActor
tags: [function]
```

```Go
func WithActor(ctx context.Context, a *Actor) context.Context
```

### <a id="WithInternalActor" href="#WithInternalActor">func WithInternalActor(ctx context.Context) context.Context</a>

```
searchKey: actor.WithInternalActor
tags: [function]
```

```Go
func WithInternalActor(ctx context.Context) context.Context
```

