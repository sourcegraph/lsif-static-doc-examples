# Package stripeutil

## Index

* [Variables](#var)
    * [var stripeSecretKey](#stripeSecretKey)
    * [var stripePublishableKey](#stripePublishableKey)
* [Functions](#func)
    * [func ValidateAndPublishConfig() bool](#ValidateAndPublishConfig)
    * [func isTest() bool](#isTest)
    * [func baseURL() string](#baseURL)
    * [func CustomerURL(id string) string](#CustomerURL)
    * [func SubscriptionURL(id string) string](#SubscriptionURL)


## <a id="var" href="#var">Variables</a>

### <a id="stripeSecretKey" href="#stripeSecretKey">var stripeSecretKey</a>

```
searchKey: stripeutil.stripeSecretKey
```

```Go
var stripeSecretKey = env.Get("STRIPE_SECRET_KEY", "", "billing: Stripe API secret key")
```

### <a id="stripePublishableKey" href="#stripePublishableKey">var stripePublishableKey</a>

```
searchKey: stripeutil.stripePublishableKey
```

```Go
var stripePublishableKey = ...
```

## <a id="func" href="#func">Functions</a>

### <a id="ValidateAndPublishConfig" href="#ValidateAndPublishConfig">func ValidateAndPublishConfig() bool</a>

```
searchKey: stripeutil.ValidateAndPublishConfig
tags: [exported]
```

```Go
func ValidateAndPublishConfig() bool
```

ValidateAndPublishConfig check for and validates config for Stripe and exposes the publishable key through the jscontext. It exists the process, if the variables don't pass validation. It returns true if Stripe was configured. 

### <a id="isTest" href="#isTest">func isTest() bool</a>

```
searchKey: stripeutil.isTest
```

```Go
func isTest() bool
```

### <a id="baseURL" href="#baseURL">func baseURL() string</a>

```
searchKey: stripeutil.baseURL
```

```Go
func baseURL() string
```

### <a id="CustomerURL" href="#CustomerURL">func CustomerURL(id string) string</a>

```
searchKey: stripeutil.CustomerURL
tags: [exported]
```

```Go
func CustomerURL(id string) string
```

CustomerURL returns the URL to the customer with the given ID on the billing system. 

### <a id="SubscriptionURL" href="#SubscriptionURL">func SubscriptionURL(id string) string</a>

```
searchKey: stripeutil.SubscriptionURL
tags: [exported]
```

```Go
func SubscriptionURL(id string) string
```

SubscriptionURL returns the URL to the subscription with the given ID on the billing system. 
