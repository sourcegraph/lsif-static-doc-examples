# Package global

## Index

* [Functions](#func)
    * [func DefaultReconcilerEnqueueState() btypes.ReconcilerState](#DefaultReconcilerEnqueueState)
    * [func TestDefaultReconcilerEnqueueState(t *testing.T)](#TestDefaultReconcilerEnqueueState)


## <a id="func" href="#func">Functions</a>

```
tags: [package private]
```

### <a id="DefaultReconcilerEnqueueState" href="#DefaultReconcilerEnqueueState">func DefaultReconcilerEnqueueState() btypes.ReconcilerState</a>

```
searchKey: global.DefaultReconcilerEnqueueState
tags: [function]
```

```Go
func DefaultReconcilerEnqueueState() btypes.ReconcilerState
```

DefaultReconcilerEnqueueState returns the reconciler state that should be used when enqueuing a changeset: this may be ReconcilerStateQueued or ReconcilerStateScheduled depending on the site configuration. 

### <a id="TestDefaultReconcilerEnqueueState" href="#TestDefaultReconcilerEnqueueState">func TestDefaultReconcilerEnqueueState(t *testing.T)</a>

```
searchKey: global.TestDefaultReconcilerEnqueueState
tags: [method private test]
```

```Go
func TestDefaultReconcilerEnqueueState(t *testing.T)
```

