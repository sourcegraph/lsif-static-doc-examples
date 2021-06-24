# Package goexperiment

Package goexperiment implements support for toolchain experiments. 

Toolchain experiments are controlled by the GOEXPERIMENT environment variable. GOEXPERIMENT is a comma-separated list of experiment names. GOEXPERIMENT can be set at make.bash time, which sets the default experiments for binaries built with the tool chain; or it can be set at build time. GOEXPERIMENT can also be set to "none", which disables any experiments that were enabled at make.bash time. 

Experiments are exposed to the build in the following ways: 

- Build tag goexperiment.x is set if experiment x (lower case) is enabled. 

- For each experiment x (in camel case), this package contains a boolean constant x and an integer constant xInt. 

- In runtime assembly, the macro GOEXPERIMENT_x is defined if experiment x (lower case) is enabled. 

In the toolchain, the set of experiments enabled for the current build should be accessed via objabi.Experiment. 

The set of experiments is included in the output of runtime.Version() and "go version <binary>" if it differs from the default experiments. 

For the set of experiments supported by the current toolchain, see "go doc goexperiment.Flags". 

Note that this package defines the set of experiments (in Flags) and records the experiments that were enabled when the package was compiled (as boolean and integer constants). 

Note especially that this package does not itself change behavior at run time based on the GOEXPERIMENT variable. The code used in builds to interpret the GOEXPERIMENT variable is in the separate package internal/buildcfg. 

## Index

