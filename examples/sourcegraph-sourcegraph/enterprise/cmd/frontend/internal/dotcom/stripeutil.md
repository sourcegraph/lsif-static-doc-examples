# Package stripeutil

## Index

* [Variables](#var)
    * [var stripePublishableKey](#stripePublishableKey)
    * [var stripeSecretKey](#stripeSecretKey)
* [Functions](#func)
    * [func CustomerURL(id string) string](#CustomerURL)
    * [func SubscriptionURL(id string) string](#SubscriptionURL)
    * [func ValidateAndPublishConfig() bool](#ValidateAndPublishConfig)
    * [func baseURL() string](#baseURL)
    * [func isTest() bool](#isTest)


## <a id="var" href="#var">Variables</a>

```
tags: [private]
```

### <a id="stripePublishableKey" href="#stripePublishableKey">var stripePublishableKey</a>

```
searchKey: stripeutil.stripePublishableKey
tags: [variable string private]
```

```Go
var stripePublishableKey = ...
```

### <a id="stripeSecretKey" href="#stripeSecretKey">var stripeSecretKey</a>

```
searchKey: stripeutil.stripeSecretKey
tags: [variable string private]
```

```Go
var stripeSecretKey = env.Get("STRIPE_SECRET_KEY", "", "billing: Stripe API secret key")
```

## <a id="func" href="#func">Functions</a>

```
tags: [private]
```

### <a id="CustomerURL" href="#CustomerURL">func CustomerURL(id string) string</a>

```
searchKey: stripeutil.CustomerURL
tags: [function]
```

```Go
func CustomerURL(id string) string
```

CustomerURL returns the URL to the customer with the given ID on the billing system. 

### <a id="SubscriptionURL" href="#SubscriptionURL">func SubscriptionURL(id string) string</a>

```
searchKey: stripeutil.SubscriptionURL
tags: [function]
```

```Go
func SubscriptionURL(id string) string
```

SubscriptionURL returns the URL to the subscription with the given ID on the billing system. 

### <a id="ValidateAndPublishConfig" href="#ValidateAndPublishConfig">func ValidateAndPublishConfig() bool</a>

```
searchKey: stripeutil.ValidateAndPublishConfig
tags: [function]
```

```Go
func ValidateAndPublishConfig() bool
```

ValidateAndPublishConfig check for and validates config for Stripe and exposes the publishable key through the jscontext. It exists the process, if the variables don't pass validation. It returns true if Stripe was configured. 

### <a id="baseURL" href="#baseURL">func baseURL() string</a>

```
searchKey: stripeutil.baseURL
tags: [function private]
```

```Go
func baseURL() string
```

### <a id="isTest" href="#isTest">func isTest() bool</a>

```
searchKey: stripeutil.isTest
tags: [function private]
```

```Go
func isTest() bool
```

