# Package big_test

## Index

* [Functions](#func)
    * [func ExampleFloat_Add()](#ExampleFloat_Add)
    * [func ExampleFloat_Cmp()](#ExampleFloat_Cmp)
    * [func ExampleFloat_Scan()](#ExampleFloat_Scan)
    * [func ExampleFloat_SetString()](#ExampleFloat_SetString)
    * [func ExampleFloat_shift()](#ExampleFloat_shift)
    * [func ExampleInt_Scan()](#ExampleInt_Scan)
    * [func ExampleInt_SetString()](#ExampleInt_SetString)
    * [func ExampleRat_Scan()](#ExampleRat_Scan)
    * [func ExampleRat_SetString()](#ExampleRat_SetString)
    * [func ExampleRoundingMode()](#ExampleRoundingMode)
    * [func Example_eConvergents()](#Example_eConvergents)
    * [func Example_fibonacci()](#Example_fibonacci)
    * [func Example_sqrt2()](#Example_sqrt2)
    * [func recur(n, lim int64) *big.Rat](#recur)


## <a id="func" href="#func">Functions</a>

```
tags: [private]
```

### <a id="ExampleFloat_Add" href="#ExampleFloat_Add">func ExampleFloat_Add()</a>

```
searchKey: big_test.ExampleFloat_Add
tags: [function private]
```

```Go
func ExampleFloat_Add()
```

### <a id="ExampleFloat_Cmp" href="#ExampleFloat_Cmp">func ExampleFloat_Cmp()</a>

```
searchKey: big_test.ExampleFloat_Cmp
tags: [function private]
```

```Go
func ExampleFloat_Cmp()
```

### <a id="ExampleFloat_Scan" href="#ExampleFloat_Scan">func ExampleFloat_Scan()</a>

```
searchKey: big_test.ExampleFloat_Scan
tags: [function private]
```

```Go
func ExampleFloat_Scan()
```

### <a id="ExampleFloat_SetString" href="#ExampleFloat_SetString">func ExampleFloat_SetString()</a>

```
searchKey: big_test.ExampleFloat_SetString
tags: [function private]
```

```Go
func ExampleFloat_SetString()
```

### <a id="ExampleFloat_shift" href="#ExampleFloat_shift">func ExampleFloat_shift()</a>

```
searchKey: big_test.ExampleFloat_shift
tags: [function private]
```

```Go
func ExampleFloat_shift()
```

### <a id="ExampleInt_Scan" href="#ExampleInt_Scan">func ExampleInt_Scan()</a>

```
searchKey: big_test.ExampleInt_Scan
tags: [function private]
```

```Go
func ExampleInt_Scan()
```

### <a id="ExampleInt_SetString" href="#ExampleInt_SetString">func ExampleInt_SetString()</a>

```
searchKey: big_test.ExampleInt_SetString
tags: [function private]
```

```Go
func ExampleInt_SetString()
```

### <a id="ExampleRat_Scan" href="#ExampleRat_Scan">func ExampleRat_Scan()</a>

```
searchKey: big_test.ExampleRat_Scan
tags: [function private]
```

```Go
func ExampleRat_Scan()
```

### <a id="ExampleRat_SetString" href="#ExampleRat_SetString">func ExampleRat_SetString()</a>

```
searchKey: big_test.ExampleRat_SetString
tags: [function private]
```

```Go
func ExampleRat_SetString()
```

### <a id="ExampleRoundingMode" href="#ExampleRoundingMode">func ExampleRoundingMode()</a>

```
searchKey: big_test.ExampleRoundingMode
tags: [function private]
```

```Go
func ExampleRoundingMode()
```

### <a id="Example_eConvergents" href="#Example_eConvergents">func Example_eConvergents()</a>

```
searchKey: big_test.Example_eConvergents
tags: [function private]
```

```Go
func Example_eConvergents()
```

This example demonstrates how to use big.Rat to compute the first 15 terms in the sequence of rational convergents for the constant e (base of natural logarithm). 

### <a id="Example_fibonacci" href="#Example_fibonacci">func Example_fibonacci()</a>

```
searchKey: big_test.Example_fibonacci
tags: [function private]
```

```Go
func Example_fibonacci()
```

This example demonstrates how to use big.Int to compute the smallest Fibonacci number with 100 decimal digits and to test whether it is prime. 

### <a id="Example_sqrt2" href="#Example_sqrt2">func Example_sqrt2()</a>

```
searchKey: big_test.Example_sqrt2
tags: [function private]
```

```Go
func Example_sqrt2()
```

This example shows how to use big.Float to compute the square root of 2 with a precision of 200 bits, and how to print the result as a decimal number. 

### <a id="recur" href="#recur">func recur(n, lim int64) *big.Rat</a>

```
searchKey: big_test.recur
tags: [function private]
```

```Go
func recur(n, lim int64) *big.Rat
```

Use the classic continued fraction for e 

```
e = [1; 0, 1, 1, 2, 1, 1, ... 2n, 1, 1, ...]

```
i.e., for the nth term, use 

```
   1          if   n mod 3 != 1
(n-1)/3 * 2   if   n mod 3 == 1

```
