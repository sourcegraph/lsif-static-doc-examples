# Package suspiciousnames

Package suspiciousnames contains a blocklist of suspicious names for users and organizations. 

## Index

* [Variables](#var)
    * [var suspiciousNames](#suspiciousNames)
* [Functions](#func)
    * [func CheckNameAllowedForUserOrOrganization(desiredName string) error](#CheckNameAllowedForUserOrOrganization)
    * [func isSuspicious(desiredName string) bool](#isSuspicious)


## <a id="var" href="#var">Variables</a>

```
tags: [private]
```

### <a id="suspiciousNames" href="#suspiciousNames">var suspiciousNames</a>

```
searchKey: suspiciousnames.suspiciousNames
tags: [private]
```

```Go
var suspiciousNames = ...
```

## <a id="func" href="#func">Functions</a>

```
tags: [private]
```

### <a id="CheckNameAllowedForUserOrOrganization" href="#CheckNameAllowedForUserOrOrganization">func CheckNameAllowedForUserOrOrganization(desiredName string) error</a>

```
searchKey: suspiciousnames.CheckNameAllowedForUserOrOrganization
```

```Go
func CheckNameAllowedForUserOrOrganization(desiredName string) error
```

CheckNameAllowedForUserOrOrganization returns a non-nil error if the desired username or organization name is suspicious and the currently running site is Sourcegraph.com. 

It is intended to prevent users/organizations on Sourcegraph.com from changing their name to a name that is likely to be confused with an admin or official account (such as "admin", "root", etc.). 

🚨 SECURITY: This is not foolproof; users may choose a name like `secur1ty` that might be confused with a name like "security", or they might find another synonym that we didn't think of. 

### <a id="isSuspicious" href="#isSuspicious">func isSuspicious(desiredName string) bool</a>

```
searchKey: suspiciousnames.isSuspicious
tags: [private]
```

```Go
func isSuspicious(desiredName string) bool
```

