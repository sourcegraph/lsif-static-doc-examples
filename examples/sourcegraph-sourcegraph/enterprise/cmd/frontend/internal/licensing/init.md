# Package init

## Index

* [Types](#type)
    * [type usersStore struct](#usersStore)
        * [func (u *usersStore) Count(ctx context.Context) (int, error)](#usersStore.Count)
* [Functions](#func)
    * [func Init(ctx context.Context, db dbutil.DB, outOfBandMigrationRunner *oobmigration.Runner, enterpriseServices *enterprise.Services) error](#Init)


## <a id="type" href="#type">Types</a>

### <a id="usersStore" href="#usersStore">type usersStore struct</a>

```
searchKey: init.usersStore
```

```Go
type usersStore struct {
	db dbutil.DB
}
```

#### <a id="usersStore.Count" href="#usersStore.Count">func (u *usersStore) Count(ctx context.Context) (int, error)</a>

```
searchKey: init.usersStore.Count
```

```Go
func (u *usersStore) Count(ctx context.Context) (int, error)
```

## <a id="func" href="#func">Functions</a>

### <a id="Init" href="#Init">func Init(ctx context.Context, db dbutil.DB, outOfBandMigrationRunner *oobmigration.Runner, enterpriseServices *enterprise.Services) error</a>

```
searchKey: init.Init
tags: [exported]
```

```Go
func Init(ctx context.Context, db dbutil.DB, outOfBandMigrationRunner *oobmigration.Runner, enterpriseServices *enterprise.Services) error
```

TODO(efritz) - de-globalize assignments in this function TODO(efritz) - refactor licensing packages - this is a huge mess! 

