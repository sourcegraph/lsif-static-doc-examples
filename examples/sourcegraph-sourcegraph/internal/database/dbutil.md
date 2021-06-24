# Package dbutil

## Index

* [Types](#type)
    * [type CommitBytea string](#CommitBytea)
        * [func (c *CommitBytea) Scan(value interface{}) error](#CommitBytea.Scan)
        * [func (c CommitBytea) Value() (driver.Value, error)](#CommitBytea.Value)
    * [type DB interface](#DB)
    * [type JSONInt64Set struct](#JSONInt64Set)
        * [func (n *JSONInt64Set) Scan(value interface{}) error](#JSONInt64Set.Scan)
        * [func (n JSONInt64Set) Value() (driver.Value, error)](#JSONInt64Set.Value)
    * [type NullInt struct](#NullInt)
        * [func NewNullInt(i int) NullInt](#NewNullInt)
        * [func (n *NullInt) Scan(value interface{}) error](#NullInt.Scan)
        * [func (n NullInt) Value() (driver.Value, error)](#NullInt.Value)
    * [type NullInt32 struct](#NullInt32)
        * [func (n *NullInt32) Scan(value interface{}) error](#NullInt32.Scan)
        * [func (n NullInt32) Value() (driver.Value, error)](#NullInt32.Value)
    * [type NullInt64 struct](#NullInt64)
        * [func NewNullInt64(i int64) NullInt64](#NewNullInt64)
        * [func (n *NullInt64) Scan(value interface{}) error](#NullInt64.Scan)
        * [func (n NullInt64) Value() (driver.Value, error)](#NullInt64.Value)
    * [type NullJSONRawMessage struct](#NullJSONRawMessage)
        * [func (n *NullJSONRawMessage) Scan(value interface{}) error](#NullJSONRawMessage.Scan)
        * [func (n *NullJSONRawMessage) Value() (driver.Value, error)](#NullJSONRawMessage.Value)
    * [type NullString struct](#NullString)
        * [func NewNullString(s string) NullString](#NewNullString)
        * [func (nt *NullString) Scan(value interface{}) error](#NullString.Scan)
        * [func (nt NullString) Value() (driver.Value, error)](#NullString.Value)
    * [type NullTime struct](#NullTime)
        * [func (nt *NullTime) Scan(value interface{}) error](#NullTime.Scan)
        * [func (nt NullTime) Value() (driver.Value, error)](#NullTime.Value)
    * [type ScanFunc func(github.com/sourcegraph/sourcegraph/internal/database/dbutil.Scanner) (last int64, count int64, err error)](#ScanFunc)
    * [type Scanner interface](#Scanner)
    * [type Tx interface](#Tx)
    * [type TxBeginner interface](#TxBeginner)
* [Functions](#func)
    * [func IsPostgresError(err error, codename string) bool](#IsPostgresError)
    * [func PostgresDSN(prefix, currentUser string, getenv func(string) string) string](#PostgresDSN)
    * [func TestPostgresDSN(t *testing.T)](#TestPostgresDSN)
    * [func Transaction(ctx context.Context, db *sql.DB, f func(tx *sql.Tx) error) (err error)](#Transaction)


## <a id="type" href="#type">Types</a>

```
tags: [package private]
```

### <a id="CommitBytea" href="#CommitBytea">type CommitBytea string</a>

```
searchKey: dbutil.CommitBytea
tags: [string]
```

```Go
type CommitBytea string
```

CommitBytea represents a hex-encoded string that is efficiently encoded in Postgres and should be used in place of a text or varchar type when the table is large (e.g. a record per commit). 

#### <a id="CommitBytea.Scan" href="#CommitBytea.Scan">func (c *CommitBytea) Scan(value interface{}) error</a>

```
searchKey: dbutil.CommitBytea.Scan
tags: [method]
```

```Go
func (c *CommitBytea) Scan(value interface{}) error
```

Scan implements the Scanner interface. 

#### <a id="CommitBytea.Value" href="#CommitBytea.Value">func (c CommitBytea) Value() (driver.Value, error)</a>

```
searchKey: dbutil.CommitBytea.Value
tags: [function]
```

```Go
func (c CommitBytea) Value() (driver.Value, error)
```

Value implements the driver Valuer interface. 

### <a id="DB" href="#DB">type DB interface</a>

```
searchKey: dbutil.DB
tags: [interface]
```

```Go
type DB interface {
	QueryContext(ctx context.Context, q string, args ...interface{}) (*sql.Rows, error)
	ExecContext(ctx context.Context, query string, args ...interface{}) (sql.Result, error)
	QueryRowContext(ctx context.Context, query string, args ...interface{}) *sql.Row
}
```

A DB captures the essential method of a sql.DB: QueryContext. 

### <a id="JSONInt64Set" href="#JSONInt64Set">type JSONInt64Set struct</a>

```
searchKey: dbutil.JSONInt64Set
tags: [struct]
```

```Go
type JSONInt64Set struct{ Set *[]int64 }
```

JSONInt64Set represents an int64 set as a JSONB object where the keys are the ids and the values are null. It implements the sql.Scanner interface so it can be used as a scan destination, similar to sql.NullString. 

#### <a id="JSONInt64Set.Scan" href="#JSONInt64Set.Scan">func (n *JSONInt64Set) Scan(value interface{}) error</a>

```
searchKey: dbutil.JSONInt64Set.Scan
tags: [method]
```

```Go
func (n *JSONInt64Set) Scan(value interface{}) error
```

Scan implements the Scanner interface. 

#### <a id="JSONInt64Set.Value" href="#JSONInt64Set.Value">func (n JSONInt64Set) Value() (driver.Value, error)</a>

```
searchKey: dbutil.JSONInt64Set.Value
tags: [function]
```

```Go
func (n JSONInt64Set) Value() (driver.Value, error)
```

Value implements the driver Valuer interface. 

### <a id="NullInt" href="#NullInt">type NullInt struct</a>

```
searchKey: dbutil.NullInt
tags: [struct]
```

```Go
type NullInt struct{ N *int }
```

NullInt represents an int that may be null. NullInt implements the sql.Scanner interface so it can be used as a scan destination, similar to sql.NullString. When the scanned value is null, int is set to the zero value. 

#### <a id="NewNullInt" href="#NewNullInt">func NewNullInt(i int) NullInt</a>

```
searchKey: dbutil.NewNullInt
tags: [method]
```

```Go
func NewNullInt(i int) NullInt
```

NewNullInt returns a NullInt treating zero value as null. 

#### <a id="NullInt.Scan" href="#NullInt.Scan">func (n *NullInt) Scan(value interface{}) error</a>

```
searchKey: dbutil.NullInt.Scan
tags: [method]
```

```Go
func (n *NullInt) Scan(value interface{}) error
```

Scan implements the Scanner interface. 

#### <a id="NullInt.Value" href="#NullInt.Value">func (n NullInt) Value() (driver.Value, error)</a>

```
searchKey: dbutil.NullInt.Value
tags: [function]
```

```Go
func (n NullInt) Value() (driver.Value, error)
```

Value implements the driver Valuer interface. 

### <a id="NullInt32" href="#NullInt32">type NullInt32 struct</a>

```
searchKey: dbutil.NullInt32
tags: [struct]
```

```Go
type NullInt32 struct{ N *int32 }
```

NullInt32 represents an int32 that may be null. NullInt32 implements the sql.Scanner interface so it can be used as a scan destination, similar to sql.NullString. When the scanned value is null, int32 is set to the zero value. 

#### <a id="NullInt32.Scan" href="#NullInt32.Scan">func (n *NullInt32) Scan(value interface{}) error</a>

```
searchKey: dbutil.NullInt32.Scan
tags: [method]
```

```Go
func (n *NullInt32) Scan(value interface{}) error
```

Scan implements the Scanner interface. 

#### <a id="NullInt32.Value" href="#NullInt32.Value">func (n NullInt32) Value() (driver.Value, error)</a>

```
searchKey: dbutil.NullInt32.Value
tags: [function]
```

```Go
func (n NullInt32) Value() (driver.Value, error)
```

Value implements the driver Valuer interface. 

### <a id="NullInt64" href="#NullInt64">type NullInt64 struct</a>

```
searchKey: dbutil.NullInt64
tags: [struct]
```

```Go
type NullInt64 struct{ N *int64 }
```

NullInt64 represents an int64 that may be null. NullInt64 implements the sql.Scanner interface so it can be used as a scan destination, similar to sql.NullString. When the scanned value is null, int64 is set to the zero value. 

#### <a id="NewNullInt64" href="#NewNullInt64">func NewNullInt64(i int64) NullInt64</a>

```
searchKey: dbutil.NewNullInt64
tags: [method]
```

```Go
func NewNullInt64(i int64) NullInt64
```

NewNullInt64 returns a NullInt64 treating zero value as null. 

#### <a id="NullInt64.Scan" href="#NullInt64.Scan">func (n *NullInt64) Scan(value interface{}) error</a>

```
searchKey: dbutil.NullInt64.Scan
tags: [method]
```

```Go
func (n *NullInt64) Scan(value interface{}) error
```

Scan implements the Scanner interface. 

#### <a id="NullInt64.Value" href="#NullInt64.Value">func (n NullInt64) Value() (driver.Value, error)</a>

```
searchKey: dbutil.NullInt64.Value
tags: [function]
```

```Go
func (n NullInt64) Value() (driver.Value, error)
```

Value implements the driver Valuer interface. 

### <a id="NullJSONRawMessage" href="#NullJSONRawMessage">type NullJSONRawMessage struct</a>

```
searchKey: dbutil.NullJSONRawMessage
tags: [struct]
```

```Go
type NullJSONRawMessage struct {
	Raw json.RawMessage
}
```

NullJSONRawMessage represents a json.RawMessage that may be null. NullJSONRawMessage implements the sql.Scanner interface so it can be used as a scan destination, similar to sql.NullString. When the scanned value is null, Raw is left as nil. 

#### <a id="NullJSONRawMessage.Scan" href="#NullJSONRawMessage.Scan">func (n *NullJSONRawMessage) Scan(value interface{}) error</a>

```
searchKey: dbutil.NullJSONRawMessage.Scan
tags: [method]
```

```Go
func (n *NullJSONRawMessage) Scan(value interface{}) error
```

Scan implements the Scanner interface. 

#### <a id="NullJSONRawMessage.Value" href="#NullJSONRawMessage.Value">func (n *NullJSONRawMessage) Value() (driver.Value, error)</a>

```
searchKey: dbutil.NullJSONRawMessage.Value
tags: [function]
```

```Go
func (n *NullJSONRawMessage) Value() (driver.Value, error)
```

Value implements the driver Valuer interface. 

### <a id="NullString" href="#NullString">type NullString struct</a>

```
searchKey: dbutil.NullString
tags: [struct]
```

```Go
type NullString struct{ S *string }
```

NullString represents a string that may be null. NullString implements the sql.Scanner interface so it can be used as a scan destination, similar to sql.NullString. When the scanned value is null, String is set to the zero value. 

#### <a id="NewNullString" href="#NewNullString">func NewNullString(s string) NullString</a>

```
searchKey: dbutil.NewNullString
tags: [method]
```

```Go
func NewNullString(s string) NullString
```

NewNullString returns a NullString treating zero value as null. 

#### <a id="NullString.Scan" href="#NullString.Scan">func (nt *NullString) Scan(value interface{}) error</a>

```
searchKey: dbutil.NullString.Scan
tags: [method]
```

```Go
func (nt *NullString) Scan(value interface{}) error
```

Scan implements the Scanner interface. 

#### <a id="NullString.Value" href="#NullString.Value">func (nt NullString) Value() (driver.Value, error)</a>

```
searchKey: dbutil.NullString.Value
tags: [function]
```

```Go
func (nt NullString) Value() (driver.Value, error)
```

Value implements the driver Valuer interface. 

### <a id="NullTime" href="#NullTime">type NullTime struct</a>

```
searchKey: dbutil.NullTime
tags: [struct]
```

```Go
type NullTime struct{ *time.Time }
```

NullTime represents a time.Time that may be null. nullTime implements the sql.Scanner interface so it can be used as a scan destination, similar to sql.NullString. When the scanned value is null, Time is set to the zero value. 

#### <a id="NullTime.Scan" href="#NullTime.Scan">func (nt *NullTime) Scan(value interface{}) error</a>

```
searchKey: dbutil.NullTime.Scan
tags: [method]
```

```Go
func (nt *NullTime) Scan(value interface{}) error
```

Scan implements the Scanner interface. 

#### <a id="NullTime.Value" href="#NullTime.Value">func (nt NullTime) Value() (driver.Value, error)</a>

```
searchKey: dbutil.NullTime.Value
tags: [function]
```

```Go
func (nt NullTime) Value() (driver.Value, error)
```

Value implements the driver Valuer interface. 

### <a id="ScanFunc" href="#ScanFunc">type ScanFunc func(github.com/sourcegraph/sourcegraph/internal/database/dbutil.Scanner) (last int64, count int64, err error)</a>

```
searchKey: dbutil.ScanFunc
tags: [function]
```

```Go
type ScanFunc func(Scanner) (last, count int64, err error)
```

A ScanFunc scans one or more rows from a scanner, returning the last id column scanned and the count of scanned rows. 

### <a id="Scanner" href="#Scanner">type Scanner interface</a>

```
searchKey: dbutil.Scanner
tags: [interface]
```

```Go
type Scanner interface {
	Scan(dst ...interface{}) error
}
```

Scanner captures the Scan method of sql.Rows and sql.Row 

### <a id="Tx" href="#Tx">type Tx interface</a>

```
searchKey: dbutil.Tx
tags: [interface]
```

```Go
type Tx interface {
	Rollback() error
	Commit() error
}
```

A Tx captures the essential methods of a sql.Tx. 

### <a id="TxBeginner" href="#TxBeginner">type TxBeginner interface</a>

```
searchKey: dbutil.TxBeginner
tags: [interface]
```

```Go
type TxBeginner interface {
	BeginTx(context.Context, *sql.TxOptions) (*sql.Tx, error)
}
```

A TxBeginner captures BeginTx method of a sql.DB 

## <a id="func" href="#func">Functions</a>

```
tags: [package private]
```

### <a id="IsPostgresError" href="#IsPostgresError">func IsPostgresError(err error, codename string) bool</a>

```
searchKey: dbutil.IsPostgresError
tags: [method]
```

```Go
func IsPostgresError(err error, codename string) bool
```

### <a id="PostgresDSN" href="#PostgresDSN">func PostgresDSN(prefix, currentUser string, getenv func(string) string) string</a>

```
searchKey: dbutil.PostgresDSN
tags: [method]
```

```Go
func PostgresDSN(prefix, currentUser string, getenv func(string) string) string
```

### <a id="TestPostgresDSN" href="#TestPostgresDSN">func TestPostgresDSN(t *testing.T)</a>

```
searchKey: dbutil.TestPostgresDSN
tags: [method private test]
```

```Go
func TestPostgresDSN(t *testing.T)
```

### <a id="Transaction" href="#Transaction">func Transaction(ctx context.Context, db *sql.DB, f func(tx *sql.Tx) error) (err error)</a>

```
searchKey: dbutil.Transaction
tags: [method]
```

```Go
func Transaction(ctx context.Context, db *sql.DB, f func(tx *sql.Tx) error) (err error)
```

Transaction calls f within a transaction, rolling back if any error is returned by the function. 

