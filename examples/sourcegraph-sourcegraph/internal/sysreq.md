# Package sysreq

Package sysreq implements checking for Sourcegraph system requirements. 

## Index

* [Variables](#var)
    * [var checks](#checks)
* [Types](#type)
    * [type CheckFunc func(context.Context) (problem string, fix string, err error)](#CheckFunc)
    * [type Status struct](#Status)
        * [func (s *Status) Failed() bool](#Status.Failed)
        * [func (s *Status) OK() bool](#Status.OK)
    * [type check struct](#check)
* [Functions](#func)
    * [func AddCheck(name string, fn CheckFunc)](#AddCheck)
    * [func Check(ctx context.Context, skip []string) []Status](#Check)
    * [func TestCheck(t *testing.T)](#TestCheck)
    * [func TestCheck_skip(t *testing.T)](#TestCheck_skip)
    * [func rlimitCheck(ctx context.Context) (problem, fix string, err error)](#rlimitCheck)


## <a id="var" href="#var">Variables</a>

```
tags: [private]
```

### <a id="checks" href="#checks">var checks</a>

```
searchKey: sysreq.checks
tags: [variable array struct private]
```

```Go
var checks = []check{
	{
		Name:  "Rlimit",
		Check: rlimitCheck,
	},
}
```

## <a id="type" href="#type">Types</a>

```
tags: [private]
```

### <a id="CheckFunc" href="#CheckFunc">type CheckFunc func(context.Context) (problem string, fix string, err error)</a>

```
searchKey: sysreq.CheckFunc
tags: [function]
```

```Go
type CheckFunc func(context.Context) (problem, fix string, err error)
```

CheckFunc is a function that checks for a system requirement. If any of problem, fix, or err are non-zero, then the system requirement check is deemed to have failed. 

### <a id="Status" href="#Status">type Status struct</a>

```
searchKey: sysreq.Status
tags: [struct]
```

```Go
type Status struct {
	Name    string // the required component
	Problem string // if non-empty, a description of the problem
	Fix     string // if non-empty, how to fix the problem
	Err     error  // if non-nil, the error encountered
	Skipped bool   // if true, indicates this check was skipped
}
```

Status describes the status of a system requirement. 

#### <a id="Status.Failed" href="#Status.Failed">func (s *Status) Failed() bool</a>

```
searchKey: sysreq.Status.Failed
tags: [method]
```

```Go
func (s *Status) Failed() bool
```

#### <a id="Status.OK" href="#Status.OK">func (s *Status) OK() bool</a>

```
searchKey: sysreq.Status.OK
tags: [method]
```

```Go
func (s *Status) OK() bool
```

OK is whether the component is present, has no errors, and was not skipped. 

### <a id="check" href="#check">type check struct</a>

```
searchKey: sysreq.check
tags: [struct private]
```

```Go
type check struct {
	Name  string
	Check CheckFunc
}
```

## <a id="func" href="#func">Functions</a>

```
tags: [private]
```

### <a id="AddCheck" href="#AddCheck">func AddCheck(name string, fn CheckFunc)</a>

```
searchKey: sysreq.AddCheck
tags: [function]
```

```Go
func AddCheck(name string, fn CheckFunc)
```

AddCheck adds a new check that will be run when this package's Check func is called. It is used by other packages to specify system requirements. 

### <a id="Check" href="#Check">func Check(ctx context.Context, skip []string) []Status</a>

```
searchKey: sysreq.Check
tags: [function]
```

```Go
func Check(ctx context.Context, skip []string) []Status
```

Check checks for the presence of system requirements, such as Docker and Git. The skip list contains case-insensitive names of requirement checks (such as "Docker" and "Git") that should be skipped. 

### <a id="TestCheck" href="#TestCheck">func TestCheck(t *testing.T)</a>

```
searchKey: sysreq.TestCheck
tags: [function private test]
```

```Go
func TestCheck(t *testing.T)
```

### <a id="TestCheck_skip" href="#TestCheck_skip">func TestCheck_skip(t *testing.T)</a>

```
searchKey: sysreq.TestCheck_skip
tags: [function private test]
```

```Go
func TestCheck_skip(t *testing.T)
```

### <a id="rlimitCheck" href="#rlimitCheck">func rlimitCheck(ctx context.Context) (problem, fix string, err error)</a>

```
searchKey: sysreq.rlimitCheck
tags: [function private]
```

```Go
func rlimitCheck(ctx context.Context) (problem, fix string, err error)
```

