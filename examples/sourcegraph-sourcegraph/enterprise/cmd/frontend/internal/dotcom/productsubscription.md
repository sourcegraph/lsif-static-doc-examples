# Package productsubscription

Package productsubscription handles product subscriptions and licensing. 

## Index

* [Constants](#const)
    * [const ProductLicenseIDKind](#ProductLicenseIDKind)
    * [const ProductSubscriptionIDKind](#ProductSubscriptionIDKind)
    * [const lastLicenseExpirationCheckKey](#lastLicenseExpirationCheckKey)
* [Variables](#var)
    * [var emailQueries](#emailQueries)
    * [var errLicenseNotFound](#errLicenseNotFound)
    * [var errSubscriptionNotFound](#errSubscriptionNotFound)
    * [var licenseExpirationCheckers](#licenseExpirationCheckers)
    * [var mocks](#mocks)
* [Types](#type)
    * [type ProductSubscriptionLicensingResolver struct](#ProductSubscriptionLicensingResolver)
        * [func (r ProductSubscriptionLicensingResolver) ArchiveProductSubscription(ctx context.Context, args *graphqlbackend.ArchiveProductSubscriptionArgs) (*graphqlbackend.EmptyResponse, error)](#ProductSubscriptionLicensingResolver.ArchiveProductSubscription)
        * [func (r ProductSubscriptionLicensingResolver) CreatePaidProductSubscription(ctx context.Context, args *graphqlbackend.CreatePaidProductSubscriptionArgs) (*graphqlbackend.CreatePaidProductSubscriptionResult, error)](#ProductSubscriptionLicensingResolver.CreatePaidProductSubscription)
        * [func (r ProductSubscriptionLicensingResolver) CreateProductSubscription(ctx context.Context, args *graphqlbackend.CreateProductSubscriptionArgs) (graphqlbackend.ProductSubscription, error)](#ProductSubscriptionLicensingResolver.CreateProductSubscription)
        * [func (r ProductSubscriptionLicensingResolver) GenerateProductLicenseForSubscription(ctx context.Context, args *graphqlbackend.GenerateProductLicenseForSubscriptionArgs) (graphqlbackend.ProductLicense, error)](#ProductSubscriptionLicensingResolver.GenerateProductLicenseForSubscription)
        * [func (r ProductSubscriptionLicensingResolver) PreviewProductSubscriptionInvoice(ctx context.Context, args *graphqlbackend.PreviewProductSubscriptionInvoiceArgs) (graphqlbackend.ProductSubscriptionPreviewInvoice, error)](#ProductSubscriptionLicensingResolver.PreviewProductSubscriptionInvoice)
        * [func (p ProductSubscriptionLicensingResolver) ProductLicenseByID(ctx context.Context, id graphql.ID) (graphqlbackend.ProductLicense, error)](#ProductSubscriptionLicensingResolver.ProductLicenseByID)
        * [func (r ProductSubscriptionLicensingResolver) ProductLicenses(ctx context.Context, args *graphqlbackend.ProductLicensesArgs) (graphqlbackend.ProductLicenseConnection, error)](#ProductSubscriptionLicensingResolver.ProductLicenses)
        * [func (r ProductSubscriptionLicensingResolver) ProductSubscription(ctx context.Context, args *graphqlbackend.ProductSubscriptionArgs) (graphqlbackend.ProductSubscription, error)](#ProductSubscriptionLicensingResolver.ProductSubscription)
        * [func (p ProductSubscriptionLicensingResolver) ProductSubscriptionByID(ctx context.Context, id graphql.ID) (graphqlbackend.ProductSubscription, error)](#ProductSubscriptionLicensingResolver.ProductSubscriptionByID)
        * [func (r ProductSubscriptionLicensingResolver) ProductSubscriptions(ctx context.Context, args *graphqlbackend.ProductSubscriptionsArgs) (graphqlbackend.ProductSubscriptionConnection, error)](#ProductSubscriptionLicensingResolver.ProductSubscriptions)
        * [func (r ProductSubscriptionLicensingResolver) SetProductSubscriptionBilling(ctx context.Context, args *graphqlbackend.SetProductSubscriptionBillingArgs) (*graphqlbackend.EmptyResponse, error)](#ProductSubscriptionLicensingResolver.SetProductSubscriptionBilling)
        * [func (r ProductSubscriptionLicensingResolver) UpdatePaidProductSubscription(ctx context.Context, args *graphqlbackend.UpdatePaidProductSubscriptionArgs) (*graphqlbackend.UpdatePaidProductSubscriptionResult, error)](#ProductSubscriptionLicensingResolver.UpdatePaidProductSubscription)
    * [type dbLicense struct](#dbLicense)
    * [type dbLicenses struct](#dbLicenses)
        * [func (s dbLicenses) Count(ctx context.Context, opt dbLicensesListOptions) (int, error)](#dbLicenses.Count)
        * [func (s dbLicenses) Create(ctx context.Context, subscriptionID, licenseKey string) (id string, err error)](#dbLicenses.Create)
        * [func (s dbLicenses) GetByID(ctx context.Context, id string) (*dbLicense, error)](#dbLicenses.GetByID)
        * [func (s dbLicenses) GetByLicenseKey(ctx context.Context, licenseKey string) (*dbLicense, error)](#dbLicenses.GetByLicenseKey)
        * [func (s dbLicenses) List(ctx context.Context, opt dbLicensesListOptions) ([]*dbLicense, error)](#dbLicenses.List)
        * [func (s dbLicenses) list(ctx context.Context, conds []*sqlf.Query, limitOffset *database.LimitOffset) ([]*dbLicense, error)](#dbLicenses.list)
    * [type dbLicensesListOptions struct](#dbLicensesListOptions)
        * [func (o dbLicensesListOptions) sqlConditions() []*sqlf.Query](#dbLicensesListOptions.sqlConditions)
    * [type dbMocks struct](#dbMocks)
    * [type dbSubscription struct](#dbSubscription)
    * [type dbSubscriptionUpdate struct](#dbSubscriptionUpdate)
    * [type dbSubscriptions struct](#dbSubscriptions)
        * [func (s dbSubscriptions) Archive(ctx context.Context, id string) error](#dbSubscriptions.Archive)
        * [func (s dbSubscriptions) Count(ctx context.Context, opt dbSubscriptionsListOptions) (int, error)](#dbSubscriptions.Count)
        * [func (s dbSubscriptions) Create(ctx context.Context, userID int32) (id string, err error)](#dbSubscriptions.Create)
        * [func (s dbSubscriptions) GetByID(ctx context.Context, id string) (*dbSubscription, error)](#dbSubscriptions.GetByID)
        * [func (s dbSubscriptions) List(ctx context.Context, opt dbSubscriptionsListOptions) ([]*dbSubscription, error)](#dbSubscriptions.List)
        * [func (s dbSubscriptions) Update(ctx context.Context, id string, update dbSubscriptionUpdate) error](#dbSubscriptions.Update)
        * [func (s dbSubscriptions) list(ctx context.Context, conds []*sqlf.Query, limitOffset *database.LimitOffset) ([]*dbSubscription, error)](#dbSubscriptions.list)
    * [type dbSubscriptionsListOptions struct](#dbSubscriptionsListOptions)
        * [func (o dbSubscriptionsListOptions) sqlConditions() []*sqlf.Query](#dbSubscriptionsListOptions.sqlConditions)
    * [type fakeSlackClient struct](#fakeSlackClient)
        * [func (c *fakeSlackClient) Post(ctx context.Context, payload *slack.Payload) error](#fakeSlackClient.Post)
    * [type mockLicenses struct](#mockLicenses)
    * [type mockSubscriptions struct](#mockSubscriptions)
    * [type productLicense struct](#productLicense)
        * [func productLicenseByDBID(ctx context.Context, db dbutil.DB, id string) (*productLicense, error)](#productLicenseByDBID)
        * [func productLicenseByID(ctx context.Context, db dbutil.DB, id graphql.ID) (*productLicense, error)](#productLicenseByID)
        * [func (r *productLicense) CreatedAt() graphqlbackend.DateTime](#productLicense.CreatedAt)
        * [func (r *productLicense) ID() graphql.ID](#productLicense.ID)
        * [func (r *productLicense) Info() (*graphqlbackend.ProductLicenseInfo, error)](#productLicense.Info)
        * [func (r *productLicense) LicenseKey() string](#productLicense.LicenseKey)
        * [func (r *productLicense) Subscription(ctx context.Context) (graphqlbackend.ProductSubscription, error)](#productLicense.Subscription)
    * [type productLicenseConnection struct](#productLicenseConnection)
        * [func (r *productLicenseConnection) Nodes(ctx context.Context) ([]graphqlbackend.ProductLicense, error)](#productLicenseConnection.Nodes)
        * [func (r *productLicenseConnection) PageInfo(ctx context.Context) (*graphqlutil.PageInfo, error)](#productLicenseConnection.PageInfo)
        * [func (r *productLicenseConnection) TotalCount(ctx context.Context) (int32, error)](#productLicenseConnection.TotalCount)
        * [func (r *productLicenseConnection) compute(ctx context.Context) ([]*dbLicense, error)](#productLicenseConnection.compute)
    * [type productSubscription struct](#productSubscription)
        * [func productSubscriptionByDBID(ctx context.Context, db dbutil.DB, id string) (*productSubscription, error)](#productSubscriptionByDBID)
        * [func productSubscriptionByID(ctx context.Context, db dbutil.DB, id graphql.ID) (*productSubscription, error)](#productSubscriptionByID)
        * [func (r *productSubscription) Account(ctx context.Context) (*graphqlbackend.UserResolver, error)](#productSubscription.Account)
        * [func (r *productSubscription) ActiveLicense(ctx context.Context) (graphqlbackend.ProductLicense, error)](#productSubscription.ActiveLicense)
        * [func (r *productSubscription) CreatedAt() graphqlbackend.DateTime](#productSubscription.CreatedAt)
        * [func (r *productSubscription) Events(ctx context.Context) ([]graphqlbackend.ProductSubscriptionEvent, error)](#productSubscription.Events)
        * [func (r *productSubscription) ID() graphql.ID](#productSubscription.ID)
        * [func (r *productSubscription) InvoiceItem(ctx context.Context) (graphqlbackend.ProductSubscriptionInvoiceItem, error)](#productSubscription.InvoiceItem)
        * [func (r *productSubscription) IsArchived() bool](#productSubscription.IsArchived)
        * [func (r *productSubscription) Name() string](#productSubscription.Name)
        * [func (r *productSubscription) ProductLicenses(ctx context.Context, args *graphqlutil.ConnectionArgs) (graphqlbackend.ProductLicenseConnection, error)](#productSubscription.ProductLicenses)
        * [func (r *productSubscription) URL(ctx context.Context) (string, error)](#productSubscription.URL)
        * [func (r *productSubscription) URLForSiteAdmin(ctx context.Context) *string](#productSubscription.URLForSiteAdmin)
        * [func (r *productSubscription) URLForSiteAdminBilling(ctx context.Context) (*string, error)](#productSubscription.URLForSiteAdminBilling)
        * [func (r *productSubscription) UUID() string](#productSubscription.UUID)
    * [type productSubscriptionConnection struct](#productSubscriptionConnection)
        * [func (r *productSubscriptionConnection) Nodes(ctx context.Context) ([]graphqlbackend.ProductSubscription, error)](#productSubscriptionConnection.Nodes)
        * [func (r *productSubscriptionConnection) PageInfo(ctx context.Context) (*graphqlutil.PageInfo, error)](#productSubscriptionConnection.PageInfo)
        * [func (r *productSubscriptionConnection) TotalCount(ctx context.Context) (int32, error)](#productSubscriptionConnection.TotalCount)
        * [func (r *productSubscriptionConnection) compute(ctx context.Context) ([]*dbSubscription, error)](#productSubscriptionConnection.compute)
    * [type productSubscriptionInvoiceItem struct](#productSubscriptionInvoiceItem)
        * [func (r *productSubscriptionInvoiceItem) ExpiresAt() graphqlbackend.DateTime](#productSubscriptionInvoiceItem.ExpiresAt)
        * [func (r *productSubscriptionInvoiceItem) Plan() (graphqlbackend.ProductPlan, error)](#productSubscriptionInvoiceItem.Plan)
        * [func (r *productSubscriptionInvoiceItem) UserCount() int32](#productSubscriptionInvoiceItem.UserCount)
    * [type productSubscriptionPreviewInvoice struct](#productSubscriptionPreviewInvoice)
        * [func (r *productSubscriptionPreviewInvoice) AfterInvoiceItem() graphqlbackend.ProductSubscriptionInvoiceItem](#productSubscriptionPreviewInvoice.AfterInvoiceItem)
        * [func (r *productSubscriptionPreviewInvoice) AmountDue() int32](#productSubscriptionPreviewInvoice.AmountDue)
        * [func (r *productSubscriptionPreviewInvoice) BeforeInvoiceItem() graphqlbackend.ProductSubscriptionInvoiceItem](#productSubscriptionPreviewInvoice.BeforeInvoiceItem)
        * [func (r *productSubscriptionPreviewInvoice) IsDowngradeRequiringManualIntervention() bool](#productSubscriptionPreviewInvoice.IsDowngradeRequiringManualIntervention)
        * [func (r *productSubscriptionPreviewInvoice) Price() int32](#productSubscriptionPreviewInvoice.Price)
        * [func (r *productSubscriptionPreviewInvoice) ProrationDate() *string](#productSubscriptionPreviewInvoice.ProrationDate)
    * [type slackClient interface](#slackClient)
* [Functions](#func)
    * [func StartCheckForUpcomingLicenseExpirations(db dbutil.DB)](#StartCheckForUpcomingLicenseExpirations)
    * [func TestCheckForUpcomingLicenseExpirations(t *testing.T)](#TestCheckForUpcomingLicenseExpirations)
    * [func TestProductLicenses_Create(t *testing.T)](#TestProductLicenses_Create)
    * [func TestProductLicenses_List(t *testing.T)](#TestProductLicenses_List)
    * [func TestProductSubscriptions_Create(t *testing.T)](#TestProductSubscriptions_Create)
    * [func TestProductSubscriptions_List(t *testing.T)](#TestProductSubscriptions_List)
    * [func TestProductSubscriptions_Update(t *testing.T)](#TestProductSubscriptions_Update)
    * [func checkForUpcomingLicenseExpirations(db dbutil.DB, clock glock.Clock, client slackClient)](#checkForUpcomingLicenseExpirations)
    * [func checkLastSubscriptionLicense(ctx context.Context, db dbutil.DB, s *dbSubscription, clock glock.Clock, client slackClient)](#checkLastSubscriptionLicense)
    * [func checkLicensesIfNeeded(db dbutil.DB, client slackClient)](#checkLicensesIfNeeded)
    * [func generateProductLicenseForSubscription(ctx context.Context, db dbutil.DB, subscriptionID string, input *graphqlbackend.ProductLicenseInput) (id string, err error)](#generateProductLicenseForSubscription)
    * [func init()](#init.db_test.go)
    * [func isDowngradeRequiringManualIntervention(beforeUserCount int32, beforePlanPrice int64, afterUserCount int32, afterPlanPrice int64) bool](#isDowngradeRequiringManualIntervention)
    * [func marshalProductLicenseID(id string) graphql.ID](#marshalProductLicenseID)
    * [func marshalProductSubscriptionID(id string) graphql.ID](#marshalProductSubscriptionID)
    * [func unmarshalProductLicenseID(id graphql.ID) (productLicenseID string, err error)](#unmarshalProductLicenseID)
    * [func unmarshalProductSubscriptionID(id graphql.ID) (productSubscriptionID string, err error)](#unmarshalProductSubscriptionID)
    * [func userCountExceedsPlanMaxError(userCount, max int32) error](#userCountExceedsPlanMaxError)


## <a id="const" href="#const">Constants</a>

```
tags: [package private]
```

### <a id="ProductLicenseIDKind" href="#ProductLicenseIDKind">const ProductLicenseIDKind</a>

```
searchKey: productsubscription.ProductLicenseIDKind
tags: [constant string]
```

```Go
const ProductLicenseIDKind = "ProductLicense"
```

### <a id="ProductSubscriptionIDKind" href="#ProductSubscriptionIDKind">const ProductSubscriptionIDKind</a>

```
searchKey: productsubscription.ProductSubscriptionIDKind
tags: [constant string]
```

```Go
const ProductSubscriptionIDKind = "ProductSubscription"
```

### <a id="lastLicenseExpirationCheckKey" href="#lastLicenseExpirationCheckKey">const lastLicenseExpirationCheckKey</a>

```
searchKey: productsubscription.lastLicenseExpirationCheckKey
tags: [constant string private]
```

```Go
const lastLicenseExpirationCheckKey = "last_license_expiration_check"
```

## <a id="var" href="#var">Variables</a>

```
tags: [package private]
```

### <a id="emailQueries" href="#emailQueries">var emailQueries</a>

```
searchKey: productsubscription.emailQueries
tags: [variable struct private]
```

```Go
var emailQueries = ...
```

### <a id="errLicenseNotFound" href="#errLicenseNotFound">var errLicenseNotFound</a>

```
searchKey: productsubscription.errLicenseNotFound
tags: [variable interface private]
```

```Go
var errLicenseNotFound = errors.New("product license not found")
```

errLicenseNotFound occurs when a database operation expects a specific Sourcegraph license to exist but it does not exist. 

### <a id="errSubscriptionNotFound" href="#errSubscriptionNotFound">var errSubscriptionNotFound</a>

```
searchKey: productsubscription.errSubscriptionNotFound
tags: [variable interface private]
```

```Go
var errSubscriptionNotFound = errors.New("product subscription not found")
```

errSubscriptionNotFound occurs when a database operation expects a specific Sourcegraph license to exist but it does not exist. 

### <a id="licenseExpirationCheckers" href="#licenseExpirationCheckers">var licenseExpirationCheckers</a>

```
searchKey: productsubscription.licenseExpirationCheckers
tags: [variable number private]
```

```Go
var licenseExpirationCheckers uint32
```

### <a id="mocks" href="#mocks">var mocks</a>

```
searchKey: productsubscription.mocks
tags: [variable struct private]
```

```Go
var mocks dbMocks
```

## <a id="type" href="#type">Types</a>

```
tags: [package private]
```

### <a id="ProductSubscriptionLicensingResolver" href="#ProductSubscriptionLicensingResolver">type ProductSubscriptionLicensingResolver struct</a>

```
searchKey: productsubscription.ProductSubscriptionLicensingResolver
tags: [struct]
```

```Go
type ProductSubscriptionLicensingResolver struct {
	DB dbutil.DB
}
```

ProductSubscriptionLicensingResolver implements the GraphQL Query and Mutation fields related to product subscriptions and licensing. 

#### <a id="ProductSubscriptionLicensingResolver.ArchiveProductSubscription" href="#ProductSubscriptionLicensingResolver.ArchiveProductSubscription">func (r ProductSubscriptionLicensingResolver) ArchiveProductSubscription(ctx context.Context, args *graphqlbackend.ArchiveProductSubscriptionArgs) (*graphqlbackend.EmptyResponse, error)</a>

```
searchKey: productsubscription.ProductSubscriptionLicensingResolver.ArchiveProductSubscription
tags: [method]
```

```Go
func (r ProductSubscriptionLicensingResolver) ArchiveProductSubscription(ctx context.Context, args *graphqlbackend.ArchiveProductSubscriptionArgs) (*graphqlbackend.EmptyResponse, error)
```

#### <a id="ProductSubscriptionLicensingResolver.CreatePaidProductSubscription" href="#ProductSubscriptionLicensingResolver.CreatePaidProductSubscription">func (r ProductSubscriptionLicensingResolver) CreatePaidProductSubscription(ctx context.Context, args *graphqlbackend.CreatePaidProductSubscriptionArgs) (*graphqlbackend.CreatePaidProductSubscriptionResult, error)</a>

```
searchKey: productsubscription.ProductSubscriptionLicensingResolver.CreatePaidProductSubscription
tags: [method]
```

```Go
func (r ProductSubscriptionLicensingResolver) CreatePaidProductSubscription(ctx context.Context, args *graphqlbackend.CreatePaidProductSubscriptionArgs) (*graphqlbackend.CreatePaidProductSubscriptionResult, error)
```

#### <a id="ProductSubscriptionLicensingResolver.CreateProductSubscription" href="#ProductSubscriptionLicensingResolver.CreateProductSubscription">func (r ProductSubscriptionLicensingResolver) CreateProductSubscription(ctx context.Context, args *graphqlbackend.CreateProductSubscriptionArgs) (graphqlbackend.ProductSubscription, error)</a>

```
searchKey: productsubscription.ProductSubscriptionLicensingResolver.CreateProductSubscription
tags: [method]
```

```Go
func (r ProductSubscriptionLicensingResolver) CreateProductSubscription(ctx context.Context, args *graphqlbackend.CreateProductSubscriptionArgs) (graphqlbackend.ProductSubscription, error)
```

#### <a id="ProductSubscriptionLicensingResolver.GenerateProductLicenseForSubscription" href="#ProductSubscriptionLicensingResolver.GenerateProductLicenseForSubscription">func (r ProductSubscriptionLicensingResolver) GenerateProductLicenseForSubscription(ctx context.Context, args *graphqlbackend.GenerateProductLicenseForSubscriptionArgs) (graphqlbackend.ProductLicense, error)</a>

```
searchKey: productsubscription.ProductSubscriptionLicensingResolver.GenerateProductLicenseForSubscription
tags: [method]
```

```Go
func (r ProductSubscriptionLicensingResolver) GenerateProductLicenseForSubscription(ctx context.Context, args *graphqlbackend.GenerateProductLicenseForSubscriptionArgs) (graphqlbackend.ProductLicense, error)
```

#### <a id="ProductSubscriptionLicensingResolver.PreviewProductSubscriptionInvoice" href="#ProductSubscriptionLicensingResolver.PreviewProductSubscriptionInvoice">func (r ProductSubscriptionLicensingResolver) PreviewProductSubscriptionInvoice(ctx context.Context, args *graphqlbackend.PreviewProductSubscriptionInvoiceArgs) (graphqlbackend.ProductSubscriptionPreviewInvoice, error)</a>

```
searchKey: productsubscription.ProductSubscriptionLicensingResolver.PreviewProductSubscriptionInvoice
tags: [method]
```

```Go
func (r ProductSubscriptionLicensingResolver) PreviewProductSubscriptionInvoice(ctx context.Context, args *graphqlbackend.PreviewProductSubscriptionInvoiceArgs) (graphqlbackend.ProductSubscriptionPreviewInvoice, error)
```

#### <a id="ProductSubscriptionLicensingResolver.ProductLicenseByID" href="#ProductSubscriptionLicensingResolver.ProductLicenseByID">func (p ProductSubscriptionLicensingResolver) ProductLicenseByID(ctx context.Context, id graphql.ID) (graphqlbackend.ProductLicense, error)</a>

```
searchKey: productsubscription.ProductSubscriptionLicensingResolver.ProductLicenseByID
tags: [method]
```

```Go
func (p ProductSubscriptionLicensingResolver) ProductLicenseByID(ctx context.Context, id graphql.ID) (graphqlbackend.ProductLicense, error)
```

ProductLicenseByID looks up and returns the ProductLicense with the given GraphQL ID. If no such ProductLicense exists, it returns a non-nil error. 

#### <a id="ProductSubscriptionLicensingResolver.ProductLicenses" href="#ProductSubscriptionLicensingResolver.ProductLicenses">func (r ProductSubscriptionLicensingResolver) ProductLicenses(ctx context.Context, args *graphqlbackend.ProductLicensesArgs) (graphqlbackend.ProductLicenseConnection, error)</a>

```
searchKey: productsubscription.ProductSubscriptionLicensingResolver.ProductLicenses
tags: [method]
```

```Go
func (r ProductSubscriptionLicensingResolver) ProductLicenses(ctx context.Context, args *graphqlbackend.ProductLicensesArgs) (graphqlbackend.ProductLicenseConnection, error)
```

#### <a id="ProductSubscriptionLicensingResolver.ProductSubscription" href="#ProductSubscriptionLicensingResolver.ProductSubscription">func (r ProductSubscriptionLicensingResolver) ProductSubscription(ctx context.Context, args *graphqlbackend.ProductSubscriptionArgs) (graphqlbackend.ProductSubscription, error)</a>

```
searchKey: productsubscription.ProductSubscriptionLicensingResolver.ProductSubscription
tags: [method]
```

```Go
func (r ProductSubscriptionLicensingResolver) ProductSubscription(ctx context.Context, args *graphqlbackend.ProductSubscriptionArgs) (graphqlbackend.ProductSubscription, error)
```

#### <a id="ProductSubscriptionLicensingResolver.ProductSubscriptionByID" href="#ProductSubscriptionLicensingResolver.ProductSubscriptionByID">func (p ProductSubscriptionLicensingResolver) ProductSubscriptionByID(ctx context.Context, id graphql.ID) (graphqlbackend.ProductSubscription, error)</a>

```
searchKey: productsubscription.ProductSubscriptionLicensingResolver.ProductSubscriptionByID
tags: [method]
```

```Go
func (p ProductSubscriptionLicensingResolver) ProductSubscriptionByID(ctx context.Context, id graphql.ID) (graphqlbackend.ProductSubscription, error)
```

ProductSubscriptionByID looks up and returns the ProductSubscription with the given GraphQL ID. If no such ProductSubscription exists, it returns a non-nil error. 

#### <a id="ProductSubscriptionLicensingResolver.ProductSubscriptions" href="#ProductSubscriptionLicensingResolver.ProductSubscriptions">func (r ProductSubscriptionLicensingResolver) ProductSubscriptions(ctx context.Context, args *graphqlbackend.ProductSubscriptionsArgs) (graphqlbackend.ProductSubscriptionConnection, error)</a>

```
searchKey: productsubscription.ProductSubscriptionLicensingResolver.ProductSubscriptions
tags: [method]
```

```Go
func (r ProductSubscriptionLicensingResolver) ProductSubscriptions(ctx context.Context, args *graphqlbackend.ProductSubscriptionsArgs) (graphqlbackend.ProductSubscriptionConnection, error)
```

#### <a id="ProductSubscriptionLicensingResolver.SetProductSubscriptionBilling" href="#ProductSubscriptionLicensingResolver.SetProductSubscriptionBilling">func (r ProductSubscriptionLicensingResolver) SetProductSubscriptionBilling(ctx context.Context, args *graphqlbackend.SetProductSubscriptionBillingArgs) (*graphqlbackend.EmptyResponse, error)</a>

```
searchKey: productsubscription.ProductSubscriptionLicensingResolver.SetProductSubscriptionBilling
tags: [method]
```

```Go
func (r ProductSubscriptionLicensingResolver) SetProductSubscriptionBilling(ctx context.Context, args *graphqlbackend.SetProductSubscriptionBillingArgs) (*graphqlbackend.EmptyResponse, error)
```

#### <a id="ProductSubscriptionLicensingResolver.UpdatePaidProductSubscription" href="#ProductSubscriptionLicensingResolver.UpdatePaidProductSubscription">func (r ProductSubscriptionLicensingResolver) UpdatePaidProductSubscription(ctx context.Context, args *graphqlbackend.UpdatePaidProductSubscriptionArgs) (*graphqlbackend.UpdatePaidProductSubscriptionResult, error)</a>

```
searchKey: productsubscription.ProductSubscriptionLicensingResolver.UpdatePaidProductSubscription
tags: [method]
```

```Go
func (r ProductSubscriptionLicensingResolver) UpdatePaidProductSubscription(ctx context.Context, args *graphqlbackend.UpdatePaidProductSubscriptionArgs) (*graphqlbackend.UpdatePaidProductSubscriptionResult, error)
```

### <a id="dbLicense" href="#dbLicense">type dbLicense struct</a>

```
searchKey: productsubscription.dbLicense
tags: [struct private]
```

```Go
type dbLicense struct {
	ID                    string // UUID
	ProductSubscriptionID string // UUID
	LicenseKey            string
	CreatedAt             time.Time
}
```

dbLicense describes an product license row in the product_licenses DB table. 

### <a id="dbLicenses" href="#dbLicenses">type dbLicenses struct</a>

```
searchKey: productsubscription.dbLicenses
tags: [struct private]
```

```Go
type dbLicenses struct {
	db dbutil.DB
}
```

dbLicenses exposes product licenses in the product_licenses DB table. 

#### <a id="dbLicenses.Count" href="#dbLicenses.Count">func (s dbLicenses) Count(ctx context.Context, opt dbLicensesListOptions) (int, error)</a>

```
searchKey: productsubscription.dbLicenses.Count
tags: [method private]
```

```Go
func (s dbLicenses) Count(ctx context.Context, opt dbLicensesListOptions) (int, error)
```

Count counts all product licenses that satisfy the options (ignoring limit and offset). 

#### <a id="dbLicenses.Create" href="#dbLicenses.Create">func (s dbLicenses) Create(ctx context.Context, subscriptionID, licenseKey string) (id string, err error)</a>

```
searchKey: productsubscription.dbLicenses.Create
tags: [method private]
```

```Go
func (s dbLicenses) Create(ctx context.Context, subscriptionID, licenseKey string) (id string, err error)
```

Create creates a new product license entry given a license key. 

#### <a id="dbLicenses.GetByID" href="#dbLicenses.GetByID">func (s dbLicenses) GetByID(ctx context.Context, id string) (*dbLicense, error)</a>

```
searchKey: productsubscription.dbLicenses.GetByID
tags: [method private]
```

```Go
func (s dbLicenses) GetByID(ctx context.Context, id string) (*dbLicense, error)
```

GetByID retrieves the product license (if any) given its ID. 

🚨 SECURITY: The caller must ensure that the actor is permitted to view this product license. 

#### <a id="dbLicenses.GetByLicenseKey" href="#dbLicenses.GetByLicenseKey">func (s dbLicenses) GetByLicenseKey(ctx context.Context, licenseKey string) (*dbLicense, error)</a>

```
searchKey: productsubscription.dbLicenses.GetByLicenseKey
tags: [method private]
```

```Go
func (s dbLicenses) GetByLicenseKey(ctx context.Context, licenseKey string) (*dbLicense, error)
```

GetByID retrieves the product license (if any) given its license key. 

#### <a id="dbLicenses.List" href="#dbLicenses.List">func (s dbLicenses) List(ctx context.Context, opt dbLicensesListOptions) ([]*dbLicense, error)</a>

```
searchKey: productsubscription.dbLicenses.List
tags: [method private]
```

```Go
func (s dbLicenses) List(ctx context.Context, opt dbLicensesListOptions) ([]*dbLicense, error)
```

List lists all product licenses that satisfy the options. 

#### <a id="dbLicenses.list" href="#dbLicenses.list">func (s dbLicenses) list(ctx context.Context, conds []*sqlf.Query, limitOffset *database.LimitOffset) ([]*dbLicense, error)</a>

```
searchKey: productsubscription.dbLicenses.list
tags: [method private]
```

```Go
func (s dbLicenses) list(ctx context.Context, conds []*sqlf.Query, limitOffset *database.LimitOffset) ([]*dbLicense, error)
```

### <a id="dbLicensesListOptions" href="#dbLicensesListOptions">type dbLicensesListOptions struct</a>

```
searchKey: productsubscription.dbLicensesListOptions
tags: [struct private]
```

```Go
type dbLicensesListOptions struct {
	LicenseKeySubstring   string
	ProductSubscriptionID string // only list product licenses for this subscription (by UUID)
	*database.LimitOffset
}
```

dbLicensesListOptions contains options for listing product licenses. 

#### <a id="dbLicensesListOptions.sqlConditions" href="#dbLicensesListOptions.sqlConditions">func (o dbLicensesListOptions) sqlConditions() []*sqlf.Query</a>

```
searchKey: productsubscription.dbLicensesListOptions.sqlConditions
tags: [function private]
```

```Go
func (o dbLicensesListOptions) sqlConditions() []*sqlf.Query
```

### <a id="dbMocks" href="#dbMocks">type dbMocks struct</a>

```
searchKey: productsubscription.dbMocks
tags: [struct private]
```

```Go
type dbMocks struct {
	subscriptions mockSubscriptions
	licenses      mockLicenses
}
```

### <a id="dbSubscription" href="#dbSubscription">type dbSubscription struct</a>

```
searchKey: productsubscription.dbSubscription
tags: [struct private]
```

```Go
type dbSubscription struct {
	ID                    string // UUID
	UserID                int32
	BillingSubscriptionID *string // this subscription's ID in the billing system
	CreatedAt             time.Time
	ArchivedAt            *time.Time
}
```

dbSubscription describes an product subscription row in the product_subscriptions DB table. 

### <a id="dbSubscriptionUpdate" href="#dbSubscriptionUpdate">type dbSubscriptionUpdate struct</a>

```
searchKey: productsubscription.dbSubscriptionUpdate
tags: [struct private]
```

```Go
type dbSubscriptionUpdate struct {
	billingSubscriptionID *sql.NullString
}
```

dbSubscriptionsUpdate represents an update to a product subscription in the database. Each field represents an update to the corresponding database field if the Go value is non-nil. If the Go value is nil, the field remains unchanged in the database. 

### <a id="dbSubscriptions" href="#dbSubscriptions">type dbSubscriptions struct</a>

```
searchKey: productsubscription.dbSubscriptions
tags: [struct private]
```

```Go
type dbSubscriptions struct {
	db dbutil.DB
}
```

dbSubscriptions exposes product subscriptions in the product_subscriptions DB table. 

#### <a id="dbSubscriptions.Archive" href="#dbSubscriptions.Archive">func (s dbSubscriptions) Archive(ctx context.Context, id string) error</a>

```
searchKey: productsubscription.dbSubscriptions.Archive
tags: [method private]
```

```Go
func (s dbSubscriptions) Archive(ctx context.Context, id string) error
```

Archive marks a product subscription as archived given its ID. 

🚨 SECURITY: The caller must ensure that the actor is permitted to archive the token. 

#### <a id="dbSubscriptions.Count" href="#dbSubscriptions.Count">func (s dbSubscriptions) Count(ctx context.Context, opt dbSubscriptionsListOptions) (int, error)</a>

```
searchKey: productsubscription.dbSubscriptions.Count
tags: [method private]
```

```Go
func (s dbSubscriptions) Count(ctx context.Context, opt dbSubscriptionsListOptions) (int, error)
```

Count counts all product subscriptions that satisfy the options (ignoring limit and offset). 

#### <a id="dbSubscriptions.Create" href="#dbSubscriptions.Create">func (s dbSubscriptions) Create(ctx context.Context, userID int32) (id string, err error)</a>

```
searchKey: productsubscription.dbSubscriptions.Create
tags: [method private]
```

```Go
func (s dbSubscriptions) Create(ctx context.Context, userID int32) (id string, err error)
```

Create creates a new product subscription entry given a license key. 

#### <a id="dbSubscriptions.GetByID" href="#dbSubscriptions.GetByID">func (s dbSubscriptions) GetByID(ctx context.Context, id string) (*dbSubscription, error)</a>

```
searchKey: productsubscription.dbSubscriptions.GetByID
tags: [method private]
```

```Go
func (s dbSubscriptions) GetByID(ctx context.Context, id string) (*dbSubscription, error)
```

GetByID retrieves the product subscription (if any) given its ID. 

🚨 SECURITY: The caller must ensure that the actor is permitted to view this product subscription. 

#### <a id="dbSubscriptions.List" href="#dbSubscriptions.List">func (s dbSubscriptions) List(ctx context.Context, opt dbSubscriptionsListOptions) ([]*dbSubscription, error)</a>

```
searchKey: productsubscription.dbSubscriptions.List
tags: [method private]
```

```Go
func (s dbSubscriptions) List(ctx context.Context, opt dbSubscriptionsListOptions) ([]*dbSubscription, error)
```

List lists all product subscriptions that satisfy the options. 

#### <a id="dbSubscriptions.Update" href="#dbSubscriptions.Update">func (s dbSubscriptions) Update(ctx context.Context, id string, update dbSubscriptionUpdate) error</a>

```
searchKey: productsubscription.dbSubscriptions.Update
tags: [method private]
```

```Go
func (s dbSubscriptions) Update(ctx context.Context, id string, update dbSubscriptionUpdate) error
```

Update updates a product subscription. 

#### <a id="dbSubscriptions.list" href="#dbSubscriptions.list">func (s dbSubscriptions) list(ctx context.Context, conds []*sqlf.Query, limitOffset *database.LimitOffset) ([]*dbSubscription, error)</a>

```
searchKey: productsubscription.dbSubscriptions.list
tags: [method private]
```

```Go
func (s dbSubscriptions) list(ctx context.Context, conds []*sqlf.Query, limitOffset *database.LimitOffset) ([]*dbSubscription, error)
```

### <a id="dbSubscriptionsListOptions" href="#dbSubscriptionsListOptions">type dbSubscriptionsListOptions struct</a>

```
searchKey: productsubscription.dbSubscriptionsListOptions
tags: [struct private]
```

```Go
type dbSubscriptionsListOptions struct {
	UserID          int32 // only list product subscriptions for this user
	Query           string
	IncludeArchived bool
	*database.LimitOffset
}
```

dbSubscriptionsListOptions contains options for listing product subscriptions. 

#### <a id="dbSubscriptionsListOptions.sqlConditions" href="#dbSubscriptionsListOptions.sqlConditions">func (o dbSubscriptionsListOptions) sqlConditions() []*sqlf.Query</a>

```
searchKey: productsubscription.dbSubscriptionsListOptions.sqlConditions
tags: [function private]
```

```Go
func (o dbSubscriptionsListOptions) sqlConditions() []*sqlf.Query
```

### <a id="fakeSlackClient" href="#fakeSlackClient">type fakeSlackClient struct</a>

```
searchKey: productsubscription.fakeSlackClient
tags: [struct private]
```

```Go
type fakeSlackClient struct {
	payloads []*slack.Payload
}
```

#### <a id="fakeSlackClient.Post" href="#fakeSlackClient.Post">func (c *fakeSlackClient) Post(ctx context.Context, payload *slack.Payload) error</a>

```
searchKey: productsubscription.fakeSlackClient.Post
tags: [method private]
```

```Go
func (c *fakeSlackClient) Post(ctx context.Context, payload *slack.Payload) error
```

### <a id="mockLicenses" href="#mockLicenses">type mockLicenses struct</a>

```
searchKey: productsubscription.mockLicenses
tags: [struct private]
```

```Go
type mockLicenses struct {
	Create          func(subscriptionID, licenseKey string) (id string, err error)
	GetByID         func(id string) (*dbLicense, error)
	GetByLicenseKey func(licenseKey string) (*dbLicense, error)
	List            func(ctx context.Context, opt dbLicensesListOptions) ([]*dbLicense, error)
}
```

### <a id="mockSubscriptions" href="#mockSubscriptions">type mockSubscriptions struct</a>

```
searchKey: productsubscription.mockSubscriptions
tags: [struct private]
```

```Go
type mockSubscriptions struct {
	Create  func(userID int32) (id string, err error)
	GetByID func(id string) (*dbSubscription, error)
	Archive func(id string) error
	List    func(ctx context.Context, opt dbSubscriptionsListOptions) ([]*dbSubscription, error)
}
```

### <a id="productLicense" href="#productLicense">type productLicense struct</a>

```
searchKey: productsubscription.productLicense
tags: [struct private]
```

```Go
type productLicense struct {
	db dbutil.DB
	v  *dbLicense
}
```

productLicense implements the GraphQL type ProductLicense. 

#### <a id="productLicenseByDBID" href="#productLicenseByDBID">func productLicenseByDBID(ctx context.Context, db dbutil.DB, id string) (*productLicense, error)</a>

```
searchKey: productsubscription.productLicenseByDBID
tags: [method private]
```

```Go
func productLicenseByDBID(ctx context.Context, db dbutil.DB, id string) (*productLicense, error)
```

productLicenseByDBID looks up and returns the ProductLicense with the given database ID. If no such ProductLicense exists, it returns a non-nil error. 

#### <a id="productLicenseByID" href="#productLicenseByID">func productLicenseByID(ctx context.Context, db dbutil.DB, id graphql.ID) (*productLicense, error)</a>

```
searchKey: productsubscription.productLicenseByID
tags: [method private]
```

```Go
func productLicenseByID(ctx context.Context, db dbutil.DB, id graphql.ID) (*productLicense, error)
```

productLicenseByID looks up and returns the ProductLicense with the given GraphQL ID. If no such ProductLicense exists, it returns a non-nil error. 

#### <a id="productLicense.CreatedAt" href="#productLicense.CreatedAt">func (r *productLicense) CreatedAt() graphqlbackend.DateTime</a>

```
searchKey: productsubscription.productLicense.CreatedAt
tags: [function private]
```

```Go
func (r *productLicense) CreatedAt() graphqlbackend.DateTime
```

#### <a id="productLicense.ID" href="#productLicense.ID">func (r *productLicense) ID() graphql.ID</a>

```
searchKey: productsubscription.productLicense.ID
tags: [function private]
```

```Go
func (r *productLicense) ID() graphql.ID
```

#### <a id="productLicense.Info" href="#productLicense.Info">func (r *productLicense) Info() (*graphqlbackend.ProductLicenseInfo, error)</a>

```
searchKey: productsubscription.productLicense.Info
tags: [function private]
```

```Go
func (r *productLicense) Info() (*graphqlbackend.ProductLicenseInfo, error)
```

#### <a id="productLicense.LicenseKey" href="#productLicense.LicenseKey">func (r *productLicense) LicenseKey() string</a>

```
searchKey: productsubscription.productLicense.LicenseKey
tags: [function private]
```

```Go
func (r *productLicense) LicenseKey() string
```

#### <a id="productLicense.Subscription" href="#productLicense.Subscription">func (r *productLicense) Subscription(ctx context.Context) (graphqlbackend.ProductSubscription, error)</a>

```
searchKey: productsubscription.productLicense.Subscription
tags: [method private]
```

```Go
func (r *productLicense) Subscription(ctx context.Context) (graphqlbackend.ProductSubscription, error)
```

### <a id="productLicenseConnection" href="#productLicenseConnection">type productLicenseConnection struct</a>

```
searchKey: productsubscription.productLicenseConnection
tags: [struct private]
```

```Go
type productLicenseConnection struct {
	opt dbLicensesListOptions
	db  dbutil.DB

	// cache results because they are used by multiple fields
	once    sync.Once
	results []*dbLicense
	err     error
}
```

productLicenseConnection implements the GraphQL type ProductLicenseConnection. 

🚨 SECURITY: When instantiating a productLicenseConnection value, the caller MUST check permissions. 

#### <a id="productLicenseConnection.Nodes" href="#productLicenseConnection.Nodes">func (r *productLicenseConnection) Nodes(ctx context.Context) ([]graphqlbackend.ProductLicense, error)</a>

```
searchKey: productsubscription.productLicenseConnection.Nodes
tags: [method private]
```

```Go
func (r *productLicenseConnection) Nodes(ctx context.Context) ([]graphqlbackend.ProductLicense, error)
```

#### <a id="productLicenseConnection.PageInfo" href="#productLicenseConnection.PageInfo">func (r *productLicenseConnection) PageInfo(ctx context.Context) (*graphqlutil.PageInfo, error)</a>

```
searchKey: productsubscription.productLicenseConnection.PageInfo
tags: [method private]
```

```Go
func (r *productLicenseConnection) PageInfo(ctx context.Context) (*graphqlutil.PageInfo, error)
```

#### <a id="productLicenseConnection.TotalCount" href="#productLicenseConnection.TotalCount">func (r *productLicenseConnection) TotalCount(ctx context.Context) (int32, error)</a>

```
searchKey: productsubscription.productLicenseConnection.TotalCount
tags: [method private]
```

```Go
func (r *productLicenseConnection) TotalCount(ctx context.Context) (int32, error)
```

#### <a id="productLicenseConnection.compute" href="#productLicenseConnection.compute">func (r *productLicenseConnection) compute(ctx context.Context) ([]*dbLicense, error)</a>

```
searchKey: productsubscription.productLicenseConnection.compute
tags: [method private]
```

```Go
func (r *productLicenseConnection) compute(ctx context.Context) ([]*dbLicense, error)
```

### <a id="productSubscription" href="#productSubscription">type productSubscription struct</a>

```
searchKey: productsubscription.productSubscription
tags: [struct private]
```

```Go
type productSubscription struct {
	db dbutil.DB
	v  *dbSubscription
}
```

productSubscription implements the GraphQL type ProductSubscription. 

#### <a id="productSubscriptionByDBID" href="#productSubscriptionByDBID">func productSubscriptionByDBID(ctx context.Context, db dbutil.DB, id string) (*productSubscription, error)</a>

```
searchKey: productsubscription.productSubscriptionByDBID
tags: [method private]
```

```Go
func productSubscriptionByDBID(ctx context.Context, db dbutil.DB, id string) (*productSubscription, error)
```

productSubscriptionByDBID looks up and returns the ProductSubscription with the given database ID. If no such ProductSubscription exists, it returns a non-nil error. 

#### <a id="productSubscriptionByID" href="#productSubscriptionByID">func productSubscriptionByID(ctx context.Context, db dbutil.DB, id graphql.ID) (*productSubscription, error)</a>

```
searchKey: productsubscription.productSubscriptionByID
tags: [method private]
```

```Go
func productSubscriptionByID(ctx context.Context, db dbutil.DB, id graphql.ID) (*productSubscription, error)
```

productSubscriptionByID looks up and returns the ProductSubscription with the given GraphQL ID. If no such ProductSubscription exists, it returns a non-nil error. 

#### <a id="productSubscription.Account" href="#productSubscription.Account">func (r *productSubscription) Account(ctx context.Context) (*graphqlbackend.UserResolver, error)</a>

```
searchKey: productsubscription.productSubscription.Account
tags: [method private]
```

```Go
func (r *productSubscription) Account(ctx context.Context) (*graphqlbackend.UserResolver, error)
```

#### <a id="productSubscription.ActiveLicense" href="#productSubscription.ActiveLicense">func (r *productSubscription) ActiveLicense(ctx context.Context) (graphqlbackend.ProductLicense, error)</a>

```
searchKey: productsubscription.productSubscription.ActiveLicense
tags: [method private]
```

```Go
func (r *productSubscription) ActiveLicense(ctx context.Context) (graphqlbackend.ProductLicense, error)
```

#### <a id="productSubscription.CreatedAt" href="#productSubscription.CreatedAt">func (r *productSubscription) CreatedAt() graphqlbackend.DateTime</a>

```
searchKey: productsubscription.productSubscription.CreatedAt
tags: [function private]
```

```Go
func (r *productSubscription) CreatedAt() graphqlbackend.DateTime
```

#### <a id="productSubscription.Events" href="#productSubscription.Events">func (r *productSubscription) Events(ctx context.Context) ([]graphqlbackend.ProductSubscriptionEvent, error)</a>

```
searchKey: productsubscription.productSubscription.Events
tags: [method private]
```

```Go
func (r *productSubscription) Events(ctx context.Context) ([]graphqlbackend.ProductSubscriptionEvent, error)
```

#### <a id="productSubscription.ID" href="#productSubscription.ID">func (r *productSubscription) ID() graphql.ID</a>

```
searchKey: productsubscription.productSubscription.ID
tags: [function private]
```

```Go
func (r *productSubscription) ID() graphql.ID
```

#### <a id="productSubscription.InvoiceItem" href="#productSubscription.InvoiceItem">func (r *productSubscription) InvoiceItem(ctx context.Context) (graphqlbackend.ProductSubscriptionInvoiceItem, error)</a>

```
searchKey: productsubscription.productSubscription.InvoiceItem
tags: [method private]
```

```Go
func (r *productSubscription) InvoiceItem(ctx context.Context) (graphqlbackend.ProductSubscriptionInvoiceItem, error)
```

#### <a id="productSubscription.IsArchived" href="#productSubscription.IsArchived">func (r *productSubscription) IsArchived() bool</a>

```
searchKey: productsubscription.productSubscription.IsArchived
tags: [function private]
```

```Go
func (r *productSubscription) IsArchived() bool
```

#### <a id="productSubscription.Name" href="#productSubscription.Name">func (r *productSubscription) Name() string</a>

```
searchKey: productsubscription.productSubscription.Name
tags: [function private]
```

```Go
func (r *productSubscription) Name() string
```

#### <a id="productSubscription.ProductLicenses" href="#productSubscription.ProductLicenses">func (r *productSubscription) ProductLicenses(ctx context.Context, args *graphqlutil.ConnectionArgs) (graphqlbackend.ProductLicenseConnection, error)</a>

```
searchKey: productsubscription.productSubscription.ProductLicenses
tags: [method private]
```

```Go
func (r *productSubscription) ProductLicenses(ctx context.Context, args *graphqlutil.ConnectionArgs) (graphqlbackend.ProductLicenseConnection, error)
```

#### <a id="productSubscription.URL" href="#productSubscription.URL">func (r *productSubscription) URL(ctx context.Context) (string, error)</a>

```
searchKey: productsubscription.productSubscription.URL
tags: [method private]
```

```Go
func (r *productSubscription) URL(ctx context.Context) (string, error)
```

#### <a id="productSubscription.URLForSiteAdmin" href="#productSubscription.URLForSiteAdmin">func (r *productSubscription) URLForSiteAdmin(ctx context.Context) *string</a>

```
searchKey: productsubscription.productSubscription.URLForSiteAdmin
tags: [method private]
```

```Go
func (r *productSubscription) URLForSiteAdmin(ctx context.Context) *string
```

#### <a id="productSubscription.URLForSiteAdminBilling" href="#productSubscription.URLForSiteAdminBilling">func (r *productSubscription) URLForSiteAdminBilling(ctx context.Context) (*string, error)</a>

```
searchKey: productsubscription.productSubscription.URLForSiteAdminBilling
tags: [method private]
```

```Go
func (r *productSubscription) URLForSiteAdminBilling(ctx context.Context) (*string, error)
```

#### <a id="productSubscription.UUID" href="#productSubscription.UUID">func (r *productSubscription) UUID() string</a>

```
searchKey: productsubscription.productSubscription.UUID
tags: [function private]
```

```Go
func (r *productSubscription) UUID() string
```

### <a id="productSubscriptionConnection" href="#productSubscriptionConnection">type productSubscriptionConnection struct</a>

```
searchKey: productsubscription.productSubscriptionConnection
tags: [struct private]
```

```Go
type productSubscriptionConnection struct {
	opt dbSubscriptionsListOptions
	db  dbutil.DB

	// cache results because they are used by multiple fields
	once    sync.Once
	results []*dbSubscription
	err     error
}
```

productSubscriptionConnection implements the GraphQL type ProductSubscriptionConnection. 

🚨 SECURITY: When instantiating a productSubscriptionConnection value, the caller MUST check permissions. 

#### <a id="productSubscriptionConnection.Nodes" href="#productSubscriptionConnection.Nodes">func (r *productSubscriptionConnection) Nodes(ctx context.Context) ([]graphqlbackend.ProductSubscription, error)</a>

```
searchKey: productsubscription.productSubscriptionConnection.Nodes
tags: [method private]
```

```Go
func (r *productSubscriptionConnection) Nodes(ctx context.Context) ([]graphqlbackend.ProductSubscription, error)
```

#### <a id="productSubscriptionConnection.PageInfo" href="#productSubscriptionConnection.PageInfo">func (r *productSubscriptionConnection) PageInfo(ctx context.Context) (*graphqlutil.PageInfo, error)</a>

```
searchKey: productsubscription.productSubscriptionConnection.PageInfo
tags: [method private]
```

```Go
func (r *productSubscriptionConnection) PageInfo(ctx context.Context) (*graphqlutil.PageInfo, error)
```

#### <a id="productSubscriptionConnection.TotalCount" href="#productSubscriptionConnection.TotalCount">func (r *productSubscriptionConnection) TotalCount(ctx context.Context) (int32, error)</a>

```
searchKey: productsubscription.productSubscriptionConnection.TotalCount
tags: [method private]
```

```Go
func (r *productSubscriptionConnection) TotalCount(ctx context.Context) (int32, error)
```

#### <a id="productSubscriptionConnection.compute" href="#productSubscriptionConnection.compute">func (r *productSubscriptionConnection) compute(ctx context.Context) ([]*dbSubscription, error)</a>

```
searchKey: productsubscription.productSubscriptionConnection.compute
tags: [method private]
```

```Go
func (r *productSubscriptionConnection) compute(ctx context.Context) ([]*dbSubscription, error)
```

### <a id="productSubscriptionInvoiceItem" href="#productSubscriptionInvoiceItem">type productSubscriptionInvoiceItem struct</a>

```
searchKey: productsubscription.productSubscriptionInvoiceItem
tags: [struct private]
```

```Go
type productSubscriptionInvoiceItem struct {
	plan      *stripe.Plan
	userCount int32
	expiresAt time.Time
}
```

#### <a id="productSubscriptionInvoiceItem.ExpiresAt" href="#productSubscriptionInvoiceItem.ExpiresAt">func (r *productSubscriptionInvoiceItem) ExpiresAt() graphqlbackend.DateTime</a>

```
searchKey: productsubscription.productSubscriptionInvoiceItem.ExpiresAt
tags: [function private]
```

```Go
func (r *productSubscriptionInvoiceItem) ExpiresAt() graphqlbackend.DateTime
```

#### <a id="productSubscriptionInvoiceItem.Plan" href="#productSubscriptionInvoiceItem.Plan">func (r *productSubscriptionInvoiceItem) Plan() (graphqlbackend.ProductPlan, error)</a>

```
searchKey: productsubscription.productSubscriptionInvoiceItem.Plan
tags: [function private]
```

```Go
func (r *productSubscriptionInvoiceItem) Plan() (graphqlbackend.ProductPlan, error)
```

#### <a id="productSubscriptionInvoiceItem.UserCount" href="#productSubscriptionInvoiceItem.UserCount">func (r *productSubscriptionInvoiceItem) UserCount() int32</a>

```
searchKey: productsubscription.productSubscriptionInvoiceItem.UserCount
tags: [function private]
```

```Go
func (r *productSubscriptionInvoiceItem) UserCount() int32
```

### <a id="productSubscriptionPreviewInvoice" href="#productSubscriptionPreviewInvoice">type productSubscriptionPreviewInvoice struct</a>

```
searchKey: productsubscription.productSubscriptionPreviewInvoice
tags: [struct private]
```

```Go
type productSubscriptionPreviewInvoice struct {
	price         int32
	amountDue     int32
	prorationDate *int64
	before, after *productSubscriptionInvoiceItem
}
```

#### <a id="productSubscriptionPreviewInvoice.AfterInvoiceItem" href="#productSubscriptionPreviewInvoice.AfterInvoiceItem">func (r *productSubscriptionPreviewInvoice) AfterInvoiceItem() graphqlbackend.ProductSubscriptionInvoiceItem</a>

```
searchKey: productsubscription.productSubscriptionPreviewInvoice.AfterInvoiceItem
tags: [function private]
```

```Go
func (r *productSubscriptionPreviewInvoice) AfterInvoiceItem() graphqlbackend.ProductSubscriptionInvoiceItem
```

#### <a id="productSubscriptionPreviewInvoice.AmountDue" href="#productSubscriptionPreviewInvoice.AmountDue">func (r *productSubscriptionPreviewInvoice) AmountDue() int32</a>

```
searchKey: productsubscription.productSubscriptionPreviewInvoice.AmountDue
tags: [function private]
```

```Go
func (r *productSubscriptionPreviewInvoice) AmountDue() int32
```

#### <a id="productSubscriptionPreviewInvoice.BeforeInvoiceItem" href="#productSubscriptionPreviewInvoice.BeforeInvoiceItem">func (r *productSubscriptionPreviewInvoice) BeforeInvoiceItem() graphqlbackend.ProductSubscriptionInvoiceItem</a>

```
searchKey: productsubscription.productSubscriptionPreviewInvoice.BeforeInvoiceItem
tags: [function private]
```

```Go
func (r *productSubscriptionPreviewInvoice) BeforeInvoiceItem() graphqlbackend.ProductSubscriptionInvoiceItem
```

#### <a id="productSubscriptionPreviewInvoice.IsDowngradeRequiringManualIntervention" href="#productSubscriptionPreviewInvoice.IsDowngradeRequiringManualIntervention">func (r *productSubscriptionPreviewInvoice) IsDowngradeRequiringManualIntervention() bool</a>

```
searchKey: productsubscription.productSubscriptionPreviewInvoice.IsDowngradeRequiringManualIntervention
tags: [function private]
```

```Go
func (r *productSubscriptionPreviewInvoice) IsDowngradeRequiringManualIntervention() bool
```

#### <a id="productSubscriptionPreviewInvoice.Price" href="#productSubscriptionPreviewInvoice.Price">func (r *productSubscriptionPreviewInvoice) Price() int32</a>

```
searchKey: productsubscription.productSubscriptionPreviewInvoice.Price
tags: [function private]
```

```Go
func (r *productSubscriptionPreviewInvoice) Price() int32
```

#### <a id="productSubscriptionPreviewInvoice.ProrationDate" href="#productSubscriptionPreviewInvoice.ProrationDate">func (r *productSubscriptionPreviewInvoice) ProrationDate() *string</a>

```
searchKey: productsubscription.productSubscriptionPreviewInvoice.ProrationDate
tags: [function private]
```

```Go
func (r *productSubscriptionPreviewInvoice) ProrationDate() *string
```

### <a id="slackClient" href="#slackClient">type slackClient interface</a>

```
searchKey: productsubscription.slackClient
tags: [interface private]
```

```Go
type slackClient interface {
	Post(ctx context.Context, payload *slack.Payload) error
}
```

## <a id="func" href="#func">Functions</a>

```
tags: [package private]
```

### <a id="StartCheckForUpcomingLicenseExpirations" href="#StartCheckForUpcomingLicenseExpirations">func StartCheckForUpcomingLicenseExpirations(db dbutil.DB)</a>

```
searchKey: productsubscription.StartCheckForUpcomingLicenseExpirations
tags: [method]
```

```Go
func StartCheckForUpcomingLicenseExpirations(db dbutil.DB)
```

StartCheckForUpcomingLicenseExpirations checks for upcoming license expirations once per day. 

### <a id="TestCheckForUpcomingLicenseExpirations" href="#TestCheckForUpcomingLicenseExpirations">func TestCheckForUpcomingLicenseExpirations(t *testing.T)</a>

```
searchKey: productsubscription.TestCheckForUpcomingLicenseExpirations
tags: [method private test]
```

```Go
func TestCheckForUpcomingLicenseExpirations(t *testing.T)
```

### <a id="TestProductLicenses_Create" href="#TestProductLicenses_Create">func TestProductLicenses_Create(t *testing.T)</a>

```
searchKey: productsubscription.TestProductLicenses_Create
tags: [method private test]
```

```Go
func TestProductLicenses_Create(t *testing.T)
```

### <a id="TestProductLicenses_List" href="#TestProductLicenses_List">func TestProductLicenses_List(t *testing.T)</a>

```
searchKey: productsubscription.TestProductLicenses_List
tags: [method private test]
```

```Go
func TestProductLicenses_List(t *testing.T)
```

### <a id="TestProductSubscriptions_Create" href="#TestProductSubscriptions_Create">func TestProductSubscriptions_Create(t *testing.T)</a>

```
searchKey: productsubscription.TestProductSubscriptions_Create
tags: [method private test]
```

```Go
func TestProductSubscriptions_Create(t *testing.T)
```

### <a id="TestProductSubscriptions_List" href="#TestProductSubscriptions_List">func TestProductSubscriptions_List(t *testing.T)</a>

```
searchKey: productsubscription.TestProductSubscriptions_List
tags: [method private test]
```

```Go
func TestProductSubscriptions_List(t *testing.T)
```

### <a id="TestProductSubscriptions_Update" href="#TestProductSubscriptions_Update">func TestProductSubscriptions_Update(t *testing.T)</a>

```
searchKey: productsubscription.TestProductSubscriptions_Update
tags: [method private test]
```

```Go
func TestProductSubscriptions_Update(t *testing.T)
```

### <a id="checkForUpcomingLicenseExpirations" href="#checkForUpcomingLicenseExpirations">func checkForUpcomingLicenseExpirations(db dbutil.DB, clock glock.Clock, client slackClient)</a>

```
searchKey: productsubscription.checkForUpcomingLicenseExpirations
tags: [method private]
```

```Go
func checkForUpcomingLicenseExpirations(db dbutil.DB, clock glock.Clock, client slackClient)
```

### <a id="checkLastSubscriptionLicense" href="#checkLastSubscriptionLicense">func checkLastSubscriptionLicense(ctx context.Context, db dbutil.DB, s *dbSubscription, clock glock.Clock, client slackClient)</a>

```
searchKey: productsubscription.checkLastSubscriptionLicense
tags: [method private]
```

```Go
func checkLastSubscriptionLicense(ctx context.Context, db dbutil.DB, s *dbSubscription, clock glock.Clock, client slackClient)
```

### <a id="checkLicensesIfNeeded" href="#checkLicensesIfNeeded">func checkLicensesIfNeeded(db dbutil.DB, client slackClient)</a>

```
searchKey: productsubscription.checkLicensesIfNeeded
tags: [method private]
```

```Go
func checkLicensesIfNeeded(db dbutil.DB, client slackClient)
```

checkLicensesIfNeeded checks whether a day has passed since the last license check, and if so, initiates one. 

### <a id="generateProductLicenseForSubscription" href="#generateProductLicenseForSubscription">func generateProductLicenseForSubscription(ctx context.Context, db dbutil.DB, subscriptionID string, input *graphqlbackend.ProductLicenseInput) (id string, err error)</a>

```
searchKey: productsubscription.generateProductLicenseForSubscription
tags: [method private]
```

```Go
func generateProductLicenseForSubscription(ctx context.Context, db dbutil.DB, subscriptionID string, input *graphqlbackend.ProductLicenseInput) (id string, err error)
```

### <a id="init.db_test.go" href="#init.db_test.go">func init()</a>

```
searchKey: productsubscription.init
tags: [function private]
```

```Go
func init()
```

### <a id="isDowngradeRequiringManualIntervention" href="#isDowngradeRequiringManualIntervention">func isDowngradeRequiringManualIntervention(beforeUserCount int32, beforePlanPrice int64, afterUserCount int32, afterPlanPrice int64) bool</a>

```
searchKey: productsubscription.isDowngradeRequiringManualIntervention
tags: [method private]
```

```Go
func isDowngradeRequiringManualIntervention(beforeUserCount int32, beforePlanPrice int64, afterUserCount int32, afterPlanPrice int64) bool
```

### <a id="marshalProductLicenseID" href="#marshalProductLicenseID">func marshalProductLicenseID(id string) graphql.ID</a>

```
searchKey: productsubscription.marshalProductLicenseID
tags: [method private]
```

```Go
func marshalProductLicenseID(id string) graphql.ID
```

### <a id="marshalProductSubscriptionID" href="#marshalProductSubscriptionID">func marshalProductSubscriptionID(id string) graphql.ID</a>

```
searchKey: productsubscription.marshalProductSubscriptionID
tags: [method private]
```

```Go
func marshalProductSubscriptionID(id string) graphql.ID
```

### <a id="unmarshalProductLicenseID" href="#unmarshalProductLicenseID">func unmarshalProductLicenseID(id graphql.ID) (productLicenseID string, err error)</a>

```
searchKey: productsubscription.unmarshalProductLicenseID
tags: [method private]
```

```Go
func unmarshalProductLicenseID(id graphql.ID) (productLicenseID string, err error)
```

### <a id="unmarshalProductSubscriptionID" href="#unmarshalProductSubscriptionID">func unmarshalProductSubscriptionID(id graphql.ID) (productSubscriptionID string, err error)</a>

```
searchKey: productsubscription.unmarshalProductSubscriptionID
tags: [method private]
```

```Go
func unmarshalProductSubscriptionID(id graphql.ID) (productSubscriptionID string, err error)
```

### <a id="userCountExceedsPlanMaxError" href="#userCountExceedsPlanMaxError">func userCountExceedsPlanMaxError(userCount, max int32) error</a>

```
searchKey: productsubscription.userCountExceedsPlanMaxError
tags: [method private]
```

```Go
func userCountExceedsPlanMaxError(userCount, max int32) error
```

