# Package flate_test

## Index

* [Functions](#func)
    * [func Example_dictionary()](#Example_dictionary)
    * [func Example_reset()](#Example_reset)
    * [func Example_synchronization()](#Example_synchronization)


## <a id="func" href="#func">Functions</a>

```
tags: [package private]
```

### <a id="Example_dictionary" href="#Example_dictionary">func Example_dictionary()</a>

```
searchKey: flate_test.Example_dictionary
tags: [function private]
```

```Go
func Example_dictionary()
```

A preset dictionary can be used to improve the compression ratio. The downside to using a dictionary is that the compressor and decompressor must agree in advance what dictionary to use. 

### <a id="Example_reset" href="#Example_reset">func Example_reset()</a>

```
searchKey: flate_test.Example_reset
tags: [function private]
```

```Go
func Example_reset()
```

In performance critical applications, Reset can be used to discard the current compressor or decompressor state and reinitialize them quickly by taking advantage of previously allocated memory. 

### <a id="Example_synchronization" href="#Example_synchronization">func Example_synchronization()</a>

```
searchKey: flate_test.Example_synchronization
tags: [function private]
```

```Go
func Example_synchronization()
```

DEFLATE is suitable for transmitting compressed data across the network. 

