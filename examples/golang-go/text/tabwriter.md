# Package tabwriter

Package tabwriter implements a write filter (tabwriter.Writer) that translates tabbed columns in input into properly aligned text. 

The package is using the Elastic Tabstops algorithm described at [http://nickgravgaard.com/elastictabstops/index.html](http://nickgravgaard.com/elastictabstops/index.html). 

The text/tabwriter package is frozen and is not accepting new features. 

## Index

* [Constants](#const)
    * [const AlignRight](#AlignRight)
    * [const Debug](#Debug)
    * [const DiscardEmptyColumns](#DiscardEmptyColumns)
    * [const Escape](#Escape)
    * [const FilterHTML](#FilterHTML)
    * [const StripEscape](#StripEscape)
    * [const TabIndent](#TabIndent)
* [Variables](#var)
    * [var hbar](#hbar)
    * [var newline](#newline)
    * [var tabs](#tabs)
    * [var vbar](#vbar)
* [Types](#type)
    * [type Writer struct](#Writer)
        * [func NewWriter(output io.Writer, minwidth, tabwidth, padding int, padchar byte, flags uint) *Writer](#NewWriter)
        * [func (b *Writer) Flush() error](#Writer.Flush)
        * [func (b *Writer) Init(output io.Writer, minwidth, tabwidth, padding int, padchar byte, flags uint) *Writer](#Writer.Init)
        * [func (b *Writer) Write(buf []byte) (n int, err error)](#Writer.Write)
        * [func (b *Writer) addLine(flushed bool)](#Writer.addLine)
        * [func (b *Writer) append(text []byte)](#Writer.append)
        * [func (b *Writer) dump()](#Writer.dump)
        * [func (b *Writer) endEscape()](#Writer.endEscape)
        * [func (b *Writer) flush() (err error)](#Writer.flush)
        * [func (b *Writer) flushNoDefers()](#Writer.flushNoDefers)
        * [func (b *Writer) format(pos0 int, line0, line1 int) (pos int)](#Writer.format)
        * [func (b *Writer) handlePanic(err *error, op string)](#Writer.handlePanic)
        * [func (b *Writer) reset()](#Writer.reset)
        * [func (b *Writer) startEscape(ch byte)](#Writer.startEscape)
        * [func (b *Writer) terminateCell(htab bool) int](#Writer.terminateCell)
        * [func (b *Writer) updateWidth()](#Writer.updateWidth)
        * [func (b *Writer) write0(buf []byte)](#Writer.write0)
        * [func (b *Writer) writeLines(pos0 int, line0, line1 int) (pos int)](#Writer.writeLines)
        * [func (b *Writer) writeN(src []byte, n int)](#Writer.writeN)
        * [func (b *Writer) writePadding(textw, cellw int, useTabs bool)](#Writer.writePadding)
    * [type cell struct](#cell)
    * [type osError struct](#osError)


## <a id="const" href="#const">Constants</a>

### <a id="AlignRight" href="#AlignRight">const AlignRight</a>

```
searchKey: tabwriter.AlignRight
tags: [constant number]
```

```Go
const AlignRight
```

Formatting can be controlled with these flags. 

Force right-alignment of cell content. Default is left-alignment. 

### <a id="Debug" href="#Debug">const Debug</a>

```
searchKey: tabwriter.Debug
tags: [constant number]
```

```Go
const Debug
```

Formatting can be controlled with these flags. 

Print a vertical bar ('|') between columns (after formatting). Discarded columns appear as zero-width columns ("||"). 

### <a id="DiscardEmptyColumns" href="#DiscardEmptyColumns">const DiscardEmptyColumns</a>

```
searchKey: tabwriter.DiscardEmptyColumns
tags: [constant number]
```

```Go
const DiscardEmptyColumns
```

Formatting can be controlled with these flags. 

Handle empty columns as if they were not present in the input in the first place. 

### <a id="Escape" href="#Escape">const Escape</a>

```
searchKey: tabwriter.Escape
tags: [constant number]
```

```Go
const Escape = '\xff'
```

To escape a text segment, bracket it with Escape characters. For instance, the tab in this string "Ignore this tab: \xff\t\xff" does not terminate a cell and constitutes a single character of width one for formatting purposes. 

The value 0xff was chosen because it cannot appear in a valid UTF-8 sequence. 

### <a id="FilterHTML" href="#FilterHTML">const FilterHTML</a>

```
searchKey: tabwriter.FilterHTML
tags: [constant number]
```

```Go
const FilterHTML uint = 1 << iota
```

Formatting can be controlled with these flags. 

Ignore html tags and treat entities (starting with '&' and ending in ';') as single characters (width = 1). 

### <a id="StripEscape" href="#StripEscape">const StripEscape</a>

```
searchKey: tabwriter.StripEscape
tags: [constant number]
```

```Go
const StripEscape
```

Formatting can be controlled with these flags. 

Strip Escape characters bracketing escaped text segments instead of passing them through unchanged with the text. 

### <a id="TabIndent" href="#TabIndent">const TabIndent</a>

```
searchKey: tabwriter.TabIndent
tags: [constant number]
```

```Go
const TabIndent
```

Formatting can be controlled with these flags. 

Always use tabs for indentation columns (i.e., padding of leading empty cells on the left) independent of padchar. 

## <a id="var" href="#var">Variables</a>

### <a id="hbar" href="#hbar">var hbar</a>

```
searchKey: tabwriter.hbar
tags: [variable array number private]
```

```Go
var hbar = []byte("---\n")
```

### <a id="newline" href="#newline">var newline</a>

```
searchKey: tabwriter.newline
tags: [variable array number private]
```

```Go
var newline = []byte{'\n'}
```

### <a id="tabs" href="#tabs">var tabs</a>

```
searchKey: tabwriter.tabs
tags: [variable array number private]
```

```Go
var tabs = []byte("\t\t\t\t\t\t\t\t")
```

### <a id="vbar" href="#vbar">var vbar</a>

```
searchKey: tabwriter.vbar
tags: [variable array number private]
```

```Go
var vbar = []byte{'|'}
```

## <a id="type" href="#type">Types</a>

### <a id="Writer" href="#Writer">type Writer struct</a>

```
searchKey: tabwriter.Writer
tags: [struct]
```

```Go
type Writer struct {
	// configuration
	output   io.Writer
	minwidth int
	tabwidth int
	padding  int
	padbytes [8]byte
	flags    uint

	// current state
	buf     []byte   // collected text excluding tabs or line breaks
	pos     int      // buffer position up to which cell.width of incomplete cell has been computed
	cell    cell     // current incomplete cell; cell.width is up to buf[pos] excluding ignored sections
	endChar byte     // terminating char of escaped sequence (Escape for escapes, '>', ';' for HTML tags/entities, or 0)
	lines   [][]cell // list of lines; each line is a list of cells
	widths  []int    // list of column widths in runes - re-used during formatting
}
```

A Writer is a filter that inserts padding around tab-delimited columns in its input to align them in the output. 

The Writer treats incoming bytes as UTF-8-encoded text consisting of cells terminated by horizontal ('\t') or vertical ('\v') tabs, and newline ('\n') or formfeed ('\f') characters; both newline and formfeed act as line breaks. 

Tab-terminated cells in contiguous lines constitute a column. The Writer inserts padding as needed to make all cells in a column have the same width, effectively aligning the columns. It assumes that all characters have the same width, except for tabs for which a tabwidth must be specified. Column cells must be tab-terminated, not tab-separated: non-tab terminated trailing text at the end of a line forms a cell but that cell is not part of an aligned column. For instance, in this example (where | stands for a horizontal tab): 

```
aaaa|bbb|d
aa  |b  |dd
a   |
aa  |cccc|eee

```
the b and c are in distinct columns (the b column is not contiguous all the way). The d and e are not in a column at all (there's no terminating tab, nor would the column be contiguous). 

The Writer assumes that all Unicode code points have the same width; this may not be true in some fonts or if the string contains combining characters. 

If DiscardEmptyColumns is set, empty columns that are terminated entirely by vertical (or "soft") tabs are discarded. Columns terminated by horizontal (or "hard") tabs are not affected by this flag. 

If a Writer is configured to filter HTML, HTML tags and entities are passed through. The widths of tags and entities are assumed to be zero (tags) and one (entities) for formatting purposes. 

A segment of text may be escaped by bracketing it with Escape characters. The tabwriter passes escaped text segments through unchanged. In particular, it does not interpret any tabs or line breaks within the segment. If the StripEscape flag is set, the Escape characters are stripped from the output; otherwise they are passed through as well. For the purpose of formatting, the width of the escaped text is always computed excluding the Escape characters. 

The formfeed character acts like a newline but it also terminates all columns in the current line (effectively calling Flush). Tab- terminated cells in the next line start new columns. Unless found inside an HTML tag or inside an escaped text segment, formfeed characters appear as newlines in the output. 

The Writer must buffer input internally, because proper spacing of one line may depend on the cells in future lines. Clients must call Flush when done calling Write. 

#### <a id="NewWriter" href="#NewWriter">func NewWriter(output io.Writer, minwidth, tabwidth, padding int, padchar byte, flags uint) *Writer</a>

```
searchKey: tabwriter.NewWriter
tags: [function]
```

```Go
func NewWriter(output io.Writer, minwidth, tabwidth, padding int, padchar byte, flags uint) *Writer
```

NewWriter allocates and initializes a new tabwriter.Writer. The parameters are the same as for the Init function. 

#### <a id="Writer.Flush" href="#Writer.Flush">func (b *Writer) Flush() error</a>

```
searchKey: tabwriter.Writer.Flush
tags: [method]
```

```Go
func (b *Writer) Flush() error
```

Flush should be called after the last call to Write to ensure that any data buffered in the Writer is written to output. Any incomplete escape sequence at the end is considered complete for formatting purposes. 

#### <a id="Writer.Init" href="#Writer.Init">func (b *Writer) Init(output io.Writer, minwidth, tabwidth, padding int, padchar byte, flags uint) *Writer</a>

```
searchKey: tabwriter.Writer.Init
tags: [method]
```

```Go
func (b *Writer) Init(output io.Writer, minwidth, tabwidth, padding int, padchar byte, flags uint) *Writer
```

A Writer must be initialized with a call to Init. The first parameter (output) specifies the filter output. The remaining parameters control the formatting: 

```
minwidth	minimal cell width including any padding
tabwidth	width of tab characters (equivalent number of spaces)
padding		padding added to a cell before computing its width
padchar		ASCII char used for padding
		if padchar == '\t', the Writer will assume that the
		width of a '\t' in the formatted output is tabwidth,
		and cells are left-aligned independent of align_left
		(for correct-looking results, tabwidth must correspond
		to the tab width in the viewer displaying the result)
flags		formatting control

```
#### <a id="Writer.Write" href="#Writer.Write">func (b *Writer) Write(buf []byte) (n int, err error)</a>

```
searchKey: tabwriter.Writer.Write
tags: [method]
```

```Go
func (b *Writer) Write(buf []byte) (n int, err error)
```

Write writes buf to the writer b. The only errors returned are ones encountered while writing to the underlying output stream. 

#### <a id="Writer.addLine" href="#Writer.addLine">func (b *Writer) addLine(flushed bool)</a>

```
searchKey: tabwriter.Writer.addLine
tags: [method private]
```

```Go
func (b *Writer) addLine(flushed bool)
```

addLine adds a new line. flushed is a hint indicating whether the underlying writer was just flushed. If so, the previous line is not likely to be a good indicator of the new line's cells. 

#### <a id="Writer.append" href="#Writer.append">func (b *Writer) append(text []byte)</a>

```
searchKey: tabwriter.Writer.append
tags: [method private]
```

```Go
func (b *Writer) append(text []byte)
```

Append text to current cell. 

#### <a id="Writer.dump" href="#Writer.dump">func (b *Writer) dump()</a>

```
searchKey: tabwriter.Writer.dump
tags: [method private]
```

```Go
func (b *Writer) dump()
```

debugging support (keep code around) 

#### <a id="Writer.endEscape" href="#Writer.endEscape">func (b *Writer) endEscape()</a>

```
searchKey: tabwriter.Writer.endEscape
tags: [method private]
```

```Go
func (b *Writer) endEscape()
```

Terminate escaped mode. If the escaped text was an HTML tag, its width is assumed to be zero for formatting purposes; if it was an HTML entity, its width is assumed to be one. In all other cases, the width is the unicode width of the text. 

#### <a id="Writer.flush" href="#Writer.flush">func (b *Writer) flush() (err error)</a>

```
searchKey: tabwriter.Writer.flush
tags: [method private]
```

```Go
func (b *Writer) flush() (err error)
```

flush is the internal version of Flush, with a named return value which we don't want to expose. 

#### <a id="Writer.flushNoDefers" href="#Writer.flushNoDefers">func (b *Writer) flushNoDefers()</a>

```
searchKey: tabwriter.Writer.flushNoDefers
tags: [method private]
```

```Go
func (b *Writer) flushNoDefers()
```

flushNoDefers is like flush, but without a deferred handlePanic call. This can be called from other methods which already have their own deferred handlePanic calls, such as Write, and avoid the extra defer work. 

#### <a id="Writer.format" href="#Writer.format">func (b *Writer) format(pos0 int, line0, line1 int) (pos int)</a>

```
searchKey: tabwriter.Writer.format
tags: [method private]
```

```Go
func (b *Writer) format(pos0 int, line0, line1 int) (pos int)
```

Format the text between line0 and line1 (excluding line1); pos is the buffer position corresponding to the beginning of line0. Returns the buffer position corresponding to the beginning of line1 and an error, if any. 

#### <a id="Writer.handlePanic" href="#Writer.handlePanic">func (b *Writer) handlePanic(err *error, op string)</a>

```
searchKey: tabwriter.Writer.handlePanic
tags: [method private]
```

```Go
func (b *Writer) handlePanic(err *error, op string)
```

#### <a id="Writer.reset" href="#Writer.reset">func (b *Writer) reset()</a>

```
searchKey: tabwriter.Writer.reset
tags: [method private]
```

```Go
func (b *Writer) reset()
```

Reset the current state. 

#### <a id="Writer.startEscape" href="#Writer.startEscape">func (b *Writer) startEscape(ch byte)</a>

```
searchKey: tabwriter.Writer.startEscape
tags: [method private]
```

```Go
func (b *Writer) startEscape(ch byte)
```

Start escaped mode. 

#### <a id="Writer.terminateCell" href="#Writer.terminateCell">func (b *Writer) terminateCell(htab bool) int</a>

```
searchKey: tabwriter.Writer.terminateCell
tags: [method private]
```

```Go
func (b *Writer) terminateCell(htab bool) int
```

Terminate the current cell by adding it to the list of cells of the current line. Returns the number of cells in that line. 

#### <a id="Writer.updateWidth" href="#Writer.updateWidth">func (b *Writer) updateWidth()</a>

```
searchKey: tabwriter.Writer.updateWidth
tags: [method private]
```

```Go
func (b *Writer) updateWidth()
```

Update the cell width. 

#### <a id="Writer.write0" href="#Writer.write0">func (b *Writer) write0(buf []byte)</a>

```
searchKey: tabwriter.Writer.write0
tags: [method private]
```

```Go
func (b *Writer) write0(buf []byte)
```

#### <a id="Writer.writeLines" href="#Writer.writeLines">func (b *Writer) writeLines(pos0 int, line0, line1 int) (pos int)</a>

```
searchKey: tabwriter.Writer.writeLines
tags: [method private]
```

```Go
func (b *Writer) writeLines(pos0 int, line0, line1 int) (pos int)
```

#### <a id="Writer.writeN" href="#Writer.writeN">func (b *Writer) writeN(src []byte, n int)</a>

```
searchKey: tabwriter.Writer.writeN
tags: [method private]
```

```Go
func (b *Writer) writeN(src []byte, n int)
```

#### <a id="Writer.writePadding" href="#Writer.writePadding">func (b *Writer) writePadding(textw, cellw int, useTabs bool)</a>

```
searchKey: tabwriter.Writer.writePadding
tags: [method private]
```

```Go
func (b *Writer) writePadding(textw, cellw int, useTabs bool)
```

### <a id="cell" href="#cell">type cell struct</a>

```
searchKey: tabwriter.cell
tags: [struct private]
```

```Go
type cell struct {
	size  int  // cell size in bytes
	width int  // cell width in runes
	htab  bool // true if the cell is terminated by an htab ('\t')
}
```

A cell represents a segment of text terminated by tabs or line breaks. The text itself is stored in a separate buffer; cell only describes the segment's size in bytes, its width in runes, and whether it's an htab ('\t') terminated cell. 

### <a id="osError" href="#osError">type osError struct</a>

```
searchKey: tabwriter.osError
tags: [struct private]
```

```Go
type osError struct {
	err error
}
```

local error wrapper so we can distinguish errors we want to return as errors from genuine panics (which we don't want to return as errors) 

