# Package perforce

## Index

* [Types](#type)
    * [type AccountData struct](#AccountData)
        * [func GetExternalAccountData(data *extsvc.AccountData) (accountData *AccountData, err error)](#GetExternalAccountData)
    * [type Depot struct](#Depot)


## <a id="type" href="#type">Types</a>

### <a id="AccountData" href="#AccountData">type AccountData struct</a>

```
searchKey: perforce.AccountData
tags: [exported]
```

```Go
type AccountData struct {
	Username string `json:"username"`
	Email    string `json:"email"`
}
```

AccountData stores information of a Perforce Server account. 

#### <a id="GetExternalAccountData" href="#GetExternalAccountData">func GetExternalAccountData(data *extsvc.AccountData) (accountData *AccountData, err error)</a>

```
searchKey: perforce.GetExternalAccountData
tags: [exported]
```

```Go
func GetExternalAccountData(data *extsvc.AccountData) (accountData *AccountData, err error)
```

GetExternalAccountData extracts account data for the external account. 

### <a id="Depot" href="#Depot">type Depot struct</a>

```
searchKey: perforce.Depot
tags: [exported]
```

```Go
type Depot struct {
	Depot string `json:"depot"` // Depot is the path of the Perforce depot.
}
```

Depot contains information of a Perforce depot. 

