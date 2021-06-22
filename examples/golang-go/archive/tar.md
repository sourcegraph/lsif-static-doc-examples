# Package tar

Package tar implements access to tar archives. 

Tape archives (tar) are a file format for storing a sequence of files that can be read and written in a streaming manner. This package aims to cover most variations of the format, including those produced by GNU and BSD tar tools. 

## Index

* [Constants](#const)
    * [const TypeReg](#TypeReg)
    * [const TypeRegA](#TypeRegA)
    * [const TypeLink](#TypeLink)
    * [const TypeSymlink](#TypeSymlink)
    * [const TypeChar](#TypeChar)
    * [const TypeBlock](#TypeBlock)
    * [const TypeDir](#TypeDir)
    * [const TypeFifo](#TypeFifo)
    * [const TypeCont](#TypeCont)
    * [const TypeXHeader](#TypeXHeader)
    * [const TypeXGlobalHeader](#TypeXGlobalHeader)
    * [const TypeGNUSparse](#TypeGNUSparse)
    * [const TypeGNULongName](#TypeGNULongName)
    * [const TypeGNULongLink](#TypeGNULongLink)
    * [const paxNone](#paxNone)
    * [const paxPath](#paxPath)
    * [const paxLinkpath](#paxLinkpath)
    * [const paxSize](#paxSize)
    * [const paxUid](#paxUid)
    * [const paxGid](#paxGid)
    * [const paxUname](#paxUname)
    * [const paxGname](#paxGname)
    * [const paxMtime](#paxMtime)
    * [const paxAtime](#paxAtime)
    * [const paxCtime](#paxCtime)
    * [const paxCharset](#paxCharset)
    * [const paxComment](#paxComment)
    * [const paxSchilyXattr](#paxSchilyXattr)
    * [const paxGNUSparse](#paxGNUSparse)
    * [const paxGNUSparseNumBlocks](#paxGNUSparseNumBlocks)
    * [const paxGNUSparseOffset](#paxGNUSparseOffset)
    * [const paxGNUSparseNumBytes](#paxGNUSparseNumBytes)
    * [const paxGNUSparseMap](#paxGNUSparseMap)
    * [const paxGNUSparseName](#paxGNUSparseName)
    * [const paxGNUSparseMajor](#paxGNUSparseMajor)
    * [const paxGNUSparseMinor](#paxGNUSparseMinor)
    * [const paxGNUSparseSize](#paxGNUSparseSize)
    * [const paxGNUSparseRealSize](#paxGNUSparseRealSize)
    * [const c_ISUID](#c_ISUID)
    * [const c_ISGID](#c_ISGID)
    * [const c_ISVTX](#c_ISVTX)
    * [const c_ISDIR](#c_ISDIR)
    * [const c_ISFIFO](#c_ISFIFO)
    * [const c_ISREG](#c_ISREG)
    * [const c_ISLNK](#c_ISLNK)
    * [const c_ISBLK](#c_ISBLK)
    * [const c_ISCHR](#c_ISCHR)
    * [const c_ISSOCK](#c_ISSOCK)
    * [const FormatUnknown](#FormatUnknown)
    * [const formatV7](#formatV7)
    * [const FormatUSTAR](#FormatUSTAR)
    * [const FormatPAX](#FormatPAX)
    * [const FormatGNU](#FormatGNU)
    * [const formatSTAR](#formatSTAR)
    * [const formatMax](#formatMax)
    * [const magicGNU](#magicGNU)
    * [const versionGNU](#versionGNU)
    * [const magicUSTAR](#magicUSTAR)
    * [const versionUSTAR](#versionUSTAR)
    * [const trailerSTAR](#trailerSTAR)
    * [const blockSize](#blockSize)
    * [const nameSize](#nameSize)
    * [const prefixSize](#prefixSize)
* [Variables](#var)
    * [var ErrHeader](#ErrHeader)
    * [var ErrWriteTooLong](#ErrWriteTooLong)
    * [var ErrFieldTooLong](#ErrFieldTooLong)
    * [var ErrWriteAfterClose](#ErrWriteAfterClose)
    * [var errMissData](#errMissData)
    * [var errUnrefData](#errUnrefData)
    * [var errWriteHole](#errWriteHole)
    * [var basicKeys](#basicKeys)
    * [var sysStat](#sysStat)
    * [var formatNames](#formatNames)
    * [var zeroBlock](#zeroBlock)
    * [var userMap](#userMap)
    * [var groupMap](#groupMap)
* [Types](#type)
    * [type headerError []string](#headerError)
        * [func (he headerError) Error() string](#headerError.Error)
    * [type Header struct](#Header)
        * [func FileInfoHeader(fi fs.FileInfo, link string) (*Header, error)](#FileInfoHeader)
        * [func (h Header) allowedFormats() (format Format, paxHdrs map[string]string, err error)](#Header.allowedFormats)
        * [func (h *Header) FileInfo() fs.FileInfo](#Header.FileInfo)
    * [type sparseEntry struct](#sparseEntry)
        * [func (s sparseEntry) endOffset() int64](#sparseEntry.endOffset)
    * [type sparseDatas []tar.sparseEntry](#sparseDatas)
        * [func readGNUSparseMap1x0(r io.Reader) (sparseDatas, error)](#readGNUSparseMap1x0)
        * [func readGNUSparseMap0x1(paxHdrs map[string]string) (sparseDatas, error)](#readGNUSparseMap0x1)
    * [type sparseHoles []tar.sparseEntry](#sparseHoles)
    * [type fileState interface](#fileState)
    * [type headerFileInfo struct](#headerFileInfo)
        * [func (fi headerFileInfo) Size() int64](#headerFileInfo.Size)
        * [func (fi headerFileInfo) IsDir() bool](#headerFileInfo.IsDir)
        * [func (fi headerFileInfo) ModTime() time.Time](#headerFileInfo.ModTime)
        * [func (fi headerFileInfo) Sys() interface{}](#headerFileInfo.Sys)
        * [func (fi headerFileInfo) Name() string](#headerFileInfo.Name)
        * [func (fi headerFileInfo) Mode() (mode fs.FileMode)](#headerFileInfo.Mode)
    * [type Format int](#Format)
        * [func (f Format) has(f2 Format) bool](#Format.has)
        * [func (f *Format) mayBe(f2 Format)](#Format.mayBe)
        * [func (f *Format) mayOnlyBe(f2 Format)](#Format.mayOnlyBe)
        * [func (f *Format) mustNotBe(f2 Format)](#Format.mustNotBe)
        * [func (f Format) String() string](#Format.String)
    * [type block [512]byte](#block)
        * [func (b *block) V7() *headerV7](#block.V7)
        * [func (b *block) GNU() *headerGNU](#block.GNU)
        * [func (b *block) STAR() *headerSTAR](#block.STAR)
        * [func (b *block) USTAR() *headerUSTAR](#block.USTAR)
        * [func (b *block) Sparse() sparseArray](#block.Sparse)
        * [func (b *block) GetFormat() Format](#block.GetFormat)
        * [func (b *block) SetFormat(format Format)](#block.SetFormat)
        * [func (b *block) ComputeChecksum() (unsigned, signed int64)](#block.ComputeChecksum)
        * [func (b *block) Reset()](#block.Reset)
    * [type headerV7 [512]byte](#headerV7)
        * [func (h *headerV7) Name() []byte](#headerV7.Name)
        * [func (h *headerV7) Mode() []byte](#headerV7.Mode)
        * [func (h *headerV7) UID() []byte](#headerV7.UID)
        * [func (h *headerV7) GID() []byte](#headerV7.GID)
        * [func (h *headerV7) Size() []byte](#headerV7.Size)
        * [func (h *headerV7) ModTime() []byte](#headerV7.ModTime)
        * [func (h *headerV7) Chksum() []byte](#headerV7.Chksum)
        * [func (h *headerV7) TypeFlag() []byte](#headerV7.TypeFlag)
        * [func (h *headerV7) LinkName() []byte](#headerV7.LinkName)
    * [type headerGNU [512]byte](#headerGNU)
        * [func (h *headerGNU) V7() *headerV7](#headerGNU.V7)
        * [func (h *headerGNU) Magic() []byte](#headerGNU.Magic)
        * [func (h *headerGNU) Version() []byte](#headerGNU.Version)
        * [func (h *headerGNU) UserName() []byte](#headerGNU.UserName)
        * [func (h *headerGNU) GroupName() []byte](#headerGNU.GroupName)
        * [func (h *headerGNU) DevMajor() []byte](#headerGNU.DevMajor)
        * [func (h *headerGNU) DevMinor() []byte](#headerGNU.DevMinor)
        * [func (h *headerGNU) AccessTime() []byte](#headerGNU.AccessTime)
        * [func (h *headerGNU) ChangeTime() []byte](#headerGNU.ChangeTime)
        * [func (h *headerGNU) Sparse() sparseArray](#headerGNU.Sparse)
        * [func (h *headerGNU) RealSize() []byte](#headerGNU.RealSize)
    * [type headerSTAR [512]byte](#headerSTAR)
        * [func (h *headerSTAR) V7() *headerV7](#headerSTAR.V7)
        * [func (h *headerSTAR) Magic() []byte](#headerSTAR.Magic)
        * [func (h *headerSTAR) Version() []byte](#headerSTAR.Version)
        * [func (h *headerSTAR) UserName() []byte](#headerSTAR.UserName)
        * [func (h *headerSTAR) GroupName() []byte](#headerSTAR.GroupName)
        * [func (h *headerSTAR) DevMajor() []byte](#headerSTAR.DevMajor)
        * [func (h *headerSTAR) DevMinor() []byte](#headerSTAR.DevMinor)
        * [func (h *headerSTAR) Prefix() []byte](#headerSTAR.Prefix)
        * [func (h *headerSTAR) AccessTime() []byte](#headerSTAR.AccessTime)
        * [func (h *headerSTAR) ChangeTime() []byte](#headerSTAR.ChangeTime)
        * [func (h *headerSTAR) Trailer() []byte](#headerSTAR.Trailer)
    * [type headerUSTAR [512]byte](#headerUSTAR)
        * [func (h *headerUSTAR) V7() *headerV7](#headerUSTAR.V7)
        * [func (h *headerUSTAR) Magic() []byte](#headerUSTAR.Magic)
        * [func (h *headerUSTAR) Version() []byte](#headerUSTAR.Version)
        * [func (h *headerUSTAR) UserName() []byte](#headerUSTAR.UserName)
        * [func (h *headerUSTAR) GroupName() []byte](#headerUSTAR.GroupName)
        * [func (h *headerUSTAR) DevMajor() []byte](#headerUSTAR.DevMajor)
        * [func (h *headerUSTAR) DevMinor() []byte](#headerUSTAR.DevMinor)
        * [func (h *headerUSTAR) Prefix() []byte](#headerUSTAR.Prefix)
    * [type sparseArray []byte](#sparseArray)
        * [func (s sparseArray) Entry(i int) sparseElem](#sparseArray.Entry)
        * [func (s sparseArray) IsExtended() []byte](#sparseArray.IsExtended)
        * [func (s sparseArray) MaxEntries() int](#sparseArray.MaxEntries)
    * [type sparseElem []byte](#sparseElem)
        * [func (s sparseElem) Offset() []byte](#sparseElem.Offset)
        * [func (s sparseElem) Length() []byte](#sparseElem.Length)
    * [type Reader struct](#Reader)
        * [func NewReader(r io.Reader) *Reader](#NewReader)
        * [func (tr *Reader) Next() (*Header, error)](#Reader.Next)
        * [func (tr *Reader) next() (*Header, error)](#Reader.next)
        * [func (tr *Reader) handleRegularFile(hdr *Header) error](#Reader.handleRegularFile)
        * [func (tr *Reader) handleSparseFile(hdr *Header, rawHdr *block) error](#Reader.handleSparseFile)
        * [func (tr *Reader) readGNUSparsePAXHeaders(hdr *Header) (sparseDatas, error)](#Reader.readGNUSparsePAXHeaders)
        * [func (tr *Reader) readHeader() (*Header, *block, error)](#Reader.readHeader)
        * [func (tr *Reader) readOldGNUSparseMap(hdr *Header, blk *block) (sparseDatas, error)](#Reader.readOldGNUSparseMap)
        * [func (tr *Reader) Read(b []byte) (int, error)](#Reader.Read)
        * [func (tr *Reader) writeTo(w io.Writer) (int64, error)](#Reader.writeTo)
    * [type fileReader interface](#fileReader)
    * [type regFileReader struct](#regFileReader)
        * [func (fr *regFileReader) Read(b []byte) (n int, err error)](#regFileReader.Read)
        * [func (fr *regFileReader) WriteTo(w io.Writer) (int64, error)](#regFileReader.WriteTo)
        * [func (fr regFileReader) LogicalRemaining() int64](#regFileReader.LogicalRemaining)
        * [func (fr regFileReader) PhysicalRemaining() int64](#regFileReader.PhysicalRemaining)
    * [type sparseFileReader struct](#sparseFileReader)
        * [func (sr *sparseFileReader) Read(b []byte) (n int, err error)](#sparseFileReader.Read)
        * [func (sr *sparseFileReader) WriteTo(w io.Writer) (n int64, err error)](#sparseFileReader.WriteTo)
        * [func (sr sparseFileReader) LogicalRemaining() int64](#sparseFileReader.LogicalRemaining)
        * [func (sr sparseFileReader) PhysicalRemaining() int64](#sparseFileReader.PhysicalRemaining)
    * [type zeroReader struct{}](#zeroReader)
        * [func (zeroReader) Read(b []byte) (int, error)](#zeroReader.Read)
    * [type parser struct](#parser)
        * [func (*parser) parseString(b []byte) string](#parser.parseString)
        * [func (p *parser) parseNumeric(b []byte) int64](#parser.parseNumeric)
        * [func (p *parser) parseOctal(b []byte) int64](#parser.parseOctal)
    * [type formatter struct](#formatter)
        * [func (f *formatter) formatString(b []byte, s string)](#formatter.formatString)
        * [func (f *formatter) formatNumeric(b []byte, x int64)](#formatter.formatNumeric)
        * [func (f *formatter) formatOctal(b []byte, x int64)](#formatter.formatOctal)
    * [type Writer struct](#Writer)
        * [func NewWriter(w io.Writer) *Writer](#NewWriter)
        * [func (tw *Writer) Flush() error](#Writer.Flush)
        * [func (tw *Writer) WriteHeader(hdr *Header) error](#Writer.WriteHeader)
        * [func (tw *Writer) writeUSTARHeader(hdr *Header) error](#Writer.writeUSTARHeader)
        * [func (tw *Writer) writePAXHeader(hdr *Header, paxHdrs map[string]string) error](#Writer.writePAXHeader)
        * [func (tw *Writer) writeGNUHeader(hdr *Header) error](#Writer.writeGNUHeader)
        * [func (tw *Writer) templateV7Plus(hdr *Header, fmtStr stringFormatter, fmtNum numberFormatter) *block](#Writer.templateV7Plus)
        * [func (tw *Writer) writeRawFile(name, data string, flag byte, format Format) error](#Writer.writeRawFile)
        * [func (tw *Writer) writeRawHeader(blk *block, size int64, flag byte) error](#Writer.writeRawHeader)
        * [func (tw *Writer) Write(b []byte) (int, error)](#Writer.Write)
        * [func (tw *Writer) readFrom(r io.Reader) (int64, error)](#Writer.readFrom)
        * [func (tw *Writer) Close() error](#Writer.Close)
    * [type fileWriter interface](#fileWriter)
    * [type stringFormatter func([]byte, string)](#stringFormatter)
    * [type numberFormatter func([]byte, int64)](#numberFormatter)
    * [type regFileWriter struct](#regFileWriter)
        * [func (fw *regFileWriter) Write(b []byte) (n int, err error)](#regFileWriter.Write)
        * [func (fw *regFileWriter) ReadFrom(r io.Reader) (int64, error)](#regFileWriter.ReadFrom)
        * [func (fw regFileWriter) LogicalRemaining() int64](#regFileWriter.LogicalRemaining)
        * [func (fw regFileWriter) PhysicalRemaining() int64](#regFileWriter.PhysicalRemaining)
    * [type sparseFileWriter struct](#sparseFileWriter)
        * [func (sw *sparseFileWriter) Write(b []byte) (n int, err error)](#sparseFileWriter.Write)
        * [func (sw *sparseFileWriter) ReadFrom(r io.Reader) (n int64, err error)](#sparseFileWriter.ReadFrom)
        * [func (sw sparseFileWriter) LogicalRemaining() int64](#sparseFileWriter.LogicalRemaining)
        * [func (sw sparseFileWriter) PhysicalRemaining() int64](#sparseFileWriter.PhysicalRemaining)
    * [type zeroWriter struct{}](#zeroWriter)
        * [func (zeroWriter) Write(b []byte) (int, error)](#zeroWriter.Write)
    * [type reader struct](#reader)
    * [type readSeeker struct](#readSeeker)
    * [type readBadSeeker struct](#readBadSeeker)
        * [func (rbs *readBadSeeker) Seek(int64, int) (int64, error)](#readBadSeeker.Seek)
    * [type testNonEmptyReader struct](#testNonEmptyReader)
        * [func (r testNonEmptyReader) Read(b []byte) (int, error)](#testNonEmptyReader.Read)
    * [type testError struct](#testError)
    * [type fileOps []interface{}](#fileOps)
    * [type testFile struct](#testFile)
        * [func (f *testFile) Read(b []byte) (int, error)](#testFile.Read)
        * [func (f *testFile) Write(b []byte) (int, error)](#testFile.Write)
        * [func (f *testFile) Seek(pos int64, whence int) (int64, error)](#testFile.Seek)
    * [type headerRoundTripTest struct](#headerRoundTripTest)
    * [type failOnceWriter bool](#failOnceWriter)
        * [func (w *failOnceWriter) Write(b []byte) (int, error)](#failOnceWriter.Write)
    * [type testNonEmptyWriter struct](#testNonEmptyWriter)
        * [func (w testNonEmptyWriter) Write(b []byte) (int, error)](#testNonEmptyWriter.Write)
* [Functions](#func)
    * [func validateSparseEntries(sp []sparseEntry, size int64) bool](#validateSparseEntries)
    * [func alignSparseEntries(src []sparseEntry, size int64) []sparseEntry](#alignSparseEntries)
    * [func invertSparseEntries(src []sparseEntry, size int64) []sparseEntry](#invertSparseEntries)
    * [func isHeaderOnlyType(flag byte) bool](#isHeaderOnlyType)
    * [func min(a, b int64) int64](#min)
    * [func blockPadding(offset int64) (n int64)](#blockPadding)
    * [func mergePAX(hdr *Header, paxHdrs map[string]string) (err error)](#mergePAX)
    * [func parsePAX(r io.Reader) (map[string]string, error)](#parsePAX)
    * [func mustReadFull(r io.Reader, b []byte) (int, error)](#mustReadFull)
    * [func tryReadFull(r io.Reader, b []byte) (n int, err error)](#tryReadFull)
    * [func discard(r io.Reader, n int64) error](#discard)
    * [func statAtime(st *syscall.Stat_t) time.Time](#statAtime)
    * [func statCtime(st *syscall.Stat_t) time.Time](#statCtime)
    * [func init()](#init)
    * [func statUnix(fi fs.FileInfo, h *Header) error](#statUnix)
    * [func hasNUL(s string) bool](#hasNUL)
    * [func isASCII(s string) bool](#isASCII)
    * [func toASCII(s string) string](#toASCII)
    * [func fitsInBase256(n int, x int64) bool](#fitsInBase256)
    * [func fitsInOctal(n int, x int64) bool](#fitsInOctal)
    * [func parsePAXTime(s string) (time.Time, error)](#parsePAXTime)
    * [func formatPAXTime(ts time.Time) (s string)](#formatPAXTime)
    * [func parsePAXRecord(s string) (k, v, r string, err error)](#parsePAXRecord)
    * [func formatPAXRecord(k, v string) (string, error)](#formatPAXRecord)
    * [func validPAXRecord(k, v string) bool](#validPAXRecord)
    * [func splitUSTARPath(name string) (prefix, suffix string, ok bool)](#splitUSTARPath)
    * [func ensureEOF(r io.Reader) error](#ensureEOF)
    * [func TestReader(t *testing.T)](#TestReader)
    * [func TestPartialRead(t *testing.T)](#TestPartialRead)
    * [func TestUninitializedRead(t *testing.T)](#TestUninitializedRead)
    * [func TestReadTruncation(t *testing.T)](#TestReadTruncation)
    * [func TestReadHeaderOnly(t *testing.T)](#TestReadHeaderOnly)
    * [func TestMergePAX(t *testing.T)](#TestMergePAX)
    * [func TestParsePAX(t *testing.T)](#TestParsePAX)
    * [func TestReadOldGNUSparseMap(t *testing.T)](#TestReadOldGNUSparseMap)
    * [func TestReadGNUSparsePAXHeaders(t *testing.T)](#TestReadGNUSparsePAXHeaders)
    * [func TestFileReader(t *testing.T)](#TestFileReader)
    * [func TestFitsInBase256(t *testing.T)](#TestFitsInBase256)
    * [func TestParseNumeric(t *testing.T)](#TestParseNumeric)
    * [func TestFormatNumeric(t *testing.T)](#TestFormatNumeric)
    * [func TestFitsInOctal(t *testing.T)](#TestFitsInOctal)
    * [func TestParsePAXTime(t *testing.T)](#TestParsePAXTime)
    * [func TestFormatPAXTime(t *testing.T)](#TestFormatPAXTime)
    * [func TestParsePAXRecord(t *testing.T)](#TestParsePAXRecord)
    * [func TestFormatPAXRecord(t *testing.T)](#TestFormatPAXRecord)
    * [func equalSparseEntries(x, y []sparseEntry) bool](#equalSparseEntries)
    * [func TestSparseEntries(t *testing.T)](#TestSparseEntries)
    * [func TestFileInfoHeader(t *testing.T)](#TestFileInfoHeader)
    * [func TestFileInfoHeaderDir(t *testing.T)](#TestFileInfoHeaderDir)
    * [func TestFileInfoHeaderSymlink(t *testing.T)](#TestFileInfoHeaderSymlink)
    * [func TestRoundTrip(t *testing.T)](#TestRoundTrip)
    * [func TestHeaderRoundTrip(t *testing.T)](#TestHeaderRoundTrip)
    * [func TestHeaderAllowedFormats(t *testing.T)](#TestHeaderAllowedFormats)
    * [func Benchmark(b *testing.B)](#Benchmark)
    * [func bytediff(a, b []byte) string](#bytediff)
    * [func TestWriter(t *testing.T)](#TestWriter)
    * [func TestPax(t *testing.T)](#TestPax)
    * [func TestPaxSymlink(t *testing.T)](#TestPaxSymlink)
    * [func TestPaxNonAscii(t *testing.T)](#TestPaxNonAscii)
    * [func TestPaxXattrs(t *testing.T)](#TestPaxXattrs)
    * [func TestPaxHeadersSorted(t *testing.T)](#TestPaxHeadersSorted)
    * [func TestUSTARLongName(t *testing.T)](#TestUSTARLongName)
    * [func TestValidTypeflagWithPAXHeader(t *testing.T)](#TestValidTypeflagWithPAXHeader)
    * [func TestWriterErrors(t *testing.T)](#TestWriterErrors)
    * [func TestSplitUSTARPath(t *testing.T)](#TestSplitUSTARPath)
    * [func TestIssue12594(t *testing.T)](#TestIssue12594)
    * [func TestFileWriter(t *testing.T)](#TestFileWriter)


## <a id="const" href="#const">Constants</a>

```
tags: [exported]
```

### <a id="TypeReg" href="#TypeReg">const TypeReg</a>

```
searchKey: tar.TypeReg
tags: [exported]
```

```Go
const TypeReg = '0'
```

Type flags for Header.Typeflag. 

Type '0' indicates a regular file. 

### <a id="TypeRegA" href="#TypeRegA">const TypeRegA</a>

```
searchKey: tar.TypeRegA
tags: [exported]
```

```Go
const TypeRegA = '\x00' // Deprecated: Use TypeReg instead.

```

Type flags for Header.Typeflag. 

### <a id="TypeLink" href="#TypeLink">const TypeLink</a>

```
searchKey: tar.TypeLink
tags: [exported]
```

```Go
const TypeLink = '1' // Hard link

```

Type flags for Header.Typeflag. 

Type '1' to '6' are header-only flags and may not have a data body. 

### <a id="TypeSymlink" href="#TypeSymlink">const TypeSymlink</a>

```
searchKey: tar.TypeSymlink
tags: [exported]
```

```Go
const TypeSymlink = '2' // Symbolic link

```

Type flags for Header.Typeflag. 

### <a id="TypeChar" href="#TypeChar">const TypeChar</a>

```
searchKey: tar.TypeChar
tags: [exported]
```

```Go
const TypeChar = '3' // Character device node

```

Type flags for Header.Typeflag. 

### <a id="TypeBlock" href="#TypeBlock">const TypeBlock</a>

```
searchKey: tar.TypeBlock
tags: [exported]
```

```Go
const TypeBlock = '4' // Block device node

```

Type flags for Header.Typeflag. 

### <a id="TypeDir" href="#TypeDir">const TypeDir</a>

```
searchKey: tar.TypeDir
tags: [exported]
```

```Go
const TypeDir = '5' // Directory

```

Type flags for Header.Typeflag. 

### <a id="TypeFifo" href="#TypeFifo">const TypeFifo</a>

```
searchKey: tar.TypeFifo
tags: [exported]
```

```Go
const TypeFifo = '6' // FIFO node

```

Type flags for Header.Typeflag. 

### <a id="TypeCont" href="#TypeCont">const TypeCont</a>

```
searchKey: tar.TypeCont
tags: [exported]
```

```Go
const TypeCont = '7'
```

Type flags for Header.Typeflag. 

Type '7' is reserved. 

### <a id="TypeXHeader" href="#TypeXHeader">const TypeXHeader</a>

```
searchKey: tar.TypeXHeader
tags: [exported]
```

```Go
const TypeXHeader = 'x'
```

Type flags for Header.Typeflag. 

Type 'x' is used by the PAX format to store key-value records that are only relevant to the next file. This package transparently handles these types. 

### <a id="TypeXGlobalHeader" href="#TypeXGlobalHeader">const TypeXGlobalHeader</a>

```
searchKey: tar.TypeXGlobalHeader
tags: [exported]
```

```Go
const TypeXGlobalHeader = 'g'
```

Type flags for Header.Typeflag. 

Type 'g' is used by the PAX format to store key-value records that are relevant to all subsequent files. This package only supports parsing and composing such headers, but does not currently support persisting the global state across files. 

### <a id="TypeGNUSparse" href="#TypeGNUSparse">const TypeGNUSparse</a>

```
searchKey: tar.TypeGNUSparse
tags: [exported]
```

```Go
const TypeGNUSparse = 'S'
```

Type flags for Header.Typeflag. 

Type 'S' indicates a sparse file in the GNU format. 

### <a id="TypeGNULongName" href="#TypeGNULongName">const TypeGNULongName</a>

```
searchKey: tar.TypeGNULongName
tags: [exported]
```

```Go
const TypeGNULongName = 'L'
```

Type flags for Header.Typeflag. 

Types 'L' and 'K' are used by the GNU format for a meta file used to store the path or link name for the next file. This package transparently handles these types. 

### <a id="TypeGNULongLink" href="#TypeGNULongLink">const TypeGNULongLink</a>

```
searchKey: tar.TypeGNULongLink
tags: [exported]
```

```Go
const TypeGNULongLink = 'K'
```

Type flags for Header.Typeflag. 

### <a id="paxNone" href="#paxNone">const paxNone</a>

```
searchKey: tar.paxNone
```

```Go
const paxNone = "" // Indicates that no PAX key is suitable

```

Keywords for PAX extended header records. 

### <a id="paxPath" href="#paxPath">const paxPath</a>

```
searchKey: tar.paxPath
```

```Go
const paxPath = "path"
```

Keywords for PAX extended header records. 

### <a id="paxLinkpath" href="#paxLinkpath">const paxLinkpath</a>

```
searchKey: tar.paxLinkpath
```

```Go
const paxLinkpath = "linkpath"
```

Keywords for PAX extended header records. 

### <a id="paxSize" href="#paxSize">const paxSize</a>

```
searchKey: tar.paxSize
```

```Go
const paxSize = "size"
```

Keywords for PAX extended header records. 

### <a id="paxUid" href="#paxUid">const paxUid</a>

```
searchKey: tar.paxUid
```

```Go
const paxUid = "uid"
```

Keywords for PAX extended header records. 

### <a id="paxGid" href="#paxGid">const paxGid</a>

```
searchKey: tar.paxGid
```

```Go
const paxGid = "gid"
```

Keywords for PAX extended header records. 

### <a id="paxUname" href="#paxUname">const paxUname</a>

```
searchKey: tar.paxUname
```

```Go
const paxUname = "uname"
```

Keywords for PAX extended header records. 

### <a id="paxGname" href="#paxGname">const paxGname</a>

```
searchKey: tar.paxGname
```

```Go
const paxGname = "gname"
```

Keywords for PAX extended header records. 

### <a id="paxMtime" href="#paxMtime">const paxMtime</a>

```
searchKey: tar.paxMtime
```

```Go
const paxMtime = "mtime"
```

Keywords for PAX extended header records. 

### <a id="paxAtime" href="#paxAtime">const paxAtime</a>

```
searchKey: tar.paxAtime
```

```Go
const paxAtime = "atime"
```

Keywords for PAX extended header records. 

### <a id="paxCtime" href="#paxCtime">const paxCtime</a>

```
searchKey: tar.paxCtime
```

```Go
const paxCtime = "ctime" // Removed from later revision of PAX spec, but was valid

```

Keywords for PAX extended header records. 

### <a id="paxCharset" href="#paxCharset">const paxCharset</a>

```
searchKey: tar.paxCharset
```

```Go
const paxCharset = "charset" // Currently unused

```

Keywords for PAX extended header records. 

### <a id="paxComment" href="#paxComment">const paxComment</a>

```
searchKey: tar.paxComment
```

```Go
const paxComment = "comment" // Currently unused

```

Keywords for PAX extended header records. 

### <a id="paxSchilyXattr" href="#paxSchilyXattr">const paxSchilyXattr</a>

```
searchKey: tar.paxSchilyXattr
```

```Go
const paxSchilyXattr = "SCHILY.xattr."
```

Keywords for PAX extended header records. 

### <a id="paxGNUSparse" href="#paxGNUSparse">const paxGNUSparse</a>

```
searchKey: tar.paxGNUSparse
```

```Go
const paxGNUSparse = "GNU.sparse."
```

Keywords for PAX extended header records. 

Keywords for GNU sparse files in a PAX extended header. 

### <a id="paxGNUSparseNumBlocks" href="#paxGNUSparseNumBlocks">const paxGNUSparseNumBlocks</a>

```
searchKey: tar.paxGNUSparseNumBlocks
```

```Go
const paxGNUSparseNumBlocks = "GNU.sparse.numblocks"
```

Keywords for PAX extended header records. 

### <a id="paxGNUSparseOffset" href="#paxGNUSparseOffset">const paxGNUSparseOffset</a>

```
searchKey: tar.paxGNUSparseOffset
```

```Go
const paxGNUSparseOffset = "GNU.sparse.offset"
```

Keywords for PAX extended header records. 

### <a id="paxGNUSparseNumBytes" href="#paxGNUSparseNumBytes">const paxGNUSparseNumBytes</a>

```
searchKey: tar.paxGNUSparseNumBytes
```

```Go
const paxGNUSparseNumBytes = "GNU.sparse.numbytes"
```

Keywords for PAX extended header records. 

### <a id="paxGNUSparseMap" href="#paxGNUSparseMap">const paxGNUSparseMap</a>

```
searchKey: tar.paxGNUSparseMap
```

```Go
const paxGNUSparseMap = "GNU.sparse.map"
```

Keywords for PAX extended header records. 

### <a id="paxGNUSparseName" href="#paxGNUSparseName">const paxGNUSparseName</a>

```
searchKey: tar.paxGNUSparseName
```

```Go
const paxGNUSparseName = "GNU.sparse.name"
```

Keywords for PAX extended header records. 

### <a id="paxGNUSparseMajor" href="#paxGNUSparseMajor">const paxGNUSparseMajor</a>

```
searchKey: tar.paxGNUSparseMajor
```

```Go
const paxGNUSparseMajor = "GNU.sparse.major"
```

Keywords for PAX extended header records. 

### <a id="paxGNUSparseMinor" href="#paxGNUSparseMinor">const paxGNUSparseMinor</a>

```
searchKey: tar.paxGNUSparseMinor
```

```Go
const paxGNUSparseMinor = "GNU.sparse.minor"
```

Keywords for PAX extended header records. 

### <a id="paxGNUSparseSize" href="#paxGNUSparseSize">const paxGNUSparseSize</a>

```
searchKey: tar.paxGNUSparseSize
```

```Go
const paxGNUSparseSize = "GNU.sparse.size"
```

Keywords for PAX extended header records. 

### <a id="paxGNUSparseRealSize" href="#paxGNUSparseRealSize">const paxGNUSparseRealSize</a>

```
searchKey: tar.paxGNUSparseRealSize
```

```Go
const paxGNUSparseRealSize = "GNU.sparse.realsize"
```

Keywords for PAX extended header records. 

### <a id="c_ISUID" href="#c_ISUID">const c_ISUID</a>

```
searchKey: tar.c_ISUID
```

```Go
const c_ISUID = 04000 // Set uid

```

Mode constants from the USTAR spec: See [http://pubs.opengroup.org/onlinepubs/9699919799/utilities/pax.html#tag_20_92_13_06](http://pubs.opengroup.org/onlinepubs/9699919799/utilities/pax.html#tag_20_92_13_06) 

### <a id="c_ISGID" href="#c_ISGID">const c_ISGID</a>

```
searchKey: tar.c_ISGID
```

```Go
const c_ISGID = 02000 // Set gid

```

### <a id="c_ISVTX" href="#c_ISVTX">const c_ISVTX</a>

```
searchKey: tar.c_ISVTX
```

```Go
const c_ISVTX = 01000 // Save text (sticky bit)

```

### <a id="c_ISDIR" href="#c_ISDIR">const c_ISDIR</a>

```
searchKey: tar.c_ISDIR
```

```Go
const c_ISDIR = 040000 // Directory

```

Common Unix mode constants; these are not defined in any common tar standard. Header.FileInfo understands these, but FileInfoHeader will never produce these. 

### <a id="c_ISFIFO" href="#c_ISFIFO">const c_ISFIFO</a>

```
searchKey: tar.c_ISFIFO
```

```Go
const c_ISFIFO = 010000 // FIFO

```

### <a id="c_ISREG" href="#c_ISREG">const c_ISREG</a>

```
searchKey: tar.c_ISREG
```

```Go
const c_ISREG = 0100000 // Regular file

```

### <a id="c_ISLNK" href="#c_ISLNK">const c_ISLNK</a>

```
searchKey: tar.c_ISLNK
```

```Go
const c_ISLNK = 0120000 // Symbolic link

```

### <a id="c_ISBLK" href="#c_ISBLK">const c_ISBLK</a>

```
searchKey: tar.c_ISBLK
```

```Go
const c_ISBLK = 060000 // Block special file

```

### <a id="c_ISCHR" href="#c_ISCHR">const c_ISCHR</a>

```
searchKey: tar.c_ISCHR
```

```Go
const c_ISCHR = 020000 // Character special file

```

### <a id="c_ISSOCK" href="#c_ISSOCK">const c_ISSOCK</a>

```
searchKey: tar.c_ISSOCK
```

```Go
const c_ISSOCK = 0140000 // Socket

```

### <a id="FormatUnknown" href="#FormatUnknown">const FormatUnknown</a>

```
searchKey: tar.FormatUnknown
tags: [exported]
```

```Go
const FormatUnknown
```

Constants to identify various tar formats. 

FormatUnknown indicates that the format is unknown. 

### <a id="formatV7" href="#formatV7">const formatV7</a>

```
searchKey: tar.formatV7
```

```Go
const formatV7
```

Constants to identify various tar formats. 

The format of the original Unix V7 tar tool prior to standardization. 

### <a id="FormatUSTAR" href="#FormatUSTAR">const FormatUSTAR</a>

```
searchKey: tar.FormatUSTAR
tags: [exported]
```

```Go
const FormatUSTAR
```

Constants to identify various tar formats. 

FormatUSTAR represents the USTAR header format defined in POSIX.1-1988. 

While this format is compatible with most tar readers, the format has several limitations making it unsuitable for some usages. Most notably, it cannot support sparse files, files larger than 8GiB, filenames larger than 256 characters, and non-ASCII filenames. 

Reference: 

```
[http://pubs.opengroup.org/onlinepubs/9699919799/utilities/pax.html#tag_20_92_13_06](http://pubs.opengroup.org/onlinepubs/9699919799/utilities/pax.html#tag_20_92_13_06)

```
### <a id="FormatPAX" href="#FormatPAX">const FormatPAX</a>

```
searchKey: tar.FormatPAX
tags: [exported]
```

```Go
const FormatPAX
```

Constants to identify various tar formats. 

FormatPAX represents the PAX header format defined in POSIX.1-2001. 

PAX extends USTAR by writing a special file with Typeflag TypeXHeader preceding the original header. This file contains a set of key-value records, which are used to overcome USTAR's shortcomings, in addition to providing the ability to have sub-second resolution for timestamps. 

Some newer formats add their own extensions to PAX by defining their own keys and assigning certain semantic meaning to the associated values. For example, sparse file support in PAX is implemented using keys defined by the GNU manual (e.g., "GNU.sparse.map"). 

Reference: 

```
[http://pubs.opengroup.org/onlinepubs/009695399/utilities/pax.html](http://pubs.opengroup.org/onlinepubs/009695399/utilities/pax.html)

```
### <a id="FormatGNU" href="#FormatGNU">const FormatGNU</a>

```
searchKey: tar.FormatGNU
tags: [exported]
```

```Go
const FormatGNU
```

Constants to identify various tar formats. 

FormatGNU represents the GNU header format. 

The GNU header format is older than the USTAR and PAX standards and is not compatible with them. The GNU format supports arbitrary file sizes, filenames of arbitrary encoding and length, sparse files, and other features. 

It is recommended that PAX be chosen over GNU unless the target application can only parse GNU formatted archives. 

Reference: 

```
[https://www.gnu.org/software/tar/manual/html_node/Standard.html](https://www.gnu.org/software/tar/manual/html_node/Standard.html)

```
### <a id="formatSTAR" href="#formatSTAR">const formatSTAR</a>

```
searchKey: tar.formatSTAR
```

```Go
const formatSTAR
```

Constants to identify various tar formats. 

Schily's tar format, which is incompatible with USTAR. This does not cover STAR extensions to the PAX format; these fall under the PAX format. 

### <a id="formatMax" href="#formatMax">const formatMax</a>

```
searchKey: tar.formatMax
```

```Go
const formatMax
```

Constants to identify various tar formats. 

### <a id="magicGNU" href="#magicGNU">const magicGNU</a>

```
searchKey: tar.magicGNU
```

```Go
const magicGNU, versionGNU = "ustar ", " \x00"
```

Magics used to identify various formats. 

### <a id="versionGNU" href="#versionGNU">const versionGNU</a>

```
searchKey: tar.versionGNU
```

```Go
const magicGNU, versionGNU = "ustar ", " \x00"
```

Magics used to identify various formats. 

### <a id="magicUSTAR" href="#magicUSTAR">const magicUSTAR</a>

```
searchKey: tar.magicUSTAR
```

```Go
const magicUSTAR, versionUSTAR = "ustar\x00", "00"
```

Magics used to identify various formats. 

### <a id="versionUSTAR" href="#versionUSTAR">const versionUSTAR</a>

```
searchKey: tar.versionUSTAR
```

```Go
const magicUSTAR, versionUSTAR = "ustar\x00", "00"
```

Magics used to identify various formats. 

### <a id="trailerSTAR" href="#trailerSTAR">const trailerSTAR</a>

```
searchKey: tar.trailerSTAR
```

```Go
const trailerSTAR = "tar\x00"
```

Magics used to identify various formats. 

### <a id="blockSize" href="#blockSize">const blockSize</a>

```
searchKey: tar.blockSize
```

```Go
const blockSize = 512 // Size of each block in a tar stream

```

Size constants from various tar specifications. 

### <a id="nameSize" href="#nameSize">const nameSize</a>

```
searchKey: tar.nameSize
```

```Go
const nameSize = 100 // Max length of the name field in USTAR format

```

Size constants from various tar specifications. 

### <a id="prefixSize" href="#prefixSize">const prefixSize</a>

```
searchKey: tar.prefixSize
```

```Go
const prefixSize = 155 // Max length of the prefix field in USTAR format

```

Size constants from various tar specifications. 

## <a id="var" href="#var">Variables</a>

```
tags: [exported]
```

### <a id="ErrHeader" href="#ErrHeader">var ErrHeader</a>

```
searchKey: tar.ErrHeader
tags: [exported]
```

```Go
var ErrHeader = errors.New("archive/tar: invalid tar header")
```

### <a id="ErrWriteTooLong" href="#ErrWriteTooLong">var ErrWriteTooLong</a>

```
searchKey: tar.ErrWriteTooLong
tags: [exported]
```

```Go
var ErrWriteTooLong = errors.New("archive/tar: write too long")
```

### <a id="ErrFieldTooLong" href="#ErrFieldTooLong">var ErrFieldTooLong</a>

```
searchKey: tar.ErrFieldTooLong
tags: [exported]
```

```Go
var ErrFieldTooLong = errors.New("archive/tar: header field too long")
```

### <a id="ErrWriteAfterClose" href="#ErrWriteAfterClose">var ErrWriteAfterClose</a>

```
searchKey: tar.ErrWriteAfterClose
tags: [exported]
```

```Go
var ErrWriteAfterClose = errors.New("archive/tar: write after close")
```

### <a id="errMissData" href="#errMissData">var errMissData</a>

```
searchKey: tar.errMissData
```

```Go
var errMissData = errors.New("archive/tar: sparse file references non-existent data")
```

### <a id="errUnrefData" href="#errUnrefData">var errUnrefData</a>

```
searchKey: tar.errUnrefData
```

```Go
var errUnrefData = errors.New("archive/tar: sparse file contains unreferenced data")
```

### <a id="errWriteHole" href="#errWriteHole">var errWriteHole</a>

```
searchKey: tar.errWriteHole
```

```Go
var errWriteHole = errors.New("archive/tar: write non-NUL byte in sparse hole")
```

### <a id="basicKeys" href="#basicKeys">var basicKeys</a>

```
searchKey: tar.basicKeys
```

```Go
var basicKeys = ...
```

basicKeys is a set of the PAX keys for which we have built-in support. This does not contain "charset" or "comment", which are both PAX-specific, so adding them as first-class features of Header is unlikely. Users can use the PAXRecords field to set it themselves. 

### <a id="sysStat" href="#sysStat">var sysStat</a>

```
searchKey: tar.sysStat
```

```Go
var sysStat func(fi fs.FileInfo, h *Header) error
```

sysStat, if non-nil, populates h from system-dependent fields of fi. 

### <a id="formatNames" href="#formatNames">var formatNames</a>

```
searchKey: tar.formatNames
```

```Go
var formatNames = ...
```

### <a id="zeroBlock" href="#zeroBlock">var zeroBlock</a>

```
searchKey: tar.zeroBlock
```

```Go
var zeroBlock block
```

### <a id="userMap" href="#userMap">var userMap</a>

```
searchKey: tar.userMap
```

```Go
var userMap, groupMap sync.Map // map[int]string

```

userMap and groupMap caches UID and GID lookups for performance reasons. The downside is that renaming uname or gname by the OS never takes effect. 

### <a id="groupMap" href="#groupMap">var groupMap</a>

```
searchKey: tar.groupMap
```

```Go
var userMap, groupMap sync.Map // map[int]string

```

userMap and groupMap caches UID and GID lookups for performance reasons. The downside is that renaming uname or gname by the OS never takes effect. 

## <a id="type" href="#type">Types</a>

```
tags: [exported]
```

### <a id="headerError" href="#headerError">type headerError []string</a>

```
searchKey: tar.headerError
```

```Go
type headerError []string
```

#### <a id="headerError.Error" href="#headerError.Error">func (he headerError) Error() string</a>

```
searchKey: tar.headerError.Error
```

```Go
func (he headerError) Error() string
```

### <a id="Header" href="#Header">type Header struct</a>

```
searchKey: tar.Header
tags: [exported]
```

```Go
type Header struct {
	// Typeflag is the type of header entry.
	// The zero value is automatically promoted to either TypeReg or TypeDir
	// depending on the presence of a trailing slash in Name.
	Typeflag byte

	Name     string // Name of file entry
	Linkname string // Target name of link (valid for TypeLink or TypeSymlink)

	Size  int64  // Logical file size in bytes
	Mode  int64  // Permission and mode bits
	Uid   int    // User ID of owner
	Gid   int    // Group ID of owner
	Uname string // User name of owner
	Gname string // Group name of owner

	// If the Format is unspecified, then Writer.WriteHeader rounds ModTime
	// to the nearest second and ignores the AccessTime and ChangeTime fields.
	//
	// To use AccessTime or ChangeTime, specify the Format as PAX or GNU.
	// To use sub-second resolution, specify the Format as PAX.
	ModTime    time.Time // Modification time
	AccessTime time.Time // Access time (requires either PAX or GNU support)
	ChangeTime time.Time // Change time (requires either PAX or GNU support)

	Devmajor int64 // Major device number (valid for TypeChar or TypeBlock)
	Devminor int64 // Minor device number (valid for TypeChar or TypeBlock)

	// Xattrs stores extended attributes as PAX records under the
	// "SCHILY.xattr." namespace.
	//
	// The following are semantically equivalent:
	//  h.Xattrs[key] = value
	//  h.PAXRecords["SCHILY.xattr."+key] = value
	//
	// When Writer.WriteHeader is called, the contents of Xattrs will take
	// precedence over those in PAXRecords.
	//
	// Deprecated: Use PAXRecords instead.
	Xattrs map[string]string

	// PAXRecords is a map of PAX extended header records.
	//
	// User-defined records should have keys of the following form:
	//	VENDOR.keyword
	// Where VENDOR is some namespace in all uppercase, and keyword may
	// not contain the '=' character (e.g., "GOLANG.pkg.version").
	// The key and value should be non-empty UTF-8 strings.
	//
	// When Writer.WriteHeader is called, PAX records derived from the
	// other fields in Header take precedence over PAXRecords.
	PAXRecords map[string]string

	// Format specifies the format of the tar header.
	//
	// This is set by Reader.Next as a best-effort guess at the format.
	// Since the Reader liberally reads some non-compliant files,
	// it is possible for this to be FormatUnknown.
	//
	// If the format is unspecified when Writer.WriteHeader is called,
	// then it uses the first format (in the order of USTAR, PAX, GNU)
	// capable of encoding this Header (see Format).
	Format Format
}
```

A Header represents a single header in a tar archive. Some fields may not be populated. 

For forward compatibility, users that retrieve a Header from Reader.Next, mutate it in some ways, and then pass it back to Writer.WriteHeader should do so by creating a new Header and copying the fields that they are interested in preserving. 

#### <a id="FileInfoHeader" href="#FileInfoHeader">func FileInfoHeader(fi fs.FileInfo, link string) (*Header, error)</a>

```
searchKey: tar.FileInfoHeader
tags: [exported]
```

```Go
func FileInfoHeader(fi fs.FileInfo, link string) (*Header, error)
```

FileInfoHeader creates a partially-populated Header from fi. If fi describes a symlink, FileInfoHeader records link as the link target. If fi describes a directory, a slash is appended to the name. 

Since fs.FileInfo's Name method only returns the base name of the file it describes, it may be necessary to modify Header.Name to provide the full path name of the file. 

#### <a id="Header.allowedFormats" href="#Header.allowedFormats">func (h Header) allowedFormats() (format Format, paxHdrs map[string]string, err error)</a>

```
searchKey: tar.Header.allowedFormats
```

```Go
func (h Header) allowedFormats() (format Format, paxHdrs map[string]string, err error)
```

allowedFormats determines which formats can be used. The value returned is the logical OR of multiple possible formats. If the value is FormatUnknown, then the input Header cannot be encoded and an error is returned explaining why. 

As a by-product of checking the fields, this function returns paxHdrs, which contain all fields that could not be directly encoded. A value receiver ensures that this method does not mutate the source Header. 

#### <a id="Header.FileInfo" href="#Header.FileInfo">func (h *Header) FileInfo() fs.FileInfo</a>

```
searchKey: tar.Header.FileInfo
tags: [exported]
```

```Go
func (h *Header) FileInfo() fs.FileInfo
```

FileInfo returns an fs.FileInfo for the Header. 

### <a id="sparseEntry" href="#sparseEntry">type sparseEntry struct</a>

```
searchKey: tar.sparseEntry
```

```Go
type sparseEntry struct{ Offset, Length int64 }
```

sparseEntry represents a Length-sized fragment at Offset in the file. 

#### <a id="sparseEntry.endOffset" href="#sparseEntry.endOffset">func (s sparseEntry) endOffset() int64</a>

```
searchKey: tar.sparseEntry.endOffset
```

```Go
func (s sparseEntry) endOffset() int64
```

### <a id="sparseDatas" href="#sparseDatas">type sparseDatas []tar.sparseEntry</a>

```
searchKey: tar.sparseDatas
```

```Go
type sparseDatas []sparseEntry
```

A sparse file can be represented as either a sparseDatas or a sparseHoles. As long as the total size is known, they are equivalent and one can be converted to the other form and back. The various tar formats with sparse file support represent sparse files in the sparseDatas form. That is, they specify the fragments in the file that has data, and treat everything else as having zero bytes. As such, the encoding and decoding logic in this package deals with sparseDatas. 

However, the external API uses sparseHoles instead of sparseDatas because the zero value of sparseHoles logically represents a normal file (i.e., there are no holes in it). On the other hand, the zero value of sparseDatas implies that the file has no data in it, which is rather odd. 

As an example, if the underlying raw file contains the 10-byte data: 

```
var compactFile = "abcdefgh"

```
And the sparse map has the following entries: 

```
var spd sparseDatas = []sparseEntry{
	{Offset: 2,  Length: 5},  // Data fragment for 2..6
	{Offset: 18, Length: 3},  // Data fragment for 18..20
}
var sph sparseHoles = []sparseEntry{
	{Offset: 0,  Length: 2},  // Hole fragment for 0..1
	{Offset: 7,  Length: 11}, // Hole fragment for 7..17
	{Offset: 21, Length: 4},  // Hole fragment for 21..24
}

```
Then the content of the resulting sparse file with a Header.Size of 25 is: 

```
var sparseFile = "\x00"*2 + "abcde" + "\x00"*11 + "fgh" + "\x00"*4

```
#### <a id="readGNUSparseMap1x0" href="#readGNUSparseMap1x0">func readGNUSparseMap1x0(r io.Reader) (sparseDatas, error)</a>

```
searchKey: tar.readGNUSparseMap1x0
```

```Go
func readGNUSparseMap1x0(r io.Reader) (sparseDatas, error)
```

readGNUSparseMap1x0 reads the sparse map as stored in GNU's PAX sparse format version 1.0. The format of the sparse map consists of a series of newline-terminated numeric fields. The first field is the number of entries and is always present. Following this are the entries, consisting of two fields (offset, length). This function must stop reading at the end boundary of the block containing the last newline. 

Note that the GNU manual says that numeric values should be encoded in octal format. However, the GNU tar utility itself outputs these values in decimal. As such, this library treats values as being encoded in decimal. 

#### <a id="readGNUSparseMap0x1" href="#readGNUSparseMap0x1">func readGNUSparseMap0x1(paxHdrs map[string]string) (sparseDatas, error)</a>

```
searchKey: tar.readGNUSparseMap0x1
```

```Go
func readGNUSparseMap0x1(paxHdrs map[string]string) (sparseDatas, error)
```

readGNUSparseMap0x1 reads the sparse map as stored in GNU's PAX sparse format version 0.1. The sparse map is stored in the PAX headers. 

### <a id="sparseHoles" href="#sparseHoles">type sparseHoles []tar.sparseEntry</a>

```
searchKey: tar.sparseHoles
```

```Go
type sparseHoles []sparseEntry
```

A sparse file can be represented as either a sparseDatas or a sparseHoles. As long as the total size is known, they are equivalent and one can be converted to the other form and back. The various tar formats with sparse file support represent sparse files in the sparseDatas form. That is, they specify the fragments in the file that has data, and treat everything else as having zero bytes. As such, the encoding and decoding logic in this package deals with sparseDatas. 

However, the external API uses sparseHoles instead of sparseDatas because the zero value of sparseHoles logically represents a normal file (i.e., there are no holes in it). On the other hand, the zero value of sparseDatas implies that the file has no data in it, which is rather odd. 

As an example, if the underlying raw file contains the 10-byte data: 

```
var compactFile = "abcdefgh"

```
And the sparse map has the following entries: 

```
var spd sparseDatas = []sparseEntry{
	{Offset: 2,  Length: 5},  // Data fragment for 2..6
	{Offset: 18, Length: 3},  // Data fragment for 18..20
}
var sph sparseHoles = []sparseEntry{
	{Offset: 0,  Length: 2},  // Hole fragment for 0..1
	{Offset: 7,  Length: 11}, // Hole fragment for 7..17
	{Offset: 21, Length: 4},  // Hole fragment for 21..24
}

```
Then the content of the resulting sparse file with a Header.Size of 25 is: 

```
var sparseFile = "\x00"*2 + "abcde" + "\x00"*11 + "fgh" + "\x00"*4

```
### <a id="fileState" href="#fileState">type fileState interface</a>

```
searchKey: tar.fileState
```

```Go
type fileState interface {
	LogicalRemaining() int64
	PhysicalRemaining() int64
}
```

fileState tracks the number of logical (includes sparse holes) and physical (actual in tar archive) bytes remaining for the current file. 

Invariant: LogicalRemaining >= PhysicalRemaining 

### <a id="headerFileInfo" href="#headerFileInfo">type headerFileInfo struct</a>

```
searchKey: tar.headerFileInfo
```

```Go
type headerFileInfo struct {
	h *Header
}
```

headerFileInfo implements fs.FileInfo. 

#### <a id="headerFileInfo.Size" href="#headerFileInfo.Size">func (fi headerFileInfo) Size() int64</a>

```
searchKey: tar.headerFileInfo.Size
```

```Go
func (fi headerFileInfo) Size() int64
```

#### <a id="headerFileInfo.IsDir" href="#headerFileInfo.IsDir">func (fi headerFileInfo) IsDir() bool</a>

```
searchKey: tar.headerFileInfo.IsDir
```

```Go
func (fi headerFileInfo) IsDir() bool
```

#### <a id="headerFileInfo.ModTime" href="#headerFileInfo.ModTime">func (fi headerFileInfo) ModTime() time.Time</a>

```
searchKey: tar.headerFileInfo.ModTime
```

```Go
func (fi headerFileInfo) ModTime() time.Time
```

#### <a id="headerFileInfo.Sys" href="#headerFileInfo.Sys">func (fi headerFileInfo) Sys() interface{}</a>

```
searchKey: tar.headerFileInfo.Sys
```

```Go
func (fi headerFileInfo) Sys() interface{}
```

#### <a id="headerFileInfo.Name" href="#headerFileInfo.Name">func (fi headerFileInfo) Name() string</a>

```
searchKey: tar.headerFileInfo.Name
```

```Go
func (fi headerFileInfo) Name() string
```

Name returns the base name of the file. 

#### <a id="headerFileInfo.Mode" href="#headerFileInfo.Mode">func (fi headerFileInfo) Mode() (mode fs.FileMode)</a>

```
searchKey: tar.headerFileInfo.Mode
```

```Go
func (fi headerFileInfo) Mode() (mode fs.FileMode)
```

Mode returns the permission and mode bits for the headerFileInfo. 

### <a id="Format" href="#Format">type Format int</a>

```
searchKey: tar.Format
tags: [exported]
```

```Go
type Format int
```

Format represents the tar archive format. 

The original tar format was introduced in Unix V7. Since then, there have been multiple competing formats attempting to standardize or extend the V7 format to overcome its limitations. The most common formats are the USTAR, PAX, and GNU formats, each with their own advantages and limitations. 

The following table captures the capabilities of each format: 

```
                  |  USTAR |       PAX |       GNU
------------------+--------+-----------+----------
Name              |   256B | unlimited | unlimited
Linkname          |   100B | unlimited | unlimited
Size              | uint33 | unlimited |    uint89
Mode              | uint21 |    uint21 |    uint57
Uid/Gid           | uint21 | unlimited |    uint57
Uname/Gname       |    32B | unlimited |       32B
ModTime           | uint33 | unlimited |     int89
AccessTime        |    n/a | unlimited |     int89
ChangeTime        |    n/a | unlimited |     int89
Devmajor/Devminor | uint21 |    uint21 |    uint57
------------------+--------+-----------+----------
string encoding   |  ASCII |     UTF-8 |    binary
sub-second times  |     no |       yes |        no
sparse files      |     no |       yes |       yes

```
The table's upper portion shows the Header fields, where each format reports the maximum number of bytes allowed for each string field and the integer type used to store each numeric field (where timestamps are stored as the number of seconds since the Unix epoch). 

The table's lower portion shows specialized features of each format, such as supported string encodings, support for sub-second timestamps, or support for sparse files. 

The Writer currently provides no support for sparse files. 

#### <a id="Format.has" href="#Format.has">func (f Format) has(f2 Format) bool</a>

```
searchKey: tar.Format.has
```

```Go
func (f Format) has(f2 Format) bool
```

#### <a id="Format.mayBe" href="#Format.mayBe">func (f *Format) mayBe(f2 Format)</a>

```
searchKey: tar.Format.mayBe
```

```Go
func (f *Format) mayBe(f2 Format)
```

#### <a id="Format.mayOnlyBe" href="#Format.mayOnlyBe">func (f *Format) mayOnlyBe(f2 Format)</a>

```
searchKey: tar.Format.mayOnlyBe
```

```Go
func (f *Format) mayOnlyBe(f2 Format)
```

#### <a id="Format.mustNotBe" href="#Format.mustNotBe">func (f *Format) mustNotBe(f2 Format)</a>

```
searchKey: tar.Format.mustNotBe
```

```Go
func (f *Format) mustNotBe(f2 Format)
```

#### <a id="Format.String" href="#Format.String">func (f Format) String() string</a>

```
searchKey: tar.Format.String
tags: [exported]
```

```Go
func (f Format) String() string
```

### <a id="block" href="#block">type block [512]byte</a>

```
searchKey: tar.block
```

```Go
type block [blockSize]byte
```

#### <a id="block.V7" href="#block.V7">func (b *block) V7() *headerV7</a>

```
searchKey: tar.block.V7
```

```Go
func (b *block) V7() *headerV7
```

Convert block to any number of formats. 

#### <a id="block.GNU" href="#block.GNU">func (b *block) GNU() *headerGNU</a>

```
searchKey: tar.block.GNU
```

```Go
func (b *block) GNU() *headerGNU
```

#### <a id="block.STAR" href="#block.STAR">func (b *block) STAR() *headerSTAR</a>

```
searchKey: tar.block.STAR
```

```Go
func (b *block) STAR() *headerSTAR
```

#### <a id="block.USTAR" href="#block.USTAR">func (b *block) USTAR() *headerUSTAR</a>

```
searchKey: tar.block.USTAR
```

```Go
func (b *block) USTAR() *headerUSTAR
```

#### <a id="block.Sparse" href="#block.Sparse">func (b *block) Sparse() sparseArray</a>

```
searchKey: tar.block.Sparse
```

```Go
func (b *block) Sparse() sparseArray
```

#### <a id="block.GetFormat" href="#block.GetFormat">func (b *block) GetFormat() Format</a>

```
searchKey: tar.block.GetFormat
```

```Go
func (b *block) GetFormat() Format
```

GetFormat checks that the block is a valid tar header based on the checksum. It then attempts to guess the specific format based on magic values. If the checksum fails, then FormatUnknown is returned. 

#### <a id="block.SetFormat" href="#block.SetFormat">func (b *block) SetFormat(format Format)</a>

```
searchKey: tar.block.SetFormat
```

```Go
func (b *block) SetFormat(format Format)
```

SetFormat writes the magic values necessary for specified format and then updates the checksum accordingly. 

#### <a id="block.ComputeChecksum" href="#block.ComputeChecksum">func (b *block) ComputeChecksum() (unsigned, signed int64)</a>

```
searchKey: tar.block.ComputeChecksum
```

```Go
func (b *block) ComputeChecksum() (unsigned, signed int64)
```

ComputeChecksum computes the checksum for the header block. POSIX specifies a sum of the unsigned byte values, but the Sun tar used signed byte values. We compute and return both. 

#### <a id="block.Reset" href="#block.Reset">func (b *block) Reset()</a>

```
searchKey: tar.block.Reset
```

```Go
func (b *block) Reset()
```

Reset clears the block with all zeros. 

### <a id="headerV7" href="#headerV7">type headerV7 [512]byte</a>

```
searchKey: tar.headerV7
```

```Go
type headerV7 [blockSize]byte
```

#### <a id="headerV7.Name" href="#headerV7.Name">func (h *headerV7) Name() []byte</a>

```
searchKey: tar.headerV7.Name
```

```Go
func (h *headerV7) Name() []byte
```

#### <a id="headerV7.Mode" href="#headerV7.Mode">func (h *headerV7) Mode() []byte</a>

```
searchKey: tar.headerV7.Mode
```

```Go
func (h *headerV7) Mode() []byte
```

#### <a id="headerV7.UID" href="#headerV7.UID">func (h *headerV7) UID() []byte</a>

```
searchKey: tar.headerV7.UID
```

```Go
func (h *headerV7) UID() []byte
```

#### <a id="headerV7.GID" href="#headerV7.GID">func (h *headerV7) GID() []byte</a>

```
searchKey: tar.headerV7.GID
```

```Go
func (h *headerV7) GID() []byte
```

#### <a id="headerV7.Size" href="#headerV7.Size">func (h *headerV7) Size() []byte</a>

```
searchKey: tar.headerV7.Size
```

```Go
func (h *headerV7) Size() []byte
```

#### <a id="headerV7.ModTime" href="#headerV7.ModTime">func (h *headerV7) ModTime() []byte</a>

```
searchKey: tar.headerV7.ModTime
```

```Go
func (h *headerV7) ModTime() []byte
```

#### <a id="headerV7.Chksum" href="#headerV7.Chksum">func (h *headerV7) Chksum() []byte</a>

```
searchKey: tar.headerV7.Chksum
```

```Go
func (h *headerV7) Chksum() []byte
```

#### <a id="headerV7.TypeFlag" href="#headerV7.TypeFlag">func (h *headerV7) TypeFlag() []byte</a>

```
searchKey: tar.headerV7.TypeFlag
```

```Go
func (h *headerV7) TypeFlag() []byte
```

#### <a id="headerV7.LinkName" href="#headerV7.LinkName">func (h *headerV7) LinkName() []byte</a>

```
searchKey: tar.headerV7.LinkName
```

```Go
func (h *headerV7) LinkName() []byte
```

### <a id="headerGNU" href="#headerGNU">type headerGNU [512]byte</a>

```
searchKey: tar.headerGNU
```

```Go
type headerGNU [blockSize]byte
```

#### <a id="headerGNU.V7" href="#headerGNU.V7">func (h *headerGNU) V7() *headerV7</a>

```
searchKey: tar.headerGNU.V7
```

```Go
func (h *headerGNU) V7() *headerV7
```

#### <a id="headerGNU.Magic" href="#headerGNU.Magic">func (h *headerGNU) Magic() []byte</a>

```
searchKey: tar.headerGNU.Magic
```

```Go
func (h *headerGNU) Magic() []byte
```

#### <a id="headerGNU.Version" href="#headerGNU.Version">func (h *headerGNU) Version() []byte</a>

```
searchKey: tar.headerGNU.Version
```

```Go
func (h *headerGNU) Version() []byte
```

#### <a id="headerGNU.UserName" href="#headerGNU.UserName">func (h *headerGNU) UserName() []byte</a>

```
searchKey: tar.headerGNU.UserName
```

```Go
func (h *headerGNU) UserName() []byte
```

#### <a id="headerGNU.GroupName" href="#headerGNU.GroupName">func (h *headerGNU) GroupName() []byte</a>

```
searchKey: tar.headerGNU.GroupName
```

```Go
func (h *headerGNU) GroupName() []byte
```

#### <a id="headerGNU.DevMajor" href="#headerGNU.DevMajor">func (h *headerGNU) DevMajor() []byte</a>

```
searchKey: tar.headerGNU.DevMajor
```

```Go
func (h *headerGNU) DevMajor() []byte
```

#### <a id="headerGNU.DevMinor" href="#headerGNU.DevMinor">func (h *headerGNU) DevMinor() []byte</a>

```
searchKey: tar.headerGNU.DevMinor
```

```Go
func (h *headerGNU) DevMinor() []byte
```

#### <a id="headerGNU.AccessTime" href="#headerGNU.AccessTime">func (h *headerGNU) AccessTime() []byte</a>

```
searchKey: tar.headerGNU.AccessTime
```

```Go
func (h *headerGNU) AccessTime() []byte
```

#### <a id="headerGNU.ChangeTime" href="#headerGNU.ChangeTime">func (h *headerGNU) ChangeTime() []byte</a>

```
searchKey: tar.headerGNU.ChangeTime
```

```Go
func (h *headerGNU) ChangeTime() []byte
```

#### <a id="headerGNU.Sparse" href="#headerGNU.Sparse">func (h *headerGNU) Sparse() sparseArray</a>

```
searchKey: tar.headerGNU.Sparse
```

```Go
func (h *headerGNU) Sparse() sparseArray
```

#### <a id="headerGNU.RealSize" href="#headerGNU.RealSize">func (h *headerGNU) RealSize() []byte</a>

```
searchKey: tar.headerGNU.RealSize
```

```Go
func (h *headerGNU) RealSize() []byte
```

### <a id="headerSTAR" href="#headerSTAR">type headerSTAR [512]byte</a>

```
searchKey: tar.headerSTAR
```

```Go
type headerSTAR [blockSize]byte
```

#### <a id="headerSTAR.V7" href="#headerSTAR.V7">func (h *headerSTAR) V7() *headerV7</a>

```
searchKey: tar.headerSTAR.V7
```

```Go
func (h *headerSTAR) V7() *headerV7
```

#### <a id="headerSTAR.Magic" href="#headerSTAR.Magic">func (h *headerSTAR) Magic() []byte</a>

```
searchKey: tar.headerSTAR.Magic
```

```Go
func (h *headerSTAR) Magic() []byte
```

#### <a id="headerSTAR.Version" href="#headerSTAR.Version">func (h *headerSTAR) Version() []byte</a>

```
searchKey: tar.headerSTAR.Version
```

```Go
func (h *headerSTAR) Version() []byte
```

#### <a id="headerSTAR.UserName" href="#headerSTAR.UserName">func (h *headerSTAR) UserName() []byte</a>

```
searchKey: tar.headerSTAR.UserName
```

```Go
func (h *headerSTAR) UserName() []byte
```

#### <a id="headerSTAR.GroupName" href="#headerSTAR.GroupName">func (h *headerSTAR) GroupName() []byte</a>

```
searchKey: tar.headerSTAR.GroupName
```

```Go
func (h *headerSTAR) GroupName() []byte
```

#### <a id="headerSTAR.DevMajor" href="#headerSTAR.DevMajor">func (h *headerSTAR) DevMajor() []byte</a>

```
searchKey: tar.headerSTAR.DevMajor
```

```Go
func (h *headerSTAR) DevMajor() []byte
```

#### <a id="headerSTAR.DevMinor" href="#headerSTAR.DevMinor">func (h *headerSTAR) DevMinor() []byte</a>

```
searchKey: tar.headerSTAR.DevMinor
```

```Go
func (h *headerSTAR) DevMinor() []byte
```

#### <a id="headerSTAR.Prefix" href="#headerSTAR.Prefix">func (h *headerSTAR) Prefix() []byte</a>

```
searchKey: tar.headerSTAR.Prefix
```

```Go
func (h *headerSTAR) Prefix() []byte
```

#### <a id="headerSTAR.AccessTime" href="#headerSTAR.AccessTime">func (h *headerSTAR) AccessTime() []byte</a>

```
searchKey: tar.headerSTAR.AccessTime
```

```Go
func (h *headerSTAR) AccessTime() []byte
```

#### <a id="headerSTAR.ChangeTime" href="#headerSTAR.ChangeTime">func (h *headerSTAR) ChangeTime() []byte</a>

```
searchKey: tar.headerSTAR.ChangeTime
```

```Go
func (h *headerSTAR) ChangeTime() []byte
```

#### <a id="headerSTAR.Trailer" href="#headerSTAR.Trailer">func (h *headerSTAR) Trailer() []byte</a>

```
searchKey: tar.headerSTAR.Trailer
```

```Go
func (h *headerSTAR) Trailer() []byte
```

### <a id="headerUSTAR" href="#headerUSTAR">type headerUSTAR [512]byte</a>

```
searchKey: tar.headerUSTAR
```

```Go
type headerUSTAR [blockSize]byte
```

#### <a id="headerUSTAR.V7" href="#headerUSTAR.V7">func (h *headerUSTAR) V7() *headerV7</a>

```
searchKey: tar.headerUSTAR.V7
```

```Go
func (h *headerUSTAR) V7() *headerV7
```

#### <a id="headerUSTAR.Magic" href="#headerUSTAR.Magic">func (h *headerUSTAR) Magic() []byte</a>

```
searchKey: tar.headerUSTAR.Magic
```

```Go
func (h *headerUSTAR) Magic() []byte
```

#### <a id="headerUSTAR.Version" href="#headerUSTAR.Version">func (h *headerUSTAR) Version() []byte</a>

```
searchKey: tar.headerUSTAR.Version
```

```Go
func (h *headerUSTAR) Version() []byte
```

#### <a id="headerUSTAR.UserName" href="#headerUSTAR.UserName">func (h *headerUSTAR) UserName() []byte</a>

```
searchKey: tar.headerUSTAR.UserName
```

```Go
func (h *headerUSTAR) UserName() []byte
```

#### <a id="headerUSTAR.GroupName" href="#headerUSTAR.GroupName">func (h *headerUSTAR) GroupName() []byte</a>

```
searchKey: tar.headerUSTAR.GroupName
```

```Go
func (h *headerUSTAR) GroupName() []byte
```

#### <a id="headerUSTAR.DevMajor" href="#headerUSTAR.DevMajor">func (h *headerUSTAR) DevMajor() []byte</a>

```
searchKey: tar.headerUSTAR.DevMajor
```

```Go
func (h *headerUSTAR) DevMajor() []byte
```

#### <a id="headerUSTAR.DevMinor" href="#headerUSTAR.DevMinor">func (h *headerUSTAR) DevMinor() []byte</a>

```
searchKey: tar.headerUSTAR.DevMinor
```

```Go
func (h *headerUSTAR) DevMinor() []byte
```

#### <a id="headerUSTAR.Prefix" href="#headerUSTAR.Prefix">func (h *headerUSTAR) Prefix() []byte</a>

```
searchKey: tar.headerUSTAR.Prefix
```

```Go
func (h *headerUSTAR) Prefix() []byte
```

### <a id="sparseArray" href="#sparseArray">type sparseArray []byte</a>

```
searchKey: tar.sparseArray
```

```Go
type sparseArray []byte
```

#### <a id="sparseArray.Entry" href="#sparseArray.Entry">func (s sparseArray) Entry(i int) sparseElem</a>

```
searchKey: tar.sparseArray.Entry
```

```Go
func (s sparseArray) Entry(i int) sparseElem
```

#### <a id="sparseArray.IsExtended" href="#sparseArray.IsExtended">func (s sparseArray) IsExtended() []byte</a>

```
searchKey: tar.sparseArray.IsExtended
```

```Go
func (s sparseArray) IsExtended() []byte
```

#### <a id="sparseArray.MaxEntries" href="#sparseArray.MaxEntries">func (s sparseArray) MaxEntries() int</a>

```
searchKey: tar.sparseArray.MaxEntries
```

```Go
func (s sparseArray) MaxEntries() int
```

### <a id="sparseElem" href="#sparseElem">type sparseElem []byte</a>

```
searchKey: tar.sparseElem
```

```Go
type sparseElem []byte
```

#### <a id="sparseElem.Offset" href="#sparseElem.Offset">func (s sparseElem) Offset() []byte</a>

```
searchKey: tar.sparseElem.Offset
```

```Go
func (s sparseElem) Offset() []byte
```

#### <a id="sparseElem.Length" href="#sparseElem.Length">func (s sparseElem) Length() []byte</a>

```
searchKey: tar.sparseElem.Length
```

```Go
func (s sparseElem) Length() []byte
```

### <a id="Reader" href="#Reader">type Reader struct</a>

```
searchKey: tar.Reader
tags: [exported]
```

```Go
type Reader struct {
	r    io.Reader
	pad  int64      // Amount of padding (ignored) after current file entry
	curr fileReader // Reader for current file entry
	blk  block      // Buffer to use as temporary local storage

	// err is a persistent error.
	// It is only the responsibility of every exported method of Reader to
	// ensure that this error is sticky.
	err error
}
```

Reader provides sequential access to the contents of a tar archive. Reader.Next advances to the next file in the archive (including the first), and then Reader can be treated as an io.Reader to access the file's data. 

#### <a id="NewReader" href="#NewReader">func NewReader(r io.Reader) *Reader</a>

```
searchKey: tar.NewReader
tags: [exported]
```

```Go
func NewReader(r io.Reader) *Reader
```

NewReader creates a new Reader reading from r. 

#### <a id="Reader.Next" href="#Reader.Next">func (tr *Reader) Next() (*Header, error)</a>

```
searchKey: tar.Reader.Next
tags: [exported]
```

```Go
func (tr *Reader) Next() (*Header, error)
```

Next advances to the next entry in the tar archive. The Header.Size determines how many bytes can be read for the next file. Any remaining data in the current file is automatically discarded. 

io.EOF is returned at the end of the input. 

#### <a id="Reader.next" href="#Reader.next">func (tr *Reader) next() (*Header, error)</a>

```
searchKey: tar.Reader.next
```

```Go
func (tr *Reader) next() (*Header, error)
```

#### <a id="Reader.handleRegularFile" href="#Reader.handleRegularFile">func (tr *Reader) handleRegularFile(hdr *Header) error</a>

```
searchKey: tar.Reader.handleRegularFile
```

```Go
func (tr *Reader) handleRegularFile(hdr *Header) error
```

handleRegularFile sets up the current file reader and padding such that it can only read the following logical data section. It will properly handle special headers that contain no data section. 

#### <a id="Reader.handleSparseFile" href="#Reader.handleSparseFile">func (tr *Reader) handleSparseFile(hdr *Header, rawHdr *block) error</a>

```
searchKey: tar.Reader.handleSparseFile
```

```Go
func (tr *Reader) handleSparseFile(hdr *Header, rawHdr *block) error
```

handleSparseFile checks if the current file is a sparse format of any type and sets the curr reader appropriately. 

#### <a id="Reader.readGNUSparsePAXHeaders" href="#Reader.readGNUSparsePAXHeaders">func (tr *Reader) readGNUSparsePAXHeaders(hdr *Header) (sparseDatas, error)</a>

```
searchKey: tar.Reader.readGNUSparsePAXHeaders
```

```Go
func (tr *Reader) readGNUSparsePAXHeaders(hdr *Header) (sparseDatas, error)
```

readGNUSparsePAXHeaders checks the PAX headers for GNU sparse headers. If they are found, then this function reads the sparse map and returns it. This assumes that 0.0 headers have already been converted to 0.1 headers by the PAX header parsing logic. 

#### <a id="Reader.readHeader" href="#Reader.readHeader">func (tr *Reader) readHeader() (*Header, *block, error)</a>

```
searchKey: tar.Reader.readHeader
```

```Go
func (tr *Reader) readHeader() (*Header, *block, error)
```

readHeader reads the next block header and assumes that the underlying reader is already aligned to a block boundary. It returns the raw block of the header in case further processing is required. 

The err will be set to io.EOF only when one of the following occurs: 

```
* Exactly 0 bytes are read and EOF is hit.
* Exactly 1 block of zeros is read and EOF is hit.
* At least 2 blocks of zeros are read.

```
#### <a id="Reader.readOldGNUSparseMap" href="#Reader.readOldGNUSparseMap">func (tr *Reader) readOldGNUSparseMap(hdr *Header, blk *block) (sparseDatas, error)</a>

```
searchKey: tar.Reader.readOldGNUSparseMap
```

```Go
func (tr *Reader) readOldGNUSparseMap(hdr *Header, blk *block) (sparseDatas, error)
```

readOldGNUSparseMap reads the sparse map from the old GNU sparse format. The sparse map is stored in the tar header if it's small enough. If it's larger than four entries, then one or more extension headers are used to store the rest of the sparse map. 

The Header.Size does not reflect the size of any extended headers used. Thus, this function will read from the raw io.Reader to fetch extra headers. This method mutates blk in the process. 

#### <a id="Reader.Read" href="#Reader.Read">func (tr *Reader) Read(b []byte) (int, error)</a>

```
searchKey: tar.Reader.Read
tags: [exported]
```

```Go
func (tr *Reader) Read(b []byte) (int, error)
```

Read reads from the current file in the tar archive. It returns (0, io.EOF) when it reaches the end of that file, until Next is called to advance to the next file. 

If the current file is sparse, then the regions marked as a hole are read back as NUL-bytes. 

Calling Read on special types like TypeLink, TypeSymlink, TypeChar, TypeBlock, TypeDir, and TypeFifo returns (0, io.EOF) regardless of what the Header.Size claims. 

#### <a id="Reader.writeTo" href="#Reader.writeTo">func (tr *Reader) writeTo(w io.Writer) (int64, error)</a>

```
searchKey: tar.Reader.writeTo
```

```Go
func (tr *Reader) writeTo(w io.Writer) (int64, error)
```

writeTo writes the content of the current file to w. The bytes written matches the number of remaining bytes in the current file. 

If the current file is sparse and w is an io.WriteSeeker, then writeTo uses Seek to skip past holes defined in Header.SparseHoles, assuming that skipped regions are filled with NULs. This always writes the last byte to ensure w is the right size. 

TODO(dsnet): Re-export this when adding sparse file support. See [https://golang.org/issue/22735](https://golang.org/issue/22735) 

### <a id="fileReader" href="#fileReader">type fileReader interface</a>

```
searchKey: tar.fileReader
```

```Go
type fileReader interface {
	io.Reader
	fileState

	WriteTo(io.Writer) (int64, error)
}
```

### <a id="regFileReader" href="#regFileReader">type regFileReader struct</a>

```
searchKey: tar.regFileReader
```

```Go
type regFileReader struct {
	r  io.Reader // Underlying Reader
	nb int64     // Number of remaining bytes to read
}
```

regFileReader is a fileReader for reading data from a regular file entry. 

#### <a id="regFileReader.Read" href="#regFileReader.Read">func (fr *regFileReader) Read(b []byte) (n int, err error)</a>

```
searchKey: tar.regFileReader.Read
```

```Go
func (fr *regFileReader) Read(b []byte) (n int, err error)
```

#### <a id="regFileReader.WriteTo" href="#regFileReader.WriteTo">func (fr *regFileReader) WriteTo(w io.Writer) (int64, error)</a>

```
searchKey: tar.regFileReader.WriteTo
```

```Go
func (fr *regFileReader) WriteTo(w io.Writer) (int64, error)
```

#### <a id="regFileReader.LogicalRemaining" href="#regFileReader.LogicalRemaining">func (fr regFileReader) LogicalRemaining() int64</a>

```
searchKey: tar.regFileReader.LogicalRemaining
```

```Go
func (fr regFileReader) LogicalRemaining() int64
```

#### <a id="regFileReader.PhysicalRemaining" href="#regFileReader.PhysicalRemaining">func (fr regFileReader) PhysicalRemaining() int64</a>

```
searchKey: tar.regFileReader.PhysicalRemaining
```

```Go
func (fr regFileReader) PhysicalRemaining() int64
```

### <a id="sparseFileReader" href="#sparseFileReader">type sparseFileReader struct</a>

```
searchKey: tar.sparseFileReader
```

```Go
type sparseFileReader struct {
	fr  fileReader  // Underlying fileReader
	sp  sparseHoles // Normalized list of sparse holes
	pos int64       // Current position in sparse file
}
```

sparseFileReader is a fileReader for reading data from a sparse file entry. 

#### <a id="sparseFileReader.Read" href="#sparseFileReader.Read">func (sr *sparseFileReader) Read(b []byte) (n int, err error)</a>

```
searchKey: tar.sparseFileReader.Read
```

```Go
func (sr *sparseFileReader) Read(b []byte) (n int, err error)
```

#### <a id="sparseFileReader.WriteTo" href="#sparseFileReader.WriteTo">func (sr *sparseFileReader) WriteTo(w io.Writer) (n int64, err error)</a>

```
searchKey: tar.sparseFileReader.WriteTo
```

```Go
func (sr *sparseFileReader) WriteTo(w io.Writer) (n int64, err error)
```

#### <a id="sparseFileReader.LogicalRemaining" href="#sparseFileReader.LogicalRemaining">func (sr sparseFileReader) LogicalRemaining() int64</a>

```
searchKey: tar.sparseFileReader.LogicalRemaining
```

```Go
func (sr sparseFileReader) LogicalRemaining() int64
```

#### <a id="sparseFileReader.PhysicalRemaining" href="#sparseFileReader.PhysicalRemaining">func (sr sparseFileReader) PhysicalRemaining() int64</a>

```
searchKey: tar.sparseFileReader.PhysicalRemaining
```

```Go
func (sr sparseFileReader) PhysicalRemaining() int64
```

### <a id="zeroReader" href="#zeroReader">type zeroReader struct{}</a>

```
searchKey: tar.zeroReader
```

```Go
type zeroReader struct{}
```

#### <a id="zeroReader.Read" href="#zeroReader.Read">func (zeroReader) Read(b []byte) (int, error)</a>

```
searchKey: tar.zeroReader.Read
```

```Go
func (zeroReader) Read(b []byte) (int, error)
```

### <a id="parser" href="#parser">type parser struct</a>

```
searchKey: tar.parser
```

```Go
type parser struct {
	err error // Last error seen
}
```

#### <a id="parser.parseString" href="#parser.parseString">func (*parser) parseString(b []byte) string</a>

```
searchKey: tar.parser.parseString
```

```Go
func (*parser) parseString(b []byte) string
```

parseString parses bytes as a NUL-terminated C-style string. If a NUL byte is not found then the whole slice is returned as a string. 

#### <a id="parser.parseNumeric" href="#parser.parseNumeric">func (p *parser) parseNumeric(b []byte) int64</a>

```
searchKey: tar.parser.parseNumeric
```

```Go
func (p *parser) parseNumeric(b []byte) int64
```

parseNumeric parses the input as being encoded in either base-256 or octal. This function may return negative numbers. If parsing fails or an integer overflow occurs, err will be set. 

#### <a id="parser.parseOctal" href="#parser.parseOctal">func (p *parser) parseOctal(b []byte) int64</a>

```
searchKey: tar.parser.parseOctal
```

```Go
func (p *parser) parseOctal(b []byte) int64
```

### <a id="formatter" href="#formatter">type formatter struct</a>

```
searchKey: tar.formatter
```

```Go
type formatter struct {
	err error // Last error seen
}
```

#### <a id="formatter.formatString" href="#formatter.formatString">func (f *formatter) formatString(b []byte, s string)</a>

```
searchKey: tar.formatter.formatString
```

```Go
func (f *formatter) formatString(b []byte, s string)
```

formatString copies s into b, NUL-terminating if possible. 

#### <a id="formatter.formatNumeric" href="#formatter.formatNumeric">func (f *formatter) formatNumeric(b []byte, x int64)</a>

```
searchKey: tar.formatter.formatNumeric
```

```Go
func (f *formatter) formatNumeric(b []byte, x int64)
```

formatNumeric encodes x into b using base-8 (octal) encoding if possible. Otherwise it will attempt to use base-256 (binary) encoding. 

#### <a id="formatter.formatOctal" href="#formatter.formatOctal">func (f *formatter) formatOctal(b []byte, x int64)</a>

```
searchKey: tar.formatter.formatOctal
```

```Go
func (f *formatter) formatOctal(b []byte, x int64)
```

### <a id="Writer" href="#Writer">type Writer struct</a>

```
searchKey: tar.Writer
tags: [exported]
```

```Go
type Writer struct {
	w    io.Writer
	pad  int64      // Amount of padding to write after current file entry
	curr fileWriter // Writer for current file entry
	hdr  Header     // Shallow copy of Header that is safe for mutations
	blk  block      // Buffer to use as temporary local storage

	// err is a persistent error.
	// It is only the responsibility of every exported method of Writer to
	// ensure that this error is sticky.
	err error
}
```

Writer provides sequential writing of a tar archive. Write.WriteHeader begins a new file with the provided Header, and then Writer can be treated as an io.Writer to supply that file's data. 

#### <a id="NewWriter" href="#NewWriter">func NewWriter(w io.Writer) *Writer</a>

```
searchKey: tar.NewWriter
tags: [exported]
```

```Go
func NewWriter(w io.Writer) *Writer
```

NewWriter creates a new Writer writing to w. 

#### <a id="Writer.Flush" href="#Writer.Flush">func (tw *Writer) Flush() error</a>

```
searchKey: tar.Writer.Flush
tags: [exported]
```

```Go
func (tw *Writer) Flush() error
```

Flush finishes writing the current file's block padding. The current file must be fully written before Flush can be called. 

This is unnecessary as the next call to WriteHeader or Close will implicitly flush out the file's padding. 

#### <a id="Writer.WriteHeader" href="#Writer.WriteHeader">func (tw *Writer) WriteHeader(hdr *Header) error</a>

```
searchKey: tar.Writer.WriteHeader
tags: [exported]
```

```Go
func (tw *Writer) WriteHeader(hdr *Header) error
```

WriteHeader writes hdr and prepares to accept the file's contents. The Header.Size determines how many bytes can be written for the next file. If the current file is not fully written, then this returns an error. This implicitly flushes any padding necessary before writing the header. 

#### <a id="Writer.writeUSTARHeader" href="#Writer.writeUSTARHeader">func (tw *Writer) writeUSTARHeader(hdr *Header) error</a>

```
searchKey: tar.Writer.writeUSTARHeader
```

```Go
func (tw *Writer) writeUSTARHeader(hdr *Header) error
```

#### <a id="Writer.writePAXHeader" href="#Writer.writePAXHeader">func (tw *Writer) writePAXHeader(hdr *Header, paxHdrs map[string]string) error</a>

```
searchKey: tar.Writer.writePAXHeader
```

```Go
func (tw *Writer) writePAXHeader(hdr *Header, paxHdrs map[string]string) error
```

#### <a id="Writer.writeGNUHeader" href="#Writer.writeGNUHeader">func (tw *Writer) writeGNUHeader(hdr *Header) error</a>

```
searchKey: tar.Writer.writeGNUHeader
```

```Go
func (tw *Writer) writeGNUHeader(hdr *Header) error
```

#### <a id="Writer.templateV7Plus" href="#Writer.templateV7Plus">func (tw *Writer) templateV7Plus(hdr *Header, fmtStr stringFormatter, fmtNum numberFormatter) *block</a>

```
searchKey: tar.Writer.templateV7Plus
```

```Go
func (tw *Writer) templateV7Plus(hdr *Header, fmtStr stringFormatter, fmtNum numberFormatter) *block
```

templateV7Plus fills out the V7 fields of a block using values from hdr. It also fills out fields (uname, gname, devmajor, devminor) that are shared in the USTAR, PAX, and GNU formats using the provided formatters. 

The block returned is only valid until the next call to templateV7Plus or writeRawFile. 

#### <a id="Writer.writeRawFile" href="#Writer.writeRawFile">func (tw *Writer) writeRawFile(name, data string, flag byte, format Format) error</a>

```
searchKey: tar.Writer.writeRawFile
```

```Go
func (tw *Writer) writeRawFile(name, data string, flag byte, format Format) error
```

writeRawFile writes a minimal file with the given name and flag type. It uses format to encode the header format and will write data as the body. It uses default values for all of the other fields (as BSD and GNU tar does). 

#### <a id="Writer.writeRawHeader" href="#Writer.writeRawHeader">func (tw *Writer) writeRawHeader(blk *block, size int64, flag byte) error</a>

```
searchKey: tar.Writer.writeRawHeader
```

```Go
func (tw *Writer) writeRawHeader(blk *block, size int64, flag byte) error
```

writeRawHeader writes the value of blk, regardless of its value. It sets up the Writer such that it can accept a file of the given size. If the flag is a special header-only flag, then the size is treated as zero. 

#### <a id="Writer.Write" href="#Writer.Write">func (tw *Writer) Write(b []byte) (int, error)</a>

```
searchKey: tar.Writer.Write
tags: [exported]
```

```Go
func (tw *Writer) Write(b []byte) (int, error)
```

Write writes to the current file in the tar archive. Write returns the error ErrWriteTooLong if more than Header.Size bytes are written after WriteHeader. 

Calling Write on special types like TypeLink, TypeSymlink, TypeChar, TypeBlock, TypeDir, and TypeFifo returns (0, ErrWriteTooLong) regardless of what the Header.Size claims. 

#### <a id="Writer.readFrom" href="#Writer.readFrom">func (tw *Writer) readFrom(r io.Reader) (int64, error)</a>

```
searchKey: tar.Writer.readFrom
```

```Go
func (tw *Writer) readFrom(r io.Reader) (int64, error)
```

readFrom populates the content of the current file by reading from r. The bytes read must match the number of remaining bytes in the current file. 

If the current file is sparse and r is an io.ReadSeeker, then readFrom uses Seek to skip past holes defined in Header.SparseHoles, assuming that skipped regions are all NULs. This always reads the last byte to ensure r is the right size. 

TODO(dsnet): Re-export this when adding sparse file support. See [https://golang.org/issue/22735](https://golang.org/issue/22735) 

#### <a id="Writer.Close" href="#Writer.Close">func (tw *Writer) Close() error</a>

```
searchKey: tar.Writer.Close
tags: [exported]
```

```Go
func (tw *Writer) Close() error
```

Close closes the tar archive by flushing the padding, and writing the footer. If the current file (from a prior call to WriteHeader) is not fully written, then this returns an error. 

### <a id="fileWriter" href="#fileWriter">type fileWriter interface</a>

```
searchKey: tar.fileWriter
```

```Go
type fileWriter interface {
	io.Writer
	fileState

	ReadFrom(io.Reader) (int64, error)
}
```

### <a id="stringFormatter" href="#stringFormatter">type stringFormatter func([]byte, string)</a>

```
searchKey: tar.stringFormatter
```

```Go
type stringFormatter func([]byte, string)
```

### <a id="numberFormatter" href="#numberFormatter">type numberFormatter func([]byte, int64)</a>

```
searchKey: tar.numberFormatter
```

```Go
type numberFormatter func([]byte, int64)
```

### <a id="regFileWriter" href="#regFileWriter">type regFileWriter struct</a>

```
searchKey: tar.regFileWriter
```

```Go
type regFileWriter struct {
	w  io.Writer // Underlying Writer
	nb int64     // Number of remaining bytes to write
}
```

regFileWriter is a fileWriter for writing data to a regular file entry. 

#### <a id="regFileWriter.Write" href="#regFileWriter.Write">func (fw *regFileWriter) Write(b []byte) (n int, err error)</a>

```
searchKey: tar.regFileWriter.Write
```

```Go
func (fw *regFileWriter) Write(b []byte) (n int, err error)
```

#### <a id="regFileWriter.ReadFrom" href="#regFileWriter.ReadFrom">func (fw *regFileWriter) ReadFrom(r io.Reader) (int64, error)</a>

```
searchKey: tar.regFileWriter.ReadFrom
```

```Go
func (fw *regFileWriter) ReadFrom(r io.Reader) (int64, error)
```

#### <a id="regFileWriter.LogicalRemaining" href="#regFileWriter.LogicalRemaining">func (fw regFileWriter) LogicalRemaining() int64</a>

```
searchKey: tar.regFileWriter.LogicalRemaining
```

```Go
func (fw regFileWriter) LogicalRemaining() int64
```

#### <a id="regFileWriter.PhysicalRemaining" href="#regFileWriter.PhysicalRemaining">func (fw regFileWriter) PhysicalRemaining() int64</a>

```
searchKey: tar.regFileWriter.PhysicalRemaining
```

```Go
func (fw regFileWriter) PhysicalRemaining() int64
```

### <a id="sparseFileWriter" href="#sparseFileWriter">type sparseFileWriter struct</a>

```
searchKey: tar.sparseFileWriter
```

```Go
type sparseFileWriter struct {
	fw  fileWriter  // Underlying fileWriter
	sp  sparseDatas // Normalized list of data fragments
	pos int64       // Current position in sparse file
}
```

sparseFileWriter is a fileWriter for writing data to a sparse file entry. 

#### <a id="sparseFileWriter.Write" href="#sparseFileWriter.Write">func (sw *sparseFileWriter) Write(b []byte) (n int, err error)</a>

```
searchKey: tar.sparseFileWriter.Write
```

```Go
func (sw *sparseFileWriter) Write(b []byte) (n int, err error)
```

#### <a id="sparseFileWriter.ReadFrom" href="#sparseFileWriter.ReadFrom">func (sw *sparseFileWriter) ReadFrom(r io.Reader) (n int64, err error)</a>

```
searchKey: tar.sparseFileWriter.ReadFrom
```

```Go
func (sw *sparseFileWriter) ReadFrom(r io.Reader) (n int64, err error)
```

#### <a id="sparseFileWriter.LogicalRemaining" href="#sparseFileWriter.LogicalRemaining">func (sw sparseFileWriter) LogicalRemaining() int64</a>

```
searchKey: tar.sparseFileWriter.LogicalRemaining
```

```Go
func (sw sparseFileWriter) LogicalRemaining() int64
```

#### <a id="sparseFileWriter.PhysicalRemaining" href="#sparseFileWriter.PhysicalRemaining">func (sw sparseFileWriter) PhysicalRemaining() int64</a>

```
searchKey: tar.sparseFileWriter.PhysicalRemaining
```

```Go
func (sw sparseFileWriter) PhysicalRemaining() int64
```

### <a id="zeroWriter" href="#zeroWriter">type zeroWriter struct{}</a>

```
searchKey: tar.zeroWriter
```

```Go
type zeroWriter struct{}
```

zeroWriter may only be written with NULs, otherwise it returns errWriteHole. 

#### <a id="zeroWriter.Write" href="#zeroWriter.Write">func (zeroWriter) Write(b []byte) (int, error)</a>

```
searchKey: tar.zeroWriter.Write
```

```Go
func (zeroWriter) Write(b []byte) (int, error)
```

### <a id="reader" href="#reader">type reader struct</a>

```
searchKey: tar.reader
```

```Go
type reader struct{ io.Reader }
```

### <a id="readSeeker" href="#readSeeker">type readSeeker struct</a>

```
searchKey: tar.readSeeker
```

```Go
type readSeeker struct{ io.ReadSeeker }
```

### <a id="readBadSeeker" href="#readBadSeeker">type readBadSeeker struct</a>

```
searchKey: tar.readBadSeeker
```

```Go
type readBadSeeker struct{ io.ReadSeeker }
```

#### <a id="readBadSeeker.Seek" href="#readBadSeeker.Seek">func (rbs *readBadSeeker) Seek(int64, int) (int64, error)</a>

```
searchKey: tar.readBadSeeker.Seek
```

```Go
func (rbs *readBadSeeker) Seek(int64, int) (int64, error)
```

### <a id="testNonEmptyReader" href="#testNonEmptyReader">type testNonEmptyReader struct</a>

```
searchKey: tar.testNonEmptyReader
```

```Go
type testNonEmptyReader struct{ io.Reader }
```

testNonEmptyReader wraps an io.Reader and ensures that Read is never called with an empty buffer. 

#### <a id="testNonEmptyReader.Read" href="#testNonEmptyReader.Read">func (r testNonEmptyReader) Read(b []byte) (int, error)</a>

```
searchKey: tar.testNonEmptyReader.Read
```

```Go
func (r testNonEmptyReader) Read(b []byte) (int, error)
```

### <a id="testError" href="#testError">type testError struct</a>

```
searchKey: tar.testError
```

```Go
type testError struct{ error }
```

### <a id="fileOps" href="#fileOps">type fileOps []interface{}</a>

```
searchKey: tar.fileOps
```

```Go
type fileOps []interface{} // []T where T is (string | int64)

```

### <a id="testFile" href="#testFile">type testFile struct</a>

```
searchKey: tar.testFile
```

```Go
type testFile struct {
	ops fileOps
	pos int64
}
```

testFile is an io.ReadWriteSeeker where the IO operations performed on it must match the list of operations in ops. 

#### <a id="testFile.Read" href="#testFile.Read">func (f *testFile) Read(b []byte) (int, error)</a>

```
searchKey: tar.testFile.Read
```

```Go
func (f *testFile) Read(b []byte) (int, error)
```

#### <a id="testFile.Write" href="#testFile.Write">func (f *testFile) Write(b []byte) (int, error)</a>

```
searchKey: tar.testFile.Write
```

```Go
func (f *testFile) Write(b []byte) (int, error)
```

#### <a id="testFile.Seek" href="#testFile.Seek">func (f *testFile) Seek(pos int64, whence int) (int64, error)</a>

```
searchKey: tar.testFile.Seek
```

```Go
func (f *testFile) Seek(pos int64, whence int) (int64, error)
```

### <a id="headerRoundTripTest" href="#headerRoundTripTest">type headerRoundTripTest struct</a>

```
searchKey: tar.headerRoundTripTest
```

```Go
type headerRoundTripTest struct {
	h  *Header
	fm fs.FileMode
}
```

### <a id="failOnceWriter" href="#failOnceWriter">type failOnceWriter bool</a>

```
searchKey: tar.failOnceWriter
```

```Go
type failOnceWriter bool
```

failOnceWriter fails exactly once and then always reports success. 

#### <a id="failOnceWriter.Write" href="#failOnceWriter.Write">func (w *failOnceWriter) Write(b []byte) (int, error)</a>

```
searchKey: tar.failOnceWriter.Write
```

```Go
func (w *failOnceWriter) Write(b []byte) (int, error)
```

### <a id="testNonEmptyWriter" href="#testNonEmptyWriter">type testNonEmptyWriter struct</a>

```
searchKey: tar.testNonEmptyWriter
```

```Go
type testNonEmptyWriter struct{ io.Writer }
```

testNonEmptyWriter wraps an io.Writer and ensures that Write is never called with an empty buffer. 

#### <a id="testNonEmptyWriter.Write" href="#testNonEmptyWriter.Write">func (w testNonEmptyWriter) Write(b []byte) (int, error)</a>

```
searchKey: tar.testNonEmptyWriter.Write
```

```Go
func (w testNonEmptyWriter) Write(b []byte) (int, error)
```

## <a id="func" href="#func">Functions</a>

```
tags: [exported]
```

### <a id="validateSparseEntries" href="#validateSparseEntries">func validateSparseEntries(sp []sparseEntry, size int64) bool</a>

```
searchKey: tar.validateSparseEntries
```

```Go
func validateSparseEntries(sp []sparseEntry, size int64) bool
```

validateSparseEntries reports whether sp is a valid sparse map. It does not matter whether sp represents data fragments or hole fragments. 

### <a id="alignSparseEntries" href="#alignSparseEntries">func alignSparseEntries(src []sparseEntry, size int64) []sparseEntry</a>

```
searchKey: tar.alignSparseEntries
```

```Go
func alignSparseEntries(src []sparseEntry, size int64) []sparseEntry
```

alignSparseEntries mutates src and returns dst where each fragment's starting offset is aligned up to the nearest block edge, and each ending offset is aligned down to the nearest block edge. 

Even though the Go tar Reader and the BSD tar utility can handle entries with arbitrary offsets and lengths, the GNU tar utility can only handle offsets and lengths that are multiples of blockSize. 

### <a id="invertSparseEntries" href="#invertSparseEntries">func invertSparseEntries(src []sparseEntry, size int64) []sparseEntry</a>

```
searchKey: tar.invertSparseEntries
```

```Go
func invertSparseEntries(src []sparseEntry, size int64) []sparseEntry
```

invertSparseEntries converts a sparse map from one form to the other. If the input is sparseHoles, then it will output sparseDatas and vice-versa. The input must have been already validated. 

This function mutates src and returns a normalized map where: 

```
* adjacent fragments are coalesced together
* only the last fragment may be empty
* the endOffset of the last fragment is the total size

```
### <a id="isHeaderOnlyType" href="#isHeaderOnlyType">func isHeaderOnlyType(flag byte) bool</a>

```
searchKey: tar.isHeaderOnlyType
```

```Go
func isHeaderOnlyType(flag byte) bool
```

isHeaderOnlyType checks if the given type flag is of the type that has no data section even if a size is specified. 

### <a id="min" href="#min">func min(a, b int64) int64</a>

```
searchKey: tar.min
```

```Go
func min(a, b int64) int64
```

### <a id="blockPadding" href="#blockPadding">func blockPadding(offset int64) (n int64)</a>

```
searchKey: tar.blockPadding
```

```Go
func blockPadding(offset int64) (n int64)
```

blockPadding computes the number of bytes needed to pad offset up to the nearest block edge where 0 <= n < blockSize. 

### <a id="mergePAX" href="#mergePAX">func mergePAX(hdr *Header, paxHdrs map[string]string) (err error)</a>

```
searchKey: tar.mergePAX
```

```Go
func mergePAX(hdr *Header, paxHdrs map[string]string) (err error)
```

mergePAX merges paxHdrs into hdr for all relevant fields of Header. 

### <a id="parsePAX" href="#parsePAX">func parsePAX(r io.Reader) (map[string]string, error)</a>

```
searchKey: tar.parsePAX
```

```Go
func parsePAX(r io.Reader) (map[string]string, error)
```

parsePAX parses PAX headers. If an extended header (type 'x') is invalid, ErrHeader is returned 

### <a id="mustReadFull" href="#mustReadFull">func mustReadFull(r io.Reader, b []byte) (int, error)</a>

```
searchKey: tar.mustReadFull
```

```Go
func mustReadFull(r io.Reader, b []byte) (int, error)
```

mustReadFull is like io.ReadFull except it returns io.ErrUnexpectedEOF when io.EOF is hit before len(b) bytes are read. 

### <a id="tryReadFull" href="#tryReadFull">func tryReadFull(r io.Reader, b []byte) (n int, err error)</a>

```
searchKey: tar.tryReadFull
```

```Go
func tryReadFull(r io.Reader, b []byte) (n int, err error)
```

tryReadFull is like io.ReadFull except it returns io.EOF when it is hit before len(b) bytes are read. 

### <a id="discard" href="#discard">func discard(r io.Reader, n int64) error</a>

```
searchKey: tar.discard
```

```Go
func discard(r io.Reader, n int64) error
```

discard skips n bytes in r, reporting an error if unable to do so. 

### <a id="statAtime" href="#statAtime">func statAtime(st *syscall.Stat_t) time.Time</a>

```
searchKey: tar.statAtime
```

```Go
func statAtime(st *syscall.Stat_t) time.Time
```

### <a id="statCtime" href="#statCtime">func statCtime(st *syscall.Stat_t) time.Time</a>

```
searchKey: tar.statCtime
```

```Go
func statCtime(st *syscall.Stat_t) time.Time
```

### <a id="init" href="#init">func init()</a>

```
searchKey: tar.init
```

```Go
func init()
```

### <a id="statUnix" href="#statUnix">func statUnix(fi fs.FileInfo, h *Header) error</a>

```
searchKey: tar.statUnix
```

```Go
func statUnix(fi fs.FileInfo, h *Header) error
```

### <a id="hasNUL" href="#hasNUL">func hasNUL(s string) bool</a>

```
searchKey: tar.hasNUL
```

```Go
func hasNUL(s string) bool
```

hasNUL reports whether the NUL character exists within s. 

### <a id="isASCII" href="#isASCII">func isASCII(s string) bool</a>

```
searchKey: tar.isASCII
```

```Go
func isASCII(s string) bool
```

isASCII reports whether the input is an ASCII C-style string. 

### <a id="toASCII" href="#toASCII">func toASCII(s string) string</a>

```
searchKey: tar.toASCII
```

```Go
func toASCII(s string) string
```

toASCII converts the input to an ASCII C-style string. This is a best effort conversion, so invalid characters are dropped. 

### <a id="fitsInBase256" href="#fitsInBase256">func fitsInBase256(n int, x int64) bool</a>

```
searchKey: tar.fitsInBase256
```

```Go
func fitsInBase256(n int, x int64) bool
```

fitsInBase256 reports whether x can be encoded into n bytes using base-256 encoding. Unlike octal encoding, base-256 encoding does not require that the string ends with a NUL character. Thus, all n bytes are available for output. 

If operating in binary mode, this assumes strict GNU binary mode; which means that the first byte can only be either 0x80 or 0xff. Thus, the first byte is equivalent to the sign bit in two's complement form. 

### <a id="fitsInOctal" href="#fitsInOctal">func fitsInOctal(n int, x int64) bool</a>

```
searchKey: tar.fitsInOctal
```

```Go
func fitsInOctal(n int, x int64) bool
```

fitsInOctal reports whether the integer x fits in a field n-bytes long using octal encoding with the appropriate NUL terminator. 

### <a id="parsePAXTime" href="#parsePAXTime">func parsePAXTime(s string) (time.Time, error)</a>

```
searchKey: tar.parsePAXTime
```

```Go
func parsePAXTime(s string) (time.Time, error)
```

parsePAXTime takes a string of the form %d.%d as described in the PAX specification. Note that this implementation allows for negative timestamps, which is allowed for by the PAX specification, but not always portable. 

### <a id="formatPAXTime" href="#formatPAXTime">func formatPAXTime(ts time.Time) (s string)</a>

```
searchKey: tar.formatPAXTime
```

```Go
func formatPAXTime(ts time.Time) (s string)
```

formatPAXTime converts ts into a time of the form %d.%d as described in the PAX specification. This function is capable of negative timestamps. 

### <a id="parsePAXRecord" href="#parsePAXRecord">func parsePAXRecord(s string) (k, v, r string, err error)</a>

```
searchKey: tar.parsePAXRecord
```

```Go
func parsePAXRecord(s string) (k, v, r string, err error)
```

parsePAXRecord parses the input PAX record string into a key-value pair. If parsing is successful, it will slice off the currently read record and return the remainder as r. 

### <a id="formatPAXRecord" href="#formatPAXRecord">func formatPAXRecord(k, v string) (string, error)</a>

```
searchKey: tar.formatPAXRecord
```

```Go
func formatPAXRecord(k, v string) (string, error)
```

formatPAXRecord formats a single PAX record, prefixing it with the appropriate length. 

### <a id="validPAXRecord" href="#validPAXRecord">func validPAXRecord(k, v string) bool</a>

```
searchKey: tar.validPAXRecord
```

```Go
func validPAXRecord(k, v string) bool
```

validPAXRecord reports whether the key-value pair is valid where each record is formatted as: 

```
"%d %s=%s\n" % (size, key, value)

```
Keys and values should be UTF-8, but the number of bad writers out there forces us to be a more liberal. Thus, we only reject all keys with NUL, and only reject NULs in values for the PAX version of the USTAR string fields. The key must not contain an '=' character. 

### <a id="splitUSTARPath" href="#splitUSTARPath">func splitUSTARPath(name string) (prefix, suffix string, ok bool)</a>

```
searchKey: tar.splitUSTARPath
```

```Go
func splitUSTARPath(name string) (prefix, suffix string, ok bool)
```

splitUSTARPath splits a path according to USTAR prefix and suffix rules. If the path is not splittable, then it will return ("", "", false). 

### <a id="ensureEOF" href="#ensureEOF">func ensureEOF(r io.Reader) error</a>

```
searchKey: tar.ensureEOF
```

```Go
func ensureEOF(r io.Reader) error
```

ensureEOF checks whether r is at EOF, reporting ErrWriteTooLong if not so. 

### <a id="TestReader" href="#TestReader">func TestReader(t *testing.T)</a>

```
searchKey: tar.TestReader
```

```Go
func TestReader(t *testing.T)
```

### <a id="TestPartialRead" href="#TestPartialRead">func TestPartialRead(t *testing.T)</a>

```
searchKey: tar.TestPartialRead
```

```Go
func TestPartialRead(t *testing.T)
```

### <a id="TestUninitializedRead" href="#TestUninitializedRead">func TestUninitializedRead(t *testing.T)</a>

```
searchKey: tar.TestUninitializedRead
```

```Go
func TestUninitializedRead(t *testing.T)
```

### <a id="TestReadTruncation" href="#TestReadTruncation">func TestReadTruncation(t *testing.T)</a>

```
searchKey: tar.TestReadTruncation
```

```Go
func TestReadTruncation(t *testing.T)
```

TestReadTruncation test the ending condition on various truncated files and that truncated files are still detected even if the underlying io.Reader satisfies io.Seeker. 

### <a id="TestReadHeaderOnly" href="#TestReadHeaderOnly">func TestReadHeaderOnly(t *testing.T)</a>

```
searchKey: tar.TestReadHeaderOnly
```

```Go
func TestReadHeaderOnly(t *testing.T)
```

TestReadHeaderOnly tests that Reader does not attempt to read special header-only files. 

### <a id="TestMergePAX" href="#TestMergePAX">func TestMergePAX(t *testing.T)</a>

```
searchKey: tar.TestMergePAX
```

```Go
func TestMergePAX(t *testing.T)
```

### <a id="TestParsePAX" href="#TestParsePAX">func TestParsePAX(t *testing.T)</a>

```
searchKey: tar.TestParsePAX
```

```Go
func TestParsePAX(t *testing.T)
```

### <a id="TestReadOldGNUSparseMap" href="#TestReadOldGNUSparseMap">func TestReadOldGNUSparseMap(t *testing.T)</a>

```
searchKey: tar.TestReadOldGNUSparseMap
```

```Go
func TestReadOldGNUSparseMap(t *testing.T)
```

### <a id="TestReadGNUSparsePAXHeaders" href="#TestReadGNUSparsePAXHeaders">func TestReadGNUSparsePAXHeaders(t *testing.T)</a>

```
searchKey: tar.TestReadGNUSparsePAXHeaders
```

```Go
func TestReadGNUSparsePAXHeaders(t *testing.T)
```

### <a id="TestFileReader" href="#TestFileReader">func TestFileReader(t *testing.T)</a>

```
searchKey: tar.TestFileReader
```

```Go
func TestFileReader(t *testing.T)
```

### <a id="TestFitsInBase256" href="#TestFitsInBase256">func TestFitsInBase256(t *testing.T)</a>

```
searchKey: tar.TestFitsInBase256
```

```Go
func TestFitsInBase256(t *testing.T)
```

### <a id="TestParseNumeric" href="#TestParseNumeric">func TestParseNumeric(t *testing.T)</a>

```
searchKey: tar.TestParseNumeric
```

```Go
func TestParseNumeric(t *testing.T)
```

### <a id="TestFormatNumeric" href="#TestFormatNumeric">func TestFormatNumeric(t *testing.T)</a>

```
searchKey: tar.TestFormatNumeric
```

```Go
func TestFormatNumeric(t *testing.T)
```

### <a id="TestFitsInOctal" href="#TestFitsInOctal">func TestFitsInOctal(t *testing.T)</a>

```
searchKey: tar.TestFitsInOctal
```

```Go
func TestFitsInOctal(t *testing.T)
```

### <a id="TestParsePAXTime" href="#TestParsePAXTime">func TestParsePAXTime(t *testing.T)</a>

```
searchKey: tar.TestParsePAXTime
```

```Go
func TestParsePAXTime(t *testing.T)
```

### <a id="TestFormatPAXTime" href="#TestFormatPAXTime">func TestFormatPAXTime(t *testing.T)</a>

```
searchKey: tar.TestFormatPAXTime
```

```Go
func TestFormatPAXTime(t *testing.T)
```

### <a id="TestParsePAXRecord" href="#TestParsePAXRecord">func TestParsePAXRecord(t *testing.T)</a>

```
searchKey: tar.TestParsePAXRecord
```

```Go
func TestParsePAXRecord(t *testing.T)
```

### <a id="TestFormatPAXRecord" href="#TestFormatPAXRecord">func TestFormatPAXRecord(t *testing.T)</a>

```
searchKey: tar.TestFormatPAXRecord
```

```Go
func TestFormatPAXRecord(t *testing.T)
```

### <a id="equalSparseEntries" href="#equalSparseEntries">func equalSparseEntries(x, y []sparseEntry) bool</a>

```
searchKey: tar.equalSparseEntries
```

```Go
func equalSparseEntries(x, y []sparseEntry) bool
```

### <a id="TestSparseEntries" href="#TestSparseEntries">func TestSparseEntries(t *testing.T)</a>

```
searchKey: tar.TestSparseEntries
```

```Go
func TestSparseEntries(t *testing.T)
```

### <a id="TestFileInfoHeader" href="#TestFileInfoHeader">func TestFileInfoHeader(t *testing.T)</a>

```
searchKey: tar.TestFileInfoHeader
```

```Go
func TestFileInfoHeader(t *testing.T)
```

### <a id="TestFileInfoHeaderDir" href="#TestFileInfoHeaderDir">func TestFileInfoHeaderDir(t *testing.T)</a>

```
searchKey: tar.TestFileInfoHeaderDir
```

```Go
func TestFileInfoHeaderDir(t *testing.T)
```

### <a id="TestFileInfoHeaderSymlink" href="#TestFileInfoHeaderSymlink">func TestFileInfoHeaderSymlink(t *testing.T)</a>

```
searchKey: tar.TestFileInfoHeaderSymlink
```

```Go
func TestFileInfoHeaderSymlink(t *testing.T)
```

### <a id="TestRoundTrip" href="#TestRoundTrip">func TestRoundTrip(t *testing.T)</a>

```
searchKey: tar.TestRoundTrip
```

```Go
func TestRoundTrip(t *testing.T)
```

### <a id="TestHeaderRoundTrip" href="#TestHeaderRoundTrip">func TestHeaderRoundTrip(t *testing.T)</a>

```
searchKey: tar.TestHeaderRoundTrip
```

```Go
func TestHeaderRoundTrip(t *testing.T)
```

### <a id="TestHeaderAllowedFormats" href="#TestHeaderAllowedFormats">func TestHeaderAllowedFormats(t *testing.T)</a>

```
searchKey: tar.TestHeaderAllowedFormats
```

```Go
func TestHeaderAllowedFormats(t *testing.T)
```

### <a id="Benchmark" href="#Benchmark">func Benchmark(b *testing.B)</a>

```
searchKey: tar.Benchmark
```

```Go
func Benchmark(b *testing.B)
```

### <a id="bytediff" href="#bytediff">func bytediff(a, b []byte) string</a>

```
searchKey: tar.bytediff
```

```Go
func bytediff(a, b []byte) string
```

### <a id="TestWriter" href="#TestWriter">func TestWriter(t *testing.T)</a>

```
searchKey: tar.TestWriter
```

```Go
func TestWriter(t *testing.T)
```

### <a id="TestPax" href="#TestPax">func TestPax(t *testing.T)</a>

```
searchKey: tar.TestPax
```

```Go
func TestPax(t *testing.T)
```

### <a id="TestPaxSymlink" href="#TestPaxSymlink">func TestPaxSymlink(t *testing.T)</a>

```
searchKey: tar.TestPaxSymlink
```

```Go
func TestPaxSymlink(t *testing.T)
```

### <a id="TestPaxNonAscii" href="#TestPaxNonAscii">func TestPaxNonAscii(t *testing.T)</a>

```
searchKey: tar.TestPaxNonAscii
```

```Go
func TestPaxNonAscii(t *testing.T)
```

### <a id="TestPaxXattrs" href="#TestPaxXattrs">func TestPaxXattrs(t *testing.T)</a>

```
searchKey: tar.TestPaxXattrs
```

```Go
func TestPaxXattrs(t *testing.T)
```

### <a id="TestPaxHeadersSorted" href="#TestPaxHeadersSorted">func TestPaxHeadersSorted(t *testing.T)</a>

```
searchKey: tar.TestPaxHeadersSorted
```

```Go
func TestPaxHeadersSorted(t *testing.T)
```

### <a id="TestUSTARLongName" href="#TestUSTARLongName">func TestUSTARLongName(t *testing.T)</a>

```
searchKey: tar.TestUSTARLongName
```

```Go
func TestUSTARLongName(t *testing.T)
```

### <a id="TestValidTypeflagWithPAXHeader" href="#TestValidTypeflagWithPAXHeader">func TestValidTypeflagWithPAXHeader(t *testing.T)</a>

```
searchKey: tar.TestValidTypeflagWithPAXHeader
```

```Go
func TestValidTypeflagWithPAXHeader(t *testing.T)
```

### <a id="TestWriterErrors" href="#TestWriterErrors">func TestWriterErrors(t *testing.T)</a>

```
searchKey: tar.TestWriterErrors
```

```Go
func TestWriterErrors(t *testing.T)
```

### <a id="TestSplitUSTARPath" href="#TestSplitUSTARPath">func TestSplitUSTARPath(t *testing.T)</a>

```
searchKey: tar.TestSplitUSTARPath
```

```Go
func TestSplitUSTARPath(t *testing.T)
```

### <a id="TestIssue12594" href="#TestIssue12594">func TestIssue12594(t *testing.T)</a>

```
searchKey: tar.TestIssue12594
```

```Go
func TestIssue12594(t *testing.T)
```

TestIssue12594 tests that the Writer does not attempt to populate the prefix field when encoding a header in the GNU format. The prefix field is valid in USTAR and PAX, but not GNU. 

### <a id="TestFileWriter" href="#TestFileWriter">func TestFileWriter(t *testing.T)</a>

```
searchKey: tar.TestFileWriter
```

```Go
func TestFileWriter(t *testing.T)
```
