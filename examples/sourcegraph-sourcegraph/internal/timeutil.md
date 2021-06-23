# Package timeutil

## Index

* [Types](#type)
    * [type FakeClock struct](#FakeClock)
        * [func NewFakeClock(epoch time.Time, step time.Duration) FakeClock](#NewFakeClock)
        * [func (c *FakeClock) Now() time.Time](#FakeClock.Now)
        * [func (c FakeClock) Time(step int) time.Time](#FakeClock.Time)
* [Functions](#func)
    * [func Now() time.Time](#Now)
    * [func StartOfWeek(now time.Time, weeksAgo int) time.Time](#StartOfWeek)
    * [func TestWeek_StartOfWeek(t *testing.T)](#TestWeek_StartOfWeek)


## <a id="type" href="#type">Types</a>

```
tags: [private]
```

### <a id="FakeClock" href="#FakeClock">type FakeClock struct</a>

```
searchKey: timeutil.FakeClock
```

```Go
type FakeClock struct {
	epoch time.Time
	step  time.Duration
	steps int
}
```

FakeClock provides a controllable clock for use in tests. 

#### <a id="NewFakeClock" href="#NewFakeClock">func NewFakeClock(epoch time.Time, step time.Duration) FakeClock</a>

```
searchKey: timeutil.NewFakeClock
```

```Go
func NewFakeClock(epoch time.Time, step time.Duration) FakeClock
```

NewFakeClock returns a FakeClock instance that starts telling time at the given epoch. Every invocation of Now adds step amount of time to the clock. 

#### <a id="FakeClock.Now" href="#FakeClock.Now">func (c *FakeClock) Now() time.Time</a>

```
searchKey: timeutil.FakeClock.Now
```

```Go
func (c *FakeClock) Now() time.Time
```

Now returns the current fake time and advances the clock "step" amount of time. 

#### <a id="FakeClock.Time" href="#FakeClock.Time">func (c FakeClock) Time(step int) time.Time</a>

```
searchKey: timeutil.FakeClock.Time
```

```Go
func (c FakeClock) Time(step int) time.Time
```

Time tells the time at the given step from the provided epoch. 

## <a id="func" href="#func">Functions</a>

```
tags: [private]
```

### <a id="Now" href="#Now">func Now() time.Time</a>

```
searchKey: timeutil.Now
```

```Go
func Now() time.Time
```

Now returns the current UTC time with time.Microsecond truncated because Postgres 9.6 does not support saving microsecond. This is particularly useful when trying to compare time values between Go and what we get back from the Postgres. 

### <a id="StartOfWeek" href="#StartOfWeek">func StartOfWeek(now time.Time, weeksAgo int) time.Time</a>

```
searchKey: timeutil.StartOfWeek
```

```Go
func StartOfWeek(now time.Time, weeksAgo int) time.Time
```

### <a id="TestWeek_StartOfWeek" href="#TestWeek_StartOfWeek">func TestWeek_StartOfWeek(t *testing.T)</a>

```
searchKey: timeutil.TestWeek_StartOfWeek
tags: [private]
```

```Go
func TestWeek_StartOfWeek(t *testing.T)
```

