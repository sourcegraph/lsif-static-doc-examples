# Package profile

Package profile provides a representation of github.com/google/pprof/proto/profile.proto and methods to encode/decode/merge profiles in this format. 

## Index

* [Constants](#const)
    * [const unrecognizedSection](#unrecognizedSection)
    * [const memoryMapSection](#memoryMapSection)
* [Variables](#var)
    * [var profileDecoder](#profileDecoder)
    * [var valueTypeDecoder](#valueTypeDecoder)
    * [var sampleDecoder](#sampleDecoder)
    * [var labelDecoder](#labelDecoder)
    * [var mappingDecoder](#mappingDecoder)
    * [var locationDecoder](#locationDecoder)
    * [var lineDecoder](#lineDecoder)
    * [var functionDecoder](#functionDecoder)
    * [var countStartRE](#countStartRE)
    * [var countRE](#countRE)
    * [var heapHeaderRE](#heapHeaderRE)
    * [var heapSampleRE](#heapSampleRE)
    * [var contentionSampleRE](#contentionSampleRE)
    * [var hexNumberRE](#hexNumberRE)
    * [var growthHeaderRE](#growthHeaderRE)
    * [var fragmentationHeaderRE](#fragmentationHeaderRE)
    * [var threadzStartRE](#threadzStartRE)
    * [var threadStartRE](#threadStartRE)
    * [var procMapsRE](#procMapsRE)
    * [var briefMapsRE](#briefMapsRE)
    * [var LegacyHeapAllocated](#LegacyHeapAllocated)
    * [var cpuInts](#cpuInts)
    * [var memoryMapTriggers](#memoryMapTriggers)
    * [var heapzSampleTypes](#heapzSampleTypes)
    * [var heapzInUseSampleTypes](#heapzInUseSampleTypes)
    * [var heapzAllocSampleTypes](#heapzAllocSampleTypes)
    * [var contentionzSampleTypes](#contentionzSampleTypes)
    * [var allocRxStr](#allocRxStr)
    * [var allocSkipRxStr](#allocSkipRxStr)
    * [var cpuProfilerRxStr](#cpuProfilerRxStr)
    * [var lockRxStr](#lockRxStr)
    * [var errUnrecognized](#errUnrecognized)
    * [var errMalformed](#errMalformed)
    * [var libRx](#libRx)
* [Types](#type)
    * [type TagMatch func(key string, val string, nval int64) bool](#TagMatch)
    * [type sectionType int](#sectionType)
        * [func sectionTrigger(line string) sectionType](#sectionTrigger)
    * [type profileMerger struct](#profileMerger)
        * [func (pm *profileMerger) mapSample(src *Sample) *Sample](#profileMerger.mapSample)
        * [func (pm *profileMerger) mapLocation(src *Location) *Location](#profileMerger.mapLocation)
        * [func (pm *profileMerger) mapMapping(src *Mapping) mapInfo](#profileMerger.mapMapping)
        * [func (pm *profileMerger) mapLine(src Line) Line](#profileMerger.mapLine)
        * [func (pm *profileMerger) mapFunction(src *Function) *Function](#profileMerger.mapFunction)
    * [type mapInfo struct](#mapInfo)
    * [type sampleKey struct](#sampleKey)
    * [type locationKey struct](#locationKey)
    * [type mappingKey struct](#mappingKey)
    * [type functionKey struct](#functionKey)
    * [type Profile struct](#Profile)
        * [func parseGoCount(b []byte) (*Profile, error)](#parseGoCount)
        * [func ParseTracebacks(b []byte) (*Profile, error)](#ParseTracebacks)
        * [func parseCPU(b []byte) (*Profile, error)](#parseCPU)
        * [func cpuProfile(b []byte, period int64, parse func(b []byte) (uint64, []byte)) (*Profile, error)](#cpuProfile)
        * [func parseHeap(b []byte) (p *Profile, err error)](#parseHeap)
        * [func parseContention(b []byte) (*Profile, error)](#parseContention)
        * [func parseCppContention(r *bytes.Buffer) (*Profile, error)](#parseCppContention)
        * [func parseThread(b []byte) (*Profile, error)](#parseThread)
        * [func Merge(srcs []*Profile) (*Profile, error)](#Merge)
        * [func combineHeaders(srcs []*Profile) (*Profile, error)](#combineHeaders)
        * [func Parse(r io.Reader) (*Profile, error)](#Parse)
        * [func parseLegacy(data []byte) (*Profile, error)](#parseLegacy)
        * [func parseUncompressed(data []byte) (*Profile, error)](#parseUncompressed)
        * [func (p *Profile) decoder() []decoder](#Profile.decoder)
        * [func (p *Profile) preEncode()](#Profile.preEncode)
        * [func (p *Profile) encode(b *buffer)](#Profile.encode)
        * [func (p *Profile) postDecode() error](#Profile.postDecode)
        * [func (p *Profile) FilterSamplesByName(focus, ignore, hide *regexp.Regexp) (fm, im, hm bool)](#Profile.FilterSamplesByName)
        * [func (p *Profile) FilterSamplesByTag(focus, ignore TagMatch) (fm, im bool)](#Profile.FilterSamplesByTag)
        * [func (p *Profile) remapLocationIDs()](#Profile.remapLocationIDs)
        * [func (p *Profile) remapFunctionIDs()](#Profile.remapFunctionIDs)
        * [func (p *Profile) remapMappingIDs()](#Profile.remapMappingIDs)
        * [func (p *Profile) ParseMemoryMap(rd io.Reader) error](#Profile.ParseMemoryMap)
        * [func (p *Profile) addLegacyFrameInfo()](#Profile.addLegacyFrameInfo)
        * [func (p *Profile) Normalize(pb *Profile) error](#Profile.Normalize)
        * [func (p *Profile) compatible(pb *Profile) error](#Profile.compatible)
        * [func (p *Profile) setMain()](#Profile.setMain)
        * [func (p *Profile) Write(w io.Writer) error](#Profile.Write)
        * [func (p *Profile) CheckValid() error](#Profile.CheckValid)
        * [func (p *Profile) Aggregate(inlineFrame, function, filename, linenumber, address bool) error](#Profile.Aggregate)
        * [func (p *Profile) String() string](#Profile.String)
        * [func (p *Profile) Merge(pb *Profile, r float64) error](#Profile.Merge)
        * [func (p *Profile) Compatible(pb *Profile) error](#Profile.Compatible)
        * [func (p *Profile) HasFunctions() bool](#Profile.HasFunctions)
        * [func (p *Profile) HasFileLines() bool](#Profile.HasFileLines)
        * [func (p *Profile) Copy() *Profile](#Profile.Copy)
        * [func (p *Profile) Demangle(d Demangler) error](#Profile.Demangle)
        * [func (p *Profile) Empty() bool](#Profile.Empty)
        * [func (p *Profile) Scale(ratio float64)](#Profile.Scale)
        * [func (p *Profile) ScaleN(ratios []float64) error](#Profile.ScaleN)
        * [func (p *Profile) Prune(dropRx, keepRx *regexp.Regexp)](#Profile.Prune)
        * [func (p *Profile) RemoveUninteresting() error](#Profile.RemoveUninteresting)
    * [type ValueType struct](#ValueType)
        * [func (p *ValueType) decoder() []decoder](#ValueType.decoder)
        * [func (p *ValueType) encode(b *buffer)](#ValueType.encode)
    * [type Sample struct](#Sample)
        * [func (p *Sample) decoder() []decoder](#Sample.decoder)
        * [func (p *Sample) encode(b *buffer)](#Sample.encode)
        * [func (sample *Sample) key() sampleKey](#Sample.key)
    * [type Label struct](#Label)
        * [func (p Label) decoder() []decoder](#Label.decoder)
        * [func (p Label) encode(b *buffer)](#Label.encode)
    * [type Mapping struct](#Mapping)
        * [func parseMappingEntry(l string) (*Mapping, error)](#parseMappingEntry)
        * [func (p *Mapping) decoder() []decoder](#Mapping.decoder)
        * [func (p *Mapping) encode(b *buffer)](#Mapping.encode)
        * [func (m *Mapping) key() mappingKey](#Mapping.key)
    * [type Location struct](#Location)
        * [func (p *Location) decoder() []decoder](#Location.decoder)
        * [func (p *Location) encode(b *buffer)](#Location.encode)
        * [func (loc *Location) matchesName(re *regexp.Regexp) bool](#Location.matchesName)
        * [func (loc *Location) unmatchedLines(re *regexp.Regexp) []Line](#Location.unmatchedLines)
        * [func (l *Location) key() locationKey](#Location.key)
    * [type Line struct](#Line)
        * [func (p *Line) decoder() []decoder](#Line.decoder)
        * [func (p *Line) encode(b *buffer)](#Line.encode)
    * [type Function struct](#Function)
        * [func (p *Function) decoder() []decoder](#Function.decoder)
        * [func (p *Function) encode(b *buffer)](#Function.encode)
        * [func (f *Function) key() functionKey](#Function.key)
    * [type Demangler func(name []string) (map[string]string, error)](#Demangler)
    * [type buffer struct](#buffer)
    * [type decoder func(*std/internal/profile.buffer, std/internal/profile.message) error](#decoder)
    * [type message interface](#message)
    * [type packedInts struct](#packedInts)
        * [func (u *packedInts) decoder() []decoder](#packedInts.decoder)
        * [func (u *packedInts) encode(b *buffer)](#packedInts.encode)
* [Functions](#func)
    * [func addString(strings map[string]int, s string) int64](#addString)
    * [func getString(strings []string, strng *int64, err error) (string, error)](#getString)
    * [func focusedAndNotIgnored(locs []*Location, m map[uint64]bool) bool](#focusedAndNotIgnored)
    * [func focusedSample(s *Sample, focus, ignore TagMatch) (fm, im bool)](#focusedSample)
    * [func isSpaceOrComment(line string) bool](#isSpaceOrComment)
    * [func get32l(b []byte) (uint64, []byte)](#get32l)
    * [func get32b(b []byte) (uint64, []byte)](#get32b)
    * [func get64l(b []byte) (uint64, []byte)](#get64l)
    * [func get64b(b []byte) (uint64, []byte)](#get64b)
    * [func addTracebackSample(l []*Location, s []string, p *Profile)](#addTracebackSample)
    * [func parseCPUSamples(b []byte, parse func(b []byte) (uint64, []byte), adjust bool, p *Profile) ([]byte, map[uint64]*Location, error)](#parseCPUSamples)
    * [func parseHeapSample(line string, rate int64, sampling string) (value []int64, blocksize int64, addrs []uint64, err error)](#parseHeapSample)
    * [func extractHexAddresses(s string) ([]string, []uint64)](#extractHexAddresses)
    * [func parseHexAddresses(s string) []uint64](#parseHexAddresses)
    * [func scaleHeapSample(count, size, rate int64) (int64, int64)](#scaleHeapSample)
    * [func parseContentionSample(line string, period, cpuHz int64) (value []int64, addrs []uint64, err error)](#parseContentionSample)
    * [func parseThreadSample(b *bytes.Buffer) (nextl string, addrs []uint64, err error)](#parseThreadSample)
    * [func parseAdditionalSections(l string, b *bytes.Buffer, p *Profile) (err error)](#parseAdditionalSections)
    * [func isProfileType(p *Profile, t []string) bool](#isProfileType)
    * [func isZeroSample(s *Sample) bool](#isZeroSample)
    * [func equalValueType(st1, st2 *ValueType) bool](#equalValueType)
    * [func compatibleValueTypes(v1, v2 *ValueType) bool](#compatibleValueTypes)
    * [func marshal(m message) []byte](#marshal)
    * [func encodeVarint(b *buffer, x uint64)](#encodeVarint)
    * [func encodeLength(b *buffer, tag int, len int)](#encodeLength)
    * [func encodeUint64(b *buffer, tag int, x uint64)](#encodeUint64)
    * [func encodeUint64s(b *buffer, tag int, x []uint64)](#encodeUint64s)
    * [func encodeUint64Opt(b *buffer, tag int, x uint64)](#encodeUint64Opt)
    * [func encodeInt64(b *buffer, tag int, x int64)](#encodeInt64)
    * [func encodeInt64Opt(b *buffer, tag int, x int64)](#encodeInt64Opt)
    * [func encodeInt64s(b *buffer, tag int, x []int64)](#encodeInt64s)
    * [func encodeString(b *buffer, tag int, x string)](#encodeString)
    * [func encodeStrings(b *buffer, tag int, x []string)](#encodeStrings)
    * [func encodeStringOpt(b *buffer, tag int, x string)](#encodeStringOpt)
    * [func encodeBool(b *buffer, tag int, x bool)](#encodeBool)
    * [func encodeBoolOpt(b *buffer, tag int, x bool)](#encodeBoolOpt)
    * [func encodeMessage(b *buffer, tag int, m message)](#encodeMessage)
    * [func unmarshal(data []byte, m message) (err error)](#unmarshal)
    * [func le64(p []byte) uint64](#le64)
    * [func le32(p []byte) uint32](#le32)
    * [func decodeVarint(data []byte) (uint64, []byte, error)](#decodeVarint)
    * [func decodeField(b *buffer, data []byte) ([]byte, error)](#decodeField)
    * [func checkType(b *buffer, typ int) error](#checkType)
    * [func decodeMessage(b *buffer, m message) error](#decodeMessage)
    * [func decodeInt64(b *buffer, x *int64) error](#decodeInt64)
    * [func decodeInt64s(b *buffer, x *[]int64) error](#decodeInt64s)
    * [func decodeUint64(b *buffer, x *uint64) error](#decodeUint64)
    * [func decodeUint64s(b *buffer, x *[]uint64) error](#decodeUint64s)
    * [func decodeString(b *buffer, x *string) error](#decodeString)
    * [func decodeStrings(b *buffer, x *[]string) error](#decodeStrings)
    * [func decodeBool(b *buffer, x *bool) error](#decodeBool)
    * [func TestEmptyProfile(t *testing.T)](#TestEmptyProfile)
    * [func TestParseContention(t *testing.T)](#TestParseContention)
    * [func TestPackedEncoding(t *testing.T)](#TestPackedEncoding)


## <a id="const" href="#const">Constants</a>

```
tags: [private]
```

### <a id="unrecognizedSection" href="#unrecognizedSection">const unrecognizedSection</a>

```
searchKey: profile.unrecognizedSection
tags: [private]
```

```Go
const unrecognizedSection sectionType = iota
```

### <a id="memoryMapSection" href="#memoryMapSection">const memoryMapSection</a>

```
searchKey: profile.memoryMapSection
tags: [private]
```

```Go
const memoryMapSection
```

## <a id="var" href="#var">Variables</a>

```
tags: [private]
```

### <a id="profileDecoder" href="#profileDecoder">var profileDecoder</a>

```
searchKey: profile.profileDecoder
tags: [private]
```

```Go
var profileDecoder = ...
```

### <a id="valueTypeDecoder" href="#valueTypeDecoder">var valueTypeDecoder</a>

```
searchKey: profile.valueTypeDecoder
tags: [private]
```

```Go
var valueTypeDecoder = ...
```

### <a id="sampleDecoder" href="#sampleDecoder">var sampleDecoder</a>

```
searchKey: profile.sampleDecoder
tags: [private]
```

```Go
var sampleDecoder = ...
```

### <a id="labelDecoder" href="#labelDecoder">var labelDecoder</a>

```
searchKey: profile.labelDecoder
tags: [private]
```

```Go
var labelDecoder = ...
```

### <a id="mappingDecoder" href="#mappingDecoder">var mappingDecoder</a>

```
searchKey: profile.mappingDecoder
tags: [private]
```

```Go
var mappingDecoder = ...
```

### <a id="locationDecoder" href="#locationDecoder">var locationDecoder</a>

```
searchKey: profile.locationDecoder
tags: [private]
```

```Go
var locationDecoder = ...
```

### <a id="lineDecoder" href="#lineDecoder">var lineDecoder</a>

```
searchKey: profile.lineDecoder
tags: [private]
```

```Go
var lineDecoder = ...
```

### <a id="functionDecoder" href="#functionDecoder">var functionDecoder</a>

```
searchKey: profile.functionDecoder
tags: [private]
```

```Go
var functionDecoder = ...
```

### <a id="countStartRE" href="#countStartRE">var countStartRE</a>

```
searchKey: profile.countStartRE
tags: [private]
```

```Go
var countStartRE = regexp.MustCompile(`\A(\w+) profile: total \d+\n\z`)
```

### <a id="countRE" href="#countRE">var countRE</a>

```
searchKey: profile.countRE
tags: [private]
```

```Go
var countRE = regexp.MustCompile(`\A(\d+) @(( 0x[0-9a-f]+)+)\n\z`)
```

### <a id="heapHeaderRE" href="#heapHeaderRE">var heapHeaderRE</a>

```
searchKey: profile.heapHeaderRE
tags: [private]
```

```Go
var heapHeaderRE = ...
```

### <a id="heapSampleRE" href="#heapSampleRE">var heapSampleRE</a>

```
searchKey: profile.heapSampleRE
tags: [private]
```

```Go
var heapSampleRE = regexp.MustCompile(`(-?\d+): *(-?\d+) *\[ *(\d+): *(\d+) *] @([ x0-9a-f]*)`)
```

### <a id="contentionSampleRE" href="#contentionSampleRE">var contentionSampleRE</a>

```
searchKey: profile.contentionSampleRE
tags: [private]
```

```Go
var contentionSampleRE = regexp.MustCompile(`(\d+) *(\d+) @([ x0-9a-f]*)`)
```

### <a id="hexNumberRE" href="#hexNumberRE">var hexNumberRE</a>

```
searchKey: profile.hexNumberRE
tags: [private]
```

```Go
var hexNumberRE = regexp.MustCompile(`0x[0-9a-f]+`)
```

### <a id="growthHeaderRE" href="#growthHeaderRE">var growthHeaderRE</a>

```
searchKey: profile.growthHeaderRE
tags: [private]
```

```Go
var growthHeaderRE = ...
```

### <a id="fragmentationHeaderRE" href="#fragmentationHeaderRE">var fragmentationHeaderRE</a>

```
searchKey: profile.fragmentationHeaderRE
tags: [private]
```

```Go
var fragmentationHeaderRE = ...
```

### <a id="threadzStartRE" href="#threadzStartRE">var threadzStartRE</a>

```
searchKey: profile.threadzStartRE
tags: [private]
```

```Go
var threadzStartRE = regexp.MustCompile(`--- threadz \d+ ---`)
```

### <a id="threadStartRE" href="#threadStartRE">var threadStartRE</a>

```
searchKey: profile.threadStartRE
tags: [private]
```

```Go
var threadStartRE = regexp.MustCompile(`--- Thread ([[:xdigit:]]+) \(name: (.*)/(\d+)\) stack: ---`)
```

### <a id="procMapsRE" href="#procMapsRE">var procMapsRE</a>

```
searchKey: profile.procMapsRE
tags: [private]
```

```Go
var procMapsRE = ...
```

### <a id="briefMapsRE" href="#briefMapsRE">var briefMapsRE</a>

```
searchKey: profile.briefMapsRE
tags: [private]
```

```Go
var briefMapsRE = ...
```

### <a id="LegacyHeapAllocated" href="#LegacyHeapAllocated">var LegacyHeapAllocated</a>

```
searchKey: profile.LegacyHeapAllocated
```

```Go
var LegacyHeapAllocated bool
```

LegacyHeapAllocated instructs the heapz parsers to use the allocated memory stats instead of the default in-use memory. Note that tcmalloc doesn't provide all allocated memory, only in-use stats. 

### <a id="cpuInts" href="#cpuInts">var cpuInts</a>

```
searchKey: profile.cpuInts
tags: [private]
```

```Go
var cpuInts = []func([]byte) (uint64, []byte){
	get32l,
	get32b,
	get64l,
	get64b,
}
```

### <a id="memoryMapTriggers" href="#memoryMapTriggers">var memoryMapTriggers</a>

```
searchKey: profile.memoryMapTriggers
tags: [private]
```

```Go
var memoryMapTriggers = []string{
	"--- Memory map: ---",
	"MAPPED_LIBRARIES:",
}
```

### <a id="heapzSampleTypes" href="#heapzSampleTypes">var heapzSampleTypes</a>

```
searchKey: profile.heapzSampleTypes
tags: [private]
```

```Go
var heapzSampleTypes = []string{"allocations", "size"} // early Go pprof profiles

```

### <a id="heapzInUseSampleTypes" href="#heapzInUseSampleTypes">var heapzInUseSampleTypes</a>

```
searchKey: profile.heapzInUseSampleTypes
tags: [private]
```

```Go
var heapzInUseSampleTypes = []string{"inuse_objects", "inuse_space"}
```

### <a id="heapzAllocSampleTypes" href="#heapzAllocSampleTypes">var heapzAllocSampleTypes</a>

```
searchKey: profile.heapzAllocSampleTypes
tags: [private]
```

```Go
var heapzAllocSampleTypes = []string{"alloc_objects", "alloc_space"}
```

### <a id="contentionzSampleTypes" href="#contentionzSampleTypes">var contentionzSampleTypes</a>

```
searchKey: profile.contentionzSampleTypes
tags: [private]
```

```Go
var contentionzSampleTypes = []string{"contentions", "delay"}
```

### <a id="allocRxStr" href="#allocRxStr">var allocRxStr</a>

```
searchKey: profile.allocRxStr
tags: [private]
```

```Go
var allocRxStr = ...
```

### <a id="allocSkipRxStr" href="#allocSkipRxStr">var allocSkipRxStr</a>

```
searchKey: profile.allocSkipRxStr
tags: [private]
```

```Go
var allocSkipRxStr = ...
```

### <a id="cpuProfilerRxStr" href="#cpuProfilerRxStr">var cpuProfilerRxStr</a>

```
searchKey: profile.cpuProfilerRxStr
tags: [private]
```

```Go
var cpuProfilerRxStr = ...
```

### <a id="lockRxStr" href="#lockRxStr">var lockRxStr</a>

```
searchKey: profile.lockRxStr
tags: [private]
```

```Go
var lockRxStr = ...
```

### <a id="errUnrecognized" href="#errUnrecognized">var errUnrecognized</a>

```
searchKey: profile.errUnrecognized
tags: [private]
```

```Go
var errUnrecognized = fmt.Errorf("unrecognized profile format")
```

### <a id="errMalformed" href="#errMalformed">var errMalformed</a>

```
searchKey: profile.errMalformed
tags: [private]
```

```Go
var errMalformed = fmt.Errorf("malformed profile format")
```

### <a id="libRx" href="#libRx">var libRx</a>

```
searchKey: profile.libRx
tags: [private]
```

```Go
var libRx = regexp.MustCompile(`([.]so$|[.]so[._][0-9]+)`)
```

## <a id="type" href="#type">Types</a>

```
tags: [private]
```

### <a id="TagMatch" href="#TagMatch">type TagMatch func(key string, val string, nval int64) bool</a>

```
searchKey: profile.TagMatch
```

```Go
type TagMatch func(key, val string, nval int64) bool
```

TagMatch selects tags for filtering 

### <a id="sectionType" href="#sectionType">type sectionType int</a>

```
searchKey: profile.sectionType
tags: [private]
```

```Go
type sectionType int
```

#### <a id="sectionTrigger" href="#sectionTrigger">func sectionTrigger(line string) sectionType</a>

```
searchKey: profile.sectionTrigger
tags: [private]
```

```Go
func sectionTrigger(line string) sectionType
```

### <a id="profileMerger" href="#profileMerger">type profileMerger struct</a>

```
searchKey: profile.profileMerger
tags: [private]
```

```Go
type profileMerger struct {
	p *Profile

	// Memoization tables within a profile.
	locationsByID map[uint64]*Location
	functionsByID map[uint64]*Function
	mappingsByID  map[uint64]mapInfo

	// Memoization tables for profile entities.
	samples   map[sampleKey]*Sample
	locations map[locationKey]*Location
	functions map[functionKey]*Function
	mappings  map[mappingKey]*Mapping
}
```

#### <a id="profileMerger.mapSample" href="#profileMerger.mapSample">func (pm *profileMerger) mapSample(src *Sample) *Sample</a>

```
searchKey: profile.profileMerger.mapSample
tags: [private]
```

```Go
func (pm *profileMerger) mapSample(src *Sample) *Sample
```

#### <a id="profileMerger.mapLocation" href="#profileMerger.mapLocation">func (pm *profileMerger) mapLocation(src *Location) *Location</a>

```
searchKey: profile.profileMerger.mapLocation
tags: [private]
```

```Go
func (pm *profileMerger) mapLocation(src *Location) *Location
```

#### <a id="profileMerger.mapMapping" href="#profileMerger.mapMapping">func (pm *profileMerger) mapMapping(src *Mapping) mapInfo</a>

```
searchKey: profile.profileMerger.mapMapping
tags: [private]
```

```Go
func (pm *profileMerger) mapMapping(src *Mapping) mapInfo
```

#### <a id="profileMerger.mapLine" href="#profileMerger.mapLine">func (pm *profileMerger) mapLine(src Line) Line</a>

```
searchKey: profile.profileMerger.mapLine
tags: [private]
```

```Go
func (pm *profileMerger) mapLine(src Line) Line
```

#### <a id="profileMerger.mapFunction" href="#profileMerger.mapFunction">func (pm *profileMerger) mapFunction(src *Function) *Function</a>

```
searchKey: profile.profileMerger.mapFunction
tags: [private]
```

```Go
func (pm *profileMerger) mapFunction(src *Function) *Function
```

### <a id="mapInfo" href="#mapInfo">type mapInfo struct</a>

```
searchKey: profile.mapInfo
tags: [private]
```

```Go
type mapInfo struct {
	m      *Mapping
	offset int64
}
```

### <a id="sampleKey" href="#sampleKey">type sampleKey struct</a>

```
searchKey: profile.sampleKey
tags: [private]
```

```Go
type sampleKey struct {
	locations string
	labels    string
	numlabels string
}
```

### <a id="locationKey" href="#locationKey">type locationKey struct</a>

```
searchKey: profile.locationKey
tags: [private]
```

```Go
type locationKey struct {
	addr, mappingID uint64
	lines           string
	isFolded        bool
}
```

### <a id="mappingKey" href="#mappingKey">type mappingKey struct</a>

```
searchKey: profile.mappingKey
tags: [private]
```

```Go
type mappingKey struct {
	size, offset  uint64
	buildIDOrFile string
}
```

### <a id="functionKey" href="#functionKey">type functionKey struct</a>

```
searchKey: profile.functionKey
tags: [private]
```

```Go
type functionKey struct {
	startLine                  int64
	name, systemName, fileName string
}
```

### <a id="Profile" href="#Profile">type Profile struct</a>

```
searchKey: profile.Profile
```

```Go
type Profile struct {
	SampleType        []*ValueType
	DefaultSampleType string
	Sample            []*Sample
	Mapping           []*Mapping
	Location          []*Location
	Function          []*Function
	Comments          []string

	DropFrames string
	KeepFrames string

	TimeNanos     int64
	DurationNanos int64
	PeriodType    *ValueType
	Period        int64

	commentX           []int64
	dropFramesX        int64
	keepFramesX        int64
	stringTable        []string
	defaultSampleTypeX int64
}
```

Profile is an in-memory representation of profile.proto. 

#### <a id="parseGoCount" href="#parseGoCount">func parseGoCount(b []byte) (*Profile, error)</a>

```
searchKey: profile.parseGoCount
tags: [private]
```

```Go
func parseGoCount(b []byte) (*Profile, error)
```

parseGoCount parses a Go count profile (e.g., threadcreate or goroutine) and returns a new Profile. 

#### <a id="ParseTracebacks" href="#ParseTracebacks">func ParseTracebacks(b []byte) (*Profile, error)</a>

```
searchKey: profile.ParseTracebacks
```

```Go
func ParseTracebacks(b []byte) (*Profile, error)
```

ParseTracebacks parses a set of tracebacks and returns a newly populated profile. It will accept any text file and generate a Profile out of it with any hex addresses it can identify, including a process map if it can recognize one. Each sample will include a tag "source" with the addresses recognized in string format. 

#### <a id="parseCPU" href="#parseCPU">func parseCPU(b []byte) (*Profile, error)</a>

```
searchKey: profile.parseCPU
tags: [private]
```

```Go
func parseCPU(b []byte) (*Profile, error)
```

parseCPU parses a profilez legacy profile and returns a newly populated Profile. 

The general format for profilez samples is a sequence of words in binary format. The first words are a header with the following data: 

```
1st word -- 0
2nd word -- 3
3rd word -- 0 if a c++ application, 1 if a java application.
4th word -- Sampling period (in microseconds).
5th word -- Padding.

```
#### <a id="cpuProfile" href="#cpuProfile">func cpuProfile(b []byte, period int64, parse func(b []byte) (uint64, []byte)) (*Profile, error)</a>

```
searchKey: profile.cpuProfile
tags: [private]
```

```Go
func cpuProfile(b []byte, period int64, parse func(b []byte) (uint64, []byte)) (*Profile, error)
```

cpuProfile returns a new Profile from C++ profilez data. b is the profile bytes after the header, period is the profiling period, and parse is a function to parse 8-byte chunks from the profile in its native endianness. 

#### <a id="parseHeap" href="#parseHeap">func parseHeap(b []byte) (p *Profile, err error)</a>

```
searchKey: profile.parseHeap
tags: [private]
```

```Go
func parseHeap(b []byte) (p *Profile, err error)
```

parseHeap parses a heapz legacy or a growthz profile and returns a newly populated Profile. 

#### <a id="parseContention" href="#parseContention">func parseContention(b []byte) (*Profile, error)</a>

```
searchKey: profile.parseContention
tags: [private]
```

```Go
func parseContention(b []byte) (*Profile, error)
```

parseContention parses a mutex or contention profile. There are 2 cases: "--- contentionz " for legacy C++ profiles (and backwards compatibility) "--- mutex:" or "--- contention:" for profiles generated by the Go runtime. This code converts the text output from runtime into a *Profile. (In the future the runtime might write a serialized Profile directly making this unnecessary.) 

#### <a id="parseCppContention" href="#parseCppContention">func parseCppContention(r *bytes.Buffer) (*Profile, error)</a>

```
searchKey: profile.parseCppContention
tags: [private]
```

```Go
func parseCppContention(r *bytes.Buffer) (*Profile, error)
```

parseCppContention parses the output from synchronization_profiling.cc for backward compatibility, and the compatible (non-debug) block profile output from the Go runtime. 

#### <a id="parseThread" href="#parseThread">func parseThread(b []byte) (*Profile, error)</a>

```
searchKey: profile.parseThread
tags: [private]
```

```Go
func parseThread(b []byte) (*Profile, error)
```

parseThread parses a Threadz profile and returns a new Profile. 

#### <a id="Merge" href="#Merge">func Merge(srcs []*Profile) (*Profile, error)</a>

```
searchKey: profile.Merge
```

```Go
func Merge(srcs []*Profile) (*Profile, error)
```

Merge merges all the profiles in profs into a single Profile. Returns a new profile independent of the input profiles. The merged profile is compacted to eliminate unused samples, locations, functions and mappings. Profiles must have identical profile sample and period types or the merge will fail. profile.Period of the resulting profile will be the maximum of all profiles, and profile.TimeNanos will be the earliest nonzero one. 

#### <a id="combineHeaders" href="#combineHeaders">func combineHeaders(srcs []*Profile) (*Profile, error)</a>

```
searchKey: profile.combineHeaders
tags: [private]
```

```Go
func combineHeaders(srcs []*Profile) (*Profile, error)
```

combineHeaders checks that all profiles can be merged and returns their combined profile. 

#### <a id="Parse" href="#Parse">func Parse(r io.Reader) (*Profile, error)</a>

```
searchKey: profile.Parse
```

```Go
func Parse(r io.Reader) (*Profile, error)
```

Parse parses a profile and checks for its validity. The input may be a gzip-compressed encoded protobuf or one of many legacy profile formats which may be unsupported in the future. 

#### <a id="parseLegacy" href="#parseLegacy">func parseLegacy(data []byte) (*Profile, error)</a>

```
searchKey: profile.parseLegacy
tags: [private]
```

```Go
func parseLegacy(data []byte) (*Profile, error)
```

#### <a id="parseUncompressed" href="#parseUncompressed">func parseUncompressed(data []byte) (*Profile, error)</a>

```
searchKey: profile.parseUncompressed
tags: [private]
```

```Go
func parseUncompressed(data []byte) (*Profile, error)
```

#### <a id="Profile.decoder" href="#Profile.decoder">func (p *Profile) decoder() []decoder</a>

```
searchKey: profile.Profile.decoder
tags: [private]
```

```Go
func (p *Profile) decoder() []decoder
```

#### <a id="Profile.preEncode" href="#Profile.preEncode">func (p *Profile) preEncode()</a>

```
searchKey: profile.Profile.preEncode
tags: [private]
```

```Go
func (p *Profile) preEncode()
```

preEncode populates the unexported fields to be used by encode (with suffix X) from the corresponding exported fields. The exported fields are cleared up to facilitate testing. 

#### <a id="Profile.encode" href="#Profile.encode">func (p *Profile) encode(b *buffer)</a>

```
searchKey: profile.Profile.encode
tags: [private]
```

```Go
func (p *Profile) encode(b *buffer)
```

#### <a id="Profile.postDecode" href="#Profile.postDecode">func (p *Profile) postDecode() error</a>

```
searchKey: profile.Profile.postDecode
tags: [private]
```

```Go
func (p *Profile) postDecode() error
```

postDecode takes the unexported fields populated by decode (with suffix X) and populates the corresponding exported fields. The unexported fields are cleared up to facilitate testing. 

#### <a id="Profile.FilterSamplesByName" href="#Profile.FilterSamplesByName">func (p *Profile) FilterSamplesByName(focus, ignore, hide *regexp.Regexp) (fm, im, hm bool)</a>

```
searchKey: profile.Profile.FilterSamplesByName
```

```Go
func (p *Profile) FilterSamplesByName(focus, ignore, hide *regexp.Regexp) (fm, im, hm bool)
```

FilterSamplesByName filters the samples in a profile and only keeps samples where at least one frame matches focus but none match ignore. Returns true is the corresponding regexp matched at least one sample. 

#### <a id="Profile.FilterSamplesByTag" href="#Profile.FilterSamplesByTag">func (p *Profile) FilterSamplesByTag(focus, ignore TagMatch) (fm, im bool)</a>

```
searchKey: profile.Profile.FilterSamplesByTag
```

```Go
func (p *Profile) FilterSamplesByTag(focus, ignore TagMatch) (fm, im bool)
```

FilterSamplesByTag removes all samples from the profile, except those that match focus and do not match the ignore regular expression. 

#### <a id="Profile.remapLocationIDs" href="#Profile.remapLocationIDs">func (p *Profile) remapLocationIDs()</a>

```
searchKey: profile.Profile.remapLocationIDs
tags: [private]
```

```Go
func (p *Profile) remapLocationIDs()
```

remapLocationIDs ensures there is a location for each address referenced by a sample, and remaps the samples to point to the new location ids. 

#### <a id="Profile.remapFunctionIDs" href="#Profile.remapFunctionIDs">func (p *Profile) remapFunctionIDs()</a>

```
searchKey: profile.Profile.remapFunctionIDs
tags: [private]
```

```Go
func (p *Profile) remapFunctionIDs()
```

#### <a id="Profile.remapMappingIDs" href="#Profile.remapMappingIDs">func (p *Profile) remapMappingIDs()</a>

```
searchKey: profile.Profile.remapMappingIDs
tags: [private]
```

```Go
func (p *Profile) remapMappingIDs()
```

remapMappingIDs matches location addresses with existing mappings and updates them appropriately. This is O(N*M), if this ever shows up as a bottleneck, evaluate sorting the mappings and doing a binary search, which would make it O(N*log(M)). 

#### <a id="Profile.ParseMemoryMap" href="#Profile.ParseMemoryMap">func (p *Profile) ParseMemoryMap(rd io.Reader) error</a>

```
searchKey: profile.Profile.ParseMemoryMap
```

```Go
func (p *Profile) ParseMemoryMap(rd io.Reader) error
```

ParseMemoryMap parses a memory map in the format of /proc/self/maps, and overrides the mappings in the current profile. It renumbers the samples and locations in the profile correspondingly. 

#### <a id="Profile.addLegacyFrameInfo" href="#Profile.addLegacyFrameInfo">func (p *Profile) addLegacyFrameInfo()</a>

```
searchKey: profile.Profile.addLegacyFrameInfo
tags: [private]
```

```Go
func (p *Profile) addLegacyFrameInfo()
```

#### <a id="Profile.Normalize" href="#Profile.Normalize">func (p *Profile) Normalize(pb *Profile) error</a>

```
searchKey: profile.Profile.Normalize
```

```Go
func (p *Profile) Normalize(pb *Profile) error
```

Normalize normalizes the source profile by multiplying each value in profile by the ratio of the sum of the base profile's values of that sample type to the sum of the source profile's value of that sample type. 

#### <a id="Profile.compatible" href="#Profile.compatible">func (p *Profile) compatible(pb *Profile) error</a>

```
searchKey: profile.Profile.compatible
tags: [private]
```

```Go
func (p *Profile) compatible(pb *Profile) error
```

compatible determines if two profiles can be compared/merged. returns nil if the profiles are compatible; otherwise an error with details on the incompatibility. 

#### <a id="Profile.setMain" href="#Profile.setMain">func (p *Profile) setMain()</a>

```
searchKey: profile.Profile.setMain
tags: [private]
```

```Go
func (p *Profile) setMain()
```

setMain scans Mapping entries and guesses which entry is main because legacy profiles don't obey the convention of putting main first. 

#### <a id="Profile.Write" href="#Profile.Write">func (p *Profile) Write(w io.Writer) error</a>

```
searchKey: profile.Profile.Write
```

```Go
func (p *Profile) Write(w io.Writer) error
```

Write writes the profile as a gzip-compressed marshaled protobuf. 

#### <a id="Profile.CheckValid" href="#Profile.CheckValid">func (p *Profile) CheckValid() error</a>

```
searchKey: profile.Profile.CheckValid
```

```Go
func (p *Profile) CheckValid() error
```

CheckValid tests whether the profile is valid. Checks include, but are not limited to: 

```
- len(Profile.Sample[n].value) == len(Profile.value_unit)
- Sample.id has a corresponding Profile.Location

```
#### <a id="Profile.Aggregate" href="#Profile.Aggregate">func (p *Profile) Aggregate(inlineFrame, function, filename, linenumber, address bool) error</a>

```
searchKey: profile.Profile.Aggregate
```

```Go
func (p *Profile) Aggregate(inlineFrame, function, filename, linenumber, address bool) error
```

Aggregate merges the locations in the profile into equivalence classes preserving the request attributes. It also updates the samples to point to the merged locations. 

#### <a id="Profile.String" href="#Profile.String">func (p *Profile) String() string</a>

```
searchKey: profile.Profile.String
```

```Go
func (p *Profile) String() string
```

Print dumps a text representation of a profile. Intended mainly for debugging purposes. 

#### <a id="Profile.Merge" href="#Profile.Merge">func (p *Profile) Merge(pb *Profile, r float64) error</a>

```
searchKey: profile.Profile.Merge
```

```Go
func (p *Profile) Merge(pb *Profile, r float64) error
```

Merge adds profile p adjusted by ratio r into profile p. Profiles must be compatible (same Type and SampleType). TODO(rsilvera): consider normalizing the profiles based on the total samples collected. 

#### <a id="Profile.Compatible" href="#Profile.Compatible">func (p *Profile) Compatible(pb *Profile) error</a>

```
searchKey: profile.Profile.Compatible
```

```Go
func (p *Profile) Compatible(pb *Profile) error
```

Compatible determines if two profiles can be compared/merged. returns nil if the profiles are compatible; otherwise an error with details on the incompatibility. 

#### <a id="Profile.HasFunctions" href="#Profile.HasFunctions">func (p *Profile) HasFunctions() bool</a>

```
searchKey: profile.Profile.HasFunctions
```

```Go
func (p *Profile) HasFunctions() bool
```

HasFunctions determines if all locations in this profile have symbolized function information. 

#### <a id="Profile.HasFileLines" href="#Profile.HasFileLines">func (p *Profile) HasFileLines() bool</a>

```
searchKey: profile.Profile.HasFileLines
```

```Go
func (p *Profile) HasFileLines() bool
```

HasFileLines determines if all locations in this profile have symbolized file and line number information. 

#### <a id="Profile.Copy" href="#Profile.Copy">func (p *Profile) Copy() *Profile</a>

```
searchKey: profile.Profile.Copy
```

```Go
func (p *Profile) Copy() *Profile
```

Copy makes a fully independent copy of a profile. 

#### <a id="Profile.Demangle" href="#Profile.Demangle">func (p *Profile) Demangle(d Demangler) error</a>

```
searchKey: profile.Profile.Demangle
```

```Go
func (p *Profile) Demangle(d Demangler) error
```

Demangle attempts to demangle and optionally simplify any function names referenced in the profile. It works on a best-effort basis: it will silently preserve the original names in case of any errors. 

#### <a id="Profile.Empty" href="#Profile.Empty">func (p *Profile) Empty() bool</a>

```
searchKey: profile.Profile.Empty
```

```Go
func (p *Profile) Empty() bool
```

Empty reports whether the profile contains no samples. 

#### <a id="Profile.Scale" href="#Profile.Scale">func (p *Profile) Scale(ratio float64)</a>

```
searchKey: profile.Profile.Scale
```

```Go
func (p *Profile) Scale(ratio float64)
```

Scale multiplies all sample values in a profile by a constant. 

#### <a id="Profile.ScaleN" href="#Profile.ScaleN">func (p *Profile) ScaleN(ratios []float64) error</a>

```
searchKey: profile.Profile.ScaleN
```

```Go
func (p *Profile) ScaleN(ratios []float64) error
```

ScaleN multiplies each sample values in a sample by a different amount. 

#### <a id="Profile.Prune" href="#Profile.Prune">func (p *Profile) Prune(dropRx, keepRx *regexp.Regexp)</a>

```
searchKey: profile.Profile.Prune
```

```Go
func (p *Profile) Prune(dropRx, keepRx *regexp.Regexp)
```

Prune removes all nodes beneath a node matching dropRx, and not matching keepRx. If the root node of a Sample matches, the sample will have an empty stack. 

#### <a id="Profile.RemoveUninteresting" href="#Profile.RemoveUninteresting">func (p *Profile) RemoveUninteresting() error</a>

```
searchKey: profile.Profile.RemoveUninteresting
```

```Go
func (p *Profile) RemoveUninteresting() error
```

RemoveUninteresting prunes and elides profiles using built-in tables of uninteresting function names. 

### <a id="ValueType" href="#ValueType">type ValueType struct</a>

```
searchKey: profile.ValueType
```

```Go
type ValueType struct {
	Type string // cpu, wall, inuse_space, etc
	Unit string // seconds, nanoseconds, bytes, etc

	typeX int64
	unitX int64
}
```

ValueType corresponds to Profile.ValueType 

#### <a id="ValueType.decoder" href="#ValueType.decoder">func (p *ValueType) decoder() []decoder</a>

```
searchKey: profile.ValueType.decoder
tags: [private]
```

```Go
func (p *ValueType) decoder() []decoder
```

#### <a id="ValueType.encode" href="#ValueType.encode">func (p *ValueType) encode(b *buffer)</a>

```
searchKey: profile.ValueType.encode
tags: [private]
```

```Go
func (p *ValueType) encode(b *buffer)
```

### <a id="Sample" href="#Sample">type Sample struct</a>

```
searchKey: profile.Sample
```

```Go
type Sample struct {
	Location []*Location
	Value    []int64
	Label    map[string][]string
	NumLabel map[string][]int64
	NumUnit  map[string][]string

	locationIDX []uint64
	labelX      []Label
}
```

Sample corresponds to Profile.Sample 

#### <a id="Sample.decoder" href="#Sample.decoder">func (p *Sample) decoder() []decoder</a>

```
searchKey: profile.Sample.decoder
tags: [private]
```

```Go
func (p *Sample) decoder() []decoder
```

#### <a id="Sample.encode" href="#Sample.encode">func (p *Sample) encode(b *buffer)</a>

```
searchKey: profile.Sample.encode
tags: [private]
```

```Go
func (p *Sample) encode(b *buffer)
```

#### <a id="Sample.key" href="#Sample.key">func (sample *Sample) key() sampleKey</a>

```
searchKey: profile.Sample.key
tags: [private]
```

```Go
func (sample *Sample) key() sampleKey
```

key generates sampleKey to be used as a key for maps. 

### <a id="Label" href="#Label">type Label struct</a>

```
searchKey: profile.Label
```

```Go
type Label struct {
	keyX int64
	// Exactly one of the two following values must be set
	strX int64
	numX int64 // Integer value for this label
}
```

Label corresponds to Profile.Label 

#### <a id="Label.decoder" href="#Label.decoder">func (p Label) decoder() []decoder</a>

```
searchKey: profile.Label.decoder
tags: [private]
```

```Go
func (p Label) decoder() []decoder
```

#### <a id="Label.encode" href="#Label.encode">func (p Label) encode(b *buffer)</a>

```
searchKey: profile.Label.encode
tags: [private]
```

```Go
func (p Label) encode(b *buffer)
```

### <a id="Mapping" href="#Mapping">type Mapping struct</a>

```
searchKey: profile.Mapping
```

```Go
type Mapping struct {
	ID              uint64
	Start           uint64
	Limit           uint64
	Offset          uint64
	File            string
	BuildID         string
	HasFunctions    bool
	HasFilenames    bool
	HasLineNumbers  bool
	HasInlineFrames bool

	fileX    int64
	buildIDX int64
}
```

Mapping corresponds to Profile.Mapping 

#### <a id="parseMappingEntry" href="#parseMappingEntry">func parseMappingEntry(l string) (*Mapping, error)</a>

```
searchKey: profile.parseMappingEntry
tags: [private]
```

```Go
func parseMappingEntry(l string) (*Mapping, error)
```

#### <a id="Mapping.decoder" href="#Mapping.decoder">func (p *Mapping) decoder() []decoder</a>

```
searchKey: profile.Mapping.decoder
tags: [private]
```

```Go
func (p *Mapping) decoder() []decoder
```

#### <a id="Mapping.encode" href="#Mapping.encode">func (p *Mapping) encode(b *buffer)</a>

```
searchKey: profile.Mapping.encode
tags: [private]
```

```Go
func (p *Mapping) encode(b *buffer)
```

#### <a id="Mapping.key" href="#Mapping.key">func (m *Mapping) key() mappingKey</a>

```
searchKey: profile.Mapping.key
tags: [private]
```

```Go
func (m *Mapping) key() mappingKey
```

key generates encoded strings of Mapping to be used as a key for maps. 

### <a id="Location" href="#Location">type Location struct</a>

```
searchKey: profile.Location
```

```Go
type Location struct {
	ID       uint64
	Mapping  *Mapping
	Address  uint64
	Line     []Line
	IsFolded bool

	mappingIDX uint64
}
```

Location corresponds to Profile.Location 

#### <a id="Location.decoder" href="#Location.decoder">func (p *Location) decoder() []decoder</a>

```
searchKey: profile.Location.decoder
tags: [private]
```

```Go
func (p *Location) decoder() []decoder
```

#### <a id="Location.encode" href="#Location.encode">func (p *Location) encode(b *buffer)</a>

```
searchKey: profile.Location.encode
tags: [private]
```

```Go
func (p *Location) encode(b *buffer)
```

#### <a id="Location.matchesName" href="#Location.matchesName">func (loc *Location) matchesName(re *regexp.Regexp) bool</a>

```
searchKey: profile.Location.matchesName
tags: [private]
```

```Go
func (loc *Location) matchesName(re *regexp.Regexp) bool
```

matchesName reports whether the function name or file in the location matches the regular expression. 

#### <a id="Location.unmatchedLines" href="#Location.unmatchedLines">func (loc *Location) unmatchedLines(re *regexp.Regexp) []Line</a>

```
searchKey: profile.Location.unmatchedLines
tags: [private]
```

```Go
func (loc *Location) unmatchedLines(re *regexp.Regexp) []Line
```

unmatchedLines returns the lines in the location that do not match the regular expression. 

#### <a id="Location.key" href="#Location.key">func (l *Location) key() locationKey</a>

```
searchKey: profile.Location.key
tags: [private]
```

```Go
func (l *Location) key() locationKey
```

key generates locationKey to be used as a key for maps. 

### <a id="Line" href="#Line">type Line struct</a>

```
searchKey: profile.Line
```

```Go
type Line struct {
	Function *Function
	Line     int64

	functionIDX uint64
}
```

Line corresponds to Profile.Line 

#### <a id="Line.decoder" href="#Line.decoder">func (p *Line) decoder() []decoder</a>

```
searchKey: profile.Line.decoder
tags: [private]
```

```Go
func (p *Line) decoder() []decoder
```

#### <a id="Line.encode" href="#Line.encode">func (p *Line) encode(b *buffer)</a>

```
searchKey: profile.Line.encode
tags: [private]
```

```Go
func (p *Line) encode(b *buffer)
```

### <a id="Function" href="#Function">type Function struct</a>

```
searchKey: profile.Function
```

```Go
type Function struct {
	ID         uint64
	Name       string
	SystemName string
	Filename   string
	StartLine  int64

	nameX       int64
	systemNameX int64
	filenameX   int64
}
```

Function corresponds to Profile.Function 

#### <a id="Function.decoder" href="#Function.decoder">func (p *Function) decoder() []decoder</a>

```
searchKey: profile.Function.decoder
tags: [private]
```

```Go
func (p *Function) decoder() []decoder
```

#### <a id="Function.encode" href="#Function.encode">func (p *Function) encode(b *buffer)</a>

```
searchKey: profile.Function.encode
tags: [private]
```

```Go
func (p *Function) encode(b *buffer)
```

#### <a id="Function.key" href="#Function.key">func (f *Function) key() functionKey</a>

```
searchKey: profile.Function.key
tags: [private]
```

```Go
func (f *Function) key() functionKey
```

key generates a struct to be used as a key for maps. 

### <a id="Demangler" href="#Demangler">type Demangler func(name []string) (map[string]string, error)</a>

```
searchKey: profile.Demangler
```

```Go
type Demangler func(name []string) (map[string]string, error)
```

Demangler maps symbol names to a human-readable form. This may include C++ demangling and additional simplification. Names that are not demangled may be missing from the resulting map. 

### <a id="buffer" href="#buffer">type buffer struct</a>

```
searchKey: profile.buffer
tags: [private]
```

```Go
type buffer struct {
	field int
	typ   int
	u64   uint64
	data  []byte
	tmp   [16]byte
}
```

### <a id="decoder" href="#decoder">type decoder func(*std/internal/profile.buffer, std/internal/profile.message) error</a>

```
searchKey: profile.decoder
tags: [private]
```

```Go
type decoder func(*buffer, message) error
```

### <a id="message" href="#message">type message interface</a>

```
searchKey: profile.message
tags: [private]
```

```Go
type message interface {
	decoder() []decoder
	encode(*buffer)
}
```

### <a id="packedInts" href="#packedInts">type packedInts struct</a>

```
searchKey: profile.packedInts
tags: [private]
```

```Go
type packedInts struct {
	uint64s []uint64
	int64s  []int64
}
```

#### <a id="packedInts.decoder" href="#packedInts.decoder">func (u *packedInts) decoder() []decoder</a>

```
searchKey: profile.packedInts.decoder
tags: [private]
```

```Go
func (u *packedInts) decoder() []decoder
```

#### <a id="packedInts.encode" href="#packedInts.encode">func (u *packedInts) encode(b *buffer)</a>

```
searchKey: profile.packedInts.encode
tags: [private]
```

```Go
func (u *packedInts) encode(b *buffer)
```

## <a id="func" href="#func">Functions</a>

```
tags: [private]
```

### <a id="addString" href="#addString">func addString(strings map[string]int, s string) int64</a>

```
searchKey: profile.addString
tags: [private]
```

```Go
func addString(strings map[string]int, s string) int64
```

### <a id="getString" href="#getString">func getString(strings []string, strng *int64, err error) (string, error)</a>

```
searchKey: profile.getString
tags: [private]
```

```Go
func getString(strings []string, strng *int64, err error) (string, error)
```

### <a id="focusedAndNotIgnored" href="#focusedAndNotIgnored">func focusedAndNotIgnored(locs []*Location, m map[uint64]bool) bool</a>

```
searchKey: profile.focusedAndNotIgnored
tags: [private]
```

```Go
func focusedAndNotIgnored(locs []*Location, m map[uint64]bool) bool
```

focusedAndNotIgnored looks up a slice of ids against a map of focused/ignored locations. The map only contains locations that are explicitly focused or ignored. Returns whether there is at least one focused location but no ignored locations. 

### <a id="focusedSample" href="#focusedSample">func focusedSample(s *Sample, focus, ignore TagMatch) (fm, im bool)</a>

```
searchKey: profile.focusedSample
tags: [private]
```

```Go
func focusedSample(s *Sample, focus, ignore TagMatch) (fm, im bool)
```

focusedTag checks a sample against focus and ignore regexps. Returns whether the focus/ignore regexps match any tags 

### <a id="isSpaceOrComment" href="#isSpaceOrComment">func isSpaceOrComment(line string) bool</a>

```
searchKey: profile.isSpaceOrComment
tags: [private]
```

```Go
func isSpaceOrComment(line string) bool
```

### <a id="get32l" href="#get32l">func get32l(b []byte) (uint64, []byte)</a>

```
searchKey: profile.get32l
tags: [private]
```

```Go
func get32l(b []byte) (uint64, []byte)
```

### <a id="get32b" href="#get32b">func get32b(b []byte) (uint64, []byte)</a>

```
searchKey: profile.get32b
tags: [private]
```

```Go
func get32b(b []byte) (uint64, []byte)
```

### <a id="get64l" href="#get64l">func get64l(b []byte) (uint64, []byte)</a>

```
searchKey: profile.get64l
tags: [private]
```

```Go
func get64l(b []byte) (uint64, []byte)
```

### <a id="get64b" href="#get64b">func get64b(b []byte) (uint64, []byte)</a>

```
searchKey: profile.get64b
tags: [private]
```

```Go
func get64b(b []byte) (uint64, []byte)
```

### <a id="addTracebackSample" href="#addTracebackSample">func addTracebackSample(l []*Location, s []string, p *Profile)</a>

```
searchKey: profile.addTracebackSample
tags: [private]
```

```Go
func addTracebackSample(l []*Location, s []string, p *Profile)
```

### <a id="parseCPUSamples" href="#parseCPUSamples">func parseCPUSamples(b []byte, parse func(b []byte) (uint64, []byte), adjust bool, p *Profile) ([]byte, map[uint64]*Location, error)</a>

```
searchKey: profile.parseCPUSamples
tags: [private]
```

```Go
func parseCPUSamples(b []byte, parse func(b []byte) (uint64, []byte), adjust bool, p *Profile) ([]byte, map[uint64]*Location, error)
```

parseCPUSamples parses a collection of profilez samples from a profile. 

profilez samples are a repeated sequence of stack frames of the form: 

```
1st word -- The number of times this stack was encountered.
2nd word -- The size of the stack (StackSize).
3rd word -- The first address on the stack.
...
StackSize + 2 -- The last address on the stack

```
The last stack trace is of the form: 

```
1st word -- 0
2nd word -- 1
3rd word -- 0

```
Addresses from stack traces may point to the next instruction after each call. Optionally adjust by -1 to land somewhere on the actual call (except for the leaf, which is not a call). 

### <a id="parseHeapSample" href="#parseHeapSample">func parseHeapSample(line string, rate int64, sampling string) (value []int64, blocksize int64, addrs []uint64, err error)</a>

```
searchKey: profile.parseHeapSample
tags: [private]
```

```Go
func parseHeapSample(line string, rate int64, sampling string) (value []int64, blocksize int64, addrs []uint64, err error)
```

parseHeapSample parses a single row from a heap profile into a new Sample. 

### <a id="extractHexAddresses" href="#extractHexAddresses">func extractHexAddresses(s string) ([]string, []uint64)</a>

```
searchKey: profile.extractHexAddresses
tags: [private]
```

```Go
func extractHexAddresses(s string) ([]string, []uint64)
```

extractHexAddresses extracts hex numbers from a string and returns them, together with their numeric value, in a slice. 

### <a id="parseHexAddresses" href="#parseHexAddresses">func parseHexAddresses(s string) []uint64</a>

```
searchKey: profile.parseHexAddresses
tags: [private]
```

```Go
func parseHexAddresses(s string) []uint64
```

parseHexAddresses parses hex numbers from a string and returns them in a slice. 

### <a id="scaleHeapSample" href="#scaleHeapSample">func scaleHeapSample(count, size, rate int64) (int64, int64)</a>

```
searchKey: profile.scaleHeapSample
tags: [private]
```

```Go
func scaleHeapSample(count, size, rate int64) (int64, int64)
```

scaleHeapSample adjusts the data from a heapz Sample to account for its probability of appearing in the collected data. heapz profiles are a sampling of the memory allocations requests in a program. We estimate the unsampled value by dividing each collected sample by its probability of appearing in the profile. heapz v2 profiles rely on a poisson process to determine which samples to collect, based on the desired average collection rate R. The probability of a sample of size S to appear in that profile is 1-exp(-S/R). 

### <a id="parseContentionSample" href="#parseContentionSample">func parseContentionSample(line string, period, cpuHz int64) (value []int64, addrs []uint64, err error)</a>

```
searchKey: profile.parseContentionSample
tags: [private]
```

```Go
func parseContentionSample(line string, period, cpuHz int64) (value []int64, addrs []uint64, err error)
```

parseContentionSample parses a single row from a contention profile into a new Sample. 

### <a id="parseThreadSample" href="#parseThreadSample">func parseThreadSample(b *bytes.Buffer) (nextl string, addrs []uint64, err error)</a>

```
searchKey: profile.parseThreadSample
tags: [private]
```

```Go
func parseThreadSample(b *bytes.Buffer) (nextl string, addrs []uint64, err error)
```

parseThreadSample parses a symbolized or unsymbolized stack trace. Returns the first line after the traceback, the sample (or nil if it hits a 'same-as-previous' marker) and an error. 

### <a id="parseAdditionalSections" href="#parseAdditionalSections">func parseAdditionalSections(l string, b *bytes.Buffer, p *Profile) (err error)</a>

```
searchKey: profile.parseAdditionalSections
tags: [private]
```

```Go
func parseAdditionalSections(l string, b *bytes.Buffer, p *Profile) (err error)
```

parseAdditionalSections parses any additional sections in the profile, ignoring any unrecognized sections. 

### <a id="isProfileType" href="#isProfileType">func isProfileType(p *Profile, t []string) bool</a>

```
searchKey: profile.isProfileType
tags: [private]
```

```Go
func isProfileType(p *Profile, t []string) bool
```

### <a id="isZeroSample" href="#isZeroSample">func isZeroSample(s *Sample) bool</a>

```
searchKey: profile.isZeroSample
tags: [private]
```

```Go
func isZeroSample(s *Sample) bool
```

### <a id="equalValueType" href="#equalValueType">func equalValueType(st1, st2 *ValueType) bool</a>

```
searchKey: profile.equalValueType
tags: [private]
```

```Go
func equalValueType(st1, st2 *ValueType) bool
```

equalValueType returns true if the two value types are semantically equal. It ignores the internal fields used during encode/decode. 

### <a id="compatibleValueTypes" href="#compatibleValueTypes">func compatibleValueTypes(v1, v2 *ValueType) bool</a>

```
searchKey: profile.compatibleValueTypes
tags: [private]
```

```Go
func compatibleValueTypes(v1, v2 *ValueType) bool
```

### <a id="marshal" href="#marshal">func marshal(m message) []byte</a>

```
searchKey: profile.marshal
tags: [private]
```

```Go
func marshal(m message) []byte
```

### <a id="encodeVarint" href="#encodeVarint">func encodeVarint(b *buffer, x uint64)</a>

```
searchKey: profile.encodeVarint
tags: [private]
```

```Go
func encodeVarint(b *buffer, x uint64)
```

### <a id="encodeLength" href="#encodeLength">func encodeLength(b *buffer, tag int, len int)</a>

```
searchKey: profile.encodeLength
tags: [private]
```

```Go
func encodeLength(b *buffer, tag int, len int)
```

### <a id="encodeUint64" href="#encodeUint64">func encodeUint64(b *buffer, tag int, x uint64)</a>

```
searchKey: profile.encodeUint64
tags: [private]
```

```Go
func encodeUint64(b *buffer, tag int, x uint64)
```

### <a id="encodeUint64s" href="#encodeUint64s">func encodeUint64s(b *buffer, tag int, x []uint64)</a>

```
searchKey: profile.encodeUint64s
tags: [private]
```

```Go
func encodeUint64s(b *buffer, tag int, x []uint64)
```

### <a id="encodeUint64Opt" href="#encodeUint64Opt">func encodeUint64Opt(b *buffer, tag int, x uint64)</a>

```
searchKey: profile.encodeUint64Opt
tags: [private]
```

```Go
func encodeUint64Opt(b *buffer, tag int, x uint64)
```

### <a id="encodeInt64" href="#encodeInt64">func encodeInt64(b *buffer, tag int, x int64)</a>

```
searchKey: profile.encodeInt64
tags: [private]
```

```Go
func encodeInt64(b *buffer, tag int, x int64)
```

### <a id="encodeInt64Opt" href="#encodeInt64Opt">func encodeInt64Opt(b *buffer, tag int, x int64)</a>

```
searchKey: profile.encodeInt64Opt
tags: [private]
```

```Go
func encodeInt64Opt(b *buffer, tag int, x int64)
```

### <a id="encodeInt64s" href="#encodeInt64s">func encodeInt64s(b *buffer, tag int, x []int64)</a>

```
searchKey: profile.encodeInt64s
tags: [private]
```

```Go
func encodeInt64s(b *buffer, tag int, x []int64)
```

### <a id="encodeString" href="#encodeString">func encodeString(b *buffer, tag int, x string)</a>

```
searchKey: profile.encodeString
tags: [private]
```

```Go
func encodeString(b *buffer, tag int, x string)
```

### <a id="encodeStrings" href="#encodeStrings">func encodeStrings(b *buffer, tag int, x []string)</a>

```
searchKey: profile.encodeStrings
tags: [private]
```

```Go
func encodeStrings(b *buffer, tag int, x []string)
```

### <a id="encodeStringOpt" href="#encodeStringOpt">func encodeStringOpt(b *buffer, tag int, x string)</a>

```
searchKey: profile.encodeStringOpt
tags: [private]
```

```Go
func encodeStringOpt(b *buffer, tag int, x string)
```

### <a id="encodeBool" href="#encodeBool">func encodeBool(b *buffer, tag int, x bool)</a>

```
searchKey: profile.encodeBool
tags: [private]
```

```Go
func encodeBool(b *buffer, tag int, x bool)
```

### <a id="encodeBoolOpt" href="#encodeBoolOpt">func encodeBoolOpt(b *buffer, tag int, x bool)</a>

```
searchKey: profile.encodeBoolOpt
tags: [private]
```

```Go
func encodeBoolOpt(b *buffer, tag int, x bool)
```

### <a id="encodeMessage" href="#encodeMessage">func encodeMessage(b *buffer, tag int, m message)</a>

```
searchKey: profile.encodeMessage
tags: [private]
```

```Go
func encodeMessage(b *buffer, tag int, m message)
```

### <a id="unmarshal" href="#unmarshal">func unmarshal(data []byte, m message) (err error)</a>

```
searchKey: profile.unmarshal
tags: [private]
```

```Go
func unmarshal(data []byte, m message) (err error)
```

### <a id="le64" href="#le64">func le64(p []byte) uint64</a>

```
searchKey: profile.le64
tags: [private]
```

```Go
func le64(p []byte) uint64
```

### <a id="le32" href="#le32">func le32(p []byte) uint32</a>

```
searchKey: profile.le32
tags: [private]
```

```Go
func le32(p []byte) uint32
```

### <a id="decodeVarint" href="#decodeVarint">func decodeVarint(data []byte) (uint64, []byte, error)</a>

```
searchKey: profile.decodeVarint
tags: [private]
```

```Go
func decodeVarint(data []byte) (uint64, []byte, error)
```

### <a id="decodeField" href="#decodeField">func decodeField(b *buffer, data []byte) ([]byte, error)</a>

```
searchKey: profile.decodeField
tags: [private]
```

```Go
func decodeField(b *buffer, data []byte) ([]byte, error)
```

### <a id="checkType" href="#checkType">func checkType(b *buffer, typ int) error</a>

```
searchKey: profile.checkType
tags: [private]
```

```Go
func checkType(b *buffer, typ int) error
```

### <a id="decodeMessage" href="#decodeMessage">func decodeMessage(b *buffer, m message) error</a>

```
searchKey: profile.decodeMessage
tags: [private]
```

```Go
func decodeMessage(b *buffer, m message) error
```

### <a id="decodeInt64" href="#decodeInt64">func decodeInt64(b *buffer, x *int64) error</a>

```
searchKey: profile.decodeInt64
tags: [private]
```

```Go
func decodeInt64(b *buffer, x *int64) error
```

### <a id="decodeInt64s" href="#decodeInt64s">func decodeInt64s(b *buffer, x *[]int64) error</a>

```
searchKey: profile.decodeInt64s
tags: [private]
```

```Go
func decodeInt64s(b *buffer, x *[]int64) error
```

### <a id="decodeUint64" href="#decodeUint64">func decodeUint64(b *buffer, x *uint64) error</a>

```
searchKey: profile.decodeUint64
tags: [private]
```

```Go
func decodeUint64(b *buffer, x *uint64) error
```

### <a id="decodeUint64s" href="#decodeUint64s">func decodeUint64s(b *buffer, x *[]uint64) error</a>

```
searchKey: profile.decodeUint64s
tags: [private]
```

```Go
func decodeUint64s(b *buffer, x *[]uint64) error
```

### <a id="decodeString" href="#decodeString">func decodeString(b *buffer, x *string) error</a>

```
searchKey: profile.decodeString
tags: [private]
```

```Go
func decodeString(b *buffer, x *string) error
```

### <a id="decodeStrings" href="#decodeStrings">func decodeStrings(b *buffer, x *[]string) error</a>

```
searchKey: profile.decodeStrings
tags: [private]
```

```Go
func decodeStrings(b *buffer, x *[]string) error
```

### <a id="decodeBool" href="#decodeBool">func decodeBool(b *buffer, x *bool) error</a>

```
searchKey: profile.decodeBool
tags: [private]
```

```Go
func decodeBool(b *buffer, x *bool) error
```

### <a id="TestEmptyProfile" href="#TestEmptyProfile">func TestEmptyProfile(t *testing.T)</a>

```
searchKey: profile.TestEmptyProfile
tags: [private]
```

```Go
func TestEmptyProfile(t *testing.T)
```

### <a id="TestParseContention" href="#TestParseContention">func TestParseContention(t *testing.T)</a>

```
searchKey: profile.TestParseContention
tags: [private]
```

```Go
func TestParseContention(t *testing.T)
```

### <a id="TestPackedEncoding" href="#TestPackedEncoding">func TestPackedEncoding(t *testing.T)</a>

```
searchKey: profile.TestPackedEncoding
tags: [private]
```

```Go
func TestPackedEncoding(t *testing.T)
```

