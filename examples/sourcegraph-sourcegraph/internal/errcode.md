# Package errcode

Package errcode maps Go errors to HTTP status codes as well as other useful functions for inspecting errors. 

## Index

* [Types](#type)
    * [type HTTPErr struct](#HTTPErr)
        * [func (err *HTTPErr) Error() string](#HTTPErr.Error)
        * [func (err *HTTPErr) HTTPStatusCode() int](#HTTPErr.HTTPStatusCode)
    * [type Mock struct](#Mock)
        * [func (e *Mock) Error() string](#Mock.Error)
        * [func (e *Mock) NotFound() bool](#Mock.NotFound)
    * [type nonRetryableError struct](#nonRetryableError)
        * [func (nonRetryableError) NonRetryable() bool](#nonRetryableError.NonRetryable)
    * [type PresentationError interface](#PresentationError)
    * [type presentationError struct](#presentationError)
        * [func (e *presentationError) Error() string](#presentationError.Error)
        * [func (e *presentationError) PresentationError() string](#presentationError.PresentationError)
* [Functions](#func)
    * [func HTTP(err error) int](#HTTP)
    * [func IsHTTPErrorCode(err error, statusCode int) bool](#IsHTTPErrorCode)
    * [func IsNotFound(err error) bool](#IsNotFound)
    * [func IsUnauthorized(err error) bool](#IsUnauthorized)
    * [func IsForbidden(err error) bool](#IsForbidden)
    * [func IsAccountSuspended(err error) bool](#IsAccountSuspended)
    * [func IsBadRequest(err error) bool](#IsBadRequest)
    * [func IsTemporary(err error) bool](#IsTemporary)
    * [func IsTimeout(err error) bool](#IsTimeout)
    * [func IsNonRetryable(err error) bool](#IsNonRetryable)
    * [func MakeNonRetryable(err error) error](#MakeNonRetryable)
    * [func isErrorPredicate(err error, p func(err error) bool) bool](#isErrorPredicate)
    * [func WithPresentationMessage(err error, message string) error](#WithPresentationMessage)
    * [func NewPresentationError(message string) error](#NewPresentationError)
    * [func PresentationMessage(err error) string](#PresentationMessage)
    * [func TestPresentationError(t *testing.T)](#TestPresentationError)


## <a id="type" href="#type">Types</a>

```
tags: [private]
```

### <a id="HTTPErr" href="#HTTPErr">type HTTPErr struct</a>

```
searchKey: errcode.HTTPErr
```

```Go
type HTTPErr struct {
	Status int   // HTTP status code.
	Err    error // Optional reason for the HTTP error.
}
```

#### <a id="HTTPErr.Error" href="#HTTPErr.Error">func (err *HTTPErr) Error() string</a>

```
searchKey: errcode.HTTPErr.Error
```

```Go
func (err *HTTPErr) Error() string
```

#### <a id="HTTPErr.HTTPStatusCode" href="#HTTPErr.HTTPStatusCode">func (err *HTTPErr) HTTPStatusCode() int</a>

```
searchKey: errcode.HTTPErr.HTTPStatusCode
```

```Go
func (err *HTTPErr) HTTPStatusCode() int
```

### <a id="Mock" href="#Mock">type Mock struct</a>

```
searchKey: errcode.Mock
```

```Go
type Mock struct {
	// Message is the return value for Error() string
	Message string

	// IsNotFound is the return value for NotFound
	IsNotFound bool
}
```

Mock is a convenience error which makes it easy to satisfy the optional interfaces errors implement. 

#### <a id="Mock.Error" href="#Mock.Error">func (e *Mock) Error() string</a>

```
searchKey: errcode.Mock.Error
```

```Go
func (e *Mock) Error() string
```

#### <a id="Mock.NotFound" href="#Mock.NotFound">func (e *Mock) NotFound() bool</a>

```
searchKey: errcode.Mock.NotFound
```

```Go
func (e *Mock) NotFound() bool
```

### <a id="nonRetryableError" href="#nonRetryableError">type nonRetryableError struct</a>

```
searchKey: errcode.nonRetryableError
tags: [private]
```

```Go
type nonRetryableError struct{ error }
```

#### <a id="nonRetryableError.NonRetryable" href="#nonRetryableError.NonRetryable">func (nonRetryableError) NonRetryable() bool</a>

```
searchKey: errcode.nonRetryableError.NonRetryable
tags: [private]
```

```Go
func (nonRetryableError) NonRetryable() bool
```

### <a id="PresentationError" href="#PresentationError">type PresentationError interface</a>

```
searchKey: errcode.PresentationError
```

```Go
type PresentationError interface {
	error

	// PresentationError returns the message suitable for presentation to the user. The message
	// should be written in full sentences and must not contain any information that the user is not
	// authorized to see.
	PresentationError() string
}
```

A PresentationError is an error with a message (returned by the PresentationError method) that is suitable for presentation to the user. 

### <a id="presentationError" href="#presentationError">type presentationError struct</a>

```
searchKey: errcode.presentationError
tags: [private]
```

```Go
type presentationError struct {
	cause error
	msg   string
}
```

presentationError implements PresentationError. 

#### <a id="presentationError.Error" href="#presentationError.Error">func (e *presentationError) Error() string</a>

```
searchKey: errcode.presentationError.Error
tags: [private]
```

```Go
func (e *presentationError) Error() string
```

#### <a id="presentationError.PresentationError" href="#presentationError.PresentationError">func (e *presentationError) PresentationError() string</a>

```
searchKey: errcode.presentationError.PresentationError
tags: [private]
```

```Go
func (e *presentationError) PresentationError() string
```

## <a id="func" href="#func">Functions</a>

```
tags: [private]
```

### <a id="HTTP" href="#HTTP">func HTTP(err error) int</a>

```
searchKey: errcode.HTTP
```

```Go
func HTTP(err error) int
```

HTTP returns the most appropriate HTTP status code that describes err. It contains a hard-coded list of error types and error values (such as mapping store.RepoNotFoundError to NotFound) and heuristics (such as mapping os.IsNotExist-satisfying errors to NotFound). All other errors are mapped to HTTP 500 Internal Server Error. 

### <a id="IsHTTPErrorCode" href="#IsHTTPErrorCode">func IsHTTPErrorCode(err error, statusCode int) bool</a>

```
searchKey: errcode.IsHTTPErrorCode
```

```Go
func IsHTTPErrorCode(err error, statusCode int) bool
```

### <a id="IsNotFound" href="#IsNotFound">func IsNotFound(err error) bool</a>

```
searchKey: errcode.IsNotFound
```

```Go
func IsNotFound(err error) bool
```

IsNotFound will check if err or one of its causes is a not found error. Note: This will not check os.IsNotExist, but rather is returned by methods like Repo.Get when the repo is not found. It will also *not* map HTTPStatusCode into not found. 

### <a id="IsUnauthorized" href="#IsUnauthorized">func IsUnauthorized(err error) bool</a>

```
searchKey: errcode.IsUnauthorized
```

```Go
func IsUnauthorized(err error) bool
```

IsUnauthorized will check if err or one of its causes is an unauthorized error. 

### <a id="IsForbidden" href="#IsForbidden">func IsForbidden(err error) bool</a>

```
searchKey: errcode.IsForbidden
```

```Go
func IsForbidden(err error) bool
```

IsForbidden will check if err or one of its causes is a forbidden error. 

### <a id="IsAccountSuspended" href="#IsAccountSuspended">func IsAccountSuspended(err error) bool</a>

```
searchKey: errcode.IsAccountSuspended
```

```Go
func IsAccountSuspended(err error) bool
```

IsAccountSuspended will check if err or one of its causes was due to the account being suspended 

### <a id="IsBadRequest" href="#IsBadRequest">func IsBadRequest(err error) bool</a>

```
searchKey: errcode.IsBadRequest
```

```Go
func IsBadRequest(err error) bool
```

IsBadRequest will check if err or one of its causes is a bad request. 

### <a id="IsTemporary" href="#IsTemporary">func IsTemporary(err error) bool</a>

```
searchKey: errcode.IsTemporary
```

```Go
func IsTemporary(err error) bool
```

IsTemporary will check if err or one of its causes is temporary. A temporary error can be retried. Many errors in the go stdlib implement the temporary interface. 

### <a id="IsTimeout" href="#IsTimeout">func IsTimeout(err error) bool</a>

```
searchKey: errcode.IsTimeout
```

```Go
func IsTimeout(err error) bool
```

IsTimeout will check if err or one of its causes is a timeout. Many errors in the go stdlib implement the timeout interface. 

### <a id="IsNonRetryable" href="#IsNonRetryable">func IsNonRetryable(err error) bool</a>

```
searchKey: errcode.IsNonRetryable
```

```Go
func IsNonRetryable(err error) bool
```

IsNonRetryable will check if err or one of its causes is a error that cannot be retried. 

### <a id="MakeNonRetryable" href="#MakeNonRetryable">func MakeNonRetryable(err error) error</a>

```
searchKey: errcode.MakeNonRetryable
```

```Go
func MakeNonRetryable(err error) error
```

MakeNonRetryable makes any error non-retryable. 

### <a id="isErrorPredicate" href="#isErrorPredicate">func isErrorPredicate(err error, p func(err error) bool) bool</a>

```
searchKey: errcode.isErrorPredicate
tags: [private]
```

```Go
func isErrorPredicate(err error, p func(err error) bool) bool
```

isErrorPredicate returns true if err or one of its causes returns true when passed to p. 

### <a id="WithPresentationMessage" href="#WithPresentationMessage">func WithPresentationMessage(err error, message string) error</a>

```
searchKey: errcode.WithPresentationMessage
```

```Go
func WithPresentationMessage(err error, message string) error
```

WithPresentationMessage annotates err with a new message suitable for presentation to the user. If err is nil, WithPresentationMessage returns nil. Otherwise, the return value implements PresentationError. 

The message should be written in full sentences and must not contain any information that the user is not authorized to see. 

### <a id="NewPresentationError" href="#NewPresentationError">func NewPresentationError(message string) error</a>

```
searchKey: errcode.NewPresentationError
```

```Go
func NewPresentationError(message string) error
```

NewPresentationError returns a new error with a message suitable for presentation to the user. The message should be written in full sentences and must not contain any information that the user is not authorized to see. 

If there is an underlying error associated with this message, use WithPresentationMessage instead. 

### <a id="PresentationMessage" href="#PresentationMessage">func PresentationMessage(err error) string</a>

```
searchKey: errcode.PresentationMessage
```

```Go
func PresentationMessage(err error) string
```

PresentationMessage returns the message, if any, suitable for presentation to the user for err or one of its causes. An error provides a presentation message by implementing the PresentationError interface (e.g., by using WithPresentationMessage). If no presentation message exists for err, the empty string is returned. 

### <a id="TestPresentationError" href="#TestPresentationError">func TestPresentationError(t *testing.T)</a>

```
searchKey: errcode.TestPresentationError
tags: [private]
```

```Go
func TestPresentationError(t *testing.T)
```

