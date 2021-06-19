# Package billing

Package billing handles subscription billing on Sourcegraph.com (via Stripe). 

## Index

* [Variables](#var)
    * [var dummyCustomerMu](#dummyCustomerMu)
    * [var dummyCustomerID](#dummyCustomerID)
    * [var mockCreateCustomerID](#mockCreateCustomerID)
* [Types](#type)
    * [type dbBilling struct](#dbBilling)
        * [func (s dbBilling) getUserBillingCustomerID(ctx context.Context, userID int32) (billingCustomerID *string, err error)](#dbBilling.getUserBillingCustomerID)
        * [func (s dbBilling) setUserBillingCustomerID(ctx context.Context, userID int32, billingCustomerID *string) error](#dbBilling.setUserBillingCustomerID)
    * [type productSubscriptionEvent struct](#productSubscriptionEvent)
        * [func (r *productSubscriptionEvent) ID() string](#productSubscriptionEvent.ID)
        * [func (r *productSubscriptionEvent) Date() string](#productSubscriptionEvent.Date)
        * [func (r *productSubscriptionEvent) Title() string](#productSubscriptionEvent.Title)
        * [func (r *productSubscriptionEvent) Description() *string](#productSubscriptionEvent.Description)
        * [func (r *productSubscriptionEvent) URL() *string](#productSubscriptionEvent.URL)
    * [type BillingResolver struct](#BillingResolver)
        * [func (r BillingResolver) UserURLForSiteAdminBilling(ctx context.Context, userID int32) (*string, error)](#BillingResolver.UserURLForSiteAdminBilling)
        * [func (r BillingResolver) SetUserBilling(ctx context.Context, args *graphqlbackend.SetUserBillingArgs) (*graphqlbackend.EmptyResponse, error)](#BillingResolver.SetUserBilling)
        * [func (BillingResolver) ProductPlans(ctx context.Context) ([]graphqlbackend.ProductPlan, error)](#BillingResolver.ProductPlans)
    * [type productPlan struct](#productPlan)
        * [func (r *productPlan) ProductPlanID() string](#productPlan.ProductPlanID)
        * [func (r *productPlan) BillingPlanID() string](#productPlan.BillingPlanID)
        * [func (r *productPlan) Name() string](#productPlan.Name)
        * [func (r *productPlan) NameWithBrand() string](#productPlan.NameWithBrand)
        * [func (r *productPlan) PricePerUserPerYear() int32](#productPlan.PricePerUserPerYear)
        * [func (r *productPlan) MinQuantity() *int32](#productPlan.MinQuantity)
        * [func (r *productPlan) MaxQuantity() *int32](#productPlan.MaxQuantity)
        * [func (r *productPlan) TiersMode() string](#productPlan.TiersMode)
        * [func (r *productPlan) PlanTiers() []graphqlbackend.PlanTier](#productPlan.PlanTiers)
    * [type planTier struct](#planTier)
        * [func (r *planTier) UnitAmount() int32](#planTier.UnitAmount)
        * [func (r *planTier) UpTo() int32](#planTier.UpTo)
        * [func (r *planTier) FlatAmount() int32](#planTier.FlatAmount)
* [Functions](#func)
    * [func GetOrAssignUserCustomerID(ctx context.Context, userID int32) (_ string, err error)](#GetOrAssignUserCustomerID)
    * [func GetDummyCustomerID(ctx context.Context) (string, error)](#GetDummyCustomerID)
    * [func createCustomerID(ctx context.Context, db dbutil.DB, userID int32) (string, error)](#createCustomerID)
    * [func deleteCustomerID(ctx context.Context, customerID string) error](#deleteCustomerID)
    * [func ToProductSubscriptionEvent(event *stripe.Event) (gqlEvent graphqlbackend.ProductSubscriptionEvent, okToShowUser bool)](#ToProductSubscriptionEvent)
    * [func getProductSubscriptionEventInfo(v *stripe.Event) (title, description string, okToShowUser bool)](#getProductSubscriptionEventInfo)
    * [func usdCentsToString(s string) string](#usdCentsToString)
    * [func InfoForProductPlan(ctx context.Context, planID string) (licenseTags []string, minQuantity, maxQuantity *int32, err error)](#InfoForProductPlan)
    * [func ToProductPlan(plan *stripe.Plan) (graphqlbackend.ProductPlan, error)](#ToProductPlan)
    * [func ProductPlanMinMaxQuantity(plan *stripe.Plan) (min, max *int32)](#ProductPlanMinMaxQuantity)
    * [func ToSubscriptionItemsParams(input graphqlbackend.ProductSubscriptionInput) *stripe.SubscriptionItemsParams](#ToSubscriptionItemsParams)
    * [func GetSubscriptionItemIDToReplace(billingSub *stripe.Subscription, billingCustomerID string) (string, error)](#GetSubscriptionItemIDToReplace)
    * [func TestGetOrAssignUserCustomerID(t *testing.T)](#TestGetOrAssignUserCustomerID)
    * [func init()](#init)
    * [func TestDBUsersBillingCustomerID(t *testing.T)](#TestDBUsersBillingCustomerID)
    * [func strptr(s string) *string](#strptr)


## <a id="var" href="#var">Variables</a>

### <a id="dummyCustomerMu" href="#dummyCustomerMu">var dummyCustomerMu</a>

```
searchKey: billing.dummyCustomerMu
```

```Go
var dummyCustomerMu sync.Mutex
```

### <a id="dummyCustomerID" href="#dummyCustomerID">var dummyCustomerID</a>

```
searchKey: billing.dummyCustomerID
```

```Go
var dummyCustomerID string
```

### <a id="mockCreateCustomerID" href="#mockCreateCustomerID">var mockCreateCustomerID</a>

```
searchKey: billing.mockCreateCustomerID
```

```Go
var mockCreateCustomerID func(userID int32) (string, error)
```

## <a id="type" href="#type">Types</a>

### <a id="dbBilling" href="#dbBilling">type dbBilling struct</a>

```
searchKey: billing.dbBilling
```

```Go
type dbBilling struct {
	db dbutil.DB
}
```

dbBilling provides billing-related database operations. 

#### <a id="dbBilling.getUserBillingCustomerID" href="#dbBilling.getUserBillingCustomerID">func (s dbBilling) getUserBillingCustomerID(ctx context.Context, userID int32) (billingCustomerID *string, err error)</a>

```
searchKey: billing.dbBilling.getUserBillingCustomerID
```

```Go
func (s dbBilling) getUserBillingCustomerID(ctx context.Context, userID int32) (billingCustomerID *string, err error)
```

getUserBillingCustomerID gets the billing customer ID (if any) for a user. 

If a transaction tx is provided, the query is executed using the transaction. If tx is nil, the global DB handle is used. 

#### <a id="dbBilling.setUserBillingCustomerID" href="#dbBilling.setUserBillingCustomerID">func (s dbBilling) setUserBillingCustomerID(ctx context.Context, userID int32, billingCustomerID *string) error</a>

```
searchKey: billing.dbBilling.setUserBillingCustomerID
```

```Go
func (s dbBilling) setUserBillingCustomerID(ctx context.Context, userID int32, billingCustomerID *string) error
```

setUserBillingCustomerID sets or unsets the billing customer ID for a user. 

If a transaction tx is provided, the query is executed using the transaction. If tx is nil, the global DB handle is used. 

### <a id="productSubscriptionEvent" href="#productSubscriptionEvent">type productSubscriptionEvent struct</a>

```
searchKey: billing.productSubscriptionEvent
```

```Go
type productSubscriptionEvent struct {
	v *stripe.Event
}
```

productSubscriptionEvent implements the GraphQL type ProductSubscriptionEvent. 

#### <a id="productSubscriptionEvent.ID" href="#productSubscriptionEvent.ID">func (r *productSubscriptionEvent) ID() string</a>

```
searchKey: billing.productSubscriptionEvent.ID
```

```Go
func (r *productSubscriptionEvent) ID() string
```

#### <a id="productSubscriptionEvent.Date" href="#productSubscriptionEvent.Date">func (r *productSubscriptionEvent) Date() string</a>

```
searchKey: billing.productSubscriptionEvent.Date
```

```Go
func (r *productSubscriptionEvent) Date() string
```

#### <a id="productSubscriptionEvent.Title" href="#productSubscriptionEvent.Title">func (r *productSubscriptionEvent) Title() string</a>

```
searchKey: billing.productSubscriptionEvent.Title
```

```Go
func (r *productSubscriptionEvent) Title() string
```

#### <a id="productSubscriptionEvent.Description" href="#productSubscriptionEvent.Description">func (r *productSubscriptionEvent) Description() *string</a>

```
searchKey: billing.productSubscriptionEvent.Description
```

```Go
func (r *productSubscriptionEvent) Description() *string
```

#### <a id="productSubscriptionEvent.URL" href="#productSubscriptionEvent.URL">func (r *productSubscriptionEvent) URL() *string</a>

```
searchKey: billing.productSubscriptionEvent.URL
```

```Go
func (r *productSubscriptionEvent) URL() *string
```

### <a id="BillingResolver" href="#BillingResolver">type BillingResolver struct</a>

```
searchKey: billing.BillingResolver
tags: [exported]
```

```Go
type BillingResolver struct {
	DB dbutil.DB
}
```

BillingResolver implements the GraphQL Query and Mutation fields related to billing. 

#### <a id="BillingResolver.UserURLForSiteAdminBilling" href="#BillingResolver.UserURLForSiteAdminBilling">func (r BillingResolver) UserURLForSiteAdminBilling(ctx context.Context, userID int32) (*string, error)</a>

```
searchKey: billing.BillingResolver.UserURLForSiteAdminBilling
tags: [exported]
```

```Go
func (r BillingResolver) UserURLForSiteAdminBilling(ctx context.Context, userID int32) (*string, error)
```

#### <a id="BillingResolver.SetUserBilling" href="#BillingResolver.SetUserBilling">func (r BillingResolver) SetUserBilling(ctx context.Context, args *graphqlbackend.SetUserBillingArgs) (*graphqlbackend.EmptyResponse, error)</a>

```
searchKey: billing.BillingResolver.SetUserBilling
tags: [exported]
```

```Go
func (r BillingResolver) SetUserBilling(ctx context.Context, args *graphqlbackend.SetUserBillingArgs) (*graphqlbackend.EmptyResponse, error)
```

#### <a id="BillingResolver.ProductPlans" href="#BillingResolver.ProductPlans">func (BillingResolver) ProductPlans(ctx context.Context) ([]graphqlbackend.ProductPlan, error)</a>

```
searchKey: billing.BillingResolver.ProductPlans
tags: [exported]
```

```Go
func (BillingResolver) ProductPlans(ctx context.Context) ([]graphqlbackend.ProductPlan, error)
```

ProductPlans implements the GraphQL field Query.dotcom.productPlans. 

### <a id="productPlan" href="#productPlan">type productPlan struct</a>

```
searchKey: billing.productPlan
```

```Go
type productPlan struct {
	billingPlanID       string
	productPlanID       string
	name                string
	pricePerUserPerYear int32
	minQuantity         *int32
	maxQuantity         *int32
	tiersMode           string
	planTiers           []graphqlbackend.PlanTier
}
```

productPlan implements the GraphQL type ProductPlan. 

#### <a id="productPlan.ProductPlanID" href="#productPlan.ProductPlanID">func (r *productPlan) ProductPlanID() string</a>

```
searchKey: billing.productPlan.ProductPlanID
```

```Go
func (r *productPlan) ProductPlanID() string
```

#### <a id="productPlan.BillingPlanID" href="#productPlan.BillingPlanID">func (r *productPlan) BillingPlanID() string</a>

```
searchKey: billing.productPlan.BillingPlanID
```

```Go
func (r *productPlan) BillingPlanID() string
```

#### <a id="productPlan.Name" href="#productPlan.Name">func (r *productPlan) Name() string</a>

```
searchKey: billing.productPlan.Name
```

```Go
func (r *productPlan) Name() string
```

#### <a id="productPlan.NameWithBrand" href="#productPlan.NameWithBrand">func (r *productPlan) NameWithBrand() string</a>

```
searchKey: billing.productPlan.NameWithBrand
```

```Go
func (r *productPlan) NameWithBrand() string
```

#### <a id="productPlan.PricePerUserPerYear" href="#productPlan.PricePerUserPerYear">func (r *productPlan) PricePerUserPerYear() int32</a>

```
searchKey: billing.productPlan.PricePerUserPerYear
```

```Go
func (r *productPlan) PricePerUserPerYear() int32
```

#### <a id="productPlan.MinQuantity" href="#productPlan.MinQuantity">func (r *productPlan) MinQuantity() *int32</a>

```
searchKey: billing.productPlan.MinQuantity
```

```Go
func (r *productPlan) MinQuantity() *int32
```

#### <a id="productPlan.MaxQuantity" href="#productPlan.MaxQuantity">func (r *productPlan) MaxQuantity() *int32</a>

```
searchKey: billing.productPlan.MaxQuantity
```

```Go
func (r *productPlan) MaxQuantity() *int32
```

#### <a id="productPlan.TiersMode" href="#productPlan.TiersMode">func (r *productPlan) TiersMode() string</a>

```
searchKey: billing.productPlan.TiersMode
```

```Go
func (r *productPlan) TiersMode() string
```

#### <a id="productPlan.PlanTiers" href="#productPlan.PlanTiers">func (r *productPlan) PlanTiers() []graphqlbackend.PlanTier</a>

```
searchKey: billing.productPlan.PlanTiers
```

```Go
func (r *productPlan) PlanTiers() []graphqlbackend.PlanTier
```

### <a id="planTier" href="#planTier">type planTier struct</a>

```
searchKey: billing.planTier
```

```Go
type planTier struct {
	unitAmount int64
	upTo       int64
	flatAmount int64
}
```

planTier implements the GraphQL type PlanTier. 

#### <a id="planTier.UnitAmount" href="#planTier.UnitAmount">func (r *planTier) UnitAmount() int32</a>

```
searchKey: billing.planTier.UnitAmount
```

```Go
func (r *planTier) UnitAmount() int32
```

#### <a id="planTier.UpTo" href="#planTier.UpTo">func (r *planTier) UpTo() int32</a>

```
searchKey: billing.planTier.UpTo
```

```Go
func (r *planTier) UpTo() int32
```

#### <a id="planTier.FlatAmount" href="#planTier.FlatAmount">func (r *planTier) FlatAmount() int32</a>

```
searchKey: billing.planTier.FlatAmount
```

```Go
func (r *planTier) FlatAmount() int32
```

## <a id="func" href="#func">Functions</a>

### <a id="GetOrAssignUserCustomerID" href="#GetOrAssignUserCustomerID">func GetOrAssignUserCustomerID(ctx context.Context, userID int32) (_ string, err error)</a>

```
searchKey: billing.GetOrAssignUserCustomerID
tags: [exported]
```

```Go
func GetOrAssignUserCustomerID(ctx context.Context, userID int32) (_ string, err error)
```

GetOrAssignUserCustomerID returns the billing customer ID associated with the user. If no billing customer ID exists for the user, a new one is created and saved on the user's DB record. 

### <a id="GetDummyCustomerID" href="#GetDummyCustomerID">func GetDummyCustomerID(ctx context.Context) (string, error)</a>

```
searchKey: billing.GetDummyCustomerID
tags: [exported]
```

```Go
func GetDummyCustomerID(ctx context.Context) (string, error)
```

GetDummyCustomerID returns the customer ID for a dummy customer that must be used only for pricing out invoices not associated with any particular customer. There is one dummy customer in the billing system that is used for all such operations (because the billing system requires providing a customer ID but we don't want to use any actual customer's ID). 

The first time this func is called, it looks up the ID of the existing dummy customer in the billing system and returns that if one exists (to avoid creating many dummy customer records). If the dummy customer doesn't exist yet, it is automatically created. 

### <a id="createCustomerID" href="#createCustomerID">func createCustomerID(ctx context.Context, db dbutil.DB, userID int32) (string, error)</a>

```
searchKey: billing.createCustomerID
```

```Go
func createCustomerID(ctx context.Context, db dbutil.DB, userID int32) (string, error)
```

createCustomerID creates a customer record on the billing system and returns the customer ID of the new record. 

### <a id="deleteCustomerID" href="#deleteCustomerID">func deleteCustomerID(ctx context.Context, customerID string) error</a>

```
searchKey: billing.deleteCustomerID
```

```Go
func deleteCustomerID(ctx context.Context, customerID string) error
```

deleteCustomerID deletes the customer record on the billing system. 

### <a id="ToProductSubscriptionEvent" href="#ToProductSubscriptionEvent">func ToProductSubscriptionEvent(event *stripe.Event) (gqlEvent graphqlbackend.ProductSubscriptionEvent, okToShowUser bool)</a>

```
searchKey: billing.ToProductSubscriptionEvent
tags: [exported]
```

```Go
func ToProductSubscriptionEvent(event *stripe.Event) (gqlEvent graphqlbackend.ProductSubscriptionEvent, okToShowUser bool)
```

ToProductSubscriptionEvent returns a resolver for the GraphQL type ProductSubscriptionEvent from the given billing event. 

The okToShowUser return value reports whether the event should be shown to the user. It is false for internal events (e.g., an invoice being marked uncollectible). 

### <a id="getProductSubscriptionEventInfo" href="#getProductSubscriptionEventInfo">func getProductSubscriptionEventInfo(v *stripe.Event) (title, description string, okToShowUser bool)</a>

```
searchKey: billing.getProductSubscriptionEventInfo
```

```Go
func getProductSubscriptionEventInfo(v *stripe.Event) (title, description string, okToShowUser bool)
```

getProductSubscriptionEventInfo returns a nice title and description for the event. See ToProductSubscriptionEvent for information about the okToShowUser return value. 

### <a id="usdCentsToString" href="#usdCentsToString">func usdCentsToString(s string) string</a>

```
searchKey: billing.usdCentsToString
```

```Go
func usdCentsToString(s string) string
```

### <a id="InfoForProductPlan" href="#InfoForProductPlan">func InfoForProductPlan(ctx context.Context, planID string) (licenseTags []string, minQuantity, maxQuantity *int32, err error)</a>

```
searchKey: billing.InfoForProductPlan
tags: [exported]
```

```Go
func InfoForProductPlan(ctx context.Context, planID string) (licenseTags []string, minQuantity, maxQuantity *int32, err error)
```

InfoForProductPlan returns the license key tags and min/max quantities that should be used for the given product plan. 

License key tags indicate which product plan the license is for, so they are stored on the billing system in the metadata of the product plans. 

### <a id="ToProductPlan" href="#ToProductPlan">func ToProductPlan(plan *stripe.Plan) (graphqlbackend.ProductPlan, error)</a>

```
searchKey: billing.ToProductPlan
tags: [exported]
```

```Go
func ToProductPlan(plan *stripe.Plan) (graphqlbackend.ProductPlan, error)
```

ToProductPlan returns a resolver for the GraphQL type ProductPlan from the given billing plan. 

### <a id="ProductPlanMinMaxQuantity" href="#ProductPlanMinMaxQuantity">func ProductPlanMinMaxQuantity(plan *stripe.Plan) (min, max *int32)</a>

```
searchKey: billing.ProductPlanMinMaxQuantity
tags: [exported]
```

```Go
func ProductPlanMinMaxQuantity(plan *stripe.Plan) (min, max *int32)
```

ProductPlanMinMaxQuantity returns the plan's product's minQuantity and maxQuantity metadata values, or nil if unset. 

### <a id="ToSubscriptionItemsParams" href="#ToSubscriptionItemsParams">func ToSubscriptionItemsParams(input graphqlbackend.ProductSubscriptionInput) *stripe.SubscriptionItemsParams</a>

```
searchKey: billing.ToSubscriptionItemsParams
tags: [exported]
```

```Go
func ToSubscriptionItemsParams(input graphqlbackend.ProductSubscriptionInput) *stripe.SubscriptionItemsParams
```

ToSubscriptionItemsParams converts a value of GraphQL type ProductSubscriptionInput into a subscription item parameter for the billing system. 

### <a id="GetSubscriptionItemIDToReplace" href="#GetSubscriptionItemIDToReplace">func GetSubscriptionItemIDToReplace(billingSub *stripe.Subscription, billingCustomerID string) (string, error)</a>

```
searchKey: billing.GetSubscriptionItemIDToReplace
tags: [exported]
```

```Go
func GetSubscriptionItemIDToReplace(billingSub *stripe.Subscription, billingCustomerID string) (string, error)
```

GetSubscriptionItemIDToReplace returns the ID of the billing subscription item (used when updating the subscription or previewing an invoice to do so). It also performs a good set of sanity checks on the subscription that should be performed whenever the subscription is updated. 

### <a id="TestGetOrAssignUserCustomerID" href="#TestGetOrAssignUserCustomerID">func TestGetOrAssignUserCustomerID(t *testing.T)</a>

```
searchKey: billing.TestGetOrAssignUserCustomerID
```

```Go
func TestGetOrAssignUserCustomerID(t *testing.T)
```

### <a id="init" href="#init">func init()</a>

```
searchKey: billing.init
```

```Go
func init()
```

### <a id="TestDBUsersBillingCustomerID" href="#TestDBUsersBillingCustomerID">func TestDBUsersBillingCustomerID(t *testing.T)</a>

```
searchKey: billing.TestDBUsersBillingCustomerID
```

```Go
func TestDBUsersBillingCustomerID(t *testing.T)
```

### <a id="strptr" href="#strptr">func strptr(s string) *string</a>

```
searchKey: billing.strptr
```

```Go
func strptr(s string) *string
```

