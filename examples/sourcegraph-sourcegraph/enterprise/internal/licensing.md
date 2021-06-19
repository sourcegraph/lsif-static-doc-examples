# Package licensing

Package licensing handles parsing, verifying, and enforcing the product subscription (specified in site configuration). 

## Index

* Subpages
  * [enterprise/internal/licensing/resolvers](licensing/resolvers.md)
* [Constants](#const)
    * [const oldEnterpriseStarter](#oldEnterpriseStarter)
    * [const oldEnterprise](#oldEnterprise)
    * [const team](#team)
    * [const enterprise](#enterprise)
    * [const FeatureACLs](#FeatureACLs)
    * [const FeatureExtensionRegistry](#FeatureExtensionRegistry)
    * [const FeatureRemoteExtensionsAllowDisallow](#FeatureRemoteExtensionsAllowDisallow)
    * [const FeatureBranding](#FeatureBranding)
    * [const FeatureCampaigns](#FeatureCampaigns)
    * [const FeatureBatchChanges](#FeatureBatchChanges)
    * [const FeatureMonitoring](#FeatureMonitoring)
    * [const FeatureBackupAndRestore](#FeatureBackupAndRestore)
    * [const NoLicenseMaximumExternalServiceCount](#NoLicenseMaximumExternalServiceCount)
    * [const licenseGenerationPrivateKeyURL](#licenseGenerationPrivateKeyURL)
    * [const planTagPrefix](#planTagPrefix)
    * [const TrueUpUserCountTag](#TrueUpUserCountTag)
    * [const NoLicenseMaximumAllowedUserCount](#NoLicenseMaximumAllowedUserCount)
    * [const NoLicenseWarningUserCount](#NoLicenseWarningUserCount)
    * [const testPlan](#testPlan)
* [Variables](#var)
    * [var allPlans](#allPlans)
    * [var planFeatures](#planFeatures)
    * [var EnforceTiers](#EnforceTiers)
    * [var MockCheckFeature](#MockCheckFeature)
    * [var publicKey](#publicKey)
    * [var MockParseProductLicenseKeyWithBuiltinOrGenerationKey](#MockParseProductLicenseKeyWithBuiltinOrGenerationKey)
    * [var mu](#mu)
    * [var lastKeyText](#lastKeyText)
    * [var lastInfo](#lastInfo)
    * [var lastSignature](#lastSignature)
    * [var MockGetConfiguredProductLicenseInfo](#MockGetConfiguredProductLicenseInfo)
    * [var envLicenseGenerationPrivateKey](#envLicenseGenerationPrivateKey)
    * [var licenseGenerationPrivateKey](#licenseGenerationPrivateKey)
    * [var pool](#pool)
    * [var keyPrefix](#keyPrefix)
    * [var started](#started)
* [Types](#type)
    * [type Feature string](#Feature)
    * [type featureNotActivatedError struct](#featureNotActivatedError)
        * [func NewFeatureNotActivatedError(message string) featureNotActivatedError](#NewFeatureNotActivatedError)
    * [type Info struct](#Info)
        * [func toInfo(origInfo *license.Info, origSignature string, origErr error) (info *Info, signature string, err error)](#toInfo)
        * [func ParseProductLicenseKey(licenseKey string) (info *Info, signature string, err error)](#ParseProductLicenseKey)
        * [func ParseProductLicenseKeyWithBuiltinOrGenerationKey(licenseKey string) (*Info, string, error)](#ParseProductLicenseKeyWithBuiltinOrGenerationKey)
        * [func GetConfiguredProductLicenseInfo() (*Info, error)](#GetConfiguredProductLicenseInfo)
        * [func GetConfiguredProductLicenseInfoWithSignature() (*Info, string, error)](#GetConfiguredProductLicenseInfoWithSignature)
        * [func (info *Info) Plan() Plan](#Info.Plan)
        * [func (info *Info) hasUnknownPlan() error](#Info.hasUnknownPlan)
    * [type Plan string](#Plan)
        * [func (p Plan) HasFeature(feature Feature) bool](#Plan.HasFeature)
        * [func (p Plan) tag() string](#Plan.tag)
        * [func (p Plan) isKnown() bool](#Plan.isKnown)
        * [func (p Plan) MaxExternalServiceCount() int](#Plan.MaxExternalServiceCount)
    * [type UsersStore interface](#UsersStore)
* [Functions](#func)
    * [func init()](#init)
    * [func Check(feature Feature) error](#Check)
    * [func checkFeature(info *Info, feature Feature) error](#checkFeature)
    * [func TestingSkipFeatureChecks() func()](#TestingSkipFeatureChecks)
    * [func IsFeatureNotActivated(err error) bool](#IsFeatureNotActivated)
    * [func IsFeatureEnabledLenient(feature Feature) bool](#IsFeatureEnabledLenient)
    * [func GenerateProductLicenseKey(info license.Info) (string, error)](#GenerateProductLicenseKey)
    * [func ProductNameWithBrand(hasLicense bool, licenseTags []string) string](#ProductNameWithBrand)
    * [func setMaxUsers(key string, count int) error](#setMaxUsers)
    * [func GetMaxUsers(signature string) (int, string, error)](#GetMaxUsers)
    * [func getMaxUsers(c redis.Conn, key string) (int, string, error)](#getMaxUsers)
    * [func checkMaxUsers(ctx context.Context, s UsersStore, signature string) error](#checkMaxUsers)
    * [func maxUsersKey() string](#maxUsersKey)
    * [func maxUsersTimeKey() string](#maxUsersTimeKey)
    * [func ActualUserCount(ctx context.Context) (int32, error)](#ActualUserCount)
    * [func ActualUserCountDate(ctx context.Context) (string, error)](#ActualUserCountDate)
    * [func StartMaxUserCount(s UsersStore)](#StartMaxUserCount)
    * [func TestCheckFeature(t *testing.T)](#TestCheckFeature)
    * [func init()](#init)
    * [func TestPlan_isKnown(t *testing.T)](#TestPlan_isKnown)
    * [func TestInfo_Plan(t *testing.T)](#TestInfo_Plan)
    * [func TestInfo_hasUnknownPlan(t *testing.T)](#TestInfo_hasUnknownPlan)
    * [func TestProductNameWithBrand(t *testing.T)](#TestProductNameWithBrand)


## <a id="const" href="#const">Constants</a>

### <a id="oldEnterpriseStarter" href="#oldEnterpriseStarter">const oldEnterpriseStarter</a>

```
searchKey: licensing.oldEnterpriseStarter
```

```Go
const oldEnterpriseStarter Plan = "old-starter-0"
```

The list of plans. 

oldEnterpriseStarter is the old "Enterprise Starter" plan. 

### <a id="oldEnterprise" href="#oldEnterprise">const oldEnterprise</a>

```
searchKey: licensing.oldEnterprise
```

```Go
const oldEnterprise Plan = "old-enterprise-0"
```

The list of plans. 

oldEnterprise is the old "Enterprise" plan. 

### <a id="team" href="#team">const team</a>

```
searchKey: licensing.team
```

```Go
const team Plan = "team-0"
```

The list of plans. 

team is the "Team" plan. 

### <a id="enterprise" href="#enterprise">const enterprise</a>

```
searchKey: licensing.enterprise
```

```Go
const enterprise Plan = "enterprise-0"
```

The list of plans. 

enterprise is the "Enterprise" plan. 

### <a id="FeatureACLs" href="#FeatureACLs">const FeatureACLs</a>

```
searchKey: licensing.FeatureACLs
tags: [exported]
```

```Go
const FeatureACLs Feature = "acls"
```

The list of features. For each feature, add a new const here and the checking logic in isFeatureEnabled. 

FeatureACLs is whether ACLs may be used, such as GitHub, GitLab or Bitbucket Server repository permissions and integration with GitHub, GitLab or Bitbucket Server for user authentication. 

### <a id="FeatureExtensionRegistry" href="#FeatureExtensionRegistry">const FeatureExtensionRegistry</a>

```
searchKey: licensing.FeatureExtensionRegistry
tags: [exported]
```

```Go
const FeatureExtensionRegistry Feature = "private-extension-registry"
```

The list of features. For each feature, add a new const here and the checking logic in isFeatureEnabled. 

FeatureExtensionRegistry is whether publishing extensions to this Sourcegraph instance has been purchased. If not, then extensions must be published to Sourcegraph.com. All instances may use extensions published to Sourcegraph.com. 

### <a id="FeatureRemoteExtensionsAllowDisallow" href="#FeatureRemoteExtensionsAllowDisallow">const FeatureRemoteExtensionsAllowDisallow</a>

```
searchKey: licensing.FeatureRemoteExtensionsAllowDisallow
tags: [exported]
```

```Go
const FeatureRemoteExtensionsAllowDisallow Feature = "remote-extensions-allow-disallow"
```

The list of features. For each feature, add a new const here and the checking logic in isFeatureEnabled. 

FeatureRemoteExtensionsAllowDisallow is whether explicitly specify a list of allowed remote extensions and prevent any other remote extensions from being used has been purchased. It does not apply to locally published extensions. 

### <a id="FeatureBranding" href="#FeatureBranding">const FeatureBranding</a>

```
searchKey: licensing.FeatureBranding
tags: [exported]
```

```Go
const FeatureBranding Feature = "branding"
```

The list of features. For each feature, add a new const here and the checking logic in isFeatureEnabled. 

FeatureBranding is whether custom branding of this Sourcegraph instance has been purchased. 

### <a id="FeatureCampaigns" href="#FeatureCampaigns">const FeatureCampaigns</a>

```
searchKey: licensing.FeatureCampaigns
tags: [exported deprecated]
```

```Go
const FeatureCampaigns Feature = "campaigns"
```

The list of features. For each feature, add a new const here and the checking logic in isFeatureEnabled. 

FeatureCampaigns is whether campaigns (now: batch changes) on this Sourcegraph instance has been purchased. 

DEPRECATED: See FeatureBatchChanges. 

### <a id="FeatureBatchChanges" href="#FeatureBatchChanges">const FeatureBatchChanges</a>

```
searchKey: licensing.FeatureBatchChanges
tags: [exported]
```

```Go
const FeatureBatchChanges Feature = "batch-changes"
```

The list of features. For each feature, add a new const here and the checking logic in isFeatureEnabled. 

FeatureBatchChanges is whether Batch Changes on this Sourcegraph instance has been purchased. 

### <a id="FeatureMonitoring" href="#FeatureMonitoring">const FeatureMonitoring</a>

```
searchKey: licensing.FeatureMonitoring
tags: [exported]
```

```Go
const FeatureMonitoring Feature = "monitoring"
```

The list of features. For each feature, add a new const here and the checking logic in isFeatureEnabled. 

FeatureMonitoring is whether monitoring on this Sourcegraph instance has been purchased. 

### <a id="FeatureBackupAndRestore" href="#FeatureBackupAndRestore">const FeatureBackupAndRestore</a>

```
searchKey: licensing.FeatureBackupAndRestore
tags: [exported]
```

```Go
const FeatureBackupAndRestore Feature = "backup-and-restore"
```

The list of features. For each feature, add a new const here and the checking logic in isFeatureEnabled. 

FeatureBackupAndRestore is whether builtin backup and restore on this Sourcegraph instance has been purchased. 

### <a id="NoLicenseMaximumExternalServiceCount" href="#NoLicenseMaximumExternalServiceCount">const NoLicenseMaximumExternalServiceCount</a>

```
searchKey: licensing.NoLicenseMaximumExternalServiceCount
tags: [exported]
```

```Go
const NoLicenseMaximumExternalServiceCount = 1
```

NoLicenseMaximumExternalServiceCount is the maximum number of external services that the instance supports when running without a license. 

### <a id="licenseGenerationPrivateKeyURL" href="#licenseGenerationPrivateKeyURL">const licenseGenerationPrivateKeyURL</a>

```
searchKey: licensing.licenseGenerationPrivateKeyURL
```

```Go
const licenseGenerationPrivateKeyURL = ...
```

licenseGenerationPrivateKeyURL is the URL where Sourcegraph staff can find the private key for generating licenses. 

NOTE: If you change this, use text search to replace other instances of it (in source code comments). 

### <a id="planTagPrefix" href="#planTagPrefix">const planTagPrefix</a>

```
searchKey: licensing.planTagPrefix
```

```Go
const planTagPrefix = "plan:"
```

### <a id="TrueUpUserCountTag" href="#TrueUpUserCountTag">const TrueUpUserCountTag</a>

```
searchKey: licensing.TrueUpUserCountTag
tags: [exported]
```

```Go
const TrueUpUserCountTag = "true-up"
```

TrueUpUserCountTag is the license tag that indicates that the licensed user count can be exceeded and will be charged later. 

### <a id="NoLicenseMaximumAllowedUserCount" href="#NoLicenseMaximumAllowedUserCount">const NoLicenseMaximumAllowedUserCount</a>

```
searchKey: licensing.NoLicenseMaximumAllowedUserCount
tags: [exported]
```

```Go
const NoLicenseMaximumAllowedUserCount int32 = 10
```

NoLicenseMaximumAllowedUserCount is the maximum number of user accounts that may exist when running without a license. Exceeding this number of user accounts requires a license. 

### <a id="NoLicenseWarningUserCount" href="#NoLicenseWarningUserCount">const NoLicenseWarningUserCount</a>

```
searchKey: licensing.NoLicenseWarningUserCount
tags: [exported]
```

```Go
const NoLicenseWarningUserCount int32 = 10
```

NoLicenseWarningUserCount is the number of user accounts when all users are shown a warning (when running without a license). 

### <a id="testPlan" href="#testPlan">const testPlan</a>

```
searchKey: licensing.testPlan
```

```Go
const testPlan Plan = "test"
```

## <a id="var" href="#var">Variables</a>

### <a id="allPlans" href="#allPlans">var allPlans</a>

```
searchKey: licensing.allPlans
```

```Go
var allPlans = []Plan{
	oldEnterpriseStarter,
	oldEnterprise,
	team,
	enterprise,
}
```

### <a id="planFeatures" href="#planFeatures">var planFeatures</a>

```
searchKey: licensing.planFeatures
```

```Go
var planFeatures = ...
```

planFeatures defines the features that are enabled for each plan. 

### <a id="EnforceTiers" href="#EnforceTiers">var EnforceTiers</a>

```
searchKey: licensing.EnforceTiers
tags: [exported]
```

```Go
var EnforceTiers, _ = ...
```

EnforceTiers is a temporary flag to indicate whether to enforce new license tier constraints defined in RFC 167 to incrementally merge changes into main branch, we'll remove it once fully implemented the RFC. 

### <a id="MockCheckFeature" href="#MockCheckFeature">var MockCheckFeature</a>

```
searchKey: licensing.MockCheckFeature
tags: [exported]
```

```Go
var MockCheckFeature func(feature Feature) error
```

MockCheckFeature is for mocking Check in tests. 

### <a id="publicKey" href="#publicKey">var publicKey</a>

```
searchKey: licensing.publicKey
```

```Go
var publicKey = ...
```

publicKey is the public key used to verify product license keys. 

### <a id="MockParseProductLicenseKeyWithBuiltinOrGenerationKey" href="#MockParseProductLicenseKeyWithBuiltinOrGenerationKey">var MockParseProductLicenseKeyWithBuiltinOrGenerationKey</a>

```
searchKey: licensing.MockParseProductLicenseKeyWithBuiltinOrGenerationKey
tags: [exported]
```

```Go
var MockParseProductLicenseKeyWithBuiltinOrGenerationKey func(licenseKey string) (*Info, string, error) = ...
```

### <a id="mu" href="#mu">var mu</a>

```
searchKey: licensing.mu
```

```Go
var mu sync.Mutex
```

Cache the parsing of the license key because public key crypto can be slow. 

### <a id="lastKeyText" href="#lastKeyText">var lastKeyText</a>

```
searchKey: licensing.lastKeyText
```

```Go
var lastKeyText string
```

Cache the parsing of the license key because public key crypto can be slow. 

### <a id="lastInfo" href="#lastInfo">var lastInfo</a>

```
searchKey: licensing.lastInfo
```

```Go
var lastInfo *Info
```

Cache the parsing of the license key because public key crypto can be slow. 

### <a id="lastSignature" href="#lastSignature">var lastSignature</a>

```
searchKey: licensing.lastSignature
```

```Go
var lastSignature string
```

Cache the parsing of the license key because public key crypto can be slow. 

### <a id="MockGetConfiguredProductLicenseInfo" href="#MockGetConfiguredProductLicenseInfo">var MockGetConfiguredProductLicenseInfo</a>

```
searchKey: licensing.MockGetConfiguredProductLicenseInfo
tags: [exported]
```

```Go
var MockGetConfiguredProductLicenseInfo func() (*license.Info, string, error)
```

### <a id="envLicenseGenerationPrivateKey" href="#envLicenseGenerationPrivateKey">var envLicenseGenerationPrivateKey</a>

```
searchKey: licensing.envLicenseGenerationPrivateKey
```

```Go
var envLicenseGenerationPrivateKey = ...
```

envLicenseGenerationPrivateKey (the env var SOURCEGRAPH_LICENSE_GENERATION_KEY) is the PEM-encoded form of the private key used to sign product license keys. It is stored at [https://team-sourcegraph.1password.com/vaults/dnrhbauihkhjs5ag6vszsme45a/allitems/zkdx6gpw4uqejs3flzj7ef5j4i](https://team-sourcegraph.1password.com/vaults/dnrhbauihkhjs5ag6vszsme45a/allitems/zkdx6gpw4uqejs3flzj7ef5j4i). 

### <a id="licenseGenerationPrivateKey" href="#licenseGenerationPrivateKey">var licenseGenerationPrivateKey</a>

```
searchKey: licensing.licenseGenerationPrivateKey
```

```Go
var licenseGenerationPrivateKey = ...
```

licenseGenerationPrivateKey is the private key used to generate license keys. 

### <a id="pool" href="#pool">var pool</a>

```
searchKey: licensing.pool
```

```Go
var pool = redispool.Store
```

### <a id="keyPrefix" href="#keyPrefix">var keyPrefix</a>

```
searchKey: licensing.keyPrefix
```

```Go
var keyPrefix = "license_user_count:"
```

### <a id="started" href="#started">var started</a>

```
searchKey: licensing.started
```

```Go
var started bool
```

## <a id="type" href="#type">Types</a>

### <a id="Feature" href="#Feature">type Feature string</a>

```
searchKey: licensing.Feature
tags: [exported]
```

```Go
type Feature string
```

Feature is a product feature that is selectively activated based on the current license key. 

### <a id="featureNotActivatedError" href="#featureNotActivatedError">type featureNotActivatedError struct</a>

```
searchKey: licensing.featureNotActivatedError
```

```Go
type featureNotActivatedError struct{ errcode.PresentationError }
```

#### <a id="NewFeatureNotActivatedError" href="#NewFeatureNotActivatedError">func NewFeatureNotActivatedError(message string) featureNotActivatedError</a>

```
searchKey: licensing.NewFeatureNotActivatedError
tags: [exported]
```

```Go
func NewFeatureNotActivatedError(message string) featureNotActivatedError
```

### <a id="Info" href="#Info">type Info struct</a>

```
searchKey: licensing.Info
tags: [exported]
```

```Go
type Info struct {
	license.Info
}
```

Info wraps the lower-level license.Info and exposes plan and feature information. 

#### <a id="toInfo" href="#toInfo">func toInfo(origInfo *license.Info, origSignature string, origErr error) (info *Info, signature string, err error)</a>

```
searchKey: licensing.toInfo
```

```Go
func toInfo(origInfo *license.Info, origSignature string, origErr error) (info *Info, signature string, err error)
```

toInfo converts from the return type of license.ParseSignedKey to the return type of this package's methods (which use the Info wrapper type). 

#### <a id="ParseProductLicenseKey" href="#ParseProductLicenseKey">func ParseProductLicenseKey(licenseKey string) (info *Info, signature string, err error)</a>

```
searchKey: licensing.ParseProductLicenseKey
tags: [exported]
```

```Go
func ParseProductLicenseKey(licenseKey string) (info *Info, signature string, err error)
```

ParseProductLicenseKey parses and verifies the license key using the license verification public key (publicKey in this package). 

#### <a id="ParseProductLicenseKeyWithBuiltinOrGenerationKey" href="#ParseProductLicenseKeyWithBuiltinOrGenerationKey">func ParseProductLicenseKeyWithBuiltinOrGenerationKey(licenseKey string) (*Info, string, error)</a>

```
searchKey: licensing.ParseProductLicenseKeyWithBuiltinOrGenerationKey
tags: [exported]
```

```Go
func ParseProductLicenseKeyWithBuiltinOrGenerationKey(licenseKey string) (*Info, string, error)
```

ParseProductLicenseKeyWithBuiltinOrGenerationKey is like ParseProductLicenseKey, except it tries parsing and verifying the license key with the license generation key (if set), instead of always using the builtin license key. 

It is useful for local development when using a test license generation key (whose signatures aren't considered valid when verified using the builtin public key). 

#### <a id="GetConfiguredProductLicenseInfo" href="#GetConfiguredProductLicenseInfo">func GetConfiguredProductLicenseInfo() (*Info, error)</a>

```
searchKey: licensing.GetConfiguredProductLicenseInfo
tags: [exported]
```

```Go
func GetConfiguredProductLicenseInfo() (*Info, error)
```

GetConfiguredProductLicenseInfo returns information about the current product license key specified in site configuration. 

#### <a id="GetConfiguredProductLicenseInfoWithSignature" href="#GetConfiguredProductLicenseInfoWithSignature">func GetConfiguredProductLicenseInfoWithSignature() (*Info, string, error)</a>

```
searchKey: licensing.GetConfiguredProductLicenseInfoWithSignature
tags: [exported]
```

```Go
func GetConfiguredProductLicenseInfoWithSignature() (*Info, string, error)
```

GetConfiguredProductLicenseInfoWithSignature returns information about the current product license key specified in site configuration, with the signed key's signature. 

#### <a id="Info.Plan" href="#Info.Plan">func (info *Info) Plan() Plan</a>

```
searchKey: licensing.Info.Plan
tags: [exported]
```

```Go
func (info *Info) Plan() Plan
```

Plan is the pricing plan of the license. 

#### <a id="Info.hasUnknownPlan" href="#Info.hasUnknownPlan">func (info *Info) hasUnknownPlan() error</a>

```
searchKey: licensing.Info.hasUnknownPlan
```

```Go
func (info *Info) hasUnknownPlan() error
```

hasUnknownPlan returns an error if the plan is presented in the license tags but unrecognizable. It returns nil if there is no tags found for plans. 

### <a id="Plan" href="#Plan">type Plan string</a>

```
searchKey: licensing.Plan
tags: [exported]
```

```Go
type Plan string
```

A Plan is a pricing plan, with an associated set of features that it offers. 

#### <a id="Plan.HasFeature" href="#Plan.HasFeature">func (p Plan) HasFeature(feature Feature) bool</a>

```
searchKey: licensing.Plan.HasFeature
tags: [exported]
```

```Go
func (p Plan) HasFeature(feature Feature) bool
```

HasFeature reports whether the plan has the given feature. 

#### <a id="Plan.tag" href="#Plan.tag">func (p Plan) tag() string</a>

```
searchKey: licensing.Plan.tag
```

```Go
func (p Plan) tag() string
```

tag is the representation of the plan as a tag in a license key. 

#### <a id="Plan.isKnown" href="#Plan.isKnown">func (p Plan) isKnown() bool</a>

```
searchKey: licensing.Plan.isKnown
```

```Go
func (p Plan) isKnown() bool
```

isKnown reports whether the plan is a known plan. 

#### <a id="Plan.MaxExternalServiceCount" href="#Plan.MaxExternalServiceCount">func (p Plan) MaxExternalServiceCount() int</a>

```
searchKey: licensing.Plan.MaxExternalServiceCount
tags: [exported]
```

```Go
func (p Plan) MaxExternalServiceCount() int
```

MaxExternalServiceCount returns the number of external services that the plan supports. We treat 0 as "unlimited". 

### <a id="UsersStore" href="#UsersStore">type UsersStore interface</a>

```
searchKey: licensing.UsersStore
tags: [exported]
```

```Go
type UsersStore interface {
	// Count returns the total count of active Sourcegraph users.
	Count(context.Context) (int, error)
}
```

A UsersStore captures the necessary methods for the licensing package to query Sourcegraph users. It allows decoupling this package from the OSS database package. 

## <a id="func" href="#func">Functions</a>

### <a id="init" href="#init">func init()</a>

```
searchKey: licensing.init
```

```Go
func init()
```

### <a id="Check" href="#Check">func Check(feature Feature) error</a>

```
searchKey: licensing.Check
tags: [exported]
```

```Go
func Check(feature Feature) error
```

Check checks whether the feature is activated based on the current license. If it is disabled, it returns a non-nil error. 

The returned error may implement errcode.PresentationError to indicate that it can be displayed directly to the user. Use IsFeatureNotActivated to distinguish between the error reasons. 

### <a id="checkFeature" href="#checkFeature">func checkFeature(info *Info, feature Feature) error</a>

```
searchKey: licensing.checkFeature
```

```Go
func checkFeature(info *Info, feature Feature) error
```

### <a id="TestingSkipFeatureChecks" href="#TestingSkipFeatureChecks">func TestingSkipFeatureChecks() func()</a>

```
searchKey: licensing.TestingSkipFeatureChecks
tags: [exported]
```

```Go
func TestingSkipFeatureChecks() func()
```

TestingSkipFeatureChecks is for tests that want to mock Check to always return nil (i.e., behave as though the current license enables all features). 

It returns a cleanup func so callers can use `defer TestingSkipFeatureChecks()()` in a test body. 

### <a id="IsFeatureNotActivated" href="#IsFeatureNotActivated">func IsFeatureNotActivated(err error) bool</a>

```
searchKey: licensing.IsFeatureNotActivated
tags: [exported]
```

```Go
func IsFeatureNotActivated(err error) bool
```

IsFeatureNotActivated reports whether err indicates that the license is valid but does not activate the feature. 

It is used to distinguish between the multiple reasons for errors from Check: either failed license verification, or a valid license that does not activate a feature (e.g., Enterprise Starter not including an Enterprise-only feature). 

### <a id="IsFeatureEnabledLenient" href="#IsFeatureEnabledLenient">func IsFeatureEnabledLenient(feature Feature) bool</a>

```
searchKey: licensing.IsFeatureEnabledLenient
tags: [exported]
```

```Go
func IsFeatureEnabledLenient(feature Feature) bool
```

IsFeatureEnabledLenient reports whether the current license enables the given feature. If there is an error reading the license, it is lenient and returns true. 

This is useful for callers who don't want to handle errors (usually because the user would be prevented from getting to this point if license verification had failed, so it's not necessary to handle license verification errors here). 

### <a id="GenerateProductLicenseKey" href="#GenerateProductLicenseKey">func GenerateProductLicenseKey(info license.Info) (string, error)</a>

```
searchKey: licensing.GenerateProductLicenseKey
tags: [exported]
```

```Go
func GenerateProductLicenseKey(info license.Info) (string, error)
```

GenerateProductLicenseKey generates a product license key using the license generation private key configured in site configuration. 

### <a id="ProductNameWithBrand" href="#ProductNameWithBrand">func ProductNameWithBrand(hasLicense bool, licenseTags []string) string</a>

```
searchKey: licensing.ProductNameWithBrand
tags: [exported]
```

```Go
func ProductNameWithBrand(hasLicense bool, licenseTags []string) string
```

ProductNameWithBrand returns the product name with brand (e.g., "Sourcegraph Enterprise") based on the license info. 

### <a id="setMaxUsers" href="#setMaxUsers">func setMaxUsers(key string, count int) error</a>

```
searchKey: licensing.setMaxUsers
```

```Go
func setMaxUsers(key string, count int) error
```

setMaxUsers sets the max users associated with a license key if the new max count is greater than the previous max. 

### <a id="GetMaxUsers" href="#GetMaxUsers">func GetMaxUsers(signature string) (int, string, error)</a>

```
searchKey: licensing.GetMaxUsers
tags: [exported]
```

```Go
func GetMaxUsers(signature string) (int, string, error)
```

GetMaxUsers gets the max users associated with a license key. 

### <a id="getMaxUsers" href="#getMaxUsers">func getMaxUsers(c redis.Conn, key string) (int, string, error)</a>

```
searchKey: licensing.getMaxUsers
```

```Go
func getMaxUsers(c redis.Conn, key string) (int, string, error)
```

### <a id="checkMaxUsers" href="#checkMaxUsers">func checkMaxUsers(ctx context.Context, s UsersStore, signature string) error</a>

```
searchKey: licensing.checkMaxUsers
```

```Go
func checkMaxUsers(ctx context.Context, s UsersStore, signature string) error
```

checkMaxUsers runs periodically, and if a license key is in use, updates the record of maximum count of user accounts in use. 

### <a id="maxUsersKey" href="#maxUsersKey">func maxUsersKey() string</a>

```
searchKey: licensing.maxUsersKey
```

```Go
func maxUsersKey() string
```

### <a id="maxUsersTimeKey" href="#maxUsersTimeKey">func maxUsersTimeKey() string</a>

```
searchKey: licensing.maxUsersTimeKey
```

```Go
func maxUsersTimeKey() string
```

### <a id="ActualUserCount" href="#ActualUserCount">func ActualUserCount(ctx context.Context) (int32, error)</a>

```
searchKey: licensing.ActualUserCount
tags: [exported]
```

```Go
func ActualUserCount(ctx context.Context) (int32, error)
```

ActualUserCount returns the actual max number of users that have had accounts on the Sourcegraph instance, under the current license. 

### <a id="ActualUserCountDate" href="#ActualUserCountDate">func ActualUserCountDate(ctx context.Context) (string, error)</a>

```
searchKey: licensing.ActualUserCountDate
tags: [exported]
```

```Go
func ActualUserCountDate(ctx context.Context) (string, error)
```

ActualUserCountDate returns the timestamp when the actual max number of users that have had accounts on the Sourcegraph instance, under the current license, was reached. 

### <a id="StartMaxUserCount" href="#StartMaxUserCount">func StartMaxUserCount(s UsersStore)</a>

```
searchKey: licensing.StartMaxUserCount
tags: [exported]
```

```Go
func StartMaxUserCount(s UsersStore)
```

StartMaxUserCount starts checking for a new count of max user accounts periodically. 

### <a id="TestCheckFeature" href="#TestCheckFeature">func TestCheckFeature(t *testing.T)</a>

```
searchKey: licensing.TestCheckFeature
```

```Go
func TestCheckFeature(t *testing.T)
```

### <a id="init" href="#init">func init()</a>

```
searchKey: licensing.init
```

```Go
func init()
```

### <a id="TestPlan_isKnown" href="#TestPlan_isKnown">func TestPlan_isKnown(t *testing.T)</a>

```
searchKey: licensing.TestPlan_isKnown
```

```Go
func TestPlan_isKnown(t *testing.T)
```

### <a id="TestInfo_Plan" href="#TestInfo_Plan">func TestInfo_Plan(t *testing.T)</a>

```
searchKey: licensing.TestInfo_Plan
```

```Go
func TestInfo_Plan(t *testing.T)
```

### <a id="TestInfo_hasUnknownPlan" href="#TestInfo_hasUnknownPlan">func TestInfo_hasUnknownPlan(t *testing.T)</a>

```
searchKey: licensing.TestInfo_hasUnknownPlan
```

```Go
func TestInfo_hasUnknownPlan(t *testing.T)
```

### <a id="TestProductNameWithBrand" href="#TestProductNameWithBrand">func TestProductNameWithBrand(t *testing.T)</a>

```
searchKey: licensing.TestProductNameWithBrand
```

```Go
func TestProductNameWithBrand(t *testing.T)
```

