# Package unsafeheader

Package unsafeheader contains header declarations for the Go runtime's slice and string implementations. 

This package allows packages that cannot import "reflect" to use types that are tested to be equivalent to reflect.SliceHeader and reflect.StringHeader. 

## Index

* [Types](#type)
    * [type Slice struct](#Slice)
    * [type String struct](#String)


## <a id="type" href="#type">Types</a>

### <a id="Slice" href="#Slice">type Slice struct</a>

```
searchKey: unsafeheader.Slice
tags: [exported]
```

```Go
type Slice struct {
	Data unsafe.Pointer
	Len  int
	Cap  int
}
```

Slice is the runtime representation of a slice. It cannot be used safely or portably and its representation may change in a later release. 

Unlike reflect.SliceHeader, its Data field is sufficient to guarantee the data it references will not be garbage collected. 

### <a id="String" href="#String">type String struct</a>

```
searchKey: unsafeheader.String
tags: [exported]
```

```Go
type String struct {
	Data unsafe.Pointer
	Len  int
}
```

String is the runtime representation of a string. It cannot be used safely or portably and its representation may change in a later release. 

Unlike reflect.StringHeader, its Data field is sufficient to guarantee the data it references will not be garbage collected. 

