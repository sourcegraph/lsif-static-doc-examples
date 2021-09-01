# Package user

Package user allows user account lookups by name or id. 

For most Unix systems, this package has two internal implementations of resolving user and group ids to names. One is written in pure Go and parses /etc/passwd and /etc/group. The other is cgo-based and relies on the standard C library (libc) routines such as getpwuid_r and getgrnam_r. 

When cgo is available, cgo-based (libc-backed) code is used by default. This can be overridden by using osusergo build tag, which enforces the pure Go implementation. 

## Index

* [Constants](#const)
    * [const groupBuffer](#groupBuffer)
    * [const maxBufferSize](#maxBufferSize)
    * [const maxGroups](#maxGroups)
    * [const userBuffer](#userBuffer)
* [Variables](#var)
    * [var cache](#cache)
    * [var groupImplemented](#groupImplemented)
    * [var userImplemented](#userImplemented)
* [Types](#type)
    * [type Group struct](#Group)
        * [func LookupGroup(name string) (*Group, error)](#LookupGroup)
        * [func LookupGroupId(gid string) (*Group, error)](#LookupGroupId)
        * [func buildGroup(grp *_Ctype_struct_group) *Group](#buildGroup)
        * [func lookupGroup(groupname string) (*Group, error)](#lookupGroup)
        * [func lookupGroupId(gid string) (*Group, error)](#lookupGroupId)
        * [func lookupUnixGid(gid int) (*Group, error)](#lookupUnixGid)
    * [type UnknownGroupError string](#UnknownGroupError)
        * [func (e UnknownGroupError) Error() string](#UnknownGroupError.Error)
    * [type UnknownGroupIdError string](#UnknownGroupIdError)
        * [func (e UnknownGroupIdError) Error() string](#UnknownGroupIdError.Error)
    * [type UnknownUserError string](#UnknownUserError)
        * [func (e UnknownUserError) Error() string](#UnknownUserError.Error)
    * [type UnknownUserIdError int](#UnknownUserIdError)
        * [func (e UnknownUserIdError) Error() string](#UnknownUserIdError.Error)
    * [type User struct](#User)
        * [func Current() (*User, error)](#Current)
        * [func Lookup(username string) (*User, error)](#Lookup)
        * [func LookupId(uid string) (*User, error)](#LookupId)
        * [func buildUser(pwd *_Ctype_struct_passwd) *User](#buildUser)
        * [func current() (*User, error)](#current)
        * [func lookupUnixUid(uid int) (*User, error)](#lookupUnixUid)
        * [func lookupUser(username string) (*User, error)](#lookupUser)
        * [func lookupUserId(uid string) (*User, error)](#lookupUserId)
        * [func (u *User) GroupIds() ([]string, error)](#User.GroupIds)
    * [type bufferKind user._Ctype_int](#bufferKind)
        * [func (k bufferKind) initialSize() _Ctype_size_t](#bufferKind.initialSize)
    * [type memBuffer struct](#memBuffer)
        * [func alloc(kind bufferKind) *memBuffer](#alloc)
        * [func (mb *memBuffer) free()](#memBuffer.free)
        * [func (mb *memBuffer) resize(newSize _Ctype_size_t)](#memBuffer.resize)
* [Functions](#func)
    * [func BenchmarkCurrent(b *testing.B)](#BenchmarkCurrent)
    * [func TestCurrent(t *testing.T)](#TestCurrent)
    * [func TestGroupIds(t *testing.T)](#TestGroupIds)
    * [func TestLookup(t *testing.T)](#TestLookup)
    * [func TestLookupGroup(t *testing.T)](#TestLookupGroup)
    * [func TestLookupId(t *testing.T)](#TestLookupId)
    * [func TestNegativeUid(t *testing.T)](#TestNegativeUid)
    * [func checkGroup(t *testing.T)](#checkGroup)
    * [func checkUser(t *testing.T)](#checkUser)
    * [func compare(t *testing.T, want, got *User)](#compare)
    * [func containsID(ids []string, id string) bool](#containsID)
    * [func getGroupList(name *_Ctype_char, userGID _Ctype_gid_t, gids *_Ctype_gid_t, n *_Ctype_int) _Ctype_int](#getGroupList)
    * [func groupRetry(username string, name []byte, userGID _Ctype_gid_t, gids *[]_Ctype_gid_t, n *_Ctype_int) error](#groupRetry)
    * [func isSizeReasonable(sz int64) bool](#isSizeReasonable)
    * [func listGroups(u *User) ([]string, error)](#listGroups)
    * [func retryWithBuffer(buf *memBuffer, f func() syscall.Errno) error](#retryWithBuffer)
    * [func structPasswdForNegativeTest() _Ctype_struct_passwd](#structPasswdForNegativeTest)


## <a id="const" href="#const">Constants</a>

### <a id="groupBuffer" href="#groupBuffer">const groupBuffer</a>

```
searchKey: user.groupBuffer
tags: [constant number private]
```

```Go
const groupBuffer = bufferKind((_Ciconst__SC_GETGR_R_SIZE_MAX))
```

### <a id="maxBufferSize" href="#maxBufferSize">const maxBufferSize</a>

```
searchKey: user.maxBufferSize
tags: [constant number private]
```

```Go
const maxBufferSize = 1 << 20
```

### <a id="maxGroups" href="#maxGroups">const maxGroups</a>

```
searchKey: user.maxGroups
tags: [constant number private]
```

```Go
const maxGroups = 2048
```

### <a id="userBuffer" href="#userBuffer">const userBuffer</a>

```
searchKey: user.userBuffer
tags: [constant number private]
```

```Go
const userBuffer = bufferKind((_Ciconst__SC_GETPW_R_SIZE_MAX))
```

## <a id="var" href="#var">Variables</a>

### <a id="cache" href="#cache">var cache</a>

```
searchKey: user.cache
tags: [variable struct private]
```

```Go
var cache struct {
	sync.Once
	u   *User
	err error
}
```

cache of the current user 

### <a id="groupImplemented" href="#groupImplemented">var groupImplemented</a>

```
searchKey: user.groupImplemented
tags: [variable boolean private]
```

```Go
var groupImplemented = true // set to false by lookup_stubs.go's init

```

### <a id="userImplemented" href="#userImplemented">var userImplemented</a>

```
searchKey: user.userImplemented
tags: [variable boolean private]
```

```Go
var userImplemented = true // set to false by lookup_stubs.go's init

```

## <a id="type" href="#type">Types</a>

### <a id="Group" href="#Group">type Group struct</a>

```
searchKey: user.Group
tags: [struct]
```

```Go
type Group struct {
	Gid  string // group ID
	Name string // group name
}
```

Group represents a grouping of users. 

On POSIX systems Gid contains a decimal number representing the group ID. 

#### <a id="LookupGroup" href="#LookupGroup">func LookupGroup(name string) (*Group, error)</a>

```
searchKey: user.LookupGroup
tags: [function]
```

```Go
func LookupGroup(name string) (*Group, error)
```

LookupGroup looks up a group by name. If the group cannot be found, the returned error is of type UnknownGroupError. 

#### <a id="LookupGroupId" href="#LookupGroupId">func LookupGroupId(gid string) (*Group, error)</a>

```
searchKey: user.LookupGroupId
tags: [function]
```

```Go
func LookupGroupId(gid string) (*Group, error)
```

LookupGroupId looks up a group by groupid. If the group cannot be found, the returned error is of type UnknownGroupIdError. 

#### <a id="buildGroup" href="#buildGroup">func buildGroup(grp *_Ctype_struct_group) *Group</a>

```
searchKey: user.buildGroup
tags: [function private]
```

```Go
func buildGroup(grp *_Ctype_struct_group) *Group
```

#### <a id="lookupGroup" href="#lookupGroup">func lookupGroup(groupname string) (*Group, error)</a>

```
searchKey: user.lookupGroup
tags: [function private]
```

```Go
func lookupGroup(groupname string) (*Group, error)
```

#### <a id="lookupGroupId" href="#lookupGroupId">func lookupGroupId(gid string) (*Group, error)</a>

```
searchKey: user.lookupGroupId
tags: [function private]
```

```Go
func lookupGroupId(gid string) (*Group, error)
```

#### <a id="lookupUnixGid" href="#lookupUnixGid">func lookupUnixGid(gid int) (*Group, error)</a>

```
searchKey: user.lookupUnixGid
tags: [function private]
```

```Go
func lookupUnixGid(gid int) (*Group, error)
```

### <a id="UnknownGroupError" href="#UnknownGroupError">type UnknownGroupError string</a>

```
searchKey: user.UnknownGroupError
tags: [string]
```

```Go
type UnknownGroupError string
```

UnknownGroupError is returned by LookupGroup when a group cannot be found. 

#### <a id="UnknownGroupError.Error" href="#UnknownGroupError.Error">func (e UnknownGroupError) Error() string</a>

```
searchKey: user.UnknownGroupError.Error
tags: [method]
```

```Go
func (e UnknownGroupError) Error() string
```

### <a id="UnknownGroupIdError" href="#UnknownGroupIdError">type UnknownGroupIdError string</a>

```
searchKey: user.UnknownGroupIdError
tags: [string]
```

```Go
type UnknownGroupIdError string
```

UnknownGroupIdError is returned by LookupGroupId when a group cannot be found. 

#### <a id="UnknownGroupIdError.Error" href="#UnknownGroupIdError.Error">func (e UnknownGroupIdError) Error() string</a>

```
searchKey: user.UnknownGroupIdError.Error
tags: [method]
```

```Go
func (e UnknownGroupIdError) Error() string
```

### <a id="UnknownUserError" href="#UnknownUserError">type UnknownUserError string</a>

```
searchKey: user.UnknownUserError
tags: [string]
```

```Go
type UnknownUserError string
```

UnknownUserError is returned by Lookup when a user cannot be found. 

#### <a id="UnknownUserError.Error" href="#UnknownUserError.Error">func (e UnknownUserError) Error() string</a>

```
searchKey: user.UnknownUserError.Error
tags: [method]
```

```Go
func (e UnknownUserError) Error() string
```

### <a id="UnknownUserIdError" href="#UnknownUserIdError">type UnknownUserIdError int</a>

```
searchKey: user.UnknownUserIdError
tags: [number]
```

```Go
type UnknownUserIdError int
```

UnknownUserIdError is returned by LookupId when a user cannot be found. 

#### <a id="UnknownUserIdError.Error" href="#UnknownUserIdError.Error">func (e UnknownUserIdError) Error() string</a>

```
searchKey: user.UnknownUserIdError.Error
tags: [method]
```

```Go
func (e UnknownUserIdError) Error() string
```

### <a id="User" href="#User">type User struct</a>

```
searchKey: user.User
tags: [struct]
```

```Go
type User struct {
	// Uid is the user ID.
	// On POSIX systems, this is a decimal number representing the uid.
	// On Windows, this is a security identifier (SID) in a string format.
	// On Plan 9, this is the contents of /dev/user.
	Uid string
	// Gid is the primary group ID.
	// On POSIX systems, this is a decimal number representing the gid.
	// On Windows, this is a SID in a string format.
	// On Plan 9, this is the contents of /dev/user.
	Gid string
	// Username is the login name.
	Username string
	// Name is the user's real or display name.
	// It might be blank.
	// On POSIX systems, this is the first (or only) entry in the GECOS field
	// list.
	// On Windows, this is the user's display name.
	// On Plan 9, this is the contents of /dev/user.
	Name string
	// HomeDir is the path to the user's home directory (if they have one).
	HomeDir string
}
```

User represents a user account. 

#### <a id="Current" href="#Current">func Current() (*User, error)</a>

```
searchKey: user.Current
tags: [function]
```

```Go
func Current() (*User, error)
```

Current returns the current user. 

The first call will cache the current user information. Subsequent calls will return the cached value and will not reflect changes to the current user. 

#### <a id="Lookup" href="#Lookup">func Lookup(username string) (*User, error)</a>

```
searchKey: user.Lookup
tags: [function]
```

```Go
func Lookup(username string) (*User, error)
```

Lookup looks up a user by username. If the user cannot be found, the returned error is of type UnknownUserError. 

#### <a id="LookupId" href="#LookupId">func LookupId(uid string) (*User, error)</a>

```
searchKey: user.LookupId
tags: [function]
```

```Go
func LookupId(uid string) (*User, error)
```

LookupId looks up a user by userid. If the user cannot be found, the returned error is of type UnknownUserIdError. 

#### <a id="buildUser" href="#buildUser">func buildUser(pwd *_Ctype_struct_passwd) *User</a>

```
searchKey: user.buildUser
tags: [function private]
```

```Go
func buildUser(pwd *_Ctype_struct_passwd) *User
```

#### <a id="current" href="#current">func current() (*User, error)</a>

```
searchKey: user.current
tags: [function private]
```

```Go
func current() (*User, error)
```

#### <a id="lookupUnixUid" href="#lookupUnixUid">func lookupUnixUid(uid int) (*User, error)</a>

```
searchKey: user.lookupUnixUid
tags: [function private]
```

```Go
func lookupUnixUid(uid int) (*User, error)
```

#### <a id="lookupUser" href="#lookupUser">func lookupUser(username string) (*User, error)</a>

```
searchKey: user.lookupUser
tags: [function private]
```

```Go
func lookupUser(username string) (*User, error)
```

#### <a id="lookupUserId" href="#lookupUserId">func lookupUserId(uid string) (*User, error)</a>

```
searchKey: user.lookupUserId
tags: [function private]
```

```Go
func lookupUserId(uid string) (*User, error)
```

#### <a id="User.GroupIds" href="#User.GroupIds">func (u *User) GroupIds() ([]string, error)</a>

```
searchKey: user.User.GroupIds
tags: [method]
```

```Go
func (u *User) GroupIds() ([]string, error)
```

GroupIds returns the list of group IDs that the user is a member of. 

### <a id="bufferKind" href="#bufferKind">type bufferKind user._Ctype_int</a>

```
searchKey: user.bufferKind
tags: [number private]
```

```Go
type bufferKind _Ctype_int /*line :200:22*/

```

#### <a id="bufferKind.initialSize" href="#bufferKind.initialSize">func (k bufferKind) initialSize() _Ctype_size_t</a>

```
searchKey: user.bufferKind.initialSize
tags: [method private]
```

```Go
func (k bufferKind) initialSize() _Ctype_size_t
```

### <a id="memBuffer" href="#memBuffer">type memBuffer struct</a>

```
searchKey: user.memBuffer
tags: [struct private]
```

```Go
type memBuffer struct {
	ptr  unsafe.Pointer
	size _Ctype_size_t /*line :224:15*/
}
```

#### <a id="alloc" href="#alloc">func alloc(kind bufferKind) *memBuffer</a>

```
searchKey: user.alloc
tags: [function private]
```

```Go
func alloc(kind bufferKind) *memBuffer
```

#### <a id="memBuffer.free" href="#memBuffer.free">func (mb *memBuffer) free()</a>

```
searchKey: user.memBuffer.free
tags: [method private]
```

```Go
func (mb *memBuffer) free()
```

#### <a id="memBuffer.resize" href="#memBuffer.resize">func (mb *memBuffer) resize(newSize _Ctype_size_t)</a>

```
searchKey: user.memBuffer.resize
tags: [method private]
```

```Go
func (mb *memBuffer) resize(newSize _Ctype_size_t)
```

## <a id="func" href="#func">Functions</a>

### <a id="BenchmarkCurrent" href="#BenchmarkCurrent">func BenchmarkCurrent(b *testing.B)</a>

```
searchKey: user.BenchmarkCurrent
tags: [function private benchmark]
```

```Go
func BenchmarkCurrent(b *testing.B)
```

### <a id="TestCurrent" href="#TestCurrent">func TestCurrent(t *testing.T)</a>

```
searchKey: user.TestCurrent
tags: [function private test]
```

```Go
func TestCurrent(t *testing.T)
```

### <a id="TestGroupIds" href="#TestGroupIds">func TestGroupIds(t *testing.T)</a>

```
searchKey: user.TestGroupIds
tags: [function private test]
```

```Go
func TestGroupIds(t *testing.T)
```

### <a id="TestLookup" href="#TestLookup">func TestLookup(t *testing.T)</a>

```
searchKey: user.TestLookup
tags: [function private test]
```

```Go
func TestLookup(t *testing.T)
```

### <a id="TestLookupGroup" href="#TestLookupGroup">func TestLookupGroup(t *testing.T)</a>

```
searchKey: user.TestLookupGroup
tags: [function private test]
```

```Go
func TestLookupGroup(t *testing.T)
```

### <a id="TestLookupId" href="#TestLookupId">func TestLookupId(t *testing.T)</a>

```
searchKey: user.TestLookupId
tags: [function private test]
```

```Go
func TestLookupId(t *testing.T)
```

### <a id="TestNegativeUid" href="#TestNegativeUid">func TestNegativeUid(t *testing.T)</a>

```
searchKey: user.TestNegativeUid
tags: [function private test]
```

```Go
func TestNegativeUid(t *testing.T)
```

Issue 22739 

### <a id="checkGroup" href="#checkGroup">func checkGroup(t *testing.T)</a>

```
searchKey: user.checkGroup
tags: [function private]
```

```Go
func checkGroup(t *testing.T)
```

### <a id="checkUser" href="#checkUser">func checkUser(t *testing.T)</a>

```
searchKey: user.checkUser
tags: [function private]
```

```Go
func checkUser(t *testing.T)
```

### <a id="compare" href="#compare">func compare(t *testing.T, want, got *User)</a>

```
searchKey: user.compare
tags: [function private]
```

```Go
func compare(t *testing.T, want, got *User)
```

### <a id="containsID" href="#containsID">func containsID(ids []string, id string) bool</a>

```
searchKey: user.containsID
tags: [function private]
```

```Go
func containsID(ids []string, id string) bool
```

### <a id="getGroupList" href="#getGroupList">func getGroupList(name *_Ctype_char, userGID _Ctype_gid_t, gids *_Ctype_gid_t, n *_Ctype_int) _Ctype_int</a>

```
searchKey: user.getGroupList
tags: [function private]
```

```Go
func getGroupList(name *_Ctype_char, userGID _Ctype_gid_t, gids *_Ctype_gid_t, n *_Ctype_int) _Ctype_int
```

### <a id="groupRetry" href="#groupRetry">func groupRetry(username string, name []byte, userGID _Ctype_gid_t, gids *[]_Ctype_gid_t, n *_Ctype_int) error</a>

```
searchKey: user.groupRetry
tags: [function private]
```

```Go
func groupRetry(username string, name []byte, userGID _Ctype_gid_t, gids *[]_Ctype_gid_t, n *_Ctype_int) error
```

groupRetry retries getGroupList with an increasingly large size for n. The result is stored in gids. 

### <a id="isSizeReasonable" href="#isSizeReasonable">func isSizeReasonable(sz int64) bool</a>

```
searchKey: user.isSizeReasonable
tags: [function private]
```

```Go
func isSizeReasonable(sz int64) bool
```

### <a id="listGroups" href="#listGroups">func listGroups(u *User) ([]string, error)</a>

```
searchKey: user.listGroups
tags: [function private]
```

```Go
func listGroups(u *User) ([]string, error)
```

### <a id="retryWithBuffer" href="#retryWithBuffer">func retryWithBuffer(buf *memBuffer, f func() syscall.Errno) error</a>

```
searchKey: user.retryWithBuffer
tags: [function private]
```

```Go
func retryWithBuffer(buf *memBuffer, f func() syscall.Errno) error
```

retryWithBuffer repeatedly calls f(), increasing the size of the buffer each time, until f succeeds, fails with a non-ERANGE error, or the buffer exceeds a reasonable limit. 

### <a id="structPasswdForNegativeTest" href="#structPasswdForNegativeTest">func structPasswdForNegativeTest() _Ctype_struct_passwd</a>

```
searchKey: user.structPasswdForNegativeTest
tags: [function private]
```

```Go
func structPasswdForNegativeTest() _Ctype_struct_passwd
```

Because we can't use cgo in tests: 