* [Constants](#const)
    * [const FieldTrack](#FieldTrack)
    * [const FieldTrackInt](#FieldTrackInt)
    * [const PreemptibleLoops](#PreemptibleLoops)
    * [const PreemptibleLoopsInt](#PreemptibleLoopsInt)
    * [const Regabi](#Regabi)
    * [const RegabiArgs](#RegabiArgs)
    * [const RegabiArgsInt](#RegabiArgsInt)
    * [const RegabiDefer](#RegabiDefer)
    * [const RegabiDeferInt](#RegabiDeferInt)
    * [const RegabiG](#RegabiG)
    * [const RegabiGInt](#RegabiGInt)
    * [const RegabiInt](#RegabiInt)
    * [const RegabiReflect](#RegabiReflect)
    * [const RegabiReflectInt](#RegabiReflectInt)
    * [const RegabiWrappers](#RegabiWrappers)
    * [const RegabiWrappersInt](#RegabiWrappersInt)
    * [const StaticLockRanking](#StaticLockRanking)
    * [const StaticLockRankingInt](#StaticLockRankingInt)
* [Types](#type)
    * [type Flags struct](#Flags)


## <a id="const" href="#const">Constants</a>

```
tags: [package private]
```

### <a id="FieldTrack" href="#FieldTrack">const FieldTrack</a>

```
searchKey: goexperiment.FieldTrack
tags: [constant boolean]
```

```Go
const FieldTrack = false
```

### <a id="FieldTrackInt" href="#FieldTrackInt">const FieldTrackInt</a>

```
searchKey: goexperiment.FieldTrackInt
tags: [constant number]
```

```Go
const FieldTrackInt = 0
```

### <a id="PreemptibleLoops" href="#PreemptibleLoops">const PreemptibleLoops</a>

```
searchKey: goexperiment.PreemptibleLoops
tags: [constant boolean]
```

```Go
const PreemptibleLoops = false
```

### <a id="PreemptibleLoopsInt" href="#PreemptibleLoopsInt">const PreemptibleLoopsInt</a>

```
searchKey: goexperiment.PreemptibleLoopsInt
tags: [constant number]
```

```Go
const PreemptibleLoopsInt = 0
```

### <a id="Regabi" href="#Regabi">const Regabi</a>

```
searchKey: goexperiment.Regabi
tags: [constant boolean]
```

```Go
const Regabi = false
```

### <a id="RegabiArgs" href="#RegabiArgs">const RegabiArgs</a>

```
searchKey: goexperiment.RegabiArgs
tags: [constant boolean]
```

```Go
const RegabiArgs = false
```

### <a id="RegabiArgsInt" href="#RegabiArgsInt">const RegabiArgsInt</a>

```
searchKey: goexperiment.RegabiArgsInt
tags: [constant number]
```

```Go
const RegabiArgsInt = 0
```

### <a id="RegabiDefer" href="#RegabiDefer">const RegabiDefer</a>

```
searchKey: goexperiment.RegabiDefer
tags: [constant boolean]
```

```Go
const RegabiDefer = false
```

### <a id="RegabiDeferInt" href="#RegabiDeferInt">const RegabiDeferInt</a>

```
searchKey: goexperiment.RegabiDeferInt
tags: [constant number]
```

```Go
const RegabiDeferInt = 0
```

### <a id="RegabiG" href="#RegabiG">const RegabiG</a>

```
searchKey: goexperiment.RegabiG
tags: [constant boolean]
```

```Go
const RegabiG = false
```

### <a id="RegabiGInt" href="#RegabiGInt">const RegabiGInt</a>

```
searchKey: goexperiment.RegabiGInt
tags: [constant number]
```

```Go
const RegabiGInt = 0
```

### <a id="RegabiInt" href="#RegabiInt">const RegabiInt</a>

```
searchKey: goexperiment.RegabiInt
tags: [constant number]
```

```Go
const RegabiInt = 0
```

### <a id="RegabiReflect" href="#RegabiReflect">const RegabiReflect</a>

```
searchKey: goexperiment.RegabiReflect
tags: [constant boolean]
```

```Go
const RegabiReflect = false
```

### <a id="RegabiReflectInt" href="#RegabiReflectInt">const RegabiReflectInt</a>

```
searchKey: goexperiment.RegabiReflectInt
tags: [constant number]
```

```Go
const RegabiReflectInt = 0
```

### <a id="RegabiWrappers" href="#RegabiWrappers">const RegabiWrappers</a>

```
searchKey: goexperiment.RegabiWrappers
tags: [constant boolean]
```

```Go
const RegabiWrappers = false
```

### <a id="RegabiWrappersInt" href="#RegabiWrappersInt">const RegabiWrappersInt</a>

```
searchKey: goexperiment.RegabiWrappersInt
tags: [constant number]
```

```Go
const RegabiWrappersInt = 0
```

### <a id="StaticLockRanking" href="#StaticLockRanking">const StaticLockRanking</a>

```
searchKey: goexperiment.StaticLockRanking
tags: [constant boolean]
```

```Go
const StaticLockRanking = false
```

### <a id="StaticLockRankingInt" href="#StaticLockRankingInt">const StaticLockRankingInt</a>

```
searchKey: goexperiment.StaticLockRankingInt
tags: [constant number]
```

```Go
const StaticLockRankingInt = 0
```

## <a id="type" href="#type">Types</a>

```
tags: [package private]
```

### <a id="Flags" href="#Flags">type Flags struct</a>

```
searchKey: goexperiment.Flags
tags: [struct]
```

```Go
type Flags struct {
	FieldTrack        bool
	PreemptibleLoops  bool
	StaticLockRanking bool

	// RegabiWrappers enables ABI wrappers for calling between
	// ABI0 and ABIInternal functions. Without this, the ABIs are
	// assumed to be identical so cross-ABI calls are direct.
	RegabiWrappers bool
	// RegabiG enables dedicated G and zero registers in
	// ABIInternal.
	//
	// Requires wrappers because it makes the ABIs incompatible.
	RegabiG bool
	// RegabiReflect enables the register-passing paths in
	// reflection calls. This is also gated by intArgRegs in
	// reflect and runtime (which are disabled by default) so it
	// can be used in targeted tests.
	RegabiReflect bool
	// RegabiDefer enables desugaring defer and go calls
	// into argument-less closures.
	RegabiDefer bool
	// RegabiArgs enables register arguments/results in all
	// compiled Go functions.
	//
	// Requires wrappers (to do ABI translation), g (because
	// runtime assembly that's been ported to ABIInternal uses the
	// G register), reflect (so reflection calls use registers),
	// and defer (because the runtime doesn't support passing
	// register arguments to defer/go).
	RegabiArgs bool
}
```

Flags is the set of experiments that can be enabled or disabled in the current toolchain. 

When specified in the GOEXPERIMENT environment variable or as build tags, experiments use the strings.ToLower of their field name. 

For the baseline experimental configuration, see objabi.experimentBaseline. 

If you change this struct definition, run "go generate". 

