# Package dotcom

## Index

* Subpages
  * [enterprise/cmd/frontend/internal/dotcom/billing](dotcom/billing.md)
  * [enterprise/cmd/frontend/internal/dotcom/productsubscription](dotcom/productsubscription.md)
  * [enterprise/cmd/frontend/internal/dotcom/stripeutil](dotcom/stripeutil.md)
* [Types](#type)
    * [type dotcomRootResolver struct](#dotcomRootResolver)
        * [func (d dotcomRootResolver) Dotcom() graphqlbackend.DotcomResolver](#dotcomRootResolver.Dotcom)
        * [func (d dotcomRootResolver) NodeResolvers() map[string]graphqlbackend.NodeByIDFunc](#dotcomRootResolver.NodeResolvers)
* [Functions](#func)
    * [func Init(ctx context.Context, db dbutil.DB, outOfBandMigrationRunner *oobmigration.Runner, enterpriseServices *enterprise.Services) error](#Init)


## <a id="type" href="#type">Types</a>

```
tags: [package private]
```

### <a id="dotcomRootResolver" href="#dotcomRootResolver">type dotcomRootResolver struct</a>

```
searchKey: dotcom.dotcomRootResolver
tags: [struct private]
```

```Go
type dotcomRootResolver struct {
	productsubscription.ProductSubscriptionLicensingResolver
	billing.BillingResolver
}
```

dotcomRootResolver implements the GraphQL types DotcomMutation and DotcomQuery. 

#### <a id="dotcomRootResolver.Dotcom" href="#dotcomRootResolver.Dotcom">func (d dotcomRootResolver) Dotcom() graphqlbackend.DotcomResolver</a>

```
searchKey: dotcom.dotcomRootResolver.Dotcom
tags: [function private]
```

```Go
func (d dotcomRootResolver) Dotcom() graphqlbackend.DotcomResolver
```

#### <a id="dotcomRootResolver.NodeResolvers" href="#dotcomRootResolver.NodeResolvers">func (d dotcomRootResolver) NodeResolvers() map[string]graphqlbackend.NodeByIDFunc</a>

```
searchKey: dotcom.dotcomRootResolver.NodeResolvers
tags: [function private]
```

```Go
func (d dotcomRootResolver) NodeResolvers() map[string]graphqlbackend.NodeByIDFunc
```

## <a id="func" href="#func">Functions</a>

```
tags: [package private]
```

### <a id="Init" href="#Init">func Init(ctx context.Context, db dbutil.DB, outOfBandMigrationRunner *oobmigration.Runner, enterpriseServices *enterprise.Services) error</a>

```
searchKey: dotcom.Init
tags: [method]
```

```Go
func Init(ctx context.Context, db dbutil.DB, outOfBandMigrationRunner *oobmigration.Runner, enterpriseServices *enterprise.Services) error
```

