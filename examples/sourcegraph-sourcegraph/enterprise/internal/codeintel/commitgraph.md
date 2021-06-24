# Package commitgraph

## Index

* [Types](#type)
    * [type CommitGraphView struct](#CommitGraphView)
        * [func NewCommitGraphView() *CommitGraphView](#NewCommitGraphView)
        * [func readBenchmarkCommitGraphView() (*CommitGraphView, error)](#readBenchmarkCommitGraphView)
        * [func (v *CommitGraphView) Add(meta UploadMeta, commit, token string)](#CommitGraphView.Add)
    * [type Envelope struct](#Envelope)
    * [type Graph struct](#Graph)
        * [func NewGraph(commitGraph *gitserver.CommitGraph, commitGraphView *CommitGraphView) *Graph](#NewGraph)
        * [func (g *Graph) Gather() (uploads map[string][]UploadMeta, links map[string]LinkRelationship)](#Graph.Gather)
        * [func (g *Graph) Stream() <-chan Envelope](#Graph.Stream)
        * [func (g *Graph) UploadsVisibleAtCommit(commit string) []UploadMeta](#Graph.UploadsVisibleAtCommit)
    * [type LinkRelationship struct](#LinkRelationship)
    * [type UploadMeta struct](#UploadMeta)
    * [type VisibilityRelationship struct](#VisibilityRelationship)
* [Functions](#func)
    * [func BenchmarkCalculateVisibleUploads(b *testing.B)](#BenchmarkCalculateVisibleUploads)
    * [func TestCalculateVisibleUploads(t *testing.T)](#TestCalculateVisibleUploads)
    * [func TestCalculateVisibleUploadsAlternateCommitGraph(t *testing.T)](#TestCalculateVisibleUploadsAlternateCommitGraph)
    * [func adjustVisibleUploads(ancestorVisibleUploads map[string]UploadMeta, ancestorDistance uint32) []UploadMeta](#adjustVisibleUploads)
    * [func makeTestGraph(commitGraph *gitserver.CommitGraph, commitGraphView *CommitGraphView) (uploads map[string][]UploadMeta, links map[string]LinkRelationship)](#makeTestGraph)
    * [func populateUploadsByTraversal(graph map[string][]string, order []string, commitGraphView *CommitGraphView) map[string]map[string]UploadMeta](#populateUploadsByTraversal)
    * [func populateUploadsForCommit(uploads map[string]map[string]UploadMeta, ancestors []string, distance uint32, commitGraphView *CommitGraphView, commit string) map[string]UploadMeta](#populateUploadsForCommit)
    * [func readBenchmarkCommitGraph() (*gitserver.CommitGraph, error)](#readBenchmarkCommitGraph)
    * [func readBenchmarkFile(path string) ([]byte, error)](#readBenchmarkFile)
    * [func replaces(upload1, upload2 UploadMeta) bool](#replaces)
    * [func reverseGraph(graph map[string][]string) map[string][]string](#reverseGraph)
    * [func traverseForCommit(graph map[string][]string, uploads map[string]map[string]UploadMeta, commit string) (string, uint32, bool)](#traverseForCommit)
    * [func traverseForUploads(graph map[string][]string, uploads map[string]map[string]UploadMeta, commit string) (map[string]UploadMeta, uint32)](#traverseForUploads)


## <a id="type" href="#type">Types</a>

```
tags: [package private]
```

### <a id="CommitGraphView" href="#CommitGraphView">type CommitGraphView struct</a>

```
searchKey: commitgraph.CommitGraphView
tags: [struct]
```

```Go
type CommitGraphView struct {
	// Meta is a map from commit to metadata on each visible upload from that
	// commit's location in the commit graph.
	Meta map[string][]UploadMeta

	// Tokens is a map from upload identifiers to a hash of their root an indexer
	// field. Equality of this token for two uploads means that they are able to
	// "shadow" one another.
	Tokens map[int]string
}
```

CommitGraphView is a space-efficient view of a commit graph decorated with the set of uploads visible at every commit. 

#### <a id="NewCommitGraphView" href="#NewCommitGraphView">func NewCommitGraphView() *CommitGraphView</a>

```
searchKey: commitgraph.NewCommitGraphView
tags: [function]
```

```Go
func NewCommitGraphView() *CommitGraphView
```

#### <a id="readBenchmarkCommitGraphView" href="#readBenchmarkCommitGraphView">func readBenchmarkCommitGraphView() (*CommitGraphView, error)</a>

```
searchKey: commitgraph.readBenchmarkCommitGraphView
tags: [function private]
```

```Go
func readBenchmarkCommitGraphView() (*CommitGraphView, error)
```

#### <a id="CommitGraphView.Add" href="#CommitGraphView.Add">func (v *CommitGraphView) Add(meta UploadMeta, commit, token string)</a>

```
searchKey: commitgraph.CommitGraphView.Add
tags: [method]
```

```Go
func (v *CommitGraphView) Add(meta UploadMeta, commit, token string)
```

### <a id="Envelope" href="#Envelope">type Envelope struct</a>

```
searchKey: commitgraph.Envelope
tags: [struct]
```

```Go
type Envelope struct {
	Uploads *VisibilityRelationship
	Links   *LinkRelationship
}
```

### <a id="Graph" href="#Graph">type Graph struct</a>

```
searchKey: commitgraph.Graph
tags: [struct]
```

```Go
type Graph struct {
	commitGraphView *CommitGraphView
	graph           map[string][]string
	commits         []string
	ancestorUploads map[string]map[string]UploadMeta
}
```

#### <a id="NewGraph" href="#NewGraph">func NewGraph(commitGraph *gitserver.CommitGraph, commitGraphView *CommitGraphView) *Graph</a>

```
searchKey: commitgraph.NewGraph
tags: [method]
```

```Go
func NewGraph(commitGraph *gitserver.CommitGraph, commitGraphView *CommitGraphView) *Graph
```

NewGraph creates a commit graph decorated with the set of uploads visible from that commit based on the given commit graph and complete set of LSIF upload metadata. 

#### <a id="Graph.Gather" href="#Graph.Gather">func (g *Graph) Gather() (uploads map[string][]UploadMeta, links map[string]LinkRelationship)</a>

```
searchKey: commitgraph.Graph.Gather
tags: [function]
```

```Go
func (g *Graph) Gather() (uploads map[string][]UploadMeta, links map[string]LinkRelationship)
```

Gather reads the graph's stream to completion and returns a map of the values. This method is only used for convenience and testing and should not be used in a hot path. It can be VERY memory intensive in production to have a reference to each commit's upload metadata concurrently. 

#### <a id="Graph.Stream" href="#Graph.Stream">func (g *Graph) Stream() <-chan Envelope</a>

```
searchKey: commitgraph.Graph.Stream
tags: [function]
```

```Go
func (g *Graph) Stream() <-chan Envelope
```

Stream returns a channel of envelope values which indicate either the set of visible uploads at a particular commit, or the nearest neighbors at a particular commit, depending on the value within the envelope. 

#### <a id="Graph.UploadsVisibleAtCommit" href="#Graph.UploadsVisibleAtCommit">func (g *Graph) UploadsVisibleAtCommit(commit string) []UploadMeta</a>

```
searchKey: commitgraph.Graph.UploadsVisibleAtCommit
tags: [method]
```

```Go
func (g *Graph) UploadsVisibleAtCommit(commit string) []UploadMeta
```

UploadsVisibleAtCommit returns the set of uploads that are visible from the given commit. 

### <a id="LinkRelationship" href="#LinkRelationship">type LinkRelationship struct</a>

```
searchKey: commitgraph.LinkRelationship
tags: [struct]
```

```Go
type LinkRelationship struct {
	Commit         string
	AncestorCommit string
	Distance       uint32
}
```

### <a id="UploadMeta" href="#UploadMeta">type UploadMeta struct</a>

```
searchKey: commitgraph.UploadMeta
tags: [struct]
```

```Go
type UploadMeta struct {
	UploadID int
	Distance uint32
}
```

UploadMeta represents the visibility of an LSIF upload from a particular location on a repository's commit graph. 

### <a id="VisibilityRelationship" href="#VisibilityRelationship">type VisibilityRelationship struct</a>

```
searchKey: commitgraph.VisibilityRelationship
tags: [struct]
```

```Go
type VisibilityRelationship struct {
	Commit  string
	Uploads []UploadMeta
}
```

## <a id="func" href="#func">Functions</a>

```
tags: [package private]
```

### <a id="BenchmarkCalculateVisibleUploads" href="#BenchmarkCalculateVisibleUploads">func BenchmarkCalculateVisibleUploads(b *testing.B)</a>

```
searchKey: commitgraph.BenchmarkCalculateVisibleUploads
tags: [method private benchmark]
```

```Go
func BenchmarkCalculateVisibleUploads(b *testing.B)
```

### <a id="TestCalculateVisibleUploads" href="#TestCalculateVisibleUploads">func TestCalculateVisibleUploads(t *testing.T)</a>

```
searchKey: commitgraph.TestCalculateVisibleUploads
tags: [method private test]
```

```Go
func TestCalculateVisibleUploads(t *testing.T)
```

### <a id="TestCalculateVisibleUploadsAlternateCommitGraph" href="#TestCalculateVisibleUploadsAlternateCommitGraph">func TestCalculateVisibleUploadsAlternateCommitGraph(t *testing.T)</a>

```
searchKey: commitgraph.TestCalculateVisibleUploadsAlternateCommitGraph
tags: [method private test]
```

```Go
func TestCalculateVisibleUploadsAlternateCommitGraph(t *testing.T)
```

### <a id="adjustVisibleUploads" href="#adjustVisibleUploads">func adjustVisibleUploads(ancestorVisibleUploads map[string]UploadMeta, ancestorDistance uint32) []UploadMeta</a>

```
searchKey: commitgraph.adjustVisibleUploads
tags: [method private]
```

```Go
func adjustVisibleUploads(ancestorVisibleUploads map[string]UploadMeta, ancestorDistance uint32) []UploadMeta
```

adjustVisibleUploads returns a copy of the given uploads map with the distance adjusted by the given amount. This returns the uploads "inherited" from a the nearest ancestor with commit data. 

### <a id="makeTestGraph" href="#makeTestGraph">func makeTestGraph(commitGraph *gitserver.CommitGraph, commitGraphView *CommitGraphView) (uploads map[string][]UploadMeta, links map[string]LinkRelationship)</a>

```
searchKey: commitgraph.makeTestGraph
tags: [method private]
```

```Go
func makeTestGraph(commitGraph *gitserver.CommitGraph, commitGraphView *CommitGraphView) (uploads map[string][]UploadMeta, links map[string]LinkRelationship)
```

makeTestGraph calls Gather on a new graph then sorts the uploads deterministically for easier comparison. Order of the upload list is not relevant to production flows. 

### <a id="populateUploadsByTraversal" href="#populateUploadsByTraversal">func populateUploadsByTraversal(graph map[string][]string, order []string, commitGraphView *CommitGraphView) map[string]map[string]UploadMeta</a>

```
searchKey: commitgraph.populateUploadsByTraversal
tags: [method private]
```

```Go
func populateUploadsByTraversal(graph map[string][]string, order []string, commitGraphView *CommitGraphView) map[string]map[string]UploadMeta
```

populateUploadsByTraversal populates a map from select commits (see below) to another map from tokens to upload meta value. Select commits are any commits that satisfy one of the following properties: 

```
1. They define an upload,
2. They have multiple parents, or
3. They have a child with multiple parents.

```
For all remaining commits, we can easily re-calculate the visible uploads without storing them. All such commits have a single, unambiguous path to an ancestor that does store data. These commits have the same visibility (the descendant is just farther away). 

### <a id="populateUploadsForCommit" href="#populateUploadsForCommit">func populateUploadsForCommit(uploads map[string]map[string]UploadMeta, ancestors []string, distance uint32, commitGraphView *CommitGraphView, commit string) map[string]UploadMeta</a>

```
searchKey: commitgraph.populateUploadsForCommit
tags: [method private]
```

```Go
func populateUploadsForCommit(uploads map[string]map[string]UploadMeta, ancestors []string, distance uint32, commitGraphView *CommitGraphView, commit string) map[string]UploadMeta
```

populateUploadsForCommit populates the items stored in the given mapping for the given commit. The uploads considered visible for a commit include: 

```
1. the set of uploads defined on that commit, and
2. the set of uploads visible from the ancestors with the minimum distance
   for equivalent root and indexer values.

```
If two ancestors have different uploads visible for the same root and indexer, the one with the smaller distance to the source commit will shadow the other. Similarly, If an ancestor and the child commit define uploads for the same root and indexer pair, the upload defined on the commit will shadow the upload defined on the ancestor. 

### <a id="readBenchmarkCommitGraph" href="#readBenchmarkCommitGraph">func readBenchmarkCommitGraph() (*gitserver.CommitGraph, error)</a>

```
searchKey: commitgraph.readBenchmarkCommitGraph
tags: [function private]
```

```Go
func readBenchmarkCommitGraph() (*gitserver.CommitGraph, error)
```

### <a id="readBenchmarkFile" href="#readBenchmarkFile">func readBenchmarkFile(path string) ([]byte, error)</a>

```
searchKey: commitgraph.readBenchmarkFile
tags: [method private]
```

```Go
func readBenchmarkFile(path string) ([]byte, error)
```

### <a id="replaces" href="#replaces">func replaces(upload1, upload2 UploadMeta) bool</a>

```
searchKey: commitgraph.replaces
tags: [method private]
```

```Go
func replaces(upload1, upload2 UploadMeta) bool
```

replaces returns true if upload1 has a smaller distance than upload2. Ties are broken by the minimum upload identifier to remain determinstic. 

### <a id="reverseGraph" href="#reverseGraph">func reverseGraph(graph map[string][]string) map[string][]string</a>

```
searchKey: commitgraph.reverseGraph
tags: [method private]
```

```Go
func reverseGraph(graph map[string][]string) map[string][]string
```

reverseGraph returns the reverse of the given graph by flipping all the edges. 

### <a id="traverseForCommit" href="#traverseForCommit">func traverseForCommit(graph map[string][]string, uploads map[string]map[string]UploadMeta, commit string) (string, uint32, bool)</a>

```
searchKey: commitgraph.traverseForCommit
tags: [method private]
```

```Go
func traverseForCommit(graph map[string][]string, uploads map[string]map[string]UploadMeta, commit string) (string, uint32, bool)
```

traverseForCommit returns the commit in the given uploads map matching the first ancestor in the graph with a value present in the map. The distance in the graph between the original commit and the ancestor is also returned. 

NOTE: We assume that each commit with multiple parents have been assigned data while walking the graph in topological order. If that is not the case, one parent will be chosen arbitrarily. 

### <a id="traverseForUploads" href="#traverseForUploads">func traverseForUploads(graph map[string][]string, uploads map[string]map[string]UploadMeta, commit string) (map[string]UploadMeta, uint32)</a>

```
searchKey: commitgraph.traverseForUploads
tags: [method private]
```

```Go
func traverseForUploads(graph map[string][]string, uploads map[string]map[string]UploadMeta, commit string) (map[string]UploadMeta, uint32)
```

traverseForUploads returns the value in the given uploads map whose key matches the first ancestor in the graph with a value present in the map. The distance in the graph between the original commit and the ancestor is also returned. 

