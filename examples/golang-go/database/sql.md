# Package sql

Package sql provides a generic interface around SQL (or SQL-like) databases. 

The sql package must be used in conjunction with a database driver. See [https://golang.org/s/sqldrivers](https://golang.org/s/sqldrivers) for a list of drivers. 

Drivers that do not support context cancellation will not return until after the query is completed. 

For usage examples, see the wiki page at [https://golang.org/s/sqlwiki](https://golang.org/s/sqlwiki). 

## Index

* Subpages
  * [database/sql/driver](sql/driver.md)
* [Constants](#const)
    * [const LevelDefault](#LevelDefault)
    * [const LevelLinearizable](#LevelLinearizable)
    * [const LevelReadCommitted](#LevelReadCommitted)
    * [const LevelReadUncommitted](#LevelReadUncommitted)
    * [const LevelRepeatableRead](#LevelRepeatableRead)
    * [const LevelSerializable](#LevelSerializable)
    * [const LevelSnapshot](#LevelSnapshot)
    * [const LevelWriteCommitted](#LevelWriteCommitted)
    * [const alwaysNewConn](#alwaysNewConn)
    * [const cachedOrNewConn](#cachedOrNewConn)
    * [const debugGetPut](#debugGetPut)
    * [const defaultMaxIdleConns](#defaultMaxIdleConns)
    * [const fakeDBName](#fakeDBName)
    * [const maxBadConnRetries](#maxBadConnRetries)
* [Variables](#var)
    * [var ErrConnDone](#ErrConnDone)
    * [var ErrNoRows](#ErrNoRows)
    * [var ErrTxDone](#ErrTxDone)
    * [var answer](#answer)
    * [var atomicRowsCloseHook](#atomicRowsCloseHook)
    * [var bypassRowsAwaitDone](#bypassRowsAwaitDone)
    * [var chrisBirthday](#chrisBirthday)
    * [var connectionRequestQueueSize](#connectionRequestQueueSize)
    * [var drivers](#drivers)
    * [var driversMu](#driversMu)
    * [var errClosed](#errClosed)
    * [var errDBClosed](#errDBClosed)
    * [var errFakeConnSessionDirty](#errFakeConnSessionDirty)
    * [var errNilPtr](#errNilPtr)
    * [var errNoRows](#errNoRows)
    * [var errRowsClosed](#errRowsClosed)
    * [var errTestScanWrap](#errTestScanWrap)
    * [var fdriver](#fdriver)
    * [var hookCommitBadConn](#hookCommitBadConn)
    * [var hookExecBadConn](#hookExecBadConn)
    * [var hookOpenErr](#hookOpenErr)
    * [var hookPostCloseConn](#hookPostCloseConn)
    * [var hookPrepareBadConn](#hookPrepareBadConn)
    * [var hookQueryBadConn](#hookQueryBadConn)
    * [var hookRollbackBadConn](#hookRollbackBadConn)
    * [var hookTxGrabConn](#hookTxGrabConn)
    * [var nowFunc](#nowFunc)
    * [var pingError](#pingError)
    * [var putConnHook](#putConnHook)
    * [var rollbackHook](#rollbackHook)
    * [var rowsCloseHook](#rowsCloseHook)
    * [var rowsCursorNextHook](#rowsCursorNextHook)
    * [var scanbool](#scanbool)
    * [var scanbytes](#scanbytes)
    * [var scanf32](#scanf32)
    * [var scanf64](#scanf64)
    * [var scaniface](#scaniface)
    * [var scanint](#scanint)
    * [var scanint16](#scanint16)
    * [var scanint32](#scanint32)
    * [var scanint8](#scanint8)
    * [var scanptr](#scanptr)
    * [var scanraw](#scanraw)
    * [var scanstr](#scanstr)
    * [var scantime](#scantime)
    * [var scanuint16](#scanuint16)
    * [var scanuint8](#scanuint8)
    * [var someTime](#someTime)
    * [var testStrictClose](#testStrictClose)
    * [var valueConverterTests](#valueConverterTests)
    * [var valuerReflectType](#valuerReflectType)
* [Types](#type)
    * [type ColumnType struct](#ColumnType)
        * [func (ci *ColumnType) DatabaseTypeName() string](#ColumnType.DatabaseTypeName)
        * [func (ci *ColumnType) DecimalSize() (precision, scale int64, ok bool)](#ColumnType.DecimalSize)
        * [func (ci *ColumnType) Length() (length int64, ok bool)](#ColumnType.Length)
        * [func (ci *ColumnType) Name() string](#ColumnType.Name)
        * [func (ci *ColumnType) Nullable() (nullable, ok bool)](#ColumnType.Nullable)
        * [func (ci *ColumnType) ScanType() reflect.Type](#ColumnType.ScanType)
    * [type Conn struct](#Conn)
        * [func (c *Conn) BeginTx(ctx context.Context, opts *TxOptions) (*Tx, error)](#Conn.BeginTx)
        * [func (c *Conn) Close() error](#Conn.Close)
        * [func (c *Conn) ExecContext(ctx context.Context, query string, args ...interface{}) (Result, error)](#Conn.ExecContext)
        * [func (c *Conn) PingContext(ctx context.Context) error](#Conn.PingContext)
        * [func (c *Conn) PrepareContext(ctx context.Context, query string) (*Stmt, error)](#Conn.PrepareContext)
        * [func (c *Conn) QueryContext(ctx context.Context, query string, args ...interface{}) (*Rows, error)](#Conn.QueryContext)
        * [func (c *Conn) QueryRowContext(ctx context.Context, query string, args ...interface{}) *Row](#Conn.QueryRowContext)
        * [func (c *Conn) Raw(f func(driverConn interface{}) error) (err error)](#Conn.Raw)
        * [func (c *Conn) close(err error) error](#Conn.close)
        * [func (c *Conn) closemuRUnlockCondReleaseConn(err error)](#Conn.closemuRUnlockCondReleaseConn)
        * [func (c *Conn) grabConn(context.Context) (*driverConn, releaseConn, error)](#Conn.grabConn)
        * [func (c *Conn) txCtx() context.Context](#Conn.txCtx)
    * [type DB struct](#DB)
        * [func Open(driverName, dataSourceName string) (*DB, error)](#Open)
        * [func OpenDB(c driver.Connector) *DB](#OpenDB)
        * [func newTestDB(t testing.TB, name string) *DB](#newTestDB)
        * [func newTestDBConnector(t testing.TB, fc *fakeConnector, name string) *DB](#newTestDBConnector)
        * [func (db *DB) Begin() (*Tx, error)](#DB.Begin)
        * [func (db *DB) BeginTx(ctx context.Context, opts *TxOptions) (*Tx, error)](#DB.BeginTx)
        * [func (db *DB) Close() error](#DB.Close)
        * [func (db *DB) Conn(ctx context.Context) (*Conn, error)](#DB.Conn)
        * [func (db *DB) Driver() driver.Driver](#DB.Driver)
        * [func (db *DB) Exec(query string, args ...interface{}) (Result, error)](#DB.Exec)
        * [func (db *DB) ExecContext(ctx context.Context, query string, args ...interface{}) (Result, error)](#DB.ExecContext)
        * [func (db *DB) Ping() error](#DB.Ping)
        * [func (db *DB) PingContext(ctx context.Context) error](#DB.PingContext)
        * [func (db *DB) Prepare(query string) (*Stmt, error)](#DB.Prepare)
        * [func (db *DB) PrepareContext(ctx context.Context, query string) (*Stmt, error)](#DB.PrepareContext)
        * [func (db *DB) Query(query string, args ...interface{}) (*Rows, error)](#DB.Query)
        * [func (db *DB) QueryContext(ctx context.Context, query string, args ...interface{}) (*Rows, error)](#DB.QueryContext)
        * [func (db *DB) QueryRow(query string, args ...interface{}) *Row](#DB.QueryRow)
        * [func (db *DB) QueryRowContext(ctx context.Context, query string, args ...interface{}) *Row](#DB.QueryRowContext)
        * [func (db *DB) SetConnMaxIdleTime(d time.Duration)](#DB.SetConnMaxIdleTime)
        * [func (db *DB) SetConnMaxLifetime(d time.Duration)](#DB.SetConnMaxLifetime)
        * [func (db *DB) SetMaxIdleConns(n int)](#DB.SetMaxIdleConns)
        * [func (db *DB) SetMaxOpenConns(n int)](#DB.SetMaxOpenConns)
        * [func (db *DB) Stats() DBStats](#DB.Stats)
        * [func (db *DB) addDep(x finalCloser, dep interface{})](#DB.addDep)
        * [func (db *DB) addDepLocked(x finalCloser, dep interface{})](#DB.addDepLocked)
        * [func (db *DB) begin(ctx context.Context, opts *TxOptions, strategy connReuseStrategy) (tx *Tx, err error)](#DB.begin)
        * [func (db *DB) beginDC(ctx context.Context, dc *driverConn, release func(error), opts *TxOptions) (tx *Tx, err error)](#DB.beginDC)
        * [func (db *DB) clearAllConns(t *testing.T)](#DB.clearAllConns)
        * [func (db *DB) conn(ctx context.Context, strategy connReuseStrategy) (*driverConn, error)](#DB.conn)
        * [func (db *DB) connectionCleaner(d time.Duration)](#DB.connectionCleaner)
        * [func (db *DB) connectionCleanerRunLocked() (closing []*driverConn)](#DB.connectionCleanerRunLocked)
        * [func (db *DB) connectionOpener(ctx context.Context)](#DB.connectionOpener)
        * [func (db *DB) dumpDep(t *testing.T, depth int, dep finalCloser, seen map[finalCloser]bool)](#DB.dumpDep)
        * [func (db *DB) dumpDeps(t *testing.T)](#DB.dumpDeps)
        * [func (db *DB) exec(ctx context.Context, query string, args []interface{}, strategy connReuseStrategy) (Result, error)](#DB.exec)
        * [func (db *DB) execDC(ctx context.Context, dc *driverConn, release func(error), query string, args []interface{}) (res Result, err error)](#DB.execDC)
        * [func (db *DB) maxIdleConnsLocked() int](#DB.maxIdleConnsLocked)
        * [func (db *DB) maybeOpenNewConnections()](#DB.maybeOpenNewConnections)
        * [func (db *DB) nextRequestKeyLocked() uint64](#DB.nextRequestKeyLocked)
        * [func (db *DB) noteUnusedDriverStatement(c *driverConn, ds *driverStmt)](#DB.noteUnusedDriverStatement)
        * [func (db *DB) numDeps() int](#DB.numDeps)
        * [func (db *DB) numDepsPollUntil(want int, d time.Duration) int](#DB.numDepsPollUntil)
        * [func (db *DB) numFreeConns() int](#DB.numFreeConns)
        * [func (db *DB) numOpenConns() int](#DB.numOpenConns)
        * [func (db *DB) openNewConnection(ctx context.Context)](#DB.openNewConnection)
        * [func (db *DB) pingDC(ctx context.Context, dc *driverConn, release func(error)) error](#DB.pingDC)
        * [func (db *DB) prepare(ctx context.Context, query string, strategy connReuseStrategy) (*Stmt, error)](#DB.prepare)
        * [func (db *DB) prepareDC(ctx context.Context, dc *driverConn, release func(error), cg stmtConnGrabber, query string) (*Stmt, error)](#DB.prepareDC)
        * [func (db *DB) putConn(dc *driverConn, err error, resetSession bool)](#DB.putConn)
        * [func (db *DB) putConnDBLocked(dc *driverConn, err error) bool](#DB.putConnDBLocked)
        * [func (db *DB) query(ctx context.Context, query string, args []interface{}, strategy connReuseStrategy) (*Rows, error)](#DB.query)
        * [func (db *DB) queryDC(ctx, txctx context.Context, dc *driverConn, releaseConn func(error), query string, args []interface{}) (*Rows, error)](#DB.queryDC)
        * [func (db *DB) removeDep(x finalCloser, dep interface{}) error](#DB.removeDep)
        * [func (db *DB) removeDepLocked(x finalCloser, dep interface{}) func() error](#DB.removeDepLocked)
        * [func (db *DB) shortestIdleTimeLocked() time.Duration](#DB.shortestIdleTimeLocked)
        * [func (db *DB) startCleanerLocked()](#DB.startCleanerLocked)
    * [type DBStats struct](#DBStats)
    * [type Dummy struct](#Dummy)
    * [type IsolationLevel int](#IsolationLevel)
        * [func (i IsolationLevel) String() string](#IsolationLevel.String)
    * [type NamedArg struct](#NamedArg)
        * [func Named(name string, value interface{}) NamedArg](#Named)
    * [type NullBool struct](#NullBool)
        * [func (n *NullBool) Scan(value interface{}) error](#NullBool.Scan)
        * [func (n NullBool) Value() (driver.Value, error)](#NullBool.Value)
    * [type NullByte struct](#NullByte)
        * [func (n *NullByte) Scan(value interface{}) error](#NullByte.Scan)
        * [func (n NullByte) Value() (driver.Value, error)](#NullByte.Value)
    * [type NullFloat64 struct](#NullFloat64)
        * [func (n *NullFloat64) Scan(value interface{}) error](#NullFloat64.Scan)
        * [func (n NullFloat64) Value() (driver.Value, error)](#NullFloat64.Value)
    * [type NullInt16 struct](#NullInt16)
        * [func (n *NullInt16) Scan(value interface{}) error](#NullInt16.Scan)
        * [func (n NullInt16) Value() (driver.Value, error)](#NullInt16.Value)
    * [type NullInt32 struct](#NullInt32)
        * [func (n *NullInt32) Scan(value interface{}) error](#NullInt32.Scan)
        * [func (n NullInt32) Value() (driver.Value, error)](#NullInt32.Value)
    * [type NullInt64 struct](#NullInt64)
        * [func (n *NullInt64) Scan(value interface{}) error](#NullInt64.Scan)
        * [func (n NullInt64) Value() (driver.Value, error)](#NullInt64.Value)
    * [type NullString struct](#NullString)
        * [func (ns *NullString) Scan(value interface{}) error](#NullString.Scan)
        * [func (ns NullString) Value() (driver.Value, error)](#NullString.Value)
    * [type NullTime struct](#NullTime)
        * [func (n *NullTime) Scan(value interface{}) error](#NullTime.Scan)
        * [func (n NullTime) Value() (driver.Value, error)](#NullTime.Value)
    * [type Out struct](#Out)
    * [type RawBytes []byte](#RawBytes)
    * [type Result interface](#Result)
        * [func resultFromStatement(ctx context.Context, ci driver.Conn, ds *driverStmt, args ...interface{}) (Result, error)](#resultFromStatement)
    * [type Row struct](#Row)
        * [func (r *Row) Err() error](#Row.Err)
        * [func (r *Row) Scan(dest ...interface{}) error](#Row.Scan)
    * [type Rows struct](#Rows)
        * [func (rs *Rows) Close() error](#Rows.Close)
        * [func (rs *Rows) ColumnTypes() ([]*ColumnType, error)](#Rows.ColumnTypes)
        * [func (rs *Rows) Columns() ([]string, error)](#Rows.Columns)
        * [func (rs *Rows) Err() error](#Rows.Err)
        * [func (rs *Rows) Next() bool](#Rows.Next)
        * [func (rs *Rows) NextResultSet() bool](#Rows.NextResultSet)
        * [func (rs *Rows) Scan(dest ...interface{}) error](#Rows.Scan)
        * [func (rs *Rows) awaitDone(ctx, txctx context.Context)](#Rows.awaitDone)
        * [func (rs *Rows) close(err error) error](#Rows.close)
        * [func (rs *Rows) initContextClose(ctx, txctx context.Context)](#Rows.initContextClose)
        * [func (rs *Rows) lasterrOrErrLocked(err error) error](#Rows.lasterrOrErrLocked)
        * [func (rs *Rows) nextLocked() (doClose, ok bool)](#Rows.nextLocked)
    * [type Scanner interface](#Scanner)
    * [type Stmt struct](#Stmt)
        * [func (s *Stmt) Close() error](#Stmt.Close)
        * [func (s *Stmt) Exec(args ...interface{}) (Result, error)](#Stmt.Exec)
        * [func (s *Stmt) ExecContext(ctx context.Context, args ...interface{}) (Result, error)](#Stmt.ExecContext)
        * [func (s *Stmt) Query(args ...interface{}) (*Rows, error)](#Stmt.Query)
        * [func (s *Stmt) QueryContext(ctx context.Context, args ...interface{}) (*Rows, error)](#Stmt.QueryContext)
        * [func (s *Stmt) QueryRow(args ...interface{}) *Row](#Stmt.QueryRow)
        * [func (s *Stmt) QueryRowContext(ctx context.Context, args ...interface{}) *Row](#Stmt.QueryRowContext)
        * [func (s *Stmt) connStmt(ctx context.Context, strategy connReuseStrategy) (dc *driverConn, releaseConn func(error), ds *driverStmt, err error)](#Stmt.connStmt)
        * [func (s *Stmt) finalClose() error](#Stmt.finalClose)
        * [func (s *Stmt) prepareOnConnLocked(ctx context.Context, dc *driverConn) (*driverStmt, error)](#Stmt.prepareOnConnLocked)
        * [func (s *Stmt) removeClosedStmtLocked()](#Stmt.removeClosedStmtLocked)
    * [type Tx struct](#Tx)
        * [func (tx *Tx) Commit() error](#Tx.Commit)
        * [func (tx *Tx) Exec(query string, args ...interface{}) (Result, error)](#Tx.Exec)
        * [func (tx *Tx) ExecContext(ctx context.Context, query string, args ...interface{}) (Result, error)](#Tx.ExecContext)
        * [func (tx *Tx) Prepare(query string) (*Stmt, error)](#Tx.Prepare)
        * [func (tx *Tx) PrepareContext(ctx context.Context, query string) (*Stmt, error)](#Tx.PrepareContext)
        * [func (tx *Tx) Query(query string, args ...interface{}) (*Rows, error)](#Tx.Query)
        * [func (tx *Tx) QueryContext(ctx context.Context, query string, args ...interface{}) (*Rows, error)](#Tx.QueryContext)
        * [func (tx *Tx) QueryRow(query string, args ...interface{}) *Row](#Tx.QueryRow)
        * [func (tx *Tx) QueryRowContext(ctx context.Context, query string, args ...interface{}) *Row](#Tx.QueryRowContext)
        * [func (tx *Tx) Rollback() error](#Tx.Rollback)
        * [func (tx *Tx) Stmt(stmt *Stmt) *Stmt](#Tx.Stmt)
        * [func (tx *Tx) StmtContext(ctx context.Context, stmt *Stmt) *Stmt](#Tx.StmtContext)
        * [func (tx *Tx) awaitDone()](#Tx.awaitDone)
        * [func (tx *Tx) close(err error)](#Tx.close)
        * [func (tx *Tx) closePrepared()](#Tx.closePrepared)
        * [func (tx *Tx) closemuRUnlockRelease(error)](#Tx.closemuRUnlockRelease)
        * [func (tx *Tx) grabConn(ctx context.Context) (*driverConn, releaseConn, error)](#Tx.grabConn)
        * [func (tx *Tx) isDone() bool](#Tx.isDone)
        * [func (tx *Tx) rollback(discardConn bool) error](#Tx.rollback)
        * [func (tx *Tx) txCtx() context.Context](#Tx.txCtx)
    * [type TxOptions struct](#TxOptions)
    * [type Valuer_P string](#Valuer_P)
        * [func (p *Valuer_P) Value() (driver.Value, error)](#Valuer_P.Value)
    * [type Valuer_V string](#Valuer_V)
        * [func (v Valuer_V) Value() (driver.Value, error)](#Valuer_V.Value)
    * [type alwaysErrScanner struct{}](#alwaysErrScanner)
        * [func (alwaysErrScanner) Scan(interface{}) error](#alwaysErrScanner.Scan)
    * [type anyTypeConverter struct{}](#anyTypeConverter)
        * [func (anyTypeConverter) ConvertValue(v interface{}) (driver.Value, error)](#anyTypeConverter.ConvertValue)
    * [type badConn struct{}](#badConn)
        * [func (bc badConn) Begin() (driver.Tx, error)](#badConn.Begin)
        * [func (bc badConn) Close() error](#badConn.Close)
        * [func (bc badConn) Exec(query string, args []driver.Value) (driver.Result, error)](#badConn.Exec)
        * [func (bc badConn) Prepare(query string) (driver.Stmt, error)](#badConn.Prepare)
    * [type badDriver struct{}](#badDriver)
        * [func (bd badDriver) Open(name string) (driver.Conn, error)](#badDriver.Open)
    * [type boundCol struct](#boundCol)
    * [type ccChecker struct](#ccChecker)
        * [func (c ccChecker) CheckNamedValue(nv *driver.NamedValue) error](#ccChecker.CheckNamedValue)
    * [type concurrentDBExecTest struct](#concurrentDBExecTest)
        * [func (c *concurrentDBExecTest) finish(t testing.TB)](#concurrentDBExecTest.finish)
        * [func (c *concurrentDBExecTest) init(t testing.TB, db *DB)](#concurrentDBExecTest.init.sql_test.go.0xc039566370)
        * [func (c *concurrentDBExecTest) test(t testing.TB) error](#concurrentDBExecTest.test)
    * [type concurrentDBQueryTest struct](#concurrentDBQueryTest)
        * [func (c *concurrentDBQueryTest) finish(t testing.TB)](#concurrentDBQueryTest.finish)
        * [func (c *concurrentDBQueryTest) init(t testing.TB, db *DB)](#concurrentDBQueryTest.init.sql_test.go.0xc039566370)
        * [func (c *concurrentDBQueryTest) test(t testing.TB) error](#concurrentDBQueryTest.test)
    * [type concurrentRandomTest struct](#concurrentRandomTest)
        * [func (c *concurrentRandomTest) finish(t testing.TB)](#concurrentRandomTest.finish)
        * [func (c *concurrentRandomTest) init(t testing.TB, db *DB)](#concurrentRandomTest.init.sql_test.go.0xc039566370)
        * [func (c *concurrentRandomTest) test(t testing.TB) error](#concurrentRandomTest.test)
    * [type concurrentStmtExecTest struct](#concurrentStmtExecTest)
        * [func (c *concurrentStmtExecTest) finish(t testing.TB)](#concurrentStmtExecTest.finish)
        * [func (c *concurrentStmtExecTest) init(t testing.TB, db *DB)](#concurrentStmtExecTest.init.sql_test.go.0xc039566370)
        * [func (c *concurrentStmtExecTest) test(t testing.TB) error](#concurrentStmtExecTest.test)
    * [type concurrentStmtQueryTest struct](#concurrentStmtQueryTest)
        * [func (c *concurrentStmtQueryTest) finish(t testing.TB)](#concurrentStmtQueryTest.finish)
        * [func (c *concurrentStmtQueryTest) init(t testing.TB, db *DB)](#concurrentStmtQueryTest.init.sql_test.go.0xc039566370)
        * [func (c *concurrentStmtQueryTest) test(t testing.TB) error](#concurrentStmtQueryTest.test)
    * [type concurrentTest interface](#concurrentTest)
    * [type concurrentTxExecTest struct](#concurrentTxExecTest)
        * [func (c *concurrentTxExecTest) finish(t testing.TB)](#concurrentTxExecTest.finish)
        * [func (c *concurrentTxExecTest) init(t testing.TB, db *DB)](#concurrentTxExecTest.init.sql_test.go.0xc039566370)
        * [func (c *concurrentTxExecTest) test(t testing.TB) error](#concurrentTxExecTest.test)
    * [type concurrentTxQueryTest struct](#concurrentTxQueryTest)
        * [func (c *concurrentTxQueryTest) finish(t testing.TB)](#concurrentTxQueryTest.finish)
        * [func (c *concurrentTxQueryTest) init(t testing.TB, db *DB)](#concurrentTxQueryTest.init.sql_test.go.0xc039566370)
        * [func (c *concurrentTxQueryTest) test(t testing.TB) error](#concurrentTxQueryTest.test)
    * [type concurrentTxStmtExecTest struct](#concurrentTxStmtExecTest)
        * [func (c *concurrentTxStmtExecTest) finish(t testing.TB)](#concurrentTxStmtExecTest.finish)
        * [func (c *concurrentTxStmtExecTest) init(t testing.TB, db *DB)](#concurrentTxStmtExecTest.init.sql_test.go.0xc039566370)
        * [func (c *concurrentTxStmtExecTest) test(t testing.TB) error](#concurrentTxStmtExecTest.test)
    * [type concurrentTxStmtQueryTest struct](#concurrentTxStmtQueryTest)
        * [func (c *concurrentTxStmtQueryTest) finish(t testing.TB)](#concurrentTxStmtQueryTest.finish)
        * [func (c *concurrentTxStmtQueryTest) init(t testing.TB, db *DB)](#concurrentTxStmtQueryTest.init.sql_test.go.0xc039566370)
        * [func (c *concurrentTxStmtQueryTest) test(t testing.TB) error](#concurrentTxStmtQueryTest.test)
    * [type connRequest struct](#connRequest)
    * [type connReuseStrategy uint8](#connReuseStrategy)
    * [type connStmt struct](#connStmt)
    * [type conversionTest struct](#conversionTest)
    * [type ctxOnlyConn struct](#ctxOnlyConn)
        * [func (c *ctxOnlyConn) Begin() (driver.Tx, error)](#ctxOnlyConn.Begin)
        * [func (c *ctxOnlyConn) Close() error](#ctxOnlyConn.Close)
        * [func (c *ctxOnlyConn) ExecContext(ctx context.Context, q string, args []driver.NamedValue) (driver.Result, error)](#ctxOnlyConn.ExecContext)
        * [func (c *ctxOnlyConn) Prepare(q string) (driver.Stmt, error)](#ctxOnlyConn.Prepare)
        * [func (c *ctxOnlyConn) PrepareContext(ctx context.Context, q string) (driver.Stmt, error)](#ctxOnlyConn.PrepareContext)
        * [func (c *ctxOnlyConn) QueryContext(ctx context.Context, q string, args []driver.NamedValue) (driver.Rows, error)](#ctxOnlyConn.QueryContext)
    * [type ctxOnlyDriver struct](#ctxOnlyDriver)
        * [func (d *ctxOnlyDriver) Open(dsn string) (driver.Conn, error)](#ctxOnlyDriver.Open)
    * [type dec struct](#dec)
        * [func (d *dec) Compose(form byte, negative bool, coefficient []byte, exponent int32) error](#dec.Compose)
        * [func (d dec) Decompose(buf []byte) (form byte, negative bool, coefficient []byte, exponent int32)](#dec.Decompose)
    * [type decFinite struct](#decFinite)
        * [func (d *decFinite) Compose(form byte, negative bool, coefficient []byte, exponent int32) error](#decFinite.Compose)
        * [func (d decFinite) Decompose(buf []byte) (form byte, negative bool, coefficient []byte, exponent int32)](#decFinite.Decompose)
    * [type decimal interface](#decimal)
    * [type decimalCompose interface](#decimalCompose)
    * [type decimalDecompose interface](#decimalDecompose)
    * [type decimalInt struct](#decimalInt)
    * [type depSet map[interface{}]bool](#depSet)
    * [type doNotInclude struct{}](#doNotInclude)
    * [type driverConn struct](#driverConn)
        * [func (dc *driverConn) Close() error](#driverConn.Close)
        * [func (dc *driverConn) closeDBLocked() func() error](#driverConn.closeDBLocked)
        * [func (dc *driverConn) expired(timeout time.Duration) bool](#driverConn.expired)
        * [func (dc *driverConn) finalClose() error](#driverConn.finalClose)
        * [func (dc *driverConn) prepareLocked(ctx context.Context, cg stmtConnGrabber, query string) (*driverStmt, error)](#driverConn.prepareLocked)
        * [func (dc *driverConn) releaseConn(err error)](#driverConn.releaseConn)
        * [func (dc *driverConn) removeOpenStmt(ds *driverStmt)](#driverConn.removeOpenStmt)
        * [func (dc *driverConn) resetSession(ctx context.Context) error](#driverConn.resetSession)
        * [func (dc *driverConn) validateConnection(needsReset bool) bool](#driverConn.validateConnection)
    * [type driverResult struct](#driverResult)
        * [func (dr driverResult) LastInsertId() (int64, error)](#driverResult.LastInsertId)
        * [func (dr driverResult) RowsAffected() (int64, error)](#driverResult.RowsAffected)
    * [type driverStmt struct](#driverStmt)
        * [func (ds *driverStmt) Close() error](#driverStmt.Close)
    * [type dsnConnector struct](#dsnConnector)
        * [func (t dsnConnector) Connect(_ context.Context) (driver.Conn, error)](#dsnConnector.Connect)
        * [func (t dsnConnector) Driver() driver.Driver](#dsnConnector.Driver)
    * [type fakeConn struct](#fakeConn)
        * [func (c *fakeConn) Begin() (driver.Tx, error)](#fakeConn.Begin)
        * [func (c *fakeConn) Close() (err error)](#fakeConn.Close)
        * [func (c *fakeConn) Exec(query string, args []driver.Value) (driver.Result, error)](#fakeConn.Exec)
        * [func (c *fakeConn) ExecContext(ctx context.Context, query string, args []driver.NamedValue) (driver.Result, error)](#fakeConn.ExecContext)
        * [func (c *fakeConn) IsValid() bool](#fakeConn.IsValid)
        * [func (c *fakeConn) Prepare(query string) (driver.Stmt, error)](#fakeConn.Prepare)
        * [func (c *fakeConn) PrepareContext(ctx context.Context, query string) (driver.Stmt, error)](#fakeConn.PrepareContext)
        * [func (c *fakeConn) Query(query string, args []driver.Value) (driver.Rows, error)](#fakeConn.Query)
        * [func (c *fakeConn) QueryContext(ctx context.Context, query string, args []driver.NamedValue) (driver.Rows, error)](#fakeConn.QueryContext)
        * [func (c *fakeConn) ResetSession(ctx context.Context) error](#fakeConn.ResetSession)
        * [func (c *fakeConn) incrStat(v *int)](#fakeConn.incrStat)
        * [func (c *fakeConn) isBad() bool](#fakeConn.isBad)
        * [func (c *fakeConn) isDirtyAndMark() bool](#fakeConn.isDirtyAndMark)
        * [func (c *fakeConn) prepareCreate(stmt *fakeStmt, parts []string) (*fakeStmt, error)](#fakeConn.prepareCreate)
        * [func (c *fakeConn) prepareInsert(ctx context.Context, stmt *fakeStmt, parts []string) (*fakeStmt, error)](#fakeConn.prepareInsert)
        * [func (c *fakeConn) prepareSelect(stmt *fakeStmt, parts []string) (*fakeStmt, error)](#fakeConn.prepareSelect)
        * [func (c *fakeConn) touchMem()](#fakeConn.touchMem)
    * [type fakeConnector struct](#fakeConnector)
        * [func (c *fakeConnector) Close() error](#fakeConnector.Close)
        * [func (c *fakeConnector) Connect(context.Context) (driver.Conn, error)](#fakeConnector.Connect)
        * [func (c *fakeConnector) Driver() driver.Driver](#fakeConnector.Driver)
    * [type fakeDB struct](#fakeDB)
        * [func (db *fakeDB) columnType(table, column string) (typ string, ok bool)](#fakeDB.columnType)
        * [func (db *fakeDB) createTable(name string, columnNames, columnTypes []string) error](#fakeDB.createTable)
        * [func (db *fakeDB) table(table string) (*table, bool)](#fakeDB.table)
        * [func (db *fakeDB) wipe()](#fakeDB.wipe)
    * [type fakeDriver struct](#fakeDriver)
        * [func (d *fakeDriver) Open(dsn string) (driver.Conn, error)](#fakeDriver.Open)
        * [func (d *fakeDriver) getDB(name string) *fakeDB](#fakeDriver.getDB)
    * [type fakeDriverCtx struct](#fakeDriverCtx)
        * [func (cc *fakeDriverCtx) OpenConnector(name string) (driver.Connector, error)](#fakeDriverCtx.OpenConnector)
    * [type fakeDriverString struct{}](#fakeDriverString)
        * [func (fakeDriverString) ConvertValue(v interface{}) (driver.Value, error)](#fakeDriverString.ConvertValue)
    * [type fakeStmt struct](#fakeStmt)
        * [func (s *fakeStmt) Close() error](#fakeStmt.Close)
        * [func (s *fakeStmt) ColumnConverter(idx int) driver.ValueConverter](#fakeStmt.ColumnConverter)
        * [func (s *fakeStmt) Exec(args []driver.Value) (driver.Result, error)](#fakeStmt.Exec)
        * [func (s *fakeStmt) ExecContext(ctx context.Context, args []driver.NamedValue) (driver.Result, error)](#fakeStmt.ExecContext)
        * [func (s *fakeStmt) NumInput() int](#fakeStmt.NumInput)
        * [func (s *fakeStmt) Query(args []driver.Value) (driver.Rows, error)](#fakeStmt.Query)
        * [func (s *fakeStmt) QueryContext(ctx context.Context, args []driver.NamedValue) (driver.Rows, error)](#fakeStmt.QueryContext)
        * [func (s *fakeStmt) execInsert(args []driver.NamedValue, doInsert bool) (driver.Result, error)](#fakeStmt.execInsert)
    * [type fakeTx struct](#fakeTx)
        * [func (tx *fakeTx) Commit() error](#fakeTx.Commit)
        * [func (tx *fakeTx) Rollback() error](#fakeTx.Rollback)
    * [type finalCloser interface](#finalCloser)
    * [type memToucher interface](#memToucher)
    * [type nullTestRow struct](#nullTestRow)
    * [type nullTestSpec struct](#nullTestSpec)
    * [type nvcConn struct](#nvcConn)
        * [func (c *nvcConn) CheckNamedValue(nv *driver.NamedValue) error](#nvcConn.CheckNamedValue)
    * [type nvcDriver struct](#nvcDriver)
        * [func (d *nvcDriver) Open(dsn string) (driver.Conn, error)](#nvcDriver.Open)
    * [type pingConn struct](#pingConn)
        * [func (pc pingConn) Ping(ctx context.Context) error](#pingConn.Ping)
    * [type pingDriver struct](#pingDriver)
        * [func (pd *pingDriver) Open(name string) (driver.Conn, error)](#pingDriver.Open)
    * [type releaseConn func(error)](#releaseConn)
    * [type row struct](#row)
    * [type rowsCursor struct](#rowsCursor)
        * [func (rc *rowsCursor) Close() error](#rowsCursor.Close)
        * [func (rc *rowsCursor) ColumnTypeScanType(index int) reflect.Type](#rowsCursor.ColumnTypeScanType)
        * [func (rc *rowsCursor) Columns() []string](#rowsCursor.Columns)
        * [func (rc *rowsCursor) HasNextResultSet() bool](#rowsCursor.HasNextResultSet)
        * [func (rc *rowsCursor) Next(dest []driver.Value) error](#rowsCursor.Next)
        * [func (rc *rowsCursor) NextResultSet() error](#rowsCursor.NextResultSet)
        * [func (rc *rowsCursor) touchMem()](#rowsCursor.touchMem)
    * [type stmtConnGrabber interface](#stmtConnGrabber)
    * [type stubDriverStmt struct](#stubDriverStmt)
        * [func (s stubDriverStmt) Close() error](#stubDriverStmt.Close)
        * [func (s stubDriverStmt) Exec(args []driver.Value) (driver.Result, error)](#stubDriverStmt.Exec)
        * [func (s stubDriverStmt) NumInput() int](#stubDriverStmt.NumInput)
        * [func (s stubDriverStmt) Query(args []driver.Value) (driver.Rows, error)](#stubDriverStmt.Query)
    * [type table struct](#table)
        * [func (t *table) columnIndex(name string) int](#table.columnIndex)
    * [type userDefined float64](#userDefined)
    * [type userDefinedSlice []int](#userDefinedSlice)
    * [type userDefinedString string](#userDefinedString)
    * [type valueConverterTest struct](#valueConverterTest)
* [Functions](#func)
    * [func BenchmarkConcurrentDBExec(b *testing.B)](#BenchmarkConcurrentDBExec)
    * [func BenchmarkConcurrentRandom(b *testing.B)](#BenchmarkConcurrentRandom)
    * [func BenchmarkConcurrentStmtExec(b *testing.B)](#BenchmarkConcurrentStmtExec)
    * [func BenchmarkConcurrentStmtQuery(b *testing.B)](#BenchmarkConcurrentStmtQuery)
    * [func BenchmarkConcurrentTxExec(b *testing.B)](#BenchmarkConcurrentTxExec)
    * [func BenchmarkConcurrentTxQuery(b *testing.B)](#BenchmarkConcurrentTxQuery)
    * [func BenchmarkConcurrentTxStmtExec(b *testing.B)](#BenchmarkConcurrentTxStmtExec)
    * [func BenchmarkConcurrentTxStmtQuery(b *testing.B)](#BenchmarkConcurrentTxStmtQuery)
    * [func BenchmarkManyConcurrentQueries(b *testing.B)](#BenchmarkManyConcurrentQueries)
    * [func Drivers() []string](#Drivers)
    * [func Register(name string, driver driver.Driver)](#Register)
    * [func TestBadDriver(t *testing.T)](#TestBadDriver)
    * [func TestBogusPreboundParameters(t *testing.T)](#TestBogusPreboundParameters)
    * [func TestCloseConnBeforeStmts(t *testing.T)](#TestCloseConnBeforeStmts)
    * [func TestCloseStmtBeforeRows(t *testing.T)](#TestCloseStmtBeforeRows)
    * [func TestConcurrency(t *testing.T)](#TestConcurrency)
    * [func TestConnExpiresFreshOutOfPool(t *testing.T)](#TestConnExpiresFreshOutOfPool)
    * [func TestConnIsValid(t *testing.T)](#TestConnIsValid)
    * [func TestConnMaxLifetime(t *testing.T)](#TestConnMaxLifetime)
    * [func TestConnQuery(t *testing.T)](#TestConnQuery)
    * [func TestConnRaw(t *testing.T)](#TestConnRaw)
    * [func TestConnTx(t *testing.T)](#TestConnTx)
    * [func TestConnectionLeak(t *testing.T)](#TestConnectionLeak)
    * [func TestConversions(t *testing.T)](#TestConversions)
    * [func TestCursorFake(t *testing.T)](#TestCursorFake)
    * [func TestDecimal(t *testing.T)](#TestDecimal)
    * [func TestDriverArgs(t *testing.T)](#TestDriverArgs)
    * [func TestDriverPanic(t *testing.T)](#TestDriverPanic)
    * [func TestDrivers(t *testing.T)](#TestDrivers)
    * [func TestErrBadConnReconnect(t *testing.T)](#TestErrBadConnReconnect)
    * [func TestExec(t *testing.T)](#TestExec)
    * [func TestInvalidNilValues(t *testing.T)](#TestInvalidNilValues)
    * [func TestIssue18429(t *testing.T)](#TestIssue18429)
    * [func TestIssue18719(t *testing.T)](#TestIssue18719)
    * [func TestIssue20160(t *testing.T)](#TestIssue20160)
    * [func TestIssue20575(t *testing.T)](#TestIssue20575)
    * [func TestIssue20622(t *testing.T)](#TestIssue20622)
    * [func TestIssue20647(t *testing.T)](#TestIssue20647)
    * [func TestIssue2542Deadlock(t *testing.T)](#TestIssue2542Deadlock)
    * [func TestIssue4902(t *testing.T)](#TestIssue4902)
    * [func TestIssue6081(t *testing.T)](#TestIssue6081)
    * [func TestIssue6651(t *testing.T)](#TestIssue6651)
    * [func TestManyErrBadConn(t *testing.T)](#TestManyErrBadConn)
    * [func TestMaxIdleConns(t *testing.T)](#TestMaxIdleConns)
    * [func TestMaxIdleTime(t *testing.T)](#TestMaxIdleTime)
    * [func TestMaxOpenConns(t *testing.T)](#TestMaxOpenConns)
    * [func TestMaxOpenConnsOnBusy(t *testing.T)](#TestMaxOpenConnsOnBusy)
    * [func TestMultiResultSetQuery(t *testing.T)](#TestMultiResultSetQuery)
    * [func TestNamedValueChecker(t *testing.T)](#TestNamedValueChecker)
    * [func TestNamedValueCheckerSkip(t *testing.T)](#TestNamedValueCheckerSkip)
    * [func TestNullBoolParam(t *testing.T)](#TestNullBoolParam)
    * [func TestNullByteParam(t *testing.T)](#TestNullByteParam)
    * [func TestNullByteSlice(t *testing.T)](#TestNullByteSlice)
    * [func TestNullFloat64Param(t *testing.T)](#TestNullFloat64Param)
    * [func TestNullInt16Param(t *testing.T)](#TestNullInt16Param)
    * [func TestNullInt32Param(t *testing.T)](#TestNullInt32Param)
    * [func TestNullInt64Param(t *testing.T)](#TestNullInt64Param)
    * [func TestNullString(t *testing.T)](#TestNullString)
    * [func TestNullStringParam(t *testing.T)](#TestNullStringParam)
    * [func TestNullTimeParam(t *testing.T)](#TestNullTimeParam)
    * [func TestOpenConnector(t *testing.T)](#TestOpenConnector)
    * [func TestOpenDB(t *testing.T)](#TestOpenDB)
    * [func TestParentStmtOutlivesTxStmt(t *testing.T)](#TestParentStmtOutlivesTxStmt)
    * [func TestPendingConnsAfterErr(t *testing.T)](#TestPendingConnsAfterErr)
    * [func TestPing(t *testing.T)](#TestPing)
    * [func TestPointerParamsAndScans(t *testing.T)](#TestPointerParamsAndScans)
    * [func TestPoolExhaustOnCancel(t *testing.T)](#TestPoolExhaustOnCancel)
    * [func TestQuery(t *testing.T)](#TestQuery)
    * [func TestQueryContext(t *testing.T)](#TestQueryContext)
    * [func TestQueryContextWait(t *testing.T)](#TestQueryContextWait)
    * [func TestQueryExecContextOnly(t *testing.T)](#TestQueryExecContextOnly)
    * [func TestQueryNamedArg(t *testing.T)](#TestQueryNamedArg)
    * [func TestQueryRow(t *testing.T)](#TestQueryRow)
    * [func TestQueryRowClosingStmt(t *testing.T)](#TestQueryRowClosingStmt)
    * [func TestQueryRowNilScanDest(t *testing.T)](#TestQueryRowNilScanDest)
    * [func TestRawBytesAllocs(t *testing.T)](#TestRawBytesAllocs)
    * [func TestRowErr(t *testing.T)](#TestRowErr)
    * [func TestRowsCloseOrder(t *testing.T)](#TestRowsCloseOrder)
    * [func TestRowsColumnTypes(t *testing.T)](#TestRowsColumnTypes)
    * [func TestRowsColumns(t *testing.T)](#TestRowsColumns)
    * [func TestRowsImplicitClose(t *testing.T)](#TestRowsImplicitClose)
    * [func TestRowsScanProperlyWrapsErrors(t *testing.T)](#TestRowsScanProperlyWrapsErrors)
    * [func TestSimultaneousQueries(t *testing.T)](#TestSimultaneousQueries)
    * [func TestSingleOpenConn(t *testing.T)](#TestSingleOpenConn)
    * [func TestStatementClose(t *testing.T)](#TestStatementClose)
    * [func TestStatementErrorAfterClose(t *testing.T)](#TestStatementErrorAfterClose)
    * [func TestStatementQueryRow(t *testing.T)](#TestStatementQueryRow)
    * [func TestStatementQueryRowConcurrent(t *testing.T)](#TestStatementQueryRowConcurrent)
    * [func TestStats(t *testing.T)](#TestStats)
    * [func TestStatsMaxIdleClosedTen(t *testing.T)](#TestStatsMaxIdleClosedTen)
    * [func TestStatsMaxIdleClosedZero(t *testing.T)](#TestStatsMaxIdleClosedZero)
    * [func TestStmtCloseDeps(t *testing.T)](#TestStmtCloseDeps)
    * [func TestStmtCloseOrder(t *testing.T)](#TestStmtCloseOrder)
    * [func TestTxCannotCommitAfterRollback(t *testing.T)](#TestTxCannotCommitAfterRollback)
    * [func TestTxContextWait(t *testing.T)](#TestTxContextWait)
    * [func TestTxContextWaitNoDiscard(t *testing.T)](#TestTxContextWaitNoDiscard)
    * [func TestTxEndBadConn(t *testing.T)](#TestTxEndBadConn)
    * [func TestTxErrBadConn(t *testing.T)](#TestTxErrBadConn)
    * [func TestTxPrepare(t *testing.T)](#TestTxPrepare)
    * [func TestTxQuery(t *testing.T)](#TestTxQuery)
    * [func TestTxQueryInvalid(t *testing.T)](#TestTxQueryInvalid)
    * [func TestTxRollbackCommitErr(t *testing.T)](#TestTxRollbackCommitErr)
    * [func TestTxStmt(t *testing.T)](#TestTxStmt)
    * [func TestTxStmtClosedRePrepares(t *testing.T)](#TestTxStmtClosedRePrepares)
    * [func TestTxStmtDeadlock(t *testing.T)](#TestTxStmtDeadlock)
    * [func TestTxStmtFromTxStmtRePrepares(t *testing.T)](#TestTxStmtFromTxStmtRePrepares)
    * [func TestTxStmtPreparedOnce(t *testing.T)](#TestTxStmtPreparedOnce)
    * [func TestTypedString(t *testing.T)](#TestTypedString)
    * [func TestUnsupportedOptions(t *testing.T)](#TestUnsupportedOptions)
    * [func TestUserDefinedBytes(t *testing.T)](#TestUserDefinedBytes)
    * [func TestValueConverters(t *testing.T)](#TestValueConverters)
    * [func asBytes(buf []byte, rv reflect.Value) (b []byte, ok bool)](#asBytes)
    * [func asString(src interface{}) string](#asString)
    * [func callValuerValue(vr driver.Valuer) (v driver.Value, err error)](#callValuerValue)
    * [func checkSubsetTypes(allowAny bool, args []driver.NamedValue) error](#checkSubsetTypes)
    * [func cloneBytes(b []byte) []byte](#cloneBytes)
    * [func closeDB(t testing.TB, db *DB)](#closeDB)
    * [func colTypeToReflectType(typ string) reflect.Type](#colTypeToReflectType)
    * [func contains(list []string, y string) bool](#contains)
    * [func conversionTests() []conversionTest](#conversionTests)
    * [func convertAssign(dest, src interface{}) error](#convertAssign)
    * [func convertAssignRows(dest, src interface{}, rows *Rows) error](#convertAssignRows)
    * [func converterForType(typ string) driver.ValueConverter](#converterForType)
    * [func ctxDriverBegin(ctx context.Context, opts *TxOptions, ci driver.Conn) (driver.Tx, error)](#ctxDriverBegin)
    * [func ctxDriverExec(ctx context.Context, execerCtx driver.ExecerContext, execer driver.Execer, query string, nvdargs []driver.NamedValue) (driver.Result, error)](#ctxDriverExec)
    * [func ctxDriverPrepare(ctx context.Context, ci driver.Conn, query string) (driver.Stmt, error)](#ctxDriverPrepare)
    * [func ctxDriverQuery(ctx context.Context, queryerCtx driver.QueryerContext, queryer driver.Queryer, query string, nvdargs []driver.NamedValue) (driver.Rows, error)](#ctxDriverQuery)
    * [func ctxDriverStmtExec(ctx context.Context, si driver.Stmt, nvdargs []driver.NamedValue) (driver.Result, error)](#ctxDriverStmtExec)
    * [func ctxDriverStmtQuery(ctx context.Context, si driver.Stmt, nvdargs []driver.NamedValue) (driver.Rows, error)](#ctxDriverStmtQuery)
    * [func defaultCheckNamedValue(nv *driver.NamedValue) (err error)](#defaultCheckNamedValue)
    * [func describeNamedValue(nv *driver.NamedValue) string](#describeNamedValue)
    * [func doConcurrentTest(t testing.TB, ct concurrentTest)](#doConcurrentTest)
    * [func driverArgsConnLocked(ci driver.Conn, ds *driverStmt, args []interface{}) ([]driver.NamedValue, error)](#driverArgsConnLocked)
    * [func errf(msg string, args ...interface{}) error](#errf)
    * [func exec(t testing.TB, db *DB, query string, args ...interface{})](#exec)
    * [func float32Value(ptr interface{}) float32](#float32Value)
    * [func float64Value(ptr interface{}) float64](#float64Value)
    * [func init()](#init.fakedb_test.go)
    * [func init()](#init.sql_test.go)
    * [func init()](#init.sql_test.go.0xc039566370)
    * [func intPtrValue(intptr interface{}) interface{}](#intPtrValue)
    * [func intValue(intptr interface{}) int64](#intValue)
    * [func namedValueToValue(named []driver.NamedValue) ([]driver.Value, error)](#namedValueToValue)
    * [func nullTestRun(t *testing.T, spec nullTestSpec)](#nullTestRun)
    * [func numPrepares(t *testing.T, db *DB) int](#numPrepares)
    * [func rowsColumnInfoSetupConnLocked(rowsi driver.Rows) []*ColumnType](#rowsColumnInfoSetupConnLocked)
    * [func rowsiFromStatement(ctx context.Context, ci driver.Conn, ds *driverStmt, args ...interface{}) (driver.Rows, error)](#rowsiFromStatement)
    * [func setHookOpenErr(fn func() error)](#setHookOpenErr)
    * [func setHookpostCloseConn(fn func(*fakeConn, error))](#setHookpostCloseConn)
    * [func setRowsCloseHook(fn func(*Rows, *error))](#setRowsCloseHook)
    * [func setStrictFakeConnClose(t *testing.T)](#setStrictFakeConnClose)
    * [func stack() string](#stack)
    * [func strconvErr(err error) error](#strconvErr)
    * [func timeValue(ptr interface{}) time.Time](#timeValue)
    * [func uintValue(intptr interface{}) uint64](#uintValue)
    * [func unregisterAllDrivers()](#unregisterAllDrivers)
    * [func validateNamedValueName(name string) error](#validateNamedValueName)
    * [func waitCondition(waitFor, checkEvery time.Duration, fn func() bool) bool](#waitCondition)
    * [func waitForFree(t *testing.T, db *DB, maxWait time.Duration, want int)](#waitForFree)
    * [func waitForRowsClose(t *testing.T, rows *Rows, maxWait time.Duration)](#waitForRowsClose)
    * [func withLock(lk sync.Locker, fn func())](#withLock)


## <a id="const" href="#const">Constants</a>

### <a id="LevelDefault" href="#LevelDefault">const LevelDefault</a>

```
searchKey: sql.LevelDefault
tags: [constant number]
```

```Go
const LevelDefault IsolationLevel = iota
```

Various isolation levels that drivers may support in BeginTx. If a driver does not support a given isolation level an error may be returned. 

See [https://en.wikipedia.org/wiki/Isolation_(database_systems)#Isolation_levels](https://en.wikipedia.org/wiki/Isolation_(database_systems)#Isolation_levels). 

### <a id="LevelLinearizable" href="#LevelLinearizable">const LevelLinearizable</a>

```
searchKey: sql.LevelLinearizable
tags: [constant number]
```

```Go
const LevelLinearizable
```

Various isolation levels that drivers may support in BeginTx. If a driver does not support a given isolation level an error may be returned. 

See [https://en.wikipedia.org/wiki/Isolation_(database_systems)#Isolation_levels](https://en.wikipedia.org/wiki/Isolation_(database_systems)#Isolation_levels). 

### <a id="LevelReadCommitted" href="#LevelReadCommitted">const LevelReadCommitted</a>

```
searchKey: sql.LevelReadCommitted
tags: [constant number]
```

```Go
const LevelReadCommitted
```

Various isolation levels that drivers may support in BeginTx. If a driver does not support a given isolation level an error may be returned. 

See [https://en.wikipedia.org/wiki/Isolation_(database_systems)#Isolation_levels](https://en.wikipedia.org/wiki/Isolation_(database_systems)#Isolation_levels). 

### <a id="LevelReadUncommitted" href="#LevelReadUncommitted">const LevelReadUncommitted</a>

```
searchKey: sql.LevelReadUncommitted
tags: [constant number]
```

```Go
const LevelReadUncommitted
```

Various isolation levels that drivers may support in BeginTx. If a driver does not support a given isolation level an error may be returned. 

See [https://en.wikipedia.org/wiki/Isolation_(database_systems)#Isolation_levels](https://en.wikipedia.org/wiki/Isolation_(database_systems)#Isolation_levels). 

### <a id="LevelRepeatableRead" href="#LevelRepeatableRead">const LevelRepeatableRead</a>

```
searchKey: sql.LevelRepeatableRead
tags: [constant number]
```

```Go
const LevelRepeatableRead
```

Various isolation levels that drivers may support in BeginTx. If a driver does not support a given isolation level an error may be returned. 

See [https://en.wikipedia.org/wiki/Isolation_(database_systems)#Isolation_levels](https://en.wikipedia.org/wiki/Isolation_(database_systems)#Isolation_levels). 

### <a id="LevelSerializable" href="#LevelSerializable">const LevelSerializable</a>

```
searchKey: sql.LevelSerializable
tags: [constant number]
```

```Go
const LevelSerializable
```

Various isolation levels that drivers may support in BeginTx. If a driver does not support a given isolation level an error may be returned. 

See [https://en.wikipedia.org/wiki/Isolation_(database_systems)#Isolation_levels](https://en.wikipedia.org/wiki/Isolation_(database_systems)#Isolation_levels). 

### <a id="LevelSnapshot" href="#LevelSnapshot">const LevelSnapshot</a>

```
searchKey: sql.LevelSnapshot
tags: [constant number]
```

```Go
const LevelSnapshot
```

Various isolation levels that drivers may support in BeginTx. If a driver does not support a given isolation level an error may be returned. 

See [https://en.wikipedia.org/wiki/Isolation_(database_systems)#Isolation_levels](https://en.wikipedia.org/wiki/Isolation_(database_systems)#Isolation_levels). 

### <a id="LevelWriteCommitted" href="#LevelWriteCommitted">const LevelWriteCommitted</a>

```
searchKey: sql.LevelWriteCommitted
tags: [constant number]
```

```Go
const LevelWriteCommitted
```

Various isolation levels that drivers may support in BeginTx. If a driver does not support a given isolation level an error may be returned. 

See [https://en.wikipedia.org/wiki/Isolation_(database_systems)#Isolation_levels](https://en.wikipedia.org/wiki/Isolation_(database_systems)#Isolation_levels). 

### <a id="alwaysNewConn" href="#alwaysNewConn">const alwaysNewConn</a>

```
searchKey: sql.alwaysNewConn
tags: [constant number private]
```

```Go
const alwaysNewConn connReuseStrategy = iota
```

alwaysNewConn forces a new connection to the database. 

### <a id="cachedOrNewConn" href="#cachedOrNewConn">const cachedOrNewConn</a>

```
searchKey: sql.cachedOrNewConn
tags: [constant number private]
```

```Go
const cachedOrNewConn
```

cachedOrNewConn returns a cached connection, if available, else waits for one to become available (if MaxOpenConns has been reached) or creates a new database connection. 

### <a id="debugGetPut" href="#debugGetPut">const debugGetPut</a>

```
searchKey: sql.debugGetPut
tags: [constant boolean private]
```

```Go
const debugGetPut = false
```

debugGetPut determines whether getConn & putConn calls' stack traces are returned for more verbose crashes. 

### <a id="defaultMaxIdleConns" href="#defaultMaxIdleConns">const defaultMaxIdleConns</a>

```
searchKey: sql.defaultMaxIdleConns
tags: [constant number private]
```

```Go
const defaultMaxIdleConns = 2
```

### <a id="fakeDBName" href="#fakeDBName">const fakeDBName</a>

```
searchKey: sql.fakeDBName
tags: [constant string private]
```

```Go
const fakeDBName = "foo"
```

### <a id="maxBadConnRetries" href="#maxBadConnRetries">const maxBadConnRetries</a>

```
searchKey: sql.maxBadConnRetries
tags: [constant number private]
```

```Go
const maxBadConnRetries = 2
```

maxBadConnRetries is the number of maximum retries if the driver returns driver.ErrBadConn to signal a broken connection before forcing a new connection to be opened. 

## <a id="var" href="#var">Variables</a>

### <a id="ErrConnDone" href="#ErrConnDone">var ErrConnDone</a>

```
searchKey: sql.ErrConnDone
tags: [variable interface]
```

```Go
var ErrConnDone = errors.New("sql: connection is already closed")
```

ErrConnDone is returned by any operation that is performed on a connection that has already been returned to the connection pool. 

### <a id="ErrNoRows" href="#ErrNoRows">var ErrNoRows</a>

```
searchKey: sql.ErrNoRows
tags: [variable interface]
```

```Go
var ErrNoRows = errors.New("sql: no rows in result set")
```

ErrNoRows is returned by Scan when QueryRow doesn't return a row. In such a case, QueryRow returns a placeholder *Row value that defers this error until a Scan. 

### <a id="ErrTxDone" href="#ErrTxDone">var ErrTxDone</a>

```
searchKey: sql.ErrTxDone
tags: [variable interface]
```

```Go
var ErrTxDone = errors.New("sql: transaction has already been committed or rolled back")
```

ErrTxDone is returned by any operation that is performed on a transaction that has already been committed or rolled back. 

### <a id="answer" href="#answer">var answer</a>

```
searchKey: sql.answer
tags: [variable number private]
```

```Go
var answer int64 = 42
```

### <a id="atomicRowsCloseHook" href="#atomicRowsCloseHook">var atomicRowsCloseHook</a>

```
searchKey: sql.atomicRowsCloseHook
tags: [variable struct private]
```

```Go
var atomicRowsCloseHook atomic.Value // of func(*Rows, *error)

```

### <a id="bypassRowsAwaitDone" href="#bypassRowsAwaitDone">var bypassRowsAwaitDone</a>

```
searchKey: sql.bypassRowsAwaitDone
tags: [variable boolean private]
```

```Go
var bypassRowsAwaitDone = false
```

bypassRowsAwaitDone is only used for testing. If true, it will not close the Rows automatically from the context. 

### <a id="chrisBirthday" href="#chrisBirthday">var chrisBirthday</a>

```
searchKey: sql.chrisBirthday
tags: [variable struct private]
```

```Go
var chrisBirthday = time.Unix(123456789, 0)
```

### <a id="connectionRequestQueueSize" href="#connectionRequestQueueSize">var connectionRequestQueueSize</a>

```
searchKey: sql.connectionRequestQueueSize
tags: [variable number private]
```

```Go
var connectionRequestQueueSize = 1000000
```

This is the size of the connectionOpener request chan (DB.openerCh). This value should be larger than the maximum typical value used for db.maxOpen. If maxOpen is significantly larger than connectionRequestQueueSize then it is possible for ALL calls into the *DB to block until the connectionOpener can satisfy the backlog of requests. 

### <a id="drivers" href="#drivers">var drivers</a>

```
searchKey: sql.drivers
tags: [variable object private]
```

```Go
var drivers = make(map[string]driver.Driver)
```

### <a id="driversMu" href="#driversMu">var driversMu</a>

```
searchKey: sql.driversMu
tags: [variable struct private]
```

```Go
var driversMu sync.RWMutex
```

### <a id="errClosed" href="#errClosed">var errClosed</a>

```
searchKey: sql.errClosed
tags: [variable interface private]
```

```Go
var errClosed = errors.New("fakedb: statement has been closed")
```

### <a id="errDBClosed" href="#errDBClosed">var errDBClosed</a>

```
searchKey: sql.errDBClosed
tags: [variable interface private]
```

```Go
var errDBClosed = errors.New("sql: database is closed")
```

### <a id="errFakeConnSessionDirty" href="#errFakeConnSessionDirty">var errFakeConnSessionDirty</a>

```
searchKey: sql.errFakeConnSessionDirty
tags: [variable interface private]
```

```Go
var errFakeConnSessionDirty = errors.New("fakedb: session is dirty")
```

### <a id="errNilPtr" href="#errNilPtr">var errNilPtr</a>

```
searchKey: sql.errNilPtr
tags: [variable interface private]
```

```Go
var errNilPtr = errors.New("destination pointer is nil") // embedded in descriptive error

```

### <a id="errNoRows" href="#errNoRows">var errNoRows</a>

```
searchKey: sql.errNoRows
tags: [variable interface private]
```

```Go
var errNoRows = errors.New("sql: no Rows available")
```

### <a id="errRowsClosed" href="#errRowsClosed">var errRowsClosed</a>

```
searchKey: sql.errRowsClosed
tags: [variable interface private]
```

```Go
var errRowsClosed = errors.New("sql: Rows are closed")
```

### <a id="errTestScanWrap" href="#errTestScanWrap">var errTestScanWrap</a>

```
searchKey: sql.errTestScanWrap
tags: [variable interface private]
```

```Go
var errTestScanWrap = errors.New("errTestScanWrap")
```

### <a id="fdriver" href="#fdriver">var fdriver</a>

```
searchKey: sql.fdriver
tags: [variable interface private]
```

```Go
var fdriver driver.Driver = &fakeDriver{}
```

### <a id="hookCommitBadConn" href="#hookCommitBadConn">var hookCommitBadConn</a>

```
searchKey: sql.hookCommitBadConn
tags: [variable function private]
```

```Go
var hookCommitBadConn func() bool
```

hook to simulate broken connections 

### <a id="hookExecBadConn" href="#hookExecBadConn">var hookExecBadConn</a>

```
searchKey: sql.hookExecBadConn
tags: [variable function private]
```

```Go
var hookExecBadConn func() bool
```

hook to simulate broken connections 

### <a id="hookOpenErr" href="#hookOpenErr">var hookOpenErr</a>

```
searchKey: sql.hookOpenErr
tags: [variable struct private]
```

```Go
var hookOpenErr struct {
	sync.Mutex
	fn func() error
}
```

hook to simulate connection failures 

### <a id="hookPostCloseConn" href="#hookPostCloseConn">var hookPostCloseConn</a>

```
searchKey: sql.hookPostCloseConn
tags: [variable struct private]
```

```Go
var hookPostCloseConn struct {
	sync.Mutex
	fn func(*fakeConn, error)
}
```

### <a id="hookPrepareBadConn" href="#hookPrepareBadConn">var hookPrepareBadConn</a>

```
searchKey: sql.hookPrepareBadConn
tags: [variable function private]
```

```Go
var hookPrepareBadConn func() bool
```

hook to simulate broken connections 

### <a id="hookQueryBadConn" href="#hookQueryBadConn">var hookQueryBadConn</a>

```
searchKey: sql.hookQueryBadConn
tags: [variable function private]
```

```Go
var hookQueryBadConn func() bool
```

hook to simulate broken connections 

### <a id="hookRollbackBadConn" href="#hookRollbackBadConn">var hookRollbackBadConn</a>

```
searchKey: sql.hookRollbackBadConn
tags: [variable function private]
```

```Go
var hookRollbackBadConn func() bool
```

hook to simulate broken connections 

### <a id="hookTxGrabConn" href="#hookTxGrabConn">var hookTxGrabConn</a>

```
searchKey: sql.hookTxGrabConn
tags: [variable function private]
```

```Go
var hookTxGrabConn func()
```

hookTxGrabConn specifies an optional hook to be called on a successful call to (*Tx).grabConn. For tests. 

### <a id="nowFunc" href="#nowFunc">var nowFunc</a>

```
searchKey: sql.nowFunc
tags: [variable function private]
```

```Go
var nowFunc = time.Now
```

nowFunc returns the current time; it's overridden in tests. 

### <a id="pingError" href="#pingError">var pingError</a>

```
searchKey: sql.pingError
tags: [variable interface private]
```

```Go
var pingError = errors.New("Ping failed")
```

### <a id="putConnHook" href="#putConnHook">var putConnHook</a>

```
searchKey: sql.putConnHook
tags: [variable function private]
```

```Go
var putConnHook func(*DB, *driverConn)
```

putConnHook is a hook for testing. 

### <a id="rollbackHook" href="#rollbackHook">var rollbackHook</a>

```
searchKey: sql.rollbackHook
tags: [variable function private]
```

```Go
var rollbackHook func()
```

### <a id="rowsCloseHook" href="#rowsCloseHook">var rowsCloseHook</a>

```
searchKey: sql.rowsCloseHook
tags: [variable function private]
```

```Go
var rowsCloseHook = func() func(*Rows, *error) { return nil }
```

rowsCloseHook returns a function so tests may install the hook through a test only mutex. 

### <a id="rowsCursorNextHook" href="#rowsCursorNextHook">var rowsCursorNextHook</a>

```
searchKey: sql.rowsCursorNextHook
tags: [variable function private]
```

```Go
var rowsCursorNextHook func(dest []driver.Value) error
```

### <a id="scanbool" href="#scanbool">var scanbool</a>

```
searchKey: sql.scanbool
tags: [variable boolean private]
```

```Go
var scanbool bool
```

Target variables for scanning into. 

### <a id="scanbytes" href="#scanbytes">var scanbytes</a>

```
searchKey: sql.scanbytes
tags: [variable array number private]
```

```Go
var scanbytes []byte
```

Target variables for scanning into. 

### <a id="scanf32" href="#scanf32">var scanf32</a>

```
searchKey: sql.scanf32
tags: [variable number private]
```

```Go
var scanf32 float32
```

Target variables for scanning into. 

### <a id="scanf64" href="#scanf64">var scanf64</a>

```
searchKey: sql.scanf64
tags: [variable number private]
```

```Go
var scanf64 float64
```

Target variables for scanning into. 

### <a id="scaniface" href="#scaniface">var scaniface</a>

```
searchKey: sql.scaniface
tags: [variable interface private]
```

```Go
var scaniface interface{}
```

Target variables for scanning into. 

### <a id="scanint" href="#scanint">var scanint</a>

```
searchKey: sql.scanint
tags: [variable number private]
```

```Go
var scanint int
```

Target variables for scanning into. 

### <a id="scanint16" href="#scanint16">var scanint16</a>

```
searchKey: sql.scanint16
tags: [variable number private]
```

```Go
var scanint16 int16
```

Target variables for scanning into. 

### <a id="scanint32" href="#scanint32">var scanint32</a>

```
searchKey: sql.scanint32
tags: [variable number private]
```

```Go
var scanint32 int32
```

Target variables for scanning into. 

### <a id="scanint8" href="#scanint8">var scanint8</a>

```
searchKey: sql.scanint8
tags: [variable number private]
```

```Go
var scanint8 int8
```

Target variables for scanning into. 

### <a id="scanptr" href="#scanptr">var scanptr</a>

```
searchKey: sql.scanptr
tags: [variable number private]
```

```Go
var scanptr *int64
```

Target variables for scanning into. 

### <a id="scanraw" href="#scanraw">var scanraw</a>

```
searchKey: sql.scanraw
tags: [variable array number private]
```

```Go
var scanraw RawBytes
```

Target variables for scanning into. 

### <a id="scanstr" href="#scanstr">var scanstr</a>

```
searchKey: sql.scanstr
tags: [variable string private]
```

```Go
var scanstr string
```

Target variables for scanning into. 

### <a id="scantime" href="#scantime">var scantime</a>

```
searchKey: sql.scantime
tags: [variable struct private]
```

```Go
var scantime time.Time
```

Target variables for scanning into. 

### <a id="scanuint16" href="#scanuint16">var scanuint16</a>

```
searchKey: sql.scanuint16
tags: [variable number private]
```

```Go
var scanuint16 uint16
```

Target variables for scanning into. 

### <a id="scanuint8" href="#scanuint8">var scanuint8</a>

```
searchKey: sql.scanuint8
tags: [variable number private]
```

```Go
var scanuint8 uint8
```

Target variables for scanning into. 

### <a id="someTime" href="#someTime">var someTime</a>

```
searchKey: sql.someTime
tags: [variable struct private]
```

```Go
var someTime = time.Unix(123, 0)
```

### <a id="testStrictClose" href="#testStrictClose">var testStrictClose</a>

```
searchKey: sql.testStrictClose
tags: [variable struct private]
```

```Go
var testStrictClose *testing.T
```

### <a id="valueConverterTests" href="#valueConverterTests">var valueConverterTests</a>

```
searchKey: sql.valueConverterTests
tags: [variable array struct private]
```

```Go
var valueConverterTests = ...
```

### <a id="valuerReflectType" href="#valuerReflectType">var valuerReflectType</a>

```
searchKey: sql.valuerReflectType
tags: [variable interface private]
```

```Go
var valuerReflectType = reflect.TypeOf((*driver.Valuer)(nil)).Elem()
```

## <a id="type" href="#type">Types</a>

### <a id="ColumnType" href="#ColumnType">type ColumnType struct</a>

```
searchKey: sql.ColumnType
tags: [struct]
```

```Go
type ColumnType struct {
	name string

	hasNullable       bool
	hasLength         bool
	hasPrecisionScale bool

	nullable     bool
	length       int64
	databaseType string
	precision    int64
	scale        int64
	scanType     reflect.Type
}
```

ColumnType contains the name and type of a column. 

#### <a id="ColumnType.DatabaseTypeName" href="#ColumnType.DatabaseTypeName">func (ci *ColumnType) DatabaseTypeName() string</a>

```
searchKey: sql.ColumnType.DatabaseTypeName
tags: [method]
```

```Go
func (ci *ColumnType) DatabaseTypeName() string
```

DatabaseTypeName returns the database system name of the column type. If an empty string is returned, then the driver type name is not supported. Consult your driver documentation for a list of driver data types. Length specifiers are not included. Common type names include "VARCHAR", "TEXT", "NVARCHAR", "DECIMAL", "BOOL", "INT", and "BIGINT". 

#### <a id="ColumnType.DecimalSize" href="#ColumnType.DecimalSize">func (ci *ColumnType) DecimalSize() (precision, scale int64, ok bool)</a>

```
searchKey: sql.ColumnType.DecimalSize
tags: [method]
```

```Go
func (ci *ColumnType) DecimalSize() (precision, scale int64, ok bool)
```

DecimalSize returns the scale and precision of a decimal type. If not applicable or if not supported ok is false. 

#### <a id="ColumnType.Length" href="#ColumnType.Length">func (ci *ColumnType) Length() (length int64, ok bool)</a>

```
searchKey: sql.ColumnType.Length
tags: [method]
```

```Go
func (ci *ColumnType) Length() (length int64, ok bool)
```

Length returns the column type length for variable length column types such as text and binary field types. If the type length is unbounded the value will be math.MaxInt64 (any database limits will still apply). If the column type is not variable length, such as an int, or if not supported by the driver ok is false. 

#### <a id="ColumnType.Name" href="#ColumnType.Name">func (ci *ColumnType) Name() string</a>

```
searchKey: sql.ColumnType.Name
tags: [method]
```

```Go
func (ci *ColumnType) Name() string
```

Name returns the name or alias of the column. 

#### <a id="ColumnType.Nullable" href="#ColumnType.Nullable">func (ci *ColumnType) Nullable() (nullable, ok bool)</a>

```
searchKey: sql.ColumnType.Nullable
tags: [method]
```

```Go
func (ci *ColumnType) Nullable() (nullable, ok bool)
```

Nullable reports whether the column may be null. If a driver does not support this property ok will be false. 

#### <a id="ColumnType.ScanType" href="#ColumnType.ScanType">func (ci *ColumnType) ScanType() reflect.Type</a>

```
searchKey: sql.ColumnType.ScanType
tags: [method]
```

```Go
func (ci *ColumnType) ScanType() reflect.Type
```

ScanType returns a Go type suitable for scanning into using Rows.Scan. If a driver does not support this property ScanType will return the type of an empty interface. 

### <a id="Conn" href="#Conn">type Conn struct</a>

```
searchKey: sql.Conn
tags: [struct]
```

```Go
type Conn struct {
	db *DB

	// closemu prevents the connection from closing while there
	// is an active query. It is held for read during queries
	// and exclusively during close.
	closemu sync.RWMutex

	// dc is owned until close, at which point
	// it's returned to the connection pool.
	dc *driverConn

	// done transitions from 0 to 1 exactly once, on close.
	// Once done, all operations fail with ErrConnDone.
	// Use atomic operations on value when checking value.
	done int32
}
```

Conn represents a single database connection rather than a pool of database connections. Prefer running queries from DB unless there is a specific need for a continuous single database connection. 

A Conn must call Close to return the connection to the database pool and may do so concurrently with a running query. 

After a call to Close, all operations on the connection fail with ErrConnDone. 

#### <a id="Conn.BeginTx" href="#Conn.BeginTx">func (c *Conn) BeginTx(ctx context.Context, opts *TxOptions) (*Tx, error)</a>

```
searchKey: sql.Conn.BeginTx
tags: [method]
```

```Go
func (c *Conn) BeginTx(ctx context.Context, opts *TxOptions) (*Tx, error)
```

BeginTx starts a transaction. 

The provided context is used until the transaction is committed or rolled back. If the context is canceled, the sql package will roll back the transaction. Tx.Commit will return an error if the context provided to BeginTx is canceled. 

The provided TxOptions is optional and may be nil if defaults should be used. If a non-default isolation level is used that the driver doesn't support, an error will be returned. 

#### <a id="Conn.Close" href="#Conn.Close">func (c *Conn) Close() error</a>

```
searchKey: sql.Conn.Close
tags: [method]
```

```Go
func (c *Conn) Close() error
```

Close returns the connection to the connection pool. All operations after a Close will return with ErrConnDone. Close is safe to call concurrently with other operations and will block until all other operations finish. It may be useful to first cancel any used context and then call close directly after. 

#### <a id="Conn.ExecContext" href="#Conn.ExecContext">func (c *Conn) ExecContext(ctx context.Context, query string, args ...interface{}) (Result, error)</a>

```
searchKey: sql.Conn.ExecContext
tags: [method]
```

```Go
func (c *Conn) ExecContext(ctx context.Context, query string, args ...interface{}) (Result, error)
```

ExecContext executes a query without returning any rows. The args are for any placeholder parameters in the query. 

#### <a id="Conn.PingContext" href="#Conn.PingContext">func (c *Conn) PingContext(ctx context.Context) error</a>

```
searchKey: sql.Conn.PingContext
tags: [method]
```

```Go
func (c *Conn) PingContext(ctx context.Context) error
```

PingContext verifies the connection to the database is still alive. 

#### <a id="Conn.PrepareContext" href="#Conn.PrepareContext">func (c *Conn) PrepareContext(ctx context.Context, query string) (*Stmt, error)</a>

```
searchKey: sql.Conn.PrepareContext
tags: [method]
```

```Go
func (c *Conn) PrepareContext(ctx context.Context, query string) (*Stmt, error)
```

PrepareContext creates a prepared statement for later queries or executions. Multiple queries or executions may be run concurrently from the returned statement. The caller must call the statement's Close method when the statement is no longer needed. 

The provided context is used for the preparation of the statement, not for the execution of the statement. 

#### <a id="Conn.QueryContext" href="#Conn.QueryContext">func (c *Conn) QueryContext(ctx context.Context, query string, args ...interface{}) (*Rows, error)</a>

```
searchKey: sql.Conn.QueryContext
tags: [method]
```

```Go
func (c *Conn) QueryContext(ctx context.Context, query string, args ...interface{}) (*Rows, error)
```

QueryContext executes a query that returns rows, typically a SELECT. The args are for any placeholder parameters in the query. 

#### <a id="Conn.QueryRowContext" href="#Conn.QueryRowContext">func (c *Conn) QueryRowContext(ctx context.Context, query string, args ...interface{}) *Row</a>

```
searchKey: sql.Conn.QueryRowContext
tags: [method]
```

```Go
func (c *Conn) QueryRowContext(ctx context.Context, query string, args ...interface{}) *Row
```

QueryRowContext executes a query that is expected to return at most one row. QueryRowContext always returns a non-nil value. Errors are deferred until Row's Scan method is called. If the query selects no rows, the *Row's Scan will return ErrNoRows. Otherwise, the *Row's Scan scans the first selected row and discards the rest. 

#### <a id="Conn.Raw" href="#Conn.Raw">func (c *Conn) Raw(f func(driverConn interface{}) error) (err error)</a>

```
searchKey: sql.Conn.Raw
tags: [method]
```

```Go
func (c *Conn) Raw(f func(driverConn interface{}) error) (err error)
```

Raw executes f exposing the underlying driver connection for the duration of f. The driverConn must not be used outside of f. 

Once f returns and err is nil, the Conn will continue to be usable until Conn.Close is called. 

#### <a id="Conn.close" href="#Conn.close">func (c *Conn) close(err error) error</a>

```
searchKey: sql.Conn.close
tags: [method private]
```

```Go
func (c *Conn) close(err error) error
```

#### <a id="Conn.closemuRUnlockCondReleaseConn" href="#Conn.closemuRUnlockCondReleaseConn">func (c *Conn) closemuRUnlockCondReleaseConn(err error)</a>

```
searchKey: sql.Conn.closemuRUnlockCondReleaseConn
tags: [method private]
```

```Go
func (c *Conn) closemuRUnlockCondReleaseConn(err error)
```

closemuRUnlockCondReleaseConn read unlocks closemu as the sql operation is done with the dc. 

#### <a id="Conn.grabConn" href="#Conn.grabConn">func (c *Conn) grabConn(context.Context) (*driverConn, releaseConn, error)</a>

```
searchKey: sql.Conn.grabConn
tags: [method private]
```

```Go
func (c *Conn) grabConn(context.Context) (*driverConn, releaseConn, error)
```

grabConn takes a context to implement stmtConnGrabber but the context is not used. 

#### <a id="Conn.txCtx" href="#Conn.txCtx">func (c *Conn) txCtx() context.Context</a>

```
searchKey: sql.Conn.txCtx
tags: [method private]
```

```Go
func (c *Conn) txCtx() context.Context
```

### <a id="DB" href="#DB">type DB struct</a>

```
searchKey: sql.DB
tags: [struct]
```

```Go
type DB struct {
	// Atomic access only. At top of struct to prevent mis-alignment
	// on 32-bit platforms. Of type time.Duration.
	waitDuration int64 // Total time waited for new connections.

	connector driver.Connector
	// numClosed is an atomic counter which represents a total number of
	// closed connections. Stmt.openStmt checks it before cleaning closed
	// connections in Stmt.css.
	numClosed uint64

	mu           sync.Mutex // protects following fields
	freeConn     []*driverConn
	connRequests map[uint64]chan connRequest
	nextRequest  uint64 // Next key to use in connRequests.
	numOpen      int    // number of opened and pending open connections
	// Used to signal the need for new connections
	// a goroutine running connectionOpener() reads on this chan and
	// maybeOpenNewConnections sends on the chan (one send per needed connection)
	// It is closed during db.Close(). The close tells the connectionOpener
	// goroutine to exit.
	openerCh          chan struct{}
	closed            bool
	dep               map[finalCloser]depSet
	lastPut           map[*driverConn]string // stacktrace of last conn's put; debug only
	maxIdleCount      int                    // zero means defaultMaxIdleConns; negative means 0
	maxOpen           int                    // <= 0 means unlimited
	maxLifetime       time.Duration          // maximum amount of time a connection may be reused
	maxIdleTime       time.Duration          // maximum amount of time a connection may be idle before being closed
	cleanerCh         chan struct{}
	waitCount         int64 // Total number of connections waited for.
	maxIdleClosed     int64 // Total number of connections closed due to idle count.
	maxIdleTimeClosed int64 // Total number of connections closed due to idle time.
	maxLifetimeClosed int64 // Total number of connections closed due to max connection lifetime limit.

	stop func() // stop cancels the connection opener.
}
```

DB is a database handle representing a pool of zero or more underlying connections. It's safe for concurrent use by multiple goroutines. 

The sql package creates and frees connections automatically; it also maintains a free pool of idle connections. If the database has a concept of per-connection state, such state can be reliably observed within a transaction (Tx) or connection (Conn). Once DB.Begin is called, the returned Tx is bound to a single connection. Once Commit or Rollback is called on the transaction, that transaction's connection is returned to DB's idle connection pool. The pool size can be controlled with SetMaxIdleConns. 

#### <a id="Open" href="#Open">func Open(driverName, dataSourceName string) (*DB, error)</a>

```
searchKey: sql.Open
tags: [function]
```

```Go
func Open(driverName, dataSourceName string) (*DB, error)
```

Open opens a database specified by its database driver name and a driver-specific data source name, usually consisting of at least a database name and connection information. 

Most users will open a database via a driver-specific connection helper function that returns a *DB. No database drivers are included in the Go standard library. See [https://golang.org/s/sqldrivers](https://golang.org/s/sqldrivers) for a list of third-party drivers. 

Open may just validate its arguments without creating a connection to the database. To verify that the data source name is valid, call Ping. 

The returned DB is safe for concurrent use by multiple goroutines and maintains its own pool of idle connections. Thus, the Open function should be called just once. It is rarely necessary to close a DB. 

#### <a id="OpenDB" href="#OpenDB">func OpenDB(c driver.Connector) *DB</a>

```
searchKey: sql.OpenDB
tags: [function]
```

```Go
func OpenDB(c driver.Connector) *DB
```

OpenDB opens a database using a Connector, allowing drivers to bypass a string based data source name. 

Most users will open a database via a driver-specific connection helper function that returns a *DB. No database drivers are included in the Go standard library. See [https://golang.org/s/sqldrivers](https://golang.org/s/sqldrivers) for a list of third-party drivers. 

OpenDB may just validate its arguments without creating a connection to the database. To verify that the data source name is valid, call Ping. 

The returned DB is safe for concurrent use by multiple goroutines and maintains its own pool of idle connections. Thus, the OpenDB function should be called just once. It is rarely necessary to close a DB. 

#### <a id="newTestDB" href="#newTestDB">func newTestDB(t testing.TB, name string) *DB</a>

```
searchKey: sql.newTestDB
tags: [function private]
```

```Go
func newTestDB(t testing.TB, name string) *DB
```

#### <a id="newTestDBConnector" href="#newTestDBConnector">func newTestDBConnector(t testing.TB, fc *fakeConnector, name string) *DB</a>

```
searchKey: sql.newTestDBConnector
tags: [function private]
```

```Go
func newTestDBConnector(t testing.TB, fc *fakeConnector, name string) *DB
```

#### <a id="DB.Begin" href="#DB.Begin">func (db *DB) Begin() (*Tx, error)</a>

```
searchKey: sql.DB.Begin
tags: [method]
```

```Go
func (db *DB) Begin() (*Tx, error)
```

Begin starts a transaction. The default isolation level is dependent on the driver. 

Begin uses context.Background internally; to specify the context, use BeginTx. 

#### <a id="DB.BeginTx" href="#DB.BeginTx">func (db *DB) BeginTx(ctx context.Context, opts *TxOptions) (*Tx, error)</a>

```
searchKey: sql.DB.BeginTx
tags: [method]
```

```Go
func (db *DB) BeginTx(ctx context.Context, opts *TxOptions) (*Tx, error)
```

BeginTx starts a transaction. 

The provided context is used until the transaction is committed or rolled back. If the context is canceled, the sql package will roll back the transaction. Tx.Commit will return an error if the context provided to BeginTx is canceled. 

The provided TxOptions is optional and may be nil if defaults should be used. If a non-default isolation level is used that the driver doesn't support, an error will be returned. 

#### <a id="DB.Close" href="#DB.Close">func (db *DB) Close() error</a>

```
searchKey: sql.DB.Close
tags: [method]
```

```Go
func (db *DB) Close() error
```

Close closes the database and prevents new queries from starting. Close then waits for all queries that have started processing on the server to finish. 

It is rare to Close a DB, as the DB handle is meant to be long-lived and shared between many goroutines. 

#### <a id="DB.Conn" href="#DB.Conn">func (db *DB) Conn(ctx context.Context) (*Conn, error)</a>

```
searchKey: sql.DB.Conn
tags: [method]
```

```Go
func (db *DB) Conn(ctx context.Context) (*Conn, error)
```

Conn returns a single connection by either opening a new connection or returning an existing connection from the connection pool. Conn will block until either a connection is returned or ctx is canceled. Queries run on the same Conn will be run in the same database session. 

Every Conn must be returned to the database pool after use by calling Conn.Close. 

#### <a id="DB.Driver" href="#DB.Driver">func (db *DB) Driver() driver.Driver</a>

```
searchKey: sql.DB.Driver
tags: [method]
```

```Go
func (db *DB) Driver() driver.Driver
```

Driver returns the database's underlying driver. 

#### <a id="DB.Exec" href="#DB.Exec">func (db *DB) Exec(query string, args ...interface{}) (Result, error)</a>

```
searchKey: sql.DB.Exec
tags: [method]
```

```Go
func (db *DB) Exec(query string, args ...interface{}) (Result, error)
```

Exec executes a query without returning any rows. The args are for any placeholder parameters in the query. 

Exec uses context.Background internally; to specify the context, use ExecContext. 

#### <a id="DB.ExecContext" href="#DB.ExecContext">func (db *DB) ExecContext(ctx context.Context, query string, args ...interface{}) (Result, error)</a>

```
searchKey: sql.DB.ExecContext
tags: [method]
```

```Go
func (db *DB) ExecContext(ctx context.Context, query string, args ...interface{}) (Result, error)
```

ExecContext executes a query without returning any rows. The args are for any placeholder parameters in the query. 

#### <a id="DB.Ping" href="#DB.Ping">func (db *DB) Ping() error</a>

```
searchKey: sql.DB.Ping
tags: [method]
```

```Go
func (db *DB) Ping() error
```

Ping verifies a connection to the database is still alive, establishing a connection if necessary. 

Ping uses context.Background internally; to specify the context, use PingContext. 

#### <a id="DB.PingContext" href="#DB.PingContext">func (db *DB) PingContext(ctx context.Context) error</a>

```
searchKey: sql.DB.PingContext
tags: [method]
```

```Go
func (db *DB) PingContext(ctx context.Context) error
```

PingContext verifies a connection to the database is still alive, establishing a connection if necessary. 

#### <a id="DB.Prepare" href="#DB.Prepare">func (db *DB) Prepare(query string) (*Stmt, error)</a>

```
searchKey: sql.DB.Prepare
tags: [method]
```

```Go
func (db *DB) Prepare(query string) (*Stmt, error)
```

Prepare creates a prepared statement for later queries or executions. Multiple queries or executions may be run concurrently from the returned statement. The caller must call the statement's Close method when the statement is no longer needed. 

Prepare uses context.Background internally; to specify the context, use PrepareContext. 

#### <a id="DB.PrepareContext" href="#DB.PrepareContext">func (db *DB) PrepareContext(ctx context.Context, query string) (*Stmt, error)</a>

```
searchKey: sql.DB.PrepareContext
tags: [method]
```

```Go
func (db *DB) PrepareContext(ctx context.Context, query string) (*Stmt, error)
```

PrepareContext creates a prepared statement for later queries or executions. Multiple queries or executions may be run concurrently from the returned statement. The caller must call the statement's Close method when the statement is no longer needed. 

The provided context is used for the preparation of the statement, not for the execution of the statement. 

#### <a id="DB.Query" href="#DB.Query">func (db *DB) Query(query string, args ...interface{}) (*Rows, error)</a>

```
searchKey: sql.DB.Query
tags: [method]
```

```Go
func (db *DB) Query(query string, args ...interface{}) (*Rows, error)
```

Query executes a query that returns rows, typically a SELECT. The args are for any placeholder parameters in the query. 

Query uses context.Background internally; to specify the context, use QueryContext. 

#### <a id="DB.QueryContext" href="#DB.QueryContext">func (db *DB) QueryContext(ctx context.Context, query string, args ...interface{}) (*Rows, error)</a>

```
searchKey: sql.DB.QueryContext
tags: [method]
```

```Go
func (db *DB) QueryContext(ctx context.Context, query string, args ...interface{}) (*Rows, error)
```

QueryContext executes a query that returns rows, typically a SELECT. The args are for any placeholder parameters in the query. 

#### <a id="DB.QueryRow" href="#DB.QueryRow">func (db *DB) QueryRow(query string, args ...interface{}) *Row</a>

```
searchKey: sql.DB.QueryRow
tags: [method]
```

```Go
func (db *DB) QueryRow(query string, args ...interface{}) *Row
```

QueryRow executes a query that is expected to return at most one row. QueryRow always returns a non-nil value. Errors are deferred until Row's Scan method is called. If the query selects no rows, the *Row's Scan will return ErrNoRows. Otherwise, the *Row's Scan scans the first selected row and discards the rest. 

QueryRow uses context.Background internally; to specify the context, use QueryRowContext. 

#### <a id="DB.QueryRowContext" href="#DB.QueryRowContext">func (db *DB) QueryRowContext(ctx context.Context, query string, args ...interface{}) *Row</a>

```
searchKey: sql.DB.QueryRowContext
tags: [method]
```

```Go
func (db *DB) QueryRowContext(ctx context.Context, query string, args ...interface{}) *Row
```

QueryRowContext executes a query that is expected to return at most one row. QueryRowContext always returns a non-nil value. Errors are deferred until Row's Scan method is called. If the query selects no rows, the *Row's Scan will return ErrNoRows. Otherwise, the *Row's Scan scans the first selected row and discards the rest. 

#### <a id="DB.SetConnMaxIdleTime" href="#DB.SetConnMaxIdleTime">func (db *DB) SetConnMaxIdleTime(d time.Duration)</a>

```
searchKey: sql.DB.SetConnMaxIdleTime
tags: [method]
```

```Go
func (db *DB) SetConnMaxIdleTime(d time.Duration)
```

SetConnMaxIdleTime sets the maximum amount of time a connection may be idle. 

Expired connections may be closed lazily before reuse. 

If d <= 0, connections are not closed due to a connection's idle time. 

#### <a id="DB.SetConnMaxLifetime" href="#DB.SetConnMaxLifetime">func (db *DB) SetConnMaxLifetime(d time.Duration)</a>

```
searchKey: sql.DB.SetConnMaxLifetime
tags: [method]
```

```Go
func (db *DB) SetConnMaxLifetime(d time.Duration)
```

SetConnMaxLifetime sets the maximum amount of time a connection may be reused. 

Expired connections may be closed lazily before reuse. 

If d <= 0, connections are not closed due to a connection's age. 

#### <a id="DB.SetMaxIdleConns" href="#DB.SetMaxIdleConns">func (db *DB) SetMaxIdleConns(n int)</a>

```
searchKey: sql.DB.SetMaxIdleConns
tags: [method]
```

```Go
func (db *DB) SetMaxIdleConns(n int)
```

SetMaxIdleConns sets the maximum number of connections in the idle connection pool. 

If MaxOpenConns is greater than 0 but less than the new MaxIdleConns, then the new MaxIdleConns will be reduced to match the MaxOpenConns limit. 

If n <= 0, no idle connections are retained. 

The default max idle connections is currently 2. This may change in a future release. 

#### <a id="DB.SetMaxOpenConns" href="#DB.SetMaxOpenConns">func (db *DB) SetMaxOpenConns(n int)</a>

```
searchKey: sql.DB.SetMaxOpenConns
tags: [method]
```

```Go
func (db *DB) SetMaxOpenConns(n int)
```

SetMaxOpenConns sets the maximum number of open connections to the database. 

If MaxIdleConns is greater than 0 and the new MaxOpenConns is less than MaxIdleConns, then MaxIdleConns will be reduced to match the new MaxOpenConns limit. 

If n <= 0, then there is no limit on the number of open connections. The default is 0 (unlimited). 

#### <a id="DB.Stats" href="#DB.Stats">func (db *DB) Stats() DBStats</a>

```
searchKey: sql.DB.Stats
tags: [method]
```

```Go
func (db *DB) Stats() DBStats
```

Stats returns database statistics. 

#### <a id="DB.addDep" href="#DB.addDep">func (db *DB) addDep(x finalCloser, dep interface{})</a>

```
searchKey: sql.DB.addDep
tags: [method private]
```

```Go
func (db *DB) addDep(x finalCloser, dep interface{})
```

addDep notes that x now depends on dep, and x's finalClose won't be called until all of x's dependencies are removed with removeDep. 

#### <a id="DB.addDepLocked" href="#DB.addDepLocked">func (db *DB) addDepLocked(x finalCloser, dep interface{})</a>

```
searchKey: sql.DB.addDepLocked
tags: [method private]
```

```Go
func (db *DB) addDepLocked(x finalCloser, dep interface{})
```

#### <a id="DB.begin" href="#DB.begin">func (db *DB) begin(ctx context.Context, opts *TxOptions, strategy connReuseStrategy) (tx *Tx, err error)</a>

```
searchKey: sql.DB.begin
tags: [method private]
```

```Go
func (db *DB) begin(ctx context.Context, opts *TxOptions, strategy connReuseStrategy) (tx *Tx, err error)
```

#### <a id="DB.beginDC" href="#DB.beginDC">func (db *DB) beginDC(ctx context.Context, dc *driverConn, release func(error), opts *TxOptions) (tx *Tx, err error)</a>

```
searchKey: sql.DB.beginDC
tags: [method private]
```

```Go
func (db *DB) beginDC(ctx context.Context, dc *driverConn, release func(error), opts *TxOptions) (tx *Tx, err error)
```

beginDC starts a transaction. The provided dc must be valid and ready to use. 

#### <a id="DB.clearAllConns" href="#DB.clearAllConns">func (db *DB) clearAllConns(t *testing.T)</a>

```
searchKey: sql.DB.clearAllConns
tags: [method private]
```

```Go
func (db *DB) clearAllConns(t *testing.T)
```

clearAllConns closes all connections in db. 

#### <a id="DB.conn" href="#DB.conn">func (db *DB) conn(ctx context.Context, strategy connReuseStrategy) (*driverConn, error)</a>

```
searchKey: sql.DB.conn
tags: [method private]
```

```Go
func (db *DB) conn(ctx context.Context, strategy connReuseStrategy) (*driverConn, error)
```

conn returns a newly-opened or cached *driverConn. 

#### <a id="DB.connectionCleaner" href="#DB.connectionCleaner">func (db *DB) connectionCleaner(d time.Duration)</a>

```
searchKey: sql.DB.connectionCleaner
tags: [method private]
```

```Go
func (db *DB) connectionCleaner(d time.Duration)
```

#### <a id="DB.connectionCleanerRunLocked" href="#DB.connectionCleanerRunLocked">func (db *DB) connectionCleanerRunLocked() (closing []*driverConn)</a>

```
searchKey: sql.DB.connectionCleanerRunLocked
tags: [method private]
```

```Go
func (db *DB) connectionCleanerRunLocked() (closing []*driverConn)
```

#### <a id="DB.connectionOpener" href="#DB.connectionOpener">func (db *DB) connectionOpener(ctx context.Context)</a>

```
searchKey: sql.DB.connectionOpener
tags: [method private]
```

```Go
func (db *DB) connectionOpener(ctx context.Context)
```

Runs in a separate goroutine, opens new connections when requested. 

#### <a id="DB.dumpDep" href="#DB.dumpDep">func (db *DB) dumpDep(t *testing.T, depth int, dep finalCloser, seen map[finalCloser]bool)</a>

```
searchKey: sql.DB.dumpDep
tags: [method private]
```

```Go
func (db *DB) dumpDep(t *testing.T, depth int, dep finalCloser, seen map[finalCloser]bool)
```

#### <a id="DB.dumpDeps" href="#DB.dumpDeps">func (db *DB) dumpDeps(t *testing.T)</a>

```
searchKey: sql.DB.dumpDeps
tags: [method private]
```

```Go
func (db *DB) dumpDeps(t *testing.T)
```

#### <a id="DB.exec" href="#DB.exec">func (db *DB) exec(ctx context.Context, query string, args []interface{}, strategy connReuseStrategy) (Result, error)</a>

```
searchKey: sql.DB.exec
tags: [method private]
```

```Go
func (db *DB) exec(ctx context.Context, query string, args []interface{}, strategy connReuseStrategy) (Result, error)
```

#### <a id="DB.execDC" href="#DB.execDC">func (db *DB) execDC(ctx context.Context, dc *driverConn, release func(error), query string, args []interface{}) (res Result, err error)</a>

```
searchKey: sql.DB.execDC
tags: [method private]
```

```Go
func (db *DB) execDC(ctx context.Context, dc *driverConn, release func(error), query string, args []interface{}) (res Result, err error)
```

#### <a id="DB.maxIdleConnsLocked" href="#DB.maxIdleConnsLocked">func (db *DB) maxIdleConnsLocked() int</a>

```
searchKey: sql.DB.maxIdleConnsLocked
tags: [method private]
```

```Go
func (db *DB) maxIdleConnsLocked() int
```

#### <a id="DB.maybeOpenNewConnections" href="#DB.maybeOpenNewConnections">func (db *DB) maybeOpenNewConnections()</a>

```
searchKey: sql.DB.maybeOpenNewConnections
tags: [method private]
```

```Go
func (db *DB) maybeOpenNewConnections()
```

Assumes db.mu is locked. If there are connRequests and the connection limit hasn't been reached, then tell the connectionOpener to open new connections. 

#### <a id="DB.nextRequestKeyLocked" href="#DB.nextRequestKeyLocked">func (db *DB) nextRequestKeyLocked() uint64</a>

```
searchKey: sql.DB.nextRequestKeyLocked
tags: [method private]
```

```Go
func (db *DB) nextRequestKeyLocked() uint64
```

nextRequestKeyLocked returns the next connection request key. It is assumed that nextRequest will not overflow. 

#### <a id="DB.noteUnusedDriverStatement" href="#DB.noteUnusedDriverStatement">func (db *DB) noteUnusedDriverStatement(c *driverConn, ds *driverStmt)</a>

```
searchKey: sql.DB.noteUnusedDriverStatement
tags: [method private]
```

```Go
func (db *DB) noteUnusedDriverStatement(c *driverConn, ds *driverStmt)
```

noteUnusedDriverStatement notes that ds is no longer used and should be closed whenever possible (when c is next not in use), unless c is already closed. 

#### <a id="DB.numDeps" href="#DB.numDeps">func (db *DB) numDeps() int</a>

```
searchKey: sql.DB.numDeps
tags: [method private]
```

```Go
func (db *DB) numDeps() int
```

#### <a id="DB.numDepsPollUntil" href="#DB.numDepsPollUntil">func (db *DB) numDepsPollUntil(want int, d time.Duration) int</a>

```
searchKey: sql.DB.numDepsPollUntil
tags: [method private]
```

```Go
func (db *DB) numDepsPollUntil(want int, d time.Duration) int
```

Dependencies are closed via a goroutine, so this polls waiting for numDeps to fall to want, waiting up to d. 

#### <a id="DB.numFreeConns" href="#DB.numFreeConns">func (db *DB) numFreeConns() int</a>

```
searchKey: sql.DB.numFreeConns
tags: [method private]
```

```Go
func (db *DB) numFreeConns() int
```

#### <a id="DB.numOpenConns" href="#DB.numOpenConns">func (db *DB) numOpenConns() int</a>

```
searchKey: sql.DB.numOpenConns
tags: [method private]
```

```Go
func (db *DB) numOpenConns() int
```

#### <a id="DB.openNewConnection" href="#DB.openNewConnection">func (db *DB) openNewConnection(ctx context.Context)</a>

```
searchKey: sql.DB.openNewConnection
tags: [method private]
```

```Go
func (db *DB) openNewConnection(ctx context.Context)
```

Open one new connection 

#### <a id="DB.pingDC" href="#DB.pingDC">func (db *DB) pingDC(ctx context.Context, dc *driverConn, release func(error)) error</a>

```
searchKey: sql.DB.pingDC
tags: [method private]
```

```Go
func (db *DB) pingDC(ctx context.Context, dc *driverConn, release func(error)) error
```

#### <a id="DB.prepare" href="#DB.prepare">func (db *DB) prepare(ctx context.Context, query string, strategy connReuseStrategy) (*Stmt, error)</a>

```
searchKey: sql.DB.prepare
tags: [method private]
```

```Go
func (db *DB) prepare(ctx context.Context, query string, strategy connReuseStrategy) (*Stmt, error)
```

#### <a id="DB.prepareDC" href="#DB.prepareDC">func (db *DB) prepareDC(ctx context.Context, dc *driverConn, release func(error), cg stmtConnGrabber, query string) (*Stmt, error)</a>

```
searchKey: sql.DB.prepareDC
tags: [method private]
```

```Go
func (db *DB) prepareDC(ctx context.Context, dc *driverConn, release func(error), cg stmtConnGrabber, query string) (*Stmt, error)
```

prepareDC prepares a query on the driverConn and calls release before returning. When cg == nil it implies that a connection pool is used, and when cg != nil only a single driver connection is used. 

#### <a id="DB.putConn" href="#DB.putConn">func (db *DB) putConn(dc *driverConn, err error, resetSession bool)</a>

```
searchKey: sql.DB.putConn
tags: [method private]
```

```Go
func (db *DB) putConn(dc *driverConn, err error, resetSession bool)
```

putConn adds a connection to the db's free pool. err is optionally the last error that occurred on this connection. 

#### <a id="DB.putConnDBLocked" href="#DB.putConnDBLocked">func (db *DB) putConnDBLocked(dc *driverConn, err error) bool</a>

```
searchKey: sql.DB.putConnDBLocked
tags: [method private]
```

```Go
func (db *DB) putConnDBLocked(dc *driverConn, err error) bool
```

Satisfy a connRequest or put the driverConn in the idle pool and return true or return false. putConnDBLocked will satisfy a connRequest if there is one, or it will return the *driverConn to the freeConn list if err == nil and the idle connection limit will not be exceeded. If err != nil, the value of dc is ignored. If err == nil, then dc must not equal nil. If a connRequest was fulfilled or the *driverConn was placed in the freeConn list, then true is returned, otherwise false is returned. 

#### <a id="DB.query" href="#DB.query">func (db *DB) query(ctx context.Context, query string, args []interface{}, strategy connReuseStrategy) (*Rows, error)</a>

```
searchKey: sql.DB.query
tags: [method private]
```

```Go
func (db *DB) query(ctx context.Context, query string, args []interface{}, strategy connReuseStrategy) (*Rows, error)
```

#### <a id="DB.queryDC" href="#DB.queryDC">func (db *DB) queryDC(ctx, txctx context.Context, dc *driverConn, releaseConn func(error), query string, args []interface{}) (*Rows, error)</a>

```
searchKey: sql.DB.queryDC
tags: [method private]
```

```Go
func (db *DB) queryDC(ctx, txctx context.Context, dc *driverConn, releaseConn func(error), query string, args []interface{}) (*Rows, error)
```

queryDC executes a query on the given connection. The connection gets released by the releaseConn function. The ctx context is from a query method and the txctx context is from an optional transaction context. 

#### <a id="DB.removeDep" href="#DB.removeDep">func (db *DB) removeDep(x finalCloser, dep interface{}) error</a>

```
searchKey: sql.DB.removeDep
tags: [method private]
```

```Go
func (db *DB) removeDep(x finalCloser, dep interface{}) error
```

removeDep notes that x no longer depends on dep. If x still has dependencies, nil is returned. If x no longer has any dependencies, its finalClose method will be called and its error value will be returned. 

#### <a id="DB.removeDepLocked" href="#DB.removeDepLocked">func (db *DB) removeDepLocked(x finalCloser, dep interface{}) func() error</a>

```
searchKey: sql.DB.removeDepLocked
tags: [method private]
```

```Go
func (db *DB) removeDepLocked(x finalCloser, dep interface{}) func() error
```

#### <a id="DB.shortestIdleTimeLocked" href="#DB.shortestIdleTimeLocked">func (db *DB) shortestIdleTimeLocked() time.Duration</a>

```
searchKey: sql.DB.shortestIdleTimeLocked
tags: [method private]
```

```Go
func (db *DB) shortestIdleTimeLocked() time.Duration
```

#### <a id="DB.startCleanerLocked" href="#DB.startCleanerLocked">func (db *DB) startCleanerLocked()</a>

```
searchKey: sql.DB.startCleanerLocked
tags: [method private]
```

```Go
func (db *DB) startCleanerLocked()
```

startCleanerLocked starts connectionCleaner if needed. 

### <a id="DBStats" href="#DBStats">type DBStats struct</a>

```
searchKey: sql.DBStats
tags: [struct]
```

```Go
type DBStats struct {
	MaxOpenConnections int // Maximum number of open connections to the database.

	// Pool Status
	OpenConnections int // The number of established connections both in use and idle.
	InUse           int // The number of connections currently in use.
	Idle            int // The number of idle connections.

	// Counters
	WaitCount         int64         // The total number of connections waited for.
	WaitDuration      time.Duration // The total time blocked waiting for a new connection.
	MaxIdleClosed     int64         // The total number of connections closed due to SetMaxIdleConns.
	MaxIdleTimeClosed int64         // The total number of connections closed due to SetConnMaxIdleTime.
	MaxLifetimeClosed int64         // The total number of connections closed due to SetConnMaxLifetime.
}
```

DBStats contains database statistics. 

### <a id="Dummy" href="#Dummy">type Dummy struct</a>

```
searchKey: sql.Dummy
tags: [struct private]
```

```Go
type Dummy struct {
	driver.Driver
}
```

### <a id="IsolationLevel" href="#IsolationLevel">type IsolationLevel int</a>

```
searchKey: sql.IsolationLevel
tags: [number]
```

```Go
type IsolationLevel int
```

IsolationLevel is the transaction isolation level used in TxOptions. 

#### <a id="IsolationLevel.String" href="#IsolationLevel.String">func (i IsolationLevel) String() string</a>

```
searchKey: sql.IsolationLevel.String
tags: [method]
```

```Go
func (i IsolationLevel) String() string
```

String returns the name of the transaction isolation level. 

### <a id="NamedArg" href="#NamedArg">type NamedArg struct</a>

```
searchKey: sql.NamedArg
tags: [struct]
```

```Go
type NamedArg struct {
	_Named_Fields_Required struct{}

	// Name is the name of the parameter placeholder.
	//
	// If empty, the ordinal position in the argument list will be
	// used.
	//
	// Name must omit any symbol prefix.
	Name string

	// Value is the value of the parameter.
	// It may be assigned the same value types as the query
	// arguments.
	Value interface{}
}
```

A NamedArg is a named argument. NamedArg values may be used as arguments to Query or Exec and bind to the corresponding named parameter in the SQL statement. 

For a more concise way to create NamedArg values, see the Named function. 

#### <a id="Named" href="#Named">func Named(name string, value interface{}) NamedArg</a>

```
searchKey: sql.Named
tags: [function]
```

```Go
func Named(name string, value interface{}) NamedArg
```

Named provides a more concise way to create NamedArg values. 

Example usage: 

```
db.ExecContext(ctx, `
    delete from Invoice
    where
        TimeCreated < @end
        and TimeCreated >= @start;`,
    sql.Named("start", startTime),
    sql.Named("end", endTime),
)

```
### <a id="NullBool" href="#NullBool">type NullBool struct</a>

```
searchKey: sql.NullBool
tags: [struct]
```

```Go
type NullBool struct {
	Bool  bool
	Valid bool // Valid is true if Bool is not NULL
}
```

NullBool represents a bool that may be null. NullBool implements the Scanner interface so it can be used as a scan destination, similar to NullString. 

#### <a id="NullBool.Scan" href="#NullBool.Scan">func (n *NullBool) Scan(value interface{}) error</a>

```
searchKey: sql.NullBool.Scan
tags: [method]
```

```Go
func (n *NullBool) Scan(value interface{}) error
```

Scan implements the Scanner interface. 

#### <a id="NullBool.Value" href="#NullBool.Value">func (n NullBool) Value() (driver.Value, error)</a>

```
searchKey: sql.NullBool.Value
tags: [method]
```

```Go
func (n NullBool) Value() (driver.Value, error)
```

Value implements the driver Valuer interface. 

### <a id="NullByte" href="#NullByte">type NullByte struct</a>

```
searchKey: sql.NullByte
tags: [struct]
```

```Go
type NullByte struct {
	Byte  byte
	Valid bool // Valid is true if Byte is not NULL
}
```

NullByte represents a byte that may be null. NullByte implements the Scanner interface so it can be used as a scan destination, similar to NullString. 

#### <a id="NullByte.Scan" href="#NullByte.Scan">func (n *NullByte) Scan(value interface{}) error</a>

```
searchKey: sql.NullByte.Scan
tags: [method]
```

```Go
func (n *NullByte) Scan(value interface{}) error
```

Scan implements the Scanner interface. 

#### <a id="NullByte.Value" href="#NullByte.Value">func (n NullByte) Value() (driver.Value, error)</a>

```
searchKey: sql.NullByte.Value
tags: [method]
```

```Go
func (n NullByte) Value() (driver.Value, error)
```

Value implements the driver Valuer interface. 

### <a id="NullFloat64" href="#NullFloat64">type NullFloat64 struct</a>

```
searchKey: sql.NullFloat64
tags: [struct]
```

```Go
type NullFloat64 struct {
	Float64 float64
	Valid   bool // Valid is true if Float64 is not NULL
}
```

NullFloat64 represents a float64 that may be null. NullFloat64 implements the Scanner interface so it can be used as a scan destination, similar to NullString. 

#### <a id="NullFloat64.Scan" href="#NullFloat64.Scan">func (n *NullFloat64) Scan(value interface{}) error</a>

```
searchKey: sql.NullFloat64.Scan
tags: [method]
```

```Go
func (n *NullFloat64) Scan(value interface{}) error
```

Scan implements the Scanner interface. 

#### <a id="NullFloat64.Value" href="#NullFloat64.Value">func (n NullFloat64) Value() (driver.Value, error)</a>

```
searchKey: sql.NullFloat64.Value
tags: [method]
```

```Go
func (n NullFloat64) Value() (driver.Value, error)
```

Value implements the driver Valuer interface. 

### <a id="NullInt16" href="#NullInt16">type NullInt16 struct</a>

```
searchKey: sql.NullInt16
tags: [struct]
```

```Go
type NullInt16 struct {
	Int16 int16
	Valid bool // Valid is true if Int16 is not NULL
}
```

NullInt16 represents an int16 that may be null. NullInt16 implements the Scanner interface so it can be used as a scan destination, similar to NullString. 

#### <a id="NullInt16.Scan" href="#NullInt16.Scan">func (n *NullInt16) Scan(value interface{}) error</a>

```
searchKey: sql.NullInt16.Scan
tags: [method]
```

```Go
func (n *NullInt16) Scan(value interface{}) error
```

Scan implements the Scanner interface. 

#### <a id="NullInt16.Value" href="#NullInt16.Value">func (n NullInt16) Value() (driver.Value, error)</a>

```
searchKey: sql.NullInt16.Value
tags: [method]
```

```Go
func (n NullInt16) Value() (driver.Value, error)
```

Value implements the driver Valuer interface. 

### <a id="NullInt32" href="#NullInt32">type NullInt32 struct</a>

```
searchKey: sql.NullInt32
tags: [struct]
```

```Go
type NullInt32 struct {
	Int32 int32
	Valid bool // Valid is true if Int32 is not NULL
}
```

NullInt32 represents an int32 that may be null. NullInt32 implements the Scanner interface so it can be used as a scan destination, similar to NullString. 

#### <a id="NullInt32.Scan" href="#NullInt32.Scan">func (n *NullInt32) Scan(value interface{}) error</a>

```
searchKey: sql.NullInt32.Scan
tags: [method]
```

```Go
func (n *NullInt32) Scan(value interface{}) error
```

Scan implements the Scanner interface. 

#### <a id="NullInt32.Value" href="#NullInt32.Value">func (n NullInt32) Value() (driver.Value, error)</a>

```
searchKey: sql.NullInt32.Value
tags: [method]
```

```Go
func (n NullInt32) Value() (driver.Value, error)
```

Value implements the driver Valuer interface. 

### <a id="NullInt64" href="#NullInt64">type NullInt64 struct</a>

```
searchKey: sql.NullInt64
tags: [struct]
```

```Go
type NullInt64 struct {
	Int64 int64
	Valid bool // Valid is true if Int64 is not NULL
}
```

NullInt64 represents an int64 that may be null. NullInt64 implements the Scanner interface so it can be used as a scan destination, similar to NullString. 

#### <a id="NullInt64.Scan" href="#NullInt64.Scan">func (n *NullInt64) Scan(value interface{}) error</a>

```
searchKey: sql.NullInt64.Scan
tags: [method]
```

```Go
func (n *NullInt64) Scan(value interface{}) error
```

Scan implements the Scanner interface. 

#### <a id="NullInt64.Value" href="#NullInt64.Value">func (n NullInt64) Value() (driver.Value, error)</a>

```
searchKey: sql.NullInt64.Value
tags: [method]
```

```Go
func (n NullInt64) Value() (driver.Value, error)
```

Value implements the driver Valuer interface. 

### <a id="NullString" href="#NullString">type NullString struct</a>

```
searchKey: sql.NullString
tags: [struct]
```

```Go
type NullString struct {
	String string
	Valid  bool // Valid is true if String is not NULL
}
```

NullString represents a string that may be null. NullString implements the Scanner interface so it can be used as a scan destination: 

```
var s NullString
err := db.QueryRow("SELECT name FROM foo WHERE id=?", id).Scan(&s)
...
if s.Valid {
   // use s.String
} else {
   // NULL value
}

```
#### <a id="NullString.Scan" href="#NullString.Scan">func (ns *NullString) Scan(value interface{}) error</a>

```
searchKey: sql.NullString.Scan
tags: [method]
```

```Go
func (ns *NullString) Scan(value interface{}) error
```

Scan implements the Scanner interface. 

#### <a id="NullString.Value" href="#NullString.Value">func (ns NullString) Value() (driver.Value, error)</a>

```
searchKey: sql.NullString.Value
tags: [method]
```

```Go
func (ns NullString) Value() (driver.Value, error)
```

Value implements the driver Valuer interface. 

### <a id="NullTime" href="#NullTime">type NullTime struct</a>

```
searchKey: sql.NullTime
tags: [struct]
```

```Go
type NullTime struct {
	Time  time.Time
	Valid bool // Valid is true if Time is not NULL
}
```

NullTime represents a time.Time that may be null. NullTime implements the Scanner interface so it can be used as a scan destination, similar to NullString. 

#### <a id="NullTime.Scan" href="#NullTime.Scan">func (n *NullTime) Scan(value interface{}) error</a>

```
searchKey: sql.NullTime.Scan
tags: [method]
```

```Go
func (n *NullTime) Scan(value interface{}) error
```

Scan implements the Scanner interface. 

#### <a id="NullTime.Value" href="#NullTime.Value">func (n NullTime) Value() (driver.Value, error)</a>

```
searchKey: sql.NullTime.Value
tags: [method]
```

```Go
func (n NullTime) Value() (driver.Value, error)
```

Value implements the driver Valuer interface. 

### <a id="Out" href="#Out">type Out struct</a>

```
searchKey: sql.Out
tags: [struct]
```

```Go
type Out struct {
	_Named_Fields_Required struct{}

	// Dest is a pointer to the value that will be set to the result of the
	// stored procedure's OUTPUT parameter.
	Dest interface{}

	// In is whether the parameter is an INOUT parameter. If so, the input value to the stored
	// procedure is the dereferenced value of Dest's pointer, which is then replaced with
	// the output value.
	In bool
}
```

Out may be used to retrieve OUTPUT value parameters from stored procedures. 

Not all drivers and databases support OUTPUT value parameters. 

Example usage: 

```
var outArg string
_, err := db.ExecContext(ctx, "ProcName", sql.Named("Arg1", sql.Out{Dest: &outArg}))

```
### <a id="RawBytes" href="#RawBytes">type RawBytes []byte</a>

```
searchKey: sql.RawBytes
tags: [array number]
```

```Go
type RawBytes []byte
```

RawBytes is a byte slice that holds a reference to memory owned by the database itself. After a Scan into a RawBytes, the slice is only valid until the next call to Next, Scan, or Close. 

### <a id="Result" href="#Result">type Result interface</a>

```
searchKey: sql.Result
tags: [interface]
```

```Go
type Result interface {
	// LastInsertId returns the integer generated by the database
	// in response to a command. Typically this will be from an
	// "auto increment" column when inserting a new row. Not all
	// databases support this feature, and the syntax of such
	// statements varies.
	LastInsertId() (int64, error)

	// RowsAffected returns the number of rows affected by an
	// update, insert, or delete. Not every database or database
	// driver may support this.
	RowsAffected() (int64, error)
}
```

A Result summarizes an executed SQL command. 

#### <a id="resultFromStatement" href="#resultFromStatement">func resultFromStatement(ctx context.Context, ci driver.Conn, ds *driverStmt, args ...interface{}) (Result, error)</a>

```
searchKey: sql.resultFromStatement
tags: [function private]
```

```Go
func resultFromStatement(ctx context.Context, ci driver.Conn, ds *driverStmt, args ...interface{}) (Result, error)
```

### <a id="Row" href="#Row">type Row struct</a>

```
searchKey: sql.Row
tags: [struct]
```

```Go
type Row struct {
	// One of these two will be non-nil:
	err  error // deferred error for easy chaining
	rows *Rows
}
```

Row is the result of calling QueryRow to select a single row. 

#### <a id="Row.Err" href="#Row.Err">func (r *Row) Err() error</a>

```
searchKey: sql.Row.Err
tags: [method]
```

```Go
func (r *Row) Err() error
```

Err provides a way for wrapping packages to check for query errors without calling Scan. Err returns the error, if any, that was encountered while running the query. If this error is not nil, this error will also be returned from Scan. 

#### <a id="Row.Scan" href="#Row.Scan">func (r *Row) Scan(dest ...interface{}) error</a>

```
searchKey: sql.Row.Scan
tags: [method]
```

```Go
func (r *Row) Scan(dest ...interface{}) error
```

Scan copies the columns from the matched row into the values pointed at by dest. See the documentation on Rows.Scan for details. If more than one row matches the query, Scan uses the first row and discards the rest. If no row matches the query, Scan returns ErrNoRows. 

### <a id="Rows" href="#Rows">type Rows struct</a>

```
searchKey: sql.Rows
tags: [struct]
```

```Go
type Rows struct {
	dc          *driverConn // owned; must call releaseConn when closed to release
	releaseConn func(error)
	rowsi       driver.Rows
	cancel      func()      // called when Rows is closed, may be nil.
	closeStmt   *driverStmt // if non-nil, statement to Close on close

	// closemu prevents Rows from closing while there
	// is an active streaming result. It is held for read during non-close operations
	// and exclusively during close.
	//
	// closemu guards lasterr and closed.
	closemu sync.RWMutex
	closed  bool
	lasterr error // non-nil only if closed is true

	// lastcols is only used in Scan, Next, and NextResultSet which are expected
	// not to be called concurrently.
	lastcols []driver.Value
}
```

Rows is the result of a query. Its cursor starts before the first row of the result set. Use Next to advance from row to row. 

#### <a id="Rows.Close" href="#Rows.Close">func (rs *Rows) Close() error</a>

```
searchKey: sql.Rows.Close
tags: [method]
```

```Go
func (rs *Rows) Close() error
```

Close closes the Rows, preventing further enumeration. If Next is called and returns false and there are no further result sets, the Rows are closed automatically and it will suffice to check the result of Err. Close is idempotent and does not affect the result of Err. 

#### <a id="Rows.ColumnTypes" href="#Rows.ColumnTypes">func (rs *Rows) ColumnTypes() ([]*ColumnType, error)</a>

```
searchKey: sql.Rows.ColumnTypes
tags: [method]
```

```Go
func (rs *Rows) ColumnTypes() ([]*ColumnType, error)
```

ColumnTypes returns column information such as column type, length, and nullable. Some information may not be available from some drivers. 

#### <a id="Rows.Columns" href="#Rows.Columns">func (rs *Rows) Columns() ([]string, error)</a>

```
searchKey: sql.Rows.Columns
tags: [method]
```

```Go
func (rs *Rows) Columns() ([]string, error)
```

Columns returns the column names. Columns returns an error if the rows are closed. 

#### <a id="Rows.Err" href="#Rows.Err">func (rs *Rows) Err() error</a>

```
searchKey: sql.Rows.Err
tags: [method]
```

```Go
func (rs *Rows) Err() error
```

Err returns the error, if any, that was encountered during iteration. Err may be called after an explicit or implicit Close. 

#### <a id="Rows.Next" href="#Rows.Next">func (rs *Rows) Next() bool</a>

```
searchKey: sql.Rows.Next
tags: [method]
```

```Go
func (rs *Rows) Next() bool
```

Next prepares the next result row for reading with the Scan method. It returns true on success, or false if there is no next result row or an error happened while preparing it. Err should be consulted to distinguish between the two cases. 

Every call to Scan, even the first one, must be preceded by a call to Next. 

#### <a id="Rows.NextResultSet" href="#Rows.NextResultSet">func (rs *Rows) NextResultSet() bool</a>

```
searchKey: sql.Rows.NextResultSet
tags: [method]
```

```Go
func (rs *Rows) NextResultSet() bool
```

NextResultSet prepares the next result set for reading. It reports whether there is further result sets, or false if there is no further result set or if there is an error advancing to it. The Err method should be consulted to distinguish between the two cases. 

After calling NextResultSet, the Next method should always be called before scanning. If there are further result sets they may not have rows in the result set. 

#### <a id="Rows.Scan" href="#Rows.Scan">func (rs *Rows) Scan(dest ...interface{}) error</a>

```
searchKey: sql.Rows.Scan
tags: [method]
```

```Go
func (rs *Rows) Scan(dest ...interface{}) error
```

Scan copies the columns in the current row into the values pointed at by dest. The number of values in dest must be the same as the number of columns in Rows. 

Scan converts columns read from the database into the following common Go types and special types provided by the sql package: 

```
*string
*[]byte
*int, *int8, *int16, *int32, *int64
*uint, *uint8, *uint16, *uint32, *uint64
*bool
*float32, *float64
*interface{}
*RawBytes
*Rows (cursor value)
any type implementing Scanner (see Scanner docs)

```
In the most simple case, if the type of the value from the source column is an integer, bool or string type T and dest is of type *T, Scan simply assigns the value through the pointer. 

Scan also converts between string and numeric types, as long as no information would be lost. While Scan stringifies all numbers scanned from numeric database columns into *string, scans into numeric types are checked for overflow. For example, a float64 with value 300 or a string with value "300" can scan into a uint16, but not into a uint8, though float64(255) or "255" can scan into a uint8. One exception is that scans of some float64 numbers to strings may lose information when stringifying. In general, scan floating point columns into *float64. 

If a dest argument has type *[]byte, Scan saves in that argument a copy of the corresponding data. The copy is owned by the caller and can be modified and held indefinitely. The copy can be avoided by using an argument of type *RawBytes instead; see the documentation for RawBytes for restrictions on its use. 

If an argument has type *interface{}, Scan copies the value provided by the underlying driver without conversion. When scanning from a source value of type []byte to *interface{}, a copy of the slice is made and the caller owns the result. 

Source values of type time.Time may be scanned into values of type *time.Time, *interface{}, *string, or *[]byte. When converting to the latter two, time.RFC3339Nano is used. 

Source values of type bool may be scanned into types *bool, *interface{}, *string, *[]byte, or *RawBytes. 

For scanning into *bool, the source may be true, false, 1, 0, or string inputs parseable by strconv.ParseBool. 

Scan can also convert a cursor returned from a query, such as "select cursor(select * from my_table) from dual", into a *Rows value that can itself be scanned from. The parent select query will close any cursor *Rows if the parent *Rows is closed. 

If any of the first arguments implementing Scanner returns an error, that error will be wrapped in the returned error 

#### <a id="Rows.awaitDone" href="#Rows.awaitDone">func (rs *Rows) awaitDone(ctx, txctx context.Context)</a>

```
searchKey: sql.Rows.awaitDone
tags: [method private]
```

```Go
func (rs *Rows) awaitDone(ctx, txctx context.Context)
```

awaitDone blocks until either ctx or txctx is canceled. The ctx is provided from the query context and is canceled when the query Rows is closed. If the query was issued in a transaction, the transaction's context is also provided in txctx to ensure Rows is closed if the Tx is closed. 

#### <a id="Rows.close" href="#Rows.close">func (rs *Rows) close(err error) error</a>

```
searchKey: sql.Rows.close
tags: [method private]
```

```Go
func (rs *Rows) close(err error) error
```

#### <a id="Rows.initContextClose" href="#Rows.initContextClose">func (rs *Rows) initContextClose(ctx, txctx context.Context)</a>

```
searchKey: sql.Rows.initContextClose
tags: [method private]
```

```Go
func (rs *Rows) initContextClose(ctx, txctx context.Context)
```

#### <a id="Rows.lasterrOrErrLocked" href="#Rows.lasterrOrErrLocked">func (rs *Rows) lasterrOrErrLocked(err error) error</a>

```
searchKey: sql.Rows.lasterrOrErrLocked
tags: [method private]
```

```Go
func (rs *Rows) lasterrOrErrLocked(err error) error
```

lasterrOrErrLocked returns either lasterr or the provided err. rs.closemu must be read-locked. 

#### <a id="Rows.nextLocked" href="#Rows.nextLocked">func (rs *Rows) nextLocked() (doClose, ok bool)</a>

```
searchKey: sql.Rows.nextLocked
tags: [method private]
```

```Go
func (rs *Rows) nextLocked() (doClose, ok bool)
```

### <a id="Scanner" href="#Scanner">type Scanner interface</a>

```
searchKey: sql.Scanner
tags: [interface]
```

```Go
type Scanner interface {
	// Scan assigns a value from a database driver.
	//
	// The src value will be of one of the following types:
	//
	//    int64
	//    float64
	//    bool
	//    []byte
	//    string
	//    time.Time
	//    nil - for NULL values
	//
	// An error should be returned if the value cannot be stored
	// without loss of information.
	//
	// Reference types such as []byte are only valid until the next call to Scan
	// and should not be retained. Their underlying memory is owned by the driver.
	// If retention is necessary, copy their values before the next call to Scan.
	Scan(src interface{}) error
}
```

Scanner is an interface used by Scan. 

### <a id="Stmt" href="#Stmt">type Stmt struct</a>

```
searchKey: sql.Stmt
tags: [struct]
```

```Go
type Stmt struct {
	// Immutable:
	db        *DB    // where we came from
	query     string // that created the Stmt
	stickyErr error  // if non-nil, this error is returned for all operations

	closemu sync.RWMutex // held exclusively during close, for read otherwise.

	// If Stmt is prepared on a Tx or Conn then cg is present and will
	// only ever grab a connection from cg.
	// If cg is nil then the Stmt must grab an arbitrary connection
	// from db and determine if it must prepare the stmt again by
	// inspecting css.
	cg   stmtConnGrabber
	cgds *driverStmt

	// parentStmt is set when a transaction-specific statement
	// is requested from an identical statement prepared on the same
	// conn. parentStmt is used to track the dependency of this statement
	// on its originating ("parent") statement so that parentStmt may
	// be closed by the user without them having to know whether or not
	// any transactions are still using it.
	parentStmt *Stmt

	mu     sync.Mutex // protects the rest of the fields
	closed bool

	// css is a list of underlying driver statement interfaces
	// that are valid on particular connections. This is only
	// used if cg == nil and one is found that has idle
	// connections. If cg != nil, cgds is always used.
	css []connStmt

	// lastNumClosed is copied from db.numClosed when Stmt is created
	// without tx and closed connections in css are removed.
	lastNumClosed uint64
}
```

Stmt is a prepared statement. A Stmt is safe for concurrent use by multiple goroutines. 

If a Stmt is prepared on a Tx or Conn, it will be bound to a single underlying connection forever. If the Tx or Conn closes, the Stmt will become unusable and all operations will return an error. If a Stmt is prepared on a DB, it will remain usable for the lifetime of the DB. When the Stmt needs to execute on a new underlying connection, it will prepare itself on the new connection automatically. 

#### <a id="Stmt.Close" href="#Stmt.Close">func (s *Stmt) Close() error</a>

```
searchKey: sql.Stmt.Close
tags: [method]
```

```Go
func (s *Stmt) Close() error
```

Close closes the statement. 

#### <a id="Stmt.Exec" href="#Stmt.Exec">func (s *Stmt) Exec(args ...interface{}) (Result, error)</a>

```
searchKey: sql.Stmt.Exec
tags: [method]
```

```Go
func (s *Stmt) Exec(args ...interface{}) (Result, error)
```

Exec executes a prepared statement with the given arguments and returns a Result summarizing the effect of the statement. 

Exec uses context.Background internally; to specify the context, use ExecContext. 

#### <a id="Stmt.ExecContext" href="#Stmt.ExecContext">func (s *Stmt) ExecContext(ctx context.Context, args ...interface{}) (Result, error)</a>

```
searchKey: sql.Stmt.ExecContext
tags: [method]
```

```Go
func (s *Stmt) ExecContext(ctx context.Context, args ...interface{}) (Result, error)
```

ExecContext executes a prepared statement with the given arguments and returns a Result summarizing the effect of the statement. 

#### <a id="Stmt.Query" href="#Stmt.Query">func (s *Stmt) Query(args ...interface{}) (*Rows, error)</a>

```
searchKey: sql.Stmt.Query
tags: [method]
```

```Go
func (s *Stmt) Query(args ...interface{}) (*Rows, error)
```

Query executes a prepared query statement with the given arguments and returns the query results as a *Rows. 

Query uses context.Background internally; to specify the context, use QueryContext. 

#### <a id="Stmt.QueryContext" href="#Stmt.QueryContext">func (s *Stmt) QueryContext(ctx context.Context, args ...interface{}) (*Rows, error)</a>

```
searchKey: sql.Stmt.QueryContext
tags: [method]
```

```Go
func (s *Stmt) QueryContext(ctx context.Context, args ...interface{}) (*Rows, error)
```

QueryContext executes a prepared query statement with the given arguments and returns the query results as a *Rows. 

#### <a id="Stmt.QueryRow" href="#Stmt.QueryRow">func (s *Stmt) QueryRow(args ...interface{}) *Row</a>

```
searchKey: sql.Stmt.QueryRow
tags: [method]
```

```Go
func (s *Stmt) QueryRow(args ...interface{}) *Row
```

QueryRow executes a prepared query statement with the given arguments. If an error occurs during the execution of the statement, that error will be returned by a call to Scan on the returned *Row, which is always non-nil. If the query selects no rows, the *Row's Scan will return ErrNoRows. Otherwise, the *Row's Scan scans the first selected row and discards the rest. 

Example usage: 

```
var name string
err := nameByUseridStmt.QueryRow(id).Scan(&name)

```
QueryRow uses context.Background internally; to specify the context, use QueryRowContext. 

#### <a id="Stmt.QueryRowContext" href="#Stmt.QueryRowContext">func (s *Stmt) QueryRowContext(ctx context.Context, args ...interface{}) *Row</a>

```
searchKey: sql.Stmt.QueryRowContext
tags: [method]
```

```Go
func (s *Stmt) QueryRowContext(ctx context.Context, args ...interface{}) *Row
```

QueryRowContext executes a prepared query statement with the given arguments. If an error occurs during the execution of the statement, that error will be returned by a call to Scan on the returned *Row, which is always non-nil. If the query selects no rows, the *Row's Scan will return ErrNoRows. Otherwise, the *Row's Scan scans the first selected row and discards the rest. 

#### <a id="Stmt.connStmt" href="#Stmt.connStmt">func (s *Stmt) connStmt(ctx context.Context, strategy connReuseStrategy) (dc *driverConn, releaseConn func(error), ds *driverStmt, err error)</a>

```
searchKey: sql.Stmt.connStmt
tags: [method private]
```

```Go
func (s *Stmt) connStmt(ctx context.Context, strategy connReuseStrategy) (dc *driverConn, releaseConn func(error), ds *driverStmt, err error)
```

connStmt returns a free driver connection on which to execute the statement, a function to call to release the connection, and a statement bound to that connection. 

#### <a id="Stmt.finalClose" href="#Stmt.finalClose">func (s *Stmt) finalClose() error</a>

```
searchKey: sql.Stmt.finalClose
tags: [method private]
```

```Go
func (s *Stmt) finalClose() error
```

#### <a id="Stmt.prepareOnConnLocked" href="#Stmt.prepareOnConnLocked">func (s *Stmt) prepareOnConnLocked(ctx context.Context, dc *driverConn) (*driverStmt, error)</a>

```
searchKey: sql.Stmt.prepareOnConnLocked
tags: [method private]
```

```Go
func (s *Stmt) prepareOnConnLocked(ctx context.Context, dc *driverConn) (*driverStmt, error)
```

prepareOnConnLocked prepares the query in Stmt s on dc and adds it to the list of open connStmt on the statement. It assumes the caller is holding the lock on dc. 

#### <a id="Stmt.removeClosedStmtLocked" href="#Stmt.removeClosedStmtLocked">func (s *Stmt) removeClosedStmtLocked()</a>

```
searchKey: sql.Stmt.removeClosedStmtLocked
tags: [method private]
```

```Go
func (s *Stmt) removeClosedStmtLocked()
```

removeClosedStmtLocked removes closed conns in s.css. 

To avoid lock contention on DB.mu, we do it only when s.db.numClosed - s.lastNum is large enough. 

### <a id="Tx" href="#Tx">type Tx struct</a>

```
searchKey: sql.Tx
tags: [struct]
```

```Go
type Tx struct {
	db *DB

	// closemu prevents the transaction from closing while there
	// is an active query. It is held for read during queries
	// and exclusively during close.
	closemu sync.RWMutex

	// dc is owned exclusively until Commit or Rollback, at which point
	// it's returned with putConn.
	dc  *driverConn
	txi driver.Tx

	// releaseConn is called once the Tx is closed to release
	// any held driverConn back to the pool.
	releaseConn func(error)

	// done transitions from 0 to 1 exactly once, on Commit
	// or Rollback. once done, all operations fail with
	// ErrTxDone.
	// Use atomic operations on value when checking value.
	done int32

	// keepConnOnRollback is true if the driver knows
	// how to reset the connection's session and if need be discard
	// the connection.
	keepConnOnRollback bool

	// All Stmts prepared for this transaction. These will be closed after the
	// transaction has been committed or rolled back.
	stmts struct {
		sync.Mutex
		v []*Stmt
	}

	// cancel is called after done transitions from 0 to 1.
	cancel func()

	// ctx lives for the life of the transaction.
	ctx context.Context
}
```

Tx is an in-progress database transaction. 

A transaction must end with a call to Commit or Rollback. 

After a call to Commit or Rollback, all operations on the transaction fail with ErrTxDone. 

The statements prepared for a transaction by calling the transaction's Prepare or Stmt methods are closed by the call to Commit or Rollback. 

#### <a id="Tx.Commit" href="#Tx.Commit">func (tx *Tx) Commit() error</a>

```
searchKey: sql.Tx.Commit
tags: [method]
```

```Go
func (tx *Tx) Commit() error
```

Commit commits the transaction. 

#### <a id="Tx.Exec" href="#Tx.Exec">func (tx *Tx) Exec(query string, args ...interface{}) (Result, error)</a>

```
searchKey: sql.Tx.Exec
tags: [method]
```

```Go
func (tx *Tx) Exec(query string, args ...interface{}) (Result, error)
```

Exec executes a query that doesn't return rows. For example: an INSERT and UPDATE. 

Exec uses context.Background internally; to specify the context, use ExecContext. 

#### <a id="Tx.ExecContext" href="#Tx.ExecContext">func (tx *Tx) ExecContext(ctx context.Context, query string, args ...interface{}) (Result, error)</a>

```
searchKey: sql.Tx.ExecContext
tags: [method]
```

```Go
func (tx *Tx) ExecContext(ctx context.Context, query string, args ...interface{}) (Result, error)
```

ExecContext executes a query that doesn't return rows. For example: an INSERT and UPDATE. 

#### <a id="Tx.Prepare" href="#Tx.Prepare">func (tx *Tx) Prepare(query string) (*Stmt, error)</a>

```
searchKey: sql.Tx.Prepare
tags: [method]
```

```Go
func (tx *Tx) Prepare(query string) (*Stmt, error)
```

Prepare creates a prepared statement for use within a transaction. 

The returned statement operates within the transaction and can no longer be used once the transaction has been committed or rolled back. 

To use an existing prepared statement on this transaction, see Tx.Stmt. 

Prepare uses context.Background internally; to specify the context, use PrepareContext. 

#### <a id="Tx.PrepareContext" href="#Tx.PrepareContext">func (tx *Tx) PrepareContext(ctx context.Context, query string) (*Stmt, error)</a>

```
searchKey: sql.Tx.PrepareContext
tags: [method]
```

```Go
func (tx *Tx) PrepareContext(ctx context.Context, query string) (*Stmt, error)
```

PrepareContext creates a prepared statement for use within a transaction. 

The returned statement operates within the transaction and will be closed when the transaction has been committed or rolled back. 

To use an existing prepared statement on this transaction, see Tx.Stmt. 

The provided context will be used for the preparation of the context, not for the execution of the returned statement. The returned statement will run in the transaction context. 

#### <a id="Tx.Query" href="#Tx.Query">func (tx *Tx) Query(query string, args ...interface{}) (*Rows, error)</a>

```
searchKey: sql.Tx.Query
tags: [method]
```

```Go
func (tx *Tx) Query(query string, args ...interface{}) (*Rows, error)
```

Query executes a query that returns rows, typically a SELECT. 

Query uses context.Background internally; to specify the context, use QueryContext. 

#### <a id="Tx.QueryContext" href="#Tx.QueryContext">func (tx *Tx) QueryContext(ctx context.Context, query string, args ...interface{}) (*Rows, error)</a>

```
searchKey: sql.Tx.QueryContext
tags: [method]
```

```Go
func (tx *Tx) QueryContext(ctx context.Context, query string, args ...interface{}) (*Rows, error)
```

QueryContext executes a query that returns rows, typically a SELECT. 

#### <a id="Tx.QueryRow" href="#Tx.QueryRow">func (tx *Tx) QueryRow(query string, args ...interface{}) *Row</a>

```
searchKey: sql.Tx.QueryRow
tags: [method]
```

```Go
func (tx *Tx) QueryRow(query string, args ...interface{}) *Row
```

QueryRow executes a query that is expected to return at most one row. QueryRow always returns a non-nil value. Errors are deferred until Row's Scan method is called. If the query selects no rows, the *Row's Scan will return ErrNoRows. Otherwise, the *Row's Scan scans the first selected row and discards the rest. 

QueryRow uses context.Background internally; to specify the context, use QueryRowContext. 

#### <a id="Tx.QueryRowContext" href="#Tx.QueryRowContext">func (tx *Tx) QueryRowContext(ctx context.Context, query string, args ...interface{}) *Row</a>

```
searchKey: sql.Tx.QueryRowContext
tags: [method]
```

```Go
func (tx *Tx) QueryRowContext(ctx context.Context, query string, args ...interface{}) *Row
```

QueryRowContext executes a query that is expected to return at most one row. QueryRowContext always returns a non-nil value. Errors are deferred until Row's Scan method is called. If the query selects no rows, the *Row's Scan will return ErrNoRows. Otherwise, the *Row's Scan scans the first selected row and discards the rest. 

#### <a id="Tx.Rollback" href="#Tx.Rollback">func (tx *Tx) Rollback() error</a>

```
searchKey: sql.Tx.Rollback
tags: [method]
```

```Go
func (tx *Tx) Rollback() error
```

Rollback aborts the transaction. 

#### <a id="Tx.Stmt" href="#Tx.Stmt">func (tx *Tx) Stmt(stmt *Stmt) *Stmt</a>

```
searchKey: sql.Tx.Stmt
tags: [method]
```

```Go
func (tx *Tx) Stmt(stmt *Stmt) *Stmt
```

Stmt returns a transaction-specific prepared statement from an existing statement. 

Example: 

```
updateMoney, err := db.Prepare("UPDATE balance SET money=money+? WHERE id=?")
...
tx, err := db.Begin()
...
res, err := tx.Stmt(updateMoney).Exec(123.45, 98293203)

```
The returned statement operates within the transaction and will be closed when the transaction has been committed or rolled back. 

Stmt uses context.Background internally; to specify the context, use StmtContext. 

#### <a id="Tx.StmtContext" href="#Tx.StmtContext">func (tx *Tx) StmtContext(ctx context.Context, stmt *Stmt) *Stmt</a>

```
searchKey: sql.Tx.StmtContext
tags: [method]
```

```Go
func (tx *Tx) StmtContext(ctx context.Context, stmt *Stmt) *Stmt
```

StmtContext returns a transaction-specific prepared statement from an existing statement. 

Example: 

```
updateMoney, err := db.Prepare("UPDATE balance SET money=money+? WHERE id=?")
...
tx, err := db.Begin()
...
res, err := tx.StmtContext(ctx, updateMoney).Exec(123.45, 98293203)

```
The provided context is used for the preparation of the statement, not for the execution of the statement. 

The returned statement operates within the transaction and will be closed when the transaction has been committed or rolled back. 

#### <a id="Tx.awaitDone" href="#Tx.awaitDone">func (tx *Tx) awaitDone()</a>

```
searchKey: sql.Tx.awaitDone
tags: [method private]
```

```Go
func (tx *Tx) awaitDone()
```

awaitDone blocks until the context in Tx is canceled and rolls back the transaction if it's not already done. 

#### <a id="Tx.close" href="#Tx.close">func (tx *Tx) close(err error)</a>

```
searchKey: sql.Tx.close
tags: [method private]
```

```Go
func (tx *Tx) close(err error)
```

close returns the connection to the pool and must only be called by Tx.rollback or Tx.Commit while tx is already canceled and won't be executed concurrently. 

#### <a id="Tx.closePrepared" href="#Tx.closePrepared">func (tx *Tx) closePrepared()</a>

```
searchKey: sql.Tx.closePrepared
tags: [method private]
```

```Go
func (tx *Tx) closePrepared()
```

Closes all Stmts prepared for this transaction. 

#### <a id="Tx.closemuRUnlockRelease" href="#Tx.closemuRUnlockRelease">func (tx *Tx) closemuRUnlockRelease(error)</a>

```
searchKey: sql.Tx.closemuRUnlockRelease
tags: [method private]
```

```Go
func (tx *Tx) closemuRUnlockRelease(error)
```

closemuRUnlockRelease is used as a func(error) method value in ExecContext and QueryContext. Unlocking in the releaseConn keeps the driver conn from being returned to the connection pool until the Rows has been closed. 

#### <a id="Tx.grabConn" href="#Tx.grabConn">func (tx *Tx) grabConn(ctx context.Context) (*driverConn, releaseConn, error)</a>

```
searchKey: sql.Tx.grabConn
tags: [method private]
```

```Go
func (tx *Tx) grabConn(ctx context.Context) (*driverConn, releaseConn, error)
```

#### <a id="Tx.isDone" href="#Tx.isDone">func (tx *Tx) isDone() bool</a>

```
searchKey: sql.Tx.isDone
tags: [method private]
```

```Go
func (tx *Tx) isDone() bool
```

#### <a id="Tx.rollback" href="#Tx.rollback">func (tx *Tx) rollback(discardConn bool) error</a>

```
searchKey: sql.Tx.rollback
tags: [method private]
```

```Go
func (tx *Tx) rollback(discardConn bool) error
```

rollback aborts the transaction and optionally forces the pool to discard the connection. 

#### <a id="Tx.txCtx" href="#Tx.txCtx">func (tx *Tx) txCtx() context.Context</a>

```
searchKey: sql.Tx.txCtx
tags: [method private]
```

```Go
func (tx *Tx) txCtx() context.Context
```

### <a id="TxOptions" href="#TxOptions">type TxOptions struct</a>

```
searchKey: sql.TxOptions
tags: [struct]
```

```Go
type TxOptions struct {
	// Isolation is the transaction isolation level.
	// If zero, the driver or database's default level is used.
	Isolation IsolationLevel
	ReadOnly  bool
}
```

TxOptions holds the transaction options to be used in DB.BeginTx. 

### <a id="Valuer_P" href="#Valuer_P">type Valuer_P string</a>

```
searchKey: sql.Valuer_P
tags: [string private]
```

```Go
type Valuer_P string
```

#### <a id="Valuer_P.Value" href="#Valuer_P.Value">func (p *Valuer_P) Value() (driver.Value, error)</a>

```
searchKey: sql.Valuer_P.Value
tags: [method private]
```

```Go
func (p *Valuer_P) Value() (driver.Value, error)
```

### <a id="Valuer_V" href="#Valuer_V">type Valuer_V string</a>

```
searchKey: sql.Valuer_V
tags: [string private]
```

```Go
type Valuer_V string
```

#### <a id="Valuer_V.Value" href="#Valuer_V.Value">func (v Valuer_V) Value() (driver.Value, error)</a>

```
searchKey: sql.Valuer_V.Value
tags: [method private]
```

```Go
func (v Valuer_V) Value() (driver.Value, error)
```

### <a id="alwaysErrScanner" href="#alwaysErrScanner">type alwaysErrScanner struct{}</a>

```
searchKey: sql.alwaysErrScanner
tags: [struct private]
```

```Go
type alwaysErrScanner struct{}
```

#### <a id="alwaysErrScanner.Scan" href="#alwaysErrScanner.Scan">func (alwaysErrScanner) Scan(interface{}) error</a>

```
searchKey: sql.alwaysErrScanner.Scan
tags: [method private]
```

```Go
func (alwaysErrScanner) Scan(interface{}) error
```

### <a id="anyTypeConverter" href="#anyTypeConverter">type anyTypeConverter struct{}</a>

```
searchKey: sql.anyTypeConverter
tags: [struct private]
```

```Go
type anyTypeConverter struct{}
```

#### <a id="anyTypeConverter.ConvertValue" href="#anyTypeConverter.ConvertValue">func (anyTypeConverter) ConvertValue(v interface{}) (driver.Value, error)</a>

```
searchKey: sql.anyTypeConverter.ConvertValue
tags: [method private]
```

```Go
func (anyTypeConverter) ConvertValue(v interface{}) (driver.Value, error)
```

### <a id="badConn" href="#badConn">type badConn struct{}</a>

```
searchKey: sql.badConn
tags: [struct private]
```

```Go
type badConn struct{}
```

badConn implements a bad driver.Conn, for TestBadDriver. The Exec method panics. 

#### <a id="badConn.Begin" href="#badConn.Begin">func (bc badConn) Begin() (driver.Tx, error)</a>

```
searchKey: sql.badConn.Begin
tags: [method private]
```

```Go
func (bc badConn) Begin() (driver.Tx, error)
```

#### <a id="badConn.Close" href="#badConn.Close">func (bc badConn) Close() error</a>

```
searchKey: sql.badConn.Close
tags: [method private]
```

```Go
func (bc badConn) Close() error
```

#### <a id="badConn.Exec" href="#badConn.Exec">func (bc badConn) Exec(query string, args []driver.Value) (driver.Result, error)</a>

```
searchKey: sql.badConn.Exec
tags: [method private]
```

```Go
func (bc badConn) Exec(query string, args []driver.Value) (driver.Result, error)
```

#### <a id="badConn.Prepare" href="#badConn.Prepare">func (bc badConn) Prepare(query string) (driver.Stmt, error)</a>

```
searchKey: sql.badConn.Prepare
tags: [method private]
```

```Go
func (bc badConn) Prepare(query string) (driver.Stmt, error)
```

### <a id="badDriver" href="#badDriver">type badDriver struct{}</a>

```
searchKey: sql.badDriver
tags: [struct private]
```

```Go
type badDriver struct{}
```

badDriver is a driver.Driver that uses badConn. 

#### <a id="badDriver.Open" href="#badDriver.Open">func (bd badDriver) Open(name string) (driver.Conn, error)</a>

```
searchKey: sql.badDriver.Open
tags: [method private]
```

```Go
func (bd badDriver) Open(name string) (driver.Conn, error)
```

### <a id="boundCol" href="#boundCol">type boundCol struct</a>

```
searchKey: sql.boundCol
tags: [struct private]
```

```Go
type boundCol struct {
	Column      string
	Placeholder string
	Ordinal     int
}
```

### <a id="ccChecker" href="#ccChecker">type ccChecker struct</a>

```
searchKey: sql.ccChecker
tags: [struct private]
```

```Go
type ccChecker struct {
	cci  driver.ColumnConverter
	want int
}
```

ccChecker wraps the driver.ColumnConverter and allows it to be used as if it were a NamedValueChecker. If the driver ColumnConverter is not present then the NamedValueChecker will return driver.ErrSkip. 

#### <a id="ccChecker.CheckNamedValue" href="#ccChecker.CheckNamedValue">func (c ccChecker) CheckNamedValue(nv *driver.NamedValue) error</a>

```
searchKey: sql.ccChecker.CheckNamedValue
tags: [method private]
```

```Go
func (c ccChecker) CheckNamedValue(nv *driver.NamedValue) error
```

### <a id="concurrentDBExecTest" href="#concurrentDBExecTest">type concurrentDBExecTest struct</a>

```
searchKey: sql.concurrentDBExecTest
tags: [struct private]
```

```Go
type concurrentDBExecTest struct {
	db *DB
}
```

#### <a id="concurrentDBExecTest.finish" href="#concurrentDBExecTest.finish">func (c *concurrentDBExecTest) finish(t testing.TB)</a>

```
searchKey: sql.concurrentDBExecTest.finish
tags: [method private]
```

```Go
func (c *concurrentDBExecTest) finish(t testing.TB)
```

#### <a id="concurrentDBExecTest.init.sql_test.go.0xc039566370" href="#concurrentDBExecTest.init.sql_test.go.0xc039566370">func (c *concurrentDBExecTest) init(t testing.TB, db *DB)</a>

```
searchKey: sql.concurrentDBExecTest.init
tags: [method private]
```

```Go
func (c *concurrentDBExecTest) init(t testing.TB, db *DB)
```

#### <a id="concurrentDBExecTest.test" href="#concurrentDBExecTest.test">func (c *concurrentDBExecTest) test(t testing.TB) error</a>

```
searchKey: sql.concurrentDBExecTest.test
tags: [method private]
```

```Go
func (c *concurrentDBExecTest) test(t testing.TB) error
```

### <a id="concurrentDBQueryTest" href="#concurrentDBQueryTest">type concurrentDBQueryTest struct</a>

```
searchKey: sql.concurrentDBQueryTest
tags: [struct private]
```

```Go
type concurrentDBQueryTest struct {
	db *DB
}
```

#### <a id="concurrentDBQueryTest.finish" href="#concurrentDBQueryTest.finish">func (c *concurrentDBQueryTest) finish(t testing.TB)</a>

```
searchKey: sql.concurrentDBQueryTest.finish
tags: [method private]
```

```Go
func (c *concurrentDBQueryTest) finish(t testing.TB)
```

#### <a id="concurrentDBQueryTest.init.sql_test.go.0xc039566370" href="#concurrentDBQueryTest.init.sql_test.go.0xc039566370">func (c *concurrentDBQueryTest) init(t testing.TB, db *DB)</a>

```
searchKey: sql.concurrentDBQueryTest.init
tags: [method private]
```

```Go
func (c *concurrentDBQueryTest) init(t testing.TB, db *DB)
```

#### <a id="concurrentDBQueryTest.test" href="#concurrentDBQueryTest.test">func (c *concurrentDBQueryTest) test(t testing.TB) error</a>

```
searchKey: sql.concurrentDBQueryTest.test
tags: [method private]
```

```Go
func (c *concurrentDBQueryTest) test(t testing.TB) error
```

### <a id="concurrentRandomTest" href="#concurrentRandomTest">type concurrentRandomTest struct</a>

```
searchKey: sql.concurrentRandomTest
tags: [struct private]
```

```Go
type concurrentRandomTest struct {
	tests []concurrentTest
}
```

#### <a id="concurrentRandomTest.finish" href="#concurrentRandomTest.finish">func (c *concurrentRandomTest) finish(t testing.TB)</a>

```
searchKey: sql.concurrentRandomTest.finish
tags: [method private]
```

```Go
func (c *concurrentRandomTest) finish(t testing.TB)
```

#### <a id="concurrentRandomTest.init.sql_test.go.0xc039566370" href="#concurrentRandomTest.init.sql_test.go.0xc039566370">func (c *concurrentRandomTest) init(t testing.TB, db *DB)</a>

```
searchKey: sql.concurrentRandomTest.init
tags: [method private]
```

```Go
func (c *concurrentRandomTest) init(t testing.TB, db *DB)
```

#### <a id="concurrentRandomTest.test" href="#concurrentRandomTest.test">func (c *concurrentRandomTest) test(t testing.TB) error</a>

```
searchKey: sql.concurrentRandomTest.test
tags: [method private]
```

```Go
func (c *concurrentRandomTest) test(t testing.TB) error
```

### <a id="concurrentStmtExecTest" href="#concurrentStmtExecTest">type concurrentStmtExecTest struct</a>

```
searchKey: sql.concurrentStmtExecTest
tags: [struct private]
```

```Go
type concurrentStmtExecTest struct {
	db   *DB
	stmt *Stmt
}
```

#### <a id="concurrentStmtExecTest.finish" href="#concurrentStmtExecTest.finish">func (c *concurrentStmtExecTest) finish(t testing.TB)</a>

```
searchKey: sql.concurrentStmtExecTest.finish
tags: [method private]
```

```Go
func (c *concurrentStmtExecTest) finish(t testing.TB)
```

#### <a id="concurrentStmtExecTest.init.sql_test.go.0xc039566370" href="#concurrentStmtExecTest.init.sql_test.go.0xc039566370">func (c *concurrentStmtExecTest) init(t testing.TB, db *DB)</a>

```
searchKey: sql.concurrentStmtExecTest.init
tags: [method private]
```

```Go
func (c *concurrentStmtExecTest) init(t testing.TB, db *DB)
```

#### <a id="concurrentStmtExecTest.test" href="#concurrentStmtExecTest.test">func (c *concurrentStmtExecTest) test(t testing.TB) error</a>

```
searchKey: sql.concurrentStmtExecTest.test
tags: [method private]
```

```Go
func (c *concurrentStmtExecTest) test(t testing.TB) error
```

### <a id="concurrentStmtQueryTest" href="#concurrentStmtQueryTest">type concurrentStmtQueryTest struct</a>

```
searchKey: sql.concurrentStmtQueryTest
tags: [struct private]
```

```Go
type concurrentStmtQueryTest struct {
	db   *DB
	stmt *Stmt
}
```

#### <a id="concurrentStmtQueryTest.finish" href="#concurrentStmtQueryTest.finish">func (c *concurrentStmtQueryTest) finish(t testing.TB)</a>

```
searchKey: sql.concurrentStmtQueryTest.finish
tags: [method private]
```

```Go
func (c *concurrentStmtQueryTest) finish(t testing.TB)
```

#### <a id="concurrentStmtQueryTest.init.sql_test.go.0xc039566370" href="#concurrentStmtQueryTest.init.sql_test.go.0xc039566370">func (c *concurrentStmtQueryTest) init(t testing.TB, db *DB)</a>

```
searchKey: sql.concurrentStmtQueryTest.init
tags: [method private]
```

```Go
func (c *concurrentStmtQueryTest) init(t testing.TB, db *DB)
```

#### <a id="concurrentStmtQueryTest.test" href="#concurrentStmtQueryTest.test">func (c *concurrentStmtQueryTest) test(t testing.TB) error</a>

```
searchKey: sql.concurrentStmtQueryTest.test
tags: [method private]
```

```Go
func (c *concurrentStmtQueryTest) test(t testing.TB) error
```

### <a id="concurrentTest" href="#concurrentTest">type concurrentTest interface</a>

```
searchKey: sql.concurrentTest
tags: [interface private]
```

```Go
type concurrentTest interface {
	init(t testing.TB, db *DB)
	finish(t testing.TB)
	test(t testing.TB) error
}
```

### <a id="concurrentTxExecTest" href="#concurrentTxExecTest">type concurrentTxExecTest struct</a>

```
searchKey: sql.concurrentTxExecTest
tags: [struct private]
```

```Go
type concurrentTxExecTest struct {
	db *DB
	tx *Tx
}
```

#### <a id="concurrentTxExecTest.finish" href="#concurrentTxExecTest.finish">func (c *concurrentTxExecTest) finish(t testing.TB)</a>

```
searchKey: sql.concurrentTxExecTest.finish
tags: [method private]
```

```Go
func (c *concurrentTxExecTest) finish(t testing.TB)
```

#### <a id="concurrentTxExecTest.init.sql_test.go.0xc039566370" href="#concurrentTxExecTest.init.sql_test.go.0xc039566370">func (c *concurrentTxExecTest) init(t testing.TB, db *DB)</a>

```
searchKey: sql.concurrentTxExecTest.init
tags: [method private]
```

```Go
func (c *concurrentTxExecTest) init(t testing.TB, db *DB)
```

#### <a id="concurrentTxExecTest.test" href="#concurrentTxExecTest.test">func (c *concurrentTxExecTest) test(t testing.TB) error</a>

```
searchKey: sql.concurrentTxExecTest.test
tags: [method private]
```

```Go
func (c *concurrentTxExecTest) test(t testing.TB) error
```

### <a id="concurrentTxQueryTest" href="#concurrentTxQueryTest">type concurrentTxQueryTest struct</a>

```
searchKey: sql.concurrentTxQueryTest
tags: [struct private]
```

```Go
type concurrentTxQueryTest struct {
	db *DB
	tx *Tx
}
```

#### <a id="concurrentTxQueryTest.finish" href="#concurrentTxQueryTest.finish">func (c *concurrentTxQueryTest) finish(t testing.TB)</a>

```
searchKey: sql.concurrentTxQueryTest.finish
tags: [method private]
```

```Go
func (c *concurrentTxQueryTest) finish(t testing.TB)
```

#### <a id="concurrentTxQueryTest.init.sql_test.go.0xc039566370" href="#concurrentTxQueryTest.init.sql_test.go.0xc039566370">func (c *concurrentTxQueryTest) init(t testing.TB, db *DB)</a>

```
searchKey: sql.concurrentTxQueryTest.init
tags: [method private]
```

```Go
func (c *concurrentTxQueryTest) init(t testing.TB, db *DB)
```

#### <a id="concurrentTxQueryTest.test" href="#concurrentTxQueryTest.test">func (c *concurrentTxQueryTest) test(t testing.TB) error</a>

```
searchKey: sql.concurrentTxQueryTest.test
tags: [method private]
```

```Go
func (c *concurrentTxQueryTest) test(t testing.TB) error
```

### <a id="concurrentTxStmtExecTest" href="#concurrentTxStmtExecTest">type concurrentTxStmtExecTest struct</a>

```
searchKey: sql.concurrentTxStmtExecTest
tags: [struct private]
```

```Go
type concurrentTxStmtExecTest struct {
	db   *DB
	tx   *Tx
	stmt *Stmt
}
```

#### <a id="concurrentTxStmtExecTest.finish" href="#concurrentTxStmtExecTest.finish">func (c *concurrentTxStmtExecTest) finish(t testing.TB)</a>

```
searchKey: sql.concurrentTxStmtExecTest.finish
tags: [method private]
```

```Go
func (c *concurrentTxStmtExecTest) finish(t testing.TB)
```

#### <a id="concurrentTxStmtExecTest.init.sql_test.go.0xc039566370" href="#concurrentTxStmtExecTest.init.sql_test.go.0xc039566370">func (c *concurrentTxStmtExecTest) init(t testing.TB, db *DB)</a>

```
searchKey: sql.concurrentTxStmtExecTest.init
tags: [method private]
```

```Go
func (c *concurrentTxStmtExecTest) init(t testing.TB, db *DB)
```

#### <a id="concurrentTxStmtExecTest.test" href="#concurrentTxStmtExecTest.test">func (c *concurrentTxStmtExecTest) test(t testing.TB) error</a>

```
searchKey: sql.concurrentTxStmtExecTest.test
tags: [method private]
```

```Go
func (c *concurrentTxStmtExecTest) test(t testing.TB) error
```

### <a id="concurrentTxStmtQueryTest" href="#concurrentTxStmtQueryTest">type concurrentTxStmtQueryTest struct</a>

```
searchKey: sql.concurrentTxStmtQueryTest
tags: [struct private]
```

```Go
type concurrentTxStmtQueryTest struct {
	db   *DB
	tx   *Tx
	stmt *Stmt
}
```

#### <a id="concurrentTxStmtQueryTest.finish" href="#concurrentTxStmtQueryTest.finish">func (c *concurrentTxStmtQueryTest) finish(t testing.TB)</a>

```
searchKey: sql.concurrentTxStmtQueryTest.finish
tags: [method private]
```

```Go
func (c *concurrentTxStmtQueryTest) finish(t testing.TB)
```

#### <a id="concurrentTxStmtQueryTest.init.sql_test.go.0xc039566370" href="#concurrentTxStmtQueryTest.init.sql_test.go.0xc039566370">func (c *concurrentTxStmtQueryTest) init(t testing.TB, db *DB)</a>

```
searchKey: sql.concurrentTxStmtQueryTest.init
tags: [method private]
```

```Go
func (c *concurrentTxStmtQueryTest) init(t testing.TB, db *DB)
```

#### <a id="concurrentTxStmtQueryTest.test" href="#concurrentTxStmtQueryTest.test">func (c *concurrentTxStmtQueryTest) test(t testing.TB) error</a>

```
searchKey: sql.concurrentTxStmtQueryTest.test
tags: [method private]
```

```Go
func (c *concurrentTxStmtQueryTest) test(t testing.TB) error
```

### <a id="connRequest" href="#connRequest">type connRequest struct</a>

```
searchKey: sql.connRequest
tags: [struct private]
```

```Go
type connRequest struct {
	conn *driverConn
	err  error
}
```

connRequest represents one request for a new connection When there are no idle connections available, DB.conn will create a new connRequest and put it on the db.connRequests list. 

### <a id="connReuseStrategy" href="#connReuseStrategy">type connReuseStrategy uint8</a>

```
searchKey: sql.connReuseStrategy
tags: [number private]
```

```Go
type connReuseStrategy uint8
```

connReuseStrategy determines how (*DB).conn returns database connections. 

### <a id="connStmt" href="#connStmt">type connStmt struct</a>

```
searchKey: sql.connStmt
tags: [struct private]
```

```Go
type connStmt struct {
	dc *driverConn
	ds *driverStmt
}
```

connStmt is a prepared statement on a particular connection. 

### <a id="conversionTest" href="#conversionTest">type conversionTest struct</a>

```
searchKey: sql.conversionTest
tags: [struct private]
```

```Go
type conversionTest struct {
	s, d interface{} // source and destination

	// following are used if they're non-zero
	wantint    int64
	wantuint   uint64
	wantstr    string
	wantbytes  []byte
	wantraw    RawBytes
	wantf32    float32
	wantf64    float64
	wanttime   time.Time
	wantbool   bool // used if d is of type *bool
	wanterr    string
	wantiface  interface{}
	wantptr    *int64 // if non-nil, *d's pointed value must be equal to *wantptr
	wantnil    bool   // if true, *d must be *int64(nil)
	wantusrdef userDefined
	wantusrstr userDefinedString
}
```

### <a id="ctxOnlyConn" href="#ctxOnlyConn">type ctxOnlyConn struct</a>

```
searchKey: sql.ctxOnlyConn
tags: [struct private]
```

```Go
type ctxOnlyConn struct {
	fc *fakeConn

	queryCtxCalled bool
	execCtxCalled  bool
}
```

#### <a id="ctxOnlyConn.Begin" href="#ctxOnlyConn.Begin">func (c *ctxOnlyConn) Begin() (driver.Tx, error)</a>

```
searchKey: sql.ctxOnlyConn.Begin
tags: [method private]
```

```Go
func (c *ctxOnlyConn) Begin() (driver.Tx, error)
```

#### <a id="ctxOnlyConn.Close" href="#ctxOnlyConn.Close">func (c *ctxOnlyConn) Close() error</a>

```
searchKey: sql.ctxOnlyConn.Close
tags: [method private]
```

```Go
func (c *ctxOnlyConn) Close() error
```

#### <a id="ctxOnlyConn.ExecContext" href="#ctxOnlyConn.ExecContext">func (c *ctxOnlyConn) ExecContext(ctx context.Context, q string, args []driver.NamedValue) (driver.Result, error)</a>

```
searchKey: sql.ctxOnlyConn.ExecContext
tags: [method private]
```

```Go
func (c *ctxOnlyConn) ExecContext(ctx context.Context, q string, args []driver.NamedValue) (driver.Result, error)
```

#### <a id="ctxOnlyConn.Prepare" href="#ctxOnlyConn.Prepare">func (c *ctxOnlyConn) Prepare(q string) (driver.Stmt, error)</a>

```
searchKey: sql.ctxOnlyConn.Prepare
tags: [method private]
```

```Go
func (c *ctxOnlyConn) Prepare(q string) (driver.Stmt, error)
```

Prepare is still part of the Conn interface, so while it isn't used must be defined for compatibility. 

#### <a id="ctxOnlyConn.PrepareContext" href="#ctxOnlyConn.PrepareContext">func (c *ctxOnlyConn) PrepareContext(ctx context.Context, q string) (driver.Stmt, error)</a>

```
searchKey: sql.ctxOnlyConn.PrepareContext
tags: [method private]
```

```Go
func (c *ctxOnlyConn) PrepareContext(ctx context.Context, q string) (driver.Stmt, error)
```

#### <a id="ctxOnlyConn.QueryContext" href="#ctxOnlyConn.QueryContext">func (c *ctxOnlyConn) QueryContext(ctx context.Context, q string, args []driver.NamedValue) (driver.Rows, error)</a>

```
searchKey: sql.ctxOnlyConn.QueryContext
tags: [method private]
```

```Go
func (c *ctxOnlyConn) QueryContext(ctx context.Context, q string, args []driver.NamedValue) (driver.Rows, error)
```

### <a id="ctxOnlyDriver" href="#ctxOnlyDriver">type ctxOnlyDriver struct</a>

```
searchKey: sql.ctxOnlyDriver
tags: [struct private]
```

```Go
type ctxOnlyDriver struct {
	fakeDriver
}
```

#### <a id="ctxOnlyDriver.Open" href="#ctxOnlyDriver.Open">func (d *ctxOnlyDriver) Open(dsn string) (driver.Conn, error)</a>

```
searchKey: sql.ctxOnlyDriver.Open
tags: [method private]
```

```Go
func (d *ctxOnlyDriver) Open(dsn string) (driver.Conn, error)
```

### <a id="dec" href="#dec">type dec struct</a>

```
searchKey: sql.dec
tags: [struct private]
```

```Go
type dec struct {
	form        byte
	neg         bool
	coefficient [16]byte
	exponent    int32
}
```

#### <a id="dec.Compose" href="#dec.Compose">func (d *dec) Compose(form byte, negative bool, coefficient []byte, exponent int32) error</a>

```
searchKey: sql.dec.Compose
tags: [method private]
```

```Go
func (d *dec) Compose(form byte, negative bool, coefficient []byte, exponent int32) error
```

#### <a id="dec.Decompose" href="#dec.Decompose">func (d dec) Decompose(buf []byte) (form byte, negative bool, coefficient []byte, exponent int32)</a>

```
searchKey: sql.dec.Decompose
tags: [method private]
```

```Go
func (d dec) Decompose(buf []byte) (form byte, negative bool, coefficient []byte, exponent int32)
```

### <a id="decFinite" href="#decFinite">type decFinite struct</a>

```
searchKey: sql.decFinite
tags: [struct private]
```

```Go
type decFinite struct {
	neg         bool
	coefficient [16]byte
	exponent    int32
}
```

#### <a id="decFinite.Compose" href="#decFinite.Compose">func (d *decFinite) Compose(form byte, negative bool, coefficient []byte, exponent int32) error</a>

```
searchKey: sql.decFinite.Compose
tags: [method private]
```

```Go
func (d *decFinite) Compose(form byte, negative bool, coefficient []byte, exponent int32) error
```

#### <a id="decFinite.Decompose" href="#decFinite.Decompose">func (d decFinite) Decompose(buf []byte) (form byte, negative bool, coefficient []byte, exponent int32)</a>

```
searchKey: sql.decFinite.Decompose
tags: [method private]
```

```Go
func (d decFinite) Decompose(buf []byte) (form byte, negative bool, coefficient []byte, exponent int32)
```

### <a id="decimal" href="#decimal">type decimal interface</a>

```
searchKey: sql.decimal
tags: [interface private]
```

```Go
type decimal interface {
	decimalDecompose
	decimalCompose
}
```

decimal composes or decomposes a decimal value to and from individual parts. There are four parts: a boolean negative flag, a form byte with three possible states (finite=0, infinite=1, NaN=2), a base-2 big-endian integer coefficient (also known as a significand) as a []byte, and an int32 exponent. These are composed into a final value as "decimal = (neg) (form=finite) coefficient * 10 ^ exponent". A zero length coefficient is a zero value. The big-endian integer coefficient stores the most significant byte first (at coefficient[0]). If the form is not finite the coefficient and exponent should be ignored. The negative parameter may be set to true for any form, although implementations are not required to respect the negative parameter in the non-finite form. 

Implementations may choose to set the negative parameter to true on a zero or NaN value, but implementations that do not differentiate between negative and positive zero or NaN values should ignore the negative parameter without error. If an implementation does not support Infinity it may be converted into a NaN without error. If a value is set that is larger than what is supported by an implementation, an error must be returned. Implementations must return an error if a NaN or Infinity is attempted to be set while neither are supported. 

NOTE(kardianos): This is an experimental interface. See [https://golang.org/issue/30870](https://golang.org/issue/30870) 

### <a id="decimalCompose" href="#decimalCompose">type decimalCompose interface</a>

```
searchKey: sql.decimalCompose
tags: [interface private]
```

```Go
type decimalCompose interface {
	// Compose sets the internal decimal value from parts. If the value cannot be
	// represented then an error should be returned.
	Compose(form byte, negative bool, coefficient []byte, exponent int32) error
}
```

### <a id="decimalDecompose" href="#decimalDecompose">type decimalDecompose interface</a>

```
searchKey: sql.decimalDecompose
tags: [interface private]
```

```Go
type decimalDecompose interface {
	// Decompose returns the internal decimal state in parts.
	// If the provided buf has sufficient capacity, buf may be returned as the coefficient with
	// the value set and length set as appropriate.
	Decompose(buf []byte) (form byte, negative bool, coefficient []byte, exponent int32)
}
```

### <a id="decimalInt" href="#decimalInt">type decimalInt struct</a>

```
searchKey: sql.decimalInt
tags: [struct private]
```

```Go
type decimalInt struct {
	value int
}
```

### <a id="depSet" href="#depSet">type depSet map[interface{}]bool</a>

```
searchKey: sql.depSet
tags: [object private]
```

```Go
type depSet map[interface{}]bool // set of true bools

```

depSet is a finalCloser's outstanding dependencies 

### <a id="doNotInclude" href="#doNotInclude">type doNotInclude struct{}</a>

```
searchKey: sql.doNotInclude
tags: [struct private]
```

```Go
type doNotInclude struct{}
```

### <a id="driverConn" href="#driverConn">type driverConn struct</a>

```
searchKey: sql.driverConn
tags: [struct private]
```

```Go
type driverConn struct {
	db        *DB
	createdAt time.Time

	sync.Mutex  // guards following
	ci          driver.Conn
	needReset   bool // The connection session should be reset before use if true.
	closed      bool
	finalClosed bool // ci.Close has been called
	openStmt    map[*driverStmt]bool

	// guarded by db.mu
	inUse      bool
	returnedAt time.Time // Time the connection was created or returned.
	onPut      []func()  // code (with db.mu held) run when conn is next returned
	dbmuClosed bool      // same as closed, but guarded by db.mu, for removeClosedStmtLocked
}
```

driverConn wraps a driver.Conn with a mutex, to be held during all calls into the Conn. (including any calls onto interfaces returned via that Conn, such as calls on Tx, Stmt, Result, Rows) 

#### <a id="driverConn.Close" href="#driverConn.Close">func (dc *driverConn) Close() error</a>

```
searchKey: sql.driverConn.Close
tags: [method private]
```

```Go
func (dc *driverConn) Close() error
```

#### <a id="driverConn.closeDBLocked" href="#driverConn.closeDBLocked">func (dc *driverConn) closeDBLocked() func() error</a>

```
searchKey: sql.driverConn.closeDBLocked
tags: [method private]
```

```Go
func (dc *driverConn) closeDBLocked() func() error
```

the dc.db's Mutex is held. 

#### <a id="driverConn.expired" href="#driverConn.expired">func (dc *driverConn) expired(timeout time.Duration) bool</a>

```
searchKey: sql.driverConn.expired
tags: [method private]
```

```Go
func (dc *driverConn) expired(timeout time.Duration) bool
```

#### <a id="driverConn.finalClose" href="#driverConn.finalClose">func (dc *driverConn) finalClose() error</a>

```
searchKey: sql.driverConn.finalClose
tags: [method private]
```

```Go
func (dc *driverConn) finalClose() error
```

#### <a id="driverConn.prepareLocked" href="#driverConn.prepareLocked">func (dc *driverConn) prepareLocked(ctx context.Context, cg stmtConnGrabber, query string) (*driverStmt, error)</a>

```
searchKey: sql.driverConn.prepareLocked
tags: [method private]
```

```Go
func (dc *driverConn) prepareLocked(ctx context.Context, cg stmtConnGrabber, query string) (*driverStmt, error)
```

prepareLocked prepares the query on dc. When cg == nil the dc must keep track of the prepared statements in a pool. 

#### <a id="driverConn.releaseConn" href="#driverConn.releaseConn">func (dc *driverConn) releaseConn(err error)</a>

```
searchKey: sql.driverConn.releaseConn
tags: [method private]
```

```Go
func (dc *driverConn) releaseConn(err error)
```

#### <a id="driverConn.removeOpenStmt" href="#driverConn.removeOpenStmt">func (dc *driverConn) removeOpenStmt(ds *driverStmt)</a>

```
searchKey: sql.driverConn.removeOpenStmt
tags: [method private]
```

```Go
func (dc *driverConn) removeOpenStmt(ds *driverStmt)
```

#### <a id="driverConn.resetSession" href="#driverConn.resetSession">func (dc *driverConn) resetSession(ctx context.Context) error</a>

```
searchKey: sql.driverConn.resetSession
tags: [method private]
```

```Go
func (dc *driverConn) resetSession(ctx context.Context) error
```

resetSession checks if the driver connection needs the session to be reset and if required, resets it. 

#### <a id="driverConn.validateConnection" href="#driverConn.validateConnection">func (dc *driverConn) validateConnection(needsReset bool) bool</a>

```
searchKey: sql.driverConn.validateConnection
tags: [method private]
```

```Go
func (dc *driverConn) validateConnection(needsReset bool) bool
```

validateConnection checks if the connection is valid and can still be used. It also marks the session for reset if required. 

### <a id="driverResult" href="#driverResult">type driverResult struct</a>

```
searchKey: sql.driverResult
tags: [struct private]
```

```Go
type driverResult struct {
	sync.Locker // the *driverConn
	resi        driver.Result
}
```

#### <a id="driverResult.LastInsertId" href="#driverResult.LastInsertId">func (dr driverResult) LastInsertId() (int64, error)</a>

```
searchKey: sql.driverResult.LastInsertId
tags: [method private]
```

```Go
func (dr driverResult) LastInsertId() (int64, error)
```

#### <a id="driverResult.RowsAffected" href="#driverResult.RowsAffected">func (dr driverResult) RowsAffected() (int64, error)</a>

```
searchKey: sql.driverResult.RowsAffected
tags: [method private]
```

```Go
func (dr driverResult) RowsAffected() (int64, error)
```

### <a id="driverStmt" href="#driverStmt">type driverStmt struct</a>

```
searchKey: sql.driverStmt
tags: [struct private]
```

```Go
type driverStmt struct {
	sync.Locker // the *driverConn
	si          driver.Stmt
	closed      bool
	closeErr    error // return value of previous Close call
}
```

driverStmt associates a driver.Stmt with the *driverConn from which it came, so the driverConn's lock can be held during calls. 

#### <a id="driverStmt.Close" href="#driverStmt.Close">func (ds *driverStmt) Close() error</a>

```
searchKey: sql.driverStmt.Close
tags: [method private]
```

```Go
func (ds *driverStmt) Close() error
```

Close ensures driver.Stmt is only closed once and always returns the same result. 

### <a id="dsnConnector" href="#dsnConnector">type dsnConnector struct</a>

```
searchKey: sql.dsnConnector
tags: [struct private]
```

```Go
type dsnConnector struct {
	dsn    string
	driver driver.Driver
}
```

#### <a id="dsnConnector.Connect" href="#dsnConnector.Connect">func (t dsnConnector) Connect(_ context.Context) (driver.Conn, error)</a>

```
searchKey: sql.dsnConnector.Connect
tags: [method private]
```

```Go
func (t dsnConnector) Connect(_ context.Context) (driver.Conn, error)
```

#### <a id="dsnConnector.Driver" href="#dsnConnector.Driver">func (t dsnConnector) Driver() driver.Driver</a>

```
searchKey: sql.dsnConnector.Driver
tags: [method private]
```

```Go
func (t dsnConnector) Driver() driver.Driver
```

### <a id="fakeConn" href="#fakeConn">type fakeConn struct</a>

```
searchKey: sql.fakeConn
tags: [struct private]
```

```Go
type fakeConn struct {
	db *fakeDB // where to return ourselves to

	currTx *fakeTx

	// Every operation writes to line to enable the race detector
	// check for data races.
	line int64

	// Stats for tests:
	mu          sync.Mutex
	stmtsMade   int
	stmtsClosed int
	numPrepare  int

	// bad connection tests; see isBad()
	bad       bool
	stickyBad bool

	skipDirtySession bool // tests that use Conn should set this to true.

	// dirtySession tests ResetSession, true if a query has executed
	// until ResetSession is called.
	dirtySession bool

	// The waiter is called before each query. May be used in place of the "WAIT"
	// directive.
	waiter func(context.Context)
}
```

#### <a id="fakeConn.Begin" href="#fakeConn.Begin">func (c *fakeConn) Begin() (driver.Tx, error)</a>

```
searchKey: sql.fakeConn.Begin
tags: [method private]
```

```Go
func (c *fakeConn) Begin() (driver.Tx, error)
```

#### <a id="fakeConn.Close" href="#fakeConn.Close">func (c *fakeConn) Close() (err error)</a>

```
searchKey: sql.fakeConn.Close
tags: [method private]
```

```Go
func (c *fakeConn) Close() (err error)
```

#### <a id="fakeConn.Exec" href="#fakeConn.Exec">func (c *fakeConn) Exec(query string, args []driver.Value) (driver.Result, error)</a>

```
searchKey: sql.fakeConn.Exec
tags: [method private]
```

```Go
func (c *fakeConn) Exec(query string, args []driver.Value) (driver.Result, error)
```

#### <a id="fakeConn.ExecContext" href="#fakeConn.ExecContext">func (c *fakeConn) ExecContext(ctx context.Context, query string, args []driver.NamedValue) (driver.Result, error)</a>

```
searchKey: sql.fakeConn.ExecContext
tags: [method private]
```

```Go
func (c *fakeConn) ExecContext(ctx context.Context, query string, args []driver.NamedValue) (driver.Result, error)
```

#### <a id="fakeConn.IsValid" href="#fakeConn.IsValid">func (c *fakeConn) IsValid() bool</a>

```
searchKey: sql.fakeConn.IsValid
tags: [method private]
```

```Go
func (c *fakeConn) IsValid() bool
```

#### <a id="fakeConn.Prepare" href="#fakeConn.Prepare">func (c *fakeConn) Prepare(query string) (driver.Stmt, error)</a>

```
searchKey: sql.fakeConn.Prepare
tags: [method private]
```

```Go
func (c *fakeConn) Prepare(query string) (driver.Stmt, error)
```

#### <a id="fakeConn.PrepareContext" href="#fakeConn.PrepareContext">func (c *fakeConn) PrepareContext(ctx context.Context, query string) (driver.Stmt, error)</a>

```
searchKey: sql.fakeConn.PrepareContext
tags: [method private]
```

```Go
func (c *fakeConn) PrepareContext(ctx context.Context, query string) (driver.Stmt, error)
```

#### <a id="fakeConn.Query" href="#fakeConn.Query">func (c *fakeConn) Query(query string, args []driver.Value) (driver.Rows, error)</a>

```
searchKey: sql.fakeConn.Query
tags: [method private]
```

```Go
func (c *fakeConn) Query(query string, args []driver.Value) (driver.Rows, error)
```

#### <a id="fakeConn.QueryContext" href="#fakeConn.QueryContext">func (c *fakeConn) QueryContext(ctx context.Context, query string, args []driver.NamedValue) (driver.Rows, error)</a>

```
searchKey: sql.fakeConn.QueryContext
tags: [method private]
```

```Go
func (c *fakeConn) QueryContext(ctx context.Context, query string, args []driver.NamedValue) (driver.Rows, error)
```

#### <a id="fakeConn.ResetSession" href="#fakeConn.ResetSession">func (c *fakeConn) ResetSession(ctx context.Context) error</a>

```
searchKey: sql.fakeConn.ResetSession
tags: [method private]
```

```Go
func (c *fakeConn) ResetSession(ctx context.Context) error
```

#### <a id="fakeConn.incrStat" href="#fakeConn.incrStat">func (c *fakeConn) incrStat(v *int)</a>

```
searchKey: sql.fakeConn.incrStat
tags: [method private]
```

```Go
func (c *fakeConn) incrStat(v *int)
```

#### <a id="fakeConn.isBad" href="#fakeConn.isBad">func (c *fakeConn) isBad() bool</a>

```
searchKey: sql.fakeConn.isBad
tags: [method private]
```

```Go
func (c *fakeConn) isBad() bool
```

#### <a id="fakeConn.isDirtyAndMark" href="#fakeConn.isDirtyAndMark">func (c *fakeConn) isDirtyAndMark() bool</a>

```
searchKey: sql.fakeConn.isDirtyAndMark
tags: [method private]
```

```Go
func (c *fakeConn) isDirtyAndMark() bool
```

#### <a id="fakeConn.prepareCreate" href="#fakeConn.prepareCreate">func (c *fakeConn) prepareCreate(stmt *fakeStmt, parts []string) (*fakeStmt, error)</a>

```
searchKey: sql.fakeConn.prepareCreate
tags: [method private]
```

```Go
func (c *fakeConn) prepareCreate(stmt *fakeStmt, parts []string) (*fakeStmt, error)
```

parts are table|col=type,col2=type2 

#### <a id="fakeConn.prepareInsert" href="#fakeConn.prepareInsert">func (c *fakeConn) prepareInsert(ctx context.Context, stmt *fakeStmt, parts []string) (*fakeStmt, error)</a>

```
searchKey: sql.fakeConn.prepareInsert
tags: [method private]
```

```Go
func (c *fakeConn) prepareInsert(ctx context.Context, stmt *fakeStmt, parts []string) (*fakeStmt, error)
```

parts are table|col=?,col2=val 

#### <a id="fakeConn.prepareSelect" href="#fakeConn.prepareSelect">func (c *fakeConn) prepareSelect(stmt *fakeStmt, parts []string) (*fakeStmt, error)</a>

```
searchKey: sql.fakeConn.prepareSelect
tags: [method private]
```

```Go
func (c *fakeConn) prepareSelect(stmt *fakeStmt, parts []string) (*fakeStmt, error)
```

parts are table|selectCol1,selectCol2|whereCol=?,whereCol2=? (note that where columns must always contain ? marks, 

```
just a limitation for fakedb)

```
#### <a id="fakeConn.touchMem" href="#fakeConn.touchMem">func (c *fakeConn) touchMem()</a>

```
searchKey: sql.fakeConn.touchMem
tags: [method private]
```

```Go
func (c *fakeConn) touchMem()
```

### <a id="fakeConnector" href="#fakeConnector">type fakeConnector struct</a>

```
searchKey: sql.fakeConnector
tags: [struct private]
```

```Go
type fakeConnector struct {
	name string

	waiter func(context.Context)
	closed bool
}
```

#### <a id="fakeConnector.Close" href="#fakeConnector.Close">func (c *fakeConnector) Close() error</a>

```
searchKey: sql.fakeConnector.Close
tags: [method private]
```

```Go
func (c *fakeConnector) Close() error
```

#### <a id="fakeConnector.Connect" href="#fakeConnector.Connect">func (c *fakeConnector) Connect(context.Context) (driver.Conn, error)</a>

```
searchKey: sql.fakeConnector.Connect
tags: [method private]
```

```Go
func (c *fakeConnector) Connect(context.Context) (driver.Conn, error)
```

#### <a id="fakeConnector.Driver" href="#fakeConnector.Driver">func (c *fakeConnector) Driver() driver.Driver</a>

```
searchKey: sql.fakeConnector.Driver
tags: [method private]
```

```Go
func (c *fakeConnector) Driver() driver.Driver
```

### <a id="fakeDB" href="#fakeDB">type fakeDB struct</a>

```
searchKey: sql.fakeDB
tags: [struct private]
```

```Go
type fakeDB struct {
	name string

	mu       sync.Mutex
	tables   map[string]*table
	badConn  bool
	allowAny bool
}
```

#### <a id="fakeDB.columnType" href="#fakeDB.columnType">func (db *fakeDB) columnType(table, column string) (typ string, ok bool)</a>

```
searchKey: sql.fakeDB.columnType
tags: [method private]
```

```Go
func (db *fakeDB) columnType(table, column string) (typ string, ok bool)
```

#### <a id="fakeDB.createTable" href="#fakeDB.createTable">func (db *fakeDB) createTable(name string, columnNames, columnTypes []string) error</a>

```
searchKey: sql.fakeDB.createTable
tags: [method private]
```

```Go
func (db *fakeDB) createTable(name string, columnNames, columnTypes []string) error
```

#### <a id="fakeDB.table" href="#fakeDB.table">func (db *fakeDB) table(table string) (*table, bool)</a>

```
searchKey: sql.fakeDB.table
tags: [method private]
```

```Go
func (db *fakeDB) table(table string) (*table, bool)
```

must be called with db.mu lock held 

#### <a id="fakeDB.wipe" href="#fakeDB.wipe">func (db *fakeDB) wipe()</a>

```
searchKey: sql.fakeDB.wipe
tags: [method private]
```

```Go
func (db *fakeDB) wipe()
```

### <a id="fakeDriver" href="#fakeDriver">type fakeDriver struct</a>

```
searchKey: sql.fakeDriver
tags: [struct private]
```

```Go
type fakeDriver struct {
	mu         sync.Mutex // guards 3 following fields
	openCount  int        // conn opens
	closeCount int        // conn closes
	waitCh     chan struct{}
	waitingCh  chan struct{}
	dbs        map[string]*fakeDB
}
```

fakeDriver is a fake database that implements Go's driver.Driver interface, just for testing. 

It speaks a query language that's semantically similar to but syntactically different and simpler than SQL.  The syntax is as follows: 

```
WIPE
CREATE|<tablename>|<col>=<type>,<col>=<type>,...
  where types are: "string", [u]int{8,16,32,64}, "bool"
INSERT|<tablename>|col=val,col2=val2,col3=?
SELECT|<tablename>|projectcol1,projectcol2|filtercol=?,filtercol2=?
SELECT|<tablename>|projectcol1,projectcol2|filtercol=?param1,filtercol2=?param2

```
Any of these can be preceded by PANIC|<method>|, to cause the named method on fakeStmt to panic. 

Any of these can be proceeded by WAIT|<duration>|, to cause the named method on fakeStmt to sleep for the specified duration. 

Multiple of these can be combined when separated with a semicolon. 

When opening a fakeDriver's database, it starts empty with no tables. All tables and data are stored in memory only. 

#### <a id="fakeDriver.Open" href="#fakeDriver.Open">func (d *fakeDriver) Open(dsn string) (driver.Conn, error)</a>

```
searchKey: sql.fakeDriver.Open
tags: [method private]
```

```Go
func (d *fakeDriver) Open(dsn string) (driver.Conn, error)
```

Supports dsn forms: 

```
<dbname>
<dbname>;<opts>  (only currently supported option is `badConn`,
                  which causes driver.ErrBadConn to be returned on
                  every other conn.Begin())

```
#### <a id="fakeDriver.getDB" href="#fakeDriver.getDB">func (d *fakeDriver) getDB(name string) *fakeDB</a>

```
searchKey: sql.fakeDriver.getDB
tags: [method private]
```

```Go
func (d *fakeDriver) getDB(name string) *fakeDB
```

### <a id="fakeDriverCtx" href="#fakeDriverCtx">type fakeDriverCtx struct</a>

```
searchKey: sql.fakeDriverCtx
tags: [struct private]
```

```Go
type fakeDriverCtx struct {
	fakeDriver
}
```

#### <a id="fakeDriverCtx.OpenConnector" href="#fakeDriverCtx.OpenConnector">func (cc *fakeDriverCtx) OpenConnector(name string) (driver.Connector, error)</a>

```
searchKey: sql.fakeDriverCtx.OpenConnector
tags: [method private]
```

```Go
func (cc *fakeDriverCtx) OpenConnector(name string) (driver.Connector, error)
```

### <a id="fakeDriverString" href="#fakeDriverString">type fakeDriverString struct{}</a>

```
searchKey: sql.fakeDriverString
tags: [struct private]
```

```Go
type fakeDriverString struct{}
```

fakeDriverString is like driver.String, but indirects pointers like DefaultValueConverter. 

This could be surprising behavior to retroactively apply to driver.String now that Go1 is out, but this is convenient for our TestPointerParamsAndScans. 

#### <a id="fakeDriverString.ConvertValue" href="#fakeDriverString.ConvertValue">func (fakeDriverString) ConvertValue(v interface{}) (driver.Value, error)</a>

```
searchKey: sql.fakeDriverString.ConvertValue
tags: [method private]
```

```Go
func (fakeDriverString) ConvertValue(v interface{}) (driver.Value, error)
```

### <a id="fakeStmt" href="#fakeStmt">type fakeStmt struct</a>

```
searchKey: sql.fakeStmt
tags: [struct private]
```

```Go
type fakeStmt struct {
	memToucher
	c *fakeConn
	q string // just for debugging

	cmd   string
	table string
	panic string
	wait  time.Duration

	next *fakeStmt // used for returning multiple results.

	closed bool

	colName      []string      // used by CREATE, INSERT, SELECT (selected columns)
	colType      []string      // used by CREATE
	colValue     []interface{} // used by INSERT (mix of strings and "?" for bound params)
	placeholders int           // used by INSERT/SELECT: number of ? params

	whereCol []boundCol // used by SELECT (all placeholders)

	placeholderConverter []driver.ValueConverter // used by INSERT
}
```

#### <a id="fakeStmt.Close" href="#fakeStmt.Close">func (s *fakeStmt) Close() error</a>

```
searchKey: sql.fakeStmt.Close
tags: [method private]
```

```Go
func (s *fakeStmt) Close() error
```

#### <a id="fakeStmt.ColumnConverter" href="#fakeStmt.ColumnConverter">func (s *fakeStmt) ColumnConverter(idx int) driver.ValueConverter</a>

```
searchKey: sql.fakeStmt.ColumnConverter
tags: [method private]
```

```Go
func (s *fakeStmt) ColumnConverter(idx int) driver.ValueConverter
```

#### <a id="fakeStmt.Exec" href="#fakeStmt.Exec">func (s *fakeStmt) Exec(args []driver.Value) (driver.Result, error)</a>

```
searchKey: sql.fakeStmt.Exec
tags: [method private]
```

```Go
func (s *fakeStmt) Exec(args []driver.Value) (driver.Result, error)
```

#### <a id="fakeStmt.ExecContext" href="#fakeStmt.ExecContext">func (s *fakeStmt) ExecContext(ctx context.Context, args []driver.NamedValue) (driver.Result, error)</a>

```
searchKey: sql.fakeStmt.ExecContext
tags: [method private]
```

```Go
func (s *fakeStmt) ExecContext(ctx context.Context, args []driver.NamedValue) (driver.Result, error)
```

#### <a id="fakeStmt.NumInput" href="#fakeStmt.NumInput">func (s *fakeStmt) NumInput() int</a>

```
searchKey: sql.fakeStmt.NumInput
tags: [method private]
```

```Go
func (s *fakeStmt) NumInput() int
```

#### <a id="fakeStmt.Query" href="#fakeStmt.Query">func (s *fakeStmt) Query(args []driver.Value) (driver.Rows, error)</a>

```
searchKey: sql.fakeStmt.Query
tags: [method private]
```

```Go
func (s *fakeStmt) Query(args []driver.Value) (driver.Rows, error)
```

#### <a id="fakeStmt.QueryContext" href="#fakeStmt.QueryContext">func (s *fakeStmt) QueryContext(ctx context.Context, args []driver.NamedValue) (driver.Rows, error)</a>

```
searchKey: sql.fakeStmt.QueryContext
tags: [method private]
```

```Go
func (s *fakeStmt) QueryContext(ctx context.Context, args []driver.NamedValue) (driver.Rows, error)
```

#### <a id="fakeStmt.execInsert" href="#fakeStmt.execInsert">func (s *fakeStmt) execInsert(args []driver.NamedValue, doInsert bool) (driver.Result, error)</a>

```
searchKey: sql.fakeStmt.execInsert
tags: [method private]
```

```Go
func (s *fakeStmt) execInsert(args []driver.NamedValue, doInsert bool) (driver.Result, error)
```

When doInsert is true, add the row to the table. When doInsert is false do prep-work and error checking, but don't actually add the row to the table. 

### <a id="fakeTx" href="#fakeTx">type fakeTx struct</a>

```
searchKey: sql.fakeTx
tags: [struct private]
```

```Go
type fakeTx struct {
	c *fakeConn
}
```

#### <a id="fakeTx.Commit" href="#fakeTx.Commit">func (tx *fakeTx) Commit() error</a>

```
searchKey: sql.fakeTx.Commit
tags: [method private]
```

```Go
func (tx *fakeTx) Commit() error
```

#### <a id="fakeTx.Rollback" href="#fakeTx.Rollback">func (tx *fakeTx) Rollback() error</a>

```
searchKey: sql.fakeTx.Rollback
tags: [method private]
```

```Go
func (tx *fakeTx) Rollback() error
```

### <a id="finalCloser" href="#finalCloser">type finalCloser interface</a>

```
searchKey: sql.finalCloser
tags: [interface private]
```

```Go
type finalCloser interface {
	// finalClose is called when the reference count of an object
	// goes to zero. (*DB).mu is not held while calling it.
	finalClose() error
}
```

The finalCloser interface is used by (*DB).addDep and related dependency reference counting. 

### <a id="memToucher" href="#memToucher">type memToucher interface</a>

```
searchKey: sql.memToucher
tags: [interface private]
```

```Go
type memToucher interface {
	// touchMem reads & writes some memory, to help find data races.
	touchMem()
}
```

### <a id="nullTestRow" href="#nullTestRow">type nullTestRow struct</a>

```
searchKey: sql.nullTestRow
tags: [struct private]
```

```Go
type nullTestRow struct {
	nullParam    interface{}
	notNullParam interface{}
	scanNullVal  interface{}
}
```

### <a id="nullTestSpec" href="#nullTestSpec">type nullTestSpec struct</a>

```
searchKey: sql.nullTestSpec
tags: [struct private]
```

```Go
type nullTestSpec struct {
	nullType    string
	notNullType string
	rows        [6]nullTestRow
}
```

### <a id="nvcConn" href="#nvcConn">type nvcConn struct</a>

```
searchKey: sql.nvcConn
tags: [struct private]
```

```Go
type nvcConn struct {
	*fakeConn
	skipNamedValueCheck bool
}
```

#### <a id="nvcConn.CheckNamedValue" href="#nvcConn.CheckNamedValue">func (c *nvcConn) CheckNamedValue(nv *driver.NamedValue) error</a>

```
searchKey: sql.nvcConn.CheckNamedValue
tags: [method private]
```

```Go
func (c *nvcConn) CheckNamedValue(nv *driver.NamedValue) error
```

### <a id="nvcDriver" href="#nvcDriver">type nvcDriver struct</a>

```
searchKey: sql.nvcDriver
tags: [struct private]
```

```Go
type nvcDriver struct {
	fakeDriver
	skipNamedValueCheck bool
}
```

#### <a id="nvcDriver.Open" href="#nvcDriver.Open">func (d *nvcDriver) Open(dsn string) (driver.Conn, error)</a>

```
searchKey: sql.nvcDriver.Open
tags: [method private]
```

```Go
func (d *nvcDriver) Open(dsn string) (driver.Conn, error)
```

### <a id="pingConn" href="#pingConn">type pingConn struct</a>

```
searchKey: sql.pingConn
tags: [struct private]
```

```Go
type pingConn struct {
	badConn
	driver *pingDriver
}
```

#### <a id="pingConn.Ping" href="#pingConn.Ping">func (pc pingConn) Ping(ctx context.Context) error</a>

```
searchKey: sql.pingConn.Ping
tags: [method private]
```

```Go
func (pc pingConn) Ping(ctx context.Context) error
```

### <a id="pingDriver" href="#pingDriver">type pingDriver struct</a>

```
searchKey: sql.pingDriver
tags: [struct private]
```

```Go
type pingDriver struct {
	fails bool
}
```

#### <a id="pingDriver.Open" href="#pingDriver.Open">func (pd *pingDriver) Open(name string) (driver.Conn, error)</a>

```
searchKey: sql.pingDriver.Open
tags: [method private]
```

```Go
func (pd *pingDriver) Open(name string) (driver.Conn, error)
```

### <a id="releaseConn" href="#releaseConn">type releaseConn func(error)</a>

```
searchKey: sql.releaseConn
tags: [function private]
```

```Go
type releaseConn func(error)
```

### <a id="row" href="#row">type row struct</a>

```
searchKey: sql.row
tags: [struct private]
```

```Go
type row struct {
	cols []interface{} // must be same size as its table colname + coltype
}
```

### <a id="rowsCursor" href="#rowsCursor">type rowsCursor struct</a>

```
searchKey: sql.rowsCursor
tags: [struct private]
```

```Go
type rowsCursor struct {
	parentMem memToucher
	cols      [][]string
	colType   [][]string
	posSet    int
	posRow    int
	rows      [][]*row
	closed    bool

	// errPos and err are for making Next return early with error.
	errPos int
	err    error

	// a clone of slices to give out to clients, indexed by the
	// original slice's first byte address.  we clone them
	// just so we're able to corrupt them on close.
	bytesClone map[*byte][]byte

	// Every operation writes to line to enable the race detector
	// check for data races.
	// This is separate from the fakeConn.line to allow for drivers that
	// can start multiple queries on the same transaction at the same time.
	line int64
}
```

#### <a id="rowsCursor.Close" href="#rowsCursor.Close">func (rc *rowsCursor) Close() error</a>

```
searchKey: sql.rowsCursor.Close
tags: [method private]
```

```Go
func (rc *rowsCursor) Close() error
```

#### <a id="rowsCursor.ColumnTypeScanType" href="#rowsCursor.ColumnTypeScanType">func (rc *rowsCursor) ColumnTypeScanType(index int) reflect.Type</a>

```
searchKey: sql.rowsCursor.ColumnTypeScanType
tags: [method private]
```

```Go
func (rc *rowsCursor) ColumnTypeScanType(index int) reflect.Type
```

#### <a id="rowsCursor.Columns" href="#rowsCursor.Columns">func (rc *rowsCursor) Columns() []string</a>

```
searchKey: sql.rowsCursor.Columns
tags: [method private]
```

```Go
func (rc *rowsCursor) Columns() []string
```

#### <a id="rowsCursor.HasNextResultSet" href="#rowsCursor.HasNextResultSet">func (rc *rowsCursor) HasNextResultSet() bool</a>

```
searchKey: sql.rowsCursor.HasNextResultSet
tags: [method private]
```

```Go
func (rc *rowsCursor) HasNextResultSet() bool
```

#### <a id="rowsCursor.Next" href="#rowsCursor.Next">func (rc *rowsCursor) Next(dest []driver.Value) error</a>

```
searchKey: sql.rowsCursor.Next
tags: [method private]
```

```Go
func (rc *rowsCursor) Next(dest []driver.Value) error
```

#### <a id="rowsCursor.NextResultSet" href="#rowsCursor.NextResultSet">func (rc *rowsCursor) NextResultSet() error</a>

```
searchKey: sql.rowsCursor.NextResultSet
tags: [method private]
```

```Go
func (rc *rowsCursor) NextResultSet() error
```

#### <a id="rowsCursor.touchMem" href="#rowsCursor.touchMem">func (rc *rowsCursor) touchMem()</a>

```
searchKey: sql.rowsCursor.touchMem
tags: [method private]
```

```Go
func (rc *rowsCursor) touchMem()
```

### <a id="stmtConnGrabber" href="#stmtConnGrabber">type stmtConnGrabber interface</a>

```
searchKey: sql.stmtConnGrabber
tags: [interface private]
```

```Go
type stmtConnGrabber interface {
	// grabConn returns the driverConn and the associated release function
	// that must be called when the operation completes.
	grabConn(context.Context) (*driverConn, releaseConn, error)

	// txCtx returns the transaction context if available.
	// The returned context should be selected on along with
	// any query context when awaiting a cancel.
	txCtx() context.Context
}
```

stmtConnGrabber represents a Tx or Conn that will return the underlying driverConn and release function. 

### <a id="stubDriverStmt" href="#stubDriverStmt">type stubDriverStmt struct</a>

```
searchKey: sql.stubDriverStmt
tags: [struct private]
```

```Go
type stubDriverStmt struct {
	err error
}
```

#### <a id="stubDriverStmt.Close" href="#stubDriverStmt.Close">func (s stubDriverStmt) Close() error</a>

```
searchKey: sql.stubDriverStmt.Close
tags: [method private]
```

```Go
func (s stubDriverStmt) Close() error
```

#### <a id="stubDriverStmt.Exec" href="#stubDriverStmt.Exec">func (s stubDriverStmt) Exec(args []driver.Value) (driver.Result, error)</a>

```
searchKey: sql.stubDriverStmt.Exec
tags: [method private]
```

```Go
func (s stubDriverStmt) Exec(args []driver.Value) (driver.Result, error)
```

#### <a id="stubDriverStmt.NumInput" href="#stubDriverStmt.NumInput">func (s stubDriverStmt) NumInput() int</a>

```
searchKey: sql.stubDriverStmt.NumInput
tags: [method private]
```

```Go
func (s stubDriverStmt) NumInput() int
```

#### <a id="stubDriverStmt.Query" href="#stubDriverStmt.Query">func (s stubDriverStmt) Query(args []driver.Value) (driver.Rows, error)</a>

```
searchKey: sql.stubDriverStmt.Query
tags: [method private]
```

```Go
func (s stubDriverStmt) Query(args []driver.Value) (driver.Rows, error)
```

### <a id="table" href="#table">type table struct</a>

```
searchKey: sql.table
tags: [struct private]
```

```Go
type table struct {
	mu      sync.Mutex
	colname []string
	coltype []string
	rows    []*row
}
```

#### <a id="table.columnIndex" href="#table.columnIndex">func (t *table) columnIndex(name string) int</a>

```
searchKey: sql.table.columnIndex
tags: [method private]
```

```Go
func (t *table) columnIndex(name string) int
```

### <a id="userDefined" href="#userDefined">type userDefined float64</a>

```
searchKey: sql.userDefined
tags: [number private]
```

```Go
type userDefined float64
```

### <a id="userDefinedSlice" href="#userDefinedSlice">type userDefinedSlice []int</a>

```
searchKey: sql.userDefinedSlice
tags: [array number private]
```

```Go
type userDefinedSlice []int
```

### <a id="userDefinedString" href="#userDefinedString">type userDefinedString string</a>

```
searchKey: sql.userDefinedString
tags: [string private]
```

```Go
type userDefinedString string
```

### <a id="valueConverterTest" href="#valueConverterTest">type valueConverterTest struct</a>

```
searchKey: sql.valueConverterTest
tags: [struct private]
```

```Go
type valueConverterTest struct {
	c       driver.ValueConverter
	in, out interface{}
	err     string
}
```

## <a id="func" href="#func">Functions</a>

### <a id="BenchmarkConcurrentDBExec" href="#BenchmarkConcurrentDBExec">func BenchmarkConcurrentDBExec(b *testing.B)</a>

```
searchKey: sql.BenchmarkConcurrentDBExec
tags: [function private benchmark]
```

```Go
func BenchmarkConcurrentDBExec(b *testing.B)
```

### <a id="BenchmarkConcurrentRandom" href="#BenchmarkConcurrentRandom">func BenchmarkConcurrentRandom(b *testing.B)</a>

```
searchKey: sql.BenchmarkConcurrentRandom
tags: [function private benchmark]
```

```Go
func BenchmarkConcurrentRandom(b *testing.B)
```

### <a id="BenchmarkConcurrentStmtExec" href="#BenchmarkConcurrentStmtExec">func BenchmarkConcurrentStmtExec(b *testing.B)</a>

```
searchKey: sql.BenchmarkConcurrentStmtExec
tags: [function private benchmark]
```

```Go
func BenchmarkConcurrentStmtExec(b *testing.B)
```

### <a id="BenchmarkConcurrentStmtQuery" href="#BenchmarkConcurrentStmtQuery">func BenchmarkConcurrentStmtQuery(b *testing.B)</a>

```
searchKey: sql.BenchmarkConcurrentStmtQuery
tags: [function private benchmark]
```

```Go
func BenchmarkConcurrentStmtQuery(b *testing.B)
```

### <a id="BenchmarkConcurrentTxExec" href="#BenchmarkConcurrentTxExec">func BenchmarkConcurrentTxExec(b *testing.B)</a>

```
searchKey: sql.BenchmarkConcurrentTxExec
tags: [function private benchmark]
```

```Go
func BenchmarkConcurrentTxExec(b *testing.B)
```

### <a id="BenchmarkConcurrentTxQuery" href="#BenchmarkConcurrentTxQuery">func BenchmarkConcurrentTxQuery(b *testing.B)</a>

```
searchKey: sql.BenchmarkConcurrentTxQuery
tags: [function private benchmark]
```

```Go
func BenchmarkConcurrentTxQuery(b *testing.B)
```

### <a id="BenchmarkConcurrentTxStmtExec" href="#BenchmarkConcurrentTxStmtExec">func BenchmarkConcurrentTxStmtExec(b *testing.B)</a>

```
searchKey: sql.BenchmarkConcurrentTxStmtExec
tags: [function private benchmark]
```

```Go
func BenchmarkConcurrentTxStmtExec(b *testing.B)
```

### <a id="BenchmarkConcurrentTxStmtQuery" href="#BenchmarkConcurrentTxStmtQuery">func BenchmarkConcurrentTxStmtQuery(b *testing.B)</a>

```
searchKey: sql.BenchmarkConcurrentTxStmtQuery
tags: [function private benchmark]
```

```Go
func BenchmarkConcurrentTxStmtQuery(b *testing.B)
```

### <a id="BenchmarkManyConcurrentQueries" href="#BenchmarkManyConcurrentQueries">func BenchmarkManyConcurrentQueries(b *testing.B)</a>

```
searchKey: sql.BenchmarkManyConcurrentQueries
tags: [function private benchmark]
```

```Go
func BenchmarkManyConcurrentQueries(b *testing.B)
```

### <a id="Drivers" href="#Drivers">func Drivers() []string</a>

```
searchKey: sql.Drivers
tags: [function]
```

```Go
func Drivers() []string
```

Drivers returns a sorted list of the names of the registered drivers. 

### <a id="Register" href="#Register">func Register(name string, driver driver.Driver)</a>

```
searchKey: sql.Register
tags: [function]
```

```Go
func Register(name string, driver driver.Driver)
```

Register makes a database driver available by the provided name. If Register is called twice with the same name or if driver is nil, it panics. 

### <a id="TestBadDriver" href="#TestBadDriver">func TestBadDriver(t *testing.T)</a>

```
searchKey: sql.TestBadDriver
tags: [function private test]
```

```Go
func TestBadDriver(t *testing.T)
```

Issue 15901. 

### <a id="TestBogusPreboundParameters" href="#TestBogusPreboundParameters">func TestBogusPreboundParameters(t *testing.T)</a>

```
searchKey: sql.TestBogusPreboundParameters
tags: [function private test]
```

```Go
func TestBogusPreboundParameters(t *testing.T)
```

just a test of fakedb itself 

### <a id="TestCloseConnBeforeStmts" href="#TestCloseConnBeforeStmts">func TestCloseConnBeforeStmts(t *testing.T)</a>

```
searchKey: sql.TestCloseConnBeforeStmts
tags: [function private test]
```

```Go
func TestCloseConnBeforeStmts(t *testing.T)
```

golang.org/issue/5046 

### <a id="TestCloseStmtBeforeRows" href="#TestCloseStmtBeforeRows">func TestCloseStmtBeforeRows(t *testing.T)</a>

```
searchKey: sql.TestCloseStmtBeforeRows
tags: [function private test]
```

```Go
func TestCloseStmtBeforeRows(t *testing.T)
```

From golang.org/issue/3865 

### <a id="TestConcurrency" href="#TestConcurrency">func TestConcurrency(t *testing.T)</a>

```
searchKey: sql.TestConcurrency
tags: [function private test]
```

```Go
func TestConcurrency(t *testing.T)
```

### <a id="TestConnExpiresFreshOutOfPool" href="#TestConnExpiresFreshOutOfPool">func TestConnExpiresFreshOutOfPool(t *testing.T)</a>

```
searchKey: sql.TestConnExpiresFreshOutOfPool
tags: [function private test]
```

```Go
func TestConnExpiresFreshOutOfPool(t *testing.T)
```

Issue32530 encounters an issue where a connection may expire right after it comes out of a used connection pool even when a new connection is requested. 

### <a id="TestConnIsValid" href="#TestConnIsValid">func TestConnIsValid(t *testing.T)</a>

```
searchKey: sql.TestConnIsValid
tags: [function private test]
```

```Go
func TestConnIsValid(t *testing.T)
```

TestConnIsValid verifies that a database connection that should be discarded, is actually discarded and does not re-enter the connection pool. If the IsValid method from *fakeConn is removed, this test will fail. 

### <a id="TestConnMaxLifetime" href="#TestConnMaxLifetime">func TestConnMaxLifetime(t *testing.T)</a>

```
searchKey: sql.TestConnMaxLifetime
tags: [function private test]
```

```Go
func TestConnMaxLifetime(t *testing.T)
```

### <a id="TestConnQuery" href="#TestConnQuery">func TestConnQuery(t *testing.T)</a>

```
searchKey: sql.TestConnQuery
tags: [function private test]
```

```Go
func TestConnQuery(t *testing.T)
```

### <a id="TestConnRaw" href="#TestConnRaw">func TestConnRaw(t *testing.T)</a>

```
searchKey: sql.TestConnRaw
tags: [function private test]
```

```Go
func TestConnRaw(t *testing.T)
```

### <a id="TestConnTx" href="#TestConnTx">func TestConnTx(t *testing.T)</a>

```
searchKey: sql.TestConnTx
tags: [function private test]
```

```Go
func TestConnTx(t *testing.T)
```

### <a id="TestConnectionLeak" href="#TestConnectionLeak">func TestConnectionLeak(t *testing.T)</a>

```
searchKey: sql.TestConnectionLeak
tags: [function private test]
```

```Go
func TestConnectionLeak(t *testing.T)
```

### <a id="TestConversions" href="#TestConversions">func TestConversions(t *testing.T)</a>

```
searchKey: sql.TestConversions
tags: [function private test]
```

```Go
func TestConversions(t *testing.T)
```

### <a id="TestCursorFake" href="#TestCursorFake">func TestCursorFake(t *testing.T)</a>

```
searchKey: sql.TestCursorFake
tags: [function private test]
```

```Go
func TestCursorFake(t *testing.T)
```

### <a id="TestDecimal" href="#TestDecimal">func TestDecimal(t *testing.T)</a>

```
searchKey: sql.TestDecimal
tags: [function private test]
```

```Go
func TestDecimal(t *testing.T)
```

### <a id="TestDriverArgs" href="#TestDriverArgs">func TestDriverArgs(t *testing.T)</a>

```
searchKey: sql.TestDriverArgs
tags: [function private test]
```

```Go
func TestDriverArgs(t *testing.T)
```

### <a id="TestDriverPanic" href="#TestDriverPanic">func TestDriverPanic(t *testing.T)</a>

```
searchKey: sql.TestDriverPanic
tags: [function private test]
```

```Go
func TestDriverPanic(t *testing.T)
```

### <a id="TestDrivers" href="#TestDrivers">func TestDrivers(t *testing.T)</a>

```
searchKey: sql.TestDrivers
tags: [function private test]
```

```Go
func TestDrivers(t *testing.T)
```

### <a id="TestErrBadConnReconnect" href="#TestErrBadConnReconnect">func TestErrBadConnReconnect(t *testing.T)</a>

```
searchKey: sql.TestErrBadConnReconnect
tags: [function private test]
```

```Go
func TestErrBadConnReconnect(t *testing.T)
```

golang.org/issue/5718 

### <a id="TestExec" href="#TestExec">func TestExec(t *testing.T)</a>

```
searchKey: sql.TestExec
tags: [function private test]
```

```Go
func TestExec(t *testing.T)
```

### <a id="TestInvalidNilValues" href="#TestInvalidNilValues">func TestInvalidNilValues(t *testing.T)</a>

```
searchKey: sql.TestInvalidNilValues
tags: [function private test]
```

```Go
func TestInvalidNilValues(t *testing.T)
```

### <a id="TestIssue18429" href="#TestIssue18429">func TestIssue18429(t *testing.T)</a>

```
searchKey: sql.TestIssue18429
tags: [function private test]
```

```Go
func TestIssue18429(t *testing.T)
```

TestIssue18429 attempts to stress rolling back the transaction from a context cancel while simultaneously calling Tx.Rollback. Rolling back from a context happens concurrently so tx.rollback and tx.Commit must guard against double entry. 

In the test, a context is canceled while the query is in process so the internal rollback will run concurrently with the explicitly called Tx.Rollback. 

The addition of calling rows.Next also tests Issue 21117. 

### <a id="TestIssue18719" href="#TestIssue18719">func TestIssue18719(t *testing.T)</a>

```
searchKey: sql.TestIssue18719
tags: [function private test]
```

```Go
func TestIssue18719(t *testing.T)
```

TestIssue18719 closes the context right before use. The sql.driverConn will nil out the ci on close in a lock, but if another process uses it right after it will panic with on the nil ref. 

See [https://golang.org/cl/35550](https://golang.org/cl/35550) . 

### <a id="TestIssue20160" href="#TestIssue20160">func TestIssue20160(t *testing.T)</a>

```
searchKey: sql.TestIssue20160
tags: [function private test]
```

```Go
func TestIssue20160(t *testing.T)
```

TestIssue20160 attempts to test a short context life on a stmt Query. 

### <a id="TestIssue20575" href="#TestIssue20575">func TestIssue20575(t *testing.T)</a>

```
searchKey: sql.TestIssue20575
tags: [function private test]
```

```Go
func TestIssue20575(t *testing.T)
```

TestIssue20575 ensures the Rows from query does not block closing a transaction. Ensure Rows is closed while closing a trasaction. 

### <a id="TestIssue20622" href="#TestIssue20622">func TestIssue20622(t *testing.T)</a>

```
searchKey: sql.TestIssue20622
tags: [function private test]
```

```Go
func TestIssue20622(t *testing.T)
```

TestIssue20622 tests closing the transaction before rows is closed, requires the race detector to fail. 

### <a id="TestIssue20647" href="#TestIssue20647">func TestIssue20647(t *testing.T)</a>

```
searchKey: sql.TestIssue20647
tags: [function private test]
```

```Go
func TestIssue20647(t *testing.T)
```

### <a id="TestIssue2542Deadlock" href="#TestIssue2542Deadlock">func TestIssue2542Deadlock(t *testing.T)</a>

```
searchKey: sql.TestIssue2542Deadlock
tags: [function private test]
```

```Go
func TestIssue2542Deadlock(t *testing.T)
```

Tests fix for issue 2542, that we release a lock when querying on a closed connection. 

### <a id="TestIssue4902" href="#TestIssue4902">func TestIssue4902(t *testing.T)</a>

```
searchKey: sql.TestIssue4902
tags: [function private test]
```

```Go
func TestIssue4902(t *testing.T)
```

### <a id="TestIssue6081" href="#TestIssue6081">func TestIssue6081(t *testing.T)</a>

```
searchKey: sql.TestIssue6081
tags: [function private test]
```

```Go
func TestIssue6081(t *testing.T)
```

### <a id="TestIssue6651" href="#TestIssue6651">func TestIssue6651(t *testing.T)</a>

```
searchKey: sql.TestIssue6651
tags: [function private test]
```

```Go
func TestIssue6651(t *testing.T)
```

Test issue 6651 

### <a id="TestManyErrBadConn" href="#TestManyErrBadConn">func TestManyErrBadConn(t *testing.T)</a>

```
searchKey: sql.TestManyErrBadConn
tags: [function private test]
```

```Go
func TestManyErrBadConn(t *testing.T)
```

Test cases where there's more than maxBadConnRetries bad connections in the pool (issue 8834) 

### <a id="TestMaxIdleConns" href="#TestMaxIdleConns">func TestMaxIdleConns(t *testing.T)</a>

```
searchKey: sql.TestMaxIdleConns
tags: [function private test]
```

```Go
func TestMaxIdleConns(t *testing.T)
```

### <a id="TestMaxIdleTime" href="#TestMaxIdleTime">func TestMaxIdleTime(t *testing.T)</a>

```
searchKey: sql.TestMaxIdleTime
tags: [function private test]
```

```Go
func TestMaxIdleTime(t *testing.T)
```

### <a id="TestMaxOpenConns" href="#TestMaxOpenConns">func TestMaxOpenConns(t *testing.T)</a>

```
searchKey: sql.TestMaxOpenConns
tags: [function private test]
```

```Go
func TestMaxOpenConns(t *testing.T)
```

### <a id="TestMaxOpenConnsOnBusy" href="#TestMaxOpenConnsOnBusy">func TestMaxOpenConnsOnBusy(t *testing.T)</a>

```
searchKey: sql.TestMaxOpenConnsOnBusy
tags: [function private test]
```

```Go
func TestMaxOpenConnsOnBusy(t *testing.T)
```

Issue 9453: tests that SetMaxOpenConns can be lowered at runtime and affects the subsequent release of connections. 

### <a id="TestMultiResultSetQuery" href="#TestMultiResultSetQuery">func TestMultiResultSetQuery(t *testing.T)</a>

```
searchKey: sql.TestMultiResultSetQuery
tags: [function private test]
```

```Go
func TestMultiResultSetQuery(t *testing.T)
```

### <a id="TestNamedValueChecker" href="#TestNamedValueChecker">func TestNamedValueChecker(t *testing.T)</a>

```
searchKey: sql.TestNamedValueChecker
tags: [function private test]
```

```Go
func TestNamedValueChecker(t *testing.T)
```

### <a id="TestNamedValueCheckerSkip" href="#TestNamedValueCheckerSkip">func TestNamedValueCheckerSkip(t *testing.T)</a>

```
searchKey: sql.TestNamedValueCheckerSkip
tags: [function private test]
```

```Go
func TestNamedValueCheckerSkip(t *testing.T)
```

### <a id="TestNullBoolParam" href="#TestNullBoolParam">func TestNullBoolParam(t *testing.T)</a>

```
searchKey: sql.TestNullBoolParam
tags: [function private test]
```

```Go
func TestNullBoolParam(t *testing.T)
```

### <a id="TestNullByteParam" href="#TestNullByteParam">func TestNullByteParam(t *testing.T)</a>

```
searchKey: sql.TestNullByteParam
tags: [function private test]
```

```Go
func TestNullByteParam(t *testing.T)
```

### <a id="TestNullByteSlice" href="#TestNullByteSlice">func TestNullByteSlice(t *testing.T)</a>

```
searchKey: sql.TestNullByteSlice
tags: [function private test]
```

```Go
func TestNullByteSlice(t *testing.T)
```

Tests fix for issue 2788, that we bind nil to a []byte if the value in the column is sql null 

### <a id="TestNullFloat64Param" href="#TestNullFloat64Param">func TestNullFloat64Param(t *testing.T)</a>

```
searchKey: sql.TestNullFloat64Param
tags: [function private test]
```

```Go
func TestNullFloat64Param(t *testing.T)
```

### <a id="TestNullInt16Param" href="#TestNullInt16Param">func TestNullInt16Param(t *testing.T)</a>

```
searchKey: sql.TestNullInt16Param
tags: [function private test]
```

```Go
func TestNullInt16Param(t *testing.T)
```

### <a id="TestNullInt32Param" href="#TestNullInt32Param">func TestNullInt32Param(t *testing.T)</a>

```
searchKey: sql.TestNullInt32Param
tags: [function private test]
```

```Go
func TestNullInt32Param(t *testing.T)
```

### <a id="TestNullInt64Param" href="#TestNullInt64Param">func TestNullInt64Param(t *testing.T)</a>

```
searchKey: sql.TestNullInt64Param
tags: [function private test]
```

```Go
func TestNullInt64Param(t *testing.T)
```

### <a id="TestNullString" href="#TestNullString">func TestNullString(t *testing.T)</a>

```
searchKey: sql.TestNullString
tags: [function private test]
```

```Go
func TestNullString(t *testing.T)
```

### <a id="TestNullStringParam" href="#TestNullStringParam">func TestNullStringParam(t *testing.T)</a>

```
searchKey: sql.TestNullStringParam
tags: [function private test]
```

```Go
func TestNullStringParam(t *testing.T)
```

### <a id="TestNullTimeParam" href="#TestNullTimeParam">func TestNullTimeParam(t *testing.T)</a>

```
searchKey: sql.TestNullTimeParam
tags: [function private test]
```

```Go
func TestNullTimeParam(t *testing.T)
```

### <a id="TestOpenConnector" href="#TestOpenConnector">func TestOpenConnector(t *testing.T)</a>

```
searchKey: sql.TestOpenConnector
tags: [function private test]
```

```Go
func TestOpenConnector(t *testing.T)
```

### <a id="TestOpenDB" href="#TestOpenDB">func TestOpenDB(t *testing.T)</a>

```
searchKey: sql.TestOpenDB
tags: [function private test]
```

```Go
func TestOpenDB(t *testing.T)
```

### <a id="TestParentStmtOutlivesTxStmt" href="#TestParentStmtOutlivesTxStmt">func TestParentStmtOutlivesTxStmt(t *testing.T)</a>

```
searchKey: sql.TestParentStmtOutlivesTxStmt
tags: [function private test]
```

```Go
func TestParentStmtOutlivesTxStmt(t *testing.T)
```

### <a id="TestPendingConnsAfterErr" href="#TestPendingConnsAfterErr">func TestPendingConnsAfterErr(t *testing.T)</a>

```
searchKey: sql.TestPendingConnsAfterErr
tags: [function private test]
```

```Go
func TestPendingConnsAfterErr(t *testing.T)
```

Issue 10886: tests that all connection attempts return when more than DB.maxOpen connections are in flight and the first DB.maxOpen fail. 

### <a id="TestPing" href="#TestPing">func TestPing(t *testing.T)</a>

```
searchKey: sql.TestPing
tags: [function private test]
```

```Go
func TestPing(t *testing.T)
```

### <a id="TestPointerParamsAndScans" href="#TestPointerParamsAndScans">func TestPointerParamsAndScans(t *testing.T)</a>

```
searchKey: sql.TestPointerParamsAndScans
tags: [function private test]
```

```Go
func TestPointerParamsAndScans(t *testing.T)
```

### <a id="TestPoolExhaustOnCancel" href="#TestPoolExhaustOnCancel">func TestPoolExhaustOnCancel(t *testing.T)</a>

```
searchKey: sql.TestPoolExhaustOnCancel
tags: [function private test]
```

```Go
func TestPoolExhaustOnCancel(t *testing.T)
```

### <a id="TestQuery" href="#TestQuery">func TestQuery(t *testing.T)</a>

```
searchKey: sql.TestQuery
tags: [function private test]
```

```Go
func TestQuery(t *testing.T)
```

### <a id="TestQueryContext" href="#TestQueryContext">func TestQueryContext(t *testing.T)</a>

```
searchKey: sql.TestQueryContext
tags: [function private test]
```

```Go
func TestQueryContext(t *testing.T)
```

TestQueryContext tests canceling the context while scanning the rows. 

### <a id="TestQueryContextWait" href="#TestQueryContextWait">func TestQueryContextWait(t *testing.T)</a>

```
searchKey: sql.TestQueryContextWait
tags: [function private test]
```

```Go
func TestQueryContextWait(t *testing.T)
```

TestQueryContextWait ensures that rows and all internal statements are closed when a query context is closed during execution. 

### <a id="TestQueryExecContextOnly" href="#TestQueryExecContextOnly">func TestQueryExecContextOnly(t *testing.T)</a>

```
searchKey: sql.TestQueryExecContextOnly
tags: [function private test]
```

```Go
func TestQueryExecContextOnly(t *testing.T)
```

TestQueryExecContextOnly ensures drivers only need to implement QueryContext and ExecContext methods. 

### <a id="TestQueryNamedArg" href="#TestQueryNamedArg">func TestQueryNamedArg(t *testing.T)</a>

```
searchKey: sql.TestQueryNamedArg
tags: [function private test]
```

```Go
func TestQueryNamedArg(t *testing.T)
```

### <a id="TestQueryRow" href="#TestQueryRow">func TestQueryRow(t *testing.T)</a>

```
searchKey: sql.TestQueryRow
tags: [function private test]
```

```Go
func TestQueryRow(t *testing.T)
```

### <a id="TestQueryRowClosingStmt" href="#TestQueryRowClosingStmt">func TestQueryRowClosingStmt(t *testing.T)</a>

```
searchKey: sql.TestQueryRowClosingStmt
tags: [function private test]
```

```Go
func TestQueryRowClosingStmt(t *testing.T)
```

### <a id="TestQueryRowNilScanDest" href="#TestQueryRowNilScanDest">func TestQueryRowNilScanDest(t *testing.T)</a>

```
searchKey: sql.TestQueryRowNilScanDest
tags: [function private test]
```

```Go
func TestQueryRowNilScanDest(t *testing.T)
```

golang.org/issue/4859 

### <a id="TestRawBytesAllocs" href="#TestRawBytesAllocs">func TestRawBytesAllocs(t *testing.T)</a>

```
searchKey: sql.TestRawBytesAllocs
tags: [function private test]
```

```Go
func TestRawBytesAllocs(t *testing.T)
```

Tests that assigning to RawBytes doesn't allocate (and also works). 

### <a id="TestRowErr" href="#TestRowErr">func TestRowErr(t *testing.T)</a>

```
searchKey: sql.TestRowErr
tags: [function private test]
```

```Go
func TestRowErr(t *testing.T)
```

### <a id="TestRowsCloseOrder" href="#TestRowsCloseOrder">func TestRowsCloseOrder(t *testing.T)</a>

```
searchKey: sql.TestRowsCloseOrder
tags: [function private test]
```

```Go
func TestRowsCloseOrder(t *testing.T)
```

golang.org/issue/5283: don't release the Rows' connection in Close before calling Stmt.Close. 

### <a id="TestRowsColumnTypes" href="#TestRowsColumnTypes">func TestRowsColumnTypes(t *testing.T)</a>

```
searchKey: sql.TestRowsColumnTypes
tags: [function private test]
```

```Go
func TestRowsColumnTypes(t *testing.T)
```

### <a id="TestRowsColumns" href="#TestRowsColumns">func TestRowsColumns(t *testing.T)</a>

```
searchKey: sql.TestRowsColumns
tags: [function private test]
```

```Go
func TestRowsColumns(t *testing.T)
```

### <a id="TestRowsImplicitClose" href="#TestRowsImplicitClose">func TestRowsImplicitClose(t *testing.T)</a>

```
searchKey: sql.TestRowsImplicitClose
tags: [function private test]
```

```Go
func TestRowsImplicitClose(t *testing.T)
```

### <a id="TestRowsScanProperlyWrapsErrors" href="#TestRowsScanProperlyWrapsErrors">func TestRowsScanProperlyWrapsErrors(t *testing.T)</a>

```
searchKey: sql.TestRowsScanProperlyWrapsErrors
tags: [function private test]
```

```Go
func TestRowsScanProperlyWrapsErrors(t *testing.T)
```

Issue 38099: Ensure that Rows.Scan properly wraps underlying errors. 

### <a id="TestSimultaneousQueries" href="#TestSimultaneousQueries">func TestSimultaneousQueries(t *testing.T)</a>

```
searchKey: sql.TestSimultaneousQueries
tags: [function private test]
```

```Go
func TestSimultaneousQueries(t *testing.T)
```

Issue 3857 This used to deadlock. 

### <a id="TestSingleOpenConn" href="#TestSingleOpenConn">func TestSingleOpenConn(t *testing.T)</a>

```
searchKey: sql.TestSingleOpenConn
tags: [function private test]
```

```Go
func TestSingleOpenConn(t *testing.T)
```

### <a id="TestStatementClose" href="#TestStatementClose">func TestStatementClose(t *testing.T)</a>

```
searchKey: sql.TestStatementClose
tags: [function private test]
```

```Go
func TestStatementClose(t *testing.T)
```

golang.org/issue/12798 

### <a id="TestStatementErrorAfterClose" href="#TestStatementErrorAfterClose">func TestStatementErrorAfterClose(t *testing.T)</a>

```
searchKey: sql.TestStatementErrorAfterClose
tags: [function private test]
```

```Go
func TestStatementErrorAfterClose(t *testing.T)
```

### <a id="TestStatementQueryRow" href="#TestStatementQueryRow">func TestStatementQueryRow(t *testing.T)</a>

```
searchKey: sql.TestStatementQueryRow
tags: [function private test]
```

```Go
func TestStatementQueryRow(t *testing.T)
```

### <a id="TestStatementQueryRowConcurrent" href="#TestStatementQueryRowConcurrent">func TestStatementQueryRowConcurrent(t *testing.T)</a>

```
searchKey: sql.TestStatementQueryRowConcurrent
tags: [function private test]
```

```Go
func TestStatementQueryRowConcurrent(t *testing.T)
```

golang.org/issue/3734 

### <a id="TestStats" href="#TestStats">func TestStats(t *testing.T)</a>

```
searchKey: sql.TestStats
tags: [function private test]
```

```Go
func TestStats(t *testing.T)
```

### <a id="TestStatsMaxIdleClosedTen" href="#TestStatsMaxIdleClosedTen">func TestStatsMaxIdleClosedTen(t *testing.T)</a>

```
searchKey: sql.TestStatsMaxIdleClosedTen
tags: [function private test]
```

```Go
func TestStatsMaxIdleClosedTen(t *testing.T)
```

### <a id="TestStatsMaxIdleClosedZero" href="#TestStatsMaxIdleClosedZero">func TestStatsMaxIdleClosedZero(t *testing.T)</a>

```
searchKey: sql.TestStatsMaxIdleClosedZero
tags: [function private test]
```

```Go
func TestStatsMaxIdleClosedZero(t *testing.T)
```

### <a id="TestStmtCloseDeps" href="#TestStmtCloseDeps">func TestStmtCloseDeps(t *testing.T)</a>

```
searchKey: sql.TestStmtCloseDeps
tags: [function private test]
```

```Go
func TestStmtCloseDeps(t *testing.T)
```

golang.org/issue/5323 

### <a id="TestStmtCloseOrder" href="#TestStmtCloseOrder">func TestStmtCloseOrder(t *testing.T)</a>

```
searchKey: sql.TestStmtCloseOrder
tags: [function private test]
```

```Go
func TestStmtCloseOrder(t *testing.T)
```

### <a id="TestTxCannotCommitAfterRollback" href="#TestTxCannotCommitAfterRollback">func TestTxCannotCommitAfterRollback(t *testing.T)</a>

```
searchKey: sql.TestTxCannotCommitAfterRollback
tags: [function private test]
```

```Go
func TestTxCannotCommitAfterRollback(t *testing.T)
```

Issue 34775: Ensure that a Tx cannot commit after a rollback. 

### <a id="TestTxContextWait" href="#TestTxContextWait">func TestTxContextWait(t *testing.T)</a>

```
searchKey: sql.TestTxContextWait
tags: [function private test]
```

```Go
func TestTxContextWait(t *testing.T)
```

TestTxContextWait tests the transaction behavior when the tx context is canceled during execution of the query. 

### <a id="TestTxContextWaitNoDiscard" href="#TestTxContextWaitNoDiscard">func TestTxContextWaitNoDiscard(t *testing.T)</a>

```
searchKey: sql.TestTxContextWaitNoDiscard
tags: [function private test]
```

```Go
func TestTxContextWaitNoDiscard(t *testing.T)
```

TestTxContextWaitNoDiscard is the same as TestTxContextWait, but should not discard the final connection. 

### <a id="TestTxEndBadConn" href="#TestTxEndBadConn">func TestTxEndBadConn(t *testing.T)</a>

```
searchKey: sql.TestTxEndBadConn
tags: [function private test]
```

```Go
func TestTxEndBadConn(t *testing.T)
```

golang.org/issue/11264 

### <a id="TestTxErrBadConn" href="#TestTxErrBadConn">func TestTxErrBadConn(t *testing.T)</a>

```
searchKey: sql.TestTxErrBadConn
tags: [function private test]
```

```Go
func TestTxErrBadConn(t *testing.T)
```

Tests fix for issue 4433, that retries in Begin happen when conn.Begin() returns ErrBadConn 

### <a id="TestTxPrepare" href="#TestTxPrepare">func TestTxPrepare(t *testing.T)</a>

```
searchKey: sql.TestTxPrepare
tags: [function private test]
```

```Go
func TestTxPrepare(t *testing.T)
```

### <a id="TestTxQuery" href="#TestTxQuery">func TestTxQuery(t *testing.T)</a>

```
searchKey: sql.TestTxQuery
tags: [function private test]
```

```Go
func TestTxQuery(t *testing.T)
```

Issue: [https://golang.org/issue/2784](https://golang.org/issue/2784) This test didn't fail before because we got lucky with the fakedb driver. It was failing, and now not, in github.com/bradfitz/go-sql-test 

### <a id="TestTxQueryInvalid" href="#TestTxQueryInvalid">func TestTxQueryInvalid(t *testing.T)</a>

```
searchKey: sql.TestTxQueryInvalid
tags: [function private test]
```

```Go
func TestTxQueryInvalid(t *testing.T)
```

### <a id="TestTxRollbackCommitErr" href="#TestTxRollbackCommitErr">func TestTxRollbackCommitErr(t *testing.T)</a>

```
searchKey: sql.TestTxRollbackCommitErr
tags: [function private test]
```

```Go
func TestTxRollbackCommitErr(t *testing.T)
```

### <a id="TestTxStmt" href="#TestTxStmt">func TestTxStmt(t *testing.T)</a>

```
searchKey: sql.TestTxStmt
tags: [function private test]
```

```Go
func TestTxStmt(t *testing.T)
```

### <a id="TestTxStmtClosedRePrepares" href="#TestTxStmtClosedRePrepares">func TestTxStmtClosedRePrepares(t *testing.T)</a>

```
searchKey: sql.TestTxStmtClosedRePrepares
tags: [function private test]
```

```Go
func TestTxStmtClosedRePrepares(t *testing.T)
```

### <a id="TestTxStmtDeadlock" href="#TestTxStmtDeadlock">func TestTxStmtDeadlock(t *testing.T)</a>

```
searchKey: sql.TestTxStmtDeadlock
tags: [function private test]
```

```Go
func TestTxStmtDeadlock(t *testing.T)
```

Issue 40985 transaction statement deadlock while context cancel. 

### <a id="TestTxStmtFromTxStmtRePrepares" href="#TestTxStmtFromTxStmtRePrepares">func TestTxStmtFromTxStmtRePrepares(t *testing.T)</a>

```
searchKey: sql.TestTxStmtFromTxStmtRePrepares
tags: [function private test]
```

```Go
func TestTxStmtFromTxStmtRePrepares(t *testing.T)
```

Test that tx.Stmt called with a statement already associated with tx as argument re-prepares the same statement again. 

### <a id="TestTxStmtPreparedOnce" href="#TestTxStmtPreparedOnce">func TestTxStmtPreparedOnce(t *testing.T)</a>

```
searchKey: sql.TestTxStmtPreparedOnce
tags: [function private test]
```

```Go
func TestTxStmtPreparedOnce(t *testing.T)
```

### <a id="TestTypedString" href="#TestTypedString">func TestTypedString(t *testing.T)</a>

```
searchKey: sql.TestTypedString
tags: [function private test]
```

```Go
func TestTypedString(t *testing.T)
```

Issue 18101. 

### <a id="TestUnsupportedOptions" href="#TestUnsupportedOptions">func TestUnsupportedOptions(t *testing.T)</a>

```
searchKey: sql.TestUnsupportedOptions
tags: [function private test]
```

```Go
func TestUnsupportedOptions(t *testing.T)
```

TestUnsupportedOptions checks that the database fails when a driver that doesn't implement ConnBeginTx is used with non-default options and an un-cancellable context. 

### <a id="TestUserDefinedBytes" href="#TestUserDefinedBytes">func TestUserDefinedBytes(t *testing.T)</a>

```
searchKey: sql.TestUserDefinedBytes
tags: [function private test]
```

```Go
func TestUserDefinedBytes(t *testing.T)
```

[https://golang.org/issues/13905](https://golang.org/issues/13905) 

### <a id="TestValueConverters" href="#TestValueConverters">func TestValueConverters(t *testing.T)</a>

```
searchKey: sql.TestValueConverters
tags: [function private test]
```

```Go
func TestValueConverters(t *testing.T)
```

### <a id="asBytes" href="#asBytes">func asBytes(buf []byte, rv reflect.Value) (b []byte, ok bool)</a>

```
searchKey: sql.asBytes
tags: [function private]
```

```Go
func asBytes(buf []byte, rv reflect.Value) (b []byte, ok bool)
```

### <a id="asString" href="#asString">func asString(src interface{}) string</a>

```
searchKey: sql.asString
tags: [function private]
```

```Go
func asString(src interface{}) string
```

### <a id="callValuerValue" href="#callValuerValue">func callValuerValue(vr driver.Valuer) (v driver.Value, err error)</a>

```
searchKey: sql.callValuerValue
tags: [function private]
```

```Go
func callValuerValue(vr driver.Valuer) (v driver.Value, err error)
```

callValuerValue returns vr.Value(), with one exception: If vr.Value is an auto-generated method on a pointer type and the pointer is nil, it would panic at runtime in the panicwrap method. Treat it like nil instead. Issue 8415. 

This is so people can implement driver.Value on value types and still use nil pointers to those types to mean nil/NULL, just like string/*string. 

This function is mirrored in the database/sql/driver package. 

### <a id="checkSubsetTypes" href="#checkSubsetTypes">func checkSubsetTypes(allowAny bool, args []driver.NamedValue) error</a>

```
searchKey: sql.checkSubsetTypes
tags: [function private]
```

```Go
func checkSubsetTypes(allowAny bool, args []driver.NamedValue) error
```

### <a id="cloneBytes" href="#cloneBytes">func cloneBytes(b []byte) []byte</a>

```
searchKey: sql.cloneBytes
tags: [function private]
```

```Go
func cloneBytes(b []byte) []byte
```

### <a id="closeDB" href="#closeDB">func closeDB(t testing.TB, db *DB)</a>

```
searchKey: sql.closeDB
tags: [function private]
```

```Go
func closeDB(t testing.TB, db *DB)
```

### <a id="colTypeToReflectType" href="#colTypeToReflectType">func colTypeToReflectType(typ string) reflect.Type</a>

```
searchKey: sql.colTypeToReflectType
tags: [function private]
```

```Go
func colTypeToReflectType(typ string) reflect.Type
```

### <a id="contains" href="#contains">func contains(list []string, y string) bool</a>

```
searchKey: sql.contains
tags: [function private]
```

```Go
func contains(list []string, y string) bool
```

### <a id="conversionTests" href="#conversionTests">func conversionTests() []conversionTest</a>

```
searchKey: sql.conversionTests
tags: [function private]
```

```Go
func conversionTests() []conversionTest
```

### <a id="convertAssign" href="#convertAssign">func convertAssign(dest, src interface{}) error</a>

```
searchKey: sql.convertAssign
tags: [function private]
```

```Go
func convertAssign(dest, src interface{}) error
```

convertAssign is the same as convertAssignRows, but without the optional rows argument. 

### <a id="convertAssignRows" href="#convertAssignRows">func convertAssignRows(dest, src interface{}, rows *Rows) error</a>

```
searchKey: sql.convertAssignRows
tags: [function private]
```

```Go
func convertAssignRows(dest, src interface{}, rows *Rows) error
```

convertAssignRows copies to dest the value in src, converting it if possible. An error is returned if the copy would result in loss of information. dest should be a pointer type. If rows is passed in, the rows will be used as the parent for any cursor values converted from a driver.Rows to a *Rows. 

### <a id="converterForType" href="#converterForType">func converterForType(typ string) driver.ValueConverter</a>

```
searchKey: sql.converterForType
tags: [function private]
```

```Go
func converterForType(typ string) driver.ValueConverter
```

### <a id="ctxDriverBegin" href="#ctxDriverBegin">func ctxDriverBegin(ctx context.Context, opts *TxOptions, ci driver.Conn) (driver.Tx, error)</a>

```
searchKey: sql.ctxDriverBegin
tags: [function private]
```

```Go
func ctxDriverBegin(ctx context.Context, opts *TxOptions, ci driver.Conn) (driver.Tx, error)
```

### <a id="ctxDriverExec" href="#ctxDriverExec">func ctxDriverExec(ctx context.Context, execerCtx driver.ExecerContext, execer driver.Execer, query string, nvdargs []driver.NamedValue) (driver.Result, error)</a>

```
searchKey: sql.ctxDriverExec
tags: [function private]
```

```Go
func ctxDriverExec(ctx context.Context, execerCtx driver.ExecerContext, execer driver.Execer, query string, nvdargs []driver.NamedValue) (driver.Result, error)
```

### <a id="ctxDriverPrepare" href="#ctxDriverPrepare">func ctxDriverPrepare(ctx context.Context, ci driver.Conn, query string) (driver.Stmt, error)</a>

```
searchKey: sql.ctxDriverPrepare
tags: [function private]
```

```Go
func ctxDriverPrepare(ctx context.Context, ci driver.Conn, query string) (driver.Stmt, error)
```

### <a id="ctxDriverQuery" href="#ctxDriverQuery">func ctxDriverQuery(ctx context.Context, queryerCtx driver.QueryerContext, queryer driver.Queryer, query string, nvdargs []driver.NamedValue) (driver.Rows, error)</a>

```
searchKey: sql.ctxDriverQuery
tags: [function private]
```

```Go
func ctxDriverQuery(ctx context.Context, queryerCtx driver.QueryerContext, queryer driver.Queryer, query string, nvdargs []driver.NamedValue) (driver.Rows, error)
```

### <a id="ctxDriverStmtExec" href="#ctxDriverStmtExec">func ctxDriverStmtExec(ctx context.Context, si driver.Stmt, nvdargs []driver.NamedValue) (driver.Result, error)</a>

```
searchKey: sql.ctxDriverStmtExec
tags: [function private]
```

```Go
func ctxDriverStmtExec(ctx context.Context, si driver.Stmt, nvdargs []driver.NamedValue) (driver.Result, error)
```

### <a id="ctxDriverStmtQuery" href="#ctxDriverStmtQuery">func ctxDriverStmtQuery(ctx context.Context, si driver.Stmt, nvdargs []driver.NamedValue) (driver.Rows, error)</a>

```
searchKey: sql.ctxDriverStmtQuery
tags: [function private]
```

```Go
func ctxDriverStmtQuery(ctx context.Context, si driver.Stmt, nvdargs []driver.NamedValue) (driver.Rows, error)
```

### <a id="defaultCheckNamedValue" href="#defaultCheckNamedValue">func defaultCheckNamedValue(nv *driver.NamedValue) (err error)</a>

```
searchKey: sql.defaultCheckNamedValue
tags: [function private]
```

```Go
func defaultCheckNamedValue(nv *driver.NamedValue) (err error)
```

defaultCheckNamedValue wraps the default ColumnConverter to have the same function signature as the CheckNamedValue in the driver.NamedValueChecker interface. 

### <a id="describeNamedValue" href="#describeNamedValue">func describeNamedValue(nv *driver.NamedValue) string</a>

```
searchKey: sql.describeNamedValue
tags: [function private]
```

```Go
func describeNamedValue(nv *driver.NamedValue) string
```

### <a id="doConcurrentTest" href="#doConcurrentTest">func doConcurrentTest(t testing.TB, ct concurrentTest)</a>

```
searchKey: sql.doConcurrentTest
tags: [function private]
```

```Go
func doConcurrentTest(t testing.TB, ct concurrentTest)
```

### <a id="driverArgsConnLocked" href="#driverArgsConnLocked">func driverArgsConnLocked(ci driver.Conn, ds *driverStmt, args []interface{}) ([]driver.NamedValue, error)</a>

```
searchKey: sql.driverArgsConnLocked
tags: [function private]
```

```Go
func driverArgsConnLocked(ci driver.Conn, ds *driverStmt, args []interface{}) ([]driver.NamedValue, error)
```

driverArgsConnLocked converts arguments from callers of Stmt.Exec and Stmt.Query into driver Values. 

The statement ds may be nil, if no statement is available. 

ci must be locked. 

### <a id="errf" href="#errf">func errf(msg string, args ...interface{}) error</a>

```
searchKey: sql.errf
tags: [function private]
```

```Go
func errf(msg string, args ...interface{}) error
```

### <a id="exec" href="#exec">func exec(t testing.TB, db *DB, query string, args ...interface{})</a>

```
searchKey: sql.exec
tags: [function private]
```

```Go
func exec(t testing.TB, db *DB, query string, args ...interface{})
```

### <a id="float32Value" href="#float32Value">func float32Value(ptr interface{}) float32</a>

```
searchKey: sql.float32Value
tags: [function private]
```

```Go
func float32Value(ptr interface{}) float32
```

### <a id="float64Value" href="#float64Value">func float64Value(ptr interface{}) float64</a>

```
searchKey: sql.float64Value
tags: [function private]
```

```Go
func float64Value(ptr interface{}) float64
```

### <a id="init.fakedb_test.go" href="#init.fakedb_test.go">func init()</a>

```
searchKey: sql.init
tags: [function private]
```

```Go
func init()
```

### <a id="init.sql_test.go" href="#init.sql_test.go">func init()</a>

```
searchKey: sql.init
tags: [function private]
```

```Go
func init()
```

### <a id="init.sql_test.go.0xc039566370" href="#init.sql_test.go.0xc039566370">func init()</a>

```
searchKey: sql.init
tags: [function private]
```

```Go
func init()
```

### <a id="intPtrValue" href="#intPtrValue">func intPtrValue(intptr interface{}) interface{}</a>

```
searchKey: sql.intPtrValue
tags: [function private]
```

```Go
func intPtrValue(intptr interface{}) interface{}
```

### <a id="intValue" href="#intValue">func intValue(intptr interface{}) int64</a>

```
searchKey: sql.intValue
tags: [function private]
```

```Go
func intValue(intptr interface{}) int64
```

### <a id="namedValueToValue" href="#namedValueToValue">func namedValueToValue(named []driver.NamedValue) ([]driver.Value, error)</a>

```
searchKey: sql.namedValueToValue
tags: [function private]
```

```Go
func namedValueToValue(named []driver.NamedValue) ([]driver.Value, error)
```

### <a id="nullTestRun" href="#nullTestRun">func nullTestRun(t *testing.T, spec nullTestSpec)</a>

```
searchKey: sql.nullTestRun
tags: [function private]
```

```Go
func nullTestRun(t *testing.T, spec nullTestSpec)
```

### <a id="numPrepares" href="#numPrepares">func numPrepares(t *testing.T, db *DB) int</a>

```
searchKey: sql.numPrepares
tags: [function private]
```

```Go
func numPrepares(t *testing.T, db *DB) int
```

numPrepares assumes that db has exactly 1 idle conn and returns its count of calls to Prepare 

### <a id="rowsColumnInfoSetupConnLocked" href="#rowsColumnInfoSetupConnLocked">func rowsColumnInfoSetupConnLocked(rowsi driver.Rows) []*ColumnType</a>

```
searchKey: sql.rowsColumnInfoSetupConnLocked
tags: [function private]
```

```Go
func rowsColumnInfoSetupConnLocked(rowsi driver.Rows) []*ColumnType
```

### <a id="rowsiFromStatement" href="#rowsiFromStatement">func rowsiFromStatement(ctx context.Context, ci driver.Conn, ds *driverStmt, args ...interface{}) (driver.Rows, error)</a>

```
searchKey: sql.rowsiFromStatement
tags: [function private]
```

```Go
func rowsiFromStatement(ctx context.Context, ci driver.Conn, ds *driverStmt, args ...interface{}) (driver.Rows, error)
```

### <a id="setHookOpenErr" href="#setHookOpenErr">func setHookOpenErr(fn func() error)</a>

```
searchKey: sql.setHookOpenErr
tags: [function private]
```

```Go
func setHookOpenErr(fn func() error)
```

### <a id="setHookpostCloseConn" href="#setHookpostCloseConn">func setHookpostCloseConn(fn func(*fakeConn, error))</a>

```
searchKey: sql.setHookpostCloseConn
tags: [function private]
```

```Go
func setHookpostCloseConn(fn func(*fakeConn, error))
```

### <a id="setRowsCloseHook" href="#setRowsCloseHook">func setRowsCloseHook(fn func(*Rows, *error))</a>

```
searchKey: sql.setRowsCloseHook
tags: [function private]
```

```Go
func setRowsCloseHook(fn func(*Rows, *error))
```

### <a id="setStrictFakeConnClose" href="#setStrictFakeConnClose">func setStrictFakeConnClose(t *testing.T)</a>

```
searchKey: sql.setStrictFakeConnClose
tags: [function private]
```

```Go
func setStrictFakeConnClose(t *testing.T)
```

setStrictFakeConnClose sets the t to Errorf on when fakeConn.Close fails to close. If nil, the check is disabled. 

### <a id="stack" href="#stack">func stack() string</a>

```
searchKey: sql.stack
tags: [function private]
```

```Go
func stack() string
```

### <a id="strconvErr" href="#strconvErr">func strconvErr(err error) error</a>

```
searchKey: sql.strconvErr
tags: [function private]
```

```Go
func strconvErr(err error) error
```

### <a id="timeValue" href="#timeValue">func timeValue(ptr interface{}) time.Time</a>

```
searchKey: sql.timeValue
tags: [function private]
```

```Go
func timeValue(ptr interface{}) time.Time
```

### <a id="uintValue" href="#uintValue">func uintValue(intptr interface{}) uint64</a>

```
searchKey: sql.uintValue
tags: [function private]
```

```Go
func uintValue(intptr interface{}) uint64
```

### <a id="unregisterAllDrivers" href="#unregisterAllDrivers">func unregisterAllDrivers()</a>

```
searchKey: sql.unregisterAllDrivers
tags: [function private]
```

```Go
func unregisterAllDrivers()
```

### <a id="validateNamedValueName" href="#validateNamedValueName">func validateNamedValueName(name string) error</a>

```
searchKey: sql.validateNamedValueName
tags: [function private]
```

```Go
func validateNamedValueName(name string) error
```

### <a id="waitCondition" href="#waitCondition">func waitCondition(waitFor, checkEvery time.Duration, fn func() bool) bool</a>

```
searchKey: sql.waitCondition
tags: [function private]
```

```Go
func waitCondition(waitFor, checkEvery time.Duration, fn func() bool) bool
```

### <a id="waitForFree" href="#waitForFree">func waitForFree(t *testing.T, db *DB, maxWait time.Duration, want int)</a>

```
searchKey: sql.waitForFree
tags: [function private]
```

```Go
func waitForFree(t *testing.T, db *DB, maxWait time.Duration, want int)
```

waitForFree checks db.numFreeConns until either it equals want or the maxWait time elapses. 

### <a id="waitForRowsClose" href="#waitForRowsClose">func waitForRowsClose(t *testing.T, rows *Rows, maxWait time.Duration)</a>

```
searchKey: sql.waitForRowsClose
tags: [function private]
```

```Go
func waitForRowsClose(t *testing.T, rows *Rows, maxWait time.Duration)
```

### <a id="withLock" href="#withLock">func withLock(lk sync.Locker, fn func())</a>

```
searchKey: sql.withLock
tags: [function private]
```

```Go
func withLock(lk sync.Locker, fn func())
```

withLock runs while holding lk. 

