# Package resolvers

## Index

* [Types](#type)
    * [type LicenseResolver struct{}](#LicenseResolver)
        * [func (LicenseResolver) EnterpriseLicenseHasFeature(ctx context.Context, args *graphqlbackend.EnterpriseLicenseHasFeatureArgs) (bool, error)](#LicenseResolver.EnterpriseLicenseHasFeature)
* [Functions](#func)
    * [func TestEnterpriseLicenseHasFeature(t *testing.T)](#TestEnterpriseLicenseHasFeature)


## <a id="type" href="#type">Types</a>

```
tags: [private]
```

### <a id="LicenseResolver" href="#LicenseResolver">type LicenseResolver struct{}</a>

```
searchKey: resolvers.LicenseResolver
tags: [struct]
```

```Go
type LicenseResolver struct{}
```

#### <a id="LicenseResolver.EnterpriseLicenseHasFeature" href="#LicenseResolver.EnterpriseLicenseHasFeature">func (LicenseResolver) EnterpriseLicenseHasFeature(ctx context.Context, args *graphqlbackend.EnterpriseLicenseHasFeatureArgs) (bool, error)</a>

```
searchKey: resolvers.LicenseResolver.EnterpriseLicenseHasFeature
tags: [method]
```

```Go
func (LicenseResolver) EnterpriseLicenseHasFeature(ctx context.Context, args *graphqlbackend.EnterpriseLicenseHasFeatureArgs) (bool, error)
```

## <a id="func" href="#func">Functions</a>

```
tags: [private]
```

### <a id="TestEnterpriseLicenseHasFeature" href="#TestEnterpriseLicenseHasFeature">func TestEnterpriseLicenseHasFeature(t *testing.T)</a>

```
searchKey: resolvers.TestEnterpriseLicenseHasFeature
tags: [function private test]
```

```Go
func TestEnterpriseLicenseHasFeature(t *testing.T)
```

